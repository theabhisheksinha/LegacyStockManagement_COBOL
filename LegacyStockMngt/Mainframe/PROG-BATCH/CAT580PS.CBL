000001* PDX    - CAT580PS C0324918 04/03/12 14:37:15 TBLAMUR            00001000
000001* LRM003 SSR 83069 REMOVE QA LOGIC FOR PROCESSING TDY MINUS 1             
000001* PDX    - CAT580PS C0272055 11/11/08 14:21:09 TBLAMUR            00001000
000001* LRM002 SSR 60125 RECOMPILE FOR EXPANSION TO ACATPEND                    
000001* PDX    - CAT580PS C0249006 06/29/07 12:14:21 TBDOJUN            00001000
000001* DJ0001 SSR 47339 SUPPORT DUALLY LISTED SECURITIES                       
000001* DJ0001           POPULATE GETMSD-CLIENT-PL2 WHEN CALLING GETMSD         
000001* PDX    - CAT580PS C0247164 05/23/07 15:35:46 TBLAMUR                    
000001* PDX    - CAT580PS C0225257 09/09/05 14:41:15 TBLAMUR                    
000001* PDX    - CAT580PS C0222725 07/21/05 09:00:17 TBLAMUR                    
000001* PDX    - CAT580PS C0218221 04/08/05 08:16:37 TBLAMUR                    
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT580PS.                                                   
       AUTHOR.     LARRY MUREY.                                                 
      *****************************************************************         
      * THIS PROGRAM CONTAINS DB2.                                    *         
      *****************************************************************         
      * CAT580PS - READ SIAC0720 TRANSMISSION FROM NSCC.              *         
      * HARD CODING FOR WEALTH MNGT AND 0642 WM WAS REPLACED BY B1    *         
      * 1000 AND 434617 STATING CLIENT WANTS TO CREATE POST SETTLE    *         
      * FAILS.  THESE ARE EXTRACTED ON AND AFTER ORIGINAL S/D, AS     *         
      * EXISTING CAT650DB LOGIC ONLY EXTRACTS DETAILS IN CAGE RUN     *         
      * PRIOR TO THE S/D.                                             *         
      *                                                               *         
      *  CREATE EXTRACT FILE OF REJECTED FUNDS                        *         
      *****************************************************************         
      * 03/09/05       NEW PROGRAM                                    *         
LRM001* 04/12/07 SSR 47211 EXTRACT FUND REJECTS ON OR AFTER ACAT S/D  *         
LRM001*          WHICH CAME IN ON SIAC0720 FILE IN ACATPEND FORMAT    *         
LRM001*          TO PASS TO CAGE RUN OF CAT650 TO SETUP FAILS.        *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-STAT.                 
                                                                                
           SELECT POST-SETTLE-FILE ASSIGN       TO OSETTLE.                     
                                                                                
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS                  
              DEPENDING ON W-REC-LEN-IN                                         
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  IN-RECORD                   PIC X(520).                              
                                                                                
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCMHDR==.              
                                                                                
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCMTRL==.              
                                                                                
       01  DUMMY-LARGE-RECORD         PIC X(4000).                              
                                                                                
       FD  POST-SETTLE-FILE                                                     
           RECORDING MODE IS V                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
           COPY ACATPEND  REPLACING ==:FMT:== BY ==FMT==.                       
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT580PS'.          
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.                 
               88 END-OF-INFILE                      VALUE '1'.                 
               88 SKIP-ALL-INPUT                     VALUE 'S'.                 
           05  INFILE-STAT               PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING VALUE '35'.                              
           05  OUTFILE-STAT              PIC  X(002).                           
               88 OUTFILE-OKAY           VALUE '00' THRU '09', '97'.            
               88 OUTFILE-END-OF-FILE    VALUE '10'.                            
               88 OUTFILE-EMPTY-MISSING VALUE '35'.                             
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.                 
               88 INFILE-DATE-FOUND                  VALUE 'Y'.                 
           05  VTRNHSTY-FOUND-SW         PIC  X(001) VALUE 'N'.                 
               88 VTRNHSTY-ROW-NOTFND                VALUE 'N'.                 
               88 VTRNHSTY-ROW-FOUND                 VALUE 'Y'.                 
           05  VASTHSTY-FOUND-SW         PIC  X(001) VALUE 'N'.                 
               88 VASTHSTY-ROW-NOTFND                VALUE 'N'.                 
               88 VASTHSTY-ROW-FOUND                 VALUE 'Y'.                 
           05  LD-PROC-DATE.                                                    
               10 LD-PROC-DATE-MM        PIC  X(002).                           
               10 LD-PROC-DATE-DD        PIC  X(002).                           
               10 LD-PROC-DATE-YY        PIC  X(002).                           
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.                 
               88 HDR-FOUND                          VALUE 'H'.                 
               88 TRL-FOUND                          VALUE 'T'.                 
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.                 
               88 BRK-FOUND                          VALUE 'Y'.                 
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.          
           05  W-INFILE-CNT              PIC  9(009) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'OUTPUTCT'.          
           05  W-OUTFILE-CNT             PIC  9(009) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.          
           05  W-DETAIL-CNT              PIC  9(009) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'W-SUB1  '.          
           05  W-SUB1                    PIC  9(004) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'LOAD-CNT'.          
           05  W-LOAD-CNT                PIC  9(009) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.          
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.          
           05  W-REC-LEN-OUT             PIC  9(005) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'NEWCYCLE'.          
           05  W-NEXT-CYCLE              PIC  9(004) VALUE 0.                   
           05  W-SQL-CNT                 PIC  9(009) VALUE 0.                   
           05  W-NON-DETAIL-CNT          PIC  9(009) VALUE 0.                   
           05  W-VTRNHSTY-FND            PIC  9(009) VALUE 0.                   
           05  W-VTRNHSTY-NOT-FND        PIC  9(009) VALUE 0.                   
           05  W-VASTHSTY-FND            PIC  9(009) VALUE 0.                   
           05  W-VASTHSTY-NOT-FND        PIC  9(009) VALUE 0.                   
           05  W-VTRNFR-FND              PIC  9(009) VALUE 0.                   
           05  W-VTRNFR-NOT-FND          PIC  9(009) VALUE 0.                   
           05  W-VASSET-FND              PIC  9(009) VALUE 0.                   
           05  W-VASSET-NOT-FND          PIC  9(009) VALUE 0.                   
           05  W-MSD-FND-CNT             PIC  9(009) VALUE 0.                   
           05  W-MSD-NOTFND-CNT          PIC  9(009) VALUE 0.                   
           05  W-MSD-NOTFND-SW           PIC  X(001) VALUE ' '.                 
               88 W-MSD-NOTFND                       VALUE 'Y'.                 
           05  W-COMMA-PTR               PIC  9(002) VALUE 0.                   
           05  W-QTY-PTR                 PIC  9(002) VALUE 0.                   
           05  W-INT-PTR                 PIC  9(002) VALUE 0.                   
           05  W-DEC-PTR                 PIC  9(002) VALUE 0.                   
           05  W-COMMA-FND-SW            PIC  X(001) VALUE ' '.                 
           05  WS-ASSET-AMT              PIC 9(15)V99 COMP-3.                   
           05  WS-ASSET-QTY              PIC 9(12)V9(5) COMP-3.                 
                                                                                
           05  W-QTY-X.                                                         
               07  W-QTY-BYTE            PIC X OCCURS 17 TIMES.                 
           05  W-QTY REDEFINES W-QTY-X   PIC 9(17).                             
                                                                                
           05  W-QTY-N                   PIC 9(13)V9(4).                        
           05  FILLER REDEFINES W-QTY-N.                                        
               07  W-QTY-INT             PIC 9(13).                             
               07  W-QTY-DEC             PIC 9(04).                             
                                                                                
           05  W-INT                     PIC 9(17).                             
           05  W-INT-X REDEFINES W-INT.                                         
               07  W-INT-BYTE            PIC X OCCURS 17 TIMES.                 
                                                                                
           05  W-DEC                     PIC 9(04).                             
           05  W-DEC-X REDEFINES W-DEC.                                         
               07  W-DEC-BYTE            PIC X OCCURS  4 TIMES.                 
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'F - NSCC'.           
           COPY NSCCF.                                                          
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'HDR-REC '.           
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==W-HDR==.                 
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'TRL-REC '.           
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==W-TRL==.                 
      /                                                                         
LRM001     COPY ACATPEND  REPLACING ==:FMT:== BY ==WS==.                        
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'CURR-TAB'.           
       01  W-CURR-TAB.                                                          
           05  W-CURR-CLIENT-NBR             PIC X(004).                        
DJ0001     05  W-CURR-CLIENT-NUM REDEFINES                                      
DJ0001         W-CURR-CLIENT-NBR             PIC 9(004).                        
           05  W-CURR-BRK-NBR                PIC X(004).                        
           05  W-POST-SETTLE-FAILS           PIC X(01).                         
           05  W-CURR-HDR-SW                 PIC X(001).                        
           05  W-CURR-HDR-DATE               PIC X(008).                        
           05  W-CURR-HDR-CYCLE              PIC X(004).                        
           05  W-CURR-TRL-SW                 PIC X(001).                        
           05  W-CURR-TRL-DATE               PIC X(008).                        
           05  W-CURR-TRL-CYCLE              PIC X(004).                        
           05  W-CURR-ITEM-CNT               PIC 9(009).                        
           05  W-CURR-TOT-CNT                PIC 9(009).                        
                                                                                
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.           
       01  B1-WORK-FIELEDS.                                                     
           03  B1-TBL-CNT                   PIC 9(03).                          
           03  B1-SUB                       PIC 9(03).                          
       01  B1-TABLE-AREA.                                                       
           03  B1-TABLE OCCURS 500 TIMES                                        
                   INDEXED BY B1-IDX.                                           
               05  B1-ADP-CL-NO             PIC 9(04).                          
               05  B1-BKR-CLR-NO            PIC X(04).                          
               05  B1-POST-SETTLE-FAILS     PIC X(01).                          
      /                                                                         
      ******************************************************************        
      * B1 HEADER                                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.            
           COPY BHINFO.                                                         
      /                                                                         
      ******************************************************************        
      * B1 ACAT SECTION                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.            
           COPY BHACAT.                                                         
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
           COPY BPDATESC.                                                       
      /                                                                         
      ******************************************************************        
      * GETMSD COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.            
           COPY GETMSDCE.                                                       
      /                                                                         
                                                                                
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.           
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'VTRNHSTY'.           
           EXEC SQL INCLUDE VTRNHSTY     END-EXEC.                              
                                                                                
       01  FILLER                        PIC X(008) VALUE 'VASTHSTY'.           
           EXEC SQL INCLUDE VASTHSTY     END-EXEC.                              
                                                                                
       01  W-DB2-MESSAGE-AREA.                                                  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.            
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES             
                   INDEXED BY W-DB2-IDX.                                        
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.             
                                                                                
       01  W-DB2-WORKAREA.                                                      
           05  COMMIT-SQLCA              PIC  X(122).                           
           05  COMMIT-RETURN             PIC S9(009) COMP.                      
               88  COMMIT-OK                  VALUE +0.                         
               88  COMMIT-AB                  VALUE -999 THRU -1                
                                                    +1   THRU +999.             
           05  W-COMMIT-CTR              PIC  9(009) COMP-3                     
                                              VALUE 0.                          
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(009) VALUE 0.                   
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC  ---9.                             
                                                                                
      /                                                                         
      ***===> COBOL LE                                                          
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
       01  CALL-MODULES.                                                        
           05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.           
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.           
           COPY STUBCPY.                                                        
      ***<=== COBOL LE                                                          
                                                                                
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.           
      /                                                                         
      *****************************************************************         
      *    LINKAGE SECTION                                            *         
      *****************************************************************         
       LINKAGE SECTION.                                                         
       01  L-JCL-PARMS.                                                         
           05  PARMLENGTH                PIC S9(004) COMP SYNC.                 
           05  L-BYP-DATECHK-SW          PIC  X(001).                           
               88  L-BYP-DATECHK                     VALUE '1'.                 
           05  L-BYP-FILECHK-SW          PIC  X(001).                           
               88  L-BYP-FILECHK                     VALUE '1'.                 
           05  PARM-STREAM               PIC  X(001).                           
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
       0000-MAIN SECTION.                                                       
           DISPLAY 'CAT580PS - ACATS FUND/SERV POST SETTLE EXTRACT'.            
           DISPLAY '         INPUT = BZZZ.SIAC0720.ACAT.FUND'.                  
           DISPLAY '         DB2 NON UPDATE'.                                   
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
           PERFORM 1500-LOAD-B1        THRU 1500-EXIT.                          
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
           DISPLAY '2000-PROCESS - EDITING NSCC FILE'.                          
           PERFORM 2000-PROCESS        THRU 2000-EXIT                           
                   UNTIL END-OF-INFILE.                                         
           PERFORM 9100-CLOSE-ROUTINE  THRU 9100-EXIT.                          
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT.                                                               
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT580PS: L-BYP-DATECHK-SW = '                              
                            L-BYP-DATECHK-SW                                    
           ' (1=BYPASS DATE CHECK)'                                             
           DISPLAY 'CAT580PS: L-BYP-FILECHK-SW = '                              
                            L-BYP-FILECHK-SW                                    
           ' (1=BYPASS FILE CHECK)'                                             
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT580PS: DATE CHECK WILL BE BYPASSED'                  
           ELSE                                                                 
               DISPLAY 'CAT580PS: DATE CHECK WILL BE PERFORMED'                 
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT580PS: FILE CHECK WILL BE BYPASSED'                  
           ELSE                                                                 
               DISPLAY 'CAT580PS: FILE CHECK WILL BE PERFORMED'                 
           END-IF.                                                              
                                                                                
           MOVE 'CAT580PS'                TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.                   
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.                   
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.                   
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT580PS:       BPD-PROC-DATE= ' BPD-PROC-DATE              
                                '  LD-PROC-DATE= ' LD-PROC-DATE.                
           DISPLAY 'CAT580PS: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE        
           DISPLAY ' '.                                                         
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT580PS: INFILE  OPENED FOR INPUT.  STATUS = '             
                                               INFILE-STAT.                     
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT580PS: ERROR OPENING INFILE'                         
               DISPLAY 'CAT580PS: OPEN STATUS = ' INFILE-STAT                   
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT580PS: U3001 - ABENDING ON BAD FILE STATUS'          
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN OUTPUT POST-SETTLE-FILE.                                        
           MOVE SPACES TO FMT-HEADER-RECORD.                                    
           SET FMT-HEADER-ID  TO TRUE                                           
           MOVE BPD-PROC-DATE TO FMT-BOOK-DATE                                  
           MOVE 'PROGRAM=CAT580PS' TO FMT-HEADER-RECORD (5 : 16)                
           WRITE FMT-HEADER-RECORD.                                             
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       1500-LOAD-B1 SECTION.                                                    
           DISPLAY 'CAT580PS: 1500-LOAD-B1'.                                    
                                                                                
           MOVE SPACES                   TO  B1-TABLE-AREA.                     
           MOVE 0                        TO  B1-TBL-CNT.                        
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500                
                                                                                
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO              
                                             BH-ACAT-INFO                       
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N                 
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE             
             MOVE  '434500'              TO  BH-B2-INFO-ID                      
             CALL  GETB1V              USING BH-BROKER-HEADER-INFO              
                                             BH-ACAT-INFO                       
             IF   BH-BROKER-ACTIVE                                              
             AND BH-ACAT-ACTIVE                                                 
                   ADD 1 TO B1-TBL-CNT                                          
                   MOVE  BH-BROKER-NUMBER-N                                     
                                         TO B1-ADP-CL-NO  (B1-TBL-CNT)          
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)                     
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)          
                   MOVE BH-ACAT-FAILS-FUND-SERVE-ITEMS                          
                                  TO B1-POST-SETTLE-FAILS (B1-TBL-CNT)          
                   DISPLAY     'CNT=' B1-TBL-CNT                                
                                    ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)          
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)          
                                 ' ' B1-POST-SETTLE-FAILS (B1-TBL-CNT)          
             END-IF                                                             
                                                                                
           END-PERFORM.                                                         
                                                                                
           DISPLAY ' '.                                                         
                                                                                
           DISPLAY  'B1 TABLE COUNT = ' B1-TBL-CNT.                             
           DISPLAY ' '.                                                         
       1500-EXIT. EXIT.                                                         
                                                                                
      /                                                                         
       2000-PROCESS.                                                            
                                                                                
           IF  NSCCMHDR-REC-TYPE = 'H'                                          
               DISPLAY ' '                                                      
               DISPLAY 'HEADER :' NSCCMHDR-RECORD                               
               MOVE NSCCMHDR-RECORD TO W-HDR-RECORD                             
               IF  W-HDR-TRL-SW = 'T'                                           
                   PERFORM 3500-EDIT-HEADER  THRU 3500-EXIT                     
               ELSE                                                             
                   DISPLAY 'CAT580PS: MISSING TRAILER FOR PREV BROKER'          
                   MOVE +3001 TO ABEND-CODE                                     
                   PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                    
               END-IF                                                           
               MOVE 1 TO W-CURR-TOT-CNT                                         
               ADD 1 TO W-NON-DETAIL-CNT                                        
            END-IF.                                                             
                                                                                
           IF  NSCCMHDR-REC-TYPE = 'T'                                          
               DISPLAY 'TRAILER:' NSCCMTRL-RECORD                               
               MOVE NSCCMTRL-RECORD TO W-TRL-RECORD                             
               ADD 1 TO W-CURR-TOT-CNT                                          
               IF  W-HDR-TRL-SW = 'H'                                           
                   PERFORM 7000-EDIT-TRAILER THRU 7000-EXIT                     
               ELSE                                                             
                   DISPLAY 'CAT580PS: MISSING HEADER FOR THIS TRAILER'          
                   MOVE +3001 TO ABEND-CODE                                     
                   PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                    
               END-IF                                                           
               ADD 1 TO W-NON-DETAIL-CNT                                        
           END-IF.                                                              
                                                                                
           IF  NSCCMHDR-REC-TYPE = 'F'                                          
               ADD 1 TO W-DETAIL-CNT                                            
               IF  W-HDR-TRL-SW = 'H'                                           
                   PERFORM 4000-PROCESS   THRU 4000-EXIT                        
               ELSE                                                             
                   DISPLAY 'CAT580PS: MISSING HEADER FOR THIS DETAIL'           
                   MOVE +3001 TO ABEND-CODE                                     
                   PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                    
               END-IF                                                           
               ADD 1 TO W-CURR-TOT-CNT                                          
           ELSE                                                                 
               IF  NSCCMHDR-REC-TYPE = '1'                                      
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT580PS: THIS IS THE SIAC HEADER RECORD: '         
                   DISPLAY 'COLS.001-063 => ' IN-RECORD     (1 : 63)            
                           ' <= COLS.001-063'                                   
                   DISPLAY 'COLS.064-133 => ' IN-RECORD     (64: 70)            
                           ' <= COLS.064-133'                                   
                   DISPLAY ' '                                                  
                   ADD 1 TO W-NON-DETAIL-CNT                                    
               END-IF                                                           
           END-IF.                                                              
                                                                                
           PERFORM 3000-READ-INPUT THRU 3000-EXIT.                              
                                                                                
       2000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       3000-READ-INPUT.                                                         
                                                                                
           IF SKIP-ALL-INPUT                                                    
                   MOVE '1'              TO END-OF-INFILE-SW                    
                   GO TO 3000-EXIT                                              
           END-IF.                                                              
           READ INFILE                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INFILE-SW                    
                   DISPLAY 'CAT580PS: END OF INPUT REACHED'                     
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           ADD  1                        TO W-INFILE-CNT.                       
                                                                                
           IF  INFILE-OKAY                                                      
               MOVE IN-RECORD       (1 : W-REC-LEN-IN) TO                       
                    NSCCF-RECORD   (1 : W-REC-LEN-IN)                           
           ELSE                                                                 
               DISPLAY 'CAT580PS: ERROR READING INFILE'                         
               DISPLAY 'CAT580PS: READ STATUS = ' INFILE-STAT                   
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT580PS: U3007 - ABENDING ON BAD FILE STATUS'          
               MOVE +3007 TO ABEND-CODE                                         
               PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                        
           END-IF.                                                              
                                                                                
       3000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       3500-EDIT-HEADER.                                                        
                                                                                
           IF  W-CURR-BRK-NBR = NSCCMTRL-BROKER-CLR-NBR                         
               IF  W-CURR-HDR-SW = 'Y'                                          
                   DISPLAY 'CAT580PS: DUPLICATE HEADER'                         
                                  ' FOR BROKER ' W-CURR-BRK-NBR                 
                   IF  L-BYP-FILECHK                                            
                     DISPLAY 'CAT580PS: BYPASSING BAD FILE PER JCL'             
                   ELSE                                                         
                     DISPLAY 'CAT580PS: U3009 - ABENDING ON DUP BRK HDR'        
                     MOVE +3009 TO ABEND-CODE                                   
                     PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                  
                   END-IF                                                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
           MOVE ' '                         TO W-BRK-SW                         
           SET B1-IDX TO 1.                                                     
           SEARCH B1-TABLE                                                      
               AT END                                                           
                    MOVE ' '             TO W-BRK-SW                            
                    MOVE ' '             TO W-CURR-TAB                          
                    MOVE 0               TO W-CURR-ITEM-CNT                     
                    MOVE 0               TO W-CURR-TOT-CNT                      
               WHEN B1-BKR-CLR-NO (B1-IDX) =                                    
                                            NSCCMHDR-BROKER-CLR-NBR             
                    MOVE 'Y'             TO W-BRK-SW                            
                    MOVE B1-TABLE (B1-IDX)  TO W-CURR-TAB                       
           END-SEARCH.                                                          
                                                                                
           IF   W-BRK-SW = 'Y'                                                  
                DISPLAY '======> BROKER FOUND  ' NSCCMHDR-BROKER-CLR-NBR        
                          ' INPUT-CNT=' W-INFILE-CNT                            
                              ' CYCLE=' W-HDR-MULTI-CYCLE-NBR                   
                                ' CLT=' W-CURR-CLIENT-NBR                       
           ELSE                                                                 
                MOVE NSCCMHDR-BROKER-CLR-NBR TO W-CURR-BRK-NBR                  
                DISPLAY 'BYPASS: BROKER NOTFND ' NSCCMHDR-BROKER-CLR-NBR        
                          ' INPUT-CNT=' W-INFILE-CNT                            
                              ' CYCLE=' W-HDR-MULTI-CYCLE-NBR                   
           END-IF.                                                              
                                                                                
LRM003***  IF PARM-STREAM = 'Q'                                                 
LRM003***     IF (NSCCMHDR-PROC-DATE = BPD-PROC-DATE                            
LRM003***     OR L-BYP-DATECHK)                                                 
LRM003***        CONTINUE                                                       
LRM003***     ELSE                                                              
LRM003***        DISPLAY 'QA STREAM WITH WRONG SIAC 720 FILE'                   
LRM003***        DISPLAY '   IGNORE THIS FILE'                                  
LRM003***        SET SKIP-ALL-INPUT TO TRUE                                     
LRM003***  ELSE                                                                 
           IF  NSCCMHDR-PROC-DATE = BPD-PROC-DATE                               
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT580PS: NSCCMHDR-PROC-DATE('                          
                                NSCCMHDR-PROC-DATE ') NOT = '                   
                       'BPD-PROC-DATE(' BPD-PROC-DATE ')'                       
               IF L-BYP-DATECHK                                                 
                   DISPLAY 'CAT580PS: BYPASSING DATECHK PER JCLPARM'            
               ELSE                                                             
                   IF  L-BYP-FILECHK                                            
                     DISPLAY 'CAT580PS: BYPASSING BAD DATE FILE PER JCL'        
                   ELSE                                                         
                     DISPLAY 'CAT580PS: U3009 - ABENDING ON BAD DATE'           
                     MOVE +3009 TO ABEND-CODE                                   
                     PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                  
                   END-IF                                                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  NSCCMHDR-VAR-LEN-REC-IND = '*'                                   
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT580PS: NSCCMHDR-VAR-LEN-REC-IND '                    
                            '(' NSCCMHDR-VAR-LEN-REC-IND ')'                    
                            ' NOT = *'                                          
               IF  L-BYP-FILECHK                                                
                   DISPLAY 'CAT580PS: BYPASSING BAD VAR-LEN-REC-IND'            
               ELSE                                                             
                   DISPLAY 'CAT580PS: U3013 - ABENDING ON BAD VAR IND'          
                   MOVE +3013 TO ABEND-CODE                                     
                   PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                    
               END-IF                                                           
           END-IF.                                                              
                                                                                
           MOVE 'Y'                       TO W-CURR-HDR-SW                      
           MOVE NSCCMHDR-PROC-DATE        TO W-CURR-HDR-DATE.                   
      ***  MOVE NSCCMHDR-MULTI-CYCLE-NBR  TO W-CURR-HDR-CYCLE.                  
                                                                                
           MOVE 'H'               TO W-HDR-TRL-SW.                              
                                                                                
       3500-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
      ******************************************************************        
      *                                                                         
      ******************************************************************        
       4000-PROCESS.                                                            
           IF (NSCCF-ACTION-TYP = 'R' OR 'S')                                   
           AND NSCCF-PROCESS-DATE = BPD-PROC-DATE                               
           AND NSCCF-PROCESS-DATE > NSCCF-ORG-SETLMNT-DT                        
           AND W-POST-SETTLE-FAILS = '1'                                        
               PERFORM 4100-READ-DB2-HISTORY                                    
                  THRU 4100-EXIT                                                
           END-IF.                                                              
                                                                                
           IF (NSCCF-ACTION-TYP = 'R' OR 'S')                                   
           AND NSCCF-PROCESS-DATE = BPD-PROC-DATE                               
           AND NSCCF-PROCESS-DATE = NSCCF-ORG-SETLMNT-DT                        
           AND W-POST-SETTLE-FAILS = '1'                                        
               PERFORM 4102-READ-DB2-VTRNFR                                     
                  THRU 4102-EXIT                                                
           END-IF.                                                              
                                                                                
       4000-EXIT. EXIT.                                                         
                                                                                
       4100-READ-DB2-HISTORY.                                                   
           MOVE NSCCF-ACATS-CTRL-NBR TO ACAT-CONTROL-NBR OF DCLVTRNHSTY.        
           EXEC SQL                                                             
              SELECT                                                            
                 STTS_CD,                                                       
                 DSTBN_SIDE_CD,                                                 
                 PRTCP_CONTRA_CD,                                               
                 RCV_CUST_NM,                                                   
                 RCV_ACCT_TYPE_CD,                                              
                 RCV_NBR,                                                       
                 ACCT_RCV_NBR,                                                  
                 DLVR_NBR,                                                      
                 ACCT_DLVR_NBR,                                                 
LRM001           RCV_CUST_NM,                                                   
LRM001           RCV_ACCT_TYPE_CD,                                              
LRM001           STTLM_DT,                                                      
LRM001           TRNFR_TYPE_CD                                                  
               INTO                                                             
                :DCLVTRNHSTY.STTS-CD                                            
               ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                      
               ,:DCLVTRNHSTY.PRTCP-CONTRA-CD                                    
               ,:DCLVTRNHSTY.RCV-CUST-NM                                        
               ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                                   
               ,:DCLVTRNHSTY.RCV-NBR                                            
               ,:DCLVTRNHSTY.ACCT-RCV-NBR                                       
               ,:DCLVTRNHSTY.DLVR-NBR                                           
               ,:DCLVTRNHSTY.ACCT-DLVR-NBR                                      
LRM001         ,:DCLVTRNHSTY.RCV-CUST-NM                                        
LRM001         ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                                   
LRM001         ,:DCLVTRNHSTY.STTLM-DT                                           
LRM001         ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                      
               FROM VTRNHSTY                                                    
               WHERE (CLIENT_NBR                                                
                           = :W-CURR-CLIENT-NBR                                 
                  AND ACAT_CONTROL_NBR                                          
                           = :DCLVTRNHSTY.ACAT-CONTROL-NBR)                     
           END-EXEC.                                                            
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNHSTY-FND                                          
               SET VTRNHSTY-ROW-FOUND TO TRUE                                   
           ELSE                                                                 
               ADD 1 TO W-VTRNHSTY-NOT-FND                                      
               SET VTRNHSTY-ROW-NOTFND TO TRUE                                  
               SET VASTHSTY-ROW-NOTFND TO TRUE                                  
               IF  SQLCODE  NOT =  +100                                         
                   PERFORM  8000-SQL-ERROR THRU 9000-EXIT                       
               END-IF                                                           
               DISPLAY 'HSTY TIF NOTFND ' W-CURR-CLIENT-NBR                     
                                      ' ' NSCCF-ACATS-CTRL-NBR                  
LRM************PERFORM 4105-WRITE-POST-SETTLE-REC                               
               GO TO 4100-EXIT                                                  
           END-IF.                                                              
                                                                                
           MOVE NSCCF-ASSET-SEQ-NBR TO ASSET-SEQ-NBR OF DCLVASTHSTY             
           EXEC SQL                                                             
              SELECT                                                            
                 ASSET_DESC_TXT,                                                
                 ASSET_AMT,                                                     
                 ASSET_QTY,                                                     
                 SECURITY_ADP_NBR,                                              
                 ISIN_SEC_ISSUE_CD,                                             
                 PSTN_CD,                                                       
LRM001           CSH_MGN_SHRT_CD,                                               
LRM001           STTLM_RSN_CD                                                   
               INTO                                                             
                :DCLVASTHSTY.ASSET-DESC-TXT                                     
               ,:DCLVASTHSTY.ASSET-AMT                                          
               ,:DCLVASTHSTY.ASSET-QTY                                          
               ,:DCLVASTHSTY.SECURITY-ADP-NBR                                   
               ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                                  
               ,:DCLVASTHSTY.PSTN-CD                                            
LRM001         ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                                    
LRM001         ,:DCLVASTHSTY.STTLM-RSN-CD                                       
               FROM VASTHSTY                                                    
               WHERE (CLIENT_NBR                                                
                           = :W-CURR-CLIENT-NBR                                 
                  AND ACAT_CONTROL_NBR                                          
                           = :DCLVTRNHSTY.ACAT-CONTROL-NBR                      
                  AND ASSET_SEQ_NBR                                             
                           = :DCLVASTHSTY.ASSET-SEQ-NBR)                        
           END-EXEC.                                                            
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VASTHSTY-FND                                          
               SET VASTHSTY-ROW-FOUND TO TRUE                                   
           ELSE                                                                 
               ADD 1 TO W-VASTHSTY-NOT-FND                                      
               IF  SQLCODE  NOT =  +100                                         
                   PERFORM  8000-SQL-ERROR THRU 9000-EXIT                       
               END-IF                                                           
               SET VASTHSTY-ROW-NOTFND TO TRUE                                  
LRM************PERFORM 4105-WRITE-POST-SETTLE-REC                               
               GO TO 4100-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF VTRNHSTY-ROW-NOTFND                                               
           OR VASTHSTY-ROW-NOTFND                                               
               PERFORM 5150-GETMSDC THRU 5150-EXIT                              
                                                                                
               IF  GETMSD-RETURN-VALID                                          
                   ADD 1 TO W-MSD-FND-CNT                                       
                   MOVE 'N'            TO W-MSD-NOTFND-SW                       
                   MOVE MS-ADP-NO      TO SECURITY-ADP-NBR                      
               ELSE                                                             
                   ADD 1 TO W-MSD-NOTFND-CNT                                    
                   MOVE 'Y'            TO W-MSD-NOTFND-SW                       
                   MOVE ' '            TO SECURITY-ADP-NBR                      
           END-IF.                                                              
                                                                                
           PERFORM 4105-WRITE-POST-SETTLE-REC.                                  
                                                                                
       4100-EXIT. EXIT.                                                         
      /                                                                         
       4102-READ-DB2-VTRNFR.                                                    
           MOVE NSCCF-ACATS-CTRL-NBR TO ACAT-CONTROL-NBR OF DCLVTRNHSTY.        
           EXEC SQL                                                             
              SELECT                                                            
                 STTS_CD,                                                       
                 DSTBN_SIDE_CD,                                                 
                 PRTCP_CONTRA_CD,                                               
                 RCV_CUST_NM,                                                   
                 RCV_ACCT_TYPE_CD,                                              
                 RCV_NBR,                                                       
                 ACCT_RCV_NBR,                                                  
                 DLVR_NBR,                                                      
                 ACCT_DLVR_NBR,                                                 
LRM001           RCV_CUST_NM,                                                   
LRM001           RCV_ACCT_TYPE_CD,                                              
LRM001           STTLM_DT,                                                      
LRM001           TRNFR_TYPE_CD                                                  
               INTO                                                             
                :DCLVTRNHSTY.STTS-CD                                            
               ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                      
               ,:DCLVTRNHSTY.PRTCP-CONTRA-CD                                    
               ,:DCLVTRNHSTY.RCV-CUST-NM                                        
               ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                                   
               ,:DCLVTRNHSTY.RCV-NBR                                            
               ,:DCLVTRNHSTY.ACCT-RCV-NBR                                       
               ,:DCLVTRNHSTY.DLVR-NBR                                           
               ,:DCLVTRNHSTY.ACCT-DLVR-NBR                                      
LRM001         ,:DCLVTRNHSTY.RCV-CUST-NM                                        
LRM001         ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                                   
LRM001         ,:DCLVTRNHSTY.STTLM-DT                                           
LRM001         ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                      
               FROM VTRNFR                                                      
               WHERE (CLIENT_NBR                                                
                           = :W-CURR-CLIENT-NBR                                 
                  AND ACAT_CONTROL_NBR                                          
                           = :DCLVTRNHSTY.ACAT-CONTROL-NBR)                     
           END-EXEC.                                                            
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNFR-FND                                            
               SET VTRNHSTY-ROW-FOUND TO TRUE                                   
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-FND                                        
               SET VTRNHSTY-ROW-NOTFND TO TRUE                                  
               SET VASTHSTY-ROW-NOTFND TO TRUE                                  
               IF  SQLCODE  NOT =  +100                                         
                   PERFORM  8000-SQL-ERROR THRU 9000-EXIT                       
               END-IF                                                           
               DISPLAY 'ACTV TIF NOTFND ' W-CURR-CLIENT-NBR                     
                                      ' ' NSCCF-ACATS-CTRL-NBR                  
               GO TO 4102-EXIT                                                  
           END-IF.                                                              
                                                                                
           MOVE NSCCF-ASSET-SEQ-NBR TO ASSET-SEQ-NBR OF DCLVASTHSTY             
           EXEC SQL                                                             
              SELECT                                                            
                 ASSET_DESC_TXT,                                                
                 ASSET_AMT,                                                     
                 ASSET_QTY,                                                     
                 SECURITY_ADP_NBR,                                              
                 ISIN_SEC_ISSUE_CD,                                             
                 PSTN_CD,                                                       
LRM001           CSH_MGN_SHRT_CD,                                               
LRM001           STTLM_RSN_CD                                                   
               INTO                                                             
                :DCLVASTHSTY.ASSET-DESC-TXT                                     
               ,:DCLVASTHSTY.ASSET-AMT                                          
               ,:DCLVASTHSTY.ASSET-QTY                                          
               ,:DCLVASTHSTY.SECURITY-ADP-NBR                                   
               ,:DCLVASTHSTY.ISIN-SEC-ISSUE-CD                                  
               ,:DCLVASTHSTY.PSTN-CD                                            
LRM001         ,:DCLVASTHSTY.CSH-MGN-SHRT-CD                                    
LRM001         ,:DCLVASTHSTY.STTLM-RSN-CD                                       
               FROM VASSET                                                      
               WHERE (CLIENT_NBR                                                
                           = :W-CURR-CLIENT-NBR                                 
                  AND ACAT_CONTROL_NBR                                          
                           = :DCLVTRNHSTY.ACAT-CONTROL-NBR                      
                  AND ASSET_SEQ_NBR                                             
                           = :DCLVASTHSTY.ASSET-SEQ-NBR)                        
           END-EXEC.                                                            
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VASSET-FND                                            
               SET VASTHSTY-ROW-FOUND TO TRUE                                   
           ELSE                                                                 
               ADD 1 TO W-VASSET-NOT-FND                                        
               IF  SQLCODE  NOT =  +100                                         
                   PERFORM  8000-SQL-ERROR THRU 9000-EXIT                       
               END-IF                                                           
               SET VASTHSTY-ROW-NOTFND TO TRUE                                  
               GO TO 4102-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF VTRNHSTY-ROW-NOTFND                                               
           OR VASTHSTY-ROW-NOTFND                                               
               PERFORM 5150-GETMSDC THRU 5150-EXIT                              
                                                                                
               IF  GETMSD-RETURN-VALID                                          
                   ADD 1 TO W-MSD-FND-CNT                                       
                   MOVE 'N'            TO W-MSD-NOTFND-SW                       
                   MOVE MS-ADP-NO      TO SECURITY-ADP-NBR                      
               ELSE                                                             
                   ADD 1 TO W-MSD-NOTFND-CNT                                    
                   MOVE 'Y'            TO W-MSD-NOTFND-SW                       
                   MOVE ' '            TO SECURITY-ADP-NBR                      
           END-IF.                                                              
                                                                                
           PERFORM 4105-WRITE-POST-SETTLE-REC.                                  
                                                                                
       4102-EXIT. EXIT.                                                         
      /                                                                         
       4105-WRITE-POST-SETTLE-REC.                                              
           MOVE SPACES                    TO WS-TI-RECORD                       
                                             WS-AT-RECORD                       
           SET WS-TI-RECORD-ID   TO TRUE                                        
           SET WS-AT-RECORD-ID   TO TRUE                                        
           MOVE W-CURR-CLIENT-NBR (2 : 3) TO WS-TI-ADP-CL-NO-X                  
                                             WS-AT-ADP-CL-NO-X                  
           MOVE NSCCF-ACATS-CTRL-NBR TO WS-TI-CONTROL-NUM                       
                                        WS-AT-CONTROL-NUM                       
           MOVE TRNFR-TYPE-CD OF DCLVTRNHSTY TO WS-TRNFR-TYPE.                  
           MOVE NSCCF-ASSET-SEQ-NBR  TO WS-ASSET-SEQ-NO-9                       
           MOVE SECURITY-ADP-NBR     TO WS-ADP-SEC-NO                           
           MOVE NSCCF-ISIN-SEC-ID    TO WS-CUSIP-NUM                            
           MOVE STTLM-DT OF DCLVTRNHSTY (1 : 4) TO WS-SETTL-DATE(1 : 4)         
           MOVE STTLM-DT OF DCLVTRNHSTY (6 : 2) TO WS-SETTL-DATE(5 : 2)         
           MOVE STTLM-DT OF DCLVTRNHSTY (9 : 2) TO WS-SETTL-DATE(7 : 2)         
           MOVE WS-SETTL-DATE TO WS-AT-SETTL-DATE.                              
           MOVE PSTN-CD              TO WS-PSTN-CD                              
           MOVE RCV-CUST-NM          TO WS-ACT-TITLE                            
           MOVE RCV-ACCT-TYPE-CD     TO WS-ACT-TYPE                             
           IF DSTBN-SIDE-CD = 'D'                                               
              MOVE 'D'               TO WS-DSTBN-SIDE-CD                        
                                        WS-AT-DSTBN-SIDE-CD                     
              MOVE RCV-NBR OF DCLVTRNHSTY TO WS-CONTRA-BRK-NUM                  
                                             WS-AT-CONTRA-BRK-NUM               
              MOVE ACCT-RCV-NBR OF DCLVTRNHSTY                                  
                                          TO WS-CONTRA-ACCOUNT                  
                                             WS-AT-CONTRA-ACCOUNT               
              MOVE DLVR-NBR OF DCLVTRNHSTY TO WS-TI-BROKER-CLEAR-NO             
                                              WS-AT-BROKER-CLEAR-NO             
              MOVE ACCT-DLVR-NBR OF DCLVTRNHSTY                                 
                                          TO WS-TI-CUST-ACCOUNT                 
                                             WS-AT-CUST-ACCOUNT                 
           ELSE                                                                 
              MOVE 'R'            TO WS-DSTBN-SIDE-CD                           
                                     WS-AT-DSTBN-SIDE-CD                        
              MOVE DLVR-NBR OF DCLVTRNHSTY TO WS-CONTRA-BRK-NUM                 
                                              WS-AT-CONTRA-BRK-NUM              
              MOVE ACCT-DLVR-NBR OF DCLVTRNHSTY                                 
                                           TO WS-CONTRA-ACCOUNT                 
                                              WS-AT-CONTRA-ACCOUNT              
              MOVE RCV-NBR OF DCLVTRNHSTY TO WS-TI-BROKER-CLEAR-NO              
                                             WS-AT-BROKER-CLEAR-NO              
              MOVE ACCT-RCV-NBR OF DCLVTRNHSTY                                  
                                           TO WS-TI-CUST-ACCOUNT                
                                              WS-AT-CUST-ACCOUNT                
           END-IF.                                                              
                                                                                
           MOVE STTLM-RSN-CD               TO WS-STTLM-RSN-CD                   
           IF CSH-MGN-SHRT-CD = 'C' OR 'M' OR 'S'                               
              MOVE CSH-MGN-SHRT-CD TO WS-CASH-MGN-IND                           
           ELSE                                                                 
              MOVE 'C'             TO WS-CASH-MGN-IND                           
           END-IF.                                                              
           MOVE NSCCF-ORG-QNTY     TO W-QTY-X                                   
           PERFORM 5101-REFORMAT-ASSET-QTY THRU 5101-EXIT.                      
           MOVE W-QTY-N            TO WS-ASSET-QUAN                             
           MOVE ASSET-DESC-TXT TO      WS-SEC-DESC-1                            
                                                                                
           MOVE NSCCF-AMOUNT       TO W-QTY-X                                   
           PERFORM 5103-REFORMAT-ASSET-AMT THRU 5103-EXIT                       
           MOVE W-QTY-N            TO WS-ASSET-VALUE                            
                                                                                
           WRITE FMT-TI-RECORD FROM WS-TI-RECORD.                               
           WRITE FMT-AT-RECORD FROM WS-AT-RECORD.                               
           ADD  2                         TO W-OUTFILE-CNT.                     
                                                                                
       4105-EXIT. EXIT.                                                         
      /                                                                         
       5101-REFORMAT-ASSET-QTY.                                                 
                                                                                
           MOVE 0                        TO W-INT                               
                                            W-DEC                               
                                            W-QTY-N                             
           MOVE ' '                      TO W-COMMA-FND-SW                      
                                                                                
           PERFORM VARYING W-COMMA-PTR FROM 1 BY 1                              
                     UNTIL W-COMMA-PTR > 17 OR W-COMMA-FND-SW = 'Y'             
                        IF W-QTY-BYTE(W-COMMA-PTR) = ','                        
                           MOVE 'Y'      TO W-COMMA-FND-SW                      
                        END-IF                                                  
           END-PERFORM                                                          
                                                                                
           IF  W-COMMA-FND-SW = 'Y'                                             
               MOVE 17                   TO W-INT-PTR                           
               MOVE W-COMMA-PTR TO W-QTY-PTR                                    
               SUBTRACT 2     FROM W-QTY-PTR                                    
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY -1                   
                       UNTIL W-QTY-PTR = 0                                      
                       MOVE W-QTY-BYTE(W-QTY-PTR)                               
                                         TO W-INT-BYTE(W-INT-PTR)               
                       SUBTRACT 1 FROM W-INT-PTR                                
               END-PERFORM                                                      
               MOVE 1                    TO W-DEC-PTR                           
               MOVE W-COMMA-PTR TO W-QTY-PTR                                    
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY 1                    
                       UNTIL W-DEC-PTR > 4 OR W-QTY-PTR > 17                    
                       MOVE W-QTY-BYTE(W-QTY-PTR)                               
                                         TO W-DEC-BYTE(W-DEC-PTR)               
                       ADD 1        TO W-DEC-PTR                                
               END-PERFORM                                                      
           ELSE                                                                 
               MOVE W-QTY                TO W-INT                               
           END-IF.                                                              
           MOVE W-INT                    TO W-QTY-INT.                          
           MOVE W-DEC                    TO W-QTY-DEC.                          
                                                                                
       5101-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  REFORMAT ASSET AMT - UP TO 4 DECIMAL PLACES                            
      *                       IF ISO-CURR = USD  - UP TO 2 DECIMAL              
      *                       IF ISO-CURR = FCUR - UP TO 4 DECIMAL              
      *****************************************************************         
       5103-REFORMAT-ASSET-AMT.                                                 
                                                                                
           MOVE 0                        TO W-INT                               
                                            W-DEC                               
                                            W-QTY-N                             
           MOVE ' '                      TO W-COMMA-FND-SW                      
                                                                                
           PERFORM VARYING W-COMMA-PTR FROM 1 BY 1                              
                     UNTIL W-COMMA-PTR > 17 OR W-COMMA-FND-SW = 'Y'             
                        IF W-QTY-BYTE(W-COMMA-PTR) = ','                        
                           MOVE 'Y'      TO W-COMMA-FND-SW                      
                        END-IF                                                  
           END-PERFORM                                                          
                                                                                
           IF  W-COMMA-FND-SW = 'Y'                                             
               MOVE 17                   TO W-INT-PTR                           
               MOVE W-COMMA-PTR TO W-QTY-PTR                                    
               SUBTRACT 2     FROM W-QTY-PTR                                    
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY -1                   
                       UNTIL W-QTY-PTR = 0                                      
                       MOVE W-QTY-BYTE(W-QTY-PTR)                               
                                         TO W-INT-BYTE(W-INT-PTR)               
                       SUBTRACT 1 FROM W-INT-PTR                                
               END-PERFORM                                                      
               MOVE 1                    TO W-DEC-PTR                           
               MOVE W-COMMA-PTR TO W-QTY-PTR                                    
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY 1                    
                       UNTIL W-DEC-PTR > 4 OR W-QTY-PTR > 17                    
                       MOVE W-QTY-BYTE(W-QTY-PTR)                               
                                         TO W-DEC-BYTE(W-DEC-PTR)               
                       ADD 1        TO W-DEC-PTR                                
               END-PERFORM                                                      
           ELSE                                                                 
               MOVE W-QTY                TO W-INT                               
           END-IF.                                                              
           MOVE W-INT                    TO W-QTY-INT.                          
           MOVE W-DEC                    TO W-QTY-DEC.                          
                                                                                
       5103-EXIT. EXIT.                                                         
      /                                                                         
       5150-GETMSDC.                                                            
                                                                                
           MOVE 'D'                    TO   GETMSD-DEVICE-IND.                  
           MOVE 'R'                    TO   GETMSD-ACCESS-IND.                  
           MOVE 'E'                    TO   GETMSD-FORMAT-IND.                  
DJ0001     MOVE LOW-VALUES             TO   GETMSD-SEARCH-KEY-AREA.             
           MOVE NSCCF-ISIN-SEC-ID      TO   GETMSD-SEARCH-KEY.                  
           MOVE ALL ZERO               TO   GETMSD-WI-CODE                      
DJ0001     MOVE W-CURR-CLIENT-NUM      TO   GETMSD-CLIENT-PL2                   
                                                                                
           CALL GETMSDC               USING MASTER-SECURITY-RECORD.             
                                                                                
       5150-EXIT. EXIT.                                                         
      /                                                                         
       7000-EDIT-TRAILER.                                                       
                                                                                
           IF  W-CURR-BRK-NBR = NSCCMTRL-BROKER-CLR-NBR                         
               IF  W-CURR-TRL-SW = 'Y'                                          
                   DISPLAY 'CAT580PS: DUPLICATE TRAILER'                        
                                  ' FOR BROKER ' W-CURR-BRK-NBR                 
                   IF  L-BYP-FILECHK                                            
                       DISPLAY 'CAT580PS: BYPASSING DUPLICATE TRAILER'          
                   ELSE                                                         
                       MOVE +3001 TO ABEND-CODE                                 
                       PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                
                   END-IF                                                       
               ELSE                                                             
                   IF  W-CURR-HDR-SW NOT = 'Y'                                  
                       DISPLAY 'CAT580PS: MISSING HEADER'                       
                   IF  L-BYP-FILECHK                                            
                       DISPLAY 'CAT580PS: BYPASSING MISSING HEADER'             
                   ELSE                                                         
                       MOVE +3001 TO ABEND-CODE                                 
                       PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                
                   END-IF                                                       
                   END-IF                                                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
           MOVE 'Y'                       TO W-CURR-TRL-SW                      
           MOVE NSCCMTRL-PROC-DATE        TO W-CURR-TRL-DATE                    
           MOVE NSCCMTRL-MULTI-CYCLE-NBR  TO W-CURR-TRL-CYCLE.                  
           MOVE NSCCMTRL-ITEM-CNT         TO W-CURR-ITEM-CNT.                   
                                                                                
           IF  NSCCMTRL-PROC-DATE = BPD-PROC-DATE                               
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT580PS: NSCCMTRL-PROC-DATE('                          
                                NSCCMTRL-PROC-DATE ') NOT = '                   
                       'BPD-PROC-DATE(' BPD-PROC-DATE ')'                       
               IF L-BYP-DATECHK                                                 
                   DISPLAY 'CAT580PS: BYPASSING DATECHK PER JCLPARM'            
               ELSE                                                             
                   IF  L-BYP-FILECHK                                            
                     DISPLAY 'CAT580PS: BYPASSING BAD DATE FILE PER JCL'        
                   ELSE                                                         
                     DISPLAY 'CAT580PS: U3014 - ABENDING ON BAD DATE'           
                     MOVE +3014 TO ABEND-CODE                                   
                     PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                  
                   END-IF                                                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
                                                                                
           IF  NSCCMTRL-VAR-LEN-REC-IND = '*'                                   
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT580PS: NSCCMTRL-VAR-LEN-REC-IND '                    
                            '(' NSCCMTRL-VAR-LEN-REC-IND ')'                    
                            ' NOT = *'                                          
               IF  L-BYP-FILECHK                                                
                   DISPLAY 'CAT580PS: BYPASSING BAD VAR-LEN-REC-IND'            
               ELSE                                                             
                   DISPLAY 'CAT580PS: U3018 - ABENDING ON BAD VAR IND'          
                   MOVE +3018 TO ABEND-CODE                                     
                   PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                    
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  NSCCMTRL-ITEM-CNT NOT = W-CURR-TOT-CNT                           
               DISPLAY 'CAT580PS: NSCCMTRL-ITEM-CNT '                           
                            '(' NSCCMTRL-ITEM-CNT ')'                           
                           ' NOT = W-CURR-TOT-CNT '                             
                            '(' W-CURR-TOT-CNT ')'                              
               IF  L-BYP-FILECHK                                                
                  DISPLAY 'CAT580PS: BYPASSING BAD ITEM COUNT'                  
               ELSE                                                             
                  DISPLAY 'CAT580PS: U3019 - ABENDING ON BAD ITEM COUNT'        
                  MOVE +3019 TO ABEND-CODE                                      
                  PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                     
               END-IF                                                           
           END-IF.                                                              
                                                                                
           MOVE 'T'               TO W-HDR-TRL-SW.                              
                                                                                
       7000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       8000-SQL-ERROR.                                                          
           DISPLAY ' '                                                          
           DISPLAY '8000-SQL-ERROR'                                             
                  ' INFILE-CNT = ' W-INFILE-CNT                                 
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT                
                                                                                
           PERFORM 8200-DISPLAY-DB2-MSG THRU 8200-EXIT                          
           DISPLAY ' '                                                          
                                                                                
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT580PS: FILE CHECK WILL BE BYPASSED PER JCL'          
           ELSE                                                                 
               DISPLAY 'CAT580PS: U3999 - ABENDING ON BAD DB2 STATUS'           
               MOVE +3999    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
       8000-EXIT. EXIT.                                                         
      /                                                                         
       8200-DISPLAY-DB2-MSG.                                                    
                                                                                
           DISPLAY ' '                                                          
           CALL DSNTIAR USING SQLCA W-DB2-MESSAGE-AREA                          
                                    W-DB2-MESSAGE-LEN.                          
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                                
             UNTIL W-DB2-IDX GREATER THAN 12                                    
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES                      
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)                       
                   END-IF                                                       
           END-PERFORM.                                                         
                                                                                
       8200-EXIT. EXIT.                                                         
      /                                                                         
       9000-ABEND-ROUTINE.                                                      
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'CAT580PS: INPUT-CNT = ' W-INFILE-CNT                        
                                                                                
           CALL ABEND USING ABEND-CODE.                                         
                                                                                
       9000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       9100-CLOSE-ROUTINE.                                                      
                                                                                
           DISPLAY 'CAT580PS: W-TABLE = '                                       
                                                                                
           DISPLAY ' '.                                                         
           CLOSE INFILE                                                         
                 POST-SETTLE-FILE.                                              
                                                                                
           DISPLAY 'CAT580PS: INFILE   CLOSED. STATUS = '                       
                                             INFILE-STAT.                       
                                                                                
           DISPLAY 'CAT580PS: INFILE   COUNT = ' W-INFILE-CNT                   
                          ' (BZZZ.SIAC0720.ACAT.FUND)'                          
           DISPLAY 'CAT580PS: BYPASS   COUNT = ' W-NON-DETAIL-CNT               
           DISPLAY 'CAT580PS: OUTFILE  COUNT = ' W-OUTFILE-CNT                  
                          ' (CAT580PS.POST.STTL)'                               
           DISPLAY 'CAT580PS: HIST TIF FND   = ' W-VTRNHSTY-FND                 
           DISPLAY 'CAT580PS: HIST TIF NOTFND= ' W-VTRNHSTY-NOT-FND             
           DISPLAY 'CAT580PS: HIST AST FND   = ' W-VASTHSTY-FND                 
           DISPLAY 'CAT580PS: HIST AST NOTFND= ' W-VASTHSTY-NOT-FND             
           DISPLAY ' '.                                                         
           DISPLAY 'CAT580PS: ACTV TIF FND   = ' W-VTRNFR-FND                   
           DISPLAY 'CAT580PS: ACTV TIF NOTFND= ' W-VTRNFR-NOT-FND               
           DISPLAY 'CAT580PS: ACTV AST FND   = ' W-VASSET-FND                   
           DISPLAY 'CAT580PS: ACTV AST NOTFND= ' W-VASSET-NOT-FND               
           DISPLAY ' '.                                                         
           DISPLAY 'CAT580PS: PROGRAM ENDED SUCCESSFULLY'.                      
                                                                                
       9100-EXIT.                                                               
           EXIT.                                                                
