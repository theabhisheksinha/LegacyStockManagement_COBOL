000001* PDX    - CAT730   C0249006 06/29/07 12:27:53 TBDOJUN            00001000
      * DJ0001 SSR 47339 SUPPORT DUALLY LISTED SECURITIES               00001029
      * DJ0001           POPULATE GETMSD-CLIENT-PL2 WHEN CALLING GETMSD 00001029
      * PDX    - CAT730   C0171522 03/15/02 13:40:11 TBYOHON            00001029
       IDENTIFICATION DIVISION.                                         00002028
       PROGRAM-ID.  CAT730.                                             00003028
      ***************************************************************** 00004028
      * THIS PROGRAM CONTAINS DB2.                                    * 00005028
      ***************************************************************** 00006028
      * CAT730 - MAINTAIN VRSDACC AND VRSDSEC                         * 00007028
      *                                                               * 00008028
      *    SECURITY IS NOT MSD DELETE FROM VRSDSEC TABLE              * 00009028
      *     IF SECURITY DELETED IS TH ONLEY ON FOR THE ACCOUNT        * 00010028
      *     REMOVE ACCOUNT TOO FROM VRSDACC TABLE                     * 00020028
      *                                                               * 00030028
      *                                                               * 00040028
      ***************************************************************** 00050028
      * 03/23/02 LM    NEW PROGRAM                                    * 00060028
      *                                                               * 00070028
      ***************************************************************** 00080028
      /                                                                 00090028
       ENVIRONMENT DIVISION.                                            00100028
       INPUT-OUTPUT SECTION.                                            00110028
       FILE-CONTROL.                                                    00120028
       DATA DIVISION.                                                   00130028
       FILE SECTION.                                                    00140028
       WORKING-STORAGE SECTION.                                         00150028
           COPY PDXIDCOB.                                               00160028
           COPY STUBCPY.                                                00170028
           03  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.    00180028
                                                                        00190028
       01  W-FIELDS.                                                    00200028
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT730'.    00210028
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.         00220028
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         00230028
               88 NOT-FIRST-TIME                     VALUE '1'.         00240028
           05  END-OF-INPUT-SW           PIC  X(001) VALUE '0'.         00250028
               88 END-OF-INPUT                       VALUE '1'.         00260028
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.         00270028
               88 INFILE-DATE-FOUND                  VALUE 'Y'.         00280028
           05  W-SYS-DATE                PIC  9(006) VALUE 0.           00290028
           05  FILLER  REDEFINES                                        00300028
               W-SYS-DATE.                                              00310028
               10  W-UPD-DATE            PIC  X(006).                   00320028
           05  W-SYS-TIME                PIC  9(008) VALUE 0.           00330028
           05  FILLER  REDEFINES                                        00340028
               W-SYS-TIME.                                              00350028
               10  W-UPD-TIME            PIC  X(006).                   00360028
               10  W-UPD-TIME-MS         PIC  X(002).                   00370028
           05  LD-PROC-DATE.                                            00380028
               10 LD-PROC-DATE-MM        PIC  X(002).                   00390028
               10 LD-PROC-DATE-DD        PIC  X(002).                   00400028
               10 LD-PROC-DATE-YY        PIC  X(002).                   00410028
           05  W-PROC-DT.                                               00420028
               10 W-PROC-DT-YEAR         PIC  X(004).                   00430028
               10 W-PROC-DT-D1           PIC  X(001) VALUE '-'.         00440028
               10 W-PROC-DT-MM           PIC  X(002).                   00450028
               10 W-PROC-DT-D2           PIC  X(001) VALUE '-'.         00460028
               10 W-PROC-DT-DD           PIC  X(002).                   00470028
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.         00480028
               88 HDR-FOUND                          VALUE 'H'.         00490028
               88 TRL-FOUND                          VALUE 'T'.         00500028
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.  00510028
           05  W-INFILE-CNT              PIC  9(009) VALUE 0.           00520028
           05  W-VRSDACC-DELETE-CNT      PIC  9(011) VALUE 0.           00530028
           05  W-VRSDSEC-DELETE-CNT      PIC  9(011) VALUE 0.           00540028
           05  W-VRSDSEC-ROW-CNT         PIC  S9(4) COMP  VALUE +0.     00550028
                                                                        00560028
           05  W-SUB1                    PIC  9(03).                    00570028
       01  FILLER                        PIC X(008) VALUE 'WORKFLDS'.   00580028
       01  W-WORK-FIELDS.                                               00590028
           05  W-DATE.                                                  00600028
               07  W-DATE-YEAR.                                         00610028
                   09  W-DATE-CC         PIC X(2) VALUE ' '.            00620028
                   09  W-DATE-YY         PIC X(2) VALUE ' '.            00630028
               07  FILLER                PIC X(1) VALUE '-'.            00640028
               07  W-DATE-MM             PIC X(2) VALUE ' '.            00650028
               07  FILLER                PIC X(1) VALUE '-'.            00660028
               07  W-DATE-DD             PIC X(2) VALUE ' '.            00670028
                                                                        00680028
           05  W-CLIENT-BR-ACCT.                                        00690028
               10  W-CLIENT-X                PIC X(04).                 00700028
DJ0001         10  W-CLIENT-NUM REDEFINES                               00700028
DJ0001             W-CLIENT-X                PIC 9(04).                 00700028
               10  W-BR.                                                00710028
                   15  W-BR-X                PIC X(03).                 00720028
               10  W-BR-N REDEFINES W-BR     PIC 9(03).                 00730028
               10  W-ACCT.                                              00740028
                   15  W-ACCT-X              PIC X(05).                 00750028
               10  W-ACCT-N REDEFINES W-ACCT PIC 9(05).                 00760028
               10  W-ADP-SEC                 PIC X(07).                 00770028
      ******************************************************************00780028
      * GETMSD COMMAREA                                                *00790028
      ******************************************************************00800028
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.    00810028
           COPY GETMSDCE.                                               00820028
                                                                        00830028
      ******************************************************************00840028
      * B1 HEADER                                                      *00850028
      ******************************************************************00860028
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.    00870028
           COPY BHINFO.                                                 00880028
                                                                        00890028
      ******************************************************************00900028
      * B1 ACAT SECTION                                                *00910028
      ******************************************************************00920028
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.    00930028
           COPY BHACAT.                                                 00940028
                                                                        00950028
      ******************************************************************00960028
      * BPDATE COMMAREA                                                *00970028
      ******************************************************************00980028
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.   00990028
                                                                        01000028
           COPY BPDATESC.                                               01010028
                                                                        01020028
      ***--->COBOL LE                                                   01030028
       01  W-ABEND-AREA.                                                01040028
           03  ABEND-CODE                PIC S9(04) COMP SYNC.          01050028
      ******************************************************************01060028
      * RESIDUAL CREDIT RESTRICTION TABLE                              *01070028
      ******************************************************************01080028
       01  FILLER                        PIC X(008) VALUE 'VRSDACC '.   01090028
           EXEC SQL INCLUDE VRSDACC      END-EXEC.                      01100028
                                                                        01110028
       01  FILLER                        PIC X(008) VALUE 'VRSDSEC '.   01120028
           EXEC SQL INCLUDE VRSDSEC      END-EXEC.                      01130028
                                                                        01140028
      ******************************************************************01150028
      * DB2 COMMAREA                                                   *01160028
      ******************************************************************01170028
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.   01180028
           EXEC SQL INCLUDE SQLCA        END-EXEC.                      01190028
      ******************************************************************01200028
      * DB2 ERROR MESSAGE AREA                                         *01210028
      ******************************************************************01220028
       01  W-DB2-MESSAGE-AREA.                                          01230028
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    01240028
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     01250028
                   INDEXED BY W-DB2-IDX.                                01260028
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     01270028
                                                                        01280028
       01  W-DB2-WORKAREA.                                              01290028
           05  ROLLBACK-SQLCA            PIC  X(122).                   01300028
           05  ROLLBACK-RETURN           PIC S9(009) COMP.              01310028
               88  ROLLBACK-OK                VALUE +0.                 01320028
               88  ROLLBACK-AB                VALUE -999 THRU -1        01330028
                                                    +1   THRU +999.     01340028
           05  COMMIT-SQLCA              PIC  X(122).                   01350028
           05  COMMIT-RETURN             PIC S9(009) COMP.              01360028
               88  COMMIT-OK                  VALUE +0.                 01370028
               88  COMMIT-AB                  VALUE -999 THRU -1        01380028
                                                    +1   THRU +999.     01390028
           05  W-COMMIT-CNT              PIC  9(009) VALUE 0.           01400028
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.           01410028
           05  W-DB2-TABLE-NAME          PIC  X(008).                   01420028
           05  W-DB2-ACTION              PIC  X(008).                   01430028
           05  W-DB2-SQLCODE             PIC ---9.                      01440028
           05  W-RSDSEC-SQLCODE          PIC S9(9) COMP-4.              01450028
           05  W-SQLERRD-3                   PIC  S9(9).                01460028
           05  W-SQL-UPDATE-COUNT            PIC  999999999.            01470028
                                                                        01480028
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.  01490028
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                   01500028
      /                                                                 01510028
      ******************************************************************01520028
      * DECLARE CURSOR FOR ACTIVE TRANSFER TABLE                       *01530028
      * TO GET ALL FULL DELIVER TRANSFERS IN REQ OR REQ-ADJ STATUS     *01540028
      ******************************************************************01550028
       01  FILLER                        PIC X(008) VALUE 'CURSOR'.     01560028
           EXEC SQL                                                     01570028
                DECLARE VRSDSEC_CURSOR CURSOR WITH HOLD FOR             01580028
                SELECT                                                  01590028
                    CLIENT_NBR                                          01600028
                   ,ACCT_CD                                             01610028
                   ,BRANCH_CD                                           01620028
                   ,ISIN_SEC_ISSUE_CD                                   01630028
                   ,SECURITY_ADP_NBR                                    01640028
                   ,PRGM_NM                                             01650028
                   ,CICS_TERM_ID_CD                                     01660028
                   ,CRT_TMSTP                                           01670028
                   ,UPDT_TMSTP                                          01680028
                                                                        01690028
                FROM    VRSDSEC                                         01700028
                                                                        01710028
           END-EXEC.                                                    01720028
                                                                        01730028
       01  FILLER                        PIC  X(008) VALUE 'END-O-WS'.  01740028
                                                                        01750028
       PROCEDURE DIVISION.                                              01760028
                                                                        01770028
       0000-MAIN.                                                       01780028
           DISPLAY 'CAT730   UPDATE RSD ACCOUNT SECURITY TABLES'.       01790028
           DISPLAY ' '.                                                 01800028
           COPY MSGCOBO.                                                01810028
           DISPLAY ' '.                                                 01820028
                                                                        01830028
           PERFORM 1000-INIT                                            01840028
                                                                        01850028
           PERFORM 2000-PROCESS-INPUT                                   01860028
                                                                        01870028
           PERFORM 8900-DISPLAY-CNT                                     01880028
           DISPLAY 'CAT730: PROGRAM ENDED SUCCESSFULLY'.                01890028
                                                                        01900028
           GOBACK.                                                      01910028
                                                                        01920028
       1000-INIT.                                                       01930028
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.        01940028
                                                                        01950028
           EXEC SQL                                                     01960028
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP             01970028
           END-EXEC                                                     01980028
                                                                        01990028
           IF  SQLCODE = +0                                             02000028
               DISPLAY ' '                                              02010028
               DISPLAY 'CAT730: W-CURRENT-TIMESTAMP = '                 02020028
                                                    W-CURRENT-TIMESTAMP 02030028
               DISPLAY ' '                                              02040028
           ELSE                                                         02050028
               DISPLAY 'CAT730: W-CURRENT-TIMESTAMP NOT SET'            02060028
               MOVE SQLCODE      TO W-DB2-SQLCODE                       02070028
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                       02080028
               PERFORM  8500-SQL-ERROR                                  02090028
           END-IF.                                                      02100028
                                                                        02110028
           ACCEPT W-SYS-DATE              FROM DATE.                    02120028
           ACCEPT W-SYS-TIME              FROM TIME.                    02130028
           DISPLAY 'CAT730: SYS-DATE ' W-SYS-DATE                       02140028
                          ' SYS-TIME ' W-SYS-TIME.                      02150028
                                                                        02160028
           MOVE 'CAT730'                  TO BPDATES-CALLING-PGM.       02170028
           SET  LNKDATZ-REQUEST           TO TRUE.                      02180028
           CALL BPDATES USING BPDATES-PARAMETERS.                       02190028
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.           02200028
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.           02210028
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.           02220028
           MOVE BPD-PROC-DATE(1:4)        TO W-PROC-DT-YEAR.            02230028
           MOVE BPD-PROC-DATE(5:2)        TO W-PROC-DT-MM.              02240028
           MOVE BPD-PROC-DATE(7:2)        TO W-PROC-DT-DD.              02250028
                                                                        02260028
           DISPLAY ' '.                                                 02270028
           DISPLAY 'CAT730:       BPD-PROC-DATE= ' BPD-PROC-DATE        02280028
                                '  LD-PROC-DATE= ' LD-PROC-DATE.        02290028
                                                                        02300028
           DISPLAY ' '.                                                 02310028
                                                                        02320028
                                                                        02330028
       2000-PROCESS-INPUT.                                              02340028
                                                                        02350028
           EXEC SQL OPEN VRSDSEC_CURSOR END-EXEC                        02360028
                                                                        02370028
           MOVE SQLCODE      TO W-DB2-SQLCODE                           02380028
           MOVE SQLCODE      TO W-RSDSEC-SQLCODE                        02390028
           IF SQLCODE NOT = +0                                          02400028
              DISPLAY 'VRSDSEC CURSOR OPEN ERROR '                      02410028
                            'SQLCODE = ' W-DB2-SQLCODE                  02420028
           END-IF                                                       02430028
                                                                        02440028
           PERFORM UNTIL W-RSDSEC-SQLCODE NOT = +0                      02450028
                                                                        02460028
              ADD 1 TO W-INFILE-CNT                                     02470028
                                                                        02480028
              EXEC SQL                                                  02490028
                   FETCH VRSDSEC_CURSOR                                 02500028
                INTO                                                    02510028
                  :DCLVRSDSEC.CLIENT-NBR                                02520028
                 ,:DCLVRSDSEC.ACCT-CD                                   02530028
                 ,:DCLVRSDSEC.BRANCH-CD                                 02540028
                 ,:DCLVRSDSEC.ISIN-SEC-ISSUE-CD                         02550028
                 ,:DCLVRSDSEC.SECURITY-ADP-NBR                          02560028
              END-EXEC                                                  02570028
                                                                        02580028
              MOVE SQLCODE      TO W-DB2-SQLCODE                        02590028
              MOVE SQLCODE      TO W-RSDSEC-SQLCODE                     02600028
              EVALUATE SQLCODE                                          02610028
                  WHEN +0                                               02620028
                       PERFORM 3000-CHECK-MSD THRU 3000-EXIT            02630028
                  WHEN +100                                             02640028
                       DISPLAY 'INP=' W-INFILE-CNT                      02650028
                              ' VRSDSEC CURSOR FETCH NOT FOUND '        02660028
                              ' SQLCODE = ' W-DB2-SQLCODE               02670028
                  WHEN OTHER                                            02680028
                       DISPLAY 'INP=' W-INFILE-CNT                      02690028
                              ' VRSDSEC CURSOR FETCH ERROR '            02700028
                              ' SQLCODE = ' W-DB2-SQLCODE               02710028
                       PERFORM  8500-SQL-ERROR                          02720028
              END-EVALUATE                                              02730028
                                                                        02740028
           END-PERFORM                                                  02750028
                                                                        02760028
           EXEC SQL                                                     02770028
                CLOSE VRSDSEC_CURSOR                                    02780028
           END-EXEC                                                     02790028
                                                                        02800028
           MOVE SQLCODE      TO W-DB2-SQLCODE                           02810028
           MOVE SQLCODE      TO W-RSDSEC-SQLCODE                        02820028
           IF  SQLCODE NOT = +0                                         02830028
               DISPLAY 'INP= ' W-INFILE-CNT                             02840028
                      ' VRSDSEC CURSOR CLOSE ERROR '                    02850028
                      ' SQLCODE = ' W-DB2-SQLCODE                       02860028
               PERFORM  8500-SQL-ERROR                                  02870028
           END-IF.                                                      02880028
                                                                        02890028
       3000-CHECK-MSD.                                                  02900028
                                                                        02910028
           MOVE CLIENT-NBR     OF DCLVRSDSEC TO W-CLIENT-X              02920028
           MOVE ACCT-CD        OF DCLVRSDSEC TO W-ACCT-X                02930028
           MOVE BRANCH-CD      OF DCLVRSDSEC TO W-BR-X                  02940028
           MOVE SECURITY-ADP-NBR OF DCLVRSDSEC TO W-ADP-SEC             02950028
                                            GETMSD-SEARCH-KEY-AREA.     02960028
           MOVE 'D'                      TO GETMSD-DEVICE-IND.          02970028
           MOVE 'R'                      TO GETMSD-ACCESS-IND.          02980028
           MOVE 'E'                      TO GETMSD-FORMAT-IND.          02990028
           MOVE SPACE                    TO GETMSD-RETURN-CODE.         03000028
           MOVE '0'                      TO GETMSD-WI-CODE              03020028
DJ0001     MOVE W-CLIENT-NUM             TO GETMSD-CLIENT-PL2.          03010028
                                                                        03030028
           CALL GETMSDC               USING MASTER-SECURITY-RECORD.     03040028
                                                                        03050028
           IF  GETMSD-RETURN-VALID                                      03060028
               GO TO 3000-EXIT                                          03070028
           END-IF                                                       03080028
                                                                        03090028
           EXEC SQL                                                     03100028
                   DELETE FROM VRSDSEC                                  03110028
              WHERE  CLIENT_NBR        =  :W-CLIENT-X                   03120028
                AND  ACCT_CD           =  :W-ACCT-X                     03130028
                AND  BRANCH_CD         =  :W-BR-X                       03140028
                AND  SECURITY_ADP_NBR  =  :W-ADP-SEC                    03150028
           END-EXEC                                                     03160028
                                                                        03170028
           IF  SQLCODE  =  +0                                           03180028
               ADD 1 TO W-VRSDSEC-DELETE-CNT                            03190028
               DISPLAY 'CAT730: DELETED VRSDSEC   ' W-CLIENT-BR-ACCT    03200028
           ELSE                                                         03210028
               DISPLAY 'CAT730: DELETE FAILED FOR ' W-CLIENT-BR-ACCT    03220028
               PERFORM  8500-SQL-ERROR                                  03230028
               GO TO 3000-EXIT                                          03240028
           END-IF                                                       03250028
                                                                        03260028
           MOVE +0             TO    W-VRSDSEC-ROW-CNT                  03270028
           EXEC SQL                                                     03280028
                 SELECT COUNT(*)                                        03290028
                   INTO :W-VRSDSEC-ROW-CNT                              03300028
                   FROM VRSDSEC                                         03310028
              WHERE  CLIENT_NBR        =  :W-CLIENT-X                   03320028
                AND  BRANCH_CD         =  :W-BR-X                       03330028
                AND  ACCT_CD           =  :W-ACCT-X                     03340028
           END-EXEC                                                     03350028
                                                                        03360028
           IF  SQLCODE  =  +0                                           03370028
               CONTINUE                                                 03380028
           ELSE                                                         03390028
               DISPLAY 'CAT730: ROW COUNT FAILED ' W-CLIENT-BR-ACCT     03400028
               PERFORM  8500-SQL-ERROR                                  03410028
               GO TO 3000-EXIT                                          03420028
           END-IF.                                                      03430028
                                                                        03440028
           IF  W-VRSDSEC-ROW-CNT  = 0                                   03450028
             EXEC SQL                                                   03460028
                   DELETE FROM VRSDACC                                  03470028
               WHERE  CLIENT_NBR        =  :W-CLIENT-X                  03480028
                 AND  ACCT_CD           =  :W-ACCT-X                    03490028
                 AND  BRANCH_CD         =  :W-BR-X                      03500028
             END-EXEC                                                   03510028
             IF  SQLCODE  =  +0                                         03520028
               ADD 1 TO W-VRSDACC-DELETE-CNT                            03530028
               DISPLAY 'CAT730: DELETED VRSDACC   ' W-CLIENT-BR-ACCT    03540028
             ELSE                                                       03550028
               DISPLAY 'CAT730: VRSDACC DEL FAIL ' W-CLIENT-BR-ACCT     03560028
               PERFORM  8500-SQL-ERROR                                  03570028
             END-IF                                                     03580028
           END-IF                                                       03590028
           .                                                            03600028
                                                                        03610028
       3000-EXIT. EXIT.                                                 03620028
                                                                        03630028
                                                                        03640028
       8500-SQL-ERROR.                                                  03650028
           DISPLAY ' '                                                  03660028
           DISPLAY '8500-SQL-ERROR'                                     03670028
                  ' INFILE-CNT = ' W-INFILE-CNT                         03680028
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT        03690028
                                                                        03700028
           DISPLAY ' '                                                  03710028
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  03720028
                                    W-DB2-MESSAGE-LEN.                  03730028
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        03740028
             UNTIL W-DB2-IDX GREATER THAN 12                            03750028
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              03760028
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               03770028
                   END-IF                                               03780028
           END-PERFORM.                                                 03790028
           DISPLAY ' '                                                  03800028
                                                                        03810028
           PERFORM 8700-SQL-ROLLBACK                                    03820028
                                                                        03830028
           DISPLAY 'CAT730: U3999 - ABENDING ON BAD DB2 STATUS'         03840028
           PERFORM 8900-DISPLAY-CNT                                     03850028
           DISPLAY 'CAT730: PROGRAM ENDED ABNORMALLY'                   03860028
           MOVE +3999    TO ABEND-CODE                                  03870028
           CALL ABEND USING ABEND-CODE.                                 03880028
                                                                        03890028
      /                                                                 03900028
       8700-SQL-ROLLBACK.                                               03910028
           DISPLAY '8700-SQL-ROLLBACK'                                  03920028
                  ' INFILE-CNT = ' W-INFILE-CNT                         03930028
                  ' LAST-COMMIT-INFILE-CNT = '                          03940028
                                            W-LAST-COMMIT-INFILE-CNT    03950028
                                                                        03960028
           EXEC SQL ROLLBACK WORK                                       03970028
           END-EXEC                                                     03980028
                                                                        03990028
           MOVE SQLCA   TO ROLLBACK-SQLCA                               04000028
           MOVE SQLCODE TO ROLLBACK-RETURN                              04010028
                                                                        04020028
           IF ROLLBACK-AB                                               04030028
               DISPLAY                                                  04040028
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '           04050028
                   ROLLBACK-RETURN                                      04060028
           ELSE                                                         04070028
               DISPLAY                                                  04080028
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '       04090028
                   ROLLBACK-RETURN                                      04100028
           END-IF.                                                      04110028
                                                                        04120028
       8900-DISPLAY-CNT.                                                04130028
           DISPLAY ' '                                                  04140028
           DISPLAY 'CAT730: INFILE  COUNT      = ' W-INFILE-CNT         04150028
           DISPLAY 'CAT730: W-VRSDACC-DELETE-CNT     = '                04160028
                            W-VRSDACC-DELETE-CNT                        04170028
           DISPLAY 'CAT730: W-VRSDSEC-DELETE-CNT     = '                04180028
                            W-VRSDSEC-DELETE-CNT                        04190028
           DISPLAY ' '                                                  04200028
           .                                                            04210028
                                                                        04220028
