000001* PDX    - CAT570   C0256957 11/13/07 10:29:01 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         CAT820DB
       PROGRAM-ID.  CAT570.                                             CAT820DB
                                                                        CAT820DB
      ***************************************************************** CAT820DB
      * THIS PROGRAM CONTAINS DB2.                                    * CAT820DB
      ***************************************************************** CAT820DB
      *-------------------------------------------------------------*   CAT820DB
      *  THE PURPOSE OF THIS PROGRAM IS TO READ THRU N/A PURGE FILE,    CAT820DB
      *  LOOK UP ACCOUNT NUMBER ON THE ACTIVE TRANSFER, AND PASS THRU   CAT820DB
      *  THE N/A RECORDS THAT DO NOT MATCH.                             CAT820DB
      *-------------------------------------------------------------*   CAT820DB
                                                                        CAT820DB
       ENVIRONMENT DIVISION.                                            CAT820DB
                                                                        CAT820DB
       INPUT-OUTPUT SECTION.                                            CAT820DB
       FILE-CONTROL.                                                    CAT820DB
                                                                        CAT820DB
           SELECT NAINPUT-FILE       ASSIGN TO NAINPUT.                 CAT820DB
           SELECT NAOUTPUT-FILE      ASSIGN TO NAOUTPUT.                        
                                                                        CAT820DB
       DATA DIVISION.                                                   CAT820DB
       FILE SECTION.                                                    CAT820DB
       FD NAINPUT-FILE                                                  CAT820DB
           RECORDING MODE IS F                                          CAT820DB
           LABEL RECORDS ARE STANDARD                                   CAT820DB
           BLOCK CONTAINS 0 RECORDS.                                    CAT820DB
       01 NAINPUT-REC                            PIC X(80).             CAT820DB
                                                                        CAT820DB
       FD NAOUTPUT-FILE                                                 00200001
           RECORDING MODE IS F                                          CAT820DB
           LABEL RECORDS ARE STANDARD                                   CAT820DB
           BLOCK CONTAINS 0 RECORDS.                                    00210001
       01 NAOUTPUT-REC                           PIC X(80).             CAT820DB
      ****************************************************************  CAT820DB
           EJECT                                                        CAT820DB
       WORKING-STORAGE SECTION.                                         CAT820DB
           COPY PDXIDCOB.                                               CAT820DB
                                                                        CAT820DB
       01  FILE-STATUS-FIELDS.                                          CAT820DB
           05  NAINPUT-FILE-STATUS           PIC X    VALUE 'N'.        CAT820DB
               88  EOF-NAINPUT                     VALUE 'Y'.           CAT820DB
                                                                        CAT820DB
       01  WORK-FIELDS.                                                 CAT820DB
           05  PGM-NAME                PIC X(8)  VALUE 'CAT570'.        CAT820DB
           05  WS-CLIENT-NBR           PIC X(04).                               
           05  WS-BRANCH-CD            PIC X(3).                                
           05  WS-ACCT-CD              PIC X(5).                                
           05  FILLER                  PIC X(008) VALUE 'INPUTCNT'.     CAT820DB
           05  TOT-RECS-IN-CTR         PIC 9(7) COMP-3 VALUE ZERO.      CAT820DB
           05  TOT-RECS-MATCHED        PIC 9(7) COMP-3 VALUE ZERO.      CAT820DB
           05  TOT-RECS-OUT-CTR        PIC 9(7) COMP-3 VALUE ZERO.      CAT820DB
           05  ABEND-CD                PIC 9(4) COMP SYNC VALUE 0.      CAT820DB
           05  DUMP-SW                 PIC X(1) VALUE 'D'.              CAT820DB
                                                                                
           COPY STUBCPY.                                                        
                                                                        CAT820DB
           EJECT                                                        CAT820DB
      * COPYBOOK FOR INPUT FILE                                                 
           COPY NADELREC.                                                       
                                                                                
           EJECT                                                        CAT820DB
      *---------------------------------------------------------------- CAT820DB
      *  DB2 DATABASE WORKAREA.                                         CAT820DB
      *---------------------------------------------------------------- CAT820DB
           EXEC SQL                                                     CAT820DB
           INCLUDE SQLCA                                                CAT820DB
           END-EXEC                                                     CAT820DB
                                                                        CAT820DB
      *---------------------------------------------------------------- CAT820DB
      * DB2 ERROR MESSAGE AREA                                         *CAT820DB
      *---------------------------------------------------------------- CAT820DB
       01  DSNTIAR                       PIC X(008) VALUE 'DSNTIAR'.    CAT820DB
       01  W-DB2-MESSAGE-AREA.                                          CAT820DB
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.    CAT820DB
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES     CAT820DB
                   INDEXED BY W-DB2-IDX.                                CAT820DB
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.     CAT820DB
                                                                        CAT820DB
       01  W-DB2-WORKAREA.                                              CAT820DB
           05  W-DB2-TABLE-NAME          PIC  X(008).                   CAT820DB
           05  W-DB2-ACTION              PIC  X(008).                   CAT820DB
           05  W-DB2-SQLCODE             PIC ---9.                      CAT820DB
                                                                        CAT820DB
      *DCLGEN FOR ACTIVE ACAT TRANSFER                                  CAT820DB
           EXEC SQL                                                     CAT820DB
               INCLUDE VTRNFR                                           CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
      * DECLARE CURSOR TO OBTAIN TRANSFER FOR THIS CLIENT-BR-AC         CAT820DB
           EXEC SQL                                                     CAT820DB
              DECLARE VTRNFR_CRSR CURSOR FOR                            CAT820DB
                 SELECT                                                 CAT820DB
                    STTS_CD                                             CAT820DB
                   ,ACAT_CONTROL_NBR                                    CAT820DB
                 FROM VTRNFR                                            CAT820DB
              WHERE CLIENT_NBR  = :WS-CLIENT-NBR                        CAT820DB
                AND BRANCH_CD   = :WS-BRANCH-CD                         CAT820DB
                AND ACCT_CD     = :WS-ACCT-CD                           CAT820DB
                AND NOT STTS_CD = '600'                                 CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
           EJECT                                                        CAT820DB
       PROCEDURE DIVISION.                                              CAT820DB
           COPY MSGCOBO.                                                CAT820DB
                                                                        CAT820DB
           OPEN INPUT  NAINPUT-FILE.                                    CAT820DB
           OPEN OUTPUT NAOUTPUT-FILE.                                   CAT820DB
                                                                                
           PERFORM 1000-READ-NNA-RTN THRU 1000-EXIT                             
               UNTIL EOF-NAINPUT.                                               
                                                                                
           CLOSE NAINPUT-FILE.                                          CAT820DB
           CLOSE NAOUTPUT-FILE.                                         CAT820DB
           DISPLAY 'RECORDS READ ' TOT-RECS-IN-CTR                              
           DISPLAY 'RECORDS DROP ' TOT-RECS-MATCHED                             
           DISPLAY 'RECORDS OUT  ' TOT-RECS-OUT-CTR                             
           GOBACK.                                                              
                                                                                
       1000-READ-NNA-RTN.                                                       
           READ NAINPUT-FILE INTO NADEL-RECORD                                  
              AT END                                                            
                SET EOF-NAINPUT  TO  TRUE                                       
                GO TO 1000-EXIT                                                 
              NOT AT END                                                        
                ADD +1 TO TOT-RECS-IN-CTR                                       
           END-READ.                                                            
                                                                                
           IF NADEL-CLT-BR-ACCT = LOW-VALUES                                    
               DISPLAY ' FOUND HEADER RECORD ON INPUT FILE'                     
               DISPLAY NADEL-RECORD                                             
               WRITE NAOUTPUT-REC  FROM  NADEL-RECORD                           
               ADD 1  TO  TOT-RECS-OUT-CTR                                      
           ELSE                                                                 
               PERFORM 2000-PROCESS-NAINPUT-RTN THRU 2000-EXIT          CAT820DB
           END-IF.                                                              
       1000-EXIT. EXIT.                                                         
                                                                        CAT820DB
           EJECT                                                        CAT820DB
       2000-PROCESS-NAINPUT-RTN.                                        CAT820DB
******* USE CURSOR TO OBTAIN KEYS TO TIF; THERE SHOULD ONLY BE ONE TIF          
******* FOR THIS CLIENT-BRANCH-ACCOUNT ON THE ACTIVE TRANSFER TABLE.            
                                                                        CAT820DB
           MOVE '0'            TO  WS-CLIENT-NBR (1 : 1).               CAT820DB
           MOVE NADEL-CLT-BR-ACCT(1 : 3) TO WS-CLIENT-NBR (2 : 3).      CAT820DB
           MOVE NADEL-BR       TO WS-BRANCH-CD.                         CAT820DB
           MOVE NADEL-ACCT     TO WS-ACCT-CD.                           CAT820DB
                                                                                
           EXEC SQL OPEN VTRNFR_CRSR END-EXEC                           CAT820DB
           IF SQLCODE NOT = +0                                          CAT820DB
              MOVE 2000 TO ABEND-CD                                     CAT820DB
              PERFORM 8500-SQL-ERROR THRU 8500-EXIT                     CAT820DB
           END-IF.                                                      CAT820DB
                                                                        CAT820DB
           EXEC SQL                                                     CAT820DB
               FETCH VTRNFR_CRSR                                        CAT820DB
                    INTO                                                CAT820DB
                   :DCLVTRNFR.STTS-CD                                   CAT820DB
                  ,:DCLVTRNFR.ACAT-CONTROL-NBR                          CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
           EVALUATE SQLCODE                                             CAT820DB
              WHEN +100                                                 CAT820DB
                 WRITE NAOUTPUT-REC  FROM  NADEL-RECORD                         
                 ADD 1  TO  TOT-RECS-OUT-CTR                                    
              WHEN +0                                                   CAT820DB
                 ADD 1  TO  TOT-RECS-MATCHED                            CAT820DB
                 DISPLAY 'FOUND ACTIVE TRANSFER FOR '                   CAT820DB
                     WS-CLIENT-NBR ' '  NADEL-BR '-' NADEL-ACCT         CAT820DB
                       ' ' ACAT-CONTROL-NBR  ' STATUS ' STTS-CD                 
              WHEN OTHER                                                CAT820DB
                    MOVE 2200 TO ABEND-CD                               CAT820DB
                    PERFORM 8500-SQL-ERROR THRU 8500-EXIT               CAT820DB
           END-EVALUATE.                                                CAT820DB
                                                                        CAT820DB
           EXEC SQL                                                     CAT820DB
              CLOSE VTRNFR_CRSR                                         CAT820DB
           END-EXEC.                                                    CAT820DB
                                                                        CAT820DB
       2000-EXIT. EXIT.                                                 CAT820DB
                                                                        CAT820DB
       8500-SQL-ERROR      SECTION.                                     CAT820DB
           DISPLAY ' '                                                  CAT820DB
           DISPLAY '8500-SQL-ERROR'                                     CAT820DB
                  ' INFILE CNT = ' TOT-RECS-IN-CTR                      CAT820DB
                                                                        CAT820DB
           DISPLAY ' '                                                  CAT820DB
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                  CAT820DB
                                    W-DB2-MESSAGE-LEN.                  CAT820DB
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                        CAT820DB
             UNTIL W-DB2-IDX GREATER THAN 12                            CAT820DB
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES              CAT820DB
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)               CAT820DB
                   END-IF                                               CAT820DB
           END-PERFORM.                                                 CAT820DB
           DISPLAY ' '                                                  CAT820DB
                                                                        CAT820DB
           DISPLAY 'CAT570: U3999 - ABENDING ON BAD DB2 STATUS'         CAT820DB
           DISPLAY 'CAT570: PROGRAM ENDED ABNORMALLY'                   CAT820DB
           MOVE +3999 TO ABEND-CD                                       CAT820DB
           CALL  ABEND  USING ABEND-CD.                                 CAT820DB
                                                                        CAT820DB
       8500-EXIT. EXIT.                                                 CAT820DB
