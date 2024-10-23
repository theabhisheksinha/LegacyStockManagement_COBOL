000001* PDX    - CAT885A  C0247676 04/20/07 09:42:32 TBLAMUR            00001019
LRM001* TASK 52092 TO RESOLVE -911 CONTENTION, QUALIFY CURSOR WITH      00001101
LRM001* CLIENT NUMBER AND ISSUE UNRESTRICED READS.                      00001200
000001* PDX    - CAT885A  C0171522 04/04/02 09:49:37 TBLAMUR            00001300
000001* PDX    - CAT885A  C0154990 06/29/01 08:52:24 TBLAMUR            00001400
       IDENTIFICATION DIVISION.                                         00002000
       PROGRAM-ID. CAT885A.                                             00003000
      *---------------------------------------------------------------* 00004000
      *REMARKS.                                                       * 00005000
      *                                                               * 00006000
      *  THIS PROGRAM - EXTRACT ALL ACATS RECORDS FROM REVIEW DAY 1   * 00007000
      *                 UNTIL SETTLEMNT PREP                          * 00008000
      *                (ACAT ST_CD IS 100,110,140 200 THRU 300)       * 00008100
      *                (FOR LEHMAN BROTHERS INITIALLY)                * 00009000
      *                 NEW B1 CARD 434665 IS USED                    * 00010000
      *               - THE EXTRACTED FILE WILL THAN BE SORTED BY     * 00020000
      *                 CLIENT #, BRANCH, ACCT, ACAT CONTROL #,       * 00030000
      *                 THEN INPUT TO CAT885B FOR REPORT FILE.        * 00040000
      *                                                               * 00120000
      *---------------------------------------------------------------* 00130000
           EJECT                                                        00140000
       ENVIRONMENT DIVISION.                                            00150000
       INPUT-OUTPUT SECTION.                                            00160000
                                                                        00170000
       FILE-CONTROL.                                                    00180000
                                                                        00190000
           SELECT  EXTRACT-FILE        ASSIGN  TO  EXTRACT.             00200000
           SELECT  OPTEXT-FILE         ASSIGN  TO  OPTEXT.              00201000
                                                                        00210000
           EJECT                                                        00220000
      ***************************************************************** 00230000
       DATA DIVISION.                                                   00240000
      ***************************************************************** 00250000
       FILE SECTION.                                                    00260000
                                                                        00270000
       FD  EXTRACT-FILE                                                 00280000
           RECORDING MODE IS F                                          00290000
           LABEL RECORDS STANDARD                                       00300000
           BLOCK CONTAINS 0 RECORDS                                     00310000
           RECORD CONTAINS 80 CHARACTERS.                               00320000
       01  EXTRACT-REC                 PIC X(80).                       00330000
                                                                        00340000
       FD  OPTEXT-FILE                                                  00342000
           RECORDING MODE IS F                                          00343000
           LABEL RECORDS STANDARD                                       00344000
           BLOCK CONTAINS 0 RECORDS                                     00345000
           RECORD CONTAINS 80 CHARACTERS.                               00346000
       01  OPTEXT-REC                  PIC X(80).                       00347000
                                                                        00348000
           EJECT                                                        00350000
      ***************************************************************** 00360000
       WORKING-STORAGE  SECTION.                                        00370000
      ***************************************************************** 00380000
       77  PGM-NAME                         PIC X(08)  VALUE 'CAT885A'. 00390000
       77  WS-DATE                          PIC 9(06)  VALUE 0.         00400000
                                                                        00410000
       77  ABEND-CODE-2000      COMP        PIC S9(4)  VALUE +2000.     00420000
                                                                        00430000
       77  ABEND-CODE-4000      COMP        PIC S9(4)  VALUE +4000.     00440000
       77  ABEND-CODE-4004      COMP        PIC S9(4)  VALUE +4004.     00450000
                                                                        00460000
       77  ABEND-CODE-8000      COMP        PIC S9(4)  VALUE +8000.     00470000
                                                                        00480000
       77  ACAT-RECS-CLIENT      COMP       PIC S9(9)  VALUE +0.        00490000
                                                                        00500000
       77  ACAT-RECS-TOTAL       COMP       PIC S9(9)  VALUE +0.        00510000
                                                                        00520000
       77  S1                               PIC 9(3)    VALUE 0.        00530000
LRM    77  SUB                              PIC 9(4)    VALUE 0.        00540000
       77  B1-SUB                           PIC 9(4)    VALUE 0.        00541000
       77  B11-SUB                          PIC 9(4)    VALUE 0.        00550000
       77  B1-TBL-CNT                       PIC 9(4)    VALUE 0.        00560000
       77  B1-SUB1                          PIC 9(4)    VALUE 0.        00570000
       77  B1-SUB1-SVE                      PIC 9(4)    VALUE 0.        00580000
       77  CNTL-SUB                         PIC 9(4)    VALUE 0.        00590000
       77  O-SUB1                           PIC 9(4)    VALUE 0.        00600000
       77  O-SUB2                           PIC 9(4)    VALUE 0.        00610000
       77  T-SUB1                           PIC 9(4)    VALUE 0.        00611000
       77  T-SUB2                           PIC 9(4)    VALUE 0.        00612000
       77  ACAT-BYPASS-CLI                  PIC 9(3)    VALUE 0.        00620000
       77  ACAT-EXTRACT-CLI                 PIC 9(3)    VALUE 0.        00630000
       77  SAVE-CLI                         PIC 9(3)    VALUE 0.        00640000
       77  SAVE-CLI-OPT                     PIC 9(3)    VALUE 0.        00641000
       77  ACAT-CLI-P                       PIC 9(3)    VALUE 0.        00650000
       77  CLIENT-TABLE-CNTR                PIC 9(3)    VALUE 0.        00660000
                                                                        00670000
       77  B1-TABLE-SEARCH-STATUS           PIC X(01)  VALUE ' '.       00680000
           88  B1-ENTRY-FOUND                          VALUE 'Y'.       00690000
           88  B1-ENTRY-NOT-FOUND                      VALUE 'N'.       00700000
                                                                        00710000
       77  B1-TABLE-SEARCH-SWITCH           PIC X(01)  VALUE ' '.       00720000
           88  B1-SEARCH-END                           VALUE 'Y'.       00730000
                                                                        00740000
       77  FIRST-TIME-IN-SW                 PIC X(01)  VALUE 'Y'.       00750000
           88  FIRST-TIME-IN                           VALUE 'Y'.       00760000
                                                                        00770000
       77  EXT-HDR-SW                       PIC X(01)  VALUE ' '.       00780000
           88  EXT-HDR-YES                             VALUE 'Y'.       00790000
           88  EXT-HDR-NO                              VALUE 'N'.       00800000
                                                                        00810000
       77  ACAT-EOF-SW                      PIC X(01)  VALUE ' '.       00820000
           88  ACAT-EOF                                VALUE 'Y'.       00830000
                                                                        00840000
       01  WS-COUNTERS.                                                 00930000
           05  ACAT-BYP-RECS            PIC 9(7)   COMP-3  VALUE ZERO.  00940000
           05  ACAT-EXT-RECS            PIC 9(7)   COMP-3  VALUE ZERO.  00950000
           05  ACAT-WRT-RECS            PIC 9(7)   COMP-3  VALUE ZERO.  00960000
           05  CLI-EXT-RECS             PIC 9(7)   COMP-3  VALUE ZERO.  00970000
                                                                        00980000
      ******************************************************************00990000
      * DB2 ERROR MESSAGE AREA                                         *01000000
      ******************************************************************01010000
       01  DSNTIAR                       PIC X(008) VALUE 'DSNTIAR'.    01020000
       01  W-DB2-MESSAGE-AREA.                                          01030000
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    01040000
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     01050000
                   INDEXED BY W-DB2-IDX.                                01060000
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     01070000
                                                                        01080000
       01  W-DB2-ERR-MSG-OUT.                                           01090000
           05  FILLER            PIC X(04) VALUE '**  '.                01100000
           05  W-ERR-MSG-OUT     PIC X(50) VALUE SPACE.                 01110000
           05  FILLER            PIC X(12) VALUE '=> SQLCODE: '.        01120000
           05  W-SQLCODE-OUT     PIC -999.                              01130000
                                                                        01140000
58     01  EXT-REC-HDR.                                                 01150000
           05  FILLER                  PIC X(11)  VALUE LOW-VALUE.      01160000
           05  EXT-PGM-NAME            PIC X(8).                        01170000
           05  FILLER                  PIC X(2)   VALUE SPACES.         01171000
           05  FILLER                  PIC X(13)  VALUE                 01180000
                                                  'RECORD HEADER'.      01190000
           05  FILLER                  PIC X(2)   VALUE SPACES.         01200000
           05  FILLER                  PIC X(15)  VALUE                 01221000
               'PROCESS DATE = '.                                       01222000
           05  EXT-PROC-DATE.                                           01230000
               10  EXT-MM              PIC X(2).                        01241000
               10  EXT-DD              PIC X(2).                        01250000
               10  EXT-CC              PIC X(2).                        01260000
               10  EXT-YY              PIC X(2).                        01261000
           05  FILLER                  PIC X(21)  VALUE SPACES.         01270000
                                                                        01280000
       01  EXT-CLI-HDR.                                                 01290000
           05  EXT-HDR-CL              PIC X(3).                        01300000
           05  FILLER                  PIC X(22)  VALUE LOW-VALUE.      01310000
           05  FILLER                  PIC X(11)  VALUE  'CLIENT HDR '. 01320000
           05  EXT-CLI-NAME            PIC X(30).                       01330000
           05  FILLER                  PIC X(14)  VALUE SPACES.         01340000
                                                                        01350000
       01  EXT-REC.                                                     01360000
           05  EXT-CL                   PIC X(3).                       01370000
           05  EXT-BR                   PIC X(3).                       01380000
           05  EXT-ACCT                 PIC X(5).                       01390000
           05  EXT-ACAT-CNTL-NBR        PIC X(14).                      01400000
           05  EXT-ACAT-RCV-NBR         PIC X(4).                       01410000
           05  EXT-ACAT-STTS-CD         PIC X(3).                       01420000
           05  FILLER                   PIC X(48)  VALUE SPACES.        01430000
                                                                        01440000
       01  EXT-CLI-TRL.                                                 01450000
           05  EXT-TRL-CL              PIC X(3).                        01460000
           05  EXT-TRL-FILLER          PIC X(22)  VALUE HIGH-VALUE.     01470000
           05  FILLER                  PIC X(14)  VALUE                 01480000
                                                  'CLIENT TRAILER'.     01490000
           05  FILLER                  PIC X(2)   VALUE SPACES.         01500000
           05  EXT-REC-CNT             PIC 9(7).                        01510000
           05  FILLER                  PIC X(32)  VALUE SPACES.         01520000
                                                                        01530000
       01  EXT-REC-TRL.                                                 01540000
           05  FILLER                  PIC X(03)  VALUE '999'.          01550000
           05  FILLER                  PIC X(22)  VALUE HIGH-VALUE.     01551000
           05  FILLER                  PIC X(21)  VALUE                 01570000
                                            'RECORD TRAILER CNT = '.    01580000
           05  EXT-TRL-CNT             PIC 9(7).                        01600000
           05  FILLER                  PIC X(27)  VALUE SPACES.         01610000
                                                                        01620000
       01  WORK-DATE-MMDDCCYY          PIC X(8).                        01630000
                                                                        01640000
       01  PROC-DATE.                                                   01650000
           05  PD-CC                   PIC X(2).                        01660000
           05  PD-YY                   PIC X(2).                        01670000
           05  PD-MM                   PIC X(2).                        01680000
           05  PD-DD                   PIC X(2).                        01690000
                                                                        01700000
           EJECT                                                        01710000
       01  B1-TABLE-AREA-OPTION.                                        01720000
           03  B1-TABLE-OPT OCCURS 500 TIMES.                           01730000
               05  B1-CL-NO-OPT                 PIC 9(04).              01740014
                                                                        01760000
       01  B1-TABLE-AREA.                                               01761000
           03  B1-TABLE OCCURS 500 TIMES.                               01762000
               05  B1-CL-NO                 PIC 9(04).                  01763014
               05  B1-CLI-NAME              PIC X(30).                  01764000
                                                                        01765000
       01  B1-WORK-TABLE-AREA.                                          01770000
           03  B1-WRK-TABLE.                                            01780000
LRM001         05  FILLER                       PIC X.                  01781016
               05  B1-WRK-ADP-CL-NO             PIC 9(03).              01790000
               05  B1-WRK-NAME                  PIC X(30).              01810000
                                                                        01900000
           EJECT                                                        01910000
       COPY BPDATESC.                                                   01920000
           EJECT                                                        01930000
       COPY BHINFO.                                                     01940000
       COPY BHACAT.                                                     01950000
           EJECT                                                        01960000
       COPY STUBCPY.                                                    01970000
           EJECT                                                        01980000
                                                                        01990000
           EXEC SQL                                                     02000000
              INCLUDE SQLCA                                             02010000
           END-EXEC.                                                    02020000
           EJECT                                                        02030000
           EXEC SQL                                                     02040000
              INCLUDE VTRNFR                                            02050000
           END-EXEC.                                                    02060000
           EJECT                                                        02070000
           EXEC SQL                                                     02080000
             DECLARE  TFRCRSR  CURSOR FOR                               02090000
               SELECT                                                   02100000
                   ACAT_CONTROL_NBR                                     02120000
                  ,RCV_NBR                                              02130000
                  ,BRANCH_CD                                            02140000
                  ,ACCT_CD                                              02150000
                  ,STTS_CD                                              02160000
                  ,DSTBN_SIDE_CD                                        02161000
                  ,TRNFR_TYPE_CD                                        02162000
               FROM                                                     02170000
                   VTRNFR                                               02180000
               WHERE CLIENT_NBR = :DCLVTRNFR.CLIENT-NBR                 02181000
                 AND DSTBN_SIDE_CD = 'D'                                02182000
                 AND TRNFR_TYPE_CD = 'FUL'                              02200000
                 AND ((STTS_CD = '100') OR                              02210000
                      (STTS_CD = '110') OR                              02210100
                      (STTS_CD = '140') OR                              02210200
                      (STTS_CD = '200') OR                              02210300
                     ((STTS_CD > '200') AND                             02211000
                      (STTS_CD < '310')))                               02220000
               ORDER BY                                                 02230000
                   BRANCH_CD                                            02250000
                  ,ACCT_CD                                              02260000
                  ,ACAT_CONTROL_NBR                                     02270000
LRM001         FOR READ ONLY WITH UR                                    02271000
           END-EXEC.                                                    02280000
      ***************************************************************** 02290000
       LINKAGE SECTION.                                                 02300000
      ***************************************************************** 02310000
       01  PARM-AREA.                                                   02320000
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.        02330000
           05  PARM-INFO.                                               02340000
               10  PARM-STREAM              PIC X.                      02360000
                   88  PARM-STREAM-VALID          VALUES ARE            02370000
                       'A' THRU 'Z' '0' THRU '9'.                       02380000
                                                                        02420000
           EJECT                                                        02430000
       PROCEDURE DIVISION USING PARM-AREA.                              02440000
       MAINLINE SECTION.                                                02450000
           COPY MSGCOBO.                                                02460000
                                                                        02470000
           PERFORM  100-HOUSEKEEPING.                                   02510000
                                                                        02530000
           PERFORM  200-INIT-B1-LOOP.                                   02540000
                                                                        02560000
           PERFORM 400A-WRITE-REC-HDR                                   02561000
                                                                        02562000
           IF B1-TBL-CNT = ZERO AND O-SUB1 = 0                          02570000
             GO TO 0005-ENDJOB                                          02580000
           END-IF.                                                      02590000
                                                                        02600000
LRM001     PERFORM 250-PROCESS-CLIENT                                   02610000
                VARYING SUB FROM 1 BY 1                                 02620006
                UNTIL SUB > B1-TBL-CNT.                                 02630004
                                                                        02631000
           IF SAVE-CLI > 0                                              02671000
TCK001        PERFORM 400C-WRITE-CLI-TRL                                02680000
           END-IF.                                                      02691000
                                                                        02700000
       0005-ENDJOB.                                                     02740000
                                                                        02741000
           PERFORM 400D-WRITE-REC-TRL.                                  02742000
                                                                        02743000
           PERFORM  900-ENDJOB-ROUTINE.                                 02750000
                                                                        02770000
           GOBACK.                                                      02780000
                                                                        02790000
           EJECT                                                        02800000
      ******************                                                02810000
       100-HOUSEKEEPING.                                                02820000
      ******************                                                02830000
                                                                        02840000
           IF PARM-LENGTH > 0                                           02850000
             CONTINUE                                                   02860000
           ELSE                                                         02870000
             DISPLAY 'PARM LENGTH IS INVALID, LENGTH MUST BE 1 CHAR '   02880000
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        02890000
             DISPLAY 'PROGRAM ' PGM-NAME  ' ABENDED '                   02900000
             CALL ABEND   USING ABEND-CODE-2000                         02910000
           END-IF.                                                      02911000
                                                                        02920000
           IF PARM-STREAM-VALID                                         02930000
             CONTINUE                                                   02940000
           ELSE                                                         02950000
             DISPLAY 'PARM INVALID, MUST BE 1 CHAR ALPHANUMERIC'        02960000
             DISPLAY 'PARM ENTERED - ' PARM-INFO                        02970000
             DISPLAY 'PROGRAM ' PGM-NAME ' ABENDED '                    02980000
             CALL ABEND    USING ABEND-CODE-2000                        02990000
           END-IF.                                                      02991000
                                                                        03000000
           MOVE  PGM-NAME                TO BPDATES-CALLING-PGM.        03060000
           MOVE  'C'                     TO BPDATES-REQ-TYPE.           03070000
           CALL  BPDATES            USING BPDATES-PARAMETERS.           03080000
                                                                        03090000
           MOVE  BPD-PROC-DATE           TO  PROC-DATE.                 03100000
C          MOVE  BPD-PROC-DATE (1:2)     TO  WORK-DATE-MMDDCCYY (5:2)   03110000
Y          MOVE  BPD-PROC-DATE (3:2)     TO  WORK-DATE-MMDDCCYY (7:2)   03111000
M          MOVE  BPD-PROC-DATE (5:2)     TO  WORK-DATE-MMDDCCYY (1:2)   03120000
D          MOVE  BPD-PROC-DATE (7:2)     TO  WORK-DATE-MMDDCCYY (3:2)   03121000
                                                                        03130000
           DISPLAY 'PROCESS DATE = ' BPD-PROC-DATE.                     03140000
                                                                        03150000
           OPEN OUTPUT EXTRACT-FILE OPTEXT-FILE.                        03160000
                                                                        03170000
           INITIALIZE B1-TABLE-AREA.                                    03320000
           INITIALIZE B1-TABLE-AREA-OPTION.                             03321000
           INITIALIZE B1-WORK-TABLE-AREA.                               03330000
                                                                        03340000
           MOVE ZEROS TO EXT-REC-CNT, EXT-TRL-CNT.                      03341000
                                                                        03342000
           EJECT                                                        03360000
      ***************                                                   03370000
       200-INIT-B1-LOOP.                                                03380000
      ***************                                                   03390000
                                                                        03400000
           MOVE 0                      TO  B1-TBL-CNT.                  03430000
           MOVE 0                      TO  O-SUB1                       03431000
           ADD  1                      TO  B1-SUB.                      03440000
           PERFORM  UNTIL  B1-SUB  >  500                               03450000
                                                                        03460000
             MOVE  ' '                    TO  BH-BROKER-HEADER-INFO     03470000
             MOVE  B1-SUB                 TO  BH-BROKER-NUMBER-N        03480000
             MOVE  '010'                  TO  BH-LOGICAL-RECORD-CODE    03490000
             MOVE  ' '                    TO  BH-B2-INFO-ID             03500000
             CALL   GETB1V              USING BH-BROKER-HEADER-INFO     03510000
             END-CALL                                                   03520000
                                                                        03530000
             IF  BH-BROKER-ACTIVE                                       03540000
                                                                        03550000
               IF  (PARM-STREAM  =  BH-BROKER-MINI-MAXI-INDICATOR) OR   03560000
                   (PARM-STREAM  =  BH-BROKER-MINI-MAXI-SUBGROUP)       03561000
                   MOVE  ' '                 TO  BH-ACAT-INFO           03570000
                   MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N     03580000
                   MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE 03590000
                   MOVE  '434500'            TO  BH-B2-INFO-ID          03600000
                   CALL   GETB1V           USING BH-BROKER-HEADER-INFO, 03610000
                                                 BH-ACAT-INFO           03620000
                   END-CALL                                             03630000
                 IF  BH-ACAT-ACTIVE                                     03640000
      ** NEW B1 CARD - 434665                                           03650000
TCK001            IF   BH-ACAT-FOREIGN-CUR-POS-BAL = '1'                03660000
                       ADD 1       TO B1-TBL-CNT                        03670000
                       MOVE  B1-SUB                              TO     03680000
                             B1-CL-NO                   (B1-TBL-CNT)    03690000
                       MOVE BH-BROKER-NAME                       TO     03700000
                             B1-CLI-NAME                (B1-TBL-CNT)    03710000
                  END-IF                                                03731000
      ** NEW B1 CARD - 434690                                           03731100
                  IF   BH-ACAT-EXPIRING-OPT-DAYS > 0                    03731200
                       ADD 1       TO O-SUB1                            03731300
                       MOVE  B1-SUB    TO                               03731400
                                          B1-CL-NO-OPT  (O-SUB1)        03731500
                  END-IF                                                03731800
                 END-IF                                                 03731900
               END-IF                                                   03732000
             END-IF                                                     03750000
             ADD  1                      TO  B1-SUB                     03760000
           END-PERFORM.                                                 03770000
                                                                        03780000
           IF  B1-TBL-CNT =  0                                          03790000
               DISPLAY  'ZERO STREAM CLIENTS ARE B1-ACAT CLIENTS'       03800000
               DISPLAY  'INPUT ACAT FILE WILL BE BYPASSED'              03810000
           END-IF.                                                      03820000
                                                                        03830000
           IF  O-SUB1     =  0                                          03840000
               DISPLAY  'ZERO STREAM CLIENTS ARE B1-ACAT OPTIONS'       03841000
               DISPLAY  'INPUT ACAT FILE WILL BE BYPASSED'              03842000
           END-IF.                                                      03843000
                                                                        03844000
LRM001 250-PROCESS-CLIENT.                                              03844200
LRM001     MOVE B1-CL-NO (SUB) TO CLIENT-NBR.                           03844412
LRM001     DISPLAY 'OPEN CURSOR FOR CLIENT ' CLIENT-NBR.                03844510
LRM001                                                                  03844610
LRM001     EXEC SQL                                                     03844800
LRM001        OPEN TFRCRSR                                              03844900
LRM001     END-EXEC.                                                    03845000
LRM001     IF SQLCODE = 0                                               03845100
LRM001        MOVE 'N' TO ACAT-EOF-SW                                   03845200
LRM001        PERFORM 300-PROCESS-VTRNFR  THRU                          03845400
LRM001                300-PROCESS-VTRNFR-EXIT                           03845500
LRM001             UNTIL ACAT-EOF                                       03845600
            ELSE                                                        03845704
              PERFORM  999-SQL-ERROR                                    03847004
              MOVE 'DB2 CURSOR STATEMENT OPEN ERROR' TO W-ERR-MSG-OUT   03847104
              MOVE SQLCODE TO W-SQLCODE-OUT                             03847204
              DISPLAY ' '                                               03847304
              DISPLAY W-DB2-ERR-MSG-OUT                                 03847404
              DISPLAY '** PROGRAM ' PGM-NAME ' ABENDED '                03847504
              CALL ABEND  USING ABEND-CODE-4000                         03847604
           END-IF.                                                      03847704
                                                                        03847804
LRM001     EXEC SQL                                                     03847904
LRM001        CLOSE TFRCRSR                                             03848004
LRM001     END-EXEC.                                                    03848104
                                                                        03849000
       300-PROCESS-VTRNFR.                                              03870000
                                                                        03880000
           EXEC SQL                                                     03890000
              FETCH                                                     03900000
                 TFRCRSR                                                03910000
              INTO                                                      03920000
                :ACAT-CONTROL-NBR                                       03940008
               ,:RCV-NBR                                                03950000
               ,:BRANCH-CD                                              03960000
               ,:ACCT-CD                                                03970000
               ,:STTS-CD                                                03980000
               ,:DSTBN-SIDE-CD                                          03981000
               ,:TRNFR-TYPE-CD                                          03982000
           END-EXEC.                                                    03990000
                                                                        04000000
           IF SQLCODE = 0                                               04010000
              ADD 1 TO ACAT-EXT-RECS                                    04020000
           ELSE                                                         04040000
           IF SQLCODE = +100                                            04050000
              SET ACAT-EOF   TO TRUE                                    04060000
              GO TO 300-PROCESS-VTRNFR-EXIT                             04070000
           ELSE                                                         04080000
              PERFORM  999-SQL-ERROR                                    04090000
              MOVE 'DB2 CURSOR STATEMENT FETCH ERROR' TO W-ERR-MSG-OUT  04100000
              MOVE SQLCODE TO W-SQLCODE-OUT                             04110000
              DISPLAY ' '                                               04120000
              DISPLAY W-DB2-ERR-MSG-OUT                                 04130000
              DISPLAY '** PROGRAM ' PGM-NAME ' ABENDED '                04140000
              CALL ABEND  USING ABEND-CODE-4004                         04150000
           END-IF.                                                      04160000
                                                                        04170000
           IF CLIENT-NBR (2:3) = SAVE-CLI                               04180000
              PERFORM 400-WRITE-EXTRACT                                 04190000
              ADD 1 TO CLI-EXT-RECS                                     04201000
                       ACAT-WRT-RECS                                    04201100
           ELSE                                                         04220000
              IF SAVE-CLI > 0                                           04230000
                 PERFORM 400C-WRITE-CLI-TRL                             04240000
                 MOVE ZERO TO CLI-EXT-RECS                              04251000
              END-IF                                                    04260000
              MOVE 'N' TO EXT-HDR-SW                                    04280000
              MOVE 'N' TO B1-TABLE-SEARCH-STATUS                        04290000
              MOVE ' ' TO B1-TABLE-SEARCH-SWITCH                        04300000
1ST           PERFORM 500-SEARCH-B1-TABLE THRU                          04310000
                      500-SEARCH-B1-TABLE-EXIT                          04320000
                        VARYING B1-SUB1 FROM 1 BY 1                     04330000
                         UNTIL B1-SEARCH-END                            04340000
              IF B1-ENTRY-FOUND                                         04350000
                 MOVE CLIENT-NBR (2 : 3) TO ACAT-EXTRACT-CLI            04370000
                                            SAVE-CLI                    04380000
                 PERFORM 400B-WRITE-CLI-HDR                             04390000
                 PERFORM 400-WRITE-EXTRACT                              04410000
                 ADD 1 TO CLI-EXT-RECS                                  04412000
????                      ACAT-WRT-RECS                                 04412100
              ELSE                                                      04420000
                 MOVE ZERO               TO ACAT-EXTRACT-CLI            04421000
                                            SAVE-CLI                    04422000
                 MOVE CLIENT-NBR (2 : 3) TO ACAT-BYPASS-CLI             04430000
              END-IF                                                    04450000
           END-IF.                                                      04460000
                                                                        04470000
           IF   STTS-CD < '300'                                         04470100
            IF CLIENT-NBR (2:3) = SAVE-CLI-OPT                          04471000
              PERFORM 410-WRITE-EXTOPT                                  04472000
            ELSE                                                        04476000
              PERFORM VARYING O-SUB2  FROM 1 BY 1                       04479600
                UNTIL O-SUB2 > O-SUB1                                   04479900
                   OR  CLIENT-NBR =  B1-CL-NO-OPT (O-SUB2)              04480014
              END-PERFORM                                               04480100
              IF O-SUB2 NOT > O-SUB1                                    04480200
                 MOVE CLIENT-NBR (2 : 3) TO SAVE-CLI-OPT                04480400
                                                                        04480500
                 PERFORM 410B-WRITE-CLI-HDR                             04480600
                 PERFORM 410-WRITE-EXTOPT                               04480800
              ELSE                                                      04481200
                 MOVE ZERO               TO SAVE-CLI-OPT                04481300
              END-IF                                                    04481600
            END-IF                                                      04481700
           END-IF.                                                      04481800
                                                                        04481900
       300-PROCESS-VTRNFR-EXIT.                                         04482000
           EXIT.                                                        04490000
           EJECT                                                        04500000
       400-WRITE-EXTRACT.                                               04510000
                                                                        04520000
           MOVE LOW-VALUES       TO EXT-REC                             04530000
           MOVE SAVE-CLI         TO EXT-CL                              04540000
           MOVE BRANCH-CD        TO EXT-BR                              04550000
           MOVE ACCT-CD          TO EXT-ACCT                            04560000
           MOVE ACAT-CONTROL-NBR TO EXT-ACAT-CNTL-NBR                   04570000
           MOVE RCV-NBR          TO EXT-ACAT-RCV-NBR                    04580000
           MOVE STTS-CD          TO EXT-ACAT-STTS-CD                    04590000
           WRITE EXTRACT-REC FROM EXT-REC.                              04600000
                                                                        04610000
       400A-WRITE-REC-HDR.                                              04650000
                                                                        04660000
           MOVE PGM-NAME            TO EXT-PGM-NAME.                    04680000
           MOVE WORK-DATE-MMDDCCYY  TO EXT-PROC-DATE.                   04690000
           WRITE EXTRACT-REC FROM EXT-REC-HDR.                          04700000
                                                                        04710000
       400B-WRITE-CLI-HDR.                                              04750000
                                                                        04760000
           MOVE ACAT-EXTRACT-CLI    TO EXT-HDR-CL.                      04780000
           MOVE B1-WRK-NAME         TO EXT-CLI-NAME.                    04800000
           WRITE EXTRACT-REC FROM EXT-CLI-HDR.                          04810000
                                                                        04820000
       400C-WRITE-CLI-TRL.                                              04860000
           MOVE SAVE-CLI         TO  EXT-TRL-CL.                        04880000
           MOVE CLI-EXT-RECS     TO  EXT-REC-CNT                        04890000
           WRITE EXTRACT-REC FROM EXT-CLI-TRL.                          04900000
           MOVE ZEROS            TO  EXT-REC-CNT.                       04901000
                                                                        04910000
                                                                        04940000
       400D-WRITE-REC-TRL.                                              04950000
                                                                        04960000
           MOVE ACAT-WRT-RECS     TO  EXT-TRL-CNT.                      04970000
           WRITE EXTRACT-REC FROM EXT-REC-TRL.                          04980000
                                                                        04990000
       410-WRITE-EXTOPT.                                                05011000
                                                                        05012000
           MOVE LOW-VALUES       TO EXT-REC                             05013000
           MOVE SAVE-CLI         TO EXT-CL                              05014000
           MOVE BRANCH-CD        TO EXT-BR                              05015000
           MOVE ACCT-CD          TO EXT-ACCT                            05016000
           MOVE ACAT-CONTROL-NBR TO EXT-ACAT-CNTL-NBR                   05017000
           MOVE RCV-NBR          TO EXT-ACAT-RCV-NBR                    05018000
           MOVE STTS-CD          TO EXT-ACAT-STTS-CD                    05019000
           WRITE OPTEXT-REC FROM EXT-REC.                               05019100
                                                                        05019200
       410B-WRITE-CLI-HDR.                                              05019300
                                                                        05019400
           MOVE SAVE-CLI-OPT        TO EXT-HDR-CL.                      05019500
           MOVE B1-WRK-NAME         TO EXT-CLI-NAME.                    05019600
           WRITE OPTEXT-REC  FROM EXT-CLI-HDR.                          05019700
                                                                        05019800
           EJECT                                                        05020000
       500-SEARCH-B1-TABLE.                                             05030000
                                                                        05040000
           IF B1-SUB1 > B1-TBL-CNT                                      05050000
             MOVE 'N'  TO  B1-TABLE-SEARCH-STATUS                       05060000
             MOVE 'Y'  TO  B1-TABLE-SEARCH-SWITCH                       05070000
             GO TO 500-SEARCH-B1-TABLE-EXIT.                            05080000
                                                                        05090000
           IF CLIENT-NBR = B1-CL-NO (B1-SUB1)                           05100012
             MOVE B1-TABLE (B1-SUB1) TO B1-WRK-TABLE                    05130000
             MOVE B1-SUB1  TO  B1-SUB1-SVE                              05140000
             MOVE 'Y'  TO  B1-TABLE-SEARCH-STATUS                       05150000
             MOVE 'Y'  TO  B1-TABLE-SEARCH-SWITCH                       05160000
             GO TO 500-SEARCH-B1-TABLE-EXIT.                            05170000
                                                                        05180000
       500-SEARCH-B1-TABLE-EXIT. EXIT.                                  05190000
                                                                        05200000
                                                                        05210000
       900-ENDJOB-ROUTINE.                                              05220000
                                                                        05230000
           DISPLAY '************** CAT885 CONTROL TOTALS *************'.05240000
                                                                        05250000
           DISPLAY 'ACAT DETAIL RCDS EXTRACTED '     ACAT-EXT-RECS.     05260000
           DISPLAY 'ACAT RCDS BYPASSED         '     ACAT-BYP-RECS.     05270000
           DISPLAY 'ACAT TOTAL RECORDS WRITTEN '     ACAT-WRT-RECS.     05280000
                                                                        05290000
           CLOSE EXTRACT-FILE OPTEXT-FILE.                              05300000
                                                                        05310000
       999-SQL-ERROR.                                                   05340000
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  05350000
                                    W-DB2-MESSAGE-LEN.                  05360000
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        05370000
             UNTIL W-DB2-IDX GREATER THAN 12                            05380000
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              05390000
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               05400000
                   END-IF                                               05410000
           END-PERFORM.                                                 05420000
                                                                        05430000
