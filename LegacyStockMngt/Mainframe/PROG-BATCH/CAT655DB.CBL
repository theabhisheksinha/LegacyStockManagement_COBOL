000001* PDX    - CAT655DB C0266889 12/01/08 14:07:08 TBLAMUR            00001036
       IDENTIFICATION DIVISION.                                         00090000
       PROGRAM-ID.  CAT655DB.                                           00100000
                                                                        00130000
      *---------------------------------------------------------------- 00140000
      * THE PURPOSE OF THIS PROGRAM IS TO INSERT TI RECORD              00150000
      * IN CAT660.ACATPEND FOR CAGE RUN FOR EACH ASSET                  00160000
      * TI REQUIRED FOR CAGE FAIL FILE .                                00170000
      *---------------------------------------------------------------- 00310000
           EJECT                                                        00550000
      ***************************************************************** 00560000
       ENVIRONMENT DIVISION.                                            00570000
      ***************************************************************** 00580000
       INPUT-OUTPUT SECTION.                                            00590000
       FILE-CONTROL.                                                    00600000
                                                                        00610000
           SELECT PENDING-FILE-IN               ASSIGN  TO  PENDIN.     00620000
           SELECT PENDING-FILE-OUT              ASSIGN  TO  PENDOUT.    00621007
                                                                        00630000
      ***************************************************************** 00640000
       DATA DIVISION.                                                   00650000
      ***************************************************************** 00660000
                                                                        00670000
       FILE SECTION.                                                    00680000
                                                                        00690000
       FD  PENDING-FILE-IN                                              00700000
           RECORDING MODE IS V                                          00710000
           BLOCK CONTAINS 0 RECORDS.                                    00720000
       COPY ACATPEND  REPLACING ==:FMT:== BY ==PEND==.                  00730000
                                                                        00740000
                                                                        00741000
       FD  PENDING-FILE-OUT                                             00742000
           RECORDING MODE IS V                                          00743000
           BLOCK CONTAINS 0 RECORDS.                                    00744000
       COPY ACATPEND  REPLACING ==:FMT:== BY ==OPEND==.                 00745000
                                                                        00746000
           EJECT                                                        00750000
      ******************************************************************00760000
       WORKING-STORAGE SECTION.                                         00770000
      ******************************************************************00780000
                                                                        00790000
       77  ABEND-CODE              COMP  PIC S9(4)   VALUE +9999.       00800000
       77  WS-DATE                          PIC X(10).                  00801001
       77  WS-DATE-8                        PIC X(08).                  00802001
                                                                        00810000
           COPY STUBCPY.                                                01090000
                                                                        01160000
           COPY BPDATESC.                                               01360000
                                                                        01370000
           COPY RECDATZC.                                               01390000
                                                                        01410001
       01  END-OF-PEND                      PIC X(01)  VALUE 'N'.       01420001
           88  END-OF-PEND-FILE                        VALUE 'Y'.       01430001
                                                                        01800000
       01  WOER-AREA-GEN.                                               01810016
           03  WS-CLIENT                PIC X(04) VALUE '0000'.         01810116
           03  WS-CNT-READ              PIC 9(07) VALUE 0.              01810228
           03  WS-CNT-FOUND             PIC 9(07) VALUE 0.              01810328
           03  WS-CNT-NOT               PIC 9(07) VALUE 0.              01810428
                                                                        01812012
       01  WS-DB2-MESSAGE-AREA.                                         01820000
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.    01830000
           05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES     01831000
               INDEXED BY WS-ERROR-INDEX.                               01832000
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.     01833000
                                                                        01834000
       COPY ACATPEND  REPLACING ==:FMT:== BY ==FMT==.                   02000000
           EJECT                                                        02010000
      *DB2 COMMUNICATION AREA                                           02020000
           EXEC SQL                                                     02030000
              INCLUDE SQLCA                                             02040000
           END-EXEC.                                                    02050000
                                                                        02070005
           EXEC SQL                                                     02080000
              INCLUDE VTRNFR                                            02090000
           END-EXEC.                                                    02100000
                                                                        02110000
           EXEC SQL                                                     02350000
              INCLUDE VTRNHSTY                                          02360000
           END-EXEC.                                                    02370000
                                                                        02380000
      ***************************************************************** 04370000
       PROCEDURE DIVISION.                                              04380001
      ***************************************************************** 04390000
           COPY MSGCOBO.                                                04420000
           OPEN INPUT  PENDING-FILE-IN                                  04430001
                OUTPUT PENDING-FILE-OUT.                                04440001
                                                                        04450000
           PERFORM READ-PENDING-FILE.                                   04451001
           IF  PEND-HEADER-ID AND NOT END-OF-PEND-FILE                  04451126
             WRITE OPEND-HEADER-RECORD FROM PEND-HEADER-RECORD          04451226
             PERFORM READ-PENDING-FILE                                  04451326
           END-IF.                                                      04451426
                                                                        04452001
           PERFORM PROCESS-RTN     THRU PROCESS-RTN-EXIT                04460007
                UNTIL END-OF-PEND-FILE.                                 04470001
                                                                        04470101
           CLOSE      PENDING-FILE-IN                                   04471001
                      PENDING-FILE-OUT.                                 04472001
                                                                        04473001
           DISPLAY ' TOTAL READ ' WS-CNT-READ.                          04474026
           DISPLAY '    FOUND   ' WS-CNT-FOUND.                         04475026
           DISPLAY '   NOT FND  ' WS-CNT-NOT.                           04476026
           GOBACK.                                                      04500000
                                                                        04510000
       READ-PENDING-FILE.                                               04511001
                                                                        04520001
           READ PENDING-FILE-IN   INTO FMT-AT-RECORD                    04521007
               AT END                                                   04522001
                 SET END-OF-PEND-FILE TO TRUE                           04523001
                                                                        04524026
           END-READ.                                                    04529201
                                                                        04529301
       PROCESS-RTN.                                                     04530001
                                                                        04540000
           MOVE FMT-AT-ADP-CL-NO    TO WS-CLIENT (2 :)                  04540116
           ADD   1      TO WS-CNT-READ.                                 04540226
                                                                        04540312
           INITIALIZE DCLVTRNFR.                                        04541001
           EXEC SQL                                                     04550001
               SELECT                                                   04560001
                    CLIENT_NBR,                                         04570001
                    ACAT_CONTROL_NBR,                                   04580001
                    RCV_NBR,                                            04590001
                    ACCT_RCV_NBR,                                       04600001
                    DLVR_NBR,                                           04610001
                    ACCT_DLVR_NBR,                                      04620001
                    STTS_CD,                                            04630001
                    DAYS_STTS_QTY,                                      04640001
                    TRNFR_TYPE_CD,                                      04650001
                    DSTBN_SIDE_CD,                                      04660001
                    SBMTG_PRTCP_NBR,                                    04670001
                    RCV_CUST_NM,                                        04680001
                    RCV_SS_PRIM_NBR,                                    04690001
                    RCV_SS_SCNDY_NBR,                                   04700001
                    RCV_ACCT_TYPE_CD,                                   04710001
                    RCV_OCC_BRKR_NBR,                                   04720001
                    RCV_CRSPN_NBR,                                      04730001
                    STTLM_DT,                                           04731001
                    PRCS_DT,                                            04732001
LRM001              PRTCP_CONTRA_CD,                                    04733001
LRM015              ACAT_CNTL_ASTD_NBR                                  04734001
                 INTO                                                   04735101
                    :DCLVTRNFR.CLIENT-NBR,                              04735205
                    :DCLVTRNFR.ACAT-CONTROL-NBR,                        04735305
                    :DCLVTRNFR.RCV-NBR,                                 04735405
                    :DCLVTRNFR.ACCT-RCV-NBR,                            04735505
                    :DCLVTRNFR.DLVR-NBR,                                04735605
                    :DCLVTRNFR.ACCT-DLVR-NBR,                           04735705
                    :DCLVTRNFR.STTS-CD,                                 04735805
                    :DCLVTRNFR.DAYS-STTS-QTY,                           04735905
                    :DCLVTRNFR.TRNFR-TYPE-CD,                           04736005
                    :DCLVTRNFR.DSTBN-SIDE-CD,                           04736105
                    :DCLVTRNFR.SBMTG-PRTCP-NBR,                         04736205
                    :DCLVTRNFR.RCV-CUST-NM,                             04736305
                    :DCLVTRNFR.RCV-SS-PRIM-NBR,                         04736405
                    :DCLVTRNFR.RCV-SS-SCNDY-NBR,                        04736505
                    :DCLVTRNFR.RCV-ACCT-TYPE-CD,                        04736605
                    :DCLVTRNFR.RCV-OCC-BRKR-NBR,                        04736705
                    :DCLVTRNFR.RCV-CRSPN-NBR,                           04736805
                    :DCLVTRNFR.STTLM-DT,                                04736905
                    :DCLVTRNFR.PRCS-DT,                                 04737005
LRM001              :DCLVTRNFR.PRTCP-CONTRA-CD,                         04737105
LRM015              :DCLVTRNFR.ACAT-CNTL-ASTD-NBR                       04737205
                 FROM VTRNFR                                            04737414
                 WHERE  CLIENT_NBR        = :WS-CLIENT                  04737512
                   AND  ACAT_CONTROL_NBR  = :FMT-AT-CONTROL-NUM         04737610
           END-EXEC.                                                    04737701
                                                                        04738001
           IF  SQLCODE = +0                                             05260014
              ADD   1      TO WS-CNT-FOUND                              05270026
LRM007        PERFORM SET-TI-RECORD-RTN                                 05370001
              GO TO PROCESS-PEND-CONTD                                  05380001
           END-IF.                                                      05580001
                                                                        05580101
           INITIALIZE DCLVTRNHSTY.                                      05580201
            EXEC SQL                                                    05581001
               SELECT                                                   05582001
                    CLIENT_NBR,                                         05583001
                    ACAT_CONTROL_NBR,                                   05584001
                    RCV_NBR,                                            05585001
                    ACCT_RCV_NBR,                                       05586001
                    DLVR_NBR,                                           05587001
                    ACCT_DLVR_NBR,                                      05588001
                    STTS_CD,                                            05589001
                    DAYS_STTS_QTY,                                      05589101
                    TRNFR_TYPE_CD,                                      05589201
                    DSTBN_SIDE_CD,                                      05589301
                    SBMTG_PRTCP_NBR,                                    05589401
                    RCV_CUST_NM,                                        05589501
                    RCV_SS_PRIM_NBR,                                    05589601
                    RCV_SS_SCNDY_NBR,                                   05589701
                    RCV_ACCT_TYPE_CD,                                   05589801
                    RCV_OCC_BRKR_NBR,                                   05589901
                    RCV_CRSPN_NBR,                                      05590001
                    STTLM_DT,                                           05590101
                    PRCS_DT,                                            05590201
LRM001              PRTCP_CONTRA_CD,                                    05590301
LRM015              ACAT_CNTL_ASTD_NBR                                  05590401
                 INTO                                                   05590601
                     :DCLVTRNHSTY.CLIENT-NBR,                           05590705
                     :DCLVTRNHSTY.ACAT-CONTROL-NBR,                     05590805
                     :DCLVTRNHSTY.RCV-NBR,                              05590905
                     :DCLVTRNHSTY.ACCT-RCV-NBR,                         05591005
                     :DCLVTRNHSTY.DLVR-NBR,                             05591105
                     :DCLVTRNHSTY.ACCT-DLVR-NBR,                        05591205
                     :DCLVTRNHSTY.STTS-CD,                              05591305
                     :DCLVTRNHSTY.DAYS-STTS-QTY,                        05591405
                     :DCLVTRNHSTY.TRNFR-TYPE-CD,                        05591505
                     :DCLVTRNHSTY.DSTBN-SIDE-CD,                        05591605
                     :DCLVTRNHSTY.SBMTG-PRTCP-NBR,                      05591705
                     :DCLVTRNHSTY.RCV-CUST-NM,                          05591805
                     :DCLVTRNHSTY.RCV-SS-PRIM-NBR,                      05591905
                     :DCLVTRNHSTY.RCV-SS-SCNDY-NBR,                     05592005
                     :DCLVTRNHSTY.RCV-ACCT-TYPE-CD,                     05592105
                     :DCLVTRNHSTY.RCV-OCC-BRKR-NBR,                     05592205
                     :DCLVTRNHSTY.RCV-CRSPN-NBR,                        05592305
                     :DCLVTRNHSTY.STTLM-DT,                             05592405
                     :DCLVTRNHSTY.PRCS-DT,                              05592505
LRM001               :DCLVTRNHSTY.PRTCP-CONTRA-CD,                      05592605
LRM015               :DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR                    05592705
                 FROM VTRNHSTY                                          05592814
                 WHERE  CLIENT_NBR        = :WS-CLIENT                  05592912
                   AND  ACAT_CONTROL_NBR  = :FMT-AT-CONTROL-NUM         05593010
           END-EXEC.                                                    05593101
                                                                        05593201
                                                                        05594000
           IF  SQLCODE = +0                                             05595026
              ADD   1      TO WS-CNT-FOUND                              05595126
LRM007        PERFORM SET-TI-RECORD-RTN-HST                             05596001
              GO TO PROCESS-PEND-CONTD                                  05597007
           END-IF.                                                      05598001
                                                                        05599001
      ****NO TI FOUND                                                   05600001
           DISPLAY '**** NO  TI FOUND DUMMY CREATED ****'               05610022
              WS-CLIENT '  '                                            05620033
              FMT-AT-CONTROL-NUM.                                       05630024
           ADD   1      TO WS-CNT-NOT                                   05631026
                                                                        05640000
           MOVE FMT-AT-RECORD   TO FMT-TI-RECORD.                       05650001
           SET FMT-TI-RECORD-ID TO TRUE.                                05651018
           MOVE 9999            TO FMT-CONTRA-BRK-NUM                   05660001
           MOVE 'NA'            TO FMT-CONTRA-ACCOUNT                   05680007
                                   FMT-ACT-TITLE                        05681001
           MOVE SPACE           TO FMT-ACT-TIN-NUMBER                   05682007
           MOVE SPACE           TO FMT-ACT-TYPE                         05683007
                                   FMT-TRNFR-TYPE.                      05684001
           MOVE FMT-AT-SETTL-DATE TO FMT-SETTL-DATE.                    05690001
                                                                        05750000
       PROCESS-PEND-CONTD.                                              05760007
                                                                        05760101
           WRITE OPEND-TI-RECORD FROM  FMT-TI-RECORD                    05761001
                                                                        05762001
           WRITE OPEND-AT-RECORD FROM  FMT-AT-RECORD.                   05770018
                                                                        05780001
           PERFORM READ-PENDING-FILE.                                   05781020
                                                                        05782020
       PROCESS-RTN-EXIT.                                                05790007
           EXIT.                                                        05800001
                                                                        05820000
       SET-TI-RECORD-RTN.                                               05840001
                                                                        05850000
           MOVE SPACES TO FMT-TI-RECORD.                                05860001
           MOVE CLIENT-NBR OF DCLVTRNFR TO FMT-TI-ADP-CL-NO.            05870000
           MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO FMT-TI-CONTROL-NUM.    05880000
           SET FMT-TI-RECORD-ID TO TRUE.                                05890000
           IF DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                          05900000
              MOVE RCV-NBR OF DCLVTRNFR  TO FMT-TI-BROKER-CLEAR-NO      05910000
              MOVE DLVR-NBR OF DCLVTRNFR TO FMT-CONTRA-BRK-NUM          05920000
              MOVE ACCT-RCV-NBR OF DCLVTRNFR TO FMT-TI-CUST-ACCOUNT     05990001
              MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO FMT-CONTRA-ACCOUNT     06010000
              SET  FMT-CLNT-IS-RECEIVER TO TRUE                         06020000
           ELSE                                                         06030000
              MOVE DLVR-NBR OF DCLVTRNFR TO FMT-TI-BROKER-CLEAR-NO      06040000
              MOVE RCV-NBR OF DCLVTRNFR  TO FMT-CONTRA-BRK-NUM          06050000
              MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO FMT-TI-CUST-ACCOUNT    06120001
              MOVE ACCT-RCV-NBR OF DCLVTRNFR TO FMT-CONTRA-ACCOUNT      06140000
              SET  FMT-CLNT-IS-DELIVERER TO TRUE                        06150000
           END-IF.                                                      06160000
           MOVE STTS-CD  OF DCLVTRNFR TO FMT-STATUS-CD.                 06310000
           MOVE DAYS-STTS-QTY OF DCLVTRNFR TO FMT-DAYS-IN-STATUS.       06320000
           MOVE STTLM-DT OF DCLVTRNFR TO WS-DATE.                       06330000
           MOVE WS-DATE(1 : 4) TO FMT-SETTL-DATE(1 : 4).                06340000
           MOVE WS-DATE(6 : 2) TO FMT-SETTL-DATE(5 : 2).                06350000
           MOVE WS-DATE(9 : 2) TO FMT-SETTL-DATE(7 : 2).                06360000
           MOVE PRCS-DT OF DCLVTRNFR TO WS-DATE.                        06430000
           MOVE WS-DATE(1 : 4) TO FMT-PROCESS-DATE (1 : 4).             06440000
           MOVE WS-DATE(6 : 2) TO FMT-PROCESS-DATE (5 : 2).             06450000
           MOVE WS-DATE(9 : 2) TO FMT-PROCESS-DATE (7 : 2).             06460000
           MOVE RCV-CUST-NM OF DCLVTRNFR TO FMT-ACT-TITLE.              06470000
           MOVE RCV-SS-PRIM-NBR OF DCLVTRNFR                            06480000
                                         TO FMT-ACT-TIN-NUMBER.         06490000
           MOVE TRNFR-TYPE-CD OF DCLVTRNFR TO FMT-TRNFR-TYPE.           06500000
           MOVE RCV-ACCT-TYPE-CD OF DCLVTRNFR TO FMT-ACT-TYPE.          06510000
LRM015     MOVE ACAT-CNTL-ASTD-NBR OF DCLVTRNFR TO FMT-CNTL-ASTD-NBR.   06520000
                                                                        06530000
                                                                        06590000
       SET-TI-RECORD-RTN-HST.                                           07091101
                                                                        07091201
           MOVE SPACES TO FMT-TI-RECORD.                                07091330
           MOVE CLIENT-NBR OF DCLVTRNHSTY TO FMT-TI-ADP-CL-NO.          07091401
           MOVE ACAT-CONTROL-NBR OF DCLVTRNHSTY TO FMT-TI-CONTROL-NUM.  07091501
           SET FMT-TI-RECORD-ID TO TRUE.                                07091601
           IF DSTBN-SIDE-CD OF DCLVTRNHSTY = 'R'                        07091701
              MOVE RCV-NBR OF DCLVTRNHSTY TO FMT-TI-BROKER-CLEAR-NO     07091801
              MOVE DLVR-NBR OF DCLVTRNHSTY TO FMT-CONTRA-BRK-NUM        07091901
              MOVE ACCT-RCV-NBR OF DCLVTRNHSTY TO FMT-TI-CUST-ACCOUNT   07092001
              MOVE ACCT-DLVR-NBR OF DCLVTRNHSTY TO FMT-CONTRA-ACCOUNT   07092101
              SET  FMT-CLNT-IS-RECEIVER TO TRUE                         07092201
           ELSE                                                         07092301
              MOVE DLVR-NBR OF DCLVTRNHSTY TO FMT-TI-BROKER-CLEAR-NO    07092401
              MOVE RCV-NBR OF DCLVTRNHSTY TO FMT-CONTRA-BRK-NUM         07092501
              MOVE ACCT-DLVR-NBR OF DCLVTRNHSTY TO FMT-TI-CUST-ACCOUNT  07092601
              MOVE ACCT-RCV-NBR OF DCLVTRNHSTY TO FMT-CONTRA-ACCOUNT    07092701
              SET  FMT-CLNT-IS-DELIVERER TO TRUE                        07092801
           END-IF.                                                      07092901
           MOVE STTS-CD  OF DCLVTRNHSTY TO FMT-STATUS-CD.               07093001
           MOVE DAYS-STTS-QTY OF DCLVTRNHSTY TO FMT-DAYS-IN-STATUS.     07093101
           MOVE STTLM-DT OF DCLVTRNHSTY TO WS-DATE.                     07093201
           MOVE WS-DATE(1 : 4) TO FMT-SETTL-DATE(1 : 4).                07093301
           MOVE WS-DATE(6 : 2) TO FMT-SETTL-DATE(5 : 2).                07093401
           MOVE WS-DATE(9 : 2) TO FMT-SETTL-DATE(7 : 2).                07093501
           MOVE PRCS-DT OF DCLVTRNHSTY TO WS-DATE.                      07093601
           MOVE WS-DATE(1 : 4) TO FMT-PROCESS-DATE (1 : 4).             07093701
           MOVE WS-DATE(6 : 2) TO FMT-PROCESS-DATE (5 : 2).             07093801
           MOVE WS-DATE(9 : 2) TO FMT-PROCESS-DATE (7 : 2).             07093901
           MOVE RCV-CUST-NM OF DCLVTRNHSTY TO FMT-ACT-TITLE.            07094001
           MOVE RCV-SS-PRIM-NBR OF DCLVTRNHSTY                          07094101
                                         TO FMT-ACT-TIN-NUMBER.         07094201
           MOVE TRNFR-TYPE-CD OF DCLVTRNHSTY TO FMT-TRNFR-TYPE.         07094301
           MOVE RCV-ACCT-TYPE-CD OF DCLVTRNHSTY TO FMT-ACT-TYPE.        07094401
LRM015     MOVE ACAT-CNTL-ASTD-NBR OF DCLVTRNHSTY TO FMT-CNTL-ASTD-NBR. 07094501
                                                                        07094601
                                                                        07094701
                                                                        09490000
