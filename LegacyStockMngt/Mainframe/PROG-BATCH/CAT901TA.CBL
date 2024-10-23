000001* PDX    - CAT901TA C0339823 04/05/13 09:05:29 TBLAMUR            00001012
000200 IDENTIFICATION DIVISION.                                         00001100
000300 PROGRAM-ID.    CAT901TA.                                         00001200
000700*REMARKS.                                                         00001300
000800******************************************************************00001400
      * ===> SSR #90938                                                *00001500
000900* TIF CLIENT 63 QA TACT RECORDS INTO T STREAM AS CLIENT 166.     *00001600
001100* READ EXISTING QA,T STREAM FILES AND EXTRACT/COPY/MERGE.        *00001700
001200* USE PARM TO OBTAIN FROM/TO CLIENT NUMBERS.                     *00001800
004300******************************************************************00001900
004400     EJECT                                                        00002000
004500 ENVIRONMENT DIVISION.                                            00002100
004600 CONFIGURATION SECTION.                                           00002200
004900 INPUT-OUTPUT SECTION.                                            00002300
005000                                                                  00002400
005100 FILE-CONTROL.                                                    00002500
005200                                                                  00002600
005300     SELECT INPUT-P2-FROM ASSIGN TO UT-S-ITACFROM                 00002700
                       FILE STATUS IS INPUT-P2-FROM-STATUS.             00002800
005300     SELECT INPUT-P2-ORIG  ASSIGN TO UT-S-ITACORIG                00002900
                       FILE STATUS IS INPUT-P2-ORIG-STATUS.             00003000
                                                                        00004000
005300     SELECT OUTPUT-P2    ASSIGN TO UT-S-OUTTACT                   00005000
                                      FILE STATUS IS OUTPUT-P2-STATUS.  00006000
                                                                        00007000
005900 DATA DIVISION.                                                   00008000
006000 FILE SECTION.                                                    00009000
006100                                                                  00010000
006200 FD  INPUT-P2-FROM                                                00020000
           RECORDING MODE IS V                                          00021000
           RECORD IS VARYING IN SIZE FROM 1 TO 8000 CHARACTERS          00022000
              DEPENDING ON WS-FROM-REC-LEN-IN                           00023001
006500     BLOCK CONTAINS 0 RECORDS.                                    00050000
006600 01  INPUT-P2-RECORD-FROM        PIC X(8000).                     00060000
006701     SKIP3                                                        00070000
006200 FD  INPUT-P2-ORIG                                                00080000
006300     RECORDING MODE IS V                                          00090000
006400     RECORD IS VARYING IN SIZE FROM 1 TO 8000 CHARACTERS          00100000
              DEPENDING ON WS-ORIG-REC-LEN-IN                           00101001
006500     BLOCK CONTAINS 0 RECORDS.                                    00110000
006600 01  INPUT-P2-RECORD-ORIG        PIC X(8000).                     00111000
006701     SKIP3                                                        00112000
006200 FD  OUTPUT-P2                                                    00113000
           RECORDING MODE IS V                                          00114007
006400     RECORD IS VARYING IN SIZE FROM 1 TO 8000 CHARACTERS          00115000
              DEPENDING ON WS-P2-REC-LEN-OUT                            00115101
006500     BLOCK CONTAINS 0 RECORDS.                                    00116000
006600 01  OUTPUT-P2-RECORD            PIC X(8000).                     00117103
006701     SKIP3                                                        00118000
006718/                                                                 00119000
009800 WORKING-STORAGE SECTION.                                         00120000
009900                                                                  00130000
010000 COPY PDXIDCOB.                                                   00140000
010100                                                                  00150000
010200 77  PGM-NAME                    PIC X(8) VALUE 'CAT901TA'.       00160000
010605 77  INPUT-P2-READ               PIC S9(9) COMP-3    VALUE +0.    00170000
010605 77  OUTPUT-P2-WRITE             PIC S9(9) COMP-3    VALUE +0.    00180000
       77  WS-FROM-REC-LEN-IN          PIC 9(05)  VALUE 11.             00181001
       77  WS-ORIG-REC-LEN-IN          PIC 9(05)  VALUE 11.             00182001
       77  WS-P2-REC-LEN-OUT           PIC 9(05)  VALUE 11.             00183001
       01  WORK-AREA.                                                   00190000
           05  INPUT-P2-FROM-STATUS       PIC X(02).                    00200000
               88 INPUT-P2-FROM-OKAY      VALUE '00'.                   00210000
           05  INPUT-P2-ORIG-STATUS       PIC X(02).                    00220000
               88 INPUT-P2-ORIG-OKAY      VALUE '00'.                   00230000
           05  OUTPUT-P2-STATUS           PIC X(02).                    00240000
               88 OUTPUT-P2-OKAY         VALUE '00'.                    00250000
           05  INPUT-P2-FROM-SW           PIC X(01) VALUE SPACE.        00260000
               88 INPUT-P2-FROM-EOF       VALUE 'Y'.                    00270000
           05  INPUT-P2-ORIG-SW           PIC X(01) VALUE SPACE.        00280000
               88 INPUT-P2-ORIG-EOF       VALUE 'Y'.                    00290000
           05  DUMP-SW                    PIC X(01) VALUE 'D'.          00300000
           05  ABEND-CD                   PIC S9(04) COMP SYNC VALUE 0. 00310000
           05  DATE-RECORD.                                             00320000
               10  DATE-FIELD             PIC X(05) VALUE 'DATE='.      00330000
               10  FILLER                 PIC X(115).                   00340000
           05  TRAILER-RECORD.                                          00350000
               10  FILLER                 PIC X(144).                   00360011
               10  TRAILER-REC-COUNT      PIC 9(11).                    00370000
               10  FILLER                 PIC X(7900).                  00380011
                                                                        00390000
         COPY STUBCPY.                                                  00400000
00085 /                                                                 00410000
      /                                                                 00420000
      ***************************************************************** 00430000
       LINKAGE SECTION.                                                 00440000
      ***************************************************************** 00450000
       01  PARM-AREA.                                                   00460000
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.        00470000
               88  PARM-LENGTH-VALID                    VALUE +07.      00480000
           05  PARM-INFO.                                               00490000
               10  PARM-FROM-CLIENT         PIC X(03).                  00500000
               10  FILLER                   PIC X(01).                  00510000
               10  PARM-TO-CLIENT           PIC X(03).                  00520000
00085 /                                                                 00530000
       PROCEDURE DIVISION USING PARM-AREA.                              00540000
035144     COPY  MSGCOBO.                                               00550000
035153                                                                  00560000
035154     OPEN INPUT  INPUT-P2-FROM.                                   00570000
           DISPLAY 'CAT901TA : INPUT P2 FILE OPENED FOR INPUT '         00580000
                       ' FILE STATUS = ' INPUT-P2-FROM-STATUS.          00590000
                                                                        00600000
           IF  INPUT-P2-FROM-OKAY                                       00610000
               CONTINUE                                                 00620000
           ELSE                                                         00630000
               MOVE 3001               TO  ABEND-CD                     00640000
               DISPLAY ' '                                              00650000
               DISPLAY 'CAT901TA: U3001 - DD ITACFROM  OPEN ERR, '      00660000
                       ' FILE STATUS = ' INPUT-P2-FROM-STATUS           00670000
               CALL  ABEND  USING ABEND-CD                              00680000
           END-IF.                                                      00690000
                                                                        00700000
035154     OPEN INPUT  INPUT-P2-ORIG.                                   00710000
           DISPLAY 'CAT901TA : INPUT P2 FILE ORIG OPENED FOR INPUT '    00720000
                       ' FILE STATUS = ' INPUT-P2-ORIG-STATUS.          00730000
                                                                        00740000
           IF  INPUT-P2-ORIG-OKAY                                       00750000
               CONTINUE                                                 00760000
           ELSE                                                         00770000
               MOVE 3002               TO  ABEND-CD                     00780000
               DISPLAY ' '                                              00790000
               DISPLAY 'CAT901TA: U3002 - DD ITACORIG  OPEN ERR, '      00800000
                       ' FILE STATUS = ' INPUT-P2-ORIG-STATUS           00810000
               CALL  ABEND  USING ABEND-CD                              00820000
           END-IF.                                                      00830000
                                                                        00840000
035154     OPEN OUTPUT  OUTPUT-P2.                                      00850000
           DISPLAY 'CAT901TA : OUTPUT P2 FILE OPENED FOR INPUT '        00860000
                       ' FILE STATUS = ' OUTPUT-P2-STATUS.              00870000
                                                                        00880000
           IF  OUTPUT-P2-OKAY                                           00890000
               CONTINUE                                                 00900000
           ELSE                                                         00910000
               MOVE 3002                  TO  ABEND-CD                  00920000
               DISPLAY ' '                                              00930000
               DISPLAY 'CAT901TA: U3002 - DD OUTP2  OPEN ERR, '         00940000
                       ' FILE STATUS = ' OUTPUT-P2-STATUS               00950000
               CALL  ABEND  USING ABEND-CD                              00960000
           END-IF.                                                      00970000
                                                                        00980000
******** READ 1ST RECORD (DATE HEADER) ON ORIGINAL FILE AND WRITE OUT.  00981000
           READ INPUT-P2-ORIG                                           00981100
               AT END                                                   00981200
                  DISPLAY 'END OF INPUT P2 ORIG'                        00981300
                  SET INPUT-P2-ORIG-EOF TO TRUE.                        00981400
           IF NOT INPUT-P2-ORIG-EOF                                     00981500
           AND INPUT-P2-RECORD-ORIG(137 : 4) = 'DATE'                   00981600
              MOVE WS-ORIG-REC-LEN-IN TO WS-P2-REC-LEN-OUT              00981701
              WRITE OUTPUT-P2-RECORD FROM  INPUT-P2-RECORD-ORIG         00981900
           END-IF.                                                      00982100
                                                                        00982200
035297     PERFORM 1000-PROCESS-FROM-INPUT                              00983000
035298        THRU 1000-PROCESS-FROM-INPUT-EXIT                         00984000
035299        UNTIL INPUT-P2-FROM-EOF.                                  00985000
035300                                                                  00986000
035297     PERFORM 2000-PROCESS-ORIG-INPUT                              00987000
035298        THRU 2000-PROCESS-ORIG-INPUT-EXIT                         00988000
035299        UNTIL INPUT-P2-ORIG-EOF.                                  00989000
035300                                                                  00990000
035302     CLOSE    INPUT-P2-FROM                                       01000000
035302              INPUT-P2-ORIG                                       01010000
035303              OUTPUT-P2.                                          01020000
035304                                                                  01030000
           DISPLAY '   '.                                               01040000
           DISPLAY ' ************************************************'  01050000
           DISPLAY ' ***    INPUT  RECORD COUNT = ' INPUT-P2-READ       01060000
                                                              '    ***'.01070000
           DISPLAY ' ***    OUTPUT RECORD COUNT = ' OUTPUT-P2-WRITE     01080000
                                                              '    ***'.01090000
           DISPLAY ' ************************************************'  01100000
           DISPLAY ' ******                                   *******'. 01110000
           DISPLAY ' ******  CAT901TA COMPLETED SUCCESSFULLY  *******'. 01120000
           DISPLAY ' ******                                   *******'. 01130000
           DISPLAY ' ************************************************'  01140000
           DISPLAY '   '.                                               01150000
035318     STOP RUN.                                                    01160000
035319/                                                                 01170000
035320 1000-PROCESS-FROM-INPUT.                                         01180000
                                                                        01190000
           READ INPUT-P2-FROM                                           01200000
               AT END                                                   01210000
                  DISPLAY 'END OF INPUT P2 FROM'                        01220000
                  SET INPUT-P2-FROM-EOF TO TRUE.                        01230000
                                                                        01240000
           IF NOT INPUT-P2-FROM-EOF                                     01250000
           AND INPUT-P2-RECORD-FROM(17 : 3) = PARM-FROM-CLIENT          01260009
              MOVE PARM-TO-CLIENT TO INPUT-P2-RECORD-FROM(17 : 3)       01270009
              MOVE WS-FROM-REC-LEN-IN TO WS-P2-REC-LEN-OUT              01271001
              WRITE OUTPUT-P2-RECORD FROM  INPUT-P2-RECORD-FROM         01280000
              ADD +1 TO OUTPUT-P2-WRITE                                 01290000
           END-IF.                                                      01300000
                                                                        01310000
       1000-PROCESS-FROM-INPUT-EXIT.                                    01320000
           EXIT.                                                        01330000
035320 2000-PROCESS-ORIG-INPUT.                                         01340000
                                                                        01350000
           READ INPUT-P2-ORIG                                           01360000
               AT END                                                   01370000
                  DISPLAY 'END OF INPUT P2 ORIG'                        01380000
                  SET INPUT-P2-ORIG-EOF TO TRUE.                        01390000
                                                                        01400000
           IF NOT INPUT-P2-ORIG-EOF                                     01410000
              IF INPUT-P2-RECORD-ORIG(137 : 7) = 'REC-CNT'              01420000
                 MOVE INPUT-P2-RECORD-ORIG TO TRAILER-RECORD            01430000
                 MOVE OUTPUT-P2-WRITE TO TRAILER-REC-COUNT              01450000
                 MOVE WS-ORIG-REC-LEN-IN TO WS-P2-REC-LEN-OUT           01451001
                 WRITE OUTPUT-P2-RECORD FROM  TRAILER-RECORD            01460000
              ELSE                                                      01470000
                 MOVE WS-ORIG-REC-LEN-IN TO WS-P2-REC-LEN-OUT           01471001
                 WRITE OUTPUT-P2-RECORD FROM  INPUT-P2-RECORD-ORIG      01480000
                 ADD +1 TO OUTPUT-P2-WRITE                              01490000
              END-IF                                                    01500000
           END-IF.                                                      01510000
                                                                        01520000
       2000-PROCESS-ORIG-INPUT-EXIT.                                    01530000
           EXIT.                                                        01540000
