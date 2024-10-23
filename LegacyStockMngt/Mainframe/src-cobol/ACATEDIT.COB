000001* PDX    - ACATEDIT C0109165 07/09/98 11:20:52 TBLAMUR            00001000
000100 ID DIVISION.                                                     00010000
000200 PROGRAM-ID. ACATEDIT.                                            00020000
000250 AUTHOR.  LARRY MUREY.                                            00020000
000300*REMARKS.                                                         00030000
      * THIS IS A CICS/COBOL VERSION OF EDITMOD.                                
      * WILL EDIT NUMERIC FIELD UP TO 9(18).9(18).                              
      * OTHER FUNCTIONS CAN BE ADDED LATER AS NEEDED.                           
      *   INPUT/OUTPUT (COMMAREA) IS IDENTICAL TO EDITMOD.                      
      *  DO NOT USE ANY OTHER FUNCTIONS OTHER THAM "D" (DECIMAL)                
      *                                                                         
                                                                                
000300 ENVIRONMENT DIVISION.                                            00030000
000400 DATA DIVISION.                                                   00040000
000500                                                                  00050000
000600 WORKING-STORAGE SECTION.                                         00060000
001300 77  OLMICR-DATASET              PIC X(08) VALUE 'OLMICR'.        00140002
       77  WS-AMT-OUT-DISPL            PIC S9(04) COMP.                         
       77  WS-NUM-DISPL                PIC S9(04) COMP.                         
       77  WS-COMMA-DISPL              PIC S9(04) COMP.                         
       77  WS-AMT-DEC-DISPL            PIC S9(04) COMP.                         
       77  WS-RET-CODE-DISPL           PIC S9(04) COMP.                         
       77  WS-NUM-LAST-DISPL           PIC S9(04) COMP.                         
       77  WS-PARM-LAST-BYTE-DISPL     PIC S9(04) COMP.                         
       77  WS-NUM-DIGITS               PIC S9(04) COMP.                         
       77  WS-DIGIT-COUNT              PIC S9(04) COMP VALUE ZERO.              
       77  WS-DIGITS-ALLOWED           PIC S9(04) COMP VALUE ZERO.              
       77  WS-DEC-DIGIT-COUNT          PIC S9(04) COMP VALUE ZERO.              
       77  WS-DIGITS-FOLLOW-COMMA-COUNT PIC S9(04) COMP VALUE ZERO.             
       77  WS-CALC-YEAR                PIC 99.                                  
       77  SUB                         PIC S9(04) COMP.                         
       77  SUB2                        PIC S9(04) COMP.                         
       77  SUB3                        PIC S9(04) COMP.                         
                                                                                
       01  WS-EDITMOD-WORK-AREA.                                                
           05  TWA-CLIENT-NO-X.                                         00850002
               09 TWA-CLIENT-NO-9            PIC 9(03).                 00850002
                                                                                
       01  WS-FLAGS.                                                            
           05  WS-STOP-LOOP-FLAG       PIC X(01) VALUE 'N'.                     
               88 STOP-LOOP            VALUE 'Y'.                               
           05  WS-NEGATIVE-NUM-FLAG    PIC X(01) VALUE 'N'.                     
               88 NEGATIVE-NUM         VALUE 'Y'.                               
           05  WS-POSITIVE-NUM-FLAG    PIC X(01) VALUE 'N'.                     
               88 POSITIVE-NUM         VALUE 'Y'.                               
           05  WS-COMMA-FLAG           PIC X(01) VALUE 'N'.                     
               88 WS-COMMA             VALUE 'Y'.                               
           05  WS-COMMA-FOUND-FLAG     PIC X(01) VALUE 'N'.                     
               88 WS-COMMA-FOUND       VALUE 'Y'.                               
                                                                                
      * THE DECIMAL POINT IS ASSUMED BETWEEN BYTES 18 AND 19.                   
       01  WS-NUM-FIELD                PIC X(36) VALUE                  00070000
             '000000000000000000000000000000000000'.                            
       01  WS-NUM-FIELD-TABLE REDEFINES WS-NUM-FIELD.                   00070000
           05  WS-NUM-BYTE OCCURS 36 TIMES PIC X.                               
                                                                                
       01  WS-AMT-IN                   PIC X(36) VALUE SPACES.          00070000
       01  WS-AMT-IN-TABLE REDEFINES WS-AMT-IN.                         00070000
           05  WS-AMT-BYTE OCCURS 36 TIMES PIC X.                               
                                                                                
       01  WS-DEC-LEN.                                                          
           05  WS-DEC-LEN-9            PIC S9(3) COMP-3.                        
                                                                                
       01  WS-AMT-LAST-BYTE-AREA.                                               
           05  WS-AMT-LAST-BYTE-COMP   PIC S9(4) COMP VALUE ZERO.               
           05  FILLER REDEFINES WS-AMT-LAST-BYTE-COMP.                          
               07  FILLER              PIC X(01).                               
               07  WS-AMT-LAST-BYTE    PIC X(01).                               
                                                                                
       01   WS-ZERO-CHECK              PIC X(36) VALUE                          
             '000000000000000000000000000000000000'.                            
            EJECT                                                       01400002
       01 WS-DATE-WORK-AREA.                                                    
           05  WS-DATE-YYMMDD.                                                  
               07  WS-DATE-YY    PIC X(02).                                     
               07  WS-DATE-MM    PIC X(02).                                     
               07  WS-DATE-DD    PIC X(02).                                     
           05  WS-DATE-YYMMDD-9 REDEFINES WS-DATE-YYMMDD  PIC 9(06).            
                                                                                
       01  WS-DAYS-PER-MONTH-VALUES.                                            
           05  JAN           PIC 9(02) VALUE 31.                                
           05  FEB           PIC 9(02) VALUE 28.                                
           05  MAR           PIC 9(02) VALUE 31.                                
           05  APR           PIC 9(02) VALUE 30.                                
           05  MAY           PIC 9(02) VALUE 31.                                
           05  JUN           PIC 9(02) VALUE 30.                                
           05  JLY           PIC 9(02) VALUE 31.                                
           05  AUG           PIC 9(02) VALUE 31.                                
           05  SEP           PIC 9(02) VALUE 30.                                
           05  OCT           PIC 9(02) VALUE 31.                                
           05  NOV           PIC 9(02) VALUE 30.                                
           05  DEC           PIC 9(02) VALUE 31.                                
       01  WS-DAYS-PER-MONTH-TABLE REDEFINES                                    
               WS-DAYS-PER-MONTH-VALUES.                                        
            05  WS-MONTHLY-DAY-COUNT OCCURS 12 TIMES PIC X(02).                 
                                                                                
            EJECT                                                       01330002
       COPY OLMICUR.                                                            
            EJECT                                                       01330002
014700 LINKAGE SECTION.                                                 01470000
014800                                                                  01480000
014900 01  DFHCOMMAREA.                                                 01490000
      *** VALUE 'B' LAYOUT...                                                   
           05  WK-DATE-CODE               PIC X(01).                            
           05  WK-DATE-NUM-ITEM           PIC S9(03) COMP-3.                    
           05  WK-DATE-IN.                                                      
               07  WK-DATE-MM.                                                  
                   10 WK-DATE-MM-9        PIC 9(02).                            
               07  WK-DATE-SLASH-1        PIC X(01).                            
               07  WK-DATE-DD             PIC X(02).                            
               07  WK-DATE-SLASH-2        PIC X(01).                            
               07  WK-DATE-YY.                                                  
                   10 WK-DATE-YY-9        PIC 9(02).                            
           05  WK-DATE-OUT                PIC S9(7) COMP-3.                     
           05  WK-DATE-RET-CODE           PIC X(01) VALUE SPACE.                
           05  WK-DATE-HIGH-VALUE         PIC X(01).                            
014900 01  FILLER REDEFINES DFHCOMMAREA.                                01490000
      *** VALUE 'D' LAYOUT...                                                   
           05  WK-AMT-CODE                PIC X(01).                            
           05  WK-AMT-NUM-ITEM            PIC S9(03) COMP-3.                    
           05  WK-AMT-IN-LEN              PIC S9(03) COMP-3.                    
           05  WK-AMT-OUT-LEN             PIC S9(03) COMP-3.                    
           05  WK-AMT-IN                  PIC X(01).                            
           05  WK-AMT-NUM-LAST-BYTE REDEFINES WK-AMT-IN                         
                                          PIC S9(01).                           
       01  FILLER REDEFINES DFHCOMMAREA.                                        
           05  WK-TABLE-LOOKUP-CODE       PIC X(01).                            
           05  WK-NUM-OF-TABLE            PIC S9(03) COMP-3.                    
           05  WK-NAME-OF-LOOKUP-TABLE    PIC X(08) VALUE SPACE.                
           05  WK-NUM-OF-LOOKUP-ENTRY     PIC S9(03) COMP-3.                    
           05  WK-ISSUE-CURR-IN           PIC X(10).                            
           05  WK-ISSUE-CURR-OUT          PIC X(10).                            
           05  WK-ISSUE-CURR-RET-CODE     PIC X(01).                            
           05  WK-ISSUE-CURR-LAST-BYTE    PIC X(01).                            
                                                                                
           EJECT                                                                
                                                                                
021700 COPY TWACOMMN.                                                   01910002
021800     03 TWA-OLMI-AREA.                                            01920002
              05 TWA-B1-GROUP                 PIC X(01).                01930002
                                                                                
           EJECT                                                                
       PROCEDURE DIVISION.                                              01540000
015500                                                                  01550000
015600 0100-START.                                                      01560002
           IF WK-DATE-CODE = 'E'                                                
              GO TO 2000-CURR-EDIT-RTN.                                         
                                                                                
           IF EIBCALEN GREATER ZERO                                             
              COMPUTE WS-PARM-LAST-BYTE-DISPL = WK-AMT-IN-LEN                   
                                              + WK-AMT-OUT-LEN + 5              
           ELSE                                                                 
              MOVE +01 TO WS-PARM-LAST-BYTE-DISPL.                              
                                                                                
      * ASSURE HIGH-VALUE BYTE IS ON THE BOTTOM.                                
           IF EIBCALEN NOT GREATER ZERO                                         
           OR WK-AMT-IN(WS-PARM-LAST-BYTE-DISPL : 1) NOT = HIGH-VALUE           
              PERFORM BOTTOM-CHECK-ERROR-RTN.                                   
                                                                                
           MOVE WK-AMT-IN (1 : WK-AMT-IN-LEN) TO WS-AMT-IN.                     
                                                                                
      * FIND OUT IF COMMA OPTION IS IN EFFECT.                                  
           COMPUTE WS-COMMA-DISPL = WK-AMT-IN-LEN                               
                                  + WK-AMT-OUT-LEN + 3.                         
           IF WK-AMT-IN(WS-COMMA-DISPL : 1) = 'Y'                               
              SET WS-COMMA TO TRUE.                                             
                                                                                
           COMPUTE WS-AMT-DEC-DISPL = WK-AMT-IN-LEN                             
                                    + WK-AMT-OUT-LEN + 1.                       
           MOVE WK-AMT-IN(WS-AMT-DEC-DISPL : 2) TO WS-DEC-LEN.                  
                                                                                
           MOVE ZEROS TO WS-DIGITS-FOLLOW-COMMA-COUNT.                          
      * FIRST FIND THE DECIMAL POINT (IF ANY) OR THE ONES DIGIT.                
           MOVE +01 TO SUB.                                                     
           MOVE 'N' TO WS-STOP-LOOP-FLAG.                                       
           PERFORM UNTIL SUB GREATER +36 OR STOP-LOOP                           
              IF WS-AMT-BYTE(SUB) NOT LESS '0' AND NOT GREATER '9'              
                  ADD 1 TO WS-DIGIT-COUNT                                       
                  ADD +1 TO WS-DIGITS-FOLLOW-COMMA-COUNT                        
              ELSE                                                              
                 IF WS-COMMA-FOUND                                              
                 AND WS-DIGITS-FOLLOW-COMMA-COUNT NOT = 3                       
                    PERFORM ERROR-RTN                                           
                 ELSE                                                           
                    MOVE SPACE TO WS-COMMA-FOUND-FLAG                           
                 END-IF                                                         
                 IF  WS-AMT-BYTE(SUB) = '.'                                     
                 OR ((WS-AMT-BYTE(SUB) NOT GREATER SPACES                       
                  OR WS-AMT-BYTE(SUB) = '+' OR '-')                             
                 AND WS-DIGIT-COUNT GREATER ZERO)                               
                   SET STOP-LOOP TO TRUE                                        
                   IF WS-AMT-BYTE(SUB) = '-'                                    
                      SET NEGATIVE-NUM TO TRUE                                  
                   END-IF                                                       
                 ELSE                                                           
                    IF (WS-AMT-BYTE(SUB) = ','                                  
                    AND WS-DIGIT-COUNT GREATER ZERO)                            
                    AND WS-COMMA                                                
                      SET WS-COMMA-FOUND TO TRUE                                
                      MOVE ZERO TO WS-DIGITS-FOLLOW-COMMA-COUNT                 
                    ELSE                                                        
                       IF (WS-AMT-BYTE(SUB) = '+' OR '-')                       
                       AND (POSITIVE-NUM OR NEGATIVE-NUM)                       
                          PERFORM ERROR-RTN                                     
                       END-IF                                                   
                       IF WS-AMT-BYTE(SUB) = '-'                                
                          SET NEGATIVE-NUM TO TRUE                              
                       ELSE                                                     
                          IF WS-AMT-BYTE(SUB) = '+'                             
                             SET POSITIVE-NUM TO TRUE                           
                          ELSE                                                  
                             IF WS-AMT-BYTE(SUB) GREATER SPACES                 
                                PERFORM ERROR-RTN                               
                             END-IF                                             
                          END-IF                                                
                       END-IF                                                   
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
              IF NOT STOP-LOOP                                                  
                 ADD +01 TO SUB                                                 
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           COMPUTE WS-DIGITS-ALLOWED = WK-AMT-OUT-LEN - WS-DEC-LEN-9.           
           IF WS-DIGIT-COUNT GREATER +18                                        
           OR WS-DIGIT-COUNT GREATER WS-DIGITS-ALLOWED                          
              PERFORM ERROR-RTN.                                                
                                                                                
      * BACK OFF 1 FROM SUB TO POINT TO ONES FIELD.                             
      * MOVE BYTES TO THE LEFT OF DECIMAL POINT.                                
                                                                                
           SUBTRACT 1 FROM SUB GIVING SUB2.                                     
           MOVE +01 TO SUB3.                                                    
           MOVE 'N' TO WS-STOP-LOOP-FLAG.                                       
           IF WS-DIGIT-COUNT GREATER ZERO                                       
              PERFORM UNTIL SUB2 LESS +01 OR STOP-LOOP                          
                 IF WS-AMT-BYTE(SUB2) NOT LESS '0' AND NOT GREATER '9'          
                    IF SUB3 GREATER +19                                         
                       PERFORM ERROR-RTN                                        
                    END-IF                                                      
                    COMPUTE WS-NUM-DISPL = 19 - SUB3                            
                    END-COMPUTE                                                 
                    MOVE WS-AMT-BYTE(SUB2)                                      
                          TO WS-NUM-FIELD (WS-NUM-DISPL : 1)                    
                    ADD +1 TO SUB3                                              
                 ELSE                                                           
                    IF WS-AMT-BYTE(SUB2) GREATER SPACES                         
                       IF (WS-AMT-BYTE(SUB2) NOT = '-' AND '+' AND ',')         
                          PERFORM ERROR-RTN                                     
                       END-IF                                                   
                    ELSE                                                        
                       SET STOP-LOOP TO TRUE                                    
                    END-IF                                                      
                 END-IF                                                         
                 SUBTRACT 01 FROM SUB2                                          
              END-PERFORM.                                                      
                                                                                
      * SUB IS STILL POINTING TO THE END OF INTEGER OR DECIAL POINT             
      * MOVE NUMERIC BYTES AS FOUND.                                            
           IF WS-AMT-BYTE(SUB) = '.'                                            
              ADD 1 TO SUB                                                      
              MOVE +01 TO SUB3                                                  
              MOVE 'N' TO WS-STOP-LOOP-FLAG                                     
              PERFORM UNTIL SUB GREATER +36 OR STOP-LOOP                        
                 IF WS-AMT-BYTE(SUB) NOT LESS '0' AND NOT GREATER '9'           
                    IF SUB3 GREATER +18                                         
                       PERFORM ERROR-RTN                                        
                    END-IF                                                      
                    COMPUTE WS-NUM-DISPL = 18 + SUB3                            
                    END-COMPUTE                                                 
                    MOVE WS-AMT-BYTE(SUB)                                       
                       TO WS-NUM-FIELD (WS-NUM-DISPL : 1)                       
                    ADD +1 TO SUB3 WS-DEC-DIGIT-COUNT                           
                 ELSE                                                           
                    IF WS-AMT-BYTE(SUB) = '-'                                   
                    AND NOT NEGATIVE-NUM                                        
                    AND NOT POSITIVE-NUM                                        
                       SET NEGATIVE-NUM TO TRUE                                 
                    ELSE                                                        
                       IF WS-AMT-BYTE(SUB) = '+'                                
                       AND NOT NEGATIVE-NUM                                     
                       AND NOT POSITIVE-NUM                                     
                         SET POSITIVE-NUM TO TRUE                               
                       ELSE                                                     
                          IF WS-AMT-BYTE(SUB) GREATER ' '                       
                              PERFORM ERROR-RTN                                 
                          ELSE                                                  
                              SET STOP-LOOP TO TRUE                             
                          END-IF                                                
                       END-IF                                                   
                    END-IF                                                      
                 END-IF                                                         
                 ADD +1 TO SUB                                                  
              END-PERFORM.                                                      
                                                                                
           IF WS-DEC-DIGIT-COUNT GREATER WS-DEC-LEN-9                           
              PERFORM ERROR-RTN.                                                
                                                                                
      * AT THIS POINT SUB SHOULD BE BEYOND THE NUMBER, IF ANYTHING              
      * OTHER THAN SPACES ARE BACK THERE, ITS NG.                               
           IF SUB LESS +36                                                      
              ADD +01 TO SUB                                                    
              PERFORM UNTIL SUB GREATER +36                                     
                 IF WS-AMT-BYTE(SUB) GREATER SPACES                             
                    PERFORM ERROR-RTN                                           
                 END-IF                                                         
                 ADD +01 TO SUB                                                 
              END-PERFORM.                                                      
                                                                                
           COMPUTE WS-NUM-DIGITS = WK-AMT-OUT-LEN - WS-DEC-LEN-9.               
           COMPUTE WS-NUM-DISPL = +19 - WS-NUM-DIGITS.                          
           ADD +01 WK-AMT-IN-LEN GIVING WS-AMT-OUT-DISPL.                       
           MOVE WS-NUM-FIELD(WS-NUM-DISPL : WK-AMT-OUT-LEN)                     
                  TO WK-AMT-IN(WS-AMT-OUT-DISPL : WK-AMT-OUT-LEN).              
                                                                                
           IF NEGATIVE-NUM                                                      
NEQ 0      AND WK-AMT-IN(WS-AMT-OUT-DISPL : WK-AMT-OUT-LEN) NOT =               
                WS-ZERO-CHECK(1 : WK-AMT-OUT-LEN)                               
              COMPUTE WS-NUM-LAST-DISPL = WK-AMT-IN-LEN                         
                                        + WK-AMT-OUT-LEN                        
              MOVE WK-AMT-NUM-LAST-BYTE(WS-NUM-LAST-DISPL : 1)                  
                   TO WS-AMT-LAST-BYTE                                          
              COMPUTE WS-AMT-LAST-BYTE-COMP =                                   
                   WS-AMT-LAST-BYTE-COMP - 32                                   
              MOVE WS-AMT-LAST-BYTE TO                                          
                   WK-AMT-NUM-LAST-BYTE(WS-NUM-LAST-DISPL : 1).                 
                                                                                
           COMPUTE WS-RET-CODE-DISPL = WK-AMT-IN-LEN                            
                                     + WK-AMT-OUT-LEN + 4.                      
           MOVE SPACE TO WK-AMT-IN (WS-RET-CODE-DISPL : 1).                     
           EXEC CICS RETURN END-EXEC.                                   06880000
                                                                                
           EJECT                                                                
                                                                                
       BOTTOM-CHECK-ERROR-RTN.                                                  
      * THE LAST BYTE OF COMMAREA ACCORDING TO PASSED LENGTHS IS NOT            
      * HIGH VALUE AS EXPECTED. THE EIBCALEN IS THE MAXIMUM NUMBER OF           
      * BYTES IN THIS PASSED DSECT; HUNT BACKWARDS FOR THE END, AND             
      * WHEN FOUND, ASSUME THE PRIVIOUS BYTE IS THE RETURN CODE, AND            
      * SET THIS TO ERROR.                                                      
           IF EIBCALEN GREATER +1                                               
              MOVE EIBCALEN TO WS-PARM-LAST-BYTE-DISPL                          
              PERFORM UNTIL WS-PARM-LAST-BYTE-DISPL LESS 3                      
               OR WK-AMT-CODE(WS-PARM-LAST-BYTE-DISPL : 1) = HIGH-VALUE         
                 SUBTRACT 1 FROM WS-PARM-LAST-BYTE-DISPL                        
              END-PERFORM                                                       
              IF WK-AMT-CODE(WS-PARM-LAST-BYTE-DISPL : 1) = HIGH-VALUE          
                 SUBTRACT 1 FROM WS-PARM-LAST-BYTE-DISPL                        
                 IF WS-PARM-LAST-BYTE-DISPL GREATER ZERO                        
                    MOVE 'Y' TO WK-AMT-CODE(WS-RET-CODE-DISPL : 1).             
                                                                                
           EXEC CICS RETURN END-EXEC.                                   06880000
                                                                                
           EJECT                                                                
                                                                                
       ERROR-RTN.                                                               
           COMPUTE WS-RET-CODE-DISPL = WK-AMT-IN-LEN                            
                                     + WK-AMT-OUT-LEN + 4.                      
           MOVE 'Y' TO WK-AMT-IN (WS-RET-CODE-DISPL : 1).                       
           EXEC CICS RETURN END-EXEC.                                   06880000
                                                                                
           EJECT                                                                
       1000-DATE-EDIT-RTN.                                                      
                                                                                
      * ASSURE HIGH-VALUE BYTE IS ON THE BOTTOM.                                
           IF EIBCALEN NOT = +17                                                
           OR WK-DATE-HIGH-VALUE NOT = HIGH-VALUE                               
              PERFORM BOTTOM-CHECK-ERROR-RTN.                                   
                                                                                
           IF WK-DATE-MM NOT NUMERIC                                            
           OR WK-DATE-MM LESS '01' OR GREATER '12'                              
           OR WK-DATE-DD NOT NUMERIC                                            
           OR WK-DATE-DD LESS '01' OR GREATER '31'                              
           OR WK-DATE-YY NOT NUMERIC                                            
           OR (WK-DATE-SLASH-1 NOT = ' ' AND '/')                               
           OR (WK-DATE-SLASH-2 NOT = ' ' AND '/')                               
              PERFORM DATE-ERROR-RTN.                                           
                                                                                
      *** WHEN LEAP YEAR, ADD 1 DAY TO FEBRUARY.                                
           COMPUTE WS-CALC-YEAR = WK-DATE-YY-9 / 4.                             
           COMPUTE WS-CALC-YEAR = WS-CALC-YEAR * 4.                             
           IF WS-CALC-YEAR = WK-DATE-YY-9                                       
              ADD 1 TO FEB.                                                     
                                                                                
           IF WK-DATE-DD > WS-MONTHLY-DAY-COUNT(WK-DATE-MM-9)                   
              PERFORM DATE-ERROR-RTN.                                           
                                                                                
           MOVE WK-DATE-MM TO WS-DATE-MM.                                       
           MOVE WK-DATE-DD TO WS-DATE-DD.                                       
           MOVE WK-DATE-YY TO WS-DATE-YY.                                       
           MOVE WS-DATE-YYMMDD-9 TO WK-DATE-OUT.                                
           MOVE SPACES TO WK-DATE-RET-CODE.                                     
           EXEC CICS RETURN END-EXEC.                                   06880000
                                                                                
       DATE-ERROR-RTN.                                                          
           MOVE 'Y' TO WK-DATE-RET-CODE.                                        
           EXEC CICS RETURN END-EXEC.                                   06880000
                                                                                
           EJECT                                                                
       2000-CURR-EDIT-RTN.                                                      
                                                                                
      * ASSURE HIGH-VALUE BYTE IS ON THE BOTTOM.                                
           IF EIBCALEN NOT = +35                                                
           OR WK-ISSUE-CURR-LAST-BYTE NOT = HIGH-VALUE                          
              PERFORM BOTTOM-CHECK-ERROR-RTN.                                   
                                                                                
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                  02340002
           END-EXEC.                                                    02350002
                                                                                
           MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                               
                                                                                
           MOVE WK-ISSUE-CURR-IN(1 : 3) TO OLMI-CUR-NUM.                        
           IF OLMI-CUR-NUM = '000'                                              
             MOVE SPACE TO WK-ISSUE-CURR-RET-CODE                               
             IF TWA-B1-GROUP = 'C'                                              
120800          MOVE 'C$' TO WK-ISSUE-CURR-OUT                          10130002
             ELSE                                                               
120800          MOVE 'U$' TO WK-ISSUE-CURR-OUT                                  
           ELSE                                                         10130002
024600        EXEC CICS IGNORE CONDITION NOTOPEN                        02230002
024700                                  DISABLED                        02240002
024800                                  DSIDERR                         02250002
                                        NOTFND                          02250002
024900        END-EXEC                                                  02260002
              EXEC CICS READ DATASET(OLMICR-DATASET)                    09900002
                           RIDFLD(OLMI-CUR-NUM)                         09910002
                           INTO(OLMI-CUR-NAME-RECORD)                   09920002
              END-EXEC                                                  09930002
              IF EIBRESP = +0                                                   
                 IF WK-NAME-OF-LOOKUP-TABLE = 'CURTABL1'                        
                 AND OLMI-CUR-NUM NOT NUMERIC                                   
                     MOVE OLMI-CUR-NAME-RECORD(5 : 3)                           
                                    TO WK-ISSUE-CURR-OUT                        
                     MOVE SPACE TO WK-ISSUE-CURR-RET-CODE                       
                 ELSE                                                           
    ***** CURTBL2                                                               
                 IF WK-NAME-OF-LOOKUP-TABLE = 'CURTBL2'                         
                 AND OLMI-CUR-NUM NUMERIC                                       
                     MOVE OLMI-CUR-SYMBOL   TO WK-ISSUE-CURR-OUT                
                     MOVE SPACE TO WK-ISSUE-CURR-RET-CODE                       
                 ELSE                                                           
                    MOVE 'Y'   TO WK-ISSUE-CURR-RET-CODE                        
              ELSE                                                              
                 MOVE 'Y'   TO WK-ISSUE-CURR-RET-CODE.                          
                                                                                
           EXEC CICS RETURN END-EXEC.                                   06880000
                                                                                
           EJECT                                                                
069600 9990-END-PROGRAM.                                                06960057
069700     STOP RUN.                                                    06970000
