000001* PDX    - CAT993   C0281870 06/02/09 16:44:48 TBLAMUR            00001006
LRM001* TASK 65231 REMOVE LINE4 TO CAUSE THE DETAIL HAVING THE CLIENT   00001104
LRM001*   CLEARING NUMBER TO LINE-UP WITH LOOKUP RTN.                   00001203
000001* PDX    - CAT993   C0151283 12/18/00 13:47:54 TBTIKUO            00001300
000001* PDX    - CAT993   C0123407 03/19/99 14:08:51 TBYOHON            00001400
000100 IDENTIFICATION DIVISION.                                         00001500
000200 PROGRAM-ID.  CAT993.                                             00001600
003600 ENVIRONMENT DIVISION.                                            00001700
003700 INPUT-OUTPUT SECTION.                                            00001800
003800 FILE-CONTROL.                                                    00001900
003900                                                                  00002000
004000     SELECT INFILE           ASSIGN       TO INFILE.              00002100
004300     SELECT OUTFILE          ASSIGN       TO OUTFILE.             00002200
004400                                                                  00003000
005200 DATA DIVISION.                                                   00004000
005300 FILE SECTION.                                                    00005000
005400 FD  INFILE                                                       00006000
005800     BLOCK CONTAINS 0 RECORDS.                                    00007000
005900 01  IN-REC    PIC X(133).                                        00008000
006500                                                                  00009000
006600 FD  OUTFILE                                                      00010000
007000     BLOCK CONTAINS 0 RECORDS.                                    00020000
007100                                                                  00030000
007200 01  OUT-REC   PIC X(143).                                        00040000
007300                                                                  00050000
008500 WORKING-STORAGE SECTION.                                         00060000
008600 COPY PDXIDCOB.                                                   00070000
008700                                                                  00080000
008800 01  W-FIELDS.                                                    00090000
009100     05  FILLER                    PIC  X(001) VALUE '0'.         00100000
009200         88 END-OF-INPUT                       VALUE '1'.         00110000
011700     05  W-TABLE-ENTRY-CNT         PIC  9(003) VALUE 0.           00120000
014500     05  W-SUB1                    PIC  9(004) VALUE 0.           00130000
014500     05  W-MAX1                    PIC  9(004) VALUE 0.           00140000
015100     05  W-INFILE-CNT              PIC  9(009) VALUE 0.           00150000
LRM001     05  W-DUMMY-BLANK-DROPS       PIC  9(009) VALUE 0.           00151005
LRM001     05  W-RECORDS-WRITTEN         PIC  9(009) VALUE 0.           00152005
015200                                                                  00160000
015300 01  WS-IN-REC         PIC X(133).                                00170000
015401 01  FILLER            REDEFINES WS-IN-REC.                       00180000
015400     05 FILLE           PIC X.                                    00190000
015401     05 FILLER          PIC X(05).                                00200000
                88 WS-IN-DUMMY   VALUE 'TRANS'.                         00210000
015401 01  FILLER            REDEFINES WS-IN-REC.                       00220000
015400     05 FILLER           PIC X(56).                               00230000
015401     05 FILLER    PIC X(07).                                      00240000
                88 WS-IN-FIRST   VALUE '      1'.                       00250000
015401 01  FILLER            REDEFINES WS-IN-REC.                       00260000
015400     05 FILLER           PIC X(33).                               00270000
015401     05 FILLER    PIC X(11).                                      00280000
                88 WS-IN-SECOND  VALUE 'INSTRUCTION'.                   00290000
015401 01  FILLER            REDEFINES WS-IN-REC.                       00300000
015400     05 FILLER           PIC X(01).                               00301000
015401     05 FILLER    PIC X(10).                                      00302000
                88 WS-IN-THIRD   VALUE 'REC   DEL ' 'DEL   REC '.       00303000
015401 01  FILLER            REDEFINES WS-IN-REC.                       00304000
015400     05 FILLER           PIC X(01).                               00305000
015401     05 WS-IN-PART PIC X(04).                                     00306000
015500                                                                  00307000
015600 01  WS-IN-REC1    PIC X(133).                                    00308000
015610 01  WS-IN-REC2    PIC X(133).                                    00309000
015620 01  WS-IN-REC3    PIC X(133).                                    00310000
LRM001*01  WS-IN-REC4    PIC X(133).                                    00320001
015900 01  WS-OUT-REC.                                                  00330000
016000     05 WS-OUT-DATA   PIC X(133).                                 00340000
016010     05 WS-OUT-CLIENT PIC 9(3) COMP-3.                            00350000
016020     05 FILLER        PIC X(08) VALUE SPACE.                      00360000
016800 01  FILLER                        PIC X(008) VALUE 'W-TAB   '.   00370000
016900 01  W-TAB-AREA.                                                  00380000
017000     05  W-TAB OCCURS 1000 TIMES INDEXED BY TAB-X.                00390000
017200         10 W-TAB-CLIENT-NBR           PIC X(004).                00400000
017210         10 W-TAB-CLIENT-N   REDEFINES W-TAB-CLIENT-NBR PIC 9(4). 00410000
017300         10 W-TAB-BRK-NBR              PIC X(004).                00420000
018200                                                                  00430000
           COPY BHINFO.                                                 00440000
TCK001     COPY STUBCPY.                                                00450000
020300***************************************************************** 00460000
020400*    LINKAGE SECTION                                            * 00470000
020500***************************************************************** 00480000
020600 LINKAGE SECTION.                                                 00490000
020700 01  L-JCL-PARMS.                                                 00500000
020800     05  PARMLENGTH                PIC S9(004) COMP SYNC.         00510000
020900     05  PARM-REPORT-ID            PIC  X(001).                   00520000
021000         88  FUND-REPORT                       VALUE 'F'.         00530000
021000         88  STLR-REPORT                       VALUE 'S'.         00540000
021600                                                                  00550000
021700 PROCEDURE DIVISION USING L-JCL-PARMS.                            00560000
021800*                         ===========                             00570000
021900 0000-MAIN SECTION.                                               00580000
022300     COPY MSGCOBO.                                                00590000
022500                                                                  00600000
027900     OPEN INPUT  INFILE                                           00610000
030800          OUTPUT OUTFILE.                                         00620000
022500                                                                  00630000
022800     PERFORM 1500-LOAD-TABLE     THRU 1500-EXIT.                  00640000
022500                                                                  00650000
023000     PERFORM 2000-PROCESS                                         00660000
                 UNTIL END-OF-INPUT.                                    00670000
022500                                                                  00680000
023200     CLOSE INFILE OUTFILE.                                        00690000
022500                                                                  00700000
023400     GOBACK.                                                      00710000
033800                                                                  00720000
041100 1500-LOAD-TABLE.                                                 00730000
041200                                                                  00740000
041800     PERFORM VARYING W-SUB1 FROM 1 BY 1 UNTIL W-SUB1 > 999        00750000
042100       MOVE W-SUB1  TO BH-BROKER-NUMBER-N                         00760000
042200       MOVE '010'     TO BH-LOGICAL-RECORD-CODE                   00770000
TCK001       CALL  GETB1V  USING BH-BROKER-HEADER-INFO                  00780000
             IF BH-BROKER-ACTIVE                                        00790000
              AND BH-BROKER-CLEARING-HOUSE (2 : 4) NOT = '0969'         00800000
              AND BH-USA-BROKER                                         00810000
                ADD   1    TO W-MAX1                                    00820000
                MOVE W-SUB1     TO W-TAB-CLIENT-N (W-MAX1)              00830000
                MOVE BH-BROKER-CLEARING-HOUSE (2 : 4)                   00840000
042400                            TO W-TAB-BRK-NBR    (W-MAX1)          00850000
             END-IF                                                     00860000
043000     END-PERFORM.                                                 00870000
043100                                                                  00880000
043500 1500-EXIT.                                                       00890000
043600     EXIT.                                                        00900000
043700/                                                                 00910000
043800 2000-PROCESS.                                                    00920000
043900                                                                  00930000
044000     PERFORM 3000-READ                                            00940000
044100        UNTIL WS-IN-FIRST    OR END-OF-INPUT.                     00950000
043900                                                                  00960000
044200     IF NOT END-OF-INPUT                                          00970000
044400       MOVE WS-IN-REC    TO WS-IN-REC1                            00980000
044400       MOVE '1'          TO WS-IN-REC1(1 : 1)                     00990000
044410       PERFORM 3000-READ                                          01000000
044420       MOVE WS-IN-REC    TO WS-IN-REC2                            01010000
044430       PERFORM 3000-READ                                          01020000
             MOVE WS-IN-REC  TO WS-IN-REC3                              01030000
LRM001*******PERFORM 3000-READ                                          01040001
LRM001*******MOVE WS-IN-REC    TO WS-IN-REC4                            01050001
                 PERFORM 2500-PRINT-REPORT                              01060000
044500     END-IF.                                                      01070000
043900                                                                  01080000
       2500-PRINT-REPORT.                                               01090000
044510     MOVE  0    TO WS-OUT-CLIENT                                  01100000
           PERFORM VARYING W-SUB1 FROM 1 BY 1 UNTIL W-SUB1 > W-MAX1     01110000
042400         IF W-TAB-BRK-NBR (W-SUB1) = WS-IN-PART                   01120000
042200          MOVE W-TAB-CLIENT-N (W-SUB1)                            01130000
044510                           TO WS-OUT-CLIENT                       01140000
042300          MOVE W-MAX1   TO W-SUB1                                 01150000
               END-IF                                                   01160000
043000     END-PERFORM.                                                 01170000
044520                                                                  01180000
044600     IF  WS-OUT-CLIENT NOT = 0                                    01190000
044700        MOVE WS-IN-REC1 TO WS-OUT-DATA                            01200000
044800        PERFORM WRITE-REPORT                                      01210000
044700        MOVE WS-IN-REC2 TO WS-OUT-DATA                            01220000
044800        PERFORM WRITE-REPORT                                      01230000
044700        MOVE WS-IN-REC3 TO WS-OUT-DATA                            01240000
044800        PERFORM WRITE-REPORT                                      01250000
LRM001********MOVE WS-IN-REC4 TO WS-OUT-DATA                            01260001
LRM001********PERFORM WRITE-REPORT                                      01270001
044000        PERFORM 3000-READ                                         01280000
044800        PERFORM                                                   01290000
044100          UNTIL WS-IN-FIRST    OR END-OF-INPUT                    01300000
                MOVE WS-IN-REC   TO WS-OUT-DATA                         01310000
                IF  WS-OUT-DATA (1 : 1 ) NOT = '1'                      01320000
044800             PERFORM WRITE-REPORT                                 01330000
                END-IF                                                  01340000
044000          PERFORM 3000-READ                                       01350000
044800        END-PERFORM                                               01360000
045300     END-IF.                                                      01370000
045400                                                                  01380000
049600                                                                  01390000
050000 3000-READ.                                                       01400000
050100                                                                  01410000
050600     READ INFILE INTO WS-IN-REC                                   01420000
050700          AT END                                                  01430000
050800             SET END-OF-INPUT  TO TRUE                            01440000
050900             DISPLAY 'CAT993: END OF INPUT REACHED - '            01450000
                                    W-INFILE-CNT                        01460000
LRM001             DISPLAY 'RECORDS DROPPED ' W-DUMMY-BLANK-DROPS       01461005
LRM001             DISPLAY 'RECORDS WRITTEN ' W-RECORDS-WRITTEN         01462005
                NOT AT END                                              01470000
                   IF WS-IN-DUMMY                                       01480000
                   OR WS-IN-REC = SPACES                                01490000
LRM001               ADD 1 TO W-DUMMY-BLANK-DROPS                       01491005
                     GO TO 3000-READ                                    01500000
                   END-IF                                               01510000
051400             ADD  1          TO W-INFILE-CNT                      01520000
051200     END-READ.                                                    01530000
051300                                                                  01540000
053000 WRITE-REPORT.                                                    01550000
053100     WRITE OUT-REC  FROM WS-OUT-REC.                              01560000
LRM001     ADD 1 TO W-RECORDS-WRITTEN.                                  01570005
