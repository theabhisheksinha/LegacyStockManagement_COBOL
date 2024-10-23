000001* PDX    - CAT765CV C0291396 03/10/10 09:55:47 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT765CV.                                                   
      *****************************************************************         
      * CAT765CV - NON-STANDARD ACAT TRANSACTION REPORT.              *         
      *                                                               *         
      * PRINT TRANSACTION REPORT FOR ALL CLIENT 10 FRV, RCL ORIG DLVR *         
      * TRANSFERS SAME AS BZZZ.SIAC0710.ACAT.TRN.RPT                  *         
      * FOR ACCOUNTS WHICH WERE MARKED AS BEING TRANSFERRED TO 210.   *         
      * SORTED BY CLIENT,TFR,ACCT,ASSET                               *         
      *                                                               *         
      * IF NO TI RECORD FOR AN ASSET, READ THE DATABASE.              *         
      * THE DATABASE MUST CONTAIN A TI RECORD, OR ELSE.               *         
      *                                                               *         
      * INPUT  -                                                      *         
      *        - NSCC ACATS TRANSACTION FILE    - GDG                 *         
      *        - ACAT DB2 ACTIVE TRANSFER TABLE - DB2                 *         
      *        - B1 FILE FOR BROKER SELECTION   - VSAM                *         
      *                                                               *         
      * OUTPUT -                                                      *         
      *        - REPORT                        - GDG                  *         
      *                                                               *         
      *****************************************************************         
      * 03/08/10 LRM    SSR#69400 PENSON ACCOUNT FLIP CLIENT 10/210   *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-STAT.                 
                                                                                
           SELECT OUTFILE          ASSIGN       TO OUTFILE                      
                                   FILE STATUS  IS OUTFILE-STAT.                
                                                                                
           SELECT REPT-FILE        ASSIGN       TO OREPORT                      
                                   FILE STATUS  IS REPT-STAT.                   
                                                                                
           SELECT SORT-FILE        ASSIGN       TO UT-S-SORTWK01.               
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 3268 CHARACTERS                  
              DEPENDING ON W-REC-LEN-IN                                         
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:== BY ==INFILE==.                
                                                                                
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCMHDR==.              
                                                                                
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCMTRL==.              
                                                                                
       FD  OUTFILE                                                              
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
           COPY CAT765RE REPLACING ==:CAT765RE:== BY ==OUTFILE==.               
                                                                                
       SD  SORT-FILE.                                                           
                                                                                
           COPY CAT765RE REPLACING ==:CAT765RE:== BY ==SORT==.                  
                                                                                
       FD  REPT-FILE                                                            
           RECORDING MODE IS F.                                                 
                                                                                
       01  REPT-REC.                                                            
           03 REPT-LINE             PIC  X(133).                                
           03 REPT-CLT              PIC S9(003) COMP-3.                         
           03 REPT-FIL              PIC  X(008).                                
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT765'.            
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.                 
               88 NOT-FIRST-TIME                     VALUE '1'.                 
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.                 
               88 END-OF-INFILE                      VALUE '1'.                 
           05  END-OF-SORT-SW            PIC  X(001) VALUE '0'.                 
               88 END-OF-SORT                        VALUE '1'.                 
           05  INFILE-STAT               PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING VALUE '35'.                              
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.                 
               88 INFILE-DATE-FOUND                  VALUE 'Y'.                 
           05  OUTFILE-STAT              PIC  X(002).                           
               88 OUTFILE-OKAY           VALUE '00' THRU '09', '97'.            
               88 OUTFILE-END-OF-FILE    VALUE '10'.                            
               88 OUTFILE-EMPTY-MISSING VALUE '35'.                             
           05  REPT-STAT                 PIC  X(002).                           
               88 REPT-FILE-OKAY         VALUE '00' THRU '09', '97'.            
               88 REPT-FILE-END-OF-FILE  VALUE '10'.                            
               88 REPT-FILE-EMPTY-MISSING VALUE '35'.                           
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.                 
               88 HDR-FOUND                          VALUE 'H'.                 
               88 TRL-FOUND                          VALUE 'T'.                 
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.                 
               88 BRK-FOUND                          VALUE 'Y'.                 
           05  W-SUB1                    PIC  9(003) VALUE 0.                   
           05  W-SUB2                    PIC  9(003) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.          
           05  W-INFILE-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'OTPUTCNT'.          
           05  W-OUTFILE-CNT             PIC  9(011) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'OTREPCNT'.          
           05  W-OREPORT-CNT             PIC  9(011) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.          
           05  W-DETAIL-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.          
           05  W-REC-LEN-IN              PIC  9(005) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.          
           05  W-REC-LEN-OUT             PIC  9(005) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'RECLENSR'.          
           05  W-REC-LEN-SRT             PIC  9(005) COMP-3 VALUE 0.            
           05  W-VTRNFR-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-TI-CNT                  PIC  9(011) COMP-3 VALUE 0.            
           05  W-AT-CNT                  PIC  9(011) COMP-3 VALUE 0.            
           05  W-ATR-CNT                 PIC  9(011) COMP-3 VALUE 0.            
           05  W-ATO-CNT                 PIC  9(011) COMP-3 VALUE 0.            
           05  W-ATF-CNT                 PIC  9(011) COMP-3 VALUE 0.            
           05  W-CRD-TI-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-FRV-TI-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-FUL-TI-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-PTD-TI-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-PTR-TI-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-RCL-TI-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-RCR-TI-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-MFC-TI-CNT              PIC  9(011) COMP-3 VALUE 0.            
DJ0002     05  W-PTF-TI-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-CRD-AT-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-FRV-AT-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-FUL-AT-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-PTD-AT-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-PTR-AT-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-RCL-AT-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-RCR-AT-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-MFC-AT-CNT              PIC  9(011) COMP-3 VALUE 0.            
DJ0002     05  W-PTF-AT-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  W-RELEASE-CNT             PIC  9(011) COMP-3 VALUE 0.            
           05  W-RETURN-CNT              PIC  9(011) COMP-3 VALUE 0.            
           05  LD-PROC-DATE.                                                    
               10 LD-PROC-DATE-MM        PIC  X(002).                           
               10 LD-PROC-DATE-DD        PIC  X(002).                           
               10 LD-PROC-DATE-YY        PIC  X(002).                           
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
           05  W-PAGE-CNT                PIC  9(006) COMP-3 VALUE 0.            
           05  W-LINE-CNT                PIC  9(002) COMP-3 VALUE 60.           
           05  W-REPT-CLT                PIC  X(004) VALUE '0000'.              
           05  W-REPT-CYCLE              PIC  X(002) VALUE '00'.                
           05  W-REPT-SIDE               PIC  X(001) VALUE ' '.                 
           05  W-REPT-ACAT-CTL-NBR       PIC  X(014) VALUE ' '.                 
           05  W-SAVE-TI-TRAN-TYPE       PIC  X(001) VALUE ' '.                 
           05  W-SAVE-DATABASE-FROM      PIC  X(001) VALUE ' '.                 
           05  W-SAVE-AT-STL-LOC         PIC  X(002) VALUE ' '.                 
           05  W-SAVE-AT-STL-LOC-RSN-CD  PIC  X(004) VALUE ' '.                 
           05  W-SAVE-KEY                PIC  X(030) VALUE ' '.                 
           05  W-VPRTCPPF-BROKER         PIC  X(004) VALUE ' '.                 
           05  W-CLT-NAME                PIC  X(030) VALUE ' '.                 
                                                                        03240001
           05  W-COMMA-PTR               PIC  9(002) VALUE 0.           03120001
           05  W-QTY-PTR                 PIC  9(002) VALUE 0.           03130001
           05  W-INT-PTR                 PIC  9(002) VALUE 0.           03140001
           05  W-DEC-PTR                 PIC  9(002) VALUE 0.           03150001
           05  W-COMMA-FND-SW            PIC  X(001) VALUE ' '.         03160001
           05  W-ASSET-QTY-X             PIC Z,ZZZ,ZZZ,ZZ9.9999.        03190001
           05  W-ASSET-AMT-X             PIC ZZZ,ZZZ,ZZZ,ZZ9.99.        03200001
                                                                        03240001
           05  W-QTY-X.                                                 03250001
               07  W-QTY-BYTE            PIC X OCCURS 17 TIMES.         03260001
           05  W-QTY REDEFINES W-QTY-X   PIC 9(17).                     03270001
                                                                        03280001
           05  W-QTY-N                   PIC 9(13)V9(4).                03290001
           05  FILLER REDEFINES W-QTY-N.                                03300001
               07  W-QTY-INT             PIC 9(13).                     03310001
               07  W-QTY-DEC             PIC 9(04).                     03320001
                                                                        03330001
           05  W-INT                     PIC 9(17).                     03340001
           05  W-INT-X REDEFINES W-INT.                                 03350001
               07  W-INT-BYTE            PIC X OCCURS 17 TIMES.         03360001
                                                                        03370001
           05  W-DEC                     PIC 9(04).                     03380001
           05  W-DEC-X REDEFINES W-DEC.                                 03390001
               07  W-DEC-BYTE            PIC X OCCURS  4 TIMES.         03400001
                                                                        03410001
           05  W-STPRC-INTEGER-AMT       PIC 9(05).                     03460001
           05  W-STPRC-FRCTN.                                           03470001
               07  W-STPRC-FRCTN-AMT     PIC 9(02).                     03480001
                                                                        03790001
       01  W-REPORT-REC.                                                        
           05  W-REPORT-LINE             PIC  X(133) VALUE ' '.                 
           05  W-REPORT-CLT              PIC S9(003) COMP-3 VALUE 0.            
           05  W-REPORT-FIL              PIC  X(008) VALUE LOW-VALUE.           
                                                                                
      ****SAVE SOME OF THE KEY FIELDS FROM THE TI RECORD                        
       01  W-PREV-KEY.                                                          
         10  W-PREV-KEY-CLIENT-NBR               PIC  X(004).                   
         10  W-PREV-KEY-SIDE                     PIC  X(001).                   
           88  W-PREV-KEY-IS-RECEIVER            VALUE 'R'.                     
           88  W-PREV-KEY-IS-DELIVERER           VALUE 'D'.                     
         10  W-PREV-KEY-TFR-TYPE                 PIC  X(003).                   
         10  W-PREV-KEY-ACCT-NBR                 PIC  X(020).                   
         10  W-PREV-KEY-PROC-DATE.                                              
             15  W-PREV-KEY-PROC-YEAR            PIC  X(004).                   
             15  W-PREV-KEY-PROC-MM              PIC  X(002).                   
             15  W-PREV-KEY-PROC-DD              PIC  X(002).                   
         10  W-PREV-KEY-CYCLE                    PIC  X(002).                   
         10  W-PREV-KEY-REC-TYPE                 PIC  X(002).                   
           88  W-PREV-KEY-REC-TYPE-IS-TI         VALUE '1T'.                    
           88  W-PREV-KEY-REC-TYPE-IS-AT         VALUE '2A'.                    
         10  W-PREV-KEY-ACAT-CTL-NBR             PIC  X(014).                   
      /                                                                         
       01  FILLER                        PIC  X(008) VALUE 'TRN-REC '.          
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:== BY ==NSCC==.                  
      /                                                                         
       01  FILLER                        PIC  X(008) VALUE 'HDR-REC '.          
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==W-HDR==.                 
      /                                                                         
       01  FILLER                        PIC  X(008) VALUE 'TRL-REC '.          
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==W-TRL==.                 
      /                                                                         
       01  FILLER                        PIC  X(008) VALUE 'HDR-REC '.          
           COPY NSCCMEHD REPLACING ==:NSCCMEHD:== BY ==W-OUTHDR==.              
      /                                                                         
       01  FILLER                        PIC  X(008) VALUE 'TRL-REC '.          
           COPY NSCCMETL REPLACING ==:NSCCMETL:== BY ==W-OUTTRL==.              
      /                                                                         
       01  FILLER                        PIC  X(008) VALUE 'W-TI-REC'.          
           COPY CAT765RE REPLACING ==:CAT765RE:== BY ==W-TI==.                  
      /                                                                         
       01  FILLER                        PIC  X(008) VALUE 'W-SORT-R'.          
           COPY CAT765RE REPLACING ==:CAT765RE:== BY ==W-SORT==.                
      /                                                                         
       01  FILLER                        PIC  X(008) VALUE 'B1-TABLE'.          
       01  B1-WORK-FIELDS.                                                      
           03  B1-SUB                       PIC 9(03) COMP-3 VALUE 0.           
           03  B1-ACTIVE-CNT                PIC 9(03) COMP-3 VALUE 0.           
           03  B1-PRT-SUB                   PIC 9(04)        VALUE 0.           
       01  B1-TABLE-AREA.                                                       
           03  B1-TABLE OCCURS 500 TIMES.                                       
               05  B1-CLT-NBR               PIC 9(04).                          
               05  B1-CLT-NAME              PIC X(030).                         
               05  B1-BRK-NBR               PIC X(004).                         
               05  B1-STREAM                PIC X(001).                         
               05  B1-STATUS                PIC X(001).                         
               05  B1-ACAT-STATUS           PIC X(001).                         
               05  B1-ITEM-CNT              PIC 9(07) VALUE 0.                  
               05  B1-PRINT                 PIC X(001).                         
       01  W-CURR-TABLE.                                                        
               05  W-CURR-CLT-NBR           PIC 9(04).                          
               05  W-CURR-CLT-NAME          PIC X(030).                         
               05  W-CURR-BRK-NBR           PIC X(004).                         
               05  W-CURR-STREAM            PIC X(001).                         
               05  W-CURR-STATUS            PIC X(001).                         
               05  W-CURR-ACAT-STATUS       PIC X(001).                         
               05  W-CURR-ITEM-CNT          PIC 9(07).                          
               05  W-CURR-PRINT             PIC X(001).                         
      /                                                                         
      ******************************************************************        
      * B1 HEADER                                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'BHINFO  '.           
           COPY BHINFO.                                                         
      /                                                                         
      ******************************************************************        
      * B1 ACAT SECTION                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'BHACAT  '.           
           COPY BHACAT.                                                         
      /                                                                         
       01  FILLER                        PIC  X(008) VALUE 'CP2WS   '.          
       01  W-HDR-TRL-LEN                     PIC 9(005) VALUE 120.              
                                                                                
           COPY CP2WS.                                                          
      /                                                                         
       01  FILLER                        PIC  X(008) VALUE 'BPDATESC'.          
                                                                                
           COPY BPDATESC.                                                       
      /                                                                         
      ***===> COBOL LE                                                          
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
       01  FILLER                        PIC  X(008) VALUE 'STUBCPY '.          
           COPY STUBCPY.                                                        
      ***<=== COBOL LE                                                          
      /                                                                         
      ******************************************************************        
      * DB2 - ACAT ACTIVE TRANSFER TABLE                               *        
      ******************************************************************        
       01  FILLER                        PIC  X(008) VALUE 'VTRNFR  '.          
           EXEC SQL INCLUDE VTRNFR       END-EXEC.                              
      /                                                                         
       01  FILLER                        PIC  X(008) VALUE 'VPRTCPPF'.          
           EXEC SQL INCLUDE VPRTCPPF     END-EXEC.                              
      /                                                                         
      ******************************************************************        
      * DB2 COMMAREA                                                   *        
      ******************************************************************        
       01  FILLER                        PIC  X(008) VALUE 'SQLCA   '.          
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
                                                                                
      ******************************************************************        
      * DB2 ERROR MESSAGE AREA                                         *        
      ******************************************************************        
       01  W-DB2-MESSAGE-AREA.                                                  
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.            
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES             
                   INDEXED BY W-DB2-IDX.                                        
       01  W-DB2-MESSAGE-LEN             PIC S9(09) COMP VALUE +80.             
       01  W-DB2-SQLCODE                 PIC ---9.                              
                                                                                
      /                                                                         
      ******************************************************************        
      * REPORT LAYOUT                                                  *        
      ******************************************************************        
                                                                                
       01  W-HDR1-REC.                                                          
           05  FILLER                       PIC  X(001) VALUE '1'.              
           05  FILLER                       PIC  X(008) VALUE                   
               'CAT765CV'.                                                      
           05  W-HDR1-CLT                   PIC  Z999.                          
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-HDR1-CLT-NAME              PIC  X(030) VALUE ' '.              
           05  FILLER                       PIC  X(002) VALUE ' '.              
           05  FILLER                       PIC  X(042) VALUE                   
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.                    
           05  FILLER                       PIC  X(015) VALUE ' '.              
           05  FILLER                       PIC  X(006) VALUE                   
               'DATE: '.                                                        
           05  W-HDR1-MM                    PIC  X(002) VALUE ' '.              
           05  W-HDR1-S1                    PIC  X(001) VALUE '/'.              
           05  W-HDR1-DD                    PIC  X(002) VALUE ' '.              
           05  W-HDR1-S2                    PIC  X(001) VALUE '/'.              
           05  W-HDR1-YEAR                  PIC  X(004) VALUE ' '.              
           05  FILLER                       PIC  X(002) VALUE ' '.              
           05  FILLER                       PIC  X(006) VALUE                   
               'PAGE: '.                                                        
           05  W-HDR1-PAGE                  PIC  ZZZZZ9.                        
                                                                                
       01  W-HDR2-REC.                                                          
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-HDR2-TFR                   PIC  X(003) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-HDR2-BR                    PIC  X(003) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE '-'.              
           05  W-HDR2-ACCT                  PIC  X(005) VALUE ' '.              
           05  FILLER                       PIC  X(020) VALUE ' '.              
           05  W-HDR2-HEADING               PIC  X(052) VALUE                   
            'FRV AND RCL DELIVERY REQUEST OF PENSON FLIP ACCOUNT '.             
           05  W-HDR2-DEL-REC               PIC  X(009) VALUE ' '.              
           05  FILLER                       PIC  X(034) VALUE ' '.              
                                                                                
       01  W-HDR3-REC.                                                          
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(053) VALUE ' '.              
           05  FILLER                       PIC  X(006) VALUE                   
               'CYCLE '.                                                        
           05  W-HDR3-CYCLE                 PIC  X(002) VALUE ' '.              
           05  FILLER                       PIC  X(006) VALUE                   
               ' FOR: '.                                                        
           05  W-HDR3-MM                    PIC  X(002) VALUE ' '.              
           05  W-HDR3-S1                    PIC  X(001) VALUE '/'.              
           05  W-HDR3-DD                    PIC  X(002) VALUE ' '.              
           05  W-HDR3-S2                    PIC  X(001) VALUE '/'.              
           05  W-HDR3-YEAR                  PIC  X(004) VALUE ' '.              
           05  FILLER                       PIC  X(055) VALUE ' '.              
                                                                                
                                                                                
      ***ASSET HEADER                                                           
       01  W-AST-HDR1-REC.                                                      
           05  W-AST-HDR1-CC                PIC  X(001) VALUE '0'.              
           05  W-AST-HDR1-DEL-REC           PIC  X(003) VALUE ' '.              
           05  FILLER                       PIC  X(015) VALUE                   
               ' PARTICIPANT:  '.                                               
           05  W-AST-HDR1-BRKR              PIC  X(004) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-AST-HDR1-BRKR-NAME         PIC  X(054) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-AST-HDR1-DEL-REC-2         PIC  X(003) VALUE ' '.              
           05  FILLER                       PIC  X(016) VALUE                   
               ' CUST ACCT NUM: '.                                              
           05  W-AST-HDR1-ACCT-NBR          PIC  X(015) VALUE ' '.              
           05  FILLER                       PIC  X(002) VALUE ' '.              
           05  FILLER                       PIC  X(016) VALUE                   
               'CUST ACCT TYPE: '.                                              
           05  W-AST-HDR1-ACCT-TYPE         PIC  X(002) VALUE ' '.              
                                                                                
       01  W-AST-HDR2-REC.                                                      
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-AST-HDR2-DEL-REC           PIC  X(003) VALUE ' '.              
           05  FILLER                       PIC  X(015) VALUE                   
               ' PARTICIPANT:  '.                                               
           05  W-AST-HDR2-BRKR              PIC  X(004) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-AST-HDR2-BRKR-NAME         PIC  X(054) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-AST-HDR2-DEL-REC-2         PIC  X(003) VALUE ' '.              
           05  FILLER                       PIC  X(016) VALUE                   
               ' CUST ACCT NUM: '.                                              
           05  W-AST-HDR2-ACCT-NBR          PIC  X(015) VALUE ' '.              
                                                                                
       01  W-AST-HDR3-REC.                                                      
           05  W-AST-HDR3-CC                PIC  X(001) VALUE '0'.              
           05  FILLER                       PIC  X(012) VALUE                   
               'CONTROL NO: '.                                                  
           05  W-AST-HDR3-ACAT-CTL-NBR.                                         
               07  W-AST-HDR3-ACAT-CTL-1    PIC  X(007) VALUE ' '.              
               07  W-AST-HDR3-ACAT-CTL-D1   PIC  X(001) VALUE '-'.              
               07  W-AST-HDR3-ACAT-CTL-2    PIC  X(007) VALUE ' '.              
           05  FILLER                       PIC  X(002) VALUE ' '.              
           05  FILLER                       PIC  X(006) VALUE                   
               'TYPE: '.                                                        
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-AST-HDR3-TFR-TYPE          PIC  X(003) VALUE ' '.              
           05  FILLER                       PIC  X(002) VALUE ' '.              
           05  FILLER                       PIC  X(012) VALUE                   
               'SSN/TAX-ID: '.                                                  
           05  W-AST-HDR3-SSN-PRM           PIC  X(011) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-AST-HDR3-SSN-SEC           PIC  X(011) VALUE ' '.              
           05  FILLER                       PIC  X(002) VALUE ' '.              
           05  FILLER                       PIC  X(017) VALUE                   
               'TRANSFER STATUS: '.                                             
           05  W-AST-HDR3-TFR-STATUS        PIC  X(012) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(006) VALUE                   
               'DAYS: '.                                                        
           05  W-AST-HDR3-DAYS              PIC  X(003) VALUE ' '.              
           05  FILLER                       PIC  X(002) VALUE ' '.              
           05  W-AST-HDR3-ACTION            PIC  X(010) VALUE ' '.              
                                                                                
       01  W-AST-HDR4-REC.                                                      
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(012) VALUE                   
               ' ASSOC CTL: '.                                                  
           05  W-AST-HDR4-ASSC-CTL-NBR.                                         
               07  W-AST-HDR4-ASSC-CTL-1    PIC  X(007) VALUE ' '.              
               07  W-AST-HDR4-ASSC-CTL-D1   PIC  X(001) VALUE '-'.              
               07  W-AST-HDR4-ASSC-CTL-2    PIC  X(007) VALUE ' '.              
           05  FILLER                       PIC  X(002) VALUE ' '.              
           05  FILLER                       PIC  X(016) VALUE                   
               'ASSOC SETL DTE: '.                                              
           05  W-AST-HDR4-ASSC-STL-DT.                                          
               07  W-AST-HDR4-ASSC-STL-MM   PIC  X(002) VALUE ' '.              
               07  W-AST-HDR4-ASSC-STL-S1   PIC  X(001) VALUE ' '.              
               07  W-AST-HDR4-ASSC-STL-DD   PIC  X(002) VALUE ' '.              
               07  W-AST-HDR4-ASSC-STL-S2   PIC  X(001) VALUE ' '.              
               07  W-AST-HDR4-ASSC-STL-YEAR PIC  X(004) VALUE ' '.              
                                                                                
       01  W-AST-HDR5-REC.                                                      
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(012) VALUE                   
               ' CUST NAME: '.                                                  
           05  W-AST-HDR5-CUST-NAME         PIC  X(060) VALUE ' '.              
           05  FILLER                       PIC  X(003) VALUE ' '.              
           05  W-AST-HDR5-FLD-REJ-CMNT-AREA.                                    
               07  W-AST-HDR5-FLD-REJ-CMNT  PIC  X(011) VALUE ' '.              
               07  FILLER                   PIC  X(001) VALUE ' '.              
               07  W-AST-HDR5-REJ-MSG       PIC  X(045) VALUE ' '.              
                                                                                
       01  W-AST-HDR6-REC.                                                      
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(012) VALUE                   
               '   COMMENT: '.                                                  
           05  W-AST-HDR6-COMMENT           PIC  X(0120) VALUE ' '.             
                                                                                
       01  W-AST-HDR7-REC.                                                      
           05  FILLER                       PIC  X(001) VALUE '0'.              
           05  FILLER                       PIC  X(006) VALUE                   
               '   SEQ'.                                                        
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(020) VALUE                   
               '         QUANTITY'.                                             
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(014) VALUE                   
               'ASSET_ID      '.                                                
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(030) VALUE                   
               'ASSET_DESCRIPTION'.                                             
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(020) VALUE                   
               '             AMOUNT '.                                          
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(005) VALUE                   
               'C/M/S'.                                                         
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(030) VALUE                   
               'ADDITIONAL_INFO'.                                               
                                                                                
       01  W-AST-HDR8-REC.                                                      
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(006) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(020) VALUE                   
               '                    '.                                          
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(014) VALUE                   
               'TFR_TYPE_RSN  '.                                                
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(030) VALUE                   
               'ACTION    FIELD  '.                                             
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(020) VALUE                   
               '                    '.                                          
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(020) VALUE                   
               '                    '.                                          
                                                                                
       01  W-AST-HDR9-REC.                                                      
           05  FILLER                       PIC  X(001) VALUE '0'.              
           05  FILLER                       PIC  X(007) VALUE                   
               '------ '.                                                       
           05  W-AST-HDR9-STL-LOC           PIC  X(023) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-AST-HDR9-STL-LOC-RSN       PIC  X(004) VALUE ' '.              
                                                                                
      ***ASSET LINE 1                                                           
       01  W-A1-REC.                                                            
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-A1-ASSET-SEQ-NBR           PIC  X(006) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-A1-ASSET-QTY               PIC  X(018) VALUE ' '.              
           05  W-A1-ASSET-PSTN-CD           PIC  X(001) VALUE ' '.              
           05  W-A1-ASSET-PCT-LIT           PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-A1-ASSET-ID.                                                   
               07  W-A1-SEC-CNTRY-CD        PIC  X(002) VALUE ' '.              
               07  W-A1-SEC-D1              PIC  X(001) VALUE ' '.              
               07  W-A1-SEC-ID              PIC  X(009) VALUE ' '.              
               07  W-A1-SEC-D2              PIC  X(001) VALUE ' '.              
               07  W-A1-SEC-CHKDGT          PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-A1-ASSET-DESC.                                                 
               07  W-A1-ATO-OPT-SYM         PIC  X(006) VALUE ' '.              
               07  FILLER                   PIC  X(001) VALUE ' '.              
               07  W-A1-ATO-OPT-EXP-DT      PIC  X(007) VALUE ' '.              
               07  FILLER                   PIC  X(001) VALUE ' '.              
               07  W-A1-ATO-OPT-STKPRC-INT  PIC  X(005) VALUE ' '.              
               07  FILLER                   PIC  X(001) VALUE ' '.              
               07  W-A1-ATO-OPT-STKPRC-FRC  PIC  X(003) VALUE ' '.              
               07  FILLER                   PIC  X(006) VALUE ' '.              
           05  FILLER                       PIC  X(002) VALUE ' '.              
           05  W-A1-ASSET-AMT               PIC  X(018) VALUE ' '.              
           05  FILLER                       PIC  X(002) VALUE ' '.              
           05  W-A1-ISO-CURCY-CD            PIC  X(003) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-A1-CASH-MRGN-SHTCD         PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-A1-ADDITIONAL-INFO.                                            
               07  W-A1-ATO-BUY-SELL        PIC  X(004) VALUE ' '.              
               07  FILLER                   PIC  X(002) VALUE ' '.              
               07  W-A1-ATO-CALL-PUT        PIC  X(004) VALUE ' '.              
               07  FILLER                   PIC  X(002) VALUE ' '.              
               07  W-A1-ATO-OPEN-CLOSE      PIC  X(005) VALUE ' '.              
               07  FILLER                   PIC  X(002) VALUE ' '.              
               07  W-A1-ATO-EQUITY          PIC  X(006) VALUE ' '.              
           05  FILLER                       PIC  X(006) VALUE ' '.              
                                                                                
      ***ASSET LINE 2                                                           
       01  W-A2-REC.                                                            
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  FILLER                       PIC  X(029) VALUE ' '.              
           05  W-A2-TFR-TYPE-RSN            PIC  X(013) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE ' '.              
           05  W-A2-ACTION                  PIC  X(010) VALUE ' '.              
           05  FILLER                       PIC  X(002) VALUE ' '.              
           05  W-A2-FLD-REJ-CMNT-AREA.                                          
               07  W-A2-COMMENT-LIT         PIC  X(009) VALUE ' '.              
               07  W-A2-COMMENT             PIC  X(060) VALUE ' '.              
               07  FILLER                   PIC  X(008).                        
           05  FILLER REDEFINES W-A2-FLD-REJ-CMNT-AREA.                         
               07  FILLER                   PIC  X(020).                        
               07  W-A2-FLD-REJ-CMNT        PIC  X(011).                        
               07  FILLER                   PIC  X(001).                        
               07  W-A2-REJ-MSG.                                                
                   09  FILLER               PIC  X(014).                        
                   09  W-A2-ADDITIONAL-INFO PIC  X(025).                        
                   09  FILLER               PIC  X(006).                        
                                                                                
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'END-O-WS'.          
      /                                                                         
      *****************************************************************         
      *    LINKAGE SECTION                                            *         
      *****************************************************************         
       LINKAGE SECTION.                                                         
       01  L-JCL-PARMS.                                                         
           05  PARMLENGTH                PIC S9(004) COMP SYNC.                 
           05  L-STREAM                  PIC  X(001).                           
               88  L-ALL-STREAM                      VALUE 'Z'.                 
           05  L-BYP-CYCLE-SW            PIC  X(001).                           
               88  L-BYP-CYCLE                VALUE '1' '2' '3'.                
               88  L-USE-NEXT-CYCLE-NBR              VALUE '1'.                 
               88  L-USE-PREV-CYCLE-NBR              VALUE '2'.                 
               88  L-USE-NSCC-CYCLE-NBR              VALUE '3'.                 
           05  L-BYP-DATECHK-SW          PIC  X(001).                           
               88  L-BYP-DATECHK                     VALUE '1'.                 
           05  L-BYP-FILECHK-SW          PIC  X(001).                           
               88  L-BYP-FILECHK                     VALUE '1'.                 
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
           DISPLAY 'CAT765CV - EXTRACT NSCC/SIAC ACATS TRANSACTIONS'            
                           ' FOR NON-STANDARD REPORT'.                          
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
                                                                                
           SORT SORT-FILE ON ASCENDING SORT-KEY                                 
                INPUT  PROCEDURE IS 2000-SORT-INPUT  THRU 2000-EXIT             
                OUTPUT PROCEDURE IS 5000-SORT-OUTPUT THRU 5000-EXIT.            
                                                                                
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                          
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT.                                                               
                                                                                
           ACCEPT W-SYS-DATE              FROM DATE.                            
           ACCEPT W-SYS-TIME              FROM TIME.                            
           DISPLAY 'CAT765CV: SYS-DATE ' W-SYS-DATE                             
                          ' SYS-TIME ' W-SYS-TIME.                              
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT765CV: L-STREAM         = '                              
                             L-STREAM                                           
           DISPLAY 'CAT765CV: L-BYP-CYCLE-SW   = '                              
                             L-BYP-CYCLE-SW                                     
                   ' (1=BYPASS CYCLE NBR)'                                      
           DISPLAY 'CAT765CV: L-BYP-DATECHK-SW = '                              
                             L-BYP-DATECHK-SW                                   
                   ' (1=BYPASS DATE CHECK)'                                     
           DISPLAY 'CAT765CV: L-BYP-FILECHK-SW = '                              
                             L-BYP-FILECHK-SW                                   
                   ' (1=BYPASS FILE CHECK)'                                     
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT765CV: DATE CHECK WILL BE BYPASSED'                  
           ELSE                                                                 
               DISPLAY 'CAT765CV: DATE CHECK WILL BE PERFORMED'                 
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT765CV: FILE CHECK WILL BE BYPASSED'                  
           ELSE                                                                 
               DISPLAY 'CAT765CV: FILE CHECK WILL BE PERFORMED'                 
           END-IF.                                                              
                                                                                
           MOVE 'CAT765CV'                TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.                   
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.                   
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.                   
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT765CV:       BPD-PROC-DATE= ' BPD-PROC-DATE              
                                '  LD-PROC-DATE= ' LD-PROC-DATE.                
           DISPLAY 'CAT765CV: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE.       
           DISPLAY ' '.                                                         
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT765CV: INFILE   OPENED FOR INPUT.  STATUS = '            
                                               INFILE-STAT.                     
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT765CV: ERROR OPENING INFILE'                         
               DISPLAY 'CAT765CV: OPEN STATUS = ' INFILE-STAT                   
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT765CV: U3001 - ABENDING ON BAD FILE STATUS'          
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN OUTPUT OUTFILE.                                                 
           DISPLAY 'CAT765CV: OUTFILE  OPENED FOR OUTPUT. STATUS = '            
                                               OUTFILE-STAT.                    
                                                                                
           IF  OUTFILE-OKAY                                                     
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT765CV: ERROR OPENING OUTFILE'                        
               DISPLAY 'CAT765CV: OPEN STATUS = ' OUTFILE-STAT                  
                            '.  INPUT-CNT = ' W-OUTFILE-CNT                     
               DISPLAY 'CAT765CV: U3002 - ABENDING ON BAD FILE STATUS'          
               MOVE +3002    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN OUTPUT REPT-FILE.                                               
           DISPLAY 'CAT765CV: OREPORT OPENED FOR OUTPUT. STATUS = '             
                                               REPT-STAT.                       
                                                                                
           IF  REPT-FILE-OKAY                                                   
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT765CV: ERROR OPENING OREPORT'                        
               DISPLAY 'CAT765CV: OPEN STATUS = ' REPT-STAT                     
                            '.  INPUT-CNT = ' W-OREPORT-CNT                     
               DISPLAY 'CAT765CV: U3003 - ABENDING ON BAD FILE STATUS'          
               MOVE +3003    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           DISPLAY ' '                                                          
           PERFORM 1300-WRITE-OUTFILE-HDR THRU 1300-EXIT.                       
           PERFORM 1500-LOAD-B1           THRU 1500-EXIT.                       
           MOVE ' ' TO W-PREV-KEY.                                              
           MOVE ' ' TO W-TI-RECORD.                                             
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       1300-WRITE-OUTFILE-HDR.                                                  
                                                                                
           MOVE 'H'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
                                                                                
           CALL P2HDTR                USING CP2-AREA                            
                                            OUTFILE.                            
                                                                                
           MOVE SPACES                   TO W-OUTHDR-REC                        
           MOVE CP2-RETURN-RECORD        TO W-OUTHDR-P2                         
                                                                                
           DISPLAY 'CAT765CV: OUT-HDR = '   W-OUTHDR-REC                        
                                                                                
           MOVE W-OUTHDR-REC             TO OUTFILE-HDR-REC                     
                                                                                
           WRITE OUTFILE-RECORD.                                                
                                                                                
       1300-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       1500-LOAD-B1.                                                            
           DISPLAY 'CAT765CV: 1500-LOAD-B1'.                                    
                                                                                
           MOVE SPACES                   TO  B1-TABLE-AREA.                     
           MOVE 0                        TO  B1-SUB.                            
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500                
                                                                                
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO              
                                             BH-ACAT-INFO                       
             MOVE  10                    TO  BH-BROKER-NUMBER-N                 
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE             
             MOVE  '434500'              TO  BH-B2-INFO-ID                      
             CALL  GETB1V              USING BH-BROKER-HEADER-INFO              
                                             BH-ACAT-INFO                       
           IF  BH-BROKER-ACTIVE                                                 
           AND BH-ACAT-ACTIVE                                                   
           AND (BH-BROKER-MINI-MAXI-INDICATOR = L-STREAM  OR                    
                L-STREAM = 'Z')                                                 
           AND B1-SUB = 10                                                      
             MOVE  BH-BROKER-NUMBER-N    TO B1-CLT-NBR    (B1-SUB)              
             MOVE  BH-BROKER-NAME        TO B1-CLT-NAME   (B1-SUB)              
             MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)                           
                                         TO B1-BRK-NBR    (B1-SUB)              
             IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '                             
                 MOVE BH-BROKER-MINI-MAXI-SUBGROUP                              
                                         TO B1-STREAM     (B1-SUB)              
             ELSE                                                               
                 MOVE BH-BROKER-MINI-MAXI-INDICATOR                             
                                         TO B1-STREAM     (B1-SUB)              
             END-IF                                                             
             MOVE  BH-BROKER-STATUS      TO B1-STATUS     (B1-SUB)              
             MOVE 0                      TO B1-ITEM-CNT   (B1-SUB)              
             MOVE  ' '                   TO B1-PRINT      (B1-SUB)              
                                                                                
                       ADD 1 TO B1-ACTIVE-CNT                                   
                       MOVE  BH-ACAT-STATUS                                     
                                         TO B1-ACAT-STATUS(B1-SUB)              
                       DISPLAY      ' CLT ' B1-CLT-NBR    (B1-SUB)              
                                        ' ' B1-CLT-NAME   (B1-SUB)              
                                    ' BRK ' B1-BRK-NBR    (B1-SUB)              
                                    ' STR ' B1-STREAM     (B1-SUB)              
                                    ' STA ' B1-STATUS     (B1-SUB)              
                                   ' ACAT ' B1-ACAT-STATUS(B1-SUB)              
           END-IF                                                               
                                                                                
           END-PERFORM.                                                         
                                                                                
           DISPLAY ' '.                                                         
                                                                                
           DISPLAY  'B1 ACTIVE COUNT = ' B1-ACTIVE-CNT.                         
           DISPLAY ' '.                                                         
       1500-EXIT. EXIT.                                                         
      /                                                                         
       2000-SORT-INPUT.                                                         
           DISPLAY ' '                                                          
           DISPLAY '2000-SORT-INPUT'.                                           
                                                                                
           PERFORM 2100-PROCESS-INPUT THRU 2100-EXIT                            
                   UNTIL END-OF-INFILE.                                         
                                                                                
       2000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       2100-PROCESS-INPUT.                                                      
                                                                                
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF  END-OF-INFILE                                                    
               GO TO 2100-EXIT                                                  
           END-IF.                                                              
                                                                                
           MOVE SPACES        TO NSCC-RECORD                                    
           MOVE INFILE-RECORD (1 : W-REC-LEN-IN) TO                             
                NSCC-RECORD   (1 : W-REC-LEN-IN)                                
                                                                                
           IF  NSCCMHDR-REC-TYPE = 'M'                                          
               ADD 1 TO W-DETAIL-CNT                                            
           END-IF.                                                              
                                                                                
           IF  NSCCMHDR-REC-TYPE = 'M'                                          
           AND NSCC-PROC-DATE = BPD-PROC-DATE                                   
               IF (NSCC-REC-SUBTYPE = 'T'                                       
               AND NSCC-TI-RCV-NBR  = '0158'                                    
               AND NSCC-TI-TFR-TYPE = 'RCL' OR 'FRV')                           
               OR (NSCC-REC-SUBTYPE = 'A'                                       
               AND NSCC-AT-RCV-NBR  = '0158'                                    
               AND NSCC-AT-TFR-TYPE = 'RCL' OR 'FRV')                           
                   PERFORM 2150-CHECK-BROKER THRU 2150-EXIT                     
                   IF W-BRK-SW = 'Y'                                            
                      PERFORM 2200-FORMAT-SORT THRU 2200-EXIT                   
                   END-IF                                                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       2100-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       2150-CHECK-BROKER.                                                       
                                                                                
           IF  NSCC-DIST-PARTICIPANT = W-CURR-BRK-NBR                           
               CONTINUE                                                         
           ELSE                                                                 
               MOVE 'N'            TO W-BRK-SW                                  
               PERFORM VARYING W-SUB1 FROM 1 BY 1                               
                 UNTIL W-SUB1 > 500                                             
                    OR W-BRK-SW = 'Y'                                           
                   IF  B1-BRK-NBR (W-SUB1) =                                    
                                              NSCC-DIST-PARTICIPANT             
                       MOVE 'Y'            TO W-BRK-SW                          
                       MOVE B1-TABLE (W-SUB1) TO W-CURR-TABLE                   
                       DISPLAY '======> BROKER FND '                            
                                              NSCC-DIST-PARTICIPANT             
                                      ' CLT=' W-CURR-CLT-NBR                    
                                          ' ' W-CURR-CLT-NAME                   
                                      ' STM=' W-CURR-STREAM                     
                                    ' CYCLE=' NSCC-CYCLE(2:1)                   
                   ELSE                                                         
                       MOVE ' '               TO W-CURR-TABLE                   
                       MOVE 0000              TO W-CURR-CLT-NBR                 
                   END-IF                                                       
               END-PERFORM                                                      
           END-IF.                                                              
                                                                                
       2150-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       2200-FORMAT-SORT.                                                        
                                                                                
           MOVE SPACES                   TO SORT-RECORD                         
           ADD 1 TO B1-ITEM-CNT (W-CURR-CLT-NBR)                                
           MOVE W-CURR-CLT-NBR      TO SORT-KEY-CLIENT-NBR                      
                                                                                
           IF  NSCC-REC-SUBTYPE = 'T'                                           
               PERFORM 2500-GET-VTRNFR THRU 2500-EXIT                           
               IF  SQLCODE  =  +0                                               
               AND CVRSN-ACCT-NBR OF DCLVTRNFR = 'CONV REJECT'                  
                  PERFORM 2210-MOVE-TI-DATA THRU 2210-EXIT                      
           END-IF.                                                              
                                                                                
           IF  NSCC-REC-SUBTYPE = 'A'                                           
               IF  SORT-KEY-CLIENT-NBR   = W-PREV-KEY-CLIENT-NBR                
               AND NSCC-ACAT-CTL-NBR     = W-PREV-KEY-ACAT-CTL-NBR              
                  MOVE W-PREV-KEY-ACCT-NBR TO SORT-KEY-ACCT-NBR                 
                  PERFORM 2250-MOVE-AT-DATA THRU 2250-EXIT                      
           END-IF.                                                              
                                                                                
       2200-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       2210-MOVE-TI-DATA.                                                       
                                                                                
           MOVE '1T'                   TO SORT-KEY-REC-TYPE.                    
           MOVE NSCC-TI-TFR-TYPE       TO SORT-KEY-TFR-TYPE                     
                                                                                
           ADD 1 TO W-TI-CNT.                                                   
                                                                                
           IF  NSCC-DIST-PARTICIPANT    = NSCC-TI-RCV-NBR                       
               MOVE 'R'                TO SORT-KEY-SIDE                         
               MOVE NSCC-TI-RCV-ACCT-NBR TO SORT-KEY-ACCT-NBR                   
           ELSE                                                                 
               MOVE 'D'                TO SORT-KEY-SIDE                         
               MOVE NSCC-TI-DEL-ACCT-NBR TO SORT-KEY-ACCT-NBR                   
           END-IF.                                                              
                                                                                
           MOVE NSCC-PROC-DATE         TO SORT-KEY-PROC-DATE                    
           MOVE NSCC-CYCLE             TO SORT-KEY-CYCLE                        
           MOVE ' '                    TO SORT-KEY-STL-LOC                      
           MOVE ' '                    TO SORT-KEY-CASH-MRGN-SHTCD              
           MOVE ' '                    TO SORT-KEY-SEC-CNTRY-CD                 
           MOVE ' '                    TO SORT-KEY-SEC-ID                       
           MOVE ' '                    TO SORT-KEY-SEC-CHKDGT                   
           MOVE ' '                    TO SORT-KEY-POS-CD                       
           MOVE NSCC-ACAT-CTL-NBR      TO SORT-KEY-ACAT-CTL-NBR                 
           MOVE NSCC-ASSET-SEQ-NBR     TO SORT-KEY-ASSET-SEQ-NBR                
           MOVE NSCC-TI-TRAN-TYPE      TO SORT-KEY-TRAN-TYPE                    
           MOVE NSCC-SYSTEM-ACTION     TO SORT-KEY-SYSTEM-ACTION                
                                                                                
           EVALUATE NSCC-TI-TFR-TYPE                                            
               WHEN 'CRD' ADD 1 TO W-CRD-TI-CNT                                 
               WHEN 'FRV' ADD 1 TO W-FRV-TI-CNT                                 
               WHEN 'FUL' ADD 1 TO W-FUL-TI-CNT                                 
               WHEN 'PTD' ADD 1 TO W-PTD-TI-CNT                                 
               WHEN 'PTR' ADD 1 TO W-PTR-TI-CNT                                 
               WHEN 'RCL' ADD 1 TO W-RCL-TI-CNT                                 
               WHEN 'RCR' ADD 1 TO W-RCR-TI-CNT                                 
               WHEN 'MFC' ADD 1 TO W-MFC-TI-CNT                                 
DJ0002         WHEN 'PTF' ADD 1 TO W-PTF-TI-CNT                                 
           END-EVALUATE.                                                        
                                                                                
           MOVE NSCC-RECORD (1 : 558)                                           
             TO SORT-TRN-REC (1 : 558).                                         
                                                                                
           MOVE ' '                    TO SORT-KEY-DATABASE-FROM                
           MOVE SORT-KEY               TO W-PREV-KEY.                           
           MOVE SORT-RECORD            TO W-TI-RECORD.                          
           RELEASE SORT-RECORD                                                  
           ADD 1 TO W-RELEASE-CNT.                                              
                                                                                
       2210-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
      ****READ VTRNFR FOR TRANSFER INFO FOR ASSETS IN REVIEW                    
       2230-GET-VTRNFR-DATA.                                                    
                                                                                
           PERFORM 2500-GET-VTRNFR THRU 2500-EXIT.                              
                                                                                
           IF  SQLCODE  =  +0                                                   
           AND CVRSN-ACCT-NBR OF DCLVTRNFR = 'CONV REJECT'                      
***********    DISPLAY '2230-GET-VTRNFR-DATA OK ' SORT-KEY-CLIENT-NBR           
***********                                   ' ' NSCC-ACAT-CTL-NBR             
***********                                   ' ' NSCC-AT-TFR-TYPE              
               ADD 1 TO W-VTRNFR-CNT                                            
               MOVE ' ' TO W-TI-RECORD                                          
               PERFORM 2600-MOVE-VTRNFR-DATA THRU 2600-EXIT                     
               MOVE W-TI-RECORD            TO SORT-RECORD                       
               MOVE 'Y'                    TO SORT-KEY-DATABASE-FROM            
               MOVE NSCC-AT-TRAN-TYPE      TO SORT-KEY-TRAN-TYPE                
               MOVE NSCC-SYSTEM-ACTION     TO SORT-KEY-SYSTEM-ACTION            
               MOVE NSCC-CYCLE             TO SORT-KEY-CYCLE                    
               MOVE SORT-KEY               TO W-PREV-KEY                        
               RELEASE SORT-RECORD                                              
               ADD 1 TO W-RELEASE-CNT                                           
           ELSE                                                                 
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY '2230-GET-VTRNFR-DATA NG ' SORT-KEY-CLIENT-NBR           
                                              ' ' NSCC-ACAT-CTL-NBR             
                                              ' ' NSCC-AT-TFR-TYPE              
                                      ' SQLC=' W-DB2-SQLCODE                    
                                      ' ACTN=' NSCC-SYSTEM-ACTION               
                                      ' REJT=' NSCC-SYSTEM-REJ-RSN              
           END-IF.                                                              
                                                                                
       2230-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       2250-MOVE-AT-DATA.                                                       
                                                                                
           MOVE '2A'                   TO SORT-KEY-REC-TYPE                     
           MOVE NSCC-AT-TFR-TYPE       TO SORT-KEY-TFR-TYPE                     
                                                                                
           ADD 1 TO W-AT-CNT.                                                   
                                                                                
           IF  NSCC-DIST-PARTICIPANT    = NSCC-AT-RCV-NBR                       
               MOVE 'R'                TO SORT-KEY-SIDE                         
           ELSE                                                                 
               MOVE 'D'                TO SORT-KEY-SIDE                         
           END-IF.                                                              
                                                                                
           MOVE NSCC-PROC-DATE           TO SORT-KEY-PROC-DATE                  
           MOVE NSCC-CYCLE               TO SORT-KEY-CYCLE                      
           MOVE NSCC-AT-STL-LOC          TO SORT-KEY-STL-LOC                    
           MOVE NSCC-AT-CASH-MRGN-SHTCD TO SORT-KEY-CASH-MRGN-SHTCD             
           MOVE NSCC-AT-SEC-CNTRY-CD     TO SORT-KEY-SEC-CNTRY-CD               
           MOVE NSCC-AT-SEC-ID           TO SORT-KEY-SEC-ID                     
           MOVE NSCC-AT-SEC-CHKDGT       TO SORT-KEY-SEC-CHKDGT                 
           MOVE NSCC-AT-POS-CD           TO SORT-KEY-POS-CD                     
           MOVE NSCC-ACAT-CTL-NBR        TO SORT-KEY-ACAT-CTL-NBR               
           MOVE NSCC-ASSET-SEQ-NBR       TO SORT-KEY-ASSET-SEQ-NBR              
           MOVE NSCC-AT-TRAN-TYPE        TO SORT-KEY-TRAN-TYPE                  
           MOVE NSCC-SYSTEM-ACTION       TO SORT-KEY-SYSTEM-ACTION              
                                                                                
           EVALUATE NSCC-AT-TFR-TYPE                                            
               WHEN 'CRD' ADD 1 TO W-CRD-AT-CNT                                 
               WHEN 'FRV' ADD 1 TO W-FRV-AT-CNT                                 
               WHEN 'FUL' ADD 1 TO W-FUL-AT-CNT                                 
               WHEN 'PTD' ADD 1 TO W-PTD-AT-CNT                                 
               WHEN 'PTR' ADD 1 TO W-PTR-AT-CNT                                 
               WHEN 'RCL' ADD 1 TO W-RCL-AT-CNT                                 
               WHEN 'RCR' ADD 1 TO W-RCR-AT-CNT                                 
               WHEN 'MFC' ADD 1 TO W-MFC-AT-CNT                                 
DJ0002         WHEN 'PTF' ADD 1 TO W-PTF-AT-CNT                                 
           END-EVALUATE.                                                        
                                                                                
           MOVE NSCC-RECORD (1 : 662)                                           
             TO SORT-TRN-REC (1 : 662)                                          
                                                                                
           EVALUATE TRUE                                                        
               WHEN NSCC-AT-LEN        ADD 1 TO W-ATR-CNT                       
               WHEN NSCC-AT-OP-LEN     ADD 1 TO W-ATO-CNT                       
                    MOVE NSCC-ATO-OPT-AREA   TO SORT-ATO-OPT-AREA               
               WHEN NSCC-AT-MF-LEN     ADD 1 TO W-ATF-CNT                       
                    MOVE NSCC-ATF-FUND-AREA TO SORT-ATF-FUND-AREA               
           END-EVALUATE.                                                        
                                                                                
           MOVE ' '                    TO SORT-KEY-DATABASE-FROM                
           RELEASE SORT-RECORD                                                  
           ADD 1 TO W-RELEASE-CNT.                                              
                                                                                
       2250-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
      ***WHEN TRANSFER IS FROM A PREVIOUS DAY, READ DATABASE FOR IT.            
       2500-GET-VTRNFR.                                                         
                                                                                
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,ACAT_CONTROL_NBR                                            
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,CONTROL_NBR_STS_CD                                          
                   ,DLVR_NBR                                                    
                   ,DLVR_NBR_STTS_CD                                            
                   ,ACCT_DLVR_NBR                                               
                   ,ACCT_DLVR_STTS_CD                                           
                   ,RCV_NBR                                                     
                   ,RCV_NBR_STTS_CD                                             
                   ,ACCT_RCV_NBR                                                
                   ,ACCT_RCV_STTS_CD                                            
                   ,TRNFR_TYPE_CD                                               
                   ,TRNFR_TYPE_STTS_CD                                          
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,RCV_CUST_NM                                                 
                   ,RCV_CUST_NM_STS_CD                                          
                   ,RCV_SS_PRIM_NBR                                             
                   ,RCV_SS_PRIM_STS_CD                                          
                   ,RCV_SS_SCNDY_NBR                                            
                   ,RCV_SS_SCDY_STS_CD                                          
                   ,RCV_ACCT_TYPE_CD                                            
                   ,RCV_ACT_TYP_STS_CD                                          
                   ,RCV_OCC_BRKR_NBR                                            
                   ,RCV_OCC_STTS_CD                                             
                   ,RCV_CRSPN_NBR                                               
                   ,RCV_CRSPN_STTS_CD                                           
                   ,ACAT_CNTL_ASTD_NBR                                          
                   ,CNTL_ASTD_STTS_CD                                           
                   ,CMNT_TXT                                                    
                   ,CMNT_STTS_CD                                                
                   ,PRCS_DT                                                     
                   ,STTS_CD                                                     
                   ,STTLM_TM_CD                                                 
                   ,VAL_FREE_CD                                                 
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,DB_CR_CD                                                    
                   ,DSTBN_SIDE_CD                                               
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRNFR_TYPE_RJC1_CD                                          
                   ,TRNFR_TYPE_RJC2_CD                                          
                   ,TRNFR_TYPE_RJCT_CD                                          
                   ,TRN_TYP_RJC_STS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,RR_CD                                                       
                   ,BRANCH_CD                                                   
                   ,DVDND_NAA_CD                                                
                   ,SELL_INSTN_NAA_CD                                           
                   ,CASH_SWEEP_NAA_CD                                           
                   ,PRTCP_CONTRA_CD                                             
                   ,ACM_HOLDER_NAA_CD                                           
                   ,ACCT_ACTIVITY_IND                                           
                   ,ACCT_ORDERS_IND                                             
                   ,ACCT_RJCT_RSBM_IND                                          
                   ,ACCT_DB_BAL_T1_IND                                          
                   ,ACCT_MRGN_DB_IND                                            
                   ,ACCT_SHRT_PSTN_IND                                          
                   ,ACCT_SEC_RSTRD_IND                                          
                   ,ACCT_AST_EXCS_IND                                           
                   ,ACCT_OPTN_PSTN_IND                                          
                   ,ACCT_LTD_PRTNR_IND                                          
                   ,ACCT_TIN_MSMTH_IND                                          
                   ,ACCT_DPLCT_TRN_IND                                          
                   ,ACCT_CUST_70_IND                                            
                   ,ACCT_QULFD_PLN_IND                                          
                   ,ACCT_MNGD_IND                                               
                   ,ACCT_PRVT_RNG_IND                                           
                   ,ACCT_BRKR_TIF_IND                                           
                   ,NSCC_NON_ADP_IND                                            
                   ,CYCLE_CD                                                    
                   ,DAYS_STTS_QTY                                               
                   ,STTLM_DT                                                    
                   ,ACCT_NA_UPDT_IND                                            
                   ,ACCT_TRNFR_FEE_AMT                                          
                   ,ACCT_IRA_TRMNT_AMT                                          
                   ,ACCT_IRA_MAINT_AMT                                          
                   ,ACCT_DLRV_PRGR_IND                                          
                   ,ACCT_CD                                                     
                   ,STTLM_ASCTD_DT                                              
                   ,STTLM_ASCTD_STS_CD                                          
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,NSCC_PEND_CD                                                
                   ,NSCC_ACK_IND                                                
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,ACCT_EQUITY_AMT                                             
                   ,ACCT_RB_SEC_IND                                             
                   ,CVRSN_ACCT_NBR                                              
               INTO                                                             
                    :DCLVTRNFR.CLIENT-NBR                                       
                   ,:DCLVTRNFR.ACAT-CONTROL-NBR                                 
                   ,:DCLVTRNFR.SBMTG-PRTCP-NBR                                  
                   ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                               
                   ,:DCLVTRNFR.CONTROL-NBR-STS-CD                               
                   ,:DCLVTRNFR.DLVR-NBR                                         
                   ,:DCLVTRNFR.DLVR-NBR-STTS-CD                                 
                   ,:DCLVTRNFR.ACCT-DLVR-NBR                                    
                   ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                                
                   ,:DCLVTRNFR.RCV-NBR                                          
                   ,:DCLVTRNFR.RCV-NBR-STTS-CD                                  
                   ,:DCLVTRNFR.ACCT-RCV-NBR                                     
                   ,:DCLVTRNFR.ACCT-RCV-STTS-CD                                 
                   ,:DCLVTRNFR.TRNFR-TYPE-CD                                    
                   ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                               
                   ,:DCLVTRNFR.TRANS-TYPE-CD                                    
                   ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                               
                   ,:DCLVTRNFR.RCV-CUST-NM                                      
                   ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                               
                   ,:DCLVTRNFR.RCV-SS-PRIM-NBR                                  
                   ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                               
                   ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                                 
                   ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                               
                   ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                                 
                   ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                               
                   ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                                 
                   ,:DCLVTRNFR.RCV-OCC-STTS-CD                                  
                   ,:DCLVTRNFR.RCV-CRSPN-NBR                                    
                   ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                                
                   ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                               
                   ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                                
                   ,:DCLVTRNFR.CMNT-TXT                                         
                   ,:DCLVTRNFR.CMNT-STTS-CD                                     
                   ,:DCLVTRNFR.PRCS-DT                                          
                   ,:DCLVTRNFR.STTS-CD                                          
                   ,:DCLVTRNFR.STTLM-TM-CD                                      
                   ,:DCLVTRNFR.VAL-FREE-CD                                      
                   ,:DCLVTRNFR.TRANS-RFRN-ID-CD                                 
                   ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                               
                   ,:DCLVTRNFR.DB-CR-CD                                         
                   ,:DCLVTRNFR.DSTBN-SIDE-CD                                    
                   ,:DCLVTRNFR.SYS-ACT-CD                                       
                   ,:DCLVTRNFR.SYS-RJCT-RSN-CD                                  
                   ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                               
                   ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                               
                   ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                               
                   ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                               
                   ,:DCLVTRNFR.PHSCL-SEQ-NBR                                    
                   ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                                
                   ,:DCLVTRNFR.LGCL-SEQ-NBR                                     
                   ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                               
                   ,:DCLVTRNFR.RR-CD                                            
                   ,:DCLVTRNFR.BRANCH-CD                                        
                   ,:DCLVTRNFR.DVDND-NAA-CD                                     
                   ,:DCLVTRNFR.SELL-INSTN-NAA-CD                                
                   ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                                
                   ,:DCLVTRNFR.PRTCP-CONTRA-CD                                  
                   ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                                
                   ,:DCLVTRNFR.ACCT-ACTIVITY-IND                                
                   ,:DCLVTRNFR.ACCT-ORDERS-IND                                  
                   ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                               
                   ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                               
                   ,:DCLVTRNFR.ACCT-MRGN-DB-IND                                 
                   ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                               
                   ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                               
                   ,:DCLVTRNFR.ACCT-AST-EXCS-IND                                
                   ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                               
                   ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                               
                   ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                               
                   ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                               
                   ,:DCLVTRNFR.ACCT-CUST-70-IND                                 
                   ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                               
                   ,:DCLVTRNFR.ACCT-MNGD-IND                                    
                   ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                                
                   ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                                
                   ,:DCLVTRNFR.NSCC-NON-ADP-IND                                 
                   ,:DCLVTRNFR.CYCLE-CD                                         
                   ,:DCLVTRNFR.DAYS-STTS-QTY                                    
                   ,:DCLVTRNFR.STTLM-DT                                         
                   ,:DCLVTRNFR.ACCT-NA-UPDT-IND                                 
                   ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                               
                   ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                               
                   ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                               
                   ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                               
                   ,:DCLVTRNFR.ACCT-CD                                          
                   ,:DCLVTRNFR.STTLM-ASCTD-DT                                   
                   ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                               
                   ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                               
                   ,:DCLVTRNFR.RCRD-STTS-CD                                     
                   ,:DCLVTRNFR.NSCC-PEND-CD                                     
                   ,:DCLVTRNFR.NSCC-ACK-IND                                     
                   ,:DCLVTRNFR.CICS-TERM-ID-CD                                  
                   ,:DCLVTRNFR.PRGM-NM                                          
                   ,:DCLVTRNFR.CRT-TMSTP                                        
                   ,:DCLVTRNFR.UPDT-TMSTP                                       
                   ,:DCLVTRNFR.ACCT-EQUITY-AMT                                  
                   ,:DCLVTRNFR.ACCT-RB-SEC-IND                                  
                   ,:DCLVTRNFR.CVRSN-ACCT-NBR                                   
               FROM  VTRNFR                                                     
               WHERE CLIENT_NBR       = :SORT-KEY-CLIENT-NBR                    
                 AND ACAT_CONTROL_NBR = :NSCC-ACAT-CTL-NBR                      
           END-EXEC.                                                            
                                                                                
       2500-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
      ***WHEN TRANSFER IS FROM A PREVIOUS DAY,                                  
      ***FORMAT A TI RECORD BASED ON THE ROW FROM THE DATABASE                  
       2600-MOVE-VTRNFR-DATA.                                                   
           SET W-TI-TI-LEN TO TRUE                                              
           MOVE DSTBN-SIDE-CD      OF DCLVTRNFR TO W-TI-DIST-SIDE               
           MOVE ACAT-CONTROL-NBR   OF DCLVTRNFR TO W-TI-ACAT-CTL-NBR            
           MOVE 000000                          TO W-TI-ASSET-SEQ-NBR           
           MOVE PRCS-DT            OF DCLVTRNFR TO W-TI-PROC-DATE.              
           MOVE NSCC-CYCLE                      TO W-TI-CYCLE                   
           MOVE SYS-ACT-CD         OF DCLVTRNFR TO W-TI-SYSTEM-ACTION           
           MOVE SYS-RJCT-RSN-CD    OF DCLVTRNFR TO W-TI-SYSTEM-REJ-RSN          
           MOVE STTS-CD            OF DCLVTRNFR TO W-TI-STATUS                  
           MOVE DAYS-STTS-QTY      OF DCLVTRNFR TO W-TI-DAYS-IN-STATUS          
           MOVE ' '                             TO W-TI-REG-IND                 
           MOVE TRANS-TYPE-CD      OF DCLVTRNFR TO W-TI-TI-TRAN-TYPE            
           MOVE ACAT-CONTROL-NBR   OF DCLVTRNFR TO W-TI-TI-ACAT-CTL-NBR         
           MOVE TRNFR-TYPE-CD      OF DCLVTRNFR TO W-TI-TI-TFR-TYPE             
           MOVE SBMTG-PRTCP-NBR    OF DCLVTRNFR TO W-TI-TI-SUB-PART-NBR         
           MOVE RCV-NBR            OF DCLVTRNFR TO W-TI-TI-RCV-NBR              
           MOVE DLVR-NBR           OF DCLVTRNFR TO W-TI-TI-DEL-NBR              
           IF   W-TI-DIST-SIDE = 'D'                                            
                MOVE W-TI-TI-DEL-NBR    TO W-TI-DIST-PARTICIPANT                
           ELSE                                                                 
                MOVE W-TI-TI-RCV-NBR    TO W-TI-DIST-PARTICIPANT                
           END-IF                                                               
           MOVE ACCT-RCV-NBR       OF DCLVTRNFR TO W-TI-TI-RCV-ACCT-NBR         
           MOVE RCV-CUST-NM        OF DCLVTRNFR TO W-TI-TI-RCV-CUS-NAME         
           MOVE RCV-SS-PRIM-NBR    OF DCLVTRNFR TO W-TI-TI-RCV-SSN-PRM          
           MOVE RCV-SS-SCNDY-NBR   OF DCLVTRNFR TO W-TI-TI-RCV-SSN-SEC          
           MOVE RCV-ACCT-TYPE-CD   OF DCLVTRNFR TO W-TI-TI-RCV-ACCT-TYPE        
           MOVE RCV-OCC-BRKR-NBR   OF DCLVTRNFR TO W-TI-TI-RCV-OCC-BRKR         
           MOVE RCV-CRSPN-NBR      OF DCLVTRNFR TO W-TI-TI-RCV-CRSPN-NBR        
           MOVE PRTCP-CONTRA-CD OF DCLVTRNFR TO W-TI-TI-CONTRA-PART-TYPE        
           MOVE ACCT-DLVR-NBR      OF DCLVTRNFR TO W-TI-TI-DEL-ACCT-NBR         
           MOVE TRNFR-TYPE-RJCT-CD OF DCLVTRNFR TO W-TI-TI-TFR-TYPE-REJ         
           MOVE ACAT-CNTL-ASTD-NBR OF DCLVTRNFR TO W-TI-TI-ASSC-CTL-NBR         
           MOVE STTLM-ASCTD-DT     OF DCLVTRNFR TO W-TI-TI-ASSC-STL-DT.         
           MOVE TRANS-RFRN-ID-CD   OF DCLVTRNFR TO W-TI-TI-TRAN-REF-ID          
           MOVE CMNT-TXT           OF DCLVTRNFR TO W-TI-TI-COMMENTS.            
                                                                                
           MOVE SORT-KEY-CLIENT-NBR             TO W-TI-KEY-CLIENT-NBR          
           MOVE W-TI-DIST-SIDE                  TO W-TI-KEY-SIDE                
           MOVE NSCC-AT-TFR-TYPE                TO W-TI-KEY-TFR-TYPE            
           MOVE ' '                             TO W-TI-KEY-ACCT-NBR            
           IF   W-TI-DIST-SIDE = 'D'                                            
                MOVE W-TI-TI-DEL-ACCT-NBR       TO W-TI-KEY-ACCT-NBR            
           ELSE                                                                 
                MOVE W-TI-TI-RCV-ACCT-NBR       TO W-TI-KEY-ACCT-NBR            
           END-IF                                                               
           MOVE NSCC-PROC-DATE                  TO W-TI-KEY-PROC-DATE           
           MOVE NSCC-CYCLE                      TO W-TI-KEY-CYCLE               
           MOVE '1T'                            TO W-TI-KEY-REC-TYPE            
           MOVE NSCC-ACAT-CTL-NBR              TO W-TI-KEY-ACAT-CTL-NBR.        
                                                                                
       2600-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       3000-READ-INPUT.                                                         
                                                                                
           IF  END-OF-INFILE                                                    
               GO 3000-EXIT                                                     
           END-IF.                                                              
                                                                                
           READ INFILE                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INFILE-SW                    
                   DISPLAY 'CAT765CV: END OF INPUT REACHED'                     
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           ADD  1                        TO W-INFILE-CNT.                       
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT765CV: ERROR READING INFILE'                         
               DISPLAY 'CAT765CV: READ STATUS = ' INFILE-STAT                   
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT765CV: U3008 - ABENDING ON BAD FILE STATUS'          
               MOVE +3008 TO ABEND-CODE                                         
               PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT                        
           END-IF.                                                              
                                                                                
       3000-EXIT.                                                               
           EXIT.                                                                
                                                                                
       5000-SORT-OUTPUT.                                                        
           DISPLAY ' '                                                          
           DISPLAY '5000-SORT-OUTPUT'.                                          
                                                                                
           PERFORM 5100-RETURN-SORT THRU 5100-EXIT                              
                                                                                
           PERFORM UNTIL END-OF-SORT                                            
                                                                                
               IF  B1-PRT-SUB   < W-SORT-KEY-CLIENT-NBR-N                       
                   PERFORM 6000-CLT-BREAK     THRU 6000-EXIT                    
               END-IF                                                           
                                                                                
               PERFORM 7000-WRITE-OUTFILE THRU 7000-EXIT                        
               PERFORM 7200-WRITE-OREPORT THRU 7200-EXIT                        
                                                                                
               IF NOT END-OF-SORT                                               
                  PERFORM 5100-RETURN-SORT   THRU 5100-EXIT                     
               END-IF                                                           
                                                                                
           END-PERFORM.                                                         
                                                                                
           PERFORM 6000-CLT-BREAK     THRU 6000-EXIT.                           
                                                                                
       5000-EXIT.                                                               
           EXIT.                                                                
                                                                                
       5100-RETURN-SORT.                                                        
                                                                                
           RETURN SORT-FILE                                                     
               AT END                                                           
                     SET END-OF-SORT TO TRUE                                    
                     MOVE 0500 TO SORT-KEY-CLIENT-NBR-N                         
                                W-SORT-KEY-CLIENT-NBR-N                         
                     DISPLAY 'CAT765CV: END OF SORT '                           
                                   ' RET=' W-RETURN-CNT                         
                   GO TO 5100-EXIT.                                             
                                                                                
           MOVE SORT-RECORD              TO OUTFILE-RECORD.                     
           MOVE SORT-RECORD              TO W-SORT-RECORD.                      
           IF  SORT-KEY-REC-TYPE-IS-TI                                          
               MOVE SORT-RECORD            TO W-TI-RECORD                       
           END-IF.                                                              
                                                                                
           ADD  1                        TO W-RETURN-CNT.                       
                                                                                
       5100-EXIT. EXIT.                                                         
      /                                                                         
       6000-CLT-BREAK.                                                          
           DISPLAY '6000-CLT-BREAK'                                             
               '  NEXT CLIENT= ' W-SORT-KEY-CLIENT-NBR-N                        
               '  PREV B1-PRT-SUB= ' B1-PRT-SUB.                                
                                                                                
       6000-LOOP.                                                               
                                                                                
           IF  B1-PRT-SUB < W-SORT-KEY-CLIENT-NBR-N                             
               IF  B1-ACAT-STATUS (B1-PRT-SUB) = 'A'                            
                   IF B1-PRINT    (B1-PRT-SUB) NOT = '1'                        
                      PERFORM 7500-WRITE-NO-ACT THRU 7500-EXIT                  
                   END-IF                                                       
               END-IF                                                           
               IF  B1-PRT-SUB < 500                                             
                   ADD 1 TO B1-PRT-SUB                                          
                   MOVE 0                    TO W-PAGE-CNT                      
                   MOVE 60                   TO W-LINE-CNT                      
                   GO TO 6000-LOOP                                              
               END-IF                                                           
           END-IF.                                                              
                                                                                
           DISPLAY '6000-CLT-BREAK'                                             
               '  NEXT CLIENT= ' W-SORT-KEY-CLIENT-NBR-N                        
               '  NEXT B1-PRT-SUB= ' B1-PRT-SUB.                                
                                                                                
           IF  B1-PRT-SUB = W-SORT-KEY-CLIENT-NBR-N                             
           AND B1-ACAT-STATUS (B1-PRT-SUB) = 'A'                                
            DISPLAY 'CAT765CV: '                                                
                        B1-PRT-SUB                                              
                    ' ' B1-CLT-NAME (B1-PRT-SUB)                                
                    ' PROCESSING ............'                                  
           END-IF.                                                              
                                                                                
       6000-EXIT. EXIT.                                                         
      /                                                                         
      ***WRITE OUTPUT FILE                                                      
       7000-WRITE-OUTFILE.                                                      
                                                                                
           WRITE OUTFILE-RECORD.                                                
           ADD 1 TO W-OUTFILE-CNT.                                              
                                                                                
       7000-EXIT. EXIT.                                                         
      /                                                                         
      ***WRITE REPORT                                                           
       7200-WRITE-OREPORT.                                                      
           MOVE '1' TO B1-PRINT(B1-PRT-SUB)                                     
           IF W-SORT-KEY-CLIENT-NBR NUMERIC                                     
              IF W-SORT-KEY-REC-TYPE-IS-TI                                      
                 MOVE SORT-RECORD            TO W-TI-RECORD                     
                 IF (W-SORT-KEY-CLIENT-NBR NOT = W-REPT-CLT)                    
                     MOVE 0                    TO W-PAGE-CNT                    
                 END-IF                                                         
                 PERFORM 7610-ASSET-HEADING THRU 7610-EXIT                      
              ELSE                                                              
                 IF W-SORT-KEY-REC-TYPE-IS-AT                                   
                    PERFORM 7300-ASSET-REPORT THRU 7300-EXIT                    
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
       7200-EXIT. EXIT.                                                         
      /                                                                         
      ***ASSET REPORT                                                           
       7300-ASSET-REPORT.                                                       
                                                                                
           ADD  1                        TO W-OREPORT-CNT.                      
           IF (W-SORT-KEY-CLIENT-NBR NOT = W-REPT-CLT)                          
           OR (W-SORT-KEY-CYCLE      NOT = W-REPT-CYCLE)                        
           OR (W-SORT-KEY-SIDE       NOT = W-REPT-SIDE)                         
           OR (W-SORT-KEY(1:30)      NOT = W-SAVE-KEY)                          
               PERFORM 7610-ASSET-HEADING THRU 7610-EXIT                        
           ELSE                                                                 
               IF W-LINE-CNT > 52                                               
                  PERFORM 7610-ASSET-HEADING THRU 7610-EXIT                     
               END-IF                                                           
           END-IF.                                                              
                                                                                
           PERFORM 7310-ASSET-DETAIL     THRU 7310-EXIT.                        
                                                                                
       7300-EXIT. EXIT.                                                         
      /                                                                         
       7310-ASSET-DETAIL.                                                       
           IF (W-SORT-AT-STL-LOC        NOT = W-SAVE-AT-STL-LOC)                
           OR (W-SORT-AT-STL-LOC-RSN-CD NOT = W-SAVE-AT-STL-LOC-RSN-CD)         
              EVALUATE TRUE                                                     
               WHEN W-SORT-AT-CNS                                               
                    MOVE 'CNS ------'          TO W-AST-HDR9-STL-LOC            
               WHEN W-SORT-AT-FUND-SERV                                         
                    MOVE 'FUND/SERV ------'    TO W-AST-HDR9-STL-LOC            
               WHEN W-SORT-AT-PTC                                               
                    MOVE 'PTC ------'          TO W-AST-HDR9-STL-LOC            
               WHEN W-SORT-AT-GSCC                                              
                    MOVE 'GDCC ------'         TO W-AST-HDR9-STL-LOC            
               WHEN W-SORT-AT-DTC                                               
                    MOVE 'DTC ------'          TO W-AST-HDR9-STL-LOC            
               WHEN W-SORT-AT-UNDELIVERABLE                                     
                    MOVE 'UNDELIVERABLE------' TO W-AST-HDR9-STL-LOC            
               WHEN W-SORT-AT-OCC                                               
                    MOVE 'OCC (XXXX) ------'   TO W-AST-HDR9-STL-LOC            
                    MOVE W-SORT-AT-STL-LOC-RSN-CD                               
                                            TO W-AST-HDR9-STL-LOC(6:4)          
               WHEN W-SORT-AT-CASH-BALANCE                                      
                    MOVE 'CASH BALANCE ------'                                  
                                            TO W-AST-HDR9-STL-LOC               
               WHEN W-SORT-AT-MEMO                                              
                    MOVE 'MEMO (XXXX) ------' TO W-AST-HDR9-STL-LOC             
                    MOVE W-SORT-AT-STL-LOC-RSN-CD                               
                                            TO W-AST-HDR9-STL-LOC(7:4)          
               WHEN W-SORT-AT-R-D                                               
                    MOVE 'R&D (XXXX) ------' TO W-AST-HDR9-STL-LOC              
                    MOVE W-SORT-AT-STL-LOC-RSN-CD                               
                                            TO W-AST-HDR9-STL-LOC(6:4)          
               WHEN OTHER                                                       
                    MOVE '??? ------'       TO W-AST-HDR9-STL-LOC               
              END-EVALUATE                                                      
**************MOVE W-SORT-AT-STL-LOC-RSN-CD TO W-AST-HDR9-STL-LOC-RSN           
                                                                                
              MOVE W-AST-HDR9-REC        TO W-REPORT-LINE                       
              PERFORM 7600-WRITE-LINE THRU 7600-EXIT                            
           END-IF.                                                              
           MOVE W-SORT-AT-STL-LOC        TO W-SAVE-AT-STL-LOC.                  
           MOVE W-SORT-AT-STL-LOC-RSN-CD TO W-SAVE-AT-STL-LOC-RSN-CD.           
                                                                                
           MOVE ' ' TO W-A1-REC                                                 
           MOVE W-SORT-AT-ASSET-SEQ-NBR  TO W-A1-ASSET-SEQ-NBR                  
           IF  W-SORT-AT-ASSET-PCT > ZEROES                                     
               PERFORM 7420-REFORMAT-ASSET-PCT THRU 7420-EXIT                   
               MOVE W-QTY-N              TO W-ASSET-QTY-X                       
               MOVE W-ASSET-QTY-X        TO W-A1-ASSET-QTY                      
               MOVE '%'                  TO W-A1-ASSET-PCT-LIT                  
           ELSE                                                                 
               PERFORM 7410-REFORMAT-ASSET-QTY THRU 7410-EXIT                   
               MOVE W-QTY-N              TO W-ASSET-QTY-X                       
               IF W-SORT-AT-ASSET-QTY NOT = '00000000000000000'                 
                  MOVE W-ASSET-QTY-X     TO W-A1-ASSET-QTY                      
               END-IF                                                           
               IF W-SORT-AT-POS-CD = 'S'                                        
                  MOVE '-'               TO W-A1-ASSET-PSTN-CD                  
               END-IF                                                           
           END-IF                                                               
           IF W-SORT-AT-CASH-BALANCE                                            
               MOVE 'CASH'                   TO W-A1-ASSET-ID                   
           ELSE                                                                 
             IF W-SORT-AT-OCC                                                   
                 MOVE 'OPTION'                 TO W-A1-ASSET-ID                 
             END-IF                                                             
           END-IF.                                                              
           IF W-SORT-AT-SEC-ID > ' '                                            
              MOVE W-SORT-AT-SEC-CNTRY-CD TO W-A1-SEC-CNTRY-CD                  
              MOVE '-'                    TO W-A1-SEC-D1                        
              MOVE W-SORT-AT-SEC-ID       TO W-A1-SEC-ID                        
              MOVE '-'                    TO W-A1-SEC-D2                        
              MOVE W-SORT-AT-SEC-CHKDGT   TO W-A1-SEC-CHKDGT                    
           END-IF                                                               
           MOVE W-SORT-AT-ASSET-DESC     TO W-A1-ASSET-DESC                     
           IF W-SORT-AT-OCC                                                     
           AND W-SORT-ATO-OPT-SYM > ' '                                         
              MOVE W-SORT-ATO-OPT-SYM        TO W-A1-ATO-OPT-SYM                
             MOVE W-SORT-ATO-OPT-EXP-DT(1:2) TO W-A1-ATO-OPT-EXP-DT(1:2)        
             MOVE '/'                        TO W-A1-ATO-OPT-EXP-DT(3:1)        
             MOVE W-SORT-ATO-OPT-EXP-DT(5:2) TO W-A1-ATO-OPT-EXP-DT(4:2)        
             MOVE W-SORT-ATO-OPT-EXP-DT(3:2) TO W-A1-ATO-OPT-EXP-DT(6:2)        
              MOVE W-SORT-ATO-OPT-STKPRC-INT TO W-A1-ATO-OPT-STKPRC-INT         
              EVALUATE W-SORT-ATO-OPT-STKPRC-FRC                                
                  WHEN '00'                                                     
                       MOVE ' '              TO W-A1-ATO-OPT-STKPRC-FRC         
                  WHEN '01'                                                     
                       MOVE '1/8'            TO W-A1-ATO-OPT-STKPRC-FRC         
                  WHEN '02'                                                     
                       MOVE '1/4'            TO W-A1-ATO-OPT-STKPRC-FRC         
                  WHEN '03'                                                     
                       MOVE '3/8'            TO W-A1-ATO-OPT-STKPRC-FRC         
                  WHEN '04'                                                     
                       MOVE '1/2'            TO W-A1-ATO-OPT-STKPRC-FRC         
                  WHEN '05'                                                     
                       MOVE '5/8'            TO W-A1-ATO-OPT-STKPRC-FRC         
                  WHEN '06'                                                     
                       MOVE '3/4'            TO W-A1-ATO-OPT-STKPRC-FRC         
                  WHEN '07'                                                     
                       MOVE '7/8'            TO W-A1-ATO-OPT-STKPRC-FRC         
                  WHEN OTHER                                                    
                       MOVE '   '            TO W-A1-ATO-OPT-STKPRC-FRC         
              END-EVALUATE                                                      
           END-IF                                                               
           IF  W-SORT-AT-ASSET-AMT = '00000000000000,00'                        
           OR  W-SORT-AT-ASSET-AMT = '00000000000000000'                        
               CONTINUE                                                         
           ELSE                                                                 
               PERFORM 7430-REFORMAT-ASSET-AMT THRU 7430-EXIT                   
               MOVE W-QTY-N              TO W-ASSET-AMT-X                       
               MOVE W-ASSET-AMT-X        TO W-A1-ASSET-AMT                      
           END-IF                                                               
           MOVE W-SORT-AT-ISO-CURCY-CD    TO W-A1-ISO-CURCY-CD                  
           MOVE W-SORT-AT-CASH-MRGN-SHTCD TO W-A1-CASH-MRGN-SHTCD               
                                                                                
           IF W-SORT-AT-OCC                                                     
                  MOVE ' ' TO W-A1-ADDITIONAL-INFO                              
                  IF W-SORT-ATO-OPT-BUY                                         
                     MOVE 'BUY '  TO W-A1-ATO-BUY-SELL                          
                  ELSE                                                          
                     IF W-SORT-ATO-OPT-SELL                                     
                        MOVE 'SELL'  TO W-A1-ATO-BUY-SELL                       
                     END-IF                                                     
                  END-IF                                                        
                  IF W-SORT-ATO-OPT-CALL                                        
                     MOVE 'CALL'  TO W-A1-ATO-CALL-PUT                          
                  ELSE                                                          
                     IF W-SORT-ATO-OPT-PUT                                      
                        MOVE 'PUT '  TO W-A1-ATO-CALL-PUT                       
                     END-IF                                                     
                  END-IF                                                        
                  IF W-SORT-ATO-OPT-CALL                                        
                     MOVE 'OPEN ' TO W-A1-ATO-OPEN-CLOSE                        
                  ELSE                                                          
                     IF W-SORT-ATO-OPT-CLOSE                                    
                        MOVE 'CLOSE' TO W-A1-ATO-OPEN-CLOSE                     
                     END-IF                                                     
                  END-IF                                                        
                  IF W-SORT-AT-EQUITY-OPT                                       
                     MOVE 'EQUITY' TO W-A1-ATO-EQUITY                           
                  END-IF                                                        
           ELSE                                                                 
             IF W-SORT-MEM-PART-TFR-REQ                                         
                IF W-SORT-AT-CASH-BALANCE                                       
                      MOVE 'AMOUNT REQUESTED'  TO W-A1-ADDITIONAL-INFO          
                ELSE                                                            
                   IF W-SORT-AT-ASSET-PCT > ZEROES                              
                      MOVE 'PERCENT REQUESTED' TO W-A1-ADDITIONAL-INFO          
                   ELSE                                                         
                      MOVE 'SHARES REQUESTED'  TO W-A1-ADDITIONAL-INFO          
                   END-IF                                                       
                END-IF                                                          
             ELSE                                                               
                IF W-SORT-AT-POS-CD = 'S'                                       
                   MOVE 'SHORT POSITION'  TO W-A1-ADDITIONAL-INFO               
                END-IF                                                          
             END-IF                                                             
           END-IF.                                                              
           MOVE W-A1-REC                 TO W-REPORT-LINE                       
           PERFORM 7600-WRITE-LINE THRU 7600-EXIT                               
                                                                                
           IF W-SORT-AT-ASSET-DESC(31:30) > ' '                                 
              MOVE ' '                   TO W-A1-REC                            
              MOVE W-SORT-AT-ASSET-DESC(31:30) TO W-A1-ASSET-DESC               
              MOVE W-A1-REC              TO W-REPORT-LINE                       
              PERFORM 7600-WRITE-LINE THRU 7600-EXIT                            
           END-IF                                                               
           IF W-SORT-AT-ASSET-DESC(61:30) > ' '                                 
              MOVE ' '                   TO W-A1-REC                            
              MOVE W-SORT-AT-ASSET-DESC(61:30) TO W-A1-ASSET-DESC               
              MOVE W-A1-REC              TO W-REPORT-LINE                       
              PERFORM 7600-WRITE-LINE THRU 7600-EXIT                            
           END-IF                                                               
           IF W-SORT-AT-ASSET-DESC(91:30) > ' '                                 
              MOVE ' '                   TO W-A1-REC                            
              MOVE W-SORT-AT-ASSET-DESC(91:30) TO W-A1-ASSET-DESC               
              MOVE W-A1-REC              TO W-REPORT-LINE                       
              PERFORM 7600-WRITE-LINE THRU 7600-EXIT                            
           END-IF                                                               
           IF W-SORT-AT-ASSET-DESC(121:20) > ' '                                
              MOVE ' '                   TO W-A1-REC                            
              MOVE W-SORT-AT-ASSET-DESC(121:20) TO W-A1-ASSET-DESC              
              MOVE W-A1-REC              TO W-REPORT-LINE                       
              PERFORM 7600-WRITE-LINE THRU 7600-EXIT                            
           END-IF                                                               
                                                                                
           MOVE ' ' TO W-A2-REC                                                 
           EVALUATE TRUE                                                        
               WHEN W-SORT-AT-ADD                                               
                    MOVE 'ADDED      ' TO W-A2-ACTION                           
               WHEN W-SORT-AT-CHANGE                                            
                    MOVE 'CHANGED    ' TO W-A2-ACTION                           
               WHEN W-SORT-AT-DELETE                                            
                    MOVE 'DELETED    ' TO W-A2-ACTION                           
               WHEN OTHER                                                       
                    MOVE '           ' TO W-A2-ACTION                           
           END-EVALUATE.                                                        
           IF (W-SORT-MEM-PART-TFR-REQ                                          
           AND W-SORT-AT-OCC)                                                   
               IF W-SORT-AT-CASH-BALANCE                                        
                     MOVE 'AMOUNT REQUESTED'  TO W-A2-ADDITIONAL-INFO           
               ELSE                                                             
                  IF W-SORT-AT-ASSET-PCT > ZEROES                               
                     MOVE 'PERCENT REQUESTED' TO W-A2-ADDITIONAL-INFO           
                  ELSE                                                          
                     MOVE 'SHARES REQUESTED'  TO W-A2-ADDITIONAL-INFO           
                  END-IF                                                        
               END-IF                                                           
           ELSE                                                                 
               IF  W-SORT-AT-ASST-COMMENT  > ' '                                
                   MOVE 'COMMENT: ' TO W-A2-COMMENT-LIT                         
                   MOVE W-SORT-AT-ASST-COMMENT (1:60) TO W-A2-COMMENT           
               END-IF                                                           
           END-IF.                                                              
           MOVE W-A2-REC                 TO W-REPORT-LINE                       
           PERFORM 7600-WRITE-LINE THRU 7600-EXIT                               
                                                                                
           IF NOT (W-SORT-MEM-PART-TFR-REQ                                      
                   AND W-SORT-AT-OCC)                                           
             IF W-SORT-AT-ASST-COMMENT (61:60) > ' '                            
                MOVE ' '        TO W-A2-REC                                     
                MOVE W-SORT-AT-ASST-COMMENT (61:60) TO W-A2-COMMENT             
                MOVE W-A2-REC              TO W-REPORT-LINE                     
                PERFORM 7600-WRITE-LINE THRU 7600-EXIT                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF (W-SORT-MEM-PART-TFR-REQ                                          
               AND W-SORT-AT-OCC)                                               
            IF W-SORT-AT-ASST-COMMENT  > ' '                                    
               MOVE 'COMMENT: ' TO W-A2-COMMENT-LIT                             
               MOVE W-SORT-AT-ASST-COMMENT (1:60) TO W-A2-COMMENT               
               MOVE W-A2-REC              TO W-REPORT-LINE                      
                PERFORM 7600-WRITE-LINE THRU 7600-EXIT                          
               IF W-SORT-AT-ASST-COMMENT (61:60) > ' '                          
                  MOVE ' '        TO W-A2-REC                                   
                  MOVE W-SORT-AT-ASST-COMMENT (61:60) TO W-A2-COMMENT           
                  MOVE W-A2-REC              TO W-REPORT-LINE                   
                PERFORM 7600-WRITE-LINE THRU 7600-EXIT                          
               END-IF                                                           
            END-IF                                                              
           END-IF.                                                              
                                                                                
           IF  W-SORT-ATO-OPT-COMMENT  > ' '                                    
               MOVE ' '        TO W-A2-REC                                      
               MOVE 'COMMENT: ' TO W-A2-COMMENT-LIT                             
               MOVE W-SORT-ATO-OPT-COMMENT   TO W-A2-COMMENT                    
               MOVE W-A2-REC                 TO W-REPORT-LINE                   
                PERFORM 7600-WRITE-LINE THRU 7600-EXIT                          
           END-IF.                                                              
                                                                                
           IF W-SORT-SYSTEM-ACTION = '2'                                        
              MOVE ' '        TO W-A2-REC                                       
              MOVE 'SYS REJ XX:'         TO W-A2-FLD-REJ-CMNT                   
              MOVE W-SORT-SYSTEM-REJ-RSN TO W-A2-FLD-REJ-CMNT(9:2)              
              EVALUATE TRUE                                                     
               WHEN W-SORT-INV-FLD                                              
               MOVE 'INV-FLD                    ' TO W-A2-REJ-MSG               
               WHEN W-SORT-MISSED-CUTOFF                                        
               MOVE 'MISSED-CUTOFF              ' TO W-A2-REJ-MSG               
               WHEN W-SORT-ASSOC-REC-NOT-PRSNT                                  
               MOVE 'ASSOC-REC-NOT-PRSNT        ' TO W-A2-REJ-MSG               
               WHEN W-SORT-PHY-REC-OUT-OF-SEQ                                   
               MOVE 'PHY-REC-OUT-OF-SEQ         ' TO W-A2-REJ-MSG               
               WHEN W-SORT-INV-PHY-SEQ-NBR                                      
               MOVE 'INV-PHY-SEQ-NBR            ' TO W-A2-REJ-MSG               
               WHEN W-SORT-LOG-REC-OUT-OF-SEQ                                   
               MOVE 'LOG-REC-OUT-OF-SEQ         ' TO W-A2-REJ-MSG               
               WHEN W-SORT-INV-LOG-SEQ-NBR                                      
               MOVE 'INV-LOG-SEQ-NBR            ' TO W-A2-REJ-MSG               
               WHEN W-SORT-INV-LEN-REC                                          
               MOVE 'INV-LEN-REC                ' TO W-A2-REJ-MSG               
               WHEN W-SORT-INV-REC-CONTENTS                                     
               MOVE 'INV-REC-CONTENTS           ' TO W-A2-REJ-MSG               
               WHEN W-SORT-INV-ADD-REC-EXIST                                    
               MOVE 'INV-ADD-REC-EXIST          ' TO W-A2-REJ-MSG               
               WHEN W-SORT-INV-CHG-REC-NOT-EXST                                 
               MOVE 'INV-CHG-REC-NOT-EXIST      ' TO W-A2-REJ-MSG               
               WHEN W-SORT-INV-DEL-REC-NOT-EXST                                 
               MOVE 'INV-DEL-REC-NOT-EXIST      ' TO W-A2-REJ-MSG               
               WHEN W-SORT-REQ-ACT-INV-TRN-STAT                                 
               MOVE 'REQ-ACT-INV-TRN-STAT       ' TO W-A2-REJ-MSG               
               WHEN W-SORT-TRN-INV-CONTRA-PART                                  
               MOVE 'TRN-INV-CONTRA-PART        ' TO W-A2-REJ-MSG               
               WHEN W-SORT-TRN-INV-SUBMIT-PART                                  
               MOVE 'TRN-INV-SUBMIT-PART        ' TO W-A2-REJ-MSG               
               WHEN W-SORT-INV-PARTICIPANT                                      
               MOVE 'INV-PARTICIPANT            ' TO W-A2-REJ-MSG               
               WHEN W-SORT-NON-STD-INV-PHY-SEQ                                  
               MOVE 'NON-STD INV PHYSICAL SEQ   ' TO W-A2-REJ-MSG               
               WHEN W-SORT-NON-STD-INV-AST-TYP                                  
               MOVE 'NON-STD INV ASSET TYPE     ' TO W-A2-REJ-MSG               
               WHEN OTHER                                                       
               MOVE '                          '  TO W-A2-REJ-MSG               
              END-EVALUATE                                                      
               MOVE W-A2-REC                 TO W-REPORT-LINE                   
                PERFORM 7600-WRITE-LINE THRU 7600-EXIT                          
           END-IF.                                                              
                                                                                
       7310-EXIT. EXIT.                                                         
      /                                                                 15430001
      ***************************************************************** 15440001
      *  REFORMAT ASSET QTY - UP TO 4 DECIMAL PLACES                    15450001
      ***************************************************************** 15460001
       7410-REFORMAT-ASSET-QTY  SECTION.                                15470001
                                                                        15480001
           MOVE W-SORT-AT-ASSET-QTY      TO W-QTY-X                     15490001
           MOVE 0                        TO W-INT                       15500001
                                            W-DEC                       15510001
                                            W-QTY-N                     15520001
           MOVE ' '                      TO W-COMMA-FND-SW              15530001
                                                                        15540001
           PERFORM VARYING W-COMMA-PTR FROM 1 BY 1                      15550001
                     UNTIL W-COMMA-PTR > 17 OR W-COMMA-FND-SW = 'Y'     15560001
                        IF W-QTY-BYTE(W-COMMA-PTR) = ','                15570001
                           MOVE 'Y'      TO W-COMMA-FND-SW              15580001
                        END-IF                                          15590001
           END-PERFORM                                                  15600001
                                                                        15610001
           IF  W-COMMA-FND-SW = 'Y'                                     15620001
               MOVE 17                   TO W-INT-PTR                   15630001
               MOVE W-COMMA-PTR TO W-QTY-PTR                            15640001
               SUBTRACT 2     FROM W-QTY-PTR                            15650001
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY -1           15660001
                       UNTIL W-QTY-PTR = 0                              15670001
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       15680001
                                         TO W-INT-BYTE(W-INT-PTR)       15690001
                       SUBTRACT 1 FROM W-INT-PTR                        15700001
               END-PERFORM                                              15710001
               MOVE 1                    TO W-DEC-PTR                   15720001
               MOVE W-COMMA-PTR TO W-QTY-PTR                            15730001
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY 1            15740001
                       UNTIL (W-DEC-PTR > 4 OR W-QTY-PTR > 17)          15750001
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       15760001
                                         TO W-DEC-BYTE(W-DEC-PTR)       15770001
                       ADD 1        TO W-DEC-PTR                        15780001
               END-PERFORM                                              15790001
           ELSE                                                         15800001
               MOVE W-QTY                TO W-INT                       15810001
           END-IF.                                                      15820001
           MOVE W-INT                    TO W-QTY-INT.                  15830001
           MOVE W-DEC                    TO W-QTY-DEC.                  15840001
LRM        IF W-QTY-N NOT NUMERIC                                       15850001
LRM            MOVE ZEROS TO W-QTY-N                                    15860001
LRM        END-IF.                                                      15930001
                                                                        15940001
       7410-EXIT. EXIT.                                                 15950001
      /                                                                 15960001
      ***************************************************************** 15970001
      *  REFORMAT ASSET PCT - UP TO 4 DECIMAL PLACES                    15980001
      ***************************************************************** 15990001
       7420-REFORMAT-ASSET-PCT  SECTION.                                16000001
                                                                        16010001
           MOVE 0                        TO W-QTY-X                     16020001
           MOVE W-SORT-AT-ASSET-PCT      TO W-QTY-X(03:15)              16030001
           MOVE 0                        TO W-INT                       16040001
                                            W-DEC                       16050001
                                            W-QTY-N                     16060001
           MOVE ' '                      TO W-COMMA-FND-SW              16070001
                                                                        16080001
           PERFORM VARYING W-COMMA-PTR FROM 1 BY 1                      16090001
                     UNTIL W-COMMA-PTR > 17 OR W-COMMA-FND-SW = 'Y'     16100001
                        IF W-QTY-BYTE(W-COMMA-PTR) = ','                16110001
                           MOVE 'Y'      TO W-COMMA-FND-SW              16120001
                        END-IF                                          16130001
           END-PERFORM                                                  16140001
                                                                        16150001
           IF  W-COMMA-FND-SW = 'Y'                                     16160001
               MOVE 17                   TO W-INT-PTR                   16170001
               MOVE W-COMMA-PTR TO W-QTY-PTR                            16180001
               SUBTRACT 2     FROM W-QTY-PTR                            16190001
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY -1           16200001
                       UNTIL W-QTY-PTR = 0                              16210001
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       16220001
                                         TO W-INT-BYTE(W-INT-PTR)       16230001
                       SUBTRACT 1 FROM W-INT-PTR                        16240001
               END-PERFORM                                              16250001
               MOVE 1                    TO W-DEC-PTR                   16260001
               MOVE W-COMMA-PTR TO W-QTY-PTR                            16270001
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY 1            16280001
                       UNTIL W-DEC-PTR > 4 OR W-QTY-PTR > 17            16290001
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       16300001
                                         TO W-DEC-BYTE(W-DEC-PTR)       16310001
                       ADD 1        TO W-DEC-PTR                        16320001
               END-PERFORM                                              16330001
           ELSE                                                         16340001
               MOVE W-QTY                TO W-INT                       16350001
           END-IF.                                                      16360001
           MOVE W-INT                    TO W-QTY-INT.                  16370001
           MOVE W-DEC                    TO W-QTY-DEC.                  16380001
                                                                        16390001
       7420-EXIT. EXIT.                                                 16400001
      /                                                                 16410001
      ***************************************************************** 16420001
      *  REFORMAT ASSET AMT - UP TO 4 DECIMAL PLACES                    16430001
      *                       IF ISO-CURR = USD  - UP TO 2 DECIMAL      16440001
      *                       IF ISO-CURR = FCUR - UP TO 4 DECIMAL      16450001
      ***************************************************************** 16460001
       7430-REFORMAT-ASSET-AMT  SECTION.                                16470001
                                                                        16480001
           MOVE W-SORT-AT-ASSET-AMT      TO W-QTY-X                     16490001
           MOVE 0                        TO W-INT                       16500001
                                            W-DEC                       16510001
                                            W-QTY-N                     16520001
           MOVE ' '                      TO W-COMMA-FND-SW              16530001
                                                                        16540001
           PERFORM VARYING W-COMMA-PTR FROM 1 BY 1                      16550001
                     UNTIL W-COMMA-PTR > 17 OR W-COMMA-FND-SW = 'Y'     16560001
                        IF W-QTY-BYTE(W-COMMA-PTR) = ','                16570001
                           MOVE 'Y'      TO W-COMMA-FND-SW              16580001
                        END-IF                                          16590001
           END-PERFORM                                                  16600001
                                                                        16610001
           IF  W-COMMA-FND-SW = 'Y'                                     16620001
               MOVE 17                   TO W-INT-PTR                   16630001
               MOVE W-COMMA-PTR TO W-QTY-PTR                            16640001
               SUBTRACT 2     FROM W-QTY-PTR                            16650001
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY -1           16660001
                       UNTIL W-QTY-PTR = 0                              16670001
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       16680001
                                         TO W-INT-BYTE(W-INT-PTR)       16690001
                       SUBTRACT 1 FROM W-INT-PTR                        16700001
               END-PERFORM                                              16710001
               MOVE 1                    TO W-DEC-PTR                   16720001
               MOVE W-COMMA-PTR TO W-QTY-PTR                            16730001
               PERFORM VARYING W-QTY-PTR FROM W-QTY-PTR BY 1            16740001
                       UNTIL W-DEC-PTR > 4 OR W-QTY-PTR > 17            16750001
                       MOVE W-QTY-BYTE(W-QTY-PTR)                       16760001
                                         TO W-DEC-BYTE(W-DEC-PTR)       16770001
                       ADD 1        TO W-DEC-PTR                        16780001
               END-PERFORM                                              16790001
           ELSE                                                         16800001
               MOVE W-QTY                TO W-INT                       16810001
           END-IF.                                                      16820001
           MOVE W-INT                    TO W-QTY-INT.                  16830001
           MOVE W-DEC                    TO W-QTY-DEC.                  16840001
LRM        IF W-QTY-N NOT NUMERIC                                       16850001
LRM            MOVE ZEROS TO W-QTY-N                                    16860001
LRM        END-IF.                                                      16930001
                                                                        16940001
       7430-EXIT. EXIT.                                                 16950001
      /                                                                         
       7500-WRITE-NO-ACT.                                                       
                                                                                
           DISPLAY 'CAT765CV: '                                                 
                        B1-PRT-SUB                                              
                    ' ' B1-CLT-NAME (B1-PRT-SUB)                                
                    ' NO ACTIVITY TODAY'.                                       
                                                                                
           MOVE '1' TO B1-PRINT(B1-PRT-SUB)                                     
           MOVE B1-PRT-SUB               TO W-HDR1-CLT                          
           MOVE B1-CLT-NAME(B1-PRT-SUB)  TO W-HDR1-CLT-NAME                     
           MOVE BPD-PROC-DATE(5:2)       TO W-HDR1-MM.                          
           MOVE BPD-PROC-DATE(7:2)       TO W-HDR1-DD.                          
           MOVE BPD-PROC-DATE(1:4)       TO W-HDR1-YEAR.                        
           ADD  1                        TO W-PAGE-CNT.                         
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                        
           MOVE W-HDR1-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT W-REPT-CLT             
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE REPT-REC FROM W-REPORT-REC.                                    
                                                                                
           MOVE '0NO ACTIVITY TODAY'     TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT W-REPT-CLT             
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE REPT-REC FROM W-REPORT-REC.                                    
                                                                                
       7500-EXIT. EXIT.                                                         
      /                                                                         
      ***WRITE ONE DETAIL LINE ON THE REPORT                                    
       7600-WRITE-LINE.                                                         
                                                                                
           IF  W-LINE-CNT > 52                                                  
               PERFORM 7610-ASSET-HEADING THRU 7610-EXIT                        
           END-IF                                                               
                                                                                
           MOVE W-SORT-KEY-CLIENT-NBR TO W-REPORT-CLT W-REPT-CLT                
           MOVE LOW-VALUES            TO W-REPORT-FIL                           
           WRITE REPT-REC FROM W-REPORT-REC                                     
           ADD 1 TO W-LINE-CNT.                                                 
                                                                                
       7600-EXIT. EXIT.                                                         
      /                                                                         
       7610-ASSET-HEADING.                                                      
                                                                                
           MOVE W-SORT-KEY-CLIENT-NBR    TO W-HDR1-CLT                          
           MOVE B1-CLT-NAME(B1-PRT-SUB)  TO W-HDR1-CLT-NAME                     
           MOVE BPD-PROC-DATE(5:2)       TO W-HDR1-MM.                          
           MOVE BPD-PROC-DATE(7:2)       TO W-HDR1-DD.                          
           MOVE BPD-PROC-DATE(1:4)       TO W-HDR1-YEAR.                        
           ADD  1                        TO W-PAGE-CNT.                         
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                        
           MOVE W-HDR1-REC               TO W-REPORT-LINE.                      
           MOVE W-SORT-KEY-CLIENT-NBR    TO W-REPORT-CLT W-REPT-CLT             
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE REPT-REC FROM W-REPORT-REC.                                    
                                                                                
           MOVE W-SORT-KEY-TFR-TYPE      TO W-HDR2-TFR                          
           MOVE W-SORT-KEY-ACCT-NBR(1:3) TO W-HDR2-BR                           
           MOVE W-SORT-KEY-ACCT-NBR(4:5) TO W-HDR2-ACCT                         
           IF W-SORT-KEY-IS-RECEIVER                                            
              MOVE 'RECEIVER'            TO W-HDR2-DEL-REC                      
           END-IF.                                                              
           IF W-SORT-KEY-IS-DELIVERER                                           
              MOVE 'DELIVERER'           TO W-HDR2-DEL-REC                      
           END-IF.                                                              
           MOVE                                                                 
            '   ASSET TRANSACTION REPORT AS ORIGINAL ACCOUNT '                  
                   TO W-HDR2-HEADING.                                           
           MOVE W-HDR2-REC               TO W-REPORT-LINE.                      
           MOVE W-SORT-KEY-CLIENT-NBR    TO W-REPORT-CLT W-REPT-CLT             
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE REPT-REC FROM W-REPORT-REC.                                    
                                                                                
           MOVE W-SORT-KEY-CYCLE         TO W-HDR3-CYCLE                        
           MOVE W-SORT-KEY-PROC-MM       TO W-HDR3-MM.                          
           MOVE W-SORT-KEY-PROC-DD       TO W-HDR3-DD.                          
           MOVE W-SORT-KEY-PROC-YEAR     TO W-HDR3-YEAR.                        
           MOVE W-HDR3-REC               TO W-REPORT-LINE.                      
           MOVE W-SORT-KEY-CLIENT-NBR    TO W-REPORT-CLT W-REPT-CLT             
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE REPT-REC FROM W-REPORT-REC.                                    
                                                                                
      ***ASSET HEADER 1                                                         
           IF W-SORT-KEY-IS-DELIVERER                                           
              MOVE 'DEL'                 TO W-AST-HDR1-DEL-REC                  
              MOVE 'DEL'                 TO W-AST-HDR1-DEL-REC-2                
           MOVE W-TI-TI-DEL-ACCT-NBR     TO W-AST-HDR1-ACCT-NBR                 
           ELSE                                                                 
              MOVE 'REC'                 TO W-AST-HDR1-DEL-REC                  
              MOVE 'REC'                 TO W-AST-HDR1-DEL-REC-2                
           MOVE W-TI-TI-RCV-ACCT-NBR     TO W-AST-HDR1-ACCT-NBR                 
           END-IF.                                                              
           MOVE W-SORT-DIST-PARTICIPANT    TO W-AST-HDR1-BRKR.                  
                                                                                
           MOVE W-SORT-DIST-PARTICIPANT    TO W-VPRTCPPF-BROKER.                
           PERFORM 7620-GET-BROKER-NAME THRU 7620-EXIT.                         
           MOVE PRTCP-NM OF DCLVPRTCPPF  TO W-AST-HDR1-BRKR-NAME.               
                                                                                
           MOVE W-TI-TI-RCV-ACCT-TYPE    TO W-AST-HDR1-ACCT-TYPE                
                                                                                
           MOVE W-AST-HDR1-REC           TO W-REPORT-LINE.                      
           MOVE W-TI-KEY-CLIENT-NBR      TO W-REPORT-CLT W-REPT-CLT             
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE REPT-REC FROM W-REPORT-REC.                                    
                                                                                
      ***ASSET HEADER 2                                                         
           IF W-SORT-KEY-IS-DELIVERER                                           
              MOVE 'REC'                 TO W-AST-HDR2-DEL-REC                  
              MOVE 'REC'                 TO W-AST-HDR2-DEL-REC-2                
           MOVE W-TI-TI-RCV-ACCT-NBR     TO W-AST-HDR2-ACCT-NBR                 
           ELSE                                                                 
              MOVE 'DEL'                 TO W-AST-HDR2-DEL-REC                  
              MOVE 'DEL'                 TO W-AST-HDR2-DEL-REC-2                
           MOVE W-TI-TI-DEL-ACCT-NBR     TO W-AST-HDR2-ACCT-NBR                 
           END-IF.                                                              
           IF W-SORT-KEY-IS-RECEIVER                                            
              MOVE W-TI-TI-DEL-NBR       TO W-AST-HDR2-BRKR                     
           END-IF.                                                              
           IF W-SORT-KEY-IS-DELIVERER                                           
              MOVE W-TI-TI-RCV-NBR       TO W-AST-HDR2-BRKR                     
           END-IF.                                                              
                                                                                
      *---GET OTHER BROKER NAME                                                 
           MOVE W-AST-HDR2-BRKR          TO W-VPRTCPPF-BROKER.                  
           PERFORM 7620-GET-BROKER-NAME THRU 7620-EXIT.                         
           MOVE PRTCP-NM OF DCLVPRTCPPF  TO W-AST-HDR2-BRKR-NAME.               
                                                                                
           MOVE W-AST-HDR2-REC           TO W-REPORT-LINE.                      
           MOVE W-SORT-KEY-CLIENT-NBR    TO W-REPORT-CLT W-REPT-CLT             
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE REPT-REC FROM W-REPORT-REC.                                    
                                                                                
      ***ASSET HEADER 3                                                         
           MOVE W-TI-TI-ACAT-CTL-NBR(1:7) TO W-AST-HDR3-ACAT-CTL-1              
           MOVE '-'                       TO W-AST-HDR3-ACAT-CTL-D1             
           MOVE W-TI-TI-ACAT-CTL-NBR(8:7) TO W-AST-HDR3-ACAT-CTL-2              
           MOVE W-TI-TI-TFR-TYPE          TO W-AST-HDR3-TFR-TYPE                
           IF W-TI-TI-RCV-SSN-PRM > ' '                                         
           MOVE W-TI-TI-RCV-SSN-PRM(1:3)  TO W-AST-HDR3-SSN-PRM(1:3)            
           MOVE '-'                       TO W-AST-HDR3-SSN-PRM(4:1)            
           MOVE W-TI-TI-RCV-SSN-PRM(4:2)  TO W-AST-HDR3-SSN-PRM(5:2)            
           MOVE '-'                       TO W-AST-HDR3-SSN-PRM(7:1)            
           MOVE W-TI-TI-RCV-SSN-PRM(6:4)  TO W-AST-HDR3-SSN-PRM(8:4)            
           END-IF                                                               
           IF W-TI-TI-RCV-SSN-SEC > ' '                                         
           MOVE W-TI-TI-RCV-SSN-SEC(1:3)  TO W-AST-HDR3-SSN-SEC(1:3)            
           MOVE '-'                       TO W-AST-HDR3-SSN-SEC(4:1)            
           MOVE W-TI-TI-RCV-SSN-SEC(4:2)  TO W-AST-HDR3-SSN-SEC(5:2)            
           MOVE '-'                       TO W-AST-HDR3-SSN-SEC(7:1)            
           MOVE W-TI-TI-RCV-SSN-SEC(6:4)  TO W-AST-HDR3-SSN-SEC(8:4)            
           END-IF                                                               
           EVALUATE TRUE                                                        
               WHEN W-SORT-REQ                                                  
                        MOVE 'REQUEST       ' TO W-AST-HDR3-TFR-STATUS          
               WHEN W-SORT-REQ-ADJ                                              
                        MOVE 'REQUEST-ADJ   ' TO W-AST-HDR3-TFR-STATUS          
               WHEN W-SORT-REQ-ADJ-PAST                                         
                        MOVE 'REQ-ADJ-PAST  ' TO W-AST-HDR3-TFR-STATUS          
               WHEN W-SORT-REQ-PAST                                             
                        MOVE 'REQ-PAST      ' TO W-AST-HDR3-TFR-STATUS          
               WHEN W-SORT-REQ-REJ                                              
                        MOVE 'REQ-REJ       ' TO W-AST-HDR3-TFR-STATUS          
               WHEN W-SORT-REVIEW                                               
                        MOVE 'REVIEW        ' TO W-AST-HDR3-TFR-STATUS          
               WHEN W-SORT-REVIEW-ADJ                                           
                        MOVE 'REVIEW-ADJ    ' TO W-AST-HDR3-TFR-STATUS          
               WHEN W-SORT-REVIEW-ERROR                                         
                        MOVE 'REVIEW-ERROR  ' TO W-AST-HDR3-TFR-STATUS          
               WHEN W-SORT-REVIEW-ACCEL                                         
                        MOVE 'REVIEW-ACCEL  ' TO W-AST-HDR3-TFR-STATUS          
               WHEN W-SORT-SETTLE-PREP                                          
                        MOVE 'SETTLE-PREP   ' TO W-AST-HDR3-TFR-STATUS          
               WHEN W-SORT-SETTLE-CLOSE                                         
                        MOVE 'SETTLE-CLOSE  ' TO W-AST-HDR3-TFR-STATUS          
               WHEN W-SORT-CLOSE-PURGE                                          
                        MOVE 'CLOSE-PURGE   ' TO W-AST-HDR3-TFR-STATUS          
               WHEN W-SORT-MEM-PART-TFR-REQ                                     
                        MOVE 'MEMO-PTR      ' TO W-AST-HDR3-TFR-STATUS          
               WHEN W-SORT-MEM-PURG-PART-T-R                                    
                        MOVE 'MEMO-PTR-PURGE' TO W-AST-HDR3-TFR-STATUS          
               WHEN W-SORT-REJECT                                               
                        MOVE 'REJECT        ' TO W-AST-HDR3-TFR-STATUS          
               WHEN OTHER                                                       
                        MOVE '              ' TO W-AST-HDR3-TFR-STATUS          
           END-EVALUATE.                                                        
           MOVE W-SORT-DAYS-IN-STATUS    TO W-AST-HDR3-DAYS.                    
           EVALUATE TRUE                                                        
               WHEN W-TI-TI-ADD                                                 
                   MOVE 'ADDED      ' TO W-AST-HDR3-ACTION                      
                   IF W-TI-KEY-DATABASE-FROM   = 'Y'                            
                      MOVE '           ' TO W-AST-HDR3-ACTION                   
                   END-IF                                                       
               WHEN W-TI-TI-CHANGE                                              
                   MOVE 'CHANGED    ' TO W-AST-HDR3-ACTION                      
               WHEN W-TI-TI-REJECT                                              
                   MOVE 'REJECTED   ' TO W-AST-HDR3-ACTION                      
               WHEN W-TI-TI-ACCEL                                               
                   MOVE ' '           TO W-AST-HDR3-ACTION                      
               WHEN OTHER                                                       
                   MOVE ' '           TO W-AST-HDR3-ACTION                      
           END-EVALUATE.                                                        
           IF  W-AST-HDR3-TFR-STATUS = ' '                                      
           AND W-AST-HDR3-ACTION = ' '                                          
               EVALUATE TRUE                                                    
               WHEN W-TI-ACCEPTED                                               
                   MOVE 'ACCEPTED'    TO W-AST-HDR3-ACTION                      
               WHEN W-TI-REJECTED                                               
                   MOVE 'REJECTED'    TO W-AST-HDR3-ACTION                      
               WHEN W-TI-MODIFIED                                               
                   MOVE 'MODIFIED'    TO W-AST-HDR3-ACTION                      
               END-EVALUATE                                                     
           END-IF                                                               
           MOVE W-AST-HDR3-REC           TO W-REPORT-LINE.                      
           MOVE W-SORT-KEY-CLIENT-NBR    TO W-REPORT-CLT W-REPT-CLT             
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE REPT-REC FROM W-REPORT-REC.                                    
                                                                                
      ***ASSET HEADER 4                                                         
           IF  W-TI-TI-ASSC-CTL-NBR > ' '                                       
               MOVE W-TI-TI-ASSC-CTL-NBR(1:7) TO W-AST-HDR4-ASSC-CTL-1          
               MOVE '-'                       TO W-AST-HDR4-ASSC-CTL-D1         
               MOVE W-TI-TI-ASSC-CTL-NBR(8:7) TO W-AST-HDR4-ASSC-CTL-2          
               MOVE W-TI-TI-ASSC-STL-DT(5:2)                                    
                                          TO W-AST-HDR4-ASSC-STL-MM             
               MOVE '/'                   TO W-AST-HDR4-ASSC-STL-S1             
               MOVE W-TI-TI-ASSC-STL-DT(7:2)                                    
                                          TO W-AST-HDR4-ASSC-STL-DD             
               MOVE '/'                   TO W-AST-HDR4-ASSC-STL-S2             
               MOVE W-TI-TI-ASSC-STL-DT(1:4)                                    
                                          TO W-AST-HDR4-ASSC-STL-YEAR           
               MOVE W-AST-HDR4-REC        TO W-REPORT-LINE                      
               MOVE W-TI-KEY-CLIENT-NBR   TO W-REPORT-CLT W-REPT-CLT            
               MOVE LOW-VALUES            TO W-REPORT-FIL                       
               WRITE REPT-REC FROM W-REPORT-REC                                 
           END-IF.                                                              
                                                                                
      ***ASSET HEADER 5                                                         
           MOVE W-TI-TI-RCV-CUS-NAME     TO W-AST-HDR5-CUST-NAME                
           MOVE ' ' TO W-AST-HDR5-FLD-REJ-CMNT-AREA                             
           IF W-TI-TI-REJECT                                                    
              MOVE 'REJ CDE XX:' TO W-AST-HDR5-FLD-REJ-CMNT                     
              MOVE W-TI-TI-TFR-TYPE-REJ TO W-AST-HDR5-FLD-REJ-CMNT(9:2)         
              EVALUATE TRUE                                                     
               WHEN W-TI-TI-NOT-REJECTED                                        
               MOVE 'NOT-REJECTED               ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-SSN-MISMATCH                                        
               MOVE 'SS# TAX ID MISMATCH        ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-ACC-MISMATCH                                        
               MOVE 'ACCOUNT TITLE MISMATCH     ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-DOC-NEEDED                                          
               MOVE 'DOCUMENTATION NEEDED       ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-ACC-FLAT                                            
               MOVE 'ACCOUNT FLAT               ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-INV-ACCT-NBR                                        
               MOVE 'INVALID ACCOUNT NUMBER     ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-DUPLICATE                                           
               MOVE 'DUPLICATE                  ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-IN-DIST-TFR                                         
               MOVE 'ACCOUNT IN DISTRIBUTION OR TRANSFER'                       
                                                  TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-CLT-RESCINDED                                       
               MOVE 'CLIENT RESCINDED           ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-MISS-AUTH-SIGN                                      
               MOVE 'MISSING AUTHORIZATION SIGNATURE'                           
                                                  TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-VIOLATE-POLICY                                      
               MOVE 'ACCOUNT VIOLATES CREDIT POLICY OF RECEIVING FIRM'          
                                                  TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-UNRG-RSDL-CR                                        
               MOVE 'UNRECOGNIZED FOR RESIDUAL CREDIT BALANCE'                  
                                                  TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-PARTIAL-TFR-RJ                                      
               MOVE 'PARTIAL TRANSFER (DELIVERER INITIATED) REJECT'             
                                                  TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-FAIL-REV-REJ                                        
               MOVE 'FAIL REVERSAL REJECT       ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-CUST-RE-DEL-RJ                                      
               MOVE 'RECLAIM REJECT             ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-RECLAIM-REJ                                         
               MOVE 'CUSTODY RE-DELIVERY REJECT ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TI-MFC-REJ                                             
               MOVE 'MUTUAL FUND CLEANUP REJECT'  TO W-AST-HDR5-REJ-MSG         
               WHEN OTHER                                                       
               MOVE '                          '  TO W-AST-HDR5-REJ-MSG         
              END-EVALUATE                                                      
           END-IF.                                                              
           IF W-TI-SYSTEM-ACTION = '2'                                          
              MOVE 'SYS REJ XX:'       TO W-AST-HDR5-FLD-REJ-CMNT               
              MOVE W-TI-SYSTEM-REJ-RSN TO W-AST-HDR5-FLD-REJ-CMNT(9:2)          
              EVALUATE TRUE                                                     
               WHEN W-TI-INV-FLD                                                
               MOVE 'INV-FLD                    ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-MISSED-CUTOFF                                          
               MOVE 'MISSED-CUTOFF              ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-ASSOC-REC-NOT-PRSNT                                    
               MOVE 'ASSOC-REC-NOT-PRSNT        ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-PHY-REC-OUT-OF-SEQ                                     
               MOVE 'PHY-REC-OUT-OF-SEQ         ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-INV-PHY-SEQ-NBR                                        
               MOVE 'INV-PHY-SEQ-NBR            ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-LOG-REC-OUT-OF-SEQ                                     
               MOVE 'LOG-REC-OUT-OF-SEQ         ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-INV-LOG-SEQ-NBR                                        
               MOVE 'INV-LOG-SEQ-NBR            ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-INV-LEN-REC                                            
               MOVE 'INV-LEN-REC                ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-INV-REC-CONTENTS                                       
               MOVE 'INV-REC-CONTENTS           ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-INV-ADD-REC-EXIST                                      
               MOVE 'INV-ADD-REC-EXIST          ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-INV-CHG-REC-NOT-EXST                                   
               MOVE 'INV-CHG-REC-NOT-EXIST      ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-INV-DEL-REC-NOT-EXST                                   
               MOVE 'INV-DEL-REC-NOT-EXIST      ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-REQ-ACT-INV-TRN-STAT                                   
               MOVE 'REQ-ACT-INV-TRN-STAT       ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TRN-INV-CONTRA-PART                                    
               MOVE 'TRN-INV-CONTRA-PART        ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-TRN-INV-SUBMIT-PART                                    
               MOVE 'TRN-INV-SUBMIT-PART        ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-INV-PARTICIPANT                                        
               MOVE 'INV-PARTICIPANT            ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-NON-STD-INV-PHY-SEQ                                    
               MOVE 'NON-STD INV PHYSICAL SEQ   ' TO W-AST-HDR5-REJ-MSG         
               WHEN W-TI-NON-STD-INV-AST-TYP                                    
               MOVE 'NON-STD INV ASSET TYPE     ' TO W-AST-HDR5-REJ-MSG         
               WHEN OTHER                                                       
               MOVE '                          '  TO W-AST-HDR5-REJ-MSG         
              END-EVALUATE                                                      
           END-IF.                                                              
           MOVE W-AST-HDR5-REC           TO W-REPORT-LINE.                      
           MOVE W-SORT-KEY-CLIENT-NBR    TO W-REPORT-CLT W-REPT-CLT             
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE REPT-REC FROM W-REPORT-REC.                                    
                                                                                
      ***ASSET HEADER 6                                                         
           IF  W-TI-TI-COMMENTS > ' '                                           
               MOVE W-TI-TI-COMMENTS      TO W-AST-HDR6-COMMENT                 
               MOVE W-AST-HDR6-REC        TO W-REPORT-LINE                      
               MOVE W-SORT-KEY-CLIENT-NBR TO W-REPORT-CLT W-REPT-CLT            
               MOVE LOW-VALUES            TO W-REPORT-FIL                       
               WRITE REPT-REC FROM W-REPORT-REC                                 
           END-IF.                                                              
                                                                                
      ***ASSET HEADER 7                                                         
           MOVE W-AST-HDR7-REC           TO W-REPORT-LINE.                      
           MOVE W-SORT-KEY-CLIENT-NBR    TO W-REPORT-CLT W-REPT-CLT             
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE REPT-REC FROM W-REPORT-REC.                                    
                                                                                
      ***ASSET HEADER 8                                                         
           MOVE W-AST-HDR8-REC           TO W-REPORT-LINE.                      
           MOVE W-SORT-KEY-CLIENT-NBR    TO W-REPORT-CLT W-REPT-CLT             
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE REPT-REC FROM W-REPORT-REC.                                    
                                                                                
           MOVE W-SORT-KEY-CYCLE         TO W-REPT-CYCLE.                       
           MOVE W-SORT-KEY-SIDE          TO W-REPT-SIDE.                        
           MOVE W-SORT-KEY-ACAT-CTL-NBR  TO W-REPT-ACAT-CTL-NBR                 
           MOVE W-SORT-KEY(1:30)         TO W-SAVE-KEY                          
           MOVE ' '                      TO W-SAVE-AT-STL-LOC.                  
                                                                                
           MOVE 10                       TO W-LINE-CNT.                         
                                                                                
       7610-EXIT. EXIT.                                                         
      /                                                                         
       7620-GET-BROKER-NAME.                                                    
                                                                                
           IF PRTCP-NBR OF DCLVPRTCPPF NOT = W-VPRTCPPF-BROKER                  
              EXEC SQL                                                          
                SELECT PRTCP_NM                                                 
                 INTO :DCLVPRTCPPF.PRTCP-NM                                     
                    FROM VPRTCPPF                                               
                  WHERE PRTCP_NBR                                               
                         = :W-VPRTCPPF-BROKER                                   
              END-EXEC                                                          
              IF  SQLCODE  =  +0                                                
                  CONTINUE                                                      
              ELSE                                                              
                  MOVE 'NAME NOT FOUND' TO PRTCP-NM OF DCLVPRTCPPF              
              END-IF                                                            
           END-IF.                                                              
                                                                                
       7620-EXIT. EXIT.                                                         
      /                                                                         
       8000-ABEND-ROUTINE.                                                      
                                                                                
           DISPLAY 'CAT765CV: PROGRAM IS ABENDING'.                             
                                                                                
           CALL ABEND USING ABEND-CODE.                                         
                                                                                
       8000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       9000-CLOSE-ROUTINE.                                                      
           DISPLAY ' '.                                                         
           DISPLAY '9000-CLOSE-ROUTINE'.                                        
                                                                                
           MOVE 'T'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE W-OUTFILE-CNT            TO CP2-RECORD-COUNT.                   
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
           CALL P2HDTR                USING CP2-AREA                            
                                            OUTFILE.                            
           MOVE SPACES                   TO W-OUTTRL-REC                        
           MOVE CP2-RETURN-RECORD        TO W-OUTTRL-P2.                        
           DISPLAY 'CAT765CV: OUT-TRL = '   W-OUTTRL-REC(1:100)                 
           MOVE W-OUTTRL-REC             TO OUTFILE-TRL-REC                     
           WRITE OUTFILE-RECORD.                                                
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT765CV: ACTIVITY = '                                      
           PERFORM VARYING W-SUB1 FROM 1 BY 1                                   
                   UNTIL W-SUB1 > 500                                           
                   IF  B1-ACAT-STATUS (W-SUB1) = 'A'                            
                   AND B1-ITEM-CNT     (W-SUB1) > 0                             
                        DISPLAY                                                 
                        'STR='      B1-STREAM        (W-SUB1)                   
                       ' CLT='      B1-CLT-NBR       (W-SUB1)                   
                       ' BRK='      B1-BRK-NBR       (W-SUB1)                   
                       ' CNT='      B1-ITEM-CNT      (W-SUB1)                   
                   END-IF                                                       
           END-PERFORM.                                                         
                                                                                
           DISPLAY ' '.                                                         
           CLOSE INFILE                                                         
           DISPLAY 'CAT765CV: INFILE   CLOSED. STATUS = '                       
                                             INFILE-STAT.                       
           CLOSE OUTFILE                                                        
           DISPLAY 'CAT765CV: OUTFILE  CLOSED. STATUS = '                       
                                             OUTFILE-STAT.                      
           CLOSE REPT-FILE                                                      
           DISPLAY 'CAT765CV: OREPORT  CLOSED. STATUS = '                       
                                             REPT-STAT.                         
                                                                                
           DISPLAY 'CAT765CV: INFILE     INPUT  COUNT = '                       
                                                   W-INFILE-CNT                 
           DISPLAY 'CAT765CV: DETAIL            COUNT = '                       
                                                   W-DETAIL-CNT                 
           DISPLAY 'CAT765CV: W-VTRNFR-CNT            = ' W-VTRNFR-CNT          
           DISPLAY 'CAT765CV: W-RELEASE-CNT           = ' W-RELEASE-CNT         
           DISPLAY 'CAT765CV: W-RETURN-CNT            = ' W-RETURN-CNT          
           DISPLAY 'CAT765CV: W-OREPORT-CNT           = ' W-OREPORT-CNT         
           DISPLAY 'CAT765CV: OUTFILE    OUTPUT COUNT = '                       
                                                   W-OUTFILE-CNT                
           DISPLAY 'CAT765CV: W-TI-CNT                = ' W-TI-CNT              
           DISPLAY 'CAT765CV: W-AT-CNT                = ' W-AT-CNT              
           DISPLAY 'CAT765CV: W-ATR-CNT (REGULAR)     = ' W-ATR-CNT             
           DISPLAY 'CAT765CV: W-ATO-CNT               = ' W-ATO-CNT             
           DISPLAY 'CAT765CV: W-ATF-CNT               = ' W-ATF-CNT             
           DISPLAY ' '.                                                         
           DISPLAY 'CAT765CV: W-CRD-TI-CNT            = ' W-CRD-TI-CNT          
           DISPLAY 'CAT765CV: W-FRV-TI-CNT            = ' W-FRV-TI-CNT          
           DISPLAY 'CAT765CV: W-PTD-TI-CNT            = ' W-PTD-TI-CNT          
           DISPLAY 'CAT765CV: W-PTR-TI-CNT            = ' W-PTR-TI-CNT          
           DISPLAY 'CAT765CV: W-RCL-TI-CNT            = ' W-RCL-TI-CNT          
           DISPLAY 'CAT765CV: W-RCR-TI-CNT            = ' W-RCR-TI-CNT          
           DISPLAY 'CAT765CV: W-MFC-TI-CNT            = ' W-MFC-TI-CNT          
DJ0002     DISPLAY 'CAT765CV: W-PTF-TI-CNT            = ' W-PTF-TI-CNT          
           DISPLAY 'CAT765CV: W-CRD-AT-CNT            = ' W-CRD-AT-CNT          
           DISPLAY 'CAT765CV: W-FRV-AT-CNT            = ' W-FRV-AT-CNT          
           DISPLAY 'CAT765CV: W-PTD-AT-CNT            = ' W-PTD-AT-CNT          
           DISPLAY 'CAT765CV: W-PTR-AT-CNT            = ' W-PTR-AT-CNT          
           DISPLAY 'CAT765CV: W-RCL-AT-CNT            = ' W-RCL-AT-CNT          
           DISPLAY 'CAT765CV: W-RCR-AT-CNT            = ' W-RCR-AT-CNT          
           DISPLAY 'CAT765CV: W-MFC-AT-CNT            = ' W-MFC-AT-CNT          
DJ0002     DISPLAY 'CAT765CV: W-PTF-AT-CNT            = ' W-PTF-AT-CNT          
           DISPLAY ' '.                                                         
           DISPLAY 'CAT765CV: PROGRAM ENDED SUCCESSFULLY'.                      
                                                                                
       9000-EXIT.                                                               
           EXIT.                                                                
      *################################################################         
