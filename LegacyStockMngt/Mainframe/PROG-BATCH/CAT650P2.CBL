000001* PDX    - CAT650P2 C0319295 11/21/11 08:12:59 TBLAMUR            00001003
LRM003* SSR 78938 EXPAND P2 RECORD TO 120 BYTES TO CAUSE BYTE 120 TO    00001200
LRM003*  TO BE RETAINED IN THE FILE.                                    00001300
000001* PDX    - CAT650P2 C0258158 12/12/07 08:16:51 TBLAMUR            00001400
LRM002*** SSR 52709 CHANGE TOA TO TRANSFER.                             00001500
000001* PDX    - CAT650P2 C0151264 12/11/00 11:55:00 TBTIKUO            00001600
TCK001*** COBOL LE                                                      00001700
000001* PDX    - CAT650P2 C0135778 04/07/00 11:07:01 TBTIKUO            00001800
000200 IDENTIFICATION DIVISION.                                         00001900
000300 PROGRAM-ID.    CAT650P2.                                         00002000
000700*REMARKS.                                                         00002100
000800******************************************************************00002200
      * ===> SSR #1447700                                              *00002300
000900* FLIP "TOA " DESCRIPTION TO BE THE FIRST ONE                    *00003000
001100* THE INPUT FILE WILL BE DUMMIED OUT IN CAT750                   *00004000
004300******************************************************************00005000
004400     EJECT                                                        00006000
004500 ENVIRONMENT DIVISION.                                            00007000
004600 CONFIGURATION SECTION.                                           00008000
004900 INPUT-OUTPUT SECTION.                                            00009000
005000                                                                  00010000
005100 FILE-CONTROL.                                                    00020000
005200                                                                  00030000
005300     SELECT INPUT-P2     ASSIGN TO UT-S-INP2                      00040000
                                      FILE STATUS IS INPUT-P2-STATUS.   00050000
                                                                        00060000
005300     SELECT OUTPUT-P2    ASSIGN TO UT-S-OUTP2                     00070000
                                      FILE STATUS IS OUTPUT-P2-STATUS.  00080000
                                                                        00090000
005900 DATA DIVISION.                                                   00100000
006000 FILE SECTION.                                                    00110000
006100                                                                  00120000
006200 FD  INPUT-P2                                                     00130000
006300     RECORDING MODE IS F                                          00140000
006400     LABEL RECORDS ARE STANDARD                                   00150000
006500     BLOCK CONTAINS 0 RECORDS.                                    00160000
006600 01  INPUT-P2-RECORD             PIC X(120).                      00170000
006701     SKIP3                                                        00180000
006200 FD  OUTPUT-P2                                                    00190000
006300     RECORDING MODE IS F                                          00200000
006400     LABEL RECORDS ARE STANDARD                                   00210000
006500     BLOCK CONTAINS 0 RECORDS.                                    00220000
006600 01  OUTPUT-P2-RECORD            PIC X(120).                      00230000
006701     SKIP3                                                        00240000
006718/                                                                 00250000
009800 WORKING-STORAGE SECTION.                                         00260000
009900                                                                  00270000
010000 COPY PDXIDCOB.                                                   00280000
010100                                                                  00290000
010200 77  PGM-NAME                    PIC X(8) VALUE 'CAT650P2'.       00300000
010605 77  INPUT-P2-READ               PIC S9(9) COMP-3    VALUE +0.    00310000
010605 77  OUTPUT-P2-WRITE             PIC S9(9) COMP-3    VALUE +0.    00320000
       77  SUB                         PIC S9(03) COMP-3   VALUE +0.    00330000
       77  SUB-MINUS-1                 PIC S9(03) COMP-3   VALUE +0.    00340000
       77  SUB-TOA                     PIC S9(03) COMP-3   VALUE +0.    00350000
       77  MAX-SUB                     PIC S9(03) COMP-3   VALUE +0.    00360000
       01  WORK-AREA.                                                   00370000
           05  INPUT-P2-STATUS            PIC X(02).                    00380000
               88 INPUT-P2-OKAY          VALUE '00'.                    00390000
           05  OUTPUT-P2-STATUS           PIC X(02).                    00400000
               88 OUTPUT-P2-OKAY         VALUE '00'.                    00410000
           05  INPUT-P2-SW                PIC X(01) VALUE SPACE.        00420000
               88 INPUT-P2-EOF            VALUE 'Y'.                    00430000
           05  OUTPUT-P2-SW               PIC X(01) VALUE SPACE.        00440000
               88 OUTPUT-P2-EOF           VALUE 'Y'.                    00450000
           05  INPUT-HEADER-READ-SW       PIC X(01) VALUE SPACE.        00460000
               88 INPUT-HEADER-YES        VALUE 'Y'.                    00470000
           05  INPUT-RECORD-READ-SW       PIC X(01) VALUE SPACE.        00480000
               88 DATE-RECORD-YES         VALUE 'H'.                    00490000
               88 TRAILER-RECORD-YES      VALUE 'T'.                    00500000
           05  WS-DESC-HOLD               PIC X(27).                    00510000
           05  HOLD-P2-REC                PIC X(120) VALUE SPACES.      00520000
TCK001*    05  DUMP-SW                    PIC X(01) VALUE 'D'.          00530000
TCK001     05  ABEND-CD                   PIC S9(04) COMP SYNC VALUE 0. 00540000
           05  TOA-SW                     PIC X(01) VALUE ' '.          00550000
               88  TOA-YES                VALUE 'Y'.                    00560000
               88  TOA-NO                 VALUE 'N'.                    00570000
           05  DATE-RECORD.                                             00571000
               10  DATE-FIELD             PIC X(05) VALUE 'DATE='.      00572000
               10  FILLER                 PIC X(115).                   00573000
           05  TRAILER-RECORD.                                          00574000
               10  TRAILER-FIELD          PIC X(08) VALUE 'REC-CNT='.   00575000
               10  FILLER                 PIC X(112).                   00576000
                                                                        00577000
043300* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 00578000
043400*    INPUT P2 RECORD WORK AREA                                    00579000
043500* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 00580000
128700 01  FILLER                 PIC X(16) VALUE 'INPUT-P2-WS '.       00590000
128800 01  INPUT-P2-WORK-AREA.                                          00600000
128900     05  INPUT-P2-REC.                                            00610000
1-52           10  FILLER              PIC X(52).                       00620000
               10  IN-DESC-HOLD.                                        00630000
                   15  IN-TOA-FLD      PIC X(04)  VALUE 'TOA '.         00640000
                   15  FILLER          PIC X(23).                       00650000
                   15  IN-COL80        PIC X(01).                       00660000
                      88 IN-HEADER-REC            VALUE ' '.            00670000
                      88 IN-TRAILER-REC           VALUE '-'.            00680000
134000         10  FILLER              PIC X(40).                       00690000
      *                                                                 00700000
043300* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 00710000
043400*    OUTPUT P2 RECORD WORK AREA                                   00720000
043500* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 00730000
128700 01  FILLER                 PIC X(16) VALUE 'OUTPUT-P2-WS '.      00740000
128800 01  OUTPUT-P2-WORK-AREA    PIC X(720).                           00750000
128900 01  OUTUT-P2-ENTRY  REDEFINES OUTPUT-P2-WORK-AREA.               00760000
           05  OUT-P2-REC  OCCURS 6 TIMES.                              00770000
1-52           10  FILLER              PIC X(52).                       00780000
53-80          10  OUT-DESC-HOLD.                                       00790000
                   15  OUT-TOA-FLD     PIC X(04).                       00800000
                   15  FILLER          PIC X(22).                       00810000
  80               15  OUT-COL80       PIC X(01).                       00820000
81-120         10  FILLER              PIC X(41).                       00830000
      *                                                                 00840000
TCK001   COPY STUBCPY.                                                  00850000
00085 /                                                                 00860000
035142                                                                  00870000
035143 PROCEDURE DIVISION.                                              00880000
035144     COPY  MSGCOBO.                                               00890000
035153                                                                  00900000
035154     OPEN INPUT  INPUT-P2.                                        00910000
           DISPLAY 'CAT650P2 : INPUT P2 FILE OPENED FOR INPUT '         00920000
                       ' FILE STATUS = ' INPUT-P2-STATUS.               00930000
                                                                        00940000
           IF  INPUT-P2-OKAY                                            00950000
               CONTINUE                                                 00960000
           ELSE                                                         00970000
               MOVE 3001               TO  ABEND-CD                     00980000
               DISPLAY ' '                                              00990000
               DISPLAY 'CAT650P2: U3001 - DD INP2  OPEN ERR, '          01000000
                       ' FILE STATUS = ' INPUT-P2-STATUS                01010000
TCK001         CALL  ABEND  USING ABEND-CD                              01020000
           END-IF.                                                      01030000
                                                                        01040000
035154     OPEN OUTPUT  OUTPUT-P2.                                      01050000
           DISPLAY 'CAT650P2 : OUTPUT P2 FILE OPENED FOR INPUT '        01060000
                       ' FILE STATUS = ' OUTPUT-P2-STATUS.              01070000
                                                                        01080000
           IF  OUTPUT-P2-OKAY                                           01090000
               CONTINUE                                                 01100000
           ELSE                                                         01110000
               MOVE 3002                  TO  ABEND-CD                  01120000
               DISPLAY ' '                                              01130000
               DISPLAY 'CAT650P2: U3002 - DD OUTP2  OPEN ERR, '         01140000
                       ' FILE STATUS = ' OUTPUT-P2-STATUS               01150000
TCK001         CALL  ABEND  USING ABEND-CD                              01160000
           END-IF.                                                      01170000
                                                                        01180000
035297     PERFORM 1000-PROCESS-INPUT                                   01190000
035298        THRU 1000-PROCESS-INPUT-EXIT                              01200000
035299        UNTIL INPUT-P2-EOF.                                       01210000
035300                                                                  01220000
035302     CLOSE    INPUT-P2,                                           01230000
035303              OUTPUT-P2.                                          01240000
035304                                                                  01250000
           DISPLAY '   '.                                               01260000
           DISPLAY ' ************************************************'  01270000
           DISPLAY ' ***    INPUT  RECORD COUNT = ' INPUT-P2-READ       01280000
                                                              '    ***'.01290000
           DISPLAY ' ***    OUTPUT RECORD COUNT = ' OUTPUT-P2-WRITE     01300000
                                                              '    ***'.01310000
           DISPLAY ' ************************************************'  01320000
           DISPLAY ' ******                                   *******'. 01330000
           DISPLAY ' ******  CAT650P2 COMPLETED SUCCESSFULLY  *******'. 01340000
           DISPLAY ' ******                                   *******'. 01350000
           DISPLAY ' ************************************************'  01360000
           DISPLAY '   '.                                               01370000
035318     STOP RUN.                                                    01380000
035319/                                                                 01390000
035320 1000-PROCESS-INPUT.                                              01400000
TCKTMP*    DISPLAY ' '.                                                 01410000
TCKTMP*    DISPLAY 'CAT650P2 : **  1000-PROCESS-INPUT. **'.             01420000
                                                                        01430000
           INITIALIZE INPUT-P2-WORK-AREA.                               01440000
           MOVE  1    TO SUB.                                           01450000
           MOVE  0    TO MAX-SUB.                                       01460000
           MOVE SPACE TO TOA-SW.                                        01461000
                                                                        01462000
           PERFORM 0100-LOAD-P2-INPUT THRU                              01463000
                   0100-LOAD-P2-INPUT-EXIT.                             01464000
                                                                        01465000
      *** HANDLE EMPTY DATA SET ****                                    01466000
           IF INPUT-P2-EOF AND                                          01467000
              INPUT-P2-READ = +0                                        01468000
              GO TO 1000-PROCESS-INPUT-EXIT                             01469000
           ELSE                                                         01470000
              IF TRAILER-RECORD-YES                                     01480000
                 GO TO 1000-PROCESS-INPUT-EXIT                          01490000
              END-IF                                                    01500000
           END-IF.                                                      01510000
                                                                        01520000
04/06      IF TOA-YES                                                   01530000
              PERFORM 0200-MOVE-P2-DESC THRU                            01540000
                      0200-MOVE-P2-DESC-EXIT                            01550000
           END-IF.                                                      01560000
                                                                        01570000
           MOVE 1 TO SUB.                                               01580000
           PERFORM                                                      01590000
              UNTIL SUB > MAX-SUB                                       01600000
              WRITE OUTPUT-P2-RECORD FROM  OUT-P2-REC (SUB)             01610000
              ADD +1 TO OUTPUT-P2-WRITE                                 01620000
              ADD 1 TO SUB                                              01630000
           END-PERFORM.                                                 01640000
                                                                        01650000
           GO TO 1000-PROCESS-INPUT.                                    01660000
                                                                        01670000
       1000-PROCESS-INPUT-EXIT.                                         01680000
           EXIT.                                                        01690000
      /                                                                 01700000
       0100-LOAD-P2-INPUT.                                              01710000
TCKTMP*    DISPLAY ' '.                                                 01720000
TCKTMP*    DISPLAY 'CAT650P2: 0100-LOAD-P2-INPUT.'                      01730000
                                                                        01740000
           IF HOLD-P2-REC > SPACES                                      01750000
              MOVE HOLD-P2-REC TO INPUT-P2-REC                          01760000
              MOVE SPACES      TO HOLD-P2-REC                           01770000
              SUBTRACT +1 FROM  INPUT-P2-READ                           01780000
              IF INPUT-P2-REC (1:8) = TRAILER-FIELD                     01781000
                 SET TRAILER-RECORD-YES TO TRUE                         01782000
                 WRITE OUTPUT-P2-RECORD FROM INPUT-P2-REC               01783000
                 GO TO 0100-LOAD-P2-INPUT                               01784000
              END-IF                                                    01785000
           ELSE                                                         01786000
              READ INPUT-P2  INTO    INPUT-P2-REC                       01787000
               AT END                                                   01788000
                     DISPLAY ' /// END OF INPUT P2 FILE IS REACHED ///' 01789000
                     SET INPUT-P2-EOF TO TRUE                           01790000
                     GO TO 0100-LOAD-P2-INPUT-EXIT                      01800000
           END-IF.                                                      01810000
                                                                        01820000
                                                                        01830000
      ***** CHECK FIRST RECORD - DATE RECORD *****                      01840000
           IF INPUT-P2-REC (1:5) = DATE-FIELD                           01850000
              SET DATE-RECORD-YES TO TRUE                               01860000
              WRITE OUTPUT-P2-RECORD FROM  INPUT-P2-REC                 01870000
              GO TO 0100-LOAD-P2-INPUT                                  01880000
           END-IF.                                                      01890000
                                                                        01891000
           ADD +1 TO INPUT-P2-READ.                                     01892000
                                                                        01893000
      ***** CHECK OTHER RECORDS & ONES BEFORE TRAILER  *****            01894000
      ***** COL80 IS SPACE = HEADER RECORD, BUT DATE-REC & TRAILER-REC  01895000
      ***** ALSO HAS SPACE IN CLO80.                                    01896000
           IF IN-COL80 = SPACE                                          01897000
              IF INPUT-HEADER-READ-SW = SPACE                           01898000
                 SET INPUT-HEADER-YES TO TRUE                           01899000
03/20            IF INPUT-P2-REC (1:8) = TRAILER-FIELD   AND            01900000
                    INPUT-P2-READ < 2                                   01910000
                    SUBTRACT +1 FROM  INPUT-P2-READ                     01920000
                    SET TRAILER-RECORD-YES TO TRUE                      01921000
                    WRITE OUTPUT-P2-RECORD FROM INPUT-P2-REC            01922000
                    GO TO 0100-LOAD-P2-INPUT-EXIT                       01923000
03/20            END-IF                                                 01924000
              ELSE                                                      01925000
                 MOVE SPACES TO INPUT-HEADER-READ-SW                    01926000
                 SUBTRACT 1 FROM SUB                                    01927000
                 MOVE SUB               TO MAX-SUB                      01928000
                 MOVE INPUT-P2-REC      TO HOLD-P2-REC                  01929000
                 GO TO 0100-LOAD-P2-INPUT-EXIT                          01930000
              END-IF                                                    01940000
           END-IF.                                                      01950000
                                                                        01960000
           IF IN-TOA-FLD = 'TOA '                                       01970000
              SET TOA-YES TO TRUE                                       01980000
              MOVE SUB TO SUB-TOA                                       01990000
           END-IF.                                                      02000000
                                                                        02001000
           MOVE INPUT-P2-REC TO OUT-P2-REC (SUB).                       02002000
           ADD 1 TO SUB.                                                02003000
                                                                        02004000
           IF SUB > 6                                                   02005000
              GO TO 0100-LOAD-P2-INPUT-EXIT                             02006000
           ELSE                                                         02007000
              GO TO 0100-LOAD-P2-INPUT                                  02008000
           END-IF.                                                      02009000
                                                                        02010000
       0100-LOAD-P2-INPUT-EXIT.                                         02020000
           EXIT.                                                        02030000
      /                                                                 02040000
       0200-MOVE-P2-DESC.                                               02050000
TCKTMP*    DISPLAY ' '.                                                 02060000
TCKTMP*    DISPLAY 'CAT650P2: 0200-MOVE-P2-DESC.'                       02070000
                                                                        02080000
           MOVE OUT-DESC-HOLD (SUB-TOA) TO WS-DESC-HOLD.                02090000
                                                                        02100000
           PERFORM                                                      02110000
             UNTIL SUB-TOA = 1                                          02120000
               COMPUTE SUB-MINUS-1 = SUB-TOA - 1                        02130000
               MOVE OUT-DESC-HOLD (SUB-MINUS-1) TO                      02140000
                                        OUT-DESC-HOLD (SUB-TOA)         02150000
               SUBTRACT 1 FROM SUB-TOA                                  02160000
           END-PERFORM.                                                 02170000
                                                                        02180000
LRM002*****MOVE WS-DESC-HOLD TO OUT-DESC-HOLD (1).                      02190000
LRM002     MOVE 'TRANSFER'   TO OUT-DESC-HOLD (1).                      02200000
LRM002     IF WS-DESC-HOLD(5:2) = 'TO'                                  02210000
LRM002        MOVE 'TO '               TO OUT-DESC-HOLD(1) (10:3)       02220000
LRM002        MOVE WS-DESC-HOLD(10:15) TO OUT-DESC-HOLD(1) (13:15)      02230000
LRM002     ELSE                                                         02240000
LRM002        MOVE WS-DESC-HOLD(5:18)  TO OUT-DESC-HOLD(1) (10:18)      02250000
LRM002     END-IF.                                                      02260000
                                                                        02270000
       0200-MOVE-P2-DESC-EXIT.                                          02280000
           EXIT.                                                        02290000
      /                                                                 02300000
