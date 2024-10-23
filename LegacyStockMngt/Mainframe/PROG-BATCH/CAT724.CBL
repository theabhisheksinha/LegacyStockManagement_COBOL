000001* PDX    - CAT724   C0236781 07/05/06 09:44:06 TBLAMUR            00001003
LRM001* SSR 45744 ADDITIONAL CHANGE TO RECOGNIZE ONLINE FRZN REJECT     00001101
000001* PDX    - CAT724   C0235814 06/09/06 08:01:27 TBLAMUR            00001200
       IDENTIFICATION DIVISION.                                         00002800
       PROGRAM-ID.  CAT724.                                             00002900
      *REMARK.                                                          00003000
      *---------------------------------------------------------------  00004000
      * SSR# 45744 SET DAIN ACCT FREEZE REJECTS (BUILT ON HOLD BY       00005000
      *    BATCH) TO GO OUT ON CYCLE 1 THE FOLLOWING DAY.               00006000
      * FUL (RECEIVE AND DELIVER) IN REVIEW STATUS, AND PTR DELIVER     00007000
      *    IN MEMO STATUS                                               00007100
      * READ ACTIVE TRANSFER WITH FREEZE INDICATOR SET, LOOK FOR        00007200
      * REJECT ROW ON HOLD ON INITIAL TRANSFER, IF FOUND, UPDATE TO     00007300
      * MAKE IT ELIGABLE TO SUBMIT.                                     00007400
      *---------------------------------------------------------------  00007500
       ENVIRONMENT DIVISION.                                            00008000
       INPUT-OUTPUT SECTION.                                            00009000
       FILE-CONTROL.                                                    00010000
       DATA DIVISION.                                                   00020000
      ******************************************************************00030000
       WORKING-STORAGE SECTION.                                         00040000
      ******************************************************************00050000
DJ0001     COPY PDXIDCOB.                                               00060000
       77  FILLER                      PIC X(06) VALUE 'CAT724'.        00070000
       77  WS-END-OF-TRNFR             PIC X       VALUE ' '.           00080000
           88 END-OF-TRNFR             VALUE 'Y'.                       00090000
           COPY STUBCPY.                                                00110000
       01  WS-CURRENT-TMSTP            PIC X(26).                       00120000
       01  WS-CAT724-WORK-AREA.                                         00130000
           03  WS-FIRST-TIME-SW        PIC X(1)    VALUE 'Y'.           00140000
               88  FIRST-TIME          VALUE 'Y'.                       00150000
           03  WS-CLIENT-NBR           PIC X(04)   VALUE LOW-VALUES.    00170000
           03  WS-ACAT-CNTL-NBR        PIC X(14)   VALUE LOW-VALUES.    00180000
           03  WS-TRNFR-TYPE-CD        PIC X(03)   VALUE LOW-VALUES.    00190000
           03  WS-TRNFR-FETCH-COUNT    PIC 9(07) COMP-3  VALUE ZEROS.   00190100
           03  WS-TRNFR-UPDATED        PIC 9(07) COMP-3  VALUE ZEROS.   00190200
                                                                        00191000
       01  DB2-WORK-AREA.                                               00200000
           03  WS-REJECT-ISRT-COUNT          PIC S9(5) COMP-3 VALUE +0. 00210000
           03  WS-COUNT                      PIC S9(9) COMP VALUE +0.   00220000
       01  DB2-ABEND-WORK-AREA.                                         00230000
           03  DB2-ABEND-CODE                PIC S9(04) COMP.           00240000
           03  WS-NSCC-PEND-IND              PIC X(01)  VALUE SPACES.   00250000
           03  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.00260000
           03  WS-DB2-MESSAGE-AREA.                                     00270000
               05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.00280000
               05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES 00290000
                   INDEXED BY WS-ERROR-INDEX.                           00300000
           03  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80. 00310000
      *                                                                 00320000
           EXEC SQL                                                     00330000
              INCLUDE SQLCA                                             00340000
           END-EXEC.                                                    00350000
           EXEC SQL                                                     00360000
              INCLUDE VTRNFR                                            00370000
           END-EXEC.                                                    00380000
           EXEC SQL                                                     00920000
              INCLUDE ACTITRF                                           00940000
           END-EXEC.                                                    00950000
       EJECT                                                            00960000
      ***************************************************************** 01000000
       PROCEDURE DIVISION.                                              01010000
      ***************************************************************** 01020000
           DISPLAY 'CAT724 - SET ACCT FREEZE REJECTS TO SUBMIT'         01030000
           DISPLAY ' '.                                                 01040000
           COPY MSGCOBO.                                                01050000
           DISPLAY ' '.                                                 01060000
           PERFORM GET-REJ-TIF THRU GET-REJ-TIF-EXIT.                   01181000
           DISPLAY 'FETCHED ORIG FROZEN TIFS  ' WS-TRNFR-FETCH-COUNT    01181100
           DISPLAY 'UPDATED REJECTS TO SUBMIT ' WS-TRNFR-UPDATED        01181200
           GOBACK.                                                      01182000
                                                                        01183000
       GET-REJ-TIF.                                                     07260000
      *** SELECT PTR DELIVER SIDE IN MEMO STATUS, AND FULL RECEIVE      07270000
      *** AND DELIVERY IN REVIEW                                        07271000
      ***                                                               07280000
      *--- DECLARE                                                      07290000
           EXEC SQL                                                     07300000
             DECLARE TIF_FREEZE_CSR CURSOR WITH HOLD FOR                07301000
             SELECT                                                     07302000
                    CLIENT_NBR                                          07303000
                   ,ACAT_CONTROL_NBR                                    07304000
                   ,TRNFR_TYPE_CD                                       07304100
                FROM VTRNFR                                             07305000
             WHERE                                                      07306000
LRM001        (ACCT_FRZN_IND IN ('O', 'Y')                              07306102
               AND TRNFR_TYPE_CD = 'FUL'                                07307000
               AND DSTBN_SIDE_CD = 'R'                                  07307100
               AND STTS_CD  >= '200'                                    07307200
               AND STTS_CD   < '220')                                   07307300
              OR                                                        07307400
LRM001        (ACCT_FRZN_IND IN ('O', 'Y')                              07307502
               AND TRNFR_TYPE_CD = 'FUL'                                07307600
               AND DSTBN_SIDE_CD = 'D'                                  07307700
               AND STTS_CD   < '120')                                   07307800
              OR                                                        07307900
LRM001        (ACCT_FRZN_IND IN ('O', 'Y')                              07308002
               AND TRNFR_TYPE_CD = 'PTR'                                07309000
               AND DSTBN_SIDE_CD = 'D'                                  07310000
               AND STTS_CD   = '500')                                   07311000
                     ORDER BY CLIENT_NBR, ACAT_CONTROL_NBR              07312000
           END-EXEC.                                                    07313000
      *                                                                 07314000
      *----------------------->                                         07315000
           EXEC SQL                                                     07316000
                OPEN TIF_FREEZE_CSR                                     07317000
           END-EXEC.                                                    07318000
      *                                                                 07319000
           PERFORM UNTIL END-OF-TRNFR                                   07320100
              EXEC SQL                                                  07320200
                   FETCH TIF_FREEZE_CSR                                 07320300
                   INTO                                                 07320400
                      :DCLVTRNFR.CLIENT-NBR                             07320500
                     ,:DCLVTRNFR.ACAT-CONTROL-NBR                       07320600
                     ,:DCLVTRNFR.TRNFR-TYPE-CD                          07320700
              END-EXEC                                                  07320800
              EVALUATE SQLCODE                                          07320900
                  WHEN +0                                               07321000
                   ADD 1 TO WS-TRNFR-FETCH-COUNT                        07321100
                   MOVE CLIENT-NBR OF DCLVTRNFR TO WS-CLIENT-NBR        07321200
                   MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO                07322000
                                                   WS-ACAT-CNTL-NBR     07323000
                   MOVE TRNFR-TYPE-CD OF DCLVTRNFR TO WS-TRNFR-TYPE-CD  07323100
TEST               DISPLAY 'FETCHED ' WS-CLIENT-NBR ' '                 07323200
TEST                   WS-TRNFR-TYPE-CD ' ' WS-ACAT-CNTL-NBR            07323300
                   PERFORM PROCESS-FREEZE-REJECT      THRU              07324000
                           PROCESS-FREEZE-REJECT-EXIT                   07325000
                   MOVE +0     TO SQLCODE                               07326000
                  WHEN  +100                                            07327000
                    SET END-OF-TRNFR TO TRUE                            07328000
                  WHEN OTHER                                            07329000
                    PERFORM SQL-ERROR-ROUTINE                           07330000
              END-EVALUATE                                              07331000
           END-PERFORM.                                                 07332000
           EXEC SQL                                                     07332100
                 CLOSE TIF_FREEZE_CSR                                   07332200
           END-EXEC.                                                    07332300
                                                                        07332400
       GET-REJ-TIF-EXIT.                                                07332500
           EXIT.                                                        07332600
                                                                        07332700
       PROCESS-FREEZE-REJECT.                                           07332800
           EXEC SQL SELECT                                              07332900
              CLIENT_NBR                                                07333000
              ,ACAT_CONTROL_NBR                                         07333100
              ,NSCC_PEND_CD                                             07333200
            INTO                                                        07333300
                :DCLACTITRF.CLIENT-NBR                                  07333400
               ,:DCLACTITRF.ACAT-CONTROL-NBR                            07333500
               ,:DCLACTITRF.NSCC-PEND-CD                                07333600
           FROM ACTITRF                                                 07333800
           WHERE CLIENT_NBR       = :WS-CLIENT-NBR                      07333900
             AND ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR                   07334000
             AND TRANS_TYPE_CD    = 'R'                                 07334100
           END-EXEC.                                                    07334200
                                                                        07334300
           IF SQLCODE EQUAL ZERO                                        07334400
             IF  NSCC-PEND-CD OF DCLACTITRF = 'H'                       07334500
              EXEC SQL                                                  07334700
               UPDATE ACTITRF                                           07334800
                  SET NSCC_PEND_CD   = ' '                              07334900
                     ,PRGM_NM        = 'CAT724 '                        07335000
                 WHERE CLIENT_NBR = :WS-CLIENT-NBR AND                  07335100
                      ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR              07335200
              END-EXEC                                                  07335300
              DISPLAY 'ACCT FREEZE REJECT SET TO SUBMIT '               07335400
                          WS-CLIENT-NBR ' '  WS-ACAT-CNTL-NBR           07335500
                                        ' '  WS-TRNFR-TYPE-CD           07335600
              ADD 1 TO WS-TRNFR-UPDATED                                 07335700
              IF WS-REJECT-ISRT-COUNT = +10                             07335800
                 EXEC SQL COMMIT END-EXEC                               07335900
                 MOVE +0   TO  WS-REJECT-ISRT-COUNT                     07336000
              END-IF                                                    07336100
             END-IF                                                     07336200
           ELSE IF SQLCODE EQUAL 100                                    07336300
               DISPLAY 'FREEZE REJECT NOT FOUND'                        07336400
               DISPLAY 'TRK KEY ' WS-CLIENT-NBR ' '                     07336500
                        WS-ACAT-CNTL-NBR                                07336600
             ELSE                                                       07336700
                DISPLAY ' DUPLICATE ROWS IN ACTITRF FROM FREEZE'        07336800
                DISPLAY ' CLIENT_NBR = ' WS-CLIENT-NBR                  07336900
                DISPLAY ' ACAT_CONTROL_NBR = ' WS-ACAT-CNTL-NBR         07337000
                DISPLAY ' BYPASSED '                                    07337100
           END-IF.                                                      07337200
           MOVE +0  TO  SQLCODE.                                        07337300
       PROCESS-FREEZE-REJECT-EXIT.                                      07337400
           EXIT.                                                        07337500
                                                                        07337600
      *******************                                               07337700
       SQL-ERROR-ROUTINE.                                               07337800
      *******************                                               07338000
                                                                        07339000
           CALL DSNTIAR               USING  SQLCA                      07340000
                                             WS-DB2-MESSAGE-AREA        07350000
                                             WS-ERR-LINE-LEN            07360000
                                                                        07370000
           DISPLAY ' '                                                  07380000
                                                                        07390000
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   07400000
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      07410000
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              07420000
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        07430000
                 END-IF                                                 07440000
           END-PERFORM                                                  07450000
                                                                        07460000
           DISPLAY ' '                                                  07470000
           DISPLAY ' *** CAT724 ABENDED ****'                           07480000
           DISPLAY ' ACAT-CLIENT IS : ' WS-CLIENT-NBR.                  07490000
           DISPLAY ' ACAT-CONTROL-NBR = ' WS-ACAT-CNTL-NBR.             07500000
           DISPLAY ' '                                                  07510000
                                                                        07520000
           EXEC SQL  ROLLBACK  END-EXEC                                 07530000
           CALL ABEND      USING DB2-ABEND-CODE.                        07540000
