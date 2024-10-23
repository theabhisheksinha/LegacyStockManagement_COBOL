000001* PDX    - CAT581   C0336680 03/13/13 14:43:14 TBLAMUR            00001000
LRM001* ADD FUND TYPE PNC/DST TO PARM AND LOGIC TO EXTRACT DST.                 
000001* PDX    - CAT581   C0292845 04/07/10 17:15:52 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT581.                                                     
       AUTHOR.     LARRY MUREY.                                                 
      *****************************************************************         
      * THIS PROGRAM CONTAINS DB2.                                    *         
      *****************************************************************         
      * CAT581 - READ SIAC0720 TRANSMISSION FROM NSCC.                *         
      * USING B1 540210 EXTRACT PNC OMNIBUS FUND RECORDS FOR THE      *         
      * CLIENT SPECIFIED IN THE PARM.                                 *         
      *****************************************************************         
      * 03/01/10       NEW PROGRAM                                    *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-STAT.                 
           SELECT BNWREGOP          ASSIGN  TO  NTWREGOP                        
              ORGANIZATION  IS  INDEXED                                         
              ACCESS        IS  DYNAMIC                                         
              RECORD KEY    IS  REG-OPT-KEY-AREA                                
              FILE STATUS   IS  BNWREGOP-STAT.                                  
                                                                                
           SELECT PNC-SURPASS-FILE ASSIGN       TO OPNC.                        
                                                                                
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
                                                                                
       FD  BNWREGOP.                                                            
       01  BNWREGOP-RECORD.                                                     
           COPY BNWREGOP.                                                       
                                                                                
       FD  PNC-SURPASS-FILE                                                     
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS                  
              DEPENDING ON W-REC-LEN-OUT                                        
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  OUT-RECORD-SMALL           PIC X.                                    
       01  OUT-HEADER-REC             PIC X(061).                               
       01  OUT-TRAILER-REC            PIC X(070).                               
       01  PNC-RECORD                 PIC X(4000).                              
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT581'.            
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.                 
               88 END-OF-INFILE                      VALUE '1'.                 
               88 SKIP-ALL-INPUT                     VALUE 'S'.                 
           05  INFILE-STAT               PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING VALUE '35'.                              
           05  BNWREGOP-STAT             PIC  X(002).                           
               88 BNWREGOP-OKAY          VALUE '00' THRU '09', '97'.            
               88 BNWREGOP-END-OF-FILE   VALUE '10'.                            
               88 BNWREGOP-EMPTY-MISSING VALUE '35'.                            
           05  OUTFILE-STAT              PIC  X(002).                           
               88 OUTFILE-OKAY           VALUE '00' THRU '09', '97'.            
               88 OUTFILE-END-OF-FILE    VALUE '10'.                            
               88 OUTFILE-EMPTY-MISSING VALUE '35'.                             
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.                 
               88 INFILE-DATE-FOUND                  VALUE 'Y'.                 
           05  VTRNHSTY-FOUND-SW         PIC  X(001) VALUE 'N'.                 
               88 VTRNHSTY-ROW-NOTFND                VALUE 'N'.                 
               88 VTRNHSTY-ROW-FOUND                 VALUE 'Y'.                 
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
           05  FILLER                    PIC  X(008) VALUE 'ORIG DTL'.          
           05  W-CLIENT-DETAIL-READ      PIC  9(009) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'PNC FUND'.          
           05  W-PNC-FUNDS-FOUND         PIC  9(009) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'W-SUB1  '.          
           05  W-SUB1                    PIC  9(004) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'LOAD-CNT'.          
           05  W-LOAD-CNT                PIC  9(009) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.          
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.          
           05  W-REC-LEN-OUT             PIC  9(005) VALUE 0.                   
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
       01  FILLER                        PIC X(008) VALUE 'CURR-TAB'.           
       01  W-CURR-TAB.                                                          
           05  W-CURR-CLIENT-NBR             PIC X(004).                        
           05  W-CURR-CLIENT-NUM REDEFINES                                      
               W-CURR-CLIENT-NBR             PIC 9(004).                        
           05  W-CURR-BRK-NBR                PIC X(004).                        
           05  W-CURR-HDR-SW                 PIC X(001).                        
           05  W-CURR-HDR-DATE               PIC X(008).                        
           05  W-CURR-HDR-CYCLE              PIC X(004).                        
           05  W-CURR-TRL-SW                 PIC X(001).                        
           05  W-CURR-TRL-DATE               PIC X(008).                        
           05  W-CURR-TRL-CYCLE              PIC X(004).                        
           05  W-CURR-ITEM-CNT               PIC 9(009).                        
           05  W-CURR-TOT-CNT                PIC 9(009) VALUE 0.                
                                                                                
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
               05  B1-PNC-SURPASS-FAILS     PIC X(01).                          
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
      ******************************************************************        
      * B1 MF3 SECTION                                                 *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.            
           COPY BHMF.                                                           
           COPY BHMF3.                                                          
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
           COPY BPDATESC.                                                       
      /                                                                         
       01  CHECKDIGIT-AREA.                                                     
           05  CD-CLIENT3.                                                      
               10  CD-CLIENT3-NMBR     PIC  9(03).                              
           05  CD-BR-ACCT-T-C.                                                  
               10  CD-BR-ACCT-T.                                                
                   15  CD-BRANCH       PIC  X(03).                              
                   15  CD-ACCT         PIC  X(05).                              
                   15  CD-ACCT-TYPE    PIC  X(01).                              
               10  CD-CHKDIGIT         PIC  X(01).                              
           05  CD-ERR-MSG              PIC  X(80).                              
           05  CD-ERR-CODE             PIC  X(02).                              
           05  CD-B1-CHK               PIC  X(01)           VALUE 'Y'.          
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
                                                                                
       01  FILLER                        PIC X(008) VALUE 'VTRNFR  '.           
           EXEC SQL INCLUDE VTRNFR       END-EXEC.                              
                                                                                
       01  FILLER                        PIC X(008) VALUE 'VASSET  '.           
           EXEC SQL INCLUDE VASSET       END-EXEC.                              
                                                                                
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
           03  CHKDIGIT                  PIC  X(08) VALUE 'CHKDIGIT'.           
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
           05  PARM-CLIENT-N             PIC  9(003).                           
LRM001     05  PARM-FUND-TYPE            PIC  X(003).                           
LRM001         88  PARM-PNC                          VALUE 'PNC'.               
LRM001         88  PARM-DST                          VALUE 'DST'.               
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
       0000-MAIN SECTION.                                                       
           DISPLAY 'CAT581 - ACATS FUND/SERV PNC/DST/SURPASS EXTRACT'.          
           DISPLAY '         INPUT = BZZZ.SIAC0720.ACAT.FUND'.                  
           DISPLAY '         DB2 NON UPDATE'.                                   
LRM001     DISPLAY '         EXTRACT RUN TYPE = ' PARM-FUND-TYPE                
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
           PERFORM 1500-LOAD-B1        THRU 1500-EXIT.                          
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
           DISPLAY '2000-PROCESS - EDITING NSCC FILE'.                          
           PERFORM 2000-PROCESS        THRU 2000-EXIT                           
                   UNTIL END-OF-INFILE.                                         
           IF W-CURR-TOT-CNT = ZEROS                                            
              PERFORM 5000-CREATE-HDR-TRL.                                      
           PERFORM 9100-CLOSE-ROUTINE  THRU 9100-EXIT.                          
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT.                                                               
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT581: L-BYP-DATECHK-SW = '                                
                            L-BYP-DATECHK-SW                                    
           ' (1=BYPASS DATE CHECK)'                                             
           DISPLAY 'CAT581: L-BYP-FILECHK-SW = '                                
                            L-BYP-FILECHK-SW                                    
           ' (1=BYPASS FILE CHECK)'                                             
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT581: DATE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT581: DATE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT581: FILE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT581: FILE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
                                                                                
           MOVE 'CAT581'                  TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.                   
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.                   
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.                   
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT581:       BPD-PROC-DATE= ' BPD-PROC-DATE                
                                '  LD-PROC-DATE= ' LD-PROC-DATE.                
           DISPLAY 'CAT581: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE          
           DISPLAY ' '.                                                         
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT581: INFILE  OPENED FOR INPUT.  STATUS = '               
                                               INFILE-STAT.                     
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT581: ERROR OPENING INFILE'                           
               DISPLAY 'CAT581: OPEN STATUS = ' INFILE-STAT                     
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT581: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT BNWREGOP.                                                 
           IF  BNWREGOP-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT581: ERROR OPENING BNWREGOP'                         
               DISPLAY 'CAT581: OPEN STATUS = ' BNWREGOP-STAT                   
               DISPLAY 'CAT581: U3002 - ABENDING ON BAD FILE STATUS'            
               MOVE +3002    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN OUTPUT PNC-SURPASS-FILE.                                        
                                                                                
       1000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       1500-LOAD-B1 SECTION.                                                    
           DISPLAY 'CAT581: 1500-LOAD-B1'.                                      
                                                                                
           MOVE SPACES                   TO  B1-TABLE-AREA.                     
           IF PARM-CLIENT-N NOT NUMERIC                                         
              DISPLAY 'CAT581: U3004 - ABENDING ON PARM CLIENT'                 
              MOVE +3004 TO ABEND-CODE                                          
              PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                         
           END-IF.                                                              
                                                                                
           MOVE 1 TO B1-TBL-CNT.                                                
           MOVE PARM-CLIENT-N TO W-CURR-CLIENT-NBR                              
LRM001     DISPLAY '  PROCESSING FOR CLIENT ' PARM-CLIENT-N.                    
                                                                                
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO              
                                             BH-ACAT-INFO                       
                                             B1-BKR-CLR-NO(1)                   
             MOVE  PARM-CLIENT-N         TO  BH-BROKER-NUMBER-N                 
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE             
             MOVE  '434500'              TO  BH-B2-INFO-ID                      
             CALL  GETB1V              USING BH-BROKER-HEADER-INFO              
                                             BH-ACAT-INFO                       
             IF  BH-BROKER-ACTIVE                                               
             AND BH-ACAT-ACTIVE                                                 
                 MOVE  PARM-CLIENT-N     TO  BH-BROKER-NUMBER-N                 
                 MOVE '015'              TO  BH-LOGICAL-RECORD-CODE             
                 MOVE '537000'           TO  BH-B2-INFO-ID                      
                 CALL  GETB1V         USING  BH-BROKER-HEADER-INFO              
                                             BH-MF-INFO                         
                 MOVE  PARM-CLIENT-N     TO  BH-BROKER-NUMBER-N                 
                 MOVE '015'              TO  BH-LOGICAL-RECORD-CODE             
                 MOVE '540000'           TO  BH-B2-INFO-ID                      
                 CALL GETB1V USING BH-BROKER-HEADER-INFO                        
                                   BH-MF3-INFO                                  
                 IF BH-MF-ACTIVE                                                
                 AND BH-MF3-ACTIVE                                              
                 AND ((BH-MF3-PNC-SURPAS-PROCESSING = '1'                       
LRM001              AND PARM-PNC)                                               
LRM001           OR PARM-DST)                                                   
                   MOVE  BH-BROKER-NUMBER-N                                     
                                         TO B1-ADP-CL-NO  (B1-TBL-CNT)          
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)                     
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)          
                   DISPLAY     'CNT=' B1-TBL-CNT                                
                                    ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)          
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)          
                 END-IF                                                         
             END-IF.                                                            
                                                                                
           DISPLAY ' '.                                                         
                                                                                
           DISPLAY  'B1 TABLE COUNT = ' B1-TBL-CNT.                             
           DISPLAY ' '.                                                         
       1500-EXIT. EXIT.                                                         
                                                                                
      /                                                                         
       2000-PROCESS.                                                            
                                                                                
           IF  NSCCMHDR-REC-TYPE = 'H'                                          
               IF NSCCMHDR-BROKER-CLR-NBR = B1-BKR-CLR-NO(1)                    
                  DISPLAY ' '                                                   
                  DISPLAY 'HEADER :' NSCCMHDR-RECORD                            
                  MOVE 'Y' TO W-HDR-TRL-SW                                      
                  MOVE NSCCMHDR-RECORD TO W-HDR-RECORD                          
                  PERFORM 3500-EDIT-HEADER  THRU 3500-EXIT                      
                  MOVE 1 TO W-CURR-TOT-CNT                                      
                  ADD 1 TO W-OUTFILE-CNT                                        
                  MOVE W-REC-LEN-IN TO W-REC-LEN-OUT                            
                  WRITE PNC-RECORD FROM IN-RECORD                               
               ELSE                                                             
                  MOVE 'N' TO W-HDR-TRL-SW                                      
           END-IF.                                                              
                                                                                
           IF  NSCCMHDR-REC-TYPE = 'T'                                          
           AND NSCCMTRL-BROKER-CLR-NBR = B1-BKR-CLR-NO(1)                       
               DISPLAY 'TRAILER:' NSCCMTRL-RECORD                               
               MOVE NSCCMTRL-RECORD TO W-TRL-RECORD                             
               ADD 1 TO W-CURR-TOT-CNT                                          
               IF  W-HDR-TRL-SW = 'Y'                                           
                   PERFORM 7000-EDIT-TRAILER THRU 7000-EXIT                     
               ELSE                                                             
                   DISPLAY 'CAT581: MISSING HEADER FOR THIS TRAILER'            
                   MOVE +3001 TO ABEND-CODE                                     
                   PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                    
               END-IF                                                           
               ADD 1 TO W-OUTFILE-CNT                                           
               MOVE W-REC-LEN-IN TO W-REC-LEN-OUT                               
               MOVE W-OUTFILE-CNT TO NSCCMTRL-ITEM-CNT                          
               WRITE PNC-RECORD FROM IN-RECORD                                  
           END-IF.                                                              
                                                                                
           IF  NSCCMHDR-REC-TYPE = 'F'                                          
           AND W-HDR-TRL-SW = 'Y'                                               
              MOVE IN-RECORD TO NSCCF-RECORD                                    
              ADD 1 TO W-CLIENT-DETAIL-READ                                     
              PERFORM 3200-READ-BNWREGOP                                        
              IF BNWREGOP-OKAY                                                  
LRM001        AND ((PNC-SURPAS-PROCESSING AND PARM-PNC)                         
LRM001         OR (DST-DIRECT AND PARM-DST))                                    
                 ADD 1 TO W-DETAIL-CNT                                          
                          W-PNC-FUNDS-FOUND                                     
                 PERFORM 4000-PROCESS   THRU 4000-EXIT                          
              END-IF                                                            
           ELSE                                                                 
               IF  NSCCMHDR-REC-TYPE = '1'                                      
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT581: THIS IS THE SIAC HEADER RECORD: '           
                   DISPLAY 'COLS.001-063 => ' IN-RECORD     (1 : 63)            
                           ' <= COLS.001-063'                                   
                   DISPLAY 'COLS.064-133 => ' IN-RECORD     (64: 70)            
                           ' <= COLS.064-133'                                   
                   DISPLAY ' '                                                  
                   ADD 1 TO W-NON-DETAIL-CNT                                    
                   MOVE W-REC-LEN-IN TO W-REC-LEN-OUT                           
                   WRITE PNC-RECORD FROM IN-RECORD                              
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
                   DISPLAY 'CAT581: END OF INPUT REACHED'                       
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           ADD  1                        TO W-INFILE-CNT.                       
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT581: ERROR READING INFILE'                           
               DISPLAY 'CAT581: READ STATUS = ' INFILE-STAT                     
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT581: U3007 - ABENDING ON BAD FILE STATUS'            
               MOVE +3007 TO ABEND-CODE                                         
               PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                        
           END-IF.                                                              
                                                                                
       3000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       3200-READ-BNWREGOP.                                                      
           MOVE SPACES                  TO BNWREGOP-RECORD                      
           MOVE PARM-CLIENT-N           TO CLIENT-NO OF BNWREGOP-RECORD         
           MOVE NSCCF-ISIN-SEC-ID       TO CUSIP-9   OF BNWREGOP-RECORD         
                                                                                
           READ BNWREGOP.                                                       
                                                                                
           IF BNWREGOP-OKAY                                                     
              DISPLAY 'BNWREGOP FOUND FOR ' NSCCF-ISIN-SEC-ID                   
                                   ' '   NSCCF-ACATS-CTRL-NBR                   
TEST****      IF NSCCF-ISIN-SEC-ID = '90262H627'                                
TEST****      OR NSCCF-ISIN-SEC-ID = '001413103'                                
TEST****      OR NSCCF-ISIN-SEC-ID = '409905106'                                
TEST****         SET PNC-SURPAS-PROCESSING TO TRUE                              
TEST****      END-IF                                                            
           ELSE                                                                 
              DISPLAY 'BNWREGOP NOTFND ' NSCCF-ISIN-SEC-ID                      
                                   ' '   NSCCF-ACATS-CTRL-NBR                   
           END-IF.                                                              
                                                                                
       3500-EDIT-HEADER.                                                        
                                                                                
           IF  W-CURR-BRK-NBR = NSCCMTRL-BROKER-CLR-NBR                         
               IF  W-CURR-HDR-SW = 'Y'                                          
                   DISPLAY 'CAT581: DUPLICATE HEADER'                           
                                  ' FOR BROKER ' W-CURR-BRK-NBR                 
                   IF  L-BYP-FILECHK                                            
                     DISPLAY 'CAT581: BYPASSING BAD FILE PER JCL'               
                   ELSE                                                         
                     DISPLAY 'CAT581: U3009 - ABENDING ON DUP BRK HDR'          
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
                                                                                
           IF PARM-STREAM = 'Q'                                                 
              IF (NSCCMHDR-PROC-DATE = BPD-PROC-DATE                            
              OR L-BYP-DATECHK)                                                 
                 CONTINUE                                                       
              ELSE                                                              
                 DISPLAY 'QA STREAM WITH WRONG SIAC 720 FILE'                   
                 DISPLAY '   IGNORE THIS FILE'                                  
                 SET SKIP-ALL-INPUT TO TRUE                                     
           ELSE                                                                 
           IF  NSCCMHDR-PROC-DATE = BPD-PROC-DATE                               
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT581: NSCCMHDR-PROC-DATE('                            
                                NSCCMHDR-PROC-DATE ') NOT = '                   
                       'BPD-PROC-DATE(' BPD-PROC-DATE ')'                       
               IF L-BYP-DATECHK                                                 
                   DISPLAY 'CAT581: BYPASSING DATECHK PER JCLPARM'              
               ELSE                                                             
                   IF  L-BYP-FILECHK                                            
                     DISPLAY 'CAT581: BYPASSING BAD DATE FILE PER JCL'          
                   ELSE                                                         
                     DISPLAY 'CAT581: U3011 - ABENDING ON BAD DATE'             
                     MOVE +3011 TO ABEND-CODE                                   
                     PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                  
                   END-IF                                                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  NSCCMHDR-VAR-LEN-REC-IND = '*'                                   
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT581: NSCCMHDR-VAR-LEN-REC-IND '                      
                            '(' NSCCMHDR-VAR-LEN-REC-IND ')'                    
                            ' NOT = *'                                          
               IF  L-BYP-FILECHK                                                
                   DISPLAY 'CAT581: BYPASSING BAD VAR-LEN-REC-IND'              
               ELSE                                                             
                   DISPLAY 'CAT581: U3013 - ABENDING ON BAD VAR IND'            
                   MOVE +3013 TO ABEND-CODE                                     
                   PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                    
               END-IF                                                           
           END-IF.                                                              
                                                                                
           MOVE 'Y'                       TO W-CURR-HDR-SW                      
           MOVE NSCCMHDR-PROC-DATE        TO W-CURR-HDR-DATE.                   
                                                                                
       3500-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
      ******************************************************************        
      *                                                                         
      ******************************************************************        
       4000-PROCESS.                                                            
                                                                                
           MOVE SPACES TO CSH-MGN-SHRT-CD OF DCLVASTHSTY.                       
           PERFORM 4100-READ-DB2-HISTORY                                        
              THRU 4100-EXIT.                                                   
           IF VTRNHSTY-ROW-NOTFND                                               
               PERFORM 4102-READ-DB2-VTRNFR                                     
                  THRU 4102-EXIT                                                
           END-IF.                                                              
                                                                                
           IF VTRNHSTY-ROW-NOTFND                                               
              GO TO 4000-WRITE-ASIS                                             
           END-IF.                                                              
                                                                                
           MOVE PARM-CLIENT-N TO CD-CLIENT3-NMBR                                
           MOVE BRANCH-CD OF DCLVTRNHSTY   TO CD-BRANCH                         
           MOVE ACCT-CD   OF DCLVTRNHSTY   TO CD-ACCT                           
           IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                                   
           OR CSH-MGN-SHRT-CD OF DCLVASTHSTY = 'C'                              
                MOVE '1'      TO CD-ACCT-TYPE                                   
           ELSE                                                                 
           IF CSH-MGN-SHRT-CD OF DCLVASTHSTY = 'M'                              
                MOVE '2'      TO CD-ACCT-TYPE                                   
           ELSE                                                                 
           IF CSH-MGN-SHRT-CD OF DCLVASTHSTY = 'S'                              
                MOVE '5'      TO CD-ACCT-TYPE                                   
           ELSE                                                                 
                MOVE '1'      TO CD-ACCT-TYPE                                   
           END-IF.                                                              
                                                                                
           MOVE  'X'          TO CD-CHKDIGIT.                                   
                                                                                
           CALL    CHKDIGIT        USING CHECKDIGIT-AREA.                       
                                                                                
           IF CD-ERR-CODE NOT = '00'                                            
                   DISPLAY 'CHKDIGIT FAILED WITH I/O ARE '                      
                       CHECKDIGIT-AREA                                          
                   DISPLAY '** ERROR CODE : ' CD-ERR-CODE ' '                   
                           CD-ERR-MSG                                           
              MOVE 'X'            TO CD-CHKDIGIT                                
           END-IF.                                                              
                                                                                
           IF DSTBN-SIDE-CD OF DCLVTRNHSTY = 'R'                                
              DISPLAY 'REPL RCVR ACCT ' NSCCF-RCV-CUST-ACT-NBR                  
                ' WITH ' CHECKDIGIT-AREA(1:13)                                  
              MOVE CHECKDIGIT-AREA(1:13) TO NSCCF-RCV-CUST-ACT-NBR              
           ELSE                                                                 
              DISPLAY 'REPL DLVR ACCT '  NSCCF-DEL-CUST-ACT-NBR                 
                ' WITH ' CHECKDIGIT-AREA(1:13)                                  
              MOVE CHECKDIGIT-AREA(1:13) TO NSCCF-DEL-CUST-ACT-NBR              
           END-IF.                                                              
                                                                                
       4000-WRITE-ASIS.                                                         
           ADD 1 TO W-OUTFILE-CNT.                                              
           MOVE W-REC-LEN-IN TO W-REC-LEN-OUT.                                  
           WRITE PNC-RECORD FROM NSCCF-RECORD.                                  
                                                                                
       4000-EXIT. EXIT.                                                         
                                                                                
       4100-READ-DB2-HISTORY.                                                   
           MOVE NSCCF-ACATS-CTRL-NBR TO ACAT-CONTROL-NBR OF DCLVTRNHSTY.        
           EXEC SQL                                                             
              SELECT                                                            
                 DSTBN_SIDE_CD                                                  
                ,BRANCH_CD                                                      
                ,ACCT_CD                                                        
                ,TRNFR_TYPE_CD                                                  
               INTO                                                             
                :DCLVTRNHSTY.DSTBN-SIDE-CD                                      
               ,:DCLVTRNHSTY.BRANCH-CD                                          
               ,:DCLVTRNHSTY.ACCT-CD                                            
               ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                      
               FROM VTRNHSTY                                                    
               WHERE (CLIENT_NBR                                                
                           = :W-CURR-CLIENT-NBR                                 
                  AND ACAT_CONTROL_NBR                                          
                           = :DCLVTRNHSTY.ACAT-CONTROL-NBR)                     
              WITH UR                                                           
           END-EXEC.                                                            
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNHSTY-FND                                          
               SET VTRNHSTY-ROW-FOUND TO TRUE                                   
           ELSE                                                                 
               ADD 1 TO W-VTRNHSTY-NOT-FND                                      
               SET VTRNHSTY-ROW-NOTFND TO TRUE                                  
               IF  SQLCODE  NOT =  +100                                         
                   PERFORM  8000-SQL-ERROR THRU 9000-EXIT                       
               END-IF                                                           
               DISPLAY 'HSTY TIF NOTFND ' W-CURR-CLIENT-NBR                     
                                      ' ' NSCCF-ACATS-CTRL-NBR                  
               GO TO 4100-EXIT                                                  
           END-IF.                                                              
                                                                                
           MOVE NSCCF-ASSET-SEQ-NBR TO ASSET-SEQ-NBR OF DCLVASTHSTY             
           EXEC SQL                                                             
              SELECT                                                            
                 CSH_MGN_SHRT_CD                                                
               INTO                                                             
                :DCLVASTHSTY.CSH-MGN-SHRT-CD                                    
               FROM VASTHSTY                                                    
               WHERE (CLIENT_NBR                                                
                           = :W-CURR-CLIENT-NBR                                 
                  AND ACAT_CONTROL_NBR                                          
                           = :DCLVTRNHSTY.ACAT-CONTROL-NBR                      
                  AND ASSET_SEQ_NBR                                             
                           = :DCLVASTHSTY.ASSET-SEQ-NBR)                        
              WITH UR                                                           
           END-EXEC.                                                            
           IF  SQLCODE  =  +0 OR -811                                           
               ADD 1 TO W-VASTHSTY-FND                                          
           ELSE                                                                 
               ADD 1 TO W-VASTHSTY-NOT-FND                                      
               IF  SQLCODE  NOT =  +100                                         
                   PERFORM  8000-SQL-ERROR THRU 9000-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       4100-EXIT. EXIT.                                                         
      /                                                                         
       4102-READ-DB2-VTRNFR.                                                    
           MOVE NSCCF-ACATS-CTRL-NBR TO ACAT-CONTROL-NBR OF DCLVTRNHSTY.        
           EXEC SQL                                                             
              SELECT                                                            
                DSTBN_SIDE_CD                                                   
               ,BRANCH_CD                                                       
               ,ACCT_CD                                                         
               ,TRNFR_TYPE_CD                                                   
               INTO                                                             
                :DCLVTRNHSTY.DSTBN-SIDE-CD                                      
               ,:DCLVTRNHSTY.BRANCH-CD                                          
               ,:DCLVTRNHSTY.ACCT-CD                                            
               ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                      
               FROM VTRNFR                                                      
               WHERE (CLIENT_NBR                                                
                           = :W-CURR-CLIENT-NBR                                 
                  AND ACAT_CONTROL_NBR                                          
                           = :DCLVTRNHSTY.ACAT-CONTROL-NBR)                     
              WITH UR                                                           
           END-EXEC.                                                            
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNFR-FND                                            
               SET VTRNHSTY-ROW-FOUND TO TRUE                                   
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-FND                                        
               SET VTRNHSTY-ROW-NOTFND TO TRUE                                  
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
                 CSH_MGN_SHRT_CD                                                
               INTO                                                             
                :DCLVASTHSTY.CSH-MGN-SHRT-CD                                    
               FROM VASSET                                                      
               WHERE (CLIENT_NBR                                                
                           = :W-CURR-CLIENT-NBR                                 
                  AND ACAT_CONTROL_NBR                                          
                           = :DCLVTRNHSTY.ACAT-CONTROL-NBR                      
                  AND ASSET_SEQ_NBR                                             
                           = :DCLVASTHSTY.ASSET-SEQ-NBR)                        
              WITH UR                                                           
           END-EXEC.                                                            
           IF  SQLCODE  =  +0 OR -811                                           
               ADD 1 TO W-VASSET-FND                                            
           ELSE                                                                 
               ADD 1 TO W-VASSET-NOT-FND                                        
               IF  SQLCODE  NOT =  +100                                         
                   PERFORM  8000-SQL-ERROR THRU 9000-EXIT                       
               END-IF                                                           
           END-IF.                                                              
       4102-EXIT. EXIT.                                                         
      /                                                                         
       5000-CREATE-HDR-TRL.                                                     
           MOVE SPACES TO  NSCCMHDR-RECORD.                             NSCCMHDR
           SET NSCCMHDR-HEADER TO TRUE                                  NSCCMHDR
           SET NSCCMHDR-VAR-LEN-61 TO TRUE                              NSCCMHDR
           IF PARM-STREAM = 'Q'                                                 
              MOVE '02980720'  TO NSCCMHDR-AUTORTE-PROD-ID              NSCCMHDR
           ELSE                                                                 
              MOVE '02090720'  TO NSCCMHDR-AUTORTE-PROD-ID              NSCCMHDR
           END-IF.                                                              
           SET NSCCMHDR-FILE-ID-02090720 TO TRUE                        NSCCMHDR
LRM001*****MOVE '0235' TO NSCCMHDR-BROKER-CLR-NBR                       NSCCMHDR
LRM001     MOVE B1-BKR-CLR-NO(1) TO NSCCMHDR-BROKER-CLR-NBR             NSCCMHDR
           MOVE BPD-PROC-DATE  TO NSCCMHDR-PROC-DATE                    NSCCMHDR
           SET NSCCMHDR-SINGLE-CYLE  TO TRUE                            NSCCMHDR
           SET NSCCMHDR-SINGLE-CYLE-NBR TO TRUE                         NSCCMHDR
           SET NSCCMHDR-IS-VAR-LEN TO TRUE                              NSCCMHDR
           MOVE 61 TO W-REC-LEN-OUT                                             
           WRITE OUT-HEADER-REC FROM NSCCMHDR-RECORD                            
                                                                                
           MOVE SPACES TO NSCCMTRL-RECORD.                              NSCCMTRL
           SET NSCCMTRL-TRAILER TO TRUE                                 NSCCMTRL
           SET NSCCMTRL-VAR-LEN-70 TO TRUE                              NSCCMTRL
           IF PARM-STREAM = 'Q'                                                 
              MOVE '02980720'  TO NSCCMTRL-AUTORTE-PROD-ID                      
           ELSE                                                                 
              MOVE '02090720'  TO NSCCMTRL-AUTORTE-PROD-ID                      
           END-IF.                                                              
           SET NSCCMTRL-FILE-ID-02090720 TO TRUE                        NSCCMTRL
LRM001*****MOVE '0235' TO NSCCMTRL-BROKER-CLR-NBR                       NSCCMTRL
LRM001     MOVE B1-BKR-CLR-NO(1) TO NSCCMTRL-BROKER-CLR-NBR             NSCCMHDR
           MOVE BPD-PROC-DATE TO NSCCMTRL-PROC-DATE                     NSCCMTRL
           SET NSCCMTRL-SINGLE-CYLE  TO TRUE                            NSCCMTRL
           SET NSCCMTRL-SINGLE-CYLE-NBR TO TRUE                         NSCCMTRL
           SET NSCCMTRL-IS-VAR-LEN TO TRUE                              NSCCMTRL
           MOVE '000000002' TO NSCCMTRL-ITEM-CNT                        NSCCMTRL
           MOVE 70 TO W-REC-LEN-OUT                                             
           WRITE OUT-TRAILER-REC FROM NSCCMTRL-RECORD.                          
      /                                                                         
       7000-EDIT-TRAILER.                                                       
                                                                                
           IF  W-CURR-BRK-NBR = NSCCMTRL-BROKER-CLR-NBR                         
               IF  W-CURR-TRL-SW = 'Y'                                          
                   DISPLAY 'CAT581: DUPLICATE TRAILER'                          
                                  ' FOR BROKER ' W-CURR-BRK-NBR                 
                   IF  L-BYP-FILECHK                                            
                       DISPLAY 'CAT581: BYPASSING DUPLICATE TRAILER'            
                   ELSE                                                         
                       MOVE +3001 TO ABEND-CODE                                 
                       PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                
                   END-IF                                                       
               ELSE                                                             
                   IF  W-CURR-HDR-SW NOT = 'Y'                                  
                       DISPLAY 'CAT581: MISSING HEADER'                         
                   IF  L-BYP-FILECHK                                            
                       DISPLAY 'CAT581: BYPASSING MISSING HEADER'               
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
               DISPLAY 'CAT581: NSCCMTRL-PROC-DATE('                            
                                NSCCMTRL-PROC-DATE ') NOT = '                   
                       'BPD-PROC-DATE(' BPD-PROC-DATE ')'                       
               IF L-BYP-DATECHK                                                 
                   DISPLAY 'CAT581: BYPASSING DATECHK PER JCLPARM'              
               ELSE                                                             
                   IF  L-BYP-FILECHK                                            
                     DISPLAY 'CAT581: BYPASSING BAD DATE FILE PER JCL'          
                   ELSE                                                         
                     DISPLAY 'CAT581: U3014 - ABENDING ON BAD DATE'             
                     MOVE +3014 TO ABEND-CODE                                   
                     PERFORM 9000-ABEND-ROUTINE THRU 9000-EXIT                  
                   END-IF                                                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
                                                                                
           IF  NSCCMTRL-VAR-LEN-REC-IND = '*'                                   
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT581: NSCCMTRL-VAR-LEN-REC-IND '                      
                            '(' NSCCMTRL-VAR-LEN-REC-IND ')'                    
                            ' NOT = *'                                          
               IF  L-BYP-FILECHK                                                
                   DISPLAY 'CAT581: BYPASSING BAD VAR-LEN-REC-IND'              
               ELSE                                                             
                   DISPLAY 'CAT581: U3018 - ABENDING ON BAD VAR IND'            
                   MOVE +3018 TO ABEND-CODE                                     
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
               DISPLAY 'CAT581: FILE CHECK WILL BE BYPASSED PER JCL'            
           ELSE                                                                 
               DISPLAY 'CAT581: U3999 - ABENDING ON BAD DB2 STATUS'             
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
           DISPLAY 'CAT581: INPUT-CNT = ' W-INFILE-CNT                          
                                                                                
           CALL ABEND USING ABEND-CODE.                                         
                                                                                
       9000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       9100-CLOSE-ROUTINE.                                                      
                                                                                
           DISPLAY 'CAT581: W-TABLE = '                                         
                                                                                
           DISPLAY ' '.                                                         
           CLOSE INFILE                                                         
                 PNC-SURPASS-FILE.                                              
                                                                                
           DISPLAY 'CAT581: INFILE   CLOSED. STATUS = '                         
                                             INFILE-STAT.                       
                                                                                
           DISPLAY 'CAT581: INFILE   COUNT = ' W-INFILE-CNT                     
                          ' (BZZZ.SIAC0720.ACAT.FUND)'                          
           DISPLAY 'CAT581: CL DETAILS READ = ' W-CLIENT-DETAIL-READ            
LRM001     DISPLAY 'CAT581: MATCHING FUNDS  = ' W-PNC-FUNDS-FOUND               
           DISPLAY 'CAT581: OUTFILE  COUNT  = ' W-OUTFILE-CNT                   
                          ' (CAT581.PNC INCLUDES CLIENT HDR/TRL)'               
           DISPLAY 'CAT581: NON DETAL COUNT = ' W-NON-DETAIL-CNT                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT581: HIST TIF FND   = ' W-VTRNHSTY-FND                   
           DISPLAY 'CAT581: HIST TIF NOTFND= ' W-VTRNHSTY-NOT-FND               
           DISPLAY 'CAT581: ACTV AST FND   = ' W-VASTHSTY-FND                   
           DISPLAY 'CAT581: ACTV AST NOTFND= ' W-VASTHSTY-NOT-FND               
           DISPLAY ' '.                                                         
           DISPLAY 'CAT581: ACTV TIF FND   = ' W-VTRNFR-FND                     
           DISPLAY 'CAT581: ACTV TIF NOTFND= ' W-VTRNFR-NOT-FND                 
           DISPLAY 'CAT581: ACTV AST FND   = ' W-VASSET-FND                     
           DISPLAY 'CAT581: ACTV AST NOTFND= ' W-VASSET-NOT-FND                 
           DISPLAY ' '.                                                         
           DISPLAY 'CAT581: PROGRAM ENDED SUCCESSFULLY'.                        
                                                                                
       9100-EXIT.                                                               
           EXIT.                                                                
