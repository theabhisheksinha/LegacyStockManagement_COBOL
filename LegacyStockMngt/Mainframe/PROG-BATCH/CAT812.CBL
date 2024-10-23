000001* PDX    - CAT812   C0360671 02/23/15 11:26:32 TBLAMUR            00001000
      * LRM025 SSR# 99150 MARK CONTRA CUSIP POSN AS WHI-STTS-CD = C TO          
      *   CAUSE ONLINE DSPLY WARNING WHEN CLIENT REMOVES THE WITHHELD.          
      *   ADD SETTLE LOC 35 TO BYPASS CONTRA CUSIP TEST.                        
000001* PDX    - CAT812   C0353648 04/11/14 13:30:24 TBLAMUR            00001000
      * LRM023 SSR# 100417 SET FUND AGENT CODE NEW COL ON ACTIMF.               
000001* PDX    - CAT812   C0344128 09/16/13 09:30:16 TBLAMUR            00001000
000001* LRM022 SSR 94296 RECOMPILE FOR EXPANDED BNWMASTW AND                    
      *    NEW COPYBOOK VERSION FOR NTWIOREC.                                   
000001* PDX    - CAT812   C0336625 05/24/13 10:58:43 TBLAMUR            00001000
000001* LRM021 SSR 85742 DST/SCHWAB SUPER OMNI FUNDS.                           
000001*  NTWMAST VALUE 5 USE WAIVE ACCOUNT.                                     
000001* PDX    - CAT812   C0336155 01/15/13 16:53:06 TBLAMUR            00001000
000001* LRM020 SSR 86964 DEFAULT NETWORK LEVEL FROM ORIGINAL DLVY WHEN          
      *  NOT FOUND ON NETWORK MASTER.                                           
000001* PDX    - CAT812   C0332648 10/18/12 15:37:14 TBLAMUR            00001000
000001* LRM019 SSR 86111 CONSIDER SINGLE FUND ACCOUNT B1 WHEN                   
      *   READING NETWORK MASTER.                                               
000001* PDX    - CAT812   C0331869 10/15/12 15:03:57 TBLAMUR            00001000
000001* PDX    - CAT812   C0329036 10/10/12 15:37:53 TBLAMUR            00001000
      * LRM018 SSR 85105 CHANGE FOREIGN ASSET LOGIC TO MOVE THE                 
      *   MSD ISIN (ALL 12 BYTES) WHEN CUSIP IS MISSING.                        
000001* PDX    - CAT812   C0317345 12/13/11 12:48:52 TBLAMUR            00001000
      * LRM017 SSR 79096 INITIALIZE PENDING DIVIDEND ON ACATDLVF.               
000001* PDX    - CAT812   C0311358 05/03/11 14:39:49 TBLAMUR            00001000
      * LRM016 SSR 76911 CORRECT B1 434517=3 TO CONSIDER 090 SUFFIX             
000001* PDX    - CAT812   C0309482 03/18/11 15:21:49 TBLAMUR            00001000
      * LRM015 CALL TABL GET TO OBTAIN CONTRAS TO CREATE RCR ON HOLD.           
000001* PDX    - CAT812   C0305759 01/10/11 11:39:53 TBLAMUR            00001000
      * LRM014 SSR 74045 REPORT DUPE CONTROL NUMBER EXCEPTIONS.                 
000001* PDX    - CAT812   C0306386 01/10/11 10:17:11 TBLAMUR            00001000
      * LRM013 SSR 75770 CREATE RCR ON HOLD FOR 0733 WELLS FARGO.               
000001* PDX    - CAT812   C0302233 11/19/10 14:52:44 TBLAMUR            00001000
      * LRM012 SSR 72194 DO NOT OVERLAY TYPE 1 POSN WITH TYPE 3 POSN.           
      *   TYPE 3 CASH WAS ALREADY COMBINED INTO TYPE1 BY CAT812A.               
      *   THE TYPE3 POSN WILL SWEEP OUT ON THE NEXT RCR.                        
000001* PDX    - CAT812   C0296621 08/27/10 10:52:14 TBLAMUR            00001000
      * SSR 71810 RECOMPILE FOR COPYBOOK CHANGE ACATDLVF.                       
      *   FOREIGN FEE ARE NOT CHARGED ON RCR.                                   
000001* PDX    - CAT812   C0292845 04/06/10 11:16:26 TBLAMUR            00001000
      * LRM011 SSR 67411 PNC SURPAS FUNDS                                       
000001* PDX    - CAT812   C0288347 01/07/10 11:19:43 TBLAMUR            00001000
      * LRM010 SSR 59603 OPTION SYMBOLOGY CHANGES.                              
      *   REMOVE PARM-STREAM = Q HARD CODE AT THIS TIME.                        
      *   MOVE RCR EXPANDED STRIKE PRICE TO ACTIOPN.                            
000001* PDX    - CAT812   C0275568 03/09/09 09:57:04 TBDOJUN            00001000
      * DJ0009 SSR 61065 BH-MF-EXBR-OPTION(537483)=1,USE MF EXBR TABLE  00001000
      * DJ0009 FOR THE MUTUAL FUND EXECUTING BROKER NUMBER              00001000
000001* PDX    - CAT812   C0276164 01/28/09 10:23:48 TBLAMUR            00001000
      * LRM009 SSR 62857 CREATE RCR ON HOLD FOR 0201 AG EDWARDS         00001000
000001* PDX    - CAT812   C0260091 05/12/08 11:24:43 TBDOJUN            00001000
      * DJ0008 SSR 55766 ASCENDIS(WORKFLOW) CLEAN UP NSCC-ACK-IND       00001000
000001* PDX    - CAT812   C0235973 07/10/06 10:08:14 TBDOJUN            00001000
      * DJ0007 - SSR# 44420 RECOMPILED FOR COPYBOOK ACATRCRF                    
000001* PDX    - CAT812   C0231736 04/13/06 15:13:23 TBDOJUN                    
      * DJ0006 - SSR# 44629 - MAINTAIN ONE MF NETWORK LEVEL                     
      * DJ0006 - B1#537486: 1=ONE NETWORK-LEVEL 3 FUND ACCOUNT                  
      * DJ0006 - IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                             
000001* PDX    - CAT812   C0223362 08/08/05 10:45:08 TBDOJUN                    
      * DJ0005 - SSR# 41172 POPULATE OCC-NBR ONLY FOR OPTIONS                   
000001* PDX    - CAT812   C0215363 02/14/05 08:03:24 TBDOJUN                    
      * DJ0004 - SSR# 40042 NEW DB2 INIT TBL: ACTI***,NEW KEY STRUCTURE         
      * DJ0004 - MIPS REDUCTION: CHG TO PIC 9 COMP-3.                           
      * PDX    - CAT812   C0213424 11/09/04 11:42:40 TBLAMUR                    
      * LRM005 - SSR 0039972 ALWAYS SET FULL/PRTL IND AS PRTL ON F/R            
      * PDX    - CAT812   C0199229 12/16/03 11:55:45 TBEDTAK                    
      * ET0003 - PICK UP AN ACCT TYPE & CHK DGT WHEN BUILDING FUND NBR          
      * PDX    - CAT812   C0183314 11/29/03 13:56:08 TBLAMUR                    
      * PDX    - CAT812   C0197442 10/27/03 12:36:37 TBLAMUR                    
      * PDX    - CAT812   C0196644 10/06/03 12:01:50 TBLAMUR                    
      * ET0002 - OPTION STRIKE PRICE DECIMALIZATION                             
      * PDX    - CAT812   C0179270 10/08/02 08:42:12 TBLAMUR                    
      * LRM004 - SSR 0029440 MUTUAL FUND DST/MFE CHANGE                         
      * PDX    - CAT812   C0179392 09/06/02 15:15:42 TBEDTAK                    
      * ET0001 - FOR PRIVATE RANGE FUNDS, SET STTL LOCATION TO '50' AND         
      *          STTL REASON CODE TO 'XSET' FOR CLIENT 39 (BERNSTEIN).          
      * PDX    - CAT812   C0176431 06/25/02 11:43:51 TBLAMUR                    
      * LRM002 - SSR# 0029188 MULTI PLATFORM O-NSCC                             
      * PDX    - CAT812   C0158046 05/29/01 09:45:01 TBLAMUR                    
      * LRM001 - R5762700 OVERRIDES TO FNBR ON DELVR FOR O-NSCC                 
      * PDX    - CAT812   C0152145 01/16/01 16:46:49 TBDOJUN                    
      * DJ0003   USE B1 434608 FOR FUND ACCOUNT NUMBER                          
      * PDX    - CAT812   C0141412 08/28/00 10:15:39 TBDOJUN                    
      * DJ0002   SSR# R2558300 BYPASS NON-DELIVERABLE                           
      * DJ0002   SSR# R5258000 EXCEPTION PROCESSING                             
      * DJ0002   CREATE ACATDLVF FOR SETTLING TYPE 3 PROCESSING                 
      * PDX    - CAT812   C0128921 08/16/99 10:08:49 TBDOJUN                    
      * DJ0001 - COMMIT AT EVERY TRANSFER                                       
      * PDX    - CAT812   C0125737 06/14/99 10:34:48 TBDOJUN                    
      * PDX    - CAT812   C0124764 04/26/99 10:42:13 TBDOJUN                    
      * PDX    - CAT812   C0123087 04/12/99 10:36:19 TBDOJUN                    
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT812.                                                     
      *****************************************************************         
      * THIS PROGRAM CONTAINS DB2.                                    *         
      *****************************************************************         
      * CAT812-    CREATE RCR TRANSFER REQUESTS FOR RESIDUAL CREDITS  *         
      *            READ ACATRCRF FILE FROM CAT812A                    *         
      *            IF THERE ARE DEBIT BALANCES OR SHORT POSITIONS,    *         
      *            FLAG THAT ACCOUNT, DO NOT LOAD, REPORT IT.         *         
      *            BYPASS ALL ASSETS FOR ACCOUNTS WITH SHORT BAL/POS. *         
      *                                                               *         
      * SELECT FULL TRANSFER DELIVERY REQUESTS,                       *         
      * WHERE STATUS = 310(SETTLE CLOSE)                              *         
      *   AND NAPPA-ACAT-CODE = 'D'                                   *         
      *                                                               *         
      * BYPASS DEBIT BALANCE (> 0), AND SMA                           *         
      * BYPASS SHORT POSITION(< 0), RESTRICTED, MEMOS                 *         
      *                                                               *         
      * USE B1#434536 TO DETERMINE WHO TO PROCESS ON THE HISTORY FILE.*         
      * CREATE AN RCR TRANSFER (TI) RECORD ON INIT TABLE.             *         
      *                                                               *         
      * IF B1#434536 6TH BYTE(BH-ACAT-RESID-CRD-DISPL-ONLINE) = '1',  *         
      * THAT MEANS AUTO-SUBMIT (TRANSFER AND ASSETS WILL GO OUT ON    *         
      * THE FIRST CYCLE), MOVE BLANK TO NSCC-PEND-CD.                 *         
      * IF B1#434536 6TH BYTE(BH-ACAT-RESID-CRD-DISPL-ONLINE) = '0',  *         
      * THAT MEANS HOLD (POST TO M SCREEN FOR REVIEW AND /OR RELEASE  *         
      * BY THE USER), MOVE 'H' TO NSCC-PEND-CD.                       *         
      *                                                               *         
      * ASSET(AT) RECORD TRANSFER TYPE REASON CODE:                   *         
      * 01 =CASH DIVIDEND                                             *         
      * 02 =INTEREST                                                  *         
      * 03 =LIQUIDATION                                               *         
      * 04 =STOCK DIVIDEND/ DISTRIBUTION                              *         
      * 05 =STOCK SPLIT                                               *         
      * 06 =REORGANIZATION                                            *         
      * 07 =REDEMPTION                                                *         
      * 08 =UNDERLYING OPTION                                         *         
      * 09 =UNDERLYING SECURITY                                       *         
      * 10 =MISCELLANEOUS                                             *         
      * 11 =MUTUAL FUNDS FRACTIONAL CASH-IN-LIEU                      *         
      * 12 =MUTUAL FUNDS ACCRUAL                                      *         
      * 13 =MUTUAL FUNDS RESIDUAL                                     *         
      *                                                               *         
      * INPUT  -                                                      *         
      *        - ACATRCRF  FROM CAT812A                               *         
      *        - MUTUAL FUND FILES                                    *         
      *        - B1                                                   *         
      * OUTPUT -                                                      *         
      *        - DB2 DATABASE                                         *         
      *        - ACATRCRF  OUTPUT TO CAT813 FOR REPORTING             *         
      *        - ACATDLVF  OUTPUT TO CAT820 FOR FRACTION LIQUIDATION  *         
      *                                                               *         
      *                                                               *         
      *****************************************************************         
      * 04/01/99 DJ    REWRITE                                        *         
DJ0002* 08/28/00 DJ    SSR# R2558300 FLAG NON-DELIVERABLE             *         
DJ0002*                SSR# R5258000 EXCEPTION PROCESSING             *         
DJ0002*                ITEMS TO BE REPORTED IN A NEW REPORT IN CAT813.*         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE            ASSIGN TO INFILE                            
                  FILE STATUS IS    INFILE-STATUS.                              
                                                                                
           SELECT MFMSD             ASSIGN TO MFMSD                             
                  ACCESS            RANDOM                                      
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     MAIN-KEY                                    
                  FILE STATUS IS    MFMSD-STATUS.                               
                                                                                
           SELECT BNWMAST           ASSIGN TO BNWMAST                           
                  ACCESS            DYNAMIC                                     
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     MAST-KEY-AREA                               
                  FILE STATUS IS    BNWMAST-STATUS.                             
                                                                                
           SELECT BNWREGOP          ASSIGN TO BNWREGOP                          
                  ACCESS            RANDOM                                      
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     REG-OPT-KEY-AREA                            
                  FILE STATUS IS    BNWREGOP-STATUS.                            
                                                                                
DJ0009     SELECT MFEXBR            ASSIGN TO MFEXBR                            
DJ0009            ACCESS            RANDOM                                      
DJ0009            ORGANIZATION      INDEXED                                     
DJ0009            RECORD KEY IS     EXBR-KEY                                    
DJ0009            FILE STATUS IS    MFEXBR-STATUS.                              
                                                                                
           SELECT ACATRCRF         ASSIGN      TO ACATRCRF                      
                                   FILE STATUS IS ACATRCRF-FILE-STATUS.         
                                                                                
           SELECT ACATDLVF         ASSIGN      TO ACATDLVF                      
                                   FILE STATUS IS ACATDLVF-FILE-STATUS.         
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS F.                                                 
                                                                                
           COPY ACATRCRF REPLACING ==:ACATRCRF:== BY ==INFILE==.                
      /                                                                         
       FD  MFMSD.                                                               
       01  MFMSD-REC.                                                           
           COPY MFMSDREC.                                                       
      /                                                                         
       FD  BNWMAST.                                                             
       01  BNWMAST-REC.                                                         
           COPY BNWMASTW.                                                       
      /                                                                         
       FD  BNWREGOP.                                                            
       01  BNWREGOP-RECORD.                                                     
           COPY BNWREGOP.                                                       
      /                                                                         
DJ0009 FD  MFEXBR.                                                              
DJ0009 01  MFEXBR-REC.                                                          
DJ0009     COPY MFEXBR.                                                         
      /                                                                         
       FD  ACATRCRF                                                             
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
           COPY ACATRCRF REPLACING ==:ACATRCRF:== BY ==OUT==.                   
      /                                                                         
       FD  ACATDLVF                                                             
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
           COPY ACATDLVF REPLACING ==:FMT:== BY ==ACATDLVF==.                   
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
           COPY PDXIDCOB.                                                       
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT812'.            
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.                 
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.                 
               88 NOT-FIRST-TIME                     VALUE '1'.                 
LRM001     05  NTW-NSCCSRC-ACCT-FLAG        PIC  X(01)  VALUE SPACES.           
LRM001         88  NTW-NSCCSRC-ACCT                     VALUE 'Y'.              
LRM001         88  NTW-NOT-NSCCSRC-ACCT                 VALUE 'N'.              
           05  END-OF-INPUT-SW           PIC  X(001) VALUE '0'.                 
               88 END-OF-INPUT                       VALUE '1'.                 
           05  INFILE-STATUS             PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING VALUE '35'.                              
           05  MFMSD-STATUS              PIC X(002).                            
               88 VALID-MFMSD-STATUS     VALUE '00' '04' '10' '23'.             
               88 MFMSD-OKAY             VALUE '00' THRU '09', '97'.            
               88 MFMSD-END-OF-FILE      VALUE '10'.                            
               88 MFMSD-NOT-FOUND        VALUE '23'.                            
               88 MFMSD-EMPTY-MISSING    VALUE '35'.                            
           05  BNWMAST-STATUS            PIC X(002).                            
               88 VALID-BNWMAST-STATUS   VALUE '00' '04' '10' '23'.             
               88 BNWMAST-OKAY           VALUE '00' THRU '09', '97'.            
               88 BNWMAST-END-OF-FILE    VALUE '10'.                            
               88 BNWMAST-NOT-FOUND      VALUE '23'.                            
               88 BNWMAST-EMPTY-MISSING  VALUE '35'.                            
           05  BNWREGOP-STATUS           PIC X(002).                            
               88 VALID-BNWREGOP-STATUS  VALUE '00' '04' '10' '23'.             
               88 BNWREGOP-OKAY          VALUE '00' THRU '09', '97'.            
               88 BNWREGOP-END-OF-FILE   VALUE '10'.                            
               88 BNWREGOP-NOT-FOUND     VALUE '23'.                            
               88 BNWREGOP-EMPTY-MISSING VALUE '35'.                            
DJ0009     05  MFEXBR-STATUS             PIC X(002).                            
DJ0009         88 VALID-MFEXBR-STATUS    VALUE '00' '04' '10' '23'.             
DJ0009         88 MFEXBR-OKAY            VALUE '00' THRU '09', '97'.            
DJ0009         88 MFEXBR-END-OF-FILE     VALUE '10'.                            
DJ0009         88 MFEXBR-NOT-FOUND       VALUE '23'.                            
DJ0009         88 MFEXBR-EMPTY-MISSING   VALUE '35'.                            
           05  POSIT-STATUS              PIC  X(002).                           
               88 POSIT-OKAY             VALUE '00' THRU '09', '97'.            
               88 POSIT-END-OF-FILE      VALUE '10'.                            
               88 POSIT-EMPTY-MISSING    VALUE '35'.                            
           05  ACATRCRF-FILE-STATUS      PIC  X(002).                           
               88 ACATRCRF-OKAY          VALUE '00' THRU '09', '97'.            
               88 ACATRCRF-END-OF-FILE   VALUE '10'.                            
               88 ACATRCRF-EMPTY-MISSING VALUE '35'.                            
           05  ACATDLVF-FILE-STATUS      PIC  X(002).                           
               88 ACATDLVF-OKAY          VALUE '00' THRU '09', '97'.            
               88 ACATDLVF-END-OF-FILE   VALUE '10'.                            
               88 ACATDLVF-EMPTY-MISSING VALUE '35'.                            
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.                 
               88 INFILE-DATE-FOUND                  VALUE 'Y'.                 
           05  W-SYS-DATE                PIC  9(006) VALUE 0.                   
           05  FILLER  REDEFINES                                                
               W-SYS-DATE.                                                      
               10  W-UPD-DATE            PIC  X(006).                           
           05  W-SYS-TIME                PIC  9(008) VALUE 0.                   
           05  FILLER  REDEFINES                                                
               W-SYS-TIME.                                                      
               10  W-UPD-TIME            PIC  X(006).                           
               10  W-UPD-TIME-MS         PIC  X(002).                           
           05  W-PROC-DT.                                                       
               10 W-PROC-DT-YEAR         PIC  X(004).                           
               10 W-PROC-DT-D1           PIC  X(001) VALUE '-'.                 
               10 W-PROC-DT-MM           PIC  X(002).                           
               10 W-PROC-DT-D2           PIC  X(001) VALUE '-'.                 
               10 W-PROC-DT-DD           PIC  X(002).                           
           05  W-BPD-PROC-DATE           PIC  9(008).                           
           05  W-BPD-PROC-DATE-X REDEFINES                                      
               W-BPD-PROC-DATE           PIC  X(008).                           
           05  W-STL-DATE.                                                      
               10 W-STL-YEAR             PIC  X(004).                           
               10 W-STL-MM               PIC  X(002).                           
               10 W-STL-DD               PIC  X(002).                           
           05  W-BEGIN-DATE.                                                    
               10 W-BEGIN-YEAR           PIC  X(004).                           
               10 W-BEGIN-MM             PIC  X(002).                           
               10 W-BEGIN-DD             PIC  X(002).                           
           05  W-END-DATE.                                                      
               10 W-END-YEAR             PIC  X(004).                           
               10 W-END-MM               PIC  X(002).                           
               10 W-END-DD               PIC  X(002).                           
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.                 
               88 HDR-FOUND                          VALUE 'H'.                 
               88 TRL-FOUND                          VALUE 'T'.                 
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.                 
               88 BRK-FOUND                          VALUE 'Y'.                 
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.          
           05  W-INFILE-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'ACATRCRF'.          
           05  W-ACATRCRF-CNT            PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'OUTPUT  '.          
           05  W-OUTPUT-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'ACATDLVF'.          
           05  W-ACATDLVF-CNT            PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.          
           05  W-DETAIL-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'LOAD-CNT'.          
           05  W-LOAD-CNT                PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'BYPASS  '.          
           05  W-BYPASS-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-TI-CNT                  PIC  9(009) COMP-3 VALUE 0.            
           05  W-AT-CNT                  PIC  9(009) COMP-3 VALUE 0.            
           05  W-FR-CNT                  PIC  9(009) COMP-3 VALUE 0.            
           05  W-ATR-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-ATO-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-ATF-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-SQL-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-ADD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-NOT-ADD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-NOT-UPD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-DEL-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-NOT-DEL-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-ADD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-NOT-ADD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-NOT-UPD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-DEL-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-NOT-DEL-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-ADD-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-NOT-ADD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-UPD-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-NOT-UPD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-DEL-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-NOT-DEL-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-DEL-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-DEL-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-ADD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-ADD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-UPD-CNT     PIC  9(009) COMP-3 VALUE 0.            
DJ0002     05  W-TI-NON-DELIVERABLE-CNT  PIC  9(009) COMP-3 VALUE 0.            
DJ0002     05  W-TI-EXCEPTION-CNT        PIC  9(009) COMP-3 VALUE 0.            
DJ0002     05  W-TI-SHORT-CNT            PIC  9(009) COMP-3 VALUE 0.            
DJ0002     05  W-EXC-NON-CNT             PIC  9(009) COMP-3 VALUE 0.            
DJ0002     05  W-EXC-DEL-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM020     05  W-VMFHSTY-FOUND-CNT       PIC  9(009) COMP-3 VALUE 0.            
LRM020     05  W-VMFHSTY-NOTFND-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  BAL-IDX                   PIC  9(4) COMP.                        
           05  W-TRANSFER-FND-SW         PIC  X(001) VALUE ' '.                 
               88 W-TRANSFER-FOUND                   VALUE 'Y'.                 
           05  W-ASSET-ADDED-FOR-THIS-ACCT-SW PIC X(01).                        
               88  W-ASSET-ADDED-FOR-THIS-ACCT     VALUE 'Y'.                   
DJ0005     05  W-OPT-ADDED-FOR-THIS-ACCT-SW PIC X(01).                          
DJ0005         88  W-OPT-ADDED-FOR-THIS-ACCT       VALUE 'Y'.                   
LRM020     05  W-VMFHSTY-FND-SW          PIC  X(001) VALUE ' '.                 
LRM020         88 W-VMFHSTY-FOUND                    VALUE 'Y'.                 
           05  W-BH-NSCC-PEND-CD         PIC X(01).                             
ET0002     05 W-OPT-DECIMAL-ROUNDED      PIC 9(02) VALUE ZEROS.                 
ET0001     05 W-PRIVATE-RANGE.                                                  
ET0001         10 W-PRIVATE-RANGE-FUNDS  PIC  X(007).                           
ET0001            88 W-PRIV-RANGE-SECURITY    VALUE '8022143'                   
ET0001                                         THRU '8022152',                  
ET0001                                              '8022159',                  
ET0001                                              '8864350'.                  
      /                                                                         
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
       01  CALL-MODULES.                                                        
           05  ABEND-PROGRAM             PIC  X(08) VALUE 'ILBOABN0'.           
           05  DSNTIAR-PROGRAM           PIC  X(08) VALUE 'DSNTIAR '.           
           05  SPIEEXIT-PROGRAM          PIC  X(08) VALUE 'SPIEEXIT'.           
           05  ZBPDATES-PROGRAM          PIC  X(08) VALUE 'ZBPDATES'.           
           05  ZGETB1V-PROGRAM           PIC  X(08) VALUE 'ZGETB1V '.           
           05  ZP2HDTR-PROGRAM           PIC  X(08) VALUE 'ZP2HDTR'.            
LRM002     05  CKDIGIT                   PIC  X(08) VALUE 'CKDIGIT '.           
LRM002     05  BNWNTWIO                  PIC  X(08) VALUE 'BNWNTWIO'.           
LRM015     03  TABLGET                   PIC X(08)  VALUE 'TABLGET '.           
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'WORKFLDS'.           
       01  W-WORK-FIELDS.                                                       
           05  W-DATE.                                                          
               07  W-DATE-YEAR.                                                 
                   09  W-DATE-CC         PIC X(2) VALUE ' '.                    
                   09  W-DATE-YY         PIC X(2) VALUE ' '.                    
               07  FILLER                PIC X(1) VALUE '-'.                    
               07  W-DATE-MM             PIC X(2) VALUE ' '.                    
               07  FILLER                PIC X(1) VALUE '-'.                    
               07  W-DATE-DD             PIC X(2) VALUE ' '.                    
           05  W-ASSET-SEQ-NBR           PIC S9(004) COMP.                      
           05  W-AT-ASSET-SEQ-NBR        PIC S9(004) COMP.                      
           05  W-COMMA-PTR               PIC  9(002) VALUE 0.                   
           05  W-QTY-PTR                 PIC  9(002) VALUE 0.                   
           05  W-INT-PTR                 PIC  9(002) VALUE 0.                   
           05  W-DEC-PTR                 PIC  9(002) VALUE 0.                   
           05  W-COMMA-FND-SW            PIC  X(001) VALUE ' '.                 
                                                                                
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
           05  W-POS-KEY.                                                       
               10  W-POS-KEY-A.                                                 
                   15  W-POS-CLT         PIC 9(05) COMP-3.                      
                   15  W-POS-BR          PIC 9(05) COMP-3.                      
                   15  W-POS-ACCT        PIC 9(11) COMP-3.                      
               10  W-POS-CUR             PIC X(06).                             
               10  W-POS-CUR-N REDEFINES W-POS-CUR                              
                                         PIC 9(06).                             
               10  W-POS-REC-TYPE        PIC X(02).                             
               10  W-POS-ACCT-TYPE       PIC X(02).                             
               10  W-POS-ACCT-TYPE-N REDEFINES                                  
                   W-POS-ACCT-TYPE       PIC 9(02).                             
               10  W-POS-SEC-NBR         PIC X(15).                             
               10  W-POS-WI              PIC X(01).                             
               10  W-POS-SEQ             PIC 9(04).                             
           05  SUB1                      PIC 9(03) COMP-3 VALUE 0.              
           05  W-SUB1                    PIC 9(03) COMP-3 VALUE 0.              
           05  W-HEX                     PIC S9(04) COMP SYNC VALUE +0.         
           05  FILLER REDEFINES W-HEX.                                          
               10  FILLER                PIC X(01).                             
               10  W-HEX-X               PIC X(01).                             
           05  WORK-POS-QTY              PIC S9(12)V9(5) COMP-3.                
           05  WORK-POS-QTY-INTEGER      PIC S9(12)    COMP-3.                  
           05  WORK-POS-QTY-DECIMAL      PIC V9(5).                             
           05  WORK-POS-QTY-LEFT         PIC S9(12)V9(5) COMP-3.                
           05  W-ASSET-QTY-SIGN          PIC S9(12)V9(5) COMP-3.                
           05  W-ASSET-QTY-UNSIGN        PIC  9(12)V9(5) COMP-3.                
           05  WORK-POS-VALUE            PIC S9(12)V9(5) COMP-3.                
           05  WORK-MEMOS                OCCURS 4 TIMES.                        
               10  WORK-MEMO-CODE        PIC 9(02).                             
               10  WORK-MEMO-QTY-X.                                             
                   15  WORK-MEMO-QTY     PIC S9(12)V9(5) COMP-3.                
                   15  WORK-MEMO-FRAC-QTY REDEFINES WORK-MEMO-QTY               
                                         PIC S9(10)V9(7) COMP-3.                
           05  WORK-POS-MEMO-QTY         PIC S9(12)V9(5) COMP-3.                
           05  WORK-SN-MEMO-QTY          PIC S9(12)V9(5) COMP-3.                
           05  WORK-SFK-MEMO-QTY         PIC S9(12)V9(5) COMP-3.                
           05  WORK-WHOLD-MEMO-QTY       PIC S9(12)V9(5) COMP-3.                
           05  W-QTY-DISPLAY             PIC 999999.99999-.                     
           05  W-AMT-DISPLAY             PIC ZZZZZZZZ9.99-.                     
                                                                                
           05  W-ACTIAST-INSERT-SW       PIC X(01).                             
               88  W-ACTIAST-INSERT-OKAY VALUE 'Y'.                             
                                                                                
       01  W-MF-AREA.                                                           
           05  W-CKDIGIT-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-BNWMAST-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-BNWMAST-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-BNWREGOP-CNT            PIC  9(009) COMP-3 VALUE 0.            
           05  W-BNWREGOP-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
           05  W-MFMSD-CNT               PIC  9(009) COMP-3 VALUE 0.            
           05  W-MFMSD-FND-CNT           PIC  9(009) COMP-3 VALUE 0.            
DJ0009     05  W-MFEXBR-CNT              PIC  9(009) COMP-3 VALUE 0.            
DJ0009     05  W-MFEXBR-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-LEGG-CNT                PIC  9(009) COMP-3 VALUE 0.            
           05  W-OMNIBUS-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM004     05  W-DST-MFE-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM011     05  W-PNC-SURPAS-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-FUND-SERV-ELIGIBLE-SW    PIC X(01).                            
               88  IS-FUND-SERV-ELIGIBLE            VALUE 'Y'.                  
           05  W-BNWREGOP-FND-SW          PIC X(01).                            
               88  W-BNWREGOP-FOUND                 VALUE 'Y'.                  
           05  W-LEGG-MASON-FUND-SW       PIC X(01).                            
               88  IS-LEGG-MASON-FUND               VALUE 'Y'.                  
           05  W-BNWMAST-FND-SW           PIC X(01).                            
               88  W-BNWMAST-FOUND                  VALUE 'Y'.                  
           05  W-BH-MF3-SEBR-CLEAR-SW     PIC  X(001).                          
               88 W-BH-MF3-SEBR-CLEAR-FOUND          VALUE 'Y'.                 
           05  W-BH-MF3-SEBR-CLEAR       PIC X(4).                              
           05  WK-BR                     PIC X(3).                              
           05  NTW-HOUSE-ACCOUNT          PIC  X(20)  VALUE ' '.                
           05  NTW-HOUSE-ACCT-SW          PIC  X(01)  VALUE 'N'.                
               88  NTW-HOUSE-ACCT                     VALUE 'Y'.                
           05  NTW-OMNIBUS-ACCT-SW        PIC  X(01)  VALUE 'N'.                
               88  NTW-OMNIBUS-ACCT                   VALUE 'Y'.                
LRM004         88  NTW-DST-MFE-ACCT                   VALUE 'D'.                
LRM011         88  NTW-PNC-SURPAS-ACCT                VALUE 'P'.                
LRM021     05  NTW-SHWB-ACCT-FLAG         PIC  X(01)  VALUE SPACES.             
LRM021         88  NTW-SHWB-ACCT                      VALUE 'Y'.                
LRM021         88  NTW-NOT-SHWB-ACCT                  VALUE 'N'.                
DJ0009     05  W-MFMSD-FND-SW             PIC X(01).                            
DJ0009         88  W-MFMSD-FOUND                    VALUE 'Y'.                  
DJ0009         88  W-MFMSD-NOT-FOUND                VALUE 'N'.                  
DJ0009     05  W-MFEXBR-FND-SW            PIC X(01).                            
DJ0009         88  W-MFEXBR-FOUND                   VALUE 'Y'.                  
DJ0009         88  W-MFEXBR-NOT-FOUND               VALUE 'N'.                  
           05  NS-BRCH-ACCT-TC.                                                 
               10  NS-BRCH-ACCT-T        PIC  X(09).                            
               10  NS-CK                 PIC  X(01).                            
           05  WS-DST-BOX-ACCT-TC.                                              
               10  WS-DST-BOX-ACCT-T         PIC  X(09).                        
               10  WS-DST-BOX-CK             PIC  X(01).                        
LRM011     05  WS-PNC-SURPAS-BOX-TC.                                            
LRM011         10  WS-PNC-SURPAS-BOX-T       PIC  X(09).                        
LRM011         10  WS-PNC-SURPAS-CK          PIC  X(01).                        
                                                                                
       01  W-CKDIGIT.                                                           
           03 W-CKDIGIT-PARM.                                                   
              05 W-CKDIGIT-LEN               PIC 9(02) VALUE 9.                 
              05 W-CKDIGIT-ACCT-TC.                                             
                 07 W-CKDIGIT-ACCT-T.                                           
                    09 W-CKDIGIT-BRN-ACCT    PIC X(08) VALUE ' '.               
                    09 W-CKDIGIT-TYPE        PIC X(01) VALUE ' '.               
DJ0006           07 W-CKDIGIT-CK             PIC X(01) VALUE ' '.               
DJ0006        05 W-CKDIGIT-ACCT-TC-1.                                           
DJ0006           07 W-CKDIGIT-ACCT-T-1.                                         
DJ0006              09 W-CKDIGIT-BRN-ACCT-1  PIC X(08) VALUE ' '.               
DJ0006              09 W-CKDIGIT-TYPE-1      PIC X(01) VALUE ' '.               
DJ0006           07 W-CKDIGIT-CK-1           PIC X(01) VALUE ' '.               
                                                                                
       01  W-BNWMAST-KEY.                                                       
           05  W-BNWMAST-CLT-NO             PIC 9(3).                           
           05  W-BNWMAST-CUSIP-15.                                              
               10  W-BNWMAST-CUSIP-CNTRY-CD PIC X(2).                           
               10  W-BNWMAST-CUSIP          PIC X(9).                           
               10  W-BNWMAST-CUSIP-CHK-DGT  PIC X.                              
               10  W-BNWMAST-CUSIP-EXT      PIC X(3).                           
           05  W-BNWMAST-ACCT-ID.                                               
               10  W-BNWMAST-CLT            PIC 9(3).                           
               10  W-BNWMAST-BRN-5.                                             
                   15  W-BNWMAST-BRN-1-2    PIC X(2).                           
                   15  W-BNWMAST-BRN-3      PIC X(3).                           
               10  W-BNWMAST-ACCT-10.                                           
                   15  W-BNWMAST-ACCT-1-5   PIC X(5).                           
                   15  W-BNWMAST-ACCT-5     PIC X(5).                           
               10  W-BNWMAST-ACCT-TC.                                           
                   15  W-BNWMAST-TYPE       PIC X.                              
                   15  W-BNWMAST-CHK        PIC X.                              
           05  W-BNWMAST-PAYABLE-SEQ-NO     PIC 9(1).                           
                                                                                
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
      * * *  MEMO ENTRY MUST BE IN POS-MEMO-CODE (HEX) ASCENDING SEQ            
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
      *01  MEMO-TABLE.            'SBSDTMTFTRTLSKSNODORB C '                    
      *    05 FIL PIC X(30) VALUE '1  SEG MEMO                   '.             
      *    05 FIL PIC X(30) VALUE '2 MSOLD OUT OF SEG MEMO       '.             
      *    05 FIL PIC X(30) VALUE '3 MIN TRANSIT MEMO            '.             
      *    05 FIL PIC X(30) VALUE '4 MTRANSFER MEMO (AT AGENT)   '.             
      *    05 FIL PIC X(30) VALUE '5 MTRANSFER TO MATCH MEMO     '.             
      *    05 FIL PIC X(30) VALUE '6 MLEGAL TRANSFER MEMO        '.             
      *    05 FIL PIC X(30) VALUE '7 5SAFEKEEPING MEMO (UNSIGNED)'.             
      *    05 FIL PIC X(30) VALUE '8 5SAFEKEEPING MEMO (SIGNED)  '.             
      *    05 FIL PIC X(30) VALUE '9 MCOD MEMO                   '.             
      *    05 FIL PIC X(30) VALUE 'A MCOR MEMO                   '.             
      *    05 FIL PIC X(30) VALUE 'B MMEMO B (CLIENT DEFINED)    '.             
      *    05 FIL PIC X(30) VALUE 'C MMEMO C (CLIENT DEFINED)    '.             
      *                                                                         
      /                                                                         
       01  W-BAL-FIELDS.                                                        
           05  W-BAL-KEY.                                                       
             07  W-BAL-KEY-A.                                                   
               10  W-BAL-CLT                PIC 9(05)     COMP-3.               
               10  W-BAL-BR                 PIC 9(05)     COMP-3.               
               10  W-BAL-ACCT               PIC 9(11)     COMP-3.               
               10  W-BAL-REC-TYPE           PIC X(02).                          
             07  W-BAL-KEY-B.                                                   
               10  W-BAL-CUR                PIC X(06).                          
           05  W-BAL-TYPE1                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TYPE2                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TYPE3                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TYPE5                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-SMA                    PIC S9(9)V99 VALUE 0.               
           05  W-BAL-MMKT                   PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TOTAL-MARKET-VALUE     PIC S9(17) COMP-3.                  
           05  W-BAL-TOTL-LIQDATNG-EQUITY   PIC S9(17) COMP-3.                  
           05  W-CASH-SMA                   PIC X(04).                          
           05  W-WORK-BAL                   PIC S9(9)V99 VALUE 0.               
           05  W-WORK-BAL-UNSIGN            PIC  9(9)V99.                       
           05  W-CSH-MGN-SHT                PIC X(01).                          
      /                                                                         
      ******************************************************************        
      * P2HDRTRL COMMAREA - USED TO CREATE HEADER AND TRAILER RECORDS  *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'CP2WS   '.           
       01  W-HDR-TRL-LEN                 PIC 9(005) VALUE 120.                  
                                                                                
           COPY CP2WS.                                                          
      /                                                                         
LRM015     COPY TABCOBCM.                                                       
LRM015 01  WS-CONTRA-BLOCK-AREA.                                                
LRM015     05  WS-CONTRA-BLOCK-COUNT   PIC S9(4) COMP VALUE ZEROS.              
LRM015     05  WS-CONTRA-BLOCK OCCURS 999 TIMES PIC X(4).                       
      /                                                                         
       01  WK-MS-INFO-AREA.                                                     
           05  WK-MS-OPT-PRICE         PIC S9(4)V9(5) VALUE ZERO.               
           05  FILLER                  REDEFINES WK-MS-OPT-PRICE.               
               10  WK-MS-OPT-PRC       PIC 9(4).                                
               10  WK-MS-OPT-FRAC      PIC 9(5).                                
           05  WK-MS-OPT-FRAC-6        PIC 9(6) VALUE ZEROS.                    
           05  FILLER REDEFINES    WK-MS-OPT-FRAC-6.                            
               10  WK-MS-OPT-FRAC-1    PIC 9.                                   
               10  FILLER              PIC 9(5).                                
LRM010     05  WK-MS-OPT-PRICE-NEW     PIC S9(5)V9(3) VALUE ZERO.               
LRM010     05  FILLER                  REDEFINES WK-MS-OPT-PRICE-NEW.           
LRM010         10  WK-MS-OPT-PRC-NEW   PIC 9(5).                                
LRM010         10  WK-MS-OPT-FRAC-NEW  PIC 9(3).                                
                                                                                
       01  W-FETCH-AREA.                                                        
           05  WF-CLIENT-NBR          PIC X(4).                                 
           05  WF-ACAT-CONTROL-NBR    PIC X(14).                                
           05  WF-SBMTG-PRTCP-NBR     PIC X(4).                                 
           05  WF-DLVR-NBR            PIC X(4).                                 
           05  WF-ACCT-DLVR-NBR       PIC X(20).                                
           05  WF-RCV-NBR             PIC X(4).                                 
           05  WF-ACCT-RCV-NBR        PIC X(20).                                
           05  WF-TRNFR-TYPE-CD       PIC X(3).                                 
           05  WF-TRANS-TYPE-CD       PIC X(1).                                 
           05  WF-PRCS-DT             PIC X(10).                                
           05  WF-DSTBN-SIDE-CD       PIC X(1).                                 
                                                                                
       01  WF-AREA.                                                             
           05  W-CURRENT-CLIENT          PIC X(004).                            
           05  W-CURRENT-CLIENT-N REDEFINES                                     
               W-CURRENT-CLIENT          PIC 9(004).                            
           05  W-CURRENT-BROKER          PIC X(004).                            
           05  W-CURRENT-STREAM          PIC X(001).                            
                                                                                
       01  WF-ASSET-AREA.                                                       
           05  WF-ISIN-CNTRY-CD                PIC X(2).                        
           05  WF-ISIN-SEC-ISSUE-CD            PIC X(9).                        
           05  WF-ISIN-SEC-CDG-CD              PIC X(1).                        
           05  WF-CSH-MGN-SHRT-CD              PIC X(1).                        
           05  WF-STTLM-LCTN-CD                PIC X(2).                        
           05  WF-STTLM-RSN-CD                 PIC X(4).                        
           05  WF-ASSET-PRC-CTGY-CD            PIC X(4).                        
           05  WF-SECURITY-ADP-NBR             PIC X(0007).                     
           05  WF-CUSIP                        PIC X(0012).                     
           05  WF-SYMBOL                       PIC X(0008).                     
           05  WF-QTY                          PIC 9(12)V9(5).                  
           05  WF-PSTN-CD                      PIC X(1).                        
           05  WF-AMT                          PIC 9(12)V9(5).                  
           05  WF-DESC.                                                         
               10  WF-DESC1                    PIC X(0030).                     
               10  WF-DESC2                    PIC X(0030).                     
               10  WF-DESC3                    PIC X(0030).                     
               10  WF-DESC4                    PIC X(0030).                     
               10  WF-DESC5                    PIC X(0020).                     
                                                                                
       01  W-ACTITRF-SELECT-FIELDS.                                             
           05 W-ACTITRF-ACAT-CONTROL-NO     PIC  X(014).                        
           05 W-ACTITRF-TRNFR-TYPE-CD       PIC  X(003).                        
           05 W-ACTITRF-NSCC-PEND-CD        PIC  X(001).                        
           05 W-ACTITRF-PRCS-DT             PIC  X(010).                        
           05 W-ACTITRF-PRGM-NM             PIC  X(008).                        
           05 W-ACTITRF-UPDT-TMSTP          PIC  X(026).                        
           05 W-ACTITRF-TRNFR-TYPE-RJCT-CD PIC   X(001).                        
                                                                                
      /                                                                         
      ******************************************************************        
      * CAT812 ONLY FIELDS                                             *        
      ******************************************************************        
       01  W-CAT812-FIELDS.                                                     
           05  W-TABLE-ENTRY-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-SUB4                    PIC  9(004) COMP-3 VALUE 0.            
           05  W-SUB5                    PIC  9(004) COMP-3 VALUE 0.            
                                                                                
       01  FILLER                        PIC X(008) VALUE 'W-TAB   '.           
       01  W-TAB-AREA.                                                          
           05  W-TAB OCCURS 100 TIMES.                                          
               10 W-TAB-STREAM-CD            PIC X(001).                        
               10 W-TAB-CLIENT-NBR           PIC X(004).                        
               10 W-TAB-BRK-NBR              PIC X(004).                        
               10 W-TAB-HDR-SW               PIC X(001).                        
               10 W-TAB-HDR-DATE             PIC X(008).                        
               10 W-TAB-HDR-CYCLE            PIC X(004).                        
               10 W-TAB-TRL-SW               PIC X(001).                        
               10 W-TAB-TRL-DATE             PIC X(008).                        
               10 W-TAB-TRL-CYCLE            PIC X(004).                        
               10 W-TAB-ITEM-CNT             PIC 9(009).                        
               10 W-TAB-TOT-CNT              PIC 9(009).                        
                                                                                
       01  FILLER                        PIC X(008) VALUE 'B1-TABLE'.           
       01  B1-TABLE-AREA.                                                       
           03  B1-TABLE OCCURS 500 TIMES.                                       
               05  B1-ADP-CL-NO             PIC 9(04).                          
               05  B1-CLI-NAME              PIC X(30).                          
               05  B1-BKR-CLR-NO            PIC X(04).                          
               05  B1-STREAM                PIC X(01).                          
               05  B1-STATUS                PIC X(01).                          
               05  B1-ACAT-STATUS           PIC X(01).                          
       01  B1-WORK-FIELEDS.                                                     
           03  B1-TBL-CNT                   PIC 9(03) COMP-3 VALUE 0.           
           03  B1-SUB                       PIC 9(03) COMP-3 VALUE 0.           
                                                                                
      /                                                                         
           COPY ACATRCRF REPLACING ==:ACATRCRF:== BY ==W-HDR==.                 
      /                                                                         
           COPY ACATRCRF REPLACING ==:ACATRCRF:== BY ==ACATRCRF==.              
      /                                                                         
           COPY ACATRCRF REPLACING ==:ACATRCRF:== BY ==WF-RCRF==.               
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
      * B1 MF3  SECTION - MUTUAL FUNDS                                 *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'BHMF    '.            
           COPY BHMF.                                                           
      /                                                                         
           COPY BHMF3.                                                          
      /                                                                         
      ******************************************************************        
      * BPDATE COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
                                                                                
           COPY BPDATESC.                                                       
      /                                                                         
      ******************************************************************        
      * ASSET    INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIAST'.            
           EXEC SQL INCLUDE ACTIAST      END-EXEC.                              
                                                                                
      ******************************************************************        
      * OPTIONS  INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIOPN'.            
           EXEC SQL INCLUDE ACTIOPN      END-EXEC.                              
                                                                                
      ******************************************************************        
      * MUTUAL FUNDS INIT   TABLE                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIMF'.             
           EXEC SQL INCLUDE ACTIMF       END-EXEC.                              
                                                                                
LRM020******************************************************************        
LRM020* ASSET HISTORY TABLE                                            *        
LRM020******************************************************************        
LRM020 01  FILLER                        PIC X(008) VALUE 'VASTHSTY'.           
LRM020     EXEC SQL INCLUDE VASTHSTY     END-EXEC.                              
                                                                                
LRM020******************************************************************        
LRM020* MUTUAL FUNDS HISTORY TABLE                                     *        
LRM020******************************************************************        
LRM020 01  FILLER                        PIC X(008) VALUE 'VMFHSTY'.            
LRM020     EXEC SQL INCLUDE VMFHSTY      END-EXEC.                              
                                                                                
      ******************************************************************        
      * TRANSFER INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTITRF'.            
           EXEC SQL INCLUDE ACTITRF      END-EXEC.                              
                                                                                
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
                                                                                
       01  W-DB2-WORKAREA.                                                      
           05  ROLLBACK-SQLCA            PIC  X(122).                           
           05  ROLLBACK-RETURN           PIC S9(009) COMP.                      
               88  ROLLBACK-OK                VALUE +0.                         
               88  ROLLBACK-AB                VALUE -999 THRU -1                
                                                    +1   THRU +999.             
           05  COMMIT-SQLCA              PIC  X(122).                           
           05  COMMIT-RETURN             PIC S9(009) COMP.                      
               88  COMMIT-OK                  VALUE +0.                         
               88  COMMIT-AB                  VALUE -999 THRU -1                
                                                    +1   THRU +999.             
DJ0001     05  W-COMMIT-CNT              PIC  9(009) VALUE 0.                   
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.                   
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC ---9.                              
           05  W-TFR-SQLCODE             PIC S9(9) COMP-4.                      
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
                                                                                
LRM002     COPY NTWIOREC REPLACING ==:NTWIO:== BY ==NTWIO==.                    
                                                                                
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
           05  L-BYP-DATECHK-SW          PIC  X(001).                           
               88  L-BYP-DATECHK                     VALUE '1'.                 
           05  L-BYP-FILECHK-SW          PIC  X(001).                           
               88  L-BYP-FILECHK                     VALUE '1'.                 
           05  L-RERUN-SW                PIC  X(001).                           
               88  L-RERUN                           VALUE '1'.                 
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
       0000-MAIN SECTION.                                                       
           DISPLAY 'CAT812 - CREATE RCR (RESIDUAL CREDITS) DB2 ENTRIES'.        
           DISPLAY '         THE INPUT COMES FROM CAT812A'                      
           DISPLAY '         THE OUPUT IS PASSED TO CAT813 TO PRINT'            
                           ' REPORTS'                                           
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
                                                                                
           PERFORM 2000-PROCESS-INPUT THRU 2000-EXIT                            
                                                                                
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                          
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT SECTION.                                                       
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.                
                                                                                
           CALL SPIEEXIT-PROGRAM.                                               
                                                                                
           EXEC SQL                                                             
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP                     
           END-EXEC                                                             
                                                                                
           IF  SQLCODE = +0                                                     
               DISPLAY ' '                                                      
               DISPLAY 'CAT812: W-CURRENT-TIMESTAMP = '                         
                                                    W-CURRENT-TIMESTAMP         
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT812: W-CURRENT-TIMESTAMP NOT SET'                    
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
           ACCEPT W-SYS-DATE              FROM DATE.                            
           ACCEPT W-SYS-TIME              FROM TIME.                            
           DISPLAY 'CAT812: SYS-DATE ' W-SYS-DATE                               
                          ' SYS-TIME ' W-SYS-TIME.                              
                                                                                
           DISPLAY 'CAT812: L-STREAM         = '                                
                            L-STREAM                                            
           DISPLAY 'CAT812: L-BYP-DATECHK-SW = '                                
                            L-BYP-DATECHK-SW                                    
           ' (1=BYPASS DATE CHECK)'                                             
           DISPLAY 'CAT812: L-BYP-FILECHK-SW = '                                
                            L-BYP-FILECHK-SW                                    
           ' (1=BYPASS FILE CHECK. BYPASS EMPTY FILE,DB2 ABENDS.)'              
           DISPLAY 'CAT812: L-RERUN-SW       = '                                
                            L-RERUN-SW                                          
           ' (1=THIS IS A RERUN. ALLOW DUPES AND NOTFNDS.)'                     
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT812: DATE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT812: DATE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT812: FILE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT812: FILE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-RERUN                                                          
               DISPLAY ' '                                                      
               DISPLAY '*--------------------------------------------*'         
               DISPLAY 'CAT812: THIS IS A RERUN.'                               
               DISPLAY '*--------------------------------------------*'         
               DISPLAY ' '                                                      
           END-IF.                                                              
                                                                                
           MOVE 'CAT812'                  TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL ZBPDATES-PROGRAM USING BPDATES-PARAMETERS.                      
           MOVE BPD-PROC-DATE(1:4)        TO W-PROC-DT-YEAR.                    
           MOVE BPD-PROC-DATE(5:2)        TO W-PROC-DT-MM.                      
           MOVE BPD-PROC-DATE(7:2)        TO W-PROC-DT-DD.                      
           MOVE BPD-PROC-DATE             TO W-BPD-PROC-DATE.                   
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT812:       BPD-PROC-DATE= ' BPD-PROC-DATE                
                            ' W-BPD-PROC-DATE-X= ' W-BPD-PROC-DATE-X            
                                    ' W-PROC-DT= ' W-PROC-DT                    
           DISPLAY 'CAT812: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE          
           DISPLAY ' '.                                                         
                                                                                
           MOVE '000'                  TO BH-BROKER-NUMBER                      
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT812: INFILE   OPENED FOR INPUT.  STATUS = '              
                                              INFILE-STATUS                     
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT812: ERROR OPENING INFILE'                           
               DISPLAY 'CAT812: OPEN STATUS = ' INFILE-STATUS                   
               DISPLAY 'CAT812: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001 TO ABEND-CODE                                         
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           OPEN INPUT MFMSD.                                                    
           DISPLAY 'CAT812: MFMSD    OPENED FOR INPUT.  STATUS = '              
                                              MFMSD-STATUS                      
                                                                                
           IF  MFMSD-OKAY                                                       
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT812: ERROR OPENING MFMSD'                            
               DISPLAY 'CAT812: OPEN STATUS = ' MFMSD-STATUS                    
               DISPLAY 'CAT812: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001 TO ABEND-CODE                                         
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           OPEN INPUT BNWMAST.                                                  
           DISPLAY 'CAT812: BNWMAST  OPENED FOR INPUT.  STATUS = '              
                                              BNWMAST-STATUS                    
                                                                                
           IF  BNWMAST-OKAY                                                     
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT812: ERROR OPENING BNWMAST'                          
               DISPLAY 'CAT812: OPEN STATUS = ' BNWMAST-STATUS                  
               DISPLAY 'CAT812: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001 TO ABEND-CODE                                         
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           OPEN INPUT BNWREGOP.                                                 
           DISPLAY 'CAT812: BNWREGOP OPENED FOR INPUT.  STATUS = '              
                                              BNWREGOP-STATUS                   
                                                                                
           IF  BNWREGOP-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT812: ERROR OPENING BNWREGOP'                         
               DISPLAY 'CAT812: OPEN STATUS = ' BNWREGOP-STATUS                 
               DISPLAY 'CAT812: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001 TO ABEND-CODE                                         
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
DJ0009     OPEN INPUT MFEXBR.                                                   
DJ0009     DISPLAY 'CAT812: MFEXBR   OPENED FOR INPUT.  STATUS = '              
DJ0009                                        MFEXBR-STATUS                     
DJ0009                                                                          
DJ0009     IF  MFEXBR-OKAY                                                      
DJ0009         CONTINUE                                                         
DJ0009     ELSE                                                                 
DJ0009         DISPLAY 'CAT812: ERROR OPENING MFEXBR'                           
DJ0009         DISPLAY 'CAT812: OPEN STATUS = ' MFEXBR-STATUS                   
DJ0009         DISPLAY 'CAT812: U3001 - ABENDING ON BAD FILE STATUS'            
DJ0009         MOVE +3001    TO ABEND-CODE                                      
DJ0009         CALL ABEND-PROGRAM USING ABEND-CODE                              
DJ0009     END-IF.                                                              
                                                                                
           OPEN OUTPUT ACATRCRF.                                                
           DISPLAY 'CAT812: ACATRCRF OPENED FOR OUTPUT. STATUS = '              
                                               ACATRCRF-FILE-STATUS.            
                                                                                
           IF  ACATRCRF-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT812: ERROR OPENING ACATRCRF'                         
               DISPLAY 'CAT812: OPEN STATUS = ' ACATRCRF-FILE-STATUS            
                            '.  OUTPUT-CNT = ' W-OUTPUT-CNT                     
               DISPLAY 'CAT812: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001 TO ABEND-CODE                                         
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           OPEN OUTPUT ACATDLVF.                                                
           DISPLAY 'CAT812: ACATDLVF OPENED FOR OUTPUT. STATUS = '              
                                               ACATDLVF-FILE-STATUS.            
                                                                                
           IF  ACATDLVF-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT812: ERROR OPENING ACATDLVF'                         
               DISPLAY 'CAT812: OPEN STATUS = ' ACATDLVF-FILE-STATUS            
                            '.  OUTPUT-CNT = ' W-ACATDLVF-CNT                   
               DISPLAY 'CAT812: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001 TO ABEND-CODE                                         
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           MOVE ' '                      TO ACATRCRF-HDR-REC                    
           MOVE 'H'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
                                                                                
           CALL ZP2HDTR-PROGRAM       USING CP2-AREA                            
                                            ACATRCRF.                           
                                                                                
           MOVE CP2-RETURN-RECORD        TO OUT-HDR-REC                         
           DISPLAY 'CAT812: ACATRCRF-HDR= ' OUT-HDR-REC (1:090)                 
                                                                                
           WRITE OUT-RECORD.                                                    
           DISPLAY 'CAT812: ACATRCRF HEADER WRITTEN.    STATUS = '              
                                               ACATRCRF-FILE-STATUS.            
                                                                                
           MOVE ' '                      TO ACATDLVF-HEADER-RECORD              
           MOVE 'H'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
                                                                                
           CALL ZP2HDTR-PROGRAM       USING CP2-AREA                            
                                            ACATDLVF.                           
                                                                                
           MOVE CP2-RETURN-RECORD        TO ACATDLVF-HEADER-RECORD              
           DISPLAY 'CAT812: ACATDLVF-HDR= ' ACATDLVF-HEADER-RECORD              
                                                                                
           WRITE ACATDLVF-RECORD.                                               
           DISPLAY 'CAT812: ACATDLVF HEADER WRITTEN.    STATUS = '              
                                               ACATDLVF-FILE-STATUS.            
                                                                                
           PERFORM 1500-LOAD-B1 THRU 1500-EXIT.                                 
                                                                                
LRM002     MOVE  SPACES      TO NTWIO-PARAMETERS.                               
LRM002     MOVE  'CAT812'    TO NTWIO-PGM-NAME.                                 
LRM002     MOVE  'O'         TO NTWIO-FUNCTION-CODE.                            
LRM002     MOVE  'ALL'       TO NTWIO-REQUEST-TYPE.                             
LRM002     CALL  BNWNTWIO USING NTWIO-PARAMETERS.                               
                                                                                
           DISPLAY ' '.                                                         
                                                                                
LRM015     MOVE 'OPEN'                    TO TABLRQST-REQUEST                   
LRM015     MOVE 'ACATRCR'                 TO TABLRQST-TABLE-NAME                
LRM015                                                                          
LRM015     CALL TABLGET USING TABLRQST-COMMAREA                                 
LRM015                                                                          
LRM015     IF TABLRQST-RETURN-CODE = 'OK  '                                     
LRM015        NEXT SENTENCE                                                     
LRM015     ELSE                                                                 
LRM015        DISPLAY ' '                                                       
LRM015        DISPLAY '****************************************'                
LRM015        DISPLAY '*    TABLE FILE OPEN ERROR             *'                
LRM015        DISPLAY '*    DSN=SZ.ZZZ.TBLFILE  DD TABLFLE    *'                
LRM015        DISPLAY '*    TABLRQST-RT-CODE ' TABLRQST-RETURN-CODE             
LRM015        DISPLAY '*    CAT812 ABENDS                     *'                
LRM015        DISPLAY '****************************************'                
LRM015        MOVE +3002    TO ABEND-CODE                                       
LRM015        CALL ABEND-PROGRAM USING ABEND-CODE                               
LRM015     END-IF.                                                              
                                                                                
LRM015     MOVE 'NSCC#'                   TO TABLRQST-TABLE-KEY                 
LRM015     PERFORM 1100-LOAD-CONTRA-TABLE                                       
LRM015        UNTIL TABLRQST-RETURN-CODE NOT = 'OK  '                           
LRM015           OR WS-CONTRA-BLOCK-COUNT > 998.                                
LRM015     IF WS-CONTRA-BLOCK-COUNT > 998                                       
LRM015        DISPLAY '****************************************'                
LRM015        DISPLAY '*    TABLE PROCESSING OVERFLOW         *'                
LRM015        DISPLAY '*    NEED TO EXPAND WS-CONTRA-BLOCK    *'                
LRM015        DISPLAY '*    CAT812 ABENDS                     *'                
LRM015        DISPLAY '****************************************'                
LRM015        MOVE +3004    TO ABEND-CODE                                       
LRM015        CALL ABEND-PROGRAM USING ABEND-CODE                               
LRM015     END-IF.                                                              
                                                                                
LRM015     MOVE 'CLOS'                    TO TABLRQST-REQUEST                   
LRM015     MOVE 'ACATRCR'                 TO TABLRQST-TABLE-NAME                
LRM015                                                                          
LRM015     CALL TABLGET USING TABLRQST-COMMAREA                                 
LRM015                                                                          
LRM015     IF TABLRQST-RETURN-CODE = 'OK  '                                     
LRM015        NEXT SENTENCE                                                     
LRM015     ELSE                                                                 
LRM015        DISPLAY ' '                                                       
LRM015        DISPLAY '****************************************'                
LRM015        DISPLAY '*    TABLE FILE CLOSE ERROR            *'                
LRM015        DISPLAY '*    DSN=SZ.ZZZ.TBLFILE  DD TABLFLE    *'                
LRM015        DISPLAY '*    TABLRQST-RT-CODE ' TABLRQST-RETURN-CODE             
LRM015        DISPLAY '****************************************'                
LRM015     END-IF.                                                              
       1000-EXIT. EXIT.                                                         
      /                                                                         
LRM015 1100-LOAD-CONTRA-TABLE.                                                  
LRM015     IF WS-CONTRA-BLOCK-COUNT = ZERO                                      
LRM015        MOVE 'GETN'                TO TABLRQST-REQUEST                    
LRM015     ELSE                                                                 
LRM015        MOVE 'GETC'                TO TABLRQST-REQUEST                    
LRM015     END-IF.                                                              
                                                                                
LRM015     CALL  TABLGET  USING  TABLRQST-COMMAREA                              
LRM015                                                                          
LRM015     IF TABLRQST-RETURN-CODE = 'OK'                                       
LRM015         ADD 1 TO WS-CONTRA-BLOCK-COUNT                                   
LRM015         DISPLAY 'TABLGET RETURN CONTRA TO HOLD DLVY='                    
LRM015                  ' KEY=' TABLRQST-TABLE-KEY                              
LRM015                  ' DATA=' TABLRQST-RETURN-DATA(1:8)                      
LRM015         IF W-BPD-PROC-DATE >= TABLRQST-RETURN-DATA(1:8)                  
LRM015            MOVE TABLRQST-TABLE-KEY(1:4) TO                               
LRM015                      WS-CONTRA-BLOCK(WS-CONTRA-BLOCK-COUNT)              
LRM015            DISPLAY 'LOADED BRKR ' TABLRQST-TABLE-KEY(1:4)                
LRM015         END-IF                                                           
LRM015     END-IF.                                                              
      /                                                                         
       1500-LOAD-B1 SECTION.                                                    
           DISPLAY 'CAT812: 1500-LOAD-B1'.                                      
                                                                                
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
             IF   BH-BROKER-ACTIVE                                              
             AND  BH-ACAT-ACTIVE                                                
                   ADD 1 TO B1-TBL-CNT                                          
                   MOVE  BH-BROKER-NUMBER-N                                     
                                         TO B1-ADP-CL-NO  (B1-TBL-CNT)          
                   MOVE  BH-BROKER-NAME                                         
                                         TO B1-CLI-NAME   (B1-TBL-CNT)          
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
                   MOVE  BH-ACAT-STATUS                                         
                                         TO B1-ACAT-STATUS(B1-TBL-CNT)          
                   IF  B1-STREAM (B1-TBL-CNT) = L-STREAM                        
                       DISPLAY     'CNT=' B1-TBL-CNT                            
                                    ' CLT ' B1-ADP-CL-NO  (B1-TBL-CNT)          
                                        ' ' B1-CLI-NAME   (B1-TBL-CNT)          
                                    ' BKR ' B1-BKR-CLR-NO (B1-TBL-CNT)          
                                    ' STR ' B1-STREAM     (B1-TBL-CNT)          
                                    ' STA ' B1-STATUS     (B1-TBL-CNT)          
                                   ' ACAT ' B1-ACAT-STATUS(B1-TBL-CNT)          
DJ0002                         ' PEND ' BH-ACAT-RESID-CRD-DISPL-ONLINE          
                   END-IF                                                       
             END-IF                                                             
                                                                                
           END-PERFORM.                                                         
                                                                                
           DISPLAY ' '.                                                         
                                                                                
           DISPLAY  'B1 TABLE COUNT = ' B1-TBL-CNT.                             
           DISPLAY ' '.                                                         
       1500-EXIT. EXIT.                                                         
      /                                                                         
       2000-PROCESS-INPUT SECTION.                                              
           MOVE '2000-PROCESS-INPUT         ' TO W-ROUTINE-1.                   
                                                                                
       2000-LOOP.                                                               
                                                                                
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF END-OF-INPUT                                                      
           OR (INFILE-CLIENT NOT = W-HDR-TI-CLIENT)                             
           OR (INFILE-REC-ID = 'H')                                             
              PERFORM 3300-ACCOUNT-BREAK   THRU 3300-EXIT                       
           END-IF.                                                              
                                                                                
           IF END-OF-INPUT                                                      
              GO TO 2000-EXIT                                                   
           END-IF.                                                              
                                                                                
           IF (INFILE-CLIENT NOT = W-HDR-TI-CLIENT)                             
              PERFORM 3500-CLIENT-BREAK    THRU 3500-EXIT                       
              IF INFILE-REC-ID = 'H'                                            
                 PERFORM 5000-GET-TI          THRU 5000-EXIT                    
              ELSE                                                              
                 DISPLAY 'INP=' W-INFILE-CNT                                    
                         ' WARNING: NEXT RECORD SHOULD BE HEADER'               
                         ' BUT IT IS NOT'                                       
              END-IF                                                            
           ELSE                                                                 
              IF INFILE-REC-ID = 'H'                                            
                 PERFORM 5000-GET-TI          THRU 5000-EXIT                    
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF INFILE-REC-ID = 'T'                                               
              PERFORM 5100-GET-POSITIONS   THRU 5100-EXIT                       
              PERFORM 7000-WRITE-ACATRCRF  THRU 7000-EXIT                       
           END-IF.                                                              
                                                                                
           GO TO 2000-LOOP.                                                     
                                                                                
       2000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  IF FULL TRANSFER REQUEST, AND WE ARE THE DELIVERER,                    
      *     LOAD ASSETS                                                         
      ******************************************************************        
       3000-READ-INPUT SECTION.                                                 
           MOVE '3000-READ-INPUT            ' TO W-ROUTINE-1.                   
                                                                                
           READ INFILE                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INPUT-SW                     
                   MOVE HIGH-VALUES      TO ACATRCRF-KEY                        
                   DISPLAY 'CAT812: INFILE   END OF FILE REACHED'               
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           IF  INFILE-STATUS NOT = '00'                                         
               DISPLAY 'CAT812: READ INFILE   STATUS = ' INFILE-STATUS          
                       '.  ACATRCRF-CNT = ' W-ACATRCRF-CNT                      
                       '.  KEY = ' ACATRCRF-KEY                                 
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT812: U3009 - DD INFILE   READ ERR, '             
                           ' FILE STATUS = ' INFILE-STATUS                      
                   MOVE 3009      TO  ABEND-CODE                                
                   CALL ABEND-PROGRAM USING ABEND-CODE                          
           END-IF.                                                              
                                                                                
           ADD 1 TO W-INFILE-CNT.                                               
                                                                                
           IF  INFILE-HEADER-RECORD                                             
               DISPLAY 'INFILE-HDR= ' INFILE-HDR-REC (1:090)                    
               GO TO 3000-READ-INPUT                                            
           END-IF.                                                              
                                                                                
           IF  INFILE-TRAILER-RECORD                                            
               DISPLAY 'INFILE-TRL= ' INFILE-TRL-REC (1:090)                    
               GO TO 3000-READ-INPUT                                            
           END-IF.                                                              
           ADD 1 TO W-DETAIL-CNT.                                               
                                                                                
       3000-EXIT. EXIT.                                                         
      /                                                                         
       3300-ACCOUNT-BREAK       SECTION.                                        
           MOVE '3300-ACCOUNT-BREAK   ' TO W-ROUTINE-1.                         
                                                                                
           IF  W-ASSET-ADDED-FOR-THIS-ACCT-SW = 'Y'                             
                                                                                
      *******CREATE RCR TRANSFER REQUEST                                        
               PERFORM 6900-INSERT-ACTITRF THRU 6900-EXIT                       
                                                                                
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' WF-CLIENT-NBR                                     
                          ' ' WF-ACCT-DLVR-NBR (1:3)                            
                          ' ' WF-ACCT-DLVR-NBR (4:5)                            
                      ' CTL=' WF-ACAT-CONTROL-NBR                               
                       ' SD=' W-HDR-TI-STTLM-DT                                 
DJ0002                      ' LOADED'                                           
DJ0002                      ' PEND=' NSCC-PEND-CD OF DCLACTITRF                 
                            ' TRN=' TRANS-TYPE-CD OF DCLACTITRF                 
                            ' TRF=' TRNFR-TYPE-CD OF DCLACTITRF                 
                                                                                
               PERFORM 7100-WRITE-ACATDLVF-TYPE3 THRU 7100-EXIT                 
                                                                                
DJ0001*********PERFORM 8120-SQL-COMMIT THRU 8120-EXIT                           
                                                                                
           END-IF.                                                              
                                                                                
       3300-EXIT. EXIT.                                                         
      /                                                                         
       3500-CLIENT-BREAK   SECTION.                                             
                                                                                
           MOVE ' '                        TO BH-BROKER-HEADER-INFO             
                                              BH-ACAT-INFO                      
                                                                                
           MOVE INFILE-CLIENT    (2:3)     TO BH-BROKER-NUMBER                  
           MOVE '015'                      TO BH-LOGICAL-RECORD-CODE            
           MOVE '434500'                   TO BH-B2-INFO-ID                     
           CALL ZGETB1V-PROGRAM         USING BH-BROKER-HEADER-INFO,            
                                              BH-ACAT-INFO                      
           END-CALL.                                                            
                                                                                
           MOVE ' '                TO BH-MF-INFO.                               
           MOVE '537000'           TO BH-B2-INFO-ID                             
           CALL ZGETB1V-PROGRAM  USING BH-BROKER-HEADER-INFO                    
                                       BH-MF-INFO                               
           END-CALL.                                                            
                                                                                
           MOVE  ' '               TO  BH-MF3-INFO                              
           MOVE  '540000'          TO  BH-B2-INFO-ID                            
           CALL  ZGETB1V-PROGRAM USING BH-BROKER-HEADER-INFO                    
                                       BH-MF3-INFO                              
           END-CALL.                                                            
                                                                                
           MOVE BH-BROKER-OLD-CLEARING-HOUSE(2:4) TO W-CURRENT-BROKER           
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'NEW-CLIENT = ' BH-BROKER-NUMBER                             
                                       ' ' BH-BROKER-NAME                       
                               ' BRK-NO= ' BH-BROKER-OLD-CLEARING-HOUSE         
           DISPLAY 'CAT812: BH-ACAT-STATUS                 (434501) = '         
                            BH-ACAT-STATUS                                      
           DISPLAY 'CAT812: BH-ACAT-WH-ASSET-CONTRA-CUSIP  (434517) = '         
                            BH-ACAT-WH-ASSET-CONTRA-CUSIP                       
           IF  BH-ACAT-RESID-CRD-DISPL-ONLINE = '1'                             
           DISPLAY 'CAT812: BH-ACAT-RESID-CRD-DISPL-ONLINE (434536) = '         
                            BH-ACAT-RESID-CRD-DISPL-ONLINE                      
                            '  (AUTO-SUBMIT)'                                   
           ELSE                                                                 
           DISPLAY 'CAT812: BH-ACAT-RESID-CRD-DISPL-ONLINE (434536) = '         
                            BH-ACAT-RESID-CRD-DISPL-ONLINE                      
                            '  (HOLD)'                                          
           END-IF.                                                              
           DISPLAY 'CAT812: BH-ACAT-RESID-CRD-DEFLT-CODE   (434536) = '         
                            BH-ACAT-RESID-CRD-DEFLT-CODE                        
           DISPLAY 'CAT812: BH-ACAT-MF-FUND-SERV-CLIENT    (434606) = '         
                            BH-ACAT-MF-FUND-SERV-CLIENT                         
DJ0003     DISPLAY 'CAT812: BH-ACAT-MF-REG-FUND-ACCT       (434608) = '         
DJ0003                      BH-ACAT-MF-REG-FUND-ACCT                            
           DISPLAY 'CAT812: BH-ACAT-MF-REG-DIVD-PAYEE-IND  (434619) = '         
                            BH-ACAT-MF-REG-DIVD-PAYEE-IND                       
           DISPLAY 'CAT812: BH-ACAT-MF-REGIST-RECEIVE-BKR  (434636) = '         
                            BH-ACAT-MF-REGIST-RECEIVE-BKR                       
LRM001     DISPLAY 'CAT812: BH-MFN-STATUS                  (537501) = '         
LRM001                      BH-MFN-STATUS                                       
LRM001     DISPLAY 'CAT812: BH-MFN-OMNIBUS-NSCC-BOX-ACCT   (537596) = '         
LRM001                      BH-MFN-OMNIBUS-NSCC-BOX-ACCT                        
DJ0006     DISPLAY 'CAT812: BH-MF-SINGLE-FUND-ACCOUNT      (537486) = '         
DJ0006                      BH-MF-SINGLE-FUND-ACCOUNT                           
DJ0009     DISPLAY 'CAT812: BH-MF-EXBR-OPTION              (537483) = '         
DJ0009                      BH-MF-EXBR-OPTION                                   
LRM004     DISPLAY 'CAT812: BH-MFN-DST-MFE-NSCC-BOX-ACCT   (537601) = '         
LRM004                      BH-MFN-DST-MFE-NSCC-BOX-ACCT                        
LRM002     DISPLAY 'CAT812: BH-MFN-OMNIBUS-MULTI-PLAT-OPT  (537608) = '         
LRM002                      BH-MFN-OMNIBUS-MULTI-PLAT-OPT                       
           DISPLAY 'CAT812: BH-MF3-STATUS                  (540011) = '         
                            BH-MF3-STATUS                                       
           IF  BH-MF3-SUB-EXEC-BKR-REC-NO  NOT NUMERIC                          
               MOVE '0' TO BH-MF3-SUB-EXEC-BKR-REC-NO                           
           END-IF.                                                              
           DISPLAY 'CAT812: BH-MF3-SUB-EXEC-BKR-REC-NO     (540167) = '         
                            BH-MF3-SUB-EXEC-BKR-REC-NO                          
LRM011     DISPLAY 'CAT812: BH-MF3-PNC-SURPAS-BOX-ACCOUNT  (540238) = '         
LRM011                      BH-MF3-PNC-SURPAS-BOX-ACCOUNT                       
                                                                                
DJ0002**--B1#434536 6TH BYTE = 1 = AUTO-SUBMIT, PEND-CD = BLANK                 
           IF  BH-ACAT-RESID-CRD-DISPL-ONLINE = '1'                             
               MOVE ' '             TO W-BH-NSCC-PEND-CD                        
           ELSE                                                                 
               MOVE 'H'             TO W-BH-NSCC-PEND-CD                        
           END-IF.                                                              
                                                                                
LRM001     IF BH-MF-ACTIVE                                                      
LRM001     AND BH-MFN-OMNIBUS-NSCC-BOX-ACCT > SPACES                            
LRM001        MOVE BH-MFN-OMNIBUS-NSCC-BOX-ACCT TO NS-BRCH-ACCT-T               
LRM001        MOVE ' ' TO NS-CK                                                 
LRM001        CALL CKDIGIT USING NS-BRCH-ACCT-T                                 
LRM001                           W-CKDIGIT-LEN                                  
LRM001                           NS-CK                                          
LRM001     ELSE                                                                 
LRM001        MOVE SPACES     TO NS-BRCH-ACCT-TC                                
LRM001     END-IF.                                                              
                                                                                
LRM004     IF BH-MF-ACTIVE                                                      
LRM004     AND BH-MFN-DST-MFE-NSCC-BOX-ACCT > SPACE                             
LRM004        MOVE BH-MFN-DST-MFE-NSCC-BOX-ACCT TO WS-DST-BOX-ACCT-T            
LRM004        MOVE ' ' TO WS-DST-BOX-CK                                         
LRM004        CALL CKDIGIT USING WS-DST-BOX-ACCT-T                              
LRM004                           W-CKDIGIT-LEN                                  
LRM004                           WS-DST-BOX-CK                                  
LRM004     ELSE                                                                 
LRM004        MOVE SPACES     TO WS-DST-BOX-ACCT-TC                             
LRM004     END-IF.                                                              
                                                                                
LRM011     IF BH-MF3-ACTIVE                                                     
LRM011     AND BH-MF3-PNC-SURPAS-BOX-ACCOUNT NOT = SPACE                        
LRM011        MOVE BH-MF3-PNC-SURPAS-BOX-ACCOUNT TO WS-PNC-SURPAS-BOX-T         
LRM011        MOVE ' ' TO WS-PNC-SURPAS-CK                                      
LRM011        CALL  CKDIGIT  USING  WS-PNC-SURPAS-BOX-T                         
LRM011                              W-CKDIGIT-LEN                               
LRM011                              WS-PNC-SURPAS-CK                            
LRM011     ELSE                                                                 
LRM011        MOVE SPACES     TO WS-PNC-SURPAS-BOX-TC                           
LRM011     END-IF.                                                              
                                                                                
       3500-EXIT. EXIT.                                                         
      /                                                                         
       5000-GET-TI                   SECTION.                                   
                                                                                
           MOVE INFILE-RECORD             TO W-HDR-RECORD                       
           MOVE W-HDR-TI-CLIENT           TO WF-CLIENT-NBR                      
           MOVE W-HDR-TI-CONTROL-NBR      TO WF-ACAT-CONTROL-NBR                
           MOVE W-HDR-TI-SBMTG-PRTCP-NBR  TO WF-SBMTG-PRTCP-NBR                 
           MOVE W-HDR-TI-DLVR-NBR         TO WF-DLVR-NBR                        
           MOVE W-HDR-TI-ACCT-DLVR-NBR    TO WF-ACCT-DLVR-NBR                   
           MOVE W-HDR-TI-RCV-NBR          TO WF-RCV-NBR                         
           MOVE W-HDR-TI-ACCT-RCV-NBR     TO WF-ACCT-RCV-NBR                    
           MOVE W-HDR-TI-TRNFR-TYPE-CD    TO WF-TRNFR-TYPE-CD                   
           MOVE W-HDR-TI-TRANS-TYPE-CD    TO WF-TRANS-TYPE-CD                   
           MOVE W-HDR-TI-PRCS-DT          TO WF-PRCS-DT                         
           MOVE W-HDR-TI-DSTBN-SIDE-CD    TO WF-DSTBN-SIDE-CD.                  
           WRITE OUT-RECORD FROM W-HDR-TI-REC                                   
           ADD 1 TO W-OUTPUT-CNT                                                
           MOVE ' ' TO W-ASSET-ADDED-FOR-THIS-ACCT-SW.                          
DJ0005     MOVE ' ' TO W-OPT-ADDED-FOR-THIS-ACCT-SW.                            
                                                                                
DJ0002**--B1#434536 6TH BYTE = 1 = AUTO-SUBMIT, PEND-CD = BLANK                 
LRM013     IF (W-HDR-TI-RCV-NBR = '0201' OR '0733')                             
LRM009         MOVE 'H'             TO W-BH-NSCC-PEND-CD                        
LRM009     ELSE                                                                 
LRM015     MOVE ' '                 TO W-BH-NSCC-PEND-CD                        
LRM015     IF WS-CONTRA-BLOCK-COUNT > ZERO                                      
LRM015        PERFORM VARYING SUB1 FROM 1 BY 1                                  
LRM015                UNTIL SUB1 > WS-CONTRA-BLOCK-COUNT                        
LRM015                    OR W-BH-NSCC-PEND-CD = 'H'                            
LRM015           IF W-HDR-TI-RCV-NBR =  WS-CONTRA-BLOCK(SUB1)                   
LRM015              MOVE 'H'           TO W-BH-NSCC-PEND-CD                     
LRM015              DISPLAY 'TABL MATCH APPLIED TO HOLD '                       
LRM015                 W-HDR-TI-CLIENT ' ' W-HDR-TI-CONTROL-NBR                 
LRM015                                 ' ' W-HDR-TI-RCV-NBR                     
LRM015           END-IF                                                         
LRM015        END-PERFORM                                                       
LRM015     END-IF                                                               
LRM015     IF W-BH-NSCC-PEND-CD = 'H'                                           
LRM015        CONTINUE                                                          
LRM015     ELSE                                                                 
DJ0002     IF  BH-ACAT-RESID-CRD-DISPL-ONLINE = '1'                             
DJ0002         IF  W-HDR-ACCT-EXCEPTION                                         
DJ0002             MOVE 'H'             TO W-BH-NSCC-PEND-CD                    
DJ0002         ELSE                                                             
DJ0002             MOVE ' '             TO W-BH-NSCC-PEND-CD                    
DJ0002         END-IF                                                           
DJ0002     ELSE                                                                 
DJ0002         MOVE 'H'             TO W-BH-NSCC-PEND-CD                        
DJ0002     END-IF.                                                              
DJ0002     IF  W-HDR-ACCT-IS-NON-DEL                                            
DJ0002         ADD 1 TO W-TI-NON-DELIVERABLE-CNT                                
DJ0002     ELSE                                                                 
DJ0002       IF  W-HDR-ACCT-IS-SHORT                                            
DJ0002           ADD 1 TO W-TI-SHORT-CNT                                        
DJ0002       ELSE                                                               
DJ0002           IF  W-HDR-ACCT-EXCEPTION                                       
DJ0002           ADD 1 TO W-TI-EXCEPTION-CNT                                    
DJ0002       END-IF                                                             
DJ0002     END-IF.                                                              
                                                                                
       5000-EXIT. EXIT.                                                         
      /                                                                         
       5100-GET-POSITIONS            SECTION.                                   
                                                                                
           MOVE INFILE-RECORD             TO ACATRCRF-RECORD                    
           MOVE ACATRCRF-SECURITY            TO WF-SECURITY-ADP-NBR             
           MOVE ACATRCRF-CUSIP               TO WF-CUSIP                        
           MOVE ACATRCRF-SYMBOL              TO WF-SYMBOL                       
           MOVE ACATRCRF-DESC                TO WF-DESC                         
           MOVE 'US'                         TO WF-ISIN-CNTRY-CD                
           MOVE ACATRCRF-CUSIP               TO WF-ISIN-SEC-ISSUE-CD            
           MOVE ' '                          TO WF-ISIN-SEC-CDG-CD              
           MOVE ' '                          TO WF-CSH-MGN-SHRT-CD              
           MOVE ' '                          TO WF-STTLM-LCTN-CD                
           MOVE ' '                          TO WF-STTLM-RSN-CD                 
           MOVE ACATRCRF-ASSET-PRC-CTGY-CD   TO WF-ASSET-PRC-CTGY-CD            
           MOVE ACATRCRF-PSTN-CD             TO WF-PSTN-CD                      
           MOVE ACATRCRF-QTY                 TO WF-QTY                          
           MOVE ACATRCRF-AMT                 TO WF-AMT.                         
           MOVE ACATRCRF-QTY                 TO WORK-POS-QTY.                   
                                                                                
           IF  ACATRCRF-ACCT-IS-SHORT                                           
DJ0002         ADD 1 TO W-BYPASS-CNT                                            
               GO TO 5100-EXIT                                                  
           END-IF                                                               
                                                                                
DJ0002     IF  ACATRCRF-ACCT-EXCEPTION                                          
DJ0002         IF  ACATRCRF-NON-DELIVERABLE                                     
DJ0002             ADD 1 TO W-EXC-NON-CNT                                       
DJ0002         ELSE                                                             
DJ0002             ADD 1 TO W-EXC-DEL-CNT                                       
DJ0002         END-IF                                                           
DJ0002     END-IF.                                                              
                                                                                
DJ0002***--BYPASS NON-DELIVERABLES:                                             
DJ0002***--       DEBIT BALANCE (> 0), SMA,                                     
DJ0002***--       SHORT POSITION(< 0), RESTRICTED, MEMOS                        
DJ0002     IF  ACATRCRF-NON-DELIVERABLE                                         
DJ0002         ADD 1 TO W-BYPASS-CNT                                            
DJ0002         GO TO 5100-EXIT                                                  
DJ0002     END-IF.                                                              
                                                                                
DJ0002***--BYPASS RECORDS FOR CAT820 TYPE 3 PROCESSING                          
DJ0002     IF  ACATRCRF-SECURITY = ' CAT820'                                    
DJ0002         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0002              ' ' ACATRCRF-CLIENT                                         
DJ0002              ' ' ACATRCRF-BRANCH-CD                                      
DJ0002              ' ' ACATRCRF-ACCT-CD                                        
DJ0002                ' WRITE SETTLING TYPE3 RECORD'                            
DJ0002         ADD 1 TO W-BYPASS-CNT                                            
DJ0002         PERFORM 7150-WRITE-SETTLING-TYPE3 THRU 7150-EXIT                 
DJ0002         GO TO 5100-EXIT                                                  
DJ0002     END-IF.                                                              
DJ0002***--BYPASS RECORDS FOR SETTLEMENT DATE AND EQUITY EXCEPTIONS             
DJ0002     IF  ACATRCRF-EXCEPTION                                               
LRM014     OR  ACATRCRF-ACCT-DUPLICATE                                          
DJ0002         ADD 1 TO W-BYPASS-CNT                                            
DJ0002         GO TO 5100-EXIT                                                  
DJ0002     END-IF.                                                              
                                                                                
           IF ACATRCRF-LONG                                                     
              IF ACATRCRF-ASSET-IS-CASH                                         
                 PERFORM 5600-FORMAT-BALANCES THRU 5600-EXIT                    
              ELSE                                                              
                 PERFORM 5150-FORMAT-AND-LOAD-ASSET THRU 5150-EXIT              
              END-IF                                                            
           END-IF.                                                              
                                                                                
       5100-EXIT. EXIT.                                                         
      /                                                                         
       5150-FORMAT-AND-LOAD-ASSET    SECTION.                                   
                                                                                
           MOVE ' '                    TO MFMSD-REC                             
           MOVE ' '                    TO BNWREGOP-RECORD                       
           MOVE ' '                    TO BNWMAST-REC                           
           MOVE ' '                    TO W-BNWMAST-FND-SW                      
           MOVE ' '                    TO W-BNWREGOP-FND-SW                     
           MOVE ' '                    TO W-FUND-SERV-ELIGIBLE-SW               
           MOVE ' '                    TO W-LEGG-MASON-FUND-SW                  
           MOVE ' '                    TO NTW-HOUSE-ACCOUNT                     
           MOVE 'N'                    TO NTW-HOUSE-ACCT-SW                     
           MOVE 'N'                    TO NTW-OMNIBUS-ACCT-SW                   
LRM021     MOVE 'N'                    TO NTW-SHWB-ACCT-FLAG.                   
LRM001     SET NTW-NOT-NSCCSRC-ACCT      TO  TRUE.                              
                                                                                
           PERFORM 5700-FORMAT-ACTIAST       THRU 5700-EXIT                     
                                                                                
           IF  ACATRCRF-SEC-IND = 'O'                                           
               PERFORM 5800-FORMAT-OPT-RTN    THRU 5800-EXIT                    
           END-IF                                                               
                                                                                
           IF  BH-ACAT-MF-FUND-SERV-CLIENT = '1'                                
           AND (ACATRCRF-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                  
DJ0006         PERFORM 5155-CHECK-DIGIT THRU 5155-EXIT                          
               PERFORM 5910-MFMSD            THRU 5910-EXIT                     
               PERFORM 5920-BNWREGOP         THRU 5920-EXIT                     
               PERFORM 5930-GET-BNWMAST-INFO THRU 5930-EXIT                     
               IF (W-LEGG-MASON-FUND-SW NOT = 'Y')                              
               AND W-FUND-SERV-ELIGIBLE-SW = 'Y'                                
                   PERFORM 5940-FORMAT-MF-RTN  THRU 5940-EXIT                   
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF  ACATRCRF-REMOVE-FRAC-IND = 'F'                                   
               PERFORM 7200-WRITE-ACATDLVF-FRAC  THRU 7200-EXIT                 
           END-IF                                                               
                                                                                
           IF  ACATRCRF-QTY-LEFT > -.0001                                       
           AND ACATRCRF-QTY-LEFT <  .0001                                       
               MOVE ACATRCRF-QTY-LEFT        TO W-QTY-DISPLAY                   
               DISPLAY 'INP=' W-INFILE-CNT                                      
                    ' ' ACATRCRF-CLIENT                                         
                    ' ' ACATRCRF-BRANCH-CD                                      
                    ' ' ACATRCRF-ACCT-CD                                        
                    ' ' ACATRCRF-ACCOUNT-TYPE                                   
                    ' ' ACATRCRF-SECURITY                                       
                    ' ' ACATRCRF-ASSET-PRC-CTGY-CD                              
                      ' BYPASS: QTY(' W-QTY-DISPLAY ') < .0001'                 
                      ' REMOVE-FRAC= ' ACATRCRF-REMOVE-FRAC-IND                 
                      ' FRACTION= .' ACATRCRF-QTY-DECIMAL                       
               GO TO 5150-EXIT                                                  
           END-IF                                                               
                                                                                
           SET ACATRCRF-ASSET-LOADED TO TRUE                                    
DJ0002     MOVE W-BH-NSCC-PEND-CD    TO ACATRCRF-NSCC-PEND-CD                   
           PERFORM 6000-INSERT-ACTIAST       THRU 6000-EXIT                     
                                                                                
           IF  W-ACTIAST-INSERT-SW = 'Y'                                        
                                                                                
                 IF  ACATRCRF-SEC-IND = 'O'                                     
                     PERFORM 6100-INSERT-ACTIOPN    THRU 6100-EXIT              
                 ELSE                                                           
                                                                                
********** IF CLIENT IS A FUND/SERV CLIENT                                      
********** AND ASSET IS A MUTUAL FUND BASED ON MSD                              
********** LOOK UP FUND ELIGIBILITY ON MFMSD FILE                               
********** LOOK UP ON MF NETWORKING TABLE IF IT IS A LEGG MASON FUND            
                   IF  BH-ACAT-MF-FUND-SERV-CLIENT = '1'                        
                   AND (ACATRCRF-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')          
                                                                                
********** FUND MUST BE FUND/SERV ELIGIBLE                                      
********** BYPASS LEGG-MASON PROPRIETARY FUNDS                                  
                       IF (W-LEGG-MASON-FUND-SW NOT = 'Y')                      
                       AND W-FUND-SERV-ELIGIBLE-SW = 'Y'                        
                           PERFORM 6200-INSERT-ACTIMF THRU 6200-EXIT            
                       END-IF                                                   
                   END-IF                                                       
                 END-IF                                                         
           END-IF.                                                              
                                                                                
       5150-EXIT. EXIT.                                                         
      /                                                                         
       5155-CHECK-DIGIT     SECTION.                                            
                                                                                
DJ0006     IF  ACATRCRF-ACCOUNT             = W-CKDIGIT-BRN-ACCT                
DJ0006     AND ACATRCRF-ACCOUNT-TYPE(2 : 1) = W-CKDIGIT-TYPE                    
DJ0006         CONTINUE                                                         
DJ0006     ELSE                                                                 
DJ0006         MOVE ACATRCRF-ACCOUNT             TO W-CKDIGIT-BRN-ACCT          
DJ0006         MOVE ACATRCRF-ACCOUNT-TYPE(2 : 1) TO W-CKDIGIT-TYPE              
DJ0006         MOVE ' '        TO W-CKDIGIT-CK                                  
DJ0006         CALL CKDIGIT USING W-CKDIGIT-ACCT-T                              
DJ0006                            W-CKDIGIT-LEN                                 
DJ0006                            W-CKDIGIT-CK                                  
DJ0006         ADD 1 TO W-CKDIGIT-CNT                                           
DJ0006     END-IF                                                               
DJ0006     IF  BH-MF-SINGLE-FUND-ACCOUNT = '1'                                  
DJ0006     AND (W-CKDIGIT-BRN-ACCT-1 NOT = W-CKDIGIT-BRN-ACCT)                  
DJ0006         MOVE W-CKDIGIT-ACCT-TC TO W-CKDIGIT-ACCT-TC-1                    
DJ0006         IF W-CKDIGIT-TYPE = '1'                                          
DJ0006            CONTINUE                                                      
DJ0006         ELSE                                                             
DJ0006            MOVE '1'        TO W-CKDIGIT-TYPE-1                           
DJ0006            MOVE ' '        TO W-CKDIGIT-CK-1                             
DJ0006            CALL CKDIGIT USING W-CKDIGIT-ACCT-T-1                         
DJ0006                               W-CKDIGIT-LEN                              
DJ0006                               W-CKDIGIT-CK-1                             
DJ0006            ADD 1 TO W-CKDIGIT-CNT                                        
DJ0006            DISPLAY ' W-CKDIGIT-ACCT-TC=' W-CKDIGIT-ACCT-TC               
DJ0006                    ' W-CKDIGIT-ACCT-TC-1=' W-CKDIGIT-ACCT-TC-1           
DJ0006         END-IF                                                           
DJ0006     END-IF.                                                              
                                                                                
       5155-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  CREATE ASSET RECORD FOR BALANCE AMOUNTS                                
      *****************************************************************         
       5600-FORMAT-BALANCES SECTION.                                            
           MOVE '5600-FORMAT-BALANCES           ' TO W-ROUTINE-1.               
                                                                                
           INITIALIZE WF-ASSET-AREA.                                            
           MOVE ' '                                      TO DCLACTIAST          
                                                                                
           MOVE WF-CLIENT-NBR      TO CLIENT-NBR         OF DCLACTIAST          
           MOVE WF-ACCT-DLVR-NBR   TO ACCT-DLVR-NBR      OF DCLACTIAST          
           MOVE WF-ACCT-RCV-NBR    TO ACCT-RCV-NBR       OF DCLACTIAST          
                                                                                
           MOVE 01                 TO PHSCL-SEQ-NBR      OF DCLACTIAST          
           MOVE 01                 TO LGCL-SEQ-NBR       OF DCLACTIAST          
           MOVE 'A'                TO TRANS-TYPE-CD      OF DCLACTIAST          
           MOVE ' '                TO ACAT-CONTROL-NBR   OF DCLACTIAST          
           MOVE 'RCR'              TO TRNFR-TYPE-CD      OF DCLACTIAST          
           MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                              
                                   TO SBMTG-PRTCP-NBR    OF DCLACTIAST          
           MOVE WF-RCV-NBR         TO RCV-NBR            OF DCLACTIAST          
           MOVE WF-DLVR-NBR        TO DLVR-NBR           OF DCLACTIAST          
           MOVE WF-ACCT-DLVR-NBR   TO TRANS-RFRN-ID-CD   OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-SEQ-NBR      OF DCLACTIAST          
                                                                                
           MOVE '00'               TO OPTN-CTGY-CD       OF DCLACTIAST          
           MOVE '00'               TO STTLM-LCTN-CD      OF DCLACTIAST          
                                                                                
           MOVE ACATRCRF-DESC      TO ASSET-DESC-TXT     OF DCLACTIAST          
                                                                                
           IF  ACATRCRF-ASSET-IS-CASH                                           
               MOVE '40'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               IF  ACATRCRF-AMT > 0                                             
                   MOVE 'DEB'      TO STTLM-RSN-CD       OF DCLACTIAST          
               ELSE                                                             
                   MOVE 'CRED'     TO STTLM-RSN-CD       OF DCLACTIAST          
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF  ACATRCRF-ASSET-IS-SMA                                            
               MOVE '45'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE 'SMA'          TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
                                                                                
           IF  ACATRCRF-AMT > 0                                                 
               MOVE 'S'            TO PSTN-CD            OF DCLACTIAST          
           ELSE                                                                 
               MOVE 'L'            TO PSTN-CD            OF DCLACTIAST          
           END-IF                                                               
                                                                                
           MOVE ' '                TO ASSET-RQST-QTY-CD  OF DCLACTIAST          
           MOVE ' '                TO AST-RQST-TRANS-CD  OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-QTY          OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-PCT          OF DCLACTIAST          
                                                                                
           MOVE 'USD'              TO ISO-CRNCY-CD       OF DCLACTIAST          
           MOVE ACATRCRF-AMT       TO W-WORK-BAL-UNSIGN                         
           MOVE W-WORK-BAL-UNSIGN  TO ASSET-AMT          OF DCLACTIAST          
           MOVE ' '                TO BEARER-BOND-CD     OF DCLACTIAST          
                                                                                
           IF  ACATRCRF-CASH-ACCT                                               
               MOVE 'C'            TO CSH-MGN-SHRT-CD    OF DCLACTIAST          
           ELSE                                                                 
             IF  ACATRCRF-MRGN-ACCT                                             
                 MOVE 'M'          TO CSH-MGN-SHRT-CD    OF DCLACTIAST          
             ELSE                                                               
               IF  ACATRCRF-SHRT-ACCT                                           
                   MOVE 'S'        TO CSH-MGN-SHRT-CD    OF DCLACTIAST          
               END-IF                                                           
             END-IF                                                             
           END-IF                                                               
                                                                                
           MOVE ' '                TO WHI-CD             OF DCLACTIAST          
                                                                                
           IF  BH-ACAT-RESID-CRD-DEFLT-CODE > '00'                              
               MOVE BH-ACAT-RESID-CRD-DEFLT-CODE                                
                                   TO TRNFR-TYPE-RSN-CD  OF DCLACTIAST          
           ELSE                                                                 
               MOVE '10'           TO TRNFR-TYPE-RSN-CD  OF DCLACTIAST          
           END-IF                                                               
                                                                                
           MOVE W-PGM-NAME         TO PRGM-NM            OF DCLACTIAST          
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTIAST          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTIAST          
           MOVE W-BH-NSCC-PEND-CD  TO NSCC-PEND-CD       OF DCLACTIAST          
           MOVE ' '                TO NSCC-WTHLD-CD      OF DCLACTIAST          
                                                                                
           SET ACATRCRF-ASSET-LOADED TO TRUE                                    
DJ0002     MOVE W-BH-NSCC-PEND-CD    TO ACATRCRF-NSCC-PEND-CD                   
           PERFORM 6000-INSERT-ACTIAST THRU 6000-EXIT.                          
                                                                                
       5600-EXIT. EXIT.                                                         
      /                                                                         
       5700-FORMAT-ACTIAST SECTION.                                             
      *****************************************************************         
      *****    SETTLING LOCATION = 00, SETTLING REASON = ' '   DEFAULT          
      *****CNS SETTLING LOCATION = 05, SETTLING REASON = ' '                    
      *****MF  SETTLING LOCATION = 10, SETTLING REASON = ' '                    
      *****DTC SETTLING LOCATION = 25, SETTLING REASON = ' '                    
      *****OPT SETTLING LOCATION = 35, SETTLING REASON = 'OPT'                  
      *****************************************************************         
           MOVE '5700-FORMAT-ACTIAST           ' TO W-ROUTINE-1.                
                                                                                
           PERFORM 5790-FORMAT-COMMON-FIELDS THRU 5790-EXIT.                    
                                                                                
           IF  ACATRCRF-DTC-IND = 'D'                                           
               MOVE '25'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE ' '            TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
           IF  ACATRCRF-CNS-IND = 'C'                                           
               MOVE '05'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE ' '            TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
                                                                                
           IF  BH-ACAT-MF-FUND-SERV-CLIENT = '1'                                
           AND (ACATRCRF-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                  
               MOVE '10'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE ' '            TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
                                                                                
           IF  ACATRCRF-SEC-IND = 'O'                                           
               MOVE '35'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE 'OPT'          TO STTLM-RSN-CD       OF DCLACTIAST          
               MOVE 'XX'      TO ISIN-SEC-ISSUE-CD OF DCLACTIAST (1:2)          
               MOVE ACATRCRF-SECURITY                                           
                              TO ISIN-SEC-ISSUE-CD OF DCLACTIAST (3:7)          
           END-IF                                                               
                                                                                
ET0001     IF WF-CLIENT-NBR = '0039'                                            
ET0001        MOVE ACATRCRF-SECURITY TO W-PRIVATE-RANGE-FUNDS                   
ET0001        IF W-PRIV-RANGE-SECURITY                                          
ET0001           MOVE '50'     TO STTLM-LCTN-CD OF DCLACTIAST                   
ET0001           MOVE 'XSET'   TO STTLM-RSN-CD  OF DCLACTIAST                   
ET0001        END-IF                                                            
ET0001     END-IF.                                                              
ET0001                                                                          
           MOVE ' '                 TO NSCC-WTHLD-CD     OF DCLACTIAST          
           .                                                                    
       5700-EXIT. EXIT.                                                         
                                                                                
       5790-FORMAT-COMMON-FIELDS       SECTION.                                 
           MOVE '5790-FORMAT-COMMON-FIELDS      ' TO W-ROUTINE-1.               
                                                                                
           MOVE ACATRCRF-QTY-LEFT  TO W-ASSET-QTY-SIGN                          
                                      W-ASSET-QTY-UNSIGN                        
                                                                                
           MOVE ' '                                      TO DCLACTIAST          
                                                                                
           MOVE WF-CLIENT-NBR      TO CLIENT-NBR         OF DCLACTIAST          
           MOVE WF-ACCT-DLVR-NBR   TO ACCT-DLVR-NBR      OF DCLACTIAST          
           MOVE WF-ACCT-RCV-NBR    TO ACCT-RCV-NBR       OF DCLACTIAST          
           MOVE WF-SECURITY-ADP-NBR  TO SECURITY-ADP-NBR OF DCLACTIAST          
                                                                                
           MOVE 01                 TO PHSCL-SEQ-NBR      OF DCLACTIAST          
           MOVE 01                 TO LGCL-SEQ-NBR       OF DCLACTIAST          
           MOVE 'A'                TO TRANS-TYPE-CD      OF DCLACTIAST          
           MOVE ' '                TO ACAT-CONTROL-NBR   OF DCLACTIAST          
           MOVE 'RCR'              TO TRNFR-TYPE-CD      OF DCLACTIAST          
           MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                              
                                   TO SBMTG-PRTCP-NBR    OF DCLACTIAST          
           MOVE WF-RCV-NBR         TO RCV-NBR            OF DCLACTIAST          
           MOVE WF-DLVR-NBR        TO DLVR-NBR           OF DCLACTIAST          
           MOVE WF-ACCT-DLVR-NBR   TO TRANS-RFRN-ID-CD   OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-SEQ-NBR      OF DCLACTIAST          
           MOVE ACATRCRF-ASSET-PRC-CTGY-CD                                      
                                   TO ASSET-PRC-CTGY-CD  OF DCLACTIAST          
                                                                                
           IF  ACATRCRF-NON-OPT                                                 
               MOVE '00'           TO OPTN-CTGY-CD       OF DCLACTIAST          
           ELSE                                                                 
             IF  ACATRCRF-EQUITY-OPT                                            
                 MOVE '01'         TO OPTN-CTGY-CD       OF DCLACTIAST          
             ELSE                                                               
               IF  ACATRCRF-NON-EQU-OPT                                         
                   MOVE '02'       TO OPTN-CTGY-CD       OF DCLACTIAST          
               ELSE                                                             
                   MOVE '03'       TO OPTN-CTGY-CD       OF DCLACTIAST          
               END-IF                                                           
             END-IF                                                             
           END-IF                                                               
                                                                                
           MOVE '00'               TO STTLM-LCTN-CD      OF DCLACTIAST          
           MOVE ' '                TO STTLM-RSN-CD       OF DCLACTIAST          
                                                                                
LRM018     IF ACATRCRF-CUSIP > SPACES                                           
              MOVE 'US'               TO ISIN-CNTRY-CD     OF DCLACTIAST        
              MOVE ACATRCRF-CUSIP     TO ISIN-SEC-ISSUE-CD OF DCLACTIAST        
              MOVE ' '                TO ISIN-SEC-CDG-CD   OF DCLACTIAST        
LRM018     ELSE                                                                 
LRM018     IF ACATRCRF-ISIN GREATER SPACES                                      
LRM018        MOVE ACATRCRF-ISIN(1:2) TO ISIN-CNTRY-CD     OF DCLACTIAST        
LRM018        MOVE ACATRCRF-ISIN(3:8) TO ISIN-SEC-ISSUE-CD OF DCLACTIAST        
LRM018        MOVE ACATRCRF-ISIN(12:1)TO ISIN-SEC-CDG-CD   OF DCLACTIAST        
LRM018     END-IF.                                                              
                                                                                
           MOVE ACATRCRF-DESC      TO ASSET-DESC-TXT     OF DCLACTIAST          
                                                                                
           MOVE ' '                TO ASSET-RQST-QTY-CD  OF DCLACTIAST          
           MOVE ' '                TO AST-RQST-TRANS-CD  OF DCLACTIAST          
                                                                                
           MOVE W-ASSET-QTY-UNSIGN TO ASSET-QTY          OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-PCT          OF DCLACTIAST          
                                                                                
           IF  W-ASSET-QTY-SIGN < 0                                             
               MOVE 'S'            TO PSTN-CD            OF DCLACTIAST          
           ELSE                                                                 
               MOVE 'L'            TO PSTN-CD            OF DCLACTIAST          
           END-IF                                                               
                                                                                
           MOVE 'USD'              TO ISO-CRNCY-CD       OF DCLACTIAST          
                                                                                
***********IF  WORK-POS-VALUE = 0                                               
               IF  ACATRCRF-CLOSING-PRICE = 0                                   
                   COMPUTE WORK-POS-VALUE ROUNDED = W-ASSET-QTY-UNSIGN          
LRM046                   / 100                                                  
LRM046             IF  WORK-POS-VALUE < 1.00                                    
LRM046                 MOVE 1.00 TO WORK-POS-VALUE                              
LRM046             END-IF                                                       
               ELSE                                                             
                   COMPUTE WORK-POS-VALUE ROUNDED =                             
                           W-ASSET-QTY-UNSIGN * ACATRCRF-CLOSING-PRICE          
                   IF  ACATRCRF-OPTION                                          
                       COMPUTE WORK-POS-VALUE ROUNDED =                         
                                  WORK-POS-VALUE * ACATRCRF-OPT-FACTOR          
                   ELSE                                                         
                       IF  ACATRCRF-BOND                                        
                          COMPUTE WORK-POS-VALUE = WORK-POS-VALUE / 100         
                       END-IF                                                   
                   END-IF                                                       
               END-IF                                                           
***********END-IF                                                               
                                                                                
           IF  ACATRCRF-QTY-LEFT > -.0001                                       
           AND ACATRCRF-QTY-LEFT <  .0001                                       
               CONTINUE                                                         
           ELSE                                                                 
               IF WORK-POS-VALUE < .01                                          
                  MOVE WORK-POS-VALUE           TO W-AMT-DISPLAY                
                  DISPLAY 'INP=' W-INFILE-CNT                                   
                    ' ' ACATRCRF-CLIENT                                         
                    ' ' ACATRCRF-BRANCH-CD                                      
                    ' ' ACATRCRF-ACCT-CD                                        
                    ' ' ACATRCRF-ACCOUNT-TYPE                                   
                    ' ' ACATRCRF-SECURITY                                       
                    ' ' ACATRCRF-ASSET-PRC-CTGY-CD                              
                      ' AMT CHANGED TO .01'                                     
                      ' AMT=' W-AMT-DISPLAY                                     
                  MOVE .01 TO WORK-POS-VALUE                                    
               END-IF                                                           
           END-IF                                                               
                                                                                
           MOVE WORK-POS-VALUE     TO ASSET-AMT          OF DCLACTIAST          
                                                                                
           IF  ACATRCRF-BOND-IND = 'B'                                          
               MOVE 'B'            TO BEARER-BOND-CD     OF DCLACTIAST          
           ELSE                                                                 
               MOVE 'N'            TO BEARER-BOND-CD     OF DCLACTIAST          
           END-IF                                                               
                                                                                
           IF  (ACATRCRF-ACCOUNT-TYPE = '01' OR '03')                           
               MOVE 'C'            TO CSH-MGN-SHRT-CD    OF DCLACTIAST          
           ELSE                                                                 
             IF  (ACATRCRF-ACCOUNT-TYPE = '02')                                 
                 MOVE 'M'          TO CSH-MGN-SHRT-CD    OF DCLACTIAST          
             ELSE                                                               
      *******IF**(ACATRCRF-ACCOUNT-TYPE = '05')                                 
                 MOVE 'S'          TO CSH-MGN-SHRT-CD    OF DCLACTIAST          
             END-IF                                                             
           END-IF                                                               
                                                                                
           IF  ACATRCRF-WI-KEY = '1'                                            
               MOVE 'W'            TO WHI-CD             OF DCLACTIAST          
           ELSE                                                                 
               MOVE 'N'            TO WHI-CD             OF DCLACTIAST          
           END-IF                                                               
                                                                                
           IF  BH-ACAT-RESID-CRD-DEFLT-CODE > '00'                              
               MOVE BH-ACAT-RESID-CRD-DEFLT-CODE                                
                                   TO TRNFR-TYPE-RSN-CD  OF DCLACTIAST          
           ELSE                                                                 
               MOVE '10'           TO TRNFR-TYPE-RSN-CD  OF DCLACTIAST          
           END-IF                                                               
                                                                                
           MOVE W-PGM-NAME          TO PRGM-NM           OF DCLACTIAST          
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTIAST          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTIAST          
           MOVE W-BH-NSCC-PEND-CD   TO NSCC-PEND-CD      OF DCLACTIAST          
           MOVE ' '                 TO NSCC-WTHLD-CD     OF DCLACTIAST          
           .                                                                    
       5790-EXIT. EXIT.                                                         
      /                                                                         
       5800-FORMAT-OPT-RTN.                                                     
           MOVE '5800-FORMAT-OPT-RTN            ' TO W-ROUTINE-1.               
                                                                                
DJ0005     MOVE 'Y' TO W-OPT-ADDED-FOR-THIS-ACCT-SW                             
                                                                                
           MOVE ' '                                      TO DCLACTIOPN          
           MOVE CLIENT-NBR OF DCLACTIAST                                        
                                   TO CLIENT-NBR         OF DCLACTIOPN          
           MOVE RCV-NBR OF DCLACTIAST                                           
                                   TO RCV-NBR            OF DCLACTIOPN          
           MOVE DLVR-NBR OF DCLACTIAST                                          
                                   TO DLVR-NBR           OF DCLACTIOPN          
           MOVE ACCT-RCV-NBR OF DCLACTIAST                                      
                                   TO ACCT-RCV-NBR       OF DCLACTIOPN          
           MOVE ACCT-DLVR-NBR OF DCLACTIAST                                     
                                   TO ACCT-DLVR-NBR      OF DCLACTIOPN          
           MOVE STTLM-LCTN-CD OF DCLACTIAST                                     
                                   TO STTLM-LCTN-CD      OF DCLACTIOPN          
           MOVE ISIN-CNTRY-CD OF DCLACTIAST                                     
                                   TO ISIN-CNTRY-CD      OF DCLACTIOPN          
           MOVE ISIN-SEC-ISSUE-CD  OF DCLACTIAST                                
                                   TO ISIN-SEC-ISSUE-CD  OF DCLACTIOPN          
           MOVE ISIN-SEC-CDG-CD    OF DCLACTIAST                                
                                   TO ISIN-SEC-CDG-CD    OF DCLACTIOPN          
           MOVE CSH-MGN-SHRT-CD OF DCLACTIAST                                   
                                   TO CSH-MGN-SHRT-CD    OF DCLACTIOPN          
           MOVE SECURITY-ADP-NBR OF DCLACTIAST                                  
                                   TO SECURITY-ADP-NBR   OF DCLACTIOPN          
                                                                                
      ****REVERSE THE BUY/SELL SIGN FOR OCC                                     
           IF  WORK-POS-QTY < 0                                                 
*              MOVE 'B'             TO BS-CD             OF DCLACTIOPN          
           ELSE                                                                 
*              MOVE 'S'             TO BS-CD             OF DCLACTIOPN          
           END-IF                                                               
           MOVE ACATRCRF-PUT-CALL   TO PTCL-CD           OF DCLACTIOPN          
      ****OPEN/CLOSE IS ALWAYS CLOSE                                            
*          MOVE 'C'                 TO OPTN-OPN-CLSD-CD  OF DCLACTIOPN          
                                                                                
           MOVE ACATRCRF-OPT-SYM    TO SYM-CD            OF DCLACTIOPN          
           MOVE ACATRCRF-OPT-EXP-DT (1:4) TO W-DATE-YEAR                        
           MOVE ACATRCRF-OPT-EXP-DT (5:2) TO W-DATE-MM                          
           MOVE ACATRCRF-OPT-EXP-DT (7:2) TO W-DATE-DD                          
LRM007     IF W-DATE-MM < '01' OR > '12'                                        
LRM007        DISPLAY 'EXP DATE MM NG ' W-DATE-MM                               
LRM007        MOVE '12' TO W-DATE-MM                                            
LRM007     END-IF.                                                              
LRM007     IF W-DATE-DD < '01' OR > '31'                                        
LRM007        DISPLAY 'EXP DATE DD NG ' W-DATE-DD                               
LRM007        MOVE '31' TO W-DATE-DD                                            
LRM007     END-IF.                                                              
LRM007     IF W-DATE-YEAR NOT NUMERIC                                           
LRM007        DISPLAY 'EXP DATE YEAR NG ' W-DATE-YEAR                           
LRM007        MOVE '9999' TO W-DATE-YEAR                                        
LRM007     END-IF.                                                              
           MOVE W-DATE              TO EXPTN-DT          OF DCLACTIOPN          
                                                                                
LRM010     MOVE ACATRCRF-OPT-PRICE-NEW TO WK-MS-OPT-PRICE-NEW                   
LRM010     MOVE WK-MS-OPT-PRC-NEW  TO STPRC-INTEGER-AMT OF DCLACTIOPN           
LRM010     MOVE WK-MS-OPT-FRAC-NEW TO STPRC-FRCTN-AMT OF DCLACTIOPN             
                                                                                
ET0002**   MOVE WK-MS-OPT-FRAC-1    TO STPRC-FRCTN-AMT   OF DCLACTIOPN          
           MOVE ' '                 TO DLVR-OCC-NBR      OF DCLACTIOPN          
           MOVE 'C'                 TO OPTN-ACCT-TYPE-CD OF DCLACTIOPN          
           MOVE ' '                 TO ACCT-SUB-CD       OF DCLACTIOPN          
           MOVE ACATRCRF-DESC1      TO OPTN-CMNT-TXT     OF DCLACTIOPN          
                                                                                
           MOVE W-PGM-NAME          TO PRGM-NM           OF DCLACTIOPN          
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTIOPN          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTIOPN          
           MOVE W-BH-NSCC-PEND-CD  TO NSCC-PEND-CD       OF DCLACTIOPN          
DJ0004     MOVE ACAT-CONTROL-NBR   OF DCLACTIAST                                
DJ0004                             TO ACAT-CONTROL-NBR   OF DCLACTIOPN          
DJ0004     MOVE ASSET-SEQ-NBR      OF DCLACTIAST                                
DJ0004                             TO ASSET-SEQ-NBR      OF DCLACTIOPN          
DJ0004     MOVE TRNFR-TYPE-CD      OF DCLACTIAST                                
DJ0004                             TO TRNFR-TYPE-CD      OF DCLACTIOPN          
           .                                                                    
       5800-EXIT. EXIT.                                                         
      /                                                                         
       5910-MFMSD           SECTION.                                            
           MOVE '5910-MFMSD                    ' TO W-ROUTINE-1.                
                                                                                
DJ0009     MOVE 'N'          TO W-MFMSD-FND-SW                                  
           MOVE ' '                      TO W-FUND-SERV-ELIGIBLE-SW             
           MOVE ' '                      TO MFMSD-REC                           
           IF  ACATRCRF-SYMBOL > ' '                                            
               MOVE ACATRCRF-SYMBOL TO  MAIN-KEY                                
           ELSE                                                                 
               MOVE ACATRCRF-CUSIP  TO  MAIN-KEY                                
           END-IF.                                                              
                                                                                
           ADD 1 TO W-MFMSD-CNT                                                 
           READ MFMSD     INVALID KEY                                           
                MOVE 'N'         TO W-FUND-SERV-ELIGIBLE-SW                     
                DISPLAY '   MFMSD-NOTFND'                                       
                          ' FOR ' MAIN-KEY                                      
                        ' ' ACATRCRF-ASSET-PRC-CTGY-CD                          
                         '. NOT FUND SERV ELIGIBILE'                            
                GO  TO  5910-EXIT.                                              
                                                                                
           ADD 1 TO W-MFMSD-FND-CNT                                             
                                                                                
DJ0009     MOVE 'Y'          TO W-MFMSD-FND-SW                                  
           IF  NOT-FUND-SERV-ELIGIBLE                                           
               MOVE 'N'          TO W-FUND-SERV-ELIGIBLE-SW                     
               DISPLAY 'INP=' W-INFILE-CNT                                      
                   '    THIS MF IS NOT FUND SERV ELIGIBILE'                     
           ELSE                                                                 
               MOVE 'Y'          TO W-FUND-SERV-ELIGIBLE-SW                     
           END-IF.                                                              
                                                                                
       5910-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5920-BNWREGOP        SECTION.                                            
           MOVE '5920-BNWREGOP                 ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                    TO W-BNWREGOP-FND-SW                     
           MOVE ' '                    TO W-LEGG-MASON-FUND-SW                  
           MOVE ' '                    TO NTW-HOUSE-ACCOUNT                     
           MOVE 'N'                    TO NTW-HOUSE-ACCT-SW                     
           MOVE 'N'                    TO NTW-OMNIBUS-ACCT-SW                   
LRM021     MOVE 'N'                    TO NTW-SHWB-ACCT-FLAG.                   
           MOVE ' '                    TO BNWREGOP-RECORD                       
           MOVE ACATRCRF-CLIENT-N      TO CLIENT-NO OF BNWREGOP-RECORD          
           MOVE ACATRCRF-CUSIP         TO CUSIP-9   OF BNWREGOP-RECORD          
                                                                                
           ADD 1 TO W-BNWREGOP-CNT                                              
           READ BNWREGOP  INVALID KEY                                           
                MOVE 'N'         TO W-BNWREGOP-FND-SW                           
                MOVE 'N'         TO W-LEGG-MASON-FUND-SW                        
                GO TO 5920-EXIT.                                                
                                                                                
           ADD 1 TO W-BNWREGOP-FND-CNT                                          
           MOVE 'Y'         TO W-BNWREGOP-FND-SW                                
                                                                                
           IF  PROCESSING-CODE OF BNWREGOP-RECORD = 'L'                         
               MOVE 'Y'         TO W-LEGG-MASON-FUND-SW                         
               DISPLAY 'INP=' W-INFILE-CNT                                      
                       ' LEGG-MASON FUND FOUND'                                 
               ADD 1 TO W-LEGG-CNT                                              
           ELSE                                                                 
               MOVE 'N'         TO W-LEGG-MASON-FUND-SW                         
           END-IF.                                                              
                                                                                
           IF REG-OP-HOUSE-ACCT > SPACES                                        
              MOVE REG-OP-HOUSE-ACCT     TO  NTW-HOUSE-ACCOUNT                  
              SET NTW-HOUSE-ACCT         TO  TRUE                               
           END-IF                                                               
                                                                                
LRM002     IF (OMNIBUS-PROCESSING OF BNWREGOP-RECORD                            
LRM004             OR DST-DIRECT  OF BNWREGOP-RECORD                            
LRM011             OR PNC-SURPAS-PROCESSING OF BNWREGOP-RECORD)                 
LRM002     AND BH-MFN-OMNIBUS-MULTI-PLAT-OPT  =  '1'                            
LRM002         MOVE 'R'                   TO NTWIO-FUNCTION-CODE                
LRM002         MOVE WF-CLIENT-NBR(2 : 3)  TO NTWIO-CLIENT                       
LRM002         MOVE ACATRCRF-CUSIP        TO NTWIO-CUSIP-9                      
LRM002         IF  ACATRCRF-SYMBOL > SPACES                                     
LRM002             MOVE ACATRCRF-SYMBOL   TO NTWIO-SYMBOL                       
LRM002         ELSE                                                             
LRM002             MOVE ACATRCRF-CUSIP    TO NTWIO-SYMBOL                       
LRM002         END-IF                                                           
DJ0006         MOVE W-CKDIGIT-ACCT-TC        TO NTWIO-ACCT-ID                   
LRM002         DISPLAY 'CALLING NTWIO WITH ' NTWIO-REQUEST-PARAMETERS           
LRM002         CALL  BNWNTWIO  USING NTWIO-PARAMETERS                           
LRM002         IF NTWIO-RETURN-OK                                               
LRM002            MOVE NTWIO-PROCESSING-CODE                                    
LRM002              TO PROCESSING-CODE OF BNWREGOP-RECORD                       
LRM002            DISPLAY 'BNWNTWIO OVERRIDE PROCESS CODE TO '                  
LRM002                 NTWIO-PROCESSING-CODE                                    
LRM002         ELSE                                                             
LRM002            DISPLAY 'NTWIO FAILED ' NTWIO-RETURN-CODE                     
LRM002         END-IF                                                           
LRM002     END-IF.                                                              
                                                                                
           IF OMNIBUS-PROCESSING OF BNWREGOP-RECORD                             
               ADD 1 TO W-OMNIBUS-CNT                                           
              SET NTW-OMNIBUS-ACCT       TO  TRUE                               
           END-IF.                                                              
                                                                                
LRM004     IF DST-DIRECT         OF BNWREGOP-RECORD                             
LRM004         ADD 1 TO W-DST-MFE-CNT                                           
LRM004        SET NTW-DST-MFE-ACCT TO TRUE                                      
LRM004     END-IF.                                                              
LRM011     IF PNC-SURPAS-PROCESSING OF BNWREGOP-RECORD                          
LRM011         ADD 1 TO W-PNC-SURPAS-CNT                                        
LRM011         SET NTW-PNC-SURPAS-ACCT TO TRUE                                  
LRM011     END-IF.                                                              
                                                                                
LRM001     IF TBL-MNT-SOURCE-NSCC                                               
LRM001        SET NTW-NSCCSRC-ACCT          TO  TRUE                            
LRM001     END-IF.                                                              
                                                                                
LRM021     IF TBL-MNT-SOURCE-SHWB                                               
LRM021        DISPLAY 'HAVE SHWB ON TBL MAINT ' ACATRCRF-CUSIP                  
LRM021        SET NTW-SHWB-ACCT          TO  TRUE                               
LRM021     END-IF.                                                              
                                                                                
       5920-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5930-GET-BNWMAST-INFO.                                                   
                                                                                
           MOVE ' '                      TO W-BNWMAST-FND-SW                    
           MOVE SPACES                   TO W-BNWMAST-KEY                       
           MOVE ZEROES                   TO W-BNWMAST-ACCT-ID                   
           MOVE ACATRCRF-CLIENT-N        TO W-BNWMAST-CLT-NO                    
                                            W-BNWMAST-CLT                       
           MOVE ACATRCRF-CUSIP           TO W-BNWMAST-CUSIP                     
           MOVE ACATRCRF-BRANCH-CD       TO W-BNWMAST-BRN-3                     
           MOVE ACATRCRF-ACCT-CD         TO W-BNWMAST-ACCT-5                    
LRM019     IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                                   
LRM019     AND ACATRCRF-ACCOUNT-TYPE (2:1) NOT = '1'                            
LRM019        MOVE '1'                      TO W-BNWMAST-TYPE                   
LRM019        MOVE W-CKDIGIT-CK-1           TO W-BNWMAST-CHK                    
LRM019        DISPLAY 'USE TYPE1 ON NTWMAST READ ' W-BNWMAST-KEY                
LRM019     ELSE                                                                 
ET0003        MOVE ACATRCRF-ACCOUNT-TYPE (2:1)                                  
ET0003                                      TO W-BNWMAST-TYPE                   
              MOVE W-CKDIGIT-CK             TO W-BNWMAST-CHK                    
LRM019     END-IF.                                                              
           MOVE 0                        TO W-BNWMAST-PAYABLE-SEQ-NO            
                                                                                
           MOVE SPACES                   TO BNWMAST-REC                         
           MOVE W-BNWMAST-KEY            TO MAST-KEY-AREA                       
                                                                                
           READ BNWMAST.                                                        
                                                                                
           ADD 1 TO W-BNWMAST-CNT                                               
                                                                                
           IF  BNWMAST-OKAY                                                     
               MOVE 'Y'               TO W-BNWMAST-FND-SW                       
               ADD 1 TO W-BNWMAST-FND-CNT                                       
               DISPLAY 'INP=' W-INFILE-CNT                                      
                   '    BNWMAST-FND'                                            
                            ' FOR ' MAST-KEY-AREA                               
                            ' LEVEL=' MATRIX-LEVEL                              
           ELSE                                                                 
               IF BNWMAST-END-OF-FILE                                           
               OR BNWMAST-NOT-FOUND                                             
                  MOVE 'N'                 TO W-BNWMAST-FND-SW                  
LRM020                                        W-VMFHSTY-FND-SW                  
LRM020            PERFORM 5935-READ-VMFHSTY-RTN                                 
LRM920               THRU 5935-EXIT                                             
               ELSE                                                             
                  DISPLAY ' ** CAT812 - BNWMAST FILE, READ ERROR'               
                          ' FILE-STATUS = ' BNWMAST-STATUS                      
                  DISPLAY 'MAST-KEY-AREA = ' MAST-KEY-AREA                      
                  MOVE +3999 TO ABEND-CODE                                      
                  CALL ABEND-PROGRAM USING ABEND-CODE                           
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5930-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
LRM020 5935-READ-VMFHSTY-RTN.                                                   
           MOVE '5935-READ-VMFHSTY-RTN           ' TO W-ROUTINE-1.              
      * FIRST READ VASTHSTY TO OBTAIN THE SEQ NBR FOR A SETTLE LOC 10           
      * ASSET FOR THIS ADP NUMBER.  USE THIS A KEY TO VMFHSTY.                  
                                                                                
           EXEC SQL                                                             
               SELECT                                                           
                   ASSET_SEQ_NBR                                                
                 INTO                                                           
                   :DCLVASTHSTY.ASSET-SEQ-NBR                                   
                 FROM                                                           
                   VASTHSTY                                                     
              WHERE  CLIENT_NBR        = :W-HDR-TI-CLIENT                       
                AND  ACAT_CONTROL_NBR  = :W-HDR-TI-CONTROL-NBR                  
                AND  SECURITY_ADP_NBR  = :ACATRCRF-SECURITY                     
                AND  STTLM_LCTN_CD     = '10'                                   
           END-EXEC.                                                            
                                                                                
           IF  SQLCODE  =  +0 OR -811                                           
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'VASTHSTY NOT FOUND FOR '                                
                                 W-HDR-TI-CLIENT                                
                             ' ' W-HDR-TI-CONTROL-NBR                           
                             ' ' ACATRCRF-SECURITY                              
               GO TO 5935-EXIT                                                  
           END-IF.                                                              
                                                                                
           EXEC SQL                                                             
               SELECT                                                           
                   FNBR                                                         
                  ,BK_PHSCL_SHR_CD                                              
                  ,NTWRK_CNTL_CD                                                
                  ,ACCT_TYPE_CD                                                 
                  ,DVDND_CD                                                     
                  ,LTCG_CD                                                      
                  ,STCG_CD                                                      
                  ,DVDND_PAYEE_CD                                               
                 INTO                                                           
                   :DCLVMFHSTY.FNBR                                             
                  ,:DCLVMFHSTY.BK-PHSCL-SHR-CD                                  
                  ,:DCLVMFHSTY.NTWRK-CNTL-CD                                    
                  ,:DCLVMFHSTY.ACCT-TYPE-CD                                     
                  ,:DCLVMFHSTY.DVDND-CD                                         
                  ,:DCLVMFHSTY.LTCG-CD                                          
                  ,:DCLVMFHSTY.STCG-CD                                          
                  ,:DCLVMFHSTY.DVDND-PAYEE-CD                                   
                 FROM                                                           
                   VMFHSTY                                                      
              WHERE  CLIENT_NBR        = :W-HDR-TI-CLIENT                       
                AND  ACAT_CONTROL_NBR  = :W-HDR-TI-CONTROL-NBR                  
                AND  ASSET_SEQ_NBR     = :DCLVASTHSTY.ASSET-SEQ-NBR             
           END-EXEC.                                                            
                                                                                
           MOVE 'VMFHSTY'                TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
LRM020         SET W-VMFHSTY-FOUND TO TRUE                                      
               ADD 1 TO W-VMFHSTY-FOUND-CNT                                     
TEST           DISPLAY 'FND FNBR ON VMFHSTY '                                   
TEST              FNBR OF DCLVMFHSTY  ' '    W-HDR-TI-CONTROL-NBR               
           ELSE                                                                 
               ADD 1 TO W-VMFHSTY-NOTFND-CNT                                    
           END-IF.                                                              
LRM020 5935-EXIT.                                                               
LRM020     EXIT.                                                                
      /                                                                         
       5940-FORMAT-MF-RTN.                                                      
           MOVE '5940-FORMAT-MF-RTN             ' TO W-ROUTINE-1.               
                                                                                
           MOVE ' '                                      TO DCLACTIMF           
           MOVE CLIENT-NBR OF DCLACTIAST                                        
                                   TO CLIENT-NBR         OF DCLACTIMF           
           MOVE RCV-NBR OF DCLACTIAST                                           
                                   TO RCV-NBR            OF DCLACTIMF           
           MOVE DLVR-NBR OF DCLACTIAST                                          
                                   TO DLVR-NBR           OF DCLACTIMF           
           MOVE ACCT-RCV-NBR OF DCLACTIAST                                      
                                   TO ACCT-RCV-NBR       OF DCLACTIMF           
           MOVE ACCT-DLVR-NBR OF DCLACTIAST                                     
                                   TO ACCT-DLVR-NBR      OF DCLACTIMF           
           MOVE STTLM-LCTN-CD OF DCLACTIAST                                     
                                   TO STTLM-LCTN-CD      OF DCLACTIMF           
           MOVE ISIN-CNTRY-CD OF DCLACTIAST                                     
                                   TO ISIN-CNTRY-CD      OF DCLACTIMF           
           MOVE ISIN-SEC-ISSUE-CD OF DCLACTIAST                                 
                                   TO ISIN-SEC-ISSUE-CD  OF DCLACTIMF           
           MOVE ISIN-SEC-CDG-CD OF DCLACTIAST                                   
                                   TO ISIN-SEC-CDG-CD    OF DCLACTIMF           
           MOVE CSH-MGN-SHRT-CD OF DCLACTIAST                                   
                                   TO CSH-MGN-SHRT-CD    OF DCLACTIMF           
           MOVE SECURITY-ADP-NBR OF DCLACTIAST                                  
                                   TO SECURITY-ADP-NBR   OF DCLACTIMF           
           MOVE WF-DSTBN-SIDE-CD   TO DSTBN-SIDE-CD      OF DCLACTIMF           
           MOVE WF-PRCS-DT          TO PRCS-DT           OF DCLACTIMF           
           MOVE W-PGM-NAME          TO PRGM-NM           OF DCLACTIMF           
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTIMF           
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTIMF.          
                                                                                
      ***FUND CUSTOMER ACCOUNT NUMBER -                                         
      ***FNBR - DEFAULT = HOUSE ACCOUNT FROM TABLE MAINTENANCE                  
           MOVE NTW-HOUSE-ACCOUNT        TO FNBR OF DCLACTIMF                   
LRM011     IF  PROCESSING-CODE OF BNWREGOP-RECORD = 'O' OR 'P'                  
               CONTINUE                                                         
           ELSE                                                                 
             IF W-BNWMAST-FOUND                                                 
               IF (MATRIX-LEVEL = '1' OR '2' OR '3' OR '4')                     
DJ0006          IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                              
DJ0006            MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
DJ0006                                      TO FNBR OF DCLACTIMF (1:3)          
DJ0006            MOVE W-CKDIGIT-ACCT-TC-1  TO FNBR OF DCLACTIMF (4:10)         
DJ0006          ELSE                                                            
DJ0006            MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
DJ0006                                      TO FNBR OF DCLACTIMF (1:3)          
DJ0006            MOVE W-CKDIGIT-ACCT-TC    TO FNBR OF DCLACTIMF (4:10)         
DJ0006          END-IF                                                          
               ELSE                                                             
                 IF MATRIX-LEVEL = '6'                                          
                    MOVE CUST-ACCT-NO       TO FNBR OF DCLACTIMF                
                 END-IF                                                         
               END-IF                                                           
LRM020       ELSE                                                               
LRM020         IF W-VMFHSTY-FOUND                                               
LRM020            MOVE FNBR OF DCLVMFHSTY  TO FNBR OF DCLACTIMF                 
TEST              DISPLAY 'FNBR MOVE ORIG ' FNBR OF DCLVMFHSTY                  
TEST                      ' ' W-HDR-TI-CONTROL-NBR                              
LRM020         END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
           IF  FNBR OF DCLACTIMF = ' '                                          
DJ0006         IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                               
DJ0006            MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
DJ0006                                      TO FNBR OF DCLACTIMF (1:3)          
DJ0006            MOVE W-CKDIGIT-ACCT-TC-1  TO FNBR OF DCLACTIMF (4:10)         
TEST              DISPLAY 'FNBR WAS BLANK TC-1 ' FNBR OF DCLACTIMF              
DJ0006         ELSE                                                             
                  MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
                                            TO FNBR OF DCLACTIMF (1:3)          
                  MOVE W-CKDIGIT-ACCT-TC    TO FNBR OF DCLACTIMF (4:10)         
TEST              DISPLAY 'FNBR WAS BLANK TC   ' FNBR OF DCLACTIMF              
DJ0006         END-IF                                                           
           END-IF.                                                              
                                                                                
DJ0003***FUND ACCOUNT NUMBER                                                    
DJ0003***B1#434608 1 = BBBAAAAATC                                               
DJ0003     IF  BH-ACAT-MF-REG-FUND-ACCT = '1'                                   
DJ0006         IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                               
DJ0006            MOVE W-CKDIGIT-ACCT-TC-1  TO FNBR OF DCLACTIMF (1:10)         
TEST              DISPLAY 'FNBR AFTER TC-1     ' FNBR OF DCLACTIMF              
DJ0006         ELSE                                                             
DJ0003            MOVE W-CKDIGIT-ACCT-TC    TO FNBR OF DCLACTIMF (1:10)         
TEST              DISPLAY 'FNBR AFTER TC       ' FNBR OF DCLACTIMF              
DJ0006         END-IF                                                           
DJ0003     END-IF.                                                              
                                                                                
      ***BOOK/PHYSICAL SHARE INDICATOR -                                        
      ***BK-PHSCL-SHR-CD - DEFAULT = 1                                          
           MOVE '1'                    TO BK-PHSCL-SHR-CD OF DCLACTIMF          
           IF  NTW-HOUSE-ACCOUNT = ' '                                          
             IF W-BNWMAST-FOUND                                                 
               IF  MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'                      
                   MOVE '0'            TO BK-PHSCL-SHR-CD OF DCLACTIMF          
               END-IF                                                           
LRM020       ELSE                                                               
LRM020         IF W-VMFHSTY-FOUND                                               
LRM020            MOVE BK-PHSCL-SHR-CD OF DCLVMFHSTY TO                         
LRM020                 BK-PHSCL-SHR-CD OF DCLACTIMF                             
LRM020         END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
      ***NETWORK CONTROL INDICATOR -                                            
      ***NTWRK-CNTL-CD   - DEFAULT = 0                                          
           MOVE '0'                     TO NTWRK-CNTL-CD  OF DCLACTIMF          
           IF  NTW-HOUSE-ACCOUNT = ' '                                          
             IF W-BNWMAST-FOUND                                                 
               IF  MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'                      
                   MOVE MATRIX-LEVEL    TO NTWRK-CNTL-CD  OF DCLACTIMF          
               END-IF                                                           
LRM020       ELSE                                                               
LRM020         IF W-VMFHSTY-FOUND                                               
LRM020            MOVE NTWRK-CNTL-CD OF DCLVMFHSTY TO                           
LRM020                 NTWRK-CNTL-CD OF DCLACTIMF                               
LRM020         END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
      ***ACCOUNT TYPE INDICATOR -                                               
      ***ACCT-TYPE-CD    - DEFAULT = 1                                          
           MOVE  '1'                    TO ACCT-TYPE-CD   OF DCLACTIMF          
           IF  NTW-HOUSE-ACCOUNT NOT = ' '                                      
LRM021     OR NTW-SHWB-ACCT                                                     
               MOVE  '2'                TO ACCT-TYPE-CD   OF DCLACTIMF          
           ELSE                                                                 
             IF W-BNWMAST-FOUND                                                 
               IF  MATRIX-LEVEL = '3'                                           
                   MOVE  '2'            TO ACCT-TYPE-CD   OF DCLACTIMF          
               END-IF                                                           
LRM020       ELSE                                                               
LRM020         IF W-VMFHSTY-FOUND                                               
LRM020            MOVE ACCT-TYPE-CD  OF DCLVMFHSTY TO                           
LRM020                 ACCT-TYPE-CD  OF DCLACTIMF                               
LRM020         END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
      ***DIVIDEND CODE -                                                        
      ***DVDND-CD        - DEFAULT = 1 = R,R,R                                  
           MOVE 'R'    TO DVDND-CD OF DCLACTIMF                                 
           MOVE 'R'    TO LTCG-CD  OF DCLACTIMF                                 
           MOVE 'R'    TO STCG-CD  OF DCLACTIMF                                 
           IF  W-BNWMAST-FOUND                                                  
                EVALUATE DIVIDEND-CODE                                          
                    WHEN '0'                                                    
                            MOVE 'C'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'C'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'C'    TO STCG-CD  OF DCLACTIMF                
                    WHEN '1'                                                    
                            MOVE 'R'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'R'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'R'    TO STCG-CD  OF DCLACTIMF                
                    WHEN '2'                                                    
                            MOVE 'C'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'C'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'R'    TO STCG-CD  OF DCLACTIMF                
                    WHEN '3'                                                    
                            MOVE 'C'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'R'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'R'    TO STCG-CD  OF DCLACTIMF                
                    WHEN '4'                                                    
                            MOVE 'C'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'R'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'C'    TO STCG-CD  OF DCLACTIMF                
                    WHEN '5'                                                    
                            MOVE 'R'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'C'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'C'    TO STCG-CD  OF DCLACTIMF                
                    WHEN '6'                                                    
                            MOVE 'R'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'R'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'C'    TO STCG-CD  OF DCLACTIMF                
                    WHEN '7'                                                    
                            MOVE 'R'    TO DVDND-CD OF DCLACTIMF                
                            MOVE 'C'    TO LTCG-CD  OF DCLACTIMF                
                            MOVE 'R'    TO STCG-CD  OF DCLACTIMF                
                END-EVALUATE                                                    
LRM020       ELSE                                                               
LRM020         IF W-VMFHSTY-FOUND                                               
LRM020            MOVE DVDND-CD   OF DCLVMFHSTY TO                              
LRM020                 DVDND-CD   OF DCLACTIMF                                  
LRM020            MOVE LTCG-CD    OF DCLVMFHSTY TO                              
LRM020                 LTCG-CD    OF DCLACTIMF                                  
LRM020            MOVE STCG-CD    OF DCLVMFHSTY TO                              
LRM020                 STCG-CD    OF DCLACTIMF                                  
LRM020         END-IF                                                           
           END-IF.                                                              
                                                                                
      ***DIVIDEND PAYEE INDICATOR -                                             
      ***DVDND-PAYEE-CD  - DEFAULT = N                                          
           MOVE 'N'                     TO DVDND-PAYEE-CD OF DCLACTIMF          
           IF  NTW-HOUSE-ACCOUNT NOT = ' '                                      
LRM021     OR NTW-SHWB-ACCT                                                     
               MOVE '1'                 TO DVDND-PAYEE-CD OF DCLACTIMF          
           ELSE                                                                 
             IF W-BNWMAST-FOUND                                                 
                IF MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'                      
                   IF PAYABLE-INFO-INDICATOR  = '0'                             
                      MOVE '0'          TO DVDND-PAYEE-CD OF DCLACTIMF          
                   ELSE                                                         
                      IF PAYABLE-INFO-INDICATOR  = '3'                          
                         MOVE '1'       TO DVDND-PAYEE-CD OF DCLACTIMF          
                      END-IF                                                    
                   END-IF                                                       
                ELSE                                                            
                   MOVE BH-ACAT-MF-REG-DIVD-PAYEE-IND                           
                                        TO DVDND-PAYEE-CD OF DCLACTIMF          
                END-IF                                                          
LRM020       ELSE                                                               
LRM020         IF W-VMFHSTY-FOUND                                               
LRM020            MOVE DVDND-PAYEE-CD  OF DCLVMFHSTY TO                         
LRM020                 DVDND-PAYEE-CD  OF DCLACTIMF                             
LRM020         END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
      ***EXECUTING BROKER -                                                     
DJ0009***BRKR-EXCTG-NBR: DEFAULT=BH-ACAT-MF-REGIST-RECEIVE-BKR(434636)          
DJ0009***BH-MF-EXBR-OPTION = '1', USE MFEXBR FILE                               
DJ0009***PROCESSING CODE = 'O', USE B1 434636.                                  
DJ0009***ELSE,USE B1 540167.IF NOT ON B1 540167, USE B1 434636                  
DJ0009     MOVE 'N'                    TO W-MFEXBR-FND-SW                       
DJ0009     IF BH-MF-EXBR-OPTION = '1'                                           
DJ0009         PERFORM 5951-GET-MFEXBR THRU 5951-EXIT                           
DJ0009         IF W-MFEXBR-FND-SW = 'Y'                                         
DJ0009            MOVE EXBR-EXECUTING-BROKER                                    
DJ0009                                 TO BRKR-EXCTG-NBR OF DCLACTIMF           
DJ0009         END-IF                                                           
DJ0009     END-IF                                                               
DJ0009     IF W-MFEXBR-FND-SW = 'N'                                             
             MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                            
                                        TO BRKR-EXCTG-NBR OF DCLACTIMF          
             IF BH-ACAT-MF-REGIST-RECEIVE-BKR > '0000'                          
                MOVE BH-ACAT-MF-REGIST-RECEIVE-BKR                              
                                        TO BRKR-EXCTG-NBR OF DCLACTIMF          
             END-IF                                                             
LRM011       IF PROCESSING-CODE OF BNWREGOP-RECORD = 'O' OR 'P'                 
                CONTINUE                                                        
             ELSE                                                               
               MOVE ACATRCRF-BRANCH-CD  TO WK-BR                                
               PERFORM 5950-GET-EXEC-BRKR THRU 5950-EXIT                        
               IF  W-BH-MF3-SEBR-CLEAR-FOUND                                    
                   MOVE W-BH-MF3-SEBR-CLEAR                                     
                                        TO BRKR-EXCTG-NBR OF DCLACTIMF          
               END-IF                                                           
             END-IF                                                             
DJ0009     END-IF.                                                              
                                                                                
LRM021     IF NTW-SHWB-ACCT                                                     
LRM021        MOVE '0164'               TO BRKR-EXCTG-NBR OF DCLACTIMF          
LRM021     END-IF.                                                              
                                                                                
      ***FULL/PARTIAL -                                                         
      ***MF-FULL-PRTL-CD - DEFAULT= 2                                           
           MOVE '2'                TO MF-FULL-PRTL-CD    OF DCLACTIMF           
LRM005*****IF  NTW-HOUSE-ACCOUNT = ' '                                          
LRM005*******IF W-BNWMAST-FOUND                                                 
LRM005**********IF MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'                      
LRM005*************MOVE '1'        TO MF-FULL-PRTL-CD    OF DCLACTIMF           
LRM005**********END-IF                                                          
LRM005*******END-IF                                                             
LRM005*****END-IF.                                                              
                                                                                
LRM001***OVERRIDES FOR O-NSCC:                                                  
LRM004     IF NTW-DST-MFE-ACCT                                                  
LRM004       AND (WS-DST-BOX-ACCT-TC NOT = SPACE AND LOW-VALUE)                 
LRM004       DISPLAY 'APPLY O-NSCC B1 537601 TO FNBR: '                         
LRM004                WS-DST-BOX-ACCT-TC                                        
DJ0006       MOVE CLIENT-NBR OF DCLACTIAST (2:3)                                
LRM004                               TO FNBR OF DCLACTIMF (1:3)                 
LRM004       MOVE WS-DST-BOX-ACCT-TC TO FNBR OF DCLACTIMF (4: )                 
LRM004       MOVE '0'                TO BK-PHSCL-SHR-CD OF DCLACTIMF            
LRM004       MOVE '3'                TO NTWRK-CNTL-CD  OF DCLACTIMF             
LRM004     ELSE                                                                 
LRM011     IF NTW-PNC-SURPAS-ACCT                                               
LRM011       IF W-BNWMAST-FOUND                                                 
LRM011       AND MATRIX-LEVEL = '6'                                             
LRM011       AND (WS-PNC-SURPAS-BOX-TC NOT = SPACE AND LOW-VALUE)               
LRM011          DISPLAY 'APPLY O-NSCC B1 540238 TO FUND NBR: '                  
LRM011                WS-PNC-SURPAS-BOX-TC                                      
LRM011          MOVE CLIENT-NBR OF DCLACTIAST (2:3)                             
LRM011                                    TO FNBR OF DCLACTIMF (1:3)            
LRM011          MOVE WS-PNC-SURPAS-BOX-TC TO FNBR OF DCLACTIMF (4: )            
LRM011       END-IF                                                             
LRM011       MOVE '0'                TO BK-PHSCL-SHR-CD OF DCLACTIMF            
LRM011       MOVE '3'                TO NTWRK-CNTL-CD  OF DCLACTIMF             
LRM011       IF TBL-TENDER                                                      
LRM011          MOVE 'C'    TO DVDND-CD OF DCLACTIMF                            
LRM011          MOVE 'C'    TO LTCG-CD  OF DCLACTIMF                            
LRM011          MOVE 'C'    TO STCG-CD  OF DCLACTIMF                            
LRM011       ELSE                                                               
LRM011          MOVE 'R'    TO DVDND-CD OF DCLACTIMF                            
LRM011          MOVE 'R'    TO LTCG-CD  OF DCLACTIMF                            
LRM011          MOVE 'R'    TO STCG-CD  OF DCLACTIMF                            
LRM011       END-IF                                                             
LRM011       MOVE  '2'            TO ACCT-TYPE-CD     OF DCLACTIMF              
LRM011       MOVE  '1'            TO DVDND-PAYEE-CD   OF DCLACTIMF              
LRM011       MOVE  '2'            TO MF-FULL-PRTL-CD  OF DCLACTIMF              
LRM011     ELSE                                                                 
LRM001       IF  NTW-NSCCSRC-ACCT                                               
LRM001       AND (NS-BRCH-ACCT-TC NOT = SPACE AND LOW-VALUE)                    
LRM001         DISPLAY 'APPLY O-NSCC B1 537596 TO FNBR: '                       
LRM001                  NS-BRCH-ACCT-TC                                         
DJ0006         MOVE CLIENT-NBR OF DCLACTIAST (2:3)                              
LRM001                               TO FNBR OF DCLACTIMF (1:3)                 
LRM001         MOVE NS-BRCH-ACCT-TC  TO FNBR OF DCLACTIMF (4: )                 
LRM001         MOVE '0'              TO BK-PHSCL-SHR-CD OF DCLACTIMF            
LRM001         MOVE '3'              TO NTWRK-CNTL-CD  OF DCLACTIMF             
LRM001       END-IF                                                             
LRM001     END-IF.                                                              
                                                                                
LRM021     IF NTW-SHWB-ACCT                                                     
LRM021        DISPLAY 'SHWB FUND/FNBR LOOKUP ' ACATRCRF-CUSIP                   
LRM021        DISPLAY '  MATRIX=' MATRIX-LEVEL                                  
LRM021                ' WAIVE-ACCT=' TBL-WAIVE-ACCT                             
LRM021                ' HOUSE-ACCOUNT=' REG-OP-HOUSE-ACCT                       
LRM021        DISPLAY '  WRAP-ACCT MUST BE 5,HAVE ' NAV-ACCT-INDICATOR          
LRM021        IF MATRIX-LEVEL = '3'                                             
LRM021           DISPLAY '  MATRIX=3, USE LEVEL3 VALUES '                       
LRM021                FNBR OF DCLACTIMF                                         
LRM021        ELSE                                                              
LRM021        IF NAV-WRAP-FEE-ACCOUNT                                           
LRM021          IF TBL-WAIVE-ACCT > SPACES                                      
LRM021          AND MATRIX-LEVEL = '6'                                          
LRM021             MOVE TBL-WAIVE-ACCT       TO FNBR OF DCLACTIMF               
LRM021             DISPLAY '  RULE1 WAIVE ACCOUNT FOR FNBR'                     
LRM021          ELSE                                                            
LRM021             IF REG-OP-HOUSE-ACCT > SPACES                                
LRM021                MOVE REG-OP-HOUSE-ACCT    TO FNBR OF DCLACTIMF            
LRM021                DISPLAY '  RULE2 HOUSE ACCOUNT FOR FNBR/NO WAIVE'         
LRM021             END-IF                                                       
LRM021        ELSE                                                              
LRM021        IF REG-OP-HOUSE-ACCT > SPACES                                     
LRM021           MOVE REG-OP-HOUSE-ACCT    TO FNBR OF DCLACTIMF                 
LRM021           DISPLAY '  RULE3 HOUSE ACCOUNT FOR FNBR/NON WAIVE'             
LRM021        ELSE                                                              
LRM021        IF TBL-WAIVE-ACCT > SPACES                                        
LRM021           MOVE TBL-WAIVE-ACCT       TO FNBR OF DCLACTIMF                 
LRM021            DISPLAY '  RULE4 WAIVE ACCOUNT FOR FNBR/NO HOUSE'             
LRM021     END-IF.                                                              
                                                                                
LRM021     IF NTW-SHWB-ACCT                                                     
LRM021       MOVE '1'               TO BK-PHSCL-SHR-CD OF DCLACTIMF             
LRM021       MOVE '3'               TO NTWRK-CNTL-CD  OF DCLACTIMF              
LRM021       MOVE 'S'               TO ACCT-TYPE-STTS-CD OF DCLACTIMF           
LRM023       MOVE '1'               TO FND-AGNT-CD    OF DCLACTIMF              
LRM021     END-IF.                                                              
                                                                                
DJ0004     MOVE ACAT-CONTROL-NBR   OF DCLACTIAST                                
DJ0004                              TO ACAT-CONTROL-NBR  OF DCLACTIMF           
DJ0004     MOVE ASSET-SEQ-NBR      OF DCLACTIAST                                
DJ0004                              TO ASSET-SEQ-NBR     OF DCLACTIMF           
DJ0004     MOVE TRNFR-TYPE-CD      OF DCLACTIAST                                
DJ0004                              TO TRNFR-TYPE-CD     OF DCLACTIMF           
DJ0004     MOVE ' '                TO FCST-ACCT-RCVR-NBR OF DCLACTIMF.          
                                                                                
       5940-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
DJ0009*****************************************************************         
DJ0009*  USE THE EXECUTING BROKER NUMBER(BH-MF3-SEBR-CLEAR) FROM                
DJ0009*  B1 540167 = MF3 SUB-EXECUTOR,BKR OF RECORD.                            
DJ0009*  SEARCH USING THE BRANCH NUMBER OF THE ACCOUNT.                         
DJ0009*****************************************************************         
       5950-GET-EXEC-BRKR.                                                      
                                                                                
           MOVE ' ' TO W-BH-MF3-SEBR-CLEAR                                      
           MOVE 'N' TO W-BH-MF3-SEBR-CLEAR-SW.                                  
                                                                                
           IF  BH-MF3-SUB-EXEC-BKR-REC-NO  = 0                                  
               GO TO 5950-EXIT.                                                 
           MOVE 1 TO W-SUB1.                                                    
       5950-LOOP.                                                               
           IF  WK-BR      >= BH-MF3-SEBR-BR-LO           (W-SUB1) AND           
               WK-BR      <= BH-MF3-SEBR-BR-HI           (W-SUB1)               
               MOVE BH-MF3-SEBR-CLEAR(W-SUB1) TO W-BH-MF3-SEBR-CLEAR            
               MOVE 'Y' TO W-BH-MF3-SEBR-CLEAR-SW                               
           ELSE                                                                 
               IF  W-SUB1 < BH-MF3-SUB-EXEC-BKR-REC-NO                          
                   ADD 1 TO W-SUB1                                              
               GO TO 5950-LOOP                                                  
           END-IF.                                                              
                                                                                
       5950-EXIT.                                                               
           EXIT.                                                                
                                                                                
DJ0009*****************************************************************         
DJ0009*  IF B1 537483(BH-MF-EXBR-OPTION)=1                                      
DJ0009*  GET THE EXECUTING BROKER NUMBER FROM THE MFEXBR FILE.                  
DJ0009*  USE THE FUND NUMBER FROM MFMSD TO READ THE MFEXBR FILE.                
DJ0009*****************************************************************         
DJ0009 5951-GET-MFEXBR.                                                         
DJ0009     MOVE '5951-GET-MFEXBR               ' TO W-ROUTINE-1.                
DJ0009                                                                          
DJ0009     IF W-MFMSD-FND-SW = 'Y'                                              
DJ0009        MOVE ' '                   TO MFEXBR-REC                          
DJ0009        MOVE ACATRCRF-CLIENT-N     TO EXBR-CLIENT                         
DJ0009        MOVE ACATRCRF-BRANCH-CD    TO EXBR-BRANCH                         
DJ0009        MOVE FUND-NO OF MFMSD-REC  TO EXBR-FUND-NO                        
DJ0009        ADD 1 TO W-MFEXBR-CNT                                             
DJ0009        READ MFEXBR                                                       
DJ0009        IF MFEXBR-STATUS = '00'                                           
DJ0009           ADD 1 TO W-MFEXBR-FND-CNT                                      
DJ0009           MOVE 'Y'                TO W-MFEXBR-FND-SW                     
DJ0009           DISPLAY 'MFEXBR FND: ' EXBR-CLIENT                             
DJ0009                              ' ' EXBR-BRANCH                             
DJ0009                              ' ' EXBR-FUND-NO                            
DJ0009                              ' ' EXBR-EXECUTING-BROKER                   
DJ0009        END-IF                                                            
DJ0009     END-IF.                                                              
DJ0009                                                                          
DJ0009 5951-EXIT.                                                               
DJ0009     EXIT.                                                                
                                                                                
      *****************************************************************         
      *  FOR NEW ASSETS FROM OTHER BROKERS,                                     
      *  ADD THE NEW ROW TO THE ACTIVE-TABLE                                    
      *****************************************************************         
       6000-INSERT-ACTIAST SECTION.                                             
           MOVE '6000-INSERT-ACTIAST           ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' ' TO W-ACTIAST-INSERT-SW.                                     
           MOVE ISIN-CNTRY-CD     OF DCLACTIAST TO WF-ISIN-CNTRY-CD             
           MOVE ISIN-SEC-ISSUE-CD OF DCLACTIAST TO  WF-ISIN-SEC-ISSUE-CD        
           MOVE ISIN-SEC-CDG-CD   OF DCLACTIAST TO WF-ISIN-SEC-CDG-CD           
           MOVE CSH-MGN-SHRT-CD   OF DCLACTIAST TO WF-CSH-MGN-SHRT-CD           
           MOVE STTLM-LCTN-CD     OF DCLACTIAST TO WF-STTLM-LCTN-CD             
           MOVE STTLM-RSN-CD      OF DCLACTIAST TO WF-STTLM-RSN-CD              
           MOVE ASSET-PRC-CTGY-CD OF DCLACTIAST TO  WF-ASSET-PRC-CTGY-CD        
                                                                                
LRM025     IF  STTLM-LCTN-CD OF DCLACTIAST = '35' OR '40' OR '45'               
               CONTINUE                                                         
           ELSE                                                                 
               IF  ISIN-SEC-ISSUE-CD OF DCLACTIAST > ' '                        
               AND ACATRCRF-CUSIP (10:3)  = '090'                               
LRM016         AND (BH-ACAT-WH-ASSET-CONTRA-CUSIP = '1' OR '3')                 
                   MOVE 'W'          TO NSCC-WTHLD-CD OF DCLACTIAST             
LRM025             MOVE 'C'          TO WHI-STTS-CD   OF DCLACTIAST             
                   DISPLAY '   WITHHELD-CUSIP:'                                 
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                            ' CUS=' ACATRCRF-CUSIP                              
                            ' SEC=' ACATRCRF-SECURITY                           
               END-IF                                                           
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
               INSERT INTO ACTIAST                                              
                 (                                                              
                   CLIENT_NBR                                                   
                  ,ACAT_CONTROL_NBR                                             
                  ,ASSET_SEQ_NBR                                                
                  ,RCRD_STTS_CD                                                 
                  ,RCRD_LNGTH_STTS_CD                                           
                  ,PHSCL_SEQ_STTS_CD                                            
                  ,LGCL_SEQ_NR_STS_CD                                           
                  ,TRANS_TYPE_STTS_CD                                           
                  ,TRNFR_TYPE_STTS_CD                                           
                  ,CONTROL_NBR_STS_CD                                           
                  ,SBMT_PRT_NR_STS_CD                                           
                  ,RCV_NBR_STTS_CD                                              
                  ,DLVR_NBR_STTS_CD                                             
                  ,TRANS_RFRN_STTS_CD                                           
                  ,AST_SEQ_NBR_STS_CD                                           
                  ,AST_PRC_CTG_STS_CD                                           
                  ,OPTN_CTGY_STTS_CD                                            
                  ,STTLM_LCTN_STTS_CD                                           
                  ,STTLM_RSN_STTS_CD                                            
                  ,ISIN_CNTRY_STTS_CD                                           
                  ,ISIN_SEC_IS_STS_CD                                           
                  ,ISIN_SEC_CD_STS_CD                                           
                  ,ASSET_DESC_STTS_CD                                           
                  ,ASSET_RQST_STS_CD                                            
                  ,AST_RQ_TRAN_STS_CD                                           
                  ,ASSET_QTY_STTS_CD                                            
                  ,ASSET_PCT_STTS_CD                                            
                  ,PSTN_CD_STTS_CD                                              
                  ,ISO_CRNCY_STTS_CD                                            
                  ,ASSET_AMT_STTS_CD                                            
                  ,BEARER_BND_STTS_CD                                           
                  ,CSH_MRG_SHT_STS_CD                                           
                  ,WHI_STTS_CD                                                  
                  ,TRN_TYP_RSN_STS_CD                                           
                  ,MBS_SERIAL_STTS_CD                                           
                  ,ASSET_CMNT_STTS_CD                                           
                  ,PHSCL_SEQ_NBR                                                
                  ,LGCL_SEQ_NBR                                                 
                  ,TRANS_TYPE_CD                                                
                  ,TRNFR_TYPE_CD                                                
                  ,SBMTG_PRTCP_NBR                                              
                  ,RCV_NBR                                                      
                  ,DLVR_NBR                                                     
                  ,TRANS_RFRN_ID_CD                                             
                  ,ASSET_PRC_CTGY_CD                                            
                  ,OPTN_CTGY_CD                                                 
                  ,STTLM_LCTN_CD                                                
                  ,STTLM_RSN_CD                                                 
                  ,ISIN_CNTRY_CD                                                
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,ISIN_SEC_CDG_CD                                              
                  ,ASSET_DESC_TXT                                               
                  ,ASSET_RQST_QTY_CD                                            
                  ,AST_RQST_TRANS_CD                                            
                  ,ASSET_QTY                                                    
                  ,ASSET_PCT                                                    
                  ,PSTN_CD                                                      
                  ,ISO_CRNCY_CD                                                 
                  ,ASSET_AMT                                                    
                  ,BEARER_BOND_CD                                               
                  ,CSH_MGN_SHRT_CD                                              
                  ,WHI_CD                                                       
                  ,TRNFR_TYPE_RSN_CD                                            
                  ,MBS_SERIAL_NBR                                               
                  ,ASSET_CMNT_TXT                                               
                  ,PRGM_NM                                                      
                  ,CICS_TERM_ID_CD                                              
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,ACCT_DLVR_NBR                                                
                  ,ACCT_RCV_NBR                                                 
                  ,SECURITY_ADP_NBR                                             
                  ,NSCC_ACK_IND                                                 
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_WTHLD_CD                                                
                 )                                                              
                 VALUES                                                         
                 (                                                              
                   :DCLACTIAST.CLIENT-NBR                                       
                  ,:DCLACTIAST.ACAT-CONTROL-NBR                                 
                  ,:DCLACTIAST.ASSET-SEQ-NBR                                    
                  ,:DCLACTIAST.RCRD-STTS-CD                                     
                  ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                               
                  ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                                
                  ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                               
                  ,:DCLACTIAST.TRANS-TYPE-STTS-CD                               
                  ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                               
                  ,:DCLACTIAST.CONTROL-NBR-STS-CD                               
                  ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                               
                  ,:DCLACTIAST.RCV-NBR-STTS-CD                                  
                  ,:DCLACTIAST.DLVR-NBR-STTS-CD                                 
                  ,:DCLACTIAST.TRANS-RFRN-STTS-CD                               
                  ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                               
                  ,:DCLACTIAST.AST-PRC-CTG-STS-CD                               
                  ,:DCLACTIAST.OPTN-CTGY-STTS-CD                                
                  ,:DCLACTIAST.STTLM-LCTN-STTS-CD                               
                  ,:DCLACTIAST.STTLM-RSN-STTS-CD                                
                  ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                               
                  ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                               
                  ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                               
                  ,:DCLACTIAST.ASSET-DESC-STTS-CD                               
                  ,:DCLACTIAST.ASSET-RQST-STS-CD                                
                  ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                               
                  ,:DCLACTIAST.ASSET-QTY-STTS-CD                                
                  ,:DCLACTIAST.ASSET-PCT-STTS-CD                                
                  ,:DCLACTIAST.PSTN-CD-STTS-CD                                  
                  ,:DCLACTIAST.ISO-CRNCY-STTS-CD                                
                  ,:DCLACTIAST.ASSET-AMT-STTS-CD                                
                  ,:DCLACTIAST.BEARER-BND-STTS-CD                               
                  ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                               
                  ,:DCLACTIAST.WHI-STTS-CD                                      
                  ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                               
                  ,:DCLACTIAST.MBS-SERIAL-STTS-CD                               
                  ,:DCLACTIAST.ASSET-CMNT-STTS-CD                               
                  ,:DCLACTIAST.PHSCL-SEQ-NBR                                    
                  ,:DCLACTIAST.LGCL-SEQ-NBR                                     
                  ,:DCLACTIAST.TRANS-TYPE-CD                                    
                  ,:DCLACTIAST.TRNFR-TYPE-CD                                    
                  ,:DCLACTIAST.SBMTG-PRTCP-NBR                                  
                  ,:DCLACTIAST.RCV-NBR                                          
                  ,:DCLACTIAST.DLVR-NBR                                         
                  ,:DCLACTIAST.TRANS-RFRN-ID-CD                                 
                  ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                
                  ,:DCLACTIAST.OPTN-CTGY-CD                                     
                  ,:DCLACTIAST.STTLM-LCTN-CD                                    
                  ,:DCLACTIAST.STTLM-RSN-CD                                     
                  ,:DCLACTIAST.ISIN-CNTRY-CD                                    
                  ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                
                  ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
                  ,:DCLACTIAST.ASSET-DESC-TXT                                   
                  ,:DCLACTIAST.ASSET-RQST-QTY-CD                                
                  ,:DCLACTIAST.AST-RQST-TRANS-CD                                
                  ,:DCLACTIAST.ASSET-QTY                                        
                  ,:DCLACTIAST.ASSET-PCT                                        
                  ,:DCLACTIAST.PSTN-CD                                          
                  ,:DCLACTIAST.ISO-CRNCY-CD                                     
                  ,:DCLACTIAST.ASSET-AMT                                        
                  ,:DCLACTIAST.BEARER-BOND-CD                                   
                  ,:DCLACTIAST.CSH-MGN-SHRT-CD                                  
                  ,:DCLACTIAST.WHI-CD                                           
                  ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                                
                  ,:DCLACTIAST.MBS-SERIAL-NBR                                   
                  ,:DCLACTIAST.ASSET-CMNT-TXT                                   
                  ,:DCLACTIAST.PRGM-NM                                          
                  ,:DCLACTIAST.CICS-TERM-ID-CD                                  
                  ,:DCLACTIAST.CRT-TMSTP                                        
                  ,:DCLACTIAST.UPDT-TMSTP                                       
                  ,:DCLACTIAST.ACCT-DLVR-NBR                                    
                  ,:DCLACTIAST.ACCT-RCV-NBR                                     
                  ,:DCLACTIAST.SECURITY-ADP-NBR                                 
                  ,:DCLACTIAST.NSCC-ACK-IND                                     
                  ,:DCLACTIAST.NSCC-PEND-CD                                     
                  ,:DCLACTIAST.NSCC-WTHLD-CD                                    
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIAST'                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIAST-ADD-CNT                                       
DJ0001         PERFORM 8120-SQL-COMMIT THRU 8120-EXIT                           
               MOVE 'Y' TO W-ACTIAST-INSERT-SW                                  
               MOVE 'Y' TO W-ASSET-ADDED-FOR-THIS-ACCT-SW                       
                                                                                
           ELSE                                                                 
               ADD 1 TO W-ACTIAST-NOT-ADD-CNT                                   
***************DISPLAY*'INP='*W-INFILE-CNT******************************        
********************'*'*ACATRCRF-CLIENT*********************************        
********************'*'*ACATRCRF-BRANCH-CD******************************        
********************'*'*ACATRCRF-ACCT-CD********************************        
********************'*'*ACATRCRF-ACCOUNT-TYPE***************************        
********************'*'*ACATRCRF-SECURITY*******************************        
********************'*'*ACATRCRF-ASSET-PRC-CTGY-CD**********************        
**************************'*ACTIAST*NOT*ADDED.'************************         
*****************************'*SQLCODE='*W-DB2-SQLCODE******************        
*****************************'*IF*SQLCODE=-803(DUPE),*UPDATE*IT'********        
               IF  SQLCODE  =  -803                                             
LRM012             IF ACATRCRF-ACCOUNT-TYPE = '03'                              
LRM012                DISPLAY 'INP=' W-INFILE-CNT                               
LRM012                     ' ' ACATRCRF-CLIENT                                  
LRM012                     ' ' ACATRCRF-BRANCH-CD                               
LRM012                     ' ' ACATRCRF-ACCT-CD                                 
LRM012                     ' ' ACATRCRF-SECURITY                                
LRM012                    ' SKIP TYPE3 POSN / DONT OVERLAY TYPE1'               
LRM012             ELSE                                                         
                      PERFORM 6300-UPDATE-ACTIAST THRU 6300-EXIT                
LRM012             END-IF                                                       
                                                                                
               ELSE                                                             
                   DISPLAY '   ACTIAST PRIMARY KEY:'                            
                            ' CLT=' CLIENT-NBR        OF DCLACTIAST             
                             ' CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                             ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
                             ' SL=' STTLM-LCTN-CD     OF DCLACTIAST             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
                   DISPLAY '           '                                        
                            ' DLV=' DLVR-NBR          OF DCLACTIAST             
                         ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIAST             
                            ' RCV=' RCV-NBR           OF DCLACTIAST             
                         ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIAST             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT812: ERROR INSERTING A ROW INTO ACTIAST'         
                         ' (ACAT-ASSET TABLE)'                                  
                   DISPLAY 'CAT812: DCLACTIAST  ='                              
                        '(' DCLACTIAST ')'                                      
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6000-EXIT. EXIT.                                                         
      /                                                                         
       6100-INSERT-ACTIOPN SECTION.                                             
           MOVE '6100-INSERT-ACTIOPN            ' TO W-ROUTINE-1.               
                                                                                
           EXEC SQL                                                             
               INSERT INTO ACTIOPN                                              
                 (                                                              
                   CLIENT_NBR                                                   
                  ,RCV_NBR                                                      
                  ,DLVR_NBR                                                     
                  ,ISIN_CNTRY_CD                                                
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,ISIN_SEC_CDG_CD                                              
                  ,STTLM_LCTN_CD                                                
                  ,CSH_MGN_SHRT_CD                                              
                  ,BS_STTS_CD                                                   
                  ,PTCL_STTS_CD                                                 
                  ,OPT_OPN_CLS_TST_CD                                           
                  ,SYM_STTS_CD                                                  
                  ,OPTN_EXPTN_DT_CD                                             
                  ,STPRC_INTR_STTS_CD                                           
                  ,STPRC_FRCT_STTS_CD                                           
                  ,OPT_OCC_DLV_STS_CD                                           
                  ,OPT_ACT_TYP_STS_CD                                           
                  ,ACCT_SUB_STTS_CD                                             
                  ,OPTN_CMNT_CD                                                 
                  ,BS_CD                                                        
                  ,PTCL_CD                                                      
                  ,OPTN_OPN_CLSD_CD                                             
                  ,SYM_CD                                                       
                  ,EXPTN_DT                                                     
                  ,STPRC_INTEGER_AMT                                            
                  ,STPRC_FRCTN_AMT                                              
                  ,DLVR_OCC_NBR                                                 
                  ,OPTN_ACCT_TYPE_CD                                            
                  ,ACCT_SUB_CD                                                  
                  ,OPTN_CMNT_TXT                                                
                  ,PRGM_NM                                                      
                  ,CICS_TERM_ID_CD                                              
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,ACCT_DLVR_NBR                                                
                  ,ACCT_RCV_NBR                                                 
                  ,SECURITY_ADP_NBR                                             
                  ,NSCC_ACK_IND                                                 
                  ,NSCC_PEND_CD                                                 
DJ0004            ,ACAT_CONTROL_NBR                                             
DJ0004            ,ASSET_SEQ_NBR                                                
DJ0004            ,TRNFR_TYPE_CD                                                
                 )                                                              
                 VALUES                                                         
                 (                                                              
                   :DCLACTIOPN.CLIENT-NBR                                       
                  ,:DCLACTIOPN.RCV-NBR                                          
                  ,:DCLACTIOPN.DLVR-NBR                                         
                  ,:DCLACTIOPN.ISIN-CNTRY-CD                                    
                  ,:DCLACTIOPN.ISIN-SEC-ISSUE-CD                                
                  ,:DCLACTIOPN.ISIN-SEC-CDG-CD                                  
                  ,:DCLACTIOPN.STTLM-LCTN-CD                                    
                  ,:DCLACTIOPN.CSH-MGN-SHRT-CD                                  
                  ,:DCLACTIOPN.BS-STTS-CD                                       
                  ,:DCLACTIOPN.PTCL-STTS-CD                                     
                  ,:DCLACTIOPN.OPT-OPN-CLS-TST-CD                               
                  ,:DCLACTIOPN.SYM-STTS-CD                                      
                  ,:DCLACTIOPN.OPTN-EXPTN-DT-CD                                 
                  ,:DCLACTIOPN.STPRC-INTR-STTS-CD                               
                  ,:DCLACTIOPN.STPRC-FRCT-STTS-CD                               
                  ,:DCLACTIOPN.OPT-OCC-DLV-STS-CD                               
                  ,:DCLACTIOPN.OPT-ACT-TYP-STS-CD                               
                  ,:DCLACTIOPN.ACCT-SUB-STTS-CD                                 
                  ,:DCLACTIOPN.OPTN-CMNT-CD                                     
                  ,:DCLACTIOPN.BS-CD                                            
                  ,:DCLACTIOPN.PTCL-CD                                          
                  ,:DCLACTIOPN.OPTN-OPN-CLSD-CD                                 
                  ,:DCLACTIOPN.SYM-CD                                           
                  ,:DCLACTIOPN.EXPTN-DT                                         
                  ,:DCLACTIOPN.STPRC-INTEGER-AMT                                
                  ,:DCLACTIOPN.STPRC-FRCTN-AMT                                  
                  ,:DCLACTIOPN.DLVR-OCC-NBR                                     
                  ,:DCLACTIOPN.OPTN-ACCT-TYPE-CD                                
                  ,:DCLACTIOPN.ACCT-SUB-CD                                      
                  ,:DCLACTIOPN.OPTN-CMNT-TXT                                    
                  ,:DCLACTIOPN.PRGM-NM                                          
                  ,:DCLACTIOPN.CICS-TERM-ID-CD                                  
                  ,:DCLACTIOPN.CRT-TMSTP                                        
                  ,:DCLACTIOPN.UPDT-TMSTP                                       
                  ,:DCLACTIOPN.ACCT-DLVR-NBR                                    
                  ,:DCLACTIOPN.ACCT-RCV-NBR                                     
                  ,:DCLACTIOPN.SECURITY-ADP-NBR                                 
                  ,:DCLACTIOPN.NSCC-ACK-IND                                     
                  ,:DCLACTIOPN.NSCC-PEND-CD                                     
DJ0004            ,:DCLACTIOPN.ACAT-CONTROL-NBR                                 
DJ0004            ,:DCLACTIOPN.ASSET-SEQ-NBR                                    
DJ0004            ,:DCLACTIOPN.TRNFR-TYPE-CD                                    
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIOPN'                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIOPN-ADD-CNT                                       
DJ0001         PERFORM 8120-SQL-COMMIT THRU 8120-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-ACTIOPN-NOT-ADD-CNT                                   
***************DISPLAY*'INP='*W-INFILE-CNT******************************        
********************'*'*ACATRCRF-CLIENT*********************************        
********************'*'*ACATRCRF-BRANCH-CD******************************        
********************'*'*ACATRCRF-ACCT-CD********************************        
********************'*'*ACATRCRF-ACCOUNT-TYPE***************************        
********************'*'*ACATRCRF-SECURITY*******************************        
********************'*'*ACATRCRF-ASSET-PRC-CTGY-CD**********************        
**************************'*ACTIOPN*NOT*ADDED.'************************         
*****************************'*SQLCODE='*W-DB2-SQLCODE******************        
*****************************'*IF*SQLCODE=-803(DUPE),*UPDATE*IT'********        
               IF  SQLCODE  =  -803                                             
                   PERFORM 6400-UPDATE-ACTIOPN THRU 6400-EXIT                   
               ELSE                                                             
                   DISPLAY '   ACTIOPN PRIMARY KEY:'                            
                            ' CLT=' CLIENT-NBR        OF DCLACTIAST             
                             ' CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                             ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
                             ' SL=' STTLM-LCTN-CD     OF DCLACTIAST             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
                   DISPLAY '           '                                        
                            ' DLV=' DLVR-NBR          OF DCLACTIAST             
                         ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIAST             
                            ' RCV=' RCV-NBR           OF DCLACTIAST             
                         ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIAST             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT812: ERROR INSERTING A ROW INTO ACTIOPN'         
                         ' (ACAT-ASSET TABLE)'                                  
                   DISPLAY 'CAT812: DCLACTIOPN  ='                              
                        '(' DCLACTIOPN ')'                                      
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6100-EXIT. EXIT.                                                         
      /                                                                         
       6200-INSERT-ACTIMF SECTION.                                              
           MOVE '6200-INSERT-ACTIMF              ' TO W-ROUTINE-1.              
                                                                                
           EXEC SQL                                                             
               INSERT INTO ACTIMF                                               
                 (                                                              
                   CLIENT_NBR                                                   
                  ,DSTBN_SIDE_CD                                                
                  ,PRCS_DT                                                      
                  ,RGSTN_CD                                                     
                  ,RCV_NBR                                                      
                  ,DLVR_NBR                                                     
                  ,ISIN_CNTRY_CD                                                
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,ISIN_SEC_CDG_CD                                              
                  ,STTLM_LCTN_CD                                                
                  ,CSH_MGN_SHRT_CD                                              
                  ,FND_ACT_NBR_STS_CD                                           
                  ,BK_PHSC_SHR_STS_CD                                           
                  ,NTWRK_CNTL_STTS_CD                                           
                  ,ACCT_TYPE_STTS_CD                                            
                  ,DVDND_STTS_CD                                                
                  ,DVDND_PYE_STTS_CD                                            
                  ,BRKR_EXCTG_STTS_CD                                           
                  ,MF_FUL_PRTL_STS_CD                                           
                  ,FNBR                                                         
                  ,BK_PHSCL_SHR_CD                                              
                  ,NTWRK_CNTL_CD                                                
                  ,ACCT_TYPE_CD                                                 
                  ,DVDND_CD                                                     
                  ,LTCG_CD                                                      
                  ,STCG_CD                                                      
                  ,DVDND_PAYEE_CD                                               
                  ,BRKR_EXCTG_NBR                                               
                  ,MF_FULL_PRTL_CD                                              
                  ,PRGM_NM                                                      
                  ,CICS_TERM_ID_CD                                              
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,ACCT_DLVR_NBR                                                
                  ,ACCT_RCV_NBR                                                 
                  ,SECURITY_ADP_NBR                                             
DJ0004            ,ACAT_CONTROL_NBR                                             
DJ0004            ,ASSET_SEQ_NBR                                                
DJ0004            ,TRNFR_TYPE_CD                                                
DJ0004            ,FCST_ACCT_RCVR_NBR                                           
                 )                                                              
                 VALUES                                                         
                 (                                                              
                   :DCLACTIMF.CLIENT-NBR                                        
                  ,:DCLACTIMF.DSTBN-SIDE-CD                                     
                  ,:DCLACTIMF.PRCS-DT                                           
                  ,:DCLACTIMF.RGSTN-CD                                          
                  ,:DCLACTIMF.RCV-NBR                                           
                  ,:DCLACTIMF.DLVR-NBR                                          
                  ,:DCLACTIMF.ISIN-CNTRY-CD                                     
                  ,:DCLACTIMF.ISIN-SEC-ISSUE-CD                                 
                  ,:DCLACTIMF.ISIN-SEC-CDG-CD                                   
                  ,:DCLACTIMF.STTLM-LCTN-CD                                     
                  ,:DCLACTIMF.CSH-MGN-SHRT-CD                                   
                  ,:DCLACTIMF.FND-ACT-NBR-STS-CD                                
                  ,:DCLACTIMF.BK-PHSC-SHR-STS-CD                                
                  ,:DCLACTIMF.NTWRK-CNTL-STTS-CD                                
                  ,:DCLACTIMF.ACCT-TYPE-STTS-CD                                 
                  ,:DCLACTIMF.DVDND-STTS-CD                                     
                  ,:DCLACTIMF.DVDND-PYE-STTS-CD                                 
                  ,:DCLACTIMF.BRKR-EXCTG-STTS-CD                                
                  ,:DCLACTIMF.MF-FUL-PRTL-STS-CD                                
                  ,:DCLACTIMF.FNBR                                              
                  ,:DCLACTIMF.BK-PHSCL-SHR-CD                                   
                  ,:DCLACTIMF.NTWRK-CNTL-CD                                     
                  ,:DCLACTIMF.ACCT-TYPE-CD                                      
                  ,:DCLACTIMF.DVDND-CD                                          
                  ,:DCLACTIMF.LTCG-CD                                           
                  ,:DCLACTIMF.STCG-CD                                           
                  ,:DCLACTIMF.DVDND-PAYEE-CD                                    
                  ,:DCLACTIMF.BRKR-EXCTG-NBR                                    
                  ,:DCLACTIMF.MF-FULL-PRTL-CD                                   
                  ,:DCLACTIMF.PRGM-NM                                           
                  ,:DCLACTIMF.CICS-TERM-ID-CD                                   
                  ,:DCLACTIMF.CRT-TMSTP                                         
                  ,:DCLACTIMF.UPDT-TMSTP                                        
                  ,:DCLACTIMF.ACCT-DLVR-NBR                                     
                  ,:DCLACTIMF.ACCT-RCV-NBR                                      
                  ,:DCLACTIMF.SECURITY-ADP-NBR                                  
DJ0004            ,:DCLACTIMF.ACAT-CONTROL-NBR                                  
DJ0004            ,:DCLACTIMF.ASSET-SEQ-NBR                                     
DJ0004            ,:DCLACTIMF.TRNFR-TYPE-CD                                     
DJ0004            ,:DCLACTIMF.FCST-ACCT-RCVR-NBR                                
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIMF '                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIMF-ADD-CNT                                        
DJ0001         PERFORM 8120-SQL-COMMIT THRU 8120-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-ACTIMF-NOT-ADD-CNT                                    
***************DISPLAY*'INP='*W-INFILE-CNT******************************        
********************'*'*ACATRCRF-CLIENT*********************************        
********************'*'*ACATRCRF-BRANCH-CD******************************        
********************'*'*ACATRCRF-ACCT-CD********************************        
********************'*'*ACATRCRF-ACCOUNT-TYPE***************************        
********************'*'*ACATRCRF-SECURITY*******************************        
********************'*'*ACATRCRF-ASSET-PRC-CTGY-CD**********************        
**************************'*ACTIMF**NOT*ADDED.'************************         
*****************************'*SQLCODE='*W-DB2-SQLCODE******************        
*****************************'*IF*SQLCODE=-803(DUPE),*UPDATE*IT'********        
               IF  SQLCODE  =  -803                                             
                   PERFORM 6500-UPDATE-ACTIMF   THRU 6500-EXIT                  
               ELSE                                                             
                   DISPLAY '   ACTIMF  PRIMARY KEY:'                            
                            ' CLT=' CLIENT-NBR        OF DCLACTIAST             
                             ' CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                             ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
                             ' SL=' STTLM-LCTN-CD     OF DCLACTIAST             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
                   DISPLAY '           '                                        
                            ' DLV=' DLVR-NBR          OF DCLACTIAST             
                         ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIAST             
                            ' RCV=' RCV-NBR           OF DCLACTIAST             
                         ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIAST             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT812: ERROR INSERTING A ROW INTO ACTIMF'          
                         ' (ACAT-ASSET TABLE)'                                  
                   DISPLAY 'CAT812: DCLACTIMF  ='                               
                        '(' DCLACTIMF ')'                                       
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6200-EXIT. EXIT.                                                         
      /                                                                         
       6300-UPDATE-ACTIAST SECTION.                                             
                                                                                
           EXEC SQL                                                             
             UPDATE ACTIAST                                                     
                SET                                                             
                   CLIENT_NBR          = :DCLACTIAST.CLIENT-NBR                 
                  ,ACAT_CONTROL_NBR    = :DCLACTIAST.ACAT-CONTROL-NBR           
                  ,ASSET_SEQ_NBR       = :DCLACTIAST.ASSET-SEQ-NBR              
                  ,RCRD_STTS_CD        = :DCLACTIAST.RCRD-STTS-CD               
                  ,RCRD_LNGTH_STTS_CD  = :DCLACTIAST.RCRD-LNGTH-STTS-CD         
                  ,PHSCL_SEQ_STTS_CD   = :DCLACTIAST.PHSCL-SEQ-STTS-CD          
                  ,LGCL_SEQ_NR_STS_CD  = :DCLACTIAST.LGCL-SEQ-NR-STS-CD         
                  ,TRANS_TYPE_STTS_CD  = :DCLACTIAST.TRANS-TYPE-STTS-CD         
                  ,TRNFR_TYPE_STTS_CD  = :DCLACTIAST.TRNFR-TYPE-STTS-CD         
                  ,CONTROL_NBR_STS_CD  = :DCLACTIAST.CONTROL-NBR-STS-CD         
                  ,SBMT_PRT_NR_STS_CD  = :DCLACTIAST.SBMT-PRT-NR-STS-CD         
                  ,RCV_NBR_STTS_CD     = :DCLACTIAST.RCV-NBR-STTS-CD            
                  ,DLVR_NBR_STTS_CD    = :DCLACTIAST.DLVR-NBR-STTS-CD           
                  ,TRANS_RFRN_STTS_CD  = :DCLACTIAST.TRANS-RFRN-STTS-CD         
                  ,AST_SEQ_NBR_STS_CD  = :DCLACTIAST.AST-SEQ-NBR-STS-CD         
                  ,AST_PRC_CTG_STS_CD  = :DCLACTIAST.AST-PRC-CTG-STS-CD         
                  ,OPTN_CTGY_STTS_CD   = :DCLACTIAST.OPTN-CTGY-STTS-CD          
                  ,STTLM_LCTN_STTS_CD  = :DCLACTIAST.STTLM-LCTN-STTS-CD         
                  ,STTLM_RSN_STTS_CD   = :DCLACTIAST.STTLM-RSN-STTS-CD          
                  ,ISIN_CNTRY_STTS_CD  = :DCLACTIAST.ISIN-CNTRY-STTS-CD         
                  ,ISIN_SEC_IS_STS_CD  = :DCLACTIAST.ISIN-SEC-IS-STS-CD         
                  ,ISIN_SEC_CD_STS_CD  = :DCLACTIAST.ISIN-SEC-CD-STS-CD         
                  ,ASSET_DESC_STTS_CD  = :DCLACTIAST.ASSET-DESC-STTS-CD         
                  ,ASSET_RQST_STS_CD   = :DCLACTIAST.ASSET-RQST-STS-CD          
                  ,AST_RQ_TRAN_STS_CD  = :DCLACTIAST.AST-RQ-TRAN-STS-CD         
                  ,ASSET_QTY_STTS_CD   = :DCLACTIAST.ASSET-QTY-STTS-CD          
                  ,ASSET_PCT_STTS_CD   = :DCLACTIAST.ASSET-PCT-STTS-CD          
                  ,PSTN_CD_STTS_CD     = :DCLACTIAST.PSTN-CD-STTS-CD            
                  ,ISO_CRNCY_STTS_CD   = :DCLACTIAST.ISO-CRNCY-STTS-CD          
                  ,ASSET_AMT_STTS_CD   = :DCLACTIAST.ASSET-AMT-STTS-CD          
                  ,BEARER_BND_STTS_CD  = :DCLACTIAST.BEARER-BND-STTS-CD         
                  ,CSH_MRG_SHT_STS_CD  = :DCLACTIAST.CSH-MRG-SHT-STS-CD         
                  ,WHI_STTS_CD         = :DCLACTIAST.WHI-STTS-CD                
                  ,TRN_TYP_RSN_STS_CD  = :DCLACTIAST.TRN-TYP-RSN-STS-CD         
                  ,MBS_SERIAL_STTS_CD  = :DCLACTIAST.MBS-SERIAL-STTS-CD         
                  ,ASSET_CMNT_STTS_CD  = :DCLACTIAST.ASSET-CMNT-STTS-CD         
                  ,PHSCL_SEQ_NBR       = :DCLACTIAST.PHSCL-SEQ-NBR              
                  ,LGCL_SEQ_NBR        = :DCLACTIAST.LGCL-SEQ-NBR               
                  ,TRANS_TYPE_CD       = :DCLACTIAST.TRANS-TYPE-CD              
                  ,TRNFR_TYPE_CD       = :DCLACTIAST.TRNFR-TYPE-CD              
                  ,SBMTG_PRTCP_NBR     = :DCLACTIAST.SBMTG-PRTCP-NBR            
                  ,RCV_NBR             = :DCLACTIAST.RCV-NBR                    
                  ,DLVR_NBR            = :DCLACTIAST.DLVR-NBR                   
                  ,TRANS_RFRN_ID_CD    = :DCLACTIAST.TRANS-RFRN-ID-CD           
                  ,ASSET_PRC_CTGY_CD   = :DCLACTIAST.ASSET-PRC-CTGY-CD          
                  ,OPTN_CTGY_CD        = :DCLACTIAST.OPTN-CTGY-CD               
                  ,STTLM_LCTN_CD       = :DCLACTIAST.STTLM-LCTN-CD              
                  ,STTLM_RSN_CD        = :DCLACTIAST.STTLM-RSN-CD               
                  ,ISIN_CNTRY_CD       = :DCLACTIAST.ISIN-CNTRY-CD              
                  ,ISIN_SEC_ISSUE_CD   = :DCLACTIAST.ISIN-SEC-ISSUE-CD          
                  ,ISIN_SEC_CDG_CD     = :DCLACTIAST.ISIN-SEC-CDG-CD            
                  ,ASSET_DESC_TXT      = :DCLACTIAST.ASSET-DESC-TXT             
                  ,ASSET_RQST_QTY_CD   = :DCLACTIAST.ASSET-RQST-QTY-CD          
                  ,AST_RQST_TRANS_CD   = :DCLACTIAST.AST-RQST-TRANS-CD          
                  ,ASSET_QTY           = :DCLACTIAST.ASSET-QTY                  
                  ,ASSET_PCT           = :DCLACTIAST.ASSET-PCT                  
                  ,PSTN_CD             = :DCLACTIAST.PSTN-CD                    
                  ,ISO_CRNCY_CD        = :DCLACTIAST.ISO-CRNCY-CD               
                  ,ASSET_AMT           = :DCLACTIAST.ASSET-AMT                  
                  ,BEARER_BOND_CD      = :DCLACTIAST.BEARER-BOND-CD             
                  ,CSH_MGN_SHRT_CD     = :DCLACTIAST.CSH-MGN-SHRT-CD            
                  ,WHI_CD              = :DCLACTIAST.WHI-CD                     
                  ,TRNFR_TYPE_RSN_CD   = :DCLACTIAST.TRNFR-TYPE-RSN-CD          
                  ,MBS_SERIAL_NBR      = :DCLACTIAST.MBS-SERIAL-NBR             
                  ,ASSET_CMNT_TXT      = :DCLACTIAST.ASSET-CMNT-TXT             
                  ,PRGM_NM             = :DCLACTIAST.PRGM-NM                    
                  ,CICS_TERM_ID_CD     = :DCLACTIAST.CICS-TERM-ID-CD            
                  ,CRT_TMSTP           = :DCLACTIAST.CRT-TMSTP                  
                  ,UPDT_TMSTP          = :DCLACTIAST.UPDT-TMSTP                 
                  ,ACCT_DLVR_NBR       = :DCLACTIAST.ACCT-DLVR-NBR              
                  ,ACCT_RCV_NBR        = :DCLACTIAST.ACCT-RCV-NBR               
                  ,SECURITY_ADP_NBR    = :DCLACTIAST.SECURITY-ADP-NBR           
                  ,NSCC_ACK_IND        = :DCLACTIAST.NSCC-ACK-IND               
                  ,NSCC_PEND_CD        = :DCLACTIAST.NSCC-PEND-CD               
                  ,NSCC_WTHLD_CD       = :DCLACTIAST.NSCC-WTHLD-CD              
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ISIN_CNTRY_CD     = :WF-ISIN-CNTRY-CD                    
                  AND  ISIN_SEC_ISSUE_CD = :WF-ISIN-SEC-ISSUE-CD                
                  AND  ISIN_SEC_CDG_CD   = :WF-ISIN-SEC-CDG-CD                  
                  AND  STTLM_LCTN_CD     = :WF-STTLM-LCTN-CD                    
                  AND  CSH_MGN_SHRT_CD   = :WF-CSH-MGN-SHRT-CD                  
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                    
                  AND  RCV_NBR           = :WF-RCV-NBR                          
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                     
******************AND  TRNFR_TYPE_CD     = 'RCR'                                
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'ACTIAST  '              TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIAST-UPD-CNT                                       
DJ0001         PERFORM 8120-SQL-COMMIT THRU 8120-EXIT                           
               MOVE 'Y' TO W-ACTIAST-INSERT-SW                                  
               MOVE 'Y' TO W-ASSET-ADDED-FOR-THIS-ACCT-SW                       
           ELSE                                                                 
               ADD 1 TO W-ACTIAST-NOT-UPD-CNT                                   
               DISPLAY 'INP=' W-INFILE-CNT                                      
                    ' ' ACATRCRF-CLIENT                                         
                    ' ' ACATRCRF-BRANCH-CD                                      
                    ' ' ACATRCRF-ACCT-CD                                        
                    ' ' ACATRCRF-ACCOUNT-TYPE                                   
                    ' ' ACATRCRF-SECURITY                                       
                    ' ' ACATRCRF-ASSET-PRC-CTGY-CD                              
                          ' ACTIAST NOT UPDATED.'                               
                             ' SQLCODE=' W-DB2-SQLCODE                          
                   DISPLAY '   ACTIAST PRIMARY KEY:'                            
                            ' CLT=' CLIENT-NBR        OF DCLACTIAST             
                             ' CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                             ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
                             ' SL=' STTLM-LCTN-CD     OF DCLACTIAST             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
                   DISPLAY '           '                                        
                            ' DLV=' DLVR-NBR          OF DCLACTIAST             
                         ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIAST             
                            ' RCV=' RCV-NBR           OF DCLACTIAST             
                         ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIAST             
           END-IF.                                                              
                                                                                
       6300-EXIT. EXIT.                                                         
      /                                                                         
       6400-UPDATE-ACTIOPN SECTION.                                             
                                                                                
           EXEC SQL                                                             
             UPDATE ACTIOPN                                                     
                SET                                                             
                   CLIENT_NBR          = :DCLACTIOPN.CLIENT-NBR                 
                  ,RCV_NBR             = :DCLACTIOPN.RCV-NBR                    
                  ,DLVR_NBR            = :DCLACTIOPN.DLVR-NBR                   
                  ,ISIN_CNTRY_CD       = :DCLACTIOPN.ISIN-CNTRY-CD              
                  ,ISIN_SEC_ISSUE_CD   = :DCLACTIOPN.ISIN-SEC-ISSUE-CD          
                  ,ISIN_SEC_CDG_CD     = :DCLACTIOPN.ISIN-SEC-CDG-CD            
                  ,STTLM_LCTN_CD       = :DCLACTIOPN.STTLM-LCTN-CD              
                  ,CSH_MGN_SHRT_CD     = :DCLACTIOPN.CSH-MGN-SHRT-CD            
                  ,BS_STTS_CD          = :DCLACTIOPN.BS-STTS-CD                 
                  ,PTCL_STTS_CD        = :DCLACTIOPN.PTCL-STTS-CD               
                  ,OPT_OPN_CLS_TST_CD  = :DCLACTIOPN.OPT-OPN-CLS-TST-CD         
                  ,SYM_STTS_CD         = :DCLACTIOPN.SYM-STTS-CD                
                  ,OPTN_EXPTN_DT_CD    = :DCLACTIOPN.OPTN-EXPTN-DT-CD           
                  ,STPRC_INTR_STTS_CD  = :DCLACTIOPN.STPRC-INTR-STTS-CD         
                  ,STPRC_FRCT_STTS_CD  = :DCLACTIOPN.STPRC-FRCT-STTS-CD         
                  ,OPT_OCC_DLV_STS_CD  = :DCLACTIOPN.OPT-OCC-DLV-STS-CD         
                  ,OPT_ACT_TYP_STS_CD  = :DCLACTIOPN.OPT-ACT-TYP-STS-CD         
                  ,ACCT_SUB_STTS_CD    = :DCLACTIOPN.ACCT-SUB-STTS-CD           
                  ,OPTN_CMNT_CD        = :DCLACTIOPN.OPTN-CMNT-CD               
                  ,BS_CD               = :DCLACTIOPN.BS-CD                      
                  ,PTCL_CD             = :DCLACTIOPN.PTCL-CD                    
                  ,OPTN_OPN_CLSD_CD    = :DCLACTIOPN.OPTN-OPN-CLSD-CD           
                  ,SYM_CD              = :DCLACTIOPN.SYM-CD                     
                  ,EXPTN_DT            = :DCLACTIOPN.EXPTN-DT                   
                  ,STPRC_INTEGER_AMT   = :DCLACTIOPN.STPRC-INTEGER-AMT          
                  ,STPRC_FRCTN_AMT     = :DCLACTIOPN.STPRC-FRCTN-AMT            
                  ,DLVR_OCC_NBR        = :DCLACTIOPN.DLVR-OCC-NBR               
                  ,OPTN_ACCT_TYPE_CD   = :DCLACTIOPN.OPTN-ACCT-TYPE-CD          
                  ,ACCT_SUB_CD         = :DCLACTIOPN.ACCT-SUB-CD                
                  ,OPTN_CMNT_TXT       = :DCLACTIOPN.OPTN-CMNT-TXT              
                  ,PRGM_NM             = :DCLACTIOPN.PRGM-NM                    
                  ,CICS_TERM_ID_CD     = :DCLACTIOPN.CICS-TERM-ID-CD            
                  ,CRT_TMSTP           = :DCLACTIOPN.CRT-TMSTP                  
                  ,UPDT_TMSTP          = :DCLACTIOPN.UPDT-TMSTP                 
                  ,ACCT_DLVR_NBR       = :DCLACTIOPN.ACCT-DLVR-NBR              
                  ,ACCT_RCV_NBR        = :DCLACTIOPN.ACCT-RCV-NBR               
                  ,SECURITY_ADP_NBR    = :DCLACTIOPN.SECURITY-ADP-NBR           
                  ,NSCC_ACK_IND        = :DCLACTIOPN.NSCC-ACK-IND               
                  ,NSCC_PEND_CD        = :DCLACTIOPN.NSCC-PEND-CD               
DJ0004            ,ACAT_CONTROL_NBR    = :DCLACTIOPN.ACAT-CONTROL-NBR           
DJ0004            ,ASSET_SEQ_NBR       = :DCLACTIOPN.ASSET-SEQ-NBR              
DJ0004            ,TRNFR_TYPE_CD       = :DCLACTIOPN.TRNFR-TYPE-CD              
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ISIN_CNTRY_CD     = :WF-ISIN-CNTRY-CD                    
                  AND  ISIN_SEC_ISSUE_CD = :WF-ISIN-SEC-ISSUE-CD                
                  AND  ISIN_SEC_CDG_CD   = :WF-ISIN-SEC-CDG-CD                  
                  AND  STTLM_LCTN_CD     = :WF-STTLM-LCTN-CD                    
                  AND  CSH_MGN_SHRT_CD   = :WF-CSH-MGN-SHRT-CD                  
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                    
                  AND  RCV_NBR           = :WF-RCV-NBR                          
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                     
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'ACTIOPN   '             TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
DJ0001     IF  SQLCODE  =  +0                                                   
DJ0001         ADD 1 TO W-ACTIOPN-UPD-CNT                                       
DJ0001         PERFORM 8120-SQL-COMMIT THRU 8120-EXIT                           
DJ0001     ELSE                                                                 
DJ0001         ADD 1 TO W-ACTIOPN-NOT-UPD-CNT                                   
DJ0001     END-IF.                                                              
                                                                                
       6400-EXIT. EXIT.                                                         
      /                                                                         
       6500-UPDATE-ACTIMF SECTION.                                              
                                                                                
           EXEC SQL                                                             
             UPDATE ACTIMF                                                      
                SET                                                             
                   CLIENT_NBR          = :DCLACTIMF.CLIENT-NBR                  
                  ,DSTBN_SIDE_CD       = :DCLACTIMF.DSTBN-SIDE-CD               
                  ,PRCS_DT             = :DCLACTIMF.PRCS-DT                     
                  ,RGSTN_CD            = :DCLACTIMF.RGSTN-CD                    
                  ,RCV_NBR             = :DCLACTIMF.RCV-NBR                     
                  ,DLVR_NBR            = :DCLACTIMF.DLVR-NBR                    
                  ,ISIN_CNTRY_CD       = :DCLACTIMF.ISIN-CNTRY-CD               
                  ,ISIN_SEC_ISSUE_CD   = :DCLACTIMF.ISIN-SEC-ISSUE-CD           
                  ,ISIN_SEC_CDG_CD     = :DCLACTIMF.ISIN-SEC-CDG-CD             
                  ,STTLM_LCTN_CD       = :DCLACTIMF.STTLM-LCTN-CD               
                  ,CSH_MGN_SHRT_CD     = :DCLACTIMF.CSH-MGN-SHRT-CD             
                  ,FND_ACT_NBR_STS_CD  = :DCLACTIMF.FND-ACT-NBR-STS-CD          
                  ,BK_PHSC_SHR_STS_CD  = :DCLACTIMF.BK-PHSC-SHR-STS-CD          
                  ,NTWRK_CNTL_STTS_CD  = :DCLACTIMF.NTWRK-CNTL-STTS-CD          
                  ,ACCT_TYPE_STTS_CD   = :DCLACTIMF.ACCT-TYPE-STTS-CD           
                  ,DVDND_STTS_CD       = :DCLACTIMF.DVDND-STTS-CD               
                  ,DVDND_PYE_STTS_CD   = :DCLACTIMF.DVDND-PYE-STTS-CD           
                  ,BRKR_EXCTG_STTS_CD  = :DCLACTIMF.BRKR-EXCTG-STTS-CD          
                  ,MF_FUL_PRTL_STS_CD  = :DCLACTIMF.MF-FUL-PRTL-STS-CD          
                  ,FNBR                = :DCLACTIMF.FNBR                        
                  ,BK_PHSCL_SHR_CD     = :DCLACTIMF.BK-PHSCL-SHR-CD             
                  ,NTWRK_CNTL_CD       = :DCLACTIMF.NTWRK-CNTL-CD               
                  ,ACCT_TYPE_CD        = :DCLACTIMF.ACCT-TYPE-CD                
                  ,DVDND_CD            = :DCLACTIMF.DVDND-CD                    
                  ,LTCG_CD             = :DCLACTIMF.LTCG-CD                     
                  ,STCG_CD             = :DCLACTIMF.STCG-CD                     
                  ,DVDND_PAYEE_CD      = :DCLACTIMF.DVDND-PAYEE-CD              
                  ,BRKR_EXCTG_NBR      = :DCLACTIMF.BRKR-EXCTG-NBR              
                  ,MF_FULL_PRTL_CD     = :DCLACTIMF.MF-FULL-PRTL-CD             
                  ,PRGM_NM             = :DCLACTIMF.PRGM-NM                     
                  ,CICS_TERM_ID_CD     = :DCLACTIMF.CICS-TERM-ID-CD             
                  ,CRT_TMSTP           = :DCLACTIMF.CRT-TMSTP                   
                  ,UPDT_TMSTP          = :DCLACTIMF.UPDT-TMSTP                  
                  ,ACCT_DLVR_NBR       = :DCLACTIMF.ACCT-DLVR-NBR               
                  ,ACCT_RCV_NBR        = :DCLACTIMF.ACCT-RCV-NBR                
                  ,SECURITY_ADP_NBR    = :DCLACTIMF.SECURITY-ADP-NBR            
DJ0004            ,ACAT_CONTROL_NBR    = :DCLACTIMF.ACAT-CONTROL-NBR            
DJ0004            ,ASSET_SEQ_NBR       = :DCLACTIMF.ASSET-SEQ-NBR               
DJ0004            ,TRNFR_TYPE_CD       = :DCLACTIMF.TRNFR-TYPE-CD               
DJ0004            ,FCST_ACCT_RCVR_NBR  = :DCLACTIMF.FCST-ACCT-RCVR-NBR          
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ISIN_CNTRY_CD     = :WF-ISIN-CNTRY-CD                    
                  AND  ISIN_SEC_ISSUE_CD = :WF-ISIN-SEC-ISSUE-CD                
                  AND  ISIN_SEC_CDG_CD   = :WF-ISIN-SEC-CDG-CD                  
                  AND  STTLM_LCTN_CD     = :WF-STTLM-LCTN-CD                    
                  AND  CSH_MGN_SHRT_CD   = :WF-CSH-MGN-SHRT-CD                  
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                    
                  AND  RCV_NBR           = :WF-RCV-NBR                          
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                     
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'ACTIMF     '            TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
DJ0001     IF  SQLCODE  =  +0                                                   
DJ0001         ADD 1 TO W-ACTIMF-UPD-CNT                                        
DJ0001         PERFORM 8120-SQL-COMMIT THRU 8120-EXIT                           
DJ0001     ELSE                                                                 
DJ0001         ADD 1 TO W-ACTIMF-NOT-UPD-CNT                                    
DJ0001     END-IF.                                                              
                                                                                
       6500-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR TRANSFER THAT HAVE ASSETS FOR RCR                                  
      *  ADD THE NEW ROW TO THE INIT-TABLE                                      
      *****************************************************************         
       6900-INSERT-ACTITRF SECTION.                                             
           MOVE '6900-INSERT-ACTITRF         ' TO W-ROUTINE-1.                  
                                                                                
           INITIALIZE DCLACTITRF                                                
           MOVE W-HDR-TI-CLIENT                                                 
                                   TO CLIENT-NBR         OF DCLACTITRF          
           MOVE W-HDR-TI-DSTBN-SIDE-CD                                          
                                   TO DSTBN-SIDE-CD      OF DCLACTITRF          
           MOVE ' '                                                             
                                   TO ACAT-CONTROL-NBR   OF DCLACTITRF          
                                                                                
           MOVE W-PROC-DT                                                       
                                   TO PRCS-DT            OF DCLACTITRF          
           MOVE ' '                                                             
                                   TO CYCLE-CD           OF DCLACTITRF          
           MOVE ' '                                                             
                                   TO SYS-ACT-CD         OF DCLACTITRF          
           MOVE ' '                                                             
                                   TO SYS-RJCT-RSN-CD    OF DCLACTITRF          
           MOVE ' '                                                             
                                   TO STTS-CD            OF DCLACTITRF          
           MOVE 0                                                               
                                   TO DAYS-STTS-QTY      OF DCLACTITRF          
           MOVE 01                                                              
                                   TO PHSCL-SEQ-NBR      OF DCLACTITRF          
           MOVE 01                                                              
                                   TO LGCL-SEQ-NBR       OF DCLACTITRF          
           MOVE 'A'                                                             
                                   TO TRANS-TYPE-CD      OF DCLACTITRF          
           MOVE 'RCR'                                                           
                                   TO TRNFR-TYPE-CD      OF DCLACTITRF          
           MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                              
                                   TO SBMTG-PRTCP-NBR    OF DCLACTITRF          
           MOVE W-HDR-TI-RCV-NBR                                                
                                   TO RCV-NBR            OF DCLACTITRF          
           MOVE W-HDR-TI-DLVR-NBR                                               
                                   TO DLVR-NBR           OF DCLACTITRF          
           MOVE W-HDR-TI-ACCT-RCV-NBR                                           
                                   TO ACCT-RCV-NBR       OF DCLACTITRF          
           MOVE W-HDR-TI-RCV-CUST-NM                                            
                                   TO RCV-CUST-NM        OF DCLACTITRF          
           MOVE W-HDR-TI-RCV-SS-PRIM-NBR                                        
                                   TO RCV-SS-PRIM-NBR    OF DCLACTITRF          
           MOVE W-HDR-TI-RCV-SS-SCNDY-NBR                                       
                                   TO RCV-SS-SCNDY-NBR   OF DCLACTITRF          
           MOVE W-HDR-TI-RCV-ACCT-TYPE-CD                                       
                                   TO RCV-ACCT-TYPE-CD   OF DCLACTITRF          
DJ0005     IF  W-OPT-ADDED-FOR-THIS-ACCT-SW = 'Y'                               
               MOVE W-HDR-TI-RCV-OCC-BRKR-NBR                                   
                                   TO RCV-OCC-BRKR-NBR   OF DCLACTITRF          
DJ0005     ELSE                                                                 
DJ0005         MOVE ' '            TO RCV-OCC-BRKR-NBR   OF DCLACTITRF          
DJ0005     END-IF                                                               
           MOVE W-HDR-TI-RCV-CRSPN-NBR                                          
                                   TO RCV-CRSPN-NBR      OF DCLACTITRF          
           MOVE W-HDR-TI-PRTCP-CONTRA-CD                                        
                                   TO PRTCP-CONTRA-CD    OF DCLACTITRF          
           MOVE W-HDR-TI-ACCT-DLVR-NBR                                          
                                   TO ACCT-DLVR-NBR      OF DCLACTITRF          
                                                                                
           MOVE ' '                TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
           MOVE W-HDR-TI-CONTROL-NBR                                            
                                   TO ACAT-CNTL-ASTD-NBR OF DCLACTITRF          
           MOVE W-HDR-TI-STTLM-DT                                               
                                   TO STTLM-ASCTD-DT     OF DCLACTITRF          
           MOVE W-HDR-TI-ACCT-DLVR-NBR                                          
                                   TO TRANS-RFRN-ID-CD   OF DCLACTITRF          
                                                                                
           MOVE ' '                TO CMNT-TXT           OF DCLACTITRF          
           MOVE ' '                TO CICS-TERM-ID-CD    OF DCLACTITRF          
           MOVE W-CURRENT-TIMESTAMP                                             
                                   TO CRT-TMSTP          OF DCLACTITRF          
           MOVE W-HDR-TI-DB-CR-CD                                               
                                   TO DB-CR-CD           OF DCLACTITRF          
                                                                                
           MOVE W-BH-NSCC-PEND-CD  TO NSCC-PEND-CD       OF DCLACTITRF          
                                                                                
           MOVE W-PGM-NAME         TO PRGM-NM            OF DCLACTITRF          
           MOVE W-HDR-TI-RR-CD                                                  
                                   TO RR-CD              OF DCLACTITRF          
                                                                                
           MOVE ' '                TO TRNFR-TYPE-RJC1-CD OF DCLACTITRF          
           MOVE ' '                TO TRNFR-TYPE-RJC2-CD OF DCLACTITRF          
                                                                                
           MOVE W-CURRENT-TIMESTAMP                                             
                                   TO UPDT-TMSTP         OF DCLACTITRF          
                                                                                
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
                  ,UPDT_TMSTP                                                   
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
               ADD 1 TO W-ACTITRF-ADD-CNT                                       
DJ0001         PERFORM 8120-SQL-COMMIT THRU 8120-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-ACTITRF-NOT-ADD-CNT                                   
***************DISPLAY*'INP='*W-INFILE-CNT******************************        
********************'*'*W-HDR-TI-CLIENT*********************************        
********************'*'*W-HDR-TI-BRANCH-CD******************************        
********************'*'*W-HDR-TI-ACCT-CD********************************        
**************************'*ACTITRF*NOT*ADDED.'************************         
*******************************'*SQLCODE='*W-DB2-SQLCODE****************        
*****************************'*IF*SQLCODE=-803(DUPE),*UPDATE*IT'********        
               IF  SQLCODE  =  -803                                             
                   PERFORM 6910-UPDATE-ACTITRF     THRU 6910-EXIT               
               ELSE                                                             
                   DISPLAY '   '                                                
                          'ACTITRF PRIMARY KEY:'                                
                              ' CLT=' WF-CLIENT-NBR                             
                              ' TFR=' WF-TRNFR-TYPE-CD                          
                   DISPLAY '    DLV=' WF-DLVR-NBR                               
                           ' DLV-AC=' WF-ACCT-DLVR-NBR                          
                              ' RCV=' WF-RCV-NBR                                
                           ' RCV-AC=' WF-ACCT-RCV-NBR                           
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT812: ERROR INSERTING A ROW INTO ACTITRF'         
                        ' (ACAT-TRNFR TABLE)'                                   
                   DISPLAY 'CAT812: DCLACTITRF  ='                              
                        '(' DCLACTITRF ')'                                      
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6900-EXIT. EXIT.                                                         
                                                                                
       6910-UPDATE-ACTITRF SECTION.                                             
           MOVE '6910-UPDATE-ACTITRF       ' TO W-ROUTINE-1.                    
                                                                                
           EXEC SQL SELECT                                                      
                      ACAT_CONTROL_NBR                                          
                     ,TRNFR_TYPE_CD                                             
                     ,NSCC_PEND_CD                                              
                     ,PRCS_DT                                                   
                     ,PRGM_NM                                                   
                     ,UPDT_TMSTP                                                
                     ,TRNFR_TYPE_RJCT_CD                                        
               INTO  :W-ACTITRF-ACAT-CONTROL-NO                                 
                    ,:W-ACTITRF-TRNFR-TYPE-CD                                   
                    ,:W-ACTITRF-NSCC-PEND-CD                                    
                    ,:W-ACTITRF-PRCS-DT                                         
                    ,:W-ACTITRF-PRGM-NM                                         
                    ,:W-ACTITRF-UPDT-TMSTP                                      
                    ,:W-ACTITRF-TRNFR-TYPE-RJCT-CD                              
               FROM  ACTITRF                                                    
              WHERE  CLIENT_NBR        = :W-HDR-TI-CLIENT                       
                AND  RCV_NBR           = :W-HDR-TI-RCV-NBR                      
                AND  DLVR_NBR          = :W-HDR-TI-DLVR-NBR                     
                AND  ACCT_RCV_NBR      = :W-HDR-TI-ACCT-RCV-NBR                 
                AND  ACCT_DLVR_NBR     = :W-HDR-TI-ACCT-DLVR-NBR                
                AND  TRNFR_TYPE_CD     = 'RCR'                                  
           END-EXEC                                                             
                                                                                
           IF  SQLCODE  =  +0                                                   
               CONTINUE                                                         
           ELSE                                                                 
                   DISPLAY ' '                                                  
                   DISPLAY '6910:   ERROR SELECTING A ROW IN ACTITRF'           
                         ' (ACAT-VINTRNF    TABLE)'                             
                   DISPLAY 'CAT812: DCLACTITRF  ='                              
                           '(' DCLACTITRF ')'                                   
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
           END-IF.                                                              
                                                                                
           EXEC SQL                                                             
             UPDATE ACTITRF                                                     
                SET                                                             
                   ACAT_CONTROL_NBR    = :DCLACTITRF.ACAT-CONTROL-NBR           
                  ,PRCS_DT             = :DCLACTITRF.PRCS-DT                    
                  ,CYCLE_CD            = :DCLACTITRF.CYCLE-CD                   
                  ,SYS_ACT_CD          = :DCLACTITRF.SYS-ACT-CD                 
                  ,SYS_RJCT_RSN_CD     = :DCLACTITRF.SYS-RJCT-RSN-CD            
                  ,STTS_CD             = :DCLACTITRF.STTS-CD                    
                  ,DAYS_STTS_QTY       = :DCLACTITRF.DAYS-STTS-QTY              
                  ,RCRD_STTS_CD        = :DCLACTITRF.RCRD-STTS-CD               
                  ,RCRD_LNGTH_STTS_CD  = :DCLACTITRF.RCRD-LNGTH-STTS-CD         
                  ,PHSCL_SEQ_STTS_CD   = :DCLACTITRF.PHSCL-SEQ-STTS-CD          
                  ,LGCL_SEQ_NR_STS_CD  = :DCLACTITRF.LGCL-SEQ-NR-STS-CD         
                  ,TRANS_TYPE_STTS_CD  = :DCLACTITRF.TRANS-TYPE-STTS-CD         
                  ,CONTROL_NBR_STS_CD  = :DCLACTITRF.CONTROL-NBR-STS-CD         
                  ,TRNFR_TYPE_STTS_CD  = :DCLACTITRF.TRNFR-TYPE-STTS-CD         
                  ,SBMT_PRT_NR_STS_CD  = :DCLACTITRF.SBMT-PRT-NR-STS-CD         
                  ,RCV_NBR_STTS_CD     = :DCLACTITRF.RCV-NBR-STTS-CD            
                  ,DLVR_NBR_STTS_CD    = :DCLACTITRF.DLVR-NBR-STTS-CD           
                  ,ACCT_RCV_STTS_CD    = :DCLACTITRF.ACCT-RCV-STTS-CD           
                  ,RCV_CUST_NM_STS_CD  = :DCLACTITRF.RCV-CUST-NM-STS-CD         
                  ,RCV_SS_PRIM_STS_CD  = :DCLACTITRF.RCV-SS-PRIM-STS-CD         
                  ,RCV_SS_SCDY_STS_CD  = :DCLACTITRF.RCV-SS-SCDY-STS-CD         
                  ,RCV_ACT_TYP_STS_CD  = :DCLACTITRF.RCV-ACT-TYP-STS-CD         
                  ,RCV_OCC_STTS_CD     = :DCLACTITRF.RCV-OCC-STTS-CD            
                  ,RCV_CRSPN_STTS_CD   = :DCLACTITRF.RCV-CRSPN-STTS-CD          
                  ,ACCT_DLVR_STTS_CD   = :DCLACTITRF.ACCT-DLVR-STTS-CD          
                  ,TRN_TYP_RJC_STS_CD  = :DCLACTITRF.TRN-TYP-RJC-STS-CD         
                  ,CNTL_ASTD_STTS_CD   = :DCLACTITRF.CNTL-ASTD-STTS-CD          
                  ,STTLM_ASCTD_STS_CD  = :DCLACTITRF.STTLM-ASCTD-STS-CD         
                  ,TRANS_RFRN_STTS_CD  = :DCLACTITRF.TRANS-RFRN-STTS-CD         
                  ,CMNT_STTS_CD        = :DCLACTITRF.CMNT-STTS-CD               
                  ,ACCT_RCV_NBR        = :DCLACTITRF.ACCT-RCV-NBR               
                  ,RCV_CUST_NM         = :DCLACTITRF.RCV-CUST-NM                
                  ,RCV_SS_PRIM_NBR     = :DCLACTITRF.RCV-SS-PRIM-NBR            
                  ,RCV_SS_SCNDY_NBR    = :DCLACTITRF.RCV-SS-SCNDY-NBR           
                  ,RCV_ACCT_TYPE_CD    = :DCLACTITRF.RCV-ACCT-TYPE-CD           
                  ,RCV_OCC_BRKR_NBR    = :DCLACTITRF.RCV-OCC-BRKR-NBR           
                  ,RCV_CRSPN_NBR       = :DCLACTITRF.RCV-CRSPN-NBR              
                  ,PRTCP_CONTRA_CD     = :DCLACTITRF.PRTCP-CONTRA-CD            
                  ,ACCT_DLVR_NBR       = :DCLACTITRF.ACCT-DLVR-NBR              
                  ,TRNFR_TYPE_RJCT_CD  = :DCLACTITRF.TRNFR-TYPE-RJCT-CD         
                  ,ACAT_CNTL_ASTD_NBR  = :DCLACTITRF.ACAT-CNTL-ASTD-NBR         
                  ,STTLM_ASCTD_DT      = :DCLACTITRF.STTLM-ASCTD-DT             
                  ,TRANS_RFRN_ID_CD    = :DCLACTITRF.TRANS-RFRN-ID-CD           
                  ,CMNT_TXT            = :DCLACTITRF.CMNT-TXT                   
                  ,CICS_TERM_ID_CD     = :DCLACTITRF.CICS-TERM-ID-CD            
                  ,UPDT_TMSTP          = :DCLACTITRF.UPDT-TMSTP                 
                  ,PRGM_NM             = :DCLACTITRF.PRGM-NM                    
                  ,NSCC_PEND_CD        = :DCLACTITRF.NSCC-PEND-CD               
                  ,RR_CD               = :DCLACTITRF.RR-CD                      
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  RCV_NBR           = :WF-RCV-NBR                          
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                     
                  AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                    
                  AND  TRNFR_TYPE_CD     = 'RCR'                                
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTITRF-UPD-CNT                                       
DJ0001         PERFORM 8120-SQL-COMMIT THRU 8120-EXIT                           
***************DISPLAY*'INP='*W-INFILE-CNT******************************        
********************'*'*W-HDR-TI-CLIENT*********************************        
********************'*'*W-HDR-TI-BRANCH-CD******************************        
********************'*'*W-HDR-TI-ACCT-CD********************************        
**********************'*ACTITRF*UPDATED:'******************************         
*************************'*CTL='*W-ACTITRF-ACAT-CONTROL-NO*************         
*************************'*TFR='*W-ACTITRF-TRNFR-TYPE-CD***************         
************************'*PEND='*W-ACTITRF-NSCC-PEND-CD****************         
************************'*PRGM='*W-ACTITRF-PRGM-NM*********************         
************************'*UPDT='*W-ACTITRF-UPDT-TMSTP*(1:16)***********         
***********DISPLAY*'***'************************************************        
*****************'ASC-CTL='*ACAT-CNTL-ASTD-NBR*OF*DCLACTITRF***********         
********************************'*DLV='*WF-DLVR-NBR*********************        
*****************************'*DLV-AC='*WF-ACCT-DLVR-NBR****************        
********************************'*RCV='*WF-RCV-NBR**********************        
*****************************'*RCV-AC='*WF-ACCT-RCV-NBR*****************        
           ELSE                                                                 
               ADD 1 TO W-ACTITRF-NOT-UPD-CNT                                   
               DISPLAY 'INP=' W-INFILE-CNT                                      
                    ' ' W-HDR-TI-CLIENT                                         
                    ' ' W-HDR-TI-BRANCH-CD                                      
                    ' ' W-HDR-TI-ACCT-CD                                        
                         ' ACTITRF NOT UPDATED '                                
                         ' SQLCODE = ' W-DB2-SQLCODE                            
               DISPLAY '   '                                                    
                      'ACTITRF PRIMARY KEY:'                                    
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' TFR=' WF-TRNFR-TYPE-CD                              
               DISPLAY '    DLV=' WF-DLVR-NBR                                   
                       ' DLV-AC=' WF-ACCT-DLVR-NBR                              
                          ' RCV=' WF-RCV-NBR                                    
                       ' RCV-AC=' WF-ACCT-RCV-NBR                               
               DISPLAY '   '                                                    
                      'ACTITRF  UPDATE KEY:'                                    
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' TFR=' WF-TRNFR-TYPE-CD                              
               DISPLAY '    DLV=' WF-DLVR-NBR                                   
                       ' DLV-AC=' WF-ACCT-DLVR-NBR                              
                          ' RCV=' WF-RCV-NBR                                    
                       ' RCV-AC=' WF-ACCT-RCV-NBR                               
             IF  SQLCODE  =  +100                                               
                   DISPLAY '   ACTITRF UPDATE NOT FOUND.'                       
             END-IF                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT812: ERROR UPDATING A ROW IN ACTITRF'            
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT812: DCLACTITRF  ='                              
                           '(' DCLACTITRF ')'                                   
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
           END-IF.                                                              
                                                                                
       6910-EXIT. EXIT.                                                         
      /                                                                         
       7000-WRITE-ACATRCRF       SECTION.                                       
           MOVE '7000-WRITE-ACATRCRF               ' TO W-ROUTINE-1.            
                                                                                
           WRITE OUT-RECORD FROM ACATRCRF-RECORD.                               
           ADD 1 TO W-OUTPUT-CNT.                                               
           INITIALIZE WF-ASSET-AREA.                                            
                                                                                
       7000-EXIT. EXIT.                                                         
      /                                                                         
       7100-WRITE-ACATDLVF-TYPE3 SECTION.                                       
           MOVE '7100-WRITE-ACATDLVF-TYPE3         ' TO W-ROUTINE-1.            
                                                                                
           MOVE SPACES                   TO ACATDLVF-DETAIL-RECORD              
           MOVE BH-BROKER-NUMBER         TO ACATDLVF-ADP-CL-NO-X                
           MOVE WF-ACAT-CONTROL-NBR      TO ACATDLVF-CONTROL-NBR                
           MOVE WF-DLVR-NBR              TO ACATDLVF-DLVR-NBR                   
           MOVE WF-ACCT-DLVR-NBR         TO ACATDLVF-DLVR-ACCT                  
           MOVE WF-RCV-NBR               TO ACATDLVF-RCV-NBR                    
           MOVE WF-ACCT-RCV-NBR          TO ACATDLVF-RCV-ACCT                   
           MOVE 'RCR'                    TO ACATDLVF-TRNFR-TYPE-CD              
           MOVE 'B'                      TO ACATDLVF-RECORD-TYPE                
           MOVE W-HDR-TYPE1-BAL          TO ACATDLVF-TYPE1-BALANCE              
           MOVE W-HDR-TYPE2-BAL          TO ACATDLVF-TYPE2-BALANCE              
           MOVE W-HDR-TYPE3-BAL          TO ACATDLVF-TYPE3-BALANCE              
           MOVE W-HDR-TYPE5-BAL          TO ACATDLVF-TYPE5-BALANCE              
           MOVE W-HDR-SMA-BAL            TO ACATDLVF-SMA-BALANCE                
           MOVE W-HDR-TI-DAYS-STTS-QTY   TO ACATDLVF-DAYS-STTS-QTY.             
           MOVE W-BH-NSCC-PEND-CD        TO ACATDLVF-BAL-NSCC-PEND-CD.          
           MOVE W-HDR-TI-STTS-CD         TO ACATDLVF-STTS-CD.                   
LRM017     MOVE ZERO                     TO ACATDLVF-PEND-DVDND-DB-AMT.         
                                                                                
           WRITE ACATDLVF-RECORD.                                               
           ADD 1 TO W-ACATDLVF-CNT.                                             
                                                                                
       7100-EXIT. EXIT.                                                         
      /                                                                         
       7150-WRITE-SETTLING-TYPE3 SECTION.                                       
           MOVE '7150-WRITE-SETTLING-TYPE3         ' TO W-ROUTINE-1.            
                                                                                
           MOVE SPACES                   TO ACATDLVF-DETAIL-RECORD              
           MOVE BH-BROKER-NUMBER         TO ACATDLVF-ADP-CL-NO-X                
           MOVE WF-ACAT-CONTROL-NBR      TO ACATDLVF-CONTROL-NBR                
           MOVE WF-DLVR-NBR              TO ACATDLVF-DLVR-NBR                   
           MOVE WF-ACCT-DLVR-NBR         TO ACATDLVF-DLVR-ACCT                  
           MOVE WF-RCV-NBR               TO ACATDLVF-RCV-NBR                    
           MOVE WF-ACCT-RCV-NBR          TO ACATDLVF-RCV-ACCT                   
           MOVE 'RCR'                    TO ACATDLVF-TRNFR-TYPE-CD              
           MOVE 'C'                      TO ACATDLVF-RECORD-TYPE                
           MOVE W-HDR-TYPE1-BAL          TO ACATDLVF-TYPE1-BALANCE              
           MOVE W-HDR-TYPE2-BAL          TO ACATDLVF-TYPE2-BALANCE              
           MOVE W-HDR-TYPE3-BAL          TO ACATDLVF-TYPE3-BALANCE              
           MOVE W-HDR-TYPE5-BAL          TO ACATDLVF-TYPE5-BALANCE              
           MOVE W-HDR-SMA-BAL            TO ACATDLVF-SMA-BALANCE                
           MOVE W-HDR-TI-DAYS-STTS-QTY   TO ACATDLVF-DAYS-STTS-QTY.             
           MOVE W-BH-NSCC-PEND-CD        TO ACATDLVF-BAL-NSCC-PEND-CD.          
           MOVE W-HDR-TI-STTS-CD         TO ACATDLVF-STTS-CD.                   
LRM017     MOVE ZERO                     TO ACATDLVF-PEND-DVDND-DB-AMT.         
                                                                                
           WRITE ACATDLVF-RECORD.                                               
           ADD 1 TO W-ACATDLVF-CNT.                                             
                                                                                
       7150-EXIT. EXIT.                                                         
      /                                                                         
       7200-WRITE-ACATDLVF-FRAC SECTION.                                        
           MOVE '7200-WRITE-ACATDLVF-FRAC        ' TO W-ROUTINE-1.              
                                                                                
           MOVE SPACES                   TO ACATDLVF-DETAIL-RECORD              
           MOVE BH-BROKER-NUMBER         TO ACATDLVF-ADP-CL-NO-X                
           MOVE WF-ACAT-CONTROL-NBR      TO ACATDLVF-CONTROL-NBR                
           MOVE WF-DLVR-NBR              TO ACATDLVF-DLVR-NBR                   
           MOVE WF-ACCT-DLVR-NBR         TO ACATDLVF-DLVR-ACCT                  
           MOVE WF-RCV-NBR               TO ACATDLVF-RCV-NBR                    
           MOVE WF-ACCT-RCV-NBR          TO ACATDLVF-RCV-ACCT                   
           MOVE 'RCR'                    TO ACATDLVF-TRNFR-TYPE-CD              
           MOVE 'A'                      TO ACATDLVF-RECORD-TYPE                
                                                                                
           IF  (ACATRCRF-ACCOUNT-TYPE = '01' OR '03')                           
               MOVE 'C'                  TO ACATDLVF-CASH-MGN-IND               
           ELSE                                                                 
             IF  (ACATRCRF-ACCOUNT-TYPE = '02')                                 
                 MOVE 'M'                TO ACATDLVF-CASH-MGN-IND               
             ELSE                                                               
      *******IF**(ACATRCRF-ACCOUNT-TYPE = '05')                                 
                 MOVE 'S'                TO ACATDLVF-CASH-MGN-IND               
             END-IF                                                             
           END-IF                                                               
                                                                                
           IF  WORK-POS-QTY < 0                                                 
               MOVE 'S'                  TO ACATDLVF-PSTN-CD                    
           ELSE                                                                 
               MOVE 'L'                  TO ACATDLVF-PSTN-CD                    
           END-IF                                                               
                                                                                
           MOVE ACATRCRF-SECURITY        TO ACATDLVF-ADP-SECURITY               
           MOVE ACATRCRF-CUSIP           TO ACATDLVF-CUSIP-NUM                  
           MOVE W-ASSET-QTY-UNSIGN       TO ACATDLVF-QTY                        
           MOVE WORK-POS-VALUE           TO ACATDLVF-MARKET-VALUE               
           MOVE ACATRCRF-QTY-DECIMAL     TO ACATDLVF-FRAC-QTY                   
                                                                                
           COMPUTE ACATDLVF-FRAC-MARKET-VALUE ROUNDED =                         
                   ACATRCRF-QTY-DECIMAL * ACATRCRF-CLOSING-PRICE                
                                                                                
           IF  ACATRCRF-BOND                                                    
                   AND ACATDLVF-FRAC-MARKET-VALUE NOT = 0                       
               COMPUTE ACATDLVF-FRAC-MARKET-VALUE =                             
                       ACATDLVF-FRAC-MARKET-VALUE / 100                         
           END-IF                                                               
                                                                                
           MOVE STTLM-LCTN-CD OF DCLACTIAST TO ACATDLVF-SETTLING-LOC            
           MOVE STTLM-RSN-CD  OF DCLACTIAST                                     
                                            TO ACATDLVF-SETTLING-REASON         
           MOVE ASSET-PRC-CTGY-CD OF DCLACTIAST                                 
                                            TO ACATDLVF-ASSET-CATEGORY          
           MOVE ASSET-DESC-TXT OF DCLACTIAST (1:30)                             
                                            TO ACATDLVF-ASSET-DESC              
           MOVE W-BH-NSCC-PEND-CD        TO ACATDLVF-NSCC-PEND-CD.              
                                                                                
           IF ACATDLVF-FRAC-QTY = ZERO                                          
              GO TO 7200-EXIT                                                   
           END-IF.                                                              
                                                                                
           WRITE ACATDLVF-RECORD.                                               
           ADD 1 TO W-ACATDLVF-CNT.                                             
                                                                                
       7200-EXIT. EXIT.                                                         
      /                                                                         
       8120-SQL-COMMIT     SECTION.                                             
                                                                                
           EXEC SQL COMMIT                                                      
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO COMMIT-SQLCA                                         
           MOVE SQLCODE TO COMMIT-RETURN                                        
                                                                                
           IF  COMMIT-AB                                                        
               DISPLAY 'CAT812: '                                               
                   'SQL COMMIT FAILED. COMMIT-RETURN= '                         
                    COMMIT-RETURN                                               
                  ' INFILE-CNT= '           W-INFILE-CNT                        
                    ' PREV-CNT= '           W-LAST-COMMIT-INFILE-CNT            
           ELSE                                                                 
DJ0001         ADD 1 TO W-COMMIT-CNT                                            
           END-IF.                                                              
                                                                                
           MOVE W-INFILE-CNT             TO W-LAST-COMMIT-INFILE-CNT.           
                                                                                
       8120-EXIT. EXIT.                                                         
      /                                                                         
       8300-DISPLAY-KEY    SECTION.                                             
           DISPLAY '    KEY:'                                                   
                                ' CLT=' WF-CLIENT-NBR                           
                                ' CTL=' WF-ACAT-CONTROL-NBR                     
                                ' TFR=' WF-TRNFR-TYPE-CD                        
                                ' TRN=' WF-TRANS-TYPE-CD                        
           DISPLAY '   '                                                        
                                ' DLV=' WF-DLVR-NBR                             
                             ' DLV-AC=' WF-ACCT-DLVR-NBR                        
                                ' RCV=' WF-RCV-NBR                              
                             ' RCV-AC=' WF-ACCT-RCV-NBR                         
           DISPLAY '   '                                                        
                         ' SEC-CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
                         ' SEC-NO=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                         ' SEC-CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
                         ' STL-LC=' STTLM-LCTN-CD     OF DCLACTIAST             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
           .                                                                    
       8300-EXIT. EXIT.                                                         
      /                                                                         
       8500-SQL-ERROR      SECTION.                                             
           DISPLAY ' '                                                          
           DISPLAY '8500-SQL-ERROR'                                             
                  ' INFILE-CNT = ' W-INFILE-CNT                                 
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT                
                                                                                
           DISPLAY ' '                                                          
           CALL DSNTIAR-PROGRAM USING SQLCA W-DB2-MESSAGE-AREA                  
                                            W-DB2-MESSAGE-LEN.                  
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                                
             UNTIL W-DB2-IDX GREATER THAN 12                                    
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES                      
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)                       
                   END-IF                                                       
           END-PERFORM.                                                         
           DISPLAY ' '                                                          
                                                                                
           PERFORM 8700-SQL-ROLLBACK THRU 8700-EXIT                             
                                                                                
           DISPLAY 'CAT812: U3999 - ABENDING ON BAD DB2 STATUS'                 
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT812: PROGRAM ENDED ABNORMALLY'                           
           MOVE +3999 TO ABEND-CODE                                             
           CALL ABEND-PROGRAM USING ABEND-CODE  .                               
                                                                                
       8500-EXIT. EXIT.                                                         
      /                                                                         
       8700-SQL-ROLLBACK   SECTION.                                             
           DISPLAY '8700-SQL-ROLLBACK'                                          
                  ' INFILE-CNT = ' W-INFILE-CNT                                 
                  ' LAST-COMMIT-INFILE-CNT = '                                  
                                            W-LAST-COMMIT-INFILE-CNT            
                                                                                
           EXEC SQL ROLLBACK WORK                                               
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO ROLLBACK-SQLCA                                       
           MOVE SQLCODE TO ROLLBACK-RETURN                                      
                                                                                
           IF ROLLBACK-AB                                                       
               DISPLAY                                                          
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '                   
                   ROLLBACK-RETURN                                              
           ELSE                                                                 
               DISPLAY                                                          
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '               
                   ROLLBACK-RETURN                                              
           END-IF.                                                              
                                                                                
       8700-EXIT. EXIT.                                                         
      /                                                                         
       8900-DISPLAY-CNT   SECTION.                                              
           DISPLAY ' '                                                          
           DISPLAY 'CAT812: INFILE  COUNT      = ' W-INFILE-CNT                 
                 ' (INCLUDES HEADER AND TRAILER)'                               
           DISPLAY 'CAT812: DETAIL  COUNT      = ' W-DETAIL-CNT                 
                 ' (EXCLUDES HEADER AND TRAILER)'                               
           DISPLAY 'CAT812: OUTPUT   COUNT     = ' W-OUTPUT-CNT                 
                 ' (EXCLUDES HEADER AND TRAILER)'                               
           DISPLAY 'CAT812: ACATDLVF COUNT     = ' W-ACATDLVF-CNT               
                 ' (EXCLUDES HEADER AND TRAILER)'                               
LRM004     DISPLAY 'CAT812: W-LEGG-CNT         = ' W-LEGG-CNT                   
LRM004     DISPLAY 'CAT812: W-OMNIBUS-CNT      = ' W-OMNIBUS-CNT                
LRM011     DISPLAY 'CAT812: W-PNC-SURPAS-CNT   = ' W-PNC-SURPAS-CNT             
DJ0002     DISPLAY 'CAT812: BYPASS-ASSET-CNT   = ' W-BYPASS-CNT                 
DJ0002     DISPLAY 'CAT812: TI-NON-DEL-CNT     = '                              
DJ0002                                         W-TI-NON-DELIVERABLE-CNT         
DJ0002     DISPLAY 'CAT812: TI-SHORT-CNT       = ' W-TI-SHORT-CNT               
DJ0002     DISPLAY 'CAT812: TI-EXCEPTION-CNT   = ' W-TI-EXCEPTION-CNT           
DJ0002     DISPLAY 'CAT812: EXC-NON-DEL-CNT    = ' W-EXC-NON-CNT                
DJ0002     DISPLAY 'CAT812: EXC-DELIVERABLE-CNT= ' W-EXC-DEL-CNT                
           DISPLAY 'CAT812: BNWMAST-READ-CNT   = ' W-BNWMAST-CNT                
LRM020     DISPLAY 'CAT812: VMFHSTY FOUND      = ' W-VMFHSTY-FOUND-CNT          
LRM020     DISPLAY 'CAT812: VMFHSTY NOT FOUND  = ' W-VMFHSTY-NOTFND-CNT         
           DISPLAY 'CAT812: W-MFMSD-CNT        = ' W-MFMSD-CNT                  
DJ0009                    ' W-MFMSD-FND-CNT    = ' W-MFMSD-FND-CNT              
DJ0009     DISPLAY 'CAT812: W-MFEXBR-CNT       = ' W-MFEXBR-CNT                 
DJ0009                    ' W-MFEXBR-FND-CNT   = ' W-MFEXBR-FND-CNT             
           DISPLAY 'CAT812: W-CKDIGIT-CNT      = ' W-CKDIGIT-CNT                
           DISPLAY 'CAT812: SQL-CNT            = ' W-SQL-CNT                    
DJ0001     DISPLAY 'CAT812: W-COMMIT-CNT       = ' W-COMMIT-CNT                 
           DISPLAY 'CAT812: ACTIAST-ADD-CNT   = '   W-ACTIAST-ADD-CNT           
                          ' ACTIAST-NOT-ADD-CNT = '                             
                                                  W-ACTIAST-NOT-ADD-CNT         
DJ0001     DISPLAY 'CAT812: ACTIAST-UPD-CNT   = '   W-ACTIAST-UPD-CNT           
DJ0001                    ' ACTIAST-NOT-UPD-CNT = '                             
                                                  W-ACTIAST-NOT-UPD-CNT         
           DISPLAY 'CAT812: ACTIOPN-ADD-CNT   = '   W-ACTIOPN-ADD-CNT           
                          ' ACTIOPN-NOT-ADD-CNT = '                             
                                                  W-ACTIOPN-NOT-ADD-CNT         
DJ0001     DISPLAY 'CAT812: ACTIOPN-UPD-CNT   = '   W-ACTIOPN-UPD-CNT           
DJ0001                    ' ACTIOPN-NOT-UPD-CNT = '                             
                                                  W-ACTIOPN-NOT-UPD-CNT         
           DISPLAY 'CAT812: ACTIMF-ADD-CNT    = '    W-ACTIMF-ADD-CNT           
                          ' ACTIMF-NOT-ADD-CNT  = '                             
                                                   W-ACTIMF-NOT-ADD-CNT         
DJ0001     DISPLAY 'CAT812: ACTIMF-UPD-CNT    = '    W-ACTIMF-UPD-CNT           
DJ0001                    ' ACTIMF-NOT-UPD-CNT  = '                             
                                                   W-ACTIMF-NOT-UPD-CNT         
           DISPLAY 'CAT812: ACTITRF-ADD-CNT   = ' W-ACTITRF-ADD-CNT             
                          ' ACTITRF-NOT-ADD-CNT = '                             
                                                 W-ACTITRF-NOT-ADD-CNT          
           DISPLAY 'CAT812: ACTITRF-UPD-CNT   = ' W-ACTITRF-UPD-CNT             
                          ' ACTITRF-NOT-UPD-CNT = '                             
                                                 W-ACTITRF-NOT-UPD-CNT          
           .                                                                    
       8900-EXIT. EXIT.                                                         
      /                                                                         
       9000-CLOSE-ROUTINE SECTION.                                              
           MOVE '9000-CLOSE-ROUTINE            ' TO W-ROUTINE-1.                
                                                                                
           DISPLAY ' '.                                                         
           MOVE ' '                      TO ACATRCRF-TRL-REC                    
           MOVE 'T'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE W-OUTPUT-CNT             TO CP2-RECORD-COUNT.                   
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
                                                                                
           CALL ZP2HDTR-PROGRAM       USING CP2-AREA                            
                                            ACATRCRF.                           
                                                                                
           MOVE CP2-RETURN-RECORD        TO OUT-TRL-REC                         
           DISPLAY 'CAT812: ACATRCRF-TRL= ' OUT-TRL-REC (1:090)                 
                                                                                
           WRITE OUT-RECORD.                                                    
           DISPLAY 'CAT812: ACATRCRF  TRAILER WRITTEN. STATUS = '               
                                               ACATRCRF-FILE-STATUS.            
                                                                                
           DISPLAY ' '.                                                         
           MOVE ' '                      TO ACATDLVF-TRAILER-RECORD             
           MOVE 'T'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE W-ACATDLVF-CNT           TO CP2-RECORD-COUNT.                   
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
                                                                                
           CALL ZP2HDTR-PROGRAM       USING CP2-AREA                            
                                            ACATDLVF.                           
                                                                                
           MOVE CP2-RETURN-RECORD        TO ACATDLVF-TRAILER-RECORD             
           DISPLAY 'CAT812: ACATDLVF-TRL= ' ACATDLVF-TRAILER-RECORD             
                                                                                
           WRITE ACATDLVF-RECORD.                                               
           DISPLAY 'CAT812: ACATDLVF  TRAILER WRITTEN. STATUS = '               
                                               ACATDLVF-FILE-STATUS.            
                                                                                
           CLOSE INFILE                                                         
           DISPLAY 'CAT812: INFILE    CLOSED. STATUS = '                        
                                             INFILE-STATUS.                     
                                                                                
           CLOSE MFMSD                                                          
           DISPLAY 'CAT812: MFMSD    CLOSED. STATUS = '                         
                                             MFMSD-STATUS.                      
           CLOSE BNWMAST                                                        
           DISPLAY 'CAT812: BNWMAST  CLOSED. STATUS = '                         
                                             BNWMAST-STATUS.                    
           CLOSE BNWREGOP                                                       
           DISPLAY 'CAT812: BNWREGOP CLOSED. STATUS = '                         
                                             BNWREGOP-STATUS.                   
DJ0009     CLOSE MFEXBR                                                         
DJ0009     DISPLAY 'CAT812: MFEXBR   CLOSED. STATUS = '                         
DJ0009                                       MFEXBR-STATUS.                     
           CLOSE ACATRCRF                                                       
           DISPLAY 'CAT812: ACATRCRF CLOSED. STATUS = '                         
                                             ACATRCRF-FILE-STATUS.              
                                                                                
           CLOSE ACATDLVF                                                       
           DISPLAY 'CAT812: ACATDLVF CLOSED. STATUS = '                         
                                             ACATDLVF-FILE-STATUS.              
                                                                                
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT812: PROGRAM ENDED SUCCESSFULLY'.                        
                                                                                
       9000-EXIT. EXIT.                                                         
      *################################################################         
