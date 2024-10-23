000001* PDX    - CAT814   C0334633 03/14/14 07:30:14 TBCHKOP            00001000
CSG001* SSR 0079666 - CONVERT BOOKKEEPING FILE FROM P2 TO TACT.         00001000
000001* PDX    - CAT814   C0155513 03/12/01 07:58:50 TBDOJUN            00001000
000001* PDX    - CAT814   C0132073 10/01/99 08:37:53 TBLAMUR            00001000
000001* PDX    - CAT814   C0127273 08/16/99 11:53:25 TBDOJUN            00001000
       IDENTIFICATION DIVISION.                                         CAT814  
       PROGRAM-ID.  CAT814.                                             CAT814  
      ***************************************************************** CAT814  
      * THIS PROGRAM DOES NOT CONTAINS DB2.                           * CAT814  
      ***************************************************************** CAT814  
      * CAT814 - CONVENIENCE ACCOUNT HANDLING                         * CAT814  
      *                                                               * CAT814  
      * SELECT FULL TRANSFER DELIVERY REQUESTS ON ACTIVE DB2 TABLE,   * CAT814  
      * WHERE STATUS = 100(REQUEST) OR 110(REQUEST ADJUST).           * CAT814  
      * CHECK B1 TO SEE IF THE CLIENT IS A ACM CLIENT AND             * CAT814  
      * B1#400316, BH-CAM-BANK,MASTER-FORMAT IS A 1,3, OR 8.          * CAT814  
      *                                                               * CAT814  
      * CHECK THE BANK MASTER FOR EACH ACCOUNT TO SEE IF IT HAS       * CAT814  
      * ANY OUTSTANDING AUTHORIZATION ON ITS DEBIT/CREDIT CARD.       * CAT814  
      *                                                               * CAT814  
      * IF THE ACCOUNT HAS OUTSTANDING AUTHORIZATION, THEN THE        * CAT814  
      * BALANCE FILE WILL HAVE TO BE CHECKED TO SEE IF THERE IS       * CAT814  
      * ENOUGH MONEY IN TYPE 4 TO COVER THE OUTSTANDING AMOUNT.       * CAT814  
      *                                                               * CAT814  
      * IF THERE IS NOT ENOUGH MONEY IN TYPE 4, THEN MONEY WILL HAVE  * CAT814  
      * TO MOVED FROM THE OTHER TYPES. BOOKKEEPING RECORDS WILL HAVE  * CAT814  
      * TO BE CREATED TO MOVE THE MONEY AROUND. THE ACATS DATABASE    * CAT814  
      * WILL HAVE TO BE ADJUSTED ALSO.                                * CAT814  
      *                                                               * CAT814  
      * IF THERE IS TOO MUCH MONEY IN TYPE 4, THEN MOVE THE EXCESS    * CAT814  
      * MONEY INTO TYPE 1.                                            * CAT814  
      *                                                               * CAT814  
      * INPUT  -                                                      * CAT814  
      *        - ACATBNK - FROM CAT814DB                              * CAT814  
      *        - B1                                                   * CAT814  
      * OUTPUT -                                                      * CAT814  
      *        - BKPPG   - BOOKKEEPING RECORDS    TO FEED BMD92/TIF   * CAT814  
      *        - ACATCSH - CASH ASSET ADJUSTMENTS TO FEED CAT820DB    * CAT814  
CSG001*        - TACT    - TACT OUTPUT FILE WITH BOOKKEEPING ENTRIES  * CAT814  
      *                                                               * CAT814  
      ***************************************************************** CAT814  
      * 07/12/99 DJ    NEW PROGRAM                                    * CAT814  
      *                                                               * CAT814  
      ***************************************************************** CAT814  
      /                                                                 CAT814  
       ENVIRONMENT DIVISION.                                            CAT814  
       INPUT-OUTPUT SECTION.                                            CAT814  
       FILE-CONTROL.                                                    CAT814  
                                                                        CAT814  
           SELECT INFILE           ASSIGN      TO ACATBNK               CAT814  
                                   FILE STATUS IS INFILE-FILE-STATUS.   CAT814  
                                                                        CAT814  
           SELECT BKPPG            ASSIGN      TO BKPPG                 CAT814  
                                   FILE STATUS IS BKPPG-FILE-STATUS.    CAT814  
                                                                        CAT814  
           SELECT ACATCSH          ASSIGN      TO ACATCSH               CAT814  
                                   FILE STATUS IS ACATCSH-FILE-STATUS.  CAT814  
                                                                        CAT814  
           SELECT SORT-FILE        ASSIGN      TO UT-S-SORTWK01.        CAT814  
      /                                                                 CAT814  
       DATA DIVISION.                                                   CAT814  
       FILE SECTION.                                                    CAT814  
                                                                        CAT814  
       FD  INFILE                                                       CAT814  
           RECORDING MODE F                                             CAT814  
           BLOCK CONTAINS 0 RECORDS                                     CAT814  
           LABEL RECORDS ARE STANDARD.                                  CAT814  
                                                                        CAT814  
           COPY ACATBNK  REPLACING ==:ACATBNK:== BY ==INFILE==.         CAT814  
      /                                                                 CAT814  
       FD  ACATCSH                                                      CAT814  
           RECORDING MODE IS F                                          CAT814  
           BLOCK CONTAINS 0 RECORDS.                                    CAT814  
                                                                        CAT814  
           COPY ACATCSHB REPLACING ==:FMT:== BY ==ACATCSH==.            CAT814  
      /                                                                 CAT814  
       FD  BKPPG                                                        CAT814  
           RECORDING MODE IS F                                          CAT814  
           BLOCK CONTAINS 0 RECORDS.                                    CAT814  
                                                                        CAT814  
       01  BKPPG-RECORD     PIC X(120).                                 CAT814  
      /                                                                 CAT814  
       SD  SORT-FILE.                                                   CAT814  
                                                                        CAT814  
           COPY ACATBNK  REPLACING ==:ACATBNK:== BY ==SORT==.           CAT814  
      /                                                                 CAT814  
       WORKING-STORAGE SECTION.                                         CAT814  
           COPY PDXIDCOB.                                               CAT814  
                                                                        CAT814  
       01  W-FIELDS.                                                    CAT814  
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT814'.    CAT814  
           05  W-ROUTINE                 PIC  X(032) VALUE ' '.         CAT814  
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.         CAT814  
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         CAT814  
               88 NOT-FIRST-TIME                     VALUE '1'.         CAT814  
           05  INFILE-FILE-STATUS        PIC  X(02) VALUE '00'.         CAT814  
               88  INFILE-OKAY           VALUE '00' THRU '09', '97'.    CAT814  
               88  INFILE-END-OF-FILE    VALUE '10'.                    CAT814  
               88  INFILE-DUPE-REC       VALUE '22'.                    CAT814  
               88  INFILE-NOTFND         VALUE '23'.                    CAT814  
               88  INFILE-EMPTY          VALUE '35'.                    CAT814  
           05  BKPPG-FILE-STATUS         PIC  X(02) VALUE '00'.         CAT814  
               88  BKPPG-OKAY            VALUE '00' THRU '09', '97'.    CAT814  
               88  BKPPG-END-OF-FILE     VALUE '10'.                    CAT814  
               88  BKPPG-DUPE-REC        VALUE '22'.                    CAT814  
               88  BKPPG-NOTFND          VALUE '23'.                    CAT814  
               88  BKPPG-EMPTY           VALUE '35'.                    CAT814  
           05  ACATCSH-FILE-STATUS       PIC  X(02) VALUE '00'.         CAT814  
               88  ACATCSH-OKAY          VALUE '00' THRU '09', '97'.    CAT814  
               88  ACATCSH-END-OF-FILE   VALUE '10'.                    CAT814  
               88  ACATCSH-DUPE-REC      VALUE '22'.                    CAT814  
               88  ACATCSH-NOTFND        VALUE '23'.                    CAT814  
               88  ACATCSH-EMPTY         VALUE '35'.                    CAT814  
           05  INFILE-DATE-SW            PIC  X(01) VALUE '0'.          CAT814  
               88 INFILE-DATE-FOUND                 VALUE '1'.          CAT814  
           05  END-OF-INFILE-SW          PIC  X(01) VALUE '0'.          CAT814  
               88 END-OF-INFILE                     VALUE '1'.          CAT814  
           05  END-OF-INPUT-SW           PIC  X(001) VALUE '0'.         CAT814  
               88 END-OF-INPUT                       VALUE '1'.         CAT814  
           05  END-OF-SORT-SW            PIC  X(01) VALUE '0'.          CAT814  
               88 END-OF-SORT                       VALUE '1'.          CAT814  
           05  W-RELEASE-CNT             PIC  9(11) VALUE 0.            CAT814  
           05  W-RETURN-CNT              PIC  9(11) VALUE 0.            CAT814  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT814  
           05  FILLER  REDEFINES                                        CAT814  
               W-SYS-DATE.                                              CAT814  
               10  W-UPD-DATE            PIC  X(006).                   CAT814  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT814  
           05  FILLER  REDEFINES                                        CAT814  
               W-SYS-TIME.                                              CAT814  
               10  W-UPD-TIME            PIC  X(006).                   CAT814  
               10  W-UPD-TIME-MS         PIC  X(002).                   CAT814  
           05  LD-PROC-DATE.                                            CAT814  
               10 LD-PROC-DATE-MM        PIC  X(002).                   CAT814  
               10 LD-PROC-DATE-DD        PIC  X(002).                   CAT814  
               10 LD-PROC-DATE-YY        PIC  X(002).                   CAT814  
           05  W-PROC-DT.                                               CAT814  
               10 W-PROC-DT-YEAR         PIC  X(004).                   CAT814  
               10 W-PROC-DT-D1           PIC  X(001) VALUE '-'.         CAT814  
               10 W-PROC-DT-MM           PIC  X(002).                   CAT814  
               10 W-PROC-DT-D2           PIC  X(001) VALUE '-'.         CAT814  
               10 W-PROC-DT-DD           PIC  X(002).                   CAT814  
           05  W-INFILE-CNT              PIC  9(009) VALUE 0.           CAT814  
           05  W-DETAIL-CNT              PIC  9(009) VALUE 0.           CAT814  
           05  W-BKPPG-FILE-CNT          PIC  9(009) VALUE 0.           CAT814  
           05  W-BKPPG-CNT               PIC  9(009) VALUE 0.           CAT814  
           05  W-ACATCSH-FILE-CNT        PIC  9(009) VALUE 0.           CAT814  
           05  W-ACATCSH-CNT             PIC  9(009) VALUE 0.           CAT814  
           05  W-REQ-DAY-1-CNT           PIC  9(009) VALUE 0.           CAT814  
           05  W-SETTLE-CLOSE-CNT        PIC  9(009) VALUE 0.           CAT814  
CSG001***TACT FIELDS                                                            
CSG001     05  W-BKPPG-TACT-FILE-CNT     PIC  9(009) VALUE 0.           CAT814  
CSG001     05  W-BKPPG-TACT-CNT          PIC  9(009) VALUE 0.           CAT814  
CSG001                                                                          
CSG001 01  WS-AUDIT-SEGMENT-INIT.                                               
CSG001     05  FILLER                    PIC X(02)  VALUE 'R1'.                 
CSG001     05  FILLER                    PIC X(08)  VALUE SPACES.               
CSG001     05  FILLER                    PIC 9(04)  VALUE 0.                    
CSG001     05  FILLER                    PIC X(02)  VALUE SPACES.               
CSG001     05  FILLER.                                                          
CSG001         10  FILLER                PIC 9(04)  VALUE 0.                    
CSG001         10  FILLER                PIC 9(04)  VALUE 0.                    
CSG001         10  FILLER                PIC 9(04)  VALUE 0.                    
CSG001         10  FILLER                PIC 9(04)  VALUE 0.                    
CSG001         10  FILLER                PIC 9(04)  VALUE 0.                    
CSG001         10  FILLER                PIC 9(04)  VALUE 0.                    
CSG001         10  FILLER                PIC 9(04)  VALUE 0.                    
CSG001         10  FILLER                PIC 9(02)  VALUE 0.                    
CSG001         10  FILLER                PIC 9(04)  VALUE 0.                    
CSG001         10  FILLER                PIC 9(02)  VALUE 0.                    
CSG001         10  FILLER                PIC 9(04)  VALUE 0.                    
CSG001         10  FILLER                PIC X(15)  VALUE SPACES.               
CSG001         10  FILLER                PIC 9(05)  VALUE 0.                    
CSG001     05  FILLER                    PIC X(324) VALUE SPACES.               
CSG001                                                                          
      /                                                                 CAT814  
       01  FILLER                        PIC X(008) VALUE 'WORKFLDS'.   CAT814  
       01  W-WORK-FIELDS.                                               CAT814  
           05  W-CURRENT-CLIENT          PIC X(004).                    CAT814  
           05  W-CURRENT-CLIENT-N REDEFINES                             CAT814  
               W-CURRENT-CLIENT          PIC 9(004).                    CAT814  
                                                                        CAT814  
      ******************************************************************CAT814  
      * W-CALC-FIELDS - THE SIGN IS REVERSE                            *CAT814  
      ******************************************************************CAT814  
       01  W-CALC-FIELDS.                                               CAT814  
           05  W-BKPG-AMT                   PIC S9(15)V99 VALUE 0.      CAT814  
           05  W-BKPG-ACCT-TYPE             PIC  X(01)    VALUE ' '.    CAT814  
           05  W-BKPG-SIGN                  PIC  X(01)    VALUE ' '.    CAT814  
           05  WS-AMT-OVERFLOW-SW      PIC  X(01)  VALUE '0'.           CAT814  
               88  WS-AMT-OVERFLOW-ZERO            VALUE '0'.           CAT814  
           05  WS-AMT-OVERFLOW         PIC  9(15)V99 VALUE 0.           CAT814  
           05  WS-AMT-FULL             PIC  9(08)V99 VALUE 99999999.99. CAT814  
           05  W-AMT-DISPLAY                PIC 999999999.99-.          CAT814  
           05  W-AMT-DISPLAY-2              PIC 999999999.99-.          CAT814  
      /                                                                 CAT814  
       01  W-CKDIGIT.                                                   CAT814  
           03  W-CKDIGIT-CNT             PIC  9(009) VALUE 0.           CAT814  
           03  W-CK-ACCT-NUM.                                           CAT814  
               05  W-CK-BR-ACCT.                                        CAT814  
                   07  W-CK-BR     PIC  9(003).                         CAT814  
                   07  W-CK-ACCT   PIC  9(005).                         CAT814  
                   07  W-CK-TYP    PIC  9(001).                         CAT814  
                   07  W-CK-CK     PIC  X(001).                         CAT814  
           03  W-CKDIGIT-PARM.                                          CAT814  
               05  W-CKDIGIT-ACCT PIC   X(09).                          CAT814  
               05  W-CKDIGIT-LEN   PIC  9(002) VALUE 9.                 CAT814  
               05  W-CKDIGIT-CK    PIC  X(001) VALUE ' '.               CAT814  
      /                                                                 CAT814  
      ******************************************************************CAT814  
      * P2HDRTRL COMMAREA - USED TO CREATE HEADER AND TRAILER RECORDS  *CAT814  
      ******************************************************************CAT814  
       01  FILLER                        PIC X(008) VALUE 'CP2WS   '.   CAT814  
       01  W-HDR-TRL-LEN                 PIC 9(005) VALUE 120.          CAT814  
                                                                        CAT814  
           COPY CP2WS.                                                  CAT814  
      /                                                                 CAT814  
       01  FILLER                        PIC X(008) VALUE 'ACATBNK='.   CAT814  
                                                                        CAT814  
           COPY ACATBNK  REPLACING ==:ACATBNK:== BY ==ACATBNK==.        CAT814  
      /                                                                 CAT814  
       01                              PIC X(16) VALUE 'P2-RECORD-WS'.  CAT814  
       01  P2-RECORD-WS.                                                CAT814  
           05  P2-TRID                 PIC X(01).                       CAT814  
           05  P2-BATCH                PIC X(02).                       CAT814  
           05  P2-CLNT                 PIC X(03).                       CAT814  
           05  P2-DB-CR                PIC X(01).                       CAT814  
           05  FILLER                  PIC X(15).                       CAT814  
           05  P2-ENTRY                PIC X(03).                       CAT814  
           05  FILLER                  PIC X(05).                       CAT814  
           05  P2-BRCH                 PIC 9(03).                       CAT814  
           05  P2-ACCT                 PIC 9(05).                       CAT814  
           05  P2-TYPE                 PIC 9(01).                       CAT814  
           05  P2-CKDG                 PIC X(01).                       CAT814  
           05  FILLER                  PIC X(02).                       CAT814  
           05  P2-AMT-LOW-VALU         PIC X(01).                       CAT814  
           05  P2-AMT-P                PIC  9(015)V9(002) COMP-3.       CAT814  
           05  P2-DESC                 PIC X(27).                       CAT814  
           05  FILLER                  PIC X(01).                       CAT814  
                                                                        CAT814  
       01  P2-RECORD-TRL-WS.                                            CAT814  
           05  FILLER                  PIC X(22).                       CAT814  
           05  P2-ENTRY-TRL            PIC X(03).                       CAT814  
           05  FILLER                  PIC X(17).                       CAT814  
           05  P2-AMOUNT-TRL           PIC X(10).                       CAT814  
           05  P2-DESC-TRL             PIC X(27).                       CAT814  
           05  P2-HYPHEN-TRL           PIC X(01).                       CAT814  
      /                                                                 CAT814  
      ******************************************************************CAT814  
      * B1 HEADER                                                      *CAT814  
      ******************************************************************CAT814  
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    CAT814  
           COPY BHINFO.                                                 CAT814  
      /                                                                 CAT814  
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    CAT814  
           COPY BHACAT.                                                 CAT814  
      /                                                                 CAT814  
       01  FILLER                        PIC X(08) VALUE 'BHCAMS  '.    CAT814  
           COPY BHCAMS.                                                 CAT814  
      /                                                                 CAT814  
CSG001 01  FILLER                        PIC X(10) VALUE 'TACTIO:'.     CBA11   
CSG001     COPY TACTIOC   REPLACING ==:TACTIO:== BY ==TACTIO==.         CBA11   
CSG001/                                                                 CBA11   
CSG001 01  FILLER                        PIC X(10) VALUE 'RECTACT:'.    CBA11   
CSG001     COPY RECTACT   REPLACING ==:CI:== BY ==TACT==.               CBA11   
CSG001/                                                                 CBA11   
      ******************************************************************CAT814  
      * BPDATE COMMAREA                                                *CAT814  
      ******************************************************************CAT814  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT814  
                                                                        CAT814  
           COPY BPDATESC.                                               CAT814  
      /                                                                 CAT814  
      ***--->COBOL LE                                                   CAT814  
       01  W-ABEND-AREA.                                                CAT814  
           03  ABEND-CD                  PIC S9(04) COMP SYNC.          CAT814  
                                                                        CAT814  
           COPY STUBCPY.                                                CAT814  
           03  CKDIGIT                   PIC X(008) VALUE 'CKDIGIT'.    CAT814  
      ***<---COBOL LE                                                   CAT814  
       01  FILLER                        PIC  X(008) VALUE 'END-O-WS'.  CAT814  
      /                                                                 CAT814  
      ***************************************************************** CAT814  
      *    LINKAGE SECTION                                            * CAT814  
      ***************************************************************** CAT814  
       LINKAGE SECTION.                                                 CAT814  
       01  L-JCL-PARMS.                                                 CAT814  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT814  
           05  L-STREAM                  PIC  X(001).                   CAT814  
               88  L-ALL-STREAM                      VALUE 'Z'.         CAT814  
           05  L-BYP-DATECHK-SW          PIC  X(001).                   CAT814  
               88  L-BYP-DATECHK                     VALUE '1'.         CAT814  
           05  L-BYP-FILECHK-SW          PIC  X(001).                   CAT814  
               88  L-BYP-FILECHK                     VALUE '1'.         CAT814  
                                                                        CAT814  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT814  
      *                         ===========                             CAT814  
       0000-MAIN SECTION.                                               CAT814  
           DISPLAY 'CAT814 - CONVENIENCE ACCOUNTS PROCESSING'.          CAT814  
           DISPLAY '         READ ACATBNK FROM CAT814DB'                CAT814  
                       ' AND CREATE BOOKKEEPING AND ADJUSTMENTS'.       CAT814  
           DISPLAY ' '.                                                 CAT814  
           COPY MSGCOBO.                                                CAT814  
           DISPLAY ' '.                                                 CAT814  
                                                                        CAT814  
                                                                        CAT814  
           PERFORM 1000-INIT          THRU 1000-EXIT.                   CAT814  
                                                                        CAT814  
           SORT SORT-FILE ON ASCENDING SORT-KEY                         CAT814  
                INPUT  PROCEDURE IS 2000-SORT-INPUT  THRU 2000-EXIT     CAT814  
                OUTPUT PROCEDURE IS 5000-SORT-OUTPUT THRU 5000-EXIT.    CAT814  
                                                                        CAT814  
           PERFORM 9000-CLOSE-ROUTINE THRU 9000-EXIT.                   CAT814  
                                                                        CAT814  
           GOBACK.                                                      CAT814  
      /                                                                 CAT814  
       1000-INIT SECTION.                                               CAT814  
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.        CAT814  
                                                                        CAT814  
           ACCEPT W-SYS-DATE              FROM DATE.                    CAT814  
           ACCEPT W-SYS-TIME              FROM TIME.                    CAT814  
           DISPLAY 'CAT814: SYS-DATE ' W-SYS-DATE                       CAT814  
                          ' SYS-TIME ' W-SYS-TIME.                      CAT814  
                                                                        CAT814  
           DISPLAY 'CAT814: L-STREAM         = '                        CAT814  
                            L-STREAM                                    CAT814  
           DISPLAY 'CAT814: L-BYP-DATECHK-SW = '                        CAT814  
                            L-BYP-DATECHK-SW                            CAT814  
           ' (1=BYPASS DATE CHECK)'                                     CAT814  
           DISPLAY 'CAT814: L-BYP-FILECHK-SW = '                        CAT814  
                            L-BYP-FILECHK-SW                            CAT814  
           ' (1=BYPASS FILE CHECK. BYPASS EMPTY FILE,DB2 ABENDS.)'      CAT814  
           IF  L-BYP-DATECHK                                            CAT814  
               DISPLAY 'CAT814: DATE CHECK WILL BE BYPASSED'            CAT814  
           ELSE                                                         CAT814  
               DISPLAY 'CAT814: DATE CHECK WILL BE PERFORMED'           CAT814  
           END-IF.                                                      CAT814  
           IF  L-BYP-FILECHK                                            CAT814  
               DISPLAY 'CAT814: FILE CHECK WILL BE BYPASSED'            CAT814  
           ELSE                                                         CAT814  
               DISPLAY 'CAT814: FILE CHECK WILL BE PERFORMED'           CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
           MOVE 'CAT814'                 TO BPDATES-CALLING-PGM.        CAT814  
           SET  LNKDATZ-REQUEST          TO TRUE.                       CAT814  
           CALL  BPDATES  USING BPDATES-PARAMETERS.                     CAT814  
           MOVE BPD-PROC-DATE(3:2)       TO LD-PROC-DATE-YY.            CAT814  
           MOVE BPD-PROC-DATE(5:2)       TO LD-PROC-DATE-MM.            CAT814  
           MOVE BPD-PROC-DATE(7:2)       TO LD-PROC-DATE-DD.            CAT814  
           MOVE BPD-PROC-DATE(1:4)       TO W-PROC-DT-YEAR.             CAT814  
           MOVE BPD-PROC-DATE(5:2)       TO W-PROC-DT-MM.               CAT814  
           MOVE BPD-PROC-DATE(7:2)       TO W-PROC-DT-DD.               CAT814  
                                                                        CAT814  
           DISPLAY ' '.                                                 CAT814  
           DISPLAY 'CAT814:       BPD-PROC-DATE= ' BPD-PROC-DATE        CAT814  
                                '  LD-PROC-DATE= ' LD-PROC-DATE.        CAT814  
           DISPLAY 'CAT814: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE. CAT814  
           DISPLAY 'CAT814:         W-PROC-DT  = ' W-PROC-DT            CAT814  
           DISPLAY ' '.                                                 CAT814  
                                                                        CAT814  
           MOVE '000'                 TO BH-BROKER-NUMBER               CAT814  
                                                                        CAT814  
           OPEN INPUT  INFILE.                                          CAT814  
           DISPLAY 'CAT814: ACATBNK  OPENED FOR INPUT  '                CAT814  
                       ' FILE STATUS = ' INFILE-FILE-STATUS.            CAT814  
           IF  INFILE-OKAY                                              CAT814  
               CONTINUE                                                 CAT814  
           ELSE                                                         CAT814  
               MOVE 3002      TO ABEND-CD                               CAT814  
               DISPLAY ' '                                              CAT814  
               DISPLAY 'CAT814: U3002 - DD ACATBNK OPEN ERR, '          CAT814  
                       ' FILE STATUS = ' INFILE-FILE-STATUS             CAT814  
               CALL  ABEND  USING ABEND-CD                              CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
           PERFORM 3000-READ-INFILE THRU 3000-EXIT.                     CAT814  
                                                                        CAT814  
           IF  END-OF-INFILE                                            CAT814  
               DISPLAY 'CAT814: ACATBNK  END OF FILE REACHED'           CAT814  
               IF L-BYP-FILECHK                                         CAT814  
                      DISPLAY 'CAT814: BYPASSING FILE CHECK PER JCLPARM'CAT814  
                      GO TO 1000-CONT                                   CAT814  
               ELSE                                                     CAT814  
                      DISPLAY 'CAT814: U3003 - ABENDING ON EMPTY FILE'  CAT814  
                      MOVE +3003      TO ABEND-CD                       CAT814  
                      CALL  ABEND  USING ABEND-CD                       CAT814  
               END-IF                                                   CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
           IF  INFILE-HEADER-RECORD                                     CAT814  
               SET INFILE-DATE-FOUND TO TRUE                            CAT814  
               DISPLAY 'CAT814: ACATBNK  PROC-DATE = '                  CAT814  
                                              INFILE-HDR-PROC-DATE      CAT814  
                             ', UPDT BY PGM=' INFILE-HDR-PGM-NAME       CAT814  
                                     ' DATE=' INFILE-HDR-SYS-DATE       CAT814  
                                     ' TIME=' INFILE-HDR-SYS-TIME       CAT814  
               IF  INFILE-HDR-PROC-DATE = LD-PROC-DATE                  CAT814  
                   DISPLAY 'CAT814: ACATBNK  PROC-DATE = LD-PROC-DATE.' CAT814  
                                  ' OKAY.'                              CAT814  
               ELSE                                                     CAT814  
                   DISPLAY 'CAT814: ACATBNK  DATE NOT = LD-PROC-DATE'   CAT814  
                   IF L-BYP-DATECHK                                     CAT814  
                   DISPLAY 'CAT814: BYPASSING DATE CHECK PER JCLPARM'   CAT814  
                   ELSE                                                 CAT814  
                      DISPLAY 'CAT814: U3004 - ABENDING ON BAD DATE'    CAT814  
                      MOVE +3004      TO ABEND-CD                       CAT814  
                      CALL  ABEND  USING ABEND-CD                       CAT814  
                   END-IF                                               CAT814  
               END-IF                                                   CAT814  
               PERFORM 3000-READ-INFILE THRU 3000-EXIT                  CAT814  
           ELSE                                                         CAT814  
               DISPLAY 'CAT814: ACATBNK  DATE RECORD MISSING'           CAT814  
                   IF L-BYP-DATECHK                                     CAT814  
                   DISPLAY 'CAT814: BYPASSING DATE CHECK PER JCLPARM'   CAT814  
                   ELSE                                                 CAT814  
                      DISPLAY 'CAT814: U3005 - ABENDING ON BAD DATE'    CAT814  
                      MOVE +3005      TO ABEND-CD                       CAT814  
                      CALL  ABEND  USING ABEND-CD                       CAT814  
                   END-IF                                               CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
       1000-CONT.                                                       CAT814  
                                                                        CAT814  
           OPEN OUTPUT ACATCSH.                                         CAT814  
           DISPLAY 'CAT814: ACATCSH  OPENED FOR OUTPUT. STATUS = '      CAT814  
                                               ACATCSH-FILE-STATUS.     CAT814  
                                                                        CAT814  
           IF  ACATCSH-OKAY                                             CAT814  
               CONTINUE                                                 CAT814  
           ELSE                                                         CAT814  
               DISPLAY 'CAT814: ERROR OPENING ACATCSH'                  CAT814  
               DISPLAY 'CAT814: OPEN STATUS = ' ACATCSH-FILE-STATUS     CAT814  
                            '.  OUTPUT-CNT = ' W-ACATCSH-CNT            CAT814  
               DISPLAY 'CAT814: U3001 - ABENDING ON BAD FILE STATUS'    CAT814  
               MOVE +3001 TO ABEND-CD                                   CAT814  
               CALL  ABEND  USING ABEND-CD                              CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
           OPEN OUTPUT BKPPG.                                           CAT814  
           DISPLAY 'CAT814: BKPPG    OPENED FOR OUTPUT. STATUS = '      CAT814  
                                               BKPPG-FILE-STATUS.       CAT814  
                                                                        CAT814  
           IF  BKPPG-OKAY                                               CAT814  
               CONTINUE                                                 CAT814  
           ELSE                                                         CAT814  
               DISPLAY 'CAT814: ERROR OPENING BKPPG'                    CAT814  
               DISPLAY 'CAT814: OPEN STATUS = ' BKPPG-FILE-STATUS       CAT814  
                            '.  OUTPUT-CNT = ' W-BKPPG-CNT              CAT814  
               DISPLAY 'CAT814: U3001 - ABENDING ON BAD FILE STATUS'    CAT814  
               MOVE +3001 TO ABEND-CD                                   CAT814  
               CALL  ABEND  USING ABEND-CD                              CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
           MOVE ' '                      TO BKPPG-RECORD                CAT814  
           MOVE 'H'                      TO CP2-REQUEST-CODE.           CAT814  
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.             CAT814  
           MOVE 999                      TO CP2-CLIENT-NUMBER.          CAT814  
                                                                        CAT814  
           CALL  P2HDTR               USING CP2-AREA                    CAT814  
                                            BKPPG                       CAT814  
                                                                        CAT814  
           MOVE CP2-RETURN-RECORD        TO BKPPG-RECORD                CAT814  
           DISPLAY 'CAT814: BKPPG    HEADER= ' BKPPG-RECORD (1:90)      CAT814  
                                                                        CAT814  
           ADD 1 TO W-BKPPG-FILE-CNT                                    CAT814  
           WRITE BKPPG-RECORD.                                          CAT814  
           DISPLAY 'CAT814: BKPPG    HEADER WRITTEN.    STATUS = '      CAT814  
                                               BKPPG-FILE-STATUS.       CAT814  
                                                                        CAT814  
           DISPLAY ' '.                                                 CAT814  
CSG001***  CALL IO TO OPEN TACT FILE                                    CBA11   
CSG001***  CALL IO TO CREATE HEADER RECORD                              CBA11   
CSG001     ADD 1 TO W-BKPPG-TACT-FILE-CNT                               CBA11   
CSG001     PERFORM 8000-OPEN-TACT-FILE     THRU 8000-EXIT               CBA11   
CSG001     PERFORM 8100-WRITE-TACT-HEADER  THRU 8100-EXIT.              CBA11   
CSG001     DISPLAY 'CAT814: BKPPG TA HEADER WRITTEN.    STATUS = '      CAT814  
CSG001                                         TACTIO-FILE-STATUS       CAT814  
CSG001     DISPLAY ' '.                                                 CAT814  
                                                                        CAT814  
       1000-EXIT. EXIT.                                                 CAT814  
      /                                                                 CAT814  
       2000-SORT-INPUT SECTION.                                         CAT814  
                                                                        CAT814  
           PERFORM UNTIL INFILE-END-OF-FILE                             CAT814  
                                                                        CAT814  
               PERFORM 2200-RELEASE-SORT THRU 2200-EXIT                 CAT814  
               PERFORM 3000-READ-INFILE  THRU 3000-EXIT                 CAT814  
                                                                        CAT814  
           END-PERFORM.                                                 CAT814  
                                                                        CAT814  
       2000-EXIT.                                                       CAT814  
           EXIT.                                                        CAT814  
                                                                        CAT814  
       2200-RELEASE-SORT   SECTION.                                     CAT814  
           MOVE '2200-FORMAT-SORT              ' TO W-ROUTINE-1.        CAT814  
                                                                        CAT814  
           IF  INFILE-PROCESS-IND = 'Y'                                 CAT814  
               MOVE INFILE-RECORD TO SORT-RECORD                        CAT814  
               RELEASE SORT-RECORD                                      CAT814  
               ADD 1 TO W-RELEASE-CNT                                   CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
       2200-EXIT.                                                       CAT814  
           EXIT.                                                        CAT814  
      /                                                                 CAT814  
       3000-READ-INFILE.                                                CAT814  
                                                                        CAT814  
           READ INFILE                                                  CAT814  
                AT END                                                  CAT814  
                   MOVE '1'              TO END-OF-INFILE-SW            CAT814  
                   DISPLAY 'CAT814: ACATBNK  END OF FILE REACHED'       CAT814  
                   GO TO 3000-EXIT                                      CAT814  
           END-READ.                                                    CAT814  
                                                                        CAT814  
           IF  INFILE-FILE-STATUS NOT = '00'                            CAT814  
               DISPLAY 'CAT814: READ INFILE STATUS = '                  CAT814  
                                                   INFILE-FILE-STATUS   CAT814  
                       '.  INFILE-CNT = ' W-INFILE-CNT                  CAT814  
                       '.  KEY = ' INFILE-KEY                           CAT814  
                   DISPLAY ' '                                          CAT814  
                   DISPLAY 'CAT814: U3009 - DD INFILE READ ERR, '       CAT814  
                           ' FILE STATUS = ' INFILE-FILE-STATUS         CAT814  
                   MOVE 3009      TO ABEND-CD                           CAT814  
                   CALL  ABEND  USING ABEND-CD                          CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
           ADD 1 TO W-INFILE-CNT.                                       CAT814  
                                                                        CAT814  
           IF  INFILE-TRAILER-RECORD                                    CAT814  
               DISPLAY 'CAT814: ACATBNK  REC-CNT = '                    CAT814  
                                              INFILE-TRL-REC-CNT        CAT814  
               GO TO 3000-READ-INFILE                                   CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
       3000-EXIT. EXIT.                                                 CAT814  
      /                                                                 CAT814  
       5000-SORT-OUTPUT SECTION.                                        CAT814  
           MOVE '5000-SORT-OUTPUT              ' TO W-ROUTINE.          CAT814  
                                                                        CAT814  
           DISPLAY 'CAT814: PERFORMING 5000-SORT-OUTPUT'.               CAT814  
                                                                        CAT814  
           PERFORM 5100-RETURN-SORT THRU 5100-EXIT.                     CAT814  
                                                                        CAT814  
           PERFORM UNTIL END-OF-SORT                                    CAT814  
                                                                        CAT814  
               MOVE SORT-RECORD          TO ACATBNK-RECORD              CAT814  
                                                                        CAT814  
               IF  ACATBNK-CLIENT-NBR NOT = W-CURRENT-CLIENT            CAT814  
                   PERFORM 5200-GETB1 THRU 5200-EXIT                    CAT814  
               END-IF                                                   CAT814  
               MOVE ACATBNK-CLIENT-NBR   TO W-CURRENT-CLIENT            CAT814  
               MOVE ACATBNK-PENDING-AMT  TO W-AMT-DISPLAY               CAT814  
               MOVE ACATBNK-BAL-AMT (4)  TO W-AMT-DISPLAY-2             CAT814  
               DISPLAY 'INP=' W-RETURN-CNT                              CAT814  
                          ' ' ACATBNK-CLIENT-NBR                        CAT814  
                          ' ' ACATBNK-BRANCH-CD                         CAT814  
                          ' ' ACATBNK-ACCT-CD                           CAT814  
                      ' STA=' ACATBNK-STTS-CD                           CAT814  
                      ' DAY=' ACATBNK-DAYS-STTS-QTY                     CAT814  
                       ' SD=' ACATBNK-STTLM-DT                          CAT814  
               DISPLAY '    '                                           CAT814  
                       'AMT=' W-AMT-DISPLAY                             CAT814  
                      ' TP4=' W-AMT-DISPLAY-2                           CAT814  
                                                                        CAT814  
               IF  ACATBNK-STTS-CD < '200'                              CAT814  
                   ADD 1 TO W-REQ-DAY-1-CNT                             CAT814  
               ELSE                                                     CAT814  
                   ADD 1 TO W-SETTLE-CLOSE-CNT                          CAT814  
               END-IF                                                   CAT814  
               PERFORM 5600-CREATE-BKPPG    THRU 5600-EXIT              CAT814  
               PERFORM 5700-WRITE-ACATCSH   THRU 5700-EXIT              CAT814  
                                                                        CAT814  
               PERFORM 5100-RETURN-SORT     THRU 5100-EXIT              CAT814  
                                                                        CAT814  
           END-PERFORM.                                                 CAT814  
                                                                        CAT814  
       5000-EXIT.                                                       CAT814  
           EXIT.                                                        CAT814  
      /                                                                 CAT814  
       5100-RETURN-SORT SECTION.                                        CAT814  
           MOVE '5100-RETURN-SORT              ' TO W-ROUTINE.          CAT814  
                                                                        CAT814  
           RETURN SORT-FILE                                             CAT814  
               AT END                                                   CAT814  
                     MOVE '1'            TO END-OF-SORT-SW              CAT814  
                     DISPLAY 'CAT814: SORT-EOF '                        CAT814  
                                   ' RET=' W-RETURN-CNT                 CAT814  
                     GO TO 5100-EXIT.                                   CAT814  
                                                                        CAT814  
           ADD 1 TO W-RETURN-CNT.                                       CAT814  
                                                                        CAT814  
       5100-EXIT.                                                       CAT814  
           EXIT.                                                        CAT814  
      /                                                                 CAT814  
       5200-GETB1          SECTION.                                     CAT814  
                                                                        CAT814  
           MOVE ACATBNK-CLIENT-NBR       TO W-CURRENT-CLIENT            CAT814  
           MOVE ' '                      TO BH-BROKER-HEADER-INFO       CAT814  
                                            BH-ACAT-INFO                CAT814  
                                            BH-CAM-INFO                 CAT814  
           MOVE W-CURRENT-CLIENT-N       TO BH-BROKER-NUMBER-N          CAT814  
           MOVE '015'                    TO BH-LOGICAL-RECORD-CODE      CAT814  
           MOVE '434500'                 TO BH-B2-INFO-ID               CAT814  
           CALL  GETB1V               USING BH-BROKER-HEADER-INFO       CAT814  
                                            BH-ACAT-INFO                CAT814  
           MOVE '400000'                 TO BH-B2-INFO-ID-AREA          CAT814  
           CALL  GETB1V               USING BH-BROKER-HEADER-INFO       CAT814  
                                            BH-CAM-INFO                 CAT814  
           DISPLAY ' '                                                  CAT814  
           DISPLAY 'NEW-CLIENT = ' BH-BROKER-NUMBER                     CAT814  
                                       ' ' BH-BROKER-NAME               CAT814  
                               ' BRK-NO= ' BH-BROKER-OLD-CLEARING-HOUSE CAT814  
           DISPLAY 'CAT814: BH-ACAT-STATUS                 (434501) = ' CAT814  
                            BH-ACAT-STATUS                              CAT814  
           DISPLAY 'CAT814: BH-ACAT-CONVENIENCE-ACT-CLIENT (434586) = ' CAT814  
                            BH-ACAT-CONVENIENCE-ACT-CLIENT              CAT814  
           DISPLAY 'CAT814: BH-ACAT-CONVENIENC-BATCH-CODE  (434652) = ' CAT814  
                            BH-ACAT-CONVENIENC-BATCH-CODE               CAT814  
           DISPLAY 'CAT814: BH-ACAT-CONVENIENC-ENTRY-CODE  (434652) = ' CAT814  
                            BH-ACAT-CONVENIENC-ENTRY-CODE               CAT814  
           DISPLAY 'CAT814: BH-ACAT-CONVENIENC-DESCRIPTION (434653) = ' CAT814  
                            BH-ACAT-CONVENIENC-DESCRIPTION              CAT814  
           DISPLAY 'CAT814: BH-ACAT-CONVENIENC-TRAILER     (434654) = ' CAT814  
                            BH-ACAT-CONVENIENC-TRAILER                  CAT814  
           DISPLAY 'CAT814: BH-CAM-STATUS                  (400011) = ' CAT814  
                            BH-CAM-STATUS                               CAT814  
           DISPLAY 'CAT814: BH-CAM-BANK-MASTER-FORMAT      (400316) = ' CAT814  
                            BH-CAM-BANK-MASTER-FORMAT                   CAT814  
           .                                                            CAT814  
       5200-EXIT. EXIT.                                                 CAT814  
      /                                                                 CAT814  
       5600-CREATE-BKPPG        SECTION.                                CAT814  
      ***************************************************************** CAT814  
      *  CHECK FOR ADJUSTMENTS AND CREATE BOOKKEEPING RECORDS           CAT814  
      ***************************************************************** CAT814  
           MOVE '5600-CREATE-BKPPG                ' TO W-ROUTINE-1.     CAT814  
                                                                        CAT814  
           IF ACATBNK-REMOVE (1) > 0                                    CAT814  
              MOVE ACATBNK-REMOVE (1)    TO W-BKPG-AMT                  CAT814  
              MOVE '1'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '0'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
           IF ACATBNK-ADD    (1) > 0                                    CAT814  
              MOVE ACATBNK-ADD    (1)    TO W-BKPG-AMT                  CAT814  
              MOVE '4'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '-'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
           IF ACATBNK-REMOVE (2) > 0                                    CAT814  
              MOVE ACATBNK-REMOVE (2)    TO W-BKPG-AMT                  CAT814  
              MOVE '2'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '0'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
           IF ACATBNK-ADD    (2) > 0                                    CAT814  
              MOVE ACATBNK-ADD    (2)    TO W-BKPG-AMT                  CAT814  
              MOVE '4'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '-'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
           IF ACATBNK-REMOVE (3) > 0                                    CAT814  
              MOVE ACATBNK-REMOVE (3)    TO W-BKPG-AMT                  CAT814  
              MOVE '3'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '0'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
           IF ACATBNK-ADD    (3) > 0                                    CAT814  
              MOVE ACATBNK-ADD    (3)    TO W-BKPG-AMT                  CAT814  
              MOVE '4'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '-'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
           IF ACATBNK-REMOVE (4) > 0                                    CAT814  
              MOVE ACATBNK-REMOVE (4)    TO W-BKPG-AMT                  CAT814  
              MOVE '4'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '0'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
           IF ACATBNK-ADD    (4) > 0                                    CAT814  
              MOVE ACATBNK-ADD    (4)    TO W-BKPG-AMT                  CAT814  
              MOVE '1'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '-'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
           IF ACATBNK-REMOVE (6) > 0                                    CAT814  
              MOVE ACATBNK-REMOVE (6)    TO W-BKPG-AMT                  CAT814  
              MOVE '6'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '0'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
           IF ACATBNK-ADD    (6) > 0                                    CAT814  
              MOVE ACATBNK-ADD    (6)    TO W-BKPG-AMT                  CAT814  
              MOVE '4'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '-'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
           IF ACATBNK-REMOVE (7) > 0                                    CAT814  
              MOVE ACATBNK-REMOVE (7)    TO W-BKPG-AMT                  CAT814  
              MOVE '7'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '0'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
           IF ACATBNK-ADD    (7) > 0                                    CAT814  
              MOVE ACATBNK-ADD    (7)    TO W-BKPG-AMT                  CAT814  
              MOVE '4'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '-'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
           IF ACATBNK-REMOVE (8) > 0                                    CAT814  
              MOVE ACATBNK-REMOVE (8)    TO W-BKPG-AMT                  CAT814  
              MOVE '8'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '0'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
           IF ACATBNK-ADD    (8) > 0                                    CAT814  
              MOVE ACATBNK-ADD    (8)    TO W-BKPG-AMT                  CAT814  
              MOVE '4'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '-'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
           IF ACATBNK-REMOVE (9) > 0                                    CAT814  
              MOVE ACATBNK-REMOVE (9)    TO W-BKPG-AMT                  CAT814  
              MOVE '9'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '0'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
           IF ACATBNK-ADD    (9) > 0                                    CAT814  
              MOVE ACATBNK-ADD    (9)    TO W-BKPG-AMT                  CAT814  
              MOVE '4'                   TO W-BKPG-ACCT-TYPE            CAT814  
              MOVE '-'                   TO W-BKPG-SIGN                 CAT814  
              PERFORM 5610-FORMAT-BKPPG THRU 5610-EXIT                  CAT814  
CSG001        PERFORM 5620-FORMAT-TACT  THRU 5620-EXIT                  CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
       5600-EXIT. EXIT.                                                 CAT814  
      /                                                                 CAT814  
       5610-FORMAT-BKPPG        SECTION.                                CAT814  
      ***************************************************************** CAT814  
      *  FORMAT BOOKKEEPING RECORDS TO ADJUST THE BALANCES              CAT814  
      ***************************************************************** CAT814  
           MOVE '5610-FORMAT-BKPPG                ' TO W-ROUTINE-1.     CAT814  
           MOVE W-BKPG-AMT               TO W-AMT-DISPLAY               CAT814  
           DISPLAY '    BKPG TYP=' W-BKPG-ACCT-TYPE                     CAT814  
                               ' ' W-BKPG-SIGN                          CAT814  
                               ' ' W-AMT-DISPLAY                        CAT814  
                                                                        CAT814  
           MOVE SPACES                   TO P2-RECORD-WS.               CAT814  
           MOVE 'B'                      TO P2-TRID                     CAT814  
           IF  BH-ACAT-CONVENIENC-BATCH-CODE NOT >  ' '                 CAT814  
               MOVE 'NS'                 TO P2-BATCH                    CAT814  
           ELSE                                                         CAT814  
               MOVE BH-ACAT-CONVENIENC-BATCH-CODE TO P2-BATCH           CAT814  
           END-IF.                                                      CAT814  
           MOVE ACATBNK-CLIENT-NBR (2:3) TO P2-CLNT.                    CAT814  
           MOVE W-BKPG-SIGN             TO P2-DB-CR                     CAT814  
           IF  BH-ACAT-CONVENIENC-ENTRY-CODE NOT >  ' '                 CAT814  
               MOVE 'ADJ'               TO P2-ENTRY                     CAT814  
           ELSE                                                         CAT814  
               MOVE BH-ACAT-CONVENIENC-ENTRY-CODE  TO P2-ENTRY          CAT814  
           END-IF.                                                      CAT814  
           MOVE ACATBNK-BRANCH-CD        TO P2-BRCH.                    CAT814  
           MOVE ACATBNK-ACCT-CD          TO P2-ACCT.                    CAT814  
           MOVE W-BKPG-ACCT-TYPE         TO P2-TYPE.                    CAT814  
                                                                        CAT814  
           MOVE P2-BRCH                  TO W-CK-BR                     CAT814  
           MOVE P2-ACCT                  TO W-CK-ACCT                   CAT814  
           MOVE P2-TYPE                  TO W-CK-TYP                    CAT814  
           MOVE ' '                      TO W-CK-CK                     CAT814  
           MOVE W-CK-ACCT-NUM            TO W-CKDIGIT-ACCT              CAT814  
           MOVE 9                        TO W-CKDIGIT-LEN               CAT814  
           MOVE SPACE                    TO W-CKDIGIT-CK                CAT814  
           CALL  CKDIGIT              USING W-CKDIGIT-ACCT              CAT814  
                                            W-CKDIGIT-LEN               CAT814  
                                            W-CKDIGIT-CK                CAT814  
           ADD 1 TO W-CKDIGIT-CNT                                       CAT814  
                                                                        CAT814  
           MOVE W-CKDIGIT-CK             TO P2-CKDG.                    CAT814  
                                                                        CAT814  
           IF  BH-ACAT-CONVENIENC-DESCRIPTION  NOT >  ' '               CAT814  
               MOVE 'TRF FUNDS BETWEEN TYPES' TO P2-DESC                CAT814  
           ELSE                                                         CAT814  
               MOVE BH-ACAT-CONVENIENC-DESCRIPTION TO P2-DESC           CAT814  
           END-IF.                                                      CAT814  
           MOVE '1'                      TO WS-AMT-OVERFLOW-SW.         CAT814  
           MOVE LOW-VALUE                TO P2-AMT-LOW-VALU.            CAT814  
           MOVE W-BKPG-AMT               TO P2-AMT-P                    CAT814  
           ADD 1 TO W-BKPPG-CNT                                         CAT814  
           ADD 1 TO W-BKPPG-FILE-CNT                                    CAT814  
           WRITE  BKPPG-RECORD FROM P2-RECORD-WS                        CAT814  
           IF  BH-ACAT-CONVENIENC-TRAILER      NOT >  ' '               CAT814  
               CONTINUE                                                 CAT814  
           ELSE                                                         CAT814  
               MOVE P2-RECORD-WS         TO P2-RECORD-TRL-WS            CAT814  
               MOVE ' '                  TO P2-ENTRY-TRL                CAT814  
               MOVE ' '                  TO P2-AMOUNT-TRL               CAT814  
               MOVE BH-ACAT-CONVENIENC-TRAILER                          CAT814  
                                         TO P2-DESC-TRL                 CAT814  
               MOVE '-'                  TO P2-HYPHEN-TRL               CAT814  
               ADD 1 TO W-BKPPG-CNT                                     CAT814  
               ADD 1 TO W-BKPPG-FILE-CNT                                CAT814  
               WRITE BKPPG-RECORD FROM P2-RECORD-TRL-WS                 CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
       5610-EXIT. EXIT.                                                 CAT814  
      /                                                                 CAT814  
CSG001 5620-FORMAT-TACT         SECTION.                                CAT814  
CSG001***************************************************************** CAT814  
CSG001*  FORMAT BOOKKEEPING RECORDS TO ADJUST THE BALANCES              CAT814  
CSG001***************************************************************** CAT814  
CSG001     MOVE '5620-FORMAT-TACT                 ' TO W-ROUTINE-1.     CAT814  
CSG001     MOVE W-BKPG-AMT      TO W-AMT-DISPLAY                        CAT814  
CSG001     DISPLAY '    BKPG TYP=' W-BKPG-ACCT-TYPE                     CAT814  
CSG001                         ' ' W-BKPG-SIGN                          CAT814  
CSG001                         ' ' W-AMT-DISPLAY                        CAT814  
CSG001***  FORMAT FIELDS ON TACT RECORD                                 CBA11   
CSG001     MOVE SPACES                      TO TACT-RECORD.             CBA11   
CSG001                                                                  CBA11   
CSG001*--- SET UP BASE SEGMENT                                          CBA11   
CSG001     MOVE 'D1'                        TO TACT-D-SEG-ID.           CBA11   
CSG001     MOVE 'CAT814'                    TO TACT-D-SEG-FOOTPRINT.    CBA11   
CSG001     MOVE 0700                        TO TACT-D-SEG-LEN.          CBA11   
CSG001     MOVE 'CAT814'                    TO TACT-TRANS-SRC-CODE.     CBA11   
CSG001     MOVE 'BKJ'                       TO TACT-TRANSACTION-TYPE.   CBA11   
CSG001                                                                          
CSG001     MOVE 'B'                         TO TACT-TRID                CAT814  
CSG001                                                                          
CSG001     IF  BH-ACAT-CONVENIENC-BATCH-CODE NOT >  ' '                 CAT814  
CSG001         MOVE 'NS'                    TO TACT-BATCH-CODE          CAT814  
CSG001     ELSE                                                         CAT814  
CSG001         MOVE BH-ACAT-CONVENIENC-BATCH-CODE TO TACT-BATCH-CODE    CAT814  
CSG001     END-IF.                                                      CAT814  
CSG001                                                                          
CSG001     MOVE ACATBNK-CLIENT-NBR (2:3)    TO TACT-CLIENT.             CAT814  
CSG001                                                                          
CSG001     IF W-BKPG-SIGN = '0'                                                 
CSG001        MOVE  ' D'                    TO TACT-BUY-SELL-CODE               
CSG001     ELSE                                                                 
CSG001        IF W-BKPG-SIGN = '-'                                              
CSG001           MOVE  ' C'                 TO TACT-BUY-SELL-CODE               
CSG001        END-IF                                                            
CSG001     END-IF                                                               
CSG001                                                                          
CSG001     IF  BH-ACAT-CONVENIENC-ENTRY-CODE NOT >  ' '                 CAT814  
CSG001         MOVE 'ADJ'                   TO TACT-ENTRY-CODE(1:3)     CAT814  
CSG001     ELSE                                                         CAT814  
CSG001         MOVE BH-ACAT-CONVENIENC-ENTRY-CODE                       CAT814  
CSG001                                      TO TACT-ENTRY-CODE(1:3)     CAT814  
CSG001     END-IF                                                       CAT814  
CSG001                                                                          
CSG001     MOVE ACATBNK-BRANCH-CD           TO TACT-BRANCH              CAT814  
CSG001     MOVE ACATBNK-ACCT-CD             TO TACT-ACCOUNT             CAT814  
CSG001     MOVE W-BKPG-ACCT-TYPE            TO TACT-TYPE                CAT814  
CSG001                                                                  CAT814  
CSG001     MOVE TACT-BRANCH                 TO W-CK-BR                  CAT814  
CSG001     MOVE TACT-ACCOUNT                TO W-CK-ACCT                CAT814  
CSG001     MOVE TACT-TYPE                   TO W-CK-TYP                 CAT814  
CSG001     MOVE ' '                         TO W-CK-CK                  CAT814  
CSG001     MOVE W-CK-ACCT-NUM               TO W-CKDIGIT-ACCT           CAT814  
CSG001     MOVE 9                           TO W-CKDIGIT-LEN            CAT814  
CSG001     MOVE SPACE                       TO W-CKDIGIT-CK             CAT814  
CSG001     CALL  CKDIGIT              USING    W-CKDIGIT-ACCT           CAT814  
CSG001                                         W-CKDIGIT-LEN            CAT814  
CSG001                                         W-CKDIGIT-CK             CAT814  
CSG001     ADD 1 TO W-CKDIGIT-CNT                                       CAT814  
CSG001                                                                  CAT814  
CSG001     MOVE W-CKDIGIT-CK                TO TACT-CHECK-DIGIT         CAT814  
CSG001     MOVE '#@'                        TO TACT-D-DELIMITER         CBA11   
CSG001                                                                          
CSG001*--- SET UP FIGURATION SEGMENT                                    CBA11   
CSG001     MOVE 'H1'                        TO TACT-H-SEG-ID            CBA11   
CSG001     MOVE 'CAT814'                    TO TACT-H-SEG-FOOTPRINT     CBA11   
CSG001     MOVE 0700                        TO TACT-H-SEG-LEN           CBA11   
CSG001                                                                  CBA11   
CSG001     MOVE W-BKPG-AMT                  TO TACT-NET-AMOUNT          CAT814  
CSG001     MOVE '#@'                        TO TACT-H-DELIMITER         CBA11   
CSG001                                                                  CBA11   
CSG001*--- SET UP DESCRIPTION SEGMENT                                   CBA11   
CSG001     MOVE 'N1'                        TO TACT-N-SEG-ID            CBA11   
CSG001     MOVE 'CAT814'                    TO TACT-N-SEG-FOOTPRINT     CBA11   
CSG001     MOVE 0060                        TO TACT-N-SEG-LEN           CBA11   
CSG001                                                                  CBA11   
CSG001     MOVE 1                        TO TACT-DESCRIP-SUB-SEG-COUNT2 CBA11   
CSG001                                                                  CBA11   
CSG001     MOVE 'C'                      TO TACT-DESCRIP-CATEGORY(1)    CBA11   
CSG001                                      TACT-DESCRIP-LINE-SRC(1)    CBA11   
CSG001     IF  BH-ACAT-CONVENIENC-DESCRIPTION  NOT >  ' '               CAT814  
CSG001         MOVE 'TRF FUNDS BETWEEN TYPES' TO TACT-DESCRIP-LINE(1)   CAT814  
CSG001     ELSE                                                         CAT814  
CSG001         MOVE BH-ACAT-CONVENIENC-DESCRIPTION TO                   CAT814  
CSG001                                           TACT-DESCRIP-LINE(1)   CAT814  
CSG001     END-IF                                                       CAT814  
CSG001                                                                          
CSG001     IF BH-ACAT-CONVENIENC-TRAILER > ' '                                  
CSG001        MOVE 0100                  TO TACT-N-SEG-LEN              CBA11   
CSG001        ADD 1                      TO TACT-DESCRIP-SUB-SEG-COUNT2 CBA11   
CSG001        MOVE 'C'                   TO TACT-DESCRIP-CATEGORY(2)    CBA11   
CSG001                                      TACT-DESCRIP-LINE-SRC(2)    CBA11   
CSG001        MOVE BH-ACAT-CONVENIENC-TRAILER                           CAT814  
CSG001                                   TO TACT-DESCRIP-LINE(2)        CAT814  
CSG001     END-IF                                                       CAT814  
CSG001     MOVE '#@'                     TO TACT-N-DELIMITER            CBA11   
CSG001                                                                          
CSG001*--- SET UP AUDIT  SEGMENT ('R1')                                 CBA11   
CSG001     MOVE  WS-AUDIT-SEGMENT-INIT   TO TACT-R-SEGMENT                      
CSG001     MOVE 'CAT814'                 TO TACT-R-SEG-FOOTPRINT                
CSG001     MOVE 400                      TO TACT-R-SEG-LEN                      
CSG001                                      TACT-AUDIT-CNTL-SEG-LEN             
CSG001     MOVE TACT-D-SEG-LEN           TO TACT-BASE-SEGMENT-LEN               
CSG001     MOVE TACT-H-SEG-LEN           TO TACT-FIGURATION-SEG-LEN             
CSG001     MOVE TACT-N-SEG-LEN           TO TACT-DESCRIP-SEGMENT-LEN            
CSG001     MOVE '#@'                     TO TACT-R-DELIMITER            CBA11   
CSG001                                                                          
CSG001     ADD 1 TO W-BKPPG-TACT-CNT                                    CAT814  
CSG001     ADD 1 TO W-BKPPG-TACT-FILE-CNT                               CAT814  
CSG001     PERFORM 8200-WRITE-TACT-DETAIL.                              CBA11   
CSG001                                                                  CAT814  
CSG001 5620-EXIT. EXIT.                                                 CAT814  
CSG001/                                                                 CAT814  
       5700-WRITE-ACATCSH       SECTION.                                CAT814  
      ***************************************************************** CAT814  
      *  SEND CASH ADJUSTMENT INFORMATION TO CAT820DB                   CAT814  
      *  TO ADJUST THE INITIAL ASSET DATABASE.                          CAT814  
      ***************************************************************** CAT814  
           MOVE '5700-WRITE-ACATCSH               ' TO W-ROUTINE-1.     CAT814  
                                                                        CAT814  
           MOVE SPACES                   TO ACATCSH-DETAIL-RECORD       CAT814  
           MOVE +0                       TO ACATCSH-ADJUST-TYPE1        CAT814  
                                            ACATCSH-ADJUST-TYPE2        CAT814  
                                                                        CAT814  
           MOVE ACATBNK-CLIENT-NBR (2:3) TO ACATCSH-ADP-CL-NO-X         CAT814  
           MOVE ACATBNK-BRANCH-CD        TO ACATCSH-BRANCH              CAT814  
           MOVE ACATBNK-ACCT-CD          TO ACATCSH-ACCOUNT             CAT814  
           MOVE W-PGM-NAME               TO ACATCSH-ADJUST-SOURCE       CAT814  
           MOVE ACATBNK-ACAT-CONTROL-NBR TO ACATCSH-CONTROL-NBR         CAT814  
                                                                        CAT814  
           COMPUTE ACATCSH-ADJUST-TYPE1 = ACATBNK-REMOVE (1)            CAT814  
                                        - ACATBNK-ADD    (4)            CAT814  
                                                                        CAT814  
           COMPUTE ACATCSH-ADJUST-TYPE2 = ACATBNK-REMOVE (2)            CAT814  
                                                                        CAT814  
           IF  ACATCSH-ADJUST-TYPE1 = 0                                 CAT814  
           AND ACATCSH-ADJUST-TYPE2 = 0                                 CAT814  
               GO TO 5700-EXIT                                          CAT814  
           END-IF.                                                      CAT814  
                                                                        CAT814  
           WRITE ACATCSH-DETAIL-RECORD.                                 CAT814  
           ADD 1 TO W-ACATCSH-FILE-CNT                                  CAT814  
           ADD 1 TO W-ACATCSH-CNT.                                      CAT814  
                                                                        CAT814  
       5700-EXIT. EXIT.                                                 CAT814  
      /                                                                 CAT814  
CSG001******************************************************************CBA11   
CSG001* - ALL TACT I/O PARAGRAPHS ARE IN THE 8000- SERIES               CBA11   
CSG001******************************************************************CBA11   
CSG001*                                                                         
CSG001 8000-OPEN-TACT-FILE.                                             CBA11   
CSG001******************************************************************CBA11   
CSG001*    -- OPEN OUTPUT TACT FILE                                     CBA11   
CSG001******************************************************************CBA11   
CSG001                                                                  CBA11   
CSG001     INITIALIZE  TACTIO-REQUEST-PARAMETERS.                       CBA11   
CSG001                                                                  CBA11   
CSG001     MOVE 'CAT814'                    TO TACTIO-CALLING-PGM-NAME. CBA11   
CSG001     SET  TACTIO-OPEN-FILE            TO TRUE.                    CBA11   
CSG001     SET  TACTIO-OUTPUT-TACT          TO TRUE.                    CBA11   
CSG001     MOVE 'TACT'                      TO TACTIO-DDNAME.           CBA11   
CSG001     SET  TACTIO-VAR                  TO TRUE.                    CBA11   
CSG001     CALL TACTIO  USING TACTIO-REQUEST-PARAMETERS                 CBA11   
CSG001                        TACT-RECORD.                              CBA11   
CSG001                                                                  CBA11   
CSG001     IF  NOT TACTIO-COMP-SUCCESSFUL                               CBA11   
CSG001         DISPLAY 'OPEN TACT FILE ERROR'                           CBA11   
CSG001         DISPLAY 'PARA:   8000-OPEN-TACT-FILE'                    CBA11   
CSG001         PERFORM 8999-TACTIO-ERROR    THRU 8999-EXIT              CBA11   
CSG001     END-IF.                                                      CBA11   
CSG001                                                                  CBA11   
CSG001 8000-EXIT.                                                       CBA11   
CSG001     EXIT.                                                        CBA11   
CSG001/                                                                 CBA11   
CSG001 8100-WRITE-TACT-HEADER.                                          CBA11   
CSG001******************************************************************CBA11   
CSG001*    WRITE TACT FILE HEADER                                       CBA11   
CSG001******************************************************************CBA11   
CSG001                                                                  CBA11   
CSG001     INITIALIZE  TACTIO-REQUEST-PARAMETERS.                       CBA11   
CSG001                                                                  CBA11   
CSG001     MOVE 'CAT814'                    TO TACTIO-CALLING-PGM-NAME. CBA11   
CSG001     SET  TACTIO-WRITE-HEADER         TO TRUE.                    CBA11   
CSG001     SET  TACTIO-OUTPUT-TACT          TO TRUE.                    CBA11   
CSG001     MOVE 'TACT'                      TO TACTIO-DDNAME.           CBA11   
CSG001     SET  TACTIO-VAR                  TO TRUE.                    CBA11   
CSG001     CALL TACTIO  USING TACTIO-REQUEST-PARAMETERS                 CBA11   
CSG001                        TACT-RECORD.                              CBA11   
CSG001                                                                  CBA11   
CSG001     IF  NOT TACTIO-COMP-SUCCESSFUL                               CBA11   
CSG001         DISPLAY 'WRITE TACT HEADER RECORD ERROR'                 CBA11   
CSG001         DISPLAY 'PARA:   8100-WRITE-TACT-HEADER'                 CBA11   
CSG001         PERFORM 8999-TACTIO-ERROR    THRU 8999-EXIT              CBA11   
CSG001     END-IF.                                                      CBA11   
CSG001                                                                  CBA11   
CSG001 8100-EXIT.                                                       CBA11   
CSG001     EXIT.                                                        CBA11   
CSG001/                                                                 CBA11   
CSG001 8200-WRITE-TACT-DETAIL.                                          CBA11   
CSG001******************************************************************CBA11   
CSG001*    WRITE TACT DETAIL RECORD                                     CBA11   
CSG001******************************************************************CBA11   
CSG001                                                                  CBA11   
CSG001     INITIALIZE  TACTIO-REQUEST-PARAMETERS.                       CBA11   
CSG001                                                                  CBA11   
CSG001     MOVE 'CAT814'                    TO TACTIO-CALLING-PGM-NAME. CBA11   
CSG001     SET  TACTIO-WRITE-DETAIL         TO TRUE.                    CBA11   
CSG001     SET  TACTIO-OUTPUT-TACT          TO TRUE.                    CBA11   
CSG001     MOVE 'TACT'                      TO TACTIO-DDNAME.           CBA11   
CSG001     SET  TACTIO-VAR                  TO TRUE.                    CBA11   
CSG001     CALL TACTIO  USING TACTIO-REQUEST-PARAMETERS                 CBA11   
CSG001                        TACT-RECORD.                              CBA11   
CSG001                                                                  CBA11   
CSG001     IF  NOT TACTIO-COMP-SUCCESSFUL                               CBA11   
CSG001         DISPLAY 'WRITE TACT DETAIL RECORD ERROR'                 CBA11   
CSG001         DISPLAY 'PARA:   8200-WRITE-TACT-HEADER'                 CBA11   
CSG001         PERFORM 8999-TACTIO-ERROR    THRU 8999-EXIT              CBA11   
CSG001     END-IF.                                                      CBA11   
CSG001                                                                  CBA11   
CSG001 8200-EXIT.                                                       CBA11   
CSG001     EXIT.                                                        CBA11   
CSG001/                                                                 CBA11   
CSG001 8300-WRITE-TACT-TRAILER.                                         CBA11   
CSG001******************************************************************CBA11   
CSG001*    WRITE TACT TRAILER                                           CBA11   
CSG001******************************************************************CBA11   
CSG001                                                                  CBA11   
CSG001     INITIALIZE  TACTIO-REQUEST-PARAMETERS.                       CBA11   
CSG001                                                                  CBA11   
CSG001     MOVE 'CAT814'                    TO TACTIO-CALLING-PGM-NAME. CBA11   
CSG001     SET  TACTIO-WRITE-TRAILER        TO TRUE.                    CBA11   
CSG001     SET  TACTIO-OUTPUT-TACT          TO TRUE.                    CBA11   
CSG001     MOVE 'TACT'                      TO TACTIO-DDNAME.           CBA11   
CSG001     SET  TACTIO-VAR                  TO TRUE.                    CBA11   
CSG001     CALL TACTIO  USING TACTIO-REQUEST-PARAMETERS                 CBA11   
CSG001                        TACT-RECORD.                              CBA11   
CSG001                                                                  CBA11   
CSG001     IF  NOT TACTIO-COMP-SUCCESSFUL                               CBA11   
CSG001         DISPLAY 'WRITE TACT TRAILER RECORD ERROR'                CBA11   
CSG001         DISPLAY 'PARA:   8300-WRITE-TACT-TRAILER'                CBA11   
CSG001         PERFORM 8999-TACTIO-ERROR    THRU 8999-EXIT              CBA11   
CSG001     END-IF.                                                      CBA11   
CSG001                                                                  CBA11   
CSG001 8300-EXIT.                                                       CBA11   
CSG001     EXIT.                                                        CBA11   
CSG001/                                                                 CBA11   
CSG001 8400-CLOSE-TACT-FILE.                                            CBA11   
CSG001******************************************************************CBA11   
CSG001*    CLOSE OUTPUT TACT FILE                                       CBA11   
CSG001******************************************************************CBA11   
CSG001                                                                  CBA11   
CSG001     INITIALIZE  TACTIO-REQUEST-PARAMETERS.                       CBA11   
CSG001                                                                  CBA11   
CSG001     MOVE 'CAT814'                    TO TACTIO-CALLING-PGM-NAME. CBA11   
CSG001     SET  TACTIO-CLOSE-FILE           TO TRUE.                    CBA11   
CSG001     SET  TACTIO-OUTPUT-TACT          TO TRUE.                    CBA11   
CSG001     MOVE 'TACT'                      TO TACTIO-DDNAME.           CBA11   
CSG001     SET  TACTIO-VAR                  TO TRUE.                    CBA11   
CSG001     CALL TACTIO  USING TACTIO-REQUEST-PARAMETERS                 CBA11   
CSG001                        TACT-RECORD.                              CBA11   
CSG001                                                                  CBA11   
CSG001     IF  NOT TACTIO-COMP-SUCCESSFUL                               CBA11   
CSG001         DISPLAY 'CLOSE TACT FILE ERROR'                          CBA11   
CSG001         DISPLAY 'PARA:   8400-WRITE-TACT-TRAILER'                CBA11   
CSG001         PERFORM 8999-TACTIO-ERROR    THRU 8999-EXIT              CBA11   
CSG001     END-IF.                                                      CBA11   
CSG001                                                                  CBA11   
CSG001 8400-EXIT.                                                       CBA11   
CSG001     EXIT.                                                        CBA11   
CSG001/                                                                 CBA11   
CSG001 8999-TACTIO-ERROR.                                               CBA11   
CSG001******************************************************************CBA11   
CSG001*    TACT ERROR                                                   CBA11   
CSG001******************************************************************CBA11   
CSG001                                                                  CBA11   
CSG001     DISPLAY '** CAT814: U3060 - BAD TACTIO MODULE RETURN CODE'.  CBA11   
CSG001     DISPLAY '          DDNAME       = ' TACTIO-DDNAME.           CBA11   
CSG001     DISPLAY '          FUNCTION     = ' TACTIO-FUNCTION-CODE.    CBA11   
CSG001     DISPLAY '          FILE-TYPE    = ' TACTIO-FILE-TYPE.        CBA11   
CSG001     DISPLAY '          RETURN-CODE  = ' TACTIO-RETURN-CODE.      CBA11   
CSG001     DISPLAY '          FILE-STATUS  = ' TACTIO-FILE-STATUS.      CBA11   
CSG001     DISPLAY '          ERROR-MESSAGE= ' TACTIO-ERROR-MESSAGE.    CBA11   
CSG001     DISPLAY ' '.                                                 CBA11   
CSG001                                                                  CBA11   
CSG001     MOVE +3060                       TO  ABEND-CD                CBA11   
CSG001     CALL  ABEND  USING ABEND-CD.                                 CBA11   
CSG001                                                                  CBA11   
CSG001 8999-EXIT.                                                       CBA11   
CSG001     EXIT.                                                        CBA11   
CSG001/                                                                 CBA11   
       9000-CLOSE-ROUTINE SECTION.                                      CAT814  
           MOVE '9000-CLOSE-ROUTINE            ' TO W-ROUTINE-1.        CAT814  
                                                                        CAT814  
           DISPLAY ' '.                                                 CAT814  
           MOVE ' '                      TO BKPPG-RECORD                CAT814  
           MOVE 'T'                      TO CP2-REQUEST-CODE.           CAT814  
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.             CAT814  
           MOVE W-BKPPG-CNT              TO CP2-RECORD-COUNT.           CAT814  
           MOVE 999                      TO CP2-CLIENT-NUMBER.          CAT814  
                                                                        CAT814  
           CALL  P2HDTR               USING CP2-AREA                    CAT814  
                                            BKPPG                       CAT814  
                                                                        CAT814  
           MOVE CP2-RETURN-RECORD        TO BKPPG-RECORD                CAT814  
           DISPLAY 'CAT814: BKPPG    TRAILER= ' BKPPG-RECORD (1:90)     CAT814  
           ADD 1 TO W-BKPPG-FILE-CNT                                    CAT814  
           WRITE BKPPG-RECORD.                                          CAT814  
           DISPLAY 'CAT814: BKPPG    TRAILER WRITTEN. STATUS = '        CAT814  
                                               BKPPG-FILE-STATUS.       CAT814  
           DISPLAY ' '                                                  CAT814  
                                                                        CAT814  
CSG001***  CALL IO TO CREATE TRAILER RECORD                             CBA11   
CSG001***  CALL IO TO CLOSE TACT FILE                                   CBA11   
CSG001     ADD 1 TO W-BKPPG-TACT-FILE-CNT                                       
CSG001     PERFORM 8300-WRITE-TACT-TRAILER  THRU 8300-EXIT              CBA11   
CSG001     DISPLAY 'CAT814: BKPPG TA TRAILER WRITTEN. STATUS = '        CAT814  
CSG001                                         TACTIO-FILE-STATUS.      CAT814  
CSG001     PERFORM 8400-CLOSE-TACT-FILE     THRU 8400-EXIT              CBA11   
CSG001     DISPLAY ' '                                                  CAT814  
CSG001                                                                  CAT814  
           CLOSE INFILE                                                 CAT814  
           DISPLAY 'CAT814: ACATBNK  CLOSED. STATUS = '                 CAT814  
                                             INFILE-FILE-STATUS.        CAT814  
           CLOSE ACATCSH                                                CAT814  
           DISPLAY 'CAT814: ACATCSH  CLOSED. STATUS = '                 CAT814  
                                             ACATCSH-FILE-STATUS.       CAT814  
           CLOSE BKPPG                                                  CAT814  
           DISPLAY 'CAT814: BKPPG    CLOSED. STATUS = '                 CAT814  
                                             BKPPG-FILE-STATUS.         CAT814  
           DISPLAY ' '                                                  CAT814  
           DISPLAY 'CAT814: ACATBNK  COUNT     = ' W-INFILE-CNT         CAT814  
                   ' (INCLUDES HEADER AND TRAILER)'                     CAT814  
           DISPLAY 'CAT814: W-REQ-DAY-1-CNT    = ' W-REQ-DAY-1-CNT      CAT814  
           DISPLAY 'CAT814: W-SETTLE-CLOSE-CNT = ' W-SETTLE-CLOSE-CNT   CAT814  
           DISPLAY 'CAT814: W-CKDIGIT-CNT      = ' W-CKDIGIT-CNT        CAT814  
           DISPLAY 'CAT814: ACATCSH FILE COUNT = ' W-ACATCSH-FILE-CNT   CAT814  
                   ' (THIS FILE HAS NO HEADER OR TRAILER)'              CAT814  
           DISPLAY 'CAT814: ACATCSH DETAIL CNT = ' W-ACATCSH-CNT        CAT814  
           DISPLAY 'CAT814: BKPPG   FILE COUNT = ' W-BKPPG-FILE-CNT     CAT814  
                   ' (INCLUDES HEADER AND TRAILER)'                     CAT814  
           DISPLAY 'CAT814: BKPPG   DETAIL CNT = ' W-BKPPG-CNT          CAT814  
CSG001     DISPLAY 'CAT814: BKPPG TA FILE CNT  = ' W-BKPPG-TACT-FILE-CNTCAT814  
CSG001             ' (INCLUDES HEADER AND TRAILER)'                     CAT814  
CSG001     DISPLAY 'CAT814: BKPPG TA DETAIL CNT= ' W-BKPPG-TACT-CNT     CAT814  
                                                                        CAT814  
           DISPLAY 'CAT814: PROGRAM ENDED SUCCESSFULLY'.                CAT814  
                                                                        CAT814  
       9000-EXIT. EXIT.                                                 CAT814  
      *################################################################ CAT814  
