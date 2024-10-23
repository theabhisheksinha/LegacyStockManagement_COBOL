000001* PDX    - CAT512   C0255520 10/15/07 10:23:04 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         CAT511  
       PROGRAM-ID.  CAT512.                                             CAT511  
      ***************************************************************** CAT511  
      * CAT512 - SPLIT MRO FILES BY CLEARING NUMBER (PARM).           * CAT511  
      *                                                               * CAT511  
      * INPUT  - NSCC ACATS TRANSACTION FILE   - GDG                  * CAT511  
      *                                                               * CAT511  
      * OUTPUT - EXTRACT   FILE BY BROKER      - GDG                  * CAT511  
      *                                                               * CAT511  
      ***************************************************************** CAT511  
      * 10/12/07 DJ     NEW PROGRAM                                   * CAT511  
      ***************************************************************** CAT511  
      /                                                                 CAT511  
       ENVIRONMENT DIVISION.                                            CAT511  
       INPUT-OUTPUT SECTION.                                            CAT511  
       FILE-CONTROL.                                                    CAT511  
                                                                        CAT511  
           SELECT INFILE           ASSIGN       TO INFILE               CAT511  
                                   FILE STATUS  IS INFILE-STAT.         CAT511  
           SELECT OUTFILE          ASSIGN       TO OUTFILE              CAT511  
                                   FILE STATUS  IS OUTFILE-STAT.        CAT511  
      /                                                                 CAT511  
       DATA DIVISION.                                                   CAT511  
       FILE SECTION.                                                    CAT511  
       FD  INFILE                                                       CAT511  
           RECORDING MODE IS V                                          CAT511  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT511  
              DEPENDING ON W-REC-LEN-IN                                 CAT511  
           BLOCK CONTAINS 0 RECORDS.                                    CAT511  
                                                                        CAT511  
       01  LONG-RECORD-IN                PIC X(4000).                           
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:== BY ==INFILE==.        CAT511  
                                                                        CAT511  
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCMHDR==.      CAT511  
                                                                        CAT511  
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCMTRL==.      CAT511  
                                                                        CAT511  
       FD  OUTFILE                                                      CAT511  
           RECORDING MODE IS V                                          CAT511  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT511  
              DEPENDING ON W-REC-LEN-OUT                                CAT511  
           BLOCK CONTAINS 0 RECORDS.                                    CAT511  
                                                                        CAT511  
       01  LONG-RECORD-OUT               PIC X(4000).                           
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:== BY ==OUTFILE==.       CAT511  
                                                                        CAT511  
      /                                                                 CAT511  
       WORKING-STORAGE SECTION.                                         CAT511  
       COPY PDXIDCOB.                                                   CAT511  
                                                                        CAT511  
       01  W-FIELDS.                                                    CAT511  
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT512'.    CAT511  
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.         CAT511  
               88 NOT-FIRST-TIME                     VALUE '1'.         CAT511  
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.         CAT511  
               88 END-OF-INFILE                      VALUE '1'.         CAT511  
           05  INFILE-STAT               PIC  X(002).                   CAT511  
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.    CAT511  
               88 INFILE-END-OF-FILE     VALUE '10'.                    CAT511  
               88 INFILE-EMPTY-MISSING VALUE '35'.                      CAT511  
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.         CAT511  
               88 INFILE-DATE-FOUND                  VALUE 'Y'.         CAT511  
           05  OUTFILE-STAT              PIC  X(002).                   CAT511  
               88 OUTFILE-OKAY           VALUE '00' THRU '09', '97'.    CAT511  
               88 OUTFILE-END-OF-FILE    VALUE '10'.                    CAT511  
               88 OUTFILE-EMPTY-MISSING VALUE '35'.                     CAT511  
           05  W-INFILE-CNT              PIC  9(011) COMP-3 VALUE 0.    CAT511  
           05  FILLER                    PIC  X(008) VALUE 'OTPUTCNT'.  CAT511  
           05  W-OUTFILE-CNT             PIC  9(011) COMP-3 VALUE 0.    CAT511  
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.          
           05  W-REC-LEN-IN              PIC  9(005) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.          
           05  W-REC-LEN-OUT             PIC  9(005) COMP-3 VALUE 0.            
                                                                        CAT511  
DJ0002***===> COBOL LE                                                          
DJ0002 01  W-ABEND-AREA.                                                        
DJ0002     05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
DJ0002 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.           
DJ0002     COPY STUBCPY.                                                        
DJ0002***<=== COBOL LE                                                          
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.   CAT511  
      /                                                                 CAT511  
      ***************************************************************** CAT511  
      *    LINKAGE SECTION                                            * CAT511  
      ***************************************************************** CAT511  
       LINKAGE SECTION.                                                 CAT511  
       01  L-JCL-PARMS.                                                 CAT511  
           05  PARMLENGTH                PIC S9(004) COMP SYNC.         CAT511  
           05  L-BROKER-NBR              PIC  X(004).                   CAT511  
                                                                        CAT511  
       PROCEDURE DIVISION USING L-JCL-PARMS.                            CAT511  
      *                         ===========                             CAT511  
       0000-MAIN SECTION.                                               CAT511  
           DISPLAY 'CAT512 - SPLIT NSCC/SIAC ACATS TRANSACTIONS'        CAT511  
           DISPLAY '         INPUT=BZZZ.CAT510.ACATTRAN'                CAT511  
           DISPLAY '         CREATE A FILE FOR SPECIFIC CLIENT'         CAT511  
           DISPLAY ' '.                                                 CAT511  
           COPY MSGCOBO.                                                CAT511  
           DISPLAY ' '.                                                 CAT511  
                                                                        CAT511  
           PERFORM 1000-INIT           THRU 1000-EXIT.                  CAT511  
                                                                        CAT511  
           PERFORM 2100-PROCESS-RTN    THRU 2100-EXIT.                  CAT511  
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                  CAT511  
                                                                        CAT511  
           GOBACK.                                                      CAT511  
      /                                                                 CAT511  
       1000-INIT SECTION.                                               CAT511  
                                                                        CAT511  
                                                                        CAT511  
           DISPLAY ' '.                                                 CAT511  
           DISPLAY 'CAT512: L-BROKER-NBR     = '                        CAT511  
                            L-BROKER-NBR                                CAT511  
                                                                        CAT511  
           OPEN INPUT INFILE.                                           CAT511  
           DISPLAY 'CAT512: INFILE   OPENED FOR INPUT.  STATUS = '      CAT511  
                                               INFILE-STAT.             CAT511  
                                                                        CAT511  
           IF  INFILE-OKAY                                              CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT512: ERROR OPENING INFILE'                   CAT511  
               DISPLAY 'CAT512: OPEN STATUS = ' INFILE-STAT             CAT511  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT511  
               DISPLAY 'CAT512: U3001 - ABENDING ON BAD FILE STATUS'    CAT511  
               MOVE +3001    TO ABEND-CODE                              CAT511  
               CALL ABEND USING ABEND-CODE                              CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           OPEN OUTPUT OUTFILE.                                         CAT511  
           DISPLAY 'CAT512: OUTFILE  OPENED FOR OUTPUT. STATUS = '      CAT511  
                                               OUTFILE-STAT.            CAT511  
                                                                        CAT511  
           IF  OUTFILE-OKAY                                             CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT512: ERROR OPENING OUTFILE'                  CAT511  
               DISPLAY 'CAT512: OPEN STATUS = ' OUTFILE-STAT            CAT511  
                            '.  INPUT-CNT = ' W-OUTFILE-CNT             CAT511  
               DISPLAY 'CAT512: U3002 - ABENDING ON BAD FILE STATUS'    CAT511  
               MOVE +3002    TO ABEND-CODE                              CAT511  
               CALL ABEND USING ABEND-CODE                              CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
       1000-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       2100-PROCESS-RTN.                                                CAT511  
                                                                        CAT511  
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                       CAT511  
                                                                        CAT511  
           IF  END-OF-INFILE                                            CAT511  
               GO TO 2100-EXIT                                          CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  NSCCMHDR-REC-TYPE = '1'                                  CAT511  
                MOVE W-REC-LEN-IN TO W-REC-LEN-OUT                              
                MOVE INFILE-RECORD (1 : W-REC-LEN-IN) TO                        
                     OUTFILE-RECORD (1 : W-REC-LEN-OUT)                         
                WRITE OUTFILE-RECORD                                            
                ADD  1                  TO W-OUTFILE-CNT                CAT511  
           END-IF.                                                              
                                                                        CAT511  
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                       CAT511  
              UNTIL END-OF-INFILE                                               
                OR (NSCCMHDR-REC-TYPE = 'H'                                     
                AND NSCCMHDR-BROKER-CLR-NBR = L-BROKER-NBR).            CAT511  
                                                                                
           IF  END-OF-INFILE                                            CAT511  
               GO TO 2100-EXIT                                          CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           PERFORM UNTIL END-OF-INFILE                                  CAT511  
             OR NSCCMHDR-REC-TYPE = 'T'                                         
                MOVE W-REC-LEN-IN TO W-REC-LEN-OUT                              
                MOVE INFILE-RECORD (1 : W-REC-LEN-IN) TO                        
                     OUTFILE-RECORD (1 : W-REC-LEN-OUT)                         
                WRITE OUTFILE-RECORD                                            
                ADD  1                  TO W-OUTFILE-CNT                CAT511  
                PERFORM 3000-READ-INPUT THRU 3000-EXIT                  CAT511  
           END-PERFORM.                                                         
                                                                        CAT511  
           IF  END-OF-INFILE                                            CAT511  
               GO TO 2100-EXIT                                          CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           IF  NSCCMHDR-REC-TYPE = 'T'                                  CAT511  
                MOVE W-REC-LEN-IN TO W-REC-LEN-OUT                              
                MOVE INFILE-RECORD (1 : W-REC-LEN-IN) TO                        
                     OUTFILE-RECORD (1 : W-REC-LEN-OUT)                         
                WRITE OUTFILE-RECORD                                            
                ADD  1                  TO W-OUTFILE-CNT                CAT511  
           END-IF.                                                              
       2100-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       3000-READ-INPUT.                                                 CAT511  
                                                                        CAT511  
           IF  END-OF-INFILE                                            CAT511  
               GO 3000-EXIT                                             CAT511  
           END-IF.                                                      CAT511  
                                                                        CAT511  
           READ INFILE                                                  CAT511  
                AT END                                                  CAT511  
                   MOVE '1'              TO END-OF-INFILE-SW            CAT511  
                   DISPLAY 'CAT512: END OF INPUT REACHED'               CAT511  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT511  
                   GO TO 3000-EXIT                                      CAT511  
           END-READ.                                                    CAT511  
                                                                        CAT511  
           ADD  1                        TO W-INFILE-CNT.               CAT511  
                                                                        CAT511  
           IF  INFILE-OKAY                                              CAT511  
               CONTINUE                                                 CAT511  
           ELSE                                                         CAT511  
               DISPLAY 'CAT512: ERROR READING INFILE'                   CAT511  
               DISPLAY 'CAT512: READ STATUS = ' INFILE-STAT             CAT511  
                            '.  INPUT-CNT = ' W-INFILE-CNT              CAT511  
               DISPLAY 'CAT512: U3008 - ABENDING ON BAD FILE STATUS'    CAT511  
               MOVE +3008 TO ABEND-CODE                                 CAT511  
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                      CAT511  
                                                                        CAT511  
       3000-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
      /                                                                 CAT511  
       9000-CLOSE-ROUTINE SECTION.                                      CAT511  
                                                                        CAT511  
           CLOSE INFILE                                                 CAT511  
           CLOSE OUTFILE                                                CAT511  
           DISPLAY 'CAT512: OUTFILE  CLOSED. STATUS = '                 CAT511  
                                             OUTFILE-STAT.              CAT511  
           DISPLAY 'CAT512: INFILE     INPUT  COUNT = '                 CAT511  
                                                   W-INFILE-CNT         CAT511  
           DISPLAY 'CAT512: OUTFILE    OUTPUT COUNT = '                 CAT511  
                                                   W-OUTFILE-CNT        CAT511  
           DISPLAY ' '.                                                 CAT511  
           DISPLAY 'CAT512: PROGRAM ENDED SUCCESSFULLY'.                CAT511  
                                                                        CAT511  
       9000-EXIT.                                                       CAT511  
           EXIT.                                                        CAT511  
