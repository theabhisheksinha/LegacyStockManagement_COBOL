000001* PDX    - CAT788CV C0325817 04/26/12 16:33:49 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         CAT788  
       PROGRAM-ID.  CAT788CV.                                           CAT788  
      ***************************************************************** CAT788  
      * CAT788CV - CONVERT CAT788.TAXLOT FILE BACK TO NSCC CBRS0264   * CAT788  
      *       FORMAT, WHICH IS VB.                                    * CAT788  
      *                                                               * CAT788  
      ***************************************************************** CAT788  
      *                                                                 CAT788  
       ENVIRONMENT DIVISION.                                            CAT788  
       INPUT-OUTPUT SECTION.                                            CAT788  
       FILE-CONTROL.                                                    CAT788  
                                                                        CAT788  
           SELECT INFILE           ASSIGN       TO INFILE.              CAT788  
           SELECT INFILE-CBRS0264  ASSIGN       TO INCBRS.              CAT788  
           SELECT OUTFILE          ASSIGN       TO OUTFILE.             CAT788  
      *                                                                 CAT788  
       DATA DIVISION.                                                   CAT788  
       FILE SECTION.                                                    CAT788  
       FD  INFILE                                                       CAT788  
           RECORDING MODE IS F                                          CAT788  
           BLOCK CONTAINS 0 RECORDS.                                    CAT788  
           COPY ACATTAXM REPLACING ==:TAXM:== BY ==TAXM==.              CAT788  
                                                                        CAT788  
       FD  INFILE-CBRS0264                                              CAT788  
           RECORDING MODE IS V                                          CAT788  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT788  
           BLOCK CONTAINS 0 RECORDS.                                    CAT788  
                                                                        CAT788  
           COPY ACATTAXO REPLACING ==:TAXO:== BY ==TAXI==.              CAT788  
       01  CBRS0264-RECORD               PIC X(4000).                   CAT788  
                                                                        CAT788  
       FD  OUTFILE                                                      CAT788  
           RECORDING MODE IS V                                          CAT788  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS          CAT788  
           BLOCK CONTAINS 0 RECORDS.                                    CAT788  
                                                                        CAT788  
           COPY ACATTAXO REPLACING ==:TAXO:== BY ==NSCC==.              CAT788  
       01  DUMMY-LARGE-REC               PIC X(4000).                   CAT788  
       01  TAXO-1TRANS                   PIC X(133).                            
       01  TAXO-H0                       PIC X(61).                             
       01  TAXO-DETAIL                   PIC X(1500).                           
       01  TAXO-T0                       PIC X(70).                             
                                                                        CAT788  
      /                                                                 CAT788  
       WORKING-STORAGE SECTION.                                         CAT788  
           COPY PDXIDCOB.                                               CAT788  
                                                                        CAT788  
       01  WS-WORK-AREA.                                                CAT788  
           05  PGM-NAME                  PIC X(08) VALUE 'CAT788CV'.    CAT788  
           05  WS-CBRS0264-EOF-SW        PIC X  VALUE 'N'.              CAT788  
               88  EOF-CBRS0264                 VALUE 'Y'.              CAT788  
           05  WS-INFILE-EOF-SW          PIC X  VALUE 'N'.              CAT788  
               88  END-OF-INFILE                VALUE 'Y'.              CAT788  
           05  WS-REC-COUNT              PIC 9(9)   VALUE ZERO.                 
           05  WS-1TRANS                 PIC X(133) VALUE SPACES.               
           05  WS-H0                     PIC X(61)  VALUE SPACES.               
           05  WS-T0                     PIC X(70)  VALUE SPACES.               
           05  WS-CURRENT-DATE.                                                 
               07  WS-CURRENT-DATE-CC   PIC X(2)   VALUE SPACES.                
               07  WS-CURRENT-DATE-YY   PIC X(2)   VALUE SPACES.                
               07  WS-CURRENT-DATE-MM   PIC X(2)   VALUE SPACES.                
               07  WS-CURRENT-DATE-DD   PIC X(2)   VALUE SPACES.                
                                                                        CAT788  
       01  W-ABEND-AREA.                                                CAT788  
           05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT788  
      /                                                                 CAT788  
      *                                                                 CAT788  
       PROCEDURE DIVISION.                                              CAT788  
           COPY MSGCOBO.                                                CAT788  
           DISPLAY 'CAT788CV - CONVERT 788.TAXLOT TO CBRS0264 FORMAT '  CAT788  
                                                                        CAT788  
           PERFORM 1000-INITIAL-RTN.                                    CAT788  
                                                                        CAT788  
           PERFORM 3000-MAIN-RTN                                        CAT788  
                UNTIL END-OF-INFILE.                                    CAT788  
                                                                        CAT788  
           ADD 1 TO WS-REC-COUNT                                                
           MOVE WS-REC-COUNT TO WS-T0(62 : 9).                                  
           WRITE TAXO-T0 FROM WS-T0.                                            
                                                                                
           CLOSE INFILE                                                         
                 INFILE-CBRS0264                                                
                 OUTFILE.                                                       
                                                                        CAT788  
           DISPLAY ' '.                                                 CAT788  
           DISPLAY '** CAT788CV COMPLETED SUCCESSFULLY **'.             CAT788  
           GOBACK.                                                      CAT788  
       EJECT                                                            CAT788  
      *                                                                 CAT788  
       1000-INITIAL-RTN.                                                CAT788  
           DISPLAY ' '.                                                 CAT788  
                                                                        CAT788  
                                                                        CAT788  
           OPEN      INPUT  INFILE                                      CAT788  
                            INFILE-CBRS0264                             CAT788  
                    OUTPUT  OUTFILE.                                    CAT788  
                                                                                
           PERFORM UNTIL EOF-CBRS0264                                   CAT788  
              READ INFILE-CBRS0264                                      CAT788  
                AT END SET EOF-CBRS0264 TO TRUE                         CAT788  
              END-READ                                                          
              IF NOT EOF-CBRS0264                                               
                 IF TAXI-BROKER-HEADER                                          
                 AND CBRS0264-RECORD(44 : 4) = 'A04S'                           
                    MOVE CBRS0264-RECORD  TO WS-H0                              
                 ELSE                                                           
                 IF TAXI-BROKER-TRAILER                                         
                 AND CBRS0264-RECORD(44 : 4) = 'A04S'                           
                    MOVE CBRS0264-RECORD  TO WS-T0                              
                 ELSE                                                           
                 IF CBRS0264-RECORD(1 : 1) = '1'                                
                    MOVE CBRS0264-RECORD  TO WS-1TRANS                          
                 END-IF END-IF END-IF                                           
              END-IF                                                            
           END-PERFORM.                                                         
      *                                                                 CAT788  
       3000-MAIN-RTN.                                                   CAT788  
           READ INFILE                                                          
              AT END SET END-OF-INFILE TO TRUE.                                 
           IF NOT END-OF-INFILE                                                 
              IF TAXM-RECORD(1 : 4) = 'DATE'                                    
                 MOVE TAXM-RECORD(6 : 2) TO WS-CURRENT-DATE-MM                  
                 MOVE TAXM-RECORD(8 : 2) TO WS-CURRENT-DATE-DD                  
                 MOVE TAXM-RECORD(10 : 2) TO WS-CURRENT-DATE-YY                 
                 MOVE '20'                TO WS-CURRENT-DATE-CC                 
                 DISPLAY 'USING CURRENT DATE ' WS-CURRENT-DATE                  
                 MOVE WS-CURRENT-DATE TO WS-1TRANS(7 : 8)                       
                                         WS-H0(48 : 8)                          
                                         WS-T0(48 : 8)                          
                 WRITE TAXO-1TRANS FROM WS-1TRANS                               
                 WRITE TAXO-H0     FROM WS-H0                                   
                 ADD 2 TO WS-REC-COUNT                                          
              ELSE                                                              
              IF TAXM-RECORD(20 : 2) = 'AO' OR 'TO'                             
                 MOVE TAXM-RECORD(20 : 1300) TO TAXO-DETAIL(1 : 1300)           
                 MOVE SPACES                 TO TAXO-DETAIL(1301 : 200)         
                 WRITE TAXO-DETAIL                                              
                 ADD 1 TO WS-REC-COUNT                                          
              ELSE                                                              
                 DISPLAY 'UNKNOWN RECORD TYPE ON CAT788 FILE '                  
                    TAXM-RECORD(1 : 10)                                         
           END-IF.                                                              
