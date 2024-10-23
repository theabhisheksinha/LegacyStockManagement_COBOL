000001* PDX    - CAT510B  C0269422 09/08/08 08:31:25 TBDOJUN            00001000
000001* DJ0003 - ADD F STREAM                                           00001000
000001* DJ0003 - SSR#59901 USE CYCLE NO IN RETURN CODE TO TRIGGER CAT61100001000
000001* PDX    - CAT510B  C0225456 10/14/05 11:12:35 TBDOJUN            00001000
000001* DJ0002 - SEPARATE Z STREAM INTO A,B,F,H,I,J,L,N,P,R,S,U,X,Y     00001000
000001* DJ0002 - USE NSCC-PEND-CD AS INDICATOR THAT JOB IS DONE         00001000
000001* DJ0002 - USE BZZZ.CAT510.ACATTRAN NOT BZZZ.SIAC0716.ACAT.TRAN   00001000
000001* PDX    - CAT510B  C0221281 08/08/05 10:17:54 TBDOJUN            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT510B.                                                    
      *****************************************************************         
      * CAT510B - USE   BZZZ.CAT510.ACAT.TRAN   CYCLE NUMBER          *         
      *          TO UPDATE DATABASE TO INDICATE THAT CYCLE FILE       *         
      *          HAS BEEN PROCESSED.                                  *         
      * L-W-STREAM = WEALTH-MANAGEMENT STREAM FOR CLIENT 235 UBS      *         
      *                                                               *         
      * INPUT:                                                        *         
      * Z FILE   - BZZZ.CAT510.ACATTRAN                               *         
      * Q FILE   - BQQQ.CAT510.ACATTRAN                               *         
      * W FILE   - BZZZ.CAT510.WM.ACATTRAN     UBS WEALTH MANAGEMENT  *         
      * 9 FILE   - BY99.CAT510.ACATTRAN                               *         
      *****************************************************************         
      * 05/18/05 DJXXXX SSR# 40147 NEW PROGRAM                        *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-STAT.                 
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS V                                                  
DJ0002     RECORD IS VARYING IN SIZE FROM 1 TO 3268 CHARACTERS                  
                     DEPENDING ON W-REC-LEN-IN                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:== BY ==NSCCMTRN==.              
                                                                                
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCMHDR==.              
                                                                                
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCMTRL==.              
                                                                                
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
                                                                                
       01  W-FIELDS.                                                            
           05  W-PROGRAM-NAME            PIC  X(008) VALUE 'CAT510B'.           
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.                 
           05  ABEND-CODE                PIC S9(004) COMP SYNC.                 
           05  DUMP-SW                   PIC  X(001) VALUE ' '.                 
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.                 
               88 END-OF-INFILE                      VALUE '1'.                 
           05  INFILE-STAT               PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING VALUE '35'.                              
           05  W-REC-LEN-IN              PIC  9(005) COMP-3 VALUE 0.            
DJ0003     05  W-CYCLE-NBR               PIC  9(002)        VALUE 0.            
                                                                                
      *---PROCESS DATE                                                          
           05 W-PRCS-DT.                                                        
              10 W-PRCS-DT-YEAR.                                                
                 15 W-PRCS-DT-CC         PIC  X(02) VALUE ' '.                  
                 15 W-PRCS-DT-YY         PIC  X(02) VALUE ' '.                  
              10 FILLER                  PIC  X(01) VALUE '-'.                  
              10 W-PRCS-DT-MM            PIC  X(02) VALUE ' '.                  
              10 FILLER                  PIC  X(01) VALUE '-'.                  
              10 W-PRCS-DT-DD            PIC  X(02) VALUE ' '.                  
                                                                                
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
                 88 W-KEY-CLIENT-STREAM-Q            VALUE 'Q'.                 
                 88 W-KEY-CLIENT-STREAM-W            VALUE 'W'.                 
                 88 W-KEY-CLIENT-STREAM-9            VALUE '9'.                 
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
                                  'A' 'B' 'F' 'H' 'I' 'J' 'L' 'N' 'P'           
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
               88  L-9-STREAM            VALUE '9'.                             
               88  L-W-STREAM            VALUE 'W'.                             
           05  L-BYP-CYCLE-SW            PIC  X(001).                           
               88  L-USE-FILE-CYCLE-NBR  VALUE ' ' '0'.                         
               88  L-USE-THIS-CYCLE-NBR  VALUE '1' '2' '3' '4' '5'.             
           05  L-BYP-DATECHK-SW          PIC  X(001).                           
               88  L-DO-DATECHK          VALUE ' ' '0'.                         
               88  L-BYP-DATECHK         VALUE '1'.                             
               88  L-USE-PARM-DATE       VALUE '2'.                             
           05  L-PARM-DATE               PIC  X(008).                           
               88  L-PARM-DATE-DEFAULT   VALUE 'CCYYMMDD'.                      
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
                                                                                
           DISPLAY 'CAT510B - SET SWITCH THAT STREAM/CYCLE FINISHED'.           
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
           PERFORM 2000-PROCESS        THRU 2000-EXIT.                          
           PERFORM 9000-EOJ            THRU 9000-EXIT.                          
                                                                                
DJ0003*----GET THE CYCLE NUMBER FROM THIS FILE                                  
DJ0003*----USE W-CYCLE-NBR IN THE RETURN-CODE TO TRIGGER CAT611 JOBS            
DJ0003     MOVE W-KEY-RCV-NBR(3:2) TO W-CYCLE-NBR                               
DJ0003     DISPLAY '*****************************************'                  
DJ0003     DISPLAY '*RETURN CODE WILL BE SET TO CYCLE NUMBER '                  
DJ0003     DISPLAY '*RETURN CODE = ' W-CYCLE-NBR                                
DJ0003     DISPLAY '*****************************************'                  
DJ0003     MOVE W-CYCLE-NBR TO RETURN-CODE.                                     
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT.                                                               
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.                
                                                                                
           EXEC SQL                                                             
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP                     
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE TO W-DB2-SQLCODE                                        
           IF  SQLCODE = +0                                                     
               DISPLAY 'CAT510B: W-CURRENT-TIMESTAMP = '                        
                                 W-CURRENT-TIMESTAMP                            
           ELSE                                                                 
               DISPLAY 'CAT510B: W-CURRENT-TIMESTAMP NOT SET'                   
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM 8000-SQL-ERROR THRU 8000-EXIT                            
           END-IF.                                                              
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT510B: L-STREAM              = '                          
                             L-STREAM                                           
           DISPLAY 'CAT510B: L-BYP-CYCLE-SW        = '                          
                             L-BYP-CYCLE-SW                                     
           '  IF 0, CHECK THE CYCLE NUMBER.'                                    
           '  IF 1 - 5, USE THIS CYCLE NUMBER.'                                 
           DISPLAY 'CAT510B: L-BYP-DATECHK-SW      = '                          
                             L-BYP-DATECHK-SW                                   
           '  IF 0, DO THE DATE CHECK.'                                         
           '  IF 1, BYPASS DATE CHECK.'                                         
           '  IF 2, USE PARM DATE.'                                             
           DISPLAY 'CAT510B: L-PARM-DATE(CCYYMMDD) = '                          
                             L-PARM-DATE                                        
                                                                                
           MOVE L-STREAM               TO W-KEY-STREAM                          
                                                                                
           MOVE 'CAT510B'                 TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
           DISPLAY 'CAT510B:       BPD-PROC-DATE= ' BPD-PROC-DATE               
           DISPLAY 'CAT510B: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE.        
           MOVE BPD-PROC-DATE(1:4) TO W-PRCS-DT-YEAR                            
           MOVE BPD-PROC-DATE(5:2) TO W-PRCS-DT-MM                              
           MOVE BPD-PROC-DATE(7:2) TO W-PRCS-DT-DD                              
           DISPLAY 'CAT510B:           W-PRCS-DT= ' W-PRCS-DT                   
           DISPLAY ' '.                                                         
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT510B: INFILE  OPENED FOR INPUT.  STATUS = '              
                                               INFILE-STAT.                     
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT510B: ERROR OPENING INFILE'                          
               DISPLAY 'CAT510B: OPEN STATUS = ' INFILE-STAT                    
               DISPLAY 'CAT510B: U3002 - ABENDING ON BAD FILE STATUS'           
               MOVE +3002    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
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
       2000-PROCESS.                                                            
           MOVE '2000-PROCESS                ' TO W-ROUTINE-1.                  
                                                                                
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF  END-OF-INFILE                                                    
               GO TO 2000-FINI                                                  
           END-IF.                                                              
                                                                                
           IF  NSCCMHDR-REC-TYPE = '1'                                          
               MOVE NSCCMTRN-RECORD TO W-SIAC-HEADER                            
               DISPLAY ' '                                                      
               DISPLAY 'CAT510B: THIS IS THE SIAC HEADER RECORD: '              
               DISPLAY '         COLS.007 = SIAC HEADER DATE '                  
                                '(' W-SIAC-HEADER-DATE ')'                      
               DISPLAY '         COLS.055 = SIAC HEADER CYCLE NUMBER '          
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
               PERFORM 4100-UPDATE             THRU 4100-EXIT                   
               GO TO 2000-EXIT                                                  
           END-IF.                                                              
                                                                                
       2000-FINI.                                                               
                                                                                
           IF  W-SIAC-HEADER = ' '                                              
               DISPLAY 'CAT510B: MISSING FILE HEADER RECORD'                    
                       '  WHERE NSCCMHDR-REC-TYPE=1'                            
               DISPLAY 'CAT510B: THIS IS THE RECORD FOUND:'                     
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
               DISPLAY 'CAT510B: U3003 - ABENDING MISSING HEADER'               
               MOVE +3003    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           GO TO 2000-PROCESS.                                                  
                                                                                
       2000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       3000-READ-INPUT.                                                         
           MOVE '3000-READ-INPUT             ' TO W-ROUTINE-1.                  
                                                                                
           IF  END-OF-INFILE                                                    
               GO 3000-EXIT                                                     
           END-IF.                                                              
                                                                                
           READ INFILE                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INFILE-SW                    
                   DISPLAY 'CAT510B: END OF INPUT REACHED'                      
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT510B: ERROR READING INFILE'                          
               DISPLAY 'CAT510B: READ STATUS = ' INFILE-STAT                    
               DISPLAY 'CAT510B: U3004 - ABENDING ON BAD FILE STATUS'           
               MOVE +3004    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
       3000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4000-EDIT-HEADER-RECORD.                                                 
           MOVE '4000-EDIT-HEADER-RECORD     ' TO W-ROUTINE-1.                  
                                                                                
           DISPLAY 'CAT510B: W-SIAC-HEADER-CYCLE = '                            
                             W-SIAC-HEADER-CYCLE                                
           MOVE W-SIAC-HEADER-CYCLE    TO W-KEY-CYCLE-CD                        
                                                                                
           DISPLAY 'CAT510B: W-SIAC-HEADER-DATE  = '                            
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
       4100-UPDATE.                                                             
           MOVE '4100-UPDATE                 ' TO W-ROUTINE-1.                  
                                                                                
DJ0002     MOVE L-STREAM               TO W-KEY-CLIENT-STREAM                   
                                                                                
           IF  L-USE-THIS-CYCLE-NBR                                             
               MOVE L-BYP-CYCLE-SW     TO W-KEY-RCV-NBR(4:1)                    
           ELSE                                                                 
               MOVE W-SIAC-HEADER-CYCLE TO W-KEY-RCV-NBR(3:2)                   
           END-IF                                                               
                                                                                
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
                                                                                
           PERFORM 5000-SELECT-ACTITRF THRU 5000-EXIT                           
                                                                                
           IF SQLCODE = +0                                                      
              IF PRCS-DT OF DCLACTITRF NOT = W-KEY-PRCS-DT                      
                 DISPLAY 'PRCS-DT OF DCLACTITRF NOT = W-KEY-PRCS-DT'            
                 MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP     OF DCLACTITRF        
              ELSE                                                              
                 MOVE CMNT-TXT OF DCLACTITRF TO CAT510AB-CMNT-TXT               
DJ0002           MOVE NSCC-PEND-CD OF DCLACTITRF TO W-KEY-NSCC-PEND-CD          
              END-IF                                                            
           ELSE                                                                 
               MOVE W-CURRENT-TIMESTAMP  TO CRT-TMSTP      OF DCLACTITRF        
               INITIALIZE CAT510AB-CMNT-TXT                                     
DJ0002         MOVE ' '                  TO W-KEY-NSCC-PEND-CD                  
           END-IF                                                               
                                                                                
           MOVE 'Y'                      TO W-KEY-NSCC-PEND-CD                  
           EVALUATE TRUE                                                        
               WHEN L-STREAM = 'A'                                              
                    SET CAT510AB-STREAM-A-DONE TO TRUE                          
               WHEN L-STREAM = 'B'                                              
                    SET CAT510AB-STREAM-B-DONE TO TRUE                          
DJ0003         WHEN L-STREAM = 'F'                                              
DJ0003              SET CAT510AB-STREAM-F-DONE TO TRUE                          
               WHEN L-STREAM = 'H'                                              
                    SET CAT510AB-STREAM-H-DONE TO TRUE                          
               WHEN L-STREAM = 'I'                                              
                    SET CAT510AB-STREAM-I-DONE TO TRUE                          
               WHEN L-STREAM = 'J'                                              
                    SET CAT510AB-STREAM-J-DONE TO TRUE                          
               WHEN L-STREAM = 'L'                                              
                    SET CAT510AB-STREAM-L-DONE TO TRUE                          
               WHEN L-STREAM = 'N'                                              
                    SET CAT510AB-STREAM-N-DONE TO TRUE                          
               WHEN L-STREAM = 'P'                                              
                    SET CAT510AB-STREAM-P-DONE TO TRUE                          
               WHEN L-STREAM = 'Q'                                              
                    SET CAT510AB-STREAM-Q-DONE TO TRUE                          
               WHEN L-STREAM = 'R'                                              
                    SET CAT510AB-STREAM-R-DONE TO TRUE                          
               WHEN L-STREAM = 'S'                                              
                    SET CAT510AB-STREAM-S-DONE TO TRUE                          
               WHEN L-STREAM = 'U'                                              
                    SET CAT510AB-STREAM-U-DONE TO TRUE                          
               WHEN L-STREAM = 'W'                                              
                    SET CAT510AB-STREAM-W-DONE TO TRUE                          
               WHEN L-STREAM = 'X'                                              
                    SET CAT510AB-STREAM-X-DONE TO TRUE                          
               WHEN L-STREAM = 'Y'                                              
                    SET CAT510AB-STREAM-Y-DONE TO TRUE                          
               WHEN L-STREAM = '9'                                              
                    SET CAT510AB-STREAM-9-DONE TO TRUE                          
               WHEN OTHER                                                       
                    DISPLAY 'CAT510B: L-STREAM PARM IS INVALID'                 
           END-EVALUATE                                                         
                                                                                
           MOVE CAT510AB-CMNT-TXT     TO CMNT-TXT        OF DCLACTITRF          
           MOVE W-KEY-PRCS-DT         TO PRCS-DT         OF DCLACTITRF          
           MOVE W-KEY-CYCLE-CD        TO CYCLE-CD        OF DCLACTITRF          
           MOVE W-KEY-STTLM-ASCTD-DT  TO STTLM-ASCTD-DT  OF DCLACTITRF          
           MOVE W-PROGRAM-NAME        TO PRGM-NM         OF DCLACTITRF          
           MOVE W-KEY-CICS-TERM-ID-CD TO CICS-TERM-ID-CD OF DCLACTITRF          
           MOVE W-CURRENT-TIMESTAMP   TO UPDT-TMSTP      OF DCLACTITRF          
DJ0002     MOVE W-KEY-NSCC-PEND-CD    TO NSCC-PEND-CD    OF DCLACTITRF          
                                                                                
           IF  SQLCODE  =  +0                                                   
               PERFORM 5100-UPDATE-ACTITRF THRU 5100-EXIT                       
           ELSE                                                                 
               PERFORM 5200-INSERT-ACTITRF THRU 5200-EXIT                       
           END-IF.                                                              
                                                                                
       4100-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5000-SELECT-ACTITRF.                                                     
           MOVE '5000-SELECT-ACTITRF         ' TO W-ROUTINE-1.                  
                                                                                
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
               DISPLAY 'CAT510B: ACTITRF FOUND '                                
                       'FOR ' L-STREAM ' STREAM.'                               
                                ' SQLCODE = ' W-DB2-SQLCODE                     
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
               DISPLAY 'CAT510B: ACTITRF NOT FOUND '                            
                       'FOR ' L-STREAM ' STREAM.'                               
                                ' SQLCODE=' W-DB2-SQLCODE                       
                 '  STREAM-KEY='  CLIENT-NBR      OF DCLACTITRF                 
                    ' CYCLE-CD='  RCV-NBR         OF DCLACTITRF                 
           END-IF.                                                              
                                                                                
       5000-EXIT. EXIT.                                                         
      /                                                                         
       5100-UPDATE-ACTITRF.                                                     
           MOVE '5100-UPDATE-ACTITRF         ' TO W-ROUTINE-1.                  
                                                                                
           EXEC SQL                                                             
             UPDATE ACTITRF                                                     
                SET                                                             
                   CYCLE_CD            = :DCLACTITRF.CYCLE-CD                   
                  ,PRCS_DT             = :DCLACTITRF.PRCS-DT                    
                  ,CMNT_TXT            = :DCLACTITRF.CMNT-TXT                   
                  ,STTLM_ASCTD_DT      = :DCLACTITRF.STTLM-ASCTD-DT             
                  ,CICS_TERM_ID_CD     = :DCLACTITRF.CICS-TERM-ID-CD            
                  ,PRGM_NM             = :DCLACTITRF.PRGM-NM                    
                  ,CRT_TMSTP           = :DCLACTITRF.CRT-TMSTP                  
                  ,UPDT_TMSTP          = :DCLACTITRF.UPDT-TMSTP                 
DJ0002            ,NSCC_PEND_CD        = :DCLACTITRF.NSCC-PEND-CD               
                WHERE  CLIENT_NBR      = :W-KEY-CLIENT-NBR                      
                  AND  RCV_NBR         = :W-KEY-RCV-NBR                         
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               DISPLAY 'CAT510B: ACTITRF UPDATED'                               
                                ' SQLCODE = ' W-DB2-SQLCODE                     
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
               DISPLAY 'CAT510B: ACTITRF NOT UPDATED '                          
                       'FOR ' L-STREAM ' STREAM.'                               
                                ' SQLCODE=' W-DB2-SQLCODE                       
                 '  STREAM-KEY='  CLIENT-NBR      OF DCLACTITRF                 
                    ' CYCLE-CD='  RCV-NBR         OF DCLACTITRF                 
           END-IF.                                                              
                                                                                
       5100-EXIT. EXIT.                                                         
      /                                                                         
       5200-INSERT-ACTITRF.                                                     
           MOVE '5200-INSERT-ACTITRF         ' TO W-ROUTINE-1.                  
                                                                                
           EXEC SQL                                                             
               INSERT INTO ACTITRF                                              
                 (                                                              
                   CLIENT_NBR                                                   
                  ,DSTBN_SIDE_CD                                                
                  ,ACAT_CONTROL_NBR                                             
                  ,PRCS_DT                                                      
                  ,CYCLE_CD                                                     
                  ,SYS_ACT_CD                                                   
                  ,SYS_RJCT_RSN_CD                                              
                  ,STTS_CD                                                      
                  ,DAYS_STTS_QTY                                                
                  ,RCRD_STTS_CD                                                 
                  ,RCRD_LNGTH_STTS_CD                                           
                  ,PHSCL_SEQ_STTS_CD                                            
                  ,LGCL_SEQ_NR_STS_CD                                           
                  ,TRANS_TYPE_STTS_CD                                           
                  ,CONTROL_NBR_STS_CD                                           
                  ,TRNFR_TYPE_STTS_CD                                           
                  ,SBMT_PRT_NR_STS_CD                                           
                  ,RCV_NBR_STTS_CD                                              
                  ,DLVR_NBR_STTS_CD                                             
                  ,ACCT_RCV_STTS_CD                                             
                  ,RCV_CUST_NM_STS_CD                                           
                  ,RCV_SS_PRIM_STS_CD                                           
                  ,RCV_SS_SCDY_STS_CD                                           
                  ,RCV_ACT_TYP_STS_CD                                           
                  ,RCV_OCC_STTS_CD                                              
                  ,RCV_CRSPN_STTS_CD                                            
                  ,ACCT_DLVR_STTS_CD                                            
                  ,TRN_TYP_RJC_STS_CD                                           
                  ,CNTL_ASTD_STTS_CD                                            
                  ,STTLM_ASCTD_STS_CD                                           
                  ,TRANS_RFRN_STTS_CD                                           
                  ,CMNT_STTS_CD                                                 
                  ,PHSCL_SEQ_NBR                                                
                  ,LGCL_SEQ_NBR                                                 
                  ,TRANS_TYPE_CD                                                
                  ,TRNFR_TYPE_CD                                                
                  ,SBMTG_PRTCP_NBR                                              
                  ,RCV_NBR                                                      
                  ,DLVR_NBR                                                     
                  ,ACCT_RCV_NBR                                                 
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                              
                  ,RCV_SS_SCNDY_NBR                                             
                  ,RCV_ACCT_TYPE_CD                                             
                  ,RCV_OCC_BRKR_NBR                                             
                  ,RCV_CRSPN_NBR                                                
                  ,PRTCP_CONTRA_CD                                              
                  ,ACCT_DLVR_NBR                                                
                  ,TRNFR_TYPE_RJCT_CD                                           
                  ,ACAT_CNTL_ASTD_NBR                                           
                  ,STTLM_ASCTD_DT                                               
                  ,TRANS_RFRN_ID_CD                                             
                  ,CMNT_TXT                                                     
                  ,CICS_TERM_ID_CD                                              
                  ,CRT_TMSTP                                                    
                  ,DB_CR_CD                                                     
                  ,NSCC_ACK_IND                                                 
                  ,NSCC_PEND_CD                                                 
                  ,PRGM_NM                                                      
                  ,RR_CD                                                        
                  ,TRNFR_TYPE_RJC1_CD                                           
                  ,TRNFR_TYPE_RJC2_CD                                           
DJ0002            ,UPDT_TMSTP                                                   
                 )                                                              
                 VALUES                                                         
                 (                                                              
                   :DCLACTITRF.CLIENT-NBR                                       
                  ,:DCLACTITRF.DSTBN-SIDE-CD                                    
                  ,:DCLACTITRF.ACAT-CONTROL-NBR                                 
                  ,:DCLACTITRF.PRCS-DT                                          
                  ,:DCLACTITRF.CYCLE-CD                                         
                  ,:DCLACTITRF.SYS-ACT-CD                                       
                  ,:DCLACTITRF.SYS-RJCT-RSN-CD                                  
                  ,:DCLACTITRF.STTS-CD                                          
                  ,:DCLACTITRF.DAYS-STTS-QTY                                    
                  ,:DCLACTITRF.RCRD-STTS-CD                                     
                  ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                               
                  ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                                
                  ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                               
                  ,:DCLACTITRF.TRANS-TYPE-STTS-CD                               
                  ,:DCLACTITRF.CONTROL-NBR-STS-CD                               
                  ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                               
                  ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                               
                  ,:DCLACTITRF.RCV-NBR-STTS-CD                                  
                  ,:DCLACTITRF.DLVR-NBR-STTS-CD                                 
                  ,:DCLACTITRF.ACCT-RCV-STTS-CD                                 
                  ,:DCLACTITRF.RCV-CUST-NM-STS-CD                               
                  ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                               
                  ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                               
                  ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                               
                  ,:DCLACTITRF.RCV-OCC-STTS-CD                                  
                  ,:DCLACTITRF.RCV-CRSPN-STTS-CD                                
                  ,:DCLACTITRF.ACCT-DLVR-STTS-CD                                
                  ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                               
                  ,:DCLACTITRF.CNTL-ASTD-STTS-CD                                
                  ,:DCLACTITRF.STTLM-ASCTD-STS-CD                               
                  ,:DCLACTITRF.TRANS-RFRN-STTS-CD                               
                  ,:DCLACTITRF.CMNT-STTS-CD                                     
                  ,:DCLACTITRF.PHSCL-SEQ-NBR                                    
                  ,:DCLACTITRF.LGCL-SEQ-NBR                                     
                  ,:DCLACTITRF.TRANS-TYPE-CD                                    
                  ,:DCLACTITRF.TRNFR-TYPE-CD                                    
                  ,:DCLACTITRF.SBMTG-PRTCP-NBR                                  
                  ,:DCLACTITRF.RCV-NBR                                          
                  ,:DCLACTITRF.DLVR-NBR                                         
                  ,:DCLACTITRF.ACCT-RCV-NBR                                     
                  ,:DCLACTITRF.RCV-CUST-NM                                      
                  ,:DCLACTITRF.RCV-SS-PRIM-NBR                                  
                  ,:DCLACTITRF.RCV-SS-SCNDY-NBR                                 
                  ,:DCLACTITRF.RCV-ACCT-TYPE-CD                                 
                  ,:DCLACTITRF.RCV-OCC-BRKR-NBR                                 
                  ,:DCLACTITRF.RCV-CRSPN-NBR                                    
                  ,:DCLACTITRF.PRTCP-CONTRA-CD                                  
                  ,:DCLACTITRF.ACCT-DLVR-NBR                                    
                  ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                               
                  ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                               
                  ,:DCLACTITRF.STTLM-ASCTD-DT                                   
                  ,:DCLACTITRF.TRANS-RFRN-ID-CD                                 
                  ,:DCLACTITRF.CMNT-TXT                                         
                  ,:DCLACTITRF.CICS-TERM-ID-CD                                  
                  ,:DCLACTITRF.CRT-TMSTP                                        
                  ,:DCLACTITRF.DB-CR-CD                                         
                  ,:DCLACTITRF.NSCC-ACK-IND                                     
                  ,:DCLACTITRF.NSCC-PEND-CD                                     
                  ,:DCLACTITRF.PRGM-NM                                          
                  ,:DCLACTITRF.RR-CD                                            
                  ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                               
                  ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                               
                  ,:DCLACTITRF.UPDT-TMSTP                                       
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               DISPLAY 'CAT510B: ACTITRF INSERTED'                              
                                ' SQLCODE = ' W-DB2-SQLCODE                     
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
               DISPLAY 'CAT510B: ACTITRF NOT INSERTED'                          
                       'FOR ' L-STREAM ' STREAM.'                               
                                ' SQLCODE=' W-DB2-SQLCODE                       
                 '  STREAM-KEY='  CLIENT-NBR      OF DCLACTITRF                 
                    ' CYCLE-CD='  RCV-NBR         OF DCLACTITRF                 
                  DISPLAY 'CAT510B: ERROR INSERTING A ROW INTO ACTITRF'         
                        ' (ACAT-TRNFR TABLE)'                                   
                  DISPLAY 'CAT510B: DCLACTITRF  ='                              
                       '(' DCLACTITRF ')'                                       
                  PERFORM 8000-SQL-ERROR THRU 8000-EXIT                         
           END-IF.                                                              
                                                                                
       5200-EXIT. EXIT.                                                         
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
                                                                                
           DISPLAY 'CAT510B: U3999 - ABENDING ON BAD DB2 STATUS'                
           DISPLAY 'CAT510B: PROGRAM ENDED ABNORMALLY'                          
           MOVE +3999    TO ABEND-CODE                                          
           CALL ABEND USING ABEND-CODE.                                         
                                                                                
       8000-EXIT. EXIT.                                                         
      /                                                                         
       9000-EOJ.                                                                
           MOVE '9000-EOJ                    ' TO W-ROUTINE-1.                  
           DISPLAY ' '.                                                         
           DISPLAY 'CAT510B: SWITCH HAS BEEN SET TO INDICATE THAT '             
                   '"' L-STREAM '"' ' STREAM '                                  
                   'CYCLE ' W-SIAC-HEADER-CYCLE ' '                             
                   'FINISHED.'                                                  
           DISPLAY ' '.                                                         
                                                                                
           CLOSE INFILE                                                         
           DISPLAY 'CAT510B: INFILE  CLOSED. STATUS = '                         
                                             INFILE-STAT.                       
                                                                                
           DISPLAY 'CAT510B: PROGRAM ENDED SUCCESSFULLY'.                       
                                                                                
       9000-EXIT.                                                               
           EXIT.                                                                
      *################################################################         
