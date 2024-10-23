000001* PDX    - CAT813   C0305759 12/27/10 11:03:30 TBLAMUR            00001000
      * LRM009 - SSR 74045 REPORT INITIAL AND ACTIVE DB2 DUPE EXCEPTION.        
000001* PDX    - CAT813   C0291396 03/15/10 11:13:58 TBLAMUR            00001000
      * LRM008 - SSR 69400 PENSON CONVERSION NEW EXCEPTION MESSAGE.             
000001* PDX    - CAT813   C0288347 01/07/10 11:49:37 TBLAMUR            00001000
      * LRM007 - SSR 59603 RECOMPILE ONLY ACATRCRF COPYBOOK CHANGE.             
000001* PDX    - CAT813   C0287215 10/20/09 12:25:27 TBLAMUR            00001000
      * LRM006 - SSR 67652 CORRECT ISSUE WHERE FCURR POSITIONS ARE              
      *          NOT REPORTED.                                                  
000001* PDX    - CAT813   C0284212 09/14/09 10:35:39 TBLAMUR            00001000
      * TK0005 - SSR63787 ADD FOREIGN CURRENCIES                                
000001* PDX    - CAT813   C0252012 08/13/07 10:36:48 TBDOJUN            00001000
      * DJ0004 - SSR51272 REMOVE "ADP" FROM HEADING                             
000001* PDX    - CAT813   C0235973 07/10/06 10:17:36 TBDOJUN            00001000
      * DJ0003   SSR# 44420 RECOMPILED FOR COPYBOOK ACATRCRF                    
000001* PDX    - CAT813   C0141412 08/28/00 10:50:11 TBDOJUN                    
      * DJ0002   SSR# R2558300, R5258000 ADD NON-DELIVERABLE                    
000001* PDX    - CAT813   C0125737 06/14/99 10:43:09 TBDOJUN                    
000001* PDX    - CAT813   C0123087 04/12/99 11:07:47 TBDOJUN                    
000001* PDX    - CAT813   C0122542 03/05/99 10:35:58 TBDOJUN                    
000001* PDX    - CAT813   C0120784 01/28/99 11:49:12 TBDOJUN                    
000001* PDX    - CAT813   C0119296 12/22/98 16:47:49 TBDOJUN                    
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    CAT813.                                                   
      *---------------------------------------------------------------*         
      *    ACATS - RESIDUAL CREDIT (RCR) REPORT                                 
      *                                                                         
      *    SORT                                                                 
      *                                                                         
      *    USE B1 TO GET CLIENT NAME                                            
      *                                                                         
      *    DATASETS:                                                            
      *          1) BXXX.CAT812.ACATRCRF  I/P - RCR DATA FILE                   
      *          2) BXXX.CAT813.RCRPI     O/P - RCR REPORT                      
      *          3) BXXX.CAT813.NONPI     O/P - NON-DELIVERABLE REPORT          
      *          4) BXXX.CAT813.EXCPI     O/P - EXCEPTION REPORT                
      *                                                                         
      *    EXCEPTIONS WILL NOT BE REPORTED IF THERE ARE NO ASSETS.              
      *                                                                         
      *---------------------------------------------------------------*         
      * THE FOLLOWING B1'S ARE USED IN CAT812A:                                 
      *                                                                         
      *  IF B1#434527 IS ON, PRINT NON-DELIVERABLE ASSETS ON THE                
      *  NON-DELIVERABLE REPORT.  DELIVERABLE ASSETS FOR THE SAME               
      *  ACCOUNT WILL BE ON THE RCR REPORT.                                     
      *                                                                         
      *  IF B1#434527 IS OFF, PRINT NON-DELIVERABLE ASSETS ON THE               
      *  RCR REPORT WITH THE DELIVERABLE ASSETS.                                
      *                                                                         
      *  IF CLIENT IS AUTO-SUBMIT(B1#434536=1), AND B1#434658 IS ON,            
      *  PRINT THE EXCEPTION REPORT FOR ACCOUNTS WITH                           
      *  EQUITY EXCEPTIONS.                                                     
      *                                                                         
      *  IF CLIENT IS AUTO-SUBMIT(B1#434536=1), AND B1#434659 IS ON,            
      *  PRINT THE EXCEPTION REPORT FOR ACCOUNTS WITH                           
      *  SETTLEMENT DATE EXCEPTIONS.                                            
      *---------------------------------------------------------------*         
      *                                                                         
      *  IF AN ACCOUNT IS SHORT, THE WHOLE ACCOUNT WILL SHOW UP                 
      *  ON THE NON-DELIVERABLE REPORT.                                         
      *                                                                         
      *  IF AN ACCOUNT HAS ANY EXCEPTIONS, THE WHOLE ACCOUNT SHOULD             
      *  BE ON THE EXCEPTION REPORT ONLY.                                       
      *                                                                         
      *  IF AN ACCOUNT IS NOT SHORT AND HAS NO EXCEPTIONS, IT CAN               
      *  SHOW UP ON BOTH THE RCR REPORT AND THE NON-DELIVERABLE REPORT          
      *  BASED ON THE B1.                                                       
      *                                                                         
      *---------------------------------------------------------------*         
      * 12/12/98 DJ  - NEW ACATS PROGRAM                              *         
DJ0002* 08/28/00 DJ    SSR# R2558300 FLAG NON-DELIVERABLE             *         
DJ0002*                SSR# R5258000 EXCEPTION PROCESSING             *         
DJ0002*                SPLIT REPORT INTO THREE.                       *         
      *---------------------------------------------------------------*         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE                 ASSIGN TO INFILE                       
                  FILE STATUS            IS INFILE-STAT.                        
                                                                                
           SELECT RCRPI-FILE             ASSIGN TO UT-S-RCRPI                   
                                         FILE STATUS IS RCRPI-STAT.             
                                                                                
           SELECT NONPI-FILE             ASSIGN TO UT-S-NONPI                   
                                         FILE STATUS IS NONPI-STAT.             
                                                                                
           SELECT EXCPI-FILE             ASSIGN TO UT-S-EXCPI                   
                                         FILE STATUS IS EXCPI-STAT.             
                                                                                
           SELECT SORT-FILE              ASSIGN TO  UT-S-SORTWK01.              
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS F.                                                 
                                                                                
           COPY ACATRCRF REPLACING ==:ACATRCRF:== BY ==INFILE==.                
      /                                                                         
       FD  RCRPI-FILE                                                           
           RECORDING MODE IS F.                                                 
                                                                                
       01  RCRPI-REC.                                                           
           03 RCRPI-LINE            PIC  X(133).                                
           03 RCRPI-CLT             PIC S9(003) COMP-3.                         
           03 RCRPI-FIL             PIC  X(008).                                
      /                                                                         
       FD  NONPI-FILE                                                           
           RECORDING MODE IS F.                                                 
                                                                                
       01  NONPI-REC.                                                           
           03 NONPI-LINE            PIC  X(133).                                
           03 NONPI-CLT             PIC S9(003) COMP-3.                         
           03 NONPI-FIL             PIC  X(008).                                
      /                                                                         
       FD  EXCPI-FILE                                                           
           RECORDING MODE IS F.                                                 
                                                                                
       01  EXCPI-REC.                                                           
           03 EXCPI-LINE            PIC  X(133).                                
           03 EXCPI-CLT             PIC S9(003) COMP-3.                         
           03 EXCPI-FIL             PIC  X(008).                                
      /                                                                         
       SD  SORT-FILE.                                                           
                                                                                
           COPY ACATRCRF REPLACING ==:ACATRCRF:== BY ==SORT==.                  
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
                                                                                
       01  W-FIELDS.                                                            
           05  W-ROUTINE                 PIC  X(30) VALUE ' '.                  
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'W-HDR'.              
           COPY ACATRCRF REPLACING ==:ACATRCRF:== BY ==W-HDR==.                 
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'ACATRCRF'.           
                                                                                
           COPY ACATRCRF REPLACING ==:ACATRCRF:== BY ==ACATRCRF==.              
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'W-PREV  '.           
       01  W-PREV-AREA.                                                         
           05  W-PREV-CLIENT             PIC X(0004).                           
           05  W-PREV-ACCOUNT            PIC X(0008).                           
           05  W-PREV-CONTROL-NBR        PIC X(0014).                           
           05  W-PREV-RCV-NBR            PIC X(0004).                           
           05  W-PREV-ACCT-RCV-NBR       PIC X(0020).                           
           05  W-PREV-SORT-ID            PIC X(0001).                           
       01  FILLER                        PIC X(008) VALUE 'B1-COUNT'.           
       01  B1-WORK-FIELDS.                                                      
           05  B1-TBL-CNT                PIC 9(03) VALUE 0.                     
           05  B1-SUB                    PIC 9(03) VALUE 0.                     
           05  B1-ACTIVE-CNT             PIC 9(03) VALUE 0.                     
           05  FILLER                    PIC X(010) VALUE 'B1-PRT-SUB'.         
           05  B1-PRT-SUB                PIC 9(04) VALUE 1.                     
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.           
       01  B1-TABLE-AREA.                                                       
           03  B1-TABLE OCCURS 500 TIMES.                                       
               05  B1-CLT-NBR               PIC 9(04).                          
               05  B1-CLT-NAME              PIC X(30).                          
               05  B1-BKR-CLR-NO            PIC X(04).                          
               05  B1-STREAM                PIC X(01).                          
               05  B1-STATUS                PIC X(01).                          
               05  B1-ACAT-STATUS           PIC X(01).                          
               05  B1-RCRPI-PRINTED         PIC X(01).                          
               05  B1-NONPI-PRINTED         PIC X(01).                          
               05  B1-EXCPI-PRINTED         PIC X(01).                          
                                                                                
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
           05  END-OF-SORT-SW            PIC  X(01) VALUE '0'.                  
               88 END-OF-SORT                       VALUE '1'.                  
           05  RCRPI-STAT                PIC  X(02) VALUE '00'.                 
               88 RCRPI-OKAY                        VALUE '00'.                 
           05  NONPI-STAT                PIC  X(02) VALUE '00'.                 
               88 NONPI-OKAY                        VALUE '00'.                 
           05  EXCPI-STAT                PIC  X(02) VALUE '00'.                 
               88 EXCPI-OKAY                        VALUE '00'.                 
           05  W-INFILE-CNT              PIC  9(07) VALUE 0.                    
           05  W-DETAIL-CNT              PIC  9(07) VALUE 0.                    
           05  W-RELEASE-CNT             PIC  9(07) VALUE 0.                    
           05  W-RETURN-CNT              PIC  9(07) VALUE 0.                    
DJ0002     05  W-TOTAL-PAGE-CNT          PIC  9(07) VALUE 0.                    
DJ0002     05  W-RCRPI-PAGE-CNT          PIC  9(07) VALUE 0.                    
DJ0002     05  W-NONPI-PAGE-CNT          PIC  9(07) VALUE 0.                    
DJ0002     05  W-EXCPI-PAGE-CNT          PIC  9(07) VALUE 0.                    
DJ0002     05  W-CLT-PAGE-CNT            PIC  9(06) VALUE 0.                    
DJ0002     05  W-CLT-RCRPI-PAGE-CNT      PIC  9(06) VALUE 0.                    
DJ0002     05  W-CLT-NONPI-PAGE-CNT      PIC  9(06) VALUE 0.                    
DJ0002     05  W-CLT-EXCPI-PAGE-CNT      PIC  9(06) VALUE 0.                    
           05  W-PAGE-CNT                PIC  9(06) VALUE 0.                    
           05  W-LINE-CNT                PIC  9(06) VALUE 60.                   
           05  W-EXCPI-CNT               PIC  9(07) VALUE 0.                    
           05  W-NONPI-CNT               PIC  9(07) VALUE 0.                    
           05  W-RCRPI-CNT               PIC  9(07) VALUE 0.                    
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
       01  W-REPORT-REC.                                                        
           05  W-REPORT-LINE             PIC  X(133).                           
           05  W-REPORT-CLT              PIC S9(003) COMP-3.                    
           05  W-REPORT-FIL              PIC  X(008).                           
      /                                                                         
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
       01  CALL-MODULES.                                                        
           05  ABEND-PROGRAM             PIC  X(08) VALUE 'ILBOABN0'.           
           05  CKDIGIT-PROGRAM           PIC  X(08) VALUE 'CKDIGIT '.           
           05  DSNTIAR-PROGRAM           PIC  X(08) VALUE 'DSNTIAR '.           
           05  NUMDAYS-PROGRAM           PIC  X(08) VALUE 'NUMDAYS '.           
           05  SPIEEXIT-PROGRAM          PIC  X(08) VALUE 'SPIEEXIT'.           
           05  ZBPDATES-PROGRAM          PIC  X(08) VALUE 'ZBPDATES'.           
           05  ZGETB1V-PROGRAM           PIC  X(08) VALUE 'ZGETB1V '.           
           05  ZGETMSDC-PROGRAM          PIC  X(08) VALUE 'ZGETMSDC'.           
           05  ZGETNA-PROGRAM            PIC  X(08) VALUE 'ZGETNA  '.           
           05  ZGETXREF-PROGRAM          PIC  X(08) VALUE 'ZGETXREF'.           
           05  ZP2HDTR-PROGRAM           PIC  X(08) VALUE 'ZP2HDTR'.            
                                                                                
TK0005     COPY STUBCPY.                                                        
TK0005                                                                          
TK0005 01  W-CURRENCY                    PIC  X(06).                            
TK0005 01  FILLER REDEFINES W-CURRENCY.                                         
TK0005     05 FILLER                     PIC  X(03).                            
TK0005     05 W-CURRENCY-N               PIC  X(03).                            
TK0005 01  CURLOOK-DATA.                                                BSR62   
TK0005     05 CURLOOK-ARGUMENT           PIC  9(03).                    BSR62   
TK0005     05 CURLOOK-RETURNCODE         PIC  X(01).                    BSR62   
TK0005     05 CURLOOK-NUMBER             PIC  X(03).                    BSR62   
TK0005     05 CURLOOK-SYMBOL             PIC  X(02).                    BSR62   
TK0005     05 CURLOOK-NAME               PIC  X(16).                    BSR62   
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
      ******************************************************************        
      * B1 BTS2 SECTION - OLD ACATS B1                                 *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'BHBTS2  '.            
           COPY BHBTS2.                                                         
      /                                                                         
      ******************************************************************        
      * B1 MF   SECTION - MUTUAL FUNDS                                 *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'BHMF    '.            
           COPY BHMF.                                                           
      /                                                                         
      ******************************************************************        
      * BPDATE COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
                                                                                
           COPY BPDATESC.                                                       
      /                                                                         
       01  W-HDR1-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE '1'.               
           05  FILLER                       PIC  X(08) VALUE                    
               'CAT813 -'.                                                      
           05  W-HDR1-CLT                   PIC  Z999.                          
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-HDR1-CLT-NAME              PIC  X(30) VALUE ' '.               
           05  FILLER                       PIC  X(04) VALUE ' '.               
           05  FILLER                       PIC  X(42) VALUE                    
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.                    
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
                                                                                
       01  W-HDR2-HEADING-LIT-1             PIC X(42) VALUE                     
               '          RESIDUAL CREDIT REPORT'.                              
DJ0002 01  W-HDR2-HEADING-LIT-2             PIC X(42) VALUE                     
DJ0002         '     NON-DELIVERABLE RESIDUAL CREDITS    '.                     
DJ0002 01  W-HDR2-HEADING-LIT-3             PIC X(42) VALUE                     
DJ0002         '     RESIDUAL CREDITS EXCEPTION REPORT   '.                     
       01  W-HDR2-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(08) VALUE                    
               'BROKER  '.                                                      
           05  W-HDR2-BKR                   PIC  X(04) VALUE ' '.               
           05  FILLER                       PIC  X(35) VALUE ' '.               
           05  W-HDR2-HEADING               PIC  X(42) VALUE                    
               '          RESIDUAL CREDIT REPORT'.                              
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
           05  FILLER                       PIC  X(18) VALUE                    
               'ACCOUNT NO. '.                                                  
           05  W-HDR3-BR                    PIC  X(003) VALUE ' '.              
           05  FILLER                       PIC  X(001) VALUE '-'.              
           05  W-HDR3-ACCT                  PIC  X(005) VALUE ' '.              
           05  FILLER                       PIC  X(008) VALUE ' '.              
           05  W-HDR3-NAME                  PIC  X(060) VALUE ' '.              
           05  FILLER                       PIC  X(037) VALUE ' '.              
                                                                                
       01  W-HDR4-REC.                                                          
           05  FILLER PIC X(19) VALUE ' CONTRA BROKER NO. ' .                   
           05  W-HDR4-CONTRA-BROKER         PIC X(04) VALUE ' '.                
           05  FILLER                       PIC X(13) VALUE ' '.                
           05  FILLER PIC X(21) VALUE 'CONTRA ACCOUNT       '.                  
           05  W-HDR4-CONTRA-ACCOUNT        PIC X(20) VALUE ' '.                
           05  FILLER                       PIC X(56) VALUE ' '.                
                                                                                
       01  W-HDR5-REC.                                                          
           05  FILLER PIC X(19) VALUE ' ACATS CONTROL NO. '.                    
           05  W-HDR5-CONTROL-NBR           PIC X(14) VALUE ' '.                
           05  FILLER                       PIC X(03) VALUE ' '.                
           05  FILLER PIC X(21) VALUE 'ORIGINAL SETTLE DATE '.                  
           05  W-HDR5-SETTLE-DATE           PIC X(10) VALUE ' '.                
           05  FILLER                       PIC X(04) VALUE ' '.                
LRM009     05  W-HDR5-DUPE-MSG1             PIC X(19) VALUE ' '.                
LRM009     05  W-HDR5-DUPE-TABLE            PIC X(08) VALUE ' '.                
LRM009     05  W-HDR5-DUPE-MSG2             PIC X(07) VALUE ' '.                
LRM009     05  W-HDR5-DUPE-TRNFR-TYPE       PIC X(04) VALUE ' '.                
LRM009     05  W-HDR5-DUPE-CONTROL-NBR      PIC X(14) VALUE ' '.                
           05  FILLER                       PIC X(13) VALUE ' '.                
                                                                                
       01  W-HDR6-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE '0'.               
           05  FILLER                       PIC  X(05) VALUE                    
               'C/M/S'.                                                         
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(08) VALUE                    
               'SYMBOL  '.                                                      
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(07) VALUE                    
DJ0004         'SEC-NO'.                                                        
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(12) VALUE                    
               '  CUSIP'.                                                       
           05  FILLER                       PIC  X(02) VALUE ' '.               
           05  FILLER                       PIC  X(30) VALUE                    
               '       DESCRIPTION'.                                            
           05  FILLER                       PIC  X(02) VALUE ' '.               
           05  FILLER                       PIC  X(03) VALUE                    
               'L/S'.                                                           
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(21) VALUE                    
               '       QUANTITY'.                                               
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(20) VALUE                    
               '           AMOUNT'.                                             
           05  FILLER                       PIC  X(17) VALUE ' '.               
                                                                                
       01  W-DTL1-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE '0'.               
           05  FILLER                       PIC  X(02) VALUE ' '.               
           05  W-DTL1-CMS                   PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(02) VALUE ' '.               
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-DTL1-SYMBOL                PIC  X(08) VALUE ' '.               
           05  FILLER                       PIC  X(01) VALUE ' '.               
DJ0004     05  W-DTL1-SEC-NO                PIC  X(07) VALUE ' '.               
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-DTL1-CUSIP                 PIC  X(12) VALUE ' '.               
           05  FILLER                       PIC  X(02) VALUE ' '.               
           05  W-DTL1-DESC1                 PIC  X(30) VALUE ' '.               
           05  FILLER                       PIC  X(03) VALUE ' '.               
           05  W-DTL1-LONG-SHORT            PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-DTL1-QTY                   PIC  ZZZ,ZZZ,ZZZ,ZZZ.99999          
                                                 BLANK WHEN ZERO.               
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  W-DTL1-AMT                   PIC  ZZZZZ,ZZZ,ZZZ,ZZZ.99.          
           05  FILLER                       PIC  X(02) VALUE ' '.               
           05  W-DTL1-PROCESS-IND           PIC  X(16) VALUE ' '.               
                                                                                
       01  W-DTL2-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(05) VALUE ' '.               
           05  FILLER                       PIC  X(01) VALUE ' '.               
           05  FILLER                       PIC  X(29) VALUE ' '.               
           05  FILLER                       PIC  X(02) VALUE ' '.               
           05  W-DTL2-DESC2                 PIC  X(30) VALUE ' '.               
           05  FILLER                       PIC  X(65) VALUE ' '.               
                                                                                
       01  W-DTLX-REC.                                                          
           05  FILLER                       PIC  X(01) VALUE '0'.               
           05  FILLER                       PIC  X(02) VALUE ' '.               
           05  W-DTLX-LIT                   PIC  X(40) VALUE                    
           'NO RCR TODAY'.                                                      
           05  FILLER                       PIC  X(90) VALUE ' '.               
                                                                                
       01  FILLER                        PIC X(008) VALUE 'END-O-WS'.           
      /                                                                         
      *****************************************************************         
      *    LINKAGE SECTION                                            *         
      *****************************************************************         
       LINKAGE SECTION.                                                         
       01  L-JCL-PARMS.                                                         
           05  PARMLENGTH                PIC S9(004) COMP SYNC.                 
           05  L-STREAM                  PIC  X(001).                           
           05  L-BYP-DATECHK-SW          PIC  X(001).                           
               88  L-BYP-DATECHK                     VALUE '1'.                 
           05  L-BYP-FILECHK-SW          PIC  X(001).                           
               88  L-BYP-FILECHK                     VALUE '1'.                 
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
       0000-MAIN SECTION.                                                       
                                                                                
           DISPLAY 'CAT813 - ACATS RESIDUAL CREDIT REPORT'.                     
           DISPLAY '         INPUT IS FROM CAT812A/CAT812'.                     
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT          THRU 1000-EXIT.                           
                                                                                
           SORT SORT-FILE ON ASCENDING SORT-KEY                                 
                INPUT  PROCEDURE IS 2000-SORT-INPUT  THRU 2000-EXIT             
                OUTPUT PROCEDURE IS 5000-SORT-OUTPUT THRU 5000-EXIT.            
                                                                                
           PERFORM 9000-CLOSE-ROUTINE THRU 9000-EXIT.                           
                                                                                
       0000-FINI.                                                               
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT SECTION.                                                       
                                                                                
           CALL SPIEEXIT-PROGRAM.                                               
                                                                                
           DISPLAY 'CAT813: L-STREAM         = '                                
                            L-STREAM.                                           
           DISPLAY 'CAT813: L-BYP-DATECHK-SW = '                                
                            L-BYP-DATECHK-SW.                                   
           DISPLAY 'CAT813: L-BYP-FILECHK-SW = '                                
                            L-BYP-FILECHK-SW.                                   
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT813: DATE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT813: DATE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT813: FILE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT813: FILE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
                                                                                
           MOVE 'CAT813'                 TO BPDATES-CALLING-PGM.                
           SET  LNKDATZ-REQUEST          TO TRUE.                               
           CALL ZBPDATES-PROGRAM USING BPDATES-PARAMETERS.                      
           MOVE BPD-PROC-DATE            TO W-PROC-DATE.                        
           MOVE BPD-PROC-DATE(3:2)       TO LD-PROC-DATE-YY.                    
           MOVE BPD-PROC-DATE(5:2)       TO LD-PROC-DATE-MM.                    
           MOVE BPD-PROC-DATE(7:2)       TO LD-PROC-DATE-DD.                    
                                                                                
           DISPLAY 'CAT813: PROC-DATE= ' BPD-PROC-DATE                          
                      '  LD-PROC-DATE= ' LD-PROC-DATE.                          
                                                                                
           ACCEPT W-SYS-DATE             FROM DATE.                             
           ACCEPT W-SYS-TIME             FROM TIME.                             
                                                                                
           OPEN INPUT  INFILE.                                                  
           DISPLAY 'CAT813: INFILE  OPENED FOR INPUT  '                         
                       ' FILE STATUS = ' INFILE-STAT.                           
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               MOVE 3002      TO  ABEND-CODE                                    
               DISPLAY ' '                                                      
               DISPLAY 'CAT813: U3002 - DD INFILE OPEN ERR, '                   
                       ' FILE STATUS = ' INFILE-STAT                            
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           PERFORM 3000-READ-INFILE THRU 3000-EXIT.                             
                                                                                
           IF  END-OF-INFILE                                                    
               DISPLAY 'CAT813: INFILE END OF FILE REACHED'                     
               IF L-BYP-FILECHK                                                 
                      DISPLAY 'CAT813: BYPASSING FILE CHECK PER JCLPARM'        
GOTO                  GO TO 1000-CONT                                           
               ELSE                                                             
                      DISPLAY 'CAT813: U3003 - ABENDING ON EMPTY FILE'          
                      MOVE +3003      TO ABEND-CODE                             
                      CALL ABEND-PROGRAM USING ABEND-CODE                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  ACATRCRF-HEADER-RECORD                                           
               SET INFILE-DATE-FOUND TO TRUE                                    
               DISPLAY 'CAT813: INFILE PROC-DATE = '                            
                                              ACATRCRF-HDR-PROC-DATE            
                             ', UPDT BY PGM=' ACATRCRF-HDR-PGM-NAME             
                                     ' DATE=' ACATRCRF-HDR-SYS-DATE             
                                     ' TIME=' ACATRCRF-HDR-SYS-TIME             
               IF  ACATRCRF-HDR-PROC-DATE = LD-PROC-DATE                        
                   DISPLAY 'CAT813: INFILE PROC-DATE = LD-PROC-DATE.'           
                                  ' OKAY.'                                      
               ELSE                                                             
                   DISPLAY 'CAT813: INFILE  DATE NOT = LD-PROC-DATE'            
                   IF L-BYP-DATECHK                                             
                   DISPLAY 'CAT813: BYPASSING DATE CHECK PER JCLPARM'           
                   ELSE                                                         
                      DISPLAY 'CAT813: U3004 - ABENDING ON BAD DATE'            
                      MOVE +3004      TO ABEND-CODE                             
                      CALL ABEND-PROGRAM USING ABEND-CODE                       
                   END-IF                                                       
               END-IF                                                           
READ           PERFORM 3000-READ-INFILE THRU 3000-EXIT                          
           ELSE                                                                 
               DISPLAY 'CAT813: INFILE  DATE RECORD MISSING'                    
                   IF L-BYP-DATECHK                                             
                   DISPLAY 'CAT813: BYPASSING DATE CHECK PER JCLPARM'           
                   ELSE                                                         
                      DISPLAY 'CAT813: U3005 - ABENDING ON BAD DATE'            
                      MOVE +3005      TO ABEND-CODE                             
                      CALL ABEND-PROGRAM USING ABEND-CODE                       
                   END-IF                                                       
           END-IF.                                                              
                                                                                
       1000-CONT.                                                               
                                                                                
           OPEN OUTPUT RCRPI-FILE.                                              
           DISPLAY 'CAT813: RCRPI    OPENED FOR OUTPUT '                        
                       ' FILE STATUS = ' RCRPI-STAT.                            
                                                                                
           IF  RCRPI-OKAY                                                       
               CONTINUE                                                         
           ELSE                                                                 
               MOVE 3003                  TO  ABEND-CODE                        
               DISPLAY ' '                                                      
               DISPLAY 'CAT813: U3003 - DD RCRPI  OPEN ERR, '                   
                       ' FILE STATUS = ' RCRPI-STAT                             
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           OPEN OUTPUT NONPI-FILE.                                              
           DISPLAY 'CAT813: NONPI    OPENED FOR OUTPUT '                        
                       ' FILE STATUS = ' NONPI-STAT.                            
                                                                                
           IF  NONPI-OKAY                                                       
               CONTINUE                                                         
           ELSE                                                                 
               MOVE 3003                  TO  ABEND-CODE                        
               DISPLAY ' '                                                      
               DISPLAY 'CAT813: U3003 - DD NONPI  OPEN ERR, '                   
                       ' FILE STATUS = ' NONPI-STAT                             
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           OPEN OUTPUT EXCPI-FILE.                                              
           DISPLAY 'CAT813: EXCPI    OPENED FOR OUTPUT '                        
                       ' FILE STATUS = ' EXCPI-STAT.                            
                                                                                
           IF  EXCPI-OKAY                                                       
               CONTINUE                                                         
           ELSE                                                                 
               MOVE 3003                  TO  ABEND-CODE                        
               DISPLAY ' '                                                      
               DISPLAY 'CAT813: U3003 - DD EXCPI  OPEN ERR, '                   
                       ' FILE STATUS = ' EXCPI-STAT                             
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           PERFORM 1500-LOAD-B1 THRU 1500-EXIT.                                 
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT. EXIT.                                                         
      /                                                                         
       1500-LOAD-B1 SECTION.                                                    
           DISPLAY 'CAT550: 1500-LOAD-B1'.                                      
                                                                                
           MOVE SPACES                   TO  B1-TABLE-AREA.                     
           MOVE 0                        TO  B1-TBL-CNT.                        
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500                
                                                                                
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO              
                                             BH-ACAT-INFO                       
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N                 
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE             
             MOVE  '434500'              TO  BH-B2-INFO-ID                      
             CALL  ZGETB1V-PROGRAM     USING BH-BROKER-HEADER-INFO              
                                             BH-ACAT-INFO                       
             ADD 1 TO B1-TBL-CNT                                                
             IF   BH-BROKER-ACTIVE                                              
                   MOVE  BH-BROKER-NUMBER-N                                     
                                         TO B1-CLT-NBR (B1-TBL-CNT)             
                   MOVE  BH-BROKER-NAME                                         
                                         TO B1-CLT-NAME (B1-TBL-CNT)            
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)                     
                                         TO B1-BKR-CLR-NO (B1-TBL-CNT)          
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '                       
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                        
                                         TO B1-STREAM     (B1-TBL-CNT)          
                   ELSE                                                         
                       MOVE BH-BROKER-MINI-MAXI-INDICATOR                       
                                         TO B1-STREAM     (B1-TBL-CNT)          
                   END-IF                                                       
                   MOVE  BH-BROKER-STATUS                                       
                                         TO B1-STATUS     (B1-TBL-CNT)          
               IF  B1-STREAM (B1-TBL-CNT) = L-STREAM                            
               AND BH-ACAT-ACTIVE                                               
                   ADD 1 TO B1-ACTIVE-CNT                                       
                   MOVE  BH-ACAT-STATUS                                         
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)          
                       DISPLAY      ' CLT ' B1-CLT-NBR    (B1-TBL-CNT)          
                                        ' ' B1-CLT-NAME   (B1-TBL-CNT)          
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)          
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)          
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)          
                                   ' ACAT ' B1-ACAT-STATUS(B1-TBL-CNT)          
               ELSE                                                             
                   MOVE ' '              TO B1-ACAT-STATUS(B1-TBL-CNT)          
               END-IF                                                           
             END-IF                                                             
                                                                                
           END-PERFORM.                                                         
                                                                                
           DISPLAY ' '.                                                         
                                                                                
           DISPLAY  'B1 ACTIVE COUNT = ' B1-ACTIVE-CNT.                         
           DISPLAY ' '.                                                         
       1500-EXIT. EXIT.                                                         
      /                                                                         
       2000-SORT-INPUT SECTION.                                                 
                                                                                
           PERFORM UNTIL INFILE-END-OF-FILE                                     
                                                                                
               PERFORM 2500-FORMAT-SORT THRU 2500-EXIT                          
               RELEASE SORT-RECORD                                              
               ADD  1             TO W-RELEASE-CNT                              
READ           PERFORM 3000-READ-INFILE THRU 3000-EXIT                          
                                                                                
           END-PERFORM.                                                         
                                                                                
       2000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       2500-FORMAT-SORT SECTION.                                                
                                                                                
           MOVE ACATRCRF-RECORD           TO SORT-RECORD.                       
           IF SORT-ACCT-EXCEPTION                                               
              MOVE 'X' TO SORT-KEY-SORT-ID                                      
           ELSE                                                                 
             IF SORT-ACCT-IS-NON-DEL                                            
LRM006       OR SORT-CURRENCY-CODE > '000000'                                   
                MOVE 'N' TO SORT-KEY-SORT-ID                                    
             ELSE                                                               
               IF SORT-ACCT-IS-SHORT                                            
                  MOVE 'N' TO SORT-KEY-SORT-ID                                  
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
       2500-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       3000-READ-INFILE  SECTION.                                               
                                                                                
           READ INFILE INTO ACATRCRF-RECORD                                     
                AT END                                                          
                   MOVE '1'              TO END-OF-INFILE-SW                    
                   DISPLAY 'CAT813: INFILE END OF FILE REACHED'                 
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           IF  INFILE-STAT NOT = '00'                                           
               DISPLAY 'CAT813: READ INFILE STATUS = ' INFILE-STAT              
                       '.  INFILE-CNT = ' W-INFILE-CNT                          
                       '.  KEY = ' ACATRCRF-KEY                                 
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT813: U3009 - DD INFILE READ ERR, '               
                           ' FILE STATUS = ' INFILE-STAT                        
                   MOVE 3009      TO  ABEND-CODE                                
                   CALL ABEND-PROGRAM USING ABEND-CODE                          
           END-IF.                                                              
                                                                                
           ADD 1 TO W-INFILE-CNT.                                               
                                                                                
           IF  ACATRCRF-TRAILER-RECORD                                          
               DISPLAY 'CAT813: INFILE REC-CNT = '                              
                                              ACATRCRF-TRL-REC-CNT              
               GO TO 3000-READ-INFILE                                           
           END-IF.                                                              
                                                                                
DJ0002     IF  ACATRCRF-SECURITY = ' CAT820'                                    
DJ0002         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0002                  ACATRCRF-KEY                                            
DJ0002                ' BYPASS SETTLING TYPE3 '                                 
DJ0002         GO TO 3000-READ-INFILE                                           
DJ0002     END-IF.                                                              
                                                                                
       3000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5000-SORT-OUTPUT SECTION.                                                
           MOVE '5000-SORT-OUTPUT              ' TO W-ROUTINE.                  
                                                                                
           DISPLAY 'CAT813: PERFORMING 5000-SORT-OUTPUT'.                       
                                                                                
           PERFORM 5500-RETURN-SORT THRU 5500-EXIT.                             
                                                                                
           PERFORM UNTIL END-OF-SORT                                            
                                                                                
               IF  B1-PRT-SUB   < SORT-CLIENT-N                                 
                   PERFORM 6000-CLT-BREAK     THRU 6000-EXIT                    
               END-IF                                                           
                                                                                
               IF  SORT-REC-IS-HDR                                              
                   MOVE SORT-RECORD       TO W-HDR-RECORD                       
               ELSE                                                             
                   IF SORT-KEY-A = W-HDR-KEY-A                                  
      ***----------- IF THERE ARE NO VALID ASSETS BYPASS DETAIL RECORDS         
      ***----------- EXCEPTIONS WILL NOT BE REPORTED                            
      ***----------- IF THERE ARE NO ASSETS.                                    
                      IF W-HDR-ASSET-CNT > 0                                    
                         PERFORM 7000-WRITE-REPORT  THRU 7000-EXIT              
                      END-IF                                                    
                   ELSE                                                         
                      DISPLAY 'SORT-KEY-A(' SORT-KEY-A ')'                      
                              ' NOT = '                                         
                          'W-HDR-KEY-A(' W-HDR-KEY-A ')'                        
                      PERFORM 7000-WRITE-REPORT  THRU 7000-EXIT                 
                   END-IF                                                       
               END-IF                                                           
                                                                                
               PERFORM 5500-RETURN-SORT   THRU 5500-EXIT                        
                                                                                
           END-PERFORM.                                                         
                                                                                
           PERFORM 6000-CLT-BREAK     THRU 6000-EXIT.                           
                                                                                
       5000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5500-RETURN-SORT SECTION.                                                
           MOVE '5500-RETURN-SORT              ' TO W-ROUTINE.                  
                                                                                
           RETURN SORT-FILE                                                     
               AT END                                                           
                     MOVE 999 TO SORT-CLIENT-N                                  
                     MOVE '1'              TO END-OF-SORT-SW                    
                     DISPLAY 'CAT813: SORT-EOF '                                
                                   ' RET=' W-RETURN-CNT                         
                     GO TO 5500-EXIT.                                           
                                                                                
           ADD  1                        TO W-RETURN-CNT.                       
           MOVE SORT-RECORD              TO ACATRCRF-RECORD.                    
DJ0002     IF   ACATRCRF-KEY-SORT-ID = 'X'                                      
DJ0002          ADD   1  TO W-EXCPI-CNT                                         
DJ0002     ELSE                                                                 
DJ0002       IF  ACATRCRF-KEY-SORT-ID = 'N'                                     
DJ0002          ADD   1  TO W-NONPI-CNT                                         
DJ0002       ELSE                                                               
DJ0002          ADD   1  TO W-RCRPI-CNT                                         
DJ0002       END-IF                                                             
DJ0002     END-IF.                                                              
                                                                                
       5500-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       6000-CLT-BREAK SECTION.                                                  
           MOVE '6000-CLT-BREAK                ' TO W-ROUTINE.                  
           IF  B1-STREAM      (B1-PRT-SUB) = L-STREAM                           
           AND B1-ACAT-STATUS (B1-PRT-SUB) = 'A'                                
               DISPLAY 'BREAK : '                                               
                       B1-PRT-SUB                                               
                   ' ' B1-CLT-NAME (B1-PRT-SUB)                                 
                     ' CLT-PG=' W-CLT-PAGE-CNT                                  
                     ' RCR-PG=' W-CLT-RCRPI-PAGE-CNT                            
                     ' NON-PG=' W-CLT-NONPI-PAGE-CNT                            
                     ' EXC-PG=' W-CLT-EXCPI-PAGE-CNT                            
           END-IF.                                                              
                                                                                
       6000-LOOP.                                                               
                                                                                
           IF  B1-PRT-SUB   < SORT-CLIENT-N                                     
               IF   B1-STREAM      (B1-PRT-SUB) = L-STREAM                      
               AND  B1-ACAT-STATUS (B1-PRT-SUB) = 'A'                           
                 IF B1-RCRPI-PRINTED (B1-PRT-SUB) NOT = '1'                     
                    PERFORM 7100-WRITE-NO-RCRPI THRU 7100-EXIT                  
                 END-IF                                                         
                 IF B1-NONPI-PRINTED (B1-PRT-SUB) NOT = '1'                     
                    PERFORM 7120-WRITE-NO-NONPI THRU 7120-EXIT                  
                 END-IF                                                         
                 IF B1-EXCPI-PRINTED (B1-PRT-SUB) NOT = '1'                     
                    PERFORM 7130-WRITE-NO-EXCPI THRU 7130-EXIT                  
                 END-IF                                                         
               END-IF                                                           
           ELSE                                                                 
               MOVE W-HDR-TI-SORT-ID     TO W-PREV-SORT-ID                      
               GO TO 6000-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  B1-PRT-SUB < 500                                                 
               ADD 1 TO B1-PRT-SUB                                              
               MOVE 0                    TO W-PAGE-CNT                          
               MOVE 0                    TO W-CLT-PAGE-CNT                      
               MOVE 0                    TO W-CLT-RCRPI-PAGE-CNT                
               MOVE 0                    TO W-CLT-NONPI-PAGE-CNT                
               MOVE 0                    TO W-CLT-EXCPI-PAGE-CNT                
               MOVE 60                   TO W-LINE-CNT                          
               GO TO 6000-LOOP                                                  
           END-IF.                                                              
                                                                                
       6000-EXIT. EXIT.                                                         
      /                                                                         
       7000-WRITE-REPORT SECTION.                                               
           MOVE '7000-WRITE-REPORT             ' TO W-ROUTINE.                  
                                                                                
DJ0002     IF   ACATRCRF-KEY-SORT-ID = 'X'                                      
DJ0002          MOVE '1' TO B1-EXCPI-PRINTED (B1-PRT-SUB)                       
DJ0002     ELSE                                                                 
DJ0002       IF  ACATRCRF-KEY-SORT-ID = 'N'                                     
DJ0002           MOVE '1' TO B1-NONPI-PRINTED (B1-PRT-SUB)                      
DJ0002       ELSE                                                               
DJ0002           MOVE '1' TO B1-RCRPI-PRINTED (B1-PRT-SUB)                      
DJ0002       END-IF                                                             
DJ0002     END-IF                                                               
                                                                                
           IF  (W-HDR-TI-CLIENT         NOT = W-PREV-CLIENT)                    
           OR  (W-HDR-TI-ACCOUNT        NOT = W-PREV-ACCOUNT)                   
           OR  (W-HDR-TI-CONTROL-NBR    NOT = W-PREV-CONTROL-NBR)               
           OR  (W-HDR-TI-RCV-NBR        NOT = W-PREV-RCV-NBR)                   
           OR  (W-HDR-TI-ACCT-RCV-NBR   NOT = W-PREV-ACCT-RCV-NBR)              
           OR  (W-HDR-TI-SORT-ID        NOT = W-PREV-SORT-ID)                   
               MOVE 60 TO W-LINE-CNT                                            
               IF  (W-HDR-TI-SORT-ID    NOT = W-PREV-SORT-ID)                   
                   MOVE 0 TO W-PAGE-CNT                                         
               END-IF                                                           
           END-IF                                                               
                                                                                
           MOVE W-HDR-TI-CLIENT            TO W-PREV-CLIENT                     
           MOVE W-HDR-TI-ACCOUNT           TO W-PREV-ACCOUNT                    
           MOVE W-HDR-TI-CONTROL-NBR       TO W-PREV-CONTROL-NBR                
           MOVE W-HDR-TI-RCV-NBR           TO W-PREV-RCV-NBR                    
           MOVE W-HDR-TI-ACCT-RCV-NBR      TO W-PREV-ACCT-RCV-NBR               
           MOVE W-HDR-TI-SORT-ID           TO W-PREV-SORT-ID                    
                                                                                
           MOVE W-HDR-TI-BRANCH-CD         TO W-HDR3-BR                         
           MOVE W-HDR-TI-ACCT-CD           TO W-HDR3-ACCT                       
           MOVE W-HDR-TI-RCV-CUST-NM       TO W-HDR3-NAME                       
           MOVE W-HDR-TI-RCV-NBR           TO W-HDR4-CONTRA-BROKER              
           MOVE W-HDR-TI-ACCT-RCV-NBR      TO W-HDR4-CONTRA-ACCOUNT             
           MOVE W-HDR-TI-CONTROL-NBR       TO W-HDR5-CONTROL-NBR                
           MOVE W-HDR-TI-STTLM-DT          TO W-HDR5-SETTLE-DATE                
LRM009     IF W-HDR-DUPE-DATABASE > SPACES                                      
LRM009        MOVE 'DUPLICATE FOUND ON'     TO W-HDR5-DUPE-MSG1                 
LRM009        MOVE W-HDR-DUPE-TRNFR-TYPE-CD TO W-HDR5-DUPE-TRNFR-TYPE           
LRM009        MOVE 'TABLE'                  TO W-HDR5-DUPE-MSG2                 
LRM009        MOVE W-HDR-DUPE-DATABASE      TO W-HDR5-DUPE-TABLE                
LRM009        MOVE W-HDR-DUPE-CONTROL-NBR   TO W-HDR5-DUPE-CONTROL-NBR          
LRM009     ELSE                                                                 
LRM009        MOVE SPACES                   TO W-HDR5-DUPE-MSG1                 
LRM009                                         W-HDR5-DUPE-TRNFR-TYPE           
LRM009                                         W-HDR5-DUPE-MSG2                 
LRM009                                         W-HDR5-DUPE-TABLE                
LRM009                                         W-HDR5-DUPE-CONTROL-NBR          
LRM009     END-IF.                                                              
                                                                                
           INITIALIZE W-DTL1-REC                                                
                      W-DTL2-REC.                                               
           IF  ACATRCRF-CASH-ACCT                                               
               MOVE 'C'            TO W-DTL1-CMS                                
           ELSE                                                                 
             IF  ACATRCRF-MRGN-ACCT                                             
                 MOVE 'M'          TO W-DTL1-CMS                                
             ELSE                                                               
               IF  ACATRCRF-SHRT-ACCT                                           
                   MOVE 'S'        TO W-DTL1-CMS                                
               END-IF                                                           
             END-IF                                                             
           END-IF                                                               
                                                                                
           IF  NOT ACATRCRF-BALANCE-RECORD                                      
               MOVE ACATRCRF-SYMBOL      TO W-DTL1-SYMBOL                       
DJ0004         MOVE ACATRCRF-SECURITY    TO W-DTL1-SEC-NO                       
               MOVE ACATRCRF-CUSIP       TO W-DTL1-CUSIP                        
               MOVE ACATRCRF-PSTN-CD     TO W-DTL1-LONG-SHORT                   
           END-IF                                                               
                                                                                
           MOVE ACATRCRF-DESC1           TO W-DTL1-DESC1                        
           MOVE ACATRCRF-QTY             TO W-DTL1-QTY                          
           MOVE ACATRCRF-AMT             TO W-DTL1-AMT                          
           MOVE ' '                      TO W-DTL1-PROCESS-IND                  
                                                                                
LRM008     IF W-HDR-TI-ACCT-CONVERSION                                          
LRM008        MOVE 'CONVERSION'       TO W-DTL1-PROCESS-IND                     
LRM008     ELSE                                                                 
TK0005     IF ACATRCRF-CURRENCY-CODE > '000000'                                 
TK0005       MOVE ACATRCRF-CURRENCY-CODE TO W-CURRENCY                          
TK0005       IF W-CURRENCY-N NUMERIC                                            
TK0005         PERFORM 7200-FCURR THRU 7200-EXIT                                
TK0005       END-IF                                                             
           ELSE                                                                 
           IF ACATRCRF-RESTRICTED                                               
              MOVE 'RESTRICTED'       TO W-DTL1-PROCESS-IND                     
           ELSE                                                                 
            IF ACATRCRF-EXCLUDED                                                
               MOVE 'EXCLUDED'         TO W-DTL1-PROCESS-IND                    
            ELSE                                                                
              IF ACATRCRF-WI-KEY = '1'                                          
                 MOVE 'WHEN ISSUE'       TO W-DTL1-PROCESS-IND                  
              ELSE                                                              
DJ0002          IF ACATRCRF-SECURITY = '   SMA '                                
DJ0002             MOVE 'SMA           '   TO W-DTL1-PROCESS-IND                
DJ0002          ELSE                                                            
DJ0002          IF ACATRCRF-SECURITY = '    EQY'                                
DJ0002             MOVE 'EQUITY EXCEPTION' TO W-DTL1-PROCESS-IND                
DJ0002          ELSE                                                            
DJ0002          IF ACATRCRF-SECURITY = '    STL'                                
DJ0002             MOVE 'STLDAT EXCEPTION' TO W-DTL1-PROCESS-IND                
DJ0002          ELSE                                                            
DJ0002           IF ACATRCRF-DESC1 = 'DEBIT CASH BALANCE'                       
DJ0002              MOVE 'DEBIT CASH      ' TO W-DTL1-PROCESS-IND               
DJ0002           ELSE                                                           
DJ0002           IF ACATRCRF-PSTN-CD = 'S'                                      
DJ0002              MOVE 'SHORT POSITION  ' TO W-DTL1-PROCESS-IND               
DJ0002           ELSE                                                           
DJ0002            IF  ACATRCRF-LONG                                             
DJ0002            AND ACATRCRF-NON-DELIVERABLE-IND = ' '                        
                  AND ACATRCRF-REMOVE-FRAC                                      
                  AND (ACATRCRF-QTY-DECIMAL NOT = 0)                            
                      MOVE 'LIQ-FRAC  '      TO W-DTL1-PROCESS-IND              
                  ELSE                                                          
                    IF   ACATRCRF-QTY-LEFT NUMERIC                              
                    AND (ACATRCRF-QTY-LEFT > -.0001)                            
                    AND (ACATRCRF-QTY-LEFT <  .0001)                            
                    AND (ACATRCRF-QTY-LEFT NOT = 0)                             
                        MOVE 'QTY < .0001'  TO W-DTL1-PROCESS-IND               
                    END-IF                                                      
                  END-IF                                                        
DJ0002           END-IF                                                         
DJ0002           END-IF                                                         
DJ0002          END-IF                                                          
DJ0002          END-IF                                                          
DJ0002          END-IF                                                          
              END-IF                                                            
            END-IF                                                              
           END-IF                                                               
TK0005     END-IF                                                               
LRM008     END-IF.                                                              
                                                                                
           MOVE W-DTL1-REC               TO W-REPT-LINE.                        
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT.                              
           ADD 2                         TO W-LINE-CNT.                         
                                                                                
           IF  ACATRCRF-DESC2 > ' '                                             
               MOVE ACATRCRF-DESC2       TO W-DTL2-DESC2                        
               MOVE W-DTL2-REC           TO W-REPT-LINE                         
               PERFORM 7700-WRITE-LINE THRU 7700-EXIT                           
               ADD 1                     TO W-LINE-CNT                          
               IF  ACATRCRF-DESC3 > ' '                                         
                   MOVE ' '              TO W-DTL2-REC                          
                   MOVE ACATRCRF-DESC3   TO W-DTL2-DESC2                        
                   MOVE W-DTL2-REC       TO W-REPT-LINE                         
                   PERFORM 7700-WRITE-LINE THRU 7700-EXIT                       
                   ADD 1                 TO W-LINE-CNT                          
               END-IF                                                           
           END-IF.                                                              
                                                                                
       7000-EXIT. EXIT.                                                         
      /                                                                         
       7100-WRITE-NO-RCRPI SECTION.                                             
           MOVE '7100-WRITE-NO-RCRPI             ' TO W-ROUTINE.                
                                                                                
           DISPLAY 'CAT813: '                                                   
                       B1-PRT-SUB                                               
                   ' ' B1-CLT-NAME (B1-PRT-SUB)                                 
                   ' NO RCR TODAY'                                              
           MOVE B1-PRT-SUB               TO W-HDR1-CLT                          
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                        
                                         TO W-HDR1-CLT-NAME                     
                                                                                
           MOVE 1                        TO W-PAGE-CNT.                         
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                        
DJ0002     ADD  1                        TO W-TOTAL-PAGE-CNT                    
DJ0002     ADD  1                        TO W-CLT-PAGE-CNT                      
DJ0002     ADD  1                        TO W-CLT-RCRPI-PAGE-CNT                
DJ0002     ADD  1                        TO W-RCRPI-PAGE-CNT                    
           MOVE 3                        TO W-LINE-CNT.                         
                                                                                
           MOVE B1-PRT-SUB               TO W-HDR1-CLT.                         
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                        
                                         TO W-HDR1-CLT-NAME.                    
                                                                                
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                          
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                          
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                          
                                                                                
           MOVE W-HDR1-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE RCRPI-REC FROM W-REPORT-REC.                                   
                                                                                
           MOVE B1-BKR-CLR-NO (B1-PRT-SUB) TO W-HDR2-BKR.                       
           MOVE W-SYS-MM                 TO W-HDR2-MM.                          
           MOVE W-SYS-DD                 TO W-HDR2-DD.                          
           MOVE W-SYS-YY                 TO W-HDR2-YY.                          
           MOVE W-SYS-HH                 TO W-HDR2-HH.                          
           MOVE W-SYS-MN                 TO W-HDR2-MN.                          
                                                                                
           MOVE W-HDR2-HEADING-LIT-1   TO W-HDR2-HEADING                        
                                                                                
           MOVE W-HDR2-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE RCRPI-REC FROM W-REPORT-REC.                                   
                                                                                
           MOVE 'NO RCR TODAY' TO W-DTLX-LIT.                                   
           MOVE W-DTLX-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT.                       
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE RCRPI-REC FROM W-REPORT-REC.                                   
                                                                                
       7100-EXIT. EXIT.                                                         
      /                                                                         
       7120-WRITE-NO-NONPI SECTION.                                             
           MOVE '7120-WRITE-NO-NONPI             ' TO W-ROUTINE.                
                                                                                
           DISPLAY 'CAT813: '                                                   
                       B1-PRT-SUB                                               
                   ' ' B1-CLT-NAME (B1-PRT-SUB)                                 
                   ' NO NON-DEL TODAY'                                          
           MOVE B1-PRT-SUB               TO W-HDR1-CLT                          
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                        
                                         TO W-HDR1-CLT-NAME                     
                                                                                
           MOVE 1                        TO W-PAGE-CNT.                         
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                        
DJ0002     ADD  1                        TO W-TOTAL-PAGE-CNT                    
DJ0002     ADD  1                        TO W-CLT-PAGE-CNT                      
DJ0002     ADD  1                        TO W-CLT-NONPI-PAGE-CNT                
DJ0002     ADD  1                        TO W-NONPI-PAGE-CNT                    
           MOVE 3                        TO W-LINE-CNT.                         
                                                                                
           MOVE B1-PRT-SUB               TO W-HDR1-CLT.                         
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                        
                                         TO W-HDR1-CLT-NAME.                    
                                                                                
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                          
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                          
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                          
                                                                                
           MOVE W-HDR1-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE NONPI-REC FROM W-REPORT-REC.                                   
                                                                                
           MOVE B1-BKR-CLR-NO (B1-PRT-SUB) TO W-HDR2-BKR.                       
           MOVE W-SYS-MM                 TO W-HDR2-MM.                          
           MOVE W-SYS-DD                 TO W-HDR2-DD.                          
           MOVE W-SYS-YY                 TO W-HDR2-YY.                          
           MOVE W-SYS-HH                 TO W-HDR2-HH.                          
           MOVE W-SYS-MN                 TO W-HDR2-MN.                          
                                                                                
           MOVE W-HDR2-HEADING-LIT-2   TO W-HDR2-HEADING                        
                                                                                
           MOVE W-HDR2-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE NONPI-REC FROM W-REPORT-REC.                                   
                                                                                
           MOVE 'NO NON-DELIVERABLES TODAY' TO W-DTLX-LIT.                      
           MOVE W-DTLX-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT.                       
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE NONPI-REC FROM W-REPORT-REC.                                   
                                                                                
       7120-EXIT. EXIT.                                                         
      /                                                                         
       7130-WRITE-NO-EXCPI SECTION.                                             
           MOVE '7130-WRITE-NO-EXCPI             ' TO W-ROUTINE.                
                                                                                
           DISPLAY 'CAT813: '                                                   
                       B1-PRT-SUB                                               
                   ' ' B1-CLT-NAME (B1-PRT-SUB)                                 
                   ' NO EXCEPTION TODAY'                                        
           MOVE B1-PRT-SUB               TO W-HDR1-CLT                          
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                        
                                         TO W-HDR1-CLT-NAME                     
                                                                                
           MOVE 1                        TO W-PAGE-CNT.                         
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                        
DJ0002     ADD  1                        TO W-TOTAL-PAGE-CNT                    
DJ0002     ADD  1                        TO W-CLT-PAGE-CNT                      
DJ0002     ADD  1                        TO W-CLT-EXCPI-PAGE-CNT                
DJ0002     ADD  1                        TO W-EXCPI-PAGE-CNT                    
           MOVE 3                        TO W-LINE-CNT.                         
                                                                                
           MOVE B1-PRT-SUB               TO W-HDR1-CLT.                         
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                        
                                         TO W-HDR1-CLT-NAME.                    
                                                                                
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                          
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                          
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                          
                                                                                
           MOVE W-HDR1-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE EXCPI-REC FROM W-REPORT-REC.                                   
                                                                                
           MOVE B1-BKR-CLR-NO (B1-PRT-SUB) TO W-HDR2-BKR.                       
           MOVE W-SYS-MM                 TO W-HDR2-MM.                          
           MOVE W-SYS-DD                 TO W-HDR2-DD.                          
           MOVE W-SYS-YY                 TO W-HDR2-YY.                          
           MOVE W-SYS-HH                 TO W-HDR2-HH.                          
           MOVE W-SYS-MN                 TO W-HDR2-MN.                          
                                                                                
           MOVE W-HDR2-HEADING-LIT-3   TO W-HDR2-HEADING                        
                                                                                
           MOVE W-HDR2-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE EXCPI-REC FROM W-REPORT-REC.                                   
                                                                                
           MOVE 'NO EXCEPTIONS TODAY' TO W-DTLX-LIT.                            
           MOVE W-DTLX-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT.                       
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           WRITE EXCPI-REC FROM W-REPORT-REC.                                   
                                                                                
       7130-EXIT. EXIT.                                                         
                                                                                
TK0005 7200-FCURR.                                                              
TK0005     MOVE W-CURRENCY-N TO CURLOOK-ARGUMENT.                       BSR62   
TK0005     CALL CURLOOK   USING CURLOOK-DATA.                           BSR62   
TK0005     IF CURLOOK-RETURNCODE  = SPACES                              BSR62   
TK0005       STRING 'FCURR - '                                          BSR62   
TK0005               CURLOOK-SYMBOL DELIMITED BY SIZE                   BSR62   
TK0005         INTO  W-DTL1-PROCESS-IND                                 BSR62   
TK0005       END-STRING                                                         
TK0005     END-IF.                                                              
TK0005 7200-EXIT. EXIT.                                                         
      /                                                                         
       7700-WRITE-LINE SECTION.                                                 
           MOVE '7700-WRITE-LINE               ' TO W-ROUTINE.                  
                                                                                
           IF   W-LINE-CNT > 55                                                 
                PERFORM 7800-WRITE-HDR THRU 7800-EXIT.                          
                                                                                
           MOVE W-REPT-LINE              TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT.                       
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
                                                                                
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
                                                                                
       7700-EXIT. EXIT.                                                         
      /                                                                         
       7800-WRITE-HDR    SECTION.                                               
           MOVE '7800-WRITE-HDR                ' TO W-ROUTINE.                  
                                                                                
           ADD  1                        TO W-PAGE-CNT.                         
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE.                        
DJ0002     ADD  1                        TO W-TOTAL-PAGE-CNT                    
DJ0002     ADD  1                        TO W-CLT-PAGE-CNT                      
DJ0002     IF   ACATRCRF-KEY-SORT-ID = 'X'                                      
DJ0002          ADD  1                   TO W-EXCPI-PAGE-CNT                    
DJ0002          ADD  1                   TO W-CLT-EXCPI-PAGE-CNT                
DJ0002     ELSE                                                                 
DJ0002       IF  ACATRCRF-KEY-SORT-ID = 'N'                                     
DJ0002           ADD  1                  TO W-NONPI-PAGE-CNT                    
DJ0002           ADD  1                  TO W-CLT-NONPI-PAGE-CNT                
             ELSE                                                               
DJ0002           ADD  1                  TO W-RCRPI-PAGE-CNT                    
DJ0002           ADD  1                  TO W-CLT-RCRPI-PAGE-CNT                
             END-IF                                                             
DJ0002     END-IF                                                               
                                                                                
           MOVE B1-PRT-SUB               TO W-HDR1-CLT.                         
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                        
                                         TO W-HDR1-CLT-NAME.                    
                                                                                
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM.                          
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD.                          
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY.                          
                                                                                
           MOVE W-HDR1-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
                                                                                
           MOVE B1-BKR-CLR-NO (B1-PRT-SUB) TO W-HDR2-BKR.                       
           MOVE W-SYS-MM                 TO W-HDR2-MM.                          
           MOVE W-SYS-DD                 TO W-HDR2-DD.                          
           MOVE W-SYS-YY                 TO W-HDR2-YY.                          
           MOVE W-SYS-HH                 TO W-HDR2-HH.                          
           MOVE W-SYS-MN                 TO W-HDR2-MN.                          
                                                                                
DJ0002     IF   ACATRCRF-KEY-SORT-ID = 'X'                                      
DJ0002          MOVE W-HDR2-HEADING-LIT-3   TO W-HDR2-HEADING                   
DJ0002     ELSE                                                                 
DJ0002       IF  ACATRCRF-KEY-SORT-ID = 'N'                                     
                 MOVE W-HDR2-HEADING-LIT-2   TO W-HDR2-HEADING                  
             ELSE                                                               
                 MOVE W-HDR2-HEADING-LIT-1   TO W-HDR2-HEADING                  
             END-IF                                                             
DJ0002     END-IF                                                               
                                                                                
           MOVE W-HDR2-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
                                                                                
           MOVE W-HDR3-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
                                                                                
           MOVE W-HDR4-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
                                                                                
           MOVE W-HDR5-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
                                                                                
           MOVE W-HDR6-REC               TO W-REPORT-LINE.                      
           MOVE B1-PRT-SUB               TO W-REPORT-CLT                        
           MOVE LOW-VALUES               TO W-REPORT-FIL.                       
           PERFORM 7810-WRITE-OUTPUT THRU 7810-EXIT.                            
                                                                                
           MOVE 8                        TO W-LINE-CNT.                         
                                                                                
       7800-EXIT. EXIT.                                                         
                                                                                
       7810-WRITE-OUTPUT.                                                       
DJ0002     IF   ACATRCRF-KEY-SORT-ID = 'X'                                      
DJ0002          WRITE EXCPI-REC FROM W-REPORT-REC                               
DJ0002     ELSE                                                                 
DJ0002       IF  ACATRCRF-KEY-SORT-ID = 'N'                                     
DJ0002           WRITE NONPI-REC FROM W-REPORT-REC                              
DJ0002       ELSE                                                               
DJ0002           WRITE RCRPI-REC FROM W-REPORT-REC                              
DJ0002       END-IF                                                             
DJ0002     END-IF.                                                              
                                                                                
       7810-EXIT. EXIT.                                                         
      /                                                                         
       9000-CLOSE-ROUTINE SECTION.                                              
                                                                                
           CLOSE INFILE.                                                        
           DISPLAY 'CAT813: ACATRCRF   CLOSED. STATUS = '                       
                                               INFILE-STAT.                     
                                                                                
           CLOSE RCRPI-FILE.                                                    
           DISPLAY 'CAT813: RCRPI    CLOSED. STATUS = '                         
                                               RCRPI-STAT.                      
                                                                                
           CLOSE NONPI-FILE.                                                    
           DISPLAY 'CAT813: NONPI    CLOSED. STATUS = '                         
                                               NONPI-STAT.                      
                                                                                
           CLOSE EXCPI-FILE.                                                    
           DISPLAY 'CAT813: EXCPI    CLOSED. STATUS = '                         
                                               EXCPI-STAT.                      
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT813: INFILE CNT = ' W-INFILE-CNT.                        
           DISPLAY 'CAT813: RCRPI  CNT = ' W-RCRPI-CNT.                         
           DISPLAY 'CAT813: NONPI  CNT = ' W-NONPI-CNT.                         
           DISPLAY 'CAT813: EXCPI  CNT = ' W-EXCPI-CNT.                         
           DISPLAY 'CAT813: RCRPI-PAGE = ' W-RCRPI-PAGE-CNT.                    
           DISPLAY 'CAT813: NONPI-PAGE = ' W-NONPI-PAGE-CNT.                    
           DISPLAY 'CAT813: EXCPI-PAGE = ' W-EXCPI-PAGE-CNT.                    
           DISPLAY 'CAT813: TOTAL-PAGE = ' W-TOTAL-PAGE-CNT.                    
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT813: PROGRAM ENDED SUCCESSFULLY'.                        
                                                                                
       9000-EXIT.                                                               
           EXIT.                                                                
      *################################################################         
