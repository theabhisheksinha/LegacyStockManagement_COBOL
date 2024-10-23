000001* PDX    - CATUPLDI C0213444 01/24/05 13:26:23 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                         CATUPLDI
       PROGRAM-ID.  CATUPLDI.                                           CATUPLDI
       AUTHOR.      E TAKAESU.                                          CATUPLDI
       DATE-WRITTEN.  NOV 2004.                                         CATUPLDI
      **REMARKS.                                                        CATUPLDI
      ***************************************************************** CATUPLDI
      *                                                                 CATUPLDI
      *PROGRAM DESCRIPTION:                                             CATUPLDI
      *     UPLOADS (INSERTS ROWS) INTO ACATS DB2 TABLES. THE EXTRACT   CATUPLDI
      *     FILE CREATED BY PROGRAM CATEXTR IS INPUT. THIS PROGRAM      CATUPLDI
      *     MAY BE USED TO COPY THE PRODUCTION OR QA ACATS DATABASE     CATUPLDI
      *     TABLES INTO THE TEST DB2 FOR TESTING/RESOVOLING ISSUES.     CATUPLDI
      *     THIS PROGRAM SHOULD NEVER BE RUN IN PRODUCTION.             CATUPLDI
      *     UPLOADS FOLLOWING TABLES ONLY.                              CATUPLDI
      *       (1) ACTITRF  - ACAT INITIAL TRANSFER TABLE                CATUPLDI
      *       (2) ACTIAST  - ACAT INITIAL ASSET TABLE                   CATUPLDI
      *       (3) ACTIMF   - ACAT INITIAL MUTUAL FUND TABLE             CATUPLDI
      *       (4) ACTOPN   - ACAT INITIAL OPTION TABLE                  CATUPLDI
      *                                                                 CATUPLDI
      ***************************************************************** CATUPLDI
           EJECT                                                        CATUPLDI
       ENVIRONMENT DIVISION.                                            CATUPLDI
       CONFIGURATION SECTION.                                           CATUPLDI
       SOURCE-COMPUTER.  IBM-370.                                       CATUPLDI
       OBJECT-COMPUTER.  IBM-370.                                       CATUPLDI
       INPUT-OUTPUT SECTION.                                            CATUPLDI
       FILE-CONTROL.                                                    CATUPLDI
                                                                        CATUPLDI
           SELECT EXTRACT-FILE                  ASSIGN  TO  EXTR.       CATUPLDI
                                                                        CATUPLDI
       DATA DIVISION.                                                   CATUPLDI
       FILE SECTION.                                                    CATUPLDI
                                                                        CATUPLDI
       FD  EXTRACT-FILE                                                 CATUPLDI
           RECORDING MODE IS V                                          CATUPLDI
           BLOCK CONTAINS 0 RECORDS.                                    CATUPLDI
       01  EXTRACT-RECORD.                                              CATUPLDI
           05  RECORD-SEG-ID        PIC X(08).                          CATUPLDI
           05  RECORD-DETAIL        PIC X(742).                         CATUPLDI
                                                                        CATUPLDI
           EJECT                                                        CATUPLDI
                                                                        CATUPLDI
       WORKING-STORAGE SECTION.                                         CATUPLDI
       01  WS-NAME                          PIC X(40)                   CATUPLDI
           VALUE 'CATUPLDI WORKING STORAGE STARTS HERE'.                CATUPLDI
                                                                        CATUPLDI
       01  WS-EOF-IND                 PIC X(01) VALUE SPACES.           CATUPLDI
           88 EOF                               VALUE 'Y'.              CATUPLDI
       01  ABEND                      PIC X(08) VALUE 'ILBOABN0'.       CATUPLDI
       01  WORKAREA.                                                    CATUPLDI
           05  WS-ACAT-CONTROL-NBR    PIC X(14).                        CATUPLDI
           05  WS-TRNFR-TYPE-CD       PIC X(03).                        CATUPLDI
           05  WS-ASSET-SEQ-NBR       PIC S9(4) USAGE COMP.             CATUPLDI
                                                                        CATUPLDI
           05  WS-ACTITRF-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.     CATUPLDI
           05  WS-ACTIAST-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.     CATUPLDI
           05  WS-ACTIMF-COUNT        PIC S9(9) COMP-3 VALUE ZEROS.     CATUPLDI
           05  WS-ACTIOPN-COUNT       PIC S9(9) COMP-3 VALUE ZEROS.     CATUPLDI
           05  WS-FK-NOT-FOUND-CNT    PIC S9(9) COMP-3 VALUE ZEROS.     CATUPLDI
                                                                        CATUPLDI
           05  W-DB2-SQLCODE          PIC  ---9.                        CATUPLDI
           05  W-COMMIT-CTR           PIC S9(005) COMP-3                CATUPLDI
                                                  VALUE 0.              CATUPLDI
           05  WS-COMMITS-PERFORMED   PIC S9(005) COMP-3                CATUPLDI
                                                  VALUE 0.              CATUPLDI
                                                                        CATUPLDI
           05  WS-ACTITRF-COUNT-REPL  PIC S9(9) COMP-3 VALUE ZEROS.     CATUPLDI
           05  WS-ACTIAST-COUNT-REPL  PIC S9(9) COMP-3 VALUE ZEROS.     CATUPLDI
           05  WS-ACTIMF-COUNT-REPL   PIC S9(9) COMP-3 VALUE ZEROS.     CATUPLDI
           05  WS-ACTIOPN-COUNT-REPL  PIC S9(9) COMP-3 VALUE ZEROS.     CATUPLDI
                                                                        CATUPLDI
           EJECT                                                        CATUPLDI
      *--------------------------------------------------------------   CATUPLDI
      *DCLGEN FOR ACAT INIT TRANSFER TABLE                              CATUPLDI
      *--------------------------------------------------------------   CATUPLDI
           EXEC SQL                                                     CATUPLDI
               INCLUDE VINITRNF                                         CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           EXEC SQL                                                     CATUPLDI
               INCLUDE ACTITRF                                          CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
      *--------------------------------------------------------------   CATUPLDI
      *DCLGEN FOR ACAT INIT ASSET TABLE                                 CATUPLDI
      *--------------------------------------------------------------   CATUPLDI
           EXEC SQL                                                     CATUPLDI
               INCLUDE VINITAST                                         CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           EXEC SQL                                                     CATUPLDI
               INCLUDE ACTIAST                                          CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
      *--------------------------------------------------------------   CATUPLDI
      *DCLGEN FOR ACAT INIT MF TABLE                                    CATUPLDI
      *--------------------------------------------------------------   CATUPLDI
           EXEC SQL                                                     CATUPLDI
               INCLUDE VINITMF                                          CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           EXEC SQL                                                     CATUPLDI
               INCLUDE ACTIMF                                           CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
      *--------------------------------------------------------------   CATUPLDI
      *DCLGEN FOR ACAT INIT OPTION TABLE                                CATUPLDI
      *--------------------------------------------------------------   CATUPLDI
           EXEC SQL                                                     CATUPLDI
               INCLUDE VINITOPN                                         CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           EXEC SQL                                                     CATUPLDI
               INCLUDE ACTIOPN                                          CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
      *--------------------------------------------------------------   CATUPLDI
      * INCLUDE FOR DB2 COMMUNICATIONS AREA.                            CATUPLDI
      *--------------------------------------------------------------   CATUPLDI
           EXEC SQL                                                     CATUPLDI
               INCLUDE SQLCA                                            CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           EJECT                                                        CATUPLDI
                                                                        CATUPLDI
       01  WORK-AREA.                                                   CATUPLDI
           05  PROGRAM-NAME              PIC X(08) VALUE 'CATUPLDI'.    CATUPLDI
           05  WS-INDEX                  PIC 9(04) COMP.                CATUPLDI
           EJECT                                                        CATUPLDI
                                                                        CATUPLDI
                                                                        CATUPLDI
       01  WS-MISC.                                                     CATUPLDI
           05  SUB1                      PIC 9(2)  VALUE ZERO.          CATUPLDI
           05  ABORT-CODE     COMP SYNC  PIC S9(4) VALUE ZERO.          CATUPLDI
           05  WS-TIMESTAMP              PIC X(26).                     CATUPLDI
                                                                        CATUPLDI
       01  DSNTIAR                       PIC X(08) VALUE 'DSNTIAR'.     CATUPLDI
       01  WS-DB2-MESSAGE-AREA.                                         CATUPLDI
            05  WS-DB2-MSG-LEN           PIC S9(04) COMP VALUE +960.    CATUPLDI
            05  WS-ERROR-MSG             PIC X(80) OCCURS 12 TIMES      CATUPLDI
                    INDEXED BY WS-ERROR-INDEX.                          CATUPLDI
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.     CATUPLDI
                                                                        CATUPLDI
           EJECT                                                        CATUPLDI
       PROCEDURE DIVISION.                                              CATUPLDI
                                                                        CATUPLDI
           COPY MSGCOBO.                                                CATUPLDI
                                                                        CATUPLDI
           OPEN INPUT EXTRACT-FILE.                                     CATUPLDI
           PERFORM 1000-PROCESS-INPUT                                   CATUPLDI
              THRU 1000-EXIT                                            CATUPLDI
                 UNTIL EOF.                                             CATUPLDI
                                                                        CATUPLDI
           CLOSE EXTRACT-FILE.                                          CATUPLDI
                                                                        CATUPLDI
           IF WS-FK-NOT-FOUND-CNT > +0                                  CATUPLDI
              DISPLAY 'FOREIGN KEY NOT FOUND = '  WS-FK-NOT-FOUND-CNT   CATUPLDI
                      ' (** SEE SYSOUT FOR DETAILS **)'                 CATUPLDI
           ELSE                                                         CATUPLDI
              DISPLAY 'FOREIGN KEY NOT FOUND = '  WS-FK-NOT-FOUND-CNT   CATUPLDI
           END-IF.                                                      CATUPLDI
           DISPLAY ' '.                                                 CATUPLDI
           DISPLAY 'RECORDS INSERTED:'.                                 CATUPLDI
           DISPLAY 'ACTITRF = ' WS-ACTITRF-COUNT                        CATUPLDI
           DISPLAY 'ACTIAST = ' WS-ACTIAST-COUNT                        CATUPLDI
           DISPLAY 'ACTIMF  = ' WS-ACTIMF-COUNT                         CATUPLDI
           DISPLAY 'ACTIOPN = ' WS-ACTIOPN-COUNT                        CATUPLDI
           DISPLAY ' '.                                                 CATUPLDI
           DISPLAY 'RECORDS UPDATED:'.                                  CATUPLDI
           DISPLAY 'ACTITRF = ' WS-ACTITRF-COUNT-REPL                   CATUPLDI
           DISPLAY 'ACTIAST = ' WS-ACTIAST-COUNT-REPL                   CATUPLDI
           DISPLAY 'ACTIMF  = ' WS-ACTIMF-COUNT-REPL                    CATUPLDI
           DISPLAY 'ACTIOPN = ' WS-ACTIOPN-COUNT-REPL                   CATUPLDI
           DISPLAY ' '.                                                 CATUPLDI
           DISPLAY 'COMMITS  = ' WS-COMMITS-PERFORMED.                  CATUPLDI
                                                                        CATUPLDI
           GOBACK.                                                      CATUPLDI
                                                                        CATUPLDI
           EJECT                                                        CATUPLDI
       1000-PROCESS-INPUT.                                              CATUPLDI
           READ EXTRACT-FILE                                            CATUPLDI
              AT END                                                    CATUPLDI
                 SET EOF TO TRUE                                        CATUPLDI
                 GO TO 1000-EXIT.                                       CATUPLDI
                                                                        CATUPLDI
           IF W-COMMIT-CTR > +99                                        CATUPLDI
              PERFORM 8100-SQL-COMMIT                                   CATUPLDI
           END-IF.                                                      CATUPLDI
                                                                        CATUPLDI
           IF RECORD-SEG-ID = 'VINITRNF'                                CATUPLDI
              PERFORM 1100-CREATE-INITIAL-TRNF-RTN                      CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VINITAST'                                CATUPLDI
              PERFORM 1200-CREATE-INITIAL-ASSET-RTN                     CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VINITMF '                                CATUPLDI
              PERFORM 1300-CREATE-INITIAL-MF-RTN                        CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VINITOPN'                                CATUPLDI
              PERFORM 1400-CREATE-INITIAL-OPN-RTN                       CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VTRNFR  '                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VASSET  '                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VMF     '                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VOPTN   '                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VFNDRGST'                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VFNDSRVS'                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VFNDPYBL'                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VFNDPYNA'                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VFNDNA  '                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VTRNHSTY'                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VASTHSTY'                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VMFHSTY'                                 CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VOPTHSTY'                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VRSTBRKR'                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VRSTSEC '                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VRSDSEC '                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VRSDACC'                                 CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VPRTCPPF'                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VALERT'                                  CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VRSDBLK'                                 CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'VACTRBHY'                                CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           ELSE                                                         CATUPLDI
           IF RECORD-SEG-ID = 'DATE  '                                  CATUPLDI
              DISPLAY 'USING EXTRACT FILE ' RECORD-DETAIL(1 : 26)       CATUPLDI
           ELSE                                                         CATUPLDI
              DISPLAY 'UNKNOWN RECORD ' RECORD-SEG-ID ' BYPASSED'       CATUPLDI
              GO TO 1000-EXIT                                           CATUPLDI
           END-IF.                                                      CATUPLDI
                                                                        CATUPLDI
           ADD +1 TO W-COMMIT-CTR.                                      CATUPLDI
                                                                        CATUPLDI
       1000-EXIT. EXIT.                                                 CATUPLDI
                                                                        CATUPLDI
            EJECT                                                       CATUPLDI
       1100-CREATE-INITIAL-TRNF-RTN.                                    CATUPLDI
                                                                        CATUPLDI
           MOVE RECORD-DETAIL TO DCLVINITRNF.                           CATUPLDI
                                                                        CATUPLDI
           MOVE CLIENT-NBR          OF DCLVINITRNF                      CATUPLDI
             TO CLIENT-NBR          OF DCLACTITRF.                      CATUPLDI
           MOVE RCV-NBR             OF DCLVINITRNF                      CATUPLDI
             TO RCV-NBR             OF DCLACTITRF.                      CATUPLDI
           MOVE DLVR-NBR            OF DCLVINITRNF                      CATUPLDI
             TO DLVR-NBR            OF DCLACTITRF.                      CATUPLDI
           MOVE ACCT-DLVR-NBR       OF DCLVINITRNF                      CATUPLDI
             TO ACCT-DLVR-NBR       OF DCLACTITRF.                      CATUPLDI
           MOVE ACCT-RCV-NBR        OF DCLVINITRNF                      CATUPLDI
             TO ACCT-RCV-NBR        OF DCLACTITRF.                      CATUPLDI
           MOVE TRNFR-TYPE-CD       OF DCLVINITRNF                      CATUPLDI
             TO TRNFR-TYPE-CD       OF DCLACTITRF.                      CATUPLDI
           MOVE ACAT-CONTROL-NBR    OF DCLVINITRNF                      CATUPLDI
             TO ACAT-CONTROL-NBR    OF DCLACTITRF.                      CATUPLDI
           MOVE TRANS-TYPE-CD       OF DCLVINITRNF                      CATUPLDI
             TO TRANS-TYPE-CD       OF DCLACTITRF.                      CATUPLDI
           MOVE PHSCL-SEQ-NBR       OF DCLVINITRNF                      CATUPLDI
             TO PHSCL-SEQ-NBR       OF DCLACTITRF.                      CATUPLDI
           MOVE SBMTG-PRTCP-NBR     OF DCLVINITRNF                      CATUPLDI
             TO SBMTG-PRTCP-NBR     OF DCLACTITRF.                      CATUPLDI
           MOVE PHSCL-SEQ-STTS-CD   OF DCLVINITRNF                      CATUPLDI
             TO PHSCL-SEQ-STTS-CD   OF DCLACTITRF.                      CATUPLDI
           MOVE LGCL-SEQ-NBR        OF DCLVINITRNF                      CATUPLDI
             TO LGCL-SEQ-NBR        OF DCLACTITRF.                      CATUPLDI
           MOVE LGCL-SEQ-NR-STS-CD  OF DCLVINITRNF                      CATUPLDI
             TO LGCL-SEQ-NR-STS-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE RCV-CUST-NM         OF DCLVINITRNF                      CATUPLDI
             TO RCV-CUST-NM         OF DCLACTITRF.                      CATUPLDI
           MOVE TRANS-TYPE-STTS-CD  OF DCLVINITRNF                      CATUPLDI
             TO TRANS-TYPE-STTS-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE CONTROL-NBR-STS-CD  OF DCLVINITRNF                      CATUPLDI
             TO CONTROL-NBR-STS-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE RCV-SS-PRIM-NBR     OF DCLVINITRNF                      CATUPLDI
             TO RCV-SS-PRIM-NBR     OF DCLACTITRF.                      CATUPLDI
           MOVE TRNFR-TYPE-STTS-CD  OF DCLVINITRNF                      CATUPLDI
             TO TRNFR-TYPE-STTS-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE RCV-SS-SCNDY-NBR    OF DCLVINITRNF                      CATUPLDI
             TO RCV-SS-SCNDY-NBR    OF DCLACTITRF.                      CATUPLDI
           MOVE SBMT-PRT-NR-STS-CD  OF DCLVINITRNF                      CATUPLDI
             TO SBMT-PRT-NR-STS-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE RCV-ACCT-TYPE-CD    OF DCLVINITRNF                      CATUPLDI
             TO RCV-ACCT-TYPE-CD    OF DCLACTITRF.                      CATUPLDI
           MOVE RCV-NBR-STTS-CD     OF DCLVINITRNF                      CATUPLDI
             TO RCV-NBR-STTS-CD     OF DCLACTITRF.                      CATUPLDI
           MOVE NSCC-PEND-CD        OF DCLVINITRNF                      CATUPLDI
             TO NSCC-PEND-CD        OF DCLACTITRF.                      CATUPLDI
           MOVE RCV-OCC-BRKR-NBR    OF DCLVINITRNF                      CATUPLDI
             TO RCV-OCC-BRKR-NBR    OF DCLACTITRF.                      CATUPLDI
           MOVE DLVR-NBR-STTS-CD    OF DCLVINITRNF                      CATUPLDI
             TO DLVR-NBR-STTS-CD    OF DCLACTITRF.                      CATUPLDI
           MOVE RCV-CRSPN-NBR       OF DCLVINITRNF                      CATUPLDI
             TO RCV-CRSPN-NBR       OF DCLACTITRF.                      CATUPLDI
           MOVE ACCT-RCV-STTS-CD    OF DCLVINITRNF                      CATUPLDI
             TO ACCT-RCV-STTS-CD    OF DCLACTITRF.                      CATUPLDI
           MOVE ACAT-CNTL-ASTD-NBR  OF DCLVINITRNF                      CATUPLDI
             TO ACAT-CNTL-ASTD-NBR  OF DCLACTITRF.                      CATUPLDI
           MOVE ACCT-DLVR-STTS-CD   OF DCLVINITRNF                      CATUPLDI
             TO ACCT-DLVR-STTS-CD   OF DCLACTITRF.                      CATUPLDI
           MOVE CMNT-TXT            OF DCLVINITRNF                      CATUPLDI
             TO CMNT-TXT            OF DCLACTITRF.                      CATUPLDI
           MOVE RCV-CUST-NM-STS-CD  OF DCLVINITRNF                      CATUPLDI
             TO RCV-CUST-NM-STS-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE PRCS-DT             OF DCLVINITRNF                      CATUPLDI
             TO PRCS-DT             OF DCLACTITRF.                      CATUPLDI
           MOVE RCV-OCC-STTS-CD     OF DCLVINITRNF                      CATUPLDI
             TO RCV-OCC-STTS-CD     OF DCLACTITRF.                      CATUPLDI
           MOVE RCV-SS-PRIM-STS-CD  OF DCLVINITRNF                      CATUPLDI
             TO RCV-SS-PRIM-STS-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE STTS-CD             OF DCLVINITRNF                      CATUPLDI
             TO STTS-CD             OF DCLACTITRF.                      CATUPLDI
           MOVE RCV-CRSPN-STTS-CD   OF DCLVINITRNF                      CATUPLDI
             TO RCV-CRSPN-STTS-CD   OF DCLACTITRF.                      CATUPLDI
           MOVE DSTBN-SIDE-CD       OF DCLVINITRNF                      CATUPLDI
             TO DSTBN-SIDE-CD       OF DCLACTITRF.                      CATUPLDI
           MOVE TRNFR-TYPE-RJCT-CD  OF DCLVINITRNF                      CATUPLDI
             TO TRNFR-TYPE-RJCT-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE SYS-ACT-CD          OF DCLVINITRNF                      CATUPLDI
             TO SYS-ACT-CD          OF DCLACTITRF.                      CATUPLDI
           MOVE RCV-SS-SCDY-STS-CD  OF DCLVINITRNF                      CATUPLDI
             TO RCV-SS-SCDY-STS-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE SYS-RJCT-RSN-CD     OF DCLVINITRNF                      CATUPLDI
             TO SYS-RJCT-RSN-CD     OF DCLACTITRF.                      CATUPLDI
           MOVE RCV-ACT-TYP-STS-CD  OF DCLVINITRNF                      CATUPLDI
             TO RCV-ACT-TYP-STS-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE TRNFR-TYPE-RJC2-CD  OF DCLVINITRNF                      CATUPLDI
             TO TRNFR-TYPE-RJC2-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE CNTL-ASTD-STTS-CD   OF DCLVINITRNF                      CATUPLDI
             TO CNTL-ASTD-STTS-CD   OF DCLACTITRF.                      CATUPLDI
           MOVE TRN-TYP-RJC-STS-CD  OF DCLVINITRNF                      CATUPLDI
             TO TRN-TYP-RJC-STS-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE TRNFR-TYPE-RJC1-CD  OF DCLVINITRNF                      CATUPLDI
             TO TRNFR-TYPE-RJC1-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE STTLM-ASCTD-STS-CD  OF DCLVINITRNF                      CATUPLDI
             TO STTLM-ASCTD-STS-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE NSCC-ACK-IND        OF DCLVINITRNF                      CATUPLDI
             TO NSCC-ACK-IND        OF DCLACTITRF.                      CATUPLDI
           MOVE PRTCP-CONTRA-CD     OF DCLVINITRNF                      CATUPLDI
             TO PRTCP-CONTRA-CD     OF DCLACTITRF.                      CATUPLDI
           MOVE TRANS-RFRN-STTS-CD  OF DCLVINITRNF                      CATUPLDI
             TO TRANS-RFRN-STTS-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE CMNT-STTS-CD        OF DCLVINITRNF                      CATUPLDI
             TO CMNT-STTS-CD        OF DCLACTITRF.                      CATUPLDI
           MOVE CICS-TERM-ID-CD     OF DCLVINITRNF                      CATUPLDI
             TO CICS-TERM-ID-CD     OF DCLACTITRF.                      CATUPLDI
           MOVE CYCLE-CD            OF DCLVINITRNF                      CATUPLDI
             TO CYCLE-CD            OF DCLACTITRF.                      CATUPLDI
           MOVE PRGM-NM             OF DCLVINITRNF                      CATUPLDI
             TO PRGM-NM             OF DCLACTITRF.                      CATUPLDI
           MOVE DAYS-STTS-QTY       OF DCLVINITRNF                      CATUPLDI
             TO DAYS-STTS-QTY       OF DCLACTITRF.                      CATUPLDI
           MOVE RCRD-LNGTH-STTS-CD  OF DCLVINITRNF                      CATUPLDI
             TO RCRD-LNGTH-STTS-CD  OF DCLACTITRF.                      CATUPLDI
           MOVE CRT-TMSTP           OF DCLVINITRNF                      CATUPLDI
             TO CRT-TMSTP           OF DCLACTITRF.                      CATUPLDI
           MOVE RCRD-STTS-CD        OF DCLVINITRNF                      CATUPLDI
             TO RCRD-STTS-CD        OF DCLACTITRF.                      CATUPLDI
           MOVE UPDT-TMSTP          OF DCLVINITRNF                      CATUPLDI
             TO UPDT-TMSTP          OF DCLACTITRF.                      CATUPLDI
           MOVE DB-CR-CD            OF DCLVINITRNF                      CATUPLDI
             TO DB-CR-CD            OF DCLACTITRF.                      CATUPLDI
           MOVE STTLM-ASCTD-DT      OF DCLVINITRNF                      CATUPLDI
             TO STTLM-ASCTD-DT      OF DCLACTITRF.                      CATUPLDI
           MOVE TRANS-RFRN-ID-CD    OF DCLVINITRNF                      CATUPLDI
             TO TRANS-RFRN-ID-CD    OF DCLACTITRF.                      CATUPLDI
           MOVE RR-CD               OF DCLVINITRNF                      CATUPLDI
             TO RR-CD               OF DCLACTITRF.                      CATUPLDI
                                                                        CATUPLDI
           EXEC SQL                                                     CATUPLDI
                 INSERT                                                 CATUPLDI
                    INTO ACTITRF                                        CATUPLDI
                    (                                                   CATUPLDI
                     CLIENT_NBR                                         CATUPLDI
                    ,RCV_NBR                                            CATUPLDI
                    ,DLVR_NBR                                           CATUPLDI
                    ,ACCT_DLVR_NBR                                      CATUPLDI
                    ,ACCT_RCV_NBR                                       CATUPLDI
                    ,TRNFR_TYPE_CD                                      CATUPLDI
                    ,ACAT_CONTROL_NBR                                   CATUPLDI
                    ,TRANS_TYPE_CD                                      CATUPLDI
                    ,PHSCL_SEQ_NBR                                      CATUPLDI
                    ,SBMTG_PRTCP_NBR                                    CATUPLDI
                    ,PHSCL_SEQ_STTS_CD                                  CATUPLDI
                    ,LGCL_SEQ_NBR                                       CATUPLDI
                    ,LGCL_SEQ_NR_STS_CD                                 CATUPLDI
                    ,RCV_CUST_NM                                        CATUPLDI
                    ,TRANS_TYPE_STTS_CD                                 CATUPLDI
                    ,CONTROL_NBR_STS_CD                                 CATUPLDI
                    ,RCV_SS_PRIM_NBR                                    CATUPLDI
                    ,TRNFR_TYPE_STTS_CD                                 CATUPLDI
                    ,RCV_SS_SCNDY_NBR                                   CATUPLDI
                    ,SBMT_PRT_NR_STS_CD                                 CATUPLDI
                    ,RCV_ACCT_TYPE_CD                                   CATUPLDI
                    ,RCV_NBR_STTS_CD                                    CATUPLDI
                    ,NSCC_PEND_CD                                       CATUPLDI
                    ,RCV_OCC_BRKR_NBR                                   CATUPLDI
                    ,DLVR_NBR_STTS_CD                                   CATUPLDI
                    ,RCV_CRSPN_NBR                                      CATUPLDI
                    ,ACCT_RCV_STTS_CD                                   CATUPLDI
                    ,ACAT_CNTL_ASTD_NBR                                 CATUPLDI
                    ,ACCT_DLVR_STTS_CD                                  CATUPLDI
                    ,CMNT_TXT                                           CATUPLDI
                    ,RCV_CUST_NM_STS_CD                                 CATUPLDI
                    ,PRCS_DT                                            CATUPLDI
                    ,RCV_OCC_STTS_CD                                    CATUPLDI
                    ,RCV_SS_PRIM_STS_CD                                 CATUPLDI
                    ,STTS_CD                                            CATUPLDI
                    ,RCV_CRSPN_STTS_CD                                  CATUPLDI
                    ,DSTBN_SIDE_CD                                      CATUPLDI
                    ,TRNFR_TYPE_RJCT_CD                                 CATUPLDI
                    ,SYS_ACT_CD                                         CATUPLDI
                    ,RCV_SS_SCDY_STS_CD                                 CATUPLDI
                    ,SYS_RJCT_RSN_CD                                    CATUPLDI
                    ,RCV_ACT_TYP_STS_CD                                 CATUPLDI
                    ,TRNFR_TYPE_RJC2_CD                                 CATUPLDI
                    ,CNTL_ASTD_STTS_CD                                  CATUPLDI
                    ,TRN_TYP_RJC_STS_CD                                 CATUPLDI
                    ,TRNFR_TYPE_RJC1_CD                                 CATUPLDI
                    ,STTLM_ASCTD_STS_CD                                 CATUPLDI
                    ,NSCC_ACK_IND                                       CATUPLDI
                    ,PRTCP_CONTRA_CD                                    CATUPLDI
                    ,TRANS_RFRN_STTS_CD                                 CATUPLDI
                    ,CMNT_STTS_CD                                       CATUPLDI
                    ,CICS_TERM_ID_CD                                    CATUPLDI
                    ,CYCLE_CD                                           CATUPLDI
                    ,PRGM_NM                                            CATUPLDI
                    ,DAYS_STTS_QTY                                      CATUPLDI
                    ,RCRD_LNGTH_STTS_CD                                 CATUPLDI
                    ,CRT_TMSTP                                          CATUPLDI
                    ,RCRD_STTS_CD                                       CATUPLDI
                    ,UPDT_TMSTP                                         CATUPLDI
                    ,DB_CR_CD                                           CATUPLDI
                    ,STTLM_ASCTD_DT                                     CATUPLDI
                    ,TRANS_RFRN_ID_CD                                   CATUPLDI
                    ,RR_CD                                              CATUPLDI
                    )                                                   CATUPLDI
                    VALUES                                              CATUPLDI
                    (                                                   CATUPLDI
                    :DCLACTITRF.CLIENT-NBR                              CATUPLDI
                   ,:DCLACTITRF.RCV-NBR                                 CATUPLDI
                   ,:DCLACTITRF.DLVR-NBR                                CATUPLDI
                   ,:DCLACTITRF.ACCT-DLVR-NBR                           CATUPLDI
                   ,:DCLACTITRF.ACCT-RCV-NBR                            CATUPLDI
                   ,:DCLACTITRF.TRNFR-TYPE-CD                           CATUPLDI
                   ,:DCLACTITRF.ACAT-CONTROL-NBR                        CATUPLDI
                   ,:DCLACTITRF.TRANS-TYPE-CD                           CATUPLDI
                   ,:DCLACTITRF.PHSCL-SEQ-NBR                           CATUPLDI
                   ,:DCLACTITRF.SBMTG-PRTCP-NBR                         CATUPLDI
                   ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                       CATUPLDI
                   ,:DCLACTITRF.LGCL-SEQ-NBR                            CATUPLDI
                   ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                      CATUPLDI
                   ,:DCLACTITRF.RCV-CUST-NM                             CATUPLDI
                   ,:DCLACTITRF.TRANS-TYPE-STTS-CD                      CATUPLDI
                   ,:DCLACTITRF.CONTROL-NBR-STS-CD                      CATUPLDI
                   ,:DCLACTITRF.RCV-SS-PRIM-NBR                         CATUPLDI
                   ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                      CATUPLDI
                   ,:DCLACTITRF.RCV-SS-SCNDY-NBR                        CATUPLDI
                   ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                      CATUPLDI
                   ,:DCLACTITRF.RCV-ACCT-TYPE-CD                        CATUPLDI
                   ,:DCLACTITRF.RCV-NBR-STTS-CD                         CATUPLDI
                   ,:DCLACTITRF.NSCC-PEND-CD                            CATUPLDI
                   ,:DCLACTITRF.RCV-OCC-BRKR-NBR                        CATUPLDI
                   ,:DCLACTITRF.DLVR-NBR-STTS-CD                        CATUPLDI
                   ,:DCLACTITRF.RCV-CRSPN-NBR                           CATUPLDI
                   ,:DCLACTITRF.ACCT-RCV-STTS-CD                        CATUPLDI
                   ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                      CATUPLDI
                   ,:DCLACTITRF.ACCT-DLVR-STTS-CD                       CATUPLDI
                   ,:DCLACTITRF.CMNT-TXT                                CATUPLDI
                   ,:DCLACTITRF.RCV-CUST-NM-STS-CD                      CATUPLDI
                   ,:DCLACTITRF.PRCS-DT                                 CATUPLDI
                   ,:DCLACTITRF.RCV-OCC-STTS-CD                         CATUPLDI
                   ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                      CATUPLDI
                   ,:DCLACTITRF.STTS-CD                                 CATUPLDI
                   ,:DCLACTITRF.RCV-CRSPN-STTS-CD                       CATUPLDI
                   ,:DCLACTITRF.DSTBN-SIDE-CD                           CATUPLDI
                   ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                      CATUPLDI
                   ,:DCLACTITRF.SYS-ACT-CD                              CATUPLDI
                   ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                      CATUPLDI
                   ,:DCLACTITRF.SYS-RJCT-RSN-CD                         CATUPLDI
                   ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                      CATUPLDI
                   ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                      CATUPLDI
                   ,:DCLACTITRF.CNTL-ASTD-STTS-CD                       CATUPLDI
                   ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                      CATUPLDI
                   ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                      CATUPLDI
                   ,:DCLACTITRF.STTLM-ASCTD-STS-CD                      CATUPLDI
                   ,:DCLACTITRF.NSCC-ACK-IND                            CATUPLDI
                   ,:DCLACTITRF.PRTCP-CONTRA-CD                         CATUPLDI
                   ,:DCLACTITRF.TRANS-RFRN-STTS-CD                      CATUPLDI
                   ,:DCLACTITRF.CMNT-STTS-CD                            CATUPLDI
                   ,:DCLACTITRF.CICS-TERM-ID-CD                         CATUPLDI
                   ,:DCLACTITRF.CYCLE-CD                                CATUPLDI
                   ,:DCLACTITRF.PRGM-NM                                 CATUPLDI
                   ,:DCLACTITRF.DAYS-STTS-QTY                           CATUPLDI
                   ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                      CATUPLDI
                   ,:DCLACTITRF.CRT-TMSTP                               CATUPLDI
                   ,:DCLACTITRF.RCRD-STTS-CD                            CATUPLDI
                   ,:DCLACTITRF.UPDT-TMSTP                              CATUPLDI
                   ,:DCLACTITRF.DB-CR-CD                                CATUPLDI
                   ,:DCLACTITRF.STTLM-ASCTD-DT                          CATUPLDI
                   ,:DCLACTITRF.TRANS-RFRN-ID-CD                        CATUPLDI
                   ,:DCLACTITRF.RR-CD                                   CATUPLDI
                   )                                                    CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           EVALUATE SQLCODE                                             CATUPLDI
                 WHEN -803                                              CATUPLDI
                    PERFORM 1110-UPDATE-ACTITRF                         CATUPLDI
                 WHEN +0                                                CATUPLDI
                    ADD 1 TO WS-ACTITRF-COUNT                           CATUPLDI
                 WHEN OTHER                                             CATUPLDI
                    MOVE 1100 TO ABORT-CODE                             CATUPLDI
                    PERFORM SQL-ERROR-ROUTINE                           CATUPLDI
           END-EVALUATE.                                                CATUPLDI
                                                                        CATUPLDI
       1110-UPDATE-ACTITRF.                                             CATUPLDI
           EXEC SQL                                                     CATUPLDI
              UPDATE ACTITRF                                            CATUPLDI
                SET                                                     CATUPLDI
               PHSCL_SEQ_NBR       = :DCLACTITRF.PHSCL-SEQ-NBR          CATUPLDI
              ,SBMTG_PRTCP_NBR     = :DCLACTITRF.SBMTG-PRTCP-NBR        CATUPLDI
              ,PHSCL_SEQ_STTS_CD   = :DCLACTITRF.PHSCL-SEQ-STTS-CD      CATUPLDI
              ,LGCL_SEQ_NBR        = :DCLACTITRF.LGCL-SEQ-NBR           CATUPLDI
              ,LGCL_SEQ_NR_STS_CD  = :DCLACTITRF.LGCL-SEQ-NR-STS-CD     CATUPLDI
              ,RCV_CUST_NM         = :DCLACTITRF.RCV-CUST-NM            CATUPLDI
              ,TRANS_TYPE_CD       = :DCLACTITRF.TRANS-TYPE-CD          CATUPLDI
              ,TRANS_TYPE_STTS_CD  = :DCLACTITRF.TRANS-TYPE-STTS-CD     CATUPLDI
              ,CONTROL_NBR_STS_CD  = :DCLACTITRF.CONTROL-NBR-STS-CD     CATUPLDI
              ,RCV_SS_PRIM_NBR     = :DCLACTITRF.RCV-SS-PRIM-NBR        CATUPLDI
              ,TRNFR_TYPE_STTS_CD  = :DCLACTITRF.TRNFR-TYPE-STTS-CD     CATUPLDI
              ,RCV_SS_SCNDY_NBR    = :DCLACTITRF.RCV-SS-SCNDY-NBR       CATUPLDI
              ,SBMT_PRT_NR_STS_CD  = :DCLACTITRF.SBMT-PRT-NR-STS-CD     CATUPLDI
              ,RCV_ACCT_TYPE_CD    = :DCLACTITRF.RCV-ACCT-TYPE-CD       CATUPLDI
              ,RCV_NBR_STTS_CD     = :DCLACTITRF.RCV-NBR-STTS-CD        CATUPLDI
              ,NSCC_PEND_CD        = :DCLACTITRF.NSCC-PEND-CD           CATUPLDI
              ,RCV_OCC_BRKR_NBR    = :DCLACTITRF.RCV-OCC-BRKR-NBR       CATUPLDI
              ,DLVR_NBR_STTS_CD    = :DCLACTITRF.DLVR-NBR-STTS-CD       CATUPLDI
              ,RCV_CRSPN_NBR       = :DCLACTITRF.RCV-CRSPN-NBR          CATUPLDI
              ,ACCT_RCV_STTS_CD    = :DCLACTITRF.ACCT-RCV-STTS-CD       CATUPLDI
              ,ACAT_CNTL_ASTD_NBR  = :DCLACTITRF.ACAT-CNTL-ASTD-NBR     CATUPLDI
              ,ACCT_DLVR_STTS_CD   = :DCLACTITRF.ACCT-DLVR-STTS-CD      CATUPLDI
              ,CMNT_TXT            = :DCLACTITRF.CMNT-TXT               CATUPLDI
              ,RCV_CUST_NM_STS_CD  = :DCLACTITRF.RCV-CUST-NM-STS-CD     CATUPLDI
              ,PRCS_DT             = :DCLACTITRF.PRCS-DT                CATUPLDI
              ,RCV_OCC_STTS_CD     = :DCLACTITRF.RCV-OCC-STTS-CD        CATUPLDI
              ,RCV_SS_PRIM_STS_CD  = :DCLACTITRF.RCV-SS-PRIM-STS-CD     CATUPLDI
              ,STTS_CD             = :DCLACTITRF.STTS-CD                CATUPLDI
              ,RCV_CRSPN_STTS_CD   = :DCLACTITRF.RCV-CRSPN-STTS-CD      CATUPLDI
              ,DSTBN_SIDE_CD       = :DCLACTITRF.DSTBN-SIDE-CD          CATUPLDI
              ,TRNFR_TYPE_RJCT_CD  = :DCLACTITRF.TRNFR-TYPE-RJCT-CD     CATUPLDI
              ,SYS_ACT_CD          = :DCLACTITRF.SYS-ACT-CD             CATUPLDI
              ,RCV_SS_SCDY_STS_CD  = :DCLACTITRF.RCV-SS-SCDY-STS-CD     CATUPLDI
              ,SYS_RJCT_RSN_CD     = :DCLACTITRF.SYS-RJCT-RSN-CD        CATUPLDI
              ,RCV_ACT_TYP_STS_CD  = :DCLACTITRF.RCV-ACT-TYP-STS-CD     CATUPLDI
              ,TRNFR_TYPE_RJC2_CD  = :DCLACTITRF.TRNFR-TYPE-RJC2-CD     CATUPLDI
              ,CNTL_ASTD_STTS_CD   = :DCLACTITRF.CNTL-ASTD-STTS-CD      CATUPLDI
              ,TRN_TYP_RJC_STS_CD  = :DCLACTITRF.TRN-TYP-RJC-STS-CD     CATUPLDI
              ,TRNFR_TYPE_RJC1_CD  = :DCLACTITRF.TRNFR-TYPE-RJC1-CD     CATUPLDI
              ,STTLM_ASCTD_STS_CD  = :DCLACTITRF.STTLM-ASCTD-STS-CD     CATUPLDI
              ,NSCC_ACK_IND        = :DCLACTITRF.NSCC-ACK-IND           CATUPLDI
              ,PRTCP_CONTRA_CD     = :DCLACTITRF.PRTCP-CONTRA-CD        CATUPLDI
              ,TRANS_RFRN_STTS_CD  = :DCLACTITRF.TRANS-RFRN-STTS-CD     CATUPLDI
              ,CMNT_STTS_CD        = :DCLACTITRF.CMNT-STTS-CD           CATUPLDI
              ,CICS_TERM_ID_CD     = :DCLACTITRF.CICS-TERM-ID-CD        CATUPLDI
              ,CYCLE_CD            = :DCLACTITRF.CYCLE-CD               CATUPLDI
              ,PRGM_NM             = :DCLACTITRF.PRGM-NM                CATUPLDI
              ,DAYS_STTS_QTY       = :DCLACTITRF.DAYS-STTS-QTY          CATUPLDI
              ,RCRD_LNGTH_STTS_CD  = :DCLACTITRF.RCRD-LNGTH-STTS-CD     CATUPLDI
              ,CRT_TMSTP           = :DCLACTITRF.CRT-TMSTP              CATUPLDI
              ,RCRD_STTS_CD        = :DCLACTITRF.RCRD-STTS-CD           CATUPLDI
              ,UPDT_TMSTP          = :DCLACTITRF.UPDT-TMSTP             CATUPLDI
              ,DB_CR_CD            = :DCLACTITRF.DB-CR-CD               CATUPLDI
              ,STTLM_ASCTD_DT      = :DCLACTITRF.STTLM-ASCTD-DT         CATUPLDI
              ,TRANS_RFRN_ID_CD    = :DCLACTITRF.TRANS-RFRN-ID-CD       CATUPLDI
              ,RR_CD               = :DCLACTITRF.RR-CD                  CATUPLDI
             WHERE                                                      CATUPLDI
                 (CLIENT_NBR       = :DCLACTITRF.CLIENT-NBR       AND   CATUPLDI
                  DLVR_NBR         = :DCLACTITRF.DLVR-NBR         AND   CATUPLDI
                  ACCT_DLVR_NBR    = :DCLACTITRF.ACCT-DLVR-NBR    AND   CATUPLDI
                  RCV_NBR          = :DCLACTITRF.RCV-NBR          AND   CATUPLDI
                  ACCT_RCV_NBR     = :DCLACTITRF.ACCT-RCV-NBR     AND   CATUPLDI
                  TRNFR_TYPE_CD    = :DCLACTITRF.TRNFR-TYPE-CD    AND   CATUPLDI
                  ACAT_CONTROL_NBR = :DCLACTITRF.ACAT-CONTROL-NBR       CATUPLDI
                  )                                                     CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           EVALUATE SQLCODE                                             CATUPLDI
              WHEN +0                                                   CATUPLDI
                    ADD 1 TO WS-ACTITRF-COUNT-REPL                      CATUPLDI
              WHEN OTHER                                                CATUPLDI
                    MOVE 1110 TO ABORT-CODE                             CATUPLDI
                    PERFORM SQL-ERROR-ROUTINE                           CATUPLDI
           END-EVALUATE.                                                CATUPLDI
                                                                        CATUPLDI
       1200-CREATE-INITIAL-ASSET-RTN.                                   CATUPLDI
                                                                        CATUPLDI
           MOVE RECORD-DETAIL TO DCLVINITAST.                           CATUPLDI
                                                                        CATUPLDI
           MOVE CLIENT-NBR           OF DCLVINITAST                     CATUPLDI
             TO CLIENT-NBR           OF DCLACTIAST.                     CATUPLDI
           MOVE DLVR-NBR             OF DCLVINITAST                     CATUPLDI
             TO DLVR-NBR             OF DCLACTIAST.                     CATUPLDI
           MOVE RCV-NBR              OF DCLVINITAST                     CATUPLDI
             TO RCV-NBR              OF DCLACTIAST.                     CATUPLDI
           MOVE ACCT-DLVR-NBR        OF DCLVINITAST                     CATUPLDI
             TO ACCT-DLVR-NBR        OF DCLACTIAST.                     CATUPLDI
           MOVE ACCT-RCV-NBR         OF DCLVINITAST                     CATUPLDI
             TO ACCT-RCV-NBR         OF DCLACTIAST.                     CATUPLDI
           MOVE STTLM-LCTN-CD        OF DCLVINITAST                     CATUPLDI
             TO STTLM-LCTN-CD        OF DCLACTIAST.                     CATUPLDI
           MOVE ISIN-CNTRY-CD        OF DCLVINITAST                     CATUPLDI
             TO ISIN-CNTRY-CD        OF DCLACTIAST.                     CATUPLDI
           MOVE ISIN-SEC-ISSUE-CD    OF DCLVINITAST                     CATUPLDI
             TO ISIN-SEC-ISSUE-CD    OF DCLACTIAST.                     CATUPLDI
           MOVE ISIN-SEC-CDG-CD      OF DCLVINITAST                     CATUPLDI
             TO ISIN-SEC-CDG-CD      OF DCLACTIAST.                     CATUPLDI
           MOVE CSH-MGN-SHRT-CD      OF DCLVINITAST                     CATUPLDI
             TO CSH-MGN-SHRT-CD      OF DCLACTIAST.                     CATUPLDI
           MOVE ACAT-CONTROL-NBR     OF DCLVINITAST                     CATUPLDI
             TO ACAT-CONTROL-NBR     OF DCLACTIAST.                     CATUPLDI
           MOVE TRANS-TYPE-CD        OF DCLVINITAST                     CATUPLDI
             TO TRANS-TYPE-CD        OF DCLACTIAST.                     CATUPLDI
           MOVE ASSET-SEQ-NBR        OF DCLVINITAST                     CATUPLDI
             TO ASSET-SEQ-NBR        OF DCLACTIAST.                     CATUPLDI
           MOVE RCRD-STTS-CD         OF DCLVINITAST                     CATUPLDI
             TO RCRD-STTS-CD         OF DCLACTIAST.                     CATUPLDI
           MOVE RCRD-LNGTH-STTS-CD   OF DCLVINITAST                     CATUPLDI
             TO RCRD-LNGTH-STTS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE AST-SEQ-NBR-STS-CD   OF DCLVINITAST                     CATUPLDI
             TO AST-SEQ-NBR-STS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE OPTN-CTGY-STTS-CD    OF DCLVINITAST                     CATUPLDI
             TO OPTN-CTGY-STTS-CD    OF DCLACTIAST.                     CATUPLDI
           MOVE SBMTG-PRTCP-NBR      OF DCLVINITAST                     CATUPLDI
             TO SBMTG-PRTCP-NBR      OF DCLACTIAST.                     CATUPLDI
           MOVE AST-PRC-CTG-STS-CD   OF DCLVINITAST                     CATUPLDI
             TO AST-PRC-CTG-STS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE SBMT-PRT-NR-STS-CD   OF DCLVINITAST                     CATUPLDI
             TO SBMT-PRT-NR-STS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE PHSCL-SEQ-NBR        OF DCLVINITAST                     CATUPLDI
             TO PHSCL-SEQ-NBR        OF DCLACTIAST.                     CATUPLDI
           MOVE CONTROL-NBR-STS-CD   OF DCLVINITAST                     CATUPLDI
             TO CONTROL-NBR-STS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE STTLM-LCTN-STTS-CD   OF DCLVINITAST                     CATUPLDI
             TO STTLM-LCTN-STTS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE LGCL-SEQ-NBR         OF DCLVINITAST                     CATUPLDI
             TO LGCL-SEQ-NBR         OF DCLACTIAST.                     CATUPLDI
           MOVE ASSET-PRC-CTGY-CD    OF DCLVINITAST                     CATUPLDI
             TO ASSET-PRC-CTGY-CD    OF DCLACTIAST.                     CATUPLDI
           MOVE STTLM-RSN-STTS-CD    OF DCLVINITAST                     CATUPLDI
             TO STTLM-RSN-STTS-CD    OF DCLACTIAST.                     CATUPLDI
           MOVE ISIN-CNTRY-STTS-CD   OF DCLVINITAST                     CATUPLDI
             TO ISIN-CNTRY-STTS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE ISIN-SEC-IS-STS-CD   OF DCLVINITAST                     CATUPLDI
             TO ISIN-SEC-IS-STS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE PHSCL-SEQ-STTS-CD    OF DCLVINITAST                     CATUPLDI
             TO PHSCL-SEQ-STTS-CD    OF DCLACTIAST.                     CATUPLDI
           MOVE STTLM-RSN-CD         OF DCLVINITAST                     CATUPLDI
             TO STTLM-RSN-CD         OF DCLACTIAST.                     CATUPLDI
           MOVE ISIN-SEC-CD-STS-CD   OF DCLVINITAST                     CATUPLDI
             TO ISIN-SEC-CD-STS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE LGCL-SEQ-NR-STS-CD   OF DCLVINITAST                     CATUPLDI
             TO LGCL-SEQ-NR-STS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE ASSET-DESC-TXT       OF DCLVINITAST                     CATUPLDI
             TO ASSET-DESC-TXT       OF DCLACTIAST.                     CATUPLDI
           MOVE ASSET-DESC-STTS-CD   OF DCLVINITAST                     CATUPLDI
             TO ASSET-DESC-STTS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE ASSET-RQST-QTY-CD    OF DCLVINITAST                     CATUPLDI
             TO ASSET-RQST-QTY-CD    OF DCLACTIAST.                     CATUPLDI
           MOVE ASSET-RQST-STS-CD    OF DCLVINITAST                     CATUPLDI
             TO ASSET-RQST-STS-CD    OF DCLACTIAST.                     CATUPLDI
           MOVE AST-RQST-TRANS-CD    OF DCLVINITAST                     CATUPLDI
             TO AST-RQST-TRANS-CD    OF DCLACTIAST.                     CATUPLDI
           MOVE AST-RQ-TRAN-STS-CD   OF DCLVINITAST                     CATUPLDI
             TO AST-RQ-TRAN-STS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE ASSET-QTY            OF DCLVINITAST                     CATUPLDI
             TO ASSET-QTY            OF DCLACTIAST.                     CATUPLDI
           MOVE ASSET-PCT            OF DCLVINITAST                     CATUPLDI
             TO ASSET-PCT            OF DCLACTIAST.                     CATUPLDI
           MOVE ASSET-QTY-STTS-CD    OF DCLVINITAST                     CATUPLDI
             TO ASSET-QTY-STTS-CD    OF DCLACTIAST.                     CATUPLDI
           MOVE PSTN-CD              OF DCLVINITAST                     CATUPLDI
             TO PSTN-CD              OF DCLACTIAST.                     CATUPLDI
           MOVE ASSET-PCT-STTS-CD    OF DCLVINITAST                     CATUPLDI
             TO ASSET-PCT-STTS-CD    OF DCLACTIAST.                     CATUPLDI
           MOVE ISO-CRNCY-CD         OF DCLVINITAST                     CATUPLDI
             TO ISO-CRNCY-CD         OF DCLACTIAST.                     CATUPLDI
           MOVE PSTN-CD-STTS-CD      OF DCLVINITAST                     CATUPLDI
             TO PSTN-CD-STTS-CD      OF DCLACTIAST.                     CATUPLDI
           MOVE ASSET-AMT            OF DCLVINITAST                     CATUPLDI
             TO ASSET-AMT            OF DCLACTIAST.                     CATUPLDI
           MOVE ISO-CRNCY-STTS-CD    OF DCLVINITAST                     CATUPLDI
             TO ISO-CRNCY-STTS-CD    OF DCLACTIAST.                     CATUPLDI
           MOVE ASSET-AMT-STTS-CD    OF DCLVINITAST                     CATUPLDI
             TO ASSET-AMT-STTS-CD    OF DCLACTIAST.                     CATUPLDI
           MOVE BEARER-BOND-CD       OF DCLVINITAST                     CATUPLDI
             TO BEARER-BOND-CD       OF DCLACTIAST.                     CATUPLDI
           MOVE BEARER-BND-STTS-CD   OF DCLVINITAST                     CATUPLDI
             TO BEARER-BND-STTS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE WHI-CD               OF DCLVINITAST                     CATUPLDI
             TO WHI-CD               OF DCLACTIAST.                     CATUPLDI
           MOVE CSH-MRG-SHT-STS-CD   OF DCLVINITAST                     CATUPLDI
             TO CSH-MRG-SHT-STS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE TRNFR-TYPE-RSN-CD    OF DCLVINITAST                     CATUPLDI
             TO TRNFR-TYPE-RSN-CD    OF DCLACTIAST.                     CATUPLDI
           MOVE WHI-STTS-CD          OF DCLVINITAST                     CATUPLDI
             TO WHI-STTS-CD          OF DCLACTIAST.                     CATUPLDI
           MOVE TRN-TYP-RSN-STS-CD   OF DCLVINITAST                     CATUPLDI
             TO TRN-TYP-RSN-STS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE MBS-SERIAL-NBR       OF DCLVINITAST                     CATUPLDI
             TO MBS-SERIAL-NBR       OF DCLACTIAST.                     CATUPLDI
           MOVE MBS-SERIAL-STTS-CD   OF DCLVINITAST                     CATUPLDI
             TO MBS-SERIAL-STTS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE ASSET-CMNT-TXT       OF DCLVINITAST                     CATUPLDI
             TO ASSET-CMNT-TXT       OF DCLACTIAST.                     CATUPLDI
           MOVE ASSET-CMNT-STTS-CD   OF DCLVINITAST                     CATUPLDI
             TO ASSET-CMNT-STTS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE NSCC-ACK-IND         OF DCLVINITAST                     CATUPLDI
             TO NSCC-ACK-IND         OF DCLACTIAST.                     CATUPLDI
           MOVE NSCC-PEND-CD         OF DCLVINITAST                     CATUPLDI
             TO NSCC-PEND-CD         OF DCLACTIAST.                     CATUPLDI
           MOVE NSCC-WTHLD-CD        OF DCLVINITAST                     CATUPLDI
             TO NSCC-WTHLD-CD        OF DCLACTIAST.                     CATUPLDI
           MOVE CICS-TERM-ID-CD      OF DCLVINITAST                     CATUPLDI
             TO CICS-TERM-ID-CD      OF DCLACTIAST.                     CATUPLDI
           MOVE TRANS-RFRN-STTS-CD   OF DCLVINITAST                     CATUPLDI
             TO TRANS-RFRN-STTS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE PRGM-NM              OF DCLVINITAST                     CATUPLDI
             TO PRGM-NM              OF DCLACTIAST.                     CATUPLDI
           MOVE TRANS-RFRN-ID-CD     OF DCLVINITAST                     CATUPLDI
             TO TRANS-RFRN-ID-CD     OF DCLACTIAST.                     CATUPLDI
           MOVE CRT-TMSTP            OF DCLVINITAST                     CATUPLDI
             TO CRT-TMSTP            OF DCLACTIAST.                     CATUPLDI
           MOVE UPDT-TMSTP           OF DCLVINITAST                     CATUPLDI
             TO UPDT-TMSTP           OF DCLACTIAST.                     CATUPLDI
           MOVE OPTN-CTGY-CD         OF DCLVINITAST                     CATUPLDI
             TO OPTN-CTGY-CD         OF DCLACTIAST.                     CATUPLDI
           MOVE TRANS-TYPE-STTS-CD   OF DCLVINITAST                     CATUPLDI
             TO TRANS-TYPE-STTS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE SECURITY-ADP-NBR     OF DCLVINITAST                     CATUPLDI
             TO SECURITY-ADP-NBR     OF DCLACTIAST.                     CATUPLDI
           MOVE TRNFR-TYPE-CD        OF DCLVINITAST                     CATUPLDI
             TO TRNFR-TYPE-CD        OF DCLACTIAST.                     CATUPLDI
           MOVE TRNFR-TYPE-STTS-CD   OF DCLVINITAST                     CATUPLDI
             TO TRNFR-TYPE-STTS-CD   OF DCLACTIAST.                     CATUPLDI
           MOVE RCV-NBR-STTS-CD      OF DCLVINITAST                     CATUPLDI
             TO RCV-NBR-STTS-CD      OF DCLACTIAST.                     CATUPLDI
           MOVE DLVR-NBR-STTS-CD     OF DCLVINITAST                     CATUPLDI
             TO DLVR-NBR-STTS-CD     OF DCLACTIAST.                     CATUPLDI
           MOVE CAGE-TAG-NBR         OF DCLVINITAST                     CATUPLDI
             TO CAGE-TAG-NBR         OF DCLACTIAST.                     CATUPLDI
                                                                        CATUPLDI
           EXEC SQL                                                     CATUPLDI
               INSERT INTO ACTIAST                                      CATUPLDI
                    (                                                   CATUPLDI
                     CLIENT_NBR                                         CATUPLDI
                    ,DLVR_NBR                                           CATUPLDI
                    ,RCV_NBR                                            CATUPLDI
                    ,ACCT_DLVR_NBR                                      CATUPLDI
                    ,ACCT_RCV_NBR                                       CATUPLDI
                    ,STTLM_LCTN_CD                                      CATUPLDI
                    ,ISIN_CNTRY_CD                                      CATUPLDI
                    ,ISIN_SEC_ISSUE_CD                                  CATUPLDI
                    ,ISIN_SEC_CDG_CD                                    CATUPLDI
                    ,CSH_MGN_SHRT_CD                                    CATUPLDI
                    ,ACAT_CONTROL_NBR                                   CATUPLDI
                    ,TRNFR_TYPE_CD                                      CATUPLDI
                    ,ASSET_SEQ_NBR                                      CATUPLDI
                    ,RCRD_STTS_CD                                       CATUPLDI
                    ,RCRD_LNGTH_STTS_CD                                 CATUPLDI
                    ,AST_SEQ_NBR_STS_CD                                 CATUPLDI
                    ,OPTN_CTGY_STTS_CD                                  CATUPLDI
                    ,SBMTG_PRTCP_NBR                                    CATUPLDI
                    ,AST_PRC_CTG_STS_CD                                 CATUPLDI
                    ,SBMT_PRT_NR_STS_CD                                 CATUPLDI
                    ,PHSCL_SEQ_NBR                                      CATUPLDI
                    ,CONTROL_NBR_STS_CD                                 CATUPLDI
                    ,STTLM_LCTN_STTS_CD                                 CATUPLDI
                    ,LGCL_SEQ_NBR                                       CATUPLDI
                    ,ASSET_PRC_CTGY_CD                                  CATUPLDI
                    ,STTLM_RSN_STTS_CD                                  CATUPLDI
                    ,ISIN_CNTRY_STTS_CD                                 CATUPLDI
                    ,ISIN_SEC_IS_STS_CD                                 CATUPLDI
                    ,PHSCL_SEQ_STTS_CD                                  CATUPLDI
                    ,STTLM_RSN_CD                                       CATUPLDI
                    ,ISIN_SEC_CD_STS_CD                                 CATUPLDI
                    ,LGCL_SEQ_NR_STS_CD                                 CATUPLDI
                    ,ASSET_DESC_TXT                                     CATUPLDI
                    ,ASSET_DESC_STTS_CD                                 CATUPLDI
                    ,ASSET_RQST_QTY_CD                                  CATUPLDI
                    ,ASSET_RQST_STS_CD                                  CATUPLDI
                    ,AST_RQST_TRANS_CD                                  CATUPLDI
                    ,AST_RQ_TRAN_STS_CD                                 CATUPLDI
                    ,ASSET_QTY                                          CATUPLDI
                    ,ASSET_PCT                                          CATUPLDI
                    ,ASSET_QTY_STTS_CD                                  CATUPLDI
                    ,PSTN_CD                                            CATUPLDI
                    ,ASSET_PCT_STTS_CD                                  CATUPLDI
                    ,ISO_CRNCY_CD                                       CATUPLDI
                    ,PSTN_CD_STTS_CD                                    CATUPLDI
                    ,ASSET_AMT                                          CATUPLDI
                    ,ISO_CRNCY_STTS_CD                                  CATUPLDI
                    ,ASSET_AMT_STTS_CD                                  CATUPLDI
                    ,BEARER_BOND_CD                                     CATUPLDI
                    ,BEARER_BND_STTS_CD                                 CATUPLDI
                    ,WHI_CD                                             CATUPLDI
                    ,CSH_MRG_SHT_STS_CD                                 CATUPLDI
                    ,TRNFR_TYPE_RSN_CD                                  CATUPLDI
                    ,WHI_STTS_CD                                        CATUPLDI
                    ,TRN_TYP_RSN_STS_CD                                 CATUPLDI
                    ,MBS_SERIAL_NBR                                     CATUPLDI
                    ,MBS_SERIAL_STTS_CD                                 CATUPLDI
                    ,ASSET_CMNT_TXT                                     CATUPLDI
                    ,ASSET_CMNT_STTS_CD                                 CATUPLDI
                    ,NSCC_ACK_IND                                       CATUPLDI
                    ,NSCC_PEND_CD                                       CATUPLDI
                    ,NSCC_WTHLD_CD                                      CATUPLDI
                    ,CICS_TERM_ID_CD                                    CATUPLDI
                    ,TRANS_RFRN_STTS_CD                                 CATUPLDI
                    ,PRGM_NM                                            CATUPLDI
                    ,TRANS_RFRN_ID_CD                                   CATUPLDI
                    ,CRT_TMSTP                                          CATUPLDI
                    ,UPDT_TMSTP                                         CATUPLDI
                    ,OPTN_CTGY_CD                                       CATUPLDI
                    ,TRANS_TYPE_STTS_CD                                 CATUPLDI
                    ,SECURITY_ADP_NBR                                   CATUPLDI
                    ,TRANS_TYPE_CD                                      CATUPLDI
                    ,TRNFR_TYPE_STTS_CD                                 CATUPLDI
                    ,RCV_NBR_STTS_CD                                    CATUPLDI
                    ,DLVR_NBR_STTS_CD                                   CATUPLDI
                    ,CAGE_TAG_NBR                                       CATUPLDI
                    )                                                   CATUPLDI
               VALUES                                                   CATUPLDI
                    (                                                   CATUPLDI
                   :DCLACTIAST.CLIENT-NBR                               CATUPLDI
                  ,:DCLACTIAST.DLVR-NBR                                 CATUPLDI
                  ,:DCLACTIAST.RCV-NBR                                  CATUPLDI
                  ,:DCLACTIAST.ACCT-DLVR-NBR                            CATUPLDI
                  ,:DCLACTIAST.ACCT-RCV-NBR                             CATUPLDI
                  ,:DCLACTIAST.STTLM-LCTN-CD                            CATUPLDI
                  ,:DCLACTIAST.ISIN-CNTRY-CD                            CATUPLDI
                  ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                        CATUPLDI
                  ,:DCLACTIAST.ISIN-SEC-CDG-CD                          CATUPLDI
                  ,:DCLACTIAST.CSH-MGN-SHRT-CD                          CATUPLDI
                  ,:DCLACTIAST.ACAT-CONTROL-NBR                         CATUPLDI
                  ,:DCLACTIAST.TRNFR-TYPE-CD                            CATUPLDI
                  ,:DCLACTIAST.ASSET-SEQ-NBR                            CATUPLDI
                  ,:DCLACTIAST.RCRD-STTS-CD                             CATUPLDI
                  ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                       CATUPLDI
                  ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                       CATUPLDI
                  ,:DCLACTIAST.OPTN-CTGY-STTS-CD                        CATUPLDI
                  ,:DCLACTIAST.SBMTG-PRTCP-NBR                          CATUPLDI
                  ,:DCLACTIAST.AST-PRC-CTG-STS-CD                       CATUPLDI
                  ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                       CATUPLDI
                  ,:DCLACTIAST.PHSCL-SEQ-NBR                            CATUPLDI
                  ,:DCLACTIAST.CONTROL-NBR-STS-CD                       CATUPLDI
                  ,:DCLACTIAST.STTLM-LCTN-STTS-CD                       CATUPLDI
                  ,:DCLACTIAST.LGCL-SEQ-NBR                             CATUPLDI
                  ,:DCLACTIAST.ASSET-PRC-CTGY-CD                        CATUPLDI
                  ,:DCLACTIAST.STTLM-RSN-STTS-CD                        CATUPLDI
                  ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                       CATUPLDI
                  ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                       CATUPLDI
                  ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                        CATUPLDI
                  ,:DCLACTIAST.STTLM-RSN-CD                             CATUPLDI
                  ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                       CATUPLDI
                  ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                       CATUPLDI
                  ,:DCLACTIAST.ASSET-DESC-TXT                           CATUPLDI
                  ,:DCLACTIAST.ASSET-DESC-STTS-CD                       CATUPLDI
                  ,:DCLACTIAST.ASSET-RQST-QTY-CD                        CATUPLDI
                  ,:DCLACTIAST.ASSET-RQST-STS-CD                        CATUPLDI
                  ,:DCLACTIAST.AST-RQST-TRANS-CD                        CATUPLDI
                  ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                       CATUPLDI
                  ,:DCLACTIAST.ASSET-QTY                                CATUPLDI
                  ,:DCLACTIAST.ASSET-PCT                                CATUPLDI
                  ,:DCLACTIAST.ASSET-QTY-STTS-CD                        CATUPLDI
                  ,:DCLACTIAST.PSTN-CD                                  CATUPLDI
                  ,:DCLACTIAST.ASSET-PCT-STTS-CD                        CATUPLDI
                  ,:DCLACTIAST.ISO-CRNCY-CD                             CATUPLDI
                  ,:DCLACTIAST.PSTN-CD-STTS-CD                          CATUPLDI
                  ,:DCLACTIAST.ASSET-AMT                                CATUPLDI
                  ,:DCLACTIAST.ISO-CRNCY-STTS-CD                        CATUPLDI
                  ,:DCLACTIAST.ASSET-AMT-STTS-CD                        CATUPLDI
                  ,:DCLACTIAST.BEARER-BOND-CD                           CATUPLDI
                  ,:DCLACTIAST.BEARER-BND-STTS-CD                       CATUPLDI
                  ,:DCLACTIAST.WHI-CD                                   CATUPLDI
                  ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                       CATUPLDI
                  ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                        CATUPLDI
                  ,:DCLACTIAST.WHI-STTS-CD                              CATUPLDI
                  ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                       CATUPLDI
                  ,:DCLACTIAST.MBS-SERIAL-NBR                           CATUPLDI
                  ,:DCLACTIAST.MBS-SERIAL-STTS-CD                       CATUPLDI
                  ,:DCLACTIAST.ASSET-CMNT-TXT                           CATUPLDI
                  ,:DCLACTIAST.ASSET-CMNT-STTS-CD                       CATUPLDI
                  ,:DCLACTIAST.NSCC-ACK-IND                             CATUPLDI
                  ,:DCLACTIAST.NSCC-PEND-CD                             CATUPLDI
                  ,:DCLACTIAST.NSCC-WTHLD-CD                            CATUPLDI
                  ,:DCLACTIAST.CICS-TERM-ID-CD                          CATUPLDI
                  ,:DCLACTIAST.TRANS-RFRN-STTS-CD                       CATUPLDI
                  ,:DCLACTIAST.PRGM-NM                                  CATUPLDI
                  ,:DCLACTIAST.TRANS-RFRN-ID-CD                         CATUPLDI
                  ,:DCLACTIAST.CRT-TMSTP                                CATUPLDI
                  ,:DCLACTIAST.UPDT-TMSTP                               CATUPLDI
                  ,:DCLACTIAST.OPTN-CTGY-CD                             CATUPLDI
                  ,:DCLACTIAST.TRANS-TYPE-STTS-CD                       CATUPLDI
                  ,:DCLACTIAST.SECURITY-ADP-NBR                         CATUPLDI
                  ,:DCLACTIAST.TRANS-TYPE-CD                            CATUPLDI
                  ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                       CATUPLDI
                  ,:DCLACTIAST.RCV-NBR-STTS-CD                          CATUPLDI
                  ,:DCLACTIAST.DLVR-NBR-STTS-CD                         CATUPLDI
                  ,:DCLACTIAST.CAGE-TAG-NBR                             CATUPLDI
                    )                                                   CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           EVALUATE SQLCODE                                             CATUPLDI
              WHEN -803                                                 CATUPLDI
                 PERFORM 1210-UPDATE-ACTIAST-RTN                        CATUPLDI
              WHEN +0                                                   CATUPLDI
                    ADD 1 TO WS-ACTIAST-COUNT                           CATUPLDI
              WHEN OTHER                                                CATUPLDI
                    MOVE 1200 TO ABORT-CODE                             CATUPLDI
                    PERFORM SQL-ERROR-ROUTINE                           CATUPLDI
           END-EVALUATE.                                                CATUPLDI
                                                                        CATUPLDI
       1210-UPDATE-ACTIAST-RTN.                                         CATUPLDI
           EXEC SQL                                                     CATUPLDI
               UPDATE ACTIAST                                           CATUPLDI
                 SET                                                    CATUPLDI
                RCRD_STTS_CD        = :DCLACTIAST.RCRD-STTS-CD          CATUPLDI
               ,RCRD_LNGTH_STTS_CD  = :DCLACTIAST.RCRD-LNGTH-STTS-CD    CATUPLDI
               ,AST_SEQ_NBR_STS_CD  = :DCLACTIAST.AST-SEQ-NBR-STS-CD    CATUPLDI
               ,OPTN_CTGY_STTS_CD   = :DCLACTIAST.OPTN-CTGY-STTS-CD     CATUPLDI
               ,SBMTG_PRTCP_NBR     = :DCLACTIAST.SBMTG-PRTCP-NBR       CATUPLDI
               ,AST_PRC_CTG_STS_CD  = :DCLACTIAST.AST-PRC-CTG-STS-CD    CATUPLDI
               ,SBMT_PRT_NR_STS_CD  = :DCLACTIAST.SBMT-PRT-NR-STS-CD    CATUPLDI
               ,PHSCL_SEQ_NBR       = :DCLACTIAST.PHSCL-SEQ-NBR         CATUPLDI
               ,CONTROL_NBR_STS_CD  = :DCLACTIAST.CONTROL-NBR-STS-CD    CATUPLDI
               ,STTLM_LCTN_STTS_CD  = :DCLACTIAST.STTLM-LCTN-STTS-CD    CATUPLDI
               ,LGCL_SEQ_NBR        = :DCLACTIAST.LGCL-SEQ-NBR          CATUPLDI
               ,ASSET_PRC_CTGY_CD   = :DCLACTIAST.ASSET-PRC-CTGY-CD     CATUPLDI
               ,STTLM_RSN_STTS_CD   = :DCLACTIAST.STTLM-RSN-STTS-CD     CATUPLDI
               ,ISIN_CNTRY_STTS_CD  = :DCLACTIAST.ISIN-CNTRY-STTS-CD    CATUPLDI
               ,ISIN_SEC_IS_STS_CD  = :DCLACTIAST.ISIN-SEC-IS-STS-CD    CATUPLDI
               ,PHSCL_SEQ_STTS_CD   = :DCLACTIAST.PHSCL-SEQ-STTS-CD     CATUPLDI
               ,STTLM_RSN_CD        = :DCLACTIAST.STTLM-RSN-CD          CATUPLDI
               ,ISIN_SEC_CD_STS_CD  = :DCLACTIAST.ISIN-SEC-CD-STS-CD    CATUPLDI
               ,LGCL_SEQ_NR_STS_CD  = :DCLACTIAST.LGCL-SEQ-NR-STS-CD    CATUPLDI
               ,ASSET_DESC_TXT      = :DCLACTIAST.ASSET-DESC-TXT        CATUPLDI
               ,ASSET_DESC_STTS_CD  = :DCLACTIAST.ASSET-DESC-STTS-CD    CATUPLDI
               ,ASSET_RQST_QTY_CD   = :DCLACTIAST.ASSET-RQST-QTY-CD     CATUPLDI
               ,ASSET_RQST_STS_CD   = :DCLACTIAST.ASSET-RQST-STS-CD     CATUPLDI
               ,AST_RQST_TRANS_CD   = :DCLACTIAST.AST-RQST-TRANS-CD     CATUPLDI
               ,AST_RQ_TRAN_STS_CD  = :DCLACTIAST.AST-RQ-TRAN-STS-CD    CATUPLDI
               ,ASSET_QTY           = :DCLACTIAST.ASSET-QTY             CATUPLDI
               ,ASSET_PCT           = :DCLACTIAST.ASSET-PCT             CATUPLDI
               ,ASSET_QTY_STTS_CD   = :DCLACTIAST.ASSET-QTY-STTS-CD     CATUPLDI
               ,PSTN_CD             = :DCLACTIAST.PSTN-CD               CATUPLDI
               ,ASSET_PCT_STTS_CD   = :DCLACTIAST.ASSET-PCT-STTS-CD     CATUPLDI
               ,ISO_CRNCY_CD        = :DCLACTIAST.ISO-CRNCY-CD          CATUPLDI
               ,PSTN_CD_STTS_CD     = :DCLACTIAST.PSTN-CD-STTS-CD       CATUPLDI
               ,ASSET_AMT           = :DCLACTIAST.ASSET-AMT             CATUPLDI
               ,ISO_CRNCY_STTS_CD   = :DCLACTIAST.ISO-CRNCY-STTS-CD     CATUPLDI
               ,ASSET_AMT_STTS_CD   = :DCLACTIAST.ASSET-AMT-STTS-CD     CATUPLDI
               ,BEARER_BOND_CD      = :DCLACTIAST.BEARER-BOND-CD        CATUPLDI
               ,BEARER_BND_STTS_CD  = :DCLACTIAST.BEARER-BND-STTS-CD    CATUPLDI
               ,WHI_CD              = :DCLACTIAST.WHI-CD                CATUPLDI
               ,CSH_MRG_SHT_STS_CD  = :DCLACTIAST.CSH-MRG-SHT-STS-CD    CATUPLDI
               ,TRNFR_TYPE_RSN_CD   = :DCLACTIAST.TRNFR-TYPE-RSN-CD     CATUPLDI
               ,WHI_STTS_CD         = :DCLACTIAST.WHI-STTS-CD           CATUPLDI
               ,TRN_TYP_RSN_STS_CD  = :DCLACTIAST.TRN-TYP-RSN-STS-CD    CATUPLDI
               ,MBS_SERIAL_NBR      = :DCLACTIAST.MBS-SERIAL-NBR        CATUPLDI
               ,MBS_SERIAL_STTS_CD  = :DCLACTIAST.MBS-SERIAL-STTS-CD    CATUPLDI
               ,ASSET_CMNT_TXT      = :DCLACTIAST.ASSET-CMNT-TXT        CATUPLDI
               ,ASSET_CMNT_STTS_CD  = :DCLACTIAST.ASSET-CMNT-STTS-CD    CATUPLDI
               ,NSCC_ACK_IND        = :DCLACTIAST.NSCC-ACK-IND          CATUPLDI
               ,NSCC_PEND_CD        = :DCLACTIAST.NSCC-PEND-CD          CATUPLDI
               ,NSCC_WTHLD_CD       = :DCLACTIAST.NSCC-WTHLD-CD         CATUPLDI
               ,CICS_TERM_ID_CD     = :DCLACTIAST.CICS-TERM-ID-CD       CATUPLDI
               ,TRANS_RFRN_STTS_CD  = :DCLACTIAST.TRANS-RFRN-STTS-CD    CATUPLDI
               ,PRGM_NM             = :DCLACTIAST.PRGM-NM               CATUPLDI
               ,TRANS_RFRN_ID_CD    = :DCLACTIAST.TRANS-RFRN-ID-CD      CATUPLDI
               ,CRT_TMSTP           = :DCLACTIAST.CRT-TMSTP             CATUPLDI
               ,UPDT_TMSTP          = :DCLACTIAST.UPDT-TMSTP            CATUPLDI
               ,OPTN_CTGY_CD        = :DCLACTIAST.OPTN-CTGY-CD          CATUPLDI
               ,TRANS_TYPE_STTS_CD  = :DCLACTIAST.TRANS-TYPE-STTS-CD    CATUPLDI
               ,SECURITY_ADP_NBR    = :DCLACTIAST.SECURITY-ADP-NBR      CATUPLDI
               ,TRNFR_TYPE_STTS_CD  = :DCLACTIAST.TRNFR-TYPE-STTS-CD    CATUPLDI
               ,RCV_NBR_STTS_CD     = :DCLACTIAST.RCV-NBR-STTS-CD       CATUPLDI
               ,DLVR_NBR_STTS_CD    = :DCLACTIAST.DLVR-NBR-STTS-CD      CATUPLDI
               ,CAGE_TAG_NBR        = :DCLACTIAST.CAGE-TAG-NBR          CATUPLDI
              WHERE                                                     CATUPLDI
                 (CLIENT_NBR        = :DCLACTIAST.CLIENT-NBR        AND CATUPLDI
                  DLVR_NBR          = :DCLACTIAST.DLVR-NBR          AND CATUPLDI
                  ACCT_DLVR_NBR     = :DCLACTIAST.ACCT-DLVR-NBR     AND CATUPLDI
                  RCV_NBR           = :DCLACTIAST.RCV-NBR           AND CATUPLDI
                  ACCT_RCV_NBR      = :DCLACTIAST.ACCT-RCV-NBR      AND CATUPLDI
                  ISIN_CNTRY_CD     = :DCLACTIAST.ISIN-CNTRY-CD     AND CATUPLDI
                  ISIN_SEC_ISSUE_CD = :DCLACTIAST.ISIN-SEC-ISSUE-CD AND CATUPLDI
                  ISIN_SEC_CDG_CD   = :DCLACTIAST.ISIN-SEC-CDG-CD   AND CATUPLDI
                  STTLM_LCTN_CD     = :DCLACTIAST.STTLM-LCTN-CD     AND CATUPLDI
                  CSH_MGN_SHRT_CD   = :DCLACTIAST.CSH-MGN-SHRT-CD   AND CATUPLDI
                  ACAT_CONTROL_NBR  = :DCLACTIAST.ACAT-CONTROL-NBR  AND CATUPLDI
                  TRNFR_TYPE_CD     = :DCLACTIAST.TRNFR-TYPE-CD     AND CATUPLDI
                  ASSET_SEQ_NBR     = :DCLACTIAST.ASSET-SEQ-NBR         CATUPLDI
                  )                                                     CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           EVALUATE SQLCODE                                             CATUPLDI
              WHEN +0                                                   CATUPLDI
                    ADD 1 TO WS-ACTIAST-COUNT-REPL                      CATUPLDI
              WHEN OTHER                                                CATUPLDI
                    MOVE 1210 TO ABORT-CODE                             CATUPLDI
                    PERFORM SQL-ERROR-ROUTINE                           CATUPLDI
           END-EVALUATE.                                                CATUPLDI
                                                                        CATUPLDI
       1300-CREATE-INITIAL-MF-RTN.                                      CATUPLDI
                                                                        CATUPLDI
           MOVE RECORD-DETAIL TO DCLVINITMF.                            CATUPLDI
                                                                        CATUPLDI
           MOVE CLIENT-NBR           OF DCLVINITMF                      CATUPLDI
             TO CLIENT-NBR           OF DCLACTIMF.                      CATUPLDI
           MOVE DLVR-NBR             OF DCLVINITMF                      CATUPLDI
             TO DLVR-NBR             OF DCLACTIMF.                      CATUPLDI
           MOVE RCV-NBR              OF DCLVINITMF                      CATUPLDI
             TO RCV-NBR              OF DCLACTIMF.                      CATUPLDI
           MOVE ACCT-DLVR-NBR        OF DCLVINITMF                      CATUPLDI
             TO ACCT-DLVR-NBR        OF DCLACTIMF.                      CATUPLDI
           MOVE ACCT-RCV-NBR         OF DCLVINITMF                      CATUPLDI
             TO ACCT-RCV-NBR         OF DCLACTIMF.                      CATUPLDI
           MOVE ISIN-CNTRY-CD        OF DCLVINITMF                      CATUPLDI
             TO ISIN-CNTRY-CD        OF DCLACTIMF.                      CATUPLDI
           MOVE ISIN-SEC-ISSUE-CD    OF DCLVINITMF                      CATUPLDI
             TO ISIN-SEC-ISSUE-CD    OF DCLACTIMF.                      CATUPLDI
           MOVE ISIN-SEC-CDG-CD      OF DCLVINITMF                      CATUPLDI
             TO ISIN-SEC-CDG-CD      OF DCLACTIMF.                      CATUPLDI
           MOVE STTLM-LCTN-CD        OF DCLVINITMF                      CATUPLDI
             TO STTLM-LCTN-CD        OF DCLACTIMF.                      CATUPLDI
           MOVE CSH-MGN-SHRT-CD      OF DCLVINITMF                      CATUPLDI
             TO CSH-MGN-SHRT-CD      OF DCLACTIMF.                      CATUPLDI
           MOVE DSTBN-SIDE-CD        OF DCLVINITMF                      CATUPLDI
             TO DSTBN-SIDE-CD        OF DCLACTIMF.                      CATUPLDI
           MOVE BK-PHSCL-SHR-CD      OF DCLVINITMF                      CATUPLDI
             TO BK-PHSCL-SHR-CD      OF DCLACTIMF.                      CATUPLDI
           MOVE PRCS-DT              OF DCLVINITMF                      CATUPLDI
             TO PRCS-DT              OF DCLACTIMF.                      CATUPLDI
           MOVE RGSTN-CD             OF DCLVINITMF                      CATUPLDI
             TO RGSTN-CD             OF DCLACTIMF.                      CATUPLDI
           MOVE NTWRK-CNTL-CD        OF DCLVINITMF                      CATUPLDI
             TO NTWRK-CNTL-CD        OF DCLACTIMF.                      CATUPLDI
           MOVE DVDND-PAYEE-CD       OF DCLVINITMF                      CATUPLDI
             TO DVDND-PAYEE-CD       OF DCLACTIMF.                      CATUPLDI
           MOVE ACCT-TYPE-CD         OF DCLVINITMF                      CATUPLDI
             TO ACCT-TYPE-CD         OF DCLACTIMF.                      CATUPLDI
           MOVE LTCG-CD              OF DCLVINITMF                      CATUPLDI
             TO LTCG-CD              OF DCLACTIMF.                      CATUPLDI
           MOVE BRKR-EXCTG-NBR       OF DCLVINITMF                      CATUPLDI
             TO BRKR-EXCTG-NBR       OF DCLACTIMF.                      CATUPLDI
           MOVE STCG-CD              OF DCLVINITMF                      CATUPLDI
             TO STCG-CD              OF DCLACTIMF.                      CATUPLDI
           MOVE DVDND-CD             OF DCLVINITMF                      CATUPLDI
             TO DVDND-CD             OF DCLACTIMF.                      CATUPLDI
           MOVE MF-FULL-PRTL-CD      OF DCLVINITMF                      CATUPLDI
             TO MF-FULL-PRTL-CD      OF DCLACTIMF.                      CATUPLDI
           MOVE DVDND-PYE-STTS-CD    OF DCLVINITMF                      CATUPLDI
             TO DVDND-PYE-STTS-CD    OF DCLACTIMF.                      CATUPLDI
           MOVE FNBR                 OF DCLVINITMF                      CATUPLDI
             TO FNBR                 OF DCLACTIMF.                      CATUPLDI
           MOVE BRKR-EXCTG-STTS-CD   OF DCLVINITMF                      CATUPLDI
             TO BRKR-EXCTG-STTS-CD   OF DCLACTIMF.                      CATUPLDI
           MOVE MF-FUL-PRTL-STS-CD   OF DCLVINITMF                      CATUPLDI
             TO MF-FUL-PRTL-STS-CD   OF DCLACTIMF.                      CATUPLDI
           MOVE CICS-TERM-ID-CD      OF DCLVINITMF                      CATUPLDI
             TO CICS-TERM-ID-CD      OF DCLACTIMF.                      CATUPLDI
           MOVE PRGM-NM              OF DCLVINITMF                      CATUPLDI
             TO PRGM-NM              OF DCLACTIMF.                      CATUPLDI
           MOVE CRT-TMSTP            OF DCLVINITMF                      CATUPLDI
             TO CRT-TMSTP            OF DCLACTIMF.                      CATUPLDI
           MOVE FND-ACT-NBR-STS-CD   OF DCLVINITMF                      CATUPLDI
             TO FND-ACT-NBR-STS-CD   OF DCLACTIMF.                      CATUPLDI
           MOVE NTWRK-CNTL-STTS-CD   OF DCLVINITMF                      CATUPLDI
             TO NTWRK-CNTL-STTS-CD   OF DCLACTIMF.                      CATUPLDI
           MOVE UPDT-TMSTP           OF DCLVINITMF                      CATUPLDI
             TO UPDT-TMSTP           OF DCLACTIMF.                      CATUPLDI
           MOVE ACCT-TYPE-STTS-CD    OF DCLVINITMF                      CATUPLDI
             TO ACCT-TYPE-STTS-CD    OF DCLACTIMF.                      CATUPLDI
           MOVE DVDND-STTS-CD        OF DCLVINITMF                      CATUPLDI
             TO DVDND-STTS-CD        OF DCLACTIMF.                      CATUPLDI
           MOVE BK-PHSC-SHR-STS-CD   OF DCLVINITMF                      CATUPLDI
             TO BK-PHSC-SHR-STS-CD   OF DCLACTIMF.                      CATUPLDI
           MOVE SECURITY-ADP-NBR     OF DCLVINITMF                      CATUPLDI
             TO SECURITY-ADP-NBR     OF DCLACTIMF.                      CATUPLDI
           MOVE FCST-ACCT-RCVR-NBR   OF DCLVINITMF                      CATUPLDI
             TO FCST-ACCT-RCVR-NBR   OF DCLACTIMF.                      CATUPLDI
                                                                        CATUPLDI
           EXEC SQL                                                     CATUPLDI
              SELECT                                                    CATUPLDI
                 ACAT_CONTROL_NBR                                       CATUPLDI
                ,TRNFR_TYPE_CD                                          CATUPLDI
                ,ASSET_SEQ_NBR                                          CATUPLDI
              INTO                                                      CATUPLDI
                 :WS-ACAT-CONTROL-NBR                                   CATUPLDI
                ,:WS-TRNFR-TYPE-CD                                      CATUPLDI
                ,:WS-ASSET-SEQ-NBR                                      CATUPLDI
              FROM                                                      CATUPLDI
                 ACTIAST                                                CATUPLDI
              WHERE                                                     CATUPLDI
                 CLIENT_NBR        = :DCLACTIMF.CLIENT-NBR        AND   CATUPLDI
                 DLVR_NBR          = :DCLACTIMF.DLVR-NBR          AND   CATUPLDI
                 RCV_NBR           = :DCLACTIMF.RCV-NBR           AND   CATUPLDI
                 ACCT_DLVR_NBR     = :DCLACTIMF.ACCT-DLVR-NBR     AND   CATUPLDI
                 ACCT_RCV_NBR      = :DCLACTIMF.ACCT-RCV-NBR      AND   CATUPLDI
                 STTLM_LCTN_CD     = :DCLACTIMF.STTLM-LCTN-CD     AND   CATUPLDI
                 ISIN_CNTRY_CD     = :DCLACTIMF.ISIN-CNTRY-CD     AND   CATUPLDI
                 ISIN_SEC_ISSUE_CD = :DCLACTIMF.ISIN-SEC-ISSUE-CD AND   CATUPLDI
                 ISIN_SEC_CDG_CD   = :DCLACTIMF.ISIN-SEC-CDG-CD   AND   CATUPLDI
ET0001*****      SECURITY_ADP_NBR  = :DCLACTIMF.SECURITY-ADP-NBR  AND   CATUPLDI
                 CSH_MGN_SHRT_CD   = :DCLACTIMF.CSH-MGN-SHRT-CD         CATUPLDI
              WITH UR                                                   CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           IF SQLCODE = +0                                              CATUPLDI
              MOVE WS-ACAT-CONTROL-NBR                                  CATUPLDI
                TO ACAT-CONTROL-NBR     OF DCLACTIMF                    CATUPLDI
              MOVE WS-TRNFR-TYPE-CD                                     CATUPLDI
                TO TRNFR-TYPE-CD        OF DCLACTIMF                    CATUPLDI
              MOVE WS-ASSET-SEQ-NBR                                     CATUPLDI
                TO ASSET-SEQ-NBR        OF DCLACTIMF                    CATUPLDI
              PERFORM 1305-INSERT-ACTIMF-RTN                            CATUPLDI
           ELSE                                                         CATUPLDI
              ADD +1 TO WS-FK-NOT-FOUND-CNT                             CATUPLDI
              MOVE SQLCODE TO W-DB2-SQLCODE                             CATUPLDI
              DISPLAY '** ACTIMF FOREIGN KEY NOT FOUND **'              CATUPLDI
              DISPLAY '   SQL-CODE=' W-DB2-SQLCODE                      CATUPLDI
              DISPLAY '   CLT=' CLIENT-NBR OF DCLACTIMF                 CATUPLDI
              DISPLAY '   DLVR-NBR=' DLVR-NBR OF DCLACTIMF              CATUPLDI
              DISPLAY '   RCV-NBR=' RCV-NBR OF DCLACTIMF                CATUPLDI
              DISPLAY '   ACCT-DLVR-NBR=' ACCT-DLVR-NBR OF DCLACTIMF    CATUPLDI
              DISPLAY '   ACCT-RCV-NBR=' ACCT-RCV-NBR OF DCLACTIMF      CATUPLDI
              DISPLAY '   ISIN-CNTRY-CD=' ISIN-CNTRY-CD OF DCLACTIMF    CATUPLDI
              DISPLAY '   ISIN-SEC-ISSUE-CD=' ISIN-SEC-ISSUE-CD         CATUPLDI
                                                       OF DCLACTIMF     CATUPLDI
              DISPLAY '   ISIN-SEC-CDG-CD=' ISIN-SEC-CDG-CD             CATUPLDI
                                                      OF DCLACTIMF      CATUPLDI
              DISPLAY '   STTLM-LCTN-CD=' STTLM-LCTN-CD OF DCLACTIMF    CATUPLDI
              DISPLAY '   CSH-MGN-SHRT-CD=' CSH-MGN-SHRT-CD             CATUPLDI
                                                      OF DCLACTIMF      CATUPLDI
              DISPLAY '   SECURITY-ADP-NBR=' SECURITY-ADP-NBR           CATUPLDI
                                                      OF DCLACTIMF      CATUPLDI
              DISPLAY ' '                                               CATUPLDI
           END-IF.                                                      CATUPLDI
                                                                        CATUPLDI
       1305-INSERT-ACTIMF-RTN.                                          CATUPLDI
           EXEC SQL                                                     CATUPLDI
               INSERT INTO ACTIMF                                       CATUPLDI
                    (                                                   CATUPLDI
                     CLIENT_NBR                                         CATUPLDI
                    ,DLVR_NBR                                           CATUPLDI
                    ,RCV_NBR                                            CATUPLDI
                    ,ACCT_DLVR_NBR                                      CATUPLDI
                    ,ACCT_RCV_NBR                                       CATUPLDI
                    ,ISIN_CNTRY_CD                                      CATUPLDI
                    ,ISIN_SEC_ISSUE_CD                                  CATUPLDI
                    ,ISIN_SEC_CDG_CD                                    CATUPLDI
                    ,STTLM_LCTN_CD                                      CATUPLDI
                    ,CSH_MGN_SHRT_CD                                    CATUPLDI
                    ,ACAT_CONTROL_NBR                                   CATUPLDI
                    ,TRNFR_TYPE_CD                                      CATUPLDI
                    ,ASSET_SEQ_NBR                                      CATUPLDI
                    ,DSTBN_SIDE_CD                                      CATUPLDI
                    ,BK_PHSCL_SHR_CD                                    CATUPLDI
                    ,PRCS_DT                                            CATUPLDI
                    ,RGSTN_CD                                           CATUPLDI
                    ,NTWRK_CNTL_CD                                      CATUPLDI
                    ,DVDND_PAYEE_CD                                     CATUPLDI
                    ,ACCT_TYPE_CD                                       CATUPLDI
                    ,LTCG_CD                                            CATUPLDI
                    ,BRKR_EXCTG_NBR                                     CATUPLDI
                    ,STCG_CD                                            CATUPLDI
                    ,DVDND_CD                                           CATUPLDI
                    ,MF_FULL_PRTL_CD                                    CATUPLDI
                    ,DVDND_PYE_STTS_CD                                  CATUPLDI
                    ,FNBR                                               CATUPLDI
                    ,BRKR_EXCTG_STTS_CD                                 CATUPLDI
                    ,MF_FUL_PRTL_STS_CD                                 CATUPLDI
                    ,CICS_TERM_ID_CD                                    CATUPLDI
                    ,PRGM_NM                                            CATUPLDI
                    ,CRT_TMSTP                                          CATUPLDI
                    ,FND_ACT_NBR_STS_CD                                 CATUPLDI
                    ,NTWRK_CNTL_STTS_CD                                 CATUPLDI
                    ,UPDT_TMSTP                                         CATUPLDI
                    ,ACCT_TYPE_STTS_CD                                  CATUPLDI
                    ,DVDND_STTS_CD                                      CATUPLDI
                    ,BK_PHSC_SHR_STS_CD                                 CATUPLDI
                    ,SECURITY_ADP_NBR                                   CATUPLDI
                    ,FCST_ACCT_RCVR_NBR                                 CATUPLDI
                    )                                                   CATUPLDI
               VALUES                                                   CATUPLDI
                    (                                                   CATUPLDI
                   :DCLACTIMF.CLIENT-NBR                                CATUPLDI
                  ,:DCLACTIMF.DLVR-NBR                                  CATUPLDI
                  ,:DCLACTIMF.RCV-NBR                                   CATUPLDI
                  ,:DCLACTIMF.ACCT-DLVR-NBR                             CATUPLDI
                  ,:DCLACTIMF.ACCT-RCV-NBR                              CATUPLDI
                  ,:DCLACTIMF.ISIN-CNTRY-CD                             CATUPLDI
                  ,:DCLACTIMF.ISIN-SEC-ISSUE-CD                         CATUPLDI
                  ,:DCLACTIMF.ISIN-SEC-CDG-CD                           CATUPLDI
                  ,:DCLACTIMF.STTLM-LCTN-CD                             CATUPLDI
                  ,:DCLACTIMF.CSH-MGN-SHRT-CD                           CATUPLDI
                  ,:DCLACTIMF.ACAT-CONTROL-NBR                          CATUPLDI
                  ,:DCLACTIMF.TRNFR-TYPE-CD                             CATUPLDI
                  ,:DCLACTIMF.ASSET-SEQ-NBR                             CATUPLDI
                  ,:DCLACTIMF.DSTBN-SIDE-CD                             CATUPLDI
                  ,:DCLACTIMF.BK-PHSCL-SHR-CD                           CATUPLDI
                  ,:DCLACTIMF.PRCS-DT                                   CATUPLDI
                  ,:DCLACTIMF.RGSTN-CD                                  CATUPLDI
                  ,:DCLACTIMF.NTWRK-CNTL-CD                             CATUPLDI
                  ,:DCLACTIMF.DVDND-PAYEE-CD                            CATUPLDI
                  ,:DCLACTIMF.ACCT-TYPE-CD                              CATUPLDI
                  ,:DCLACTIMF.LTCG-CD                                   CATUPLDI
                  ,:DCLACTIMF.BRKR-EXCTG-NBR                            CATUPLDI
                  ,:DCLACTIMF.STCG-CD                                   CATUPLDI
                  ,:DCLACTIMF.DVDND-CD                                  CATUPLDI
                  ,:DCLACTIMF.MF-FULL-PRTL-CD                           CATUPLDI
                  ,:DCLACTIMF.DVDND-PYE-STTS-CD                         CATUPLDI
                  ,:DCLACTIMF.FNBR                                      CATUPLDI
                  ,:DCLACTIMF.BRKR-EXCTG-STTS-CD                        CATUPLDI
                  ,:DCLACTIMF.MF-FUL-PRTL-STS-CD                        CATUPLDI
                  ,:DCLACTIMF.CICS-TERM-ID-CD                           CATUPLDI
                  ,:DCLACTIMF.PRGM-NM                                   CATUPLDI
                  ,:DCLACTIMF.CRT-TMSTP                                 CATUPLDI
                  ,:DCLACTIMF.FND-ACT-NBR-STS-CD                        CATUPLDI
                  ,:DCLACTIMF.NTWRK-CNTL-STTS-CD                        CATUPLDI
                  ,:DCLACTIMF.UPDT-TMSTP                                CATUPLDI
                  ,:DCLACTIMF.ACCT-TYPE-STTS-CD                         CATUPLDI
                  ,:DCLACTIMF.DVDND-STTS-CD                             CATUPLDI
                  ,:DCLACTIMF.BK-PHSC-SHR-STS-CD                        CATUPLDI
                  ,:DCLACTIMF.SECURITY-ADP-NBR                          CATUPLDI
                  ,:DCLACTIMF.FCST-ACCT-RCVR-NBR                        CATUPLDI
                    )                                                   CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           EVALUATE SQLCODE                                             CATUPLDI
              WHEN -803                                                 CATUPLDI
                 PERFORM 1310-UPDATE-ACTIMF-RTN                         CATUPLDI
              WHEN +0                                                   CATUPLDI
                    ADD 1 TO WS-ACTIMF-COUNT                            CATUPLDI
              WHEN OTHER                                                CATUPLDI
                    MOVE 1300 TO ABORT-CODE                             CATUPLDI
                    PERFORM SQL-ERROR-ROUTINE                           CATUPLDI
           END-EVALUATE.                                                CATUPLDI
                                                                        CATUPLDI
       1310-UPDATE-ACTIMF-RTN.                                          CATUPLDI
           EXEC SQL                                                     CATUPLDI
               UPDATE ACTIMF                                            CATUPLDI
                 SET                                                    CATUPLDI
                DSTBN_SIDE_CD       = :DCLACTIMF.DSTBN-SIDE-CD          CATUPLDI
               ,BK_PHSCL_SHR_CD     = :DCLACTIMF.BK-PHSCL-SHR-CD        CATUPLDI
               ,PRCS_DT             = :DCLACTIMF.PRCS-DT                CATUPLDI
               ,RGSTN_CD            = :DCLACTIMF.RGSTN-CD               CATUPLDI
               ,NTWRK_CNTL_CD       = :DCLACTIMF.NTWRK-CNTL-CD          CATUPLDI
               ,DVDND_PAYEE_CD      = :DCLACTIMF.DVDND-PAYEE-CD         CATUPLDI
               ,ACCT_TYPE_CD        = :DCLACTIMF.ACCT-TYPE-CD           CATUPLDI
               ,LTCG_CD             = :DCLACTIMF.LTCG-CD                CATUPLDI
               ,BRKR_EXCTG_NBR      = :DCLACTIMF.BRKR-EXCTG-NBR         CATUPLDI
               ,STCG_CD             = :DCLACTIMF.STCG-CD                CATUPLDI
               ,DVDND_CD            = :DCLACTIMF.DVDND-CD               CATUPLDI
               ,MF_FULL_PRTL_CD     = :DCLACTIMF.MF-FULL-PRTL-CD        CATUPLDI
               ,DVDND_PYE_STTS_CD   = :DCLACTIMF.DVDND-PYE-STTS-CD      CATUPLDI
               ,FNBR                = :DCLACTIMF.FNBR                   CATUPLDI
               ,BRKR_EXCTG_STTS_CD  = :DCLACTIMF.BRKR-EXCTG-STTS-CD     CATUPLDI
               ,MF_FUL_PRTL_STS_CD  = :DCLACTIMF.MF-FUL-PRTL-STS-CD     CATUPLDI
               ,CICS_TERM_ID_CD     = :DCLACTIMF.CICS-TERM-ID-CD        CATUPLDI
               ,PRGM_NM             = :DCLACTIMF.PRGM-NM                CATUPLDI
               ,CRT_TMSTP           = :DCLACTIMF.CRT-TMSTP              CATUPLDI
               ,FND_ACT_NBR_STS_CD  = :DCLACTIMF.FND-ACT-NBR-STS-CD     CATUPLDI
               ,NTWRK_CNTL_STTS_CD  = :DCLACTIMF.NTWRK-CNTL-STTS-CD     CATUPLDI
               ,UPDT_TMSTP          = :DCLACTIMF.UPDT-TMSTP             CATUPLDI
               ,ACCT_TYPE_STTS_CD   = :DCLACTIMF.ACCT-TYPE-STTS-CD      CATUPLDI
               ,DVDND_STTS_CD       = :DCLACTIMF.DVDND-STTS-CD          CATUPLDI
               ,BK_PHSC_SHR_STS_CD  = :DCLACTIMF.BK-PHSC-SHR-STS-CD     CATUPLDI
               ,SECURITY_ADP_NBR    = :DCLACTIMF.SECURITY-ADP-NBR       CATUPLDI
               ,FCST_ACCT_RCVR_NBR  = :DCLACTIMF.FCST-ACCT-RCVR-NBR     CATUPLDI
              WHERE                                                     CATUPLDI
                  (CLIENT_NBR        = :DCLACTIMF.CLIENT-NBR        AND CATUPLDI
                   DLVR_NBR          = :DCLACTIMF.DLVR-NBR          AND CATUPLDI
                   ACCT_DLVR_NBR     = :DCLACTIMF.ACCT-DLVR-NBR     AND CATUPLDI
                   RCV_NBR           = :DCLACTIMF.RCV-NBR           AND CATUPLDI
                   ACCT_RCV_NBR      = :DCLACTIMF.ACCT-RCV-NBR      AND CATUPLDI
                   ISIN_CNTRY_CD     = :DCLACTIMF.ISIN-CNTRY-CD     AND CATUPLDI
                   ISIN_SEC_ISSUE_CD = :DCLACTIMF.ISIN-SEC-ISSUE-CD AND CATUPLDI
                   ISIN_SEC_CDG_CD   = :DCLACTIMF.ISIN-SEC-CDG-CD   AND CATUPLDI
                   STTLM_LCTN_CD     = :DCLACTIMF.STTLM-LCTN-CD     AND CATUPLDI
                   CSH_MGN_SHRT_CD   = :DCLACTIMF.CSH-MGN-SHRT-CD   AND CATUPLDI
                   ACAT_CONTROL_NBR  = :DCLACTIMF.ACAT-CONTROL-NBR  AND CATUPLDI
                   TRNFR_TYPE_CD     = :DCLACTIMF.TRNFR-TYPE-CD     AND CATUPLDI
                   ASSET_SEQ_NBR     = :DCLACTIMF.ASSET-SEQ-NBR         CATUPLDI
                   )                                                    CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           EVALUATE SQLCODE                                             CATUPLDI
              WHEN +0                                                   CATUPLDI
                    ADD 1 TO WS-ACTIMF-COUNT-REPL                       CATUPLDI
              WHEN OTHER                                                CATUPLDI
                    MOVE 1310 TO ABORT-CODE                             CATUPLDI
                    PERFORM SQL-ERROR-ROUTINE                           CATUPLDI
           END-EVALUATE.                                                CATUPLDI
                                                                        CATUPLDI
       1400-CREATE-INITIAL-OPN-RTN.                                     CATUPLDI
                                                                        CATUPLDI
           MOVE RECORD-DETAIL TO DCLVINITOPN.                           CATUPLDI
                                                                        CATUPLDI
           MOVE CLIENT-NBR           OF DCLVINITOPN                     CATUPLDI
             TO CLIENT-NBR           OF DCLACTIOPN.                     CATUPLDI
           MOVE RCV-NBR              OF DCLVINITOPN                     CATUPLDI
             TO RCV-NBR              OF DCLACTIOPN.                     CATUPLDI
           MOVE ACCT-DLVR-NBR        OF DCLVINITOPN                     CATUPLDI
             TO ACCT-DLVR-NBR        OF DCLACTIOPN.                     CATUPLDI
           MOVE ACCT-RCV-NBR         OF DCLVINITOPN                     CATUPLDI
             TO ACCT-RCV-NBR         OF DCLACTIOPN.                     CATUPLDI
           MOVE DLVR-NBR             OF DCLVINITOPN                     CATUPLDI
             TO DLVR-NBR             OF DCLACTIOPN.                     CATUPLDI
           MOVE STTLM-LCTN-CD        OF DCLVINITOPN                     CATUPLDI
             TO STTLM-LCTN-CD        OF DCLACTIOPN.                     CATUPLDI
           MOVE ISIN-CNTRY-CD        OF DCLVINITOPN                     CATUPLDI
             TO ISIN-CNTRY-CD        OF DCLACTIOPN.                     CATUPLDI
           MOVE ISIN-SEC-ISSUE-CD    OF DCLVINITOPN                     CATUPLDI
             TO ISIN-SEC-ISSUE-CD    OF DCLACTIOPN.                     CATUPLDI
           MOVE ISIN-SEC-CDG-CD      OF DCLVINITOPN                     CATUPLDI
             TO ISIN-SEC-CDG-CD      OF DCLACTIOPN.                     CATUPLDI
           MOVE CSH-MGN-SHRT-CD      OF DCLVINITOPN                     CATUPLDI
             TO CSH-MGN-SHRT-CD      OF DCLACTIOPN.                     CATUPLDI
           MOVE BS-CD                OF DCLVINITOPN                     CATUPLDI
             TO BS-CD                OF DCLACTIOPN.                     CATUPLDI
           MOVE PTCL-CD              OF DCLVINITOPN                     CATUPLDI
             TO PTCL-CD              OF DCLACTIOPN.                     CATUPLDI
           MOVE OPTN-OPN-CLSD-CD     OF DCLVINITOPN                     CATUPLDI
             TO OPTN-OPN-CLSD-CD     OF DCLACTIOPN.                     CATUPLDI
           MOVE SYM-CD               OF DCLVINITOPN                     CATUPLDI
             TO SYM-CD               OF DCLACTIOPN.                     CATUPLDI
           MOVE EXPTN-DT             OF DCLVINITOPN                     CATUPLDI
             TO EXPTN-DT             OF DCLACTIOPN.                     CATUPLDI
           MOVE STPRC-INTEGER-AMT    OF DCLVINITOPN                     CATUPLDI
             TO STPRC-INTEGER-AMT    OF DCLACTIOPN.                     CATUPLDI
           MOVE STPRC-FRCTN-AMT      OF DCLVINITOPN                     CATUPLDI
             TO STPRC-FRCTN-AMT      OF DCLACTIOPN.                     CATUPLDI
           MOVE DLVR-OCC-NBR         OF DCLVINITOPN                     CATUPLDI
             TO DLVR-OCC-NBR         OF DCLACTIOPN.                     CATUPLDI
           MOVE OPTN-ACCT-TYPE-CD    OF DCLVINITOPN                     CATUPLDI
             TO OPTN-ACCT-TYPE-CD    OF DCLACTIOPN.                     CATUPLDI
           MOVE ACCT-SUB-CD          OF DCLVINITOPN                     CATUPLDI
             TO ACCT-SUB-CD          OF DCLACTIOPN.                     CATUPLDI
           MOVE OPTN-CMNT-TXT        OF DCLVINITOPN                     CATUPLDI
             TO OPTN-CMNT-TXT        OF DCLACTIOPN.                     CATUPLDI
           MOVE NSCC-ACK-IND         OF DCLVINITOPN                     CATUPLDI
             TO NSCC-ACK-IND         OF DCLACTIOPN.                     CATUPLDI
           MOVE NSCC-PEND-CD         OF DCLVINITOPN                     CATUPLDI
             TO NSCC-PEND-CD         OF DCLACTIOPN.                     CATUPLDI
           MOVE CICS-TERM-ID-CD      OF DCLVINITOPN                     CATUPLDI
             TO CICS-TERM-ID-CD      OF DCLACTIOPN.                     CATUPLDI
           MOVE PRGM-NM              OF DCLVINITOPN                     CATUPLDI
             TO PRGM-NM              OF DCLACTIOPN.                     CATUPLDI
           MOVE CRT-TMSTP            OF DCLVINITOPN                     CATUPLDI
             TO CRT-TMSTP            OF DCLACTIOPN.                     CATUPLDI
           MOVE UPDT-TMSTP           OF DCLVINITOPN                     CATUPLDI
             TO UPDT-TMSTP           OF DCLACTIOPN.                     CATUPLDI
           MOVE BS-STTS-CD           OF DCLVINITOPN                     CATUPLDI
             TO BS-STTS-CD           OF DCLACTIOPN.                     CATUPLDI
           MOVE PTCL-STTS-CD         OF DCLVINITOPN                     CATUPLDI
             TO PTCL-STTS-CD         OF DCLACTIOPN.                     CATUPLDI
           MOVE OPT-OPN-CLS-TST-CD   OF DCLVINITOPN                     CATUPLDI
             TO OPT-OPN-CLS-TST-CD   OF DCLACTIOPN.                     CATUPLDI
           MOVE SYM-STTS-CD          OF DCLVINITOPN                     CATUPLDI
             TO SYM-STTS-CD          OF DCLACTIOPN.                     CATUPLDI
           MOVE OPTN-EXPTN-DT-CD     OF DCLVINITOPN                     CATUPLDI
             TO OPTN-EXPTN-DT-CD     OF DCLACTIOPN.                     CATUPLDI
           MOVE STPRC-INTR-STTS-CD   OF DCLVINITOPN                     CATUPLDI
             TO STPRC-INTR-STTS-CD   OF DCLACTIOPN.                     CATUPLDI
           MOVE STPRC-FRCT-STTS-CD   OF DCLVINITOPN                     CATUPLDI
             TO STPRC-FRCT-STTS-CD   OF DCLACTIOPN.                     CATUPLDI
           MOVE OPT-OCC-DLV-STS-CD   OF DCLVINITOPN                     CATUPLDI
             TO OPT-OCC-DLV-STS-CD   OF DCLACTIOPN.                     CATUPLDI
           MOVE OPT-ACT-TYP-STS-CD   OF DCLVINITOPN                     CATUPLDI
             TO OPT-ACT-TYP-STS-CD   OF DCLACTIOPN.                     CATUPLDI
           MOVE OPTN-CMNT-CD         OF DCLVINITOPN                     CATUPLDI
             TO OPTN-CMNT-CD         OF DCLACTIOPN.                     CATUPLDI
           MOVE ACCT-SUB-STTS-CD     OF DCLVINITOPN                     CATUPLDI
             TO ACCT-SUB-STTS-CD     OF DCLACTIOPN.                     CATUPLDI
           MOVE SECURITY-ADP-NBR     OF DCLVINITOPN                     CATUPLDI
             TO SECURITY-ADP-NBR     OF DCLACTIOPN.                     CATUPLDI
                                                                        CATUPLDI
           EXEC SQL                                                     CATUPLDI
              SELECT                                                    CATUPLDI
                 ACAT_CONTROL_NBR                                       CATUPLDI
                ,TRNFR_TYPE_CD                                          CATUPLDI
                ,ASSET_SEQ_NBR                                          CATUPLDI
              INTO                                                      CATUPLDI
                 :WS-ACAT-CONTROL-NBR                                   CATUPLDI
                ,:WS-TRNFR-TYPE-CD                                      CATUPLDI
                ,:WS-ASSET-SEQ-NBR                                      CATUPLDI
              FROM                                                      CATUPLDI
                 ACTIAST                                                CATUPLDI
              WHERE                                                     CATUPLDI
                 CLIENT_NBR        = :DCLACTIOPN.CLIENT-NBR        AND  CATUPLDI
                 DLVR_NBR          = :DCLACTIOPN.DLVR-NBR          AND  CATUPLDI
                 RCV_NBR           = :DCLACTIOPN.RCV-NBR           AND  CATUPLDI
                 ACCT_DLVR_NBR     = :DCLACTIOPN.ACCT-DLVR-NBR     AND  CATUPLDI
                 ACCT_RCV_NBR      = :DCLACTIOPN.ACCT-RCV-NBR      AND  CATUPLDI
                 STTLM_LCTN_CD     = :DCLACTIOPN.STTLM-LCTN-CD     AND  CATUPLDI
                 ISIN_CNTRY_CD     = :DCLACTIOPN.ISIN-CNTRY-CD     AND  CATUPLDI
                 ISIN_SEC_ISSUE_CD = :DCLACTIOPN.ISIN-SEC-ISSUE-CD AND  CATUPLDI
                 ISIN_SEC_CDG_CD   = :DCLACTIOPN.ISIN-SEC-CDG-CD   AND  CATUPLDI
ET0001*****      SECURITY_ADP_NBR  = :DCLACTIOPN.SECURITY-ADP-NBR  AND  CATUPLDI
                 CSH_MGN_SHRT_CD   = :DCLACTIOPN.CSH-MGN-SHRT-CD        CATUPLDI
              WITH UR                                                   CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           IF SQLCODE = +0                                              CATUPLDI
              MOVE WS-ACAT-CONTROL-NBR                                  CATUPLDI
                TO ACAT-CONTROL-NBR     OF DCLACTIOPN                   CATUPLDI
              MOVE WS-TRNFR-TYPE-CD                                     CATUPLDI
                TO TRNFR-TYPE-CD        OF DCLACTIOPN                   CATUPLDI
              MOVE WS-ASSET-SEQ-NBR                                     CATUPLDI
                TO ASSET-SEQ-NBR        OF DCLACTIOPN                   CATUPLDI
              PERFORM 1405-INSERT-ACTIOPN-RTN                           CATUPLDI
           ELSE                                                         CATUPLDI
              ADD +1 TO WS-FK-NOT-FOUND-CNT                             CATUPLDI
              MOVE SQLCODE TO W-DB2-SQLCODE                             CATUPLDI
              DISPLAY '** ACTIOPN FOREIGN KEY NOT FOUND **'             CATUPLDI
              DISPLAY '   SQL-CODE=' W-DB2-SQLCODE                      CATUPLDI
              DISPLAY '   CLT=' CLIENT-NBR OF DCLACTIOPN                CATUPLDI
              DISPLAY '   DLVR-NBR = ' DLVR-NBR OF DCLACTIOPN           CATUPLDI
              DISPLAY '   RCV-NBR = ' RCV-NBR OF DCLACTIOPN             CATUPLDI
              DISPLAY '   ACCT-DLVR-NBR=' ACCT-DLVR-NBR                 CATUPLDI
                                                   OF DCLACTIOPN        CATUPLDI
              DISPLAY '   ACCT-RCV-NBR=' ACCT-RCV-NBR OF DCLACTIOPN     CATUPLDI
              DISPLAY '   ISIN-CNTRY-CD=' ISIN-CNTRY-CD                 CATUPLDI
                                                    OF DCLACTIOPN       CATUPLDI
              DISPLAY '   ISIN-SEC-ISSUE-CD=' ISIN-SEC-ISSUE-CD         CATUPLDI
                                                      OF DCLACTIOPN     CATUPLDI
              DISPLAY '   ISIN-SEC-CDG-CD=' ISIN-SEC-CDG-CD             CATUPLDI
                                                      OF DCLACTIOPN     CATUPLDI
              DISPLAY '   STTLM-LCTN-CD=' STTLM-LCTN-CD                 CATUPLDI
                                                     OF DCLACTIOPN      CATUPLDI
              DISPLAY '   CSH-MGN-SHRT-CD=' CSH-MGN-SHRT-CD             CATUPLDI
                                                     OF DCLACTIOPN      CATUPLDI
              DISPLAY '   SECURITY-ADP-NBR=' SECURITY-ADP-NBR           CATUPLDI
                                                     OF DCLACTIOPN      CATUPLDI
              DISPLAY ' '                                               CATUPLDI
           END-IF.                                                      CATUPLDI
                                                                        CATUPLDI
       1405-INSERT-ACTIOPN-RTN.                                         CATUPLDI
           EXEC SQL                                                     CATUPLDI
               INSERT INTO ACTIOPN                                      CATUPLDI
                    (                                                   CATUPLDI
                     CLIENT_NBR                                         CATUPLDI
                    ,RCV_NBR                                            CATUPLDI
                    ,ACCT_DLVR_NBR                                      CATUPLDI
                    ,ACCT_RCV_NBR                                       CATUPLDI
                    ,DLVR_NBR                                           CATUPLDI
                    ,STTLM_LCTN_CD                                      CATUPLDI
                    ,ISIN_CNTRY_CD                                      CATUPLDI
                    ,ISIN_SEC_ISSUE_CD                                  CATUPLDI
                    ,ISIN_SEC_CDG_CD                                    CATUPLDI
                    ,CSH_MGN_SHRT_CD                                    CATUPLDI
                    ,ACAT_CONTROL_NBR                                   CATUPLDI
                    ,TRNFR_TYPE_CD                                      CATUPLDI
                    ,ASSET_SEQ_NBR                                      CATUPLDI
                    ,BS_CD                                              CATUPLDI
                    ,PTCL_CD                                            CATUPLDI
                    ,OPTN_OPN_CLSD_CD                                   CATUPLDI
                    ,SYM_CD                                             CATUPLDI
                    ,EXPTN_DT                                           CATUPLDI
                    ,STPRC_INTEGER_AMT                                  CATUPLDI
                    ,STPRC_FRCTN_AMT                                    CATUPLDI
                    ,DLVR_OCC_NBR                                       CATUPLDI
                    ,OPTN_ACCT_TYPE_CD                                  CATUPLDI
                    ,ACCT_SUB_CD                                        CATUPLDI
                    ,OPTN_CMNT_TXT                                      CATUPLDI
                    ,NSCC_ACK_IND                                       CATUPLDI
                    ,NSCC_PEND_CD                                       CATUPLDI
                    ,CICS_TERM_ID_CD                                    CATUPLDI
                    ,PRGM_NM                                            CATUPLDI
                    ,CRT_TMSTP                                          CATUPLDI
                    ,UPDT_TMSTP                                         CATUPLDI
                    ,BS_STTS_CD                                         CATUPLDI
                    ,PTCL_STTS_CD                                       CATUPLDI
                    ,OPT_OPN_CLS_TST_CD                                 CATUPLDI
                    ,SYM_STTS_CD                                        CATUPLDI
                    ,OPTN_EXPTN_DT_CD                                   CATUPLDI
                    ,STPRC_INTR_STTS_CD                                 CATUPLDI
                    ,STPRC_FRCT_STTS_CD                                 CATUPLDI
                    ,OPT_OCC_DLV_STS_CD                                 CATUPLDI
                    ,OPT_ACT_TYP_STS_CD                                 CATUPLDI
                    ,OPTN_CMNT_CD                                       CATUPLDI
                    ,ACCT_SUB_STTS_CD                                   CATUPLDI
                    ,SECURITY_ADP_NBR                                   CATUPLDI
                    )                                                   CATUPLDI
               VALUES                                                   CATUPLDI
                    (                                                   CATUPLDI
                   :DCLACTIOPN.CLIENT-NBR                               CATUPLDI
                  ,:DCLACTIOPN.RCV-NBR                                  CATUPLDI
                  ,:DCLACTIOPN.ACCT-DLVR-NBR                            CATUPLDI
                  ,:DCLACTIOPN.ACCT-RCV-NBR                             CATUPLDI
                  ,:DCLACTIOPN.DLVR-NBR                                 CATUPLDI
                  ,:DCLACTIOPN.STTLM-LCTN-CD                            CATUPLDI
                  ,:DCLACTIOPN.ISIN-CNTRY-CD                            CATUPLDI
                  ,:DCLACTIOPN.ISIN-SEC-ISSUE-CD                        CATUPLDI
                  ,:DCLACTIOPN.ISIN-SEC-CDG-CD                          CATUPLDI
                  ,:DCLACTIOPN.CSH-MGN-SHRT-CD                          CATUPLDI
                  ,:DCLACTIOPN.ACAT-CONTROL-NBR                         CATUPLDI
                  ,:DCLACTIOPN.TRNFR-TYPE-CD                            CATUPLDI
                  ,:DCLACTIOPN.ASSET-SEQ-NBR                            CATUPLDI
                  ,:DCLACTIOPN.BS-CD                                    CATUPLDI
                  ,:DCLACTIOPN.PTCL-CD                                  CATUPLDI
                  ,:DCLACTIOPN.OPTN-OPN-CLSD-CD                         CATUPLDI
                  ,:DCLACTIOPN.SYM-CD                                   CATUPLDI
                  ,:DCLACTIOPN.EXPTN-DT                                 CATUPLDI
                  ,:DCLACTIOPN.STPRC-INTEGER-AMT                        CATUPLDI
                  ,:DCLACTIOPN.STPRC-FRCTN-AMT                          CATUPLDI
                  ,:DCLACTIOPN.DLVR-OCC-NBR                             CATUPLDI
                  ,:DCLACTIOPN.OPTN-ACCT-TYPE-CD                        CATUPLDI
                  ,:DCLACTIOPN.ACCT-SUB-CD                              CATUPLDI
                  ,:DCLACTIOPN.OPTN-CMNT-TXT                            CATUPLDI
                  ,:DCLACTIOPN.NSCC-ACK-IND                             CATUPLDI
                  ,:DCLACTIOPN.NSCC-PEND-CD                             CATUPLDI
                  ,:DCLACTIOPN.CICS-TERM-ID-CD                          CATUPLDI
                  ,:DCLACTIOPN.PRGM-NM                                  CATUPLDI
                  ,:DCLACTIOPN.CRT-TMSTP                                CATUPLDI
                  ,:DCLACTIOPN.UPDT-TMSTP                               CATUPLDI
                  ,:DCLACTIOPN.BS-STTS-CD                               CATUPLDI
                  ,:DCLACTIOPN.PTCL-STTS-CD                             CATUPLDI
                  ,:DCLACTIOPN.OPT-OPN-CLS-TST-CD                       CATUPLDI
                  ,:DCLACTIOPN.SYM-STTS-CD                              CATUPLDI
                  ,:DCLACTIOPN.OPTN-EXPTN-DT-CD                         CATUPLDI
                  ,:DCLACTIOPN.STPRC-INTR-STTS-CD                       CATUPLDI
                  ,:DCLACTIOPN.STPRC-FRCT-STTS-CD                       CATUPLDI
                  ,:DCLACTIOPN.OPT-OCC-DLV-STS-CD                       CATUPLDI
                  ,:DCLACTIOPN.OPT-ACT-TYP-STS-CD                       CATUPLDI
                  ,:DCLACTIOPN.OPTN-CMNT-CD                             CATUPLDI
                  ,:DCLACTIOPN.ACCT-SUB-STTS-CD                         CATUPLDI
                  ,:DCLACTIOPN.SECURITY-ADP-NBR                         CATUPLDI
                    )                                                   CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           EVALUATE SQLCODE                                             CATUPLDI
              WHEN -803                                                 CATUPLDI
                 PERFORM 1410-UPDATE-ACTIOPN-RTN                        CATUPLDI
              WHEN +0                                                   CATUPLDI
                    ADD 1 TO WS-ACTIOPN-COUNT                           CATUPLDI
              WHEN OTHER                                                CATUPLDI
                    MOVE 1400 TO ABORT-CODE                             CATUPLDI
                    PERFORM SQL-ERROR-ROUTINE                           CATUPLDI
           END-EVALUATE.                                                CATUPLDI
                                                                        CATUPLDI
       1410-UPDATE-ACTIOPN-RTN.                                         CATUPLDI
           EXEC SQL                                                     CATUPLDI
               UPDATE ACTIOPN                                           CATUPLDI
                 SET                                                    CATUPLDI
                BS_CD                = :DCLACTIOPN.BS-CD                CATUPLDI
               ,PTCL_CD              = :DCLACTIOPN.PTCL-CD              CATUPLDI
               ,OPTN_OPN_CLSD_CD     = :DCLACTIOPN.OPTN-OPN-CLSD-CD     CATUPLDI
               ,SYM_CD               = :DCLACTIOPN.SYM-CD               CATUPLDI
               ,EXPTN_DT             = :DCLACTIOPN.EXPTN-DT             CATUPLDI
               ,STPRC_INTEGER_AMT    = :DCLACTIOPN.STPRC-INTEGER-AMT    CATUPLDI
               ,STPRC_FRCTN_AMT      = :DCLACTIOPN.STPRC-FRCTN-AMT      CATUPLDI
               ,DLVR_OCC_NBR         = :DCLACTIOPN.DLVR-OCC-NBR         CATUPLDI
               ,OPTN_ACCT_TYPE_CD    = :DCLACTIOPN.OPTN-ACCT-TYPE-CD    CATUPLDI
               ,ACCT_SUB_CD          = :DCLACTIOPN.ACCT-SUB-CD          CATUPLDI
               ,OPTN_CMNT_TXT        = :DCLACTIOPN.OPTN-CMNT-TXT        CATUPLDI
               ,NSCC_ACK_IND         = :DCLACTIOPN.NSCC-ACK-IND         CATUPLDI
               ,NSCC_PEND_CD         = :DCLACTIOPN.NSCC-PEND-CD         CATUPLDI
               ,CICS_TERM_ID_CD      = :DCLACTIOPN.CICS-TERM-ID-CD      CATUPLDI
               ,PRGM_NM              = :DCLACTIOPN.PRGM-NM              CATUPLDI
               ,CRT_TMSTP            = :DCLACTIOPN.CRT-TMSTP            CATUPLDI
               ,UPDT_TMSTP           = :DCLACTIOPN.UPDT-TMSTP           CATUPLDI
               ,BS_STTS_CD           = :DCLACTIOPN.BS-STTS-CD           CATUPLDI
               ,PTCL_STTS_CD         = :DCLACTIOPN.PTCL-STTS-CD         CATUPLDI
               ,OPT_OPN_CLS_TST_CD   = :DCLACTIOPN.OPT-OPN-CLS-TST-CD   CATUPLDI
               ,SYM_STTS_CD          = :DCLACTIOPN.SYM-STTS-CD          CATUPLDI
               ,OPTN_EXPTN_DT_CD     = :DCLACTIOPN.OPTN-EXPTN-DT-CD     CATUPLDI
               ,STPRC_INTR_STTS_CD   = :DCLACTIOPN.STPRC-INTR-STTS-CD   CATUPLDI
               ,STPRC_FRCT_STTS_CD   = :DCLACTIOPN.STPRC-FRCT-STTS-CD   CATUPLDI
               ,OPT_OCC_DLV_STS_CD   = :DCLACTIOPN.OPT-OCC-DLV-STS-CD   CATUPLDI
               ,OPT_ACT_TYP_STS_CD   = :DCLACTIOPN.OPT-ACT-TYP-STS-CD   CATUPLDI
               ,OPTN_CMNT_CD         = :DCLACTIOPN.OPTN-CMNT-CD         CATUPLDI
               ,ACCT_SUB_STTS_CD     = :DCLACTIOPN.ACCT-SUB-STTS-CD     CATUPLDI
               ,SECURITY_ADP_NBR     = :DCLACTIOPN.SECURITY-ADP-NBR     CATUPLDI
             WHERE                                                      CATUPLDI
                 (CLIENT_NBR        = :DCLACTIOPN.CLIENT-NBR        AND CATUPLDI
                  DLVR_NBR          = :DCLACTIOPN.DLVR-NBR          AND CATUPLDI
                  ACCT_DLVR_NBR     = :DCLACTIOPN.ACCT-DLVR-NBR     AND CATUPLDI
                  RCV_NBR           = :DCLACTIOPN.RCV-NBR           AND CATUPLDI
                  ACCT_RCV_NBR      = :DCLACTIOPN.ACCT-RCV-NBR      AND CATUPLDI
                  ISIN_CNTRY_CD     = :DCLACTIOPN.ISIN-CNTRY-CD     AND CATUPLDI
                  ISIN_SEC_ISSUE_CD = :DCLACTIOPN.ISIN-SEC-ISSUE-CD AND CATUPLDI
                  ISIN_SEC_CDG_CD   = :DCLACTIOPN.ISIN-SEC-CDG-CD   AND CATUPLDI
                  STTLM_LCTN_CD     = :DCLACTIOPN.STTLM-LCTN-CD     AND CATUPLDI
                  CSH_MGN_SHRT_CD   = :DCLACTIOPN.CSH-MGN-SHRT-CD   AND CATUPLDI
                  ACAT_CONTROL_NBR  = :DCLACTIOPN.ACAT-CONTROL-NBR  AND CATUPLDI
                  TRNFR_TYPE_CD     = :DCLACTIOPN.TRNFR-TYPE-CD     AND CATUPLDI
                  ASSET_SEQ_NBR     = :DCLACTIOPN.ASSET-SEQ-NBR         CATUPLDI
                  )                                                     CATUPLDI
           END-EXEC.                                                    CATUPLDI
                                                                        CATUPLDI
           EVALUATE SQLCODE                                             CATUPLDI
              WHEN +0                                                   CATUPLDI
                    ADD 1 TO WS-ACTIOPN-COUNT-REPL                      CATUPLDI
              WHEN OTHER                                                CATUPLDI
                    MOVE 1410 TO ABORT-CODE                             CATUPLDI
                    PERFORM SQL-ERROR-ROUTINE                           CATUPLDI
           END-EVALUATE.                                                CATUPLDI
                                                                        CATUPLDI
           EJECT                                                        CATUPLDI
                                                                        CATUPLDI
       8100-SQL-COMMIT.                                                 CATUPLDI
                                                                        CATUPLDI
           EXEC SQL COMMIT                                              CATUPLDI
           END-EXEC                                                     CATUPLDI
                                                                        CATUPLDI
           EVALUATE SQLCODE                                             CATUPLDI
              WHEN +0                                                   CATUPLDI
                 MOVE ZERO TO W-COMMIT-CTR                              CATUPLDI
                 ADD +1 TO WS-COMMITS-PERFORMED                         CATUPLDI
              WHEN OTHER                                                CATUPLDI
                    MOVE 8100 TO ABORT-CODE                             CATUPLDI
                    PERFORM SQL-ERROR-ROUTINE                           CATUPLDI
           END-EVALUATE.                                                CATUPLDI
                                                                        CATUPLDI
           EJECT                                                        CATUPLDI
      *============================                                     CATUPLDI
       SQL-ERROR-ROUTINE.                                               CATUPLDI
      *============================                                     CATUPLDI
                                                                        CATUPLDI
           CALL DSNTIAR USING SQLCA WS-DB2-MESSAGE-AREA                 CATUPLDI
                                    WS-ERR-LINE-LEN.                    CATUPLDI
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   CATUPLDI
             UNTIL WS-ERROR-INDEX GREATER THAN 12                       CATUPLDI
                   IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES            CATUPLDI
                      DISPLAY WS-ERROR-MSG (WS-ERROR-INDEX)             CATUPLDI
                   END-IF                                               CATUPLDI
           END-PERFORM.                                                 CATUPLDI
                                                                        CATUPLDI
           DISPLAY 'CATUPLD DB2 PROBLEM'.                               CATUPLDI
           DISPLAY 'SQL CODE = ' SQLCODE.                               CATUPLDI
           DISPLAY 'SQLQA = ' SQLCA.                                    CATUPLDI
           DISPLAY 'PROGRAM ABORTED'.                                   CATUPLDI
                                                                        CATUPLDI
           EXEC SQL  ROLLBACK  END-EXEC.                                CATUPLDI
                                                                        CATUPLDI
           PERFORM 9999-ABEND.                                          CATUPLDI
       9999-ABEND.                                                      CATUPLDI
           CALL  ABEND  USING ABORT-CODE.                               CATUPLDI
