000001* PDX    - CAT840   C0365423 05/11/15 10:04:27 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    CAT840.                                                   
      *---------------------------------------------------------------*         
      *    ACATS - REVERSAL REPORT                                              
      *                                                                         
      *    DATASETS:                                                            
      *          1) BZZZ.CAT840A.RVS      I/P - SORTED REVERSAL FILE            
      *          2) BXXX.CAT840.RVSPI     O/P - REVERSAL REPORT                 
      *---------------------------------------------------------------*         
      * 04/02/15 LRM - NEW ACATS PROGRAM  SSR 105872                  *         
      *---------------------------------------------------------------*         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE                 ASSIGN TO INFILE                       
                  FILE STATUS            IS INFILE-STAT.                        
                                                                                
           SELECT RVSPI-FILE             ASSIGN TO UT-S-RVSPI                   
                                         FILE STATUS IS RVSPI-STAT.             
                                                                                
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS                  
                  DEPENDING ON W-REC-LEN-IN                                     
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
           COPY ACATRVS REPLACING ==:ACATRVSE:== BY ==INFILE==.                 
                                                                                
       01  INFILE-LARGE-RECORD         PIC X(4000).                             
       COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCMHDR==.                  
                                                                                
       COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCMTRL==.                  
      /                                                                         
       FD  RVSPI-FILE                                                           
           RECORDING MODE IS F.                                                 
                                                                                
       01  RVSPI-REC.                                                           
           03 RVSPI-LINE            PIC  X(133).                                
           03 RVSPI-CLT             PIC S9(003) COMP-3.                         
           03 RVSPI-FIL             PIC  X(008).                                
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
                                                                                
       01  W-FIELDS.                                                            
           05  W-ROUTINE                 PIC  X(30) VALUE ' '.                  
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'ACATRCRF'.           
                                                                                
           COPY ACATRVS  REPLACING ==:ACATRVSE:== BY ==ACATRCRF==.              
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'W-PREV  '.           
       01  W-PREV-AREA.                                                         
           05  W-PREV-CLIENT             PIC X(0004) VALUE ZERO.                
           05  W-PREV-CLIENT-N REDEFINES W-PREV-CLIENT                          
                                         PIC 9(0004).                           
           05  W-PREV-DSTBN-SIDE         PIC X(0001) VALUE SPACES.              
           05  W-PREV-KEY-AT-STL-LOC     PIC X(0002) VALUE SPACES.              
                                                                                
       01  FILLER                        PIC X(008) VALUE 'W-WORK  '.           
       01  W-WORK-FIELDS.                                                       
           05  W-FIRST-TIME-SW           PIC  X(01) VALUE '0'.                  
               88 NOT-FIRST-TIME                    VALUE '1'.                  
           05  INFILE-STAT               PIC  X(02) VALUE '00'.                 
               88  INFILE-OKAY           VALUE '00' THRU '09', '97'.            
               88  INFILE-END-OF-FILE    VALUE '10'.                            
               88  INFILE-DUPE-REC       VALUE '22'.                            
               88  INFILE-NOTFND         VALUE '23'.                            
               88  INFILE-EMPTY          VALUE '35'.                            
           05  INFILE-DATE-SW            PIC  X(01) VALUE '0'.                  
               88 INFILE-DATE-FOUND                 VALUE '1'.                  
           05  END-OF-INFILE-SW          PIC  X(01) VALUE '0'.                  
               88 END-OF-INFILE                     VALUE '1'.                  
           05  CLIENT-DETAIL-PRINTED-SW  PIC  X(01) VALUE ' '.                  
               88 DETAIL-PRINTED                    VALUE 'P'.                  
               88 NO-DETAIL-PRINTED                 VALUE 'N'.                  
           05  RVSPI-STAT                PIC  X(02) VALUE '00'.                 
               88 RVSPI-OKAY                        VALUE '00'.                 
           05  W-REC-LEN-IN              PIC  9(005) COMP-3 VALUE 0.            
           05  W-INFILE-CNT              PIC  9(07) VALUE 0.                    
           05  W-DETAIL-CNT              PIC  9(07) VALUE 0.                    
           05  W-TOTAL-PAGE-CNT          PIC  9(07) VALUE 0.                    
           05  W-RVSPI-PAGE-CNT          PIC  9(07) VALUE 0.                    
           05  W-CLT-PAGE-CNT            PIC  9(06) VALUE 0.                    
           05  W-CLT-RVSPI-PAGE-CNT      PIC  9(06) VALUE 0.                    
           05  W-PAGE-CNT                PIC  9(06) VALUE 0.                    
           05  W-LINE-CNT                PIC  9(06) VALUE 60.                   
           05  W-RVSPI-CNT               PIC  9(07) VALUE 0.                    
           05  LD-PROC-DATE.                                                    
               10 LD-PROC-DATE-MM        PIC  X(02).                            
               10 LD-PROC-DATE-DD        PIC  X(02).                            
               10 LD-PROC-DATE-YY        PIC  X(02).                            
           05  W-PROC-DATE.                                                     
               10 W-PROC-DATE-CC         PIC  X(02).                            
               10 W-PROC-DATE-YY         PIC  X(02).                            
               10 W-PROC-DATE-MM         PIC  X(02).                            
               10 W-PROC-DATE-DD         PIC  X(02).                            
           05  W-PROC-DATE-N REDEFINES                                          
               W-PROC-DATE               PIC  9(008).                           
           05  W-SYS-DATE                PIC  9(006) VALUE 0.                   
           05  FILLER  REDEFINES                                                
               W-SYS-DATE.                                                      
               10  W-SYS-YY              PIC  X(002).                           
               10  W-SYS-MM              PIC  X(002).                           
               10  W-SYS-DD              PIC  X(002).                           
           05  W-SYS-TIME                PIC  9(008) VALUE 0.                   
           05  FILLER  REDEFINES                                                
               W-SYS-TIME.                                                      
               10  W-SYS-HH              PIC  X(002).                           
               10  W-SYS-MN              PIC  X(002).                           
               10  W-SYS-SS              PIC  X(002).                           
               10  W-SYS-MS              PIC  X(002).                           
           05  W-REPT-CLT                PIC  9(03) VALUE 0.                    
           05  W-REPT-LINE               PIC  X(133).                           
                                                                                
           05  W-COMMA-PTR               PIC  9(002) VALUE 0.           CAT788  
           05  W-QTY-PTR                 PIC  9(002) VALUE 0.           CAT788  
           05  W-INT-PTR                 PIC  9(002) VALUE 0.           CAT788  
           05  W-DEC-PTR                 PIC  9(002) VALUE 0.           CAT788  
           05  W-COMMA-FND-SW            PIC  X(001) VALUE ' '.         CAT788  
                                                                        CAT788  
           05  W-QTY-X.                                                 CAT788  
               07  W-QTY-BYTE            PIC X OCCURS 17 TIMES.         CAT788  
           05  W-QTY REDEFINES W-QTY-X   PIC 9(17).                     CAT788  
                                                                        CAT788  
           05  W-QTY-N                   PIC S9(13)V9(4).               CAT788  
           05  W-QTY-X-NEW REDEFINES W-QTY-N.                           CAT788  
               07  W-QTY-INT             PIC 9(13).                     CAT788  
               07  W-QTY-DEC             PIC 9(04).                     CAT788  
                                                                        CAT788  
           05  W-INT                     PIC 9(17).                     CAT788  
           05  W-INT-X REDEFINES W-INT.                                 CAT788  
               07  W-INT-BYTE            PIC X OCCURS 17 TIMES.         CAT788  
                                                                        CAT788  
           05  W-DEC                     PIC 9(04).                     CAT788  
           05  W-DEC-X REDEFINES W-DEC.                                 CAT788  
               07  W-DEC-BYTE            PIC X OCCURS  4 TIMES.         CAT788  
           05  W-TOTAL-QUANTITY         PIC S9(13)V9(4) COMP-3 VALUE 0.         
           05  W-TOTAL-AMOUNT           PIC S9(15)V9(2) COMP-3 VALUE 0.         
                                                                                
DJ0006 01  W-SIAC-HEADER.                                               CAT840  
DJ0006     05  FILLER                    PIC  X(006).                   CAT840  
DJ0006     05  W-SIAC-HEADER-DATE        PIC  X(008).                   CAT840  
DJ0006     05  FILLER                    PIC  X(040).                   CAT840  
DJ0006     05  W-SIAC-HEADER-CYCLE-X.                                   CAT840  
DJ0006         07  W-SIAC-HEADER-CYCLE-N PIC  9(002).                   CAT840  
DJ0006     05  FILLER                    PIC  X(033).                   CAT840  
DJ0006     05  FILLER                    PIC  X(044).                   CAT840  
                                                                                
       01  W-REPORT-REC.                                                        
           05  W-REPORT-LINE             PIC  X(133).                           
           05  W-REPORT-CLT              PIC S9(003) COMP-3.                    
           05  W-REPORT-FIL              PIC  X(008).                           
      /                                                                         
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
       01  CALL-MODULES.                                                        
           05  ABEND-PROGRAM             PIC  X(08) VALUE 'ILBOABN0'.           
           05  ZBPDATES-PROGRAM          PIC  X(08) VALUE 'ZBPDATES'.           
                                                                                
           COPY STUBCPY.                                                        
                                                                                
      ******************************************************************        
      * BPDATE COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
                                                                                
           COPY BPDATESC.                                                       
      /                                                                         
       01  W-HDR1-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE '1'.               
           05  FILLER                       PIC  X(08) VALUE                    
               'CAT840 -'.                                                      
           05  W-HDR1-CLT                   PIC  999   VALUE ZERO.              
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-HDR1-CLT-NAME              PIC  X(30) VALUE ' '.               
           05  FILLER                       PIC  X(04) VALUE ' '.               
           05  FILLER                       PIC  X(42) VALUE                    
               'ACATS REVERSAL OF SETTLEMENT SUMMARY'.                          
           05  FILLER                       PIC  X(12) VALUE ' '.               
           05  FILLER                       PIC  X(13) VALUE                    
               'PROCESS DATE '.                                                 
           05  W-HDR1-MM                    PIC  X(02) VALUE ' '.               
           05  W-HDR1-S1                    PIC  X(01) VALUE '/'.               
           05  W-HDR1-DD                    PIC  X(02) VALUE ' '.               
           05  W-HDR1-S2                    PIC  X(01) VALUE '/'.               
           05  W-HDR1-YY                    PIC  X(02) VALUE ' '.               
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(05) VALUE                    
               'PAGE '.                                                         
           05  W-HDR1-PAGE                  PIC  ZZZ9.                          
                                                                                
       01  W-HDR2-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(50) VALUE ' '.               
           05  W-HDR2-HEADING               PIC  X(42) VALUE                    
               'NON MUTUAL FUND ASSETS'.                                        
           05  FILLER                       PIC  X(16) VALUE ' '.               
           05  FILLER                       PIC  X(09) VALUE                    
               'RUN TIME '.                                                     
           05  W-HDR2-MM                    PIC  X(02) VALUE ' '.               
           05  W-HDR2-S1                    PIC  X(01) VALUE '/'.               
           05  W-HDR2-DD                    PIC  X(02) VALUE ' '.               
           05  W-HDR2-S2                    PIC  X(01) VALUE '/'.               
           05  W-HDR2-YY                    PIC  X(02) VALUE ' '.               
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-HDR2-HH                    PIC  X(02) VALUE ' '.               
           05  W-HDR2-CC                    PIC  X(01) VALUE ':'.               
           05  W-HDR2-MN                    PIC  X(02) VALUE ' '.               
           05  FILLER                       PIC  X(04) VALUE ' '.               
                                                                                
       01  W-HDR3-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE '0'.               
           05  FILLER                       PIC  X(49) VALUE                    
           'CONTROL         TRNF SEQ    CUSIP/        A/C'.                     
           05  FILLER                       PIC  X(53) VALUE                    
           ' STL  STATUS SETTLE   SECURITY                       '.             
           05  FILLER                       PIC  X(29) VALUE                    
           'CONTRA A/C         D/C CONTRA'.                                     
       01  W-HDR4-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE '0'.               
           05  FILLER                       PIC  X(49) VALUE                    
           'NUMBER          TYPE NUM    NUMBER       NUMBER  '.                 
           05  FILLER                       PIC  X(53) VALUE                    
           ' RSN         DATE     DESCRIPTION                    '.             
           05  FILLER                       PIC  X(29) VALUE                    
           '                             '.                                     
                                                                                
       01  W-HDR5-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE '0'.               
           05  FILLER                       PIC  X(49) VALUE ALL '-'.           
           05  W-HDR5-DSTBN                 PIC  X(10) VALUE                    
           ' OUTGOING '.                                                        
           05  FILLER                       PIC  X(72) VALUE ALL '-'.           
                                                                                
       01  W-HDR6-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE '0'.               
           05  FILLER                       PIC  X(39) VALUE SPACES.            
           05  FILLER                       PIC  X(12) VALUE ALL '-'.           
           05  FILLER                       PIC  X(01) VALUE SPACES.            
           05  W-HDR6-LOC                   PIC  X(04).                         
           05  FILLER                       PIC  X(12) VALUE ALL '-'.           
                                                                                
       01  W-DTL1-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE '0'.               
           05  W-DTL1-CONTROL-NBR           PIC  X(14) VALUE ' '.               
           05  FILLER                       PIC  X(02) VALUE ' '.               
           05  W-DTL1-TFR-TYPE              PIC  X(03) VALUE ' '.               
           05  FILLER                       PIC  X(02) VALUE ' '.               
           05  W-DTL1-ASSET-SEQ-NBR         PIC  9(06).                         
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-DTL1-ISIN                  PIC  X(12) VALUE ' '.               
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-DTL1-BR-ACCT               PIC  X(08) VALUE ' '.               
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-DTL1-STL-RSN               PIC  X(04) VALUE ' '.               
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-DTL1-STATUS                PIC  X(03) VALUE ' '.               
           05  FILLER                       PIC  X(03) VALUE ' '.               
           05  W-DTL1-STL-DT                PIC  X(08) VALUE ' '.               
           05  FILLER                       PIC  X(02) VALUE ' '.               
           05  W-DTL1-ASSET-DESC            PIC  X(30) VALUE ' '.               
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-DTL1-CONTRA-ACCT           PIC  X(20) VALUE ' '.               
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-DTL1-DB-CR                 PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-DTL1-CONTRA-BRKR           PIC  X(04) VALUE ' '.               
                                                                                
       01  W-DTL2-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(09) VALUE                    
           'QUANTITY:'.                                                         
           05  W-DTL2-QUANTITY              PIC  Z(13).9(4)-.                   
           05  FILLER                       PIC  X(08) VALUE                    
           ' AMOUNT:'.                                                          
           05  W-DTL2-AMOUNT                PIC  Z(15).99-.                     
           05  FILLER                       PIC  X(17) VALUE ' '.               
           05  W-DTL2-ASSET-DESC            PIC  X(50) VALUE ' '.               
                                                                                
       01  W-DTL3-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE '0'.               
           05  FILLER                       PIC  X(09) VALUE                    
           'TOTAL:'.                                                            
           05  W-DTL3-QUANTITY              PIC  Z(13).9(4)-.                   
           05  FILLER                       PIC  X(08) VALUE ' '.               
           05  W-DTL3-AMOUNT                PIC  Z(15).99-.                     
                                                                                
       01  W-DTLX-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE '0'.               
           05  FILLER                       PIC  X(02) VALUE ' '.               
           05  W-DTLX-LIT                   PIC  X(40) VALUE                    
           'NO REVERSAL RECORDS TODAY'.                                         
           05  FILLER                       PIC  X(90) VALUE ' '.               
                                                                                
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.           
      /                                                                         
      *****************************************************************         
      *    LINKAGE SECTION                                            *         
      *****************************************************************         
       LINKAGE SECTION.                                                         
       01  L-JCL-PARMS.                                                         
           05  PARMLENGTH                PIC S9(004) COMP SYNC.                 
           05  L-BYP-FILECHK-SW          PIC  X(001).                           
               88  L-BYP-FILECHK                     VALUE '1'.                 
           05  L-RUNTYPE                 PIC  X(005).                           
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
       0000-MAIN SECTION.                                                       
                                                                                
           DISPLAY 'CAT840 - ACATS REVERSAL REPORT'.                            
           DISPLAY '         INPUT IS FROM CAT840A'.                            
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT          THRU 1000-EXIT.                           
                                                                                
           PERFORM 4000-CREATE-REPORT THRU 4000-EXIT                            
               UNTIL END-OF-INFILE.                                             
                                                                                
******* AT END OF FILE, CREATE LAST TOTAL IF NEEDED:                            
           IF W-PREV-KEY-AT-STL-LOC > SPACES                                    
              MOVE W-TOTAL-QUANTITY TO W-DTL3-QUANTITY                          
              MOVE W-TOTAL-AMOUNT   TO W-DTL3-AMOUNT                            
              MOVE W-DTL3-REC               TO W-REPT-LINE                      
              PERFORM 7700-WRITE-LINE THRU 7700-EXIT                            
           END-IF.                                                              
                                                                                
******* AT END OF FILE, CREATE LAST NO DETAILS TO REPORT PAGE IF NEEDED         
           IF NO-DETAIL-PRINTED                                                 
                 PERFORM 7100-WRITE-NO-RVSPI THRU 7100-EXIT                     
                                                                                
           PERFORM 9000-CLOSE-ROUTINE THRU 9000-EXIT.                           
                                                                                
       0000-FINI.                                                               
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT SECTION.                                                       
                                                                                
           DISPLAY 'CAT840: L-RUNTYPE        = '                                
                            L-RUNTYPE ' MFUND FOR MUTUAL FUND RUN'              
           DISPLAY 'CAT840: L-BYP-FILECHK-SW = '                                
                            L-BYP-FILECHK-SW.                                   
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT840: FILE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT840: FILE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
                                                                                
           IF  L-RUNTYPE = 'MFUND'                                              
              MOVE  '  MUTUAL FUND ASSETS' TO W-HDR2-HEADING                    
           END-IF.                                                              
                                                                                
           MOVE 'CAT840'                 TO BPDATES-CALLING-PGM.                
           SET  LNKDATZ-REQUEST          TO TRUE.                               
           CALL ZBPDATES-PROGRAM USING BPDATES-PARAMETERS.                      
           MOVE BPD-PROC-DATE            TO W-PROC-DATE.                        
           MOVE BPD-PROC-DATE(3:2)       TO LD-PROC-DATE-YY                     
                                            W-HDR2-YY                           
           MOVE BPD-PROC-DATE(5:2)       TO LD-PROC-DATE-MM                     
                                            W-HDR2-MM                           
           MOVE BPD-PROC-DATE(7:2)       TO LD-PROC-DATE-DD                     
                                            W-HDR2-DD                           
           DISPLAY 'CAT840: PROC-DATE= ' BPD-PROC-DATE                          
                      '  LD-PROC-DATE= ' LD-PROC-DATE.                          
                                                                                
           ACCEPT W-SYS-DATE             FROM DATE.                             
           ACCEPT W-SYS-TIME             FROM TIME.                             
           MOVE W-SYS-HH TO W-HDR2-HH                                           
           MOVE W-SYS-MN TO W-HDR2-MN                                           
                                                                                
           OPEN INPUT  INFILE.                                                  
           DISPLAY 'CAT840: INFILE  OPENED FOR INPUT  '                         
                       ' FILE STATUS = ' INFILE-STAT.                           
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               MOVE 3002      TO  ABEND-CODE                                    
               DISPLAY ' '                                                      
               DISPLAY 'CAT840: U3002 - DD INFILE OPEN ERR, '                   
                       ' FILE STATUS = ' INFILE-STAT                            
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           PERFORM 3000-READ-INFILE THRU 3000-EXIT.                             
                                                                                
           IF  END-OF-INFILE                                                    
               DISPLAY 'CAT840: INFILE END OF FILE REACHED'                     
               IF L-BYP-FILECHK                                                 
                      DISPLAY 'CAT840: BYPASSING FILE CHECK PER JCLPARM'        
                      GO TO 1000-CONT                                           
               ELSE                                                             
                      DISPLAY 'CAT840: U3003 - ABENDING ON EMPTY FILE'          
                      MOVE +3003      TO ABEND-CODE                             
                      CALL ABEND-PROGRAM USING ABEND-CODE                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF INFILE-RECORD (1 : 1) = '1'                                       
               SET INFILE-DATE-FOUND TO TRUE                                    
               MOVE INFILE-RECORD TO W-SIAC-HEADER                      CAT840  
               DISPLAY 'CAT840: INFILE PROC-DATE = '                            
                             W-SIAC-HEADER-DATE                                 
                        ' CYCLE=' W-SIAC-HEADER-CYCLE-X                 CAT840  
               MOVE W-SIAC-HEADER-DATE(5:2) TO W-HDR1-MM                        
               MOVE W-SIAC-HEADER-DATE(3:2) TO W-HDR1-YY                        
               MOVE W-SIAC-HEADER-DATE(7:2) TO W-HDR1-DD                        
           ELSE                                                                 
               DISPLAY 'CAT840: INFILE  DATE RECORD MISSING'                    
               MOVE +3004      TO ABEND-CODE                                    
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           PERFORM 3000-READ-INFILE THRU 3000-EXIT.                             
       1000-CONT.                                                               
                                                                                
           OPEN OUTPUT RVSPI-FILE.                                              
           DISPLAY 'CAT840: RVSPI    OPENED FOR OUTPUT '                        
                       ' FILE STATUS = ' RVSPI-STAT.                            
                                                                                
           IF  RVSPI-OKAY                                                       
               CONTINUE                                                         
           ELSE                                                                 
               MOVE 3003                  TO  ABEND-CODE                        
               DISPLAY ' '                                                      
               DISPLAY 'CAT840: U3003 - DD RVSPI  OPEN ERR, '                   
                       ' FILE STATUS = ' RVSPI-STAT                             
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT. EXIT.                                                         
      /                                                                         
       3000-READ-INFILE  SECTION.                                               
                                                                                
           READ INFILE INTO ACATRCRF-RECORD                                     
                AT END                                                          
                   MOVE '1'              TO END-OF-INFILE-SW                    
                   DISPLAY 'CAT840: INFILE END OF FILE REACHED'                 
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           IF  INFILE-STAT NOT = '00'                                           
               DISPLAY 'CAT840: READ INFILE STATUS = ' INFILE-STAT              
                       '.  INFILE-CNT = ' W-INFILE-CNT                          
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT840: U3009 - DD INFILE READ ERR, '               
                           ' FILE STATUS = ' INFILE-STAT                        
                   MOVE 3009      TO  ABEND-CODE                                
                   CALL ABEND-PROGRAM USING ABEND-CODE                          
           END-IF.                                                              
                                                                                
           ADD 1 TO W-INFILE-CNT.                                               
                                                                                
           IF  INFILE-TRL-RECORD                                                
               DISPLAY 'CAT840: TRAILER REC-CNT = '                             
                                              INFILE-TRL-REC-CNT                
               GO TO 3000-READ-INFILE                                           
           END-IF.                                                              
                                                                                
       3000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4000-CREATE-REPORT SECTION.                                              
           IF INFILE-CLIENT-HDR                                                 
              IF W-HDR1-CLT NOT = ZEROS                                         
                 IF W-PREV-KEY-AT-STL-LOC > SPACES                              
                    MOVE W-TOTAL-QUANTITY TO W-DTL3-QUANTITY                    
                    MOVE W-TOTAL-AMOUNT   TO W-DTL3-AMOUNT                      
                    MOVE W-DTL3-REC               TO W-REPT-LINE                
                    PERFORM 7700-WRITE-LINE THRU 7700-EXIT                      
                    ADD 2                         TO W-LINE-CNT                 
                    MOVE 0 TO W-TOTAL-QUANTITY                                  
                              W-TOTAL-AMOUNT                                    
                 END-IF                                                         
              END-IF                                                            
              IF NO-DETAIL-PRINTED                                              
                 PERFORM 7100-WRITE-NO-RVSPI THRU 7100-EXIT                     
              END-IF                                                            
              MOVE 60 TO W-LINE-CNT                                             
              MOVE 0 TO W-PAGE-CNT                                              
              MOVE INFILE-HDR-CLIENT-NBR(2:3) TO W-HDR1-CLT                     
              MOVE INFILE-HDR-CLIENT-NBR TO W-PREV-CLIENT                       
              MOVE INFILE-BROKER-NAME TO W-HDR1-CLT-NAME                        
              MOVE SPACES TO W-PREV-KEY-AT-STL-LOC                              
                             W-PREV-DSTBN-SIDE                                  
              SET NO-DETAIL-PRINTED TO TRUE                                     
           ELSE                                                                 
              IF INFILE-DSTBN-SIDE NOT = W-PREV-DSTBN-SIDE                      
                 IF W-PREV-KEY-AT-STL-LOC > SPACES                              
                    MOVE W-TOTAL-QUANTITY TO W-DTL3-QUANTITY                    
                    MOVE W-TOTAL-AMOUNT   TO W-DTL3-AMOUNT                      
                    MOVE W-DTL3-REC               TO W-REPT-LINE                
                    PERFORM 7700-WRITE-LINE THRU 7700-EXIT                      
                    ADD 2                         TO W-LINE-CNT                 
                    MOVE 0 TO W-TOTAL-QUANTITY                                  
                              W-TOTAL-AMOUNT                                    
                    MOVE INFILE-DSTBN-SIDE TO W-PREV-DSTBN-SIDE                 
                    PERFORM 7820-WRITE-DSTBN-SIDE-HDR                           
                    MOVE INFILE-KEY-AT-STL-LOC TO W-PREV-KEY-AT-STL-LOC         
                    PERFORM 7830-WRITE-SETTLE-LOC-HDR                           
                 END-IF                                                         
                 MOVE INFILE-DSTBN-SIDE TO W-PREV-DSTBN-SIDE                    
                 MOVE SPACES TO W-PREV-KEY-AT-STL-LOC                           
              END-IF                                                            
              IF INFILE-KEY-AT-STL-LOC NOT =  W-PREV-KEY-AT-STL-LOC             
                 IF W-PREV-KEY-AT-STL-LOC > SPACES                              
                    MOVE W-TOTAL-QUANTITY TO W-DTL3-QUANTITY                    
                    MOVE W-TOTAL-AMOUNT   TO W-DTL3-AMOUNT                      
                    MOVE W-DTL3-REC               TO W-REPT-LINE                
                    PERFORM 7700-WRITE-LINE THRU 7700-EXIT                      
                    ADD 2                         TO W-LINE-CNT                 
                    MOVE 0 TO W-TOTAL-QUANTITY                                  
                              W-TOTAL-AMOUNT                                    
                    MOVE INFILE-KEY-AT-STL-LOC                                  
                                            TO W-PREV-KEY-AT-STL-LOC            
                    PERFORM 7830-WRITE-SETTLE-LOC-HDR                           
                 END-IF                                                         
                 MOVE INFILE-KEY-AT-STL-LOC TO W-PREV-KEY-AT-STL-LOC            
              END-IF                                                            
              PERFORM 7000-WRITE-REPORT THRU 7000-EXIT                          
           END-IF.                                                              
                                                                                
           PERFORM 3000-READ-INFILE THRU 3000-EXIT.                             
                                                                                
       4000-EXIT.                                                               
           EXIT.                                                                
      *--------------------------------------------------------------*  CAT788  
      *   ALPHANUMERICALLY DEFINED NUMBER WITH COMMA INSTEAD OF      *  CAT788  
      *   DECIMAL PERIOD IS REFORMATED TO DECIMAL NUMERIC FIELD.     *  CAT788  
      *                                                              *  CAT788  
      *   EXAMPLE:                                                   *  CAT788  
      *      FROM = '955,1234         ' (ALPHANUMERIC)               *  CAT788  
      *      TO   =  000000000955.1234  (NUMERIC)                    *  CAT788  
      *--------------------------------------------------------------*  CAT788  
       4300-REFORMAT-TO-DECIMAL SECTION.                                CAT788  
           MOVE 0          TO W-INT                                     CAT788  
                              W-DEC                                     CAT788  
                              W-QTY-N.                                  CAT788  
           MOVE ' '        TO W-COMMA-FND-SW.                           CAT788  
                                                                        CAT788  
           PERFORM VARYING W-COMMA-PTR FROM 1 BY 1                      CAT788  
                     UNTIL W-COMMA-PTR > 17 OR W-COMMA-FND-SW = 'Y'     CAT788  
                        IF W-QTY-BYTE(W-COMMA-PTR) = ','                CAT788  
                           MOVE 'Y'      TO W-COMMA-FND-SW              CAT788  
                        END-IF                                          CAT788  
           END-PERFORM.                                                 CAT788  
                                                                        CAT788  
           IF  W-COMMA-FND-SW = 'Y'                                     CAT788  
               MOVE 17                   TO W-INT-PTR                   CAT788  
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT788  
               SUBTRACT 2     FROM W-QTY-PTR                            CAT788  
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY -1           CAT788  
                       UNTIL W-QTY-PTR = 0                              CAT788  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT788  
                                         TO W-INT-BYTE(W-INT-PTR)       CAT788  
                       SUBTRACT 1 FROM W-INT-PTR                        CAT788  
               END-PERFORM                                              CAT788  
               MOVE 1           TO W-DEC-PTR                            CAT788  
               MOVE W-COMMA-PTR TO W-QTY-PTR                            CAT788  
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY 1            CAT788  
                       UNTIL (W-DEC-PTR > 4 OR W-QTY-PTR > 17)          CAT788  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       CAT788  
                                         TO W-DEC-BYTE(W-DEC-PTR)       CAT788  
                       ADD 1        TO W-DEC-PTR                        CAT788  
               END-PERFORM                                              CAT788  
           ELSE                                                         CAT788  
               MOVE W-QTY           TO W-INT                            CAT788  
           END-IF.                                                      CAT788  
                                                                        CAT788  
           MOVE W-INT               TO W-QTY-INT.                       CAT788  
           MOVE W-DEC               TO W-QTY-DEC.                       CAT788  
                                                                        CAT788  
           IF W-PREV-KEY-AT-STL-LOC = '40'                                      
               MOVE ZEROS TO W-QTY-N                                    CAT788  
           ELSE                                                                 
           IF W-QTY-N  NOT NUMERIC                                      CAT788  
               DISPLAY 'CAT840: *WARNING* WIPED GARBAGE QTY/PRICE FOR ' CAT788  
                          ' REC# ' W-INFILE-CNT                         CAT788  
                           ' CLT=' W-PREV-CLIENT                        CAT788  
                          ' CNTL=' INFILE-AT-ACAT-CTL-NBR               CAT788  
               DISPLAY '     WAS=' W-QTY-X                                      
                           ' GOT=' W-QTY-X-NEW                                  
               MOVE ZEROS TO W-QTY-N                                    CAT788  
           END-IF.                                                      CAT788  
       4300-EXIT. EXIT.                                                         
                                                                                
      /                                                                         
       7000-WRITE-REPORT SECTION.                                               
           MOVE '7000-WRITE-REPORT             ' TO W-ROUTINE.                  
                                                                                
           MOVE INFILE-AT-ACAT-CTL-NBR   TO W-DTL1-CONTROL-NBR                  
           MOVE INFILE-AT-TFR-TYPE       TO W-DTL1-TFR-TYPE                     
           MOVE INFILE-KEY-ASSET-SEQ-NBR TO W-DTL1-ASSET-SEQ-NBR                
           IF INFILE-AT-SEC-CNTRY-CD NOT = 'US' AND '  '                        
              MOVE INFILE-AT-SEC-CNTRY-CD TO W-DTL1-ISIN(1:2)                   
              MOVE INFILE-AT-SEC-ID       TO W-DTL1-ISIN(3:9)                   
              MOVE INFILE-AT-SEC-CHKDGT   TO W-DTL1-ISIN(12:1)                  
           ELSE                                                                 
              MOVE INFILE-AT-SEC-ID TO W-DTL1-ISIN                              
           END-IF.                                                              
           IF INFILE-RECEIVER                                                   
              MOVE INFILE-RCV-ACCT-NBR TO W-DTL1-BR-ACCT                        
              MOVE INFILE-DEL-ACCT-NBR TO W-DTL1-CONTRA-ACCT                    
              MOVE INFILE-AT-DEL-NBR    TO W-DTL1-CONTRA-BRKR                   
           ELSE                                                                 
              MOVE INFILE-DEL-ACCT-NBR TO W-DTL1-BR-ACCT                        
              MOVE INFILE-RCV-ACCT-NBR TO W-DTL1-CONTRA-ACCT                    
              MOVE INFILE-AT-RCV-NBR    TO W-DTL1-CONTRA-BRKR                   
           END-IF.                                                              
           MOVE INFILE-AT-STL-LOC-RSN-CD TO W-DTL1-STL-RSN.                     
           IF INFILE-SETTLE-PREP                                                
              MOVE 'STP' TO  W-DTL1-STATUS                                      
           ELSE                                                                 
           IF INFILE-SETTLE-CLOSE                                               
              MOVE 'STC' TO  W-DTL1-STATUS                                      
           ELSE                                                                 
              MOVE 'OTH' TO  W-DTL1-STATUS                                      
           END-IF.                                                              
           MOVE INFILE-STL-DT TO  W-DTL1-STL-DT                                 
           MOVE INFILE-AT-ASSET-DESC(1:30) TO W-DTL1-ASSET-DESC                 
           IF W-PREV-KEY-AT-STL-LOC = '40'                                      
              IF INFILE-AT-STL-LOC-RSN-CD = 'CRED'                              
                 MOVE 'C' TO  W-DTL1-DB-CR                                      
              ELSE                                                              
                 MOVE 'D' TO  W-DTL1-DB-CR                                      
           ELSE                                                                 
              IF INFILE-AT-LONG-POS                                             
                 MOVE 'D' TO  W-DTL1-DB-CR                                      
              ELSE                                                              
                 MOVE 'C' TO  W-DTL1-DB-CR                                      
           END-IF.                                                              
           MOVE W-DTL1-REC               TO W-REPT-LINE.                        
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT.                              
           ADD 2                         TO W-LINE-CNT.                         
                                                                                
           MOVE INFILE-AT-ASSET-QTY   TO W-QTY-X.                       CAT788  
           PERFORM 4300-REFORMAT-TO-DECIMAL THRU 4300-EXIT.             CAT788  
           IF INFILE-AT-LONG-POS                                                
              CONTINUE                                                          
           ELSE                                                                 
              COMPUTE W-QTY-N = W-QTY-N * -1                                    
           END-IF.                                                              
           MOVE W-QTY-N TO W-DTL2-QUANTITY.                             CAT788  
           ADD W-QTY-N TO  W-TOTAL-QUANTITY.                                    
                                                                                
           MOVE INFILE-AT-ASSET-AMT   TO W-QTY-X.                       CAT788  
           PERFORM 4300-REFORMAT-TO-DECIMAL THRU 4300-EXIT.             CAT788  
           IF W-PREV-KEY-AT-STL-LOC = '40'                                      
              IF INFILE-AT-STL-LOC-RSN-CD = 'CRED'                              
                 COMPUTE W-QTY-N = W-QTY-N * -1                                 
              END-IF                                                            
           ELSE                                                                 
              IF INFILE-AT-LONG-POS                                             
                 CONTINUE                                                       
              ELSE                                                              
                 COMPUTE W-QTY-N = W-QTY-N * -1                                 
           END-IF.                                                              
           MOVE W-QTY-N TO W-DTL2-AMOUNT.                               CAT788  
           ADD W-QTY-N TO  W-TOTAL-AMOUNT.                                      
                                                                                
           MOVE INFILE-AT-ASSET-DESC(31:50) TO  W-DTL2-ASSET-DESC               
           MOVE W-DTL2-REC               TO W-REPT-LINE.                        
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT.                              
           ADD 1                         TO W-LINE-CNT.                         
           SET DETAIL-PRINTED TO TRUE.                                          
                                                                                
       7000-EXIT. EXIT.                                                         
      /                                                                         
       7100-WRITE-NO-RVSPI SECTION.                                             
           MOVE '7100-WRITE-NO-RVSPI             ' TO W-ROUTINE.                
                                                                                
           MOVE W-HDR1-REC               TO W-REPORT-LINE.                      
           MOVE W-PREV-CLIENT-N          TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE RVSPI-REC FROM W-REPORT-REC.                                   
                                                                                
           MOVE W-HDR2-REC               TO W-REPORT-LINE.                      
           MOVE W-PREV-CLIENT-N          TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE RVSPI-REC FROM W-REPORT-REC.                                   
                                                                                
           MOVE W-DTLX-REC               TO W-REPORT-LINE.                      
           MOVE W-PREV-CLIENT-N          TO W-REPORT-CLT.                       
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE RVSPI-REC FROM W-REPORT-REC.                                   
           ADD  1                        TO W-TOTAL-PAGE-CNT.                   
                                                                                
       7100-EXIT. EXIT.                                                         
      /                                                                         
       7700-WRITE-LINE SECTION.                                                 
           MOVE '7700-WRITE-LINE               ' TO W-ROUTINE.                  
                                                                                
           IF   W-LINE-CNT > 55                                                 
                PERFORM 7800-WRITE-HDR THRU 7800-EXIT.                          
                                                                                
           MOVE W-REPT-LINE              TO W-REPORT-LINE.                      
           MOVE W-PREV-CLIENT-N          TO W-REPORT-CLT.                       
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
                                                                                
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
                                                                                
       7700-EXIT. EXIT.                                                         
      /                                                                         
       7800-WRITE-HDR    SECTION.                                               
           MOVE '7800-WRITE-HDR                ' TO W-ROUTINE.                  
                                                                                
           ADD  1                        TO W-PAGE-CNT.                         
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                        
           ADD  1                        TO W-TOTAL-PAGE-CNT                    
           ADD  1                        TO W-CLT-PAGE-CNT                      
                                                                                
           MOVE W-HDR1-REC               TO W-REPORT-LINE.                      
           MOVE W-PREV-CLIENT-N          TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
                                                                                
           MOVE W-HDR2-REC               TO W-REPORT-LINE.                      
           MOVE W-PREV-CLIENT-N          TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
                                                                                
           MOVE W-HDR3-REC               TO W-REPORT-LINE.                      
           MOVE W-PREV-CLIENT-N          TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
                                                                                
           MOVE W-HDR4-REC               TO W-REPORT-LINE.                      
           MOVE W-PREV-CLIENT-N          TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
                                                                                
           IF W-PREV-DSTBN-SIDE = 'D'                                           
              MOVE ' OUTGOING ' TO W-HDR5-DSTBN                                 
           ELSE                                                                 
              MOVE ' INGOING  ' TO W-HDR5-DSTBN                                 
           END-IF.                                                              
           MOVE W-HDR5-REC               TO W-REPORT-LINE.                      
           MOVE W-PREV-CLIENT-N          TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
           MOVE 8                        TO W-LINE-CNT.                         
           IF W-PREV-KEY-AT-STL-LOC > SPACES                                    
              PERFORM 7830-WRITE-SETTLE-LOC-HDR                                 
           END-IF.                                                              
                                                                                
       7800-EXIT. EXIT.                                                         
                                                                                
       7810-WRITE-OUTPUT SECTION.                                               
           WRITE RVSPI-REC FROM W-REPORT-REC.                                   
                                                                                
       7810-EXIT. EXIT.                                                         
                                                                                
       7820-WRITE-DSTBN-SIDE-HDR SECTION.                                       
           MOVE INFILE-DSTBN-SIDE TO W-PREV-DSTBN-SIDE.                         
           IF W-PREV-DSTBN-SIDE = 'D'                                           
              MOVE ' OUTGOING ' TO W-HDR5-DSTBN                                 
           ELSE                                                                 
              MOVE ' INGOING  ' TO W-HDR5-DSTBN                                 
           END-IF.                                                              
           MOVE W-HDR5-REC               TO W-REPORT-LINE.                      
           MOVE W-PREV-CLIENT-N          TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
       7830-WRITE-SETTLE-LOC-HDR SECTION.                                       
           IF W-PREV-KEY-AT-STL-LOC = '05'                                      
              MOVE 'CNS' TO  W-HDR6-LOC                                         
           ELSE                                                                 
           IF W-PREV-KEY-AT-STL-LOC = '10'                                      
              MOVE 'FUND' TO W-HDR6-LOC                                         
           ELSE                                                                 
           IF W-PREV-KEY-AT-STL-LOC = '25'                                      
              MOVE 'DTC' TO  W-HDR6-LOC                                         
           ELSE                                                                 
           IF W-PREV-KEY-AT-STL-LOC = '35'                                      
              MOVE 'OPT' TO  W-HDR6-LOC                                         
           ELSE                                                                 
           IF W-PREV-KEY-AT-STL-LOC = '40'                                      
              MOVE 'CASH' TO  W-HDR6-LOC                                        
           ELSE                                                                 
           IF W-PREV-KEY-AT-STL-LOC = '50'                                      
              MOVE 'R&D' TO  W-HDR6-LOC                                         
           ELSE                                                                 
              MOVE W-PREV-KEY-AT-STL-LOC TO W-HDR6-LOC                          
           END-IF.                                                              
           MOVE W-HDR6-REC               TO W-REPORT-LINE.                      
           MOVE W-PREV-CLIENT-N          TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
           ADD 2                         TO W-LINE-CNT.                         
      /                                                                         
       9000-CLOSE-ROUTINE SECTION.                                              
                                                                                
           CLOSE INFILE.                                                        
           DISPLAY 'CAT840: INFILE  CLOSED. STATUS = '                          
                                               INFILE-STAT.                     
                                                                                
           CLOSE RVSPI-FILE.                                                    
           DISPLAY 'CAT840: RVSPI    CLOSED. STATUS = '                         
                                               RVSPI-STAT.                      
           DISPLAY ' '.                                                         
           DISPLAY 'CAT840: INFILE CNT = ' W-INFILE-CNT.                        
           DISPLAY 'CAT840: TOTAL-PAGE = ' W-TOTAL-PAGE-CNT.                    
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT840: PROGRAM ENDED SUCCESSFULLY'.                        
                                                                                
       9000-EXIT.                                                               
           EXIT.                                                                
