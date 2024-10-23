000001* PDX    - CAT761A  C0348882 12/06/13 06:50:55 TBCHKOP            00001000
      * CSG001 SSR# 91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.                 
000001* PDX    - CAT761A  C0302984 10/25/10 13:31:13 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         00590000
       PROGRAM-ID.  CAT761A.                                            00600000
       DATE-WRITTEN.  OCT 2010.                                         00610000
                                                                        00620000
      ***************************************************************** 00630000
      *                         REMARKS                               * 00640000
      ***************************************************************** 00650000
      * THIS PROGRAM SELECTS RECORDS FROM VTRNFRAU BY STREAM FOR      * 00660000
      * REPORTING IN CAT761 AUDIT REPORT.  SSR 70666.                 * 00670000
      ***************************************************************** 00770000
                                                                        00780000
           EJECT                                                        00790000
      ***************************************************************** 00800000
       ENVIRONMENT DIVISION.                                            00810000
      ***************************************************************** 00820000
       INPUT-OUTPUT SECTION.                                            00830000
       FILE-CONTROL.                                                    00840000
                                                                        00850000
           SELECT ACATACTF         ASSIGN      TO ACATACTF              01040025
                                   FILE STATUS IS ACATACTF-FILE-STATUS. 01050025
                                                                        01060000
      ***************************************************************** 01070000
       DATA DIVISION.                                                   01080000
      ***************************************************************** 01090000
                                                                        01100000
       FILE SECTION.                                                    01110000
                                                                        01120000
       FD  ACATACTF                                                     01280025
           RECORDING MODE IS F                                          01290012
           BLOCK CONTAINS 0 RECORDS.                                    01300012
           COPY ACATACTF REPLACING ==:ACATACTF:== BY ==ACATACTF==.      01310025
           EJECT                                                        01320000
      ******************************************************************01330000
       WORKING-STORAGE SECTION.                                         01340000
      ******************************************************************01350000
           COPY PDXIDCOB.                                               01360012
                                                                        01370000
       77  ABEND-CODE              COMP  PIC S9(4)   VALUE +9999.       01410000
       77  WS-STREAM-IND                 PIC  X(01)  VALUE SPACES.      01420000
       77  WS-CLIENT                     PIC  X(04)  VALUE SPACES.      01430000
       77  WS-TI-FETCH-CNTR      COMP-3  PIC  9(09)  VALUE ZEROES.              
       77  B1-SUB                        PIC  9(03)  VALUE ZEROES.              
       77  S1                            PIC  9(03)  VALUE ZEROES.              
           COPY STUBCPY.                                                01790000
                                                                                
       01  CLIENT-TABLE-CNTR             PIC  9(04)  VALUE 0.           02940000
                                                                        02950000
       01  CLIENT-TABLE-AREA.                                           02960000
           05  CLIENT-TABLE OCCURS 500 TIMES.                           02970000
               10  CLIENT-NUM            PIC  9(04)  VALUE ZEROES.      02980000
                                                                        03160000
           EJECT                                                        04640000
           COPY BHINFO.                                                 04650000
                                                                        04660000
           EJECT                                                        04670000
           COPY BHACAT.                                                 04680000
                                                                        04790008
           EJECT                                                        04800008
       01  ACATACTF-FILE-STATUS     PIC  X(002).                        04810025
           88 ACATACTF-OKAY         VALUE '00' THRU '09', '97'.         04820025
           88 ACATACTF-END-OF-FILE  VALUE '10'.                         04830025
           88 ACATACTF-EMPTY-MISSING VALUE '35'.                        04840025
       01  W-ACATACTF-CNT           PIC  9(009) COMP-3 VALUE 0.         04850025
       01  W-ACATACTF-DELETE-CNT    PIC  9(009) COMP-3 VALUE 0.         04850025
       01  W-ACATACTF-CHANGE-CNT    PIC  9(009) COMP-3 VALUE 0.         04850025
       01  W-VTRNFR-CNT             PIC  9(009) COMP-3 VALUE 0.         04850025
                                                                        04860012
      /                                                                 04860012
           EJECT                                                        04920000
           COPY BPDATESC.                                               04930000
           EJECT                                                        04940000
                                                                        05010000
       01  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.    05020000
       01  WS-DB2-MESSAGE-AREA.                                         05030000
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.    05040000
           05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES     05050000
               INDEXED BY WS-ERROR-INDEX.                               05060000
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.     05070000
       01  WS-SQLCODE                    PIC Z(8)9-.                    05080000
       01  WS-TI-SQLCODE                 PIC S9(9)  COMP-4.             05090000
       01  WS-AT-SQLCODE                 PIC S9(9)  COMP-4.             05100000
       01  WS-FR-SQLCODE                 PIC S9(9)  COMP-4.             05110000
       01  W-SQLERRD-3                   PIC S9(9).                     05120000
       01  W-SQL-COUNT                   PIC --------9.                 05130000
       01  WS-ABEND-CTR                  PIC S9(3)  COMP-3  VALUE ZERO. 05140000
                                                                        07610000
      *DB2 COMMUNICATION AREA                                           07620000
           EJECT                                                        07630000
           EXEC SQL                                                     07640000
              INCLUDE SQLCA                                             07650000
           END-EXEC.                                                    07660000
                                                                        07670000
           EJECT                                                        07680000
           EXEC SQL                                                     07690000
              INCLUDE VTRNFRAU                                          07700000
           END-EXEC.                                                    07710000
                                                                        07720000
           EJECT                                                        07980000
      *DECLARE CURSOR TO OBTAIN ALL TI RECORDS FOR THE CLIENT           08030000
           EXEC SQL                                                     08040000
              DECLARE NSCC_TI_CRSR CURSOR WITH HOLD FOR                 08050000
                 SELECT                                                 08060000
                CLIENT_NBR                                              23115000
               ,ACAT_CONTROL_NBR                                        23115100
               ,AUD_CRT_TMSTP                                           23115200
               ,TRANS_TYPE_CD                                           23115300
               ,CMNT_TXT                                                23116300
               ,ACCT_CD                                                 23117200
               ,BRANCH_CD                                               23117500
               ,CICS_TERM_ID_CD                                         23117600
               ,PRGM_NM                                                 23117700
                 FROM VTRNFRAU                                          08370000
                 WHERE CLIENT_NBR   =  :WS-CLIENT                       08380000
           END-EXEC.                                                    08400000
                                                                        08410000
           EJECT                                                        10480000
      ******************************************************************10490000
       LINKAGE SECTION.                                                 10500000
      ******************************************************************10510000
                                                                        10520000
       01  PARM-AREA.                                                   10530000
           05  PARM-LENGTH              PIC  S9(4) COMP.                10540000
           05  LS-STREAM-IND            PIC  X(01).                     10550000
                                                                        10830000
           EJECT                                                        10840000
      ***************************************************************** 10850000
       PROCEDURE DIVISION USING PARM-AREA.                              10860000
      ***************************************************************** 10870000
           DISPLAY 'CAT761A - SELECTS AUDIT ROWS FROM VTRNFRAU'.        10880000
           DISPLAY 'THIS IS READONLY / MAY BE RESTARTED'.               10910000
                                                                        10920000
           COPY MSGCOBO.                                                10930000
                                                                        10940000
           PERFORM INITIAL-ROUTINE.                                     10950000
                                                                        10960000
           PERFORM PROCESS-ROUTINE.                                     10970000
                                                                        10980000
           PERFORM ENDJOB-ROUTINE.                                      10990000
                                                                        11000000
           GOBACK.                                                      11010000
                                                                        11020000
           EJECT                                                        11030000
      *****************                                                 11040000
       PROCESS-ROUTINE.                                                 11050000
      *****************                                                 11060000
                                                                        11070000
           PERFORM BUILD-CLIENT-TABLE                                   11080000
                                                                        11150000
           DISPLAY 'CLIENTS LOADED IN B1 TABLE ' CLIENT-TABLE-CNTR      11160000
           PERFORM VARYING S1 FROM 1 BY 1                               11170000
              UNTIL S1 > CLIENT-TABLE-CNTR                              11180000
              MOVE CLIENT-NUM (S1)          TO  WS-CLIENT               11190000
              PERFORM FETCH-TI-RECORDS                                  11250000
           END-PERFORM.                                                 11300000
                                                                        11400000
           EJECT                                                        11420000
      ********************                                              11430000
       BUILD-CLIENT-TABLE.                                              11440000
      ********************                                              11450000
                                                                        11460000
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        11470000
              MOVE SPACES                   TO  BH-BROKER-HEADER-INFO   11480000
                                                BH-ACAT-INFO            11490000
              MOVE B1-SUB                   TO  BH-BROKER-NUMBER        11500000
              MOVE '015'                    TO  BH-LOGICAL-RECORD-CODE  11510000
              MOVE '434500'                 TO  BH-B2-INFO-ID           11520000
              CALL  GETB1V               USING  BH-BROKER-HEADER-INFO   11530000
                                                BH-ACAT-INFO            11540000
              IF BH-BROKER-ACTIVE AND BH-ACAT-ACTIVE                    11550000
                 IF BH-BROKER-MINI-MAXI-SUBGROUP NOT = SPACES           11560000
                    MOVE BH-BROKER-MINI-MAXI-SUBGROUP                   11570000
                                            TO  WS-STREAM-IND           11580000
                 ELSE                                                   11590000
                    MOVE BH-BROKER-MINI-MAXI-INDICATOR                  11600000
                                            TO  WS-STREAM-IND           11610000
                 END-IF                                                 11620000
                 IF LS-STREAM-IND  = WS-STREAM-IND                      11630000
                    ADD 1                   TO  S1                      11690000
                    MOVE B1-SUB             TO  CLIENT-NUM (S1)         11700000
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM                                                  12280000
                                                                        12290000
           IF S1 = 0                                                    12300000
              DISPLAY ' '                                               12310000
              DISPLAY '****************************************'        12320000
              DISPLAY '* THERE ARE NOT ACAT ACTIVE CLIENTS ON *'        12330000
              DISPLAY '* THIS STREAM: ' LS-STREAM-IND                   12340000
                      '                       *'                        12350000
              DISPLAY '****************************************'        12360000
           ELSE                                                         12370000
              MOVE S1                       TO  CLIENT-TABLE-CNTR       12380000
           END-IF.                                                      12390000
           EJECT                                                        13850000
      ******************                                                13860000
       FETCH-TI-RECORDS.                                                13870000
      ******************                                                13880000
                                                                        13890000
           EXEC SQL OPEN NSCC_TI_CRSR END-EXEC                          13900000
           IF SQLCODE NOT = +0                                          13910000
              MOVE SQLCODE TO WS-SQLCODE                                13920000
              DISPLAY 'TI DB2 CURSOR OPEN FAILED ' WS-SQLCODE           13940000
              PERFORM SQL-ERROR-ROUTINE                                 13950000
           END-IF                                                       13960000
                                                                        13970000
           PERFORM UNTIL WS-TI-SQLCODE NOT = +0                         13980000
              EXEC SQL                                                  13990000
                 FETCH NSCC_TI_CRSR                                     14000000
                   INTO                                                         
                    :DCLVTRNFRAU.CLIENT-NBR                             23118100
                   ,:DCLVTRNFRAU.ACAT-CONTROL-NBR                       23118300
                   ,:DCLVTRNFRAU.AUD-CRT-TMSTP                          23118400
                   ,:DCLVTRNFRAU.TRANS-TYPE-CD                          23118500
                   ,:DCLVTRNFRAU.CMNT-TXT                               23119500
                   ,:DCLVTRNFRAU.ACCT-CD                                23120400
                   ,:DCLVTRNFRAU.BRANCH-CD                              23120500
                   ,:DCLVTRNFRAU.CICS-TERM-ID-CD                        23120800
                   ,:DCLVTRNFRAU.PRGM-NM                                23120900
              END-EXEC                                                  07660000
                                                                        14020000
              MOVE SQLCODE TO WS-SQLCODE                                14030000
                              WS-TI-SQLCODE                             14040000
                                                                        14050000
              EVALUATE SQLCODE                                          14060000
                 WHEN +100                                              14070000
                    CONTINUE                                            14080000
                 WHEN +0                                                14090000
                    ADD  +1  TO WS-TI-FETCH-CNTR                        14100000
                    PERFORM 7300-WRITE-ACATACTF-TI                      28720052
                 WHEN OTHER                                             14380000
                    DISPLAY '================================== '       14390000
                    DISPLAY '**** ABEND AT FETCH-TI-RECORD **** '       14400000
                    DISPLAY '================================== '       14410000
                    DISPLAY ' CLIENT_NBR = ' WS-CLIENT                  14420000
                    DISPLAY ' '                                         14500000
                    MOVE SQLCODE TO WS-SQLCODE                          14510000
                    DISPLAY 'TI DB2 FETCH FAILED ' WS-SQLCODE           14530000
                    PERFORM SQL-ERROR-ROUTINE                           14540000
              END-EVALUATE                                              14550000
           END-PERFORM                                                  14560000
                                                                        14570000
           EXEC SQL                                                     14580000
              CLOSE NSCC_TI_CRSR                                        14590000
           END-EXEC                                                     14600000
                                                                        14610000
           IF SQLCODE NOT = +0                                          14620000
              MOVE SQLCODE TO WS-SQLCODE                                14630000
              DISPLAY 'TI DB2 CURSOR CLOSE FAILED ' WS-SQLCODE          14650000
              PERFORM SQL-ERROR-ROUTINE                                 14660000
           ELSE                                                         14670000
              MOVE +0                       TO  SQLCODE                 14680000
                                                WS-TI-SQLCODE           14690000
           END-IF.                                                      14700000
      /                                                                 28710012
       7300-WRITE-ACATACTF-TI.                                          28720052
           MOVE SPACES                   TO ACATACTF-RECORD             28730025
           MOVE CLIENT-NBR  TO ACATACTF-CLIENT-NBR                              
           MOVE ACAT-CONTROL-NBR TO ACATACTF-ACAT-CTL-NBR                       
           MOVE AUD-CRT-TMSTP  TO ACATACTF-CRT-TMSTP                            
                                  ACATACTF-UPDT-TMSTP                           
           IF TRANS-TYPE-CD = 'A'                                               
              SET ACATACTF-ACTION-ACCEPTED TO TRUE                              
              SET ACATACTF-TRANS-ACCEPT TO TRUE                                 
           ELSE                                                                 
              IF TRANS-TYPE-CD = 'S'                                            
                 SET ACATACTF-ACTION-SUBMIT TO TRUE                             
              ELSE                                                              
                 MOVE TRANS-TYPE-CD  TO ACATACTF-TRANS-TYPE-CD                  
           END-IF.                                                              
           SET ACATACTF-TI TO TRUE                                              
           SET ACATACTF-TI-REC TO TRUE                                          
           MOVE CMNT-TXT OF DCLVTRNFRAU(70:3)  TO ACATACTF-RR-CD        23112908
           MOVE BPD-PROC-DATE                  TO ACATACTF-BPD-PROC-DATE        
           MOVE CMNT-TXT OF DCLVTRNFRAU(73:4)  TO ACATACTF-CICS-SGNON-ID23113008
           MOVE CMNT-TXT OF DCLVTRNFRAU(77:20) TO ACATACTF-TPSCRT-USR-NM23113108
           MOVE CMNT-TXT OF DCLVTRNFRAU(97:8)  TO ACATACTF-TPSCRT-USR-ID23113204
           MOVE CMNT-TXT OF DCLVTRNFRAU(105:8) TO ACATACTF-CICS-NET-NM  23113304
           MOVE CMNT-TXT OF DCLVTRNFRAU(113:3) TO ACATACTF-TRNFR-TYPE-CD23113304
           MOVE ACCT-CD   TO ACATACTF-ACCT-CD                                   
           MOVE BRANCH-CD TO ACATACTF-BRANCH-CD                                 
           MOVE CICS-TERM-ID-CD TO ACATACTF-CICS-TERM-ID-CD                     
           MOVE PRGM-NM   TO ACATACTF-PRGM-NM                                   
           WRITE ACATACTF-RECORD.                                       29210025
           ADD 1 TO W-ACATACTF-CNT.                                     29220025
       7300-EXIT. EXIT.                                                 29230052
      /                                                                 29240012
           EJECT                                                                
      *****************                                                         
       INITIAL-ROUTINE.                                                         
      *****************                                                         
           MOVE 'CAT761A'                TO  BPDATES-CALLING-PGM                
           MOVE 'C'                      TO  BPDATES-REQ-TYPE                   
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*    MOVE 'US'                     TO  BPDATES-CALENDAR-TYPE              
CSG001     MOVE '  '                     TO  BPDATES-CALENDAR-TYPE              
           CALL  BPDATES              USING  BPDATES-PARAMETERS                 
                                                                                
           IF BPD-VALID-RETURN                                                  
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY ' '                                                       
              DISPLAY '*******************************'                         
              DISPLAY '* BPDATES INVALID-RETURN = ' BPDATES-RETURN-CODE         
                      ' *'                                                      
              DISPLAY '* PROGRAM IS ABENDING         *'                         
              DISPLAY '*******************************'                         
              DISPLAY ' '                                                       
              CALL ABEND              USING  ABEND-CODE                         
           END-IF                                                               
           OPEN OUTPUT ACATACTF.                                                
           DISPLAY 'CAT761A: ACATACTF OPENED FOR OUTPUT. STATUS = '             
                                               ACATACTF-FILE-STATUS.            
           IF  ACATACTF-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT761A: ERROR OPENING ACATACTF'                        
               DISPLAY 'CAT761A: OPEN STATUS = ' ACATACTF-FILE-STATUS           
                            '.  OUTPUT-CNT = ' W-ACATACTF-CNT                   
               DISPLAY 'CAT761A: U3008 - ABENDING ON BAD FILE STATUS'           
               MOVE +3008    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
      *******************                                                       
       SQL-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           CALL DSNTIAR               USING  SQLCA                              
                                             WS-DB2-MESSAGE-AREA                
                                             WS-ERR-LINE-LEN                    
                                                                                
           DISPLAY ' '                                                          
                                                                                
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
              UNTIL WS-ERROR-INDEX GREATER THAN 12                              
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                      
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)                
                 END-IF                                                         
           END-PERFORM                                                          
                                                                                
           DISPLAY ' '                                                          
           DISPLAY '*** PROGRAM IS ABENDING!'                                   
           DISPLAY '**** ABENDING SQLCODE = ' WS-SQLCODE                        
           DISPLAY ' '                                                          
                                                                                
           EXEC SQL  ROLLBACK  END-EXEC                                         
           CALL ABEND      USING ABEND-CODE.                                    
           EJECT                                                        31280000
      ****************                                                  31290000
       ENDJOB-ROUTINE.                                                  31300000
      ****************                                                  31310000
                                                                        31320000
           DISPLAY 'FETCHED TI ROWS     ' WS-TI-FETCH-CNTR                      
           DISPLAY 'ACATACTF TI RECORDS ' W-ACATACTF-CNT.               29220025
           CLOSE ACATACTF                                               31380025
           DISPLAY 'CAT761A: ACATACTF CLOSED. STATUS = '                31390025
                                             ACATACTF-FILE-STATUS.      31400025
                                                                        31410012
                                                                        31890000
           DISPLAY ' '                                                  31900000
           DISPLAY '*************************'                          31910000
           DISPLAY '* END OF CAT761A PROGRAM *'                         31920000
           DISPLAY '*************************'                          31930000
           DISPLAY ' '                                                  31940000
           .                                                            31960000
