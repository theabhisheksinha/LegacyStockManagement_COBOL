000001* PDX    - CAT527   C0274114 01/29/09 11:42:50 TBDOJUN            00001000
000001* DJ0001 SSR 62537 USE PRNGFL FILE TO CHECK FOR PRIVATE RANGE             
000001* PDX    - CAT527   C0272055 10/23/08 08:16:11 TBLAMUR            00001000
LRM000* CHANGE CONTROL NUMBER TO PRINT ALL 14 CHAR.                             
000001* PDX    - CAT527   C0269669 09/16/08 10:13:19 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         CAT527  
       PROGRAM-ID.    CAT527.                                           CAT527  
      ***************************************************************** CAT527  
      *    ACATS - INTRA-DAY BOOKING EXCEPTION REPORT                   CAT527  
      *                                                                 CAT527  
      *    USE B1 TO GET CLIENT NAME                                    CAT527  
      *                                                                 CAT527  
      *    INPUT   : CAT527DB EXTRTACT OF ASSETS MISSING MATCH TO       CAT527  
      *               MSD.                                              CAT527  
      *    OUTPUT  :                                                    CAT527  
      *            1) BXXX.CAT527.MSDEPI       O/P - REPORT             CAT527  
      *                                                                 CAT527  
      *---------------------------------------------------------------* CAT527  
      * 09/03/08 LM  - NEW ACATS PROGRAM                              * CAT527  
      *---------------------------------------------------------------* CAT527  
      /                                                                 CAT527  
       ENVIRONMENT DIVISION.                                            CAT527  
       INPUT-OUTPUT SECTION.                                            CAT527  
       FILE-CONTROL.                                                    CAT527  
                                                                        CAT527  
           SELECT PENDING-FILE           ASSIGN TO UT-S-MSDEXCP         00660001
                                         FILE STATUS IS INFILE-STAT.    CAT527  
           SELECT REPT-FILE              ASSIGN TO UT-S-REPORT          CAT527  
                                         FILE STATUS IS REPT-STAT.      CAT527  
      /                                                                 CAT527  
       DATA DIVISION.                                                   CAT527  
       FILE SECTION.                                                    CAT527  
       FD  PENDING-FILE                                                 00740000
           RECORDING MODE IS F                                          00750008
           BLOCK CONTAINS 0 RECORDS.                                    00760000
       COPY ACATMSDE  REPLACING ==:FMT:== BY ==PEND==.                  00770001
                                                                        00780000
       FD  REPT-FILE                                                    CAT527  
           RECORDING MODE IS F.                                         CAT527  
                                                                        CAT527  
       01  REPT-REC.                                                    CAT527  
           03 REPT-LINE             PIC  X(133).                        CAT527  
           03 REPT-CLT              PIC S9(003) COMP-3.                 CAT527  
           03 REPT-FIL              PIC  X(008).                        CAT527  
      /                                                                 CAT527  
       WORKING-STORAGE SECTION.                                         CAT527  
       COPY PDXIDCOB.                                                   CAT527  
                                                                        CAT527  
       01  W-FIELDS.                                                    CAT527  
           05  W-ROUTINE-1               PIC  X(32) VALUE ' '.          CAT527  
           05  W-FIRST-TIME-SW           PIC  X(01) VALUE '0'.          CAT527  
               88 NOT-FIRST-TIME                    VALUE '1'.          CAT527  
           05  INFILE-STAT               PIC  X(02) VALUE '00'.         CAT527  
               88  INFILE-OKAY           VALUE '00'.                    CAT527  
               88  INFILE-END-OF-FILE    VALUE '10'.                    CAT527  
           05  INFILE-DATE-SW            PIC  X(01) VALUE '0'.          CAT527  
               88 INFILE-DATE-FOUND                 VALUE '1'.          CAT527  
           05  END-OF-INFILE-SW          PIC  X(01) VALUE '0'.          CAT527  
               88 END-OF-INFILE                     VALUE '1'.          CAT527  
           05  REPT-STAT                 PIC  X(02) VALUE '00'.         CAT527  
               88 REPT-OKAY                         VALUE '00'.         CAT527  
           05  W-INFILE-CNT              PIC  9(11) VALUE 0.            CAT527  
           05  W-PAGE-CNT                PIC  9(11) VALUE 0.            CAT527  
           05  W-LINE-CNT                PIC  9(11) VALUE 60.           CAT527  
           05  LD-PROC-DATE.                                            CAT527  
               10 LD-PROC-DATE-MM        PIC  X(02).                    CAT527  
               10 LD-PROC-DATE-DD        PIC  X(02).                    CAT527  
               10 LD-PROC-DATE-YY        PIC  X(02).                    CAT527  
           05  W-PROC-DATE.                                             CAT527  
               10 W-PROC-DATE-CC         PIC  X(02).                    CAT527  
               10 W-PROC-DATE-YY         PIC  X(02).                    CAT527  
               10 W-PROC-DATE-MM         PIC  X(02).                    CAT527  
               10 W-PROC-DATE-DD         PIC  X(02).                    CAT527  
           05  W-PROC-DATE-N REDEFINES                                  CAT527  
               W-PROC-DATE               PIC  9(008).                   CAT527  
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           CAT527  
           05  FILLER  REDEFINES                                        CAT527  
               W-SYS-DATE.                                              CAT527  
               10  W-SYS-YY              PIC  X(002).                   CAT527  
               10  W-SYS-MM              PIC  X(002).                   CAT527  
               10  W-SYS-DD              PIC  X(002).                   CAT527  
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           CAT527  
           05  FILLER  REDEFINES                                        CAT527  
               W-SYS-TIME.                                              CAT527  
               10  W-SYS-HH              PIC  X(002).                   CAT527  
               10  W-SYS-MN              PIC  X(002).                   CAT527  
               10  W-SYS-SS              PIC  X(002).                   CAT527  
               10  W-SYS-MS              PIC  X(002).                   CAT527  
           05  W-REPT-CLT                PIC  9(03) VALUE 0.            CAT527  
           05  W-REPT-LINE               PIC  X(133).                   CAT527  
           05  W-CLT-CNT                 PIC  9(11) VALUE 0.            CAT527  
       01  W-PREV-AREA.                                                 CAT527  
           05  W-PREV-CLIENT-NBR         PIC X(0003) VALUE SPACES.      CAT527  
           05  W-PREV-CONTROL-NBR        PIC X(0014).                   CAT527  
           05  W-PREV-RCV-NBR            PIC X(0004).                   CAT527  
           05  W-PREV-RCV-ACCT           PIC X(0020).                   CAT527  
                                                                        CAT527  
                                                                        CAT527  
       01  W-CURRENT-FIELDS.                                            CAT527  
           05  W-CURR-CLIENT             PIC X(03).                     CAT527  
           05  W-CURR-CLIENT-N REDEFINES                                CAT527  
               W-CURR-CLIENT             PIC 9(003).                    CAT527  
                                                                        CAT527  
      /                                                                 CAT527  
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.   CAT527  
       01  B1-TABLE-AREA.                                               CAT527  
           03  B1-TABLE OCCURS 500 TIMES.                               CAT527  
               05  B1-CLT-NBR               PIC 9(03).                  CAT527  
               05  B1-CLT-NAME              PIC X(30).                  CAT527  
               05  B1-BKR-CLR-NO            PIC X(04).                  CAT527  
               05  B1-STREAM                PIC X(01).                  CAT527  
               05  B1-STATUS                PIC X(01).                  CAT527  
               05  B1-ACAT-STATUS           PIC X(01).                  CAT527  
               05  B1-PRINT                 PIC X(01).                  CAT527  
       01  B1-WORK-FIELEDS.                                             CAT527  
           03  B1-TBL-CNT                   PIC 9(03) VALUE 0.          CAT527  
           03  B1-SUB                       PIC 9(03) VALUE 0.          CAT527  
           03  B1-ACTIVE-CNT                PIC 9(03) VALUE 0.          CAT527  
           03  B1-PRT-SUB                   PIC 9(03) VALUE 0.          CAT527  
      /                                                                 CAT527  
      ******************************************************************CAT527  
      * B1 HEADER                                                      *CAT527  
      ******************************************************************CAT527  
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    CAT527  
           COPY BHINFO.                                                 CAT527  
      /                                                                 CAT527  
      ******************************************************************CAT527  
      * B1 ACAT SECTION                                                *CAT527  
      ******************************************************************CAT527  
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    CAT527  
           COPY BHACAT.                                                 CAT527  
      /                                                                 CAT527  
      ******************************************************************CAT527  
      * BPDATE COMMAREA                                                *CAT527  
      ******************************************************************CAT527  
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   CAT527  
                                                                        CAT527  
           COPY BPDATESC.                                               CAT527  
      /                                                                 CAT527  
       01  W-HDR1-REC.                                                  CAT527  
           05  FILLER                       PIC  X(01) VALUE '1'.       CAT527  
           05  FILLER                       PIC  X(08) VALUE            CAT527  
               'CAT527 -'.                                              CAT527  
           05  W-HDR1-CLT                   PIC  Z999.                  CAT527  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT527  
           05  W-HDR1-CLT-NAME              PIC  X(30) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(42) VALUE            CAT527  
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.            CAT527  
           05  FILLER                       PIC  X(12) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(13) VALUE            CAT527  
               'PROCESS DATE '.                                         CAT527  
           05  W-HDR1-MM                    PIC  X(02).                 CAT527  
           05  W-HDR1-S1                    PIC  X(01) VALUE '/'.       CAT527  
           05  W-HDR1-DD                    PIC  X(02).                 CAT527  
           05  W-HDR1-S2                    PIC  X(01) VALUE '/'.       CAT527  
           05  W-HDR1-YY                    PIC  X(02).                 CAT527  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(05) VALUE            CAT527  
               'PAGE '.                                                 CAT527  
           05  W-HDR1-PAGE                  PIC  ZZZ9.                  CAT527  
                                                                        CAT527  
       01  W-HDR2-REC.                                                  CAT527  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(57) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(42) VALUE            CAT527  
               'MSD MATCHING EXCEPTION REPORT'.                         CAT527  
           05  FILLER                       PIC  X(06) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(09) VALUE            CAT527  
               'RUN TIME '.                                             CAT527  
           05  W-HDR2-MM                    PIC  X(02).                 CAT527  
           05  W-HDR2-S1                    PIC  X(01) VALUE '/'.       CAT527  
           05  W-HDR2-DD                    PIC  X(02).                 CAT527  
           05  W-HDR2-S2                    PIC  X(01) VALUE '/'.       CAT527  
           05  W-HDR2-YY                    PIC  X(02).                 CAT527  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT527  
           05  W-HDR2-HH                    PIC  X(02).                 CAT527  
           05  W-HDR2-CC                    PIC  X(01) VALUE ':'.       CAT527  
           05  W-HDR2-MN                    PIC  X(02).                 CAT527  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT527  
                                                                        CAT527  
       01  W-HDR3-REC.                                                  CAT527  
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT527  
           05  FILLER                       PIC  X(40) VALUE            CAT527  
              'BR-ACCT     ISIN/CUSIP      CONTROL NBR'.                CAT527  
           05  FILLER                       PIC  X(30) VALUE            CAT527  
              '    MSD LOOKUP ISSUE          '.                         CAT527  
           05  FILLER                       PIC  X(52) VALUE            CAT527  
              'SETTLE LOC   PRICING CATG    SETTLE REASON   CREATED'.   CAT527  
                                                                        CAT527  
       01  W-DTL1-REC.                                                  CAT527  
           05  FILLER                       PIC  X(01) VALUE '0'.       CAT527  
           05  W-DTL1-BRANCH                PIC  X(03).                 CAT527  
           05  FILLER                       PIC  X(01) VALUE '-'.       CAT527  
           05  W-DTL1-ACCOUNT               PIC  X(05).                 CAT527  
           05  FILLER                       PIC  X(03) VALUE ' '.       CAT527  
           05  W-DTL1-CNTRY                 PIC  X(03).                 CAT527  
           05  W-DTL1-CUSIP                 PIC  X(09).                 CAT527  
           05  W-DTL1-CKDG                  PIC  X(02).                 CAT527  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT527  
           05  W-DTL1-CONTROL-NBR           PIC  X(14).                 CAT527  
           05  FILLER                       PIC  X(02) VALUE ' '.       CAT527  
           05  W-DTL1-LOOKUP-MSG            PIC  X(24).                 CAT527  
           05  FILLER                       PIC  X(03) VALUE ' '.       CAT527  
           05  W-DTL1-SETTLE-LOC            PIC  X(10).                 CAT527  
           05  FILLER                       PIC  X(04) VALUE ' '.       CAT527  
           05  W-DTL1-PRICING-CAT           PIC  X(04).                 CAT527  
           05  FILLER                       PIC  X(12) VALUE ' '.       CAT527  
           05  W-DTL1-SETTLE-RSN            PIC  X(04).                 CAT527  
           05  FILLER                       PIC  X(10) VALUE ' '.       CAT527  
           05  W-DTL1-TMSTP                 PIC  X(16).                 CAT527  
                                                                        CAT527  
       01  W-DTL2-REC.                                                  CAT527  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(06) VALUE ' DESC:'.  CAT527  
           05  W-DTL2-DESC                  PIC  X(100).                CAT527  
                                                                        CAT527  
       01  W-DTL3-REC.                                                  CAT527  
           05  FILLER                       PIC  X(01) VALUE ' '.       CAT527  
           05  FILLER                       PIC  X(06) VALUE ' '.       CAT527  
           05  W-DTL3-DESC                  PIC  X(40).                 CAT527  
                                                                        CAT527  
      /                                                                 CAT527  
      ***--->COBOL LE                                                   CAT527  
       01  W-ABEND-AREA.                                                CAT527  
           03  ABEND-CD                  PIC S9(04) COMP SYNC.          CAT527  
                                                                        CAT527  
           COPY STUBCPY.                                                CAT527  
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.    CAT527  
      ***<---COBOL LE                                                   CAT527  
                                                                        CAT527  
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT527  
      /                                                                 CAT527  
      ***************************************************************** CAT527  
      *    LINKAGE SECTION                                            * CAT527  
      ***************************************************************** CAT527  
       LINKAGE SECTION.                                                 CAT527  
       01  L-JCL-PARMS.                                                 CAT527  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT527  
           05  L-STREAM                  PIC  X(001).                   CAT527  
                                                                        CAT527  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT527  
      *                         ===========                             CAT527  
       0000-MAIN SECTION.                                               CAT527  
                                                                        CAT527  
           DISPLAY 'CAT527 - ACATS MSD MATCHING EXCEPTION REPORT'.      CAT527  
           DISPLAY ' '.                                                 CAT527  
           COPY MSGCOBO.                                                CAT527  
           DISPLAY ' '.                                                 CAT527  
                                                                        CAT527  
           PERFORM 1000-INIT          THRU 1000-EXIT.                   CAT527  
                                                                        CAT527  
           PERFORM 2000-PROCESS-B1 THRU 2000-EXIT                       CAT527  
                                                                        CAT527  
           PERFORM 9000-CLOSE-ROUTINE THRU 9000-EXIT.                   CAT527  
                                                                        CAT527  
       0000-FINI.                                                       CAT527  
                                                                        CAT527  
           GOBACK.                                                      CAT527  
      /                                                                 CAT527  
       1000-INIT SECTION.                                               CAT527  
                                                                        CAT527  
           DISPLAY 'CAT527: L-STREAM         = '                        CAT527  
                            L-STREAM.                                   CAT527  
                                                                        CAT527  
           MOVE 'CAT527'                 TO BPDATES-CALLING-PGM.        CAT527  
           SET  LNKDATZ-REQUEST          TO TRUE.                       CAT527  
           CALL  BPDATES  USING BPDATES-PARAMETERS.                     CAT527  
           MOVE BPD-PROC-DATE            TO W-PROC-DATE.                CAT527  
           MOVE BPD-PROC-DATE(3:2)       TO LD-PROC-DATE-YY.            CAT527  
           MOVE BPD-PROC-DATE(5:2)       TO LD-PROC-DATE-MM.            CAT527  
           MOVE BPD-PROC-DATE(7:2)       TO LD-PROC-DATE-DD.            CAT527  
                                                                        CAT527  
           DISPLAY 'CAT527: PROC-DATE= ' BPD-PROC-DATE                  CAT527  
                      '  LD-PROC-DATE= ' LD-PROC-DATE.                  CAT527  
                                                                        CAT527  
           ACCEPT W-SYS-DATE             FROM DATE.                     CAT527  
           ACCEPT W-SYS-TIME             FROM TIME.                     CAT527  
                                                                        CAT527  
           MOVE '000'                  TO BH-BROKER-NUMBER              CAT527  
                                                                        CAT527  
           OPEN INPUT PENDING-FILE.                                     CAT527  
           IF INFILE-OKAY                                               CAT527  
               CONTINUE                                                 CAT527  
           ELSE                                                         CAT527  
               MOVE 3000                  TO  ABEND-CD                  CAT527  
               DISPLAY ' '                                              CAT527  
               DISPLAY 'CAT527: U3000 - DD ACATMSDE OPEN ERROR, '       CAT527  
                       ' FILE STATUS = ' INFILE-STAT                    CAT527  
               CALL  ABEND  USING ABEND-CD                              CAT527  
           END-IF.                                                      CAT527  
                                                                        CAT527  
           PERFORM 5500-READ-EXTRACT-RTN THRU 5500-EXIT.                        
           IF NOT INFILE-END-OF-FILE                                    CAT527  
              IF PEND-HEADER-ID                                                 
                DISPLAY 'INFILE HEADER FOUND ' PEND-HEADER-CRT-TIMESTAMP        
                PERFORM 5500-READ-EXTRACT-RTN THRU 5500-EXIT                    
           END-IF.                                                      CAT527  
                                                                                
           OPEN OUTPUT REPT-FILE.                                       CAT527  
           DISPLAY 'CAT527: REPORT   OPENED FOR OUTPUT '                CAT527  
                       ' FILE STATUS = ' REPT-STAT.                     CAT527  
                                                                        CAT527  
           IF  REPT-OKAY                                                CAT527  
               CONTINUE                                                 CAT527  
           ELSE                                                         CAT527  
               MOVE 3003                  TO  ABEND-CD                  CAT527  
               DISPLAY ' '                                              CAT527  
               DISPLAY 'CAT527: U3003 - DD REPORT OPEN ERR, '           CAT527  
                       ' FILE STATUS = ' REPT-STAT                      CAT527  
               CALL  ABEND  USING ABEND-CD                              CAT527  
           END-IF.                                                      CAT527  
                                                                        CAT527  
           PERFORM 1500-LOAD-B1 THRU 1500-EXIT.                         CAT527  
                                                                        CAT527  
           DISPLAY ' '.                                                 CAT527  
                                                                        CAT527  
       1000-EXIT. EXIT.                                                 CAT527  
      /                                                                 CAT527  
       1500-LOAD-B1 SECTION.                                            CAT527  
           DISPLAY 'CAT527: 1500-LOAD-B1'.                              CAT527  
                                                                        CAT527  
           MOVE SPACES                   TO  B1-TABLE-AREA.             CAT527  
           MOVE 0                        TO  B1-TBL-CNT.                CAT527  
                                                                        CAT527  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT527  
                                                                        CAT527  
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO      CAT527  
                                             BH-ACAT-INFO               CAT527  
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N         CAT527  
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE     CAT527  
             MOVE  '434500'              TO  BH-B2-INFO-ID              CAT527  
             CALL   GETB1V             USING BH-BROKER-HEADER-INFO      CAT527  
                                             BH-ACAT-INFO               CAT527  
             IF   BH-BROKER-ACTIVE                                      CAT527  
                   ADD 1 TO B1-TBL-CNT                                  CAT527  
                   MOVE B1-SUB      TO  B1-CLT-NBR    (B1-TBL-CNT)      CAT527  
                   MOVE  BH-BROKER-NAME                                 CAT527  
                                         TO B1-CLT-NAME (B1-TBL-CNT)    CAT527  
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '               CAT527  
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                CAT527  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT527  
                   ELSE                                                 CAT527  
                       MOVE BH-BROKER-MINI-MAXI-INDICATOR               CAT527  
                                         TO B1-STREAM     (B1-TBL-CNT)  CAT527  
                   END-IF                                               CAT527  
                   MOVE  BH-BROKER-STATUS                               CAT527  
                                         TO B1-STATUS     (B1-TBL-CNT)  CAT527  
                   IF BH-ACAT-ACTIVE                                    CAT527  
                   AND  B1-STREAM (B1-TBL-CNT) = L-STREAM               CAT527  
                   ADD 1 TO B1-ACTIVE-CNT                               CAT527  
                       MOVE 'A'         TO B1-ACAT-STATUS(B1-TBL-CNT)   CAT527  
                       DISPLAY      ' CLT ' B1-CLT-NBR    (B1-TBL-CNT)  CAT527  
                                        ' ' B1-CLT-NAME   (B1-TBL-CNT)  CAT527  
                   ELSE                                                 CAT527  
                       MOVE ' '         TO B1-ACAT-STATUS(B1-TBL-CNT)   CAT527  
                   END-IF                                               CAT527  
             END-IF                                                     CAT527  
                                                                        CAT527  
           END-PERFORM.                                                 CAT527  
                                                                        CAT527  
           DISPLAY ' '.                                                 CAT527  
                                                                        CAT527  
           DISPLAY  'B1 ACTIVE COUNT = ' B1-ACTIVE-CNT.                 CAT527  
           DISPLAY ' '.                                                 CAT527  
       1500-EXIT. EXIT.                                                 CAT527  
      /                                                                 CAT527  
      ******************************************************************CAT527  
      *  FOR CLIENTS IN THIS STREAM, READ AND REPORT                    CAT527  
      ******************************************************************CAT527  
       2000-PROCESS-B1 SECTION.                                         CAT527  
           MOVE '2000-PROCESS-B1         ' TO W-ROUTINE-1.              CAT527  
                                                                        CAT527  
           PERFORM VARYING B1-SUB FROM 1 BY 1                           CAT527  
                  UNTIL B1-SUB > 500                                    CAT527  
               MOVE B1-CLT-NBR(B1-SUB) TO  W-CURR-CLIENT                CAT527  
               IF B1-ACAT-STATUS(B1-SUB) = 'A'                          CAT527  
                   PERFORM 6000-CLT-BREAK THRU 6000-EXIT                CAT527  
                   PERFORM  UNTIL INFILE-END-OF-FILE                    CAT527  
                            OR PEND-TI-ADP-CL-NO-X > W-CURR-CLIENT              
                       PERFORM 7000-WRITE-REPORT  THRU 7000-EXIT                
                      PERFORM 5500-READ-EXTRACT-RTN THRU 5500-EXIT              
                  END-PERFORM                                                   
               END-IF                                                           
           END-PERFORM.                                                 CAT527  
                                                                        CAT527  
       2000-EXIT. EXIT.                                                 CAT527  
      /                                                                 CAT527  
       5500-READ-EXTRACT-RTN SECTION.                                   CAT527  
                                                                        CAT527  
           READ PENDING-FILE                                            CAT527  
               AT END                                                   CAT527  
                     MOVE '9999' TO PEND-TI-ADP-CL-NO-X                 CAT527  
                     GO TO 5500-EXIT.                                   CAT527  
                                                                        CAT527  
           ADD  1                        TO W-INFILE-CNT.               CAT527  
                                                                        CAT527  
       5500-EXIT.                                                       CAT527  
           EXIT.                                                        CAT527  
      /                                                                 CAT527  
       6000-CLT-BREAK SECTION.                                          CAT527  
           DISPLAY '6000-CLT-BREAK'                                     CAT527  
               ' INFILE CLIENT-NBR= ' PEND-TI-ADP-CL-NO-X               CAT527  
               ' B1-PRT-SUB= ' B1-PRT-SUB.                              CAT527  
                                                                        CAT527  
       6000-LOOP.                                                       CAT527  
                                                                        CAT527  
           IF B1-CLT-NBR (B1-PRT-SUB) < PEND-TI-ADP-CL-NO-X             CAT527  
               IF   B1-STREAM      (B1-PRT-SUB) = L-STREAM              CAT527  
               AND  B1-ACAT-STATUS (B1-PRT-SUB) = 'A'                   CAT527  
                 IF B1-PRINT       (B1-PRT-SUB) NOT = '1'               CAT527  
                    PERFORM 7100-WRITE-NO-ACT THRU 7100-EXIT            CAT527  
                 END-IF                                                 CAT527  
               END-IF                                                   CAT527  
           ELSE                                                         CAT527  
               GO TO 6000-EXIT                                          CAT527  
           END-IF.                                                      CAT527  
                                                                        CAT527  
           IF  B1-PRT-SUB < 500                                         CAT527  
               ADD 1 TO B1-PRT-SUB                                      CAT527  
               MOVE 0                    TO W-PAGE-CNT                  CAT527  
               MOVE 60                   TO W-LINE-CNT                  CAT527  
               MOVE 0                    TO W-CLT-CNT                   CAT527  
               GO TO 6000-LOOP                                          CAT527  
           END-IF.                                                      CAT527  
                                                                        CAT527  
       6000-EXIT. EXIT.                                                 CAT527  
      /                                                                 CAT527  
       7000-WRITE-REPORT SECTION.                                       CAT527  
                                                                        CAT527  
           MOVE '1' TO B1-PRINT (B1-PRT-SUB)                            CAT527  
                                                                        CAT527  
           IF  (PEND-TI-ADP-CL-NO-X     NOT = W-PREV-CLIENT-NBR)        CAT527  
                MOVE 60 TO W-LINE-CNT                                   CAT527  
           END-IF                                                       CAT527  
                                                                        CAT527  
           MOVE PEND-TI-ADP-CL-NO-X        TO W-PREV-CLIENT-NBR         CAT527  
                                                                        CAT527  
           INITIALIZE W-DTL1-REC                                        CAT527  
                      W-DTL2-REC                                        CAT527  
                      W-DTL3-REC.                                       CAT527  
           MOVE PEND-TI-CUST-ACCOUNT(1 : 3) TO  W-DTL1-BRANCH           CAT527  
           MOVE PEND-TI-CUST-ACCOUNT(4: 5)  TO  W-DTL1-ACCOUNT          CAT527  
           IF PEND-CNTRY-CD  > SPACES                                   CAT527  
              MOVE PEND-CNTRY-CD        TO W-DTL1-CNTRY                 CAT527  
              MOVE '-'                  TO W-DTL1-CNTRY(3 : 1)          CAT527  
           END-IF.                                                              
                                                                                
           MOVE PEND-CUSIP-NUM       TO W-DTL1-CUSIP                    CAT527  
                                                                                
           IF PEND-CKDGT > SPACES                                       CAT527  
              MOVE '-'                  TO W-DTL1-CKDG(1 : 1)           CAT527  
              MOVE PEND-CKDGT           TO W-DTL1-CKDG(2 : 1)           CAT527  
           END-IF.                                                              
                                                                                
           MOVE PEND-TI-CONTROL-NUM  TO W-DTL1-CONTROL-NBR              CAT527  
                                                                                
           IF PEND-MSD-NOTHING-PROVIDED                                         
               MOVE 'NO MSD KEY PROVIDED' TO W-DTL1-LOOKUP-MSG          CAT527  
           ELSE                                                                 
           IF PEND-MSD-CUSIP-NOTFND                                             
               MOVE 'CUSIP NOT FOUND ' TO W-DTL1-LOOKUP-MSG             CAT527  
           ELSE                                                                 
           IF PEND-MSD-CUSIP12-NOTFND                                           
               MOVE '12-DIGIT ISIN NOT FOUND ' TO W-DTL1-LOOKUP-MSG     CAT527  
           ELSE                                                                 
           IF PEND-MSD-ISIN-NOTFND                                              
               MOVE 'SUBMITTER ISIN NOT FOUND ' TO W-DTL1-LOOKUP-MSG    CAT527  
           ELSE                                                                 
DJ0001     IF PEND-PRIVATE-RANGE                                                
DJ0001         MOVE 'PRIVATE RANGE            ' TO W-DTL1-LOOKUP-MSG    CAT527  
           ELSE                                                                 
               MOVE 'MSD NOT FOUND'             TO W-DTL1-LOOKUP-MSG    CAT527  
           END-IF.                                                              
                                                                                
           MOVE PEND-STTLM-LCTN-CD   TO W-DTL1-SETTLE-LOC               CAT527  
           IF PEND-CNS                                                          
              MOVE '-CNS' TO W-DTL1-SETTLE-LOC (3 : 7)                          
           ELSE                                                                 
           IF PEND-FUND-SERV                                                    
              MOVE '-FNDSRV' TO W-DTL1-SETTLE-LOC (3 :7)                        
           ELSE                                                                 
           IF PEND-PTC                                                          
              MOVE '-CNS' TO W-DTL1-SETTLE-LOC (3 : 7)                          
           ELSE                                                                 
           IF PEND-GSCC                                                         
              MOVE '-GSCC' TO W-DTL1-SETTLE-LOC (3 : 7)                         
           ELSE                                                                 
           IF PEND-DTC                                                          
              MOVE '-DTC' TO W-DTL1-SETTLE-LOC (3 : 7)                          
           ELSE                                                                 
           IF PEND-UNDELIVERABLE                                                
              MOVE '-UNDEL' TO W-DTL1-SETTLE-LOC (3 : 7)                        
           ELSE                                                                 
           IF PEND-OCC                                                          
              MOVE '-OCC' TO W-DTL1-SETTLE-LOC (3 : 7)                          
           ELSE                                                                 
           IF PEND-R-D                                                          
              MOVE ' R-D' TO W-DTL1-SETTLE-LOC (3 : 7)                          
           END-IF.                                                              
                                                                                
           MOVE PEND-PRC-CTGY-CD     TO W-DTL1-PRICING-CAT              CAT527  
           MOVE PEND-STTLM-RSN-CD    TO W-DTL1-SETTLE-RSN               CAT527  
           MOVE PEND-CRT-TMSTP       TO W-DTL1-TMSTP                    CAT527  
                                                                        CAT527  
           MOVE W-DTL1-REC               TO W-REPT-LINE.                CAT527  
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT.                      CAT527  
           ADD 2                         TO W-LINE-CNT.                 CAT527  
                                                                        CAT527  
           MOVE PEND-SEC-DESC            TO W-DTL2-DESC                 CAT527  
           MOVE W-DTL2-REC           TO W-REPT-LINE                     CAT527  
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT                       CAT527  
           ADD 1                     TO W-LINE-CNT                      CAT527  
           IF PEND-SEC-DESC (101 : 40) NOT = SPACES                     CAT527  
              MOVE PEND-SEC-DESC (101 : 40) TO W-DTL3-DESC              CAT527  
              MOVE W-DTL3-REC           TO W-REPT-LINE                  CAT527  
              PERFORM 7700-WRITE-LINE THRU 7700-EXIT                    CAT527  
              ADD 1                     TO W-LINE-CNT                   CAT527  
           END-IF                                                       CAT527  
                                                                        CAT527  
           ADD  1                        TO W-CLT-CNT.                  CAT527  
                                                                        CAT527  
       7000-EXIT. EXIT.                                                 CAT527  
      /                                                                 CAT527  
       7100-WRITE-NO-ACT SECTION.                                       CAT527  
                                                                        CAT527  
           DISPLAY 'CAT527: '                                           CAT527  
                       B1-CLT-NBR  (B1-PRT-SUB)                         CAT527  
                   ' ' B1-CLT-NAME (B1-PRT-SUB)                         CAT527  
                   ' NO MSD EXCEPTIONS THIS RUN'                        CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO W-HDR1-CLT                  CAT527  
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                CAT527  
                                         TO W-HDR1-CLT-NAME             CAT527  
                                                                        CAT527  
           ADD  1                        TO W-PAGE-CNT.                 CAT527  
           MOVE 3                        TO W-LINE-CNT.                 CAT527  
                                                                        CAT527  
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                CAT527  
                                                                        CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO W-HDR1-CLT.                 CAT527  
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                CAT527  
                                         TO W-HDR1-CLT-NAME.            CAT527  
                                                                        CAT527  
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                  CAT527  
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                  CAT527  
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                  CAT527  
                                                                        CAT527  
           MOVE W-HDR1-REC               TO REPT-LINE.                  CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO REPT-CLT                    CAT527  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT527  
           WRITE REPT-REC.                                              CAT527  
                                                                        CAT527  
           MOVE W-SYS-MM                 TO W-HDR2-MM.                  CAT527  
           MOVE W-SYS-DD                 TO W-HDR2-DD.                  CAT527  
           MOVE W-SYS-YY                 TO W-HDR2-YY.                  CAT527  
           MOVE W-SYS-HH                 TO W-HDR2-HH.                  CAT527  
           MOVE W-SYS-MN                 TO W-HDR2-MN.                  CAT527  
                                                                        CAT527  
           MOVE W-HDR2-REC               TO REPT-LINE.                  CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO REPT-CLT                    CAT527  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT527  
           WRITE REPT-REC.                                              CAT527  
                                                                        CAT527  
           MOVE W-HDR3-REC               TO REPT-LINE.                  CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO REPT-CLT                    CAT527  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT527  
           WRITE REPT-REC.                                              CAT527  
                                                                        CAT527  
       7100-EXIT. EXIT.                                                 CAT527  
      /                                                                 CAT527  
       7700-WRITE-LINE SECTION.                                         CAT527  
                                                                        CAT527  
           IF   W-LINE-CNT > 56                                         CAT527  
                PERFORM 7800-WRITE-HDR THRU 7800-EXIT.                  CAT527  
                                                                        CAT527  
           MOVE W-REPT-LINE              TO REPT-LINE.                  CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO REPT-CLT.                   CAT527  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT527  
           WRITE REPT-REC.                                              CAT527  
                                                                        CAT527  
       7700-EXIT. EXIT.                                                 CAT527  
      /                                                                 CAT527  
       7800-WRITE-HDR    SECTION.                                       CAT527  
                                                                        CAT527  
           ADD  1                        TO W-PAGE-CNT.                 CAT527  
                                                                        CAT527  
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                CAT527  
                                                                        CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO W-HDR1-CLT.                 CAT527  
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                CAT527  
                                         TO W-HDR1-CLT-NAME.            CAT527  
                                                                        CAT527  
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                  CAT527  
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                  CAT527  
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                  CAT527  
                                                                        CAT527  
           MOVE W-HDR1-REC               TO REPT-LINE.                  CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO REPT-CLT                    CAT527  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT527  
           WRITE REPT-REC.                                              CAT527  
                                                                        CAT527  
           MOVE W-SYS-MM                 TO W-HDR2-MM.                  CAT527  
           MOVE W-SYS-DD                 TO W-HDR2-DD.                  CAT527  
           MOVE W-SYS-YY                 TO W-HDR2-YY.                  CAT527  
           MOVE W-SYS-HH                 TO W-HDR2-HH.                  CAT527  
           MOVE W-SYS-MN                 TO W-HDR2-MN.                  CAT527  
                                                                        CAT527  
           MOVE W-HDR2-REC               TO REPT-LINE.                  CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO REPT-CLT                    CAT527  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT527  
           WRITE REPT-REC.                                              CAT527  
                                                                        CAT527  
           MOVE W-HDR3-REC               TO REPT-LINE.                  CAT527  
           MOVE B1-CLT-NBR (B1-PRT-SUB)  TO REPT-CLT                    CAT527  
           MOVE LOW-VALUES               TO REPT-FIL.                   CAT527  
           WRITE REPT-REC.                                              CAT527  
                                                                        CAT527  
           MOVE 6                        TO W-LINE-CNT.                 CAT527  
                                                                        CAT527  
       7800-EXIT. EXIT.                                                 CAT527  
      /                                                                 CAT527  
       9000-CLOSE-ROUTINE SECTION.                                      CAT527  
                                                                        CAT527  
           CLOSE PENDING-FILE.                                          CAT527  
           CLOSE REPT-FILE.                                             CAT527  
           DISPLAY 'CAT527: REPORT   CLOSED. STATUS = '                 CAT527  
                                               REPT-STAT.               CAT527  
                                                                        CAT527  
           DISPLAY ' '.                                                 CAT527  
           DISPLAY 'CAT527: INFILE CNT = ' W-INFILE-CNT                 CAT527  
               ' INCLUDES HEADER RECORD'.                                       
                                                                        CAT527  
           DISPLAY ' '.                                                 CAT527  
           DISPLAY 'CAT527: PROGRAM ENDED SUCCESSFULLY'.                CAT527  
                                                                        CAT527  
       9000-EXIT.                                                       CAT527  
           EXIT.                                                        CAT527  
