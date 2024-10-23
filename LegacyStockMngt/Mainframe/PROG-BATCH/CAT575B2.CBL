000001* PDX    - CAT575B2 C0351575 02/11/14 11:32:36 TBLAMUR            00001004
000001* LRM002 SSR 96014 RECOMPILE ONLY FOR NEW COPYBOOK BNW59W8 FATCA. 00001103
000001* PDX    - CAT575B2 C0344128 07/30/13 09:35:23 TBLAMUR            00001200
000001* LRM001 SSR 94296 RECOMPILE ONLY FOR NEW COPYBOOK BNW59W8.       00001300
000001* PDX    - CAT575B2 C0231736 04/10/06 09:29:54 TBDOJUN            00001400
000001* PDX    - CAT575B2 C0172183 03/22/02 16:17:21 TBLAMUR            00001500
000001* PDX    - CAT575B2 C0154772 02/22/01 15:28:39 TBLAMUR            00001600
000001* PDX    - CAT575B2 C0154792 02/22/01 15:16:21 TBLAMUR            00001700
000001* PDX    - CAT575B2 C0152145 02/22/01 08:52:46 TBLAMUR            00001800
       IDENTIFICATION DIVISION.                                         00001900
       PROGRAM-ID.    CAT575B2.                                         00002000
                                                                        00002100
       DATE-WRITTEN.  DEC 00.                                           00002200
      ******************************************************************00002300
      *                          REMARKS                               *00002400
      ******************************************************************00002500
      * THIS PROGRAM IS THE THIRD OF THE FOUR PROGRAMS THAT ARE        *00003000
      * INTENDED TO CREATE FUND/SERV RECORD IN VFNDRGST TABLE.  THIS   *00004000
      * PROGRAM READS REQUESTS FROM CAT575B AND CALLS THE MUTUAL FUNDS *00005000
      * MODULE TO REPLACE W8 FIELDS.                                   *00006000
      * TEMPORARY CHANGE TO CALL FROZEN VERSION OF CAT58W8 UNTIL       *00007000
      * BWN59W8 IS AVIALABLE IN PRODUCTION.                            *00008000
      ******************************************************************00009000
      ******************************************************************00010000
                                                                        00020000
           EJECT                                                        00030000
      ******************************************************************00040000
       ENVIRONMENT DIVISION.                                            00050000
      ******************************************************************00060000
                                                                        00070000
       INPUT-OUTPUT SECTION.                                            00080000
                                                                        00090000
       FILE-CONTROL.                                                    00100000
                                                                        00110000
                                                                        00120000
           SELECT FR-FILE-IN        ASSIGN  TO  IFRFILE.                00130000
           SELECT FR-FILE-OUT       ASSIGN  TO  OFRFILE.                00140000
                                                                        00150000
      ******************************************************************00160000
       DATA DIVISION.                                                   00170000
      ******************************************************************00180000
                                                                        00190000
       FILE SECTION.                                                    00200000
                                                                        00210000
       FD  FR-FILE-IN                                                   00220000
           RECORDING MODE IS F                                          00230000
           BLOCK CONTAINS 0 RECORDS                                     00240000
           LABEL RECORDS ARE STANDARD                                   00250000
           RECORD CONTAINS 750 CHARACTERS.                              00260000
                                                                        00270000
       01  FR-REC-IN                       PIC  X(750).                 00280000
                                                                        00290000
       FD  FR-FILE-OUT                                                  00300000
           RECORDING MODE IS F                                          00310000
           BLOCK CONTAINS 0 RECORDS                                     00320000
           LABEL RECORDS ARE STANDARD                                   00330000
           RECORD CONTAINS 750 CHARACTERS.                              00340000
                                                                        00350000
       01  FR-REC-OUT                      PIC  X(750).                 00360000
                                                                        00370000
           EJECT                                                        00380000
      ******************************************************************00390000
       WORKING-STORAGE SECTION.                                         00400000
      ******************************************************************00410000
                                                                        00420000
       77  ABEND-CODE            COMP    PIC S9(04)  VALUE +9999.       00430000
       77  WS-RECORDS-READ               PIC S9(7)   VALUE ZEROS.       00440000
       77  WS-RECORDS-WRITTEN            PIC S9(7)   VALUE ZEROS.       00450000
       01  WS-FR-EOF-SW                  PIC X(01)   VALUE 'N'.         00460000
           88  EOF-FR-FILE               VALUE 'Y'.                     00470000
       01  WS-BNW59W8                    PIC X(08)   VALUE 'BNW59W8'.   00480000
           COPY STUBCPY.                                                00490000
           EJECT                                                        00500000
           COPY CATFR.                                                  00510000
                                                                        00520000
           COPY BNW59W8.                                                00530000
                                                                        00540000
           EJECT                                                        00550000
      ******************************************************************00560000
       PROCEDURE DIVISION.                                              00570000
      ******************************************************************00580000
                                                                        00590000
           COPY MSGCOBO.                                                00600000
                                                                        00610000
           PERFORM INITIAL-ROUTINE.                                     00620000
                                                                        00630000
           PERFORM MAIN-PROCESS THRU MAIN-PROCESS-EXIT                  00640000
              UNTIL EOF-FR-FILE.                                        00650000
                                                                        00660000
           PERFORM EOJ-ROUTINE.                                         00670000
                                                                        00680000
           GOBACK.                                                      00690000
                                                                        00700000
           EJECT                                                        00710000
      **************                                                    00720000
       MAIN-PROCESS.                                                    00730000
      **************                                                    00740000
                                                                        00750000
           IF FR-DATE-LIT = 'DATE='                                     00760000
               MOVE 'CAT575B2'    TO  FR-PROGRAM-NAME                   00770000
               WRITE FR-REC-OUT FROM  FR-RECORD                         00771000
               ADD 1 TO WS-RECORDS-WRITTEN                              00780000
               GO TO READ-FR-RECORD.                                    00790000
                                                                        00800000
           SET BNW59W8-REQUEST-FUNC-READ TO TRUE.                       00810000
           MOVE  FR-CLIENT-NBR(2 : 3)  TO BNW59W8-REQUEST-CLIENT.       00820000
           MOVE  FR-RECORD(110 : 3)    TO BNW59W8-REQUEST-BRANCH.       00830000
           MOVE  FR-RECORD(114 : 5)    TO BNW59W8-REQUEST-ACCOUNT.      00840000
           MOVE  FR-NTWRK-CNTL-CD      TO BNW59W8-REQUEST-MATRIX-LEVEL. 00850000
           MOVE  FR-NA-IRA-IND         TO BNW59W8-REQUEST-TAX-IRA-IND.  00860000
           MOVE  FR-SS-TIN-NBR         TO BNW59W8-REQUEST-SSN.          00870000
           MOVE  FR-PROCESSING-CODE    TO BNW59W8-REQUEST-PROCESS-CODE. 00880000
                                                                        00890000
           DISPLAY 'CALL BNW59W8 FOR '                                  00900000
                       BNW59W8-REQUEST-CLIENT                           00910000
                 ' '   FR-ACAT-CONTROL-NBR                              00920000
                 '-'   BNW59W8-REQUEST-BRANCH                           00930000
                 '-'   BNW59W8-REQUEST-ACCOUNT                          00940000
                 ' LVL ' BNW59W8-REQUEST-MATRIX-LEVEL                   00950000
                 ' IRA ' BNW59W8-REQUEST-TAX-IRA-IND                    00960000
                 ' SSN ' BNW59W8-REQUEST-SSN                            00970000
                 ' PROCESS-CD '  BNW59W8-REQUEST-PROCESS-CODE.          00980000
                                                                        00990000
           MOVE SPACES TO BNW59W8-REQUEST-CERT-DATE.                    00991000
           CALL WS-BNW59W8 USING BNW59W8-INFORMATION.                   01000000
                                                                        01010000
           IF NOT BNW59W8-VALID-RETURN                                  01020000
              DISPLAY 'BNW59W8 RETURN NG ' BNW59W8-RETURN-CODE          01030000
              WRITE FR-REC-OUT FROM  FR-RECORD                          01040000
              ADD 1 TO WS-RECORDS-WRITTEN                               01050000
              GO TO READ-FR-RECORD                                      01060000
           END-IF.                                                      01070000
                                                                        01080000
           DISPLAY 'BNW59W8 RETURN OK ' BNW59W8-RETURN-CODE             01090000
           DISPLAY 'WTHL ' BNW59W8-WITHHOLD-IND                         01100000
                ' CERT-DT ' BNW59W8-CERTIFICATION-DATE                  01110000
                ' EXP-DT ' BNW59W8-EXPIRATION-DATE                      01120000
                ' QUAL-IN ' BNW59W8-QUAL-INTER-IND                      01130000
                ' RATE ' BNW59W8-OVR-NRA-SPECIAL-RATE-A                 01140000
                ' OVRD-CNTRY ' BNW59W8-OVR-COUNTRY-CODE                 01150000
                ' CNTRY-CD ' BNW59W8-COUNTRY-CODE.                      01160000
           IF BNW59W8-WITHHOLD-IND < 'A' OR > 'F'                       01170000
              DISPLAY 'NON A-F WTHOLD - SKIP W8 FIELDS'                 01180000
              WRITE FR-REC-OUT FROM  FR-RECORD                          01190000
              ADD 1 TO WS-RECORDS-WRITTEN                               01200000
              GO TO READ-FR-RECORD                                      01210000
           END-IF.                                                      01220000
                                                                        01230000
           DISPLAY 'FOREIGN WTHOLD IND RETURNED ' BNW59W8-WITHHOLD-IND. 01240000
           MOVE BNW59W8-WITHHOLD-IND       TO FR-W8-WTHLD-CD            01250000
                                              FR-WTHLD-CD.              01260000
           IF   BNW59W8-WITHHOLD-IND = 'C'                              01270000
             IF (BNW59W8-QUAL-INTER-IND > '0' AND < '9')                01280000
                MOVE BNW59W8-QUAL-INTER-IND TO FR-W8-QULFD-INTRM-IND    01290000
             ELSE                                                       01300000
                DISPLAY 'PROB - QUAL INTERMEDIARY MISSING FOR WTH C'    01310000
             END-IF                                                     01320000
           END-IF.                                                      01330000
                                                                        01340000
           IF (BNW59W8-WITHHOLD-IND = 'B' OR 'C' OR 'D' OR 'E')         01350000
              IF BNW59W8-CERTIFICATION-DATE NUMERIC                     01360000
              AND BNW59W8-CERTIFICATION-DATE (1 : 4) > '0000'           01370000
              AND BNW59W8-CERTIFICATION-DATE (1 : 4) < '3000'           01380000
              AND BNW59W8-CERTIFICATION-DATE (5 : 2) > '00'             01390000
              AND BNW59W8-CERTIFICATION-DATE (5 : 2) < '13'             01400000
              AND BNW59W8-CERTIFICATION-DATE (7 : 2) > '00'             01410000
              AND BNW59W8-CERTIFICATION-DATE (7 : 2) < '32'             01420000
                 MOVE BNW59W8-CERTIFICATION-DATE (1 : 4) TO             01430000
                                   FR-W8-CERT-DT (1 : 4)                01440000
                 MOVE BNW59W8-CERTIFICATION-DATE (5 : 2) TO             01450000
                                   FR-W8-CERT-DT (6 : 2)                01460000
                 MOVE BNW59W8-CERTIFICATION-DATE (7 : 2) TO             01470000
                                   FR-W8-CERT-DT (9 : 2)                01480000
              ELSE                                                      01490000
                 DISPLAY 'PROB - CERT DATE REQD BUT NOT ACCEPTABLE '    01500000
                      BNW59W8-CERTIFICATION-DATE                        01510000
              END-IF                                                    01520000
           END-IF.                                                      01530000
                                                                        01540000
           IF ((BNW59W8-WITHHOLD-IND = 'C' OR 'D' OR 'E')               01550000
           OR (BNW59W8-WITHHOLD-IND = 'B'                               01560000
                      AND  FR-SS-TIN-NBR NOT > SPACES))                 01570000
              IF BNW59W8-EXPIRATION-DATE NUMERIC                        01580000
              AND BNW59W8-EXPIRATION-DATE (1 : 4) > '0000'              01590000
              AND BNW59W8-EXPIRATION-DATE (1 : 4) < '3000'              01600000
              AND BNW59W8-EXPIRATION-DATE (5 : 2) > '00'                01610000
              AND BNW59W8-EXPIRATION-DATE (5 : 2) < '13'                01620000
              AND BNW59W8-EXPIRATION-DATE (7 : 2) > '00'                01630000
              AND BNW59W8-EXPIRATION-DATE (7 : 2) < '32'                01640000
                 MOVE BNW59W8-EXPIRATION-DATE (1 : 4) TO                01650000
                                   FR-W8-EXPTN-DT (1 : 4)               01660000
                 MOVE BNW59W8-EXPIRATION-DATE (5 : 2) TO                01670000
                                   FR-W8-EXPTN-DT (6 : 2)               01680000
                 MOVE BNW59W8-EXPIRATION-DATE (7 : 2) TO                01690000
                                   FR-W8-EXPTN-DT (9 : 2)               01700000
              ELSE                                                      01710000
                 DISPLAY 'PROB - EXP DATE REQD BUT NOT ACCEPTABLE '     01720000
                      BNW59W8-EXPIRATION-DATE                           01730000
              END-IF                                                    01740000
           END-IF.                                                      01750000
                                                                        01760000
           IF BNW59W8-OVR-NRA-SPECIAL-RATE NUMERIC                      01770000
              MOVE BNW59W8-OVR-NRA-SPECIAL-RATE                         01780000
                                           TO FR-W8-OVRD-NRA-SPC-RT     01790000
           END-IF.                                                      01800000
                                                                        01810000
           IF BNW59W8-OVR-COUNTRY-CODE = 'OC'                           01820000
              DISPLAY 'PROB - OVRD COUNTRY-CODE OC BYPASSED'            01830000
           ELSE                                                         01840000
              MOVE BNW59W8-OVR-COUNTRY-CODE   TO FR-W8-OVRD-CNTRY-CD    01850000
              MOVE BNW59W8-OVR-COUNTRY-CODE (2 : 1) TO                  01860000
                                        FR-W8-OVRD-CNTRY-CD-BYTE2       01870000
           END-IF.                                                      01880000
                                                                        01890000
           IF BNW59W8-COUNTRY-CODE >= SPACES                            01900000
           AND BNW59W8-COUNTRY-CODE NOT = 'OC'                          01910000
              MOVE BNW59W8-COUNTRY-CODE    TO FR-CNTRY-ORGN-CD          01920000
           ELSE                                                         01930000
              DISPLAY 'PROB - COUNTRY ORGIN MISSING WHEN REQD'          01940000
           END-IF.                                                      01950000
                                                                        01960000
           DISPLAY 'CHANGED '                                           01970000
             ' WTHLD '   FR-W8-WTHLD-CD                                 01980000
             ' CERT-DT ' FR-W8-CERT-DT                                  01990000
             ' EXP-DT '  FR-W8-EXPTN-DT                                 02000000
             ' SPC-RT '  FR-W8-OVRD-NRA-SPC-RT                          02010000
             ' QUAL-IN ' FR-W8-QULFD-INTRM-IND                          02020000
             ' OVRD-CNTRY ' FR-W8-OVRD-CNTRY-CD                         02030000
             ' CNTRY-ORGN ' FR-CNTRY-ORGN-CD.                           02040000
                                                                        02050000
           ADD 1 TO WS-RECORDS-WRITTEN                                  02060000
           WRITE FR-REC-OUT FROM  FR-RECORD.                            02070000
                                                                        02080000
       READ-FR-RECORD.                                                  02090000
                                                                        02100000
           READ FR-FILE-IN                INTO  FR-RECORD               02110000
              AT END SET EOF-FR-FILE       TO  TRUE                     02120000
              NOT AT END                                                02130000
                 ADD 1 TO WS-RECORDS-READ                               02140000
           END-READ.                                                    02150000
                                                                        02160000
       MAIN-PROCESS-EXIT. EXIT.                                         02170000
                                                                        02180000
           EJECT                                                        02190000
      *****************                                                 02200000
       INITIAL-ROUTINE.                                                 02210000
      *****************                                                 02220000
                                                                        02230000
           OPEN INPUT  FR-FILE-IN.                                      02240000
           OPEN OUTPUT FR-FILE-OUT.                                     02250000
                                                                        02260000
           READ FR-FILE-IN                INTO  FR-RECORD               02270000
              AT END SET EOF-FR-FILE       TO  TRUE                     02280000
           END-READ.                                                    02290000
                                                                        02300000
           INITIALIZE BNW59W8-INFO.                                     02310000
           SET BNW59W8-REQUEST-FUNC-OPEN TO TRUE.                       02320000
           CALL WS-BNW59W8         USING BNW59W8-INFO.                  02330000
           IF BNW59W8-VALID-RETURN                                      02340000
              CONTINUE                                                  02350000
           ELSE                                                         02360000
              DISPLAY '!!! BNW59W8: ATTEMPT TO OPEN DID NOT SUCCEED,'   02370000
              DISPLAY '!!! BNW59W8-RETURN-CODE          = '             02380000
                           BNW59W8-RETURN-CODE ' !!!'                   02390000
              DISPLAY '!!! BNW59W8-GETNA-VSAM-STATUS    = '             02400000
                           BNW59W8-GETNA-VSAM-STATUS ' !!!'             02410000
              DISPLAY '!!! BNW59W8-NAYE-VSAM-STATUS     = '             02420000
                           BNW59W8-NAYE-VSAM-STATUS ' !!!'              02430000
              DISPLAY '!!! BNW59W8-ADT1CUS-VSAM-STATUS  = '             02440000
                           BNW59W8-ADT1CUS-VSAM-STATUS ' !!!'           02450000
              DISPLAY '!!! PROGRAM IS ABENDING !!!'                     02460000
              MOVE +1000                TO ABEND-CODE                   02470000
              PERFORM ABEND-ROUTINE                                     02480000
           END-IF.                                                      02490000
                                                                        02500000
       ABEND-ROUTINE.                                                   02510000
      ***************                                                   02520000
                                                                        02530000
           DISPLAY ' '.                                                 02540000
           DISPLAY 'PROGRAM CAT575B2 IS ABENDING!'                      02550000
           CALL ABEND                    USING  ABEND-CODE.             02560000
                                                                        02570000
           EJECT                                                        02580000
      *************                                                     02590000
       EOJ-ROUTINE.                                                     02600000
      *************                                                     02610000
                                                                        02620000
           CLOSE FR-FILE-IN                                             02630000
                 FR-FILE-OUT.                                           02640000
                                                                        02650000
           DISPLAY 'RECORDS READ    ' WS-RECORDS-READ.                  02660000
           DISPLAY 'RECORDS WRITTEN ' WS-RECORDS-WRITTEN.               02670000
                                                                        02680000
