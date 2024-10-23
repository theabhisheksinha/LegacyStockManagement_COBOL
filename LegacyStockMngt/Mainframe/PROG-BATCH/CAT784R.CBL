000001* PDX    - CAT784R  C0353123 03/24/14 13:59:56 TBLAMUR            00001000
000001* LRM006 SSR 96502 RECOMPILE FOR CBRS004.13 COPYBOOK CHANGE.              
000001* PDX    - CAT784R  C0325133 06/25/12 07:54:25 TBLAMUR            00001000
000001* LRM005 SSR 83556 RECOMPILE FOR CBRS002.12 COPYBOOK CHANGE.              
000001* PDX    - CAT784R  C0313692 09/23/11 10:56:15 TBLAMUR            00001000
000001* PDX    - CAT784R  C0299503 11/05/10 11:16:39 TBLAMUR            00001000
      * LRM004 SSR 72210 CBRS FILE EXPANSION.                                   
000001* PDX    - CAT784R  C0290020 02/05/10 14:33:33 TBLAMUR            00001000
      * LRM003 SSR 59603 OPTION SYMB; REMOVE HARDCODE Q STREAM                  
000001* PDX    - CAT784R  C0286877 10/15/09 14:59:01 TBLAMUR            00001000
      * LRM002 - SSR61023 OPTION SYMBOLOGY HARD CODE FOR Q STREAM ONLY. 00001000
000001* PDX    - CAT784R  C0252012 08/13/07 15:24:37 TBDOJUN            00001000
      * DJ0001 - SSR51272 REMOVE "ADP" FROM HEADING                     00001000
000001* PDX    - CAT784R  C0185363 02/10/04 10:45:50 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID. CAT784R.                                                     
      *---------------------------------------------------------------*         
      *REMARKS.                                                       *         
      *                                                               *         
      *  THIS PROGRAM - CREATES THE ACAT/TAX LOT DELIVERY REPORTS.    *         
      *                 RUNS 2X WITH PARM TO DEPICT MISSING TLE       *         
      *                 DETAILS OR TLE EDIT ERROR REPORT.             *         
      *                 THE INPUT FILE SHOULD BE SORTED INTO DESIRED  *         
      *                 SEQUENCE.  CLIENT BRANCH ACCOUNT.             *         
      *                                                               *         
      *---------------------------------------------------------------*         
           EJECT                                                                
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
                                                                                
       FILE-CONTROL.                                                            
                                                                                
           SELECT  TAXLOT-FILE         ASSIGN TO UT-S-INFILE.                   
           SELECT  REPORT-FILE         ASSIGN TO UT-S-REPORT.                   
                                                                                
           EJECT                                                                
      *****************************************************************         
       DATA DIVISION.                                                           
      *****************************************************************         
       FILE SECTION.                                                            
                                                                                
       FD  TAXLOT-FILE                                                          
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  TAXLOT-RECORD                 PIC X(1000).                           
                                                                                
       FD  REPORT-FILE                                                          
           RECORDING MODE IS F                                                  
           LABEL RECORDS STANDARD                                               
           BLOCK CONTAINS 0 RECORDS                                             
           RECORD CONTAINS 143 CHARACTERS.                                      
       01  REPORT-REC                  PIC X(143).                              
                                                                                
           EJECT                                                                
      *****************************************************************         
       WORKING-STORAGE  SECTION.                                                
      *****************************************************************         
       77  PGM-NAME                         PIC X(08)  VALUE 'CAT784R'.         
                                                                                
       77  ABEND-CODE           COMP        PIC S9(4)  VALUE +2000.             
                                                                                
       77  ACAT-RECS-TOTAL       COMP       PIC S9(9)  VALUE +0.                
                                                                                
       77  B1-SUB                           PIC S9(4)   COMP.                   
       77  LINECNT                          PIC 9(4)    VALUE 99.               
       77  PAGECNT                          PIC 9(5)    VALUE 0.                
       77  ACAT-BYPASS-CLI                  PIC 9(3)    VALUE 0.                
       77  ACAT-EXTRACT-CLI                 PIC 9(3)    VALUE 0.                
       77  ACAT-CLI-P                       PIC 9(3)    VALUE 0.                
                                                                                
       77  ACAT-FIRST-TIME-SW               PIC X(01)  VALUE 'Y'.               
           88  ACAT-FIRST-TIME                         VALUE 'Y'.               
                                                                                
       77  ACAT-HDR-SW                      PIC X(01)  VALUE ' '.               
           88  ACAT-HDR                                VALUE 'Y'.               
                                                                                
       77  ACAT-EOF-SW                      PIC X(01)  VALUE ' '.               
           88  ACAT-EOF                                VALUE 'Y'.               
                                                                                
       77  ADR-ACCT-TEST                    PIC X(02)  VALUE '  '.              
           88  ADR-IRA                                 VALUE '03' '04'          
                                                             '05'.              
       77  ACAT-DELIVER-SW                  PIC X      VALUE 'Y'.               
           88  ACAT-FIRST-DELIVER                      VALUE 'Y'.               
                                                                                
       77  ACAT-CLI-TOT-SW                  PIC X      VALUE ' '.               
           88  ACAT-CLIENT-TOTAL                       VALUE 'Y'.               
                                                                                
       77  ACAT-NAME-ADDR-STATUS            PIC X      VALUE ' '.               
           88  ACAT-NAME-ADDR-FOUND                    VALUE '1'.               
           88  ACAT-NAME-ADDR-NOT-FOUND                VALUE '2'.               
                                                                                
       01  WS-COUNTERS.                                                         
           05  ACAT-BYP-RECS            PIC 9(7)   COMP-3  VALUE ZERO.          
           05  ACAT-DTL-RECS            PIC 9(7)   COMP-3  VALUE ZERO.          
           05  ACAT-ACPT-RECS           PIC 9(7)   COMP-3  VALUE ZERO.          
           05  ACAT-REJ-RECS            PIC 9(7)   COMP-3  VALUE ZERO.          
                                                                                
           EJECT                                                                
       COPY ACATTAXA  REPLACING ==:TAXA:== BY ==TAXA==.                         
                                                                                
       COPY STUBCPY.                                                            
                                                                                
           COPY BPDATESC.                                                       
           COPY BHINFO.                                                         
           EJECT                                                                
       01  HDR1.                                                                
           05  FILLER                  PIC X       VALUE SPACES.                
           05  FILLER                  PIC X(11)   VALUE ' CAT784R - '.         
           05  H1-CLIENT               PIC X(3).                                
           05  FILLER                  PIC X      VALUE '-'.                    
           05  H1-CLIENT-NAME          PIC X(30).                               
           05  FILLER                  PIC X(3)   VALUE SPACES.                 
           05  FILLER                  PIC X(72)  VALUE                         
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.                    
           05  FILLER                  PIC X(5)   VALUE 'PAGE '.                
           05  H1-PGENO                PIC ZZZZ9.                               
                                                                                
       01  HDR2.                                                                
           05  FILLER                  PIC X(57) VALUE SPACES.                  
           05  FILLER                  PIC X(60) VALUE                          
               'TAX LOT ERROR REPORT '.                                         
           05  FILLER                  PIC X(5)  VALUE 'DATE '.                 
           05  H2-PROC-DATE.                                                    
               10  H2-MM               PIC X(2).                                
               10  FILLER              PIC X     VALUE '/'.                     
               10  H2-DD               PIC X(2).                                
               10  FILLER              PIC X     VALUE '/'.                     
               10  H2-YY               PIC X(2).                                
                                                                                
       01  HDR3.                                                                
           05  FILLER                  PIC X(59)  VALUE SPACES.                 
           05  FILLER                  PIC X(61)  VALUE                         
               'SEND TO TOA '.                                                  
                                                                                
       01  HDR4.                                                                
           05  FILLER                  PIC X(65)  VALUE                         
DJ0001     '  BRANCH-AC  SEC-NO   CUSIP      DESCRIPTION'.                      
           05  FILLER                  PIC X(30)  VALUE                         
           'CONTROL NBR    SEQ NBR'.                                            
                                                                                
       01  HDR5.                                                                
           05  FILLER                  PIC X(55)  VALUE                         
           '                       CONTRA BRKR AC        RQST DAY'.             
                                                                                
       01  DETAIL-LINE-1.                                                       
           05  FILLER                  PIC X(2)  VALUE SPACES.                  
           05  DL1-BRANCH              PIC X(3).                                
           05  FILLER                  PIC X     VALUE '-'.                     
           05  DL1-ACCOUNT             PIC X(5).                                
           05  FILLER                  PIC X(2)  VALUE SPACE.                   
DJ0001     05  DL1-SEC-NO              PIC X(7).                                
           05  FILLER                  PIC X(2)  VALUE SPACES.                  
           05  DL1-CUISP               PIC X(9).                                
           05  FILLER                  PIC X(2)  VALUE SPACES.                  
           05  DL1-DESC                PIC X(30).                               
           05  FILLER                  PIC X(3)  VALUE SPACES.                  
           05  DL1-CONTROL-NBR         PIC X(11).                               
           05  FILLER                  PIC X(2)  VALUE SPACES.                  
           05  DL1-ASSET-SEQ-NBR       PIC ZZZ9.                                
           05  FILLER                  PIC X(2)  VALUE SPACES.                  
           05  DL1-ERROR-MSG           PIC X(42).                               
           05  FILLER REDEFINES DL1-ERROR-MSG.                                  
               07  DL1-ERROR-QTY-MSG   PIC X(22).                               
               07  DL1-ERROR-QUANTITY  PIC ZZZ,ZZZ,ZZZ,ZZZ.9999.                
                                                                                
       01  DETAIL-LINE-2.                                                       
           05  FILLER                  PIC X(23)  VALUE SPACES.                 
LRM004     05  DL2-RCVR-NBR            PIC X(8).                                
           05  FILLER                  PIC X(02)  VALUE SPACES.                 
           05  DL2-ACCT-RCVR-NBR       PIC X(16).                               
           05  FILLER                  PIC X(2)   VALUE SPACES.                 
           05  DL2-OPTION-SYMBOL       PIC X(6).                                
           05  FILLER                  PIC X(02)  VALUE SPACES.                 
LRM002     05  DL2-OPT-EXPIRE-DT       PIC X(10)  VALUE SPACES.                 
LRM002     05  FILLER                  PIC X(38)  VALUE                         
LRM002     '                             ACAT QTY'.                             
           05  DL2-QUANTITY            PIC ZZZ,ZZZ,ZZZ,ZZZ.9999.                
                                                                                
       01  PRINTAREA.                                                           
           05  PRINTSPACE.                                                      
               10  CC                  PIC X.                                   
               10  PRINT-AREA          PIC X(132).                              
           05  TRACSPACE.                                                       
               10  TRAC-CLI            PIC 9(3) COMP-3.                         
               10  TRAC-CNTL           PIC 9(3) COMP-3.                         
               10  FILLER              PIC X(6) VALUE LOW-VALUES.               
                                                                                
           EJECT                                                                
       COPY ACATDELV.                                                           
           EJECT                                                                
                                                                                
       01  SAVE-KEY.                                                            
           05  SAVE-CLIENT             PIC X(3).                                
                                                                                
       01  WORK-DATE-MMDDYY            PIC X(6).                                
                                                                                
       01  PROC-DATE.                                                           
           05  PD-CC                   PIC X(2).                                
           05  PD-YY                   PIC X(2).                                
           05  PD-MM                   PIC X(2).                                
           05  PD-DD                   PIC X(2).                                
                                                                                
           EJECT                                                                
       01  B1-TABLE-AREA.                                                       
           03  B1-TABLE OCCURS 500 TIMES.                                       
               05  B1-CLI-NAME              PIC X(30).                          
           EJECT                                                                
      *****************************************************************         
       LINKAGE SECTION.                                                         
      *****************************************************************         
       01  PARM-AREA.                                                           
           05  PARM-LENGTH                  PIC S9(4) COMP SYNC.                
           05  PARM-INFO.                                                       
LRM002         10  PARM-STREAM              PIC X.                              
               10  PARM-REPORT-VERSION      PIC X(5).                           
                   88  PARM-ERROR-RUN                 VALUE 'ERROR'.            
                                                                                
           EJECT                                                                
       PROCEDURE DIVISION USING PARM-AREA.                                      
       MAINLINE SECTION.                                                        
DJ0001     DISPLAY 'CAT784R - ACATS TAX LOT ERROR REPORT'.                      
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM  100-HOUSEKEEPING                                            
           PERFORM  200-INIT-B1-LOOP.                                           
           PERFORM  300-PRINT-REPORT THRU                                       
                    300-PRINT-REPORT-EXIT                                       
               UNTIL ACAT-EOF.                                                  
                                                                                
           PERFORM  900-ENDJOB-ROUTINE                                          
              THRU  900-ENDJOB-ROUTINE-EXIT.                                    
                                                                                
           GOBACK.                                                              
                                                                                
           EJECT                                                                
      ******************                                                        
       100-HOUSEKEEPING.                                                        
      ******************                                                        
                                                                                
           MOVE  PGM-NAME                TO BPDATES-CALLING-PGM.                
           MOVE  'C'                     TO BPDATES-REQ-TYPE.                   
           CALL    BPDATES            USING BPDATES-PARAMETERS.                 
                                                                                
           MOVE  BPD-PROC-DATE           TO  PROC-DATE.                         
           MOVE  PD-MM                   TO  H2-MM.                             
           MOVE  PD-DD                   TO  H2-DD.                             
           MOVE  PD-YY                   TO  H2-YY.                             
           MOVE  BPD-PROC-DATE (5:4)     TO  WORK-DATE-MMDDYY (1:4);            
           MOVE  BPD-PROC-DATE (3:2)     TO  WORK-DATE-MMDDYY (5:2);            
                                                                                
           DISPLAY 'PROCESS DATE = ' BPD-PROC-DATE.                             
                                                                                
           OPEN INPUT  TAXLOT-FILE.                                             
           OPEN OUTPUT REPORT-FILE.                                             
                                                                                
      ***************                                                           
       200-INIT-B1-LOOP.                                                        
      ***************                                                           
           PERFORM VARYING B1-SUB FROM 1 BY 1                                   
                    UNTIL  B1-SUB  >  500                                       
                                                                                
             MOVE  ' '                    TO  BH-BROKER-HEADER-INFO             
             MOVE  B1-SUB                 TO  BH-BROKER-NUMBER-N                
             MOVE  '010'                  TO  BH-LOGICAL-RECORD-CODE            
             MOVE  ' '                    TO  BH-B2-INFO-ID                     
             CALL   GETB1V              USING BH-BROKER-HEADER-INFO             
             END-CALL                                                           
                                                                                
             MOVE BH-BROKER-NAME  TO B1-CLI-NAME (B1-SUB)                       
                                                                                
           END-PERFORM.                                                         
           EJECT                                                                
      *****************                                                         
       300-PRINT-REPORT.                                                        
      *****************                                                         
                                                                                
           READ TAXLOT-FILE INTO TAXA-DETAIL-RECORD                             
             AT END                                                             
                SET ACAT-EOF TO TRUE                                            
                GO TO 300-PRINT-REPORT-EXIT                                     
           END-READ.                                                            
                                                                                
           IF TAXLOT-RECORD(1 : 1) NOT = 'A'                                    
              GO TO 300-PRINT-REPORT                                            
           END-IF.                                                              
                                                                                
           IF ACAT-FIRST-TIME                                                   
             MOVE 'N' TO ACAT-FIRST-TIME-SW.                                    
                                                                                
           IF TAXA-ADP-CL-NO-X = SAVE-CLIENT                                    
              CONTINUE                                                          
           ELSE                                                                 
              MOVE ZERO TO PAGECNT                                              
              PERFORM 750-HEADERS THRU                                          
                      750-HEADERS-EXIT                                          
              MOVE TAXA-ADP-CL-NO-X TO SAVE-CLIENT.                             
                                                                                
           PERFORM 700-REPORTING THRU                                           
                   700-REPORTING-EXIT.                                          
                                                                                
       300-PRINT-REPORT-EXIT. EXIT.                                             
                                                                                
           EJECT                                                                
       700-REPORTING.                                                           
           IF LINECNT > 55                                                      
             PERFORM 750-HEADERS THRU                                           
                     750-HEADERS-EXIT.                                          
                                                                                
           MOVE TAXA-ACCT-DLVR-NBR             TO DL1-BRANCH.                   
           MOVE TAXA-ACCT-DLVR-NBR(4 : 5)      TO DL1-ACCOUNT.                  
DJ0001     MOVE TAXA-ADP-SEC-NO                TO DL1-SEC-NO                    
           MOVE TAXA-CUSIP-NUM                 TO DL1-CUISP                     
           MOVE TAXA-SEC-D-1-NEW               TO DL1-DESC                      
           MOVE TAXA-CONTROL-NUM               TO DL1-CONTROL-NBR               
           MOVE TAXA-ASSET-SEQ-NO-9            TO DL1-ASSET-SEQ-NBR             
           IF TAXA-CALC-QUANTITY NOT = ZEROS                                    
              MOVE 'TLE DETAIL QTY NOT = '     TO DL1-ERROR-QTY-MSG             
              MOVE TAXA-CALC-QUANTITY          TO DL1-ERROR-QUANTITY            
           ELSE                                                                 
              MOVE 'MISSING TLE DETAILS'       TO DL1-ERROR-MSG                 
           END-IF.                                                              
                                                                                
           MOVE DETAIL-LINE-1                  TO PRINT-AREA.                   
           MOVE '0'                            TO CC.                           
                                                                                
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT                                          
                                                                                
LRM004     MOVE TAXA-SUBMITTING-BRKR(5 : 4)    TO DL2-RCVR-NBR                  
           MOVE TAXA-ACCT-RCV-NBR              TO DL2-ACCT-RCVR-NBR             
           MOVE TAXA-ASSET-QTY-DEC             TO DL2-QUANTITY                  
           MOVE TAXA-OPTION-SYMBOL             TO DL2-OPTION-SYMBOL             
LRM002     IF TAXA-OPT-EXP-DATE-NEW > SPACES                                    
LRM002        MOVE TAXA-OPT-EXP-DATE-NEW (1 : 4)                                
LRM002                                TO DL2-OPT-EXPIRE-DT(1 : 4)               
LRM002        MOVE TAXA-OPT-EXP-DATE-NEW (5 : 2)                                
LRM002                                TO DL2-OPT-EXPIRE-DT(6 : 2)               
LRM002        MOVE TAXA-OPT-EXP-DATE-NEW (7 : 2)                                
LRM002                                TO DL2-OPT-EXPIRE-DT(9 : 2)               
LRM002        MOVE '-'                TO DL2-OPT-EXPIRE-DT(5 : 1)               
LRM002                                   DL2-OPT-EXPIRE-DT(8 : 1)               
LRM002     END-IF.                                                              
                                                                                
           MOVE DETAIL-LINE-2                  TO PRINT-AREA.                   
           MOVE ' '                            TO CC.                           
                                                                                
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT.                                         
                                                                                
       700-REPORTING-EXIT. EXIT.                                                
                                                                                
       725-PRINT-LINE.                                                          
                                                                                
           WRITE REPORT-REC FROM PRINTAREA.                                     
           IF CC = '1'                                                          
             MOVE 6 TO LINECNT.                                                 
           IF CC = '-'                                                          
             ADD 3 TO LINECNT.                                                  
           IF CC = '0'                                                          
             ADD 2 TO LINECNT.                                                  
           IF CC = ' '                                                          
             ADD 1 TO LINECNT.                                                  
                                                                                
       725-PRINT-LINE-EXIT.  EXIT.                                              
                                                                                
       750-HEADERS.                                                             
                                                                                
           MOVE TAXA-ADP-CL-NO          TO  TRAC-CLI.                           
                                                                                
           ADD  1       TO  PAGECNT.                                            
           MOVE TAXA-ADP-CL-NO-X        TO  H1-CLIENT.                          
           MOVE B1-CLI-NAME (TRAC-CLI)  TO  H1-CLIENT-NAME.                     
           MOVE PAGECNT                 TO  H1-PGENO.                           
           MOVE HDR1                    TO  PRINT-AREA.                         
           MOVE '1'                     TO  CC.                                 
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT.                                         
                                                                                
           MOVE PD-MM                   TO  H2-MM.                              
           MOVE PD-DD                   TO  H2-DD.                              
           MOVE PD-YY                   TO  H2-YY.                              
           MOVE HDR2                    TO  PRINT-AREA.                         
           MOVE '0'                     TO  CC.                                 
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT.                                         
                                                                                
           MOVE HDR3                    TO  PRINT-AREA.                         
           MOVE ' '                     TO  CC.                                 
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT.                                         
                                                                                
           MOVE HDR4                    TO  PRINT-AREA.                         
           MOVE '0'                     TO  CC.                                 
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT.                                         
                                                                                
           MOVE HDR5                    TO  PRINT-AREA.                         
           MOVE ' '                     TO  CC.                                 
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT.                                         
                                                                                
           MOVE SPACES                  TO  PRINT-AREA.                         
           MOVE ' '                     TO  CC.                                 
           PERFORM 725-PRINT-LINE THRU                                          
                   725-PRINT-LINE-EXIT.                                         
                                                                                
       750-HEADERS-EXIT.  EXIT.                                                 
                                                                                
       900-ENDJOB-ROUTINE.                                                      
                                                                                
           DISPLAY '************* CAT784R CONTROL TOTALS *************'.        
                                                                                
           DISPLAY 'ACAT DETAIL RCDS READ     '     ACAT-DTL-RECS.              
           DISPLAY 'ACAT RCDS BYPASSED        '     ACAT-BYP-RECS.              
           DISPLAY 'ACAT RCDS REJECTED        '     ACAT-REJ-RECS.              
           DISPLAY 'ACAT RCDS ACCEPTED        '     ACAT-ACPT-RECS.             
                                                                                
           CLOSE REPORT-FILE.                                                   
                                                                                
       900-ENDJOB-ROUTINE-EXIT. EXIT.                                           
                                                                                
