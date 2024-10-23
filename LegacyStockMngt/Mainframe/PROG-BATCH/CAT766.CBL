000001* PDX    - CAT766   C0285901 10/12/09 12:47:50 TBLAMUR            00001049
       IDENTIFICATION DIVISION.                                         00030000
       PROGRAM-ID.  CAT766.                                             00040000
       AUTHOR.      LARRY MUREY.                                        00050000
       DATE-WRITTEN.  SEPT 2009.                                        00060000
                                                                        00070000
      *---------------------------------------------------------------- 00080000
      * THE PURPOSE OF THIS PROGRAM IS TO EXTRACT RECEIVER SIDE         00090000
      * ACTIVE TRANSFERS AND ASSETS (VTRNFR AND VASSET) IN A FAVORABLE  00100000
      * STATUS.  THIS FILE WILL BE USED TO CREATE THE MSD FUZZY MATCH   00110000
      * REPORT IN CAT766A.                                              00120000
      *---------------------------------------------------------------- 00550000
           EJECT                                                        00560000
      ***************************************************************** 00570000
       ENVIRONMENT DIVISION.                                            00571000
      ***************************************************************** 00572000
       INPUT-OUTPUT SECTION.                                            00573000
       FILE-CONTROL.                                                    00574000
                                                                        00575000
           SELECT PENDING-FILE                  ASSIGN  TO  ACATPEND.   00576048
                                                                        00577000
      ***************************************************************** 00578000
       DATA DIVISION.                                                   00579000
      ***************************************************************** 00580000
                                                                        00590000
       FILE SECTION.                                                    00600000
                                                                        00610000
       FD  PENDING-FILE                                                 00620000
           RECORDING MODE IS V                                          00630000
           BLOCK CONTAINS 0 RECORDS.                                    00640000
       COPY ACATRCVR  REPLACING ==:FMT:== BY ==PEND==.                  00650004
                                                                        00660000
           EJECT                                                        00670000
      ******************************************************************00680000
       WORKING-STORAGE SECTION.                                         00690000
      ******************************************************************00700000
                                                                        00710000
       77  ABEND-CODE              COMP  PIC S9(4)   VALUE +9999.       00720000
                                                                        00730000
       77  ACAT-PROC-DATE                   PIC X(08)  VALUE ' '.       00740000
                                                                        00750000
       77  WS-TRADE-PLUS-1                  PIC X(08)  VALUE ' '.       00760000
       77  WS-CAGE-MFC-DATE                 PIC X(08)  VALUE ' '.       00770015
                                                                        00780000
       77  WS-DATE                          PIC X(10).                  00790000
                                                                        00810000
       77  WS-TOTAL-TI-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00820000
       77  WS-TOTAL-AT-REC-CNTR  COMP-3  PIC  9(09)  VALUE ZEROES.      00830000
       77  PENDFILE-REC-CNTR     COMP-3  PIC  9(09)  VALUE ZEROES.      00950000
                                                                        00960000
           COPY BPDATESC.                                               00970011
           COPY STUBCPY.                                                01010000
                                                                        01720000
       01  WS-CRT-DATE-TODAY.                                           01721032
           05  WS-CRT-DATE-CCYY          PIC X(04).                     01722032
           05  FILLER                    PIC X        VALUE '-'.        01723032
           05  WS-CRT-DATE-MM            PIC X(02).                     01723132
           05  FILLER                    PIC X        VALUE '-'.        01723232
           05  WS-CRT-DATE-DD            PIC X(02).                     01723332
                                                                        01723432
       01  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.    01731032
       01  WS-DB2-MESSAGE-AREA.                                         01740000
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.    01750000
           05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES     01760000
               INDEXED BY WS-ERROR-INDEX.                               01770000
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.     01780000
                                                                        01910000
       COPY ACATRCVR  REPLACING ==:FMT:== BY ==FMT==.                   01920004
           EJECT                                                        01930000
      *DB2 COMMUNICATION AREA                                           01940000
           EXEC SQL                                                     01950000
              INCLUDE SQLCA                                             01960000
           END-EXEC.                                                    01970000
                                                                        01980000
           EJECT                                                        01990000
           EXEC SQL                                                     02000000
              INCLUDE VTRNFR                                            02010000
           END-EXEC.                                                    02020000
                                                                        02030000
           EJECT                                                        02040000
           EXEC SQL                                                     02050000
              INCLUDE VASSET                                            02060000
           END-EXEC.                                                    02070000
                                                                        02300000
      *DECLARE CURSOR TO OBTAIN TI RECORDS                              02310001
           EXEC SQL                                                     02330000
              DECLARE NSCC_TI_CRSR CURSOR FOR                           02340000
                 SELECT                                                 02350000
                    CLIENT_NBR,                                         02360000
                    ACAT_CONTROL_NBR,                                   02370000
                    ACCT_RCV_NBR,                                       02390000
                    STTS_CD,                                            02420000
                    TRNFR_TYPE_CD,                                      02440000
                    STTLM_DT                                            02530032
                 FROM VTRNFR                                            02580000
                 WHERE DSTBN_SIDE_CD  = 'R'                             02581001
                    AND  TRNFR_TYPE_CD IN ('FUL', 'PTR', 'PTD', 'RCR')  02582043
                    AND  STTS_CD IN                                     02590001
                     ('200', '210', '220', '230', '240', '300', '310')  02590108
                 ORDER BY CLIENT_NBR                                    02590229
                 FOR READ ONLY WITH UR                                  02590315
           END-EXEC.                                                    02600000
                                                                        02920000
      * DECLARE CURSOR TO OBTAIN ALL AT RECORDS FOR THIS CONTROL NBR    02921000
           EXEC SQL                                                     02922000
              DECLARE NSCC_AT1_CRSR CURSOR FOR                          02923000
                 SELECT                                                 02924000
                    CLIENT_NBR,                                         02925000
                    ACAT_CONTROL_NBR,                                   02926000
                    ASSET_SEQ_NBR,                                      02927000
                    NSCC_NON_ADP_IND,                                   02927103
                    TRANS_TYPE_CD,                                      02928000
                    ASSET_PRC_CTGY_CD,                                  02940000
                    STTLM_LCTN_CD,                                      02960000
                    STTLM_RSN_CD,                                       02970000
                    ISIN_CNTRY_CD,                                      02980000
                    ISIN_SEC_ISSUE_CD,                                  02990000
                    ISIN_SEC_CDG_CD,                                    03000000
                    ASSET_DESC_TXT,                                     03010000
                    PSTN_CD,                                            03060000
                    ISO_CRNCY_CD,                                       03070000
                    ASSET_AMT,                                          03080000
                    BEARER_BOND_CD,                                     03100000
                    CSH_MGN_SHRT_CD,                                    03110000
                    WHI_CD,                                             03120000
                    TRNFR_TYPE_RSN_CD,                                  03130000
                    SECURITY_ADP_NBR,                                   03170032
                    CRT_TMSTP                                           03180032
                 FROM VASSET                                            03210000
                 WHERE CLIENT_NBR   = :DCLVTRNFR.CLIENT-NBR             03220000
                  AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR   03230000
                  AND NOT STTLM_LCTN_CD = '35'                          03240015
                  AND NOT STTLM_LCTN_CD = '40'                          03240115
                  AND NOT STTLM_LCTN_CD = '45'                          03240215
                  AND NOT STTLM_LCTN_CD = '60'                          03241015
                  AND NOT STTLM_LCTN_CD = '65'                          03250015
                  AND SECURITY_ADP_NBR > '       '                      03250128
                 FOR READ ONLY WITH UR                                  03251015
           END-EXEC.                                                    03260000
                                                                        03270000
           EJECT                                                        04300000
      ***************************************************************** 04310000
       PROCEDURE DIVISION.                                              04320001
      ***************************************************************** 04330000
           DISPLAY 'CAT766 - EXTRACT RECEIVER SIDE ASSETS'.             04340001
           DISPLAY ' '.                                                 04350000
           COPY MSGCOBO.                                                04360000
                                                                        04370000
           PERFORM INITIAL-ROUTINE.                                     04380000
                                                                        04390000
           PERFORM PROCESS-ROUTINE.                                     04400000
                                                                        04410000
           PERFORM ENDJOB-ROUTINE.                                      04420000
                                                                        04430000
           GOBACK.                                                      04440000
                                                                        04450000
           EJECT                                                        04460000
       PROCESS-ROUTINE.                                                 04470000
                                                                        04480000
           EXEC SQL OPEN NSCC_TI_CRSR END-EXEC                          04570006
                                                                        04580006
           IF SQLCODE NOT = +0                                          04590000
              MOVE 2400 TO ABEND-CODE                                   04600000
              PERFORM SQL-ERROR-ROUTINE                                 04610000
           END-IF.                                                      04620000
                                                                        04630000
           PERFORM UNTIL SQLCODE NOT = +0                               04640000
              EXEC SQL                                                  04670002
                 FETCH NSCC_TI_CRSR                                     04680002
                    INTO                                                04690000
                     :DCLVTRNFR.CLIENT-NBR                              04700000
                    ,:DCLVTRNFR.ACAT-CONTROL-NBR                        04710000
                    ,:DCLVTRNFR.ACCT-RCV-NBR                            04730000
                    ,:DCLVTRNFR.STTS-CD                                 04760000
                    ,:DCLVTRNFR.TRNFR-TYPE-CD                           04780000
                    ,:DCLVTRNFR.STTLM-DT                                04870000
                    ,:DCLVTRNFR.CRT-TMSTP                               04880032
                END-EXEC                                                04920000
                                                                        05210000
              EVALUATE SQLCODE                                          05220000
                 WHEN +100                                              05230000
                    CONTINUE                                            05240000
                 WHEN +0                                                05250000
                    ADD 1 TO WS-TOTAL-TI-REC-CNTR                       05440002
                    PERFORM WRITE-TI-RECORD-RTN                         05490002
                    PERFORM FETCH-AT-RECORDS                            05510002
                 WHEN OTHER                                             05550000
                    MOVE 2500 TO ABEND-CODE                             05560000
                    PERFORM SQL-ERROR-ROUTINE                           05570000
              END-EVALUATE                                              05580000
           END-PERFORM.                                                 05590000
                                                                        05600000
           IF SQLCODE NOT = +100                                        05610000
              MOVE 2800 TO ABEND-CODE                                   05620000
              PERFORM SQL-ERROR-ROUTINE                                 05630000
           END-IF                                                       05640000
                                                                        05650000
           EXEC SQL                                                     05720002
              CLOSE NSCC_TI_CRSR                                        05730002
           END-EXEC                                                     05740002
                                                                        05760000
           IF SQLCODE NOT = +0                                          05770000
              MOVE 3200 TO ABEND-CODE                                   05780000
              PERFORM SQL-ERROR-ROUTINE                                 05790000
           ELSE                                                         05800000
              MOVE +0                       TO  SQLCODE                 05810000
           END-IF.                                                      05820000
                                                                        05830000
                                                                        05840000
       WRITE-TI-RECORD-RTN.                                             05850000
                                                                        05860000
           MOVE SPACES TO FMT-AT-RECORD.                                05870000
           MOVE CLIENT-NBR OF DCLVTRNFR TO FMT-TI-ADP-CL-NO.            05880000
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO FMT-TI-CONTROL-NUM.    05890000
           SET FMT-TI-RECORD-ID TO TRUE.                                05900000
           MOVE ACCT-RCV-NBR OF DCLVTRNFR TO FMT-TI-CUST-ACCOUNT        05960002
           MOVE STTS-CD  OF DCLVTRNFR TO FMT-STATUS-CD.                 06320000
           MOVE STTLM-DT OF DCLVTRNFR TO WS-DATE.                       06340000
           MOVE WS-DATE(1 : 4) TO FMT-SETTL-DATE(1 : 4).                06350000
           MOVE WS-DATE(6 : 2) TO FMT-SETTL-DATE(5 : 2).                06360000
           MOVE WS-DATE(9 : 2) TO FMT-SETTL-DATE(7 : 2).                06370000
           MOVE FMT-SETTL-DATE TO FMT-AT-SETTL-DATE.                    06380000
           MOVE TRNFR-TYPE-CD OF DCLVTRNFR TO FMT-TRNFR-TYPE.           06510000
                                                                        06550000
           WRITE PEND-TI-RECORD FROM  FMT-TI-RECORD                     06630002
           ADD 1    TO  PENDFILE-REC-CNTR.                              06640002
           EJECT                                                        07093000
      ******************                                                07094000
       FETCH-AT-RECORDS.                                                07095000
      ******************                                                07096000
                                                                        07097000
             EXEC SQL                                                   07098000
                OPEN NSCC_AT1_CRSR                                      07099000
             END-EXEC                                                   07100000
                                                                        07110000
           IF SQLCODE NOT = +0                                          07120000
              MOVE 3200 TO ABEND-CODE                                   07130000
              PERFORM SQL-ERROR-ROUTINE                                 07140000
           END-IF                                                       07150000
                                                                        07160000
           PERFORM UNTIL SQLCODE NOT = +0                               07170000
                 EXEC SQL                                               07180000
                    FETCH NSCC_AT1_CRSR                                 07190000
                      INTO                                              07200000
                     :DCLVASSET.CLIENT-NBR                              07210000
                    ,:DCLVASSET.ACAT-CONTROL-NBR                        07220000
                    ,:DCLVASSET.ASSET-SEQ-NBR                           07230000
                    ,:DCLVASSET.NSCC-NON-ADP-IND                        07231003
                    ,:DCLVASSET.TRANS-TYPE-CD                           07240000
                    ,:DCLVASSET.ASSET-PRC-CTGY-CD                       07250003
                    ,:DCLVASSET.STTLM-LCTN-CD                           07290000
                    ,:DCLVASSET.STTLM-RSN-CD                            07300000
                    ,:DCLVASSET.ISIN-CNTRY-CD                           07310000
                    ,:DCLVASSET.ISIN-SEC-ISSUE-CD                       07320000
                    ,:DCLVASSET.ISIN-SEC-CDG-CD                         07330000
                    ,:DCLVASSET.ASSET-DESC-TXT                          07340000
                    ,:DCLVASSET.PSTN-CD                                 07390000
                    ,:DCLVASSET.ISO-CRNCY-CD                            07400000
                    ,:DCLVASSET.ASSET-AMT                               07410000
                    ,:DCLVASSET.BEARER-BOND-CD                          07430000
                    ,:DCLVASSET.CSH-MGN-SHRT-CD                         07440000
                    ,:DCLVASSET.WHI-CD                                  07450000
                    ,:DCLVASSET.TRNFR-TYPE-RSN-CD                       07460000
                    ,:DCLVASSET.SECURITY-ADP-NBR                        07500000
                    ,:DCLVASSET.CRT-TMSTP                               07510032
                 END-EXEC                                               07531000
                                                                        07532000
              EVALUATE SQLCODE                                          07533000
                 WHEN +100                                              07534000
                   CONTINUE                                             07535000
                 WHEN +0                                                07536000
LRM**************** IF CRT-TMSTP OF DCLVASSET (1:10) = WS-CRT-DATE-TODAY07537045
                      ADD 1 TO WS-TOTAL-AT-REC-CNTR                     07553000
                      PERFORM WRITE-AT-RECORD                           07554000
LRM**************** END-IF                                              07555045
              END-EVALUATE                                              07556000
           END-PERFORM.                                                 07557000
                                                                        07558000
           IF SQLCODE NOT = +100                                        07559000
              MOVE 3400 TO ABEND-CODE                                   07560000
              PERFORM SQL-ERROR-ROUTINE                                 07570000
           END-IF                                                       07580000
                                                                        07590000
           EXEC SQL                                                     07600000
              CLOSE NSCC_AT1_CRSR                                       07610000
           END-EXEC                                                     07620000
                                                                        07630000
           IF SQLCODE NOT = +0                                          07640000
              MOVE 4400 TO ABEND-CODE                                   07650000
              PERFORM SQL-ERROR-ROUTINE                                 07660000
           END-IF                                                       07670000
                                                                        07680000
           .                                                            07690000
                                                                        07700000
           EJECT                                                        07710000
      *****************                                                 07720000
       WRITE-AT-RECORD.                                                 07730000
      *****************                                                 07740000
                                                                        07750000
           MOVE CLIENT-NBR OF DCLVTRNFR TO FMT-AT-ADP-CL-NO.            07760000
           SET FMT-AT-RECORD-ID TO TRUE.                                07770000
           MOVE ACCT-RCV-NBR OF DCLVTRNFR TO FMT-AT-CUST-ACCOUNT        07860003
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO FMT-AT-CONTROL-NUM.    08180000
           MOVE ASSET-SEQ-NBR OF DCLVASSET TO FMT-ASSET-SEQ-NO-9.       08190000
           MOVE ISIN-CNTRY-CD              TO FMT-ISIN-CNTRY-CD         08191023
           MOVE ISIN-SEC-ISSUE-CD          TO FMT-ISIN-SEC-ISSUE-CD     08192023
           MOVE ISIN-SEC-CDG-CD            TO FMT-ISIN-SEC-CDG-CD       08193023
                                                                        08200000
           MOVE STTLM-LCTN-CD     OF DCLVASSET TO FMT-STTLM-LCTN-CD.    08290000
           MOVE STTLM-RSN-CD      OF DCLVASSET TO FMT-STTLM-RSN-CD.     08300000
           MOVE PSTN-CD           OF DCLVASSET TO FMT-PSTN-CD.          08310000
                                                                        08320000
           MOVE ASSET-DESC-TXT OF DCLVASSET    TO FMT-SEC-DESC-1.       08330026
           MOVE NSCC-NON-ADP-IND OF DCLVASSET  TO FMT-NSCC-NON-ADP-IND  08331026
                                                                        08340000
           IF CSH-MGN-SHRT-CD = 'C' OR 'M' OR 'S'                       08580000
              MOVE CSH-MGN-SHRT-CD TO FMT-CASH-MGN-IND                  08581000
           ELSE                                                         08582000
              MOVE 'C'             TO FMT-CASH-MGN-IND                  08583000
           END-IF.                                                      08584000
                                                                        08585000
           MOVE BEARER-BOND-CD TO FMT-SEC-TYPE.                         08586000
           MOVE WHI-CD TO FMT-SEC-WHEN-ISSUE-CD.                        08587000
           MOVE ASSET-PRC-CTGY-CD TO FMT-PRC-CTGY-CD.                   08588000
           MOVE SECURITY-ADP-NBR OF DCLVASSET TO FMT-ADP-SEC-NO.        08750000
           MOVE TRNFR-TYPE-RSN-CD OF DCLVASSET TO FMT-TRNFR-TYPE-RSN-CD.08770000
           MOVE CRT-TMSTP OF DCLVASSET (1:16)  TO FMT-AT-CRT-TIMESTAMP. 08780039
                                                                        08830000
           WRITE PEND-AT-RECORD  FROM  FMT-AT-RECORD.                   08895000
           ADD 1    TO  PENDFILE-REC-CNTR.                              08896000
                                                                        08897000
           EXIT.                                                        11969900
                                                                        11970100
      *******************                                               11970200
       SQL-ERROR-ROUTINE.                                               11970300
      *******************                                               11970400
                                                                        11970500
           DISPLAY 'SQLCODE IS ' SQLCODE.                               11970600
                                                                        11970700
           CALL DSNTIAR               USING  SQLCA                      11970800
                                             WS-DB2-MESSAGE-AREA        11970900
                                             WS-ERR-LINE-LEN            11971000
                                                                        11972000
           DISPLAY ' '                                                  11973000
                                                                        11974000
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   11975000
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      11976000
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              11977000
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        11978000
                 END-IF                                                 11979000
           END-PERFORM                                                  11980000
                                                                        11990000
           DISPLAY ' '                                                  12000000
           DISPLAY '*** PROGRAM IS ABENDING'                            12010000
           DISPLAY ' '                                                  12020000
                                                                        12030000
           EXEC SQL  ROLLBACK  END-EXEC                                 12040000
           CALL ABEND USING ABEND-CODE                                  12050000
                                                                        12060000
           .                                                            12070000
                                                                        12080000
           EJECT                                                        12090000
      *****************                                                 12100000
       INITIAL-ROUTINE.                                                 12110000
      *****************                                                 12120000
                                                                        12130000
           OPEN OUTPUT  PENDING-FILE                                    12140000
                                                                        12150000
           MOVE  'CAT766'                     TO BPDATES-CALLING-PGM.   12180003
           MOVE  'C'                          TO BPDATES-REQ-TYPE.      12190000
                                                                        12200000
           CALL    BPDATES            USING BPDATES-PARAMETERS.         12210000
                                                                        12220000
           MOVE BPD-PROC-DATE TO  ACAT-PROC-DATE                        12370031
           MOVE BPD-PROC-DATE(1:4) TO WS-CRT-DATE-CCYY                  12371033
           MOVE BPD-PROC-DATE(5:2) TO WS-CRT-DATE-MM                    12372033
           MOVE BPD-PROC-DATE(7:2) TO WS-CRT-DATE-DD                    12373033
LRM******* DISPLAY 'WS DB2 SELECT/CREATION DATE' WS-CRT-DATE-TODAY.     12380045
                                                                        12890000
           SET FMT-HEADER-ID    TO TRUE.                                12900000
           SET FMT-HEADER-LIT1  TO TRUE.                                12910000
           SET FMT-HEADER-LIT2  TO TRUE.                                12920000
           MOVE ACAT-PROC-DATE  TO  FMT-BOOK-DATE                       12940000
           WRITE PEND-HEADER-RECORD FROM  FMT-HEADER-RECORD.            12960000
                                                                        12970000
           EJECT                                                        14200000
      ****************                                                  14210000
       ENDJOB-ROUTINE.                                                  14220000
      ****************                                                  14230000
                                                                        14231000
           CLOSE  PENDING-FILE                                          14232000
                                                                        14233000
           DISPLAY ' '                                                  14234000
           DISPLAY '   DB2 INPUT TOTALS'                                14235000
           DISPLAY '   -----------------'                               14236000
           DISPLAY 'NUMBER OF TI RECORDS: ' WS-TOTAL-TI-REC-CNTR        14237000
           DISPLAY 'NUMBER OF AT RECORDS: ' WS-TOTAL-AT-REC-CNTR        14238000
           DISPLAY ' '                                                  14340000
           DISPLAY 'PEND FILE RECORDS   : ' PENDFILE-REC-CNTR           14350000
                                                                        14360000
           DISPLAY ' '                                                  14370000
           DISPLAY '***************************'                        14380000
           DISPLAY '* END OF CAT766 PROGRAM *'                          14390003
           DISPLAY '***************************'                        14400000
           DISPLAY ' '.                                                 14410000
