000001* PDX    - CAT751   C0272055 10/22/08 11:58:22 TBLAMUR            00001000
LRM001* SSR 60125 RECOMPILE FOR EXPANSION TO ACATPEND                   00001101
000001* PDX    - CAT751   C0211125 12/23/04 15:07:46 TBLAMUR            00001200
       IDENTIFICATION DIVISION.                                         00003000
       PROGRAM-ID.  CAT751.                                             00004000
       AUTHOR.      LARRY MUREY.                                        00005000
       DATE-WRITTEN.  OCT 2004.                                         00006000
      *---------------------------------------------------------------- 00007000
      * THE PURPOSE OF THIS PROGRAM IS TO OMIT FUND ASSETS WHICH WERE   00008000
      * IDENTIFIED AS AUTO-DELETE FROM THE ACATS "PRETEND IT SETTLED    00009000
      * YESTERDAY MARGIN CALC" WHICH IS VIEWED VIA "C" SCREEN PF2.      00010000
      * SSR 0029649.  BASED ON B1 434689, FIRST OBTAIN CURRENT ACAT     00020000
      * STATUS FROM VTRNFR, AND FOR 200,210L OOK ON VINITAST TABLE FOR  00021000
      * AN ASSET DELETE REQUEST, FOR MFNM AND MFMM ASSETS, AND DO NOT   00030000
      * WRITE THIS ASSET OUT WHEN FOUND.                                00040000
      *---------------------------------------------------------------- 00050000
           EJECT                                                        00060000
      ***************************************************************** 00070000
       ENVIRONMENT DIVISION.                                            00080000
      ***************************************************************** 00090000
       INPUT-OUTPUT SECTION.                                            00100000
       FILE-CONTROL.                                                    00110000
                                                                        00120000
           SELECT PENDING-FILE                  ASSIGN  TO  IPEND.      00130000
           SELECT PENDING-FILE-OUT              ASSIGN  TO  OPEND.      00140000
                                                                        00150000
      ***************************************************************** 00160000
       DATA DIVISION.                                                   00170000
      ***************************************************************** 00180000
                                                                        00190000
       FILE SECTION.                                                    00200000
                                                                        00210000
       FD  PENDING-FILE                                                 00220000
           RECORDING MODE IS V                                          00230000
           RECORD IS VARYING IN SIZE FROM 1 TO 1000 CHARACTERS          00240000
              DEPENDING ON WS-PEND-REC-LEN-IN                           00250000
           BLOCK CONTAINS 0 RECORDS.                                    00260000
       COPY ACATPEND  REPLACING ==:FMT:== BY ==PEND==.                  00270000
       01  PEND-REC-IN            PIC X(1000).                          00280000
                                                                        00290000
       FD  PENDING-FILE-OUT                                             00300000
           RECORDING MODE IS V                                          00310000
           RECORD IS VARYING IN SIZE FROM 1 TO 1000 CHARACTERS          00320000
              DEPENDING ON WS-PEND-REC-LEN-OUT                          00330000
           BLOCK CONTAINS 0 RECORDS.                                    00340000
       COPY ACATPEND  REPLACING ==:FMT:== BY ==OPEND==.                 00350000
       01  PEND-REC-OUT           PIC X(1000).                          00360000
                                                                        00370000
           EJECT                                                        00380000
      ******************************************************************00390000
       WORKING-STORAGE SECTION.                                         00400000
      ******************************************************************00410000
                                                                        00420000
       77  ABEND-CODE              COMP  PIC S9(4)   VALUE +9999.       00430000
                                                                        00440000
       77  WS-TOTAL-TI-SELECT    COMP-3  PIC  9(09)  VALUE ZEROES.      00450000
       77  WS-TOTAL-AT-SELECT    COMP-3  PIC  9(09)  VALUE ZEROES.      00460000
       77  PENDFILE-REC-READ     COMP-3  PIC  9(09)  VALUE ZEROES.      00470000
       77  PENDFILE-REC-DROP     COMP-3  PIC  9(09)  VALUE ZEROES.      00480000
       77  PENDFILE-REC-WRITTEN  COMP-3  PIC  9(09)  VALUE ZEROES.      00490000
                                                                        00500000
       01  WS-PEND-REC-LEN-IN            PIC 9(05) VALUE ZERO.          00510000
       01  WS-PEND-REC-LEN-OUT           PIC 9(05) VALUE ZERO.          00520000
       01  WS-PENDFILE-EOF-SW            PIC X(01)  VALUE 'N'.          00530000
           88  PENDFILE-EOF                         VALUE 'Y'.          00540000
       01  WS-STATUS-CD                  PIC X(03) VALUE SPACES.        00550000
                                                                        00560000
           COPY STUBCPY.                                                00570000
                                                                        00580000
       01  B1-SUB               PIC S9(3) COMP-3 VALUE ZEROS.           00590000
       01  B1-TABLE.                                                    00600000
           05  B1-TABLE-ENTRY OCCURS 500 TIMES.                         00610000
               07  B1-AUTO-DELETE        PIC X.                         00620000
                                                                        00630000
           COPY BHINFO.                                                 00640000
                                                                        00650000
           COPY BHACAT.                                                 00660000
                                                                        00670000
           EJECT                                                        00680000
           COPY BPDATESC.                                               00690000
                                                                        00700000
           SKIP3                                                        00710000
           COPY RECDATZC.                                               00720000
                                                                        00730000
       01  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.    00740000
       01  WS-DB2-MESSAGE-AREA.                                         00750000
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.    00760000
           05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES     00770000
               INDEXED BY WS-ERROR-INDEX.                               00780000
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.     00790000
                                                                        00800000
           EJECT                                                        00810000
      *DB2 COMMUNICATION AREA                                           00820000
           EXEC SQL                                                     00830000
              INCLUDE SQLCA                                             00840000
           END-EXEC.                                                    00850000
                                                                        00860000
           EJECT                                                        00870000
           EXEC SQL                                                     00880000
              INCLUDE VTRNFR                                            00890000
           END-EXEC.                                                    00900000
                                                                        00910000
           EXEC SQL                                                     00920000
              INCLUDE VINITAST                                          00930000
           END-EXEC.                                                    00940000
                                                                        00950000
                                                                        00960000
           EJECT                                                        00970000
      ***************************************************************** 00980000
       PROCEDURE DIVISION.                                              00990000
      ***************************************************************** 01000000
           DISPLAY 'CAT751 - OMIT AUTO-DELETE FUNDS FROM ACATMRGN'.     01010000
           DISPLAY ' '.                                                 01020000
           COPY MSGCOBO.                                                01030000
                                                                        01040000
           PERFORM 900-INITIAL-ROUTINE.                                 01050000
                                                                        01060000
           PERFORM 100-PROCESS-ROUTINE                                  01070000
              UNTIL PENDFILE-EOF.                                       01080000
                                                                        01090000
           PERFORM 999-ENDJOB-ROUTINE.                                  01100000
                                                                        01110000
           GOBACK.                                                      01120000
                                                                        01130000
           EJECT                                                        01140000
       100-PROCESS-ROUTINE.                                             01150000
           IF PEND-HEADER-ID                                            01160000
              PERFORM 300-WRITE-PEND-RECORD                             01170000
           ELSE                                                         01180000
           IF PEND-TI-RECORD-ID                                         01190000
               MOVE '0'                 TO CLIENT-NBR                   01200000
                                  OF DCLVTRNFR (1 : 1)                  01210000
               MOVE PEND-TI-ADP-CL-NO-X TO CLIENT-NBR                   01220000
                                  OF DCLVTRNFR (2 : 3)                  01230000
               MOVE PEND-TI-CONTROL-NUM TO ACAT-CONTROL-NBR             01240000
                                               OF DCLVTRNFR             01250000
              PERFORM 120-SELECT-VTRNFR-RTN                             01260000
              PERFORM 300-WRITE-PEND-RECORD                             01270000
           ELSE                                                         01280000
           IF NOT PEND-AT-RECORD-ID                                     01290000
           OR NOT PEND-MUTUAL-FUND                                      01300000
           OR PEND-AT-CLNT-IS-DELIVERER                                 01310000
           OR B1-AUTO-DELETE (PEND-TI-ADP-CL-NO) = '0'                  01320000
           OR (STTS-CD NOT = '200' AND '210')                           01330000
              PERFORM 300-WRITE-PEND-RECORD                             01350000
           ELSE                                                         01360000
               MOVE '0'                 TO CLIENT-NBR                   01370000
                                  OF DCLVTRNFR (1 : 1)                  01380000
               MOVE PEND-AT-ADP-CL-NO-X TO CLIENT-NBR                   01390000
                                  OF DCLVTRNFR (2 : 3)                  01400000
               MOVE PEND-AT-CONTROL-NUM TO ACAT-CONTROL-NBR             01410000
                                               OF DCLVTRNFR             01420000
               MOVE PEND-ASSET-SEQ-NO-9 TO ASSET-SEQ-NBR                01430000
                                               OF DCLVINITAST           01440000
               PERFORM 150-SELECT-VINITAST-RTN                          01450000
               IF SQLCODE = +0                                          01460000
                  ADD 1 TO PENDFILE-REC-DROP                            01470000
               ELSE                                                     01480000
                  PERFORM 300-WRITE-PEND-RECORD                         01490000
               END-IF                                                   01500000
           END-IF.                                                      01510000
                                                                        01520000
           PERFORM 200-READ-PENDFILE-RTN.                               01530000
                                                                        01540000
       120-SELECT-VTRNFR-RTN.                                           01550000
           EXEC SQL                                                     01590000
              SELECT                                                    01600000
                  STTS_CD                                               01610000
               INTO :DCLVTRNFR.STTS-CD                                  01620000
               FROM VTRNFR                                              01630000
               WHERE CLIENT_NBR   = :DCLVTRNFR.CLIENT-NBR               01640000
                AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR     01650000
           END-EXEC.                                                    01660000
                                                                        01670000
           ADD 1 TO WS-TOTAL-TI-SELECT.                                 01680000
           IF SQLCODE NOT = +0 AND +100 AND -811                        01700000
              MOVE 1200 TO ABEND-CODE                                   01710000
              PERFORM 800-SQL-ERROR-ROUTINE                             01720000
           END-IF.                                                      01730000
                                                                        01740000
           IF SQLCODE NOT = +0                                          01750000
              MOVE '999' TO STTS-CD                                     01760000
           END-IF.                                                      01770000
                                                                        01780000
       150-SELECT-VINITAST-RTN.                                         01790000
           EXEC SQL                                                     01840000
              SELECT                                                    01850000
                  SECURITY_ADP_NBR                                      01860000
               INTO :DCLVINITAST.SECURITY-ADP-NBR                       01870000
               FROM VINITAST                                            01880000
               WHERE CLIENT_NBR   = :DCLVTRNFR.CLIENT-NBR               01890000
                AND  ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR     01900000
                AND  ASSET_SEQ_NBR    = :DCLVINITAST.ASSET-SEQ-NBR      01910000
                AND  TRANS_TYPE_CD    = 'D'                             01920000
           END-EXEC.                                                    01930000
                                                                        01940000
           ADD 1 TO WS-TOTAL-AT-SELECT.                                 01950000
                                                                        01960000
           IF SQLCODE NOT = +0 AND +100 AND -811                        01980000
              MOVE 2800 TO ABEND-CODE                                   01990000
              PERFORM 800-SQL-ERROR-ROUTINE                             02000000
           END-IF.                                                      02010000
                                                                        02020000
       200-READ-PENDFILE-RTN.                                           02030000
           READ PENDING-FILE                                            02040000
              AT END                                                    02050000
                 SET PENDFILE-EOF TO TRUE                               02060000
              NOT AT END                                                02070000
                 ADD 1 TO PENDFILE-REC-READ                             02080000
           END-READ.                                                    02090000
                                                                        02100000
       300-WRITE-PEND-RECORD.                                           02110000
              MOVE WS-PEND-REC-LEN-IN TO WS-PEND-REC-LEN-OUT            02120000
              MOVE PEND-REC-IN TO PEND-REC-OUT                          02130000
              WRITE PEND-REC-OUT                                        02140000
              ADD 1 TO PENDFILE-REC-WRITTEN.                            02150000
           EJECT                                                        02160000
      *******************                                               02170000
       800-SQL-ERROR-ROUTINE.                                           02180000
      *******************                                               02190000
                                                                        02200000
           DISPLAY 'SQLCODE IS ' SQLCODE.                               02210000
                                                                        02220000
           CALL DSNTIAR               USING  SQLCA                      02230000
                                             WS-DB2-MESSAGE-AREA        02240000
                                             WS-ERR-LINE-LEN            02250000
                                                                        02260000
           DISPLAY ' '                                                  02270000
                                                                        02280000
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   02290000
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      02300000
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              02310000
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        02320000
                 END-IF                                                 02330000
           END-PERFORM                                                  02340000
                                                                        02350000
           DISPLAY ' '                                                  02360000
           DISPLAY '*** PROGRAM IS ABENDING'                            02370000
           DISPLAY ' '                                                  02380000
                                                                        02390000
           EXEC SQL  ROLLBACK  END-EXEC                                 02400000
           CALL ABEND USING ABEND-CODE                                  02410000
                                                                        02420000
           .                                                            02430000
                                                                        02440000
           EJECT                                                        02450000
      *****************                                                 02460000
       900-INITIAL-ROUTINE.                                             02470000
      *****************                                                 02480000
                                                                        02490000
           OPEN INPUT   PENDING-FILE                                    02500000
           PERFORM 200-READ-PENDFILE-RTN.                               02510000
                                                                        02520000
           OPEN OUTPUT  PENDING-FILE-OUT                                02530000
                                                                        02540000
           MOVE SPACES TO B1-TABLE.                                     02550000
180500     PERFORM  VARYING B1-SUB  FROM 1 BY 1                         02560000
                 UNTIL B1-SUB GREATER 500                               02570000
180600                                                                  02580000
180900       MOVE  ' '                 TO  BH-BROKER-HEADER-INFO        02590000
182400       MOVE  B1-SUB              TO  BH-BROKER-NUMBER-N           02600000
182500       MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE       02610000
182600       MOVE  '434500'            TO  BH-B2-INFO-ID                02620000
182700       CALL   GETB1V           USING BH-BROKER-HEADER-INFO,       02630000
182800                                     BH-ACAT-INFO                 02640000
182900       END-CALL                                                   02650000
183000       IF  BH-ACAT-ACTIVE                                         02660000
00200 ** CARD-434689                                                    02670000
00210           MOVE BH-ACAT-MF-AUTO-DELETE                             02680000
183500                   TO  B1-AUTO-DELETE    (B1-SUB)                 02690000
                IF BH-ACAT-MF-AUTO-DELETE > '0'                         02700000
                   DISPLAY ' B1 CLIENT ' BH-BROKER-NUMBER-N             02710000
                           ' , HAS AUTO DELETE ON'                      02720000
                END-IF                                                  02730000
             END-IF                                                     02740000
           END-PERFORM.                                                 02750000
           EJECT                                                        02760000
      ****************                                                  02770000
       999-ENDJOB-ROUTINE.                                              02780000
      ****************                                                  02790000
                                                                        02800000
           CLOSE  PENDING-FILE                                          02810000
           CLOSE  PENDING-FILE-OUT.                                     02820000
                                                                        02830000
           DISPLAY ' '                                                  02840000
           DISPLAY 'PEND FILE RECS READ   : ' PENDFILE-REC-READ         02850000
           DISPLAY 'DB2 TI SELECTS ISSUED : ' WS-TOTAL-TI-SELECT        02860000
           DISPLAY 'DB2 AT SELECTS ISSUED : ' WS-TOTAL-AT-SELECT        02870000
           DISPLAY 'PEND FILE RECS DROP   : ' PENDFILE-REC-DROP         02880000
           DISPLAY 'PEND FILE WRITTEN     : ' PENDFILE-REC-WRITTEN.     02890000
           DISPLAY ' '                                                  02900000
           DISPLAY '*************************'                          02910000
           DISPLAY '* END OF CAT751 PROGRAM *'                          02920000
           DISPLAY '*************************'                          02930000
           DISPLAY ' '.                                                 02940000
