000001* PDX    - CAT885C  C0348882 12/06/13 06:57:56 TBCHKOP            00001004
CSG001* SSR 91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.                 00001102
000001* PDX    - CAT885C  C0208185 07/08/04 15:39:09 TBYOHON            00001200
000001* PDX    - CAT885C  C0171522 04/04/02 14:10:46 TBLAMUR            00001300
000011 IDENTIFICATION DIVISION.                                         00001400
000020 PROGRAM-ID. CAT885C.                                             00002000
000030*---------------------------------------------------------------* 00003000
000060*  THIS PROGRAM - READ THE EXTRACT FILE FROM CAT885A,           * 00006000
000070*                 MATCH WITH B212 RECORD AND                    * 00007000
000080*                 WRITE REPORT OUT BASED ON FOLLOWING SELECTION * 00008000
000090*                 CRITERIA,                                     * 00009000
000100*     ANY OPTION EXPIRING WITHIN THE NN DAYS FROM B1            * 00010000
000200*     AND ACCOUNT IS BEING DELIVERED OUT                        * 00020000
000300*     FOR REQUEST TO REVIEW STATUS                              * 00030000
000400*---------------------------------------------------------------* 00040000
000400*  CONVERTED ZGETB212 TO ZGETCHOL              -----------------* 00041000
000400*---------------------------------------------------------------* 00042000
000500 ENVIRONMENT DIVISION.                                            00050000
000600 INPUT-OUTPUT SECTION.                                            00060000
000700 FILE-CONTROL.                                                    00070000
000800     SELECT  EXTR-FILE           ASSIGN  TO  EXTRACT.             00080000
000900     SELECT  REPT-FILE           ASSIGN  TO  ACTFCRP.             00090000
001000                                                                  00100000
001100 DATA DIVISION.                                                   00110000
001200 FILE SECTION.                                                    00120000
001300 FD  REPT-FILE          RECORDING MODE IS F                       00130000
001400     BLOCK CONTAINS 0 RECORDS                                     00140000
001500     LABEL RECORDS ARE STANDARD.                                  00150000
001600 01  REPT-REC            PIC X(143).                              00160000
001700 FD  EXTR-FILE          RECORDING MODE IS F                       00170000
001800     BLOCK CONTAINS 0 RECORDS                                     00180000
001900     LABEL RECORDS ARE STANDARD.                                  00190000
002000 01  EXTR-REC                   PIC X(80).                        00200000
002100                                                                  00210000
002200                                                                  00220000
002500***************************************************************** 00250000
002600 WORKING-STORAGE  SECTION.                                        00260000
002700***************************************************************** 00270000
002800 01  PGM-NAME                         PIC X(08)  VALUE 'CAT885C'. 00280000
002900                                                                  00290000
003000     COPY STUBCPY.                                                00300000
003010     03  ZGETCHOL               PIC X(8) VALUE 'ZGETCHOL'.        00301000
002900                                                                  00302000
003100 01  WS-REPT-AREA.                                                00310000
003200     05  WS-REPT-DATA           PIC X(133).                       00320000
003300     05  REPT-CLI                PIC 9(3) COMP-3.                 00330000
003400     05  REPT-CTL                PIC X(8) VALUE SPACES.           00340000
003500 01  WS-ABORT-CODE             PIC S9(4) COMP  VALUE +1100.       00350000
003600                                                                  00360000
003700***------------------------------------------------------------***00370000
003800***-           I N P U T   R E C O R D    A R E A S           -***00380000
003900***------------------------------------------------------------***00390000
004000 01  GETCHOL-PARM.                                                00400000
004100     COPY HOLDPARM REPLACING ==:GETCHOL:==  BY  ==GETCHOL==.      00410000
004200                                                                  00420000
004300 01  IN-HOLDER-REC.                                               00430000
004300     COPY CUSHOL                                                  00431000
004300             REPLACING ==:CUSHOL:== BY ==INPHOL==.                00432000
004300                                                                  00435000
004400 01  EXTR-AREA.                                                   00440000
004500     05  EXTR-REC-DTL.                                            00450000
004600         10 PROCESS-KEY.                                          00460000
004700            15 EXTR-CLIENT-N      PIC 9(3).                       00470000
004800            15 EXTR-CLIENT REDEFINES  EXTR-CLIENT-N   PIC X(3).   00480000
004900               88  FILE-HEADER        VALUE X'000000'.            00490000
005000               88  FILE-TRAILER       VALUE '999'.                00500000
005100            15 EXTR-BR-ACCT.                                      00510000
005200               20 EXTR-BRANCH        PIC X(3).                    00520000
005300               20 EXTR-ACCOUNT       PIC X(5).                    00530000
005400         10 EXTR-ACAT-CNTL-NBR    PIC X(14).                      00540000
005500         10 EXTR-ACAT-RCV-NBR     PIC X(4).                       00550000
005600         10 EXTR-ACAT-STTS-CD     PIC X(3).                       00560000
005700         10 FILLER                PIC X(48).                      00570000
005800     05  EXTR-REC-HDR REDEFINES EXTR-REC-DTL.                     00580000
005900         10 FILLER               PIC X(51).                       00590000
006000         10 EXTR-PROC-DATE.                                       00600000
006100             15 EXTR-MM          PIC X(2).                        00610000
006200             15 EXTR-DD          PIC X(2).                        00620000
006300             15 EXTR-CC          PIC X(2).                        00630000
006400             15 EXTR-YY          PIC X(2).                        00640000
006500         10 FILLER               PIC X(21).                       00650000
006600     05  EXTR-REC-TRL REDEFINES EXTR-REC-DTL.                     00660000
006700         10 FILLER               PIC X(46).                       00670000
006800         10 EXTR-TRL-CNT         PIC 9(7).                        00680000
006900         10 FILLER               PIC X(27).                       00690000
007000                                                                  00700000
007100 COPY BHINFO.                                                     00710000
007500 COPY BHACAT.                                                     00750000
008600 COPY GETNACOB.                                                   00860000
008610                                                                  00861000
008700 01  GETNA-SEGMENT-INCLUDES.                                      00870000
008800 COPY NASEGHDR.                                                   00880000
008900 COPY NASEGPPA.                                                   00890000
009000 COPY NASEGPPB.                                                   00900000
009100 COPY NASEGPPI.                                                   00910000
009200 COPY NNASGPPN.                                                   00920000
009300 COPY NASEGEND.                                                   00930000
009310                                                                  00931000
009400                                                                  00940000
009500 01  PROGRAM-SWITCHES.                                            00950000
009600     05  END-OF-EXTR-SW               PIC X(1) VALUE 'N'.         00960000
009700         88 EXTR-EOF                  VALUE 'Y'.                  00970000
011200     05  SUBHEADINGS-PRINT-SW             PIC X(01)  VALUE ' '.   01120000
011300         88  SUBHEADINGS-PRINTED                     VALUE 'Y'.   01130000
011400         88  SUBHEADINGS-NOT-PRINTED                 VALUE 'N'.   01140000
012000 01  COUNTERS.                                                    01200000
012100     05  PAGE-CNT                 PIC 9(6) COMP-3 VALUE 0.        01210000
012200     05  LINE-LIMT                PIC 99   COMP-3 VALUE 55.       01220000
012300     05  LINE-CNT                 PIC 99   COMP-3 VALUE 0.        01230000
012400     05  TEST-LINE-CNT            PIC 99   COMP-3 VALUE 0.        01240000
012500     05  CLIENT-PROC-CNT          PIC S9(9) COMP-3 VALUE 0.       01250000
012600     05  PROC-ACCT-CNT            PIC S9(9) COMP-3 VALUE 0.       01260000
012700     05  READ-EXTR-CLIENT-CNT     PIC S9(9) COMP-3 VALUE 0.       01270000
012800     05  EXTR-READ-CNT            PIC S9(11) COMP-3 VALUE 0.      01280000
013100     05  CPH-PROC-CNT             PIC S9(9) COMP-3 VALUE 0.       01310000
013200     05  CPT-PROC-CNT             PIC S9(9) COMP-3 VALUE 0.       01320000
013300     05  CAH-PROC-CNT             PIC S9(9) COMP-3 VALUE 0.       01330000
013400     05  REC-CNT-DISP             PIC ZZ,ZZZ,ZZZ,ZZ9.             01340000
013500 01  INTERMEDIATE-VARIABLES.                                      01350000
014200     05 HOLD-EXTR-CLIENT-NAME     PIC X(30).                      01420000
014300     05 HOLD-KEY.                                                 01430000
014400       10 HOLD-EXTR-CLIENT          PIC 9(3)  VALUE 0.            01440000
014500       10 HOLD-EXTR-BR-ACCT.                                      01450000
014600         15  HOLD-EXTR-BRANCH      PIC X(3)  VALUE '000'.         01460000
014700         15  HOLD-EXTR-ACCOUNT     PIC X(5)  VALUE '00000'.       01470000
014710     05 CHOL-KEY.                                                 01471000
014720       10 CHOL-CLIENT-KEY      PIC 9(3)  VALUE 0.                 01472000
014730       10 CHOL-BR-ACCT-KEY.                                       01473000
014740         15  CHOL-BRANCH-KEY  PIC X(3)  VALUE '000'.              01474000
014750         15  CHOL-ACCOUNT-KEY PIC X(5)  VALUE '00000'.            01475000
015200     05 WS-SUB                    PIC 9(4) COMP.                  01520000
015300                                                                  01530000
015400***-------------------------------------------------------------- 01540000
015500***---    REPORT HEADINGS AND SUBHEADINGS                         01550000
015600***-------------------------------------------------------------- 01560000
015700 01  HEAD1-LINE.                                                  01570000
015800     05  FILLER                    PIC X(1) VALUE '1'.            01580000
015900     05  FILLER                    PIC X(10) VALUE 'CAT885C   '.  01590000
016000     05  FILLER                    PIC X(7)  VALUE 'CLIENT '.     01600000
016100     05  HEAD1-CLIENT-NUM          PIC 999.                       01610000
016200     05  FILLER                    PIC X(03) VALUE ' - '.         01620000
016300     05  HEAD1-CLIENT-NAME         PIC X(30) VALUE SPACES.        01630000
016400     05  FILLER                    PIC X(02) VALUE SPACES.        01640000
016500     05  FILLER                    PIC X(29) VALUE                01650000
016600          'ACATS EXPIRING OPTION REPORT'.                         01660000
016700     05  FILLER                    PIC X(12) VALUE 'WHITHIN '.    01670000
016800     05  HEAD1-DAYS                PIC 99    VALUE 0.             01680000
016900     05  FILLER                    PIC X(6)  VALUE ' DAYS '.      01690000
017000     05  HEAD1-DATE-MM             PIC 99.                        01700000
017100     05  FILLER                    PIC X VALUE '/'.               01710000
017200     05  HEAD1-DATE-DD             PIC 99.                        01720000
017300     05  FILLER                    PIC X VALUE '/'.               01730000
017400     05  HEAD1-DATE-YY             PIC 99.                        01740000
017500     05  FILLER                    PIC X(07) VALUE SPACES.        01750000
017600     05  FILLER                    PIC X(5)  VALUE 'PAGE'.        01760000
017700     05  HEAD1-PAGE-NUM            PIC ZZZZZ9.                    01770000
017800     05  FILLER                    PIC X(02) VALUE SPACES.        01780000
017900 01  SUBHD1-LINE.                                                 01790000
018000     05 FILLER              PIC X(1) VALUE '0'.                   01800000
018100     05 FILLER              PIC X(8)  VALUE 'ACCT #: '.           01810000
018200     05 SUBHD1-BR           PIC X(3).                             01820000
018300     05 FILLER              PIC X   VALUE '-'.                    01830000
018400     05 SUBHD1-ACCT         PIC X(5).                             01840000
018500     05 FILLER              PIC X(3)  VALUE SPACES.               01850000
018600     05 FILLER              PIC X(6)  VALUE 'NAME: '.             01860000
018700     05 SUBHD1-NAME         PIC X(20).                            01870000
018800     05 FILLER              PIC X(3)  VALUE SPACES.               01880000
018900     05 FILLER              PIC X(16)  VALUE 'ACAT CONTROL #: '.  01890000
019000     05 SUBHD1-ACAT-CTL     PIC X(14).                            01900000
019100     05 FILLER              PIC X(6)  VALUE SPACES.               01910000
019200     05 FILLER              PIC X(15)  VALUE 'CONTRA BROKER: '.   01920000
019300     05 SUBHD1-ACAT-RCV-NBR PIC X(4).                             01930000
019400     05 FILLER              PIC X(28)  VALUE SPACES.              01940000
023100***-------------------------------------------------------------- 02310000
023200***-    DETAIL LINES                                              02320000
023300***-------------------------------------------------------------- 02330000
023400 01  DETAIL-LINE.                                                 02340000
023500     05 FILLER        PIC X(1) VALUE SPACE.                       02350000
023600     05 DETAIL-GROUP1.                                            02360000
023700        10 FILLER          PIC X(3)  VALUE SPACES.                02370000
023800        10 DETAIL-CURR-SYM PIC X(3) VALUE SPACES.                 02380000
023900        10 FILLER          PIC X(3)   VALUE SPACES.               02390000
024000        10 DETAIL-TYPE     PIC X(1).                              02400000
024100        10 FILLER          PIC X(3)   VALUE SPACES.               02410000
024200        10 DETAIL-ADP-NO   PIC X(07).                             02420000
024300        10 FILLER          PIC X(6)   VALUE ' T/D '.              02430000
024400        10 DETAIL-CPH-POS  PIC ZZZ,ZZZ,ZZZ,ZZ9-                   02440000
024500                                    BLANK WHEN ZERO.              02450000
024600        10 FILLER          PIC X(6)   VALUE ' S/D '.              02460000
024700        10 DETAIL-CPH-SD   PIC ZZZ,ZZZ,ZZZ,ZZ9-                   02470000
024800                                    BLANK WHEN ZERO.              02480000
024900        10 FILLER          PIC X(3)   VALUE SPACES.               02490000
025000     05 DETAIL-SEC-DESC    PIC X(30).                             02500000
025100     05 FILLER             PIC X(34) VALUE SPACES.                02510000
025200                                                                  02520000
025300 01  DETAIL-LINE2.                                                02530000
025400     05 FILLER        PIC X(1) VALUE SPACE.                       02540000
025500     05 FILLER.                                                   02550000
025600        10 FILLER          PIC X(3)  VALUE SPACES.                02560000
025700        10 FILLER          PIC X(3) VALUE SPACES.                 02570000
025800        10 FILLER          PIC X(3)   VALUE SPACES.               02580000
025900        10 FILLER          PIC X(1) VALUE SPACE.                  02590000
026000        10 FILLER          PIC X(3)   VALUE SPACES.               02600000
026100        10 FILLER          PIC X(07) VALUE SPACE.                 02610000
026200        10 FILLER          PIC X(6)   VALUE ' '.                  02620000
026300        10 FILLER          PIC X(16) VALUE SPACE.                 02630000
026500        10 FILLER          PIC X(6)   VALUE '  '.                 02650000
026510        10 FILLER          PIC X(16) VALUE SPACES.                02651000
026530        10 FILLER          PIC X(3)   VALUE SPACES.               02653000
026540     05 DETAIL-SEC-DESC2   PIC X(30).                             02654000
026550     05 FILLER             PIC X(34) VALUE SPACES.                02655000
026560                                                                  02656000
026600 01  EMPTY-LINE.                                                  02660000
026700     05  FILLER                    PIC X(01) VALUE ' '.           02670000
026800     05  FILLER                    PIC X(33) VALUE SPACES.        02680000
026900     05  FILLER                    PIC X(09) VALUE ALL '*'.       02690000
027000     05  FILLER                    PIC X(44) VALUE                02700000
027100          'NO OPTION EXPINRING WITHIN TIME PERIOD'.               02710000
027200     05  FILLER                    PIC X(09) VALUE ALL '*'.       02720000
027300     05  FILLER                    PIC X(37) VALUE SPACES.        02730000
027400                                                                  02740000
028100 01  DATE-VARIABLES.                                              02810000
028200     05  CURRENT-DATE-WS.                                         02820000
028300         10  CC                    PIC X(2).                      02830000
028400         10  YY                    PIC X(2).                      02840000
028500         10  MM                    PIC X(2).                      02850000
028600         10  DD                    PIC X(2).                      02860000
028610     05  WS-DATE-N      REDEFINES CURRENT-DATE-WS PIC 9(8).       02861000
028700     05  PROC-DATE-MMDDCCYY.                                      02870000
028800         10  PROC-DATE-MM               PIC X(2).                 02880000
028900         10  PROC-DATE-DD               PIC X(2).                 02890000
029000         10  PROC-DATE-CC               PIC X(2).                 02900000
029100         10  PROC-DATE-YY               PIC X(2).                 02910000
029110     05  WS-OPTION-EXP-DATE    PIC 9(8) VALUE 0.                  02911000
029120     05  WS-NUM-EXP-DAYS       PIC 9(3) VALUE 0.                  02912000
029200     COPY LKDTSRCH.                                               02920000
029210     COPY BPDATESC.                                               02921000
029300                                                                  02930000
029400                                                                  02940000
029500***-------------------------------------------------------------- 02950000
029600***-    PROCEDURE DIVISION                                        02960000
029700***-------------------------------------------------------------- 02970000
029800 PROCEDURE DIVISION.                                              02980000
029900                                                                  02990000
030000     COPY MSGCOBO.                                                03000000
030100                                                                  03010000
030200     PERFORM 0000-INIT-RTN.                                       03020000
030300                                                                  03030000
030400     PERFORM 1000-MAIN-PROCESSING-RTN                             03040000
030500            UNTIL EXTR-EOF                                        03050000
030600                                                                  03060000
030700     PERFORM 9000-HOUSEKEEPING.                                   03070000
030800                                                                  03080000
030900     GOBACK.                                                      03090000
031000                                                                  03100000
031100                                                                  03110000
031200 0000-INIT-RTN.                                                   03120000
031300     OPEN OUTPUT  REPT-FILE                                       03130000
031400          INPUT   EXTR-FILE.                                      03140000
031401                                                                  03140100
031500     MOVE PGM-NAME TO BPDATES-CALLING-PGM                         03150000
031600     SET LNKDATZ-REQUEST TO TRUE                                  03160000
031700     CALL BPDATES USING BPDATES-PARAMETERS                        03170000
031900     IF BPD-VALID-RETURN                                          03190000
032000         MOVE BPD-PROC-DATE TO CURRENT-DATE-WS                    03200000
032100         MOVE MM TO HEAD1-DATE-MM                                 03210000
032200         MOVE DD TO HEAD1-DATE-DD                                 03220000
032300         MOVE YY TO HEAD1-DATE-YY                                 03230000
032400         DISPLAY 'CAT885C: PROCESS DATE = ' BPD-PROC-DATE         03240000
032500     ELSE                                                         03250000
032600        DISPLAY 'INVALID BPDATES RETURN CODE: '                   03260000
032700            BPDATES-RETURN-CODE                                   03270000
032800        CALL ABEND USING WS-ABORT-CODE                            03280000
032900     END-IF.                                                      03290000
033000                                                                  03300000
033100     PERFORM 1050-READ-EXTRACT-FILE.                              03310000
033200     MOVE 'A'                 TO GETCHOL-VERSION                  03320000
033200     MOVE 'Q'                 TO GETCHOL-ACCESS                   03330000
033200     MOVE BPD-PROC-DATE       TO GETCHOL-DATE                     03340000
033200     SET GETCHOL-SEND-DATE    TO TRUE                             03340100
033200     MOVE 'R'                 TO GETCHOL-FUNCTION-CODE            03341000
033200     CALL ZGETCHOL  USING GETCHOL-PARM,                           03342000
033200                          IN-HOLDER-REC                           03343000
033200                                                                  03344000
033200     PERFORM 1300-READ-CHOL-RTN.                                  03345000
033500                                                                  03350000
033700 1000-MAIN-PROCESSING-RTN.                                        03370000
033800                                                                  03380000
033900     MOVE EXTR-CLIENT   TO HOLD-EXTR-CLIENT                       03390000
033910                           BH-BROKER-NUMBER-N                     03391000
033920                           HEAD1-CLIENT-NUM                       03392000
033930                           REPT-CLI.                              03393000
033940                                                                  03394000
034020     MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE         03402000
034030     MOVE  '434500'            TO  BH-B2-INFO-ID                  03403000
034040     CALL  GETB1V            USING BH-BROKER-HEADER-INFO,         03404000
034050                                   BH-ACAT-INFO.                  03405000
034051                                                                  03405100
034052     MOVE BH-BROKER-NAME  TO HEAD1-CLIENT-NAME                    03405200
034053************                                                      03405300
034060     DISPLAY 'BH-ACAT-EXPIRING-OPT-DAYS = '                       03406000
034061                            BH-ACAT-EXPIRING-OPT-DAYS.            03406100
034061     IF   BH-ACAT-ACTIVE                                          03406200
034062     AND  BH-ACAT-EXPIRING-OPT-DAYS  NUMERIC                      03406300
034063        MOVE BH-ACAT-EXPIRING-OPT-DAYS  TO HEAD1-DAYS             03406400
034064                                           WS-NUM-EXP-DAYS        03406500
034064     ELSE                                                         03406600
034064        MOVE ZEROS                      TO HEAD1-DAYS             03406700
034064                                           WS-NUM-EXP-DAYS.       03406800
034065     PERFORM GET-EXPIRING-DATE.                                   03406900
034066                                                                  03407000
034110     MOVE 0             TO PAGE-CNT                               03411000
034111                           CLIENT-PROC-CNT                        03411100
034120                                                                  03412000
034130     MOVE 55 TO LINE-CNT.                                         03413100
034140                                                                  03414000
034150     PERFORM 1050-READ-EXTRACT-FILE.                              03415000
034160                                                                  03416000
034300     PERFORM 1100-PROCESS-EXTR                                    03430000
034400        UNTIL    EXTR-CLIENT NOT = HOLD-EXTR-CLIENT               03440000
034500           OR    EXTR-EOF.                                        03450000
034600                                                                  03460000
034601     IF CLIENT-PROC-CNT > 0                                       03460100
034602        CONTINUE                                                  03460300
034603     ELSE                                                         03460400
034063        IF WS-NUM-EXP-DAYS > 0                                    03460500
034604           MOVE EMPTY-LINE   TO WS-REPT-DATA                      03460600
034605           PERFORM 4700-WRITE-REPORT                              03460700
034606     END-IF.                                                      03460800
034607                                                                  03460900
034610 GET-EXPIRING-DATE.                                               03461000
034611                                                                  03461100
034612     MOVE 'CAT885C'   TO BPDATES-CALLING-PGM                      03461200
034620     MOVE WS-DATE-N   TO BPDATES-BASE-DATE.                       03462000
034621     SET BPD-DISPLACEMENT-DATE-INFO TO TRUE.                      03462100
034622     SET BPD-DISP-PLUS              TO TRUE.                      03462200
034623     SET BPD-DISP-CALENDAR          TO TRUE.                      03462300
034630     MOVE WS-NUM-EXP-DAYS           TO BPDATES-DTSEARCH-DISP.     03463000
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE    03463103
CSG001* THE DEFAULT CALENDAR.                                           03463203
CSG001*    MOVE 'US'                      TO BPDATES-CALENDAR-TYPE      03463303
CSG001     MOVE '  '                      TO BPDATES-CALENDAR-TYPE      03463400
034640                                                                  03464000
034650     CALL  BPDATES  USING BPDATES-PARAMETERS.                     03465000
034651                                                                  03465100
034660     IF NOT BPD-VALID-RETURN                                      03466000
034670        DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE            03467000
034680        DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE          03468000
034690        DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE           03469000
034691        DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG            03469100
034693        CALL ABEND USING WS-ABORT-CODE                            03469300
034694     ELSE                                                         03469400
034695        MOVE BPD-DT-CALDATE TO WS-OPTION-EXP-DATE                 03469500
034696        DISPLAY 'BPD EXP DATE    = ' BPD-DT-CALDATE               03469600
034697                 ' FOR CLIENT '  EXTR-CLIENT                      03469700
034698     END-IF.                                                      03469800
034699                                                                  03469900
034700 1050-READ-EXTRACT-FILE.                                          03470000
034710                                                                  03471000
034800      READ EXTR-FILE INTO EXTR-AREA                               03480000
034900         AT END SET EXTR-EOF TO TRUE.                             03490000
035000      IF NOT EXTR-EOF                                             03500000
035100          ADD 1 TO EXTR-READ-CNT                                  03510000
035200      ELSE                                                        03520000
035300           IF EXTR-READ-CNT = 0                                   03530000
035400               DISPLAY ' CAT885C: EXTRACT FILE IS EMPTY! '        03540000
035500           END-IF                                                 03550000
035600      END-IF.                                                     03560000
035700                                                                  03570000
035800      IF FILE-TRAILER                                             03580000
035900            SET EXTR-EOF TO TRUE                                  03590000
036000      END-IF.                                                     03600000
036100                                                                  03610000
036200 1100-PROCESS-EXTR.                                               03620000
036210                                                                  03621000
036300     MOVE EXTR-BRANCH  TO HOLD-EXTR-BRANCH                        03630000
036310                          SUBHD1-BR                               03631000
036400     MOVE EXTR-ACCOUNT TO HOLD-EXTR-ACCOUNT                       03640000
036420                          SUBHD1-ACCT.                            03642000
036421     MOVE EXTR-ACAT-CNTL-NBR TO   SUBHD1-ACAT-CTL                 03642100
036422     MOVE EXTR-ACAT-RCV-NBR  TO   SUBHD1-ACAT-RCV-NBR             03642200
036423                                                                  03642300
036430     PERFORM 6900-GET-NAMES                                       03643000
036431                                                                  03643100
036432     MOVE EXTR-BR-ACCT TO REPT-CTL.                               03643200
036435                                                                  03643500
036460     SET SUBHEADINGS-NOT-PRINTED TO TRUE.                         03646000
036470                                                                  03647000
036471     PERFORM 1300-READ-CHOL-RTN                                   03647100
036472        UNTIL CHOL-KEY NOT < HOLD-KEY                             03647200
036473                                                                  03647300
036480     PERFORM 1200-PROCESS-CHOL                                    03648000
036490        UNTIL CHOL-KEY > HOLD-KEY.                                03649000
036500                                                                  03650000
036510     PERFORM 1050-READ-EXTRACT-FILE.                              03651000
036520                                                                  03652000
036600 1200-PROCESS-CHOL.                                               03660000
036601                                                                  03660100
036602      IF      INPHOL-REGULAR                                      03660200
036603         AND  INPHOL-CPH-SEC-SPIN          = 'M '                 03660300
036604         AND (INPHOL-CPH-TD-QTY       NOT = ZERO                  03660400
036605                 OR INPHOL-CPH-SD-QTY       NOT = ZERO )          03660500
036610         AND  INPHOL-CPH-MAT-DAT      NOT > WS-OPTION-EXP-DATE    03661000
036620             PERFORM 2000-PRINT-DETAIL                            03662000
036660      ELSE                                                        03666000
036700             PERFORM 1300-READ-CHOL-RTN                           03670000
036710      END-IF.                                                     03671000
036800                                                                  03680000
037700 1300-READ-CHOL-RTN.                                              03770000
037800                                                                  03780000
038000     CALL ZGETCHOL  USING GETCHOL-PARM,                           03800000
038400                          IN-HOLDER-REC                           03840000
038500                                                                  03850000
038510     IF GETCHOL-END-OF-FILE    OR                                 03851000
038600         INPHOL-CLIENT = HIGH-VALUES                              03860000
038700         SET GETCHOL-END-OF-FILE TO TRUE                          03870000
038800         MOVE HIGH-VALUES TO CHOL-KEY                             03880000
038900     ELSE                                                         03890000
039000       IF INPHOL-REGULAR                                          03900000
039600          MOVE INPHOL-CLIENT         TO CHOL-CLIENT-KEY           03960000
039610          MOVE INPHOL-BRANCH         TO CHOL-BRANCH-KEY           03961000
039700          MOVE INPHOL-ACCOUNT        TO CHOL-ACCOUNT-KEY          03970000
039811       ELSE                                                       03981100
040100         GO TO 1300-READ-CHOL-RTN                                 04010000
040200       END-IF                                                     04020000
040210     END-IF.                                                      04021000
040220                                                                  04022000
040230 2000-PRINT-DETAIL.                                               04023000
040240                                                                  04024000
040241     IF  LINE-CNT > 50                                            04024100
040242        PERFORM 3000-PAGE-BREAK                                   04024200
040244     END-IF                                                       04024400
040245                                                                  04024500
040250     IF NOT   SUBHEADINGS-PRINTED                                 04025000
040260       PERFORM 3100-PRINT-SUBHEADINGS                             04026000
040261       SET SUBHEADINGS-PRINTED TO TRUE                            04026100
040262     END-IF.                                                      04026200
040263                                                                  04026300
040264     MOVE INPHOL-ACCOUNT-TYPE TO DETAIL-TYPE                      04026400
040270     MOVE INPHOL-SECURITY-NO  TO DETAIL-ADP-NO                    04027000
040280     MOVE INPHOL-CPH-TD-QTY   TO DETAIL-CPH-POS                   04028000
040290     MOVE INPHOL-CPH-SD-QTY   TO DETAIL-CPH-SD                    04029000
040300     MOVE INPHOL-CPH-SEC-DESC (1) TO DETAIL-SEC-DESC              04030000
040400                                                                  04040000
040422     ADD 1 TO LINE-CNT CLIENT-PROC-CNT                            04042200
040423     MOVE DETAIL-LINE  TO WS-REPT-DATA.                           04042300
040424     PERFORM 4700-WRITE-REPORT.                                   04042400
040425                                                                  04042500
040427                                                                  04042700
040443     IF    INPHOL-NO-DESC    > 1                                  04044300
040495        MOVE SPACES  TO DETAIL-LINE2                              04049500
040496        MOVE INPHOL-CPH-SEC-DESC (2)   TO DETAIL-SEC-DESC2        04049600
040497        ADD 1 TO LINE-CNT CLIENT-PROC-CNT                         04049700
040498        MOVE DETAIL-LINE2 TO WS-REPT-DATA                         04049800
040499        PERFORM 4700-WRITE-REPORT                                 04049900
040550     END-IF.                                                      04055000
040560                                                                  04056000
040426     PERFORM 1300-READ-CHOL-RTN.                                  04057000
040560                                                                  04058000
046500 3000-PAGE-BREAK.                                                 04650000
046510                                                                  04651000
046600     ADD  1 TO PAGE-CNT.                                          04660000
046700     MOVE PAGE-CNT TO HEAD1-PAGE-NUM.                             04670000
046800     MOVE HEAD1-LINE    TO WS-REPT-DATA                           04680000
046801     PERFORM 4700-WRITE-REPORT                                    04680100
046900     MOVE 1 TO LINE-CNT.                                          04690000
047000                                                                  04700000
047100 3100-PRINT-SUBHEADINGS.                                          04710000
047101                                                                  04710100
047110     MOVE SUBHD1-LINE   TO WS-REPT-DATA                           04711000
047120     PERFORM 4700-WRITE-REPORT.                                   04712000
047900     ADD  2 TO LINE-CNT.                                          04790000
048000                                                                  04800000
050800 4700-WRITE-REPORT.                                               05080000
050810     WRITE REPT-REC FROM WS-REPT-AREA.                            05081000
050820                                                                  05082000
056200 6900-GET-NAMES.                                                  05620000
056300     INITIALIZE  GETNA-PARAMETERS.                                05630000
056400     MOVE  'R'                      TO  GETNA-REQ-FUNC.           05640000
056500     MOVE  'R'                      TO  GETNA-REQ-FILE.           05650000
056600     MOVE  'R'                      TO  GETNA-REQ-FUNC2.          05660000
056700     MOVE  'N'                      TO  GETNA-REQ-YEAREND.        05670000
056800     MOVE  PGM-NAME                 TO  GETNA-PGM-NAME.           05680000
056900     MOVE  EXTR-CLIENT              TO  GETNA-KEY-CLIENT.         05690000
057000     MOVE  '00'                     TO  GETNA-KEY-BRANCH1-2.      05700000
057100     MOVE  EXTR-BRANCH              TO  GETNA-KEY-BRANCH3-5.      05710000
057200     MOVE  '00000'                  TO  GETNA-KEY-ACCOUNT1-5.     05720000
057300     MOVE  EXTR-ACCOUNT             TO  GETNA-KEY-ACCOUNT6-10.    05730000
057400                                                                  05740000
057500     CALL   GETNA  USING  GETNA-PARAMETERS                        05750000
057600                          GETNA-SEGMENT-INCLUDES                  05760000
057700     END-CALL.                                                    05770000
057800                                                                  05780000
057900     IF GETNA-RETURN-FOUND  AND                                   05790000
058000        NOT NNAPPN-SEGMENT-MISSING                                05800000
058100        MOVE NNAPPN-SHORT-NAME-P           TO  SUBHD1-NAME        05810000
058200        IF SUBHD1-NAME EQUAL SPACES                               05820000
058300           MOVE 'NAME SPACES ON FILE'     TO SUBHD1-NAME          05830000
058400        END-IF                                                    05840000
058500     ELSE                                                         05850000
058600        MOVE ' NAME IS NOT ON FILE'  TO SUBHD1-NAME               05860000
058700        DISPLAY 'CAT885C: SEGMENT N MISSING - KEY - '             05870000
058800                          EXTR-CLIENT                             05880000
058900                      ' ' EXTR-BRANCH                             05890000
059000                      ' ' EXTR-ACCOUNT                            05900000
059100     END-IF.                                                      05910000
059200                                                                  05920000
063600***-------------------------------------------------------------**06360000
063700***--              H O U S E K E E P I N G                    --**06370000
063800***-------------------------------------------------------------**06380000
063900 9000-HOUSEKEEPING.                                               06390000
064000     MOVE READ-EXTR-CLIENT-CNT TO REC-CNT-DISP                    06400000
064100     DISPLAY 'CAT885C: NUMBER OF CLIENTS PROCESSED  : '           06410000
064200         REC-CNT-DISP.                                            06420000
064300     MOVE PROC-ACCT-CNT TO REC-CNT-DISP                           06430000
064400     DISPLAY '        NUMBER OF ACCOUNTS  PROCESSED : '           06440000
064500         REC-CNT-DISP.                                            06450000
064600     MOVE CPH-PROC-CNT  TO REC-CNT-DISP                           06460000
064700     DISPLAY '           NO. OF CPH RECS  PROCESSED : '           06470000
064800         REC-CNT-DISP.                                            06480000
064900     MOVE CPT-PROC-CNT  TO REC-CNT-DISP                           06490000
065000     DISPLAY '           NO. OF CPT RECS  PROCESSED : '           06500000
065100         REC-CNT-DISP.                                            06510000
065200     MOVE CAH-PROC-CNT  TO REC-CNT-DISP                           06520000
065300     DISPLAY '           NO. OF CAH RECS  PROCESSED : '           06530000
065400         REC-CNT-DISP.                                            06540000
065500                                                                  06550000
065600     CLOSE        REPT-FILE                                       06560000
065700                  EXTR-FILE.                                      06570000
065800***-------------------------------------------------------------**06580000
065900***--           E N D   O F   C A T 8 8 5 C                   --**06590000
066000***-------------------------------------------------------------**06600000
