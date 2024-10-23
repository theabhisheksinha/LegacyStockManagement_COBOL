000001* PDX    - CAT876   C0305136 12/09/10 14:26:25 TBLAMUR            00001000
000001* PDX    - CAT876   C0298905 07/27/10 09:08:50 TBLAMUR            00001102
000001* PDX    - CAT876   C0294120 03/23/10 11:56:06 TBLAMUR            00001200
000001* PDX    - CAT876   C0285736 09/11/09 09:27:53 TBLAMUR            00001300
000001* PDX    - CAT876   C0282904 07/09/09 09:30:40 TBYOHON            00001400
000010 IDENTIFICATION DIVISION.                                         00001700
000011 PROGRAM-ID. CAT876.                                              00001800
000012*=======================================================*         00001900
000013* SELECT ALL PENDING ACCOUNT ACTIVITY FROM B204                   00002000
000015*=======================================================*         00002200
000016                                                                  00002300
000017 ENVIRONMENT DIVISION.                                            00002400
000018 INPUT-OUTPUT SECTION.                                            00002500
000019 FILE-CONTROL.                                                    00002600
000040     SELECT  SORT-WORK-FILE      ASSIGN TO  DA-S-SORTWK01.        00002900
000050                                                                  00003000
000080     SELECT  MFB204-TRAN         ASSIGN TO MFACTAN.               00003500
000090                                                                  00003600
000080     SELECT  MFPEND-FILE         ASSIGN  TO  UT-S-IMFPEND.        00003700
000090                                                                  00003800
000100 DATA DIVISION.                                                   00003900
000200 FILE SECTION.                                                    00004000
000300                                                                  00005000
002300 FD  MFB204-TRAN                                                  00005900
001800     RECORDING MODE IS F                                          00006000
001900     LABEL RECORDS ARE STANDARD                                   00007000
002000     BLOCK CONTAINS 0 RECORDS.                                    00008000
002100 01  MFB204-TRAN-REC                PIC X(250).                   00009000
002200                                                                  00010000
002200 FD  MFPEND-FILE                                                  00011000
002200     RECORDING MODE V                                             00012000
002200     BLOCK CONTAINS 0 RECORDS.                                    00013000
002200                                                                  00014000
002200     COPY ACATPEND  REPLACING ==:FMT:== BY ==MPND==.              00015000
002200                                                                  00016000
002300 SD  SORT-WORK-FILE                                               00020000
002400     DATA  RECORD  ARE SORT-REC SORT-REC2.                        00030000
002500 01  SORT-REC.                                                    00040000
002600     03  SORT-KEY                    PIC X(33).                   00050000
002700     03  SORT-DATA                   PIC X(217).                  00060000
002800                                                                  00070000
002900 WORKING-STORAGE SECTION.                                         00080000
002910 01  GENERAL-WORK-AREA.                                           00090000
002911                                                                  00100000
002912     05  ABEND-CODE                  PIC S9(4)   COMP SYNC.       00110000
002913     05  DUMP-SW                     PIC X       VALUE 'D'.       00120000
002912     05  WS-IND                      PIC S9(4)   COMP VALUE +0.   00121000
002912     05  WS-MMDDYY                   PIC X(6)  VALUE ' '.         00122000
002914     05  END-OF-B204E         PIC X(01) VALUE SPACE.              00130000
002915     05  WRITE-B204E          PIC X(01) VALUE SPACE.              00140000
002933     05  SAVE-B204E-KEY       PIC X(27) VALUE ' '.                00230000
002933     05  WS-BR-ACCT-TYPE      PIC X(9) VALUE ' '.                 00231000
002934                                                                  00240000
002935 01  B204I-EOF-SWITCH          PIC X(01)  VALUE 'F'.              00250000
002936     88  END-OF-B204I-FILE                VALUE 'T'.              00260000
000100**************************************************                00261000
000200* FOR USE WITH MF BALANCING                      *                00262000
000300**************************************************                00263000
000400 01  B204E-RECORD.                                                00264000
000400     05  B204E-KEY.                                               00265000
             07 B204E-PRIME-KEY.                                        00265100
000500         10  B204E-CLIENT                 PIC 9(03).              00266000
000700         10  B204E-CUSIP                  PIC X(09).              00267000
000700         10  B204E-SEC-NO                 PIC X(07).              00268000
             07 B204E-OTHER-KEY.                                        00268100
002300         10  B204E-SOURCE                 PIC X(01) VALUE ' '.    00268200
002400             88  B204E-BPS                VALUE 'T'.              00268300
002500             88  B204E-NSCC               VALUE 'F'.              00268400
000700         10  B204E-ORIG-SD                PIC X(08).              00269000
000700         10  B204E-PROC-DATE              PIC X(08).              00269100
000700         10  B204E-BRANCH                 PIC X(03) VALUE ' '.    00269300
000800         10  B204E-ACCOUNT                PIC X(05) VALUE ' '.    00269400
000900         10  B204E-CURRENCY               PIC 9(03) COMP-3.       00269500
002300         10  B204E-TYPE                   PIC X(01) VALUE ' '.    00269600
002300         10  B204E-CD                     PIC X(01) VALUE ' '.    00269700
002600     05  B204E-MF-STATUS              PIC X(01) VALUE ' '.        00270200
002600     05  B204E-MF-STATUS-TDY          PIC X(01) VALUE ' '.        00270300
002600     05  B204E-MF-STATUS-DATE         PIC X(08) VALUE ' '.        00270400
002600     05  B204E-ASSET-SEQ              PIC X(06) VALUE ' '.        00270500
003000     05  B204E-BATCH-ENTRY            PIC X(06) VALUE ' '.        00270600
LRM002         88 ACAT-B204   VALUE 'TAI NS', 'TAO NS', 'ROL NS'.       00270700
                                                                        00270800
003200     05  B204E-QTY            PIC S9(12)V9(05) COMP-3 VALUE 0.    00270900
003300     05  B204E-AMOUNT         PIC S9(15)V9(02) COMP-3 VALUE 0.    00271000
002600     05  B204E-ACAT-CONTROL   PIC X(15) VALUE ' '.                00271100
003400     05  B204E-CONTRA         PIC X(04) VALUE ' '.                00271200
003400     05  B204E-DESC1          PIC X(30) VALUE ' '.                00271400
003400     05  B204E-DESC2          PIC X(30) VALUE ' '.                00271500
LRM001     05  B204E-CONTRA-PRT-TYP PIC X(01) VALUE ' '.                00271600
003500     05  FILLER               PIC X(48) VALUE ' '.                00272000
003400                                                                  00293000
005940     COPY STUBCPY.                                                00385000
005960     COPY BPDATESC.                                               00387000
005970     COPY B204IOC.                                                00388000
005980     COPY RECB204X REPLACING ==:B204:== BY ==B204==.              00389000
           COPY BHINFO.                                                 00390000
           COPY BHACAT.                                                 00400000
       LINKAGE SECTION.                                                 00410000
       01  LINK-PARM.                                                   00420000
           05 PARM-LENGTH   PIC 9(4) COMP.                              00430000
           05 PARM-BYPASS   PIC X.                                      00440000
005990                                                                  00460000
006000 PROCEDURE DIVISION USING LINK-PARM.                              00470000
006100                                                                  00480000
006200     COPY MSGCOBO.                                                00490000
           MOVE  'CAT876  '              TO BPDATES-CALLING-PGM         00491000
           MOVE  'C'                     TO BPDATES-REQ-TYPE            00492000
           CALL    BPDATES   USING BPDATES-PARAMETERS                   00493000
           MOVE BPD-PROC-DATE (3 : 2)  TO WS-MMDDYY (5 : 2).            00494000
           MOVE BPD-PROC-DATE (5 : 2)  TO WS-MMDDYY (1 : 2).            00495000
           MOVE BPD-PROC-DATE (7 : 2)  TO WS-MMDDYY (3 : 2).            00496000
006300                                                                  00500000
007420     SORT  SORT-WORK-FILE                                         00510000
007430           ASCENDING  KEY        SORT-KEY                         00520000
007440           INPUT  PROCEDURE  IS  SELECT-ALL                       00530000
007450                        THRU     SELECT-ALL-EXIT                  00540000
007460           GIVING MFB204-TRAN.                                    00550000
007480                                                                  00560000
007490     IF  SORT-RETURN  NOT  EQUAL TO  ZERO                         00570000
007500         DISPLAY 'CAT876 - SECOND SORT FAILED'                    00580000
007600         DISPLAY '        SORT RETURN-CODE = ' SORT-RETURN        00590000
007700         CALL   ABEND    USING  ABEND-CODE DUMP-SW.               00600000
007800                                                                  00610000
007900     GOBACK.                                                      00620000
008000                                                                  00630000
       SELECT-ALL.                                                      00631000
                                                                        00632000
           PERFORM PROCESS-B204-FILE THRU PROCESS-B204-FILE-EXIT.       00633000
                                                                        00633100
           OPEN INPUT MFPEND-FILE.                                      00633200
           PERFORM PROCESS-MFPEND    THRU PROCESS-MFPEND-EXIT.          00633300
           CLOSE MFPEND-FILE.                                           00633400
                                                                        00634000
       SELECT-ALL-EXIT.                                                 00635000
           EXIT.                                                        00636000
009560                                                                  00640000
009570 PROCESS-B204-FILE.                                               00650000
009580                                                                  00660000
009590     SET B204IO-READ-FUNCTION TO TRUE.                            00670000
009600     MOVE 'CAT876' TO B204IO-PGM-NAME.                            00680000
009700     MOVE 'B204IN' TO B204IO-DDNAME.                              00690000
009710     PERFORM READ-B204-FILE.                                      00700000
           IF B204-RECORD (1 : 2) = LOW-VALUE                           00710000
              IF PARM-LENGTH > 0                                        00711000
                AND PARM-BYPASS NOT = 'Y'                               00712000
                AND WS-MMDDYY NOT = B204-H-PROCESS-DATE                 00713000
007500         DISPLAY 'WRONG B204 USED '                               00713100
007700         CALL   ABEND    USING  ABEND-CODE DUMP-SW                00713300
              END-IF                                                    00715000
                                                                        00716000
009710        PERFORM READ-B204-FILE.                                   00720000
           MOVE   0     TO BH-BROKER-NUMBER-N                           00730000
009720                                                                  00740000
009730     PERFORM SELECT-B204-RECORDS                                  00750000
009731         UNTIL B204IO-RETURN-EOF.                                 00760000
009732                                                                  00770000
009733     PERFORM RELEASE-RECORD.                                      00780000
009734                                                                  00790000
009735 PROCESS-B204-FILE-EXIT.                                          00800000
009736     DISPLAY ' B204 EXTRACT COMPLETED'.                           00810000
009737                                                                  00820000
009570 PROCESS-MFPEND.                                                  00821000
009580                                                                  00822000
           READ MFPEND-FILE                                             00822200
             AT END                                                     00822300
                GO TO PROCESS-MFPEND-EXIT.                              00822500
           IF  NOT MPND-HEADER-ID                                       00829200
009730       PERFORM FORMAT-MFPEND-FILE                                 00829300
           ELSE                                                         00829400
              IF MPND-HEADER-ID                                         00829500
                AND  PARM-LENGTH > 0                                    00829600
                AND PARM-BYPASS NOT = 'Y'                               00829700
                AND BPD-PROC-DATE NOT = MPND-BOOK-DATE                  00829800
007500         DISPLAY 'WRONG ACAT PENDING USED '                       00829900
007700         CALL   ABEND    USING  ABEND-CODE DUMP-SW                00830000
              END-IF                                                    00830100
           END-IF.                                                      00830200
                                                                        00830300
           GO TO PROCESS-MFPEND.                                        00830400
009734                                                                  00830500
009735 PROCESS-MFPEND-EXIT.                                             00830600
009736     DISPLAY ' MFPEND EXTRACT COMPLETED'.                         00830700
009737                                                                  00830800
009738 READ-B204-FILE.                                                  00831000
009739                                                                  00840000
009740     CALL  B204IO  USING B204IO-PARAMETERS.                       00850000
009750     IF B204IO-RETURN-SUCCESSFUL                                  00860000
009751        MOVE  B204IO-INPUT-RECORD TO B204-RECORD                  00870000
009752     ELSE                                                         00880000
009753      IF NOT   B204IO-RETURN-EOF                                  00890000
009754         DISPLAY 'CAT876 - FIRST SORT FAILED'                     00900000
009755         DISPLAY '        SORT RETURN-CODE = ' SORT-RETURN        00910000
009756         CALL   ABEND    USING  ABEND-CODE DUMP-SW                00920000
009757      END-IF                                                      00930000
009758     END-IF.                                                      00940000
009759                                                                  00950000
009760 SELECT-B204-RECORDS.                                             00960000
009770                                                                  00970000
           IF B204-CLIENT NOT = BH-BROKER-NUMBER-N                      00971000
                  PERFORM CALL-GETB1V.                                  00973100
                                                                        00973200
009800     IF    (B204-RECORD-CODE = 'H')                               00973600
012600          AND  WRITE-B204E = 'Y'                                  00973700
009830        PERFORM RELEASE-RECORD                                    00973900
009850     END-IF.                                                      00975600
                                                                        00975700
           MOVE B204-BRANCH-X  TO WS-BR-ACCT-TYPE.                      00975800
           MOVE B204-ACCOUNT-X TO WS-BR-ACCT-TYPE (4 : )                00975900
           MOVE B204-TYPE      TO WS-BR-ACCT-TYPE (9 : )                00976000
009780     IF    (WS-BR-ACCT-TYPE = BH-ACAT-MF-RECV-PEND-STL-ACCT       00976200
009780             OR WS-BR-ACCT-TYPE = BH-ACAT-MF-DELV-PEND-STL-ACCT)  00976300
009800       AND (B204-TRID-B)                                          00976600
009800       AND (B204-RECORD-CODE = 'H')                               00976700
098020       AND (B204-BKH-AMT NOT = 0)                                 00976800
009840        PERFORM 2020-FORMAT-BSC-REC                               00976900
009850     END-IF.                                                      00977000
                                                                        00977100
012500     IF (B204-RECORD-CODE = 'T')                                  00977200
012600       AND  WRITE-B204E = 'Y'                                     00977300
012600       AND  B204-TRID-B                                           00977400
012600       AND  ACAT-B204                                             00977500
012800          PERFORM VARYING WS-IND FROM 1 BY 1                      00977600
012900                UNTIL WS-IND > 3                                  00977700
013000             IF   B204-BKT-DESC (WS-IND) (1 : 4) = 'ACAT'         00977800
013000              AND B204-BKT-DESC (WS-IND) (19 : 5) = ' BOS '       00977900
013000               MOVE B204-BKT-DESC (WS-IND) (5 : 14) TO            00978000
                                     B204E-ACAT-CONTROL                 00978100
013000               MOVE B204-BKT-DESC (WS-IND) (24 : 4) TO            00978200
                                     B204E-CONTRA                       00978300
013000               MOVE B204-BKT-DESC (WS-IND)  TO B204E-DESC2        00978400
LRM001               MOVE SPACES          TO B204E-CONTRA-PRT-TYP       00978500
013200              END-IF                                              00978600
013300           END-PERFORM                                            00978700
           END-IF.                                                      00978800
                                                                        00978900
012500     IF (B204-RECORD-CODE = 'U')                                  00979000
012600        AND  WRITE-B204E = 'Y'                                    00979100
012600        AND     B204-TRID-B                                       00979200
012600        AND  ACAT-B204                                            00979300
012800           PERFORM VARYING WS-IND FROM 1 BY 1                     00979400
012900                UNTIL WS-IND > 4                                  00979500
013000             IF   B204-BKU-DESC (WS-IND) (1 : 4) = 'ACAT'         00979600
013000              AND B204-BKU-DESC (WS-IND) (19 : 5) = ' BOS '       00979700
013000               MOVE B204-BKU-DESC (WS-IND) (5 : 14) TO            00979800
                                     B204E-ACAT-CONTROL                 00979900
013000               MOVE B204-BKU-DESC (WS-IND) (24 : 4) TO            00980000
                                     B204E-CONTRA                       00980100
013000               MOVE B204-BKU-DESC (WS-IND)  TO B204E-DESC2        00980200
LRM001               MOVE SPACES          TO B204E-CONTRA-PRT-TYP       00980300
013200              END-IF                                              00980400
013300            END-PERFORM                                           00980500
014800     END-IF.                                                      00980600
009860                                                                  00980700
009870     PERFORM READ-B204-FILE.                                      00980800
009890                                                                  00980900
       CALL-GETB1V.                                                     00981000
                                                                        00981100
           MOVE  B204-CLIENT TO BH-BROKER-NUMBER-N.                     00981200
           MOVE  '015'     TO  BH-LOGICAL-RECORD-CODE                   00981300
           MOVE '434500'   TO  BH-B2-INFO-ID                            00981400
           CALL   GETB1V  USING  BH-BROKER-HEADER-INFO                  00981500
                                 BH-ACAT-INFO.                          00981600
009900 RELEASE-RECORD.                                                  00981700
010000                                                                  00981800
010100     IF  WRITE-B204E = 'Y'                                        00981900
010200       MOVE SPACE TO WRITE-B204E                                  00982000
010300       MOVE B204E-RECORD        TO  SORT-REC                      00982100
             IF NOT ACAT-B204 AND B204E-CUSIP NOT = SPACE               00982200
               DISPLAY ' NO ACAT ACTIVETY ' B204E-RECORD (1 : 50)       00982300
             END-IF                                                     00982400
010400       RELEASE SORT-REC                                           00982500
           END-IF.                                                      00982600
010500                                                                  00982700
010600 2020-FORMAT-BSC-REC.                                             00982800
010700                                                                  00982900
010800     MOVE 'Y'               TO WRITE-B204E.                       00983000
010800     MOVE ' '               TO B204E-MF-STATUS                    00983100
010800                               B204E-MF-STATUS-DATE               00983200
000700                               B204E-ORIG-SD                      00983300
010900     MOVE B204-CLIENT       TO B204E-CLIENT                       00983400
011100     MOVE B204-BRANCH       TO B204E-BRANCH                       00983500
011200     MOVE B204-ACCOUNT      TO B204E-ACCOUNT                      00983600
011300     MOVE B204-CURRENCY     TO B204E-CURRENCY                     00984000
011400     MOVE B204-TYPE         TO B204E-TYPE                         00985000
011400     MOVE B204-CHECK        TO B204E-CD                           00986000
011500     MOVE B204-SEC-NO       TO B204E-SEC-NO                       00987000
000700     MOVE B204-BKH-CUSIP-NO TO B204E-CUSIP                        00988200
000700     MOVE B204-DATE         TO B204E-PROC-DATE                    00988600
002400     SET  B204E-BPS         TO TRUE.                              00989200
002600     MOVE SPACE             TO B204E-ACAT-CONTROL                 00989400
002600                               B204E-ASSET-SEQ                    00989600
003400                               B204E-CONTRA                       00989800
003000     MOVE B204-BKH-ENTRY (2 : ) TO B204E-BATCH-ENTRY              00989900
011700     MOVE B204-BKH-AMT      TO B204E-AMOUNT                       00990000
003200     MOVE B204-BKH-QTY      TO B204E-QTY                          00990100
003400     MOVE B204-BKH-SEC-DESC-1 TO  B204E-DESC1                     00990200
011800     IF B204-BS-DD                                                00990400
011900        MULTIPLY -1 BY B204E-QTY                                  00991000
011900        MULTIPLY -1 BY B204E-AMOUNT                               00992000
012000     END-IF.                                                      01000000
012200                                                                  01020000
014900                                                                  01310400
009730 FORMAT-MFPEND-FILE.                                              01310500
009732                                                                  01310600
010900     MOVE MPND-AT-ADP-CL-NO         TO B204E-CLIENT               01310900
011100     MOVE MPND-AT-CUST-ACCOUNT      TO B204E-BRANCH               01311000
011200     MOVE MPND-AT-CUST-ACCOUNT (4 : )  TO B204E-ACCOUNT           01311100
011300     MOVE 0                         TO B204E-CURRENCY             01311200
011400     MOVE '1'                       TO B204E-TYPE                 01311300
           IF  NOT MPND-CASH-ACT                                        01311400
011400       MOVE '2'                       TO B204E-TYPE               01311500
           END-IF.                                                      01311600
                                                                        01311700
010800     MOVE MPND-ACTION-TYPE-CD       TO B204E-MF-STATUS            01311800
010800     MOVE MPND-FNDSRVS-PRCS-DT      TO B204E-MF-STATUS-DATE.      01311900
011500     MOVE MPND-ADP-SEC-NO           TO B204E-SEC-NO               01312000
000700     MOVE MPND-CUSIP-NUM            TO B204E-CUSIP                01312100
000700     MOVE BPD-PROC-DATE             TO B204E-PROC-DATE            01312200
000700     MOVE MPND-AT-SETTL-DATE        TO B204E-ORIG-SD              01312300
002600     MOVE MPND-ASSET-SEQ-NO         TO B204E-ASSET-SEQ            01312400
002400     SET  B204E-NSCC                TO TRUE.                      01312500
003000     MOVE SPACE                     TO B204E-BATCH-ENTRY          01312600
003200     MOVE MPND-ASSET-QTY-DEC        TO B204E-QTY                  01313200
003400     MOVE MPND-SEC-DESC-1           TO B204E-DESC1                01313300
003400     MOVE MPND-SEC-DESC-1 (31 : )   TO B204E-DESC2                01313400
LRM001     MOVE MPND-CONTRA-PARTICIPANT-TYPE TO B204E-CONTRA-PRT-TYP    01313500
011700     MOVE MPND-ASSET-AMT-DEC        TO B204E-AMOUNT               01313601
011800     IF MPND-SHORT                                                01313700
011900        MULTIPLY -1 BY B204E-QTY                                  01313800
011900        MULTIPLY -1 BY B204E-AMOUNT                               01313900
012000     END-IF.                                                      01314000
012200                                                                  01314100
011800     IF MPND-AT-CLNT-IS-RECEIVER                                  01314200
011900        MULTIPLY -1 BY B204E-QTY                                  01314300
011900        MULTIPLY -1 BY B204E-AMOUNT                               01314400
012000     END-IF.                                                      01314500
012200                                                                  01314600
013000     MOVE MPND-AT-CONTROL-NUM          TO                         01314700
                                     B204E-ACAT-CONTROL                 01314800
013000     MOVE MPND-AT-CONTRA-BRK-NUM       TO                         01314900
                                     B204E-CONTRA                       01315000
014900                                                                  01317200
010300     MOVE B204E-RECORD        TO  SORT-REC                        01317300
           IF (B204E-PROC-DATE = BPD-PROC-DATE )                        01317400
      *          AND B204E-MF-STATUS = 'A' OR 'P')                      01317500
010800*                OR                                               01317600
      *       (B204E-PROC-DATE < BPD-PROC-DATE                          01317700
      *          AND B204E-MF-STATUS = 'R')                             01317800
010400        RELEASE SORT-REC.                                         01317900
                                                                        01318000
