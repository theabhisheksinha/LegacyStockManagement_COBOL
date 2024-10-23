000001* PDX    - CAT761P  C0305860 12/29/10 08:44:54 TBLAMUR            00001000
000001* PDX    - CAT761P  C0302984 10/22/10 11:05:38 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         00590000
       PROGRAM-ID.  CAT761P.                                            00600000
       DATE-WRITTEN.  OCT 2010.                                         00610000
                                                                        00620000
      ***************************************************************** 00630000
      *                         REMARKS                               * 00640000
      ***************************************************************** 00650000
      * THIS PROGRAM READS SELECTED RECORDS IN THE CAT761A FILE       * 00660000
      * (ALREADY REPORTED BY CAT761) AND DELETES THE ROW IN VTRNFRAU  * 00670000
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
           COPY ACATACTF REPLACING ==:ACATACTF:== BY ==ACATF==.         01310025
           EJECT                                                        01320000
      ******************************************************************01330000
       WORKING-STORAGE SECTION.                                         01340000
      ******************************************************************01350000
           COPY PDXIDCOB.                                               01360012
                                                                        01370000
       77  ABEND-CODE              COMP  PIC S9(4)   VALUE +9999.       01410000
       77  WS-CLIENT                     PIC  X(04)  VALUE SPACES.      01430000
           COPY STUBCPY.                                                01790000
                                                                                
           EJECT                                                        04800008
       01  ACATACTF-FILE-STATUS     PIC  X(002).                        04810025
           88 ACATACTF-OKAY         VALUE '00' THRU '09', '97'.         04820025
           88 ACATACTF-END-OF-FILE  VALUE '10'.                         04830025
           88 ACATACTF-EMPTY-MISSING VALUE '35'.                        04840025
       01  W-ACATACTF-CNT           PIC  9(009) COMP-3 VALUE 0.         04850025
       01  WS-TI-DELETED            PIC  9(009) COMP-3 VALUE 0.         04850025
       01  WS-TI-NOT-DELETED        PIC  9(009) COMP-3 VALUE 0.         04850025
                                                                        04860012
           COPY ACATACTF REPLACING ==:ACATACTF:== BY ==ACATACTF==.      01310025
                                                                                
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
       01  W-DB2-WORKAREA.                                                      
           05  COMMIT-SQLCA              PIC  X(122).                           
           05  COMMIT-RETURN             PIC S9(009) COMP.                      
               88  COMMIT-OK                  VALUE +0.                         
               88  COMMIT-AB                  VALUE -999 THRU -1                
                                                +1   THRU +999.                 
           05  W-COMMIT-CNT              PIC  9(009) COMP-3 VALUE 0.            
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
           EJECT                                                        10840000
      ***************************************************************** 10850000
       PROCEDURE DIVISION.                                              10860000
      ***************************************************************** 10870000
           DISPLAY 'CAT761P - READS CAT761A DELETES ROW IN VTRNFRAU'.   10880000
           DISPLAY 'THIS IS PROGRAM MAY BE RESTARTED'.                  10910000
                                                                        10920000
           COPY MSGCOBO.                                                10930000
                                                                        10940000
           PERFORM INITIAL-ROUTINE.                                     10950000
                                                                        10960000
           PERFORM PROCESS-ROUTINE THRU PROCESS-EXIT                    10970000
              UNTIL ACATACTF-END-OF-FILE.                                       
                                                                        10980000
           PERFORM ENDJOB-ROUTINE.                                      10990000
                                                                        11000000
           GOBACK.                                                      11010000
                                                                        11020000
           EJECT                                                        11030000
      *****************                                                 11040000
       PROCESS-ROUTINE.                                                 11050000
      *****************                                                 11060000
           READ ACATACTF INTO ACATACTF-RECORD                           11070000
              AT END                                                            
                SET ACATACTF-END-OF-FILE TO TRUE                                
                GO TO PROCESS-EXIT                                              
           END-READ.                                                            
                                                                        13850000
           MOVE ZERO TO WS-ABEND-CTR.                                   05140000
                                                                                
       PROCESS-DELETE-LOOP.                                                     
           IF WS-ABEND-CTR > +10                                        05140000
              GO TO SQL-ERROR-ROUTINE.                                          
                                                                                
           EXEC SQL                                                     13990000
              DELETE FROM VTRNFRAU                                      14000000
                 WHERE                                                          
                    CLIENT_NBR       = :ACATACTF-CLIENT-NBR             23118100
                AND ACAT_CONTROL_NBR = :ACATACTF-ACAT-CTL-NBR           23118300
                AND TRANS_TYPE_CD    = 'A'                              23118500
           END-EXEC.                                                    07660000
                                                                        14020000
           MOVE SQLCODE TO WS-SQLCODE                                   14030000
                           WS-TI-SQLCODE                                14040000
                                                                        14050000
           EVALUATE SQLCODE                                             14060000
              WHEN +100                                                         
                 ADD  +1  TO WS-TI-NOT-DELETED                                  
              WHEN +0                                                           
                 ADD  +1  TO WS-TI-DELETED                                      
                 PERFORM SQL-COMMIT                                             
              WHEN -911                                                         
                  ADD 1 TO WS-ABEND-CTR                                         
                  DISPLAY 'TRYING DELETE AGAIN ' WS-ABEND-CTR                   
                  GO TO PROCESS-DELETE-LOOP                                     
              WHEN OTHER                                                        
                 DISPLAY '================================== '                  
                 DISPLAY '**** ABEND TI-DELETE          **** '                  
                 DISPLAY '================================== '                  
                 DISPLAY ' CLIENT_NBR = ' WS-CLIENT                             
                 DISPLAY ' '                                                    
                 MOVE SQLCODE TO WS-SQLCODE                                     
                 DISPLAY 'TI DB2 DELETE FAILED ' WS-SQLCODE                     
                 PERFORM SQL-ERROR-ROUTINE                                      
           END-EVALUATE.                                                        
       PROCESS-EXIT. EXIT.                                              11050000
                                                                                
       SQL-COMMIT.                                                              
                                                                                
           EXEC SQL COMMIT                                                      
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO COMMIT-SQLCA                                         
           MOVE SQLCODE TO COMMIT-RETURN                                        
                                                                                
           IF  COMMIT-AB                                                        
               DISPLAY 'CAT761P:'                                               
                   'SQL COMMIT FAILED. COMMIT-RETURN= '                         
                    COMMIT-RETURN                                               
               DISPLAY 'COMMIT COUNT ' W-COMMIT-CNT                             
           ELSE                                                                 
               ADD 1 TO W-COMMIT-CNT                                            
           END-IF.                                                              
                                                                        14570000
           EJECT                                                                
      *****************                                                         
       INITIAL-ROUTINE.                                                         
      *****************                                                         
           OPEN INPUT ACATACTF.                                                 
           DISPLAY 'CAT761P: ACATACTF INPUT FOR OUTPUT. STATUS = '              
                                               ACATACTF-FILE-STATUS.            
           IF  ACATACTF-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT761P: ERROR OPENING ACATACTF'                        
               DISPLAY 'CAT761P: OPEN STATUS = ' ACATACTF-FILE-STATUS           
                            '.  OUTPUT-CNT = ' W-ACATACTF-CNT                   
               DISPLAY 'CAT761P: U3008 - ABENDING ON BAD FILE STATUS'           
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
           DISPLAY '*** PROGRAM CAT761P IS ABENDING!'                           
           DISPLAY '**** ABENDING SQLCODE = ' WS-SQLCODE                        
           DISPLAY ' '                                                          
                                                                                
           EXEC SQL  ROLLBACK  END-EXEC                                         
           CALL ABEND      USING ABEND-CODE.                                    
           EJECT                                                        31280000
      ****************                                                  31290000
       ENDJOB-ROUTINE.                                                  31300000
      ****************                                                  31310000
                                                                        31320000
           DISPLAY 'ACATACTF RECORDS READ ' W-ACATACTF-CNT.             29220025
           DISPLAY 'TI ROWS DELETED     ' WS-TI-DELETED                         
           DISPLAY 'TI NOT DELETED      ' WS-TI-NOT-DELETED                     
           CLOSE ACATACTF                                               31380025
           DISPLAY 'CAT761P: ACATACTF CLOSED. STATUS = '                31390025
                                             ACATACTF-FILE-STATUS.      31400025
                                                                        31410012
                                                                        31890000
           DISPLAY ' '                                                  31900000
           DISPLAY '*************************'                          31910000
           DISPLAY '* END OF CAT761P PROGRAM *'                         31920000
           DISPLAY '*************************'                          31930000
           DISPLAY ' '                                                  31940000
           .                                                            31960000
