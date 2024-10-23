000001* PDX    - CAT784DB C0353123 03/24/14 13:43:12 TBLAMUR            00001000
000001* PDX    - CAT784DB C0339566 03/27/13 08:20:34 TBLAMUR            00001100
LRM012* PMR EXPAND DETAIL TABLE FROM 2K TO 5K.                          00001200
000001* PDX    - CAT784DB C0325133 07/20/12 08:30:43 TBLAMUR            00001300
LRM011* SSR 83556 RECOMPILE FOR CBRS002.12 COPYBOOK CHANGE.             00001400
LRM011*   ALSO CHANGE PARM-BTYPASS = 1 TO STILL CONSIDER PROCESSING THE 00001500
LRM011*   INPUT FILE WITH THE EXPECTED DATE.                            00001600
000001* PDX    - CAT784DB C0329053 07/20/12 02:12:17 TBLAMUR            00001700
LRM010* EXPAND DETAIL TABLE FROM 900 TO 2000.                           00001800
000001* PDX    - CAT784DB C0324918 05/01/12 09:05:14 TBLAMUR            00001900
LRM009* SSR 83069 QA/PSE TO RUN ON CURRENT DATE.                        00002000
000001* PDX    - CAT784DB C0322389 02/03/12 09:40:20 TBLAMUR            00002100
LRM008* CONTRA TABLE EXPANSION (SIAC1666).                              00002200
000001* PDX    - CAT784DB C0318394 12/15/11 16:28:27 TBLAMUR            00002300
LRM007* SSR 78938 CORRECT SUB-ORIGINATOR OF CLIENT FEED GOING OUT.      00002400
000001* PDX    - CAT784DB C0319286 11/20/11 16:07:06 TBLAMUR            00002500
000001* PDX    - CAT784DB C0319274 11/18/11 18:06:11 TBLAMUR            00002600
000001* PDX    - CAT784DB C0313692 09/29/11 08:34:54 TBLAMUR            00002700
LRM006* SSR 79652 CORRECT EDIT OF "T" RECORD QTY TOTAL, TO COMPARE WITH 00002800
LRM006*     "A" RECORD QTY RETURNED, NOT THE ORIGINAL QTY FROM THE ACAT.00002900
LRM006*     ADD DATECK AND BYPASS ABEND PARM.                           00003000
000001* PDX    - CAT784DB C0313692 08/23/11 09:21:46 TBLAMUR            00003100
LRM005* SSR 78938 REGULATORY CHANGE TO CBRS FILE, REMOVE A RECORD TOTALS00003200
000001* PDX    - CAT784DB C0313729 06/30/11 09:26:34 TBLAMUR            00003300
LRM004* SSR 76809 DONT EDIT DETAIL QTY ON REC TYPES 03,04               00003400
000001* PDX    - CAT784DB C0310202 04/14/11 16:05:22 TBLAMUR            00003500
LRM003* SSR 76919 REMOVE DIVIDE BY QTY IN TOTAL AVG COST CALC.          00003600
000001* PDX    - CAT784DB C0299503 12/09/10 09:41:54 TBLAMUR            00003700
LRM002* SSR 72210 REG CHANGE A #6988 RECORD EXPANSION.  THE NEW CBRS    00003800
LRM002* PARTICIPANT FILE REPLACES THE ACAT PARTICIPANT FILE SIAC0068.   00003900
LRM002* ON CLIENT FEED, IDENTIFIED BY JCL PARM, DO NOT EDIT RECORDS,    00004000
LRM002* SPACE OUT RECORD SUFFIX AND WRITE ENTIRE FILE TO OUTPUT.        00004100
000001* PDX    - CAT784DB C0292161 02/09/10 08:28:52 TBLAMUR            00004200
000001* PDX    - CAT784DB C0290502 02/05/10 13:27:50 TBLAMUR            00004300
000001* PDX    - CAT784DB C0286877 10/15/09 14:43:11 TBLAMUR            00004400
LRM001* SSR 61023 OPTION SYMBOLOGY CHANGE RECOMPILE ONLY TO USE         00004500
LRM001*   NEW COPYBOOKS.                                                00004600
000001* PDX    - CAT784DB C0208175 07/07/04 11:38:58 TBLAMUR            00004700
000001* PDX    - CAT784DB C0206465 05/25/04 13:37:04 TBLAMUR            00004800
000001* PDX    - CAT784DB C0204395 04/07/04 15:06:41 TBLAMUR            00004900
000001* PDX    - CAT784DB C0185363 03/08/04 08:04:30 TBLAMUR            00005000
       IDENTIFICATION DIVISION.                                         00005100
       PROGRAM-ID.  CAT784DB.                                           00005200
       AUTHOR.      LARRY MUREY.                                        00005300
       DATE-WRITTEN.  MARCH 2003.                                       00005400
                                                                        00005500
      *---------------------------------------------------------------- 00005600
      * THE PURPOSE OF THIS PROGRAM IS TO PASS VALID TLE DETAILS TO     00005700
      * THE NSCC. AN ERROR REPORT FILE AND VALID (DROP FILE) ARE        00005800
      * CREATED.  DETAILS RECEIVED FROM THE TAX LAX LOT ENGINES ARE     00005900
      * EDITTED FOR TOTAL DETAIL QTY "T" RECORDS MATCHES THE HEADER "A".00006000
      *   PASS - WRITE "A" RECORD AND ALL "T" RECORDS TO NSCC FILE.     00006100
      *   FAIL - WRITE "A" RECORD TO ERROR FILE AND IGNORE "T" RECORDS. 00006200
      *                                                                 00006300
      * RE-CHECK PARTICIPANT FILE TO ASSURE THIS IS A COST BASIS        00006400
      * CLIENT.  IF NOT, DON'T SEND TO NSCC.                            00006500
      *---------------------------------------------------------------- 00006600
           EJECT                                                        00006700
      ***************************************************************** 00006800
       ENVIRONMENT DIVISION.                                            00006900
      ***************************************************************** 00007000
       INPUT-OUTPUT SECTION.                                            00007100
       FILE-CONTROL.                                                    00007200
                                                                        00007300
LRM002     SELECT CBRS-PARTICIPANT-FILE         ASSIGN TO CBRSBRKR.     00007400
           SELECT TAXLOT-DETAIL-FILE            ASSIGN TO INFILE.       00007500
           SELECT TAXLOT-NSCC-FEED              ASSIGN TO NSCCFL.       00007600
           SELECT TAXLOT-ERROR-FILE             ASSIGN TO TLERROR.      00007700
                                                                        00007800
      ***************************************************************** 00007900
       DATA DIVISION.                                                   00008000
      ***************************************************************** 00008100
                                                                        00008200
       FILE SECTION.                                                    00008300
                                                                        00009000
LRM002 FD  CBRS-PARTICIPANT-FILE                                        00010000
LRM002     RECORDING MODE F                                             00020000
LRM002     BLOCK CONTAINS 0 RECORDS                                     00030000
LRM002     LABEL RECORDS ARE STANDARD                                   00040000
LRM002     RECORD CONTAINS 200 CHARACTERS.                              00050000
LRM002                                                                  00060000
LRM002 01  CBRS-PRTCP-RECORD           PIC X(200).                      00070000
                                                                        00080000
       FD  TAXLOT-DETAIL-FILE                                           00090000
           RECORDING MODE IS F                                          00100000
           BLOCK CONTAINS 0 RECORDS.                                    00110000
       COPY ACATTAXA  REPLACING ==:TAXA:== BY ==TAXA==.                 00120000
       COPY ACATTAXT  REPLACING ==:TAXT:== BY ==TAXT==.                 00130000
                                                                        00140000
       FD  TAXLOT-NSCC-FEED                                             00150000
           RECORDING MODE IS V                                          00160000
           BLOCK CONTAINS 0 RECORDS.                                    00170000
                                                                        00180000
       01  TAXLOT-NSCC-HDR-TRL-RECORD    PIC X(80).                     00190000
       01  TAXLOT-NSCC-A-RECORD.                                        00200000
           05  FILLER                    PIC X(899).                    00210000
           05  TAXLOT-NSCC-RECORD-SUFFIX PIC X(101).                    00220000
       01  TAXLOT-NSCC-T-RECORD          PIC X(1000).                   00230000
                                                                        00240000
       FD  TAXLOT-ERROR-FILE                                            00250000
           RECORDING MODE IS F                                          00260000
           BLOCK CONTAINS 0 RECORDS.                                    00270000
       01  TAXLOT-ERROR-RECORD           PIC X(1000).                   00280000
                                                                        00290000
           EJECT                                                        00300000
      ******************************************************************00310000
       WORKING-STORAGE SECTION.                                         00320000
      ******************************************************************00330000
                                                                        00340000
       77  ABEND-CODE              COMP  PIC S9(4)   VALUE +9999.       00350000
                                                                        00360000
       77  WS-TRADE-PLUS-1                  PIC X(08)  VALUE ' '.       00370000
                                                                        00380000
       77  WS-SETTL-DATE                    PIC X(10).                  00390000
                                                                        00400000
LRM002 77  WS-PARM-CLIENT                PIC  9(03)  VALUE ZEROES.      00410000
       77  WS-TOTAL-TI-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00420000
       77  WS-TOTAL-AT-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00430000
       77  WS-TOTAL-OP-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00431000
       77  WS-TOTAL-OP-NOT-FND   COMP-3  PIC  9(09)  VALUE ZEROES.      00432000
       77  WS-TOTAL-TAXT-QUANTITY COMP-3 PIC  9(12)V9(4) VALUE ZERO.    00433000
LRM005 77  WK-TAXA-ASSET-QTY             PIC  9(12)V9(4) VALUE ZERO.    00434000
                                                                        00435000
       77  WS-TAXLOT-A-RECS-READ COMP-3  PIC  9(09)  VALUE ZEROES.      00436000
       77  WS-TAXLOT-T-RECS-READ COMP-3  PIC  9(09)  VALUE ZEROES.      00437000
       77  WS-NSCC-A-REC-CNTR    COMP-3  PIC  9(09)  VALUE ZEROES.      00438000
       77  WS-NSCC-T-REC-CNTR    COMP-3  PIC  9(09)  VALUE ZEROES.      00439000
       77  WS-ERROR-REC-CNTR     COMP-3  PIC  9(09)  VALUE ZEROES.      00440000
       77  WS-ERROR-A-REC-CNTR   COMP-3  PIC  9(09)  VALUE ZEROES.      00450000
       77  WS-COST-BASIS-DROP-COUNT COMP-3 PIC 9(09) VALUE ZEROES.      00460000
       77  SUB                           PIC S9(5)  COMP-3 VALUE ZERO.  00470000
                                                                        00480000
       77  FIRST-TIME-SW                 PIC X(01)  VALUE 'Y'.          00490000
           88  FIRST-TIME                           VALUE 'Y'.          00500000
           88  NOT-FIRST-TIME                       VALUE 'N'.          00510000
                                                                        00520000
       77  CBRS-BROKER-EOF-SW            PIC X(01)  VALUE 'N'.          00530000
           88  CBRS-BROKER-EOF                      VALUE 'Y'.          00531000
                                                                        00532000
       77  COST-BASIS-ELIGABLE-SW        PIC X(01)  VALUE 'N'.          00533000
           88  COST-BASIS-ELIGABLE                  VALUE 'Y'.          00534000
                                                                        00535000
       77  TAXLOT-EOF-SW                 PIC X(01)  VALUE 'N'.          00536000
           88  TAXLOT-EOF                           VALUE 'Y'.          00537000
                                                                        00538000
       77  TRAILER-FOUND-SW              PIC X(01)  VALUE 'N'.          00539000
           88  TRAILER-FOUND                        VALUE 'Y'.          00540000
                                                                        00550000
       77  TAXLOT-EDIT-SW                PIC X(01)  VALUE 'N'.          00560000
           88  PASSED-EDIT                          VALUE 'Y'.          00570000
           88  FAILED-EDIT                          VALUE 'N'.          00580000
                                                                        00590000
       77  TLE-ELIGIBLE-SW               PIC X(01)  VALUE 'N'.          00600000
           88  TLE-NOT-ELIGIBLE                     VALUE 'N'.          00601000
           88  TLE-ELIGIBLE                         VALUE 'Y'.          00602000
                                                                        00603000
       77  TAXT-TABLE-OVERFLOW-SW        PIC X(01)  VALUE 'N'.          00604000
           88  TAXT-OVERFLOW-WARNING                VALUE 'Y'.          00604100
                                                                        00604200
       01  DATE-WORK-AREA.                                              00604300
           03  WS-NON-STANDARD-DATE        PIC X(10).                   00604400
           03  WS-FUL-STTLM-DATE           PIC X(10).                   00604500
                                                                        00604600
       01  WS-PRIOR-MMDDCCYY.                                           00604700
           05  WS-PRIOR-MM                 PIC  X(02).                  00604800
           05  WS-PRIOR-DD                 PIC  X(02).                  00604900
           05  WS-PRIOR-CC                 PIC  X(02).                  00605000
           05  WS-PRIOR-YY                 PIC  X(02).                  00605100
                                                                        00605200
       01  WS-DATE-MMDDCCYY.                                            00605300
           05  WS-DATE-MM                  PIC  X(02).                  00605400
           05  WS-DATE-DD                  PIC  X(02).                  00605500
           05  WS-DATE-CC                  PIC  X(02).                  00605600
           05  WS-DATE-YY                  PIC  X(02).                  00605700
                                                                        00605800
       01  WS-TODAY-CCYYMMDD.                                           00605900
           05  WS-TODAY-CC                 PIC  X(02).                  00606000
           05  WS-TODAY-YY                 PIC  X(02).                  00607000
           05  FILLER                      PIC  X(01)  VALUE '-'.       00608000
           05  WS-TODAY-MM                 PIC  X(02).                  00608100
           05  FILLER                      PIC  X(01)  VALUE '-'.       00608200
           05  WS-TODAY-DD                 PIC  X(02).                  00608300
                                                                        00608400
       01  WS-BPD-PROC-DATE                 PIC X(08)  VALUE ' '.       00608500
       01  FILLER REDEFINES WS-BPD-PROC-DATE.                           00608600
           05  WS-BPD-CC                 PIC  X(02).                    00608700
           05  WS-BPD-YY                 PIC  X(02).                    00608800
           05  WS-BPD-MM                 PIC  X(02).                    00608900
           05  WS-BPD-DD                 PIC  X(02).                    00609000
                                                                        00609100
       01  WS-BPD-PRIOR-PROC-DATE           PIC X(08)  VALUE ' '.       00609200
       01  FILLER REDEFINES WS-BPD-PRIOR-PROC-DATE.                     00609300
           05  WS-BPD-PRIOR-CC           PIC  X(02).                    00609400
           05  WS-BPD-PRIOR-YY           PIC  X(02).                    00609500
           05  WS-BPD-PRIOR-MM           PIC  X(02).                    00609600
           05  WS-BPD-PRIOR-DD           PIC  X(02).                    00609700
                                                                        00609800
       01  WS-FILE-DESC.                                                00609900
           05  FILLER                    PIC  X(03)  VALUE 'ADP'.       00610000
           05  WS-DESC-STREAM-IND        PIC  X(01)  VALUE ' '.         00620000
           05  FILLER                    PIC  X(16)                     00630000
               VALUE ' NSCC INPUT FILE'.                                00640000
                                                                        00650000
       01  WS-ORIGINATOR.                                               00660000
           05  FILLER                   PIC  X(03)  VALUE 'ADP'.        00670000
           05  WS-ORIGINATOR-STREAM     PIC  X(01)  VALUE 'Z'.          00680000
                                                                        00690000
           EJECT                                                        00700000
       01  WS-CBRS-TABLE.                                               00710000
LRM002     03  WS-TLE-RECORD-COUNT         PIC S9(9) COMP VALUE ZERO.   00720000
LRM002     03  WS-TLE-TAXA-CURR-REC        PIC S9(9) COMP VALUE ZERO.   00730000
LRM002     03  WS-CBRS-RECORD-COUNT        PIC S9(9) COMP VALUE ZERO.   00740000
           03  TAXLOT-COUNT                PIC S9(4) COMP VALUE ZERO.   00750000
           03  PRTCP-SUB                   PIC S9(9) COMP VALUE ZERO.   00760000
LRM002     03  WS-CBRS-ENTRY OCCURS 10000 TIMES.                        00770000
LRM002         05  WS-CBRS-BROKER          PIC X(08).                   00780000
LRM002         05  WS-CBRS-BROKER-TYPE     PIC X(06).                   00790000
               05  WS-CBRS-BROKER-NAME     PIC X(50).                   00800000
           EJECT                                                        00810000
LRM002 COPY CBRSPPIO   REPLACING ==:CBRS:== BY ==WS-CBRS==.             00820000
           EJECT                                                        00820100
       COPY ACATTAXH.                                                   00820200
           EJECT                                                        00820300
       COPY ACATTAXA  REPLACING ==:TAXA:== BY ==WS-TAXA==.              00820400
LRM009 01  WS-TAXT-TABLE-COUNT             PIC S9(4) COMP VALUE ZERO.   00820500
       01  WS-TAXLOT-T-RECORD-TABLE.                                    00820600
LRM012     05  WS-TAXT-DETAIL-RECORD OCCURS 5000 TIMES                  00820700
                                            PIC X(1000).                00820800
      /                                                                 00820900
       01  FILLER                        PIC X(08) VALUE 'SQLCA   '.    00821000
           EXEC SQL                                                     00821100
               INCLUDE SQLCA                                            00821200
           END-EXEC.                                                    00821300
      /                                                                 00821400
       01  FILLER                        PIC X(08) VALUE 'VTRNFR  '.    00821500
           EXEC SQL                                                     00821600
               INCLUDE VTRNFR                                           00821700
           END-EXEC.                                                    00821800
      /                                                                 00821900
       01  FILLER                        PIC X(08) VALUE 'VASSET  '.    00822000
           EXEC SQL                                                     00822100
               INCLUDE VASSET                                           00822200
           END-EXEC.                                                    00822300
      /                                                                 00822400
       01  FILLER                        PIC X(08) VALUE 'VASSET  '.    00822500
           EXEC SQL                                                     00822600
               INCLUDE VASTHSTY                                         00822700
           END-EXEC.                                                    00822800
      /                                                                 00822900
       01  FILLER                        PIC X(08) VALUE 'DB2AREA '.    00823000
       01  DB2-ABEND-WORK-AREA.                                         00823100
           03  DB2-ABEND-CODE                PIC S9(04) COMP.           00823200
           03  WS-DB2-MESSAGE-AREA.                                     00823300
               05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.00823400
               05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES 00823500
                   INDEXED BY WS-ERROR-INDEX.                           00823600
           03  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80. 00823700
           03  W-DB2-TABLE-NAME          PIC  X(008).                   00823800
           03  W-DB2-ACTION              PIC  X(008).                   00823900
           03  W-DB2-SQLCODE             PIC  -999.                     00824000
                                                                        00825000
       01  W-DB2-WORKAREA.                                              00826000
           05  ROLLBACK-SQLCA            PIC  X(122).                   00827000
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              00828000
               88  ROLLBACK-OK                VALUE +0.                 00829000
               88  ROLLBACK-AB                VALUE -999 THRU -1        00830000
                                                    +1   THRU +999.     00840000
           05  COMMIT-SQLCA              PIC  X(122).                   00850000
           05  COMMIT-RETURN             PIC S9(009) COMP.              00860000
               88  COMMIT-OK                  VALUE +0.                 00870000
               88  COMMIT-AB                  VALUE -999 THRU -1        00871000
                                                    +1   THRU +999.     00871100
           05  W-COMMIT-CTR              PIC  9(009) COMP-3             00871200
                                              VALUE 0.                  00871300
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(009) VALUE 0.           00871400
                                                                        00871500
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  00871600
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                   00871700
       01  CALL-MODULES.                                                00871800
           05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   00871900
           EJECT                                                        00872000
           COPY BPDATESC.                                               00872100
                                                                        00872200
       01  INFSND-DATA.                                                 00872300
           05 FILLER PIC X(8) VALUE 'CAT784DB'.                         00872400
           05 INFSND-MSG PIC X(45) VALUE SPACES.                        00872500
                                                                        00872600
           EJECT                                                        00872700
           COPY BHINFO.                                                 00872800
                                                                        00872900
           COPY BHACAT.                                                 00873000
                                                                        00873100
       01  B1-SUB               PIC 9(4) VALUE ZEROS.                   00873200
       01  B1-TABLE.                                                    00873300
           05  B1-TABLE-ENTRY OCCURS 500 TIMES.                         00873400
               07  B1-STREAM                     PIC X.                 00873500
               07  B1-ACAT-COST-BASIS-CLIENT     PIC X.                 00873600
                                                                        00873700
           COPY STUBCPY.                                                00873800
                                                                        00873900
           EJECT                                                        00874000
      ***************************************************************** 00874100
       LINKAGE SECTION.                                                 00874200
      ***************************************************************** 00874300
       01  PARM-AREA.                                                   00874400
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.        00874500
           05  PARM-INFO.                                               00874600
               10  PARM-STREAM              PIC X(01).                  00874700
LRM006         10  L-BYP-DATECHK-SW         PIC X(01).                  00874800
LRM006             88  L-BYP-DATECHK                     VALUE '1'.     00874900
               10  PARM-BYPASS-EMPTY-INPUT  PIC X(01).                  00875000
LRM006         10  PARM-INTRA-DAY           PIC X(01).                  00875100
LRM002         10  FILLER                   PIC X(02).                  00875200
LRM002         10  PARM-CLIENT              PIC X(03).                  00875300
           EJECT                                                        00875400
       PROCEDURE DIVISION USING PARM-AREA.                              00875500
           DISPLAY 'CAT784DB - EDIT TLE/CBRS DETAILS'.                  00875600
           DISPLAY ' '.                                                 00875700
           COPY MSGCOBO.                                                00875800
                                                                        00875900
           PERFORM 1000-INITIAL-ROUTINE.                                00876000
                                                                        00877000
           PERFORM 2000-PROCESS-ROUTINE                                 00878000
              THRU 2000-PROCESS-ROUTINE-EXIT                            00879000
                 UNTIL TAXLOT-EOF.                                      00880000
                                                                        00890000
           PERFORM 9999-ENDJOB-ROUTINE.                                 00900000
                                                                        00910000
           GOBACK.                                                      00920000
                                                                        00930000
           EJECT                                                        00940000
      *****************                                                 00950000
       1000-INITIAL-ROUTINE.                                            00960000
      *****************                                                 00970000
           IF PARM-LENGTH NOT > 1                                       00980000
              DISPLAY 'CAT784DB PARM MUST CONTAIN 1 BYTE STREAM'        00990000
              MOVE 1000 TO ABEND-CODE                                   01000000
              CALL  ABEND          USING ABEND-CODE                     01010000
           END-IF.                                                      01020000
           DISPLAY 'CAT784DB PARM=' PARM-INFO.                          01030000
                                                                        01040000
LRM006     IF PARM-LENGTH > 8                                           01050000
LRM002     AND PARM-CLIENT NUMERIC                                      01060000
LRM002        MOVE PARM-CLIENT TO WS-PARM-CLIENT                        01070000
LRM002        DISPLAY 'PARM CLIENT ' WS-PARM-CLIENT                     01080000
LRM002                ' LENGTH ' PARM-LENGTH                            01090000
LRM002     END-IF.                                                      01100000
                                                                        01110000
           EXEC SQL                                                     01120000
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP             01130000
           END-EXEC                                                     01140000
                                                                        01150000
           IF  SQLCODE = +0                                             01160000
               DISPLAY ' '                                              01170000
               DISPLAY 'CAT784DB: W-CURRENT-TIMESTAMP = '               01180000
                                                    W-CURRENT-TIMESTAMP 01190000
               DISPLAY ' '                                              01200000
           ELSE                                                         01210000
               DISPLAY 'CAT784DB: W-CURRENT-TIMESTAMP NOT SET'          01220000
               PERFORM 8500-SQL-ERROR-ROUTINE                           01230000
           END-IF.                                                      01240000
                                                                        01250000
LRM002     OPEN INPUT  CBRS-PARTICIPANT-FILE                            01260000
           PERFORM 1100-LOAD-CBRS-BROKER-TABLE.                         01270000
LRM002     CLOSE  CBRS-PARTICIPANT-FILE                                 01280000
                                                                        01290000
           OPEN INPUT  TAXLOT-DETAIL-FILE.                              01300000
           OPEN OUTPUT TAXLOT-NSCC-FEED.                                01310000
           OPEN OUTPUT TAXLOT-ERROR-FILE.                               01311000
                                                                        01312000
           MOVE SPACES TO B1-TABLE.                                     01313000
                                                                        01314000
           MOVE  'CAT784DB'                   TO BPDATES-CALLING-PGM.   01314100
           MOVE  'C'                          TO BPDATES-REQ-TYPE.      01314200
                                                                        01314300
           CALL    BPDATES            USING BPDATES-PARAMETERS.         01314400
                                                                        01314500
           MOVE BPD-PROC-PLUS-ONE-TD  TO  WS-TRADE-PLUS-1               01314600
           MOVE BPD-PROC-DATE         TO  WS-BPD-PROC-DATE              01314700
           MOVE WS-BPD-MM             TO  WS-DATE-MM                    01314800
LRM002                                    WS-TODAY-MM                   01314900
           MOVE WS-BPD-DD             TO  WS-DATE-DD                    01315000
LRM002                                    WS-TODAY-DD                   01316000
           MOVE WS-BPD-CC             TO  WS-DATE-CC                    01317000
LRM002                                    WS-TODAY-CC                   01318000
           MOVE WS-BPD-YY             TO  WS-DATE-YY                    01319000
LRM002                                    WS-TODAY-YY.                  01319100
LRM006     MOVE BPD-PRIOR-PROC-DATE TO  WS-BPD-PRIOR-PROC-DATE          01319200
LRM006     MOVE WS-BPD-PRIOR-MM       TO  WS-PRIOR-MM                   01319300
LRM006     MOVE WS-BPD-PRIOR-DD       TO  WS-PRIOR-DD                   01319400
LRM006     MOVE WS-BPD-PRIOR-CC       TO  WS-PRIOR-CC                   01319500
LRM006     MOVE WS-BPD-PRIOR-YY       TO  WS-PRIOR-YY                   01319600
                                                                        01319700
LRM002     IF WS-PARM-CLIENT > ZERO                                     01319800
LRM002        DISPLAY 'SPECIAL CLIENT EXTRACT ' WS-PARM-CLIENT          01319900
LRM002        MOVE  ' '               TO  BH-BROKER-HEADER-INFO         01320000
LRM002        MOVE WS-PARM-CLIENT     TO B1-SUB                         01320100
LRM002                                   BH-BROKER-NUMBER-N             01320200
LRM002        MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE      01320300
LRM002        MOVE  '434500'            TO  BH-B2-INFO-ID               01320400
LRM002        CALL   GETB1V           USING BH-BROKER-HEADER-INFO,      01320500
LRM002                                      BH-ACAT-INFO                01320600
LRM002        END-CALL                                                  01320700
LRM002        IF  BH-ACAT-ACTIVE                                        01320800
LRM002           MOVE BH-ACAT-COST-BASIS-CLIENT TO                      01320900
LRM002                      B1-ACAT-COST-BASIS-CLIENT (B1-SUB)          01321000
LRM002        END-IF                                                    01321100
LRM002        DISPLAY 'B1 CLEARING NBR ' BH-BROKER-CLEARING-HOUSE(2 : 4)01321200
LRM002     ELSE                                                         01321300
           PERFORM  VARYING B1-SUB  FROM 1 BY 1                         01321400
                 UNTIL B1-SUB GREATER 500                               01321500
                                                                        01321600
             MOVE  ' '                 TO  BH-BROKER-HEADER-INFO        01321700
             MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N           01321800
             MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE       01321900
             MOVE  '434500'            TO  BH-B2-INFO-ID                01322000
             CALL   GETB1V           USING BH-BROKER-HEADER-INFO,       01322100
                                           BH-ACAT-INFO                 01322200
             END-CALL                                                   01322300
             IF  BH-ACAT-ACTIVE                                         01322400
      ***CARD-434681                                                    01322500
                MOVE BH-ACAT-COST-BASIS-CLIENT TO                       01322600
                             B1-ACAT-COST-BASIS-CLIENT (B1-SUB)         01322700
                MOVE BH-BROKER-MINI-MAXI-INDICATOR TO B1-STREAM (B1-SUB)01322800
                DISPLAY ' B1 CLIENT ' BH-BROKER-NUMBER-N                01322900
                        ' , HAS COST BASIS B1 '                         01323000
                        BH-ACAT-COST-BASIS-CLIENT                       01323100
             END-IF                                                     01323200
           END-PERFORM.                                                 01323300
           PERFORM 2100-READ-TAXLOT-DETAIL-FILE.                        01323400
           IF TAXLOT-EOF                                                01323500
              DISPLAY 'CAT784DB ENCOUNTERED EMPTY TAX LOT FILE - '      01323600
                 'CHECK DD INFILE'                                      01323700
              IF PARM-BYPASS-EMPTY-INPUT = '1'                          01323800
                 DISPLAY 'EMPTY INPUT FILE ABEND BYPASSED DUE TO PARM'  01323900
                 PERFORM 1200-CREATE-HEADER-RECORD                      01324000
              ELSE                                                      01324100
                 DISPLAY 'CAT784DB ABENDS'                              01324200
                 MOVE 1500 TO ABEND-CODE                                01324300
                 CALL  ABEND          USING ABEND-CODE                  01324400
           ELSE                                                         01324500
               PERFORM 1200-CREATE-HEADER-RECORD                        01324600
               IF TAXA-RECORD-TYPE = 'H'                                01324700
LRM006            MOVE TAXA-DETAIL-RECORD TO NSCC-HDR-RECORD            01324800
LRM006            IF L-BYP-DATECHK                                      01324900
LRM011               IF (PARM-INTRA-DAY = '1'                           01325000
LRM011               AND NSCCDHDR-SUBMIT-DATE = WS-DATE-MMDDCCYY)       01325100
LRM011               OR (PARM-INTRA-DAY NOT = '1'                       01325200
LRM011               AND NSCCDHDR-SUBMIT-DATE = WS-PRIOR-MMDDCCYY)      01325300
LRM011                 DISPLAY 'PARM BYPASS=1, INPUT FILE DATE OK '     01325400
LRM011                 NSCCDHDR-SUBMIT-DATE ' PROCESS THE FILE'         01325500
LRM011               ELSE                                               01325600
LRM006                  DISPLAY 'CAT784DB: ** WARNING **'               01325700
LRM006                  DISPLAY '  CLIENT FEED (INFILE) DETAILS'        01325800
LRM006                   ' WERE SKIPPED DUE TO PARM'                    01325900
LRM006                  DISPLAY '    INFILE HDR DATE = '                01326000
LRM006                     NSCCDHDR-SUBMIT-DATE                         01326100
LRM006                     '   PROC DATE = ' WS-DATE-MMDDCCYY           01326200
LRM006                  SET  TAXLOT-EOF      TO TRUE                    01326300
LRM011               END-IF                                             01326400
LRM006            ELSE                                                  01326500
LRM006             IF PARM-INTRA-DAY = '1'                              01326600
LRM006             AND NSCCDHDR-SUBMIT-DATE NOT = WS-DATE-MMDDCCYY      01326700
LRM006               MOVE 1720 TO ABEND-CODE                            01326800
LRM006               DISPLAY '** CAT784DB ABENDED ON INFILE HEADER DATE'01326900
LRM006               DISPLAY '  INFILE HDR DATE = ' NSCCDHDR-SUBMIT-DATE01327000
LRM006                        '   PROC DATE = ' WS-DATE-MMDDCCYY        01328000
LRM006               CALL  ABEND          USING ABEND-CODE              01328100
LRM006             ELSE                                                 01328200
LRM006             IF PARM-INTRA-DAY NOT = '1'                          01328300
LRM006             AND NSCCDHDR-SUBMIT-DATE NOT = WS-PRIOR-MMDDCCYY     01328400
LRM006               MOVE 1750 TO ABEND-CODE                            01328500
LRM006               DISPLAY '** CAT784DB ABENDED ON INFILE HEADER DATE'01328600
LRM006               DISPLAY '  EXPECTING PRIOR PROCESSING DATE ON FILE'01328700
LRM006               DISPLAY '  INFILE HDR DATE = ' NSCCDHDR-SUBMIT-DATE01328800
LRM006                    ' PRIOR PROC DATE = ' WS-PRIOR-MMDDCCYY       01328900
LRM007               DISPLAY 'USE PARM BYP1=1 TO GO WITHOUT FILE'       01329000
LRM006               CALL  ABEND          USING ABEND-CODE              01329100
LRM006             END-IF                                               01329200
LRM006            END-IF                                                01329300
LRM011         END-IF                                                   01329400
LRM011         DISPLAY 'AFTER HDR, READ NEXT REC'                       01329500
               PERFORM 2100-READ-TAXLOT-DETAIL-FILE                     01329600
           END-IF.                                                      01329700
                                                                        01329800
           EJECT                                                        01329900
       1100-LOAD-CBRS-BROKER-TABLE.                                     01330000
LRM002     PERFORM UNTIL CBRS-BROKER-EOF                                01330100
LRM002                 OR PRTCP-SUB GREATER 9999                        01330200
LRM002        READ CBRS-PARTICIPANT-FILE                                01330300
LRM002               INTO WS-CBRS-RECORD                                01330400
LRM002           AT END                                                 01330500
LRM002              SET CBRS-BROKER-EOF TO TRUE                         01330600
LRM002           NOT AT END                                             01330700
LRM002              ADD 1 TO WS-CBRS-RECORD-COUNT                       01330800
LRM002              IF WS-CBRS-USER-START-DATE >= WS-TODAY-CCYYMMDD     01330900
LRM002                 ADD 1 TO TAXLOT-COUNT                            01331000
LRM002                 MOVE WS-CBRS-FIRM-ACCOUNT TO                     01331100
LRM002                    WS-CBRS-BROKER(TAXLOT-COUNT)                  01331200
LRM002                 MOVE WS-CBRS-FIRM-TYPE   TO                      01331300
LRM002                    WS-CBRS-BROKER-TYPE(TAXLOT-COUNT)             01331400
LRM002                 MOVE WS-CBRS-USER-NAME TO                        01331500
LRM002                    WS-CBRS-BROKER-NAME(TAXLOT-COUNT)             01331600
LRM002              END-IF                                              01331700
LRM002        END-READ                                                  01331800
LRM002     END-PERFORM.                                                 01331900
LRM002     DISPLAY 'AFTER CBRS READS PRTCP TABLE HAS  ' TAXLOT-COUNT.   01332000
LRM002     IF NOT CBRS-BROKER-EOF                                       01332100
              DISPLAY 'TABLE OVERFLOW ON CBRS BROKER'                   01332200
              MOVE 'NEED TABLE EXPANSION' TO INFSND-MSG                 01332300
              CALL  INFSND  USING INFSND-DATA                           01332400
              DISPLAY 'CAT784DB ABENDS'                                 01332500
              MOVE 1800 TO ABEND-CODE                                   01332600
              CALL  ABEND          USING ABEND-CODE                     01332700
           ELSE                                                         01332800
LRM002        IF TAXLOT-COUNT > 9500                                    01332900
                MOVE 'MAY NEED EXPANSION SOON BROKER' TO INFSND-MSG     01333000
                CALL  INFSND  USING INFSND-DATA                         01333100
           END-IF.                                                      01333200
           EJECT                                                        01333300
       1200-CREATE-HEADER-RECORD.                                       01333400
LRM002     IF PARM-STREAM = 'Q'                                         01333500
              SET NSCCDHDR-VB-COST-BASIS-QA TO TRUE                     01333600
           ELSE                                                         01333700
              SET NSCCDHDR-VB-COST-BASIS    TO TRUE                     01333800
           END-IF.                                                      01333900
           MOVE WS-DATE-MMDDCCYY      TO  NSCCDHDR-SUBMIT-DATE          01334000
           MOVE PARM-STREAM           TO  WS-DESC-STREAM-IND            01334100
                                          WS-ORIGINATOR-STREAM          01334200
                                          NSCCDHDR-STREAM               01334300
           MOVE WS-FILE-DESC          TO  NSCCDHDR-FILE-DESC.           01334400
           MOVE WS-ORIGINATOR         TO  NSCCDHDR-ORIGINATOR.          01334500
LRM002     IF WS-PARM-CLIENT > ZEROS                                    01334600
LRM002        MOVE BH-BROKER-CLEARING-HOUSE(2 : 4)                      01334700
LRM002                   TO NSCCDHDR-SUB-ORIGINATOR                     01334800
LRM002     END-IF                                                       01334900
           SET VARIABLE-LENGTH        TO  TRUE.                         01335000
           MOVE '001'                 TO  NSCCDHDR-MULTI-BATCH-NBR.     01335100
                                                                        01335200
           WRITE TAXLOT-NSCC-HDR-TRL-RECORD FROM NSCC-HDR-RECORD.       01335300
           WRITE TAXLOT-ERROR-RECORD        FROM NSCC-HDR-RECORD.       01335400
                                                                        01335500
           EJECT                                                        01335600
       2000-PROCESS-ROUTINE.                                            01335700
LRM002     IF WS-PARM-CLIENT > ZEROS                                    01335800
LRM002        IF (TAXA-ADP-TAXLOTA-HEADER                               01335900
LRM007        OR TAXA-DETAIL-RECORD(1:3) = 'HDR')                       01336000
LRM002           MOVE SPACES TO TAXA-ADP-RECORD-ID                      01336100
LRM002           MOVE TAXA-DETAIL-RECORD TO NSCC-HDR-RECORD             01336200
LRM002           IF NSCCDHDR-SUBMIT-DATE NOT = WS-DATE-MMDDCCYY         01336300
LRM002              DISPLAY 'CLIENT ' WS-PARM-CLIENT ' FEED FOR CBRS '  01336400
LRM002                      'HEADER DATE ' NSCCDHDR-SUBMIT-DATE         01336500
LRM002                      ' NOT = TODAY ' WS-DATE-MMDDCCYY            01336600
LRM002              DISPLAY 'CALL CLIENT ' WS-PARM-CLIENT               01336700
LRM002              DISPLAY 'CAT784DB ABENDS'                           01336800
LRM002              MOVE 2000 TO ABEND-CODE                             01336900
LRM002              CALL  ABEND          USING ABEND-CODE               01337000
LRM002           END-IF                                                 01337100
LRM002           WRITE TAXLOT-NSCC-HDR-TRL-RECORD FROM NSCC-HDR-RECORD  01337200
LRM002        ELSE                                                      01337300
LRM002        IF (TAXA-RECORD-TYPE = 'E'                                01337400
LRM007        OR TAXA-DETAIL-RECORD(1:3) = 'END')                       01337500
LRM002           SET TRAILER-FOUND TO TRUE                              01337600
LRM002           WRITE TAXLOT-NSCC-HDR-TRL-RECORD FROM                  01337700
LRM002                                      TAXA-DETAIL-RECORD          01337800
LRM002        ELSE                                                      01337900
LRM002           MOVE TAXA-DETAIL-RECORD TO TAXLOT-NSCC-A-RECORD        01338000
LRM002           MOVE SPACES             TO TAXLOT-NSCC-RECORD-SUFFIX   01338100
LRM002           WRITE TAXLOT-NSCC-A-RECORD                             01338200
LRM002           ADD 1 TO WS-NSCC-A-REC-CNTR                            01338300
LRM002        END-IF END-IF                                             01338400
LRM002        GO TO 2000-READ-NEXT                                      01338500
LRM002     END-IF.                                                      01338600
           IF FIRST-TIME                                                01338700
              AND TAXA-RECORD-ID                                        01338800
                SET NOT-FIRST-TIME TO TRUE                              01338900
           ELSE                                                         01339000
LRM999***   IF (NOT TAXA-ACAT-DATA AND TAXA-RECORD-ID)                  01339100
LRM999***      DISPLAY 'NOT ACAT DATA - REC # ' WS-TLE-RECORD-COUNT     01339200
LRM999***      PERFORM 2300-WRITE-NSCC-FEED-RTN                         01339300
LRM999***      SET PASSED-EDIT TO TRUE                                  01339400
LRM999***      MOVE ZERO TO WS-TAXT-TABLE-COUNT                         01339500
LRM999***   ELSE                                                        01339600
             IF (TAXA-RECORD-ID                                         01339700
               OR  TAXLOT-EOF                                           01339800
               OR  TAXA-RECORD-TYPE = 'E')                              01339900
               IF NOT COST-BASIS-ELIGABLE                               01340000
                  ADD 1 WS-TAXT-TABLE-COUNT                             01340100
                        TO WS-COST-BASIS-DROP-COUNT                     01340200
                  MOVE ZERO TO WS-TAXT-TABLE-COUNT                      01340300
               ELSE                                                     01340400
LRM006           MOVE WS-TAXA-ASSET-QUAN-WHOLE   TO WK-TAXA-ASSET-QTY   01340500
LRM006           ADD  WS-TAXA-ASSET-QUAN-FRACTION                       01340600
LRM006                                            TO WK-TAXA-ASSET-QTY  01340700
                 IF (WS-TAXT-TABLE-COUNT > 0                            01340800
LRM006***********AND WS-TAXA-ASSET-QTY-DEC = WS-TOTAL-TAXT-QUANTITY     01340900
LRM006           AND WK-TAXA-ASSET-QTY     = WS-TOTAL-TAXT-QUANTITY     01341000
                 AND WS-TAXA-ASSET-QTY-DEC NOT = ZERO)                  01341100
LRM004           OR WS-TAXA-FIRM-REJECT                                 01341200
LRM004           OR WS-TAXA-REQUEST                                     01341300
                   PERFORM 2300-WRITE-NSCC-FEED-RTN                     01341400
                   SET PASSED-EDIT TO TRUE                              01341500
                   MOVE ZERO TO WS-TAXT-TABLE-COUNT                     01341600
               ELSE                                                     01341700
TEST             DISPLAY 'ERROR FOUND TBL-COUNT =' WS-TAXT-TABLE-COUNT  01341800
TEST              ' TAXA-QTY=' WS-TAXA-ASSET-QTY-DEC                    01341900
TEST              ' TAXT-QTY=' WS-TOTAL-TAXT-QUANTITY                   01342000
TEST             DISPLAY '  REC# ' WS-TLE-TAXA-CURR-REC                 01342100
TEST               ' ' WS-TAXA-CUSIP-NUM ' '  WS-TAXA-SEC-D-1-NEW       01342200
                MOVE WS-TOTAL-TAXT-QUANTITY TO WS-TAXA-CALC-QUANTITY    01342300
                MOVE WS-TAXT-TABLE-COUNT   TO WS-TAXA-CALC-DETAIL-COUNT 01342400
                WRITE TAXLOT-ERROR-RECORD FROM WS-TAXA-DETAIL-RECORD    01342500
                ADD 1 TO WS-ERROR-A-REC-CNTR                            01342600
                         WS-ERROR-REC-CNTR                              01342700
                SET FAILED-EDIT TO TRUE                                 01342800
                MOVE ZERO TO WS-TAXT-TABLE-COUNT                        01342900
LRM999***    END-IF                                                     01343000
LRM999***   END-IF                                                      01344000
           END-IF.                                                      01345000
                                                                        01346000
           IF TAXLOT-EOF                                                01347000
               IF NOT TRAILER-FOUND                                     01348000
                  DISPLAY 'MISSING FILE TRAILER ON TAXLOT INPUT INFILE' 01349000
                  SET TRAILER-FOUND TO TRUE                             01350000
               END-IF                                                   01360000
               GO TO 2000-PROCESS-ROUTINE-EXIT.                         01370000
                                                                        01380000
           IF TAXA-RECORD-TYPE = 'E'                                    01381000
              SET TRAILER-FOUND TO TRUE                                 01382000
           ELSE                                                         01383000
              IF TAXA-RECORD-ID                                         01384000
                 MOVE TAXA-DETAIL-RECORD TO WS-TAXA-DETAIL-RECORD       01385000
                 ADD 1 TO WS-TAXLOT-A-RECS-READ                         01386000
LRM002           MOVE WS-TLE-RECORD-COUNT TO WS-TLE-TAXA-CURR-REC       01387000
                 MOVE ZEROS TO WS-TOTAL-TAXT-QUANTITY                   01388000
                 PERFORM 2050-LOOKUP-COST-BASIS-IND THRU 2050-EXIT      01389000
              ELSE                                                      01390000
              IF TAXT-RECORD-ID                                         01391000
                 ADD 1 TO WS-TAXLOT-T-RECS-READ                         01392000
LRM012           IF WS-TAXT-TABLE-COUNT LESS 5000                       01393000
                    ADD +1 TO WS-TAXT-TABLE-COUNT                       01394000
                    IF TAXT-ISO-CURRENCY = '000'                        01395000
                       MOVE SPACES TO TAXT-ISO-CURRENCY                 01396000
                    END-IF                                              01397000
LRM002              IF TAXT-RCV-TYPE = SPACES                           01398000
LRM002                 MOVE WS-TAXA-RCV-TYPE TO TAXT-RCV-TYPE           01399000
LRM002              END-IF                                              01400000
                    MOVE TAXT-DETAIL-RECORD TO                          01410000
                          WS-TAXT-DETAIL-RECORD(WS-TAXT-TABLE-COUNT)    01420000
                    ADD TAXT-ASSET-QUAN-WHOLE TO                        01430000
                          WS-TOTAL-TAXT-QUANTITY                        01440000
                    ADD TAXT-ASSET-QUAN-FRACTION TO                     01450000
                          WS-TOTAL-TAXT-QUANTITY                        01460000
                 ELSE                                                   01470000
                    DISPLAY 'TABLE OVERFLOW MORE THAN 5000 DETAILS'     01480000
                    MOVE 'NEED TABLE EXPANSION' TO INFSND-MSG           01490000
                    CALL  INFSND  USING INFSND-DATA                     01500000
                    DISPLAY 'CAT784DB ABENDS'                           01510000
                    MOVE 3000 TO ABEND-CODE                             01520000
                    CALL  ABEND          USING ABEND-CODE               01530000
                 END-IF                                                 01540000
              END-IF                                                    01550000
           END-IF.                                                      01560000
                                                                        01570000
LRM012     IF WS-TAXT-TABLE-COUNT > 4500                                01580000
           AND NOT TAXT-OVERFLOW-WARNING                                01590000
              SET TAXT-OVERFLOW-WARNING TO TRUE                         01600000
              MOVE 'MAY NEED EXPANSION SOON TAXT' TO INFSND-MSG         01601000
              CALL  INFSND  USING INFSND-DATA                           01602000
           END-IF.                                                      01603000
                                                                        01604000
           IF  W-COMMIT-CTR > +19                                       01605000
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                   01606000
               MOVE 0 TO W-COMMIT-CTR                                   01607000
           END-IF.                                                      01608000
                                                                        01609000
       2000-READ-NEXT.                                                  01610000
           PERFORM 2100-READ-TAXLOT-DETAIL-FILE.                        01620000
                                                                        01630000
       2000-PROCESS-ROUTINE-EXIT. EXIT.                                 01640000
           EJECT                                                        01650000
       2050-LOOKUP-COST-BASIS-IND.                                      01660000
           SET COST-BASIS-ELIGABLE TO TRUE.                             01670000
   ***** LOOKUP ADP (DLVR BRKR) IS COST BASIS ELIGIBLE AT NSCC          01680000
           PERFORM VARYING PRTCP-SUB FROM 1 BY 1                        01690000
               UNTIL PRTCP-SUB > TAXLOT-COUNT                           01700000
             OR TAXA-SUBMITTING-BRKR = WS-CBRS-BROKER(PRTCP-SUB)        01701000
           END-PERFORM.                                                 01702000
                                                                        01703000
           IF PRTCP-SUB > TAXLOT-COUNT                                  01704000
TEST          DISPLAY 'DLVR NBR NON CBRS ' TAXA-SUBMITTING-BRKR         01705000
TEST             ' REC# ' WS-TLE-RECORD-COUNT                           01706000
              MOVE 'N' TO COST-BASIS-ELIGABLE-SW                        01707000
              GO TO 2050-EXIT                                           01708000
           END-IF.                                                      01709000
                                                                        01710000
   ***** LOOKUP CONTRA (RCVR BRKR) IS COST BASIS ELIGIBLE AT NSCC       01720000
           PERFORM VARYING PRTCP-SUB FROM 1 BY 1                        01730000
               UNTIL PRTCP-SUB > TAXLOT-COUNT                           01740000
             OR TAXA-RCV-NBR = WS-CBRS-BROKER(PRTCP-SUB)                01750000
           END-PERFORM.                                                 01760000
                                                                        01770000
           IF PRTCP-SUB > TAXLOT-COUNT                                  01780000
TEST          DISPLAY 'RCVR NBR ' TAXA-RCV-NBR ' NON CBRS'              01790000
TEST             ' REC# ' WS-TLE-RECORD-COUNT                           01800000
              MOVE 'N' TO COST-BASIS-ELIGABLE-SW                        01810000
              GO TO 2050-EXIT                                           01820000
           END-IF.                                                      01830000
LRM002     IF WS-TAXA-RCV-TYPE = SPACES                                 01840000
LRM002        MOVE WS-CBRS-BROKER-TYPE(PRTCP-SUB) TO WS-TAXA-RCV-TYPE   01850000
LRM002     END-IF.                                                      01860000
       2050-EXIT. EXIT.                                                 01870000
                                                                        01880000
       2100-READ-TAXLOT-DETAIL-FILE.                                    01890000
           READ TAXLOT-DETAIL-FILE                                      01900000
              AT END SET TAXLOT-EOF TO TRUE                             01910000
LRM002        NOT AT END ADD 1 TO WS-TLE-RECORD-COUNT                   01911000
LRM002     END-READ.                                                    01912000
                                                                        01913000
       2300-WRITE-NSCC-FEED-RTN.                                        01914000
LRM002     MOVE SPACES TO WS-TAXA-ADP-RECORD-SUFFIX                     01915000
                          WS-TAXA-ADP-RECORD-ID.                        01916000
           WRITE TAXLOT-NSCC-A-RECORD FROM WS-TAXA-DETAIL-RECORD.       01917000
           ADD 1 TO WS-NSCC-A-REC-CNTR.                                 01918000
                                                                        01918100
           PERFORM VARYING SUB FROM 1 BY 1                              01918200
                   UNTIL SUB > WS-TAXT-TABLE-COUNT                      01918300
              MOVE WS-TAXT-DETAIL-RECORD(SUB) TO TAXLOT-NSCC-T-RECORD   01918400
              WRITE TAXLOT-NSCC-T-RECORD                                01918500
              ADD 1 TO WS-NSCC-T-REC-CNTR                               01918600
           END-PERFORM.                                                 01918700
                                                                        01918800
       2400-CREATE-TRAILER.                                             01918900
           IF PARM-STREAM = 'Q'                                         01919000
              SET NSCCDTRL-VB-COST-BASIS-QA TO TRUE                     01919100
           ELSE                                                         01919200
              SET NSCCDTRL-VB-COST-BASIS    TO TRUE                     01919300
           END-IF.                                                      01919400
LRM002     IF WS-PARM-CLIENT > ZEROS                                    01919500
LRM002        MOVE BH-BROKER-CLEARING-HOUSE(2 : 4)                      01919600
LRM002                   TO NSCCDHDR-SUB-ORIGINATOR                     01919700
LRM002     END-IF                                                       01919800
           MOVE WS-ORIGINATOR         TO  NSCCDTRL-ORIGINATOR.          01919900
           ADD WS-NSCC-A-REC-CNTR                                       01920000
               WS-NSCC-T-REC-CNTR                                       01930000
                        GIVING NSCCDTRL-REC-COUNT                       01940000
           WRITE TAXLOT-NSCC-HDR-TRL-RECORD FROM NSCC-TRL-RECORD.       01950000
           MOVE WS-ERROR-REC-CNTR     TO  NSCCDTRL-REC-COUNT.           01960000
           WRITE TAXLOT-ERROR-RECORD        FROM NSCC-TRL-RECORD.       01960100
                                                                        01960200
           EJECT                                                        01960300
       8100-SQL-COMMIT.                                                 01960400
                                                                        01960500
           EXEC SQL COMMIT                                              01960600
           END-EXEC                                                     01960700
                                                                        01960800
           MOVE SQLCA   TO COMMIT-SQLCA                                 01960900
           MOVE SQLCODE TO COMMIT-RETURN                                01961000
                                                                        01962000
           IF  COMMIT-AB                                                01962100
               DISPLAY 'DB2 ERROR ON COMMIT'                            01962200
               PERFORM 8500-SQL-ERROR-ROUTINE                           01962300
           END-IF.                                                      01962400
       8100-EXIT. EXIT.                                                 01962500
                                                                        01962600
       8200-SQL-ROLLBACK.                                               01962700
                                                                        01962800
           EXEC SQL ROLLBACK WORK                                       01962900
           END-EXEC                                                     01963000
                                                                        01964000
           MOVE SQLCA   TO ROLLBACK-SQLCA                               01965000
           MOVE SQLCODE TO ROLLBACK-RETURN                              01966000
                                                                        01967000
           IF ROLLBACK-AB                                               01967100
               DISPLAY 'CAT784DB: '                                     01967200
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '           01967300
                   ROLLBACK-RETURN                                      01967400
           ELSE                                                         01967500
               DISPLAY 'CAT784DB: '                                     01967600
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '       01967700
                   ROLLBACK-RETURN                                      01967800
           END-IF.                                                      01967900
       8200-EXIT. EXIT.                                                 01968000
                                                                        01969000
       8500-SQL-ERROR-ROUTINE.                                          01970000
                                                                        01980000
           MOVE SQLCODE TO W-DB2-SQLCODE.                               01990000
           DISPLAY 'CAT784DB SQL RETURN CODE ' W-DB2-SQLCODE.           02000000
                                                                        02010000
           CALL DSNTIAR               USING  SQLCA                      02020000
                                             WS-DB2-MESSAGE-AREA        02030000
                                             WS-ERR-LINE-LEN            02040000
                                                                        02050000
           DISPLAY ' '                                                  02060000
                                                                        02070000
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   02080000
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      02090000
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              02100000
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        02110000
                 END-IF                                                 02120000
           END-PERFORM                                                  02130000
           DISPLAY ' '                                                  02140000
           DISPLAY ' *** CAT784DB ABENDED ****'                         02150000
           DISPLAY ' '                                                  02160000
                                                                        02170000
           PERFORM 8200-SQL-ROLLBACK THRU 8200-EXIT                     02180000
                                                                        02190000
           DISPLAY 'CAT784DB: U3999 - ABENDING ON BAD DB2 STATUS'       02200000
           DISPLAY 'CAT784DB: PROGRAM ENDED ABNORMALLY'                 02210000
           MOVE +3999    TO ABEND-CODE                                  02220000
           CALL ABEND USING ABEND-CODE.                                 02230000
      ****************                                                  02240000
       9999-ENDJOB-ROUTINE.                                             02250000
      ****************                                                  02260000
                                                                        02270000
LRM002     IF WS-PARM-CLIENT NOT > ZEROS                                02280000
LRM002     OR (WS-PARM-CLIENT > ZEROS                                   02290000
LRM002     AND NOT TRAILER-FOUND)                                       02300000
              PERFORM 2400-CREATE-TRAILER.                              02310000
                                                                        02320000
           CLOSE  TAXLOT-DETAIL-FILE.                                   02330000
           CLOSE  TAXLOT-NSCC-FEED.                                     02340000
           CLOSE  TAXLOT-ERROR-FILE.                                    02350000
                                                                        02360000
           DISPLAY ' '                                                  02370000
           DISPLAY '   -----------------'                               02380000
           DISPLAY 'TLE ASSET HEADERS READ ' WS-TAXLOT-A-RECS-READ      02390000
           DISPLAY 'TLE DETAILS READ       ' WS-TAXLOT-T-RECS-READ      02400000
           DISPLAY ' '                                                  02410000
           DISPLAY 'ASSET HEADERS TO NSCC  ' WS-NSCC-A-REC-CNTR         02420000
           DISPLAY 'TLE DETAILS TO NSCC    ' WS-NSCC-T-REC-CNTR         02430000
           DISPLAY ' '                                                  02440000
           DISPLAY 'ERROR RECORDS WRITTEN  ' WS-ERROR-A-REC-CNTR        02450000
           DISPLAY 'NON COST-BASIS DROPPED ' WS-COST-BASIS-DROP-COUNT   02460000
                                                                        02470000
           DISPLAY ' '                                                  02480000
           DISPLAY '***************************'                        02490000
           DISPLAY '* END OF CAT784DB PROGRAM *'                        02500000
           DISPLAY '***************************'                        02510000
           DISPLAY ' '.                                                 02520000
                                                                        02530000
