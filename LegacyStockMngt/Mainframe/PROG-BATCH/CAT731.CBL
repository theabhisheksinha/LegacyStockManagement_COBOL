000001* PDX    - CAT731   C0270214 10/24/08 09:02:31 TBLAMUR            00001000
000001* PDX    - CAT731   C0266770 06/30/08 15:06:16 TBLAMUR            00001101
LRM001* SSR 55171 MIGRATE CHANGES FROM NEW TABLE ACTRBSC TO VACTRBHY.   00001200
000001* PDX    - CAT731   C0179727 09/26/02 13:12:55 TBLAMUR            00001300
000100 IDENTIFICATION DIVISION.                                         00002000
000200 PROGRAM-ID.  CAT731.                                             00003000
000300***************************************************************** 00004000
000400* THIS PROGRAM CONTAINS DB2.                                    * 00005000
000500***************************************************************** 00006000
000600* CAT731 - MAINTAIN VRSDBLK AND VACTRBHY                        * 00007000
000700*                                                               * 00008000
000800*    MOVE RESCIND BLOCK ROWS MARKED AS DELETED OR EXPIRING      * 00009000
000900*     BASED ON USER SPECIFIED EXPIRATION DATE TO HISTORY.       * 00010000
001000*    COPY RESCIND BLOCK ROWS BASED ON LAST UPDATE TIMESTAMP     * 00020000
001000*     (ADDS AND CHANGES) TO THE HISTORY TABLE TO CREATE AN      * 00021000
002000*     ACTIVITY LOG FOR REPORTING IN CAT731R AND ONLINE DSPLY.   * 00022000
005900*                                                               * 00040000
006000***************************************************************** 00050000
006100* 09/16/02 LRM   NEW PROGRAM SSR 00026952                       * 00060000
006400***************************************************************** 00080000
006500/                                                                 00090000
006600 ENVIRONMENT DIVISION.                                            00100000
006700 INPUT-OUTPUT SECTION.                                            00110000
006800 FILE-CONTROL.                                                    00120000
                                                                        00121000
           SELECT LOG-FILE-IN            ASSIGN TO UT-S-LOGIN.          00122000
           SELECT LOG-FILE-OUT           ASSIGN TO UT-S-LOGOUT.         00123000
                                                                        00126000
011600 DATA DIVISION.                                                   00130000
011700 FILE SECTION.                                                    00140000
       FD  LOG-FILE-IN                                                  00141000
           RECORDING MODE IS F.                                         00142000
                                                                        00143000
       01  LOG-RECORD-IN            PIC X(80).                          00143100
       FD  LOG-FILE-OUT                                                 00143200
           RECORDING MODE IS F.                                         00143300
                                                                        00143400
       01  LOG-RECORD-OUT           PIC X(80).                          00143500
      /                                                                 00149500
017300 WORKING-STORAGE SECTION.                                         00150000
017400     COPY PDXIDCOB.                                               00160000
017400     COPY STUBCPY.                                                00170000
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.    00180000
017500                                                                  00190000
017600 01  W-FIELDS.                                                    00200000
017700     05  W-PGM-NAME                PIC  X(008) VALUE 'CAT731'.    00210000
017800     05  W-ROUTINE-1               PIC  X(032) VALUE ' '.         00220000
023400     05  W-SYS-DATE                PIC  9(006) VALUE 0.           00290000
023500     05  FILLER  REDEFINES                                        00300000
023600         W-SYS-DATE.                                              00310000
023700         10  W-UPD-DATE            PIC  X(006).                   00320000
023800     05  W-SYS-TIME                PIC  9(008) VALUE 0.           00330000
023900     05  FILLER  REDEFINES                                        00340000
024000         W-SYS-TIME.                                              00350000
024100         10  W-UPD-TIME            PIC  X(006).                   00360000
024200         10  W-UPD-TIME-MS         PIC  X(002).                   00370000
024300     05  LD-PROC-DATE.                                            00380000
024400         10 LD-PROC-DATE-MM        PIC  X(002).                   00390000
024500         10 LD-PROC-DATE-DD        PIC  X(002).                   00400000
024600         10 LD-PROC-DATE-YY        PIC  X(002).                   00410000
026200     05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.  00510000
026300     05  W-INFILE-CNT              PIC  9(009) VALUE 0.           00520000
035400     05  WS-ACTIVE-ROWS-COPIED     PIC  9(011) VALUE 0.           00540000
035400     05  WS-ACTIVE-ROWS-DELETED    PIC  9(011) VALUE 0.           00541000
035400     05  W-VACTRBHY-ROW-CNT        PIC  S9(4) COMP  VALUE +0.     00550000
035800                                                                  00560000
036700     05  W-SUB1                    PIC  9(03).                    00570000
037400 01  FILLER                        PIC X(008) VALUE 'WORKFLDS'.   00580000
037500 01  W-WORK-FIELDS.                                               00590000
037600     05  W-DATE.                                                  00600000
037700         07  W-DATE-YEAR.                                         00610000
037800             09  W-DATE-CC         PIC X(2) VALUE ' '.            00620000
037900             09  W-DATE-YY         PIC X(2) VALUE ' '.            00630000
038000         07  FILLER                PIC X(1) VALUE '-'.            00640000
038100         07  W-DATE-MM             PIC X(2) VALUE ' '.            00650000
038200         07  FILLER                PIC X(1) VALUE '-'.            00660000
038300         07  W-DATE-DD             PIC X(2) VALUE ' '.            00670000
       01  WS-LOG-RECORD.                                               00780000
           03 PRIOR-RUN-TMSTP       PIC  X(26).                         00790000
           03 CURRENT-RUN-TMSTP     PIC  X(26).                         00800000
           03 FILLER                PIC  X(28).                         00810000
                                                                        00820000
083700******************************************************************00960000
083800* BPDATE COMMAREA                                                *00970000
083900******************************************************************00980000
084000 01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   00990000
084100                                                                  01000000
084200     COPY BPDATESC.                                               01010000
084300                                                                  01020000
084400***--->COBOL LE                                                   01030000
084500 01  W-ABEND-AREA.                                                01040000
084600     03  ABEND-CODE                PIC S9(04) COMP SYNC.          01050000
089500******************************************************************01060000
089600* RESCIND BLOCK TABLE                                             01070000
089700******************************************************************01080000
089800 01  FILLER                        PIC X(008) VALUE 'VRSDBLK '.   01090000
089900     EXEC SQL INCLUDE VRSDBLK      END-EXEC.                      01100000
090000                                                                  01110000
LRM001 01  FILLER                        PIC X(008) VALUE 'ACTRBSC '.   01111000
LRM001     EXEC SQL INCLUDE ACTRBSC      END-EXEC.                      01112000
LRM001                                                                  01113000
090100 01  FILLER                        PIC X(008) VALUE 'VACTRBHY'.   01120000
090200     EXEC SQL INCLUDE VACTRBHY     END-EXEC.                      01130000
090300                                                                  01140000
090400******************************************************************01150000
090500* DB2 COMMAREA                                                   *01160000
090600******************************************************************01170000
090700 01  FILLER                        PIC X(008) VALUE 'SQLCA   '.   01180000
090800     EXEC SQL INCLUDE SQLCA        END-EXEC.                      01190000
090900******************************************************************01200000
091000* DB2 ERROR MESSAGE AREA                                         *01210000
091010******************************************************************01220000
091020 01  W-DB2-MESSAGE-AREA.                                          01230000
091030     05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    01240000
091040     05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     01250000
091050             INDEXED BY W-DB2-IDX.                                01260000
091060 01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     01270000
091070                                                                  01280000
091080 01  W-DB2-WORKAREA.                                              01290000
091090     05  ROLLBACK-SQLCA            PIC  X(122).                   01300000
091100     05  ROLLBACK-RETURN           PIC S9(009) COMP.              01310000
091200         88  ROLLBACK-OK                VALUE +0.                 01320000
091300         88  ROLLBACK-AB                VALUE -999 THRU -1        01330000
091400                                              +1   THRU +999.     01340000
091500     05  COMMIT-SQLCA              PIC  X(122).                   01350000
091600     05  COMMIT-RETURN             PIC S9(009) COMP.              01360000
091700         88  COMMIT-OK                  VALUE +0.                 01370000
091800         88  COMMIT-AB                  VALUE -999 THRU -1        01380000
091900                                              +1   THRU +999.     01390000
092000     05  W-COMMIT-CNT              PIC  9(009) VALUE 0.           01400000
092000     05  W-LAST-COMMIT-INFILE-CNT  PIC  9(009) VALUE 0.           01401000
092200     05  W-DB2-TABLE-NAME          PIC  X(008).                   01420000
092300     05  W-DB2-ACTION              PIC  X(008).                   01430000
092400     05  W-DB2-SQLCODE             PIC ---9.                      01440000
092500     05  W-RSDBLK-SQLCODE          PIC S9(9) COMP-4.              01450000
092600     05  W-SQLERRD-3                   PIC  S9(9).                01460000
092700     05  W-SQL-UPDATE-COUNT            PIC  999999999.            01470000
LRM001     05  W-ACTRBSC-SQLCODE         PIC S9(9) COMP-4.              01471000
093000                                                                  01480000
093100 01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  01490000
093200 01  W-DB2-TODAY                   PIC  X(010).                   01501000
093300/                                                                 01510000
093400******************************************************************01520000
093500* DECLARE CURSOR FOR ACTIVE TRANSFER TABLE                       *01530000
093600* TO GET ALL RESIND BLOCK ROWS MARKED AS DELETE OR EXPIRING TODAY*01540000
093700******************************************************************01550000
093800 01  FILLER                        PIC X(008) VALUE 'CURSOR'.     01560000
093900     EXEC SQL                                                     01570000
094000          DECLARE VRSDBLK_CURSOR CURSOR WITH HOLD FOR             01580000
094100          SELECT                                                  01590000
094200              CLIENT_NBR                                          01600000
094300             ,BRANCH_CD                                           01610000
094400             ,ACCT_CD                                             01620000
094500             ,BLOCK_CD                                            01630000
094600             ,CMNT_TXT                                            01640000
094700             ,PRGM_NM                                             01650000
094800             ,RCV_NBR                                             01660000
094900             ,DLVR_NBR                                            01670000
095000             ,CICS_TERM_ID_CD                                     01680000
                   ,CRT_TMSTP                                           01690000
                   ,UPDT_TMSTP                                          01691000
                   ,ISIN_SEC_ISSUE_CD                                   01692000
                   ,SECURITY_ADP_NBR                                    01693000
                   ,EXPIRE_DT                                           01694000
                   ,ACTION_CD                                           01695000
                   ,CICS_SNON_ID                                        01696000
104000          FROM    VRSDBLK                                         01700000
104600                                                                  01710000
106300     END-EXEC.                                                    01720000
106500                                                                  01730000
LRM001******************************************************************01731000
LRM001* DECLARE CURSOR FOR ACTRBSC TRANSFER TABLE                      *01732000
LRM001* TO GET ALL ROWS MARKED AS DELETE OR EXPIRING TODAY*             01733000
LRM001******************************************************************01734000
LRM001 01  FILLER                        PIC X(008) VALUE 'CURSOR'.     01735000
LRM001     EXEC SQL                                                     01736000
LRM001          DECLARE ACTRBSC_CURSOR CURSOR WITH HOLD FOR             01737000
LRM001          SELECT                                                  01738000
LRM001              CLIENT_NBR                                          01739000
LRM001             ,BRANCH_CD                                           01739100
LRM001             ,ACCT_CD                                             01739200
LRM001             ,BLOCK_CD                                            01739300
LRM001             ,PRGM_NM                                             01739500
LRM001             ,RCV_NBR                                             01739600
LRM001             ,CICS_TERM_ID_CD                                     01739800
LRM001             ,CRT_TMSTP                                           01739900
LRM001             ,UPDT_TMSTP                                          01740000
LRM001             ,ISIN_SEC_ISSUE_CD                                   01740100
LRM001             ,SECURITY_ADP_NBR                                    01740200
LRM001             ,CICS_NET_NM                                         01740400
LRM001             ,ACTION_CD                                           01740500
LRM001             ,CICS_SNON_ID                                        01740600
LRM001          FROM    ACTRBSC                                         01740700
LRM001                                                                  01740800
LRM001     END-EXEC.                                                    01740900
106500                                                                  01741000
106600 01  FILLER                        PIC  X(008) VALUE 'END-O-WS'.  01742000
108400                                                                  01750000
108500 PROCEDURE DIVISION.                                              01760000
108600                                                                  01770000
108700 0000-MAIN.                                                       01780000
109100     DISPLAY 'CAT731   AGE AND REPORT RESCIND BLOCK TABLES'.      01790000
109200     DISPLAY ' '.                                                 01800000
109300     COPY MSGCOBO.                                                01810000
109400     DISPLAY ' '.                                                 01820000
109500                                                                  01830000
109600     PERFORM 1000-INIT                                            01840000
109700                                                                  01850000
109800     PERFORM 2000-PROCESS-INPUT                                   01860000
109900                                                                  01870000
110010     PERFORM 8900-EOJ-RTN                                         01880000
110020     DISPLAY 'CAT731: PROGRAM ENDED SUCCESSFULLY'.                01890000
110100                                                                  01900000
110200     GOBACK.                                                      01910000
110300                                                                  01920000
110400 1000-INIT.                                                       01930000
110500     MOVE '1000-INIT                     ' TO W-ROUTINE-1.        01940000
      *** OBTAIN LAST REPORT TIMESTAMP FROM WRAP FILE.                  01940100
           OPEN INPUT LOG-FILE-IN.                                      01941000
           READ LOG-FILE-IN INTO WS-LOG-RECORD                          01942000
              AT END                                                    01942100
                MOVE SPACES TO WS-LOG-RECORD                            01943000
                MOVE '0001-01-01-08.15.11.000000' TO CURRENT-RUN-TMSTP  01944000
           END-READ.                                                    01944100
           MOVE CURRENT-RUN-TMSTP TO PRIOR-RUN-TMSTP.                   01945000
           DISPLAY 'LAST REPORT TMSTP ' PRIOR-RUN-TMSTP.                01946000
110600                                                                  01950000
110700     EXEC SQL                                                     01960000
110800         SET :CURRENT-RUN-TMSTP = CURRENT TIMESTAMP               01970000
110900     END-EXEC                                                     01980000
111000                                                                  01990000
111100     IF  SQLCODE = +0                                             02000000
111200         DISPLAY ' '                                              02010000
111300         DISPLAY 'CAT731: CURRENT-RUN-TMSTP = '                   02020000
111400                                              CURRENT-RUN-TMSTP   02030000
111500         DISPLAY ' '                                              02040000
111600     ELSE                                                         02050000
111700         DISPLAY 'CAT731: CURRENT-RUN-TMSTP NOT SET'              02060000
111800         MOVE SQLCODE      TO W-DB2-SQLCODE                       02070000
111900         DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                       02080000
112000         PERFORM  8500-SQL-ERROR                                  02090000
112100     END-IF.                                                      02100000
112200                                                                  02110000
                                                                        02125900
112300     ACCEPT W-SYS-DATE              FROM DATE.                    02126000
112400     ACCEPT W-SYS-TIME              FROM TIME.                    02130000
112500     DISPLAY 'CAT731: SYS-DATE ' W-SYS-DATE                       02140000
112600                    ' SYS-TIME ' W-SYS-TIME.                      02150000
116600                                                                  02160000
116700     MOVE 'CAT731'                  TO BPDATES-CALLING-PGM.       02170000
116800     SET  LNKDATZ-REQUEST           TO TRUE.                      02180000
116900     CALL BPDATES USING BPDATES-PARAMETERS.                       02190000
117000     MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.           02200000
117100     MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.           02210000
117200     MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.           02220000
117300     MOVE BPD-PROC-DATE(1:4)        TO W-DB2-TODAY(1 : 4).        02230000
117400     MOVE BPD-PROC-DATE(5:2)        TO W-DB2-TODAY(6 : 2).        02240000
117500     MOVE BPD-PROC-DATE(7:2)        TO W-DB2-TODAY(9 : 2).        02250000
           MOVE '-'                       TO W-DB2-TODAY(5 : 1)         02252000
                                             W-DB2-TODAY(8 : 1).        02253000
117700                                                                  02260000
117800     DISPLAY ' '.                                                 02270000
117900     DISPLAY 'CAT731:       BPD-PROC-DATE= ' BPD-PROC-DATE        02280000
118000                          '  LD-PROC-DATE= ' LD-PROC-DATE         02290000
                                '  DB2 TODAY= '    W-DB2-TODAY.         02291000
118400                                                                  02300000
131800     DISPLAY ' '.                                                 02310000
131900                                                                  02320000
157900 2000-PROCESS-INPUT.                                              02340000
158100                                                                  02350000
158200     EXEC SQL OPEN VRSDBLK_CURSOR END-EXEC                        02360000
158300                                                                  02370000
158400     MOVE SQLCODE      TO W-DB2-SQLCODE                           02380000
158500     MOVE SQLCODE      TO W-RSDBLK-SQLCODE                        02390000
158600     IF SQLCODE NOT = +0                                          02400000
158700        DISPLAY 'VRSDBLK CURSOR OPEN ERROR '                      02410000
158800                      'SQLCODE = ' W-DB2-SQLCODE                  02420000
158900     END-IF                                                       02430000
159000                                                                  02440000
159100     PERFORM UNTIL W-RSDBLK-SQLCODE NOT = +0                      02450000
159200                                                                  02460000
159300        ADD 1 TO W-INFILE-CNT                                     02470000
159400                                                                  02480000
159500        EXEC SQL                                                  02490000
159600             FETCH VRSDBLK_CURSOR                                 02500000
159700          INTO                                                    02510000
                    :DCLVRSDBLK.CLIENT-NBR                              02520000
                   ,:DCLVRSDBLK.BRANCH-CD                               02530000
                   ,:DCLVRSDBLK.ACCT-CD                                 02540000
                   ,:DCLVRSDBLK.BLOCK-CD                                02550000
                   ,:DCLVRSDBLK.CMNT-TXT                                02560000
                   ,:DCLVRSDBLK.PRGM-NM                                 02561000
                   ,:DCLVRSDBLK.RCV-NBR                                 02562000
                   ,:DCLVRSDBLK.DLVR-NBR                                02563000
                   ,:DCLVRSDBLK.CICS-TERM-ID-CD                         02564000
                   ,:DCLVRSDBLK.CRT-TMSTP                               02565000
                   ,:DCLVRSDBLK.UPDT-TMSTP                              02566000
                   ,:DCLVRSDBLK.ISIN-SEC-ISSUE-CD                       02567000
                   ,:DCLVRSDBLK.SECURITY-ADP-NBR                        02568000
                   ,:DCLVRSDBLK.EXPIRE-DT                               02569000
                   ,:DCLVRSDBLK.ACTION-CD                               02569100
                   ,:DCLVRSDBLK.CICS-SNON-ID                            02569200
169400        END-EXEC                                                  02570000
169500                                                                  02580000
169600        MOVE SQLCODE      TO W-DB2-SQLCODE                        02590000
169700        MOVE SQLCODE      TO W-RSDBLK-SQLCODE                     02600000
169800        EVALUATE SQLCODE                                          02610000
169900            WHEN +0                                               02620000
                    IF ACTION-CD OF DCLVRSDBLK = 'D'                    02621000
                       PERFORM 3000-MOVE-TO-HSTY-RTN THRU 3000-EXIT     02621100
                    ELSE                                                02621200
                    IF  (EXPIRE-DT OF DCLVRSDBLK > '0001-01-01'         02622000
                    AND  EXPIRE-DT OF DCLVRSDBLK <= W-DB2-TODAY)        02623000
                       MOVE 'E' TO ACTION-CD OF DCLVRSDBLK              02623100
                       PERFORM 3000-MOVE-TO-HSTY-RTN THRU 3000-EXIT     02623200
                    ELSE                                                02623300
                    IF UPDT-TMSTP OF DCLVRSDBLK >=  PRIOR-RUN-TMSTP     02624000
                       PERFORM 3000-MOVE-TO-HSTY-RTN THRU 3000-EXIT     02630000
                    END-IF END-IF END-IF                                02631000
170100            WHEN +100                                             02640000
170200                 DISPLAY 'INP=' W-INFILE-CNT                      02650000
170300                        ' VRSDBLK CURSOR FETCH NOT FOUND '        02660000
170400                        ' SQLCODE = ' W-DB2-SQLCODE               02670000
170500            WHEN OTHER                                            02680000
170600                 DISPLAY 'INP=' W-INFILE-CNT                      02690000
170700                        ' VRSDBLK CURSOR FETCH ERROR '            02700000
170800                        ' SQLCODE = ' W-DB2-SQLCODE               02710000
                       MOVE +2010    TO ABEND-CODE                      02711000
170900                 PERFORM  8500-SQL-ERROR                          02720000
171000        END-EVALUATE                                              02730000
171100                                                                  02740000
171200     END-PERFORM                                                  02750000
171300                                                                  02760000
171400     EXEC SQL                                                     02770000
171500          CLOSE VRSDBLK_CURSOR                                    02780000
171600     END-EXEC                                                     02790000
171700                                                                  02800000
171800     MOVE SQLCODE      TO W-DB2-SQLCODE                           02810000
171900     MOVE SQLCODE      TO W-RSDBLK-SQLCODE                        02820000
172000     IF  SQLCODE NOT = +0                                         02830000
172100         DISPLAY 'INP= ' W-INFILE-CNT                             02840000
172200                ' VRSDBLK CURSOR CLOSE ERROR '                    02850000
172300                ' SQLCODE = ' W-DB2-SQLCODE                       02860000
               MOVE +2020    TO ABEND-CODE                              02861000
172400         PERFORM  8500-SQL-ERROR                                  02870000
172500     END-IF.                                                      02880000
172600                                                                  02890000
LRM001     EXEC SQL OPEN ACTRBSC_CURSOR END-EXEC                        02900000
LRM001                                                                  02910000
LRM001     MOVE SQLCODE      TO W-DB2-SQLCODE                           02920000
LRM001     MOVE SQLCODE      TO W-ACTRBSC-SQLCODE                       02930000
LRM001     IF SQLCODE NOT = +0                                          02940000
LRM001        DISPLAY 'ACTRBSC CURSOR OPEN ERROR '                      02950000
LRM001                      'SQLCODE = ' W-DB2-SQLCODE                  02960000
LRM001     END-IF                                                       02970000
LRM001                                                                  02980000
LRM001     PERFORM UNTIL W-ACTRBSC-SQLCODE NOT = +0                     02990000
LRM001                                                                  03000000
LRM001        ADD 1 TO W-INFILE-CNT                                     03010000
LRM001                                                                  03020000
LRM001        EXEC SQL                                                  03030000
LRM001             FETCH ACTRBSC_CURSOR                                 03040000
LRM001          INTO                                                    03050000
LRM001              :DCLACTRBSC.CLIENT-NBR                              03060000
LRM001             ,:DCLACTRBSC.BRANCH-CD                               03070000
LRM001             ,:DCLACTRBSC.ACCT-CD                                 03080000
LRM001             ,:DCLACTRBSC.BLOCK-CD                                03081000
LRM001             ,:DCLACTRBSC.PRGM-NM                                 03083000
LRM001             ,:DCLACTRBSC.RCV-NBR                                 03084000
LRM001             ,:DCLACTRBSC.CICS-TERM-ID-CD                         03086000
LRM001             ,:DCLACTRBSC.CRT-TMSTP                               03087000
LRM001             ,:DCLACTRBSC.UPDT-TMSTP                              03088000
LRM001             ,:DCLACTRBSC.ISIN-SEC-ISSUE-CD                       03089000
LRM001             ,:DCLACTRBSC.SECURITY-ADP-NBR                        03089100
LRM001             ,:DCLACTRBSC.CICS-NET-NM                             03089200
LRM001             ,:DCLACTRBSC.ACTION-CD                               03089300
LRM001             ,:DCLACTRBSC.CICS-SNON-ID                            03089400
LRM001        END-EXEC                                                  03089500
LRM001                                                                  03089600
LRM001        MOVE SQLCODE      TO W-DB2-SQLCODE                        03089700
LRM001        MOVE SQLCODE      TO W-ACTRBSC-SQLCODE                    03089800
LRM001        EVALUATE SQLCODE                                          03089900
LRM001            WHEN +0                                               03090000
LRM001              IF ACTION-CD OF DCLACTRBSC = 'D'                    03090100
LRM001                 PERFORM 4000-MOVE-TO-HSTY-RTN THRU 4000-EXIT     03090200
LRM001              ELSE                                                03090800
LRM001              IF UPDT-TMSTP OF DCLACTRBSC >=  PRIOR-RUN-TMSTP     03090900
LRM001                 PERFORM 4000-MOVE-TO-HSTY-RTN THRU 4000-EXIT     03091000
LRM001              END-IF END-IF                                       03091100
LRM001            WHEN +100                                             03091200
LRM001                 DISPLAY 'INP=' W-INFILE-CNT                      03091300
LRM001                        ' ACTRBSC CURSOR FETCH NOT FOUND '        03091400
LRM001                        ' SQLCODE = ' W-DB2-SQLCODE               03091500
LRM001            WHEN OTHER                                            03091600
LRM001                 DISPLAY 'INP=' W-INFILE-CNT                      03091700
LRM001                        ' ACTRBSC CURSOR FETCH ERROR '            03091800
LRM001                        ' SQLCODE = ' W-DB2-SQLCODE               03091900
LRM001                 MOVE +2010    TO ABEND-CODE                      03092000
LRM001                 PERFORM  8500-SQL-ERROR                          03092100
LRM001        END-EVALUATE                                              03092200
LRM001                                                                  03092300
LRM001     END-PERFORM                                                  03092400
LRM001                                                                  03092500
LRM001     EXEC SQL                                                     03092600
LRM001          CLOSE ACTRBSC_CURSOR                                    03092700
LRM001     END-EXEC                                                     03092800
LRM001                                                                  03092900
LRM001     MOVE SQLCODE      TO W-DB2-SQLCODE                           03093000
LRM001     MOVE SQLCODE      TO W-ACTRBSC-SQLCODE                       03093100
LRM001     IF  SQLCODE NOT = +0                                         03093200
LRM001         DISPLAY 'INP= ' W-INFILE-CNT                             03093300
LRM001                ' ACTRBSC CURSOR CLOSE ERROR '                    03093400
LRM001                ' SQLCODE = ' W-DB2-SQLCODE                       03093500
LRM001         MOVE +2020    TO ABEND-CODE                              03093600
LRM001         PERFORM  8500-SQL-ERROR                                  03093700
LRM001     END-IF.                                                      03093800
255400                                                                  03094000
       3000-MOVE-TO-HSTY-RTN.                                           03095000
255509                                                                  03260000
255700     MOVE +0             TO    W-VACTRBHY-ROW-CNT                 03270000
255510     EXEC SQL                                                     03280000
255600           SELECT COUNT(*)                                        03290000
255700             INTO :W-VACTRBHY-ROW-CNT                             03300000
255800             FROM VACTRBHY                                        03310000
              WHERE                                                     03311000
255810          CLIENT_NBR     =  :DCLVRSDBLK.CLIENT-NBR AND            03320000
                BRANCH_CD      =  :DCLVRSDBLK.BRANCH-CD AND             03321000
                ACCT_CD        =  :DCLVRSDBLK.ACCT-CD    AND            03322000
                BLOCK_CD       =  :DCLVRSDBLK.BLOCK-CD   AND            03323000
                RCV_NBR        =  :DCLVRSDBLK.RCV-NBR    AND            03324000
255830          ISIN_SEC_ISSUE_CD = :DCLVRSDBLK.ISIN-SEC-ISSUE-CD       03330000
256100     END-EXEC                                                     03350000
256200                                                                  03360000
256210     IF  SQLCODE  =  +0                                           03370000
256220         CONTINUE                                                 03380000
256230     ELSE                                                         03390000
256240         DISPLAY 'CAT731: ROW COUNT FAILED '                      03400000
               MOVE +3010    TO ABEND-CODE                              03401000
256241         PERFORM  8500-SQL-ERROR                                  03410000
256260     END-IF.                                                      03430000
                                                                        03430100
           MOVE W-VACTRBHY-ROW-CNT TO HSTRY-SEQ-NBR OF DCLVACTRBHY.     03431000
256270     EXEC SQL                                                     03440000
                INSERT INTO VACTRBHY                                    03450000
                  (                                                     03460000
                     CLIENT_NBR                                         03470000
                    ,BRANCH_CD                                          03480000
                    ,ACCT_CD                                            03490000
                    ,BLOCK_CD                                           03500000
                    ,CMNT_TXT                                           03510000
                    ,PRGM_NM                                            03520000
                    ,RCV_NBR                                            03530000
                    ,DLVR_NBR                                           03540000
                    ,CICS_TERM_ID_CD                                    03550000
                    ,CRT_TMSTP                                          03560000
                    ,UPDT_TMSTP                                         03570000
                    ,ISIN_SEC_ISSUE_CD                                  03580000
                    ,HSTRY_SEQ_NBR                                      03590000
                    ,SECURITY_ADP_NBR                                   03600000
                    ,EXPIRE_DT                                          03601000
                    ,ACTION_CD                                          03602000
                    ,CICS_SNON_ID                                       03603000
                  )                                                     03604000
                   VALUES                                               03605000
                  (                                                     03606000
                     :DCLVRSDBLK.CLIENT-NBR                             03607000
                    ,:DCLVRSDBLK.BRANCH-CD                              03608000
                    ,:DCLVRSDBLK.ACCT-CD                                03609000
                    ,:DCLVRSDBLK.BLOCK-CD                               03609100
                    ,:DCLVRSDBLK.CMNT-TXT                               03609200
                    ,:DCLVRSDBLK.PRGM-NM                                03609300
                    ,:DCLVRSDBLK.RCV-NBR                                03609400
                    ,:DCLVRSDBLK.DLVR-NBR                               03609500
                    ,:DCLVRSDBLK.CICS-TERM-ID-CD                        03609600
                    ,:DCLVRSDBLK.CRT-TMSTP                              03609700
                    ,:DCLVRSDBLK.UPDT-TMSTP                             03609800
                    ,:DCLVRSDBLK.ISIN-SEC-ISSUE-CD                      03609900
                    ,:DCLVACTRBHY.HSTRY-SEQ-NBR                         03610000
                    ,:DCLVRSDBLK.SECURITY-ADP-NBR                       03610100
                    ,:DCLVRSDBLK.EXPIRE-DT                              03610200
                    ,:DCLVRSDBLK.ACTION-CD                              03610300
                    ,:DCLVRSDBLK.CICS-SNON-ID                           03610400
                 )                                                      03610500
           END-EXEC.                                                    03610600
           IF  SQLCODE  =  +0                                           03610700
               ADD 1 TO W-COMMIT-CNT WS-ACTIVE-ROWS-COPIED              03610800
           ELSE                                                         03611000
               DISPLAY 'CAT731: INSERT FAILED'                          03611100
                     ' ' CLIENT-NBR OF DCLVRSDBLK                       03611200
                     ' ' BRANCH-CD  OF DCLVRSDBLK                       03611300
                     '-' ACCT-CD    OF DCLVRSDBLK                       03611400
                     ' ' BLOCK-CD   OF DCLVRSDBLK                       03611500
               MOVE +3020    TO ABEND-CODE                              03611600
               PERFORM  8500-SQL-ERROR                                  03611700
           END-IF.                                                      03611800
                                                                        03611900
******** ONLY DELETE ACTIVE RESCIND BLOCK ROW IF IT WAS MARKED AS SUCH  03612000
******** IT HAS REACHED EXPIRATION.                                     03612100
           IF (ACTION-CD OF DCLVRSDBLK = 'D' OR 'E')                    03612200
              CONTINUE                                                  03612300
           ELSE                                                         03612400
               GO TO 3000-CKECK-COMMIT-COUNTER                          03612500
           END-IF.                                                      03612600
                                                                        03612700
255510     EXEC SQL DELETE                                              03612800
255800             FROM VRSDBLK                                         03612900
              WHERE                                                     03613000
255810          CLIENT_NBR     =  :DCLVRSDBLK.CLIENT-NBR AND            03613100
                BRANCH_CD      =  :DCLVRSDBLK.BRANCH-CD AND             03613200
                ACCT_CD        =  :DCLVRSDBLK.ACCT-CD    AND            03613300
                BLOCK_CD       =  :DCLVRSDBLK.BLOCK-CD   AND            03613400
                RCV_NBR        =  :DCLVRSDBLK.RCV-NBR    AND            03613500
255830          ISIN_SEC_ISSUE_CD = :DCLVRSDBLK.ISIN-SEC-ISSUE-CD       03613600
256100     END-EXEC                                                     03613700
256200                                                                  03613800
256210     IF  SQLCODE  =  +0                                           03613900
               ADD 1 TO W-COMMIT-CNT WS-ACTIVE-ROWS-DELETED             03614000
256230     ELSE                                                         03614100
256240         DISPLAY 'CAT731: VRSDBLK DELETE FAILED'                  03614200
                     ' ' CLIENT-NBR OF DCLVRSDBLK                       03614300
                     ' ' BRANCH-CD  OF DCLVRSDBLK                       03614400
                     '-' ACCT-CD    OF DCLVRSDBLK                       03614500
                     ' ' BLOCK-CD   OF DCLVRSDBLK                       03614600
               MOVE +3030    TO ABEND-CODE                              03614700
256241         PERFORM  8500-SQL-ERROR                                  03614800
256260     END-IF.                                                      03614900
       3000-CKECK-COMMIT-COUNTER.                                       03615000
           IF W-COMMIT-CNT > 10                                         03615100
                ADD W-COMMIT-CNT TO W-LAST-COMMIT-INFILE-CNT            03615200
                MOVE 0 TO W-COMMIT-CNT                                  03615300
                EXEC SQL  COMMIT  END-EXEC.                             03615400
567400                                                                  03616000
256377 3000-EXIT. EXIT.                                                 03620000
567400                                                                  03630000
LRM001 4000-MOVE-TO-HSTY-RTN.                                           03631000
LRM001                                                                  03632000
TEST       DISPLAY 'COUNTING FOR '                                      03632100
                CLIENT-NBR  OF DCLACTRBSC                               03632200
LRM001    ' '   BRANCH-CD   OF DCLACTRBSC                               03632300
LRM001    ' '   ACCT-CD     OF DCLACTRBSC                               03632400
LRM001    ' '   BLOCK-CD    OF DCLACTRBSC                               03632500
LRM001    ' '   ISIN-SEC-ISSUE-CD  OF DCLACTRBSC                        03632600
LRM001     MOVE +0             TO    W-VACTRBHY-ROW-CNT                 03633000
LRM001     EXEC SQL                                                     03634000
LRM001           SELECT COUNT(*)                                        03635000
LRM001             INTO :W-VACTRBHY-ROW-CNT                             03636000
LRM001             FROM VACTRBHY                                        03637000
LRM001        WHERE                                                     03638000
LRM001          CLIENT_NBR     =  :DCLACTRBSC.CLIENT-NBR AND            03639000
LRM001          BRANCH_CD      =  :DCLACTRBSC.BRANCH-CD AND             03639100
LRM001          ACCT_CD        =  :DCLACTRBSC.ACCT-CD    AND            03639200
LRM001          BLOCK_CD       =  :DCLACTRBSC.BLOCK-CD   AND            03639300
LRM001          ISIN_SEC_ISSUE_CD = :DCLACTRBSC.ISIN-SEC-ISSUE-CD       03639500
LRM001     END-EXEC                                                     03639600
LRM001                                                                  03639700
LRM001     IF  SQLCODE  =  +0                                           03639800
LRM001         CONTINUE                                                 03639900
LRM001     ELSE                                                         03640000
LRM001         DISPLAY 'CAT731: ROW COUNT FAILED 4000-'                 03640100
LRM001         MOVE +4010    TO ABEND-CODE                              03640200
LRM001         PERFORM  8500-SQL-ERROR                                  03640300
LRM001     END-IF.                                                      03640400
LRM001                                                                  03640500
LRM001     MOVE W-VACTRBHY-ROW-CNT TO HSTRY-SEQ-NBR OF DCLVACTRBHY.     03640600
LRM001     EXEC SQL                                                     03640800
LRM001          INSERT INTO VACTRBHY                                    03640900
LRM001            (                                                     03641000
LRM001               CLIENT_NBR                                         03641100
LRM001              ,BRANCH_CD                                          03641200
LRM001              ,ACCT_CD                                            03641300
LRM001              ,BLOCK_CD                                           03641400
LRM001              ,CMNT_TXT                                           03641500
LRM001              ,PRGM_NM                                            03641600
LRM001              ,RCV_NBR                                            03641700
LRM001              ,DLVR_NBR                                           03641800
LRM001              ,CICS_TERM_ID_CD                                    03641900
LRM001              ,CRT_TMSTP                                          03642000
LRM001              ,UPDT_TMSTP                                         03642100
LRM001              ,ISIN_SEC_ISSUE_CD                                  03642200
LRM001              ,HSTRY_SEQ_NBR                                      03642300
LRM001              ,SECURITY_ADP_NBR                                   03642400
LRM001              ,EXPIRE_DT                                          03642500
LRM001              ,ACTION_CD                                          03642600
LRM001              ,CICS_SNON_ID                                       03642700
LRM001            )                                                     03642800
LRM001             VALUES                                               03642900
LRM001            (                                                     03643000
LRM001               :DCLACTRBSC.CLIENT-NBR                             03643100
LRM001              ,:DCLACTRBSC.BRANCH-CD                              03643200
LRM001              ,:DCLACTRBSC.ACCT-CD                                03643300
LRM001              ,:DCLACTRBSC.BLOCK-CD                               03643400
LRM001              ,:DCLVRSDBLK.CMNT-TXT                               03643500
LRM001              ,:DCLACTRBSC.PRGM-NM                                03643600
LRM001              ,:DCLACTRBSC.RCV-NBR                                03643700
LRM001              ,'    '                                             03643800
LRM001              ,:DCLACTRBSC.CICS-TERM-ID-CD                        03643900
LRM001              ,:DCLACTRBSC.CRT-TMSTP                              03644000
LRM001              ,:DCLACTRBSC.UPDT-TMSTP                             03644100
LRM001              ,:DCLACTRBSC.ISIN-SEC-ISSUE-CD                      03644200
LRM001              ,:DCLVACTRBHY.HSTRY-SEQ-NBR                         03644300
LRM001              ,:DCLACTRBSC.SECURITY-ADP-NBR                       03644400
LRM001              ,'0001-01-01'                                       03644500
LRM001              ,:DCLACTRBSC.ACTION-CD                              03644600
LRM001              ,:DCLACTRBSC.CICS-SNON-ID                           03644700
LRM001           )                                                      03644800
LRM001     END-EXEC.                                                    03644900
LRM001     IF  SQLCODE  =  +0                                           03645000
LRM001         ADD 1 TO W-COMMIT-CNT WS-ACTIVE-ROWS-COPIED              03645100
LRM001     ELSE                                                         03645200
LRM001         DISPLAY 'CAT731: INSERT FAILED'                          03645300
LRM001               ' ' CLIENT-NBR OF DCLACTRBSC                       03645400
LRM001               ' ' BRANCH-CD  OF DCLACTRBSC                       03645500
LRM001               '-' ACCT-CD    OF DCLACTRBSC                       03645600
LRM001               ' ' BLOCK-CD   OF DCLACTRBSC                       03645700
LRM001         MOVE +3020    TO ABEND-CODE                              03645800
LRM001         PERFORM  8500-SQL-ERROR                                  03645900
LRM001     END-IF.                                                      03646000
LRM001                                                                  03646100
******** ONLY DELETE ACTIVE ACTRBSC ROW IF IT WAS MARKED AS SUCH        03646200
******** IT HAS REACHED EXPIRATION.                                     03646300
LRM001     IF (ACTION-CD OF DCLACTRBSC = 'D' OR 'E')                    03646400
LRM001        CONTINUE                                                  03646500
LRM001     ELSE                                                         03646600
LRM001         GO TO 4000-CKECK-COMMIT-COUNTER                          03646700
LRM001     END-IF.                                                      03646800
LRM001                                                                  03646900
LRM001     EXEC SQL DELETE                                              03647000
LRM001             FROM ACTRBSC                                         03647100
LRM001        WHERE                                                     03647200
LRM001          CLIENT_NBR     =  :DCLACTRBSC.CLIENT-NBR AND            03647300
LRM001          BRANCH_CD      =  :DCLACTRBSC.BRANCH-CD AND             03647400
LRM001          ACCT_CD        =  :DCLACTRBSC.ACCT-CD    AND            03647500
LRM001          BLOCK_CD       =  :DCLACTRBSC.BLOCK-CD   AND            03647600
LRM001          RCV_NBR        =  :DCLACTRBSC.RCV-NBR    AND            03647700
LRM001          ISIN_SEC_ISSUE_CD = :DCLACTRBSC.ISIN-SEC-ISSUE-CD       03647800
LRM001     END-EXEC                                                     03647900
LRM001                                                                  03648000
LRM001     IF  SQLCODE  =  +0                                           03648100
LRM001         ADD 1 TO W-COMMIT-CNT WS-ACTIVE-ROWS-DELETED             03648200
LRM001     ELSE                                                         03648300
LRM001         DISPLAY 'CAT731: ACTRBSC DELETE FAILED'                  03648400
LRM001               ' ' CLIENT-NBR OF DCLACTRBSC                       03648500
LRM001               ' ' BRANCH-CD  OF DCLACTRBSC                       03648600
LRM001               '-' ACCT-CD    OF DCLACTRBSC                       03648700
LRM001               ' ' BLOCK-CD   OF DCLACTRBSC                       03648800
LRM001         MOVE +3030    TO ABEND-CODE                              03648900
LRM001         PERFORM  8500-SQL-ERROR                                  03649000
LRM001     END-IF.                                                      03649100
LRM001 4000-CKECK-COMMIT-COUNTER.                                       03649200
LRM001     IF W-COMMIT-CNT > 10                                         03649300
LRM001          ADD W-COMMIT-CNT TO W-LAST-COMMIT-INFILE-CNT            03649400
LRM001          MOVE 0 TO W-COMMIT-CNT                                  03649500
LRM001          EXEC SQL  COMMIT  END-EXEC.                             03649600
LRM001                                                                  03649700
LRM001 4000-EXIT. EXIT.                                                 03649800
LRM001                                                                  03649900
567400                                                                  03650000
567500 8500-SQL-ERROR.                                                  03651000
567600     DISPLAY ' '                                                  03660000
567700     DISPLAY '8500-SQL-ERROR'                                     03670000
567800            ' INFILE-CNT = ' W-INFILE-CNT                         03680000
567900     ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT        03690000
568000                                                                  03700000
568100     DISPLAY ' '                                                  03710000
568200     CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  03720000
568300                              W-DB2-MESSAGE-LEN.                  03730000
568400     PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        03740000
568500       UNTIL W-DB2-IDX GREATER THAN 12                            03750000
568600             IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              03760000
568700                DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               03770000
568800             END-IF                                               03780000
568900     END-PERFORM.                                                 03790000
569000     DISPLAY ' '                                                  03800000
569100                                                                  03810000
569200     PERFORM 8700-SQL-ROLLBACK                                    03820000
569300                                                                  03830000
569400     DISPLAY 'CAT731: U3999 - ABENDING ON BAD DB2 STATUS'         03840000
569500     PERFORM 8900-EOJ-RTN                                         03850000
569600     DISPLAY 'CAT731: PROGRAM ENDED ABNORMALLY'                   03860000
569800     CALL ABEND USING ABEND-CODE.                                 03880000
569900                                                                  03890000
570100/                                                                 03900000
570200 8700-SQL-ROLLBACK.                                               03910000
570300     DISPLAY '8700-SQL-ROLLBACK'                                  03920000
570400            ' INFILE-CNT = ' W-INFILE-CNT                         03930000
570500            ' LAST-COMMIT-INFILE-CNT = '                          03940000
570600                                      W-LAST-COMMIT-INFILE-CNT    03950000
570700                                                                  03960000
570800     EXEC SQL ROLLBACK WORK                                       03970000
570900     END-EXEC                                                     03980000
571000                                                                  03990000
571100     MOVE SQLCA   TO ROLLBACK-SQLCA                               04000000
571200     MOVE SQLCODE TO ROLLBACK-RETURN                              04010000
571300                                                                  04020000
571400     IF ROLLBACK-AB                                               04030000
571500         DISPLAY                                                  04040000
571600             'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '           04050000
571700             ROLLBACK-RETURN                                      04060000
571800     ELSE                                                         04070000
571900         DISPLAY                                                  04080000
572000             'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '       04090000
572100             ROLLBACK-RETURN                                      04100000
572200     END-IF.                                                      04110000
572300                                                                  04120000
572600 8900-EOJ-RTN.                                                    04130000
           OPEN OUTPUT LOG-FILE-OUT.                                    04131000
           WRITE LOG-RECORD-OUT FROM WS-LOG-RECORD.                     04132000
           CLOSE LOG-FILE-OUT.                                          04133000
572700     DISPLAY ' '                                                  04140000
572800     DISPLAY 'CAT731: INFILE  COUNT      = ' W-INFILE-CNT         04150000
580000     DISPLAY 'WS-ACTIVE-ROWS-COPIED  ' WS-ACTIVE-ROWS-COPIED      04180000
580000     DISPLAY 'WS-ACTIVE-ROWS-DELETED ' WS-ACTIVE-ROWS-DELETED.    04190000
