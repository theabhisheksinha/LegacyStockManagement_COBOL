000001* PDX    - CAT885B  C0252012 08/13/07 15:24:16 TBDOJUN            00001000
      * DJ0001 - SSR51272 REMOVE "ADP" FROM HEADING                             
      * PDX    - CAT885B  C0208185 07/08/04 16:05:48 TBYOHON                    
      * PDX    - CAT885B  C0154990 06/29/01 08:53:46 TBLAMUR                    
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID. CAT885B.                                                     
       AUTHOR. B. REBILLON.                                                     
      *---------------------------------------------------------------*         
      *REMARKS.                                                       *         
      *                                                               *         
      *  THIS PROGRAM - READ THE EXTRACT FILE FROM CAT885A,           *         
      *                 MATCH WITH BALANCE RECORD D                    *        
      *                 WRITE REPORT OUT BASED ON FOLLOWING SELECTION *         
      *                 CRITERIA,                                     *         
      *  1. CURRENCY   HAS TO BE GREATER THAN 0 AND NOT EQUAL 999     *         
      *  2. REGULAR HORDERS AND ACCOUNT BALANCE DETAIL                *         
      *  3. BYPASS B212 RECORDS WITH SELECTED SEC NUMBERS             *         
      *  4. BYPASS CPH AND CPT B212 WITH SECURITY CD < 0              *         
      *  5. IF B212AL-CUST-POSITION-HDR-REC                           *         
      *        GET B212AL-CPH-QTY FOR POSITION                        *         
      *  6. IF B212AL-TRID = '7'                                      *         
      *        GET B212AL-CAH-TD-BALANCE                              *         
      *  REPORT SEQUENCE: CLIENT, ACCOUNT #,  ACAT CONTROL NUMBER     *         
      *                 AND ACAT CONTROL NUMBER                       *         
      *                                                               *         
      *---------------------------------------------------------------*         
                                                                                
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
                                                                                
       FILE-CONTROL.                                                            
           SELECT  EXTR-FILE           ASSIGN  TO  EXTRACT.                     
           SELECT  REPT-FILE           ASSIGN  TO  ACTFCRP.                     
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  REPT-FILE          RECORDING MODE IS F                               
           BLOCK CONTAINS 0 RECORDS                                             
           LABEL RECORDS ARE STANDARD.                                          
       01  REPT-REC.                                                            
           05  FILLER                 PIC X(133).                               
           05  REPT-CLI                PIC 9(3) COMP-3.                         
           05  REPT-CTL                PIC X(8).                                
       FD  EXTR-FILE          RECORDING MODE IS F                               
           BLOCK CONTAINS 0 RECORDS                                             
           LABEL RECORDS ARE STANDARD.                                          
       01  EXTR-REC                   PIC X(80).                                
                                                                                
                                                                                
                                                                                
                                                                                
      *****************************************************************         
       WORKING-STORAGE  SECTION.                                                
      *****************************************************************         
       01  PGM-NAME                         PIC X(08)  VALUE 'CAT885B'.         
                                                                                
           COPY STUBCPY.                                                        
           03  ZGETCHOL               PIC X(8) VALUE 'ZGETCHOL'.                
           03  ZGETCBAL               PIC X(8) VALUE 'ZGETCBAL'.                
       01  WS-ABORT-CODE             PIC S9(4) COMP  VALUE +1100.               
                                                                                
      ***------------------------------------------------------------***        
      ***-           I N P U T   R E C O R D    A R E A S           -***        
      ***------------------------------------------------------------***        
       01  GETCHOL-PARM.                                                        
           COPY HOLDPARM REPLACING ==:GETCHOL:==  BY  ==GETCHOL==.              
                                                                                
       01  IN-HOLDER-REC.                                                       
           COPY CUSHOL                                                          
                   REPLACING ==:CUSHOL:== BY ==INPHOL==.                        
                                                                                
       01  GETCBAL-PARM.                                                        
           COPY HOLDPARM REPLACING ==:GETCHOL:==  BY  ==GETCBAL==.              
                                                                                
       01  IN-BALANCE-REC.                                                      
           COPY CUSBAL                                                          
                   REPLACING ==:CUSBAL:== BY ==INPBAL==.                        
                                                                                
       01  EXTR-AREA.                                                           
           05  EXTR-REC-DTL.                                                    
               10 PROCESS-KEY.                                                  
                  15 EXTR-CLIENT-N      PIC 9(3).                               
                  15 EXTR-CLIENT REDEFINES  EXTR-CLIENT-N   PIC X(3).           
                     88  FILE-HEADER        VALUE X'000000'.                    
                     88  FILE-TRAILER       VALUE '999'.                        
                  15 EXTR-BR-ACCT.                                              
                     20 EXTR-BRANCH        PIC X(3).                            
                        88  CLIENT-HEADER      VALUE X'000000'.                 
                        88  CLIENT-TRAILER     VALUE X'FFFFFF'.                 
                     20 EXTR-ACCOUNT       PIC X(5).                            
               10 EXTR-ACAT-CNTL-NBR    PIC X(14).                              
               10 EXTR-ACAT-RCV-NBR     PIC X(4).                               
               10 EXTR-ACAT-STTS-CD     PIC X(3).                               
               10 FILLER                PIC X(48).                              
           05  EXTR-REC-HDR REDEFINES EXTR-REC-DTL.                             
               10 FILLER               PIC X(51).                               
               10 EXTR-PROC-DATE.                                               
                   15 EXTR-MM          PIC X(2).                                
                   15 EXTR-DD          PIC X(2).                                
                   15 EXTR-CC          PIC X(2).                                
                   15 EXTR-YY          PIC X(2).                                
               10 FILLER               PIC X(21).                               
           05  EXTR-CLI-HDR REDEFINES EXTR-REC-DTL.                             
               10 EXTR-HDR-CL          PIC 9(3).                                
               10 FILLER               PIC X(33).                               
               10 EXTR-CLI-NAME        PIC X(30).                               
               10 FILLER               PIC X(14).                               
           05  EXTR-CLI-TRL REDEFINES EXTR-REC-DTL.                             
               10 EXTR-TRL-CL          PIC 9(3).                                
               10 FILLER               PIC X(38).                               
               10 EXTR-CLI-CNT         PIC 9(7).                                
               10 FILLER               PIC X(32).                               
           05  EXTR-REC-TRL REDEFINES EXTR-REC-DTL.                             
               10 FILLER               PIC X(46).                               
               10 EXTR-TRL-CNT         PIC 9(7).                                
               10 FILLER               PIC X(27).                               
                                                                                
       COPY BHINFO.                                                             
       COPY BHMGN.                                                              
       COPY BHMRGN.                                                             
       COPY BHMG3.                                                              
       COPY BHACAT.                                                             
       COPY BHBTS2.                                                             
       COPY BHATB.                                                              
       COPY CURLOOK.                                                            
       01  CURR-AREA.                                                           
           05  CUR-ARGUMENT    PIC 9(3).                                        
           05  CUR-RET-CODE    PIC X(1).                                        
           05  CUR-NUM         PIC X(3).                                        
           05  CUR-SYM         PIC X(2)  VALUE SPACES.                          
           05  CUR-NAME        PIC X(16).                                       
                                                                                
       COPY GETNACOB.                                                           
       01  GETNA-SEGMENT-INCLUDES.                                              
       COPY NASEGHDR.                                                           
       COPY NASEGPPA.                                                           
       COPY NASEGPPB.                                                           
       COPY NASEGPPI.                                                           
       COPY NNASGPPN.                                                           
       COPY NASEGEND.                                                           
                                                                                
       01  PROGRAM-SWITCHES.                                                    
           05  END-OF-EXTR-SW               PIC X(1) VALUE 'N'.                 
               88 EXTR-EOF                  VALUE 'Y'.                          
           05  FIRST-PASS-SW            PIC X  VALUE SPACE.                     
               88  FIRST-TIME-THRU             VALUE SPACE.                     
               88  NOT-FIRST-PASS              VALUE '1'.                       
           05  SUBHEADINGS-PRINT-SW             PIC X(01)  VALUE ' '.           
               88  SUBHEADINGS-PRINTED                     VALUE 'Y'.           
               88  SUBHEADINGS-NOT-PRINTED                 VALUE ' '.           
           05 B1-SW                     PIC X VALUE 'N'.                        
              88  SUPPRESS-REPORT                VALUE 'N'.                     
              88  PROCESS-CLIENT                 VALUE 'Y'.                     
       01  LITERALS.                                                            
           05 PRINT-DASH               PIC X     VALUE '-'.                     
       01  COUNTERS.                                                            
           05  PAGE-CNT                 PIC 9(6) COMP-3 VALUE 0.                
           05  LINE-LIMT                PIC 99   COMP-3 VALUE 55.               
           05  LINE-CNT                 PIC 99   COMP-3 VALUE 65.               
           05  TEST-LINE-CNT            PIC 99   COMP-3 VALUE 0.                
           05  CLIENT-PROC-CNT          PIC S9(9) COMP-3 VALUE 0.               
           05  PROC-ACCT-CNT            PIC S9(9) COMP-3 VALUE 0.               
           05  READ-EXTR-CLIENT-CNT     PIC S9(9) COMP-3 VALUE 0.               
           05  EXTR-READ-CNT            PIC S9(11) COMP-3 VALUE 0.              
           05  B212-READ-CNT            PIC S9(11) COMP-3 VALUE 0.              
           05  B212-PROC-CNT            PIC S9(9) COMP-3 VALUE 0.               
           05  CPH-PROC-CNT             PIC S9(9) COMP-3 VALUE 0.               
           05  CPT-PROC-CNT             PIC S9(9) COMP-3 VALUE 0.               
           05  CAH-PROC-CNT             PIC S9(9) COMP-3 VALUE 0.               
           05  REC-CNT-DISP             PIC ZZ,ZZZ,ZZZ,ZZ9.                     
       01  INTERMEDIATE-VARIABLES.                                              
           05 WS-SEC-NO                        PIC X(07).                       
              88 BYPASS-SEC-NO          VALUE  'A000555', 'A000927',            
                                               'A000928',                       
                                               '8660000' THRU '8661299'         
                                               '8667800' THRU '8668799'         
                                               '9997292' THRU '9999999'.        
           05 HOLD-EXTR-CLIENT          PIC 9(3)  VALUE 0.                      
           05 HOLD-EXTR-CLIENT-NAME     PIC X(30).                              
           05 HOLD-EXTR-BR-ACCT.                                                
              10  HOLD-EXTR-BRANCH      PIC X(3)  VALUE '000'.                  
              10  HOLD-EXTR-ACCOUNT     PIC X(5)  VALUE '00000'.                
           05 HOLD-B212-ACCT            PIC X(5)  VALUE '00000'.                
           05 HOLD-B212-CURR            PIC 9(3) COMP-3 VALUE 0.                
              88  B212-CURR-USD            VALUE 0.                             
           05 HOLD-CURR-SYM             PIC X(3).                               
           05 WS-SUB                    PIC 9(4) COMP.                          
           05  WS-HOL-KEY.                                                      
               10  WS-HOL-CLT        PIC  9(03) VALUE 0.                        
               10  WS-HOL-BRAACCT.                                              
                 12  WS-HOL-BRA      PIC  X(03).                                
                 12  WS-HOL-ACCT     PIC  X(05).                                
               10  WS-HOL-CUR        PIC  9(03) COMP-3.                         
               10  WS-HOL-TYPE       PIC  X.                                    
           05  WS-BAL-KEY.                                                      
               10  WS-BAL-CLT        PIC  9(03) VALUE 0.                        
               10  WS-BAL-BRAACCT.                                              
                 12  WS-BAL-BRA      PIC  X(03).                                
                 12  WS-BAL-ACCT     PIC  X(05).                                
               10  WS-BAL-CUR        PIC  9(03) COMP-3.                         
               10  WS-BAL-TYPE       PIC  X.                                    
           05  WS-SAV-KEY.                                                      
               10  WS-SAV-CLT        PIC  9(03) VALUE 0.                        
               10  WS-SAV-BRAACCT.                                              
                 12  WS-SAV-BRA      PIC  X(03).                                
                 12  WS-SAV-ACCT     PIC  X(05).                                
               10  WS-SAV-CUR        PIC  9(03) COMP-3.                         
                                                                                
      ***--------------------------------------------------------------         
      ***---    REPORT HEADINGS AND SUBHEADINGS                                 
      ***--------------------------------------------------------------         
       01  HEAD1-LINE.                                                          
           05  FILLER                    PIC X(1) VALUE '1'.                    
           05  FILLER                    PIC X(10) VALUE 'CAT885B   '.          
           05  FILLER                    PIC X(6)  VALUE SPACES.                
           05  FILLER                    PIC X(7)  VALUE 'CLIENT '.             
           05  HEAD1-CLIENT-NUM          PIC 999.                               
           05  FILLER                    PIC X(03) VALUE ' - '.                 
           05  HEAD1-CLIENT-NAME         PIC X(30) VALUE SPACES.                
           05  FILLER                    PIC X(08) VALUE SPACES.                
           05  FILLER                    PIC X(29) VALUE                        
                'ACATS FOREIGN CURRENCY REPORT'.                                
           05  FILLER                    PIC X(08) VALUE SPACES.                
           05  HEAD1-DATE-MM             PIC 99.                                
           05  FILLER                    PIC X VALUE '/'.                       
           05  HEAD1-DATE-DD             PIC 99.                                
           05  FILLER                    PIC X VALUE '/'.                       
           05  HEAD1-DATE-YY             PIC 99.                                
           05  FILLER                    PIC X(07) VALUE SPACES.                
           05  FILLER                    PIC X(5)  VALUE 'PAGE'.                
           05  HEAD1-PAGE-NUM            PIC ZZZZZ9.                            
           05  FILLER                    PIC X(02) VALUE SPACES.                
           05  HEAD1-TAG-CLT-NUM         PIC 999 COMP-3.                        
           05  HEAD1-CONTROL             PIC X(8) VALUE '00000000'.             
       01  SUBHD1-LINE.                                                         
           05 FILLER              PIC X(1).                                     
           05 FILLER              PIC X(8)  VALUE 'ACCT #: '.                   
           05 SUBHD1-BR-ACCT      PIC X(9).                                     
           05 FILLER              PIC X(3)  VALUE SPACES.                       
           05 FILLER              PIC X(6)  VALUE 'NAME: '.                     
           05 SUBHD1-NAME         PIC X(20).                                    
           05 FILLER              PIC X(3)  VALUE SPACES.                       
           05 FILLER              PIC X(16)  VALUE 'ACAT CONTROL #: '.          
           05 SUBHD1-ACAT-CTL     PIC X(14).                                    
           05 FILLER              PIC X(6)  VALUE SPACES.                       
           05 FILLER              PIC X(15)  VALUE 'CONTRA BROKER: '.           
           05 SUBHD1-ACAT-RCV-NBR PIC X(4).                                     
           05 FILLER              PIC X(28)  VALUE SPACES.                      
           05 SUBHD1-TAG-CLT-NUM  PIC 999 COMP-3.                               
           05 SUBHD1-CONTROL      PIC X(8) VALUE LOW-VALUE.                     
       01  SUBHD2-LINE.                                                         
           05 FILLER        PIC X(1).                                           
           05 FILLER          PIC X(17) VALUE ALL '-'.                          
           05 FILLER        PIC X(3)    VALUE SPACES.                           
           05 FILLER          PIC X(26) VALUE ALL '-'.                          
           05 FILLER        PIC X(3)    VALUE SPACES.                           
           05 FILLER          PIC X(30) VALUE ALL '-'.                          
           05 FILLER        PIC X(6)    VALUE SPACES.                           
           05 FILLER          PIC X(19) VALUE  ALL '-'.                         
           05 FILLER        PIC X(28)   VALUE SPACES.                           
           05 SUBHD2-TAG-CLT-NUM PIC 999 COMP-3.                                
           05 SUBHD2-CONTROL            PIC X(8) VALUE LOW-VALUE.               
       01  SUBHD3-LINE.                                                         
           05 FILLER        PIC X(1).                                           
           05 FILLER        PIC X(29) VALUE SPACES.                             
           05 FILLER        PIC X(4)  VALUE 'CURR'.                             
           05 FILLER        PIC X(2)   VALUE SPACES.                            
           05 FILLER        PIC X(4)  VALUE 'TYPE'.                             
           05 FILLER        PIC X(1)   VALUE SPACES.                            
DJ0001     05 FILLER        PIC X(07) VALUE 'SEC NO '.                          
           05 FILLER        PIC X(3)  VALUE SPACES.                             
           05 FILLER        PIC X(22) VALUE '       POSITION       '.           
           05 FILLER        PIC X(2)  VALUE SPACES.                             
           05 FILLER        PIC X(23) VALUE '       BALANCE         '.          
           05 FILLER        PIC X(3)  VALUE SPACES.                             
           05 FILLER        PIC X(30)                                           
                            VALUE '    SECURITY DESCRIPTION      '.             
           05 FILLER        PIC X(2)  VALUE SPACES.                             
           05 SUBHD3-TAG-CLT-NUM          PIC 999 COMP-3.                       
           05 SUBHD3-CONTROL              PIC X(8) VALUE LOW-VALUE.             
       01  SUBHD4-LINE.                                                         
           05 FILLER        PIC X(1).                                           
           05 FILLER        PIC X(29) VALUE SPACES.                             
           05 FILLER        PIC X(4)  VALUE ALL '_'.                            
           05 FILLER        PIC X(2)  VALUE SPACES.                             
           05 FILLER        PIC X(4)  VALUE ALL '_'.                            
           05 FILLER        PIC X(1)   VALUE SPACES.                            
           05 FILLER        PIC X(07) VALUE ALL '_'.                            
           05 FILLER        PIC X(3)    VALUE SPACES.                           
           05 FILLER        PIC X(22) VALUE  ALL '_'.                           
           05 FILLER        PIC X(2)   VALUE SPACES.                            
           05 FILLER        PIC X(23) VALUE ALL '_'.                            
           05 FILLER        PIC X(3)    VALUE SPACES.                           
           05 FILLER        PIC X(30) VALUE ALL '_'.                            
           05 FILLER        PIC X(2)    VALUE SPACES.                           
           05 SUBHD4-TAG-CLT-NUM          PIC 999 COMP-3.                       
           05 SUBHD4-CONTROL              PIC X(8) VALUE LOW-VALUE.             
                                                                                
      ***--------------------------------------------------------------         
      ***-    DETAIL LINES                                                      
      ***--------------------------------------------------------------         
       01  DETAIL-LINE.                                                         
           05 FILLER        PIC X(1).                                           
           05 DETAIL-GROUP1.                                                    
              10 FILLER          PIC X(30)  VALUE SPACES.                       
              10 DETAIL-CURR-SYM PIC X(3) VALUE SPACES.                         
              10 FILLER          PIC X(3)   VALUE SPACES.                       
              10 DETAIL-TYPE     PIC X(1).                                      
              10 FILLER          PIC X(3)   VALUE SPACES.                       
DJ0001        10 DETAIL-SEC-NO   PIC X(07).                                     
              10 FILLER          PIC X(3)   VALUE SPACES.                       
              10 DETAIL-CPH-POS  PIC ZZZ,ZZZ,ZZZ,ZZ9.99999-                     
                                          BLANK WHEN ZERO.                      
              10 FILLER          PIC X(2)  VALUE SPACES.                        
              10 DETAIL-CAH-BAL  PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZ9.99-                    
                                          BLANK WHEN ZERO.                      
              10 FILLER          PIC X(3)   VALUE SPACES.                       
           05 DETAIL-SEC-DESC    PIC X(30).                                     
           05 FILLER             PIC X(2)  VALUE SPACES.                        
           05 DETAIL-TAG-CLT-NUM          PIC 999 COMP-3.                       
           05 DETAIL-CONTROL              PIC X(8) VALUE LOW-VALUE.             
                                                                                
       01  DETAIL2-LINE.                                                        
           05 FILLER        PIC X(1).                                           
           05 FILLER        PIC X(100) VALUE SPACES.                            
           05 DETAIL2-SEC-DESC2 PIC X(30).                                      
           05 FILLER        PIC X(2)  VALUE SPACES.                             
           05 DETAIL2-TAG-CLT-NUM          PIC 999 COMP-3.                      
           05 DETAIL2-CONTROL              PIC X(8) VALUE LOW-VALUE.            
                                                                                
       01  FOOT1-LINE.                                                          
           05  FILLER                    PIC X(01) VALUE ' '.                   
           05  FILLER                    PIC X(09) VALUE SPACES.                
           05  FILLER                    PIC X(49) VALUE                        
                'TOTAL RECORDS PROCESSED FOR THE CLIENT: '.                     
           05  FOOT1-PROC-CNT            PIC ZZ,ZZZ,ZZZ,ZZ9.                    
           05  FILLER                    PIC X(60) VALUE SPACES.                
           05  FOOT1-TAG-CLT-NUM          PIC 999 COMP-3.                       
           05  FOOT1-CONTROL              PIC X(8) VALUE LOW-VALUE.             
       01  EMPTY-LINE.                                                          
           05  FILLER                    PIC X(01) VALUE ' '.                   
           05  FILLER                    PIC X(33) VALUE SPACES.                
           05  FILLER                    PIC X(09) VALUE ALL '*'.               
           05  FILLER                    PIC X(44) VALUE                        
                'NO FOREIGN POSTIONS/BALANCES TO REPORT TODAY'.                 
           05  FILLER                    PIC X(09) VALUE ALL '*'.               
           05  FILLER                    PIC X(37) VALUE SPACES.                
           05  EMPTY-TAG-CLT-NUM          PIC 999 COMP-3.                       
           05  EMPTY-CONTROL              PIC X(8) VALUE LOW-VALUE.             
       01  BLANK-LINE.                                                          
           05  FILLER                    PIC X(01) VALUE ' '.                   
           05  FILLER                    PIC X(132)   VALUE SPACES.             
           05  BLANK-TAG-CLT-NUM          PIC 999 COMP-3.                       
           05  BLANK-CONTROL              PIC X(8) VALUE LOW-VALUE.             
                                                                                
       01  CONTROL-AREA.                                                        
           05  CONTROL-BRANCH            PIC X(3).                              
           05  CONTROL-ACCOUNT           PIC X(5).                              
       01  DATE-VARIABLES.                                                      
           05  CURRENT-DATE-WS.                                                 
               10  CC                    PIC X(2).                              
               10  YY                    PIC X(2).                              
               10  MM                    PIC X(2).                              
               10  DD                    PIC X(2).                              
           05  PROC-DATE-MMDDCCYY.                                              
               10  PROC-DATE-MM               PIC X(2).                         
               10  PROC-DATE-DD               PIC X(2).                         
               10  PROC-DATE-CC               PIC X(2).                         
               10  PROC-DATE-YY               PIC X(2).                         
           COPY BPDATESC.                                                       
                                                                                
       LINKAGE SECTION.                                                         
       01  PARM-AREA.                                                           
           05  PARM-LENGTH        PIC S9(4) COMP SYNC.                          
           05   PARM-STREAM       PIC X.                                        
                                                                                
      ***--------------------------------------------------------------         
      ***-    PROCEDURE DIVISION                                                
      ***--------------------------------------------------------------         
       PROCEDURE DIVISION USING PARM-AREA.                                      
DJ0001     DISPLAY 'CAT885B - ACATS FOREIGN CURRENCY REPORT'.                   
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
           PERFORM 0000-INIT-RTN.                                               
           IF NOT EXTR-EOF                                                      
              PERFORM 1000-MAIN-PROCESSING-RTN                                  
                  UNTIL EXTR-EOF                                                
           END-IF                                                               
           PERFORM 9000-HOUSEKEEPING.                                           
           STOP RUN.                                                            
                                                                                
       0000-INIT-RTN.                                                           
           OPEN OUTPUT  REPT-FILE                                               
                INPUT   EXTR-FILE.                                              
           MOVE PGM-NAME TO BPDATES-CALLING-PGM                                 
           SET LNKDATZ-REQUEST TO TRUE                                          
           CALL BPDATES USING BPDATES-PARAMETERS                                
           END-CALL                                                             
           IF BPD-VALID-RETURN                                                  
               MOVE BPD-PROC-DATE TO CURRENT-DATE-WS                            
               MOVE MM TO HEAD1-DATE-MM                                         
               MOVE DD TO HEAD1-DATE-DD                                         
               MOVE YY TO HEAD1-DATE-YY                                         
               DISPLAY 'CAT885B: PROCESS DATE = ' BPD-PROC-DATE                 
           ELSE                                                                 
              DISPLAY 'INVALID BPDATES RETURN CODE: '                           
                  BPDATES-RETURN-CODE                                           
              CALL ABEND USING WS-ABORT-CODE                                    
           END-IF.                                                              
      ***                                                                       
      *** FIRST READ OFF EXTRACT FILE                                           
      ***                                                                       
           PERFORM 1050-READ-EXTRACT-FILE                                       
           IF NOT EXTR-EOF                                                      
              IF NOT FILE-HEADER                                                
                 DISPLAY 'CAT885B: EXTRACT FILE HEADER IS MISSING!'             
                 MOVE +1200 TO WS-ABORT-CODE                                    
                 CALL ABEND USING WS-ABORT-CODE                                 
              ELSE                                                              
                  DISPLAY 'CAT885B: EXTRACT FILE PROCESSING DATE IS '           
                      EXTR-PROC-DATE                                            
                  PERFORM 0010-DATE-CHECK                                       
              END-IF                                                            
           END-IF.                                                              
      ***                                                                       
      *** FIRST READ OFF B212                                                   
      ***                                                                       
           MOVE 'A'                 TO GETCHOL-VERSION                          
           MOVE 'Q'                 TO GETCHOL-ACCESS                           
           MOVE BPD-PROC-DATE       TO GETCHOL-DATE                             
           SET GETCHOL-SEND-DATE    TO TRUE                                     
           MOVE 'R'                 TO GETCHOL-FUNCTION-CODE                    
           CALL ZGETCHOL  USING GETCHOL-PARM,                                   
                                IN-HOLDER-REC                                   
                                                                                
           MOVE 'A'                 TO GETCBAL-VERSION                          
           MOVE 'Q'                 TO GETCBAL-ACCESS                           
           MOVE BPD-PROC-DATE       TO GETCBAL-DATE                             
           SET GETCBAL-SEND-DATE    TO TRUE                                     
           MOVE 'R'                 TO GETCBAL-FUNCTION-CODE                    
           CALL ZGETCBAL  USING GETCBAL-PARM,                                   
                                IN-BALANCE-REC.                                 
           PERFORM 0100-READ-HOLDERS.                                           
           PERFORM 0150-READ-BALANCE.                                           
                                                                                
       0010-DATE-CHECK.                                                         
           MOVE BPD-PROC-DATE (1:2)    TO PROC-DATE-CC                          
           MOVE BPD-PROC-DATE (3:2)    TO PROC-DATE-YY                          
           MOVE BPD-PROC-DATE (5:2)    TO PROC-DATE-MM                          
           MOVE BPD-PROC-DATE (7:2)    TO PROC-DATE-DD                          
           IF PROC-DATE-MMDDCCYY NOT EQUAL  EXTR-PROC-DATE                      
              DISPLAY 'CAT885B: EXTRACT FILE DATE DIFFERENT FROM '              
                          'PROCESSING DATE!'                                    
              CALL ABEND USING WS-ABORT-CODE                                    
           ELSE                                                                 
              PERFORM 1050-READ-EXTRACT-FILE                                    
           END-IF.                                                              
                                                                                
       0100-READ-HOLDERS.                                                       
                                                                                
           CALL ZGETCHOL  USING GETCHOL-PARM,                                   
                                IN-HOLDER-REC                                   
                                                                                
           IF GETCHOL-END-OF-FILE    OR                                         
              INPHOL-CLIENT = HIGH-VALUES                                       
              SET GETCHOL-END-OF-FILE TO TRUE                                   
              MOVE HIGH-VALUES TO WS-HOL-KEY                                    
           ELSE                                                                 
              IF INPHOL-REGULAR                                                 
                IF    INPHOL-FRGN-CURR-CODE = 0                                 
                  GO TO 0100-READ-HOLDERS                                       
                ELSE                                                            
                    MOVE INPHOL-CLIENT         TO WS-HOL-CLT                    
                    MOVE INPHOL-BRANCH         TO WS-HOL-BRA                    
                    MOVE INPHOL-ACCOUNT        TO WS-HOL-ACCT                   
                    MOVE INPHOL-FRGN-CURR-CODE TO WS-HOL-CUR                    
                    MOVE INPHOL-ACCOUNT-TYPE   TO WS-HOL-TYPE                   
                END-IF                                                          
              ELSE                                                              
                 GO TO 0100-READ-HOLDERS                                        
              END-IF                                                            
           END-IF.                                                              
                                                                                
       0150-READ-BALANCE.                                                       
                                                                                
           MOVE 'R'                 TO GETCBAL-FUNCTION-CODE                    
           CALL ZGETCBAL  USING GETCBAL-PARM,                                   
                                IN-BALANCE-REC                                  
                                                                                
           IF GETCBAL-END-OF-FILE    OR                                         
              INPBAL-CLIENT = HIGH-VALUES                                       
              SET GETCBAL-END-OF-FILE TO TRUE                                   
              MOVE HIGH-VALUES TO WS-BAL-KEY                                    
           ELSE                                                                 
             IF  INPBAL-BRANCH = HIGH-VALUE                                     
              OR INPBAL-FRGN-CURR-CODE = 999                                    
              OR INPBAL-FRGN-CURR-CODE = 0                                      
                 GO TO 0150-READ-BALANCE                                        
             ELSE                                                               
              IF   INPBAL-BAL-DETAIL                                            
                 MOVE INPBAL-CLIENT         TO WS-BAL-CLT                       
                 MOVE INPBAL-BRANCH         TO WS-BAL-BRA                       
                 MOVE INPBAL-ACCOUNT        TO WS-BAL-ACCT                      
                 MOVE INPBAL-FRGN-CURR-CODE TO WS-BAL-CUR                       
                 MOVE INPBAL-RECORD-ID2     TO WS-BAL-TYPE                      
              ELSE                                                              
                 GO TO 0150-READ-BALANCE                                        
              END-IF                                                            
             END-IF                                                             
           END-IF.                                                              
                                                                                
       1000-MAIN-PROCESSING-RTN.                                                
                                                                                
           EVALUATE TRUE                                                        
              WHEN FILE-TRAILER                                                 
                  SET EXTR-EOF TO TRUE                                          
              WHEN CLIENT-HEADER                                                
                 MOVE EXTR-CLIENT  TO HOLD-EXTR-CLIENT                          
                 MOVE EXTR-CLI-NAME TO HOLD-EXTR-CLIENT-NAME                    
                  ADD 1 TO READ-EXTR-CLIENT-CNT                                 
                 PERFORM 2700-PREPARE-HEADINGS                                  
                 MOVE ZEROES TO EXTR-BRANCH                                     
                                EXTR-ACCOUNT                                    
                 PERFORM 2800-PREPARE-BR-RPT-TRAK                               
                 IF FIRST-TIME-THRU                                             
                    SET NOT-FIRST-PASS TO TRUE                                  
                    PERFORM 3000-PAGE-BREAK                                     
                 END-IF                                                         
              WHEN CLIENT-TRAILER AND NOT FILE-TRAILER                          
                  DISPLAY 'CLIENT DONE: ' EXTR-CLIENT                           
                  PERFORM 7500-EXTR-CLIENT-BREAK                                
              WHEN OTHER                                                        
                  PERFORM 1100-CHECK-EXTR-BR-ACCT-BRK                           
                  PERFORM 2000-PROCESS-POS-BAL                                  
           END-EVALUATE                                                         
           PERFORM 1050-READ-EXTRACT-FILE.                                      
                                                                                
       1050-READ-EXTRACT-FILE.                                                  
            READ EXTR-FILE INTO EXTR-AREA                                       
               AT END SET EXTR-EOF TO TRUE.                                     
            IF NOT EXTR-EOF                                                     
                ADD 1 TO EXTR-READ-CNT                                          
            ELSE                                                                
                 IF EXTR-READ-CNT = 0                                           
                     DISPLAY ' CAT885B: EXTRACT FILE IS EMPTY! '                
                 END-IF                                                         
            END-IF.                                                             
                                                                                
       1100-CHECK-EXTR-BR-ACCT-BRK.                                             
            IF EXTR-CLIENT = HOLD-EXTR-CLIENT                                   
            AND EXTR-BRANCH NOT = HOLD-EXTR-BRANCH                              
               MOVE EXTR-BRANCH  TO HOLD-EXTR-BRANCH                            
               MOVE EXTR-ACCOUNT TO HOLD-EXTR-ACCOUNT                           
               PERFORM 2900-PREPARE-SUBHEADINGS                                 
               PERFORM 2800-PREPARE-BR-RPT-TRAK                                 
            ELSE                                                                
                IF EXTR-CLIENT       = HOLD-EXTR-CLIENT                         
                AND EXTR-BRANCH      = HOLD-EXTR-BRANCH                         
                AND EXTR-ACCOUNT NOT = HOLD-EXTR-ACCOUNT                        
                   MOVE EXTR-ACCOUNT TO HOLD-EXTR-ACCOUNT                       
                   PERFORM 2900-PREPARE-SUBHEADINGS                             
                   PERFORM 2800-PREPARE-BR-RPT-TRAK                             
                END-IF                                                          
           END-IF.                                                              
                                                                                
       2000-PROCESS-POS-BAL.                                                    
                                                                                
           PERFORM 0150-READ-BALANCE                                            
              UNTIL WS-BAL-KEY (1 : 11) NOT < PROCESS-KEY.                      
           MOVE  ' '      TO SUBHEADINGS-PRINT-SW                               
           PERFORM                                                              
                    UNTIL WS-BAL-KEY (1 : 11) NOT = PROCESS-KEY                 
                                                                                
             MOVE WS-BAL-KEY    TO WS-SAV-KEY                                   
             PERFORM 4600-GET-CURRENCY-SYM                                      
                                                                                
             PERFORM UNTIL WS-BAL-KEY (1 : 13) NOT = WS-SAV-KEY (1 : 13)        
                                                                                
               PERFORM 0100-READ-HOLDERS                                        
                  UNTIL WS-HOL-KEY NOT < WS-BAL-KEY                             
                                                                                
               PERFORM 4000-PROCESS-HOLDERS                                     
                  UNTIL WS-HOL-KEY NOT = WS-BAL-KEY                             
                                                                                
               PERFORM 4500-PROCESS-BALANCE                                     
                                                                                
               PERFORM 0150-READ-BALANCE                                        
                                                                                
             END-PERFORM                                                        
                                                                                
           END-PERFORM.                                                         
                                                                                
       2700-PREPARE-HEADINGS.                                                   
                                                                                
           MOVE 0             TO PAGE-CNT                                       
           MOVE HOLD-EXTR-CLIENT-NAME TO HEAD1-CLIENT-NAME                      
           MOVE HOLD-EXTR-CLIENT TO HEAD1-CLIENT-NUM                            
                                 HEAD1-TAG-CLT-NUM                              
                                 SUBHD1-TAG-CLT-NUM                             
                                 SUBHD2-TAG-CLT-NUM                             
                                 SUBHD3-TAG-CLT-NUM                             
                                 SUBHD4-TAG-CLT-NUM                             
                                 DETAIL-TAG-CLT-NUM                             
                                 FOOT1-TAG-CLT-NUM                              
                                 EMPTY-TAG-CLT-NUM                              
                                 BLANK-TAG-CLT-NUM.                             
                                                                                
       2800-PREPARE-BR-RPT-TRAK.                                                
                                                                                
           MOVE EXTR-BRANCH  TO CONTROL-BRANCH.                                 
           MOVE EXTR-ACCOUNT TO CONTROL-ACCOUNT.                                
           MOVE CONTROL-AREA TO HEAD1-CONTROL                                   
                                SUBHD1-CONTROL                                  
                                SUBHD2-CONTROL                                  
                                SUBHD3-CONTROL                                  
                                SUBHD4-CONTROL                                  
                                DETAIL-CONTROL                                  
                                FOOT1-CONTROL                                   
                                EMPTY-CONTROL                                   
                                BLANK-CONTROL.                                  
                                                                                
       2900-PREPARE-SUBHEADINGS.                                                
                                                                                
            STRING EXTR-BRANCH                                                  
                   PRINT-DASH                                                   
                   EXTR-ACCOUNT                                                 
              DELIMITED BY SIZE                                                 
              INTO      SUBHD1-BR-ACCT                                          
            PERFORM 6900-GET-NAMES                                              
            MOVE EXTR-ACAT-CNTL-NBR TO SUBHD1-ACAT-CTL                          
            MOVE EXTR-ACAT-RCV-NBR TO SUBHD1-ACAT-RCV-NBR                       
            SET SUBHEADINGS-NOT-PRINTED TO TRUE.                                
                                                                                
       3000-PAGE-BREAK.                                                         
            ADD  1 TO PAGE-CNT.                                                 
            MOVE PAGE-CNT TO HEAD1-PAGE-NUM.                                    
            WRITE REPT-REC FROM HEAD1-LINE AFTER PAGE                           
            MOVE 1 TO LINE-CNT.                                                 
                                                                                
       3100-PRINT-SUBHEADINGS.                                                  
            WRITE REPT-REC FROM SUBHD1-LINE AFTER 2                             
            WRITE REPT-REC FROM SUBHD2-LINE AFTER 1                             
            WRITE REPT-REC FROM BLANK-LINE AFTER 1                              
            WRITE REPT-REC FROM SUBHD3-LINE AFTER 2                             
            WRITE REPT-REC FROM SUBHD4-LINE AFTER 1                             
            WRITE REPT-REC FROM BLANK-LINE AFTER 1                              
            SET SUBHEADINGS-PRINTED TO TRUE.                                    
            ADD  8 TO LINE-CNT.                                                 
                                                                                
       4000-PROCESS-HOLDERS.                                                    
           MOVE INPHOL-SECURITY-NO    TO WS-SEC-NO                              
           IF   NOT BYPASS-SEC-NO                                               
             AND    INPHOL-CPH-TD-QTY NOT = ZERO                                
               ADD 1 TO CPH-PROC-CNT                                            
               MOVE HOLD-CURR-SYM       TO DETAIL-CURR-SYM                      
DJ0001         MOVE INPHOL-SECURITY-NO  TO DETAIL-SEC-NO                        
               MOVE INPHOL-CPH-TD-QTY   TO DETAIL-CPH-POS                       
               MOVE INPHOL-ACCOUNT-TYPE TO DETAIL-TYPE                          
               MOVE ZEROES              TO DETAIL-CAH-BAL                       
               MOVE INPHOL-CPH-SEC-DESC (1) TO DETAIL-SEC-DESC                  
               ADD 1 TO LINE-CNT GIVING TEST-LINE-CNT                           
               PERFORM 4700-WRITE-DETAIL-LINE                                   
                                                                                
               ADD 1 TO LINE-CNT GIVING TEST-LINE-CNT                           
               IF INPHOL-NO-DESC     = 2                                        
                   ADD 1 TO  TEST-LINE-CNT                                      
               END-IF                                                           
               IF INPHOL-NO-DESC     = 3                                        
                   ADD 2 TO  TEST-LINE-CNT                                      
               END-IF                                                           
               IF TEST-LINE-CNT > LINE-LIMT                                     
                  PERFORM 3000-PAGE-BREAK                                       
                  PERFORM 3100-PRINT-SUBHEADINGS                                
                  MOVE LINE-CNT TO  TEST-LINE-CNT                               
               END-IF                                                           
               PERFORM VARYING WS-SUB FROM 2 BY 1                               
                  UNTIL WS-SUB > INPHOL-NO-DESC                                 
                      MOVE SPACES                                               
                              TO DETAIL-GROUP1                                  
                      MOVE INPHOL-CPH-SEC-DESC (WS-SUB)                         
                              TO DETAIL-SEC-DESC                                
                      PERFORM 4700-WRITE-DETAIL-LINE                            
               END-PERFORM                                                      
           END-IF.                                                              
           PERFORM 0100-READ-HOLDERS.                                           
                                                                                
       4500-PROCESS-BALANCE.                                                    
           IF INPBAL-TD-BAL-CLOSE   NOT = ZERO                                  
                 ADD  1                   TO CAH-PROC-CNT                       
                 MOVE HOLD-CURR-SYM       TO DETAIL-CURR-SYM                    
DJ0001           MOVE SPACES              TO DETAIL-SEC-NO                      
                 MOVE ZEROES              TO DETAIL-CPH-POS                     
                 MOVE INPBAL-TD-BAL-CLOSE   TO DETAIL-CAH-BAL                   
                 MOVE WS-HOL-TYPE           TO DETAIL-TYPE                      
                 MOVE SPACES           TO DETAIL-SEC-DESC                       
                 MOVE LINE-CNT         TO TEST-LINE-CNT                         
                 PERFORM 4700-WRITE-DETAIL-LINE                                 
           END-IF.                                                              
                                                                                
        4600-GET-CURRENCY-SYM.                                                  
           MOVE WS-SAV-CUR     TO CUR-ARGUMENT                                  
           CALL CURLOOK   USING  CURR-AREA                                      
           IF  CUR-RET-CODE  =  SPACE                                           
               IF CUR-SYM  > SPACES                                             
                  MOVE  CUR-SYM       TO  HOLD-CURR-SYM                         
               ELSE                                                             
                  MOVE SPACES TO HOLD-CURR-SYM                                  
               END-IF                                                           
           ELSE                                                                 
               MOVE SPACES TO HOLD-CURR-SYM                                     
           END-IF.                                                              
                                                                                
       4700-WRITE-DETAIL-LINE.                                                  
                                                                                
           IF TEST-LINE-CNT > LINE-LIMT                                         
               PERFORM 3000-PAGE-BREAK                                          
               PERFORM 3100-PRINT-SUBHEADINGS                                   
            ELSE                                                                
               IF SUBHEADINGS-PRINT-SW = ' '                                    
                  PERFORM 6800-REPORT-B212-ACCT-BREAK                           
               END-IF                                                           
           END-IF                                                               
           WRITE REPT-REC FROM DETAIL-LINE AFTER 1                              
           ADD 1 TO LINE-CNT                                                    
                    CLIENT-PROC-CNT.                                            
                                                                                
       6800-REPORT-B212-ACCT-BREAK.                                             
            ADD  9 TO  LINE-CNT                                                 
                 GIVING TEST-LINE-CNT                                           
            IF TEST-LINE-CNT > LINE-LIMT                                        
                PERFORM 3000-PAGE-BREAK                                         
            END-IF.                                                             
            PERFORM 3100-PRINT-SUBHEADINGS.                                     
                                                                                
       6900-GET-NAMES.                                                          
           INITIALIZE  GETNA-PARAMETERS.                                        
           MOVE  'R'                      TO  GETNA-REQ-FUNC.                   
           MOVE  'R'                      TO  GETNA-REQ-FILE.                   
           MOVE  'R'                      TO  GETNA-REQ-FUNC2.                  
           MOVE  'N'                      TO  GETNA-REQ-YEAREND.                
           MOVE  PGM-NAME                 TO  GETNA-PGM-NAME.                   
           MOVE  EXTR-CLIENT              TO  GETNA-KEY-CLIENT.                 
           MOVE  '00'                     TO  GETNA-KEY-BRANCH1-2.              
           MOVE  EXTR-BRANCH              TO  GETNA-KEY-BRANCH3-5.              
           MOVE  '00000'                  TO  GETNA-KEY-ACCOUNT1-5.             
           MOVE  EXTR-ACCOUNT             TO  GETNA-KEY-ACCOUNT6-10.            
                                                                                
           CALL   GETNA  USING  GETNA-PARAMETERS                                
                                GETNA-SEGMENT-INCLUDES                          
           END-CALL.                                                            
                                                                                
           IF GETNA-RETURN-FOUND  AND                                           
              NOT NNAPPN-SEGMENT-MISSING                                        
              MOVE NNAPPN-SHORT-NAME-P           TO  SUBHD1-NAME                
              IF SUBHD1-NAME EQUAL SPACES                                       
                 MOVE 'NAME SPACES ON FILE'     TO SUBHD1-NAME                  
              END-IF                                                            
           ELSE                                                                 
              MOVE ' NAME IS NOT ON FILE'  TO SUBHD1-NAME                       
              DISPLAY 'CAT885B: SEGMENT N MISSING - KEY - '                     
                                EXTR-CLIENT                                     
                            ' ' EXTR-BRANCH                                     
                            ' ' EXTR-ACCOUNT                                    
           END-IF.                                                              
                                                                                
       7500-EXTR-CLIENT-BREAK.                                                  
           IF CLIENT-PROC-CNT > 0                                               
              MOVE CLIENT-PROC-CNT TO FOOT1-PROC-CNT                            
              WRITE REPT-REC FROM     FOOT1-LINE AFTER 2                        
           ELSE                                                                 
              MOVE ZEROES TO CONTROL-AREA                                       
              MOVE CONTROL-AREA TO HEAD1-CONTROL                                
                                   FOOT1-CONTROL                                
                                   EMPTY-CONTROL                                
              IF PAGE-CNT = 0                                                   
                 PERFORM 3000-PAGE-BREAK                                        
              END-IF                                                            
              WRITE REPT-REC FROM EMPTY-LINE AFTER 2                            
           END-IF.                                                              
           IF NOT EXTR-EOF                                                      
              MOVE 0  TO PAGE-CNT                                               
              MOVE 56 TO LINE-CNT                                               
              MOVE 0  TO CLIENT-PROC-CNT                                        
           END-IF.                                                              
                                                                                
                                                                                
                                                                                
      ***-------------------------------------------------------------**        
      ***--              H O U S E K E E P I N G                    --**        
      ***-------------------------------------------------------------**        
       9000-HOUSEKEEPING.                                                       
           MOVE READ-EXTR-CLIENT-CNT TO REC-CNT-DISP                            
           DISPLAY 'CAT885B: NUMBER OF CLIENTS PROCESSED  : '                   
               REC-CNT-DISP.                                                    
           MOVE PROC-ACCT-CNT TO REC-CNT-DISP                                   
           DISPLAY '        NUMBER OF ACCOUNTS  PROCESSED : '                   
               REC-CNT-DISP.                                                    
           MOVE CPH-PROC-CNT  TO REC-CNT-DISP                                   
           DISPLAY '           NO. OF CPH RECS  PROCESSED : '                   
               REC-CNT-DISP.                                                    
           MOVE CPT-PROC-CNT  TO REC-CNT-DISP                                   
           DISPLAY '           NO. OF CPT RECS  PROCESSED : '                   
               REC-CNT-DISP.                                                    
           MOVE CAH-PROC-CNT  TO REC-CNT-DISP                                   
           DISPLAY '           NO. OF CAH RECS  PROCESSED : '                   
               REC-CNT-DISP.                                                    
                                                                                
           CLOSE        REPT-FILE                                               
                        EXTR-FILE.                                              
      ***-------------------------------------------------------------**        
      ***--           E N D   O F   C A T 8 8 5 C                   --**        
      ***-------------------------------------------------------------**        
