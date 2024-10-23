000001* PDX    - CAT780SP C0353123 03/24/14 14:03:14 TBLAMUR            00001003
LRM005* SSR 96502 RECOMPILE CBRS004.13 COPYBOOK CHANGES ACATTAXA.       00001102
000001* PDX    - CAT780SP C0325133 06/01/12 09:10:08 TBLAMUR            00001200
LRM004* SSR 83556 RECOMPILE FOR CBRS002.12 COPYBOOK CHANGE.             00001300
000001* PDX    - CAT780SP C0313692 08/23/11 09:46:00 TBLAMUR            00001400
LRM003* SSR 78938 RECOMPILE DUE TO COPYBOOK CHANGES.                    00001500
000001* PDX    - CAT780SP C0299503 11/11/10 14:04:29 TBLAMUR            00001600
LRM002* SSR 72210 REG CHANGE A #6988 RECORD EXPANSION.                  00001700
000001* PDX    - CAT780SP C0286877 10/15/09 14:44:45 TBLAMUR            00001800
LRM001* SSR 61023 OSI RECOMPILE ONLY TO PICKUP NEW COPYBOOKS.           00001900
000001* PDX    - CAT780SP C0185363 01/06/04 12:13:48 TBLAMUR            00002000
       IDENTIFICATION DIVISION.                                         00020000
       PROGRAM-ID.  CAT780SP.                                           00030000
       AUTHOR.      LARRY MUREY.                                        00040000
       DATE-WRITTEN.  FEB 2003.                                         00050000
                                                                        00060000
      *---------------------------------------------------------------- 00070000
      * THE PURPOSE OF THIS PROGRAM IS TO SPLIT THE TAX LOT EXTRACT.    00080000
      * PARM IS USED TO DEPICT STREAM OR CLIENT NUMBER FOR SINGLE CLIENT00090000
      *---------------------------------------------------------------- 00140000
           EJECT                                                        00150000
      ***************************************************************** 00160000
       ENVIRONMENT DIVISION.                                            00170000
      ***************************************************************** 00180000
       INPUT-OUTPUT SECTION.                                            00190000
       FILE-CONTROL.                                                    00200000
                                                                        00210000
           SELECT TAXLOT-FILE-IN                ASSIGN TO ACATTAXI.     00230000
           SELECT TAXLOT-FILE-OUT               ASSIGN TO ACATTAXO.     00231000
                                                                        00240000
      ***************************************************************** 00250000
       DATA DIVISION.                                                   00260000
      ***************************************************************** 00270000
                                                                        00280000
       FILE SECTION.                                                    00290000
                                                                        00300000
       FD  TAXLOT-FILE-IN                                               00390000
           RECORDING MODE IS F                                          00400000
           BLOCK CONTAINS 0 RECORDS.                                    00410000
       COPY ACATTAXA  REPLACING ==:TAXA:== BY ==TAXA==.                 00411000
                                                                        00430000
       FD  TAXLOT-FILE-OUT                                              00431000
           RECORDING MODE IS F                                          00432000
           BLOCK CONTAINS 0 RECORDS.                                    00433000
       01  TAXLOT-RECORD-OUT             PIC X(1000).                   00434000
                                                                        00435000
           EJECT                                                        00440000
      ******************************************************************00450000
       WORKING-STORAGE SECTION.                                         00460000
      ******************************************************************00470000
                                                                        00480000
       77  ABEND-CODE              COMP  PIC S9(4)   VALUE +9999.       00490000
                                                                        00500000
       77  WS-TAXLOT-DETAILS-READ COMP-3 PIC  9(09)  VALUE ZEROES.      00600000
       77  WS-TAXLOT-REC-WRITTEN  COMP-3 PIC  9(09)  VALUE ZEROES.      00601000
                                                                        00610000
       77  TAXLOT-EOF-SW                 PIC X(01)  VALUE 'N'.          00620000
           88  TAXLOT-EOF                           VALUE 'Y'.          00630000
                                                                        00640000
LRM002 77  WS-PARM-CLIENT                PIC 9(03) VALUE ZERO.          00650000
           EJECT                                                        00910000
           COPY ACATTAXH.                                               00920000
           EJECT                                                        01360000
       01  WS-FILE-DESC.                                                01370000
           05  FILLER                    PIC  X(03)  VALUE 'ADP'.       01380000
           05  WS-DESC-STREAM-IND        PIC  X(01)  VALUE ' '.         01390000
           05  FILLER                    PIC  X(16)                     01400000
              VALUE ' NSCC INPUT FILE'.                                 01410000
                                                                        01460000
           COPY BHINFO.                                                 02480000
                                                                        02490000
           COPY BHACAT.                                                 02500000
                                                                        02510000
           COPY BHTLE.                                                  02511000
                                                                        02512000
       01  B1-SUB               PIC 9(4) VALUE ZEROS.                   02520000
       01  B1-TABLE.                                                    02530000
           05  B1-TABLE-ENTRY OCCURS 500 TIMES.                         02540000
               07  B1-ACAT-COST-BASIS-CLIENT     PIC X.                 02550000
                                                                        02560000
           COPY STUBCPY.                                                02570000
                                                                        02580000
      ******************************************************************02581000
       LINKAGE SECTION.                                                 02582000
      ******************************************************************02583000
                                                                        02584000
       01  PARM-AREA.                                                   02585000
           05  PARM-LENGTH              PIC  S9(4) COMP.                02586000
           05  PARM-INFO.                                               02588000
               10  PARM-STREAM              PIC X(03).                  02590000
LRM002         10  FILLER                   PIC X(02).                  02590100
LRM002         10  PARM-CLIENT              PIC X(03).                  02590200
       EJECT                                                            02591000
       PROCEDURE DIVISION USING PARM-AREA.                              02600000
           DISPLAY 'CAT780SP - SPLIT ACAT / TLE ASSETS FILE'.           02610000
           DISPLAY ' '.                                                 02620000
           COPY MSGCOBO.                                                02630000
                                                                        02640000
           PERFORM INITIAL-ROUTINE.                                     02650000
                                                                        02660000
           PERFORM PROCESS-ROUTINE THRU PROCESS-ROUTINE-EXIT            02670000
               UNTIL TAXLOT-EOF.                                        02680000
           PERFORM ENDJOB-ROUTINE.                                      02690000
                                                                        02700000
           GOBACK.                                                      02710000
                                                                        02720000
           EJECT                                                        02730000
       PROCESS-ROUTINE.                                                 02740000
                                                                        02750000
           IF TAXA-ADP-TAXLOTA-HEADER                                   02760000
TEST          DISPLAY 'WE FOUND HEADER '                                02760100
LRM002        IF WS-PARM-CLIENT > ZERO                                  02760200
LRM002           MOVE SPACES TO TAXA-ADP-RECORD-ID                      02760300
LRM002           MOVE TAXA-DETAIL-RECORD TO NSCC-HDR-RECORD             02760400
LRM002           MOVE BH-BROKER-CLEARING-HOUSE(2 : 4)                   02760500
LRM002                      TO NSCCDHDR-SUB-ORIGINATOR                  02760600
LRM002           IF PARM-STREAM = 'QQQ'                                 02760700
LRM002              SET NSCCDHDR-VB-COST-BASIS-QA TO TRUE               02760900
LRM002           END-IF                                                 02761000
LRM002           IF BH-BROKER-MINI-MAXI-SUBGROUP > SPACES               02761100
LRM002              MOVE BH-BROKER-MINI-MAXI-SUBGROUP                   02761300
LRM002                      TO NSCCDHDR-STREAM                          02761400
LRM002                         WS-DESC-STREAM-IND                       02761500
LRM002           ELSE                                                   02761600
LRM002              MOVE BH-BROKER-MINI-MAXI-INDICATOR                  02761700
LRM002                      TO NSCCDHDR-STREAM                          02761800
LRM002                         WS-DESC-STREAM-IND                       02761900
LRM002           END-IF                                                 02762000
LRM002           MOVE WS-FILE-DESC          TO  NSCCDHDR-FILE-DESC      02762600
LRM002           MOVE '001' TO NSCCDHDR-MULTI-BATCH-NBR                 02762800
LRM002           MOVE NSCC-HDR-RECORD TO TAXA-DETAIL-RECORD(1 : 80)     02762900
LRM002        END-IF                                                    02763000
              MOVE TAXA-DETAIL-RECORD TO TAXLOT-RECORD-OUT              02763100
              PERFORM WRITE-TAXLOT-RECORD                               02763200
              GO TO PROCESS-ROUTINE-SKIP                                02763300
           ELSE                                                         02764000
           IF TAXA-ADP-TAXLOTA-TRAILER                                  02770000
              MOVE TAXA-DETAIL-RECORD TO NSCC-TRL-RECORD                02780000
              MOVE WS-TAXLOT-REC-WRITTEN TO NSCCDTRL-REC-COUNT          02790000
LRM002        IF WS-PARM-CLIENT > ZERO                                  02791000
LRM002           MOVE BH-BROKER-CLEARING-HOUSE(2 : 4)                   02792000
LRM002                  TO NSCCDTRL-SUB-ORIGINATOR                      02793000
LRM002           IF PARM-STREAM = 'QQQ'                                 02793100
LRM002              SET NSCCDTRL-VB-COST-BASIS-QA TO TRUE               02793200
LRM002           END-IF                                                 02793300
LRM002           IF BH-BROKER-MINI-MAXI-SUBGROUP > SPACES               02793400
LRM002              MOVE BH-BROKER-MINI-MAXI-SUBGROUP                   02793500
LRM002                      TO NSCCDTRL-STREAM                          02793600
LRM002           ELSE                                                   02793700
LRM002              MOVE BH-BROKER-MINI-MAXI-INDICATOR                  02793800
LRM002                      TO NSCCDTRL-STREAM                          02793900
LRM002           END-IF                                                 02794000
LRM002           MOVE '9'  TO TAXA-DETAIL-RECORD(1000 : 1)              02794100
LRM002        END-IF                                                    02795000
LRM002        MOVE NSCC-TRL-RECORD TO TAXA-DETAIL-RECORD(1 : 80)        02800000
              MOVE TAXA-DETAIL-RECORD TO TAXLOT-RECORD-OUT              02801000
              PERFORM WRITE-TAXLOT-RECORD                               02810000
              SET TAXLOT-EOF TO TRUE                                    02811000
              GO TO PROCESS-ROUTINE-EXIT                                02812000
           END-IF.                                                      02820000
                                                                        03540000
   ***** DETERMINE IF THE CLIENT SHOULD BE EXTRACTED                    03550000
           IF B1-ACAT-COST-BASIS-CLIENT (TAXA-ADP-CL-NO) > '0'          03560000
              CONTINUE                                                  03560100
           ELSE                                                         03560200
              GO TO PROCESS-ROUTINE-SKIP                                03561000
           END-IF.                                                      03562000
                                                                        03562100
LRM002     IF WS-PARM-CLIENT > ZERO                                     03562300
LRM002        MOVE SPACES TO TAXA-SUFFIX-NON-TLE                        03562500
LRM002     END-IF.                                                      03562600
           MOVE TAXA-DETAIL-RECORD TO TAXLOT-RECORD-OUT                 03562700
           PERFORM WRITE-TAXLOT-RECORD                                  03562800
           ADD 1    TO  WS-TAXLOT-REC-WRITTEN.                          03562900
       PROCESS-ROUTINE-SKIP.                                            03563000
           PERFORM READ-TAXLOT-MASTER-FILE.                             03563100
       PROCESS-ROUTINE-EXIT. EXIT.                                      03564000
           EJECT                                                        04510000
      *****************                                                 04520000
       WRITE-TAXLOT-RECORD.                                             04530000
      *****************                                                 04540000
                                                                        05050000
           WRITE TAXLOT-RECORD-OUT.                                     05060000
                                                                        05080000
           EJECT                                                        05850000
      *****************                                                 05860000
       INITIAL-ROUTINE.                                                 05870000
      *****************                                                 05880000
                                                                        05890000
           OPEN INPUT  TAXLOT-FILE-IN                                   05920000
           PERFORM READ-TAXLOT-MASTER-FILE.                             05920100
           OPEN OUTPUT TAXLOT-FILE-OUT                                  05921000
           MOVE SPACES TO B1-TABLE.                                     05922000
                                                                        05930000
           DISPLAY 'CAT780SP - PARM-INFO = ' PARM-INFO                  05931000
           IF PARM-LENGTH < 3                                           05940000
              DISPLAY 'CAT780SP PARM LENGTH MUST BE AT LEAST 3'         05941000
              MOVE 1000 TO ABEND-CODE                                   05942000
              CALL  ABEND          USING ABEND-CODE                     05943000
           END-IF.                                                      05944000
                                                                        05945000
LRM002     IF PARM-LENGTH > 7                                           05945100
LRM002     AND PARM-CLIENT NUMERIC                                      05945200
LRM002        MOVE PARM-CLIENT TO WS-PARM-CLIENT                        05946000
LRM002     END-IF.                                                      05947000
                                                                        05948000
           IF WS-PARM-CLIENT > ZERO                                     05950000
              DISPLAY 'SPECIAL CLIENT EXTRACT '                         06350000
              MOVE  ' '               TO  BH-BROKER-HEADER-INFO         06350100
              MOVE WS-PARM-CLIENT TO B1-SUB                             06350200
                                         BH-BROKER-NUMBER-N             06350300
              MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE      06350400
              MOVE  '434500'            TO  BH-B2-INFO-ID               06350500
              CALL   GETB1V           USING BH-BROKER-HEADER-INFO,      06350600
                                            BH-ACAT-INFO                06350700
              END-CALL                                                  06350800
              MOVE BH-ACAT-COST-BASIS-CLIENT TO                         06350900
                            B1-ACAT-COST-BASIS-CLIENT (B1-SUB)          06351000
              MOVE  '435400'            TO  BH-B2-INFO-ID               06351100
              CALL   GETB1V           USING BH-BROKER-HEADER-INFO,      06351200
                                            BH-TLE-INFO                 06351300
              END-CALL                                                  06351400
           ELSE                                                         06352000
           PERFORM  VARYING B1-SUB  FROM 1 BY 1                         06360000
                 UNTIL B1-SUB GREATER 500                               06370000
                                                                        06380000
             MOVE  ' '                 TO  BH-BROKER-HEADER-INFO        06390000
             MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N           06400000
             MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE       06410000
             MOVE  '434500'            TO  BH-B2-INFO-ID                06420000
             CALL   GETB1V           USING BH-BROKER-HEADER-INFO,       06430000
                                           BH-ACAT-INFO                 06440000
             END-CALL                                                   06450000
             MOVE  '435400'            TO  BH-B2-INFO-ID                06450300
             CALL   GETB1V           USING BH-BROKER-HEADER-INFO,       06450400
                                           BH-TLE-INFO                  06450500
             END-CALL                                                   06450600
             IF  PARM-STREAM(1 : 1) =                                   06451000
                                       BH-BROKER-MINI-MAXI-INDICATOR    06452000
             AND BH-ACAT-ACTIVE                                         06460000
             AND ((BH-TLE-ACTIVE                                        06461000
LRM002       AND (BH-ACAT-COST-BASIS-CLIENT = '1' OR '3')               06462000
LRM002       AND WS-PARM-CLIENT = ZERO)                                 06462100
LRM002       OR ((BH-ACAT-COST-BASIS-CLIENT = '2' OR '3')               06463000
LRM002       AND WS-PARM-CLIENT > ZERO))                                06464000
      ***CARD-434681                                                    06470000
                MOVE BH-ACAT-COST-BASIS-CLIENT TO                       06490000
                             B1-ACAT-COST-BASIS-CLIENT (B1-SUB)         06500000
                DISPLAY ' B1 CLIENT ' BH-BROKER-NUMBER-N                06510000
                        ' , HAS COST BASIS B1 '                         06520000
                        BH-ACAT-COST-BASIS-CLIENT                       06530000
             END-IF                                                     06540000
           END-PERFORM.                                                 06550000
                                                                        06550100
       READ-TAXLOT-MASTER-FILE.                                         06551000
           READ TAXLOT-FILE-IN                                          06552000
               AT END SET TAXLOT-EOF TO TRUE                            06553000
           END-READ.                                                    06554000
           IF NOT TAXLOT-EOF                                            06554100
           AND TAXA-ADP-TAXLOTA-DETAIL                                  06555000
              ADD 1 TO WS-TAXLOT-DETAILS-READ                           06556000
           END-IF.                                                      06557000
                                                                        06560000
      ****************                                                  06850000
       ENDJOB-ROUTINE.                                                  06860000
      ****************                                                  06870000
                                                                        06880000
           CLOSE  TAXLOT-FILE-IN.                                       06930000
           CLOSE  TAXLOT-FILE-OUT.                                      06931000
                                                                        06940000
           DISPLAY ' '                                                  06950000
           DISPLAY 'TAXLOT EXTRACT RECS : ' WS-TAXLOT-REC-WRITTEN.      07030000
                                                                        07040000
           DISPLAY ' '                                                  07050000
           DISPLAY '***************************'                        07060000
           DISPLAY '* END OF CAT780SP PROGRAM *'                        07070000
           DISPLAY '***************************'                        07080000
           DISPLAY ' '.                                                 07090000
