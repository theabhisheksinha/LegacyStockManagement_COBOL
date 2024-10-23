000001* PDX    - CAT880E  C0348882 12/06/13 06:57:39 TBCHKOP            00001000
CSG001* SSR 91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.                 00001000
000001* PDX    - CAT880E  C0272055 10/21/08 17:26:56 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT880E.                                                    
       DATE-WRITTEN.  OCT 2008.                                                 
      *---------------------------------------------------------------*         
      *                         REMARKS                               *         
      * NEW REPORT PROGRAM - BOOKING TYPE 2 SHORT POSN INTO TYPE 1,   *         
      * DRIVEN BY CAT650.TYP2CSH(0) FILE AND B1 434734 IN CAT650.     *         
      * PROGRAM CAT880C COPIED AS MODEL FOR THIS NON CASH VERSION.    *         
      *---------------------------------------------------------------*         
      *****************************************************************         
           EJECT                                                                
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
      *****************************************************************         
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                        CAT810  
           SELECT INFILE               ASSIGN  TO  INFILE.                      
           SELECT REPORT-FILE          ASSIGN  TO  RPTPI.                       
                                                                                
      *****************************************************************         
       DATA DIVISION.                                                           
      *****************************************************************         
                                                                                
       FILE SECTION.                                                            
                                                                                
       FD  INFILE                                                               
           RECORDING MODE F                                                     
           BLOCK CONTAINS 0 RECORDS                                             
           LABEL RECORDS ARE STANDARD                                           
           RECORD CONTAINS 250 CHARACTERS.                                      
                                                                                
       01  INFILE-RECORD                    PIC  X(250).                        
                                                                                
       FD  REPORT-FILE                                                          
           RECORDING MODE F                                                     
           BLOCK CONTAINS 0 RECORDS                                             
           LABEL RECORDS ARE STANDARD                                           
           RECORD CONTAINS 143 CHARACTERS.                                      
                                                                                
       01  REPORT-RECORD                    PIC  X(143).                        
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
       77  ABEND-CODE               COMP    PIC S9(04)  VALUE +999.             
       77  S1                       COMP    PIC S9(04)  VALUE ZEROES.           
       77  B1-SUB                           PIC  9(03)  VALUE ZEROES.           
                                                                                
       01  CLIENT-TABLE.                                                        
           05  CLIENT-TABLE-RECORD OCCURS 500 TIMES.                            
               10  CLIENT-NAME              PIC  X(30).                         
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'DATES-AREA'.                                                        
                                                                                
       01  WS-CURRENT-DATE.                                                     
           05  WS-CURRENT-YY                PIC  X(02).                         
           05  WS-CURRENT-MM                PIC  X(02).                         
           05  WS-CURRENT-DD                PIC  X(02).                         
                                                                                
       01  WS-PROCESS-CCYYMMDD.                                                 
           05  WS-PROCESS-CC           PIC X(2).                                
           05  WS-PROCESS-YY           PIC X(2).                                
           05  WS-PROCESS-MM           PIC X(2).                                
           05  WS-PROCESS-DD           PIC X(2).                                
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'SWITCHES'.                                                          
                                                                                
       01  FILLER.                                                              
           05  NEW-LEVEL-SW                 PIC  X(01)  VALUE 'C'.              
               88  NEW-CLIENT                           VALUE 'C'.              
               88  NEW-ACCOUNT                          VALUE 'A'.              
               88  NOTHING-NEW                          VALUE 'N'.              
           05  INFILE-EOF-SW                PIC  X(01)  VALUE 'N'.              
               88 INFILE-EOF                            VALUE 'Y'.              
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'COUNTERS'.                                                          
                                                                                
       01  FILLER.                                                              
           05  LINE-CNTR                    PIC  9(02)  VALUE ZEROES.           
           05  PAGE-CNTR                    PIC  9(05)  VALUE ZEROES.           
                                                                                
       COPY ACATCASH REPLACING ==:PFX:== BY ==TYPE2-CASH==.                     
                                                                                
       01  HDR1-RECORD.                                                         
           05  HDR1-CC                      PIC  X(01)  VALUE '1'.              
           05  FILLER                       PIC  X(09)  VALUE                   
               'CLIENT - '.                                                     
           05  HDR1-CLIENT-NBR              PIC  X(03).                         
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  HDR1-CLIENT-NAME             PIC  X(30).                         
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(42)  VALUE                   
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.                    
           05  FILLER                       PIC  X(15)  VALUE SPACES.           
           05  FILLER                       PIC  X(06)  VALUE                   
               'DATE: '.                                                        
           05  HDR1-DATE-MM                 PIC  X(02).                         
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  HDR1-DATE-DD                 PIC  X(02).                         
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  HDR1-DATE-YY                 PIC  X(02).                         
           05  FILLER                       PIC  X(03)  VALUE SPACES.           
           05  FILLER                       PIC  X(06)  VALUE                   
               'PAGE: '.                                                        
           05  HDR1-PAGE-NBR                PIC  ZZZZ9.                         
           05  FILLER                       PIC  X(01)  VALUE SPACES.           
                                                                                
       01  HDR2-RECORD.                                                         
           05  HDR2-CC                      PIC  X(01)  VALUE ' '.              
           05  FILLER                       PIC  X(47)  VALUE 'CAT880E'.        
           05  FILLER                       PIC  X(45)  VALUE                   
               'RECEIVER SHORT POSITION TYPE2 TO TYPE1 REPORT'.                 
           05  FILLER                       PIC  X(11)  VALUE SPACES.           
           05  FILLER                       PIC  X(10)  VALUE                   
               'RUN DATE: '.                                                    
           05  HDR2-DATE-MM                 PIC  X(02).                         
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  HDR2-DATE-DD                 PIC  X(02).                         
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  HDR2-DATE-YY                 PIC  X(02).                         
           05  FILLER                       PIC  X(09)  VALUE SPACES.           
                                                                                
       01  HDR3-RECORD.                                                         
           05  HDR3-CC                      PIC  X(01)  VALUE '0'.              
           05  FILLER                       PIC  X(10)  VALUE SPACES.           
           05  FILLER                       PIC  X(43)  VALUE                   
               'BRANCH  ACCOUNT SECURITY CUSIP             '.                   
           05  FILLER                       PIC  X(28)  VALUE                   
               'QUANTITY         DESCRIPTION'.                                  
                                                                                
       01  DTL1-RECORD.                                                         
           05  DTL1-CC                      PIC  X(01)  VALUE ' '.              
                                                                                
           05  FILLER                       PIC  X(10)  VALUE SPACES.           
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  DTL1-BRANCH                  PIC  X(03).                         
           05  FILLER                       PIC  X(04)  VALUE SPACES.           
           05  DTL1-ACCOUNT                 PIC  X(05).                         
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  DTL1-ADP-NUMBER              PIC  X(07).                         
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  DTL1-CUSIP                   PIC  X(09).                         
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  DTL1-QUANTITY                PIC ZZZ,ZZZ,ZZZ,ZZZ.9999-.          
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  DTL1-DESC                    PIC  X(50).                         
                                                                                
       01  DTL2-RECORD.                                                         
           05  DTL2-CC                      PIC  X(01)  VALUE ' '.              
                                                                                
           05  FILLER                       PIC  X(36)  VALUE SPACES.           
           05  DTL2-DESC                    PIC  X(90).                         
                                                                                
       01  TRAC-RECORD.                                                         
           05  TRAC-DETAIL                  PIC  X(133).                        
           05  TRAC-CONTROL.                                                    
               10  TRAC-CLIENT      COMP-3  PIC  9(03)  VALUE ZEROES.           
               10  FILLER                   PIC  X(08)  VALUE SPACES.           
                                                                                
           EJECT                                                                
           COPY BPDATESC.                                                       
                                                                                
           EJECT                                                                
           COPY BHINFO.                                                         
                                                                                
           EJECT                                                                
           COPY STUBCPY.                                                        
           EJECT                                                                
      *****************************************************************         
       PROCEDURE DIVISION.                                                      
      *****************************************************************         
                                                                                
           DISPLAY ' ============================================== '.          
           DISPLAY '   CAT880E - ACATS TYPE 2 TO TYPE 1 EQTY REPORT '.          
           DISPLAY ' ============================================== '.          
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
           PERFORM INITIAL-ROUTINE.                                             
           PERFORM BUILD-CLIENT-TABLE.                                          
           PERFORM PROCESSING-ROUTINE THRU PROCESS-EXIT                         
                    UNTIL INFILE-EOF.                                           
                                                                                
           PERFORM EOJ-ROUTINE.                                                 
                                                                                
           STOP RUN.                                                            
                                                                                
           EJECT                                                                
      ********************                                                      
       PROCESSING-ROUTINE.                                                      
      ********************                                                      
                                                                                
           READ INFILE INTO TYPE2-CASH-DETAIL-RECORD                            
               AT END                                                           
                  SET INFILE-EOF TO TRUE                                        
                  GO TO PROCESS-EXIT.                                           
                                                                                
           IF INFILE-RECORD(1:4) = 'DATE'                                       
              DISPLAY 'HEADER RECORD ' INFILE-RECORD                            
              GO TO PROCESS-EXIT.                                               
                                                                                
           IF TYPE2-CASH-ADP-CL-NO-X NOT = HDR1-CLIENT-NBR                      
              MOVE TYPE2-CASH-ADP-CL-NO-X   TO  HDR1-CLIENT-NBR                 
              MOVE TYPE2-CASH-ADP-CL-NO     TO  TRAC-CLIENT                     
              MOVE 0                        TO  PAGE-CNTR                       
              MOVE CLIENT-NAME (TYPE2-CASH-ADP-CL-NO)                           
                                            TO HDR1-CLIENT-NAME                 
              PERFORM WRITE-HEADER-ROUTINE                                      
           END-IF.                                                              
                                                                                
           IF TYPE2-CASH-SETTLE-LOC NOT = '40'                                  
              MOVE TYPE2-CASH-BRANCH-ACCOUNT(1:3) TO  DTL1-BRANCH               
              MOVE TYPE2-CASH-BRANCH-ACCOUNT(4:5) TO  DTL1-ACCOUNT              
              MOVE TYPE2-CASH-QUANTITY            TO  DTL1-QUANTITY             
              MOVE TYPE2-CASH-ADP-NUMBER          TO  DTL1-ADP-NUMBER           
              MOVE TYPE2-CASH-CUSIP               TO  DTL1-CUSIP                
              MOVE TYPE2-CASH-ASSET-DESC          TO  DTL1-DESC                 
              PERFORM WRITE-DETAIL-ROUTINE                                      
              IF TYPE2-CASH-ASSET-DESC(51 : 90) NOT = SPACES                    
                 MOVE TYPE2-CASH-ASSET-DESC(51 : 90) TO  DTL2-DESC              
                 PERFORM WRITE-DETAIL2-ROUTINE                                  
              END-IF                                                            
           END-IF.                                                              
                                                                                
       PROCESS-EXIT.  EXIT.                                                     
           EJECT                                                                
      **********************                                                    
       WRITE-HEADER-ROUTINE.                                                    
      **********************                                                    
                                                                                
           ADD 1                            TO  PAGE-CNTR.                      
           MOVE PAGE-CNTR                   TO  HDR1-PAGE-NBR                   
                                                                                
           MOVE HDR1-RECORD                 TO  TRAC-DETAIL.                    
           WRITE REPORT-RECORD            FROM  TRAC-RECORD.                    
                                                                                
           MOVE HDR2-RECORD                 TO  TRAC-DETAIL.                    
           WRITE REPORT-RECORD            FROM  TRAC-RECORD.                    
                                                                                
           MOVE HDR3-RECORD                 TO  TRAC-DETAIL.                    
           WRITE REPORT-RECORD            FROM  TRAC-RECORD.                    
                                                                                
           MOVE 4                           TO  LINE-CNTR.                      
                                                                                
           EJECT                                                                
      **********************                                                    
       WRITE-DETAIL-ROUTINE.                                                    
      **********************                                                    
                                                                                
           IF LINE-CNTR > 56                                                    
              PERFORM WRITE-HEADER-ROUTINE                                      
           END-IF.                                                              
                                                                                
           MOVE DTL1-RECORD                 TO  TRAC-DETAIL.                    
           WRITE REPORT-RECORD            FROM  TRAC-RECORD.                    
                                                                                
           ADD 1                            TO  LINE-CNTR.                      
                                                                                
      ***********************                                                   
       WRITE-DETAIL2-ROUTINE.                                                   
      ***********************                                                   
                                                                                
           MOVE DTL2-RECORD                 TO  TRAC-DETAIL.                    
           WRITE REPORT-RECORD            FROM  TRAC-RECORD.                    
                                                                                
           ADD 1                            TO  LINE-CNTR.                      
                                                                                
           EJECT                                                                
      *****************                                                         
       INITIAL-ROUTINE.                                                         
      *****************                                                         
           OPEN INPUT  INFILE.                                                  
           OPEN OUTPUT REPORT-FILE.                                             
                                                                                
           MOVE 'CAT880E'                TO  BPDATES-CALLING-PGM.               
           MOVE 'C'                      TO  BPDATES-REQ-TYPE.                  
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*    MOVE 'US'                     TO  BPDATES-CALENDAR-TYPE.             
CSG001     MOVE '  '                     TO  BPDATES-CALENDAR-TYPE.             
           CALL  BPDATES              USING  BPDATES-PARAMETERS.                
                                                                                
           IF BPD-VALID-RETURN                                                  
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY ' '                                                       
              DISPLAY '*******************************'                         
              DISPLAY '* BPDATES INVALID-RETURN = ' BPDATES-RETURN-CODE         
                      ' *'                                                      
              DISPLAY '* PROGRAM CAT880E IS ABENDING *'                         
              DISPLAY '*******************************'                         
              DISPLAY ' '                                                       
              CALL  ABEND             USING  ABEND-CODE                         
           END-IF.                                                              
                                                                                
           MOVE BPD-PROC-DATE               TO  WS-PROCESS-CCYYMMDD.            
           MOVE WS-PROCESS-MM               TO  HDR1-DATE-MM.                   
           MOVE WS-PROCESS-DD               TO  HDR1-DATE-DD.                   
           MOVE WS-PROCESS-YY               TO  HDR1-DATE-YY.                   
                                                                                
           ACCEPT WS-CURRENT-DATE FROM DATE.                                    
           MOVE WS-CURRENT-MM               TO  HDR2-DATE-MM.                   
           MOVE WS-CURRENT-DD               TO  HDR2-DATE-DD.                   
           MOVE WS-CURRENT-YY               TO  HDR2-DATE-YY.                   
                                                                                
      ********************                                                      
       BUILD-CLIENT-TABLE.                                                      
      ********************                                                      
                                                                                
           MOVE SPACES                      TO  CLIENT-TABLE.                   
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500                
              MOVE SPACES                   TO  BH-BROKER-HEADER-INFO           
              MOVE  '010'                   TO  BH-LOGICAL-RECORD-CODE          
              MOVE B1-SUB                   TO  BH-BROKER-NUMBER-N              
              CALL     GETB1V     USING        BH-BROKER-HEADER-INFO            
              IF BH-BROKER-ACTIVE                                               
                 MOVE BH-BROKER-NAME     TO  CLIENT-NAME (B1-SUB)               
              END-IF                                                            
           END-PERFORM.                                                         
      *************                                                             
       EOJ-ROUTINE.                                                             
      *************                                                             
                                                                                
           CLOSE  INFILE.                                                       
           CLOSE  REPORT-FILE.                                                  
           DISPLAY ' '.                                                         
           DISPLAY '**************************'.                                
           DISPLAY '* END OF CAT880E PROGRAM *'.                                
           DISPLAY '**************************'.                                
           DISPLAY ' '.                                                         
