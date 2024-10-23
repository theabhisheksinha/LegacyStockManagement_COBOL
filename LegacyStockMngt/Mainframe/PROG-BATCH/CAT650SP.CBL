000001* PDX    - CAT650SP C0272055 10/22/08 15:07:27 TBLAMUR            00001000
000001* SSR 60125 RECOMPILE FOR EXPANSION TO ACATPEND                           
000001* PDX    - CAT650SP C0226392 10/07/05 14:26:22 TBLAMUR            00001000
      * SSR 39800 RECOMPILE FOR COPYBOOK CHANGE                                 
000001* PDX    - CAT650SP C0157686 04/20/01 13:58:41 TBLAMUR            00001000
000001* PDX    - CAT650SP C0115132 10/28/98 15:29:33 TBLAMUR            00001000
       ID DIVISION.                                                             
       PROGRAM-ID.   CAT650SP.                                                  
       AUTHOR.       LARRY MUREY.                                               
      *REMARKS. ***** ACAT PENDING FILE SPLITTER.                               
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
           SKIP2                                                                
           SELECT IP-ZZZ-FILE      ASSIGN       TO  IPZZZ.                      
           SELECT OP-STREAM1-FILE  ASSIGN       TO  OPSTM1.                     
           SELECT OP-STREAM2-FILE  ASSIGN       TO  OPSTM2.                     
                                                                                
           EJECT                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  IP-ZZZ-FILE                                                          
           RECORDING MODE IS V                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       COPY ACATPEND REPLACING ==:FMT:== BY ==IP==.                     01360002
                                                                                
       FD  OP-STREAM1-FILE                                                      
           BLOCK CONTAINS 0 RECORDS.                                            
       COPY ACATPEND REPLACING ==:FMT:== BY ==OP-S1==.                  01360002
                                                                                
       FD  OP-STREAM2-FILE                                                      
           BLOCK CONTAINS 0 RECORDS.                                            
       COPY ACATPEND REPLACING ==:FMT:== BY ==OP-S2==.                  01360002
                                                                                
           EJECT                                                                
                                                                                
       WORKING-STORAGE SECTION.                                                 
           SKIP1                                                                
       77  ABEND-CODE                 PIC S9(4)  COMP SYNC  VALUE +1100.        
       77  END-OF-FILE-FLAG           PIC X(1)   VALUE 'N'.                     
           88  END-OF-FILE            VALUE 'Y'.                                
       77  PREV-CLIENT                PIC X(3)   VALUE '000'.                   
       77  IP-RECORD-COUNT            PIC 9(09)  VALUE ZERO.                    
       77  OP-STREAM1-COUNT           PIC 9(09)  VALUE ZERO.                    
       77  OP-STREAM2-COUNT           PIC 9(09)  VALUE ZERO.                    
           COPY STUBCPY.                                                        
           EJECT                                                                
           COPY BHINFO.                                                         
           SKIP3                                                                
           COPY BHMRGN.                                                         
           EJECT                                                                
       LINKAGE SECTION.                                                         
           SKIP1                                                                
       01  PARM-AREA.                                                           
           05  PARM-LENGTH            PIC S9(4)    COMP.                        
           05  PARM-SPLT-STREAM1.                                               
               15  PARM-STREAM1-ID    PIC X(01).                                
               15  FILLER             PIC X(02).                                
           05  FILLER                 PIC X(01).                                
           05  PARM-SPLT-STREAM2.                                               
               15  PARM-STREAM2-ID    PIC X(01).                                
               15  FILLER             PIC X(02).                                
                                                                                
       EJECT                                                                    
                                                                                
       PROCEDURE DIVISION             USING  PARM-AREA.                         
           COPY MSGCOBO.                                                        
           PERFORM INIT-RTN.                                                    
           PERFORM MAIN-PROCESSING-RTN.                                         
           PERFORM END-OF-JOB-RTN.                                              
           MOVE ZERO TO  RETURN-CODE.                                           
           GOBACK.                                                              
                                                                                
       EJECT                                                                    
                                                                                
       INIT-RTN.                                                                
           IF PARM-LENGTH NOT GREATER ZERO                                      
               DISPLAY 'PARM NOT RECIEVED - CAT650SP ABENDS'                    
               PERFORM ABORT-RTN.                                               
                                                                                
           DISPLAY 'PARM STREAM ID = ' PARM-STREAM1-ID.                         
           OPEN INPUT   IP-ZZZ-FILE                                             
           OPEN OUTPUT  OP-STREAM1-FILE.                                        
           OPEN OUTPUT  OP-STREAM2-FILE.                                        
           MOVE ZEROES  TO PREV-CLIENT.                                         
           PERFORM  READ-IP-ZZZ-RTN.                                            
                                                                                
           IF NOT END-OF-FILE                                                   
              IF IP-HEADER-ID                                                   
                 DISPLAY 'FOUND HEADER ' IP-HEADER-RECORD                       
                 PERFORM  WRITE-STREAM1-RTN                                     
                 PERFORM  WRITE-STREAM2-RTN                                     
                 PERFORM  READ-IP-ZZZ-RTN                                       
              END-IF                                                            
           END-IF.                                                              
                                                                                
       EJECT                                                                    
                                                                                
       MAIN-PROCESSING-RTN.                                                     
           PERFORM UNTIL END-OF-FILE                                            
                      OR (IP-TI-ADP-CL-NO-X = HIGH-VALUE)                       
               IF IP-TI-ADP-CL-NO-X NOT = PREV-CLIENT                           
                  MOVE IP-TI-ADP-CL-NO-X TO PREV-CLIENT                         
                  PERFORM GET-STREAM-ID-RTN                                     
               END-IF                                                           
               IF PARM-STREAM1-ID > SPACES                                      
               AND PARM-STREAM1-ID = BH-BROKER-MINI-MAXI-INDICATOR              
                     PERFORM WRITE-STREAM1-RTN                                  
               END-IF                                                           
               IF PARM-STREAM2-ID > SPACES                                      
               AND PARM-STREAM2-ID = BH-BROKER-MINI-MAXI-INDICATOR              
                  PERFORM WRITE-STREAM2-RTN                                     
               END-IF                                                           
               PERFORM READ-IP-ZZZ-RTN                                          
           END-PERFORM.                                                         
                                                                                
       EJECT                                                                    
                                                                                
       GET-STREAM-ID-RTN.                                                       
           MOVE IP-TI-ADP-CL-NO-X  TO BH-BROKER-NUMBER.                         
LRM        MOVE '101'             TO BH-LOGICAL-RECORD-CODE                     
           CALL  GETB1V  USING  BH-BROKER-HEADER-INFO                           
LRM                               BH-MARGIN-INFO.                               
                                                                                
           DISPLAY '****   DISPLAY   *********'.                                
           DISPLAY 'CLIENT#         = '  IP-TI-ADP-CL-NO-X.                     
           DISPLAY 'SUB STREAM      = '  BH-BROKER-MINI-MAXI-SUBGROUP.          
           DISPLAY 'MAIN STREAM     = '  BH-BROKER-MINI-MAXI-INDICATOR.         
LRM        DISPLAY 'B1 16323 = ' BH-MG-SEPAR-REGION-CLNT.                       
           DISPLAY '**** END DISPLAY *********'.                                
                                                                                
                                                                                
       EJECT                                                                    
                                                                                
       READ-IP-ZZZ-RTN.                                                         
           READ IP-ZZZ-FILE AT END                                              
                SET END-OF-FILE TO TRUE.                                        
                                                                                
           IF (NOT END-OF-FILE)                                                 
           AND (IP-TI-ADP-CL-NO-X                                               
            NOT = LOW-VALUE AND HIGH-VALUE AND SPACE)                           
              ADD 1 TO IP-RECORD-COUNT.                                         
                                                                                
       WRITE-STREAM1-RTN.                                                       
           IF IP-HEADER-ID                                                      
              WRITE OP-S1-HEADER-RECORD FROM IP-HEADER-RECORD                   
           ELSE                                                                 
           IF IP-TI-RECORD-ID                                                   
              WRITE OP-S1-TI-RECORD FROM IP-TI-RECORD                           
           ELSE                                                                 
           IF IP-AT-RECORD-ID                                                   
              WRITE OP-S1-AT-RECORD FROM IP-AT-RECORD                           
           ELSE                                                                 
              DISPLAY 'UNKNOWN PEND RECORD ENCOUNTERED '                        
              DISPLAY 'PROGRAM ABENDS '                                         
              GO TO ABORT-RTN.                                                  
                                                                                
           ADD 1 TO OP-STREAM1-COUNT.                                           
                                                                                
       WRITE-STREAM2-RTN.                                                       
           IF IP-HEADER-ID                                                      
              WRITE OP-S2-HEADER-RECORD FROM IP-HEADER-RECORD                   
           ELSE                                                                 
           IF IP-TI-RECORD-ID                                                   
              WRITE OP-S2-TI-RECORD FROM IP-TI-RECORD                           
           ELSE                                                                 
           IF IP-AT-RECORD-ID                                                   
              WRITE OP-S2-AT-RECORD FROM IP-AT-RECORD                           
           ELSE                                                                 
              DISPLAY 'UNKNOWN PEND RECORD ENCOUNTERED '                        
              DISPLAY 'PROGRAM ABENDS '                                         
              GO TO ABORT-RTN.                                                  
                                                                                
           ADD 1 TO OP-STREAM2-COUNT.                                           
                                                                                
       EJECT                                                                    
                                                                                
       END-OF-JOB-RTN.                                                          
           IF (IP-TI-ADP-CL-NO-X = HIGH-VALUE)                                  
           AND (NOT END-OF-FILE)                                                
              PERFORM  WRITE-STREAM1-RTN                                        
              PERFORM  WRITE-STREAM2-RTN.                                       
                                                                                
           CLOSE    IP-ZZZ-FILE.                                                
           CLOSE    OP-STREAM1-FILE.                                            
           CLOSE    OP-STREAM2-FILE.                                            
           DISPLAY '********* RECORD COUNT SUMMARY **************'.             
           DISPLAY 'INPUT RECORD COUNT     = ' IP-RECORD-COUNT.                 
           DISPLAY 'OUTPUT S1 RECORD COUNT = ' OP-STREAM1-COUNT.                
           DISPLAY 'OUTPUT S2 RECORD COUNT = ' OP-STREAM2-COUNT.                
                                                                                
           EJECT                                                                
                                                                                
       ABORT-RTN.                                                               
           CALL  ABEND    USING ABEND-CODE.                                     
