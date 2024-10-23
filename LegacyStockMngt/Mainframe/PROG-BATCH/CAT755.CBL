000001* PDX    - CAT755   C0348882 12/06/13 06:50:30 TBCHKOP            00001000
      * CSG001 SSR  91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.                 
000001* PDX    - CAT755   C0299269 07/26/10 14:16:05 TBLAMUR            00001000
      * LRM003 SSR 62889 CONTINUED.  FOR PARTIALLY CALLED BONDS,                
      *   USE THE BOND CALL DATE PLUS 3 DAYS FOR THE EXPIRATION.                
      *   CHANGE CONTRA CUSIP LOGIC TO USE OTHER ADP NBR FIELD                  
000001* PDX    - CAT755   C0295620 06/10/10 15:26:54 TBLAMUR            00001000
      * LRM002 SSR 62889 WITHHOLD MATURING OR CALLED BONDS; READ                
      * AND DELETE ACTIAST ROW CLIENT= W### TO DRIVE X SCREEN UPDATE.           
000001* PDX    - CAT755   C0295533 04/27/10 14:42:41 TBEDTAK            00001000
000001* ET0001 - SPEC CHANGE - READ CORRECT FILE BRE99B.REOANNDA        00001000
000001* ET0001 - NOT BRE20GPS.REOANNS2 TO GET CONTRA SECURITY.          00001000
000001* PDX    - CAT755   C0292693 03/12/10 11:56:20 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                         10/02/19
       PROGRAM-ID.   CAT755.                                            CAT755  
       DATE-COMPILED.                                                   CAT755  
      *                                                                 CAT755  
      ******************************************************************CAT755  
      *REMARKS.                                                         CAT755  
      *                                                                 CAT755  
      *    THIS PROGRAM SEARCHES CONTRA CUSIP FROM RECORD TYPE 2 OF     CAT755  
      *    REORG ANNOUNCEMENT FILE, AND ADDS TO "X" SCREEN DATABASE     CAT755  
      *    (VRSTSEC) ROWS TO SUPPRESS IT FROM BEING TRANSFERED OUT FOR  CAT755  
      *    A PERIOD OF 6 MONTHS.                                        CAT755  
      *                                                                 CAT755  
      ******************************************************************CAT755  
      *                                                                 CAT755  
       ENVIRONMENT DIVISION.                                            CAT755  
       INPUT-OUTPUT SECTION.                                            CAT755  
       FILE-CONTROL.                                                    CAT755  
           SELECT REORG-ANNS-FL    ASSIGN TO REORGFL.                   CAT755  
                                                                        CAT755  
       DATA DIVISION.                                                   CAT755  
       FILE SECTION.                                                    CAT755  
       FD  REORG-ANNS-FL                                                CAT755  
           RECORDING MODE IS F                                          CAT755  
           LABEL RECORDS ARE STANDARD                                   CAT755  
           BLOCK CONTAINS 0 RECORDS.                                    CAT755  
       01  REORG-ANNS-REC            PIC X(375).                        CAT755  
                                                                        CAT755  
       WORKING-STORAGE SECTION.                                         CAT755  
                                                                        CAT755  
           COPY PDXIDCOB.                                               CAT755  
                                                                        CAT755  
       77 ABEND-CODE                       PIC S9(04) COMP SYNC.        CAT755  
       77 DSNTIAR                          PIC X(08) VALUE 'DSNTIAR '.  CAT755  
                                                                        CAT755  
          COPY STUBCPY.                                                 CAT755  
                                                                        CAT755  
       01 WS-WORK-AREA.                                                 CAT755  
          03 WS-TIMESTAMP                  PIC X(26).                   CAT755  
          03 WS-DB2-SQLCODE                PIC ---9.                            
          03 WS-DATES.                                                  CAT755  
             05 WS-PROC-DATE.                                           CAT755  
                07 WS-PROC-CCYY            PIC 9(04).                   CAT755  
                07 WS-PROC-MM              PIC 9(02).                   CAT755  
                07 WS-PROC-DD              PIC 9(02).                   CAT755  
             05 WS-TODAY.                                               CAT755  
                07 WS-TODAY-CCYY           PIC X(04).                   CAT755  
                07 FILLER                  PIC X(01).                   CAT755  
                07 WS-TODAY-MM             PIC X(02).                   CAT755  
                07 WS-TODAY-MM-9   REDEFINES WS-TODAY-MM                CAT755  
                                           PIC 9(02).                   CAT755  
                07 FILLER                  PIC X(01).                   CAT755  
                07 WS-TODAY-DD             PIC X(02).                   CAT755  
                07 FILLER                  PIC X(16).                   CAT755  
             05 WS-EDIT-DATE.                                           CAT755  
                07 WS-EDIT-YEAR            PIC 9(04).                   CAT755  
                07 FILLER                  PIC X(01) VALUE '-'.         CAT755  
                07 WS-EDIT-MONTH           PIC 9(02).                   CAT755  
                07 FILLER                  PIC X(01) VALUE '-'.         CAT755  
                07 WS-EDIT-DAY             PIC 9(02).                   CAT755  
             05 WS-TODAY-PLUS-6MNTH        PIC X(10).                   CAT755  
             05 WS-RESTRICT-EXP-DT         PIC X(10).                   CAT755  
LRM003       05 WS-ASSET-CMNT-TXT          PIC X(50).                   CAT755  
LRM003       05 WS-BOND-PLUS5.                                                  
LRM003          07  WS-BOND-PLUS5-CCYY     PIC X(04).                           
LRM003          07 FILLER                  PIC X(01) VALUE '-'.         CAT755  
LRM003          07  WS-BOND-PLUS5-MM       PIC X(02).                           
LRM003          07 FILLER                  PIC X(01) VALUE '-'.         CAT755  
LRM003          07  WS-BOND-PLUS5-DD       PIC X(02).                           
          03 WS-COUNTERS.                                               CAT755  
             05 SUB                        PIC 9(03) COMP-3.            CAT755  
             05 TBL-SUB                    PIC 9(03) COMP-3.            CAT755  
             05 WS-REC-READ-CNT            PIC 9(07) VALUE 0.           CAT755  
             05 WS-SEC-FND-CNT             PIC 9(07) VALUE 0.           CAT755  
             05 WS-SEC-NOT-MSD-CNT         PIC 9(07) VALUE 0.           CAT755  
             05 WS-SEC-ADD-CNT             PIC 9(07) VALUE 0.           CAT755  
             05 WS-SEC-UPDT-CNT            PIC 9(07) VALUE 0.           CAT755  
             05 WS-SEC-NOT-ADDED-CNT       PIC 9(07) VALUE 0.           CAT755  
             05 WS-CLT-B1-OFF-CNT          PIC 9(07) VALUE 0.           CAT755  
             05 WS-ACTIAST-FETCH-COUNT     PIC 9(07) VALUE 0.           CAT755  
             05 WS-ACTIAST-DLET-COUNT      PIC 9(07) VALUE 0.           CAT755  
          03 WS-FLAGS.                                                  CAT755  
             05 WS-DUP-SEC-FOUND-FLAG      PIC X(01).                   CAT755  
             05 WS-CLT-FOUND-FLAG          PIC X(01).                   CAT755  
             05 WS-MSD-FND-FLAG            PIC X(01).                   CAT755  
             05 REORG-EOF-SW               PIC X(01).                   CAT755  
                88  REORG-EOF                        VALUE 'E'.         CAT755  
          03 WS-ADD-6-MONTHS               PIC 9(02).                   CAT755  
          03 WS-CLIENT-NUM-X               PIC X(03).                   CAT755  
          03 WS-CLIENT-NUM-9     REDEFINES WS-CLIENT-NUM-X              CAT755  
                                           PIC 9(03).                   CAT755  
          03 WS-SEC-CUSIP                  PIC X(09).                   CAT755  
          03 WS-CONTRA-CUSIP-XX.                                        CAT755  
             05  FILLER                    PIC X(02).                   CAT755  
             05  WS-CONTRA-ADP-NBR         PIC X(07).                   CAT755  
ET0001    03 WS-SAVE-CUSIP                 PIC X(09).                   CAT755  
ET0001    03 WS-SAVE-ADP-NBR               PIC X(07).                   CAT755  
          03 WS-ADP-NO                     PIC X(07).                   CAT755  
          03 WS-CONTRA-SEC-MSG             PIC X(70) VALUE              CAT755  
             'REORG - VOLUNTARY OFFER CONTRA CUSIP'.                    CAT755  
          03 WS-SEC-UPDT-MSG               PIC X(70) VALUE              CAT755  
             'FOR DELIVERER: REORG - VOLUNTARY OFFER CONTRA CUSIP'.     CAT755  
ET0001    03 WS-VOLUNTARY-REORG-TYPE       PIC X(03).                   CAT755  
ET0001       88 WS-VALID-VOLUNTARY-TYPE    VALUES ARE                   CAT755  
ET0001                           'CCB', 'CCE', 'DUT', 'MEL',            CAT755  
ET0001                           'OLT', 'PTC', 'PTM', 'RTS',            CAT755  
ET0001                           'TEN', 'WTS', 'XCH'.                   CAT755  
       01 WS-DATABASE-INSERT-AREA.                                      CAT755  
          03 WS-CLT-NBR-9                  PIC 9(04).                   CAT755  
          03 WS-CLT-NBR          REDEFINES WS-CLT-NBR-9                 CAT755  
                                           PIC X(04).                   CAT755  
          03 WS-SECURITY                   PIC X(07).                   CAT755  
          03 WS-MEMO-IND                   PIC X(01).                   CAT755  
          03 WS-DISTRIBUTE-IND             PIC X(01).                   CAT755  
          03 WS-EXPIRE-DATE                PIC X(10).                   CAT755  
          03 WS-SEC-MESSAGE                PIC X(70).                   CAT755  
       01 B1-TABLE-AREA.                                                CAT755  
          03 B1-TABLE OCCURS 500 TIMES.                                 CAT755  
             05 B1-CLT-NUM                 PIC 9(04).                   CAT755  
             05 B1-CLT-NAME                PIC X(30).                   CAT755  
             05 B1-BKR-CLR-NO              PIC X(04).                   CAT755  
             05 B1-STREAM                  PIC X(01).                   CAT755  
             05 B1-STATUS                  PIC X(01).                   CAT755  
             05 B1-ACAT-STATUS             PIC X(01).                   CAT755  
             05 B1-ACAT-CONTRA-CUSIP       PIC X(01).                   CAT755  
LRM002       05 B1-ACAT-MAT-CALLED-BOND    PIC X(01).                   CAT755  
      ******************************************************************CAT755  
      * DB2 ERROR MESSAGE AREA                                         *CAT755  
      ******************************************************************CAT755  
       01  W-DB2-MESSAGE-AREA.                                          CAT755  
           05  W-DB2-MSG-LEN               PIC S9(04) COMP VALUE +960.  CAT755  
           05  W-DB2-ERROR-MSG             PIC X(080) OCCURS 12 TIMES   CAT755  
                   INDEXED BY W-DB2-IDX.                                CAT755  
       01  W-DB2-MESSAGE-LEN               PIC S9(09) COMP VALUE +80.   CAT755  
                                                                        CAT755  
       01  W-DB2-WORKAREA.                                              CAT755  
           05  ROLLBACK-SQLCA              PIC  X(122).                 CAT755  
           05  ROLLBACK-RETURN             PIC S9(009) COMP.            CAT755  
               88  ROLLBACK-OK                  VALUE +0.               CAT755  
               88  ROLLBACK-AB                  VALUE -999 THRU -1      CAT755  
                                                      +1   THRU +999.   CAT755  
           05  COMMIT-SQLCA                PIC  X(122).                 CAT755  
           05  COMMIT-RETURN               PIC S9(009) COMP.            CAT755  
               88  COMMIT-OK                    VALUE +0.               CAT755  
               88  COMMIT-AB                    VALUE -999 THRU -1      CAT755  
                                                      +1   THRU +999.   CAT755  
      *                                                                 CAT755  
       01  WS-RORG-RECORD.                                              CAT755  
           COPY REOANNSW  REPLACING ==:ANNS:==  BY ==REORG==.           CAT755  
       EJECT                                                            CAT755  
       COPY GETMSDCE.                                                   CAT755  
       EJECT                                                            CAT755  
       COPY BPDATESC.                                                   CAT755  
       EJECT                                                            CAT755  
       COPY BHINFO.                                                     CAT755  
       EJECT                                                            CAT755  
       COPY BHACAT.                                                     CAT755  
       EJECT                                                            CAT755  
      *                                                                 CAT755  
       EJECT                                                            CAT755  
      *--------------------------------------------------------------*  CAT755  
      * COPY IN THE SQLCA AREA - THE COMMON COMMUNICATIONS AREA      *  CAT755  
      *--------------------------------------------------------------*  CAT755  
           EXEC SQL                                                     CAT755  
              INCLUDE SQLCA                                             CAT755  
           END-EXEC.                                                    CAT755  
           EJECT                                                        CAT755  
      *--------------------------------------------------------------*  CAT755  
      * COPY RESTRICTED SECURITY TABLE                               *  CAT755  
      *--------------------------------------------------------------*  CAT755  
           EXEC SQL                                                     CAT755  
              INCLUDE VRSTSEC                                           CAT755  
           END-EXEC.                                                    CAT755  
      *--------------------------------------------------------------*  CAT755  
      * COPY INITIAL ASSET TABLE                                     *  CAT755  
      *--------------------------------------------------------------*  CAT755  
           EXEC SQL                                                     CAT755  
              INCLUDE ACTIAST                                           CAT755  
           END-EXEC.                                                    CAT755  
      * DECLARE CURSOR TO OBTAIN ALL WITHHELD ASSETS                            
      * THESE HAVE W FOLLOWED BY CLIENT NUMBER                                  
           EXEC SQL                                                             
              DECLARE NSCC_AT1_CRSR CURSOR WITH HOLD FOR                        
                 SELECT                                                         
                    ISIN_SEC_ISSUE_CD                                           
                   ,SECURITY_ADP_NBR                                            
                   ,ASSET_CMNT_TXT                                              
                 FROM ACTIAST                                                   
                 WHERE  CLIENT_NBR   =  :DCLACTIAST.CLIENT-NBR                  
           END-EXEC.                                                            
       EJECT                                                            CAT755  
      *                                                                 CAT755  
       LINKAGE SECTION.                                                 CAT755  
       01  PARM-AREA.                                                   CAT755  
           05  PARM-LENGTH            PIC S9(4)    COMP.                CAT755  
           05  PARM-STREAM            PIC X(01).                        CAT755  
                                                                        CAT755  
       PROCEDURE DIVISION USING PARM-AREA.                              CAT755  
           DISPLAY 'CAT755: ADD RESTRICTED SECURITIES FROM REORG FILE'  CAT755  
                   ' TO DATABASE TABLE VRSTSEC.'.                       CAT755  
           COPY MSGCOBO.                                                CAT755  
           IF PARM-LENGTH NOT GREATER ZERO                              CAT755  
               DISPLAY 'CAT755: PARM NOT RECIEVED - PROGRAM ABENDS'     CAT755  
               MOVE 2001     TO ABEND-CODE                              CAT755  
               CALL ABEND USING ABEND-CODE                              CAT755  
           END-IF.                                                      CAT755  
                                                                        CAT755  
           DISPLAY 'CAT755: PROCESSING STREAM = ' PARM-STREAM.          CAT755  
                                                                        CAT755  
           PERFORM 1000-INITIAL-RTN.                                    CAT755  
           PERFORM 2000-MAIN-RTN.                                       CAT755  
                                                                        CAT755  
LRM002     PERFORM VARYING TBL-SUB FROM 1 BY 1                          CAT755  
LRM002            UNTIL TBL-SUB > 500                                   CAT755  
LRM002               OR B1-TABLE (TBL-SUB) = SPACE                      CAT755  
LRM002         IF B1-ACAT-MAT-CALLED-BOND (TBL-SUB) = '3'               CAT755  
LRM002            MOVE B1-CLT-NUM (TBL-SUB) TO WS-CLT-NBR-9             CAT755  
LRM002            PERFORM 6000-MATURE-CALLED-RTN THRU 6000-EXIT         CAT755  
LRM002         END-IF                                                   CAT755  
LRM002     END-PERFORM.                                                 CAT755  
                                                                                
           DISPLAY '**************************************************'.CAT755  
           DISPLAY '* REORG FILE RECORDS READ              = '          CAT755  
                                                 WS-REC-READ-CNT.       CAT755  
           DISPLAY '* # OF RESTRICT SEC FND IN REROG FL    = '          CAT755  
                                                 WS-SEC-FND-CNT.        CAT755  
           DISPLAY '* # OF SEC NOT ADDED DUE TO CLT B1 OFF = '          CAT755  
                                                 WS-CLT-B1-OFF-CNT.     CAT755  
ET0001**   DISPLAY '* # OF SECURITY NOT EXIST IN MSD       = '          CAT755  
ET0001**                                         WS-SEC-NOT-MSD-CNT.    CAT755  
           DISPLAY '* # OF DUPE SEC NOT ADDED TO DB2 TBL   = '          CAT755  
                                                 WS-SEC-NOT-ADDED-CNT.  CAT755  
           DISPLAY '* # OF DUPE SEC UPDATED AT DB2 TBL     = '          CAT755  
                                                 WS-SEC-UPDT-CNT.       CAT755  
           DISPLAY '* # OF RESTRICT SEC ADDED TO DB2 TBL   = '          CAT755  
                                                 WS-SEC-ADD-CNT.        CAT755  
           DISPLAY '* # OF WITHHELD SPECIAL ACTIAST FETCHED= '          CAT755  
                                                 WS-ACTIAST-FETCH-COUNT CAT755  
           DISPLAY '* # OF WITHHELD SPECIAL ACTIAST DELETED= '          CAT755  
                                                 WS-ACTIAST-DLET-COUNT  CAT755  
           DISPLAY '**************************************************'.CAT755  
                                                                        CAT755  
           CLOSE REORG-ANNS-FL.                                         CAT755  
                                                                        CAT755  
           DISPLAY 'CAT755: JOB COMPLETED SUCCESSFULLY.'                CAT755  
           GOBACK.                                                      CAT755  
      *                                                                 CAT755  
       1000-INITIAL-RTN.                                                CAT755  
           EXEC SQL                                                     CAT755  
               SET :WS-TIMESTAMP = CURRENT TIMESTAMP                    CAT755  
           END-EXEC.                                                    CAT755  
                                                                        CAT755  
           IF  SQLCODE = +0                                             CAT755  
               DISPLAY ' '                                              CAT755  
               DISPLAY 'CAT755: WS-TIMESTAMP = ' WS-TIMESTAMP           CAT755  
               DISPLAY ' '                                              CAT755  
           ELSE                                                         CAT755  
               DISPLAY 'CAT755: WS-TIMESTAMP NOT SET'                   CAT755  
               MOVE SQLCODE TO WS-DB2-SQLCODE                                   
               DISPLAY 'SQLCODE = ' WS-DB2-SQLCODE                      CAT755  
               PERFORM 8500-SQL-ERROR                                   CAT755  
           END-IF.                                                      CAT755  
                                                                        CAT755  
           MOVE 'CAT755'                  TO BPDATES-CALLING-PGM.       CAT755  
           SET  LNKDATZ-REQUEST           TO TRUE.                      CAT755  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT755  
                                                                        CAT755  
           DISPLAY ' '.                                                 CAT755  
           DISPLAY 'CAT755: BPD-PROC-DATE= ' BPD-PROC-DATE.             CAT755  
           DISPLAY ' '.                                                 CAT755  
                                                                        CAT755  
           PERFORM 1100-GET-6MONTHS-FROM-TODAY.                         CAT755  
                                                                        CAT755  
           PERFORM 1500-LOAD-B1.                                        CAT755  
                                                                        CAT755  
           OPEN INPUT REORG-ANNS-FL.                                    CAT755  
      *                                                                 CAT755  
       1100-GET-6MONTHS-FROM-TODAY.                                     CAT755  
           MOVE WS-TIMESTAMP TO WS-TODAY.                               CAT755  
           COMPUTE WS-ADD-6-MONTHS = WS-TODAY-MM-9 + 6.                 CAT755  
           IF WS-ADD-6-MONTHS > 12                                      CAT755  
              MOVE WS-TODAY-CCYY   TO WS-EDIT-YEAR                      CAT755  
              COMPUTE WS-EDIT-MONTH = WS-ADD-6-MONTHS - 12              CAT755  
              ADD  1               TO WS-EDIT-YEAR                      CAT755  
           ELSE                                                         CAT755  
              MOVE WS-TODAY-CCYY   TO WS-EDIT-YEAR                      CAT755  
              MOVE WS-ADD-6-MONTHS TO WS-EDIT-MONTH                     CAT755  
           END-IF.                                                      CAT755  
                                                                        CAT755  
           MOVE WS-TODAY-DD TO WS-EDIT-DAY.                             CAT755  
           IF WS-EDIT-MONTH = 02                                        CAT755  
              IF WS-EDIT-DAY = 29 OR 30 OR 31                           CAT755  
                 MOVE 28 TO WS-EDIT-DAY                                 CAT755  
              END-IF                                                    CAT755  
           END-IF.                                                      CAT755  
           IF WS-EDIT-MONTH = 04 OR 06 OR 09 OR 11                      CAT755  
              IF WS-EDIT-DAY = 31                                       CAT755  
                 MOVE 30 TO WS-EDIT-DAY                                 CAT755  
              END-IF                                                    CAT755  
           END-IF.                                                      CAT755  
                                                                        CAT755  
           MOVE WS-EDIT-DATE TO WS-TODAY-PLUS-6MNTH.                    CAT755  
      *                                                                 CAT755  
       1500-LOAD-B1.                                                    CAT755  
           MOVE SPACES                   TO  B1-TABLE-AREA.             CAT755  
           MOVE 0                        TO  SUB                        CAT755  
                                             TBL-SUB.                   CAT755  
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 500              CAT755  
                                                                        CAT755  
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT755  
                                             BH-ACAT-INFO               CAT755  
             MOVE  SUB                   TO  BH-BROKER-NUMBER-N         CAT755  
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT755  
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT755  
             CALL  GETB1V              USING BH-BROKER-HEADER-INFO      CAT755  
                                             BH-ACAT-INFO               CAT755  
             IF  BH-BROKER-ACTIVE                                       CAT755  
             AND BH-ACAT-ACTIVE                                         CAT755  
                 IF BH-BROKER-MINI-MAXI-INDICATOR = PARM-STREAM         CAT755  
                    IF ((BH-ACAT-WH-ASSET-CONTRA-CUSIP  = '2' OR '3')   CAT755  
LRM002              OR BH-ACAT-MATUR-CALL-BOND-ACTION = '3')            CAT755  
                       ADD 1 TO TBL-SUB                                 CAT755  
                       MOVE  BH-BROKER-NUMBER-N                         CAT755  
                         TO  B1-CLT-NUM              (TBL-SUB)          CAT755  
                       MOVE  BH-BROKER-NAME                             CAT755  
                         TO  B1-CLT-NAME             (TBL-SUB)          CAT755  
                       MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)         CAT755  
                         TO  B1-BKR-CLR-NO           (TBL-SUB)          CAT755  
                       IF BH-BROKER-MINI-MAXI-SUBGROUP > ' '            CAT755  
                          MOVE BH-BROKER-MINI-MAXI-SUBGROUP             CAT755  
                            TO B1-STREAM     (TBL-SUB)                  CAT755  
                       ELSE                                             CAT755  
                          MOVE BH-BROKER-MINI-MAXI-INDICATOR            CAT755  
                            TO B1-STREAM     (TBL-SUB)                  CAT755  
                       END-IF                                           CAT755  
                       MOVE  BH-BROKER-STATUS                           CAT755  
                         TO  B1-STATUS               (TBL-SUB)          CAT755  
                       MOVE  BH-ACAT-STATUS                             CAT755  
                         TO  B1-ACAT-STATUS          (TBL-SUB)          CAT755  
                       MOVE  BH-ACAT-WH-ASSET-CONTRA-CUSIP              CAT755  
                         TO  B1-ACAT-CONTRA-CUSIP    (TBL-SUB)          CAT755  
LRM002                 MOVE  BH-ACAT-MATUR-CALL-BOND-ACTION             CAT755  
LRM002                   TO  B1-ACAT-MAT-CALLED-BOND (TBL-SUB)          CAT755  
                       DISPLAY  ' TBL=' TBL-SUB                         CAT755  
                                ' CLT ' B1-CLT-NUM     (TBL-SUB)        CAT755  
                                    ' ' B1-CLT-NAME    (TBL-SUB)        CAT755  
                                ' BKR ' B1-BKR-CLR-NO  (TBL-SUB)        CAT755  
                                ' STRM ' B1-STREAM     (TBL-SUB)        CAT755  
                                ' WH-CONTRA-CUSIP '                     CAT755  
                                  B1-ACAT-CONTRA-CUSIP (TBL-SUB)        CAT755  
LRM002                          ' BOND UPDATE '                                 
LRM002                         B1-ACAT-MAT-CALLED-BOND (TBL-SUB)        CAT755  
                    END-IF                                              CAT755  
                 END-IF                                                 CAT755  
             END-IF                                                     CAT755  
                                                                        CAT755  
           END-PERFORM.                                                 CAT755  
                                                                        CAT755  
           DISPLAY ' '.                                                 CAT755  
                                                                        CAT755  
           DISPLAY ' B1 TABLE COUNT = ' TBL-SUB.                        CAT755  
           DISPLAY ' '.                                                 CAT755  
      *                                                                 CAT755  
       2000-MAIN-RTN.                                                   CAT755  
           PERFORM 5000-READ-REORG-ANNOUNCE-FL                          CAT755  
              THRU 5000-EXIT.                                           CAT755  
                                                                        CAT755  
           PERFORM 3000-PROCESS-RTN                                     CAT755  
                UNTIL REORG-EOF.                                        CAT755  
      *                                                                 CAT755  
       3000-PROCESS-RTN.                                                CAT755  
           IF REORG-CLIENT-NUMBER IS NUMERIC                            CAT755  
              MOVE REORG-CLIENT-NUMBER TO WS-CLIENT-NUM-X               CAT755  
              PERFORM 3100-SEARCH-CLT-IN-B1TBL                          CAT755  
              IF WS-CLT-FOUND-FLAG = 'Y'                                CAT755  
                 PERFORM 4000-ADD-RESTRICTED-SEC-RTN                    CAT755  
              ELSE                                                      CAT755  
                 ADD 1 TO WS-CLT-B1-OFF-CNT                             CAT755  
ET0001*****      DISPLAY 'CAT755: CLT=' WS-CLIENT-NUM-X                 CAT755  
ET0001*****              ' CLIENT B1(434517) NOT TURNED ON -'           CAT755  
ET0001*****              ' CONTRA-CUSIP=' REORG-DTC-CUSIP-BASE          CAT755  
ET0001**                 ' CONTRA-CUSIP=' REORG-CUSIP-9                 CAT755  
ET0001*****              ' NOT PROCESSED'                               CAT755  
              END-IF                                                    CAT755  
           END-IF.                                                      CAT755  
                                                                        CAT755  
           PERFORM 5000-READ-REORG-ANNOUNCE-FL                          CAT755  
              THRU 5000-EXIT.                                           CAT755  
      *                                                                 CAT755  
       3100-SEARCH-CLT-IN-B1TBL.                                        CAT755  
           MOVE SPACE  TO WS-CLT-FOUND-FLAG.                            CAT755  
           PERFORM VARYING TBL-SUB FROM 1 BY 1                          CAT755  
                  UNTIL TBL-SUB > 500                                   CAT755  
                     OR B1-TABLE (TBL-SUB) = SPACE                      CAT755  
                     OR WS-CLT-FOUND-FLAG = 'Y'                         CAT755  
               IF WS-CLIENT-NUM-9 = B1-CLT-NUM (TBL-SUB)                CAT755  
LRM002         AND (B1-ACAT-CONTRA-CUSIP (TBL-SUB) = '2' OR '3')        CAT755  
                  MOVE B1-CLT-NUM (TBL-SUB) TO WS-CLT-NBR-9             CAT755  
                  MOVE 'Y' TO WS-CLT-FOUND-FLAG                         CAT755  
               END-IF                                                   CAT755  
           END-PERFORM.                                                 CAT755  
      *                                                                 CAT755  
       4000-ADD-RESTRICTED-SEC-RTN.                                     CAT755  
ET0001**   MOVE REORG-DTC-CUSIP-BASE   TO WS-SEC-CUSIP.                 CAT755  
ET0001**   PERFORM 4050-GETMSD.                                         CAT755  
ET0001**   IF WS-MSD-FND-FLAG = 'Y'                                     CAT755  
ET0001**      PERFORM 4100-PREPARE-TO-ADD                               CAT755  
ET0001**   ELSE                                                         CAT755  
ET0001**      IF REORG-DTC-CUSIP-BASE (1:2) = 'XX'                      CAT755  
ET0001**         MOVE REORG-DTC-CUSIP-BASE TO WS-CONTRA-CUSIP-XX        CAT755  
ET0001**         MOVE WS-CONTRA-ADP-NBR    TO WS-SEC-CUSIP              CAT755  
ET0001**         PERFORM 4050-GETMSD                                    CAT755  
ET0001**         IF WS-MSD-FND-FLAG = 'Y'                               CAT755  
ET0001**            PERFORM 4100-PREPARE-TO-ADD                         CAT755  
ET0001**         ELSE                                                   CAT755  
ET0001**            ADD 1 TO WS-SEC-NOT-MSD-CNT                         CAT755  
ET0001**            DISPLAY 'CAT755: **WARNING** CLT=' WS-CLIENT-NUM-X  CAT755  
ET0001**                    ' CONTRA-CUSIP=' REORG-DTC-CUSIP-BASE       CAT755  
ET0001**                    ' NOT FOUND IN MSD FILE'                    CAT755  
ET0001**         END-IF                                                 CAT755  
ET0001**      ELSE                                                      CAT755  
ET0001**         ADD 1 TO WS-SEC-NOT-MSD-CNT                            CAT755  
ET0001**         DISPLAY 'CAT755: **WARNING** CLT=' WS-CLIENT-NUM-X     CAT755  
ET0001**                 ' CONTRA-CUSIP=' REORG-DTC-CUSIP-BASE          CAT755  
ET0001**                 ' NOT FOUND IN MSD FILE'                       CAT755  
ET0001**      END-IF                                                    CAT755  
ET0001**   END-IF.                                                      CAT755  
ET0001     IF WS-SAVE-ADP-NBR > SPACE                                   CAT755  
ET0001        MOVE WS-SAVE-ADP-NBR TO WS-ADP-NO                         CAT755  
ET0001        PERFORM 4100-PREPARE-TO-ADD                               CAT755  
ET0001     END-IF.                                                      CAT755  
      *                                                                 CAT755  
       4050-GETMSD.                                                     CAT755  
           SET GETMSD-DEVICE-DISK      TO TRUE.                         CAT755  
           SET GETMSD-ACCESS-RANDOM    TO TRUE.                         CAT755  
           SET GETMSD-FORMAT-NEW       TO TRUE.                         CAT755  
           MOVE WS-SEC-CUSIP           TO GETMSD-SEARCH-KEY.            CAT755  
           MOVE '0'                    TO GETMSD-WI-CODE.               CAT755  
           MOVE '000'                  TO GETMSD-CLIENT-NO.             CAT755  
           CALL  GETMSDC  USING MASTER-SECURITY-RECORD.                 CAT755  
                                                                        CAT755  
           EVALUATE TRUE                                                CAT755  
              WHEN GETMSD-RETURN-IO-ERROR                               CAT755  
                  DISPLAY 'CAT755: I/O ERROR CALLING MSD FILE'          CAT755  
                  MOVE 4040     TO ABEND-CODE                           CAT755  
                  CALL ABEND USING ABEND-CODE                           CAT755  
              WHEN GETMSD-RETURN-REC-NOT-FOUND                          CAT755  
                  MOVE 'N' TO WS-MSD-FND-FLAG                           CAT755  
              WHEN GETMSD-RETURN-VALID                                  CAT755  
                  MOVE MS-ADP-NO  TO WS-ADP-NO                          CAT755  
                  MOVE 'Y' TO WS-MSD-FND-FLAG                           CAT755  
              WHEN OTHER                                                CAT755  
                  ADD 1 TO WS-SEC-NOT-MSD-CNT                           CAT755  
                  MOVE 'N' TO WS-MSD-FND-FLAG                           CAT755  
                  DISPLAY 'CAT755: **WARNING** CLT=' WS-CLIENT-NUM-X    CAT755  
ET0001**                  ' CONTRA-CUSIP=' REORG-DTC-CUSIP-BASE         CAT755  
ET0001                    ' CONTRA-CUSIP=' REORG-CUSIP-9                CAT755  
                          ' NOT FOUND IN MSD FILE - '                   CAT755  
                          ' GETMSD RETURN-CODE=' GETMSD-RETURN-CODE     CAT755  
           END-EVALUATE.                                                CAT755  
      *                                                                 CAT755  
       4100-PREPARE-TO-ADD.                                             CAT755  
           MOVE WS-ADP-NO              TO WS-SECURITY.                  CAT755  
           MOVE 'Y'                    TO WS-MEMO-IND.                  CAT755  
           MOVE 'D'                    TO WS-DISTRIBUTE-IND.            CAT755  
           MOVE WS-TODAY-PLUS-6MNTH    TO WS-EXPIRE-DATE.               CAT755  
LRM003* THE FOLLOWING LINES EXPECT THE PARTIAL CALLED BOND CALL DATE            
LRM003* TO BE IN THE AUDIT ROW DESCRIPTION, ADD 3 DAYS TO THIS, AND             
LRM003* REPLACE THE 6 MONTH EXPIRE DATE WHEN THIS CALC DATE IS LESS.            
LRM003     IF ASSET-CMNT-TXT    OF DCLACTIAST (1 : 11) =                        
LRM003                      'CALLED BOND'                                       
LRM003        MOVE ASSET-CMNT-TXT    OF DCLACTIAST (1 : 11)                     
LRM003                                 TO WS-SEC-MESSAGE                CAT755  
LRM003        MOVE ASSET-CMNT-TXT    OF DCLACTIAST                              
LRM003                                 TO WS-ASSET-CMNT-TXT             CAT755  
LRM003        IF WS-ASSET-CMNT-TXT(20:2) = 'PC'                                 
LRM003*       AND WS-ASSET-CMNT-TXT(23:4) NUMERIC                               
LRM003*       AND WS-ASSET-CMNT-TXT(26:2) NUMERIC                               
LRM003*       AND WS-ASSET-CMNT-TXT(28:2) NUMERIC                               
LRM003           MOVE WS-ASSET-CMNT-TXT(23:4) TO                                
LRM003                               BPDATES-BASE-DATE(1:4)                     
LRM003           MOVE WS-ASSET-CMNT-TXT(28:2) TO                                
LRM003                               BPDATES-BASE-DATE(5:2)                     
LRM003           MOVE WS-ASSET-CMNT-TXT(31:2) TO                                
LRM003                               BPDATES-BASE-DATE(7:2)                     
LRM003           MOVE WS-ASSET-CMNT-TXT(23:10) TO WS-EXPIRE-DATE                
LRM003           MOVE  'D'               TO  BPDATES-REQ-TYPE                   
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*          MOVE  'US'              TO  BPDATES-CALENDAR-TYPE              
CSG001           MOVE  '  '              TO  BPDATES-CALENDAR-TYPE              
LRM003           MOVE  'P'               TO  BPDATES-DTSEARCH-IND               
LRM003           MOVE  'C'               TO  BPDATES-DTSEARCH-TYPE              
LRM003           MOVE  5                 TO  BPDATES-DTSEARCH-DISP              
LRM003           CALL BPDATES               USING  BPDATES-PARAMETERS           
LRM003           IF  NOT BPD-VALID-RETURN                                       
LRM003               DISPLAY 'CALL ZBPDATES FOR CALL-BOND PLUS 3 DAYS'          
LRM003               DISPLAY 'ZBPDATES RETURN CODE = '                          
LRM003                   BPDATES-RETURN-CODE ' BYPASSING'                       
LRM003               DISPLAY 'BASE DATE ' BPDATES-BASE-DATE                     
LRM003                    ' DISPLACEMENT '  BPDATES-DTSEARCH-DISP               
LRM003           ELSE                                                           
LRM003               MOVE BPD-DT-CALDATE(1:4) TO WS-BOND-PLUS5-CCYY             
LRM003               MOVE BPD-DT-CALDATE(5:2) TO WS-BOND-PLUS5-MM               
LRM003               MOVE BPD-DT-CALDATE(7:2) TO WS-BOND-PLUS5-DD               
LRM003               IF WS-BOND-PLUS5 < WS-TODAY-PLUS-6MNTH                     
LRM003                  MOVE WS-BOND-PLUS5  TO WS-EXPIRE-DATE                   
LRM003               END-IF                                                     
LRM003           END-IF                                                         
LRM003        END-IF                                                            
LRM003     ELSE                                                                 
              MOVE WS-CONTRA-SEC-MSG      TO WS-SEC-MESSAGE             CAT755  
LRM003     END-IF.                                                              
           PERFORM 4200-DUPLICATE-SEC-CHECK.                            CAT755  
           IF WS-DUP-SEC-FOUND-FLAG = 'Y'                               CAT755  
              IF TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC = 'R'                 CAT755  
                 PERFORM 4300-DUPE-SEC-RTN                              CAT755  
              ELSE                                                      CAT755  
                 ADD 1 TO WS-SEC-NOT-ADDED-CNT                          CAT755  
              END-IF                                                    CAT755  
           ELSE                                                         CAT755  
              PERFORM 4500-INSERT-RESTRICT-SEC                          CAT755  
              DISPLAY 'CAT755: CLT=' WS-CLIENT-NUM-X                    CAT755  
ET0001**              ' CONTRA-CUSIP=' REORG-DTC-CUSIP-BASE             CAT755  
ET0001                ' CONTRA-CUSIP=' REORG-CUSIP-9                    CAT755  
                      ' SEC=' WS-SECURITY                               CAT755  
                      ' ADDED TO DATABASE VRSTSEC'                      CAT755  
           END-IF.                                                      CAT755  
      *                                                                 CAT755  
       4200-DUPLICATE-SEC-CHECK.                                        CAT755  
           EXEC SQL                                                     CAT755  
               SELECT                                                   CAT755  
                    CLIENT_NBR                                          CAT755  
                   ,ISIN_SEC_ISSUE_CD                                   CAT755  
                   ,TRNFR_MEMO_IND                                      CAT755  
                   ,TRNFR_BRKR_TYPE_CD                                  CAT755  
                   ,RSTRD_MSG_TXT                                       CAT755  
                   ,PRGM_NM                                             CAT755  
                   ,CICS_TERM_ID_CD                                     CAT755  
                   ,CRT_TMSTP                                           CAT755  
                   ,UPDT_TMSTP                                          CAT755  
                   ,SECURITY_ADP_NBR                                    CAT755  
                   ,EXPTN_DT                                            CAT755  
                   ,COMMENT_TXT                                         CAT755  
                   ,CICS_SGNON_ID                                       CAT755  
                   ,TPSCRT_USR_NM                                       CAT755  
                   ,TPSCRT_USR_ID                                       CAT755  
                   ,CICS_NET_NM                                         CAT755  
                 INTO                                                   CAT755  
                    :DCLVRSTSEC.CLIENT-NBR                              CAT755  
                   ,:DCLVRSTSEC.ISIN-SEC-ISSUE-CD                       CAT755  
                   ,:DCLVRSTSEC.TRNFR-MEMO-IND                          CAT755  
                   ,:DCLVRSTSEC.TRNFR-BRKR-TYPE-CD                      CAT755  
                   ,:DCLVRSTSEC.RSTRD-MSG-TXT                           CAT755  
                   ,:DCLVRSTSEC.PRGM-NM                                 CAT755  
                   ,:DCLVRSTSEC.CICS-TERM-ID-CD                         CAT755  
                   ,:DCLVRSTSEC.CRT-TMSTP                               CAT755  
                   ,:DCLVRSTSEC.UPDT-TMSTP                              CAT755  
                   ,:DCLVRSTSEC.SECURITY-ADP-NBR                        CAT755  
                   ,:DCLVRSTSEC.EXPTN-DT                                CAT755  
                   ,:DCLVRSTSEC.COMMENT-TXT                             CAT755  
                   ,:DCLVRSTSEC.CICS-SGNON-ID                           CAT755  
                   ,:DCLVRSTSEC.TPSCRT-USR-NM                           CAT755  
                   ,:DCLVRSTSEC.TPSCRT-USR-ID                           CAT755  
                   ,:DCLVRSTSEC.CICS-NET-NM                             CAT755  
                 FROM                                                   CAT755  
                    VRSTSEC                                             CAT755  
                WHERE                                                   CAT755  
                    CLIENT_NBR = :WS-CLT-NBR                            CAT755  
                    AND ISIN_SEC_ISSUE_CD = :WS-SECURITY                CAT755  
           END-EXEC.                                                    CAT755  
           IF SQLCODE = 0                                               CAT755  
              MOVE 'Y' TO WS-DUP-SEC-FOUND-FLAG                         CAT755  
           ELSE                                                         CAT755  
           IF SQLCODE = +100                                            CAT755  
              MOVE 'N' TO WS-DUP-SEC-FOUND-FLAG                         CAT755  
           ELSE                                                         CAT755  
              DISPLAY '** CAT755 ABENDED: SQL SELECT ERROR - CLT='      CAT755  
                      WS-CLT-NBR  ' SECURITY=' WS-SECURITY              CAT755  
ET0001**              ' CONTRA-CUSIP=' REORG-DTC-CUSIP-BASE             CAT755  
ET0001                ' CONTRA-CUSIP=' REORG-CUSIP-9                    CAT755  
              MOVE SQLCODE TO WS-DB2-SQLCODE                                    
              DISPLAY 'SQLCODE = ' WS-DB2-SQLCODE                               
              PERFORM 8500-SQL-ERROR                                    CAT755  
           END-IF.                                                      CAT755  
      *                                                                 CAT755  
       4300-DUPE-SEC-RTN.                                               CAT755  
           MOVE 'B' TO WS-DISTRIBUTE-IND.                               CAT755  
           IF TRNFR-MEMO-IND OF DCLVRSTSEC = SPACE                      CAT755  
               MOVE 'Y' TO WS-MEMO-IND                                  CAT755  
           ELSE                                                         CAT755  
               MOVE TRNFR-MEMO-IND OF DCLVRSTSEC TO WS-MEMO-IND         CAT755  
           END-IF.                                                      CAT755  
           IF RSTRD-MSG-TXT OF DCLVRSTSEC = SPACE                       CAT755  
              MOVE WS-SEC-UPDT-MSG TO WS-SEC-MESSAGE                    CAT755  
           ELSE                                                         CAT755  
              MOVE RSTRD-MSG-TXT OF DCLVRSTSEC TO WS-SEC-MESSAGE        CAT755  
           END-IF.                                                      CAT755  
           PERFORM 4600-UPDATE-RESTRICT-SEC-TBL.                        CAT755  
           DISPLAY 'CAT755: CLT=' WS-CLIENT-NUM-X                       CAT755  
ET0001**           ' CONTRA-CUSIP=' REORG-DTC-CUSIP-BASE                CAT755  
ET0001             ' CONTRA-CUSIP=' REORG-CUSIP-9                       CAT755  
                   ' SEC=' WS-SECURITY                                  CAT755  
                   ' RECEIVER DUPE SEC FOUND - DB2 UPDATED'.            CAT755  
      *                                                                 CAT755  
       4500-INSERT-RESTRICT-SEC.                                        CAT755  
           EXEC SQL                                                     CAT755  
               SET :WS-TIMESTAMP = CURRENT TIMESTAMP                    CAT755  
           END-EXEC.                                                    CAT755  
                                                                        CAT755  
           EXEC SQL                                                     CAT755  
              INSERT INTO VRSTSEC                                       CAT755  
                 ( CLIENT_NBR                                           CAT755  
                  ,ISIN_SEC_ISSUE_CD                                    CAT755  
                  ,TRNFR_MEMO_IND                                       CAT755  
                  ,TRNFR_BRKR_TYPE_CD                                   CAT755  
                  ,RSTRD_MSG_TXT                                        CAT755  
                  ,PRGM_NM                                              CAT755  
                  ,CICS_TERM_ID_CD                                      CAT755  
                  ,CRT_TMSTP                                            CAT755  
                  ,UPDT_TMSTP                                           CAT755  
                  ,SECURITY_ADP_NBR                                     CAT755  
                  ,EXPTN_DT                                             CAT755  
                  ,COMMENT_TXT                                          CAT755  
                  ,CICS_SGNON_ID                                        CAT755  
                  ,TPSCRT_USR_NM                                        CAT755  
                  ,TPSCRT_USR_ID                                        CAT755  
                  ,CICS_NET_NM   )                                      CAT755  
              VALUES                                                    CAT755  
                 ( :WS-CLT-NBR                                          CAT755  
                  ,:WS-SECURITY                                         CAT755  
                  ,:WS-MEMO-IND                                         CAT755  
                  ,:WS-DISTRIBUTE-IND                                   CAT755  
                  ,:WS-SEC-MESSAGE                                      CAT755  
                  ,'CAT755  '                                           CAT755  
                  ,' '                                                  CAT755  
                  ,:WS-TIMESTAMP                                        CAT755  
                  ,:WS-TIMESTAMP                                        CAT755  
                  ,:WS-SECURITY                                         CAT755  
                  ,:WS-EXPIRE-DATE                                      CAT755  
                  ,' '                                                  CAT755  
                  ,' '                                                  CAT755  
                  ,' '                                                  CAT755  
                  ,' '                                                  CAT755  
                  ,' ' )                                                CAT755  
           END-EXEC.                                                    CAT755  
           IF SQLCODE = 0                                               CAT755  
              ADD 1 TO WS-SEC-ADD-CNT                                   CAT755  
           ELSE                                                         CAT755  
              DISPLAY '** CAT755 ABENDED: SQL INSERT ERROR - CLT='      CAT755  
                      WS-CLT-NBR  ' SECURITY=' WS-SECURITY              CAT755  
              MOVE SQLCODE TO WS-DB2-SQLCODE                                    
              DISPLAY 'SQLCODE = ' WS-DB2-SQLCODE                               
              PERFORM 8500-SQL-ERROR                                    CAT755  
           END-IF.                                                      CAT755  
      *                                                                 CAT755  
       4600-UPDATE-RESTRICT-SEC-TBL.                                    CAT755  
           EXEC SQL                                                     CAT755  
             UPDATE VRSTSEC                                             CAT755  
                SET TRNFR_MEMO_IND     = :WS-MEMO-IND                   CAT755  
                   ,TRNFR_BRKR_TYPE_CD = :WS-DISTRIBUTE-IND             CAT755  
                   ,RSTRD_MSG_TXT      = :WS-SEC-MESSAGE                CAT755  
                   ,PRGM_NM            = 'CAT755  '                     CAT755  
                   ,CICS_TERM_ID_CD    = ' '                            CAT755  
                   ,UPDT_TMSTP         = :WS-TIMESTAMP                  CAT755  
                   ,CICS_SGNON_ID      = ' '                            CAT755  
                   ,TPSCRT_USR_NM      = ' '                            CAT755  
                   ,TPSCRT_USR_ID      = ' '                            CAT755  
                   ,CICS_NET_NM        = ' '                            CAT755  
              WHERE CLIENT_NBR = :WS-CLT-NBR  AND                       CAT755  
                    ISIN_SEC_ISSUE_CD = :WS-SECURITY                    CAT755  
           END-EXEC.                                                    CAT755  
           IF SQLCODE = 0                                               CAT755  
              ADD 1 TO WS-SEC-UPDT-CNT                                  CAT755  
           ELSE                                                         CAT755  
              DISPLAY '** CAT755 ABENDED: SQL UPDATE ERROR - CLT='      CAT755  
                      WS-CLT-NBR  ' SECURITY=' WS-SECURITY              CAT755  
              MOVE SQLCODE TO WS-DB2-SQLCODE                                    
              DISPLAY 'SQLCODE = ' WS-DB2-SQLCODE                               
              PERFORM 8500-SQL-ERROR                                    CAT755  
           END-IF.                                                      CAT755  
      *                                                                 CAT755  
       5000-READ-REORG-ANNOUNCE-FL.                                     CAT755  
           READ REORG-ANNS-FL INTO REORG-RECORD                         CAT755  
               AT END                                                   CAT755  
                  MOVE HIGH-VALUES  TO  REORG-KEY-AREA                  CAT755  
                  SET REORG-EOF TO TRUE                                 CAT755  
                  GO TO  5000-EXIT.                                     CAT755  
                                                                        CAT755  
           ADD 1 TO WS-REC-READ-CNT.                                    CAT755  
                                                                        CAT755  
           IF REORG-HEADER                                              CAT755  
           OR REORG-TRAILER                                             CAT755  
               GO TO 5000-READ-REORG-ANNOUNCE-FL                        CAT755  
           END-IF.                                                      CAT755  
                                                                        CAT755  
           IF REORG-CLIENT-NUMBER = LOW-VALUE                           CAT755  
               GO TO 5000-READ-REORG-ANNOUNCE-FL                        CAT755  
           END-IF.                                                      CAT755  
                                                                        CAT755  
ET0001     MOVE REORG-REORG-TYPE  TO WS-VOLUNTARY-REORG-TYPE.           CAT755  
ET0001     IF  WS-VALID-VOLUNTARY-TYPE                                  CAT755  
ET0001         CONTINUE                                                 CAT755  
ET0001     ELSE                                                         CAT755  
ET0001         GO TO 5000-READ-REORG-ANNOUNCE-FL                        CAT755  
ET0001     END-IF.                                                      CAT755  
ET0001                                                                  CAT755  
ET0001     IF  REORG-RECORD-TYPE = '1'                                  CAT755  
ET0001         GO TO 5000-READ-REORG-ANNOUNCE-FL                        CAT755  
ET0001     END-IF.                                                      CAT755  
ET0001                                                                  CAT755  
ET0001     IF  REORG-RECORD-TYPE = '2'                                  CAT755  
LRM003         IF REORG-CONTRA-CUSIP-ADP-SEC-NBR > SPACES                       
LRM003             MOVE REORG-CONTRA-CUSIP-ADP-SEC-NBR                          
LRM003                                    TO WS-SAVE-ADP-NBR                    
ET0001             ADD 1 TO WS-SEC-FND-CNT                              CAT755  
ET0001         ELSE                                                     CAT755  
LRM003             MOVE SPACES            TO WS-SAVE-ADP-NBR                    
ET0001             GO TO 5000-READ-REORG-ANNOUNCE-FL                    CAT755  
ET0001         END-IF                                                   CAT755  
ET0001     ELSE                                                         CAT755  
LRM003         MOVE SPACES            TO WS-SAVE-ADP-NBR                        
ET0001         GO TO 5000-READ-REORG-ANNOUNCE-FL                        CAT755  
ET0001     END-IF.                                                      CAT755  
ET0001                                                                  CAT755  
ET0001                                                                  CAT755  
ET0001**   IF  REORG-RECORD-TYPE = '2'                                  CAT755  
ET0001**       IF REORG-DTC-CUSIP-BASE > SPACE                          CAT755  
ET0001**          ADD 1 TO WS-SEC-FND-CNT                               CAT755  
ET0001**       ELSE                                                     CAT755  
ET0001**          GO TO 5000-READ-REORG-ANNOUNCE-FL                     CAT755  
ET0001**       END-IF                                                   CAT755  
ET0001**   ELSE                                                         CAT755  
ET0001**       GO TO 5000-READ-REORG-ANNOUNCE-FL                        CAT755  
ET0001**   END-IF.                                                      CAT755  
       5000-EXIT.    EXIT.                                              CAT755  
     *                                                                  CAT755  
LRM002 6000-MATURE-CALLED-RTN.                                          CAT755  
           MOVE 'W'             TO CLIENT-NBR OF DCLACTIAST (1:1).      CAT755  
           MOVE WS-CLT-NBR(2:3) TO CLIENT-NBR OF DCLACTIAST (2:3).      CAT755  
           EXEC SQL                                                             
              OPEN NSCC_AT1_CRSR                                                
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY '** CAT755 ABENDED: SQL AT1 CURSOR OPEN - CLT='   CAT755  
                      CLIENT-NBR OF DCLACTIAST                          CAT755  
              MOVE SQLCODE TO WS-DB2-SQLCODE                                    
              DISPLAY 'SQLCODE = ' WS-DB2-SQLCODE                               
              PERFORM 8500-SQL-ERROR                                    CAT755  
           END-IF                                                               
                                                                                
           PERFORM UNTIL SQLCODE NOT = +0                                       
              EXEC SQL                                                          
                 FETCH NSCC_AT1_CRSR                                            
                    INTO                                                        
                    :DCLACTIAST.ISIN-SEC-ISSUE-CD                               
                   ,:DCLACTIAST.SECURITY-ADP-NBR                                
                   ,:DCLACTIAST.ASSET-CMNT-TXT                                  
              END-EXEC                                                          
              IF SQLCODE = +0                                                   
                 ADD 1 TO WS-ACTIAST-FETCH-COUNT                                
                 MOVE SECURITY-ADP-NBR  OF DCLACTIAST TO WS-ADP-NO      CAT755  
                 MOVE ISIN-SEC-ISSUE-CD OF DCLACTIAST TO REORG-CUSIP-9          
                 MOVE ASSET-CMNT-TXT    OF DCLACTIAST                           
                                                  TO WS-CONTRA-SEC-MSG          
                 DISPLAY 'FETCHED ' CLIENT-NBR OF DCLACTIAST                    
                   ' ' SECURITY-ADP-NBR OF DCLACTIAST                           
                   ' '  ASSET-CMNT-TXT    OF DCLACTIAST (1:50)                  
                 PERFORM 4100-PREPARE-TO-ADD                            CAT755  
                 PERFORM 6100-DELETE-ACTIAST-ROW                                
                 MOVE +0 TO SQLCODE                                             
              ELSE                                                              
              IF SQLCODE = +100                                                 
                  CONTINUE                                                      
              ELSE                                                              
                 DISPLAY '** CAT755 ABENDED: SQL AT1 FETCH '            CAT755  
                 PERFORM 8500-SQL-ERROR                                 CAT755  
                 MOVE SQLCODE TO WS-DB2-SQLCODE                                 
                 DISPLAY 'SQLCODE = ' WS-DB2-SQLCODE                            
              END-IF END-IF                                                     
           END-PERFORM.                                                         
                                                                                
           EXEC SQL                                                             
              CLOSE NSCC_AT1_CRSR                                               
           END-EXEC                                                             
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY '** CAT755 ABENDED: SQL AT1 CURSOR CLOSE - CLT='  CAT755  
                      CLIENT-NBR OF DCLACTIAST                          CAT755  
              MOVE SQLCODE TO WS-DB2-SQLCODE                                    
              DISPLAY 'SQLCODE = ' WS-DB2-SQLCODE                               
              PERFORM 8500-SQL-ERROR                                    CAT755  
           END-IF.                                                              
                                                                                
       6000-EXIT.    EXIT.                                              CAT755  
     *                                                                  CAT755  
       6100-DELETE-ACTIAST-ROW.                                                 
           EXEC SQL DELETE                                                      
               FROM  ACTIAST                                                    
              WHERE  CLIENT_NBR        = :DCLACTIAST.CLIENT-NBR                 
                AND  SECURITY_ADP_NBR  = :DCLACTIAST.SECURITY-ADP-NBR           
           END-EXEC.                                                            
           IF SQLCODE NOT = +0                                                  
              DISPLAY '** CAT755 ABENDED: SQL ACTIAST DELETE - CLT='    CAT755  
                      CLIENT-NBR OF DCLACTIAST                          CAT755  
              MOVE SQLCODE TO WS-DB2-SQLCODE                                    
              DISPLAY 'SQLCODE = ' WS-DB2-SQLCODE                               
              PERFORM 8500-SQL-ERROR                                    CAT755  
           END-IF.                                                              
           ADD 1 TO WS-ACTIAST-DLET-COUNT.                                      
                                                                                
       8500-SQL-ERROR.                                                  CAT755  
           DISPLAY ' '                                                  CAT755  
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT755  
                                    W-DB2-MESSAGE-LEN.                  CAT755  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT755  
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT755  
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT755  
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT755  
                   END-IF                                               CAT755  
           END-PERFORM.                                                 CAT755  
           DISPLAY ' '                                                  CAT755  
                                                                        CAT755  
           PERFORM 8700-SQL-ROLLBACK.                                   CAT755  
                                                                        CAT755  
           DISPLAY 'CAT755: U3999 - ABENDING ON BAD DB2 STATUS'         CAT755  
           DISPLAY 'CAT755: PROGRAM ENDED ABNORMALLY'                   CAT755  
           MOVE +3999    TO ABEND-CODE                                  CAT755  
           CALL ABEND USING ABEND-CODE.                                 CAT755  
      *                                                                 CAT755  
       8700-SQL-ROLLBACK.                                               CAT755  
           EXEC SQL ROLLBACK WORK                                       CAT755  
           END-EXEC                                                     CAT755  
                                                                        CAT755  
           MOVE SQLCA   TO ROLLBACK-SQLCA                               CAT755  
           MOVE SQLCODE TO ROLLBACK-RETURN                              CAT755  
                                                                        CAT755  
           IF ROLLBACK-AB                                               CAT755  
               DISPLAY                                                  CAT755  
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '           CAT755  
                   ROLLBACK-RETURN                                      CAT755  
           ELSE                                                         CAT755  
               DISPLAY                                                  CAT755  
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '       CAT755  
                   ROLLBACK-RETURN                                      CAT755  
           END-IF.                                                      CAT755  
      *#################################################################CAT755  
