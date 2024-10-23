000001* PDX    - CAT892   C0323672 03/12/12 15:55:27 TBLAMUR            00001000
000001* LRM003 - SSR 82591 CORRECT ALPHA BRANCH BUG                             
000001*        - CHANGE SR-WS-BRANCH-N TO BRANCH-X.                             
000001* PDX    - CAT892   C0226568 10/19/05 11:43:35 TBEDTAK            00001000
ET0001* ET0001 - SSR 36630  CORRECT ACATPRV REPORT NOT TO SHOW WITHHELD 05/10/17
ET0001* ET0001 - ASSETS.  SEE PGM CAT31 FOR THE REPORT.                 CAT892  
000001* PDX    - CAT05    C0182051 02/20/03 14:23:32 TBLAMUR            CAT892  
000001* DJ0002 - MARGIN REWRITE: USE ZGETVHOL                           CAT892  
000001* PDX    - CAT05    C0158444 05/07/01 10:51:42 TBLAMUR            CAT892  
000001* PDX    - CAT05    C0129261 08/16/99 10:23:19 TBDOJUN            CAT892  
000001* DJ0001 - ALPHA BRANCH                                           CAT892  
000001* PDX    - CAT05    C0108018 02/27/98 11:10:26 TQCHSCA            CAT892  
000001* PDX    - CAT05    C0105041 01/16/98 10:01:02 TQCHSCA            CAT892  
       IDENTIFICATION DIVISION.                                         CAT892  
       PROGRAM-ID.     CAT892.                                          CAT892  
       DATE-WRITTEN.   NOV. 2005.                                       CAT892  
       DATE-COMPILED.                                                   CAT892  
      *----------------------------------------------------------------*CAT892  
      *REMARKS.                                                         CAT892  
      *  THIS IS A MODIFIED VERSION OF CAT05.                           CAT892  
      *  THE PROGRAM CREATES ACAT ACCOUNT POSITION FILE THAT WILL BE    CAT892  
      *  FED TO REPORT PROGRAM CAT31.                                   CAT892  
      *                                                                 CAT892  
      *   - INPUT                                                       CAT892  
      *     1. B***.CAT890.ACATDEL (ACAT FILE)                          CAT892  
      *     2. S*.***.MGR25.CUSHOL (HOLDERS FILE - VSAM SKIP SEQUENTIAL)CAT892  
      *     3. ACTIAST (ACAT INITIAL ASSET DB2 TABLE)                   CAT892  
      *                                                                 CAT892  
      *   - OUTPUT                                                      CAT892  
      *     1. B***.CAT05.POS31                                         CAT892  
      *----------------------------------------------------------------*CAT892  
           EJECT                                                        CAT892  
       ENVIRONMENT DIVISION.                                            CAT892  
       INPUT-OUTPUT SECTION.                                            CAT892  
       FILE-CONTROL.                                                    CAT892  
           SELECT ACAT-ASSET-FILE   ASSIGN TO UT-S-ASSETFLE.            CAT892  
           SELECT POSITION-FILE     ASSIGN TO UT-S-POSIT.               CAT892  
           SELECT SRMAS-VSAM        ASSIGN TO SRMAS                     CAT892  
                  ACCESS            DYNAMIC                             CAT892  
                  ORGANIZATION      INDEXED                             CAT892  
                  RECORD KEY IS     SRMAS-KEY                           CAT892  
                  FILE STATUS IS    SRMAS-STATUS.                       CAT892  
           EJECT                                                        CAT892  
       DATA DIVISION.                                                   CAT892  
           SKIP1                                                        CAT892  
       FILE SECTION.                                                    CAT892  
       FD  ACAT-ASSET-FILE                                              CAT892  
           RECORDING MODE IS V                                          CAT892  
           LABEL RECORDS ARE STANDARD                                   CAT892  
           BLOCK CONTAINS 0 RECORDS.                                    CAT892  
       01  ASSET-REC                       PIC X(300).                  CAT892  
           SKIP3                                                        CAT892  
       FD  POSITION-FILE                                                CAT892  
           LABEL RECORDS ARE STANDARD                                   CAT892  
           RECORDING MODE IS V                                          CAT892  
           BLOCK CONTAINS 0 RECORDS.                                    CAT892  
       01  POS-REC                         PIC X(230).                  CAT892  
           EJECT                                                        CAT892  
       FD  SRMAS-VSAM                                                   CAT892  
           RECORD IS VARYING.                                           CAT892  
       01  SRMAS-REC.                                                   CAT892  
           05  SRMAS-KEY.                                               CAT892  
               10  SRMAS-KEY-51.                                        CAT892  
                   15  SRMAS-KEY-15     PIC X(15).                      CAT892  
                   15  FILLER           PIC X(36).                      CAT892  
               10  FILLER               PIC X(06).                      CAT892  
           05  FILLER                   PIC X(1162).                    CAT892  
       WORKING-STORAGE SECTION.                                         CAT892  
       77  FILLER               PIC X(16)      VALUE '** CAT892 W-S'.   CAT892  
       77  ABEND-CODE           PIC S9(04) COMP SYNC VALUE ZERO.        CAT892  
       77  SPIEEXIT-KEY-LENGTH  PIC S9(08)     COMP SYNC VALUE ZERO.    CAT892  
       77  SPIEEXIT-GROUP-ID    PIC X(04)      VALUE 'BTS '.            CAT892  
       77  SRMAS-STATUS         PIC X(2)       VALUE ' '.               CAT892  
           88  VALID-SRMAS-STATUS VALUE        '00' '04' '10' '23'.     CAT892  
       77  PREV-ACAT-ACTKEY     PIC X(11)      VALUE ' '.               CAT892  
           COPY STUBCPY.                                                CAT892  
DJ0001 01  W-SRMAS-CNT          PIC 9(09)      VALUE 0.                 CAT892  
           SKIP2                                                        CAT892  
       01  WORK-FIELDS.                                                 CAT892  
         05  WS-VSAM-KEY.                                               CAT892  
           10  WS-ACTKEY.                                               CAT892  
DJ0001       15  WS-CLT          PIC 9(05) COMP-3.                      CAT892  
DJ0001       15  WS-BR           PIC X(03).                             CAT892  
DJ0001       15  WS-ACCT         PIC X(05).                             CAT892  
             15  WS-CURR         PIC X(6).                              CAT892  
DJ0001     10  WS-REMAIN         PIC X(27).                             CAT892  
         05  WS-ACAT-KEY.                                               CAT892  
             15  WS-ACAT-CLT     PIC 9(3) COMP-3.                       CAT892  
LRM003       15  WS-ACAT-BR      PIC X(3).                              CAT892  
LRM003       15  WS-ACAT-ACCT    PIC X(5).                              CAT892  
             15  WS-ACAT-CURR    PIC X.                                 CAT892  
ET0001   05  WS-ACAT-CLT-NUMBER.                                        CAT892  
ET0001     10  WS-ACAT-CLT-NBR-9          PIC 9(04).                    CAT892  
ET0001     10  WS-ACAT-CLT-NBR  REDEFINES WS-ACAT-CLT-NBR-9             CAT892  
ET0001                                    PIC X(04).                    CAT892  
ET0001   05  WS-WTHLD-ASSET-FOUND-SW      PIC X(01).                    CAT892  
ET0001       88  WS-WTHLD-ASSET-FOUND               VALUE 'Y'.          CAT892  
ET0001   05  WS-CSH-MGN-SHT-CD            PIC X(01).                    CAT892  
         05  WK-FIELDS.                                                 CAT892  
             10  WS-ACCT-TYPE.                                          CAT892  
               15  WS-FILLER      PIC X.                                CAT892  
               15  WS-TYPE        PIC 9.                                CAT892  
             10  WS-WI            PIC 9  COMP-3 VALUE 1.                CAT892  
         05  WS-ACCT-ID           PIC 9(10).                            CAT892  
         05  FILLER REDEFINES WS-ACCT-ID.                               CAT892  
             10  FILLER           PIC X(02).                            CAT892  
             10  WS-ACCT-BRANCH   PIC 9(03).                            CAT892  
             10  WS-ACCT-NO       PIC 9(05).                            CAT892  
         05  RCRD-IND-SRMAS       PIC X(01).                            CAT892  
             88  RCRD-FOUND-SRMAS VALUE '1'.                            CAT892  
         05  EOF-IND-SRMAS        PIC X(01).                            CAT892  
             88  END-OF-FILE-SRMAS VALUE '1'.                           CAT892  
         05  WS-MEMO-IND          PIC X(01).                            CAT892  
             88  MEMO-NOT-FOUND    VALUE ' '.                           CAT892  
             88  MEMO-FOUND        VALUE '1'.                           CAT892  
         05  WS-MEMO3-IND         PIC X(01).                            CAT892  
             88  MEMO3-NOT-FOUND   VALUE ' '.                           CAT892  
             88  MEMO3-FOUND       VALUE '1'.                           CAT892  
         05  SUB                  PIC S9(04) COMP VALUE 0.              CAT892  
         05  SUB2                 PIC S9(04) COMP VALUE 0.              CAT892  
         05  SUB3                 PIC S9(04) COMP VALUE 0.              CAT892  
         05  SAVE-SRMAS-KEY-51    PIC X(51)  VALUE SPACES.              CAT892  
         05  WORK-MEMO-QTY        PIC S9(12)V9(5)  COMP-3.              CAT892  
ET0001 01  DSNTIAR                          PIC  X(08)  VALUE 'DSNTIAR'.CAT892  
ET0001 01  WS-DB2-MESSAGE-AREA.                                         CAT892  
ET0001     05  WS-DB2-MSG-LEN       COMP    PIC S9(04)  VALUE +960.     CAT892  
ET0001     05  WS-ERROR-MSG                 PIC  X(80)  OCCURS 12 TIMES CAT892  
ET0001         INDEXED BY WS-ERROR-INDEX.                               CAT892  
ET0001 01  WS-ERR-LINE-LEN                  PIC S9(09) COMP VALUE +80.  CAT892  
ET0001 EJECT                                                            CAT892  
       01  FILLER            PIC X(16)  VALUE 'ACAT-RECORD'.            CAT892  
           SKIP1                                                        CAT892  
       COPY ACATRECC.                                                   CAT892  
           EJECT                                                        CAT892  
       COPY RECDATZC.                                                   CAT892  
      /                                                                 CAT892  
DJ0002 01 GETVHOL-AREA.                                                 CAT892  
DJ0002   05  W-POS3-CNT           PIC 9(09)      VALUE 0.               CAT892  
DJ0002   05  W-OUTPUT-CNT         PIC 9(09)      VALUE 0.               CAT892  
DJ0002 01  GETVHOL                PIC X(008) VALUE  'ZGETVHOL'.         CAT892  
DJ0002     COPY GETVHOLC REPLACING ==:GETVHOL:== BY ==GETVHOL==.        CAT892  
DJ0002 01  POS3-VSAM-REC.                                               CAT892  
DJ0002     05  POS3-VSAM-RECKEY.                                        CAT892  
DJ0002         10  POS3-VSAM-KEY-A.                                     CAT892  
DJ0002             15  POS3-VSAM-CLT             PIC 9(05) COMP-3.      CAT892  
DJ0002             15  POS3-VSAM-BRN             PIC X(03).             CAT892  
DJ0002             15  POS3-VSAM-ACCT            PIC X(05).             CAT892  
DJ0002         10  POS3-VSAM-CUR                 PIC X(06).             CAT892  
DJ0002         10  POS3-VSAM-CUR-N REDEFINES POS3-VSAM-CUR              CAT892  
DJ0002                                           PIC 9(06).             CAT892  
DJ0002         10  POS3-VSAM-REC-TYPE            PIC X(02).             CAT892  
DJ0002         10  POS3-VSAM-ACCT-TYPE           PIC X(02).             CAT892  
DJ0002         10  POS3-VSAM-ACCT-TYPE-N REDEFINES                      CAT892  
DJ0002             POS3-VSAM-ACCT-TYPE           PIC 9(02).             CAT892  
DJ0002         10  POS3-VSAM-SEC-NBR             PIC X(15).             CAT892  
DJ0002         10  POS3-VSAM-WI                  PIC X(01).             CAT892  
DJ0002         10  POS3-VSAM-FILLER              PIC X(01).             CAT892  
DJ0002         10  POS3-VSAM-SEQ                 PIC 9(04).             CAT892  
DJ0002     05  POS3-VSAM-DATA1             PIC X(200).                  CAT892  
DJ0002     05  POS3-VSAM-DATA-IND          PIC S9(1) COMP-3.            CAT892  
DJ0002     05  POS3-VSAM-DATA2             PIC X(127).                  CAT892  
           EJECT                                                        CAT892  
DJ0001 COPY HOLDAVSM.                                                   CAT892  
           EJECT                                                        CAT892  
       COPY POSRECOB.                                                   CAT892  
           EJECT                                                        CAT892  
       COPY BHINFO.                                                     CAT892  
           EJECT                                                        CAT892  
       COPY BHBTS2.                                                     CAT892  
           EJECT                                                        CAT892  
       COPY SRMASREC.                                                   CAT892  
           EJECT                                                        CAT892  
ET0001     EXEC SQL                                                     CAT892  
ET0001        INCLUDE SQLCA                                             CAT892  
ET0001     END-EXEC.                                                    CAT892  
ET0001 EJECT                                                            CAT892  
ET0001     EXEC SQL                                                     CAT892  
ET0001        INCLUDE ACTIAST                                           CAT892  
ET0001     END-EXEC.                                                    CAT892  
ET0001 EJECT                                                            CAT892  
       LINKAGE SECTION.                                                 CAT892  
       01  PROGPARM.                                                    CAT892  
           05  PARMLENGTH           PIC S9(4)   COMP  SYNC.             CAT892  
           05  FILLER               PIC X(09).                          CAT892  
               88  PARM-DATE-CHK    VALUE 'DATE-CHK='.                  CAT892  
           05  PARM-DATE-CHK-ID     PIC X(01).                          CAT892  
           EJECT                                                        CAT892  
       PROCEDURE DIVISION USING PROGPARM.                               CAT892  
           SKIP1                                                        CAT892  
       COPY MSGCOBO.                                                    CAT892  
           SKIP2                                                        CAT892  
           CALL  SPIEEXIT  USING ACAT-RECORD                            CAT892  
                                 SPIEEXIT-KEY-LENGTH                    CAT892  
                                 SPIEEXIT-GROUP-ID.                     CAT892  
           SKIP2                                                        CAT892  
           CALL  LNKDATZ   USING LINK-DATES-AREA.                       CAT892  
           SKIP1                                                        CAT892  
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * CAT892  
      *                        MAIN LINE                                CAT892  
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * CAT892  
           SKIP1                                                        CAT892  
           OPEN INPUT  ACAT-ASSET-FILE                                  CAT892  
                       SRMAS-VSAM                                       CAT892  
                OUTPUT POSITION-FILE.                                   CAT892  
           SKIP1                                                        CAT892  
           IF  NOT VALID-SRMAS-STATUS                                   CAT892  
               DISPLAY ' ** CAT892 - SRMAS VSAM FILE, OPEN ERROR'       CAT892  
                       ' FILE-STATUS = ' SRMAS-STATUS                   CAT892  
               MOVE +1103              TO ABEND-CODE                    CAT892  
DJ0001         GO TO CALL-ABEND-RTN                                     CAT892  
DJ0001     ELSE                                                         CAT892  
DJ0001         DISPLAY 'CAT892: SRMAS VSAM FILE, OPENED'                CAT892  
DJ0001                 ' FILE-STATUS = ' SRMAS-STATUS                   CAT892  
DJ0001     END-IF                                                       CAT892  
                                                                        CAT892  
DJ0002**---OPEN CUSBALV/BALNC FILE AND SPECIFY OLD LAYOUT               CAT892  
DJ0002     MOVE LOW-VALUES       TO GETVHOL-PARM                        CAT892  
DJ0002     MOVE 'CAT892  '       TO GETVHOL-CALLING-PROGRAM             CAT892  
DJ0002     SET GETVHOL-FUNC-OPEN TO TRUE                                CAT892  
DJ0002     SET GETVHOL-FILE-OLD  TO TRUE                                CAT892  
DJ0002     CALL GETVHOL USING GETVHOL-PARM                              CAT892  
DJ0002     IF GETVHOL-SUCCESSFUL                                        CAT892  
DJ0002        CONTINUE                                                  CAT892  
DJ0002     ELSE                                                         CAT892  
DJ0002          DISPLAY 'CAT892: GETVHOL OPEN ERROR'                    CAT892  
DJ0002          DISPLAY 'CAT892: GETVHOL-RETURN-CODE = '                CAT892  
DJ0002                          GETVHOL-RETURN-CODE                     CAT892  
DJ0002          DISPLAY 'CAT892: GETVHOL-FILE-STATUS = '                CAT892  
DJ0002                          GETVHOL-FILE-STATUS                     CAT892  
DJ0002          DISPLAY 'CAT892: U3101 ABEND ON CALL GETVHOL ERROR'     CAT892  
DJ0002          MOVE +3101    TO ABEND-CODE                             CAT892  
DJ0002          GO TO CALL-ABEND-RTN                                    CAT892  
DJ0002     END-IF.                                                      CAT892  
                                                                        CAT892  
           SKIP1                                                        CAT892  
DJ0001     DISPLAY 'CAT892: PERFORM SELECT-TRANSFER-ACCOUNT'            CAT892  
           PERFORM SELECT-TRANSFER-ACCOUNT                              CAT892  
              THRU SELECT-TRANSFER-ACCOUNT-EXIT.                        CAT892  
           SKIP1                                                        CAT892  
DJ0001     DISPLAY 'CAT892: CLOSING FILES'                              CAT892  
           CLOSE ACAT-ASSET-FILE                                        CAT892  
                 SRMAS-VSAM                                             CAT892  
                 POSITION-FILE.                                         CAT892  
                                                                        CAT892  
DJ0002**---CALL GETVHOL TO CLOSE CUSHOLV/DPHLD1 FILE                    CAT892  
DJ0002     SET GETVHOL-FUNC-CLOSE TO TRUE                               CAT892  
DJ0002     CALL GETVHOL USING GETVHOL-PARM.                             CAT892  
                                                                        CAT892  
DJ0001     IF  NOT VALID-SRMAS-STATUS                                   CAT892  
DJ0001         DISPLAY ' ** CAT892 - SRMAS VSAM FILE, CLOSE ERROR'      CAT892  
DJ0001                 ' FILE-STATUS = ' SRMAS-STATUS                   CAT892  
DJ0001         MOVE +1103              TO ABEND-CODE                    CAT892  
DJ0001         GO TO CALL-ABEND-RTN                                     CAT892  
DJ0001     ELSE                                                         CAT892  
DJ0001         DISPLAY 'CAT892: SRMAS VSAM FILE, CLOSED'                CAT892  
DJ0001                 ' FILE-STATUS = ' SRMAS-STATUS                   CAT892  
DJ0001     END-IF                                                       CAT892  
           SKIP1                                                        CAT892  
DJ0002     DISPLAY 'CAT892: W-POS3-CNT  = ' W-POS3-CNT                  CAT892  
DJ0001     DISPLAY 'CAT892: W-SRMAS-CNT = ' W-SRMAS-CNT                 CAT892  
DJ0001     DISPLAY 'CAT892: W-OUTPUT-CNT= ' W-OUTPUT-CNT                CAT892  
DJ0001     DISPLAY 'CAT892: JOB ENDED SUCCESSFULLY'                     CAT892  
           MOVE ZERO                   TO RETURN-CODE.                  CAT892  
           STOP RUN.                                                    CAT892  
           SKIP2                                                        CAT892  
       CALL-ABEND-RTN.                                                  CAT892  
           CALL  ABEND  USING ABEND-CODE.                               CAT892  
           EJECT                                                        CAT892  
       SELECT-TRANSFER-ACCOUNT.                                         CAT892  
                                                                        CAT892  
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   CAT892  
      * * *                                                             CAT892  
      * * *    1. READ ACAT-ASSET-FILE (VARIABLE LENGTH REC)            CAT892  
      * * *    2. DATE-CHECK                                            CAT892  
      * * *    3. BYPASS FILE-CODE = '1'                                CAT892  
      * * *                                                             CAT892  
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   CAT892  
                                                                        CAT892  
       READ-ACAT-ASSET-FILE.                                            CAT892  
           READ ACAT-ASSET-FILE INTO ACAT-RECORD-DATA                   CAT892  
DJ0002          AT END DISPLAY 'CAT892: END OF ACAT-ASSET-FILE REACHED' CAT892  
                       GO TO SELECT-TRANSFER-ACCOUNT-EXIT.              CAT892  
                                                                        CAT892  
           IF ACAT-VSAM-RECKEY = LOW-VALUE                              CAT892  
               IF (ACAT-DATE-MMDDYY NOT = LD-PRIOR-PROC-DATE            CAT892  
                       AND                                              CAT892  
                   PARM-DATE-CHK-ID NOT = 'N')                          CAT892  
                   DISPLAY ' ** CAT892 - DATE ERROR, ACATFL-DATE = '    CAT892  
                           ACAT-DATE-MMDDYY, ', LD-PRIOR-PROC-DATE = '  CAT892  
                           LD-PRIOR-PROC-DATE, ' '                      CAT892  
                   MOVE +1105          TO ABEND-CODE                    CAT892  
                   GO TO CALL-ABEND-RTN                                 CAT892  
               ELSE                                                     CAT892  
                   GO TO READ-ACAT-ASSET-FILE.                          CAT892  
           SKIP1                                                        CAT892  
           IF ACAT-FILE-CODE = '1' OR '2'                               CAT892  
               GO TO READ-ACAT-ASSET-FILE.                              CAT892  
           SKIP1                                                        CAT892  
           IF ACAT-ACTKEY NOT = PREV-ACAT-ACTKEY                        CAT892  
DJ0001         DISPLAY 'ACAT-ACTKEY= ' ACAT-CLT                         CAT892  
DJ0001                             ' ' ACAT-BR                          CAT892  
DJ0001                             ' ' ACAT-ACCT                        CAT892  
DJ0001                             ' ' ACAT-CURR                        CAT892  
               MOVE ACAT-ACTKEY        TO PREV-ACAT-ACTKEY              CAT892  
               IF  ACAT-CLT IS NUMERIC                                  CAT892  
                       PERFORM SELECT-POS3-RECORD                       CAT892  
                          THRU SELECT-POS3-RECORD-EXIT                  CAT892  
DJ0002         END-IF.                                                  CAT892  
           SKIP1                                                        CAT892  
           GO TO READ-ACAT-ASSET-FILE.                                  CAT892  
           SKIP1                                                        CAT892  
       SELECT-TRANSFER-ACCOUNT-EXIT.   EXIT.                            CAT892  
           EJECT                                                        CAT892  
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   CAT892  
      * * *    1. SETUP POS3-VSAM-RECKEY                                CAT892  
      * * *    2. READ  POSITION-FILE SKIP SEQUENTIAL                   CAT892  
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   CAT892  
                                                                        CAT892  
DJ0002 SELECT-POS3-RECORD.                                              CAT892  
DJ0002     MOVE ACAT-CLT               TO WS-CLT.                       CAT892  
DJ0002     MOVE ACAT-BR                TO WS-BR.                        CAT892  
DJ0002     MOVE ACAT-ACCT              TO WS-ACCT.                      CAT892  
DJ0002     MOVE ZEROS                  TO WS-CURR.                      CAT892  
DJ0002     MOVE SPACES                 TO WS-REMAIN.                    CAT892  
DJ0002     MOVE WS-VSAM-KEY            TO POS3-VSAM-RECKEY.             CAT892  
DJ0002                                                                  CAT892  
DJ0002**---DO A SKIP SEQUENTIAL READ TO GET RECORDS FOR THAT ACCOUNT.   CAT892  
DJ0002     MOVE 'S'                    TO GETVHOL-FUNC.                 CAT892  
DJ0002     MOVE WS-VSAM-KEY            TO GETVHOL-KEY                   CAT892  
DJ0002     MOVE SPACES                 TO GETVHOL-PREV-KEY.             CAT892  
DJ0002                                                                  CAT892  
DJ0002 READ-POS3-NEXT.                                                  CAT892  
DJ0002**---DO READNEXT FOR NEXT RECORD FOR THAT ACCOUNT.                CAT892  
DJ0002                                                                  CAT892  
DJ0002     CALL GETVHOL USING GETVHOL-PARM.                             CAT892  
DJ0002                                                                  CAT892  
DJ0002     IF GETVHOL-END-OF-FILE                                       CAT892  
DJ0002        GO TO SELECT-POS3-RECORD-EXIT.                            CAT892  
DJ0002                                                                  CAT892  
DJ0002     IF NOT GETVHOL-SUCCESSFUL                                    CAT892  
DJ0002         DISPLAY 'CAT892: GETVHOL READ ERROR'                     CAT892  
DJ0002         DISPLAY 'CAT892: GETVHOL-RETURN-CODE = '                 CAT892  
DJ0002                         GETVHOL-RETURN-CODE                      CAT892  
DJ0002         DISPLAY 'CAT892: GETVHOL-FILE-STATUS = '                 CAT892  
DJ0002                         GETVHOL-FILE-STATUS                      CAT892  
DJ0002         DISPLAY 'CAT892: U3102 ABEND ON CALL GETVHOL ERROR'      CAT892  
DJ0002         MOVE +3102    TO ABEND-CODE                              CAT892  
DJ0002         GO TO CALL-ABEND-RTN                                     CAT892  
DJ0002     END-IF.                                                      CAT892  
DJ0002                                                                  CAT892  
DJ0002     ADD 1 TO W-POS3-CNT                                          CAT892  
DJ0002                                                                  CAT892  
DJ0002**---MOVE THE OLD RECORD FROM THE PARM AREA                       CAT892  
DJ0002     MOVE GETVHOL-OLD-RECORD   (1:370)                            CAT892  
DJ0002                               TO POS3-VSAM-REC (1:370)           CAT892  
DJ0002                                                                  CAT892  
DJ0002     IF POS3-VSAM-REC-TYPE = HIGH-VALUES                          CAT892  
DJ0002        GO TO READ-POS3-NEXT.                                     CAT892  
DJ0002                                                                  CAT892  
DJ0002     IF POS3-VSAM-ACCT-TYPE NOT NUMERIC                           CAT892  
DJ0002*****DISPLAY 'POS3: BYPASS ACCT TYPE NOT NUMERIC'                 CAT892  
DJ0002*****        ' POS3-VSAM-RECKEY= ' POS3-VSAM-RECKEY               CAT892  
DJ0002        GO TO READ-POS3-NEXT.                                     CAT892  
DJ0002                                                                  CAT892  
DJ0002     MOVE POS3-VSAM-DATA-IND TO CHLD-NUMBER-OF-DESCRIPT.          CAT892  
DJ0002     MOVE POS3-VSAM-REC      TO CHLD-SUMMARY-SEGMENT.             CAT892  
DJ0002                                                                  CAT892  
DJ0002**---REFORMAT THE KEY FOR COMPARING                               CAT892  
DJ0002     MOVE CHLD-COMPANY-CODE       TO  WS-ACAT-CLT.                CAT892  
DJ0002     MOVE CHLD-OFFICE-CODE        TO  WS-ACAT-BR.                 CAT892  
DJ0002     MOVE CHLD-ACCOUNT-NUMBER     TO  WS-ACAT-ACCT.               CAT892  
DJ0002     MOVE LOW-VALUES              TO  WS-ACAT-CURR.               CAT892  
DJ0002                                                                  CAT892  
DJ0002     IF WS-ACAT-KEY NOT = PREV-ACAT-ACTKEY                        CAT892  
DJ0002         GO TO SELECT-POS3-RECORD-EXIT.                           CAT892  
DJ0002                                                                  CAT892  
ET0001     PERFORM 2000-CHECK-WITHHOLD-ASSET                            CAT892  
ET0001        THRU 2000-EXIT.                                           CAT892  
ET0001     IF WS-WTHLD-ASSET-FOUND                                      CAT892  
ET0001        GO TO READ-POS3-NEXT                                      CAT892  
ET0001     END-IF.                                                      CAT892  
ET0001                                                                  CAT892  
DJ0002     PERFORM FORMAT-POS-REC                                       CAT892  
DJ0002        THRU FORMAT-POS-REC-EXIT.                                 CAT892  
DJ0002                                                                  CAT892  
DJ0002     GO TO READ-POS3-NEXT.                                        CAT892  
DJ0002                                                                  CAT892  
DJ0002 SELECT-POS3-RECORD-EXIT. EXIT.                                   CAT892  
      /                                                                 CAT892  
ET0001*                                                                 CAT892  
ET0001*----------------------------------------------------------------*CAT892  
ET0001*           CHECK IF ACCOUNT HAS ANY WITHHELD ASSETS             *CAT892  
ET0001*----------------------------------------------------------------*CAT892  
ET0001 2000-CHECK-WITHHOLD-ASSET.                                       CAT892  
           MOVE SPACE     TO WS-WTHLD-ASSET-FOUND-SW.                   CAT892  
           MOVE ACAT-CLT  TO WS-ACAT-CLT-NBR-9.                         CAT892  
           IF CHLD-ACCOUNT-TYPE = '01'                                  CAT892  
              MOVE 'C' TO WS-CSH-MGN-SHT-CD                             CAT892  
           ELSE                                                         CAT892  
           IF CHLD-ACCOUNT-TYPE = '02'                                  CAT892  
              MOVE 'M' TO WS-CSH-MGN-SHT-CD                             CAT892  
           ELSE                                                         CAT892  
           IF CHLD-ACCOUNT-TYPE = '05'                                  CAT892  
              MOVE 'S' TO WS-CSH-MGN-SHT-CD                             CAT892  
           END-IF.                                                      CAT892  
                                                                        CAT892  
           EXEC SQL                                                     CAT892  
              SELECT                                                    CAT892  
                 CLIENT_NBR                                             CAT892  
                ,DLVR_NBR                                               CAT892  
                ,RCV_NBR                                                CAT892  
                ,ACCT_DLVR_NBR                                          CAT892  
                ,ACCT_RCV_NBR                                           CAT892  
                ,ISIN_SEC_ISSUE_CD                                      CAT892  
                ,ISIN_SEC_CDG_CD                                        CAT892  
                ,STTLM_LCTN_CD                                          CAT892  
                ,CSH_MGN_SHRT_CD                                        CAT892  
                ,ACAT_CONTROL_NBR                                       CAT892  
                ,TRNFR_TYPE_CD                                          CAT892  
                ,ASSET_SEQ_NBR                                          CAT892  
                ,ASSET_PRC_CTGY_CD                                      CAT892  
                ,STTLM_RSN_CD                                           CAT892  
                ,ASSET_QTY                                              CAT892  
                ,PSTN_CD                                                CAT892  
                ,ISO_CRNCY_CD                                           CAT892  
                ,ASSET_AMT                                              CAT892  
                ,WHI_CD                                                 CAT892  
                ,CSH_MRG_SHT_STS_CD                                     CAT892  
                ,TRNFR_TYPE_RSN_CD                                      CAT892  
                ,NSCC_WTHLD_CD                                          CAT892  
                ,OPTN_CTGY_CD                                           CAT892  
                ,TRANS_TYPE_CD                                          CAT892  
                ,SECURITY_ADP_NBR                                       CAT892  
              INTO                                                      CAT892  
                 :DCLACTIAST.CLIENT-NBR                                 CAT892  
                ,:DCLACTIAST.DLVR-NBR                                   CAT892  
                ,:DCLACTIAST.RCV-NBR                                    CAT892  
                ,:DCLACTIAST.ACCT-DLVR-NBR                              CAT892  
                ,:DCLACTIAST.ACCT-RCV-NBR                               CAT892  
                ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                          CAT892  
                ,:DCLACTIAST.ISIN-SEC-CDG-CD                            CAT892  
                ,:DCLACTIAST.STTLM-LCTN-CD                              CAT892  
                ,:DCLACTIAST.CSH-MGN-SHRT-CD                            CAT892  
                ,:DCLACTIAST.ACAT-CONTROL-NBR                           CAT892  
                ,:DCLACTIAST.TRNFR-TYPE-CD                              CAT892  
                ,:DCLACTIAST.ASSET-SEQ-NBR                              CAT892  
                ,:DCLACTIAST.ASSET-PRC-CTGY-CD                          CAT892  
                ,:DCLACTIAST.STTLM-RSN-CD                               CAT892  
                ,:DCLACTIAST.ASSET-QTY                                  CAT892  
                ,:DCLACTIAST.PSTN-CD                                    CAT892  
                ,:DCLACTIAST.ISO-CRNCY-CD                               CAT892  
                ,:DCLACTIAST.ASSET-AMT                                  CAT892  
                ,:DCLACTIAST.WHI-CD                                     CAT892  
                ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                         CAT892  
                ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                          CAT892  
                ,:DCLACTIAST.NSCC-WTHLD-CD                              CAT892  
                ,:DCLACTIAST.OPTN-CTGY-CD                               CAT892  
                ,:DCLACTIAST.TRANS-TYPE-CD                              CAT892  
                ,:DCLACTIAST.SECURITY-ADP-NBR                           CAT892  
              FROM                                                      CAT892  
                 ACTIAST                                                CAT892  
             WHERE                                                      CAT892  
                 CLIENT_NBR = :WS-ACAT-CLT-NBR                          CAT892  
                 AND ACAT_CONTROL_NBR  = :ACAT-CONTROL-NUMBER           CAT892  
                 AND CSH_MGN_SHRT_CD   = :WS-CSH-MGN-SHT-CD             CAT892  
                 AND SECURITY_ADP_NBR  = :CHLD-SECURITY-NUMBER          CAT892  
                 AND NSCC_WTHLD_CD     = 'W'                            CAT892  
           END-EXEC.                                                    CAT892  
                                                                        CAT892  
           IF SQLCODE = 0                                               CAT892  
              SET WS-WTHLD-ASSET-FOUND TO TRUE                          CAT892  
              DISPLAY '  ** WITHHELD ASSET FOUND - SKIP PROCESSING'     CAT892  
                      ' WITHHELD ASSET **'                              CAT892  
              DISPLAY '     SEC-ADP-NBR=' CHLD-SECURITY-NUMBER (1:7)    CAT892  
                      ' ACCT=' ACCT-DLVR-NBR OF DCLACTIAST (1:8)        CAT892  
                      ' ACCT-TYPE=' CHLD-ACCOUNT-TYPE                   CAT892  
                      ' ACAT-CNTRL=' ACAT-CONTROL-NUMBER                CAT892  
                                                                        CAT892  
           ELSE                                                         CAT892  
           IF SQLCODE = +100                                            CAT892  
              CONTINUE                                                  CAT892  
           ELSE                                                         CAT892  
              PERFORM 9000-DB2-ERROR-ROUTINE                            CAT892  
              DISPLAY 'CAT892: U4110 ABEND ON DB2 SQL SELECT STATEMENT' CAT892  
              MOVE +4110 TO ABEND-CODE                                  CAT892  
              PERFORM CALL-ABEND-RTN                                    CAT892  
           END-IF.                                                      CAT892  
ET0001 2000-EXIT.          EXIT.                                        CAT892  
ET0001 EJECT                                                            CAT892  
ET0001*                                                                 CAT892  
DJ0002 FORMAT-POS-REC.                                                  CAT892  
DJ0002                                                                  CAT892  
DJ0002     MOVE SPACES                   TO  POS-RECORD.                CAT892  
DJ0002     MOVE ZEROS                    TO  POS-DLA                    CAT892  
DJ0002                                       POS-TOT-MKT-VALUE          CAT892  
DJ0002                                       POS-REST-UNIT              CAT892  
DJ0002                                       POS-MEMO-QTY(1)            CAT892  
DJ0002                                       POS-MEMO-QTY(2)            CAT892  
DJ0002                                       POS-MEMO-QTY(3)            CAT892  
DJ0002                                       POS-MEMO-QTY(4).           CAT892  
DJ0002     MOVE LOW-VALUE                TO POS-MEMO-CODE(1)            CAT892  
DJ0002                                      POS-MEMO-CODE(2)            CAT892  
DJ0002                                      POS-MEMO-CODE(3)            CAT892  
DJ0002                                      POS-MEMO-CODE(4).           CAT892  
DJ0002     MOVE  WS-ACAT-CLT             TO  POS-CLT.                   CAT892  
DJ0002     MOVE  WS-ACAT-BR              TO  POS-BR.                    CAT892  
DJ0002     MOVE  WS-ACAT-ACCT            TO  POS-ACCT.                  CAT892  
DJ0002     MOVE  LOW-VALUE               TO  POS-CURR.                  CAT892  
DJ0002     MOVE  CHLD-ACCOUNT-TYPE       TO  WS-ACCT-TYPE.              CAT892  
DJ0002     MOVE  WS-TYPE                 TO  POS-TYPE.                  CAT892  
DJ0002     MOVE  CHLD-SECURITY-NUMBER    TO  POS-SEC.                   CAT892  
DJ0002     IF    CHLD-WI-KEY = 1                                        CAT892  
DJ0002           MOVE WS-WI              TO  POS-WI                     CAT892  
DJ0002     ELSE                                                         CAT892  
DJ0002           MOVE LOW-VALUE          TO  POS-WI.                    CAT892  
DJ0002     MOVE  CHLD-SEQ-KEY            TO  POS-SEQ-NO.                CAT892  
DJ0002     MOVE  CHLD-YESTERDAY-TOTAL-UNITS  TO POS-QTY.                CAT892  
DJ0002     MOVE CHLD-CLOSING-PRICE       TO  POS-PRICE-PRT-FORMAT.      CAT892  
DJ0002     MOVE CHLD-EXCHANGE-CODE       TO  POS-EXCH.                  CAT892  
DJ0002     MOVE CHLD-TRAILER-CODE        TO  POS-TRL-CODE.              CAT892  
DJ0002     MOVE CHLD-LAST-ACTIVITY-DATE  TO  POS-DLA.                   CAT892  
DJ0002     MOVE CHLD-MARKET-VALUE        TO  POS-TOT-MKT-VALUE.         CAT892  
DJ0002     MOVE CHLD-HOUSE-PRICE-INDIC   TO  POS-HOUSE-PRC-IND.         CAT892  
DJ0002     MOVE CHLD-NUMBER-RESTRICT-UNITS TO  POS-REST-UNIT.           CAT892  
DJ0002                                                                  CAT892  
DJ0002     IF BH-BROKER-NUMBER-N IS NOT NUMERIC                         CAT892  
DJ0002     OR WS-ACAT-CLT NOT = BH-BROKER-NUMBER-N                      CAT892  
DJ0002         MOVE WS-ACAT-CLT         TO BH-BROKER-NUMBER-N           CAT892  
DJ0002         MOVE '015'               TO BH-LOGICAL-RECORD-CODE       CAT892  
DJ0002         MOVE '511000'            TO BH-B2-INFO-ID-AREA           CAT892  
DJ0002         CALL   GETB1V            USING BH-BROKER-HEADER-INFO     CAT892  
DJ0002                                        BH-BTS2-INFO              CAT892  
DJ0002         END-CALL.                                                CAT892  
DJ0002     MOVE ZEROES                   TO POS-MEMO-QTY-EXCLUDED       CAT892  
DJ0002     IF  BH-BTS2-ACAT-MEMO-CODE-EXCL-NO NUMERIC                   CAT892  
DJ0002     AND BH-BTS2-ACAT-MEMO-CODE-EXCL-NO > 0                       CAT892  
DJ0002         PERFORM CHECK-MEMO-RTN.                                  CAT892  
DJ0002                                                                  CAT892  
DJ0002     IF  BH-BTS2-ACAT-RESTRT-RN-RS-MEMO  =  '1'                   CAT892  
DJ0002         PERFORM  CHECK-FOR-RN-RS-MEMO                            CAT892  
DJ0002     END-IF.                                                      CAT892  
DJ0002                                                                  CAT892  
DJ0002     IF   CHLD-MEMO-CODE(1) NOT = SPACES                          CAT892  
DJ0002        MOVE CHLD-MEMO-CODE(1)     TO POS-MEMO-CODE(1).           CAT892  
DJ0002     MOVE CHLD-MEMO-UNITS(1)       TO POS-MEMO-QTY(1).            CAT892  
DJ0002     IF   CHLD-MEMO-CODE(2) NOT = SPACES                          CAT892  
DJ0002       MOVE CHLD-MEMO-CODE(2)        TO POS-MEMO-CODE(2).         CAT892  
DJ0002     MOVE CHLD-MEMO-UNITS(2)       TO POS-MEMO-QTY(2).            CAT892  
DJ0002     IF   CHLD-MEMO-CODE(3) NOT = SPACES                          CAT892  
DJ0002     MOVE CHLD-MEMO-CODE(3)        TO POS-MEMO-CODE(3).           CAT892  
DJ0002     MOVE CHLD-MEMO-UNITS(3)       TO POS-MEMO-QTY(3).            CAT892  
DJ0002     IF   CHLD-MEMO-CODE(4) NOT = SPACES                          CAT892  
DJ0002     MOVE CHLD-MEMO-CODE(4)        TO POS-MEMO-CODE(4).           CAT892  
DJ0002     MOVE CHLD-MEMO-UNITS(4)       TO POS-MEMO-QTY(4).            CAT892  
DJ0002     PERFORM MOVE-DESC  THRU MOVE-DESC-EXIT.                      CAT892  
DJ0002     ADD 1 TO W-OUTPUT-CNT.                                       CAT892  
DJ0002     WRITE POS-REC     FROM    POS-RECORD.                        CAT892  
DJ0002 FORMAT-POS-REC-EXIT. EXIT.                                       CAT892  
      /                                                                 CAT892  
       MOVE-DESC.                                                       CAT892  
            IF CHLD-NUMBER-OF-DESCRIPT = 0                              CAT892  
               GO TO MOVE-DESC-EXIT.                                    CAT892  
            IF CHLD-NUMBER-OF-DESCRIPT = 1                              CAT892  
               MOVE CHLD-SECURITY-DESC-OCCURS(1)     TO   POS-DESC1     CAT892  
            ELSE                                                        CAT892  
             IF CHLD-NUMBER-OF-DESCRIPT = 2                             CAT892  
               MOVE CHLD-SECURITY-DESC-OCCURS(1)     TO   POS-DESC1     CAT892  
               MOVE CHLD-SECURITY-DESC-OCCURS(2)     TO   POS-DESC2     CAT892  
            ELSE                                                        CAT892  
      ***    IF CHLD-NUMBER-OF-DESCRIPT = 3                             CAT892  
               MOVE CHLD-SECURITY-DESC-OCCURS(1)     TO   POS-DESC1     CAT892  
               MOVE CHLD-SECURITY-DESC-OCCURS(2)     TO   POS-DESC2     CAT892  
               MOVE CHLD-SECURITY-DESC-OCCURS(3)     TO   POS-DESC3.    CAT892  
       MOVE-DESC-EXIT.                                                  CAT892  
           EXIT.                                                        CAT892  
       CHECK-MEMO-RTN.                                                  CAT892  
           COMPUTE WORK-MEMO-QTY = CHLD-MEMO-UNITS(1)                   CAT892  
                                 + CHLD-MEMO-UNITS(2)                   CAT892  
                                 + CHLD-MEMO-UNITS(3)                   CAT892  
                                 + CHLD-MEMO-UNITS(4)                   CAT892  
           IF  WORK-MEMO-QTY > CHLD-YESTERDAY-TOTAL-UNITS               CAT892  
               SET MEMO-EXCLUDED-GREATER       TO TRUE                  CAT892  
           ELSE                                                         CAT892  
               SET MEMO-EXCLUDED-LESS-OR-EQUAL TO TRUE                  CAT892  
           END-IF                                                       CAT892  
           MOVE ZEROES                   TO POS-MEMO-QTY-EXCLUDED       CAT892  
           MOVE LOW-VALUES               TO SR-WS-SEQ.                  CAT892  
           MOVE WS-ACAT-CLT              TO SR-WS-CLIENT-N.             CAT892  
           MOVE SPACES                   TO SR-WS-CUSIP-1-2             CAT892  
                                            SR-WS-CUSIP-12.             CAT892  
           MOVE CHLD-CUSIP-NUMBER        TO SR-WS-CUSIP-3-11.           CAT892  
           MOVE SR-WS-SEQ (1:15)         TO SRMAS-KEY-15                CAT892  
           SET RCRD-FOUND-SRMAS          TO TRUE                        CAT892  
           SET MEMO-NOT-FOUND            TO TRUE                        CAT892  
           START SRMAS-VSAM KEY >= SRMAS-KEY-15                         CAT892  
                 INVALID KEY MOVE SPACE TO RCRD-IND-SRMAS               CAT892  
           END-START                                                    CAT892  
           IF VALID-SRMAS-STATUS                                        CAT892  
            IF RCRD-FOUND-SRMAS                                         CAT892  
               READ SRMAS-VSAM NEXT RECORD INTO SR-WS-RECORD            CAT892  
                            AT END SET END-OF-FILE-SRMAS TO TRUE        CAT892  
               END-READ                                                 CAT892  
LRM003         MOVE '00'                 TO SR-WS-BRANCH(1:2)           CAT892  
LRM003         MOVE WS-ACAT-BR           TO SR-WS-BRANCH(3:3)           CAT892  
               MOVE '00000'              TO SR-WS-ACCOUNT-1-5           CAT892  
               MOVE WS-ACAT-ACCT         TO SR-WS-ACCOUNT-6-10          CAT892  
               MOVE SR-WS-SEQ (1:51) TO SRMAS-KEY-51                    CAT892  
                                        SAVE-SRMAS-KEY-51               CAT892  
               SET RCRD-FOUND-SRMAS      TO TRUE                        CAT892  
               START SRMAS-VSAM KEY = SRMAS-KEY-51                      CAT892  
                     INVALID KEY MOVE SPACE TO RCRD-IND-SRMAS           CAT892  
               END-START                                                CAT892  
               IF  RCRD-FOUND-SRMAS                                     CAT892  
                   READ SRMAS-VSAM NEXT RECORD INTO SR-WS-RECORD        CAT892  
                                AT END SET END-OF-FILE-SRMAS TO TRUE    CAT892  
                   END-READ                                             CAT892  
DJ0001             ADD 1 TO W-SRMAS-CNT                                 CAT892  
                   PERFORM UNTIL END-OF-FILE-SRMAS                      CAT892  
                              OR SR-WS-SEQ (1:51) > SAVE-SRMAS-KEY-51   CAT892  
                              OR MEMO-FOUND                             CAT892  
                       IF  VALID-SRMAS-STATUS                           CAT892  
                           IF  SR-WS-TRID = '5'                         CAT892  
LRM003                     AND SR-WS-BRANCH(3:3) = WS-ACAT-BR           CAT892  
                           AND SR-WS-ACCOUNT-6-10 = WS-ACAT-ACCT        CAT892  
                           AND SR-WS-TYPE = WS-TYPE                     CAT892  
                               PERFORM VARYING SUB FROM 1 BY 1 UNTIL    CAT892  
                                    SUB > BH-BTS2-ACAT-MEMO-CODE-EXCL-NOCAT892  
                                 OR SUB > 20                            CAT892  
                                   SET M-X TO 1                         CAT892  
                                   SEARCH SR-WS-MEMO-QTYS VARYING M-X   CAT892  
                                       AT END CONTINUE                  CAT892  
                                     WHEN SR-WS-MEMO-IND (M-X) =        CAT892  
                                          BH-BTS2-ACAT-MEMO-CODE (SUB)  CAT892  
                                       IF SR-WS-MEMO-IND (M-X) > SPACES CAT892  
                                          ADD SR-WS-MEMO-QTY (M-X)      CAT892  
                                           TO POS-MEMO-QTY-EXCLUDED     CAT892  
                                       END-IF                           CAT892  
                                   END-SEARCH                           CAT892  
                               END-PERFORM                              CAT892  
                           END-IF                                       CAT892  
                       ELSE                                             CAT892  
                           DISPLAY ' ** CAT892 - SRMAS FILE, READ ERROR'CAT892  
                                   ' FILE-STATUS = ' SRMAS-STATUS       CAT892  
                           DISPLAY 'ACAT-ACTKEY = ' ACAT-ACTKEY         CAT892  
                                   'ACAT-CLT    = ' ACAT-CLT            CAT892  
                           MOVE +1202  TO ABEND-CODE                    CAT892  
                           GO TO CALL-ABEND-RTN                         CAT892  
                       END-IF                                           CAT892  
                       READ SRMAS-VSAM NEXT RECORD INTO SR-WS-RECORD    CAT892  
                                AT END SET END-OF-FILE-SRMAS TO TRUE    CAT892  
                       END-READ                                         CAT892  
DJ0002                 ADD 1 TO W-SRMAS-CNT                             CAT892  
                   END-PERFORM                                          CAT892  
               ELSE                                                     CAT892  
                DISPLAY 'RCRD NOT FOUND SRMAS 2: ' SR-WS-SEQ (1:57)     CAT892  
            ELSE                                                        CAT892  
                DISPLAY 'RCRD NOT FOUND SRMAS 1: ' SR-WS-SEQ (1:57)     CAT892  
           ELSE                                                         CAT892  
               DISPLAY ' ** CAT892 - SRMAS FILE, START ERROR'           CAT892  
                       ' FILE-STATUS = ' SRMAS-STATUS                   CAT892  
               DISPLAY 'ACAT-ACTKEY = ' ACAT-ACTKEY                     CAT892  
                       'ACAT-CLT    = ' ACAT-CLT                        CAT892  
               MOVE +1201              TO ABEND-CODE                    CAT892  
               GO TO CALL-ABEND-RTN.                                    CAT892  
                                                                        CAT892  
       CHECK-FOR-RN-RS-MEMO.                                            CAT892  
           MOVE ' '                      TO POS-MEMO-IS-RESTRICTED.     CAT892  
           MOVE LOW-VALUES               TO SR-WS-SEQ.                  CAT892  
           MOVE WS-ACAT-CLT              TO SR-WS-CLIENT-N.             CAT892  
           MOVE SPACES                   TO SR-WS-CUSIP-1-2             CAT892  
                                            SR-WS-CUSIP-12.             CAT892  
           MOVE CHLD-CUSIP-NUMBER        TO SR-WS-CUSIP-3-11.           CAT892  
           MOVE SR-WS-SEQ (1:15)         TO SRMAS-KEY-15                CAT892  
           SET RCRD-FOUND-SRMAS          TO TRUE                        CAT892  
           SET MEMO-NOT-FOUND            TO TRUE                        CAT892  
           START SRMAS-VSAM KEY >= SRMAS-KEY-15                         CAT892  
                 INVALID KEY MOVE SPACE TO RCRD-IND-SRMAS               CAT892  
           END-START                                                    CAT892  
           IF VALID-SRMAS-STATUS                                        CAT892  
            IF RCRD-FOUND-SRMAS                                         CAT892  
               READ SRMAS-VSAM NEXT RECORD INTO SR-WS-RECORD            CAT892  
                            AT END SET END-OF-FILE-SRMAS TO TRUE        CAT892  
               END-READ                                                 CAT892  
LRM003         MOVE ZEROES               TO SR-WS-BRANCH(1:2)           CAT892  
LRM003         MOVE WS-ACAT-BR           TO SR-WS-BRANCH(3:3)           CAT892  
               MOVE '00000'              TO SR-WS-ACCOUNT-1-5           CAT892  
               MOVE WS-ACAT-ACCT         TO SR-WS-ACCOUNT-6-10          CAT892  
               MOVE SR-WS-SEQ (1:51) TO SRMAS-KEY-51                    CAT892  
                                        SAVE-SRMAS-KEY-51               CAT892  
               SET RCRD-FOUND-SRMAS      TO TRUE                        CAT892  
               START SRMAS-VSAM KEY = SRMAS-KEY-51                      CAT892  
                     INVALID KEY MOVE SPACE TO RCRD-IND-SRMAS           CAT892  
               END-START                                                CAT892  
               IF  RCRD-FOUND-SRMAS                                     CAT892  
                   READ SRMAS-VSAM NEXT RECORD INTO SR-WS-RECORD        CAT892  
                                AT END SET END-OF-FILE-SRMAS TO TRUE    CAT892  
                   END-READ                                             CAT892  
DJ0001                 ADD 1 TO W-SRMAS-CNT                             CAT892  
                   PERFORM UNTIL END-OF-FILE-SRMAS                      CAT892  
                              OR SR-WS-SEQ (1:51) > SAVE-SRMAS-KEY-51   CAT892  
                              OR MEMO-FOUND                             CAT892  
                       IF  VALID-SRMAS-STATUS                           CAT892  
                           IF  SR-WS-TRID = '5'                         CAT892  
LRM003                     AND SR-WS-BRANCH(3:3) = WS-ACAT-BR           CAT892  
                           AND SR-WS-ACCOUNT-6-10 = WS-ACAT-ACCT        CAT892  
                           AND SR-WS-TYPE = WS-TYPE                     CAT892  
                             SET M-X TO 1                               CAT892  
                             SEARCH SR-WS-MEMO-QTYS VARYING M-X         CAT892  
                                 AT END CONTINUE                        CAT892  
                               WHEN (SR-WS-MEMO-IND (M-X) = 'RN'        CAT892  
                                 OR  SR-WS-MEMO-IND (M-X) = 'RS')       CAT892  
                                 IF SR-WS-MEMO-IND (M-X) > SPACES       CAT892  
                                    MOVE 'Y' TO POS-MEMO-IS-RESTRICTED  CAT892  
                                 END-IF                                 CAT892  
                             END-SEARCH                                 CAT892  
                           END-IF                                       CAT892  
                       ELSE                                             CAT892  
                           DISPLAY ' ** CAT892 - SRMAS FILE, READ ERROR'CAT892  
                                   ' FILE-STATUS = ' SRMAS-STATUS       CAT892  
                           DISPLAY 'ACAT-ACTKEY = ' ACAT-ACTKEY         CAT892  
                                   'ACAT-CLT    = ' ACAT-CLT            CAT892  
                           MOVE +1202  TO ABEND-CODE                    CAT892  
                           GO TO CALL-ABEND-RTN                         CAT892  
                       END-IF                                           CAT892  
                       READ SRMAS-VSAM NEXT RECORD INTO SR-WS-RECORD    CAT892  
                                AT END SET END-OF-FILE-SRMAS TO TRUE    CAT892  
                       END-READ                                         CAT892  
DJ0001                 ADD 1 TO W-SRMAS-CNT                             CAT892  
                   END-PERFORM                                          CAT892  
               ELSE                                                     CAT892  
                DISPLAY 'RCRD NOT FOUND SRMAS 2: ' SR-WS-SEQ (1:57)     CAT892  
            ELSE                                                        CAT892  
                DISPLAY 'RCRD NOT FOUND SRMAS 1: ' SR-WS-SEQ (1:57)     CAT892  
           ELSE                                                         CAT892  
               DISPLAY ' ** CAT892 - SRMAS FILE, START ERROR'           CAT892  
                       ' FILE-STATUS = ' SRMAS-STATUS                   CAT892  
               DISPLAY 'ACAT-ACTKEY = ' ACAT-ACTKEY                     CAT892  
                       'ACAT-CLT    = ' ACAT-CLT                        CAT892  
               MOVE +1201              TO ABEND-CODE                    CAT892  
               GO TO CALL-ABEND-RTN.                                    CAT892  
ET0001*                                                                 CAT892  
ET0001*-------------------------------------------------------------*   CAT892  
ET0001*       DB2 ERROR ROUTINE                                         CAT892  
ET0001*-------------------------------------------------------------*   CAT892  
ET0001 9000-DB2-ERROR-ROUTINE.                                          CAT892  
           CALL DSNTIAR                  USING  SQLCA                   CAT892  
                                                WS-DB2-MESSAGE-AREA     CAT892  
                                                WS-ERR-LINE-LEN.        CAT892  
                                                                        CAT892  
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   CAT892  
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      CAT892  
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              CAT892  
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        CAT892  
                 END-IF                                                 CAT892  
           END-PERFORM.                                                 CAT892  
                                                                        CAT892  
           CALL  ABEND       USING  ABEND-CODE.                         CAT892  
