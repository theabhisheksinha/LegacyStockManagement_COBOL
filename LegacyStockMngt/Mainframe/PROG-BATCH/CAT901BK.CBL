000001* PDX    - CAT901BK C0340636 04/23/13 09:20:13 TBLAMUR            00001000
000001* PDX    - CAT901BK C0339823 04/04/13 15:20:12 TBLAMUR            00001101
000200 IDENTIFICATION DIVISION.                                         00001800
000300 PROGRAM-ID.    CAT901BK.                                         00001900
000700*REMARKS.                                                         00002000
000800******************************************************************00002100
      * ===> SSR #90938                                                *00002200
000900* TIF CLIENT 63 QA RECORDS INTO T STREAM AS CLIENT 166.          *00002300
001100* READ EXISTING QA,T STREAM FILES AND EXTRACT/COPY/MERGE.        *00002400
001200* USE PARM TO OBTAIN FROM/TO CLIENT NUMBERS.                     *00002500
004300******************************************************************00002600
004400     EJECT                                                        00002700
004500 ENVIRONMENT DIVISION.                                            00002800
004600 CONFIGURATION SECTION.                                           00002900
004900 INPUT-OUTPUT SECTION.                                            00003000
005000                                                                  00003100
005100 FILE-CONTROL.                                                    00004000
005200                                                                  00005000
005300     SELECT INPUT-P2-FROM ASSIGN TO UT-S-INP2FROM                 00006000
                       FILE STATUS IS INPUT-P2-FROM-STATUS.             00007000
005300     SELECT INPUT-P2-ORIG  ASSIGN TO UT-S-INP2ORIG                00007100
                       FILE STATUS IS INPUT-P2-ORIG-STATUS.             00007200
                                                                        00008000
005300     SELECT OUTPUT-P2    ASSIGN TO UT-S-OUTP2                     00009000
                                      FILE STATUS IS OUTPUT-P2-STATUS.  00010000
                                                                        00020000
005900 DATA DIVISION.                                                   00030000
006000 FILE SECTION.                                                    00040000
006100                                                                  00050000
006200 FD  INPUT-P2-FROM                                                00060000
006300     RECORDING MODE IS F                                          00070000
006400     LABEL RECORDS ARE STANDARD                                   00080000
006500     BLOCK CONTAINS 0 RECORDS.                                    00090000
006600 01  INPUT-P2-RECORD-FROM        PIC X(120).                      00100000
006701     SKIP3                                                        00110000
006200 FD  INPUT-P2-ORIG                                                00111000
006300     RECORDING MODE IS F                                          00112000
006400     LABEL RECORDS ARE STANDARD                                   00113000
006500     BLOCK CONTAINS 0 RECORDS.                                    00114000
006600 01  INPUT-P2-RECORD-ORIG        PIC X(120).                      00115000
006701     SKIP3                                                        00116000
006200 FD  OUTPUT-P2                                                    00120000
006300     RECORDING MODE IS F                                          00130000
006400     LABEL RECORDS ARE STANDARD                                   00140000
006500     BLOCK CONTAINS 0 RECORDS.                                    00150000
006600 01  OUTPUT-P2-RECORD            PIC X(120).                      00160000
006701     SKIP3                                                        00170000
006718/                                                                 00180000
009800 WORKING-STORAGE SECTION.                                         00190000
009900                                                                  00200000
010000 COPY PDXIDCOB.                                                   00210000
010100                                                                  00220000
010200 77  PGM-NAME                    PIC X(8) VALUE 'CAT901BK'.       00230000
010605 77  INPUT-P2-READ               PIC S9(9) COMP-3    VALUE +0.    00240000
010605 77  OUTPUT-P2-WRITE             PIC S9(9) COMP-3    VALUE +0.    00250000
       01  WORK-AREA.                                                   00300000
           05  INPUT-P2-FROM-STATUS       PIC X(02).                    00310000
               88 INPUT-P2-FROM-OKAY      VALUE '00'.                   00320000
           05  INPUT-P2-ORIG-STATUS       PIC X(02).                    00321000
               88 INPUT-P2-ORIG-OKAY      VALUE '00'.                   00322000
           05  OUTPUT-P2-STATUS           PIC X(02).                    00330000
               88 OUTPUT-P2-OKAY         VALUE '00'.                    00340000
           05  INPUT-P2-FROM-SW           PIC X(01) VALUE SPACE.        00350000
               88 INPUT-P2-FROM-EOF       VALUE 'Y'.                    00360000
           05  INPUT-P2-ORIG-SW           PIC X(01) VALUE SPACE.        00361000
               88 INPUT-P2-ORIG-EOF       VALUE 'Y'.                    00362000
           05  DUMP-SW                    PIC X(01) VALUE 'D'.          00460000
           05  ABEND-CD                   PIC S9(04) COMP SYNC VALUE 0. 00470000
           05  DATE-RECORD.                                             00510000
               10  DATE-FIELD             PIC X(05) VALUE 'DATE='.      00520000
               10  FILLER                 PIC X(115).                   00530000
           05  TRAILER-RECORD.                                          00540000
               10  TRAILER-FIELD          PIC X(08) VALUE 'REC-CNT='.   00550000
               10  TRAILER-REC-COUNT      PIC 9(11).                    00560000
               10  FILLER                 PIC X(101).                   00561000
                                                                        00570000
         COPY STUBCPY.                                                  00780000
00085 /                                                                 00790000
      /                                                                 00790100
      ***************************************************************** 00790200
       LINKAGE SECTION.                                                 00790300
      ***************************************************************** 00790400
       01  PARM-AREA.                                                   00790500
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.        00790600
               88  PARM-LENGTH-VALID                    VALUE +07.      00790700
           05  PARM-INFO.                                               00790800
               10  PARM-FROM-CLIENT         PIC X(03).                  00790900
               10  FILLER                   PIC X(01).                  00791000
               10  PARM-TO-CLIENT           PIC X(03).                  00791100
00085 /                                                                 00791200
       PROCEDURE DIVISION USING PARM-AREA.                              00791300
035144     COPY  MSGCOBO.                                               00820000
035153                                                                  00830000
035154     OPEN INPUT  INPUT-P2-FROM.                                   00840000
           DISPLAY 'CAT901BK : INPUT P2 FILE OPENED FOR INPUT '         00850000
                       ' FILE STATUS = ' INPUT-P2-FROM-STATUS.          00860000
                                                                        00870000
           IF  INPUT-P2-FROM-OKAY                                       00880000
               CONTINUE                                                 00890000
           ELSE                                                         00900000
               MOVE 3001               TO  ABEND-CD                     00910000
               DISPLAY ' '                                              00920000
               DISPLAY 'CAT901BK: U3001 - DD INP2FROM  OPEN ERR, '      00930000
                       ' FILE STATUS = ' INPUT-P2-FROM-STATUS           00940000
               CALL  ABEND  USING ABEND-CD                              00950000
           END-IF.                                                      00960000
                                                                        00970000
035154     OPEN INPUT  INPUT-P2-ORIG.                                   00971000
           DISPLAY 'CAT901BK : INPUT P2 FILE ORIG OPENED FOR INPUT '    00972000
                       ' FILE STATUS = ' INPUT-P2-ORIG-STATUS.          00973000
                                                                        00974000
           IF  INPUT-P2-ORIG-OKAY                                       00975000
               CONTINUE                                                 00976000
           ELSE                                                         00977000
               MOVE 3002               TO  ABEND-CD                     00978000
               DISPLAY ' '                                              00979000
               DISPLAY 'CAT901BK: U3002 - DD INP2ORIG  OPEN ERR, '      00979100
                       ' FILE STATUS = ' INPUT-P2-ORIG-STATUS           00979200
               CALL  ABEND  USING ABEND-CD                              00979300
           END-IF.                                                      00979400
                                                                        00979500
035154     OPEN OUTPUT  OUTPUT-P2.                                      00979600
           DISPLAY 'CAT901BK : OUTPUT P2 FILE OPENED FOR INPUT '        00979700
                       ' FILE STATUS = ' OUTPUT-P2-STATUS.              00979800
                                                                        00979900
           IF  OUTPUT-P2-OKAY                                           00980000
               CONTINUE                                                 00980100
           ELSE                                                         00980200
               MOVE 3002                  TO  ABEND-CD                  00980300
               DISPLAY ' '                                              00980400
               DISPLAY 'CAT901BK: U3002 - DD OUTP2  OPEN ERR, '         00980500
                       ' FILE STATUS = ' OUTPUT-P2-STATUS               00980600
               CALL  ABEND  USING ABEND-CD                              00980700
           END-IF.                                                      00980800
                                                                        00980900
******** READ 1ST RECORD (DATE HEADER) ON ORIGINAL FILE AND WRITE OUT.  00981000
           READ INPUT-P2-ORIG                                           00981100
               AT END                                                   00981200
                  DISPLAY 'END OF INPUT P2 ORIG'                        00981300
                  SET INPUT-P2-ORIG-EOF TO TRUE.                        00981400
           IF NOT INPUT-P2-ORIG-EOF                                     00981500
           AND INPUT-P2-RECORD-ORIG(1 : 4) = 'DATE'                     00981600
              WRITE OUTPUT-P2-RECORD FROM  INPUT-P2-RECORD-ORIG         00981700
           END-IF.                                                      00982000
                                                                        00983000
035297     PERFORM 1000-PROCESS-FROM-INPUT                              01120000
035298        THRU 1000-PROCESS-FROM-INPUT-EXIT                         01130000
035299        UNTIL INPUT-P2-FROM-EOF.                                  01140000
035300                                                                  01150000
035297     PERFORM 2000-PROCESS-ORIG-INPUT                              01151000
035298        THRU 2000-PROCESS-ORIG-INPUT-EXIT                         01152000
035299        UNTIL INPUT-P2-ORIG-EOF.                                  01153000
035300                                                                  01154000
035302     CLOSE    INPUT-P2-FROM                                       01160000
035302              INPUT-P2-ORIG                                       01161000
035303              OUTPUT-P2.                                          01170000
035304                                                                  01180000
           DISPLAY '   '.                                               01190000
           DISPLAY ' ************************************************'  01200000
           DISPLAY ' ***    INPUT  RECORD COUNT = ' INPUT-P2-READ       01210000
                                                              '    ***'.01220000
           DISPLAY ' ***    OUTPUT RECORD COUNT = ' OUTPUT-P2-WRITE     01230000
                                                              '    ***'.01240000
           DISPLAY ' ************************************************'  01250000
           DISPLAY ' ******                                   *******'. 01260000
           DISPLAY ' ******  CAT901BK COMPLETED SUCCESSFULLY  *******'. 01270000
           DISPLAY ' ******                                   *******'. 01280000
           DISPLAY ' ************************************************'  01290000
           DISPLAY '   '.                                               01300000
035318     STOP RUN.                                                    01310000
035319/                                                                 01320000
035320 1000-PROCESS-FROM-INPUT.                                         01330000
                                                                        01360000
           READ INPUT-P2-FROM                                           01370000
               AT END                                                   01380000
                  DISPLAY 'END OF INPUT P2 FROM'                        01390000
                  SET INPUT-P2-FROM-EOF TO TRUE.                        01400000
                                                                        01401000
           IF NOT INPUT-P2-FROM-EOF                                     01410000
           AND INPUT-P2-RECORD-FROM(4 : 3) = PARM-FROM-CLIENT           01420000
              MOVE PARM-TO-CLIENT TO INPUT-P2-RECORD-FROM(4 : 3)        01450000
              WRITE OUTPUT-P2-RECORD FROM  INPUT-P2-RECORD-FROM         01460000
              ADD +1 TO OUTPUT-P2-WRITE                                 01470000
           END-IF.                                                      01480000
                                                                        01600000
       1000-PROCESS-FROM-INPUT-EXIT.                                    01610000
           EXIT.                                                        01620000
035320 2000-PROCESS-ORIG-INPUT.                                         01630000
                                                                        01640000
           READ INPUT-P2-ORIG                                           01650000
               AT END                                                   01660000
                  DISPLAY 'END OF INPUT P2 ORIG'                        01670000
                  SET INPUT-P2-ORIG-EOF TO TRUE.                        01680000
                                                                        01690000
           IF NOT INPUT-P2-ORIG-EOF                                     01700000
              IF INPUT-P2-RECORD-ORIG(1 : 7) = 'REC-CNT'                01730000
                 MOVE INPUT-P2-RECORD-ORIG TO TRAILER-RECORD            01730100
                 MOVE OUTPUT-P2-WRITE TO TRAILER-REC-COUNT              01730300
                 WRITE OUTPUT-P2-RECORD FROM  TRAILER-RECORD            01730500
              ELSE                                                      01730600
                 WRITE OUTPUT-P2-RECORD FROM  INPUT-P2-RECORD-ORIG      01731000
                 ADD +1 TO OUTPUT-P2-WRITE                              01740000
              END-IF                                                    01741000
           END-IF.                                                      01750000
                                                                        01760000
       2000-PROCESS-ORIG-INPUT-EXIT.                                    01770000
           EXIT.                                                        01780000
