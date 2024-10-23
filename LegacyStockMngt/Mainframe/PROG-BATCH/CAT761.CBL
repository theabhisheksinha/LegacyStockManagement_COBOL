000001* PDX    - CAT761   C0302984 11/19/10 09:27:08 TBLAMUR            00001000
LRM001* SSR 70666 ADD NEW REPORT SECTIONS ACCEPTED,ACCEL,DELT ASSETS            
LRM001*   CO-FUNDED FOCUS GROUP - B1 434742.                                    
000001* PDX    - CAT761   C0235543 06/12/06 08:21:31 TBDOJUN            00001000
       IDENTIFICATION DIVISION.                                         CAT761  
       PROGRAM-ID.    CAT761.                                           CAT761  
      *---------------------------------------------------------------* CAT761  
      *    ACATS - AUDIT CONTROL REPORT                                 CAT761  
      *            REPORT ACATS THAT HAVE BEEN REJECTED,ADD, OR DELETED CAT761  
      *            BY A USER ON THE ONLINE ACAX SYSTEM                  CAT761  
      *                                                                 CAT761  
      *    1. REJECTED TRANSFERS                                        CAT761  
      *    2. ADDED TRANSFERS                                           CAT761  
      *    3. DELETED ASSETS                                            CAT761  
LRM001*    4. ACCEPTED TRANSFERS                                        CAT761  
LRM001*    5. ACCELERATED TRANSFERS                                     CAT761  
LRM001*    6. DELETED ASSETS                                            CAT761  
      *                                                                 CAT761  
      *    DATASETS:                                                    CAT761  
      *    1) B***.CAT500.ACATACTF  I/P - ACTIVITY FILES(5 CYCLES)      CAT761  
      *       WILL BE MERGED WITH CAT761A EXTRACT.                      CAT761  
      *    2) B***.CAT761.ACTPI     O/P - AUDIT CONTROL REPORT          CAT761  
      *                                                                 CAT761  
      *---------------------------------------------------------------* CAT761  
      * 06/01/06 DJ  - NEW ACATS PROGRAM                              * CAT761  
      *---------------------------------------------------------------* CAT761  
      /                                                                 CAT761  
       ENVIRONMENT DIVISION.                                            CAT761  
       INPUT-OUTPUT SECTION.                                            CAT761  
       FILE-CONTROL.                                                    CAT761  
                                                                        CAT761  
           SELECT INFILE                 ASSIGN TO INFILE               CAT761  
                                         FILE STATUS IS INFILE-STAT.    CAT761  
                                                                        CAT761  
           SELECT ACTPI-FILE             ASSIGN TO UT-S-ACTPI           CAT761  
                                         FILE STATUS IS ACTPI-STAT.     CAT761  
                                                                        CAT761  
           SELECT SORT-FILE              ASSIGN TO UT-S-SORTWK01.       CAT761  
      /                                                                 CAT761  
       DATA DIVISION.                                                   CAT761  
       FILE SECTION.                                                    CAT761  
       FD  INFILE                                                       CAT761  
           RECORDING MODE IS F.                                         CAT761  
                                                                        CAT761  
           COPY ACATACTF REPLACING ==:ACATACTF:== BY ==INFILE==.        CAT761  
      /                                                                 CAT761  
       FD  ACTPI-FILE                                                   CAT761  
           RECORDING MODE IS F.                                         CAT761  
                                                                        CAT761  
       01  ACTPI-REC.                                                   CAT761  
           03 ACTPI-LINE            PIC  X(133).                        CAT761  
           03 ACTPI-CLT             PIC S9(003) COMP-3.                 CAT761  
           03 ACTPI-FIL             PIC  X(008).                        CAT761  
      /                                                                 CAT761  
       SD  SORT-FILE.                                                   CAT761  
                                                                        CAT761  
           COPY ACATACTF REPLACING ==:ACATACTF:== BY ==SORT==.          CAT761  
      /                                                                 CAT761  
       WORKING-STORAGE SECTION.                                         CAT761  
       COPY PDXIDCOB.                                                   CAT761  
                                                                        CAT761  
       01  FILLER                        PIC  X(008) VALUE 'ACATACTF'.  CAT761  
                                                                        CAT761  
           COPY ACATACTF REPLACING ==:ACATACTF:== BY ==ACATACTF==.      CAT761  
      /                                                                 CAT761  
       01  FILLER                        PIC  X(008) VALUE 'B1-COUNT'.  CAT761  
       01  B1-WORK-FIELDS.                                              CAT761  
           05  B1-TBL-CNT                PIC  9(003) VALUE 0.           CAT761  
           05  B1-SUB                    PIC  9(003) VALUE 0.           CAT761  
           05  B1-ACTIVE-CNT             PIC  9(003) VALUE 0.           CAT761  
           05  FILLER                    PIC  X(010) VALUE 'B1-PRT-SUB'.CAT761  
           05  B1-PRT-SUB                PIC  9(004) VALUE 1.           CAT761  
       01  FILLER                        PIC  X(008) VALUE 'B1-TABLE'.  CAT761  
       01  B1-TABLE-AREA.                                               CAT761  
           03  B1-TABLE OCCURS 500 TIMES.                               CAT761  
               05  B1-CLT-NBR            PIC  9(004).                   CAT761  
               05  B1-CLT-NAME           PIC  X(030).                   CAT761  
               05  B1-BKR-CLR-NO         PIC  X(004).                   CAT761  
               05  B1-STREAM             PIC  X(001).                   CAT761  
               05  B1-STATUS             PIC  X(001).                   CAT761  
               05  B1-ACAT-STATUS        PIC  X(001).                   CAT761  
               05  B1-ACTPI-PRINTED      PIC  X(001).                   CAT761  
LRM001         05  B1-ACAT-ENHANCED-RPT  PIC  X(001).                   CAT761  
                                                                        CAT761  
       01  FILLER                        PIC  X(008) VALUE 'W-WORK  '.  CAT761  
       01  W-WORK-FIELDS.                                               CAT761  
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         CAT761  
               88 NOT-FIRST-TIME                     VALUE '1'.         CAT761  
           05  INFILE-STAT               PIC  X(002) VALUE '00'.        CAT761  
               88  INFILE-OKAY           VALUE '00' THRU '09', '97'.    CAT761  
               88  INFILE-END-OF-FILE    VALUE '10'.                    CAT761  
               88  INFILE-DUPE-REC       VALUE '22'.                    CAT761  
               88  INFILE-NOTFND         VALUE '23'.                    CAT761  
               88  INFILE-EMPTY          VALUE '35'.                    CAT761  
           05  INFILE-DATE-SW            PIC  X(001) VALUE '0'.         CAT761  
               88 INFILE-DATE-FOUND                  VALUE '1'.         CAT761  
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.         CAT761  
               88 END-OF-INFILE                      VALUE '1'.         CAT761  
           05  END-OF-SORT-SW            PIC  X(001) VALUE '0'.         CAT761  
               88 END-OF-SORT                        VALUE '1'.         CAT761  
           05  ACTPI-STAT                PIC  X(002) VALUE '00'.        CAT761  
               88 ACTPI-OKAY                         VALUE '00'.        CAT761  
           05  W-INFILE-CNT              PIC  9(007) VALUE 0.           CAT761  
           05  W-DETAIL-CNT              PIC  9(007) VALUE 0.           CAT761  
           05  W-RELEASE-CNT             PIC  9(007) VALUE 0.           CAT761  
           05  W-RETURN-CNT              PIC  9(007) VALUE 0.           CAT761  
           05  W-ACTPI-PAGE-CNT          PIC  9(007) VALUE 0.           CAT761  
           05  W-CLT-PAGE-CNT            PIC  9(006) VALUE 0.           CAT761  
           05  W-CLT-ACTPI-PAGE-CNT      PIC  9(006) VALUE 0.           CAT761  
           05  W-PAGE-CNT                PIC  9(006) VALUE 0.           CAT761  
           05  W-LINE-CNT                PIC  9(006) VALUE 60.          CAT761  
           05  W-ACTPI-CNT               PIC  9(007) VALUE 0.           CAT761  
           05  LD-PROC-DATE.                                            CAT761  
               10 LD-PROC-DATE-MM        PIC  X(002).                   CAT761  
               10 LD-PROC-DATE-DD        PIC  X(002).                   CAT761  
               10 LD-PROC-DATE-YY        PIC  X(002).                   CAT761  
           05  W-PROC-DATE.                                             CAT761  
               10 W-PROC-DATE-CC         PIC  X(002).                   CAT761  
               10 W-PROC-DATE-YY         PIC  X(002).                   CAT761  
               10 W-PROC-DATE-MM         PIC  X(002).                   CAT761  
               10 W-PROC-DATE-DD         PIC  X(002).                   CAT761  
           05  W-PROC-DATE-N REDEFINES                                  CAT761  
               W-PROC-DATE               PIC  9(008).                   CAT761  
           05  W-TIME-DATE.                                             CAT761  
               10 W-TIME-DATE-CC         PIC  X(002).                   CAT761  
               10 W-TIME-DATE-YY         PIC  X(002).                   CAT761  
               10 W-TIME-DATE-MM         PIC  X(002).                   CAT761  
               10 W-TIME-DATE-DD         PIC  X(002).                   CAT761  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT761  
           05  FILLER  REDEFINES                                        CAT761  
               W-SYS-DATE.                                              CAT761  
               10  W-SYS-YY              PIC  X(002).                   CAT761  
               10  W-SYS-MM              PIC  X(002).                   CAT761  
               10  W-SYS-DD              PIC  X(002).                   CAT761  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT761  
           05  FILLER  REDEFINES                                        CAT761  
               W-SYS-TIME.                                              CAT761  
               10  W-SYS-HH              PIC  X(002).                   CAT761  
               10  W-SYS-MN              PIC  X(002).                   CAT761  
               10  W-SYS-SS              PIC  X(002).                   CAT761  
               10  W-SYS-MS              PIC  X(002).                   CAT761  
       01  FILLER                        PIC  X(008) VALUE 'W-PREV  '.  CAT761  
       01  W-PREV-AREA.                                                 CAT761  
           05  W-PREV-CLIENT-NBR         PIC  X(004) VALUE ' '.         CAT761  
           05  W-PREV-ACTION             PIC  X(001) VALUE ' '.         CAT761  
       01  W-PRT-AREA.                                                  CAT761  
           05  W-PRT-CLIENT-NBR          PIC  X(004) VALUE ' '.         CAT761  
           05  W-PRT-ACTION              PIC  X(001) VALUE ' '.         CAT761  
       01  W-REPORT-REC.                                                CAT761  
           05  W-REPORT-LINE             PIC  X(133).                   CAT761  
           05  W-REPORT-CLT              PIC S9(003) COMP-3.            CAT761  
           05  W-REPORT-FIL              PIC  X(008).                   CAT761  
      /                                                                 CAT761  
       01  W-ABEND-AREA.                                                CAT761  
           05  ABEND-CODE                PIC S9(004) COMP SYNC.         CAT761  
       01  CALL-MODULES.                                                CAT761  
           05  ABEND-PROGRAM             PIC  X(008) VALUE 'ILBOABN0'.  CAT761  
           05  CKDIGIT-PROGRAM           PIC  X(008) VALUE 'CKDIGIT '.  CAT761  
           05  DSNTIAR-PROGRAM           PIC  X(008) VALUE 'DSNTIAR '.  CAT761  
           05  NUMDAYS-PROGRAM           PIC  X(008) VALUE 'NUMDAYS '.  CAT761  
           05  SPIEEXIT-PROGRAM          PIC  X(008) VALUE 'SPIEEXIT'.  CAT761  
           05  ZBPDATES-PROGRAM          PIC  X(008) VALUE 'ZBPDATES'.  CAT761  
           05  ZGETB1V-PROGRAM           PIC  X(008) VALUE 'ZGETB1V '.  CAT761  
           05  ZGETMSDC-PROGRAM          PIC  X(008) VALUE 'ZGETMSDC'.  CAT761  
           05  ZGETNA-PROGRAM            PIC  X(008) VALUE 'ZGETNA  '.  CAT761  
           05  ZGETXREF-PROGRAM          PIC  X(008) VALUE 'ZGETXREF'.  CAT761  
           05  ZP2HDTR-PROGRAM           PIC  X(008) VALUE 'ZP2HDTR'.   CAT761  
      /                                                                 CAT761  
       01  FILLER                        PIC  X(008) VALUE 'BHINFO  '.  CAT761  
           COPY BHINFO.                                                 CAT761  
      /                                                                 CAT761  
       01  FILLER                        PIC  X(008) VALUE 'BHACAT  '.  CAT761  
           COPY BHACAT.                                                 CAT761  
      /                                                                 CAT761  
       01  FILLER                        PIC  X(008) VALUE 'BPDATESC'.  CAT761  
           COPY BPDATESC.                                               CAT761  
      /                                                                 CAT761  
      ******************************************************************CAT761  
      * REPORT LAYOUT                                                  *CAT761  
      ******************************************************************CAT761  
       01  FILLER                        PIC  X(008) VALUE 'REPORT=='.  CAT761  
       01  W-HDR1-REC.                                                  CAT761  
           05  FILLER                       PIC  X(01) VALUE '1'.       CAT761  
           05  FILLER                       PIC  X(08) VALUE            CAT761  
               'CAT761 -'.                                              CAT761  
           05  W-HDR1-CLT                   PIC  Z999.                  CAT761  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT761  
           05  W-HDR1-CLT-NAME              PIC  X(30) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(42) VALUE            CAT761  
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.            CAT761  
           05  FILLER                       PIC  X(12) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(13) VALUE            CAT761  
               'PROCESS DATE '.                                         CAT761  
           05  W-HDR1-MM                    PIC  X(02) VALUE ' '.       CAT761  
           05  W-HDR1-S1                    PIC  X(01) VALUE '/'.       CAT761  
           05  W-HDR1-DD                    PIC  X(02) VALUE ' '.       CAT761  
           05  W-HDR1-S2                    PIC  X(01) VALUE '/'.       CAT761  
           05  W-HDR1-YY                    PIC  X(02) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(05) VALUE            CAT761  
               'PAGE '.                                                 CAT761  
           05  W-HDR1-PAGE                  PIC  ZZZ9.                  CAT761  
                                                                        CAT761  
       01  W-HDR2-HEADING-LIT-1             PIC X(42) VALUE             CAT761  
               '           AUDIT CONTROL REPORT'.                       CAT761  
       01  W-HDR2-REC.                                                  CAT761  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(08) VALUE            CAT761  
               'BROKER  '.                                              CAT761  
           05  W-HDR2-BKR                   PIC  X(04) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(35) VALUE ' '.       CAT761  
           05  W-HDR2-HEADING               PIC  X(42) VALUE            CAT761  
               '           AUDIT CONTROL REPORT'.                       CAT761  
           05  FILLER                       PIC  X(16) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(09) VALUE            CAT761  
               'RUN TIME '.                                             CAT761  
           05  W-HDR2-MM                    PIC  X(02) VALUE ' '.       CAT761  
           05  W-HDR2-S1                    PIC  X(01) VALUE '/'.       CAT761  
           05  W-HDR2-DD                    PIC  X(02) VALUE ' '.       CAT761  
           05  W-HDR2-S2                    PIC  X(01) VALUE '/'.       CAT761  
           05  W-HDR2-YY                    PIC  X(02) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT761  
           05  W-HDR2-HH                    PIC  X(02) VALUE ' '.       CAT761  
           05  W-HDR2-CC                    PIC  X(01) VALUE ':'.       CAT761  
           05  W-HDR2-MN                    PIC  X(02) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT761  
                                                                        CAT761  
       01  W-HDR3-REC.                                                  CAT761  
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT761  
           05  FILLER                       PIC  X(19) VALUE ' ' .      CAT761  
           05  FILLER                       PIC  X(40) VALUE ' ' .      CAT761  
           05  W-HDR3-LIT                   PIC  X(40) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(40) VALUE ' '.       CAT761  
                                                                        CAT761  
       01  W-HDR4-REC.                                                  CAT761  
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT761  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(09) VALUE            CAT761  
               'ACCOUNT'.                                               CAT761  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(03) VALUE            CAT761  
               'RR '.                                                   CAT761  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(14) VALUE            CAT761  
               'CONTROL NUMBER'.                                        CAT761  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT761  
           05  W-HDR4-TFR                   PIC  X(08) VALUE            CAT761  
               'TFR'.                                                   CAT761  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(08) VALUE            CAT761  
               'SNON ID'.                                               CAT761  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(08) VALUE            CAT761  
               'TERM ID'.                                               CAT761  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(16) VALUE            CAT761  
               'TIME '.                                                 CAT761  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(05) VALUE            CAT761  
               'CYCLE'.                                                 CAT761  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(08) VALUE            CAT761  
               'NETNAME'.                                               CAT761  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(08) VALUE            CAT761  
               'USER ID'.                                               CAT761  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(20) VALUE            CAT761  
               'USER NAME'.                                             CAT761  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT761  
                                                                        CAT761  
       01  W-DTL1-REC.                                                  CAT761  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT761  
           05  W-DTL1-ACCT-NBR              PIC  X(09) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT761  
           05  W-DTL1-RR                    PIC  X(03) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT761  
           05  W-DTL1-CONTROL-NUMBER        PIC  X(14) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT761  
           05  W-DTL1-TFR                   PIC  X(08) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(03) VALUE ' '.       CAT761  
           05  W-DTL1-USER-ID               PIC  X(04) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(06) VALUE ' '.       CAT761  
           05  W-DTL1-TERM-ID               PIC  X(04) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(05) VALUE ' '.       CAT761  
           05  W-DTL1-TIME                  PIC  X(16) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT761  
           05  W-DTL1-CYCLE                 PIC  X(02) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(03) VALUE ' '.       CAT761  
           05  W-DTL1-CICS-NET-NM           PIC  X(08) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT761  
           05  W-DTL1-TPSCRT-USR-ID         PIC  X(08) VALUE ' '.       CAT761  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT761  
           05  W-DTL1-TPSCRT-USR-NM         PIC  X(20) VALUE ' '.       CAT761  
                                                                        CAT761  
       01  W-DTLX-REC.                                                  CAT761  
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT761  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT761  
           05  W-DTLX-LIT                   PIC  X(40) VALUE            CAT761  
           'NO ACTIVITY TODAY'.                                         CAT761  
           05  FILLER                       PIC  X(90) VALUE ' '.       CAT761  
                                                                        CAT761  
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT761  
      /                                                                 CAT761  
      ***************************************************************** CAT761  
      *    LINKAGE SECTION                                            * CAT761  
      ***************************************************************** CAT761  
       LINKAGE SECTION.                                                 CAT761  
       01  L-JCL-PARMS.                                                 CAT761  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT761  
           05  L-STREAM                  PIC  X(001).                   CAT761  
           05  L-BYP-DATECHK-SW          PIC  X(001).                   CAT761  
               88  L-BYP-DATECHK                     VALUE '1'.         CAT761  
           05  L-BYP-FILECHK-SW          PIC  X(001).                   CAT761  
               88  L-BYP-FILECHK                     VALUE '1'.         CAT761  
                                                                        CAT761  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT761  
      *                         ===========                             CAT761  
           DISPLAY 'CAT761 - ACATS AUDIT CONTROL REPORT'.               CAT761  
           DISPLAY '         INPUT IS FROM CAT500'.                     CAT761  
           DISPLAY ' '.                                                 CAT761  
           COPY MSGCOBO.                                                CAT761  
           DISPLAY ' '.                                                 CAT761  
                                                                        CAT761  
           PERFORM 1000-INIT          THRU 1000-EXIT.                   CAT761  
                                                                        CAT761  
           SORT SORT-FILE ON ASCENDING SORT-KEY                         CAT761  
                INPUT  PROCEDURE IS 2000-SORT-INPUT  THRU 2000-EXIT     CAT761  
                OUTPUT PROCEDURE IS 5000-SORT-OUTPUT THRU 5000-EXIT.    CAT761  
                                                                        CAT761  
           PERFORM 9000-CLOSE-ROUTINE THRU 9000-EXIT.                   CAT761  
                                                                        CAT761  
           GOBACK.                                                      CAT761  
      /                                                                 CAT761  
       1000-INIT.                                                       CAT761  
                                                                        CAT761  
           DISPLAY 'CAT761: L-STREAM         = '                        CAT761  
                            L-STREAM.                                   CAT761  
           DISPLAY 'CAT761: L-BYP-DATECHK-SW = '                        CAT761  
                            L-BYP-DATECHK-SW.                           CAT761  
           DISPLAY 'CAT761: L-BYP-FILECHK-SW = '                        CAT761  
                            L-BYP-FILECHK-SW.                           CAT761  
           IF  L-BYP-DATECHK                                            CAT761  
               DISPLAY 'CAT761: DATE CHECK WILL BE BYPASSED'            CAT761  
           ELSE                                                         CAT761  
               DISPLAY 'CAT761: DATE CHECK WILL BE PERFORMED'           CAT761  
           END-IF.                                                      CAT761  
           IF  L-BYP-FILECHK                                            CAT761  
               DISPLAY 'CAT761: FILE CHECK WILL BE BYPASSED'            CAT761  
           ELSE                                                         CAT761  
               DISPLAY 'CAT761: FILE CHECK WILL BE PERFORMED'           CAT761  
           END-IF.                                                      CAT761  
                                                                        CAT761  
           MOVE 'CAT761'                 TO BPDATES-CALLING-PGM.        CAT761  
           SET  LNKDATZ-REQUEST          TO TRUE.                       CAT761  
           CALL ZBPDATES-PROGRAM USING BPDATES-PARAMETERS.              CAT761  
           MOVE BPD-PROC-DATE            TO W-PROC-DATE.                CAT761  
           MOVE BPD-PROC-DATE(3:2)       TO LD-PROC-DATE-YY.            CAT761  
           MOVE BPD-PROC-DATE(5:2)       TO LD-PROC-DATE-MM.            CAT761  
           MOVE BPD-PROC-DATE(7:2)       TO LD-PROC-DATE-DD.            CAT761  
                                                                        CAT761  
           DISPLAY 'CAT761: PROC-DATE= ' BPD-PROC-DATE                  CAT761  
                      '  LD-PROC-DATE= ' LD-PROC-DATE.                  CAT761  
                                                                        CAT761  
           ACCEPT W-SYS-DATE             FROM DATE.                     CAT761  
           ACCEPT W-SYS-TIME             FROM TIME.                     CAT761  
                                                                        CAT761  
           OPEN INPUT  INFILE.                                          CAT761  
           DISPLAY 'CAT761: INFILE  OPENED FOR INPUT  '                 CAT761  
                       ' FILE STATUS = ' INFILE-STAT.                   CAT761  
           IF  INFILE-OKAY                                              CAT761  
               CONTINUE                                                 CAT761  
           ELSE                                                         CAT761  
               MOVE 3002      TO  ABEND-CODE                            CAT761  
               DISPLAY ' '                                              CAT761  
               DISPLAY 'CAT761: U3002 - DD INFILE OPEN ERROR'           CAT761  
                       ' FILE STATUS = ' INFILE-STAT                    CAT761  
               CALL ABEND-PROGRAM USING ABEND-CODE                      CAT761  
           END-IF.                                                      CAT761  
                                                                        CAT761  
           PERFORM 3000-READ-INFILE THRU 3000-EXIT.                     CAT761  
                                                                        CAT761  
           IF  END-OF-INFILE                                            CAT761  
               DISPLAY 'CAT761: INFILE END OF FILE REACHED'             CAT761  
               IF L-BYP-FILECHK                                         CAT761  
                      DISPLAY 'CAT761: BYPASSING FILE CHECK PER JCLPARM'CAT761  
                      GO TO 1000-CONT                                   CAT761  
               ELSE                                                     CAT761  
                      DISPLAY 'CAT761: U3003 - ABENDING ON EMPTY FILE'  CAT761  
                      MOVE +3003      TO ABEND-CODE                     CAT761  
                      CALL ABEND-PROGRAM USING ABEND-CODE               CAT761  
               END-IF                                                   CAT761  
           END-IF.                                                      CAT761  
                                                                        CAT761  
           IF  ACATACTF-HDR-REC                                         CAT761  
               SET INFILE-DATE-FOUND TO TRUE                            CAT761  
               DISPLAY 'CAT761: INFILE PROC-DATE = '                    CAT761  
                                              ACATACTF-HDR-PROC-DATE    CAT761  
                             ', UPDT BY PGM=' ACATACTF-HDR-PGM-NAME     CAT761  
                                     ' DATE=' ACATACTF-HDR-SYS-DATE     CAT761  
                                     ' TIME=' ACATACTF-HDR-SYS-TIME     CAT761  
               IF  ACATACTF-HDR-PROC-DATE = LD-PROC-DATE                CAT761  
                   DISPLAY 'CAT761: INFILE PROC-DATE = LD-PROC-DATE.'   CAT761  
                                  ' OKAY.'                              CAT761  
               ELSE                                                     CAT761  
                   DISPLAY 'CAT761: INFILE  DATE NOT = LD-PROC-DATE'    CAT761  
                   IF L-BYP-DATECHK                                     CAT761  
                   DISPLAY 'CAT761: BYPASSING DATE CHECK PER JCLPARM'   CAT761  
                   ELSE                                                 CAT761  
                      DISPLAY 'CAT761: U3004 - ABENDING ON BAD DATE'    CAT761  
                      MOVE +3004      TO ABEND-CODE                     CAT761  
                      CALL ABEND-PROGRAM USING ABEND-CODE               CAT761  
                   END-IF                                               CAT761  
               END-IF                                                   CAT761  
               PERFORM 3000-READ-INFILE THRU 3000-EXIT                  CAT761  
           ELSE                                                         CAT761  
               DISPLAY 'CAT761: INFILE  DATE RECORD MISSING'            CAT761  
                   IF L-BYP-DATECHK                                     CAT761  
                   DISPLAY 'CAT761: BYPASSING DATE CHECK PER JCLPARM'   CAT761  
                   ELSE                                                 CAT761  
                      DISPLAY 'CAT761: U3005 - ABENDING ON BAD DATE'    CAT761  
                      MOVE +3005      TO ABEND-CODE                     CAT761  
                      CALL ABEND-PROGRAM USING ABEND-CODE               CAT761  
                   END-IF                                               CAT761  
           END-IF.                                                      CAT761  
                                                                        CAT761  
       1000-CONT.                                                       CAT761  
                                                                        CAT761  
           OPEN OUTPUT ACTPI-FILE.                                      CAT761  
           DISPLAY 'CAT761: ACTPI    OPENED FOR OUTPUT '                CAT761  
                       ' FILE STATUS = ' ACTPI-STAT.                    CAT761  
                                                                        CAT761  
           IF  ACTPI-OKAY                                               CAT761  
               CONTINUE                                                 CAT761  
           ELSE                                                         CAT761  
               MOVE 3003                  TO  ABEND-CODE                CAT761  
               DISPLAY ' '                                              CAT761  
               DISPLAY 'CAT761: U3003 - DD ACTPI  OPEN ERROR'           CAT761  
                       ' FILE STATUS = ' ACTPI-STAT                     CAT761  
               CALL ABEND-PROGRAM USING ABEND-CODE                      CAT761  
           END-IF.                                                      CAT761  
                                                                        CAT761  
           PERFORM 1500-LOAD-B1 THRU 1500-EXIT.                         CAT761  
                                                                        CAT761  
           DISPLAY ' '.                                                 CAT761  
                                                                        CAT761  
       1000-EXIT. EXIT.                                                 CAT761  
      /                                                                 CAT761  
       1500-LOAD-B1.                                                    CAT761  
           DISPLAY 'CAT550: 1500-LOAD-B1'.                              CAT761  
                                                                        CAT761  
           MOVE SPACES                   TO  B1-TABLE-AREA.             CAT761  
           MOVE 0                        TO  B1-TBL-CNT.                CAT761  
                                                                        CAT761  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT761  
                                                                        CAT761  
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT761  
                                             BH-ACAT-INFO               CAT761  
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         CAT761  
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT761  
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT761  
             CALL  ZGETB1V-PROGRAM     USING BH-BROKER-HEADER-INFO      CAT761  
                                             BH-ACAT-INFO               CAT761  
             ADD 1 TO B1-TBL-CNT                                        CAT761  
             IF   BH-BROKER-ACTIVE                                      CAT761  
                   MOVE  BH-BROKER-NUMBER-N                             CAT761  
                                         TO B1-CLT-NBR (B1-TBL-CNT)     CAT761  
                   MOVE  BH-BROKER-NAME                                 CAT761  
                                         TO B1-CLT-NAME (B1-TBL-CNT)    CAT761  
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)             CAT761  
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)  CAT761  
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '               CAT761  
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                CAT761  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT761  
                   ELSE                                                 CAT761  
                       MOVE BH-BROKER-MINI-MAXI-INDICATOR               CAT761  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT761  
                   END-IF                                               CAT761  
                   MOVE  BH-BROKER-STATUS                               CAT761  
                                         TO B1-STATUS     (B1-TBL-CNT)  CAT761  
               IF  B1-STREAM (B1-TBL-CNT) = L-STREAM                    CAT761  
               AND BH-ACAT-ACTIVE                                       CAT761  
                   ADD 1 TO B1-ACTIVE-CNT                               CAT761  
                   MOVE  BH-ACAT-STATUS                                 CAT761  
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT761  
LRM001             MOVE  BH-ACAT-ENHANCED-AUDIT-REPT                            
LRM001                            TO B1-ACAT-ENHANCED-RPT (B1-TBL-CNT)  CAT761  
                       DISPLAY      ' CLT ' B1-CLT-NBR    (B1-TBL-CNT)  CAT761  
                                        ' ' B1-CLT-NAME   (B1-TBL-CNT)  CAT761  
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)  CAT761  
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)  CAT761  
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)  CAT761  
                                   ' ACAT ' B1-ACAT-STATUS(B1-TBL-CNT)  CAT761  
               ELSE                                                     CAT761  
                   MOVE ' '              TO B1-ACAT-STATUS(B1-TBL-CNT)  CAT761  
               END-IF                                                   CAT761  
             END-IF                                                     CAT761  
                                                                        CAT761  
           END-PERFORM.                                                 CAT761  
                                                                        CAT761  
           DISPLAY ' '.                                                 CAT761  
                                                                        CAT761  
           DISPLAY  'B1 ACTIVE COUNT = ' B1-ACTIVE-CNT.                 CAT761  
           DISPLAY ' '.                                                 CAT761  
       1500-EXIT. EXIT.                                                 CAT761  
      /                                                                 CAT761  
       2000-SORT-INPUT.                                                 CAT761  
           DISPLAY ' '.                                                 CAT761  
           DISPLAY 'CAT761: PERFORMING 5000-SORT-OUTPUT'.               CAT761  
                                                                        CAT761  
           PERFORM UNTIL INFILE-END-OF-FILE                             CAT761  
               PERFORM 2500-FORMAT-SORT THRU 2500-EXIT                  CAT761  
               ADD  1             TO W-RELEASE-CNT                      CAT761  
               PERFORM 3000-READ-INFILE THRU 3000-EXIT                  CAT761  
           END-PERFORM.                                                 CAT761  
                                                                        CAT761  
       2000-EXIT.                                                       CAT761  
           EXIT.                                                        CAT761  
      /                                                                 CAT761  
       2500-FORMAT-SORT.                                                CAT761  
                                                                        CAT761  
           IF  ACATACTF-HDR-REC                                         CAT761  
           OR  ACATACTF-TRL-REC                                         CAT761  
               CONTINUE                                                 CAT761  
           ELSE                                                         CAT761  
               IF  ACATACTF-PRGM-NM(1:4)    = 'ACAT'                    CAT761  
               AND ACATACTF-BPD-PROC-DATE   = BPD-PROC-DATE             CAT761  
                   MOVE ACATACTF-RECORD TO SORT-RECORD                  CAT761  
                   RELEASE SORT-RECORD                                  CAT761  
               END-IF                                                   CAT761  
           END-IF.                                                      CAT761  
                                                                        CAT761  
       2500-EXIT.                                                       CAT761  
           EXIT.                                                        CAT761  
      /                                                                 CAT761  
       3000-READ-INFILE.                                                CAT761  
                                                                        CAT761  
           READ INFILE INTO ACATACTF-RECORD                             CAT761  
                AT END                                                  CAT761  
                   MOVE '1'              TO END-OF-INFILE-SW            CAT761  
                   DISPLAY 'CAT761: INFILE END OF FILE REACHED'         CAT761  
                   GO TO 3000-EXIT                                      CAT761  
           END-READ.                                                    CAT761  
                                                                        CAT761  
           IF  INFILE-STAT NOT = '00'                                   CAT761  
               DISPLAY 'CAT761: READ INFILE STATUS = ' INFILE-STAT      CAT761  
                       '.  INFILE-CNT = ' W-INFILE-CNT                  CAT761  
                       '.  KEY = ' ACATACTF-KEY                         CAT761  
                   DISPLAY ' '                                          CAT761  
                   DISPLAY 'CAT761: U3009 - DD INFILE READ ERR, '       CAT761  
                           ' FILE STATUS = ' INFILE-STAT                CAT761  
                   MOVE 3009      TO  ABEND-CODE                        CAT761  
                   CALL ABEND-PROGRAM USING ABEND-CODE                  CAT761  
           END-IF.                                                      CAT761  
                                                                        CAT761  
           ADD 1 TO W-INFILE-CNT.                                       CAT761  
                                                                        CAT761  
           IF  ACATACTF-TRL-REC                                         CAT761  
               DISPLAY 'CAT761: ACATACTF-TRAILER-RECORD = '             CAT761  
                                ACATACTF-TRAILER-RECORD(1:80)           CAT761  
               GO TO 3000-READ-INFILE                                   CAT761  
           END-IF.                                                      CAT761  
                                                                        CAT761  
       3000-EXIT.                                                       CAT761  
           EXIT.                                                        CAT761  
      /                                                                 CAT761  
       5000-SORT-OUTPUT.                                                CAT761  
           DISPLAY ' '.                                                 CAT761  
           DISPLAY 'CAT761: PERFORMING 5000-SORT-OUTPUT'.               CAT761  
                                                                        CAT761  
           PERFORM 5500-RETURN-SORT THRU 5500-EXIT.                     CAT761  
                                                                        CAT761  
           PERFORM UNTIL END-OF-SORT                                    CAT761  
                                                                        CAT761  
               IF  B1-PRT-SUB < SORT-CLIENT-NBR                         CAT761  
                   PERFORM 6000-CLT-BREAK THRU 6000-EXIT                CAT761  
               END-IF                                                   CAT761  
                                                                        CAT761  
LRM001*** BYPASS PRINTING 3-ACCEPTED, 4-ACCEL, 7-DELT ASSETS BASED ON           
LRM001*** FOCUS GROUP CO-FUNDED B1 434742                                       
LRM001         IF (ACATACTF-ACTION = '3' OR '4' OR '7')                         
LRM001         AND B1-ACAT-ENHANCED-RPT (B1-TBL-CNT) NOT = '1'          CAT761  
LRM001            CONTINUE                                                      
LRM001         ELSE                                                             
                  PERFORM 7000-WRITE-REPORT THRU 7000-EXIT              CAT761  
LRM001         END-IF                                                           
                                                                        CAT761  
               MOVE ACATACTF-CLIENT-NBR    TO W-PREV-CLIENT-NBR         CAT761  
               MOVE ACATACTF-ACTION        TO W-PREV-ACTION             CAT761  
                                                                        CAT761  
               PERFORM 5500-RETURN-SORT THRU 5500-EXIT                  CAT761  
                                                                        CAT761  
           END-PERFORM.                                                 CAT761  
                                                                        CAT761  
           PERFORM 6000-CLT-BREAK THRU 6000-EXIT.                       CAT761  
                                                                        CAT761  
       5000-EXIT.                                                       CAT761  
           EXIT.                                                        CAT761  
      /                                                                 CAT761  
       5500-RETURN-SORT.                                                CAT761  
                                                                        CAT761  
           RETURN SORT-FILE                                             CAT761  
               AT END                                                   CAT761  
                     MOVE 999 TO SORT-CLIENT-NBR                        CAT761  
                     MOVE '1'              TO END-OF-SORT-SW            CAT761  
                     DISPLAY 'CAT761: SORT-EOF '                        CAT761  
                                   ' RET=' W-RETURN-CNT                 CAT761  
                     GO TO 5500-EXIT.                                   CAT761  
                                                                        CAT761  
           ADD  1                        TO W-RETURN-CNT.               CAT761  
           ADD  1                        TO W-ACTPI-CNT.                CAT761  
           MOVE SORT-RECORD              TO ACATACTF-RECORD.            CAT761  
                                                                        CAT761  
       5500-EXIT.                                                       CAT761  
           EXIT.                                                        CAT761  
      /                                                                 CAT761  
       6000-CLT-BREAK.                                                  CAT761  
           IF  B1-STREAM      (B1-PRT-SUB) = L-STREAM                   CAT761  
           AND B1-ACAT-STATUS (B1-PRT-SUB) = 'A'                        CAT761  
               DISPLAY 'BREAK : '                                       CAT761  
                       B1-PRT-SUB                                       CAT761  
                   ' ' B1-CLT-NAME (B1-PRT-SUB)                         CAT761  
                     ' CLT-PG=' W-CLT-PAGE-CNT                          CAT761  
                     ' ACT-PG=' W-CLT-ACTPI-PAGE-CNT                    CAT761  
           END-IF.                                                      CAT761  
                                                                        CAT761  
       6000-LOOP.                                                       CAT761  
                                                                        CAT761  
           IF  B1-PRT-SUB   < SORT-CLIENT-NBR                           CAT761  
               IF   B1-STREAM      (B1-PRT-SUB) = L-STREAM              CAT761  
               AND  B1-ACAT-STATUS (B1-PRT-SUB) = 'A'                   CAT761  
                 IF B1-ACTPI-PRINTED (B1-PRT-SUB) NOT = '1'             CAT761  
                    PERFORM 7500-WRITE-NO-ACTPI THRU 7500-EXIT          CAT761  
                 END-IF                                                 CAT761  
               END-IF                                                   CAT761  
           ELSE                                                         CAT761  
               GO TO 6000-EXIT                                          CAT761  
           END-IF.                                                      CAT761  
                                                                        CAT761  
           IF  B1-PRT-SUB < 500                                         CAT761  
               ADD 1 TO B1-PRT-SUB                                      CAT761  
               MOVE 0                    TO W-PAGE-CNT                  CAT761  
               MOVE 0                    TO W-CLT-PAGE-CNT              CAT761  
               MOVE 0                    TO W-CLT-ACTPI-PAGE-CNT        CAT761  
               MOVE 60                   TO W-LINE-CNT                  CAT761  
               GO TO 6000-LOOP                                          CAT761  
           END-IF.                                                      CAT761  
                                                                        CAT761  
       6000-EXIT. EXIT.                                                 CAT761  
      /                                                                 CAT761  
       7000-WRITE-REPORT.                                               CAT761  
                                                                        CAT761  
           MOVE '1' TO B1-ACTPI-PRINTED (B1-PRT-SUB)                    CAT761  
                                                                        CAT761  
           IF  ACATACTF-CLIENT-NBR NOT = W-PRT-CLIENT-NBR               CAT761  
           OR  W-LINE-CNT > 50                                          CAT761  
               PERFORM 7100-WRITE-HDR THRU 7100-EXIT                    CAT761  
               PERFORM 7200-WRITE-SUB-HDR THRU 7200-EXIT                CAT761  
           ELSE                                                         CAT761  
               IF  ACATACTF-ACTION NOT = W-PRT-ACTION                   CAT761  
                   PERFORM 7200-WRITE-SUB-HDR THRU 7200-EXIT            CAT761  
               END-IF                                                   CAT761  
           END-IF.                                                      CAT761  
                                                                        CAT761  
           PERFORM 7300-WRITE-DETAIL THRU 7300-EXIT.                    CAT761  
                                                                        CAT761  
           MOVE ACATACTF-CLIENT-NBR    TO W-PRT-CLIENT-NBR              CAT761  
           MOVE ACATACTF-ACTION        TO W-PRT-ACTION.                 CAT761  
                                                                        CAT761  
       7000-EXIT. EXIT.                                                 CAT761  
      /                                                                 CAT761  
       7100-WRITE-HDR.                                                  CAT761  
                                                                        CAT761  
           ADD  1                        TO W-PAGE-CNT.                 CAT761  
           ADD  1                        TO W-CLT-PAGE-CNT              CAT761  
           ADD  1                        TO W-CLT-ACTPI-PAGE-CNT        CAT761  
           ADD  1                        TO W-ACTPI-PAGE-CNT            CAT761  
                                                                        CAT761  
           MOVE B1-PRT-SUB               TO W-HDR1-CLT.                 CAT761  
           MOVE B1-CLT-NAME (B1-PRT-SUB) TO W-HDR1-CLT-NAME.            CAT761  
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                  CAT761  
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                  CAT761  
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                  CAT761  
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                CAT761  
           MOVE W-HDR1-REC               TO W-REPORT-LINE.              CAT761  
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                CAT761  
           MOVE LOW-VALUES               TO W-REPORT-FIL.               CAT761  
           WRITE ACTPI-REC FROM W-REPORT-REC.                           CAT761  
                                                                        CAT761  
           MOVE B1-BKR-CLR-NO (B1-PRT-SUB) TO W-HDR2-BKR.               CAT761  
           MOVE W-SYS-MM                 TO W-HDR2-MM.                  CAT761  
           MOVE W-SYS-DD                 TO W-HDR2-DD.                  CAT761  
           MOVE W-SYS-YY                 TO W-HDR2-YY.                  CAT761  
           MOVE W-SYS-HH                 TO W-HDR2-HH.                  CAT761  
           MOVE W-SYS-MN                 TO W-HDR2-MN.                  CAT761  
           MOVE W-HDR2-HEADING-LIT-1   TO W-HDR2-HEADING                CAT761  
           MOVE W-HDR2-REC               TO W-REPORT-LINE.              CAT761  
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                CAT761  
           MOVE LOW-VALUES               TO W-REPORT-FIL.               CAT761  
           WRITE ACTPI-REC FROM W-REPORT-REC.                           CAT761  
                                                                        CAT761  
           MOVE 3                        TO W-LINE-CNT.                 CAT761  
                                                                        CAT761  
       7100-EXIT. EXIT.                                                 CAT761  
      /                                                                 CAT761  
       7200-WRITE-SUB-HDR.                                              CAT761  
                                                                        CAT761  
           IF ACATACTF-ACTION = '1'                                     CAT761  
                MOVE 'REJECTED TRANSFERS'  TO W-HDR3-LIT                CAT761  
           ELSE                                                         CAT761  
              IF ACATACTF-ACTION = '2'                                  CAT761  
                 MOVE 'NEW TRANSFERS'      TO W-HDR3-LIT                CAT761  
              ELSE                                                      CAT761  
LRM001        IF ACATACTF-ACTION = '3'                                  CAT761  
LRM001           MOVE 'ACCEPTED     '      TO W-HDR3-LIT                CAT761  
LRM001        ELSE                                                      CAT761  
LRM001        IF ACATACTF-ACTION = '4'                                  CAT761  
LRM001           MOVE 'ACCELERATED  '      TO W-HDR3-LIT                CAT761  
LRM001        ELSE                                                      CAT761  
LRM001          IF ACATACTF-ACTION = '7'                                CAT761  
LRM001             MOVE 'SUBMITTED ASSETS'   TO W-HDR3-LIT              CAT761  
LRM001          ELSE                                                    CAT761  
LRM001            IF ACATACTF-ACTION = '8'                              CAT761  
                     MOVE 'DELETED ASSETS   ' TO W-HDR3-LIT             CAT761  
                  ELSE                                                  CAT761  
                     MOVE 'UNKNOWN TRANSFERS' TO W-HDR3-LIT             CAT761  
                  END-IF                                                CAT761  
              END-IF                                                    CAT761  
           END-IF.                                                      CAT761  
                                                                        CAT761  
           MOVE W-HDR3-REC          TO W-REPORT-LINE                    CAT761  
           MOVE B1-PRT-SUB          TO W-REPORT-CLT                     CAT761  
           MOVE LOW-VALUES          TO W-REPORT-FIL                     CAT761  
           WRITE ACTPI-REC FROM W-REPORT-REC.                           CAT761  
                                                                        CAT761  
           IF  ACATACTF-AT                                              CAT761  
               MOVE 'SECURITY'      TO W-HDR4-TFR                       CAT761  
           ELSE                                                         CAT761  
               MOVE 'TFR'           TO W-HDR4-TFR                       CAT761  
           END-IF                                                       CAT761  
           MOVE W-HDR4-REC          TO W-REPORT-LINE                    CAT761  
           MOVE B1-PRT-SUB          TO W-REPORT-CLT                     CAT761  
           MOVE LOW-VALUES          TO W-REPORT-FIL                     CAT761  
           WRITE ACTPI-REC FROM W-REPORT-REC.                           CAT761  
                                                                        CAT761  
       7200-EXIT. EXIT.                                                 CAT761  
      /                                                                 CAT761  
       7300-WRITE-DETAIL.                                               CAT761  
                                                                        CAT761  
           INITIALIZE W-DTL1-REC                                        CAT761  
           MOVE ACATACTF-ACCT-NBR(1:3)   TO W-DTL1-ACCT-NBR(1:3)        CAT761  
           MOVE '-'                      TO W-DTL1-ACCT-NBR(4:1)        CAT761  
           MOVE ACATACTF-ACCT-NBR(4:5)   TO W-DTL1-ACCT-NBR(5:5)        CAT761  
           MOVE ACATACTF-RR-CD           TO W-DTL1-RR                   CAT761  
           MOVE ACATACTF-ACAT-CTL-NBR    TO W-DTL1-CONTROL-NUMBER       CAT761  
           IF  ACATACTF-AT                                              CAT761  
               MOVE ACATACTF-SECURITY-ADP-NBR TO W-DTL1-TFR             CAT761  
               IF  ACATACTF-STTLM-LCTN-CD = '40'                        CAT761  
               AND ACATACTF-SECURITY-ADP-NBR(1: 4) NOT = 'CASH'         CAT761  
                   MOVE 'CASH'                TO W-DTL1-TFR             CAT761  
               END-IF                                                   CAT761  
           ELSE                                                         CAT761  
               MOVE ACATACTF-TRNFR-TYPE-CD    TO W-DTL1-TFR             CAT761  
           END-IF                                                       CAT761  
           MOVE ACATACTF-CICS-SGNON-ID   TO W-DTL1-USER-ID              CAT761  
           MOVE ACATACTF-CICS-TERM-ID-CD TO W-DTL1-TERM-ID              CAT761  
           MOVE ACATACTF-UPDT-TMSTP(1:16) TO W-DTL1-TIME                CAT761  
           MOVE ACATACTF-CYCLE-CD        TO W-DTL1-CYCLE                CAT761  
           MOVE ACATACTF-CICS-NET-NM     TO W-DTL1-CICS-NET-NM          CAT761  
           MOVE ACATACTF-TPSCRT-USR-ID   TO W-DTL1-TPSCRT-USR-ID        CAT761  
           MOVE ACATACTF-TPSCRT-USR-NM   TO W-DTL1-TPSCRT-USR-NM        CAT761  
           MOVE W-DTL1-REC               TO W-REPORT-LINE.              CAT761  
           MOVE B1-PRT-SUB               TO W-REPORT-CLT.               CAT761  
           MOVE LOW-VALUES               TO W-REPORT-FIL.               CAT761  
           WRITE ACTPI-REC FROM W-REPORT-REC.                           CAT761  
           ADD 1                         TO W-LINE-CNT.                 CAT761  
                                                                        CAT761  
       7300-EXIT. EXIT.                                                 CAT761  
      /                                                                 CAT761  
       7500-WRITE-NO-ACTPI.                                             CAT761  
                                                                        CAT761  
           DISPLAY 'CAT761: '                                           CAT761  
                       B1-PRT-SUB                                       CAT761  
                   ' ' B1-CLT-NAME (B1-PRT-SUB)                         CAT761  
                   ' NO ACTIVITY TODAY'                                 CAT761  
                                                                        CAT761  
           MOVE 1                        TO W-PAGE-CNT.                 CAT761  
           ADD  1                        TO W-CLT-PAGE-CNT              CAT761  
           ADD  1                        TO W-CLT-ACTPI-PAGE-CNT        CAT761  
           ADD  1                        TO W-ACTPI-PAGE-CNT            CAT761  
                                                                        CAT761  
           MOVE B1-PRT-SUB               TO W-HDR1-CLT.                 CAT761  
           MOVE B1-CLT-NAME (B1-PRT-SUB) TO W-HDR1-CLT-NAME.            CAT761  
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                  CAT761  
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                  CAT761  
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                  CAT761  
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                CAT761  
           MOVE W-HDR1-REC               TO W-REPORT-LINE.              CAT761  
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                CAT761  
           MOVE LOW-VALUES               TO W-REPORT-FIL.               CAT761  
           WRITE ACTPI-REC FROM W-REPORT-REC.                           CAT761  
                                                                        CAT761  
           MOVE B1-BKR-CLR-NO (B1-PRT-SUB) TO W-HDR2-BKR.               CAT761  
           MOVE W-SYS-MM                 TO W-HDR2-MM.                  CAT761  
           MOVE W-SYS-DD                 TO W-HDR2-DD.                  CAT761  
           MOVE W-SYS-YY                 TO W-HDR2-YY.                  CAT761  
           MOVE W-SYS-HH                 TO W-HDR2-HH.                  CAT761  
           MOVE W-SYS-MN                 TO W-HDR2-MN.                  CAT761  
           MOVE W-HDR2-HEADING-LIT-1     TO W-HDR2-HEADING              CAT761  
           MOVE W-HDR2-REC               TO W-REPORT-LINE.              CAT761  
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                CAT761  
           MOVE LOW-VALUES               TO W-REPORT-FIL.               CAT761  
           WRITE ACTPI-REC FROM W-REPORT-REC.                           CAT761  
                                                                        CAT761  
           MOVE W-DTLX-REC               TO W-REPORT-LINE.              CAT761  
           MOVE B1-PRT-SUB               TO W-REPORT-CLT.               CAT761  
           MOVE LOW-VALUES               TO W-REPORT-FIL.               CAT761  
           WRITE ACTPI-REC FROM W-REPORT-REC.                           CAT761  
                                                                        CAT761  
           MOVE 3                        TO W-LINE-CNT.                 CAT761  
           MOVE B1-PRT-SUB               TO W-PRT-CLIENT-NBR            CAT761  
           MOVE '9'                      TO W-PRT-ACTION.               CAT761  
                                                                        CAT761  
       7500-EXIT. EXIT.                                                 CAT761  
      /                                                                 CAT761  
       9000-CLOSE-ROUTINE.                                              CAT761  
                                                                        CAT761  
           DISPLAY ' '.                                                 CAT761  
           CLOSE INFILE.                                                CAT761  
           DISPLAY 'CAT761: ACATACTF CLOSED. STATUS = '                 CAT761  
                                             INFILE-STAT.               CAT761  
           CLOSE ACTPI-FILE.                                            CAT761  
           DISPLAY 'CAT761: ACTPI    CLOSED. STATUS = '                 CAT761  
                                             ACTPI-STAT.                CAT761  
           DISPLAY 'CAT761: INFILE CNT = ' W-INFILE-CNT.                CAT761  
           DISPLAY 'CAT761: ACTPI  CNT = ' W-ACTPI-CNT.                 CAT761  
           DISPLAY 'CAT761: ACTPI-PAGE = ' W-ACTPI-PAGE-CNT.            CAT761  
           DISPLAY 'CAT761: PROGRAM ENDED SUCCESSFULLY'.                CAT761  
                                                                        CAT761  
       9000-EXIT.                                                       CAT761  
           EXIT.                                                        CAT761  
      *################################################################ CAT761  
