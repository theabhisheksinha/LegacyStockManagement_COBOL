000001* PDX    - CAT515   C0355480 06/09/14 15:37:37 TBLAMUR            00001000
      * CSG001 SSR 101121 REPLACE ILLEGAL CHARS IN MSD-DESC WITH SPACES.        
      * LRM044 SSR 94389 LOOKUP SUBMITTER ISIN FOR CAGE TAG.                    
000001* PDX    - CAT515   C0339180 04/30/13 10:41:05 TBLAMUR            00001000
      * LRM043 SSR 90340 SAVE ORIG DELIVERY QTY ON RCL/FRV FOR                  
      *  MEMO BOOOKING IN NEW COLUMN IN SAME RTN AS CAGE TAG LOOKUP.            
000001* PDX    - CAT515   C0336051 04/30/13 10:14:07 TBLAMUR            00001000
      * LRM042 SSR 87781 FIRST QUALIFY CAGE-TAG > SPACES ON LOOKUP              
      *   ON DELIVERER SIDE FRV AND MFC LOOKUP.                                 
000001* PDX    - CAT515   C0331456 01/22/13 13:51:01 TBLAMUR            00001000
      * LRM041 SSR 85491 CHANGE FAIL-OPEN IND ON ORIGINAL VASTHSTY TO           
      *   ALLOW FRV TO BE ONE AGAIN, WHEN DELVR SIDE FRV REJECT.                
000001* PDX    - CAT515   C0329036 10/05/12 15:13:20 TBLAMUR            00001000
      * LRM040 SSR 85105 UPGRADE ISIN LOOKUP LRM037 TO TRY MSISINB              
      *   IF RECEIVER SIDE STANDARD ISIN FIELDS ARE ALL POPULATED AND           
      *   COUNTRY IS NOT 'US'.                                                  
      * LRM039 SSR 86856 INCLUDE BALS HELD IN FOREIGN CURRENCY ON THE           
      * DELIVERY AS SLOC=50, LOOKUP CURRENCY ON CURLOOK.                        
      * LRM038 SSR 84763 INCLUDE POSN HELD IN FOREIGN CURRENCY IN TH            
      * DELIVERY AS SLOC=50, LOOKUP ACTIAST BASED ON COMMENT.                   
000001* PDX    - CAT515   C0311598 05/13/11 08:33:55 TBLAMUR            00001000
      * LRM037 SSR 77445 CALL MSISINB WITH SUBMITTER ISIN FOR BETTER            
      *   MATCH TO MSD.                                                         
000001* PDX    - CAT515   C0307327 02/02/11 15:49:29 TBLAMUR            00001000
      * LRM036 SSR 70607 WIPE LAST DAY INDICATOR WHEN INSERTING ASSETS          
000001* PDX    - CAT515   C0300196 08/10/10 11:41:07 TBLAMUR            00001000
      * LRM035 SSR 70308 REMOVE OLD OPTION LOOKUP, FILES MSDINF MSDIDX          
000001* PDX    - CAT515   C0296134 05/14/10 10:45:08 TBLAMUR            00001000
      * LRM034 SSR 65158 MFRS OFFSHORE = Y AND GEO 901-979, AND                 
      *   TREAT AS NO FUND AGREEMENT OF FILE.                                   
000001* PDX    - CAT515   C0293640 03/11/10 08:50:32 TBLAMUR            00001000
      * LRM033 SSR 66262 QUALIFY FUND AGREEMENT ON FILE FOR SL=10,50.           
000001* PDX    - CAT515   C0290020 01/29/10 15:09:47 TBLAMUR            00001000
      * LRM032 SSR 59603 OPTION SYMB; REMOVE HARDCODE Q STREAM.                 
      * LRM032 UPGRADE LONG/SHORT LOGIC BASED ON OPEN/CLOSE.                    
      * LRM031 SSR 65670 SUB PENNY PRICE EDIT B1 434549.                        
000001* PDX    - CAT515   C0286143 11/02/09 10:03:34 TBLAMUR            00001000
      * LRM030 SSR 67172 USE 6 BYTE KEYED SYMBOL FILE INF2.                     
      * LRM029 SSR 59603 OPTION SYMBOLOGY CHANGES.                              
      *   ADD PARM-STREAM = Q HARD CODE AT THIS TIME.                           
      *   CALL GETADPNO TO OBTAIN ADP NBR, USE THIS TO READ MSD.                
      *   CHANGE ASSET DESC FORMATTING WHEN MSD NOTFND FOR OPTIONS.             
000001* PDX    - CAT515   C0285901 09/16/09 11:47:02 TBLAMUR            00001000
      * LRM028 SSR 65227 UPD VASSET WITH MSD MATCHING METHOD                    
000001* PDX    - CAT515   C0282914 10/02/09 09:12:24 TBLAMUR            00001000
      * LRM027 SSR 64327 NEW B1 VALUE 434541 = 2XX MEANING NET BOTH             
      * LRM027 TYPE 1,2 CASH BALS TOGETHER, TO CONSIDER INBOUND DEBIT.          
000001* PDX    - CAT515   C0281107 07/01/09 10:32:04 TBLAMUR            00001000
      * LRM026 SSR 63475 FRV LOOKUP CAGE TAG ON VASSET WHEN NOTFND HSTY         
000001* PDX    - CAT515   C0280390 05/11/09 11:07:44 TBDOJUN            00001000
      * DJ0025 SSR 63084 USE MFNM,MFMM FOR MUTUAL FUND AUTO DELETE              
000001* PDX    - CAT515   C0276888 04/21/09 10:43:20 TBDOJUN            00001000
      * DJ0024 SSR 61684 AUCTION RATE SECURITY(ARS)                             
      * DJ0024 SSR 61867 USE ADP-NO TO READ VRSTSEC(NO MORE CUSIP)              
000001* PDX    - CAT515   C0274114 01/29/09 11:40:30 TBDOJUN            00001000
      * DJ0023 SSR 60131 IF 12 DIGIT CUSIP NOT FND FOR BOND, USE 9.             
      * DJ0023 SSR 62537 USE PRNGFL FILE TO CHECK FOR PRIVATE RANGE             
000001* PDX    - CAT515   C0271515 12/24/08 16:36:22 TBDOJUN            00001000
      * DJ0022 SSR 59678 IF WHEN-ISSUE NOT FOUND, USE REGULAR SECURITY.         
      * DJ0022 IF ASSET CAME IN WITH W-NSCC-AT-WHN-ISS-IND = 'W',               
      * DJ0022 AND NOT A WHEN-ISSUE, MOVE 'I' TO W-NSCC-AT-WHN-ISS-IND          
      * DJ0022 AND TO WHI-CD OF DCLVASSET.                                      
000001* PDX    - CAT515   C0271378 11/10/08 10:35:48 TBDOJUN            00001000
      * DJ0021 SSR 59669 DO NOT ACCELERATE IF AUTO FUND DELETE                  
000001* PDX    - CAT515   C0267760 10/20/08 14:20:09 TBDOJUN            00001000
      * DJ0020 SSR 57532 USE ISIN TO LOOKUP MSD WHEN CUSIP NOT FOUND            
      * DJ0020 SSR 55766 ASCENDIS(WORKFLOW) PARALLEL RUN                        
000001* PDX    - CAT515   C0260091 07/07/08 10:05:39 TBDOJUN            00001000
      * DJ0019 SSR 55766 ASCENDIS(WORKFLOW) SET ASCENDIS INDICATOR              
      * DJ0019 FOR FUL,PTR,PTD ONLY AND BH-ACAT-ASCENDIS-USER = '1'             
000001* PDX    - CAT515   C0249006 06/29/07 12:37:09 TBDOJUN            00001000
      * DJ0018 SSR 47339 SUPPORT DUALLY LISTED SECURITIES                       
      * DJ0018           POPULATE GETMSD-CLIENT-PL2 WHEN CALLING GETMSD         
000001* PDX    - CAT515   C0241847 01/23/07 14:59:35 TBDOJUN            00001000
      * DJ0017 SSR 45744 ACCOUNT-FREEZE EDIT                                    
000001* PDX    - CAT515   C0240752 11/13/06 16:05:01 TBDOJUN            00001000
      * DJ0016 SSR 49202 90DR, REGT                                             
000001* PDX    - CAT515   C0239593 09/22/06 10:56:29 TBLAMUR            00001000
      * LRM016 SSR# 48434 RECOMPILE ONLY FOR FACZ1CA CHANGE.                    
000001* PDX    - CAT515   C0236781 07/10/06 10:23:30 TBDOJUN            00001000
      * DJ0015 SSR 45744 ACCOUNT-FREEZE EDIT                                    
000001* PDX    - CAT515   C0234715 06/23/06 11:51:56 TBDOJUN            00001000
      * DJ0014 SSR 45744 ACCOUNT-FREEZE EDIT                                    
000001* PDX    - CAT515   C0224925 10/10/05 11:18:42 TBDOJUN            00001000
      * DJ0013 SSR 39800 CHECKING FAIL-OPEN-CAGE-IND FOR FRV/MFC DUPES          
      * DJ0013 SSR 40204 RETAIN ADP NUMBER                                      
000001* PDX    - CAT515   C0222541 08/24/05 09:25:05 TBLAMUR            00001000
      * DJ0011 SSR 41374 FRV RCL SAVE 866 SEC NBR AND QTY                       
      * DJ0012 SSR       DELETE ACTIAST THE SAME WAY AS CAT513 ACTITRF          
      * DJ0012           USE THE TRAN-REF-ID FIELD                              
000001* PDX    - CAT515   C0210131 04/14/05 16:28:49 TBDOJUN            00001000
      * DJ0010 FIX ACCELERATE SUBMITTING PARTICIPANT                            
000001* PDX    - CAT515   C0218155 03/14/05 17:11:24 TBDOJUN            00001000
      * DJ0009 FIX ACCELERATE TFR-TYPE FIELD                                    
      * DJ0009 SSR# XXXXX FIX SUBMITTING PART. FOR MF AUTO DELETES              
      * DJ0009 SSR# XXXXX FIX MEMO-PTR OPTION BUY/SELL CODE                     
000001* PDX    - CAT515   C0215363 02/18/05 16:16:42 TBDOJUN            00001000
      * DJ0008 SSR# 40042 NEW DB2 INIT TBL: ACTI***,NEW KEY STRUCTURE           
      * DJ0008 SSR# 40633 RECOMPILED FOR NEW COPYBOOK (ANNUITY)                 
      * DJ0008 SSR# 39561 PTR PHASE 2: RCV ASSET VALIDATION                     
      * PDX    - CAT515   C0211125 12/23/04 14:19:04 TBDOJUN                    
      * DJ0007 SSR#29649 MUTUAL FUND AUTO DELETE. NEW B1#434689                 
      * DJ0007 IF NO FUND AGREEMENT, FOR 'FUL': CREATE DELETE ASSET,            
      * DJ0007 FOR 'RCR': CREATE REJECT TRANSFER                                
      * DJ0007 CHANGE PIC 9 TO PIC 9 COMP-3 FOR MIPS REDUCTION.                 
      * PDX    - CAT515   C0210469 09/20/04 10:16:14 TBDOJUN                    
      * DJ0006 SSR#34535 FRV AND MFC FIX. ADD CAGE-TAG-NBR                      
      * PDX    - CAT515   C0197067 10/23/03 12:26:07 TBLAMUR                    
      * LRM005 - NSCC REGULATORY CHANGE, FUND RE-REG DATE FOR MFC               
      * PDX    - CAT515   C0176464 06/13/02 15:37:14 TBLAMUR                    
      * PDX    - CAT515   C0160782 07/26/01 16:09:04 TBLAMUR                    
      * DJ0005 SSR# R5246800 NEW TRANSFER TYPE MFC -MUTUAL FUND CLEANUP         
      * DJ0005 SSR#R3848800 MUTUAL FUND RECEIVER ADJUSTMENTS(DELETES)           
      *        - IF RECEIVER DELETE AN ASSET, DELETE IT FROM ACTIAST            
      *        - AND VASSET. CHANGE STATUS ON VTRNFR TO NEW STATUS 240          
      * PDX    - CAT515   C0155175 05/03/01 13:58:20 TBLAMUR                    
      * PDX    - CAT515   C0156214 03/21/01 15:40:21 TBLAMUR                    
      * PDX    - CAT515   C0152174 01/03/01 15:23:05 TBDOJUN                    
      * DJ0004 PTR - DELETE ASSETS THAT ORIGINATOR LOADED.                      
      * PDX    - CAT515   C0151178 12/18/00 08:36:07 TBDOJUN                    
      * DJ0003 SSR# R2262400 W8 FIELDS COPYBOOK RECOMPILE. COBOL LE             
      * PDX    - CAT515   C0129756 08/16/99 12:20:18 TBDOJUN                    
      * DJ0002 - FIX -911 WHEN DOING GENERIC DELETE OF ACTIAST                  
      *        - USE FETCH TO DELETE ONE ROW AT A TIME                          
      *        - COMMIT AFTER EVERY UPDATE                                      
      * PDX    - CAT515   C0127169 08/05/99 17:55:55 TBDOJUN                    
      * DJ0001 - WHEN CHECKING OPTIONS FOR SHORT POSITION,                      
      *          USE THE OPTION BUY-SELL INDICATOR NOT THE POSITION CODE        
      * PDX    - CAT515   C0125737 06/21/99 13:50:43 TBDOJUN                    
      * DJ     - SET RESTRICTED-IND ON VASSET                                   
      *        - IF BH-ACAT-PART-TRANSFR-ASSET-EXC = '1', EDIT PTD              
      *        - WHEN THERE ARE NOT EXCEPTIONS, AUTO APPROVE IT                 
      *        - DOUBLE-CHECK OPTION SYMBOL RETURNED FROM MSD WITH NSCC         
      * PDX    - CAT515   C0124764 04/26/99 10:50:22 TBDOJUN                    
      * DJ     - DO NOT FLAG DEBIT BALANCE AS A SHORT POSITION                  
      * PDX    - CAT515   C0123822 03/29/99 15:59:20 TBDOJUN                    
      * PDX    - CAT515   C0122870 03/17/99 17:45:53 TBDOJUN                    
      * DJ     - RECOMPILED FOR EXPANDED RECMDIDX                               
      * PDX    - CAT515   C0122542 03/05/99 10:53:18 TBDOJUN                    
      * PDX    - CAT515   C0122392 02/26/99 16:49:06 TBDOJUN                    
      * PDX    - CAT515   C0122310 02/25/99 12:50:46 TBDOJUN                    
      * PDX    - CAT515   C0122278 02/24/99 15:43:58 TBDOJUN                    
      * PDX    - CAT515   C0122194 02/23/99 11:59:10 TBDOJUN                    
      * PDX    - CAT515   C0121866 02/17/99 12:19:35 TBDOJUN                    
      * PDX    - CAT515   C0121541 02/11/99 13:32:10 TBDOJUN                    
      * PDX    - CAT515   C0121508 02/08/99 21:47:28 TBDOJUN                    
      * PDX    - CAT515   C0121209 02/08/99 00:06:54 TBDOJUN                    
      * PDX    - CAT515   C0121087 02/01/99 10:10:01 TBDOJUN                    
      * PDX    - CAT515   C0120784 01/29/99 12:27:50 TBDOJUN                    
      * PDX    - CAT515   C0120203 01/22/99 11:13:43 TBDOJUN                    
      * PDX    - CAT515   C0119389 01/08/99 11:27:39 TBDOJUN                    
      * PDX    - CAT515   C0118401 12/10/98 14:33:51 TBDOJUN                    
      * DJ     - LOOKUP OPTION ADP SYMBOL AND SECURITY NUMBER                   
      * DJ     - FIX DSTBN-SIDE-CD LOGIC                                        
      * DJ     - FIX DELETE        LOGIC                                        
      * DJ     - FIX SOC7 - DAYS-IN-STATUS                                      
      * DJ     - UPDATE VTRNFR STATUS TO REVIEW                                 
      * PDX    - CAT515   C0109316 11/13/98 10:12:49 TBDOJUN                    
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT515.                                                     
      *****************************************************************         
      * THIS PROGRAM CONTAINS DB2.                                    *         
      *****************************************************************         
      * CAT515 - PROCESS ASSETS   ('AT') TRANSACTIONS FROM NSCC.      *         
      *                                                               *         
      * PROCESS ONLY ASSETS  RECORDS FROM THE INPUT FILE.             *         
      *                                                               *         
      * IF THE SUBMITTING PARTICIPANT = DISTRIBUTION PARTICIPANT,     *         
      * DELETE THE ROW FROM THE INIT TABLE.                           *         
      *                                                               *         
      * ADD ALL ASSETS TO ACTIVE TABLE.                               *         
      *                                                               *         
      * WRITE OUT EVERY RECORD FROM INPUT FILE.                       *         
      *                                                               *         
      * INPUT  -                                                      *         
      *        - EXTRACTED NSCC FILE                                  *         
      *        - NAME/ADDRESS                                         *         
      *        - B1 HEADER                                            *         
      *                                                               *         
      * OUTPUT -                                                      *         
      *        - EXTRACTED NSCC FILE. UPDATE SWITCHES.                *         
      *        - DB2 DATABASE                                         *         
      *                                                               *         
      * REJECT FULL TRANSFER RECEIVE IF THE FOLLOWING B1 EQUAL '1':   *         
      * BH-ACAT-REJ-PEND-FULL-REC-AMT (434540)                        *         
      * BH-ACAT-REJ-REC-MARGIN-DEBIT  (434540)                        *         
      * BH-ACAT-REJ-REC-ASSET-VALUE   (434540)                        *         
      * BH-ACAT-REJ-REC-TOTL-ACT-VAL  (434540)                        *         
      * BH-ACAT-REJ-PEND-FULL-REC-DB1 (434541)                        *         
      * BH-ACAT-REJ-PEND-FULL-REC-SP  (434542)                        *         
      * BH-ACAT-REJ-PEND-FULL-REC-NTS (434543)                        *         
      * BH-ACAT-REJ-PEND-FULL-REC-CMT (434544)                        *         
      * BH-ACAT-REJ-PEND-FULL-REC-MSD (434545)                        *         
      * BH-ACAT-REJ-PEND-FULL-REC-LP  (434546)                        *         
      * BH-ACAT-REJ-PEND-FULL-REC-OPT (434547)                        *         
DJ0024* BH-ACAT-REJ-ARS-SEL-ACT       (434548) AUCTION RATE SECURITY  *         
      *                                                               *         
      *****************************************************************         
      * 07/20/98 DJ    NEW PROGRAM                                    *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-STAT.                 
                                                                                
DJ0007     SELECT BNWREGOP         ASSIGN       TO BNWREGOP                     
DJ0007                             ACCESS          DYNAMIC                      
DJ0007                             ORGANIZATION    INDEXED                      
DJ0007                             RECORD KEY   IS REG-OPT-KEY-AREA             
DJ0007                             FILE STATUS  IS BNWREGOP-STAT.               
                                                                                
DJ0007     SELECT MFOPBR           ASSIGN       TO MFOPBR                       
DJ0007                             ACCESS          DYNAMIC                      
DJ0007                             ORGANIZATION    INDEXED                      
DJ0007                             RECORD KEY   IS MFOPBR-KEY                   
DJ0007                             FILE STATUS  IS MFOPBR-STAT.                 
                                                                                
DJ0023     SELECT PRNGFL           ASSIGN       TO PRNGFL                       
DJ0023                             ACCESS          DYNAMIC                      
DJ0023                             ORGANIZATION    INDEXED                      
DJ0023                             RECORD KEY   IS PRNGKEY                      
DJ0023                             FILE STATUS  IS PRNGFL-STAT.                 
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
DJ0007*** MFRS TABLE MAINTENANCE FILE                                           
DJ0007 FD  BNWREGOP.                                                            
DJ0007 01  BNWREGOP-RECORD.                                                     
DJ0007     COPY BNWREGOP.                                                       
      /                                                                         
DJ0007*** MFRS OPEN BRANCH FILE                                                 
DJ0007 FD  MFOPBR.                                                              
DJ0007     COPY MFOPBR  REPLACING ==:MFOPBR:== BY ==MFOPBR==.                   
      /                                                                         
DJ0023*** PRIVATE RANGE FILE                                                    
DJ0023 FD  PRNGFL.                                                              
DJ0023     COPY PRNGRECC.                                                       
                                                                                
       WORKING-STORAGE SECTION.                                                 
           COPY PDXIDCOB.                                                       
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT515'.            
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.                 
           05  W-NOT-FIRST-TIME-SW       PIC  X(001) VALUE 'N'.                 
               88 NOT-FIRST-TIME                     VALUE 'Y'.                 
           05  END-OF-INPUT-SW           PIC  X(001) VALUE '0'.                 
               88 END-OF-INPUT                       VALUE '1'.                 
           05  INFILE-STAT               PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING VALUE '35'.                              
           05  INFILE-DATE-SW            PIC  X(001) VALUE ' '.                 
               88 INFILE-DATE-FOUND                  VALUE 'Y'.                 
DJ0007     05  BNWREGOP-STAT             PIC X(002).                            
DJ0007         88 VALID-BNWREGOP-STAT    VALUE '00' '04' '10' '23'.             
DJ0007         88 BNWREGOP-OKAY          VALUE '00' THRU '09', '97'.            
DJ0007         88 BNWREGOP-END-OF-FILE   VALUE '10'.                            
DJ0007         88 BNWREGOP-NOT-FOUND     VALUE '23'.                            
DJ0007         88 BNWREGOP-EMPTY-MISSING VALUE '35'.                            
DJ0007     05  MFOPBR-STAT               PIC X(002).                            
DJ0007         88 VALID-MFOPBR-STAT      VALUE '00' '04' '10' '23'.             
DJ0007         88 MFOPBR-OKAY            VALUE '00' THRU '09', '97'.            
DJ0007         88 MFOPBR-END-OF-FILE     VALUE '10'.                            
DJ0007         88 MFOPBR-NOT-FOUND       VALUE '23'.                            
DJ0007         88 MFOPBR-EMPTY-MISSING   VALUE '35'.                            
DJ0023     05  PRNGFL-STAT               PIC X(002).                            
DJ0023         88 VALID-PRNGFL-STAT      VALUE '00' '04' '10' '23'.             
DJ0023         88 PRNGFL-OKAY            VALUE '00' THRU '09', '97'.            
DJ0023         88 PRNGFL-END-OF-FILE     VALUE '10'.                            
DJ0023         88 PRNGFL-NOT-FOUND       VALUE '23'.                            
DJ0023         88 PRNGFL-EMPTY-MISSING   VALUE '35'.                            
DJ0023     05  W-PRNGFL-SW               PIC  X(001) VALUE ' '.                 
DJ0023         88 W-PRNGFL-FOUND                     VALUE 'Y'.                 
           05  ABEND-CD                  PIC  9(009) COMP SYNC VALUE 0.         
           05  DUMP-SW                   PIC  X(001) VALUE 'D'.                 
           05  W-SYS-DATE                PIC  9(006) VALUE 0.                   
           05  FILLER  REDEFINES                                                
               W-SYS-DATE.                                                      
               10  W-UPD-DATE            PIC  X(006).                           
           05  W-SYS-TIME                PIC  9(008) VALUE 0.                   
           05  FILLER  REDEFINES                                                
               W-SYS-TIME.                                                      
               10  W-UPD-TIME            PIC  X(006).                           
               10  W-UPD-TIME-MS         PIC  X(002).                           
           05  LD-PROC-DATE.                                                    
               10 LD-PROC-DATE-MM        PIC  X(002).                           
               10 LD-PROC-DATE-DD        PIC  X(002).                           
               10 LD-PROC-DATE-YY        PIC  X(002).                           
DJ0019     05  W-CYCLE-NBR               PIC  X(002) VALUE '00'.                
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.                 
               88 HDR-FOUND                          VALUE 'H'.                 
               88 TRL-FOUND                          VALUE 'T'.                 
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.                 
               88 BRK-FOUND                          VALUE 'Y'.                 
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.          
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.          
           05  W-REC-LEN-OUT             PIC  9(005) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.          
           05  W-INFILE-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER REDEFINES W-INFILE-CNT.                                   
               10  W-INFILE-CNT1         PIC  X(003).                           
               10  W-INFILE-CNT0         PIC  9(003) COMP-3.                    
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.          
           05  W-DETAIL-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'LOAD-CNT'.          
           05  W-LOAD-CNT                PIC  9(009) COMP-3 VALUE 0.            
           05  W-AT-CNT                  PIC  9(009) COMP-3 VALUE 0.            
           05  W-ATR-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-ATO-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-ATF-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-SQL-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-VASSET-ADD-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-VASSET-NOT-ADD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-VASSET-UPD-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-VASSET-NOT-UPD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-VASSET-DEL-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-VASSET-NOT-DEL-CNT      PIC  9(009) COMP-3 VALUE 0.            
LRM042     05  W-VASTHSTY-UPD-CNT        PIC  9(009) COMP-3 VALUE 0.            
LRM042     05  W-VASTHSTY-NOT-UPD-CNT    PIC  9(009) COMP-3 VALUE 0.            
LRM041     05  W-VFNDRGST-DEL-CNT        PIC  9(009) COMP-3 VALUE 0.            
LRM041     05  W-VFNDRGST-NOT-DEL-CNT    PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-DEL-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-NOT-DEL-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-ADD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-NOT-ADD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-NOT-UPD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-VOPTN-ADD-CNT           PIC  9(009) COMP-3 VALUE 0.            
           05  W-VOPTN-NOT-ADD-CNT       PIC  9(009) COMP-3 VALUE 0.            
           05  W-VOPTN-UPD-CNT           PIC  9(009) COMP-3 VALUE 0.            
           05  W-VOPTN-NOT-UPD-CNT       PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-DEL-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-NOT-DEL-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-ADD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-NOT-ADD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIOPN-NOT-UPD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-VMF-ADD-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-VMF-NOT-ADD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-VMF-UPD-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-VMF-NOT-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-DEL-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-NOT-DEL-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-ADD-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-NOT-ADD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-UPD-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIMF-NOT-UPD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-UPD-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-NOT-UPD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-DEL-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-DEL-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-ADD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-ADD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-UPD-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTITRF-NOT-UPD-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-MSD-FND-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-MSD-NOTFND-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-MSD-NOTFND-SW           PIC  X(001) VALUE ' '.                 
               88 W-MSD-NOTFND                       VALUE 'Y'.                 
DJ0024         88 W-MSD-FOUND                        VALUE 'N'.                 
           05  W-BLANK-SEC-CNT           PIC  9(009) COMP-3 VALUE 0.            
DJ0020     05  W-SUB-ISIN-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
LRM040     05  W-NON-US-ISIN-CNT         PIC  9(009) COMP-3 VALUE 0.            
LRM040     05  W-ISIN-12BYTE-FND-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-BOND-FND-CNT            PIC  9(009) COMP-3 VALUE 0.            
           05  W-BOND-NOTFND-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTSEC-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTSEC-NOTFND-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIAST-NOTFND-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACCELERATE-ADD-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACCELERATE-NOT-ADD-CNT  PIC  9(009) COMP-3 VALUE 0.            
           05  W-PTD-APPROVED-CNT        PIC  9(009) COMP-3 VALUE 0.            
           05  W-PTD-NOT-APPROVED-CNT    PIC  9(009) COMP-3 VALUE 0.            
DJ0007     05  W-BNWREGOP-CNT            PIC  9(009) COMP-3 VALUE 0.            
DJ0007     05  W-BNWREGOP-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
DJ0007     05  W-BNWREGOP-FND-SW         PIC  X(001) VALUE ' '.                 
DJ0007         88 W-BNWREGOP-FOUND                   VALUE 'Y'.                 
DJ0007     05  W-MFOPBR-CNT              PIC  9(009) COMP-3 VALUE 0.            
DJ0007     05  W-MFOPBR-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
DJ0007     05  W-MFOPBR-FND-SW           PIC  X(001) VALUE ' '.                 
DJ0007         88 W-MFOPBR-FND                       VALUE 'Y'.                 
DJ0007     05  W-MF-AUTO-DELETE-CNT      PIC  9(009) COMP-3 VALUE 0.            
DJ0007     05  W-MF-AUTO-REJECT-CNT      PIC  9(009) COMP-3 VALUE 0.            
DJ0007     05  W-MF-AUTO-DELETE-IND      PIC  X(001) VALUE ' '.                 
DJ0007         88 W-MF-AUTO-ALLOW                    VALUE 'A'.                 
DJ0007         88 W-MF-AUTO-DELETE                   VALUE 'D'.                 
DJ0021     05  W-MF-AUTO-DEL-CREATED-IND PIC X(001) VALUE ' '.                  
DJ0021         88 W-MF-AUTO-DEL-CREATED              VALUE 'Y'.                 
           05  W-REJECT-SWITCHES.                                               
               07  W-REJ-MARGIN-DEBIT    PIC  X(001) VALUE ' '.                 
               07  W-REJ-ASSET-VALUE     PIC  X(001) VALUE ' '.                 
               07  W-REJ-TOTL-ACT-VAL    PIC  X(001) VALUE ' '.                 
               07  W-REJ-DB1             PIC  X(001) VALUE ' '.                 
               07  W-REJ-SP              PIC  X(001) VALUE ' '.                 
               07  W-REJ-NTS             PIC  X(001) VALUE ' '.                 
               07  W-REJ-CMT             PIC  X(001) VALUE ' '.                 
               07  W-REJ-MSD             PIC  X(001) VALUE ' '.                 
               07  W-REJ-LP              PIC  X(001) VALUE ' '.                 
               07  W-REJ-OPT             PIC  X(001) VALUE ' '.                 
DJ0007         07  W-REJ-MF-AUTO-DELETE  PIC  X(001) VALUE ' '.                 
DJ0014         07  W-REJ-ACCT-FRZN       PIC  X(001) VALUE ' '.                 
DJ0016         07  W-REJ-90DR            PIC  X(001) VALUE ' '.                 
DJ0016         07  W-REJ-REGT            PIC  X(001) VALUE ' '.                 
DJ0024         07  W-REJ-ARS             PIC  X(001) VALUE ' '.                 
LRM031         07  W-REJ-PENNY           PIC  X(001) VALUE ' '.                 
           05  W-REJECT-AUTO-SW          PIC  X(001) VALUE ' '.                 
DJ0024     05  W-REJ-ARS-CNT             PIC  9(009) COMP-3 VALUE 0.            
DJ0024     05  W-SET-ARS-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM031     05  W-REJ-PENNY-CNT           PIC  9(009) COMP-3 VALUE 0.            
LRM031     05  W-SET-PENNY-CNT           PIC  9(009) COMP-3 VALUE 0.            
DJ0002     05  W-FETCH-CNT               PIC  9(009) COMP-3 VALUE 0.            
           05  W-TRANSFER-FND-SW         PIC  X(001) VALUE ' '.                 
               88 W-TRANSFER-FOUND                   VALUE 'Y'.                 
           05  W-VRSTSEC-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-VRSTSEC-FOUND                    VALUE 'Y'.                 
           05  W-ACTIAST-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-ACTIAST-FOUND                    VALUE 'Y'.                 
           05  W-ACTIOPN-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-ACTIOPN-FOUND                    VALUE 'Y'.                 
DJ0006     05  W-VASTHSTY-FND-SW         PIC  X(001) VALUE ' '.                 
DJ0006         88 W-VASTHSTY-FOUND                   VALUE 'Y'.                 
DJ0023     05  W-ACTIAST-ADP-SW          PIC  X(001) VALUE ' '.                 
DJ0023         88 W-ACTIAST-ADP-FOUND                VALUE 'Y'.                 
DJ0024         88 W-ACTIAST-ADP-NOT-FOUND            VALUE 'N'.                 
           05  W-EDIT-RECEIVE-SW         PIC  X(001) VALUE ' '.                 
           05  W-DSTBN-SIDE-CD           PIC  X(001) VALUE ' '.                 
DJ0018     05  W-CLIENT-X                PIC  X(003).                           
DJ0018     05  W-CLIENT-NUM REDEFINES                                           
DJ0018         W-CLIENT-X                PIC  9(003).                           
CSG001*                                                                         
CSG001     05  W-EDIT-ASSET-DESC-TXT-AREA.                                      
CSG001         10 W-SUB1                       PIC S9(03) COMP-3.               
CSG001         10 W-ASSET-DESC-TXT.                                             
CSG001            15 W-ASSET-DESC1-TXT         PIC X(30) VALUE SPACES.          
CSG001            15 W-ASSET-DESC2-TXT         PIC X(30) VALUE SPACES.          
CSG001            15 W-ASSET-DESC3-TXT         PIC X(30) VALUE SPACES.          
CSG001            15 W-ASSET-DESC4-TXT         PIC X(30) VALUE SPACES.          
CSG001            15 W-ASSET-DESC5-TXT         PIC X(20) VALUE SPACES.          
CSG001         10 W-ASSET-DESC-TMP             PIC X(30) VALUE SPACES.          
CSG001         10 W-JUST-LEFT-FLAG             PIC X(01).                       
CSG001            88 W-JUST-LEFT-DONE          VALUE 'Y'.                       
CSG001            88 W-JUST-LEFT-NOT-DONE      VALUE 'N'.                       
CSG001         10 W-EDIT-ASSET-DESC-TXT-FLAG   PIC X(01).                       
CSG001            88 W-EDIT-ASSET-DESC-TXT-Y   VALUE 'Y'.                       
CSG001            88 W-EDIT-ASSET-DESC-TXT-N   VALUE 'N'.                       
                                                                                
DJ0007 01  W-MF-AUTO-REJECT-COMMENT.                                            
DJ0007     05 W-MF-AUTO-REJECT-LIT       PIC X(30) VALUE                        
DJ0007       'NO FUND AGREEMENT ON FILE FOR '.                                  
DJ0007     05 W-MF-AUTO-REJECT-CUSIP-1   PIC  X(09) VALUE ' '.                  
DJ0007     05 FILLER                     PIC  X(01) VALUE ' '.                  
DJ0007     05 W-MF-AUTO-REJECT-CUSIP-2   PIC  X(09) VALUE ' '.                  
DJ0007     05 FILLER                     PIC  X(01) VALUE ' '.                  
DJ0007     05 W-MF-AUTO-REJECT-CUSIP-3   PIC  X(09) VALUE ' '.                  
DJ0007     05 FILLER                     PIC  X(01) VALUE ' '.                  
DJ0007     05 W-MF-AUTO-REJECT-CUSIP-4   PIC  X(09) VALUE ' '.                  
DJ0007     05 FILLER                     PIC  X(01) VALUE ' '.                  
DJ0007     05 W-MF-AUTO-REJECT-CUSIP-5   PIC  X(09) VALUE ' '.                  
DJ0007     05 FILLER                     PIC  X(01) VALUE ' '.                  
DJ0007     05 W-MF-AUTO-REJECT-CUSIP-6   PIC  X(09) VALUE ' '.                  
DJ0007     05 FILLER                     PIC  X(01) VALUE ' '.                  
DJ0007     05 W-MF-AUTO-REJECT-CUSIP-7   PIC  X(09) VALUE ' '.                  
DJ0007     05 FILLER                     PIC  X(01) VALUE ' '.                  
DJ0007     05 W-MF-AUTO-REJECT-CUSIP-8   PIC  X(09) VALUE ' '.                  
DJ0007     05 FILLER                     PIC  X(01) VALUE ' '.                  
DJ0007     05 W-MF-AUTO-REJECT-CUSIP-9   PIC  X(09) VALUE ' '.                  
DJ0007 01  W-MF-AUTO-DELETE-COMMENT.                                            
DJ0007     05 FILLER PIC X(25) VALUE 'NO FUND AGREEMENT ON FILE'.               
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
           05  WS-DATE-CCYYMMDD          PIC X(08).                             
           05  FILLER REDEFINES WS-DATE-CCYYMMDD.                               
               07  WS-DATE-CC            PIC X(2).                              
               07  WS-DATE-YY            PIC X(2).                              
               07  WS-DATE-MM            PIC X(2).                              
               07  WS-DATE-DD            PIC X(2).                              
           05  W-ASSET-SEQ-NBR           PIC S9(004) COMP.                      
           05  W-AT-ASSET-SEQ-NBR        PIC S9(004) COMP.                      
           05  W-COMMA-PTR               PIC  9(003) COMP-3 VALUE 0.            
           05  W-QTY-PTR                 PIC  9(003) COMP-3 VALUE 0.            
           05  W-INT-PTR                 PIC  9(003) COMP-3 VALUE 0.            
           05  W-DEC-PTR                 PIC  9(003) COMP-3 VALUE 0.            
           05  W-COMMA-FND-SW            PIC  X(001) VALUE ' '.                 
           05  W-ASSET-QTY               USAGE COMP-2.                          
           05  W-ASSET-AMT               USAGE COMP-2.                          
           05  W-ASSET-QTY-X             PIC ZZZZZZ9.9999.                      
           05  W-ASSET-AMT-X             PIC ZZZZZZZZ9.99.                      
           05  W-TOT-QTY-N               PIC S9(13)V9(4) VALUE 0.               
LRM027     05  W-TOT-AMT-TYPES1-2        PIC S9(13)V9(4) VALUE 0.               
LRM027     05  W-ACAT-REJ-PEND-REC-DB1-IND PIC X         VALUE '0'.             
           05  W-TOT-AMT-N               PIC S9(13)V9(4) VALUE 0.               
           05  W-TOT-AMT-X               PIC ZZZZZZZZ9.99-.                     
                                                                                
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
                                                                                
           05  WK-POS-DESC5.                                                    
               10  FILLER              PIC X(08) VALUE 'ADP-SEC:'.              
               10  WK-POS-DESC5-SEC    PIC X(07) VALUE ' '.                     
               10  WK-POS-DESC5-FIL    PIC X(05) VALUE ' '.                     
LRM031     05  WK-MS-CLOSING-PRICE     PIC 9(8)V9(7) COMP-3 VALUE ZERO.         
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
LRM029     05  W-OPT-DESC-NEW REDEFINES W-OPT-DESC.                             
LRM029         07  FILLER                PIC X(22).                             
LRM029         07  W-OPT-UNDLY-SYMBOL    PIC X(06).                             
LRM029         07  FILLER                PIC X(02).                             
LRM029         07  W-OPT-EXPTN-MM-NEW    PIC X(02).                             
LRM029         07  W-OPT-EXPTN-S1-NEW    PIC X(01).                             
LRM029         07  W-OPT-EXPTN-DD-NEW    PIC X(02).                             
LRM029         07  W-OPT-EXPTN-S2-NEW    PIC X(01).                             
LRM029         07  W-OPT-EXPTN-YY-NEW    PIC X(02).                             
LRM029         07  FILLER                PIC X(01).                             
LRM029         07  W-OPT-STRIKE-PRIC-NEW PIC ZZZZ9.                             
LRM029         07  FILLER                PIC X(01).                             
LRM029         07  W-OPT-STRIKE-FRAC-NEW PIC X(03).                             
LRM029         07  FILLER                PIC X(12).                             
                                                                                
           05  W-COMP-EXPTN-DT           PIC X(10) VALUE ' '.                   
           05  W-NEXT-EXPTN-DT           PIC X(10) VALUE ' '.                   
           05  W-NEXT-EXPTN-DT-X.                                               
               07  W-NEXT-EXPTN-YEAR     PIC 9(4).                              
               07  FILLER                PIC X(1).                              
               07  W-NEXT-EXPTN-MM       PIC 9(2).                              
               07  FILLER                PIC X(3).                              
           05  W-COMP-STPRC-INTEGER-AMT  PIC S9(4) USAGE COMP.                  
           05  W-COMP-STPRC-FRCTN-AMT    PIC S9(4) USAGE COMP.                  
                                                                                
      **** SAVE FIELDS FOR DELETING AND ACCELERATING                            
       01  W-SAVE-FIELDS.                                                       
           05 W-SAVE-DIST-PARTICIPANT    PIC  X(004) VALUE ' '.                 
           05 W-SAVE-SUB-PART-NBR        PIC  X(004) VALUE ' '.                 
           05 W-SAVE-CLIENT-NBR          PIC  X(004) VALUE ' '.                 
           05 W-SAVE-ACAT-CTL-NBR        PIC  X(014) VALUE ' '.                 
           05 W-SAVE-DLVR-NBR            PIC  X(004) VALUE ' '.                 
           05 W-SAVE-ACCT-DLVR-NBR       PIC  X(020) VALUE ' '.                 
           05 W-SAVE-RCV-NBR             PIC  X(004) VALUE ' '.                 
           05 W-SAVE-ACCT-RCV-NBR        PIC  X(020) VALUE ' '.                 
           05 W-SAVE-TFR-TYPE            PIC  X(003) VALUE ' '.                 
           05 W-SAVE-EDIT-RECEIVE-SW     PIC  X(001) VALUE ' '.                 
           05 W-SAVE-EXCEPTION-SW        PIC  X(001) VALUE ' '.                 
           05 W-SAVE-ACCELERATE-B1       PIC  X(001) VALUE ' '.                 
           05 W-SAVE-PARTIAL-TFR-B1      PIC  X(001) VALUE ' '.                 
DJ0004     05 W-SAVE-STATUS              PIC  X(003) VALUE ' '.                 
DJ0006     05 W-SAVE-CNTL-ASTD-NBR       PIC  X(014) VALUE ' '.                 
DJ0012     05 W-SAVE-TRAN-REF-ID         PIC  X(020) VALUE ' '.                 
DJ0019     05 W-SAVE-PROC-DATE.                                                 
DJ0019        07  W-SAVE-PROC-YEAR.                                             
DJ0019            09  W-SAVE-PROC-CC    PIC X(2) VALUE ' '.                     
DJ0019            09  W-SAVE-PROC-YY    PIC X(2) VALUE ' '.                     
DJ0019        07  FILLER                PIC X(1) VALUE '-'.                     
DJ0019        07  W-SAVE-PROC-MM        PIC X(2) VALUE ' '.                     
DJ0019        07  FILLER                PIC X(1) VALUE '-'.                     
DJ0019        07  W-SAVE-PROC-DD        PIC X(2) VALUE ' '.                     
                                                                                
       01  W-ACTITRF-SELECT-FIELDS.                                             
           05 W-ACAT-CONTROL-NO          PIC  X(014).                           
           05 W-NSCC-PEND-CD             PIC  X(001).                           
           05 W-PRCS-DT                  PIC  X(010).                           
           05 W-PRGM-NM                  PIC  X(008).                           
           05 W-UPDT-TMSTP               PIC  X(026).                           
           05 W-TRNFR-TYPE-RJCT-CD       PIC  X(001).                           
DJ0007     05 W-TRNFR-CMNT-TXT           PIC  X(120).                           
                                                                                
DJ0013 01  W-VASTHSTY-FIELDS.                                                   
DJ0013     05 W-FAIL-OPEN-CAGE-IND       PIC  X(001) VALUE ' '.                 
      /                                                                         
      ******************************************************************        
      * NSCC EXTRACT FILE                                              *        
      ******************************************************************        
       01  FILLER PIC X(016) VALUE 'CURRENT-RECORD='.                           
       01  FILLER                        PIC X(008) VALUE 'W-NSCC'.             
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:==  BY ==W-NSCC==.               
      /                                                                         
      ******************************************************************        
      * GETMSD COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.            
           COPY GETMSDCE.                                                       
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'GETXRFC '.            
           COPY GETXRFC.                                                        
      /                                                                         
LRM037     COPY MSISINC.                                                        
      /                                                                         
LRM030 01  FILLER                        PIC X(08) VALUE 'RECMDIN2'.            
LRM030     COPY RECMDIN2.                                                       
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'RECMDIDX'.            
           COPY RECMDIDX.                                                       
      /                                                                         
      ******************************************************************        
      * OPTION SYMBOL LOOK UP                                          *        
      ******************************************************************        
       01  FMT-OPT-AREA.                                                        
           03  FMT-OPT-AREA.                                                    
               05  FMT-OPT-SYMBOL         PIC X(6).                             
               05  FMT-OPT-ACT-TYPE       PIC X.                                
               05  FMT-OPT-PUT-CALL       PIC X.                                
                   88  FMT-PUT            VALUE 'P'.                            
                   88  FMT-CALL           VALUE 'C'.                            
               05  FMT-BUY-SELL-IND       PIC X.                                
                   88  FMT-BUY            VALUE 'B'.                            
                   88  FMT-SELL           VALUE 'S'.                            
               05  FMT-OPEN-CLOSE         PIC X.                                
                   88  FMT-OPEN           VALUE 'O'.                            
                   88  FMT-CLOSE          VALUE 'C'.                            
               05  FMT-OPT-EXP-DATE.                                            
                   10 FMT-OPT-EXP-CC      PIC X(2).                             
                   10 FMT-OPT-EXP-YY      PIC X(2).                             
                   10 FMT-OPT-EXP-MM      PIC X(2).                             
                   10 FMT-OPT-EXP-DD      PIC X(2).                             
               05  FMT-OPT-PRICE.                                               
                   10 FMT-OPT-PRICE-POS1  PIC X(1).                             
                   10 FMT-OPT-PRICE-POS2-3.                                     
                      15 FMT-OPT-PRICE-POS2 PIC X(1).                           
                      15 FMT-OPT-PRICE-POS3 PIC X(1).                           
               05  FMT-OPT-1-8TH-PRCE     PIC X.                                
               05  FMT-ADP-SEC-NO         PIC X(7).                             
               05  FMT-CUSIP-NO           PIC X(9).                             
               05  FMT-SEC-SYMBOL         PIC X(8).                             
               05  FMT-DESC1              PIC X(30).                            
               05  FMT-DESC2              PIC X(30).                            
               05  FMT-DESC3              PIC X(30).                            
                                                                                
       01  SEARCH-SYMBOL-FLAG               PIC X(01).                          
           88  ENTER-SYMBOL-SEARCH          VALUE 'E'.                          
           88  EXIT-SYMBOL-SEARCH           VALUE 'X'.                          
                                                                                
       01  SYMBOL-SW                        PIC X.                              
           88  SYMBOL-IS-FOUND              VALUE 'Y'.                          
           88  SYMBOL-NOT-FOUND             VALUE 'N'.                          
                                                                                
       01  WS-ADP-SYMBOL.                                                       
           05 WS-ADP-SYMBOL-CHAR OCCURS 13 TIMES PIC X.                         
                                                                                
       01  WS-FMT-SYMBOL.                                                       
           05 WS-FMT-SYMBOL-CHAR OCCURS 6 TIMES PIC X.                          
                                                                                
       01  SUBS.                                                                
           05  ADP-SYMBOL-SUB               PIC 9(3) COMP-3 VALUE 0.            
           05  FMT-SYMBOL-SUB               PIC 9(3) COMP-3 VALUE 0.            
                                                                                
      *** OPTION EXPIRATION MONTH TABLE USED TO DETERMINE OPTION SYMBOL         
      *** OPTION EXPIRATION MONTH TABLE MONTH/CALL-CODE/PUT-CODE                
       01  EXP-MONTH-TABLE.                                                     
           05  FILLER                       PIC X(4) VALUE '01AM'.              
           05  FILLER                       PIC X(4) VALUE '02BN'.              
           05  FILLER                       PIC X(4) VALUE '03CO'.              
           05  FILLER                       PIC X(4) VALUE '04DP'.              
           05  FILLER                       PIC X(4) VALUE '05EQ'.              
           05  FILLER                       PIC X(4) VALUE '06FR'.              
           05  FILLER                       PIC X(4) VALUE '07GS'.              
           05  FILLER                       PIC X(4) VALUE '08HT'.              
           05  FILLER                       PIC X(4) VALUE '09IU'.              
           05  FILLER                       PIC X(4) VALUE '10JV'.              
           05  FILLER                       PIC X(4) VALUE '11KW'.              
           05  FILLER                       PIC X(4) VALUE '12LX'.              
                                                                                
       01  FILLER REDEFINES EXP-MONTH-TABLE.                                    
           05  EXP-MONTH-ENTRY OCCURS 12 TIMES                                  
                               ASCENDING KEY IS EXP-MONTH                       
                               INDEXED BY EXP-MONTH-IND.                        
               10  EXP-MONTH                PIC X(2).                           
               10  EXP-MONTH-CALL           PIC X(1).                           
               10  EXP-MONTH-PUT            PIC X(1).                           
                                                                                
      *** OPTION STRIKE PRICE TABLE USED TO DETERMINE OPTION SYMBOL             
      *** OPTION STRIKE PRICE TABLE PRICE-CODE/$PRICE                           
       01  STR-PRICE-TABLE.                                                     
           05  FILLER                       PIC X(3) VALUE 'T00'.               
           05  FILLER                       PIC X(3) VALUE 'A05'.               
           05  FILLER                       PIC X(3) VALUE 'U07'.               
           05  FILLER                       PIC X(3) VALUE 'B10'.               
           05  FILLER                       PIC X(3) VALUE 'V12'.               
           05  FILLER                       PIC X(3) VALUE 'C15'.               
           05  FILLER                       PIC X(3) VALUE 'W17'.               
           05  FILLER                       PIC X(3) VALUE 'D20'.               
           05  FILLER                       PIC X(3) VALUE 'X22'.               
           05  FILLER                       PIC X(3) VALUE 'E25'.               
           05  FILLER                       PIC X(3) VALUE 'F30'.               
           05  FILLER                       PIC X(3) VALUE 'G35'.               
           05  FILLER                       PIC X(3) VALUE 'H40'.               
           05  FILLER                       PIC X(3) VALUE 'I45'.               
           05  FILLER                       PIC X(3) VALUE 'J50'.               
           05  FILLER                       PIC X(3) VALUE 'K55'.               
           05  FILLER                       PIC X(3) VALUE 'L60'.               
           05  FILLER                       PIC X(3) VALUE 'M65'.               
           05  FILLER                       PIC X(3) VALUE 'N70'.               
           05  FILLER                       PIC X(3) VALUE 'O75'.               
           05  FILLER                       PIC X(3) VALUE 'P80'.               
           05  FILLER                       PIC X(3) VALUE 'Q85'.               
           05  FILLER                       PIC X(3) VALUE 'R90'.               
           05  FILLER                       PIC X(3) VALUE 'S95'.               
                                                                                
       01  FILLER REDEFINES STR-PRICE-TABLE.                                    
           05  STR-PRICE-ENTRY OCCURS 24 TIMES                                  
                               ASCENDING KEY IS STR-PRICE                       
                               INDEXED BY STR-PRICE-IND.                        
               10  STR-PRICE-A              PIC X(1).                           
               10  STR-PRICE                PIC X(2).                           
                                                                                
       01  W-OPTION-LOOKUP-FIELDS.                                              
DJTEST     05  WS-DISPLAY-EXP-DATE       PIC 9(9).                              
DJTEST     05  WS-DISPLAY-STR-PRICE      PIC ZZ9.9999.                          
           05  ED-OPT-PRC-OUT            PIC 9(4)V9(7).                         
           05  FILLER REDEFINES ED-OPT-PRC-OUT.                                 
               10  ED-OPT-PRC-WHOLE      PIC 9(4).                              
               10  ED-OPT-PRC-FRAC       PIC V9(7).                             
           05  WS-STRIKE-PRICE11         PIC 9(4)V9(7).                         
           05  WS-STRIKE-PRICE12 REDEFINES WS-STRIKE-PRICE11.                   
               10  FILLER                PIC X(1).                              
               10  WS-STRIKE-PRC10       PIC 9(3)V9(7).                         
           05  WS-STR-PRC REDEFINES WS-STRIKE-PRICE12.                          
               10  WS-STR-DOL123         PIC 9(3).                              
               10  WS-STR-DOL4           PIC 9(1).                              
               10  WS-STR-CENT           PIC 9(7).                              
           05  WS-STR-PRC7               PIC 9(3)V9(4).                         
                                                                                
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
                                                                                
       01  W-BOND-AREA.                                                         
           03  W-GETXRF-KEY-9             PIC X(9).                             
                                                                                
LRM039    COPY CURLOOK.                                                         
CSG001/                                                                         
CSG001******************************************************************        
CSG001* ACATS VALID CHARACTER SET FROM "ACATS USER GUIDE (SECTION 19)" *        
CSG001******************************************************************        
CSG001 01  FILLER                        PIC X(08) VALUE 'CATVCHAR'.            
CSG001     COPY CATVCHAR.                                                       
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
DJ0007******************************************************************        
DJ0007* B1 MF   SECTION                                                *        
DJ0007******************************************************************        
DJ0007 01  FILLER                        PIC X(08) VALUE 'BHMF    '.            
DJ0007     COPY BHMF.                                                           
      /                                                                         
DJ0007******************************************************************        
DJ0007* B1 MF3  SECTION                                                *        
DJ0007******************************************************************        
DJ0007 01  FILLER                        PIC X(08) VALUE 'BHMF3   '.            
DJ0007     COPY BHMF3.                                                          
      /                                                                         
DJ0015 01  FILLER                        PIC X(08) VALUE 'BHREQ   '.            
DJ0015     COPY BHREQ.                                                          
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
      * ASSET    ACTIVE TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VASSET'.             
           EXEC SQL INCLUDE VASSET       END-EXEC.                              
                                                                                
      ******************************************************************        
      * OPTIONS  INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIOPN'.            
           EXEC SQL INCLUDE ACTIOPN      END-EXEC.                              
                                                                                
      ******************************************************************        
      * OPTIONS  ACTIVE TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VOPTN'.              
           EXEC SQL INCLUDE VOPTN        END-EXEC.                              
                                                                                
      ******************************************************************        
      * MUTUAL FUNDS INIT   TABLE                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTIMF'.             
           EXEC SQL INCLUDE ACTIMF       END-EXEC.                              
                                                                                
      ******************************************************************        
      * MUTUAL FUNDS ACTIVE TABLE                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VMF'.                
           EXEC SQL INCLUDE VMF          END-EXEC.                              
                                                                                
LRM041******************************************************************        
LRM041* MUTUAL FUNDS REGISTRATION TABLE                                *        
LRM041******************************************************************        
LRM041 01  FILLER                        PIC X(008) VALUE 'VFNDRGST'.           
LRM041     EXEC SQL INCLUDE VFNDRGST     END-EXEC.                              
                                                                                
      ******************************************************************        
      * TRANSFER ACTIVE TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VTRNFR'.             
           EXEC SQL INCLUDE VTRNFR       END-EXEC.                              
                                                                                
      ******************************************************************        
      * TRANSFER INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTITRF'.            
           EXEC SQL INCLUDE ACTITRF      END-EXEC.                              
                                                                                
      ******************************************************************        
      * RESTRICTED SECURITY TABLE                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VRSTSEC '.           
           EXEC SQL INCLUDE VRSTSEC      END-EXEC.                              
                                                                                
DJ0006******************************************************************        
DJ0006* ASSET   HISTORY TABLE                                          *        
DJ0006******************************************************************        
DJ0006 01  FILLER                        PIC X(008) VALUE 'VASTHSTY'.           
DJ0006     EXEC SQL INCLUDE VASTHSTY     END-EXEC.                              
      /                                                                         
DJ0002******************************************************************        
DJ0002* DECLARE CURSOR FOR INITIAL ASSET   TABLE                       *        
DJ0002* TO DELETE INIT ASSETS FOR A GIVEN CONTROL NUMBER ONE AT A TIME *        
DJ0002******************************************************************        
DJ0002 01  FILLER                PIC X(016) VALUE 'ACTIASTCURSOR'.              
DJ0002     EXEC SQL                                                             
DJ0002          DECLARE ACTIAST_CURSOR CURSOR WITH HOLD FOR                     
DJ0002          SELECT                                                          
DJ0002              CLIENT_NBR                                                  
DJ0002             ,DLVR_NBR                                                    
DJ0002             ,ACCT_DLVR_NBR                                               
DJ0002             ,RCV_NBR                                                     
DJ0002             ,ACCT_RCV_NBR                                                
DJ0002             ,ISIN_CNTRY_CD                                               
DJ0002             ,ISIN_SEC_ISSUE_CD                                           
DJ0002             ,ISIN_SEC_CDG_CD                                             
DJ0002             ,STTLM_LCTN_CD                                               
DJ0002             ,STTLM_RSN_CD                                                
DJ0002             ,CSH_MGN_SHRT_CD                                             
DJ0002             ,SBMTG_PRTCP_NBR                                             
DJ0002             ,ACAT_CONTROL_NBR                                            
DJ0002             ,ASSET_SEQ_NBR                                               
DJ0002             ,TRANS_TYPE_CD                                               
DJ0002             ,ASSET_PRC_CTGY_CD                                           
DJ0002             ,ASSET_DESC_TXT                                              
DJ0002             ,ASSET_QTY                                                   
DJ0002             ,ASSET_AMT                                                   
DJ0002          FROM    ACTIAST                                                 
DJ0002                                                                          
DJ0002         WHERE CLIENT_NBR       = :W-SAVE-CLIENT-NBR                      
DJ0002           AND ACAT_CONTROL_NBR = :W-SAVE-ACAT-CTL-NBR                    
DJ0002     END-EXEC.                                                            
      /                                                                         
DJ0002******************************************************************        
DJ0002* DECLARE CURSOR FOR INITIAL ASSET   TABLE                       *        
DJ0002* TO DELETE INIT ASSETS FOR A GIVEN KEY FIELDS     ONE AT A TIME *        
DJ0002******************************************************************        
DJ0002 01  FILLER                PIC X(016) VALUE 'ACTIASTCURSOR'.              
DJ0002     EXEC SQL                                                             
DJ0002          DECLARE ACTIAST_CURSOR2 CURSOR WITH HOLD FOR                    
DJ0002          SELECT                                                          
DJ0002              CLIENT_NBR                                                  
DJ0002             ,DLVR_NBR                                                    
DJ0002             ,ACCT_DLVR_NBR                                               
DJ0002             ,RCV_NBR                                                     
DJ0002             ,ACCT_RCV_NBR                                                
DJ0002             ,ISIN_CNTRY_CD                                               
DJ0002             ,ISIN_SEC_ISSUE_CD                                           
DJ0002             ,ISIN_SEC_CDG_CD                                             
DJ0002             ,STTLM_LCTN_CD                                               
DJ0002             ,STTLM_RSN_CD                                                
DJ0002             ,CSH_MGN_SHRT_CD                                             
DJ0002             ,SBMTG_PRTCP_NBR                                             
DJ0002             ,ACAT_CONTROL_NBR                                            
DJ0002             ,ASSET_SEQ_NBR                                               
DJ0002             ,TRANS_TYPE_CD                                               
DJ0002             ,ASSET_PRC_CTGY_CD                                           
DJ0002             ,ASSET_DESC_TXT                                              
DJ0002             ,ASSET_QTY                                                   
DJ0002             ,ASSET_AMT                                                   
DJ0019             ,WHI_CD                                                      
DJ0002          FROM    ACTIAST                                                 
DJ0002                                                                          
DJ0002         WHERE CLIENT_NBR       = :W-SAVE-CLIENT-NBR                      
DJ0012           AND RCV_NBR          = :W-SAVE-RCV-NBR                         
DJ0012           AND DLVR_NBR         = :W-SAVE-DLVR-NBR                        
DJ0012           AND ACCT_RCV_NBR     = :W-SAVE-ACCT-RCV-NBR                    
DJ0012           AND ACCT_DLVR_NBR    = :W-SAVE-ACCT-DLVR-NBR                   
DJ0012           AND TRNFR_TYPE_CD    = :W-SAVE-TFR-TYPE                        
DJ0012           AND TRANS_RFRN_ID_CD = :W-SAVE-TRAN-REF-ID                     
DJ0002     END-EXEC.                                                            
DJ0002*****      AND ACAT_CONTROL_NBR = :W-SAVE-ACAT-CTL-NBR                    
      /                                                                         
      ******************************************************************        
      * DB2 COMMAREA                                                   *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.           
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
                                                                                
      ******************************************************************        
      * DB2 ERROR MESSAGE AREA                                         *        
      ******************************************************************        
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
DJ0002     05  W-COMMIT-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(009) COMP-3 VALUE 0.            
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC  ---9.                             
DJ0002     05  W-AST-SQLCODE             PIC S9(9) COMP-4.                      
           05  W-SQLERRD-3               PIC  9(9).                             
DJ0004     05  W-SQL-DELETE-COUNT        PIC  --------9.                        
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
      /                                                                         
DJ0003***===> COBOL LE                                                          
DJ0003 01  W-ABEND-AREA.                                                        
DJ0003     05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
DJ0003 01  CALL-MODULES.                                                        
DJ0003     05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.           
DJ0003     05  GETXREF                   PIC  X(08) VALUE 'ZGETXREF'.           
LRM029     05  GETADPNO                  PIC  X(08) VALUE 'GETADPNO'.           
DJ0003 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.           
DJ0003     COPY STUBCPY.                                                        
LRM037     03  MSISINB           PIC X(08) VALUE 'MSISINB '.                    
DJ0003***<=== COBOL LE                                                          
      /                                                                         
DJ0015******************************************************************        
DJ0015* FACZ1B   COMMAREA - ACCOUNT FREEZE                             *        
DJ0015******************************************************************        
DJ0015 01  FILLER                        PIC X(008) VALUE  'FACZ1CA'.           
DJ0015 01  FACZ1B                        PIC X(008) VALUE  'FACZ1B'.            
DJ0015 01  W-FAC-AREA.                                                          
DJ0015     10  W-FAC-CASH-IN-IND          PIC  X(01).                           
DJ0015      88 W-FAC-CASH-IN-FRZ-YES                 VALUE 'Y'.                 
DJ0015      88 W-FAC-CASH-IN-FRZ-NOT                 VALUE 'N'.                 
DJ0015     10  W-FAC-CASH-OUT-IND         PIC  X(01).                           
DJ0015      88 W-FAC-CASH-OUT-FRZ-YES                VALUE 'Y'.                 
DJ0015      88 W-FAC-CASH-OUT-FRZ-NOT                VALUE 'N'.                 
DJ0015     10  W-FAC-SEC-IN-IND           PIC  X(01).                           
DJ0015      88 W-FAC-SEC-IN-FRZ-YES                  VALUE 'Y'.                 
DJ0015      88 W-FAC-SEC-IN-FRZ-NOT                  VALUE 'N'.                 
DJ0015     10  W-FAC-SEC-OUT-IND          PIC  X(01).                           
DJ0015      88 W-FAC-SEC-OUT-FRZ-YES                 VALUE 'Y'.                 
DJ0015      88 W-FAC-SEC-OUT-FRZ-NOT                 VALUE 'N'.                 
      /                                                                         
DJ0015     COPY FACZ1CA REPLACING ==:P:== BY ==F-==.                            
                                                                                
LRM029     COPY GETADPC.                                                        
                                                                                
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
LRM029     05  L-STREAM-IND              PIC  X(001).                           
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
           DISPLAY 'CAT515 - PROCESS ASSETS   (AT) RECORDS'                     
                   ' INBOUND FROM NSCC'.                                        
           DISPLAY '         '                                                  
           'DELETE ASSET    ROWS FROM INIT DB2 TABLE'                           
           DISPLAY '         '                                                  
           'INSERT ASSET    ROWS INTO ACTIVE DB2 TABLE'                         
           DISPLAY '         '                                                  
           'ADD EXCEPTION TRANSFERS TO INIT DB2 TABLE'                          
           DISPLAY '         '                                                  
           'RESET NSCC-PEND SWITCH'                                             
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT                           
                                                                                
           PERFORM 2000-PROCESS-INPUT THRU 2000-EXIT                            
                   UNTIL END-OF-INPUT.                                          
                                                                                
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                          
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT SECTION.                                                       
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.                
           DISPLAY '**************************************************'         
           DISPLAY '* FOR YOUR INFORMATION ONLY:                     *'         
           DISPLAY '* SQLCODE +100 = ROW NOT FOUND                   *'         
           DISPLAY '* SQLCODE -530 = FOREIGN KEY NOT FOUND           *'         
           DISPLAY '* SQLCODE -803 = DUPLICATE KEY                   *'         
           DISPLAY '* SQLCODE -805 = BIND ERROR. REBIND THE PROGRAM. *'         
           DISPLAY '**************************************************'         
           DISPLAY ' '.                                                         
                                                                                
           EXEC SQL                                                             
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP                     
           END-EXEC                                                             
                                                                                
           IF  SQLCODE = +0                                                     
               DISPLAY ' '                                                      
               DISPLAY 'CAT515: W-CURRENT-TIMESTAMP = '                         
                                                    W-CURRENT-TIMESTAMP         
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT515: W-CURRENT-TIMESTAMP NOT SET'                    
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8100-SQL-ERROR THRU 8100-EXIT                           
           END-IF.                                                              
                                                                                
           ACCEPT W-SYS-DATE              FROM DATE.                            
           ACCEPT W-SYS-TIME              FROM TIME.                            
           DISPLAY 'CAT515: SYS-DATE ' W-SYS-DATE                               
                          ' SYS-TIME ' W-SYS-TIME.                              
                                                                                
           DISPLAY 'CAT515: L-BYP-DATECHK-SW = '                                
                            L-BYP-DATECHK-SW                                    
           ' (1=BYPASS DATE CHECK)'                                             
           DISPLAY 'CAT515: L-BYP-FILECHK-SW = '                                
                            L-BYP-FILECHK-SW                                    
           ' (1=BYPASS FILE CHECK. BYPASS EMPTY FILE,DB2 ABENDS.)'              
           DISPLAY 'CAT515: L-RERUN-SW       = '                                
                            L-RERUN-SW                                          
           ' (1=THIS IS A RERUN. ALLOW DUPES AND NOT FNDS.)'                    
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT515: DATE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT515: DATE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT515: FILE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT515: FILE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-RERUN                                                          
               DISPLAY ' '                                                      
               DISPLAY '*--------------------------------------------*'         
               DISPLAY 'CAT515: THIS IS A RERUN.'                               
               DISPLAY '*--------------------------------------------*'         
               DISPLAY ' '                                                      
           END-IF.                                                              
                                                                                
           MOVE 'CAT515'                  TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL BPDATES USING BPDATES-PARAMETERS.                               
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.                   
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.                   
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.                   
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT515:       BPD-PROC-DATE= ' BPD-PROC-DATE                
                                '  LD-PROC-DATE= ' LD-PROC-DATE.                
           DISPLAY 'CAT515: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE.         
           DISPLAY ' '.                                                         
                                                                                
           MOVE '000'                  TO BH-BROKER-NUMBER                      
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT515: INFILE   OPENED FOR INPUT.  STATUS = '              
                                               INFILE-STAT.                     
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT515: ERROR OPENING INFILE'                           
               DISPLAY 'CAT515: OPEN STATUS = ' INFILE-STAT                     
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT515: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CD                                        
               CALL ABEND USING ABEND-CD                                        
           END-IF.                                                              
                                                                                
DJ0007     OPEN INPUT BNWREGOP.                                                 
DJ0007     DISPLAY 'CAT515: BNWREGOP OPENED FOR INPUT.  STATUS = '              
DJ0007                                        BNWREGOP-STAT                     
DJ0007     IF  BNWREGOP-OKAY                                                    
DJ0007         CONTINUE                                                         
DJ0007     ELSE                                                                 
DJ0007         DISPLAY 'CAT515: ERROR OPENING BNWREGOP'                         
DJ0007         DISPLAY 'CAT515: OPEN STATUS = ' BNWREGOP-STAT                   
DJ0007         DISPLAY 'CAT515: U3001 - ABENDING ON BAD FILE STATUS'            
DJ0007         MOVE +3001    TO ABEND-CD                                        
DJ0007         CALL ABEND USING ABEND-CD                                        
DJ0007     END-IF.                                                              
                                                                                
DJ0007     OPEN INPUT MFOPBR.                                                   
DJ0007     DISPLAY 'CAT515: MFOPBR   OPENED FOR INPUT.  STATUS = '              
DJ0007                                        MFOPBR-STAT                       
DJ0007     IF  MFOPBR-OKAY                                                      
DJ0007         CONTINUE                                                         
DJ0007     ELSE                                                                 
DJ0007         DISPLAY 'CAT515: ERROR OPENING MFOPBR'                           
DJ0007         DISPLAY 'CAT515: OPEN STATUS = ' MFOPBR-STAT                     
DJ0007         DISPLAY 'CAT515: U3001 - ABENDING ON BAD FILE STATUS'            
DJ0007         MOVE +3001    TO ABEND-CD                                        
DJ0007         CALL ABEND USING ABEND-CD                                        
DJ0007     END-IF.                                                              
                                                                                
DJ0023     OPEN INPUT PRNGFL.                                                   
DJ0023     DISPLAY 'CAT515: PRNGFL   OPENED FOR INPUT.  STATUS = '              
DJ0023                                        PRNGFL-STAT                       
DJ0023     IF  PRNGFL-OKAY                                                      
DJ0023         CONTINUE                                                         
DJ0023     ELSE                                                                 
DJ0023         DISPLAY 'CAT515: ERROR OPENING PRNGFL'                           
DJ0023         DISPLAY 'CAT515: OPEN STATUS = ' PRNGFL-STAT                     
DJ0023         DISPLAY 'CAT515: U3001 - ABENDING ON BAD FILE STATUS'            
DJ0023         MOVE +3001    TO ABEND-CD                                        
DJ0023         CALL ABEND USING ABEND-CD                                        
DJ0023     END-IF.                                                              
                                                                                
           PERFORM 1500-CHECK-HDR-REC  THRU 1500-EXIT.                          
                                                                                
           DISPLAY '**********************************'                         
           DISPLAY 'CAT515: INBOUND-CYCLE-NBR     = '                           
                                         INFILE-HDR-CYCLE-NBR                   
           DISPLAY '**********************************'                         
                                                                                
           MOVE 'D'              TO GETMSD-DEVICE-IND                           
           MOVE 'R'              TO GETMSD-ACCESS-IND                           
           MOVE 'E'              TO GETMSD-FORMAT-IND                           
           SET GETXRF-DEVICE-DISK        TO TRUE                                
           SET GETXRF-ACCESS-RANDOM      TO TRUE                                
           SET GETXRF-RETURN-VALID       TO TRUE                                
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE HDR REC  TO GET THE TIMESTAMP                                 
      *  FOR THE LAST TIME WE TRANSMITTED TO NSCC                               
      ******************************************************************        
       1500-CHECK-HDR-REC  SECTION.                                             
                                                                                
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF  END-OF-INPUT                                                     
               DISPLAY 'CAT515: END OF INPUT REACHED'                           
               IF  L-BYP-FILECHK                                                
                   DISPLAY 'CAT515: BYPASSING FILE CHECK PER JCLPARM'           
                   GO TO 1500-EXIT                                              
               ELSE                                                             
                   DISPLAY 'CAT515: U3003 - ABENDING ON EMPTY FILE'             
                   MOVE +3003    TO ABEND-CD                                    
                   CALL ABEND USING ABEND-CD                                    
               END-IF                                                           
           END-IF.                                                              
           IF  INFILE-HDR-RECORD                                                
               SET INFILE-DATE-FOUND TO TRUE                                    
               DISPLAY 'CAT515: INFILE  DATE = '                                
                                              INFILE-HDR-PROC-DATE              
                             ', UPDT BY PGM=' INFILE-HDR-PGM-NAME               
                                     ' DATE=' INFILE-HDR-SYS-DATE               
                                     ' TIME=' INFILE-HDR-SYS-TIME               
               IF  INFILE-HDR-PROC-DATE = LD-PROC-DATE                          
                   DISPLAY 'CAT515: INFILE  DATE = PROC DATE. OKAY'             
               ELSE                                                             
                   DISPLAY 'CAT515: INFILE  DATE NOT = PROC DATE'               
                   IF L-BYP-DATECHK                                             
                   DISPLAY 'CAT515: BYPASSING DATE CHECK PER JCLPARM'           
                   ELSE                                                         
                      DISPLAY 'CAT515: U3004 - ABENDING ON BAD DATE'            
                      MOVE +3004    TO ABEND-CD                                 
                      CALL ABEND USING ABEND-CD                                 
                   END-IF                                                       
               END-IF                                                           
DJ0019         MOVE INFILE-HDR-CYCLE-NBR      TO W-CYCLE-NBR                    
           ELSE                                                                 
               DISPLAY 'CAT515: INFILE  DATE RECORD MISSING'                    
                   IF L-BYP-DATECHK                                             
                   DISPLAY 'CAT515: BYPASSING DATE CHECK PER JCLPARM'           
                   ELSE                                                         
                      DISPLAY 'CAT515: U3005 - ABENDING ON BAD DATE'            
                      MOVE +3005    TO ABEND-CD                                 
                      CALL ABEND USING ABEND-CD                                 
                   END-IF                                                       
           END-IF.                                                              
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1500-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE NSCC FILE AND PROCESS ONLY ASSETS ('A') RECORDS.              
      *  IF  THE MATCHED-INDICATOR = 'Y',                                       
      *      DO THE MATCHED ROUTINE.                                            
      *  ELSE                                                                   
      *      DO THE UNMATCHED ROUTINE.                                          
      ******************************************************************        
       2000-PROCESS-INPUT SECTION.                                              
           MOVE '2000-PROCESS-INPUT         ' TO W-ROUTINE-1.                   
                                                                                
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF  END-OF-INPUT                                                     
                                                                                
               PERFORM 4500-CONTROL-NBR-BREAK THRU 4500-EXIT                    
                                                                                
           ELSE                                                                 
               EVALUATE W-NSCC-REC-SUBTYPE                                      
               WHEN 'A'                                                         
                    PERFORM 4000-LOAD      THRU 4000-EXIT                       
               END-EVALUATE                                                     
           END-IF.                                                              
                                                                                
       2000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE NSCC FILE AND MOVE TO WORKING-STORAGE.                        
      ******************************************************************        
       3000-READ-INPUT SECTION.                                                 
           MOVE '3000-READ-INPUT            ' TO W-ROUTINE-1.                   
                                                                                
           IF  END-OF-INPUT                                                     
               DISPLAY 'CAT515: WARNING - READING AFTER EOF'                    
               GO 3000-EXIT                                                     
           END-IF.                                                              
                                                                                
           READ INFILE                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INPUT-SW                     
                   DISPLAY 'CAT515: END OF INPUT REACHED'                       
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           ADD  1                        TO W-INFILE-CNT.                       
                                                                                
           IF  W-INFILE-CNT0 = 0                                                
               ACCEPT W-SYS-DATE            FROM DATE                           
               ACCEPT W-SYS-TIME            FROM TIME                           
               DISPLAY 'TIME ' W-SYS-TIME                                       
                               ' INP-CNT= ' W-INFILE-CNT                        
                              ' LOAD-CNT= ' W-LOAD-CNT                          
                               ' SQL-CNT= ' W-SQL-CNT                           
           END-IF.                                                              
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT515: ERROR READING INFILE'                           
               DISPLAY 'CAT515: READ STATUS = ' INFILE-STAT                     
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT515: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CD                                        
               CALL ABEND USING ABEND-CD                                        
           END-IF.                                                              
                                                                                
           MOVE SPACES                   TO W-NSCC-RECORD.                      
           MOVE W-REC-LEN-IN             TO W-REC-LEN-OUT.                      
                                                                                
           MOVE INFILE-RECORD   (1 : W-REC-LEN-IN) TO                           
                W-NSCC-RECORD   (1 : W-REC-LEN-IN).                             
                                                                                
           IF  INFILE-HDR-RECORD                                                
               DISPLAY 'CAT515: INFILE-HDR-REC = '                              
                                                 INFILE-HDR-REC (1:120)         
               GO TO 3000-EXIT                                                  
           ELSE                                                                 
               IF  INFILE-TRL-RECORD                                            
                   DISPLAY 'CAT515: INFILE-TRL-REC = '                          
                                                 INFILE-TRL-REC (1:120)         
                   GO TO 3000-READ-INPUT                                        
               END-IF                                                           
           END-IF.                                                              
                                                                                
           ADD  1                        TO W-DETAIL-CNT.                       
                                                                                
           EVALUATE W-NSCC-REC-SUBTYPE                                          
                    WHEN 'A'      ADD 1 TO W-AT-CNT                             
           END-EVALUATE                                                         
                                                                                
           EVALUATE TRUE                                                        
                    WHEN W-NSCC-AT-LEN    ADD 1 TO W-ATR-CNT                    
                    WHEN W-NSCC-AT-OP-LEN ADD 1 TO W-ATO-CNT                    
                    WHEN W-NSCC-AT-MF-LEN ADD 1 TO W-ATF-CNT                    
           END-EVALUATE                                                         
                                                                                
           IF  W-NSCC-KEY-CLIENT-NBR(2:3) > '000'                               
               IF  W-NSCC-KEY-CLIENT-NBR(2:3) = BH-BROKER-NUMBER                
                   CONTINUE                                                     
               ELSE                                                             
                   PERFORM 3500-GETB1 THRU 3500-EXIT                            
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF   W-NSCC-REC-SUBTYPE = 'A'                                        
                MOVE W-NSCC-ASSET-SEQ-NBR     TO W-ASSET-SEQ-NBR                
                MOVE W-NSCC-AT-ASSET-SEQ-NBR  TO W-AT-ASSET-SEQ-NBR             
           ELSE                                                                 
                MOVE ZEROES                   TO W-ASSET-SEQ-NBR                
                MOVE ZEROES                   TO W-AT-ASSET-SEQ-NBR             
           END-IF.                                                              
                                                                                
       3000-EXIT. EXIT.                                                         
      /                                                                         
       3500-GETB1          SECTION.                                             
                                                                                
           MOVE ' '                        TO BH-BROKER-HEADER-INFO             
                                              BH-ACAT-INFO                      
           MOVE W-NSCC-KEY-CLIENT-NBR(2:3) TO BH-BROKER-NUMBER                  
           MOVE '015'                      TO BH-LOGICAL-RECORD-CODE            
           MOVE '434500'                   TO BH-B2-INFO-ID                     
           CALL GETB1V                  USING BH-BROKER-HEADER-INFO,            
                                              BH-ACAT-INFO                      
           END-CALL.                                                            
                                                                                
DJ0007     MOVE '537000'                   TO BH-B2-INFO-ID                     
DJ0007     CALL GETB1V                  USING BH-BROKER-HEADER-INFO,            
DJ0007                                        BH-MF-INFO                        
DJ0007     END-CALL.                                                            
                                                                                
DJ0007     MOVE  ' '                       TO BH-MF3-INFO                       
DJ0007     MOVE  '540000'                  TO BH-B2-INFO-ID                     
DJ0007     CALL  GETB1V                 USING BH-BROKER-HEADER-INFO             
DJ0007                                        BH-MF3-INFO                       
DJ0007     END-CALL.                                                            
                                                                                
DJ0015     MOVE ' '                       TO  BH-B2-INFO-ID                     
DJ0015     MOVE '114'                     TO  BH-LOGICAL-RECORD-CODE            
DJ0015     CALL GETB1V                  USING BH-BROKER-HEADER-INFO             
DJ0015                                        BH-REQ-INFO                       
DJ0015     END-CALL                                                             
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'NEW-CLIENT = ' BH-BROKER-NUMBER                             
                                       ' ' BH-BROKER-NAME                       
                               ' BRK-NO= ' BH-BROKER-OLD-CLEARING-HOUSE         
           DISPLAY 'CAT515: BH-ACAT-ACCELERATE-INCOMG-TFRS(434505) = '          
                            BH-ACAT-ACCELERATE-INCOMG-TFRS                      
           DISPLAY 'CAT515: BH-ACAT-PART-TRANSFR-ASSET-EXC(434526) = '          
                            BH-ACAT-PART-TRANSFR-ASSET-EXC                      
DJ0025                    ' (NEEDED TO EDIT PTD)'                               
           DISPLAY 'CAT515: BH-ACAT-REJ-PEND-FULL-REC-AMT (434540) = '          
                            BH-ACAT-REJ-PEND-FULL-REC-AMT                       
           DISPLAY 'CAT515: BH-ACAT-REJ-REC-MARGIN-DEBIT  (434540) = '          
                            BH-ACAT-REJ-REC-MARGIN-DEBIT                        
           DISPLAY 'CAT515: BH-ACAT-REJ-REC-ASSET-VALUE   (434540) = '          
                            BH-ACAT-REJ-REC-ASSET-VALUE                         
           DISPLAY 'CAT515: BH-ACAT-REJ-REC-TOTL-ACT-VAL  (434540) = '          
                            BH-ACAT-REJ-REC-TOTL-ACT-VAL                        
           DISPLAY 'CAT515: BH-ACAT-REJ-PEND-FULL-REC-DB1 (434541) = '          
                            BH-ACAT-REJ-PEND-FULL-REC-DB1                       
           DISPLAY 'CAT515: BH-ACAT-REJ-PEND-FULL-REC-SP  (434542) = '          
                            BH-ACAT-REJ-PEND-FULL-REC-SP                        
           DISPLAY 'CAT515: BH-ACAT-REJ-PEND-FULL-REC-NTS (434543) = '          
                            BH-ACAT-REJ-PEND-FULL-REC-NTS                       
           DISPLAY 'CAT515: BH-ACAT-REJ-PEND-FULL-REC-CMT (434544) = '          
                            BH-ACAT-REJ-PEND-FULL-REC-CMT                       
           DISPLAY 'CAT515: BH-ACAT-REJ-PEND-FULL-REC-MSD (434545) = '          
                            BH-ACAT-REJ-PEND-FULL-REC-MSD                       
           DISPLAY 'CAT515: BH-ACAT-REJ-PEND-FULL-REC-LP  (434546) = '          
                            BH-ACAT-REJ-PEND-FULL-REC-LP                        
           DISPLAY 'CAT515: BH-ACAT-REJ-PEND-FULL-REC-OPT (434547) = '          
                            BH-ACAT-REJ-PEND-FULL-REC-OPT                       
DJ0024     DISPLAY 'CAT515: BH-ACAT-REJ-ARS               (434548) = '          
DJ0024                      BH-ACAT-REJ-ARS                                     
LRM031     DISPLAY 'CAT515: BH-ACAT-REJ-SUB-PENNY-PRICE   (434549) = '          
LRM031                      BH-ACAT-REJ-SUB-PENNY-PRICE                         
DJ0007     DISPLAY 'CAT515: BH-ACAT-MF-AUTO-DELETE        (434689) = '          
DJ0007                      BH-ACAT-MF-AUTO-DELETE                              
DJ0019     DISPLAY 'CAT515: BH-ACAT-ASCENDIS-USER         (434735) = '          
DJ0019                      BH-ACAT-ASCENDIS-USER                               
DJ0007     DISPLAY 'CAT515: BH-MF-FUND-AGREEMENT-OPTION   (537336) = '          
DJ0007                      BH-MF-FUND-AGREEMENT-OPTION                         
DJ0007     DISPLAY 'CAT515: BH-MF3-TRADE-SWITCH-OPTION    (540117) = '          
DJ0007                      BH-MF3-TRADE-SWITCH-OPTION                          
DJ0015     DISPLAY 'CAT515: BH-REQ-ACCT-FREEZE-PROC       (032958) = '          
DJ0015                      BH-REQ-ACCT-FREEZE-PROC                             
DJ0018     DISPLAY 'CAT515: BH-REQ-DUALLY-LISTED-CUSIP    (032962) = '          
DJ0018                      BH-REQ-DUALLY-LISTED-CUSIP                          
           .                                                                    
       3500-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  IF TRANSACTION TYPE = ADD                                              
      *     1. FORMAT FIELDS FOR THE ACTIVE-TABLE.                              
      *     2. ADD TO THE ACTIVE-TABLE.                                         
      *  IF SUBMITTED BY ADP                                                    
      *     1. DELETE FROM THE INIT-TABLE.                                      
      ******************************************************************        
       4000-LOAD                SECTION.                                        
           MOVE '4000-LOAD                  ' TO W-ROUTINE-1.                   
                                                                                
           ADD  1 TO W-LOAD-CNT                                                 
           MOVE ' ' TO W-REJECT-SWITCHES                                        
           MOVE ' ' TO W-REJECT-AUTO-SW                                         
           MOVE 0   TO W-ASSET-AMT W-ASSET-QTY                                  
                                                                                
           IF (W-NSCC-AT-TFR-TYPE      = 'FUL'             AND                  
               W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-RCV-NBR)                     
           OR (W-NSCC-AT-TFR-TYPE      = 'PTD'             AND                  
               W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-RCV-NBR AND                  
               BH-ACAT-PART-TRANSFR-ASSET-EXC = '1')                            
DJ0008     OR (W-NSCC-AT-TFR-TYPE      = 'PTR'             AND                  
DJ0008         W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-RCV-NBR)                     
               MOVE 'Y' TO W-EDIT-RECEIVE-SW                                    
           ELSE                                                                 
               MOVE 'N' TO W-EDIT-RECEIVE-SW                                    
           END-IF.                                                              
                                                                                
DJ0005***--NO NEED TO EDIT INPUT IF IT IS A DELETE                              
DJ0005     IF  W-NSCC-AT-TRAN-TYPE   = 'D'                                      
DJ0005         MOVE 'N' TO W-EDIT-RECEIVE-SW                                    
DJ0005     END-IF.                                                              
                                                                                
           IF  W-NSCC-KEY-CLIENT-NBR   = W-SAVE-CLIENT-NBR                      
           AND W-NSCC-ACAT-CTL-NBR     = W-SAVE-ACAT-CTL-NBR                    
               CONTINUE                                                         
           ELSE                                                                 
                                                                                
               PERFORM 4500-CONTROL-NBR-BREAK THRU 4500-EXIT                    
                                                                                
DJ0013         MOVE ' ' TO W-FAIL-OPEN-CAGE-IND                                 
LRM027         MOVE 0 TO W-TOT-QTY-N W-TOT-AMT-N W-TOT-AMT-TYPES1-2             
LRM027         MOVE BH-ACAT-REJ-PEND-REC-DB1-IND                                
LRM027           TO W-ACAT-REJ-PEND-REC-DB1-IND                                 
               MOVE W-NSCC-KEY-CLIENT-NBR   TO W-SAVE-CLIENT-NBR                
               MOVE W-NSCC-ACAT-CTL-NBR     TO W-SAVE-ACAT-CTL-NBR              
               PERFORM 5700-SELECT-VTRNFR   THRU 5700-EXIT                      
               IF W-TRANSFER-FND-SW = 'Y'                                       
                  MOVE ACCT-DLVR-NBR OF DCLVTRNFR                               
                                            TO W-SAVE-ACCT-DLVR-NBR             
                  MOVE ACCT-RCV-NBR  OF DCLVTRNFR                               
                                            TO W-SAVE-ACCT-RCV-NBR              
DJ0006            MOVE ACAT-CNTL-ASTD-NBR OF DCLVTRNFR                          
DJ0006                                      TO W-SAVE-CNTL-ASTD-NBR             
DJ0015            IF ((ACCT-FRZN-IND OF DCLVTRNFR NOT = 'Y') AND                
DJ0015                 BH-REQ-ACCT-FREEZE-PROC = '1'         AND                
DJ0015                 W-NSCC-STATUS           = '200'       AND                
DJ0015                 W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-RCV-NBR)             
DJ0015                 PERFORM 4100-CHECK-ACCT-FREEZE THRU 4100-EXIT            
DJ0015            END-IF                                                        
DJ0014            IF (W-NSCC-AT-TFR-TYPE      = 'FUL'  AND                      
DJ0014                W-NSCC-STATUS           = '200'  AND                      
DJ0014                W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-RCV-NBR)              
DJ0014            OR (W-NSCC-AT-TFR-TYPE      = 'PTD'  AND                      
DJ0014                W-NSCC-STATUS           = '200'  AND                      
DJ0014                W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-RCV-NBR)              
DJ0014            OR (W-NSCC-AT-TFR-TYPE      = 'PTR'  AND                      
DJ0014               (W-NSCC-STATUS  = '200' OR '500') AND                      
DJ0014                W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-RCV-NBR)              
DJ0014               IF ACCT-FRZN-IND OF DCLVTRNFR = 'Y'                        
DJ0014                  DISPLAY 'INP=' W-INFILE-CNT                             
DJ0014                             ' ' W-NSCC-KEY-CLIENT-NBR                    
DJ0014                             ' ' W-NSCC-ACAT-CTL-NBR                      
DJ0014                             ' ' W-ASSET-SEQ-NBR                          
DJ0014                             ' ' W-NSCC-AT-TRAN-TYPE                      
DJ0014                             ' ' W-NSCC-AT-TFR-TYPE                       
DJ0014                               ' ACCT-FRZN-IND = '                        
DJ0014                  ACCT-FRZN-IND OF DCLVTRNFR                              
DJ0014                  MOVE 'Y'                TO W-REJ-ACCT-FRZN              
DJ0014                  MOVE 'Y'                TO W-REJECT-AUTO-SW             
DJ0014               END-IF                                                     
DJ0014            END-IF                                                        
               ELSE                                                             
                   MOVE ' '                    TO W-SAVE-ACCT-DLVR-NBR          
                   MOVE ' '                    TO W-SAVE-ACCT-RCV-NBR           
DJ0006             MOVE ' '                    TO W-SAVE-CNTL-ASTD-NBR          
               END-IF                                                           
               MOVE W-EDIT-RECEIVE-SW          TO W-SAVE-EDIT-RECEIVE-SW        
               MOVE ' '                        TO W-SAVE-EXCEPTION-SW           
               MOVE BH-ACAT-ACCELERATE-INCOMG-TFRS                              
                                               TO W-SAVE-ACCELERATE-B1          
               MOVE BH-ACAT-PART-TRANSFR-ASSET-EXC                              
                                               TO W-SAVE-PARTIAL-TFR-B1         
DJ0021         MOVE ' ' TO W-MF-AUTO-DEL-CREATED-IND                            
           END-IF.                                                              
                                                                                
           IF  W-NSCC-AT-TFR-TYPE = 'PTD'                                       
           AND W-EDIT-RECEIVE-SW = 'Y'                                          
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                              ' ' W-NSCC-KEY-CLIENT-NBR                         
                              ' ' W-NSCC-ACAT-CTL-NBR                           
                              ' ' W-ASSET-SEQ-NBR                               
                              ' ' W-NSCC-AT-TRAN-TYPE                           
                              ' ' W-NSCC-AT-TFR-TYPE                            
                            ' PTD W-EDIT-RECEIVE-SW=Y'                          
           END-IF                                                               
                                                                                
           MOVE W-NSCC-DIST-PARTICIPANT TO W-SAVE-DIST-PARTICIPANT              
           MOVE W-NSCC-AT-SUB-PART-NBR  TO W-SAVE-SUB-PART-NBR                  
           MOVE W-NSCC-AT-DEL-NBR       TO W-SAVE-DLVR-NBR                      
           MOVE W-NSCC-AT-RCV-NBR       TO W-SAVE-RCV-NBR                       
           MOVE W-NSCC-AT-TFR-TYPE      TO W-SAVE-TFR-TYPE                      
DJ0012     MOVE W-NSCC-AT-TRAN-REF-ID   TO W-SAVE-TRAN-REF-ID                   
DJ0004     MOVE W-NSCC-STATUS           TO W-SAVE-STATUS                        
DJ0019     MOVE W-NSCC-PROC-DATE (1:4)  TO W-SAVE-PROC-YEAR                     
DJ0019     MOVE W-NSCC-PROC-DATE (5:2)  TO W-SAVE-PROC-MM                       
DJ0019     MOVE W-NSCC-PROC-DATE (7:2)  TO W-SAVE-PROC-DD                       
                                                                                
SOC7       IF  W-NSCC-DAYS-IN-STATUS NOT NUMERIC                                
               MOVE ZEROS TO W-NSCC-DAYS-IN-STATUS                              
           END-IF.                                                              
                                                                                
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-DEL-NBR                      
               MOVE 'D'              TO W-DSTBN-SIDE-CD                         
           ELSE                                                                 
               MOVE 'R'              TO W-DSTBN-SIDE-CD                         
           END-IF                                                               
                                                                                
           IF  W-NSCC-SYSTEM-ACTION  = '2'                                      
           OR  (W-AT-ASSET-SEQ-NBR = ZEROES)                                    
           OR  (W-NSCC-STATUS = ' ')                                            
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                              ' ' W-NSCC-KEY-CLIENT-NBR                         
                              ' ' W-NSCC-ACAT-CTL-NBR                           
                              ' ' W-ASSET-SEQ-NBR                               
                              ' ' W-NSCC-AT-TRAN-TYPE                           
                              ' ' W-NSCC-AT-TFR-TYPE                            
                          ' DST=' W-DSTBN-SIDE-CD                               
                          ' ACT=' W-NSCC-SYSTEM-ACTION                          
                          ' REJ=' W-NSCC-SYSTEM-REJ-RSN                         
                          ' STA=' W-NSCC-STATUS                                 
                          ' SYSTEM REJECTED'                                    
                          ' BYPASS ADD/UPDATE'                                  
               MOVE 'Y'                        TO W-SAVE-EXCEPTION-SW           
               GO TO 4000-EXIT                                                  
           END-IF                                                               
                                                                                
           PERFORM 5100-MOVE-NSCC-TO-ACTIVE THRU 5100-EXIT                      
           PERFORM 5200-EDIT-ADD            THRU 5200-EXIT                      
                                                                                
DJ0007     IF  BH-ACAT-MF-AUTO-DELETE  = '1'                                    
DJ0007     AND W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-RCV-NBR                      
DJ0007     AND (W-NSCC-AT-TFR-TYPE     = 'FUL' OR 'RCR')                        
DJ0007     AND W-NSCC-AT-TRAN-TYPE     = 'A'                                    
DJ0007     AND W-NSCC-DAYS-IN-STATUS   < 002                                    
DJ0025         IF (W-NSCC-AT-ASSET-PRC-CATG = 'MFMM' OR 'MFNM')                 
LRM033         AND (W-NSCC-AT-STL-LOC = '10' OR '50')                           
DJ0007             PERFORM 7100-MF-AUTO-DELETE-EDIT THRU 7100-EXIT              
DJ0007         END-IF                                                           
DJ0007     END-IF.                                                              
                                                                                
           IF  W-NSCC-AT-TRAN-TYPE   = 'A'                                      
           AND W-NSCC-DAYS-IN-STATUS < 002                                      
               PERFORM 5400-INSERT-ACTIVE       THRU 5400-EXIT                  
           ELSE                                                                 
               IF  W-NSCC-AT-TRAN-TYPE   = 'D'                                  
                   PERFORM 5650-DELETE-ACTIVE   THRU 5650-EXIT                  
               ELSE                                                             
                   PERFORM 5500-UPDATE-ACTIVE   THRU 5500-EXIT                  
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF  W-TRANSFER-FND-SW = 'Y'                                          
               PERFORM 5800-UPDATE-VTRNFR-INDS  THRU 5800-EXIT                  
               IF  W-REJECT-AUTO-SW = 'Y'                                       
                   PERFORM 5900-INSERT-ACTITRF THRU 5900-EXIT                   
               END-IF                                                           
           END-IF.                                                              
                                                                                
       4000-EXIT. EXIT.                                                         
      /                                                                         
       4100-CHECK-ACCT-FREEZE   SECTION.                                        
           MOVE '4100-CHECK-ACCT-FREEZE     ' TO W-ROUTINE-1.                   
           MOVE ' '                      TO F-COMMAREA-FACZ1CA                  
           MOVE 'CAT515'                 TO F-CA-I-CALLER-PGM-ID                
           MOVE W-NSCC-KEY-CLIENT-NBR    TO F-CA-I-CLIENT4                      
           MOVE W-SAVE-ACCT-RCV-NBR(1:3) TO F-CA-I-BRANCH                       
           MOVE W-SAVE-ACCT-RCV-NBR(4:5) TO F-CA-I-ACCT                         
           SET  F-CA-I-IND-REQUESTS-INIT TO TRUE                                
           SET  F-CA-I-CASH-IN-REQ-YES TO TRUE                                  
           SET  F-CA-I-SEC-IN-REQ-YES TO TRUE                                   
           CALL FACZ1B USING F-COMMAREA-FACZ1CA                                 
           MOVE F-CA-A-CASH-IN-IND TO W-FAC-CASH-IN-IND                         
           MOVE F-CA-A-SEC-IN-IND    TO W-FAC-SEC-IN-IND.                       
           IF  F-CA-L-RETURN-CODE = '0'                                         
             IF F-CA-R-RESP-IS-FREEZE-YES                                       
                 DISPLAY 'INP=' W-INFILE-CNT                                    
                            ' ' W-NSCC-KEY-CLIENT-NBR                           
                            ' ' W-NSCC-AT-ACAT-CTL-NBR                          
                            ' ' W-NSCC-AT-TFR-TYPE                              
                        ' TRN=' W-NSCC-AT-TRAN-TYPE                             
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                            ' ' W-SAVE-ACCT-RCV-NBR(1:8)                        
                                           ' FREEZE LOOKUP IN'                  
                DISPLAY '   1FAC-CA-INPUT-REQUEST-AREA: '                       
                             F-CA-INPUT-REQUEST-AREA                            
                DISPLAY '   1FAC-CA-REQUEST-RESPONSE-AREA:'                     
                             F-CA-REQUEST-RESPONSE-AREA(1:50)                   
             END-IF                                                             
           ELSE                                                                 
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-NSCC-KEY-CLIENT-NBR                             
                          ' ' W-NSCC-AT-ACAT-CTL-NBR                            
                          ' ' W-NSCC-AT-TFR-TYPE                                
                      ' TRN=' W-NSCC-AT-TRAN-TYPE                               
                      ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                        
                            ' ' W-SAVE-ACCT-RCV-NBR(1:8)                        
                                           ' FREEZE LOOKUP IN'                  
               DISPLAY '   1FAC-CA-L-RETURN-CODE= ' F-CA-L-RETURN-CODE          
               DISPLAY '   1FAC-CA-L-ERR-MSG= ' F-CA-L-ERR-MSG                  
           END-IF.                                                              
                                                                                
           MOVE ' '                      TO F-COMMAREA-FACZ1CA                  
           MOVE 'CAT515'                 TO F-CA-I-CALLER-PGM-ID                
           MOVE W-NSCC-KEY-CLIENT-NBR    TO F-CA-I-CLIENT4                      
           MOVE W-SAVE-ACCT-RCV-NBR(1:3) TO F-CA-I-BRANCH                       
           MOVE W-SAVE-ACCT-RCV-NBR(4:5) TO F-CA-I-ACCT                         
           SET  F-CA-I-IND-REQUESTS-INIT TO TRUE                                
           SET  F-CA-I-CASH-OUT-REQ-YES TO TRUE                                 
           SET  F-CA-I-SEC-OUT-REQ-YES TO TRUE                                  
           CALL FACZ1B USING F-COMMAREA-FACZ1CA                                 
           MOVE F-CA-A-CASH-OUT-IND TO W-FAC-CASH-OUT-IND                       
           MOVE F-CA-A-SEC-OUT-IND TO W-FAC-SEC-OUT-IND.                        
           IF  F-CA-L-RETURN-CODE = '0'                                         
             IF F-CA-R-RESP-IS-FREEZE-YES                                       
                 DISPLAY 'INP=' W-INFILE-CNT                                    
                            ' ' W-NSCC-KEY-CLIENT-NBR                           
                            ' ' W-NSCC-AT-ACAT-CTL-NBR                          
                            ' ' W-NSCC-AT-TFR-TYPE                              
                        ' TRN=' W-NSCC-AT-TRAN-TYPE                             
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                            ' ' W-SAVE-ACCT-RCV-NBR(1:8)                        
                                           ' FREEZE LOOKUP OUT'                 
                DISPLAY '2FAC-CA-INPUT-REQUEST-AREA: '                          
                          F-CA-INPUT-REQUEST-AREA                               
                DISPLAY '2FAC-CA-REQUEST-RESPONSE-AREA:'                        
                          F-CA-REQUEST-RESPONSE-AREA(1:50)                      
             END-IF                                                             
           ELSE                                                                 
                 DISPLAY 'INP=' W-INFILE-CNT                                    
                            ' ' W-NSCC-KEY-CLIENT-NBR                           
                            ' ' W-NSCC-AT-ACAT-CTL-NBR                          
                            ' ' W-NSCC-AT-TFR-TYPE                              
                        ' TRN=' W-NSCC-AT-TRAN-TYPE                             
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                            ' ' W-SAVE-ACCT-RCV-NBR(1:8)                        
                                           ' FREEZE LOOKUP OUT'                 
               DISPLAY '2FAC-CA-L-RETURN-CODE= ' F-CA-L-RETURN-CODE             
               DISPLAY '2FAC-CA-L-ERR-MSG= ' F-CA-L-ERR-MSG                     
           END-IF.                                                              
                                                                                
           IF (W-NSCC-AT-TFR-TYPE      = 'FUL' AND                              
               W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-RCV-NBR)                     
               IF F-CA-A-CASH-IN-FRZ-YES     AND                                
                  F-CA-A-SEC-IN-FRZ-YES                                         
                  MOVE 'Y'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
                 DISPLAY 'INP=' W-INFILE-CNT                                    
                            ' ' W-NSCC-KEY-CLIENT-NBR                           
                            ' ' W-NSCC-AT-ACAT-CTL-NBR                          
                            ' ' W-NSCC-AT-TFR-TYPE                              
                        ' TRN=' W-NSCC-AT-TRAN-TYPE                             
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                            ' ' W-SAVE-ACCT-RCV-NBR(1:8)                        
                              ' FREEZE IS ON'                                   
               ELSE                                                             
                  MOVE 'N'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
               END-IF                                                           
           END-IF.                                                              
           IF (W-NSCC-AT-TFR-TYPE      = 'FUL' AND                              
               W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-DEL-NBR)                     
               IF F-CA-A-CASH-OUT-FRZ-YES AND                                   
                  F-CA-A-SEC-OUT-FRZ-YES                                        
                  MOVE 'Y'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
                 DISPLAY 'INP=' W-INFILE-CNT                                    
                            ' ' W-NSCC-KEY-CLIENT-NBR                           
                            ' ' W-NSCC-AT-ACAT-CTL-NBR                          
                            ' ' W-NSCC-AT-TFR-TYPE                              
                        ' TRN=' W-NSCC-AT-TRAN-TYPE                             
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                            ' ' W-SAVE-ACCT-RCV-NBR(1:8)                        
                              ' FREEZE IS ON'                                   
               ELSE                                                             
                  MOVE 'N'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
               END-IF                                                           
           END-IF.                                                              
           IF (W-NSCC-AT-TFR-TYPE      = 'PTD')                                 
               IF (F-CA-A-CASH-IN-FRZ-YES  OR                                   
                   F-CA-A-SEC-IN-FRZ-YES     OR                                 
                   F-CA-A-CASH-OUT-FRZ-YES OR                                   
                   F-CA-A-SEC-OUT-FRZ-YES)                                      
                  MOVE 'Y'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
                 DISPLAY 'INP=' W-INFILE-CNT                                    
                            ' ' W-NSCC-KEY-CLIENT-NBR                           
                            ' ' W-NSCC-AT-ACAT-CTL-NBR                          
                            ' ' W-NSCC-AT-TFR-TYPE                              
                        ' TRN=' W-NSCC-AT-TRAN-TYPE                             
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                            ' ' W-SAVE-ACCT-RCV-NBR(1:8)                        
                              ' FREEZE IS ON'                                   
               ELSE                                                             
                  MOVE 'N'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
               END-IF                                                           
           END-IF.                                                              
           IF (W-NSCC-AT-TFR-TYPE      = 'PTR')                                 
               IF (F-CA-A-CASH-IN-FRZ-YES  OR                                   
                   F-CA-A-SEC-IN-FRZ-YES     OR                                 
                   F-CA-A-CASH-OUT-FRZ-YES OR                                   
                   F-CA-A-SEC-OUT-FRZ-YES)                                      
                  MOVE 'Y'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
                 DISPLAY 'INP=' W-INFILE-CNT                                    
                            ' ' W-NSCC-KEY-CLIENT-NBR                           
                            ' ' W-NSCC-AT-ACAT-CTL-NBR                          
                            ' ' W-NSCC-AT-TFR-TYPE                              
                        ' TRN=' W-NSCC-AT-TRAN-TYPE                             
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                            ' ' W-SAVE-ACCT-RCV-NBR(1:8)                        
                              ' FREEZE IS ON'                                   
               ELSE                                                             
                  MOVE 'N'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
               END-IF                                                           
           END-IF.                                                              
                                                                                
       4100-EXIT. EXIT.                                                         
      /                                                                         
       4500-CONTROL-NBR-BREAK   SECTION.                                        
           MOVE '4500-CONTROL-NBR-BREAK     ' TO W-ROUTINE-1.                   
                                                                                
LRM027     IF (W-ACAT-REJ-PEND-REC-DB1-IND = '2'                                
LRM027     AND W-TOT-AMT-TYPES1-2 > ZERO)                                       
LRM027         MOVE 'Y' TO W-REJ-DB1                                            
LRM027         MOVE 'Y' TO W-SAVE-EXCEPTION-SW                                  
LRM027               DISPLAY 'CONTROL-NBR BREAK '                               
LRM027                        ' ' W-SAVE-CLIENT-NBR                             
LRM027                        ' ' W-SAVE-ACAT-CTL-NBR                           
LRM027                    ' DST=' W-DSTBN-SIDE-CD                               
LRM027                    ' REJ-DB1 NET CASH 1-2 BAL FLAGGED'                   
LRM027                    ' AMT ' W-TOT-AMT-TYPES1-2                            
LRM027         IF  W-TRANSFER-FND-SW = 'Y'                                      
LRM027             PERFORM 5800-UPDATE-VTRNFR-INDS  THRU 5800-EXIT              
LRM027             IF  BH-ACAT-REJ-PEND-REC-DB1-CODE > '00'                     
LRM027                 MOVE 'Y' TO W-REJECT-AUTO-SW                             
LRM027                 PERFORM 5900-INSERT-ACTITRF THRU 5900-EXIT               
LRM027             END-IF                                                       
LRM027         END-IF                                                           
LRM027     END-IF.                                                              
LRM027     MOVE ' ' TO W-REJ-DB1                                                
LRM027     MOVE ZERO TO W-TOT-AMT-TYPES1-2                                      
                                                                                
      ****ACCELERATE THE TRANSFER FOR RECEIVE IF NO EXCEPTIONS                  
           IF  W-SAVE-CLIENT-NBR          > ' '                                 
DJ0009         AND W-SAVE-TFR-TYPE            = 'FUL'                           
               AND W-SAVE-EDIT-RECEIVE-SW     = 'Y'                             
               AND W-SAVE-EXCEPTION-SW        = ' '                             
               AND W-SAVE-ACCELERATE-B1       = '1'                             
               AND W-TRANSFER-FND-SW          = 'Y'                             
               AND (ACCT-DB-BAL-T1-IND OF DCLVTRNFR       NOT =  'Y')           
LRM027         AND (ACCT-DB-BAL-T1-IND OF DCLVTRNFR       NOT =  '2')           
               AND (ACCT-MRGN-DB-IND   OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-SHRT-PSTN-IND OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-SEC-RSTRD-IND OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-AST-EXCS-IND  OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-OPTN-PSTN-IND OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-LTD-PRTNR-IND OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-TIN-MSMTH-IND OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-DPLCT-TRN-IND OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-CUST-70-IND   OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-QULFD-PLN-IND OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-MNGD-IND      OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-PRVT-RNG-IND  OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-BRKR-TIF-IND  OF DCLVTRNFR       NOT =  'Y')           
               AND (CMNT-STTS-CD       OF DCLVTRNFR       NOT =  'Y')           
               AND (TRNFR-TYPE-RJCT-CD OF DCLVTRNFR       NOT > '00')           
DJ0021           IF (NOT W-MF-AUTO-DEL-CREATED)                                 
                     PERFORM 5910-ACCELERATE THRU 5910-EXIT                     
DJ0021           ELSE                                                           
DJ0021             DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0021                    ' CLT=' W-SAVE-CLIENT-NBR                             
DJ0021                    ' CTL=' W-SAVE-ACAT-CTL-NBR                           
DJ0021                    ' MF-AUTO-DEL-CREATED. DO NOT ACCELERATE.'            
DJ0021           END-IF                                                         
           END-IF                                                               
                                                                                
      ****APPROVE PARTIAL TRANSFER FOR RECEIVE IF NO EXCEPTIONS                 
           IF  W-SAVE-CLIENT-NBR          > ' '                                 
               AND W-SAVE-TFR-TYPE            = 'PTD'                           
               AND W-SAVE-EDIT-RECEIVE-SW     = 'Y'                             
               AND W-SAVE-EXCEPTION-SW        = ' '                             
               AND W-SAVE-PARTIAL-TFR-B1      = '1'                             
               AND W-TRANSFER-FND-SW          = 'Y'                             
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' W-NSCC-KEY-CLIENT-NBR                         
                          ' CTL=' W-NSCC-ACAT-CTL-NBR                           
                 ' PERFORM PTD AUTO APPROVAL CHECK'                             
               IF  (ACCT-DB-BAL-T1-IND OF DCLVTRNFR       NOT =  'Y')           
LRM027         AND (ACCT-DB-BAL-T1-IND OF DCLVTRNFR       NOT =  '2')           
               AND (ACCT-MRGN-DB-IND   OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-SHRT-PSTN-IND OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-SEC-RSTRD-IND OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-AST-EXCS-IND  OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-OPTN-PSTN-IND OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-LTD-PRTNR-IND OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-TIN-MSMTH-IND OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-DPLCT-TRN-IND OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-CUST-70-IND   OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-QULFD-PLN-IND OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-MNGD-IND      OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-PRVT-RNG-IND  OF DCLVTRNFR       NOT =  'Y')           
               AND (ACCT-BRKR-TIF-IND  OF DCLVTRNFR       NOT =  'Y')           
               AND (CMNT-STTS-CD       OF DCLVTRNFR       NOT =  'Y')           
               AND (TRNFR-TYPE-RJCT-CD OF DCLVTRNFR       NOT > '00')           
               MOVE 'A'              TO NSCC-PEND-CD       OF DCLVTRNFR         
                   ADD 1 TO W-PTD-APPROVED-CNT                                  
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' W-NSCC-KEY-CLIENT-NBR                         
                          ' CTL=' W-NSCC-ACAT-CTL-NBR                           
                          ' THIS PTD HAS BEEN APPROVED'                         
               ELSE                                                             
                   ADD 1 TO W-PTD-NOT-APPROVED-CNT                              
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF  W-TRANSFER-FND-SW          = 'Y'                                 
               IF  W-REJ-TOTL-ACT-VAL = 'Y'                                     
                   MOVE W-TOT-AMT-N TO W-TOT-AMT-X                              
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' W-NSCC-KEY-CLIENT-NBR                         
                          ' CTL=' W-NSCC-ACAT-CTL-NBR                           
                          ' VTRNFR'                                             
                       ' TOTL-ACT-VAL='  W-TOT-AMT-X                            
               END-IF                                                           
                   PERFORM 5850-UPDATE-VTRNFR       THRU 5850-EXIT              
           END-IF                                                               
                                                                                
           IF  W-SAVE-CLIENT-NBR       > ' '                                    
               AND W-SAVE-DIST-PARTICIPANT = W-SAVE-SUB-PART-NBR                
                   PERFORM 5600-DELETE-INIT THRU 5600-EXIT                      
           END-IF.                                                              
                                                                                
DJ0004**--DELETE PTR ASSETS THAT THE RECEIVER CREATED(REQUESTED)                
DJ0004**--WHEN THE DELIVERER SENDS THE REAL ASSETS                              
DJ0004     IF  W-SAVE-CLIENT-NBR       > ' '                                    
DJ0004     AND W-SAVE-TFR-TYPE         = 'PTR'                                  
DJ0004     AND W-SAVE-SUB-PART-NBR     = W-SAVE-DLVR-NBR                        
DJ0004     AND W-SAVE-STATUS           = '200'                                  
DJ0004             DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0004                    ' CLT=' W-SAVE-CLIENT-NBR                             
DJ0004                    ' CTL=' W-SAVE-ACAT-CTL-NBR                           
DJ0004           ' DELETE PTR ASSETS THAT ORIGINATOR CREATED'                   
DJ0004             PERFORM 5660-DELETE-ACTIVE-PTR THRU 5660-EXIT                
DJ0004     END-IF.                                                              
                                                                                
       4500-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  MOVE NSCC FIELDS TO ACTIVE TABLE,                                      
      *****************************************************************         
       5100-MOVE-NSCC-TO-ACTIVE SECTION.                                        
                                                                                
           INITIALIZE DCLVASSET                                                 
           MOVE W-NSCC-KEY-CLIENT-NBR                                           
                                     TO CLIENT-NBR         OF DCLVASSET         
           MOVE W-NSCC-SYSTEM-ACTION                                            
                                     TO SYS-ACT-CD         OF DCLVASSET         
           MOVE W-NSCC-SYSTEM-REJ-RSN                                           
                                     TO SYS-RJCT-RSN-CD    OF DCLVASSET         
           MOVE W-NSCC-ACAT-CTL-NBR                                             
                                     TO ACAT-CONTROL-NBR   OF DCLVASSET         
           MOVE W-ASSET-SEQ-NBR                                                 
                                     TO ASSET-SEQ-NBR      OF DCLVASSET         
           MOVE W-NSCC-AT-REC-TYPE-ST                                           
                                     TO RCRD-STTS-CD       OF DCLVASSET         
           MOVE W-NSCC-AT-REC-LEN-ST                                            
                                     TO RCRD-LNGTH-STTS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-PHSCL-SEQ-ST                                          
                                     TO PHSCL-SEQ-STTS-CD  OF DCLVASSET         
           MOVE W-NSCC-AT-LGCL-SEQ-ST                                           
                                     TO LGCL-SEQ-NR-STS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-TRAN-TYPE-ST                                          
                                     TO TRANS-TYPE-STTS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-ACAT-CTL-ST                                           
                                     TO CONTROL-NBR-STS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-TFR-TYPE-ST                                           
                                     TO TRNFR-TYPE-STTS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-SUB-PART-ST                                           
                                     TO SBMT-PRT-NR-STS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-RCV-ST                                                
                                     TO RCV-NBR-STTS-CD    OF DCLVASSET         
           MOVE W-NSCC-AT-DEL-ST                                                
                                     TO DLVR-NBR-STTS-CD   OF DCLVASSET         
           MOVE W-NSCC-AT-TRAN-REF-ID-ST                                        
                                     TO TRANS-RFRN-STTS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-ASSET-SEQ-NBR-ST                                      
                                     TO AST-SEQ-NBR-STS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-ASSET-PRC-CATG-ST                                     
                                     TO AST-PRC-CTG-STS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-OPT-CATG-ST                                           
                                     TO OPTN-CTGY-STTS-CD  OF DCLVASSET         
           MOVE W-NSCC-AT-STL-LOC-ST                                            
                                     TO STTLM-LCTN-STTS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-STL-LOC-RSN-CD-ST                                     
                                     TO STTLM-RSN-STTS-CD  OF DCLVASSET         
           MOVE W-NSCC-AT-SEC-CNTRY-CD-ST                                       
                                     TO ISIN-CNTRY-STTS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-SEC-ID-ST                                             
                                     TO ISIN-SEC-IS-STS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-SEC-CHKDGT-ST                                         
                                     TO ISIN-SEC-CD-STS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-ASSET-DESC-ST                                         
                                     TO ASSET-DESC-STTS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-ASSET-QTY-RQIND-ST                                    
                                     TO ASSET-RQST-STS-CD  OF DCLVASSET         
           MOVE W-NSCC-AT-ASSET-REQ-TRNCD-ST                                    
                                     TO AST-RQ-TRAN-STS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-ASSET-QTY-ST                                          
                                     TO ASSET-QTY-STTS-CD  OF DCLVASSET         
           MOVE W-NSCC-AT-ASSET-PCT-ST                                          
                                     TO ASSET-PCT-STTS-CD  OF DCLVASSET         
           MOVE W-NSCC-AT-POS-CD-ST                                             
                                     TO PSTN-CD-STTS-CD    OF DCLVASSET         
           MOVE W-NSCC-AT-ISO-CURCY-CD-ST                                       
                                     TO ISO-CRNCY-STTS-CD  OF DCLVASSET         
           MOVE W-NSCC-AT-ASSET-AMT-ST                                          
                                     TO ASSET-AMT-STTS-CD  OF DCLVASSET         
           MOVE W-NSCC-AT-BEARER-BOND-ST                                        
                                     TO BEARER-BND-STTS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-CASH-MRGN-SHTCD-ST                                    
                                     TO CSH-MRG-SHT-STS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-WHN-ISS-IND-ST                                        
                                     TO WHI-STTS-CD        OF DCLVASSET         
           MOVE W-NSCC-AT-TFR-TYPE-RSN-ST                                       
                                     TO TRN-TYP-RSN-STS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-MBS-SER-NT-ST                                         
                                     TO MBS-SERIAL-STTS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-ASST-COMMENT-ST                                       
                                     TO ASSET-CMNT-STTS-CD OF DCLVASSET         
           MOVE W-NSCC-AT-PHSCL-SEQ-NBR                                         
                                     TO PHSCL-SEQ-NBR      OF DCLVASSET         
           MOVE W-NSCC-AT-LGCL-SEQ-NBR                                          
                                     TO LGCL-SEQ-NBR       OF DCLVASSET         
           MOVE W-NSCC-AT-TRAN-TYPE                                             
                                     TO TRANS-TYPE-CD      OF DCLVASSET         
           MOVE W-NSCC-AT-TFR-TYPE                                              
                                     TO TRNFR-TYPE-CD      OF DCLVASSET         
           MOVE W-NSCC-AT-SUB-PART-NBR                                          
                                     TO SBMTG-PRTCP-NBR    OF DCLVASSET         
           MOVE W-NSCC-AT-TRAN-REF-ID                                           
                                     TO TRANS-RFRN-ID-CD   OF DCLVASSET         
           MOVE W-NSCC-AT-ASSET-PRC-CATG                                        
                                     TO ASSET-PRC-CTGY-CD  OF DCLVASSET         
           MOVE W-NSCC-AT-OPT-CATG                                              
                                     TO OPTN-CTGY-CD       OF DCLVASSET         
           MOVE W-NSCC-AT-STL-LOC                                               
                                     TO STTLM-LCTN-CD      OF DCLVASSET         
           IF   W-NSCC-AT-STL-LOC-RSN-CD = 'NSET'                               
                MOVE 'XSET'          TO W-NSCC-AT-STL-LOC-RSN-CD                
           END-IF                                                               
           MOVE W-NSCC-AT-STL-LOC-RSN-CD                                        
                                     TO STTLM-RSN-CD       OF DCLVASSET         
           MOVE W-NSCC-AT-SEC-CNTRY-CD                                          
                                     TO ISIN-CNTRY-CD      OF DCLVASSET         
           MOVE W-NSCC-AT-SEC-ID                                                
                                     TO ISIN-SEC-ISSUE-CD  OF DCLVASSET         
           MOVE W-NSCC-AT-SEC-CHKDGT                                            
                                     TO ISIN-SEC-CDG-CD    OF DCLVASSET         
           MOVE W-NSCC-AT-ASSET-DESC                                            
                                     TO ASSET-DESC-TXT     OF DCLVASSET         
           MOVE W-NSCC-AT-ASSET-QTY-RQIND                                       
                                     TO ASSET-RQST-QTY-CD  OF DCLVASSET         
           MOVE W-NSCC-AT-ASSET-REQ-TRNCD                                       
                                     TO AST-RQST-TRANS-CD  OF DCLVASSET         
                                                                                
           PERFORM 5101-REFORMAT-ASSET-QTY THRU 5101-EXIT                       
           MOVE W-QTY-N              TO ASSET-QTY          OF DCLVASSET         
           MOVE W-QTY-N              TO W-ASSET-QTY W-ASSET-QTY-X               
                                                                                
           PERFORM 5102-REFORMAT-ASSET-PCT THRU 5102-EXIT                       
           MOVE W-QTY-N              TO ASSET-PCT          OF DCLVASSET         
                                                                                
           IF  W-NSCC-AT-OPT-CATG > '00'                                        
DJ0009       IF  W-NSCC-AT-TFR-TYPE = 'PTR'                                     
DJ0009       AND W-NSCC-STATUS      = '500'                                     
LRM029       AND W-DSTBN-SIDE-CD = 'R'                                          
DJ0009         IF W-NSCC-ATO-OPT-BS-IND = 'B'                                   
DJ0009            MOVE 'L'           TO W-NSCC-AT-POS-CD                        
DJ0009         ELSE                                                             
DJ0009            MOVE 'S'           TO W-NSCC-AT-POS-CD                        
DJ0009         END-IF                                                           
DJ0009       ELSE                                                               
               IF W-NSCC-ATO-OPT-BS-IND = 'B'                                   
                  MOVE 'S'           TO W-NSCC-AT-POS-CD                        
               ELSE                                                             
                  MOVE 'L'           TO W-NSCC-AT-POS-CD                        
               END-IF                                                           
DJ0009       END-IF                                                             
           END-IF                                                               
                                                                                
           MOVE W-NSCC-AT-POS-CD                                                
                                     TO PSTN-CD            OF DCLVASSET         
           MOVE W-NSCC-AT-ISO-CURCY-CD                                          
                                     TO ISO-CRNCY-CD       OF DCLVASSET         
                                                                                
           PERFORM 5103-REFORMAT-ASSET-AMT THRU 5103-EXIT                       
           MOVE W-QTY-N              TO ASSET-AMT          OF DCLVASSET         
           MOVE W-QTY-N              TO W-ASSET-AMT W-ASSET-AMT-X               
                                                                                
           MOVE W-NSCC-AT-BEARER-BOND                                           
                                     TO BEARER-BOND-CD     OF DCLVASSET         
           IF  W-NSCC-AT-CASH-MRGN-SHTCD = ' '                                  
               MOVE 'C'              TO W-NSCC-AT-CASH-MRGN-SHTCD               
           END-IF                                                               
           MOVE W-NSCC-AT-CASH-MRGN-SHTCD                                       
                                     TO CSH-MGN-SHRT-CD    OF DCLVASSET         
           MOVE W-NSCC-AT-WHN-ISS-IND                                           
                                     TO WHI-CD             OF DCLVASSET         
           MOVE W-NSCC-AT-TFR-TYPE-RSN                                          
                                     TO TRNFR-TYPE-RSN-CD  OF DCLVASSET         
           MOVE W-NSCC-AT-MBS-SER-NT                                            
                                     TO MBS-SERIAL-NBR     OF DCLVASSET         
           MOVE W-NSCC-AT-ASST-COMMENT                                          
                                     TO ASSET-CMNT-TXT     OF DCLVASSET         
DJ0024     IF  W-NSCC-AT-DTC-SUB-ISSUE-TYPE = 'A'                               
DJ0024         MOVE 'Y'              TO AUCTION-RT-IND     OF DCLVASSET         
DJ0024               DISPLAY 'INP=' W-INFILE-CNT                                
DJ0024                        ' ' W-NSCC-KEY-CLIENT-NBR                         
DJ0024                        ' ' W-NSCC-ACAT-CTL-NBR                           
DJ0024                        ' ' W-ASSET-SEQ-NBR                               
DJ0024                        ' ' W-NSCC-AT-TRAN-TYPE                           
DJ0024                        ' ' W-NSCC-AT-TFR-TYPE                            
DJ0024                    ' SEC=' W-NSCC-AT-SEC-ID                              
DJ0024                    ' AUCTION RATE SECURITY'                              
DJ0024     ELSE                                                                 
DJ0024         MOVE 'N'              TO AUCTION-RT-IND     OF DCLVASSET         
DJ0024     END-IF                                                               
                                                                                
           IF (W-NSCC-AT-OP-LEN                                                 
           AND W-NSCC-AT-OPT-CATG > '00')                                       
               PERFORM 5110-MOVE-OPTN-TO-ACTIVE THRU 5110-EXIT                  
           ELSE                                                                 
              IF  W-NSCC-AT-MF-LEN                                              
                  PERFORM 5120-MOVE-MF-TO-ACTIVE   THRU 5120-EXIT               
              END-IF                                                            
           END-IF.                                                              
                                                                                
LRM038     IF W-DSTBN-SIDE-CD = 'D'                                             
LRM038        IF W-NSCC-AT-ASST-COMMENT(1:18)  =  'ORIGINAL CURRENCY '          
LRM038        AND W-NSCC-AT-ASST-COMMENT(19:3) NUMERIC                          
LRM038           MOVE W-NSCC-AT-ASST-COMMENT(19:3) TO                           
LRM038                                   CRNCY-CD OF DCLVASSET                  
LRM039        ELSE                                                              
LRM039        IF W-NSCC-AT-ISO-CURCY-CD NOT = 'USD' AND SPACES                  
LRM039           MOVE SPACES TO CURLOOK-DATA                                    
LRM039           MOVE W-NSCC-AT-ISO-CURCY-CD  TO CU-ARGUMENT-X                  
LRM039           MOVE 'DTC CODE REQUESTED' TO CU-DTC-CD                         
LRM039           CALL CURLOOK USING CURLOOK-DATA                                
LRM039           IF CU-RETURN NOT = SPACE                                       
LRM039              DISPLAY 'UNKNOWN ISO CURRENCY IN 5100- FCURR  DLVY '        
LRM039                'BAL - CURRENCY ' W-NSCC-AT-ISO-CURCY-CD                  
LRM039           ELSE                                                           
LRM039              MOVE CU-NUMBER  TO CRNCY-CD OF DCLVASSET                    
LRM038     END-IF.                                                              
                                                                                
       5100-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  REFORMAT ASSET QTY - UP TO 4 DECIMAL PLACES                            
      *****************************************************************         
       5101-REFORMAT-ASSET-QTY  SECTION.                                        
                                                                                
           MOVE W-NSCC-AT-ASSET-QTY      TO W-QTY-X                             
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
                       UNTIL (W-DEC-PTR > 4 OR W-QTY-PTR > 17)                  
                       MOVE W-QTY-BYTE(W-QTY-PTR)                               
                                         TO W-DEC-BYTE(W-DEC-PTR)               
                       ADD 1        TO W-DEC-PTR                                
               END-PERFORM                                                      
           ELSE                                                                 
               MOVE W-QTY                TO W-INT                               
           END-IF.                                                              
           MOVE W-INT                    TO W-QTY-INT.                          
           MOVE W-DEC                    TO W-QTY-DEC.                          
LRM        IF W-QTY-N NOT NUMERIC                                               
LRM            MOVE ZEROS TO W-QTY-N                                            
LRM            DISPLAY 'WIPED GARBAGE QTY FOR '                                 
LRM                               W-INFILE-CNT                                  
LRM                           ' ' W-NSCC-KEY-CLIENT-NBR                         
LRM                           ' ' W-NSCC-ACAT-CTL-NBR                           
LRM                           ' ' W-ASSET-SEQ-NBR                               
LRM                     ' VALUE ' W-NSCC-AT-ASSET-QTY                           
LRM        END-IF.                                                              
                                                                                
       5101-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  REFORMAT ASSET PCT - UP TO 4 DECIMAL PLACES                            
      *****************************************************************         
       5102-REFORMAT-ASSET-PCT  SECTION.                                        
                                                                                
           MOVE 0                        TO W-QTY-X                             
           MOVE W-NSCC-AT-ASSET-PCT      TO W-QTY-X(3:15)                       
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
                                                                                
       5102-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  REFORMAT ASSET AMT - UP TO 4 DECIMAL PLACES                            
      *                       IF ISO-CURR = USD  - UP TO 2 DECIMAL              
      *                       IF ISO-CURR = FCUR - UP TO 4 DECIMAL              
      *****************************************************************         
       5103-REFORMAT-ASSET-AMT  SECTION.                                        
                                                                                
           MOVE W-NSCC-AT-ASSET-AMT      TO W-QTY-X                             
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
LRM        IF W-QTY-N NOT NUMERIC                                               
LRM            MOVE ZEROS TO W-QTY-N                                            
LRM            DISPLAY 'WIPED GARBAGE AMT FOR '                                 
LRM                               W-INFILE-CNT                                  
LRM                           ' ' W-NSCC-KEY-CLIENT-NBR                         
LRM                           ' ' W-NSCC-ACAT-CTL-NBR                           
LRM                           ' ' W-ASSET-SEQ-NBR                               
LRM                     ' VALUE ' W-NSCC-AT-ASSET-AMT                           
LRM        END-IF.                                                              
                                                                                
       5103-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  MOVE OPTN FIELDS TO ACTIVE TABLE                                       
      *****************************************************************         
       5110-MOVE-OPTN-TO-ACTIVE SECTION.                                        
                                                                                
           INITIALIZE DCLVOPTN                                                  
           MOVE W-NSCC-KEY-CLIENT-NBR                                           
                                     TO CLIENT-NBR         OF DCLVOPTN.         
           MOVE W-NSCC-ACAT-CTL-NBR                                             
                                     TO ACAT-CONTROL-NBR   OF DCLVOPTN.         
           MOVE W-ASSET-SEQ-NBR                                                 
                                     TO ASSET-SEQ-NBR      OF DCLVOPTN.         
                                                                                
           MOVE W-NSCC-AT-OPT-BYDEL-IND-ST                                      
                                     TO BS-STTS-CD         OF DCLVOPTN.         
           MOVE W-NSCC-AT-OPT-PC-IND-ST                                         
                                     TO PTCL-STTS-CD       OF DCLVOPTN.         
           MOVE W-NSCC-AT-OPT-OC-IND-ST                                         
                                     TO OPT-OPN-CLS-STS-CD OF DCLVOPTN.         
           MOVE W-NSCC-AT-OP-SYMB-ST                                            
                                     TO SYM-STTS-CD        OF DCLVOPTN.         
           MOVE W-NSCC-AT-OP-EXP-DT-ST                                          
                                     TO OPTN-EXPTN-DT-CD   OF DCLVOPTN.         
           MOVE W-NSCC-AT-OP-STKPRC-TRIG-ST                                     
                                     TO STPRC-INTR-STTS-CD OF DCLVOPTN.         
           MOVE W-NSCC-AT-OP-STKPRC-FRCN-ST                                     
                                     TO STPRC-FRCT-STTS-CD OF DCLVOPTN.         
           MOVE W-NSCC-AT-OP-OCC-DEL-NBR-ST                                     
                                     TO OPT-OCC-DLV-STS-CD OF DCLVOPTN.         
           MOVE W-NSCC-AT-OP-OPT-ACCT-TYP-ST                                    
                                     TO OPT-ACT-TYP-STS-CD OF DCLVOPTN.         
           MOVE W-NSCC-AT-SUB-ACCT-ID-ST                                        
                                     TO ACCT-SUB-STTS-CD   OF DCLVOPTN.         
           MOVE W-NSCC-AT-OP-COMMENT-ST                                         
                                     TO OPTN-CMNT-STTS-CD  OF DCLVOPTN.         
           MOVE W-NSCC-ATO-OPT-BS-IND                                           
                                     TO BS-CD              OF DCLVOPTN.         
           MOVE W-NSCC-ATO-OPT-PC-IND                                           
                                     TO PTCL-CD            OF DCLVOPTN.         
           MOVE W-NSCC-ATO-OPT-OC-IND                                           
                                     TO OPTN-OPN-CLSD-CD   OF DCLVOPTN.         
           MOVE W-NSCC-ATO-OPT-SYM                                              
                                     TO SYM-CD             OF DCLVOPTN.         
                                                                                
           INITIALIZE                   W-DATE                                  
LRM032**** IF L-STREAM-IND = 'Q'                                                
LRM029          MOVE W-NSCC-ATO-OPT-EXP-CC-NEW TO W-DATE-CC                     
LRM029          MOVE W-NSCC-ATO-OPT-EXP-YY-NEW TO W-DATE-YY                     
LRM029          MOVE W-NSCC-ATO-OPT-EXP-MM-NEW TO W-DATE-MM                     
LRM029          MOVE W-NSCC-ATO-OPT-EXP-DD-NEW TO W-DATE-DD                     
LRM029**** ELSE                                                                 
      **** IF   W-NSCC-ATO-OPT-EXP-DT > ' '                                     
      ****      MOVE W-NSCC-ATO-OPT-EXP-CC  TO W-DATE-CC                        
      ****      MOVE W-NSCC-ATO-OPT-EXP-YY  TO W-DATE-YY                        
      ****      MOVE W-NSCC-ATO-OPT-EXP-MM  TO W-DATE-MM                        
      ****      MOVE '01'                   TO W-DATE-DD                        
      **** ELSE                                                                 
      ****      DISPLAY 'INP=' W-INFILE-CNT                                     
      ****              ' OPT-EXP-DT(MMYYCC) IS INVALID: '                      
      ****                                  W-NSCC-ATO-OPT-EXP-DT               
      ****              '  DEFAULT TO 0001-01-01'                               
      ****      MOVE '00'                   TO W-DATE-CC                        
      ****      MOVE '01'                   TO W-DATE-YY                        
      ****      MOVE '01'                   TO W-DATE-MM                        
      ****      MOVE '01'                   TO W-DATE-DD                        
      **** END-IF                                                               
      **** IF   W-NSCC-ATO-OPT-EXP-MM > '12'                                    
      **** AND  W-NSCC-ATO-OPT-EXP-CC < '19'                                    
      ****      DISPLAY 'INP=' W-INFILE-CNT                                     
      ****              ' OPT-EXP-DT(MMYYCC) IS INVALID: '                      
      ****                                  W-NSCC-ATO-OPT-EXP-DT               
      ****              '  SWAPPING MM AND CC'                                  
      ****      MOVE W-NSCC-ATO-OPT-EXP-MM  TO W-DATE-CC                        
      ****      MOVE W-NSCC-ATO-OPT-EXP-YY  TO W-DATE-YY                        
      ****      MOVE W-NSCC-ATO-OPT-EXP-CC  TO W-DATE-MM                        
      ****      MOVE '01'                   TO W-DATE-DD                        
      **** END-IF.                                                              
           MOVE W-DATE-CC TO WS-DATE-CC                                         
           MOVE W-DATE-YY TO WS-DATE-YY                                         
           MOVE W-DATE-MM TO WS-DATE-MM                                         
           MOVE W-DATE-DD TO WS-DATE-DD                                         
           IF  (W-DATE-MM             > '12' OR                                 
                W-DATE-MM             < '01')                                   
           OR  (W-DATE-CC             < '00')                                   
           OR  (W-DATE-CC             > '99')                                   
           OR  (W-DATE-YY             < '00')                                   
           OR  (W-DATE-YY             > '99')                                   
           OR  WS-DATE-CCYYMMDD NOT NUMERIC                                     
                DISPLAY 'INP=' W-INFILE-CNT                                     
                        ' OPT-EXP-DT(MMYYCC) IS INVALID: '                      
                                            W-NSCC-ATO-OPT-EXP-DT               
                        '  DEFAULT TO 0001-01-01.'                              
                MOVE '00'                   TO W-DATE-CC                        
                MOVE '01'                   TO W-DATE-YY                        
                MOVE '01'                   TO W-DATE-MM                        
                MOVE '01'                   TO W-DATE-DD                        
           END-IF                                                               
                                                                                
           MOVE W-DATE               TO EXPTN-DT           OF DCLVOPTN.         
                                                                                
           MOVE W-NSCC-ATO-OPT-STKPRC-INT                                       
                                     TO STPRC-INTEGER-AMT  OF DCLVOPTN          
                                        STPRC-INTEGER2-AMT OF DCLVOPTN          
LRM032**** IF L-STREAM-IND = 'Q'                                                
              MOVE W-NSCC-ATO-OPT-STKPRC-FRC-NEW                                
                                    TO STPRC-FRCTN-AMT    OF DCLVOPTN.          
LRM029**** ELSE                                                                 
      ****    MOVE W-NSCC-ATO-OPT-STKPRC-FRC                                    
      ****                           TO STPRC-FRCTN-AMT    OF DCLVOPTN          
LRM029**** END-IF.                                                              
           MOVE W-NSCC-ATO-OPT-OCC-DEL-NBR                                      
                                     TO DLVR-OCC-NBR       OF DCLVOPTN.         
           MOVE W-NSCC-ATO-OPT-ACCT-TYP                                         
                                     TO OPTN-ACCT-TYPE-CD  OF DCLVOPTN.         
           MOVE W-NSCC-ATO-SUB-ACCT-ID                                          
                                     TO ACCT-SUB-CD        OF DCLVOPTN.         
           MOVE W-NSCC-ATO-OPT-COMMENT                                          
                                     TO OPTN-CMNT-TXT      OF DCLVOPTN.         
DJ0005     MOVE W-NSCC-ATO-OPT-DEC-FRAC-IND                                     
DJ0005                               TO STPRC-DEC-FRCN-IND OF DCLVOPTN.         
                                                                                
           MOVE EXPTN-DT          OF DCLVOPTN TO W-COMP-EXPTN-DT                
                                                 W-NEXT-EXPTN-DT-X              
           IF   W-NEXT-EXPTN-MM = 12                                            
                ADD 1 TO W-NEXT-EXPTN-YEAR                                      
           ELSE                                                                 
                ADD 1 TO W-NEXT-EXPTN-MM                                        
           END-IF                                                               
           MOVE W-NEXT-EXPTN-DT-X        TO W-NEXT-EXPTN-DT.                    
           MOVE STPRC-INTEGER-AMT OF DCLVOPTN                                   
                                            TO W-COMP-STPRC-INTEGER-AMT         
           MOVE STPRC-FRCTN-AMT   OF DCLVOPTN TO W-COMP-STPRC-FRCTN-AMT.        
                                                                                
           MOVE ' ' TO W-ACTIOPN-FND-SW                                         
           IF  W-SAVE-DIST-PARTICIPANT = W-SAVE-SUB-PART-NBR                    
               PERFORM 5610-SELECT-ACTIOPN THRU 5610-EXIT                       
           END-IF.                                                              
                                                                                
       5110-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  MOVE MF   FIELDS TO ACTIVE TABLE                                       
      *****************************************************************         
       5120-MOVE-MF-TO-ACTIVE SECTION.                                          
                                                                                
           INITIALIZE DCLVMF                                                    
           MOVE W-NSCC-KEY-CLIENT-NBR                                           
                                     TO CLIENT-NBR         OF DCLVMF.           
***********MOVE W-NSCC-DIST-SIDE                                                
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-DEL-NBR                      
               MOVE 'D'              TO DSTBN-SIDE-CD      OF DCLVMF            
           ELSE                                                                 
               MOVE 'R'              TO DSTBN-SIDE-CD      OF DCLVMF            
           END-IF                                                               
                                                                                
           MOVE W-NSCC-ACAT-CTL-NBR                                             
                                     TO ACAT-CONTROL-NBR   OF DCLVMF.           
           MOVE W-ASSET-SEQ-NBR                                                 
                                     TO ASSET-SEQ-NBR      OF DCLVMF.           
                                                                                
           INITIALIZE                   W-DATE                                  
LRM005     IF W-NSCC-AT-TFR-TYPE = 'MFC'                                        
LRM005        IF W-NSCC-ATF-FUND-RE-REG-DT > ' '                                
LRM005          MOVE W-NSCC-ATF-FUND-RE-REG-DT (1:4) TO W-DATE-YEAR             
LRM005          MOVE W-NSCC-ATF-FUND-RE-REG-DT (5:2) TO W-DATE-MM               
LRM005          MOVE W-NSCC-ATF-FUND-RE-REG-DT (7:2) TO W-DATE-DD               
LRM005        ELSE                                                              
LRM005          MOVE '0001'                 TO W-DATE-YEAR                      
LRM005          MOVE '01'                   TO W-DATE-MM                        
LRM005          MOVE '01'                   TO W-DATE-DD                        
LRM005        END-IF                                                            
LRM005     ELSE                                                                 
              IF   W-NSCC-PROC-DATE > ' '                                       
                MOVE W-NSCC-PROC-DATE (1:4) TO W-DATE-YEAR                      
                MOVE W-NSCC-PROC-DATE (5:2) TO W-DATE-MM                        
                MOVE W-NSCC-PROC-DATE (7:2) TO W-DATE-DD                        
              ELSE                                                              
                MOVE '0001'                 TO W-DATE-YEAR                      
                MOVE '01'                   TO W-DATE-MM                        
                MOVE '01'                   TO W-DATE-DD                        
              END-IF                                                            
LRM005     END-IF.                                                              
           MOVE W-DATE               TO PRCS-DT            OF DCLVMF.           
                                                                                
           MOVE W-NSCC-REG-IND                                                  
                                     TO RGSTN-CD           OF DCLVMF.           
           MOVE W-NSCC-AT-FND-CUS-ACCT-ST                                       
                                     TO FND-ACT-NBR-STS-CD OF DCLVMF.           
           MOVE W-NSCC-AT-PHSCL-SHR-IND-ST                                      
                                     TO BK-PHSC-SHR-STS-CD OF DCLVMF.           
           MOVE W-NSCC-AT-NTWRK-CTL-IND-ST                                      
                                     TO NTWRK-CNTL-STTS-CD OF DCLVMF.           
           MOVE W-NSCC-AT-ACCT-TYP-IND-ST                                       
                                     TO ACCT-TYPE-STTS-CD  OF DCLVMF.           
           MOVE W-NSCC-AT-DIV-CD-ST                                             
                                     TO DVDND-STTS-CD      OF DCLVMF.           
           MOVE W-NSCC-AT-DIV-PAYEE-IND-ST                                      
                                     TO DVDND-PYE-STTS-CD  OF DCLVMF.           
           MOVE W-NSCC-AT-EXEC-BRKR-ST                                          
                                     TO BRKR-EXCTG-STTS-CD OF DCLVMF.           
           MOVE W-NSCC-AT-FR-FUL-PART-IND-ST                                    
                                     TO MF-FUL-PRTL-STS-CD OF DCLVMF.           
           MOVE W-NSCC-ATF-CUS-ACCT                                             
                                     TO FNBR               OF DCLVMF.           
           MOVE W-NSCC-ATF-PHSCL-SHR-IND                                        
                                     TO BK-PHSCL-SHR-CD    OF DCLVMF.           
           MOVE W-NSCC-ATF-NTWRK-CTL-IND                                        
                                     TO NTWRK-CNTL-CD      OF DCLVMF.           
           MOVE W-NSCC-ATF-ACCT-TYP-IND                                         
                                     TO ACCT-TYPE-CD       OF DCLVMF.           
                                                                                
*          IF   W-NSCC-ATF-DIV-CD = '0' OR '2' OR '3' OR '4'                    
                MOVE 'C'             TO DVDND-CD           OF DCLVMF            
           ELSE                                                                 
                MOVE 'R'             TO DVDND-CD           OF DCLVMF            
           END-IF                                                               
*          IF   W-NSCC-ATF-DIV-CD = '0' OR '2' OR '5' OR '7'                    
                MOVE 'C'             TO LTCG-CD            OF DCLVMF            
           ELSE                                                                 
                MOVE 'R'             TO LTCG-CD            OF DCLVMF            
           END-IF                                                               
*          IF   W-NSCC-ATF-DIV-CD = '0' OR '4' OR '5' OR '6'                    
                MOVE 'C'             TO STCG-CD            OF DCLVMF            
           ELSE                                                                 
                MOVE 'R'             TO STCG-CD            OF DCLVMF            
           END-IF                                                               
                                                                                
           MOVE W-NSCC-ATF-DIV-PAYEE-IND                                        
                                     TO DVDND-PAYEE-CD     OF DCLVMF.           
           MOVE W-NSCC-ATF-EXEC-BRKR                                            
                                     TO BRKR-EXCTG-NBR     OF DCLVMF.           
           MOVE W-NSCC-ATF-FULL-PART-IND                                        
                                     TO MF-FULL-PRTL-CD    OF DCLVMF.           
DJ0005     MOVE W-NSCC-ATF-FUND-AC-NBR-RCV                                      
                                     TO FCST-ACCT-RCVR-NBR OF DCLVMF.           
DJ0005     MOVE W-NSCC-AT-MF-ACCT-NBR-RCV-ST                                    
                                     TO FCST-RCVR-STTS-CD  OF DCLVMF.           
                                                                                
       5120-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR INIT-TABLE ASSETS THAT ARE TO BE MOVED TO ACTIVE TABLE,            
      *  POPULATE ACTIVE-TABLE FIELDS THAT ARE NOT ON THE INIT-TABLE            
      *  LOOK UP NON NSCC FIELDS                                                
      *****************************************************************         
       5200-EDIT-ADD        SECTION.                                            
           MOVE '5200-EDIT-ADD               ' TO W-ROUTINE-1.                  
                                                                                
           MOVE W-PGM-NAME           TO PRGM-NM            OF DCLVASSET         
           MOVE ' '                  TO CICS-TERM-ID-CD    OF DCLVASSET         
           MOVE W-CURRENT-TIMESTAMP  TO CRT-TMSTP          OF DCLVASSET         
           MOVE W-CURRENT-TIMESTAMP  TO UPDT-TMSTP         OF DCLVASSET         
           MOVE ' '                  TO NSCC-PEND-CD       OF DCLVASSET         
                                                                                
           MOVE ' '                 TO NSCC-NON-ADP-IND   OF DCLVASSET          
                                                                                
           MOVE ' '                 TO SECURITY-ADP-NBR   OF DCLVASSET          
           MOVE ' '                 TO RCL-SENT-NSCC-IND  OF DCLVASSET          
           MOVE ' '                 TO FAIL-OPEN-CAGE-IND OF DCLVASSET          
           MOVE ' '                 TO FAIL-SENT-CAGE-IND OF DCLVASSET          
           MOVE ' '                 TO FRV-SENT-NSCC-IND  OF DCLVASSET          
           MOVE 'N'                 TO ISIN-SEC-EXCPT-IND OF DCLVASSET          
                                                                                
           MOVE 'N' TO W-ACTIAST-FND-SW                                         
           MOVE ' ' TO DCLACTIAST                                               
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-SUB-PART-NBR                 
               PERFORM 6000-SELECT-ACTIAST THRU 6000-EXIT                       
DJ0006***GET CAGE TAG NBR FROM ACTIAST FILE IF WE ARE THE DELIVERER             
DJ0011         IF (W-NSCC-AT-TFR-TYPE = 'FRV' OR 'MFC' OR 'RCL')                
DJ0006         AND W-ACTIAST-FND-SW = 'Y'                                       
DJ0006             MOVE CAGE-TAG-NBR  OF DCLACTIAST                             
DJ0006                                TO CAGE-TAG-NBR   OF DCLVASSET            
DJ0011             MOVE SCRTY-866-NBR OF DCLACTIAST                             
DJ0011                                TO SCRTY-866-NBR  OF DCLVASSET            
DJ0011             MOVE ASSET-866-QTY OF DCLACTIAST                             
DJ0011                                TO ASSET-866-QTY  OF DCLVASSET            
DJ0006             DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0006                        ' ' W-NSCC-KEY-CLIENT-NBR                         
DJ0006                        ' ' W-NSCC-ACAT-CTL-NBR                           
DJ0006                        ' ' W-ASSET-SEQ-NBR                               
DJ0006                        ' ' W-NSCC-AT-TRAN-TYPE                           
DJ0006                        ' ' W-NSCC-AT-TFR-TYPE                            
DJ0006                    ' DST=' W-DSTBN-SIDE-CD                               
DJ0011                    ' TAG-NBR='                                           
DJ0006                                CAGE-TAG-NBR   OF DCLVASSET               
DJ0011                    ' SEC-866='                                           
DJ0011                                SCRTY-866-NBR  OF DCLVASSET               
DJ0011                    ' QTY-866='                                           
DJ0011                                ASSET-866-QTY  OF DCLVASSET               
DJ0006         END-IF                                                           
           END-IF                                                               
                                                                                
DJ0006***GET CAGE TAG NBR FROM HISTORY FILE IF WE ARE THE RECEIVER              
DJ0006     IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-RCV-NBR                      
DJ0011     AND (W-NSCC-AT-TFR-TYPE = 'FRV' OR 'MFC' OR 'RCL')                   
DJ0006         PERFORM 5670-SELECT-VASTHSTY THRU 5670-EXIT                      
DJ0006         IF  W-VASTHSTY-FND-SW = 'Y'                                      
DJ0013             IF FAIL-OPEN-CAGE-IND OF DCLVASTHSTY = 'N'                   
DJ0013                MOVE FAIL-OPEN-CAGE-IND OF DCLVASTHSTY                    
DJ0013                                TO W-FAIL-OPEN-CAGE-IND                   
DJ0013             END-IF                                                       
DJ0006             MOVE CAGE-TAG-NBR  OF DCLVASTHSTY                            
DJ0006                                TO CAGE-TAG-NBR   OF DCLVASSET            
DJ0011             MOVE SCRTY-866-NBR OF DCLVASTHSTY                            
DJ0011                                TO SCRTY-866-NBR  OF DCLVASSET            
DJ0011            IF SCRTY-866-NBR OF DCLVASTHSTY > SPACES                      
DJ0011            AND ASSET-QTY     OF DCLVASTHSTY NOT = 0                      
DJ0011              COMPUTE ASSET-866-QTY OF DCLVASSET =                        
DJ0011             (ASSET-QTY OF DCLVASSET / ASSET-QTY OF DCLVASTHSTY)          
DJ0011                                 * ASSET-866-QTY OF DCLVASTHSTY           
DJ0011                ON SIZE ERROR                                             
DJ0011                   MOVE ZERO TO ASSET-866-QTY OF DCLVASSET                
DJ0011              END-COMPUTE                                                 
DJ0011            END-IF                                                        
LRM043            MOVE ASSET-QTY OF DCLVASTHSTY TO                              
LRM043                               MEMO-ORG-RVRSL-QTY OF DCLVASSET            
DJ0006             DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0006                        ' ' W-NSCC-KEY-CLIENT-NBR                         
DJ0006                        ' ' W-NSCC-ACAT-CTL-NBR                           
DJ0006                        ' ' W-ASSET-SEQ-NBR                               
DJ0006                        ' ' W-NSCC-AT-TRAN-TYPE                           
DJ0006                        ' ' W-NSCC-AT-TFR-TYPE                            
DJ0006                    ' DST=' W-DSTBN-SIDE-CD                               
DJ0006                    ' CTL=' W-SAVE-CNTL-ASTD-NBR                          
DJ0011                    ' TAG-NBR='                                           
DJ0006                                CAGE-TAG-NBR   OF DCLVASSET               
DJ0011                    ' SEC-866='                                           
DJ0011                                SCRTY-866-NBR  OF DCLVASSET               
DJ0011                    ' QTY-866='                                           
DJ0011                                ASSET-866-QTY  OF DCLVASSET               
DJ0006             DISPLAY '    '                                               
DJ0013                     'W-FAIL-OPEN-CAGE-IND='                              
DJ0013                                W-FAIL-OPEN-CAGE-IND                      
DJ0006         END-IF                                                           
DJ0006     END-IF                                                               
                                                                                
LRM042***GET SEQUENCE NUMBER FROM HISTORY FILE WHEN WE ARE THE DELIVERER        
LRM042***       FOR FRV REJECT                                                  
LRM042     IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-DEL-NBR                      
LRM042     AND W-NSCC-AT-TFR-TYPE = 'FRV'                                       
LRM042     AND INFILE-REJECT                                                    
LRM042         PERFORM 5680-SELECT-VASTHSTY-DLVR THRU 5680-EXIT                 
LRM042         IF  W-VASTHSTY-FND-SW = 'Y'                                      
LRM042         AND FAIL-OPEN-CAGE-IND OF DCLVASTHSTY = 'R'                      
LRM042             PERFORM 5685-UPDATE-VASTHSTY-CAGE THRU 5685-EXIT             
LRM042         END-IF                                                           
LRM042     END-IF.                                                              
                                                                                
LRM031     MOVE ZERO TO WK-MS-CLOSING-PRICE.                                    
           IF (W-NSCC-AT-OP-LEN                                                 
           AND W-NSCC-AT-OPT-CATG > '00')                                       
TEST           DISPLAY 'WE FOUND AN OPTION'                                     
LRM029             PERFORM 6950-GETADPNO-OPTION THRU 6950-EXIT                  
           ELSE                                                                 
DJ0020         IF W-NSCC-AT-STL-LOC = '40' OR '45'                              
DJ0020            CONTINUE                                                      
DJ0020         ELSE                                                             
                  PERFORM 6700-GETMSDC THRU 6700-EXIT                           
DJ0020         END-IF                                                           
                                                                                
               IF  W-ACTIAST-FND-SW = 'Y'                                       
               AND ASSET-DESC-TXT OF DCLACTIAST NOT = ' '                       
                   MOVE ASSET-DESC-TXT OF DCLACTIAST                            
                                      TO ASSET-DESC-TXT OF DCLVASSET            
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  W-NSCC-AT-OPT-CATG     > '00'                                    
             IF (ASSET-DESC-TXT OF DCLVASSET (1:60) = ' ')                      
                  MOVE W-OPT-DESC TO ASSET-DESC-TXT OF DCLVASSET  (1:60)        
             ELSE                                                               
              IF (ASSET-DESC-TXT OF DCLVASSET (31:60) = ' ')                    
                  MOVE W-OPT-DESC TO ASSET-DESC-TXT OF DCLVASSET (31:60)        
              ELSE                                                              
               IF (ASSET-DESC-TXT OF DCLVASSET (61:60) = ' ')                   
                  MOVE W-OPT-DESC TO ASSET-DESC-TXT OF DCLVASSET (61:60)        
               ELSE                                                             
                IF (ASSET-DESC-TXT OF DCLVASSET (91:30) = ' ')                  
                  MOVE W-OPT-DESC TO ASSET-DESC-TXT OF DCLVASSET (91:30)        
                END-IF                                                          
               END-IF                                                           
              END-IF                                                            
             END-IF                                                             
           END-IF.                                                              
                                                                                
           IF  W-NSCC-AT-OP-LEN                                                 
             MOVE W-PGM-NAME          TO PRGM-NM            OF DCLVOPTN         
             MOVE ' '                 TO CICS-TERM-ID-CD    OF DCLVOPTN         
             MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP          OF DCLVOPTN         
             MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP         OF DCLVOPTN         
             MOVE ' '                 TO ACCT-TYPE-MSMT-IND OF DCLVOPTN         
           ELSE                                                                 
              IF  W-NSCC-AT-MF-LEN                                              
                  MOVE W-PGM-NAME          TO PRGM-NM         OF DCLVMF         
                  MOVE ' '                 TO CICS-TERM-ID-CD OF DCLVMF         
                  MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP       OF DCLVMF         
                  MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP      OF DCLVMF         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF  W-EDIT-RECEIVE-SW       = 'Y'                                    
               PERFORM 5350-FULL-RECEIVE-EDIT THRU 5350-EXIT                    
           END-IF.                                                              
                                                                                
LRM031     IF  BH-ACAT-REJ-SUB-PENNY-PRICE-ID = '1'                             
LRM031     AND W-DSTBN-SIDE-CD = 'R'                                            
LRM031     AND (W-NSCC-AT-STL-LOC NOT =                                         
LRM031                '35' AND '40' AND '45' AND '55' AND '60')                 
LRM031     AND (W-NSCC-AT-TFR-TYPE = 'RCR')                                     
LRM031     AND (W-NSCC-STATUS = '200')                                          
LRM031     AND W-MSD-FOUND                                                      
LRM031     AND ASSET-QTY OF DCLVASSET > ZERO                                    
LRM031         IF WK-MS-CLOSING-PRICE > 0                                       
LRM031         AND WK-MS-CLOSING-PRICE < .01                                    
LRM031         MOVE 'Y' TO W-REJ-PENNY                                          
LRM031         ADD   1  TO W-REJ-PENNY-CNT                                      
LRM031         MOVE 'Y' TO W-SAVE-EXCEPTION-SW                                  
LRM031               DISPLAY 'INP=' W-INFILE-CNT                                
LRM031                        ' ' W-NSCC-KEY-CLIENT-NBR                         
LRM031                        ' ' W-NSCC-ACAT-CTL-NBR                           
LRM031                        ' ' W-ASSET-SEQ-NBR                               
LRM031                        ' ' W-NSCC-AT-TRAN-TYPE                           
LRM031                        ' ' W-NSCC-AT-TFR-TYPE                            
LRM031                    ' DST=' W-DSTBN-SIDE-CD                               
LRM031                    ' REJ-PENNY FLAGGED ON RCR'                           
LRM031         IF  BH-ACAT-REJ-SUB-PENNY-PRICE-RR > 00                          
LRM031             MOVE 'Y' TO W-REJECT-AUTO-SW                                 
LRM031         END-IF                                                           
LRM031     END-IF.                                                              
                                                                                
       5200-EXIT. EXIT.                                                         
      /                                                                         
       5350-FULL-RECEIVE-EDIT    SECTION.                                       
                                                                                
           IF (BH-ACAT-REJ-PEND-REC-CMT-IND = '1'   AND                         
               W-NSCC-AT-ASST-COMMENT > ' ')                                    
               MOVE 'Y' TO W-REJ-CMT                                            
               MOVE 'Y' TO W-SAVE-EXCEPTION-SW                                  
               MOVE 'Y'              TO ASSET-CMNT-STTS-CD OF DCLVASSET         
      ***         DISPLAY 'INP=' W-INFILE-CNT                                   
      ***                     ' ' W-NSCC-KEY-CLIENT-NBR                         
      ***                     ' ' W-NSCC-ACAT-CTL-NBR                           
      ***                     ' ' W-ASSET-SEQ-NBR                               
      ***                     ' ' W-NSCC-AT-TRAN-TYPE                           
      ***                     ' ' W-NSCC-AT-TFR-TYPE                            
      ***                 ' DST=' W-DSTBN-SIDE-CD                               
      ***                 ' REJ-CMT FLAGGED'                                    
               IF  BH-ACAT-REJ-PEND-REC-CMT-CODE > '00'                         
                   MOVE 'Y' TO W-REJECT-AUTO-SW                                 
               END-IF                                                           
           END-IF                                                               
                                                                                
           MOVE ASSET-AMT OF DCLVASSET TO W-ASSET-AMT-X                         
           IF  BH-ACAT-REJ-REC-MARGIN-DEBIT > 0     AND                         
               W-NSCC-AT-STL-LOC            = '40'  AND                         
               W-NSCC-AT-STL-LOC-RSN-CD     = 'DEB' AND                         
               W-NSCC-AT-CASH-MRGN-SHTCD    = 'M'                               
               IF ASSET-AMT OF DCLVASSET > BH-ACAT-REJ-REC-MARGIN-DEBIT         
                  MOVE 'Y' TO W-REJ-MARGIN-DEBIT                                
                  MOVE 'Y' TO W-SAVE-EXCEPTION-SW                               
      ***         DISPLAY 'INP=' W-INFILE-CNT                                   
      ***                     ' ' W-NSCC-KEY-CLIENT-NBR                         
      ***                     ' ' W-NSCC-ACAT-CTL-NBR                           
      ***                     ' ' W-ASSET-SEQ-NBR                               
      ***                     ' ' W-NSCC-AT-TRAN-TYPE                           
      ***                     ' ' W-NSCC-AT-TFR-TYPE                            
      ***                 ' DST=' W-DSTBN-SIDE-CD                               
      ***                      ' MARGIN-DEBIT ' W-ASSET-AMT-X                   
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF BH-ACAT-REJ-REC-ASSET-VALUE  > 0                                  
              IF (W-NSCC-AT-STL-LOC = '45')                                     
              OR (W-NSCC-AT-STL-LOC = '40'  AND                                 
                  W-NSCC-AT-STL-LOC-RSN-CD = 'DEB')                             
                  CONTINUE                                                      
              ELSE                                                              
                IF (W-NSCC-AT-STL-LOC        = '40'    AND                      
                    W-NSCC-AT-STL-LOC-RSN-CD = 'CRED') AND                      
                    ASSET-AMT OF DCLVASSET >                                    
                                           BH-ACAT-REJ-REC-ASSET-VALUE          
                    MOVE 'Y' TO W-REJ-ASSET-VALUE                               
                    MOVE 'Y' TO W-SAVE-EXCEPTION-SW                             
      ***           DISPLAY 'INP=' W-INFILE-CNT                                 
      ***                     ' ' W-NSCC-KEY-CLIENT-NBR                         
      ***                     ' ' W-NSCC-ACAT-CTL-NBR                           
      ***                     ' ' W-ASSET-SEQ-NBR                               
      ***                     ' ' W-NSCC-AT-TRAN-TYPE                           
      ***                     ' ' W-NSCC-AT-TFR-TYPE                            
      ***                 ' DST=' W-DSTBN-SIDE-CD                               
      ***                        ' ASSET-VALUE ' W-ASSET-AMT-X                  
                ELSE                                                            
                  IF PSTN-CD OF DCLVASSET = 'L' AND                             
                     ASSET-AMT OF DCLVASSET >                                   
                                           BH-ACAT-REJ-REC-ASSET-VALUE          
                     MOVE 'Y' TO W-REJ-ASSET-VALUE                              
                     MOVE 'Y' TO W-SAVE-EXCEPTION-SW                            
      ***            DISPLAY 'INP=' W-INFILE-CNT                                
      ***                     ' ' W-NSCC-KEY-CLIENT-NBR                         
      ***                     ' ' W-NSCC-ACAT-CTL-NBR                           
      ***                     ' ' W-ASSET-SEQ-NBR                               
      ***                     ' ' W-NSCC-AT-TRAN-TYPE                           
      ***                     ' ' W-NSCC-AT-TFR-TYPE                            
      ***                 ' DST=' W-DSTBN-SIDE-CD                               
      ***                        ' ASSET-VALUE ' W-ASSET-AMT-X                  
                  END-IF                                                        
                END-IF                                                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF (BH-ACAT-REJ-PEND-REC-DB1-IND = '1'   AND                         
               W-NSCC-AT-STL-LOC            = '40'  AND                         
               W-NSCC-AT-STL-LOC-RSN-CD     = 'DEB' AND                         
               W-NSCC-AT-CASH-MRGN-SHTCD    = 'C')                              
               MOVE 'Y' TO W-REJ-DB1                                            
               MOVE 'Y' TO W-SAVE-EXCEPTION-SW                                  
      ***            DISPLAY 'INP=' W-INFILE-CNT                                
      ***                     ' ' W-NSCC-KEY-CLIENT-NBR                         
      ***                     ' ' W-NSCC-ACAT-CTL-NBR                           
      ***                     ' ' W-ASSET-SEQ-NBR                               
      ***                     ' ' W-NSCC-AT-TRAN-TYPE                           
      ***                     ' ' W-NSCC-AT-TFR-TYPE                            
      ***                 ' DST=' W-DSTBN-SIDE-CD                               
      ***                 ' REJ-DB1 FLAGGED'                                    
               IF  BH-ACAT-REJ-PEND-REC-DB1-CODE > '00'                         
                   MOVE 'Y' TO W-REJECT-AUTO-SW                                 
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF (W-NSCC-AT-STL-LOC            = '30' OR '40' OR '45')             
              CONTINUE                                                          
           ELSE                                                                 
             IF (BH-ACAT-REJ-PEND-REC-SP-IND  = '1')                            
DJ0001         IF (W-NSCC-AT-STL-LOC     = '35' AND                             
DJ0001             W-NSCC-ATO-OPT-BS-IND = 'S')                                 
DJ0001         OR (W-NSCC-AT-STL-LOC NOT = '35' AND                             
DJ0001             W-NSCC-AT-POS-CD      = 'S')                                 
                   MOVE 'Y' TO W-REJ-SP                                         
                   MOVE 'Y' TO W-SAVE-EXCEPTION-SW                              
      ***            DISPLAY 'INP=' W-INFILE-CNT                                
      ***                     ' ' W-NSCC-KEY-CLIENT-NBR                         
      ***                     ' ' W-NSCC-ACAT-CTL-NBR                           
      ***                     ' ' W-ASSET-SEQ-NBR                               
      ***                     ' ' W-NSCC-AT-TRAN-TYPE                           
      ***                     ' ' W-NSCC-AT-TFR-TYPE                            
      ***                 ' DST=' W-DSTBN-SIDE-CD                               
      ***                 ' REJ-SP FLAGGED'                                     
                 IF  BH-ACAT-REJ-PEND-REC-SP-CODE  > '00'                       
                     MOVE 'Y' TO W-REJECT-AUTO-SW                               
                 END-IF                                                         
               END-IF                                                           
             END-IF                                                             
           END-IF                                                               
                                                                                
           IF (BH-ACAT-REJ-PEND-REC-MSD-IND = '1'   AND                         
               W-MSD-NOTFND-SW              = 'Y')                              
               MOVE 'Y' TO W-REJ-MSD                                            
               MOVE 'Y' TO W-SAVE-EXCEPTION-SW                                  
      ***            DISPLAY 'INP=' W-INFILE-CNT                                
      ***                     ' ' W-NSCC-KEY-CLIENT-NBR                         
      ***                     ' ' W-NSCC-ACAT-CTL-NBR                           
      ***                     ' ' W-ASSET-SEQ-NBR                               
      ***                     ' ' W-NSCC-AT-TRAN-TYPE                           
      ***                     ' ' W-NSCC-AT-TFR-TYPE                            
      ***                 ' DST=' W-DSTBN-SIDE-CD                               
      ***                 ' REJ-MSD FLAGGED'                                    
               IF  BH-ACAT-REJ-PEND-REC-MSD-CODE > '00'                         
                   MOVE 'Y' TO W-REJECT-AUTO-SW                                 
               END-IF                                                           
           END-IF                                                               
           IF (BH-ACAT-REJ-PEND-REC-LP-IND  = '1'   AND                         
               W-NSCC-AT-ASSET-PRC-CATG     = 'LPAR')                           
               MOVE 'Y' TO W-REJ-LP                                             
               MOVE 'Y' TO W-SAVE-EXCEPTION-SW                                  
      ***            DISPLAY 'INP=' W-INFILE-CNT                                
      ***                     ' ' W-NSCC-KEY-CLIENT-NBR                         
      ***                     ' ' W-NSCC-ACAT-CTL-NBR                           
      ***                     ' ' W-ASSET-SEQ-NBR                               
      ***                     ' ' W-NSCC-AT-TRAN-TYPE                           
      ***                     ' ' W-NSCC-AT-TFR-TYPE                            
      ***                 ' DST=' W-DSTBN-SIDE-CD                               
      ***                 ' REJ-LP FLAGGED'                                     
               IF  BH-ACAT-REJ-PEND-REC-LP-CODE  > '00'                         
                   MOVE 'Y' TO W-REJECT-AUTO-SW                                 
               END-IF                                                           
           END-IF                                                               
           IF (BH-ACAT-REJ-PEND-REC-OPT-IND = '1'   AND                         
               W-NSCC-AT-OPT-CATG           > '00'  AND                         
               W-NSCC-AT-OP-LEN)                                                
               MOVE 'Y' TO W-REJ-OPT                                            
               MOVE 'Y' TO W-SAVE-EXCEPTION-SW                                  
      ***            DISPLAY 'INP=' W-INFILE-CNT                                
      ***                     ' ' W-NSCC-KEY-CLIENT-NBR                         
      ***                     ' ' W-NSCC-ACAT-CTL-NBR                           
      ***                     ' ' W-ASSET-SEQ-NBR                               
      ***                     ' ' W-NSCC-AT-TRAN-TYPE                           
      ***                     ' ' W-NSCC-AT-TFR-TYPE                            
      ***                 ' DST=' W-DSTBN-SIDE-CD                               
      ***                 ' REJ-OPT FLAGGED'                                    
               IF  BH-ACAT-REJ-PEND-REC-OPT-CODE > '00'                         
                   MOVE 'Y' TO W-REJECT-AUTO-SW                                 
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF  BH-ACAT-REJ-PEND-REC-NTS-IND = '1'                               
DJ0024     AND (W-MSD-NOTFND-SW = 'N')                                          
               MOVE ' '                TO W-VRSTSEC-FND-SW                      
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
                   WHERE CLIENT_NBR      = :W-NSCC-KEY-CLIENT-NBR               
DJ0024             AND SECURITY_ADP_NBR  = :MS-ADP-NO                           
                   AND TRNFR_BRKR_TYPE_CD IN ('R','B')                          
               END-EXEC                                                         
               IF  SQLCODE  =  +0                                               
                   ADD 1 TO W-VRSTSEC-FND-CNT                                   
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                                ' REJ-PEND-REC-NTS'                             
                                ' RESTRICTED CUSIP=' W-NSCC-AT-SEC-ID           
                          ' SEC=' SECURITY-ADP-NBR   OF DCLVRSTSEC              
                         ' MEMO=' TRNFR-MEMO-IND     OF DCLVRSTSEC              
                          ' TFR=' TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC              
                   MOVE 'Y'               TO W-VRSTSEC-FND-SW                   
                   MOVE 'Y' TO W-REJ-NTS                                        
                   MOVE 'Y' TO W-SAVE-EXCEPTION-SW                              
                   IF  BH-ACAT-REJ-PEND-REC-NTS-CODE > '00'                     
                       MOVE 'Y' TO W-REJECT-AUTO-SW                             
                   END-IF                                                       
                   MOVE 'Y'          TO RESTRICTED-IND OF DCLVASSET             
               ELSE                                                             
                   ADD 1 TO W-VRSTSEC-NOTFND-CNT                                
                   MOVE 'N'          TO RESTRICTED-IND OF DCLVASSET             
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF (W-NSCC-AT-STL-LOC = '45')                                        
               CONTINUE                                                         
           ELSE                                                                 
             IF (W-NSCC-AT-STL-LOC = '40'  AND                                  
                 W-NSCC-AT-STL-LOC-RSN-CD = 'DEB')                              
                    SUBTRACT ASSET-AMT OF DCLVASSET FROM W-TOT-AMT-N            
LRM027              IF (CSH-MGN-SHRT-CD OF DCLVASSET = 'C' OR 'M')              
LRM027                 ADD ASSET-AMT OF DCLVASSET TO W-TOT-AMT-TYPES1-2         
LRM027*********       DISPLAY 'ADDED ASSET AMT ' ASSET-AMT OF DCLVASSET         
LRM027*********            ' TOTAL ' W-TOT-AMT-TYPES1-2                         
LRM027              END-IF                                                      
             ELSE                                                               
               IF (W-NSCC-AT-STL-LOC        = '40'    AND                       
                   W-NSCC-AT-STL-LOC-RSN-CD = 'CRED')                           
                         ADD ASSET-AMT OF DCLVASSET   TO W-TOT-AMT-N            
LRM027              IF (CSH-MGN-SHRT-CD OF DCLVASSET = 'C' OR 'M')              
LRM027                 SUBTRACT ASSET-AMT OF DCLVASSET                          
LRM027                                       FROM W-TOT-AMT-TYPES1-2            
LRM027************    DISPLAY 'SUBTR ASSET AMT ' ASSET-AMT OF DCLVASSET         
LRM027************         ' TOTAL ' W-TOT-AMT-TYPES1-2                         
LRM027              END-IF                                                      
               ELSE                                                             
                 IF PSTN-CD OF DCLVASSET = 'S'                                  
                    SUBTRACT ASSET-AMT OF DCLVASSET FROM W-TOT-AMT-N            
                 ELSE                                                           
                         ADD ASSET-AMT OF DCLVASSET   TO W-TOT-AMT-N            
                 END-IF                                                         
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
           IF  BH-ACAT-REJ-REC-TOTL-ACT-VAL > 0                                 
               IF  W-TOT-AMT-N > BH-ACAT-REJ-REC-TOTL-ACT-VAL                   
                   MOVE 'Y' TO W-REJ-TOTL-ACT-VAL                               
                   MOVE 'Y' TO W-SAVE-EXCEPTION-SW                              
               END-IF                                                           
           END-IF.                                                              
                                                                                
DJ0016**   IF (BH-ACAT-REJ-PEND-90DR-IND = '1' AND                              
DJ0016**       W-NSCC-AT-STL-LOC-RSN-CD  = '90DR')                              
DJ0016     IF (W-NSCC-AT-STL-LOC-RSN-CD  = '90DR')                              
DJ0016         MOVE 'Y' TO W-REJ-90DR                                           
DJ0016         MOVE 'Y' TO W-SAVE-EXCEPTION-SW                                  
DJ0016***         DISPLAY 'INP=' W-INFILE-CNT                                   
DJ0016***                     ' ' W-NSCC-KEY-CLIENT-NBR                         
DJ0016***                     ' ' W-NSCC-ACAT-CTL-NBR                           
DJ0016***                     ' ' W-ASSET-SEQ-NBR                               
DJ0016***                     ' ' W-NSCC-AT-TRAN-TYPE                           
DJ0016***                     ' ' W-NSCC-AT-TFR-TYPE                            
DJ0016***                 ' DST=' W-DSTBN-SIDE-CD                               
DJ0016***                 ' REJ-90DR FLAGGED'                                   
DJ0016**       IF  BH-ACAT-REJ-PEND-90DR-CODE > '00'                            
DJ0016**           MOVE 'Y' TO W-REJECT-AUTO-SW                                 
DJ0016**       END-IF                                                           
DJ0016     END-IF.                                                              
                                                                                
DJ0016**   IF (BH-ACAT-REJ-PEND-REGT-IND = '1' AND                              
DJ0016**       W-NSCC-AT-STL-LOC-RSN-CD  = 'REGT')                              
DJ0016     IF (W-NSCC-AT-STL-LOC-RSN-CD  = 'REGT')                              
DJ0016         MOVE 'Y' TO W-REJ-REGT                                           
DJ0016         MOVE 'Y' TO W-SAVE-EXCEPTION-SW                                  
DJ0016***         DISPLAY 'INP=' W-INFILE-CNT                                   
DJ0016***                     ' ' W-NSCC-KEY-CLIENT-NBR                         
DJ0016***                     ' ' W-NSCC-ACAT-CTL-NBR                           
DJ0016***                     ' ' W-ASSET-SEQ-NBR                               
DJ0016***                     ' ' W-NSCC-AT-TRAN-TYPE                           
DJ0016***                     ' ' W-NSCC-AT-TFR-TYPE                            
DJ0016***                 ' DST=' W-DSTBN-SIDE-CD                               
DJ0016***                 ' REJ-REGT FLAGGED'                                   
DJ0016**       IF  BH-ACAT-REJ-PEND-REGT-CODE > '00'                            
DJ0016**           MOVE 'Y' TO W-REJECT-AUTO-SW                                 
DJ0016**       END-IF                                                           
DJ0016     END-IF.                                                              
                                                                                
DJ0024     IF (BH-ACAT-REJ-ARS-SEL-ACT      = '1'   AND                         
DJ0024         W-NSCC-AT-DTC-SUB-ISSUE-TYPE = 'A')                              
DJ0024         MOVE 'Y' TO W-REJ-ARS                                            
DJ0024         ADD   1  TO W-REJ-ARS-CNT                                        
DJ0024         MOVE 'Y' TO W-SAVE-EXCEPTION-SW                                  
DJ0024***            DISPLAY 'INP=' W-INFILE-CNT                                
DJ0024***                     ' ' W-NSCC-KEY-CLIENT-NBR                         
DJ0024***                     ' ' W-NSCC-ACAT-CTL-NBR                           
DJ0024***                     ' ' W-ASSET-SEQ-NBR                               
DJ0024***                     ' ' W-NSCC-AT-TRAN-TYPE                           
DJ0024***                     ' ' W-NSCC-AT-TFR-TYPE                            
DJ0024***                 ' DST=' W-DSTBN-SIDE-CD                               
DJ0024***                 ' REJ-ARS FLAGGED'                                    
DJ0024         IF  BH-ACAT-REJ-ARS-SEL-ACT-ONLINE > 00                          
DJ0024             MOVE 'Y' TO W-REJECT-AUTO-SW                                 
DJ0024         END-IF                                                           
DJ0024     END-IF.                                                              
                                                                                
LRM031     IF  BH-ACAT-REJ-SUB-PENNY-PRICE-ID = '1'                             
LRM031     AND (W-NSCC-AT-STL-LOC NOT =                                         
LRM031                '35' AND '40' AND '45' AND '55' AND '60')                 
LRM031     AND (W-NSCC-AT-TFR-TYPE = 'FUL' OR 'PTD' OR 'PTR')                   
LRM031     AND (W-NSCC-STATUS NOT = '500')                                      
LRM031     AND W-MSD-FOUND                                                      
LRM031     AND ASSET-QTY OF DCLVASSET > ZERO                                    
LRM031         IF WK-MS-CLOSING-PRICE > 0                                       
LRM031         AND WK-MS-CLOSING-PRICE < .01                                    
LRM031         MOVE 'Y' TO W-REJ-PENNY                                          
LRM031         ADD   1  TO W-REJ-PENNY-CNT                                      
LRM031         MOVE 'Y' TO W-SAVE-EXCEPTION-SW                                  
LRM031               DISPLAY 'INP=' W-INFILE-CNT                                
LRM031                        ' ' W-NSCC-KEY-CLIENT-NBR                         
LRM031                        ' ' W-NSCC-ACAT-CTL-NBR                           
LRM031                        ' ' W-ASSET-SEQ-NBR                               
LRM031                        ' ' W-NSCC-AT-TRAN-TYPE                           
LRM031                        ' ' W-NSCC-AT-TFR-TYPE                            
LRM031                    ' DST=' W-DSTBN-SIDE-CD                               
LRM031                    ' REJ-PENNY FLAGGED'                                  
LRM031         IF  BH-ACAT-REJ-SUB-PENNY-PRICE-RR > 00                          
LRM031             MOVE 'Y' TO W-REJECT-AUTO-SW                                 
LRM031         END-IF                                                           
LRM031     END-IF.                                                              
                                                                                
       5350-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR NEW ASSETS FROM OTHER BROKERS,                                     
      *  ADD THE NEW ROW TO THE ACTIVE-TABLE                                    
      *****************************************************************         
       5400-INSERT-ACTIVE SECTION.                                              
           MOVE '5400-INSERT-ACTIVE           ' TO W-ROUTINE-1.                 
                                                                                
           PERFORM 6100-INSERT-VASSET THRU 6100-EXIT                            
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VASSET-ADD-CNT                                        
DJ0002         PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                           
               IF  W-NSCC-AT-OP-LEN                                             
                   PERFORM 5410-INSERT-VOPTN        THRU 5410-EXIT              
               ELSE                                                             
                  IF  W-NSCC-AT-MF-LEN                                          
                      PERFORM 5420-INSERT-VMF          THRU 5420-EXIT           
                  END-IF                                                        
               END-IF                                                           
                                                                                
           ELSE                                                                 
               ADD 1 TO W-VASSET-NOT-ADD-CNT                                    
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
                     DISPLAY 'INP=' W-INFILE-CNT                                
                                ' ' W-NSCC-KEY-CLIENT-NBR                       
                                ' ' W-NSCC-ACAT-CTL-NBR                         
                                ' ' W-ASSET-SEQ-NBR                             
                                ' ' W-NSCC-AT-TRAN-TYPE                         
                                ' ' W-NSCC-AT-TFR-TYPE                          
                            ' DST=' W-DSTBN-SIDE-CD                             
                                      ' VASSET NOT ADDED.'                      
                                      ' SQLCODE=' W-DB2-SQLCODE                 
                              '  IF DUPE(-803), UPDATE IT.'                     
               IF  SQLCODE  =  -803                                             
                      PERFORM 6400-UPDATE-VASSET THRU 6400-EXIT                 
                      IF SQLCODE  =  +0                                         
                         ADD 1 TO W-VASSET-UPD-CNT                              
DJ0002                   PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                 
                         IF W-NSCC-AT-OP-LEN                                    
                            PERFORM 6500-UPDATE-VOPTN  THRU 6500-EXIT           
                         ELSE                                                   
                            IF W-NSCC-AT-MF-LEN                                 
                               PERFORM 6600-UPDATE-VMF THRU 6600-EXIT           
                            END-IF                                              
                         END-IF                                                 
                      ELSE                                                      
                         DISPLAY 'INP=' W-INFILE-CNT                            
                                      ' VASSET NOT UPDATED.'                    
                                      ' SQLCODE = ' W-DB2-SQLCODE               
                         DISPLAY 'CAT515: INPUT  REC ='                         
                         '(' W-NSCC-RECORD ')'                                  
                         DISPLAY 'CAT515: DCLVASSET  ='                         
                         '(' DCLVASSET ')'                                      
                         PERFORM 8000-DISPLAY-KEY THRU 8000-EXIT                
                         PERFORM 8100-SQL-ERROR THRU 8100-EXIT                  
                      END-IF                                                    
*******************END-IF                                                       
               ELSE                                                             
                 IF  SQLCODE  =  -530                                           
                     DISPLAY '    FOREIGN KEY NOT FOUND.'                       
                                      ' VASSET NOT ADDED.'                      
                     PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT                
                 ELSE                                                           
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT515: ERROR INSERTING A ROW INTO VASSET'          
                         ' (ACAT-ASSET TABLE)'                                  
                   DISPLAY 'CAT515: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT515: DCLVASSET  ='                               
                        '(' DCLVASSET ')'                                       
                     PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT                
                     PERFORM  8100-SQL-ERROR THRU 8100-EXIT                     
                 END-IF                                                         
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5400-EXIT. EXIT.                                                         
      /                                                                         
       5410-INSERT-VOPTN  SECTION.                                              
           MOVE '5410-INSERT-VOPTN            ' TO W-ROUTINE-1.                 
                                                                                
           PERFORM 6200-INSERT-VOPTN  THRU 6200-EXIT                            
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VOPTN-ADD-CNT                                         
DJ0002         PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-VOPTN-NOT-ADD-CNT                                     
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
                     DISPLAY 'INP=' W-INFILE-CNT                                
                                      ' VOPTN NOT ADDED.'                       
                                      ' SQLCODE = ' W-DB2-SQLCODE               
***************IF  L-RERUN                                                      
***************AND SQLCODE  =  -803                                             
               IF  SQLCODE  =  -803                                             
                   DISPLAY '   BYPASSING DUPE ON VOPTN. UPDATE IT.'             
                            PERFORM 6500-UPDATE-VOPTN  THRU 6500-EXIT           
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT515: ERROR INSERTING A ROW INTO VOPTN '          
                         ' (ACAT-OPTN  TABLE)'                                  
                   DISPLAY 'CAT515: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT515: DCLVOPTN  ='                                
                        '(' DCLVOPTN ')'                                        
                     PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT                
                   PERFORM  8100-SQL-ERROR THRU 8100-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5410-EXIT. EXIT.                                                         
      /                                                                         
       5420-INSERT-VMF    SECTION.                                              
           MOVE '5420-INSERT-VMF              ' TO W-ROUTINE-1.                 
                                                                                
           PERFORM 6300-INSERT-VMF    THRU 6300-EXIT                            
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VMF-ADD-CNT                                           
DJ0002         PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-VMF-NOT-ADD-CNT                                       
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
                     DISPLAY 'INP=' W-INFILE-CNT                                
                                      ' VMF   NOT ADDED.'                       
                                      ' SQLCODE = ' W-DB2-SQLCODE               
***************IF  L-RERUN                                                      
***************AND SQLCODE  =  -803                                             
               IF  SQLCODE  =  -803                                             
                   DISPLAY '   BYPASSING DUPE ON VMF. UPDATE IT.'               
                               PERFORM 6600-UPDATE-VMF THRU 6600-EXIT           
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT515: ERROR INSERTING A ROW INTO VMF   '          
                         ' (ACAT-MF    TABLE)'                                  
                   DISPLAY 'CAT515: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT515: DCLVMF  ='                                  
                        '(' DCLVMF ')'                                          
                     PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT                
                   PERFORM  8100-SQL-ERROR THRU 8100-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5420-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR CHANGES FROM OTHER BROKERS,                                        
      *  UPDATE THE ROW IN THE ACTIVE-TABLE                                     
      *****************************************************************         
       5500-UPDATE-ACTIVE SECTION.                                              
           MOVE '5500-UPDATE-ACTIVE            ' TO W-ROUTINE-1.                
                                                                                
           PERFORM 6400-UPDATE-VASSET THRU 6400-EXIT                            
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VASSET-UPD-CNT                                        
DJ0002         PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                           
               IF  W-NSCC-AT-OP-LEN                                             
                   PERFORM 5510-UPDATE-VOPTN        THRU 5510-EXIT              
               ELSE                                                             
                  IF  W-NSCC-AT-MF-LEN                                          
                      PERFORM 5520-UPDATE-VMF          THRU 5520-EXIT           
                  END-IF                                                        
               END-IF                                                           
           ELSE                                                                 
               ADD 1 TO W-VASSET-NOT-UPD-CNT                                    
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
                          DISPLAY 'INP=' W-INFILE-CNT                           
                                     ' ' W-NSCC-KEY-CLIENT-NBR                  
                                     ' ' W-NSCC-ACAT-CTL-NBR                    
                                     ' ' W-ASSET-SEQ-NBR                        
                              ' ' W-NSCC-AT-TRAN-TYPE                           
                              ' ' W-NSCC-AT-TFR-TYPE                            
                          ' DST=' W-DSTBN-SIDE-CD                               
                               ' VASSET NOTUPD.'                                
                               'SQLCODE=' W-DB2-SQLCODE                         
             IF SQLCODE  =  +100                                                
                  DISPLAY '    VASSET UPDATE NOT FOUND. INSERT IT.'             
                  PERFORM 5200-EDIT-ADD            THRU 5200-EXIT               
                  PERFORM 5400-INSERT-ACTIVE       THRU 5400-EXIT               
             ELSE                                                               
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT515: ERROR UPDATING A ROW INTO VASSET'           
                         ' (ACAT-ASSET TABLE)'                                  
                   DISPLAY 'CAT515: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT515: DCLVASSET  ='                               
                           '(' DCLVASSET ')'                                    
                   PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT                  
                   PERFORM  8100-SQL-ERROR THRU 8100-EXIT                       
             END-IF                                                             
           END-IF.                                                              
                                                                                
       5500-EXIT. EXIT.                                                         
      /                                                                         
       5510-UPDATE-VOPTN  SECTION.                                              
           MOVE '5510-UPDATE-VOPTN            ' TO W-ROUTINE-1.                 
                                                                                
           PERFORM 6500-UPDATE-VOPTN  THRU 6500-EXIT                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VOPTN-UPD-CNT                                         
DJ0002         PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-VOPTN-NOT-UPD-CNT                                     
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'INP=' W-INFILE-CNT                                      
                               ' VOPTN NOT UPDATED.'                            
                               ' SQLCODE=' W-DB2-SQLCODE                        
                               ' RERUN=' L-RERUN-SW                             
***************IF  L-RERUN                                                      
***************AND SQLCODE  =  +100                                             
               IF  SQLCODE  =  +100                                             
                   PERFORM 6200-INSERT-VOPTN  THRU 6200-EXIT                    
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT515: ERROR UPDATING  A ROW INTO VOPTN '          
                         ' (ACAT-OPTN  TABLE)'                                  
                   DISPLAY 'CAT515: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT515: DCLVOPTN  ='                                
                           '(' DCLVOPTN ')'                                     
                   PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT                  
                   PERFORM  8100-SQL-ERROR THRU 8100-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5510-EXIT. EXIT.                                                         
      /                                                                         
       5520-UPDATE-VMF    SECTION.                                              
           MOVE '5520-UPDATE-VMF              ' TO W-ROUTINE-1.                 
                                                                                
           PERFORM 6600-UPDATE-VMF    THRU 6600-EXIT                            
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VMF-UPD-CNT                                           
DJ0002         PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-VMF-NOT-UPD-CNT                                       
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'INP=' W-INFILE-CNT                                      
                               ' VMF   NOT UPDATED.'                            
                               ' SQLCODE=' W-DB2-SQLCODE                        
                               ' RERUN=' L-RERUN-SW                             
***************IF  L-RERUN                                                      
***************AND SQLCODE  =  +100                                             
               IF  SQLCODE  =  +100                                             
                   PERFORM 6300-INSERT-VMF    THRU 6300-EXIT                    
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT515: ERROR UPDATING  A ROW INTO VMF   '          
                         ' (ACAT-MF    TABLE)'                                  
                   DISPLAY 'CAT515: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT515: DCLVMF  ='                                  
                           '(' DCLVMF ')'                                       
                   PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT                  
                   PERFORM  8100-SQL-ERROR THRU 8100-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5520-EXIT. EXIT.                                                         
      /                                                                         
DJ0002*****************************************************************         
DJ0002*  FOR INIT-TABLE ASSETS THAT WAS MOVED TO ACTIVE TABLE,                  
DJ0002*  DELETE THE ROW FROM THE INIT-TABLE                                     
DJ0002*****************************************************************         
DJ0002 5600-DELETE-INIT           SECTION.                                      
DJ0002     MOVE '5600-DELETE-INIT              ' TO W-ROUTINE-1.                
DJ0002                                                                          
DJ0002     EXEC SQL OPEN ACTIAST_CURSOR END-EXEC                                
DJ0002                                                                          
DJ0002     MOVE SQLCODE      TO W-DB2-SQLCODE                                   
DJ0002     MOVE SQLCODE      TO W-AST-SQLCODE                                   
DJ0002                                                                          
DJ0002***  IF  SQLCODE = +0                                                     
DJ0002***      DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0002***             ' ACTIAST CURSOR OPENED FOR'                              
DJ0002***           ' ' W-SAVE-CLIENT-NBR                                       
DJ0002***           ' ' W-SAVE-ACAT-CTL-NBR                                     
DJ0004***           ' ' W-SAVE-TFR-TYPE                                         
DJ0002***             ' SQLCODE = ' W-DB2-SQLCODE                               
DJ0002***  ELSE                                                                 
DJ0002***      DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0002***             ' ACTIAST CURSOR OPEN ERROR FOR'                          
DJ0002***           ' ' W-SAVE-CLIENT-NBR                                       
DJ0002***           ' ' W-SAVE-ACAT-CTL-NBR                                     
DJ0004***           ' ' W-SAVE-TFR-TYPE                                         
DJ0002***             ' SQLCODE = ' W-DB2-SQLCODE                               
DJ0002***  END-IF                                                               
DJ0002                                                                          
DJ0002     PERFORM UNTIL W-AST-SQLCODE NOT = +0                                 
DJ0002                                                                          
DJ0002        ADD 1 TO W-FETCH-CNT                                              
DJ0002                                                                          
DJ0002        EXEC SQL                                                          
DJ0002             FETCH ACTIAST_CURSOR                                         
DJ0002         INTO                                                             
DJ0002             :DCLACTIAST.CLIENT-NBR                                       
DJ0002            ,:DCLACTIAST.DLVR-NBR                                         
DJ0002            ,:DCLACTIAST.ACCT-DLVR-NBR                                    
DJ0002            ,:DCLACTIAST.RCV-NBR                                          
DJ0002            ,:DCLACTIAST.ACCT-RCV-NBR                                     
DJ0002            ,:DCLACTIAST.ISIN-CNTRY-CD                                    
DJ0002            ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                
DJ0002            ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
DJ0002            ,:DCLACTIAST.STTLM-LCTN-CD                                    
DJ0002            ,:DCLACTIAST.STTLM-RSN-CD                                     
DJ0002            ,:DCLACTIAST.CSH-MGN-SHRT-CD                                  
DJ0002            ,:DCLACTIAST.SBMTG-PRTCP-NBR                                  
DJ0002            ,:DCLACTIAST.ACAT-CONTROL-NBR                                 
DJ0002            ,:DCLACTIAST.ASSET-SEQ-NBR                                    
DJ0002            ,:DCLACTIAST.TRANS-TYPE-CD                                    
DJ0002            ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                
DJ0002            ,:DCLACTIAST.ASSET-DESC-TXT                                   
DJ0002            ,:DCLACTIAST.ASSET-QTY                                        
DJ0002            ,:DCLACTIAST.ASSET-AMT                                        
DJ0002        END-EXEC                                                          
DJ0002                                                                          
DJ0002        MOVE SQLCODE      TO W-DB2-SQLCODE                                
DJ0002        MOVE SQLCODE      TO W-AST-SQLCODE                                
DJ0002        EVALUATE SQLCODE                                                  
DJ0002            WHEN +0                                                       
DJ0002                 PERFORM 5601-DELETE-ACTIAST THRU 5601-EXIT               
DJ0002            WHEN +100                                                     
DJ0006                 CONTINUE                                                 
DJ0002***              DISPLAY 'INP=' W-INFILE-CNT                              
DJ0002***                     ' ACTIAST CURSOR FETCH NOT FOUND '                
DJ0002***                     ' SQLCODE = ' W-DB2-SQLCODE                       
DJ0002            WHEN OTHER                                                    
DJ0002                 DISPLAY 'INP=' W-INFILE-CNT                              
DJ0002                        ' ACTIAST CURSOR FETCH ERROR '                    
DJ0002                        ' SQLCODE = ' W-DB2-SQLCODE                       
DJ0002                 PERFORM  8100-SQL-ERROR THRU 8100-EXIT                   
DJ0002        END-EVALUATE                                                      
DJ0002                                                                          
DJ0002     END-PERFORM                                                          
DJ0002                                                                          
DJ0002     EXEC SQL                                                             
DJ0002          CLOSE ACTIAST_CURSOR                                            
DJ0002     END-EXEC                                                             
DJ0002                                                                          
DJ0002     MOVE SQLCODE      TO W-DB2-SQLCODE                                   
DJ0002     MOVE SQLCODE      TO W-AST-SQLCODE.                                  
DJ0002***  IF  SQLCODE = +0                                                     
DJ0002***      DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0002***             ' ACTIAST CURSOR CLOSED FOR'                              
DJ0002***           ' ' W-SAVE-CLIENT-NBR                                       
DJ0002***           ' ' W-SAVE-ACAT-CTL-NBR                                     
DJ0004***           ' ' W-SAVE-TFR-TYPE                                         
DJ0002***             ' SQLCODE = ' W-DB2-SQLCODE                               
DJ0002***  ELSE                                                                 
DJ0002***      DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0002***             ' ACTIAST CURSOR CLOSE ERROR FOR'                         
DJ0002***           ' ' W-SAVE-CLIENT-NBR                                       
DJ0002***           ' ' W-SAVE-ACAT-CTL-NBR                                     
DJ0004***           ' ' W-SAVE-TFR-TYPE                                         
DJ0002***             ' SQLCODE = ' W-DB2-SQLCODE                               
DJ0002***  END-IF.                                                              
DJ0002                                                                          
DJ0012     EXEC SQL OPEN ACTIAST_CURSOR2 END-EXEC                               
DJ0012                                                                          
DJ0012     MOVE SQLCODE      TO W-DB2-SQLCODE                                   
DJ0012     MOVE SQLCODE      TO W-AST-SQLCODE                                   
DJ0012                                                                          
DJ0012     PERFORM UNTIL W-AST-SQLCODE NOT = +0                                 
DJ0012                                                                          
DJ0012        ADD 1 TO W-FETCH-CNT                                              
DJ0012                                                                          
DJ0012        EXEC SQL                                                          
DJ0012             FETCH ACTIAST_CURSOR2                                        
DJ0012         INTO                                                             
DJ0012             :DCLACTIAST.CLIENT-NBR                                       
DJ0012            ,:DCLACTIAST.DLVR-NBR                                         
DJ0012            ,:DCLACTIAST.ACCT-DLVR-NBR                                    
DJ0012            ,:DCLACTIAST.RCV-NBR                                          
DJ0012            ,:DCLACTIAST.ACCT-RCV-NBR                                     
DJ0012            ,:DCLACTIAST.ISIN-CNTRY-CD                                    
DJ0012            ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                
DJ0012            ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
DJ0012            ,:DCLACTIAST.STTLM-LCTN-CD                                    
DJ0012            ,:DCLACTIAST.STTLM-RSN-CD                                     
DJ0012            ,:DCLACTIAST.CSH-MGN-SHRT-CD                                  
DJ0012            ,:DCLACTIAST.SBMTG-PRTCP-NBR                                  
DJ0012            ,:DCLACTIAST.ACAT-CONTROL-NBR                                 
DJ0012            ,:DCLACTIAST.ASSET-SEQ-NBR                                    
DJ0012            ,:DCLACTIAST.TRANS-TYPE-CD                                    
DJ0012            ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                
DJ0012            ,:DCLACTIAST.ASSET-DESC-TXT                                   
DJ0012            ,:DCLACTIAST.ASSET-QTY                                        
DJ0012            ,:DCLACTIAST.ASSET-AMT                                        
DJ0019            ,:DCLACTIAST.WHI-CD                                           
DJ0012        END-EXEC                                                          
DJ0012                                                                          
DJ0012        MOVE SQLCODE      TO W-DB2-SQLCODE                                
DJ0012        MOVE SQLCODE      TO W-AST-SQLCODE                                
DJ0012        EVALUATE SQLCODE                                                  
DJ0012            WHEN +0                                                       
DJ0012                 PERFORM 5602-DELETE-ACTIAST2 THRU 5602-EXIT              
DJ0012            WHEN +100                                                     
DJ0012                 CONTINUE                                                 
DJ0012            WHEN OTHER                                                    
DJ0012                 DISPLAY 'INP=' W-INFILE-CNT                              
DJ0012                        ' ACTIAST CURSOR2 FETCH ERROR '                   
DJ0012                        ' SQLCODE = ' W-DB2-SQLCODE                       
DJ0012                 PERFORM  8100-SQL-ERROR THRU 8100-EXIT                   
DJ0012        END-EVALUATE                                                      
DJ0012                                                                          
DJ0012     END-PERFORM                                                          
DJ0012                                                                          
DJ0012     EXEC SQL                                                             
DJ0012          CLOSE ACTIAST_CURSOR2                                           
DJ0012     END-EXEC                                                             
DJ0012                                                                          
DJ0012     MOVE SQLCODE      TO W-DB2-SQLCODE                                   
DJ0012     MOVE SQLCODE      TO W-AST-SQLCODE.                                  
DJ0012                                                                          
DJ0002 5600-EXIT. EXIT.                                                         
DJ0002/                                                                         
DJ0002*****************************************************************         
DJ0002*  DELETE ONE ROW AT TIME BASED ON FETCH                                  
DJ0002*****************************************************************         
DJ0002 5601-DELETE-ACTIAST SECTION.                                             
DJ0002     MOVE '5601-DELETE-ACTIAST          ' TO W-ROUTINE-1.                 
DJ0002                                                                          
DJ0002     EXEC SQL                                                             
DJ0002          DELETE FROM ACTIAST                                             
DJ0002          WHERE  CURRENT OF ACTIAST_CURSOR                                
DJ0002     END-EXEC.                                                            
DJ0002                                                                          
DJ0002     MOVE 'ACTIAST'                TO W-DB2-TABLE-NAME                    
DJ0002     MOVE 'DELETE'                 TO W-DB2-ACTION                        
DJ0002     MOVE SQLCODE                  TO W-DB2-SQLCODE                       
DJ0002     MOVE SQLERRD(3)               TO W-SQLERRD-3                         
DJ0002                                                                          
DJ0002     ADD 1 TO W-SQL-CNT                                                   
DJ0002     IF  SQLCODE  =  +0                                                   
DJ0002         ADD 1 TO W-ACTIAST-DEL-CNT                                       
DJ0002         PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                           
DJ0002         IF ASSET-QTY OF DCLACTIAST = 0                                   
DJ0002            MOVE ASSET-AMT OF DCLACTIAST                                  
DJ0002                                     TO W-ASSET-AMT W-ASSET-AMT-X         
DJ0002            DISPLAY 'INP=' W-INFILE-CNT ' ACTIAST DEL1'                   
DJ0002                    ' ' CLIENT-NBR        OF DCLACTIAST                   
DJ0002                    ' ' ACAT-CONTROL-NBR  OF DCLACTIAST                   
DJ0012                 ' RF=' TRANS-RFRN-ID-CD  OF DCLACTIAST(1:10)             
DJ0002                    ' ' STTLM-LCTN-CD     OF DCLACTIAST                   
DJ0002                    ' ' CSH-MGN-SHRT-CD   OF DCLACTIAST                   
DJ0002                    ' ' STTLM-RSN-CD      OF DCLACTIAST                   
DJ0002                    ' ' ASSET-PRC-CTGY-CD OF DCLACTIAST                   
DJ0002                    ' ' ISIN-SEC-ISSUE-CD OF DCLACTIAST                   
DJ0002                ' AMT=' W-ASSET-AMT-X                                     
DJ0002         ELSE                                                             
DJ0002            DISPLAY 'INP=' W-INFILE-CNT ' ACTIAST DEL1'                   
DJ0002                    ' ' CLIENT-NBR        OF DCLACTIAST                   
DJ0002                    ' ' ACAT-CONTROL-NBR  OF DCLACTIAST                   
DJ0012                 ' RF=' TRANS-RFRN-ID-CD  OF DCLACTIAST(1:10)             
DJ0002                    ' ' STTLM-LCTN-CD     OF DCLACTIAST                   
DJ0002                    ' ' CSH-MGN-SHRT-CD   OF DCLACTIAST                   
DJ0002                    ' ' STTLM-RSN-CD      OF DCLACTIAST                   
DJ0002                    ' ' ASSET-PRC-CTGY-CD OF DCLACTIAST                   
DJ0002                    ' ' ISIN-SEC-ISSUE-CD OF DCLACTIAST                   
DJ0002                    ' ' ASSET-DESC-TXT    OF DCLACTIAST(1:28)             
DJ0019                    ' ' WHI-CD            OF DCLACTIAST                   
DJ0002         END-IF                                                           
DJ0002     ELSE                                                                 
DJ0002         ADD 1 TO W-ACTIAST-NOT-DEL-CNT                                   
DJ0002         DISPLAY 'INP=' W-INFILE-CNT ' ACTIAST NOT DEL'                   
DJ0002                    ' ' CLIENT-NBR        OF DCLACTIAST                   
DJ0002                    ' ' ACAT-CONTROL-NBR  OF DCLACTIAST                   
DJ0012                 ' RF=' TRANS-RFRN-ID-CD  OF DCLACTIAST(1:10)             
DJ0002                    ' ' STTLM-LCTN-CD     OF DCLACTIAST                   
DJ0002                    ' ' CSH-MGN-SHRT-CD   OF DCLACTIAST                   
DJ0002                    ' ' STTLM-RSN-CD      OF DCLACTIAST                   
DJ0002                    ' ' ASSET-PRC-CTGY-CD OF DCLACTIAST                   
DJ0002                    ' ' ISIN-SEC-ISSUE-CD OF DCLACTIAST                   
DJ0002                    ' ' ASSET-DESC-TXT    OF DCLACTIAST(1:28)             
DJ0019                    ' ' WHI-CD            OF DCLACTIAST                   
DJ0002                ' SQL=' W-DB2-SQLCODE                                     
DJ0002         IF  SQLCODE  =  +100                                             
DJ0002             CONTINUE                                                     
DJ0002         ELSE                                                             
DJ0002             DISPLAY ' '                                                  
DJ0002             DISPLAY 'CAT515: ERROR DELETING A ROW FROM ACTIAST'          
DJ0002                   ' (ACAT-INIT-ASSET TABLE)'                             
DJ0002             DISPLAY 'CAT515: INPUT  REC ='                               
DJ0002                  '(' W-NSCC-RECORD ')'                                   
DJ0002             DISPLAY 'CAT515: DCLACTIAST='                                
DJ0002                     '(' DCLACTIAST ')'                                   
DJ0002             PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT                  
DJ0002             PERFORM 8100-SQL-ERROR THRU 8100-EXIT                        
DJ0002         END-IF                                                           
DJ0002     END-IF.                                                              
DJ0002                                                                          
DJ0002 5601-EXIT. EXIT.                                                         
DJ0012/                                                                         
DJ0012*****************************************************************         
DJ0012*  DELETE ONE ROW AT TIME BASED ON FETCH                                  
DJ0012*****************************************************************         
DJ0012 5602-DELETE-ACTIAST2 SECTION.                                            
DJ0012     MOVE '5602-DELETE-ACTIAST2         ' TO W-ROUTINE-1.                 
DJ0012                                                                          
DJ0012     EXEC SQL                                                             
DJ0012          DELETE FROM ACTIAST                                             
DJ0012          WHERE  CURRENT OF ACTIAST_CURSOR2                               
DJ0012     END-EXEC.                                                            
DJ0012                                                                          
DJ0012     MOVE 'ACTIAST'                TO W-DB2-TABLE-NAME                    
DJ0012     MOVE 'DELETE'                 TO W-DB2-ACTION                        
DJ0012     MOVE SQLCODE                  TO W-DB2-SQLCODE                       
DJ0012     MOVE SQLERRD(3)               TO W-SQLERRD-3                         
DJ0012                                                                          
DJ0012     ADD 1 TO W-SQL-CNT                                                   
DJ0012     IF  SQLCODE  =  +0                                                   
DJ0012         ADD 1 TO W-ACTIAST-DEL-CNT                                       
DJ0012         PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                           
DJ0012         IF ASSET-QTY OF DCLACTIAST = 0                                   
DJ0012            MOVE ASSET-AMT OF DCLACTIAST                                  
DJ0012                                     TO W-ASSET-AMT W-ASSET-AMT-X         
DJ0012            DISPLAY 'INP=' W-INFILE-CNT ' ACTIAST DEL2'                   
DJ0012                    ' ' CLIENT-NBR        OF DCLACTIAST                   
DJ0012                    ' ' ACAT-CONTROL-NBR  OF DCLACTIAST                   
DJ0012                 ' RF=' TRANS-RFRN-ID-CD  OF DCLACTIAST(1:10)             
DJ0012                    ' ' STTLM-LCTN-CD     OF DCLACTIAST                   
DJ0012                    ' ' CSH-MGN-SHRT-CD   OF DCLACTIAST                   
DJ0012                    ' ' STTLM-RSN-CD      OF DCLACTIAST                   
DJ0012                    ' ' ASSET-PRC-CTGY-CD OF DCLACTIAST                   
DJ0012                    ' ' ISIN-SEC-ISSUE-CD OF DCLACTIAST                   
DJ0012                ' AMT=' W-ASSET-AMT-X                                     
DJ0012         ELSE                                                             
DJ0012            DISPLAY 'INP=' W-INFILE-CNT ' ACTIAST DEL2'                   
DJ0012                    ' ' CLIENT-NBR        OF DCLACTIAST                   
DJ0012                    ' ' ACAT-CONTROL-NBR  OF DCLACTIAST                   
DJ0012                 ' RF=' TRANS-RFRN-ID-CD  OF DCLACTIAST(1:10)             
DJ0012                    ' ' STTLM-LCTN-CD     OF DCLACTIAST                   
DJ0012                    ' ' CSH-MGN-SHRT-CD   OF DCLACTIAST                   
DJ0012                    ' ' STTLM-RSN-CD      OF DCLACTIAST                   
DJ0012                    ' ' ASSET-PRC-CTGY-CD OF DCLACTIAST                   
DJ0012                    ' ' ISIN-SEC-ISSUE-CD OF DCLACTIAST                   
DJ0012                    ' ' ASSET-DESC-TXT    OF DCLACTIAST(1:28)             
DJ0019                    ' ' WHI-CD            OF DCLACTIAST                   
DJ0012         END-IF                                                           
DJ0012     ELSE                                                                 
DJ0012         ADD 1 TO W-ACTIAST-NOT-DEL-CNT                                   
DJ0012         DISPLAY 'INP=' W-INFILE-CNT ' ACTIAST NOT DEL2'                  
DJ0012                    ' ' CLIENT-NBR        OF DCLACTIAST                   
DJ0012                    ' ' ACAT-CONTROL-NBR  OF DCLACTIAST                   
DJ0012                 ' RF=' TRANS-RFRN-ID-CD  OF DCLACTIAST(1:10)             
DJ0012                    ' ' STTLM-LCTN-CD     OF DCLACTIAST                   
DJ0012                    ' ' CSH-MGN-SHRT-CD   OF DCLACTIAST                   
DJ0012                    ' ' STTLM-RSN-CD      OF DCLACTIAST                   
DJ0012                    ' ' ASSET-PRC-CTGY-CD OF DCLACTIAST                   
DJ0012                    ' ' ISIN-SEC-ISSUE-CD OF DCLACTIAST                   
DJ0012                    ' ' ASSET-DESC-TXT    OF DCLACTIAST(1:28)             
DJ0019                    ' ' WHI-CD            OF DCLACTIAST                   
DJ0012                ' SQL=' W-DB2-SQLCODE                                     
DJ0012         IF  SQLCODE  =  +100                                             
DJ0012             CONTINUE                                                     
DJ0012         ELSE                                                             
DJ0012             DISPLAY ' '                                                  
DJ0012             DISPLAY 'CAT515: ERROR DELETING A ROW FROM ACTIAST2'         
DJ0012                   ' (ACAT-INIT-ASSET TABLE)'                             
DJ0012             DISPLAY 'CAT515: INPUT  REC ='                               
DJ0012                  '(' W-NSCC-RECORD ')'                                   
DJ0012             DISPLAY 'CAT515: DCLACTIAST='                                
DJ0012                     '(' DCLACTIAST ')'                                   
DJ0012             PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT                  
DJ0012             PERFORM 8100-SQL-ERROR THRU 8100-EXIT                        
DJ0012         END-IF                                                           
DJ0012     END-IF.                                                              
DJ0012                                                                          
DJ0012 5602-EXIT. EXIT.                                                         
      /                                                                         
       5610-SELECT-ACTIOPN SECTION.                                             
           MOVE '5610-SELECT-ACTIOPN            ' TO W-ROUTINE-1.               
                                                                                
***********DISPLAY '5610-SELECT-ACTIOPN'.                                       
                                                                                
           MOVE ' ' TO W-ACTIOPN-FND-SW                                         
           INITIALIZE DCLACTIOPN.                                               
           EXEC SQL SELECT                                                      
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
LRM029             ,STPRC_INTEGER2_AMT                                          
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
DJ0008             ,ACAT_CONTROL_NBR                                            
DJ0008             ,ASSET_SEQ_NBR                                               
DJ0008             ,TRNFR_TYPE_CD                                               
               INTO                                                             
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
LRM029             ,:DCLACTIOPN.STPRC-INTEGER2-AMT                              
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
DJ0008             ,:DCLACTIOPN.ACAT-CONTROL-NBR                                
DJ0008             ,:DCLACTIOPN.ASSET-SEQ-NBR                                   
DJ0008             ,:DCLACTIOPN.TRNFR-TYPE-CD                                   
               FROM  ACTIOPN                                                    
              WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR                 
                AND  RCV_NBR           = :W-NSCC-AT-RCV-NBR                     
                AND  DLVR_NBR          = :W-NSCC-AT-DEL-NBR                     
                AND  ACCT_DLVR_NBR     = :W-SAVE-ACCT-DLVR-NBR                  
                AND  ACCT_RCV_NBR      = :W-SAVE-ACCT-RCV-NBR                   
                AND  CSH_MGN_SHRT_CD   = :W-NSCC-AT-CASH-MRGN-SHTCD             
                AND  BS_CD             = :W-NSCC-ATO-OPT-BS-IND                 
                AND  PTCL_CD           = :W-NSCC-ATO-OPT-PC-IND                 
                AND  OPTN_OPN_CLSD_CD  = :W-NSCC-ATO-OPT-OC-IND                 
                AND  SYM_CD            = :W-NSCC-ATO-OPT-SYM                    
                AND  EXPTN_DT          > :W-COMP-EXPTN-DT                       
                AND  EXPTN_DT          < :W-NEXT-EXPTN-DT                       
                AND  STPRC_INTEGER_AMT = :W-COMP-STPRC-INTEGER-AMT              
                AND  STPRC_FRCTN_AMT   = :W-COMP-STPRC-FRCTN-AMT                
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIOPN'                TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               MOVE 'Y' TO W-ACTIOPN-FND-SW                                     
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                              ' ' W-NSCC-KEY-CLIENT-NBR                         
                              ' ' W-NSCC-ACAT-CTL-NBR                           
                              ' ' W-ASSET-SEQ-NBR                               
                              ' ' W-NSCC-AT-TRAN-TYPE                           
                              ' ' W-NSCC-AT-TFR-TYPE                            
                          ' DST=' W-DSTBN-SIDE-CD                               
                          ' 5610: ACTIOPN-FND '                                 
                                  ISIN-SEC-ISSUE-CD OF DCLACTIOPN               
           ELSE                                                                 
               MOVE 'N' TO W-ACTIOPN-FND-SW                                     
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                              ' ' W-NSCC-KEY-CLIENT-NBR                         
                              ' ' W-NSCC-ACAT-CTL-NBR                           
                              ' ' W-ASSET-SEQ-NBR                               
                              ' ' W-NSCC-AT-TRAN-TYPE                           
                              ' ' W-NSCC-AT-TFR-TYPE                            
                          ' DST=' W-DSTBN-SIDE-CD                               
                          ' 5610: ACTIOPN-NOTFND '                              
                                ' SQLCODE=' W-DB2-SQLCODE                       
           END-IF.                                                              
                                                                                
       5610-EXIT. EXIT.                                                         
      /                                                                         
       5650-DELETE-ACTIVE         SECTION.                                      
           MOVE '5650-DELETE-ACTIVE            ' TO W-ROUTINE-1.                
                                                                                
           EXEC SQL                                                             
                DELETE FROM VASSET                                              
                WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR               
                  AND  ACAT_CONTROL_NBR  = :W-NSCC-ACAT-CTL-NBR                 
                  AND  ASSET_SEQ_NBR     = :W-AT-ASSET-SEQ-NBR                  
           END-EXEC.                                                            
                                                                                
           MOVE 'VASSET'                 TO W-DB2-TABLE-NAME                    
           MOVE 'DELETE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VASSET-DEL-CNT                                        
DJ0002         PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                           
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-NSCC-KEY-CLIENT-NBR                             
                          ' ' W-NSCC-ACAT-CTL-NBR                               
                          ' ' W-AT-ASSET-SEQ-NBR                                
                              ' ' W-NSCC-AT-TRAN-TYPE                           
                              ' ' W-NSCC-AT-TFR-TYPE                            
                          ' DST=' W-DSTBN-SIDE-CD                               
                      ' VASSET DELETED.'                                        
           ELSE                                                                 
               ADD 1 TO W-VASSET-NOT-DEL-CNT                                    
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-NSCC-KEY-CLIENT-NBR                             
                          ' ' W-NSCC-ACAT-CTL-NBR                               
                          ' ' W-AT-ASSET-SEQ-NBR                                
                              ' ' W-NSCC-AT-TRAN-TYPE                           
                              ' ' W-NSCC-AT-TFR-TYPE                            
                          ' DST=' W-DSTBN-SIDE-CD                               
                      ' VASSET NOT DELETED.'                                    
               IF  SQLCODE  =  +100                                             
                   CONTINUE                                                     
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT515: ERROR DELETING A ROW FROM VASSET'           
                         ' (ACAT-INIT-ASSET TABLE)'                             
                   DISPLAY 'CAT515: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT515: DCLVASSET='                                 
                           '(' DCLVASSET ')'                                    
                   PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT                  
                   PERFORM  8100-SQL-ERROR THRU 8100-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
LRM041     IF W-DSTBN-SIDE-CD = 'R'                                             
LRM041     AND (W-NSCC-AT-ASSET-PRC-CATG = 'MFMM' OR 'MFNM')                    
LRM041     AND W-NSCC-AT-TFR-TYPE = 'FUL'                                       
LRM041        EXEC SQL                                                          
LRM041          DELETE FROM VFNDRGST                                            
LRM041          WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR               
LRM041            AND  ACAT_CONTROL_NBR  = :W-NSCC-ACAT-CTL-NBR                 
LRM041            AND  ASSET_SEQ_NBR     = :W-AT-ASSET-SEQ-NBR                  
LRM041        END-EXEC                                                          
LRM041        ADD 1 TO W-SQL-CNT                                                
LRM041        IF  SQLCODE  =  +0                                                
LRM041            ADD 1 TO W-VFNDRGST-DEL-CNT                                   
LRM041            PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                        
LRM041            DISPLAY 'INP=' W-INFILE-CNT                                   
LRM041                    ' ' W-NSCC-KEY-CLIENT-NBR                             
LRM041                    ' ' W-NSCC-ACAT-CTL-NBR                               
LRM041                    ' ' W-AT-ASSET-SEQ-NBR                                
LRM041                        ' ' W-NSCC-AT-TRAN-TYPE                           
LRM041                        ' ' W-NSCC-AT-TFR-TYPE                            
LRM041                    ' DST=' W-DSTBN-SIDE-CD                               
LRM041                ' VFNDRGST DELETED.'                                      
LRM041        ELSE                                                              
LRM041            ADD 1 TO W-VFNDRGST-NOT-DEL-CNT                               
LRM041            DISPLAY 'INP=' W-INFILE-CNT                                   
LRM041                    ' ' W-NSCC-KEY-CLIENT-NBR                             
LRM041                    ' ' W-NSCC-ACAT-CTL-NBR                               
LRM041                    ' ' W-AT-ASSET-SEQ-NBR                                
LRM041                        ' ' W-NSCC-AT-TRAN-TYPE                           
LRM041                        ' ' W-NSCC-AT-TFR-TYPE                            
LRM041                    ' DST=' W-DSTBN-SIDE-CD                               
LRM041                ' VFNDRGST NOT DELETED.'                                  
LRM041        END-IF                                                            
LRM041     END-IF.                                                              
                                                                                
       5650-EXIT. EXIT.                                                         
      /                                                                         
       5660-DELETE-ACTIVE-PTR     SECTION.                                      
      *    DELETE THE ASSETS THAT THE PTR RECEIVER CREATED.                     
      *    (THEY WILL BE DUPLICATED BY THE DELIVERER.)                          
      *    THE DELIVERER SENT THE REAL ASSETS UNDER DIFFERENT                   
      *    ASSET SEQUENCE NUMBERS.                                              
      *                                                                         
           MOVE '5660-DELETE-ACTIVE-PTR        ' TO W-ROUTINE-1.                
                                                                                
           EXEC SQL                                                             
                DELETE FROM VASSET                                              
                WHERE  CLIENT_NBR        = :W-SAVE-CLIENT-NBR                   
                  AND  ACAT_CONTROL_NBR  = :W-SAVE-ACAT-CTL-NBR                 
                  AND  SBMTG_PRTCP_NBR   = :W-SAVE-RCV-NBR                      
           END-EXEC.                                                            
                                                                                
           MOVE 'VASSET'                 TO W-DB2-TABLE-NAME                    
           MOVE 'DELETE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           MOVE SQLERRD(3)               TO W-SQLERRD-3                         
           MOVE W-SQLERRD-3              TO W-SQL-DELETE-COUNT                  
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VASSET-DEL-CNT                                        
               PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                           
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-SAVE-CLIENT-NBR                                 
                          ' ' W-SAVE-ACAT-CTL-NBR                               
                          ' ' W-SAVE-TFR-TYPE                                   
                      ' SUB=' W-SAVE-SUB-PART-NBR                               
                      ' RCV=' W-SAVE-RCV-NBR                                    
                      ' DLV=' W-SAVE-DLVR-NBR                                   
                      ' STA=' W-SAVE-STATUS                                     
                            ' PTR ASSETS DELETED '                              
                              W-SQL-DELETE-COUNT                                
           ELSE                                                                 
               ADD 1 TO W-VASSET-NOT-DEL-CNT                                    
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-SAVE-CLIENT-NBR                                 
                          ' ' W-SAVE-ACAT-CTL-NBR                               
                          ' ' W-SAVE-TFR-TYPE                                   
                      ' SUB=' W-SAVE-SUB-PART-NBR                               
                      ' RCV=' W-SAVE-RCV-NBR                                    
                      ' DLV=' W-SAVE-DLVR-NBR                                   
                      ' STA=' W-SAVE-STATUS                                     
                            ' PTR ASSETS NOT DELETED.'                          
               IF  SQLCODE  =  +100                                             
                   CONTINUE                                                     
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT515: ERROR DELETING PTR ROW FROM VASSET'         
                         ' (ACAT-INIT-ASSET TABLE)'                             
                   DISPLAY 'CAT515: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT515: DCLVASSET='                                 
                           '(' DCLVASSET ')'                                    
                   PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT                  
                   PERFORM  8100-SQL-ERROR THRU 8100-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5660-EXIT. EXIT.                                                         
      /                                                                         
DJ0006 5670-SELECT-VASTHSTY       SECTION.                                      
DJ0006**GET THE CAGE TAG NUMBER FROM THE ASSET HISTORY FILE                     
LRM042* FIRST QUALIFY TAG NBR > SPACES, IF NOTFND, TRY WITHOUT IT.              
DJ0006     MOVE '5670-SELECT-VASTHSTY               ' TO W-ROUTINE-1.           
DJ0006                                                                          
DJ0006     MOVE ' '                TO W-VASTHSTY-FND-SW                         
DJ0006     INITIALIZE DCLVASTHSTY                                               
LRM044     IF W-NSCC-AT-SEC-ID NOT > SPACES                                     
LRM044     AND W-NSCC-AT-ASSET-DESC (114:15) = 'SUBMITTER ISIN:'                
LRM044        PERFORM 6700-GETMSDC THRU 6700-EXIT                               
LRM044        IF NOT GETMSD-RETURN-VALID                                        
LRM044           GO TO 5670-EXIT                                                
LRM044        END-IF                                                            
LRM044        EXEC SQL SELECT                                                   
LRM044              CAGE_TAG_NBR                                                
LRM044             ,SCRTY_866_NBR                                               
LRM044             ,ASSET_866_QTY                                               
LRM044             ,ASSET_QTY                                                   
LRM044             ,FAIL_OPEN_CAGE_IND                                          
LRM044         INTO                                                             
LRM044              :DCLVASTHSTY.CAGE-TAG-NBR                                   
LRM044             ,:DCLVASTHSTY.SCRTY-866-NBR                                  
LRM044             ,:DCLVASTHSTY.ASSET-866-QTY                                  
LRM044             ,:DCLVASTHSTY.ASSET-QTY                                      
LRM044             ,:DCLVASTHSTY.FAIL-OPEN-CAGE-IND                             
LRM044         FROM  VASTHSTY                                                   
LRM044         WHERE CLIENT_NBR         = :W-SAVE-CLIENT-NBR                    
LRM044           AND ACAT_CONTROL_NBR   = :W-SAVE-CNTL-ASTD-NBR                 
LRM044           AND SECURITY_ADP_NBR   = :DCLVASSET.SECURITY-ADP-NBR           
LRM044           AND CSH_MGN_SHRT_CD    = :W-NSCC-AT-CASH-MRGN-SHTCD            
LRM044           AND CAGE_TAG_NBR       > ' '                                   
LRM044        END-EXEC                                                          
LRM044     ELSE                                                                 
LRM042        EXEC SQL SELECT                                                   
LRM042              CAGE_TAG_NBR                                                
LRM042             ,SCRTY_866_NBR                                               
LRM042             ,ASSET_866_QTY                                               
LRM042             ,ASSET_QTY                                                   
LRM042             ,FAIL_OPEN_CAGE_IND                                          
LRM042         INTO                                                             
LRM042              :DCLVASTHSTY.CAGE-TAG-NBR                                   
LRM042             ,:DCLVASTHSTY.SCRTY-866-NBR                                  
LRM042             ,:DCLVASTHSTY.ASSET-866-QTY                                  
LRM042             ,:DCLVASTHSTY.ASSET-QTY                                      
LRM042             ,:DCLVASTHSTY.FAIL-OPEN-CAGE-IND                             
LRM042         FROM  VASTHSTY                                                   
LRM042         WHERE CLIENT_NBR         = :W-SAVE-CLIENT-NBR                    
LRM042           AND ACAT_CONTROL_NBR   = :W-SAVE-CNTL-ASTD-NBR                 
LRM042           AND ISIN_CNTRY_CD      = :W-NSCC-AT-SEC-CNTRY-CD               
LRM042           AND ISIN_SEC_ISSUE_CD  = :W-NSCC-AT-SEC-ID                     
LRM042           AND ISIN_SEC_CDG_CD    = :W-NSCC-AT-SEC-CHKDGT                 
LRM042           AND CSH_MGN_SHRT_CD    = :W-NSCC-AT-CASH-MRGN-SHTCD            
LRM042           AND CAGE_TAG_NBR       > ' '                                   
LRM042        END-EXEC                                                          
LRM044     END-IF.                                                              
LRM042                                                                          
LRM042     ADD 1 TO W-SQL-CNT                                                   
LRM042                                                                          
LRM042     IF  SQLCODE  NOT =  +0                                               
DJ0006     EXEC SQL SELECT                                                      
DJ0011              CAGE_TAG_NBR                                                
DJ0011             ,SCRTY_866_NBR                                               
DJ0011             ,ASSET_866_QTY                                               
DJ0011             ,ASSET_QTY                                                   
DJ0013             ,FAIL_OPEN_CAGE_IND                                          
DJ0006         INTO                                                             
DJ0006              :DCLVASTHSTY.CAGE-TAG-NBR                                   
DJ0011             ,:DCLVASTHSTY.SCRTY-866-NBR                                  
DJ0011             ,:DCLVASTHSTY.ASSET-866-QTY                                  
DJ0011             ,:DCLVASTHSTY.ASSET-QTY                                      
DJ0013             ,:DCLVASTHSTY.FAIL-OPEN-CAGE-IND                             
DJ0006         FROM  VASTHSTY                                                   
DJ0006         WHERE CLIENT_NBR         = :W-SAVE-CLIENT-NBR                    
DJ0006           AND ACAT_CONTROL_NBR   = :W-SAVE-CNTL-ASTD-NBR                 
DJ0006           AND ISIN_CNTRY_CD      = :W-NSCC-AT-SEC-CNTRY-CD               
DJ0006           AND ISIN_SEC_ISSUE_CD  = :W-NSCC-AT-SEC-ID                     
DJ0006           AND ISIN_SEC_CDG_CD    = :W-NSCC-AT-SEC-CHKDGT                 
DJ0006           AND CSH_MGN_SHRT_CD    = :W-NSCC-AT-CASH-MRGN-SHTCD            
DJ0006     END-EXEC.                                                            
DJ0006                                                                          
DJ0006     ADD 1 TO W-SQL-CNT                                                   
DJ0006                                                                          
LRM026     IF  SQLCODE  NOT =  +0                                               
LRM026         PERFORM 5675-SELECT-VASSET-TAG  THRU 5675-EXIT                   
LRM026     END-IF.                                                              
                                                                                
DJ0006     IF  SQLCODE  =  +0                                                   
DJ0006         MOVE 'Y'                TO W-VASTHSTY-FND-SW                     
DJ0006     ELSE                                                                 
DJ0006         MOVE 'N'                TO W-VASTHSTY-FND-SW                     
DJ0006         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0006                 ' CLT=' W-SAVE-CLIENT-NBR                                
DJ0006                 ' CTL=' W-SAVE-ACAT-CTL-NBR                              
DJ0006                 ' SEQ=' W-AT-ASSET-SEQ-NBR                               
DJ0006                 ' VASTHSTY NOTFND'                                       
DJ0006     END-IF.                                                              
DJ0006                                                                          
DJ0006 5670-EXIT. EXIT.                                                         
                                                                                
LRM026 5675-SELECT-VASSET-TAG    SECTION.                                       
LRM044     IF W-NSCC-AT-SEC-ID NOT > SPACES                                     
LRM044     AND W-NSCC-AT-ASSET-DESC (114:15) = 'SUBMITTER ISIN:'                
LRM044        EXEC SQL SELECT                                                   
LRM044              CAGE_TAG_NBR                                                
LRM044             ,SCRTY_866_NBR                                               
LRM044             ,ASSET_866_QTY                                               
LRM044             ,ASSET_QTY                                                   
LRM044             ,FAIL_OPEN_CAGE_IND                                          
LRM044         INTO                                                             
LRM044              :DCLVASTHSTY.CAGE-TAG-NBR                                   
LRM044             ,:DCLVASTHSTY.SCRTY-866-NBR                                  
LRM044             ,:DCLVASTHSTY.ASSET-866-QTY                                  
LRM044             ,:DCLVASTHSTY.ASSET-QTY                                      
LRM044             ,:DCLVASTHSTY.FAIL-OPEN-CAGE-IND                             
LRM044         FROM  VASSET                                                     
LRM044         WHERE CLIENT_NBR         = :W-SAVE-CLIENT-NBR                    
LRM044           AND ACAT_CONTROL_NBR   = :W-SAVE-CNTL-ASTD-NBR                 
LRM044           AND SECURITY_ADP_NBR   = :DCLVASSET.SECURITY-ADP-NBR           
LRM044           AND CSH_MGN_SHRT_CD    = :W-NSCC-AT-CASH-MRGN-SHTCD            
LRM044           AND CAGE_TAG_NBR       > ' '                                   
LRM044        END-EXEC                                                          
LRM044     ELSE                                                                 
LRM042        EXEC SQL SELECT                                                   
LRM042              CAGE_TAG_NBR                                                
LRM042             ,SCRTY_866_NBR                                               
LRM042             ,ASSET_866_QTY                                               
LRM042             ,ASSET_QTY                                                   
LRM042             ,FAIL_OPEN_CAGE_IND                                          
LRM042         INTO                                                             
LRM042              :DCLVASTHSTY.CAGE-TAG-NBR                                   
LRM042             ,:DCLVASTHSTY.SCRTY-866-NBR                                  
LRM042             ,:DCLVASTHSTY.ASSET-866-QTY                                  
LRM042             ,:DCLVASTHSTY.ASSET-QTY                                      
LRM042             ,:DCLVASTHSTY.FAIL-OPEN-CAGE-IND                             
LRM042         FROM  VASSET                                                     
LRM042         WHERE CLIENT_NBR         = :W-SAVE-CLIENT-NBR                    
LRM042           AND ACAT_CONTROL_NBR   = :W-SAVE-CNTL-ASTD-NBR                 
LRM042           AND ISIN_CNTRY_CD      = :W-NSCC-AT-SEC-CNTRY-CD               
LRM042           AND ISIN_SEC_ISSUE_CD  = :W-NSCC-AT-SEC-ID                     
LRM042           AND ISIN_SEC_CDG_CD    = :W-NSCC-AT-SEC-CHKDGT                 
LRM042           AND CSH_MGN_SHRT_CD    = :W-NSCC-AT-CASH-MRGN-SHTCD            
LRM042           AND CAGE_TAG_NBR       > ' '                                   
LRM042        END-EXEC                                                          
LRM044     END-IF.                                                              
LRM042     IF  SQLCODE  NOT =  +0                                               
LRM026     EXEC SQL SELECT                                                      
LRM026              CAGE_TAG_NBR                                                
LRM026             ,SCRTY_866_NBR                                               
LRM026             ,ASSET_866_QTY                                               
LRM026             ,ASSET_QTY                                                   
LRM026             ,FAIL_OPEN_CAGE_IND                                          
LRM026         INTO                                                             
LRM026              :DCLVASTHSTY.CAGE-TAG-NBR                                   
LRM026             ,:DCLVASTHSTY.SCRTY-866-NBR                                  
LRM026             ,:DCLVASTHSTY.ASSET-866-QTY                                  
LRM026             ,:DCLVASTHSTY.ASSET-QTY                                      
LRM026             ,:DCLVASTHSTY.FAIL-OPEN-CAGE-IND                             
LRM026         FROM  VASSET                                                     
LRM026         WHERE CLIENT_NBR         = :W-SAVE-CLIENT-NBR                    
LRM026           AND ACAT_CONTROL_NBR   = :W-SAVE-CNTL-ASTD-NBR                 
LRM026           AND ISIN_CNTRY_CD      = :W-NSCC-AT-SEC-CNTRY-CD               
LRM026           AND ISIN_SEC_ISSUE_CD  = :W-NSCC-AT-SEC-ID                     
LRM026           AND ISIN_SEC_CDG_CD    = :W-NSCC-AT-SEC-CHKDGT                 
LRM026           AND CSH_MGN_SHRT_CD    = :W-NSCC-AT-CASH-MRGN-SHTCD            
LRM026     END-EXEC.                                                            
LRM026 5675-EXIT. EXIT.                                                         
      /                                                                         
LRM042 5680-SELECT-VASTHSTY-DLVR  SECTION.                                      
LRM042**FIND THE ORIGINAL ASSET HISTORY FILE                                    
LRM042     MOVE '5680-SELECT-VASTHSTY-DLVR          ' TO W-ROUTINE-1.           
LRM042                                                                          
LRM042     MOVE ' '                TO W-VASTHSTY-FND-SW                         
LRM042     INITIALIZE DCLVASTHSTY                                               
LRM042     EXEC SQL SELECT                                                      
LRM042              ASSET_SEQ_NBR                                               
LRM042             ,FAIL_OPEN_CAGE_IND                                          
LRM042         INTO                                                             
LRM042              :DCLVASTHSTY.ASSET-SEQ-NBR                                  
LRM042             ,:DCLVASTHSTY.FAIL-OPEN-CAGE-IND                             
LRM042         FROM  VASTHSTY                                                   
LRM042         WHERE CLIENT_NBR         = :W-SAVE-CLIENT-NBR                    
LRM042           AND ACAT_CONTROL_NBR   = :W-SAVE-CNTL-ASTD-NBR                 
LRM042           AND ISIN_CNTRY_CD      = :W-NSCC-AT-SEC-CNTRY-CD               
LRM042           AND ISIN_SEC_ISSUE_CD  = :W-NSCC-AT-SEC-ID                     
LRM042           AND ISIN_SEC_CDG_CD    = :W-NSCC-AT-SEC-CHKDGT                 
LRM042           AND CSH_MGN_SHRT_CD    = :W-NSCC-AT-CASH-MRGN-SHTCD            
LRM042     END-EXEC                                                             
LRM042                                                                          
LRM042     ADD 1 TO W-SQL-CNT                                                   
LRM042                                                                          
LRM042     IF  SQLCODE  =  +0 OR -811                                           
LRM042         MOVE 'Y'                TO W-VASTHSTY-FND-SW                     
LRM042     ELSE                                                                 
LRM042         MOVE 'N'                TO W-VASTHSTY-FND-SW                     
LRM042         ADD 1 TO W-VASTHSTY-NOT-UPD-CNT                                  
LRM042         DISPLAY 'INP=' W-INFILE-CNT                                      
LRM042                 ' CLT=' W-SAVE-CLIENT-NBR                                
LRM042                 ' CTL=' W-SAVE-ACAT-CTL-NBR                              
LRM042                 ' SEQ=' W-AT-ASSET-SEQ-NBR                               
LRM042                 ' VASTHSTY NOTFND FOR FRV DLVY'                          
LRM042     END-IF.                                                              
LRM042                                                                          
LRM042 5680-EXIT. EXIT.                                                         
                                                                                
LRM042 5685-UPDATE-VASTHSTY-CAGE.                                               
LRM042     MOVE '5685-UPDATE-VASTHSTY-CAGE          ' TO W-ROUTINE-1.           
LRM042     EXEC SQL                                                             
LRM042       UPDATE VASTHSTY                                                    
LRM042          SET                                                             
LRM042             FAIL_OPEN_CAGE_IND  = 'X'                                    
LRM042          WHERE  CLIENT_NBR        = :W-SAVE-CLIENT-NBR                   
LRM042            AND  ACAT_CONTROL_NBR  = :W-SAVE-CNTL-ASTD-NBR                
LRM042            AND  ASSET_SEQ_NBR     = :DCLVASTHSTY.ASSET-SEQ-NBR           
LRM042     END-EXEC.                                                            
LRM042     IF  SQLCODE  =  +0                                                   
LRM042         ADD 1 TO W-VASTHSTY-UPD-CNT                                      
LRM042     END-IF.                                                              
LRM042                                                                          
LRM042 5685-EXIT. EXIT.                                                         
      /                                                                         
       5700-SELECT-VTRNFR         SECTION.                                      
           MOVE '5700-SELECT-VTRNFR               ' TO W-ROUTINE-1.             
                                                                                
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
DJ0013             ,FRV_MFC_CMPLT_IND                                           
DJ0014             ,ACCT_FRZN_IND                                               
LRM034             ,GEO_CD                                                      
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
DJ0013              ,:DCLVTRNFR.FRV-MFC-CMPLT-IND                               
DJ0014              ,:DCLVTRNFR.ACCT-FRZN-IND                                   
LRM034              ,:DCLVTRNFR.GEO-CD                                          
               FROM  VTRNFR                                                     
               WHERE CLIENT_NBR       = :W-SAVE-CLIENT-NBR                      
                 AND ACAT_CONTROL_NBR = :W-SAVE-ACAT-CTL-NBR                    
           END-EXEC                                                             
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           IF  SQLCODE  =  +0                                                   
               MOVE 'Y'                TO W-TRANSFER-FND-SW                     
           ELSE                                                                 
               MOVE 'N'                TO W-TRANSFER-FND-SW                     
               DISPLAY 'INP=' W-INFILE-CNT                                      
                       ' CLT=' W-SAVE-CLIENT-NBR                                
                       ' CTL=' W-SAVE-ACAT-CTL-NBR                              
                       ' VTRNFR NOTFND'                                         
           END-IF.                                                              
                                                                                
       5700-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  SET FLAGS IN VTRNFR FOR EXCEPTIONS                                     
      *****************************************************************         
       5800-UPDATE-VTRNFR-INDS     SECTION.                                     
           MOVE '5800-UPDATE-VTRNFR-INDS      ' TO W-ROUTINE-1.                 
                                                                                
           MOVE W-PGM-NAME          TO PRGM-NM            OF DCLVTRNFR          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP         OF DCLVTRNFR          
                                                                                
LRM036     IF W-NSCC-STATUS NOT = STTS-CD OF DCLVTRNFR                          
LRM036     AND (W-NSCC-STATUS = '200')                                          
LRM036     AND W-SAVE-TFR-TYPE  = 'FUL'                                         
LRM036     AND STTLM-TM-CD OF DCLVTRNFR = 'L'                                   
LRM036        MOVE ' ' TO STTLM-TM-CD OF DCLVTRNFR                              
LRM036        DISPLAY 'INP=' W-INFILE-CNT                                       
LRM036                 ' CLT=' W-SAVE-CLIENT-NBR                                
LRM036                 ' CTL=' W-SAVE-ACAT-CTL-NBR                              
LRM036                 ' STTS=' W-NSCC-STATUS                                   
LRM036                 ' WIPED LAST-DAY IND'                                    
LRM036     END-IF.                                                              
                                                                                
           MOVE W-NSCC-STATUS       TO STTS-CD            OF DCLVTRNFR          
           MOVE W-NSCC-DAYS-IN-STATUS  TO DAYS-STTS-QTY   OF DCLVTRNFR          
                                                                                
           IF  W-REJ-MARGIN-DEBIT = 'Y'                                         
               MOVE 'Y'             TO ACCT-MRGN-DB-IND   OF DCLVTRNFR          
           END-IF                                                               
           IF  W-REJ-ASSET-VALUE  = 'Y'                                         
               MOVE 'Y'             TO ACCT-AST-EXCS-IND  OF DCLVTRNFR          
           END-IF                                                               
           IF  W-REJ-TOTL-ACT-VAL = 'Y'                                         
               MOVE 'Y'             TO ACCT-AST-EXCS-IND  OF DCLVTRNFR          
           END-IF                                                               
           IF  W-REJ-DB1          = 'Y'                                         
LRM027         IF W-ACAT-REJ-PEND-REC-DB1-IND = '2'                             
LRM027            MOVE '2'          TO ACCT-DB-BAL-T1-IND OF DCLVTRNFR          
LRM027         ELSE                                                             
LRM027            MOVE 'Y'          TO ACCT-DB-BAL-T1-IND OF DCLVTRNFR          
LRM027         END-IF                                                           
           END-IF                                                               
           IF  W-REJ-SP           = 'Y'                                         
               MOVE 'Y'             TO ACCT-SHRT-PSTN-IND OF DCLVTRNFR          
           END-IF                                                               
           IF  W-REJ-NTS          = 'Y'                                         
               MOVE 'Y'             TO ACCT-SEC-RSTRD-IND OF DCLVTRNFR          
           END-IF                                                               
           IF  W-REJ-LP           = 'Y'                                         
               MOVE 'Y'             TO ACCT-LTD-PRTNR-IND OF DCLVTRNFR          
           END-IF                                                               
           IF  W-REJ-OPT          = 'Y'                                         
               MOVE 'Y'             TO ACCT-OPTN-PSTN-IND OF DCLVTRNFR          
           END-IF.                                                              
           IF  W-REJ-CMT          = 'Y'                                         
               MOVE 'Y'             TO CMNT-STTS-CD       OF DCLVTRNFR          
           END-IF.                                                              
DJ0013     IF  W-FAIL-OPEN-CAGE-IND = 'N'                                       
DJ0013         MOVE 'Y'             TO FRV-MFC-CMPLT-IND  OF DCLVTRNFR          
DJ0013     END-IF.                                                              
DJ0016     IF  W-REJ-90DR = 'Y'                                                 
DJ0016         MOVE 'Y'             TO RSTR-TRD-90-DY-IND OF DCLVTRNFR          
DJ0016     END-IF.                                                              
DJ0016     IF  W-REJ-REGT = 'Y'                                                 
DJ0016         MOVE 'Y'             TO REG-T-IND          OF DCLVTRNFR          
DJ0016     END-IF.                                                              
DJ0024     IF  W-REJ-ARS          = 'Y'                                         
DJ0024         ADD 1 TO W-SET-ARS-CNT                                           
DJ0024         MOVE 'Y'             TO AUCTION-RT-IND     OF DCLVTRNFR          
DJ0024     END-IF.                                                              
LRM031     IF  W-REJ-PENNY        = 'Y'                                         
LRM031         ADD 1 TO W-SET-PENNY-CNT                                         
LRM031         MOVE 'Y'             TO PENNY-STK-IND      OF DCLVTRNFR          
LRM031     END-IF.                                                              
                                                                                
DJ0019     MOVE W-CYCLE-NBR         TO CYCLE-CD           OF DCLVTRNFR.         
DJ0019     MOVE W-SAVE-PROC-DATE    TO PRCS-DT            OF DCLVTRNFR.         
                                                                                
       5800-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  UPDATE VTRNFR TABLE                                                    
      *****************************************************************         
       5850-UPDATE-VTRNFR          SECTION.                                     
           MOVE '5850-UPDATE-VTRNFR           ' TO W-ROUTINE-1.                 
LRM027*****DISPLAY 'UPDATING VTRNFR ' W-SAVE-ACAT-CTL-NBR                       
LRM027*****    ' DB1 IND ' ACCT-DB-BAL-T1-IND OF DCLVTRNFR                      
                                                                                
           EXEC SQL                                                             
             UPDATE VTRNFR                                                      
                SET                                                             
                   UPDT_TMSTP          = :DCLVTRNFR.UPDT-TMSTP                  
                  ,PRGM_NM             = :DCLVTRNFR.PRGM-NM                     
                  ,STTS_CD             = :DCLVTRNFR.STTS-CD                     
                  ,DAYS_STTS_QTY       = :DCLVTRNFR.DAYS-STTS-QTY               
                  ,ACCT_MRGN_DB_IND    = :DCLVTRNFR.ACCT-MRGN-DB-IND            
                  ,ACCT_AST_EXCS_IND   = :DCLVTRNFR.ACCT-AST-EXCS-IND           
                  ,ACCT_DB_BAL_T1_IND  = :DCLVTRNFR.ACCT-DB-BAL-T1-IND          
                  ,ACCT_SHRT_PSTN_IND  = :DCLVTRNFR.ACCT-SHRT-PSTN-IND          
                  ,ACCT_SEC_RSTRD_IND  = :DCLVTRNFR.ACCT-SEC-RSTRD-IND          
                  ,ACCT_LTD_PRTNR_IND  = :DCLVTRNFR.ACCT-LTD-PRTNR-IND          
                  ,ACCT_OPTN_PSTN_IND  = :DCLVTRNFR.ACCT-OPTN-PSTN-IND          
                  ,CMNT_STTS_CD        = :DCLVTRNFR.CMNT-STTS-CD                
                  ,NSCC_PEND_CD        = :DCLVTRNFR.NSCC-PEND-CD                
DJ0013            ,FRV_MFC_CMPLT_IND   = :DCLVTRNFR.FRV-MFC-CMPLT-IND           
DJ0015            ,ACCT_FRZN_IND       = :DCLVTRNFR.ACCT-FRZN-IND               
DJ0016            ,RSTR_TRD_90_DY_IND  = :DCLVTRNFR.RSTR-TRD-90-DY-IND          
DJ0016            ,REG_T_IND           = :DCLVTRNFR.REG-T-IND                   
DJ0019            ,CYCLE_CD            = :DCLVTRNFR.CYCLE-CD                    
DJ0019            ,PRCS_DT             = :DCLVTRNFR.PRCS-DT                     
DJ0024            ,AUCTION_RT_IND      = :DCLVTRNFR.AUCTION-RT-IND              
LRM031            ,PENNY_STK_IND       = :DCLVTRNFR.PENNY-STK-IND               
LRM036            ,STTLM_TM_CD         = :DCLVTRNFR.STTLM-TM-CD                 
                WHERE  CLIENT_NBR        = :W-SAVE-CLIENT-NBR                   
                  AND  ACAT_CONTROL_NBR  = :W-SAVE-ACAT-CTL-NBR                 
           END-EXEC.                                                            
                                                                                
           MOVE 'VTRNFR  '               TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNFR-UPD-CNT                                        
DJ0002         PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                           
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-SAVE-CLIENT-NBR                                 
                          ' ' W-SAVE-ACAT-CTL-NBR                               
                      ' STA=' STTS-CD         OF DCLVTRNFR                      
                      ' DAY=' DAYS-STTS-QTY   OF DCLVTRNFR                      
                      ' => VTRNFR UPDATED <='                                   
DJ0012                ' ' TRNFR-TYPE-CD OF DCLVTRNFR                            
DJ0012                ' ' TRANS-TYPE-CD OF DCLVTRNFR                            
                      ' DEL-AC ' W-SAVE-ACCT-DLVR-NBR (1:3)                     
                             ' ' W-SAVE-ACCT-DLVR-NBR (4:5)                     
                      ' RCV-AC ' W-SAVE-ACCT-RCV-NBR  (1:3)                     
                             ' ' W-SAVE-ACCT-RCV-NBR  (4:5)                     
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-UPD-CNT                                    
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'INP=' W-INFILE-CNT                                      
                      ' CLT=' W-SAVE-CLIENT-NBR                                 
                      ' CTL=' W-SAVE-ACAT-CTL-NBR                               
                      ' STA=' STTS-CD         OF DCLVTRNFR                      
                      ' DAY=' DAYS-STTS-QTY   OF DCLVTRNFR                      
                      ' VTRNFR NOT UPDATED.'                                    
                      ' SQLCODE = ' W-DB2-SQLCODE                               
               IF  SQLCODE  =  +100                                             
                   DISPLAY '   BYPASSING VTRNFR UPDATE NOT FOUND.'              
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT515: ERROR UPDATING A ROW IN VTRNFR'             
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT515: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT515: DCLVTRNFR  ='                               
                           '(' DCLVTRNFR ')'                                    
                          PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT           
                   PERFORM  8100-SQL-ERROR THRU 8100-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5850-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR TRANSFER THAT ARE REJECTED                                         
      *  ADD THE NEW ROW TO THE INIT-TABLE                                      
      *****************************************************************         
       5900-INSERT-ACTITRF SECTION.                                             
           MOVE '5900-INSERT-ACTITRF         ' TO W-ROUTINE-1.                  
                                                                                
***********DISPLAY '5900-INSERT-ACTITRF'.                                       
                                                                                
           INITIALIZE                 DCLACTITRF                                
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
           MOVE CMNT-STTS-CD       OF DCLVTRNFR                                 
                                   TO CMNT-STTS-CD       OF DCLACTITRF          
           MOVE PHSCL-SEQ-NBR      OF DCLVTRNFR                                 
                                   TO PHSCL-SEQ-NBR      OF DCLACTITRF          
           MOVE LGCL-SEQ-NBR       OF DCLVTRNFR                                 
                                   TO LGCL-SEQ-NBR       OF DCLACTITRF          
           MOVE TRANS-TYPE-CD      OF DCLVTRNFR                                 
                                   TO TRANS-TYPE-CD      OF DCLACTITRF          
           MOVE TRNFR-TYPE-CD      OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-CD      OF DCLACTITRF          
***********MOVE SBMTG-PRTCP-NBR    OF DCLVTRNFR                                 
           MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                              
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
           MOVE ' '                                                             
                                   TO TRANS-RFRN-ID-CD   OF DCLACTITRF          
           MOVE CMNT-TXT           OF DCLVTRNFR                                 
                                   TO CMNT-TXT           OF DCLACTITRF          
           MOVE CICS-TERM-ID-CD    OF DCLVTRNFR                                 
                                   TO CICS-TERM-ID-CD    OF DCLACTITRF          
           MOVE CRT-TMSTP          OF DCLVTRNFR                                 
                                   TO CRT-TMSTP          OF DCLACTITRF          
           MOVE DB-CR-CD           OF DCLVTRNFR                                 
                                   TO DB-CR-CD           OF DCLACTITRF          
           MOVE NSCC-ACK-IND       OF DCLVTRNFR                                 
                                   TO NSCC-ACK-IND       OF DCLACTITRF          
                                                                                
           MOVE ' '                TO NSCC-PEND-CD       OF DCLACTITRF          
                                                                                
           MOVE PRGM-NM            OF DCLVTRNFR                                 
                                   TO PRGM-NM            OF DCLACTITRF          
           MOVE RR-CD              OF DCLVTRNFR                                 
                                   TO RR-CD              OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJC1-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJC1-CD OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJC2-CD OF DCLACTITRF          
           MOVE UPDT-TMSTP         OF DCLVTRNFR                                 
                                   TO UPDT-TMSTP         OF DCLACTITRF          
                                                                                
           IF  W-REJ-LP           = 'Y'                                         
               IF BH-ACAT-REJ-PEND-REC-LP-CODE > '00'                           
                  MOVE BH-ACAT-REJ-PEND-REC-LP-CODE                             
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
               END-IF                                                           
           END-IF                                                               
           IF  W-REJ-OPT          = 'Y'                                         
               IF BH-ACAT-REJ-PEND-REC-OPT-CODE > '00'                          
                  MOVE BH-ACAT-REJ-PEND-REC-OPT-CODE                            
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
               END-IF                                                           
           END-IF                                                               
           IF  W-REJ-NTS          = 'Y'                                         
               IF BH-ACAT-REJ-PEND-REC-NTS-CODE > '00'                          
                  MOVE BH-ACAT-REJ-PEND-REC-NTS-CODE                            
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
               END-IF                                                           
           END-IF                                                               
           IF  W-REJ-SP           = 'Y'                                         
               IF BH-ACAT-REJ-PEND-REC-SP-CODE > '00'                           
                  MOVE BH-ACAT-REJ-PEND-REC-SP-CODE                             
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
               END-IF                                                           
           END-IF                                                               
           IF  W-REJ-DB1          = 'Y'                                         
               IF BH-ACAT-REJ-PEND-REC-DB1-CODE > '00'                          
                  MOVE BH-ACAT-REJ-PEND-REC-DB1-CODE                            
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
               END-IF                                                           
           END-IF                                                               
           IF  W-REJ-MSD          = 'Y'                                         
               IF BH-ACAT-REJ-PEND-REC-MSD-CODE > '00'                          
                  MOVE BH-ACAT-REJ-PEND-REC-MSD-CODE                            
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
               END-IF                                                           
           END-IF                                                               
                                                                                
DJ0007***THIS APPLIES ONLY TO RCR'S                                             
DJ0007     IF  W-REJ-MF-AUTO-DELETE  = 'Y'                                      
DJ0007         MOVE '22'           TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0007     END-IF                                                               
                                                                                
DJ0017     IF  W-REJ-ACCT-FRZN    = 'Y'                                         
DJ0014     AND TRNFR-TYPE-RJCT-CD OF DCLACTITRF = ' '                           
DJ0017         IF (W-NSCC-AT-TFR-TYPE = 'PTD')                                  
DJ0017            DISPLAY '   REJECT 23: ACCOUNT IS FROZEN (HOLD)'              
DJ0017            MOVE '23'        TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0017         ELSE                                                             
DJ0017            DISPLAY '   REJECT 21: ACCOUNT IS FROZEN (HOLD)'              
DJ0017            MOVE '21'        TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0017         END-IF                                                           
DJ0014         MOVE 'ACCOUNT IS FROZEN'      TO CMNT-TXT OF DCLACTITRF          
DJ0014         MOVE 'H'            TO NSCC-PEND-CD       OF DCLACTITRF          
DJ0017     ELSE                                                                 
            IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-RCV-NBR                     
DJ0005         EVALUATE W-NSCC-AT-TFR-TYPE                                      
DJ0005             WHEN 'RCR'                                                   
DJ0005                   MOVE '22' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0005             WHEN 'PTD'                                                   
DJ0005                   MOVE '23' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0007             WHEN 'PTR'                                                   
DJ0007                   MOVE '23' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0005             WHEN 'FRV'                                                   
DJ0005                   MOVE '24' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0005             WHEN 'RCL'                                                   
DJ0005                   MOVE '25' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0005             WHEN 'CRD'                                                   
DJ0005                   MOVE '26' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0005             WHEN 'MFC'                                                   
DJ0005                   MOVE '27' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0005         END-EVALUATE                                                     
DJ0017      END-IF                                                              
           END-IF.                                                              
                                                                                
           MOVE 'R'                TO TRANS-TYPE-CD      OF DCLACTITRF.         
                                                                                
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
DJ0002         PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                           
               DISPLAY 'INP=' W-INFILE-CNT ' ACTITRF ADDED.'                    
           ELSE                                                                 
               ADD 1 TO W-ACTITRF-NOT-ADD-CNT                                   
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               IF  SQLCODE  =  -803                                             
                   PERFORM 5950-UPDATE-ACTITRF     THRU 5950-EXIT               
               ELSE                                                             
                   DISPLAY 'INP=' W-INFILE-CNT  ' ACTITRF NOT ADDED.'           
                                    ' SQLCODE = ' W-DB2-SQLCODE                 
                   DISPLAY '   '                                                
                          'ACTITRF PRIMARY KEY:'                                
                              ' CLT=' CLIENT-NBR    OF DCLVTRNFR                
                              ' TFR=' TRNFR-TYPE-CD OF DCLVTRNFR                
                   DISPLAY '    DLV=' DLVR-NBR      OF DCLVTRNFR                
                           ' DLV-AC=' ACCT-DLVR-NBR OF DCLVTRNFR                
                              ' RCV=' RCV-NBR       OF DCLVTRNFR                
                           ' RCV-AC=' ACCT-RCV-NBR  OF DCLVTRNFR                
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT515: ERROR INSERTING A ROW INTO ACTITRF'         
                        ' (ACAT-TRNFR TABLE)'                                   
                   DISPLAY 'CAT515: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT515: DCLACTITRF  ='                              
                        '(' DCLACTITRF ')'                                      
                          PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT           
                   PERFORM  8100-SQL-ERROR THRU 8100-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5900-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR TRANSFER RECEIVED WITH NO EXCEPTIONS                               
      *  ADD THE NEW ROW TO THE INIT-TABLE TO ACCELERATE THE TRANSFER           
      *****************************************************************         
       5910-ACCELERATE      SECTION.                                            
           MOVE '5910-ACCELERATE              ' TO W-ROUTINE-1.                 
                                                                                
***********DISPLAY '5910-ACCELERATE     '.                                      
                                                                                
           INITIALIZE                 DCLACTITRF                                
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
           MOVE CMNT-STTS-CD       OF DCLVTRNFR                                 
                                   TO CMNT-STTS-CD       OF DCLACTITRF          
           MOVE PHSCL-SEQ-NBR      OF DCLVTRNFR                                 
                                   TO PHSCL-SEQ-NBR      OF DCLACTITRF          
           MOVE LGCL-SEQ-NBR       OF DCLVTRNFR                                 
                                   TO LGCL-SEQ-NBR       OF DCLACTITRF          
           MOVE TRANS-TYPE-CD      OF DCLVTRNFR                                 
                                   TO TRANS-TYPE-CD      OF DCLACTITRF          
           MOVE TRNFR-TYPE-CD      OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-CD      OF DCLACTITRF          
DJ0010     MOVE RCV-NBR            OF DCLVTRNFR                                 
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
           MOVE ' '                                                             
                                   TO TRANS-RFRN-ID-CD   OF DCLACTITRF          
           MOVE CMNT-TXT           OF DCLVTRNFR                                 
                                   TO CMNT-TXT           OF DCLACTITRF          
           MOVE CICS-TERM-ID-CD    OF DCLVTRNFR                                 
                                   TO CICS-TERM-ID-CD    OF DCLACTITRF          
           MOVE CRT-TMSTP          OF DCLVTRNFR                                 
                                   TO CRT-TMSTP          OF DCLACTITRF          
           MOVE DB-CR-CD           OF DCLVTRNFR                                 
                                   TO DB-CR-CD           OF DCLACTITRF          
           MOVE NSCC-ACK-IND       OF DCLVTRNFR                                 
                                   TO NSCC-ACK-IND       OF DCLACTITRF          
                                                                                
           MOVE ' '                TO NSCC-PEND-CD       OF DCLACTITRF          
                                                                                
           MOVE PRGM-NM            OF DCLVTRNFR                                 
                                   TO PRGM-NM            OF DCLACTITRF          
           MOVE RR-CD              OF DCLVTRNFR                                 
                                   TO RR-CD              OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJC1-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJC1-CD OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJC2-CD OF DCLACTITRF          
           MOVE UPDT-TMSTP         OF DCLVTRNFR                                 
                                   TO UPDT-TMSTP         OF DCLACTITRF          
                                                                                
           MOVE 'X'                TO TRANS-TYPE-CD      OF DCLACTITRF          
                                                                                
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
DJ0002         PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                           
               ADD 1 TO W-ACCELERATE-ADD-CNT                                    
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                           ' CLT=' CLIENT-NBR       OF DCLACTITRF               
                           ' CTL=' ACAT-CONTROL-NBR OF DCLACTITRF               
DJ0009                     ' TFR=' TRNFR-TYPE-CD OF DCLACTITRF                  
                           ' ACCELERATE ADDED TO ACTITRF.'                      
           ELSE                                                                 
               ADD 1 TO W-ACTITRF-NOT-ADD-CNT                                   
               ADD 1 TO W-ACCELERATE-NOT-ADD-CNT                                
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               IF  SQLCODE  =  -803                                             
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                           ' CLT=' CLIENT-NBR       OF DCLACTITRF               
                           ' CTL=' ACAT-CONTROL-NBR OF DCLACTITRF               
DJ0009                     ' TFR=' TRNFR-TYPE-CD OF DCLACTITRF                  
                           ' ACCELERATE NOT ADDED TO ACTITRF.'                  
                           ' INIT TRANSFER ALREADY EXIST'                       
               ELSE                                                             
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                           ' CLT=' CLIENT-NBR       OF DCLACTITRF               
                           ' CTL=' ACAT-CONTROL-NBR OF DCLACTITRF               
DJ0009                     ' TFR=' TRNFR-TYPE-CD OF DCLACTITRF                  
                           ' ACCELERATE NOT ADDED TO ACTITRF.'                  
                           ' SQLCODE = ' W-DB2-SQLCODE                          
                   DISPLAY '   '                                                
                          'ACTITRF PRIMARY KEY:'                                
                              ' CLT=' CLIENT-NBR    OF DCLVTRNFR                
                              ' TFR=' TRNFR-TYPE-CD OF DCLVTRNFR                
                   DISPLAY '    DLV=' DLVR-NBR      OF DCLVTRNFR                
                           ' DLV-AC=' ACCT-DLVR-NBR OF DCLVTRNFR                
                              ' RCV=' RCV-NBR       OF DCLVTRNFR                
                           ' RCV-AC=' ACCT-RCV-NBR  OF DCLVTRNFR                
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT515: ERROR INSERTING A ROW INTO ACTITRF'         
                        ' (ACAT-TRNFR TABLE)'                                   
                   DISPLAY 'CAT515: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT515: DCLACTITRF  ='                              
                        '(' DCLACTITRF ')'                                      
                          PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT           
                   PERFORM  8100-SQL-ERROR THRU 8100-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5910-EXIT. EXIT.                                                         
      /                                                                         
       5950-UPDATE-ACTITRF SECTION.                                             
           MOVE '5950-UPDATE-ACTITRF       ' TO W-ROUTINE-1.                    
                                                                                
***********DISPLAY '5950-UPDATE-ACTITRF'.                                       
           MOVE ' '                      TO W-ACTITRF-SELECT-FIELDS             
                                                                                
           EXEC SQL SELECT                                                      
                      ACAT_CONTROL_NBR                                          
                     ,NSCC_PEND_CD                                              
                     ,PRCS_DT                                                   
                     ,PRGM_NM                                                   
                     ,UPDT_TMSTP                                                
                     ,TRNFR_TYPE_RJCT_CD                                        
DJ0007               ,CMNT_TXT                                                  
               INTO  :W-ACAT-CONTROL-NO                                         
                    ,:W-NSCC-PEND-CD                                            
                    ,:W-PRCS-DT                                                 
                    ,:W-PRGM-NM                                                 
                    ,:W-UPDT-TMSTP                                              
                    ,:W-TRNFR-TYPE-RJCT-CD                                      
DJ0007              ,:W-TRNFR-CMNT-TXT                                          
               FROM  ACTITRF                                                    
              WHERE  CLIENT_NBR        = :DCLVTRNFR.CLIENT-NBR                  
                AND  RCV_NBR           = :DCLVTRNFR.RCV-NBR                     
                AND  DLVR_NBR          = :DCLVTRNFR.DLVR-NBR                    
                AND  ACCT_RCV_NBR      = :DCLVTRNFR.ACCT-RCV-NBR                
                AND  ACCT_DLVR_NBR     = :DCLVTRNFR.ACCT-DLVR-NBR               
                AND  TRNFR_TYPE_CD     = :DCLVTRNFR.TRNFR-TYPE-CD               
           END-EXEC                                                             
                                                                                
           DISPLAY '   ACTITRF FOUND CTL=' W-ACAT-CONTROL-NO                    
                                ' RJCT-CD=' W-TRNFR-TYPE-RJCT-CD                
                                ' PEND-CD=' W-NSCC-PEND-CD                      
                                ' PRCS-DT=' W-PRCS-DT                           
                                ' PRGM-NM=' W-PRGM-NM                           
                             ' UPDT-TMSTP=' W-UPDT-TMSTP                        
                                                                                
           IF  W-ACAT-CONTROL-NO NOT = W-SAVE-ACAT-CTL-NBR                      
               DISPLAY '   ACAT-CONTROL-NBR NOT EQUAL. BYPASS'                  
               GO TO 5950-EXIT                                                  
           END-IF                                                               
                                                                                
           IF  TRNFR-TYPE-RJCT-CD OF DCLACTITRF > '00'                          
               GO TO 5950-EXIT                                                  
           END-IF                                                               
                                                                                
           IF  TRNFR-TYPE-RJCT-CD OF DCLACTITRF < '01'                          
             IF  W-REJ-LP           = 'Y'                                       
                 IF BH-ACAT-REJ-PEND-REC-LP-CODE > '00'                         
                    MOVE BH-ACAT-REJ-PEND-REC-LP-CODE                           
                                 TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF            
                 END-IF                                                         
             END-IF                                                             
             IF  W-REJ-OPT          = 'Y'                                       
                 IF BH-ACAT-REJ-PEND-REC-OPT-CODE > '00'                        
                    MOVE BH-ACAT-REJ-PEND-REC-OPT-CODE                          
                                 TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF            
                 END-IF                                                         
             END-IF                                                             
             IF  W-REJ-NTS          = 'Y'                                       
                 IF BH-ACAT-REJ-PEND-REC-NTS-CODE > '00'                        
                    MOVE BH-ACAT-REJ-PEND-REC-NTS-CODE                          
                                 TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF            
                 END-IF                                                         
             END-IF                                                             
             IF  W-REJ-SP           = 'Y'                                       
                 IF BH-ACAT-REJ-PEND-REC-SP-CODE > '00'                         
                    MOVE BH-ACAT-REJ-PEND-REC-SP-CODE                           
                                 TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF            
                 END-IF                                                         
             END-IF                                                             
             IF  W-REJ-DB1          = 'Y'                                       
                 IF BH-ACAT-REJ-PEND-REC-DB1-CODE > '00'                        
                    MOVE BH-ACAT-REJ-PEND-REC-DB1-CODE                          
                                 TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF            
                 END-IF                                                         
             END-IF                                                             
             IF  W-REJ-MSD          = 'Y'                                       
                 IF BH-ACAT-REJ-PEND-REC-MSD-CODE > '00'                        
                    MOVE BH-ACAT-REJ-PEND-REC-MSD-CODE                          
                                 TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF            
                 END-IF                                                         
             END-IF                                                             
             MOVE 'R'        TO TRANS-TYPE-CD          OF DCLACTITRF            
             MOVE ' '        TO NSCC-PEND-CD           OF DCLACTITRF            
           END-IF                                                               
                                                                                
           EXEC SQL                                                             
             UPDATE ACTITRF                                                     
                SET                                                             
                   TRANS_TYPE_CD       = :DCLACTITRF.TRANS-TYPE-CD              
                  ,TRNFR_TYPE_RJCT_CD  = :DCLACTITRF.TRNFR-TYPE-RJCT-CD         
                  ,CICS_TERM_ID_CD     = :DCLACTITRF.CICS-TERM-ID-CD            
                  ,UPDT_TMSTP          = :DCLACTITRF.UPDT-TMSTP                 
                  ,PRGM_NM             = :DCLACTITRF.PRGM-NM                    
                  ,NSCC_PEND_CD        = :DCLACTITRF.NSCC-PEND-CD               
DJ0007            ,CMNT_TXT            = :DCLACTITRF.CMNT-TXT                   
                WHERE  CLIENT_NBR        = :DCLVTRNFR.CLIENT-NBR                
                  AND  RCV_NBR           = :DCLVTRNFR.RCV-NBR                   
                  AND  DLVR_NBR          = :DCLVTRNFR.DLVR-NBR                  
                  AND  ACCT_RCV_NBR      = :DCLVTRNFR.ACCT-RCV-NBR              
                  AND  ACCT_DLVR_NBR     = :DCLVTRNFR.ACCT-DLVR-NBR             
                  AND  TRNFR_TYPE_CD     = :DCLVTRNFR.TRNFR-TYPE-CD             
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTITRF-UPD-CNT                                       
DJ0002         PERFORM 8300-SQL-COMMIT THRU 8300-EXIT                           
               DISPLAY 'INP=' W-INFILE-CNT ' ACTITRF UPDATED'                   
           ELSE                                                                 
               ADD 1 TO W-ACTITRF-NOT-UPD-CNT                                   
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'INP=' W-INFILE-CNT ' ACTITRF NOT UPDATED '              
                                ' SQLCODE = ' W-DB2-SQLCODE                     
                          PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT           
               DISPLAY '   ACTITRF PRIMARY KEY:'                                
                          ' CLT=' CLIENT-NBR    OF DCLVTRNFR                    
                          ' TFR=' TRNFR-TYPE-CD OF DCLVTRNFR                    
               DISPLAY '    DLV=' DLVR-NBR      OF DCLVTRNFR                    
                          ' RCV=' RCV-NBR       OF DCLVTRNFR                    
                       ' DLV-AC=' ACCT-DLVR-NBR OF DCLVTRNFR                    
                       ' RCV-AC=' ACCT-RCV-NBR  OF DCLVTRNFR                    
*************IF  L-RERUN                                                        
*************AND SQLCODE  =  +100                                               
             IF  SQLCODE  =  +100                                               
                   DISPLAY '   BYPASSING ACTITRF UPDATE NOT FOUND.'             
             ELSE                                                               
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT515: ERROR UPDATING A ROW IN ACTITRF'            
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT515: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT515: DCLACTITRF  ='                              
                           '(' DCLACTITRF ')'                                   
                          PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT           
                   PERFORM  8100-SQL-ERROR THRU 8100-EXIT                       
             END-IF                                                             
           END-IF.                                                              
                                                                                
       5950-EXIT. EXIT.                                                         
      /                                                                         
       6000-SELECT-ACTIAST      SECTION.                                        
           MOVE '6000-SELECT-ACTIAST         ' TO W-ROUTINE-1.                  
                                                                                
           IF (W-NSCC-AT-OP-LEN                                                 
           AND W-NSCC-AT-OPT-CATG > '00')                                       
               IF W-ACTIOPN-FND-SW = 'Y'                                        
                  MOVE ISIN-SEC-ISSUE-CD OF DCLACTIOPN                          
                                         TO W-NSCC-AT-SEC-ID                    
               END-IF                                                           
           END-IF.                                                              
           IF  W-NSCC-AT-SEC-ID > ' '                                           
               PERFORM 6050-SELECT-ACTIAST-QTY THRU 6050-EXIT                   
               GO TO 6000-EXIT                                                  
           END-IF.                                                              
           MOVE 'N' TO W-ACTIAST-FND-SW                                         
                                                                                
LRM038     IF W-DSTBN-SIDE-CD = 'D'                                             
LRM038     AND W-NSCC-AT-ASST-COMMENT(1:18)  =  'ORIGINAL CURRENCY '            
LRM038     AND W-NSCC-AT-ASST-COMMENT(19:3) NUMERIC                             
LRM038        MOVE W-NSCC-AT-ASST-COMMENT(19:3) TO                              
LRM038                                   CRNCY-CD OF DCLACTIAST                 
LRM038        DISPLAY 'SELECTING ACTIAST VIA FCURR '                            
LRM038             W-NSCC-AT-ASST-COMMENT(19:3)                                 
LRM038                                                                          
LRM038      EXEC SQL SELECT                                                     
LRM038              CLIENT_NBR                                                  
LRM038             ,DLVR_NBR                                                    
LRM038             ,ACCT_DLVR_NBR                                               
LRM038             ,RCV_NBR                                                     
LRM038             ,ACCT_RCV_NBR                                                
LRM038             ,ISIN_CNTRY_CD                                               
LRM038             ,ISIN_SEC_ISSUE_CD                                           
LRM038             ,ISIN_SEC_CDG_CD                                             
LRM038             ,STTLM_LCTN_CD                                               
LRM038             ,CSH_MGN_SHRT_CD                                             
LRM038             ,CSH_MRG_SHT_STS_CD                                          
LRM038             ,STTLM_LCTN_STTS_CD                                          
LRM038             ,ISIN_CNTRY_STTS_CD                                          
LRM038             ,SBMTG_PRTCP_NBR                                             
LRM038             ,SBMT_PRT_NR_STS_CD                                          
LRM038             ,ACAT_CONTROL_NBR                                            
LRM038             ,CONTROL_NBR_STS_CD                                          
LRM038             ,ASSET_SEQ_NBR                                               
LRM038             ,AST_SEQ_NBR_STS_CD                                          
LRM038             ,TRANS_TYPE_CD                                               
LRM038             ,TRANS_TYPE_STTS_CD                                          
LRM038             ,PHSCL_SEQ_NBR                                               
LRM038             ,PHSCL_SEQ_STTS_CD                                           
LRM038             ,LGCL_SEQ_NBR                                                
LRM038             ,LGCL_SEQ_NR_STS_CD                                          
LRM038             ,ASSET_PRC_CTGY_CD                                           
LRM038             ,AST_PRC_CTG_STS_CD                                          
LRM038             ,STTLM_RSN_CD                                                
LRM038             ,STTLM_RSN_STTS_CD                                           
LRM038             ,ASSET_DESC_TXT                                              
LRM038             ,ASSET_DESC_STTS_CD                                          
LRM038             ,ASSET_RQST_QTY_CD                                           
LRM038             ,ASSET_RQST_STS_CD                                           
LRM038             ,AST_RQST_TRANS_CD                                           
LRM038             ,AST_RQ_TRAN_STS_CD                                          
LRM038             ,ASSET_QTY                                                   
LRM038             ,ASSET_QTY_STTS_CD                                           
LRM038             ,ASSET_PCT                                                   
LRM038             ,ASSET_PCT_STTS_CD                                           
LRM038             ,PSTN_CD                                                     
LRM038             ,PSTN_CD_STTS_CD                                             
LRM038             ,ISO_CRNCY_CD                                                
LRM038             ,ISO_CRNCY_STTS_CD                                           
LRM038             ,ASSET_AMT                                                   
LRM038             ,ASSET_AMT_STTS_CD                                           
LRM038             ,BEARER_BOND_CD                                              
LRM038             ,BEARER_BND_STTS_CD                                          
LRM038             ,WHI_CD                                                      
LRM038             ,WHI_STTS_CD                                                 
LRM038             ,TRNFR_TYPE_RSN_CD                                           
LRM038             ,TRN_TYP_RSN_STS_CD                                          
LRM038             ,MBS_SERIAL_NBR                                              
LRM038             ,MBS_SERIAL_STTS_CD                                          
LRM038             ,ASSET_CMNT_TXT                                              
LRM038             ,ASSET_CMNT_STTS_CD                                          
LRM038             ,NSCC_WTHLD_CD                                               
LRM038             ,TRANS_RFRN_ID_CD                                            
LRM038             ,TRANS_RFRN_STTS_CD                                          
LRM038             ,ISIN_SEC_IS_STS_CD                                          
LRM038             ,ISIN_SEC_CD_STS_CD                                          
LRM038             ,OPTN_CTGY_CD                                                
LRM038             ,OPTN_CTGY_STTS_CD                                           
LRM038             ,RCRD_LNGTH_STTS_CD                                          
LRM038             ,RCRD_STTS_CD                                                
LRM038             ,NSCC_PEND_CD                                                
LRM038             ,NSCC_ACK_IND                                                
LRM038             ,PRGM_NM                                                     
LRM038             ,CICS_TERM_ID_CD                                             
LRM038             ,UPDT_TMSTP                                                  
LRM038             ,CRT_TMSTP                                                   
LRM038             ,SECURITY_ADP_NBR                                            
LRM038             ,TRNFR_TYPE_CD                                               
LRM038             ,TRNFR_TYPE_STTS_CD                                          
LRM038             ,RCV_NBR_STTS_CD                                             
LRM038             ,DLVR_NBR_STTS_CD                                            
LRM038             ,CAGE_TAG_NBR                                                
LRM038             ,SCRTY_866_NBR                                               
LRM038             ,ASSET_866_QTY                                               
LRM038             ,CRNCY_CD                                                    
LRM038          INTO                                                            
LRM038              :DCLACTIAST.CLIENT-NBR                                      
LRM038             ,:DCLACTIAST.DLVR-NBR                                        
LRM038             ,:DCLACTIAST.ACCT-DLVR-NBR                                   
LRM038             ,:DCLACTIAST.RCV-NBR                                         
LRM038             ,:DCLACTIAST.ACCT-RCV-NBR                                    
LRM038             ,:DCLACTIAST.ISIN-CNTRY-CD                                   
LRM038             ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                               
LRM038             ,:DCLACTIAST.ISIN-SEC-CDG-CD                                 
LRM038             ,:DCLACTIAST.STTLM-LCTN-CD                                   
LRM038             ,:DCLACTIAST.CSH-MGN-SHRT-CD                                 
LRM038             ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                              
LRM038             ,:DCLACTIAST.STTLM-LCTN-STTS-CD                              
LRM038             ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                              
LRM038             ,:DCLACTIAST.SBMTG-PRTCP-NBR                                 
LRM038             ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                              
LRM038             ,:DCLACTIAST.ACAT-CONTROL-NBR                                
LRM038             ,:DCLACTIAST.CONTROL-NBR-STS-CD                              
LRM038             ,:DCLACTIAST.ASSET-SEQ-NBR                                   
LRM038             ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                              
LRM038             ,:DCLACTIAST.TRANS-TYPE-CD                                   
LRM038             ,:DCLACTIAST.TRANS-TYPE-STTS-CD                              
LRM038             ,:DCLACTIAST.PHSCL-SEQ-NBR                                   
LRM038             ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                               
LRM038             ,:DCLACTIAST.LGCL-SEQ-NBR                                    
LRM038             ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                              
LRM038             ,:DCLACTIAST.ASSET-PRC-CTGY-CD                               
LRM038             ,:DCLACTIAST.AST-PRC-CTG-STS-CD                              
LRM038             ,:DCLACTIAST.STTLM-RSN-CD                                    
LRM038             ,:DCLACTIAST.STTLM-RSN-STTS-CD                               
LRM038             ,:DCLACTIAST.ASSET-DESC-TXT                                  
LRM038             ,:DCLACTIAST.ASSET-DESC-STTS-CD                              
LRM038             ,:DCLACTIAST.ASSET-RQST-QTY-CD                               
LRM038             ,:DCLACTIAST.ASSET-RQST-STS-CD                               
LRM038             ,:DCLACTIAST.AST-RQST-TRANS-CD                               
LRM038             ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                              
LRM038             ,:DCLACTIAST.ASSET-QTY                                       
LRM038             ,:DCLACTIAST.ASSET-QTY-STTS-CD                               
LRM038             ,:DCLACTIAST.ASSET-PCT                                       
LRM038             ,:DCLACTIAST.ASSET-PCT-STTS-CD                               
LRM038             ,:DCLACTIAST.PSTN-CD                                         
LRM038             ,:DCLACTIAST.PSTN-CD-STTS-CD                                 
LRM038             ,:DCLACTIAST.ISO-CRNCY-CD                                    
LRM038             ,:DCLACTIAST.ISO-CRNCY-STTS-CD                               
LRM038             ,:DCLACTIAST.ASSET-AMT                                       
LRM038             ,:DCLACTIAST.ASSET-AMT-STTS-CD                               
LRM038             ,:DCLACTIAST.BEARER-BOND-CD                                  
LRM038             ,:DCLACTIAST.BEARER-BND-STTS-CD                              
LRM038             ,:DCLACTIAST.WHI-CD                                          
LRM038             ,:DCLACTIAST.WHI-STTS-CD                                     
LRM038             ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                               
LRM038             ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                              
LRM038             ,:DCLACTIAST.MBS-SERIAL-NBR                                  
LRM038             ,:DCLACTIAST.MBS-SERIAL-STTS-CD                              
LRM038             ,:DCLACTIAST.ASSET-CMNT-TXT                                  
LRM038             ,:DCLACTIAST.ASSET-CMNT-STTS-CD                              
LRM038             ,:DCLACTIAST.NSCC-WTHLD-CD                                   
LRM038             ,:DCLACTIAST.TRANS-RFRN-ID-CD                                
LRM038             ,:DCLACTIAST.TRANS-RFRN-STTS-CD                              
LRM038             ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                              
LRM038             ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                              
LRM038             ,:DCLACTIAST.OPTN-CTGY-CD                                    
LRM038             ,:DCLACTIAST.OPTN-CTGY-STTS-CD                               
LRM038             ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                              
LRM038             ,:DCLACTIAST.RCRD-STTS-CD                                    
LRM038             ,:DCLACTIAST.NSCC-PEND-CD                                    
LRM038             ,:DCLACTIAST.NSCC-ACK-IND                                    
LRM038             ,:DCLACTIAST.PRGM-NM                                         
LRM038             ,:DCLACTIAST.CICS-TERM-ID-CD                                 
LRM038             ,:DCLACTIAST.UPDT-TMSTP                                      
LRM038             ,:DCLACTIAST.CRT-TMSTP                                       
LRM038             ,:DCLACTIAST.SECURITY-ADP-NBR                                
LRM038             ,:DCLACTIAST.TRNFR-TYPE-CD                                   
LRM038             ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                              
LRM038             ,:DCLACTIAST.RCV-NBR-STTS-CD                                 
LRM038             ,:DCLACTIAST.DLVR-NBR-STTS-CD                                
LRM038             ,:DCLACTIAST.CAGE-TAG-NBR                                    
LRM038             ,:DCLACTIAST.SCRTY-866-NBR                                   
LRM038             ,:DCLACTIAST.ASSET-866-QTY                                   
LRM038             ,:DCLACTIAST.CRNCY-CD                                        
LRM038          FROM ACTIAST                                                    
LRM038          WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR               
LRM038            AND  RCV_NBR           = :W-NSCC-AT-RCV-NBR                   
LRM038            AND  DLVR_NBR          = :W-NSCC-AT-DEL-NBR                   
LRM038            AND  ACCT_DLVR_NBR     = :W-SAVE-ACCT-DLVR-NBR                
LRM038            AND  ACCT_RCV_NBR      = :W-SAVE-ACCT-RCV-NBR                 
LRM038            AND  STTLM_LCTN_CD     = :W-NSCC-AT-STL-LOC                   
LRM038            AND  STTLM_RSN_CD      = :W-NSCC-AT-STL-LOC-RSN-CD            
LRM038            AND  ISIN_SEC_ISSUE_CD = :W-NSCC-AT-SEC-ID                    
LRM038            AND  CSH_MGN_SHRT_CD   = :W-NSCC-AT-CASH-MRGN-SHTCD           
LRM038            AND  TRANS_RFRN_ID_CD  = :W-NSCC-AT-TRAN-REF-ID               
LRM038            AND  ASSET_AMT         = :W-ASSET-AMT                         
LRM038            AND  CRNCY_CD          = :DCLACTIAST.CRNCY-CD                 
LRM038       END-EXEC                                                           
LRM038       IF  SQLCODE  =  +0                                                 
LRM038           DISPLAY 'FOUND FCURR VIA AMT'                                  
LRM038       END-IF                                                             
LRM038     ELSE                                                                 
LRM038       MOVE SPACES TO  CRNCY-CD OF DCLACTIAST                             
             EXEC SQL SELECT                                                    
                    CLIENT_NBR                                                  
                   ,DLVR_NBR                                                    
                   ,ACCT_DLVR_NBR                                               
                   ,RCV_NBR                                                     
                   ,ACCT_RCV_NBR                                                
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_CDG_CD                                             
                   ,STTLM_LCTN_CD                                               
                   ,CSH_MGN_SHRT_CD                                             
                   ,CSH_MRG_SHT_STS_CD                                          
                   ,STTLM_LCTN_STTS_CD                                          
                   ,ISIN_CNTRY_STTS_CD                                          
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,ACAT_CONTROL_NBR                                            
                   ,CONTROL_NBR_STS_CD                                          
                   ,ASSET_SEQ_NBR                                               
                   ,AST_SEQ_NBR_STS_CD                                          
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,ASSET_PRC_CTGY_CD                                           
                   ,AST_PRC_CTG_STS_CD                                          
                   ,STTLM_RSN_CD                                                
                   ,STTLM_RSN_STTS_CD                                           
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
                   ,WHI_CD                                                      
                   ,WHI_STTS_CD                                                 
                   ,TRNFR_TYPE_RSN_CD                                           
                   ,TRN_TYP_RSN_STS_CD                                          
                   ,MBS_SERIAL_NBR                                              
                   ,MBS_SERIAL_STTS_CD                                          
                   ,ASSET_CMNT_TXT                                              
                   ,ASSET_CMNT_STTS_CD                                          
                   ,NSCC_WTHLD_CD                                               
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,ISIN_SEC_IS_STS_CD                                          
                   ,ISIN_SEC_CD_STS_CD                                          
                   ,OPTN_CTGY_CD                                                
                   ,OPTN_CTGY_STTS_CD                                           
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,NSCC_PEND_CD                                                
                   ,NSCC_ACK_IND                                                
                   ,PRGM_NM                                                     
                   ,CICS_TERM_ID_CD                                             
                   ,UPDT_TMSTP                                                  
                   ,CRT_TMSTP                                                   
                   ,SECURITY_ADP_NBR                                            
                   ,TRNFR_TYPE_CD                                               
                   ,TRNFR_TYPE_STTS_CD                                          
                   ,RCV_NBR_STTS_CD                                             
                   ,DLVR_NBR_STTS_CD                                            
DJ0006             ,CAGE_TAG_NBR                                                
DJ0011             ,SCRTY_866_NBR                                               
DJ0011             ,ASSET_866_QTY                                               
                INTO                                                            
                    :DCLACTIAST.CLIENT-NBR                                      
                   ,:DCLACTIAST.DLVR-NBR                                        
                   ,:DCLACTIAST.ACCT-DLVR-NBR                                   
                   ,:DCLACTIAST.RCV-NBR                                         
                   ,:DCLACTIAST.ACCT-RCV-NBR                                    
                   ,:DCLACTIAST.ISIN-CNTRY-CD                                   
                   ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                               
                   ,:DCLACTIAST.ISIN-SEC-CDG-CD                                 
                   ,:DCLACTIAST.STTLM-LCTN-CD                                   
                   ,:DCLACTIAST.CSH-MGN-SHRT-CD                                 
                   ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                              
                   ,:DCLACTIAST.STTLM-LCTN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                              
                   ,:DCLACTIAST.SBMTG-PRTCP-NBR                                 
                   ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                              
                   ,:DCLACTIAST.ACAT-CONTROL-NBR                                
                   ,:DCLACTIAST.CONTROL-NBR-STS-CD                              
                   ,:DCLACTIAST.ASSET-SEQ-NBR                                   
                   ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                              
                   ,:DCLACTIAST.TRANS-TYPE-CD                                   
                   ,:DCLACTIAST.TRANS-TYPE-STTS-CD                              
                   ,:DCLACTIAST.PHSCL-SEQ-NBR                                   
                   ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                               
                   ,:DCLACTIAST.LGCL-SEQ-NBR                                    
                   ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                              
                   ,:DCLACTIAST.ASSET-PRC-CTGY-CD                               
                   ,:DCLACTIAST.AST-PRC-CTG-STS-CD                              
                   ,:DCLACTIAST.STTLM-RSN-CD                                    
                   ,:DCLACTIAST.STTLM-RSN-STTS-CD                               
                   ,:DCLACTIAST.ASSET-DESC-TXT                                  
                   ,:DCLACTIAST.ASSET-DESC-STTS-CD                              
                   ,:DCLACTIAST.ASSET-RQST-QTY-CD                               
                   ,:DCLACTIAST.ASSET-RQST-STS-CD                               
                   ,:DCLACTIAST.AST-RQST-TRANS-CD                               
                   ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                              
                   ,:DCLACTIAST.ASSET-QTY                                       
                   ,:DCLACTIAST.ASSET-QTY-STTS-CD                               
                   ,:DCLACTIAST.ASSET-PCT                                       
                   ,:DCLACTIAST.ASSET-PCT-STTS-CD                               
                   ,:DCLACTIAST.PSTN-CD                                         
                   ,:DCLACTIAST.PSTN-CD-STTS-CD                                 
                   ,:DCLACTIAST.ISO-CRNCY-CD                                    
                   ,:DCLACTIAST.ISO-CRNCY-STTS-CD                               
                   ,:DCLACTIAST.ASSET-AMT                                       
                   ,:DCLACTIAST.ASSET-AMT-STTS-CD                               
                   ,:DCLACTIAST.BEARER-BOND-CD                                  
                   ,:DCLACTIAST.BEARER-BND-STTS-CD                              
                   ,:DCLACTIAST.WHI-CD                                          
                   ,:DCLACTIAST.WHI-STTS-CD                                     
                   ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                               
                   ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                              
                   ,:DCLACTIAST.MBS-SERIAL-NBR                                  
                   ,:DCLACTIAST.MBS-SERIAL-STTS-CD                              
                   ,:DCLACTIAST.ASSET-CMNT-TXT                                  
                   ,:DCLACTIAST.ASSET-CMNT-STTS-CD                              
                   ,:DCLACTIAST.NSCC-WTHLD-CD                                   
                   ,:DCLACTIAST.TRANS-RFRN-ID-CD                                
                   ,:DCLACTIAST.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                              
                   ,:DCLACTIAST.OPTN-CTGY-CD                                    
                   ,:DCLACTIAST.OPTN-CTGY-STTS-CD                               
                   ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTIAST.RCRD-STTS-CD                                    
                   ,:DCLACTIAST.NSCC-PEND-CD                                    
                   ,:DCLACTIAST.NSCC-ACK-IND                                    
                   ,:DCLACTIAST.PRGM-NM                                         
                   ,:DCLACTIAST.CICS-TERM-ID-CD                                 
                   ,:DCLACTIAST.UPDT-TMSTP                                      
                   ,:DCLACTIAST.CRT-TMSTP                                       
                   ,:DCLACTIAST.SECURITY-ADP-NBR                                
                   ,:DCLACTIAST.TRNFR-TYPE-CD                                   
                   ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                              
                   ,:DCLACTIAST.RCV-NBR-STTS-CD                                 
                   ,:DCLACTIAST.DLVR-NBR-STTS-CD                                
DJ0006             ,:DCLACTIAST.CAGE-TAG-NBR                                    
DJ0011             ,:DCLACTIAST.SCRTY-866-NBR                                   
DJ0011             ,:DCLACTIAST.ASSET-866-QTY                                   
                FROM ACTIAST                                                    
                WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR               
                  AND  RCV_NBR           = :W-NSCC-AT-RCV-NBR                   
                  AND  DLVR_NBR          = :W-NSCC-AT-DEL-NBR                   
                  AND  ACCT_DLVR_NBR     = :W-SAVE-ACCT-DLVR-NBR                
                  AND  ACCT_RCV_NBR      = :W-SAVE-ACCT-RCV-NBR                 
                  AND  STTLM_LCTN_CD     = :W-NSCC-AT-STL-LOC                   
                  AND  STTLM_RSN_CD      = :W-NSCC-AT-STL-LOC-RSN-CD            
                  AND  ISIN_SEC_ISSUE_CD = :W-NSCC-AT-SEC-ID                    
                  AND  CSH_MGN_SHRT_CD   = :W-NSCC-AT-CASH-MRGN-SHTCD           
                  AND  TRANS_RFRN_ID_CD  = :W-NSCC-AT-TRAN-REF-ID               
                  AND  ASSET_AMT         = :W-ASSET-AMT                         
LRM038            AND  CRNCY_CD          = :DCLACTIAST.CRNCY-CD                 
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIAST'                TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               MOVE 'Y' TO W-ACTIAST-FND-SW                                     
               ADD 1 TO W-ACTIAST-FND-CNT                                       
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                              ' ' W-NSCC-KEY-CLIENT-NBR                         
                              ' ' W-NSCC-ACAT-CTL-NBR                           
                              ' ' W-ASSET-SEQ-NBR                               
                              ' ' W-NSCC-AT-TRAN-TYPE                           
                              ' ' W-NSCC-AT-TFR-TYPE                            
                          ' DST=' W-DSTBN-SIDE-CD                               
DJ0002                ' 6000:FOUND ' W-NSCC-AT-SEC-ID                           
DJ0002              ' ' STTLM-LCTN-CD     OF DCLACTIAST                         
DJ0002              ' ' CSH-MGN-SHRT-CD   OF DCLACTIAST                         
DJ0002              ' ' STTLM-RSN-CD      OF DCLACTIAST                         
DJ0002              ' ' ASSET-PRC-CTGY-CD OF DCLACTIAST                         
DJ0002                                ' AMT=' W-ASSET-AMT-X                     
           ELSE                                                                 
               IF  SQLCODE  =  +100 OR -811                                     
                   MOVE 'N' TO W-ACTIAST-FND-SW                                 
                   ADD 1 TO W-ACTIAST-NOTFND-CNT                                
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                              ' ' W-NSCC-KEY-CLIENT-NBR                         
                              ' ' W-NSCC-ACAT-CTL-NBR                           
                              ' ' W-ASSET-SEQ-NBR                               
                              ' ' W-NSCC-AT-TRAN-TYPE                           
                              ' ' W-NSCC-AT-TFR-TYPE                            
                          ' DST=' W-DSTBN-SIDE-CD                               
DJ0002                ' 6000:NOTFD ' W-NSCC-AT-SEC-ID                           
                                          ' ' W-NSCC-AT-STL-LOC                 
DJ0002                                    ' ' W-NSCC-AT-CASH-MRGN-SHTCD         
                                          ' ' W-NSCC-AT-STL-LOC-RSN-CD          
DJ0002                                    ' ' W-NSCC-AT-ASSET-PRC-CATG          
DJ0002                                ' AMT=' W-ASSET-AMT-X                     
                                          ' ' W-DB2-SQLCODE                     
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                              ' ' W-NSCC-KEY-CLIENT-NBR                         
                              ' ' W-NSCC-ACAT-CTL-NBR                           
                              ' ' W-ASSET-SEQ-NBR                               
                              ' ' W-NSCC-AT-TRAN-TYPE                           
                              ' ' W-NSCC-AT-TFR-TYPE                            
                          ' DST=' W-DSTBN-SIDE-CD                               
DJ0002                ' 6000:NOTFD ' W-NSCC-AT-SEC-ID                           
                                          ' ' W-NSCC-AT-STL-LOC                 
DJ0002                                    ' ' W-NSCC-AT-CASH-MRGN-SHTCD         
                                          ' ' W-NSCC-AT-STL-LOC-RSN-CD          
DJ0002                                    ' ' W-NSCC-AT-ASSET-PRC-CATG          
DJ0002                                ' AMT=' W-ASSET-AMT-X                     
                                          ' ' W-DB2-SQLCODE                     
                   DISPLAY 'CAT515: ERROR SELECTING A ROW FROM ACTIAST'         
                         ' (ACAT-INIT-ASSET TABLE)'                             
                   DISPLAY 'CAT515: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT515: DCLACTIAST='                                
                           '(' DCLACTIAST ')'                                   
                   PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT                  
                   PERFORM  8100-SQL-ERROR THRU 8100-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6000-EXIT. EXIT.                                                         
      /                                                                         
       6050-SELECT-ACTIAST-QTY SECTION.                                         
           MOVE '6050-SELECT-ACTIAST-QTY     ' TO W-ROUTINE-1.                  
                                                                                
           MOVE 'N' TO W-ACTIAST-FND-SW                                         
                                                                                
LRM038     IF W-DSTBN-SIDE-CD = 'D'                                             
LRM038     AND W-NSCC-AT-ASST-COMMENT(1:18)  =  'ORIGINAL CURRENCY '            
LRM038     AND W-NSCC-AT-ASST-COMMENT(19:3) NUMERIC                             
LRM038        MOVE W-NSCC-AT-ASST-COMMENT(19:3) TO                              
LRM038                                   CRNCY-CD OF DCLACTIAST                 
LRM038        DISPLAY 'SELECTING ACTIAST VIA FCURR '                            
LRM038             W-NSCC-AT-ASST-COMMENT(19:3)                                 
                                                                                
              EXEC SQL SELECT                                                   
                    CLIENT_NBR                                                  
                   ,DLVR_NBR                                                    
                   ,ACCT_DLVR_NBR                                               
                   ,RCV_NBR                                                     
                   ,ACCT_RCV_NBR                                                
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_CDG_CD                                             
                   ,STTLM_LCTN_CD                                               
                   ,CSH_MGN_SHRT_CD                                             
                   ,CSH_MRG_SHT_STS_CD                                          
                   ,STTLM_LCTN_STTS_CD                                          
                   ,ISIN_CNTRY_STTS_CD                                          
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,ACAT_CONTROL_NBR                                            
                   ,CONTROL_NBR_STS_CD                                          
                   ,ASSET_SEQ_NBR                                               
                   ,AST_SEQ_NBR_STS_CD                                          
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,ASSET_PRC_CTGY_CD                                           
                   ,AST_PRC_CTG_STS_CD                                          
                   ,STTLM_RSN_CD                                                
                   ,STTLM_RSN_STTS_CD                                           
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
                   ,WHI_CD                                                      
                   ,WHI_STTS_CD                                                 
                   ,TRNFR_TYPE_RSN_CD                                           
                   ,TRN_TYP_RSN_STS_CD                                          
                   ,MBS_SERIAL_NBR                                              
                   ,MBS_SERIAL_STTS_CD                                          
                   ,ASSET_CMNT_TXT                                              
                   ,ASSET_CMNT_STTS_CD                                          
                   ,NSCC_WTHLD_CD                                               
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,ISIN_SEC_IS_STS_CD                                          
                   ,ISIN_SEC_CD_STS_CD                                          
                   ,OPTN_CTGY_CD                                                
                   ,OPTN_CTGY_STTS_CD                                           
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,NSCC_PEND_CD                                                
                   ,NSCC_ACK_IND                                                
                   ,PRGM_NM                                                     
                   ,CICS_TERM_ID_CD                                             
                   ,UPDT_TMSTP                                                  
                   ,CRT_TMSTP                                                   
                   ,SECURITY_ADP_NBR                                            
                   ,TRNFR_TYPE_CD                                               
                   ,TRNFR_TYPE_STTS_CD                                          
                   ,RCV_NBR_STTS_CD                                             
                   ,DLVR_NBR_STTS_CD                                            
DJ0006             ,CAGE_TAG_NBR                                                
DJ0011             ,SCRTY_866_NBR                                               
DJ0011             ,ASSET_866_QTY                                               
LRM038             ,CRNCY_CD                                                    
                INTO                                                            
                    :DCLACTIAST.CLIENT-NBR                                      
                   ,:DCLACTIAST.DLVR-NBR                                        
                   ,:DCLACTIAST.ACCT-DLVR-NBR                                   
                   ,:DCLACTIAST.RCV-NBR                                         
                   ,:DCLACTIAST.ACCT-RCV-NBR                                    
                   ,:DCLACTIAST.ISIN-CNTRY-CD                                   
                   ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                               
                   ,:DCLACTIAST.ISIN-SEC-CDG-CD                                 
                   ,:DCLACTIAST.STTLM-LCTN-CD                                   
                   ,:DCLACTIAST.CSH-MGN-SHRT-CD                                 
                   ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                              
                   ,:DCLACTIAST.STTLM-LCTN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                              
                   ,:DCLACTIAST.SBMTG-PRTCP-NBR                                 
                   ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                              
                   ,:DCLACTIAST.ACAT-CONTROL-NBR                                
                   ,:DCLACTIAST.CONTROL-NBR-STS-CD                              
                   ,:DCLACTIAST.ASSET-SEQ-NBR                                   
                   ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                              
                   ,:DCLACTIAST.TRANS-TYPE-CD                                   
                   ,:DCLACTIAST.TRANS-TYPE-STTS-CD                              
                   ,:DCLACTIAST.PHSCL-SEQ-NBR                                   
                   ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                               
                   ,:DCLACTIAST.LGCL-SEQ-NBR                                    
                   ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                              
                   ,:DCLACTIAST.ASSET-PRC-CTGY-CD                               
                   ,:DCLACTIAST.AST-PRC-CTG-STS-CD                              
                   ,:DCLACTIAST.STTLM-RSN-CD                                    
                   ,:DCLACTIAST.STTLM-RSN-STTS-CD                               
                   ,:DCLACTIAST.ASSET-DESC-TXT                                  
                   ,:DCLACTIAST.ASSET-DESC-STTS-CD                              
                   ,:DCLACTIAST.ASSET-RQST-QTY-CD                               
                   ,:DCLACTIAST.ASSET-RQST-STS-CD                               
                   ,:DCLACTIAST.AST-RQST-TRANS-CD                               
                   ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                              
                   ,:DCLACTIAST.ASSET-QTY                                       
                   ,:DCLACTIAST.ASSET-QTY-STTS-CD                               
                   ,:DCLACTIAST.ASSET-PCT                                       
                   ,:DCLACTIAST.ASSET-PCT-STTS-CD                               
                   ,:DCLACTIAST.PSTN-CD                                         
                   ,:DCLACTIAST.PSTN-CD-STTS-CD                                 
                   ,:DCLACTIAST.ISO-CRNCY-CD                                    
                   ,:DCLACTIAST.ISO-CRNCY-STTS-CD                               
                   ,:DCLACTIAST.ASSET-AMT                                       
                   ,:DCLACTIAST.ASSET-AMT-STTS-CD                               
                   ,:DCLACTIAST.BEARER-BOND-CD                                  
                   ,:DCLACTIAST.BEARER-BND-STTS-CD                              
                   ,:DCLACTIAST.WHI-CD                                          
                   ,:DCLACTIAST.WHI-STTS-CD                                     
                   ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                               
                   ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                              
                   ,:DCLACTIAST.MBS-SERIAL-NBR                                  
                   ,:DCLACTIAST.MBS-SERIAL-STTS-CD                              
                   ,:DCLACTIAST.ASSET-CMNT-TXT                                  
                   ,:DCLACTIAST.ASSET-CMNT-STTS-CD                              
                   ,:DCLACTIAST.NSCC-WTHLD-CD                                   
                   ,:DCLACTIAST.TRANS-RFRN-ID-CD                                
                   ,:DCLACTIAST.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                              
                   ,:DCLACTIAST.OPTN-CTGY-CD                                    
                   ,:DCLACTIAST.OPTN-CTGY-STTS-CD                               
                   ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTIAST.RCRD-STTS-CD                                    
                   ,:DCLACTIAST.NSCC-PEND-CD                                    
                   ,:DCLACTIAST.NSCC-ACK-IND                                    
                   ,:DCLACTIAST.PRGM-NM                                         
                   ,:DCLACTIAST.CICS-TERM-ID-CD                                 
                   ,:DCLACTIAST.UPDT-TMSTP                                      
                   ,:DCLACTIAST.CRT-TMSTP                                       
                   ,:DCLACTIAST.SECURITY-ADP-NBR                                
                   ,:DCLACTIAST.TRNFR-TYPE-CD                                   
                   ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                              
                   ,:DCLACTIAST.RCV-NBR-STTS-CD                                 
                   ,:DCLACTIAST.DLVR-NBR-STTS-CD                                
DJ0006             ,:DCLACTIAST.CAGE-TAG-NBR                                    
DJ0011             ,:DCLACTIAST.SCRTY-866-NBR                                   
DJ0011             ,:DCLACTIAST.ASSET-866-QTY                                   
LRM038             ,:DCLACTIAST.CRNCY-CD                                        
                FROM ACTIAST                                                    
                WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR               
                  AND  RCV_NBR           = :W-NSCC-AT-RCV-NBR                   
                  AND  DLVR_NBR          = :W-NSCC-AT-DEL-NBR                   
                  AND  ACCT_DLVR_NBR     = :W-SAVE-ACCT-DLVR-NBR                
                  AND  ACCT_RCV_NBR      = :W-SAVE-ACCT-RCV-NBR                 
                  AND  ISIN_SEC_ISSUE_CD = :W-NSCC-AT-SEC-ID                    
                  AND  CSH_MGN_SHRT_CD   = :W-NSCC-AT-CASH-MRGN-SHTCD           
                  AND  TRANS_RFRN_ID_CD  = :W-NSCC-AT-TRAN-REF-ID               
                  AND  ASSET_QTY         = :W-ASSET-QTY                         
LRM038            AND  CRNCY_CD          = :DCLACTIAST.CRNCY-CD                 
              END-EXEC                                                          
LRM038        IF  SQLCODE  =  +0                                                
LRM038            DISPLAY 'FOUND FCURR VIA QTY'                                 
LRM038        END-IF                                                            
           ELSE                                                                 
LRM038        MOVE SPACES TO CRNCY-CD OF DCLACTIAST                             
              EXEC SQL SELECT                                                   
                    CLIENT_NBR                                                  
                   ,DLVR_NBR                                                    
                   ,ACCT_DLVR_NBR                                               
                   ,RCV_NBR                                                     
                   ,ACCT_RCV_NBR                                                
                   ,ISIN_CNTRY_CD                                               
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,ISIN_SEC_CDG_CD                                             
                   ,STTLM_LCTN_CD                                               
                   ,CSH_MGN_SHRT_CD                                             
                   ,CSH_MRG_SHT_STS_CD                                          
                   ,STTLM_LCTN_STTS_CD                                          
                   ,ISIN_CNTRY_STTS_CD                                          
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,ACAT_CONTROL_NBR                                            
                   ,CONTROL_NBR_STS_CD                                          
                   ,ASSET_SEQ_NBR                                               
                   ,AST_SEQ_NBR_STS_CD                                          
                   ,TRANS_TYPE_CD                                               
                   ,TRANS_TYPE_STTS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,ASSET_PRC_CTGY_CD                                           
                   ,AST_PRC_CTG_STS_CD                                          
                   ,STTLM_RSN_CD                                                
                   ,STTLM_RSN_STTS_CD                                           
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
                   ,WHI_CD                                                      
                   ,WHI_STTS_CD                                                 
                   ,TRNFR_TYPE_RSN_CD                                           
                   ,TRN_TYP_RSN_STS_CD                                          
                   ,MBS_SERIAL_NBR                                              
                   ,MBS_SERIAL_STTS_CD                                          
                   ,ASSET_CMNT_TXT                                              
                   ,ASSET_CMNT_STTS_CD                                          
                   ,NSCC_WTHLD_CD                                               
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,ISIN_SEC_IS_STS_CD                                          
                   ,ISIN_SEC_CD_STS_CD                                          
                   ,OPTN_CTGY_CD                                                
                   ,OPTN_CTGY_STTS_CD                                           
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,NSCC_PEND_CD                                                
                   ,NSCC_ACK_IND                                                
                   ,PRGM_NM                                                     
                   ,CICS_TERM_ID_CD                                             
                   ,UPDT_TMSTP                                                  
                   ,CRT_TMSTP                                                   
                   ,SECURITY_ADP_NBR                                            
                   ,TRNFR_TYPE_CD                                               
                   ,TRNFR_TYPE_STTS_CD                                          
                   ,RCV_NBR_STTS_CD                                             
                   ,DLVR_NBR_STTS_CD                                            
DJ0006             ,CAGE_TAG_NBR                                                
DJ0011             ,SCRTY_866_NBR                                               
DJ0011             ,ASSET_866_QTY                                               
                INTO                                                            
                    :DCLACTIAST.CLIENT-NBR                                      
                   ,:DCLACTIAST.DLVR-NBR                                        
                   ,:DCLACTIAST.ACCT-DLVR-NBR                                   
                   ,:DCLACTIAST.RCV-NBR                                         
                   ,:DCLACTIAST.ACCT-RCV-NBR                                    
                   ,:DCLACTIAST.ISIN-CNTRY-CD                                   
                   ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                               
                   ,:DCLACTIAST.ISIN-SEC-CDG-CD                                 
                   ,:DCLACTIAST.STTLM-LCTN-CD                                   
                   ,:DCLACTIAST.CSH-MGN-SHRT-CD                                 
                   ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                              
                   ,:DCLACTIAST.STTLM-LCTN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                              
                   ,:DCLACTIAST.SBMTG-PRTCP-NBR                                 
                   ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                              
                   ,:DCLACTIAST.ACAT-CONTROL-NBR                                
                   ,:DCLACTIAST.CONTROL-NBR-STS-CD                              
                   ,:DCLACTIAST.ASSET-SEQ-NBR                                   
                   ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                              
                   ,:DCLACTIAST.TRANS-TYPE-CD                                   
                   ,:DCLACTIAST.TRANS-TYPE-STTS-CD                              
                   ,:DCLACTIAST.PHSCL-SEQ-NBR                                   
                   ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                               
                   ,:DCLACTIAST.LGCL-SEQ-NBR                                    
                   ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                              
                   ,:DCLACTIAST.ASSET-PRC-CTGY-CD                               
                   ,:DCLACTIAST.AST-PRC-CTG-STS-CD                              
                   ,:DCLACTIAST.STTLM-RSN-CD                                    
                   ,:DCLACTIAST.STTLM-RSN-STTS-CD                               
                   ,:DCLACTIAST.ASSET-DESC-TXT                                  
                   ,:DCLACTIAST.ASSET-DESC-STTS-CD                              
                   ,:DCLACTIAST.ASSET-RQST-QTY-CD                               
                   ,:DCLACTIAST.ASSET-RQST-STS-CD                               
                   ,:DCLACTIAST.AST-RQST-TRANS-CD                               
                   ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                              
                   ,:DCLACTIAST.ASSET-QTY                                       
                   ,:DCLACTIAST.ASSET-QTY-STTS-CD                               
                   ,:DCLACTIAST.ASSET-PCT                                       
                   ,:DCLACTIAST.ASSET-PCT-STTS-CD                               
                   ,:DCLACTIAST.PSTN-CD                                         
                   ,:DCLACTIAST.PSTN-CD-STTS-CD                                 
                   ,:DCLACTIAST.ISO-CRNCY-CD                                    
                   ,:DCLACTIAST.ISO-CRNCY-STTS-CD                               
                   ,:DCLACTIAST.ASSET-AMT                                       
                   ,:DCLACTIAST.ASSET-AMT-STTS-CD                               
                   ,:DCLACTIAST.BEARER-BOND-CD                                  
                   ,:DCLACTIAST.BEARER-BND-STTS-CD                              
                   ,:DCLACTIAST.WHI-CD                                          
                   ,:DCLACTIAST.WHI-STTS-CD                                     
                   ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                               
                   ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                              
                   ,:DCLACTIAST.MBS-SERIAL-NBR                                  
                   ,:DCLACTIAST.MBS-SERIAL-STTS-CD                              
                   ,:DCLACTIAST.ASSET-CMNT-TXT                                  
                   ,:DCLACTIAST.ASSET-CMNT-STTS-CD                              
                   ,:DCLACTIAST.NSCC-WTHLD-CD                                   
                   ,:DCLACTIAST.TRANS-RFRN-ID-CD                                
                   ,:DCLACTIAST.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                              
                   ,:DCLACTIAST.OPTN-CTGY-CD                                    
                   ,:DCLACTIAST.OPTN-CTGY-STTS-CD                               
                   ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTIAST.RCRD-STTS-CD                                    
                   ,:DCLACTIAST.NSCC-PEND-CD                                    
                   ,:DCLACTIAST.NSCC-ACK-IND                                    
                   ,:DCLACTIAST.PRGM-NM                                         
                   ,:DCLACTIAST.CICS-TERM-ID-CD                                 
                   ,:DCLACTIAST.UPDT-TMSTP                                      
                   ,:DCLACTIAST.CRT-TMSTP                                       
                   ,:DCLACTIAST.SECURITY-ADP-NBR                                
                   ,:DCLACTIAST.TRNFR-TYPE-CD                                   
                   ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                              
                   ,:DCLACTIAST.RCV-NBR-STTS-CD                                 
                   ,:DCLACTIAST.DLVR-NBR-STTS-CD                                
DJ0006             ,:DCLACTIAST.CAGE-TAG-NBR                                    
DJ0011             ,:DCLACTIAST.SCRTY-866-NBR                                   
DJ0011             ,:DCLACTIAST.ASSET-866-QTY                                   
                FROM ACTIAST                                                    
                WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR               
                  AND  RCV_NBR           = :W-NSCC-AT-RCV-NBR                   
                  AND  DLVR_NBR          = :W-NSCC-AT-DEL-NBR                   
                  AND  ACCT_DLVR_NBR     = :W-SAVE-ACCT-DLVR-NBR                
                  AND  ACCT_RCV_NBR      = :W-SAVE-ACCT-RCV-NBR                 
                  AND  ISIN_SEC_ISSUE_CD = :W-NSCC-AT-SEC-ID                    
                  AND  CSH_MGN_SHRT_CD   = :W-NSCC-AT-CASH-MRGN-SHTCD           
                  AND  TRANS_RFRN_ID_CD  = :W-NSCC-AT-TRAN-REF-ID               
                  AND  ASSET_QTY         = :W-ASSET-QTY                         
LRM038            AND  CRNCY_CD          = :DCLACTIAST.CRNCY-CD                 
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTIAST'                TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
           IF  SQLCODE  =  +0                                                   
               MOVE 'Y' TO W-ACTIAST-FND-SW                                     
               ADD 1 TO W-ACTIAST-FND-CNT                                       
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                              ' ' W-NSCC-KEY-CLIENT-NBR                         
                              ' ' W-NSCC-ACAT-CTL-NBR                           
                              ' ' W-ASSET-SEQ-NBR                               
                              ' ' W-NSCC-AT-TRAN-TYPE                           
                              ' ' W-NSCC-AT-TFR-TYPE                            
                          ' DST=' W-DSTBN-SIDE-CD                               
DJ0002                ' 6050:FOUND ' W-NSCC-AT-SEC-ID                           
DJ0002              ' ' STTLM-LCTN-CD     OF DCLACTIAST                         
DJ0002              ' ' CSH-MGN-SHRT-CD   OF DCLACTIAST                         
DJ0002              ' ' STTLM-RSN-CD      OF DCLACTIAST                         
DJ0002              ' ' ASSET-PRC-CTGY-CD OF DCLACTIAST                         
DJ0002              ' ' ASSET-DESC-TXT    OF DCLACTIAST (1:23)                  
DJ0019              ' ' WHI-CD            OF DCLACTIAST                         
LRM040              IF  W-DSTBN-SIDE-CD = 'D'                                   
LRM040              AND ASSET-DESC-TXT OF DCLACTIAST(121:8) = 'ADP-SEC:'        
LRM040              AND W-NSCC-AT-SEC-CNTRY-CD NOT = 'US'                       
LRM040                 MOVE 'ADP-SEC:' TO W-NSCC-AT-ASSET-DESC (121:8)          
LRM040                 MOVE ASSET-DESC-TXT OF DCLACTIAST (129:7)                
LRM040                                 TO W-NSCC-AT-ASSET-DESC (129:7)          
LRM040                 DISPLAY ' FORCING ADP-SEC ' ASSET-DESC-TXT               
LRM040                   OF DCLACTIAST (129:7) ' FROM ACTIAST'                  
LRM040              END-IF                                                      
           ELSE                                                                 
               IF  SQLCODE  =  +100 OR -811                                     
                   MOVE 'N' TO W-ACTIAST-FND-SW                                 
                   ADD 1 TO W-ACTIAST-NOTFND-CNT                                
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                              ' ' W-NSCC-KEY-CLIENT-NBR                         
                              ' ' W-NSCC-ACAT-CTL-NBR                           
                              ' ' W-ASSET-SEQ-NBR                               
                              ' ' W-NSCC-AT-TRAN-TYPE                           
                              ' ' W-NSCC-AT-TFR-TYPE                            
                          ' DST=' W-DSTBN-SIDE-CD                               
DJ0002                ' 6050:NOTFD ' W-NSCC-AT-SEC-ID                           
                                          ' ' W-NSCC-AT-STL-LOC                 
DJ0002                                    ' ' W-NSCC-AT-CASH-MRGN-SHTCD         
                                          ' ' W-NSCC-AT-STL-LOC-RSN-CD          
DJ0002                                    ' ' W-NSCC-AT-ASSET-PRC-CATG          
DJ0002                                    ' ' W-NSCC-AT-ASSET-DESC(1:20)        
                                          ' ' W-DB2-SQLCODE                     
                   DISPLAY     W-NSCC-KEY-CLIENT-NBR                            
                           ' ' W-NSCC-AT-RCV-NBR                                
                           ' ' W-NSCC-AT-DEL-NBR                                
                           ' ' W-SAVE-ACCT-DLVR-NBR                             
                           ' ' W-SAVE-ACCT-RCV-NBR                              
                           ' ' W-NSCC-AT-STL-LOC                                
                           ' ' W-NSCC-AT-STL-LOC-RSN-CD                         
                           ' ' W-NSCC-AT-SEC-ID                                 
                           ' ' W-NSCC-AT-CASH-MRGN-SHTCD                        
                           ' ' W-NSCC-AT-TRAN-REF-ID                            
                           ' ' W-ASSET-QTY-X                                    
               ELSE                                                             
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                              ' ' W-NSCC-KEY-CLIENT-NBR                         
                              ' ' W-NSCC-ACAT-CTL-NBR                           
                              ' ' W-ASSET-SEQ-NBR                               
                              ' ' W-NSCC-AT-TRAN-TYPE                           
                              ' ' W-NSCC-AT-TFR-TYPE                            
                          ' DST=' W-DSTBN-SIDE-CD                               
DJ0002                ' 6050:NOTFD ' W-NSCC-AT-SEC-ID                           
                                          ' ' W-NSCC-AT-STL-LOC                 
DJ0002                                    ' ' W-NSCC-AT-CASH-MRGN-SHTCD         
                                          ' ' W-NSCC-AT-STL-LOC-RSN-CD          
DJ0002                                    ' ' W-NSCC-AT-ASSET-PRC-CATG          
DJ0002                                    ' ' W-NSCC-AT-ASSET-DESC(1:20)        
                                          ' ' W-DB2-SQLCODE                     
                   DISPLAY     W-NSCC-KEY-CLIENT-NBR                            
                           ' ' W-NSCC-AT-RCV-NBR                                
                           ' ' W-NSCC-AT-DEL-NBR                                
                           ' ' W-SAVE-ACCT-DLVR-NBR                             
                           ' ' W-SAVE-ACCT-RCV-NBR                              
                           ' ' W-NSCC-AT-STL-LOC                                
                           ' ' W-NSCC-AT-STL-LOC-RSN-CD                         
                           ' ' W-NSCC-AT-SEC-ID                                 
                           ' ' W-NSCC-AT-CASH-MRGN-SHTCD                        
                           ' ' W-NSCC-AT-TRAN-REF-ID                            
                           ' ' W-ASSET-QTY-X                                    
                   DISPLAY 'CAT515: ERROR SELECTING A ROW FROM ACTIAST'         
                         ' (ACAT-INIT-ASSET TABLE)'                             
                   DISPLAY 'CAT515: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT515: DCLACTIAST='                                
                           '(' DCLACTIAST ')'                                   
                   PERFORM 8000-DISPLAY-KEY     THRU 8000-EXIT                  
                   PERFORM  8100-SQL-ERROR THRU 8100-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6050-EXIT. EXIT.                                                         
      /                                                                         
       6100-INSERT-VASSET  SECTION.                                             
                                                                                
CSG001* IN SOME CASES MSD DESCRIPTIONS CONTAIN SPECIAL CHARACTERS.              
CSG001* CORRECT THEM BY REPLACING SPECIAL CHARACTERS WITH SPACES.               
CSG001     MOVE ASSET-DESC-TXT OF DCLVASSET TO W-ASSET-DESC-TXT                 
CSG001     PERFORM 6730-EDIT-ASSET-DESC-TXT THRU 6730-EXIT                      
CSG001     MOVE W-ASSET-DESC-TXT TO ASSET-DESC-TXT OF DCLVASSET                 
CSG001                                                                          
DJ0023     IF (W-NSCC-AT-TFR-TYPE = 'FUL' OR 'PTD' OR 'PTR')                    
DJ0020        EVALUATE BH-ACAT-ASCENDIS-USER                                    
DJ0020           WHEN '1'   MOVE 'A'     TO NSCC-ACK-IND OF DCLVASSET           
DJ0020           WHEN '2'   MOVE 'P'     TO NSCC-ACK-IND OF DCLVASSET           
DJ0020           WHEN OTHER MOVE ' '     TO NSCC-ACK-IND OF DCLVASSET           
DJ0020        END-EVALUATE                                                      
DJ0019     ELSE                                                                 
DJ0019         MOVE ' '            TO NSCC-ACK-IND       OF DCLVASSET           
DJ0019     END-IF.                                                              
                                                                                
           EXEC SQL                                                             
               INSERT INTO VASSET                                               
                 (                                                              
                   CLIENT_NBR                                                   
                  ,ACAT_CONTROL_NBR                                             
                  ,ASSET_SEQ_NBR                                                
                  ,SYS_ACT_CD                                                   
                  ,SYS_RJCT_RSN_CD                                              
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
                  ,SECURITY_ADP_NBR                                             
                  ,NSCC_ACK_IND                                                 
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_NON_ADP_IND                                             
                  ,RCL_SENT_NSCC_IND                                            
                  ,FAIL_OPEN_CAGE_IND                                           
                  ,FAIL_SENT_CAGE_IND                                           
                  ,FRV_SENT_NSCC_IND                                            
                  ,ISIN_SEC_EXCPT_IND                                           
                  ,RESTRICTED_IND                                               
DJ0006            ,CAGE_TAG_NBR                                                 
DJ0011            ,SCRTY_866_NBR                                                
DJ0011            ,ASSET_866_QTY                                                
DJ0024            ,AUCTION_RT_IND                                               
LRM038            ,CRNCY_CD                                                     
LRM043            ,MEMO_ORG_RVRSL_QTY                                           
                 )                                                              
                 VALUES                                                         
                 (                                                              
                   :DCLVASSET.CLIENT-NBR                                        
                  ,:DCLVASSET.ACAT-CONTROL-NBR                                  
                  ,:DCLVASSET.ASSET-SEQ-NBR                                     
                  ,:DCLVASSET.SYS-ACT-CD                                        
                  ,:DCLVASSET.SYS-RJCT-RSN-CD                                   
                  ,:DCLVASSET.RCRD-STTS-CD                                      
                  ,:DCLVASSET.RCRD-LNGTH-STTS-CD                                
                  ,:DCLVASSET.PHSCL-SEQ-STTS-CD                                 
                  ,:DCLVASSET.LGCL-SEQ-NR-STS-CD                                
                  ,:DCLVASSET.TRANS-TYPE-STTS-CD                                
                  ,:DCLVASSET.CONTROL-NBR-STS-CD                                
                  ,:DCLVASSET.TRNFR-TYPE-STTS-CD                                
                  ,:DCLVASSET.SBMT-PRT-NR-STS-CD                                
                  ,:DCLVASSET.RCV-NBR-STTS-CD                                   
                  ,:DCLVASSET.DLVR-NBR-STTS-CD                                  
                  ,:DCLVASSET.TRANS-RFRN-STTS-CD                                
                  ,:DCLVASSET.AST-SEQ-NBR-STS-CD                                
                  ,:DCLVASSET.AST-PRC-CTG-STS-CD                                
                  ,:DCLVASSET.OPTN-CTGY-STTS-CD                                 
                  ,:DCLVASSET.STTLM-LCTN-STTS-CD                                
                  ,:DCLVASSET.STTLM-RSN-STTS-CD                                 
                  ,:DCLVASSET.ISIN-CNTRY-STTS-CD                                
                  ,:DCLVASSET.ISIN-SEC-IS-STS-CD                                
                  ,:DCLVASSET.ISIN-SEC-CD-STS-CD                                
                  ,:DCLVASSET.ASSET-DESC-STTS-CD                                
                  ,:DCLVASSET.ASSET-RQST-STS-CD                                 
                  ,:DCLVASSET.AST-RQ-TRAN-STS-CD                                
                  ,:DCLVASSET.ASSET-QTY-STTS-CD                                 
                  ,:DCLVASSET.ASSET-PCT-STTS-CD                                 
                  ,:DCLVASSET.PSTN-CD-STTS-CD                                   
                  ,:DCLVASSET.ISO-CRNCY-STTS-CD                                 
                  ,:DCLVASSET.ASSET-AMT-STTS-CD                                 
                  ,:DCLVASSET.BEARER-BND-STTS-CD                                
                  ,:DCLVASSET.CSH-MRG-SHT-STS-CD                                
                  ,:DCLVASSET.WHI-STTS-CD                                       
                  ,:DCLVASSET.TRN-TYP-RSN-STS-CD                                
                  ,:DCLVASSET.MBS-SERIAL-STTS-CD                                
                  ,:DCLVASSET.ASSET-CMNT-STTS-CD                                
                  ,:DCLVASSET.PHSCL-SEQ-NBR                                     
                  ,:DCLVASSET.LGCL-SEQ-NBR                                      
                  ,:DCLVASSET.TRANS-TYPE-CD                                     
                  ,:DCLVASSET.TRNFR-TYPE-CD                                     
                  ,:DCLVASSET.SBMTG-PRTCP-NBR                                   
                  ,:DCLVASSET.TRANS-RFRN-ID-CD                                  
                  ,:DCLVASSET.ASSET-PRC-CTGY-CD                                 
                  ,:DCLVASSET.OPTN-CTGY-CD                                      
                  ,:DCLVASSET.STTLM-LCTN-CD                                     
                  ,:DCLVASSET.STTLM-RSN-CD                                      
                  ,:DCLVASSET.ISIN-CNTRY-CD                                     
                  ,:DCLVASSET.ISIN-SEC-ISSUE-CD                                 
                  ,:DCLVASSET.ISIN-SEC-CDG-CD                                   
                  ,:DCLVASSET.ASSET-DESC-TXT                                    
                  ,:DCLVASSET.ASSET-RQST-QTY-CD                                 
                  ,:DCLVASSET.AST-RQST-TRANS-CD                                 
                  ,:DCLVASSET.ASSET-QTY                                         
                  ,:DCLVASSET.ASSET-PCT                                         
                  ,:DCLVASSET.PSTN-CD                                           
                  ,:DCLVASSET.ISO-CRNCY-CD                                      
                  ,:DCLVASSET.ASSET-AMT                                         
                  ,:DCLVASSET.BEARER-BOND-CD                                    
                  ,:DCLVASSET.CSH-MGN-SHRT-CD                                   
                  ,:DCLVASSET.WHI-CD                                            
                  ,:DCLVASSET.TRNFR-TYPE-RSN-CD                                 
                  ,:DCLVASSET.MBS-SERIAL-NBR                                    
                  ,:DCLVASSET.ASSET-CMNT-TXT                                    
                  ,:DCLVASSET.PRGM-NM                                           
                  ,:DCLVASSET.CICS-TERM-ID-CD                                   
                  ,:DCLVASSET.CRT-TMSTP                                         
                  ,:DCLVASSET.UPDT-TMSTP                                        
                  ,:DCLVASSET.SECURITY-ADP-NBR                                  
                  ,:DCLVASSET.NSCC-ACK-IND                                      
                  ,:DCLVASSET.NSCC-PEND-CD                                      
                  ,:DCLVASSET.NSCC-NON-ADP-IND                                  
                  ,:DCLVASSET.RCL-SENT-NSCC-IND                                 
                  ,:DCLVASSET.FAIL-OPEN-CAGE-IND                                
                  ,:DCLVASSET.FAIL-SENT-CAGE-IND                                
                  ,:DCLVASSET.FRV-SENT-NSCC-IND                                 
                  ,:DCLVASSET.ISIN-SEC-EXCPT-IND                                
                  ,:DCLVASSET.RESTRICTED-IND                                    
DJ0006            ,:DCLVASSET.CAGE-TAG-NBR                                      
DJ0011            ,:DCLVASSET.SCRTY-866-NBR                                     
DJ0011            ,:DCLVASSET.ASSET-866-QTY                                     
DJ0024            ,:DCLVASSET.AUCTION-RT-IND                                    
LRM038            ,:DCLVASSET.CRNCY-CD                                          
LRM043            ,:DCLVASSET.MEMO-ORG-RVRSL-QTY                                
                 )                                                              
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'VASSET  '               TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           .                                                                    
       6100-EXIT. EXIT.                                                         
      /                                                                         
       6200-INSERT-VOPTN   SECTION.                                             
                                                                                
           EXEC SQL                                                             
               INSERT INTO VOPTN                                                
                 (                                                              
                   CLIENT_NBR                                                   
                  ,ACAT_CONTROL_NBR                                             
                  ,ASSET_SEQ_NBR                                                
                  ,BS_STTS_CD                                                   
                  ,PTCL_STTS_CD                                                 
                  ,OPT_OPN_CLS_STS_CD                                           
                  ,SYM_STTS_CD                                                  
                  ,OPTN_EXPTN_DT_CD                                             
                  ,STPRC_INTR_STTS_CD                                           
                  ,STPRC_FRCT_STTS_CD                                           
                  ,OPT_OCC_DLV_STS_CD                                           
                  ,OPT_ACT_TYP_STS_CD                                           
                  ,ACCT_SUB_STTS_CD                                             
                  ,OPTN_CMNT_STTS_CD                                            
                  ,BS_CD                                                        
                  ,PTCL_CD                                                      
                  ,OPTN_OPN_CLSD_CD                                             
                  ,SYM_CD                                                       
                  ,EXPTN_DT                                                     
                  ,STPRC_INTEGER_AMT                                            
                  ,STPRC_INTEGER2_AMT                                           
                  ,STPRC_FRCTN_AMT                                              
                  ,DLVR_OCC_NBR                                                 
                  ,OPTN_ACCT_TYPE_CD                                            
                  ,ACCT_SUB_CD                                                  
                  ,OPTN_CMNT_TXT                                                
                  ,PRGM_NM                                                      
                  ,CICS_TERM_ID_CD                                              
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,ACCT_TYPE_MSMT_IND                                           
                 )                                                              
                 VALUES                                                         
                 (                                                              
                   :DCLVOPTN.CLIENT-NBR                                         
                  ,:DCLVOPTN.ACAT-CONTROL-NBR                                   
                  ,:DCLVOPTN.ASSET-SEQ-NBR                                      
                  ,:DCLVOPTN.BS-STTS-CD                                         
                  ,:DCLVOPTN.PTCL-STTS-CD                                       
                  ,:DCLVOPTN.OPT-OPN-CLS-STS-CD                                 
                  ,:DCLVOPTN.SYM-STTS-CD                                        
                  ,:DCLVOPTN.OPTN-EXPTN-DT-CD                                   
                  ,:DCLVOPTN.STPRC-INTR-STTS-CD                                 
                  ,:DCLVOPTN.STPRC-FRCT-STTS-CD                                 
                  ,:DCLVOPTN.OPT-OCC-DLV-STS-CD                                 
                  ,:DCLVOPTN.OPT-ACT-TYP-STS-CD                                 
                  ,:DCLVOPTN.ACCT-SUB-STTS-CD                                   
                  ,:DCLVOPTN.OPTN-CMNT-STTS-CD                                  
                  ,:DCLVOPTN.BS-CD                                              
                  ,:DCLVOPTN.PTCL-CD                                            
                  ,:DCLVOPTN.OPTN-OPN-CLSD-CD                                   
                  ,:DCLVOPTN.SYM-CD                                             
                  ,:DCLVOPTN.EXPTN-DT                                           
                  ,:DCLVOPTN.STPRC-INTEGER-AMT                                  
                  ,:DCLVOPTN.STPRC-INTEGER2-AMT                                 
                  ,:DCLVOPTN.STPRC-FRCTN-AMT                                    
                  ,:DCLVOPTN.DLVR-OCC-NBR                                       
                  ,:DCLVOPTN.OPTN-ACCT-TYPE-CD                                  
                  ,:DCLVOPTN.ACCT-SUB-CD                                        
                  ,:DCLVOPTN.OPTN-CMNT-TXT                                      
                  ,:DCLVOPTN.PRGM-NM                                            
                  ,:DCLVOPTN.CICS-TERM-ID-CD                                    
                  ,:DCLVOPTN.CRT-TMSTP                                          
                  ,:DCLVOPTN.UPDT-TMSTP                                         
                  ,:DCLVOPTN.ACCT-TYPE-MSMT-IND                                 
                 )                                                              
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'VOPTN   '               TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           .                                                                    
       6200-EXIT. EXIT.                                                         
      /                                                                         
       6300-INSERT-VMF     SECTION.                                             
                                                                                
           EXEC SQL                                                             
               INSERT INTO VMF                                                  
                 (                                                              
                   CLIENT_NBR                                                   
                  ,DSTBN_SIDE_CD                                                
                  ,ACAT_CONTROL_NBR                                             
                  ,ASSET_SEQ_NBR                                                
                  ,PRCS_DT                                                      
                  ,RGSTN_CD                                                     
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
DJ0005            ,FCST_RCVR_STTS_CD                                            
DJ0005            ,FCST_ACCT_RCVR_NBR                                           
                 )                                                              
                 VALUES                                                         
                 (                                                              
                   :DCLVMF.CLIENT-NBR                                           
                  ,:DCLVMF.DSTBN-SIDE-CD                                        
                  ,:DCLVMF.ACAT-CONTROL-NBR                                     
                  ,:DCLVMF.ASSET-SEQ-NBR                                        
                  ,:DCLVMF.PRCS-DT                                              
                  ,:DCLVMF.RGSTN-CD                                             
                  ,:DCLVMF.FND-ACT-NBR-STS-CD                                   
                  ,:DCLVMF.BK-PHSC-SHR-STS-CD                                   
                  ,:DCLVMF.NTWRK-CNTL-STTS-CD                                   
                  ,:DCLVMF.ACCT-TYPE-STTS-CD                                    
                  ,:DCLVMF.DVDND-STTS-CD                                        
                  ,:DCLVMF.DVDND-PYE-STTS-CD                                    
                  ,:DCLVMF.BRKR-EXCTG-STTS-CD                                   
                  ,:DCLVMF.MF-FUL-PRTL-STS-CD                                   
                  ,:DCLVMF.FNBR                                                 
                  ,:DCLVMF.BK-PHSCL-SHR-CD                                      
                  ,:DCLVMF.NTWRK-CNTL-CD                                        
                  ,:DCLVMF.ACCT-TYPE-CD                                         
                  ,:DCLVMF.DVDND-CD                                             
                  ,:DCLVMF.LTCG-CD                                              
                  ,:DCLVMF.STCG-CD                                              
                  ,:DCLVMF.DVDND-PAYEE-CD                                       
                  ,:DCLVMF.BRKR-EXCTG-NBR                                       
                  ,:DCLVMF.MF-FULL-PRTL-CD                                      
                  ,:DCLVMF.PRGM-NM                                              
                  ,:DCLVMF.CICS-TERM-ID-CD                                      
                  ,:DCLVMF.CRT-TMSTP                                            
                  ,:DCLVMF.UPDT-TMSTP                                           
DJ0005            ,:DCLVMF.FCST-RCVR-STTS-CD                                    
DJ0005            ,:DCLVMF.FCST-ACCT-RCVR-NBR                                   
                 )                                                              
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'VMF     '               TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           .                                                                    
       6300-EXIT. EXIT.                                                         
      /                                                                         
       6400-UPDATE-VASSET  SECTION.                                             
                                                                                
CSG001* IN SOME CASES MSD DESCRIPTIONS CONTAIN SPECIAL CHARACTERS.              
CSG001* CORRECT THEM BY REPLACING SPECIAL CHARACTERS WITH SPACES.               
CSG001     MOVE ASSET-DESC-TXT OF DCLVASSET TO W-ASSET-DESC-TXT                 
CSG001     PERFORM 6730-EDIT-ASSET-DESC-TXT THRU 6730-EXIT                      
CSG001     MOVE W-ASSET-DESC-TXT TO ASSET-DESC-TXT OF DCLVASSET                 
CSG001                                                                          
DJ0023     IF (W-NSCC-AT-TFR-TYPE = 'FUL' OR 'PTD' OR 'PTR')                    
DJ0020        EVALUATE BH-ACAT-ASCENDIS-USER                                    
DJ0020           WHEN '1'   MOVE 'A'     TO NSCC-ACK-IND OF DCLVASSET           
DJ0020           WHEN '2'   MOVE 'P'     TO NSCC-ACK-IND OF DCLVASSET           
DJ0020           WHEN OTHER MOVE ' '     TO NSCC-ACK-IND OF DCLVASSET           
DJ0020        END-EVALUATE                                                      
DJ0019     ELSE                                                                 
DJ0019         MOVE ' '            TO NSCC-ACK-IND       OF DCLVASSET           
DJ0019     END-IF.                                                              
                                                                                
           EXEC SQL                                                             
             UPDATE VASSET                                                      
                SET                                                             
                   SYS_ACT_CD          = :DCLVASSET.SYS-ACT-CD                  
                  ,SYS_RJCT_RSN_CD     = :DCLVASSET.SYS-RJCT-RSN-CD             
                  ,RCRD_STTS_CD        = :DCLVASSET.RCRD-STTS-CD                
                  ,RCRD_LNGTH_STTS_CD  = :DCLVASSET.RCRD-LNGTH-STTS-CD          
                  ,PHSCL_SEQ_STTS_CD   = :DCLVASSET.PHSCL-SEQ-STTS-CD           
                  ,LGCL_SEQ_NR_STS_CD  = :DCLVASSET.LGCL-SEQ-NR-STS-CD          
                  ,TRANS_TYPE_STTS_CD  = :DCLVASSET.TRANS-TYPE-STTS-CD          
                  ,CONTROL_NBR_STS_CD  = :DCLVASSET.CONTROL-NBR-STS-CD          
                  ,TRNFR_TYPE_STTS_CD  = :DCLVASSET.TRNFR-TYPE-STTS-CD          
                  ,SBMT_PRT_NR_STS_CD  = :DCLVASSET.SBMT-PRT-NR-STS-CD          
                  ,TRANS_RFRN_STTS_CD  = :DCLVASSET.TRANS-RFRN-STTS-CD          
                  ,AST_SEQ_NBR_STS_CD  = :DCLVASSET.AST-SEQ-NBR-STS-CD          
                  ,AST_PRC_CTG_STS_CD  = :DCLVASSET.AST-PRC-CTG-STS-CD          
                  ,OPTN_CTGY_STTS_CD   = :DCLVASSET.OPTN-CTGY-STTS-CD           
                  ,STTLM_LCTN_STTS_CD  = :DCLVASSET.STTLM-LCTN-STTS-CD          
                  ,STTLM_RSN_STTS_CD   = :DCLVASSET.STTLM-RSN-STTS-CD           
                  ,ISIN_CNTRY_STTS_CD  = :DCLVASSET.ISIN-CNTRY-STTS-CD          
                  ,ISIN_SEC_IS_STS_CD  = :DCLVASSET.ISIN-SEC-IS-STS-CD          
                  ,ISIN_SEC_CD_STS_CD  = :DCLVASSET.ISIN-SEC-CD-STS-CD          
                  ,ASSET_DESC_STTS_CD  = :DCLVASSET.ASSET-DESC-STTS-CD          
                  ,ASSET_RQST_STS_CD   = :DCLVASSET.ASSET-RQST-STS-CD           
                  ,AST_RQ_TRAN_STS_CD  = :DCLVASSET.AST-RQ-TRAN-STS-CD          
                  ,ASSET_QTY_STTS_CD   = :DCLVASSET.ASSET-QTY-STTS-CD           
                  ,ASSET_PCT_STTS_CD   = :DCLVASSET.ASSET-PCT-STTS-CD           
                  ,PSTN_CD_STTS_CD     = :DCLVASSET.PSTN-CD-STTS-CD             
                  ,ISO_CRNCY_STTS_CD   = :DCLVASSET.ISO-CRNCY-STTS-CD           
                  ,ASSET_AMT_STTS_CD   = :DCLVASSET.ASSET-AMT-STTS-CD           
                  ,BEARER_BND_STTS_CD  = :DCLVASSET.BEARER-BND-STTS-CD          
                  ,CSH_MRG_SHT_STS_CD  = :DCLVASSET.CSH-MRG-SHT-STS-CD          
                  ,WHI_STTS_CD         = :DCLVASSET.WHI-STTS-CD                 
                  ,TRN_TYP_RSN_STS_CD  = :DCLVASSET.TRN-TYP-RSN-STS-CD          
                  ,MBS_SERIAL_STTS_CD  = :DCLVASSET.MBS-SERIAL-STTS-CD          
                  ,ASSET_CMNT_STTS_CD  = :DCLVASSET.ASSET-CMNT-STTS-CD          
                  ,PHSCL_SEQ_NBR       = :DCLVASSET.PHSCL-SEQ-NBR               
                  ,LGCL_SEQ_NBR        = :DCLVASSET.LGCL-SEQ-NBR                
                  ,TRANS_TYPE_CD       = :DCLVASSET.TRANS-TYPE-CD               
                  ,TRNFR_TYPE_CD       = :DCLVASSET.TRNFR-TYPE-CD               
                  ,SBMTG_PRTCP_NBR     = :DCLVASSET.SBMTG-PRTCP-NBR             
                  ,TRANS_RFRN_ID_CD    = :DCLVASSET.TRANS-RFRN-ID-CD            
                  ,ASSET_PRC_CTGY_CD   = :DCLVASSET.ASSET-PRC-CTGY-CD           
                  ,OPTN_CTGY_CD        = :DCLVASSET.OPTN-CTGY-CD                
                  ,STTLM_LCTN_CD       = :DCLVASSET.STTLM-LCTN-CD               
                  ,STTLM_RSN_CD        = :DCLVASSET.STTLM-RSN-CD                
                  ,ISIN_CNTRY_CD       = :DCLVASSET.ISIN-CNTRY-CD               
                  ,ISIN_SEC_ISSUE_CD   = :DCLVASSET.ISIN-SEC-ISSUE-CD           
                  ,ISIN_SEC_CDG_CD     = :DCLVASSET.ISIN-SEC-CDG-CD             
                  ,ASSET_DESC_TXT      = :DCLVASSET.ASSET-DESC-TXT              
                  ,ASSET_RQST_QTY_CD   = :DCLVASSET.ASSET-RQST-QTY-CD           
                  ,AST_RQST_TRANS_CD   = :DCLVASSET.AST-RQST-TRANS-CD           
                  ,ASSET_QTY           = :DCLVASSET.ASSET-QTY                   
                  ,ASSET_PCT           = :DCLVASSET.ASSET-PCT                   
                  ,PSTN_CD             = :DCLVASSET.PSTN-CD                     
                  ,ISO_CRNCY_CD        = :DCLVASSET.ISO-CRNCY-CD                
                  ,ASSET_AMT           = :DCLVASSET.ASSET-AMT                   
                  ,BEARER_BOND_CD      = :DCLVASSET.BEARER-BOND-CD              
                  ,CSH_MGN_SHRT_CD     = :DCLVASSET.CSH-MGN-SHRT-CD             
                  ,WHI_CD              = :DCLVASSET.WHI-CD                      
                  ,TRNFR_TYPE_RSN_CD   = :DCLVASSET.TRNFR-TYPE-RSN-CD           
                  ,MBS_SERIAL_NBR      = :DCLVASSET.MBS-SERIAL-NBR              
                  ,ASSET_CMNT_TXT      = :DCLVASSET.ASSET-CMNT-TXT              
                  ,PRGM_NM             = :DCLVASSET.PRGM-NM                     
                  ,CICS_TERM_ID_CD     = :DCLVASSET.CICS-TERM-ID-CD             
                  ,UPDT_TMSTP          = :DCLVASSET.UPDT-TMSTP                  
                  ,SECURITY_ADP_NBR    = :DCLVASSET.SECURITY-ADP-NBR            
                  ,NSCC_ACK_IND        = :DCLVASSET.NSCC-ACK-IND                
                  ,NSCC_PEND_CD        = :DCLVASSET.NSCC-PEND-CD                
                  ,NSCC_NON_ADP_IND    = :DCLVASSET.NSCC-NON-ADP-IND            
                  ,ISIN_SEC_EXCPT_IND  = :DCLVASSET.ISIN-SEC-EXCPT-IND          
                  ,RESTRICTED_IND      = :DCLVASSET.RESTRICTED-IND              
DJ0024            ,AUCTION_RT_IND      = :DCLVASSET.AUCTION-RT-IND              
LRM038            ,CRNCY_CD            = :DCLVASSET.CRNCY-CD                    
LRM043            ,MEMO_ORG_RVRSL_QTY  = :DCLVASSET.MEMO-ORG-RVRSL-QTY          
                WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR               
                  AND  ACAT_CONTROL_NBR  = :W-NSCC-ACAT-CTL-NBR                 
                  AND  ASSET_SEQ_NBR     = :W-AT-ASSET-SEQ-NBR                  
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'VASSET  '               TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           .                                                                    
       6400-EXIT. EXIT.                                                         
      /                                                                         
       6500-UPDATE-VOPTN   SECTION.                                             
                                                                                
           EXEC SQL                                                             
             UPDATE VOPTN                                                       
                SET                                                             
                   BS_STTS_CD          = :DCLVOPTN.BS-STTS-CD                   
                  ,PTCL_STTS_CD        = :DCLVOPTN.PTCL-STTS-CD                 
                  ,OPT_OPN_CLS_STS_CD  = :DCLVOPTN.OPT-OPN-CLS-STS-CD           
                  ,SYM_STTS_CD         = :DCLVOPTN.SYM-STTS-CD                  
                  ,OPTN_EXPTN_DT_CD    = :DCLVOPTN.OPTN-EXPTN-DT-CD             
                  ,STPRC_INTR_STTS_CD  = :DCLVOPTN.STPRC-INTR-STTS-CD           
                  ,STPRC_FRCT_STTS_CD  = :DCLVOPTN.STPRC-FRCT-STTS-CD           
                  ,OPT_OCC_DLV_STS_CD  = :DCLVOPTN.OPT-OCC-DLV-STS-CD           
                  ,OPT_ACT_TYP_STS_CD  = :DCLVOPTN.OPT-ACT-TYP-STS-CD           
                  ,ACCT_SUB_STTS_CD    = :DCLVOPTN.ACCT-SUB-STTS-CD             
                  ,OPTN_CMNT_STTS_CD   = :DCLVOPTN.OPTN-CMNT-STTS-CD            
                  ,BS_CD               = :DCLVOPTN.BS-CD                        
                  ,PTCL_CD             = :DCLVOPTN.PTCL-CD                      
                  ,OPTN_OPN_CLSD_CD    = :DCLVOPTN.OPTN-OPN-CLSD-CD             
                  ,SYM_CD              = :DCLVOPTN.SYM-CD                       
                  ,EXPTN_DT            = :DCLVOPTN.EXPTN-DT                     
                  ,STPRC_INTEGER_AMT   = :DCLVOPTN.STPRC-INTEGER-AMT            
                  ,STPRC_INTEGER2_AMT  = :DCLVOPTN.STPRC-INTEGER2-AMT           
                  ,STPRC_FRCTN_AMT     = :DCLVOPTN.STPRC-FRCTN-AMT              
                  ,DLVR_OCC_NBR        = :DCLVOPTN.DLVR-OCC-NBR                 
                  ,OPTN_ACCT_TYPE_CD   = :DCLVOPTN.OPTN-ACCT-TYPE-CD            
                  ,ACCT_SUB_CD         = :DCLVOPTN.ACCT-SUB-CD                  
                  ,OPTN_CMNT_TXT       = :DCLVOPTN.OPTN-CMNT-TXT                
                  ,PRGM_NM             = :DCLVOPTN.PRGM-NM                      
                  ,CICS_TERM_ID_CD     = :DCLVOPTN.CICS-TERM-ID-CD              
                  ,UPDT_TMSTP          = :DCLVOPTN.UPDT-TMSTP                   
                  ,ACCT_TYPE_MSMT_IND  = :DCLVOPTN.ACCT-TYPE-MSMT-IND           
                WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR               
                  AND  ACAT_CONTROL_NBR  = :W-NSCC-AT-ACAT-CTL-NBR              
                  AND  ASSET_SEQ_NBR     = :W-AT-ASSET-SEQ-NBR                  
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'VOPTN   '               TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           .                                                                    
       6500-EXIT. EXIT.                                                         
      /                                                                         
       6600-UPDATE-VMF     SECTION.                                             
                                                                                
           EXEC SQL                                                             
             UPDATE VMF                                                         
                SET                                                             
                   DSTBN_SIDE_CD       = :DCLVMF.DSTBN-SIDE-CD                  
                  ,PRCS_DT             = :DCLVMF.PRCS-DT                        
                  ,RGSTN_CD            = :DCLVMF.RGSTN-CD                       
                  ,FND_ACT_NBR_STS_CD  = :DCLVMF.FND-ACT-NBR-STS-CD             
                  ,BK_PHSC_SHR_STS_CD  = :DCLVMF.BK-PHSC-SHR-STS-CD             
                  ,NTWRK_CNTL_STTS_CD  = :DCLVMF.NTWRK-CNTL-STTS-CD             
                  ,ACCT_TYPE_STTS_CD   = :DCLVMF.ACCT-TYPE-STTS-CD              
                  ,DVDND_STTS_CD       = :DCLVMF.DVDND-STTS-CD                  
                  ,DVDND_PYE_STTS_CD   = :DCLVMF.DVDND-PYE-STTS-CD              
                  ,BRKR_EXCTG_STTS_CD  = :DCLVMF.BRKR-EXCTG-STTS-CD             
                  ,MF_FUL_PRTL_STS_CD  = :DCLVMF.MF-FUL-PRTL-STS-CD             
                  ,FNBR                = :DCLVMF.FNBR                           
                  ,BK_PHSCL_SHR_CD     = :DCLVMF.BK-PHSCL-SHR-CD                
                  ,NTWRK_CNTL_CD       = :DCLVMF.NTWRK-CNTL-CD                  
                  ,ACCT_TYPE_CD        = :DCLVMF.ACCT-TYPE-CD                   
                  ,DVDND_CD            = :DCLVMF.DVDND-CD                       
                  ,LTCG_CD             = :DCLVMF.LTCG-CD                        
                  ,STCG_CD             = :DCLVMF.STCG-CD                        
                  ,DVDND_PAYEE_CD      = :DCLVMF.DVDND-PAYEE-CD                 
                  ,BRKR_EXCTG_NBR      = :DCLVMF.BRKR-EXCTG-NBR                 
                  ,MF_FULL_PRTL_CD     = :DCLVMF.MF-FULL-PRTL-CD                
                  ,PRGM_NM             = :DCLVMF.PRGM-NM                        
                  ,CICS_TERM_ID_CD     = :DCLVMF.CICS-TERM-ID-CD                
                  ,UPDT_TMSTP          = :DCLVMF.UPDT-TMSTP                     
DJ0005            ,FCST_RCVR_STTS_CD   = :DCLVMF.FCST-RCVR-STTS-CD              
DJ0005            ,FCST_ACCT_RCVR_NBR  = :DCLVMF.FCST-ACCT-RCVR-NBR             
                WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR               
                  AND  ACAT_CONTROL_NBR  = :W-NSCC-AT-ACAT-CTL-NBR              
                  AND  ASSET_SEQ_NBR     = :W-AT-ASSET-SEQ-NBR                  
           END-EXEC.                                                            
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'VMF     '               TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           .                                                                    
       6600-EXIT. EXIT.                                                         
      /                                                                         
       6700-GETMSDC         SECTION.                                            
                                                                                
DJ0018     MOVE LOW-VALUES             TO GETMSD-SEARCH-KEY-AREA                
DJ0013     MOVE W-NSCC-AT-SEC-ID       TO GETMSD-SEARCH-KEY                     
                                                                                
           IF  W-NSCC-AT-SEC-ID = ' '                                           
DJ0020         ADD 1 TO W-BLANK-SEC-CNT                                         
               IF  W-DSTBN-SIDE-CD = 'D'                                        
               AND W-NSCC-AT-ASSET-DESC (121:8) = 'ADP-SEC:'                    
                   MOVE W-NSCC-AT-ASSET-DESC (129:7)                            
                                         TO GETMSD-SEARCH-KEY                   
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                              ' W-NSCC-AT-SEC-ID IS BLANK.'                     
                              ' ADP-SEC= ' GETMSD-SEARCH-KEY                    
                              ' LOC=' W-NSCC-AT-STL-LOC                         
                              ' RSN=' W-NSCC-AT-STL-LOC-RSN-CD                  
                            ' ' W-NSCC-AT-ASSET-DESC (1:30)                     
               ELSE                                                             
DJ0020             CONTINUE                                                     
               END-IF                                                           
           ELSE                                                                 
               IF  W-ACTIAST-FND-SW = 'Y'                                       
                   IF  SECURITY-ADP-NBR OF DCLACTIAST > ' '                     
                       MOVE SECURITY-ADP-NBR OF DCLACTIAST                      
                                         TO GETMSD-SEARCH-KEY                   
DJ0023                 MOVE 'Y' TO W-ACTIAST-ADP-SW                             
DJ0023             ELSE                                                         
DJ0023                 MOVE 'N' TO W-ACTIAST-ADP-SW                             
                   END-IF                                                       
               ELSE                                                             
DJ0020             CONTINUE                                                     
               END-IF                                                           
           END-IF                                                               
                                                                                
DJ0024     IF  W-ACTIAST-ADP-SW = 'N'                                           
DJ0024     AND (W-NSCC-AT-ASSET-PRC-CATG = 'CORP' OR 'MUNI' OR 'ZERO')          
DJ0023         PERFORM 6800-BONDS      THRU 6800-EXIT                           
DJ0023         GO TO 6700-EXIT                                                  
DJ0023     END-IF                                                               
                                                                                
LRM040     IF  W-DSTBN-SIDE-CD = 'D'                                            
LRM040     AND W-NSCC-AT-ASSET-DESC (121:8) = 'ADP-SEC:'                        
LRM040     AND W-NSCC-AT-ASSET-DESC (129:7) > SPACES                            
LRM040        CONTINUE                                                          
LRM040     ELSE                                                                 
LRM040     IF W-NSCC-AT-SEC-CNTRY-CD > SPACES                                   
LRM040     AND W-NSCC-AT-SEC-CNTRY-CD NOT = 'US'                                
LRM040     AND W-NSCC-AT-SEC-ID    > SPACES                                LV002
LRM040     AND W-NSCC-AT-SEC-CHKDGT > SPACES                               LV002
LRM040         ADD 1 TO W-NON-US-ISIN-CNT                                       
LRM040         PERFORM 6704-RECEIVER-ISIN THRU 6704-EXIT                        
LRM040         IF NSCC-NON-ADP-IND OF DCLVASSET = 'S'                           
LRM040            GO TO 6700-EXIT                                               
LRM040     END-IF.                                                              
           IF   W-NSCC-AT-WHN-ISS-IND = 'W'                                     
                MOVE '1'               TO GETMSD-WI-CODE                        
DJ0022          DISPLAY 'INP=' W-INFILE-CNT                                     
DJ0022                     ' ' W-NSCC-KEY-CLIENT-NBR                            
DJ0022                     ' ' W-NSCC-ACAT-CTL-NBR                              
DJ0022                     ' ' W-ASSET-SEQ-NBR                                  
DJ0022          ' ' W-NSCC-AT-SEC-CNTRY-CD                                      
DJ0022              W-NSCC-AT-SEC-ID                                            
DJ0022              W-NSCC-AT-SEC-CHKDGT                                        
DJ0022          ' ' W-NSCC-AT-WHN-ISS-IND                                       
DJ0022          ' SIDE=' W-DSTBN-SIDE-CD                                        
DJ0022          ' WHEN-ISSUE W-NSCC-AT-WHN-ISS-IND USE 0'                       
DJ0020     END-IF                                                               
DJ0020          MOVE '0'               TO GETMSD-WI-CODE                        
DJ0018     MOVE W-NSCC-KEY-CLIENT-NBR(2:3) TO W-CLIENT-X                        
DJ0018     MOVE W-CLIENT-NUM           TO GETMSD-CLIENT-PL2                     
DJ0023     PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                         
                                                                                
DJ0023***--IF NOT FOUND BECAUSE OF PRIVATE RANGE, GO TO NOTFND.                 
DJ0023     IF W-PRNGFL-SW = 'Y'                                                 
DJ0023        PERFORM 6720-MSD-NOTFND THRU 6720-EXIT                            
DJ0023     ELSE                                                                 
            IF  GETMSD-RETURN-VALID                                             
DJ0022**-----IF WHEN ISSUE NOTFND, FLIP THE INDICATOR AND TRY REGULAR.          
DJ0022         IF W-NSCC-AT-WHN-ISS-IND = 'W'                                   
DJ0022            MOVE 'I'             TO W-NSCC-AT-WHN-ISS-IND                 
DJ0022                                    WHI-CD OF DCLVASSET                   
DJ0022          DISPLAY 'INP=' W-INFILE-CNT                                     
DJ0022                     ' ' W-NSCC-KEY-CLIENT-NBR                            
DJ0022                     ' ' W-NSCC-ACAT-CTL-NBR                              
DJ0022                     ' ' W-ASSET-SEQ-NBR                                  
DJ0022          ' ' W-NSCC-AT-SEC-CNTRY-CD                                      
DJ0022              W-NSCC-AT-SEC-ID                                            
DJ0022              W-NSCC-AT-SEC-CHKDGT                                        
DJ0022          ' ' W-NSCC-AT-WHN-ISS-IND                                       
DJ0022          ' SIDE=' W-DSTBN-SIDE-CD                                        
DJ0022          ' WHEN-ISSUE W-NSCC-AT-WHN-ISS-IND MOVE I'                      
DJ0022         END-IF                                                           
DJ0019         PERFORM 6710-MSD-FOUND THRU 6710-EXIT                            
            ELSE                                                                
DJ0019         IF W-NSCC-AT-WHN-ISS-IND = 'W'                                   
DJ0022            MOVE 'W'             TO W-NSCC-AT-WHN-ISS-IND                 
DJ0022                                    WHI-CD OF DCLVASSET                   
DJ0019            MOVE '1'             TO GETMSD-WI-CODE                        
DJ0023            PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                  
DJ0019            IF GETMSD-RETURN-VALID                                        
DJ0019               PERFORM 6710-MSD-FOUND  THRU 6710-EXIT                     
DJ0019            ELSE                                                          
DJ0020               PERFORM 6703-USE-ISIN-FOR-GETMSD THRU 6703-EXIT            
DJ0019            END-IF                                                        
DJ0019         ELSE                                                             
DJ0020            PERFORM 6703-USE-ISIN-FOR-GETMSD THRU 6703-EXIT               
DJ0019         END-IF                                                           
            END-IF                                                              
DJ0023     END-IF.                                                              
                                                                                
       6700-EXIT. EXIT.                                                         
      /                                                                         
DJ0020 6703-USE-ISIN-FOR-GETMSD SECTION.                                        
DJ0020*WHEN CUSIP NOT FOUND, TRY ISIN NUMBER                                    
DJ0020                                                                          
DJ0020***USE ALL THREE ISIN FIELDS FROM SIAC TO LOOK UP MSD                     
DJ0020     MOVE W-NSCC-AT-SEC-CNTRY-CD TO GETMSD-SEARCH-KEY(1:2)                
DJ0020     MOVE W-NSCC-AT-SEC-ID       TO GETMSD-SEARCH-KEY(3:9)                
DJ0020     MOVE W-NSCC-AT-SEC-CHKDGT   TO GETMSD-SEARCH-KEY(12:1)               
DJ0023     PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                         
DJ0020     IF  GETMSD-RETURN-VALID                                              
DJ0020         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0020               ' 6703-USE-ISIN        '                                   
DJ0020            '"' GETMSD-SEARCH-KEY '"' ' FOUND'                            
DJ0020         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0020                    ' ' W-NSCC-KEY-CLIENT-NBR                             
DJ0020                    ' ' W-NSCC-ACAT-CTL-NBR                               
DJ0020                    ' ' W-ASSET-SEQ-NBR                                   
DJ0020            ' ISIN FOUND'                                                 
DJ0020           ' ISN=' W-NSCC-AT-SEC-CNTRY-CD                                 
DJ0020                    W-NSCC-AT-SEC-ID                                      
DJ0020                    W-NSCC-AT-SEC-CHKDGT                                  
DJ0020            ' CT=' W-NSCC-AT-ASSET-PRC-CATG                               
DJ0020            ' SL=' W-NSCC-AT-STL-LOC                                      
DJ0020            ' RS=' W-NSCC-AT-STL-LOC-RSN-CD                               
DJ0020            ' WH=' W-NSCC-AT-WHN-ISS-IND                                  
DJ0020            ' BD=' W-NSCC-AT-BEARER-BOND                                  
DJ0020            ' OP=' W-NSCC-AT-OPT-CATG                                     
DJ0020            ' CU=' W-NSCC-AT-ISO-CURCY-CD                                 
DJ0020         DISPLAY '    ' 'DESC=' W-NSCC-AT-ASSET-DESC (1:110)              
DJ0020         DISPLAY '    ' W-NSCC-AT-ASSET-DESC (111:30) '<='                
DJ0022         DISPLAY '    ADP=' MS-ADP-NO                                     
DJ0022                  ' ' MS-DESC1 MS-DESC2 MS-DESC3                          
DJ0020         PERFORM 6710-MSD-FOUND  THRU 6710-EXIT                           
DJ0020     ELSE                                                                 
DJ0020       IF  W-NSCC-AT-ASSET-DESC (114:15) = 'SUBMITTER ISIN:'              
DJ0020       AND W-NSCC-AT-ASSET-DESC (138:1) > ' '                             
DJ0020       AND W-NSCC-AT-ASSET-DESC (139:1) > ' '                             
DJ0020         PERFORM 6705-SUBMITTER-ISIN THRU 6705-EXIT                       
DJ0020       ELSE                                                               
DJ0020         PERFORM 6720-MSD-NOTFND THRU 6720-EXIT                           
DJ0020       END-IF                                                             
DJ0020     END-IF.                                                              
DJ0020                                                                          
DJ0020 6703-EXIT. EXIT.                                                         
      /                                                                         
LRM040 6704-RECEIVER-ISIN  SECTION.                                             
LRM040*---------------------------------------------------------------          
LRM040* FIRST CALL MSISINB WITH ISIN AND COUNTRY FOR MATCH.  IF FOUND           
LRM040* USE THE ADP NUMBER RETURNED, OTHER LOOKUP THE OLD WAY.                  
LRM040*---------------------------------------------------------------          
TEST       DISPLAY  'USING 6704- NEW RTN'                                       
LRM040     MOVE 'G' TO MSISIN-ACTION                                       LV002
LRM040     MOVE W-NSCC-AT-SEC-CNTRY-CD TO MSISIN-ISIN-NBR(1:2)             LV002
LRM040                                    MSISIN-COUNTRY                        
LRM040     MOVE W-NSCC-AT-SEC-ID       TO MSISIN-ISIN-NBR(3:9)             LV002
LRM040     MOVE W-NSCC-AT-SEC-CHKDGT   TO MSISIN-ISIN-NBR(12:1)            LV002
LRM040     DISPLAY '6704- CALLING MSISINB WITH ' MSISIN-ISIN-NBR                
LRM040                                       ' ' MSISIN-COUNTRY                 
LRM040     CALL MSISINB                                                         
LRM040         USING MSISIN-COMMAREA.                                   INVPCOMM
LRM040     IF MSISIN-RETURN-CODE NOT = SPACES                              LV002
LRM040        DISPLAY 'MSISIN RET-CODE ' MSISIN-RETURN-CODE                LV002
LRM040     ELSE                                                            LV002
LRM040        DISPLAY  'MSISIN-ADP-NO ' MSISIN-ADP-NO                      LV002
LRM040        MOVE W-CLIENT-NUM           TO GETMSD-CLIENT-PL2                  
LRM040        MOVE MSISIN-ADP-NO               TO GETMSD-SEARCH-KEY             
LRM040        PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                      
LRM040        IF  GETMSD-RETURN-VALID                                           
LRM040          MOVE 'S' TO NSCC-NON-ADP-IND   OF DCLVASSET                     
LRM040          DISPLAY 'INP=' W-INFILE-CNT                                     
LRM040                      ' 6704-ISIN MSISISB FOUND '                         
LRM040           ' AFTER MSISINB LOOKUP'                                        
LRM040          PERFORM 6710-MSD-FOUND  THRU 6710-EXIT                          
LRM040          ADD 1 TO W-ISIN-12BYTE-FND-CNT                                  
LRM040     END-IF.                                                              
LRM040 6704-EXIT. EXIT.                                                         
DJ0020                                                                          
DJ0020 6705-SUBMITTER-ISIN  SECTION.                                            
DJ0020* USE "SUBMITTER-ISIN:" IN THE ASSET DESCRIPTION FIELD                    
LRM037*---------------------------------------------------------------          
LRM037* FIRST CALL MSISINB WITH ISIN AND COUNTRY FOR MATCH.  IF FOUND           
LRM037* USE THE ADP NUMBER RETURNED, OTHER LOOKUP THE OLD WAY.                  
LRM037*---------------------------------------------------------------          
LRM037     MOVE 'G' TO MSISIN-ACTION                                       LV002
LRM037     MOVE W-NSCC-AT-ASSET-DESC (129:12) TO MSISIN-ISIN-NBR           LV002
LRM037     IF W-NSCC-AT-SEC-CNTRY-CD > SPACES                                   
LRM037        MOVE W-NSCC-AT-SEC-CNTRY-CD     TO MSISIN-COUNTRY                 
TEST          DISPLAY 'USING AT-CNTRY ' W-NSCC-AT-SEC-CNTRY-CD                  
LRM037     ELSE                                                                 
LRM037        MOVE W-NSCC-AT-ASSET-DESC (129:2) TO MSISIN-COUNTRY          LV002
TEST          DISPLAY 'USING SB-CNTRY ' W-NSCC-AT-SEC-CNTRY-CD                  
LRM037     END-IF.                                                              
LRM037     DISPLAY 'CALLING MSISINB WITH ' MSISIN-ISIN-NBR                      
LRM037                                 ' ' MSISIN-COUNTRY                       
LRM037     CALL MSISINB                                                         
LRM037         USING MSISIN-COMMAREA.                                   INVPCOMM
LRM037     IF MSISIN-RETURN-CODE NOT = SPACES                              LV002
LRM037        DISPLAY 'MSISIN RET-CODE ' MSISIN-RETURN-CODE                LV002
LRM037     ELSE                                                            LV002
LRM037        DISPLAY  'MSISIN-ADP-NO ' MSISIN-ADP-NO                      LV002
LRM037        MOVE MSISIN-ADP-NO               TO GETMSD-SEARCH-KEY             
LRM037        PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                      
LRM037        IF  GETMSD-RETURN-VALID                                           
LRM037          MOVE 'I' TO NSCC-NON-ADP-IND   OF DCLVASSET                     
LRM037          DISPLAY 'INP=' W-INFILE-CNT                                     
LRM037                      ' 6705-SUBMITTER-ISIN12'                            
LRM037           '"' W-NSCC-AT-ASSET-DESC (114:27) '"' ' FOUND'                 
LRM037           ' AFTER MSISINB LOOKUP'                                        
LRM037          PERFORM 6710-MSD-FOUND  THRU 6710-EXIT                          
LRM037          ADD 1 TO W-SUB-ISIN-FND-CNT                                     
LRM037          GO TO 6705-EXIT                                                 
LRM037     END-IF.                                                              
DJ0020                                                                          
DJ0020* USE "SUBMITTER-ISIN:" 12 BYTES                                          
DJ0020     MOVE W-NSCC-AT-ASSET-DESC (129:12) TO GETMSD-SEARCH-KEY              
DJ0023     PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                         
DJ0020     IF  GETMSD-RETURN-VALID                                              
LRM028         MOVE 'I' TO NSCC-NON-ADP-IND   OF DCLVASSET                      
DJ0020         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0020                     ' 6705-SUBMITTER-ISIN12 VRS2'                        
DJ0020          '"' W-NSCC-AT-ASSET-DESC (114:27) '"' ' FOUND'                  
DJ0020         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0020                    ' ' W-NSCC-KEY-CLIENT-NBR                             
DJ0020                    ' ' W-NSCC-ACAT-CTL-NBR                               
DJ0020                    ' ' W-ASSET-SEQ-NBR                                   
DJ0020            ' SUBM-FND-1'                                                 
DJ0020           ' ISN=' W-NSCC-AT-SEC-CNTRY-CD                                 
DJ0020                    W-NSCC-AT-SEC-ID                                      
DJ0020                    W-NSCC-AT-SEC-CHKDGT                                  
DJ0020            ' CT=' W-NSCC-AT-ASSET-PRC-CATG                               
DJ0020            ' SL=' W-NSCC-AT-STL-LOC                                      
DJ0020            ' RS=' W-NSCC-AT-STL-LOC-RSN-CD                               
DJ0020            ' WH=' W-NSCC-AT-WHN-ISS-IND                                  
DJ0020            ' BD=' W-NSCC-AT-BEARER-BOND                                  
DJ0020            ' OP=' W-NSCC-AT-OPT-CATG                                     
DJ0020            ' CU=' W-NSCC-AT-ISO-CURCY-CD                                 
DJ0020         DISPLAY '    ' 'DESC=' W-NSCC-AT-ASSET-DESC (1:110)              
DJ0020         DISPLAY '    ' W-NSCC-AT-ASSET-DESC (111:30) '<='                
DJ0022         DISPLAY '    ADP=' MS-ADP-NO                                     
DJ0022                  ' ' MS-DESC1 MS-DESC2 MS-DESC3                          
DJ0020         PERFORM 6710-MSD-FOUND  THRU 6710-EXIT                           
DJ0020         ADD 1 TO W-SUB-ISIN-FND-CNT                                      
DJ0020     ELSE                                                                 
DJ0020***----USE "SUBMITTER-ISIN:" 9 BYTES                                      
DJ0020       MOVE ' '                         TO GETMSD-SEARCH-KEY              
DJ0020       MOVE W-NSCC-AT-ASSET-DESC (131:9)                                  
DJ0020                                        TO GETMSD-SEARCH-KEY(1:9)         
DJ0023       PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                       
DJ0020       IF  GETMSD-RETURN-VALID                                            
LRM028         MOVE '9' TO NSCC-NON-ADP-IND   OF DCLVASSET                      
DJ0020         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0020                     ' 6705-SUBMITTER-ISIN9 '                             
DJ0020          '"' W-NSCC-AT-ASSET-DESC (114:27) '"' ' FOUND'                  
DJ0020         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0020                    ' ' W-NSCC-KEY-CLIENT-NBR                             
DJ0020                    ' ' W-NSCC-ACAT-CTL-NBR                               
DJ0020                    ' ' W-ASSET-SEQ-NBR                                   
DJ0020            ' SUBM-FND-9'                                                 
DJ0020           ' ISN=' W-NSCC-AT-SEC-CNTRY-CD                                 
DJ0020                    W-NSCC-AT-SEC-ID                                      
DJ0020                    W-NSCC-AT-SEC-CHKDGT                                  
DJ0020            ' CT=' W-NSCC-AT-ASSET-PRC-CATG                               
DJ0020            ' SL=' W-NSCC-AT-STL-LOC                                      
DJ0020            ' RS=' W-NSCC-AT-STL-LOC-RSN-CD                               
DJ0020            ' WH=' W-NSCC-AT-WHN-ISS-IND                                  
DJ0020            ' BD=' W-NSCC-AT-BEARER-BOND                                  
DJ0020            ' OP=' W-NSCC-AT-OPT-CATG                                     
DJ0020            ' CU=' W-NSCC-AT-ISO-CURCY-CD                                 
DJ0020         DISPLAY '    ' 'DESC=' W-NSCC-AT-ASSET-DESC (1:110)              
DJ0020         DISPLAY '    ' W-NSCC-AT-ASSET-DESC (111:30) '<='                
DJ0022         DISPLAY '    ADP=' MS-ADP-NO                                     
DJ0022                  ' ' MS-DESC1 MS-DESC2 MS-DESC3                          
DJ0020         PERFORM 6710-MSD-FOUND  THRU 6710-EXIT                           
DJ0020         ADD 1 TO W-SUB-ISIN-FND-CNT                                      
DJ0020       ELSE                                                               
DJ0020         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0020                     ' 6705-SUBMITTER-ISIN  '                             
DJ0020          '"' W-NSCC-AT-ASSET-DESC (114:27) '"' ' NOT FOUND'              
DJ0020         PERFORM 6720-MSD-NOTFND THRU 6720-EXIT                           
DJ0020       END-IF                                                             
DJ0020     END-IF.                                                              
DJ0020                                                                          
DJ0020 6705-EXIT. EXIT.                                                         
      /                                                                         
       6710-MSD-FOUND       SECTION.                                            
                                                                                
           ADD 1 TO W-MSD-FND-CNT                                               
           IF  MS-DESC2 < ' '                                                   
               MOVE ' '       TO MS-DESC2                                       
           END-IF                                                               
           IF  MS-DESC3 < ' '                                                   
               MOVE ' '       TO MS-DESC3                                       
           END-IF                                                               
                                                                                
           MOVE 'N'           TO W-MSD-NOTFND-SW                                
           MOVE MS-ADP-NO     TO SECURITY-ADP-NBR OF DCLVASSET                  
           MOVE ' '           TO ASSET-DESC-TXT OF DCLVASSET                    
           MOVE MS-DESC1      TO ASSET-DESC-TXT OF DCLVASSET (1:30)             
           MOVE MS-DESC2      TO ASSET-DESC-TXT OF DCLVASSET (31:30)            
           MOVE MS-DESC3      TO ASSET-DESC-TXT OF DCLVASSET (61:30)            
           MOVE MS-ADP-NO     TO WK-POS-DESC5-SEC                               
           MOVE WK-POS-DESC5  TO ASSET-DESC-TXT OF DCLVASSET (121:20)           
                                                                                
DJ0020     IF  MS-CUSIP-NO > ' '                                                
DJ0020             MOVE 'US'      TO W-NSCC-AT-SEC-CNTRY-CD                     
DJ0020             MOVE MS-CUSIP-NO TO W-NSCC-AT-SEC-ID                         
DJ0020             MOVE W-NSCC-AT-SEC-CNTRY-CD                                  
DJ0020                            TO ISIN-CNTRY-CD      OF DCLVASSET            
DJ0020             MOVE W-NSCC-AT-SEC-ID                                        
DJ0020                            TO ISIN-SEC-ISSUE-CD  OF DCLVASSET            
DJ0020     ELSE                                                                 
DJ0020         IF MSD-ISIN > ' '                                                
DJ0020            DISPLAY 'USE MSD-ISIN ' MSD-ISIN                              
DJ0020            MOVE MSD-ISIN(1:2)  TO W-NSCC-AT-SEC-CNTRY-CD                 
DJ0020            MOVE MSD-ISIN(3:9)  TO W-NSCC-AT-SEC-ID                       
DJ0020            MOVE MSD-ISIN(12:1) TO W-NSCC-AT-SEC-CHKDGT                   
DJ0020             MOVE W-NSCC-AT-SEC-CNTRY-CD                                  
DJ0020                            TO ISIN-CNTRY-CD      OF DCLVASSET            
DJ0020             MOVE W-NSCC-AT-SEC-ID                                        
DJ0020                            TO ISIN-SEC-ISSUE-CD  OF DCLVASSET            
LRM040             MOVE W-NSCC-AT-SEC-CHKDGT                                    
LRM040                            TO ISIN-SEC-CDG-CD    OF DCLVASSET            
DJ0020         ELSE                                                             
DJ0020             MOVE 'US'      TO W-NSCC-AT-SEC-CNTRY-CD                     
DJ0020             MOVE 'XX'      TO W-NSCC-AT-SEC-ID (1:2)                     
DJ0020             MOVE MS-ADP-NO TO W-NSCC-AT-SEC-ID (3:7)                     
DJ0020             MOVE W-NSCC-AT-SEC-CNTRY-CD                                  
DJ0020                            TO ISIN-CNTRY-CD      OF DCLVASSET            
DJ0020             MOVE W-NSCC-AT-SEC-ID                                        
DJ0020                            TO ISIN-SEC-ISSUE-CD  OF DCLVASSET            
DJ0020         END-IF                                                           
DJ0020     END-IF.                                                              
                                                                                
LRM031     EVALUATE TRUE                                                        
LRM031       WHEN MS-MULTIPLY-PRICE-BY-1                                        
LRM031            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 1            
LRM031       WHEN MS-MULTIPLY-PRICE-BY-10                                       
LRM031            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 10           
LRM031       WHEN MS-MULTIPLY-PRICE-BY-100                                      
LRM031            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 100          
LRM031       WHEN MS-MULTIPLY-PRICE-BY-1000                                     
LRM031            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 1000         
LRM031       WHEN MS-MULTIPLY-PRICE-BY-10000                                    
LRM031            COMPUTE WK-MS-CLOSING-PRICE =                                 
LRM031                                     MS-CLOSING-PRICE * 10000             
LRM031       WHEN MS-MULTIPLY-PRICE-BY-100000                                   
LRM031            COMPUTE WK-MS-CLOSING-PRICE =                                 
LRM031                                     MS-CLOSING-PRICE * 100000            
LRM031       WHEN MS-MULTIPLY-PRICE-BY-1000000                                  
LRM031            COMPUTE WK-MS-CLOSING-PRICE =                                 
LRM031                                     MS-CLOSING-PRICE * 1000000           
LRM031        WHEN MS-MULTIPLY-PRICE-BY-10000000                                
LRM031            COMPUTE WK-MS-CLOSING-PRICE =                                 
LRM031                                     MS-CLOSING-PRICE * 10000000          
LRM031        WHEN OTHER                                                        
LRM031            MOVE MS-CLOSING-PRICE  TO WK-MS-CLOSING-PRICE                 
LRM031     END-EVALUATE.                                                        
       6710-EXIT. EXIT.                                                         
      /                                                                         
       6720-MSD-NOTFND      SECTION.                                            
           ADD 1 TO W-MSD-NOTFND-CNT                                            
           MOVE 'Y'         TO W-MSD-NOTFND-SW                                  
           MOVE ' '         TO SECURITY-ADP-NBR   OF DCLVASSET                  
           MOVE 'Y'         TO ISIN-SEC-EXCPT-IND OF DCLVASSET                  
           DISPLAY 'INP=' W-INFILE-CNT                                          
DJ0020                    ' ' W-NSCC-KEY-CLIENT-NBR                             
DJ0020                    ' ' W-NSCC-ACAT-CTL-NBR                               
DJ0020                    ' ' W-ASSET-SEQ-NBR                                   
                  ' MSD-NOTFND'                                                 
DJ0020           ' ISN=' W-NSCC-AT-SEC-CNTRY-CD                                 
DJ0020                   W-NSCC-AT-SEC-ID                                       
DJ0020                   W-NSCC-AT-SEC-CHKDGT                                   
DJ0020            ' CT=' W-NSCC-AT-ASSET-PRC-CATG                               
DJ0020            ' SL=' W-NSCC-AT-STL-LOC                                      
DJ0020            ' RS=' W-NSCC-AT-STL-LOC-RSN-CD                               
DJ0020            ' WH=' W-NSCC-AT-WHN-ISS-IND                                  
DJ0020            ' BD=' W-NSCC-AT-BEARER-BOND                                  
DJ0020            ' OP=' W-NSCC-AT-OPT-CATG                                     
DJ0020            ' CU=' W-NSCC-AT-ISO-CURCY-CD                                 
DJ0020     DISPLAY '    ' 'DESC=' W-NSCC-AT-ASSET-DESC (1:110)                  
DJ0020     DISPLAY '    ' W-NSCC-AT-ASSET-DESC (111:30) '<='.                   
       6720-EXIT. EXIT.                                                         
      /                                                                         
CSG001 6730-EDIT-ASSET-DESC-TXT SECTION.                                        
CSG001* MOVE SPACES FOR THE SPECIAL CHARACTERS FOUND IN ASSET-DESC-TXT.         
CSG001* AND LEFT JUSTIFY THE FIRST DESCRIPTION IF FIRST CHAR IS SPACE           
CSG001* AFTER EDITED.                                                           
CSG001     MOVE SPACES                 TO W-EDIT-ASSET-DESC-TXT-FLAG            
CSG001     PERFORM                                                              
CSG001         VARYING W-SUB1 FROM 1 BY 1                                       
CSG001           UNTIL W-SUB1 > 140                                             
CSG001         MOVE W-ASSET-DESC-TXT(W-SUB1:1)    TO W-EDIT-CHAR-AREA2          
CSG001         IF NOT W-VALID-CHARACTER2                                        
CSG001            MOVE SPACES           TO W-ASSET-DESC-TXT(W-SUB1:1)           
CSG001            SET W-EDIT-ASSET-DESC-TXT-Y     TO TRUE                       
CSG001         END-IF                                                           
CSG001     END-PERFORM                                                          
CSG001*                                                                         
CSG001     IF W-EDIT-ASSET-DESC-TXT-Y AND                                       
CSG001        W-ASSET-DESC1-TXT(1:1) = SPACES                                   
CSG001        SET W-JUST-LEFT-NOT-DONE       TO TRUE                            
CSG001        PERFORM                                                           
CSG001          VARYING W-SUB1 FROM 2 BY 1                                      
CSG001            UNTIL W-SUB1 > 30 OR W-JUST-LEFT-DONE                         
CSG001          IF W-ASSET-DESC1-TXT(W-SUB1 : 1) NOT = SPACES           03760002
CSG001             MOVE SPACES               TO W-ASSET-DESC-TMP                
CSG001             MOVE W-ASSET-DESC1-TXT(W-SUB1 : ) TO W-ASSET-DESC-TMP03760002
CSG001             MOVE W-ASSET-DESC-TMP     TO W-ASSET-DESC1-TXT               
CSG001             SET W-JUST-LEFT-DONE      TO TRUE                    03760002
CSG001          END-IF                                                  03760002
CSG001        END-PERFORM                                               03760002
CSG001     END-IF                                                       03760002
CSG001           .                                                      03760002
CSG001 6730-EXIT. EXIT.                                                         
CSG001/                                                                         
       6800-BONDS           SECTION.                                            
                                                                                
DJ0023     MOVE ' ' TO W-GETXRF-KEY-9                                           
DJ0022     IF  W-NSCC-AT-WHN-ISS-IND = 'W'                                      
DJ0022             DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0022                        ' ' W-NSCC-KEY-CLIENT-NBR                         
DJ0022                        ' ' W-NSCC-ACAT-CTL-NBR                           
DJ0022                        ' ' W-ASSET-SEQ-NBR                               
DJ0022             ' ' W-NSCC-AT-SEC-CNTRY-CD                                   
DJ0022                 W-NSCC-AT-SEC-ID                                         
DJ0022                 W-NSCC-AT-SEC-CHKDGT                                     
DJ0022             ' ' W-NSCC-AT-WHN-ISS-IND                                    
DJ0022             ' SIDE=' W-DSTBN-SIDE-CD                                     
DJ0022             ' WHEN-ISSUE BOND (IGNORE IT)'                               
DJ0022         MOVE 'I'              TO W-NSCC-AT-WHN-ISS-IND                   
DJ0022                                  WHI-CD OF DCLVASSET                     
DJ0022     END-IF                                                               
DJ0023***--DON'T CALL GETMSD IF THERE IS NO CUSIP                               
DJ0023     IF W-NSCC-AT-SEC-ID > ' '                                            
DJ0022***---IGNORE WHEN ISSUE INDICATOR FOR BONDS, USE REGULAR                  
DJ0022      MOVE '0'              TO GETXRF-WI-CODE                             
DJ0020      MOVE W-NSCC-AT-SEC-ID TO W-GETXRF-KEY-9                             
            IF  W-NSCC-AT-BEARER-BOND = 'B'                                     
                PERFORM 6810-BEARER-BOND THRU 6810-EXIT                         
            ELSE                                                                
               IF  W-NSCC-AT-ASSET-PRC-CATG = 'MUNI'                            
                   PERFORM 6820-MUNI-BOND THRU 6820-EXIT                        
               ELSE                                                             
                   PERFORM 6830-REGISTERED-BOND THRU 6830-EXIT                  
               END-IF                                                           
            END-IF                                                              
DJ0023     ELSE                                                                 
DJ0023       MOVE 'N'          TO GETMSD-RETURN-CODE                            
DJ0023       MOVE 'N'          TO GETXRF-RETURN-CODE                            
DJ0023     END-IF                                                               
                                                                                
DJ0020     IF  GETXRF-RETURN-VALID                                              
DJ0020     AND GETMSD-RETURN-VALID                                              
DJ0020         CONTINUE                                                         
DJ0020     ELSE                                                                 
DJ0020       IF W-NSCC-AT-ASSET-DESC (114:15) = 'SUBMITTER ISIN:'               
DJ0023       AND W-NSCC-AT-ASSET-DESC (138:1) > ' '                             
DJ0023       AND W-NSCC-AT-ASSET-DESC (139:1) > ' '                             
DJ0020          MOVE W-NSCC-AT-ASSET-DESC (131:9) TO W-GETXRF-KEY-9             
DJ0020          IF  W-NSCC-AT-BEARER-BOND = 'B'                                 
DJ0020              PERFORM 6810-BEARER-BOND THRU 6810-EXIT                     
DJ0020          ELSE                                                            
DJ0020              IF  W-NSCC-AT-ASSET-PRC-CATG = 'MUNI'                       
DJ0020                  PERFORM 6820-MUNI-BOND THRU 6820-EXIT                   
DJ0020              ELSE                                                        
DJ0020                  PERFORM 6830-REGISTERED-BOND THRU 6830-EXIT             
DJ0020              END-IF                                                      
DJ0020          END-IF                                                          
DJ0020          IF  GETXRF-RETURN-VALID                                         
DJ0020          AND GETMSD-RETURN-VALID                                         
LRM028            MOVE 'B' TO NSCC-NON-ADP-IND   OF DCLVASSET                   
DJ0020            DISPLAY 'INP=' W-INFILE-CNT                                   
DJ0020                    ' ' W-NSCC-KEY-CLIENT-NBR                             
DJ0020                    ' ' W-NSCC-ACAT-CTL-NBR                               
DJ0020                    ' ' W-ASSET-SEQ-NBR                                   
DJ0020            ' SUBB-FND-9'                                                 
DJ0020            ' ISN=' W-NSCC-AT-SEC-CNTRY-CD                                
DJ0020                    W-NSCC-AT-SEC-ID                                      
DJ0020                    W-NSCC-AT-SEC-CHKDGT                                  
DJ0020            ' CT=' W-NSCC-AT-ASSET-PRC-CATG                               
DJ0020            ' SL=' W-NSCC-AT-STL-LOC                                      
DJ0020            ' RS=' W-NSCC-AT-STL-LOC-RSN-CD                               
DJ0020            ' WH=' W-NSCC-AT-WHN-ISS-IND                                  
DJ0020            ' BD=' W-NSCC-AT-BEARER-BOND                                  
DJ0020            ' OP=' W-NSCC-AT-OPT-CATG                                     
DJ0020            ' CU=' W-NSCC-AT-ISO-CURCY-CD                                 
DJ0020            DISPLAY '    DESC=' W-NSCC-AT-ASSET-DESC (1:110)              
DJ0020            DISPLAY '    ' W-NSCC-AT-ASSET-DESC (111:30) '<='             
DJ0022            DISPLAY '    ADP=' MS-ADP-NO                                  
DJ0022                     ' ' MS-DESC1 MS-DESC2 MS-DESC3                       
DJ0020          END-IF                                                          
DJ0020       END-IF                                                             
DJ0020     END-IF                                                               
                                                                                
           IF  GETXRF-RETURN-VALID                                              
           AND GETMSD-RETURN-VALID                                              
DJ0023         PERFORM 6803-BOND-FOUND THRU 6803-EXIT                           
           ELSE                                                                 
DJ0023***----IF ALL ELSE FAIL, TRY JUST 9 BYTE CUSIP                            
DJ0023       IF W-GETXRF-KEY-9 > ' '                                            
DJ0023       AND W-GETXRF-KEY-9(8:1) > ' '                                      
DJ0023       AND W-GETXRF-KEY-9(9:1) > ' '                                      
DJ0023         DISPLAY 'INP=' W-INFILE-CNT ' ' W-NSCC-KEY-CLIENT-NBR            
DJ0023         ' ' W-NSCC-ACAT-CTL-NBR ' ' W-ASSET-SEQ-NBR                      
DJ0023         ' USE 9 BYTES FOR BOND: ' W-GETXRF-KEY-9                         
DJ0023         '-' W-NSCC-AT-SEC-ID '-' W-NSCC-AT-ASSET-DESC(131:9) '-'         
DJ0023         MOVE W-GETXRF-KEY-9   TO GETMSD-SEARCH-KEY                       
DJ0023         PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                     
DJ0023         IF  GETMSD-RETURN-VALID                                          
LRM028             MOVE '9' TO NSCC-NON-ADP-IND   OF DCLVASSET                  
DJ0023             PERFORM 6803-BOND-FOUND THRU 6803-EXIT                       
DJ0023         ELSE                                                             
DJ0023             PERFORM 6805-BOND-NOT-FOUND THRU 6805-EXIT                   
DJ0023         END-IF                                                           
DJ0023       ELSE                                                               
DJ0023             PERFORM 6805-BOND-NOT-FOUND THRU 6805-EXIT                   
DJ0023       END-IF                                                             
           END-IF.                                                              
                                                                                
       6800-EXIT. EXIT.                                                         
                                                                                
      /                                                                         
DJ0023 6803-BOND-FOUND.                                                         
           ADD 1 TO W-MSD-FND-CNT                                               
           ADD 1 TO W-BOND-FND-CNT                                              
           IF  MS-DESC2 < ' '                                                   
               MOVE ' '       TO MS-DESC2                                       
           END-IF                                                               
           IF  MS-DESC3 < ' '                                                   
               MOVE ' '       TO MS-DESC3                                       
           END-IF                                                               
           MOVE 'N'           TO W-MSD-NOTFND-SW                                
           MOVE MS-ADP-NO     TO SECURITY-ADP-NBR OF DCLVASSET                  
           MOVE ' '           TO ASSET-DESC-TXT OF DCLVASSET                    
           MOVE MS-DESC1      TO ASSET-DESC-TXT OF DCLVASSET (1:30)             
           MOVE MS-DESC2      TO ASSET-DESC-TXT OF DCLVASSET (31:30)            
           MOVE MS-DESC3      TO ASSET-DESC-TXT OF DCLVASSET (61:30)            
           MOVE MS-ADP-NO     TO WK-POS-DESC5-SEC                               
           MOVE WK-POS-DESC5  TO ASSET-DESC-TXT OF DCLVASSET (121:20)           
DJ0020     IF MS-CUSIP-NO > ' '                                                 
DJ0020        MOVE 'US'        TO W-NSCC-AT-SEC-CNTRY-CD                        
DJ0020        MOVE MS-CUSIP-NO TO W-NSCC-AT-SEC-ID                              
DJ0020        MOVE W-NSCC-AT-SEC-CNTRY-CD                                       
DJ0020                         TO ISIN-CNTRY-CD      OF DCLVASSET               
DJ0020        MOVE W-NSCC-AT-SEC-ID                                             
DJ0020                         TO ISIN-SEC-ISSUE-CD  OF DCLVASSET               
DJ0020     ELSE                                                                 
DJ0020       IF MSD-ISIN > ' '                                                  
DJ0020          DISPLAY 'USE MSD-ISIN ' MSD-ISIN                                
DJ0020          MOVE MSD-ISIN(1:2)  TO W-NSCC-AT-SEC-CNTRY-CD                   
DJ0020          MOVE MSD-ISIN(3:9)  TO W-NSCC-AT-SEC-ID                         
DJ0020          MOVE MSD-ISIN(12:1) TO W-NSCC-AT-SEC-CHKDGT                     
DJ0020          MOVE W-NSCC-AT-SEC-CNTRY-CD                                     
DJ0020                         TO ISIN-CNTRY-CD      OF DCLVASSET               
DJ0020          MOVE W-NSCC-AT-SEC-ID                                           
DJ0020                         TO ISIN-SEC-ISSUE-CD  OF DCLVASSET               
DJ0020       ELSE                                                               
DJ0020          MOVE 'US'       TO W-NSCC-AT-SEC-CNTRY-CD                       
DJ0020          MOVE 'XX'       TO W-NSCC-AT-SEC-ID (1:2)                       
DJ0020          MOVE MS-ADP-NO  TO W-NSCC-AT-SEC-ID (3:7)                       
DJ0020          MOVE W-NSCC-AT-SEC-CNTRY-CD                                     
DJ0020                         TO ISIN-CNTRY-CD      OF DCLVASSET               
DJ0020          MOVE W-NSCC-AT-SEC-ID                                           
DJ0020                         TO ISIN-SEC-ISSUE-CD  OF DCLVASSET               
DJ0020       END-IF                                                             
DJ0020     END-IF.                                                              
                                                                                
DJ0023 6803-EXIT. EXIT.                                                         
      /                                                                         
TEST   6804-DUMMY-PARA.                                                         
TEST       DISPLAY 'THIS CODE SHOULD NEVER BE EXECUTED'.                        
TEST   6804-DUMMY-SECTION  SECTION.                                             
TEST       DISPLAY 'THIS SECTION CAN NEVER BE EXECUTED'.                        
      /                                                                         
DJ0023 6805-BOND-NOT-FOUND.                                                     
                                                                                
           ADD 1 TO W-MSD-NOTFND-CNT                                            
           ADD 1 TO W-BOND-NOTFND-CNT                                           
           MOVE 'Y'         TO W-MSD-NOTFND-SW                                  
           MOVE ' '         TO SECURITY-ADP-NBR   OF DCLVASSET                  
           MOVE 'Y'         TO ISIN-SEC-EXCPT-IND OF DCLVASSET                  
           DISPLAY 'INP=' W-INFILE-CNT                                          
DJ0020                ' ' W-NSCC-KEY-CLIENT-NBR                                 
DJ0020                ' ' W-NSCC-ACAT-CTL-NBR                                   
DJ0020                ' ' W-ASSET-SEQ-NBR                                       
DJ0020                  ' BOND-NOTFD'                                           
DJ0020            ' ISN=' W-NSCC-AT-SEC-CNTRY-CD                                
DJ0020                    W-NSCC-AT-SEC-ID                                      
DJ0020                    W-NSCC-AT-SEC-CHKDGT                                  
DJ0020             ' CT=' W-NSCC-AT-ASSET-PRC-CATG                              
DJ0020             ' SL=' W-NSCC-AT-STL-LOC                                     
DJ0020             ' RS=' W-NSCC-AT-STL-LOC-RSN-CD                              
DJ0020             ' WH=' W-NSCC-AT-WHN-ISS-IND                                 
DJ0020             ' BD=' W-NSCC-AT-BEARER-BOND                                 
DJ0020             ' OP=' W-NSCC-AT-OPT-CATG                                    
DJ0020             ' CU=' W-NSCC-AT-ISO-CURCY-CD                                
DJ0020     DISPLAY '    ' 'DESC=' W-NSCC-AT-ASSET-DESC (1:110)                  
DJ0020     DISPLAY '    ' W-NSCC-AT-ASSET-DESC (111:30) '<='.                   
                                                                                
DJ0023 6805-EXIT. EXIT.                                                         
      /                                                                         
       6810-BEARER-BOND.                                                        
                                                                                
DJ0020     MOVE W-GETXRF-KEY-9       TO GETXRF-SEARCH-KEY (1:9)                 
                                                                                
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6810-EXIT                                                   
           END-IF.                                                              
                                                                                
       6810-EXIT. EXIT.                                                         
      /                                                                         
       6820-MUNI-BOND.                                                          
                                                                                
DJ0020     MOVE W-GETXRF-KEY-9       TO GETXRF-SEARCH-KEY (1:9)                 
                                                                                
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6820-EXIT                                                   
           END-IF.                                                              
                                                                                
       6820-EXIT. EXIT.                                                         
      /                                                                         
       6830-REGISTERED-BOND.                                                    
                                                                                
DJ0020     MOVE W-GETXRF-KEY-9       TO GETXRF-SEARCH-KEY (1:9)                 
                                                                                
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 6940-GETXREF THRU 6940-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 6830-EXIT                                                   
           END-IF.                                                              
                                                                                
       6830-EXIT. EXIT.                                                         
      /                                                                         
                                                                                
       6940-GETXREF.                                                            
                                                                                
           MOVE ' '          TO GETMSD-RETURN-CODE                              
           MOVE ' '          TO GETXRF-RETURN-CODE                              
           CALL GETXREF   USING GETXRF-CALLING-INFO.                            
           EVALUATE TRUE                                                        
               WHEN  GETXRF-RETURN-VALID                                        
                                                                                
DJ0018             MOVE LOW-VALUES       TO GETMSD-SEARCH-KEY-AREA              
                   MOVE MSXREF-ADP-NO    TO GETMSD-SEARCH-KEY                   
                   MOVE ALL ZERO         TO GETMSD-WI-CODE                      
DJ0018             MOVE W-NSCC-KEY-CLIENT-NBR(2:3) TO W-CLIENT-X                
DJ0018             MOVE W-CLIENT-NUM     TO GETMSD-CLIENT-PL2                   
DJ0023             PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                 
                   IF  MS-DESC2 < ' '                                           
                       MOVE ' '       TO MS-DESC2                               
                   END-IF                                                       
                   IF  MS-DESC3 < ' '                                           
                       MOVE ' '       TO MS-DESC3                               
                   END-IF                                                       
                   MOVE MS-SYMBOL           TO FMT-SEC-SYMBOL                   
                   MOVE MS-ADP-NO           TO FMT-ADP-SEC-NO                   
                   MOVE MS-CUSIP-AREA       TO FMT-CUSIP-NO                     
                   MOVE MS-DESC1            TO FMT-DESC1                        
                   MOVE MS-DESC2            TO FMT-DESC2                        
                   MOVE MS-DESC3            TO FMT-DESC3                        
                                                                                
               WHEN  GETXRF-RETURN-EOF                                          
                 OR  GETXRF-INVALID-SYMBOL-CUSIP                                
                 OR  GETXRF-RETURN-REC-NOT-FOUND                                
                 OR  GETXRF-REQ-KEY-SECURITY-NO                                 
                   CONTINUE                                                     
                                                                                
               WHEN  GETXRF-RETURN-IO-ERROR                                     
                     DISPLAY ' CAT515: CALL ZGETXRF ERROR'                      
                             ' GETXRF-RETURN-CODE='                             
                               GETXRF-RETURN-CODE                               
                     MOVE +3701    TO ABEND-CD                                  
                     CALL ABEND USING ABEND-CD                                  
               WHEN  OTHER                                                      
                   CONTINUE                                                     
           END-EVALUATE.                                                        
                                                                                
       6940-EXIT. EXIT.                                                         
      /                                                                         
LRM029 6950-GETADPNO-OPTION.                                                    
LRM029                                                                          
LRM029     MOVE ' '                      TO W-OPT-DESC                          
LRM029     MOVE ' '                      TO FMT-ADP-SEC-NO                      
LRM029     MOVE W-NSCC-ATO-OPT-BS-IND    TO FMT-BUY-SELL-IND                    
LRM029     MOVE W-NSCC-ATO-OPT-PC-IND    TO FMT-OPT-PUT-CALL                    
LRM029     MOVE W-NSCC-ATO-OPT-OC-IND    TO FMT-OPEN-CLOSE                      
LRM029     MOVE W-NSCC-ATO-OPT-SYM       TO FMT-OPT-SYMBOL                      
LRM029     INITIALIZE                   W-DATE                                  
LRM029     IF   W-NSCC-ATO-OPT-EXP-DT > ' '                                     
LRM029          MOVE W-NSCC-ATO-OPT-EXP-CC-NEW  TO W-DATE-CC                    
LRM029          MOVE W-NSCC-ATO-OPT-EXP-YY-NEW  TO W-DATE-YY                    
LRM029          MOVE W-NSCC-ATO-OPT-EXP-MM-NEW  TO W-DATE-MM                    
LRM029          MOVE W-NSCC-ATO-OPT-EXP-DD-NEW  TO W-DATE-DD                    
LRM029     ELSE                                                                 
LRM029          MOVE '00'                   TO W-DATE-CC                        
LRM029          MOVE '01'                   TO W-DATE-YY                        
LRM029          MOVE '01'                   TO W-DATE-MM                        
LRM029          MOVE '01'                   TO W-DATE-DD                        
LRM029     END-IF                                                               
LRM029                                                                          
LRM029     IF  (W-DATE-MM             > '12' OR                                 
LRM029          W-DATE-MM             < '01')                                   
LRM029     OR  (W-DATE-DD             > '31' OR                                 
LRM029          W-DATE-DD             < '01')                                   
LRM029     OR  (W-DATE-CC             < '00')                                   
LRM029     OR  (W-DATE-YY             < '00')                                   
LRM029          MOVE '00'                   TO W-DATE-CC                        
LRM029          MOVE '01'                   TO W-DATE-YY                        
LRM029          MOVE '01'                   TO W-DATE-MM                        
LRM029          MOVE '01'                   TO W-DATE-DD                        
LRM029     END-IF                                                               
LRM029                                                                          
LRM029     MOVE W-DATE-CC                TO FMT-OPT-EXP-CC                      
LRM029     MOVE W-DATE-YY                TO FMT-OPT-EXP-YY                      
LRM029     MOVE W-DATE-MM                TO FMT-OPT-EXP-MM                      
LRM029     MOVE W-DATE-DD                TO FMT-OPT-EXP-DD                      
LRM029     MOVE W-NSCC-ATO-OPT-ACCT-TYP  TO FMT-OPT-ACT-TYPE                    
LRM029                                                                          
LRM029     DISPLAY 'INP=' W-INFILE-CNT                                          
LRM029            ' OPT:' W-NSCC-ATO-OPT-SYM                                    
LRM029               '  ' W-NSCC-ATO-OPT-BS-IND                                 
LRM029                ' ' W-NSCC-ATO-OPT-PC-IND                                 
LRM029                ' ' W-NSCC-ATO-OPT-OC-IND                                 
LRM029              '   ' W-NSCC-ATO-OPT-EXP-DT-NEW                             
LRM029                ' ' W-NSCC-ATO-OPT-STKPRC-INT                             
LRM029                ' ' W-NSCC-ATO-OPT-STKPRC-FRC-NEW                         
LRM029               '  ' W-NSCC-ATO-OPT-COMMENT                                
LRM029                                                                          
LRM029     IF  W-DSTBN-SIDE-CD = 'D'                                            
LRM029     AND W-NSCC-AT-ASSET-DESC (121:8) = 'ADP-SEC:'                        
LRM029             MOVE LOW-VALUES       TO GETMSD-SEARCH-KEY-AREA              
LRM029             MOVE W-NSCC-AT-ASSET-DESC (129:7)                            
LRM029                                   TO GETMSD-SEARCH-KEY                   
LRM029             MOVE ALL ZERO         TO GETMSD-WI-CODE                      
LRM029             MOVE W-NSCC-KEY-CLIENT-NBR(2:3) TO W-CLIENT-X                
LRM029             MOVE W-CLIENT-NUM     TO GETMSD-CLIENT-PL2                   
LRM029             PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                 
LRM029             IF GETMSD-RETURN-VALID                                       
LRM029                IF  MS-DESC2 < ' '                                        
LRM029                    MOVE ' '       TO MS-DESC2                            
LRM029                END-IF                                                    
LRM029                IF  MS-DESC3 < ' '                                        
LRM029                    MOVE ' '       TO MS-DESC3                            
LRM029                END-IF                                                    
LRM029                MOVE MS-SYMBOL           TO FMT-SEC-SYMBOL                
LRM029                MOVE MS-ADP-NO           TO FMT-ADP-SEC-NO                
LRM029                MOVE 'XX'                TO FMT-CUSIP-NO (1:2)            
LRM029                MOVE MS-ADP-NO           TO FMT-CUSIP-NO (3:7)            
LRM029                MOVE MS-DESC1            TO FMT-DESC1                     
LRM029                MOVE MS-DESC2            TO FMT-DESC2                     
LRM029                MOVE MS-DESC3            TO FMT-DESC3                     
LRM029                DISPLAY '  2GETMSD RETURN:'                               
LRM029                                           ' ' FMT-SEC-SYMBOL             
LRM029                                           ' ' FMT-ADP-SEC-NO             
LRM029                                           ' ' FMT-CUSIP-NO               
LRM029                                           ' ' FMT-DESC1                  
LRM029                                           ' ' FMT-DESC2                  
LRM029                GO TO 6950-FORMAT-DESC                                    
LRM029             END-IF                                                       
LRM029     END-IF.                                                              
LRM029                                                                          
LRM029     INITIALIZE GETADP-COMMAREA                                           
LRM029     MOVE  ZEROS                       TO GETADP-CLIENT-NBR               
LRM029     MOVE  W-NSCC-ATO-OPT-SYM          TO GETADP-OPTION-UNDSEC            
LRM029     MOVE  W-NSCC-ATO-OPT-EXP-MM-NEW   TO GETADP-OPTION-MONTH             
LRM029     MOVE  W-NSCC-ATO-OPT-EXP-DD-NEW   TO GETADP-OPTION-DAY               
LRM029     MOVE  W-NSCC-ATO-OPT-EXP-YY-NEW   TO GETADP-OPTION-YR                
LRM032     DISPLAY 'B/S= ' W-NSCC-ATO-OPT-BS-IND                                
LRM032            ' OPEN/CLOSE ' FMT-OPEN-CLOSE                                 
LRM032     IF (W-NSCC-ATO-OPT-BS-IND = 'B' AND FMT-OPEN)                        
LRM032     OR (W-NSCC-ATO-OPT-BS-IND = 'S' AND FMT-CLOSE)                       
LRM029        MOVE 'L'           TO GETADP-OPTION-LS                            
LRM029     ELSE                                                                 
LRM032*****IF (W-NSCC-ATO-OPT-BS-IND = 'S' AND FMT-OPEN)                        
LRM032*****OR (W-NSCC-ATO-OPT-BS-IND = 'B' AND FMT-CLOSE)                       
LRM029        MOVE 'S'           TO GETADP-OPTION-LS                            
LRM029     END-IF.                                                              
LRM029     MOVE  W-NSCC-ATO-OPT-PC-IND       TO GETADP-OPTION-PC                
LRM029     IF  W-NSCC-ATO-OPT-STKPRC-INT-NEW NUMERIC                            
LRM029     AND W-NSCC-ATO-OPT-STKPRC-FRC-NEW NUMERIC                            
LRM029        MOVE W-NSCC-ATO-OPT-STKPRC-INT-NEW                                
LRM029                                      TO GETADP-OPTION-STRIKE(1:5)        
LRM029        MOVE W-NSCC-ATO-OPT-STKPRC-FRC-NEW                                
LRM029                                      TO GETADP-OPTION-STRIKE(6:3)        
LRM029     ELSE                                                                 
LRM029        MOVE ZERO TO GETADP-OPTION-STRIKE                                 
LRM029     END-IF.                                                              
LRM029                                                                          
TEST       DISPLAY 'CALLING GETADPNO WITH ' GETADP-COMMAREA.                    
LRM029     CALL GETADPNO USING GETADP-COMMAREA.                                 
LRM029                                                                          
LRM029     EVALUATE GETADP-RET-CODE                                             
LRM029        WHEN SPACES                                                       
LRM029             DISPLAY '   FND ' GETADP-ADP-NBR                             
LRM029             MOVE 'XX'           TO FMT-CUSIP-NO (1:2)                    
LRM029             MOVE GETADP-ADP-NBR TO GETMSD-SEARCH-KEY                     
LRM029                                    FMT-CUSIP-NO (3:7)                    
LRM029                                    FMT-ADP-SEC-NO                        
LRM029             MOVE '0'            TO GETMSD-WI-CODE                        
LRM029             MOVE W-NSCC-KEY-CLIENT-NBR(2:3) TO W-CLIENT-X                
LRM029             MOVE W-CLIENT-NUM           TO GETMSD-CLIENT-PL2             
LRM029             PERFORM 6970-CALL-GETMSDC     THRU 6970-EXIT                 
LRM029             IF GETMSD-RETURN-VALID                                       
LRM029                MOVE SPACES TO MS-CUSIP-NO                                
LRM029                               MSD-ISIN                                   
LRM029                MOVE MS-DESC1            TO FMT-DESC1                     
LRM029                MOVE MS-DESC2            TO FMT-DESC2                     
LRM029                MOVE MS-DESC3            TO FMT-DESC3                     
LRM029                DISPLAY '  3GETMSD RETURN:'                               
LRM029                                           ' ' FMT-SEC-SYMBOL             
LRM029                                           ' ' FMT-ADP-SEC-NO             
LRM029                                           ' ' FMT-CUSIP-NO               
LRM029                                           ' ' FMT-DESC1                  
LRM029                                           ' ' FMT-DESC2                  
LRM029             END-IF                                                       
LRM029        WHEN 'N'                                                          
LRM029             DISPLAY '   GETADP NOT FOUND'                                
LRM029        WHEN 'D'                                                          
LRM029             DISPLAY '**** PROGRAM CAT515'                                
LRM029             DISPLAY '**** CALL GETADPNO PROBLEM  ****'                   
LRM029             DISPLAY '**** IN  6950-GETADPNO                 '            
LRM029             MOVE GETADP-SQLCA TO SQLCA                                   
LRM029             MOVE SQLCODE      TO W-DB2-SQLCODE                           
LRM029             DISPLAY 'GETADP SQLCODE ' W-DB2-SQLCODE                      
LRM029             DISPLAY 'GETADP-SQLCA ' GETADP-SQLCA                         
LRM029             MOVE 6950 TO ABEND-CD                                        
LRM029             CALL ABEND USING ABEND-CD                                    
LRM029     END-EVALUATE.                                                        
LRM029                                                                          
LRM029 6950-FORMAT-DESC.                                                        
LRM029     IF  FMT-ADP-SEC-NO > ' '                                             
LRM029          MOVE 'N'         TO W-MSD-NOTFND-SW                             
LRM029          MOVE FMT-ADP-SEC-NO TO SECURITY-ADP-NBR  OF DCLVASSET           
LRM029          MOVE FMT-CUSIP-NO   TO ISIN-SEC-ISSUE-CD OF DCLVASSET           
LRM029          MOVE 'N'           TO ISIN-SEC-EXCPT-IND OF DCLVASSET           
LRM029          MOVE FMT-DESC1 TO  OPTN-CMNT-TXT OF DCLVOPTN                    
LRM029          MOVE ' '       TO ASSET-DESC-TXT OF DCLVASSET                   
LRM029          MOVE FMT-DESC1 TO ASSET-DESC-TXT OF DCLVASSET (1:30)            
LRM029          MOVE FMT-DESC2 TO ASSET-DESC-TXT OF DCLVASSET (31:30)           
LRM029          MOVE FMT-DESC3 TO ASSET-DESC-TXT OF DCLVASSET (61:30)           
LRM029          MOVE FMT-ADP-SEC-NO TO WK-POS-DESC5-SEC                         
LRM029          MOVE WK-POS-DESC5                                               
LRM029                        TO ASSET-DESC-TXT OF DCLVASSET (121:20)           
LRM029     ELSE                                                                 
LRM029          MOVE 'Y'         TO W-MSD-NOTFND-SW                             
LRM029          MOVE ' '         TO SECURITY-ADP-NBR   OF DCLVASSET             
LRM029          MOVE 'Y'         TO ISIN-SEC-EXCPT-IND OF DCLVASSET             
LRM029          DISPLAY 'INP=' W-INFILE-CNT                                     
LRM029                     ' ' W-NSCC-KEY-CLIENT-NBR                            
LRM029                     ' ' W-NSCC-ACAT-CTL-NBR                              
LRM029                     ' ' W-ASSET-SEQ-NBR                                  
LRM029                     ' ' W-NSCC-AT-TRAN-TYPE                              
LRM029                     ' ' W-NSCC-AT-TFR-TYPE                               
LRM029                 ' DST=' W-DSTBN-SIDE-CD                                  
LRM029                 ' OPT NOT FND:'                                          
LRM029                 ' SYM=' FMT-OPT-SYMBOL                                   
LRM029                  ' BS=' FMT-BUY-SELL-IND                                 
LRM029                  ' PC=' FMT-OPT-PUT-CALL                                 
LRM029                  ' OC=' FMT-OPEN-CLOSE                                   
LRM029                  ' ED=' FMT-OPT-EXP-DATE                                 
LRM029                  ' PR=' FMT-OPT-PRICE                                    
LRM029                                                                          
LRM029         IF W-NSCC-ATO-OPT-BS-IND      = 'B'                              
LRM029            MOVE 'BUY'          TO W-OPT-BUY-SELL                         
LRM029         ELSE                                                             
LRM029            MOVE 'SELL'         TO W-OPT-BUY-SELL                         
LRM029         END-IF                                                           
LRM029         IF W-NSCC-ATO-OPT-OC-IND      = 'O'                              
LRM029            MOVE 'OPEN'         TO W-OPT-OPEN-CLOSE                       
LRM029         ELSE                                                             
LRM029            MOVE 'CLOS'         TO W-OPT-OPEN-CLOSE                       
LRM029         END-IF                                                           
LRM029         IF W-NSCC-ATO-OPT-PC-IND     = 'C'                               
LRM029            MOVE 'CALL'         TO W-OPT-CALL-PUT                         
LRM029         ELSE                                                             
LRM029            MOVE 'PUT '         TO W-OPT-CALL-PUT                         
LRM029         END-IF                                                           
LRM029         MOVE W-NSCC-ATO-OPT-SYM TO W-OPT-UNDLY-SYMBOL                    
LRM029         MOVE W-NSCC-ATO-OPT-EXP-MM-NEW   TO W-OPT-EXPTN-MM-NEW           
LRM029         MOVE '/'                         TO W-OPT-EXPTN-S1-NEW           
LRM029                                             W-OPT-EXPTN-S2-NEW           
LRM029         MOVE W-NSCC-ATO-OPT-EXP-DD-NEW   TO W-OPT-EXPTN-DD-NEW           
LRM029         MOVE W-NSCC-ATO-OPT-EXP-YY-NEW   TO W-OPT-EXPTN-YY-NEW           
LRM029         MOVE W-NSCC-ATO-OPT-STKPRC-INT   TO W-STPRC-INTEGER-AMT          
LRM029         MOVE W-STPRC-INTEGER-AMT   TO W-OPT-STRIKE-PRIC-NEW              
LRM029         IF W-NSCC-ATO-OPT-STKPRC-FRC-NEW = '000'                         
LRM029            MOVE SPACES             TO W-OPT-STRIKE-FRAC-NEW              
LRM029         ELSE                                                             
LRM029            MOVE W-NSCC-ATO-OPT-STKPRC-FRC-NEW                            
LRM029                                    TO W-OPT-STRIKE-FRAC-NEW              
LRM029         END-IF                                                           
LRM029         DISPLAY 'INP=' W-INFILE-CNT                                      
LRM029                  ' W-OPT-DESC = ' W-OPT-DESC                             
LRM029     END-IF.                                                              
LRM029                                                                          
LRM029 6950-EXIT. EXIT.                                                         
      /                                                                         
DJ0023 6970-CALL-GETMSDC           SECTION.                                     
DJ0023                                                                          
DJ0023     MOVE 'N'  TO W-PRNGFL-SW                                             
DJ0023     CALL GETMSDC USING MASTER-SECURITY-RECORD                            
DJ0023     IF  GETMSD-RETURN-VALID                                              
DJ0023         IF  W-NSCC-DIST-PARTICIPANT   = W-NSCC-AT-RCV-NBR                
DJ0023             PERFORM 6975-CHECK-PRNGFL     THRU 6975-EXIT                 
DJ0023         END-IF                                                           
DJ0023     END-IF.                                                              
DJ0023                                                                          
DJ0023 6970-EXIT. EXIT.                                                         
      /                                                                         
DJ0023 6975-CHECK-PRNGFL           SECTION.                                     
DJ0023***IF PRIVATE RANGE FOUND THAT BELONGS TO SOMEONE ELSE,                   
DJ0023***SET GETMSD-RETURN-REC-NOT-FOUND TO TRUE                                
DJ0023     MOVE '6975-CHECK-PRNGFL             ' TO W-ROUTINE-1.                
DJ0023                                                                          
DJ0023     MOVE SPACES                      TO PRNGREC                          
DJ0023     MOVE MS-ADP-NO                   TO PRNGKEY                          
DJ0023                                                                          
DJ0023     START PRNGFL KEY NOT < PRNGKEY                                       
DJ0023                                                                          
DJ0023     IF PRNGFL-OKAY                                                       
DJ0023        CONTINUE                                                          
DJ0023     ELSE                                                                 
DJ0023       IF PRNGFL-END-OF-FILE                                              
DJ0023       OR PRNGFL-NOT-FOUND                                                
DJ0023          GO TO 6975-EXIT                                                 
DJ0023       ELSE                                                               
DJ0023          DISPLAY ' ** CAT515 - PRNGFL FILE, START BROWSE ERROR'          
DJ0023                  ' FILE-STATUS = ' PRNGFL-STAT                           
DJ0023          DISPLAY 'W-PRNGFL-KEY = ' MS-ADP-NO                             
DJ0023          MOVE +3105    TO ABEND-CODE                                     
DJ0023          CALL ABEND USING ABEND-CODE                                     
DJ0023       END-IF                                                             
DJ0023     END-IF.                                                              
DJ0023                                                                          
DJ0023 6975-READ-PRNGFL-NEXT.                                                   
DJ0023                                                                          
DJ0023     READ PRNGFL NEXT RECORD.                                             
DJ0023                                                                          
DJ0023     IF PRNGFL-OKAY                                                       
DJ0023        CONTINUE                                                          
DJ0023     ELSE                                                                 
DJ0023       IF PRNGFL-END-OF-FILE                                              
DJ0023          GO TO 6975-EXIT                                                 
DJ0023       ELSE                                                               
DJ0023          DISPLAY ' ** CAT515 - PRNGFL FILE, READ NEXT ERROR'             
DJ0023                  ' FILE-STATUS = ' PRNGFL-STAT                           
DJ0023          DISPLAY 'W-PRNGFL-KEY = ' PRNGKEY                               
DJ0023          MOVE +3106    TO ABEND-CODE                                     
DJ0023          CALL ABEND USING ABEND-CODE                                     
DJ0023       END-IF                                                             
DJ0023     END-IF.                                                              
DJ0023                                                                          
DJ0023     EVALUATE TRUE                                                        
DJ0023         WHEN ((MS-ADP-NO < PRSECLO)                                      
DJ0023                    OR                                                    
DJ0023              (PRCLNT = '000' OR '096'))                                  
DJ0023              MOVE 'N' TO W-PRNGFL-SW                                     
DJ0023         WHEN OTHER                                                       
DJ0023           IF   PRCLNT   = W-NSCC-KEY-CLIENT-NBR(2:3)                     
DJ0023             OR PRACLNT1 = W-NSCC-KEY-CLIENT-NBR(2:3)                     
DJ0023             OR PRACLNT2 = W-NSCC-KEY-CLIENT-NBR(2:3)                     
DJ0023             OR PRACLNT3 = W-NSCC-KEY-CLIENT-NBR(2:3)                     
DJ0023             OR PRACLNT4 = W-NSCC-KEY-CLIENT-NBR(2:3)                     
DJ0023             OR PRACLNT5 = W-NSCC-KEY-CLIENT-NBR(2:3)                     
DJ0023             OR PRACLNT6 = W-NSCC-KEY-CLIENT-NBR(2:3)                     
DJ0023             OR PRACLNT7 = W-NSCC-KEY-CLIENT-NBR(2:3)                     
DJ0023               CONTINUE                                                   
DJ0023           ELSE                                                           
DJ0023             MOVE 'Y'  TO W-PRNGFL-SW                                     
DJ0023             SET GETMSD-RETURN-REC-NOT-FOUND TO TRUE                      
DJ0023             DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0023                    ' ' W-NSCC-KEY-CLIENT-NBR                             
DJ0023                    ' ' W-NSCC-ACAT-CTL-NBR                               
DJ0023                    ' ' W-ASSET-SEQ-NBR                                   
DJ0023                      ' PRNGFL FOUND: SEC:' MS-ADP-NO                     
DJ0023                      ' CLT:' PRCLNT ' DESC:' MS-DESC1                    
DJ0023             DISPLAY '    GETMSD-KEY:' GETMSD-SEARCH-KEY                  
DJ0023                      ' SEC:' MS-ADP-NO                                   
DJ0023                     ' PRIVATE RANGE BELONGS TO CLT '  PRCLNT             
DJ0023                     '. FLAG AS MSD NOT FOUND'                            
DJ0023           END-IF                                                         
DJ0023     END-EVALUATE.                                                        
DJ0023                                                                          
DJ0023 6975-EXIT. EXIT.                                                         
      /                                                                         
DJ0007 7100-MF-AUTO-DELETE-EDIT SECTION.                                        
DJ0007***IF NO FUND AGREEMENT,                                                  
DJ0007***FOR 'FUL': CREATE DELETE ASSET AND HOLD FOR NEXT DAY                   
DJ0007***FOR 'RCR': CREATE REJECT TRANSFER TO GO OUT NEXT CYCLE                 
DJ0007     MOVE ' ' TO W-MF-AUTO-DELETE-IND.                                    
DJ0007     PERFORM 7120-MF-AUTO-DELETE-CHK THRU 7120-EXIT                       
DJ0007     IF  W-MF-AUTO-DELETE-IND = 'D'                                       
DJ0007         IF W-NSCC-AT-TFR-TYPE = 'FUL'                                    
DJ0007            PERFORM 7130-MF-AUTO-DELETE-SET THRU 7130-EXIT                
DJ0007         ELSE                                                             
DJ0007            PERFORM 7135-MF-AUTO-REJECT-SET THRU 7135-EXIT                
DJ0007         END-IF                                                           
DJ0007     END-IF.                                                              
DJ0007 7100-EXIT. EXIT.                                                         
                                                                                
DJ0007 7120-MF-AUTO-DELETE-CHK SECTION.                                         
DJ0007     IF  BH-MF-FUND-AGREEMENT-OPTION = '1'                                
DJ0007         PERFORM 7140-BNWREGOP THRU 7140-EXIT                             
DJ0007         IF W-BNWREGOP-FND-SW = 'Y'                                       
LRM034            IF TBL-OFFSHORE-IND = 'Y'                                     
LRM034            AND (GEO-CD OF DCLVTRNFR >= '901' AND <= '979')               
LRM034               MOVE 'D' TO W-MF-AUTO-DELETE-IND                           
LRM034               DISPLAY 'OFFSHORE IND EDIT1 ' TBL-OFFSHORE-IND             
LRM034                   ' GEO ' GEO-CD OF DCLVTRNFR                            
LRM034            ELSE                                                          
DJ0007            IF TBL-FUND-AGREEMENT-IND OF BNWREGOP-RECORD = 'Y'            
DJ0007               MOVE 'A' TO W-MF-AUTO-DELETE-IND                           
DJ0007            ELSE                                                          
DJ0007               MOVE 'D' TO W-MF-AUTO-DELETE-IND                           
DJ0007            END-IF                                                        
LRM034            END-IF                                                        
DJ0007         ELSE                                                             
DJ0007               MOVE 'D' TO W-MF-AUTO-DELETE-IND                           
DJ0007         END-IF                                                           
DJ0007     ELSE                                                                 
DJ0007      IF BH-MF3-TRADE-SWITCH-OPTION  = '1'                                
DJ0007         PERFORM 7140-BNWREGOP THRU 7140-EXIT                             
DJ0007         IF W-BNWREGOP-FND-SW = 'Y'                                       
LRM034            IF TBL-OFFSHORE-IND = 'Y'                                     
LRM034            AND (GEO-CD OF DCLVTRNFR >= '901' AND <= '979')               
LRM034               MOVE 'D' TO W-MF-AUTO-DELETE-IND                           
LRM034               DISPLAY 'OFFSHORE IND EDIT2 ' TBL-OFFSHORE-IND             
LRM034                   ' GEO ' GEO-CD OF DCLVTRNFR                            
LRM034            ELSE                                                          
DJ0007            IF TRADE-SWITCH OF BNWREGOP-RECORD = 'Y'                      
DJ0007               MOVE 'A' TO W-MF-AUTO-DELETE-IND                           
DJ0007            ELSE                                                          
DJ0007               PERFORM 7150-MFOPBR THRU 7150-EXIT                         
DJ0007               IF W-MFOPBR-FND-SW = 'Y'                                   
DJ0007                  IF MFOPBR-CNI-IND            = 'Y'                      
DJ0007                     MOVE 'A' TO W-MF-AUTO-DELETE-IND                     
DJ0007                  ELSE                                                    
DJ0007                     MOVE 'D' TO W-MF-AUTO-DELETE-IND                     
DJ0007                  END-IF                                                  
DJ0007               ELSE                                                       
DJ0007                     MOVE 'D' TO W-MF-AUTO-DELETE-IND                     
DJ0007               END-IF                                                     
DJ0007            END-IF                                                        
LRM034            END-IF                                                        
DJ0007         ELSE                                                             
DJ0007               MOVE 'D' TO W-MF-AUTO-DELETE-IND                           
DJ0007         END-IF                                                           
DJ0007      ELSE                                                                
DJ0007         MOVE 'A' TO W-MF-AUTO-DELETE-IND                                 
DJ0007      END-IF                                                              
DJ0007     END-IF.                                                              
DJ0007 7120-EXIT. EXIT.                                                         
                                                                                
DJ0007 7130-MF-AUTO-DELETE-SET SECTION.                                         
DJ0007*CREATE A DELETE RECORD(ROW) ON THE INIT ASSET TABLE                      
DJ0007*MOVE 'D' TO ACTION CODE                                                  
DJ0007*MOVE 'H' TO PEND   CODE                                                  
DJ0007     MOVE '7130-MF-AUTO-DELETE-SET       ' TO W-ROUTINE-1.                
DJ0007     DISPLAY 'INP=' W-INFILE-CNT                                          
DJ0007                ' ' W-NSCC-KEY-CLIENT-NBR                                 
DJ0007                ' ' W-NSCC-ACAT-CTL-NBR                                   
DJ0007                ' ' W-ASSET-SEQ-NBR                                       
DJ0007                ' ' W-NSCC-AT-TRAN-TYPE                                   
DJ0007                ' ' W-NSCC-AT-TFR-TYPE                                    
DJ0007            ' DST=' W-DSTBN-SIDE-CD                                       
DJ0007            ' SEC=' W-NSCC-AT-SEC-ID                                      
DJ0007            ' MF-AUTO-DEL'                                                
DJ0007            ' AGR=' TBL-FUND-AGREEMENT-IND OF BNWREGOP-RECORD             
DJ0007            ' TRD=' TRADE-SWITCH OF BNWREGOP-RECORD                       
DJ0007            ' CNI=' MFOPBR-CNI-IND                                        
DJ0007     PERFORM 7160-FORMAT-ACTIAST THRU 7160-EXIT.                          
DJ0007     ADD 1 TO W-MF-AUTO-DELETE-CNT.                                       
DJ0007 7130-EXIT. EXIT.                                                         
                                                                                
DJ0007 7135-MF-AUTO-REJECT-SET SECTION.                                         
DJ0007**THIS APPLIES ONLY TO RCR'S. REJECT THE RCR IF NO FUND AGREEMENT         
DJ0007     DISPLAY 'INP=' W-INFILE-CNT                                          
DJ0007                ' ' W-NSCC-KEY-CLIENT-NBR                                 
DJ0007                ' ' W-NSCC-ACAT-CTL-NBR                                   
DJ0007                ' ' W-ASSET-SEQ-NBR                                       
DJ0007                ' ' W-NSCC-AT-TRAN-TYPE                                   
DJ0007                ' ' W-NSCC-AT-TFR-TYPE                                    
DJ0007            ' DST=' W-DSTBN-SIDE-CD                                       
DJ0007            ' SEC=' W-NSCC-AT-SEC-ID                                      
DJ0007            ' MF-AUTO-DEL'                                                
DJ0007            ' AGR=' TBL-FUND-AGREEMENT-IND OF BNWREGOP-RECORD             
DJ0007            ' TRD=' TRADE-SWITCH OF BNWREGOP-RECORD                       
DJ0007            ' CNI=' MFOPBR-CNI-IND                                        
DJ0007     IF CMNT-TXT OF DCLVTRNFR(1:30) = W-MF-AUTO-REJECT-LIT                
DJ0007        MOVE CMNT-TXT OF DCLVTRNFR TO W-MF-AUTO-REJECT-COMMENT            
DJ0007        IF W-MF-AUTO-REJECT-CUSIP-2 = ' '                                 
DJ0007           MOVE MS-CUSIP-NO TO W-MF-AUTO-REJECT-CUSIP-2                   
DJ0007        ELSE                                                              
DJ0007        IF W-MF-AUTO-REJECT-CUSIP-3 = ' '                                 
DJ0007           MOVE MS-CUSIP-NO TO W-MF-AUTO-REJECT-CUSIP-3                   
DJ0007        ELSE                                                              
DJ0007        IF W-MF-AUTO-REJECT-CUSIP-4 = ' '                                 
DJ0007           MOVE MS-CUSIP-NO TO W-MF-AUTO-REJECT-CUSIP-4                   
DJ0007        ELSE                                                              
DJ0007        IF W-MF-AUTO-REJECT-CUSIP-5 = ' '                                 
DJ0007           MOVE MS-CUSIP-NO TO W-MF-AUTO-REJECT-CUSIP-5                   
DJ0007        ELSE                                                              
DJ0007        IF W-MF-AUTO-REJECT-CUSIP-6 = ' '                                 
DJ0007           MOVE MS-CUSIP-NO TO W-MF-AUTO-REJECT-CUSIP-6                   
DJ0007        ELSE                                                              
DJ0007        IF W-MF-AUTO-REJECT-CUSIP-7 = ' '                                 
DJ0007           MOVE MS-CUSIP-NO TO W-MF-AUTO-REJECT-CUSIP-7                   
DJ0007        ELSE                                                              
DJ0007        IF W-MF-AUTO-REJECT-CUSIP-8 = ' '                                 
DJ0007           MOVE MS-CUSIP-NO TO W-MF-AUTO-REJECT-CUSIP-8                   
DJ0007        ELSE                                                              
DJ0007        IF W-MF-AUTO-REJECT-CUSIP-9 = ' '                                 
DJ0007           MOVE MS-CUSIP-NO TO W-MF-AUTO-REJECT-CUSIP-9                   
DJ0007        END-IF END-IF END-IF END-IF END-IF END-IF END-IF END-IF           
DJ0007        MOVE W-MF-AUTO-REJECT-COMMENT TO CMNT-TXT OF DCLVTRNFR            
DJ0007     ELSE                                                                 
DJ0007        MOVE MS-CUSIP-NO TO W-MF-AUTO-REJECT-CUSIP-1                      
DJ0007        MOVE ' '         TO W-MF-AUTO-REJECT-CUSIP-2                      
DJ0007                            W-MF-AUTO-REJECT-CUSIP-3                      
DJ0007                            W-MF-AUTO-REJECT-CUSIP-4                      
DJ0007                            W-MF-AUTO-REJECT-CUSIP-5                      
DJ0007                            W-MF-AUTO-REJECT-CUSIP-6                      
DJ0007                            W-MF-AUTO-REJECT-CUSIP-7                      
DJ0007                            W-MF-AUTO-REJECT-CUSIP-8                      
DJ0007                            W-MF-AUTO-REJECT-CUSIP-9                      
DJ0007        MOVE W-MF-AUTO-REJECT-COMMENT TO CMNT-TXT OF DCLVTRNFR            
DJ0007     END-IF.                                                              
DJ0007     MOVE 'Y' TO W-REJ-MF-AUTO-DELETE.                                    
DJ0007     MOVE 'Y' TO W-REJECT-AUTO-SW.                                        
DJ0007     ADD 1 TO W-MF-AUTO-REJECT-CNT.                                       
DJ0007 7135-EXIT. EXIT.                                                         
      /                                                                         
DJ0007 7140-BNWREGOP        SECTION.                                            
DJ0007     MOVE '7150-BNWREGOP                 ' TO W-ROUTINE-1.                
DJ0007                                                                          
DJ0007     MOVE ' '                    TO W-BNWREGOP-FND-SW                     
DJ0007     MOVE ' '                    TO BNWREGOP-RECORD                       
DJ0007     MOVE W-NSCC-KEY-CLIENT-NBR(2:3)                                      
DJ0007                                 TO CLIENT-NO OF BNWREGOP-RECORD          
DJ0007     MOVE MS-CUSIP-NO            TO CUSIP-9   OF BNWREGOP-RECORD          
DJ0007                                                                          
DJ0007     READ BNWREGOP INVALID KEY                                            
DJ0021          DISPLAY 'INP=' W-INFILE-CNT                                     
DJ0021                     ' ' W-NSCC-KEY-CLIENT-NBR                            
DJ0021                     ' ' W-NSCC-ACAT-CTL-NBR                              
DJ0021                     ' ' W-ASSET-SEQ-NBR                                  
DJ0021                 ' BNWREGOP NOT FOUND FOR'                                
DJ0007             ' '  W-NSCC-KEY-CLIENT-NBR (2:3)                             
DJ0007             ' '  MS-CUSIP-NO                                             
DJ0007          GO TO 7140-EXIT.                                                
DJ0007                                                                          
DJ0007     ADD 1    TO W-BNWREGOP-FND-CNT                                       
DJ0007     MOVE 'Y' TO W-BNWREGOP-FND-SW.                                       
                                                                                
DJ0007 7140-EXIT. EXIT.                                                         
      /                                                                         
DJ0007 7150-MFOPBR          SECTION.                                            
DJ0007     MOVE '7150-MFOPBR                 ' TO W-ROUTINE-1.                  
DJ0007                                                                          
DJ0007     MOVE ' '                        TO W-MFOPBR-FND-SW.                  
DJ0007     MOVE ' '                        TO MFOPBR-RECORD.                    
DJ0007     MOVE W-NSCC-KEY-CLIENT-NBR(2:3) TO MFOPBR-CLIENT.                    
DJ0007     MOVE MS-CUSIP-NO                TO MFOPBR-CUSIP.                     
DJ0007                                                                          
DJ0007     START MFOPBR KEY NOT < MFOPBR-KEY                                    
DJ0007                                                                          
DJ0007     IF MFOPBR-OKAY                                                       
DJ0007        CONTINUE                                                          
DJ0007     ELSE                                                                 
DJ0007       IF MFOPBR-END-OF-FILE                                              
DJ0007       OR MFOPBR-NOT-FOUND                                                
DJ0007         DISPLAY 'MFOPBR END-FILE  FOR'                                   
DJ0007             ' '  W-NSCC-KEY-CLIENT-NBR (2:3)                             
DJ0007             ' '  MS-CUSIP-NO                                             
DJ0007             ' '  W-SAVE-ACCT-RCV-NBR                                     
DJ0007         MOVE ' ' TO MFOPBR-CNI-IND                                       
DJ0007          GO TO 7150-EXIT                                                 
DJ0007       ELSE                                                               
DJ0007          DISPLAY ' ** CAT515 - MFOPBR FILE, START BROWSE ERROR'          
DJ0007                  ' FILE-STATUS = ' MFOPBR-STAT                           
DJ0007          DISPLAY 'MFOPBR-KEY = ' MFOPBR-KEY                              
DJ0007          MOVE +3999    TO ABEND-CODE                                     
DJ0007          CALL ABEND USING ABEND-CODE                                     
DJ0007       END-IF                                                             
DJ0007     END-IF.                                                              
DJ0007                                                                          
DJ0007 7150-READ-NEXT.                                                          
DJ0007     READ MFOPBR NEXT RECORD.                                             
DJ0007                                                                          
DJ0007     IF MFOPBR-OKAY                                                       
DJ0007        CONTINUE                                                          
DJ0007     ELSE                                                                 
DJ0007       IF MFOPBR-END-OF-FILE                                              
DJ0007         DISPLAY 'MFOPBR END-FILE  FOR'                                   
DJ0007             ' '  W-NSCC-KEY-CLIENT-NBR (2:3)                             
DJ0007             ' '  MS-CUSIP-NO                                             
DJ0007             ' '  W-SAVE-ACCT-RCV-NBR                                     
DJ0007         MOVE ' ' TO MFOPBR-CNI-IND                                       
DJ0007          GO TO 7150-EXIT                                                 
DJ0007       ELSE                                                               
DJ0007          DISPLAY ' ** CAT515 - MFOPBR FILE, READ NEXT ERROR'             
DJ0007                  ' FILE-STATUS = ' MFOPBR-STAT                           
DJ0007          DISPLAY 'MFOPBR-KEY = ' MFOPBR-KEY                              
DJ0007          MOVE +3999    TO ABEND-CODE                                     
DJ0007          CALL ABEND USING ABEND-CODE                                     
DJ0007       END-IF                                                             
DJ0007     END-IF.                                                              
DJ0007                                                                          
DJ0007     IF  W-NSCC-KEY-CLIENT-NBR(2:3) = MFOPBR-CLIENT                       
DJ0007     AND MS-CUSIP-NO                = MFOPBR-CUSIP                        
DJ0007     AND W-SAVE-ACCT-RCV-NBR        > MFOPBR-TO-BR-ACCT                   
DJ0007         GO TO 7150-READ-NEXT                                             
DJ0007     END-IF.                                                              
DJ0007                                                                          
DJ0007     IF  W-NSCC-KEY-CLIENT-NBR(2:3) = MFOPBR-CLIENT                       
DJ0007     AND MS-CUSIP-NO                = MFOPBR-CUSIP                        
DJ0007     AND W-SAVE-ACCT-RCV-NBR       >= MFOPBR-FROM-BR-ACCT                 
DJ0007     AND W-SAVE-ACCT-RCV-NBR       <= MFOPBR-TO-BR-ACCT                   
DJ0007         ADD 1    TO W-MFOPBR-FND-CNT                                     
DJ0007         MOVE 'Y' TO W-MFOPBR-FND-SW                                      
DJ0007     ELSE                                                                 
DJ0007         DISPLAY 'MFOPBR NOT FOUND FOR'                                   
DJ0007             ' '  W-NSCC-KEY-CLIENT-NBR(2:3)                              
DJ0007             ' '  MS-CUSIP-NO                                             
DJ0007             ' '  W-SAVE-ACCT-RCV-NBR                                     
DJ0007         MOVE ' ' TO MFOPBR-CNI-IND                                       
DJ0007     END-IF.                                                              
DJ0007                                                                          
DJ0007 7150-EXIT. EXIT.                                                         
      /                                                                         
DJ0007 7160-FORMAT-ACTIAST SECTION.                                             
DJ0007                                                                          
DJ0007     MOVE ' '               TO                      DCLACTIAST            
DJ0007     MOVE CLIENT-NBR        OF DCLVASSET                                  
DJ0007                            TO CLIENT-NBR        OF DCLACTIAST            
DJ0007     MOVE W-SAVE-ACCT-DLVR-NBR                                            
DJ0007                            TO ACCT-DLVR-NBR     OF DCLACTIAST            
DJ0007     MOVE W-SAVE-ACCT-RCV-NBR                                             
DJ0007                            TO ACCT-RCV-NBR      OF DCLACTIAST            
DJ0007     MOVE 01                TO PHSCL-SEQ-NBR     OF DCLACTIAST            
DJ0007     MOVE 01                TO LGCL-SEQ-NBR      OF DCLACTIAST            
DJ0007     MOVE 'D'               TO TRANS-TYPE-CD     OF DCLACTIAST            
DJ0007     MOVE ACAT-CONTROL-NBR  OF DCLVASSET                                  
DJ0007                            TO ACAT-CONTROL-NBR  OF DCLACTIAST            
DJ0007     MOVE TRNFR-TYPE-CD     OF DCLVASSET                                  
DJ0007                            TO TRNFR-TYPE-CD     OF DCLACTIAST            
DJ0009     MOVE W-SAVE-RCV-NBR                                                  
DJ0007                            TO SBMTG-PRTCP-NBR   OF DCLACTIAST            
DJ0007     MOVE W-SAVE-DLVR-NBR                                                 
DJ0007                            TO DLVR-NBR          OF DCLACTIAST            
DJ0007     MOVE W-SAVE-RCV-NBR                                                  
DJ0007                            TO RCV-NBR           OF DCLACTIAST            
DJ0007     MOVE TRANS-RFRN-ID-CD  OF DCLVASSET                                  
DJ0007                            TO TRANS-RFRN-ID-CD  OF DCLACTIAST            
DJ0007     MOVE ASSET-SEQ-NBR     OF DCLVASSET                                  
DJ0007                            TO ASSET-SEQ-NBR     OF DCLACTIAST            
DJ0007     MOVE OPTN-CTGY-CD      OF DCLVASSET                                  
DJ0007                            TO OPTN-CTGY-CD      OF DCLACTIAST            
DJ0007     MOVE STTLM-LCTN-CD     OF DCLVASSET                                  
DJ0007                            TO STTLM-LCTN-CD     OF DCLACTIAST            
DJ0007     MOVE STTLM-RSN-CD      OF DCLVASSET                                  
DJ0007                            TO STTLM-RSN-CD      OF DCLACTIAST            
DJ0007     MOVE ASSET-RQST-QTY-CD OF DCLVASSET                                  
DJ0007                            TO ASSET-RQST-QTY-CD OF DCLACTIAST            
DJ0007     MOVE AST-RQST-TRANS-CD OF DCLVASSET                                  
DJ0007                            TO AST-RQST-TRANS-CD OF DCLACTIAST            
DJ0007     MOVE ASSET-QTY         OF DCLVASSET                                  
DJ0007                            TO ASSET-QTY         OF DCLACTIAST            
DJ0007     MOVE ASSET-PCT         OF DCLVASSET                                  
DJ0007                            TO ASSET-PCT         OF DCLACTIAST            
DJ0007     MOVE PSTN-CD           OF DCLVASSET                                  
DJ0007                            TO PSTN-CD           OF DCLACTIAST            
DJ0007     MOVE ISO-CRNCY-CD      OF DCLVASSET                                  
DJ0007                            TO ISO-CRNCY-CD      OF DCLACTIAST            
DJ0007     MOVE ASSET-AMT         OF DCLVASSET                                  
DJ0007                            TO ASSET-AMT         OF DCLACTIAST            
DJ0007     MOVE BEARER-BOND-CD    OF DCLVASSET                                  
DJ0007                            TO BEARER-BOND-CD    OF DCLACTIAST            
DJ0007     MOVE CSH-MGN-SHRT-CD   OF DCLVASSET                                  
DJ0007                            TO CSH-MGN-SHRT-CD   OF DCLACTIAST            
DJ0007     MOVE WHI-CD            OF DCLVASSET                                  
DJ0007                            TO WHI-CD            OF DCLACTIAST            
DJ0007     MOVE ISIN-CNTRY-CD     OF DCLVASSET                                  
DJ0007                            TO ISIN-CNTRY-CD     OF DCLACTIAST            
DJ0007     MOVE ISIN-SEC-ISSUE-CD OF DCLVASSET                                  
DJ0007                            TO ISIN-SEC-ISSUE-CD OF DCLACTIAST            
DJ0007     MOVE ISIN-SEC-CDG-CD   OF DCLVASSET                                  
DJ0007                            TO ISIN-SEC-CDG-CD   OF DCLACTIAST            
DJ0007     MOVE ASSET-PRC-CTGY-CD OF DCLVASSET                                  
DJ0007                            TO ASSET-PRC-CTGY-CD OF DCLACTIAST            
DJ0007     MOVE ASSET-DESC-TXT    OF DCLVASSET                                  
DJ0007                            TO ASSET-DESC-TXT    OF DCLACTIAST            
DJ0007     MOVE TRNFR-TYPE-RSN-CD OF DCLVASSET                                  
DJ0007                            TO TRNFR-TYPE-RSN-CD OF DCLACTIAST            
DJ0007     MOVE MBS-SERIAL-NBR    OF DCLVASSET                                  
DJ0007                            TO MBS-SERIAL-NBR    OF DCLACTIAST            
DJ0007     MOVE W-MF-AUTO-DELETE-COMMENT                                        
DJ0007                            TO ASSET-CMNT-TXT    OF DCLACTIAST            
DJ0007     MOVE NSCC-ACK-IND      OF DCLVASSET                                  
DJ0007                            TO NSCC-ACK-IND      OF DCLACTIAST            
DJ0007     MOVE SECURITY-ADP-NBR  OF DCLVASSET                                  
DJ0007                            TO SECURITY-ADP-NBR  OF DCLACTIAST            
DJ0007                                                                          
DJ0007     MOVE 'H'                 TO NSCC-PEND-CD    OF DCLACTIAST            
DJ0007     MOVE W-PGM-NAME          TO PRGM-NM         OF DCLACTIAST            
DJ0007     MOVE ' '                 TO CICS-TERM-ID-CD OF DCLACTIAST            
DJ0007     MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP       OF DCLACTIAST            
DJ0007     MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP      OF DCLACTIAST.           
DJ0007                                                                          
DJ0007     PERFORM 7170-INSERT-ACTIAST THRU 7170-EXIT.                          
DJ0007                                                                          
DJ0007 7160-EXIT. EXIT.                                                         
      /                                                                         
DJ0007 7170-INSERT-ACTIAST SECTION.                                             
                                                                                
CSG001* IN SOME CASES MSD DESCRIPTIONS CONTAIN SPECIAL CHARACTERS.              
CSG001* CORRECT THEM BY REPLACING SPECIAL CHARACTERS WITH SPACES.               
CSG001     MOVE ASSET-DESC-TXT OF DCLACTIAST TO W-ASSET-DESC-TXT                
CSG001     PERFORM 6730-EDIT-ASSET-DESC-TXT                                     
CSG001     MOVE W-ASSET-DESC-TXT TO ASSET-DESC-TXT OF DCLACTIAST                
CSG001                                                                          
DJ0023     IF (W-NSCC-AT-TFR-TYPE = 'FUL' OR 'PTD' OR 'PTR')                    
DJ0020        EVALUATE BH-ACAT-ASCENDIS-USER                                    
DJ0020           WHEN '1'   MOVE 'A'     TO NSCC-ACK-IND OF DCLACTIAST          
DJ0020           WHEN '2'   MOVE 'P'     TO NSCC-ACK-IND OF DCLACTIAST          
DJ0020           WHEN OTHER MOVE ' '     TO NSCC-ACK-IND OF DCLACTIAST          
DJ0020        END-EVALUATE                                                      
DJ0019     ELSE                                                                 
DJ0019         MOVE ' '            TO NSCC-ACK-IND       OF DCLACTIAST          
DJ0019     END-IF.                                                              
                                                                                
DJ0007     EXEC SQL                                                             
DJ0007         INSERT INTO ACTIAST                                              
DJ0007           (                                                              
DJ0007             CLIENT_NBR                                                   
DJ0007            ,DLVR_NBR                                                     
DJ0007            ,ACCT_DLVR_NBR                                                
DJ0007            ,RCV_NBR                                                      
DJ0007            ,ACCT_RCV_NBR                                                 
DJ0007            ,ISIN_CNTRY_CD                                                
DJ0007            ,ISIN_SEC_ISSUE_CD                                            
DJ0007            ,ISIN_SEC_CDG_CD                                              
DJ0007            ,STTLM_LCTN_CD                                                
DJ0007            ,CSH_MGN_SHRT_CD                                              
DJ0007            ,CSH_MRG_SHT_STS_CD                                           
DJ0007            ,STTLM_LCTN_STTS_CD                                           
DJ0007            ,ISIN_CNTRY_STTS_CD                                           
DJ0007            ,SBMTG_PRTCP_NBR                                              
DJ0007            ,SBMT_PRT_NR_STS_CD                                           
DJ0007            ,ACAT_CONTROL_NBR                                             
DJ0007            ,CONTROL_NBR_STS_CD                                           
DJ0007            ,ASSET_SEQ_NBR                                                
DJ0007            ,AST_SEQ_NBR_STS_CD                                           
DJ0007            ,TRANS_TYPE_CD                                                
DJ0007            ,TRANS_TYPE_STTS_CD                                           
DJ0007            ,PHSCL_SEQ_NBR                                                
DJ0007            ,PHSCL_SEQ_STTS_CD                                            
DJ0007            ,LGCL_SEQ_NBR                                                 
DJ0007            ,LGCL_SEQ_NR_STS_CD                                           
DJ0007            ,ASSET_PRC_CTGY_CD                                            
DJ0007            ,AST_PRC_CTG_STS_CD                                           
DJ0007            ,STTLM_RSN_CD                                                 
DJ0007            ,STTLM_RSN_STTS_CD                                            
DJ0007            ,ASSET_DESC_TXT                                               
DJ0007            ,ASSET_DESC_STTS_CD                                           
DJ0007            ,ASSET_RQST_QTY_CD                                            
DJ0007            ,ASSET_RQST_STS_CD                                            
DJ0007            ,AST_RQST_TRANS_CD                                            
DJ0007            ,AST_RQ_TRAN_STS_CD                                           
DJ0007            ,ASSET_QTY                                                    
DJ0007            ,ASSET_QTY_STTS_CD                                            
DJ0007            ,ASSET_PCT                                                    
DJ0007            ,ASSET_PCT_STTS_CD                                            
DJ0007            ,PSTN_CD                                                      
DJ0007            ,PSTN_CD_STTS_CD                                              
DJ0007            ,ISO_CRNCY_CD                                                 
DJ0007            ,ISO_CRNCY_STTS_CD                                            
DJ0007            ,ASSET_AMT                                                    
DJ0007            ,ASSET_AMT_STTS_CD                                            
DJ0007            ,BEARER_BOND_CD                                               
DJ0007            ,BEARER_BND_STTS_CD                                           
DJ0007            ,WHI_CD                                                       
DJ0007            ,WHI_STTS_CD                                                  
DJ0007            ,TRNFR_TYPE_RSN_CD                                            
DJ0007            ,TRN_TYP_RSN_STS_CD                                           
DJ0007            ,MBS_SERIAL_NBR                                               
DJ0007            ,MBS_SERIAL_STTS_CD                                           
DJ0007            ,ASSET_CMNT_TXT                                               
DJ0007            ,ASSET_CMNT_STTS_CD                                           
DJ0007            ,NSCC_WTHLD_CD                                                
DJ0007            ,TRANS_RFRN_ID_CD                                             
DJ0007            ,TRANS_RFRN_STTS_CD                                           
DJ0007            ,ISIN_SEC_IS_STS_CD                                           
DJ0007            ,ISIN_SEC_CD_STS_CD                                           
DJ0007            ,OPTN_CTGY_CD                                                 
DJ0007            ,OPTN_CTGY_STTS_CD                                            
DJ0007            ,RCRD_LNGTH_STTS_CD                                           
DJ0007            ,RCRD_STTS_CD                                                 
DJ0007            ,NSCC_PEND_CD                                                 
DJ0007            ,NSCC_ACK_IND                                                 
DJ0007            ,PRGM_NM                                                      
DJ0007            ,CICS_TERM_ID_CD                                              
DJ0007            ,UPDT_TMSTP                                                   
DJ0007            ,CRT_TMSTP                                                    
DJ0007            ,SECURITY_ADP_NBR                                             
DJ0007            ,TRNFR_TYPE_CD                                                
DJ0007            ,TRNFR_TYPE_STTS_CD                                           
DJ0007            ,RCV_NBR_STTS_CD                                              
DJ0007            ,DLVR_NBR_STTS_CD                                             
DJ0007           )                                                              
DJ0007           VALUES                                                         
DJ0007           (                                                              
DJ0007             :DCLACTIAST.CLIENT-NBR                                       
DJ0007            ,:DCLACTIAST.DLVR-NBR                                         
DJ0007            ,:DCLACTIAST.ACCT-DLVR-NBR                                    
DJ0007            ,:DCLACTIAST.RCV-NBR                                          
DJ0007            ,:DCLACTIAST.ACCT-RCV-NBR                                     
DJ0007            ,:DCLACTIAST.ISIN-CNTRY-CD                                    
DJ0007            ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                                
DJ0007            ,:DCLACTIAST.ISIN-SEC-CDG-CD                                  
DJ0007            ,:DCLACTIAST.STTLM-LCTN-CD                                    
DJ0007            ,:DCLACTIAST.CSH-MGN-SHRT-CD                                  
DJ0007            ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                               
DJ0007            ,:DCLACTIAST.STTLM-LCTN-STTS-CD                               
DJ0007            ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                               
DJ0007            ,:DCLACTIAST.SBMTG-PRTCP-NBR                                  
DJ0007            ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                               
DJ0007            ,:DCLACTIAST.ACAT-CONTROL-NBR                                 
DJ0007            ,:DCLACTIAST.CONTROL-NBR-STS-CD                               
DJ0007            ,:DCLACTIAST.ASSET-SEQ-NBR                                    
DJ0007            ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                               
DJ0007            ,:DCLACTIAST.TRANS-TYPE-CD                                    
DJ0007            ,:DCLACTIAST.TRANS-TYPE-STTS-CD                               
DJ0007            ,:DCLACTIAST.PHSCL-SEQ-NBR                                    
DJ0007            ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                                
DJ0007            ,:DCLACTIAST.LGCL-SEQ-NBR                                     
DJ0007            ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                               
DJ0007            ,:DCLACTIAST.ASSET-PRC-CTGY-CD                                
DJ0007            ,:DCLACTIAST.AST-PRC-CTG-STS-CD                               
DJ0007            ,:DCLACTIAST.STTLM-RSN-CD                                     
DJ0007            ,:DCLACTIAST.STTLM-RSN-STTS-CD                                
DJ0007            ,:DCLACTIAST.ASSET-DESC-TXT                                   
DJ0007            ,:DCLACTIAST.ASSET-DESC-STTS-CD                               
DJ0007            ,:DCLACTIAST.ASSET-RQST-QTY-CD                                
DJ0007            ,:DCLACTIAST.ASSET-RQST-STS-CD                                
DJ0007            ,:DCLACTIAST.AST-RQST-TRANS-CD                                
DJ0007            ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                               
DJ0007            ,:DCLACTIAST.ASSET-QTY                                        
DJ0007            ,:DCLACTIAST.ASSET-QTY-STTS-CD                                
DJ0007            ,:DCLACTIAST.ASSET-PCT                                        
DJ0007            ,:DCLACTIAST.ASSET-PCT-STTS-CD                                
DJ0007            ,:DCLACTIAST.PSTN-CD                                          
DJ0007            ,:DCLACTIAST.PSTN-CD-STTS-CD                                  
DJ0007            ,:DCLACTIAST.ISO-CRNCY-CD                                     
DJ0007            ,:DCLACTIAST.ISO-CRNCY-STTS-CD                                
DJ0007            ,:DCLACTIAST.ASSET-AMT                                        
DJ0007            ,:DCLACTIAST.ASSET-AMT-STTS-CD                                
DJ0007            ,:DCLACTIAST.BEARER-BOND-CD                                   
DJ0007            ,:DCLACTIAST.BEARER-BND-STTS-CD                               
DJ0007            ,:DCLACTIAST.WHI-CD                                           
DJ0007            ,:DCLACTIAST.WHI-STTS-CD                                      
DJ0007            ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                                
DJ0007            ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                               
DJ0007            ,:DCLACTIAST.MBS-SERIAL-NBR                                   
DJ0007            ,:DCLACTIAST.MBS-SERIAL-STTS-CD                               
DJ0007            ,:DCLACTIAST.ASSET-CMNT-TXT                                   
DJ0007            ,:DCLACTIAST.ASSET-CMNT-STTS-CD                               
DJ0007            ,:DCLACTIAST.NSCC-WTHLD-CD                                    
DJ0007            ,:DCLACTIAST.TRANS-RFRN-ID-CD                                 
DJ0007            ,:DCLACTIAST.TRANS-RFRN-STTS-CD                               
DJ0007            ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                               
DJ0007            ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                               
DJ0007            ,:DCLACTIAST.OPTN-CTGY-CD                                     
DJ0007            ,:DCLACTIAST.OPTN-CTGY-STTS-CD                                
DJ0007            ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                               
DJ0007            ,:DCLACTIAST.RCRD-STTS-CD                                     
DJ0007            ,:DCLACTIAST.NSCC-PEND-CD                                     
DJ0007            ,:DCLACTIAST.NSCC-ACK-IND                                     
DJ0007            ,:DCLACTIAST.PRGM-NM                                          
DJ0007            ,:DCLACTIAST.CICS-TERM-ID-CD                                  
DJ0007            ,:DCLACTIAST.UPDT-TMSTP                                       
DJ0007            ,:DCLACTIAST.CRT-TMSTP                                        
DJ0007            ,:DCLACTIAST.SECURITY-ADP-NBR                                 
DJ0007            ,:DCLACTIAST.TRNFR-TYPE-CD                                    
DJ0007            ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                               
DJ0007            ,:DCLACTIAST.RCV-NBR-STTS-CD                                  
DJ0007            ,:DCLACTIAST.DLVR-NBR-STTS-CD)                                
DJ0007     END-EXEC.                                                            
DJ0007                                                                          
DJ0007     ADD 1 TO W-SQL-CNT                                                   
DJ0007                                                                          
DJ0007     MOVE 'ACTIAST  '              TO W-DB2-TABLE-NAME                    
DJ0007     MOVE 'INSERT'                 TO W-DB2-ACTION                        
DJ0007     MOVE SQLCODE                  TO W-DB2-SQLCODE                       
DJ0007     IF  SQLCODE  =  +0                                                   
DJ0007         ADD 1 TO W-ACTIAST-ADD-CNT                                       
DJ0007         DISPLAY '    '                                                   
DJ0007             ' ' CLIENT-NBR        OF DCLACTIAST                          
DJ0007             ' ' DLVR-NBR          OF DCLACTIAST                          
DJ0007             ' ' ACCT-DLVR-NBR     OF DCLACTIAST                          
DJ0007             ' ' RCV-NBR           OF DCLACTIAST                          
DJ0007             ' ' ACCT-RCV-NBR      OF DCLACTIAST                          
DJ0007             ' ' ISIN-CNTRY-CD     OF DCLACTIAST                          
DJ0007             ' ' ISIN-SEC-ISSUE-CD OF DCLACTIAST                          
DJ0007             ' ' ISIN-SEC-CDG-CD   OF DCLACTIAST                          
DJ0007             ' ' STTLM-LCTN-CD     OF DCLACTIAST                          
DJ0007             ' ' CSH-MGN-SHRT-CD   OF DCLACTIAST                          
DJ0007             ' MF-AUTO-DEL INSERTED'                                      
DJ0021             MOVE 'Y' TO W-MF-AUTO-DEL-CREATED-IND                        
DJ0007     ELSE                                                                 
DJ0007         ADD 1 TO W-ACTIAST-NOT-ADD-CNT                                   
DJ0007         DISPLAY '    '                                                   
DJ0007             ' ' CLIENT-NBR        OF DCLACTIAST                          
DJ0007             ' ' DLVR-NBR          OF DCLACTIAST                          
DJ0007             ' ' ACCT-DLVR-NBR     OF DCLACTIAST                          
DJ0007             ' ' RCV-NBR           OF DCLACTIAST                          
DJ0007             ' ' ACCT-RCV-NBR      OF DCLACTIAST                          
DJ0007             ' ' ISIN-CNTRY-CD     OF DCLACTIAST                          
DJ0007             ' ' ISIN-SEC-ISSUE-CD OF DCLACTIAST                          
DJ0007             ' ' ISIN-SEC-CDG-CD   OF DCLACTIAST                          
DJ0007             ' ' STTLM-LCTN-CD     OF DCLACTIAST                          
DJ0007             ' ' CSH-MGN-SHRT-CD   OF DCLACTIAST                          
DJ0007             ' MF-AUTO-DEL NOT INSERTED'                                  
DJ0007             ' ' W-DB2-SQLCODE                                            
DJ0007     END-IF                                                               
DJ0007     .                                                                    
DJ0007 7170-EXIT. EXIT.                                                         
      /                                                                         
       8000-DISPLAY-KEY    SECTION.                                             
            DISPLAY 'W-SAVE-KEY:'                                               
                                 ' CLT=' W-SAVE-CLIENT-NBR                      
                                 ' CTL=' W-SAVE-ACAT-CTL-NBR                    
            DISPLAY '   KEY:'                                                   
                                 ' CLT=' W-NSCC-KEY-CLIENT-NBR                  
                                 ' CTL=' W-NSCC-ACAT-CTL-NBR                    
                                 ' SEQ=' W-ASSET-SEQ-NBR                        
                                 ' TFR=' W-NSCC-AT-TFR-TYPE                     
                                 ' TRN=' W-NSCC-AT-TRAN-TYPE                    
                                 ' STA=' W-NSCC-STATUS                          
                                 ' DAY=' W-NSCC-DAYS-IN-STATUS                  
                                 ' ACT=' W-NSCC-SYSTEM-ACTION                   
                                 ' REJ=' W-NSCC-SYSTEM-REJ-RSN                  
                                 ' SUB=' W-NSCC-AT-SUB-PART-NBR                 
            DISPLAY '   '                                                       
                                 ' DLV=' W-NSCC-AT-DEL-NBR                      
                                 ' RCV=' W-NSCC-AT-RCV-NBR                      
                                 ' DST=' W-DSTBN-SIDE-CD                        
            DISPLAY '   '                                                       
                                 ' CMS=' W-NSCC-AT-CASH-MRGN-SHTCD              
                              ' STL-LC=' W-NSCC-AT-STL-LOC                      
                              ' STL-RS=' W-NSCC-AT-STL-LOC-RSN-CD               
                              ' SEC-CC=' W-NSCC-AT-SEC-CNTRY-CD                 
                              ' SEC-NO=' W-NSCC-AT-SEC-ID                       
                              ' SEC-CD=' W-NSCC-AT-SEC-CHKDGT                   
           .                                                                    
       8000-EXIT. EXIT.                                                         
      /                                                                         
       8100-SQL-ERROR      SECTION.                                             
           DISPLAY ' '                                                          
           DISPLAY '8100-SQL-ERROR'                                             
                  ' INFILE-CNT = ' W-INFILE-CNT                                 
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT                
           DISPLAY '              '                                             
                  ' LAST ROUTINE = ' W-ROUTINE-1                                
                                                                                
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
                                                                                
           PERFORM 8200-SQL-ROLLBACK THRU 8200-EXIT                             
                                                                                
           DISPLAY 'CAT515: U3999 - ABENDING ON BAD DB2 STATUS'                 
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT515: PROGRAM ENDED ABNORMALLY'                           
           MOVE +3999    TO ABEND-CD                                            
           CALL ABEND USING ABEND-CD.                                           
                                                                                
       8100-EXIT. EXIT.                                                         
      /                                                                         
       8200-SQL-ROLLBACK   SECTION.                                             
           DISPLAY '8200-SQL-ROLLBACK'                                          
                  ' INFILE-CNT = ' W-INFILE-CNT                                 
                  ' LAST-COMMIT-INFILE-CNT = '                                  
                                            W-LAST-COMMIT-INFILE-CNT            
                                                                                
           EXEC SQL ROLLBACK WORK                                               
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO ROLLBACK-SQLCA                                       
           MOVE SQLCODE TO ROLLBACK-RETURN                                      
                                                                                
           IF ROLLBACK-AB                                                       
               DISPLAY 'CAT515: '                                               
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '                   
                   ROLLBACK-RETURN                                              
           ELSE                                                                 
               DISPLAY 'CAT515: '                                               
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '               
                   ROLLBACK-RETURN                                              
           END-IF.                                                              
                                                                                
       8200-EXIT. EXIT.                                                         
      /                                                                         
       8300-SQL-COMMIT     SECTION.                                             
                                                                                
           EXEC SQL COMMIT                                                      
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO COMMIT-SQLCA                                         
           MOVE SQLCODE TO COMMIT-RETURN                                        
                                                                                
           IF  COMMIT-AB                                                        
               ACCEPT W-SYS-TIME            FROM TIME                           
               DISPLAY 'TIME ' W-SYS-TIME                                       
                  ' SQL COMMIT FAILED.'                                         
                          ' RC= '           COMMIT-RETURN                       
                     ' INP-CNT= '           W-INFILE-CNT                        
                    ' PREV-CNT= '           W-LAST-COMMIT-INFILE-CNT            
                    ' LOAD-CNT= '           W-LOAD-CNT                          
                     ' SQL-CNT= '           W-SQL-CNT                           
           ELSE                                                                 
DJ0002         ADD 1 TO W-COMMIT-CNT                                            
           END-IF.                                                              
                                                                                
           MOVE W-INFILE-CNT             TO W-LAST-COMMIT-INFILE-CNT            
           .                                                                    
       8300-EXIT. EXIT.                                                         
      /                                                                         
       8900-DISPLAY-CNT   SECTION.                                              
           DISPLAY ' '                                                          
           DISPLAY 'CAT515: INFILE  COUNT      = ' W-INFILE-CNT                 
                 ' (INCLUDES HEADER AND TRAILER)'                               
           DISPLAY 'CAT515: DETAIL  COUNT      = ' W-DETAIL-CNT                 
                 ' (EXCLUDES HEADER AND TRAILER)'                               
           DISPLAY 'CAT515: W-AT-CNT           = ' W-AT-CNT                     
           DISPLAY 'CAT515: W-ATR-CNT (REGULAR)= ' W-ATR-CNT                    
           DISPLAY 'CAT515: W-ATO-CNT          = ' W-ATO-CNT                    
           DISPLAY 'CAT515: W-ATF-CNT          = ' W-ATF-CNT                    
           DISPLAY 'CAT515: W-LOAD-CNT         = ' W-LOAD-CNT                   
           DISPLAY 'CAT515: W-SQL-CNT          = ' W-SQL-CNT                    
DJ0002     DISPLAY 'CAT515: W-FETCH-CNT        = ' W-FETCH-CNT                  
DJ0002     DISPLAY 'CAT515: W-COMMIT-CNT       = ' W-COMMIT-CNT                 
           DISPLAY 'CAT515: VASSET-ADD-CNT     = ' W-VASSET-ADD-CNT             
                          ' VASSET-NOT-ADD-CNT = ' W-VASSET-NOT-ADD-CNT         
           DISPLAY 'CAT515: VASSET-UPD-CNT     = ' W-VASSET-UPD-CNT             
                          ' VASSET-NOT-UPD-CNT = ' W-VASSET-NOT-UPD-CNT         
           DISPLAY 'CAT515: VASSET-DEL-CNT     = ' W-VASSET-DEL-CNT             
                          ' VASSET-NOT-DEL-CNT = ' W-VASSET-NOT-DEL-CNT         
LRM042     DISPLAY 'CAT515: VASTHSTY-UPD-CNT   = ' W-VASTHSTY-UPD-CNT           
LRM042                   ' VASTHSTY-NOT-UPD-CNT ' W-VASTHSTY-NOT-UPD-CNT        
LRM041     DISPLAY 'CAT515: VFNDRGST-DEL-CNT   = ' W-VFNDRGST-DEL-CNT           
LRM041                   ' VFNDRGST-NOT-DEL   = ' W-VFNDRGST-NOT-DEL-CNT        
           DISPLAY 'CAT515: VOPTN-ADD-CNT      = ' W-VOPTN-ADD-CNT              
                          ' VOPTN-NOT-ADD-CNT  = ' W-VOPTN-NOT-ADD-CNT          
           DISPLAY 'CAT515: VOPTN-UPD-CNT      = ' W-VOPTN-UPD-CNT              
                          ' VOPTN-NOT-UPD-CNT  = ' W-VOPTN-NOT-UPD-CNT          
           DISPLAY 'CAT515: VMF-ADD-CNT        = ' W-VMF-ADD-CNT                
                          ' VMF-NOT-ADD-CNT    = ' W-VMF-NOT-ADD-CNT            
           DISPLAY 'CAT515: VMF-UPD-CNT        = ' W-VMF-UPD-CNT                
                          ' VMF-NOT-UPD-CNT    = ' W-VMF-NOT-UPD-CNT            
           DISPLAY 'CAT515: ACTIAST-DEL-CNT    = ' W-ACTIAST-DEL-CNT            
                          ' ACTIAST-NOTDEL-CNT = '                              
                                                 W-ACTIAST-NOT-DEL-CNT          
           DISPLAY 'CAT515: ACTIAST-ADD-CNT    = ' W-ACTIAST-ADD-CNT            
                          ' ACTIAST-NOTADD-CNT = '                              
                                                 W-ACTIAST-NOT-ADD-CNT          
           DISPLAY 'CAT515: ACTIAST-UPD-CNT    = ' W-ACTIAST-UPD-CNT            
                          ' ACTIAST-NOTUPD-CNT = '                              
                                                 W-ACTIAST-NOT-UPD-CNT          
           DISPLAY 'CAT515: ACTIOPN-DEL-CNT    = ' W-ACTIOPN-DEL-CNT            
                          ' ACTIOPN-NOTDEL-CNT = '                              
                                                 W-ACTIOPN-NOT-DEL-CNT          
           DISPLAY 'CAT515: ACTIOPN-ADD-CNT    = ' W-ACTIOPN-ADD-CNT            
                          ' ACTIOPN-NOTADD-CNT = '                              
                                                 W-ACTIOPN-NOT-ADD-CNT          
           DISPLAY 'CAT515: ACTIOPN-UPD-CNT    = ' W-ACTIOPN-UPD-CNT            
                          ' ACTIOPN-NOTUPD-CNT = '                              
                                                 W-ACTIOPN-NOT-UPD-CNT          
           DISPLAY 'CAT515: ACTIMF-DEL-CNT     = ' W-ACTIMF-DEL-CNT             
                          ' ACTIMF-NOTDEL-CNT  = '                              
                                                 W-ACTIMF-NOT-DEL-CNT           
           DISPLAY 'CAT515: ACTIMF-ADD-CNT     = ' W-ACTIMF-ADD-CNT             
                          ' ACTIMF-NOTADD-CNT  = '                              
                                                 W-ACTIMF-NOT-ADD-CNT           
           DISPLAY 'CAT515: ACTIMF-UPD-CNT     = ' W-ACTIMF-UPD-CNT             
                          ' ACTIMF-NOTUPD-CNT  = '                              
                                                 W-ACTIMF-NOT-UPD-CNT           
           DISPLAY 'CAT515: VTRNFR-UPD-CNT     = ' W-VTRNFR-UPD-CNT             
                          ' VTRNFR-NOTUPD-CNT  = '                              
                                                 W-VTRNFR-NOT-UPD-CNT           
           DISPLAY 'CAT515: ACTITRF-DEL-CNT    = ' W-ACTITRF-DEL-CNT            
                          ' ACTITRF-NOTDEL-CNT = '                              
                                                 W-ACTITRF-NOT-DEL-CNT          
           DISPLAY 'CAT515: ACTITRF-ADD-CNT    = ' W-ACTITRF-ADD-CNT            
                          ' ACTITRF-NOTADD-CNT = '                              
                                                 W-ACTITRF-NOT-ADD-CNT          
           DISPLAY 'CAT515: ACTITRF-UPD-CNT    = ' W-ACTITRF-UPD-CNT            
                          ' ACTITRF-NOTUPD-CNT = '                              
                                                 W-ACTITRF-NOT-UPD-CNT          
           DISPLAY 'CAT515: W-MSD-FND-CNT      = ' W-MSD-FND-CNT                
                          ' W-MSD-NOTFND-CNT   = ' W-MSD-NOTFND-CNT             
           DISPLAY 'CAT515: W-BOND-FND-CNT     = ' W-BOND-FND-CNT               
                          ' W-BOND-NOTFND-CNT  = ' W-BOND-NOTFND-CNT            
DJ0007     DISPLAY 'CAT515: W-BNWREGOP-FND-CNT = ' W-BNWREGOP-FND-CNT           
DJ0007                    ' W-MFOPBR-FND-CNT   = ' W-MFOPBR-FND-CNT             
           DISPLAY 'CAT515: W-BLANK-SEC-CNT    = ' W-BLANK-SEC-CNT              
DJ0020                    ' W-SUB-ISIN-FND-CNT = ' W-SUB-ISIN-FND-CNT           
LRM040     DISPLAY 'CAT515: NON US ISIN RECVD  = ' W-NON-US-ISIN-CNT            
LRM040                    ' W-ISIN-12BYTE-FND  = ' W-ISIN-12BYTE-FND-CNT        
           DISPLAY 'CAT515: VRSTSEC-FND-CNT    = ' W-VRSTSEC-FND-CNT            
                          ' VRSTSEC-NOTFND-CNT = ' W-VRSTSEC-NOTFND-CNT         
           DISPLAY 'CAT515: ACTIAST-FND-CNT    = ' W-ACTIAST-FND-CNT            
                          ' ACTIAST-NOTFND-CNT = ' W-ACTIAST-NOTFND-CNT         
           DISPLAY 'CAT515: ACCELERATE-ADD     = ' W-ACCELERATE-ADD-CNT         
                          ' ACCELERATE-NOT-ADD = '                              
                                               W-ACCELERATE-NOT-ADD-CNT         
           DISPLAY 'CAT515: PTD-AUTO-APPROVED  = ' W-PTD-APPROVED-CNT           
                          ' PTD-NOT-APPROVED   = '                              
                                                  W-PTD-NOT-APPROVED-CNT        
DJ0024     DISPLAY 'CAT515: REJ-ARS-SET        = ' W-REJ-ARS-CNT                
DJ0024     DISPLAY 'CAT515: REJ-ARS-UPD        = ' W-SET-ARS-CNT                
LRM031     DISPLAY 'CAT515: REJ-PENNY-SET      = ' W-REJ-PENNY-CNT              
LRM031     DISPLAY 'CAT515: REJ-PENNY-UPD      = ' W-SET-PENNY-CNT              
DJ0007     DISPLAY 'CAT515: MF-AUTO-DELETE FUL = ' W-MF-AUTO-DELETE-CNT         
DJ0007     DISPLAY 'CAT515: MF-AUTO-REJECT RCR = ' W-MF-AUTO-REJECT-CNT         
           .                                                                    
       8900-EXIT. EXIT.                                                         
      /                                                                         
       9000-CLOSE-ROUTINE SECTION.                                              
           MOVE '9000-CLOSE-ROUTINE            ' TO W-ROUTINE-1.                
                                                                                
           DISPLAY ' '.                                                         
                                                                                
           CLOSE INFILE                                                         
           DISPLAY 'CAT515: INFILE   CLOSED. STATUS = '                         
                                             INFILE-STAT.                       
                                                                                
DJ0007     CLOSE BNWREGOP                                                       
DJ0007     DISPLAY 'CAT515: BNWREGOP CLOSED. STATUS = '                         
DJ0007                                       BNWREGOP-STAT.                     
                                                                                
DJ0007     CLOSE MFOPBR                                                         
DJ0007     DISPLAY 'CAT515: MFOPBR   CLOSED. STATUS = '                         
DJ0007                                       MFOPBR-STAT.                       
                                                                                
DJ0023     CLOSE PRNGFL                                                         
DJ0023     DISPLAY 'CAT515: PRNGFL   CLOSED. STATUS = '                         
DJ0023                                       PRNGFL-STAT.                       
                                                                                
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
                                                                                
           ACCEPT W-SYS-DATE              FROM DATE.                            
           ACCEPT W-SYS-TIME              FROM TIME.                            
           DISPLAY 'CAT515: SYS-DATE ' W-SYS-DATE                               
                          ' SYS-TIME ' W-SYS-TIME.                              
           DISPLAY 'CAT515: PROGRAM ENDED SUCCESSFULLY'.                        
                                                                                
       9000-EXIT. EXIT.                                                         
      *################################################################         
