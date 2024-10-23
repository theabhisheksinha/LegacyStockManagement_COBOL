000001* PDX    - CAT876A  C0305136 12/09/10 14:39:08 TBLAMUR            00001004
000001* PDX    - CAT876A  C0302060 09/29/10 08:06:30 TBLAMUR            00001102
000001* PDX    - CAT876A  C0298905 07/28/10 09:20:28 TBLAMUR            00001200
000001* PDX    - CAT876A  C0294120 03/23/10 11:58:05 TBLAMUR            00001300
000001* PDX    - CAT876A  C0285736 09/15/09 11:25:57 TBLAMUR            00001600
000001* PDX    - CAT876A  C0282904 07/09/09 09:20:19 TBYOHON            00001700
000010 IDENTIFICATION DIVISION.                                         00001800
000011 PROGRAM-ID. CAT876A.                                             00001900
000012*=======================================================*         00002000
000013* SELECT ALL PENDING ACCOUNT ACTIVITY FROM B204                   00002100
000015*=======================================================*         00002200
000016                                                                  00002300
000017 ENVIRONMENT DIVISION.                                            00002400
000018 INPUT-OUTPUT SECTION.                                            00002500
000019 FILE-CONTROL.                                                    00002600
000080     SELECT  MFPEND-FILE         ASSIGN  TO  UT-S-IMFPEND.        00002700
000090                                                                  00002800
000080     SELECT  MFBAL-REPORT        ASSIGN  TO  UT-S-OBALRPT.        00002900
000090                                                                  00003000
000080     SELECT  MFDET-REPORT        ASSIGN  TO  UT-S-ODETRPT.        00003100
000090                                                                  00003200
000080     SELECT  MFMRG-REPORT        ASSIGN  TO  UT-S-OMFREPT.        00003300
000090                                                                  00003400
000100 DATA DIVISION.                                                   00003500
000200 FILE SECTION.                                                    00003600
000300                                                                  00003700
002300 FD  MFPEND-FILE                                                  00003800
001800     RECORDING MODE IS F                                          00003900
001900     LABEL RECORDS ARE STANDARD                                   00004000
002000     BLOCK CONTAINS 0 RECORDS.                                    00005000
002100 01  MFPEND-RECORD                  PIC X(250).                   00006000
002200                                                                  00007000
002200 FD  MFBAL-REPORT                                                 00008000
002200     RECORDING MODE F                                             00009000
001900     LABEL RECORDS ARE STANDARD                                   00009100
002200     BLOCK CONTAINS 0 RECORDS.                                    00009200
002200                                                                  00009300
002200 01  MFBAL-RECORD.                                                00009400
           05 FILLER           PIC X(133).                              00009500
           05 MFBAL-CLT        PIC 9(3) COMP-3.                         00009600
           05 FILLER           PIC X(08).                               00009700
002200                                                                  00009800
002200 FD  MFDET-REPORT                                                 00009900
002200     RECORDING MODE F                                             00010000
001900     LABEL RECORDS ARE STANDARD                                   00011000
002200     BLOCK CONTAINS 0 RECORDS.                                    00012000
002200                                                                  00013000
002200 01  MFDET-RECORD.                                                00014000
           05 FILLER           PIC X(133).                              00015000
           05 MFDET-CLT        PIC 9(3) COMP-3.                         00016000
           05 FILLER           PIC X(08).                               00017000
002200                                                                  00018000
002200 FD  MFMRG-REPORT                                                 00019000
002200     RECORDING MODE F                                             00019100
001900     LABEL RECORDS ARE STANDARD                                   00019200
002200     BLOCK CONTAINS 0 RECORDS.                                    00019300
002200                                                                  00019400
002200 01  MFMRG-RECORD       PIC X(143).                               00019500
002200                                                                  00019600
002900 WORKING-STORAGE SECTION.                                         00019700
002911                                                                  00019800
002910 01  GENERAL-WORK-AREA.                                           00019900
002912     05  ABEND-CODE           PIC S9(4)   COMP SYNC.              00020000
002913     05  DUMP-SW              PIC X       VALUE 'D'.              00030000
002913     05  WS-MFDET-EOF         PIC X       VALUE ' '.              00040000
               88 MFDET-EOF                VALUE 'Y'.                   00050000
002913     05  WS-MATCH-SW          PIC X       VALUE ' '.              00060000
           05  IND-MSG-SEND-SW          PIC X(01) VALUE SPACE.          00061000
               88  IND-MSG-SEND-YES               VALUE 'Y'.            00062000
           05  PASS-DATA.                                               00063000
               07  PASS-PGM-NAME     PIC X(08)  VALUE 'CAT876'.         00064000
               07  PASS-MESSAGE      PIC X(45)  VALUE SPACES.           00065000
           05  PASS-MSG.                                                00066000
               07  PASS-TABLE-NAME PIC X(15) VALUE SPACES.              00067000
               07  FILLER          PIC X(21) VALUE                      00068000
                                             ' TABLE IS 85% FULL : '.   00069000
               07  PASS-COUNTER    PIC Z(09) VALUE ZEROES.              00069100
002912     05  WS-CLIENT-IND        PIC X            VALUE ' '.         00069200
002912     05  WS-IND               PIC S9(4)   COMP VALUE +0.          00069300
002912     05  WS-MAX               PIC S9(4)   COMP VALUE +0.          00069400
002912     05  WS-LN1               PIC  9(3)   COMP VALUE 60.          00069500
002912     05  WS-PG1               PIC  9(3)   COMP VALUE  0.          00069600
002912     05  WS-LN2               PIC  9(3)   COMP VALUE 60.          00069700
002912     05  WS-PG2               PIC  9(3)   COMP VALUE  0.          00069800
002914     05  END-OF-B204E         PIC X(01) VALUE SPACE.              00069900
002915     05  WRITE-B204E          PIC X(01) VALUE SPACE.              00070000
002933     05  SAVE-B204E-KEY       PIC X(27) VALUE ' '.                00080000
002933     05  WS-PEND-BAL-SW       PIC X     VALUE ' '.                00090000
           05  WS-PEND-SD-BAL       PIC S9(15)V99 COMP-3 VALUE 0.       00100000
002913     05  WS-PEND-ACCT        PIC X(9)    VALUE ' '.               00100100
           05  WS-AMT-B204          PIC S9(15)V99 COMP-3 VALUE 0.       00100200
           05  WS-AMT-MPND          PIC S9(15)V99 COMP-3 VALUE 0.       00100300
           05  WS-AMT-NET           PIC S9(15)V99 COMP-3 VALUE 0.       00100400
           05  WS-TOT-B204          PIC S9(15)V99 COMP-3 VALUE 0.       00100500
           05  WS-TOT-MPND          PIC S9(15)V99 COMP-3 VALUE 0.       00100600
           05  WS-MPND-CR           PIC S9(15)V99 COMP-3 VALUE 0.       00100700
           05  WS-MPND-DB           PIC S9(15)V99 COMP-3 VALUE 0.       00100800
           05  WS-ACPT-CR           PIC S9(15)V99 COMP-3 VALUE 0.       00100900
           05  WS-ACPT-DB           PIC S9(15)V99 COMP-3 VALUE 0.       00101000
           05  WS-REJ-NET           PIC S9(15)V99 COMP-3 VALUE 0.       00101100
LRM        05  WS-TOT-B204-REJ      PIC S9(15)V99 COMP-3 VALUE 0.       00101200
LRM        05  WS-TOT-B204-PEND     PIC S9(15)V99 COMP-3 VALUE 0.       00101300
           05 SAVE-OUT-DATA         PIC X(133).                         00101500
           05 OUTPUT-AREA.                                              00101600
              10 OUT-DATA           PIC X(133)       VALUE SPACE.       00101700
              10 OUT-TRAC-CLIENT    PIC 9(3) COMP-3  VALUE 6.           00101800
              10 OUT-TRAC-RPT       PIC 9(3) COMP-3  VALUE 0.           00101900
              10 FILLER             PIC X(06)        VALUE ' '.         00102000
002934                                                                  00103000
           05 HED-0.                                                    00104000
              10 FILLER             PIC X(1)   VALUE '1'.               00105000
              10 FILLER             PIC X(35)                           00106000
              VALUE 'CAT876          '.                                 00107000
              10 HED-0-NAME         PIC X(40)                           00108000
              VALUE '                       '.                          00109000
              10 FILLER             PIC X(10)                           00110000
              VALUE '  DATE '.                                          00111000
              10 HED-0-DATE         PIC X(10) VALUE '  /  /'.           00112000
              10 FILLER             PIC X(10)                           00113000
              VALUE '    PAGE '.                                        00114000
              10 HED-0-PG           PIC ZZZZ.                           00114100
           05 HED-1-1.                                                  00114200
              10 FILLER             PIC X(5)   VALUE ' '.               00114300
              10 FILLER             PIC X(30)                           00114400
              VALUE 'SECTION 1 - SUMMARY OF ACAT'.                      00114500
              10 FILLER             PIC X(30)                           00114600
              VALUE 'OUT OF BALANCE AMOUNTS '.                          00114700
              10 HED-1-1-INTRADAY   PIC X(8)   VALUE ' '.               00114800
           05 HED-1-2.                                                  00114900
              10 FILLER             PIC X(5)   VALUE ' '.               00115000
              10 FILLER             PIC X(15)  VALUE 'CUSIP'.           00115100
              10 FILLER             PIC X(12)  VALUE 'SETT DT'.         00115200
              10 FILLER             PIC X(23)  VALUE '    AMOUNT'.      00115300
              10 FILELR             PIC X(50)       VALUE SPACE.        00115400
           05 HED-2-1.                                                  00115500
              10 FILLER             PIC X(5)   VALUE ' '.               00115600
              10 FILLER             PIC X(30)                           00115700
              VALUE 'SECTION 2 - OUT OF BALANCE '.                      00115800
              10 FILLER             PIC X(30)                           00115900
              VALUE 'DETAILS - REJECTED/PENDING '.                      00116000
           05 HED-2-2.                                                  00117000
              10 FILLER             PIC X(1)         VALUE SPACE.       00117100
              10 FILLER             PIC X(06)  VALUE '      '.          00117200
              10 FILLER             PIC X(10)  VALUE '       '.         00117300
              10 FILLER             PIC X(16)  VALUE '              '.  00117400
              10 FILLER             PIC X(05)  VALUE 'ACAT '.           00117500
              10 FILLER             PIC X(07)  VALUE 'B/E CD'.          00117600
              10 FILLER             PIC X(10)  VALUE 'ORIG SETT'.       00117700
              10 FILLER             PIC X(09)  VALUE 'CURR SETT'.       00117800
              10 FILLER             PIC X(06)  VALUE '      '.          00117900
              10 FILLER             PIC X(11)  VALUE '        '.        00118000
              10 FILLER             PIC X(20)  VALUE '          '.      00118100
              10 FILLER             PIC X(19)  VALUE '         '.       00118200
           05 HED-2-3.                                                  00118300
              10 FILLER             PIC X(1)         VALUE SPACE.       00118400
              10 FILLER             PIC X(06)  VALUE 'SOURCE'.          00118500
              10 FILLER             PIC X(10)  VALUE '  CUSIP'.         00118600
              10 FILLER             PIC X(16)  VALUE ' ACAT CONTROL#'.  00118700
              10 FILLER             PIC X(06)  VALUE 'SEQ# '.           00118800
              10 FILLER             PIC X(08)  VALUE ' RD CD'.          00118900
              10 FILLER             PIC X(08)  VALUE '  DATE  '.        00119000
              10 FILLER             PIC X(09)  VALUE '  DATE  '.        00119100
              10 FILLER             PIC X(07)  VALUE 'CONTRA'.          00119200
              10 FILLER             PIC X(15)  VALUE ' ACCOUNT'.        00119300
              10 FILLER             PIC X(20)  VALUE '  QUANTITY'.      00119400
              10 FILLER             PIC X(19)  VALUE '   AMOUNT'.       00119500
LRM           10 FILLER             PIC X(06)  VALUE 'STATUS'.          00119600
           05 DETAIL-1.                                                 00119700
              10 DET1-CC            PIC X(3)         VALUE '0'.         00119800
              10 DET1-CUSIP         PIC X(15)        VALUE SPACE.       00119900
              10 DET1-SETT-DT       PIC X(12)        VALUE SPACE.       00120000
              10 DET1-AMT-B204      PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZZ.99-.        00120100
              10 FILLER             PIC X(50)       VALUE SPACE.        00120201
           05 DETAIL-2.                                                 00120600
              10 DET2-CC            PIC X(1)         VALUE SPACE.       00120700
              10 DET2-SRC           PIC X(05)        VALUE SPACE.       00120800
              10 DET2-CUSIP         PIC X(10)        VALUE SPACE.       00120900
              10 DET2-ACAT-CONTROL  PIC X(16)        VALUE SPACE.       00121000
              10 DET2-ASSET-SEQ     PIC X(07)        VALUE SPACE.       00121100
              10 DET2-BATCH-ENTRY   PIC X(07)        VALUE SPACE.       00121200
              10 DET2-ORG-SD        PIC X(09)        VALUE SPACE.       00121300
              10 DET2-CUR-SD        PIC X(09)        VALUE SPACE.       00121400
              10 DET2-CONTRA        PIC X(05)        VALUE SPACE.       00121500
              10 DET2-BRANCH        PIC X(03)        VALUE SPACE.       00121600
              10 FILELR             PIC X(1)        VALUE '-'.          00121700
              10 DET2-ACCOUNT       PIC X(05)        VALUE SPACE.       00121800
              10 FILLER             PIC X(1)        VALUE '-'.          00121900
              10 DET2-TYPE          PIC X(01)        VALUE SPACE.       00122000
              10 DET2-CD            PIC X(01)        VALUE SPACE.       00122100
LRM001        10 DET2-QTY           PIC ZZZZZZ,ZZZ,ZZZ.9999-.           00122200
              10 DET2-AMT           PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZZ.99-.        00122300
              10 DET2-IND           PIC X(03) VALUE ' '.                00122400
LRM           10 DET2-STATUS        PIC X(03)        VALUE SPACE.       00122500
000400     05  PROCESS-KEY.                                             00122600
000500         10  PROC-CLIENT                 PIC 9(03).               00122700
000700         10  PROC-CUSIP                  PIC X(09).               00122800
000700         10  PROC-SEC-NO                 PIC X(07).               00122900
002934                                                                  00123000
002935 01  B204E-EOF-SWITCH          PIC X(01)  VALUE ' '.              00124000
002936     88  END-OF-B204E-FILE                VALUE 'Y'.              00125000
000100**************************************************                00126000
000200* FOR USE WITH MF BALANCING                      *                00127000
000300**************************************************                00128000
000400 01  SAVE-B204E-AREA.                                             00129000
000400     03  SAVE-B204E-RECORD  OCCURS 10000 TIMES.                   00130000
000400      05  B204S-KEY-AREA.                                         00140000
             07 B20SE-KEY.                                              00150000
000500         10  B204S-CLIENT             PIC 9(03).                  00160000
000700         10  B204S-CUSIP              PIC X(09).                  00170000
000700         10  B204S-SEC-NO             PIC X(07).                  00180000
             07 B204S-OTHER-KEY.                                        00190000
002300         10  B204S-SOURCE             PIC X(01).                  00200000
002400             88  B204S-BPS              VALUE 'T'.                00210000
002500             88  B204S-NSCC             VALUE 'F'.                00220000
000700         10  B204S-ORIG-SD            PIC X(08).                  00221000
000700         10  B204S-PROC-DATE          PIC X(08).                  00222000
000700         10  B204S-BRANCH             PIC X(03).                  00223000
000800         10  B204S-ACCOUNT            PIC X(05).                  00223100
000900         10  B204S-CURRENCY           PIC 9(03) COMP-3.           00223200
002300         10  B204S-TYPE               PIC X(01).                  00223300
002300         10  B204S-CD                 PIC X(01).                  00223400
002600      05  B204S-MF-STATUS              PIC X(01).                 00223500
LRM         05  B204S-MF-STATUS-TDY          PIC X(01).                 00223600
002600      05  B204S-MF-STATUS-DATE         PIC X(08).                 00223700
002600      05  B204S-ASSET-SEQ              PIC X(06).                 00223800
003000      05  B204S-BATCH-ENTRY            PIC X(06).                 00223900
               88 ACAT-B204S  VALUE 'TAI NS'  'TAO NS'  'ROL NS'.       00224000
                                                                        00224100
003200      05  B204S-QTY            PIC S9(12)V9(05) COMP-3.           00224200
003300      05  B204S-AMOUNT         PIC S9(15)V9(02) COMP-3.           00224300
002600      05  B204S-ACAT-CONTROL   PIC X(15).                         00224400
003400      05  B204S-CONTRA         PIC X(04).                         00224500
003400      05  FILLER               PIC X(14).                         00224600
000400 01  B204E-RECORD.                                                00224700
000400     05  B204E-KEY-AREA.                                          00224800
             07 B204E-KEY.                                              00224900
000500         10  B204E-CLIENT                 PIC 9(03).              00225000
000700         10  B204E-CUSIP                  PIC X(09).              00225100
000700         10  B204E-SEC-NO                 PIC X(07).              00225200
             07 B204E-OTHER-KEY.                                        00225300
002300         10  B204E-SOURCE                 PIC X(01) VALUE ' '.    00225400
002400             88  B204E-BPS                VALUE 'T'.              00225500
002500             88  B204E-NSCC               VALUE 'F'.              00225600
000700         10  B204E-ORIG-SD                PIC X(08).              00225700
000700         10  B204E-PROC-DATE              PIC X(08).              00225800
000700         10  B204E-BRANCH                 PIC X(03) VALUE ' '.    00225900
000800         10  B204E-ACCOUNT                PIC X(05) VALUE ' '.    00226000
000900         10  B204E-CURRENCY               PIC 9(03) COMP-3.       00227000
002300         10  B204E-TYPE                   PIC X(01) VALUE ' '.    00228000
002300         10  B204E-CD                     PIC X(01) VALUE ' '.    00229000
002600     05  B204E-MF-STATUS              PIC X(01) VALUE ' '.        00230000
LRM        05  B204E-MF-STATUS-TDY          PIC X(01) VALUE ' '.        00240000
002600     05  B204E-MF-STATUS-DATE         PIC X(08) VALUE ' '.        00250000
002600     05  B204E-ASSET-SEQ              PIC X(06) VALUE ' '.        00260000
003000     05  B204E-BATCH-ENTRY            PIC X(06) VALUE ' '.        00270000
               88 ACAT-B204   VALUE 'TAI NS'  'TAO NS'.                 00270100
                                                                        00270200
003200     05  B204E-QTY            PIC S9(12)V9(05) COMP-3 VALUE 0.    00270300
003300     05  B204E-AMOUNT         PIC S9(15)V9(02) COMP-3 VALUE 0.    00270400
002600     05  B204E-ACAT-CONTROL   PIC X(15) VALUE ' '.                00270500
003400     05  B204E-CONTRA         PIC X(04) VALUE ' '.                00270600
003400     05  B204E-DESC1          PIC X(30) VALUE ' '.                00270700
003400     05  B204E-DESC2          PIC X(30) VALUE ' '.                00270800
LRM001     05  B204E-CONTRA-PRT-TYP PIC X(01) VALUE ' '.                00270900
003500     05  FILLER               PIC X(49) VALUE ' '.                00271000
       01  GETCBAL-PARM.                                                00271100
           COPY HOLDPARM REPLACING ==:GETCHOL:==  BY  ==GETCBAL==.      00271200
                                                                        00271300
       01  CUSBAL-AREA.                                                 00271400
           COPY CUSBAL   REPLACING ==:CUSBAL:==   BY ==CUSBAL==.        00271500
003400                                                                  00271600
005940     COPY STUBCPY.                                                00271700
           03  ZGETCBAL            PIC  X(08)     VALUE 'ZGETCBAL'.     00271800
005960     COPY BPDATESC.                                               00271900
           COPY BHINFO.                                                 00272000
           COPY BHACAT.                                                 00273000
                                                                        00274000
       LINKAGE SECTION.                                                 00275000
      ***************************************************************** 00276000
       01  PARM-AREA.                                                   00277000
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.        00278000
               88  PARM-LENGTH-VALID                    VALUE +02.      00278100
           05  PARM-INFO.                                               00278200
               10  PARM-RUN-ID              PIC X(02).                  00278300
                                                                        00278400
006000 PROCEDURE DIVISION USING PARM-AREA.                              00278500
006100                                                                  00278600
006200     COPY MSGCOBO.                                                00278700
           MOVE  'CAT876  '              TO BPDATES-CALLING-PGM         00278800
           MOVE  'C'                     TO BPDATES-REQ-TYPE            00278900
           CALL    BPDATES   USING BPDATES-PARAMETERS.                  00279000
           MOVE BPD-PROC-DATE  (5 : 2)   TO HED-0-DATE(1 : 2).          00280000
           MOVE BPD-PROC-DATE  (7 : 2)   TO HED-0-DATE(4 : 2).          00290000
           MOVE BPD-PROC-DATE  (3 : 2)   TO HED-0-DATE(7 : 2).          00300000
                                                                        00300100
           OPEN INPUT MFPEND-FILE                                       00300200
                OUTPUT MFBAL-REPORT                                     00300300
                       MFDET-REPORT.                                    00300400
           IF PARM-RUN-ID = 'ID'                                        00300500
              MOVE 'INTRADAY' TO HED-1-1-INTRADAY                       00300600
           END-IF.                                                      00300700
                                                                        00300800
007800     MOVE 'A'                 TO GETCBAL-VERSION                  00300900
           MOVE 'Q'                 TO GETCBAL-ACCESS                   00301000
           MOVE BPD-PRIOR-PROC-DATE  TO GETCBAL-DATE                    00302000
           SET GETCBAL-NO-DATECHK   TO TRUE                             00303000
           MOVE 'R'                 TO GETCBAL-FUNCTION-CODE            00304000
009710     PERFORM READ-MFPEND-FILE.                                    00305000
007800                                                                  00306000
           PERFORM PROCESS-MFPEND-FILE                                  00307000
                          UNTIL END-OF-B204E-FILE.                      00308000
                                                                        00309000
           CLOSE MFPEND-FILE                                            00310000
                 MFBAL-REPORT MFDET-REPORT.                             00320000
                                                                        00330000
           OPEN INPUT MFBAL-REPORT MFDET-REPORT                         00340000
                OUTPUT MFMRG-REPORT.                                    00350000
                                                                        00360000
           READ  MFBAL-REPORT                                           00370000
             AT   END  MOVE  999  TO  MFBAL-CLT                         00380000
           END-READ                                                     00390000
           READ  MFDET-REPORT                                           00400000
             AT   END  MOVE  999   TO MFDET-CLT                         00410000
           END-READ                                                     00420000
                                                                        00430000
           PERFORM  MERGE-REPORT                                        00440000
            UNTIL  MFBAL-CLT = 999 AND MFDET-CLT = 999.                 00450000
                                                                        00460000
           CLOSE MFBAL-REPORT MFDET-REPORT MFMRG-REPORT.                00470000
                                                                        00480000
007900     GOBACK.                                                      00490000
009560                                                                  00500000
       MERGE-REPORT.                                                    00510000
                                                                        00520000
           MOVE MFBAL-CLT    TO PROC-CLIENT.                            00530000
           PERFORM                                                      00540000
                UNTIL MFBAL-CLT NOT = PROC-CLIENT                       00550000
             WRITE MFMRG-RECORD FROM MFBAL-RECORD                       00551000
             READ  MFBAL-REPORT                                         00552000
               AT   END  MOVE  999  TO  MFBAL-CLT                       00553000
             END-READ                                                   00554000
           END-PERFORM.                                                 00554100
           PERFORM                                                      00554200
                UNTIL MFDET-CLT NOT = PROC-CLIENT                       00554300
             WRITE MFMRG-RECORD FROM MFDET-RECORD                       00554400
             READ  MFDET-REPORT                                         00554500
               AT   END  MOVE  999   TO MFDET-CLT                       00554600
             END-READ                                                   00554700
           END-PERFORM.                                                 00554800
                                                                        00554900
009570 PROCESS-MFPEND-FILE.                                             00555000
009580                                                                  00556000
           MOVE B204E-KEY    TO PROCESS-KEY                             00557000
                                                                        00558000
           MOVE    60    TO WS-LN1   WS-LN2.                            00559000
           MOVE     0    TO WS-PG1   WS-PG2.                            00560000
           MOVE  PROC-CLIENT TO BH-BROKER-NUMBER-N                      00570000
                                OUT-TRAC-CLIENT.                        00580000
           MOVE  '015'     TO  BH-LOGICAL-RECORD-CODE                   00590000
           MOVE '434500'   TO  BH-B2-INFO-ID                            00600000
           CALL   GETB1V  USING  BH-BROKER-HEADER-INFO                  00610000
                                 BH-ACAT-INFO.                          00620000
           MOVE BH-BROKER-NAME  TO HED-0-NAME                           00630000
009720     MOVE   0    TO WS-PEND-SD-BAL.                               00640000
           MOVE  ' '   TO WS-PEND-BAL-SW                                00650000
           PERFORM  UNTIL WS-PEND-BAL-SW = 'Y'                          00650100
             CALL ZGETCBAL  USING GETCBAL-PARM,                         00650200
                                  CUSBAL-AREA                           00650300
             IF    GETCBAL-END-OF-FILE                                  00650400
               OR  CUSBAL-CLIENT = HIGH-VALUES                          00650500
                MOVE  'Y'     TO  WS-PEND-BAL-SW                        00650600
             ELSE                                                       00650700
              IF   CUSBAL-CLIENT > PROC-CLIENT                          00650800
                MOVE  'Y'     TO  WS-PEND-BAL-SW                        00650900
              ELSE                                                      00651000
               MOVE CUSBAL-KEY (4 : 11) TO WS-PEND-ACCT                 00651100
               MOVE CUSBAL-RECORD-ID2   TO WS-PEND-ACCT (9 : 1)         00651200
               IF WS-PEND-ACCT  > BH-ACAT-MF-RECV-PEND-STL-ACCT         00651300
                 AND  WS-PEND-ACCT > BH-ACAT-MF-DELV-PEND-STL-ACCT      00651400
                MOVE  'Y'     TO  WS-PEND-BAL-SW                        00651500
               ELSE                                                     00651600
                IF     CUSBAL-BAL-DETAIL                                00651700
                   AND CUSBAL-FRGN-CURR-CODE = 0                        00651800
                   AND (WS-PEND-ACCT  = BH-ACAT-MF-RECV-PEND-STL-ACCT   00651900
                     OR WS-PEND-ACCT = BH-ACAT-MF-DELV-PEND-STL-ACCT )  00652000
                 ADD   CUSBAL-SD-BAL-CLOSE TO WS-PEND-SD-BAL            00652100
                END-IF                                                  00652200
               END-IF                                                   00652300
              END-IF                                                    00652400
             END-IF                                                     00652500
           END-PERFORM.                                                 00652600
                                                                        00652700
           MOVE   0   TO WS-TOT-B204    WS-TOT-MPND                     00652800
LRM                      WS-TOT-B204-REJ  WS-TOT-B204-PEND.             00652900
           PERFORM   HEADING1-RTN.                                      00653100
           PERFORM   HEADING2-RTN.                                      00653200
           MOVE '0'   TO DET2-CC.                                       00653300
                                                                        00653400
           MOVE ' '        TO WS-CLIENT-IND                             00653500
009730     PERFORM PROCESS-CLIENT                                       00653600
009731         UNTIL END-OF-B204E-FILE                                  00653700
                  OR  B204E-CLIENT NOT = PROC-CLIENT.                   00653800
                                                                        00653900
009732     PERFORM PRINT-CLIENT-TOTAL.                                  00654000
                                                                        00655000
009730 PROCESS-CLIENT.                                                  00656000
009580                                                                  00657000
           MOVE B204E-KEY    TO PROCESS-KEY                             00658000
                                                                        00659000
           MOVE   0   TO WS-AMT-B204    WS-AMT-MPND                     00660000
                         WS-MAX                                         00670000
009730     PERFORM PROCESS-CUSIP                                        00680000
009731         UNTIL END-OF-B204E-FILE                                  00690000
                OR    B204E-KEY NOT = PROCESS-KEY.                      00691000
                                                                        00692000
           ADD  WS-AMT-MPND   TO WS-TOT-MPND.                           00693000
                                                                        00694000
009732     PERFORM PRINT-CUSIP-TOTAL.                                   00695000
                                                                        00696000
009738 READ-MFPEND-FILE.                                                00697000
009739                                                                  00698000
009740     READ MFPEND-FILE  INTO B204E-RECORD                          00699000
009750      AT END                                                      00700000
009751        SET  END-OF-B204E-FILE TO TRUE                            00710000
009752     END-READ.                                                    00720000
009759                                                                  00730000
010600 PROCESS-CUSIP.                                                   00740000
010700                                                                  00750000
           IF    B204E-NSCC                                             00760000
            IF   B204E-MF-STATUS   = 'P'                                00770000
              OR (  B204E-MF-STATUS  = 'R'                              00780000
                  AND B204E-MF-STATUS-DATE = BPD-PROC-DATE              00790000
                  AND BH-ACAT-FUNDSERV-POST-SD-BKP = '1'  )             00800000
              ADD B204E-AMOUNT        TO WS-AMT-MPND                    00810000
              MOVE B204E-PROC-DATE (3 : 2) TO DET1-SETT-DT (7 : 2)      00820000
              MOVE B204E-PROC-DATE (5 : 2) TO DET1-SETT-DT (1 : 2)      00830000
              MOVE B204E-PROC-DATE (7 : 2) TO DET1-SETT-DT (4 : 2)      00840000
              MOVE '/'                     TO DET1-SETT-DT (3 : 1)      00850000
                                              DET1-SETT-DT (6 : 1)      00860000
            END-IF                                                      00994000
002400      PERFORM SAVE-B204E-DATA                                     00994100
           ELSE                                                         00994200
002400        PERFORM MATCH-B204E-DATA                                  00994300
012200     END-IF.                                                      00994400
                                                                        00994500
009710     PERFORM READ-MFPEND-FILE.                                    00994600
014900                                                                  00994700
002400 MATCH-B204E-DATA.                                                00994800
           MOVE ' '              TO WS-MATCH-SW                         00994900
           PERFORM VARYING WS-IND FROM 1 BY 1                           00995000
             UNTIL  WS-IND > WS-MAX                                     00995100
                OR  WS-MATCH-SW = 'Y'                                   00995200
              IF  ( B204S-NSCC (WS-IND)                                 00996300
               AND  B204S-AMOUNT           (WS-IND) =                   00996400
                                       B204E-AMOUNT                     00996500
               AND  B204S-ACAT-CONTROL     (WS-IND) =                   00996600
                                       B204E-ACAT-CONTROL               00996700
               AND  B204S-CONTRA            (WS-IND) =                  00996800
                                       B204E-CONTRA )                   00996900
                   SET B204S-BPS  (WS-IND) TO TRUE                      00997000
                   MOVE B204E-BATCH-ENTRY  TO                           00997100
                                B204S-BATCH-ENTRY (WS-IND)              00997200
                   MOVE 'Y'        TO WS-MATCH-SW                       00997300
              END-IF                                                    00997400
           END-PERFORM.                                                 00997500
           IF WS-MATCH-SW NOT = 'Y'                                     00997600
             PERFORM  SAVE-B204E-DATA.                                  00997700
           CONTINUE.                                                    00997800
                                                                        00997900
       SAVE-B204E-DATA.                                                 00998000
                                                                        00998100
           IF      WS-MAX > 9000                                        00998200
               AND NOT IND-MSG-SEND-YES                                 00998300
              MOVE 'B204E DATA '      TO PASS-TABLE-NAME                00998400
              MOVE 9000                TO PASS-COUNTER                  00998500
              MOVE PASS-MSG           TO PASS-MESSAGE                   00998600
              CALL INFSND  USING PASS-DATA                              00998700
              SET IND-MSG-SEND-YES  TO TRUE                             00998800
            ELSE                                                        00998900
              IF WS-MAX > 9999                                          00999000
                 SUBTRACT 1 FROM WS-MAX                                 00999100
              END-IF                                                    00999200
            END-IF.                                                     00999300
            ADD 1          TO WS-MAX.                                   00999400
            MOVE B204E-RECORD      TO SAVE-B204E-RECORD (WS-MAX).       00999500
TEST        DISPLAY 'LOADED ' B204S-CUSIP(WS-MAX).                      00999600
                                                                        00999700
009732 PRINT-CUSIP-TOTAL.                                               00999800
                                                                        00999900
           IF WS-AMT-MPND NOT = 0                                       01000000
             MOVE  PROC-CUSIP         TO DET1-CUSIP                     01010000
             MOVE  WS-AMT-MPND        TO DET1-AMT-B204                  01020000
             MOVE DETAIL-1      TO OUT-DATA                             01050000
             PERFORM WRITE-REPORT                                       01060000
                                                                        01070000
             MOVE ' '          TO DET2-IND                              01080000
             PERFORM PRINT-B204-DETAIL                                  01090000
             ADD  WS-AMT-B204   TO WS-TOT-B204                          01100000
LRM          IF DET2-STATUS(3:1) > ' '                                  01110000
LRM             IF (DET2-STATUS(3:1) = 'R' OR 'S')                      01120000
LRM                ADD WS-AMT-B204 TO WS-TOT-B204-REJ                   01130000
LRM             ELSE                                                    01140000
LRM             IF  DET2-STATUS(3:1) = 'P'                              01150000
LRM                ADD WS-AMT-B204 TO WS-TOT-B204-PEND                  01160000
LRM             END-IF END-IF                                           01170000
LRM          ELSE                                                       01180000
LRM             IF (DET2-STATUS(2:1) = 'R' OR 'S')                      01190000
LRM                ADD WS-AMT-B204 TO WS-TOT-B204-REJ                   01200000
LRM             ELSE                                                    01210000
LRM             IF  DET2-STATUS(2:1) = 'P'                              01220000
LRM                ADD WS-AMT-B204 TO WS-TOT-B204-PEND                  01230000
LRM             END-IF END-IF                                           01240000
LRM          END-IF                                                     01250000
             MOVE 'Y'           TO WS-CLIENT-IND                        01260000
           END-IF.                                                      01270000
                                                                        01280000
           MOVE ' '          TO DET2-IND                                01290000
                                                                        01300000
           IF  WS-AMT-B204 NOT = WS-AMT-MPND                            01310000
            OR WS-AMT-MPND NOT = 0                                      01320000
                                                                        01330000
             IF PROC-CUSIP NOT = SPACES                                 01340000
               CONTINUE                                                 01350000
             END-IF                                                     01360000
           END-IF.                                                      01361000
                                                                        01361100
       PRINT-B204-DETAIL.                                               01361200
           MOVE ' '      TO WS-MATCH-SW                                 01361300
                                                                        01361400
           PERFORM VARYING WS-IND FROM 1 BY 1                           01361500
                     UNTIL WS-IND > WS-MAX                              01361600
             IF     B204S-BPS (WS-IND)                                  01361700
              IF   B204S-MF-STATUS (WS-IND)  = 'A'                      01361800
                OR ( B204S-MF-STATUS (WS-IND)  = 'R'                    01361900
                    AND (( B204S-MF-STATUS-DATE (WS-IND) <              01362000
                                                BPD-PROC-DATE )         01362100
                         OR ( B204S-MF-STATUS-DATE (WS-IND) =           01362200
                                                BPD-PROC-DATE           01362300
                          AND BH-ACAT-FUNDSERV-POST-SD-BKP = '0' ) ) )  01362400
                   CONTINUE                                             01362500
              ELSE                                                      01362600
011100         MOVE B204S-BRANCH (WS-IND)    TO DET2-BRANCH             01362700
011200         MOVE B204S-ACCOUNT (WS-IND)   TO DET2-ACCOUNT            01362800
011300         MOVE B204S-TYPE     (WS-IND)  TO DET2-TYPE               01362900
011300         MOVE B204S-CD       (WS-IND)  TO DET2-CD                 01363000
               IF  B204S-BPS (WS-IND)                                   01363100
                  AND ACAT-B204S (WS-IND)                               01363200
                   MOVE 'BPS'     TO DET2-SRC                           01363300
               ELSE                                                     01363400
                 IF B204S-CUSIP (WS-IND) NOT = SPACE                    01363500
                   MOVE 'NSCC'     TO DET2-SRC                          01363600
                 ELSE                                                   01363700
                   MOVE SPACE      TO DET2-SRC                          01363800
                 END-IF                                                 01363900
               END-IF                                                   01364000
                                                                        01364100
011300         MOVE B204S-CUSIP (WS-IND)     TO DET2-CUSIP              01364200
011400         MOVE B204S-ACAT-CONTROL (WS-IND) TO DET2-ACAT-CONTROL    01364300
011400         MOVE '-'           TO DET2-ACAT-CONTROL (8 : 1)          01364400
011400         MOVE B204S-ACAT-CONTROL (WS-IND) (8 : 7)                 01364500
011400                            TO DET2-ACAT-CONTROL (9 : )           01364600
011500         MOVE B204S-ASSET-SEQ (WS-IND) TO DET2-ASSET-SEQ          01364700
000700         MOVE B204S-BATCH-ENTRY (WS-IND) TO DET2-BATCH-ENTRY      01364800
000700         MOVE B204S-ORIG-SD (WS-IND) (5 : 2)                      01364900
000700                                       TO DET2-ORG-SD (1 : 2)     01365000
000700         MOVE B204S-ORIG-SD (WS-IND) (7 : 2)                      01365100
000700                                       TO DET2-ORG-SD (4 : 2)     01365200
000700         MOVE B204S-ORIG-SD (WS-IND) (3 : 2)                      01365300
000700                                       TO DET2-ORG-SD (7 : 2)     01365400
000700         MOVE '/'                      TO DET2-ORG-SD(3 : 1)      01365500
000700                                          DET2-ORG-SD (6 : 1)     01365600
000700         MOVE B204S-PROC-DATE (WS-IND) (5 : 2)                    01365700
000700                                       TO DET2-CUR-SD (1 : 2)     01365800
000700         MOVE B204S-PROC-DATE (WS-IND) (7 : 2)                    01365900
000700                                       TO DET2-CUR-SD (4 : 2)     01366000
000700         MOVE B204S-PROC-DATE (WS-IND) (3 : 2)                    01366100
000700                                       TO DET2-CUR-SD (7 : 2)     01366200
000700         MOVE '/'                      TO DET2-CUR-SD(3 : 1)      01366300
000700                                          DET2-CUR-SD (6 : 1)     01366400
003400         MOVE B204S-CONTRA (WS-IND)    TO DET2-CONTRA             01366500
011700         MOVE B204S-AMOUNT (WS-IND)    TO DET2-AMT                01366600
011700         ADD  B204S-AMOUNT (WS-IND)    TO WS-AMT-B204             01366700
003200         MOVE B204S-QTY    (WS-IND)    TO DET2-QTY                01366800
LRM            IF B204S-MF-STATUS-TDY (WS-IND) NOT = ' '                01366900
LRM            AND B204S-MF-STATUS-TDY (WS-IND) NOT =                   01367000
LRM                           B204S-MF-STATUS (WS-IND)                  01367100
LRM               MOVE B204S-MF-STATUS (WS-IND)     TO DET2-STATUS(1:1) 01367200
LRM               MOVE '-'                          TO DET2-STATUS(2:1) 01367300
LRM               MOVE B204S-MF-STATUS-TDY (WS-IND) TO DET2-STATUS(3:1) 01367400
LRM            ELSE                                                     01367500
LRM               MOVE SPACES                   TO DET2-STATUS          01367600
LRM               MOVE B204S-MF-STATUS (WS-IND) TO DET2-STATUS(2:1)     01367700
LRM            END-IF                                                   01367800
               MOVE DETAIL-2       TO OUT-DATA                          01367900
               PERFORM WRITE-B204-REPORT                                01368000
               MOVE 'Y'      TO WS-MATCH-SW                             01368100
               MOVE ' '      TO DET2-CC                                 01368200
              END-IF                                                    01368300
             END-IF                                                     01368400
           END-PERFORM.                                                 01368500
           IF  WS-MATCH-SW = 'Y'                                        01368600
             MOVE SPACE          TO OUT-DATA                            01368700
             PERFORM WRITE-B204-REPORT                                  01368800
           END-IF.                                                      01368900
                                                                        01369000
009732 PRINT-CLIENT-TOTAL.                                              01369100
                                                                        01369200
           MOVE ' '                TO DET1-SETT-DT                      01369300
           MOVE  ' TOTAL CUSIP'     TO DET1-CUSIP                       01369400
           MOVE  WS-TOT-MPND        TO DET1-AMT-B204                    01369500
           MOVE DETAIL-1      TO OUT-DATA.                              01369600
           PERFORM WRITE-REPORT-REC.                                    01369700
                                                                        01369800
           MOVE  '    ACCT S/D CASH'   TO OUT-DATA                      01369900
           PERFORM WRITE-REPORT-REC.                                    01370000
                                                                        01370100
           MOVE  ' '                TO DET1-CC                          01370200
           MOVE  ' BALANCE  '       TO DET1-CUSIP                       01370300
           MOVE WS-PEND-SD-BAL      TO DET1-AMT-B204                    01370400
           MOVE DETAIL-1      TO OUT-DATA.                              01370500
           PERFORM WRITE-REPORT-REC.                                    01370600
                                                                        01370700
           MOVE  ' DIFFERENCE   '   TO DET1-CUSIP                       01370800
           SUBTRACT WS-PEND-SD-BAL FROM WS-TOT-MPND                     01370900
                       GIVING DET1-AMT-B204.                            01371000
           MOVE DETAIL-1      TO OUT-DATA.                              01371100
           PERFORM WRITE-REPORT-REC.                                    01371200
                                                                        01371300
LRM        MOVE  '    TOTAL PENDING'   TO DETAIL-2                      01371900
LRM        MOVE WS-TOT-B204-PEND    TO DET2-AMT                         01372000
LRM        MOVE ' '                 TO DET2-STATUS                      01373000
LRM        MOVE DETAIL-2      TO OUT-DATA.                              01374000
LRM        PERFORM WRITE-B204-REPORT-REC.                               01374100
                                                                        01374200
LRM        MOVE  '    TOTAL REJECTED'  TO DETAIL-2                      01374300
LRM        MOVE WS-TOT-B204-REJ     TO DET2-AMT                         01374400
LRM        MOVE ' '                 TO DET2-STATUS                      01374500
LRM        MOVE DETAIL-2      TO OUT-DATA.                              01374600
LRM        PERFORM WRITE-B204-REPORT-REC.                               01374700
                                                                        01374800
           MOVE  '    TOTAL     '   TO DETAIL-2                         01374900
           MOVE WS-TOT-B204         TO DET2-AMT                         01375000
           MOVE DETAIL-2      TO OUT-DATA.                              01375100
           PERFORM WRITE-B204-REPORT-REC.                               01375200
                                                                        01375300
                                                                        01375400
       WRITE-REPORT.                                                    01375500
           IF WS-LN1 > 52                                               01375600
              PERFORM HEADING1-RTN.                                     01375700
           PERFORM WRITE-REPORT-REC.                                    01375800
           ADD 2      TO WS-LN1.                                        01375900
                                                                        01376000
       WRITE-REPORT-REC.                                                01377000
           MOVE      1   TO   OUT-TRAC-RPT.                             01378000
           WRITE MFBAL-RECORD FROM OUTPUT-AREA.                         01379000
                                                                        01380000
       WRITE-B204-REPORT.                                               01390000
                                                                        01390100
           IF WS-LN2 > 55                                               01390200
              PERFORM HEADING2-RTN.                                     01390300
           PERFORM WRITE-B204-REPORT-REC.                               01390400
           ADD 1      TO WS-LN2.                                        01390500
                                                                        01390600
       WRITE-B204-REPORT-REC.                                           01390700
           MOVE      2   TO   OUT-TRAC-RPT.                             01390800
           WRITE MFDET-RECORD FROM OUTPUT-AREA.                         01390900
                                                                        01391000
       HEADING1-RTN.                                                    01392000
                                                                        01393000
           MOVE OUT-DATA           TO SAVE-OUT-DATA.                    01394000
           MOVE  0    TO WS-LN1                                         01395000
           ADD 1      TO WS-PG1                                         01396000
           MOVE  WS-PG1   TO HED-0-PG.                                  01397000
           MOVE HED-0             TO OUT-DATA                           01398000
           PERFORM WRITE-REPORT-REC.                                    01399000
           MOVE HED-1-1           TO OUT-DATA                           01400000
           PERFORM WRITE-REPORT-REC.                                    01410000
           MOVE HED-1-2           TO OUT-DATA                           01420000
           PERFORM WRITE-REPORT-REC.                                    01430000
           MOVE SAVE-OUT-DATA    TO OUT-DATA.                           01440000
                                                                        01450000
       HEADING2-RTN.                                                    01460000
                                                                        01470000
           MOVE OUT-DATA           TO SAVE-OUT-DATA.                    01480000
           MOVE  0    TO WS-LN2                                         01490000
           ADD 1      TO WS-PG2                                         01500000
           MOVE  WS-PG2   TO HED-0-PG.                                  01510000
           MOVE HED-0             TO OUT-DATA                           01520000
           PERFORM WRITE-B204-REPORT-REC.                               01530000
           MOVE HED-2-1           TO OUT-DATA                           01540000
           PERFORM WRITE-B204-REPORT-REC.                               01550000
           MOVE HED-2-2           TO OUT-DATA                           01560000
           PERFORM WRITE-B204-REPORT-REC.                               01570000
           MOVE HED-2-3           TO OUT-DATA                           01580000
           PERFORM WRITE-B204-REPORT-REC.                               01590000
           MOVE SAVE-OUT-DATA    TO OUT-DATA.                           01600000
           MOVE '0'              TO OUT-DATA (1 : 1).                   01601000
                                                                        01602000
