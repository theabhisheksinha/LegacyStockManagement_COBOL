000001* PDX    - ACAT00NA C0350140 01/23/14 07:04:56 TBCHKOP            00001000
CSG001* SSR 93855 CORRECT NAME AND ADDRESS VALUES FOR INVALID CHARACTERS        
000001* PDX    - ACAT00NA C0231507 06/23/06 08:24:10 TBLAMUR            00001000
000001* PDX    - ACAT00NA C0166975 11/14/01 14:25:25 TBLAMUR            00001000
000001* PDX    - ACAT00NA C0121768 02/12/99 17:54:42 TBLAMUR            00001000
000001* PDX    - ACAT00NA C0120842 01/25/99 08:39:45 TBLAMUR            00001000
000001* PDX    - ACAT00NA C0119769 12/24/98 11:48:51 TBLAMUR            00001000
000001* PDX    - ACAT00NA C0109165 10/19/98 16:52:06 TBLAMUR            00001000
000100 ID DIVISION.                                                     00010000
000200 PROGRAM-ID. ACAT00NA.                                            00020000
000250 AUTHOR.  LARRY MUREY.                                            00020000
000300*REMARKS.                                                         00030000
      * ACAT NAME AND ADDRESS READS.                                            
000500                                                                  00050000
000300 ENVIRONMENT DIVISION.                                            00030000
000400 DATA DIVISION.                                                   00040000
000500                                                                  00050000
000600 WORKING-STORAGE SECTION.                                         00060000
           COPY PDXIDCOB.                                                       
                                                                                
LRMXXX 01  WS-CALLED-EIBCALEN         PIC S9(4) COMP.                           
CSG001*                                                                         
CSG001 01  WS-WORKING-STORAGE-AREA.                                             
CSG001     10 WS-SUB1                 PIC S9(03) COMP-3.                        
CSG001     10 WS-SUB2                 PIC S9(03) COMP-3.                        
CSG001     10 WS-ACATNAIO-NAME        PIC X(30) VALUE SPACES.                   
CSG001     10 WS-EDIT-CHAR-AREA       PIC X(01).                                
CSG001        88 WS-VALID-CHARACTER      VALUE                                  
CSG001         'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N'          
CSG001         'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z'                  
CSG001         'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n'          
CSG001         'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'                  
CSG001         '1' '2' '3' '4' '5' '6' '7' '8' '9' '0'                          
CSG001         '!' '@' '#' '$' '%' '&' '*'                                      
CSG001         '(' ')' '-' '_' '+' '=' '~' '{' '}'                              
CSG001         '' '\' ':' ';' '"' '<' '>'                                      
CSG001         ',' '.' '?' '/' ' ' '`' QUOTE.                                   
CSG001* Valid character set is from ACATS-User-Guide (Section 19                
CSG001* "Special Characters") of DTCC.                                          
CSG001     10 WS-JUST-LEFT-FLAG             PIC X(01).                          
CSG001        88 WS-JUST-LEFT-DONE              VALUE 'Y'.                      
CSG001        88 WS-JUST-LEFT-NOT-DONE          VALUE 'N'.                      
CSG001     10 WS-EDIT-ACATNAIO-NAME-FLAG    PIC X(01).                          
CSG001        88 WS-EDIT-ACATNAIO-NAME-YES      VALUE 'Y'.                      
CSG001        88 WS-EDIT-ACATNAIO-NAME-NO       VALUE 'N'.                      
       01  WS-COMMAREA.                                                         
           COPY ACATNAIO.                                                       
           EJECT                                                                
      * NAME AND ADDRESS COPYBOOKS.                                             
       COPY NNARDCOB                                                            
              REPLACING  ==:NNAREAD:==  BY ==NNAREAD==.                         
       COPY NASEGPPA.                                                           
       COPY NASEGPPB.                                                           
       COPY NASEGEND.                                                           
           EJECT                                                                
      ******************************************************************00550002
      *      B1 WORK AREA                                               00560002
      ******************************************************************00550002
       01  B1-RECORD.                                                   00580002
           05  B1-REC-ID.                                               00590002
               09  B1-CLIENT-NO          PIC 9(03) COMP-3.              00600002
               09  B1-CARD-NO            PIC 9(07) COMP-3.              00610002
               09  B1-CLIENT             PIC 9(03) COMP-3.              00620002
               09  B1-SEQUENCE           PIC 9(05) COMP-3 VALUE 1.      00630002
           05  B1-REC-TYP-3              PIC X(01) VALUE '3'.           00640002
           05  B1-RETURN-AREA.                                          00650002
               09  B1-RETURN-VALUE       PIC X(01) VALUE SPACES.        00650002
               09  B1-RETURN-CLR-NBR     PIC X(04).                     00650002
           05  FILLER                    PIC X(05).                     00660002
           EJECT                                                                
014700 LINKAGE SECTION.                                                 01470000
014800                                                                  01480000
014900 01  DFHCOMMAREA.                                                 01490000
           05  FILLER             PIC X(500).                                   
           EJECT                                                                
       PROCEDURE DIVISION.                                              01540000
                                                                                
           IF EIBCALEN NOT > ZERO                                               
              EXEC CICS RETURN END-EXEC.                                06880000
                                                                                
           MOVE DFHCOMMAREA(1 : EIBCALEN) TO WS-COMMAREA.                       
LRMXXX     MOVE EIBCALEN TO WS-CALLED-EIBCALEN.                                 
                                                                                
       CALL-NAME-ADDRESS-RTN.                                                   
           MOVE SPACES            TO NNAREAD-REQUEST-SEGMENT-AREA.              
                                                                                
           MOVE '10'           TO NNAREAD-KEY-REC-ID                            
           MOVE '00'           TO NNAREAD-KEY-REC-ID2                           
           MOVE 'R'            TO NNAREAD-REQ-FUNC                              
           MOVE SPACES         TO NNAREAD-RETURN-CODE                           
                                  NNAREAD-REQUEST-SEGMENT-AREA                  
           MOVE 'A  '          TO NNAREAD-REQUEST-SEGMENT(1)                    
           MOVE 'B  '          TO NNAREAD-REQUEST-SEGMENT(2)                    
           MOVE 'ACAT00NA'        TO NNAREAD-PGM-NAME.                  AEISAC07
           MOVE ACATNAIO-CLIENT   TO NNAREAD-KEY-CLIENT.                AEISAC07
           MOVE ZEROES            TO NNAREAD-KEY-BRANCH1-2.             AEISAC07
           MOVE ACATNAIO-BR       TO NNAREAD-KEY-BRANCH3-5.             AEISAC07
           MOVE ZEROES            TO NNAREAD-KEY-ACCOUNT1-5.            AEISAC07
           MOVE ACATNAIO-AC       TO NNAREAD-KEY-ACCOUNT6-10.           AEISAC07
           MOVE 'R'            TO NNAREAD-REQ-FILE                              
                                                                        AEISAC07
           EXEC CICS LINK PROGRAM  ('NNAREAD')                          AEISAC07
                          COMMAREA (NNAREAD-PARAMETERS)                 AEISAC07
                          LENGTH   (LENGTH OF NNAREAD-PARAMETERS)       AEISAC07
           END-EXEC.                                                    AEISAC07
                                                                                
           IF NAPPA-SEGMENT-LENGTH GREATER ZERO                                 
              SET ACATNAIO-FOUND TO TRUE                                        
              MOVE SPACES   TO ACATNAIO-NAME                                    
                               ACATNAIO-NAME2                                   
                               ACATNAIO-NAME3                                   
              MOVE NAPPA-IRA-KEOUGH-IND  TO ACATNAIO-IRA                        
              MOVE NAPPA-RR1-3           TO ACATNAIO-RR                         
              MOVE NAPPA-ACCT-CLASS-EXP  TO ACATNAIO-ACCT-CLASS-EXP             
              IF NAPPA-ADT-CUSTOMER-TYPE NUMERIC                                
                 MOVE NAPPA-ADT-CUSTOMER-TYPE TO                                
                                      ACATNAIO-ADT-CUSTOMER-TYPE                
              ELSE                                                              
                 MOVE ZEROS TO        ACATNAIO-ADT-CUSTOMER-TYPE                
              END-IF                                                            
              IF NAPPA-SOC-SEC-TAX-ID1 NOT = '000000000'                        
                 MOVE NAPPA-SOC-SEC-TAX-ID1 TO ACATNAIO-SSN                     
              ELSE                                                              
                 MOVE SPACES                TO ACATNAIO-SSN                     
              END-IF                                                            
              IF NAPPA-SOC-SEC-TAX-ID2 NOT = '000000000'                        
                 MOVE NAPPA-SOC-SEC-TAX-ID2 TO ACATNAIO-SSN2                    
              ELSE                                                              
                 MOVE SPACES                TO ACATNAIO-SSN2                    
              END-IF                                                            
              MOVE NAPPA-ACAT-CODE       TO ACATNAIO-ACAT-CODE                  
              IF NAPPB-SEGMENT-LENGTH GREATER ZERO                              
                 IF NAPPA-IRA-KEOUGH-IND > SPACES                               
                    PERFORM GET-B1-IRA-LINES-RTN                        03570002
                 END-IF                                                         
                 IF NAPPA-IRA-KEOUGH-IND > SPACES                               
                 AND B1-RETURN-VALUE NOT = '1'                          00650002
                    IF NAPPB-NA-LINE-COUNT GREATER '2'                          
                       MOVE NAPPB-NA-LINE1-30(2) TO ACATNAIO-NAME               
                       MOVE NAPPB-NA-LINE1-30(3) TO ACATNAIO-NAME2              
                    ELSE                                                        
                    IF NAPPB-NA-LINE-COUNT GREATER '1'                          
                       MOVE NAPPB-NA-LINE1-30(2) TO ACATNAIO-NAME               
                    END-IF END-IF                                               
                 ELSE                                                           
                    IF NAPPB-NA-LINE-COUNT GREATER '2'                          
                       MOVE NAPPB-NA-LINE1-30(1) TO ACATNAIO-NAME               
                       MOVE NAPPB-NA-LINE1-30(2) TO ACATNAIO-NAME2              
                       MOVE NAPPB-NA-LINE1-30(3) TO ACATNAIO-NAME3              
                    ELSE                                                        
                    IF NAPPB-NA-LINE-COUNT GREATER '1'                          
                       MOVE NAPPB-NA-LINE1-30(1) TO ACATNAIO-NAME               
                       MOVE NAPPB-NA-LINE1-30(2) TO ACATNAIO-NAME2              
                    ELSE                                                        
                    IF NAPPB-NA-LINE-COUNT GREATER '0'                          
                       MOVE NAPPB-NA-LINE1-30(1) TO ACATNAIO-NAME               
                                                    ACATNAIO-NAME3              
                    END-IF END-IF END-IF                                        
                 END-IF                                                         
CSG001*                                                                         
CSG001* AFTER ACATS RETRIEVE THE NAME AND ADDRESS FIELDS, IN SOME               
CSG001* INSTANCES NAME AND ADDRESS CONTAIN SPECIAL CHARACTERS.                  
CSG001* CORRECT THEM BY REPLACING SPECIAL CHARACTERS WITH SPACES.               
CSG001           PERFORM EDIT-ACATNAIO-NAME                                     
CSG001*                                                                         
              END-IF                                                            
           ELSE                                                                 
              SET ACATNAIO-NOT-FOUND TO TRUE                                    
              MOVE SPACES   TO ACATNAIO-NAME                                    
                               ACATNAIO-NAME2                                   
                               ACATNAIO-NAME3.                                  
                                                                                
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-CALLED-EIBCALEN).             
           EXEC CICS RETURN END-EXEC.                                   06880000
                                                                                
           EJECT                                                                
       GET-B1-IRA-LINES-RTN.                                            03570002
           IF ACATNAIO-CLIENT-9 NUMERIC                                 AEISAC07
              MOVE ACATNAIO-CLIENT-9  TO B1-CLIENT-NO B1-CLIENT         03580002
      *** CHECK CARD #434525 =================>                                 
              MOVE 434525          TO B1-CARD-NO                        03590002
              PERFORM READ-B1-RTN                                       03600002
           END-IF.                                                              
                                                                                
       READ-B1-RTN.                                                     03700002
           EXEC CICS IGNORE CONDITION ENDFILE  ERROR                            
                     ILLOGIC INVREQ   IOERR  LENGERR                            
                     NOTFND  NOTOPEN  DISABLED  DSIDERR                         
           END-EXEC.                                                            
           EXEC CICS READ                                               03710002
                     DATASET('B1PRINT')                                 03720002
                     INTO(B1-RECORD)                                    03730002
                     RIDFLD(B1-REC-ID)                                  03740002
                     LENGTH(LENGTH OF B1-RECORD)                        03750002
           END-EXEC.                                                    03760002
                                                                                
CSG001 EDIT-ACATNAIO-NAME.                                              03700002
CSG001* MOVE SAPCES FOR THE SPECIAL CHARACTERS FOUND IN ACATNAIO-NAME,          
CSG001* ACATNAIO-NAME2,ACATNAIO-NAME3.                                          
CSG001     SET WS-EDIT-ACATNAIO-NAME-NO        TO TRUE                          
CSG001     PERFORM                                                              
CSG001         VARYING WS-SUB1 FROM 1 BY 1                                      
CSG001            UNTIL WS-SUB1 > 30                                            
CSG001        MOVE ACATNAIO-NAME (WS-SUB1 : 1) TO WS-EDIT-CHAR-AREA             
CSG001        IF NOT WS-VALID-CHARACTER                                         
CSG001           MOVE SPACES TO ACATNAIO-NAME(WS-SUB1 : 1)                      
CSG001           SET WS-EDIT-ACATNAIO-NAME-YES TO TRUE                          
CSG001        END-IF                                                            
CSG001                                                                          
CSG001        MOVE ACATNAIO-NAME2(WS-SUB1 : 1) TO WS-EDIT-CHAR-AREA             
CSG001        IF NOT WS-VALID-CHARACTER                                         
CSG001           MOVE SPACES TO ACATNAIO-NAME2(WS-SUB1 : 1)                     
CSG001        END-IF                                                            
CSG001                                                                          
CSG001        MOVE ACATNAIO-NAME3(WS-SUB1 : 1) TO WS-EDIT-CHAR-AREA             
CSG001        IF NOT WS-VALID-CHARACTER                                         
CSG001           MOVE SPACES TO ACATNAIO-NAME3(WS-SUB1 : 1)                     
CSG001        END-IF                                                            
CSG001     END-PERFORM                                                          
CSG001*                                                                         
CSG001* IF ACATNAIO-NAME EDITED ABOVE AND FIRST CHARACTER OF ACATNAIO           
CSG001* NAME IS SPACES THEN LEFT JUSTIFY ACATNAIO NAME.                         
CSG001* CHECK THE CHARACTERS ONE BY ONE, WHEN NON-SPACE CHARACTER FOUND,        
CSG001* MOVE THE ENTIRE CHARACTERS FROM THAT POSITION.                          
CSG001     IF WS-EDIT-ACATNAIO-NAME-YES AND                                     
CSG001        ACATNAIO-NAME(1:1) = SPACES                                       
CSG001        SET WS-JUST-LEFT-NOT-DONE     TO TRUE                             
CSG001        PERFORM                                                   03760002
CSG001            VARYING WS-SUB2 FROM 2 BY 1                           03760002
CSG001               UNTIL WS-SUB2 > 30  OR  WS-JUST-LEFT-DONE          03760002
CSG001           IF ACATNAIO-NAME(WS-SUB2 : 1) NOT = SPACES             03760002
CSG001              MOVE ACATNAIO-NAME(WS-SUB2 : ) TO WS-ACATNAIO-NAME  03760002
CSG001              MOVE WS-ACATNAIO-NAME          TO ACATNAIO-NAME             
CSG001              SET WS-JUST-LEFT-DONE          TO TRUE              03760002
CSG001           END-IF                                                 03760002
CSG001        END-PERFORM                                               03760002
CSG001     END-IF.                                                      03760002
CSG001*                                                                 03760002
           EJECT                                                                
069600 9990-END-PROGRAM.                                                06960057
069700     GOBACK.                                                      06970000
