000001* PDX    - CAT518   C0360671 02/23/15 11:32:38 TBLAMUR            00001000
      * LRM036 SSR# 99150 MARK CONTRA CUSIP POSN AS WHI-STTS-CD = C TO          
      *   CAUSE ONLINE DSPLY WARNING WHEN CLIENT REMOVES THE WITHHELD.          
000001* PDX    - CAT518   C0355480 06/12/14 11:37:03 TBLAMUR            00001000
000001* CSG001 SSR 101121 REPLACE ILLEGAL CHARS IN MSD-DESC WITH SPACES.        
000001* LRM034 SSR# 95308 USE EXPANDED MSD OPTION FACTOR                        
000001* PDX    - CAT518   C0353648 04/07/14 10:57:56 TBLAMUR            00001000
000001* LRM033 SSR 100417 SET FUND AGENT CD NEW COL ON ACTIMF                   
000001* PDX    - CAT518   C0346158 10/11/13 15:03:03 TBLAMUR            00001000
000001* LRM032 SSR 83186 MMF NOT VALUED AT $1.00 PER SHARE, USE                 
000001*   THE MARKET VALUE, NOT THE QTY ON THESE POSITIONS.  CHANGE TO          
000001*   USE COPYBOOK CUSHOL (FROM HOLDAVSM) TO OBTAIN THE MMF CENTS.          
000001* PDX    - CAT518   C0344128 09/16/13 09:59:39 TBLAMUR            00001000
000001* LRM031 SSR 94296 RECOMPILE FOR EXPANDED BNWMASTW AND                    
      *    NEW COPYBOOK VERSION FOR NTWIOREC.                                   
000001* PDX    - CAT518   C0336625 06/17/13 08:58:34 TBLAMUR            00001000
000001* LRM030 SSR 85742 DST/SCHWAB SUPER OMNI FUNDS.                           
000001*  NTWMAST VALUE 5 USE WAIVE ACCOUNT.                                     
000001*  FIX FOR OPTION SYMBOL LOW-VALUES.                                      
000001* PDX    - CAT518   C0336021 06/13/13 09:02:20 TBLAMUR            00001000
000001* LRM031 SSR 80735 MMF SWEEP CODE EXPAND TO 999.                          
      *  NO CHANGES TO ICTL TABLE AT THIS TIME; SEPERATE SSR TO FOLLOW.         
000001* PDX    - CAT518   C0331869 10/21/12 15:06:36 TBLAMUR            00001000
000001* LRM029 SSR 86655 CAUSE NON PRICED ASSETS TO BY .01 PER SHARE            
      *   NOT 1.00 (WAS MOVING QTY TO AMT); IF THE AMT IS LESS THAN             
      *   $1.00, TO USE $1.00.                                                  
000001* PDX    - CAT518   C0329036 10/10/12 15:30:28 TBLAMUR            00001000
      * LRM028 SSR 85105 USE ISIN (ALL 12 BYTES) WHEN COUNTRY CODE              
      *   CUSIP DOES NOT EXIST ON MSD.                                          
000001* PDX    - CAT518   C0328075 06/26/12 13:40:24 TBLAMUR            00001000
      * LRM027 SSR 83475 SEND SPAD EXCPTIONS TO ASCENDIS BY WRITING             
      *   OUT ON CATEXCP FILE.                                                  
000001* PDX    - CAT518   C0323974 05/08/12 08:47:40 TBLAMUR            00001000
      * LRM026 FULFILL DELIVERY FROM REAMINING QTY AFTER MEMO QTY WTHLD         
000001* PDX    - CAT518   C0322691 02/09/12 11:21:12 TBLAMUR            00001000
      * LRM025 SSR 83515.  REMOVE OPTION SYMBOL USAGE IN KEY AREAS              
      *   ON POSN AND REQUEST TABLES, TO CAUSE THE ADP NUMBER TO                
      *   BE USED TO MATCH OPTION DELIVERY REQUEST TO POSITIONS.                
000001* PDX    - CAT518   C0317345 12/12/11 09:35:39 TBLAMUR            00001000
      * LRM024 SSR 80728 WITHHOLD MUTUAL FUND WITH NTW LVL=4 WHEN               
      *   B1 434743 = 0, WHICH IS THE DEFAULT TO WITHHOLD, VALUE 1 MEANS        
      *   TO DELIVER.                                                           
000001* PDX    - CAT518   C0314001 07/08/11 15:08:26 TBLAMUR            00001000
      * LRM023 SSR 78888 PRT OPTION REQUEST WITHOUT LONG/SHORT FIX.             
000001* PDX    - CAT518   C0309469 03/17/11 16:01:15 TBLAMUR            00001000
      * LRM022 SSR 74450 FULFILL FULL REQUEST FOR SHORT POSITION                
000001* PDX    - CAT518   C0299269 08/23/10 14:59:24 TBLAMUR            00001000
000001* PDX    - CAT518   C0299269 08/09/10 13:29:24 TBLAMUR            00001000
      * LRM021 SSR 62889 CONTINUED... ADD PARTIALLY CALLED BOND LOOKUP          
000001* PDX    - CAT518   C0295620 07/02/10 09:58:01 TBLAMUR            00001000
      * LRM020 SSR 62889 WITHHOLD MATURING OR CALLED BONDS; CREATE              
      *   MEMO RATHER THAN DELIVERY ASSET. B1 434748 HAS 3 SETTINGS,            
      *   1 - BYPASS SEC, 2 - CREATE MEMO, 3 MEMO AND (ADD TO X SCREEN          
      *   INSERT ACTIAST ROW CLIENT= W### TO DRIVE X SCREEN UPDATE).            
      * LRM019 SSR 67428 OVER-MEMO PTR CLOSE PURGE                              
000001* PDX    - CAT518   C0292845 04/06/10 13:30:26 TBLAMUR            00001000
      * LRM018 SSR 67411 PNC SURPAS FUNDS                                       
      * LRM017 SSR 66790 TO INCLUDE REORG COMMENT ON MEMO-ED ASSET              
000001* PDX    - CAT518   C0290020 01/26/10 14:42:40 TBLAMUR            00001000
      * LRM016 SSR 59603 OPTION SYMB; REMOVE HARDCODE Q STREAM                  
      * LRM015 SSR 59603 OPTION SYMBOLOGY CONTINUED. POPULATE                   
      *   STPRC-INTEGER2-AMT                                                    
000001* PDX    - CAT518   C0287084 11/03/09 07:45:41 TBLAMUR            00001000
      * LRM016 SSR 66946 CAMS THRESHOLD FUND EXPANSION.                         
000001* PDX    - CAT518   C0286143 10/30/09 08:53:01 TBLAMUR            00001000
      * LRM015 SSR 59603 OPTION SYMBOLOGY CHANGES.                              
      *   ADD PARM-STREAM = Q HARD CODE AT THIS TIME.                           
      *   CHANGE ASSET DESC FORMATTING WHEN MSD NOTFND FOR OPTIONS.             
      *   USE EXPANDED STRIKE PRICE FROM MSD.  CHANGE OPT SYMBOL TO USE         
      *   MSD-OCC-OPTN-SYM-ID, AND WHEN MISSING, CALL MSD TO                    
      *   OBTAIN THE UNDERLYING SEC SYMBOL; REMOVE OPRA CODE LOGIC.             
000001* PDX    - CAT518   C0278316 04/13/09 11:21:10 TBDOJUN            00001000
      * DJ0014 SSR 61075 FRACTIONAL SHARES ON MUNI TAX EXEMPT UNITS             
      * DJ0014 SSR 61867 USE ADP-NO TO READ VRSTSEC(NO MORE CUSIP)              
000001* PDX    - CAT518   C0275568 03/09/09 09:54:02 TBDOJUN            00001000
      * DJ0013 SSR 61065 BH-MF-EXBR-OPTION(537483)=1,USE MF EXBR TABLE          
      * DJ0013 FOR THE MUTUAL FUND EXECUTING BROKER NUMBER                      
000001* PDX    - CAT518   C0273186 11/17/08 09:33:21 TBDOJUN            00001000
      * DJ0012 SSR 59508 FOR SMA, ADD TO MEMO COUNT.                            
      * DJ0012 SSR 55766 ASCENDIS(WORKFLOW) PARALLEL RUN. FIX SYNTAX.           
000001* PDX    - CAT518   C0269375 10/20/08 14:47:21 TBDOJUN            00001000
      * DJ0011 SSR 59508 IF TRANSFER HAS ONLY MEMO ASSETS, REJECT               
      * DJ0011 SSR 55766 ASCENDIS(WORKFLOW) PARALLEL RUN                        
000001* PDX    - CAT518   C0266770 07/14/08 08:36:47 TBDOJUN                    
      * DJ0010 SSR 55171 READ ACTRBSC TABLE FOR MMF DELIVER AS CASH             
      * DJ0010 USE LD-PROC-DATE INSTEAD OF DATE FROM P2HDTR                     
000001* PDX    - CAT518   C0266444 06/12/08 11:12:58 TBDOJUN                    
      * DJ0009 SSR 55766 ASCENDIS(WORKFLOW) SET ASCENDIS INDICATOR              
      * DJ0009 FOR FUL,PTR,PTD ONLY AND BH-ACAT-ASCENDIS-USER = '1'             
      * DJ0009 SSR 56200 WHEN ISSUE INDICATOR CHANGES                           
      * DJ0009           SORT WHEN-ISSUE FIRST TO MATCH ON                      
      * DJ0009           MATCH ASSETS BY FIRST 35 BYTES OF KEY                  
      * DJ0009 SSR 57232 DO NOT LIQUIDATE FRACTIONS IF THERE ARE                
      * DJ0009           WHOLE QUANTITIES LEFT                                  
000001* PDX    - CAT518   C0262101 03/11/08 11:35:20 TBLAMUR                    
      * LRM010 - SSR 54019 CLIENT 6 CONVERSION 12 DIGIT ACCT NBR                
000001* PDX    - CAT518   C0249658 08/16/07 08:53:18 TBLAMUR                    
      * LRM009 - SSR 51567 SHORTEN CYCLE, CREATE ASSETS ON HOLD, TO             
      *        BE RELEASED BY CAT521 AFTER CYCLE 1 RUNS.                        
000001* PDX    - CAT518   C0249006 06/29/07 12:11:33 TBDOJUN                    
      * DJ0008 SSR 47339 SUPPORT DUALLY LISTED SECURITIES                       
      *                  POPULATE GETMSD-CLIENT-PL2 WHEN CALLING GETMSD         
000001* PDX    - CAT518   C0235973 07/10/06 10:04:45 TBDOJUN                    
      * DJ0007 - SSR 44420 USE MSD PRICE MULTIPLIER                             
000001* PDX    - CAT518   C0234715 06/12/06 08:08:33 TBDOJUN                    
      * DJ0006 - SSR 45744 ACCOUNT-FREEZE EDIT                                  
000001* PDX    - CAT518   C0231736 04/13/06 15:10:10 TBDOJUN                    
      * DJ0005 - SSR# 44629 - MAINTAIN ONE MF NETWORK LEVEL                     
      * DJ0005 - B1#537486: 1=ONE NETWORK-LEVEL 3 FUND ACCOUNT                  
      * DJ0005 - IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                             
000001* PDX    - CAT518   C0230098 02/16/06 10:25:42 TBDOJUN                    
      * LRM001 - SSR 45101 DELIVER CAMS THRESHOLD FUNDS AS CASH.                
      * LRM001 - TREATED LIKE PRIMARY FUNDS.                                    
000001* PDX    - CAT518   C0224713 10/10/05 10:26:15 TBDOJUN                    
      * DJ0004 - SSR#43083 CHANGE PERCENTAGE LOGIC.                             
      * DJ0004 - USE ASSET QUANTITY REQUEST INDICATOR "F" FOR 100%.             
000001* PDX    - CAT518   C0224381 08/11/05 10:27:14 TBDOJUN                    
      * DJ0003 - SSR#43215 CORRECT FULL-PARTIAL INDICATOR                       
000001* PDX    - CAT518   C0223247 07/11/05 10:23:17 TBDOJUN                    
      * DJ0002 - SSR#43420 USE STATUS<500 WHEN CHECKING OTHER CASH              
000001* PDX    - CAT518   C0223185 07/07/05 15:18:26 TBDOJUN                    
      * DJ0001 - PMR#2423532 TASK#43387 RESET REMOVE-FRACTION-SW                
000001* PDX    - CAT518   C0216587 05/31/05 15:09:35 TBDOJUN                    
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT518.                                                     
      *****************************************************************         
      * THIS PROGRAM CONTAINS DB2.                                    *         
      *****************************************************************         
      * CAT518 - EXTRACT ASSETS FOR NEW PTR TRANSFER REQUEST.         *         
      *           WE ARE THE DELIVERER.                               *         
      *           LOAD DB2 DATABASE WITH REQUESTED ASSETS.            *         
      *           PTR PHASE 2 - AUTO-VALIDATION                       *         
      *                                                               *         
DJ0013*  BH-ACAT-SUBMIT-ASSETS-PTR (434714) > 0 = AUTO-VALIDATE       *         
DJ0013*  B1#434714 = 0 - DO NOT AUTO-VALIDATE, BYPASS THIS CLIENT.    *         
DJ0013*  B1#434714 > 0 - AUTO-VALIDATE, GET ASSETS, AND LOAD          *         
      *                                                               *         
      * SELECT PTR  TRANSFER DELIVERY REQUESTS FROM THE NSCC M FILE.  *         
      *                                                               *         
      * 1. READ SIAC FILE AND GET MEMO-PTR ADDS.                      *         
      *    RETRIEVE THE CORRESPONDING VTRNFR,VASSET,VMF,VOPTN.        *         
      *    CREATE A FILE CONTAINING THE RETRIEVED DATA.               *         
      * 2. READ CUSBAL AND CUSHOL AND                                 *         
      *    CREATE A FILE IN ACTIAST,ACTIMF,ACTIOPT FORMAT             *         
      *    CONTAINING THE ASSETS FOR THE ACCOUNTS.                    *         
      * 3. FLAG EXCEPTIONS AND WRITE REJECTS                          *         
      * 4. CREATE A FILE FOR TRANSFER FEE, FRACTIONS, TYPE 3.         *         
      * 5. LOAD DB2 DATABASE WITH REQUESTED ASSETS.                   *         
      *                                                               *         
      * INPUT  -                                                      *         
      *        - EXTRACTED NSCC FILE                                  *         
      *        - BALANCE FILE                                         *         
      *        - POSITION FILE                                        *         
      *        - MRGIMM MEMO  FILE                                    *         
      *        - B1                                                   *         
      * OUTPUT -                                                      *         
      *        - EXTRACTED DATABASE FILE FOR MATCHING IN CAT518       *         
      *        - B***.CAT518.ACATPTRR                                 *         
      *        - ASSET     DATA FILE FOR CAT518  TO LOAD DATABASE.    *         
      *        - B***.CAT518.ACATPTRF                                 *         
      *        - LIQUIDATE FRACTIONS, TYPE 3, TRANFER FEE.            *         
      *        - B***.CAT518.ACATDLVF                                 *         
      *                                                               *         
      * BH-ACAT-REJ-PEND-FULL-REC-AMT  (434556)   REJECT IF >=        *         
      * BH-ACAT-REJ-DEL-MARGIN-DEBIT                                  *         
      * BH-ACAT-REJ-DEL-ASSET-VALUE                                   *         
      * BH-ACAT-REJ-DEL-TOTL-ACT-VAL                                  *         
      * BH-ACAT-REJ-PEND-DEL-SPAD-NO   (434557)   REJECT IF '1'       *         
      * BH-ACAT-REJ-PEND-DEL-SPADS     (434557)   REJECT IF '1'       *         
      * BH-ACAT-REJ-PEND-FULL-DEL-NTS  (434560)   REJECT IF '1'       *         
      * BH-ACAT-REJ-PEND-FULL-DEL-LP   (434562)   REJECT IF '1'       *         
      * BH-ACAT-REJ-PEND-FULL-DEL-PRIV (434567)   REJECT IF '1'       *         
      **BH-ACAT-REJ-PEND-PTR-DEL-FLAT  (434572)   REJECT IF '1'       *         
      *                                                               *         
      * BH-ACAT-FRACT-ON-CNS-ELIG-SEC  (434521)   FUL                 *         
      * BH-ACAT-WHOLD-STK-REC-MEMO     (434533)   FUL                 *         
      *                                                               *         
      * BH-ACAT-OPTION-POS-ON-PTR      (434709)   PTR                 *         
      * BH-ACAT-OPEN-ORDERS-ON-PTR     (434710)   PTR                 *         
      * BH-ACAT-MMF-ON-PTR             (434711)   PTR SAME AS 434510  *         
      * BH-ACAT-MEMO-ASSETS-FOR-PTR    (434713)   PTR                 *         
      * BH-ACAT-SUBMIT-ASSETS-PTR      (434714)   PTR SAME AS 434516  *         
      * BH-ACAT-PTR-REJECT-NO-ASSET    (434715)   PTR                 *         
      * BH-ACAT-PTR-ASSETS             (434716)   PTR                 *         
      * BH-ACAT-PTR-ASSETS-TYPE        (434717)   PTR                 *         
      * BH-ACAT-WH-ASSET-ON-CONTR-CUS  (434719)   PTR SAME AS 434517  *         
      *                                                               *         
      *****************************************************************         
      * 02/02/05 DJ SSR#39561 NEW PROGRAM                             *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-FILE-STATUS.          
                                                                                
           SELECT MMF-FILE          ASSIGN TO MMFFL.                            
                                                                                
           SELECT MRGIMM            ASSIGN TO MRGIMM                            
                  ACCESS            DYNAMIC                                     
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     MRGIMM-SEQ-KEY                              
                  FILE STATUS IS    MRGIMM-STATUS.                              
                                                                                
           SELECT PRNGFL            ASSIGN TO PRNGFL                            
                  ACCESS            DYNAMIC                                     
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     PRNGKEY                                     
                  FILE STATUS IS    PRNGFL-STATUS.                              
                                                                                
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
                                                                                
DJ0013     SELECT MFEXBR            ASSIGN TO MFEXBR                            
DJ0013            ACCESS            DYNAMIC                                     
DJ0013            ORGANIZATION      INDEXED                                     
DJ0013            RECORD KEY IS     EXBR-KEY                                    
DJ0013            FILE STATUS IS    MFEXBR-STATUS.                              
                                                                                
           SELECT ACATPTRR         ASSIGN      TO ACATPTRR                      
                                   FILE STATUS IS ACATPTRR-STATUS.              
                                                                                
           SELECT ACATPTRF         ASSIGN      TO ACATPTRF                      
                                   FILE STATUS IS ACATPTRF-STATUS.              
                                                                                
           SELECT ACATPTRP         ASSIGN      TO ACATPTRP                      
                                   FILE STATUS IS ACATPTRP-STATUS.              
                                                                                
           SELECT ACATDLVF         ASSIGN      TO ACATDLVF                      
                                   FILE STATUS IS ACATDLVF-STATUS.              
                                                                                
LRM027     SELECT CATEXCP          ASSIGN      TO CATEXCP                       
LRM027                             FILE STATUS IS CATEXCP-FILE-STATUS.          
                                                                                
           SELECT SORT-FILE              ASSIGN TO  UT-S-SORTWK01.              
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 3326 CHARACTERS                  
              DEPENDING ON W-REC-LEN-IN                                         
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:== BY ==INFILE==.                
      /                                                                         
       FD  MMF-FILE                                                             
           LABEL RECORDS ARE STANDARD                                           
           RECORDING MODE IS V                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
           COPY CATMMF  REPLACING ==:CAT:== BY ==I==.                           
                                                                                
      /                                                                         
       FD  MRGIMM.                                                              
           COPY  POSMEMOR REPLACING ==:POSMEMO:== BY ==MRGIMM==.                
      /                                                                         
       FD  PRNGFL.                                                              
           COPY PRNGRECC.                                                       
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
DJ0013 FD  MFEXBR.                                                              
DJ0013 01  MFEXBR-REC.                                                          
DJ0013     COPY MFEXBR.                                                         
      /                                                                         
       FD  ACATPTRR                                                             
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  REQ-RECORD.                                                          
           COPY ACATPTRR REPLACING ==:PTRR:== BY ==REQ==.                       
      /                                                                         
       FD  ACATPTRF                                                             
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  FIN-RECORD.                                                          
           COPY ACATPTRF REPLACING ==:PTRF:== BY ==FIN==.                       
      /                                                                         
       FD  ACATPTRP                                                             
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
       01  AST-RECORD.                                                          
           COPY ACATPTRF REPLACING ==:PTRF:== BY ==AST==.                       
      /                                                                         
LRM027 FD  CATEXCP                                                              
LRM027     RECORDING MODE IS F                                                  
LRM027     BLOCK CONTAINS 0 RECORDS.                                            
LRM027     COPY CATEXCP REPLACING ==:CATEXCP:== BY ==CATEXCP==.                 
      /                                                                         
       FD  ACATDLVF                                                             
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
           COPY ACATDLVF REPLACING ==:FMT:== BY ==ACATDLVF==.                   
      /                                                                         
       SD  SORT-FILE.                                                           
                                                                                
       01  SORT-RECORD.                                                         
      ***--CONTAINS BOTH ACATPTRR AND ACATPTRF RECORDS                          
      ***--KEY LENGTH = 80                                                      
           COPY ACATPTRF REPLACING ==:PTRF:== BY ==SORT==.                      
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
           COPY PDXIDCOB.                                                       
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT518'.            
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.                 
           05  NTW-NSCCSRC-ACCT-FLAG        PIC  X(01)  VALUE SPACES.           
               88  NTW-NSCCSRC-ACCT                     VALUE 'Y'.              
               88  NTW-NOT-NSCCSRC-ACCT                 VALUE 'N'.              
           05  END-OF-INPUT-SW           PIC  X(001) VALUE '0'.                 
               88 END-OF-INPUT                       VALUE '1'.                 
           05  END-OF-SORT-SW            PIC  X(001) VALUE '0'.                 
               88 END-OF-SORT                        VALUE '1'.                 
           05  EOF-MMF-SW                PIC  X(001) VALUE '0'.                 
               88 EOF-MMF                            VALUE '1'.                 
           05  INFILE-FILE-STATUS        PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING VALUE '35'.                              
           05  BALNC-STATUS              PIC X(002).                            
               88 BALNC-OKAY             VALUE '00' THRU '09', '97'.            
               88 BALNC-END-OF-FILE      VALUE '10'.                            
               88 BALNC-NOT-FOUND        VALUE '23'.                            
               88 BALNC-EMPTY-MISSING    VALUE '35'.                            
           05  POSVSAM-STATUS            PIC X(002).                            
               88 POSVSAM-OKAY           VALUE '00' THRU '09', '97'.            
               88 POSVSAM-END-OF-FILE    VALUE '10'.                            
               88 POSVSAM-NOT-FOUND      VALUE '23'.                            
               88 POSVSAM-EMPTY-MISSING  VALUE '35'.                            
           05  PRNGFL-STATUS             PIC X(002).                            
               88 VALID-PRNGFL-STATUS    VALUE '00' '04' '10' '23'.             
               88 PRNGFL-OKAY            VALUE '00' THRU '09', '97'.            
               88 PRNGFL-END-OF-FILE     VALUE '10'.                            
               88 PRNGFL-NOT-FOUND       VALUE '23'.                            
               88 PRNGFL-EMPTY-MISSING   VALUE '35'.                            
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
DJ0013     05  MFEXBR-STATUS             PIC X(002).                            
DJ0013         88 VALID-MFEXBR-STATUS    VALUE '00' '04' '10' '23'.             
DJ0013         88 MFEXBR-OKAY            VALUE '00' THRU '09', '97'.            
DJ0013         88 MFEXBR-END-OF-FILE     VALUE '10'.                            
DJ0013         88 MFEXBR-NOT-FOUND       VALUE '23'.                            
DJ0013         88 MFEXBR-EMPTY-MISSING   VALUE '35'.                            
           05  ACATPTRR-STATUS           PIC  X(002).                           
               88 ACATPTRR-OKAY          VALUE '00' THRU '09', '97'.            
               88 ACATPTRR-END-OF-FILE   VALUE '10'.                            
               88 ACATPTRR-EMPTY-MISSING VALUE '35'.                            
           05  ACATPTRF-STATUS           PIC  X(002).                           
               88 ACATPTRF-OKAY          VALUE '00' THRU '09', '97'.            
               88 ACATPTRF-END-OF-FILE   VALUE '10'.                            
               88 ACATPTRF-EMPTY-MISSING VALUE '35'.                            
           05  ACATPTRP-STATUS           PIC  X(002).                           
               88 ACATPTRP-OKAY          VALUE '00' THRU '09', '97'.            
               88 ACATPTRP-END-OF-FILE   VALUE '10'.                            
               88 ACATPTRP-EMPTY-MISSING VALUE '35'.                            
           05  ACATDLVF-STATUS           PIC  X(002).                           
               88 ACATDLVF-OKAY          VALUE '00' THRU '09', '97'.            
               88 ACATDLVF-END-OF-FILE   VALUE '10'.                            
               88 ACATDLVF-EMPTY-MISSING VALUE '35'.                            
LRM027     05  CATEXCP-FILE-STATUS       PIC  X(002).                           
LRM027         88 CATEXCP-OKAY           VALUE '00' THRU '09', '97'.            
LRM027         88 CATEXCP-END-OF-FILE    VALUE '10'.                            
LRM027         88 CATEXCP-EMPTY-MISSING VALUE '35'.                             
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.                 
               88 INFILE-DATE-FOUND                  VALUE 'Y'.                 
           05  END-OF-ASSET-SW         PIC X(1)    VALUE ' '.                   
               88  END-OF-ASSET        VALUE 'Y'.                               
           05  END-OF-OPTION-SW        PIC X(1)    VALUE ' '.                   
               88  END-OF-OPTION       VALUE 'Y'.                               
           05  END-OF-MF-SW            PIC X(1)    VALUE ' '.                   
               88  END-OF-MF           VALUE 'Y'.                               
           05  VASSET-SW                     PIC X     VALUE SPACE.             
               88  VASSET-SELECTED                     VALUE 'Y'.               
           05  VOPTION-SW                    PIC X     VALUE SPACE.             
               88  VOPTION-SELECTED                    VALUE 'Y'.               
           05  VMF-SW                        PIC X     VALUE SPACE.             
               88  VMF-SELECTED                        VALUE 'Y'.               
           05  W-SYS-DATE                PIC  9(006) VALUE 0.                   
           05  FILLER  REDEFINES                                                
               W-SYS-DATE.                                                      
               10  W-UPD-DATE            PIC  X(006).                           
           05  W-SYS-TIME                PIC  9(008) VALUE 0.                   
           05  FILLER  REDEFINES                                                
               W-SYS-TIME.                                                      
               10  W-UPD-TIME            PIC  X(006).                           
               10  W-UPD-TIME-MS         PIC  X(002).                           
           05  W-TODAY-DATE              PIC  9(008) VALUE 0.                   
           05  LD-PROC-DATE.                                                    
               10 LD-PROC-DATE-MM        PIC  X(002).                           
               10 LD-PROC-DATE-DD        PIC  X(002).                           
               10 LD-PROC-DATE-YY        PIC  X(002).                           
           05  W-EXP-OPT-ACT             PIC  X(001) VALUE '0'.                 
           05  W-EXP-OPT-DAYS            PIC  9(003) VALUE 0.                   
           05  W-EXP-OPT-DATE            PIC  9(008) VALUE 0.                   
LRM020     05  W-BOND-EXP-ACT            PIC  X(001) VALUE '0'.                 
LRM020     05  W-NUM-BOND-TO-EXP         PIC  9(003) VALUE 0.                   
LRM020     05  WK-BOND-EXP-DATE          PIC  9(8).                             
LRM020     05  WK-MS-BOND-EXP-DATE-DB2.                                         
LRM020         10  WK-MS-BOND-EXP-CCYY   PIC X(4).                              
LRM020         10  FILLER                PIC X(1) VALUE '-'.                    
LRM020         10  WK-MS-BOND-EXP-MM     PIC X(2).                              
LRM020         10  FILLER                PIC X(1) VALUE '-'.                    
LRM020         10  WK-MS-BOND-EXP-DD     PIC X(2).                              
LRM020     05  W-CLIENT-NBR-AUD          PIC  X(004).                           
LRM020     05  FILLER REDEFINES W-CLIENT-NBR-AUD.                               
LRM020         10  W-CLIENT-NBR-AUD-PFX  PIC  X(001).                           
LRM020         10  W-CLIENT-NBR-AUD-SFX  PIC  X(003).                           
                                                                                
LRM021     05  WK-TODAY-DB2              PIC X(10).                             
LRM021     05  FILLER REDEFINES WK-TODAY-DB2.                                   
LRM021         10  WK-TODAY-DB2-CCYY     PIC X(4).                              
LRM021         10  WK-TODAY-DB2-DASH1    PIC X(1).                              
LRM021         10  WK-TODAY-DB2-MM       PIC X(2).                              
LRM021         10  WK-TODAY-DB2-DASH2    PIC X(1).                              
LRM021         10  WK-TODAY-DB2-DD       PIC X(2).                              
                                                                                
           05 W-PRIVATE-RANGE.                                                  
               10 W-PRIVATE-RANGE-FUNDS  PIC  X(007).                           
                  88 W-PRIV-RANGE-SECURITY    VALUE '8022143'                   
                                               THRU '8022152',                  
                                                    '8022159',                  
                                                    '8864350'.                  
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.                 
               88 HDR-FOUND                          VALUE 'H'.                 
               88 TRL-FOUND                          VALUE 'T'.                 
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.                 
               88 BRK-FOUND                          VALUE 'Y'.                 
           05  W-GETNA-FND-CNT           PIC  9(009) COMP-3 VALUE 0.            
           05  W-GETNA-NOTFND-CNT        PIC  9(009) COMP-3 VALUE 0.            
           05  W-MMF-FOUND               PIC  X(001) VALUE ' '.                 
           05  FILLER                    PIC  X(008) VALUE 'MMFFLCNT'.          
           05  W-MMF-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.          
           05  W-INFILE-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.          
           05  W-DETAIL-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'LOAD-CNT'.          
           05  W-LOAD-CNT                PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'ACATPTRR'.          
           05  W-ACATPTRR-CNT            PIC  9(009) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'ACATPTRF'.          
           05  W-ACATPTRF-CNT            PIC  9(009) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'ACATPTRP'.          
           05  W-ACATPTRP-CNT            PIC  9(009) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'ACATDLVF'.          
           05  W-ACATDLVF-CNT            PIC  9(009) VALUE 0.                   
LRM027     05  FILLER                    PIC  X(008) VALUE 'CATEXCP '.          
LRM027     05  W-CATEXCP-CNT             PIC  9(009) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.          
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.          
           05  W-REC-LEN-OUT             PIC  9(005) VALUE 0.                   
           05  W-RELEASE-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-RETURN-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-TI-CNT                  PIC  9(009) COMP-3 VALUE 0.            
           05  W-SQL-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-CREATE-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-CREATE-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-CREATE-CNT       PIC  9(009) COMP-3 VALUE 0.            
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
           05  W-VTRNFR-DEL-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-NOT-DEL-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-ADD-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-NOT-ADD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-UPD-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-NOT-UPD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-DEL-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-DEL-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-ADD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-ADD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-UPD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-POSITION-CNT            PIC  9(009) COMP-3 VALUE 0.            
           05  W-GETVHOL-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-GETVBAL-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM020     05  W-MATURE-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM020     05  W-VBNDDT-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM020     05  W-VBNDDT-NOTFND-CNT       PIC  9(009) COMP-3 VALUE 0.            
LRM021     05  W-VBNDFTRV-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
LRM021     05  W-VBNDFTRV-NOTFND         PIC  9(009) COMP-3 VALUE 0.            
LRM020     05  W-BOND-AUDIT-ADD          PIC  9(009) COMP-3 VALUE 0.            
LRM020     05  W-BOND-AUDIT-NOTADD       PIC  9(009) COMP-3 VALUE 0.            
           05  W-PRNGFL-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-PRNGFL-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-WHEN-ISSUE-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-RESTRICTED-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  BAL-IDX                   PIC  9(3)   COMP-3 VALUE 0.            
DJ0011     05  W-MEMO-ONLY-SW            PIC  X(001).                           
DJ0011         88  W-MEMO-ONLY-FOUND                 VALUE 'Y'.                 
DJ0011     05  W-NOT-MEMO-CNT            PIC  9(009) COMP-3 VALUE 0.            
DJ0011     05  W-IS-MEMO-CNT             PIC  9(009) COMP-3 VALUE 0.            
                                                                                
      ***--THIS IS SAME LAYOUT AS ACATPTRR AND ACATPTRF FLAGS                   
      ***--AND SAME AS W-REJECT-SW                                              
           05  W-ASSET-FLAGS.                                                   
               07  W-ASSET-FLAG-FLAT           PIC X(1) VALUE ' '.              
               07  W-ASSET-FLAT-CODE           PIC X(2) VALUE ' '.              
               07  W-ASSET-FLAG-LP             PIC X(1) VALUE ' '.              
               07  W-ASSET-LP-CODE             PIC X(2) VALUE ' '.              
               07  W-ASSET-FLAG-PRIV           PIC X(1) VALUE ' '.              
               07  W-ASSET-PRIV-CODE           PIC X(2) VALUE ' '.              
               07  W-ASSET-FLAG-NTS            PIC X(1) VALUE ' '.              
               07  W-ASSET-NTS-CODE            PIC X(2) VALUE ' '.              
               07  W-ASSET-FLAG-SPAD           PIC X(1) VALUE ' '.              
               07  W-ASSET-SPAD-CODE           PIC X(2) VALUE ' '.              
DJ0006         07  W-ASSET-FLAG-FRZN           PIC X(1) VALUE ' '.              
DJ0006         07  W-ASSET-FRZN-CODE           PIC X(2) VALUE ' '.              
               07  W-ASSET-FLAG-MARGIN-DEBIT   PIC X(1) VALUE ' '.              
               07  W-ASSET-FLAG-ASSET-VALUE    PIC X(1) VALUE ' '.              
               07  W-ASSET-FLAG-TOTL-ACT-VAL   PIC X(1) VALUE ' '.              
               07  W-ASSET-FLAG-EXP-OPT-POSN   PIC X(1) VALUE ' '.              
               07  W-ASSET-FLAG-OPTION         PIC X(1) VALUE ' '.              
               07  W-ASSET-FLAG-OPEN-ORDER     PIC X(1) VALUE ' '.              
               07  W-ASSET-FLAG-DEBIT-BAL      PIC X(1) VALUE ' '.              
               07  W-ASSET-FLAG-SHORT-POS      PIC X(1) VALUE ' '.              
               07  W-ASSET-FLAG-ACCT-IN-TFR    PIC X(1) VALUE ' '.              
               07  W-ASSET-FLAG-NOT-FULFILL    PIC X(1) VALUE ' '.              
               07  W-ASSET-REJECT-AUTO-SW      PIC X(1) VALUE ' '.              
                                                                                
      ***--THIS IS SAME LAYOUT AS ACATPTRR AND ACATPTRF FLAGS                   
      ***--AND SAME AS W-ASSET-FLAGS                                            
           05  W-REJECT-SW.                                                     
               07  W-FLAG-FLAT           PIC X(1) VALUE ' '.                    
               07  W-FLAT-CODE           PIC X(2) VALUE ' '.                    
               07  W-FLAG-LP             PIC X(1) VALUE ' '.                    
               07  W-LP-CODE             PIC X(2) VALUE ' '.                    
               07  W-FLAG-PRIV           PIC X(1) VALUE ' '.                    
               07  W-PRIV-CODE           PIC X(2) VALUE ' '.                    
               07  W-FLAG-NTS            PIC X(1) VALUE ' '.                    
               07  W-NTS-CODE            PIC X(2) VALUE ' '.                    
               07  W-FLAG-SPAD           PIC X(1) VALUE ' '.                    
               07  W-SPAD-CODE           PIC X(2) VALUE ' '.                    
DJ0006         07  W-FLAG-FRZN           PIC X(1) VALUE ' '.                    
DJ0006         07  W-FRZN-CODE           PIC X(2) VALUE ' '.                    
               07  W-FLAG-MARGIN-DEBIT   PIC X(1) VALUE ' '.                    
               07  W-FLAG-ASSET-VALUE    PIC X(1) VALUE ' '.                    
               07  W-FLAG-TOTL-ACT-VAL   PIC X(1) VALUE ' '.                    
               07  W-FLAG-EXP-OPT-POSN   PIC X(1) VALUE ' '.                    
               07  W-FLAG-OPTION         PIC X(1) VALUE ' '.                    
               07  W-FLAG-OPEN-ORDER     PIC X(1) VALUE ' '.                    
               07  W-FLAG-DEBIT-BAL      PIC X(1) VALUE ' '.                    
               07  W-FLAG-SHORT-POS      PIC X(1) VALUE ' '.                    
               07  W-FLAG-RESCIND-BLOCK  PIC X(1) VALUE ' '.                    
               07  W-FLAG-ACCT-IN-TFR    PIC X(1) VALUE ' '.                    
               07  W-FLAG-NOT-FULFILL    PIC X(1) VALUE ' '.                    
               07  W-REJECT-AUTO-SW      PIC X(1) VALUE ' '.                    
LRM020         07  W-MATURE-CALLED-BOND-SW  PIC  X(1) VALUE ' '.                
                                                                                
           05  W-ACTITRF-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-ACTITRF-FOUND                    VALUE 'Y'.                 
           05  W-TRANSFER-FND-SW         PIC  X(001) VALUE ' '.                 
               88 W-TRANSFER-FOUND                   VALUE 'Y'.                 
           05  W-PRNGFL-SW               PIC  X(001) VALUE ' '.                 
               88 W-PRNGFL-FOUND                     VALUE 'Y'.                 
           05  W-VRSDBLK-SEC-FND-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSDBLK-SEC-FND-SW      PIC  X(001) VALUE ' '.                 
           05  W-VRSTSEC-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTSEC-NOTFND-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTSEC-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-VRSTSEC-FOUND                    VALUE 'Y'.                 
           05  W-VRSTBRKR-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTBRKR-NOTFND-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTBRKR-FND-SW         PIC  X(001) VALUE ' '.                 
               88 W-VRSTBRKR-FOUND                   VALUE 'Y'.                 
           05  W-VRSTBRKR-ROW-CNT        PIC S9(4) COMP VALUE +0.               
DJ0010     05  W-ACTRBSC-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
DJ0010     05  W-ACTRBSC-NOTFND-CNT      PIC  9(009) COMP-3 VALUE 0.            
DJ0010     05  W-ACTRBSC-FND-SW          PIC  X(001) VALUE ' '.                 
DJ0010         88 W-ACTRBSC-FOUND                    VALUE 'Y'.                 
           05  W-POS-FND-SW              PIC  X(001) VALUE ' '.                 
               88 W-POS-FOUND                        VALUE 'Y'.                 
           05  W-BAL-FND-SW              PIC  X(001) VALUE ' '.                 
               88 W-BAL-FOUND                        VALUE 'Y'.                 
           05  W-REMOVE-FRACTION-SW           PIC X(01).                        
               88  W-REMOVE-FRACTION                 VALUE 'Y'.                 
           05  WS-BALANCE-FOUND-SW       PIC  X(001).                           
               88  WS-BALANCE-FOUND                  VALUE 'Y'.                 
           05  WS-POSITION-FOUND-SW      PIC  X(001).                           
               88  WS-POSITION-FOUND                 VALUE 'Y'.                 
           05  WS-TYPE1-BALANCE-FOUND-SW PIC  X(001).                           
               88  WS-TYPE1-BALANCE-FOUND            VALUE 'Y'.                 
           05  W-FETCH-CNT               PIC  9(009) COMP-3 VALUE 0.            
           05  LENGTH-KEY                PIC  99     VALUE 9.                   
           05  CATNACT                   PIC X(08)   VALUE 'CATNACT'.           
           05  W-PTR-TRANSFER-SW         PIC  X(001).                           
               88  W-PTR-TRANSFER                    VALUE 'Y'.                 
           05  W-PTR-ASSET-FOUND-SW      PIC  X(001).                           
               88  W-PTR-ASSET-FOUND                 VALUE 'Y'.                 
                                                                                
           05  W-NOT-FIRST-TIME-SW            PIC X(01) VALUE ' '.              
               88  W-NOT-FIRST-TIME                  VALUE 'Y'.                 
           05  W-ASSET-ADDED-FOR-ACCT-SW      PIC X(01).                        
               88  W-ASSET-ADDED-FOR-ACCT            VALUE 'Y'.                 
           05  W-ASSET-LESS-THAN-REQ-SW       PIC X(01).                        
               88  W-ASSET-LESS-THAN-REQ             VALUE 'Y'.                 
           05  W-ASSET-ZERO-FOUND-SW          PIC X(01).                        
               88  W-ASSET-ZERO-FOUND                VALUE 'Y'.                 
CSG001*                                                                         
CSG001     05  W-EDIT-ASSET-DESC-TXT-AREA.                                      
CSG001         10 W-SUB2                      PIC S9(03) COMP-3.                
CSG001         10 W-ASSET-DESC-TXT.                                             
CSG001            15 W-ASSET-DESC1-TXT        PIC X(30) VALUE SPACES.           
CSG001            15 W-ASSET-DESC2-TXT        PIC X(30) VALUE SPACES.           
CSG001            15 W-ASSET-DESC3-TXT        PIC X(30) VALUE SPACES.           
CSG001            15 W-ASSET-DESC4-TXT        PIC X(30) VALUE SPACES.           
CSG001            15 W-ASSET-DESC5-TXT        PIC X(20) VALUE SPACES.           
CSG001         10 W-ASSET-DESC-TMP            PIC X(30) VALUE SPACES.           
CSG001         10 W-JUST-LEFT-FLAG            PIC X(01).                        
CSG001            88 W-JUST-LEFT-DONE         VALUE 'Y'.                        
CSG001            88 W-JUST-LEFT-NOT-DONE     VALUE 'N'.                        
CSG001         10 W-EDIT-ASSET-DESC-TXT-FLAG  PIC X(01).                        
CSG001            88 W-EDIT-ASSET-DESC-TXT-Y  VALUE 'Y'.                        
CSG001            88 W-EDIT-ASSET-DESC-TXT-N  VALUE 'N'.                        
                                                                                
       01  W-FULFILL-MSG-SW.                                                    
         03  W-SEC-MSG-SW                     PIC X(03) VALUE '   '.            
             88  W-SEC-FULL                             VALUE 'F  '.            
             88  W-SEC-NONE                             VALUE '  N'.            
             88  W-SEC-PART                             VALUE ' P ',            
                                                              ' PN',            
                                                              'F N',            
                                                              'FP ',            
                                                              'FPN'.            
             88  W-SEC-NO-REQUEST                       VALUE '   '.            
         03  FILLER REDEFINES W-SEC-MSG-SW.                                     
           05  W-SEC-FULL-FOUND-SW            PIC X(01).                        
               88  W-SEC-FULL-FOUND                  VALUE 'F'.                 
           05  W-SEC-LESS-THAN-REQ-SW         PIC X(01).                        
               88  W-SEC-LESS-THAN-REQ               VALUE 'P'.                 
           05  W-SEC-NONE-FOUND-SW            PIC X(01).                        
               88  W-SEC-NONE-FOUND                  VALUE 'N'.                 
                                                                                
         03  W-CSH-MSG-SW                     PIC X(03) VALUE '   '.            
             88  W-CSH-FULL                             VALUE 'F  '.            
             88  W-CSH-NONE                             VALUE '  N'.            
             88  W-CSH-PART                             VALUE ' P ',            
                                                              ' PN',            
                                                              'F N',            
                                                              'FP ',            
                                                              'FPN'.            
             88  W-CSH-NO-REQUEST                       VALUE '   '.            
         03  FILLER REDEFINES W-CSH-MSG-SW.                                     
           05  W-CSH-FULL-FOUND-SW            PIC X(01).                        
               88  W-CSH-FULL-FOUND                  VALUE 'F'.                 
           05  W-CSH-LESS-THAN-REQ-SW         PIC X(01).                        
               88  W-CSH-LESS-THAN-REQ               VALUE 'P'.                 
           05  W-CSH-NONE-FOUND-SW            PIC X(01).                        
               88  W-CSH-NONE-FOUND                  VALUE 'N'.                 
      /                                                                         
      ***SAVE THE TI REQUEST HERE                                               
       01  W-SAVE-RECORD.                                                       
           COPY ACATPTRR REPLACING ==:PTRR:== BY ==W-SAVE==.                    
      /                                                                         
      ***TABLE OF EXTRACTED REQUESTS FOR ONE SECURITY NUMBER                    
       01  IDXR                              PIC 9(1) VALUE 0.                  
       01  W-REQ-SIZE                        PIC 9(1) VALUE 0.                  
       01  W-REQ-LIMIT                       PIC 9(1) VALUE 5.                  
       01  W-REQ-TABLE.                                                         
         02  W-REQ-TAB OCCURS 5 TIMES.                                          
           03  W-REQ-RECORD.                                                    
           COPY ACATPTRR REPLACING ==:PTRR:== BY ==W-REQ==.                     
      /                                                                         
      ***TABLE OF EXTRACTED ASSETS FOR ONE SECURITY NUMBER                      
       01  IDXA                              PIC 9(1) VALUE 0.                  
       01  W-AST-SIZE                        PIC 9(1) VALUE 0.                  
       01  W-AST-LIMIT                       PIC 9(1) VALUE 5.                  
       01  W-AST-TABLE.                                                         
         02  W-AST-TAB OCCURS 5 TIMES.                                          
          03  W-AST-RECORD.                                                     
           COPY ACATPTRF REPLACING ==:PTRF:== BY ==W-AST==.                     
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
                                                                                
           05  W-POS-QTY                 PIC S9(12)V9(5) COMP-3.                
           05  W-POS-DESC1               PIC X(30)     VALUE SPACE.             
           05  W-POS-DESC2               PIC X(30)     VALUE SPACE.             
           05  W-POS-DESC3               PIC X(30)     VALUE SPACE.             
           05  W-POS-MEMO-QTY-EXCLUDED   PIC S9(12)V9(5) COMP-3.                
           05  W-TXT.                                                           
               10  W-TXT-BYTE            PIC X OCCURS 140 TIMES.                
           05  W-ASSET-CMNT-TXT          PIC X(50).                             
                                                                                
           05  SUB1                      PIC 9(03) COMP-3 VALUE 0.              
           05  W-SUB1                    PIC 9(03) COMP-3 VALUE 0.              
           05  OCR-SUB                   PIC 9(05) COMP-3 VALUE 0.              
LRM016     05  TH-SUB                    PIC 9(05) COMP-3 VALUE 0.              
           05  TBL-SUB                   PIC 9(05) COMP-3 VALUE 0.              
           05  MM-SUB                    PIC 9(05) COMP-3 VALUE 0.              
           05  W-HEX                     PIC S9(04) COMP SYNC VALUE +0.         
           05  FILLER REDEFINES W-HEX.                                          
               10  FILLER                PIC X(01).                             
               10  W-HEX-X               PIC X(01).                             
           05  WORK-POS-QTY              PIC S9(12)V9(5) COMP-3.                
           05  WORK-POS-QTY-SIGNED-INTEGER PIC S9(12)    COMP-3.                
           05  WORK-POS-QTY-DECIMAL      PIC V9(5).                             
           05  WORK-POS-QTY-LEFT         PIC S9(12)V9(5) COMP-3.                
           05  W-QTY-DISPLAY             PIC 999999999.99999-.                  
           05  W-QTY-DISPLAY-2           PIC 999999999.99999-.                  
           05  W-AMT-DISPLAY             PIC 999999999.99-.                     
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
                                                                                
           05  W-WI                      PIC 9  COMP-3 VALUE 1.                 
           05  W-MEMO-IND                PIC X(01).                             
               88  MEMO-NOT-FOUND        VALUE ' '.                             
               88  MEMO-FOUND            VALUE '1'.                             
           05  W-ASSET-PRC-CTGY-CD       PIC X(04).                             
           05  W-CHANGED-DLVR-NBR.                                              
               07  W-CHANGED-BRANCH      PIC X(03).                             
               07  W-CHANGED-ACCT        PIC X(05).                             
               07  FILLER                PIC X(12).                             
           05  WS-FROM-ACCOUNT.                                                 
               07  WS-FROM-CLT           PIC X(03).                             
               07  WS-FROM-BR            PIC X(03).                             
               07  WS-FROM-ACCT          PIC X(05).                             
       01  WS-ADJUST-AREA.                                                      
           05  WS-ORIG-QTY               PIC S9(12)V9(5) COMP-3.                
           05  WS-ORIG-AMT               PIC S9(15)V9(2) COMP-3.                
           05  WS-CALC-PRICE             PIC S9(09)V9(7) COMP-3.                
           05  WS-CALC-QTY               PIC S9(12)V9(5) COMP-3.                
           05  WS-CALC-AMT               PIC S9(15)V9(2) COMP-3.                
           05  WS-STILL-NEED-QTY         PIC S9(12)V9(5) COMP-3.                
           05  WS-STILL-NEED-AMT         PIC S9(15)V9(2) COMP-3.                
                                                                                
       01  WS-MONEY-MKT-FUND-AREA.                                              
           05  W-MMF-TABLE-AREA.                                                
               07 W-MMF-TBL             OCCURS 999 TIMES.                       
                  09 W-MMF-CLT           PIC 9(03).                             
                  09 W-MMF-SEC           PIC X(07).                             
LRM031            09 W-MMF-SWEEP-CD      PIC 9(04).                             
                  09 W-MMF-REDMPT-IND    PIC X(01).                             
LRM016            09  W-THRESHOLD-TBL-CNT PIC 9(05).                            
LRM016            09 W-MMF-THRESHOLD-TBL   OCCURS 999 TIMES.                    
LRM016               11 W-MMF-THRESHOLD-FUND    PIC X(07).                      
               07 W-REDMPT-TBL          OCCURS 999 TIMES.                       
                  09 W-REDMPT-SEC        PIC X(07).                             
           05  W-MMF-TBL-CNT             PIC 9(05) COMP-3 VALUE 0.              
           05  W-REDMPT-TBL-CNT          PIC 9(05) COMP-3 VALUE 0.              
       01  W-MF-AREA.                                                           
           05  W-CKDIGIT-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-BNWMAST-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-BNWMAST-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-BNWREGOP-CNT            PIC  9(009) COMP-3 VALUE 0.            
           05  W-BNWREGOP-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
           05  W-MFMSD-CNT               PIC  9(009) COMP-3 VALUE 0.            
           05  W-MFMSD-FND-CNT           PIC  9(009) COMP-3 VALUE 0.            
DJ0013     05  W-MFEXBR-CNT              PIC  9(009) COMP-3 VALUE 0.            
DJ0013     05  W-MFEXBR-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-LEGG-CNT                PIC  9(009) COMP-3 VALUE 0.            
           05  W-OMNIBUS-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-DST-MFE-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM018     05  W-PNC-SURPAS-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-FUND-SERV-ELIGIBLE-SW   PIC X(01).                             
               88  IS-FUND-SERV-ELIGIBLE           VALUE 'Y'.                   
           05  W-BNWREGOP-FND-SW         PIC X(01).                             
               88  W-BNWREGOP-FOUND                VALUE 'Y'.                   
           05  W-LEGG-MASON-FUND-SW      PIC X(01).                             
               88  IS-LEGG-MASON-FUND              VALUE 'Y'.                   
           05  W-BNWMAST-FND-SW          PIC X(01).                             
               88  W-BNWMAST-FOUND                 VALUE 'Y'.                   
           05  W-BH-MF3-SEBR-CLEAR-SW    PIC  X(001).                           
               88 W-BH-MF3-SEBR-CLEAR-FOUND        VALUE 'Y'.                   
           05  W-BH-MF3-SEBR-CLEAR       PIC  X(4).                             
           05  WK-BR                     PIC  X(3).                             
           05  NTW-HOUSE-ACCOUNT         PIC  X(20)  VALUE ' '.                 
           05  NTW-HOUSE-ACCT-SW         PIC  X(01)  VALUE 'N'.                 
               88  NTW-HOUSE-ACCT                    VALUE 'Y'.                 
           05  NTW-OMNIBUS-ACCT-SW       PIC  X(01)  VALUE 'N'.                 
               88  NTW-OMNIBUS-ACCT                  VALUE 'Y'.                 
               88  NTW-DST-MFE-ACCT                  VALUE 'D'.                 
LRM018         88  NTW-PNC-SURPAS-ACCT               VALUE 'P'.                 
LRM030     05  NTW-SHWB-ACCT-FLAG           PIC  X(01)  VALUE SPACES.           
LRM030         88  NTW-SHWB-ACCT                     VALUE 'Y'.                 
LRM030         88  NTW-NOT-SHWB-ACCT                 VALUE 'N'.                 
DJ0013     05  W-MFMSD-FND-SW             PIC X(01).                            
DJ0013         88  W-MFMSD-FOUND                    VALUE 'Y'.                  
DJ0013         88  W-MFMSD-NOT-FOUND                VALUE 'N'.                  
DJ0013     05  W-MFEXBR-FND-SW            PIC X(01).                            
DJ0013         88  W-MFEXBR-FOUND                   VALUE 'Y'.                  
DJ0013         88  W-MFEXBR-NOT-FOUND               VALUE 'N'.                  
           05  NS-BRCH-ACCT-TC.                                                 
               10  NS-BRCH-ACCT-T        PIC  X(09).                            
               10  NS-CK                 PIC  X(01).                            
           05  WS-DST-BOX-ACCT-TC.                                              
               10  WS-DST-BOX-ACCT-T         PIC  X(09).                        
               10  WS-DST-BOX-CK             PIC  X(01).                        
LRM018     05  WS-PNC-SURPAS-BOX-TC.                                            
LRM018         10  WS-PNC-SURPAS-BOX-T       PIC  X(09).                        
LRM018         10  WS-PNC-SURPAS-CK          PIC  X(01).                        
                                                                                
       01  W-CKDIGIT.                                                           
           03 W-CKDIGIT-PARM.                                                   
              05 W-CKDIGIT-LEN               PIC 9(02) VALUE 9.                 
              05 W-CKDIGIT-ACCT-TC.                                             
                 07 W-CKDIGIT-ACCT-T.                                           
                    09 W-CKDIGIT-BRN-ACCT    PIC X(08).                         
                    09 W-CKDIGIT-TYPE        PIC X(01).                         
                 07 W-CKDIGIT-CK             PIC X(01) VALUE ' '.               
              05 W-CKDIGIT-ACCT-TC-1.                                           
DJ0005           07 W-CKDIGIT-ACCT-T-1.                                         
                    09 W-CKDIGIT-BRN-ACCT-1  PIC X(08).                         
                    09 W-CKDIGIT-TYPE-1      PIC X(01).                         
DJ0005           07 W-CKDIGIT-CK-1           PIC X(01) VALUE ' '.               
                                                                                
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
      /                                                                         
       01  W-BAL-FIELDS.                                                        
           05  W-BAL-KEY.                                                       
             07  W-BAL-KEY-A.                                                   
               10  W-BAL-CLT                PIC 9(05)     COMP-3.               
               10  W-BAL-BR                 PIC X(03).                          
               10  W-BAL-ACCT               PIC X(05).                          
               10  W-BAL-REC-TYPE           PIC X(02).                          
             07  W-BAL-KEY-B.                                                   
               10  W-BAL-CUR                PIC X(06).                          
             07  W-BAL-KEY-C                PIC X(01).                          
                                                                                
           05  W-BAL-TYPE1                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TYPE2                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TYPE3                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TYPE5                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-SMA                    PIC S9(9)V99 VALUE 0.               
                                                                                
           05  W-BAL-MMKT                   PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TOTAL-MARKET-VALUE     PIC S9(17) COMP-3.                  
           05  W-BAL-TOTL-LIQDATNG-EQUITY   PIC S9(17) COMP-3.                  
           05  W-BAL-PENDING-AMOUNT         PIC S9(09)V99 COMP-3.               
           05  W-CASH-SMA                   PIC X(04).                          
           05  W-WORK-BAL                   PIC S9(9)V99 VALUE 0.               
           05  W-WORK-BAL-UNSIGN            PIC  9(9)V99.                       
           05  W-CSH-MGN-SHT                PIC X(01).                          
           05  W-BAL-TYPE1-DISPLAY          PIC 999999999.99-.                  
           05  W-BAL-TYPE2-DISPLAY          PIC 999999999.99-.                  
           05  W-BAL-TYPE3-DISPLAY          PIC 999999999.99-.                  
           05  W-BAL-TYPE5-DISPLAY          PIC 999999999.99-.                  
           05  W-BAL-SMA-DISPLAY            PIC 999999999.99-.                  
      /                                                                         
      ******************************************************************        
      * NSCC EXTRACT FILE                                              *        
      ******************************************************************        
       01  FILLER PIC X(016) VALUE 'CURRENT-RECORD='.                           
       01  FILLER                        PIC X(008) VALUE 'W-NSCC'.             
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:==  BY ==W-NSCC==.               
      /                                                                         
       01  GETVBAL                          PIC X(08) VALUE 'ZGETVBAL'.         
           COPY GETVBALC REPLACING ==:GETVBAL:== BY ==GETVBAL==.                
           COPY CUSBALRE REPLACING ==:BAL:==     BY ==BAL==.                    
           COPY BVHEADER.                                                       
           COPY ACBALALP.                                                       
           COPY BVTRILER.                                                       
       01  FILLER                           PIC X(08) VALUE 'GETVHOL-'.         
       01  GETVOL-AREA.                                                         
           05 W-CUSHOL-KEY.                                                     
              10  W-CUSHOL-CLIENT              PIC X(03).                       
              10  W-CUSHOL-CLIENT-N REDEFINES                                   
                  W-CUSHOL-CLIENT              PIC 9(03).                       
              10  W-CUSHOL-BRANCH              PIC X(03).                       
              10  W-CUSHOL-ACCOUNT             PIC X(05).                       
              10  W-CUSHOL-FRGN-CURR-CODE      PIC 9(03).                       
              10  W-CUSHOL-FILLER              PIC X(31).                       
       01  GETVHOL                PIC X(008) VALUE  'ZGETVHOL'.                 
           COPY GETVHOLC REPLACING ==:GETVHOL:== BY ==GETVHOL==.                
      /                                                                         
LRM032*01  FILLER                        PIC X(08) VALUE 'HOLDAVSM'.            
LRM032*****COPY HOLDAVSM.                                                       
LRM032 01  FILLER                        PIC X(08) VALUE 'CUSHOL  '.            
LRM032 01  WS-CUSHOL-AREA.                                                      
LRM032     COPY CUSHOL REPLACING ==:CUSHOL:== BY ==CUSHOL==.                    
      /                                                                         
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
       01  FILLER                        PIC X(008) VALUE 'W-MRGIMM'.           
       01  W-MRGIMM-FIELDS.                                                     
           05  MRGIMM-STATUS             PIC X(002).                            
               88 VALID-MRGIMM-STATUS    VALUE '00' '04' '10' '23'.             
               88 MRGIMM-OKAY            VALUE '00' THRU '09', '97'.            
               88 MRGIMM-END-OF-FILE     VALUE '10'.                            
               88 MRGIMM-NOT-FOUND       VALUE '23'.                            
               88 MRGIMM-EMPTY-MISSING   VALUE '35'.                            
           05  W-MRGIMM-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-MRGIMM-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-MRGIMM-NOTFND-CNT       PIC  9(009) COMP-3 VALUE 0.            
           05  W-MRGIMM-FND-SW           PIC X(01).                             
               88  W-MRGIMM-FOUND                    VALUE 'Y'.                 
           05  W-MRGIMM-MEMO-FND-SW      PIC X(01).                             
               88  W-MRGIMM-MEMO-FOUND               VALUE 'Y'.                 
           05  W-MRGIMM-N4-FND-SW        PIC X(01).                             
               88  W-MRGIMM-N4-FOUND                 VALUE 'Y'.                 
           05  W-MM-SUB                  PIC 9(03) COMP-3 VALUE 0.              
           05  W-SPAD-FND-SW             PIC X(01).                             
               88  W-SPAD-FOUND                      VALUE 'Y'.                 
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'POSMEMO='.            
           COPY  POSMEMOR REPLACING ==:POSMEMO:== BY ==MRGI==.                  
      /                                                                         
           COPY GETNACOB.                                                       
           EJECT                                                                
       01  GETNA-SEGMENT-INCLUDES.                                              
           COPY NASEGPPA.                                                       
           EJECT                                                                
           COPY NASEGEND.                                                       
           EJECT                                                                
LRM031*****COPY MMFSUB.                                                         
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'CP2WS   '.           
       01  W-SAVE-CYCLE-NBR              PIC X(002) VALUE '00'.                 
       01  W-HDR-TRL-LEN                 PIC 9(005) VALUE 120.                  
                                                                                
           COPY CP2WS.                                                          
      /                                                                         
CSG001******************************************************************        
CSG001* ACATS VALID CHARACTER SET FROM "ACATS USER GUIDE (SECTION 19)" *        
CSG001******************************************************************        
CSG001 01  FILLER                             PIC X(8) VALUE 'CATVCHAR'.        
CSG001     COPY CATVCHAR.                                                       
CSG001/                                                                         
      ******************************************************************        
      * GETMSD COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.            
           COPY GETMSDCE.                                                       
      /                                                                         
       01  WK-MS-INFO-AREA.                                                     
           05  WK-MS-SEC               PIC X(7).                                
           05  FILLER REDEFINES WK-MS-SEC.                                      
               10  WK-MS-SEC-1         PIC X.                                   
               10  WK-MS-SEC-2-7       PIC X(6).                                
           05  WK-MS-SEC-ID            PIC X         VALUE ' '.                 
               88  WK-MS-STOCK         VALUE 'S'.                               
               88  WK-MS-BOND          VALUE 'B'.                               
               88  WK-MS-OPTION        VALUE 'O'.                               
           05  WK-MS-ASSET-TYPE        PIC X         VALUE '0'.                 
               88  WK-MS-NON-OPT       VALUE '0'.                               
               88  WK-MS-EQUITY-OPT    VALUE '1'.                               
               88  WK-MS-NON-EQU-OPT   VALUE '2'.                               
               88  WK-MS-ICS-OPT       VALUE '3'.                               
           05  WK-MS-BOND-IND          PIC X         VALUE ' '.                 
               88  WK-MS-BEARER-BOND   VALUE 'B'.                               
               88  WK-MS-REGISTER-BOND VALUE 'R'.                               
           05  WK-MS-SYMBOL-9                        VALUE ' '.                 
               10  WK-MS-SYMBOL        PIC X(6).                                
               10  WK-FILLER           PIC X(3).                                
           05  WK-MS-CUSIP             PIC X(9)      VALUE SPACE.               
LRM028     05  WK-MS-ISIN              PIC X(12)     VALUE SPACE.               
           05  WK-MS-OPT-MMY                         VALUE ZERO.                
               10  WK-MS-OPT-MM        PIC X(2).                                
               10  WK-MS-OPT-Y         PIC X(1).                                
           05  WK-MS-EXP-DATE          PIC 9(8)      VALUE ZERO.                
           05  FILLER                  REDEFINES WK-MS-EXP-DATE.                
               10  FILLER              PIC 9(3).                                
               10  WK-MS-EXP-Y         PIC X(1).                                
               10  WK-MS-EXP-MM        PIC X(2).                                
               10  FILLER              PIC 9(2).                                
LRM015     05  FILLER REDEFINES WK-MS-EXP-DATE.                                 
LRM015         10  WK-MS-EXP-CC-NEW    PIC X(2).                                
LRM015         10  WK-MS-EXP-YY-NEW    PIC X(2).                                
LRM015         10  WK-MS-EXP-MM-NEW    PIC X(2).                                
LRM015         10  WK-MS-EXP-DD-NEW    PIC X(2).                                
           05  WK-MS-OPT-PRICE         PIC S9(4)V9(5) VALUE ZERO.               
           05  FILLER                  REDEFINES WK-MS-OPT-PRICE.               
               10  WK-MS-OPT-PRC       PIC 9(4).                                
               10  WK-MS-OPT-FRAC      PIC 9(5).                                
           05  WK-MS-OPT-FRAC-6        PIC 9(6) VALUE ZEROS.                    
           05  FILLER REDEFINES    WK-MS-OPT-FRAC-6.                            
               10  WK-MS-OPT-FRAC-1    PIC 9.                                   
               10  FILLER              PIC 9(5).                                
LRM015     05  WK-MS-OPT-PRICE-NEW     PIC S9(5)V9(3) VALUE ZERO.               
LRM015     05  FILLER                  REDEFINES WK-MS-OPT-PRICE-NEW.           
LRM015         10  WK-MS-OPT-PRC-NEW   PIC 9(5).                                
LRM015         10  WK-MS-OPT-FRAC-NEW  PIC 9(3).                                
           05  WK-MS-OPT-DECI-ROUNDED  PIC 9(2).                                
LRM034     05  WK-MS-OPTION-FACTOR     PIC S9(7)V9(8)  COMP-3.                  
           05  WK-MS-XREF-NO           PIC X(07).                               
           05  WK-MS-WI-CODE           PIC X(01).                               
           05  WK-MS-BOND-REG-CODE     PIC X(01).                               
           05  WK-CNS-IND              PIC X(01)  VALUE 'N'.                    
           05  WK-DTC-IND              PIC X(01)  VALUE 'N'.                    
           05  WK-MS-CLASS.                                                     
               10  WK-MS-CLASS-1       PIC 9.                                   
               10  WK-MS-CLASS-2-5     PIC 9(4).                                
               10  WK-MS-CLASS-6-7     PIC 9(2).                                
           05  FILLER                  REDEFINES WK-MS-CLASS.                   
               10  WK-MS-CLASS-1-2-3   PIC 9(3).                                
               10  WK-MS-CLASS-4       PIC 9.                                   
               10  WK-MS-CLASS-5-7     PIC 9(3).                                
           05  FILLER                  REDEFINES WK-MS-CLASS.                   
               10  FILLER              PIC 9.                                   
               10  WK-MS-CLASS-2       PIC 9.                                   
               10  WK-MS-CLASS-3-4     PIC 9(2).                                
               10  WK-MS-CLASS-5       PIC 9.                                   
               10  WK-MS-CLASS-6       PIC 9.                                   
               10  WK-MS-CLASS-7       PIC 9.                                   
           05  FILLER                  REDEFINES WK-MS-CLASS.                   
               10  WK-MS-CLASS-1-2     PIC 9(2).                                
               10  FILLER              PIC 9(2).                                
               10  WK-MS-CLASS-5-6-7   PIC 9(3).                                
           05  FILLER                  REDEFINES WK-MS-CLASS.                   
               10  FILLER              PIC 9(3).                                
               10  WK-MS-CLASS-4-5     PIC 9(2).                                
               10  FILLER              PIC 9(2).                                
           05  WK-MS-SEC-TYPE-P        PIC 9(5)   COMP-3  VALUE 0.              
           05  FILLER                  REDEFINES WK-MS-SEC-TYPE-P.              
               10  WK-MS-SEC-TYPE-X    PIC X(2).                                
               10  FILLER              PIC 9.                                   
           05  WK-MS-SEC-TYPE-N        PIC 9(5)   VALUE 0.                      
           05  FILLER                  REDEFINES WK-MS-SEC-TYPE-N.              
               10  WK-MS-SEC-TYPE      PIC 9(4).                                
               10  FILLER              PIC 9.                                   
                                                                                
DJ0014     05  W-FRACTION-EQUITY-IND   PIC X(1) VALUE ' '.                      
DJ0014         88  W-FRACTION-EQUITY            VALUE 'Y'.                      
DJ0014         88  W-NOT-FRACTION-EQUITY        VALUE 'N'.                      
                                                                                
           05  WK-MS-DESC1                           VALUE SPACE.               
               10  WK-MS-PUT-CALL      PIC X(4).                                
               10  FILLER              PIC X(26).                               
           05  WK-MS-DESC2             PIC X(30)     VALUE SPACE.               
           05  WK-MS-DESC3             PIC X(30)     VALUE SPACE.               
DJ0007     05  WK-MS-CLOSING-PRICE     PIC 9(8)V9(7) COMP-3 VALUE ZERO.         
           05  WK-POS-DESC4            PIC X(30)     VALUE SPACE.               
           05  WK-POS-DESC5.                                                    
               10  FILLER              PIC X(08) VALUE 'ADP-SEC:'.              
               10  WK-POS-DESC5-SEC    PIC X(07) VALUE ' '.                     
               10  WK-POS-DESC5-FIL    PIC X(05) VALUE ' '.                     
           05  W-STPRC-INTEGER-AMT       PIC 9(05).                             
           05  W-STPRC-FRCTN.                                                   
               07  W-STPRC-FRCTN-AMT     PIC 9(02).                             
           05  W-OPT-DESC.                                                      
               07  W-OPT-BUY-SELL        PIC X(04) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-CALL-PUT        PIC X(04) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-OPEN-CLOSE      PIC X(04) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-SYMBOL          PIC X(06) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-MS-SYMBOL       PIC X(08) VALUE ' '.                   
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-EXPTN-MM        PIC X(02) VALUE ' '.                   
               07  W-OPT-EXPTN-S1        PIC X(01) VALUE ' '.                   
               07  W-OPT-EXPTN-CC        PIC X(02) VALUE ' '.                   
               07  W-OPT-EXPTN-YY        PIC X(02) VALUE ' '.                   
               07  FILLER                PIC X(02) VALUE ' '.                   
               07  W-OPT-STRIKE-PRIC     PIC ZZZZ9.                             
               07  FILLER                PIC X(01) VALUE ' '.                   
               07  W-OPT-STRIKE-FRAC     PIC X(01) VALUE ' '.                   
               07  W-OPT-SLASH-8         PIC X(02) VALUE ' '.                   
               07  FILLER                PIC X(11) VALUE ' '.                   
LRM015     05  W-OPT-DESC-NEW REDEFINES W-OPT-DESC.                             
LRM015         07  FILLER                PIC X(22).                             
LRM015         07  W-OPT-UNDLY-SYMBOL    PIC X(06).                             
LRM015         07  FILLER                PIC X(02).                             
LRM015         07  W-OPT-EXPTN-MM-NEW    PIC X(02).                             
LRM015         07  W-OPT-EXPTN-S1-NEW    PIC X(01).                             
LRM015         07  W-OPT-EXPTN-DD-NEW    PIC X(02).                             
LRM015         07  W-OPT-EXPTN-S2-NEW    PIC X(01).                             
LRM015         07  W-OPT-EXPTN-YY-NEW    PIC X(02).                             
LRM015         07  FILLER                PIC X(01).                             
LRM015         07  W-OPT-STRIKE-PRIC-NEW PIC ZZZZ9.                             
LRM015         07  FILLER                PIC X(01).                             
LRM015         07  W-OPT-STRIKE-FRAC-NEW PIC X(03).                             
LRM015         07  FILLER                PIC X(12).                             
       01  OPT-WORK-AREA.                                                       
           05  SUB2               PIC 9(03) COMP-3 VALUE 0.                     
           05  SUB3               PIC 9(03) COMP-3 VALUE 0.                     
           05  OPT-SYMBOL         PIC X(03).                                    
           05  OPTION-SYMBOL   REDEFINES OPT-SYMBOL                             
                                  PIC X(01) OCCURS 3 TIMES.                     
           05  OPTION-SYMBOL1     PIC X(01) OCCURS 3 TIMES.                     
           05  OPT-WORK1          PIC X(12).                                    
           05  OPT-WORK2   REDEFINES  OPT-WORK1.                                
             10  OPT-WORK3        PIC X(01) OCCURS 12 TIMES.                    
                                                                                
       01  W-SEC-TO-BYPASS.                                                     
           05 W-SEC-TO-BYPASS-FIELD   PIC  X(007).                              
              88 W-IRA-SECURITY          VALUE '8660000' THRU '8661299',        
                                               '8667003' THRU '8667010',        
                                               '8667101' THRU '8667125',        
                                               '8667203' THRU '8667250',        
                                               '8667338' THRU '8667339',        
                                               '8667800' THRU '8668799'.        
              88 W-ANNUITY-SECURITY      VALUE '8S15113'.                       
              88 W-SPAD-SECURITY         VALUE '9997292' THRU '9999999'.        
              88 W-MONEY-MARKET-SECURITY VALUE 'A000015',     'A000017',        
                                               'A000026' THRU 'A000029',        
                                               'A000031',     'A000039',        
                                               'A000046' THRU 'A000999'.        
                                                                                
      ** SAVE IMPORTANT FIELDS HERE SO THE LOGIC CAN BE GENERIC.                
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
           05  WF-STTS-CD             PIC X(3).                                 
           05  WF-NSCC-PEND-CD        PIC X(1).                                 
           05  WF-TRANS-RFRN-ID-CD    PIC X(20).                                
           05  WF-DSTBN-SIDE-CD       PIC X(1).                                 
           05  WF-ACCT-EQUITY-AMT     USAGE COMP-2.                             
           05  WF-CICS-TERM-ID-CD     PIC X(4).                                 
           05  WF-UPDT-TMSTP          PIC X(26).                                
           05  WF-PRGM-NM             PIC X(8).                                 
           05  WF-ACCT-MRGN-DB-IND    PIC X(1).                                 
           05  WF-ACCT-AST-EXCS-IND   PIC X(1).                                 
           05  WF-ACCT-LTD-PRTNR-IND  PIC X(1).                                 
           05  WF-ACCT-PRVT-RNG-IND   PIC X(1).                                 
           05  WF-ACCT-SEC-RSTRD-IND  PIC X(1).                                 
DJ0005     05  WF-BRANCH-ACCT         PIC X(8).                                 
DJ0005     05  FILLER REDEFINES WF-BRANCH-ACCT.                                 
DJ0005         07  WF-BRANCH-CD       PIC X(3).                                 
DJ0005         07  WF-ACCT-CD         PIC X(5).                                 
                                                                                
       01  WF-AREA.                                                             
           05  W-CURRENT-CLIENT          PIC X(004).                            
           05  W-CURRENT-CLIENT-N REDEFINES                                     
               W-CURRENT-CLIENT          PIC 9(004).                            
           05  WF-ASSET-SEQ-NBR        PIC S9(4) USAGE COMP.                    
           05  WF-ISIN-CNTRY-CD        PIC X(2).                                
           05  WF-ISIN-SEC-ISSUE-CD    PIC X(9).                                
           05  WF-ISIN-SEC-CDG-CD      PIC X(1).                                
           05  WF-CSH-MGN-SHRT-CD      PIC X(1).                                
           05  WF-SECURITY-ADP-NBR     PIC X(7).                                
           05  WF-STTLM-LCTN-CD        PIC X(2).                                
           05  WF-STTLM-RSN-CD         PIC X(4).                                
           05  WF-PSTN-CD              PIC X(1).                                
                                                                                
       01  W-ACTITRF-SELECT-FIELDS.                                             
           05 W-ACTITRF-ACAT-CONTROL-NBR    PIC  X(014).                        
           05 W-ACTITRF-NSCC-PEND-CD        PIC  X(001).                        
           05 W-ACTITRF-PRCS-DT             PIC  X(010).                        
           05 W-ACTITRF-PRGM-NM             PIC  X(008).                        
           05 W-ACTITRF-UPDT-TMSTP          PIC  X(026).                        
           05 W-ACTITRF-TRNFR-TYPE-RJCT-CD PIC X(026).                          
                                                                                
      ***CHECK OTHER TRANSFERS FOR SAME ASSET                                   
       01  W-OTHER-ACTIVE-AREA.                                                 
           05  WT-CLIENT-NBR          PIC X(4).                                 
           05  WT-ACAT-CONTROL-NBR    PIC X(14).                                
           05  WT-DLVR-NBR            PIC X(4).                                 
           05  WT-ACCT-DLVR-NBR       PIC X(20).                                
           05  WT-TRNFR-TYPE-CD       PIC X(3).                                 
           05  WT-TRANS-TYPE-CD       PIC X(1).                                 
           05  WT-STTS-CD             PIC X(3).                                 
           05  WA-CLIENT-NBR          PIC X(4).                                 
           05  WA-ACAT-CONTROL-NBR    PIC X(14).                                
           05  WA-DLVR-NBR            PIC X(4).                                 
           05  WA-ACCT-DLVR-NBR       PIC X(20).                                
           05  WA-TRNFR-TYPE-CD       PIC X(3).                                 
           05  WA-TRANS-TYPE-CD       PIC X(1).                                 
           05  WA-ASSET-SEQ-NBR       PIC S9(4) USAGE COMP.                     
           05  WA-CSH-MGN-SHRT-CD     PIC X(1).                                 
           05  WA-SECURITY-ADP-NBR    PIC X(7).                                 
           05  WA-PSTN-CD             PIC X(1).                                 
           05  WA-STTLM-LCTN-CD       PIC X(2).                                 
           05  WA-STTLM-RSN-CD        PIC X(4).                                 
           05  WA-ASSET-PCT           USAGE COMP-2.                             
           05  WA-ASSET-QTY           USAGE COMP-2.                             
           05  WA-ASSET-AMT           USAGE COMP-2.                             
           05  WS-ACTIVE-QTY          PIC S9(12)V9(5) COMP-3.                   
           05  WS-ACTIVE-AMT          PIC S9(15)V9(2) COMP-3.                   
                                                                                
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
           COPY BHMF3.                                                          
      /                                                                         
DJ0005******************************************************************        
DJ0005* B1 REQ  SECTION -                                              *        
DJ0005******************************************************************        
DJ0005 01  FILLER                        PIC X(08) VALUE 'BHREQ   '.            
DJ0005     COPY BHREQ.                                                          
      /                                                                         
      ******************************************************************        
      * BPDATE COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
                                                                                
           COPY BPDATESC.                                                       
      /                                                                         
      ******************************************************************        
      * TRANSFER INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTITRF'.            
           EXEC SQL INCLUDE ACTITRF      END-EXEC.                              
                                                                                
      ******************************************************************        
      * ASSET    INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIAST'.            
           EXEC SQL INCLUDE ACTIAST      END-EXEC.                              
                                                                                
      ******************************************************************        
      * MUTUAL FUNDS INIT   TABLE                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIMF'.             
           EXEC SQL INCLUDE ACTIMF       END-EXEC.                              
                                                                                
      ******************************************************************        
      * OPTIONS  INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIOPN'.            
           EXEC SQL INCLUDE ACTIOPN      END-EXEC.                              
                                                                                
      ******************************************************************        
      * TRANSFER ACTIVE TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VTRNFR'.             
           EXEC SQL INCLUDE VTRNFR       END-EXEC.                              
                                                                                
      ******************************************************************        
      * ASSET    ACTIVE TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VASSET'.             
           EXEC SQL INCLUDE VASSET       END-EXEC.                              
                                                                                
      ******************************************************************        
      * MUTUAL FUND ACTIVE TABLE                                       *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VMF   '.             
           EXEC SQL INCLUDE VMF          END-EXEC.                              
                                                                                
      ******************************************************************        
      * OPTION   ACTIVE TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VOPTN '.             
           EXEC SQL INCLUDE VOPTN        END-EXEC.                              
                                                                                
      ******************************************************************        
      * RESTRICTED SECURITY TABLE                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VRSTSEC '.           
           EXEC SQL INCLUDE VRSTSEC      END-EXEC.                              
                                                                                
      ******************************************************************        
      * RESTRICTED SECURITY BLOCK TABLE                                *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VRSDBLK '.           
           EXEC SQL INCLUDE VRSDBLK      END-EXEC.                              
                                                                                
      ******************************************************************        
      * RESTRICTED BROKER   TABLE                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VRSTBRKR'.           
           EXEC SQL INCLUDE VRSTBRKR     END-EXEC.                              
                                                                                
DJ0010******************************************************************        
DJ0010* ASSET DELIVERY RULE - MMF DELIVER AS CASH                      *        
DJ0010******************************************************************        
DJ0010 01  FILLER                        PIC X(008) VALUE 'ACTRBSC '.           
DJ0010     EXEC SQL INCLUDE ACTRBSC      END-EXEC.                              
                                                                                
LRM020******************************************************************        
LRM020* MSD MATURITY DATE LOOKUP                                       *        
LRM020******************************************************************        
LRM020 01  FILLER                        PIC X(008) VALUE 'VBNDDT  '.           
LRM020     EXEC SQL INCLUDE VBNDDT       END-EXEC.                              
                                                                                
LRM021******************************************************************        
LRM021* MSD CALLED BOND LOOKUP                                         *        
LRM021******************************************************************        
LRM021 01  FILLER                        PIC X(008) VALUE 'VBNDDT  '.           
LRM021     EXEC SQL INCLUDE VBNDFTRV     END-EXEC.                              
      /                                                                         
      /                                                                         
      ******************************************************************        
      * DECLARE CURSOR FOR INIT ASSET TABLE TO FIND OTHER REQUEST      *        
      ******************************************************************        
       01  FILLER                PIC X(016) VALUE 'ACTIAST-CURSOR'.             
           EXEC SQL                                                             
                DECLARE ACTIAST_CURSOR CURSOR FOR                               
                SELECT                                                          
                       CLIENT_NBR                                               
                      ,DLVR_NBR                                                 
                      ,ACCT_DLVR_NBR                                            
                      ,ACAT_CONTROL_NBR                                         
                      ,ASSET_SEQ_NBR                                            
                      ,CSH_MGN_SHRT_CD                                          
                      ,SECURITY_ADP_NBR                                         
                FROM   ACTIAST                                                  
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  SUBSTR(ACCT_DLVR_NBR,1,8) = :WF-BRANCH-ACCT              
                  AND  CSH_MGN_SHRT_CD   = :WF-CSH-MGN-SHRT-CD                  
                  AND  SECURITY_ADP_NBR  = :WF-SECURITY-ADP-NBR                 
                  AND  ACAT_CONTROL_NBR <> :WF-ACAT-CONTROL-NBR                 
                FOR READ ONLY WITH UR                                           
           END-EXEC.                                                            
      /                                                                         
      ******************************************************************        
      * DECLARE CURSOR FOR ACTIVE TRANSFER TO FIND OTHER REQUESTS      *        
      ******************************************************************        
       01  FILLER                PIC X(016) VALUE 'VTRNFR-CURSOR'.              
           EXEC SQL                                                             
                DECLARE VTRNFR_CURSOR CURSOR FOR                                
                SELECT                                                          
                       CLIENT_NBR                                               
                      ,ACAT_CONTROL_NBR                                         
                FROM   VTRNFR                                                   
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  SUBSTR(ACCT_DLVR_NBR,1,8) = :WF-BRANCH-ACCT              
                  AND  ACAT_CONTROL_NBR <> :WF-ACAT-CONTROL-NBR                 
                  AND  STTS_CD          <  '500'                                
                FOR READ ONLY WITH UR                                           
           END-EXEC.                                                            
      /                                                                         
      ******************************************************************        
      * DECLARE CURSOR FOR ASSET TABLE TO FIND OTHER REQUESTS          *        
      ******************************************************************        
       01  FILLER                PIC X(016) VALUE 'VASSET-CURSOR'.              
           EXEC SQL                                                             
                DECLARE VASSET_CURSOR CURSOR FOR                                
                SELECT                                                          
                       CLIENT_NBR                                               
                      ,ACAT_CONTROL_NBR                                         
                      ,ASSET_SEQ_NBR                                            
                      ,CSH_MGN_SHRT_CD                                          
                      ,SECURITY_ADP_NBR                                         
                FROM   VASSET                                                   
                WHERE  CLIENT_NBR        = :WT-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WT-ACAT-CONTROL-NBR                 
                  AND  CSH_MGN_SHRT_CD   = :WF-CSH-MGN-SHRT-CD                  
                  AND  SECURITY_ADP_NBR  = :WF-SECURITY-ADP-NBR                 
                FOR READ ONLY WITH UR                                           
           END-EXEC.                                                            
      /                                                                         
      ******************************************************************        
      * DECLARE CURSOR FOR INIT ASSET TABLE TO FIND OTHER CASH         *        
      ******************************************************************        
       01  FILLER                PIC X(016) VALUE 'ACTIAST-CASH  '.             
           EXEC SQL                                                             
                DECLARE ACTIAST_CSH_CURSOR CURSOR FOR                           
                SELECT                                                          
                       CLIENT_NBR                                               
                      ,ACAT_CONTROL_NBR                                         
                      ,ASSET_SEQ_NBR                                            
                      ,CSH_MGN_SHRT_CD                                          
                      ,STTLM_LCTN_CD                                            
                      ,STTLM_RSN_CD                                             
                      ,PSTN_CD                                                  
                      ,ASSET_AMT                                                
                FROM   ACTIAST                                                  
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  SUBSTR(ACCT_DLVR_NBR,1,8) = :WF-BRANCH-ACCT              
                  AND  CSH_MGN_SHRT_CD   = :WF-CSH-MGN-SHRT-CD                  
                  AND  STTLM_LCTN_CD     = :WF-STTLM-LCTN-CD                    
                  AND  STTLM_RSN_CD      = :WF-STTLM-RSN-CD                     
                  AND  ACAT_CONTROL_NBR <> :WF-ACAT-CONTROL-NBR                 
                FOR READ ONLY WITH UR                                           
           END-EXEC.                                                            
      /                                                                         
      ******************************************************************        
      * DECLARE CURSOR FOR ACTIVE TRANSFER TO FIND OTHER CASH          *        
      ******************************************************************        
       01  FILLER                PIC X(016) VALUE 'VTRNFR-CASH  '.              
           EXEC SQL                                                             
                DECLARE VTRNFR_CSH_CURSOR CURSOR FOR                            
                SELECT                                                          
                       CLIENT_NBR                                               
                      ,ACAT_CONTROL_NBR                                         
                FROM   VTRNFR                                                   
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  SUBSTR(ACCT_DLVR_NBR,1,8) = :WF-BRANCH-ACCT              
                  AND  ACAT_CONTROL_NBR <> :WF-ACAT-CONTROL-NBR                 
DJ0002            AND  STTS_CD          <  '500'                                
                FOR READ ONLY WITH UR                                           
           END-EXEC.                                                            
      /                                                                         
      ******************************************************************        
      * DECLARE CURSOR FOR ASSET TABLE TO FIND OTHER CASH              *        
      ******************************************************************        
       01  FILLER                PIC X(016) VALUE 'VASSET-CASH  '.              
           EXEC SQL                                                             
                DECLARE VASSET_CSH_CURSOR CURSOR FOR                            
                SELECT                                                          
                       CLIENT_NBR                                               
                      ,ACAT_CONTROL_NBR                                         
                      ,ASSET_SEQ_NBR                                            
                      ,CSH_MGN_SHRT_CD                                          
                      ,STTLM_LCTN_CD                                            
                      ,STTLM_RSN_CD                                             
                      ,PSTN_CD                                                  
                      ,ASSET_AMT                                                
                FROM   VASSET                                                   
                WHERE  CLIENT_NBR        = :WT-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WT-ACAT-CONTROL-NBR                 
                  AND  CSH_MGN_SHRT_CD   = :WF-CSH-MGN-SHRT-CD                  
                  AND  STTLM_LCTN_CD     = :WF-STTLM-LCTN-CD                    
                  AND  STTLM_RSN_CD      = :WF-STTLM-RSN-CD                     
                FOR READ ONLY WITH UR                                           
           END-EXEC.                                                            
      /                                                                         
      ******************************************************************        
      * DB2 COMMAREA                                                   *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.           
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
                                                                                
      ******************************************************************        
      * DB2 ERROR MSG AREA                                             *        
      ******************************************************************        
       01  W-DB2-MSG-AREA.                                                      
           05  W-DB2-MSG-LEN             PIC S9(04) COMP VALUE +960.            
           05  W-DB2-ERROR-MSG           PIC X(080) OCCURS 12 TIMES             
                   INDEXED BY W-DB2-IDX.                                        
                                                                                
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
           05  W-COMMIT-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) COMP-3 VALUE 0.            
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC ---9.                              
           05  W-SQLERRD-3               PIC S9(9).                             
           05  W-SQL-DELETE-COUNT        PIC  9(9).                             
           05  W-TFR-SQLCODE             PIC S9(9) COMP-4.                      
           05  W-AST-SQLCODE             PIC S9(9) COMP-4.                      
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
      /                                                                         
      ***===> COBOL LE                                                          
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
       01  CALL-MODULES.                                                        
           05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.           
           05  GETXREF                   PIC  X(08) VALUE 'ZGETXREF'.           
       01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.           
           COPY STUBCPY.                                                        
           03  CKDIGIT                   PIC X(8)  VALUE 'CKDIGIT '.            
           03  BNWNTWIO                  PIC X(8)  VALUE 'BNWNTWIO'.            
      ***<=== COBOL LE                                                          
                                                                                
           COPY NTWIOREC REPLACING ==:NTWIO:== BY ==NTWIO==.                    
       01  FILLER                        PIC  X(008) VALUE 'END-O-WS'.          
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
           05  L-RERUN-SW                PIC  X(001).                           
               88  L-RERUN                           VALUE '1'.                 
LRM015     05  L-STREAM-IND              PIC  X(001).                           
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
           DISPLAY 'CAT518 - CREATE ASSETS FOR PTR  TRANSFER DELIVERS'.         
           DISPLAY '         UPDATE INIT ASSET, OPTION, MF TABLES'.             
           DISPLAY '         UPDATE TRANSFER ROW FOR EXCEPTIONS'.               
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
                                                                                
           SORT SORT-FILE ON ASCENDING SORT-KEY                                 
                INPUT  PROCEDURE IS 2000-SORT-INPUT  THRU 2000-EXIT             
                OUTPUT PROCEDURE IS 7000-SORT-OUTPUT THRU 7000-EXIT.            
                                                                                
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                          
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT.                                                               
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.                
                                                                                
           EXEC SQL                                                             
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP                     
           END-EXEC                                                             
                                                                                
           IF  SQLCODE = +0                                                     
               DISPLAY ' '                                                      
               DISPLAY 'CAT518: W-CURRENT-TIMESTAMP = '                         
                                                    W-CURRENT-TIMESTAMP         
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT518: W-CURRENT-TIMESTAMP NOT SET'                    
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
           ACCEPT W-SYS-DATE              FROM DATE.                            
           ACCEPT W-SYS-TIME              FROM TIME.                            
           DISPLAY 'CAT518: SYS-DATE ' W-SYS-DATE                               
                          ' SYS-TIME ' W-SYS-TIME.                              
                                                                                
           DISPLAY 'CAT518: L-BYP-DATECHK-SW = '                                
                            L-BYP-DATECHK-SW                                    
           ' (1=BYPASS DATE CHECK)'                                             
           DISPLAY 'CAT518: L-BYP-FILECHK-SW = '                                
                            L-BYP-FILECHK-SW                                    
           ' (1=BYPASS FILE CHECK. BYPASS EMPTY FILE,DB2 ABENDS.)'              
           DISPLAY 'CAT518: L-RERUN-SW       = '                                
                            L-RERUN-SW                                          
           ' (1=THIS IS A RERUN. ALLOW DUPES AND NOTFNDS.)'                     
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT518: DATE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT518: DATE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT518: FILE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT518: FILE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-RERUN                                                          
               DISPLAY ' '                                                      
               DISPLAY '*--------------------------------------------*'         
               DISPLAY 'CAT518: THIS IS A RERUN.'                               
               DISPLAY '*--------------------------------------------*'         
               DISPLAY ' '                                                      
           END-IF.                                                              
                                                                                
           MOVE 'CAT518'                  TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.                   
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.                   
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.                   
           MOVE BPD-PROC-DATE             TO W-TODAY-DATE.                      
LRM021     MOVE BPD-PROC-DATE(1:4)        TO WK-TODAY-DB2-CCYY.                 
LRM021     MOVE BPD-PROC-DATE(5:2)        TO WK-TODAY-DB2-MM.                   
LRM021     MOVE BPD-PROC-DATE(7:2)        TO WK-TODAY-DB2-DD.                   
LRM021     MOVE '-'                       TO WK-TODAY-DB2-DASH1                 
LRM021                                       WK-TODAY-DB2-DASH2.                
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT518:       BPD-PROC-DATE= ' BPD-PROC-DATE                
                                '  LD-PROC-DATE= ' LD-PROC-DATE.                
           DISPLAY 'CAT518: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE.         
           DISPLAY ' '.                                                         
                                                                                
           MOVE '000'                  TO BH-BROKER-NUMBER                      
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT518: INFILE   OPENED FOR INPUT.  STATUS = '              
                                               INFILE-FILE-STATUS.              
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT518: ERROR OPENING INFILE'                           
               DISPLAY 'CAT518: OPEN STATUS = ' INFILE-FILE-STATUS              
               DISPLAY 'CAT518: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           PERFORM 1500-CHECK-HDR-REC  THRU 1500-EXIT.                          
                                                                                
           OPEN INPUT MMF-FILE.                                                 
           PERFORM 3600-READ-MMF-FILE THRU 3600-EXIT.                           
                                                                                
           MOVE 'O'    TO GETVBAL-FUNC                                          
           PERFORM 9500-CALL-GETVBAL THRU 9500-EXIT                             
           DISPLAY 'CAT518: BALNC    OPENED FOR INPUT.  STATUS = '              
                                              BALNC-STATUS                      
                                                                                
           IF  BALNC-OKAY                                                       
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT518: ERROR OPENING BALNC'                            
               DISPLAY 'CAT518: OPEN STATUS = ' BALNC-STATUS                    
               DISPLAY 'CAT518: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           MOVE LOW-VALUES TO GETVHOL-PARM                                      
           MOVE 'CAT518'   TO GETVHOL-CALLING-PROGRAM                           
LRM032     MOVE 'N'        TO GETVHOL-FILE                                      
           MOVE 'O'        TO GETVHOL-FUNC                                      
           PERFORM 9600-CALL-GETVHOL THRU 9600-EXIT                             
           DISPLAY 'CAT518: POSVSAM  OPENED FOR INPUT.  STATUS = '              
                                              POSVSAM-STATUS                    
                                                                                
           IF  POSVSAM-OKAY                                                     
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT518: ERROR OPENING POSVSAM'                          
               DISPLAY 'CAT518: OPEN STATUS = ' POSVSAM-STATUS                  
               DISPLAY 'CAT518: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT MRGIMM.                                                   
           DISPLAY 'CAT518: MRGIMM   OPENED FOR INPUT.  STATUS = '              
                                              MRGIMM-STATUS                     
                                                                                
           IF  MRGIMM-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT518: ERROR OPENING MRGIMM'                           
               DISPLAY 'CAT518: OPEN STATUS = ' MRGIMM-STATUS                   
               DISPLAY 'CAT518: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT PRNGFL.                                                   
           DISPLAY 'CAT518: PRNGFL   OPENED FOR INPUT.  STATUS = '              
                                              PRNGFL-STATUS                     
                                                                                
           IF  PRNGFL-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT518: ERROR OPENING PRNGFL'                           
               DISPLAY 'CAT518: OPEN STATUS = ' PRNGFL-STATUS                   
               DISPLAY 'CAT518: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT MFMSD.                                                    
           DISPLAY 'CAT518: MFMSD    OPENED FOR INPUT.  STATUS = '              
                                              MFMSD-STATUS                      
                                                                                
           IF  MFMSD-OKAY                                                       
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT518: ERROR OPENING MFMSD'                            
               DISPLAY 'CAT518: OPEN STATUS = ' MFMSD-STATUS                    
               DISPLAY 'CAT518: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT BNWMAST.                                                  
           DISPLAY 'CAT518: BNWMAST  OPENED FOR INPUT.  STATUS = '              
                                              BNWMAST-STATUS                    
                                                                                
           IF  BNWMAST-OKAY                                                     
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT518: ERROR OPENING BNWMAST'                          
               DISPLAY 'CAT518: OPEN STATUS = ' BNWMAST-STATUS                  
               DISPLAY 'CAT518: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN INPUT BNWREGOP.                                                 
           DISPLAY 'CAT518: BNWREGOP OPENED FOR INPUT.  STATUS = '              
                                              BNWREGOP-STATUS                   
                                                                                
           IF  BNWREGOP-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT518: ERROR OPENING BNWREGOP'                         
               DISPLAY 'CAT518: OPEN STATUS = ' BNWREGOP-STATUS                 
               DISPLAY 'CAT518: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
DJ0013     OPEN INPUT MFEXBR.                                                   
DJ0013     DISPLAY 'CAT518: MFEXBR   OPENED FOR INPUT.  STATUS = '              
DJ0013                                        MFEXBR-STATUS                     
DJ0013                                                                          
DJ0013     IF  MFEXBR-OKAY                                                      
DJ0013         CONTINUE                                                         
DJ0013     ELSE                                                                 
DJ0013         DISPLAY 'CAT518: ERROR OPENING MFEXBR'                           
DJ0013         DISPLAY 'CAT518: OPEN STATUS = ' MFEXBR-STATUS                   
DJ0013         DISPLAY 'CAT518: U3001 - ABENDING ON BAD FILE STATUS'            
DJ0013         MOVE +3001    TO ABEND-CODE                                      
DJ0013         CALL ABEND USING ABEND-CODE                                      
DJ0013     END-IF.                                                              
                                                                                
           OPEN OUTPUT ACATPTRR.                                                
           DISPLAY 'CAT518: ACATPTRR OPENED FOR OUTPUT. STATUS = '              
                                                ACATPTRR-STATUS.                
                                                                                
           IF  ACATPTRR-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT518: ERROR OPENING ACATPTRR'                         
               DISPLAY 'CAT518: OPEN STATUS = ' ACATPTRR-STATUS                 
                            '.  OUTPUT-CNT = ' W-ACATPTRR-CNT                   
               DISPLAY 'CAT518: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001 TO ABEND-CODE                                         
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN OUTPUT ACATPTRF.                                                
           DISPLAY 'CAT518: ACATPTRF OPENED FOR OUTPUT. STATUS = '              
                                                ACATPTRF-STATUS.                
                                                                                
           IF  ACATPTRF-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT518: ERROR OPENING ACATPTRF'                         
               DISPLAY 'CAT518: OPEN STATUS = ' ACATPTRF-STATUS                 
                            '.  OUTPUT-CNT = ' W-ACATPTRF-CNT                   
               DISPLAY 'CAT518: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001 TO ABEND-CODE                                         
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN OUTPUT ACATPTRP.                                                
           DISPLAY 'CAT518: ACATPTRP OPENED FOR OUTPUT. STATUS = '              
                                                ACATPTRP-STATUS.                
                                                                                
           IF  ACATPTRP-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT518: ERROR OPENING ACATPTRP'                         
               DISPLAY 'CAT518: OPEN STATUS = ' ACATPTRP-STATUS                 
                            '.  OUTPUT-CNT = ' W-ACATPTRP-CNT                   
               DISPLAY 'CAT518: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001 TO ABEND-CODE                                         
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           OPEN OUTPUT ACATDLVF.                                                
           DISPLAY 'CAT518: ACATDLVF OPENED FOR OUTPUT. STATUS = '              
                                               ACATDLVF-STATUS.                 
                                                                                
           IF  ACATDLVF-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT518: ERROR OPENING ACATDLVF'                         
               DISPLAY 'CAT518: OPEN STATUS = ' ACATDLVF-STATUS                 
                            '.  OUTPUT-CNT = ' W-ACATDLVF-CNT                   
               DISPLAY 'CAT518: U3008 - ABENDING ON BAD FILE STATUS'            
               MOVE +3008    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
LRM027     OPEN OUTPUT CATEXCP.                                                 
LRM027     DISPLAY 'CAT518: CATEXCP  OPENED FOR OUTPUT. STATUS = '              
LRM027                                         CATEXCP-FILE-STATUS.             
                                                                                
LRM027     IF  CATEXCP-OKAY                                                     
LRM027         CONTINUE                                                         
LRM027     ELSE                                                                 
LRM027         DISPLAY 'CAT518: ERROR OPENING CATEXCP'                          
LRM027         DISPLAY 'CAT518: OPEN STATUS = ' CATEXCP-FILE-STATUS             
LRM027                      '.  OUTPUT-CNT = ' W-CATEXCP-CNT                    
LRM027         DISPLAY 'CAT518: U3009 - ABENDING ON BAD FILE STATUS'            
LRM027         MOVE +3009    TO ABEND-CODE                                      
LRM027         CALL ABEND USING ABEND-CODE                                      
LRM027     END-IF.                                                              
                                                                                
           MOVE INFILE-HDR-CYCLE-NBR TO W-SAVE-CYCLE-NBR.                       
           MOVE ' '                      TO ACATDLVF-HEADER-RECORD              
           MOVE 'H'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
           CALL P2HDTR                USING CP2-AREA                            
                                            ACATDLVF.                           
           MOVE CP2-RETURN-RECORD        TO ACATDLVF-HEADER-RECORD              
DJ0010     MOVE LD-PROC-DATE             TO ACATDLVF-HDR-PROC-DATE              
           MOVE 'CYCLE='                 TO ACATDLVF-HDR-CYCLE-LIT              
           MOVE W-SAVE-CYCLE-NBR         TO ACATDLVF-HDR-CYCLE-NO               
           DISPLAY 'CAT518: ACATDLVF-HDR= ' ACATDLVF-HEADER-RECORD              
           WRITE ACATDLVF-RECORD.                                               
           DISPLAY 'CAT518: ACATDLVF HEADER WRITTEN.    STATUS = '              
                                               ACATDLVF-STATUS.                 
                                                                                
LRM027     MOVE ' '                      TO CATEXCP-HEADER-RECORD               
LRM027     MOVE 'H'                      TO CP2-REQUEST-CODE.                   
LRM027     MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
LRM027     MOVE 999                      TO CP2-CLIENT-NUMBER.                  
LRM027     CALL P2HDTR                USING CP2-AREA                            
LRM027                                      CATEXCP.                            
LRM027     MOVE CP2-RETURN-RECORD        TO CATEXCP-HEADER-RECORD               
LRM027     MOVE LD-PROC-DATE             TO CATEXCP-HDR-PROC-DATE               
LRM027     MOVE 'CYCLE='                 TO CATEXCP-HDR-CYCLE-LIT               
LRM027     MOVE W-SAVE-CYCLE-NBR         TO CATEXCP-HDR-CYCLE-NO                
LRM027     DISPLAY 'CAT518: CATEXCP-HDR= ' CATEXCP-HEADER-RECORD                
LRM027     WRITE CATEXCP-RECORD.                                                
LRM027     DISPLAY 'CAT518: CATEXCP HEADER WRITTEN.    STATUS = '               
LRM027                                         CATEXCP-FILE-STATUS.             
                                                                                
           MOVE  SPACES      TO NTWIO-PARAMETERS.                               
           MOVE  'CAT518'    TO NTWIO-PGM-NAME.                                 
           MOVE  'O'         TO NTWIO-FUNCTION-CODE.                            
           MOVE  'ALL'       TO NTWIO-REQUEST-TYPE.                             
           CALL  BNWNTWIO USING NTWIO-PARAMETERS.                               
                                                                                
           MOVE SPACES       TO GETNA-PARAMETERS.                               
           MOVE 'CAT518 '    TO GETNA-PGM-NAME.                                 
           MOVE 'R'          TO GETNA-REQ-FUNC.                                 
           MOVE 'R'          TO GETNA-REQ-FILE.                                 
           MOVE 'R'          TO GETNA-REQ-FUNC2.                                
           MOVE 'N'          TO GETNA-REQ-YEAREND.                              
                                                                                
           DISPLAY 'CAT518: INBOUND-CYCLE-NBR = '                               
                                         INFILE-HDR-CYCLE-NBR                   
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE HDR REC  TO GET THE TIMESTAMP                                 
      *  FOR THE LAST TIME WE TRANSMITTED TO NSCC                               
      ******************************************************************        
       1500-CHECK-HDR-REC.                                                      
           MOVE '1500-CHECK-HDR-REC            ' TO W-ROUTINE-1.                
                                                                                
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF  END-OF-INPUT                                                     
               DISPLAY 'CAT518: END OF INPUT REACHED'                           
               IF  L-BYP-FILECHK                                                
                   DISPLAY 'CAT518: BYPASSING FILE CHECK PER JCLPARM'           
                   GO TO 1500-EXIT                                              
               ELSE                                                             
                   DISPLAY 'CAT518: U3003 - ABENDING ON EMPTY FILE'             
                   MOVE +3003    TO ABEND-CODE                                  
                   CALL ABEND USING ABEND-CODE                                  
               END-IF                                                           
           END-IF.                                                              
           IF  INFILE-HDR-RECORD                                                
               SET INFILE-DATE-FOUND TO TRUE                                    
               DISPLAY 'CAT518: INFILE  DATE = '                                
                                              INFILE-HDR-PROC-DATE              
                             ', UPDT BY PGM=' INFILE-HDR-PGM-NAME               
                                     ' DATE=' INFILE-HDR-SYS-DATE               
                                     ' TIME=' INFILE-HDR-SYS-TIME               
               IF  INFILE-HDR-PROC-DATE = LD-PROC-DATE                          
                   DISPLAY 'CAT518: INFILE  DATE = PROC DATE. OKAY'             
               ELSE                                                             
                   DISPLAY 'CAT518: INFILE  DATE NOT = PROC DATE'               
                   IF L-BYP-DATECHK                                             
                   DISPLAY 'CAT518: BYPASSING DATE CHECK PER JCLPARM'           
                   ELSE                                                         
                      DISPLAY 'CAT518: U3004 - ABENDING ON BAD DATE'            
                      MOVE +3004    TO ABEND-CODE                               
                      CALL ABEND USING ABEND-CODE                               
                   END-IF                                                       
               END-IF                                                           
           ELSE                                                                 
               DISPLAY 'CAT518: INFILE  DATE RECORD MISSING'                    
                   IF L-BYP-DATECHK                                             
                   DISPLAY 'CAT518: BYPASSING DATE CHECK PER JCLPARM'           
                   ELSE                                                         
                      DISPLAY 'CAT518: U3005 - ABENDING ON BAD DATE'            
                      MOVE +3005    TO ABEND-CODE                               
                      CALL ABEND USING ABEND-CODE                               
                   END-IF                                                       
           END-IF.                                                              
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1500-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE NSCC FILE AND PROCESS ONLY TRANSFER ('T') RECORDS             
      *  IF PTR  TRANSFER REQUEST, AND WE ARE THE DELIVERER,                    
      *     LOAD ASSETS                                                         
      ******************************************************************        
       2000-SORT-INPUT.                                                         
           MOVE '2000-SORT-INPUT            ' TO W-ROUTINE-1.                   
                                                                                
           IF  END-OF-INPUT                                                     
               GO TO 2000-EXIT                                                  
           END-IF.                                                              
                                                                                
           MOVE ' ' TO W-PTR-TRANSFER-SW                                        
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF  W-NSCC-REC-SUBTYPE      = 'T'                                    
           AND W-NSCC-DAYS-IN-STATUS NOT NUMERIC                                
               MOVE ZEROS TO W-NSCC-DAYS-IN-STATUS                              
           END-IF.                                                              
                                                                                
           IF  END-OF-INPUT                                                     
               GO TO 2000-EXIT                                                  
           ELSE                                                                 
               IF (W-NSCC-REC-SUBTYPE      = 'T'               AND              
                   W-NSCC-TI-TFR-TYPE      = 'PTR'             AND              
                   W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR AND              
                  (W-NSCC-SYSTEM-ACTION NOT = '2')             AND              
                   W-NSCC-STATUS           = '500')                             
                   PERFORM 4000-EDIT-AND-LOAD THRU 4000-EXIT                    
               ELSE                                                             
                IF (W-NSCC-REC-SUBTYPE      = 'A'               AND             
                    W-NSCC-AT-TFR-TYPE      = 'PTR'             AND             
                    W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-DEL-NBR AND             
                   (W-NSCC-SYSTEM-ACTION NOT = '2')             AND             
                    W-NSCC-STATUS           = '500')                            
                    PERFORM 4200-PROCESS-AT THRU 4200-EXIT                      
                END-IF                                                          
               END-IF                                                           
               GO TO 2000-SORT-INPUT                                            
           END-IF.                                                              
                                                                                
       2000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE NSCC FILE AND MOVE TO WORKING-STORAGE.                        
      ******************************************************************        
       3000-READ-INPUT.                                                         
           MOVE '3000-READ-INPUT            ' TO W-ROUTINE-1.                   
                                                                                
           IF  END-OF-INPUT                                                     
               DISPLAY 'CAT518: WARNING - READING AFTER EOF'                    
               GO 3000-EXIT                                                     
           END-IF.                                                              
                                                                                
           READ INFILE                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INPUT-SW                     
                   DISPLAY 'CAT518: END OF INPUT REACHED'                       
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           ADD  1                        TO W-INFILE-CNT.                       
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT518: ERROR READING INFILE'                           
               DISPLAY 'CAT518: READ STATUS = ' INFILE-FILE-STATUS              
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT518: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
                                                                                
           MOVE SPACES                   TO W-NSCC-RECORD.                      
           MOVE W-REC-LEN-IN             TO W-REC-LEN-OUT.                      
                                                                                
           MOVE INFILE-RECORD   (1 : W-REC-LEN-IN) TO                           
                W-NSCC-RECORD   (1 : W-REC-LEN-IN).                             
                                                                                
           IF  INFILE-HDR-RECORD                                                
               DISPLAY 'CAT518: INFILE-HDR-REC = '                              
                                                 INFILE-HDR-REC (1:120)         
               GO TO 3000-EXIT                                                  
           ELSE                                                                 
               IF  INFILE-TRL-RECORD                                            
                   DISPLAY 'CAT518: INFILE-TRL-REC = '                          
                                                 INFILE-TRL-REC (1:120)         
                   GO TO 3000-READ-INPUT                                        
               END-IF                                                           
           END-IF.                                                              
                                                                                
           ADD  1                        TO W-DETAIL-CNT.                       
                                                                                
           EVALUATE W-NSCC-REC-SUBTYPE                                          
                    WHEN 'T'      ADD 1 TO W-TI-CNT                             
           END-EVALUATE                                                         
                                                                                
           MOVE W-NSCC-KEY-CLIENT-NBR    TO W-CURRENT-CLIENT                    
                                                                                
           IF  W-CURRENT-CLIENT (2:3)     > '000'                               
               IF  W-CURRENT-CLIENT (2:3) = BH-BROKER-NUMBER                    
                   CONTINUE                                                     
               ELSE                                                             
                   PERFORM 3500-GETB1 THRU 3500-EXIT                            
               END-IF                                                           
           END-IF.                                                              
                                                                                
      ***BYPASS THIS CLIENT IF THEY DO NOT WANT AUTO-VALIDATION                 
      ***B1#434714 = 0 - DO NOT AUTO-VALIDATE                                   
           IF  BH-ACAT-SUBMIT-ASSETS-PTR < '1'                                  
               GO TO 3000-READ-INPUT                                            
           END-IF.                                                              
                                                                                
       3000-EXIT. EXIT.                                                         
      /                                                                         
       3500-GETB1.                                                              
           MOVE '3500-GETB1                    ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                        TO BH-BROKER-HEADER-INFO             
                                              BH-ACAT-INFO                      
                                              BH-BTS2-INFO                      
                                              BH-MF-INFO                        
                                                                                
           MOVE W-CURRENT-CLIENT (2:3)     TO BH-BROKER-NUMBER                  
           MOVE '015'                      TO BH-LOGICAL-RECORD-CODE            
           MOVE '434500'                   TO BH-B2-INFO-ID                     
           CALL GETB1V                  USING BH-BROKER-HEADER-INFO,            
                                              BH-ACAT-INFO                      
           END-CALL.                                                            
                                                                                
           MOVE '511000'                   TO BH-B2-INFO-ID                     
           CALL GETB1V                  USING BH-BROKER-HEADER-INFO,            
                                              BH-BTS2-INFO                      
           END-CALL.                                                            
                                                                                
           MOVE '537000'                   TO BH-B2-INFO-ID                     
           CALL GETB1V                  USING BH-BROKER-HEADER-INFO,            
                                              BH-MF-INFO                        
           END-CALL.                                                            
                                                                                
           MOVE  ' '               TO  BH-MF3-INFO                              
           MOVE  '540000'          TO  BH-B2-INFO-ID                            
           CALL  GETB1V          USING BH-BROKER-HEADER-INFO                    
                                       BH-MF3-INFO                              
           END-CALL.                                                            
                                                                                
DJ0005     MOVE ' '                TO  BH-REQ-INFO                              
DJ0005     MOVE ' '                TO  BH-B2-INFO-ID                            
DJ0005     MOVE '114'              TO  BH-LOGICAL-RECORD-CODE                   
DJ0005     CALL  GETB1V          USING BH-BROKER-HEADER-INFO                    
DJ0005                                 BH-REQ-INFO                              
DJ0005     END-CALL.                                                            
                                                                                
           IF  BH-ACAT-WHOLD-STK-REC-MEMO-NO NOT NUMERIC                        
               MOVE 0 TO BH-ACAT-WHOLD-STK-REC-MEMO-NO                          
           END-IF.                                                              
                                                                                
           IF  BH-ACAT-EXPIRING-OPT-DAYS  NOT NUMERIC                           
               MOVE '0000' TO BH-ACAT-EXPIRING-OPTION                           
           END-IF.                                                              
           MOVE BH-ACAT-EXPIRING-OPT-DAYS TO W-EXP-OPT-DAYS.                    
           MOVE BH-ACAT-EXPIRING-OPT-ACT  TO W-EXP-OPT-ACT.                     
                                                                                
           MOVE 0 TO W-EXP-OPT-DATE                                             
           IF W-EXP-OPT-DAYS > 0                                                
             MOVE W-TODAY-DATE              TO BPDATES-BASE-DATE                
             SET BPD-DISPLACEMENT-DATE-INFO TO TRUE                             
             SET BPD-DISP-PLUS              TO TRUE                             
             SET BPD-DISP-CALENDAR          TO TRUE                             
             MOVE W-EXP-OPT-DAYS            TO BPDATES-DTSEARCH-DISP            
             MOVE '  '                      TO BPDATES-CALENDAR-TYPE            
             CALL  BPDATES  USING BPDATES-PARAMETERS                            
             IF NOT BPD-VALID-RETURN                                            
                 DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE                 
                 DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE               
                 DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE                
                 DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG                 
             ELSE                                                               
                 MOVE BPD-DT-CALDATE TO W-EXP-OPT-DATE                          
             END-IF                                                             
           END-IF.                                                              
                                                                                
LRM020     IF BH-ACAT-MATUR-CALL-BOND-DAYS NOT NUMERIC                          
LRM020        MOVE 0 TO BH-ACAT-MATUR-CALL-BOND-DAYS                            
LRM020     END-IF.                                                              
LRM020     MOVE BH-ACAT-MATUR-CALL-BOND-DAYS   TO W-NUM-BOND-TO-EXP.            
LRM020     MOVE BH-ACAT-MATUR-CALL-BOND-ACTION TO W-BOND-EXP-ACT.               
LRM020     MOVE 99991231 TO WK-BOND-EXP-DATE                                    
LRM020     IF W-BOND-EXP-ACT NOT = '0'                                          
LRM020       MOVE W-TODAY-DATE              TO BPDATES-BASE-DATE                
LRM020       SET BPD-DISPLACEMENT-DATE-INFO TO TRUE                             
LRM020       SET BPD-DISP-PLUS              TO TRUE                             
LRM020       SET BPD-DISP-CALENDAR          TO TRUE                             
LRM020       MOVE W-NUM-BOND-TO-EXP         TO BPDATES-DTSEARCH-DISP            
LRM020       MOVE '  '                      TO BPDATES-CALENDAR-TYPE            
LRM020       CALL  BPDATES  USING BPDATES-PARAMETERS                            
LRM020       IF NOT BPD-VALID-RETURN                                            
LRM020           DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE                 
LRM020           DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE               
LRM020           DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE                
LRM020           DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG                 
LRM020       ELSE                                                               
LRM020           MOVE BPD-DT-CALDATE TO WK-BOND-EXP-DATE                        
LRM020       END-IF                                                             
LRM020     END-IF.                                                              
LRM020     MOVE WK-BOND-EXP-DATE(1:4) TO  WK-MS-BOND-EXP-CCYY                   
LRM020     MOVE WK-BOND-EXP-DATE(5:2) TO  WK-MS-BOND-EXP-MM                     
LRM020     MOVE WK-BOND-EXP-DATE(7:2) TO  WK-MS-BOND-EXP-DD                     
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'NEW-CLIENT = ' BH-BROKER-NUMBER                             
                                       ' ' BH-BROKER-NAME                       
                               ' BRK-NO= ' BH-BROKER-OLD-CLEARING-HOUSE         
           DISPLAY 'CAT518: BH-ACAT-STATUS                 (434501) = '         
                            BH-ACAT-STATUS                                      
           DISPLAY 'CAT518: BH-ACAT-LIQUIDATE-MMF          (434510) = '         
                            BH-ACAT-LIQUIDATE-MMF                               
           DISPLAY 'CAT518: BH-ACAT-FRACT-ON-CNS-ELIG-SEC  (434521) = '         
                            BH-ACAT-FRACT-ON-CNS-ELIG-SEC                       
           DISPLAY 'CAT518: BH-ACAT-WHOLD-STK-REC-MEMO-NO  (434533) = '         
                            BH-ACAT-WHOLD-STK-REC-MEMO-NO                       
           DISPLAY '        BH-ACAT-WHOLD-STK-REC-MEMO     (434533) = '         
                            BH-ACAT-WHOLD-STK-REC-MEMO (1:60)                   
                                                                                
           DISPLAY 'CAT518: BH-ACAT-REJ-PEND-FULL-REC-AMT  (434556) = '         
                            BH-ACAT-REJ-PEND-FULL-REC-AMT                       
           DISPLAY 'CAT518: BH-ACAT-REJ-DEL-MARGIN-DEBIT            = '         
                            BH-ACAT-REJ-DEL-MARGIN-DEBIT                        
           DISPLAY 'CAT518: BH-ACAT-REJ-DEL-ASSET-VALUE             = '         
                            BH-ACAT-REJ-DEL-ASSET-VALUE                         
           DISPLAY 'CAT518: BH-ACAT-REJ-DEL-TOTL-ACT-VAL            = '         
                            BH-ACAT-REJ-DEL-TOTL-ACT-VAL                        
           DISPLAY 'CAT518: BH-ACAT-REJ-PEND-DEL-SPAD-NO   (434557) = '         
                            BH-ACAT-REJ-PEND-DEL-SPAD-NO                        
           DISPLAY '        BH-ACAT-REJ-PEND-DEL-SPADS     (434557) = '         
                            BH-ACAT-REJ-PEND-DEL-SPADS (1:60)                   
           DISPLAY 'CAT518: BH-ACAT-REJ-PEND-FULL-DEL-NTS  (434560) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-NTS                       
           DISPLAY 'CAT518: BH-ACAT-REJ-PEND-FULL-DEL-LP   (434562) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-LP                        
           DISPLAY 'CAT518: BH-ACAT-REJ-PEND-FULL-DEL-PRIV (434567) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-PRIV                      
           DISPLAY 'CAT518: BH-ACAT-REJ-PEND-PTR-DEL-FLAT  (434572) = '         
                            BH-ACAT-REJ-PEND-PTR-DEL-FLAT                       
           DISPLAY 'CAT518: BH-ACAT-MF-FUND-SERV-CLIENT    (434606) = '         
                            BH-ACAT-MF-FUND-SERV-CLIENT                         
           DISPLAY 'CAT518: BH-ACAT-MF-REG-FUND-ACCT       (434608) = '         
                            BH-ACAT-MF-REG-FUND-ACCT                            
           DISPLAY 'CAT518: BH-ACAT-MF-REG-DIVD-PAYEE-IND  (434619) = '         
                            BH-ACAT-MF-REG-DIVD-PAYEE-IND                       
           DISPLAY 'CAT518: BH-ACAT-MF-REGIST-RECEIVE-BKR  (434636) = '         
                            BH-ACAT-MF-REGIST-RECEIVE-BKR                       
           DISPLAY 'CAT518: BH-ACAT-BALANCE-ADJUSTMENT     (434675) = '         
                            BH-ACAT-BALANCE-ADJUSTMENT                          
           DISPLAY 'CAT518: BH-ACAT-BLOCK-SECURITY-IND     (434679) = '         
                            BH-ACAT-BLOCK-SECURITY-IND                          
           DISPLAY 'CAT518: BH-ACAT-EXPIRING-OPT-DAYS      (434690) = '         
                            BH-ACAT-EXPIRING-OPT-DAYS                           
           DISPLAY '        BH-ACAT-EXPIRING-OPT-ACT       (434690) = '         
                            BH-ACAT-EXPIRING-OPT-ACT                            
LRM020     DISPLAY 'CAT518: BH-ACAT-MATUR-CALL-BOND-DAYS   (434748) = '         
LRM020                      BH-ACAT-MATUR-CALL-BOND-DAYS                        
LRM020     DISPLAY '        BH-ACAT-MATUR-CALL-BOND-ACTION (434748) = '         
LRM020                      BH-ACAT-MATUR-CALL-BOND-ACTION                      
LRM020     DISPLAY '        CALC MAT/CALL DATE ' WK-BOND-EXP-DATE               
           DISPLAY 'CAT518: BH-ACAT-OPTION-POS-ON-PTR      (434709) = '         
                            BH-ACAT-OPTION-POS-ON-PTR                           
           DISPLAY 'CAT518: BH-ACAT-OPEN-ORDERS-ON-PTR     (434710) = '         
                            BH-ACAT-OPEN-ORDERS-ON-PTR                          
           DISPLAY 'CAT518: BH-ACAT-MMF-ON-PTR             (434711) = '         
                            BH-ACAT-MMF-ON-PTR                                  
                   ' ADD MONEY MARKET TO TYPE 1'                                
           DISPLAY 'CAT518: BH-ACAT-MEMO-ASSETS-FOR-PTR    (434713) = '         
                            BH-ACAT-MEMO-ASSETS-FOR-PTR                         
                   ' 0=SEND WITHHELD AS MEMO. 1=DO NOT SEND WITHHELD'           
           DISPLAY 'CAT518: BH-ACAT-SUBMIT-ASSETS-PTR      (434714) = '         
                            BH-ACAT-SUBMIT-ASSETS-PTR                           
                   ' 0=SUBMIT MANUALLY. 1=DAY-1. 2=DAY-2. 3=DAY-3.'             
           DISPLAY 'CAT518: BH-ACAT-PTR-REJECT-NO-ASSET    (434715) = '         
                            BH-ACAT-PTR-REJECT-NO-ASSET                         
                   ' 1=IF NO ASSET EXIST, REJECT WITH COMMENT.'                 
           DISPLAY 'CAT518: BH-ACAT-PTR-ASSETS             (434716) = '         
                            BH-ACAT-PTR-ASSETS                                  
                   ' 1=REJECT IF NOT ENOUGH ASSET. 2=FILL. 3=FILL-FLAG'         
           DISPLAY 'CAT518: BH-ACAT-PTR-ASSETS-TYPE        (434717) = '         
                            BH-ACAT-PTR-ASSETS-TYPE                             
                   ' 0=USE REQUEST TYPE ONLY. 1=USE ALL TYPES.'                 
           DISPLAY 'CAT518: BH-ACAT-WH-ASSET-ON-CONTR-CUS  (434719) = '         
                            BH-ACAT-WH-ASSET-ON-CONTR-CUS                       
                   ' 1=WITHHOLD CONTRA CUSIP 090'                               
DJ0009     DISPLAY 'CAT518: BH-ACAT-ASCENDIS-USER          (434735) = '         
DJ0009                      BH-ACAT-ASCENDIS-USER                               
           DISPLAY 'CAT518: BH-BTS2-ACAT-SK-MEMO-OVERRIDE  (511220) = '         
                            BH-BTS2-ACAT-SK-MEMO-OVERRIDE                       
           DISPLAY 'CAT518: BH-BTS2-ACAT-RESTRT-RN-RS-MEMO (511228) = '         
                            BH-BTS2-ACAT-RESTRT-RN-RS-MEMO                      
           DISPLAY 'CAT518: BH-MF-STATUS                   (537011) = '         
                            BH-MF-STATUS                                        
DJ0013     DISPLAY 'CAT518: BH-MF-EXBR-OPTION              (537483) = '         
DJ0013                      BH-MF-EXBR-OPTION                                   
DJ0005     DISPLAY 'CAT518: BH-MF-SINGLE-FUND-ACCOUNT      (537486) = '         
DJ0005                      BH-MF-SINGLE-FUND-ACCOUNT                           
           DISPLAY 'CAT518: BH-MFN-STATUS                  (537501) = '         
                            BH-MFN-STATUS                                       
           DISPLAY 'CAT518: BH-MFN-OMNIBUS-NSCC-BOX-ACCT   (537596) = '         
                            BH-MFN-OMNIBUS-NSCC-BOX-ACCT                        
           DISPLAY 'CAT518: BH-MFN-DST-MFE-NSCC-BOX-ACCT   (537601) = '         
                            BH-MFN-DST-MFE-NSCC-BOX-ACCT                        
           DISPLAY 'CAT518: BH-MFN-OMNIBUS-MULTI-PLAT-OPT  (537608) = '         
                            BH-MFN-OMNIBUS-MULTI-PLAT-OPT                       
           DISPLAY 'CAT518: BH-MF3-STATUS                  (540011) = '         
                            BH-MF3-STATUS                                       
           IF  BH-MF3-SUB-EXEC-BKR-REC-NO NOT NUMERIC                           
               MOVE '0' TO BH-MF3-SUB-EXEC-BKR-REC-NO                           
           END-IF.                                                              
           DISPLAY 'CAT518: BH-MF3-SUB-EXEC-BKR-REC-NO     (540167) = '         
                            BH-MF3-SUB-EXEC-BKR-REC-NO.                         
LRM018     DISPLAY 'CAT518: BH-MF3-PNC-SURPAS-BOX-ACCOUNT  (540238) = '         
LRM018                      BH-MF3-PNC-SURPAS-BOX-ACCOUNT                       
           DISPLAY 'CAT518: OPT EXP DATE WITHIN   = ' W-EXP-OPT-DATE            
                    ' STATUS = ' BH-ACAT-EXPIRING-OPT-ACT.                      
LRM020     DISPLAY 'CAT518: BOND EXP/CALLED DATE  = ' WK-BOND-EXP-DATE          
           IF BH-MF-ACTIVE                                                      
           AND BH-MFN-OMNIBUS-NSCC-BOX-ACCT > SPACES                            
              MOVE BH-MFN-OMNIBUS-NSCC-BOX-ACCT TO NS-BRCH-ACCT-T               
              MOVE ' ' TO NS-CK                                                 
              CALL CKDIGIT USING NS-BRCH-ACCT-T                                 
                                 W-CKDIGIT-LEN                                  
                                 NS-CK                                          
           ELSE                                                                 
              MOVE SPACES     TO NS-BRCH-ACCT-TC                                
           END-IF.                                                              
           IF BH-MF-ACTIVE                                                      
           AND BH-MFN-DST-MFE-NSCC-BOX-ACCT > SPACE                             
              MOVE BH-MFN-DST-MFE-NSCC-BOX-ACCT TO WS-DST-BOX-ACCT-T            
              MOVE ' ' TO WS-DST-BOX-CK                                         
              CALL CKDIGIT USING WS-DST-BOX-ACCT-T                              
                                 W-CKDIGIT-LEN                                  
                                 WS-DST-BOX-CK                                  
           ELSE                                                                 
              MOVE SPACES     TO WS-DST-BOX-ACCT-TC                             
           END-IF.                                                              
                                                                                
LRM018     IF BH-MF3-ACTIVE                                                     
LRM018     AND BH-MF3-PNC-SURPAS-BOX-ACCOUNT NOT = SPACE                        
LRM018        MOVE BH-MF3-PNC-SURPAS-BOX-ACCOUNT TO WS-PNC-SURPAS-BOX-T         
LRM018        MOVE ' ' TO WS-PNC-SURPAS-CK                                      
LRM018        CALL  CKDIGIT  USING  WS-PNC-SURPAS-BOX-T                         
LRM018                              W-CKDIGIT-LEN                               
LRM018                              WS-PNC-SURPAS-CK                            
LRM018     ELSE                                                                 
LRM018        MOVE SPACES     TO WS-PNC-SURPAS-BOX-TC                           
LRM018     END-IF.                                                              
                                                                                
           MOVE SPACE TO W-MMF-TABLE-AREA.                                      
           MOVE ZERO  TO TBL-SUB                                                
                         W-MMF-TBL-CNT.                                         
           IF NOT EOF-MMF                                                       
              PERFORM UNTIL  I-MMF-CLIENT-NUM > W-CURRENT-CLIENT-N              
                         OR  EOF-MMF                                            
                         OR  TBL-SUB > 999                                      
                 IF I-MMF-CLIENT-NUM = W-CURRENT-CLIENT-N                       
                    IF I-MMF-REDMPT-REC                                         
                        MOVE I-MMF-REDMPT-COUNT TO W-REDMPT-TBL-CNT             
                        PERFORM VARYING OCR-SUB FROM 1 BY 1                     
                                 UNTIL OCR-SUB > I-MMF-REDMPT-COUNT             
                            MOVE I-MMF-REDMPT-SECURITY (OCR-SUB)                
                              TO W-REDMPT-SEC          (OCR-SUB)                
                        END-PERFORM                                             
                    ELSE                                                        
                        ADD  1    TO  TBL-SUB  W-MMF-TBL-CNT                    
                        MOVE I-MMF-CLIENT-NUM                                   
                                  TO W-MMF-CLT        (TBL-SUB)                 
                        MOVE I-MMF-SECURITY                                     
                                  TO W-MMF-SEC        (TBL-SUB)                 
                        MOVE I-MMF-SWEEP-CODE                                   
                                  TO W-MMF-SWEEP-CD   (TBL-SUB)                 
                        MOVE I-MMF-REDMPT-HRCHY                                 
                                  TO W-MMF-REDMPT-IND (TBL-SUB)                 
LRM016                  MOVE I-MMF-THRESHOLD-COUNT TO                           
LRM016                               W-THRESHOLD-TBL-CNT (TBL-SUB)              
LRM016                  PERFORM VARYING TH-SUB FROM 1 BY 1                      
LRM016                           UNTIL TH-SUB > I-MMF-THRESHOLD-COUNT           
LRM016                     MOVE I-MMF-THRESHOLD-FUND(TH-SUB) TO                 
LRM016                          W-MMF-THRESHOLD-FUND (TBL-SUB, TH-SUB)          
LRM016                  END-PERFORM                                             
                    END-IF                                                      
                 END-IF                                                         
                 PERFORM 3600-READ-MMF-FILE THRU 3600-EXIT                      
              END-PERFORM                                                       
           END-IF.                                                              
           PERFORM VARYING TBL-SUB FROM 1 BY 1 UNTIL TBL-SUB > 999              
               IF W-MMF-SEC (TBL-SUB) > SPACE                                   
                  IF TBL-SUB = 1                                                
                     DISPLAY ' '                                                
                     DISPLAY '** CLT=' BH-BROKER-NUMBER ' - CAMS MONEY'         
                             ' MKT FUNDS PRIMARY REDEMPTION LIST'               
                  END-IF                                                        
                  DISPLAY '   SECURITY = ' W-MMF-SEC (TBL-SUB)                  
                        '   SWEEP CODE = ' W-MMF-SWEEP-CD (TBL-SUB)             
               ELSE                                                             
                  MOVE 9000 TO TBL-SUB                                          
               END-IF                                                           
           END-PERFORM.                                                         
           PERFORM VARYING TBL-SUB FROM 1 BY 1 UNTIL TBL-SUB > 999              
               IF W-REDMPT-SEC (TBL-SUB) > SPACE                                
                  IF TBL-SUB = 1                                                
                     DISPLAY ' '                                                
                     DISPLAY '** CLT=' BH-BROKER-NUMBER ' - CAMS MONEY'         
                             ' MKT FUNDS SECONDARY REDEMPTION LIST'             
                  END-IF                                                        
                  DISPLAY '   SECURITY = ' W-REDMPT-SEC (TBL-SUB)               
               ELSE                                                             
                  MOVE 9000 TO TBL-SUB                                          
               END-IF                                                           
           END-PERFORM.                                                         
           DISPLAY ' '.                                                         
       3500-EXIT. EXIT.                                                         
      /                                                                         
       3600-READ-MMF-FILE.                                                      
           READ MMF-FILE                                                        
              AT END                                                            
                 SET EOF-MMF  TO TRUE.                                          
           IF NOT EOF-MMF                                                       
              ADD 1 TO W-MMF-CNT.                                               
       3600-EXIT.  EXIT.                                                        
      /                                                                         
      ******************************************************************        
      *  PTR - EDIT AND LOAD                                                    
      *      - PROCESS THE TI RECORD                                            
      ******************************************************************        
       4000-EDIT-AND-LOAD.                                                      
           MOVE '4000-EDIT-AND-LOAD        ' TO W-ROUTINE-1.                    
                                                                                
           MOVE ' ' TO W-REJECT-SW                                              
                                                                                
      **SAVE IMPORTANT FIELDS                                                   
           MOVE W-NSCC-KEY-CLIENT-NBR    TO WF-CLIENT-NBR                       
           MOVE W-NSCC-ACAT-CTL-NBR      TO WF-ACAT-CONTROL-NBR                 
           MOVE W-NSCC-TI-SUB-PART-NBR   TO WF-SBMTG-PRTCP-NBR                  
           MOVE W-NSCC-TI-DEL-NBR        TO WF-DLVR-NBR                         
           MOVE W-NSCC-TI-DEL-ACCT-NBR   TO WF-ACCT-DLVR-NBR                    
           MOVE W-NSCC-TI-RCV-NBR        TO WF-RCV-NBR                          
           MOVE W-NSCC-TI-RCV-ACCT-NBR   TO WF-ACCT-RCV-NBR                     
           MOVE W-NSCC-TI-TFR-TYPE       TO WF-TRNFR-TYPE-CD                    
           MOVE W-NSCC-TI-TRAN-TYPE      TO WF-TRANS-TYPE-CD                    
           MOVE 'D'                      TO WF-DSTBN-SIDE-CD                    
                                                                                
LRM010     IF WF-CLIENT-NBR = '0006'                                            
LRM010     AND WF-ACCT-DLVR-NBR(1 : 1) = '1'                                    
LRM010        EXEC SQL SELECT                                                   
LRM010                 ACCT_DLVR_NBR                                            
LRM010                ,CVRSN_ACCT_NBR                                           
LRM010            INTO                                                          
LRM010                :DCLVTRNFR.ACCT-DLVR-NBR                                  
LRM010               ,:DCLVTRNFR.CVRSN-ACCT-NBR                                 
LRM010            FROM  VTRNFR                                                  
LRM010           WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                      
LRM010             AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                
LRM010        END-EXEC                                                          
LRM010        IF SQLCODE  = +0                                                  
LRM010        AND CVRSN-ACCT-NBR > SPACES                                       
LRM010           DISPLAY 'CLIENT 6 CONVERSION ACCT REPL FROM '                  
LRM010             WF-ACCT-DLVR-NBR ' TO ' ACCT-DLVR-NBR OF DCLVTRNFR           
LRM010             ' CNTL=' WF-ACAT-CONTROL-NBR                                 
LRM010           MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO WF-ACCT-DLVR-NBR            
LRM010     END-IF.                                                              
                                                                                
           INITIALIZE                   W-DATE                                  
           IF   W-NSCC-PROC-DATE > ' '                                          
                MOVE W-NSCC-PROC-DATE (1:4) TO W-DATE-YEAR                      
                MOVE W-NSCC-PROC-DATE (5:2) TO W-DATE-MM                        
                MOVE W-NSCC-PROC-DATE (7:2) TO W-DATE-DD                        
           ELSE                                                                 
                MOVE '0001'                 TO W-DATE-YEAR                      
                MOVE '01'                   TO W-DATE-MM                        
                MOVE '01'                   TO W-DATE-DD                        
           END-IF                                                               
           MOVE W-DATE                   TO WF-PRCS-DT                          
                                                                                
           MOVE W-NSCC-STATUS            TO WF-STTS-CD                          
           MOVE ' '                      TO WF-NSCC-PEND-CD                     
           MOVE W-NSCC-TI-TRAN-REF-ID    TO WF-TRANS-RFRN-ID-CD                 
           MOVE WF-ACCT-DLVR-NBR(1:8)    TO WF-BRANCH-ACCT                      
                                                                                
           DISPLAY 'INP=' W-INFILE-CNT                                          
                                      ' ' WF-CLIENT-NBR                         
                                      ' ' WF-ACAT-CONTROL-NBR                   
                               ' BR-ACC=' WF-BRANCH-ACCT                        
                                  ' REC=' WF-RCV-NBR                            
                                  ' STA=' WF-STTS-CD                            
                                  ' DAY=' W-NSCC-DAYS-IN-STATUS                 
                                   ' PD=' W-NSCC-PROC-DATE                      
                                                                                
      ***BYPASS REJECTED  TRANSFERS                                             
           PERFORM 4500-SELECT-ACTITRF THRU 4500-EXIT                           
           IF W-ACTITRF-FND-SW = 'Y'                                            
              IF TRNFR-TYPE-RJCT-CD OF DCLACTITRF = '  ' OR '00'                
                 DISPLAY '   ACTITRF FOUND '                                    
                       ' RJCT=' TRNFR-TYPE-RJCT-CD OF DCLACTITRF                
                       ' PEND=' NSCC-PEND-CD       OF DCLACTITRF                
                       ' PRGM=' PRGM-NM            OF DCLACTITRF                
                       ' UPDT=' UPDT-TMSTP         OF DCLACTITRF                
              ELSE                                                              
DJ0012           IF  (BH-ACAT-ASCENDIS-USER = '1' OR '2')                       
DJ0009                DISPLAY '   FOR ASCENDIS REJECTS,'                        
DJ0009                   ' LOAD BYPASSED HOLDERS RECORDS ANYWAY.'               
DJ0009           ELSE                                                           
                    DISPLAY '   ACTITRF FOUND '                                 
                       ' RJCT=' TRNFR-TYPE-RJCT-CD OF DCLACTITRF                
                       ' PEND=' NSCC-PEND-CD       OF DCLACTITRF                
                       ' PRGM=' PRGM-NM            OF DCLACTITRF                
                       ' UPDT=' UPDT-TMSTP         OF DCLACTITRF                
                       ' BYPASSED REJECT'                                       
                    GO TO 4000-EXIT                                             
DJ0009           END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           PERFORM 4600-GET-VTRNFR     THRU 4600-EXIT                           
                                                                                
      ***BYPASS DUPLICATE TRANSFERS                                             
           IF  W-TRANSFER-FND-SW = 'Y'                                          
               IF  ACCT-DPLCT-TRN-IND OF DCLVTRNFR = 'Y'                        
                   DISPLAY '   BYPASS DUPE. FUL TRANSFER ACTIVE.'               
                   GO TO 4000-EXIT                                              
               END-IF                                                           
DJ0006         IF  ACCT-FRZN-IND      OF DCLVTRNFR = 'Y'                        
DJ0006             DISPLAY 'ACCT-FRZN-IND ='                                    
DJ0006             ACCT-FRZN-IND OF DCLVTRNFR                                   
DJ0006             MOVE 'Y'  TO W-FLAG-FRZN                                     
DJ0006                          W-ASSET-FLAG-FRZN                               
DJ0006             MOVE '03' TO W-FRZN-CODE                                     
DJ0006                          W-ASSET-FRZN-CODE                               
DJ0006             MOVE 'Y'  TO W-REJECT-AUTO-SW                                
DJ0006         END-IF                                                           
           END-IF.                                                              
                                                                                
           PERFORM 4100-PROCESS-TI THRU 4100-EXIT                               
                                                                                
           MOVE 'Y'     TO W-PTR-TRANSFER-SW                                    
           MOVE ' '     TO W-PTR-ASSET-FOUND-SW                                 
                                                                                
           PERFORM 5000-GET-BALANCES  THRU 5000-EXIT                            
                                                                                
           PERFORM 5100-GET-POSITIONS THRU 5100-EXIT                            
                                                                                
           PERFORM 5300-LOAD-BALANCES THRU 5300-EXIT.                           
                                                                                
           IF  W-PTR-ASSET-FOUND-SW = 'Y'                                       
               MOVE ' ' TO W-FLAG-FLAT                                          
           ELSE                                                                 
               DISPLAY '   NO ASSETS FOUND'                                     
               IF BH-ACAT-REJ-PEND-PTR-DEL-FL-IN = '1'                          
                  MOVE 'Y' TO W-FLAG-FLAT                                       
                  MOVE 'Y' TO W-ASSET-FLAG-FLAT                                 
                  MOVE BH-ACAT-REJ-PEND-PTR-DEL-FL-CD                           
                    TO W-FLAT-CODE                                              
                       W-ASSET-FLAT-CODE                                        
               END-IF                                                           
           END-IF.                                                              
                                                                                
      ***RELEASE THE TI REQUEST RECORD TO SORT                                  
           MOVE W-BAL-TYPE1  TO REQ-BAL-TYPE1                                   
           MOVE W-BAL-TYPE2  TO REQ-BAL-TYPE2                                   
           MOVE W-BAL-TYPE3  TO REQ-BAL-TYPE3                                   
           MOVE W-BAL-TYPE5  TO REQ-BAL-TYPE5                                   
           MOVE W-BAL-SMA    TO REQ-BAL-SMA                                     
           PERFORM 6400-RELEASE-ACATPTRR THRU 6400-EXIT.                        
                                                                                
       4000-EXIT. EXIT.                                                         
      /                                                                         
       4100-PROCESS-TI.                                                         
      *****************************************************************         
      *  WRITE TI TO A FILE                                                     
      *****************************************************************         
                                                                                
           MOVE ' '                           TO REQ-RECORD                     
           INITIALIZE                            REQ-GOT-DATA                   
           MOVE W-NSCC-KEY-CLIENT-NBR         TO REQ-KEY-CLIENT-NBR             
           MOVE '1'                           TO REQ-KEY-SORT-ID                
           MOVE WF-ACCT-DLVR-NBR(1:8)         TO REQ-KEY-ACCT-NBR(1:8)          
           MOVE W-NSCC-ACAT-CTL-NBR           TO REQ-KEY-ACAT-CTL-NBR           
           SET  REQ-KEY-REC-TYPE-IS-TI        TO TRUE                           
           MOVE DCLVTRNFR                     TO REQ-TI-DATA                    
           .                                                                    
       4100-EXIT. EXIT.                                                         
      /                                                                         
       4200-PROCESS-AT.                                                         
      *****************************************************************         
      *  ASSUMPTION: A "TI" RECORD ALWAYS PRECEED THE "AT" RECORDS              
      *  GET VASSET,VMF,VOPTN MEMO-PTR REQUEST DATA                             
      *  WRITE AT TO A FILE                                                     
      *****************************************************************         
           IF  W-ACTITRF-FND-SW = 'Y'                                           
           AND W-NSCC-KEY-CLIENT-NBR = CLIENT-NBR       OF DCLACTITRF           
           AND W-NSCC-ACAT-CTL-NBR   = ACAT-CONTROL-NBR OF DCLACTITRF           
LRM030     AND BH-ACAT-ASCENDIS-USER = '0'                                      
               IF  TRNFR-TYPE-RJCT-CD OF DCLACTITRF = '  ' OR '00'              
                   CONTINUE                                                     
               ELSE                                                             
               DISPLAY '   AT: BYPASS REJECT ' W-NSCC-RECORD(59:31)             
                   GO TO 4200-EXIT                                              
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  W-TRANSFER-FND-SW = 'Y'                                          
           AND W-NSCC-KEY-CLIENT-NBR = CLIENT-NBR       OF DCLVTRNFR            
           AND W-NSCC-ACAT-CTL-NBR   = ACAT-CONTROL-NBR OF DCLVTRNFR            
LRM030     AND BH-ACAT-ASCENDIS-USER = '0'                                      
               IF  ACCT-DPLCT-TRN-IND OF DCLVTRNFR NOT = 'Y'                    
                   CONTINUE                                                     
               ELSE                                                             
               DISPLAY '   AT: BYPASS DUPE ' W-NSCC-RECORD(59:31)               
                   GO TO 4200-EXIT                                              
               END-IF                                                           
           END-IF.                                                              
                                                                                
           PERFORM 4700-GET-VASSET        THRU 4700-EXIT                        
                                                                                
           MOVE ' '                           TO REQ-RECORD                     
           INITIALIZE                            REQ-GOT-DATA                   
           MOVE W-NSCC-KEY-CLIENT-NBR         TO REQ-KEY-CLIENT-NBR             
           MOVE '1'                           TO REQ-KEY-SORT-ID                
           MOVE WF-ACCT-DLVR-NBR(1:8)         TO REQ-KEY-ACCT-NBR(1:8)          
           MOVE W-NSCC-ACAT-CTL-NBR           TO REQ-KEY-ACAT-CTL-NBR           
           SET  REQ-KEY-REC-TYPE-IS-AT        TO TRUE                           
           MOVE SECURITY-ADP-NBR OF DCLVASSET                                   
                                             TO REQ-KEY-SECURITY-ADP-NBR        
DJ0009*****SORT WHEN-ISSUE BEFORE REGULAR SECURITY                              
DJ0009     IF WHI-CD OF DCLVASSET = 'W'                                         
DJ0009        MOVE 'I'                       TO REQ-KEY-WHI-CD                  
           ELSE                                                                 
DJ0009        MOVE 'N'                       TO REQ-KEY-WHI-CD                  
           END-IF                                                               
                                                                                
           MOVE PSTN-CD          OF DCLVASSET                                   
                                             TO REQ-KEY-POS-CD                  
                                                                                
      ***--MOVE ' 40CRED' OR ' 40DEB' TO KEY FOR SORTING                        
           IF (STTLM-LCTN-CD OF DCLVASSET = '40' AND                            
              (STTLM-RSN-CD  OF DCLVASSET = 'CRED' OR 'DEB'))                   
               MOVE ' '           TO REQ-KEY-SECURITY-ADP-NBR(1:1)              
               MOVE STTLM-LCTN-CD OF DCLVASSET                                  
                                  TO REQ-KEY-SECURITY-ADP-NBR(2:2)              
               MOVE STTLM-RSN-CD OF DCLVASSET                                   
                                  TO REQ-KEY-SECURITY-ADP-NBR(4:4)              
               MOVE ' '                      TO REQ-KEY-POS-CD                  
           END-IF                                                               
                                                                                
      ***--MOVE ' 45SMA' TO KEY FOR SORTING                                     
           IF (STTLM-LCTN-CD OF DCLVASSET = '45' AND                            
              (STTLM-RSN-CD  OF DCLVASSET = 'SMA'))                             
               MOVE ' '           TO REQ-KEY-SECURITY-ADP-NBR(1:1)              
               MOVE STTLM-LCTN-CD OF DCLVASSET                                  
                                  TO REQ-KEY-SECURITY-ADP-NBR(2:2)              
               MOVE STTLM-RSN-CD OF DCLVASSET                                   
                                  TO REQ-KEY-SECURITY-ADP-NBR(4:4)              
           END-IF                                                               
                                                                                
***********GET ORIGINAL C/M/S INDICATOR FROM SIAC FILE                          
           MOVE W-NSCC-AT-CASH-MRGN-SHTCD                                       
                                        TO CSH-MGN-SHRT-CD OF DCLVASSET         
           MOVE W-NSCC-AT-CASH-MRGN-SHTCD                                       
                                             TO REQ-KEY-CASH-MRGN-SHTCD         
***********GET ORIGINAL ASSET REQUEST TRANSACTION CODE (1/2/3)                  
           MOVE W-NSCC-AT-ASSET-REQ-TRNCD    TO REQ-KEY-ASSET-REQ-TRNCD         
           MOVE ASSET-QTY OF DCLVASSET                                          
                                             TO REQ-KEY-ASSET-QTY               
           MOVE ASSET-PCT OF DCLVASSET                                          
                                             TO REQ-KEY-ASSET-PCT               
           MOVE ASSET-AMT OF DCLVASSET                                          
                                             TO REQ-KEY-ASSET-AMT               
                                                                                
DJ0004*****CHECK ORIGINAL ASSET QUANTITY REQUEST INDICATOR (F/P)                
DJ0004*****USE ASSET-QUANTITY-REQUEST-INDICATOR OF "F" FOR 100%                 
DJ0004     IF  W-NSCC-AT-ASSET-QTY-RQIND = 'F'                                  
DJ0004         MOVE '1'                      TO REQ-KEY-ASSET-REQ-TRNCD         
DJ0004         MOVE 100.00                   TO REQ-KEY-ASSET-PCT               
DJ0004         DISPLAY '   AT: REQUESTED F(100%) SEC: '                         
DJ0004                                        REQ-KEY-SECURITY-ADP-NBR          
DJ0004     END-IF                                                               
                                                                                
           MOVE ASSET-PRC-CTGY-CD OF DCLVASSET                                  
                                            TO REQ-KEY-ASSET-PRC-CTGY-CD        
           MOVE STTLM-LCTN-CD     OF DCLVASSET                                  
                                            TO REQ-KEY-STTLM-LCTN-CD            
           MOVE STTLM-RSN-CD      OF DCLVASSET                                  
                                            TO REQ-KEY-STTLM-RSN-CD             
                                                                                
           MOVE DCLVASSET                    TO REQ-AT-PART                     
                                                                                
           IF (W-NSCC-AT-MF-LEN                                                 
           AND W-NSCC-AT-STL-LOC = '10')                                        
               PERFORM 4800-GET-VMF       THRU 4800-EXIT                        
               MOVE DCLVMF                    TO REQ-MF-PART                    
           ELSE                                                                 
               IF (W-NSCC-AT-OP-LEN                                             
               AND W-NSCC-AT-OPT-CATG > '00')                                   
                   PERFORM 4900-GET-VOPTN THRU 4900-EXIT                        
                   MOVE DCLVOPTN              TO REQ-OP-PART                    
LRM025*************MOVE REQ-OP-SYM-CD         TO REQ-KEY-OP-SYM-CD              
LRM025*************MOVE REQ-OP-PTCL-CD        TO REQ-KEY-OP-PTCL-CD             
               END-IF                                                           
           END-IF                                                               
                                                                                
      ***RELEASE THE AT REQUEST RECORD TO SORT                                  
           PERFORM 6400-RELEASE-ACATPTRR THRU 6400-EXIT.                        
                                                                                
       4200-EXIT. EXIT.                                                         
      /                                                                         
       4500-SELECT-ACTITRF.                                                     
           MOVE '4500-SELECT-ACTITRF          ' TO W-ROUTINE-1.                 
                                                                                
           MOVE ' ' TO DCLACTITRF                                               
                                                                                
           EXEC SQL SELECT                                                      
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
               INTO                                                             
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
                                                                                
               FROM  ACTITRF                                                    
              WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                         
                AND  DLVR_NBR          = :WF-DLVR-NBR                           
                AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                      
                AND  RCV_NBR           = :WF-RCV-NBR                            
                AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                       
                AND  TRNFR_TYPE_CD     = :WF-TRNFR-TYPE-CD                      
                AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                   
           END-EXEC                                                             
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               MOVE 'Y' TO W-ACTITRF-FND-SW                                     
           ELSE                                                                 
               MOVE ' ' TO W-ACTITRF-FND-SW                                     
               IF  SQLCODE  =  +100                                             
                   CONTINUE                                                     
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT518: ERROR SELECTING A ROW IN ACTITRF'           
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT518: DCLACTITRF  ='                              
                           '(' DCLACTITRF ')'                                   
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       4500-EXIT. EXIT.                                                         
      /                                                                         
       4600-GET-VTRNFR.                                                         
           MOVE '4600-GET-VTRNFR            ' TO W-ROUTINE-1.                   
                                                                                
           MOVE ' '                TO W-TRANSFER-FND-SW                         
           INITIALIZE DCLVTRNFR                                                 
                                                                                
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
                   ,ALERT_IND                                                   
DJ0006             ,ACCT_FRZN_IND                                               
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
                   ,:DCLVTRNFR.ALERT-IND                                        
DJ0006             ,:DCLVTRNFR.ACCT-FRZN-IND                                    
               FROM  VTRNFR                                                     
              WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                         
                AND  DLVR_NBR          = :WF-DLVR-NBR                           
                AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                      
                AND  RCV_NBR           = :WF-RCV-NBR                            
                AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                       
                AND  TRNFR_TYPE_CD     = :WF-TRNFR-TYPE-CD                      
                AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                   
           END-EXEC                                                             
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               MOVE 'Y'                TO W-TRANSFER-FND-SW                     
           ELSE                                                                 
               DISPLAY '   VTRNFR   NOTFND:'                                    
                                 ' CLT=' WF-CLIENT-NBR                          
                                 ' CTL=' WF-ACAT-CONTROL-NBR                    
           END-IF.                                                              
                                                                                
       4600-EXIT. EXIT.                                                         
      /                                                                         
       4700-GET-VASSET.                                                         
           MOVE '4700-GET-VASSET            ' TO W-ROUTINE-1.                   
           MOVE ' '     TO  END-OF-ASSET-SW.                                    
           INITIALIZE DCLVASSET.                                                
           MOVE W-NSCC-KEY-CLIENT-NBR  TO CLIENT-NBR       OF DCLVASSET.        
           MOVE W-NSCC-AT-ACAT-CTL-NBR TO ACAT-CONTROL-NBR OF DCLVASSET.        
           MOVE W-NSCC-AT-ASSET-SEQ-NBR TO ASSET-SEQ-NBR   OF DCLVASSET.        
           MOVE W-NSCC-AT-ASSET-SEQ-NBR TO WF-ASSET-SEQ-NBR.                    
                                                                                
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,ACAT_CONTROL_NBR                                            
                   ,ASSET_SEQ_NBR                                               
                   ,CONTROL_NBR_STS_CD                                          
                   ,DLVR_NBR_STTS_CD                                            
                   ,RCV_NBR_STTS_CD                                             
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,AST_SEQ_NBR_STS_CD                                          
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,ASSET_PRC_CTGY_CD                                           
                   ,AST_PRC_CTG_STS_CD                                          
                   ,STTLM_LCTN_CD                                               
                   ,STTLM_LCTN_STTS_CD                                          
                   ,STTLM_RSN_CD                                                
                   ,STTLM_RSN_STTS_CD                                           
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_CNTRY_STTS_CD                                          
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_IS_STS_CD                                          
                   ,ISIN_SEC_CDG_CD                                             
                   ,ISIN_SEC_CD_STS_CD                                          
                   ,ASSET_DESC_TXT                                              
                   ,ASSET_DESC_STTS_CD                                          
                   ,ASSET_RQST_QTY_CD                                           
                   ,ASSET_RQST_STS_CD                                           
                   ,AST_RQST_TRANS_CD                                           
                   ,AST_RQ_TRAN_STS_CD                                          
                   ,ASSET_QTY                                                   
                   ,ASSET_QTY_STTS_CD                                           
                   ,ASSET_PCT                                                   
                   ,ASSET_PCT_STTS_CD                                           
                   ,PSTN_CD                                                     
                   ,PSTN_CD_STTS_CD                                             
                   ,ISO_CRNCY_CD                                                
                   ,ISO_CRNCY_STTS_CD                                           
                   ,ASSET_AMT                                                   
                   ,ASSET_AMT_STTS_CD                                           
                   ,BEARER_BOND_CD                                              
                   ,BEARER_BND_STTS_CD                                          
                   ,CSH_MGN_SHRT_CD                                             
                   ,CSH_MRG_SHT_STS_CD                                          
                   ,WHI_CD                                                      
                   ,WHI_STTS_CD                                                 
                   ,TRNFR_TYPE_RSN_CD                                           
                   ,TRN_TYP_RSN_STS_CD                                          
                   ,MBS_SERIAL_NBR                                              
                   ,MBS_SERIAL_STTS_CD                                          
                   ,ASSET_CMNT_TXT                                              
                   ,ASSET_CMNT_STTS_CD                                          
                   ,NSCC_ACK_IND                                                
                   ,NSCC_PEND_CD                                                
                   ,FAIL_SENT_CAGE_IND                                          
                   ,FAIL_OPEN_CAGE_IND                                          
                   ,NSCC_NON_ADP_IND                                            
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,OPTN_CTGY_CD                                                
                   ,OPTN_CTGY_STTS_CD                                           
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,ISIN_SEC_EXCPT_IND                                          
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,SECURITY_ADP_NBR                                            
                   ,RCL_SENT_NSCC_IND                                           
                   ,FRV_SENT_NSCC_IND                                           
                   ,TRNFR_TYPE_CD                                               
                   ,TRNFR_TYPE_STTS_CD                                          
                   ,RESTRICTED_IND                                              
                   ,CAGE_TAG_NBR                                                
                INTO                                                            
                   :DCLVASSET.CLIENT-NBR                                        
                  ,:DCLVASSET.ACAT-CONTROL-NBR                                  
                  ,:DCLVASSET.ASSET-SEQ-NBR                                     
                  ,:DCLVASSET.CONTROL-NBR-STS-CD                                
                  ,:DCLVASSET.DLVR-NBR-STTS-CD                                  
                  ,:DCLVASSET.RCV-NBR-STTS-CD                                   
                  ,:DCLVASSET.SBMTG-PRTCP-NBR                                   
                  ,:DCLVASSET.SBMT-PRT-NR-STS-CD                                
                  ,:DCLVASSET.AST-SEQ-NBR-STS-CD                                
                  ,:DCLVASSET.SYS-ACT-CD                                        
                  ,:DCLVASSET.SYS-RJCT-RSN-CD                                   
                  ,:DCLVASSET.TRANS-TYPE-CD                                     
                  ,:DCLVASSET.TRANS-TYPE-STTS-CD                                
                  ,:DCLVASSET.PHSCL-SEQ-NBR                                     
                  ,:DCLVASSET.PHSCL-SEQ-STTS-CD                                 
                  ,:DCLVASSET.LGCL-SEQ-NBR                                      
                  ,:DCLVASSET.LGCL-SEQ-NR-STS-CD                                
                  ,:DCLVASSET.ASSET-PRC-CTGY-CD                                 
                  ,:DCLVASSET.AST-PRC-CTG-STS-CD                                
                  ,:DCLVASSET.STTLM-LCTN-CD                                     
                  ,:DCLVASSET.STTLM-LCTN-STTS-CD                                
                  ,:DCLVASSET.STTLM-RSN-CD                                      
                  ,:DCLVASSET.STTLM-RSN-STTS-CD                                 
                  ,:DCLVASSET.ISIN-CNTRY-CD                                     
                  ,:DCLVASSET.ISIN-CNTRY-STTS-CD                                
                  ,:DCLVASSET.ISIN-SEC-ISSUE-CD                                 
                  ,:DCLVASSET.ISIN-SEC-IS-STS-CD                                
                  ,:DCLVASSET.ISIN-SEC-CDG-CD                                   
                  ,:DCLVASSET.ISIN-SEC-CD-STS-CD                                
                  ,:DCLVASSET.ASSET-DESC-TXT                                    
                  ,:DCLVASSET.ASSET-DESC-STTS-CD                                
                  ,:DCLVASSET.ASSET-RQST-QTY-CD                                 
                  ,:DCLVASSET.ASSET-RQST-STS-CD                                 
                  ,:DCLVASSET.AST-RQST-TRANS-CD                                 
                  ,:DCLVASSET.AST-RQ-TRAN-STS-CD                                
                  ,:DCLVASSET.ASSET-QTY                                         
                  ,:DCLVASSET.ASSET-QTY-STTS-CD                                 
                  ,:DCLVASSET.ASSET-PCT                                         
                  ,:DCLVASSET.ASSET-PCT-STTS-CD                                 
                  ,:DCLVASSET.PSTN-CD                                           
                  ,:DCLVASSET.PSTN-CD-STTS-CD                                   
                  ,:DCLVASSET.ISO-CRNCY-CD                                      
                  ,:DCLVASSET.ISO-CRNCY-STTS-CD                                 
                  ,:DCLVASSET.ASSET-AMT                                         
                  ,:DCLVASSET.ASSET-AMT-STTS-CD                                 
                  ,:DCLVASSET.BEARER-BOND-CD                                    
                  ,:DCLVASSET.BEARER-BND-STTS-CD                                
                  ,:DCLVASSET.CSH-MGN-SHRT-CD                                   
                  ,:DCLVASSET.CSH-MRG-SHT-STS-CD                                
                  ,:DCLVASSET.WHI-CD                                            
                  ,:DCLVASSET.WHI-STTS-CD                                       
                  ,:DCLVASSET.TRNFR-TYPE-RSN-CD                                 
                  ,:DCLVASSET.TRN-TYP-RSN-STS-CD                                
                  ,:DCLVASSET.MBS-SERIAL-NBR                                    
                  ,:DCLVASSET.MBS-SERIAL-STTS-CD                                
                  ,:DCLVASSET.ASSET-CMNT-TXT                                    
                  ,:DCLVASSET.ASSET-CMNT-STTS-CD                                
                  ,:DCLVASSET.NSCC-ACK-IND                                      
                  ,:DCLVASSET.NSCC-PEND-CD                                      
                  ,:DCLVASSET.FAIL-SENT-CAGE-IND                                
                  ,:DCLVASSET.FAIL-OPEN-CAGE-IND                                
                  ,:DCLVASSET.NSCC-NON-ADP-IND                                  
                  ,:DCLVASSET.TRANS-RFRN-ID-CD                                  
                  ,:DCLVASSET.TRANS-RFRN-STTS-CD                                
                  ,:DCLVASSET.OPTN-CTGY-CD                                      
                  ,:DCLVASSET.OPTN-CTGY-STTS-CD                                 
                  ,:DCLVASSET.RCRD-LNGTH-STTS-CD                                
                  ,:DCLVASSET.RCRD-STTS-CD                                      
                  ,:DCLVASSET.ISIN-SEC-EXCPT-IND                                
                  ,:DCLVASSET.CRT-TMSTP                                         
                  ,:DCLVASSET.UPDT-TMSTP                                        
                  ,:DCLVASSET.CICS-TERM-ID-CD                                   
                  ,:DCLVASSET.PRGM-NM                                           
                  ,:DCLVASSET.SECURITY-ADP-NBR                                  
                  ,:DCLVASSET.RCL-SENT-NSCC-IND                                 
                  ,:DCLVASSET.FRV-SENT-NSCC-IND                                 
                  ,:DCLVASSET.TRNFR-TYPE-CD                                     
                  ,:DCLVASSET.TRNFR-TYPE-STTS-CD                                
                  ,:DCLVASSET.RESTRICTED-IND                                    
                  ,:DCLVASSET.CAGE-TAG-NBR                                      
              FROM VASSET                                                       
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
                  AND  ASSET_SEQ_NBR     = :WF-ASSET-SEQ-NBR                    
           END-EXEC                                                             
           IF SQLCODE = +0                                                      
                       SET VASSET-SELECTED TO TRUE                              
           ELSE                                                                 
               DISPLAY '   VASSET   NOTFND:'                                    
                                 ' CLT=' WF-CLIENT-NBR                          
                                 ' CTL=' WF-ACAT-CONTROL-NBR                    
                                 ' SEQ=' INFILE-AT-ASSET-SEQ-NBR                
           END-IF.                                                              
                                                                                
       4700-EXIT. EXIT.                                                         
      /                                                                         
       4800-GET-VMF.                                                            
           MOVE ' '     TO  END-OF-MF-SW.                                       
           INITIALIZE DCLVMF.                                                   
           MOVE W-NSCC-KEY-CLIENT-NBR  TO CLIENT-NBR       OF DCLVMF.           
           MOVE W-NSCC-AT-ACAT-CTL-NBR TO ACAT-CONTROL-NBR OF DCLVMF.           
           MOVE W-NSCC-AT-ASSET-SEQ-NBR TO ASSET-SEQ-NBR   OF DCLVMF.           
           MOVE W-NSCC-AT-ASSET-SEQ-NBR TO WF-ASSET-SEQ-NBR.                    
                                                                                
           EXEC SQL SELECT                                                      
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,BK_PHSCL_SHR_CD                                            
                    ,BK_PHSC_SHR_STS_CD                                         
                    ,NTWRK_CNTL_CD                                              
                    ,NTWRK_CNTL_STTS_CD                                         
                    ,ACCT_TYPE_CD                                               
                    ,ACCT_TYPE_STTS_CD                                          
                    ,DVDND_CD                                                   
                    ,DVDND_STTS_CD                                              
                    ,DVDND_PAYEE_CD                                             
                    ,DVDND_PYE_STTS_CD                                          
                    ,LTCG_CD                                                    
                    ,BRKR_EXCTG_NBR                                             
                    ,BRKR_EXCTG_STTS_CD                                         
                    ,STCG_CD                                                    
                    ,MF_FULL_PRTL_CD                                            
                    ,MF_FUL_PRTL_STS_CD                                         
                    ,RGSTN_CD                                                   
                    ,FNBR                                                       
                    ,FND_ACT_NBR_STS_CD                                         
                    ,DSTBN_SIDE_CD                                              
                    ,PRCS_DT                                                    
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,CICS_TERM_ID_CD                                            
                    ,PRGM_NM                                                    
                    ,FCST_ACCT_RCVR_NBR                                         
                    ,FCST_RCVR_STTS_CD                                          
                INTO                                                            
                   :DCLVMF.CLIENT-NBR                                           
                  ,:DCLVMF.ACAT-CONTROL-NBR                                     
                  ,:DCLVMF.ASSET-SEQ-NBR                                        
                  ,:DCLVMF.BK-PHSCL-SHR-CD                                      
                  ,:DCLVMF.BK-PHSC-SHR-STS-CD                                   
                  ,:DCLVMF.NTWRK-CNTL-CD                                        
                  ,:DCLVMF.NTWRK-CNTL-STTS-CD                                   
                  ,:DCLVMF.ACCT-TYPE-CD                                         
                  ,:DCLVMF.ACCT-TYPE-STTS-CD                                    
                  ,:DCLVMF.DVDND-CD                                             
                  ,:DCLVMF.DVDND-STTS-CD                                        
                  ,:DCLVMF.DVDND-PAYEE-CD                                       
                  ,:DCLVMF.DVDND-PYE-STTS-CD                                    
                  ,:DCLVMF.LTCG-CD                                              
                  ,:DCLVMF.BRKR-EXCTG-NBR                                       
                  ,:DCLVMF.BRKR-EXCTG-STTS-CD                                   
                  ,:DCLVMF.STCG-CD                                              
                  ,:DCLVMF.MF-FULL-PRTL-CD                                      
                  ,:DCLVMF.MF-FUL-PRTL-STS-CD                                   
                  ,:DCLVMF.RGSTN-CD                                             
                  ,:DCLVMF.FNBR                                                 
                  ,:DCLVMF.FND-ACT-NBR-STS-CD                                   
                  ,:DCLVMF.DSTBN-SIDE-CD                                        
                  ,:DCLVMF.PRCS-DT                                              
                  ,:DCLVMF.CRT-TMSTP                                            
                  ,:DCLVMF.UPDT-TMSTP                                           
                  ,:DCLVMF.CICS-TERM-ID-CD                                      
                  ,:DCLVMF.PRGM-NM                                              
                  ,:DCLVMF.FCST-ACCT-RCVR-NBR                                   
                  ,:DCLVMF.FCST-RCVR-STTS-CD                                    
               FROM  VMF                                                        
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
                  AND  ASSET_SEQ_NBR     = :WF-ASSET-SEQ-NBR                    
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = +0                                                      
                    SET VMF-SELECTED TO TRUE                                    
           ELSE                                                                 
               DISPLAY '   VMF      NOTFND:'                                    
                                 ' CLT=' WF-CLIENT-NBR                          
                                 ' CTL=' WF-ACAT-CONTROL-NBR                    
                                 ' SEQ=' WF-ASSET-SEQ-NBR                       
           END-IF.                                                              
                                                                                
       4800-EXIT. EXIT.                                                         
      /                                                                         
       4900-GET-VOPTN.                                                          
           MOVE ' '     TO  END-OF-OPTION-SW.                                   
                                                                                
           EXEC SQL SELECT                                                      
                     CLIENT_NBR                                                 
                    ,ACAT_CONTROL_NBR                                           
                    ,ASSET_SEQ_NBR                                              
                    ,BS_CD                                                      
                    ,BS_STTS_CD                                                 
                    ,PTCL_CD                                                    
                    ,PTCL_STTS_CD                                               
                    ,OPTN_OPN_CLSD_CD                                           
                    ,OPT_OPN_CLS_STS_CD                                         
                    ,SYM_CD                                                     
                    ,SYM_STTS_CD                                                
                    ,EXPTN_DT                                                   
                    ,STPRC_INTEGER_AMT                                          
LRM015              ,STPRC_INTEGER2_AMT                                         
                    ,STPRC_INTR_STTS_CD                                         
                    ,STPRC_FRCTN_AMT                                            
                    ,STPRC_FRCT_STTS_CD                                         
                    ,DLVR_OCC_NBR                                               
                    ,OPTN_ACCT_TYPE_CD                                          
                    ,OPT_ACT_TYP_STS_CD                                         
                    ,ACCT_SUB_CD                                                
                    ,ACCT_SUB_STTS_CD                                           
                    ,OPTN_CMNT_TXT                                              
                    ,OPTN_CMNT_STTS_CD                                          
                    ,OPTN_EXPTN_DT_CD                                           
                    ,OPT_OCC_DLV_STS_CD                                         
                    ,ACCT_TYPE_MSMT_IND                                         
                    ,CRT_TMSTP                                                  
                    ,UPDT_TMSTP                                                 
                    ,PRGM_NM                                                    
                    ,CICS_TERM_ID_CD                                            
                    ,STPRC_DEC_FRCN_IND                                         
                INTO                                                            
                   :DCLVOPTN.CLIENT-NBR                                         
                  ,:DCLVOPTN.ACAT-CONTROL-NBR                                   
                  ,:DCLVOPTN.ASSET-SEQ-NBR                                      
                  ,:DCLVOPTN.BS-CD                                              
                  ,:DCLVOPTN.BS-STTS-CD                                         
                  ,:DCLVOPTN.PTCL-CD                                            
                  ,:DCLVOPTN.PTCL-STTS-CD                                       
                  ,:DCLVOPTN.OPTN-OPN-CLSD-CD                                   
                  ,:DCLVOPTN.OPT-OPN-CLS-STS-CD                                 
                  ,:DCLVOPTN.SYM-CD                                             
                  ,:DCLVOPTN.SYM-STTS-CD                                        
                  ,:DCLVOPTN.EXPTN-DT                                           
                  ,:DCLVOPTN.STPRC-INTEGER-AMT                                  
LRM015            ,:DCLVOPTN.STPRC-INTEGER2-AMT                                 
                  ,:DCLVOPTN.STPRC-INTR-STTS-CD                                 
                  ,:DCLVOPTN.STPRC-FRCTN-AMT                                    
                  ,:DCLVOPTN.STPRC-FRCT-STTS-CD                                 
                  ,:DCLVOPTN.DLVR-OCC-NBR                                       
                  ,:DCLVOPTN.OPTN-ACCT-TYPE-CD                                  
                  ,:DCLVOPTN.OPT-ACT-TYP-STS-CD                                 
                  ,:DCLVOPTN.ACCT-SUB-CD                                        
                  ,:DCLVOPTN.ACCT-SUB-STTS-CD                                   
                  ,:DCLVOPTN.OPTN-CMNT-TXT                                      
                  ,:DCLVOPTN.OPTN-CMNT-STTS-CD                                  
                  ,:DCLVOPTN.OPTN-EXPTN-DT-CD                                   
                  ,:DCLVOPTN.OPT-OCC-DLV-STS-CD                                 
                  ,:DCLVOPTN.ACCT-TYPE-MSMT-IND                                 
                  ,:DCLVOPTN.CRT-TMSTP                                          
                  ,:DCLVOPTN.UPDT-TMSTP                                         
                  ,:DCLVOPTN.PRGM-NM                                            
                  ,:DCLVOPTN.CICS-TERM-ID-CD                                    
                  ,:DCLVOPTN.STPRC-DEC-FRCN-IND                                 
               FROM  VOPTN                                                      
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
                  AND  ASSET_SEQ_NBR     = :WF-ASSET-SEQ-NBR                    
           END-EXEC.                                                            
           IF SQLCODE = +0                                                      
                    SET VOPTION-SELECTED TO TRUE                                
           ELSE                                                                 
               DISPLAY '   VOPTN    NOTFND:'                                    
                                 ' CLT=' WF-CLIENT-NBR                          
                                 ' CTL=' WF-ACAT-CONTROL-NBR                    
                                 ' SEQ=' WF-ASSET-SEQ-NBR                       
           END-IF.                                                              
                                                                                
       4900-EXIT. EXIT.                                                         
      /                                                                         
       5000-GET-BALANCES.                                                       
      *****************************************************************         
      *  GET BALANCES                                                           
      *      TYPES 1, 3 = CASH                                                  
      *      TYPES 2    = MARGIN                                                
      *      TYPES 5    = SHORT                                                 
      *      SMA        = SMA                                                   
      *****************************************************************         
           MOVE '5000-GET-BALANCES             ' TO W-ROUTINE-1.                
                                                                                
DJ0001     MOVE 'N' TO W-REMOVE-FRACTION-SW                                     
           MOVE ' '                TO W-BAL-FND-SW                              
           MOVE ZEROES             TO W-BAL-TYPE1                               
                                      W-BAL-TYPE2                               
                                      W-BAL-TYPE3                               
                                      W-BAL-TYPE5                               
                                      W-BAL-SMA                                 
                                      W-BAL-MMKT                                
                                      W-BAL-TOTAL-MARKET-VALUE                  
                                      W-BAL-TOTL-LIQDATNG-EQUITY                
                                      W-BAL-PENDING-AMOUNT                      
           MOVE SPACES                      TO W-BAL-KEY                        
           MOVE W-CURRENT-CLIENT-N          TO W-BAL-CLT                        
           MOVE WF-BRANCH-CD                TO W-BAL-BR                         
           MOVE WF-ACCT-CD                  TO W-BAL-ACCT                       
           MOVE '28'                        TO W-BAL-REC-TYPE                   
           MOVE '000000'                    TO W-BAL-CUR                        
           MOVE W-BAL-KEY                   TO CMBL-KEY                         
                                                                                
      ***  MOVE  LOW-VALUES                TO  GETVBAL-PARM.                    
           MOVE  'CAT518  '                TO  GETVBAL-CALLING-PROGRAM.         
           MOVE  'O'                       TO  GETVBAL-FILE.                    
           MOVE  'R'                       TO  GETVBAL-FUNC.                    
           MOVE W-CURRENT-CLIENT-N         TO  GETVBAL-OLD-CLIENT.              
           MOVE W-BAL-BR                   TO  GETVBAL-OLD-BRANCH.              
           MOVE W-BAL-ACCT                 TO  GETVBAL-OLD-ACCT.                
           MOVE ZEROES                     TO  GETVBAL-OLD-CUR-CODE.            
           SET GETVBAL-OLD-FILLER-SPACE    TO  TRUE.                            
           PERFORM 9500-CALL-GETVBAL THRU 9500-EXIT                             
                                                                                
           IF BALNC-OKAY                                                        
              CONTINUE                                                          
           ELSE                                                                 
             IF BALNC-END-OF-FILE                                               
             OR BALNC-NOT-FOUND                                                 
                GO TO 5000-EXIT                                                 
             ELSE                                                               
                DISPLAY ' ** CAT518  CALL GETVBAL PROBLEM'                      
                DISPLAY 'W-BAL-KEY = ' W-BAL-CLT                                
                                   ' ' W-BAL-BR                                 
                                   ' ' W-BAL-ACCT                               
                MOVE +3999    TO ABEND-CODE                                     
                CALL ABEND USING ABEND-CODE                                     
             END-IF                                                             
           END-IF.                                                              
                                                                                
           ADD 1 TO W-GETVBAL-CNT                                               
                                                                                
           IF  CMBL-KEY NOT = W-BAL-KEY                                         
               DISPLAY '   '                                                    
                        'BAL NOTFND FOR '                                       
                                       W-BAL-CLT                                
                                   ' ' W-BAL-BR                                 
                                   ' ' W-BAL-ACCT                               
                                   ' ' W-BAL-REC-TYPE                           
                                   ' ' W-BAL-CUR                                
               DISPLAY '   '                                                    
                        'BAL NEXT REC =  '                                      
                                      CMBL-COMPANY-CODE                         
                                  ' ' CMBL-OFFICE-CODE                          
                                  ' ' CMBL-ACCOUNT-NUMBER                       
                                  ' ' CMBL-RECORD-TYPE                          
                                  ' ' CMBL-CURR-TYPE (4:3)                      
               GO TO 5000-EXIT                                                  
           ELSE                                                                 
               CONTINUE                                                         
           END-IF.                                                              
                                                                                
           MOVE 'Y' TO W-BAL-FND-SW                                             
                                                                                
           IF CMBL-ACTYP1-PRESENT = 1                                           
              MOVE CMBL1-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE1                
           END-IF.                                                              
           IF CMBL-ACTYP2-PRESENT = 1                                           
              MOVE CMBL2-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE2                
           END-IF.                                                              
           IF CMBL-ACTYP3-PRESENT = 1                                           
              MOVE CMBL3-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE3                
           END-IF.                                                              
           IF CMBL-ACTYP5-PRESENT = 1                                           
              MOVE CMBL5-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE5                
           END-IF.                                                              
           IF CMBL-TOTAL-SMA NOT = 0                                            
              MOVE CMBL-TOTAL-SMA                 TO W-BAL-SMA                  
           END-IF.                                                              
                                                                                
           IF  (W-BAL-TYPE1 NOT = ZERO)                                         
           OR  (W-BAL-TYPE2 NOT = ZERO)                                         
           OR  (W-BAL-TYPE3 NOT = ZERO)                                         
           OR  (W-BAL-TYPE5 NOT = ZERO)                                         
           OR  (W-BAL-SMA   NOT = ZERO)                                         
               MOVE 'Y' TO W-PTR-ASSET-FOUND-SW                                 
           END-IF                                                               
                                                                                
           MOVE CMBL-TOTAL-MARKET-VALUE   TO W-BAL-TOTAL-MARKET-VALUE           
           MOVE CMBL-TOTL-LIQDATNG-EQUITY TO W-BAL-TOTL-LIQDATNG-EQUITY         
           MOVE CMBL-PENDING-AMOUNT       TO W-BAL-PENDING-AMOUNT               
                                                                                
           MOVE W-BAL-TYPE1  TO W-BAL-TYPE1-DISPLAY                             
           MOVE W-BAL-TYPE2  TO W-BAL-TYPE2-DISPLAY                             
           MOVE W-BAL-TYPE3  TO W-BAL-TYPE3-DISPLAY                             
           MOVE W-BAL-TYPE5  TO W-BAL-TYPE5-DISPLAY                             
           MOVE W-BAL-SMA    TO W-BAL-SMA-DISPLAY                               
           DISPLAY          '   BAL ' CMBL-COMPANY-CODE                         
                                  ' ' CMBL-OFFICE-CODE                          
                                      CMBL-ACCOUNT-NUMBER                       
                                  ' ' CMBL-RECORD-TYPE                          
                                  ' ' CMBL-CURR-TYPE (4:3)                      
                               ' T1=' W-BAL-TYPE1-DISPLAY                       
                               ' T2=' W-BAL-TYPE2-DISPLAY                       
                               ' T3=' W-BAL-TYPE3-DISPLAY                       
                               ' T5=' W-BAL-TYPE5-DISPLAY                       
                              ' SMA=' W-BAL-SMA-DISPLAY                         
                                                                                
           IF  BH-ACAT-REJ-DEL-MARGIN-DEBIT > 0                                 
               IF  W-BAL-TYPE2 NOT < BH-ACAT-REJ-DEL-MARGIN-DEBIT               
                   MOVE 'Y' TO W-FLAG-MARGIN-DEBIT                              
                   MOVE 'Y' TO W-ASSET-FLAG-MARGIN-DEBIT                        
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF  BH-ACAT-REJ-DEL-TOTL-ACT-VAL > 0                                 
               IF  W-BAL-TOTL-LIQDATNG-EQUITY                                   
                                     NOT < BH-ACAT-REJ-DEL-TOTL-ACT-VAL         
                   MOVE 'Y' TO W-FLAG-TOTL-ACT-VAL                              
                   MOVE 'Y' TO W-ASSET-FLAG-TOTL-ACT-VAL                        
               END-IF                                                           
           END-IF                                                               
           .                                                                    
       5000-EXIT. EXIT.                                                         
      /                                                                         
       5100-GET-POSITIONS.                                                      
      *****************************************************************         
      *  GET POSITIONS                                                          
      *  SELECT ONLY TYPES 1(CASH), 2(MARGIN), 5(SHORT)                         
      *  BYPASS IRA, ANNUITY, SPAD, MONEY MARKET FUND SECURITIES.               
LRM032*  BYPASS OPEN ORDERS - CUSHOL DEFINED                                    
      *  BYPASS ZERO QTY RECORD                                                 
      *****************************************************************         
           MOVE '5100-GET-POSITIONS            ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                         TO W-POS-FND-SW                     
           MOVE LOW-VALUES             TO W-CUSHOL-KEY                          
           MOVE W-CURRENT-CLIENT(2:3)  TO W-CUSHOL-CLIENT                       
           MOVE WF-BRANCH-CD           TO W-CUSHOL-BRANCH                       
           MOVE WF-ACCT-CD             TO W-CUSHOL-ACCOUNT                      
           MOVE ZEROS                  TO W-CUSHOL-FRGN-CURR-CODE               
           MOVE W-CUSHOL-KEY           TO GETVHOL-KEY                           
           MOVE SPACES                 TO GETVHOL-RETURN-PARAMETERS.            
                                                                                
           MOVE 'N'                    TO GETVHOL-FILE.                         
                                                                                
      **---DO A SKIP SEQUENTIAL READ TO GET RECORDS FOR THAT ACCOUNT.           
           MOVE 'S'                    TO GETVHOL-FUNC.                         
           MOVE SPACES                 TO GETVHOL-PREV-KEY.                     
                                                                                
       5100-READ-POS-NEXT.                                                      
DJ0001     MOVE 'N' TO W-REMOVE-FRACTION-SW                                     
           MOVE ' ' TO W-ASSET-FLAGS                                            
      **---DO READNEXT FOR NEXT RECORD FOR THAT ACCOUNT.                        
                                                                                
           PERFORM 9600-CALL-GETVHOL THRU 9600-EXIT                             
                                                                                
           IF GETVHOL-END-OF-FILE                                               
                GO TO 5100-EXIT                                                 
           END-IF.                                                              
                                                                                
           IF NOT GETVHOL-SUCCESSFUL                                            
                DISPLAY 'CAT518: CUSHOLV VSAM FILE, READ ERROR'                 
                DISPLAY 'CAT518: GETVHOL-RETURN-CODE = '                        
                                GETVHOL-RETURN-CODE                             
                DISPLAY 'CAT518: GETVHOL-FILE-STATUS = '                        
                                  GETVHOL-FILE-STATUS                           
                MOVE +3999    TO ABEND-CODE                                     
                CALL ABEND USING ABEND-CODE                                     
           END-IF.                                                              
                                                                                
           ADD 1 TO W-GETVHOL-CNT                                               
                                                                                
      **---MOVE THE NEW RECORD FROM THE PARM AREA                               
LRM032     MOVE GETVHOL-NEW-RECORD   TO CUSHOL-RECORD.                          
                                                                                
           IF CUSHOL-KEY(1:11) NOT = W-CUSHOL-KEY(1:11)                         
              GO TO 5100-EXIT.                                                  
                                                                                
           IF CUSHOL-REC-TYPE = HIGH-VALUES                                     
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
                                                                                
      ** BYPASS OPEN ORDERS AND FLAG IT                                         
LRM032***  IF  CUSHOL-ACCOUNT-TYPE NOT NUMERIC                                  
LRM032     IF  CUSHOL-OPEN-ORDER                                                
           AND BH-ACAT-OPEN-ORDERS-ON-PTR = '1'                                 
               MOVE 'Y' TO W-FLAG-OPEN-ORDER                                    
               MOVE 'Y' TO W-ASSET-FLAG-OPEN-ORDER                              
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
                                                                                
      ** BYPASS NON-ZERO CURRENCY                                               
           IF CUSHOL-FRGN-CURR-CODE NOT = 000                                   
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
                                                                                
      ** SELECT ONLY TYPES 1,2,3,5                                              
           IF  (CUSHOL-ACCOUNT-TYPE = '1' OR '2' OR '3' OR '5')                 
                CONTINUE                                                        
           ELSE                                                                 
                GO TO 5100-READ-POS-NEXT                                        
           END-IF                                                               
                                                                                
      ** BYPASS THESE SECURITIES                                                
           MOVE CUSHOL-SECURITY-NO TO W-SEC-TO-BYPASS-FIELD                     
           IF  W-IRA-SECURITY                                                   
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
           IF  W-ANNUITY-SECURITY                                               
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
           IF  W-SPAD-SECURITY                                                  
               PERFORM 5110-CHECK-SPAD-POSITIONS THRU 5110-EXIT                 
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
                                                                                
      ** MAKE SURE QUANTITY IS GREATER THAN ZERO                                
           IF  (CUSHOL-CPH-TD-QTY NOT NUMERIC)                                  
                   OR                                                           
               (CUSHOL-CPH-TD-QTY = ZERO)                                       
                GO TO 5100-READ-POS-NEXT                                        
           END-IF                                                               
                                                                                
      ** MAKE SURE THE SECURITY IS ON THE MSD FILE                              
           PERFORM 5400-GETMSDC THRU 5400-EXIT                                  
           IF  GETMSD-RETURN-VALID                                              
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY '#BYPASS SEC=' CUSHOL-SECURITY-NO (1:7)                  
                       ' ' MS-DESC1                                             
                       ' GETMSD-RETURN-CODE='  GETMSD-RETURN-CODE               
               GO TO 5100-READ-POS-NEXT                                         
           END-IF.                                                              
                                                                                
           PERFORM 5440-ASSET-PRICING-CATEGORY THRU 5440-EXIT                   
                                                                                
ET0002** ADD MONEY MARKET FUNDS TO BALANCE TYPE 1                               
ET0002** BH-ACAT-LIQUIDATE-MMF (B1 434510) = '2' OR '3'                         
ET0002** LIQUIDATE IF IN PRIMARY REDEMPTION LIST                                
ET0002**                                                                        
DJ0005     IF  W-CURRENT-CLIENT (2:3) = GETNA-KEY-CLIENT                        
DJ0005     AND W-CUSHOL-BRANCH        = GETNA-KEY-BRANCH3-5                     
DJ0005     AND W-CUSHOL-ACCOUNT       = GETNA-KEY-ACCOUNT6-10                   
DJ0005         CONTINUE                                                         
DJ0005     ELSE                                                                 
ET0002         MOVE W-CURRENT-CLIENT (2:3) TO GETNA-KEY-CLIENT                  
ET0002         MOVE '00'             TO GETNA-KEY-BRANCH1-2                     
ET0002         MOVE  W-CUSHOL-BRANCH TO GETNA-KEY-BRANCH3-5                     
ET0002         MOVE '00000'          TO GETNA-KEY-ACCOUNT1-5                    
ET0002         MOVE  W-CUSHOL-ACCOUNT TO GETNA-KEY-ACCOUNT6-10                  
ET0002         CALL  GETNA        USING GETNA-SENDING-PARAMETERS                
ET0002                                  GETNA-SEGMENT-INCLUDES                  
ET0002         IF  GETNA-RETURN-FOUND                                           
ET0002             ADD 1 TO W-GETNA-FND-CNT                                     
ET0002         ELSE                                                             
ET0002             ADD 1 TO W-GETNA-NOTFND-CNT                                  
ET0002         END-IF                                                           
DJ0005     END-IF.                                                              
ET0002                                                                          
ET0002     IF GETNA-RETURN-FOUND                                                
           AND (BH-ACAT-MMF-ON-PTR = '1')                                       
ET0002     AND (BH-ACAT-LIQUIDATE-MMF = '2' OR '3')                             
ET0002        MOVE  SPACE             TO  W-MMF-FOUND                           
ET0002        PERFORM VARYING  TBL-SUB FROM 1 BY 1                              
ET0002                  UNTIL  TBL-SUB > W-MMF-TBL-CNT                          
LRM001                     OR  W-MMF-FOUND = 'Y' OR 'T'                         
LRM031           IF W-MMF-SWEEP-CD (TBL-SUB) = NAPPA-EXP-FUND-NBR-N             
ET0002              IF W-MMF-SEC (TBL-SUB) = CUSHOL-SECURITY-NO                 
ET0002                 MOVE 'Y' TO W-MMF-FOUND                                  
LRM001              ELSE                                                        
LRM016                 PERFORM VARYING TH-SUB FROM 1 BY 1                       
LRM016                    UNTIL TH-SUB > W-THRESHOLD-TBL-CNT (TBL-SUB)          
LRM016                      IF W-MMF-THRESHOLD-FUND (TBL-SUB, TH-SUB)           
LRM016                                    = CUSHOL-SECURITY-NO                  
LRM016                         MOVE 'T' TO W-MMF-FOUND                          
LRM016                      END-IF                                              
LRM016                 END-PERFORM                                              
ET0002              END-IF                                                      
ET0002           END-IF                                                         
ET0002        END-PERFORM                                                       
ET0002        IF W-MMF-FOUND = 'Y'                                              
ET0002           COMPUTE W-BAL-MMKT = W-BAL-MMKT                                
LRM032                              + CUSHOL-CPH-MKT-VAL                        
LRM032           MOVE CUSHOL-CPH-MKT-VAL TO W-AMT-DISPLAY                       
ET0002           DISPLAY '   PRIMARY MMKT FNDS FOUND   '                        
ET0002                     CUSHOL-SECURITY-NO (1:7) ' ' MS-DESC1                
ET0002                                              ' ' MS-DESC2                
LRM032                     ' AMT=' W-AMT-DISPLAY                                
ET0002           GO TO 5100-READ-POS-NEXT                                       
LRM001        ELSE                                                              
LRM001        IF W-MMF-FOUND = 'T'                                              
LRM001           COMPUTE W-BAL-MMKT = W-BAL-MMKT                                
LRM032                              + CUSHOL-CPH-MKT-VAL                        
LRM001           DISPLAY ' THRESHOLD FUND SLOT ' TBL-SUB                        
LRM001                 ' ' CUSHOL-SECURITY-NO (1:7)                             
LRM001                   ' AMT=' CUSHOL-CPH-MKT-VAL                             
LRM001                 ' ' MS-DESC1 ' ' MS-DESC2                                
LRM001           GO TO 5100-READ-POS-NEXT                                       
LRM001        END-IF                                                            
ET0002        END-IF                                                            
ET0002     END-IF.                                                              
ET0002                                                                          
ET0002** ADD MONEY MARKET FUNDS TO BALANCE TYPE 1                               
ET0002** BH-ACAT-LIQUIDATE-MMF (B1 434510) = '3'                                
ET0002** LIQUIDATE IF IN SECONDARY REDEMPTION LIST                              
ET0002**                                                                        
ET0002     IF BH-ACAT-LIQUIDATE-MMF = '3'                                       
           AND (BH-ACAT-MMF-ON-PTR = '1')                                       
ET0002        MOVE SPACE TO W-MMF-FOUND                                         
ET0002        PERFORM VARYING TBL-SUB FROM 1 BY 1                               
ET0002                        UNTIL  TBL-SUB > W-MMF-TBL-CNT                    
ET0002                           OR  W-MMF-FOUND > SPACE                        
ET0002           IF W-MMF-SEC (TBL-SUB) = CUSHOL-SECURITY-NO                    
ET0002               MOVE W-MMF-REDMPT-IND (TBL-SUB) TO W-MMF-FOUND             
ET0002           END-IF                                                         
ET0002        END-PERFORM                                                       
ET0002        IF W-MMF-FOUND = 'A' OR 'D'                                       
ET0002           PERFORM VARYING TBL-SUB FROM 1 BY 1                            
ET0002                        UNTIL  TBL-SUB > W-REDMPT-TBL-CNT                 
ET0002                           OR  W-MMF-FOUND = 'Y'                          
ET0002              IF W-REDMPT-SEC(TBL-SUB) = CUSHOL-SECURITY-NO               
ET0002                  MOVE 'Y' TO W-MMF-FOUND                                 
ET0002              END-IF                                                      
ET0002           END-PERFORM                                                    
ET0002        END-IF                                                            
ET0002        IF W-MMF-FOUND = 'Y'                                              
ET0002*******    MOVE CHLD-YESTERDAY-TOTAL-UNITS TO W-QTY-DISPLAY               
LRM032           MOVE CUSHOL-CPH-MKT-VAL         TO W-AMT-DISPLAY               
ET0002           DISPLAY '   SECONDARY MMKT FNDS FOUND '                        
ET0002                   CUSHOL-SECURITY-NO (1:7) ' ' MS-DESC1                  
ET0002                                              ' ' MS-DESC2                
LRM032                       ' AMT=' W-AMT-DISPLAY                              
ET0002           COMPUTE W-BAL-MMKT = W-BAL-MMKT +                              
ET0002*******                         CHLD-YESTERDAY-TOTAL-UNITS                
LRM032                                CUSHOL-CPH-MKT-VAL                        
ET0002           GO TO 5100-READ-POS-NEXT                                       
ET0002        END-IF                                                            
ET0002     END-IF.                                                              
                                                                                
DJ0010***IF SECURITY IS ON ACTRBSC TABLE,                                       
DJ0010***DELIVER MONEY MARKET FUND AS CASH                                      
DJ0010     PERFORM 5530-CHECK-ACTRBSC THRU 5530-EXIT                            
DJ0010     IF  W-ACTRBSC-FOUND                                                  
DJ0010******** MOVE CHLD-YESTERDAY-TOTAL-UNITS TO W-QTY-DISPLAY                 
LRM032         MOVE CUSHOL-CPH-MKT-VAL         TO W-AMT-DISPLAY                 
DJ0010         DISPLAY '   ACTRBSC MMF DLVR AS CASH '                           
DJ0010           CUSHOL-SECURITY-NO (1:7) ' ' MS-DESC1 ' ' MS-DESC2             
LRM032           ' AMT=' W-AMT-DISPLAY                                          
DJ0010         COMPUTE W-BAL-MMKT = W-BAL-MMKT +                                
DJ0010********                      CHLD-YESTERDAY-TOTAL-UNITS                  
LRM032                              CUSHOL-CPH-MKT-VAL                          
DJ0010         GO TO 5100-READ-POS-NEXT                                         
DJ0010     END-IF                                                               
                                                                                
      ** ADD MONEY MARKET FUNDS TO BALANCE TYPE 1                               
ET0002** BH-ACAT-LIQUIDATE-MMF (B1 434510) = '1'                                
LRM003** THE FOLLOWING 5 LINES ADDED TO CAUSE MMF FUNDS TO CREATE               
LRM003** ASSETS RATHER THAN BE SKIPPED FOR NEW B1 SETTINGS 2, 3.                
LRM003     IF (BH-ACAT-LIQUIDATE-MMF = '2' OR '3')                              
           AND (BH-ACAT-MMF-ON-PTR = '1')                                       
LRM003     AND ((WK-MS-CLASS-1-2 = '15' AND WK-MS-CLASS-7 = '6')                
LRM003       OR (WK-MS-CLASS-1-2 = '63' AND WK-MS-CLASS-7 = '6'))               
LRM003           DISPLAY 'CREATE ASSET FOR MMF ' CUSHOL-SECURITY-NO             
LRM003     ELSE                                                                 
                                                                                
DJ0007       IF W-MONEY-MARKET-SECURITY                                         
               IF (WK-MS-CLASS-1-2 = '15' AND WK-MS-CLASS-7 = '6')              
               OR (WK-MS-CLASS-1-2 = '63' AND WK-MS-CLASS-7 = '6')              
LRM032             MOVE CUSHOL-CPH-MKT-VAL TO W-AMT-DISPLAY                     
                   DISPLAY '   MONEY MARKET FOUND '                             
                               CUSHOL-SECURITY-NO (1:7) ' ' MS-DESC1            
                                                        ' ' MS-DESC2            
LRM032                             ' AMT=' W-AMT-DISPLAY                        
                   IF BH-ACAT-LIQUIDATE-MMF = '1'                               
                   AND (BH-ACAT-MMF-ON-PTR = '1')                               
                      COMPUTE W-BAL-MMKT = W-BAL-MMKT +                         
LRM032*********                            CHLD-YESTERDAY-TOTAL-UNITS           
LRM032                                     CUSHOL-CPH-MKT-VAL                   
                   END-IF                                                       
               END-IF                                                           
               GO TO 5100-READ-POS-NEXT                                         
DJ0007       END-IF                                                             
           END-IF.                                                              
                                                                                
           MOVE 'Y' TO W-POS-FND-SW.                                            
           MOVE 'Y' TO W-PTR-ASSET-FOUND-SW                                     
                                                                                
           MOVE ' '                      TO W-POS-DESC1                         
           MOVE ' '                      TO W-POS-DESC2                         
           MOVE ' '                      TO W-POS-DESC3                         
           MOVE ' '                      TO WK-POS-DESC4                        
           INITIALIZE                       WK-POS-DESC5                        
           MOVE ZEROS                    TO W-POS-MEMO-QTY-EXCLUDED             
LRM026                                      WORK-WHOLD-MEMO-QTY                 
           MOVE ' '                TO W-ASSET-CMNT-TXT                          
                                                                                
           MOVE CUSHOL-CPH-TD-QTY TO W-POS-QTY.                                 
                                                                                
                                                                                
           IF  CUSHOL-NO-DESC = 1                                               
               MOVE CUSHOL-CPH-SEC-DESC(1)             TO W-POS-DESC1           
           ELSE                                                                 
             IF  CUSHOL-NO-DESC = 2                                             
                 MOVE CUSHOL-CPH-SEC-DESC(1)           TO W-POS-DESC1           
                 MOVE CUSHOL-CPH-SEC-DESC(2)           TO W-POS-DESC2           
             ELSE                                                               
                 IF  CUSHOL-NO-DESC >= 3                                        
                     MOVE CUSHOL-CPH-SEC-DESC(1) TO W-POS-DESC1                 
                     MOVE CUSHOL-CPH-SEC-DESC(2) TO W-POS-DESC2                 
                     MOVE CUSHOL-CPH-SEC-DESC(3) TO W-POS-DESC3                 
                 END-IF                                                         
                 IF  CUSHOL-NO-DESC >           3                               
                     MOVE CUSHOL-CPH-SEC-DESC(4) TO WK-POS-DESC4                
                 END-IF                                                         
             END-IF                                                             
           END-IF.                                                              
                                                                                
           MOVE CUSHOL-SECURITY-NO TO WK-POS-DESC5-SEC                          
                                                                                
           ADD 1 TO W-POSITION-CNT                                              
                                                                                
           MOVE W-POS-QTY           TO WORK-POS-QTY                             
           MOVE WORK-POS-QTY        TO WORK-POS-QTY-SIGNED-INTEGER              
                                       WORK-POS-QTY-DECIMAL                     
           MOVE CUSHOL-CPH-MKT-VAL  TO WORK-POS-VALUE                           
                                                                                
           MOVE CUSHOL-CPH-TD-QTY TO W-QTY-DISPLAY                              
           DISPLAY           '   POS ' CUSHOL-CLIENT                            
                                   ' ' CUSHOL-BRANCH                            
                                   ' ' CUSHOL-ACCOUNT                           
                                   ' ' CUSHOL-FRGN-CURR-CODE                    
                                   ' ' CUSHOL-ACCOUNT-TYPE                      
                                   ' ' CUSHOL-SECURITY-NO (1:7)                 
                                ' REC-TYPE=' CUSHOL-REC-TYPE                    
                                   ' ' CUSHOL-CPH-SYMBOL    (1:8)               
                                   ' ' CUSHOL-CPH-CUSIP                         
                                   ' ' W-QTY-DISPLAY                            
                                   ' ' W-POS-DESC1                              
                                                                                
           IF  BH-ACAT-REJ-DEL-ASSET-VALUE  > 0                                 
               IF  WORK-POS-VALUE     NOT < BH-ACAT-REJ-DEL-ASSET-VALUE         
                   MOVE 'Y' TO W-FLAG-ASSET-VALUE                               
                   MOVE 'Y' TO W-ASSET-FLAG-ASSET-VALUE                         
               END-IF                                                           
           END-IF                                                               
                                                                                
      ***--WHEN-ISSUED SECURITY                                                 
           IF  CUSHOL-WI                                                        
               ADD 1 TO W-WHEN-ISSUE-CNT                                        
               PERFORM 5730-FORMAT-WHEN-ISSUE THRU 5730-EXIT                    
TEST           DISPLAY 'PERF 6000- AFTER 5730- AND IN 5100-'                    
               PERFORM 6000-CREATE-ACTIAST   THRU 6000-EXIT                     
               PERFORM 6300-RELEASE-ACATPTRF THRU 6300-EXIT                     
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
                                                                                
LRM020     MOVE 'N' TO W-MATURE-CALLED-BOND-SW.                                 
LRM020     IF  WK-MS-SEC-ID = 'B'                                               
LRM020     AND W-BOND-EXP-ACT NOT = '0'                                         
LRM020         PERFORM 5515-CHECK-BOND-MAT-RTN   THRU 5515-EXIT                 
LRM020     END-IF                                                               
                                                                                
LRM020     IF W-BOND-EXP-ACT = '1'                                              
LRM020     AND (W-MATURE-CALLED-BOND-SW  = 'Y')                                 
LRM020         DISPLAY 'CALLED/MATURE BOND BYPASSED '                           
LRM020                  CUSHOL-SECURITY-NO                                      
LRM020         GO TO 5100-READ-POS-NEXT                                         
LRM020     END-IF                                                               
                                                                                
      ***--RESTRICTED SECURITY                                                  
           PERFORM 5500-CHECK-RESTRICTED THRU 5500-EXIT                         
           PERFORM 5520-CHECK-SEC-BLOCK THRU 5520-EXIT                          
                                                                                
           IF (W-VRSTSEC-FND-SW  = 'Y' AND W-VRSTBRKR-ROW-CNT = 0)              
           OR (W-VRSTSEC-FND-SW  = 'Y' AND W-VRSTBRKR-FND-SW  = 'Y')            
           OR (W-VRSDBLK-SEC-FND-SW  = 'Y')                                     
LRM020     OR (W-MATURE-CALLED-BOND-SW  = 'Y')                                  
               ADD 1 TO W-RESTRICTED-CNT                                        
               PERFORM 5720-FORMAT-RESTRICTED THRU 5720-EXIT                    
TEST           DISPLAY 'PERF 6000- AFTER 5720-'                                 
               PERFORM 6000-CREATE-ACTIAST   THRU 6000-EXIT                     
               PERFORM 6300-RELEASE-ACATPTRF THRU 6300-EXIT                     
               IF BH-ACAT-REJ-PEND-DEL-NTS-IND = '1'                            
                  MOVE 'Y' TO W-ASSET-FLAG-NTS                                  
                  MOVE BH-ACAT-REJ-PEND-DEL-NTS-CODE                            
                    TO W-NTS-CODE                                               
                       W-ASSET-NTS-CODE                                         
               END-IF                                                           
LRM020         IF W-BOND-EXP-ACT = '3'                                          
LRM020         AND W-MATURE-CALLED-BOND-SW  = 'Y'                               
LRM020            PERFORM 7605-INSERT-ACTIAST-AUD   THRU 7605-EXIT              
LRM020         END-IF                                                           
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
                                                                                
      ***--FLAG IF PRIVATE RANGE                                                
           PERFORM 5510-CHECK-PRNGFL     THRU 5510-EXIT                         
                                                                                
      ***--REDUCE BY MEMO POSITION                                              
           MOVE  ZERO            TO WORK-WHOLD-MEMO-QTY                         
           PERFORM 5540-GET-MRGIMM-MEMO THRU 5540-EXIT                          
           MOVE W-POS-QTY TO WORK-POS-QTY-LEFT                                  
                                                                                
LRM019*** MAKE SURE MEMO QTY DOES NOT EXCEED THE POSITION                       
LRM019     IF  W-POS-MEMO-QTY-EXCLUDED > W-POS-QTY                              
LRM022     AND W-POS-MEMO-QTY-EXCLUDED > ZERO                                   
LRM022     AND W-POS-QTY > ZERO                                                 
LRM019         DISPLAY 'OVER MEMO REDUCE QTY FROM '                             
LRM019            W-POS-MEMO-QTY-EXCLUDED  ' TO ' W-POS-QTY                     
LRM019         MOVE W-POS-QTY TO W-POS-MEMO-QTY-EXCLUDED                        
LRM019     END-IF.                                                              
                                                                                
           IF  WORK-WHOLD-MEMO-QTY NOT = 0                                      
               PERFORM 5740-FORMAT-WHOLD-MEMO THRU 5740-EXIT                    
TEST           DISPLAY 'PERF 6000- AFTER 5740-'                                 
               PERFORM 6000-CREATE-ACTIAST   THRU 6000-EXIT                     
               PERFORM 6300-RELEASE-ACATPTRF THRU 6300-EXIT                     
               COMPUTE WORK-POS-QTY-LEFT =                                      
                                   W-POS-QTY - W-POS-MEMO-QTY-EXCLUDED          
               IF WORK-POS-QTY-LEFT <= 0                                        
                  GO TO 5100-READ-POS-NEXT                                      
               END-IF                                                           
           END-IF.                                                              
LRM026     MOVE  ZERO            TO WORK-WHOLD-MEMO-QTY                         
                                                                                
      ***--GET MUTUAL FUND INFORMATION                                          
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
LRM030     MOVE 'N'                    TO NTW-SHWB-ACCT-FLAG.                   
           SET NTW-NOT-NSCCSRC-ACCT      TO  TRUE.                              
           IF  BH-ACAT-MF-FUND-SERV-CLIENT = '1'                                
           AND (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                         
DJ0005         PERFORM 5105-CHECK-DIGIT THRU 5105-EXIT                          
               PERFORM 5910-MFMSD            THRU 5910-EXIT                     
               PERFORM 5920-BNWREGOP         THRU 5920-EXIT                     
               PERFORM 5930-GET-BNWMAST-INFO THRU 5930-EXIT                     
           END-IF                                                               
                                                                                
LRM024     IF  BH-ACAT-DELIVER-NTW-LVL4-FUND = '0'                              
LRM024     AND BH-ACAT-MF-FUND-SERV-CLIENT = '1'                                
LRM024     AND (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                         
LRM024         PERFORM 5940-FORMAT-MF-RTN  THRU 5940-EXIT                       
LRM024         IF  NTWRK-CNTL-CD  OF DCLACTIMF = '4'                            
LRM024             DISPLAY 'NTW LVL4 FOUND, CREATE MEMO'                        
LRM024             PERFORM 5740-FORMAT-WHOLD-MEMO    THRU 5740-EXIT             
LRM024             MOVE 'LEVEL 4 ASSET MUST BE DELIVERED BY THE FUND'           
LRM024                                        TO W-ASSET-CMNT-TXT               
TEST           DISPLAY 'PERF 6000- AFTER 5740-'                                 
LRM024             PERFORM 6000-CREATE-ACTIAST   THRU 6000-EXIT                 
LRM024             PERFORM 6300-RELEASE-ACATPTRF THRU 6300-EXIT                 
LRM024             MOVE ZERO TO WORK-POS-QTY-LEFT                               
LRM024             MOVE W-POS-QTY TO W-POS-MEMO-QTY-EXCLUDED                    
LRM024            GO TO 5100-READ-POS-NEXT                                      
LRM024         END-IF                                                           
LRM024     END-IF                                                               
                                                                                
      ***--IF THERE IS SAFEKEEPING MEMO, FORMAT AND LOAD ACTIAST.               
           IF  WORK-SFK-MEMO-QTY NOT = 0                                        
               IF  WORK-POS-QTY-LEFT < WORK-SFK-MEMO-QTY                        
                   MOVE WORK-POS-QTY-LEFT     TO W-QTY-DISPLAY                  
                   MOVE WORK-SFK-MEMO-QTY     TO W-QTY-DISPLAY-2                
                   DISPLAY '   WORK-POS-QTY-LEFT(' W-QTY-DISPLAY                
                           ' < WORK-SFK-MEMO-QTY(' W-QTY-DISPLAY-2   ')'        
                   ' USE WORK-POS-QTY-LEFT'                                     
                   MOVE WORK-POS-QTY-LEFT TO WORK-SFK-MEMO-QTY                  
               END-IF                                                           
               PERFORM 5750-FORMAT-SFK-MEMO  THRU 5750-EXIT                     
TEST           DISPLAY 'PERF 6000- AFTER 5750-'                                 
               PERFORM 6000-CREATE-ACTIAST   THRU 6000-EXIT                     
               PERFORM 6300-RELEASE-ACATPTRF THRU 6300-EXIT                     
           END-IF                                                               
                                                                                
      ***--SUBTRACT EXCLUDED-QUANTITY                                           
           COMPUTE WORK-POS-QTY = W-POS-QTY - W-POS-MEMO-QTY-EXCLUDED           
           MOVE WORK-POS-QTY        TO WORK-POS-QTY-SIGNED-INTEGER              
                                       WORK-POS-QTY-DECIMAL                     
                                                                                
           IF  W-POS-MEMO-QTY-EXCLUDED NOT = 0                                  
               MOVE W-POS-MEMO-QTY-EXCLUDED TO W-QTY-DISPLAY                    
               MOVE WORK-POS-QTY          TO W-QTY-DISPLAY-2                    
               DISPLAY '   '                                                    
                       'POS-MEMO-QTY-EXCLUDED= ' W-QTY-DISPLAY                  
                        ' WORK-POS-QTY AFTER = ' W-QTY-DISPLAY-2                
           END-IF                                                               
                                                                                
DJ0014     IF (WK-MS-CLASS-1   = 1 OR 7)                                        
DJ0014     OR (WK-MS-CLASS-1-2 = '65')                                          
DJ0014     OR (WK-MS-CLASS-1   = 4 AND WK-MS-CLASS-7 = 3)                       
DJ0014         MOVE 'Y' TO W-FRACTION-EQUITY-IND                                
DJ0014         IF (WK-MS-CLASS-1 = 4 AND WK-MS-CLASS-7 = 3)                     
DJ0014            DISPLAY '   MUNI-TAX-EXEMPT-UNITS: '                          
DJ0014                        CUSHOL-SECURITY-NO                                
DJ0014         END-IF                                                           
DJ0014     ELSE                                                                 
DJ0014         MOVE 'N' TO W-FRACTION-EQUITY-IND                                
DJ0014     END-IF                                                               
                                                                                
      ***--REMOVE FRACTION IF B1 IS ON, AND NOT MUTUAL FUND                     
           MOVE 'N' TO W-REMOVE-FRACTION-SW                                     
           IF  (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                         
           OR  (WORK-POS-QTY-DECIMAL = 0)                                       
               CONTINUE                                                         
           ELSE                                                                 
      *************************************************************             
      ******OLD-B1: BH-BTS2-ACAT-FRAC-QTY-DELV = '1'                            
      ******IF CNS AND NOT EQUITY, LEAVE THE FRACTION.                          
      ******IF CNS AND EQUITY, AND B1 IS OFF, LEAVE THE FRACTION.               
      ******IF CNS AND EQUITY, AND B1 IS ON, REMOVE THE FRACTION.               
DJ0014******IF CNS AND MUNI TAX EXEMPT UNITS AND B1 ON, REMOVE.                 
      ******ALL OTHERS, REMOVE THE FRACTION.                                    
      ******CNS EQUITY INCLUDES CLASS CODE 1(EQUITY) AND 7(UNITS).              
DJ0014******MUNI TAX EXEMPT UNITS CLASS CODE 1=4, CODE 7=3.                     
      *************************************************************             
DJ0014       IF  WK-CNS-IND = 'Y'                                               
DJ0014       AND W-FRACTION-EQUITY-IND NOT = 'Y'                                
                 CONTINUE                                                       
             ELSE                                                               
DJ0014         IF  WK-CNS-IND = 'Y'                                             
DJ0014         AND W-FRACTION-EQUITY-IND = 'Y'                                  
               AND (BH-ACAT-FRACT-ON-CNS-ELIG-SEC NOT = '1')                    
                   CONTINUE                                                     
               ELSE                                                             
                   MOVE 'Y' TO W-REMOVE-FRACTION-SW                             
                   MOVE WORK-POS-QTY-SIGNED-INTEGER  TO WORK-POS-QTY            
                   DISPLAY '   ' CUSHOL-SECURITY-NO (1:7)                       
                             ' ' CUSHOL-CPH-SYMBOL    (1:8)                     
                         ' CNS=' WK-CNS-IND                                     
                       ' CLASS=' WK-MS-CLASS-1-2                                
                        ' CTGY=' W-ASSET-PRC-CTGY-CD                            
                      ' FRAC= .' WORK-POS-QTY-DECIMAL                           
                    ' NEW-QTY= ' WORK-POS-QTY-SIGNED-INTEGER                    
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
           IF  WORK-POS-QTY      <  0                                           
           AND W-POS-QTY         >  0                                           
               MOVE W-POS-QTY             TO W-QTY-DISPLAY                      
               MOVE WORK-POS-QTY          TO W-QTY-DISPLAY-2                    
               DISPLAY '#BYPASS SEC=' CUSHOL-SECURITY-NO (1:7)                  
                      ' QTY < 0 AND ORIG-QTY > 0'                               
                      ' QTY=' W-QTY-DISPLAY-2                                   
                      ' ORG=' W-QTY-DISPLAY                                     
                    ' ' MS-DESC1                                                
           ELSE                                                                 
               IF  WORK-POS-QTY      > -.0001                                   
               AND WORK-POS-QTY      <  .0001                                   
                   MOVE WORK-POS-QTY          TO W-QTY-DISPLAY-2                
                   DISPLAY '#BYPASS SEC=' CUSHOL-SECURITY-NO (1:7)              
                          ' QTY < .0001'                                        
                          ' QTY=' W-QTY-DISPLAY-2                               
                        ' ' MS-DESC1                                            
               ELSE                                                             
                   PERFORM 5150-FORMAT-AND-LOAD-ASSET THRU 5150-EXIT            
               END-IF                                                           
           END-IF.                                                              
                                                                                
           GO TO 5100-READ-POS-NEXT.                                            
                                                                                
       5100-EXIT. EXIT.                                                         
      /                                                                         
       5105-CHECK-DIGIT.                                                        
                                                                                
DJ0005     IF  WF-BRANCH-ACCT         = W-CKDIGIT-BRN-ACCT                      
DJ0005     AND CUSHOL-ACCOUNT-TYPE    = W-CKDIGIT-TYPE                          
DJ0005         CONTINUE                                                         
DJ0005     ELSE                                                                 
DJ0005         MOVE WF-BRANCH-ACCT         TO W-CKDIGIT-BRN-ACCT                
DJ0005         MOVE CUSHOL-ACCOUNT-TYPE    TO W-CKDIGIT-TYPE                    
DJ0005         MOVE ' '            TO W-CKDIGIT-CK                              
DJ0005         CALL CKDIGIT USING W-CKDIGIT-ACCT-T                              
DJ0005                            W-CKDIGIT-LEN                                 
DJ0005                            W-CKDIGIT-CK                                  
DJ0005         ADD 1 TO W-CKDIGIT-CNT                                           
DJ0005     END-IF                                                               
DJ0005     IF  BH-MF-SINGLE-FUND-ACCOUNT = '1'                                  
DJ0005     AND (W-CKDIGIT-BRN-ACCT-1 NOT = W-CKDIGIT-BRN-ACCT)                  
DJ0005         MOVE W-CKDIGIT-ACCT-TC TO W-CKDIGIT-ACCT-TC-1                    
DJ0005         IF  W-CKDIGIT-TYPE = '1'                                         
DJ0005             CONTINUE                                                     
DJ0005         ELSE                                                             
DJ0005             MOVE '1'        TO W-CKDIGIT-TYPE-1                          
DJ0005             MOVE ' '        TO W-CKDIGIT-CK-1                            
DJ0005             CALL CKDIGIT USING W-CKDIGIT-ACCT-T-1                        
DJ0005                                W-CKDIGIT-LEN                             
DJ0005                                W-CKDIGIT-CK-1                            
DJ0005             ADD 1 TO W-CKDIGIT-CNT                                       
DJ0005             DISPLAY ' W-CKDIGIT-ACCT-TC=' W-CKDIGIT-ACCT-TC              
DJ0005                     ' W-CKDIGIT-ACCT-TC-1=' W-CKDIGIT-ACCT-TC-1          
DJ0005         END-IF                                                           
DJ0005     END-IF.                                                              
                                                                                
       5105-EXIT. EXIT.                                                         
      /                                                                         
       5110-CHECK-SPAD-POSITIONS.                                               
      *--- SPAD SECURITIES: '9997291' TO '9999999'                              
      *--- IF SPAD SECURITY MATCHES B1 434557, REJECT THE TRANSFER              
                                                                                
           DISPLAY '   WARNING: SPAD POSITION FOUND '                           
                       CUSHOL-SECURITY-NO                                       
           MOVE 'N' TO W-SPAD-FND-SW                                            
                                                                                
           IF  BH-ACAT-REJ-PEND-DEL-SPAD-NO > 0                                 
                                                                                
               PERFORM VARYING SUB1 FROM 1 BY 1 UNTIL                           
                   SUB1 > BH-ACAT-REJ-PEND-DEL-SPAD-NO                          
                   OR  W-SPAD-FND-SW = 'Y'                                      
                                                                                
                 IF CUSHOL-SECURITY-NO (4:4) =                                  
                                   BH-ACAT-REJ-PEND-DEL-SPAD (SUB1)             
                    MOVE BH-ACAT-REJ-PEND-DEL-CODE (SUB1)                       
                             TO W-SPAD-CODE                                     
                                W-ASSET-SPAD-CODE                               
                    MOVE 'Y' TO W-ASSET-FLAG-SPAD                               
                    MOVE 'Y' TO W-SPAD-FND-SW                                   
                       DISPLAY '   SPAD FOUND ON B1#434557 : '                  
                                   BH-ACAT-REJ-PEND-DEL-SPAD (SUB1)             
                               '-' BH-ACAT-REJ-PEND-DEL-CODE (SUB1)             
                    IF W-SPAD-CODE      > '00'                                  
                       DISPLAY '   TRANSFER WILL BE REJECTED WITH '             
                                  'REJ-CODE ' W-SPAD-CODE                       
LRM027                 PERFORM 5570-WRITE-ASCENDIS-EXCP THRU 5570-EXIT          
                    END-IF                                                      
                 END-IF                                                         
                                                                                
               END-PERFORM                                                      
                                                                                
           END-IF.                                                              
                                                                                
       5110-EXIT. EXIT.                                                         
      /                                                                         
LRM020 5515-CHECK-BOND-MAT-RTN   SECTION.                                       
TEST       DISPLAY 'WE ARE IN 5515- CALL/MAT LOOKUP'.                           
TEST*****  DISPLAY 'PRE-IND ' CHLD-CALL-PRE-IND                                 
    *****   ' PRE-DATE ' CHLD-CALL-PRE-CCYYMMDD                                 
    *****   ' CALC EXP ' WK-BOND-EXP-DATE                                       
                                                                                
LRM020***  IF CHLD-CALL-PRE-IND = 'C'                                           
LRM020***  AND CHLD-CALL-PRE-CCYYMMDD NUMERIC                                   
LRM020***  AND CHLD-CALL-PRE-CCYYMMDD > ZEROS                                   
LRM020***  AND CHLD-CALL-PRE-CCYYMMDD <=  WK-BOND-EXP-DATE                      
LRM020***      DISPLAY '   CALLED BOND: CUSIP=' WK-MS-CUSIP                     
LRM020***                                   ' ' WK-MS-SEC                       
LRM020***                     ' ' CHLD-CALL-PRE-CCYYMMDD                        
LRM020***                     ' CUTOFF ' WK-BOND-EXP-DATE                       
LRM020***      MOVE 'Y'               TO W-MATURE-CALLED-BOND-SW                
LRM020***      ADD 1 TO W-MATURE-FND-CNT                                        
LRM020***      GO TO 5515-EXIT                                                  
LRM020***  END-IF.                                                              
                                                                                
TEST       DISPLAY 'READING VBNDFTRV FOR FULLY CALLED ' WK-MS-SEC               
                                                                                
LRM021**** READ DB2 MSD...                                                      
LRM021     EXEC SQL SELECT                                                      
LRM021            RATE_BOND_DT                                                  
LRM021           ,TYPE_RATE_CD                                                  
LRM021         INTO                                                             
LRM021              :DCLVBNDFTRV.RATE-BOND-DT                                   
LRM021             ,:DCLVBNDFTRV.TYPE-RATE-CD                                   
LRM021         FROM VBNDFTRV                                                    
LRM021        WHERE SECURITY_ADP_NBR  = :WK-MS-SEC                              
LRM021          AND TYPE_RATE_CD      = 'FC'                                    
LRM021     END-EXEC                                                             
LRM021                                                                          
LRM021     IF (SQLCODE  =  +0 OR -811)                                          
LRM021       IF RATE-BOND-DT NOT > WK-MS-BOND-EXP-DATE-DB2                      
LRM021         ADD 1 TO W-VBNDFTRV-FND-CNT                                      
LRM021         DISPLAY 'FULLY CALLED BOND: CUSIP=' WK-MS-CUSIP                  
LRM021                                       ' ' WK-MS-SEC                      
LRM021                                  ' MSD=' RATE-BOND-DT                    
LRM021                        ' CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                
LRM021         MOVE 'Y'               TO W-MATURE-CALLED-BOND-SW                
LRM021         MOVE 'CALLED BOND'     TO W-ASSET-CMNT-TXT                       
LRM021         MOVE 'FC'              TO W-ASSET-CMNT-TXT (20 : 2)              
LRM021         MOVE RATE-BOND-DT      TO W-ASSET-CMNT-TXT (23 : 10)             
LRM021         ADD 1 TO W-MATURE-FND-CNT                                        
LRM021         GO TO 5515-EXIT                                                  
LRM021       ELSE                                                               
LRM021          DISPLAY 'BOND DATE ' RATE-BOND-DT                               
LRM021          ' NOT WITHIN CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                   
LRM021     ELSE                                                                 
LRM021         IF SQLCODE  <  +0                                                
LRM021            MOVE SQLCODE      TO W-DB2-SQLCODE                            
LRM021            DISPLAY ' VBNDFTRV ERROR: ' WF-CLIENT-NBR                     
LRM021                                     ' ' WK-MS-SEC                        
LRM021                    ' SQLCODE = ' W-DB2-SQLCODE                           
LRM021         END-IF                                                           
LRM021     END-IF.                                                              
                                                                                
TEST       DISPLAY 'READING VBNDFTRV FOR PRTL CALLED ' WK-MS-SEC                
                                                                                
LRM021     EXEC SQL SELECT                                                      
LRM021            RATE_BOND_DT                                                  
LRM021         INTO                                                             
LRM021              :DCLVBNDFTRV.RATE-BOND-DT                                   
LRM021         FROM VBNDFTRV                                                    
LRM021        WHERE SECURITY_ADP_NBR  = :WK-MS-SEC                              
LRM021          AND TYPE_RATE_CD      = 'PD'                                    
LRM021          AND FEATURE_FRQNC_CD  = 'AC'                                    
LRM021          AND RATE_BOND_DT      > :WK-TODAY-DB2                           
LRM021     END-EXEC                                                             
LRM021                                                                          
TEST       DISPLAY 'SQLCODE ' SQLCODE                                           
LRM021     IF (SQLCODE  =  +0 OR -811)                                          
LRM021       IF RATE-BOND-DT NOT > WK-MS-BOND-EXP-DATE-DB2                      
LRM021       AND RATE-BOND-DT > WK-TODAY-DB2                                    
LRM021         ADD 1 TO W-VBNDFTRV-FND-CNT                                      
LRM021         DISPLAY 'PRTL CALLED BOND: CUSIP=' WK-MS-CUSIP                   
LRM021                                       ' ' WK-MS-SEC                      
LRM021                                  ' MSD=' RATE-BOND-DT                    
LRM021                        ' CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                
LRM021         MOVE 'Y'               TO W-MATURE-CALLED-BOND-SW                
LRM021         MOVE 'CALLED BOND'     TO W-ASSET-CMNT-TXT                       
LRM021         MOVE 'PC'              TO W-ASSET-CMNT-TXT (20 : 2)              
LRM021         MOVE RATE-BOND-DT      TO W-ASSET-CMNT-TXT (23 : 10)             
LRM021         ADD 1 TO W-MATURE-FND-CNT                                        
LRM021         GO TO 5515-EXIT                                                  
LRM021       ELSE                                                               
LRM021         ADD 1 TO W-VBNDFTRV-NOTFND                                       
LRM021         MOVE 'N'               TO W-MATURE-CALLED-BOND-SW                
LRM021          DISPLAY 'BOND DATE ' RATE-BOND-DT                               
LRM021          ' NOT WITHIN CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                   
LRM021          ' AND GREATER THAN TODAY ' WK-TODAY-DB2                         
LRM021     ELSE                                                                 
LRM021         ADD 1 TO W-VBNDFTRV-NOTFND                                       
LRM021         MOVE 'N'               TO W-MATURE-CALLED-BOND-SW                
LRM021         IF SQLCODE  <  +0                                                
LRM021            MOVE SQLCODE      TO W-DB2-SQLCODE                            
LRM021            DISPLAY ' VBNDFTRV ERROR: ' WF-CLIENT-NBR                     
LRM021                                     ' ' WK-MS-SEC                        
LRM021                    ' SQLCODE = ' W-DB2-SQLCODE                           
LRM021         END-IF                                                           
LRM021     END-IF.                                                              
LRM021                                                                          
                                                                                
TEST       DISPLAY 'READING VBNDDT FOR ' WK-MS-SEC                              
                                                                                
LRM020**** READ DB2 MSD...                                                      
LRM020     EXEC SQL SELECT                                                      
LRM020            MATURITY_DT                                                   
LRM020         INTO                                                             
LRM020              :DCLVBNDDT.MATURITY-DT                                      
LRM020         FROM VBNDDT                                                      
LRM020        WHERE SECURITY_ADP_NBR  = :WK-MS-SEC                              
LRM020     END-EXEC                                                             
LRM020                                                                          
LRM020     IF  SQLCODE  =  +0                                                   
LRM020     AND MATURITY-DT NOT > WK-MS-BOND-EXP-DATE-DB2                        
LRM020         ADD 1 TO W-VBNDDT-FND-CNT                                        
LRM020         DISPLAY '   MATURED BOND: CUSIP=' WK-MS-CUSIP                    
LRM020                                       ' ' WK-MS-SEC                      
LRM020                                  ' MSD=' MATURITY-DT                     
LRM020                        ' CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                
LRM020         MOVE 'Y'               TO W-MATURE-CALLED-BOND-SW                
LRM020     ELSE                                                                 
LRM020         ADD 1 TO W-VBNDDT-NOTFND-CNT                                     
LRM020         MOVE 'N'               TO W-MATURE-CALLED-BOND-SW                
LRM020         IF SQLCODE  <  +0                                                
LRM020            MOVE SQLCODE      TO W-DB2-SQLCODE                            
LRM020            DISPLAY '   VBNDDT ERROR: ' WF-CLIENT-NBR                     
LRM020                                     ' ' WK-MS-SEC                        
LRM020                    ' SQLCODE = ' W-DB2-SQLCODE                           
LRM020         END-IF                                                           
LRM020     END-IF.                                                              
LRM020                                                                          
LRM020 5515-EXIT. EXIT.                                                         
      /                                                                         
       5150-FORMAT-AND-LOAD-ASSET.                                              
                                                                                
      **** FORMAT AND LOAD ASSET                                                
      **** IF OPTIONS, LOAD OPTION TABLE - ACTIOPN                              
      **** IF MUTUAL FUNDS, LOAD MUTUAL FUND TABLE - ACTIMF                     
                                                                                
           PERFORM 5700-FORMAT-ACTIAST       THRU 5700-EXIT                     
                                                                                
           IF  WK-MS-SEC-ID = 'O'                                               
               PERFORM 5800-FORMAT-OPT-RTN    THRU 5800-EXIT                    
           END-IF                                                               
                                                                                
TEST       DISPLAY 'PERF 6000- IN 5150-'                                        
           PERFORM 6000-CREATE-ACTIAST       THRU 6000-EXIT                     
                                                                                
           IF  WK-MS-SEC-ID = 'O'                                               
               PERFORM 6100-CREATE-ACTIOPN    THRU 6100-EXIT                    
           ELSE                                                                 
                                                                                
      ****---IF CLIENT IS A FUND/SERV CLIENT                                    
      ****---AND ASSET IS A MUTUAL FUND BASED ON MSD                            
      ****---LOOK UP FUND ELIGIBILITY ON MFMSD FILE                             
      ****---LOOK UP ON MF NETWORKING TABLE IF IT IS A LEGG MASON FUND          
                  IF  BH-ACAT-MF-FUND-SERV-CLIENT = '1'                         
                  AND (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                  
                                                                                
      ****---FUND MUST BE FUND/SERV ELIGIBLE                                    
      ****---BYPASS LEGG-MASON PROPRIETARY FUNDS                                
                      IF  (W-LEGG-MASON-FUND-SW NOT = 'Y')                      
                      AND  W-FUND-SERV-ELIGIBLE-SW = 'Y'                        
                           PERFORM 5940-FORMAT-MF-RTN  THRU 5940-EXIT           
                           PERFORM 6200-CREATE-ACTIMF THRU 6200-EXIT            
                      END-IF                                                    
                  END-IF                                                        
           END-IF.                                                              
                                                                                
           PERFORM 6300-RELEASE-ACATPTRF THRU 6300-EXIT.                        
                                                                                
       5150-EXIT. EXIT.                                                         
      /                                                                         
       5300-LOAD-BALANCES.                                                      
           MOVE '5300-LOAD-BALANCES            ' TO W-ROUTINE-1.                
                                                                                
           COMPUTE W-WORK-BAL =  W-BAL-TYPE1 - W-BAL-MMKT                       
           MOVE  ZERO            TO WORK-WHOLD-MEMO-QTY                         
                                                                                
      **<< B1=434675 - CASH BALANCE ADJUST BY PENDING AMT >>                    
           IF BH-ACAT-BALANCE-ADJUSTMENT = '1'                                  
              IF W-BAL-PENDING-AMOUNT NOT = ZERO                                
                 ADD W-BAL-PENDING-AMOUNT TO W-WORK-BAL                         
                 MOVE W-BAL-PENDING-AMOUNT TO W-AMT-DISPLAY                     
                 DISPLAY '   *CASH BALANCE ADJUSTED BY PENDING AMOUNT '         
                             W-AMT-DISPLAY                                      
              END-IF                                                            
           END-IF                                                               
                                                                                
           MOVE W-WORK-BAL               TO W-WORK-BAL-UNSIGN                   
           IF  W-WORK-BAL-UNSIGN NOT = 0                                        
               MOVE 'C'                  TO W-CSH-MGN-SHT                       
               MOVE 'CASH'               TO W-CASH-SMA                          
               PERFORM 5600-FORMAT-BALANCES THRU 5600-EXIT                      
TEST           DISPLAY 'PERF 6000- AFTER 5600- BAL 1'                           
               PERFORM 6000-CREATE-ACTIAST THRU 6000-EXIT                       
               PERFORM 6300-RELEASE-ACATPTRF THRU 6300-EXIT                     
               MOVE 'Y' TO W-PTR-ASSET-FOUND-SW                                 
           END-IF                                                               
                                                                                
           COMPUTE W-WORK-BAL =  W-BAL-TYPE2                                    
           MOVE W-WORK-BAL               TO W-WORK-BAL-UNSIGN                   
           IF  W-WORK-BAL-UNSIGN NOT = 0                                        
               MOVE 'M'                  TO W-CSH-MGN-SHT                       
               MOVE 'CASH'               TO W-CASH-SMA                          
               PERFORM 5600-FORMAT-BALANCES THRU 5600-EXIT                      
TEST           DISPLAY 'PERF 6000- AFTER 5600-'                                 
               PERFORM 6000-CREATE-ACTIAST THRU 6000-EXIT                       
               PERFORM 6300-RELEASE-ACATPTRF THRU 6300-EXIT                     
               MOVE 'Y' TO W-PTR-ASSET-FOUND-SW                                 
           END-IF                                                               
                                                                                
           COMPUTE W-WORK-BAL =  W-BAL-TYPE5                                    
           MOVE W-WORK-BAL               TO W-WORK-BAL-UNSIGN                   
           IF  W-WORK-BAL-UNSIGN NOT = 0                                        
               MOVE 'S'                  TO W-CSH-MGN-SHT                       
               MOVE 'CASH'               TO W-CASH-SMA                          
               PERFORM 5600-FORMAT-BALANCES THRU 5600-EXIT                      
               PERFORM 6000-CREATE-ACTIAST THRU 6000-EXIT                       
               PERFORM 6300-RELEASE-ACATPTRF THRU 6300-EXIT                     
               MOVE 'Y' TO W-PTR-ASSET-FOUND-SW                                 
           END-IF                                                               
                                                                                
           COMPUTE W-WORK-BAL =  W-BAL-SMA                                      
           MOVE W-WORK-BAL               TO W-WORK-BAL-UNSIGN                   
           IF  W-WORK-BAL-UNSIGN NOT = 0                                        
               MOVE 'M'                  TO W-CSH-MGN-SHT                       
               MOVE 'SMA '               TO W-CASH-SMA                          
               PERFORM 5600-FORMAT-BALANCES THRU 5600-EXIT                      
TEST           DISPLAY 'PERF 6000- AFTER 5600- BAL SMA'                         
               PERFORM 6000-CREATE-ACTIAST THRU 6000-EXIT                       
               PERFORM 6300-RELEASE-ACATPTRF THRU 6300-EXIT                     
               MOVE 'Y' TO W-PTR-ASSET-FOUND-SW                                 
           END-IF.                                                              
                                                                                
       5300-EXIT. EXIT.                                                         
      /                                                                         
       5400-GETMSDC.                                                            
           MOVE '5400-GETMSDC                  ' TO W-ROUTINE-1.                
                                                                                
           MOVE CUSHOL-SECURITY-NO       TO WK-MS-SEC                           
           MOVE 'S'                      TO WK-MS-SEC-ID                        
           MOVE ZERO                     TO MS-CLOSING-PRICE                    
                                            WK-MS-CLOSING-PRICE                 
                                            WK-MS-OPT-MMY                       
                                            WK-MS-OPT-PRC                       
                                            WK-MS-OPT-FRAC                      
                                            WK-MS-CLASS                         
                                            WK-MS-OPTION-FACTOR                 
           MOVE 0                        TO WK-MS-ASSET-TYPE                    
           MOVE 'N'                      TO WK-CNS-IND                          
           MOVE 'N'                      TO WK-DTC-IND                          
           MOVE SPACES                   TO WK-MS-BOND-IND                      
                                            WK-MS-CUSIP                         
LRM028                                      WK-MS-ISIN                          
                                            WK-MS-SYMBOL-9                      
                                            WK-MS-DESC1                         
                                            WK-MS-DESC2                         
                                            WK-MS-DESC3                         
                                            WK-MS-SYMBOL                        
                                            WK-MS-XREF-NO                       
                                            WK-MS-WI-CODE                       
                                            WK-MS-BOND-REG-CODE                 
           MOVE 'D'                      TO GETMSD-DEVICE-IND.                  
           MOVE 'R'                      TO GETMSD-ACCESS-IND.                  
           MOVE 'E'                      TO GETMSD-FORMAT-IND.                  
           MOVE SPACE                    TO GETMSD-RETURN-CODE.                 
DJ0008     MOVE LOW-VALUES               TO GETMSD-SEARCH-KEY-AREA              
DJ0008     MOVE W-CURRENT-CLIENT-N       TO GETMSD-CLIENT-PL2                   
           MOVE CUSHOL-SECURITY-NO       TO GETMSD-SEARCH-KEY.                  
LRM032     IF CUSHOL-WI                                                         
              MOVE '1'                   TO GETMSD-WI-CODE                      
LRM032     ELSE                                                                 
              MOVE '0'                   TO GETMSD-WI-CODE                      
LRM032     END-IF.                                                              
                                                                                
           CALL GETMSDC               USING MASTER-SECURITY-RECORD.             
                                                                                
           IF  GETMSD-RETURN-VALID                                              
               CONTINUE                                                         
           ELSE                                                                 
               GO TO 5400-EXIT                                                  
           END-IF.                                                              
                                                                                
           MOVE MS-CUSIP-NO              TO WK-MS-CUSIP                         
LRM028     MOVE MSD-ISIN                 TO WK-MS-ISIN                          
           MOVE MS-SYMBOL                TO WK-MS-SYMBOL-9                      
           MOVE MS-DESC1                 TO WK-MS-DESC1                         
           MOVE MS-DESC2                 TO WK-MS-DESC2                         
           IF  MS-DESC2 > ' '                                                   
               MOVE MS-DESC2             TO WK-MS-DESC2                         
           END-IF                                                               
           IF  MS-DESC3 > ' '                                                   
               MOVE MS-DESC3             TO WK-MS-DESC3                         
           END-IF                                                               
           MOVE MS-FORMAT-IND            TO WK-MS-CLASS-1                       
           MOVE MS-SECURITY-TYPE         TO WK-MS-SEC-TYPE-X                    
           MOVE WK-MS-SEC-TYPE-P         TO WK-MS-SEC-TYPE-N                    
           MOVE WK-MS-SEC-TYPE           TO WK-MS-CLASS-2-5                     
           MOVE MS-SECURITY-TYPE-2       TO WK-MS-CLASS-6-7                     
                                                                                
DJ0007     EVALUATE TRUE                                                        
DJ0007       WHEN MS-MULTIPLY-PRICE-BY-1                                        
DJ0007            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 1            
DJ0007       WHEN MS-MULTIPLY-PRICE-BY-10                                       
DJ0007            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 10           
DJ0007       WHEN MS-MULTIPLY-PRICE-BY-100                                      
DJ0007            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 100          
DJ0007       WHEN MS-MULTIPLY-PRICE-BY-1000                                     
DJ0007            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 1000         
DJ0007       WHEN MS-MULTIPLY-PRICE-BY-10000                                    
DJ0007            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0007                                      MS-CLOSING-PRICE * 10000            
DJ0007       WHEN MS-MULTIPLY-PRICE-BY-100000                                   
DJ0007            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0007                                      MS-CLOSING-PRICE * 100000           
DJ0007       WHEN MS-MULTIPLY-PRICE-BY-1000000                                  
DJ0007            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0007                                      MS-CLOSING-PRICE * 1000000          
DJ0007       WHEN MS-MULTIPLY-PRICE-BY-10000000                                 
DJ0007            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0007                                      MS-CLOSING-PRICE * 10000000         
DJ0007       WHEN OTHER                                                         
                  MOVE MS-CLOSING-PRICE  TO WK-MS-CLOSING-PRICE                 
DJ0007     END-EVALUATE.                                                        
                                                                                
           MOVE MS-XREF-NO               TO WK-MS-XREF-NO                       
           MOVE MS-WI-CODE               TO WK-MS-WI-CODE                       
           MOVE MS-BOND-REG-CODE         TO WK-MS-BOND-REG-CODE                 
                                                                                
           EVALUATE WK-MS-CLASS (1:1)                                           
               WHEN '1'                                                         
                     IF (WK-MS-CLASS (5:1) = '5' OR '6')                        
                         MOVE  'Y'       TO WK-CNS-IND                          
                     END-IF                                                     
               WHEN '2'                                                         
                     IF (WK-MS-CLASS (5:1) = '2' OR '5' OR '6')                 
                         MOVE  'Y'       TO WK-CNS-IND                          
                     END-IF                                                     
               WHEN '3'                                                         
                     IF  (WK-MS-CLASS (5:1) = '2' OR '6')                       
                         MOVE  'Y'       TO WK-CNS-IND                          
                     END-IF                                                     
               WHEN '4'                                                         
                     IF  WK-MS-CLASS (5:1) = '6'                                
                         MOVE  'Y'       TO WK-CNS-IND                          
                     END-IF                                                     
               WHEN '6'                                                         
                     IF  WK-MS-CLASS (2:1) = '6'                                
                         CONTINUE                                               
                     ELSE                                                       
                       IF  (WK-MS-CLASS (5:1) = '5' OR '6')                     
                           MOVE  'Y'     TO WK-CNS-IND                          
                       END-IF                                                   
                     END-IF                                                     
               WHEN '7'                                                         
                     IF  WK-MS-CLASS (5:1) = '6'                                
                         MOVE  'Y'       TO WK-CNS-IND                          
                     END-IF                                                     
               WHEN OTHER                                                       
                    CONTINUE                                                    
           END-EVALUATE                                                         
                                                                                
           IF  (WK-MS-SEC-1 = '8' OR '9')                                       
                   AND                                                          
               (WK-MS-CLASS-1-2-3 = '664' OR '665')                             
               PERFORM 5410-GETMSDC-OPTION-RTN THRU 5410-EXIT                   
               IF  WK-MS-SYMBOL = SPACES OR LOW-VALUES                          
                   MOVE SPACES           TO WK-MS-SYMBOL-9                      
                   DISPLAY 'OPTION '  CUSHOL-SECURITY-NO (1:7)                  
                          ' SYMBOL IS BLANK.'                                   
                          ' DESC = ' WK-MS-DESC1                                
                   PERFORM 5415-GETMSD-OPT-SYMBOL THRU 5415-EXIT                
LRM016****     ELSE                                                             
LRM015*** PARA 5420- IS SUNSET FOR OPTION SYMOBOLGY CHANGE, OPRA CODE           
LRM015***  IS NOT LONGER AVAILABLE.                                             
LRM016****         IF L-STREAM-IND NOT = 'Q'                                    
      ****            PERFORM 5420-SCAN-FOR-OPT-SYM THRU 5420-EXIT              
LRM015****         END-IF                                                       
               END-IF                                                           
           ELSE                                                                 
               PERFORM 5430-GETMSDC-UNITS-RTN THRU 5430-EXIT                    
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS (4:1) = '2' OR '3' OR '4'                            
                                OR '5' OR '6' OR '7')                           
               MOVE  'Y'       TO WK-DTC-IND                                    
           END-IF.                                                              
                                                                                
       5400-EXIT. EXIT.                                                         
      /                                                                         
       5410-GETMSDC-OPTION-RTN.                                                 
                                                                                
           MOVE 'O'                      TO WK-MS-SEC-ID                        
           MOVE ' '                      TO WK-MS-BOND-IND                      
                                                                                
           EVALUATE TRUE                                                        
               WHEN WK-MS-CLASS-5 = 5                                           
                   MOVE '3'              TO WK-MS-ASSET-TYPE                    
               WHEN (WK-MS-CLASS-6 = 0 OR 4)                                    
                   MOVE '1'              TO WK-MS-ASSET-TYPE                    
               WHEN OTHER                                                       
                   MOVE '2'              TO WK-MS-ASSET-TYPE                    
           END-EVALUATE                                                         
                                                                                
           MOVE MS-OPTION-EXP-DATE       TO WK-MS-EXP-DATE                      
           MOVE WK-MS-EXP-MM             TO WK-MS-OPT-MM                        
           MOVE WK-MS-EXP-Y              TO WK-MS-OPT-Y                         
           MOVE MS-EXP-OPTION-STRIKE-PRICE TO WK-MS-OPT-PRICE                   
LRM015     IF MS-EXP-OPT-STRIKE-PRC NOT = ZEROS                                 
LRM015        MOVE MS-EXP-OPT-STRIKE-PRC TO WK-MS-OPT-PRICE-NEW                 
LRM015     ELSE                                                                 
LRM015        DISPLAY 'EXPANDED OPT STRIKE ZEROS, FORCING OLD PRC '             
LRM015          'WAS ' WK-MS-OPT-PRICE ' ' MS-ADP-NO                            
LRM015        MOVE WK-MS-OPT-PRC   TO WK-MS-OPT-PRC-NEW                         
LRM015        DIVIDE WK-MS-OPT-FRAC BY 100                                      
LRM015                    GIVING WK-MS-OPT-FRAC-NEW                             
LRM015     END-IF.                                                              
LRM034*****MOVE MS-OPTION-FACTOR           TO WK-MS-OPTION-FACTOR               
LRM034     MOVE MSD-OPTION-FACTOR-N        TO WK-MS-OPTION-FACTOR               
                                                                                
LRM016**** IF L-STREAM-IND NOT = 'Q'                                            
      ****    IF  WK-MS-OPT-FRAC = ZERO                                         
      ****        MOVE ZERO                 TO WK-MS-OPT-FRAC-1                 
      ****                                     WK-MS-OPT-DECI-ROUNDED           
      ****    ELSE                                                              
      ****    IF MSD-FRACTION-DECIMAL-IND = 'D'                                 
      ****       COMPUTE WK-MS-OPT-DECI-ROUNDED = WK-MS-OPT-FRAC / 1000         
      ****       END-COMPUTE                                                    
      ****       DISPLAY 'USING DECIMAL STRIKE PRICE FOR '                      
      ****        WK-MS-SEC ' ' WK-MS-OPT-DECI-ROUNDED                          
      ****    ELSE                                                              
      ****       COMPUTE WK-MS-OPT-FRAC-6 = WK-MS-OPT-FRAC * 8                  
      ****       END-COMPUTE                                                    
      ****    END-IF                                                            
      **** END-IF.                                                              
LRM016**** IF L-STREAM-IND = 'Q'                                                
LRM015        MOVE MSD-OCC-OPTN-SYM-ID TO WK-MS-SYMBOL.                         
LRM015**** END-IF.                                                              
                                                                                
       5410-EXIT. EXIT.                                                         
      /                                                                         
       5415-GETMSD-OPT-SYMBOL.                                                  
                                                                                
           MOVE 'D'                      TO GETMSD-DEVICE-IND.                  
           MOVE 'R'                      TO GETMSD-ACCESS-IND.                  
           MOVE 'E'                      TO GETMSD-FORMAT-IND.                  
           MOVE SPACE                    TO GETMSD-RETURN-CODE.                 
DJ0008     MOVE LOW-VALUES               TO GETMSD-SEARCH-KEY-AREA              
DJ0008     MOVE W-CURRENT-CLIENT-N       TO GETMSD-CLIENT-PL2                   
           MOVE WK-MS-XREF-NO            TO GETMSD-SEARCH-KEY.                  
           MOVE '0'                      TO GETMSD-WI-CODE                      
                                                                                
           CALL GETMSDC               USING MASTER-SECURITY-RECORD.             
                                                                                
           IF  GETMSD-RETURN-VALID                                              
               MOVE MS-SYMBOL-AREA       TO WK-MS-SYMBOL-9                      
                   DISPLAY 'OPTION '  CUSHOL-SECURITY-NO (1:7)                  
                          ' UNDERLYING SECURITY = ' WK-MS-XREF-NO               
                          ' FOUND SYMBOL = ' WK-MS-SYMBOL-9                     
           ELSE                                                                 
               MOVE ' '                  TO WK-MS-SYMBOL-9                      
                   DISPLAY 'OPTION '  CUSHOL-SECURITY-NO (1:7)                  
                          ' UNDERLYING SECURITY = ' WK-MS-XREF-NO               
                          ' SYMBOL NOT FOUND '                                  
           END-IF.                                                              
                                                                                
       5415-EXIT. EXIT.                                                         
      /                                                                         
       5420-SCAN-FOR-OPT-SYM.                                                   
                                                                                
           MOVE WK-MS-SYMBOL-9           TO OPT-WORK1                           
           MOVE    12                    TO SUB2                                
           PERFORM UNTIL NOT (OPT-WORK3 (SUB2) = SPACES)                        
               SUBTRACT 1              FROM SUB2                                
           END-PERFORM                                                          
                                                                                
           IF  OPT-WORK3 (SUB2) IS NUMERIC                                      
               SUBTRACT 1 FROM SUB2                                             
               PERFORM UNTIL NOT (OPT-WORK3 (SUB2) IS NUMERIC)                  
                       SUBTRACT 1 FROM SUB2                                     
               END-PERFORM                                                      
               SUBTRACT 1 FROM SUB2                                             
           ELSE                                                                 
               SUBTRACT 2              FROM SUB2                                
           END-IF                                                               
                                                                                
           MOVE SPACES                   TO OPTION-SYMBOL1 (1)                  
                                            OPTION-SYMBOL1 (2)                  
                                            OPTION-SYMBOL1 (3)                  
                                                                                
           MOVE 3                        TO SUB3                                
           PERFORM UNTIL SUB2 = 1                                               
               MOVE  OPT-WORK3 (SUB2)    TO OPTION-SYMBOL1 (SUB3)               
               SUBTRACT 1              FROM SUB2                                
                                            SUB3                                
               END-SUBTRACT                                                     
           END-PERFORM                                                          
                                                                                
           MOVE 1                        TO SUB2                                
                                            SUB3                                
           MOVE SPACES                   TO OPT-SYMBOL                          
           PERFORM UNTIL SUB3 > 3                                               
               IF  OPTION-SYMBOL1 (SUB3) = SPACES                               
                   ADD  1                TO SUB3                                
               ELSE                                                             
                   MOVE  OPTION-SYMBOL1 (SUB3) TO                               
                         OPTION-SYMBOL  (SUB2)                                  
                   ADD  1                TO SUB3                                
                                            SUB2                                
                   END-ADD                                                      
               END-IF                                                           
           END-PERFORM                                                          
                                                                                
           MOVE OPT-SYMBOL               TO WK-MS-SYMBOL-9.                     
                                                                                
       5420-EXIT. EXIT.                                                         
      /                                                                         
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
      *                   UNITS (TREATED AS STOCK)                  *           
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
       5430-GETMSDC-UNITS-RTN.                                                  
                                                                                
           EVALUATE TRUE                                                        
               WHEN ((WK-MS-SEC-1 = '4')                                        
                 OR                                                             
               (WK-MS-SEC > '1999999' AND < '2200000'))                         
                   MOVE 'S'            TO WK-MS-SEC-ID                          
                   MOVE '0'            TO WK-MS-ASSET-TYPE                      
                   MOVE ' '            TO WK-MS-BOND-IND                        
                   IF WK-MS-WI-CODE  = '1'                                      
                       MOVE 'W'        TO WK-MS-BOND-IND                        
                   ELSE                                                         
                       IF WF-TRANS-TYPE-CD    NOT = 'A'                         
                           MOVE 'G'    TO WK-MS-BOND-IND                        
                       END-IF                                                   
                   END-IF                                                       
                                                                                
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
      *                   STOCK                                     *           
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
                                                                                
               WHEN (WK-MS-SEC-1 < '0')                                         
                   MOVE 'S'            TO WK-MS-SEC-ID                          
                   MOVE '0'            TO WK-MS-ASSET-TYPE                      
                   MOVE ' '            TO WK-MS-BOND-IND                        
                   IF WK-MS-WI-CODE  = '1'                                      
                       MOVE 'W'        TO WK-MS-BOND-IND                        
                   ELSE                                                         
                       IF WF-TRANS-TYPE-CD    NOT = 'A'                         
                           MOVE 'G'        TO WK-MS-BOND-IND                    
                       END-IF                                                   
                   END-IF                                                       
                                                                                
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
      *                   BOND                                      *           
      * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *           
                                                                                
               WHEN   WK-MS-SEC-1 = ('0' OR '1' OR '2' OR '3'                   
                   OR '5' OR '6' OR '7')                                        
                   MOVE 'B'              TO WK-MS-SEC-ID                        
                   MOVE '0'              TO WK-MS-ASSET-TYPE                    
                   MOVE ' '              TO WK-MS-BOND-IND                      
                   PERFORM 5431-GETMSDC-FOR-BOND THRU 5431-EXIT                 
               WHEN OTHER                                                       
                   PERFORM 5431-GETMSDC-FOR-BOND THRU 5431-EXIT                 
           END-EVALUATE.                                                        
       5430-EXIT. EXIT.                                                         
      /                                                                         
       5431-GETMSDC-FOR-BOND.                                                   
                                                                                
           EVALUATE TRUE                                                        
               WHEN ((WK-MS-WI-CODE  = '1') AND                                 
                   (WF-TRANS-TYPE-CD    = 'A'))                                 
                   MOVE 'W'          TO WK-MS-BOND-IND                          
               WHEN WF-TRANS-TYPE-CD    = 'A'                                   
                   IF WK-MS-BOND-REG-CODE = '1'                                 
                       MOVE 'B'      TO WK-MS-BOND-IND                          
                   END-IF                                                       
               WHEN WF-TRANS-TYPE-CD    NOT = 'A'                               
                   IF (WK-MS-BOND-REG-CODE = '2' OR '4' OR '6')                 
                       MOVE 'R'      TO WK-MS-BOND-IND                          
                   ELSE                                                         
                       MOVE 'G'      TO WK-MS-BOND-IND                          
                   END-IF                                                       
               WHEN OTHER                                                       
                   CONTINUE                                                     
           END-EVALUATE.                                                        
                                                                                
       5431-EXIT. EXIT.                                                         
      /                                                                         
       5440-ASSET-PRICING-CATEGORY.                                             
           MOVE '5440-ASSET-PRICING-CATEGORY   ' TO W-ROUTINE-1.                
      *****************************************************************         
      * ASSET PRICING CATEGORY - BASED ON MSD CLASS CODE              *         
      *---------------------------------------------------------------*         
      * CATEGORY                            MSD CLASS CODE            *         
      * ----------------------------------  --------------            *         
      * ANNU - ANNUITY                      6XXXXX7; 6XXXXX8          *         
      * CDCP - CD & COMMERCIAL PAPER        27XXXX5; 27XXXX6;         *         
      *                                     27XXXX7; 27XXXX9;         *         
      * CORP - CORPORATE BOND               POS 1 = 2 (EXCLUDE 2XX21X;*         
      *                                     2XX71X; 29XX1X; 2XXX701;  *         
      *                                     2XX702; 2XX703            *         
      *                                                               *         
      * EQU  - EQUITIES                     1XXXXXX; 65XXXXX          *         
      * FCUR - FOREIGN CURRENCY             -------                   *         
      * FDEB - FOREIGN DEBT                 2XXXXXX; 3XXXXXX; 4XXXXXX;*         
      *                                     7XXXXXX; AND FIRST THREE  *         
      *                                     CHARACTERS OF DESCRIPTION *         
      *                                     EQUAL TO '***'            *         
      * FEQU - FOREIGN EQUITY               1XXXXXX; AND FIRST THREE  *         
      *                                     CHARACTERS OF DESCRIPTION *         
      *                                     EQUAL TO '***'            *         
      * GOVT - US GOVT & GOVT AGENCY        3XXX211; 3XXX711; 2XXX210;*         
      *                                     2XXX710                   *         
      * LPAR - LIMITED PARTNERSHIPS         6XXXXX1; 1XXXXX1          *         
      * MBS  - FHLMC, FNMA, GNMA            2XXXXX1; 2XXXXX2; 2XXXXX3 *         
      * MFMM - MUTUAL FD MONEY MKT          63XXXX6                   *         
      * MFNM - MUTUAL FD NON-MONEY MKT      POS 1 & 2 = 63 AND        *         
      *                                     POS 7 IS NOT EQUAL TO 6   *         
      * MUNI - MUNICIPAL BONDS              4XXXXXX                   *         
      * UARP - ACTION RATE PREFERRED - UIT  -------                   *         
      * UDSC - DEFERRED SALES CHARGE - UIT  -------                   *         
      * UIT  - UNIT INVESTMENT TRUST        7XXXXXX                   *         
      * ZERO - ZERO COUPON BONDS            29XXXXX; 39XXXXX; 49XXXXX *         
      * OTH  - OTHER                        NOT DEFINED ABOVE         *         
      *****************************************************************         
                                                                                
           MOVE 'OTH'  TO W-ASSET-PRC-CTGY-CD                                   
                                                                                
      ***OPTIONS = 'OTH'                                                        
           IF  (WK-MS-SEC-1 = '8' OR '9')                                       
                   AND                                                          
               (WK-MS-CLASS-1-2-3 = '664' OR '665')                             
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  WK-MS-CLASS-1 = '1'  AND                                         
               WK-MS-DESC1 (1:3) = '***'                                        
               MOVE 'FEQU' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1 = '2' OR '3' OR '4' OR '7') AND                    
               WK-MS-DESC1 (1:3) = '***'                                        
               MOVE 'FDEB' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1 = '4')                                             
               MOVE 'MUNI' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1 = '7')                                             
               MOVE 'UIT ' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1-2 = '29' OR '39' OR '49')                          
               MOVE 'ZERO' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  WK-MS-CLASS-1-2 = '27'   AND                                     
              (WK-MS-CLASS-7 = '5' OR '6' OR '7' OR '9')                        
               MOVE 'CDCP' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1 = '2'  AND                                         
              (WK-MS-CLASS-7 = '1' OR '2' OR '3'))                              
               MOVE 'MBS ' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1 = '3'  AND                                         
               WK-MS-CLASS-5-6-7 = '211' OR '711')                              
           OR (WK-MS-CLASS-1 = '2'  AND                                         
               WK-MS-CLASS-5-6-7 = '210' OR '710')                              
               MOVE 'GOVT' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  WK-MS-CLASS-1 = '2'                                              
           AND (WK-MS-CLASS-4-5   NOT = '21' AND '71')                          
           AND (WK-MS-CLASS-2     NOT = '9'                                     
           AND  WK-MS-CLASS-5     NOT = '1')                                    
           AND (WK-MS-CLASS-5-6-7 NOT = '701' AND '702' AND '703')              
               MOVE 'CORP' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  WK-MS-CLASS-1 = '6'      AND                                     
              (WK-MS-CLASS-7 = '7' OR '8')                                      
               MOVE 'ANNU' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1 = '6'  AND                                         
               WK-MS-CLASS-7 = '1')                                             
           OR (WK-MS-CLASS-1 = '1'  AND                                         
               WK-MS-CLASS-7 = '1')                                             
               MOVE 'LPAR' TO W-ASSET-PRC-CTGY-CD                               
               IF BH-ACAT-REJ-PEND-DEL-LP-IND = '1'                             
                  MOVE 'Y' TO W-FLAG-LP                                         
                  MOVE 'Y' TO W-ASSET-FLAG-LP                                   
                  MOVE BH-ACAT-REJ-PEND-DEL-LP-CODE                             
                    TO W-LP-CODE                                                
                       W-ASSET-LP-CODE                                          
               END-IF                                                           
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1-2 = '63') AND                                      
               WK-MS-CLASS-7 = '6'                                              
               MOVE 'MFMM' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF (WK-MS-CLASS-1-2 = '63') AND                                      
              (WK-MS-CLASS-7 NOT = '6')                                         
               MOVE 'MFNM' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  WK-MS-CLASS-1 = '1'                                              
           OR  WK-MS-CLASS-1-2 = '65'                                           
               MOVE 'EQU ' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
       5440-EXIT. EXIT.                                                         
      /                                                                         
       5510-CHECK-PRNGFL.                                                       
           MOVE '5510-CHECK-PRNGFL             ' TO W-ROUTINE-1.                
                                                                                
           MOVE 'N'  TO W-PRNGFL-SW                                             
           MOVE SPACES                      TO PRNGREC                          
           MOVE CUSHOL-SECURITY-NO          TO PRNGKEY                          
                                                                                
           START PRNGFL KEY NOT < PRNGKEY                                       
                                                                                
           IF PRNGFL-OKAY                                                       
              CONTINUE                                                          
           ELSE                                                                 
             IF PRNGFL-END-OF-FILE                                              
             OR PRNGFL-NOT-FOUND                                                
                GO TO 5510-EXIT                                                 
             ELSE                                                               
                DISPLAY ' ** CAT518 - PRNGFL FILE, START BROWSE ERROR'          
                        ' FILE-STATUS = ' PRNGFL-STATUS                         
                DISPLAY 'W-PRNGFL-KEY = ' CUSHOL-SECURITY-NO                    
                MOVE +3999    TO ABEND-CODE                                     
                CALL ABEND USING ABEND-CODE                                     
             END-IF                                                             
           END-IF.                                                              
                                                                                
       5510-READ-PRNGFL-NEXT.                                                   
                                                                                
           READ PRNGFL NEXT RECORD.                                             
                                                                                
           IF PRNGFL-OKAY                                                       
              CONTINUE                                                          
           ELSE                                                                 
             IF PRNGFL-END-OF-FILE                                              
                GO TO 5510-EXIT                                                 
             ELSE                                                               
                DISPLAY ' ** CAT518 - PRNGFL FILE, READ NEXT ERROR'             
                        ' FILE-STATUS = ' PRNGFL-STATUS                         
                DISPLAY 'W-PRNGFL-KEY = ' PRNGKEY                               
                MOVE +3999    TO ABEND-CODE                                     
                CALL ABEND USING ABEND-CODE                                     
             END-IF                                                             
           END-IF.                                                              
                                                                                
           ADD 1 TO W-PRNGFL-CNT                                                
                                                                                
           EVALUATE TRUE                                                        
               WHEN ((CUSHOL-SECURITY-NO < PRSECLO)                             
                          OR                                                    
                    (PRCLNT  =  '000' OR '096'))                                
                    MOVE 'N'  TO W-PRNGFL-SW                                    
               WHEN OTHER                                                       
                    ADD 1     TO W-PRNGFL-FND-CNT                               
                    MOVE 'Y'  TO W-PRNGFL-SW                                    
                    DISPLAY '   PRIVATE RANGE FOUND: '                          
                                CUSHOL-SECURITY-NO (1:7) ' ' MS-DESC1           
                    IF BH-ACAT-REJ-PEND-DEL-PRIV-IND = '1'                      
                       MOVE 'Y' TO W-ASSET-FLAG-PRIV                            
                       MOVE BH-ACAT-REJ-PEND-DEL-PRIV-CODE                      
                         TO W-PRIV-CODE                                         
                            W-ASSET-PRIV-CODE                                   
                    END-IF                                                      
           END-EVALUATE.                                                        
                                                                                
       5510-EXIT. EXIT.                                                         
      /                                                                         
       5500-CHECK-RESTRICTED.                                                   
           MOVE '5500-CHECK-RESTRICTED         ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                TO DCLVRSTSEC                                
           MOVE ' '                TO DCLVRSTBRKR                               
           MOVE ' '                TO W-VRSTSEC-FND-SW                          
           MOVE ' '                TO W-VRSTBRKR-FND-SW                         
           MOVE 0                  TO W-VRSTBRKR-ROW-CNT                        
                                                                                
           EXEC SQL                                                             
                 SELECT COUNT(*)                                                
                   INTO :W-VRSTBRKR-ROW-CNT                                     
                   FROM VRSTBRKR                                                
              WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
                AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
           END-EXEC.                                                            
                                                                                
           IF  SQLCODE  =  +0                                                   
                   IF  W-VRSTBRKR-ROW-CNT > 0                                   
                       DISPLAY '   VRSTBRKR FOUND FOR'                          
                                        ' '  WF-CLIENT-NBR                      
                                        ' '  WK-MS-CUSIP                        
                                    ' CNT='  W-VRSTBRKR-ROW-CNT                 
                   END-IF                                                       
           END-IF.                                                              
                                                                                
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,BRKR_CONTRA_NBR                                             
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,SECURITY_ADP_NBR                                            
               INTO                                                             
                    :DCLVRSTBRKR.CLIENT-NBR                                     
                   ,:DCLVRSTBRKR.ISIN-SEC-ISSUE-CD                              
                   ,:DCLVRSTBRKR.BRKR-CONTRA-NBR                                
                   ,:DCLVRSTBRKR.CRT-TMSTP                                      
                   ,:DCLVRSTBRKR.UPDT-TMSTP                                     
                   ,:DCLVRSTBRKR.CICS-TERM-ID-CD                                
                   ,:DCLVRSTBRKR.PRGM-NM                                        
                   ,:DCLVRSTBRKR.SECURITY-ADP-NBR                               
               FROM VRSTBRKR                                                    
              WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
                AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
                AND BRKR_CONTRA_NBR   = :WF-RCV-NBR                             
           END-EXEC                                                             
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VRSTBRKR-FND-CNT                                      
               MOVE 'Y'            TO W-VRSTBRKR-FND-SW                         
               DISPLAY '   RESTRICTED BRK: CUSIP=' WK-MS-CUSIP                  
                                               ' ' WK-MS-SYMBOL-9               
                       ' BRKR=' WF-RCV-NBR                                      
           ELSE                                                                 
               ADD 1 TO W-VRSTBRKR-NOTFND-CNT                                   
               MOVE 'N'            TO W-VRSTBRKR-FND-SW                         
           END-IF.                                                              
                                                                                
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,TRNFR_MEMO_IND                                              
                   ,TRNFR_BRKR_TYPE_CD                                          
                   ,RSTRD_MSG_TXT                                               
                   ,PRGM_NM                                                     
                   ,CICS_TERM_ID_CD                                             
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,SECURITY_ADP_NBR                                            
               INTO                                                             
                    :DCLVRSTSEC.CLIENT-NBR                                      
                   ,:DCLVRSTSEC.ISIN-SEC-ISSUE-CD                               
                   ,:DCLVRSTSEC.TRNFR-MEMO-IND                                  
                   ,:DCLVRSTSEC.TRNFR-BRKR-TYPE-CD                              
                   ,:DCLVRSTSEC.RSTRD-MSG-TXT                                   
                   ,:DCLVRSTSEC.PRGM-NM                                         
                   ,:DCLVRSTSEC.CICS-TERM-ID-CD                                 
                   ,:DCLVRSTSEC.CRT-TMSTP                                       
                   ,:DCLVRSTSEC.UPDT-TMSTP                                      
                   ,:DCLVRSTSEC.SECURITY-ADP-NBR                                
               FROM VRSTSEC                                                     
              WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
                AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
                AND TRNFR_BRKR_TYPE_CD IN ('D','B')                             
           END-EXEC                                                             
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VRSTSEC-FND-CNT                                       
               DISPLAY '   RESTRICTED SEC: CUSIP=' WK-MS-CUSIP                  
                                               ' ' WK-MS-SYMBOL-9               
                       ' MEMO=' TRNFR-MEMO-IND     OF DCLVRSTSEC                
                        ' TFR=' TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC                
                       ' (IF MEMO=N, WILL BE WITHHELD)'                         
               MOVE 'Y'               TO W-VRSTSEC-FND-SW                       
           ELSE                                                                 
               ADD 1 TO W-VRSTSEC-NOTFND-CNT                                    
               MOVE 'N'               TO W-VRSTSEC-FND-SW                       
DJ0012         IF SQLCODE  <  +0                                                
DJ0012            MOVE SQLCODE      TO W-DB2-SQLCODE                            
DJ0012            DISPLAY '   VRSTSEC ERROR: ' WF-CLIENT-NBR                    
DJ0012                                     ' ' WK-MS-SEC                        
DJ0012                  ' ' TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC                    
DJ0012                    ' SQLCODE = ' W-DB2-SQLCODE                           
DJ0012         END-IF                                                           
           END-IF.                                                              
                                                                                
       5500-EXIT. EXIT.                                                         
      /                                                                         
       5520-CHECK-SEC-BLOCK.                                                    
           MOVE '5520-CHECK-SEC-BLOCK          ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                TO DCLVRSDBLK                                
           MOVE ' '                TO W-VRSDBLK-SEC-FND-SW                      
                                                                                
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,BLOCK_CD                                                    
                   ,SECURITY_ADP_NBR                                            
                   ,CMNT_TXT                                                    
               INTO                                                             
                    :DCLVRSDBLK.CLIENT-NBR                                      
                   ,:DCLVRSDBLK.BLOCK-CD                                        
                   ,:DCLVRSDBLK.SECURITY-ADP-NBR                                
                   ,:DCLVRSDBLK.CMNT-TXT                                        
               FROM VRSDBLK                                                     
              WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
                AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
                AND BLOCK_CD = 'S'                                              
                AND NOT ACTION_CD = 'D'                                         
           END-EXEC                                                             
                                                                                
           MOVE 'VRSDBLK '               TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VRSDBLK-SEC-FND-CNT                                   
               MOVE 'Y'               TO W-VRSDBLK-SEC-FND-SW                   
               MOVE 'Y'               TO W-FLAG-RESCIND-BLOCK                   
               MOVE CMNT-TXT OF DCLVRSDBLK TO W-ASSET-CMNT-TXT                  
           ELSE                                                                 
               MOVE 'N'               TO W-VRSDBLK-SEC-FND-SW                   
               MOVE 'N'               TO W-FLAG-RESCIND-BLOCK                   
           END-IF.                                                              
                                                                                
       5520-EXIT. EXIT.                                                         
      /                                                                         
DJ0010 5530-CHECK-ACTRBSC         SECTION.                                      
DJ0010     MOVE '5530-CHECK-ACTRBSC            ' TO W-ROUTINE-1.                
DJ0010                                                                          
DJ0010     MOVE ' '                TO DCLACTRBSC                                
DJ0010     MOVE ' '                TO W-ACTRBSC-FND-SW                          
DJ0010                                                                          
DJ0010     EXEC SQL SELECT                                                      
DJ0010              CLIENT_NBR                                                  
DJ0010             ,SECURITY_ADP_NBR                                            
DJ0010         INTO                                                             
DJ0010              :DCLACTRBSC.CLIENT-NBR                                      
DJ0010             ,:DCLACTRBSC.SECURITY-ADP-NBR                                
DJ0010         FROM ACTRBSC                                                     
DJ0010        WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
DJ0010          AND BRANCH_CD         = :WF-BRANCH-CD                           
DJ0010          AND ACCT_CD           = :WF-ACCT-CD                             
DJ0010          AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
DJ0010          AND BLOCK_CD          = 'M'                                     
DJ0010     END-EXEC                                                             
DJ0010                                                                          
DJ0010     MOVE 'ACTRBSC '               TO W-DB2-TABLE-NAME                    
DJ0010     MOVE 'SELECT'                 TO W-DB2-ACTION                        
DJ0010     MOVE SQLCODE                  TO W-DB2-SQLCODE                       
DJ0010                                                                          
DJ0010     IF  SQLCODE  =  +0                                                   
DJ0010         ADD 1 TO W-ACTRBSC-FND-CNT                                       
DJ0010         MOVE 'Y'               TO W-ACTRBSC-FND-SW                       
DJ0010     ELSE                                                                 
DJ0010         ADD 1 TO W-ACTRBSC-NOTFND-CNT                                    
DJ0010         MOVE 'N'               TO W-ACTRBSC-FND-SW                       
DJ0010     END-IF.                                                              
DJ0010                                                                          
DJ0010 5530-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  READ MRGIMM FOR MEMOS                                                  
      *****************************************************************         
       5540-GET-MRGIMM-MEMO.                                                    
           MOVE '5540-GET-MRGIMM-MEMO           ' TO W-ROUTINE-1.               
                                                                                
           MOVE 0                        TO WORK-SFK-MEMO-QTY                   
           MOVE LOW-VALUES            TO MRGI-RECORD.                           
           MOVE CUSHOL-CLIENT-N       TO MRGI-CLIENT-N                          
           MOVE CUSHOL-BRANCH         TO MRGI-BRANCH                            
           MOVE CUSHOL-ACCOUNT        TO MRGI-ACCOUNT                           
           MOVE CUSHOL-FRGN-CURR-CODE TO MRGI-CURRENCY-N                        
           MOVE CUSHOL-ACCOUNT-TYPE   TO MRGI-TYPE-N                            
           MOVE CUSHOL-SECURITY-NO    TO MRGI-ADP-NO                            
           MOVE '5'                   TO MRGI-TRID.                             
           MOVE MRGI-RECORD           TO MRGIMM-RECORD.                         
                                                                                
           MOVE 'N'         TO W-MRGIMM-FND-SW                                  
           ADD 1 TO W-MRGIMM-CNT.                                               
                                                                                
           READ MRGIMM    INVALID KEY                                           
                ADD 1 TO W-MRGIMM-NOTFND-CNT                                    
                GO  TO  5540-EXIT.                                              
                                                                                
           ADD 1 TO W-MRGIMM-FND-CNT.                                           
           MOVE 'Y'         TO W-MRGIMM-FND-SW.                                 
           MOVE MRGIMM-SEQ-KEY        TO MRGI-SEQ-KEY.                          
           MOVE MRGIMM-MEMO-OCCURS-NO TO MRGI-MEMO-OCCURS-NO.                   
           MOVE MRGIMM-MEMOES         TO MRGI-MEMOES.                           
                                                                                
           IF  BH-BTS2-ACAT-SK-MEMO-OVERRIDE = '1'                              
           AND (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                         
               PERFORM 5541-CHECK-N4-MEMO THRU 5541-EXIT                        
           ELSE                                                                 
               MOVE 'N' TO W-MRGIMM-N4-FND-SW                                   
           END-IF                                                               
                                                                                
           PERFORM 5542-CHECK-B1-MEMO THRU 5542-EXIT.                           
                                                                                
       5540-EXIT. EXIT.                                                         
      /                                                                         
       5541-CHECK-N4-MEMO.                                                      
           MOVE '5541-CHECK-N5-MEMO             ' TO W-ROUTINE-1.               
                                                                                
           MOVE 'N' TO W-MRGIMM-N4-FND-SW                                       
                                                                                
           PERFORM VARYING W-MM-SUB FROM 1 BY 1 UNTIL                           
                  W-MM-SUB > MRGI-MEMO-OCCURS-NO                                
                                                                                
             IF MRGI-FAM-IND  (W-MM-SUB) = 'N4'                                 
             OR MRGI-MEMO-IND (W-MM-SUB) = 'N4'                                 
                      MOVE 'Y' TO W-MRGIMM-N4-FND-SW                            
                        MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY          
                        DISPLAY '   MRGIMM N4 MEMO '                            
                                   ' FAM=' MRGI-FAM-IND (W-MM-SUB)              
                                  ' MEMO=' MRGI-MEMO-IND (W-MM-SUB)             
                                   ' QTY=' W-QTY-DISPLAY                        
               DISPLAY '   '                                                    
                       'B1#511220 AND LEVEL-4. IGNORE SFK MEMO QTY'             
             END-IF                                                             
           END-PERFORM.                                                         
                                                                                
       5541-EXIT. EXIT.                                                         
      /                                                                         
       5542-CHECK-B1-MEMO.                                                      
           MOVE '5542-CHECK-B1-MEMO             ' TO W-ROUTINE-1.               
                                                                                
           PERFORM VARYING W-MM-SUB FROM 1 BY 1 UNTIL                           
                  W-MM-SUB > MRGI-MEMO-OCCURS-NO                                
                                                                                
             MOVE 'N' TO W-MRGIMM-MEMO-FND-SW                                   
                                                                                
             PERFORM VARYING SUB1 FROM 1 BY 1 UNTIL                             
                  SUB1 > BH-ACAT-WHOLD-STK-REC-MEMO-NO                          
                  OR  W-MRGIMM-MEMO-FND-SW = 'Y'                                
      *********WITHHOLD THESE MEMOS IF ON B1 434533: SK,SN,TL,TF                
      *********IF BH-ACAT-WHOLD-BY-STK-REC-MEMO (SUB1) =                        
      *********   'SK' OR 'SN' OR 'TL' OR 'TF'                                  
      *********   CONTINUE                                                      
      *********ELSE                                                             
                 IF MRGI-MEMO-IND (W-MM-SUB) =                                  
                                   BH-ACAT-WHOLD-BY-STK-REC-MEMO (SUB1)         
                    MOVE 'Y' TO W-MRGIMM-MEMO-FND-SW                            
                    ADD MRGI-MEMO-QTY (W-MM-SUB)                                
                                            TO W-POS-MEMO-QTY-EXCLUDED          
                                                 WORK-WHOLD-MEMO-QTY            
                    MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY              
                    DISPLAY '   MRGIMM B1 MEMO '                                
                                   BH-ACAT-WHOLD-BY-STK-REC-MEMO (SUB1)         
                                  ' FOUND:'                                     
                                   ' FAM=' MRGI-FAM-IND (W-MM-SUB)              
                                  ' MEMO=' MRGI-MEMO-IND (W-MM-SUB)             
                                   ' QTY=' W-QTY-DISPLAY                        
                 END-IF                                                         
      *********END-IF                                                           
             END-PERFORM                                                        
                                                                                
             IF  W-MRGIMM-MEMO-FND-SW = 'Y'                                     
                 CONTINUE                                                       
             ELSE                                                               
      ***********PROCESS AS SFK IF NOT ON B1 434533: SK,SN                      
                   IF (MRGI-FAM-IND (W-MM-SUB) = 'SK' OR 'SN')                  
                   AND W-MRGIMM-N4-FND-SW = 'N'                                 
                        ADD MRGI-MEMO-QTY (W-MM-SUB)                            
                                               TO   WORK-SFK-MEMO-QTY           
                        ADD MRGI-MEMO-QTY (W-MM-SUB)                            
                                             TO W-POS-MEMO-QTY-EXCLUDED         
                        MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY          
                        DISPLAY '   MRGIMM SF MEMO '                            
                                   ' FAM=' MRGI-FAM-IND (W-MM-SUB)              
                                  ' MEMO=' MRGI-MEMO-IND (W-MM-SUB)             
                                   ' QTY=' W-QTY-DISPLAY                        
                   ELSE                                                         
                     IF MRGI-FAM-IND (W-MM-SUB) = 'TL' OR 'TF'                  
                        ADD MRGI-MEMO-QTY (W-MM-SUB)                            
                                             TO W-POS-MEMO-QTY-EXCLUDED         
                        MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY          
                        DISPLAY '   MRGIMM TF MEMO '                            
                                   ' FAM=' MRGI-FAM-IND (W-MM-SUB)              
                                  ' MEMO=' MRGI-MEMO-IND (W-MM-SUB)             
                                   ' QTY=' W-QTY-DISPLAY                        
                     END-IF                                                     
                   END-IF                                                       
             END-IF                                                             
                                                                                
           END-PERFORM.                                                         
                                                                                
       5542-EXIT. EXIT.                                                         
      /                                                                         
LRM027 5570-WRITE-ASCENDIS-EXCP.                                                
LRM027     MOVE '5570-WRITE-ASCENDIS-EXCP        ' TO W-ROUTINE-1.              
LRM027                                                                          
LRM027     MOVE SPACES                   TO CATEXCP-RECORD                      
LRM027     MOVE WF-CLIENT-NBR            TO CATEXCP-CLIENT-NBR                  
LRM027     MOVE 'T'                      TO CATEXCP-REC-TYPE                    
LRM027     MOVE WF-ACAT-CONTROL-NBR      TO CATEXCP-ACAT-CONTROL-NBR            
LRM027     MOVE WF-BRANCH-ACCT           TO CATEXCP-BRANCH-CD                   
LRM027     MOVE WF-BRANCH-ACCT(4:5)      TO CATEXCP-ACCT-CD                     
LRM027     SET CATEXCP-SPAD TO TRUE                                             
LRM027     MOVE CUSHOL-SECURITY-NO       TO CATEXCP-EXCEPTION-DATA              
LRM027     MOVE '-'                      TO CATEXCP-EXCEPTION-DATA(8:1)         
LRM027     MOVE W-SPAD-CODE              TO CATEXCP-EXCEPTION-DATA(9:2)         
LRM027     WRITE CATEXCP-RECORD.                                                
LRM027     ADD 1 TO W-CATEXCP-CNT.                                              
LRM027                                                                          
LRM027 5570-EXIT. EXIT.                                                         
      *****************************************************************         
      *  CREATE ASSET RECORD FOR BALANCE AMOUNTS                                
      *****************************************************************         
       5600-FORMAT-BALANCES.                                                    
           MOVE '5600-FORMAT-BALANCES           ' TO W-ROUTINE-1.               
                                                                                
           MOVE ' '                                      TO DCLACTIAST          
           MOVE ' '                TO W-ASSET-CMNT-TXT                          
                                                                                
           MOVE WF-CLIENT-NBR      TO CLIENT-NBR         OF DCLACTIAST          
           MOVE WF-ACCT-DLVR-NBR   TO ACCT-DLVR-NBR      OF DCLACTIAST          
           MOVE WF-ACCT-RCV-NBR    TO ACCT-RCV-NBR       OF DCLACTIAST          
                                                                                
           MOVE 01                 TO PHSCL-SEQ-NBR      OF DCLACTIAST          
           MOVE 01                 TO LGCL-SEQ-NBR       OF DCLACTIAST          
           MOVE 'A'                TO TRANS-TYPE-CD      OF DCLACTIAST          
           MOVE WF-ACAT-CONTROL-NBR TO ACAT-CONTROL-NBR  OF DCLACTIAST          
           MOVE WF-TRNFR-TYPE-CD   TO TRNFR-TYPE-CD      OF DCLACTIAST          
           MOVE WF-DLVR-NBR        TO SBMTG-PRTCP-NBR    OF DCLACTIAST          
           MOVE WF-RCV-NBR         TO RCV-NBR            OF DCLACTIAST          
           MOVE WF-DLVR-NBR        TO DLVR-NBR           OF DCLACTIAST          
           MOVE WF-TRANS-RFRN-ID-CD TO TRANS-RFRN-ID-CD  OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-SEQ-NBR      OF DCLACTIAST          
                                                                                
           MOVE '00'               TO OPTN-CTGY-CD       OF DCLACTIAST          
           MOVE '00'               TO STTLM-LCTN-CD      OF DCLACTIAST          
                                                                                
           IF  W-CASH-SMA = 'CASH'                                              
               MOVE '40'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               IF  W-WORK-BAL > 0                                               
                   MOVE 'DEB'      TO STTLM-RSN-CD       OF DCLACTIAST          
                   MOVE 'Y' TO W-FLAG-DEBIT-BAL                                 
               ELSE                                                             
                   MOVE 'CRED'     TO STTLM-RSN-CD       OF DCLACTIAST          
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF  W-CASH-SMA = 'SMA'                                               
               MOVE '45'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE 'SMA'          TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
                                                                                
           MOVE ' '                TO ASSET-RQST-QTY-CD  OF DCLACTIAST          
           MOVE '3'                TO AST-RQST-TRANS-CD  OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-QTY          OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-PCT          OF DCLACTIAST          
                                                                                
           IF  W-WORK-BAL > 0                                                   
               MOVE 'S'            TO PSTN-CD            OF DCLACTIAST          
           ELSE                                                                 
               MOVE 'L'            TO PSTN-CD            OF DCLACTIAST          
           END-IF                                                               
                                                                                
           MOVE 'USD'              TO ISO-CRNCY-CD       OF DCLACTIAST          
           MOVE W-WORK-BAL-UNSIGN  TO ASSET-AMT          OF DCLACTIAST          
           MOVE ' '                TO BEARER-BOND-CD     OF DCLACTIAST          
           MOVE W-CSH-MGN-SHT      TO CSH-MGN-SHRT-CD    OF DCLACTIAST          
           MOVE ' '                TO WHI-CD             OF DCLACTIAST          
                                                                                
           MOVE W-PGM-NAME         TO PRGM-NM            OF DCLACTIAST          
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTIAST          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTIAST          
DJ0011     EVALUATE BH-ACAT-ASCENDIS-USER                                       
DJ0011        WHEN '1'   MOVE 'A'  TO NSCC-ACK-IND       OF DCLACTIAST          
DJ0011        WHEN '2'   MOVE 'P'  TO NSCC-ACK-IND       OF DCLACTIAST          
DJ0011        WHEN OTHER MOVE ' '  TO NSCC-ACK-IND       OF DCLACTIAST          
DJ0011     END-EVALUATE                                                         
LRM009***  IF BH-ACAT-SUBMIT-ASSETS-PTR = '1'                                   
LRM009***     MOVE ' '             TO NSCC-PEND-CD       OF DCLACTIAST          
LRM009***  ELSE                                                                 
              MOVE 'H'             TO NSCC-PEND-CD       OF DCLACTIAST          
LRM009***  END-IF                                                               
           MOVE ' '                TO NSCC-WTHLD-CD      OF DCLACTIAST          
                                                                                
           MOVE W-WORK-BAL TO W-AMT-DISPLAY                                     
           DISPLAY '   BAL ' W-CSH-MGN-SHT ' ' W-CASH-SMA                       
                         ' ' W-AMT-DISPLAY                                      
                         ' ' STTLM-LCTN-CD OF DCLACTIAST                        
                         ' ' STTLM-RSN-CD  OF DCLACTIAST                        
                         ' ' PSTN-CD       OF DCLACTIAST                        
                         ' ' ASSET-AMT     OF DCLACTIAST                        
           .                                                                    
       5600-EXIT. EXIT.                                                         
      /                                                                         
       5700-FORMAT-ACTIAST.                                                     
      *****************************************************************         
      *****    SETTLING LOCATION = 00, SETTLING REASON = ' '   DEFAULT          
      *****CNS SETTLING LOCATION = 05, SETTLING REASON = ' '                    
      *****MF  SETTLING LOCATION = 10, SETTLING REASON = ' '                    
      *****DTC SETTLING LOCATION = 25, SETTLING REASON = ' '                    
      *****OPT SETTLING LOCATION = 35, SETTLING REASON = 'OPT'                  
      *****************************************************************         
           MOVE '5700-FORMAT-ACTIAST           ' TO W-ROUTINE-1.                
                                                                                
           MOVE WORK-POS-QTY       TO W-ASSET-QTY-SIGN                          
                                      W-ASSET-QTY-UNSIGN                        
           PERFORM 5790-FORMAT-COMMON-FIELDS THRU 5790-EXIT.                    
                                                                                
           IF  WK-DTC-IND = 'Y'                                                 
               MOVE '25'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE ' '            TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
           IF  WK-CNS-IND = 'Y'                                                 
               MOVE '05'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE ' '            TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
                                                                                
           IF  BH-ACAT-MF-FUND-SERV-CLIENT = '1'                                
           AND (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                         
               MOVE '10'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE ' '            TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
                                                                                
           IF  WK-MS-SEC-ID = 'O'                                               
               MOVE '35'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE 'OPT'          TO STTLM-RSN-CD       OF DCLACTIAST          
               MOVE 'XX'  TO ISIN-SEC-ISSUE-CD OF DCLACTIAST (1:2)              
               MOVE CUSHOL-SECURITY-NO                                          
                          TO ISIN-SEC-ISSUE-CD OF DCLACTIAST (3:7)              
           END-IF                                                               
                                                                                
           IF W-CURRENT-CLIENT = '0039'                                         
              MOVE CUSHOL-SECURITY-NO TO W-PRIVATE-RANGE-FUNDS                  
              IF W-PRIV-RANGE-SECURITY                                          
                  PERFORM 5760-FORMAT-PVRT-RANGE    THRU 5760-EXIT              
              END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE ' '                 TO NSCC-WTHLD-CD     OF DCLACTIAST          
           .                                                                    
       5700-EXIT. EXIT.                                                         
                                                                                
       5720-FORMAT-RESTRICTED.                                                  
      *****************************************************************         
      *****SET THE WITHHOLD INDICATOR.                                          
      *****SETTLING LOCATION = 45, SETTLING REASON = COMT                       
      *****************************************************************         
           MOVE '5720-FORMAT-RESTRICTED         ' TO W-ROUTINE-1.               
                                                                                
           MOVE WORK-POS-QTY       TO W-ASSET-QTY-SIGN                          
                                      W-ASSET-QTY-UNSIGN                        
           PERFORM 5790-FORMAT-COMMON-FIELDS THRU 5790-EXIT.                    
                                                                                
           MOVE '45'               TO STTLM-LCTN-CD      OF DCLACTIAST          
           MOVE 'COMT'             TO STTLM-RSN-CD       OF DCLACTIAST          
           MOVE ' '                TO ASSET-PRC-CTGY-CD  OF DCLACTIAST          
                                                                                
           IF  W-VRSDBLK-SEC-FND-SW = 'Y'                                       
               IF BH-ACAT-BLOCK-SECURITY-IND   = '2'                            
                  MOVE 'W'          TO NSCC-WTHLD-CD     OF DCLACTIAST          
                 DISPLAY ' BH-ACAT-BLOCK-SECURITY-IND=2, WITHHELD'              
               ELSE                                                             
                  MOVE ' '          TO NSCC-WTHLD-CD     OF DCLACTIAST          
           ELSE                                                                 
           IF  TRNFR-MEMO-IND OF DCLVRSTSEC = 'N'                               
               MOVE 'W'             TO NSCC-WTHLD-CD     OF DCLACTIAST          
                 DISPLAY ' TRNFR-MEMO-IND-OF-DCLVRSTSEC=N, WITHHELD'            
           ELSE                                                                 
               MOVE ' '             TO NSCC-WTHLD-CD     OF DCLACTIAST          
LRM017         IF RSTRD-MSG-TXT OF DCLVRSTSEC (1:38) =                          
LRM017                  'REORG - VOLUNTARY OFFER CONTRA CUSIP  '                
LRM017               OR 'FOR DELIVERER: REORG - VOLUNTARY OFFER'                
LRM017            MOVE 'UNDER VOLUNTARY REORG' TO W-ASSET-CMNT-TXT              
LRM017         END-IF                                                           
LRM021         IF W-MATURE-CALLED-BOND-SW  = 'Y'                                
LRM021            MOVE 'MUTURE BOND'     TO W-ASSET-CMNT-TXT                    
LRM021         END-IF                                                           
           END-IF                                                               
           .                                                                    
       5720-EXIT. EXIT.                                                         
                                                                                
       5730-FORMAT-WHEN-ISSUE.                                                  
      *****************************************************************         
      *****SETTLING LOCATION = 45, SETTLING REASON = COMT                       
      *****************************************************************         
           MOVE '5730-FORMAT-WHEN-ISSUE         ' TO W-ROUTINE-1.               
                                                                                
           MOVE WORK-POS-QTY         TO W-ASSET-QTY-SIGN                        
                                        W-ASSET-QTY-UNSIGN                      
           PERFORM 5790-FORMAT-COMMON-FIELDS THRU 5790-EXIT.                    
                                                                                
           MOVE '45'               TO STTLM-LCTN-CD      OF DCLACTIAST          
           MOVE 'COMT'             TO STTLM-RSN-CD       OF DCLACTIAST          
           MOVE ' '                TO ASSET-PRC-CTGY-CD  OF DCLACTIAST          
                                                                                
           MOVE ' '                TO NSCC-WTHLD-CD      OF DCLACTIAST          
           .                                                                    
       5730-EXIT. EXIT.                                                         
                                                                                
       5740-FORMAT-WHOLD-MEMO.                                                  
      *****************************************************************         
      *****SET THE WITHHOLD INDICATOR.                                          
      *****SETTLING LOCATION = 45, SETTLING REASON = COMT                       
      *****************************************************************         
           MOVE '5740-FORMAT-WHOLD-MEMO         ' TO W-ROUTINE-1.               
                                                                                
           MOVE WORK-WHOLD-MEMO-QTY  TO W-ASSET-QTY-SIGN                        
                                        W-ASSET-QTY-UNSIGN                      
           PERFORM 5790-FORMAT-COMMON-FIELDS THRU 5790-EXIT.                    
                                                                                
           MOVE '45'               TO STTLM-LCTN-CD      OF DCLACTIAST          
           MOVE 'COMT'             TO STTLM-RSN-CD       OF DCLACTIAST          
           MOVE ' '                TO ASSET-PRC-CTGY-CD  OF DCLACTIAST          
                                                                                
           MOVE 'W'                TO NSCC-WTHLD-CD      OF DCLACTIAST          
           DISPLAY ' 5740-FORMAT-WHOLD-MEMO, WITHHELD'                          
           .                                                                    
       5740-EXIT. EXIT.                                                         
                                                                                
       5750-FORMAT-SFK-MEMO.                                                    
      *****************************************************************         
      *****SETTLING LOCATION = 50, SETTLING REASON = SFK                        
      *****************************************************************         
           MOVE '5750-FORMAT-SFK-MEMO           ' TO W-ROUTINE-1.               
                                                                                
           MOVE WORK-SFK-MEMO-QTY  TO W-ASSET-QTY-SIGN                          
                                      W-ASSET-QTY-UNSIGN                        
           PERFORM 5790-FORMAT-COMMON-FIELDS THRU 5790-EXIT.                    
                                                                                
           MOVE '50'               TO STTLM-LCTN-CD      OF DCLACTIAST          
           MOVE 'SFK'              TO STTLM-RSN-CD       OF DCLACTIAST          
                                                                                
           MOVE ' '                TO NSCC-WTHLD-CD      OF DCLACTIAST          
           .                                                                    
       5750-EXIT. EXIT.                                                         
                                                                                
       5760-FORMAT-PVRT-RANGE.                                                  
           MOVE '50'               TO STTLM-LCTN-CD      OF DCLACTIAST          
           MOVE 'XSET'             TO STTLM-RSN-CD       OF DCLACTIAST          
           .                                                                    
       5760-EXIT. EXIT.                                                         
       5790-FORMAT-COMMON-FIELDS.                                               
           MOVE '5790-FORMAT-COMMON-FIELDS      ' TO W-ROUTINE-1.               
                                                                                
           MOVE ' '                                      TO DCLACTIAST          
                                                                                
           MOVE WF-CLIENT-NBR      TO CLIENT-NBR         OF DCLACTIAST          
           MOVE WF-ACCT-DLVR-NBR   TO ACCT-DLVR-NBR      OF DCLACTIAST          
           MOVE WF-ACCT-RCV-NBR    TO ACCT-RCV-NBR       OF DCLACTIAST          
           MOVE CUSHOL-SECURITY-NO TO SECURITY-ADP-NBR OF DCLACTIAST            
                                                                                
           MOVE 01                 TO PHSCL-SEQ-NBR      OF DCLACTIAST          
           MOVE 01                 TO LGCL-SEQ-NBR       OF DCLACTIAST          
           MOVE 'A'                TO TRANS-TYPE-CD      OF DCLACTIAST          
           MOVE WF-ACAT-CONTROL-NBR TO ACAT-CONTROL-NBR  OF DCLACTIAST          
           MOVE WF-TRNFR-TYPE-CD   TO TRNFR-TYPE-CD      OF DCLACTIAST          
           MOVE WF-DLVR-NBR        TO SBMTG-PRTCP-NBR    OF DCLACTIAST          
           MOVE WF-RCV-NBR         TO RCV-NBR            OF DCLACTIAST          
           MOVE WF-DLVR-NBR        TO DLVR-NBR           OF DCLACTIAST          
           MOVE WF-TRANS-RFRN-ID-CD TO TRANS-RFRN-ID-CD  OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-SEQ-NBR      OF DCLACTIAST          
           MOVE W-ASSET-PRC-CTGY-CD TO ASSET-PRC-CTGY-CD OF DCLACTIAST          
                                                                                
           IF  WK-MS-NON-OPT                                                    
               MOVE '00'           TO OPTN-CTGY-CD       OF DCLACTIAST          
           ELSE                                                                 
             IF  WK-MS-EQUITY-OPT                                               
                 MOVE '01'         TO OPTN-CTGY-CD       OF DCLACTIAST          
             ELSE                                                               
               IF  WK-MS-NON-EQU-OPT                                            
                   MOVE '02'       TO OPTN-CTGY-CD       OF DCLACTIAST          
               ELSE                                                             
                   MOVE '03'       TO OPTN-CTGY-CD       OF DCLACTIAST          
               END-IF                                                           
             END-IF                                                             
           END-IF                                                               
                                                                                
           MOVE '00'               TO STTLM-LCTN-CD      OF DCLACTIAST          
           IF  WK-DTC-IND = 'Y'                                                 
               MOVE '25'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE ' '            TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
           IF  WK-CNS-IND = 'Y'                                                 
               MOVE '05'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE ' '            TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
                                                                                
           IF  BH-ACAT-MF-FUND-SERV-CLIENT = '1'                                
           AND (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                         
               MOVE '10'           TO STTLM-LCTN-CD      OF DCLACTIAST          
               MOVE ' '            TO STTLM-RSN-CD       OF DCLACTIAST          
           END-IF                                                               
                                                                                
LRM028     IF  CUSHOL-CPH-CUSIP > SPACES                                        
              MOVE 'US'              TO ISIN-CNTRY-CD     OF DCLACTIAST         
              MOVE  CUSHOL-CPH-CUSIP TO ISIN-SEC-ISSUE-CD OF DCLACTIAST         
              MOVE ' '               TO ISIN-SEC-CDG-CD   OF DCLACTIAST         
LRM028     ELSE                                                                 
LRM028     IF WK-MS-ISIN > SPACES                                               
LRM028        MOVE WK-MS-ISIN(1:2)  TO ISIN-CNTRY-CD      OF DCLACTIAST         
LRM028        MOVE WK-MS-ISIN(3:9)  TO ISIN-SEC-ISSUE-CD  OF DCLACTIAST         
LRM028        MOVE WK-MS-ISIN(12:1) TO ISIN-SEC-CDG-CD    OF DCLACTIAST         
LRM028     END-IF.                                                              
                                                                                
           MOVE W-POS-DESC1  TO ASSET-DESC-TXT OF DCLACTIAST (1:30)             
           MOVE W-POS-DESC2  TO ASSET-DESC-TXT OF DCLACTIAST (31:30)            
           MOVE W-POS-DESC3  TO ASSET-DESC-TXT OF DCLACTIAST (61:30)            
           MOVE WK-POS-DESC4 TO ASSET-DESC-TXT OF DCLACTIAST (91:30)            
           MOVE WK-POS-DESC5 TO ASSET-DESC-TXT OF DCLACTIAST (121:20)           
                                                                                
           MOVE ' '                TO ASSET-RQST-QTY-CD  OF DCLACTIAST          
           MOVE '2'                TO AST-RQST-TRANS-CD  OF DCLACTIAST          
                                                                                
           MOVE W-ASSET-QTY-UNSIGN TO ASSET-QTY          OF DCLACTIAST          
           MOVE ZEROES             TO ASSET-PCT          OF DCLACTIAST          
                                                                                
           IF  W-ASSET-QTY-SIGN < 0                                             
               MOVE 'S'            TO PSTN-CD            OF DCLACTIAST          
           ELSE                                                                 
               MOVE 'L'            TO PSTN-CD            OF DCLACTIAST          
           END-IF                                                               
                                                                                
           MOVE 'USD'              TO ISO-CRNCY-CD       OF DCLACTIAST          
                                                                                
           IF  WK-MS-CLOSING-PRICE = 0                                          
               COMPUTE WORK-POS-VALUE ROUNDED = W-ASSET-QTY-UNSIGN              
LRM029                   / 100                                                  
LRM029         MOVE 'Z' TO ASSET-AMT-STTS-CD OF DCLACTIAST                      
TEST           DISPLAY 'PRC ZERO ' CUSHOL-SECURITY-NO ' '                       
TEST                             WORK-POS-VALUE                                 
           ELSE                                                                 
TEST           DISPLAY 'PRC ' CUSHOL-SECURITY-NO ' '                            
TEST                             WK-MS-CLOSING-PRICE                            
               COMPUTE WORK-POS-VALUE ROUNDED =                                 
                              W-ASSET-QTY-UNSIGN * WK-MS-CLOSING-PRICE          
LRM029         MOVE ' ' TO ASSET-AMT-STTS-CD OF DCLACTIAST                      
               IF  WK-MS-OPTION                                                 
                   COMPUTE WORK-POS-VALUE ROUNDED =                             
                                  WORK-POS-VALUE * WK-MS-OPTION-FACTOR          
               ELSE                                                             
                   IF  WK-MS-BOND                                               
                       COMPUTE WORK-POS-VALUE ROUNDED =                         
                                  WORK-POS-VALUE / 100                          
                   END-IF                                                       
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF  WORK-POS-VALUE < .01                                             
TEST           DISPLAY 'FORCE AMT .01'                                          
               MOVE .01            TO WORK-POS-VALUE                            
           END-IF                                                               
           MOVE WORK-POS-VALUE     TO ASSET-AMT          OF DCLACTIAST          
TEST       DISPLAY 'ENDING VALUE ' WORK-POS-VALUE                               
                                                                                
           IF  WK-MS-BOND-IND = 'B'                                             
               MOVE 'B'            TO BEARER-BOND-CD     OF DCLACTIAST          
           ELSE                                                                 
               MOVE 'N'            TO BEARER-BOND-CD     OF DCLACTIAST          
           END-IF                                                               
                                                                                
           IF  (CUSHOL-ACCOUNT-TYPE = '1' OR '3')                               
               MOVE 'C'            TO CSH-MGN-SHRT-CD    OF DCLACTIAST          
           ELSE                                                                 
             IF  (CUSHOL-ACCOUNT-TYPE = '2')                                    
                 MOVE 'M'          TO CSH-MGN-SHRT-CD    OF DCLACTIAST          
             ELSE                                                               
      *******IF**(CUSHOL-ACCOUNT-TYPE = '5')                                    
                 MOVE 'S'          TO CSH-MGN-SHRT-CD    OF DCLACTIAST          
             END-IF                                                             
           END-IF                                                               
                                                                                
           IF  CUSHOL-WI                                                        
               MOVE 'W'            TO WHI-CD             OF DCLACTIAST          
           ELSE                                                                 
               MOVE 'N'            TO WHI-CD             OF DCLACTIAST          
           END-IF                                                               
                                                                                
           MOVE W-PGM-NAME          TO PRGM-NM           OF DCLACTIAST          
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTIAST          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTIAST          
DJ0011     EVALUATE BH-ACAT-ASCENDIS-USER                                       
DJ0011        WHEN '1'   MOVE 'A'  TO NSCC-ACK-IND       OF DCLACTIAST          
DJ0011        WHEN '2'   MOVE 'P'  TO NSCC-ACK-IND       OF DCLACTIAST          
DJ0011        WHEN OTHER MOVE ' '  TO NSCC-ACK-IND       OF DCLACTIAST          
DJ0011     END-EVALUATE                                                         
LRM009***  IF BH-ACAT-SUBMIT-ASSETS-PTR = '1'                                   
LRM009***     MOVE ' '             TO NSCC-PEND-CD       OF DCLACTIAST          
LRM009***  ELSE                                                                 
              MOVE 'H'             TO NSCC-PEND-CD       OF DCLACTIAST          
LRM009***  END-IF                                                               
           MOVE ' '                TO NSCC-WTHLD-CD      OF DCLACTIAST          
           .                                                                    
       5790-EXIT. EXIT.                                                         
      /                                                                         
       5800-FORMAT-OPT-RTN.                                                     
           MOVE '5800-FORMAT-OPT-RTN            ' TO W-ROUTINE-1.               
                                                                                
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
                                                                                
           MOVE '35'               TO STTLM-LCTN-CD      OF DCLACTIOPN          
                                                                                
                                                                                
           MOVE ISIN-CNTRY-CD      OF DCLACTIAST                                
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
               MOVE 'B'             TO BS-CD             OF DCLACTIOPN          
           ELSE                                                                 
               MOVE 'S'             TO BS-CD             OF DCLACTIOPN          
           END-IF                                                               
           MOVE WK-MS-PUT-CALL      TO PTCL-CD           OF DCLACTIOPN          
      ****OPEN/CLOSE IS ALWAYS CLOSE                                            
           MOVE 'C'                 TO OPTN-OPN-CLSD-CD  OF DCLACTIOPN          
                                                                                
           MOVE WK-MS-SYMBOL        TO SYM-CD            OF DCLACTIOPN          
           MOVE WK-MS-EXP-DATE(1:4) TO W-DATE-YEAR                              
           MOVE WK-MS-EXP-DATE(5:2) TO W-DATE-MM                                
           MOVE WK-MS-EXP-DATE(7:2) TO W-DATE-DD                                
           IF W-DATE-MM < '01' OR > '12'                                        
              DISPLAY 'EXP DATE MM NG ' W-DATE-MM                               
              MOVE '12' TO W-DATE-MM                                            
           END-IF.                                                              
           IF W-DATE-DD < '01' OR > '31'                                        
              DISPLAY 'EXP DATE DD NG ' W-DATE-DD                               
              MOVE '31' TO W-DATE-DD                                            
           END-IF.                                                              
           IF W-DATE-YEAR NOT NUMERIC                                           
              DISPLAY 'EXP DATE YEAR NG ' W-DATE-YEAR                           
              MOVE '9999' TO W-DATE-YEAR                                        
           END-IF.                                                              
           MOVE W-DATE              TO EXPTN-DT          OF DCLACTIOPN          
LRM016**** IF L-STREAM-IND = 'Q'                                                
LRM015       MOVE WK-MS-OPT-PRC-NEW  TO STPRC-INTEGER-AMT OF DCLACTIOPN         
LRM015                                 STPRC-INTEGER2-AMT OF DCLACTIOPN         
LRM015       MOVE WK-MS-OPT-FRAC-NEW TO STPRC-FRCTN-AMT   OF DCLACTIOPN.        
LRM015**** ELSE                                                                 
      ****    MOVE WK-MS-OPT-PRC    TO STPRC-INTEGER-AMT OF DCLACTIOPN          
LRM015****                             STPRC-INTEGER2-AMT OF DCLACTIOPN         
      ****    IF MSD-FRACTION-DECIMAL-IND = 'D'                                 
      ****       MOVE WK-MS-OPT-DECI-ROUNDED                                    
      ****                          TO STPRC-FRCTN-AMT   OF DCLACTIOPN          
      ****    ELSE                                                              
      ****       MOVE WK-MS-OPT-FRAC-1 TO STPRC-FRCTN-AMT OF DCLACTIOPN         
LRM015****    END-IF                                                            
      **** END-IF.                                                              
           MOVE ' '                 TO DLVR-OCC-NBR      OF DCLACTIOPN          
           MOVE 'C'                 TO OPTN-ACCT-TYPE-CD OF DCLACTIOPN          
           MOVE ' '                 TO ACCT-SUB-CD       OF DCLACTIOPN          
           MOVE WK-MS-DESC1         TO OPTN-CMNT-TXT     OF DCLACTIOPN          
                                                                                
           MOVE W-PGM-NAME          TO PRGM-NM           OF DCLACTIOPN          
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTIOPN          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTIOPN          
LRM009***  IF BH-ACAT-SUBMIT-ASSETS-PTR = '1'                                   
LRM009***     MOVE ' '              TO NSCC-PEND-CD      OF DCLACTIOPN          
LRM009***  ELSE                                                                 
              MOVE 'H'              TO NSCC-PEND-CD      OF DCLACTIOPN          
LRM009***  END-IF                                                               
                                                                                
           INITIALIZE                W-OPT-DESC                                 
           IF  BS-CD OF DCLACTIOPN = 'B'                                        
                  MOVE 'BUY'          TO W-OPT-BUY-SELL                         
           ELSE                                                                 
                  MOVE 'SELL'         TO W-OPT-BUY-SELL                         
           END-IF                                                               
      ****OPEN/CLOSE IS ALWAYS CLOSE                                            
           MOVE 'CLOS'                TO W-OPT-OPEN-CLOSE                       
           IF  PTCL-CD OF DCLACTIOPN = 'C'                                      
                  MOVE 'CALL'         TO W-OPT-CALL-PUT                         
           ELSE                                                                 
                  MOVE 'PUT '         TO W-OPT-CALL-PUT                         
           END-IF                                                               
LRM016**** IF L-STREAM-IND = 'Q'                                                
LRM015        MOVE WK-MS-SYMBOL              TO W-OPT-UNDLY-SYMBOL              
LRM015        MOVE WK-MS-EXP-MM-NEW          TO W-OPT-EXPTN-MM-NEW              
LRM015        MOVE '/'                       TO W-OPT-EXPTN-S1-NEW              
LRM015                                          W-OPT-EXPTN-S2-NEW              
LRM015        MOVE WK-MS-EXP-DD-NEW          TO W-OPT-EXPTN-DD-NEW              
LRM015        MOVE WK-MS-EXP-YY-NEW          TO W-OPT-EXPTN-YY-NEW              
LRM015        MOVE WK-MS-OPT-PRC-NEW         TO W-OPT-STRIKE-PRIC-NEW           
LRM015        IF WK-MS-OPT-FRAC-NEW = ZEROS                                     
LRM015           MOVE SPACES                 TO W-OPT-STRIKE-FRAC-NEW           
LRM015        ELSE                                                              
LRM015           MOVE WK-MS-OPT-FRAC-NEW     TO W-OPT-STRIKE-FRAC-NEW           
LRM015       END-IF                                                             
LRM015**** ELSE                                                                 
      ****    MOVE SYM-CD OF DCLACTIOPN      TO W-OPT-SYMBOL                    
      ****    MOVE MS-SYMBOL                 TO W-OPT-MS-SYMBOL                 
      ****    MOVE WK-MS-EXP-DATE(5:2)       TO W-OPT-EXPTN-MM                  
      ****    MOVE '/'                       TO W-OPT-EXPTN-S1                  
      ****    MOVE WK-MS-EXP-DATE(1:2)       TO W-OPT-EXPTN-CC                  
      ****    MOVE WK-MS-EXP-DATE(3:2)       TO W-OPT-EXPTN-YY                  
      ****    MOVE WK-MS-OPT-PRC             TO W-STPRC-INTEGER-AMT             
      ****    MOVE WK-MS-OPT-FRAC-1          TO W-STPRC-FRCTN-AMT               
      ****    MOVE W-STPRC-INTEGER-AMT       TO W-OPT-STRIKE-PRIC               
      ****    IF   W-STPRC-FRCTN = '00'                                         
      ****    AND  MSD-FRACTION-DECIMAL-IND NOT = 'D'                           
      ****          MOVE ' '            TO W-OPT-STRIKE-FRAC                    
      ****          MOVE ' '            TO W-OPT-SLASH-8                        
      ****    ELSE                                                              
      ****          IF MSD-FRACTION-DECIMAL-IND = 'D'                           
      ****             MOVE '0'            TO W-OPT-STRIKE-FRAC                 
      ****          ELSE                                                        
      ****             MOVE W-STPRC-FRCTN (2:1)                                 
      ****                              TO W-OPT-STRIKE-FRAC                    
      ****          END-IF                                                      
      ****          MOVE '/8'           TO W-OPT-SLASH-8                        
      **** END-IF.                                                              
                                                                                
           IF (ASSET-DESC-TXT OF DCLACTIAST (1:60) = ' ')                       
                 MOVE W-OPT-DESC TO ASSET-DESC-TXT OF DCLACTIAST (1:60)         
           ELSE                                                                 
            IF (ASSET-DESC-TXT OF DCLACTIAST (31:60) = ' ')                     
                 MOVE W-OPT-DESC TO ASSET-DESC-TXT OF DCLACTIAST(31:60)         
            ELSE                                                                
             IF (ASSET-DESC-TXT OF DCLACTIAST (61:60) = ' ')                    
                 MOVE W-OPT-DESC TO ASSET-DESC-TXT OF DCLACTIAST(61:60)         
             ELSE                                                               
              IF (ASSET-DESC-TXT OF DCLACTIAST (91:30) = ' ')                   
                 MOVE W-OPT-DESC TO ASSET-DESC-TXT OF DCLACTIAST(91:30)         
              END-IF                                                            
             END-IF                                                             
            END-IF                                                              
           END-IF.                                                              
           IF WK-MS-EXP-DATE NOT > W-EXP-OPT-DATE                               
             IF W-EXP-OPT-ACT > '0'                                             
               MOVE 'Y' TO W-FLAG-EXP-OPT-POSN                                  
               MOVE 'Y' TO W-ASSET-FLAG-EXP-OPT-POSN                            
               DISPLAY ' EXP OPT FOR ' CUSHOL-KEY                               
               IF W-EXP-OPT-ACT = '2'                                           
                  MOVE 'W'         TO NSCC-WTHLD-CD     OF DCLACTIAST           
                  DISPLAY ' W-EXP-OPT-ACT=2, WITHHELD'                          
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
           MOVE 'Y' TO W-FLAG-OPTION                                            
           MOVE 'Y' TO W-ASSET-FLAG-OPTION                                      
                                                                                
           MOVE ACAT-CONTROL-NBR   OF DCLACTIAST                                
                                   TO ACAT-CONTROL-NBR   OF DCLACTIOPN          
           MOVE ASSET-SEQ-NBR      OF DCLACTIAST                                
                                   TO ASSET-SEQ-NBR      OF DCLACTIOPN          
           MOVE TRNFR-TYPE-CD      OF DCLACTIAST                                
                                   TO TRNFR-TYPE-CD      OF DCLACTIOPN.         
                                                                                
       5800-EXIT. EXIT.                                                         
      /                                                                         
       5910-MFMSD.                                                              
           MOVE '5910-MFMSD                    ' TO W-ROUTINE-1.                
                                                                                
DJ0013     MOVE 'N'          TO W-MFMSD-FND-SW                                  
           MOVE ' '                      TO W-FUND-SERV-ELIGIBLE-SW             
           MOVE ' '                      TO MFMSD-REC                           
           IF  WK-MS-SYMBOL > ' '                                               
               MOVE WK-MS-SYMBOL TO  MAIN-KEY                                   
           ELSE                                                                 
               MOVE WK-MS-CUSIP  TO  MAIN-KEY                                   
           END-IF.                                                              
                                                                                
           ADD 1 TO W-MFMSD-CNT                                                 
           READ MFMSD     INVALID KEY                                           
                MOVE 'N'         TO W-FUND-SERV-ELIGIBLE-SW                     
                DISPLAY '   MFMSD-NOTFND'                                       
                          ' FOR ' MAIN-KEY                                      
                        ' ' W-ASSET-PRC-CTGY-CD                                 
                         '. NOT FUND SERV ELIGIBILE'                            
                GO  TO  5910-EXIT.                                              
                                                                                
           ADD 1 TO W-MFMSD-FND-CNT                                             
                                                                                
DJ0013     MOVE 'Y'          TO W-MFMSD-FND-SW                                  
           IF  NOT-FUND-SERV-ELIGIBLE                                           
               MOVE 'N'          TO W-FUND-SERV-ELIGIBLE-SW                     
               DISPLAY '   THIS MF IS NOT FUND SERV ELIGIBILE'                  
           ELSE                                                                 
               MOVE 'Y'          TO W-FUND-SERV-ELIGIBLE-SW                     
           END-IF.                                                              
                                                                                
       5910-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5920-BNWREGOP.                                                           
           MOVE '5920-BNWREGOP                 ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                    TO W-BNWREGOP-FND-SW                     
           MOVE ' '                    TO W-LEGG-MASON-FUND-SW                  
           MOVE ' '                    TO NTW-HOUSE-ACCOUNT                     
           MOVE 'N'                    TO NTW-HOUSE-ACCT-SW                     
           MOVE 'N'                    TO NTW-OMNIBUS-ACCT-SW                   
LRM030     MOVE 'N'                    TO NTW-SHWB-ACCT-FLAG.                   
           MOVE ' '                    TO BNWREGOP-RECORD                       
           MOVE CUSHOL-CLIENT-N        TO CLIENT-NO OF BNWREGOP-RECORD          
           MOVE CUSHOL-CPH-CUSIP       TO CUSIP-9   OF BNWREGOP-RECORD          
                                                                                
           ADD 1 TO W-BNWREGOP-CNT                                              
           READ BNWREGOP  INVALID KEY                                           
                MOVE 'N'         TO W-BNWREGOP-FND-SW                           
                MOVE 'N'         TO W-LEGG-MASON-FUND-SW                        
                DISPLAY '   BNWREGOP-NOTFND FOR ' REG-OPT-KEY-AREA              
                GO TO 5920-EXIT.                                                
                                                                                
           ADD 1 TO W-BNWREGOP-FND-CNT                                          
           MOVE 'Y'         TO W-BNWREGOP-FND-SW                                
           DISPLAY '   BNWREGOP-FOUND  FOR ' REG-OPT-KEY-AREA                   
                     ' PROCESSING-CODE='                                        
                       PROCESSING-CODE OF BNWREGOP-RECORD                       
                     ' HOUSE-ACCOUNT=' REG-OP-HOUSE-ACCT                        
                                                                                
           IF  BH-MF-ACTIVE                                                     
                   AND                                                          
               BH-MFN-OMNIBUS-MULTI-PLAT-OPT  =  '1'                            
                   AND                                                          
               (OMNIBUS-PROCESSING OF BNWREGOP-RECORD                           
                    OR DST-DIRECT  OF BNWREGOP-RECORD                           
LRM018              OR PNC-SURPAS-PROCESSING OF BNWREGOP-RECORD)                
               MOVE 'R'                 TO NTWIO-FUNCTION-CODE                  
               MOVE CUSHOL-CLIENT-N     TO NTWIO-CLIENT                         
               MOVE CUSHOL-CPH-CUSIP    TO NTWIO-CUSIP-9                        
               IF MS-SYMBOL > SPACES                                            
                  MOVE MS-SYMBOL        TO NTWIO-SYMBOL                         
               ELSE                                                             
                  MOVE MS-CUSIP-NO      TO NTWIO-SYMBOL                         
               END-IF                                                           
               MOVE W-CKDIGIT-ACCT-TC        TO NTWIO-ACCT-ID                   
               DISPLAY ' NTWIO-ACCT-ID = ' NTWIO-ACCT-ID                        
               DISPLAY 'CALLING NTWIO WITH ' NTWIO-REQUEST-PARAMETERS           
               CALL  BNWNTWIO  USING NTWIO-PARAMETERS                           
               IF NTWIO-RETURN-OK                                               
                  MOVE NTWIO-PROCESSING-CODE                                    
                    TO PROCESSING-CODE OF BNWREGOP-RECORD                       
                  DISPLAY 'BNWNTWIO OVERRIDE PROCESS CODE TO '                  
                       NTWIO-PROCESSING-CODE                                    
               ELSE                                                             
                  DISPLAY 'NTWIO FAILED ' NTWIO-RETURN-CODE                     
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  PROCESSING-CODE OF BNWREGOP-RECORD = 'L'                         
               MOVE 'Y'         TO W-LEGG-MASON-FUND-SW                         
               ADD 1 TO W-LEGG-CNT                                              
      *********DISPLAY '   THIS IS A LEGG-MASON PROPRIETARY FUND'               
      *********        ' ' WK-MS-SYMBOL                                         
           ELSE                                                                 
               MOVE 'N'         TO W-LEGG-MASON-FUND-SW                         
           END-IF.                                                              
                                                                                
           IF REG-OP-HOUSE-ACCT > SPACES                                        
              MOVE REG-OP-HOUSE-ACCT     TO  NTW-HOUSE-ACCOUNT                  
              SET NTW-HOUSE-ACCT         TO  TRUE                               
           END-IF                                                               
                                                                                
           IF OMNIBUS-PROCESSING OF BNWREGOP-RECORD                             
               ADD 1 TO W-OMNIBUS-CNT                                           
      *********DISPLAY '   THIS IS AN OMNIBUS-PROCESSING FUND'                  
      *********        ' ' WK-MS-SYMBOL                                         
              SET NTW-OMNIBUS-ACCT       TO  TRUE                               
           END-IF.                                                              
                                                                                
           IF DST-DIRECT         OF BNWREGOP-RECORD                             
              ADD 1 TO W-DST-MFE-CNT                                            
              SET NTW-DST-MFE-ACCT TO TRUE                                      
           END-IF.                                                              
                                                                                
LRM018     IF PNC-SURPAS-PROCESSING OF BNWREGOP-RECORD                          
LRM018         ADD 1 TO W-PNC-SURPAS-CNT                                        
LRM018         SET NTW-PNC-SURPAS-ACCT TO TRUE                                  
LRM018     END-IF.                                                              
                                                                                
           IF TBL-MNT-SOURCE-NSCC                                               
              SET NTW-NSCCSRC-ACCT          TO  TRUE                            
           END-IF.                                                              
                                                                                
LRM030     IF TBL-MNT-SOURCE-SHWB                                               
LRM030        DISPLAY 'HAVE SHWB ON TBL MAINT ' CUSHOL-CPH-CUSIP                
LRM030        SET NTW-SHWB-ACCT          TO  TRUE                               
LRM030     END-IF.                                                              
       5920-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5930-GET-BNWMAST-INFO.                                                   
                                                                                
           MOVE ' '                      TO W-BNWMAST-FND-SW                    
           MOVE SPACES                   TO W-BNWMAST-KEY                       
           MOVE ZEROES                   TO W-BNWMAST-ACCT-ID                   
           MOVE CUSHOL-CLIENT-N          TO W-BNWMAST-CLT-NO                    
                                            W-BNWMAST-CLT                       
           MOVE CUSHOL-CPH-CUSIP         TO W-BNWMAST-CUSIP                     
           MOVE CUSHOL-BRANCH            TO W-BNWMAST-BRN-3                     
           MOVE CUSHOL-ACCOUNT           TO W-BNWMAST-ACCT-5                    
           MOVE CUSHOL-ACCOUNT-TYPE      TO W-BNWMAST-TYPE                      
           MOVE 0                        TO W-BNWMAST-PAYABLE-SEQ-NO            
                                                                                
           MOVE W-CKDIGIT-CK             TO W-BNWMAST-CHK                       
                                                                                
           MOVE SPACES                   TO BNWMAST-REC                         
           MOVE W-BNWMAST-KEY            TO MAST-KEY-AREA                       
                                                                                
           READ BNWMAST.                                                        
                                                                                
           ADD 1 TO W-BNWMAST-CNT                                               
                                                                                
           IF  BNWMAST-OKAY                                                     
               MOVE 'Y'               TO W-BNWMAST-FND-SW                       
               ADD 1 TO W-BNWMAST-FND-CNT                                       
               DISPLAY         '   BNWMAST-FND'                                 
                               ' FOR ' MAST-KEY-AREA                            
                                   ' LEVEL=' MATRIX-LEVEL                       
           ELSE                                                                 
               IF BNWMAST-END-OF-FILE                                           
               OR BNWMAST-NOT-FOUND                                             
                  MOVE 'N'                 TO W-BNWMAST-FND-SW                  
                  DISPLAY         '   BNWMAST--NOTFND'                          
                              ' FOR ' MAST-KEY-AREA                             
               ELSE                                                             
                  DISPLAY ' ** CAT518 - BNWMAST FILE, READ ERROR'               
                          ' FILE-STATUS = ' BNWMAST-STATUS                      
                  DISPLAY 'MAST-KEY-AREA = ' MAST-KEY-AREA                      
                  MOVE +3999    TO ABEND-CODE                                   
                  CALL ABEND USING ABEND-CODE                                   
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5930-EXIT.                                                               
           EXIT.                                                                
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
LRM018     IF  PROCESSING-CODE OF BNWREGOP-RECORD = 'O' OR 'P'                  
               CONTINUE                                                         
           ELSE                                                                 
             IF W-BNWMAST-FOUND                                                 
               IF (MATRIX-LEVEL = '1' OR '2' OR '3' OR '4')                     
DJ0005          IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                              
DJ0005            MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
DJ0005                                      TO FNBR OF DCLACTIMF (1:3)          
DJ0005            MOVE W-CKDIGIT-ACCT-TC-1  TO FNBR OF DCLACTIMF (4:10)         
DJ0005          ELSE                                                            
DJ0005            MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
DJ0005                                      TO FNBR OF DCLACTIMF (1:3)          
DJ0005            MOVE W-CKDIGIT-ACCT-TC    TO FNBR OF DCLACTIMF (4:10)         
DJ0005          END-IF                                                          
               ELSE                                                             
                 IF MATRIX-LEVEL = '6'                                          
                    MOVE CUST-ACCT-NO       TO FNBR OF DCLACTIMF                
                 END-IF                                                         
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
           IF  FNBR OF DCLACTIMF = ' '                                          
DJ0005         IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                               
DJ0005            MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
DJ0005                                      TO FNBR OF DCLACTIMF (1:3)          
DJ0005            MOVE W-CKDIGIT-ACCT-TC-1  TO FNBR OF DCLACTIMF (4:10)         
DJ0005         ELSE                                                             
                  MOVE CLIENT-NBR OF DCLACTIAST (2:3)                           
                                            TO FNBR OF DCLACTIMF (1:3)          
                  MOVE W-CKDIGIT-ACCT-TC    TO FNBR OF DCLACTIMF (4:10)         
DJ0005         END-IF                                                           
           END-IF.                                                              
                                                                                
      ***FUND ACCOUNT NUMBER                                                    
      ***B1#434608 1 = BBBAAAAATC                                               
           IF  BH-ACAT-MF-REG-FUND-ACCT = '1'                                   
DJ0005         IF BH-MF-SINGLE-FUND-ACCOUNT = '1'                               
DJ0005            MOVE W-CKDIGIT-ACCT-TC-1  TO FNBR OF DCLACTIMF (1:10)         
DJ0005         ELSE                                                             
                  MOVE W-CKDIGIT-ACCT-TC    TO FNBR OF DCLACTIMF (1:10)         
DJ0005         END-IF                                                           
           END-IF.                                                              
                                                                                
      ***BOOK/PHYSICAL SHARE INDICATOR -                                        
      ***BK-PHSCL-SHR-CD - DEFAULT = 1                                          
           MOVE '1'                    TO BK-PHSCL-SHR-CD OF DCLACTIMF          
           IF  NTW-HOUSE-ACCOUNT = ' '                                          
             IF W-BNWMAST-FOUND                                                 
               IF  MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'                      
                   MOVE '0'            TO BK-PHSCL-SHR-CD OF DCLACTIMF          
               END-IF                                                           
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
             END-IF                                                             
           END-IF.                                                              
                                                                                
      ***ACCOUNT TYPE INDICATOR -                                               
      ***ACCT-TYPE-CD    - DEFAULT = 1                                          
           MOVE  '1'                    TO ACCT-TYPE-CD   OF DCLACTIMF          
           IF  NTW-HOUSE-ACCOUNT NOT = ' '                                      
LRM030     OR NTW-SHWB-ACCT                                                     
               MOVE  '2'                TO ACCT-TYPE-CD   OF DCLACTIMF          
           ELSE                                                                 
             IF W-BNWMAST-FOUND                                                 
               IF  MATRIX-LEVEL = '3'                                           
                   MOVE  '2'            TO ACCT-TYPE-CD   OF DCLACTIMF          
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
      ***DIVIDEND CODE -                                                        
      ***DVDND-CD      -  DEFAULT = 1 = R,R,R                                   
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
           END-IF.                                                              
                                                                                
      ***DIVIDEND PAYEE INDICATOR -                                             
      ***DVDND-PAYEE-CD  - DEFAULT = N                                          
           MOVE 'N'                     TO DVDND-PAYEE-CD OF DCLACTIMF          
           IF  NTW-HOUSE-ACCOUNT NOT = ' '                                      
LRM030     OR NTW-SHWB-ACCT                                                     
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
             END-IF                                                             
           END-IF.                                                              
                                                                                
      ***EXECUTING BROKER -                                                     
DJ0013***BRKR-EXCTG-NBR: DEFAULT=BH-ACAT-MF-REGIST-RECEIVE-BKR(434636)          
DJ0013***BH-MF-EXBR-OPTION = '1', USE MFEXBR FILE                               
DJ0013***PROCESSING CODE = 'O', USE B1 434636.                                  
DJ0013***ELSE,USE B1 540167.IF NOT ON B1 540167, USE B1 434636                  
DJ0013     MOVE 'N'                    TO W-MFEXBR-FND-SW                       
DJ0013     IF BH-MF-EXBR-OPTION = '1'                                           
DJ0013         PERFORM 5951-GET-MFEXBR THRU 5951-EXIT                           
DJ0013         IF W-MFEXBR-FND-SW = 'Y'                                         
DJ0013            MOVE EXBR-EXECUTING-BROKER                                    
DJ0013                                 TO BRKR-EXCTG-NBR OF DCLACTIMF           
DJ0013         END-IF                                                           
DJ0013     END-IF                                                               
DJ0013     IF W-MFEXBR-FND-SW = 'N'                                             
             MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                            
                                        TO BRKR-EXCTG-NBR OF DCLACTIMF          
             IF BH-ACAT-MF-REGIST-RECEIVE-BKR > '0000'                          
                MOVE BH-ACAT-MF-REGIST-RECEIVE-BKR                              
                                        TO BRKR-EXCTG-NBR OF DCLACTIMF          
             END-IF                                                             
LRM018       IF PROCESSING-CODE OF BNWREGOP-RECORD = 'O' OR 'P'                 
                CONTINUE                                                        
             ELSE                                                               
               MOVE CUSHOL-BRANCH            TO WK-BR                           
               PERFORM 5950-GET-EXEC-BRKR    THRU 5950-EXIT                     
               IF  W-BH-MF3-SEBR-CLEAR-FOUND                                    
                   MOVE W-BH-MF3-SEBR-CLEAR                                     
                                        TO BRKR-EXCTG-NBR OF DCLACTIMF          
               END-IF                                                           
             END-IF                                                             
DJ0013     END-IF.                                                              
LRM030     IF NTW-SHWB-ACCT                                                     
LRM030        MOVE '0164'               TO BRKR-EXCTG-NBR OF DCLACTIMF          
LRM030     END-IF.                                                              
                                                                                
      ***FULL/PARTIAL -                                                         
DJ0003***MF-FULL-PRTL-CD - DEFAULT= 2 FOR PARTIAL                               
           MOVE '2'                TO MF-FULL-PRTL-CD    OF DCLACTIMF.          
                                                                                
      ***OVERRIDES FOR O-NSCC:                                                  
           IF NTW-DST-MFE-ACCT                                                  
             AND (WS-DST-BOX-ACCT-TC NOT = SPACE AND LOW-VALUE)                 
LRM030       AND NOT NTW-SHWB-ACCT                                              
             DISPLAY 'APPLY O-NSCC B1 537601 TO FNBR: '                         
                      WS-DST-BOX-ACCT-TC                                        
DJ0005       MOVE CLIENT-NBR OF DCLACTIAST (2:3)                                
                                     TO FNBR OF DCLACTIMF (1:3)                 
             MOVE WS-DST-BOX-ACCT-TC TO FNBR OF DCLACTIMF (4: )                 
             MOVE '0'                TO BK-PHSCL-SHR-CD OF DCLACTIMF            
             MOVE '3'                TO NTWRK-CNTL-CD  OF DCLACTIMF             
           ELSE                                                                 
LRM018     IF NTW-PNC-SURPAS-ACCT                                               
LRM018       IF W-BNWMAST-FOUND                                                 
LRM018       AND MATRIX-LEVEL = '6'                                             
LRM018       AND (WS-PNC-SURPAS-BOX-TC NOT = SPACE AND LOW-VALUE)               
LRM018          DISPLAY 'APPLY O-NSCC B1 540238 TO FUND NBR: '                  
LRM018                   WS-PNC-SURPAS-BOX-TC                                   
LRM018          MOVE CLIENT-NBR OF DCLACTIAST (2:3)                             
LRM018                                    TO FNBR OF DCLACTIMF (1:3)            
LRM018          MOVE WS-PNC-SURPAS-BOX-TC TO FNBR OF DCLACTIMF (4: )            
LRM018       END-IF                                                             
LRM018       MOVE '0'                TO BK-PHSCL-SHR-CD OF DCLACTIMF            
LRM018       MOVE '3'                TO NTWRK-CNTL-CD  OF DCLACTIMF             
LRM018       IF TBL-TENDER                                                      
LRM018          MOVE 'C'    TO DVDND-CD OF DCLACTIMF                            
LRM018          MOVE 'C'    TO LTCG-CD  OF DCLACTIMF                            
LRM018          MOVE 'C'    TO STCG-CD  OF DCLACTIMF                            
LRM018       ELSE                                                               
LRM018          MOVE 'R'    TO DVDND-CD OF DCLACTIMF                            
LRM018          MOVE 'R'    TO LTCG-CD  OF DCLACTIMF                            
LRM018          MOVE 'R'    TO STCG-CD  OF DCLACTIMF                            
LRM018       END-IF                                                             
LRM018       MOVE  '2'            TO ACCT-TYPE-CD     OF DCLACTIMF              
LRM018       MOVE  '1'            TO DVDND-PAYEE-CD   OF DCLACTIMF              
LRM018       MOVE  '2'            TO MF-FULL-PRTL-CD  OF DCLACTIMF              
LRM018     ELSE                                                                 
           IF     NTW-NSCCSRC-ACCT                                              
             AND (NS-BRCH-ACCT-TC NOT = SPACE AND LOW-VALUE)                    
             DISPLAY 'APPLY O-NSCC B1 537596 TO FNBR: '                         
                      NS-BRCH-ACCT-TC                                           
DJ0005       MOVE CLIENT-NBR OF DCLACTIAST (2:3)                                
                                    TO FNBR OF DCLACTIMF (1:3)                  
             MOVE NS-BRCH-ACCT-TC   TO FNBR OF DCLACTIMF (4: )                  
             MOVE '0'               TO BK-PHSCL-SHR-CD OF DCLACTIMF             
             MOVE '3'               TO NTWRK-CNTL-CD  OF DCLACTIMF              
           END-IF.                                                              
                                                                                
LRM030     IF NTW-SHWB-ACCT                                                     
LRM030        DISPLAY 'SHWB FUND/FNBR LOOKUP ' CUSHOL-CPH-CUSIP                 
LRM030        DISPLAY '  MATRIX=' MATRIX-LEVEL                                  
LRM030                ' WAIVE-ACCT=' TBL-WAIVE-ACCT                             
LRM030                ' HOUSE-ACCOUNT=' REG-OP-HOUSE-ACCT                       
LRM030        DISPLAY '  WRAP-ACCT MUST BE 5,HAVE ' NAV-ACCT-INDICATOR          
LRM030        IF MATRIX-LEVEL = '3'                                             
LRM030           DISPLAY '  MATRIX=3, USE LEVEL3 VALUES '                       
LRM030                FNBR OF DCLACTIMF                                         
LRM030        ELSE                                                              
LRM030        IF NAV-WRAP-FEE-ACCOUNT                                           
LRM030          IF TBL-WAIVE-ACCT > SPACES                                      
LRM030          AND MATRIX-LEVEL = '6'                                          
LRM030             MOVE TBL-WAIVE-ACCT       TO FNBR OF DCLACTIMF               
LRM030             DISPLAY '  RULE1 WAIVE ACCOUNT FOR FNBR'                     
LRM030          ELSE                                                            
LRM030             IF REG-OP-HOUSE-ACCT > SPACES                                
LRM030                MOVE REG-OP-HOUSE-ACCT    TO FNBR OF DCLACTIMF            
LRM030                DISPLAY '  RULE2 HOUSE ACCOUNT FOR FNBR/NO WAIVE'         
LRM030             END-IF                                                       
LRM030        ELSE                                                              
LRM030        IF REG-OP-HOUSE-ACCT > SPACES                                     
LRM030           MOVE REG-OP-HOUSE-ACCT    TO FNBR OF DCLACTIMF                 
LRM030           DISPLAY '  RULE3 HOUSE ACCOUNT FOR FNBR/NON WAIVE'             
LRM030        ELSE                                                              
LRM030        IF TBL-WAIVE-ACCT > SPACES                                        
LRM030           MOVE TBL-WAIVE-ACCT       TO FNBR OF DCLACTIMF                 
LRM030            DISPLAY '  RULE4 WAIVE ACCOUNT FOR FNBR/NO HOUSE'             
LRM030     END-IF.                                                              
                                                                                
LRM030     IF NTW-SHWB-ACCT                                                     
LRM030       MOVE '1'               TO BK-PHSCL-SHR-CD OF DCLACTIMF             
LRM030       MOVE '3'               TO NTWRK-CNTL-CD  OF DCLACTIMF              
LRM030       MOVE 'S'               TO ACCT-TYPE-STTS-CD OF DCLACTIMF           
LRM033       MOVE '1'               TO FND-AGNT-CD    OF DCLACTIMF              
LRM030     END-IF.                                                              
                                                                                
           MOVE ACAT-CONTROL-NBR   OF DCLACTIAST                                
                                   TO ACAT-CONTROL-NBR   OF DCLACTIMF           
           MOVE ASSET-SEQ-NBR      OF DCLACTIAST                                
                                   TO ASSET-SEQ-NBR      OF DCLACTIMF           
           MOVE TRNFR-TYPE-CD      OF DCLACTIAST                                
                                   TO TRNFR-TYPE-CD      OF DCLACTIMF           
           MOVE ' '                TO FCST-ACCT-RCVR-NBR OF DCLACTIMF.          
                                                                                
       5940-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
DJ0013*****************************************************************         
DJ0013*  USE THE EXECUTING BROKER NUMBER(BH-MF3-SEBR-CLEAR) FROM                
DJ0013*  B1 540167 = MF3 SUB-EXECUTOR,BKR OF RECORD.                            
DJ0013*  SEARCH USING THE BRANCH NUMBER OF THE ACCOUNT.                         
DJ0013*****************************************************************         
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
                                                                                
DJ0013*****************************************************************         
DJ0013*  IF B1 537483(BH-MF-EXBR-OPTION)=1                                      
DJ0013*  GET THE EXECUTING BROKER NUMBER FROM THE MFEXBR FILE.                  
DJ0013*  USE THE FUND NUMBER FROM MFMSD TO READ THE MFEXBR FILE.                
DJ0013*****************************************************************         
DJ0013 5951-GET-MFEXBR.                                                         
DJ0013     MOVE '5951-GET-MFEXBR               ' TO W-ROUTINE-1.                
DJ0013                                                                          
DJ0013     IF W-MFMSD-FND-SW = 'Y'                                              
DJ0013        MOVE ' '                   TO MFEXBR-REC                          
DJ0013        MOVE WF-CLIENT-NBR (2:3)   TO EXBR-CLIENT                         
DJ0013        MOVE WF-BRANCH-CD          TO EXBR-BRANCH                         
DJ0013        MOVE FUND-NO OF MFMSD-REC  TO EXBR-FUND-NO                        
DJ0013        ADD 1 TO W-MFEXBR-CNT                                             
DJ0013        READ MFEXBR                                                       
DJ0013        IF MFEXBR-STATUS = '00'                                           
DJ0013           ADD 1 TO W-MFEXBR-FND-CNT                                      
DJ0013           MOVE 'Y'                TO W-MFEXBR-FND-SW                     
DJ0013           DISPLAY '   MFEXBR FND: ' EXBR-CLIENT                          
DJ0013                          ' BRANCH ' EXBR-BRANCH                          
DJ0013                         ' FUND-NO ' EXBR-FUND-NO                         
DJ0013              ' EXECUTING-BROKER = ' EXBR-EXECUTING-BROKER                
DJ0013        END-IF                                                            
DJ0013     END-IF.                                                              
DJ0013                                                                          
DJ0013 5951-EXIT.                                                               
DJ0013     EXIT.                                                                
      /                                                                         
           EXIT.                                                                
      *****************************************************************         
      * MOVE DCLACTIAST DATA TO ACATPTRF LAYOUT                                 
      *****************************************************************         
       6000-CREATE-ACTIAST.                                                     
           MOVE '6000-CREATE-ACTIAST           ' TO W-ROUTINE-1.                
           MOVE ' '                           TO AST-RECORD                     
           INITIALIZE                            AST-GOT-DATA                   
           MOVE W-NSCC-KEY-CLIENT-NBR         TO AST-KEY-CLIENT-NBR             
           MOVE '2'                           TO AST-KEY-SORT-ID                
           MOVE WF-ACCT-DLVR-NBR(1:8)         TO AST-KEY-ACCT-NBR(1:8)          
           MOVE W-NSCC-ACAT-CTL-NBR           TO AST-KEY-ACAT-CTL-NBR           
           SET  AST-KEY-REC-TYPE-IS-AT        TO TRUE                           
           MOVE SECURITY-ADP-NBR OF DCLACTIAST                                  
                                             TO AST-KEY-SECURITY-ADP-NBR        
DJ0009*****SORT WHEN-ISSUE(I) BEFORE REGULAR SECURITY(N) SEQUENTIALLY           
DJ0009     IF WHI-CD OF DCLACTIAST = 'W'                                        
DJ0009        MOVE 'I'                       TO AST-KEY-WHI-CD                  
LRM026     ELSE                                                                 
TEST****   IF WORK-WHOLD-MEMO-QTY NOT NUMERIC                                   
TEST****      DISPLAY 'WHOLD NOT NUMERIC - SOC7 PREVENT'                        
TEST****      MOVE ZEROS TO WORK-WHOLD-MEMO-QTY                                 
TEST****   END-IF                                                               
LRM026     IF WORK-WHOLD-MEMO-QTY NOT = ZERO                                    
TEST          DISPLAY 'FORCING X ' WORK-WHOLD-MEMO-QTY                          
LRM026        MOVE 'X'                       TO AST-KEY-WHI-CD                  
           ELSE                                                                 
DJ0009        MOVE 'N'                       TO AST-KEY-WHI-CD                  
           END-IF                                                               
           MOVE PSTN-CD          OF DCLACTIAST                                  
                                             TO AST-KEY-POS-CD                  
                                                                                
           IF (STTLM-LCTN-CD OF DCLACTIAST  = '40' AND                          
              (STTLM-RSN-CD  OF DCLACTIAST  = 'CRED' OR 'DEB'))                 
               MOVE ' '           TO AST-KEY-SECURITY-ADP-NBR(1:1)              
               MOVE STTLM-LCTN-CD OF DCLACTIAST                                 
                                  TO AST-KEY-SECURITY-ADP-NBR(2:2)              
               MOVE STTLM-RSN-CD OF DCLACTIAST                                  
                                  TO AST-KEY-SECURITY-ADP-NBR(4:4)              
               MOVE ' '                      TO AST-KEY-POS-CD                  
           END-IF                                                               
                                                                                
           IF (STTLM-LCTN-CD OF DCLACTIAST  = '45' AND                          
              (STTLM-RSN-CD  OF DCLACTIAST  = 'SMA'))                           
               MOVE ' '           TO AST-KEY-SECURITY-ADP-NBR(1:1)              
               MOVE STTLM-LCTN-CD OF DCLACTIAST                                 
                                  TO AST-KEY-SECURITY-ADP-NBR(2:2)              
               MOVE STTLM-RSN-CD OF DCLACTIAST                                  
                                  TO AST-KEY-SECURITY-ADP-NBR(4:4)              
           END-IF                                                               
                                                                                
           MOVE CSH-MGN-SHRT-CD  OF DCLACTIAST                                  
                                             TO AST-KEY-CASH-MRGN-SHTCD         
           MOVE ASSET-QTY OF DCLACTIAST                                         
                                             TO AST-KEY-ASSET-QTY               
           MOVE ASSET-PCT OF DCLACTIAST                                         
                                             TO AST-KEY-ASSET-PCT               
           MOVE ASSET-AMT OF DCLACTIAST                                         
                                             TO AST-KEY-ASSET-AMT               
           MOVE ASSET-PRC-CTGY-CD OF DCLACTIAST                                 
                                            TO AST-KEY-ASSET-PRC-CTGY-CD        
           MOVE STTLM-LCTN-CD     OF DCLACTIAST                                 
                                            TO AST-KEY-STTLM-LCTN-CD            
           MOVE STTLM-RSN-CD      OF DCLACTIAST                                 
                                            TO AST-KEY-STTLM-RSN-CD             
                                                                                
LRM021     MOVE W-ASSET-CMNT-TXT TO ASSET-CMNT-TXT OF DCLACTIAST                
           MOVE DCLACTIAST                    TO AST-AT-PART.                   
           ADD 1 TO W-ACTIAST-CREATE-CNT.                                       
                                                                                
       6000-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      * MOVE DCLACTIOPN DATA TO ACATPTRF LAYOUT                                 
      *****************************************************************         
       6100-CREATE-ACTIOPN.                                                     
           MOVE '6100-CREATE-ACTIOPN            ' TO W-ROUTINE-1.               
           MOVE DCLACTIOPN            TO AST-OP-PART                            
LRM025*****MOVE AST-OP-SYM-CD         TO AST-KEY-OP-SYM-CD                      
LRM025*****MOVE AST-OP-PTCL-CD        TO AST-KEY-OP-PTCL-CD                     
           ADD 1 TO W-ACTIOPN-CREATE-CNT.                                       
                                                                                
       6100-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      * MOVE DCLACTIMF  DATA TO ACATPTRF LAYOUT                                 
      *****************************************************************         
       6200-CREATE-ACTIMF.                                                      
           MOVE '6200-CREATE-ACTIMF              ' TO W-ROUTINE-1.              
           MOVE DCLACTIMF                 TO AST-MF-PART                        
           ADD 1 TO W-ACTIMF-CREATE-CNT.                                        
                                                                                
       6200-EXIT. EXIT.                                                         
                                                                                
      /                                                                         
      *****************************************************************         
      * WRITE ASSET RECORDS - RELEASE ACATPTRF DATA TO SORT                     
      *****************************************************************         
       6300-RELEASE-ACATPTRF.                                                   
                                                                                
LRM036     IF  STTLM-LCTN-CD OF DCLACTIAST = '35' OR '40' OR '45'               
               CONTINUE                                                         
           ELSE                                                                 
               IF  ISIN-SEC-ISSUE-CD OF DCLACTIAST > ' '                        
               AND CUSHOL-CPH-CUSIP (10:3)       = '090'                        
               AND BH-ACAT-WH-ASSET-ON-CONTR-CUS = '1'                          
                   MOVE 'W'          TO NSCC-WTHLD-CD OF DCLACTIAST             
LRM036             MOVE 'C'          TO WHI-STTS-CD   OF DCLACTIAST             
                   DISPLAY '   BH-ACAT-WH-ASSET-ON-CONTR-CUS=1 '                
                              'WITHHELD-CUSIP=090'                              
               END-IF                                                           
           END-IF                                                               
                                                                                
      **--DO NOT SEND WITHHELD ASSETS TO NSCC IF B1#434713 IS ON.               
           IF  NSCC-WTHLD-CD OF DCLACTIAST = 'W'                                
           AND BH-ACAT-MEMO-ASSETS-FOR-PTR = '1'                                
               MOVE 'H'          TO NSCC-PEND-CD  OF DCLACTIAST                 
               DISPLAY '   BH-ACAT-MEMO-ASSETS-FOR-PTR=1 HOLD WITHHELD'         
           END-IF                                                               
                                                                                
           MOVE ASSET-DESC-TXT OF DCLACTIAST TO W-TXT                           
           PERFORM VARYING W-SUB1 FROM 1 BY 1 UNTIL W-SUB1 > 140                
                  EVALUATE W-TXT-BYTE (W-SUB1)                                  
                      WHEN '~'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
                      WHEN '_'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
                      WHEN '`'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
                      WHEN '{'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
                      WHEN '}'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
                      WHEN '|'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
                      WHEN '^'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
                      WHEN ''   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
                      WHEN '\'   MOVE ' ' TO W-TXT-BYTE (W-SUB1)                
                  END-EVALUATE                                                  
           END-PERFORM                                                          
           MOVE W-TXT TO ASSET-DESC-TXT OF DCLACTIAST                           
LRM005     MOVE W-ASSET-CMNT-TXT TO ASSET-CMNT-TXT OF DCLACTIAST                
                                                                                
      ***SAVE FRACTIONS AND MARKET VALUE                                        
           IF W-REMOVE-FRACTION-SW = 'Y'                                        
             MOVE W-REMOVE-FRACTION-SW TO AST-REMOVE-FRACTION-IND               
             MOVE WORK-POS-QTY-DECIMAL TO AST-FRAC-QTY                          
             COMPUTE AST-FRAC-MARKET-VALUE ROUNDED =                            
                             WORK-POS-QTY-DECIMAL * WK-MS-CLOSING-PRICE         
             IF  WK-MS-BOND                                                     
                     AND AST-FRAC-MARKET-VALUE NOT = 0                          
                 COMPUTE AST-FRAC-MARKET-VALUE =                                
                         AST-FRAC-MARKET-VALUE / 100                            
             END-IF                                                             
           END-IF                                                               
                                                                                
           MOVE W-ASSET-FLAGS        TO AST-FLAGS                               
           ADD  1                    TO W-RELEASE-CNT                           
           MOVE AST-RECORD           TO SORT-RECORD                             
LRM026     DISPLAY 'ABOUT TO REL SORT-REC '                                     
LRM026       'KEY-QTY='  AST-KEY-ASSET-QTY                                      
             ' QTY-LEFT='  AST-KEY-ASSET-QTY-LEFT                               
             ' GOT-QY=' AST-GOT-ASSET-QTY                                       
LRM026***  IF AST-KEY-REC-TYPE-IS-TI                                            
LRM026     IF AST-KEY-REC-TYPE-IS-AT                                            
LRM026        DISPLAY 'REL AT-QTY='  AST-AT-ASSET-QTY                           
LRM026     END-IF.                                                              
           RELEASE SORT-RECORD                                                  
           MOVE ' '                  TO W-ASSET-FLAGS                           
           .                                                                    
       6300-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      * WRITE REQUEST RECORDS - RELEASE ACATPTRR DATA TO SORT                   
      *****************************************************************         
       6400-RELEASE-ACATPTRR.                                                   
                                                                                
           MOVE W-REJECT-SW              TO REQ-FLAGS                           
                                                                                
           ADD  1                        TO W-RELEASE-CNT.                      
           MOVE REQ-RECORD               TO SORT-RECORD                         
           RELEASE SORT-RECORD.                                                 
                                                                                
       6400-EXIT. EXIT.                                                         
      /                                                                         
CSG001 6500-EDIT-ASSET-DESC-TXT.                                                
CSG001* MOVE SPACES FOR THE SPECIAL CHARACTERS FOUND IN ASSET-DESC-TXT.         
CSG001* AND LEFT JUSTIFY THE FIRST DESCRIPTION IF FIRST CHAR IS SPACE           
CSG001* AFTER EDITED.                                                           
CSG001     MOVE SPACES                 TO W-EDIT-ASSET-DESC-TXT-FLAG            
CSG001     PERFORM                                                              
CSG001         VARYING W-SUB2 FROM 1 BY 1                                       
CSG001           UNTIL W-SUB2 > 140                                             
CSG001         MOVE W-ASSET-DESC-TXT(W-SUB2:1)    TO W-EDIT-CHAR-AREA2          
CSG001         IF NOT W-VALID-CHARACTER2                                        
CSG001            MOVE SPACES           TO W-ASSET-DESC-TXT(W-SUB2:1)           
CSG001            SET W-EDIT-ASSET-DESC-TXT-Y     TO TRUE                       
CSG001         END-IF                                                           
CSG001     END-PERFORM                                                          
CSG001*                                                                         
CSG001     IF W-EDIT-ASSET-DESC-TXT-Y AND                                       
CSG001        W-ASSET-DESC1-TXT(1:1) = SPACES                                   
CSG001        SET W-JUST-LEFT-NOT-DONE       TO TRUE                            
CSG001        PERFORM                                                           
CSG001          VARYING W-SUB2 FROM 2 BY 1                                      
CSG001            UNTIL W-SUB2 > 30 OR W-JUST-LEFT-DONE                         
CSG001          IF W-ASSET-DESC1-TXT(W-SUB2 : 1) NOT = SPACES           03760002
CSG001             MOVE SPACES               TO W-ASSET-DESC-TMP                
CSG001             MOVE W-ASSET-DESC1-TXT(W-SUB2 : ) TO W-ASSET-DESC-TMP03760002
CSG001             MOVE W-ASSET-DESC-TMP     TO W-ASSET-DESC1-TXT               
CSG001             SET W-JUST-LEFT-DONE      TO TRUE                    03760002
CSG001          END-IF                                                  03760002
CSG001        END-PERFORM                                               03760002
CSG001     END-IF                                                       03760002
CSG001           .                                                      03760002
CSG001 6500-EXIT. EXIT.                                                         
CSG001/                                                                         
*******  BOTH REQUESTS AND ASSETS ARE ON THE SORT FILE                          
*******  THEY ARE TWO DIFFERENT RECORD LAYOUTS                                  
*******  REQUESTS COME FIRST, THEN THE RELATED ASSETS                           
*******  LOAD REQUESTS FOR ONE SECURITY/CASH TO A TABLE                         
*******  LOAD ASSETS   FOR SAME SECURITY TO A TABLE                             
*******  MATCH UP THE ASSETS TO THE REQUEST                                     
       7000-SORT-OUTPUT.                                                        
           MOVE '7000-SORT-OUTPUT              ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' ' TO W-ASSET-ADDED-FOR-ACCT-SW                                
           MOVE ' ' TO W-ASSET-LESS-THAN-REQ-SW                                 
           MOVE ' ' TO W-ASSET-ZERO-FOUND-SW                                    
           MOVE ' ' TO W-FULFILL-MSG-SW                                         
           MOVE ' ' TO W-REJECT-SW                                              
DJ0011     MOVE ' ' TO W-MEMO-ONLY-SW                                           
DJ0011     MOVE 0   TO W-NOT-MEMO-CNT                                           
DJ0011     MOVE 0   TO W-IS-MEMO-CNT                                            
                                                                                
           MOVE ' ' TO W-SAVE-RECORD                                            
           MOVE ' ' TO W-REQ-TABLE W-AST-TABLE                                  
           MOVE ' ' TO W-NOT-FIRST-TIME-SW                                      
           MOVE ' ' TO W-CURRENT-CLIENT                                         
           MOVE 0 TO IDXR IDXA                                                  
           PERFORM 7010-RETURN-SORT THRU 7010-EXIT                              
                                                                                
           PERFORM UNTIL END-OF-SORT                                            
                                                                                
*******-------AT ACCT/SEC BREAK, MATCHUP THE REQUEST AND ASSETS                 
DJ0009        IF (SORT-RECORD(1:35) NOT = W-REQ-TABLE(1:35))                    
              AND W-NOT-FIRST-TIME-SW = 'Y'                                     
                 PERFORM 7020-ACCT-SEC-BREAK THRU 7020-EXIT                     
                                                                                
*******----------AT CONTROL NUMBER BREAK                                        
                 IF (SORT-RECORD(1:26) NOT = W-SAVE-RECORD(1:26))               
                    PERFORM 7030-CONTROL-BREAK THRU 7030-EXIT                   
                 END-IF                                                         
                 MOVE ' ' TO W-REQ-TABLE W-AST-TABLE                            
                 MOVE 0 TO IDXR IDXA                                            
              END-IF                                                            
                                                                                
              IF  SORT-KEY-SORT-ID = '1'                                        
                  PERFORM 7100-LOAD-REQ-TABLE THRU 7100-EXIT                    
              ELSE                                                              
                  PERFORM 7110-LOAD-AST-TABLE THRU 7110-EXIT                    
              END-IF                                                            
              MOVE 'Y' TO W-NOT-FIRST-TIME-SW                                   
              PERFORM 7010-RETURN-SORT THRU 7010-EXIT                           
           END-PERFORM.                                                         
                                                                                
*******----DO THE LAST SECURITY BREAK AND CONTROL NUMBER BREAK                  
           PERFORM 7020-ACCT-SEC-BREAK THRU 7020-EXIT                           
           PERFORM 7030-CONTROL-BREAK  THRU 7030-EXIT                           
           .                                                                    
       7000-EXIT. EXIT.                                                         
      /                                                                         
*******  BOTH REQUESTS AND ASSETS ARE ON THE SORT FILE                          
*******  THEY ARE TWO DIFFERENT RECORD LAYOUTS                                  
*******  REQUESTS COME FIRST, THEN THE RELATED ASSETS                           
       7010-RETURN-SORT.                                                        
                                                                                
           RETURN SORT-FILE                                                     
               AT END                                                           
                     MOVE '1'            TO END-OF-SORT-SW                      
                     DISPLAY 'CAT518: SORT-EOF '                                
                                    ' RET=' W-RETURN-CNT                        
                     GO TO 7010-EXIT.                                           
                                                                                
           ADD  1                        TO W-RETURN-CNT.                       
                                                                                
       7010-EXIT. EXIT.                                                         
      /                                                                         
       7020-ACCT-SEC-BREAK.                                                     
           MOVE '7020-ACCT-SEC-BREAK.          ' TO W-ROUTINE-1.                
DJ0009     IF W-REQ-TABLE(1:35) > ' '                                           
              PERFORM 7200-MATCH-REQ-AST THRU 7200-EXIT                         
           END-IF                                                               
           .                                                                    
       7020-EXIT. EXIT.                                                         
      /                                                                         
       7030-CONTROL-BREAK.                                                      
           MOVE '7030-CONTROL-BREAK.           ' TO W-ROUTINE-1.                
                                                                                
           IF W-SAVE-KEY-CLIENT-NBR   NOT = W-CURRENT-CLIENT                    
              MOVE W-SAVE-KEY-CLIENT-NBR TO W-CURRENT-CLIENT                    
              PERFORM 7035-GETB1 THRU 7035-EXIT                                 
           END-IF                                                               
                                                                                
DJ0011***REJECT IF THERE IS ONLY MEMO ASSETS, REJECT.                           
DJ0011***COMMENT SHOULD BE: "MEMO ONLY - RESTRICTED ASSET".                     
DJ0011     IF  W-SAVE-RECORD(1:26) > ' '                                        
DJ0011      IF  (W-NOT-MEMO-CNT    = 0)                                         
DJ0011      AND (W-IS-MEMO-CNT NOT = 0)                                         
DJ0011          MOVE 'Y' TO W-MEMO-ONLY-SW                                      
DJ0011          MOVE ' ' TO W-FULFILL-MSG-SW                                    
DJ0011          SET W-SEC-NONE-FOUND TO TRUE                                    
DJ0011          MOVE ' ' TO W-ASSET-ADDED-FOR-ACCT-SW                           
DJ0011          MOVE ' ' TO W-ASSET-LESS-THAN-REQ-SW                            
DJ0011          MOVE 'Y' TO W-ASSET-ZERO-FOUND-SW                               
DJ0011       DISPLAY '   REJECTING ONLY: MEMO ONLY '                            
DJ0011                ' W-IS-MEMO-CNT=' W-IS-MEMO-CNT                           
DJ0011                ' W-NOT-MEMO-CNT=' W-NOT-MEMO-CNT                         
DJ0011      END-IF                                                              
DJ0011     END-IF                                                               
                                                                                
           IF  W-SAVE-RECORD(1:26) > ' '                                        
               DISPLAY '7030-CTRL-BRK: SAVE: ' W-SAVE-RECORD  (1:36)            
                           ' ADD='                                              
                             W-ASSET-ADDED-FOR-ACCT-SW                          
                           ' LESS='                                             
                             W-ASSET-LESS-THAN-REQ-SW                           
                           ' ZERO='                                             
                             W-ASSET-ZERO-FOUND-SW                              
               DISPLAY   '   FULFILLMENT RESULT:  SEC: FULL='                   
                             W-SEC-FULL-FOUND-SW                                
                           ' LESS='                                             
                             W-SEC-LESS-THAN-REQ-SW                             
                           ' ZERO='                                             
                             W-SEC-NONE-FOUND-SW                                
                          '  CASH: FULL='                                       
                             W-CSH-FULL-FOUND-SW                                
                           ' LESS='                                             
                             W-CSH-LESS-THAN-REQ-SW                             
                           ' ZERO='                                             
                             W-CSH-NONE-FOUND-SW                                
           ELSE                                                                 
               GO TO 7030-FINI                                                  
           END-IF                                                               
                                                                                
      **REJECT PTR IF REQUESTED ASSETS NOT FOUND                                
           IF  (W-ASSET-ADDED-FOR-ACCT-SW = ' ' AND                             
                W-ASSET-LESS-THAN-REQ-SW  = ' ' AND                             
                W-ASSET-ZERO-FOUND-SW     = 'Y')                                
                IF  BH-ACAT-PTR-REJECT-NO-ASSET = '1'                           
                    MOVE 'Y' TO W-FLAG-NOT-FULFILL                              
                    MOVE 'Y' TO W-REJECT-AUTO-SW                                
                    DISPLAY '   W-REJECT-AUTO-SW=Y'                             
                              ' BH-ACAT-PTR-REJECT-NO-ASSET=1'                  
                              ' W-ASSET-ZERO-FOUND-SW=Y'                        
                              ' W-FLAG-NOT-FULFILL=Y'                           
                END-IF                                                          
                                                                                
           ELSE                                                                 
            IF  (W-ASSET-LESS-THAN-REQ-SW = 'Y')                                
                IF  BH-ACAT-PTR-ASSETS = '1'                                    
                    MOVE 'Y' TO W-FLAG-NOT-FULFILL                              
                    MOVE 'Y' TO W-REJECT-AUTO-SW                                
                    DISPLAY '   W-REJECT-AUTO-SW=Y'                             
                              ' BH-ACAT-PTR-ASSETS=1'                           
                              ' W-ASSET-LESS-THAN-REQ-SW=Y'                     
                              ' W-FLAG-NOT-FULFILL=Y'                           
                ELSE                                                            
                    IF BH-ACAT-PTR-ASSETS = '3'                                 
                       MOVE 'Y' TO W-FLAG-NOT-FULFILL                           
                       DISPLAY '   BH-ACAT-PTR-ASSETS=3'                        
                                 ' W-ASSET-LESS-THAN-REQ-SW=Y'                  
                              ' W-FLAG-NOT-FULFILL=Y'                           
                       PERFORM 7760-UPDATE-HOLD        THRU 7760-EXIT           
                    END-IF                                                      
                END-IF                                                          
                                                                                
            ELSE                                                                
             IF W-ASSET-ADDED-FOR-ACCT-SW = 'Y'                                 
****************PERFORM 7800-WRITE-ACATDLVF-BALANCE THRU 7800-EXIT              
                CONTINUE                                                        
             ELSE                                                               
                IF  W-SAVE-B1-FLAT      = '1'                                   
                AND W-SAVE-B1-FLAT-CODE > '00'                                  
                MOVE 'Y' TO W-REJECT-AUTO-SW                                    
                DISPLAY '   W-REJECT-AUTO-SW=Y'                                 
                        ' W-SAVE-B1-FLAT-CODE= ' W-SAVE-B1-FLAT-CODE            
                        ' W-ASSET-ADDED-FOR-ACCT-SW='                           
                          W-ASSET-ADDED-FOR-ACCT-SW                             
                END-IF                                                          
             END-IF                                                             
            END-IF                                                              
           END-IF.                                                              
                                                                                
           PERFORM 7720-UPDATE-VTRNFR  THRU 7720-EXIT                           
                                                                                
           IF W-REJECT-AUTO-SW = 'Y'                                            
              PERFORM 7700-INSERT-ACTITRF THRU 7700-EXIT                        
              PERFORM 7750-DELETE-INIT-ASSETS THRU 7750-EXIT                    
           END-IF.                                                              
                                                                                
       7030-FINI.                                                               
           MOVE ' ' TO W-REJECT-AUTO-SW                                         
           MOVE ' ' TO W-REJECT-SW                                              
           MOVE ' ' TO W-ASSET-ADDED-FOR-ACCT-SW                                
           MOVE ' ' TO W-ASSET-LESS-THAN-REQ-SW                                 
           MOVE ' ' TO W-ASSET-ZERO-FOUND-SW                                    
           MOVE ' ' TO W-FULFILL-MSG-SW                                         
DJ0011     MOVE ' ' TO W-MEMO-ONLY-SW                                           
DJ0011     MOVE 0   TO W-NOT-MEMO-CNT                                           
DJ0011     MOVE 0   TO W-IS-MEMO-CNT                                            
           .                                                                    
       7030-EXIT. EXIT.                                                         
      /                                                                         
       7035-GETB1.                                                              
           MOVE '7035-GETB1.                   ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                        TO BH-BROKER-HEADER-INFO             
                                              BH-ACAT-INFO                      
                                              BH-BTS2-INFO                      
                                              BH-MF-INFO                        
                                                                                
           MOVE W-CURRENT-CLIENT (2:3)     TO BH-BROKER-NUMBER                  
           MOVE '015'                      TO BH-LOGICAL-RECORD-CODE            
           MOVE '434500'                   TO BH-B2-INFO-ID                     
           CALL GETB1V                  USING BH-BROKER-HEADER-INFO,            
                                              BH-ACAT-INFO                      
           END-CALL.                                                            
                                                                                
           DISPLAY '7035-GETB1 FOR CLT : ' BH-BROKER-NUMBER                     
                                       ' ' BH-BROKER-NAME                       
                               ' BRK-NO= ' BH-BROKER-OLD-CLEARING-HOUSE         
           DISPLAY '   BH-ACAT-PTR-REJECT-NO-ASSET (434715) = '                 
                       BH-ACAT-PTR-REJECT-NO-ASSET                              
                   ' 1=IF NO ASSET EXIST, REJECT WITH COMMENT.'                 
           DISPLAY '   BH-ACAT-PTR-ASSETS          (434716) = '                 
                       BH-ACAT-PTR-ASSETS                                       
                   ' 1=REJECT IF NOT ENOUGH ASSET. 2=FILL. 3=FILL-FLAG'         
           DISPLAY '   BH-ACAT-PTR-ASSETS-TYPE     (434717) = '                 
                       BH-ACAT-PTR-ASSETS-TYPE                                  
                   ' 0=USE REQUEST TYPE ONLY. 1=USE ALL TYPES.'                 
           .                                                                    
       7035-EXIT. EXIT.                                                         
      /                                                                         
       7100-LOAD-REQ-TABLE.                                                     
           MOVE '7100-LOAD-REQ-TABLE.          ' TO W-ROUTINE-1.                
                                                                                
           IF SORT-KEY-REC-TYPE-IS-TI                                           
              MOVE SORT-RECORD        TO W-SAVE-RECORD                          
              DISPLAY ' '                                                       
DJ0011        DISPLAY '7100: MATCH THE REQUEST/INSERT ASSETS FOR '              
DJ0011                 W-SAVE-KEY-CLIENT-NBR                                    
DJ0011             ' ' W-SAVE-KEY-ACCT-NBR                                      
DJ0011             ' ' W-SAVE-KEY-ACAT-CTL-NBR                                  
              DISPLAY '7100-LOAD-TBL: SAVE: ' W-SAVE-RECORD(1:41)               
              MOVE ' '                TO W-REJECT-SW                            
              MOVE W-SAVE-TI-DATA     TO DCLVTRNFR                              
              MOVE W-SAVE-BAL-TYPE1   TO W-BAL-TYPE1                            
              MOVE W-SAVE-BAL-TYPE2   TO W-BAL-TYPE2                            
              MOVE W-SAVE-BAL-TYPE3   TO W-BAL-TYPE3                            
              MOVE W-SAVE-BAL-TYPE5   TO W-BAL-TYPE5                            
              MOVE W-SAVE-BAL-SMA     TO W-BAL-SMA                              
              MOVE W-SAVE-TOTL-LIQDATNG-EQUITY                                  
                TO W-BAL-TOTL-LIQDATNG-EQUITY                                   
              MOVE W-SAVE-FLAGS       TO W-REJECT-SW                            
              MOVE SORT-RECORD        TO REQ-RECORD                             
              WRITE REQ-RECORD                                                  
              ADD 1 TO W-ACATPTRR-CNT                                           
           END-IF                                                               
                                                                                
           IF SORT-KEY-REC-TYPE-IS-AT                                           
              IF IDXR < W-REQ-LIMIT                                             
                 ADD 1 TO IDXR                                                  
                 MOVE SORT-RECORD TO W-REQ-TAB(IDXR)                            
                 MOVE IDXR TO W-REQ-SIZE                                        
              END-IF                                                            
              MOVE SORT-RECORD          TO REQ-RECORD                           
              WRITE REQ-RECORD                                                  
              ADD 1 TO W-ACATPTRR-CNT                                           
           END-IF.                                                              
                                                                                
       7100-EXIT. EXIT.                                                         
      /                                                                         
       7110-LOAD-AST-TABLE.                                                     
           MOVE '7110-LOAD-AST-TABLE.          ' TO W-ROUTINE-1.                
                                                                                
           MOVE SORT-RECORD          TO AST-RECORD                              
           WRITE AST-RECORD                                                     
           ADD 1 TO W-ACATPTRP-CNT                                              
                                                                                
           IF IDXA < W-AST-LIMIT                                                
              ADD 1 TO IDXA                                                     
              MOVE SORT-RECORD TO W-AST-TAB(IDXA)                               
              MOVE IDXA TO W-AST-SIZE                                           
           END-IF.                                                              
                                                                                
       7110-EXIT. EXIT.                                                         
      /                                                                         
      ***MATCH THE ASSET WITH THE REQUEST                                       
       7200-MATCH-REQ-AST.                                                      
           MOVE '7200-MATCH-REQ-AST.           ' TO W-ROUTINE-1.                
           IF W-REQ-KEY-CLIENT-NBR(1)   NOT = W-CURRENT-CLIENT                  
              MOVE W-REQ-KEY-CLIENT-NBR(1) TO W-CURRENT-CLIENT                  
              PERFORM 7035-GETB1 THRU 7035-EXIT                                 
           END-IF                                                               
                                                                                
           PERFORM VARYING IDXR FROM 1 BY 1 UNTIL IDXR > W-REQ-SIZE             
DJ0009     IF W-REQ-KEY-WHI-CD (IDXR) = 'I'                                     
DJ0009        DISPLAY '7200-MATCH-REQUEST:  ' W-REQ-KEY(IDXR)(1:41)             
DJ0009                ' <====WHEN-ISSUE'                                        
DJ0009     ELSE                                                                 
DJ0009        DISPLAY '7200-MATCH-REQUEST:  ' W-REQ-KEY(IDXR)(1:41)             
DJ0009     END-IF                                                               
            PERFORM VARYING IDXA FROM 1 BY 1 UNTIL IDXA > W-AST-SIZE            
DJ0009       IF  (W-AST-KEY(IDXA)(1:35)     = W-REQ-KEY(IDXR)(1:35))            
DJ0009       AND (W-AST-KEY(IDXA)(1:35) NOT = ' ')                              
             AND (W-REQ-KEY-FULFILL(IDXR)   = ' ')                              
             AND (W-AST-KEY-FULFILL(IDXA)   = ' ')                              
      ***---PERCENTAGE REQUESTED FOR SECURITY                                   
               IF  (W-REQ-KEY-ASSET-REQ-TRNCD(IDXR) = '1')                      
               AND (W-AST-KEY-CASH-MRGN-SHTCD(IDXA) =                           
                    W-REQ-KEY-CASH-MRGN-SHTCD(IDXR)        OR                   
                    W-REQ-KEY-CASH-MRGN-SHTCD(IDXR) = ' '  OR                   
                    BH-ACAT-PTR-ASSETS-TYPE         = '1')                      
               AND (W-AST-KEY-POS-CD(IDXA)          =                           
                    W-REQ-KEY-POS-CD(IDXR))                                     
               AND (W-AST-KEY-SECURITY-ADP-NBR(IDXA)(1:1) > ' ')                
                    PERFORM 7210-ADJUST-PCT-QTY THRU 7210-EXIT                  
               END-IF                                                           
      ***---PERCENTAGE REQUESTED FOR CASH                                       
               IF  (W-REQ-KEY-ASSET-REQ-TRNCD(IDXR) = '1')                      
               AND (W-AST-KEY-CASH-MRGN-SHTCD(IDXA) =                           
                    W-REQ-KEY-CASH-MRGN-SHTCD(IDXR)        OR                   
                    W-REQ-KEY-CASH-MRGN-SHTCD(IDXR) = ' '  OR                   
                    BH-ACAT-PTR-ASSETS-TYPE         = '1')                      
               AND (W-AST-KEY-POS-CD(IDXA)          =                           
                    W-REQ-KEY-POS-CD(IDXR))                                     
               AND (W-AST-KEY-SECURITY-ADP-NBR(IDXA) = ' 40CRED' OR             
                    W-AST-KEY-SECURITY-ADP-NBR(IDXA) = ' 40DEB ' OR             
                    W-AST-KEY-SECURITY-ADP-NBR(IDXA) = ' 45SMA ')               
                    PERFORM 7220-ADJUST-PCT-AMT THRU 7220-EXIT                  
               END-IF                                                           
      ***---QUANTITY REQUESTED FOR OPTIONS                                      
               IF  (W-REQ-KEY-ASSET-REQ-TRNCD(IDXR) = '2')                      
               AND (W-AST-KEY-CASH-MRGN-SHTCD(IDXA) =                           
                    W-REQ-KEY-CASH-MRGN-SHTCD(IDXR)        OR                   
                    W-REQ-KEY-CASH-MRGN-SHTCD(IDXR) = ' '  OR                   
                    BH-ACAT-PTR-ASSETS-TYPE         = '1')                      
               AND (W-AST-KEY-POS-CD(IDXA)          =                           
                    W-REQ-KEY-POS-CD(IDXR))                                     
               AND (W-AST-KEY-SECURITY-ADP-NBR(IDXA)(1:1) > ' ')                
               AND (W-AST-KEY-STTLM-LCTN-CD(IDXA)    = '35')                    
               AND (W-AST-OP-EXPTN-DT         (IDXA) =                          
                    W-REQ-OP-EXPTN-DT         (IDXR))                           
               AND (W-AST-OP-STPRC-INTEGER-AMT(IDXA) =                          
                    W-REQ-OP-STPRC-INTEGER-AMT(IDXR))                           
               AND (W-AST-OP-STPRC-FRCTN-AMT  (IDXA) =                          
                    W-REQ-OP-STPRC-FRCTN-AMT  (IDXR))                           
                    PERFORM 7230-ADJUST-QTY THRU 7230-EXIT                      
               END-IF                                                           
      ***---QUANTITY REQUESTED FOR SECURITIES                                   
TEST           DISPLAY 'ADJ QTY TEST '                                          
                 ' TRNCD ' W-REQ-KEY-ASSET-REQ-TRNCD(IDXR)                      
                 ' CMS ' W-AST-KEY-CASH-MRGN-SHTCD(IDXA)                        
                 ' REQ CMS ' W-REQ-KEY-CASH-MRGN-SHTCD(IDXR)                    
                 ' B1 '  BH-ACAT-PTR-ASSETS-TYPE                                
                 ' POSN ' W-AST-KEY-POS-CD(IDXA)                                
                 ' REQ-POSN ' W-REQ-KEY-POS-CD(IDXR)                            
                 ' KEY ' W-AST-KEY-SECURITY-ADP-NBR(IDXA)                       
               IF  (W-REQ-KEY-ASSET-REQ-TRNCD(IDXR) = '2')                      
               AND (W-AST-KEY-CASH-MRGN-SHTCD(IDXA) =                           
                    W-REQ-KEY-CASH-MRGN-SHTCD(IDXR)        OR                   
                    W-REQ-KEY-CASH-MRGN-SHTCD(IDXR) = ' '  OR                   
                    BH-ACAT-PTR-ASSETS-TYPE         = '1')                      
LRM023         AND (W-AST-KEY-STTLM-LCTN-CD(IDXA) NOT = '35')                   
               AND (W-AST-KEY-POS-CD(IDXA)            =                         
                    W-REQ-KEY-POS-CD(IDXR))                                     
               AND (W-AST-KEY-SECURITY-ADP-NBR(IDXA)(1:1) > ' ')                
                    PERFORM 7230-ADJUST-QTY THRU 7230-EXIT                      
               END-IF                                                           
      ***---AMOUNT REQUESTED FOR OPTIONS                                        
               IF  (W-REQ-KEY-ASSET-REQ-TRNCD(IDXR) = '3')                      
               AND (W-AST-KEY-CASH-MRGN-SHTCD(IDXA) =                           
                    W-REQ-KEY-CASH-MRGN-SHTCD(IDXR)        OR                   
                    W-REQ-KEY-CASH-MRGN-SHTCD(IDXR) = ' '  OR                   
                    BH-ACAT-PTR-ASSETS-TYPE         = '1')                      
               AND (W-AST-KEY-POS-CD(IDXA)          =                           
                    W-REQ-KEY-POS-CD(IDXR))                                     
               AND (W-AST-KEY-SECURITY-ADP-NBR(IDXA)(1:1) > ' ')                
               AND (W-AST-KEY-STTLM-LCTN-CD(IDXA)    = '35')                    
               AND (W-AST-OP-EXPTN-DT         (IDXA) =                          
                    W-REQ-OP-EXPTN-DT         (IDXR))                           
               AND (W-AST-OP-STPRC-INTEGER-AMT(IDXA) =                          
                    W-REQ-OP-STPRC-INTEGER-AMT(IDXR))                           
               AND (W-AST-OP-STPRC-FRCTN-AMT  (IDXA) =                          
                    W-REQ-OP-STPRC-FRCTN-AMT  (IDXR))                           
               AND (W-AST-KEY-STTLM-RSN-CD(IDXA)      =                         
                    W-REQ-KEY-STTLM-RSN-CD(IDXR))                               
                    PERFORM 7240-ADJUST-AMT-SEC THRU 7240-EXIT                  
               END-IF                                                           
      ***---AMOUNT REQUESTED FOR SECURITIES                                     
               IF  (W-REQ-KEY-ASSET-REQ-TRNCD(IDXR) = '3')                      
               AND (W-AST-KEY-CASH-MRGN-SHTCD(IDXA) =                           
                    W-REQ-KEY-CASH-MRGN-SHTCD(IDXR)        OR                   
                    W-REQ-KEY-CASH-MRGN-SHTCD(IDXR) = ' '  OR                   
                    BH-ACAT-PTR-ASSETS-TYPE         = '1')                      
               AND (W-AST-KEY-POS-CD(IDXA)          =                           
                    W-REQ-KEY-POS-CD(IDXR))                                     
               AND (W-AST-KEY-SECURITY-ADP-NBR(IDXA)(1:1) > ' ')                
               AND (W-AST-KEY-STTLM-RSN-CD(IDXA)      =                         
                    W-REQ-KEY-STTLM-RSN-CD(IDXR))                               
                    PERFORM 7240-ADJUST-AMT-SEC THRU 7240-EXIT                  
               END-IF                                                           
      ***---AMOUNT REQUESTED FOR CASH                                           
               IF  (W-REQ-KEY-ASSET-REQ-TRNCD(IDXR) = '3')                      
               AND (W-AST-KEY-CASH-MRGN-SHTCD(IDXA) =                           
                    W-REQ-KEY-CASH-MRGN-SHTCD(IDXR)        OR                   
                    W-REQ-KEY-CASH-MRGN-SHTCD(IDXR) = ' '  OR                   
                    BH-ACAT-PTR-ASSETS-TYPE         = '1')                      
               AND (W-AST-KEY-POS-CD(IDXA)          =                           
                    W-REQ-KEY-POS-CD(IDXR))                                     
               AND (W-AST-KEY-SECURITY-ADP-NBR(IDXA) = ' 40CRED' OR             
                    W-AST-KEY-SECURITY-ADP-NBR(IDXA) = ' 40DEB ' OR             
                    W-AST-KEY-SECURITY-ADP-NBR(IDXA) = ' 45SMA ')               
                    PERFORM 7250-ADJUST-AMT THRU 7250-EXIT                      
               END-IF                                                           
             END-IF                                                             
            END-PERFORM                                                         
           END-PERFORM                                                          
                                                                                
           PERFORM 7400-CHECK-FULFILLMENT THRU 7400-EXIT                        
                                                                                
           PERFORM 7500-OUTPUT-MATCHED THRU 7500-EXIT                           
           .                                                                    
       7200-EXIT. EXIT.                                                         
      /                                                                         
      ***ADJUST THE QUANTITY FOR SECURITIES BY PERCENTAGE                       
       7210-ADJUST-PCT-QTY.                                                     
           DISPLAY '7210-ADJUST-PCT-QTY  ' W-REQ-TABLE(1:41)                    
                                                                                
           PERFORM 7300-FIND-OTHER-REQUEST THRU 7300-EXIT                       
                                                                                
           MOVE IDXA TO W-REQ-KEY-FULFILL(IDXR)                                 
           MOVE IDXR TO W-AST-KEY-FULFILL(IDXA)                                 
           IF W-REQ-KEY-ASSET-PCT(IDXR) NOT = 100.00                            
               MOVE '%'  TO W-AST-KEY-FULFILL-1(IDXA)                           
              DISPLAY 'ADJUST THE QUANTITY FOR SEC BY PERCENTAGE:'              
              DISPLAY '$' IDXR ' ' W-REQ-KEY(IDXR)                              
              DISPLAY '#' IDXA ' ' W-AST-KEY(IDXA)                              
              MOVE W-AST-KEY-ASSET-QTY(IDXA) TO WS-ORIG-QTY                     
              MOVE W-AST-KEY-ASSET-AMT(IDXA) TO WS-ORIG-AMT                     
              COMPUTE WS-CALC-QTY         =                                     
                     (WS-ORIG-QTY * W-REQ-KEY-ASSET-PCT(IDXR) / 100)            
              END-COMPUTE                                                       
LRM029        IF WS-ORIG-AMT = ZERO                                             
LRM029           MOVE .01 TO WS-CALC-PRICE                                      
LRM029        ELSE                                                              
               COMPUTE WS-CALC-PRICE ROUNDED = WS-ORIG-AMT / WS-ORIG-QTY        
LRM029                ON SIZE ERROR  MOVE .01  TO WS-CALC-PRICE                 
               END-COMPUTE                                                      
LRM029        END-IF                                                            
              COMPUTE WS-CALC-AMT ROUNDED =                                     
                      WS-CALC-QTY * WS-CALC-PRICE                               
              END-COMPUTE                                                       
LRM029        IF WS-ORIG-AMT = ZERO                                             
LRM029        AND WS-CALC-AMT < 1.00                                            
LRM029           MOVE 1.00 TO WS-CALC-AMT                                       
LRM029        END-IF                                                            
              MOVE WS-CALC-AMT                                                  
                TO W-AST-KEY-ASSET-AMT(IDXA)                                    
                   W-AST-AT-ASSET-AMT (IDXA)                                    
              MOVE WS-CALC-QTY                                                  
                TO W-AST-KEY-ASSET-QTY(IDXA)                                    
                   W-AST-AT-ASSET-QTY (IDXA)                                    
               ADD  W-AST-KEY-ASSET-QTY(IDXA)                                   
                 TO W-REQ-GOT-ASSET-QTY(IDXR)                                   
               ADD  W-AST-KEY-ASSET-AMT(IDXA)                                   
                 TO W-REQ-GOT-ASSET-AMT(IDXR)                                   
              DISPLAY '%' IDXA ' ' W-AST-KEY(IDXA)                              
           ELSE                                                                 
               MOVE '%'  TO W-AST-KEY-FULFILL-1(IDXA)                           
               MOVE W-REQ-KEY-ASSET-PCT(IDXR)                                   
                 TO W-REQ-GOT-ASSET-PCT(IDXR)                                   
               ADD  W-AST-KEY-ASSET-QTY(IDXA)                                   
                 TO W-REQ-GOT-ASSET-QTY(IDXR)                                   
               ADD  W-AST-KEY-ASSET-AMT(IDXA)                                   
                 TO W-REQ-GOT-ASSET-AMT(IDXR)                                   
TEST           DISPLAY W-AST-KEY-SECURITY-ADP-NBR(IDXR) ' 7210- '               
                  ' POS-QTY ' W-AST-KEY-ASSET-QTY(IDXA)                         
                  ' NEW-GOT-QTY ' W-REQ-GOT-ASSET-QTY(IDXR)                     
           END-IF.                                                              
                                                                                
       7210-EXIT. EXIT.                                                         
      /                                                                         
      ***ADJUST THE AMOUNT FOR CASH BY PERCENTAGE                               
       7220-ADJUST-PCT-AMT.                                                     
           DISPLAY '7220-ADJUST-PCT-AMT  ' W-REQ-TABLE(1:41)                    
                                                                                
           PERFORM 7300-FIND-OTHER-REQUEST THRU 7300-EXIT                       
                                                                                
           MOVE IDXA TO W-REQ-KEY-FULFILL(IDXR)                                 
           MOVE IDXR TO W-AST-KEY-FULFILL(IDXA)                                 
           IF W-REQ-KEY-ASSET-PCT(IDXR) NOT = 100.00                            
               MOVE '%'  TO W-AST-KEY-FULFILL-1(IDXA)                           
              DISPLAY 'ADJUST THE AMOUNT FOR CASH BY PERCENTAGE:'               
              DISPLAY '$' IDXR ' ' W-REQ-KEY(IDXR)                              
              DISPLAY '#' IDXA ' ' W-AST-KEY(IDXA)                              
              MOVE W-AST-KEY-ASSET-AMT(IDXA) TO WS-ORIG-AMT                     
              COMPUTE WS-CALC-AMT      ROUNDED =                                
                     (WS-ORIG-AMT * W-REQ-KEY-ASSET-PCT(IDXR) / 100)            
              END-COMPUTE                                                       
              MOVE WS-CALC-AMT                                                  
                TO W-AST-KEY-ASSET-AMT(IDXA)                                    
                   W-AST-AT-ASSET-AMT (IDXA)                                    
               ADD  W-AST-KEY-ASSET-QTY(IDXA)                                   
                 TO W-REQ-GOT-ASSET-QTY(IDXR)                                   
               ADD  W-AST-KEY-ASSET-AMT(IDXA)                                   
                 TO W-REQ-GOT-ASSET-AMT(IDXR)                                   
              DISPLAY '%' IDXA ' ' W-AST-KEY(IDXA)                              
           ELSE                                                                 
               MOVE '%'  TO W-AST-KEY-FULFILL-1(IDXA)                           
               MOVE W-REQ-KEY-ASSET-PCT(IDXR)                                   
                 TO W-REQ-GOT-ASSET-PCT(IDXR)                                   
               ADD  W-AST-KEY-ASSET-QTY(IDXA)                                   
                 TO W-REQ-GOT-ASSET-QTY(IDXR)                                   
               ADD  W-AST-KEY-ASSET-AMT(IDXA)                                   
                 TO W-REQ-GOT-ASSET-AMT(IDXR)                                   
           END-IF.                                                              
                                                                                
       7220-EXIT. EXIT.                                                         
      /                                                                         
      ***ADJUST THE QUANTITY FOR SECURITIES TO WHAT THEY WANT OR LESS           
      ***ADJUST THE AMOUNT FOR THE NEW QUANTITY                                 
       7230-ADJUST-QTY.                                                         
           DISPLAY '7230-ADJUST-QTY ' IDXR ' ' IDXA '  '                        
                                           W-REQ-TABLE(1:41)                    
                                                                                
           PERFORM 7300-FIND-OTHER-REQUEST THRU 7300-EXIT                       
                                                                                
           COMPUTE WS-STILL-NEED-QTY = W-REQ-KEY-ASSET-QTY(IDXR) -              
                                       W-REQ-GOT-ASSET-QTY(IDXR)                
TEST       DISPLAY 'IN 7230- QTY STILL NEED ' WS-STILL-NEED-QTY                 
           MOVE IDXR TO W-AST-KEY-FULFILL(IDXA)                                 
           IF W-AST-KEY-ASSET-QTY(IDXA) >                                       
              WS-STILL-NEED-QTY                                                 
DJ0009        COMPUTE W-AST-KEY-ASSET-QTY-LEFT (IDXA) =                         
DJ0009                W-AST-KEY-ASSET-QTY(IDXA) - WS-STILL-NEED-QTY             
               MOVE '>'  TO W-AST-KEY-FULFILL-1(IDXA)                           
              DISPLAY '7230: ADJUST THE QUANTITY DOWN FOR SECURITIES:'          
              DISPLAY '$' IDXR ' ' W-REQ-KEY(IDXR)                              
              DISPLAY '#' IDXA ' ' W-AST-KEY(IDXA)                              
              MOVE W-AST-KEY-ASSET-QTY(IDXA) TO WS-ORIG-QTY                     
              MOVE W-AST-KEY-ASSET-AMT(IDXA) TO WS-ORIG-AMT                     
LRM029        IF WS-ORIG-AMT = ZERO                                             
LRM029           MOVE .01 TO WS-CALC-PRICE                                      
LRM029        ELSE                                                              
               COMPUTE WS-CALC-PRICE ROUNDED = WS-ORIG-AMT / WS-ORIG-QTY        
LRM029                ON SIZE ERROR  MOVE .01 TO WS-CALC-PRICE                  
               END-COMPUTE                                                      
LRM029        END-IF                                                            
              COMPUTE WS-CALC-AMT ROUNDED =                                     
                      WS-STILL-NEED-QTY         * WS-CALC-PRICE                 
              END-COMPUTE                                                       
LRM029        IF WS-ORIG-AMT = ZERO                                             
LRM029        AND WS-CALC-AMT < 1.00                                            
LRM029           MOVE 1.00 TO WS-CALC-AMT                                       
LRM029        END-IF                                                            
              MOVE WS-CALC-AMT                                                  
                TO W-AST-KEY-ASSET-AMT(IDXA)                                    
                   W-AST-AT-ASSET-AMT (IDXA)                                    
TEST          DISPLAY 'AST QTY IDXR ' W-REQ-KEY-ASSET-QTY(IDXR)                 
TEST2            ' STILL-NEED ' WS-STILL-NEED-QTY                               
TEST          IF WS-STILL-NEED-QTY < W-REQ-KEY-ASSET-QTY(IDXR)                  
TEST             MOVE WS-STILL-NEED-QTY TO W-REQ-KEY-ASSET-QTY(IDXR)            
TEST          END-IF                                                            
              MOVE W-REQ-KEY-ASSET-QTY(IDXR)                                    
                TO W-AST-KEY-ASSET-QTY(IDXA)                                    
                   W-AST-AT-ASSET-QTY (IDXA)                                    
TEST          DISPLAY 'AST KEY QTY ' W-AST-KEY-ASSET-QTY(IDXA)                  
               ADD  W-AST-KEY-ASSET-QTY(IDXA)                                   
                 TO W-REQ-GOT-ASSET-QTY(IDXR)                                   
               ADD  W-AST-KEY-ASSET-AMT(IDXA)                                   
                 TO W-REQ-GOT-ASSET-AMT(IDXR)                                   
**************DISPLAY '%' IDXA ' ' W-AST-KEY(IDXA)                              
              MOVE IDXA TO W-REQ-KEY-FULFILL(IDXR)                              
           ELSE                                                                 
            IF W-AST-KEY-ASSET-QTY(IDXA) <                                      
               WS-STILL-NEED-QTY                                                
              DISPLAY '7230: AVAILABLE IS LESS THAN REQUESTED'                  
DJ0009        MOVE 0 TO W-AST-KEY-ASSET-QTY-LEFT (IDXA)                         
               ADD  W-AST-KEY-ASSET-QTY(IDXA)                                   
                 TO W-REQ-GOT-ASSET-QTY(IDXR)                                   
               ADD  W-AST-KEY-ASSET-AMT(IDXA)                                   
                 TO W-REQ-GOT-ASSET-AMT(IDXR)                                   
               MOVE '<'  TO W-AST-KEY-FULFILL-1(IDXA)                           
               IF BH-ACAT-PTR-ASSETS-TYPE NOT = '1'                             
                  MOVE 'REQUESTED ASSETS EXCEED AVAILABLE ASSETS'               
                    TO W-AST-AT-ASSET-CMNT-TXT(IDXA)                            
                  MOVE 'Y' TO W-AST-AT-ASSET-CMNT-STTS-CD (IDXA)                
               END-IF                                                           
               DISPLAY 'ASSET QUANTITY < THAN REQUESTED FOR SECURITY:'          
               DISPLAY '$' IDXR ' ' W-REQ-KEY(IDXR)                             
               DISPLAY '#' IDXA ' ' W-AST-KEY(IDXA)                             
??????*********DISPLAY '%' IDXA ' ' W-AST-KEY(IDXA)                             
            ELSE                                                                
              DISPLAY '7230: AVAILABLE IS EQUAL TO REQUESTED'                   
LRM019        IF W-AST-KEY-STTLM-LCTN-CD(IDXA)    = '45'                        
LRM019           DISPLAY 'SKIP SLOC=45 WIPING QTY-LEFT AND OTHERS'              
LRM019        ELSE                                                              
DJ0009        MOVE 0 TO W-AST-KEY-ASSET-QTY-LEFT (IDXA)                         
               MOVE '='  TO W-AST-KEY-FULFILL-1(IDXA)                           
               ADD  W-AST-KEY-ASSET-QTY(IDXA)                                   
                 TO W-REQ-GOT-ASSET-QTY(IDXR)                                   
               ADD  W-AST-KEY-ASSET-AMT(IDXA)                                   
                 TO W-REQ-GOT-ASSET-AMT(IDXR)                                   
              MOVE IDXA TO W-REQ-KEY-FULFILL(IDXR)                              
TEST          DISPLAY 'QTY=SECT, IDXA = ' IDXA                                  
LRM019        END-IF                                                            
            END-IF                                                              
           END-IF.                                                              
                                                                                
       7230-EXIT. EXIT.                                                         
      /                                                                         
      ***ADJUST THE AMOUNT FOR SECURITIES TO WHAT THEY WANT OR LESS             
      ***ADJUST THE QUANTITY FOR THE NEW AMOUNT                                 
       7240-ADJUST-AMT-SEC.                                                     
           DISPLAY '7240-ADJUST-AMT-SEC  ' W-REQ-TABLE(1:41)                    
                                                                                
           PERFORM 7300-FIND-OTHER-REQUEST THRU 7300-EXIT                       
                                                                                
           COMPUTE WS-STILL-NEED-AMT = W-REQ-KEY-ASSET-AMT(IDXR) -              
                                       W-REQ-GOT-ASSET-AMT(IDXR)                
           MOVE IDXR TO W-AST-KEY-FULFILL(IDXA)                                 
           IF W-AST-KEY-ASSET-AMT(IDXA) >                                       
              WS-STILL-NEED-AMT                                                 
               MOVE '>'  TO W-AST-KEY-FULFILL-1(IDXA)                           
**************DISPLAY 'ADJUST THE AMOUNT DOWN FOR SECURITIES:'                  
**************DISPLAY '$' IDXR ' ' W-REQ-KEY(IDXR)                              
**************DISPLAY '#' IDXA ' ' W-AST-KEY(IDXA)                              
              MOVE W-AST-KEY-ASSET-QTY(IDXA) TO WS-ORIG-QTY                     
              MOVE W-AST-KEY-ASSET-AMT(IDXA) TO WS-ORIG-AMT                     
LRM029        IF WS-ORIG-AMT = ZERO                                             
LRM029           MOVE .01 TO WS-CALC-PRICE                                      
LRM029        ELSE                                                              
               COMPUTE WS-CALC-PRICE ROUNDED = WS-ORIG-AMT / WS-ORIG-QTY        
LRM029                ON SIZE ERROR  MOVE .01 TO WS-CALC-PRICE                  
               END-COMPUTE                                                      
LRM029        END-IF                                                            
              COMPUTE WS-CALC-QTY           =                                   
                      WS-STILL-NEED-AMT     / WS-CALC-PRICE                     
              END-COMPUTE                                                       
              MOVE WS-CALC-QTY                                                  
                TO W-AST-KEY-ASSET-QTY(IDXA)                                    
                   W-AST-AT-ASSET-QTY (IDXA)                                    
              MOVE W-REQ-KEY-ASSET-AMT(IDXR)                                    
                TO W-AST-KEY-ASSET-AMT(IDXA)                                    
                   W-AST-AT-ASSET-AMT (IDXA)                                    
               ADD  W-AST-KEY-ASSET-QTY(IDXA)                                   
                 TO W-REQ-GOT-ASSET-QTY(IDXR)                                   
               ADD  W-AST-KEY-ASSET-AMT(IDXA)                                   
                 TO W-REQ-GOT-ASSET-AMT(IDXR)                                   
**************DISPLAY '%' IDXA ' ' W-AST-KEY(IDXA)                              
              MOVE IDXA TO W-REQ-KEY-FULFILL(IDXR)                              
           ELSE                                                                 
            IF W-AST-KEY-ASSET-AMT(IDXA) <                                      
               WS-STILL-NEED-AMT                                                
               ADD  W-AST-KEY-ASSET-QTY(IDXA)                                   
                 TO W-REQ-GOT-ASSET-QTY(IDXR)                                   
               ADD  W-AST-KEY-ASSET-AMT(IDXA)                                   
                 TO W-REQ-GOT-ASSET-AMT(IDXR)                                   
               MOVE '<'  TO W-AST-KEY-FULFILL-1(IDXA)                           
               IF BH-ACAT-PTR-ASSETS-TYPE NOT = '1'                             
                  MOVE 'REQUESTED ASSETS EXCEED AVAILABLE ASSETS'               
                    TO W-AST-AT-ASSET-CMNT-TXT(IDXA)                            
                  MOVE 'Y' TO W-AST-AT-ASSET-CMNT-STTS-CD (IDXA)                
               END-IF                                                           
               DISPLAY 'ASSET AMOUNT < REQUESTED FOR SECURITIES:'               
               DISPLAY '$' IDXR ' ' W-REQ-KEY(IDXR)                             
               DISPLAY '#' IDXA ' ' W-AST-KEY(IDXA)                             
??????*********DISPLAY '%' IDXA ' ' W-AST-KEY(IDXA)                             
            ELSE                                                                
               ADD  W-AST-KEY-ASSET-QTY(IDXA)                                   
                 TO W-REQ-GOT-ASSET-QTY(IDXR)                                   
               ADD  W-AST-KEY-ASSET-AMT(IDXA)                                   
                 TO W-REQ-GOT-ASSET-AMT(IDXR)                                   
               MOVE '='  TO W-AST-KEY-FULFILL-1(IDXA)                           
               MOVE IDXA TO W-REQ-KEY-FULFILL(IDXR)                             
            END-IF                                                              
           END-IF.                                                              
                                                                                
       7240-EXIT. EXIT.                                                         
      /                                                                         
      ***ADJUST THE AMOUNT FOR CASH TO WHAT THEY WANT OR LESS                   
       7250-ADJUST-AMT.                                                         
           DISPLAY '7250-ADJUST-AMT ' IDXR ' ' IDXA '  '                        
                                           W-REQ-TABLE(1:41)                    
                                                                                
           PERFORM 7300-FIND-OTHER-REQUEST THRU 7300-EXIT                       
                                                                                
           COMPUTE WS-STILL-NEED-AMT = W-REQ-KEY-ASSET-AMT(IDXR) -              
                                       W-REQ-GOT-ASSET-AMT(IDXR)                
           MOVE IDXR TO W-AST-KEY-FULFILL(IDXA)                                 
           IF W-AST-KEY-ASSET-AMT(IDXA) > WS-STILL-NEED-AMT                     
              MOVE '>'  TO W-AST-KEY-FULFILL-1(IDXA)                            
**************DISPLAY 'ADJUST THE AMOUNT DOWN FOR CASH:'                        
**************DISPLAY '$' IDXR ' ' W-REQ-KEY(IDXR)                              
**************DISPLAY '#' IDXA ' ' W-AST-KEY(IDXA)                              
              MOVE W-AST-KEY-ASSET-AMT(IDXA) TO WS-ORIG-AMT                     
              MOVE WS-STILL-NEED-AMT                                            
                TO W-AST-KEY-ASSET-AMT(IDXA)                                    
                   W-AST-AT-ASSET-AMT (IDXA)                                    
               ADD  W-AST-KEY-ASSET-QTY(IDXA)                                   
                 TO W-REQ-GOT-ASSET-QTY(IDXR)                                   
               ADD  W-AST-KEY-ASSET-AMT(IDXA)                                   
                 TO W-REQ-GOT-ASSET-AMT(IDXR)                                   
**************DISPLAY '%' IDXA ' ' W-AST-KEY(IDXA)                              
              MOVE IDXA TO W-REQ-KEY-FULFILL(IDXR)                              
           ELSE                                                                 
            IF W-AST-KEY-ASSET-AMT(IDXA) <                                      
               WS-STILL-NEED-AMT                                                
               ADD  W-AST-KEY-ASSET-QTY(IDXA)                                   
                 TO W-REQ-GOT-ASSET-QTY(IDXR)                                   
               ADD  W-AST-KEY-ASSET-AMT(IDXA)                                   
                 TO W-REQ-GOT-ASSET-AMT(IDXR)                                   
               MOVE '<'  TO W-AST-KEY-FULFILL-1(IDXA)                           
               IF BH-ACAT-PTR-ASSETS-TYPE NOT = '1'                             
                  MOVE 'REQUESTED ASSETS EXCEED AVAILABLE ASSETS'               
                    TO W-AST-AT-ASSET-CMNT-TXT(IDXA)                            
                  MOVE 'Y' TO W-AST-AT-ASSET-CMNT-STTS-CD (IDXA)                
               END-IF                                                           
               DISPLAY 'ASSET AMOUNT < REQUESTED FOR CASH:'                     
               DISPLAY '$' IDXR ' ' W-REQ-KEY(IDXR)                             
               DISPLAY '#' IDXA ' ' W-AST-KEY(IDXA)                             
??????*********DISPLAY '%' IDXA ' ' W-AST-KEY(IDXA)                             
            ELSE                                                                
               ADD  W-AST-KEY-ASSET-QTY(IDXA)                                   
                 TO W-REQ-GOT-ASSET-QTY(IDXR)                                   
               ADD  W-AST-KEY-ASSET-AMT(IDXA)                                   
                 TO W-REQ-GOT-ASSET-AMT(IDXR)                                   
               MOVE '='  TO W-AST-KEY-FULFILL-1(IDXA)                           
               MOVE IDXA TO W-REQ-KEY-FULFILL(IDXR)                             
            END-IF                                                              
           END-IF.                                                              
                                                                                
       7250-EXIT. EXIT.                                                         
      /                                                                         
       7300-FIND-OTHER-REQUEST.                                                 
                                                                                
           MOVE 0 TO WS-ACTIVE-QTY                                              
                     WS-ACTIVE-AMT                                              
      **---FIND OTHER REQUEST ON DATABASE FOR SAME SECURITY                     
           INITIALIZE W-OTHER-ACTIVE-AREA                                       
           IF W-AST-KEY-SECURITY-ADP-NBR(IDXA) (1:1) > ' '                      
                 PERFORM 7320-FIND-OTHER-ACTIAST THRU 7320-EXIT                 
                 PERFORM 7321-FIND-OTHER-VTRNFR  THRU 7321-EXIT                 
                 IF W-AST-FLAG-ACCT-IN-TFR(IDXA) = 'Y'                          
                    MOVE 0 TO W-AST-KEY-ASSET-QTY (IDXA)                        
                              W-AST-AT-ASSET-QTY (IDXA)                         
                              W-AST-KEY-ASSET-AMT (IDXA)                        
                              W-AST-AT-ASSET-AMT (IDXA)                         
                 END-IF                                                         
           ELSE                                                                 
                IF (W-AST-KEY-SECURITY-ADP-NBR(IDXA) = ' 40CRED' OR             
                    W-AST-KEY-SECURITY-ADP-NBR(IDXA) = ' 40DEB ' OR             
                    W-AST-KEY-SECURITY-ADP-NBR(IDXA) = ' 45SMA ')               
                    PERFORM 7330-FIND-CASH-ACTIAST THRU 7330-EXIT               
                    PERFORM 7331-FIND-CASH-VTRNFR   THRU 7331-EXIT              
                    MOVE W-AST-KEY-ASSET-AMT (IDXA) TO W-AMT-DISPLAY            
                    IF WS-ACTIVE-AMT NOT = 0                                    
                      DISPLAY 'CUSBAL-AMT = ' W-AMT-DISPLAY                     
                      COMPUTE W-AST-KEY-ASSET-AMT(IDXA) =                       
                              W-AST-KEY-ASSET-AMT(IDXA)                         
                                  - WS-ACTIVE-AMT                               
                      MOVE    W-AST-KEY-ASSET-AMT(IDXA)                         
                         TO    W-AST-AT-ASSET-AMT(IDXA)                         
                      MOVE W-AST-KEY-ASSET-AMT(IDXA) TO W-AMT-DISPLAY           
                      DISPLAY '   NEW-AMT = ' W-AMT-DISPLAY                     
                    END-IF                                                      
                END-IF                                                          
           END-IF.                                                              
                                                                                
       7300-EXIT. EXIT.                                                         
      /                                                                         
      ***FIND OTHER REQUEST ON DATABASE FOR SAME SECURITY                       
      ***FLAG AS ACCOUNT IN TRANSFER                                            
       7320-FIND-OTHER-ACTIAST.                                                 
           MOVE '7320-FIND-OTHER-ACTIAST.            ' TO W-ROUTINE-1.          
                                                                                
           MOVE W-AST-AT-CLIENT-NBR      (IDXA) TO WF-CLIENT-NBR                
           MOVE W-AST-AT-DLVR-NBR        (IDXA) TO WF-DLVR-NBR                  
           MOVE W-AST-AT-ACCT-DLVR-NBR   (IDXA) TO WF-ACCT-DLVR-NBR             
           MOVE W-AST-AT-SECURITY-ADP-NBR(IDXA) TO WF-SECURITY-ADP-NBR          
           MOVE W-AST-AT-ACAT-CONTROL-NBR(IDXA) TO WF-ACAT-CONTROL-NBR          
           MOVE W-AST-AT-CSH-MGN-SHRT-CD (IDXA) TO WF-CSH-MGN-SHRT-CD           
           MOVE W-AST-AT-STTLM-LCTN-CD   (IDXA) TO WF-STTLM-LCTN-CD             
           MOVE W-AST-AT-STTLM-RSN-CD    (IDXA) TO WF-STTLM-RSN-CD              
           MOVE W-AST-AT-PSTN-CD         (IDXA) TO WF-PSTN-CD                   
           MOVE WF-ACCT-DLVR-NBR(1:8) TO WF-BRANCH-ACCT                         
           MOVE +0           TO W-TFR-SQLCODE                                   
           MOVE +0           TO W-AST-SQLCODE                                   
           EXEC SQL OPEN ACTIAST_CURSOR END-EXEC                                
           MOVE SQLCODE TO W-DB2-SQLCODE                                        
           MOVE SQLCODE TO W-AST-SQLCODE                                        
                                                                                
           PERFORM UNTIL W-AST-SQLCODE NOT = +0                                 
                     OR (W-AST-FLAG-ACCT-IN-TFR(IDXA) = 'Y')                    
              EXEC SQL                                                          
                   FETCH ACTIAST_CURSOR                                         
              INTO                                                              
                   :WA-CLIENT-NBR                                               
                  ,:WA-DLVR-NBR                                                 
                  ,:WA-ACCT-DLVR-NBR                                            
                  ,:WA-ACAT-CONTROL-NBR                                         
                  ,:WA-ASSET-SEQ-NBR                                            
                  ,:WA-CSH-MGN-SHRT-CD                                          
                  ,:WA-SECURITY-ADP-NBR                                         
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE TO W-DB2-SQLCODE                                     
              MOVE SQLCODE TO W-AST-SQLCODE                                     
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       MOVE 'Y' TO W-FLAG-ACCT-IN-TFR                           
                       MOVE 'Y' TO W-AST-FLAG-ACCT-IN-TFR(IDXA)                 
                       DISPLAY '   ZAP -IN-TFR=Y #1'                            
                       ' ' WA-CLIENT-NBR                                        
                           WA-DLVR-NBR                                          
                           WA-ACCT-DLVR-NBR                                     
                           WA-CSH-MGN-SHRT-CD                                   
                           WA-SECURITY-ADP-NBR                                  
                       ' ' WA-ACAT-CONTROL-NBR                                  
                       ' ' WA-ASSET-SEQ-NBR                                     
                       ' FOR'                                                   
                       ' ' WF-CLIENT-NBR                                        
                           WF-DLVR-NBR                                          
                           WF-ACCT-DLVR-NBR                                     
                           WF-CSH-MGN-SHRT-CD                                   
                           WF-SECURITY-ADP-NBR                                  
                       ' ' WF-ACAT-CONTROL-NBR                                  
                  WHEN +100                                                     
                       CONTINUE                                                 
                  WHEN OTHER                                                    
                       DISPLAY ' ACTIAST CURSOR FETCH ERROR '                   
                               ' SQLCODE = ' W-DB2-SQLCODE                      
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM                                                          
                                                                                
           EXEC SQL CLOSE ACTIAST_CURSOR END-EXEC.                              
                                                                                
       7320-EXIT. EXIT.                                                         
      /                                                                         
      ***FIND OTHER REQUEST ON DATABASE FOR SAME SECURITY                       
      ***FLAG AS ACCOUNT IN TRANSFER                                            
       7321-FIND-OTHER-VTRNFR.                                                  
           MOVE '7321-FIND-OTHER-VTRNFR.      ' TO W-ROUTINE-1.                 
                                                                                
           MOVE +0           TO W-TFR-SQLCODE                                   
           EXEC SQL OPEN VTRNFR_CURSOR END-EXEC                                 
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-TFR-SQLCODE                                   
                                                                                
           PERFORM UNTIL W-TFR-SQLCODE NOT = +0                                 
                     OR (W-AST-FLAG-ACCT-IN-TFR(IDXA) = 'Y')                    
              EXEC SQL                                                          
                   FETCH VTRNFR_CURSOR                                          
              INTO                                                              
                   :WT-CLIENT-NBR                                               
                  ,:WT-ACAT-CONTROL-NBR                                         
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE      TO W-DB2-SQLCODE                                
              MOVE SQLCODE      TO W-TFR-SQLCODE                                
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       PERFORM 7122-FIND-VASSET THRU 7122-EXIT                  
                  WHEN +100                                                     
                       CONTINUE                                                 
                  WHEN OTHER                                                    
                       DISPLAY ' VTRNFR CURSOR FETCH ERROR '                    
                               ' SQLCODE = ' W-DB2-SQLCODE                      
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM                                                          
                                                                                
           EXEC SQL                                                             
                CLOSE VTRNFR_CURSOR                                             
           END-EXEC.                                                            
                                                                                
       7321-EXIT. EXIT.                                                         
      /                                                                         
      ***FIND OTHER REQUEST ON DATABASE FOR SAME SECURITY                       
      ***FLAG AS ACCOUNT IN TRANSFER                                            
       7122-FIND-VASSET.                                                        
           MOVE '7122-FIND-VASSET.             ' TO W-ROUTINE-1.                
                                                                                
           MOVE +0           TO W-AST-SQLCODE                                   
           EXEC SQL OPEN VASSET_CURSOR END-EXEC                                 
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-AST-SQLCODE                                   
                                                                                
           PERFORM UNTIL W-AST-SQLCODE NOT = +0                                 
                     OR (W-AST-FLAG-ACCT-IN-TFR(IDXA) = 'Y')                    
              EXEC SQL                                                          
                   FETCH VASSET_CURSOR                                          
              INTO                                                              
                   :WA-CLIENT-NBR                                               
                  ,:WA-ACAT-CONTROL-NBR                                         
                  ,:WA-ASSET-SEQ-NBR                                            
                  ,:WA-CSH-MGN-SHRT-CD                                          
                  ,:WA-SECURITY-ADP-NBR                                         
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE      TO W-DB2-SQLCODE                                
              MOVE SQLCODE      TO W-AST-SQLCODE                                
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       MOVE 'Y' TO W-FLAG-ACCT-IN-TFR                           
                       MOVE 'Y' TO W-AST-FLAG-ACCT-IN-TFR(IDXA)                 
                       DISPLAY '   ZAP -IN-TFR=Y #2'                            
                       ' ' WA-CLIENT-NBR                                        
                           WA-CSH-MGN-SHRT-CD                                   
                           WA-SECURITY-ADP-NBR                                  
                       ' ' WA-ACAT-CONTROL-NBR                                  
                           WA-ASSET-SEQ-NBR                                     
                       ' FOR'                                                   
                       ' ' WF-CLIENT-NBR                                        
                           WF-DLVR-NBR                                          
                           WF-ACCT-DLVR-NBR                                     
                           WF-CSH-MGN-SHRT-CD                                   
                           WF-SECURITY-ADP-NBR                                  
                       ' ' WF-ACAT-CONTROL-NBR                                  
                  WHEN +100                                                     
                       CONTINUE                                                 
                  WHEN OTHER                                                    
                       DISPLAY ' VASSET CURSOR FETCH ERROR '                    
                               ' SQLCODE = ' W-DB2-SQLCODE                      
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM                                                          
                                                                                
           EXEC SQL                                                             
                CLOSE VASSET_CURSOR                                             
           END-EXEC.                                                            
                                                                                
       7122-EXIT. EXIT.                                                         
      /                                                                         
      ***FIND OTHER REQUEST ON DATABASE FOR SAME CASH                           
      ***SUBTRACT THE AMOUNT FROM AVAILABLE AMOUNT                              
       7330-FIND-CASH-ACTIAST.                                                  
           MOVE '7330-FIND-CASH-ACTIAST.            ' TO W-ROUTINE-1.           
                                                                                
           MOVE W-AST-AT-CLIENT-NBR      (IDXA) TO WF-CLIENT-NBR                
           MOVE W-AST-AT-DLVR-NBR        (IDXA) TO WF-DLVR-NBR                  
           MOVE W-AST-AT-ACCT-DLVR-NBR   (IDXA) TO WF-ACCT-DLVR-NBR             
           MOVE W-AST-AT-SECURITY-ADP-NBR(IDXA) TO WF-SECURITY-ADP-NBR          
           MOVE W-AST-AT-ACAT-CONTROL-NBR(IDXA) TO WF-ACAT-CONTROL-NBR          
           MOVE W-AST-AT-CSH-MGN-SHRT-CD (IDXA) TO WF-CSH-MGN-SHRT-CD           
           MOVE W-AST-AT-STTLM-LCTN-CD   (IDXA) TO WF-STTLM-LCTN-CD             
           MOVE W-AST-AT-STTLM-RSN-CD    (IDXA) TO WF-STTLM-RSN-CD              
           MOVE W-AST-AT-PSTN-CD         (IDXA) TO WF-PSTN-CD                   
           MOVE WF-ACCT-DLVR-NBR(1:8) TO WF-BRANCH-ACCT                         
                                                                                
           MOVE +0           TO W-TFR-SQLCODE                                   
           MOVE +0           TO W-AST-SQLCODE                                   
           EXEC SQL OPEN ACTIAST_CSH_CURSOR END-EXEC                            
           MOVE SQLCODE TO W-DB2-SQLCODE                                        
           MOVE SQLCODE TO W-AST-SQLCODE                                        
                                                                                
           PERFORM UNTIL W-AST-SQLCODE NOT = +0                                 
              EXEC SQL                                                          
                   FETCH ACTIAST_CSH_CURSOR                                     
              INTO                                                              
                   :WA-CLIENT-NBR                                               
                  ,:WA-ACAT-CONTROL-NBR                                         
                  ,:WA-ASSET-SEQ-NBR                                            
                  ,:WA-CSH-MGN-SHRT-CD                                          
                  ,:WA-STTLM-LCTN-CD                                            
                  ,:WA-STTLM-RSN-CD                                             
                  ,:WA-PSTN-CD                                                  
                  ,:WA-ASSET-AMT                                                
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE TO W-DB2-SQLCODE                                     
              MOVE SQLCODE TO W-AST-SQLCODE                                     
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       MOVE 'Y' TO W-FLAG-ACCT-IN-TFR                           
                       MOVE 'Y' TO W-AST-FLAG-ACCT-IN-TFR(IDXA)                 
                       MOVE WA-ASSET-AMT TO W-AMT-DISPLAY                       
                       DISPLAY '   ACCT-IN-TFR=Y #3'                            
                       ' ' WA-CLIENT-NBR                                        
                       ' ' WA-ACAT-CONTROL-NBR                                  
                       ' ' WA-ASSET-SEQ-NBR                                     
                       ' ' WA-CSH-MGN-SHRT-CD                                   
                       ' ' WA-STTLM-LCTN-CD                                     
                       ' ' WA-STTLM-RSN-CD                                      
                       ' ' WA-PSTN-CD                                           
                       ' ' W-AMT-DISPLAY                                        
                       COMPUTE WS-ACTIVE-AMT =                                  
                               WS-ACTIVE-AMT + WA-ASSET-AMT                     
                  WHEN +100                                                     
                       CONTINUE                                                 
                  WHEN OTHER                                                    
                       DISPLAY ' ACTIAST CURSOR FETCH ERROR '                   
                               ' SQLCODE = ' W-DB2-SQLCODE                      
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM                                                          
                                                                                
           EXEC SQL CLOSE ACTIAST_CSH_CURSOR END-EXEC.                          
                                                                                
       7330-EXIT. EXIT.                                                         
      /                                                                         
      ***FIND OTHER REQUEST ON DATABASE FOR SAME CASH                           
      ***SUBTRACT THE AMOUNT FROM AVAILABLE AMOUNT                              
       7331-FIND-CASH-VTRNFR.                                                   
           MOVE '7331-FIND-CASH-VTRNFR.      ' TO W-ROUTINE-1.                  
                                                                                
           MOVE +0           TO W-TFR-SQLCODE                                   
           MOVE +0           TO W-AST-SQLCODE                                   
           EXEC SQL OPEN VTRNFR_CSH_CURSOR END-EXEC                             
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-TFR-SQLCODE                                   
                                                                                
           PERFORM UNTIL W-TFR-SQLCODE NOT = +0                                 
              EXEC SQL                                                          
                   FETCH VTRNFR_CSH_CURSOR                                      
              INTO                                                              
                   :WT-CLIENT-NBR                                               
                  ,:WT-ACAT-CONTROL-NBR                                         
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE      TO W-DB2-SQLCODE                                
              MOVE SQLCODE      TO W-TFR-SQLCODE                                
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       PERFORM 7132-FIND-CASH-VASSET THRU 7132-EXIT             
                  WHEN +100                                                     
                       CONTINUE                                                 
                  WHEN OTHER                                                    
                       DISPLAY ' VTRNFR CURSOR FETCH ERROR '                    
                               ' SQLCODE = ' W-DB2-SQLCODE                      
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM                                                          
                                                                                
           EXEC SQL                                                             
                CLOSE VTRNFR_CSH_CURSOR                                         
           END-EXEC.                                                            
                                                                                
       7331-EXIT. EXIT.                                                         
      /                                                                         
      ***FIND OTHER REQUEST ON DATABASE FOR SAME CASH                           
      ***SUBTRACT THE AMOUNT FROM AVAILABLE AMOUNT                              
       7132-FIND-CASH-VASSET.                                                   
           MOVE '7132-FIND-CASH-VASSET.        ' TO W-ROUTINE-1.                
                                                                                
           MOVE +0           TO W-AST-SQLCODE                                   
           EXEC SQL OPEN VASSET_CSH_CURSOR END-EXEC                             
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-AST-SQLCODE                                   
                                                                                
           PERFORM UNTIL W-AST-SQLCODE NOT = +0                                 
              EXEC SQL                                                          
                   FETCH VASSET_CSH_CURSOR                                      
              INTO                                                              
                   :WA-CLIENT-NBR                                               
                  ,:WA-ACAT-CONTROL-NBR                                         
                  ,:WA-ASSET-SEQ-NBR                                            
                  ,:WA-CSH-MGN-SHRT-CD                                          
                  ,:WA-STTLM-LCTN-CD                                            
                  ,:WA-STTLM-RSN-CD                                             
                  ,:WA-PSTN-CD                                                  
                  ,:WA-ASSET-AMT                                                
              END-EXEC                                                          
                                                                                
              MOVE SQLCODE      TO W-DB2-SQLCODE                                
              MOVE SQLCODE      TO W-AST-SQLCODE                                
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       MOVE 'Y' TO W-FLAG-ACCT-IN-TFR                           
                       MOVE 'Y' TO W-AST-FLAG-ACCT-IN-TFR(IDXA)                 
                       MOVE WA-ASSET-AMT TO W-AMT-DISPLAY                       
                       DISPLAY '   ACCT-IN-TFR=Y #4'                            
                       ' ' WA-CLIENT-NBR                                        
                       ' ' WA-ACAT-CONTROL-NBR                                  
                       ' ' WA-ASSET-SEQ-NBR                                     
                       ' ' WA-CSH-MGN-SHRT-CD                                   
                       ' ' WA-STTLM-LCTN-CD                                     
                       ' ' WA-STTLM-RSN-CD                                      
                       ' ' WA-PSTN-CD                                           
                       ' ' W-AMT-DISPLAY                                        
                       COMPUTE WS-ACTIVE-AMT =                                  
                               WS-ACTIVE-AMT + WA-ASSET-AMT                     
                  WHEN +100                                                     
                       CONTINUE                                                 
                  WHEN OTHER                                                    
                       DISPLAY ' VASSET CURSOR FETCH ERROR '                    
                               ' SQLCODE = ' W-DB2-SQLCODE                      
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM                                                          
                                                                                
           EXEC SQL                                                             
                CLOSE VASSET_CSH_CURSOR                                         
           END-EXEC.                                                            
                                                                                
       7132-EXIT. EXIT.                                                         
      /                                                                         
      ***CHECK IF REQUEST WAS FULFILLED                                         
       7400-CHECK-FULFILLMENT.                                                  
           MOVE '7400-CHECK-FULFILLMENT.       ' TO W-ROUTINE-1.                
                                                                                
           PERFORM VARYING IDXR FROM 1 BY 1 UNTIL IDXR > W-REQ-SIZE             
             IF W-REQ-RECORD(IDXR)(1:41) > ' '                                  
      ***---PERCENTAGE REQUESTED FOR SECURITY                                   
               IF  (W-REQ-KEY-ASSET-REQ-TRNCD(IDXR) = '1')                      
               AND (W-REQ-KEY-SECURITY-ADP-NBR(IDXR)(1:1) > ' ' OR              
                    W-REQ-KEY-SECURITY-ADP-NBR(IDXR)      = ' ')                
                    IF W-REQ-GOT-ASSET-QTY(IDXR) = 0                            
                       MOVE 'Y' TO W-ASSET-ZERO-FOUND-SW                        
                       SET W-SEC-NONE-FOUND TO TRUE                             
                       DISPLAY '7400-ZERO FOUND #1   '                          
                                              W-REQ-RECORD(IDXR)(1:41)          
                    ELSE                                                        
                     IF W-REQ-GOT-ASSET-QTY(IDXR) <                             
                        W-REQ-KEY-ASSET-QTY(IDXR)                               
                        MOVE 'Y' TO W-ASSET-LESS-THAN-REQ-SW                    
                        SET W-SEC-LESS-THAN-REQ TO TRUE                         
                        DISPLAY '7400-LESS: #1        '                         
                                               W-REQ-RECORD(IDXR)(1:41)         
                     ELSE                                                       
                        SET W-SEC-FULL-FOUND TO TRUE                            
                     END-IF                                                     
                    END-IF                                                      
               END-IF                                                           
      ***---PERCENTAGE REQUESTED FOR CASH                                       
               IF  (W-REQ-KEY-ASSET-REQ-TRNCD(IDXR) = '1')                      
               AND (W-REQ-KEY-SECURITY-ADP-NBR(IDXR) = ' 40CRED' OR             
                    W-REQ-KEY-SECURITY-ADP-NBR(IDXR) = ' 40DEB ' OR             
                    W-REQ-KEY-SECURITY-ADP-NBR(IDXR) = ' 45SMA ')               
                    IF W-REQ-GOT-ASSET-AMT(IDXR) = 0                            
                       MOVE 'Y' TO W-ASSET-ZERO-FOUND-SW                        
                       SET W-CSH-NONE-FOUND TO TRUE                             
                       DISPLAY '7400-ZERO FOUND #2   '                          
                                              W-REQ-RECORD(IDXR)(1:41)          
                    ELSE                                                        
                     IF W-REQ-GOT-ASSET-AMT(IDXR) <                             
                        W-REQ-KEY-ASSET-AMT(IDXR)                               
                        MOVE 'Y' TO W-ASSET-LESS-THAN-REQ-SW                    
                        SET W-CSH-LESS-THAN-REQ TO TRUE                         
                        DISPLAY '7400-LESS: #2        '                         
                                               W-REQ-RECORD(IDXR)(1:41)         
                     ELSE                                                       
                        SET W-CSH-FULL-FOUND TO TRUE                            
                     END-IF                                                     
                    END-IF                                                      
               END-IF                                                           
      ***---QUANTITY REQUESTED FOR OPTIONS                                      
               IF  (W-REQ-KEY-ASSET-REQ-TRNCD(IDXR) = '2')                      
               AND (W-REQ-KEY-SECURITY-ADP-NBR(IDXR)(1:1) > ' ' OR              
                    W-REQ-KEY-SECURITY-ADP-NBR(IDXR)      = ' ')                
               AND (W-REQ-KEY-STTLM-LCTN-CD(IDXR)    = '35')                    
                    IF W-REQ-GOT-ASSET-QTY(IDXR) = 0                            
                       MOVE 'Y' TO W-ASSET-ZERO-FOUND-SW                        
                       SET W-CSH-NONE-FOUND TO TRUE                             
                       DISPLAY '7400-ZERO FOUND #3   '                          
                                              W-REQ-RECORD(IDXR)(1:41)          
                    ELSE                                                        
                     IF W-REQ-GOT-ASSET-QTY(IDXR) <                             
                        W-REQ-KEY-ASSET-QTY(IDXR)                               
                        MOVE 'Y' TO W-ASSET-LESS-THAN-REQ-SW                    
                        SET W-CSH-LESS-THAN-REQ TO TRUE                         
                        DISPLAY '7400-LESS: #3        '                         
                                               W-REQ-RECORD(IDXR)(1:41)         
                     ELSE                                                       
                        SET W-CSH-FULL-FOUND TO TRUE                            
                     END-IF                                                     
                    END-IF                                                      
               END-IF                                                           
      ***---QUANTITY REQUESTED FOR SECURITIES                                   
               IF  (W-REQ-KEY-ASSET-REQ-TRNCD(IDXR) = '2')                      
               AND (W-REQ-KEY-SECURITY-ADP-NBR(IDXR)(1:1) > ' ' OR              
                    W-REQ-KEY-SECURITY-ADP-NBR(IDXR)      = ' ')                
                    IF W-REQ-GOT-ASSET-QTY(IDXR) = 0                            
                       MOVE 'Y' TO W-ASSET-ZERO-FOUND-SW                        
                       SET W-SEC-NONE-FOUND TO TRUE                             
                       DISPLAY '7400-ZERO FOUND ' IDXR ' ' IDXA '  '            
                                              W-REQ-RECORD(IDXR)(1:41)          
                    ELSE                                                        
                     IF W-REQ-GOT-ASSET-QTY(IDXR) <                             
                        W-REQ-KEY-ASSET-QTY(IDXR)                               
                        MOVE 'Y' TO W-ASSET-LESS-THAN-REQ-SW                    
                        SET W-SEC-LESS-THAN-REQ TO TRUE                         
                        DISPLAY '7400-LESS: #4        '                         
                                               W-REQ-RECORD(IDXR)(1:41)         
                     ELSE                                                       
                        SET W-SEC-FULL-FOUND TO TRUE                            
                     END-IF                                                     
                    END-IF                                                      
               END-IF                                                           
      ***---AMOUNT REQUESTED FOR OPTIONS                                        
               IF  (W-REQ-KEY-ASSET-REQ-TRNCD(IDXR) = '3')                      
               AND (W-REQ-KEY-SECURITY-ADP-NBR(IDXR)(1:1) > ' ' OR              
                    W-REQ-KEY-SECURITY-ADP-NBR(IDXR)      = ' ')                
               AND (W-REQ-KEY-STTLM-LCTN-CD(IDXR)    = '35')                    
                    IF W-REQ-GOT-ASSET-AMT(IDXR) = 0                            
                       MOVE 'Y' TO W-ASSET-ZERO-FOUND-SW                        
                       SET W-SEC-NONE-FOUND TO TRUE                             
                       DISPLAY '7400-ZERO FOUND #5   '                          
                                              W-REQ-RECORD(IDXR)(1:41)          
                    ELSE                                                        
                     IF W-REQ-GOT-ASSET-AMT(IDXR) <                             
                        W-REQ-KEY-ASSET-AMT(IDXR)                               
                        MOVE 'Y' TO W-ASSET-LESS-THAN-REQ-SW                    
                        SET W-SEC-LESS-THAN-REQ TO TRUE                         
                        DISPLAY '7400-LESS: #5        '                         
                                               W-REQ-RECORD(IDXR)(1:41)         
                     ELSE                                                       
                        SET W-SEC-FULL-FOUND TO TRUE                            
                     END-IF                                                     
                    END-IF                                                      
               END-IF                                                           
      ***---AMOUNT REQUESTED FOR SECURITIES                                     
               IF  (W-REQ-KEY-ASSET-REQ-TRNCD(IDXR) = '3')                      
               AND (W-REQ-KEY-SECURITY-ADP-NBR(IDXR)(1:1) > ' ' OR              
                    W-REQ-KEY-SECURITY-ADP-NBR(IDXR)      = ' ')                
               AND (W-REQ-KEY-STTLM-LCTN-CD(IDXR) NOT = '35')                   
                    IF W-REQ-GOT-ASSET-AMT(IDXR) = 0                            
                       MOVE 'Y' TO W-ASSET-ZERO-FOUND-SW                        
                       SET W-SEC-NONE-FOUND TO TRUE                             
                       DISPLAY '7400-ZERO FOUND #6   '                          
                                              W-REQ-RECORD(IDXR)(1:41)          
                    ELSE                                                        
                     IF W-REQ-GOT-ASSET-AMT(IDXR) <                             
                        W-REQ-KEY-ASSET-AMT(IDXR)                               
                        MOVE 'Y' TO W-ASSET-LESS-THAN-REQ-SW                    
                        SET W-SEC-LESS-THAN-REQ TO TRUE                         
                        DISPLAY '7400-LESS: #6        '                         
                                               W-REQ-RECORD(IDXR)(1:41)         
                     ELSE                                                       
                        SET W-SEC-FULL-FOUND TO TRUE                            
                     END-IF                                                     
                    END-IF                                                      
               END-IF                                                           
      ***---AMOUNT REQUESTED FOR CASH                                           
               IF  (W-REQ-KEY-ASSET-REQ-TRNCD(IDXR) = '3')                      
               AND (W-REQ-KEY-SECURITY-ADP-NBR(IDXR) = ' 40CRED' OR             
                    W-REQ-KEY-SECURITY-ADP-NBR(IDXR) = ' 40DEB ' OR             
                    W-REQ-KEY-SECURITY-ADP-NBR(IDXR) = ' 45SMA ')               
                    IF W-REQ-GOT-ASSET-AMT(IDXR) = 0                            
                       MOVE 'Y' TO W-ASSET-ZERO-FOUND-SW                        
                       SET W-CSH-NONE-FOUND TO TRUE                             
                       DISPLAY '7400-ZERO FOUND #7   '                          
                                              W-REQ-RECORD(IDXR)(1:41)          
                    ELSE                                                        
                     IF W-REQ-GOT-ASSET-AMT(IDXR) <                             
                        W-REQ-KEY-ASSET-AMT(IDXR)                               
                        MOVE 'Y' TO W-ASSET-LESS-THAN-REQ-SW                    
                        SET W-CSH-LESS-THAN-REQ TO TRUE                         
                        DISPLAY '7400-LESS: #7        '                         
                                               W-REQ-RECORD(IDXR)(1:41)         
                     ELSE                                                       
                        SET W-CSH-FULL-FOUND TO TRUE                            
                     END-IF                                                     
                    END-IF                                                      
               END-IF                                                           
             END-IF                                                             
           END-PERFORM                                                          
           .                                                                    
       7400-EXIT. EXIT.                                                         
      /                                                                         
      ***WRITE MATCHED DATA TO FLAT FILE                                        
       7500-OUTPUT-MATCHED.                                                     
                                                                                
      ***WRITE ORIGINAL REQUEST FOR ASSET                                       
           PERFORM VARYING IDXR FROM 1 BY 1 UNTIL IDXR > W-REQ-SIZE             
             IF W-REQ-TAB(IDXR) > ' '                                           
                MOVE W-REQ-TAB(IDXR) TO FIN-RECORD                              
                MOVE ' '             TO FIN-RECORD(27:2)                        
                WRITE FIN-RECORD                                                
                ADD 1 TO W-ACATPTRF-CNT                                         
             END-IF                                                             
           END-PERFORM                                                          
                                                                                
      ***WRITE FULFILLED DATA FOR ASSET                                         
           PERFORM VARYING IDXA FROM 1 BY 1 UNTIL IDXA > W-AST-SIZE             
             IF W-AST-KEY-FULFILL(IDXA) > ' '                                   
              IF W-AST-KEY-ASSET-QTY(IDXA) NOT = 0                              
              OR W-AST-KEY-ASSET-AMT(IDXA) NOT = 0                              
                MOVE 'Y' TO W-ASSET-ADDED-FOR-ACCT-SW                           
                DISPLAY '7500-OUTPUT-MATCH ' IDXA ': '                          
                                                W-AST-RECORD(IDXA)(1:41)        
                           ' ADD='                                              
                             W-ASSET-ADDED-FOR-ACCT-SW                          
LRM029          IF W-AST-AT-ASSET-AMT-STTS-CD(IDXA) = 'Z'                       
LRM029          AND W-AST-KEY-ASSET-QTY(IDXA) NOT = 0                           
LRM029          AND W-AST-KEY-ASSET-AMT(IDXA) < 1.00                            
LRM029             DISPLAY '  USE MINIMUM 1.00 ON UNPRICED ASSET AMT'           
LRM029             MOVE 1.00 TO W-AST-AT-ASSET-AMT(IDXA)                        
LRM029             MOVE ' ' TO W-AST-AT-ASSET-AMT-STTS-CD(IDXA)                 
LRM029          END-IF                                                          
                PERFORM 7510-INSERT-INIT-TABLES THRU 7510-EXIT                  
                MOVE W-AST-TAB(IDXA)  TO FIN-RECORD                             
                MOVE ' '              TO FIN-RECORD(27:2)                       
                WRITE FIN-RECORD                                                
                ADD 1 TO W-ACATPTRF-CNT                                         
              END-IF                                                            
             END-IF                                                             
           END-PERFORM                                                          
           .                                                                    
       7500-EXIT. EXIT.                                                         
      /                                                                         
       7510-INSERT-INIT-TABLES.                                                 
           MOVE '7510-INSERT-INIT-TABLES       ' TO W-ROUTINE-1.                
                                                                                
           IF  W-AST-FLAG-LP(IDXA) = 'Y'                                        
               DISPLAY '   W-AST-FLAG-LP(IDXA)=Y'                               
               MOVE W-AST-FLAG-LP(IDXA) TO W-FLAG-LP                            
               IF W-AST-LP-CODE(IDXA) > '00'                                    
                  MOVE W-AST-LP-CODE(IDXA) TO W-LP-CODE                         
                  DISPLAY '   W-LP-CODE=' W-LP-CODE                             
                  MOVE 'Y' TO W-REJECT-AUTO-SW                                  
               END-IF                                                           
           END-IF                                                               
           IF  W-AST-FLAG-PRIV(IDXA) = 'Y'                                      
               DISPLAY '   W-AST-FLAG-PRIV(IDXA)=Y'                             
               MOVE W-AST-FLAG-PRIV(IDXA) TO W-FLAG-LP                          
               IF W-AST-PRIV-CODE(IDXA) > '00'                                  
                  MOVE W-AST-PRIV-CODE(IDXA) TO W-PRIV-CODE                     
                  DISPLAY '   W-PRIV-CODE=' W-PRIV-CODE                         
                  MOVE 'Y' TO W-REJECT-AUTO-SW                                  
               END-IF                                                           
           END-IF                                                               
           IF  W-AST-FLAG-NTS(IDXA)  = 'Y'                                      
               DISPLAY '   W-AST-FLAG-NTS(IDXA)=Y'                              
               MOVE W-AST-FLAG-NTS(IDXA)   TO W-FLAG-NTS                        
               IF W-AST-NTS-CODE(IDXA)      > '00'                              
                  MOVE W-AST-NTS-CODE(IDXA)   TO W-NTS-CODE                     
                  DISPLAY '   W-NTS-CODE=' W-NTS-CODE                           
                  MOVE 'Y' TO W-REJECT-AUTO-SW                                  
               END-IF                                                           
           END-IF                                                               
           IF  W-AST-FLAG-SPAD(IDXA) = 'Y'                                      
               DISPLAY '   W-AST-FLAG-SPAD(IDXA)=Y'                             
               MOVE W-AST-FLAG-SPAD(IDXA) TO W-FLAG-LP                          
               IF W-AST-SPAD-CODE(IDXA) > '00'                                  
                  MOVE W-AST-SPAD-CODE(IDXA) TO W-SPAD-CODE                     
                  DISPLAY '   W-SPAD-CODE=' W-SPAD-CODE                         
                  MOVE 'Y' TO W-REJECT-AUTO-SW                                  
               END-IF                                                           
           END-IF                                                               
           IF  W-AST-FLAG-MARGIN-DEBIT(IDXA) = 'Y'                              
               DISPLAY '   W-AST-FLAG-MARGIN-DEBIT(IDXA)=Y'                     
               MOVE 'Y' TO W-FLAG-MARGIN-DEBIT                                  
           END-IF                                                               
           IF  W-AST-FLAG-ASSET-VALUE(IDXA)  = 'Y'                              
               DISPLAY '   W-AST-FLAG-ASSET-VALUE(IDXA)=Y'                      
               MOVE 'Y' TO W-FLAG-ASSET-VALUE                                   
           END-IF                                                               
           IF  W-AST-FLAG-TOTL-ACT-VAL(IDXA) = 'Y'                              
               DISPLAY '   W-AST-FLAG-TOTL-ACT-VAL(IDXA)=Y'                     
               MOVE 'Y' TO W-FLAG-TOTL-ACT-VAL                                  
           END-IF                                                               
           IF  W-AST-FLAG-EXP-OPT-POSN(IDXA) = 'Y'                              
               DISPLAY '   W-AST-FLAG-EXP-OPT-POSN(IDXA)=Y'                     
               MOVE 'Y' TO W-FLAG-EXP-OPT-POSN                                  
           END-IF                                                               
           IF  W-AST-FLAG-OPTION(IDXA)       = 'Y'                              
               DISPLAY '   W-AST-FLAG-OPTION(IDXA)=Y'                           
               MOVE 'Y' TO W-FLAG-OPTION                                        
           END-IF                                                               
           IF  W-AST-FLAG-OPEN-ORDER(IDXA)   = 'Y'                              
               DISPLAY '   W-AST-FLAG-OPEN-ORDER(IDXA)=Y'                       
               MOVE 'Y' TO W-FLAG-OPEN-ORDER                                    
           END-IF                                                               
                                                                                
           MOVE W-AST-AT-PART (IDXA)   TO DCLACTIAST                            
           PERFORM 7600-INSERT-ACTIAST THRU 7600-EXIT                           
DJ0009     IF  W-AST-KEY-ASSET-QTY-LEFT (IDXA) NOT NUMERIC                      
DJ0009         MOVE 0 TO W-AST-KEY-ASSET-QTY-LEFT (IDXA)                        
DJ0009     END-IF                                                               
DJ0009***DO NOT LIQUIDATE FRACTION IF THERE ARE WHOLE QUANTITIES LEFT           
           IF W-AST-REMOVE-FRACTION-IND(IDXA) = 'Y'                             
DJ0009      IF  W-AST-KEY-ASSET-QTY-LEFT (IDXA) = 0                             
DJ0009          MOVE W-AST-KEY-ASSET-QTY-LEFT(IDXA) TO W-QTY-DISPLAY            
DJ0009          DISPLAY '   QTY-LEFT=' W-QTY-DISPLAY                            
DJ0009                   '  FRAC-QTY=' W-AST-FRAC-QTY(IDXA)                     
DJ0009                   '  LIQUIDATE FRACTION'                                 
                PERFORM 7810-WRITE-ACATDLVF-FRAC  THRU 7810-EXIT                
            ELSE                                                                
DJ0009          MOVE W-AST-KEY-ASSET-QTY-LEFT(IDXA) TO W-QTY-DISPLAY            
DJ0009          DISPLAY '   QTY-LEFT=' W-QTY-DISPLAY                            
DJ0009                   '  FRAC-QTY=' W-AST-FRAC-QTY(IDXA)                     
DJ0009                   '  DO NOT LIQUIDATE FRACTION'                          
DJ0009      END-IF                                                              
           END-IF                                                               
                                                                                
           IF  W-AST-OP-STTLM-LCTN-CD (IDXA) = '35'                             
               MOVE W-AST-OP-PART (IDXA)   TO DCLACTIOPN                        
               PERFORM 7610-INSERT-ACTIOPN THRU 7610-EXIT                       
           ELSE                                                                 
             IF  W-AST-MF-STTLM-LCTN-CD (IDXA) = '10'                           
                 MOVE W-AST-MF-PART (IDXA)  TO DCLACTIMF                        
                 PERFORM 7620-INSERT-ACTIMF THRU 7620-EXIT                      
             END-IF                                                             
           END-IF.                                                              
                                                                                
       7510-EXIT. EXIT.                                                         
      /                                                                         
       7600-INSERT-ACTIAST.                                                     
           MOVE '7600-INSERT-ACTIAST           ' TO W-ROUTINE-1.                
                                                                                
CSG001* IN SOME CASES MSD DESCRIPTIONS CONTAIN SPECIAL CHARACTERS.              
CSG001* CORRECT THEM BY REPLACING SPECIAL CHARACTERS WITH SPACES.               
CSG001     MOVE ASSET-DESC-TXT OF DCLACTIAST TO W-ASSET-DESC-TXT                
CSG001     PERFORM 6500-EDIT-ASSET-DESC-TXT THRU 6500-EXIT                      
CSG001     MOVE W-ASSET-DESC-TXT TO ASSET-DESC-TXT OF DCLACTIAST                
CSG001                                                                          
DJ0012****CHECK TO SEE IF THERE ARE MEMO('45') ASSETS                           
DJ0012     IF STTLM-LCTN-CD OF DCLACTIAST = '45'                                
DJ0011        ADD 1 TO W-IS-MEMO-CNT                                            
DJ0011     ELSE                                                                 
DJ0011        ADD 1 TO W-NOT-MEMO-CNT                                           
DJ0011     END-IF                                                               
                                                                                
      **--DO NOT SEND WITHHELD ASSETS TO NSCC IF B1#434713 IS ON.               
           IF  NSCC-WTHLD-CD OF DCLACTIAST = 'W'                                
               DISPLAY '   NSCC-WTHLD-CD=W:'                                    
                            ' CLT=' CLIENT-NBR        OF DCLACTIAST             
                            ' CTL=' ACAT-CONTROL-NBR  OF DCLACTIAST             
                            ' SEQ=' ASSET-SEQ-NBR     OF DCLACTIAST             
                             ' CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                             ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
                             ' SL=' STTLM-LCTN-CD     OF DCLACTIAST             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
            IF BH-ACAT-MEMO-ASSETS-FOR-PTR = '1'                                
               MOVE 'H'          TO NSCC-PEND-CD  OF DCLACTIAST                 
               DISPLAY '   BH-ACAT-MEMO-ASSETS-FOR-PTR=1 HOLD WITHHELD'         
            END-IF                                                              
           END-IF                                                               
                                                                                
      ***SAVE THE KEY FIELDS                                                    
           MOVE CLIENT-NBR        OF DCLACTIAST TO WF-CLIENT-NBR                
           MOVE DLVR-NBR          OF DCLACTIAST TO WF-DLVR-NBR                  
           MOVE ACCT-DLVR-NBR     OF DCLACTIAST TO WF-ACCT-DLVR-NBR             
           MOVE RCV-NBR           OF DCLACTIAST TO WF-RCV-NBR                   
           MOVE ACCT-RCV-NBR      OF DCLACTIAST TO WF-ACCT-RCV-NBR              
           MOVE TRNFR-TYPE-CD     OF DCLACTIAST TO WF-TRNFR-TYPE-CD             
           MOVE ACAT-CONTROL-NBR  OF DCLACTIAST TO WF-ACAT-CONTROL-NBR          
           MOVE ISIN-CNTRY-CD     OF DCLACTIAST TO WF-ISIN-CNTRY-CD             
           MOVE ISIN-SEC-ISSUE-CD OF DCLACTIAST TO WF-ISIN-SEC-ISSUE-CD         
           MOVE ISIN-SEC-CDG-CD   OF DCLACTIAST TO WF-ISIN-SEC-CDG-CD           
           MOVE STTLM-LCTN-CD     OF DCLACTIAST TO WF-STTLM-LCTN-CD             
           MOVE CSH-MGN-SHRT-CD   OF DCLACTIAST TO WF-CSH-MGN-SHRT-CD           
           MOVE SECURITY-ADP-NBR  OF DCLACTIAST TO WF-SECURITY-ADP-NBR          
                                                                                
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
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-ACTIAST-NOT-ADD-CNT                                   
                   DISPLAY '   ACTIAST NOT ADDED.'                              
                             ' SQLCODE = ' W-DB2-SQLCODE                        
                             ' IF SQLCODE=-803(DUPE), UPDATE IT'                
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
                   DISPLAY '           '                                        
                            ' CTL=' ACAT-CONTROL-NBR  OF DCLACTIAST             
                            ' SEQ=' ASSET-SEQ-NBR     OF DCLACTIAST             
               IF  SQLCODE  =  -803                                             
                   PERFORM 7660-UPDATE-ACTIAST THRU 7660-EXIT                   
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT518: ERROR INSERTING A ROW INTO ACTIAST'         
                         ' (ACAT-ASSET TABLE)'                                  
                   DISPLAY 'CAT518: W-AST-REC(' IDXA ')='                       
                                '(' W-AST-REC(IDXA) ')'                         
                   DISPLAY 'CAT518: DCLACTIAST  ='                              
                                '(' DCLACTIAST ')'                              
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       7600-EXIT. EXIT.                                                         
      /                                                                         
LRM020******************************************************************        
LRM020*  CREATE AUDIT ROW WITH CLIENT NUMBER W### TO DRIVE X SCREEN             
LRM020*  UPDATE IN CAT755.                                                      
LRM020*****************************************************************         
LRM020 7605-INSERT-ACTIAST-AUD  SECTION.                                        
LRM020     MOVE '7605-INSERT-ACTIAST-AUD       ' TO W-ROUTINE-1.                
LRM020                                                                          
CSG001* IN SOME CASES MSD DESCRIPTIONS CONTAIN SPECIAL CHARACTERS.              
CSG001* CORRECT THEM BY REPLACING SPECIAL CHARACTERS WITH SPACES.               
CSG001     MOVE ASSET-DESC-TXT OF DCLACTIAST   TO W-ASSET-DESC-TXT              
CSG001     PERFORM 6500-EDIT-ASSET-DESC-TXT    THRU 6500-EXIT                   
CSG001     MOVE W-ASSET-DESC-TXT TO ASSET-DESC-TXT OF DCLACTIAST                
CSG001                                                                          
LRM020     MOVE  'W'                            TO W-CLIENT-NBR-AUD-PFX.        
LRM020     MOVE  CLIENT-NBR OF DCLACTIAST (2:3) TO W-CLIENT-NBR-AUD-SFX.        
LRM020                                                                          
LRM020     EXEC SQL                                                             
LRM020         INSERT INTO ACTIAST                                              
LRM020           (                                                              
LRM020             CLIENT_NBR                                                   
LRM020            ,ACAT_CONTROL_NBR                                             
LRM020            ,ASSET_SEQ_NBR                                                
LRM020            ,RCRD_STTS_CD                                                 
LRM020            ,RCRD_LNGTH_STTS_CD                                           
LRM020            ,PHSCL_SEQ_STTS_CD                                            
LRM020            ,LGCL_SEQ_NR_STS_CD                                           
LRM020            ,TRANS_TYPE_STTS_CD                                           
LRM020            ,TRNFR_TYPE_STTS_CD                                           
LRM020            ,CONTROL_NBR_STS_CD                                           
LRM020            ,SBMT_PRT_NR_STS_CD                                           
LRM020            ,RCV_NBR_STTS_CD                                              
LRM020            ,DLVR_NBR_STTS_CD                                             
LRM020            ,TRANS_RFRN_STTS_CD                                           
LRM020            ,AST_SEQ_NBR_STS_CD                                           
LRM020            ,AST_PRC_CTG_STS_CD                                           
LRM020            ,OPTN_CTGY_STTS_CD                                            
LRM020            ,STTLM_LCTN_STTS_CD                                           
LRM020            ,STTLM_RSN_STTS_CD                                            
LRM020            ,ISIN_CNTRY_STTS_CD                                           
LRM020            ,ISIN_SEC_IS_STS_CD                                           
LRM020            ,ISIN_SEC_CD_STS_CD                                           
LRM020            ,ASSET_DESC_STTS_CD                                           
LRM020            ,ASSET_RQST_STS_CD                                            
LRM020            ,AST_RQ_TRAN_STS_CD                                           
LRM020            ,ASSET_QTY_STTS_CD                                            
LRM020            ,ASSET_PCT_STTS_CD                                            
LRM020            ,PSTN_CD_STTS_CD                                              
LRM020            ,ISO_CRNCY_STTS_CD                                            
LRM020            ,ASSET_AMT_STTS_CD                                            
LRM020            ,BEARER_BND_STTS_CD                                           
LRM020            ,CSH_MRG_SHT_STS_CD                                           
LRM020            ,WHI_STTS_CD                                                  
LRM020            ,TRN_TYP_RSN_STS_CD                                           
LRM020            ,MBS_SERIAL_STTS_CD                                           
LRM020            ,ASSET_CMNT_STTS_CD                                           
LRM020            ,PHSCL_SEQ_NBR                                                
LRM020            ,LGCL_SEQ_NBR                                                 
LRM020            ,TRANS_TYPE_CD                                                
LRM020            ,TRNFR_TYPE_CD                                                
LRM020            ,SBMTG_PRTCP_NBR                                              
LRM020            ,RCV_NBR                                                      
LRM020            ,DLVR_NBR                                                     
LRM020            ,TRANS_RFRN_ID_CD                                             
LRM020            ,ASSET_PRC_CTGY_CD                                            
LRM020            ,OPTN_CTGY_CD                                                 
LRM020            ,STTLM_LCTN_CD                                                
LRM020            ,STTLM_RSN_CD                                                 
LRM020            ,ISIN_CNTRY_CD                                                
LRM020            ,ISIN_SEC_ISSUE_CD                                            
LRM020            ,ISIN_SEC_CDG_CD                                              
LRM020            ,ASSET_DESC_TXT                                               
LRM020            ,ASSET_RQST_QTY_CD                                            
LRM020            ,AST_RQST_TRANS_CD                                            
LRM020            ,ASSET_QTY                                                    
LRM020            ,ASSET_PCT                                                    
LRM020            ,PSTN_CD                                                      
LRM020            ,ISO_CRNCY_CD                                                 
LRM020            ,ASSET_AMT                                                    
LRM020            ,BEARER_BOND_CD                                               
LRM020            ,CSH_MGN_SHRT_CD                                              
LRM020            ,WHI_CD                                                       
LRM020            ,TRNFR_TYPE_RSN_CD                                            
LRM020            ,MBS_SERIAL_NBR                                               
LRM020            ,ASSET_CMNT_TXT                                               
LRM020            ,PRGM_NM                                                      
LRM020            ,CICS_TERM_ID_CD                                              
LRM020            ,CRT_TMSTP                                                    
LRM020            ,UPDT_TMSTP                                                   
LRM020            ,ACCT_DLVR_NBR                                                
LRM020            ,ACCT_RCV_NBR                                                 
LRM020            ,SECURITY_ADP_NBR                                             
LRM020            ,NSCC_ACK_IND                                                 
LRM020            ,NSCC_PEND_CD                                                 
LRM020            ,NSCC_WTHLD_CD                                                
LRM020           )                                                              
LRM020           VALUES                                                         
LRM020           (                                                              
LRM020             :W-CLIENT-NBR-AUD                                            
LRM020            ,:DCLACTIAST.ACAT-CONTROL-NBR                                 
LRM020            ,:DCLACTIAST.ASSET-SEQ-NBR                                    
LRM020            ,:DCLACTIAST.RCRD-STTS-CD                                     
LRM020            ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                               
LRM020            ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                                
LRM020            ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                               
LRM020            ,:DCLACTIAST.TRANS-TYPE-STTS-CD                               
LRM020            ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                               
LRM020            ,:DCLACTIAST.CONTROL-NBR-STS-CD                               
LRM020            ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                               
LRM020            ,:DCLACTIAST.RCV-NBR-STTS-CD                                  
LRM020            ,:DCLACTIAST.DLVR-NBR-STTS-CD                                 
LRM020            ,:DCLACTIAST.TRANS-RFRN-STTS-CD                               
LRM020            ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                               
LRM020            ,:DCLACTIAST.AST-PRC-CTG-STS-CD                               
LRM020            ,:DCLACTIAST.OPTN-CTGY-STTS-CD                                
LRM020            ,:DCLACTIAST.STTLM-LCTN-STTS-CD                               
LRM020            ,:DCLACTIAST.STTLM-RSN-STTS-CD                                
LRM020            ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                               
LRM020            ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                               
LRM020            ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                               
LRM020            ,:DCLACTIAST.ASSET-DESC-STTS-CD                               
LRM020            ,:DCLACTIAST.ASSET-RQST-STS-CD                                
LRM020            ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                               
LRM020            ,:DCLACTIAST.ASSET-QTY-STTS-CD                                
LRM020            ,:DCLACTIAST.ASSET-PCT-STTS-CD                                
LRM020            ,:DCLACTIAST.PSTN-CD-STTS-CD                                  
LRM020            ,:DCLACTIAST.ISO-CRNCY-STTS-CD                                
LRM020            ,:DCLACTIAST.ASSET-AMT-STTS-CD                                
LRM020            ,:DCLACTIAST.BEARER-BND-STTS-CD                               
LRM020            ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                               
LRM020            ,:DCLACTIAST.WHI-STTS-CD                                      
LRM020            ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                               
LRM020            ,:DCLACTIAST.MBS-SERIAL-STTS-CD                               
LRM020            ,:DCLACTIAST.ASSET-CMNT-STTS-CD                               
LRM020            ,:DCLACTIAST.PHSCL-SEQ-NBR                                    
LRM020            ,:DCLACTIAST.LGCL-SEQ-NBR                                     
LRM020            ,:DCLACTIAST.TRANS-TYPE-CD                                    
LRM020            ,:DCLACTIAST.TRNFR-TYPE-CD                                    
LRM020            ,:DCLACTIAST.SBMTG-PRTCP-NBR                                  
LRM020            ,:DCLACTIAST.RCV-NBR                                          
LRM020            ,:DCLACTIAST.DLVR-NBR                                         
LRM020            ,:DCLACTIAST.TRANS-RFRN-ID-CD                                 
LRM020            ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                
LRM020            ,:DCLACTIAST.OPTN-CTGY-CD                                     
LRM020            ,:DCLACTIAST.STTLM-LCTN-CD                                    
LRM020            ,:DCLACTIAST.STTLM-RSN-CD                                     
LRM020            ,:DCLACTIAST.ISIN-CNTRY-CD                                    
LRM020            ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                
LRM020            ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
LRM020            ,:DCLACTIAST.ASSET-DESC-TXT                                   
LRM020            ,:DCLACTIAST.ASSET-RQST-QTY-CD                                
LRM020            ,:DCLACTIAST.AST-RQST-TRANS-CD                                
LRM020            ,:DCLACTIAST.ASSET-QTY                                        
LRM020            ,:DCLACTIAST.ASSET-PCT                                        
LRM020            ,:DCLACTIAST.PSTN-CD                                          
LRM020            ,:DCLACTIAST.ISO-CRNCY-CD                                     
LRM020            ,:DCLACTIAST.ASSET-AMT                                        
LRM020            ,:DCLACTIAST.BEARER-BOND-CD                                   
LRM020            ,:DCLACTIAST.CSH-MGN-SHRT-CD                                  
LRM020            ,:DCLACTIAST.WHI-CD                                           
LRM020            ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                                
LRM020            ,:DCLACTIAST.MBS-SERIAL-NBR                                   
LRM020            ,:DCLACTIAST.ASSET-CMNT-TXT                                   
LRM020            ,:DCLACTIAST.PRGM-NM                                          
LRM020            ,:DCLACTIAST.CICS-TERM-ID-CD                                  
LRM020            ,:DCLACTIAST.CRT-TMSTP                                        
LRM020            ,:DCLACTIAST.UPDT-TMSTP                                       
LRM020            ,:DCLACTIAST.ACCT-DLVR-NBR                                    
LRM020            ,:DCLACTIAST.ACCT-RCV-NBR                                     
LRM020            ,:DCLACTIAST.SECURITY-ADP-NBR                                 
LRM020            ,:DCLACTIAST.NSCC-ACK-IND                                     
LRM020            ,:DCLACTIAST.NSCC-PEND-CD                                     
LRM020            ,:DCLACTIAST.NSCC-WTHLD-CD                                    
LRM020           )                                                              
LRM020     END-EXEC.                                                            
LRM020                                                                          
LRM020     MOVE SQLCODE                  TO W-DB2-SQLCODE                       
LRM020     IF  SQLCODE  =  +0                                                   
LRM020         ADD 1 TO W-BOND-AUDIT-ADD                                        
LRM020     ELSE                                                                 
LRM020         ADD 1 TO W-BOND-AUDIT-NOTADD                                     
LRM020             DISPLAY '   ACTIAST/BOND AUDIT NOT ADDED.'                   
LRM020                       ' SQLCODE = ' W-DB2-SQLCODE                        
LRM020             DISPLAY '   ACTIAST PRIMARY KEY:'                            
LRM020                      ' CLT=' W-CLIENT-NBR-AUD                            
LRM020                       ' CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
LRM020                      ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
LRM020                       ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
LRM020                       ' SL=' STTLM-LCTN-CD     OF DCLACTIAST             
LRM020                      ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST             
LRM020             DISPLAY '           '                                        
LRM020                      ' DLV=' DLVR-NBR          OF DCLACTIAST             
LRM020                   ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIAST             
LRM020                      ' RCV=' RCV-NBR           OF DCLACTIAST             
LRM020                   ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIAST             
LRM020     END-IF.                                                              
LRM020                                                                          
LRM020 7605-EXIT. EXIT.                                                         
      /                                                                         
       7610-INSERT-ACTIOPN.                                                     
           MOVE '7610-INSERT-ACTIOPN            ' TO W-ROUTINE-1.               
                                                                                
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
LRM015            ,STPRC_INTEGER2_AMT                                           
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
DJ0007            ,ACAT_CONTROL_NBR                                             
DJ0007            ,ASSET_SEQ_NBR                                                
DJ0007            ,TRNFR_TYPE_CD                                                
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
LRM015            ,:DCLACTIOPN.STPRC-INTEGER2-AMT                               
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
DJ0007            ,:DCLACTIOPN.ACAT-CONTROL-NBR                                 
DJ0007            ,:DCLACTIOPN.ASSET-SEQ-NBR                                    
DJ0007            ,:DCLACTIOPN.TRNFR-TYPE-CD                                    
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIOPN'                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIOPN-ADD-CNT                                       
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-ACTIOPN-NOT-ADD-CNT                                   
                   DISPLAY '   ACTIOPN NOT ADDED.'                              
                             ' SQLCODE = ' W-DB2-SQLCODE                        
                             ' IF SQLCODE=-803(DUPE), UPDATE IT'                
                   DISPLAY '   ACTIOPN PRIMARY KEY:'                            
                            ' CLT=' CLIENT-NBR        OF DCLACTIOPN             
                             ' CC=' ISIN-CNTRY-CD     OF DCLACTIOPN             
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIOPN             
                             ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIOPN             
                             ' SL=' STTLM-LCTN-CD     OF DCLACTIOPN             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIOPN             
                            ' EXP DT=' EXPTN-DT       OF DCLACTIOPN             
                   DISPLAY '           '                                        
                            ' DLV=' DLVR-NBR          OF DCLACTIOPN             
                         ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIOPN             
                            ' RCV=' RCV-NBR           OF DCLACTIOPN             
                         ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIOPN             
                   DISPLAY '           '                                        
                            ' CTL=' ACAT-CONTROL-NBR  OF DCLACTIOPN             
                            ' SEQ=' ASSET-SEQ-NBR     OF DCLACTIOPN             
               IF  SQLCODE  =  -803                                             
                   PERFORM 7670-UPDATE-ACTIOPN THRU 7670-EXIT                   
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT518: ERROR INSERTING A ROW INTO ACTIOPN'         
                         ' (ACAT-ASSET TABLE)'                                  
                   DISPLAY 'CAT518: W-AST-REC(' IDXA ')='                       
                                '(' W-AST-REC(IDXA) ')'                         
                   DISPLAY 'CAT518: DCLACTIOPN  ='                              
                        '(' DCLACTIOPN ')'                                      
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       7610-EXIT. EXIT.                                                         
      /                                                                         
       7620-INSERT-ACTIMF.                                                      
           MOVE '7620-INSERT-ACTIMF              ' TO W-ROUTINE-1.              
                                                                                
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
DJ0007            ,ACAT_CONTROL_NBR                                             
DJ0007            ,ASSET_SEQ_NBR                                                
DJ0007            ,TRNFR_TYPE_CD                                                
DJ0007            ,FCST_ACCT_RCVR_NBR                                           
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
DJ0007            ,:DCLACTIMF.ACAT-CONTROL-NBR                                  
DJ0007            ,:DCLACTIMF.ASSET-SEQ-NBR                                     
DJ0007            ,:DCLACTIMF.TRNFR-TYPE-CD                                     
DJ0007            ,:DCLACTIMF.FCST-ACCT-RCVR-NBR                                
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIMF '                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIMF-ADD-CNT                                        
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-ACTIMF-NOT-ADD-CNT                                    
                   DISPLAY '   ACTIMF  NOT ADDED.'                              
                             ' SQLCODE = ' W-DB2-SQLCODE                        
                             ' IF SQLCODE=-803(DUPE), UPDATE IT'                
                   DISPLAY '   ACTIMF  PRIMARY KEY:'                            
                            ' CLT=' CLIENT-NBR        OF DCLACTIMF              
                             ' CC=' ISIN-CNTRY-CD     OF DCLACTIMF              
                            ' SEC=' ISIN-SEC-ISSUE-CD OF DCLACTIMF              
                             ' CD=' ISIN-SEC-CDG-CD   OF DCLACTIMF              
                             ' SL=' STTLM-LCTN-CD     OF DCLACTIMF              
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIMF              
                   DISPLAY '           '                                        
                            ' DLV=' DLVR-NBR          OF DCLACTIMF              
                         ' DLV-AC=' ACCT-DLVR-NBR     OF DCLACTIMF              
                            ' RCV=' RCV-NBR           OF DCLACTIMF              
                         ' RCV-AC=' ACCT-RCV-NBR      OF DCLACTIMF              
                   DISPLAY '           '                                        
                            ' CTL=' ACAT-CONTROL-NBR  OF DCLACTIMF              
                            ' SEQ=' ASSET-SEQ-NBR     OF DCLACTIMF              
               IF  SQLCODE  =  -803                                             
                   PERFORM 7680-UPDATE-ACTIMF   THRU 7680-EXIT                  
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT518: ERROR INSERTING A ROW INTO ACTIMF'          
                         ' (ACAT-ASSET TABLE)'                                  
                   DISPLAY 'CAT518: W-AST-REC(' IDXA ')='                       
                                '(' W-AST-REC(IDXA) ')'                         
                   DISPLAY 'CAT518: DCLACTIMF  ='                               
                        '(' DCLACTIMF ')'                                       
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       7620-EXIT. EXIT.                                                         
      /                                                                         
       7660-UPDATE-ACTIAST.                                                     
                                                                                
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
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                    
                  AND  RCV_NBR           = :WF-RCV-NBR                          
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                     
                  AND  TRNFR_TYPE_CD     = :WF-TRNFR-TYPE-CD                    
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
                  AND  ISIN_CNTRY_CD     = :WF-ISIN-CNTRY-CD                    
                  AND  ISIN_SEC_ISSUE_CD = :WF-ISIN-SEC-ISSUE-CD                
                  AND  ISIN_SEC_CDG_CD   = :WF-ISIN-SEC-CDG-CD                  
                  AND  STTLM_LCTN_CD     = :WF-STTLM-LCTN-CD                    
                  AND  CSH_MGN_SHRT_CD   = :WF-CSH-MGN-SHRT-CD                  
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'ACTIAST  '              TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIAST-UPD-CNT                                       
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
           ELSE                                                                 
               DISPLAY '   ACTIAST NOT UPDATED.'                                
                         ' SQLCODE = ' W-DB2-SQLCODE                            
               ADD 1 TO W-ACTIAST-NOT-UPD-CNT                                   
           END-IF.                                                              
                                                                                
       7660-EXIT. EXIT.                                                         
      /                                                                         
       7670-UPDATE-ACTIOPN.                                                     
                                                                                
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
LRM015            ,STPRC_INTEGER2_AMT  = :DCLACTIOPN.STPRC-INTEGER2-AMT         
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
DJ0007            ,ACAT_CONTROL_NBR    = :DCLACTIOPN.ACAT-CONTROL-NBR           
DJ0007            ,ASSET_SEQ_NBR       = :DCLACTIOPN.ASSET-SEQ-NBR              
DJ0007            ,TRNFR_TYPE_CD       = :DCLACTIOPN.TRNFR-TYPE-CD              
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                    
                  AND  RCV_NBR           = :WF-RCV-NBR                          
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                     
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
                  AND  ISIN_CNTRY_CD     = :WF-ISIN-CNTRY-CD                    
                  AND  ISIN_SEC_ISSUE_CD = :WF-ISIN-SEC-ISSUE-CD                
                  AND  ISIN_SEC_CDG_CD   = :WF-ISIN-SEC-CDG-CD                  
                  AND  STTLM_LCTN_CD     = :WF-STTLM-LCTN-CD                    
                  AND  CSH_MGN_SHRT_CD   = :WF-CSH-MGN-SHRT-CD                  
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'ACTIOPN   '             TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIOPN-UPD-CNT                                       
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
           ELSE                                                                 
               DISPLAY '   ACTIOPN NOT UPDATED.'                                
                         ' SQLCODE = ' W-DB2-SQLCODE                            
               ADD 1 TO W-ACTIOPN-NOT-UPD-CNT                                   
           END-IF.                                                              
                                                                                
       7670-EXIT. EXIT.                                                         
      /                                                                         
       7680-UPDATE-ACTIMF.                                                      
                                                                                
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
DJ0007            ,ACAT_CONTROL_NBR    = :DCLACTIMF.ACAT-CONTROL-NBR            
DJ0007            ,ASSET_SEQ_NBR       = :DCLACTIMF.ASSET-SEQ-NBR               
DJ0007            ,TRNFR_TYPE_CD       = :DCLACTIMF.TRNFR-TYPE-CD               
DJ0007            ,FCST_ACCT_RCVR_NBR  = :DCLACTIMF.FCST-ACCT-RCVR-NBR          
                WHERE  CLIENT_NBR        = :WF-CLIENT-NBR                       
                  AND  DLVR_NBR          = :WF-DLVR-NBR                         
                  AND  ACCT_DLVR_NBR     = :WF-ACCT-DLVR-NBR                    
                  AND  RCV_NBR           = :WF-RCV-NBR                          
                  AND  ACCT_RCV_NBR      = :WF-ACCT-RCV-NBR                     
                  AND  ACAT_CONTROL_NBR  = :WF-ACAT-CONTROL-NBR                 
                  AND  ISIN_CNTRY_CD     = :WF-ISIN-CNTRY-CD                    
                  AND  ISIN_SEC_ISSUE_CD = :WF-ISIN-SEC-ISSUE-CD                
                  AND  ISIN_SEC_CDG_CD   = :WF-ISIN-SEC-CDG-CD                  
                  AND  STTLM_LCTN_CD     = :WF-STTLM-LCTN-CD                    
                  AND  CSH_MGN_SHRT_CD   = :WF-CSH-MGN-SHRT-CD                  
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'ACTIMF     '            TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTIMF-UPD-CNT                                        
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
           ELSE                                                                 
               DISPLAY '   ACTIMF  NOT UPDATED.'                                
                         ' SQLCODE = ' W-DB2-SQLCODE                            
               ADD 1 TO W-ACTIMF-NOT-UPD-CNT                                    
           END-IF.                                                              
                                                                                
       7680-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR TRANSFER THAT ARE REJECTED                                         
      *  ADD THE NEW ROW TO THE INIT-TABLE                                      
      *    CREATE A CHANGE RECORD BY ADDING A NEW ROW TO THE                    
      *    INIT-TABLE INSTEAD OF REJECTING THE TRANSFER.                        
      *****************************************************************         
       7700-INSERT-ACTITRF.                                                     
           MOVE '7700-INSERT-ACTITRF         ' TO W-ROUTINE-1.                  
                                                                                
           DISPLAY '7700-INSERT-ACTITRF: ' W-SAVE-RECORD(1:41)                  
                                                                                
           MOVE CLIENT-NBR        OF DCLVTRNFR  TO WF-CLIENT-NBR                
           MOVE ACAT-CONTROL-NBR  OF DCLVTRNFR  TO WF-ACAT-CONTROL-NBR          
           MOVE CLIENT-NBR         OF DCLVTRNFR                                 
                                   TO CLIENT-NBR         OF DCLACTITRF          
           MOVE DSTBN-SIDE-CD      OF DCLVTRNFR                                 
                                   TO DSTBN-SIDE-CD      OF DCLACTITRF          
           MOVE ACAT-CONTROL-NBR   OF DCLVTRNFR                                 
                                   TO ACAT-CONTROL-NBR   OF DCLACTITRF          
           MOVE PRCS-DT            OF DCLVTRNFR                                 
                                   TO PRCS-DT            OF DCLACTITRF          
           MOVE CYCLE-CD           OF DCLVTRNFR                                 
                                   TO CYCLE-CD           OF DCLACTITRF          
           MOVE SYS-ACT-CD         OF DCLVTRNFR                                 
                                   TO SYS-ACT-CD         OF DCLACTITRF          
           MOVE SYS-RJCT-RSN-CD    OF DCLVTRNFR                                 
                                   TO SYS-RJCT-RSN-CD    OF DCLACTITRF          
           MOVE STTS-CD            OF DCLVTRNFR                                 
                                   TO STTS-CD            OF DCLACTITRF          
           MOVE DAYS-STTS-QTY      OF DCLVTRNFR                                 
                                   TO DAYS-STTS-QTY      OF DCLACTITRF          
           MOVE RCRD-STTS-CD       OF DCLVTRNFR                                 
                                   TO RCRD-STTS-CD       OF DCLACTITRF          
           MOVE RCRD-LNGTH-STTS-CD OF DCLVTRNFR                                 
                                   TO RCRD-LNGTH-STTS-CD OF DCLACTITRF          
           MOVE PHSCL-SEQ-STTS-CD  OF DCLVTRNFR                                 
                                   TO PHSCL-SEQ-STTS-CD  OF DCLACTITRF          
           MOVE LGCL-SEQ-NR-STS-CD OF DCLVTRNFR                                 
                                   TO LGCL-SEQ-NR-STS-CD OF DCLACTITRF          
           MOVE TRANS-TYPE-STTS-CD OF DCLVTRNFR                                 
                                   TO TRANS-TYPE-STTS-CD OF DCLACTITRF          
           MOVE CONTROL-NBR-STS-CD OF DCLVTRNFR                                 
                                   TO CONTROL-NBR-STS-CD OF DCLACTITRF          
           MOVE TRNFR-TYPE-STTS-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-STTS-CD OF DCLACTITRF          
           MOVE SBMT-PRT-NR-STS-CD OF DCLVTRNFR                                 
                                   TO SBMT-PRT-NR-STS-CD OF DCLACTITRF          
           MOVE RCV-NBR-STTS-CD    OF DCLVTRNFR                                 
                                   TO RCV-NBR-STTS-CD    OF DCLACTITRF          
           MOVE DLVR-NBR-STTS-CD   OF DCLVTRNFR                                 
                                   TO DLVR-NBR-STTS-CD   OF DCLACTITRF          
           MOVE ACCT-RCV-STTS-CD   OF DCLVTRNFR                                 
                                   TO ACCT-RCV-STTS-CD   OF DCLACTITRF          
           MOVE RCV-CUST-NM-STS-CD OF DCLVTRNFR                                 
                                   TO RCV-CUST-NM-STS-CD OF DCLACTITRF          
           MOVE RCV-SS-PRIM-STS-CD OF DCLVTRNFR                                 
                                   TO RCV-SS-PRIM-STS-CD OF DCLACTITRF          
           MOVE RCV-SS-SCDY-STS-CD OF DCLVTRNFR                                 
                                   TO RCV-SS-SCDY-STS-CD OF DCLACTITRF          
           MOVE RCV-ACT-TYP-STS-CD OF DCLVTRNFR                                 
                                   TO RCV-ACT-TYP-STS-CD OF DCLACTITRF          
           MOVE RCV-OCC-STTS-CD    OF DCLVTRNFR                                 
                                   TO RCV-OCC-STTS-CD    OF DCLACTITRF          
           MOVE RCV-CRSPN-STTS-CD  OF DCLVTRNFR                                 
                                   TO RCV-CRSPN-STTS-CD  OF DCLACTITRF          
           MOVE ACCT-DLVR-STTS-CD  OF DCLVTRNFR                                 
                                   TO ACCT-DLVR-STTS-CD  OF DCLACTITRF          
           MOVE TRN-TYP-RJC-STS-CD OF DCLVTRNFR                                 
                                   TO TRN-TYP-RJC-STS-CD OF DCLACTITRF          
           MOVE CNTL-ASTD-STTS-CD  OF DCLVTRNFR                                 
                                   TO CNTL-ASTD-STTS-CD  OF DCLACTITRF          
           MOVE STTLM-ASCTD-STS-CD OF DCLVTRNFR                                 
                                   TO STTLM-ASCTD-STS-CD OF DCLACTITRF          
           MOVE TRANS-RFRN-STTS-CD OF DCLVTRNFR                                 
                                   TO TRANS-RFRN-STTS-CD OF DCLACTITRF          
           MOVE ' '                                                             
                                   TO CMNT-STTS-CD       OF DCLACTITRF          
           MOVE PHSCL-SEQ-NBR      OF DCLVTRNFR                                 
                                   TO PHSCL-SEQ-NBR      OF DCLACTITRF          
           MOVE LGCL-SEQ-NBR       OF DCLVTRNFR                                 
                                   TO LGCL-SEQ-NBR       OF DCLACTITRF          
           MOVE TRANS-TYPE-CD      OF DCLVTRNFR                                 
                                   TO TRANS-TYPE-CD      OF DCLACTITRF          
           MOVE TRNFR-TYPE-CD      OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-CD      OF DCLACTITRF          
           MOVE DLVR-NBR           OF DCLVTRNFR                                 
                                   TO SBMTG-PRTCP-NBR    OF DCLACTITRF          
           MOVE RCV-NBR            OF DCLVTRNFR                                 
                                   TO RCV-NBR            OF DCLACTITRF          
           MOVE DLVR-NBR           OF DCLVTRNFR                                 
                                   TO DLVR-NBR           OF DCLACTITRF          
           MOVE ACCT-RCV-NBR       OF DCLVTRNFR                                 
                                   TO ACCT-RCV-NBR       OF DCLACTITRF          
           MOVE RCV-CUST-NM        OF DCLVTRNFR                                 
                                   TO RCV-CUST-NM        OF DCLACTITRF          
           MOVE RCV-SS-PRIM-NBR    OF DCLVTRNFR                                 
                                   TO RCV-SS-PRIM-NBR    OF DCLACTITRF          
           MOVE RCV-SS-SCNDY-NBR   OF DCLVTRNFR                                 
                                   TO RCV-SS-SCNDY-NBR   OF DCLACTITRF          
           MOVE RCV-ACCT-TYPE-CD   OF DCLVTRNFR                                 
                                   TO RCV-ACCT-TYPE-CD   OF DCLACTITRF          
           MOVE RCV-OCC-BRKR-NBR   OF DCLVTRNFR                                 
                                   TO RCV-OCC-BRKR-NBR   OF DCLACTITRF          
           MOVE RCV-CRSPN-NBR      OF DCLVTRNFR                                 
                                   TO RCV-CRSPN-NBR      OF DCLACTITRF          
           MOVE PRTCP-CONTRA-CD    OF DCLVTRNFR                                 
                                   TO PRTCP-CONTRA-CD    OF DCLACTITRF          
           MOVE ACCT-DLVR-NBR      OF DCLVTRNFR                                 
                                   TO ACCT-DLVR-NBR      OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJCT-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
           MOVE ACAT-CNTL-ASTD-NBR OF DCLVTRNFR                                 
                                   TO ACAT-CNTL-ASTD-NBR OF DCLACTITRF          
           MOVE STTLM-ASCTD-DT     OF DCLVTRNFR                                 
                                   TO STTLM-ASCTD-DT     OF DCLACTITRF          
           MOVE TRANS-RFRN-ID-CD   OF DCLVTRNFR                                 
                                   TO TRANS-RFRN-ID-CD   OF DCLACTITRF          
                                                                                
           MOVE ' '                TO CMNT-TXT           OF DCLACTITRF          
           MOVE CICS-TERM-ID-CD    OF DCLVTRNFR                                 
                                   TO CICS-TERM-ID-CD    OF DCLACTITRF          
           MOVE CRT-TMSTP          OF DCLVTRNFR                                 
                                   TO CRT-TMSTP          OF DCLACTITRF          
           MOVE DB-CR-CD           OF DCLVTRNFR                                 
                                   TO DB-CR-CD           OF DCLACTITRF          
           MOVE NSCC-ACK-IND       OF DCLVTRNFR                                 
                                   TO NSCC-ACK-IND       OF DCLACTITRF          
                                                                                
           MOVE ' '                TO NSCC-PEND-CD       OF DCLACTITRF          
                                                                                
           MOVE W-PGM-NAME         TO PRGM-NM            OF DCLACTITRF          
           MOVE RR-CD              OF DCLVTRNFR                                 
                                   TO RR-CD              OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJC1-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJC1-CD OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJC2-CD OF DCLACTITRF          
           MOVE UPDT-TMSTP         OF DCLVTRNFR                                 
                                   TO UPDT-TMSTP         OF DCLACTITRF          
                                                                                
           IF  W-FLAG-LP           = 'Y'                                        
               IF  W-LP-CODE       > '00'                                       
                   MOVE W-LP-CODE                                               
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   DISPLAY '   REJECT-LP'                                       
               END-IF                                                           
           END-IF                                                               
           IF  W-FLAG-PRIV         = 'Y'                                        
               IF  W-PRIV-CODE > '00'                                           
                   MOVE W-PRIV-CODE                                             
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   DISPLAY '   REJECT-PRIV'                                     
               END-IF                                                           
           END-IF                                                               
           IF  W-FLAG-NTS          = 'Y'                                        
               IF  W-NTS-CODE      > '00'                                       
                   MOVE BH-ACAT-REJ-PEND-DEL-NTS-CODE                           
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   DISPLAY '   REJECT-NTS '                                     
               END-IF                                                           
           END-IF                                                               
           IF  W-FLAG-FLAT         = 'Y'                                        
               IF  W-FLAT-CODE > '00'                                           
                   MOVE W-FLAT-CODE                                             
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   MOVE 'ACCOUNT IS FLAT'                                       
                                   TO CMNT-TXT           OF DCLACTITRF          
                   DISPLAY '   REJECT-FLAT'                                     
DJ0011           IF W-MEMO-ONLY-SW = 'Y'                                        
DJ0011              MOVE 'MEMO ONLY - RESTRICTED ASSET'                         
DJ0011                                       TO CMNT-TXT OF DCLACTITRF          
DJ0011           END-IF                                                         
               END-IF                                                           
           END-IF                                                               
           IF  W-FLAG-NOT-FULFILL = 'Y'                                         
               IF  W-FLAG-ACCT-IN-TFR = 'Y'                                     
                   MOVE '07'       TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   MOVE 'ACCOUNT IN TRANSFER'                                   
                                   TO CMNT-TXT           OF DCLACTITRF          
                   DISPLAY '   ACCOUNT IN TRANSFER'                             
               ELSE                                                             
                   MOVE '04'       TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0011           IF W-MEMO-ONLY-SW = 'Y'                                        
DJ0011              MOVE 'MEMO ONLY - RESTRICTED ASSET'                         
DJ0011                                       TO CMNT-TXT OF DCLACTITRF          
DJ0011           ELSE                                                           
                   MOVE                                                         
           'NONE OF THE ASSETS/BALANCES REQUESTED EXIST IN THE ACCOUNT'         
                                   TO CMNT-TXT           OF DCLACTITRF          
                   DISPLAY '   REJECT-NOT-FULFILL '                             
           'NONE OF THE ASSETS/BALANCES REQUESTED EXIST IN THE ACCOUNT'         
DJ0011           END-IF                                                         
               END-IF                                                           
           END-IF                                                               
           IF  W-FLAG-SPAD = 'Y'                                                
               IF  W-SPAD-CODE > '00'                                           
                   MOVE W-SPAD-CODE                                             
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   DISPLAY '   REJECT-SPAD'                                     
               END-IF                                                           
           END-IF                                                               
                                                                                
DJ0006     IF  W-FLAG-FRZN        = 'Y'                                         
DJ0006     AND TRNFR-TYPE-RJCT-CD OF DCLACTITRF = ' '                           
DJ0006         DISPLAY '   REJECT: ACCOUNT IS FROZEN (HOLD)'                    
DJ0006         MOVE W-FRZN-CODE    TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0006         MOVE 'ACCOUNT IS FROZEN'      TO CMNT-TXT OF DCLACTITRF          
DJ0006         MOVE 'H'            TO NSCC-PEND-CD       OF DCLACTITRF          
DJ0006     END-IF                                                               
                                                                                
DJ0011     DISPLAY '   ACTITRF CMNT: ' CMNT-TXT OF DCLACTITRF(1:100)            
           MOVE 'R'                TO TRANS-TYPE-CD      OF DCLACTITRF          
                                                                                
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
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
               DISPLAY '   ACTITRF ADDED.'                                      
              ' TRANS-TYPE-CD=' TRANS-TYPE-CD OF DCLACTITRF                     
              ' TRNFR-TYPE-RJCT-CD=' TRNFR-TYPE-RJCT-CD OF DCLACTITRF           
           ELSE                                                                 
                   DISPLAY '   ACTITRF NOT ADDED.'                              
                               ' SQLCODE = ' W-DB2-SQLCODE                      
                             ' IF SQLCODE=-803(DUPE), UPDATE IT'                
               ADD 1 TO W-ACTITRF-NOT-ADD-CNT                                   
               IF  SQLCODE  =  -803                                             
                   PERFORM 7710-UPDATE-ACTITRF     THRU 7710-EXIT               
               ELSE                                                             
                   DISPLAY '   '                                                
                          'ACTITRF PRIMARY KEY:'                                
                              ' CLT=' CLIENT-NBR         OF DCLACTITRF          
                              ' TFR=' TRNFR-TYPE-CD      OF DCLACTITRF          
                   DISPLAY '    DLV=' DLVR-NBR           OF DCLACTITRF          
                           ' DLV-AC=' ACCT-DLVR-NBR      OF DCLACTITRF          
                              ' RCV=' RCV-NBR            OF DCLACTITRF          
                           ' RCV-AC=' ACCT-RCV-NBR       OF DCLACTITRF          
                              ' CTL=' ACAT-CONTROL-NBR   OF DCLACTITRF          
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT518: ERROR INSERTING A ROW INTO ACTITRF'         
                        ' (ACAT-TRNFR TABLE)'                                   
                   DISPLAY 'CAT518: DCLACTITRF  ='                              
                        '(' DCLACTITRF ')'                                      
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       7700-EXIT. EXIT.                                                         
                                                                                
       7710-UPDATE-ACTITRF.                                                     
           MOVE '7710-UPDATE-ACTITRF       ' TO W-ROUTINE-1.                    
                                                                                
           EXEC SQL SELECT                                                      
                      ACAT_CONTROL_NBR                                          
                     ,NSCC_PEND_CD                                              
                     ,PRCS_DT                                                   
                     ,PRGM_NM                                                   
                     ,UPDT_TMSTP                                                
                     ,TRNFR_TYPE_RJCT_CD                                        
               INTO  :W-ACTITRF-ACAT-CONTROL-NBR                                
                    ,:W-ACTITRF-NSCC-PEND-CD                                    
                    ,:W-ACTITRF-PRCS-DT                                         
                    ,:W-ACTITRF-PRGM-NM                                         
                    ,:W-ACTITRF-UPDT-TMSTP                                      
                    ,:W-ACTITRF-TRNFR-TYPE-RJCT-CD                              
               FROM  ACTITRF                                                    
              WHERE  CLIENT_NBR        = :DCLVTRNFR.CLIENT-NBR                  
                AND  RCV_NBR           = :DCLVTRNFR.RCV-NBR                     
                AND  DLVR_NBR          = :DCLVTRNFR.DLVR-NBR                    
                AND  ACCT_RCV_NBR      = :DCLVTRNFR.ACCT-RCV-NBR                
                AND  ACCT_DLVR_NBR     = :DCLVTRNFR.ACCT-DLVR-NBR               
                AND  TRNFR_TYPE_CD     = :DCLVTRNFR.TRNFR-TYPE-CD               
                AND  ACAT_CONTROL_NBR  = :DCLVTRNFR.ACAT-CONTROL-NBR            
           END-EXEC                                                             
                                                                                
           DISPLAY '   ACTITRF FOUND'                                           
                        ' CLT=' CLIENT-NBR OF DCLVTRNFR                         
                        ' CTL=' W-ACTITRF-ACAT-CONTROL-NBR                      
                       ' RJCT=' W-ACTITRF-TRNFR-TYPE-RJCT-CD                    
                       ' PEND=' W-ACTITRF-NSCC-PEND-CD                          
                       ' PRCS=' W-ACTITRF-PRCS-DT                               
                       ' PRGM=' W-ACTITRF-PRGM-NM                               
                       ' UPDT=' W-ACTITRF-UPDT-TMSTP                            
                                                                                
           IF  TRNFR-TYPE-RJCT-CD OF DCLACTITRF > '00'                          
               DISPLAY '   RJCT > 00, BYPASS UPDATE'                            
               GO TO 7710-EXIT                                                  
           END-IF                                                               
                                                                                
           IF  W-FLAG-LP           = 'Y'                                        
               IF  W-LP-CODE       > '00'                                       
                   MOVE W-LP-CODE                                               
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   DISPLAY '   REJECT-LP'                                       
               END-IF                                                           
           END-IF                                                               
           IF  W-FLAG-PRIV         = 'Y'                                        
               IF  W-PRIV-CODE > '00'                                           
                   MOVE W-PRIV-CODE                                             
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   DISPLAY '   REJECT-PRIV'                                     
               END-IF                                                           
           END-IF                                                               
           IF  W-FLAG-NTS          = 'Y'                                        
               IF  W-NTS-CODE      > '00'                                       
                   MOVE BH-ACAT-REJ-PEND-DEL-NTS-CODE                           
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   DISPLAY '   REJECT-NTS '                                     
               END-IF                                                           
           END-IF                                                               
           IF  W-FLAG-FLAT         = 'Y'                                        
               IF  W-FLAT-CODE > '00'                                           
                   MOVE W-FLAT-CODE                                             
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   DISPLAY '   REJECT-FLAT'                                     
DJ0011           IF W-MEMO-ONLY-SW = 'Y'                                        
DJ0011              DISPLAY '   REJECT: MEMO ONLY - RESTRICTED ASSET'           
DJ0011              MOVE 'MEMO ONLY - RESTRICTED ASSET'                         
DJ0011                                       TO CMNT-TXT OF DCLACTITRF          
DJ0011           END-IF                                                         
               END-IF                                                           
           END-IF                                                               
           IF  W-FLAG-NOT-FULFILL = 'Y'                                         
               IF  W-FLAG-ACCT-IN-TFR = 'Y'                                     
                   MOVE '07'       TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   MOVE 'ACCOUNT IN TRANSFER'                                   
                                   TO CMNT-TXT           OF DCLACTITRF          
                   DISPLAY '   ACCOUNT IN TRANSFER'                             
               ELSE                                                             
                   MOVE '04'       TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0011           IF W-MEMO-ONLY-SW = 'Y'                                        
DJ0011              MOVE 'MEMO ONLY - RESTRICTED ASSET'                         
DJ0011                                       TO CMNT-TXT OF DCLACTITRF          
DJ0011           ELSE                                                           
                   MOVE 'REQUEST EXCEED AVAILABLE ASSETS'                       
                                   TO CMNT-TXT           OF DCLACTITRF          
                   DISPLAY '   REJECT-NOT-FULFILL'                              
DJ0011           END-IF                                                         
               END-IF                                                           
           END-IF                                                               
           IF  W-FLAG-SPAD         = 'Y'                                        
               IF  W-SPAD-CODE > '00'                                           
                   MOVE W-SPAD-CODE                                             
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   DISPLAY '   REJECT-SPAD'                                     
               END-IF                                                           
           END-IF                                                               
                                                                                
DJ0011     DISPLAY '   CMNT: ' CMNT-TXT OF DCLACTITRF(1:100)                    
                                                                                
           MOVE 'R'                 TO TRANS-TYPE-CD   OF DCLACTITRF            
           MOVE ' '                 TO CICS-TERM-ID-CD OF DCLACTITRF            
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP      OF DCLACTITRF            
           MOVE W-PGM-NAME          TO PRGM-NM         OF DCLACTITRF            
           MOVE ' '                 TO NSCC-PEND-CD    OF DCLACTITRF            
                                                                                
           EXEC SQL                                                             
             UPDATE ACTITRF                                                     
                SET                                                             
                   TRANS_TYPE_CD       = :DCLACTITRF.TRANS-TYPE-CD              
                  ,TRNFR_TYPE_RJCT_CD  = :DCLACTITRF.TRNFR-TYPE-RJCT-CD         
                  ,CICS_TERM_ID_CD     = :DCLACTITRF.CICS-TERM-ID-CD            
                  ,UPDT_TMSTP          = :DCLACTITRF.UPDT-TMSTP                 
                  ,PRGM_NM             = :DCLACTITRF.PRGM-NM                    
                  ,NSCC_PEND_CD        = :DCLACTITRF.NSCC-PEND-CD               
              WHERE  CLIENT_NBR        = :DCLVTRNFR.CLIENT-NBR                  
                AND  RCV_NBR           = :DCLVTRNFR.RCV-NBR                     
                AND  DLVR_NBR          = :DCLVTRNFR.DLVR-NBR                    
                AND  ACCT_RCV_NBR      = :DCLVTRNFR.ACCT-RCV-NBR                
                AND  ACCT_DLVR_NBR     = :DCLVTRNFR.ACCT-DLVR-NBR               
                AND  TRNFR_TYPE_CD     = :DCLVTRNFR.TRNFR-TYPE-CD               
                AND  ACAT_CONTROL_NBR  = :DCLVTRNFR.ACAT-CONTROL-NBR            
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTITRF-UPD-CNT                                       
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
               DISPLAY '   ACTITRF UPDATED'                                     
           ELSE                                                                 
               ADD 1 TO W-ACTITRF-NOT-UPD-CNT                                   
               DISPLAY '   ACTITRF NOT UPDATED '                                
                         ' SQLCODE = ' W-DB2-SQLCODE                            
                   DISPLAY '   '                                                
                          'ACTITRF PRIMARY KEY:'                                
                              ' CLT=' CLIENT-NBR         OF DCLACTITRF          
                              ' TFR=' TRNFR-TYPE-CD      OF DCLACTITRF          
                   DISPLAY '    DLV=' DLVR-NBR           OF DCLACTITRF          
                           ' DLV-AC=' ACCT-DLVR-NBR      OF DCLACTITRF          
                              ' RCV=' RCV-NBR            OF DCLACTITRF          
                           ' RCV-AC=' ACCT-RCV-NBR       OF DCLACTITRF          
                              ' CTL=' ACAT-CONTROL-NBR   OF DCLACTITRF          
                   DISPLAY ' '                                                  
                      'ACTITRF  UPDATE KEY:'                                    
                              ' CLT=' CLIENT-NBR         OF DCLVTRNFR           
                              ' TFR=' TRNFR-TYPE-CD      OF DCLVTRNFR           
                   DISPLAY '    DLV=' DLVR-NBR           OF DCLVTRNFR           
                           ' DLV-AC=' ACCT-DLVR-NBR      OF DCLVTRNFR           
                              ' RCV=' RCV-NBR            OF DCLVTRNFR           
                           ' RCV-AC=' ACCT-RCV-NBR       OF DCLVTRNFR           
                              ' CTL=' ACAT-CONTROL-NBR   OF DCLVTRNFR           
             IF  SQLCODE  =  +100                                               
                   DISPLAY '   ACTITRF UPDATE NOT FOUND.'                       
             END-IF                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT518: ERROR UPDATING A ROW IN ACTITRF'            
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT518: DCLACTITRF  ='                              
                           '(' DCLACTITRF ')'                                   
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
           END-IF.                                                              
                                                                                
       7710-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  SET FLAGS IN VTRNFR                                                    
      *  UPDATE VTRNFR                                                          
      *****************************************************************         
       7720-UPDATE-VTRNFR.                                                      
           MOVE '7720-UPDATE-VTRNFR            ' TO W-ROUTINE-1.                
                                                                                
           DISPLAY '7720-UPDATE-VTRNFR: W-REJECT-SW='                           
                   '(' W-REJECT-SW ')'                                          
                                                                                
           MOVE W-PGM-NAME          TO PRGM-NM            OF DCLVTRNFR          
           MOVE ' '                 TO CICS-TERM-ID-CD    OF DCLVTRNFR          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP         OF DCLVTRNFR          
                                                                                
      ***--OPEN ORDER                                                           
           IF  W-FLAG-OPEN-ORDER    = 'Y'                                       
               DISPLAY '   ACCT-ORDERS-IND OF DCLVTRNFR'                        
               MOVE 'Y'             TO ACCT-ORDERS-IND    OF DCLVTRNFR          
           END-IF                                                               
      ***--DEBIT BALANCE                                                        
           IF  W-FLAG-DEBIT-BAL   = 'Y'                                         
               DISPLAY '   ACCT-DB-BAL-T1-IND OF DCLVTRNFR'                     
               MOVE 'Y'             TO ACCT-DB-BAL-T1-IND OF DCLVTRNFR          
           END-IF                                                               
      ***--DEBIT MARGIN                                                         
           IF  W-FLAG-MARGIN-DEBIT = 'Y'                                        
               DISPLAY '   ACCT-MRGN-DB-IND OF DCLVTRNFR'                       
               MOVE 'Y'             TO ACCT-MRGN-DB-IND   OF DCLVTRNFR          
           END-IF                                                               
      ***--SHORT POSITION                                                       
           IF  W-FLAG-SHORT-POS   = 'Y'                                         
               DISPLAY '   ACCT-SHRT-PSTN-IND OF DCLVTRNFR'                     
               MOVE 'Y'             TO ACCT-SHRT-PSTN-IND OF DCLVTRNFR          
           END-IF                                                               
      ***--NON-TRANSFERABLE SECURITY / RESTRICTED SECURITY                      
           IF  W-FLAG-NTS         = 'Y'                                         
               DISPLAY '   ACCT-SEC-RSTRD-IND OF DCLVTRNFR'                     
               MOVE 'Y'             TO ACCT-SEC-RSTRD-IND OF DCLVTRNFR          
           END-IF                                                               
      ***--ASSET EXCEED                                                         
           IF  W-FLAG-ASSET-VALUE = 'Y'                                         
           OR  W-FLAG-TOTL-ACT-VAL = 'Y'                                        
               DISPLAY '   ACCT-AST-EXCS-IND OF DCLVTRNFR'                      
               MOVE 'Y'             TO ACCT-AST-EXCS-IND  OF DCLVTRNFR          
           END-IF                                                               
      ***--OPTIONS                                                              
           IF  W-FLAG-EXP-OPT-POSN = 'Y'                                        
               DISPLAY '   ACCT-OPTN-PSTN-IND OF DCLVTRNFR = X'                 
               MOVE 'X'             TO ACCT-OPTN-PSTN-IND OF DCLVTRNFR          
           ELSE                                                                 
               IF  W-FLAG-OPTION = 'Y'                                          
                   DISPLAY '   ACCT-OPTN-PSTN-IND OF DCLVTRNFR = Y'             
                   MOVE 'Y'         TO ACCT-OPTN-PSTN-IND OF DCLVTRNFR          
               END-IF                                                           
           END-IF                                                               
      ***--LIMTED PARTNERSHIP                                                   
           IF  W-FLAG-LP          = 'Y'                                         
               DISPLAY '   ACCT-LTD-PRTNR-IND OF DCLVTRNFR'                     
               MOVE 'Y'             TO ACCT-LTD-PRTNR-IND OF DCLVTRNFR          
           END-IF                                                               
      ***--PRIVATE RANGE                                                        
           IF  W-FLAG-PRIV        = 'Y'                                         
               DISPLAY '   ACCT-PRVT-RNG-IND OF DCLVTRNFR'                      
               MOVE 'Y'             TO ACCT-PRVT-RNG-IND  OF DCLVTRNFR          
           END-IF                                                               
      ***--EQUITY AMOUNT                                                        
           MOVE W-BAL-TOTL-LIQDATNG-EQUITY                                      
                                       TO ACCT-EQUITY-AMT OF DCLVTRNFR          
      ***--RESCIND BLOCK                                                        
           IF  W-FLAG-RESCIND-BLOCK = 'Y'                                       
               DISPLAY '   ACCT-RB-SEC-IND OF DCLVTRNFR'                        
               MOVE 'Y'             TO ACCT-RB-SEC-IND    OF DCLVTRNFR          
           END-IF                                                               
      ***--ACCOUNT IS FLAT                                                      
           IF  W-FLAG-FLAT        = 'Y'                                         
               DISPLAY '   TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = FLAT'              
               MOVE 'F' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                      
           ELSE                                                                 
      ***--SET FULFIL FLAG FOR ONLINE DISPLAY                                   
               PERFORM 7730-SET-FULFIL-MSG-FLAG THRU 7730-EXIT                  
           END-IF                                                               
                                                                                
DJ0011     IF  W-MEMO-ONLY-SW = 'Y'                                             
DJ0011         MOVE 'N'             TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR          
DJ0011     END-IF                                                               
                                                                                
           EXEC SQL                                                             
             UPDATE VTRNFR                                                      
                SET                                                             
                   TRNFR_TYPE_RJC2_CD  = :DCLVTRNFR.TRNFR-TYPE-RJC2-CD          
                  ,ACCT_ORDERS_IND     = :DCLVTRNFR.ACCT-ORDERS-IND             
                  ,ACCT_DB_BAL_T1_IND  = :DCLVTRNFR.ACCT-DB-BAL-T1-IND          
                  ,ACCT_MRGN_DB_IND    = :DCLVTRNFR.ACCT-MRGN-DB-IND            
                  ,ACCT_SHRT_PSTN_IND  = :DCLVTRNFR.ACCT-SHRT-PSTN-IND          
                  ,ACCT_SEC_RSTRD_IND  = :DCLVTRNFR.ACCT-SEC-RSTRD-IND          
                  ,ACCT_AST_EXCS_IND   = :DCLVTRNFR.ACCT-AST-EXCS-IND           
                  ,ACCT_OPTN_PSTN_IND  = :DCLVTRNFR.ACCT-OPTN-PSTN-IND          
                  ,ACCT_LTD_PRTNR_IND  = :DCLVTRNFR.ACCT-LTD-PRTNR-IND          
                  ,ACCT_PRVT_RNG_IND   = :DCLVTRNFR.ACCT-PRVT-RNG-IND           
                  ,ACCT_EQUITY_AMT     = :DCLVTRNFR.ACCT-EQUITY-AMT             
                  ,ACCT_RB_SEC_IND     = :DCLVTRNFR.ACCT-RB-SEC-IND             
                  ,CMNT_TXT            = :DCLVTRNFR.CMNT-TXT                    
                  ,CICS_TERM_ID_CD     = :DCLVTRNFR.CICS-TERM-ID-CD             
                  ,PRGM_NM             = :DCLVTRNFR.PRGM-NM                     
                  ,UPDT_TMSTP          = :DCLVTRNFR.UPDT-TMSTP                  
              WHERE  CLIENT_NBR        = :DCLVTRNFR.CLIENT-NBR                  
                AND  RCV_NBR           = :DCLVTRNFR.RCV-NBR                     
                AND  DLVR_NBR          = :DCLVTRNFR.DLVR-NBR                    
                AND  ACCT_RCV_NBR      = :DCLVTRNFR.ACCT-RCV-NBR                
                AND  ACCT_DLVR_NBR     = :DCLVTRNFR.ACCT-DLVR-NBR               
                AND  TRNFR_TYPE_CD     = :DCLVTRNFR.TRNFR-TYPE-CD               
                AND  ACAT_CONTROL_NBR  = :DCLVTRNFR.ACAT-CONTROL-NBR            
           END-EXEC.                                                            
                                                                                
           MOVE 'VTRNFR  '               TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNFR-UPD-CNT                                        
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-UPD-CNT                                    
               DISPLAY '   VTRNFR NOT UPDATED.'                                 
                                ' SQLCODE = ' W-DB2-SQLCODE                     
               DISPLAY '   VTRNFR PRIMARY KEY:'                                 
                         ' CLT=' WF-CLIENT-NBR                                  
                         ' CTL=' WF-ACAT-CONTROL-NBR                            
                        ' EQTY=' ACCT-EQUITY-AMT OF DCLVTRNFR                   
               IF  L-RERUN                                                      
               AND SQLCODE  =  +100                                             
                   DISPLAY '   BYPASSING VTRNFR UPDATE NOT FOUND.'              
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT518: ERROR UPDATING A ROW IN VTRNFR'             
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT518: DCLVTRNFR  ='                               
                           '(' DCLVTRNFR ')'                                    
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       7720-EXIT. EXIT.                                                         
      /                                                                         
       7730-SET-FULFIL-MSG-FLAG.                                                
      ***SET FULFIL MESSAGE FLAG FOR ONLINE DISPLAY                             
                                                                                
           EVALUATE TRUE                                                        
            WHEN W-SEC-FULL                                                     
             EVALUATE TRUE                                                      
              WHEN W-CSH-NONE                                                   
                   DISPLAY 'TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = A '               
                   'ALL ASSETS FULFILLED, NO CASH WAS FULFILLED'                
                   MOVE 'A' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
              WHEN W-CSH-PART                                                   
                   DISPLAY 'TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = B '               
                   'ALL ASSETS FULFILLED, CASH PARTIALLY FULFILLED'             
                   MOVE 'B' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
             END-EVALUATE                                                       
            WHEN W-SEC-PART                                                     
             EVALUATE TRUE                                                      
              WHEN W-CSH-NO-REQUEST                                             
                   DISPLAY 'TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = C '               
                   'ASSETS PARTIALLY FULFILLED'                                 
                   MOVE 'C' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
              WHEN W-CSH-NONE                                                   
                   DISPLAY 'TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = D '               
                   'ASSETS PARTIALLY FULFILLED, NO CASH WAS FULFILLED'          
                   MOVE 'D' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
              WHEN W-CSH-FULL                                                   
                   DISPLAY 'TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = E '               
                   'ASSETS PARTIALLY FULFILLED, ALL CASH FULFILLED'             
                   MOVE 'E' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
              WHEN W-CSH-PART                                                   
                   DISPLAY 'TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = G '               
                  'ASSETS PARTIALLY FULFILLED, CASH PARTIALLY FULFILLED'        
                   MOVE 'G' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
             END-EVALUATE                                                       
            WHEN W-SEC-NONE                                                     
             EVALUATE TRUE                                                      
              WHEN W-CSH-NO-REQUEST                                             
                   DISPLAY 'TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = H '               
                   'NONE OF ASSETS FULFILLED'                                   
                   MOVE 'H' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
              WHEN W-CSH-NONE                                                   
                   DISPLAY 'TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = I '               
                   'NONE OF ASSETS FULFILLED, NO CASH WAS FULFILLED'            
                   MOVE 'I' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
              WHEN W-CSH-FULL                                                   
                   DISPLAY 'TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = J '               
                   'NONE OF ASSETS FULFILLED, ALL CASH FULFILLED'               
                   MOVE 'J' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
              WHEN W-CSH-PART                                                   
                   DISPLAY 'TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = K '               
                   'NONE OF ASSETS FULFILLED, CASH PARTIALLY FULFILED'          
                   MOVE 'K' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
             END-EVALUATE                                                       
            WHEN W-SEC-NO-REQUEST                                               
             EVALUATE TRUE                                                      
              WHEN W-CSH-NONE                                                   
                   DISPLAY 'TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = L '               
                   'NO CASH WAS FULFILLED'                                      
                   MOVE 'L' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
              WHEN W-CSH-PART                                                   
                   DISPLAY 'TRNFR-TYPE-RJC2-CD OF DCLVTRNFR = M '               
                   'CASH PARTIALLY FULFILLED'                                   
                   MOVE 'M' TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                  
             END-EVALUATE                                                       
           END-EVALUATE.                                                        
       7730-EXIT. EXIT.                                                         
      /                                                                         
       7750-DELETE-INIT-ASSETS.                                                 
      ***DELETE THE ASSETS THAT WE ALREADY LOADED BECAUSE OF REJECT             
                                                                                
           EXEC SQL DELETE FROM ACTIAST                                         
              WHERE  CLIENT_NBR        = :DCLVTRNFR.CLIENT-NBR                  
                AND  ACAT_CONTROL_NBR  = :DCLVTRNFR.ACAT-CONTROL-NBR            
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIAST '               TO W-DB2-TABLE-NAME                    
           MOVE 'DELETE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           MOVE SQLERRD(3)               TO W-SQLERRD-3                         
           MOVE W-SQLERRD-3              TO W-SQL-DELETE-COUNT                  
                                                                                
           IF  SQLCODE  =  +0                                                   
               DISPLAY '7750-DELETE-INIT-ASSETS FOR REJECT: CNT='               
                                            W-SQL-DELETE-COUNT                  
                ' CLT: ' CLIENT-NBR OF DCLVTRNFR                                
                ' CTL: ' ACAT-CONTROL-NBR OF DCLVTRNFR                          
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
           END-IF.                                                              
                                                                                
       7750-EXIT. EXIT.                                                         
      /                                                                         
       7760-UPDATE-HOLD.                                                        
      ***SET THE PEND CODE TO 'HOLD' BASED ON B1                                
                                                                                
           MOVE 'H'                   TO NSCC-PEND-CD OF DCLACTIAST             
                                                                                
           EXEC SQL UPDATE ACTIAST                                              
                SET                                                             
                    NSCC_PEND_CD      = :DCLACTIAST.NSCC-PEND-CD                
              WHERE CLIENT_NBR        = :DCLVTRNFR.CLIENT-NBR                   
                AND ACAT_CONTROL_NBR  = :DCLVTRNFR.ACAT-CONTROL-NBR             
           END-EXEC.                                                            
                                                                                
       7760-EXIT. EXIT.                                                         
      /                                                                         
       7800-WRITE-ACATDLVF-BALANCE.                                             
      ***WRITE RECORD FOR INTRADAY FEE OR LIQUIDATION                           
           MOVE '7800-WRITE-ACATDLVF-BALANCE       ' TO W-ROUTINE-1.            
                                                                                
           MOVE SPACES                   TO ACATDLVF-DETAIL-RECORD              
           MOVE CLIENT-NBR         OF DCLVTRNFR(2:3)                            
                                         TO ACATDLVF-ADP-CL-NO-X                
           MOVE ACAT-CONTROL-NBR   OF DCLVTRNFR                                 
                                         TO ACATDLVF-CONTROL-NBR                
           MOVE DLVR-NBR           OF DCLVTRNFR                                 
                                         TO ACATDLVF-DLVR-NBR                   
           MOVE ACCT-DLVR-NBR      OF DCLVTRNFR                                 
                                         TO ACATDLVF-DLVR-ACCT                  
           MOVE RCV-NBR            OF DCLVTRNFR                                 
                                         TO ACATDLVF-RCV-NBR                    
           MOVE ACCT-RCV-NBR       OF DCLVTRNFR                                 
                                         TO ACATDLVF-RCV-ACCT                   
           MOVE TRNFR-TYPE-CD      OF DCLVTRNFR                                 
                                         TO ACATDLVF-TRNFR-TYPE-CD              
           MOVE 'B'                      TO ACATDLVF-RECORD-TYPE                
           MOVE W-BAL-TYPE1              TO ACATDLVF-TYPE1-BALANCE              
           MOVE W-BAL-TYPE2              TO ACATDLVF-TYPE2-BALANCE              
           MOVE W-BAL-TYPE3              TO ACATDLVF-TYPE3-BALANCE              
           MOVE W-BAL-TYPE5              TO ACATDLVF-TYPE5-BALANCE              
           MOVE W-BAL-SMA                TO ACATDLVF-SMA-BALANCE                
           MOVE DAYS-STTS-QTY OF DCLVTRNFR TO ACATDLVF-DAYS-STTS-QTY.           
           MOVE 'H'                      TO ACATDLVF-BAL-NSCC-PEND-CD.          
           MOVE STTS-CD OF DCLVTRNFR     TO ACATDLVF-STTS-CD.                   
                                                                                
           WRITE ACATDLVF-RECORD.                                               
           ADD 1 TO W-ACATDLVF-CNT.                                             
                                                                                
       7800-EXIT. EXIT.                                                         
      /                                                                         
       7810-WRITE-ACATDLVF-FRAC SECTION.                                        
      ***WRITE RECORD FOR LIQUIDATION                                           
           MOVE '7810-WRITE-ACATDLVF-FRAC        ' TO W-ROUTINE-1.              
                                                                                
           MOVE SPACES                   TO ACATDLVF-DETAIL-RECORD              
           MOVE CLIENT-NBR         OF DCLACTIAST(2:3)                           
                                         TO ACATDLVF-ADP-CL-NO-X                
           MOVE ACAT-CONTROL-NBR   OF DCLACTIAST                                
                                         TO ACATDLVF-CONTROL-NBR                
           MOVE DLVR-NBR           OF DCLACTIAST                                
                                         TO ACATDLVF-DLVR-NBR                   
           MOVE ACCT-DLVR-NBR      OF DCLACTIAST                                
                                         TO ACATDLVF-DLVR-ACCT                  
           MOVE RCV-NBR            OF DCLACTIAST                                
                                         TO ACATDLVF-RCV-NBR                    
           MOVE ACCT-RCV-NBR       OF DCLACTIAST                                
                                         TO ACATDLVF-RCV-ACCT                   
           MOVE TRNFR-TYPE-CD      OF DCLACTIAST                                
                                         TO ACATDLVF-TRNFR-TYPE-CD              
           MOVE 'A'                      TO ACATDLVF-RECORD-TYPE                
                                                                                
           MOVE CSH-MGN-SHRT-CD    OF DCLACTIAST                                
                                         TO ACATDLVF-CASH-MGN-IND               
           MOVE PSTN-CD            OF DCLACTIAST                                
                                         TO ACATDLVF-PSTN-CD                    
           MOVE SECURITY-ADP-NBR   OF DCLACTIAST                                
                                         TO ACATDLVF-ADP-SECURITY               
           MOVE ISIN-SEC-ISSUE-CD  OF DCLACTIAST                                
                                         TO ACATDLVF-CUSIP-NUM                  
           MOVE ASSET-QTY          OF DCLACTIAST                                
                                         TO ACATDLVF-QTY                        
           MOVE ASSET-AMT          OF DCLACTIAST                                
                                         TO ACATDLVF-MARKET-VALUE               
           MOVE W-AST-FRAC-QTY(IDXA)                                            
                                         TO ACATDLVF-FRAC-QTY                   
           MOVE W-AST-FRAC-MARKET-VALUE(IDXA)                                   
                                         TO ACATDLVF-FRAC-MARKET-VALUE          
           MOVE STTLM-LCTN-CD OF DCLACTIAST                                     
                                         TO ACATDLVF-SETTLING-LOC               
           MOVE STTLM-RSN-CD  OF DCLACTIAST                                     
                                         TO ACATDLVF-SETTLING-REASON            
           MOVE ASSET-PRC-CTGY-CD OF DCLACTIAST                                 
                                         TO ACATDLVF-ASSET-CATEGORY             
           MOVE ASSET-DESC-TXT    OF DCLACTIAST                                 
                                         TO ACATDLVF-ASSET-DESC                 
           MOVE 'H'                      TO ACATDLVF-NSCC-PEND-CD.              
                                                                                
           WRITE ACATDLVF-RECORD.                                               
           ADD 1 TO W-ACATDLVF-CNT.                                             
                                                                                
       7810-EXIT. EXIT.                                                         
      /                                                                         
       8100-SQL-COMMIT.                                                         
           MOVE '8100-SQL-COMMIT               ' TO W-ROUTINE-1.                
                                                                                
           EXEC SQL COMMIT                                                      
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO COMMIT-SQLCA                                         
           MOVE SQLCODE TO COMMIT-RETURN                                        
                                                                                
           IF  COMMIT-AB                                                        
               DISPLAY 'CAT518: '                                               
                   'SQL COMMIT FAILED. COMMIT-RETURN= '                         
                    COMMIT-RETURN                                               
                  ' INFILE-CNT= '           W-INFILE-CNT                        
                    ' PREV-CNT= '           W-LAST-COMMIT-INFILE-CNT            
           ELSE                                                                 
               ADD 1 TO W-COMMIT-CNT                                            
           END-IF.                                                              
                                                                                
           MOVE W-INFILE-CNT             TO W-LAST-COMMIT-INFILE-CNT.           
                                                                                
       8100-EXIT. EXIT.                                                         
      /                                                                         
       8300-DISPLAY-KEY.                                                        
           DISPLAY '    KEY:'   ' CLT=' WF-CLIENT-NBR                           
                                ' CTL=' WF-ACAT-CONTROL-NBR                     
                                ' TFR=' WF-TRNFR-TYPE-CD                        
                                ' TRN=' WF-TRANS-TYPE-CD                        
                                ' STA=' WF-STTS-CD                              
                                ' DAY=' W-NSCC-DAYS-IN-STATUS                   
                                ' ACT=' W-NSCC-SYSTEM-ACTION                    
                                ' REJ=' W-NSCC-SYSTEM-REJ-RSN                   
                                ' SUB=' W-NSCC-TI-SUB-PART-NBR                  
           DISPLAY '   '        ' DLV=' WF-DLVR-NBR                             
                             ' DLV-AC=' WF-ACCT-DLVR-NBR                        
                                ' RCV=' WF-RCV-NBR                              
                             ' RCV-AC=' WF-ACCT-RCV-NBR                         
           DISPLAY '   ' ' SEC-CC=' ISIN-CNTRY-CD     OF DCLACTIAST             
                         ' SEC-NO=' ISIN-SEC-ISSUE-CD OF DCLACTIAST             
                         ' SEC-CD=' ISIN-SEC-CDG-CD   OF DCLACTIAST             
                         ' STL-LC=' STTLM-LCTN-CD     OF DCLACTIAST             
                            ' CMS=' CSH-MGN-SHRT-CD   OF DCLACTIAST.            
       8300-EXIT. EXIT.                                                         
      /                                                                         
       8500-SQL-ERROR.                                                          
           DISPLAY ' '                                                          
           DISPLAY '8500-SQL-ERROR' ' INFILE-CNT = ' W-INFILE-CNT               
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT                
           DISPLAY ' '                                                          
           CALL DSNTIAR         USING SQLCA W-DB2-MSG-AREA                      
                                            W-DB2-MSG-LEN.                      
           PERFORM VARYING W-DB2-IDX FROM 1 BY 1                                
             UNTIL W-DB2-IDX GREATER THAN 12                                    
                   IF W-DB2-ERROR-MSG (W-DB2-IDX) > SPACES                      
                      DISPLAY W-DB2-ERROR-MSG (W-DB2-IDX)                       
                   END-IF                                                       
           END-PERFORM.                                                         
           DISPLAY ' '                                                          
           PERFORM 8700-SQL-ROLLBACK THRU 8700-EXIT                             
           DISPLAY 'CAT518: U3999 - ABENDING ON BAD DB2 STATUS'                 
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT518: PROGRAM ENDED ABNORMALLY'                           
           MOVE +3999    TO ABEND-CODE                                          
           CALL ABEND USING ABEND-CODE.                                         
       8500-EXIT. EXIT.                                                         
      /                                                                         
       8700-SQL-ROLLBACK.                                                       
           DISPLAY '8700-SQL-ROLLBACK' ' INFILE-CNT = ' W-INFILE-CNT            
               ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT            
           EXEC SQL ROLLBACK WORK END-EXEC.                                     
           MOVE SQLCA   TO ROLLBACK-SQLCA                                       
           MOVE SQLCODE TO ROLLBACK-RETURN                                      
           IF ROLLBACK-AB                                                       
              DISPLAY 'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '                
                                             ROLLBACK-RETURN                    
           ELSE                                                                 
              DISPLAY 'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '            
                                                 ROLLBACK-RETURN                
           END-IF.                                                              
       8700-EXIT. EXIT.                                                         
      /                                                                         
       8900-DISPLAY-CNT.                                                        
           DISPLAY ' '                                                          
           DISPLAY 'CAT518: INFILE  COUNT      = ' W-INFILE-CNT                 
                 ' (INCLUDES HEADER AND TRAILER)'                               
           DISPLAY 'CAT518: DETAIL  COUNT      = ' W-DETAIL-CNT                 
                 ' (EXCLUDES HEADER AND TRAILER)'                               
           DISPLAY 'CAT518: ACATDLVF COUNT     = ' W-ACATDLVF-CNT               
                 ' (EXCLUDES HEADER AND TRAILER)'                               
           DISPLAY 'CAT518: MMF FILE READ CNT  = ' W-MMF-CNT                    
                 ' (INCLUDES HEADER)'                                           
           DISPLAY 'CAT518: W-TI-CNT           = ' W-TI-CNT                     
           DISPLAY 'CAT518: FUL-TFR-DLVR-CNT   = ' W-LOAD-CNT                   
           DISPLAY 'CAT518: BAL-READ-CNT       = ' W-GETVBAL-CNT                
           DISPLAY 'CAT518: POS-READ-CNT       = ' W-GETVHOL-CNT                
           DISPLAY 'CAT518: POSITION-COUNT     = ' W-POSITION-CNT               
           DISPLAY 'CAT518: W-WHEN-ISSUE-CNT   = ' W-WHEN-ISSUE-CNT             
           DISPLAY 'CAT518: W-RESTRICTED-CNT   = ' W-RESTRICTED-CNT             
           DISPLAY 'CAT518: W-MRGIMM-CNT       = ' W-MRGIMM-CNT                 
           DISPLAY 'CAT518: W-MRGIMM-FND-CNT   = ' W-MRGIMM-FND-CNT             
                           ' W-MRGIMM-NOTFND-CNT= ' W-MRGIMM-NOTFND-CNT         
DJ0010     DISPLAY 'CAT518: ACTRBSC-FND-CNT    = ' W-ACTRBSC-FND-CNT            
DJ0010                    ' ACTRBSC-NOTFND     = ' W-ACTRBSC-NOTFND-CNT         
           DISPLAY 'CAT518: VRSTSEC-FND-CNT    = ' W-VRSTSEC-FND-CNT            
                           ' VRSTSEC-NOTFND-CNT = ' W-VRSTSEC-NOTFND-CNT        
           DISPLAY 'CAT518: VRSDBLK-SEC-FND-CNT= '                              
                                                   W-VRSDBLK-SEC-FND-CNT        
           DISPLAY 'CAT518: W-PRNGFL-CNT       = ' W-PRNGFL-CNT                 
                           ' W-PRNGFL-FND-CNT   = ' W-PRNGFL-FND-CNT            
LRM020     DISPLAY 'CAT518: W-MATURE-FND-CNT   = ' W-MATURE-FND-CNT             
LRM020     DISPLAY 'CAT518: W-VBNDDT-FND-CNT   = ' W-VBNDDT-FND-CNT             
LRM020                    ' W-VBNDDT-NOTFND-CNT= ' W-VBNDDT-NOTFND-CNT          
LRM021     DISPLAY 'CAT518: W-VBNDFTRV-FND-CNT = ' W-VBNDFTRV-FND-CNT           
LRM021                    ' W-VBNDFTRV-NOTFND  = ' W-VBNDFTRV-NOTFND            
LRM020     DISPLAY 'CAT518: W-BOND-AUDIT-ADD   = ' W-BOND-AUDIT-ADD             
LRM020     DISPLAY 'CAT518: W-BOND-AUDIT-NOTADD= ' W-BOND-AUDIT-NOTADD          
           DISPLAY 'CAT518: BNWMAST-READ-CNT   = ' W-BNWMAST-CNT                
                           ' BNWMAST-FND-CNT    = ' W-BNWMAST-FND-CNT           
           DISPLAY 'CAT518: BNWREGOP-READ-CNT  = ' W-BNWREGOP-CNT               
                           ' BNWREGOP-FND-CNT   = ' W-BNWREGOP-FND-CNT          
           DISPLAY 'CAT518: W-MFMSD-CNT        = ' W-MFMSD-CNT                  
                           ' W-MFMSD-FND-CNT    = ' W-MFMSD-FND-CNT             
DJ0013     DISPLAY 'CAT518: W-MFEXBR-CNT       = ' W-MFEXBR-CNT                 
DJ0013                    ' W-MFEXBR-FND-CNT   = ' W-MFEXBR-FND-CNT             
           DISPLAY 'CAT518: W-LEGG-CNT         = ' W-LEGG-CNT                   
           DISPLAY 'CAT518: W-OMNIBUS-CNT      = ' W-OMNIBUS-CNT                
           DISPLAY 'CAT518: W-DST-MFE-CNT      = ' W-DST-MFE-CNT                
LRM018     DISPLAY 'CAT518: W-PNC-SURPAS-CNT   = ' W-PNC-SURPAS-CNT             
           DISPLAY 'CAT518: W-CKDIGIT-CNT      = ' W-CKDIGIT-CNT                
           DISPLAY 'CAT518: W-GETNA-FND-CNT    = ' W-GETNA-FND-CNT              
           DISPLAY 'CAT518: W-GETNA-NOT-FND    = ' W-GETNA-NOTFND-CNT           
           DISPLAY 'CAT518: SQL-CNT            = ' W-SQL-CNT                    
           DISPLAY 'CAT518: W-COMMIT-CNT       = ' W-COMMIT-CNT                 
           DISPLAY ' '                                                          
           DISPLAY 'CAT518: W-RELEASE-CNT      = ' W-RELEASE-CNT                
           DISPLAY 'CAT518: W-RETURN-CNT       = ' W-RETURN-CNT                 
           DISPLAY 'CAT518: VTRNFR-UPD-CNT     = ' W-VTRNFR-UPD-CNT             
                           ' VTRNFR-NOT-UPD-CNT  = '                            
                                                 W-VTRNFR-NOT-UPD-CNT           
           DISPLAY 'CAT518: ACTIAST-CREATE     = ' W-ACTIAST-CREATE-CNT         
           DISPLAY 'CAT518: ACTIOPN-CREATE     = ' W-ACTIOPN-CREATE-CNT         
           DISPLAY 'CAT518: ACTIMF-CREATE      = ' W-ACTIMF-CREATE-CNT          
           DISPLAY 'CAT518: ACTIAST-ADD-CNT    = ' W-ACTIAST-ADD-CNT            
                          ' ACTIAST-NOT-ADD-CNT = '                             
                                                  W-ACTIAST-NOT-ADD-CNT         
           DISPLAY 'CAT518: ACTIAST-UPD-CNT    = ' W-ACTIAST-UPD-CNT            
                          ' ACTIAST-NOT-UPD-CNT = '                             
                                                  W-ACTIAST-NOT-UPD-CNT         
           DISPLAY 'CAT518: ACTIAST-DEL-CNT    = ' W-ACTIAST-DEL-CNT            
                          ' ACTIAST-NOT-DEL-CNT = '                             
                                                  W-ACTIAST-NOT-DEL-CNT         
           DISPLAY 'CAT518: ACTIOPN-ADD-CNT    = ' W-ACTIOPN-ADD-CNT            
                          ' ACTIOPN-NOT-ADD-CNT = '                             
                                                  W-ACTIOPN-NOT-ADD-CNT         
           DISPLAY 'CAT518: ACTIOPN-UPD-CNT    = ' W-ACTIOPN-UPD-CNT            
                          ' ACTIOPN-NOT-UPD-CNT = '                             
                                                  W-ACTIOPN-NOT-UPD-CNT         
           DISPLAY 'CAT518: ACTIMF-ADD-CNT     = ' W-ACTIMF-ADD-CNT             
                          ' ACTIMF-NOT-ADD-CNT  = '                             
                                                   W-ACTIMF-NOT-ADD-CNT         
           DISPLAY 'CAT518: ACTIMF-UPD-CNT     = ' W-ACTIMF-UPD-CNT             
                          ' ACTIMF-NOT-UPD-CNT  = '                             
                                                   W-ACTIMF-NOT-UPD-CNT         
           DISPLAY 'CAT518: ACTITRF-ADD-CNT    = ' W-ACTITRF-ADD-CNT            
                          ' ACTITRF-NOT-ADD-CNT = '                             
                                                 W-ACTITRF-NOT-ADD-CNT          
           DISPLAY 'CAT518: ACTITRF-UPD-CNT    = ' W-ACTITRF-UPD-CNT            
                          ' ACTITRF-NOT-UPD-CNT = '                             
                                                 W-ACTITRF-NOT-UPD-CNT          
LRM027     DISPLAY 'CAT518: CATEXCP  COUNT     = ' W-CATEXCP-CNT                
LRM027           ' (EXCLUDES HEADER AND TRAILER)'                               
                                                                                
           DISPLAY 'CAT518: W-ACATPTRR-CNT     = ' W-ACATPTRR-CNT               
           DISPLAY 'CAT518: W-ACATPTRP-CNT     = ' W-ACATPTRP-CNT               
           DISPLAY 'CAT518: W-ACATPTRF-CNT     = ' W-ACATPTRF-CNT               
           .                                                                    
       8900-EXIT. EXIT.                                                         
      /                                                                         
       9000-CLOSE-ROUTINE.                                                      
           MOVE '9000-CLOSE-ROUTINE            ' TO W-ROUTINE-1.                
           DISPLAY ' '.                                                         
           MOVE ' '                      TO ACATDLVF-TRAILER-RECORD             
           MOVE 'T'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE W-ACATDLVF-CNT           TO CP2-RECORD-COUNT.                   
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
                                                                                
           CALL P2HDTR                USING CP2-AREA                            
                                            ACATDLVF.                           
                                                                                
           MOVE CP2-RETURN-RECORD        TO ACATDLVF-TRAILER-RECORD             
DJ0010     MOVE LD-PROC-DATE             TO ACATDLVF-TRL-PROC-DATE              
           MOVE 'CYCLE='                 TO ACATDLVF-TRL-CYCLE-LIT              
           MOVE W-SAVE-CYCLE-NBR         TO ACATDLVF-TRL-CYCLE-NO               
           DISPLAY 'CAT518: ACATDLVF-TRL= ' ACATDLVF-TRAILER-RECORD             
           WRITE ACATDLVF-RECORD.                                               
           DISPLAY 'CAT518: ACATDLVF  TRAILER WRITTEN. STATUS = '               
                                               ACATDLVF-STATUS.                 
           CLOSE ACATDLVF                                                       
           DISPLAY 'CAT518: ACATDLVF CLOSED. STATUS = '                         
                                             ACATDLVF-STATUS.                   
                                                                                
LRM027     MOVE ' '                      TO CATEXCP-TRAILER-RECORD              
LRM027     MOVE 'T'                      TO CP2-REQUEST-CODE.                   
LRM027     MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
LRM027     MOVE W-CATEXCP-CNT            TO CP2-RECORD-COUNT.                   
LRM027     MOVE 999                      TO CP2-CLIENT-NUMBER.                  
LRM027     CALL P2HDTR                USING CP2-AREA                            
LRM027                                      CATEXCP.                            
LRM027     MOVE CP2-RETURN-RECORD        TO CATEXCP-TRAILER-RECORD              
LRM027     MOVE LD-PROC-DATE             TO CATEXCP-TRL-PROC-DATE               
LRM027     MOVE 'CYCLE='                 TO CATEXCP-TRL-CYCLE-LIT               
LRM027     MOVE W-SAVE-CYCLE-NBR         TO CATEXCP-TRL-CYCLE-NO                
LRM027     DISPLAY 'CAT518: CATEXCP-TRL= ' CATEXCP-TRAILER-RECORD               
LRM027     WRITE CATEXCP-RECORD.                                                
LRM027     DISPLAY 'CAT518: CATEXCP  TRAILER WRITTEN. STATUS = '                
LRM027                                         CATEXCP-FILE-STATUS.             
           CLOSE INFILE                                                         
           DISPLAY 'CAT518: INFILE   CLOSED. STATUS = '                         
                                             INFILE-FILE-STATUS.                
           CLOSE MMF-FILE.                                                      
           MOVE 'C' TO GETVBAL-FUNC.                                            
           PERFORM 9500-CALL-GETVBAL THRU 9500-EXIT                             
           DISPLAY 'CAT518: GETVBAL  CLOSED. STATUS = '                         
                                             BALNC-STATUS.                      
           MOVE 'C'        TO GETVHOL-FUNC                                      
           PERFORM 9600-CALL-GETVHOL THRU 9600-EXIT                             
           DISPLAY 'CAT518: GETVHOL  CLOSED. STATUS = '                         
                                             POSVSAM-STATUS.                    
           CLOSE MRGIMM                                                         
           DISPLAY 'CAT518: MRGIMM   CLOSED. STATUS = '                         
                                             MRGIMM-STATUS.                     
           CLOSE PRNGFL                                                         
           DISPLAY 'CAT518: PRNGFL   CLOSED. STATUS = '                         
                                             PRNGFL-STATUS.                     
           CLOSE MFMSD                                                          
           DISPLAY 'CAT518: MFMSD    CLOSED. STATUS = '                         
                                             MFMSD-STATUS.                      
           CLOSE BNWMAST                                                        
           DISPLAY 'CAT518: BNWMAST  CLOSED. STATUS = '                         
                                             BNWMAST-STATUS.                    
           CLOSE BNWREGOP                                                       
           DISPLAY 'CAT518: BNWREGOP CLOSED. STATUS = '                         
                                             BNWREGOP-STATUS.                   
DJ0013     CLOSE MFEXBR                                                         
DJ0013     DISPLAY 'CAT518: MFEXBR   CLOSED. STATUS = '                         
DJ0013                                       MFEXBR-STATUS.                     
           CLOSE ACATPTRR                                                       
           DISPLAY 'CAT518: ACATPTRR CLOSED. STATUS = '                         
                                             ACATPTRR-STATUS.                   
           CLOSE ACATPTRF                                                       
           DISPLAY 'CAT518: ACATPTRF CLOSED. STATUS = '                         
                                             ACATPTRF-STATUS.                   
           CLOSE ACATPTRP                                                       
           DISPLAY 'CAT518: ACATPTRP CLOSED. STATUS = '                         
                                             ACATPTRP-STATUS.                   
LRM027     CLOSE CATEXCP                                                        
LRM027     DISPLAY 'CAT518: CATEXCP  CLOSED. STATUS = '                         
LRM027                                       CATEXCP-FILE-STATUS.               
                                                                                
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT518: PROGRAM ENDED SUCCESSFULLY'.                        
       9000-EXIT. EXIT.                                                         
      *                                                                         
       9500-CALL-GETVBAL.                                                       
           CALL GETVBAL USING GETVBAL-PARM.                                     
           MOVE GETVBAL-FILE-STATUS TO BALNC-STATUS                             
           IF GETVBAL-FILE = 'N'                                                
              MOVE GETVBAL-NEW-RECORD TO BAL-REC                                
           ELSE                                                                 
              MOVE GETVBAL-OLD-RECORD TO CMBL-CUSTOMER-BALANCE-SEGMENT.         
       9500-EXIT. EXIT.                                                         
       9600-CALL-GETVHOL.                                                       
           CALL GETVHOL USING GETVHOL-PARM.                                     
           MOVE GETVHOL-FILE-STATUS TO       POSVSAM-STATUS.                    
       9600-EXIT. EXIT.                                                         
      *################################################################         
