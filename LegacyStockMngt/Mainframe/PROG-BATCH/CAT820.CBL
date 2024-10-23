000001* PDX    - CAT820   C0361186 12/30/14 11:51:08 TBLAMUR            00001000
000001* LRM014 - SSR 103323 CHARGE PAPER STATEMENT FEES.                        
000001* LRM014 -   READ QSAM FILE FROM ZIFP TO LOOKUP FEE, AND SAVE             
000001* LRM014 -   ACAT CONTROL NUMBER, AND PASS FEE AMT TO CAT820DB.           
000001* LRM013 - SSR 92907 CORRECT TRADE REJECT ON TACL FILE DUE TO             
000001* LRM013 -   S/D LESS THAN TODAY.  MOVE SPACES AND P+S WILL               
000001* LRM013 -   TO NEXT DATE.                                                
000001* PDX    - CAT820   C0326974 10/02/12 08:42:50 TBLAMUR            00001000
000001* LRM012 - SSR 84592 EXPAND B1 434903 BY 100 OCCURS TO 200.               
000001* PDX    - CAT820   C0322803 10/02/12 08:33:58 TBLAMUR            00001000
000001* LRM011 - SSR 79838 EXPAND B1 434912 BY 100 OCCURS.                      
000001* LRM010 - SSR 83091 CLIENT 10 IRA FEES FOR LEGACY ACCOUNTS.              
000001* PDX    - CAT820   C0321761 02/05/12 12:09:38 TBLAMUR            00001000
000001* LRM009 - SSR 79558 CLIENT 10 TYPE1 TO TYPE4 POSN MOVEMENT.              
000001* LRM009 -   THE TYPE4 POSN WAS DELIVERED AS A TYPE1 SL=50 SFK TO         
000001* LRM009 -   CAUSE A FAIL, JOURNAL THE QTY ACROSS TO FLATTEN ACCT.        
000001* PDX    - CAT820   C0317345 11/11/11 09:13:13 TBLAMUR            00001000
000001* LRM008 - SSR 79096 CREATE BALANCE MOVEMENT FOR PENDING DIVIDEND         
000001* LRM008 -   FROM TYPE1 TO TYPE8.                                         
000001* PDX    - CAT820   C0296621 10/14/10 14:34:41 TBLAMUR            00001000
000001* LRM007 - SSR 71810 FOREIGN ASSET FEES B1 434913 434755.                 
000001* LRM007 -  RULES ARE B1 STREETSIDE AC MATCHES TO B1, AND MSD HAS         
000001* LRM007 -         CNS=N, AND ISIN(1:2) NOT 'US' (DETERMINED IN           
000001* LRM007 -      10/13/10 REMOVE DTC=Y FROM THE BYPASS SEE CAT519          
000001* LRM007 -                   AND CAT810)                                  
000001* PDX    - CAT820   C0260091 04/30/08 10:56:36 TBLAMUR            00001000
000001* LRM006 - SSR 55766 ASCENDIS(WORKFLOW) PASS DATE RECORDS FROM            
000001* LRM006 -          TFRSFLI FILE ONTO CSHADJ FILE                         
000001* PDX    - CAT820   C0249006 06/29/07 14:23:22 TBLAMUR            00001000
000001* DJ0002 - SSR 47339 SUPPORT DUALLY LISTED SECURITIES                     
000001* DJ0002 -           POPULATE GETMSD-CLIENT-NO WHEN CALLING GETMSD        
000001* PDX    - CAT820   C0231201 02/14/06 09:27:08 TBLAMUR                    
000001* LRM005 - SSR 46029 DON'T CHARGE FEE CLIENT 30 DLVY TO 0188              
000001* PDX    - CAT820   C0226568 11/10/05 14:05:30 TBLAMUR                    
000001* LRM004 - SSR 31952 FIX CAT31 REPORT WRONG FEES. DO NOT PASS             
000001* IRA FEE TO CAT820DB TO UPD VTRNFR WHEN IT DOES NOT BOOK.                
000001* PDX    - CAT820   C0210131 06/03/05 08:39:30 TBLAMUR                    
000001* DJ0001 - DISPLAY CYCLE NO ON REPORT HEADER FOR INTRA-DAY FEES           
000001* DJ0001 - CHANGE PIC 9 TO PIC 9 COMP-3 FOR MIPS REDUCTION.               
000001* LRM003 - CREATE CREDIT ADJUSTMENT FOR PTR FRAC QTY B1 434708=1          
000001* PDX    - CAT820   C0162146 07/27/01 12:15:12 TBLAMUR                    
000001* PDX    - CAT820   C0159961 06/11/01 11:55:17 TBBIREB                    
000001* PDX    - CAT820   C0158538 05/09/01 14:27:57 TBLAMUR                    
000001* PDX    - CAT820   C0155949 04/11/01 09:35:19 TBLAMUR                    
000001* PDX    - CAT820   C0154401 02/22/01 13:45:16 TBLAMUR                    
000001* PDX    - CAT820   C0141327 08/15/00 15:33:20 TBTIKUO                    
000001* PDX    - CAT820   C0127273 08/16/99 15:02:28 TBLAMUR                    
000001* PDX    - CAT820   C0126230 07/23/99 15:04:50 TBEDTAK                    
000001* PDX    - CAT820   C0126027 05/20/99 09:40:16 TBLAMUR                    
000001* PDX    - CAT820   C0125133 05/13/99 09:55:38 TBLAMUR                    
000001* PDX    - CAT820   C0124738 04/26/99 10:27:35 TBLAMUR                    
000001* PDX    - CAT820   C0123087 04/12/99 11:44:53 TBLAMUR                    
000001* PDX    - CAT820   C0122717 03/10/99 09:50:07 TBEDTAK                    
000001* PDX    - CAT820   C0122068 02/21/99 09:26:00 TBYOHON                    
000001* PDX    - CAT820   C0121216 02/10/99 16:47:53 TBLAMUR                    
000001* PDX    - CAT820   C0121138 01/31/99 16:47:25 TBGESHE                    
000001* PDX    - CAT820   C0120641 01/28/99 17:13:10 TBLAMUR                    
000001* PDX    - CAT820   C0119911 01/09/99 14:42:45 TBLAMUR                    
000001* PDX    - CAT820   C0118497 11/23/98 08:40:49 TBLAMUR                    
000001* PDX    - CAT820   C0115132 11/13/98 12:29:21 TBLAMUR                    
000001* PDX    - CAT09    C0109386 03/30/98 17:37:55 TQCHSCA                    
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT820.                                                     
                                                                                
      *-------------------------------------------------------------*           
      *  THE PURPOSE OF THIS PROGRAM IS TO BOOK ACAT TRANSFER FEES.             
      *    THIS IS NOW BASED ON B1 434577.                                      
      *  PROGRAM WAS MODELLED FROM CAT09 ON 10-01-98.                           
      *                                                                         
      *  A NEW FUNCTION WAS ADDED TO MOVE TYPE(3) TO TYPE(1) BALANCES           
      *    BASED ON B1 434512.                                                  
      *                                                                         
      *  A NEW FUNCTION WAS ADDED TO LIQUIDATE FRACTIONAL SHARES                
      *    BASED ON B1 434537 ONLY.                                             
      *    THE LIQ IS DONE BY MOVING THE FRAC QTY TO AN OFFSET ACCOUNT          
      *    (ON B1 434537) AND UPDATING THE ACCOUNT TYPE 1 (CASH) WITH           
      *    WITH THE MARKET VALUE.  THE BOOKING RECORDS ARE CREATED AND          
      *    RETAINED UNTIL THE TRANSFER REACHES REQUEST STATUS EQUAL TO          
      *    THE #DAYS SPECIFIED ON B1 434516.                                    
      *                                                                         
      * THE TRANSFER FILE WAS REPLACED BY EXTRACT FILE FROM PROGRAM             
      *    CAT810.  THE RECORDS IN THIS FILE ARE BUILD FOR FULL DELIVERY        
      *    TRANSFER REQUESTS ONLY, WHICH WE ARE CREATING AND ARE                
      *    ABOUT TO SEND TO NSCC. A NET CASH ADJUSTMENT FILE IS CREATED         
      *    AND PASSED TO PROGRAM CAT820DB, TO BE USED TO UPDATE THE CASH        
      *    BALANCE ON THE INITIAL ASSET DATABASE. THE P2 RECORDS ARE            
      *    ALSO CREATED AT THIS TIME. THEY MAY BE PASSED TO REPOSITORY          
      *    AND NOT BOOKED.  THE CASH ADJUSTMENT IS NOT PASSED UNTIL THE         
      *    TRANSFER REACHES THE #DAYS SPECIFIED ON B1 434516.                   
      * 04-12-99 ONLY CREATE FEES IN REQUEST STATUS.                            
LRM001* 08-16-99 REMOVE TYPE3 BALANCE BUG.                                      
TCK001* 08-25-00 SSR # 3248900,                                                 
TCK001*    EXPANDED B1 CARD 434577 ENTRIES FROM 100 TO 200,                     
TCK001*    ELIMINATES ACCESSING BH-BTS2-INFORMATION (B1-511000).                
TCK001*    ALSO STOP USING B1 CARD 511011, 511221, 511223, 511233.              
LRM002* 03-27-01 SSR 5135900 NEW B1S 434671,2 CONSTITUTE IRA FEES.              
      * 06-08-01 SSR R4661200 EXPAND B1 CARD 434577 FROM 200 TO 400             
      *          USING NEW B1 434912 IN BHAT3.                                  
      *-------------------------------------------------------------*           
                                                                                
       ENVIRONMENT DIVISION.                                                    
                                                                                
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT TFRS-I-FILE                                                   
                                   ASSIGN TFRSFLI.                              
                                                                                
           SELECT REG-OPT-FILE                                                  
                                   ASSIGN REGOPV                                
                                   ORGANIZATION INDEXED                         
                                   ACCESS MODE RANDOM                           
                                   RECORD KEY IS REG-OPT-KEY-AREA               
                                   FILE STATUS IS                               
                                       REG-FILE-STATUS.                         
                                                                                
LRM014     SELECT PAPERFEE         ASSIGN       TO PAPERFEE                     
LRM014                             ACCESS          DYNAMIC                      
LRM014                             ORGANIZATION    INDEXED                      
LRM014                             RECORD KEY   IS PAPER-FEE-DTL-KEY            
LRM014                             FILE STATUS  IS PAPERFEE-STAT.               
                                                                                
           SELECT CASH-ADJUSTMENT-FILE                                          
                                   ASSIGN CASHADJ.                              
                                                                                
           SELECT P2BKPG-FILE      ASSIGN P2BKPG.                               
                                                                                
           SELECT RETAIN-FILE      ASSIGN RETAIN.                               
                                                                                
           SELECT REPORT-FILE      ASSIGN RPT.                                  
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  TFRS-I-FILE                                                          
           RECORDING MODE IS F                                                  
           LABEL RECORDS ARE STANDARD                                           
           BLOCK CONTAINS 0 RECORDS.                                            
       COPY ACATDLVF REPLACING ==:FMT:== BY ==TFRS==.                           
                                                                                
       FD  REG-OPT-FILE.                                                        
       01  REGISTRATION-OPT-REC.                                                
       COPY BNWREGOP.                                                           
                                                                                
       FD  P2BKPG-FILE                                                          
           RECORDING MODE IS F                                                  
           LABEL RECORDS STANDARD                                               
           BLOCK CONTAINS 0 RECORDS                                             
           RECORD CONTAINS 120 CHARACTERS.                                      
       01  P2BKPG-RECORD               PIC X(120).                              
                                                                                
LRM014*** PAPER STATEMENT FEE FILE                                              
LRM014 FD  PAPERFEE.                                                            
LRM014     COPY IFPFUTAC REPLACING ==:IFPFUTAC:== BY ==PAPER-FEE==.             
                                                                                
       FD  CASH-ADJUSTMENT-FILE                                                 
           RECORDING MODE IS F                                                  
           LABEL RECORDS STANDARD                                               
           BLOCK CONTAINS 0 RECORDS.                                            
       COPY ACATCSHA REPLACING ==:FMT:== BY ==CASH==.                           
                                                                                
       FD  RETAIN-FILE                                                          
           RECORDING MODE IS V                                                  
           LABEL RECORDS STANDARD                                               
           BLOCK CONTAINS 0 RECORDS.                                            
LRM007 01  RET-P2-REC                  PIC X(640).                              
LRM007 01  RET-TACT-REC                PIC X(426).                              
                                                                                
       FD  REPORT-FILE                                                          
           RECORDING MODE IS F                                                  
           LABEL RECORDS STANDARD                                               
           BLOCK CONTAINS 0 RECORDS.                                            
       01  REPORT-REC                  PIC X(143).                              
                                                                                
      ****************************************************************          
           EJECT                                                                
       WORKING-STORAGE SECTION.                                                 
                                                                                
       77  WS-TACT-DDNAME             PIC X(08) VALUE 'TACT  '.                 
       01  FILE-STATUS-FIELDS.                                                  
           05  REG-FILE-STATUS            PIC XX.                               
               88  REG-FILE-INVALID-KEY         VALUE '20' THRU '29'.           
           05  PEND-FILE-STATUS           PIC XX.                               
               88  IO-ACTION-OK               VALUE '00'  '97'.                 
               88  PEND-FILE-AT-END           VALUE '10'.                       
               88  PEND-INVALID-KEY           VALUE '20' THRU '29'.             
LRM014     05  PAPERFEE-STAT             PIC X(002).                            
LRM014         88 VALID-PAPERFEE-STAT    VALUE '00' '04' '10' '23'.             
LRM014         88 PAPERFEE-OKAY          VALUE '00' THRU '09', '97'.            
LRM014         88 PAPERFEE-END-OF-FILE   VALUE '10'.                            
LRM014         88 PAPERFEE-NOT-FOUND     VALUE '23'.                            
LRM014         88 PAPERFEE-EMPTY-MISSING VALUE '35'.                            
           COPY STUBCPY.                                                        
LRM007 01  ZMSRIO                   PIC  X(08)      VALUE 'ZMSRIO'.             
       01  ZTACTIO                  PIC  X(08)      VALUE 'ZTACTIO'.            
           COPY TACTIOC REPLACING ==:TACTIO:== BY ==TACTIO==.                   
       01  WORK-FIELDS.                                                         
           05  PGM-NME                 PIC X(6)  VALUE 'CAT820'.                
           05  WS-SAVE-CLIENT          PIC 9(3)  VALUE ZERO.                    
           05  WS-BROKER-CLEARING-NUM  PIC XXXX.                                
           05  WS-CLIENT-NAME          PIC X(30).                               
           05  CLIENT-STREAM           PIC X.                                   
           05  FUND-PROCESS-CODE       PIC X.                                   
           05  W-SUB1                  PIC  9(005) COMP-3 VALUE 0.              
           05  WS-RESTART-LIT.                                                  
               10  FILLER              PIC X(3) VALUE 'RST'.                    
               10  WS-RESTART-COUNT    PIC 9(7) VALUE 0.                        
      *   WORK FIELDS FOR USING CLIENT, BRANCH NUMBERS AS NUMERICS              
           05  WS-CLIENT-NO.                                                    
               10  WS-CLIENT-NO-A      PIC XXX.                                 
               10  WS-CLIENT-NO-N  REDEFINES WS-CLIENT-NO-A PIC 999.            
           05  B1-SUB                  PIC 999 COMP-3 VALUE 0.                  
           05  B1-SUB1                 PIC 999 COMP-3 VALUE 0.                  
           05  B1-SUB1-SVE             PIC 999 COMP-3 VALUE 0.                  
           05  B1-SUB2                 PIC 999 COMP-3 VALUE 0.                  
           05  B1-SUB2-SVE             PIC 999 COMP-3 VALUE 0.                  
           05  B6-SUB                  PIC 999 COMP-3 VALUE 0.                  
LRM011     05  B6-EXT                  PIC 999 COMP-3 VALUE 0.                  
           05  B7-SUB                  PIC 999 COMP-3 VALUE 0.                  
           05  B9-SUB                  PIC 999 COMP-3 VALUE 0.                  
           05  I-SUB                   PIC 999 COMP-3 VALUE 0.                  
           05  B11-SUB                 PIC 999 COMP-3 VALUE 0.                  
           05  B12-SUB                 PIC 999 COMP-3 VALUE 0.                  
LRM007     05  B13-SUB                 PIC 999 COMP-3 VALUE 0.                  
LRM012     05  B14-SUB                 PIC 999 COMP-3 VALUE 0.                  
           05  XFR-OCCURS-CTR.                                                  
               10  XFR-FEE-MAX-1           PIC 999 COMP-3 VALUE 0.              
               10  XFR-FEE-MAX-2           PIC 999 COMP-3 VALUE 0.              
               10  XFR-FEE-MAX-3           PIC 999 COMP-3 VALUE 0.              
           05  IRA-SUB                 PIC 999 COMP-3 VALUE 0.                  
           05  B1-TBL-CNT              PIC 999 COMP-3 VALUE 0.                  
      *ABORT AND SPIE CODES                                                     
           05  ABORT-CODE              PIC S9(4) COMP SYNC VALUE 99.            
      * FIELDS FOR MOVING SOME B1 DATA SPEC 9(5) ACTUALLY 9(3)V99               
           05  XFER-FEE-IN             PIC 9(5).                                
           05  XFER-FEE-ACTUAL REDEFINES XFER-FEE-IN                            
                                       PIC 9(3)V99.                             
           05  XFER-IND-AREA           PIC X(35).                               
           05  FILLER REDEFINES XFER-IND-AREA.                                  
               10  XFER-IND-TEST OCCURS 35 TIMES                                
                                       PIC X.                                   
           05  MAINT-WORK              PIC 9(3)V99 COMP-3 VALUE ZERO.           
           05  TEST-XFER-BATCH-ENTRY   PIC X(06).                               
           05  CURRENT-ACCOUNT-KEY.                                             
               10  CAK-CLIENT          PIC 9(3).                                
               10  CAK-BRAC.                                                    
                   12  CAK-BRANCH      PIC X(3).                                
                   12  CAK-ACCOUNT     PIC X(5).                                
           05  WS-DATE-YYMMDD          PIC X(06).                               
           05  WS-DATE-CCYYMMDD        PIC X(08).                               
DJ0001     05  WS-CYCLE-DATA           PIC X(08)        VALUE ' '.              
                                                                                
LRM007 COPY GETMRCOB.                                                           
LRM007 01  GET-SR-WORK-AREA.                                                    
LRM007     05  SRMAS-KEY.                                                       
LRM007         10 SRMAS-CLIENT     PIC XXX   VALUE SPACE.                       
LRM007         10 SRMAS-CUSIP.                                                  
LRM007            15 SRMAS-CUSIP-9  PIC X(09).                                  
LRM007            15 SRMAS-CUSIP-3  PIC X(03).                                  
LRM007         10 SRMAS-BR-AC.                                                  
LRM007            15 SRMAS-BRANCH   PIC X(03).                                  
LRM007            15 SRMAS-ACCT     PIC X(05).                                  
LRM007         10 SRMAS-CUR-TYP-CHK.                                            
LRM007            15 SRMAS-CURR     PIC X(03).                                  
LRM007            15 SRMAS-TYPE     PIC X(01).                                  
LRM007            15 SRMAS-CHK      PIC X(01).                                  
LRM007     05  SR-OFFSET-ACCOUNT-FOUND-SW  PIC X(01).                           
LRM007         88  SR-OFFSET-ACCOUNT-FOUND            VALUE 'Y'.                
LRM007     05  WS-SR-PROC-KEY.                                                  
LRM007         07 WS-SR-PROC-CL-CUSIP.                                          
LRM007            10 WS-SR-PROC-CLIENT PIC XXX  VALUE SPACE.                    
LRM007            10 FILLER            PIC X    VALUE LOW-VALUES.               
LRM007            10 WS-SR-PROC-CUSIP.                                          
LRM007               15 WS-SR-PROC-CUSIP-1-2  PIC X(02).                        
LRM007               15 WS-SR-PROC-CUSIP-3-11 PIC X(09).                        
LRM007               15 WS-SR-PROC-CUSIP-12   PIC X(01).                        
LRM007               15 WS-SR-PROC-CUSIP-13-15.                                 
LRM007                  20 WS-SR-PROC-CUSIP-2 PIC X(02).                        
LRM007                  20 WS-SR-PROC-CUSIP-1 PIC X(01).                        
LRM007         07 WS-SR-PROC-SYMBOL           PIC X(12)  VALUE SPACES.          
LRM007         07 FILLER                      PIC X(02).                        
LRM007         07 WS-SR-FAM-NUM         PIC X(02).                              
LRM007         07 WS-SR-PROC-BRANCH     PIC X(03).                              
LRM007         07 WS-SR-PROC-ACCT-1-5   PIC X(05).                              
LRM007         07 WS-SR-PROC-ACCT-6-10  PIC X(05).                              
LRM007         07 WS-SR-PROC-CURR-TYPE-CK.                                      
LRM007            15 WS-SR-PROC-CURR PIC X(03).                                 
LRM007            15 WS-SR-PROC-TYPE PIC X(01).                                 
LRM007            15 WS-SR-PROC-CHK PIC X(01).                                  
                                                                                
LRM007     05  WS-STOCK-REC-TD-QTY    PIC S9(12)V9(5) COMP-3.                   
LRM007     05  WS-SR-LOOKUP-BRAC.                                               
LRM007         07  WS-SR-LOOKUP-BR    PIC X(3).                                 
LRM007         07  WS-SR-LOOKUP-AC    PIC X(5).                                 
                                                                                
       01  XFER-FEE-DESCRIPTION.                                                
           05  XFE-MSG           PIC X(18).                                     
           05  XFE-AMOUNT        PIC ZZ9.99.                                    
       01  FEE-WORK-AREA.                                                       
           05  XFER-FEE-REG            PIC 9(3)V99      VALUE ZERO.             
           05  XFER-FEE-OFFSET         PIC X(09)        VALUE SPACES.           
           05  XFER-FEE-REG-BATCH      PIC X(2)         VALUE SPACES.           
           05  XFER-FEE-REG-ENTRY      PIC X(3)         VALUE SPACES.           
           05  XFER-FEE-IRA            PIC 9(3)V99      VALUE ZERO.             
           05  XFER-FEE-IRA-OFFSET     PIC X(09)        VALUE SPACES.           
           05  XFER-FEE-IRA-BATCH      PIC X(2)         VALUE SPACES.           
           05  XFER-FEE-IRA-ENTRY      PIC X(3)         VALUE SPACES.           
           05  MAINT-FEE-IRA           PIC 9(3)V99      VALUE ZERO.             
           05  MAINT-FEE-IRA-OFFSET    PIC X(09)        VALUE SPACES.           
           05  MAINT-FEE-BATCH         PIC X(2)         VALUE SPACES.           
           05  MAINT-FEE-ENTRY         PIC X(3)         VALUE SPACES.           
LRM007     05  FRGN-FEE-AMT            PIC 9(5)V99      VALUE ZERO.             
LRM007     05  FRGN-FEE-TOTAL          PIC 9(5)V99      VALUE ZERO.             
LRM007     05  FRGN-FEE-OFFSET         PIC X(09)        VALUE SPACES.           
LRM007     05  FRGN-FEE-BATCH          PIC X(2)         VALUE SPACES.           
LRM007     05  FRGN-FEE-ENTRY          PIC X(3)         VALUE SPACES.           
LRM014     05  PAPER-STMNT-FEE         PIC 9(5)V99      VALUE ZERO.             
           05  FEE-WORK                PIC 9(3)V99      VALUE ZERO.             
           05  TOT-FEE-WORK            PIC 9(3)V99      VALUE ZERO.             
           05  WS-CASH-ADJ-AMT-TYPE1   PIC S9(15)V99    VALUE ZERO.             
           05  WS-CASH-ADJ-AMT-TYPE2   PIC S9(15)V99    VALUE ZERO.             
           05  WS-CASH-ADJ-AMT-TYPE5   PIC S9(15)V99    VALUE ZERO.             
           05  WS-POS-TYPE-LEGG        PIC 9(9) COMP-3  VALUE ZERO.             
           05  WS-POS-TYPE-NON-LEGG    PIC 9(9) COMP-3  VALUE ZERO.             
                                                                                
       01  COUNTERS COMP-3.                                                     
           02  JOB-COUNTERS.                                                    
               05  TFRS-DTL-RECS               PIC 9(7) VALUE ZERO.             
               05  TFRS-BYP-CLI                PIC 9(7) VALUE ZERO.             
               05  TFRS-BYP-RANGE              PIC 9(7) VALUE ZERO.             
               05  CASH-RECS-WRTN              PIC 9(7) VALUE ZERO.             
               05  P2-RECS-WRTN                PIC 9(11) VALUE ZERO.            
                                                                                
           EJECT                                                                
       01  SWITCHES.                                                            
           05  ACAT-FIRST-TIME-SW            PIC X VALUE 'Y'.                   
               88  ACAT-FIRST-TIME                 VALUE 'Y'.                   
           05  TFRS-FILE-EOF-SW              PIC X VALUE ' '.                   
               88  TFRS-END-OF-FILE                VALUE 'Y'.                   
           05  ACAT-RECORD-SW                PIC X VALUE ' '.                   
               88  ACAT-RECORD-WRITTEN             VALUE 'Y'.                   
           05  MEMO-SEARCH-SW                PIC X VALUE ' '.                   
               88  END-OF-MEMO-SEARCH              VALUE 'Y'.                   
           05  ACAT-CASH-REPORTING-SW        PIC X VALUE ' '.                   
               88  ACAT-CASH-REPORTED              VALUE 'Y'.                   
           05  B1-TABLE-SEARCH-STATUS        PIC X VALUE ' '.                   
               88  B1-ENTRY-FOUND                  VALUE 'Y'.                   
               88  B1-ENTRY-NOT-FOUND              VALUE 'N'.                   
           05  B1-TABLE-SEARCH-SWITCH        PIC X VALUE ' '.                   
               88  B1-SEARCH-END                   VALUE 'Y'.                   
           05  B1-RANGE-SEARCH-STATUS        PIC X VALUE ' '.                   
               88  B1-RANGE-FOUND                  VALUE 'Y'.                   
               88  B1-RANGE-NOT-FOUND              VALUE 'N'.                   
           05  B1-RANGE-SEARCH-SWITCH        PIC X VALUE ' '.                   
               88  B1-RANGE-SEARCH-END             VALUE 'Y'.                   
           05  ACAT-EXCLUDE-SW               PIC X VALUE 'N'.                   
               88  EXCLUDE-THIS-REC                VALUE 'Y'.                   
           05 CLIENT-ACCOUNT-SEARCH-STATUS   PIC X.                             
               88 CLIENT-ACCT-SEARCH-PENDING     VALUE 'P'.                     
               88 DONE-SEARCHING-CLIENT-ACCT     VALUE 'F' 'N'.                 
           05 CLIENT-ACCOUNT-STATUS          PIC X.                             
               88 CLIENT-ACCT-ACTIVE             VALUE 'F'.                     
               88 CLIENT-ACCT-NOT-ACTIVE         VALUE 'N'.                     
           05  ACCOUNT-ITEM-IND              PIC X.                             
               88 ACTIVE-ACCOUNT-ITEM            VALUE 'A'.                     
               88 NOT-ACTIVE-ACCOUNT-ITEM        VALUE 'I'.                     
           05  ACCOUNT-IND                   PIC X.                             
               88 ACTIVE-ACCOUNT                 VALUE 'A'.                     
               88 NOT-ACTIVE-ACCOUNT             VALUE 'I'.                     
               88 INACTIVE-ACCOUNT               VALUE 'I'.                     
           05  B1-RESULT                     PIC X.                             
               88 CLIENT-NOT-FOUND               VALUE '9'.                     
               88 CLIENT-FOUND                   VALUE '0'.                     
               88 NO-MORE-CLIENTS                VALUE 'X'.                     
           05  MSD-RESULT                    PIC X.                             
               88 MSD-RECORD-FOUND               VALUE '9'.                     
               88 MSD-RECORD-NOT-FOUND           VALUE '0'.                     
           05  NEW-ACCOUNT-SW                PIC X VALUE 'N'.                   
               88  NEW-ACCOUNT                   VALUE 'Y'.                     
           05  P2-PROCESS-TYPE               PIC X VALUE ' '.                   
LRM007         88  P2-FOREIGN                      VALUE 'F'.                   
               88  P2-XFER                         VALUE 'X'.                   
               88  P2-XFER-IRA                     VALUE 'Y'.                   
               88  P2-MAINT                        VALUE 'M'.                   
           05  IRA-ACCOUNT-IND               PIC X VALUE ' '.                   
               88  IRA-ACCOUNT                     VALUE 'Y'.                   
               88  NON-IRA-ACCOUNT                 VALUE 'N'.                   
           05  MGCA-IRA-ACCOUNT-IND          PIC X VALUE ' '.                   
               88  MGCA-IRA-ACCOUNT                VALUE 'Y'.                   
               88  NON-MGCA-IRA-ACCOUNT            VALUE 'N'.                   
           05  WS-ALTERNATE-IRA-IND          PIC X VALUE ' '.                   
LRM002         88  ALTERNATE-IRA-ACCOUNT           VALUE 'Y'.                   
LRM002         88  NON-ALTERNATE-IRA-ACCOUNT       VALUE 'N'.                   
LRM010     05  WS-LEGACY-ACCOUNT-SW          PIC X VALUE 'N'.                   
LRM010         88  LEGACY-ACCOUNT                  VALUE 'Y'.                   
LRM010         88  NOT-LEGACY-ACCOUNT              VALUE 'N'.                   
LRM014     05  W-PAPERFEE-CNT            PIC  9(009) COMP-3 VALUE 0.            
LRM014     05  W-PAPERFEE-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
LRM014     05  W-PAPERFEE-FND-SW         PIC  X(001) VALUE ' '.                 
LRM014         88 W-PAPERFEE-FND                     VALUE 'Y'.                 
                                                                                
           EJECT                                                                
      *COPY ACATREC9.                                                           
       COPY ACATDLVF REPLACING ==:FMT:== BY ==PEND==.                           
           EJECT                                                                
      ****************************************************************          
      *   NAME AND ADDRESS FILE AREAS                                           
      ****************************************************************          
      /                                                                         
       01  PIC X(32)  VALUE '        GETNA RECORD LAYOUT     '.                 
       COPY GETNACOB.                                                           
       01  GETNA-SEGMENT-INCLUDES.                                              
       COPY NASEGHDR.                                                           
       COPY NASEGPPA.                                                           
       COPY NASEGEND.                                                           
           EJECT                                                                
       COPY GETMSDCE.                                                           
           EJECT                                                                
       01  FILLER                      PIC X(16) VALUE 'P2BKPG-REC-WS'.         
       01  BKCNS-ACAT-OUT-WORK-AREA.                                            
           02  P2-BK-RECORD.                                                    
               03  P2-BK-TRID          PIC X     VALUE 'B'.                     
               03  P2-BK-BATCH-CODE    PIC XX.                                  
               03  P2-BK-BROKER-NBR    PIC XXX.                                 
               03  P2-BK-BUY-SELL-CODE PIC X.                                   
               03  P2-BK-QUANTITY  PIC 9(11) COMP-3.                            
               03  P2-BK-QUANTITY-X                                             
                         REDEFINES P2-BK-QUANTITY.                              
                   05  P2-BK-QUANTITY-SW   PIC X.                               
                   05  FILLER              PIC X(5).                            
               03  P2-BK-SECURITY-NBR  PIC X(7).                                
               03  FILLER              PIC XX    VALUE SPACES.                  
               03  P2-BK-ENTRY-CODE    PIC XXX.                                 
               03  FILLER              PIC X(5)  VALUE SPACES.                  
               03  P2-BK-BR-ACCT-T-C.                                           
                 05  P2-BK-BR-ACCT-T.                                           
                   07  P2-BK-BRANCH    PIC XXX.                                 
                   07  P2-BK-ACCOUNT   PIC X(5).                                
                   07  P2-BK-TYPE      PIC 9.                                   
                 05  P2-BK-CHECK-DIGIT PIC X.                                   
               03  P2-BK-SPIN-DTW      PIC XX    VALUE SPACES.                  
               03  P2-BK-AMOUNT-XX.                                             
                   05  P2-BK-AMOUNT    PIC 9(16)V99 COMP-3.                     
               03  P2-BK-DESCRIPTION.                                           
                   05  FILLER          PIC X(5)  VALUE 'ACAT '.                 
                   05  P2-BK-CNTL-NBR  PIC X(8).                                
                   05  FILLER          PIC X(5)  VALUE ' BOS '.                 
                   05  P2-BK-CNTRA-BKR PIC X(4).                                
                   05  FILLER          PIC X(5)  VALUE SPACES.                  
               03  FILLER              PIC X     VALUE SPACES.                  
               03  P2-BK-CURRENCY      PIC XXX   VALUE '000'.                   
               03  FILLER              PIC X(10)  VALUE SPACES.                 
               03  P2-BK-FRACTION      PIC V9(5).                               
               03  P2-BK-FRACTION-X    REDEFINES P2-BK-FRACTION                 
                                       PIC X(05).                               
               03  FILLER              PIC X(22)  VALUE SPACES.                 
           02  P2-BK-TRAILER-RECORD.                                            
               03  P2-BK-CONST         PIC XXX.                                 
               03  FILLER              PIC X(5).                                
               03  P2-BK-QUANTITY-XT.                                           
                   05  P2-BK-QUAN      PIC 9(9)  COMP-3.                        
               03  FILLER              PIC X(9).                                
               03  P2-BK-ENTRY-CODE-T  PIC XXX.                                 
               03  FILLER              PIC X(5)  VALUE SPACES.                  
               03  P2-BK-TRAILER-BR-ACCT-T-C   PIC X(10).                       
               03  FILLER              PIC X(02).                               
               03  P2-BK-AMOUNT-X      PIC X(10).                               
               03  P2-BK-RES-DESCRIPTION.                                       
                   05  P2-BK-RESCODE   PIC X(2).                                
                   05  P2-BK-RESDESC   PIC X(25).                               
               03  P2-BK-IPHEN         PIC X     VALUE SPACES.                  
               03  FILLER              PIC XXX.                                 
               03  FILLER              PIC X(10)  VALUE SPACES.                 
               03  P2-BK-FRAC          PIC V9(5).                               
               03  FILLER              PIC X(22)  VALUE SPACES.                 
       01  P2-DEBIT-SIGN               PIC X     VALUE '0'.                     
       01  P2-CREDIT-SIGN              PIC X     VALUE '-'.                     
       01  P2-QUANTITY-PRESENT         PIC X     VALUE LOW-VALUES.              
       01  P2-NO-QUANTITY-PRESENT      PIC X     VALUE SPACE.                   
       01  P2-OUTREC                   PIC X(120).                              
       01  P2-DESC-WORK.                                                        
           05  PDW-MSG                 PIC X(17).                               
           05  FILLER                  PIC X     VALUE SPACE.                   
           05  PDW-BR                  PIC X(3).                                
           05  FILLER                  PIC X     VALUE '-'.                     
           05  PDW-ACCT                PIC X(5).                                
                                                                                
           EJECT                                                                
DJ0001     COPY CP2WS.                                                          
           EJECT                                                                
      ****************************************************************          
      *   B1 TABLE                                                              
      ****************************************************************          
                                                                                
       01 GETB1-RESULT PIC X VALUE '0'.                                         
           88 B1-ITEM-FOUND VALUE '1'.                                          
           88 B1-ITEM-NOT-FOUND VALUE '0'.                                      
       01 SEARCH-B1-RESULT PIC X VALUE '0'.                                     
           88 B1-TABLE-ITEM-FOUND VALUE '1'.                                    
           88 B1-TABLE-ITEM-NOT-FOUND VALUE '0'.                                
       01 B1-BROKER-SEARCH-KEY PIC XXXX.                                        
       01  B1-COUNT PIC 9(5) COMP-3 VALUE 400.                                  
      *****                                                                     
       01  B1-TABLE.                                                            
           03  B1-ITEMS OCCURS 400 TIMES.                                       
               05  B1-ADP-CLIENT                PIC 9(03).                      
               05  B1-BROKER                    PIC X(04).                      
               05  B1-ACAT-SUBMIT-ASSETS        PIC X(01).                      
               05  B1-MAINT-FEE-FOR-IRA         PIC X(01).                      
               05  B1-CLI-XFER-FEE              PIC 999V99.                     
               05  B1-CLI-XFER-FEE-IRA          PIC 999V99.                     
               05  B1-TERM-FEE-IRA-DFLT         PIC 999V99.                     
               05  B1-ACCT-IRA-FEE-CODE         PIC X(35).                      
TCK001         05  B1-BTCH-ENTR-CODE            PIC X(05).                      
               05  B1-CLIENT-NAME               PIC X(30).                      
               05  B1-XFER-RANGE-NO             PIC 9(03)  COMP-3.              
               05  B1-XFER-IRA-MAINT-RANGE-NO   PIC 9(03)  COMP-3.              
               05  B1-XFER-IRA-TERM-RANGE-NO    PIC 9(03)  COMP-3.              
434520         05  B1-XFER-DO-NOT-BOOK-TRF-FEE  PIC X.                          
434524         05  B1-XFER-FEE-IRA-ACT          PIC X.                          
                                                                                
00066 **  CARD-511223                                                           
TCK001*** THIS B1 WILL NO LONGER BE USED.                                       
511223*TCK     05  B1-BTS2-ACAT-FRAC-QTY-DELV          PIC X(1).                
               05  B1-ACAT-LIQ-FRAC-SHARES.                                     
                   07  B1-ACAT-LIQUID-FRAC-SHARE-IND   PIC X(1).                
                   07  B1-ACAT-LIQUID-FRAC-OFFS-ACCT.                           
                       09  B1-ACAT-LIQUID-FRAC-OFFS-BR PIC X(3).                
                       09  B1-ACAT-LIQUID-FRAC-OFFS-AC PIC X(5).                
                       09  B1-ACAT-LIQUID-FRAC-OFFS-TYPE PIC X.                 
                   07  B1-ACAT-LIQUID-FRAC-TRD-BK-IND  PIC X(1).                
                   07  B1-ACAT-LIQUID-FRAC-BLOTTER     PIC X(2).                
                   07  B1-ACAT-LIQUID-FRAC-BATCH       PIC X(2).                
                   07  B1-ACAT-LIQUID-FRAC-ENTRY       PIC X(3).                
               05  B1-ACAT-TYPE3-BALANCES       PIC X.                          
               05  B1-ACAT-TYPE3-BATCH-ENTRY.                                   
                   07  B1-ACAT-TYPE3-BATCH      PIC X(2).                       
                   07  B1-ACAT-TYPE3-ENTRY      PIC X(3).                       
               05  B1-ACAT-TYPE3-DESCRIPTION    PIC X(27).                      
               05  B1-ACAT-TYPE3-TRAILER        PIC X(27).                      
LRM007         05  B1-ACAT-FRGN-FEE-DESCRIPTION PIC X(27).              BHAT2   
                                                                                
00200 ** CARD-434539                                                            
06740         05  B1-ACAT-RETIRE-ACCOUNTS-NO  PIC 9(3) COMP-3.                  
06740         05  B1-ACAT-RETIRE-ACCOUNTS.                                      
06760             07  B1-ACAT-RETIRE-ACCOUNTS-ENTRY OCCURS 20 TIMES.            
06800                 09  B1-ACAT-RETIRE-ACCOUNTS-LO    PIC X(8).               
06800                 09  B1-ACAT-RETIRE-ACCOUNTS-HI    PIC X(8).               
00200 ** CARD-434577 EXPAND FROM 100 TO 200 (8/25/2000)                         
               05  B1-XFER-TABLE.                                               
TCK001***          07  B1-XFER-RANGE-ENTRS  OCCURS 100 TIMES.                   
TCK001             07  B1-XFER-RANGE-ENTRS  OCCURS 200 TIMES.                   
                       09  B1-XFER-FEE      PIC 999V99.                         
                       09  B1-XFER-BRAC-LOW   PIC X(08).                        
                       09  B1-XFER-BRAC-HIGH  PIC X(08).                        
                       09  B1-XFER-OFFSET-TY  PIC X(09).                        
                       09  B1-XFER-BATCH      PIC X(02).                        
                       09  B1-XFER-ENTRY      PIC X(03).                        
               05  B1-XFER-IRA-TABLE.                                           
434902             07  B1-XFER-RANGE-IRA-ENTRS  OCCURS 100 TIMES.               
                       09  B1-XFER-IRA-FEE      PIC 999V99.                     
                       09  B1-XFER-IRA-BRAC-LOW   PIC X(08).                    
                       09  B1-XFER-IRA-BRAC-HIGH  PIC X(08).                    
                       09  B1-XFER-IRA-FEE-CODE   PIC X.                        
                       09  B1-XFER-IRA-FEE-OFFSET PIC X(09).                    
                       09  B1-XFER-IRA-FEE-BATCH  PIC X(02).                    
                       09  B1-XFER-IRA-FEE-ENTRY  PIC X(03).                    
                       09  B1-XFER-IRA-FEE-FR-DATE PIC X(08).                   
                       09  B1-XFER-IRA-FEE-TO-DATE PIC X(08).                   
               05  B1-TERM-IRA-TABLE.                                           
LRM012             07  B1-TERM-RANGE-TERM-IRA-ENTRS  OCCURS 200 TIMES.          
                       09  B1-TERM-IRA-FEE            PIC 999V99.               
                       09  B1-TERM-IRA-BRAC-LOW       PIC X(08).                
                       09  B1-TERM-IRA-BRAC-HIGH      PIC X(08).                
                       09  B1-TERM-IRA-FEE-CODE       PIC X.                    
                       09  B1-TERM-IRA-FEE-OFFSET     PIC X(09).                
                       09  B1-TERM-IRA-FEE-BATCH      PIC X(02).                
                       09  B1-TERM-IRA-FEE-ENTRY      PIC X(03).                
00020 ** CARD-009125                                                            
06740      05  B1-MGCA-IRA-BR-RANGE-NO               PIC 9(3) COMP-3.           
06750      05  B1-MGCA-IRA-BR-RANGE.                                            
06760          07  B1-MGCA-IRA-BR-RANGE-ENTRY      OCCURS 50 TIMES.             
06800              09  B1-MGCA-IRA-BR-RANGE-LO         PIC X(3).                
06800              09  B1-MGCA-IRA-BR-RANGE-HI         PIC X(3).                
00299                                                                           
00020 ** CARD-009126                                                            
06740      05  B1-MGCA-IRA-BR-ACT-RANGE-NO           PIC 9(3) COMP-3.           
06750      05  B1-MGCA-IRA-BR-ACT-RANGE.                                        
06760          07  B1-MGCA-IRA-BR-ACT-RANGE-ENTRY  OCCURS 50 TIMES.             
06800              09  B1-MGCA-IRA-BR-ACT-BR-LO        PIC X(3).                
06800              09  B1-MGCA-IRA-BR-ACT-BR-HI        PIC X(3).                
06800              09  B1-MGCA-IRA-BR-ACT-ACT-LO       PIC X(5).                
06800              09  B1-MGCA-IRA-BR-ACT-ACT-HI       PIC X(5).                
********                                                                        
E.T.  ** PRINT REPORT INDICATOR                                                 
E.T.       05  B1-PRINT-REPORT-IND                     PIC X(1).                
      ** CARD-434671                                                            
           05  B1-ACAT-IRA-FEE-CODE-VALUES.                                     
               07  B1-ACAT-IRA-FEE-CODE-VAL-NO       PIC 9(3) COMP-3.           
               07  B1-ACAT-IRA-FEE-CODE-VAL     OCCURS  36  PIC X(1).           
      ** CARD-434672                                                            
           05  B1-ACAT-IRA-FEE-TAX-ID-VALUES.                                   
               07  B1-ACAT-IRA-FEE-TAX-ID-VAL-NO     PIC 9(3) COMP-3.           
               07  B1-ACAT-IRA-FEE-TAX-ID-VAL     OCCURS  20  PIC X(9).         
           05  B1-AT3-TRANSF-FEES-ADD-NO            PIC 9(3) COMP-3.            
      ** CARD-434708                                                            
LRM003     05  B1-ACAT-LIQ-FRAC-SHARE-PTR           PIC X.                      
                                                                                
       01  B1-WRK-TABLE.                                                        
           03  B1-WRK-ITEMS.                                                    
               05  B1-WRK-ADP-CLIENT            PIC 9(03).                      
               05  B1-WRK-BROKER                PIC X(04).                      
               05  B1-WRK-SUBMIT-ASSETS         PIC X(01).                      
               05  B1-WRK-MAINT-FEE-FOR-IRA     PIC X(01).                      
               05  B1-WRK-CLI-XFER-FEE          PIC 999V99.                     
               05  B1-WRK-CLI-XFER-FEE-IRA      PIC 999V99.                     
               05  B1-WRK-ACCT-XFER-FEE-IRA-DFLT PIC 999V99.                    
               05  B1-WRK-ACCT-IRA-FEE-CODE     PIC X(35).                      
TCK001         05  B1-WRK-BTCH-ENTR-CODE        PIC X(05).                      
               05  B1-WRK-CLIENT-NAME           PIC X(30).                      
               05  B1-WRK-XFER-RANGE-NO         PIC 9(03)  COMP-3.              
               05  B1-WRK-XFER-IRA-MAINT-RANGE-NO PIC 9(03) COMP-3.             
               05  B1-WRK-ACCT-XFER-IRA-RANGE-NO PIC 9(03) COMP-3.              
434520         05  B1-434520-DO-NOT-BOOK-TRF-FEE PIC X.                         
434524         05  B1-434524-FEE-IRA-ACT         PIC X.                         
TCK001****     05  B1-WRK-FRAC-QTY-DELV          PIC X(1).                      
00210          05  B1-WRK-LIQ-FRAC-SHARES.                                      
06760              07  B1-WRK-LIQUID-FRAC-SHARE-IND    PIC X(1).                
06760              07  B1-WRK-LIQUID-FRAC-OFFS-ACCT.                            
06760                  09  B1-WRK-LIQUID-FRAC-OFFS-BR PIC X(3).                 
06760                  09  B1-WRK-LIQUID-FRAC-OFFS-AC PIC X(5).                 
06760                  09  B1-WRK-LIQUID-FRAC-OFFS-TY PIC X.                    
06760              07  B1-WRK-LIQUID-FRAC-TRD-BK-IND   PIC X(1).                
06760              07  B1-WRK-LIQUID-FRAC-BLOTTER      PIC X(2).                
06760              07  B1-WRK-LIQUID-FRAC-BATCH        PIC X(2).                
                   07  B1-WRK-LIQUID-FRAC-ENTRY        PIC X(3).                
               05  B1-WRK-TYPE3-BALANCES        PIC X.                          
               05  B1-WRK-TYPE3-BATCH-ENTRY.                                    
                   07  B1-WRK-TYPE3-BATCH-CODE  PIC X(2).                       
                   07  B1-WRK-TYPE3-ENTRY-CODE  PIC X(3).                       
               05  B1-WRK-TYPE3-DESCRIPTION     PIC X(27).                      
               05  B1-WRK-TYPE3-TRAILER         PIC X(27).                      
LRM007** CARD-434755                                                            
LRM007         05  B1-WRK-FRGN-FEE-DESCRIPTION  PIC X(27).              BHAT2   
               05  B1-WRK-RETIRE-ACCOUNTS-NO   PIC 9(3) COMP-3.                 
               05  B1-WRK-RETIRE-ACCOUNTS.                                      
                   07  B1-WRK-RETIRE-ACCOUNTS-ENTRY OCCURS 20 TIMES.            
                      09  B1-WRK-RETIRE-ACCOUNTS-LO     PIC X(8).               
                      09  B1-WRK-RETIRE-ACCOUNTS-HI     PIC X(8).               
                                                                                
               05  B1-WRK-XFER-TABLE.                                           
TCK001****         07  B1-WRK-XFER-RANGE-ENTRS OCCURS 100 TIMES.                
434577             07  B1-WRK-XFER-RANGE-ENTRS OCCURS 200 TIMES.                
                       09  B1-WRK-XFER-FEE  PIC 999V99.                         
                       09  B1-WRK-XFER-BRAC-LOW PIC X(08).                      
                       09  B1-WRK-XFER-BRAC-HIGH PIC X(08).                     
                       09  B1-WRK-XFER-OFFSET    PIC X(09).                     
                       09  B1-WRK-XFER-BATCH     PIC X(02).                     
                       09  B1-WRK-XFER-ENTRY     PIC X(03).                     
MAINT          05  B1-WRK-XFER-IRA-MAINT-TABLE.                                 
434902             07  B1-WRK-XFER-RANGE-IRA-ENTRS OCCURS 100 TIMES.            
                       09  B1-WRK-XFER-IRA-MAINT-FEE PIC 999V99.                
                       09  B1-WRK-XFER-IRA-MAINT-BRAC-LOW PIC X(08).            
                       09  B1-WRK-XFER-IRA-MAINT-BRAC-HI PIC X(08).             
                       09  B1-WRK-XFER-IRA-MAINT-FEE-CODE PIC X.                
                       09  B1-WRK-XFER-IRA-MAINT-OFFSET PIC X(09).              
                       09  B1-WRK-XFER-IRA-MAINT-BATCH PIC X(02).               
                       09  B1-WRK-XFER-IRA-MAINT-ENTRY PIC X(03).               
                       09  B1-WRK-XFER-IRA-MAINT-FR-DATE PIC X(08).             
                       09  B1-WRK-XFER-IRA-MAINT-TO-DATE PIC X(08).             
IRA            05  B1-WRK-ACCT-XFER-IRA-TABLE.                                  
LRM012             07  B1-WRK-ACCT-XFER-RANGE-ENTRS OCCURS 200 TIMES.           
                       09  B1-WRK-ACCT-XFER-IRA-FEE  PIC 999V99.                
                       09  B1-WRK-ACCT-XFER-IRA-BRAC-LOW PIC X(08).             
                       09  B1-WRK-ACCT-XFER-IRA-BRAC-HIGH PIC X(08).            
                       09  B1-WRK-ACCT-XFER-IRA-FEE-CODE  PIC X.                
                       09  B1-WRK-ACCT-XFER-IRA-OFFSET    PIC X(09).            
                       09  B1-WRK-ACCT-XFER-BATCH         PIC X(02).            
                       09  B1-WRK-ACCT-XFER-ENTRY         PIC X(03).            
06740      05  B1-WRK-MGCA-IRA-BR-RANGE-NO           PIC 9(3) COMP-3.           
06750      05  B1-WRK-MGCA-IRA-BR-RANGE.                                        
06760          07  B1-WRK-MGCA-IRA-BR-RANGE-ENTRY  OCCURS 50 TIMES.             
06800              09  B1-WRK-MGCA-IRA-BR-RANGE-LO     PIC X(3).                
06800              09  B1-WRK-MGCA-IRA-BR-RANGE-HI     PIC X(3).                
00299                                                                           
00020 ** CARD-009126                                                            
06740      05  B1-WK-MGCA-IRA-BR-ACT-RANGE-NO       PIC 9(3) COMP-3.            
06750      05  B1-WK-MGCA-IRA-BR-ACT-RANGE.                                     
06760          07  B1-WK-MGCA-IRA-BR-ACT-RNG-ENT   OCCURS 50 TIMES.             
06800              09  B1-WK-MGCA-IRA-BR-ACT-BR-LO    PIC X(3).                 
06800              09  B1-WK-MGCA-IRA-BR-ACT-BR-HI    PIC X(3).                 
06800              09  B1-WK-MGCA-IRA-BR-ACT-ACT-LO   PIC X(5).                 
06800              09  B1-WK-MGCA-IRA-BR-ACT-ACT-HI   PIC X(5).                 
********                                                                        
E.T.  ** PRINT REPORT INDICATOR                                                 
E.T.       05  B1-WK-PRINT-REPORT-IND              PIC X(1).                    
      ** CARD-434671                                                            
           05  B1-WK-IRA-FEE-CODE-VALUES.                                       
               07  B1-WK-IRA-FEE-CODE-VAL-NO      PIC 9(3) COMP-3.              
               07  B1-WK-IRA-FEE-CODE-TBL.                                      
                   09  B1-WK-IRA-FEE-CODE-VAL  OCCURS  36  PIC X(1).            
      ** CARD-434672                                                            
           05  B1-WK-IRA-FEE-TAX-ID-VALUES.                                     
               07  B1-WK-IRA-FEE-TAX-ID-VAL-NO    PIC 9(3) COMP-3.              
               07  B1-WK-IRA-FEE-TAX-ID-VAL    OCCURS  20  PIC X(9).            
           05  B1-WK-TRANSF-FEES-ADD-NO           PIC 9(3) COMP-3.              
LRM003     05  B1-WK-LIQ-FRAC-SHARE-PTR           PIC X.                        
                                                                                
      *                                                                         
      ****************************************************************          
      *  B1-INFO                                                                
       COPY BHINFO.                                                             
       EJECT                                                                    
       COPY BHBTS2.                                                             
       EJECT                                                                    
       COPY BHACAT.                                                             
LRM011 COPY BHAT3.                                                              
       EJECT                                                                    
       COPY BHAT2.                                                              
       EJECT                                                                    
       01  FILLER                        PIC X(08) VALUE 'BHMGCA  '.            
           COPY BHMGCA.                                                         
       EJECT                                                                    
      ****************************************************************          
      *    TIME/DATE FIELDS                                          *          
      ****************************************************************          
       COPY BPDATESC.                                                           
       01  DATE-FIELDS.                                                         
           05  PROC-DATE.                                                       
               10  PD-CC        PIC XX.                                         
               10  PD-YY        PIC XX.                                         
               10  PD-MM        PIC XX.                                         
               10  PD-DD        PIC XX.                                         
           05  PRIOR-PROC-DATE.                                                 
               10  PPD-CC       PIC XX.                                         
               10  PPD-YY       PIC XX.                                         
               10  PPD-MM       PIC XX.                                         
               10  PPD-DD       PIC XX.                                         
           05  WORK-DATE-MMDDYY.                                                
               10  WK-MM        PIC XX.                                         
               10  WK-DD        PIC XX.                                         
               10  WK-YY        PIC XX.                                         
                                                                                
           05  PRIOR-WORK-DATE-MMDDYY.                                          
               10  PWK-MM        PIC XX.                                        
               10  PWK-DD        PIC XX.                                        
               10  PWK-YY        PIC XX.                                        
                                                                                
002705     COPY RECTACT  REPLACING ==:CI:== BY ==T2==.                          
                                                                                
       01  S1                      PIC 9(03).                                   
       01  W-LINE-CTR              PIC 9(03) COMP-3  VALUE 60.                  
       01  W-PAGE-CTR              PIC 9(07) COMP-3  VALUE 0.                   
       01  W-RPT-CTR               PIC 9(07) COMP-3  VALUE 0.                   
       01  W-PREV-CLIENT           PIC X(03)  VALUE SPACES.                     
E.T.   01  WK-PREV-CLT             PIC 9(03)  VALUE 0.                          
       01  W-REPORT-MSG            PIC X(143) VALUE                             
                                   'NO RECORDS WRITTEN'.                        
       01  W-DATE                  PIC 9(06).                                   
       01  W-DATE-X REDEFINES W-DATE                                            
                                   PIC X(06).                                   
       01  W-TIME                  PIC 9(08).                                   
       01  W-TIME-X REDEFINES W-TIME                                            
                                   PIC X(08).                                   
                                                                                
       01  HDR.                                                                 
           05  FILLER                      PIC X(01)  VALUE SPACES.             
           05  HDR-CLIENT                  PIC X(04)  VALUE SPACES.             
           05  HDR-CLIENT-DESC             PIC X(31)  VALUE SPACES.             
           05  FILLER                      PIC X(39)  VALUE                     
                   'CAT820 - FRACTION LIQUIDATION REPORT'.                      
           05  HDR-PROC-MM                 PIC X(02)  VALUE SPACES.             
           05  FILLER                      PIC X(01)  VALUE '/'.                
           05  HDR-PROC-DD                 PIC X(02)  VALUE SPACES.             
           05  FILLER                      PIC X(01)  VALUE '/'.                
           05  HDR-PROC-YY                 PIC X(02)  VALUE SPACES.             
           05  FILLER                      PIC X(11)  VALUE                     
                   '    RUN ON'.                                                
           05  HDR-RUN-MM                  PIC X(02)  VALUE SPACES.             
           05  FILLER                      PIC X(01)  VALUE '/'.                
           05  HDR-RUN-DD                  PIC X(02)  VALUE SPACES.             
           05  FILLER                      PIC X(01)  VALUE '/'.                
           05  HDR-RUN-YY                  PIC X(02)  VALUE SPACES.             
           05  FILLER                      PIC X(04)  VALUE ' AT'.              
           05  HDR-RUN-HR                  PIC X(02)  VALUE SPACES.             
           05  FILLER                      PIC X(01)  VALUE ':'.                
           05  HDR-RUN-MIN                 PIC X(02)  VALUE SPACES.             
           05  FILLER                      PIC X(06)  VALUE ' PAGE'.            
           05  HDR-PAGE                    PIC ZZZ,ZZ9.                         
           05  FILLER                      PIC X(01)  VALUE SPACES.             
DJ0001     05  HDR-CYCLE-DATA              PIC X(08)  VALUE ' '.                
           05  HDR-TAG                     PIC 9(03)  COMP-3 VALUE 0.           
           05  FILLER                      PIC X(08)  VALUE SPACES.             
                                                                                
       01  SHDR.                                                                
           05  FILLER                      PIC X(05)  VALUE ' B/S'.             
           05  FILLER                      PIC X(10)  VALUE ' BRANCH'.          
           05  FILLER                      PIC X(10)  VALUE 'ACCOUNT'.          
           05  FILLER                      PIC X(10)  VALUE 'SECURITY'.         
           05  FILLER                      PIC X(36)                            
                                             VALUE 'DESCRIPTION'.               
           05  FILLER                      PIC X(18)  VALUE 'SHARES'.           
           05  FILLER                      PIC X(44)  VALUE 'AMOUNT'.           
           05  SHDR-TAG                    PIC 9(03)  COMP-3 VALUE 0.           
           05  FILLER                      PIC X(08)  VALUE SPACES.             
                                                                                
       01  DET.                                                                 
           05  FILLER                      PIC X(02)  VALUE SPACES.             
           05  DTL-BS                      PIC X(01).                           
           05  FILLER                      PIC X(04)  VALUE SPACES.             
           05  DTL-BRANCH                  PIC X(03)  VALUE SPACES.             
           05  FILLER                      PIC X(06)  VALUE SPACES.             
           05  DTL-ACCOUNT                 PIC X(05)  VALUE SPACES.             
           05  FILLER                      PIC X(04)  VALUE SPACES.             
           05  DTL-SECURITY                PIC X(07)  VALUE SPACES.             
           05  FILLER                      PIC X(03)  VALUE SPACES.             
           05  DTL-DESCRIPTION             PIC X(30)  VALUE SPACES.             
           05  FILLER                      PIC X(06)  VALUE SPACES.             
           05  DTL-SHARES                  PIC .99999.                          
           05  FILLER                      PIC X(03)  VALUE SPACES.             
           05  DTL-AMOUNT                  PIC ZZZZZZZZZZZ9.99.                 
           05  FILLER                      PIC X(38)  VALUE SPACES.             
           05  DTL-TAG                     PIC 9(03)  COMP-3 VALUE 0.           
           05  FILLER                      PIC X(08)  VALUE SPACES.             
                                                                                
       01  DSH.                                                                 
           05  FILLER                      PIC X(01)  VALUE SPACES.             
           05  FILLER                      PIC X(132) VALUE ALL '-'.            
           05  DSH-TAG                     PIC 9(03)  COMP-3 VALUE 0.           
           05  FILLER                      PIC X(08)  VALUE SPACES.             
                                                                                
E.T.   01  NO-DATA-LINE.                                                        
E.T.       05  FILLER                      PIC X(01)  VALUE SPACES.             
E.T.       05  FILLER                      PIC X(34)  VALUE SPACES.             
E.T.       05  FILLER                      PIC X(98)  VALUE                     
E.T.           '***  NO DATA TODAY ***'.                                        
E.T.       05  NO-DATA-TAG                 PIC 9(03)  COMP-3 VALUE 0.           
E.T.       05  FILLER                      PIC X(08)  VALUE SPACES.             
                                                                                
       01  RT-P2-REC.                                                           
           05  RT-P2-CLIENT        PIC X(03).                                   
           05  RT-P2-BRANCH        PIC X(03).                                   
           05  RT-P2-ACCOUNT       PIC X(05).                                   
           05  RT-P2-CONTROL       PIC X(14).                                   
LRM007     05  RT-P2-REC-TYPE      PIC X(05).                                   
LRM007         88  RT-P2-FRGN-FEE               VALUE 'FRGN '.                  
LRM007     05  RT-P2-ADP-NBR       PIC X(07).                                   
LRM007     05  RT-P2-ACCOUNT-TYPE  PIC X(01).                                   
           05  RT-P2-TYPE          PIC X(01).                                   
           05  RT-P2-SUB           PIC 9(01).                                   
           05  RT-P2-DATA OCCURS 5 TIMES                                        
                                   PIC X(120).                                  
                                                                                
       01  RT-TACT-REC.                                                         
           05  RT-TACT-CLIENT      PIC X(03).                                   
           05  RT-TACT-BRANCH      PIC X(03).                                   
           05  RT-TACT-ACCOUNT     PIC X(05).                                   
           05  RT-TACT-CONTROL     PIC X(14).                                   
           05  RT-TACT-TYPE        PIC X(01).                                   
           05  RT-TACT-DATA        PIC X(400).                                  
                                                                                
       LINKAGE SECTION.                                                         
       01  PARM-DATA.                                                           
           05  PARM-LENGTH              PIC S9(4)  COMP.                        
           05  PARM-INFO.                                                       
               10  PARM-STREAM              PIC X.                              
                   88  PARM-STREAM-VALID           VALUES ARE                   
                   'A' THRU 'Z' '0' THRU '9'.                                   
LRM003         10  PARM-RUN-MODE            PIC X(2).                           
LRM003             88  PARM-INTRA-DAY              VALUE 'ID'.                  
           EJECT                                                                
                                                                                
       PROCEDURE DIVISION USING PARM-DATA.                                      
           COPY MSGCOBO.                                                        
                                                                                
           PERFORM 0100-DATE-PARM-RTN THRU                                      
                   0100-DATE-PARM-RTN-EXIT.                                     
           PERFORM 0200-FILE-INIT THRU                                          
                   0200-FILE-INIT-EXIT.                                         
                                                                                
           PERFORM 0300-LOAD-B1-TABLE THRU                                      
                   0300-LOAD-B1-TABLE-EXIT.                                     
                                                                                
           MOVE ZEROS TO B1-SUB1.                                               
           PERFORM 0400-PROCESS-TFRS-FILE                                       
                            THRU  0400-PROCESS-TFRS-FILE-EXIT                   
               UNTIL TFRS-FILE-EOF-SW = 'Y'.                                    
                                                                                
E.T.       IF B1-WK-PRINT-REPORT-IND NOT = '1'                                  
E.T.           PERFORM 0450-REPORT-NO-DATA.                                     
                                                                                
           IF B1-TBL-CNT = ZERO                                                 
             DISPLAY 'NO CLIENTS SELECTED FOR THIS RUN '                        
             GO TO 0005-ENDJOB.                                                 
           MOVE B1-TBL-CNT TO B1-COUNT.                                         
                                                                                
       0005-ENDJOB.                                                             
                                                                                
           PERFORM 1800-END-OF-JOB-ROUTINE THRU                                 
                   1800-END-OF-JOB-ROUTINE-EXIT.                                
                                                                                
           GOBACK.                                                              
           EJECT                                                                
                                                                                
       0100-DATE-PARM-RTN.                                                      
                                                                                
           MOVE  PGM-NME         TO  BPDATES-CALLING-PGM.                       
           MOVE  'C'             TO  BPDATES-REQ-TYPE.                          
           CALL   BPDATES   USING  BPDATES-PARAMETERS.                          
                                                                                
           MOVE BPD-PROC-DATE        TO  PROC-DATE.                             
           MOVE BPD-PRIOR-PROC-DATE  TO  PRIOR-PROC-DATE.                       
                                                                                
           MOVE PD-MM            TO  WK-MM.                                     
           MOVE PD-DD            TO  WK-DD.                                     
           MOVE PD-YY            TO  WK-YY.                                     
                                                                                
           MOVE PPD-MM           TO  PWK-MM.                                    
           MOVE PPD-DD           TO  PWK-DD.                                    
           MOVE PPD-YY           TO  PWK-YY.                                    
                                                                                
           DISPLAY 'PROCESS DATE = '  PROC-DATE.                                
           DISPLAY 'PRIOR PROCESS DATE = '  PRIOR-PROC-DATE.                    
                                                                                
           ACCEPT W-DATE         FROM DATE.                                     
           ACCEPT W-TIME         FROM TIME.                                     
                                                                                
           MOVE PROC-DATE (7:2)  TO HDR-PROC-DD.                                
           MOVE PROC-DATE (5:2)  TO HDR-PROC-MM.                                
           MOVE PROC-DATE (3:2)  TO HDR-PROC-YY.                                
           MOVE W-DATE-X  (5:2)  TO HDR-RUN-DD.                                 
           MOVE W-DATE-X  (3:2)  TO HDR-RUN-MM.                                 
           MOVE W-DATE-X  (1:2)  TO HDR-RUN-YY.                                 
           MOVE W-TIME-X  (1:2)  TO HDR-RUN-HR.                                 
           MOVE W-TIME-X  (3:2)  TO HDR-RUN-MIN.                                
                                                                                
DJ0001     DISPLAY 'PARM-LENGTH = ' PARM-LENGTH                                 
DJ0001     DISPLAY 'PARM-STREAM = ' PARM-STREAM                                 
LRM003     DISPLAY 'PARM-RUN-MODE = ' PARM-RUN-MODE.                            
                                                                                
      * CHECK PARM                                                              
           IF PARM-LENGTH > 0                                                   
             CONTINUE                                                           
           ELSE                                                                 
             DISPLAY 'PARM MISSING, MUST BE AT LEAST 1 CHAR '                   
             DISPLAY 'PARM ENTERED - ' PARM-INFO                                
             DISPLAY 'PROGRAM CAT820 ABENDED '                                  
             MOVE +2000  TO  ABORT-CODE                                         
             PERFORM ABEND-RTN.                                                 
                                                                                
           IF PARM-STREAM-VALID                                                 
             CONTINUE                                                           
           ELSE                                                                 
             DISPLAY 'PARM 1ST CHAR IS JOB STREAM IS INVALID'                   
             DISPLAY 'PARM ENTERED - ' PARM-INFO                                
             DISPLAY 'PROGRAM CAT820 ABENDED '                                  
             MOVE +2000  TO  ABORT-CODE                                         
             PERFORM ABEND-RTN.                                                 
                                                                                
           INITIALIZE B1-TABLE.                                                 
                                                                                
           MOVE ZEROS TO WS-CASH-ADJ-AMT-TYPE1                                  
                         WS-CASH-ADJ-AMT-TYPE2                                  
                         WS-CASH-ADJ-AMT-TYPE5.                                 
                                                                                
       0100-DATE-PARM-RTN-EXIT. EXIT.                                           
           EJECT                                                                
       0200-FILE-INIT.                                                          
                                                                                
           OPEN INPUT TFRS-I-FILE.                                              
                                                                                
LRM007     SET     GETMSR-FORMAT-NEW   TO TRUE.                                 
LRM007     SET     GETMSR-DEVICE-DISK  TO TRUE.                                 
LRM007     SET     GETMSR-VSAM         TO TRUE.                                 
LRM007     SET     GETMSR-USA          TO TRUE                                  
                                                                                
           OPEN INPUT REG-OPT-FILE                                              
           IF REG-FILE-STATUS = '00' OR '97'                                    
              CONTINUE                                                          
           ELSE                                                                 
                 DISPLAY 'ERROR OPENING REGISTRATION OPTION FILE '              
                 'FILE STATUS = ' REG-FILE-STATUS                               
                 MOVE +3004 TO ABORT-CODE                                       
                 PERFORM ABEND-RTN                                              
           END-IF.                                                              
                                                                                
LRM014     OPEN I-O PAPERFEE.                                                   
LRM014     DISPLAY 'PAPERFEE FILE OPENED FOR INPUT.  STATUS = '                 
LRM014                                        PAPERFEE-STAT                     
LRM014     IF  PAPERFEE-OKAY                                                    
LRM014         CONTINUE                                                         
LRM014     ELSE                                                                 
LRM014         DISPLAY 'ERROR OPENING PAPERFEE'                                 
LRM014         DISPLAY 'OPEN STATUS = ' PAPERFEE-STAT                           
LRM014         DISPLAY 'U3001 - ABENDING ON BAD FILE STATUS'                    
LRM014         MOVE +3001    TO ABORT-CODE                                      
LRM014         CALL ABEND USING ABORT-CODE                                      
LRM014     END-IF.                                                              
LRM014     MOVE LOW-VALUES                 TO PAPER-FEE-RECORD.                 
LRM014     READ PAPERFEE.                                                       
LRM014     IF  PAPERFEE-OKAY                                                    
LRM014        IF PAPER-FEE-HEADER                                               
LRM014           DISPLAY 'PAPER STMNT FEE HEADER DATE ' PAPER-FEE-HDR-DT        
LRM014        END-IF                                                            
LRM014     ELSE                                                                 
LRM014         IF PAPERFEE-NOT-FOUND                                            
LRM014            DISPLAY 'PAPERFEE STATUS EMPTY ' PAPERFEE-STAT                
LRM014                 ' FILE BYPASSED'                                         
LRM014            SET PAPERFEE-EMPTY-MISSING TO TRUE                            
LRM014     END-IF.                                                              
           OPEN OUTPUT CASH-ADJUSTMENT-FILE.                                    
           OPEN OUTPUT P2BKPG-FILE.                                             
           OPEN OUTPUT RETAIN-FILE                                              
                       REPORT-FILE.                                             
                                                                                
           READ TFRS-I-FILE INTO PEND-HEADER-RECORD                             
             AT END                                                             
                 MOVE 'Y' TO  TFRS-FILE-EOF-SW                                  
                  GO TO 0200-FILE-INIT-EXIT.                                    
                                                                                
           IF NOT PEND-HDR-REC                                                  
              DISPLAY 'TRFS FILE HEADER NOT FOUND'                              
                  DISPLAY 'JOB ENDING'                                          
              MOVE +4004 TO ABORT-CODE                                          
              PERFORM ABEND-RTN                                                 
           ELSE                                                                 
DJ0001          DISPLAY 'PEND FILE (TFRSFLI) DATE = '                           
                         PEND-HDR-PROC-DATE                                     
DJ0001          MOVE PEND-HDR-CYCLE-DATA TO WS-CYCLE-DATA                       
DJ0001          DISPLAY 'PEND FILE (TFRSFLI) HDR  = '                           
DJ0001                   PEND-HDR-CYCLE-DATA                                    
           END-IF.                                                              
LRM006     WRITE CASH-DETAIL-RECORD FROM TFRS-HEADER-RECORD                     
           MOVE SPACES TO PEND-DETAIL-KEY.                                      
                                                                                
      * WRITE P2BKPG FILE HEARER RECORD                                         
           MOVE SPACES   TO  P2BKPG-RECORD.                                     
           MOVE 'DATE='  TO  P2BKPG-RECORD.                                     
           MOVE WORK-DATE-MMDDYY TO P2BKPG-RECORD (6:6).                        
DJ0001     MOVE 'H'                    TO CP2-REQUEST-CODE                      
DJ0001     MOVE 'CAT820'               TO CP2-PROGRAM-ID                        
DJ0001     MOVE 999                    TO CP2-CLIENT-NUMBER                     
DJ0001     CALL P2HDTR              USING CP2-AREA P2BKPG-FILE                  
DJ0001     MOVE CP2-RETURN-RECORD      TO P2BKPG-RECORD                         
DJ0001     MOVE WS-CYCLE-DATA TO P2BKPG-RECORD(55:8)                            
DJ0001     DISPLAY 'P2BKPG-HDR = ' P2BKPG-RECORD(1:80)                          
           WRITE P2BKPG-RECORD.                                                 
                                                                                
           PERFORM 0250-OPEN-TACT.                                              
           MOVE SPACES TO TACT-RECORD.                                          
                                                                                
       0200-FILE-INIT-EXIT.  EXIT.                                              
            EJECT                                                               
                                                                                
       0250-OPEN-TACT.                                                          
           MOVE 'CAT820 '       TO    TACTIO-CALLING-PGM-NAME.                  
DJ0001     MOVE WS-CYCLE-DATA(7:2) TO TACTIO-CALLING-PGM-NAME(7:2)              
           MOVE WS-TACT-DDNAME  TO    TACTIO-DDNAME.                            
           MOVE 'O'             TO    TACTIO-FUNCTION-CODE.                     
           MOVE 'V'             TO    TACTIO-FILE-TYPE.                         
           MOVE 'Y'             TO    TACTIO-OUTPUT-TRUNCATION.                 
           MOVE 'V'             TO    TACTIO-FILE-FORMAT.                       
           CALL ZTACTIO         USING TACTIO-PARAMETERS                         
                                      TACT-RECORD.                              
                                                                                
           MOVE 'H'             TO    TACTIO-FUNCTION-CODE.                     
           MOVE 'O'             TO    TACTIO-FILE-TYPE.                         
           CALL ZTACTIO         USING TACTIO-PARAMETERS                         
                                      TACT-RECORD.                              
                                                                                
       0300-LOAD-B1-TABLE.                                                      
                                                                                
           PERFORM VARYING I-SUB FROM 1 BY 1                                    
               UNTIL I-SUB > 400                                                
               MOVE ZERO TO B1-ADP-CLIENT(I-SUB)                                
                              B1-BROKER (I-SUB)                                 
           END-PERFORM.                                                         
                                                                                
           PERFORM VARYING B1-SUB   FROM 1 BY 1                                 
               UNTIL B1-SUB   > B1-COUNT                                        
               SET B1-ITEM-NOT-FOUND TO TRUE                                    
               PERFORM 0310-GET-B1-INFO THRU                                    
                       0310-GET-B1-INFO-EXIT                                    
               IF B1-ITEM-FOUND                                                 
                   PERFORM 0320-LOAD-B1-ITEM THRU                               
                           0320-LOAD-B1-ITEM-EXIT                               
               END-IF                                                           
           END-PERFORM.                                                         
       0300-LOAD-B1-TABLE-EXIT.  EXIT.                                          
                                                                                
       0310-GET-B1-INFO.                                                        
                                                                                
           MOVE SPACES    TO  BH-BROKER-HEADER-INFO.                            
           MOVE B1-SUB    TO BH-BROKER-NUMBER-N.                                
           MOVE '010'     TO BH-LOGICAL-RECORD-CODE.                            
           MOVE SPACES    TO BH-B2-INFO-ID.                                     
           CALL  GETB1V  USING BH-BROKER-HEADER-INFO                            
           END-CALL.                                                            
                                                                                
           PERFORM 0315-DETERMINE-CLI-STRM THRU                                 
                   0315-DETERMINE-CLI-STRM-EXIT.                                
                                                                                
000100     IF BH-BROKER-ACTIVE AND                                              
              CLIENT-STREAM  = PARM-STREAM                                      
             CONTINUE                                                           
           ELSE                                                                 
             SET B1-ITEM-NOT-FOUND TO TRUE                                      
             GO TO 0310-GET-B1-INFO-EXIT.                                       
                                                                                
TCK001*    MOVE SPACE     TO BH-BTS2-INFO.                                      
TCK001*    MOVE B1-SUB    TO BH-BROKER-NUMBER-N.                                
TCK001*    MOVE '015'     TO BH-LOGICAL-RECORD-CODE.                            
TCK001*    MOVE '511000'  TO BH-B2-INFO-ID.                                     
TCK001*    CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                           
TCK001*                       BH-BTS2-INFO                                      
TCK001*    END-CALL.                                                            
TCK001***  CARD 511011                                                          
TCK001*    IF BH-BTS2-ACTIVE                                                    
TCK001*      CONTINUE                                                           
TCK001*    ELSE                                                                 
TCK001*      DISPLAY 'CLIENT BYPASS DUE TO BTS2 NOT ACTIVE ' B1-SUB             
TCK001*      SET B1-ITEM-NOT-FOUND TO TRUE                                      
TCK001*      GO TO 0310-GET-B1-INFO-EXIT.                                       
                                                                                
           MOVE B1-SUB    TO BH-BROKER-NUMBER-N.                                
           MOVE '015'     TO BH-LOGICAL-RECORD-CODE.                            
           MOVE '434500'  TO BH-B2-INFO-ID.                                     
           CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                           
                              BH-ACAT-INFO                                      
           END-CALL.                                                            
434501     IF BH-ACAT-ACTIVE                                                    
             DISPLAY 'CLIENT : ' B1-SUB                                         
                   ' BHACAT TRANSFER FEES NO: ' BH-ACAT-TRANSFER-FEE-NO         
           ELSE                                                                 
TEST  **     DISPLAY 'CLIENT BYPASS DUE TO ACAT NOT ACTIVE ' B1-SUB             
             SET B1-ITEM-NOT-FOUND TO TRUE                                      
             GO TO 0310-GET-B1-INFO-EXIT.                                       
                                                                                
           MOVE B1-SUB    TO BH-BROKER-NUMBER-N.                                
           MOVE '015'     TO BH-LOGICAL-RECORD-CODE.                            
           MOVE '434900'  TO BH-B2-INFO-ID.                                     
           CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                           
                              BH-AT2-INFO                                       
           END-CALL.                                                            
434901     IF BH-AT2-ACTIVE                                                     
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'NO IRA MAINT/TERM FEE B1 FOR CLIENT ' B1-SUB            
               MOVE ZEROS TO BH-AT2-IRA-MAINT-FEE-NO                            
                             BH-AT2-IRA-TERM-FEE-NO.                            
                                                                                
           SET B1-ITEM-FOUND TO TRUE.                                           
                                                                                
           MOVE B1-SUB    TO BH-BROKER-NUMBER-N.                                
           MOVE '015'     TO BH-LOGICAL-RECORD-CODE.                            
           MOVE '434910'  TO BH-B2-INFO-ID.                                     
           CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                           
                              BH-AT3-INFO                                       
           END-CALL.                                                            
434910     IF BH-AT3-ACTIVE                                                     
             DISPLAY 'CLIENT : ' B1-SUB                                         
                    ' BHAT3 ADDITIONAL TRANSFER FEES NO: '                      
                   BH-AT3-TRANSF-FEES-ADD-NO                                    
LRM007       DISPLAY 'BHAT3 FOREIGN FEES NO: '                                  
434913                    BH-AT3-FOREIGN-FEE-NO                                 
           ELSE                                                                 
             DISPLAY 'NO ADDITIONAL TRANSFER FEES FOR CLIENT ' B1-SUB           
             MOVE ZEROS TO BH-AT3-TRANSF-FEES-ADD-NO                            
           END-IF.                                                              
                                                                                
           SET B1-ITEM-FOUND TO TRUE.                                           
                                                                                
           MOVE '009110'                   TO BH-B2-INFO-ID                     
           CALL  GETB1V                 USING BH-BROKER-HEADER-INFO,            
                                              BH-MGCA-INFO                      
           END-CALL.                                                            
       0310-GET-B1-INFO-EXIT. EXIT.                                             
                                                                                
       0315-DETERMINE-CLI-STRM.                                                 
           MOVE BH-BROKER-MINI-MAXI-INDICATOR TO CLIENT-STREAM.                 
       0315-DETERMINE-CLI-STRM-EXIT. EXIT.                                      
           EJECT                                                                
       0320-LOAD-B1-ITEM.                                                       
           DISPLAY ' '.                                                         
           DISPLAY 'FOUND ACTIVE ACAT CLIENT ' B1-SUB.                          
           MOVE B1-SUB TO B1-TBL-CNT.                                           
           MOVE BH-BROKER-NUMBER-N                  TO                          
                   B1-ADP-CLIENT (B1-TBL-CNT).                                  
           MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)  TO                          
                   B1-BROKER     (B1-TBL-CNT).                                  
           MOVE BH-BROKER-NAME                      TO                          
                   B1-CLIENT-NAME (B1-TBL-CNT).                                 
      **                                                                        
TCK001**   DISPLAY 'CAT820 - BH-BROKER-NUMBER-N = '                             
TCK001**                     BH-BROKER-NUMBER-N.                                
TCK001**   DISPLAY 'CAT820 - BH-BROKER-NAME  = '                                
      **                     BH-BROKER-NAME.                                    
TCK001**   DISPLAY 'CAT820 - B1-000100, BH-BROKER-ACTIVE = '                    
TCK001**                                BH-BROKER-STATUS.                       
TCK001**   DISPLAY 'CAT820 - B1-511011, BH-BTS2-STATUS = '                      
TCK001**                                BH-BTS2-STATUS.                         
TCK001**   DISPLAY 'CAT820 - B1-434501, BH-ACAT-STATUS = '                      
TCK001**                                BH-ACAT-STATUS.                         
TCK001**   DISPLAY 'CAT820 - B1-434901, BH-AT2-STATUS = '                       
TCK001**                                BH-AT2-STATUS.                          
TCK001**   DISPLAY 'CAT820 - B1-434520, BH-ACAT-DO-NOT-BOOK-TRF-FEE = '         
TCK001**                                 BH-ACAT-DO-NOT-BOOK-TRF-FEE            
TCK001**   DISPLAY 'CAT820 - B1-434649, '                                       
TCK001**                              'BH-ACAT-TRANS-FEE-BATCH-ENTRY = '        
TCK001**                               BH-ACAT-TRANS-FEE-BATCH-ENTRY            
TCK001**   DISPLAY 'CAT820 - B1-434577, BH-ACAT-TRANSFER-FEE-NO = '             
TCK001**                                BH-ACAT-TRANSFER-FEE-NO                 
TCK001**   DISPLAY 'CAT820 - B1-434902, BH-AT2-IRA-MAINT-FEE-NO = '             
TCK001**                                BH-AT2-IRA-MAINT-FEE-NO                 
TCK001**   DISPLAY 'CAT820 - B1-434903, BH-AT2-IRA-TERM-FEE-NO = '              
TCK001**                                BH-AT2-IRA-TERM-FEE-NO                  
TCK001**   DISPLAY 'CAT820 - B1-009125, BH-MGCA-IRA-BR-RANGE-NO = '             
TCK001**                     BH-MGCA-IRA-BR-RANGE-NO                            
TCK001**   DISPLAY 'CAT820 - B1-009126, BH-MGCA-IRA-BR-ACT-RANGE-NO = '         
TCK001**                     BH-MGCA-IRA-BR-ACT-RANGE-NO                        
      *** CARD-511221                                                           
TCK001***  B1 511221 WILL NO LONGER BE USED ------- 8/25/00                     
TCK001***  REPLACED BY C434902                                                  
TCK001***  MOVE BH-BTS2-ACAT-MAINT-FEE-FOR-IRA      TO                          
TCK001***          B1-MAINT-FEE-FOR-IRA (B1-TBL-CNT).                           
TCK001     MOVE SPACE TO  B1-MAINT-FEE-FOR-IRA (B1-TBL-CNT).                    
********* CARD 511162                                                           
********   MOVE BH-BTS2-ACAT-TRANSF-FEE-OFFSET      TO                          
********           B1-XFER-FEE-OFST-ACT (B1-TBL-CNT).                           
********* CARD 511163                                                           
*********  MOVE BH-BTS2-ACAT-TRF-FEE-IRA-OFFST      TO                          
*********          B1-XFER-IRA-FEE-OFST-ACT (B1-TBL-CNT).                       
LRM****** THE FOLLOWING DEFAULT TRANSFER FEES WILL NO LONGER BE USED.           
      *** CARD 501306                                                           
      *    MOVE BH-BTS-ACAT-TRANSFER-FEE            TO                          
C09386*            XFER-FEE-IN                                                  
C09386*    MOVE XFER-FEE-ACTUAL                     TO                          
      *            B1-CLI-XFER-FEE (B1-TBL-CNT).                                
           MOVE ZERO TO B1-CLI-XFER-FEE (B1-TBL-CNT).                           
      *** CARD 501307                                                           
      *    MOVE BH-BTS-ACAT-TRANSFER-FEE-IRA        TO                          
C09386*            XFER-FEE-IN                                                  
C09386*    MOVE XFER-FEE-ACTUAL                     TO                          
      *            B1-CLI-XFER-FEE-IRA (B1-TBL-CNT).                            
           MOVE ZERO TO B1-CLI-XFER-FEE-IRA (B1-TBL-CNT).                       
      *** CARD 501308                                                           
      *    MOVE BH-BTS-ACAT-TRF-FEE-IRA-EXT         TO                          
C09386*            XFER-FEE-IN                                                  
           MOVE ZERO TO XFER-FEE-IN                                             
C09386*    MOVE XFER-FEE-ACTUAL                     TO                          
      *            B1-ACCT-XFER-FEE-IRA-DFLT (B1-TBL-CNT).                      
           MOVE ZERO TO B1-TERM-FEE-IRA-DFLT (B1-TBL-CNT).                      
      *** CARD 534516                                                           
           MOVE BH-ACAT-SUBMIT-ASSETS    TO                                     
                   B1-ACAT-SUBMIT-ASSETS (B1-TBL-CNT).                          
      *** CARD 534520                                                           
           MOVE BH-ACAT-DO-NOT-BOOK-TRF-FEE TO                                  
                   B1-XFER-DO-NOT-BOOK-TRF-FEE (B1-TBL-CNT).                    
      *** CARD 534524                                                           
           MOVE BH-ACAT-TRANSFER-FEE-IRA-ACT TO                                 
                   B1-XFER-FEE-IRA-ACT (B1-TBL-CNT).                            
      *** CARD 511233                                                           
TCK001***  B1 511233 WILL NO LONGER BE USED.   8/25/00                          
TCK001***  MOVE BH-BTS2-ACAT-IRA-CODE-FEE-EXT       TO                          
TCK001     MOVE SPACES                              TO                          
                   B1-ACCT-IRA-FEE-CODE (B1-TBL-CNT).                           
TCK001*** CARD 511232 ---- WILL NO LONGER BE USED ---- 8/25/00                  
TCK001*    MOVE BH-BTS2-ACAT-TRF-FEE-BAT-ENTRY      TO                          
TCK001*            B1-BTCH-ENTR-CODE    (B1-TBL-CNT).                           
      ****                                                                      
TCK001*** CARD 434649 -- REPLACING CARD 511232 ----- 8/25/00                    
TCK001     MOVE BH-ACAT-TRANS-FEE-BATCH-ENTRY       TO                          
TCK001             B1-BTCH-ENTR-CODE    (B1-TBL-CNT).                           
      ****                                                                      
00066 **  CARD-511223                                                           
TCK001***    B1 511223 WILL NO LONGER BE USED.  8/25/00                         
TCK001***    MOVE BH-BTS2-ACAT-FRAC-QTY-DELV   TO                               
TCK001***           B1-BTS2-ACAT-FRAC-QTY-DELV (B1-TBL-CNT).                    
00200 ** CARD-434537                                                            
             MOVE BH-ACAT-LIQUIDATE-FRAC-SHARES  TO                             
                   B1-ACAT-LIQ-FRAC-SHARES (B1-TBL-CNT).                        
      *** CARD 434512                                                           
             MOVE BH-ACAT-TYPE-3-BALANCES  TO                                   
                   B1-ACAT-TYPE3-BALANCES (B1-TBL-CNT).                         
      *** CARD 434646                                                           
             MOVE BH-ACAT-TYPE3-BATCH-ENTRY TO                                  
                   B1-ACAT-TYPE3-BATCH-ENTRY (B1-TBL-CNT).                      
      *** CARD 434647                                                           
             MOVE BH-ACAT-TYPE3-DESCRIPTION TO                                  
                   B1-ACAT-TYPE3-DESCRIPTION (B1-TBL-CNT).                      
      *** CARD 434648                                                           
             MOVE BH-ACAT-TYPE3-TRAILER     TO                                  
                   B1-ACAT-TYPE3-TRAILER   (B1-TBL-CNT).                        
LRM002** CARD-434671                                                            
LRM002     MOVE SPACES TO B1-ACAT-IRA-FEE-CODE-VALUES (B1-TBL-CNT).             
LRM002     MOVE BH-ACAT-IRA-FEE-CODE-VAL-NO TO                                  
LRM002            B1-ACAT-IRA-FEE-CODE-VAL-NO (B1-TBL-CNT).                     
LRM002     PERFORM VARYING IRA-SUB  FROM 1 BY 1                                 
LRM002         UNTIL IRA-SUB  > BH-ACAT-IRA-FEE-CODE-VAL-NO                     
LRM002            MOVE BH-ACAT-IRA-FEE-CODE-VAL (IRA-SUB) TO                    
LRM002                 B1-ACAT-IRA-FEE-CODE-VAL(B1-TBL-CNT IRA-SUB)             
LRM002     END-PERFORM.                                                         
LRM002** CARD-434672                                                            
LRM002     MOVE SPACES TO B1-ACAT-IRA-FEE-TAX-ID-VALUES (B1-TBL-CNT).           
LRM002     MOVE BH-ACAT-IRA-FEE-TAX-ID-VAL-NO TO                                
LRM002             B1-ACAT-IRA-FEE-TAX-ID-VAL-NO (B1-TBL-CNT).                  
LRM002     PERFORM VARYING IRA-SUB  FROM 1 BY 1                                 
LRM002         UNTIL IRA-SUB  > BH-ACAT-IRA-FEE-TAX-ID-VAL-NO                   
LRM002           MOVE BH-ACAT-IRA-FEE-TAX-ID-VAL (IRA-SUB) TO                   
LRM002                B1-ACAT-IRA-FEE-TAX-ID-VAL (B1-TBL-CNT IRA-SUB)           
LRM002     END-PERFORM.                                                         
LRM002     DISPLAY 'CAT820 - B1-434671 ' B1-ACAT-IRA-FEE-CODE-VAL-NO            
LRM002       (B1-TBL-CNT) ' ' B1-ACAT-IRA-FEE-CODE-VALUES(B1-TBL-CNT).          
LRM002     DISPLAY 'CAT820 - B1-434672 ' B1-ACAT-IRA-FEE-TAX-ID-VAL-NO          
LRM002       (B1-TBL-CNT) ' ' B1-ACAT-IRA-FEE-TAX-ID-VALUES(B1-TBL-CNT).        
                                                                                
LRM003*** CARD 434708                                                           
LRM003     MOVE BH-ACAT-LIQ-FRAC-SHARE-PTR TO                                   
LRM003             B1-ACAT-LIQ-FRAC-SHARE-PTR (B1-TBL-CNT).                     
BI-->      INITIALIZE XFR-OCCURS-CTR.                                           
           EVALUATE TRUE                                                        
              WHEN  BH-ACAT-TRANSFER-FEE-NO <= 100                              
                 MOVE BH-ACAT-TRANSFER-FEE-NO TO XFR-FEE-MAX-1                  
              WHEN  BH-ACAT-TRANSFER-FEE-NO > 100                               
                    AND BH-ACAT-TRANSFER-FEE-NO <= 200                          
                 MOVE 100 TO XFR-FEE-MAX-1                                      
                 COMPUTE XFR-FEE-MAX-2 = BH-ACAT-TRANSFER-FEE-NO - 100          
           END-EVALUATE.                                                        
                                                                                
            MOVE  BH-AT3-TRANSF-FEES-ADD-NO TO                                  
                  B1-AT3-TRANSF-FEES-ADD-NO(B1-TBL-CNT).                        
                                                                                
      **--> FOR OCCURENCES 1 TO 100                                             
            IF XFR-FEE-MAX-1 > 0                                                
               PERFORM 0330-LOAD-B1-REG-FEES THRU                               
                       0330-LOAD-B1-REG-FEES-EXIT                               
                       VARYING B11-SUB FROM 1 BY 1                              
                       UNTIL B11-SUB > XFR-FEE-MAX-1                            
            END-IF.                                                             
                                                                                
      **--> FOR OCCURENCES 101 TO 200                                           
           IF XFR-FEE-MAX-2 > 0                                                 
               MOVE 1 TO B12-SUB                                                
               MOVE 101 TO B11-SUB                                              
               PERFORM 0331-LOAD-B1-REG-FEES-2 THRU                             
                       0331-LOAD-B1-REG-FEES-2-EXIT                             
                       VARYING B12-SUB FROM 1 BY 1                              
                       UNTIL B12-SUB > XFR-FEE-MAX-2                            
           END-IF.                                                              
                                                                                
             MOVE BH-ACAT-TRANSFER-FEE-NO  TO                                   
                   B1-XFER-RANGE-NO (B1-TBL-CNT).                               
             PERFORM 0335-LOAD-B1-IRA-FEES THRU                                 
                     0335-LOAD-B1-IRA-FEES-EXIT                                 
                     VARYING B11-SUB FROM 1 BY 1                                
                     UNTIL B11-SUB > BH-AT2-IRA-MAINT-FEE-NO                    
             MOVE BH-AT2-IRA-MAINT-FEE-NO TO                                    
                   B1-XFER-IRA-MAINT-RANGE-NO (B1-TBL-CNT).                     
             PERFORM 0340-LOAD-B1-ACCT-FEES THRU                                
                     0340-LOAD-B1-ACCT-FEES-EXIT                                
                     VARYING B11-SUB FROM 1 BY 1                                
                     UNTIL B11-SUB > BH-AT2-IRA-TERM-FEE-NO.                    
             MOVE BH-AT2-IRA-TERM-FEE-NO TO                                     
                   B1-XFER-IRA-TERM-RANGE-NO (B1-TBL-CNT).                      
             PERFORM 0345-LOAD-IRA-ACCTS THRU                                   
                     0345-LOAD-IRA-ACCTS-EXIT                                   
                     VARYING B11-SUB FROM 1 BY 1                                
                     UNTIL B11-SUB > BH-ACAT-RETIRE-ACCOUNTS-NO.                
             MOVE BH-ACAT-RETIRE-ACCOUNTS-NO TO                                 
                  B1-ACAT-RETIRE-ACCOUNTS-NO (B1-TBL-CNT).                      
LRM007       MOVE BH-ACAT-FOREIGN-FEE-DESCRIPT TO                       BHAT2   
LRM007            B1-ACAT-FRGN-FEE-DESCRIPTION (B1-TBL-CNT).            BHAT2   
           IF BH-MGCA-ACTIVE                                                    
              PERFORM 0350-LOAD-MGCA-IRA-BR                                     
                        VARYING B11-SUB FROM 1 BY 1                             
                        UNTIL B11-SUB > BH-MGCA-IRA-BR-RANGE-NO                 
              MOVE BH-MGCA-IRA-BR-ACT-RANGE-NO TO                               
                             B1-MGCA-IRA-BR-ACT-RANGE-NO (B1-TBL-CNT)           
              PERFORM 0355-LOAD-MGCA-IRA-BRAC                                   
                        VARYING B11-SUB FROM 1 BY 1                             
                        UNTIL B11-SUB > BH-MGCA-IRA-BR-ACT-RANGE-NO             
              MOVE BH-MGCA-IRA-BR-RANGE-NO TO                                   
                             B1-MGCA-IRA-BR-RANGE-NO (B1-TBL-CNT)               
           ELSE                                                                 
              MOVE ZEROS TO  B1-MGCA-IRA-BR-ACT-RANGE-NO (B1-TBL-CNT)           
                             B1-MGCA-IRA-BR-RANGE-NO (B1-TBL-CNT)               
           END-IF.                                                              
TEST*****  DISPLAY B1-ITEMS (B1-TBL-CNT).                                       
                                                                                
       0320-LOAD-B1-ITEM-EXIT.  EXIT.                                           
                                                                                
       0330-LOAD-B1-REG-FEES.                                                   
      *** LOAD B1 434577 FIELDS                                                 
              MOVE BH-ACAT-TRANSFER-FEE-AMT (B11-SUB)       TO                  
                   B1-XFER-FEE (B1-TBL-CNT B11-SUB)                             
              MOVE BH-ACAT-TRANSFER-FEE-ACT-LO  (B11-SUB)   TO                  
                   B1-XFER-BRAC-LOW (B1-TBL-CNT B11-SUB)                        
              MOVE BH-ACAT-TRANSFER-FEE-ACT-HI  (B11-SUB)   TO                  
                   B1-XFER-BRAC-HIGH (B1-TBL-CNT B11-SUB)                       
              MOVE BH-ACAT-TRANSFER-FEE-OFFSET (B11-SUB)    TO                  
                   B1-XFER-OFFSET-TY (B1-TBL-CNT B11-SUB)                       
              MOVE BH-ACAT-TRANSFER-FEE-BATCH (B11-SUB)     TO                  
                   B1-XFER-BATCH (B1-TBL-CNT B11-SUB)                           
              MOVE BH-ACAT-TRANSFER-FEE-ENT (B11-SUB)       TO                  
                   B1-XFER-ENTRY (B1-TBL-CNT B11-SUB).                          
                                                                                
       0330-LOAD-B1-REG-FEES-EXIT.  EXIT.                                       
                                                                                
       0331-LOAD-B1-REG-FEES-2.                                                 
      *** LOAD B1 434577 FIELDS                                                 
TCK001*** EXPANDED FROM 100 TO 200 *****                                        
**********                                                                      
TCK001        MOVE  BH-ACAT-TRANSFER-FEE-AMT-2 (B12-SUB)    TO                  
TCK001              B1-XFER-FEE (B1-TBL-CNT B11-SUB)                            
TCK001        MOVE  BH-ACAT-TRANSFER-FEE-ACT-LO-2 (B12-SUB) TO                  
TCK001              B1-XFER-BRAC-LOW (B1-TBL-CNT B11-SUB)                       
TCK001        MOVE  BH-ACAT-TRANSFER-FEE-ACT-HI-2 (B12-SUB) TO                  
TCK001              B1-XFER-BRAC-HIGH (B1-TBL-CNT B11-SUB)                      
TCK001        MOVE  BH-ACAT-TRANSFER-FEE-OFFSET-2 (B12-SUB) TO                  
TCK001              B1-XFER-OFFSET-TY (B1-TBL-CNT B11-SUB)                      
TCK001        MOVE  BH-ACAT-TRANSFER-FEE-BATCH-2 (B12-SUB)  TO                  
TCK001              B1-XFER-BATCH (B1-TBL-CNT B11-SUB)                          
TCK001        MOVE  BH-ACAT-TRANSFER-FEE-ENT-2 (B12-SUB)    TO                  
TCK001              B1-XFER-ENTRY (B1-TBL-CNT B11-SUB).                         
                                                                                
TCK001        ADD  1 TO B11-SUB.                                                
       0331-LOAD-B1-REG-FEES-2-EXIT.  EXIT.                                     
                                                                                
       0335-LOAD-B1-IRA-FEES.                                                   
      *** LOAD B1 434902 FIELDS                                                 
           MOVE  BH-AT2-IRA-MAINT-FEE-AMT  (B11-SUB)     TO                     
                B1-XFER-IRA-FEE    (B1-TBL-CNT B11-SUB).                        
           MOVE  BH-AT2-IRA-MAINT-FEE-ACT-LO   (B11-SUB)     TO                 
                B1-XFER-IRA-BRAC-LOW (B1-TBL-CNT B11-SUB).                      
           MOVE  BH-AT2-IRA-MAINT-FEE-ACT-HI   (B11-SUB)     TO                 
                B1-XFER-IRA-BRAC-HIGH (B1-TBL-CNT B11-SUB).                     
           MOVE  BH-AT2-IRA-MAINT-FEE-CODE     (B11-SUB)     TO                 
                B1-XFER-IRA-FEE-CODE  (B1-TBL-CNT B11-SUB).                     
           MOVE  BH-AT2-IRA-MAINT-FEE-OFFSET   (B11-SUB)     TO                 
                B1-XFER-IRA-FEE-OFFSET (B1-TBL-CNT B11-SUB).                    
           MOVE  BH-AT2-IRA-MAINT-FEE-BATCH    (B11-SUB)     TO                 
                B1-XFER-IRA-FEE-BATCH  (B1-TBL-CNT B11-SUB).                    
           MOVE  BH-AT2-IRA-MAINT-FEE-ENT      (B11-SUB)     TO                 
                B1-XFER-IRA-FEE-ENTRY  (B1-TBL-CNT B11-SUB).                    
LRM        MOVE BH-AT2-IRA-MAINT-FEE-FROM-DATE (B11-SUB)     TO                 
                                    WS-DATE-YYMMDD                              
                                    WS-DATE-CCYYMMDD (3 : 6).                   
           IF WS-DATE-YYMMDD (1 : 2) > '90'                                     
               MOVE '19' TO         WS-DATE-CCYYMMDD (1 : 2)                    
           ELSE                                                                 
               MOVE '20' TO         WS-DATE-CCYYMMDD (1 : 2)                    
           END-IF.                                                              
           MOVE WS-DATE-CCYYMMDD TO                                             
                B1-XFER-IRA-FEE-FR-DATE (B1-TBL-CNT B11-SUB).                   
           MOVE BH-AT2-IRA-MAINT-FEE-TO-DATE (B11-SUB)     TO                   
                                    WS-DATE-YYMMDD                              
                                    WS-DATE-CCYYMMDD (3 : 6).                   
           IF WS-DATE-YYMMDD (1 : 2) > '90'                                     
               MOVE '19' TO         WS-DATE-CCYYMMDD (1 : 2)                    
           ELSE                                                                 
               MOVE '20' TO         WS-DATE-CCYYMMDD (1 : 2)                    
           END-IF.                                                              
           MOVE WS-DATE-CCYYMMDD TO                                             
                B1-XFER-IRA-FEE-TO-DATE (B1-TBL-CNT B11-SUB).                   
       0335-LOAD-B1-IRA-FEES-EXIT.  EXIT.                                       
                                                                                
       0340-LOAD-B1-ACCT-FEES.                                                  
      *** LOAD B1 434903 FIELDS                                                 
LRM012     IF B11-SUB < 101                                                     
              MOVE  BH-AT2-IRA-TERM-FEE-AMT        (B11-SUB)      TO            
                B1-TERM-IRA-FEE        (B1-TBL-CNT B11-SUB)                     
              MOVE  BH-AT2-IRA-TERM-FEE-ACT-LO      (B11-SUB)     TO            
                B1-TERM-IRA-BRAC-LOW (B1-TBL-CNT B11-SUB)                       
              MOVE  BH-AT2-IRA-TERM-FEE-ACT-HI      (B11-SUB)     TO            
                B1-TERM-IRA-BRAC-HIGH (B1-TBL-CNT B11-SUB)                      
              MOVE  BH-AT2-IRA-TERM-FEE-CODE     (B11-SUB)     TO               
                B1-TERM-IRA-FEE-CODE       (B1-TBL-CNT B11-SUB)                 
              MOVE  BH-AT2-IRA-TERM-FEE-OFFSET   (B11-SUB)     TO               
                B1-TERM-IRA-FEE-OFFSET (B1-TBL-CNT B11-SUB)                     
              MOVE  BH-AT2-IRA-TERM-FEE-BATCH    (B11-SUB)     TO               
                B1-TERM-IRA-FEE-BATCH       (B1-TBL-CNT B11-SUB)                
              MOVE  BH-AT2-IRA-TERM-FEE-ENT      (B11-SUB)     TO               
                B1-TERM-IRA-FEE-ENTRY       (B1-TBL-CNT B11-SUB)                
LRM012     ELSE                                                                 
LRM012        SUBTRACT 100 FROM B11-SUB GIVING B14-SUB                          
LRM012        MOVE  BH-AT2-IRA-TERM-FEE-AMT2       (B14-SUB)      TO            
LRM012          B1-TERM-IRA-FEE        (B1-TBL-CNT B11-SUB)                     
LRM012        MOVE  BH-AT2-IRA-TERM-FEE-ACT-LO2     (B14-SUB)     TO            
LRM012          B1-TERM-IRA-BRAC-LOW (B1-TBL-CNT B11-SUB)                       
LRM012        MOVE  BH-AT2-IRA-TERM-FEE-ACT-HI2     (B14-SUB)     TO            
LRM012          B1-TERM-IRA-BRAC-HIGH (B1-TBL-CNT B11-SUB)                      
LRM012        MOVE  BH-AT2-IRA-TERM-FEE-CODE2    (B14-SUB)     TO               
LRM012          B1-TERM-IRA-FEE-CODE       (B1-TBL-CNT B11-SUB)                 
LRM012        MOVE  BH-AT2-IRA-TERM-FEE-OFFSET2  (B14-SUB)     TO               
LRM012          B1-TERM-IRA-FEE-OFFSET (B1-TBL-CNT B11-SUB)                     
LRM012        MOVE  BH-AT2-IRA-TERM-FEE-BATCH2   (B14-SUB)     TO               
LRM012          B1-TERM-IRA-FEE-BATCH       (B1-TBL-CNT B11-SUB)                
LRM012        MOVE  BH-AT2-IRA-TERM-FEE-ENT2     (B14-SUB)     TO               
LRM012          B1-TERM-IRA-FEE-ENTRY       (B1-TBL-CNT B11-SUB)                
LRM012     END-IF.                                                              
       0340-LOAD-B1-ACCT-FEES-EXIT.  EXIT.                                      
                                                                                
       0345-LOAD-IRA-ACCTS.                                                     
00200 ** CARD-434539                                                            
           MOVE  BH-ACAT-RETIRE-ACCOUNTS-LO   (B11-SUB)     TO                  
                B1-ACAT-RETIRE-ACCOUNTS-LO  (B1-TBL-CNT B11-SUB).               
           MOVE  BH-ACAT-RETIRE-ACCOUNTS-HI   (B11-SUB)     TO                  
                B1-ACAT-RETIRE-ACCOUNTS-HI  (B1-TBL-CNT B11-SUB).               
       0345-LOAD-IRA-ACCTS-EXIT. EXIT.                                          
                                                                                
       0350-LOAD-MGCA-IRA-BR.                                                   
           MOVE  BH-MGCA-IRA-BR-RANGE-ENTRY (B11-SUB) TO                        
                B1-MGCA-IRA-BR-RANGE-ENTRY  (B1-TBL-CNT B11-SUB).               
                                                                                
       0355-LOAD-MGCA-IRA-BRAC.                                                 
           MOVE  BH-MGCA-IRA-BR-ACT-RANGE-ENTRY (B11-SUB) TO                    
                B1-MGCA-IRA-BR-ACT-RANGE-ENTRY (B1-TBL-CNT B11-SUB).            
           EJECT                                                                
       0400-PROCESS-TFRS-FILE.                                                  
                                                                                
           PERFORM 0500-READ-TFRS-RTN                                           
                    THRU 0500-EXIT.                                             
                                                                                
           IF (TFRS-FILE-EOF-SW = 'Y'                                           
                 OR TFRS-DETAIL-KEY NOT = PEND-DETAIL-KEY)                      
                                                                                
LRM004*****  IF PEND-DETAIL-KEY > SPACES                                        
LRM004*****  AND PEND-ADP-CL-NO-X = '274'                                       
LRM004*****     PERFORM 0500-LMWW-FEE-RTN                                       
LRM004*****     MOVE ZERO    TO  WS-POS-TYPE-LEGG                               
LRM004*****     MOVE ZERO    TO  WS-POS-TYPE-NON-LEGG                           
LRM004*****  END-IF                                                             
                                                                                
             IF WS-CASH-ADJ-AMT-TYPE1 NOT = ZEROS                               
             OR WS-CASH-ADJ-AMT-TYPE2 NOT = ZEROS                               
             OR WS-CASH-ADJ-AMT-TYPE5 NOT = ZEROS                               
LRM007       OR FRGN-FEE-TOTAL        NOT = ZEROS                               
               MOVE PEND-ADP-CL-NO-X  TO CASH-ADP-CL-NO-X                       
LRM003         IF (PEND-TRNFR-TYPE-CD = 'FUL' OR 'PTR')                         
                  MOVE PEND-CONTROL-NBR  TO CASH-CONTROL-NBR                    
               ELSE                                                             
                  ADD 1 TO WS-RESTART-COUNT                                     
                  MOVE WS-RESTART-LIT    TO CASH-CONTROL-NBR                    
               END-IF                                                           
               MOVE PEND-DLVR-NBR     TO CASH-DLVR-NBR                          
               MOVE PEND-DLVR-ACCT    TO CASH-DLVR-ACCT                         
               MOVE PEND-RCV-NBR      TO CASH-RCV-NBR                           
               MOVE PEND-RCV-ACCT     TO CASH-RCV-ACCT                          
               MOVE PEND-TRNFR-TYPE-CD TO CASH-TRNFR-TYPE-CD                    
                                                                                
               MOVE XFER-FEE-REG      TO CASH-TRNFR-FEE-AMT                     
               MOVE XFER-FEE-IRA      TO CASH-IRA-TRMNT-AMT                     
               MOVE MAINT-FEE-IRA     TO CASH-IRA-MAINT-AMT                     
               MOVE WS-CASH-ADJ-AMT-TYPE1 TO CASH-NET-ADJUST-TYPE1              
               MOVE WS-CASH-ADJ-AMT-TYPE2 TO CASH-NET-ADJUST-TYPE2              
               MOVE WS-CASH-ADJ-AMT-TYPE5 TO CASH-NET-ADJUST-TYPE5              
LRM007         MOVE FRGN-FEE-TOTAL        TO CASH-FRGN-FEE-AMT-TOT              
LR0007         MOVE SPACES TO CASH-FRGN-FEE-REC-IND                             
LRM014         MOVE PAPER-STMNT-FEE       TO CASH-PAPER-STMNT-FEE-AMT           
                                                                                
               WRITE CASH-DETAIL-RECORD                                         
               ADD 1 TO CASH-RECS-WRTN                                          
                                                                                
               MOVE ZEROS TO WS-CASH-ADJ-AMT-TYPE1                              
                             WS-CASH-ADJ-AMT-TYPE2                              
                             WS-CASH-ADJ-AMT-TYPE5                              
LRM004                       XFER-FEE-IRA                                       
LRM004                       XFER-FEE-REG                                       
LRM004                       MAINT-FEE-IRA                                      
LRM007                       FRGN-FEE-AMT                                       
LRM007                       FRGN-FEE-TOTAL                                     
LRM014                       PAPER-STMNT-FEE                                    
           END-IF.                                                              
                                                                                
           IF TFRS-FILE-EOF-SW = 'Y'                                            
              GO TO 0400-PROCESS-TFRS-FILE-EXIT.                                
                                                                                
           MOVE TFRS-DETAIL-RECORD    TO PEND-DETAIL-RECORD.                    
           MOVE PEND-ADP-CL-NO        TO  CAK-CLIENT.                           
           MOVE PEND-DLVR-ACCT(1 : 3) TO  CAK-BRANCH.                           
           MOVE PEND-DLVR-ACCT(4 : 5) TO  CAK-ACCOUNT.                          
TEST  *    DISPLAY 'WORKING WITH KEY ' CAK-CLIENT ' ' CAK-BRAC                  
TEST  *         ' '  PEND-CONTROL-NBR                                           
                                                                                
           ADD 1 TO TFRS-DTL-RECS.                                              
                                                                                
LRM010     SET NOT-LEGACY-ACCOUNT TO TRUE.                                      
LRM010     IF CAK-CLIENT = 010                                                  
LRM010        IF (CAK-BRANCH = '203' OR '384' OR '385' OR '386' OR '387'        
LRM010             OR '388' OR '389' OR '390' OR '398' OR '479' OR '607'        
LRM010             OR '609'          OR '962' OR '981')                         
LRM010        OR (CAK-BRANCH(1:1) >= 'A' AND <= 'Z')                            
LRM010        OR (CAK-BRANCH(2:1) >= 'A' AND <= 'Z')                            
LRM010        OR (CAK-BRANCH(3:1) >= 'A' AND <= 'Z')                            
LRM010           SET LEGACY-ACCOUNT TO TRUE                                     
LRM010     END-IF.                                                              
                                                                                
      * IS ACAT CLIENT IN B1 TABLE                                              
      * ON MATCH CONTINUE                                                       
           IF PEND-ADP-CL-NO NUMERIC                                            
           AND (PEND-ADP-CL-NO >= 1 AND <= 400)                                 
TEST  *      DISPLAY 'B1-SUB1 ' B1-SUB1 ' PEND-CL ' PEND-ADP-CL-NO              
             IF PEND-ADP-CL-NO NOT = B1-SUB1                                    
                MOVE PEND-ADP-CL-NO TO B1-SUB1                                  
TEST  *         DISPLAY 'SET B1-SUB1 = ' B1-SUB1                                
                IF B1-ADP-CLIENT (B1-SUB1) = PEND-ADP-CL-NO                     
TEST  *           DISPLAY 'FND B1-SUB1 = ' B1-SUB1                              
E.T.              IF PEND-ADP-CL-NO NOT = WK-PREV-CLT                           
E.T.                 IF WK-PREV-CLT = 0                                         
E.T.                    MOVE PEND-ADP-CL-NO TO WK-PREV-CLT                      
E.T.                 ELSE                                                       
E.T.                    MOVE PEND-ADP-CL-NO TO WK-PREV-CLT                      
E.T.                    IF B1-WK-PRINT-REPORT-IND NOT = '1'                     
E.T.                       PERFORM 0450-REPORT-NO-DATA                          
E.T.                    END-IF                                                  
E.T.                 END-IF                                                     
E.T.              END-IF                                                        
                  MOVE B1-ITEMS (B1-SUB1) TO B1-WRK-ITEMS                       
                  MOVE B1-SUB1  TO  B1-SUB1-SVE                                 
                  SET B1-ENTRY-FOUND TO TRUE                                    
                                                                                
                ELSE                                                            
                  SET B1-ENTRY-NOT-FOUND TO TRUE                                
                END-IF                                                          
             END-IF                                                             
           END-IF.                                                              
                                                                                
           IF B1-ENTRY-FOUND                                                    
             CONTINUE                                                           
           ELSE                                                                 
              ADD 1 TO TFRS-BYP-CLI                                             
              GO TO 0400-PROCESS-TFRS-FILE.                                     
                                                                                
           IF TFRS-ASSET-RECORD                                                 
              PERFORM 0900-LIQ-FRACTIONAL-QTY-RTN                               
                      THRU 0900-EXIT                                            
              GO TO 0400-PROCESS-TFRS-FILE-EXIT                                 
           END-IF.                                                              
                                                                                
LRM ****** IF (B1-WRK-SUBMIT-ASSETS = '1'                                       
    ****** AND PEND-DAYS-STTS-QTY = 1)                                          
    ****** OR (B1-WRK-SUBMIT-ASSETS = '2'                                       
    ****** AND PEND-DAYS-STTS-QTY = 2)                                          
    ****** OR (B1-WRK-SUBMIT-ASSETS = '3'                                       
    ****** AND PEND-DAYS-STTS-QTY = 3)                                          
    ******    CONTINUE                                                          
    ****** ELSE                                                                 
TEST******    DISPLAY 'IGNORE: DAYS IN STATUS NE '                              
    ******      PEND-DAYS-STTS-QTY                                              
    ******     ' B1 ' B1-WRK-SUBMIT-ASSETS                                      
    ******    GO TO 0400-PROCESS-TFRS-FILE-EXIT                                 
    ****** END-IF.                                                              
                                                                                
TEST***    DISPLAY 'MATCH : DAYS IN STATUS '   PEND-DAYS-STTS-QTY.              
                                                                                
           IF TFRS-BALANCE-RECORD                                               
           OR TFRS-RCR-SETTLE-RECORD                                            
              MOVE PEND-ADP-CL-NO  TO CASH-ADP-CL-NO                            
              MOVE PEND-DLVR-NBR   TO CASH-DLVR-NBR                             
              MOVE PEND-DLVR-ACCT  TO CASH-DLVR-ACCT                            
              MOVE PEND-RCV-NBR    TO CASH-RCV-NBR                              
              MOVE PEND-RCV-ACCT   TO CASH-RCV-ACCT                             
              PERFORM 0800-CREATE-TYPE3-BALANCE-RTN                             
                      THRU 0800-EXIT                                            
              IF PEND-PEND-DVDND-DB-AMT > ZERO                                  
LRM008           PERFORM 0820-CREATE-PEND-DVND-BAL-RTN                          
LRM008              THRU 0820-EXIT                                              
LRM008        END-IF                                                            
           ELSE                                                                 
LRM007        IF TFRS-ASSET-FOREIGN                                             
LRM010           IF LEGACY-ACCOUNT                                              
LRM007              PERFORM 1300-LOOKUP-FRGN-FEE-RTN                            
LRM007                 THRU 1300-LOOKUP-FRGN-FEE-EXIT                           
LRM010           END-IF                                                         
LRM008        ELSE                                                              
LRM008           IF TFRS-ASSET-PEND-DVND                                        
LRM008              PERFORM 0840-CREATE-PEND-DVND-ADJ-RTN                       
LRM008                 THRU 0840-EXIT                                           
LRM008           ELSE                                                           
LRM009              IF TFRS-ASSET-TYPE1-TYPE4                                   
LRM009                 PERFORM 0850-CREATE-POSN-TYPE1-T4-RTN                    
LRM009                    THRU 0850-EXIT                                        
LRM009              END-IF                                                      
LRM009           END-IF                                                         
LRM007        END-IF                                                            
              GO TO 0400-PROCESS-TFRS-FILE-EXIT                                 
           END-IF.                                                              
                                                                                
******* DON'T CALC FEES FOR NON-FUL TRANSFERS (RCR FROM CAT812).                
           IF TFRS-TRNFR-TYPE-CD NOT = 'FUL'                                    
              MOVE ZERO         TO  XFER-FEE-IRA                                
                                    XFER-FEE-REG                                
                                    MAINT-FEE-IRA                               
LRM007                              FRGN-FEE-AMT                                
LRM007                              FRGN-FEE-TOTAL                              
LRM014                              PAPER-STMNT-FEE                             
              GO TO 0400-PROCESS-TFRS-FILE-EXIT                                 
           END-IF.                                                              
LRM005* DON'T CHARGE FEE FOR CLIENT 30 DLVY TO AMERITRADE.                      
LRM005     IF CAK-CLIENT = 030                                                  
LRM005     AND PEND-RCV-NBR = '0188'                                            
LRM005        DISPLAY 'SKIP FEE CLI 30 / 0188 ' PEND-CONTROL-NBR                
LRM005        MOVE ZERO         TO  XFER-FEE-IRA                                
LRM005                              XFER-FEE-REG                                
LRM005                              MAINT-FEE-IRA                               
LRM007                              FRGN-FEE-AMT                                
LRM007                              FRGN-FEE-TOTAL                              
LRM014                              PAPER-STMNT-FEE                             
LRM005        GO TO 0400-PROCESS-TFRS-FILE-EXIT                                 
LRM005     END-IF.                                                              
     **                                                                         
     ** CHANGED TO DETERMINE IRA ACCOUNT OR NOT BASED ON MGCA B1(S).            
     ** CARDS 009125 AND 009126.                                                
           SET NON-MGCA-IRA-ACCOUNT TO TRUE.                                    
           SET NON-IRA-ACCOUNT TO TRUE.                                         
           SET NON-ALTERNATE-IRA-ACCOUNT TO TRUE.                               
           PERFORM 5315-CHECK-IRA-BR-RANGE THRU 5315-EXIT.                      
           IF MGCA-IRA-ACCOUNT                                                  
               CONTINUE                                                         
           ELSE                                                                 
               PERFORM 5316-CHECK-IRA-BR-ACT-RANGE THRU 5316-EXIT               
           END-IF.                                                              
                                                                                
           IF MGCA-IRA-ACCOUNT                                                  
TEST **       DISPLAY 'HIT IN MGCA IRA '  CAK-CLIENT ' ' CAK-BRAC               
              SET IRA-ACCOUNT TO TRUE                                           
TEST **    ELSE                                                                 
TEST **       DISPLAY 'FAIL MGCA IRA '  CAK-CLIENT ' ' CAK-BRAC                 
           END-IF.                                                              
     **    MOVE  'N'  TO  B1-RANGE-SEARCH-STATUS.                               
     **    MOVE  ' '  TO  B1-RANGE-SEARCH-SWITCH.                               
     **    MOVE  1    TO  B9-SUB.                                               
     **    PERFORM UNTIL B1-RANGE-SEARCH-END                                    
     **                                                                         
     **      IF B9-SUB > B1-WRK-RETIRE-ACCOUNTS-NO                              
     **        MOVE 'N'  TO  B1-RANGE-SEARCH-STATUS                             
     **        MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                             
     **      END-IF                                                             
     **      IF  CAK-BRAC >= B1-WRK-RETIRE-ACCOUNTS-LO (B9-SUB)                 
     **      AND CAK-BRAC <= B1-WRK-RETIRE-ACCOUNTS-HI (B9-SUB)                 
     **      AND  B9-SUB NOT > B1-WRK-RETIRE-ACCOUNTS-NO                        
     **        SET IRA-ACCOUNT TO TRUE                                          
     **        MOVE 'Y'  TO  B1-RANGE-SEARCH-STATUS                             
     **        MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                             
     **      END-IF                                                             
     **                                                                         
     **      ADD 1  TO  B9-SUB                                                  
     **    END-PERFORM.                                                         
                                                                                
      ********************************************************                  
      * READ NAME AND ADDRESS FILE FOR THIS CUSTOMER                            
      *    INITIALIZE  GETNA-PARAMETERS.                                        
      *    ONLY NEED KEOUGH INDICATOR!                                          
      ********************************************************                  
                                                                                
           MOVE  'R'                        TO  GETNA-REQ-FUNC.                 
           MOVE  'R'                        TO  GETNA-REQ-FILE.                 
           MOVE  'R'                        TO  GETNA-REQ-FUNC2.                
           MOVE  'N'                        TO  GETNA-REQ-YEAREND.              
           MOVE  PGM-NME                    TO  GETNA-PGM-NAME.                 
           MOVE  CAK-CLIENT                 TO  GETNA-KEY-CLIENT.               
           MOVE  '00'                       TO  GETNA-KEY-BRANCH1-2.            
           MOVE  CAK-BRANCH                 TO  GETNA-KEY-BRANCH3-5.            
           MOVE  '00000'                    TO  GETNA-KEY-ACCOUNT1-5.           
           MOVE  CAK-ACCOUNT                TO  GETNA-KEY-ACCOUNT6-10.          
           CALL   GETNA                   USING GETNA-PARAMETERS                
                                                GETNA-SEGMENT-INCLUDES          
           END-CALL.                                                            
                                                                                
           IF  GETNA-RETURN-FOUND  AND                                          
               NOT  NAPPA-SEGMENT-MISSING                                       
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CUSTOMER NOT ON NAME/ADDRESS FILE '                     
               DISPLAY 'ACAT DATA RECORD -> ' PEND-DETAIL-RECORD                
               GO TO 0400-PROCESS-TFRS-FILE.                                    
                                                                                
           MOVE ZERO            TO  XFER-FEE-IRA                                
                                    XFER-FEE-REG                                
                                    MAINT-FEE-IRA                               
LRM007                              FRGN-FEE-AMT                                
LRM007                              FRGN-FEE-TOTAL                              
LRM014                              PAPER-STMNT-FEE.                            
                                                                                
      * DETERMINE TRANSFER FEES                                                 
                                                                                
      *----------------------------------------------------------------         
434524*   B1-434524-FEE-IRA-ACT APPLIED AS FOLLOWS:                             
      * 0 - CHARGE ONLY ONE FEE;                                                
      *       FOR IRA - ONLY TERMINATION FEE IF APPLICABLE                      
      *         OTHERWISE IF NO TERMINATION FEE, CONSIDER REGULAR FEE.          
      *       ASSUME ANNUAL FEE STILL APPLIES!                                  
      * 1 - CHARGE EVERYTHING THAT APPLIES (UPTO 3 FEES):                       
      *       REGULAR FEE, IRA TERMINATION FEE, AND ANNUAL IRA CHARGES.         
      *----------------------------------------------------------------         
LRM014     IF NOT PAPERFEE-EMPTY-MISSING                                        
LRM014        PERFORM 1370-LOOKUP-PAPER-FEE THRU 1370-EXIT.                     
                                                                                
LRM002     IF NOT MGCA-IRA-ACCOUNT                                              
LRM002     AND B1-WK-IRA-FEE-CODE-VAL-NO > ZERO                                 
LRM002     AND NAPPA-IRA-KEOUGH-IND > SPACES                                    
LRM002        PERFORM VARYING IRA-SUB FROM 1 BY 1                               
LRM002            UNTIL IRA-SUB > B1-WK-IRA-FEE-CODE-VAL-NO                     
LRM002              OR B1-WK-IRA-FEE-CODE-VAL(IRA-SUB) =                        
LRM002                    NAPPA-IRA-KEOUGH-IND                                  
LRM002        END-PERFORM                                                       
LRM002        IF IRA-SUB NOT > B1-WK-IRA-FEE-CODE-VAL-NO                        
LRM002           IF B1-WK-IRA-FEE-TAX-ID-VAL-NO = ZEROS                         
LRM002              SET MGCA-IRA-ACCOUNT TO TRUE                                
LRM002              SET IRA-ACCOUNT TO TRUE                                     
LRM002              SET ALTERNATE-IRA-ACCOUNT TO TRUE                           
TEST  **            DISPLAY 'HIT ON B1 434671 IRA ' CAK-BRAC                    
TEST  **             ' '  NAPPA-IRA-KEOUGH-IND                                  
LRM002           ELSE                                                           
LRM002              PERFORM VARYING IRA-SUB FROM 1 BY 1                         
LRM002                  UNTIL IRA-SUB > B1-WK-IRA-FEE-TAX-ID-VAL-NO             
LRM002                     OR B1-WK-IRA-FEE-TAX-ID-VAL(IRA-SUB) =               
LRM002                           NAPPA-SOC-SEC-TAX-ID1                          
LRM002              END-PERFORM                                                 
LRM002              IF IRA-SUB NOT > B1-WK-IRA-FEE-TAX-ID-VAL-NO                
LRM002                 SET MGCA-IRA-ACCOUNT TO TRUE                             
LRM002                 SET IRA-ACCOUNT TO TRUE                                  
LRM002                 SET ALTERNATE-IRA-ACCOUNT TO TRUE                        
TEST  **               DISPLAY 'HIT ON B1 434672 IRA ' CAK-BRAC                 
TEST  **                    ' '  NAPPA-IRA-KEOUGH-IND                           
TEST  **                    ' '  NAPPA-SOC-SEC-TAX-ID1                          
LRM002              END-IF                                                      
LRM002          END-IF                                                          
LRM002        END-IF                                                            
LRM002     END-IF.                                                              
                                                                                
           PERFORM 1100-REGULAR-XFER-FEE-RTN THRU                               
                   1100-REGULAR-XFER-FEE-RTN-EXIT.                              
           IF MGCA-IRA-ACCOUNT                                                  
           AND IRA-ACCOUNT                                                      
             PERFORM 1200-IRA-MAINT-FEE-RTN THRU                                
                     1200-IRA-MAINT-FEE-RTN-EXIT.                               
                                                                                
LRM010     IF (CAK-CLIENT = 010 AND LEGACY-ACCOUNT)                             
LRM010        COMPUTE FEE-WORK = XFER-FEE-REG + XFER-FEE-IRA                    
LRM010     ELSE                                                                 
           IF B1-434524-FEE-IRA-ACT = '0'                                       
              IF XFER-FEE-IRA > ZEROS                                           
                 COMPUTE FEE-WORK = XFER-FEE-IRA                                
                 MOVE ZEROS TO      XFER-FEE-REG                                
              ELSE                                                              
                 COMPUTE FEE-WORK = XFER-FEE-REG                                
                 MOVE ZEROS TO      XFER-FEE-IRA                                
           ELSE                                                                 
              COMPUTE FEE-WORK = XFER-FEE-REG + XFER-FEE-IRA                    
           END-IF.                                                              
                                                                                
           ADD FEE-WORK  TO  WS-CASH-ADJ-AMT-TYPE1.                             
                                                                                
           IF XFER-FEE-REG NOT = ZERO                                           
             IF B1-434520-DO-NOT-BOOK-TRF-FEE NOT = '1'                         
                MOVE 'X'  TO  P2-PROCESS-TYPE                                   
                PERFORM 1400-P2-REC-RTN THRU                                    
                        1400-P2-REC-RTN-EXIT                                    
LRM004       ELSE                                                               
LRM004          MOVE ZEROS TO XFER-FEE-REG                                      
LRM004     END-IF.                                                              
                                                                                
           IF XFER-FEE-IRA NOT = ZERO                                           
             IF B1-434520-DO-NOT-BOOK-TRF-FEE NOT = '1'                         
                MOVE 'Y'  TO  P2-PROCESS-TYPE                                   
                PERFORM 1400-P2-REC-RTN THRU                                    
                        1400-P2-REC-RTN-EXIT                                    
LRM004       ELSE                                                               
LRM004           MOVE ZEROS TO      XFER-FEE-IRA                                
LRM004     END-IF.                                                              
                                                                                
           IF MGCA-IRA-ACCOUNT                                                  
             CONTINUE                                                           
           ELSE                                                                 
LRM004       MOVE ZEROS TO MAINT-FEE-IRA                                        
             GO TO 0400-PROCESS-TFRS-FILE.                                      
                                                                                
      *  MAINTENANCE FEES ARE APPLIED MAY THRU OCTOBER FOR                      
      *  LEGG MASON IRA ACCOUNTS ONLY                                           
TCK001*** NO LONGER USED BY CLIENT                                              
LRM002***  IF B1-WRK-MAINT-FEE-FOR-IRA  =  '1'                                  
LRM002***    CONTINUE                                                           
LRM002***  ELSE                                                                 
LRM002***    GO TO 0400-PROCESS-TFRS-FILE.                                      
                                                                                
           COMPUTE TOT-FEE-WORK = FEE-WORK + MAINT-FEE-IRA.                     
LRM002     ADD MAINT-FEE-IRA TO WS-CASH-ADJ-AMT-TYPE1.                          
                                                                                
           IF MAINT-FEE-IRA NOT = ZERO                                          
             IF B1-434520-DO-NOT-BOOK-TRF-FEE NOT = '1'                         
                SET P2-MAINT TO TRUE                                            
                PERFORM 1400-P2-REC-RTN THRU                                    
                        1400-P2-REC-RTN-EXIT                                    
LRM004       ELSE                                                               
LRM004          MOVE ZEROS TO MAINT-FEE-IRA                                     
LRM004     END-IF.                                                              
                                                                                
LRM002***  IF PEND-ADP-CL-NO-X = '274'                                          
LRM002***     PERFORM 0600-PROCESS-LMWW-ASSETS                                  
LRM002***         THRU 0600-PROCESS-LMWW-ASSETS-EXIT.                           
                                                                                
           GO TO 0400-PROCESS-TFRS-FILE.                                        
                                                                                
       0400-PROCESS-TFRS-FILE-EXIT. EXIT.                                       
                                                                                
                                                                                
       0500-LMWW-FEE-RTN.                                                       
           IF  WS-POS-TYPE-LEGG = ZERO  AND                                     
               WS-POS-TYPE-NON-LEGG = ZERO                                      
               MOVE 35 TO MAINT-FEE-IRA                                         
           ELSE                                                                 
             IF  WS-POS-TYPE-NON-LEGG  >  ZERO                                  
                 MOVE 35 TO MAINT-FEE-IRA                                       
             ELSE                                                               
                 EVALUATE TRUE                                                  
                     WHEN WS-POS-TYPE-LEGG = 1                                  
                          MOVE 10 TO MAINT-FEE-IRA                              
                     WHEN WS-POS-TYPE-LEGG = 2                                  
                          MOVE 20 TO MAINT-FEE-IRA                              
                     WHEN WS-POS-TYPE-LEGG = 3                                  
                          MOVE 30 TO MAINT-FEE-IRA                              
                     WHEN OTHER                                                 
                          MOVE 35 TO MAINT-FEE-IRA                              
                 END-EVALUATE                                                   
             END-IF                                                             
           END-IF.                                                              
           IF XFER-FEE-IRA NOT = ZERO                                           
             IF B1-434520-DO-NOT-BOOK-TRF-FEE NOT = '1'                         
                MOVE 'Y'  TO  P2-PROCESS-TYPE                                   
                PERFORM 1400-P2-REC-RTN THRU                                    
                        1400-P2-REC-RTN-EXIT                                    
LRM004       ELSE                                                               
LRM004           MOVE ZEROS TO      XFER-FEE-IRA                                
LRM004     END-IF.                                                              
                                                                                
           EJECT                                                                
E.T.   0450-REPORT-NO-DATA.                                                     
E.T.       MOVE B1-WRK-ADP-CLIENT  TO HDR-TAG SHDR-TAG DTL-TAG                  
E.T.                                  DSH-TAG HDR-CLIENT                        
E.T.                                  NO-DATA-TAG.                              
E.T.       MOVE B1-WRK-CLIENT-NAME TO HDR-CLIENT-DESC.                          
E.T.       MOVE 0                  TO W-PAGE-CTR.                               
E.T.       MOVE 60                 TO W-LINE-CTR.                               
E.T.       IF W-LINE-CTR  > 55                                                  
E.T.          ADD   1              TO W-PAGE-CTR                                
E.T.          MOVE W-PAGE-CTR      TO HDR-PAGE                                  
DJ0001        MOVE WS-CYCLE-DATA   TO HDR-CYCLE-DATA                            
E.T.          WRITE REPORT-REC     FROM HDR  AFTER PAGE                         
E.T.          WRITE REPORT-REC     FROM SHDR AFTER 2                            
E.T.          WRITE REPORT-REC     FROM DSH  AFTER 1                            
E.T.          WRITE REPORT-REC     FROM NO-DATA-LINE AFTER 2                    
E.T.          ADD 1 TO W-RPT-CTR.                                               
       EJECT                                                                    
                                                                                
       0500-READ-TFRS-RTN.                                                      
           READ TFRS-I-FILE                                                     
             AT END                                                             
                  DISPLAY 'TFRS FILE AT END'                                    
                  MOVE HIGH-VALUES TO TFRS-DETAIL-KEY                           
                  MOVE 'Y' TO TFRS-FILE-EOF-SW.                                 
                                                                                
           IF TFRS-FILE-EOF-SW NOT = 'Y'                                        
           AND TFRS-HDR-REC                                                     
               DISPLAY 'FOUND HEADER ON TFRS.'                                  
                       ' REC-CNT ' TFRS-TRL-REC-CNT                             
LRM006         WRITE CASH-DETAIL-RECORD FROM TFRS-HEADER-RECORD                 
               GO TO 0500-READ-TFRS-RTN                                         
           END-IF.                                                              
                                                                                
           IF TFRS-FILE-EOF-SW NOT = 'Y'                                        
           AND TFRS-TRL-REC                                                     
               DISPLAY 'FOUND TRAILER ON TFRS.'                                 
                       ' REC-CNT ' TFRS-TRL-REC-CNT                             
               GO TO 0500-READ-TFRS-RTN                                         
           END-IF.                                                              
       0500-EXIT. EXIT.                                                         
                                                                                
      ************************************************************              
      * SEE IF ASSET IS ON MSD AND NETWORK FUND FILE.                           
      * COUNT UP LEGG ASSETS AND FUNDS.                                         
      ************************************************************              
       0600-PROCESS-LMWW-ASSETS.                                                
                                                                                
      * POSITION RECORD GET CUSIP FROM MSD FILE                                 
                                                                                
           PERFORM 0650-GET-MSD THRU                                            
                   0650-GET-MSD-EXIT.                                           
                                                                                
           IF MSD-RECORD-FOUND                                                  
             PERFORM 0700-GET-REG-OPT THRU                                      
                     0700-GET-REG-OPT-EXIT                                      
           ELSE                                                                 
             ADD 1 TO WS-POS-TYPE-NON-LEGG                                      
           END-IF.                                                              
       0600-PROCESS-LMWW-ASSETS-EXIT.  EXIT.                                    
                                                                                
       0650-GET-MSD.                                                            
      ************************************************************              
      * GET MSD                                                                 
      ************************************************************              
           MOVE PEND-ADP-SECURITY    TO GETMSD-SEARCH-KEY-SEC                   
           SET GETMSD-DEVICE-DISK    TO TRUE                                    
           SET GETMSD-ACCESS-RANDOM  TO TRUE                                    
           SET GETMSD-FORMAT-NEW     TO TRUE                                    
DJ0002     MOVE PEND-ADP-CL-NO       TO GETMSD-CLIENT-PL2                       
           CALL  GETMSDC  USING MASTER-SECURITY-RECORD                          
           EVALUATE TRUE                                                        
              WHEN GETMSD-RETURN-IO-ERROR                                       
                  DISPLAY 'ERROR ACCESSING MSD FILE'                            
                  MOVE +4040 TO ABORT-CODE                                      
                  PERFORM ABEND-RTN                                             
              WHEN GETMSD-RETURN-REC-NOT-FOUND                                  
                  SET MSD-RECORD-NOT-FOUND TO TRUE                              
              WHEN GETMSD-RETURN-VALID                                          
                  SET MSD-RECORD-FOUND TO TRUE                                  
              WHEN OTHER                                                        
                  SET MSD-RECORD-NOT-FOUND TO TRUE                              
           END-EVALUATE.                                                        
                                                                                
       0650-GET-MSD-EXIT.  EXIT.                                                
                                                                                
       0700-GET-REG-OPT.                                                        
                                                                                
           MOVE 'N'             TO  ACAT-EXCLUDE-SW.                            
           MOVE CAK-CLIENT      TO  CLIENT-NO.                                  
           MOVE SPACES          TO  CUSIP-15.                                   
           MOVE MS-CUSIP-NO     TO  CUSIP-9.                                    
                                                                                
           READ REG-OPT-FILE.                                                   
           IF REG-FILE-INVALID-KEY                                              
             MOVE 'O'  TO  FUND-PROCESS-CODE                                    
             ADD 1                TO  WS-POS-TYPE-NON-LEGG                      
             GO TO 0700-GET-REG-OPT-EXIT.                                       
           IF REG-FILE-STATUS = '00'                                            
             CONTINUE                                                           
           ELSE                                                                 
             DISPLAY 'ERROR READING REGISTRATION OPTION FILE '                  
              'FILE STATUS = ' REG-FILE-STATUS                                  
              MOVE +4050 TO ABORT-CODE                                          
              PERFORM ABEND-RTN.                                                
                                                                                
           IF PROCESSING-CODE = 'L'                                             
             ADD 1                TO  WS-POS-TYPE-LEGG                          
             MOVE 'L'             TO  FUND-PROCESS-CODE                         
           ELSE                                                                 
             ADD 1                TO  WS-POS-TYPE-NON-LEGG                      
             MOVE 'O'             TO  FUND-PROCESS-CODE                         
           END-IF.                                                              
                                                                                
       0700-GET-REG-OPT-EXIT.  EXIT.                                            
                                                                                
           EJECT                                                                
       0800-CREATE-TYPE3-BALANCE-RTN.                                           
    *** BOOK THE TYPE3 CASH TO TYPE 1. FLIP SIGN AND BOOK TO TYPE 3.            
    *** ONLY PUT TRAILER ON TYPE 1.                                             
    *** NO NEED TO ADJUST  SINCE THIS IS ADDED BU CAT820                        
           IF PEND-TYPE3-BALANCE = ZEROS                                        
TEST***       DISPLAY 'SKIP TYPE3 BALANCE ZEROS '  CAK-BRAC                     
TEST***         ' '  PEND-CONTROL-NBR                                           
              GO TO 0800-EXIT.                                                  
                                                                                
           IF B1-WRK-TYPE3-BALANCES  NOT = '1'                                  
TEST***       DISPLAY 'SKIP TYPE3 B1 OFF ' CAK-BRAC                             
TEST***         ' '  PEND-CONTROL-NBR                                           
              GO TO 0800-EXIT.                                                  
                                                                                
           IF B1-WRK-TYPE3-BATCH-CODE NOT > SPACES                              
           OR B1-WRK-TYPE3-ENTRY-CODE NOT > SPACES                              
              DISPLAY 'B1 434646 NG / MISSING BATCH OR ENTRY CODES'             
              DISPLAY 'VALUES ARE '                                             
                           B1-WRK-TYPE3-BATCH-CODE                              
                           B1-WRK-TYPE3-ENTRY-CODE                              
              DISPLAY 'TYPE 3 MOVEMENT BYPASSED FOR CLIENT ' CAK-CLIENT         
              GO TO 0800-EXIT.                                                  
                                                                                
                                                                                
           MOVE SPACES          TO  P2-BK-QUANTITY-X                            
                                    P2-BK-QUANTITY-SW                           
                                    P2-BK-SECURITY-NBR                          
                                    P2-BK-FRACTION-X.                           
           MOVE CAK-CLIENT      TO  P2-BK-BROKER-NBR.                           
           MOVE CAK-BRANCH      TO  P2-BK-BRANCH.                               
           MOVE CAK-ACCOUNT     TO  P2-BK-ACCOUNT.                              
           MOVE '1'             TO  P2-BK-TYPE.                                 
           MOVE 'X'             TO  P2-BK-CHECK-DIGIT.                          
           MOVE B1-WRK-TYPE3-BATCH-CODE                                         
                                TO  P2-BK-BATCH-CODE.                           
           MOVE B1-WRK-TYPE3-ENTRY-CODE                                         
                                TO  P2-BK-ENTRY-CODE.                           
                                                                                
           MOVE PEND-TYPE3-BALANCE TO P2-BK-AMOUNT.                             
TEST***    DISPLAY 'TYPE 3 BAL ' CAK-CLIENT                                     
TEST***                      ' ' CAK-BRANCH                                     
TEST***                          CAK-ACCOUNT                                    
TEST***                      ' ' PEND-TYPE3-BALANCE.                            
           IF PEND-TYPE3-BALANCE > ZEROS                                        
              MOVE P2-DEBIT-SIGN   TO  P2-BK-BUY-SELL-CODE                      
           ELSE                                                                 
              MOVE P2-CREDIT-SIGN  TO  P2-BK-BUY-SELL-CODE                      
           END-IF.                                                              
                                                                                
LRM001**   IF P2-XFER                                                           
********     MOVE XFER-FEE-REG          TO  P2-BK-AMOUNT                        
********     MOVE 'TRANSFER TYPE 3-1'   TO  XFE-MSG                             
********   END-IF.                                                              
                                                                                
           MOVE B1-WRK-TYPE3-DESCRIPTION TO P2-BK-DESCRIPTION.                  
                                                                                
           MOVE P2-BK-RECORD    TO  P2-OUTREC.                                  
LRM****    PERFORM 1600-WRITE-P2BKPG-REC THRU                                   
LRM****            1600-WRITE-P2BKPG-REC-EXIT.                                  
                                                                                
   ********    GWS START                                                        
                                                                                
           INITIALIZE RT-P2-REC.                                                
           MOVE 1                       TO S1.                                  
                                                                                
           MOVE CAK-CLIENT              TO RT-P2-CLIENT.                        
           MOVE CAK-BRANCH              TO RT-P2-BRANCH.                        
           MOVE CAK-ACCOUNT             TO RT-P2-ACCOUNT.                       
           MOVE PEND-CONTROL-NBR        TO RT-P2-CONTROL.                       
LRM007     MOVE SPACES                  TO RT-P2-ADP-NBR                        
LRM007                                     RT-P2-ACCOUNT-TYPE.                  
           MOVE 'B'                     TO RT-P2-TYPE.                          
           MOVE P2-OUTREC               TO RT-P2-DATA (S1).                     
                                                                                
           IF B1-WRK-TYPE3-TRAILER > SPACES                                     
              MOVE SPACES TO P2-BK-TRAILER-RECORD                               
              MOVE P2-BK-RECORD (1 : 7) TO  P2-BK-TRAILER-RECORD(1 : 7)         
              MOVE P2-BK-BR-ACCT-T-C    TO  P2-BK-TRAILER-BR-ACCT-T-C           
              MOVE '-' TO  P2-BK-IPHEN                                          
              MOVE B1-WRK-TYPE3-TRAILER     TO P2-BK-RES-DESCRIPTION            
              MOVE P2-BK-TRAILER-RECORD  TO  P2-OUTREC                          
LRM****       PERFORM 1600-WRITE-P2BKPG-REC THRU                                
LRM****            1600-WRITE-P2BKPG-REC-EXIT                                   
              ADD  1                     TO S1                                  
              MOVE P2-OUTREC             TO RT-P2-DATA (S1).                    
                                                                                
           MOVE S1                    TO RT-P2-SUB.                             
                                                                                
           WRITE RET-P2-REC           FROM RT-P2-REC.                           
                                                                                
      * NOW WRITE OPPOSITE P2 RECORD FOR TYPE 3                                 
                                                                                
           IF PEND-TYPE3-BALANCE > ZEROS                                        
              MOVE P2-CREDIT-SIGN   TO  P2-BK-BUY-SELL-CODE                     
           ELSE                                                                 
              MOVE P2-DEBIT-SIGN    TO  P2-BK-BUY-SELL-CODE                     
           END-IF.                                                              
                                                                                
           MOVE '3'             TO  P2-BK-TYPE.                                 
           MOVE P2-BK-RECORD    TO  P2-OUTREC.                                  
LRM****    PERFORM 1600-WRITE-P2BKPG-REC THRU                                   
LRM****            1600-WRITE-P2BKPG-REC-EXIT.                                  
                                                                                
           INITIALIZE RT-P2-REC.                                                
           MOVE 1                       TO S1.                                  
                                                                                
           MOVE CAK-CLIENT              TO RT-P2-CLIENT.                        
           MOVE CAK-BRANCH              TO RT-P2-BRANCH.                        
           MOVE CAK-ACCOUNT             TO RT-P2-ACCOUNT.                       
           MOVE PEND-CONTROL-NBR        TO RT-P2-CONTROL.                       
LRM007     MOVE SPACES                  TO RT-P2-ADP-NBR                        
LRM007                                     RT-P2-ACCOUNT-TYPE.                  
           MOVE 'B'                     TO RT-P2-TYPE.                          
           MOVE P2-OUTREC               TO RT-P2-DATA (S1).                     
                                                                                
           MOVE S1                      TO RT-P2-SUB.                           
                                                                                
           WRITE RET-P2-REC             FROM RT-P2-REC.                         
                                                                                
       0800-EXIT. EXIT.                                                         
                                                                                
       0820-CREATE-PEND-DVND-BAL-RTN.                                           
    *** BOOK THE PENDING DIVIDEND AMOUNT INTO TYPE 1.  THIS IS THE              
    *** DEBIT WHICH WAS INCLUDED IN THE ACAT DELIVERY TYPE1 BALANCE,            
    *** AND THE CREDITS WILL BE GENERATED INTO TYPE8 IN PARA 0830-.             
    *** (JOURNAL TYPE1 INTO TYPE8).                                             
                                                                                
           IF B1-WRK-TYPE3-BATCH-CODE NOT > SPACES                              
           OR B1-WRK-TYPE3-ENTRY-CODE NOT > SPACES                              
              DISPLAY 'B1 434646 NG / MISSING BATCH OR ENTRY CODES'             
              DISPLAY 'VALUES ARE '                                             
                           B1-WRK-TYPE3-BATCH-CODE                              
                           B1-WRK-TYPE3-ENTRY-CODE                              
              DISPLAY 'TYPE 8 MOVEMENT BYPASSED FOR CLIENT ' CAK-CLIENT         
              GO TO 0820-EXIT.                                                  
                                                                                
                                                                                
           MOVE SPACES          TO  P2-BK-QUANTITY-X                            
                                    P2-BK-QUANTITY-SW                           
                                    P2-BK-SECURITY-NBR                          
                                    P2-BK-FRACTION-X.                           
           MOVE CAK-CLIENT      TO  P2-BK-BROKER-NBR.                           
           MOVE CAK-BRANCH      TO  P2-BK-BRANCH.                               
           MOVE CAK-ACCOUNT     TO  P2-BK-ACCOUNT.                              
           MOVE '1'             TO  P2-BK-TYPE.                                 
           MOVE 'X'             TO  P2-BK-CHECK-DIGIT.                          
           MOVE B1-WRK-TYPE3-BATCH-CODE                                         
                                TO  P2-BK-BATCH-CODE.                           
           MOVE B1-WRK-TYPE3-ENTRY-CODE                                         
                                TO  P2-BK-ENTRY-CODE.                           
                                                                                
           MOVE TFRS-PEND-DVDND-DB-AMT TO P2-BK-AMOUNT.                         
           IF TFRS-PEND-DVDND-DB-AMT > ZEROS                                    
              MOVE P2-DEBIT-SIGN   TO  P2-BK-BUY-SELL-CODE                      
           ELSE                                                                 
              MOVE P2-CREDIT-SIGN  TO  P2-BK-BUY-SELL-CODE                      
           END-IF.                                                              
                                                                                
           MOVE 'PENDING DIVIDEND WITHHELD' TO P2-BK-DESCRIPTION.               
                                                                                
           MOVE P2-BK-RECORD    TO  P2-OUTREC.                                  
                                                                                
   ********    GWS START                                                        
                                                                                
           INITIALIZE RT-P2-REC.                                                
           MOVE 1                       TO S1.                                  
                                                                                
           MOVE CAK-CLIENT              TO RT-P2-CLIENT.                        
           MOVE CAK-BRANCH              TO RT-P2-BRANCH.                        
           MOVE CAK-ACCOUNT             TO RT-P2-ACCOUNT.                       
           MOVE PEND-CONTROL-NBR        TO RT-P2-CONTROL.                       
           MOVE SPACES                  TO RT-P2-ADP-NBR                        
                                           RT-P2-ACCOUNT-TYPE.                  
           MOVE 'B'                     TO RT-P2-TYPE.                          
           MOVE P2-OUTREC               TO RT-P2-DATA (S1).                     
                                                                                
                                                                                
           MOVE S1                    TO RT-P2-SUB.                             
                                                                                
           WRITE RET-P2-REC           FROM RT-P2-REC.                           
                                                                                
       0820-EXIT. EXIT.                                                         
           EJECT                                                                
LRM008 0840-CREATE-PEND-DVND-ADJ-RTN.                                           
    *** BOOK THE PENDING DIVIDEND AMOUNT INTO TYPE 8 AS A CREDIT.               
    *** THESE ARE CREATED AT THE SECURITY LEVEL AND SHOULD NET OUT              
    *** TFRS-PEND-DVDND-DB-AMT (AT THE TRANSFER LEVEL).                         
                                                                                
           IF B1-WRK-TYPE3-BATCH-CODE NOT > SPACES                              
           OR B1-WRK-TYPE3-ENTRY-CODE NOT > SPACES                              
              DISPLAY 'B1 434646 NG / MISSING BATCH OR ENTRY CODES'             
              DISPLAY 'VALUES ARE '                                             
                           B1-WRK-TYPE3-BATCH-CODE                              
                           B1-WRK-TYPE3-ENTRY-CODE                              
              DISPLAY 'TYPE 8 MOVEMENT BYPASSED FOR CLIENT ' CAK-CLIENT         
              GO TO 0840-EXIT.                                                  
                                                                                
           MOVE SPACES          TO  P2-BK-QUANTITY-X                            
                                    P2-BK-QUANTITY-SW                           
                                    P2-BK-FRACTION-X.                           
           MOVE CAK-CLIENT      TO  P2-BK-BROKER-NBR.                           
           MOVE CAK-BRANCH      TO  P2-BK-BRANCH.                               
           MOVE CAK-ACCOUNT     TO  P2-BK-ACCOUNT.                              
           MOVE '8'             TO  P2-BK-TYPE.                                 
           MOVE 'X'             TO  P2-BK-CHECK-DIGIT.                          
           MOVE B1-WRK-TYPE3-BATCH-CODE                                         
                                TO  P2-BK-BATCH-CODE.                           
           MOVE B1-WRK-TYPE3-ENTRY-CODE                                         
                                TO  P2-BK-ENTRY-CODE.                           
           MOVE PEND-ADP-SECURITY TO P2-BK-SECURITY-NBR                         
                                                                                
           MOVE PEND-ASSET-DVDND-AMT TO P2-BK-AMOUNT.                           
           MOVE P2-CREDIT-SIGN  TO  P2-BK-BUY-SELL-CODE                         
                                                                                
           MOVE 'PENDING DIVIDEND WITHHELD' TO P2-BK-DESCRIPTION.               
                                                                                
           MOVE P2-BK-RECORD    TO  P2-OUTREC.                                  
                                                                                
   ********    GWS START                                                        
                                                                                
           INITIALIZE RT-P2-REC.                                                
           MOVE 1                       TO S1.                                  
                                                                                
           MOVE CAK-CLIENT              TO RT-P2-CLIENT.                        
           MOVE CAK-BRANCH              TO RT-P2-BRANCH.                        
           MOVE CAK-ACCOUNT             TO RT-P2-ACCOUNT.                       
           MOVE PEND-CONTROL-NBR        TO RT-P2-CONTROL.                       
           MOVE PEND-ADP-SECURITY       TO RT-P2-ADP-NBR                        
           MOVE '8'                     TO RT-P2-ACCOUNT-TYPE.                  
           MOVE 'B'                     TO RT-P2-TYPE.                          
           MOVE P2-OUTREC               TO RT-P2-DATA (S1).                     
                                                                                
    *** BUILD TRAILERS WITH SECURITY DESCIPTION AND DIV REC/PAY DATES           
           IF PEND-ADP-SECURITY > SPACES                                        
            PERFORM 0650-GET-MSD THRU                                           
                    0650-GET-MSD-EXIT                                           
             IF MSD-RECORD-FOUND                                                
               MOVE SPACES TO P2-BK-TRAILER-RECORD                              
               MOVE P2-BK-RECORD (1 : 7) TO  P2-BK-TRAILER-RECORD(1 : 7)        
               MOVE P2-BK-BR-ACCT-T-C    TO  P2-BK-TRAILER-BR-ACCT-T-C          
               MOVE '-' TO  P2-BK-IPHEN                                         
               MOVE MS-DESC1             TO  P2-BK-RES-DESCRIPTION              
               MOVE P2-BK-TRAILER-RECORD  TO  P2-OUTREC                         
               ADD  1                     TO S1                                 
               MOVE P2-OUTREC             TO RT-P2-DATA (S1)                    
               IF NOT MS-DESC-SEGMENT-ABSENT                                    
                  MOVE MS-DESC2          TO  P2-BK-RES-DESCRIPTION              
                  ADD  1                     TO S1                              
                  MOVE P2-OUTREC             TO RT-P2-DATA (S1)                 
           END-IF.                                                              
                                                                                
           MOVE SPACES TO P2-BK-TRAILER-RECORD                                  
           MOVE P2-BK-RECORD (1 : 7) TO  P2-BK-TRAILER-RECORD(1 : 7)            
           MOVE P2-BK-BR-ACCT-T-C    TO  P2-BK-TRAILER-BR-ACCT-T-C              
           MOVE '-' TO  P2-BK-IPHEN                                             
           MOVE 'REC '      TO P2-BK-RES-DESCRIPTION                            
           MOVE PEND-ASSET-DESC(16:2) TO P2-BK-RES-DESCRIPTION(5:2)             
           MOVE '/'                   TO P2-BK-RES-DESCRIPTION(7:1)             
           MOVE PEND-ASSET-DESC(18:2) TO P2-BK-RES-DESCRIPTION(8:2)             
           MOVE '/'                   TO P2-BK-RES-DESCRIPTION(10:1)            
           MOVE PEND-ASSET-DESC(14:2) TO P2-BK-RES-DESCRIPTION(11:2)            
                                                                                
           MOVE ' PAY '               TO P2-BK-RES-DESCRIPTION(13:5)            
           MOVE PEND-ASSET-DESC(23:2) TO P2-BK-RES-DESCRIPTION(21:2)            
           MOVE '/'                   TO P2-BK-RES-DESCRIPTION(22:1)            
           MOVE PEND-ASSET-DESC(25:2) TO P2-BK-RES-DESCRIPTION(24:2)            
           MOVE '/'                   TO P2-BK-RES-DESCRIPTION(25:1)            
           MOVE PEND-ASSET-DESC(21:2) TO P2-BK-RES-DESCRIPTION(26:2)            
           MOVE P2-BK-TRAILER-RECORD  TO  P2-OUTREC                             
           ADD  1                     TO S1                                     
           MOVE P2-OUTREC             TO RT-P2-DATA (S1).                       
                                                                                
           MOVE S1                    TO RT-P2-SUB.                             
                                                                                
           WRITE RET-P2-REC           FROM RT-P2-REC.                           
                                                                                
       0840-EXIT. EXIT.                                                         
           EJECT                                                                
LRM009 0850-CREATE-POSN-TYPE1-T4-RTN.                                           
    *** BOOK THE TYPE1 DEBIT AND TYPE 4 CREDIT.                                 
LRM009                                                                          
LRM009     MOVE PEND-QTY        TO  P2-BK-QUANTITY                              
LRM009                              P2-BK-FRACTION                              
LRM009     MOVE ZERO            TO  P2-BK-AMOUNT.                               
LRM009     MOVE CAK-CLIENT      TO  P2-BK-BROKER-NBR.                           
LRM009     MOVE CAK-BRANCH      TO  P2-BK-BRANCH.                               
LRM009     MOVE CAK-ACCOUNT     TO  P2-BK-ACCOUNT.                              
LRM009     MOVE '1'             TO  P2-BK-TYPE.                                 
LRM009     MOVE 'X'             TO  P2-BK-CHECK-DIGIT.                          
LRM009     MOVE B1-WRK-TYPE3-BATCH-CODE                                         
LRM009                          TO  P2-BK-BATCH-CODE.                           
LRM009     MOVE B1-WRK-TYPE3-ENTRY-CODE                                         
LRM009                          TO  P2-BK-ENTRY-CODE.                           
LRM009     MOVE PEND-ADP-SECURITY TO P2-BK-SECURITY-NBR                         
LRM009                                                                          
LRM009     MOVE P2-DEBIT-SIGN   TO  P2-BK-BUY-SELL-CODE                         
LRM009                                                                          
LRM009     MOVE 'TRANSFER FROM TYPE 1 TO 4' TO P2-BK-DESCRIPTION.               
LRM009                                                                          
LRM009     MOVE P2-BK-RECORD    TO  P2-OUTREC.                                  
LRM009                                                                          
    ******** GWS START                                                          
LRM009                                                                          
LRM009     INITIALIZE RT-P2-REC.                                                
LRM009     MOVE 1                       TO S1.                                  
LRM009                                                                          
LRM009     MOVE CAK-CLIENT              TO RT-P2-CLIENT.                        
LRM009     MOVE CAK-BRANCH              TO RT-P2-BRANCH.                        
LRM009     MOVE CAK-ACCOUNT             TO RT-P2-ACCOUNT.                       
LRM009     MOVE PEND-CONTROL-NBR        TO RT-P2-CONTROL.                       
LRM009     MOVE PEND-ADP-SECURITY       TO RT-P2-ADP-NBR                        
LRM009     MOVE '1'                     TO RT-P2-ACCOUNT-TYPE.                  
LRM009     MOVE 'B'                     TO RT-P2-TYPE.                          
LRM009     MOVE P2-OUTREC               TO RT-P2-DATA (S1).                     
LRM009                                                                          
LRM009     MOVE '4'             TO  P2-BK-TYPE.                                 
LRM009     MOVE P2-CREDIT-SIGN  TO  P2-BK-BUY-SELL-CODE                         
LRM009     MOVE P2-BK-RECORD    TO  P2-OUTREC.                                  
LRM009     ADD  1                     TO S1                                     
LRM009     MOVE P2-OUTREC             TO RT-P2-DATA (S1).                       
LRM009                                                                          
LRM009     MOVE S1                    TO RT-P2-SUB.                             
LRM009                                                                          
LRM009     WRITE RET-P2-REC           FROM RT-P2-REC.                           
LRM009                                                                          
LRM009 0850-EXIT. EXIT.                                                         
                                                                                
           EJECT                                                                
       0900-LIQ-FRACTIONAL-QTY-RTN.                                             
      *** BASED ON FEED, THE FRACTIONAL QTY COMES IN WHEN THIS WAS NOT          
      *** SENT TO NSCC BASED ON B1(S), ETC.  MOVE THE FRAC QTY TO THE           
      *** OFFSET(DISBURSMENT) ACCOUNT AND BOOK THE OPPOSITE QTY TO THIS         
      *** ACCOUNT.  THE MARKET VALUE OF THIS IS BOOKED TO THIS ACCOUNT          
      *** AND THE OPPOSITE AMT BOOKED TO AN THE OFFSET ACCOUNT.                 
                                                                                
434537     IF B1-WRK-LIQUID-FRAC-SHARE-IND NOT = '1'                            
TEST  **      DISPLAY 'SKIP LIQ PROCESSING B1 OFF ' CAK-BRAC                    
TEST  **        ' '  PEND-CONTROL-NBR                                           
              GO TO 0900-EXIT.                                                  
                                                                                
LRM003*** FRACT LIQUIDATION (ADDING CREDIT $ AND CREATING FRAC BOOKING          
LRM003*** WILL NOT BE DONE INTRA DAY FOR FULL DELIVERIES AT THIS TIME.          
LRM003*** THIS PROCESS WILL BE DONE ON FIRST NIGHT OF REQUEST REFRESH           
LRM003     IF PARM-INTRA-DAY                                                    
LRM003     AND PEND-TRNFR-TYPE-CD = 'FUL'                                       
LRM003        GO TO 0900-EXIT.                                                  
                                                                                
           IF B1-WRK-LIQUID-FRAC-OFFS-BR NOT > SPACES                           
           OR B1-WRK-LIQUID-FRAC-OFFS-AC NOT > SPACES                           
              DISPLAY 'B1 434537 NG / MISSING OFFSET ACCOUNT '                  
                  B1-WRK-LIQUID-FRAC-OFFS-BR '-'                                
                  B1-WRK-LIQUID-FRAC-OFFS-AC                                    
              DISPLAY 'FRAC MOVEMENT BYPASSED FOR CLIENT ' CAK-CLIENT           
              GO TO 0900-EXIT.                                                  
                                                                                
******** BYPASS RECORDS WITH ZERO FRACTIONAL QTY.                               
           IF PEND-FRAC-QTY = ZERO                                              
              GO TO 0900-EXIT.                                                  
                                                                                
TEMP****   IF B1-WRK-LIQUID-FRAC-BATCH NOT > SPACES                             
      *    OR B1-WRK-LIQUID-FRAC-ENTRY NOT > SPACES                             
      *       MOVE 'RV' TO B1-WRK-LIQUID-FRAC-BATCH                             
      *       MOVE 'CIL' TO B1-WRK-LIQUID-FRAC-ENTRY                            
      *    END-IF.                                                              
                                                                                
           IF B1-WRK-LIQUID-FRAC-TRD-BK-IND = 'T'                               
              PERFORM 0950-CREATE-TACT-RECORD THRU 0950-EXIT                    
              GO TO 0900-EXIT.                                                  
                                                                                
           IF B1-WRK-LIQUID-FRAC-BATCH NOT > SPACES                             
           OR B1-WRK-LIQUID-FRAC-ENTRY NOT > SPACES                             
              DISPLAY 'B1 434537 NG / MISSING BATCH ENTRY CODES '               
                 B1-WRK-LIQUID-FRAC-BATCH                                       
                 B1-WRK-LIQUID-FRAC-ENTRY                                       
              DISPLAY 'FRAC MOVEMENT BYPASSED FOR CLIENT ' CAK-CLIENT           
              GO TO 0900-EXIT.                                                  
                                                                                
LRM****** AT THIS POINT, CAUSE UPDATES TO ASSET CASH AND BOOKING FOR            
LRM****** ALL FRACTIONAL QTY RECORDS READ.  THIS MAY CHANGE LATER...            
                                                                                
           MOVE CAK-CLIENT      TO  P2-BK-BROKER-NBR.                           
           MOVE CAK-BRANCH      TO  P2-BK-BRANCH.                               
           MOVE CAK-ACCOUNT     TO  P2-BK-ACCOUNT.                              
           IF PEND-CASH-MGN-IND = 'C'                                           
              MOVE '1'             TO  P2-BK-TYPE                               
           ELSE                                                                 
           IF PEND-CASH-MGN-IND = 'M'                                           
              MOVE '2'             TO  P2-BK-TYPE                               
           ELSE                                                                 
           IF PEND-CASH-MGN-IND = 'S'                                           
              MOVE '5'             TO  P2-BK-TYPE                               
           ELSE                                                                 
              DISPLAY 'MARGIN CASH TYPE NOT EXPECTED / RECORD BYPASSED'         
              DISPLAY PEND-DETAIL-RECORD                                        
              GO TO 0900-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE 'X'             TO  P2-BK-CHECK-DIGIT.                          
           IF PEND-LONG                                                         
              MOVE P2-CREDIT-SIGN   TO  P2-BK-BUY-SELL-CODE                     
           ELSE                                                                 
              MOVE P2-DEBIT-SIGN    TO  P2-BK-BUY-SELL-CODE                     
           END-IF.                                                              
                                                                                
           MOVE PEND-ADP-SECURITY   TO   P2-BK-SECURITY-NBR.                    
           MOVE ZEROS TO P2-BK-QUANTITY.                                        
           MOVE PEND-FRAC-MARKET-VALUE TO                                       
                                         P2-BK-AMOUNT.                          
           MOVE PEND-FRAC-QTY       TO   P2-BK-FRACTION.                        
           MOVE CAK-BRANCH          TO   P2-BK-DESCRIPTION.                     
           MOVE CAK-ACCOUNT         TO   P2-BK-DESCRIPTION(4 : 5).              
           MOVE PEND-ADP-SECURITY   TO   P2-BK-DESCRIPTION(11 : 7).             
                                                                                
           MOVE B1-WRK-LIQUID-FRAC-BATCH                                        
                                TO  P2-BK-BATCH-CODE.                           
           MOVE B1-WRK-LIQUID-FRAC-ENTRY                                        
                                TO  P2-BK-ENTRY-CODE.                           
           MOVE P2-BK-RECORD    TO  P2-OUTREC.                                  
                                                                                
           PERFORM 1600-WRITE-P2BKPG-REC THRU                                   
                   1600-WRITE-P2BKPG-REC-EXIT.                                  
                                                                                
           PERFORM 1700-WRITE-REPORT                                            
              THRU 1700-WRITE-REPORT-EXIT.                                      
                                                                                
           INITIALIZE RT-P2-REC.                                                
           MOVE 1                       TO S1.                                  
                                                                                
           MOVE CAK-CLIENT              TO RT-P2-CLIENT.                        
           MOVE CAK-BRANCH              TO RT-P2-BRANCH.                        
           MOVE CAK-ACCOUNT             TO RT-P2-ACCOUNT.                       
           MOVE PEND-CONTROL-NBR        TO RT-P2-CONTROL.                       
LRM007     MOVE SPACES                  TO RT-P2-ADP-NBR                        
LRM007                                     RT-P2-ACCOUNT-TYPE.                  
           MOVE 'B'                     TO RT-P2-TYPE.                          
           MOVE P2-OUTREC               TO RT-P2-DATA (S1).                     
           MOVE S1                      TO RT-P2-SUB.                           
                                                                                
LRM*****   WRITE RET-P2-REC             FROM RT-P2-REC.                         
                                                                                
LRM****** APPLY FRACTIONAL QTY MONEY CR/DB TO CORRESPONDING ACCT TYPE           
LRM003     IF B1-WK-LIQ-FRAC-SHARE-PTR = '0'                                    
LRM003     AND PEND-TRNFR-TYPE-CD = 'PTR'                                       
LRM003        DISPLAY 'BYPASS TIF/CASH ADJ FOR PTR'                             
LRM003     ELSE                                                                 
LRM003     IF B1-WK-LIQ-FRAC-SHARE-PTR = '1'                                    
LRM003     AND PEND-TRNFR-TYPE-CD = 'PTR'                                       
LRM003         DISPLAY 'BYPASS PTR FRACTIONAL MKT VALUE'                        
LRM003     ELSE                                                                 
           IF PEND-LONG                                                         
              IF PEND-CASH-MGN-IND = 'C'                                        
                 SUBTRACT PEND-FRAC-MARKET-VALUE FROM                           
                                        WS-CASH-ADJ-AMT-TYPE1                   
              ELSE                                                              
              IF PEND-CASH-MGN-IND = 'M'                                        
                 SUBTRACT PEND-FRAC-MARKET-VALUE FROM                           
                                        WS-CASH-ADJ-AMT-TYPE2                   
              ELSE                                                              
                 SUBTRACT PEND-FRAC-MARKET-VALUE FROM                           
                                        WS-CASH-ADJ-AMT-TYPE5                   
           ELSE                                                                 
              IF PEND-CASH-MGN-IND = 'C'                                        
                 ADD PEND-FRAC-MARKET-VALUE TO                                  
                                        WS-CASH-ADJ-AMT-TYPE1                   
              ELSE                                                              
              IF PEND-CASH-MGN-IND = 'M'                                        
                 ADD PEND-FRAC-MARKET-VALUE TO                                  
                                        WS-CASH-ADJ-AMT-TYPE2                   
              ELSE                                                              
                 ADD PEND-FRAC-MARKET-VALUE TO                                  
                                        WS-CASH-ADJ-AMT-TYPE5                   
           END-IF.                                                              
                                                                                
    **** CREATE FRAC QTY OFFSET.                                                
           MOVE CAK-CLIENT      TO  P2-BK-BROKER-NBR.                           
           MOVE B1-WRK-LIQUID-FRAC-OFFS-BR                                      
                                TO   P2-BK-BRANCH.                              
           MOVE B1-WRK-LIQUID-FRAC-OFFS-AC                                      
                                TO   P2-BK-ACCOUNT.                             
           IF B1-WRK-LIQUID-FRAC-OFFS-TY > SPACES                               
              MOVE B1-WRK-LIQUID-FRAC-OFFS-TY                                   
                                   TO  P2-BK-TYPE.                              
           IF PEND-LONG                                                         
              MOVE P2-DEBIT-SIGN    TO  P2-BK-BUY-SELL-CODE                     
           ELSE                                                                 
              MOVE P2-CREDIT-SIGN   TO  P2-BK-BUY-SELL-CODE                     
           END-IF.                                                              
                                                                                
           MOVE PEND-ADP-SECURITY   TO   P2-BK-SECURITY-NBR.                    
           MOVE ZEROS TO P2-BK-QUANTITY.                                        
           MOVE PEND-FRAC-QTY       TO   P2-BK-FRACTION.                        
           MOVE 'PEN LIQUID FRAC'   TO   P2-BK-DESCRIPTION.                     
                                                                                
           MOVE B1-WRK-LIQUID-FRAC-BATCH TO                                     
                   P2-BK-BATCH-CODE.                                            
           MOVE P2-BK-RECORD    TO  P2-OUTREC.                                  
           PERFORM 1600-WRITE-P2BKPG-REC THRU                                   
                   1600-WRITE-P2BKPG-REC-EXIT.                                  
                                                                                
   ********  GWS                                                                
                                                                                
           INITIALIZE RT-P2-REC.                                                
           MOVE 1                       TO S1.                                  
                                                                                
           MOVE CAK-CLIENT              TO RT-P2-CLIENT.                        
           MOVE CAK-BRANCH              TO RT-P2-BRANCH.                        
           MOVE CAK-ACCOUNT             TO RT-P2-ACCOUNT.                       
           MOVE PEND-CONTROL-NBR        TO RT-P2-CONTROL.                       
LRM007     MOVE SPACES                  TO RT-P2-ADP-NBR                        
LRM007                                     RT-P2-ACCOUNT-TYPE.                  
           MOVE 'B'                     TO RT-P2-TYPE.                          
           MOVE P2-OUTREC               TO RT-P2-DATA (S1).                     
           MOVE S1                      TO RT-P2-SUB.                           
                                                                                
LRM****    WRITE RET-P2-REC             FROM RT-P2-REC.                         
                                                                                
TEST  **   DISPLAY 'HAVE LIQ CASH ' CAK-BRAC ' ' PEND-FRAC-MARKET-VALUE.        
                                                                                
                                                                                
       0900-EXIT. EXIT.                                                         
                                                                                
       0950-CREATE-TACT-RECORD.                                                 
                                                                                
TEST  **   DISPLAY 'CREATING P2 TACT ' CAK-BRAC                                 
TEST  **        ' '  PEND-CONTROL-NBR                                           
TEST  **       ' FOR '  PEND-FRAC-MARKET-VALUE.                                 
                                                                                
           IF PEND-LONG                                                         
            SUBTRACT PEND-FRAC-MARKET-VALUE FROM WS-CASH-ADJ-AMT-TYPE1          
           ELSE                                                                 
            ADD      PEND-FRAC-MARKET-VALUE TO   WS-CASH-ADJ-AMT-TYPE1          
           END-IF                                                               
                                                                                
           MOVE 'D1' TO T2-D-SEG-ID.                                            
           MOVE 'CAT820 ' TO T2-D-SEG-FOOTPRINT.                                
           MOVE CAK-CLIENT       TO T2-CLIENT.                                  
           MOVE CAK-BRANCH       TO T2-BRANCH.                                  
           MOVE CAK-ACCOUNT      TO T2-ACCOUNT.                                 
           IF PEND-CASH-MGN-IND = 'C'                                           
              MOVE '1'             TO  T2-TYPE                                  
           ELSE                                                                 
           IF PEND-CASH-MGN-IND = 'M'                                           
              MOVE '2'             TO  T2-TYPE                                  
           ELSE                                                                 
           IF PEND-CASH-MGN-IND = 'S'                                           
              MOVE '5'             TO  T2-TYPE                                  
           ELSE                                                                 
              DISPLAY 'MARGIN CASH TYPE NOT EXPECTED / RECORD BYPASSED'         
              DISPLAY PEND-DETAIL-RECORD                                        
              GO TO 0950-EXIT                                                   
           END-IF.                                                              
           MOVE 'X' TO T2-CHECK-DIGIT.                                          
           MOVE 'P'    TO T2-TRID.                                              
LRM013     MOVE SPACES TO T2-SETTLE-DATE.                                       
           MOVE 'TRD'  TO T2-TRANSACTION-TYPE.                                  
           MOVE ' S'   TO T2-BUY-SELL-CODE.                                     
           MOVE ' '    TO T2-MULTI-PURPOSE-SPIN.                                
           MOVE B1-WRK-LIQUID-FRAC-BLOTTER TO T2-BLOTTER-CODE.                  
           MOVE PEND-FRAC-QTY           TO  T2-QUANTITY.                        
  ***** THE PEND-MARKET-VALUE IS ACTUALLY THE NET AMOUNT.                       
           COMPUTE T2-DOLLAR-PRICE =                                            
                PEND-FRAC-MARKET-VALUE / T2-QUANTITY                            
              ON SIZE ERROR                                                     
                MOVE ZEROS TO T2-DOLLAR-PRICE                                   
           END-COMPUTE.                                                         
           MOVE PEND-FRAC-MARKET-VALUE  TO  T2-NET-AMOUNT                       
                                            T2-PRINCIPAL-AMOUNT.                
           MOVE 'D' TO T2-INPUT-PRICE-CODE.                                     
           MOVE 'C' TO T2-DOLLAR-PRICE-FORMAT.                                  
           MOVE PEND-ADP-SECURITY              TO T2-SECURITY-NO                
                                           T2-INPUT-SECURITY-ID-NO.             
           MOVE 'A' TO T2-INPUT-SECURITY-ID-CODE.                               
           MOVE 'N1' TO T2-N-SEG-ID.                                            
           MOVE 'CAT820' TO T2-N-SEG-FOOTPRINT.                                 
           MOVE 1 TO T2-DESCRIP-SUB-SEG-COUNT2.                                 
           MOVE 'C' TO T2-DESCRIP-CATEGORY(1).                                  
           MOVE 'LIQ FRACT QTY' TO T2-DESCRIP-LINE(1).                          
           MOVE CAK-BRANCH      TO T2-DESCRIP-LINE(1)(15 : 3).                  
           MOVE '-'             TO T2-DESCRIP-LINE(1)(18 : 1).                  
           MOVE CAK-ACCOUNT     TO T2-DESCRIP-LINE(1)(19 : 5).                  
                                                                                
           MOVE 'R1' TO T2-R-SEG-ID.                                            
           MOVE  400 TO T2-R-SEG-LEN.                                           
           MOVE  1   TO T2-DESCRIP-SUB-SEG-COUNT.                               
           MOVE 'CAT820' TO T2-R-SEG-FOOTPRINT.                                 
                                                                                
           MOVE 'CAT820'         TO    TACTIO-CALLING-PGM-NAME.                 
DJ0001     MOVE WS-CYCLE-DATA(7:2) TO TACTIO-CALLING-PGM-NAME(7:2)              
           MOVE WS-TACT-DDNAME   TO    TACTIO-DDNAME.                           
           MOVE 'O'              TO    TACTIO-FILE-TYPE.                        
           MOVE 'Y'              TO    TACTIO-OUTPUT-TRUNCATION.                
           MOVE 'W'              TO    TACTIO-FUNCTION-CODE.                    
           SET TACTIO-VAR TO TRUE.                                              
           CALL ZTACTIO          USING TACTIO-PARAMETERS                        
                                       TACT-RECORD.                             
                                                                                
      ******  GWS START                                                         
                                                                                
           MOVE CAK-CLIENT             TO RT-TACT-CLIENT.                       
           MOVE CAK-BRANCH             TO RT-TACT-BRANCH.                       
           MOVE CAK-ACCOUNT            TO RT-TACT-ACCOUNT.                      
           MOVE PEND-CONTROL-NBR       TO RT-TACT-CONTROL.                      
           MOVE 'T'                    TO RT-TACT-TYPE.                         
           MOVE TACT-RECORD            TO RT-TACT-DATA.                         
LRM****    WRITE RET-TACT-REC          FROM RT-TACT-REC.                        
                                                                                
           PERFORM 1700-WRITE-REPORT                                            
              THRU 1700-WRITE-REPORT-EXIT.                                      
                                                                                
      ******  GWS END                                                           
                                                                                
       0950-EXIT.  EXIT.                                                        
                                                                                
           EJECT                                                                
       1100-REGULAR-XFER-FEE-RTN.                                               
      *** DETERMINE IF BRANCH FOR THIS ACCOUNT IS IN XFER FEE TABLE             
      *** IF SO USE FEE FROM TABLE IN PLACE OF CLIENT LEVEL FEE                 
      * CARD 451142 OVERRIDES 501306 IF BRANCH IS WITHIN TBL RANGE              
                                                                                
           MOVE  'N'  TO  B1-RANGE-SEARCH-STATUS.                               
           MOVE  ' '  TO  B1-RANGE-SEARCH-SWITCH.                               
           MOVE  1    TO  B6-SUB.                                               
TEST***    DISPLAY '  '                                                         
TEST***    DISPLAY 'REG FEE B1 RANGES ' B1-WRK-XFER-RANGE-NO                    
TEST***    DISPLAY B1-WRK-XFER-RANGE-ENTRS(1)                                   
TEST***    DISPLAY B1-WRK-XFER-RANGE-ENTRS(2)                                   
           PERFORM UNTIL B1-RANGE-SEARCH-END                                    
                                                                                
434577       IF B6-SUB > B1-WRK-XFER-RANGE-NO                                   
               MOVE 'N'  TO  B1-RANGE-SEARCH-STATUS                             
               MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                             
             END-IF                                                             
             IF  CAK-BRAC >= B1-WRK-XFER-BRAC-LOW (B6-SUB)                      
             AND CAK-BRAC <= B1-WRK-XFER-BRAC-HIGH (B6-SUB)                     
             AND B6-SUB NOT > B1-WRK-XFER-RANGE-NO                              
TEST  **       DISPLAY 'HIT ON REG FEE B1 LOOKUP ' CAK-BRAC                     
TEST  **        ' '  PEND-CONTROL-NBR                                           
TCK001**       DISPLAY  '   XFER FEE = ' B1-WRK-XFER-FEE(B6-SUB)                
TCK001**        ', XFER OFFSET = ' B1-WRK-XFER-OFFSET (B6-SUB)                  
                MOVE B1-WRK-XFER-FEE (B6-SUB) TO XFER-FEE-REG                   
                MOVE B1-WRK-XFER-OFFSET(B6-SUB) TO XFER-FEE-OFFSET              
                MOVE B1-WRK-XFER-BATCH(B6-SUB) TO XFER-FEE-REG-BATCH            
                MOVE B1-WRK-XFER-ENTRY(B6-SUB) TO XFER-FEE-REG-ENTRY            
                MOVE 'Y' TO B1-RANGE-SEARCH-STATUS                              
                MOVE 'Y' TO B1-RANGE-SEARCH-SWITCH                              
             END-IF                                                             
                                                                                
             ADD 1  TO  B6-SUB                                                  
           END-PERFORM.                                                         
                                                                                
LRM   *** SEARCH B1 434912 FIELDS                                               
           IF B1-RANGE-SEARCH-STATUS = 'N'                                      
           AND B1-WK-TRANSF-FEES-ADD-NO > ZERO                                  
              MOVE B1-WRK-ADP-CLIENT TO BH-BROKER-NUMBER-N                      
              MOVE '015'     TO BH-LOGICAL-RECORD-CODE                          
              MOVE '434910'  TO BH-B2-INFO-ID                                   
              CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                        
                                 BH-AT3-INFO                                    
              END-CALL                                                          
434910        IF BH-AT3-ACTIVE                                                  
                 MOVE  ' '  TO  B1-RANGE-SEARCH-SWITCH                          
                 MOVE 1 TO B6-SUB                                               
                 PERFORM UNTIL B1-RANGE-SEARCH-END                              
                   IF B6-SUB > BH-AT3-TRANSF-FEES-ADD-NO                        
                      MOVE 'N'  TO  B1-RANGE-SEARCH-STATUS                      
                      MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                      
                   END-IF                                                       
LRM011             IF B6-SUB < 201                                              
                   AND CAK-BRAC >= BH-AT3-TRANSF-FEES-ADD-LO (B6-SUB)           
                   AND CAK-BRAC <= BH-AT3-TRANSF-FEES-ADD-HI (B6-SUB)           
                   AND B6-SUB NOT > BH-AT3-TRANSF-FEES-ADD-NO                   
                      MOVE BH-AT3-TRANSF-FEES-ADD-AMT (B6-SUB)    TO            
                                                   XFER-FEE-REG                 
                      MOVE BH-AT3-TRANSF-FEES-ADD-OFFSET (B6-SUB) TO            
                                                   XFER-FEE-OFFSET              
                      MOVE BH-AT3-TRANSF-FEES-ADD-BATCH (B6-SUB)  TO            
                                                   XFER-FEE-REG-BATCH           
                      MOVE BH-AT3-TRANSF-FEES-ADD-ENTRY (B6-SUB)  TO            
                                                   XFER-FEE-REG-ENTRY           
                      MOVE 'Y' TO B1-RANGE-SEARCH-STATUS                        
                      MOVE 'Y' TO B1-RANGE-SEARCH-SWITCH                        
                   ELSE                                                         
LRM011             IF B6-SUB > 200                                              
LRM011                SUBTRACT 200 FROM B6-SUB GIVING B6-EXT                    
LRM011               IF  CAK-BRAC >= BH-AT3-TRANSF-FEES-ADD2-LO (B6-EXT)        
LRM011               AND CAK-BRAC <= BH-AT3-TRANSF-FEES-ADD2-HI (B6-EXT)        
LRM011               AND B6-EXT NOT > BH-AT3-TRANSF-FEES-ADD-NO                 
LRM011                  MOVE BH-AT3-TRANSF-FEES-ADD2-AMT (B6-EXT)    TO         
LRM011                                             XFER-FEE-REG                 
LRM011                  MOVE BH-AT3-TRANSF-FEES-ADD2-OFFSET (B6-EXT) TO         
LRM011                                             XFER-FEE-OFFSET              
LRM011                  MOVE BH-AT3-TRANSF-FEES-ADD2-BATCH (B6-EXT)  TO         
LRM011                                             XFER-FEE-REG-BATCH           
LRM011                  MOVE BH-AT3-TRANSF-FEES-ADD2-ENTRY (B6-EXT)  TO         
LRM011                                             XFER-FEE-REG-ENTRY           
LRM011                  MOVE 'Y' TO B1-RANGE-SEARCH-STATUS                      
LRM011                  MOVE 'Y' TO B1-RANGE-SEARCH-SWITCH                      
LRM011               END-IF                                                     
LRM011             END-IF                                                       
                   END-IF                                                       
                   ADD 1  TO  B6-SUB                                            
                 END-PERFORM                                                    
           END-IF.                                                              
                                                                                
       1100-REGULAR-XFER-FEE-RTN-EXIT.  EXIT.                                   
           EJECT                                                                
       1200-IRA-MAINT-FEE-RTN.                                                  
                                                                                
LRM002**** IF NON-ALTERNATE-IRA-ACCOUNT                                         
LRM002****   GO TO 1225-NO-MATCH-511233.                                        
                                                                                
           MOVE  'N'  TO  B1-RANGE-SEARCH-STATUS.                               
           MOVE  ' '  TO  B1-RANGE-SEARCH-SWITCH.                               
           MOVE  1    TO  B9-SUB.                                               
434902     PERFORM UNTIL B1-RANGE-SEARCH-END                                    
                                                                                
             IF B9-SUB > B1-WRK-XFER-IRA-MAINT-RANGE-NO                         
               MOVE 'N'  TO  B1-RANGE-SEARCH-STATUS                             
               MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                             
             END-IF                                                             
             IF  CAK-BRAC >= B1-WRK-XFER-IRA-MAINT-BRAC-LOW (B9-SUB)            
             AND CAK-BRAC <= B1-WRK-XFER-IRA-MAINT-BRAC-HI (B9-SUB)             
             AND B9-SUB NOT > B1-WRK-XFER-IRA-MAINT-RANGE-NO                    
             AND PROC-DATE >= B1-WRK-XFER-IRA-MAINT-FR-DATE (B9-SUB)            
             AND PROC-DATE <= B1-WRK-XFER-IRA-MAINT-TO-DATE (B9-SUB)            
               MOVE B1-WRK-XFER-IRA-MAINT-FEE (B9-SUB) TO MAINT-FEE-IRA         
               MOVE B1-WRK-XFER-IRA-MAINT-OFFSET (B9-SUB) TO                    
                                                   MAINT-FEE-IRA-OFFSET         
               MOVE B1-WRK-XFER-IRA-MAINT-BATCH (B9-SUB) TO                     
                                                   MAINT-FEE-BATCH              
               MOVE B1-WRK-XFER-IRA-MAINT-ENTRY (B9-SUB) TO                     
                                                   MAINT-FEE-ENTRY              
               MOVE 'Y'  TO  B1-RANGE-SEARCH-STATUS                             
               MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                             
TEST  **       DISPLAY 'HIT ON MAINT FEE 434902 ' CAK-BRAC                      
      **                ' OFF '                    MAINT-FEE-IRA-OFFSET         
      **                ' BATCH '                  MAINT-FEE-BATCH              
      **                ' ENTRY '                  MAINT-FEE-ENTRY              
             END-IF                                                             
                                                                                
             ADD 1  TO  B9-SUB                                                  
           END-PERFORM.                                                         
                                                                                
       1225-NO-MATCH-511233.                                                    
                                                                                
      * USE CARD 501307 WHEN NO MATCH VS 511233                                 
           MOVE B1-WRK-CLI-XFER-FEE-IRA  TO  XFER-FEE-IRA.                      
                                                                                
      *** DETERMINE IF BRANCH FOR THIS ACCOUNT IS IN IRA XFER FEE TABLE         
      *** IF SO USE FEE FROM TABLE IN PLACE OF CLIENT LEVEL IRA FEE             
      * CARD 451143 OVERRIDES 501307 IF BRANCH IS IN TABLE                      
                                                                                
           MOVE  'N'  TO  B1-RANGE-SEARCH-STATUS.                               
           MOVE  ' '  TO  B1-RANGE-SEARCH-SWITCH.                               
           MOVE  1    TO  B7-SUB.                                               
434903     PERFORM UNTIL B1-RANGE-SEARCH-END                                    
                                                                                
             IF B7-SUB > B1-WRK-ACCT-XFER-IRA-RANGE-NO                          
               MOVE 'N'  TO  B1-RANGE-SEARCH-STATUS                             
               MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                             
             END-IF                                                             
             IF  CAK-BRAC >= B1-WRK-ACCT-XFER-IRA-BRAC-LOW (B7-SUB)             
             AND CAK-BRAC <= B1-WRK-ACCT-XFER-IRA-BRAC-HIGH (B7-SUB)            
             AND  B7-SUB NOT > B1-WRK-ACCT-XFER-IRA-RANGE-NO                    
               MOVE B1-WRK-ACCT-XFER-IRA-FEE (B7-SUB) TO                        
                                     XFER-FEE-IRA                               
               MOVE B1-WRK-ACCT-XFER-IRA-OFFSET (B7-SUB) TO                     
                                     XFER-FEE-IRA-OFFSET                        
               MOVE B1-WRK-ACCT-XFER-BATCH (B7-SUB) TO                          
                                     XFER-FEE-IRA-BATCH                         
               MOVE B1-WRK-ACCT-XFER-ENTRY (B7-SUB) TO                          
                                     XFER-FEE-IRA-ENTRY                         
               MOVE 'Y'  TO  B1-RANGE-SEARCH-STATUS                             
               MOVE 'Y'  TO  B1-RANGE-SEARCH-SWITCH                             
TEST  **       DISPLAY 'HIT ON IRA FEE 434903 ' CAK-BRAC                        
             END-IF                                                             
                                                                                
             ADD 1  TO  B7-SUB                                                  
                                                                                
           END-PERFORM.                                                         
                                                                                
       1200-IRA-MAINT-FEE-RTN-EXIT. EXIT.                                       
           EJECT                                                                
LRM007 1300-LOOKUP-FRGN-FEE-RTN.                                                
LRM007*----------------------------------------------------------------*        
LRM007*  READ STOCK RECORD TO LOOK FOR MATCH OF B1 434913 STREETSIDE            
LRM007*  ACCOUNT FOR THIS SECURITY.                                             
LRM007*----------------------------------------------------------------*        
                                                                                
LRM007     MOVE PEND-ADP-CL-NO TO BH-BROKER-NUMBER-N                            
LRM007     MOVE '015'     TO BH-LOGICAL-RECORD-CODE                             
LRM007     MOVE '434910'  TO BH-B2-INFO-ID                                      
LRM007     CALL  GETB1V  USING BH-BROKER-HEADER-INFO,                           
LRM007                         BH-AT3-INFO                                      
LRM007     END-CALL                                                             
                                                                                
LRM007     IF NOT BH-AT3-ACTIVE                                                 
LRM007     OR BH-AT3-FOREIGN-FEE-NO = ZERO                                      
LRM007          GO TO 1300-LOOKUP-FRGN-FEE-EXIT                                 
LRM007     END-IF.                                                              
LRM007                                                                          
LRM010     IF LEGACY-ACCOUNT                                                    
LRM010         MOVE SPACES TO SR-OFFSET-ACCOUNT-FOUND-SW                        
LRM010         PERFORM VARYING B13-SUB FROM 1 BY 1                              
LRM010            UNTIL B13-SUB > BH-AT3-FOREIGN-FEE-NO                         
LRM010               OR SR-OFFSET-ACCOUNT-FOUND                                 
LRM010                  IF BH-AT3-FOREIGN-FEE-ACCT(B13-SUB)                     
LRM010                                   = '0AAAAAAA'                           
LRM010                     SET SR-OFFSET-ACCOUNT-FOUND TO TRUE                  
LRM010                     DISPLAY 'MATCHED BRAC TO B1 ON FRGN FEE '            
LRM010                         ' CLI = ' PEND-ADP-CL-NO                         
LRM010                         ' LEGACY ACCT= ' CAK-BRAC                        
LRM010                         ' SECURITY= ' PEND-ADP-SECURITY                  
LRM010                     PERFORM 1350-CREATE-FOREIGN-FEE-RTN                  
LRM010                        THRU 1350-CREATE-FOREIGN-FEE-EXIT                 
LRM010                     GO TO 1300-LOOKUP-FRGN-FEE-EXIT                      
LRM010                  END-IF                                                  
LRM010         END-PERFORM                                                      
LRM010     END-IF.                                                              
                                                                                
LRM007     MOVE LOW-VALUES TO WS-SR-PROC-KEY                                    
LRM007     MOVE PEND-ADP-CL-NO       TO WS-SR-PROC-CLIENT                       
LRM007     MOVE SPACES               TO WS-SR-PROC-CUSIP-1-2                    
LRM007     IF PEND-CUSIP-NUM > SPACES                                           
LRM007        MOVE PEND-CUSIP-NUM    TO WS-SR-PROC-CUSIP-3-11                   
LRM007********MOVE PEND-CUSIP-10-12  TO WS-SR-PROC-CUSIP-13-15                  
LRM007     ELSE                                                                 
LRM007        MOVE 'XX'              TO WS-SR-PROC-CUSIP-3-11(1:2)              
LRM007        MOVE PEND-ADP-SECURITY TO WS-SR-PROC-CUSIP-3-11(3:7)              
LRM007        MOVE '000'                TO WS-SR-PROC-CUSIP-13-15               
LRM007     END-IF.                                                              
LRM007     MOVE SPACES               TO WS-SR-PROC-CUSIP-12                     
LRM007     MOVE WS-SR-PROC-KEY       TO SR-WS-SEQ.                              
LRM007     SET GETMSR-ACCESS-START TO TRUE                                      
LRM007     PERFORM CALL-GET-SRMAS                                               
LRM007                                                                          
TEST       DISPLAY 'AFTER START GETMSR RC = ' GETMSR-RETURN-CODE                
TEST       DISPLAY 'SR-WS-KEY ' SR-WS-SEQ.                                      
LRM007     MOVE ZEROS TO WS-STOCK-REC-TD-QTY                                    
LRM007     MOVE SPACES TO SRMAS-BR-AC                                           
LRM007                    SR-OFFSET-ACCOUNT-FOUND-SW.                           
LRM007     PERFORM UNTIL SR-WS-SEQ(1:15) > WS-SR-PROC-KEY(1:15)                 
LRM007                OR SR-WS-SEQ = HIGH-VALUE                                 
LRM007                OR SR-OFFSET-ACCOUNT-FOUND                                
LRM007                OR GETMSR-RETURN-CODE NOT = SPACE                         
LRM007         SET GETMSR-ACCESS-NEXT TO TRUE                                   
LRM007         PERFORM CALL-GET-SRMAS                                           
LRM007         IF GETMSR-RETURN-CODE =  SPACE                                   
LRM007         AND SR-WS-SEQ(1:15) = WS-SR-PROC-KEY(1:15)                       
TEST************ DISPLAY 'READNEXT KEY RETURNED ' SR-WS-SEQ                     
LRM007           PERFORM VARYING B13-SUB FROM 1 BY 1                            
LRM007            UNTIL B13-SUB > BH-AT3-FOREIGN-FEE-NO                         
LRM007               OR SR-OFFSET-ACCOUNT-FOUND                                 
LRM007                  IF BH-AT3-FOREIGN-FEE-ACCT(B13-SUB)                     
LRM007                                   = SRMAS-BR-AC                          
LRM007                     SET SR-OFFSET-ACCOUNT-FOUND TO TRUE                  
LRM007                     DISPLAY 'MATCHED BRAC TO B1 ON FRGN FEE '            
LRM007                         SRMAS-BR-AC ' ' PEND-ADP-SECURITY                
LRM007                         ' '  BH-AT3-FOREIGN-FEE-AMT(B13-SUB)             
LRM007                     PERFORM 1350-CREATE-FOREIGN-FEE-RTN                  
LRM007                        THRU 1350-CREATE-FOREIGN-FEE-EXIT                 
LRM007                  END-IF                                                  
LRM007           END-PERFORM                                                    
LRM007         END-IF                                                           
LRM007     END-PERFORM.                                                         
                                                                                
LRM007 1300-LOOKUP-FRGN-FEE-EXIT. EXIT.                                         
                                                                                
LRM007 CALL-GET-SRMAS.                                                          
LRM007**** SEE BMG13M ***                                                       
LRM007     CALL ZMSRIO  USING  GETMSR-CALLING-INFO SR-WS-RECORD.                
TEST****** DISPLAY 'GETMSR RC = ' GETMSR-RETURN-CODE                            
LRM007                                                                          
LRM007     IF  GETMSR-EOF                                                       
LRM007         MOVE HIGH-VALUE   TO SRMAS-KEY                                   
LRM007     ELSE                                                                 
LRM007     IF  GETMSR-RETURN-CODE =  SPACE                                      
LRM007         MOVE SR-WS-CLIENT        TO SRMAS-CLIENT                         
LRM007         MOVE SR-WS-CUSIP-3-11    TO SRMAS-CUSIP-9                        
LRM007         MOVE SR-WS-CUSIP-13-15   TO SRMAS-CUSIP-3                        
LRM007         MOVE SR-WS-BRANCH(3:3)   TO SRMAS-BRANCH                         
LRM007         MOVE SR-WS-ACCOUNT-6-10  TO SRMAS-ACCT                           
LRM007         MOVE SR-WS-CURRENCY      TO SRMAS-CURR                           
LRM007         MOVE SR-WS-TYPE          TO SRMAS-TYPE                           
LRM007         MOVE SR-WS-CHECK-DIGIT   TO SRMAS-CHK                            
LRM007         IF SR-WS-TD-QTY NUMERIC                                          
LRM007            MOVE SR-WS-TD-QTY TO WS-STOCK-REC-TD-QTY                      
LRM007         END-IF                                                           
LRM007     ELSE                                                                 
LRM007     IF  GETMSR-RETURN-CODE = 'N'                                         
LRM007         CONTINUE                                                         
LRM007     ELSE                                                                 
LRM007         DISPLAY 'CAT820 - CALL MSRIO I/O ERROR'                          
LRM007                 ' RETURN CODE = '  GETMSR-RETURN-CODE                    
LRM007         MOVE  1300  TO  ABORT-CODE                                       
LRM007         GO TO  ABEND-RTN                                                 
LRM007     END-IF END-IF END-IF.                                                
LRM007                                                                          
LRM007 1350-CREATE-FOREIGN-FEE-RTN.                                             
LRM007     MOVE 'F'  TO  P2-PROCESS-TYPE                                        
LRM007     MOVE  BH-AT3-FOREIGN-FEE-AMT(B13-SUB) TO FRGN-FEE-AMT                
LRM007     ADD   BH-AT3-FOREIGN-FEE-AMT(B13-SUB) TO FRGN-FEE-TOTAL              
LRM001                              WS-CASH-ADJ-AMT-TYPE1                       
LRM007     IF BH-AT3-FOREIGN-FEE-BOOK-IND (B13-SUB) = '1'                       
LRM007        PERFORM 1400-P2-REC-RTN THRU                                      
LRM007                1400-P2-REC-RTN-EXIT                                      
LRM007     END-IF.                                                              
LRM007 1350-CREATE-FOREIGN-FEE-EXIT. EXIT.                                      
           EJECT                                                                
LRM014 1370-LOOKUP-PAPER-FEE.                                                   
LRM014     MOVE ZERO TO             PAPER-STMNT-FEE.                            
LRM014     MOVE ' '                        TO W-PAPERFEE-FND-SW.                
LRM014     MOVE LOW-VALUES                 TO PAPER-FEE-RECORD.                 
LRM014     MOVE '0'                        TO PAPER-FEE-CLIENT-NBR(1:1)         
LRM014     MOVE CAK-CLIENT                 TO PAPER-FEE-CLIENT-NBR(2:3)         
LRM014     MOVE CAK-BRANCH                 TO PAPER-FEE-BRANCH-CD.              
LRM014     MOVE CAK-ACCOUNT                TO PAPER-FEE-ACCT-CD.                
LRM014                                                                          
LRM014     START PAPERFEE KEY NOT < PAPER-FEE-DTL-KEY                           
LRM014                                                                          
LRM014     IF PAPERFEE-OKAY                                                     
LRM014        CONTINUE                                                          
LRM014     ELSE                                                                 
LRM014       IF PAPERFEE-END-OF-FILE                                            
LRM014       OR PAPERFEE-NOT-FOUND                                              
LRM014         DISPLAY 'PAPERFEE END-FILE  FOR'                                 
LRM014             ' '  CAK-CLIENT ' ' CAK-BRANCH '-' CAK-ACCOUNT               
LRM014          GO TO 1370-EXIT                                                 
LRM014       ELSE                                                               
LRM014          DISPLAY ' ** PAPERFEE FILE, START BROWSE ERROR'                 
LRM014                  ' FILE-STATUS = ' PAPERFEE-STAT                         
LRM014          DISPLAY 'PAPERFEE-KEY = ' PAPER-FEE-DTL-KEY                     
LRM014          MOVE +1370    TO ABORT-CODE                                     
LRM014          GO TO  ABEND-RTN                                                
LRM014       END-IF                                                             
LRM014     END-IF.                                                              
LRM014                                                                          
LRM014 1370-READ-NEXT.                                                          
LRM014     READ PAPERFEE NEXT RECORD.                                           
LRM014                                                                          
LRM014     IF PAPERFEE-OKAY                                                     
LRM014        CONTINUE                                                          
LRM014     ELSE                                                                 
LRM014       IF PAPERFEE-END-OF-FILE                                            
LRM014         DISPLAY 'PAPERFEE END-FILE  FOR'                                 
LRM014             ' '  CAK-CLIENT ' ' CAK-BRANCH '-' CAK-ACCOUNT               
LRM014          GO TO 1370-EXIT                                                 
LRM014       ELSE                                                               
LRM014          DISPLAY ' ** PAPERFEE FILE, READ NEXT ERROR'                    
LRM014                  ' FILE-STATUS = ' PAPERFEE-STAT                         
LRM014          DISPLAY 'PAPERFEE-KEY = ' PAPER-FEE-DTL-KEY                     
LRM014          MOVE +1371    TO ABORT-CODE                                     
LRM014          GO TO  ABEND-RTN                                                
LRM014       END-IF                                                             
LRM014     END-IF.                                                              
LRM014                                                                          
LRM014     IF CAK-CLIENT NOT =  PAPER-FEE-CLIENT-NBR(2:3)                       
LRM014     OR CAK-BRANCH  NOT = PAPER-FEE-BRANCH-CD                             
LRM014     OR CAK-ACCOUNT NOT = PAPER-FEE-ACCT-CD                               
LRM014         GO TO 1370-EXIT                                                  
LRM014     END-IF.                                                              
LRM014                                                                          
LRM014     ADD 1    TO W-PAPERFEE-FND-CNT                                       
LRM014     MOVE 'Y' TO W-PAPERFEE-FND-SW                                        
LRM014     IF PAPER-FEE-FEE-AMT > 0                                             
LRM014        DISPLAY 'PAPER FEE FOR ' CAK-BRANCH '-' CAK-ACCOUNT               
LRM014            ' '  PAPER-FEE-FEE-AMT                                        
LRM014        ADD PAPER-FEE-FEE-AMT TO PAPER-STMNT-FEE                          
LRM014                                 WS-CASH-ADJ-AMT-TYPE1                    
LRM014        MOVE PEND-CONTROL-NBR TO PAPER-FEE-ACAT-CNTL-NBR                  
LRM014        REWRITE PAPER-FEE-RECORD                                          
LRM014        IF PAPERFEE-OKAY                                                  
LRM014           CONTINUE                                                       
LRM014        ELSE                                                              
LRM014          DISPLAY ' ** PAPERFEE FILE, REWRITE ERROR'                      
LRM014                  ' FILE-STATUS = ' PAPERFEE-STAT                         
LRM014          DISPLAY 'PAPERFEE-KEY = ' PAPER-FEE-DTL-KEY                     
LRM014          MOVE +1372    TO ABORT-CODE                                     
LRM014          GO TO  ABEND-RTN                                                
LRM014        END-IF                                                            
LRM014     ELSE                                                                 
LRM014        DISPLAY 'PAPER FEE = 0 FOR ' CAK-BRANCH '-' CAK-ACCOUNT           
LRM014     END-IF.                                                              
LRM014     GO TO 1370-READ-NEXT.                                                
LRM014                                                                          
LRM014 1370-EXIT. EXIT.                                                         
           EJECT                                                                
       1400-P2-REC-RTN.                                                         
           MOVE SPACES          TO  P2-BK-QUANTITY-X                            
                                    P2-BK-QUANTITY-SW                           
                                    P2-BK-SECURITY-NBR                          
                                    P2-BK-FRACTION-X.                           
           MOVE CAK-CLIENT      TO  P2-BK-BROKER-NBR.                           
           MOVE CAK-BRANCH      TO  P2-BK-BRANCH.                               
           MOVE CAK-ACCOUNT     TO  P2-BK-ACCOUNT.                              
           MOVE '1'             TO  P2-BK-TYPE.                                 
           MOVE 'X'             TO  P2-BK-CHECK-DIGIT.                          
TCK001**** GET BATCH/ENTRY CODE FROM B1 - 434649 (WITHOUT ACCT RANGE)           
TCK001     MOVE B1-WRK-BTCH-ENTR-CODE (1:2)                                     
TCK001                          TO  P2-BK-BATCH-CODE.                           
TCK001     MOVE B1-WRK-BTCH-ENTR-CODE (3:3)                                     
TCK001                          TO  P2-BK-ENTRY-CODE.                           
           MOVE P2-DEBIT-SIGN   TO  P2-BK-BUY-SELL-CODE.                        
TEST****   DISPLAY 'BK REC BEFORE ' P2-BK-RECORD.                               
           IF P2-XFER                                                           
             MOVE XFER-FEE-REG          TO  P2-BK-AMOUNT                        
             MOVE 'TRANSFER FEE     $'  TO  XFE-MSG                             
             MOVE XFER-FEE-REG          TO  XFE-AMOUNT                          
             MOVE XFER-FEE-REG-BATCH    TO  P2-BK-BATCH-CODE                    
             MOVE XFER-FEE-REG-ENTRY    TO  P2-BK-ENTRY-CODE                    
           END-IF.                                                              
                                                                                
           IF P2-XFER-IRA                                                       
             MOVE XFER-FEE-IRA          TO  P2-BK-AMOUNT                        
             MOVE 'IRA TRANSFER FEE $'  TO  XFE-MSG                             
             MOVE XFER-FEE-IRA          TO  XFE-AMOUNT                          
             MOVE XFER-FEE-IRA-BATCH    TO  P2-BK-BATCH-CODE                    
             MOVE XFER-FEE-IRA-ENTRY    TO  P2-BK-ENTRY-CODE                    
           END-IF.                                                              
                                                                                
           IF P2-MAINT                                                          
             MOVE MAINT-FEE-IRA         TO  P2-BK-AMOUNT                        
             MOVE 'IRA MAINT FEE    $'  TO  XFE-MSG                             
             MOVE MAINT-FEE-IRA         TO  XFE-AMOUNT                          
             MOVE MAINT-FEE-BATCH       TO  P2-BK-BATCH-CODE                    
             MOVE MAINT-FEE-ENTRY       TO  P2-BK-ENTRY-CODE                    
           END-IF.                                                              
                                                                                
LRM007     IF P2-FOREIGN                                                        
LRM007       MOVE BH-AT3-FOREIGN-FEE-AMT(B13-SUB) TO P2-BK-AMOUNT               
LRM007       MOVE PEND-ADP-SECURITY            TO  P2-BK-SECURITY-NBR           
LRM007       MOVE 'FOREIGN DLVY FEE $'         TO  XFE-MSG                      
LRM007       MOVE BH-AT3-FOREIGN-FEE-AMT(B13-SUB) TO XFE-AMOUNT                 
LRM011       MOVE BH-AT3-FOREIGN-FEE-BATCH(B13-SUB)                             
LRM007                                            TO P2-BK-BATCH-CODE           
LRM007       MOVE BH-AT3-FOREIGN-FEE-ENTRY-CD(B13-SUB)                          
LRM007                                            TO P2-BK-ENTRY-CODE           
LRM007       PERFORM 1420-WRITE-FRGN-FEE-CASH-ADJ                               
LRM007     END-IF.                                                              
                                                                                
           MOVE XFER-FEE-DESCRIPTION    TO  P2-BK-DESCRIPTION.                  
                                                                                
TEST****   DISPLAY 'BK REC AFTER  ' P2-BK-RECORD.                               
           MOVE P2-BK-RECORD    TO  P2-OUTREC.                                  
LRM****    PERFORM 1600-WRITE-P2BKPG-REC THRU                                   
LRM****            1600-WRITE-P2BKPG-REC-EXIT.                                  
                                                                                
  *********   GWS START                                                         
                                                                                
           INITIALIZE RT-P2-REC.                                                
                                                                                
           MOVE 1 TO S1.                                                        
           MOVE CAK-CLIENT              TO RT-P2-CLIENT.                        
           MOVE CAK-BRANCH              TO RT-P2-BRANCH.                        
           MOVE CAK-ACCOUNT             TO RT-P2-ACCOUNT.                       
           MOVE PEND-CONTROL-NBR        TO RT-P2-CONTROL.                       
LRM007     IF P2-FOREIGN                                                        
LRM007        SET RT-P2-FRGN-FEE TO TRUE                                        
LRM007     END-IF.                                                              
LRM007     MOVE PEND-ADP-SECURITY       TO RT-P2-ADP-NBR.                       
LRM007     MOVE PEND-CASH-MGN-IND       TO RT-P2-ACCOUNT-TYPE.                  
           MOVE 'B'                     TO RT-P2-TYPE.                          
           MOVE P2-OUTREC               TO RT-P2-DATA (S1).                     
                                                                                
LRM007     IF P2-FOREIGN                                                        
LRM007     AND B1-WRK-FRGN-FEE-DESCRIPTION > SPACES                     BHAT2   
LRM007        MOVE SPACES TO P2-BK-TRAILER-RECORD                               
LRM007        MOVE P2-BK-RECORD (1 : 7) TO  P2-BK-TRAILER-RECORD(1 : 7)         
LRM007        MOVE P2-BK-BR-ACCT-T-C    TO  P2-BK-TRAILER-BR-ACCT-T-C           
LRM007        MOVE PEND-ADP-SECURITY    TO RT-P2-ADP-NBR                        
LRM007        MOVE '-' TO  P2-BK-IPHEN                                          
LRM007        MOVE B1-WRK-FRGN-FEE-DESCRIPTION TO P2-BK-RES-DESCRIPTION         
LRM007        MOVE P2-BK-TRAILER-RECORD  TO  P2-OUTREC                          
LRM007        ADD  1                     TO S1                                  
LRM007        MOVE P2-OUTREC             TO RT-P2-DATA (S1).                    
                                                                                
  *********   GWS START                                                         
                                                                                
      * NOW WRITE OFFSET CREDIT P2 RECORD AND TRAILER                           
                                                                                
           IF P2-XFER                                                           
               MOVE 'XFER FEE FOR ACCT'      TO PDW-MSG                         
               MOVE XFER-FEE-OFFSET          TO P2-BK-BR-ACCT-T.                
                                                                                
           IF P2-XFER-IRA                                                       
               MOVE 'IRA FEE FOR ACCT'       TO PDW-MSG                         
               MOVE XFER-FEE-IRA-OFFSET      TO P2-BK-BR-ACCT-T.                
                                                                                
           IF P2-MAINT                                                          
               MOVE 'IRA MAINT FEE '         TO PDW-MSG                         
               MOVE MAINT-FEE-IRA-OFFSET     TO P2-BK-BR-ACCT-T.                
                                                                                
LRM007     IF P2-FOREIGN                                                        
LRM007         MOVE 'FRGN FEE FOR ACCT'      TO PDW-MSG                         
LRM007         MOVE BH-AT3-FOREIGN-FEE-OFFSET(B13-SUB)                          
LRM007                                       TO P2-BK-BR-ACCT-T.                
                                                                                
           MOVE P2-CREDIT-SIGN   TO  P2-BK-BUY-SELL-CODE.                       
           MOVE P2-BK-RECORD    TO  P2-BK-TRAILER-RECORD.                       
                                                                                
           MOVE CAK-BRANCH TO PDW-BR.                                           
           MOVE CAK-ACCOUNT TO PDW-ACCT.                                        
           MOVE P2-DESC-WORK    TO  P2-BK-RES-DESCRIPTION.                      
                                                                                
                                                                                
           MOVE P2-BK-TRAILER-RECORD    TO  P2-OUTREC.                          
LRM****    PERFORM 1600-WRITE-P2BKPG-REC THRU                                   
LRM****            1600-WRITE-P2BKPG-REC-EXIT.                                  
                                                                                
                                                                                
    *******  GWS START                                                          
                                                                                
LRM007     ADD  1                     TO S1                                     
LRM007     MOVE P2-OUTREC               TO RT-P2-DATA (S1).                     
                                                                                
LRM007     MOVE  S1                     TO RT-P2-SUB.                           
                                                                                
           WRITE RET-P2-REC             FROM RT-P2-REC.                         
                                                                                
    *******  GWS END                                                            
                                                                                
       1400-P2-REC-RTN-EXIT. EXIT.                                              
                                                                                
LRM007 1420-WRITE-FRGN-FEE-CASH-ADJ.                                            
LRM007*----------------------------------------------------------------         
LRM007*  CASH ADJUSTMENT FEFO RECORD WILL CAUSE CAT821 TO EXTRACT               
LRM007*  THE FRGN FEE, SECURITY NUMBER, AMT, ETC FOR ASCENDIS.  THIS            
LRM007*  WILL BE INGNORED BY CAT820DB WHEN UPATING THE DATABASE.                
LRM007*----------------------------------------------------------------         
LRM007     MOVE SPACES TO CASH-DETAIL-RECORD                                    
LRM007     MOVE PEND-ADP-CL-NO-X  TO CASH-ADP-CL-NO-X                           
LRM007     IF (PEND-TRNFR-TYPE-CD = 'FUL' OR 'PTR')                             
LRM007         MOVE PEND-CONTROL-NBR  TO CASH-CONTROL-NBR                       
LRM007     ELSE                                                                 
LRM007         ADD 1 TO WS-RESTART-COUNT                                        
LRM007         MOVE WS-RESTART-LIT    TO CASH-CONTROL-NBR                       
LRM007     END-IF.                                                              
LRM007     MOVE PEND-DLVR-NBR     TO CASH-DLVR-NBR                              
LRM007     MOVE PEND-DLVR-ACCT    TO CASH-DLVR-ACCT                             
LRM007     MOVE PEND-RCV-NBR      TO CASH-RCV-NBR                               
LRM007     MOVE PEND-RCV-ACCT     TO CASH-RCV-ACCT                              
LRM007     MOVE PEND-TRNFR-TYPE-CD TO CASH-TRNFR-TYPE-CD                        
LRM007     SET CASH-FRGN-FEE-RECORD  TO TRUE.                                   
LRM007     MOVE PEND-ADP-SECURITY  TO CASH-FRGN-FEE-ADP-NBR                     
LRM007     MOVE FRGN-FEE-AMT       TO CASH-FRGN-FEE-AMT                         
LRM014     MOVE ZERO               TO CASH-PAPER-STMNT-FEE-AMT                  
LRM007                                                                          
LRM007     WRITE CASH-DETAIL-RECORD                                             
LRM007     ADD 1 TO CASH-RECS-WRTN.                                             
                                                                                
       1600-WRITE-P2BKPG-REC.                                                   
                                                                                
           WRITE P2BKPG-RECORD FROM P2-OUTREC.                                  
           ADD 1 TO  P2-RECS-WRTN.                                              
                                                                                
       1600-WRITE-P2BKPG-REC-EXIT.  EXIT.                                       
                                                                                
     ****** GWS START                                                           
                                                                                
       1700-WRITE-REPORT.                                                       
                                                                                
E.T.       MOVE '1' TO B1-WK-PRINT-REPORT-IND.                                  
           IF CAK-CLIENT NOT = W-PREV-CLIENT                                    
              MOVE CAK-CLIENT           TO W-PREV-CLIENT                        
                                           HDR-TAG SHDR-TAG DTL-TAG             
                                           DSH-TAG HDR-CLIENT                   
              MOVE B1-CLIENT-NAME (CAK-CLIENT)                                  
                                        TO HDR-CLIENT-DESC                      
              MOVE 0                    TO W-PAGE-CTR                           
              MOVE 60                   TO W-LINE-CTR.                          
                                                                                
           MOVE CAK-BRANCH              TO DTL-BRANCH.                          
           MOVE CAK-ACCOUNT             TO DTL-ACCOUNT.                         
           MOVE PEND-ADP-SECURITY       TO DTL-SECURITY.                        
           MOVE PEND-FRAC-QTY           TO DTL-SHARES.                          
           MOVE PEND-FRAC-MARKET-VALUE  TO DTL-AMOUNT.                          
           MOVE PEND-ASSET-DESC         TO DTL-DESCRIPTION.                     
                                                                                
           IF PEND-LONG                                                         
              MOVE 'C'                  TO DTL-BS                               
           ELSE                                                                 
              MOVE 'D'                  TO DTL-BS.                              
                                                                                
           IF W-LINE-CTR  > 55                                                  
              ADD   1                  TO W-PAGE-CTR                            
              MOVE W-PAGE-CTR          TO HDR-PAGE                              
DJ0001        MOVE WS-CYCLE-DATA       TO HDR-CYCLE-DATA                        
              WRITE REPORT-REC         FROM HDR  AFTER PAGE                     
              WRITE REPORT-REC         FROM SHDR AFTER 2                        
              WRITE REPORT-REC         FROM DSH  AFTER 1                        
              WRITE REPORT-REC         FROM DET  AFTER 2                        
              MOVE  6                  TO W-LINE-CTR                            
           ELSE                                                                 
              WRITE REPORT-REC         FROM DET AFTER 1                         
              ADD   1                  TO W-LINE-CTR.                           
                                                                                
           ADD    1                    TO W-RPT-CTR.                            
                                                                                
                                                                                
       1700-WRITE-REPORT-EXIT. EXIT.                                            
                                                                                
     ****** GWS END                                                             
                                                                                
       1800-END-OF-JOB-ROUTINE.                                                 
                                                                                
           MOVE 'REC-CNT='   TO  P2BKPG-RECORD.                                 
           MOVE P2-RECS-WRTN TO  P2BKPG-RECORD (9:11).                          
DJ0001     MOVE 'T'                    TO CP2-REQUEST-CODE                      
DJ0001     MOVE 'CAT820'               TO CP2-PROGRAM-ID                        
DJ0001     MOVE P2-RECS-WRTN           TO CP2-RECORD-COUNT                      
DJ0001     MOVE 999                    TO CP2-CLIENT-NUMBER                     
DJ0001     CALL P2HDTR              USING CP2-AREA P2BKPG-FILE                  
DJ0001     MOVE CP2-RETURN-RECORD      TO P2BKPG-RECORD                         
DJ0001     MOVE WS-CYCLE-DATA          TO P2BKPG-RECORD(55:8)                   
DJ0001     DISPLAY 'P2BKPG-TRL = ' P2BKPG-RECORD(1:80)                          
           WRITE P2BKPG-RECORD.                                                 
                                                                                
           CLOSE TFRS-I-FILE                                                    
                 P2BKPG-FILE                                                    
                 RETAIN-FILE                                                    
                 REPORT-FILE.                                                   
                                                                                
           CLOSE REG-OPT-FILE.                                                  
                                                                                
LRM014     CLOSE PAPERFEE                                                       
LRM014     DISPLAY 'PAPERFEE FILE  CLOSED. STATUS = '                           
LRM014                                       PAPERFEE-STAT.                     
           PERFORM 3000-CLOSE-TACT.                                             
                                                                                
           DISPLAY 'TFRS RECORDS READ         - ' TFRS-DTL-RECS.                
           DISPLAY 'TFRS RECS BYPASSED CLIENT - ' TFRS-BYP-CLI.                 
LRM014     DISPLAY 'PAPER FEE CHARGES FOUND   - ' W-PAPERFEE-FND-CNT            
           DISPLAY 'CASH ADJUSTMENTS WRITTEN  - ' CASH-RECS-WRTN.               
DJ0001     DISPLAY 'P2BKPG DETAILS   WRITTEN  - ' P2-RECS-WRTN.                 
           DISPLAY 'CAT820 ENDING NORMALLY.'.                                   
       1800-END-OF-JOB-ROUTINE-EXIT.  EXIT.                                     
                                                                                
       3000-CLOSE-TACT.                                                         
           MOVE 'CAT820'        TO    TACTIO-CALLING-PGM-NAME.                  
DJ0001     MOVE WS-CYCLE-DATA(7:2) TO TACTIO-CALLING-PGM-NAME(7:2)              
                                                                                
           MOVE WS-TACT-DDNAME  TO    TACTIO-DDNAME.                            
           MOVE 'O'             TO    TACTIO-FILE-TYPE.                         
           MOVE 'T'             TO    TACTIO-FUNCTION-CODE.                     
           CALL ZTACTIO         USING TACTIO-PARAMETERS                         
                                      TACT-RECORD.                              
                                                                                
           MOVE 'C'             TO    TACTIO-FUNCTION-CODE.                     
           CALL ZTACTIO         USING TACTIO-PARAMETERS                         
                                      TACT-RECORD.                              
                                                                                
       5315-CHECK-IRA-BR-RANGE.                                                 
                                                                                
           IF  B1-WRK-MGCA-IRA-BR-RANGE-NO = 0                                  
               GO TO 5315-EXIT.                                                 
           MOVE 1 TO W-SUB1.                                                    
       5315-LOOP.                                                               
           IF  CAK-BRAC >= B1-WRK-MGCA-IRA-BR-RANGE-LO (W-SUB1) AND             
               CAK-BRAC <= B1-WRK-MGCA-IRA-BR-RANGE-HI (W-SUB1)                 
               SET MGCA-IRA-ACCOUNT TO TRUE                                     
***************DISPLAY*'***IRA-BR*FOUND*'*******************************        
*********************'*LO='*BH-MGCA-IRA-BR-RANGE-LO*(W-SUB1)************        
*********************'*HI='*BH-MGCA-IRA-BR-RANGE-HI*(W-SUB1)************        
           ELSE                                                                 
               IF  W-SUB1 < B1-WRK-MGCA-IRA-BR-RANGE-NO                         
                   ADD 1 TO W-SUB1                                              
               GO TO 5315-LOOP                                                  
           END-IF.                                                              
                                                                                
       5315-EXIT. EXIT.                                                         
      /                                                                         
       5316-CHECK-IRA-BR-ACT-RANGE.                                             
                                                                                
           IF  B1-WK-MGCA-IRA-BR-ACT-RANGE-NO = 0                               
               GO TO 5316-EXIT.                                                 
           MOVE 1 TO W-SUB1.                                                    
       5316-LOOP.                                                               
           IF  (CAK-BRANCH >= B1-WK-MGCA-IRA-BR-ACT-BR-LO  (W-SUB1) AND         
                CAK-BRANCH  <= B1-WK-MGCA-IRA-BR-ACT-BR-HI   (W-SUB1))          
           AND (CAK-ACCOUNT >= B1-WK-MGCA-IRA-BR-ACT-ACT-LO (W-SUB1) AND        
                CAK-ACCOUNT <= B1-WK-MGCA-IRA-BR-ACT-ACT-HI (W-SUB1))           
                  SET MGCA-IRA-ACCOUNT TO TRUE                                  
******************DISPLAY*'***IRA-BR-ACT*FOUND*'************************        
*********************'*LO='*BH-MGCA-IRA-BR-ACT-BR-LO*(W-SUB1)***********        
*********************'*HI='*BH-MGCA-IRA-BR-ACT-BR-HI*(W-SUB1)***********        
*********************'*LO='*BH-MGCA-IRA-BR-ACT-ACT-LO*(W-SUB1)**********        
*********************'*HI='*BH-MGCA-IRA-BR-ACT-ACT-HI*(W-SUB1)**********        
           ELSE                                                                 
               IF  W-SUB1 < B1-WK-MGCA-IRA-BR-ACT-RANGE-NO                      
                   ADD 1 TO W-SUB1                                              
               GO TO 5316-LOOP                                                  
           END-IF.                                                              
                                                                                
       5316-EXIT. EXIT.                                                         
                                                                                
       ABEND-RTN.                                                               
           CALL  ABEND  USING ABORT-CODE.                                       
                                                                                
