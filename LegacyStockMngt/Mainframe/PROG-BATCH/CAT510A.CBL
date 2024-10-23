000001* PDX    - CAT510A  C0269422 09/08/08 08:30:57 TBDOJUN            00001000
000001* DJ0003 - ADD F STREAM                                           00001000
000001* PDX    - CAT510A  C0225456 10/10/05 10:27:55 TBDOJUN            00001000
000001* DJ0002 - SEPARATE Z STREAM INTO A,B,F,H,I,J,L,N,P,R,S,U,X,Y     00001000
000001* DJ0002 - USE NSCC-PEND-CD AS INDICATOR THAT JOB IS DONE         00001000
000001* PDX    - CAT510A  C0221281 08/08/05 10:17:18 TBDOJUN            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT510A.                                                    
      *****************************************************************         
      * CAT510A - CHECK BZZZ.SIAC0716.ACAT.TRAN CYCLE NUMBER          *         
      *          AGAINST DATABASE TO SEE IF PREVIOUS CYCLE FILE       *         
      *          HAS BEEN PROCESSED.  IF NOT, ABEND JOB CAT510A.      *         
      * L-STREAM = WEALTH-MANAGEMENT STREAM FOR CLIENT 235 UBS        *         
      *                                                               *         
      * EACH JOB STREAM WILL HAVE ITS OWN DB2 ROW.                    *         
      *                                                               *         
      * CARDLIB FOR EACH STREAM: Z,Q,W,9                              *         
DJ0003*"STREAM-COUNT=14 STREAMS=ABFHIJLNPRSUXY      (MAXIMUM=20)"     *         
      *"STREAM-COUNT=01 STREAMS=Q                   (MAXIMUM=20)"     *         
      *"STREAM-COUNT=01 STREAMS=W                   (MAXIMUM=20)"     *         
      *"STREAM-COUNT=01 STREAMS=9                   (MAXIMUM=20)"     *         
      *                                                               *         
      * INPUT:                                                        *         
      * Z FILE   - BZZZ.SIAC0716.ACAT.TRAN(0)                         *         
      * Q FILE   - BQQQ.SIAC0716.ACAT.TRAN(0)                         *         
      * W FILE   - BIOS.C235.INPZ.ACAT.TRAN(0) UBS WEALTH MANAGEMENT  *         
      * 9 FILE   - BY99.SIAC0716.NDME(0)                              *         
      *****************************************************************         
      * 05/18/05 DJXXXX SSR# 40147 NEW PROGRAM                        *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-STAT.                 
                                                                                
           SELECT CARDLIB          ASSIGN       TO CARDLIB                      
                                   FILE STATUS  IS CARDLIB-STAT.                
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS                  
                     DEPENDING ON W-REC-LEN-IN                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:== BY ==NSCCMTRN==.              
                                                                                
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCMHDR==.              
                                                                                
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCMTRL==.              
                                                                                
       01  DUMMY-LARGE-RECORD         PIC X(4000).                              
                                                                                
       FD  CARDLIB                                                              
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  CARDLIB-RECORD             PIC X(80).                                
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
                                                                                
       01  W-FIELDS.                                                            
           05  W-PROGRAM-NAME            PIC  X(008) VALUE 'CAT510A'.           
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.                 
           05  ABEND-CODE                PIC S9(004) COMP SYNC.                 
           05  DUMP-SW                   PIC  X(001) VALUE ' '.                 
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.                 
               88 END-OF-INFILE                      VALUE '1'.                 
           05  INFILE-STAT               PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING VALUE '35'.                              
           05  END-OF-CARDLIB-SW         PIC  X(001) VALUE '0'.                 
               88 END-OF-CARDLIB                     VALUE '1'.                 
           05  CARDLIB-STAT              PIC  X(002).                           
               88 CARDLIB-OKAY           VALUE '00' THRU '09', '97'.            
               88 CARDLIB-END-OF-FILE    VALUE '10'.                            
               88 CARDLIB-EMPTY-MISSING VALUE '35'.                             
           05  W-REC-LEN-IN              PIC  9(005) COMP-3 VALUE 0.            
           05  W-CYCLE.                                                         
               07  W-CYCLE-1             PIC  X(001) VALUE '0'.                 
               07  W-CYCLE-X             PIC  X(001) VALUE '0'.                 
           05  FILLER REDEFINES W-CYCLE.                                        
               07  W-CYCLE-N             PIC  9(002).                           
                                                                                
      *---PROCESS DATE                                                          
           05 W-PRCS-DT.                                                        
              10 W-PRCS-DT-YEAR.                                                
                 15 W-PRCS-DT-CC         PIC  X(02) VALUE ' '.                  
                 15 W-PRCS-DT-YY         PIC  X(02) VALUE ' '.                  
              10 FILLER                  PIC  X(01) VALUE '-'.                  
              10 W-PRCS-DT-MM            PIC  X(02) VALUE ' '.                  
              10 FILLER                  PIC  X(01) VALUE '-'.                  
              10 W-PRCS-DT-DD            PIC  X(02) VALUE ' '.                  
                                                                                
      ***LENGHT = 80 BYTES                                                      
       01  W-CARDLIB-RECORD.                                                    
           05  W-CARDLIB-LIT          PIC X(13)                                 
                                      VALUE 'STREAM-COUNT='.                    
           05  W-CARDLIB-COUNT        PIC 9(02).                                
           05  W-CARDLIB-LIT2         PIC X(09)                                 
                                      VALUE ' STREAMS='.                        
           05  W-STREAMS              PIC X(36) VALUE ' '.                      
           05  FILLER REDEFINES W-STREAMS.                                      
               07  W-STREAM           PIC X(01) OCCURS 36 TIMES.                
           05  W-CARDLIB-FILLER       PIC X(20) VALUE ' DEFAULT'.               
                                                                                
       01  W-MISC.                                                              
      *---INDICATOR WHEN W-STREAM IS DONE                                       
           05 W-SUB                      PIC 9(03) VALUE 0.                     
           05 W-STREAM-INDICATORS.                                              
              07 W-STREAM-IND            PIC X(01) OCCURS 36 TIMES.             
                                                                                
      *---STREAM FOR READING DATABASE: MOVE TO W-KEY-CLIENT-STREAM              
           05 W-PARM-STREAM              PIC  X(001) VALUE ' '.                 
                                                                                
      *---USE WHEN SELECTING ACTITRF                                            
           05 W-BYPASS-CHECK-SW          PIC  X(001) VALUE ' '.                 
              88 W-BYPASS-CHECK                      VALUE 'Y'.                 
      /                                                                         
       01  FILLER                        PIC  X(008) VALUE 'W-KEY-  '.          
      *****************************************************************         
      *   THESE COLUMNS MUST MATCH IN PROGRAMS CAT510A AND CAT510B              
      *   THESE ARE THE COLUMNS ON THE ACTITRF DATABASE                         
      *   TO INDICATE THAT A STREAM/CYCLE HAS COMPLETED                         
      *****************************************************************         
       01  W-KEY-FIELDS.                                                        
                                                                                
      *---USE CLIENT-NBR (4 BYTES) AS KEY.                                      
      *---FIRST THREE BYTES = 'A00'.                                            
      *---LAST BYTE = FILE INDICATOR = STREAM INDICATOR:                        
      *    A,B,F,H,I,J,L,N,P,Q,R,S,U,W,X,Y,9                                    
           05 W-KEY-CLIENT-NBR-X.                                               
              07 FILLER                  PIC  X(003) VALUE 'A00'.               
              07 W-KEY-CLIENT-STREAM     PIC  X(001) VALUE ' '.                 
                 88 W-KEY-CLIENT-STREAM-A            VALUE 'A'.                 
                 88 W-KEY-CLIENT-STREAM-B            VALUE 'B'.                 
                 88 W-KEY-CLIENT-STREAM-F            VALUE 'F'.                 
                 88 W-KEY-CLIENT-STREAM-H            VALUE 'H'.                 
                 88 W-KEY-CLIENT-STREAM-I            VALUE 'I'.                 
                 88 W-KEY-CLIENT-STREAM-J            VALUE 'J'.                 
                 88 W-KEY-CLIENT-STREAM-L            VALUE 'L'.                 
                 88 W-KEY-CLIENT-STREAM-N            VALUE 'N'.                 
                 88 W-KEY-CLIENT-STREAM-P            VALUE 'P'.                 
                 88 W-KEY-CLIENT-STREAM-R            VALUE 'R'.                 
                 88 W-KEY-CLIENT-STREAM-S            VALUE 'S'.                 
                 88 W-KEY-CLIENT-STREAM-U            VALUE 'U'.                 
                 88 W-KEY-CLIENT-STREAM-X            VALUE 'X'.                 
                 88 W-KEY-CLIENT-STREAM-Y            VALUE 'Y'.                 
                 88 W-KEY-CLIENT-FILE-VALID VALUE 'Q' 'W' 'Z' '9'.              
           05 W-KEY-CLIENT-NBR REDEFINES                                        
              W-KEY-CLIENT-NBR-X         PIC  X(004).                           
                                                                                
      *---USE RCV-NBR FOR THE CYCLE NUMBER IN THE KEY                           
           05 W-KEY-RCV-NBR              PIC  X(004) VALUE '0000'.              
                                                                                
      *---USE PRCS-DT - TODAY'S PROCESS DATE                                    
           05 W-KEY-PRCS-DT              PIC  X(010) VALUE ' '.                 
                                                                                
      *---USE CYCLE-CD FOR THE ORIGINAL CYCLE NUMBER FROM SIAC                  
           05 W-KEY-CYCLE-CD             PIC  X(002) VALUE ' '.                 
                                                                                
      *---USE CICS-TERM-ID-CD TO SAVE THE LAST STREAM THAT UPDATED              
           05 W-KEY-CICS-TERM-ID-CD      PIC  X(004) VALUE ' '.                 
           05 FILLER REDEFINES W-KEY-CICS-TERM-ID-CD.                           
              07 W-KEY-STREAM            PIC  X(001).                           
              88 W-KEY-STREAM-VALID  VALUE                                      
DJ0003                            'A' 'B' 'F' 'H' 'I' 'J' 'L' 'N' 'P'           
                                      'Q' 'R' 'S' 'U' 'W' 'X' 'Y' '9'.          
              07 FILLER                  PIC  X(003).                           
                                                                                
      *---USE STTLM-ASCTD-DT TO SAVE W-SIAC-HEADER-DATE                         
           05 W-KEY-STTLM-ASCTD-DT       PIC  X(010) VALUE '0001-01-01'.        
                                                                                
      *---USE NSCC-PEND-CD   TO INDICATOR THAT JOB IS DONE                      
           05 W-KEY-NSCC-PEND-CD         PIC  X(001) VALUE ' '.                 
              88 W-KEY-NSCC-PEND-JOB-DONE            VALUE 'Y'.                 
                                                                                
      *---USE CMNT-TXT   (120 BYTES) TO STORE THE SWITCHES                      
          COPY CAT510AB.                                                        
      /                                                                         
       01  FILLER                        PIC  X(008) VALUE 'SIAC-HDR'.          
       01  W-SIAC-HEADER.                                                       
           05  W-SIAC-REC-ID             PIC  X(006).                           
               88  W-SIAC-FILE-HEADER    VALUE '1TRANS'.                        
           05  W-SIAC-HEADER-DATE        PIC  X(008).                           
           05  FILLER                    PIC  X(002).                           
           05  W-SIAC-FILE-ID            PIC  X(003).                           
               88  W-SIAC-FILE-TRANS-ID  VALUE '716'.                           
           05  W-SIAC-FILE-DESC          PIC  X(020).                           
               88  W-SIAC-FILE-TRANS-LIT VALUE 'MRO MULTI CYCLE TRAN'.          
           05  FILLER                    PIC  X(015).                           
           05  W-SIAC-HEADER-CYCLE.                                             
               07  W-SIAC-HEADER-CYCLE-N PIC  9(002).                           
           05  FILLER                    PIC  X(007).                           
           05  W-SIAC-RECORD-COUNT       PIC  9(010).                           
           05  W-SIAC-DATE-LIT           PIC  X(008).                           
           05  W-SIAC-DATE               PIC  X(008).                           
           05  FILLER                    PIC  X(003).                           
           05  W-SIAC-TIME               PIC  X(005).                           
           05  FILLER                    PIC  X(024).                           
      /                                                                         
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.           
           COPY STUBCPY.                                                        
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
           COPY BPDATESC.                                                       
      /                                                                         
      ******************************************************************        
      * ACATS INITIAL TRANSFER DB2 TABLE                               *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTITRF'.            
           EXEC SQL INCLUDE ACTITRF      END-EXEC.                              
      /                                                                         
      ******************************************************************        
      * DB2 COMMAREA                                                   *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.           
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
      ******************************************************************        
      * DB2 ERROR MESSAGE AREA                                         *        
      ******************************************************************        
       01  DSNTIAR                       PIC X(008) VALUE 'DSNTIAR'.            
       01  W-DB2-MESSAGE-AREA.                                                  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.            
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES             
                   INDEXED BY W-DB2-IDX.                                        
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.             
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'DB2WORK '.          
       01  W-DB2-WORKAREA.                                                      
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC  ---9.                             
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
       01  FILLER                        PIC  X(008) VALUE 'END-O-WS'.          
      /                                                                         
      *****************************************************************         
      *    LINKAGE SECTION                                            *         
      *****************************************************************         
       LINKAGE SECTION.                                                         
       01  L-JCL-PARMS.                                                         
           05  PARMLENGTH                PIC S9(004) COMP SYNC.                 
           05  L-STREAM                  PIC  X(001).                           
               88  L-ALL-STREAM          VALUE 'Z'.                             
               88  L-Q-STREAM            VALUE 'Q'.                             
               88  L-WM-STREAM           VALUE 'W'.                             
               88  L-STREAM-VALID        VALUE 'Q' 'W' 'Z' '9'.                 
           05  L-BYP-CYCLE-SW            PIC  X(001).                           
               88  L-BYP-CYCLE-CHECK     VALUE 'N'.                             
               88  L-USE-FILE-CYCLE-NBR  VALUE ' ' '0'.                         
               88  L-USE-THIS-CYCLE-NBR  VALUE '1' '2' '3' '4' '5'.             
           05  L-USE-DATE-SW             PIC  X(001).                           
               88  L-USE-PROC-DATE       VALUE ' ' '0'.                         
               88  L-USE-PARM-DATE       VALUE '1'.                             
           05  L-PARM-DATE               PIC  X(008).                           
               88  L-PARM-DATE-DEFAULT   VALUE 'CCYYMMDD'.                      
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
                                                                                
           DISPLAY 'CAT510A - CHECK THAT ALL STREAMS HAVE FINISHED'             
                            ' FROM THE PREVIOUS CYCLE'.                         
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
                                                                                
           IF  L-BYP-CYCLE-CHECK                                                
               DISPLAY 'CAT510A: L-BYP-CYCLE-SW = ' L-BYP-CYCLE-SW              
                     '  WE ARE BYPASSING THE CYCLE NUMBER CHECK.'               
           ELSE                                                                 
               PERFORM 2000-PROCESS    THRU 2000-EXIT                           
           END-IF                                                               
                                                                                
           PERFORM 9000-EOJ            THRU 9000-EXIT.                          
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT.                                                               
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.                
                                                                                
           EXEC SQL                                                             
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP                     
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE TO W-DB2-SQLCODE                                        
           IF  SQLCODE = +0                                                     
               DISPLAY 'CAT510A: W-CURRENT-TIMESTAMP = '                        
                                 W-CURRENT-TIMESTAMP                            
           ELSE                                                                 
               DISPLAY 'CAT510A: W-CURRENT-TIMESTAMP NOT SET'                   
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM 8000-SQL-ERROR THRU 8000-EXIT                            
           END-IF.                                                              
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT510A: L-STREAM              = '                          
                             L-STREAM                                           
           DISPLAY 'CAT510A: L-BYP-CYCLE-SW        = '                          
                             L-BYP-CYCLE-SW                                     
           '  IF N, BYPASS CYCLE NUMBER CHECK.'                                 
           DISPLAY '                                  '                         
           '  IF 0, USE FILE CYCLE NUMBER FOR CHECKING.'                        
           DISPLAY '                                  '                         
           '  IF 1 - 5, USE THIS CYCLE NUMBER FOR CHECKING.'                    
           DISPLAY 'CAT510A: L-USE-DATE-SW         = '                          
                             L-USE-DATE-SW                                      
           '  IF 0, USE PROC DATE FOR CHECKING CYCLE NUMBER.'                   
           DISPLAY '                                  '                         
           '  IF 1, USE PARM DATE FOR CHECKING CYCLE NUMBER.'                   
           DISPLAY 'CAT510A: L-PARM-DATE(CCYYMMDD) = '                          
                             L-PARM-DATE                                        
                                                                                
           IF  L-STREAM-VALID                                                   
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY ' '                                                      
               DISPLAY 'CAT510A: L-STREAM IS INVALID.'                          
                       ' NOT Z,Q,W,9.'                                          
               DISPLAY 'CAT510A: U3001 - ABENDING ON BAD STREAM PARM'           
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE DUMP-SW                              
           END-IF                                                               
                                                                                
           MOVE 'CAT510A'                 TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
           DISPLAY 'CAT510A:       BPD-PROC-DATE= ' BPD-PROC-DATE               
           DISPLAY 'CAT510A: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE.        
           MOVE BPD-PROC-DATE(1:4) TO W-PRCS-DT-YEAR                            
           MOVE BPD-PROC-DATE(5:2) TO W-PRCS-DT-MM                              
           MOVE BPD-PROC-DATE(7:2) TO W-PRCS-DT-DD                              
           DISPLAY 'CAT510A:           W-PRCS-DT= ' W-PRCS-DT                   
           DISPLAY ' '.                                                         
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT510A: INFILE  OPENED FOR INPUT.  STATUS = '              
                                               INFILE-STAT.                     
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT510A: ERROR OPENING INFILE'                          
               DISPLAY 'CAT510A: OPEN STATUS = ' INFILE-STAT                    
               DISPLAY 'CAT510A: U3002 - ABENDING ON BAD FILE STATUS'           
               MOVE +3002    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE DUMP-SW                              
           END-IF.                                                              
                                                                                
           OPEN INPUT CARDLIB.                                                  
           DISPLAY 'CAT510A: CARDLIB OPENED FOR INPUT.  STATUS = '              
                                               CARDLIB-STAT.                    
                                                                                
           IF  CARDLIB-OKAY                                                     
               CONTINUE                                                         
           ELSE                                                                 
               MOVE '1'              TO END-OF-CARDLIB-SW                       
               DISPLAY 'CAT510A: ERROR OPENING CARDLIB'                         
               DISPLAY 'CAT510A: OPEN STATUS = ' CARDLIB-STAT                   
               DISPLAY 'CAT510A: CARDLIB NOT FOUND. DEFAULTS USED'              
               MOVE 1        TO W-CARDLIB-COUNT                                 
               MOVE L-STREAM TO W-STREAM(1)                                     
               DISPLAY 'CAT510A: CARDLIB: ' W-CARDLIB-RECORD                    
           END-IF.                                                              
                                                                                
           IF  NOT END-OF-CARDLIB                                               
               PERFORM 1500-READ-CARDLIB THRU 1500-EXIT                         
           END-IF.                                                              
                                                                                
           MOVE ' ' TO W-SIAC-HEADER.                                           
           MOVE ' '                    TO DCLACTITRF                            
           MOVE 0                      TO PHSCL-SEQ-NBR    OF DCLACTITRF        
                                          LGCL-SEQ-NBR     OF DCLACTITRF        
                                          DAYS-STTS-QTY    OF DCLACTITRF        
           MOVE '0001-01-01'           TO STTLM-ASCTD-DT   OF DCLACTITRF        
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       1500-READ-CARDLIB.                                                       
           MOVE '1500-READ-CARDLIB             ' TO W-ROUTINE-1.                
                                                                                
           READ CARDLIB                                                         
             AT END                                                             
                MOVE '1'              TO END-OF-CARDLIB-SW                      
                DISPLAY 'CAT510A: END OF INPUT REACHED'                         
                DISPLAY 'CAT510A: CARDLIB NOT FOUND. DEFAULTS USED'             
                MOVE 1        TO W-CARDLIB-COUNT                                
                MOVE L-STREAM TO W-STREAM(1)                                    
                GO TO 1500-EXIT                                                 
           END-READ.                                                            
                                                                                
           IF  CARDLIB-OKAY                                                     
               MOVE CARDLIB-RECORD TO W-CARDLIB-RECORD                          
           ELSE                                                                 
               DISPLAY 'CAT510A: CARDLIB NOT FOUND. DEFAULTS USED'              
               MOVE 1        TO W-CARDLIB-COUNT                                 
               MOVE L-STREAM TO W-STREAM(1)                                     
           END-IF.                                                              
                                                                                
           DISPLAY 'CAT510A: CARDLIB: ' W-CARDLIB-RECORD.                       
                                                                                
       1500-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       2000-PROCESS.                                                            
           MOVE '2000-PROCESS                ' TO W-ROUTINE-1.                  
                                                                                
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF  END-OF-INFILE                                                    
               CONTINUE                                                         
           ELSE                                                                 
               IF NSCCMHDR-REC-TYPE = '1'                                       
                  MOVE NSCCMTRN-RECORD TO W-SIAC-HEADER                         
                  DISPLAY ' '                                                   
                  DISPLAY 'CAT510A: THIS IS THE SIAC HEADER RECORD: '           
                  DISPLAY '         COLS.007 = SIAC HEADER DATE '               
                                   '(' W-SIAC-HEADER-DATE ')'                   
                  DISPLAY '         COLS.055 = SIAC HEADER CYCLE NUMBER'        
                                   '(' W-SIAC-HEADER-CYCLE-N ')'                
                  DISPLAY 'COLS.001-063 => '                                    
                          '----+----1----+----2----+----3----+----4'            
                          '----+----5----+----6---'                             
                  DISPLAY 'COLS.001-063 => ' NSCCMTRN-RECORD (1 : 63)           
                          ' <= COLS.001-063'                                    
                  DISPLAY ' '                                                   
                  DISPLAY 'COLS.064-133 => '                                    
                          '-+----7----+----8----+----9----+----0'               
                          '----+----1----+----2----+----3---'                   
                  DISPLAY 'COLS.064-133 => ' NSCCMTRN-RECORD (64: 70)           
                          ' <= COLS.064-133'                                    
                  DISPLAY ' '                                                   
                  PERFORM 4000-EDIT-HEADER-RECORD THRU 4000-EXIT                
                  PERFORM 4100-CHECK-STREAM-STATUS THRU 4100-EXIT               
                  GO TO 2000-EXIT                                               
               END-IF                                                           
           END-IF.                                                              
                                                                                
      ***IF WE ARE HERE, THE HEADER IS MISSING                                  
           IF  W-SIAC-HEADER = ' '                                              
               DISPLAY 'CAT510A: MISSING FILE HEADER RECORD'                    
                       '  WHERE NSCCMHDR-REC-TYPE=1'                            
               DISPLAY 'CAT510A: THIS IS THE RECORD FOUND:'                     
               DISPLAY 'COLS.001-063 => '                                       
                       '----+----1----+----2----+----3----+----4'               
                       '----+----5----+----6---'                                
               DISPLAY 'COLS.001-063 => ' NSCCMTRN-RECORD (1 : 63)              
                       ' <= COLS.001-063'                                       
               DISPLAY ' '                                                      
               DISPLAY 'COLS.064-133 => '                                       
                       '-+----7----+----8----+----9----+----0'                  
                       '----+----1----+----2----+----3---'                      
               DISPLAY 'COLS.064-133 => ' NSCCMTRN-RECORD (64: 70)              
                       ' <= COLS.064-133'                                       
               DISPLAY ' '                                                      
               DISPLAY 'CAT510: U3003 - ABENDING MISSING HEADER'                
               MOVE +3003    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE DUMP-SW                              
           END-IF.                                                              
                                                                                
           GO TO 2000-PROCESS.                                                  
                                                                                
       2000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       3000-READ-INPUT.                                                         
           MOVE '3000-READ-INPUT             ' TO W-ROUTINE-1.                  
                                                                                
           READ INFILE                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INFILE-SW                    
                   DISPLAY 'CAT510A: END OF INPUT REACHED'                      
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT510A: ERROR READING INFILE'                          
               DISPLAY 'CAT510A: READ STATUS = ' INFILE-STAT                    
               DISPLAY 'CAT510A: U3004 - ABENDING ON BAD FILE STATUS'           
               MOVE +3004    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE DUMP-SW                              
           END-IF.                                                              
                                                                                
       3000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4000-EDIT-HEADER-RECORD.                                                 
           MOVE '4000-EDIT-HEADER-RECORD     ' TO W-ROUTINE-1.                  
                                                                                
           DISPLAY 'CAT510A: W-SIAC-HEADER-CYCLE = '                            
                             W-SIAC-HEADER-CYCLE                                
           MOVE W-SIAC-HEADER-CYCLE    TO W-KEY-CYCLE-CD                        
                                                                                
           DISPLAY 'CAT510A: W-SIAC-HEADER-DATE  = '                            
                             W-SIAC-HEADER-DATE                                 
           IF W-SIAC-HEADER-DATE > '00000000'                                   
              MOVE W-SIAC-HEADER-DATE(1:4) TO W-KEY-STTLM-ASCTD-DT(1:4)         
              MOVE '-'                     TO W-KEY-STTLM-ASCTD-DT(5:1)         
              MOVE W-SIAC-HEADER-DATE(5:2) TO W-KEY-STTLM-ASCTD-DT(6:2)         
              MOVE '-'                     TO W-KEY-STTLM-ASCTD-DT(8:1)         
              MOVE W-SIAC-HEADER-DATE(7:2) TO W-KEY-STTLM-ASCTD-DT(9:2)         
           ELSE                                                                 
               MOVE '0001-01-01'           TO W-KEY-STTLM-ASCTD-DT              
           END-IF                                                               
           DISPLAY ' '.                                                         
                                                                                
       4000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4100-CHECK-STREAM-STATUS.                                                
           MOVE '4100-CHECK-STREAM-STATUS    ' TO W-ROUTINE-1.                  
                                                                                
           IF  L-USE-THIS-CYCLE-NBR                                             
               MOVE L-BYP-CYCLE-SW      TO W-CYCLE-X                            
           ELSE                                                                 
               MOVE W-SIAC-HEADER-CYCLE TO W-CYCLE-N                            
           END-IF                                                               
                                                                                
           IF  W-CYCLE-X = '1'                                                  
               DISPLAY 'THIS IS CYCLE 1, BYPASS EDITING.'                       
               ' SKIP CHECKING TO SEE IF ALL JOBS ARE FINISHED'                 
               ' FROM PREVIOUS CYCLE.'                                          
               GO TO 4100-EXIT                                                  
           END-IF.                                                              
                                                                                
           EVALUATE TRUE                                                        
               WHEN L-STREAM = 'Z'                                              
                    PERFORM 4200-CHECK-Z-STREAM THRU 4200-EXIT                  
               WHEN L-STREAM = 'Q'                                              
                    PERFORM 4300-CHECK-Q-STREAM THRU 4300-EXIT                  
               WHEN L-STREAM = 'W'                                              
                    PERFORM 4400-CHECK-W-STREAM THRU 4400-EXIT                  
               WHEN L-STREAM = '9'                                              
                    PERFORM 4500-CHECK-9-STREAM THRU 4500-EXIT                  
           END-EVALUATE.                                                        
                                                                                
       4100-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4200-CHECK-Z-STREAM.                                                     
           MOVE '4200-CHECK-Z-STREAM         ' TO W-ROUTINE-1.                  
                                                                                
           DISPLAY ' '                                                          
           PERFORM VARYING W-SUB FROM 1 BY 1 UNTIL W-SUB > 36                   
               OR   W-STREAM(W-SUB) <= ' '                                      
                                                                                
               MOVE W-STREAM(W-SUB)               TO W-PARM-STREAM              
               PERFORM 4800-CHECK-PEND-CD THRU 4800-EXIT                        
               MOVE W-KEY-NSCC-PEND-CD  TO W-STREAM-IND(W-SUB)                  
               DISPLAY ' '                                                      
                                                                                
           END-PERFORM                                                          
                                                                                
           PERFORM VARYING W-SUB FROM 1 BY 1 UNTIL W-SUB > 36                   
               OR  W-STREAM(W-SUB) <= ' '                                       
                                                                                
               IF  W-STREAM(W-SUB)  > ' '                                       
                   IF  W-STREAM-IND(W-SUB) = 'Y'                                
                   DISPLAY 'CAT510A: "' W-STREAM(W-SUB) '"'                     
                                   ' STREAM IS FINISHED'                        
                   ELSE                                                         
                   DISPLAY 'CAT510A: "' W-STREAM(W-SUB) '"'                     
                                   ' STREAM IS NOT FINISHED YET'                
                   END-IF                                                       
               END-IF                                                           
           END-PERFORM                                                          
                                                                                
           PERFORM VARYING W-SUB FROM 1 BY 1 UNTIL W-SUB > 36                   
               OR  W-STREAM(W-SUB) <= ' '                                       
                                                                                
               IF  W-STREAM(W-SUB)  > ' '                                       
               AND W-STREAM-IND(W-SUB) = ' '                                    
               DISPLAY 'CAT510A: NOT ALL CAT511 JOBS WERE FINISHED'             
                               ' FROM PREVIOUS CYCLE ('                         
                                  W-KEY-RCV-NBR(3:2) '). OKAY'                  
               DISPLAY 'CAT510A: WAIT TILL CAT511 JOBS ARE FINISHED'            
                               ' BEFORE RESTARTING THIS JOB'                    
               DISPLAY '         FOR CYCLE '                                    
                                 W-SIAC-HEADER-CYCLE                            
               DISPLAY 'CAT510A: U3005 - ABENDING ON JOB RAN TOO EARLY'         
               MOVE +3005    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE DUMP-SW                              
               END-IF                                                           
                                                                                
           END-PERFORM                                                          
                                                                                
           DISPLAY 'CAT510A: ALL CAT511 JOBS WERE FINISHED'                     
                            ' FROM PREVIOUS CYCLE ('                            
                              W-KEY-RCV-NBR(3:2) '). OKAY'.                     
                                                                                
       4200-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4300-CHECK-Q-STREAM.                                                     
           MOVE '4300-CHECK-Q-STREAM         ' TO W-ROUTINE-1.                  
                                                                                
           MOVE L-STREAM               TO W-PARM-STREAM                         
                                                                                
           PERFORM 4800-CHECK-PEND-CD THRU 4800-EXIT                            
                                                                                
           IF  W-BYPASS-CHECK-SW = 'Y'                                          
               GO TO 4300-EXIT                                                  
           END-IF                                                               
                                                                                
DJ0002     IF  W-KEY-NSCC-PEND-CD = 'Y'                                         
               DISPLAY 'CAT510A: ALL CAT511 JOBS WERE FINISHED'                 
                               ' FROM PREVIOUS CYCLE ('                         
                                 W-KEY-RCV-NBR(3:2) '). OKAY'                   
           ELSE                                                                 
               DISPLAY 'CAT510A: NOT ALL CAT511 JOBS WERE FINISHED'             
                               ' FROM PREVIOUS CYCLE ('                         
                                 W-KEY-RCV-NBR(3:2) '). NOT OKAY'               
               DISPLAY 'CAT510A: WAIT TILL CAT511 JOBS ARE FINISHED'            
                               ' BEFORE RESTARTING THIS JOB'                    
               DISPLAY '         FOR CYCLE '                                    
                                 W-SIAC-HEADER-CYCLE                            
               DISPLAY 'CAT510A: U3006 - ABENDING ON JOB RAN TOO EARLY'         
               MOVE +3006    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE DUMP-SW                              
           END-IF.                                                              
                                                                                
       4300-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4400-CHECK-W-STREAM.                                                     
           MOVE '4400-CHECK-W-STREAM         ' TO W-ROUTINE-1.                  
                                                                                
           MOVE L-STREAM               TO W-PARM-STREAM                         
                                                                                
           PERFORM 4800-CHECK-PEND-CD THRU 4800-EXIT                            
                                                                                
           IF  W-BYPASS-CHECK-SW = 'Y'                                          
               GO TO 4400-EXIT                                                  
           END-IF                                                               
                                                                                
DJ0002     IF  W-KEY-NSCC-PEND-CD = 'Y'                                         
               DISPLAY 'CAT510A: ALL CAT511 JOBS WERE FINISHED'                 
                               ' FROM PREVIOUS CYCLE ('                         
                                 W-KEY-RCV-NBR(3:2) '). OKAY'                   
           ELSE                                                                 
               DISPLAY 'CAT510A: NOT ALL CAT511 JOBS WERE FINISHED'             
                               ' FROM PREVIOUS CYCLE ('                         
                                 W-KEY-RCV-NBR(3:2) '). NOT OKAY'               
               DISPLAY 'CAT510A: WAIT TILL CAT511 JOBS ARE FINISHED'            
                               ' BEFORE RESTARTING THIS JOB'                    
               DISPLAY '         FOR CYCLE '                                    
                                 W-SIAC-HEADER-CYCLE                            
               DISPLAY 'CAT510A: U3006 - ABENDING ON JOB RAN TOO EARLY'         
               MOVE +3006    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE DUMP-SW                              
           END-IF.                                                              
                                                                                
       4400-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4500-CHECK-9-STREAM.                                                     
           MOVE '4500-CHECK-9-STREAM         ' TO W-ROUTINE-1.                  
                                                                                
           MOVE L-STREAM               TO W-PARM-STREAM                         
                                                                                
           PERFORM 4800-CHECK-PEND-CD THRU 4800-EXIT                            
                                                                                
           IF  W-BYPASS-CHECK-SW = 'Y'                                          
               GO TO 4500-EXIT                                                  
           END-IF                                                               
                                                                                
DJ0002     IF  W-KEY-NSCC-PEND-CD = 'Y'                                         
               DISPLAY 'CAT510A: ALL CAT511 JOBS WERE FINISHED'                 
                               ' FROM PREVIOUS CYCLE ('                         
                                 W-KEY-RCV-NBR(3:2) '). OKAY'                   
           ELSE                                                                 
               DISPLAY 'CAT510A: NOT ALL CAT511 JOBS WERE FINISHED'             
                               ' FROM PREVIOUS CYCLE ('                         
                                 W-KEY-RCV-NBR(3:2) '). NOT OKAY'               
               DISPLAY 'CAT510A: WAIT TILL CAT511 JOBS ARE FINISHED'            
                               ' BEFORE RESTARTING THIS JOB'                    
               DISPLAY '         FOR CYCLE '                                    
                                 W-SIAC-HEADER-CYCLE                            
               DISPLAY 'CAT510A: U3007 - ABENDING ON JOB RAN TOO EARLY'         
               MOVE +3007    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE DUMP-SW                              
           END-IF.                                                              
                                                                                
       4500-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4800-CHECK-PEND-CD.                                                      
           MOVE '4800-CHECK-PEND-CD          ' TO W-ROUTINE-1.                  
                                                                                
           PERFORM 5000-SELECT-ACTITRF THRU 5000-EXIT.                          
                                                                                
           IF  W-KEY-NSCC-PEND-CD = 'Y'                                         
               DISPLAY 'CAT510A: "' W-PARM-STREAM '"'                           
                                  ' STREAM IS FINISHED'                         
           ELSE                                                                 
               DISPLAY 'CAT510A: "' W-PARM-STREAM '"'                           
                                  ' STREAM IS NOT FINISHED YET'                 
           END-IF.                                                              
                                                                                
       4800-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5000-SELECT-ACTITRF.                                                     
           MOVE '5000-SELECT-ACTITRF         ' TO W-ROUTINE-1.                  
                                                                                
           MOVE ' ' TO W-BYPASS-CHECK-SW                                        
                                                                                
           MOVE W-PARM-STREAM          TO W-KEY-CLIENT-STREAM                   
                                                                                
      ***LOOK FOR PREVIOUS CYCLE TO SEE IF IT IS FINISHED                       
           EVALUATE TRUE                                                        
               WHEN W-CYCLE-X = '1'                                             
                    MOVE '05'           TO W-KEY-RCV-NBR(3:2)                   
               WHEN W-CYCLE-X = '2'                                             
                    MOVE '01'           TO W-KEY-RCV-NBR(3:2)                   
               WHEN W-CYCLE-X = '3'                                             
                    MOVE '02'           TO W-KEY-RCV-NBR(3:2)                   
               WHEN W-CYCLE-X = '4'                                             
                    MOVE '03'           TO W-KEY-RCV-NBR(3:2)                   
               WHEN W-CYCLE-X = '5'                                             
                    MOVE '04'           TO W-KEY-RCV-NBR(3:2)                   
           END-EVALUATE                                                         
                                                                                
           DISPLAY 'CAT510A: CHECKING FOR PREVIOUS CYCLE ('                     
                    W-KEY-RCV-NBR(3:2) ')'                                      
                                                                                
           IF  L-USE-PARM-DATE                                                  
               MOVE L-PARM-DATE(1:4)   TO W-PRCS-DT-YEAR                        
               MOVE L-PARM-DATE(5:2)   TO W-PRCS-DT-MM                          
               MOVE L-PARM-DATE(7:2)   TO W-PRCS-DT-DD                          
               MOVE W-PRCS-DT          TO W-KEY-PRCS-DT                         
           ELSE                                                                 
               MOVE W-PRCS-DT          TO W-KEY-PRCS-DT                         
           END-IF                                                               
                                                                                
           MOVE W-KEY-CLIENT-NBR    TO CLIENT-NBR      OF DCLACTITRF            
           MOVE W-KEY-RCV-NBR       TO RCV-NBR         OF DCLACTITRF            
                                                                                
           EXEC SQL SELECT                                                      
                     CLIENT_NBR                                                 
                    ,RCV_NBR                                                    
                    ,CYCLE_CD                                                   
                    ,PRCS_DT                                                    
                    ,CMNT_TXT                                                   
                    ,STTLM_ASCTD_DT                                             
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
DJ0002              ,NSCC_PEND_CD                                               
               INTO                                                             
                    :DCLACTITRF.CLIENT-NBR                                      
                   ,:DCLACTITRF.RCV-NBR                                         
                   ,:DCLACTITRF.CYCLE-CD                                        
                   ,:DCLACTITRF.PRCS-DT                                         
                   ,:DCLACTITRF.CMNT-TXT                                        
                   ,:DCLACTITRF.STTLM-ASCTD-DT                                  
                   ,:DCLACTITRF.CICS-TERM-ID-CD                                 
                   ,:DCLACTITRF.PRGM-NM                                         
                   ,:DCLACTITRF.CRT-TMSTP                                       
                   ,:DCLACTITRF.UPDT-TMSTP                                      
DJ0002             ,:DCLACTITRF.NSCC-PEND-CD                                    
               FROM ACTITRF                                                     
              WHERE CLIENT_NBR      = :W-KEY-CLIENT-NBR                         
                AND RCV_NBR         = :W-KEY-RCV-NBR                            
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               DISPLAY 'CAT510A: ACTITRF FOUND '                                
                         'FOR "' W-PARM-STREAM '" STREAM'                       
                               ' SQLCODE=' W-DB2-SQLCODE                        
                  ' STREAM-KEY=' CLIENT-NBR      OF DCLACTITRF                  
                       ' CYCLE=' RCV-NBR         OF DCLACTITRF                  
               DISPLAY '        '                                               
                ' CLIENT-NBR(KEY)='  CLIENT-NBR      OF DCLACTITRF              
               DISPLAY '        '                                               
                ' CYCLE-CD  (KEY)='  RCV-NBR         OF DCLACTITRF              
               DISPLAY '        '                                               
                ' PRCS-DT   (BPS)='  PRCS-DT         OF DCLACTITRF              
               DISPLAY '        '                                               
                ' STREAM-STATUS  ='  CMNT-TXT        OF DCLACTITRF(1:72)        
               DISPLAY '        '                                               
                ' CYCLE-CD(SIAC) ='  CYCLE-CD        OF DCLACTITRF              
               DISPLAY '        '                                               
                ' PROCS-DT(SIAC) ='  STTLM-ASCTD-DT  OF DCLACTITRF              
               DISPLAY '        '                                               
                ' LAST-STREAM    ='  CICS-TERM-ID-CD OF DCLACTITRF              
               DISPLAY '        '                                               
                ' PRGM-NM        ='  PRGM-NM         OF DCLACTITRF              
               DISPLAY '        '                                               
                ' CRT-TMSTP      ='  CRT-TMSTP       OF DCLACTITRF              
               DISPLAY '        '                                               
                ' UPDT-TMSTP     ='  UPDT-TMSTP      OF DCLACTITRF              
DJ0002         DISPLAY '        '                                               
DJ0002          ' NSCC-PEND-CD   ='  NSCC-PEND-CD    OF DCLACTITRF              
           ELSE                                                                 
DJ0002         MOVE ' '                        TO W-KEY-NSCC-PEND-CD            
               DISPLAY 'CAT510A: ACTITRF NOT FOUND '                            
                       'FOR "' W-PARM-STREAM '" STREAM'                         
                                ' SQLCODE=' W-DB2-SQLCODE                       
                  ' STREAM-KEY='  CLIENT-NBR      OF DCLACTITRF                 
                       ' CYCLE='  RCV-NBR         OF DCLACTITRF                 
           END-IF.                                                              
                                                                                
           IF SQLCODE = +0                                                      
              IF PRCS-DT OF DCLACTITRF = W-KEY-PRCS-DT                          
                  DISPLAY 'PRCS-DT OF DCLACTITRF = W-KEY-PRCS-DT.'              
                  ' CHECK TO SEE IF ALL JOBS ARE FINISHED'                      
                  ' FROM PREVIOUS CYCLE'                                        
                  MOVE CMNT-TXT OF DCLACTITRF TO CAT510AB-CMNT-TXT              
DJ0002            MOVE NSCC-PEND-CD OF DCLACTITRF TO W-KEY-NSCC-PEND-CD         
                  MOVE ' ' TO W-BYPASS-CHECK-SW                                 
              ELSE                                                              
                  DISPLAY 'PROC-DATE OF DCLACTITRF NOT = PROCESS DATE.'         
                         ' NOT OKAY '                                           
                  MOVE ' ' TO W-BYPASS-CHECK-SW                                 
DJ0002            MOVE ' ' TO W-KEY-NSCC-PEND-CD                                
              END-IF                                                            
           END-IF.                                                              
                                                                                
       5000-EXIT. EXIT.                                                         
      /                                                                         
       8000-SQL-ERROR.                                                          
           MOVE '8000-SQL-ERROR              ' TO W-ROUTINE-1.                  
           DISPLAY ' '                                                          
           DISPLAY '8000-SQL-ERROR'                                             
                                                                                
           DISPLAY ' '                                                          
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                          
                                    W-DB2-MESSAGE-LEN.                          
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                                
             UNTIL W-DB2-IDX GREATER THAN 12                                    
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES                      
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)                       
                   END-IF                                                       
           END-PERFORM.                                                         
           DISPLAY ' '                                                          
                                                                                
           DISPLAY 'CAT510A: U3999 - ABENDING ON BAD DB2 STATUS'                
           DISPLAY 'CAT510A: PROGRAM ENDED ABNORMALLY'                          
           MOVE +3999    TO ABEND-CODE                                          
           CALL ABEND USING ABEND-CODE.                                         
                                                                                
       8000-EXIT. EXIT.                                                         
      /                                                                         
       9000-EOJ.                                                                
           MOVE '9000-EOJ                    ' TO W-ROUTINE-1.                  
           DISPLAY ' '.                                                         
           DISPLAY 'CAT510A: SWITCHES HAVE BEEN CHECKED FOR '                   
                   '"' L-STREAM '"' ' STREAM '                                  
                   'PREVIOUS CYCLE (' W-KEY-RCV-NBR(3:2) '). OKAY.'             
           DISPLAY 'CAT510A: CAN PROCEED WITH NEXT CYCLE ('                     
                    W-SIAC-HEADER-CYCLE ').'                                    
           DISPLAY ' '.                                                         
           CLOSE INFILE                                                         
           DISPLAY 'CAT510A: INFILE  CLOSED. STATUS = '                         
                                             INFILE-STAT.                       
                                                                                
           CLOSE CARDLIB                                                        
           DISPLAY 'CAT510A: CARDLIB CLOSED. STATUS = '                         
                                             CARDLIB-STAT.                      
                                                                                
           DISPLAY 'CAT510A: PROGRAM ENDED SUCCESSFULLY'.                       
                                                                                
       9000-EXIT.                                                               
           EXIT.                                                                
      *################################################################         
