000001* PDX    - CAT876U  C0285736 09/11/09 15:12:06 TBLAMUR            00001014
000010 IDENTIFICATION DIVISION.                                         00001100
000011 PROGRAM-ID. CAT876U.                                             00001200
000012*=======================================================*         00001300
000013* INTRA-DAY UPDATE OF FUNDSRVE STATUS ON RECON EXTRACT.           00001400
000013* THIS PROGRAM WILL LOAD A TABLE OF SIAC0720 FUNDSRV ACTIONS FOR  00001503
000013*   CLIENT 6. THE NSCC RECORDS ARE MATCHED VIA CNTL NBR, SEQ NBR  00001603
000013*   AND THE STATUS-TDY IS UPDATED ON THE OUTPUT RECORD.           00001703
000015*=======================================================*         00001803
000016                                                                  00001903
000017 ENVIRONMENT DIVISION.                                            00002003
000018 INPUT-OUTPUT SECTION.                                            00002103
000019 FILE-CONTROL.                                                    00002203
000050                                                                  00003000
000080     SELECT  MFB204-TRAN-IN      ASSIGN TO IMFACTAN.              00003100
000080     SELECT  MFB204-TRAN-OUT     ASSIGN TO OMFACTAN.              00003200
000090                                                                  00003300
000080     SELECT INFILE               ASSIGN TO INFILE.                00003400
000090                                                                  00003500
000100 DATA DIVISION.                                                   00003600
000200 FILE SECTION.                                                    00003700
000300                                                                  00003800
002300 FD  MFB204-TRAN-IN                                               00003900
001800     RECORDING MODE IS F                                          00004000
001900     LABEL RECORDS ARE STANDARD                                   00004100
002000     BLOCK CONTAINS 0 RECORDS.                                    00005000
002100 01  MFB204-TRAN-REC-IN             PIC X(250).                   00006000
002200                                                                  00007000
002300 FD  MFB204-TRAN-OUT                                              00007100
001800     RECORDING MODE IS F                                          00007200
001900     LABEL RECORDS ARE STANDARD                                   00007300
002000     BLOCK CONTAINS 0 RECORDS.                                    00007400
002100 01  MFB204-TRAN-REC-OUT            PIC X(250).                   00007500
002200                                                                  00007600
002200 FD  INFILE                                                       00008000
           RECORDING MODE IS V                                          00009000
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          00010000
              DEPENDING ON W-REC-LEN-IN                                 00011000
           BLOCK CONTAINS 0 RECORDS.                                    00012000
                                                                        00013000
       01  IN-RECORD                   PIC X(520).                      00013100
                                                                        00013200
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCMHDR==.      00013300
                                                                        00013400
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCMTRL==.      00014000
                                                                        00019000
       01  DUMMY-LARGE-RECORD         PIC X(4000).                      00019105
                                                                        00019200
002900 WORKING-STORAGE SECTION.                                         00020000
002910 01  GENERAL-WORK-AREA.                                           00030000
002911                                                                  00040000
002912     05  ABEND-CODE                  PIC S9(4)   COMP SYNC.       00050000
002913     05  DUMP-SW                     PIC X       VALUE 'D'.       00060000
002912     05  SUB                         PIC S9(4)   COMP VALUE +0.   00070003
002912     05  WS-MMDDYY                   PIC X(6)  VALUE ' '.         00080000
           05  W-REC-LEN-IN                PIC 9(005) VALUE 0.          00090005
002934                                                                  00130000
002935 01  MFB204I-EOF-SWITCH        PIC X(01)  VALUE 'F'.              00140003
002936     88  END-OF-MFB204I-FILE              VALUE 'T'.              00150003
       01  END-OF-INFILE-SW          PIC X(01)  VALUE '0'.              00151005
           88 END-OF-INFILE                     VALUE '1'.              00152000
       01  FOUND-HEADER-CLIENT-6-SW  PIC X(01)  VALUE '0'.              00153005
           88 FOUND-HEADER-CLIENT-6             VALUE '1'.              00154003
000100**************************************************                00160000
000200* FOR USE WITH MF BALANCING                      *                00170000
000300**************************************************                00180000
000400 01  B204E-RECORD.                                                00190000
000400     05  B204E-KEY.                                               00200000
             07 B204E-PRIME-KEY.                                        00210000
000500         10  B204E-CLIENT                 PIC 9(03).              00220000
000700         10  B204E-CUSIP                  PIC X(09).              00230000
000700         10  B204E-SEC-NO                 PIC X(07).              00240000
             07 B204E-OTHER-KEY.                                        00250000
002300         10  B204E-SOURCE                 PIC X(01) VALUE ' '.    00260000
002400             88  B204E-BPS                VALUE 'T'.              00261000
002500             88  B204E-NSCC               VALUE 'F'.              00262000
000700         10  B204E-ORIG-SD                PIC X(08).              00263000
000700         10  B204E-PROC-DATE              PIC X(08).              00264000
000700         10  B204E-BRANCH                 PIC X(03) VALUE ' '.    00265000
000800         10  B204E-ACCOUNT                PIC X(05) VALUE ' '.    00266000
000900         10  B204E-CURRENCY               PIC 9(03) COMP-3.       00267000
002300         10  B204E-TYPE                   PIC X(01) VALUE ' '.    00268000
002300         10  B204E-CD                     PIC X(01) VALUE ' '.    00269000
002600     05  B204E-MF-STATUS              PIC X(01) VALUE ' '.        00270000
002600     05  B204E-MF-STATUS-TDY          PIC X(01) VALUE ' '.        00270111
002600     05  B204E-MF-STATUS-DATE         PIC X(08) VALUE ' '.        00270200
002600     05  B204E-ASSET-SEQ              PIC X(04) VALUE ' '.        00270309
003500     05  FILLER                       PIC X(02) VALUE ' '.        00270409
003000     05  B204E-BATCH-ENTRY            PIC X(06) VALUE ' '.        00270500
               88 ACAT-B204   VALUE 'TAI NS'  'TAO NS'.                 00270600
                                                                        00270700
003200     05  B204E-QTY            PIC S9(12)V9(05) COMP-3 VALUE 0.    00270800
003300     05  B204E-AMOUNT         PIC S9(15)V9(02) COMP-3 VALUE 0.    00270900
002600     05  B204E-ACAT-CONTROL   PIC X(15) VALUE ' '.                00271000
003400     05  B204E-CONTRA         PIC X(04) VALUE ' '.                00271100
003400     05  B204E-DESC1          PIC X(30) VALUE ' '.                00271300
003400     05  B204E-DESC2          PIC X(30) VALUE ' '.                00271400
003500     05  FILLER               PIC X(49) VALUE ' '.                00271502
003400                                                                  00271600
       01  FILLER                        PIC X(008) VALUE 'F - NSCC'.   00271702
           COPY NSCCF.                                                  00271802
                                                                        00271902
       01 WS-NSCCF-TABLE.                                               00272003
           05  WS-NSCCF-ENTRY OCCURS 1 TO 10000 TIMES                   00272105
                  DEPENDING ON SUB                                      00272205
                  INDEXED BY NSCCF-INDEX.                               00272305
               07  WS-NSCCF-CTRL-NBR          PIC X(14).                00272403
               07  WS-NSCCF-SEQ-NBR           PIC X(04).                00272509
               07  WS-NSCCF-ACTION-TYP        PIC X.                    00272603
                                                                        00272703
005940     COPY STUBCPY.                                                00272803
005960     COPY BPDATESC.                                               00273000
005990                                                                  00276000
006000 PROCEDURE DIVISION.                                              00277005
006100                                                                  00278000
006200     COPY MSGCOBO.                                                00279000
           MOVE  'CAT876  '              TO BPDATES-CALLING-PGM         00280000
           MOVE  'C'                     TO BPDATES-REQ-TYPE            00290000
           CALL    BPDATES   USING BPDATES-PARAMETERS                   00300000
           MOVE BPD-PROC-DATE (3 : 2)  TO WS-MMDDYY (5 : 2).            00310000
           MOVE BPD-PROC-DATE (5 : 2)  TO WS-MMDDYY (1 : 2).            00320000
           MOVE BPD-PROC-DATE (7 : 2)  TO WS-MMDDYY (3 : 2).            00330000
006300                                                                  00340000
           OPEN INPUT INFILE.                                           00341002
           OPEN INPUT MFB204-TRAN-IN.                                   00342002
           OPEN OUTPUT MFB204-TRAN-OUT.                                 00343002
                                                                        00344002
007420     PERFORM LOAD-FUNDSERV-TABLE-RTN                              00350002
007420     PERFORM PROCESS-MFB204-RECORDS                               00360003
002936         UNTIL END-OF-MFB204I-FILE.                               00370007
007900     GOBACK.                                                      00460000
                                                                        00470002
       LOAD-FUNDSERV-TABLE-RTN.                                         00480002
           PERFORM UNTIL END-OF-INFILE                                  00481003
                READ INFILE                                             00482003
                   AT END                                               00483003
                       SET END-OF-INFILE  TO TRUE                       00490003
                   NOT AT END                                           00550003
                       PERFORM PROCESS-NSCCF-RECORD                     00560003
                END-READ                                                00570003
           END-PERFORM.                                                 00580003
           DISPLAY 'LOADED FUNDSERV TABLE ' SUB ' RECORDS'.             00580105
                                                                        00581003
       PROCESS-NSCCF-RECORD.                                            00590003
           MOVE IN-RECORD       (1 : W-REC-LEN-IN) TO                   00591003
                NSCCF-RECORD                                            00592003
           IF NSCCF-REC-TYPE = 'H'                                      00600003
           AND NSCCMHDR-BROKER-CLR-NBR = '0235'                         00610003
              SET FOUND-HEADER-CLIENT-6 TO TRUE                         00620003
           ELSE                                                         00630003
           IF FOUND-HEADER-CLIENT-6                                     00640003
           AND NSCCF-REC-TYPE = 'F'                                     00650003
              ADD 1 TO SUB                                              00651003
              MOVE NSCCF-ACATS-CTRL-NBR     TO WS-NSCCF-CTRL-NBR (SUB)  00660009
              MOVE NSCCF-ASSET-SEQ-NBR(3:4) TO WS-NSCCF-SEQ-NBR (SUB)   00670009
              MOVE NSCCF-ACTION-TYP         TO WS-NSCCF-ACTION-TYP (SUB)00680009
              IF SUB > 10000                                            00680103
                 DISPLAY 'TABLE OVERFLOW NCSSF DATA IGNORED '           00680203
                 SET END-OF-INFILE  TO TRUE                             00680303
              END-IF                                                    00680403
           ELSE                                                         00681003
           IF NSCCF-REC-TYPE = 'H'                                      00690003
              MOVE ' ' TO FOUND-HEADER-CLIENT-6-SW                      00700003
           END-IF.                                                      00710003
       PROCESS-MFB204-RECORDS.                                          00720003
002300     READ MFB204-TRAN-IN                                          00721003
               AT END                                                   00722003
002936         SET END-OF-MFB204I-FILE TO TRUE.                         00730005
                                                                        00731003
           IF NOT END-OF-MFB204I-FILE                                   00740005
              MOVE MFB204-TRAN-REC-IN TO B204E-RECORD                   00750003
              IF B204E-ACAT-CONTROL > SPACES                            00760003
              AND B204E-SOURCE = 'F'                                    00761003
                 SET NSCCF-INDEX TO 1                                   00770007
                 SEARCH WS-NSCCF-ENTRY                                  00771003
                    AT END                                              00772013
                       MOVE ' ' TO B204E-MF-STATUS-TDY                  00773013
                    WHEN B204E-ACAT-CONTROL(1:14) =                     00780003
                                   WS-NSCCF-CTRL-NBR (NSCCF-INDEX)      00781003
                     AND B204E-ASSET-SEQ =                              00790003
                                   WS-NSCCF-SEQ-NBR (NSCCF-INDEX)       00800003
                        MOVE WS-NSCCF-ACTION-TYP (NSCCF-INDEX) TO       00810003
                                   B204E-MF-STATUS-TDY                  00820003
                 END-SEARCH                                             00830003
              END-IF                                                    00840003
              WRITE MFB204-TRAN-REC-OUT FROM B204E-RECORD               00850003
           END-IF.                                                      00860003
