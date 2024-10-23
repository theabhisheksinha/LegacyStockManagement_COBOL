000001* PDX    - ACATPPD2 C0109165 06/29/98 09:55:24 TBLAMUR            00001000
000100 ID DIVISION.                                                     00010000
000200 PROGRAM-ID. ACATPPD2.                                            00020000
000250 AUTHOR.  LARRY MUREY.                                            00020000
000300*REMARKS.                                                         00030000
000400*---------------------------------------------------------------          
000500* IO MODULE TO READ CLIENT PARTICIPANT PROFILE TABLE.             00050000
000400*---------------------------------------------------------------          
000300 ENVIRONMENT DIVISION.                                            00030000
000400 DATA DIVISION.                                                   00040000
000500                                                                  00050000
000600 WORKING-STORAGE SECTION.                                         00060000
           COPY PDXIDCOB.                                                       
       77  PRTCP-LENGTH                PIC S9(4) COMP VALUE +150.               
       01  PRTCP-RECORD.                                                        
           05  PRTCP-NBR               PIC X(04).                               
           05  PRTCP-TIF-IND           PIC X.                                   
           05  PRTCP-TYPE-CD           PIC X.                                   
           05  PRTCP-NAME              PIC X(60).                               
           05  PRTCP-FUND-SERV-ELIGBL  PIC X.                                   
           05  PRTCP-CREATE-TIMESTP    PIC X(08).                               
           05  PRTCP-UPDATE-TIMESTP    PIC X(08).                               
           05  PRTCP-CICS-TERMID       PIC X(04).                               
           05  PRTCP-PROGRAM-NAME      PIC X(08).                               
           05  FILLER                  PIC X(55).                               
       01  WS-COMMAREA.                                                         
           COPY ACATPPIO.                                                       
014700 LINKAGE SECTION.                                                 01470000
014800                                                                  01480000
014900 01  DFHCOMMAREA.                                                 01490000
           05  FILLER                  PIC X(500).                              
           EJECT                                                                
       PROCEDURE DIVISION.                                              01540000
           IF EIBCALEN NOT > ZERO                                               
               EXEC CICS RETURN END-EXEC.                               06880000
                                                                                
           MOVE DFHCOMMAREA(1 : EIBCALEN) TO WS-COMMAREA.                       
                                                                                
           IF ACATPPIO-READ                                                     
              MOVE ACATPPIO-BRKR TO PRTCP-NBR                                   
              EXEC CICS READ                                                    
                             DATASET('CATPPL')                                  
                             RIDFLD(PRTCP-NBR)                                  
                             INTO (PRTCP-RECORD)                                
                             LENGTH(PRTCP-LENGTH)                               
              END-EXEC                                                          
              IF EIBRESP = +0                                                   
                 SET ACATPPIO-FOUND TO TRUE                                     
                 MOVE PRTCP-NAME TO ACATPPIO-NAME                               
              ELSE                                                              
                  SET ACATPPIO-NOT-FOUND TO TRUE                                
           END-IF.                                                              
                                                                                
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : EIBCALEN).                       
                                                                                
           EXEC CICS RETURN END-EXEC.                                   06880000
                                                                                
           EJECT                                                                
069600 9990-END-PROGRAM.                                                06960057
069700     STOP RUN.                                                    06970000
