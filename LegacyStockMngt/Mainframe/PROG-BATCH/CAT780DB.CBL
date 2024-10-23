000001* PDX    - CAT780DB C0353123 03/24/14 13:55:35 TBLAMUR            00001000
LRM011* SSR 96502 RECOMPILE FOR CBRS004.13 ACATTAXA.                    00001101
000001* PDX    - CAT780DB C0348882 12/06/13 06:51:17 TBCHKOP            00001200
CSG001* SSR 91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.                 00001300
000001* PDX    - CAT780DB C0325133 05/22/12 14:29:04 TBLAMUR            00001400
LRM010* SSR 83556 RECOMPILE FOR CBRS002.12 TO MOVE ASSET SEQ NUMBER     00001500
000001* PDX    - CAT780DB C0324918 04/17/12 14:56:36 TBLAMUR            00001600
LRM009* SSR 83069 QA/PSE TO RUN ON CURRENT DATE.                        00001700
000001* PDX    - CAT780DB C0322389 02/03/12 11:08:55 TBLAMUR            00001800
LRM008* CONTRA TABLE EXPANSION (SIAC1666).                              00001900
000001* PDX    - CAT780DB C0320051 12/08/11 17:15:46 TBLAMUR            00002000
LRM007* SSR 78938 ADDITIONAL CHANGE, USE CATS FOLLOWED BY FUND ACCOUNT  00002100
LRM007*  NUMBER WHEN CREATING PTF.                                      00002200
000001* PDX    - CAT780DB C0313692 08/23/11 08:50:54 TBLAMUR            00002300
LRM006* ADD SSR 78938 REGULATORY FILE CHANGES TO CBRS.  FOR PTF, USE    00002400
LRM006*  TRANS CODE 51 AND HARD CODE MFNM IN PRICE CATEGORY.            00002500
000001* PDX    - CAT780DB C0305258 12/13/10 08:10:37 TBLAMUR            00002600
LRM005* ADD SSR 71989 TARP.  ADD FRV                                    00002700
000001* PDX    - CAT780DB C0299503 12/08/10 15:32:23 TBLAMUR            00002800
LRM004* SSR 72210 REG CHANGE A #6988 RECORD EXPANSION.                  00002900
LRM004*  REMOVE HISTORY EXTRACT FEATURE OF REPEATING REQUEST EXTRACT    00003000
LRM004*  RECORDS FOR 10 DAYS.  LOOKUP CONTRA RCV FIRM TYPE ON CBRS      00003100
LRM004*  PARTICIPANT FILE TO DEFAULT FOR TLE.                           00003200
LRM004*  ADD DATE CHECK AND BYPASS PARM FOR CBRS PRTCP FILE SIAC1666.   00003300
LRM004* REMOVE SSR 71989 TARP.  ADD FRV                                 00003400
000001* PDX    - CAT780DB C0302345 10/05/10 15:54:57 TBLAMUR            00003500
LRM003* CORRECTION TO ONLY PASS DST= ON RCL TO TLE.                     00003600
000001* PDX    - CAT780DB C0290502 02/04/10 10:58:46 TBLAMUR            00003700
LRM003* SSR 59603 OPTION SYMB; REMOVE HARDCODE Q STREAM                 00003800
000001* PDX    - CAT780DB C0286877 10/15/09 14:42:30 TBLAMUR            00003900
LRM002* SSR 61023 OPTION SYMBOLOGY CHANGE FOR Q STREAM ONLY, USE        00004000
LRM002*   NEW FILE FORMAT.                                              00004100
000001* PDX    - CAT780DB C0235181 05/22/06 16:16:25 TBLAMUR            00004200
LRM001* SSR 47491 RECLAIMS (RCL)S ARE BEING REQUESTED FOR THE RECEIVER  00004300
000001* PDX    - CAT780DB C0185363 03/05/04 11:56:14 TBLAMUR            00004400
       IDENTIFICATION DIVISION.                                         00004500
       PROGRAM-ID.  CAT780DB.                                           00004600
       AUTHOR.      LARRY MUREY.                                        00005000
       DATE-WRITTEN.  JAN 2003.                                         00006000
                                                                        00007000
      *---------------------------------------------------------------- 00008000
      * THE PURPOSE OF THIS PROGRAM IS TO PRODUCE THE TAX LOT EXTRACT   00009000
      * FROM DB2 TABLES ACTIVE TRANSFERS AND ASSETS (VTRNFR AND VASSET).00010000
      * THIS FILE CONTAINS ASSETS BOOKING TODAY                         00020000
      * ONLY CLIENTS HAVING B1 434681 NOT = 0 ARE EXTRACTED.            00030000
      *                                                                 00040000
      * THIS IS A NON-UPDATING PROGRAM AND MAY BE RERUN.                00050000
      *---------------------------------------------------------------- 00060000
           EJECT                                                        00070000
      ***************************************************************** 00080000
       ENVIRONMENT DIVISION.                                            00090000
      ***************************************************************** 00100000
       INPUT-OUTPUT SECTION.                                            00110000
       FILE-CONTROL.                                                    00120000
                                                                        00130000
           SELECT CBRS-PARTICIPANT-FILE         ASSIGN TO CBRSBRKR.     00140000
           SELECT TAXLOT-FILE                   ASSIGN TO ACATTAXA.     00150000
                                                                        00160000
      ***************************************************************** 00170000
       DATA DIVISION.                                                   00180000
      ***************************************************************** 00190000
                                                                        00200000
       FILE SECTION.                                                    00210000
                                                                        00220000
       FD  CBRS-PARTICIPANT-FILE                                        00230000
           RECORDING MODE F                                             00240000
           BLOCK CONTAINS 0 RECORDS                                     00250000
           LABEL RECORDS ARE STANDARD                                   00260000
           RECORD CONTAINS 200 CHARACTERS.                              00270000
                                                                        00280000
       01  PRTCP-RECORD                PIC X(200).                      00290000
                                                                        00300000
       FD  TAXLOT-FILE                                                  00310000
           RECORDING MODE IS F                                          00320000
           BLOCK CONTAINS 0 RECORDS.                                    00330000
       01  TAXLOT-RECORD                 PIC X(1000).                   00340000
                                                                        00350000
           EJECT                                                        00360000
      ******************************************************************00370000
       WORKING-STORAGE SECTION.                                         00380000
      ******************************************************************00390000
                                                                        00400000
       77  ABEND-CODE              COMP  PIC S9(4)   VALUE +9999.       00410000
                                                                        00420000
       77  WS-TRADE-PLUS-1                  PIC X(08)  VALUE ' '.       00430000
                                                                        00440000
       77  WS-SETTL-DATE                    PIC X(10).                  00450000
                                                                        00460000
       77  WS-TOTAL-TI-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00470000
       77  WS-TOTAL-AT-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00480000
       77  WS-TOTAL-OP-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00490000
       77  WS-TOTAL-OP-NOT-FND   COMP-3  PIC  9(09)  VALUE ZEROES.      00500000
LRM006 77  WS-TOTAL-FS-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00510000
LRM006 77  WS-TOTAL-FS-NOT-FND   COMP-3  PIC  9(09)  VALUE ZEROES.      00520000
       77  WS-ASSET-QUAN-V9      COMP-3  PIC  9(12)V9(5).               00530000
       77  WS-TAXLOT-REC-CNTR    COMP-3  PIC  9(09)  VALUE ZEROES.      00540000
       77  WS-STREAM                     PIC X.                         00550000
       77  WS-PROCESS-CLIENT             PIC X(04).                     00560000
                                                                        00570000
       77  CBRS-PRTPC-EOF-SW             PIC X(01)  VALUE 'N'.          00580000
           88  CBRS-PRTPC-EOF                       VALUE 'Y'.          00590000
                                                                        00600000
       77  WS-PROCESS-MODE               PIC X(01)  VALUE 'N'.          00610000
           88  HISTORY-MODE                         VALUE 'Y'.          00620000
                                                                        00630000
       77  TLE-ELIGIBLE-SW               PIC X(01)  VALUE 'N'.          00640000
           88  TLE-NOT-ELIGIBLE                     VALUE 'N'.          00650000
           88  TLE-ELIGIBLE                         VALUE 'Y'.          00660000
                                                                        00670000
       01  HOLD-RCV-NBR.                                                00680000
           03  FILLER                      PIC X(4)   VALUE '0000'.     00690000
           03  H-RCV-NBR                   PIC X(4).                    00700000
       01  HOLD-RCV-NBR2 REDEFINES HOLD-RCV-NBR   PIC X(8).             00710000
                                                                        00720000
       01  HOLD-SUBMITTING-BRKR.                                        00730000
           03  FILLER                      PIC X(4)   VALUE '0000'.     00740000
           03  H-SUBMITTING-BRKR           PIC X(4).                    00750000
       01  HOLD-SUBMITTING-BRKR2 REDEFINES                              00760000
           HOLD-SUBMITTING-BRKR            PIC X(8).                    00770000
                                                                        00780000
       01  DATE-WORK-AREA.                                              00790000
           03  WS-NON-STANDARD-DATE        PIC X(10).                   00800000
           03  WS-FUL-STTLM-DATE           PIC X(10).                   00810000
           03  WS-END-STTLM-DATE           PIC X(10).                   00820000
                                                                        00830000
       01  WS-DATE-MMDDCCYY.                                            00840000
           05  WS-DATE-MM                  PIC  X(02).                  00850000
           05  WS-DATE-DD                  PIC  X(02).                  00860000
           05  WS-DATE-CC                  PIC  X(02).                  00870000
           05  WS-DATE-YY                  PIC  X(02).                  00880000
                                                                        00890000
       01  WS-BPD-PROC-DATE                 PIC X(08)  VALUE ' '.       00900000
       01  FILLER REDEFINES WS-BPD-PROC-DATE.                           00910000
           05  WS-BPD-CC                 PIC  X(02).                    00920000
           05  WS-BPD-YY                 PIC  X(02).                    00930000
           05  WS-BPD-MM                 PIC  X(02).                    00940000
           05  WS-BPD-DD                 PIC  X(02).                    00950000
                                                                        00960000
       01  WS-SETTLEMENT-PERIOD-DATE.                                   00970000
           05  WS-AGED-DATE-CCYYMMDD.                                   00980000
               07  WS-DATENEW-CALC-CC  PIC XX.                          00990000
               07  WS-DATENEW-CALC-YY  PIC XX.                          01000000
               07  WS-DATENEW-CALC-MM  PIC XX.                          01010000
               07  WS-DATENEW-CALC-DD  PIC XX.                          01020000
           05  WS-AGED-DATE-CCYYMMDD-NUM REDEFINES                      01030000
               WS-AGED-DATE-CCYYMMDD   PIC 9(08).                       01040000
                                                                        01050000
       01  WS-FILE-DESC.                                                01060000
           05  FILLER                    PIC  X(03)  VALUE 'ADP'.       01070000
           05  WS-DESC-STREAM-IND        PIC  X(01)  VALUE ' '.         01080000
           05  FILLER                    PIC  X(16)                     01090000
               VALUE ' NSCC INPUT FILE'.                                01100000
                                                                        01110000
       01  WS-ORIGINATOR.                                               01120000
           05  FILLER                   PIC  X(03)  VALUE 'ADP'.        01130000
           05  WS-ORIGINATOR-STREAM     PIC  X(01)  VALUE 'Z'.          01140000
                                                                        01150000
           EJECT                                                        01160000
           COPY ACATTAXH.                                               01170000
           EJECT                                                        01180000
       COPY CBRSPPIO  REPLACING ==:CBRS:== BY ==CBRS==.                 01190000
                                                                        01200000
       01  WS-CBRS-PRTCP-TABLE.                                         01210000
           03  WS-CBRS-PRTCP-RECORD-COUNT  PIC S9(4) COMP VALUE ZERO.   01220000
           03  TAXLOT-COUNT                PIC S9(9) COMP VALUE ZERO.   01230000
           03  PRTCP-SUB                   PIC S9(9) COMP VALUE ZERO.   01240000
           03  HOLD-RCV-TYPE               PIC X(06)  VALUE SPACES.     01250000
           03  WS-CBRS-PRTCP-RECORD OCCURS 10000 TIMES.                 01260000
               05  WS-CBRS-PRTCP-BROKER      PIC X(08).                 01270000
               05  WS-CBRS-PRTCP-BROKER-TYPE PIC X(06).                 01280000
                                                                        01290000
           EJECT                                                        01300000
       COPY ACATTAXA  REPLACING ==:TAXA:== BY ==TAXA==.                 01310000
           EJECT                                                        01320000
           COPY BPDATESC.                                               01330000
                                                                        01340000
       01  INFSND-DATA.                                                 01350000
           05 FILLER PIC X(8) VALUE 'CAT780DB'.                         01360000
           05 INFSND-MSG PIC X(45) VALUE SPACES.                        01370000
                                                                        01380000
           EJECT                                                        01390000
       01  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.    01400000
       01  WS-DB2-MESSAGE-AREA.                                         01410000
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.    01420000
           05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES     01430000
               INDEXED BY WS-ERROR-INDEX.                               01440000
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.     01450000
                                                                        01460000
           EJECT                                                        01470000
      *DB2 COMMUNICATION AREA                                           01480000
           EXEC SQL                                                     01490000
              INCLUDE SQLCA                                             01500000
           END-EXEC.                                                    01510000
                                                                        01520000
           EJECT                                                        01530000
           EXEC SQL                                                     01540000
              INCLUDE VTRNFR                                            01550000
           END-EXEC.                                                    01560000
                                                                        01570000
           EJECT                                                        01580000
           EXEC SQL                                                     01590000
              INCLUDE VASSET                                            01600000
           END-EXEC.                                                    01610000
                                                                        01620000
           EJECT                                                        01630000
           EXEC SQL                                                     01640000
              INCLUDE VTRNHSTY                                          01650000
           END-EXEC.                                                    01660000
                                                                        01670000
           EJECT                                                        01680000
           EXEC SQL                                                     01690000
              INCLUDE VASTHSTY                                          01700000
           END-EXEC.                                                    01710000
                                                                        01720000
           EJECT                                                        01730000
           EXEC SQL                                                     01740000
              INCLUDE VOPTN                                             01750000
           END-EXEC.                                                    01760000
                                                                        01770000
           EXEC SQL                                                     01780000
              INCLUDE VOPTHSTY                                          01790000
           END-EXEC.                                                    01800000
                                                                        01810000
           EXEC SQL                                                     01820000
              INCLUDE VFNDSRVS                                          01830000
           END-EXEC.                                                    01840000
                                                                        01850000
      *DECLARE CURSOR TO OBTAIN ALL TI RECORDS THAT ARE IN              01860000
      *SETTLE PREP OR SETTLE CLOSE STATUS.                              01861000
           EXEC SQL                                                     01862000
              DECLARE NSCC_TI_CRSR CURSOR FOR                           01863000
                 SELECT                                                 01864000
                    CLIENT_NBR,                                         01865000
                    ACAT_CONTROL_NBR,                                   01866000
                    RCV_NBR,                                            01867000
                    ACCT_RCV_NBR,                                       01868000
                    DLVR_NBR,                                           01869000
                    ACCT_DLVR_NBR,                                      01870000
                    STTS_CD,                                            01880000
                    DAYS_STTS_QTY,                                      01890000
                    TRNFR_TYPE_CD,                                      01900000
                    DSTBN_SIDE_CD,                                      01910000
                    SBMTG_PRTCP_NBR,                                    01920000
                    RCV_CUST_NM,                                        01930000
                    RCV_ACCT_TYPE_CD,                                   01940000
                    STTLM_DT,                                           01950000
                    PRCS_DT,                                            01960000
                    PRTCP_CONTRA_CD,                                    01970000
LRM004              GIFT_IND                                            01980000
                 FROM VTRNFR                                            01990000
                 WHERE   STTS_CD IN ('300', '310')                      02000000
LRM005           AND NOT TRNFR_TYPE_CD = 'MFC'                          02010000
               WITH UR                                                  02020000
           END-EXEC.                                                    02030000
LRM005******     AND NOT TRNFR_TYPE_CD IN ('FRV', 'MFC')                02040000
LRM001******     AND DSTBN_SIDE_CD = 'D'                                02050000
                                                                        02060000
      * DECLARE CURSOR TO OBTAIN ALL AT RECORDS FOR THIS CONTROL NBR    02070000
           EXEC SQL                                                     02080000
              DECLARE NSCC_AT1_CRSR CURSOR FOR                          02090000
                 SELECT                                                 02100000
                    CLIENT_NBR,                                         02110000
                    ACAT_CONTROL_NBR,                                   02120000
                    ASSET_SEQ_NBR,                                      02130000
                    TRANS_TYPE_CD,                                      02140000
                    SBMTG_PRTCP_NBR,                                    02150000
                    TRANS_RFRN_ID_CD,                                   02160000
                    ASSET_PRC_CTGY_CD,                                  02170000
                    OPTN_CTGY_CD,                                       02180000
                    STTLM_LCTN_CD,                                      02190000
                    STTLM_RSN_CD,                                       02200000
                    ISIN_CNTRY_CD,                                      02210000
                    ISIN_SEC_ISSUE_CD,                                  02220000
                    ISIN_SEC_CDG_CD,                                    02230000
                    ASSET_DESC_TXT,                                     02240000
                    ASSET_RQST_QTY_CD,                                  02250000
                    AST_RQST_TRANS_CD,                                  02260000
                    ASSET_QTY,                                          02270000
                    PSTN_CD,                                            02280000
                    ISO_CRNCY_CD,                                       02290000
                    ASSET_AMT,                                          02300000
                    CSH_MGN_SHRT_CD,                                    02310000
                    WHI_CD,                                             02320000
                    TRNFR_TYPE_RSN_CD,                                  02330000
                    SECURITY_ADP_NBR,                                   02340000
                    PRGM_NM,                                            02350000
                    UPDT_TMSTP                                          02360000
                 FROM VASSET                                            02370000
                 WHERE CLIENT_NBR   = :DCLVTRNFR.CLIENT-NBR             02380000
                 AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR    02390000
                 AND NOT STTLM_LCTN_CD IN ('30', '40', '45')            02400000
               WITH UR                                                  02410000
           END-EXEC.                                                    02420000
                                                                        02430000
      *DECLARE CURSOR TO OBTAIN ALL HISTORY TI RECORDS THAT ARE IN      02440000
      * SETTLE CLOSE STATUS WITH SETTLE DATE IN 10 DAY RANGE FOR        02450000
      * SPECIFIED CLIENT.                                               02460000
           EXEC SQL                                                     02470000
              DECLARE NSCC_TIHSTY_CRSR CURSOR FOR                       02480000
                 SELECT                                                 02490000
                    CLIENT_NBR,                                         02500000
                    ACAT_CONTROL_NBR,                                   02510000
                    RCV_NBR,                                            02520000
                    ACCT_RCV_NBR,                                       02530000
                    DLVR_NBR,                                           02540000
                    ACCT_DLVR_NBR,                                      02550000
                    STTS_CD,                                            02560000
                    DAYS_STTS_QTY,                                      02570000
                    TRNFR_TYPE_CD,                                      02580000
                    DSTBN_SIDE_CD,                                      02590000
                    SBMTG_PRTCP_NBR,                                    02600000
                    RCV_CUST_NM,                                        02610000
                    RCV_ACCT_TYPE_CD,                                   02620000
                    STTLM_DT,                                           02630000
                    PRCS_DT,                                            02640000
                    PRTCP_CONTRA_CD,                                    02650000
LRM004              GIFT_IND                                            02660000
                 FROM VTRNHSTY                                          02670000
                 WHERE CLIENT_NBR = :WS-PROCESS-CLIENT                  02680000
                 AND   STTS_CD = '310'                                  02690000
LRM005           AND NOT TRNFR_TYPE_CD = 'MFC'                          02700000
                 AND STTLM_DT > :WS-END-STTLM-DATE                      02710000
               WITH UR                                                  02720000
           END-EXEC.                                                    02730000
LRM005*****      AND NOT TRNFR_TYPE_CD IN ('FRV', 'MFC')                02740000
LRM001*****      AND DSTBN_SIDE_CD = 'D'                                02750000
                                                                        02760000
      * DECLARE CURSOR TO OBTAIN ALL HISTORY AT RECORDS FOR THIS        02770000
      * CONTROL NUMBER                                                  02780000
           EXEC SQL                                                     02790000
              DECLARE NSCC_ATHSTY_CRSR CURSOR FOR                       02800000
                 SELECT                                                 02810000
                    CLIENT_NBR,                                         02820000
                    ACAT_CONTROL_NBR,                                   02830000
                    ASSET_SEQ_NBR,                                      02840000
                    TRANS_TYPE_CD,                                      02850000
                    SBMTG_PRTCP_NBR,                                    02860000
                    TRANS_RFRN_ID_CD,                                   02870000
                    ASSET_PRC_CTGY_CD,                                  02880000
                    OPTN_CTGY_CD,                                       02890000
                    STTLM_LCTN_CD,                                      02900000
                    STTLM_RSN_CD,                                       02910000
                    ISIN_CNTRY_CD,                                      02920000
                    ISIN_SEC_ISSUE_CD,                                  02930000
                    ISIN_SEC_CDG_CD,                                    02940000
                    ASSET_DESC_TXT,                                     02950000
                    ASSET_RQST_QTY_CD,                                  02960000
                    AST_RQST_TRANS_CD,                                  02970000
                    ASSET_QTY,                                          02980000
                    PSTN_CD,                                            02990000
                    ISO_CRNCY_CD,                                       03000000
                    ASSET_AMT,                                          03010000
                    CSH_MGN_SHRT_CD,                                    03020000
                    WHI_CD,                                             03030000
                    TRNFR_TYPE_RSN_CD,                                  03040000
                    SECURITY_ADP_NBR,                                   03050000
                    PRGM_NM,                                            03060000
                    UPDT_TMSTP                                          03070000
                 FROM VASTHSTY                                          03080000
                 WHERE CLIENT_NBR   = :WS-PROCESS-CLIENT                03090000
                 AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR    03100000
                 AND NOT STTLM_LCTN_CD IN ('30', '40', '45')            03110000
               WITH UR                                                  03120000
           END-EXEC.                                                    03130000
                                                                        03140000
           EJECT                                                        03150000
           COPY BHINFO.                                                 03160000
                                                                        03170000
           COPY BHACAT.                                                 03180000
                                                                        03190000
       01  B1-SUB               PIC 9(4) VALUE ZEROS.                   03200000
       01  B1-TABLE.                                                    03210000
           05  B1-TABLE-ENTRY OCCURS 500 TIMES.                         03220000
               07  B1-STREAM                     PIC X.                 03230000
               07  B1-ACAT-COST-BASIS-CLIENT     PIC X.                 03240000
                                                                        03250000
           COPY STUBCPY.                                                03260000
                                                                        03270000
           EJECT                                                        03280000
      ***************************************************************** 03290000
       LINKAGE SECTION.                                                 03300000
      ***************************************************************** 03310000
       01  PARM-AREA.                                                   03320000
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.        03330000
           05  PARM-INFO.                                               03340000
               10  PARM-STREAM              PIC X(01).                  03350000
LRM004         10  L-BYP-DATECHK-SW         PIC  X(001).                03360000
LRM004            88  L-BYP-DATECHK                      VALUE '1'.     03370000
                                                                        03380000
           EJECT                                                        03390000
       PROCEDURE DIVISION USING PARM-AREA.                              03400000
           DISPLAY 'CAT780DB - EXTRACT SETTLING ASSETS FOR TAX LOT'.    03410000
           DISPLAY ' STREAM=' PARM-STREAM.                              03420000
           COPY MSGCOBO.                                                03430000
                                                                        03440000
           PERFORM INITIAL-ROUTINE.                                     03450000
                                                                        03460000
           PERFORM PROCESS-ROUTINE.                                     03470000
                                                                        03480000
           PERFORM ENDJOB-ROUTINE.                                      03490000
                                                                        03500000
           GOBACK.                                                      03510000
                                                                        03520000
           EJECT                                                        03530000
       PROCESS-ROUTINE.                                                 03540000
                                                                        03550000
           EXEC SQL OPEN NSCC_TI_CRSR END-EXEC                          03560000
           IF SQLCODE NOT = +0                                          03570000
              MOVE 2400 TO ABEND-CODE                                   03580000
              PERFORM SQL-ERROR-ROUTINE                                 03590000
           END-IF.                                                      03600000
                                                                        03610000
           PERFORM UNTIL SQLCODE NOT = +0                               03620000
              EXEC SQL                                                  03630000
               FETCH NSCC_TI_CRSR                                       03640000
                  INTO                                                  03650000
                   :DCLVTRNFR.CLIENT-NBR                                03660000
                  ,:DCLVTRNFR.ACAT-CONTROL-NBR                          03670000
                  ,:DCLVTRNFR.RCV-NBR                                   03680000
                  ,:DCLVTRNFR.ACCT-RCV-NBR                              03690000
                  ,:DCLVTRNFR.DLVR-NBR                                  03700000
                  ,:DCLVTRNFR.ACCT-DLVR-NBR                             03710000
                  ,:DCLVTRNFR.STTS-CD                                   03720000
                  ,:DCLVTRNFR.DAYS-STTS-QTY                             03730000
                  ,:DCLVTRNFR.TRNFR-TYPE-CD                             03740000
                  ,:DCLVTRNFR.DSTBN-SIDE-CD                             03750000
                  ,:DCLVTRNFR.SBMTG-PRTCP-NBR                           03760000
                  ,:DCLVTRNFR.RCV-CUST-NM                               03770000
                  ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                          03780000
                  ,:DCLVTRNFR.STTLM-DT                                  03790000
                  ,:DCLVTRNFR.PRCS-DT                                   03800000
                  ,:DCLVTRNFR.PRTCP-CONTRA-CD                           03810000
LRM004            ,:DCLVTRNFR.GIFT-IND                                  03820000
              END-EXEC                                                  03830000
                                                                        03840000
              EVALUATE SQLCODE                                          03850000
                 WHEN +100                                              03860000
                    CONTINUE                                            03870000
                 WHEN +0                                                03880000
                    PERFORM CHECK-TLE-ELIGIBLE                          03890000
                       THRU CHECK-TLE-ELIGIBLE-EXIT                     03900000
                    IF TLE-ELIGIBLE                                     03910000
                        ADD 1 TO WS-TOTAL-TI-REC-CNTR                   03920000
                        PERFORM FETCH-AT-RECORDS                        03930000
                    END-IF                                              03940000
                 WHEN OTHER                                             03950000
                    MOVE 2500 TO ABEND-CODE                             03960000
                    PERFORM SQL-ERROR-ROUTINE                           03970000
              END-EVALUATE                                              03980000
           END-PERFORM.                                                 03990000
                                                                        04000000
           IF SQLCODE NOT = +100                                        04010000
              MOVE 2800 TO ABEND-CODE                                   04020000
              PERFORM SQL-ERROR-ROUTINE                                 04030000
           END-IF                                                       04040000
                                                                        04050000
           EXEC SQL                                                     04060000
              CLOSE NSCC_TI_CRSR                                        04070000
           END-EXEC                                                     04080000
                                                                        04090000
           IF SQLCODE NOT = +0                                          04100000
              MOVE 3200 TO ABEND-CODE                                   04110000
              PERFORM SQL-ERROR-ROUTINE                                 04120000
           ELSE                                                         04130000
              MOVE +0                       TO  SQLCODE                 04140000
           END-IF.                                                      04150000
                                                                        04160000
LRM004***  SET HISTORY-MODE TO TRUE.                                    04170000
LRM004***  PERFORM VARYING B1-SUB FROM 1 BY 1                           04180000
LRM004***          UNTIL B1-SUB GREATER 500                             04190000
LRM004***     IF B1-ACAT-COST-BASIS-CLIENT (B1-SUB) = '2'               04200000
LRM004***        DISPLAY 'LOOKUP HISTORY FOR ' B1-SUB                   04210000
LRM004***        MOVE B1-SUB TO WS-PROCESS-CLIENT                       04220000
LRM004***        PERFORM PROCESS-HISTORY-RTN                            04230000
LRM004***     END-IF                                                    04240000
LRM004***  END-PERFORM.                                                 04250000
           EJECT                                                        04260000
       CHECK-TLE-ELIGIBLE.                                              04270000
           SET TLE-NOT-ELIGIBLE TO TRUE.                                04280000
                                                                        04290000
LRM005     IF TRNFR-TYPE-CD OF DCLVTRNFR = 'MFC'                        04300000
              GO TO CHECK-TLE-ELIGIBLE-EXIT                             04310000
           END-IF.                                                      04320000
                                                                        04330000
LRM004     IF (TRNFR-TYPE-CD OF DCLVTRNFR = 'RCL' OR 'FRV')             04340000
LRM003        IF  DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                      04350000
LRM001           CONTINUE                                               04360000
LRM003        ELSE                                                      04370000
LRM003           GO TO CHECK-TLE-ELIGIBLE-EXIT                          04380000
LRM001     ELSE                                                         04390000
LRM001     IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                          04400000
LRM001        GO TO CHECK-TLE-ELIGIBLE-EXIT                             04410000
LRM001     END-IF.                                                      04420000
                                                                        04430000
           IF NOT HISTORY-MODE                                          04440000
           AND TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL'                       04450000
              IF STTLM-DT OF DCLVTRNFR NOT = WS-FUL-STTLM-DATE          04460000
                 GO TO CHECK-TLE-ELIGIBLE-EXIT                          04470000
           END-IF.                                                      04480000
                                                                        04490000
           IF NOT HISTORY-MODE                                          04500000
           AND TRNFR-TYPE-CD OF DCLVTRNFR NOT = 'FUL'                   04510000
              IF STTLM-DT OF DCLVTRNFR NOT = WS-NON-STANDARD-DATE       04520000
                 GO TO CHECK-TLE-ELIGIBLE-EXIT                          04530000
           END-IF.                                                      04540000
                                                                        04550000
   ***** VERIFY ADP ACATS COST BASIS B1 434681 IS ON FOR THE CLIENT     04560000
           MOVE CLIENT-NBR OF DCLVTRNFR TO B1-SUB.                      04570000
           IF B1-ACAT-COST-BASIS-CLIENT (B1-SUB) = '0'                  04580000
              GO TO CHECK-TLE-ELIGIBLE-EXIT                             04590000
           END-IF.                                                      04600000
           MOVE B1-STREAM(B1-SUB) TO WS-STREAM.                         04610000
                                                                        04620000
      ** LOOKUP RECEIVING BROKER IN CBSR PARRTICIPANT LIST TO OBTAIN    04630000
      **  RECEIVING BROKER TYPE.                                        04640000
           MOVE SPACES TO HOLD-RCV-TYPE                                 04650000
LRM004     PERFORM VARYING PRTCP-SUB FROM 1 BY 1                        04660000
LRM004         UNTIL PRTCP-SUB > TAXLOT-COUNT                           04670000
LRM004       OR (WS-CBRS-PRTCP-BROKER(PRTCP-SUB) (1:4) = '0000'         04680000
LRM004       AND RCV-NBR OF DCLVTRNFR =                                 04690000
LRM004               WS-CBRS-PRTCP-BROKER(PRTCP-SUB)(5:4))              04700000
LRM004     END-PERFORM.                                                 04710000
                                                                        04720000
LRM004     IF PRTCP-SUB NOT > TAXLOT-COUNT                              04730000
LRM004        MOVE WS-CBRS-PRTCP-BROKER-TYPE(PRTCP-SUB) TO              04740000
LRM004                       HOLD-RCV-TYPE                              04750000
LRM004     END-IF.                                                      04760000
                                                                        04770000
           SET TLE-ELIGIBLE TO TRUE.                                    04780000
                                                                        04790000
       CHECK-TLE-ELIGIBLE-EXIT. EXIT.                                   04800000
                                                                        04810000
                                                                        04820000
           EJECT                                                        04830000
      ******************                                                04840000
       FETCH-AT-RECORDS.                                                04850000
      ******************                                                04860000
                                                                        04870000
             EXEC SQL                                                   04880000
                OPEN NSCC_AT1_CRSR                                      04890000
             END-EXEC                                                   04900000
                                                                        04910000
           IF SQLCODE NOT = +0                                          04920000
              MOVE 3200 TO ABEND-CODE                                   04930000
              PERFORM SQL-ERROR-ROUTINE                                 04940000
           END-IF                                                       04950000
                                                                        04960000
           PERFORM UNTIL SQLCODE NOT = +0                               04970000
                 EXEC SQL                                               04980000
                    FETCH NSCC_AT1_CRSR                                 04990000
                      INTO                                              05000000
                     :DCLVASSET.CLIENT-NBR                              05010000
                    ,:DCLVASSET.ACAT-CONTROL-NBR                        05020000
                    ,:DCLVASSET.ASSET-SEQ-NBR                           05030000
                    ,:DCLVASSET.TRANS-TYPE-CD                           05040000
                    ,:DCLVASSET.SBMTG-PRTCP-NBR                         05050000
                    ,:DCLVASSET.TRANS-RFRN-ID-CD                        05060000
                    ,:DCLVASSET.ASSET-PRC-CTGY-CD                       05070000
                    ,:DCLVASSET.OPTN-CTGY-CD                            05080000
                    ,:DCLVASSET.STTLM-LCTN-CD                           05090000
                    ,:DCLVASSET.STTLM-RSN-CD                            05100000
                    ,:DCLVASSET.ISIN-CNTRY-CD                           05110000
                    ,:DCLVASSET.ISIN-SEC-ISSUE-CD                       05120000
                    ,:DCLVASSET.ISIN-SEC-CDG-CD                         05130000
                    ,:DCLVASSET.ASSET-DESC-TXT                          05140000
                    ,:DCLVASSET.ASSET-RQST-QTY-CD                       05150000
                    ,:DCLVASSET.AST-RQST-TRANS-CD                       05160000
                    ,:DCLVASSET.ASSET-QTY                               05170000
                    ,:DCLVASSET.PSTN-CD                                 05180000
                    ,:DCLVASSET.ISO-CRNCY-CD                            05190000
                    ,:DCLVASSET.ASSET-AMT                               05200000
                    ,:DCLVASSET.CSH-MGN-SHRT-CD                         05210000
                    ,:DCLVASSET.WHI-CD                                  05220000
                    ,:DCLVASSET.TRNFR-TYPE-RSN-CD                       05230000
                    ,:DCLVASSET.SECURITY-ADP-NBR                        05240000
                    ,:DCLVASSET.PRGM-NM                                 05250000
                    ,:DCLVASSET.UPDT-TMSTP                              05260000
                 END-EXEC                                               05270000
                                                                        05280000
              EVALUATE SQLCODE                                          05290000
                 WHEN +100                                              05300000
                   CONTINUE                                             05310000
                 WHEN +0                                                05320000
                   ADD 1 TO WS-TOTAL-AT-REC-CNTR                        05330000
                   PERFORM WRITE-TAXLOT-RECORD                          05340000
              END-EVALUATE                                              05350000
           END-PERFORM.                                                 05360000
                                                                        05370000
           IF SQLCODE NOT = +100                                        05380000
              MOVE 3400 TO ABEND-CODE                                   05390000
              PERFORM SQL-ERROR-ROUTINE                                 05400000
           END-IF                                                       05410000
                                                                        05420000
           EXEC SQL                                                     05430000
              CLOSE NSCC_AT1_CRSR                                       05440000
           END-EXEC                                                     05450000
                                                                        05460000
           IF SQLCODE NOT = +0                                          05470000
              MOVE 4400 TO ABEND-CODE                                   05480000
              PERFORM SQL-ERROR-ROUTINE                                 05490000
           END-IF                                                       05500000
                                                                        05510000
           .                                                            05520000
                                                                        05530000
           EJECT                                                        05540000
      *****************                                                 05550000
       WRITE-TAXLOT-RECORD.                                             05560000
      *****************                                                 05570000
                                                                        05580000
           MOVE SPACES TO TAXA-DETAIL-RECORD.                           05590000
           SET TAXA-RECORD-ID TO TRUE.                                  05600000
           SET TAXA-RECORD-A-LENGTH TO TRUE.                            05610000
           SET TAXA-ORIGINAL-ASSET TO TRUE.                             05620000
LRM006     IF TRNFR-TYPE-CD OF DCLVTRNFR = 'PTF'                        05630000
LRM006        SET TAXA-ACAT-PTF TO TRUE                                 05640000
LRM006        MOVE 'MFNM'            TO TAXA-ASSET-PRC-CTGY-CD-NEW      05650000
LRM006        PERFORM READ-VFNDSRVS-RTN                                 05660000
LRM007        MOVE 'CATS'            TO TAXA-CONTROL-NUM(1:4)           05670000
LRM006        MOVE FND-SERV-CNTL-NBR OF DCLVFNDSRVS                     05680000
LRM007                               TO TAXA-CONTROL-NUM(5:26)          05690000
LRM006        MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO TAXA-ALT-CONTROL-NUM05700000
LRM006     ELSE                                                         05701000
              SET TAXA-ACAT-DATA TO TRUE                                05701100
              MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO TAXA-CONTROL-NUM    05701200
LRM002        MOVE ASSET-PRC-CTGY-CD OF DCLVASSET TO                    05701300
LRM002                                  TAXA-ASSET-PRC-CTGY-CD-NEW      05701400
LRM006     END-IF.                                                      05701500
           MOVE RCV-NBR OF DCLVTRNFR TO H-RCV-NBR.                      05701600
           MOVE HOLD-RCV-NBR2 TO TAXA-RCV-NBR.                          05701700
           MOVE DLVR-NBR OF DCLVTRNFR TO H-SUBMITTING-BRKR              05701800
           MOVE HOLD-SUBMITTING-BRKR2 TO TAXA-SUBMITTING-BRKR.          05701900
LRM004     SET TAXA-SUBMITTING-FIRM-DTC  TO TRUE.                       05702000
           MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO TAXA-ACCT-DLVR-NBR.       05703000
           MOVE ACCT-RCV-NBR OF DCLVTRNFR TO TAXA-ACCT-RCV-NBR          05704000
LRM004**RECIEVER TYPE WILL BE SPACES WHEN A NON CBRS CONTRA.            05705000
LRM004     MOVE HOLD-RCV-TYPE TO TAXA-RCV-TYPE                          05706000
                                                                        05707000
LRM004     MOVE GIFT-IND OF DCLVTRNFR TO TAXA-GIFT-INDICATOR.           05708000
******** DO NOT MOVE DUMMY CUSIP ON OPTIONS...                          05709000
           IF STTLM-LCTN-CD OF DCLVASSET = '35'                         05710000
           AND ISIN-SEC-ISSUE-CD OF DCLVASSET (1 : 2) = 'XX'            05720000
              CONTINUE                                                  05730000
           ELSE                                                         05740000
              MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET TO TAXA-CUSIP-NUM     05750000
              MOVE ISIN-SEC-CDG-CD OF DCLVASSET TO TAXA-ISIN-SEC-CDG-CD 05760000
           END-IF.                                                      05770000
LRM003**** IF PARM-STREAM  ='Q'                                         05780000
LRM002        MOVE ASSET-DESC-TXT OF DCLVASSET TO TAXA-SEC-DESC-1-NEW   05790000
LRM002        IF STTLM-LCTN-CD OF DCLVASSET = '35'                      05800000
LRM002           MOVE 'OPT' TO          TAXA-ASSET-PRC-CTGY-CD-NEW      05810000
LRM002        END-IF                                                    05820000
LRM002**** ELSE                                                         05830000
      ****    MOVE ASSET-DESC-TXT OF DCLVASSET TO TAXA-SEC-DESC-1.      05840000
      ****    IF STTLM-LCTN-CD OF DCLVASSET = '35'                      05850000
      ****       MOVE 'OPT' TO          TAXA-ASSET-PRC-CTGY-CD          05860000
      ****    ELSE                                                      05870000
      ****       MOVE ASSET-PRC-CTGY-CD OF DCLVASSET TO                 05880000
      ****                              TAXA-ASSET-PRC-CTGY-CD          05890000
      **** END-IF.                                                      05900000
           MOVE PSTN-CD           OF DCLVASSET TO TAXA-PSTN-CD.         05910000
                                                                        05920000
******** OVERRIDE ACCT TYPE ON RECEIVER SHORT TO MARGIN AND DEFAULT     05930000
******** MISSING ACCT TYPE TO CASH:                                     05940000
           IF CSH-MGN-SHRT-CD OF DCLVASSET = 'C' OR 'M' OR 'S'          05950000
              MOVE CSH-MGN-SHRT-CD OF DCLVASSET TO TAXA-CASH-MGN-IND    05960000
           ELSE                                                         05970000
              MOVE 'C'             TO TAXA-CASH-MGN-IND                 05980000
           END-IF.                                                      05990000
                                                                        06000000
           IF STTLM-LCTN-CD OF DCLVASSET = '35'                         06010000
           AND OPTN-CTGY-CD OF DCLVASSET > '00'                         06020000
              PERFORM FORMAT-OPTION-RTN                                 06030000
              IF CLIENT-NBR OF DCLVTRNFR = '0012'                       06040000
              AND SECURITY-ADP-NBR OF DCLVASSET (1 : 1) = '9'           06050000
                 MOVE '8' TO SECURITY-ADP-NBR OF DCLVASSET (1 : 1)      06060000
           END-IF.                                                      06070000
                                                                        06080000
           MOVE CLIENT-NBR OF DCLVTRNFR TO TAXA-ADP-CL-NO.              06090000
           MOVE WS-STREAM               TO TAXA-ADP-STREAM.             06100000
           MOVE STTLM-DT OF DCLVTRNFR TO WS-SETTL-DATE.                 06110000
           MOVE WS-SETTL-DATE(1 : 4) TO TAXA-SETTL-DATE(1 : 4).         06120000
           MOVE WS-SETTL-DATE(6 : 2) TO TAXA-SETTL-DATE(5 : 2).         06130000
           MOVE WS-SETTL-DATE(9 : 2) TO TAXA-SETTL-DATE(7 : 2).         06140000
LRM004     MOVE TAXA-SETTL-DATE   TO    TAXA-TRANS-DATE                 06150000
LRM004                                  TAXA-SETTEMENT-DATE.            06160000
           MOVE TRNFR-TYPE-CD OF DCLVTRNFR TO TAXA-TRNFR-TYPE.          06170000
           MOVE ASSET-SEQ-NBR OF DCLVASSET TO TAXA-ASSET-SEQ-NO-9.      06180000
           MOVE SECURITY-ADP-NBR OF DCLVASSET TO TAXA-ADP-SEC-NO.       06190000
           MOVE ASSET-QTY OF DCLVASSET TO WS-ASSET-QUAN-V9.             06200000
                                                                        06210000
           MOVE WS-ASSET-QUAN-V9       TO TAXA-ASSET-QUAN-WHOLE         06220000
                                          TAXA-ASSET-QUAN-FRACTION      06230000
                                          TAXA-ASSET-QTY-DEC.           06240000
           MOVE ','                    TO TAXA-ASSET-QUAN-COMMA.        06250000
                                                                        06260000
           MOVE ASSET-AMT OF DCLVASSET TO TAXA-ASSET-AMT-DEC.           06270000
           SET TAXA-ADP-TAXLOTA-DETAIL TO TRUE.                         06280000
           IF PRGM-NM OF DCLVASSET = 'CAT784-F'                         06290000
              SET TAXA-FAIL-EDIT TO TRUE                                06300000
           END-IF.                                                      06310000
           MOVE UPDT-TMSTP OF DCLVASSET(1 : 4)                          06320000
                              TO TAXA-FAIL-TL-EDIT-CCYYMMDD(1 : 4)      06330000
           MOVE UPDT-TMSTP OF DCLVASSET(6 : 2)                          06340000
                              TO TAXA-FAIL-TL-EDIT-CCYYMMDD(5 : 2)      06350000
           MOVE UPDT-TMSTP OF DCLVASSET(9 : 2)                          06360000
                              TO TAXA-FAIL-TL-EDIT-CCYYMMDD(7 : 2)      06370000
           MOVE ZEROS         TO TAXA-CALC-QUANTITY                     06380000
                                 TAXA-CALC-DETAIL-COUNT.                06390000
                                                                        06400000
           WRITE TAXLOT-RECORD FROM TAXA-DETAIL-RECORD.                 06410000
           ADD 1    TO  WS-TAXLOT-REC-CNTR.                             06420000
                                                                        06430000
LRM006 READ-VFNDSRVS-RTN.                                               06440000
           EXEC SQL                                                     06450000
              SELECT                                                    06460000
                FND_SERV_CNTL_NBR                                       06470000
              INTO                                                      06480000
                :DCLVFNDSRVS.FND-SERV-CNTL-NBR                          06490000
                 FROM VFNDSRVS                                          06500000
              WHERE CLIENT_NBR   =  :DCLVTRNFR.CLIENT-NBR               06510000
                  AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR   06520000
                  AND  ASSET_SEQ_NBR = :DCLVASSET.ASSET-SEQ-NBR         06530000
           END-EXEC.                                                    06540000
                                                                        06550000
           IF SQLCODE = +0                                              06560000
              ADD 1 TO WS-TOTAL-FS-REC-CNTR                             06570000
           ELSE                                                         06580000
              DISPLAY 'FUND SERV DETAILS NOT FND '                      06590000
                          'CLIENT ' CLIENT-NBR OF DCLVTRNFR             06600000
                          ' CNTL ' ACAT-CONTROL-NBR OF DCLVTRNFR        06610000
                          ' SEQ ' ASSET-SEQ-NBR OF DCLVASSET            06611000
              ADD 1 TO WS-TOTAL-FS-NOT-FND                              06612000
              MOVE SPACES         TO FND-SERV-CNTL-NBR                  06613000
           END-IF.                                                      06614000
           MOVE +0 TO SQLCODE.                                          06614100
       FORMAT-OPTION-RTN.                                               06614200
           IF HISTORY-MODE                                              06614300
              EXEC SQL                                                  06614400
              SELECT                                                    06614500
                BS_CD                                                   06614600
               ,PTCL_CD                                                 06614700
               ,OPTN_OPN_CLSD_CD                                        06614800
               ,SYM_CD                                                  06614900
               ,EXPTN_DT                                                06615000
               ,STPRC_INTEGER_AMT                                       06616000
               ,STPRC_FRCTN_AMT                                         06617000
               ,OPTN_ACCT_TYPE_CD                                       06618000
              INTO                                                      06619000
                :DCLVOPTN.BS-CD                                         06620000
               ,:DCLVOPTN.PTCL-CD                                       06630000
               ,:DCLVOPTN.OPTN-OPN-CLSD-CD                              06640000
               ,:DCLVOPTN.SYM-CD                                        06650000
               ,:DCLVOPTN.EXPTN-DT                                      06660000
               ,:DCLVOPTN.STPRC-INTEGER-AMT                             06670000
               ,:DCLVOPTN.STPRC-FRCTN-AMT                               06680000
               ,:DCLVOPTN.OPTN-ACCT-TYPE-CD                             06690000
                 FROM VOPTHSTY                                          06700000
              WHERE CLIENT_NBR   =  :DCLVTRNFR.CLIENT-NBR               06710000
                  AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR   06720000
                  AND  ASSET_SEQ_NBR = :DCLVASSET.ASSET-SEQ-NBR         06730000
              END-EXEC                                                  06740000
           ELSE                                                         06750000
              EXEC SQL                                                  06760000
              SELECT                                                    06770000
                BS_CD                                                   06780000
               ,PTCL_CD                                                 06790000
               ,OPTN_OPN_CLSD_CD                                        06800000
               ,SYM_CD                                                  06810000
               ,EXPTN_DT                                                06820000
               ,STPRC_INTEGER_AMT                                       06830000
               ,STPRC_FRCTN_AMT                                         06840000
               ,OPTN_ACCT_TYPE_CD                                       06850000
              INTO                                                      06860000
                :DCLVOPTN.BS-CD                                         06870000
               ,:DCLVOPTN.PTCL-CD                                       06880000
               ,:DCLVOPTN.OPTN-OPN-CLSD-CD                              06890000
               ,:DCLVOPTN.SYM-CD                                        06900000
               ,:DCLVOPTN.EXPTN-DT                                      06910000
               ,:DCLVOPTN.STPRC-INTEGER-AMT                             06920000
               ,:DCLVOPTN.STPRC-FRCTN-AMT                               06930000
               ,:DCLVOPTN.OPTN-ACCT-TYPE-CD                             06940000
                 FROM VOPTN                                             06950000
              WHERE CLIENT_NBR   =  :DCLVTRNFR.CLIENT-NBR               06960000
                  AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR   06970000
                  AND  ASSET_SEQ_NBR = :DCLVASSET.ASSET-SEQ-NBR         06980000
              END-EXEC                                                  06990000
           END-IF.                                                      07000000
                                                                        07010000
           IF SQLCODE = +0                                              07020000
              ADD 1 TO WS-TOTAL-OP-REC-CNTR                             07030000
              PERFORM MOVE-OPTION-DETAILS                               07040000
           ELSE                                                         07050000
              DISPLAY 'OPT DETAILS NOT FND '                            07060000
                          'CLIENT ' CLIENT-NBR OF DCLVTRNFR             07070000
                          ' CNTL ' ACAT-CONTROL-NBR OF DCLVTRNFR        07080000
                          ' SEQ ' ASSET-SEQ-NBR OF DCLVASSET            07090000
              ADD 1 TO WS-TOTAL-OP-NOT-FND                              07100000
LRM002        MOVE SPACES         TO TAXA-OPTION-SYMBOL                 07110000
LRM002                               TAXA-OPT-EXP-DATE-NEW              07120000
LRM002                               TAXA-OPT-PUT-CALL                  07130000
LRM002        MOVE ZEROS          TO TAXA-STPRC-INTEGER-AMT-NEW         07140000
LRM002                               TAXA-STPRC-FRCTN-AMT-NEW           07150000
           END-IF.                                                      07160000
           MOVE +0 TO SQLCODE.                                          07170000
                                                                        07180000
       MOVE-OPTION-DETAILS.                                             07190000
           MOVE SYM-CD            OF DCLVOPTN                           07200000
                                  TO TAXA-OPTION-SYMBOL.                07210000
LRM002     MOVE EXPTN-DT OF DCLVOPTN (1 : 4)                            07220000
LRM002                               TO TAXA-OPT-EXP-CCYY-NEW           07230000
LRM002     MOVE EXPTN-DT OF DCLVOPTN (9 : 2)                            07240000
LRM002                               TO TAXA-OPT-EXP-DD-NEW             07250000
LRM002     MOVE EXPTN-DT OF DCLVOPTN (6 : 2)                            07260000
LRM002                               TO TAXA-OPT-EXP-MM-NEW             07270000
LRM002     MOVE STPRC-INTEGER-AMT OF DCLVOPTN                           07280000
LRM002                               TO TAXA-STPRC-INTEGER-AMT-NEW      07290000
LRM002     MOVE STPRC-FRCTN-AMT   OF DCLVOPTN                           07300000
LRM002                               TO TAXA-STPRC-FRCTN-AMT-NEW2.      07310000
           MOVE PTCL-CD           OF DCLVOPTN                           07320000
                                  TO TAXA-OPT-PUT-CALL.                 07330000
                                                                        07340000
           EJECT                                                        07350000
       PROCESS-HISTORY-RTN.                                             07360000
           EXEC SQL OPEN NSCC_TIHSTY_CRSR END-EXEC                      07370000
           IF SQLCODE NOT = +0                                          07380000
              MOVE 4400 TO ABEND-CODE                                   07390000
              PERFORM SQL-ERROR-ROUTINE                                 07400000
           END-IF.                                                      07410000
                                                                        07420000
           PERFORM UNTIL SQLCODE NOT = +0                               07430000
              EXEC SQL                                                  07440000
               FETCH NSCC_TIHSTY_CRSR                                   07450000
                  INTO                                                  07460000
                   :DCLVTRNFR.CLIENT-NBR                                07470000
                  ,:DCLVTRNFR.ACAT-CONTROL-NBR                          07480000
                  ,:DCLVTRNFR.RCV-NBR                                   07490000
                  ,:DCLVTRNFR.ACCT-RCV-NBR                              07500000
                  ,:DCLVTRNFR.DLVR-NBR                                  07510000
                  ,:DCLVTRNFR.ACCT-DLVR-NBR                             07520000
                  ,:DCLVTRNFR.STTS-CD                                   07530000
                  ,:DCLVTRNFR.DAYS-STTS-QTY                             07540000
                  ,:DCLVTRNFR.TRNFR-TYPE-CD                             07550000
                  ,:DCLVTRNFR.DSTBN-SIDE-CD                             07560000
                  ,:DCLVTRNFR.SBMTG-PRTCP-NBR                           07570000
                  ,:DCLVTRNFR.RCV-CUST-NM                               07580000
                  ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                          07590000
                  ,:DCLVTRNFR.STTLM-DT                                  07600000
                  ,:DCLVTRNFR.PRCS-DT                                   07610000
                  ,:DCLVTRNFR.PRTCP-CONTRA-CD                           07620000
LRM004            ,:DCLVTRNFR.GIFT-IND                                  07630000
              END-EXEC                                                  07640000
                                                                        07650000
              EVALUATE SQLCODE                                          07660000
                 WHEN +100                                              07670000
                    CONTINUE                                            07680000
                 WHEN +0                                                07690000
                    PERFORM CHECK-TLE-ELIGIBLE                          07700000
                       THRU CHECK-TLE-ELIGIBLE-EXIT                     07710000
                    IF TLE-ELIGIBLE                                     07720000
                        ADD 1 TO WS-TOTAL-TI-REC-CNTR                   07730000
                        PERFORM FETCH-AT-HSTY-RECORDS                   07740000
                    END-IF                                              07750000
                 WHEN OTHER                                             07760000
                    MOVE 4500 TO ABEND-CODE                             07770000
                    PERFORM SQL-ERROR-ROUTINE                           07780000
              END-EVALUATE                                              07790000
           END-PERFORM.                                                 07800000
                                                                        07810000
           IF SQLCODE NOT = +100                                        07820000
              MOVE 4800 TO ABEND-CODE                                   07830000
              PERFORM SQL-ERROR-ROUTINE                                 07840000
           END-IF                                                       07850000
                                                                        07860000
           EXEC SQL                                                     07870000
              CLOSE NSCC_TIHSTY_CRSR                                    07880000
           END-EXEC                                                     07890000
                                                                        07900000
           IF SQLCODE NOT = +0                                          07910000
              MOVE 5200 TO ABEND-CODE                                   07920000
              PERFORM SQL-ERROR-ROUTINE                                 07930000
           ELSE                                                         07940000
              MOVE +0                       TO  SQLCODE                 07950000
           END-IF.                                                      07960000
           EJECT                                                        07970000
      ******************                                                07980000
       FETCH-AT-HSTY-RECORDS.                                           07990000
      ******************                                                08000000
                                                                        08010000
             EXEC SQL                                                   08020000
                OPEN NSCC_ATHSTY_CRSR                                   08030000
             END-EXEC                                                   08040000
                                                                        08050000
           IF SQLCODE NOT = +0                                          08060000
              MOVE 6200 TO ABEND-CODE                                   08070000
              PERFORM SQL-ERROR-ROUTINE                                 08080000
           END-IF                                                       08090000
                                                                        08100000
           PERFORM UNTIL SQLCODE NOT = +0                               08110000
                 EXEC SQL                                               08120000
                    FETCH NSCC_ATHSTY_CRSR                              08130000
                      INTO                                              08140000
                     :DCLVASSET.CLIENT-NBR                              08150000
                    ,:DCLVASSET.ACAT-CONTROL-NBR                        08160000
                    ,:DCLVASSET.ASSET-SEQ-NBR                           08170000
                    ,:DCLVASSET.TRANS-TYPE-CD                           08180000
                    ,:DCLVASSET.SBMTG-PRTCP-NBR                         08190000
                    ,:DCLVASSET.TRANS-RFRN-ID-CD                        08200000
                    ,:DCLVASSET.ASSET-PRC-CTGY-CD                       08210000
                    ,:DCLVASSET.OPTN-CTGY-CD                            08220000
                    ,:DCLVASSET.STTLM-LCTN-CD                           08230000
                    ,:DCLVASSET.STTLM-RSN-CD                            08240000
                    ,:DCLVASSET.ISIN-CNTRY-CD                           08250000
                    ,:DCLVASSET.ISIN-SEC-ISSUE-CD                       08260000
                    ,:DCLVASSET.ISIN-SEC-CDG-CD                         08270000
                    ,:DCLVASSET.ASSET-DESC-TXT                          08280000
                    ,:DCLVASSET.ASSET-RQST-QTY-CD                       08290000
                    ,:DCLVASSET.AST-RQST-TRANS-CD                       08300000
                    ,:DCLVASSET.ASSET-QTY                               08310000
                    ,:DCLVASSET.PSTN-CD                                 08320000
                    ,:DCLVASSET.ISO-CRNCY-CD                            08330000
                    ,:DCLVASSET.ASSET-AMT                               08340000
                    ,:DCLVASSET.CSH-MGN-SHRT-CD                         08350000
                    ,:DCLVASSET.WHI-CD                                  08360000
                    ,:DCLVASSET.TRNFR-TYPE-RSN-CD                       08370000
                    ,:DCLVASSET.SECURITY-ADP-NBR                        08380000
                    ,:DCLVASSET.PRGM-NM                                 08390000
                    ,:DCLVASSET.UPDT-TMSTP                              08400000
                 END-EXEC                                               08410000
                                                                        08420000
              EVALUATE SQLCODE                                          08430000
                 WHEN +100                                              08440000
                   CONTINUE                                             08450000
                 WHEN +0                                                08460000
                   ADD 1 TO WS-TOTAL-AT-REC-CNTR                        08470000
                   PERFORM WRITE-TAXLOT-RECORD                          08480000
              END-EVALUATE                                              08490000
           END-PERFORM.                                                 08500000
                                                                        08510000
           IF SQLCODE NOT = +100                                        08520000
              MOVE 6400 TO ABEND-CODE                                   08530000
              PERFORM SQL-ERROR-ROUTINE                                 08540000
           END-IF                                                       08550000
                                                                        08560000
           EXEC SQL                                                     08570000
              CLOSE NSCC_ATHSTY_CRSR                                    08580000
           END-EXEC                                                     08590000
                                                                        08600000
           IF SQLCODE NOT = +0                                          08610000
              MOVE 6600 TO ABEND-CODE                                   08620000
              PERFORM SQL-ERROR-ROUTINE                                 08630000
           END-IF                                                       08640000
                                                                        08650000
           .                                                            08660000
      *******************                                               08670000
       SQL-ERROR-ROUTINE.                                               08680000
      *******************                                               08690000
                                                                        08700000
           DISPLAY 'SQLCODE IS ' SQLCODE                                08710000
                   ' ABEND-CODE ' ABEND-CODE.                           08720000
                                                                        08730000
           CALL DSNTIAR               USING  SQLCA                      08740000
                                             WS-DB2-MESSAGE-AREA        08750000
                                             WS-ERR-LINE-LEN            08760000
                                                                        08770000
           DISPLAY ' '                                                  08780000
                                                                        08790000
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   08800000
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      08810000
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              08820000
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        08830000
                 END-IF                                                 08840000
           END-PERFORM                                                  08850000
                                                                        08860000
           DISPLAY ' '                                                  08870000
           DISPLAY '*** PROGRAM IS ABENDING'                            08880000
           DISPLAY ' '                                                  08890000
                                                                        08900000
           CALL ABEND USING ABEND-CODE                                  08910000
                                                                        08920000
           .                                                            08930000
                                                                        08940000
           EJECT                                                        08950000
      *****************                                                 08960000
       INITIAL-ROUTINE.                                                 08970000
      *****************                                                 08980000
                                                                        08990000
           OPEN OUTPUT TAXLOT-FILE                                      09000000
           MOVE SPACES TO B1-TABLE.                                     09010000
                                                                        09020000
           MOVE  'CAT780DB'                   TO BPDATES-CALLING-PGM.   09030000
           MOVE  'C'                          TO BPDATES-REQ-TYPE.      09040000
                                                                        09050000
           CALL    BPDATES            USING BPDATES-PARAMETERS.         09060000
                                                                        09070000
******** USE TODAY AND PLUS 1 DATES BELOW; THIS PROGRAM WILL RUN AFTER  09080000
******** DATE CHANGE.                                                   09090000
           MOVE BPD-PROC-DATE TO  WS-BPD-PROC-DATE                      09100000
                                                                        09110000
           MOVE WS-BPD-PROC-DATE(1 : 4) TO WS-NON-STANDARD-DATE(1 : 4). 09120000
           MOVE '-'                     TO WS-NON-STANDARD-DATE(5 : 1)  09130000
                                           WS-NON-STANDARD-DATE(8 : 1)  09140000
           MOVE WS-BPD-PROC-DATE(5 : 2) TO WS-NON-STANDARD-DATE(6 : 2). 09150000
           MOVE WS-BPD-PROC-DATE(7 : 2) TO WS-NON-STANDARD-DATE(9 : 2). 09160000
           MOVE WS-NON-STANDARD-DATE    TO WS-FUL-STTLM-DATE.           09170000
                                                                        09180000
           MOVE BPD-PROC-DATE TO  WS-BPD-PROC-DATE                      09190000
           DISPLAY 'STANDARD SETTLE DATE ' WS-BPD-PROC-DATE             09200000
                                       ' ' WS-FUL-STTLM-DATE.           09210000
                                                                        09220000
           DISPLAY 'NON STANDARD DATE    ' WS-BPD-PROC-DATE             09230000
                                       ' ' WS-NON-STANDARD-DATE.        09240000
                                                                        09250000
           SET NSCCDHDR-VB-COST-BASIS TO TRUE.                          09260000
           IF PARM-STREAM = 'Q'                                         09270000
              MOVE 'Q'                  TO  WS-DESC-STREAM-IND          09280000
           ELSE                                                         09290000
              MOVE 'Z'                  TO  WS-DESC-STREAM-IND          09300000
           END-IF                                                       09310000
           MOVE BPD-PROC-DATE        TO WS-BPD-PROC-DATE                09320000
           MOVE WS-BPD-MM             TO  WS-DATE-MM                    09330000
           MOVE WS-BPD-DD             TO  WS-DATE-DD                    09340000
           MOVE WS-BPD-CC             TO  WS-DATE-CC                    09350000
           MOVE WS-BPD-YY             TO  WS-DATE-YY                    09360000
           MOVE WS-DATE-MMDDCCYY      TO  NSCCDHDR-SUBMIT-DATE          09370000
           MOVE WS-FILE-DESC          TO  NSCCDHDR-FILE-DESC            09380000
           MOVE WS-ORIGINATOR         TO  NSCCDHDR-ORIGINATOR           09390000
           SET VARIABLE-LENGTH TO TRUE.                                 09400000
           MOVE NSCC-HDR-RECORD TO  TAXLOT-RECORD                       09410000
           MOVE LOW-VALUES      TO  TAXLOT-RECORD(1000 : 1)             09420000
           WRITE TAXLOT-RECORD.                                         09430000
                                                                        09440000
           OPEN INPUT  CBRS-PARTICIPANT-FILE                            09450000
           PERFORM LOAD-CBRS-PRTCP-TABLE.                               09460000
                                                                        09470000
           SET BPD-DISPLACEMENT-DATE-INFO TO TRUE.                      09480000
           MOVE BPD-PROC-DATE     TO BPDATES-BASE-DATE.                 09490000
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE    09500100
CSG001* THE DEFAULT CALENDAR.                                           09500200
CSG001*    MOVE 'US'              TO BPDATES-CALENDAR-TYPE.             09500300
CSG001     MOVE '  '              TO BPDATES-CALENDAR-TYPE.             09501000
           SET BPD-DISP-MINUS TO TRUE.                                  09510000
           SET BPD-DISP-SETTL-DATE TO TRUE.                             09520000
           MOVE 09 TO BPDATES-DTSEARCH-DISP.                            09530000
           CALL  BPDATES  USING BPDATES-PARAMETERS.                     09540000
           IF NOT BPD-VALID-RETURN                                      09550000
              DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE            09560000
              DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE          09570000
              DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE           09580000
              DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG            09590000
              MOVE +1000 TO ABEND-CODE                                  09600000
              CALL ABEND USING ABEND-CODE                               09610000
           ELSE                                                         09620000
              MOVE BPD-DT-CALDATE TO WS-AGED-DATE-CCYYMMDD              09630000
              MOVE WS-DATENEW-CALC-CC TO WS-END-STTLM-DATE(1 : 2)       09640000
              MOVE WS-DATENEW-CALC-YY TO WS-END-STTLM-DATE(3 : 2)       09650000
              MOVE '-'                TO WS-END-STTLM-DATE(5 : 1)       09660000
                                         WS-END-STTLM-DATE(8 : 1)       09670000
              MOVE WS-DATENEW-CALC-MM TO WS-END-STTLM-DATE(6 : 2)       09680000
              MOVE WS-DATENEW-CALC-DD TO WS-END-STTLM-DATE(9 : 2)       09690000
              DISPLAY 'SETTLEMENT ENDING PERIOD ' WS-END-STTLM-DATE     09700000
           END-IF.                                                      09710000
                                                                        09720000
           PERFORM  VARYING B1-SUB  FROM 1 BY 1                         09730000
                 UNTIL B1-SUB GREATER 500                               09740000
                                                                        09750000
             MOVE  ' '                 TO  BH-BROKER-HEADER-INFO        09760000
             MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N           09770000
             MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE       09780000
             MOVE  '434500'            TO  BH-B2-INFO-ID                09790000
             CALL   GETB1V           USING BH-BROKER-HEADER-INFO,       09800000
                                           BH-ACAT-INFO                 09810000
             END-CALL                                                   09820000
             IF  BH-ACAT-ACTIVE                                         09830000
      ***CARD-434681                                                    09840000
                MOVE BH-ACAT-COST-BASIS-CLIENT TO                       09850000
                             B1-ACAT-COST-BASIS-CLIENT (B1-SUB)         09860000
                MOVE BH-BROKER-MINI-MAXI-INDICATOR TO B1-STREAM (B1-SUB)09870000
                DISPLAY ' B1 CLIENT ' BH-BROKER-NUMBER-N                09880000
                        ' , HAS COST BASIS B1 '                         09890000
                        BH-ACAT-COST-BASIS-CLIENT                       09900000
             ELSE                                                       09910000
                MOVE '0' TO  B1-ACAT-COST-BASIS-CLIENT (B1-SUB)         09920000
             END-IF                                                     09930000
           END-PERFORM.                                                 09940000
                                                                        09950000
           EJECT                                                        09960000
       LOAD-CBRS-PRTCP-TABLE.                                           09970000
           PERFORM UNTIL CBRS-PRTPC-EOF                                 09980000
                       OR PRTCP-SUB GREATER 9999                        09990000
              READ CBRS-PARTICIPANT-FILE                                10000000
                     INTO CBRS-RECORD                                   10010000
                 AT END                                                 10020000
                    SET CBRS-PRTPC-EOF  TO TRUE                         10030000
                 NOT AT END                                             10040000
                    IF CBRS-RECORD(1:6) = '1TRANS'                      10050000
                       DISPLAY 'READ CBRS PRTCP HEADER '                10060000
                           CBRS-RECORD(1:80)                            10070000
                       MOVE CBRS-RECORD TO CBRS-HDR-RECORD              10080000
                       PERFORM CBRS-DATE-CHECK-RTN                      10090000
                                                                        10100000
                    ELSE                                                10110000
                       ADD 1 TO TAXLOT-COUNT                            10120000
                       MOVE CBRS-FIRM-ACCOUNT TO                        10130000
                                WS-CBRS-PRTCP-BROKER(TAXLOT-COUNT)      10140000
                       MOVE CBRS-FIRM-TYPE    TO                        10150000
                                WS-CBRS-PRTCP-BROKER-TYPE(TAXLOT-COUNT) 10160000
                    END-IF                                              10170000
              END-READ                                                  10180000
           END-PERFORM.                                                 10190000
           IF NOT CBRS-PRTPC-EOF                                        10200000
              DISPLAY 'TABLE OVERFLOW ON CBRS PARTICIPANT'              10210000
              MOVE 'NEED TABLE EXPANSION' TO INFSND-MSG                 10220000
              CALL  INFSND  USING INFSND-DATA                           10230000
              DISPLAY 'CAT780DB ABENDS'                                 10240000
              MOVE 5200 TO ABEND-CODE                                   10250000
              CALL ABEND USING ABEND-CODE                               10260000
           ELSE                                                         10270000
              IF TAXLOT-COUNT > 9500                                    10280000
                MOVE 'MAY NEED EXPANSION SOON BROKER' TO INFSND-MSG     10290000
                CALL  INFSND  USING INFSND-DATA                         10300000
           END-IF.                                                      10310000
                                                                        10320000
       CBRS-DATE-CHECK-RTN.                                             10330000
           IF CBRS-HDR-DATE-CCYYMMDD NOT = BPD-PROC-DATE                10340000
              DISPLAY 'WRONG DATE ON CBRS PARTICIPANT FILE SIAC1666'    10350000
              DISPLAY 'EXPECTING=' BPD-PROC-DATE                        10360000
                      ' HAVE=' CBRS-HDR-DATE-CCYYMMDD                   10370000
              IF L-BYP-DATECHK                                          10380000
                 DISPLAY  'BYPASS ABEND / GO WITH FILE'                 10390000
              ELSE                                                      10400000
                 MOVE 8100 TO ABEND-CODE                                10410000
                 PERFORM SQL-ERROR-ROUTINE                              10420000
              END-IF                                                    10430000
           END-IF.                                                      10440000
      ****************                                                  10450000
       ENDJOB-ROUTINE.                                                  10460000
      ****************                                                  10470000
                                                                        10480000
           MOVE WS-TAXLOT-REC-CNTR TO NSCCDTRL-REC-COUNT                10490000
           SET NSCCDTRL-VB-COST-BASIS TO TRUE.                          10500000
           MOVE NSCC-TRL-RECORD TO  TAXLOT-RECORD                       10510000
           MOVE HIGH-VALUES     TO  TAXLOT-RECORD(1000 : 1)             10520000
           WRITE TAXLOT-RECORD.                                         10530000
                                                                        10540000
           CLOSE  CBRS-PARTICIPANT-FILE.                                10550000
           CLOSE  TAXLOT-FILE.                                          10560000
                                                                        10570000
           DISPLAY ' '                                                  10580000
           DISPLAY '   DB2 INPUT TOTALS'                                10590000
           DISPLAY '   -----------------'                               10600000
           DISPLAY 'NUMBER OF TI RECORDS: ' WS-TOTAL-TI-REC-CNTR        10610000
           DISPLAY 'NUMBER OF AT RECORDS: ' WS-TOTAL-AT-REC-CNTR        10620000
           DISPLAY 'NUMBER OF OPTIONS   : ' WS-TOTAL-OP-REC-CNTR        10630000
                               ' NOT-FND: ' WS-TOTAL-OP-NOT-FND         10640000
LRM006     DISPLAY 'NUMBER OF FUNDSERV  : ' WS-TOTAL-FS-REC-CNTR        10650000
LRM006                         ' NOT-FND: ' WS-TOTAL-FS-NOT-FND         10660000
           DISPLAY ' '                                                  10670000
           DISPLAY 'TAXLOT EXTRACT RECS : ' WS-TAXLOT-REC-CNTR          10680000
                                                                        10690000
           DISPLAY ' '                                                  10700000
           DISPLAY '***************************'                        10710000
           DISPLAY '* END OF CAT780DB PROGRAM *'                        10720000
           DISPLAY '***************************'                        10730000
           DISPLAY ' '.                                                 10740000
