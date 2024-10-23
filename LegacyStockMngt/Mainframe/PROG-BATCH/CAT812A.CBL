000001* PDX    - CAT812A  C0355480 06/12/14 12:03:35 TBLAMUR            00001000
000001* CSG002 SSR 101121 REPLACE ILLEGAL CHARS IN MSD-DESC WITH SPACES.        
000001* LRM054 SSR# 95380 USE EXPANDED MSD OPTION FACTOR                        
000001* PDX    - CAT812A  C0348882 01/02/14 04:49:04 TBCHKOP            00001000
000001* CSG001 SSR 91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.                  
000001* PDX    - CAT812A  C0346158 10/14/13 08:43:45 TBLAMUR            00001000
000001* LRM053 SSR 83186 MMF NOT VALUED AT $1.00 PER SHARE, USE                 
      *   THE MARKET VALUE, NOT THE QTY ON THESE POSITIONS.  CHANGE TO          
      *   USE COPYBOOK CUSHOL (FROM HOLDAVSM) TO OBTAIN THE MMF CENTS.          
000001* PDX    - CAT812A  C0336021 05/06/13 11:02:01 TBLAMUR            00001000
      * LRM041 SSR 80735 MMF SWEEP CODE EXPAND TO 999.                          
      *  NO CHANGES TO ICTL TABLE AT THIS TIME; SEPERATE SSR TO FOLLOW.         
000001* PDX    - CAT812A  C0335509 04/02/13 13:54:38 TBLAMUR            00001000
      * LRM040 MSD OPTION SYMBOL LOW-VALUES FIX.                                
000001* PDX    - CAT812A  C0331456 11/20/12 14:54:48 TBLAMUR            00001000
      * LRM039 BYPASS CURRENCY 998 999.                                         
000001* PDX    - CAT812A  C0329036 09/06/12 08:42:02 TBLAMUR            00001000
      * LRM038 SSR 85105 PASS MSD ISIN TO CAT812.                               
000001* PDX    - CAT812A  C0327980 06/21/12 11:25:52 TBLAMUR            00001000
      * REMOVE LRM024 SSR 64900 SPECIAL CODE FOR CLIENT 10, 210.                
000001* PDX    - CAT812A  C0321444 01/13/12 14:20:20 TBLAMUR            00001000
      * LRM037 SSR 81018 USE 'OR' LOGIC TO COVER NON MMFVALID A000*.            
000001* PDX    - CAT812A  C0321184 01/09/12 11:49:38 TBLAMUR            00001000
000001* PDX    - CAT812A  C0317345 12/06/11 09:57:53 TBLAMUR            00001000
      * LRM035 SSR 81018 UPGRADE MMF A000* LOOKUP TO COPYBOOK MMFVALID          
      * LRM036 SSR 81391 UPGRADE IRA 866 SECURITY RANGES                        
000001* PDX    - CAT812A  C0305759 02/01/11 15:02:24 TBLAMUR            00001000
      * LRM030 SSR 74045 REPORT DUPE CONTROL NUMBER EXCEPTIONS.                 
000001* PDX    - CAT812A  C0300184 09/24/10 09:57:18 TBLAMUR            00001000
ET0006* SSR 69515 - CORRECT DUPLICATE ACCOUNT PROCESSING ERROR                  
000001* PDX    - CAT812A  C0299269 09/09/10 08:09:00 TBLAMUR            00001000
      * LRM029 SSR 62889 CONTINUED. UPDGRADE MATURED BOND LOOKUP.               
000001* PDX    - CAT519   C0295620 06/30/10 09:57:55 TBLAMUR                    
      * LRM028 SSR 62889 WITHHOLD MATURING OR CALLED BONDS FOR                  
      *   BOTH FULLY AND PARTIALLY CALLED.  CREATE (MAKES NO SENSE)             
      *   MEMO RATHER THAN DELIVERY ASSET. B1 434748 HAS 3 SETTINGS,            
      *   1 - BYPASS SEC, 2 - CREATE MEMO, 3 MEMO AND (ADD TO X SCREEN          
      *   INSERT ACTIAST ROW CLIENT= W### TO DRIVE X SCREEN UPDATE).            
000001* PDX    - CAT812A  C0291396 03/08/10 10:25:28 TBLAMUR            00001000
      * LRM024 SSR 64900 PENSON CHANGE TO CAUSE ALL FULL DELIVERIES             
      *  FOR CLIENT 10 ==> 210 TRANSFERS AS AN EXCEPTION.  THESE                
      *  ARE ID BY CVRSN-ACCT = 'CONVERSION' ON BOTH CLIENTS' HSTY.             
      *  THE CLIENT 210 ROWS WILL HAVE DLVR-NBR 0158.                           
000001* PDX    - CAT812A  C0288347 01/07/10 11:42:53 TBLAMUR            00001000
000001* PDX    - CAT812A  C0287084 10/23/09 08:47:40 TBLAMUR            00001000
      * LRM023 SSR 59603 OPTION SYMBOLOGY CHANGES.                              
      *   REMOVE PARM-STREAM = Q HARD CODE AT THIS TIME.                        
      *   CHANGE ASSET DESC FORMATTING WHEN MSD NOTFND FOR OPTIONS.             
      *   USE EXPANDED STRIKE PRICE FROM MSD.  CHANGE OPT SYMBOL TO USE         
      *   MSD-OCC-OPTN-SYM-ID, AND WHEN MISSING, CALL MSD TO                    
      *   OBTAIN THE UNDERLYING SEC SYMBOL; REMOVE OPRA CODE LOGIC.             
      * LRM017 SSR 66946 CAMS THRESHOLD FUND EXPANSION.                         
000001* PDX    - CAT812A  C0287215 10/20/09 14:34:33 TBLAMUR            00001000
      * LRM016 SSR 67652 CORRECT ISSUE MMF CARRIED IN FOREIGN                   
      *  CURRENCY IS DELIVERED, DO NOT ADD THIS TO W-BAL.                       
000001* PDX    - CAT812A  C0284212 09/12/09 10:53:26 TBLAMUR            00001000
      * TK0016 SSR 63787 ACCEPT NON-ZERO CURRENCY                               
000001* PDX    - CAT812A  C0280389 05/11/09 11:01:15 TBDOJUN            00001000
      * DJ0015 SSR 63946 BYPASS RCR FOR OVERMEMO                                
000001* PDX    - CAT812A  C0278316 04/13/09 11:24:09 TBDOJUN            00001000
      * DJ0014 SSR 61075 FRACTIONAL SHARES ON MUNI TAX EXEMPT UNITS             
      * DJ0014 SSR 61867 USE ADP-NO TO READ VRSTSEC(NO MORE CUSIP)              
000001* PDX    - CAT812A  C0279216 04/04/09 00:43:11 TBDOJUN            00001000
      * DJ0013 FIX -811 ABEND.                                                  
000001* PDX    - CAT812A  C0277933 03/09/09 09:20:26 TBDOJUN            00001000
      * DJ0012 SSR 63337 BYPASS CREATION IF TRANSFER EXIST IN INIT TBL          
000001* PDX    - CAT812A  C0274257 01/12/09 10:05:59 TBDOJUN            00001000
      * DJ0011 SSR 57654 B1 OPTION TO USE S/D POSITIONS INSTEAD OF T/D          
      * DJ0011 NEW B1 CARD-434737 BH-ACAT-RCR-SETTLE-DATE-POS PIC X.            
000001* PDX    - CAT812A  C0266770 07/14/08 08:44:24 TBDOJUN            00001000
      * DJ0010 SSR 55171 READ ACTRBSC TABLE FOR MMF DELIVER AS CASH             
000001* PDX    - CAT812A  C0249006 06/29/07 12:35:39 TBDOJUN            00001000
      * DJ0009 SSR 47339 SUPPORT DUALLY LISTED SECURITIES                       
      * DJ0009           POPULATE GETMSD-CLIENT-PL2 WHEN CALLING GETMSD         
000001* PDX    - CAT812A  C0235973 07/10/06 10:08:55 TBDOJUN                    
      * DJ0008 SSR# 44420 USE MSD PRICE MULTIPLIER                              
000001* PDX    - CAT812A  C0230098 02/16/06 10:29:21 TBDOJUN                    
      * LRM010 - SSR 45101 DELIVER CAMS THRESHOLD FUNDS AS CASH.                
      * LRM010 - TREATED LIKE PRIMARY FUNDS.                                    
000001* PDX    - CAT812A  C0227894 12/12/05 10:48:32 TBDOJUN                    
      * DJ0007 SSR# 42122 RESCIND BLOCK FIX. USE BRN/ACCT IN LOOKUP             
000001* PDX    - CAT812A  C0221559 05/25/05 08:09:18 TBLAMUR                    
LRM009* 05/25/06 PMR 2404538 CORRECT TYPE F RESCIND BLOCK FROM FRV              
000001* PDX    - CAT812A  C0218155 03/09/05 15:25:04 TBDOJUN                    
      * DJ0006 - SSR# 38793 ADD IRA SECURITY RANGE 8667304-8667310              
000001* PDX    - CAT812A  C0215363 02/14/05 08:04:03 TBDOJUN                    
      * DJ0005 - SSR# 38793 EXPAND IRA SECURITY RANGE FOR BYPASSING             
      * DJ0005 - SSR# 40042 NEW DB2 INIT TBL: ACTI***,NEW KEY STRUCTURE         
      * DJ0005 - SSR# 40173 ALLOW MSD SEC NO ALPHANUMERIC                       
      * DJ0005 - SSR# 40271 FIX UNITS RANGE                                     
      * DJ0005 - MIPS REDUCTION: CHG TO PIC 9 COMP-3.                           
      * PDX    - CAT812A  C0210469 09/22/04 08:49:15 TBLAMUR                    
LRM008* 09/22/04 SSR 0034535 RECOGNIZE TYPE F RESCIND BLOCK FROM FRV            
      * PDX    - CAT812A  C0183314 11/29/03 13:57:58 TBLAMUR                    
      * PDX    - CAT812A  C0196644 10/06/03 11:33:31 TBLAMUR                    
      * PDX    - CAT812A  C0194849 08/25/03 10:25:38 TBLAMUR                    
      * PDX    - CAT812A  C0182051 02/12/03 15:46:30 TBLAMUR                    
      * PDX    - CAT812A  C0179727 10/28/02 11:02:42 TBLAMUR                    
      * LRM005 SSR 00026952 RESCIND BLOCK                                       
      * PDX    - CAT812A  C0179141 08/23/02 14:46:46 TBLAMUR                    
      * LRM003 - CHANGE ET0002 TO TRANSFER MMF FUNDS AS ASSETS WHEN             
      *          434510 = 2,3 AND NOT MATCHED TO CAMS LIQ.                      
      * PDX    - CAT812A  C0176254 08/02/02 16:27:54 TBEDTAK                    
      * PDX    - CAT812A  C0173277 05/13/02 09:17:33 TBEDTAK                    
      * PDX    - CAT812A  C0158046 05/29/01 09:33:33 TBLAMUR                    
      * LRM001 - INCLUDE A000015,17,26,27,28,29,31 IN MONEY MKT RANGE           
      * PDX    - CAT812A  C0158119 04/30/01 13:10:19 TBLAMUR                    
      * PDX    - CAT812A  C0155949 03/19/01 10:38:10 TBLAMUR                    
      * PDX    - CAT812A  C0152145 01/16/01 16:23:16 TBDOJUN                    
      * DJ0004   FIX ASSET CATEGORY                                             
      * PDX    - CAT812A  C0144778 10/30/00 11:26:20 TBLAMUR                    
      * DJ0003   FIX DUPE HISTORY TRANSFER LOOKUP LOGIC                         
      * PDX    - CAT812A  C0141412 08/28/00 10:16:50 TBDOJUN                    
      * DJ0002   SSR# R2558300 FLAG NON-DELIVERABLE                             
      * DJ0002   SSR# R5258000 EXCEPTION PROCESSING                             
      * DJ0002   CREATE RECORDS FOR SETTLING TYPE 3 PROCESSING                  
      * PDX    - CAT812A  C0139071 03/03/00 08:51:17 TBLAMUR                    
      * PDX    - CAT812A  C0131159 09/10/99 16:45:18 TBLAMUR                    
      * PDX    - CAT812A  C0128921 08/16/99 10:10:25 TBDOJUN                    
      * DJ0001 - ALPHA BRANCH                                                   
      * DJ0001 - CHANGE ACBALVSM TO ACBALALP                                    
      * DJ0001 - CHANGE HOLDNVSM TO HOLDAVSM                                    
      * DJ0001 - LIQUIDATE FRACTIONS FOR CNS ELIGIBLE UNITS                     
      * PDX    - CAT812A  C0125737 06/21/99 16:33:05 TBDOJUN                    
      * DJ     - USE MRGIMM FILE FOR MEMO LOOKUP. REMOVE SRMAS                  
      * DJ     - LOOK UP VRSDSEC (SECURITIES TO EXCLUDE)                        
      * DJ     - INCLUDE A000039 IN MONEY MARKET RANGE                          
      * PDX    - CAT812A  C0123087 04/12/99 10:26:06 TBDOJUN                    
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT812A.                                                    
      *****************************************************************         
      * THIS PROGRAM CONTAINS DB2.                                    *         
      *****************************************************************         
      * CAT812A-   CREATE RCR TRANSFER REQUESTS FOR RESIDUAL CREDITS  *         
      *            EXTRACT BALANCES, POSITIONS, AND MRGIMM MEMOS.     *         
      *            THIS OUTPUT FILE FEEDS CAT812.                     *         
      *                                                               *         
      * SELECT FULL TRANSFER DELIVERY REQUESTS ON TRANSFER HISTORY    *         
      * WHERE STATUS = 310(SETTLE CLOSE)  AND NAPPA-ACAT-CODE = 'D'   *         
      *                                                               *         
      * FLAG   DEBIT BALANCE (> 0), SMA,                              *         
      *        SHORT POSITION(< 0), RESTRICTED, MEMOS(?)              *         
      *                                                               *         
      * USE B1#434536 TO DETERMINE WHO TO PROCESS ON THE HISTORY FILE.*         
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
      * READ BPS VSAM BALANCE, POSITIONS, STOCK RECORD FILES TO       *         
      * CREATE THE ASSETS AND LOAD TO THE INIT TABLES.                *         
      * IF OPTIONS, ALSO LOAD TO INIT OPTION TABLE.                   *         
      * IF MUTUAL FUNDS, ALSO LOAD TO THE INIT MUTUAL FUND TABLE.     *         
      * SUBTRACT MEMO-QTY FROM POS-QTY BASED ON B1 AND SK,SN.         *         
      * IF SAFEKEEPING MEMO (SN,SK), CREATE A MEMO ASSET.             *         
      *                                                               *         
      * INPUT  -                                                      *         
      *        - VTRNHSTY - ACATS HISTORY TRANAFER DB2 TABLE          *         
      *        - BALANCE FILE                                         *         
      *        - POSITION FILE                                        *         
      *        - MRGIMM MEMO  FILE                                    *         
      *        - B1                                                   *         
      * OUTPUT -                                                      *         
      *        - ACATRCRF  DATA FILE FOR CAT812  TO LOAD DATABASE.    *         
      *                                                               *         
      *                                                               *         
      *****************************************************************         
      * 04/01/99 DJ    NEW PROGRAM                                    *         
DJ0002* 08/28/00 DJ    SSR# R2558300 FLAG NON-DELIVERABLE             *         
DJ0002*                SSR# R5258000 EXCEPTION PROCESSING             *         
DJ0002*                ITEMS TO BE REPORTED IN A NEW REPORT IN CAT813.*         
ET0001* 05/13/02       CASH ADJUSTMENT BY PENDING AMOUNT.             *         
ET0002* 08/05/02       MODIFY MONEY MARKET FUNDS PROCESS BY ADDITIONAL*         
ET0002*                B1(434510) VALUES.                             *         
ET0003* 08/05/02       REMOVE FRACTIONAL QTY FROM CNS ELIGIBLE ADRS.  *         
ET0004* JAN 2003       MARGIN RETOOL.  CALL GETVBAL & GETVHOL         *         
ET0005* 08/20/03       OPTION STRIKE PRICE DECIMALIZATION             *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
ET0002     SELECT MMF-FILE          ASSIGN TO MMFFL.                            
ET0002                                                                          
           SELECT MRGIMM            ASSIGN TO MRGIMM                            
                  ACCESS            DYNAMIC                                     
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     MRGIMM-SEQ-KEY                              
                  FILE STATUS IS    MRGIMM-STATUS.                              
                                                                                
           SELECT ACATRCRF         ASSIGN      TO ACATRCRF                      
                                   FILE STATUS IS ACATRCRF-FILE-STATUS.         
                                                                                
           SELECT SORT-FILE              ASSIGN TO  UT-S-SORTWK01.              
                                                                                
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
                                                                                
ET0002 FD  MMF-FILE                                                             
ET0002     LABEL RECORDS ARE STANDARD                                           
ET0002     RECORDING MODE IS V                                                  
ET0002     BLOCK CONTAINS 0 RECORDS.                                            
ET0002     COPY CATMMF  REPLACING ==:CAT:== BY ==I==.                           
ET0002                                                                          
      /                                                                         
       FD  MRGIMM.                                                              
           COPY  POSMEMOR REPLACING ==:POSMEMO:== BY ==MRGIMM==.                
      /                                                                         
       FD  ACATRCRF                                                             
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
           COPY ACATRCRF REPLACING ==:ACATRCRF:== BY ==OUT==.                   
      /                                                                         
       SD  SORT-FILE.                                                           
                                                                                
           COPY ACATRCRF REPLACING ==:ACATRCRF:== BY ==SORT==.                  
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
           COPY PDXIDCOB.                                                       
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT812A'.           
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.                 
           05  W-FIRST-TIME-SW           PIC  X(001) VALUE '0'.                 
               88 NOT-FIRST-TIME                     VALUE '1'.                 
           05  END-OF-INPUT-SW           PIC  X(001) VALUE '0'.                 
               88 END-OF-INPUT                       VALUE '1'.                 
           05  END-OF-SORT-SW            PIC  X(01) VALUE '0'.                  
               88 END-OF-SORT                       VALUE '1'.                  
ET0002     05  EOF-MMF-SW                PIC  X(001) VALUE '0'.                 
ET0002         88 EOF-MMF                            VALUE '1'.                 
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
           05  POSIT-STATUS              PIC  X(002).                           
               88 POSIT-OKAY             VALUE '00' THRU '09', '97'.            
               88 POSIT-END-OF-FILE      VALUE '10'.                            
               88 POSIT-EMPTY-MISSING    VALUE '35'.                            
           05  ACATRCRF-FILE-STATUS      PIC  X(002).                           
               88 ACATRCRF-OKAY          VALUE '00' THRU '09', '97'.            
               88 ACATRCRF-END-OF-FILE   VALUE '10'.                            
               88 ACATRCRF-EMPTY-MISSING VALUE '35'.                            
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
DJ0002     05  W-EXC-NUMBER-DAYS         PIC  9(003) VALUE 0.                   
DJ0002     05  W-EXC-DATE.                                                      
DJ0002         10 W-EXC-YEAR             PIC  X(004).                           
DJ0002         10 W-EXC-MM               PIC  X(002).                           
DJ0002         10 W-EXC-DD               PIC  X(002).                           
ET0002     05  W-MMF-FOUND               PIC  X(001) VALUE ' '.                 
ET0002     05  FILLER                    PIC  X(008) VALUE 'MMFFLCNT'.          
ET0002     05  W-MMF-CNT                 PIC  9(009) COMP-3 VALUE 0.            
TK0016     05  W-FCURR-BAL-CNT           PIC  9(009) COMP-3 VALUE 0.            
TK0016     05  W-FCURR-POSN-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.                 
               88 HDR-FOUND                          VALUE 'H'.                 
               88 TRL-FOUND                          VALUE 'T'.                 
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.          
           05  W-INFILE-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'ACATRCRF'.          
           05  W-ACATRCRF-CNT            PIC  9(009) COMP-3 VALUE 0.            
           05  W-RELEASE-CNT             PIC  9(009) COMP-3 VALUE 0.            
           05  W-RETURN-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-LOAD-CNT                PIC  9(009) COMP-3 VALUE 0.            
           05  W-TI-CNT                  PIC  9(009) COMP-3 VALUE 0.            
           05  W-POSIT-CNT               PIC  9(009) COMP-3 VALUE 0.            
           05  W-SQL-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-POS-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-BAL-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-DUP-CNT                 PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACTIVE-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-ASSET-CNT               PIC  9(009) COMP-3 VALUE 0.            
           05  W-TRANSFER-FND-SW         PIC  X(001) VALUE ' '.                 
               88 W-TRANSFER-FOUND                   VALUE 'Y'.                 
DJ0012     05  W-ACTITRF-FND-SW          PIC  X(001) VALUE ' '.                 
DJ0012         88 W-ACTITRF-FOUND                    VALUE 'Y'.                 
           05  W-VRSTSEC-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTSEC-NOTFND-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTSEC-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-VRSTSEC-FOUND                    VALUE 'Y'.                 
LRM005     05  W-VRSDBLK-SEC-FND-CNT     PIC  9(009) COMP-3 VALUE 0.            
LRM005     05  W-VRSDBLK-SEC-FND-SW      PIC  X(001) VALUE ' '.                 
LRM005     05  W-VRSDBLK-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
LRM005     05  W-VRSDBLK-FND-SW          PIC  X(001) VALUE ' '.                 
LRM005     05  W-CLIENT-RESCIND-FND-SW   PIC  X(001) VALUE ' '.                 
LRM005     05  W-LEGAL-BLOCK-FND-SW      PIC  X(001) VALUE ' '.                 
           05  W-VRSTBRKR-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTBRKR-NOTFND-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSTBRKR-FND-SW         PIC  X(001) VALUE ' '.                 
               88 W-VRSTBRKR-FOUND                   VALUE 'Y'.                 
           05  W-RCR-EXCLUDED-SW         PIC  X(001) VALUE ' '.                 
               88 W-RCR-EXCLUDED                     VALUE 'Y'.                 
           05  W-RESTRICTED-SW           PIC  X(001) VALUE ' '.                 
               88 W-RESTRICTED                       VALUE 'Y'.                 
           05  W-VRSTBRKR-ROW-CNT        PIC S9(4) COMP VALUE +0.               
           05  W-VRSDACC-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSDACC-NOTFND-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSDACC-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-VRSDACC-FOUND                    VALUE 'Y'.                 
           05  W-VRSDSEC-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSDSEC-NOTFND-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-VRSDSEC-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-VRSDSEC-FOUND                    VALUE 'Y'.                 
           05  W-VRSDSEC-ROW-CNT         PIC S9(4) COMP VALUE +0.               
DJ0010     05  W-ACTRBSC-FND-CNT         PIC  9(009) COMP-3 VALUE 0.            
DJ0010     05  W-ACTRBSC-NOTFND-CNT      PIC  9(009) COMP-3 VALUE 0.            
DJ0010     05  W-ACTRBSC-FND-SW          PIC  X(001) VALUE ' '.                 
DJ0010         88 W-ACTRBSC-FOUND                    VALUE 'Y'.                 
           05  W-GETNA-FND-CNT           PIC  9(009) COMP-3 VALUE 0.            
           05  W-GETNA-NOTFND-CNT        PIC  9(009) COMP-3 VALUE 0.            
           05  W-GETNA-FND-SW            PIC  X(001).                           
               88  W-GETNA-FOUND                     VALUE 'Y'.                 
           05  W-ACAT-CODE-NOT-D-CNT     PIC  9(009) COMP-3 VALUE 0.            
           05  W-ACAT-CODE-D-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-BAL-FND-SW              PIC  X(001) VALUE ' '.                 
               88 W-BAL-FOUND                        VALUE 'Y'.                 
LRM028     05  W-MATURE-CALLED-BOND-SW   PIC  X(001) VALUE ' '.                 
DJ0001     05  W-REMOVE-FRACTION-CNT     PIC  9(009) COMP-3 VALUE 0.            
LRM028     05  W-MATURE-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM028     05  W-VBNDDT-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM028     05  W-VBNDDT-NOTFND-CNT       PIC  9(009) COMP-3 VALUE 0.            
LRM029     05  W-VBNDFTRV-FND-CNT        PIC  9(009) COMP-3 VALUE 0.            
LRM029     05  W-VBNDFTRV-NOTFND         PIC  9(009) COMP-3 VALUE 0.            
LRM028     05  W-BOND-AUDIT-ADD          PIC  9(009) COMP-3 VALUE 0.            
LRM028     05  W-BOND-AUDIT-NOTADD       PIC  9(009) COMP-3 VALUE 0.            
                                                                                
           05  W-ASSET-PRC-CTGY-CD       PIC X(04).                             
           05  W-ASSET-ADDED-FOR-THIS-ACCT-SW PIC X(01).                        
               88  W-ASSET-ADDED-FOR-THIS-ACCT       VALUE 'Y'.                 
           05  W-SHORT-IND               PIC X(01).                             
DJ0002         88  W-THIS-ACCT-IS-SHORT              VALUE 'Y'.                 
DJ0002     05  W-EXCEPTION-IND           PIC X(01).                             
DJ0002         88  W-THIS-ACCT-HAS-EXCEPTION         VALUE 'Y'.                 
DJ0002     05  W-EQUITY-EXC-IND          PIC X(01).                             
DJ0002         88  W-THIS-ACCT-HAS-EQUITY-EXC        VALUE 'Y'.                 
DJ0002     05  W-STLDAT-EXC-IND          PIC X(01).                             
DJ0002         88  W-THIS-ACCT-HAS-STLDAT-EXC        VALUE 'Y'.                 
DJ0002     05  W-SETTLING-TYP3-IND       PIC X(01).                             
DJ0002         88  W-THIS-ACCT-SETTLING-TYP3         VALUE 'Y'.                 
DJ0002     05  W-NON-DELIVERABLE-IND     PIC X(01).                             
DJ0002         88  W-THIS-IS-NON-DELIVERABLE         VALUE 'Y'.                 
DJ0002     05  W-CONVERSION-IND          PIC X(01).                             
DJ0002         88  W-THIS-IS-CONVERTED-OUT           VALUE 'Y'.                 
LRM030     05  W-DUPLICATE-IND           PIC X(01).                             
LRM030         88  W-THIS-IS-DUPLICATE               VALUE 'Y'.                 
LRM030     05  W-DUPLICATE-DATABASE      PIC X(07).                     ACATRCRF
DJ0002     05  W-EQUITY-EXC-CNT          PIC  9(009) COMP-3 VALUE 0.            
DJ0002     05  W-STLDAT-EXC-CNT          PIC  9(009) COMP-3 VALUE 0.            
LRM024     05  W-CONV-EXC-CNT            PIC  9(009) COMP-3 VALUE 0.            
LRM030     05  W-DUPE-EXC-CNT            PIC  9(009) COMP-3 VALUE 0.            
DJ0002     05  W-NON-DELIVERABLE-CNT     PIC  9(009) COMP-3 VALUE 0.            
DJ0002     05  W-DEL-ASSET-CNT           PIC  9(009) COMP-3 VALUE 0.            
DJ0002     05  W-NON-ASSET-CNT           PIC  9(009) COMP-3 VALUE 0.            
DJ0002     05  W-EXC-ASSET-CNT           PIC  9(009) COMP-3 VALUE 0.            
                                                                                
           05  W-BR.                                                            
               10  W-BR-X                PIC X(03).                             
           05  W-ACCT.                                                          
               10  W-ACCT-X              PIC X(05).                             
           05  W-ACCT-TYPE.                                                     
               10  W-FILLER              PIC X.                                 
               10  W-ACCT-TYPE-N         PIC 9.                                 
DJ0012     05 W-BRN-ACCT-LIKE-X.                                                
DJ0012        10 W-BRN-ACCT.                                                    
DJ0012           15 W-BRANCH-CD          PIC  X(03).                            
DJ0012           15 W-ACCT-CD            PIC  X(05).                            
DJ0012        10 FILLER                  PIC  X(01) VALUE '%'.                  
DJ0012     05 W-BRN-ACCT-LIKE            PIC  X(09).                            
                                                                                
DJ0001     05  W-TXT.                                                           
DJ0001         10  W-TXT-BYTE            PIC X OCCURS 140 TIMES.                
                                                                                
           05  SUB1                      PIC 9(03) COMP-3 VALUE 0.              
           05  W-SUB1                    PIC 9(03) COMP-3 VALUE 0.              
ET0002     05  OCR-SUB                   PIC 9(04) COMP-3 VALUE 0.              
LRM017     05  TH-SUB                    PIC 9(05) COMP-3 VALUE 0.              
ET0002     05  TBL-SUB                   PIC 9(04) COMP-3 VALUE 0.              
ET0002     05  MM-SUB                    PIC 9(04) COMP-3 VALUE 0.              
           05  W-HEX                     PIC S9(04) COMP SYNC VALUE +0.         
           05  FILLER REDEFINES W-HEX.                                          
               10  FILLER                PIC X(01).                             
               10  W-HEX-X               PIC X(01).                             
DJ0011     05  W-CUSHOL-QTY              PIC S9(12)V9(5) COMP-3.                
           05  WORK-POS-QTY              PIC S9(12)V9(5) COMP-3.                
           05  WORK-POS-QTY-INTEGER      PIC S9(12)    COMP-3.                  
           05  WORK-POS-QTY-DECIMAL      PIC V9(5).                             
           05  WORK-POS-QTY-LEFT         PIC S9(12)V9(5) COMP-3.                
           05  W-QTY-DISPLAY             PIC 999999999.99999-.                  
DJ0015     05  W-QTY-DISPLAY-2           PIC 999999999.99999-.                  
DJ0015     05  W-QTY-DISPLAY-3           PIC 999999999.99999-.                  
           05  W-ASSET-QTY-SIGN          PIC S9(12)V9(5) COMP-3.                
           05  W-ASSET-QTY-UNSIGN        PIC  9(12)V9(5) COMP-3.                
           05  WORK-POS-VALUE            PIC S9(12)V9(5) COMP-3.                
                                                                                
           05  WORK-MEMOS-TABLE.                                                
             07  WORK-MEMOS              OCCURS 4 TIMES.                        
               10 WORK-MEMO-CODE         PIC 9(02).                             
               10 WORK-MEMO-QTY-X.                                              
                  15  WORK-MEMO-QTY      PIC S9(12)V9(5) COMP-3.                
                  15  WORK-MEMO-FRAC-QTY REDEFINES WORK-MEMO-QTY                
                                         PIC S9(10)V9(7) COMP-3.                
                                                                                
           05  W-N4-MEMO-QTY             PIC S9(12)V9(5) COMP-3.                
           05  W-TF-MEMO-QTY             PIC S9(12)V9(5) COMP-3.                
           05  W-TL-MEMO-QTY             PIC S9(12)V9(5) COMP-3.                
           05  W-SFK-MEMO-QTY            PIC S9(12)V9(5) COMP-3.                
           05  W-WHOLD-MEMO-QTY          PIC S9(12)V9(5) COMP-3.                
                                                                                
           05  W-MEMO-QTY-EXCLUDED       PIC S9(12)V9(5) COMP-3.                
           05  W-MEMO-EXCLUDED-IND       PIC X(01).                             
               88  MEMO-EXCLUDED-LESS-OR-EQUAL VALUE '1'.                       
               88  MEMO-EXCLUDED-GREATER       VALUE '2'.                       
           05  W-MEMO-IND                PIC X(01).                             
               88  MEMO-NOT-FOUND        VALUE ' '.                             
               88  MEMO-FOUND            VALUE '1'.                             
ET0004 01  GETVBAL                          PIC X(08) VALUE 'ZGETVBAL'.         
ET0004     COPY GETVBALC REPLACING ==:GETVBAL:== BY ==GETVBAL==.                
ET0004     COPY CUSBALRE REPLACING ==:BAL:==     BY ==BAL==.                    
ET0004     COPY ACBALALP.                                                       
ET0004     COPY BVHEADER.                                                       
ET0004     COPY BVTRILER.                                                       
ET0004 01 GETVOL-AREA.                                                          
ET0004   05  W-CUSHOL-KEY.                                                      
ET0004        15  W-CUSHOL-CLIENT              PIC X(03).                       
ET0004        15  W-CUSHOL-CLIENT-N REDEFINES                                   
ET0004            W-CUSHOL-CLIENT              PIC 9(03).                       
ET0004        15  W-CUSHOL-BRANCH              PIC X(03).                       
ET0004        15  W-CUSHOL-ACCOUNT             PIC X(05).                       
ET0004        15  W-CUSHOL-FRGN-CURR-CODE      PIC 9(03).                       
ET0004        15  W-CUSHOL-FILLER              PIC X(31).                       
ET0004 01  GETVHOL                PIC X(008) VALUE  'ZGETVHOL'.                 
ET0004     COPY GETVHOLC REPLACING ==:GETVHOL:== BY ==GETVHOL==.                
ET0004/                                                                         
ET0002 01  WS-MONEY-MKT-FUND-AREA.                                              
ET0002     05  W-MMF-TABLE-AREA.                                                
ET0002         07 W-MMF-TBL             OCCURS 999 TIMES.                       
ET0002            09 W-MMF-CLT           PIC 9(03).                             
ET0002            09 W-MMF-SEC           PIC X(07).                             
LRM041            09 W-MMF-SWEEP-CD      PIC 9(04).                             
ET0002            09 W-MMF-REDMPT-IND    PIC X(01).                             
LRM017            09  W-THRESHOLD-TBL-CNT PIC 9(05).                            
LRM017            09 W-MMF-THRESHOLD-TBL   OCCURS 999 TIMES.                    
LRM017               11 W-MMF-THRESHOLD-FUND    PIC X(07).                      
ET0002         07 W-REDMPT-TBL          OCCURS 999 TIMES.                       
ET0002            09 W-REDMPT-SEC        PIC X(07).                             
ET0002     05  W-MMF-TBL-CNT             PIC 9(04) COMP-3 VALUE 0.              
ET0002     05  W-REDMPT-TBL-CNT          PIC 9(04) COMP-3 VALUE 0.              
      /                                                                         
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
       01  CALL-MODULES.                                                        
           05  ABEND-PROGRAM             PIC  X(08) VALUE 'ILBOABN0'.           
           05  CKDIGIT-PROGRAM           PIC  X(08) VALUE 'CKDIGIT '.           
           05  DSNTIAR-PROGRAM           PIC  X(08) VALUE 'DSNTIAR '.           
           05  NUMDAYS-PROGRAM           PIC  X(08) VALUE 'NUMDAYS '.           
           05  SPIEEXIT-PROGRAM          PIC  X(08) VALUE 'SPIEEXI2'.           
           05  ZBPDATES-PROGRAM          PIC  X(08) VALUE 'ZBPDATES'.           
           05  ZGETB1V-PROGRAM           PIC  X(08) VALUE 'ZGETB1V '.           
           05  ZGETMSDC-PROGRAM          PIC  X(08) VALUE 'ZGETMSDC'.           
           05  ZGETNA-PROGRAM            PIC  X(08) VALUE 'ZGETNA  '.           
           05  ZGETXREF-PROGRAM          PIC  X(08) VALUE 'ZGETXREF'.           
           05  ZP2HDTR-PROGRAM           PIC  X(08) VALUE 'ZP2HDTR'.            
      /                                                                         
       01  W-BAL-FIELDS.                                                        
           05  W-BAL-KEY.                                                       
             07  W-BAL-KEY-A.                                                   
               10  W-BAL-CLT                PIC 9(05)     COMP-3.               
DJ0001         10  W-BAL-BR                 PIC X(03).                          
DJ0001         10  W-BAL-ACCT               PIC X(05).                          
               10  W-BAL-REC-TYPE           PIC X(02).                          
             07  W-BAL-KEY-B.                                                   
               10  W-BAL-CUR                PIC X(06).                          
DJ0001       07  W-BAL-KEY-C                PIC X(01).                          
                                                                                
           05  W-BAL-TYPE1                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TYPE2                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TYPE3                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-TYPE5                  PIC S9(9)V99 VALUE 0.               
           05  W-BAL-SMA                    PIC S9(9)V99 VALUE 0.               
           05  W-BAL-MMKT                   PIC S9(9)V99 VALUE 0.               
ET0001     05  W-BAL-PENDING-AMOUNT         PIC S9(9)V99 COMP-3.                
DJ0002     05  W-BAL-EQUITY                 PIC S9(17)        VALUE 0.          
DJ0002     05  W-BAL-DISPLAY                PIC 9999999999-.                    
ET0001     05  W-BALANCE-DISPLAY            PIC 9999999999.99-.                 
ET0001     05  W-AMT-DISPLAY                PIC 9999999999.99-.                 
ET0001     05  W-CLT-DISPLAY                PIC 9(04).                          
           05  W-CSH-MGN-SHT                PIC  X(01).                         
           05  W-CASH-SMA                   PIC  X(04).                         
           05  W-WORK-BAL                   PIC S9(9)V99 VALUE 0.               
           05  W-WORK-BAL-UNSIGN            PIC  9(9)V99.                       
TK0016     05  W-BAL-CURRENCY-CODE          PIC X(06) VALUE SPACES.             
CSG002*                                                                         
CSG002     05  W-EDIT-ASSET-DESC-TXT-AREA.                                      
CSG002         10 W-SUB2                       PIC S9(03) COMP-3.               
CSG002         10 W-ASSET-DESC-TXT.                                             
CSG002            15 W-ASSET-DESC1-TXT         PIC X(30) VALUE SPACES.          
CSG002            15 W-ASSET-DESC2-TXT         PIC X(30) VALUE SPACES.          
CSG002            15 W-ASSET-DESC3-TXT         PIC X(30) VALUE SPACES.          
CSG002            15 W-ASSET-DESC4-TXT         PIC X(30) VALUE SPACES.          
CSG002            15 W-ASSET-DESC5-TXT         PIC X(20) VALUE SPACES.          
CSG002         10 W-ASSET-DESC-TMP             PIC X(30) VALUE SPACES.          
CSG002         10 W-JUST-LEFT-FLAG             PIC X(01).                       
CSG002            88 W-JUST-LEFT-DONE          VALUE 'Y'.                       
CSG002            88 W-JUST-LEFT-NOT-DONE      VALUE 'N'.                       
CSG002         10 W-EDIT-ASSET-DESC-TXT-FLAG   PIC X(01).                       
CSG002            88 W-EDIT-ASSET-DESC-TXT-Y   VALUE 'Y'.                       
CSG002            88 W-EDIT-ASSET-DESC-TXT-N   VALUE 'N'.                       
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
ET0005     05  WK-MSD-FRAC-DECI-IND    PIC X         VALUE ' '.                 
           05  WK-MS-ASSET-TYPE        PIC X         VALUE '0'.                 
               88  WK-MS-NON-OPT       VALUE '0'.                               
               88  WK-MS-EQUITY-OPT    VALUE '1'.                               
               88  WK-MS-NON-EQU-OPT   VALUE '2'.                               
           05  WK-MS-BOND-IND          PIC X         VALUE ' '.                 
               88  WK-MS-BEARER-BOND   VALUE 'B'.                               
               88  WK-MS-REGISTER-BOND VALUE 'R'.                               
           05  WK-MS-SYMBOL-9                        VALUE ' '.                 
               10  WK-MS-SYMBOL        PIC X(6).                                
               10  WK-FILLER           PIC X(3).                                
           05  WK-MS-CUSIP             PIC X(9)      VALUE SPACE.               
LRM038     05  WK-MS-ISIN              PIC X(12)     VALUE SPACE.               
           05  WK-MS-OPT-MMY                         VALUE ZERO.                
               10  WK-MS-OPT-MM        PIC X(2).                                
               10  WK-MS-OPT-Y         PIC X(1).                                
           05  WK-MS-EXP-DATE          PIC 9(8)      VALUE ZERO.                
           05  FILLER                  REDEFINES WK-MS-EXP-DATE.                
               10  FILLER              PIC 9(3).                                
               10  WK-MS-EXP-Y         PIC X(1).                                
               10  WK-MS-EXP-MM        PIC X(2).                                
               10  FILLER              PIC 9(2).                                
LRM023     05  FILLER REDEFINES WK-MS-EXP-DATE.                                 
LRM023         10  WK-MS-EXP-CC-NEW    PIC X(2).                                
LRM023         10  WK-MS-EXP-YY-NEW    PIC X(2).                                
LRM023         10  WK-MS-EXP-MM-NEW    PIC X(2).                                
LRM023         10  WK-MS-EXP-DD-NEW    PIC X(2).                                
           05  WK-MS-OPT-PRICE         PIC S9(4)V9(5) VALUE ZERO.               
           05  FILLER                  REDEFINES WK-MS-OPT-PRICE.               
               10  WK-MS-OPT-PRC       PIC 9(4).                                
               10  WK-MS-OPT-FRAC      PIC 9(5).                                
           05  WK-MS-OPT-FRAC-6        PIC 9(6) VALUE ZEROS.                    
           05  FILLER REDEFINES    WK-MS-OPT-FRAC-6.                            
               10  WK-MS-OPT-FRAC-1    PIC 9.                                   
               10  FILLER              PIC 9(5).                                
LRM023     05  WK-MS-OPT-PRICE-NEW     PIC S9(5)V9(3) VALUE ZERO.               
LRM023     05  FILLER                  REDEFINES WK-MS-OPT-PRICE-NEW.           
LRM023         10  WK-MS-OPT-PRC-NEW   PIC 9(5).                                
LRM023         10  WK-MS-OPT-FRAC-NEW  PIC 9(3).                                
ET0005     05  WK-MS-OPT-DECI-ROUNDED  PIC 9(2).                                
LRM054     05  WK-MS-OPTION-FACTOR     PIC S9(7)V9(8)  COMP-3.                  
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
DJ0008     05  WK-MS-CLOSING-PRICE     PIC 9(8)V9(7) COMP-3 VALUE ZERO.         
                                                                                
DJ0014     05  W-FRACTION-EQUITY-IND   PIC X(1) VALUE ' '.                      
DJ0014         88  W-FRACTION-EQUITY            VALUE 'Y'.                      
DJ0014         88  W-NOT-FRACTION-EQUITY        VALUE 'N'.                      
                                                                                
           05  WK-MS-DESC1                           VALUE SPACE.               
               10  WK-MS-PUT-CALL      PIC X(4).                                
               10  FILLER              PIC X(26).                               
           05  WK-MS-DESC2             PIC X(30)     VALUE SPACE.               
           05  WK-MS-DESC3             PIC X(30)     VALUE SPACE.               
           05  W-POS-DESC4             PIC X(30) VALUE ' '.                     
           05  W-POS-DESC5.                                                     
               10  FILLER              PIC X(08) VALUE 'ADP-SEC:'.              
               10  W-POS-DESC5-SEC     PIC X(07) VALUE ' '.                     
               10  W-POS-DESC5-FIL     PIC X(05) VALUE ' '.                     
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
LRM023     05  W-OPT-DESC-NEW REDEFINES W-OPT-DESC.                             
LRM023         07  FILLER                PIC X(22).                             
LRM023         07  W-OPT-UNDLY-SYMBOL    PIC X(06).                             
LRM023         07  FILLER                PIC X(02).                             
LRM023         07  W-OPT-EXPTN-MM-NEW    PIC X(02).                             
LRM023         07  W-OPT-EXPTN-S1-NEW    PIC X(01).                             
LRM023         07  W-OPT-EXPTN-DD-NEW    PIC X(02).                             
LRM023         07  W-OPT-EXPTN-S2-NEW    PIC X(01).                             
LRM023         07  W-OPT-EXPTN-YY-NEW    PIC X(02).                             
LRM023         07  FILLER                PIC X(01).                             
LRM023         07  W-OPT-STRIKE-PRIC-NEW PIC ZZZZ9.                             
LRM023         07  FILLER                PIC X(01).                             
LRM023         07  W-OPT-STRIKE-FRAC-NEW PIC X(03).                             
LRM023         07  FILLER                PIC X(12).                             
                                                                                
LRM028     05  W-BOND-EXP-ACT            PIC  X(001) VALUE '0'.                 
LRM028     05  W-NUM-BOND-TO-EXP         PIC  9(003) VALUE 0.                   
LRM028     05  W-CLIENT-NBR-AUD          PIC  X(004).                           
LRM028     05  FILLER REDEFINES W-CLIENT-NBR-AUD.                               
LRM028         10  W-CLIENT-NBR-AUD-PFX  PIC  X(001).                           
LRM028         10  W-CLIENT-NBR-AUD-SFX  PIC  X(003).                           
LRM028     05  WK-BOND-EXP-DATE        PIC 9(8).                                
LRM028     05  WK-MS-BOND-EXP-DATE-DB2.                                         
LRM028         10  WK-MS-BOND-EXP-CCYY   PIC X(4).                              
LRM028         10  FILLER                PIC X(1) VALUE '-'.                    
LRM028         10  WK-MS-BOND-EXP-MM     PIC X(2).                              
LRM028         10  FILLER                PIC X(1) VALUE '-'.                    
LRM028         10  WK-MS-BOND-EXP-DD     PIC X(2).                              
                                                                                
LRM029     05  WK-TODAY-DB2              PIC X(10).                             
LRM029     05  FILLER REDEFINES WK-TODAY-DB2.                                   
LRM029         10  WK-TODAY-DB2-CCYY     PIC X(4).                              
LRM029         10  WK-TODAY-DB2-DASH1    PIC X(1).                              
LRM029         10  WK-TODAY-DB2-MM       PIC X(2).                              
LRM029         10  WK-TODAY-DB2-DASH2    PIC X(1).                              
LRM029         10  WK-TODAY-DB2-DD       PIC X(2).                              
       01  OPT-WORK-AREA.                                                       
           05  SUB2               PIC 9(02) COMP-3 VALUE 0.                     
           05  SUB3               PIC 9(02) COMP-3 VALUE 0.                     
           05  OPT-SYMBOL         PIC X(03).                                    
           05  OPTION-SYMBOL   REDEFINES OPT-SYMBOL                             
                                  PIC X(01) OCCURS 3 TIMES.                     
           05  OPTION-SYMBOL1     PIC X(01) OCCURS 3 TIMES.                     
           05  OPT-WORK1          PIC X(12).                                    
           05  OPT-WORK2   REDEFINES  OPT-WORK1.                                
             10  OPT-WORK3        PIC X(01) OCCURS 12 TIMES.                    
                                                                                
DJ0005 01  W-SEC-TO-BYPASS.                                                     
DJ0005     05 W-SEC-TO-BYPASS-FIELD   PIC  X(007).                              
DJ0005        88 W-IRA-SECURITY          VALUE '8660000' THRU '8661299',        
LRM036                                         '8667000' THRU '8668799'.        
DJ0005********                                 '8667003' THRU '8667010',        
DJ0005********                                 '8667101' THRU '8667125',        
DJ0005********                                 '8667203' THRU '8667250',        
DJ0006********                                 '8667304' THRU '8667310',        
DJ0005********                                 '8667338' THRU '8667339',        
DJ0005********                                 '8667800' THRU '8668799'.        
DJ0005        88 W-ANNUITY-SECURITY      VALUE '8S15113'.                       
DJ0005        88 W-SPAD-SECURITY         VALUE '9997292' THRU '9999999'.        
DJ0005        88 W-MONEY-MARKET-SECURITY VALUE 'A000015',     'A000017',        
DJ0005                                         'A000026' THRU 'A000029',        
DJ0005                                         'A000031',     'A000039',        
DJ0005                                         'A000046' THRU 'A000999'.        
LRM035 COPY MMFVALID.                                                           
                                                                                
      ** SAVE IMPORTANT FIELDS HERE SO THE LOGIC CAN BE GENERIC.                
       01  W-FETCH-AREA.                                                        
           05  WF-CLIENT-NBR          PIC X(4).                                 
           05  WF-BRANCH-CD           PIC X(3).                                 
           05  WF-ACCT-CD             PIC X(5).                                 
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
           05  WF-STTLM-DT            PIC X(10).                                
           05  WF-ISIN-SEC-ISSUE-CD   PIC X(09).                                
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
                                                                                
       01  W-CURRENT-AREA.                                                      
           05  W-CURRENT-CLIENT          PIC X(004).                            
           05  W-CURRENT-CLIENT-N REDEFINES                                     
               W-CURRENT-CLIENT          PIC 9(004).                            
           05  W-CURRENT-BROKER          PIC X(004).                            
           05  W-CURRENT-STREAM          PIC X(001).                            
      /                                                                         
           COPY ACATRCRF REPLACING ==:ACATRCRF:== BY ==TI-RCRA==.               
      /                                                                         
           COPY ACATRCRF REPLACING ==:ACATRCRF:== BY ==ACATRCRF==.              
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'CP2WS   '.           
       01  W-HDR-TRL-LEN                 PIC 9(005) VALUE 120.                  
                                                                                
           COPY CP2WS.                                                          
      /                                                                         
LRM052*****COPY HOLDAVSM.                                                       
LRM052 01  FILLER                        PIC X(08) VALUE 'CUSHOL  '.            
LRM052 01  WS-CUSHOL-AREA.                                                      
LRM052     COPY CUSHOL REPLACING ==:CUSHOL:== BY ==CUSHOL==.                    
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'W-MRGIMM'.           
       01  W-MRGIMM-FIELDS.                                                     
           05  MRGIMM-STATUS             PIC X(002).                            
               88 VALID-MRGIMM-STATUS    VALUE '00' '04' '10' '23'.             
               88 MRGIMM-OKAY            VALUE '00' THRU '09', '97'.            
               88 MRGIMM-END-OF-FILE     VALUE '10'.                            
               88 MRGIMM-NOT-FOUND       VALUE '23'.                            
               88 MRGIMM-EMPTY-MISSING   VALUE '35'.                            
           05  W-MRGIMM-CNT              PIC  9(009) VALUE 0.                   
           05  W-MRGIMM-FND-CNT          PIC  9(009) VALUE 0.                   
           05  W-MRGIMM-NOTFND-CNT       PIC  9(009) VALUE 0.                   
           05  W-MRGIMM-FND-SW           PIC X(01).                             
               88  W-MRGIMM-FOUND                    VALUE 'Y'.                 
           05  W-MRGIMM-MEMO-FND-SW      PIC X(01).                             
               88  W-MRGIMM-MEMO-FOUND               VALUE 'Y'.                 
           05  W-MRGIMM-N4-FND-SW        PIC X(01).                             
               88  W-MRGIMM-N4-FOUND                 VALUE 'Y'.                 
           05  W-MM-SUB           PIC 9(03) COMP-3 VALUE 0.                     
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'POSMEMO='.            
           COPY  POSMEMOR REPLACING ==:POSMEMO:== BY ==MRGI==.                  
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.            
           COPY GETMSDCE.                                                       
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'GETNACOB'.            
           COPY GETNACOB.                                                       
                                                                                
       01  GETNA-SEGMENT-INCLUDES.                                              
           COPY NASEGPPA.                                                       
           COPY NASEGEND.                                                       
                                                                                
LRM041*****COPY MMFSUB.                                                         
ET0002/                                                                         
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.            
           COPY BHINFO.                                                         
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.            
           COPY BHACAT.                                                         
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'BHBTS2  '.            
           COPY BHBTS2.                                                         
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
           COPY BPDATESC.                                                       
      /                                                                         
CSG002******************************************************************        
CSG002* ACATS VALID CHARACTER SET FROM "ACATS USER GUIDE (SECTION 19)" *        
CSG002******************************************************************        
CSG002 01  FILLER                        PIC X(08) VALUE 'CATVCHAR'.            
CSG002     COPY CATVCHAR.                                                       
CSG002/                                                                         
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
           05  W-COMMIT-CTR              PIC  9(009) COMP-3                     
                                              VALUE 0.                          
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.                   
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC ---9.                              
           05  W-TFR-SQLCODE             PIC S9(9) COMP-4.                      
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
      /                                                                         
      ******************************************************************        
      * DB2 COMMAREA                                                   *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.           
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
      /                                                                         
DJ0012******************************************************************        
DJ0012* TRANSFER INIT   TABLE                                          *        
DJ0012******************************************************************        
DJ0012 01  FILLER                        PIC X(008) VALUE 'ACTITRF'.            
DJ0012     EXEC SQL INCLUDE ACTITRF      END-EXEC.                              
                                                                                
      ******************************************************************        
      * TRANSFER ACTIVE TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VTRNFR'.             
           EXEC SQL INCLUDE VTRNFR       END-EXEC.                              
                                                                                
      ******************************************************************        
      * RESTRICTED SECURITY TABLE                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VRSTSEC '.           
           EXEC SQL INCLUDE VRSTSEC      END-EXEC.                              
                                                                                
LRM005******************************************************************        
LRM005* RESTRICTED SECURITY BLOCK TABLE                                *        
LRM005******************************************************************        
LRM005 01  FILLER                        PIC X(008) VALUE 'VRSDBLK '.           
LRM005     EXEC SQL INCLUDE VRSDBLK      END-EXEC.                              
                                                                                
      ******************************************************************        
      * RESTRICTED BROKER   TABLE                                      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VRSTBRKR'.           
           EXEC SQL INCLUDE VRSTBRKR     END-EXEC.                              
                                                                                
      ******************************************************************        
      * RESIDUAL CREDIT - BYPASS THIS ACCOUNT/SECURITY                 *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VRSDSEC '.           
           EXEC SQL INCLUDE VRSDSEC      END-EXEC.                              
                                                                                
      ******************************************************************        
      * RESIDUAL CREDIT - BYPASS THIS ACCOUNT IF NO VRSDSEC FOUND      *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VRSDACC '.           
           EXEC SQL INCLUDE VRSDACC      END-EXEC.                              
                                                                                
DJ0010******************************************************************        
DJ0010* ASSET DELIVERY RULE - MMF DELIVER AS CASH                      *        
DJ0010******************************************************************        
DJ0010 01  FILLER                        PIC X(008) VALUE 'ACTRBSC '.           
DJ0010     EXEC SQL INCLUDE ACTRBSC      END-EXEC.                              
      /                                                                         
      ******************************************************************        
      * TRANSFER HISTORY TABLE                                         *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VTRNHSTY'.           
           EXEC SQL INCLUDE VTRNHSTY     END-EXEC.                              
                                                                                
LRM028******************************************************************        
LRM028* MSD MATURITY DATE LOOKUP                                       *        
LRM028******************************************************************        
LRM028 01  FILLER                        PIC X(008) VALUE 'VBNDDT  '.           
LRM028     EXEC SQL INCLUDE VBNDDT       END-EXEC.                              
                                                                                
LRM029******************************************************************        
LRM029* MSD CALLED BOND LOOKUP                                         *        
LRM029******************************************************************        
LRM029 01  FILLER                        PIC X(008) VALUE 'VBNDDT  '.           
LRM029     EXEC SQL INCLUDE VBNDFTRV     END-EXEC.                              
      /                                                                         
      ******************************************************************        
      * DECLARE CURSOR FOR HISTORY TRANSFER TABLE                      *        
      * TO GET ALL FULL DELIVER TRANSFERS IN STATUS 310                *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'CURSOR'.             
           EXEC SQL                                                             
                DECLARE VTRNHSTY_CURSOR CURSOR WITH HOLD FOR                    
                SELECT                                                          
                    CLIENT_NBR                                                  
                   ,ACAT_CONTROL_NBR                                            
                   ,SBMTG_PRTCP_NBR                                             
                   ,DLVR_NBR                                                    
                   ,ACCT_DLVR_NBR                                               
                   ,RCV_NBR                                                     
                   ,ACCT_RCV_NBR                                                
                   ,TRNFR_TYPE_CD                                               
                   ,TRANS_TYPE_CD                                               
                   ,RCV_CUST_NM                                                 
                   ,RCV_SS_PRIM_NBR                                             
                   ,RCV_SS_SCNDY_NBR                                            
                   ,RCV_ACCT_TYPE_CD                                            
                   ,RCV_OCC_BRKR_NBR                                            
                   ,RCV_CRSPN_NBR                                               
                   ,ACAT_CNTL_ASTD_NBR                                          
                   ,PRCS_DT                                                     
                   ,STTS_CD                                                     
                   ,STTLM_TM_CD                                                 
                   ,VAL_FREE_CD                                                 
                   ,TRANS_RFRN_ID_CD                                            
                   ,DB_CR_CD                                                    
                   ,DSTBN_SIDE_CD                                               
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRNFR_TYPE_RJC1_CD                                          
                   ,TRNFR_TYPE_RJC2_CD                                          
                   ,TRNFR_TYPE_RJCT_CD                                          
                   ,RR_CD                                                       
                   ,BRANCH_CD                                                   
                   ,PRTCP_CONTRA_CD                                             
                   ,ACCT_DPLCT_TRN_IND                                          
                   ,NSCC_NON_ADP_IND                                            
                   ,DAYS_STTS_QTY                                               
                   ,STTLM_DT                                                    
                   ,ACCT_NA_UPDT_IND                                            
                   ,ACCT_CD                                                     
                   ,STTLM_ASCTD_DT                                              
                   ,NSCC_PEND_CD                                                
                   ,PRGM_NM                                                     
                   ,CRT_TMSTP                                                   
                   ,UPDT_TMSTP                                                  
                   ,ACCT_EQUITY_AMT                                             
LRM024             ,CVRSN_ACCT_NBR                                              
                FROM    VTRNHSTY                                                
                                                                                
                WHERE   CLIENT_NBR    = :W-CURRENT-CLIENT    AND                
                        DLVR_NBR      = :W-CURRENT-BROKER    AND                
                        TRNFR_TYPE_CD = 'FUL'                AND                
                       (STTS_CD       = '310')               AND                
                       (TRANS_TYPE_CD      <> 'R')           AND                
                       (SYS_ACT_CD         <> '2')                              
ET0006**               (ACCT_DPLCT_TRN_IND <> 'Y')                              
                                                                                
                ORDER BY                                                        
                        BRANCH_CD        ASC                                    
                       ,ACCT_CD          ASC                                    
                       ,ACAT_CONTROL_NBR DESC                                   
                                                                                
           END-EXEC.                                                            
DJ0002******************CLIENT_NBR       ASC                                    
                                                                                
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
           DISPLAY 'CAT812A- RESIDUAL CREDIT EXTRACT BAL AND POSITIONS'.        
           DISPLAY '         THE OUTPUT IS PASSED TO CAT812 TO LOAD DB2'        
           DISPLAY '         AND TO CAT813 TO PRINT REPORTS'                    
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT.                          
                                                                                
           SORT SORT-FILE ON ASCENDING SORT-KEY                                 
                INPUT  PROCEDURE IS 2000-SORT-INPUT  THRU 2000-EXIT             
                OUTPUT PROCEDURE IS 7500-SORT-OUTPUT THRU 7500-EXIT.            
                                                                                
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
               DISPLAY 'CAT812A: W-CURRENT-TIMESTAMP = '                        
                                                    W-CURRENT-TIMESTAMP         
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT812A: W-CURRENT-TIMESTAMP NOT SET'                   
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
           ACCEPT W-SYS-DATE              FROM DATE.                            
           ACCEPT W-SYS-TIME              FROM TIME.                            
           DISPLAY 'CAT812A: SYS-DATE ' W-SYS-DATE                              
                           ' SYS-TIME ' W-SYS-TIME.                             
                                                                                
           DISPLAY 'CAT812A: L-STREAM         = '                               
                             L-STREAM                                           
           DISPLAY 'CAT812A: L-BYP-DATECHK-SW = '                               
                             L-BYP-DATECHK-SW                                   
           ' (1=BYPASS DATE CHECK)'                                             
           DISPLAY 'CAT812A: L-BYP-FILECHK-SW = '                               
                             L-BYP-FILECHK-SW                                   
           ' (1=BYPASS FILE CHECK. BYPASS EMPTY FILE,DB2 ABENDS.)'              
           DISPLAY 'CAT812A: L-RERUN-SW       = '                               
                             L-RERUN-SW                                         
           ' (1=THIS IS A RERUN. ALLOW DUPES AND NOTFNDS.)'                     
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT812A: DATE CHECK WILL BE BYPASSED'                   
           ELSE                                                                 
               DISPLAY 'CAT812A: DATE CHECK WILL BE PERFORMED'                  
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT812A: FILE CHECK WILL BE BYPASSED'                   
           ELSE                                                                 
               DISPLAY 'CAT812A: FILE CHECK WILL BE PERFORMED'                  
           END-IF.                                                              
           IF  L-RERUN                                                          
               DISPLAY ' '                                                      
               DISPLAY '*--------------------------------------------*'         
               DISPLAY 'CAT812A: THIS IS A RERUN.'                              
               DISPLAY '*--------------------------------------------*'         
               DISPLAY ' '                                                      
           END-IF.                                                              
                                                                                
           MOVE 'CAT812A'                 TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
           CALL ZBPDATES-PROGRAM USING BPDATES-PARAMETERS.                      
           MOVE BPD-PROC-DATE             TO W-BPD-PROC-DATE.                   
LRM029     MOVE BPD-PROC-DATE(1:4)        TO WK-TODAY-DB2-CCYY.                 
LRM029     MOVE BPD-PROC-DATE(5:2)        TO WK-TODAY-DB2-MM.                   
LRM029     MOVE BPD-PROC-DATE(7:2)        TO WK-TODAY-DB2-DD.                   
LRM029     MOVE '-'                       TO WK-TODAY-DB2-DASH1                 
LRM029                                       WK-TODAY-DB2-DASH2.                
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT812A:       BPD-PROC-DATE=' BPD-PROC-DATE                
                             ' W-BPD-PROC-DATE-X=' W-BPD-PROC-DATE-X            
           DISPLAY 'CAT812A: BPD-PRIOR-PROC-DATE=' BPD-PRIOR-PROC-DATE          
           DISPLAY ' '.                                                         
                                                                                
           MOVE '000'                  TO BH-BROKER-NUMBER                      
                                                                                
ET0002     OPEN INPUT MMF-FILE.                                                 
ET0002     PERFORM 2600-READ-MMF-FILE                                           
ET0002        THRU 2600-EXIT.                                                   
ET0002                                                                          
ET0004     MOVE 'O'    TO GETVBAL-FILE                                          
ET0004     MOVE 'O'    TO GETVBAL-FUNC                                          
ET0004     PERFORM 9500-CALL-GETVBAL                                            
ET0004     DISPLAY 'CAT812A: ZGETVBAL OPENED FOR INPUT.  STATUS = '             
                                              BALNC-STATUS                      
                                                                                
           IF  BALNC-OKAY                                                       
               CONTINUE                                                         
           ELSE                                                                 
ET0004         DISPLAY 'CAT812A: ERROR OPENING CUSBALV'                         
               DISPLAY 'CAT812A: OPEN STATUS = ' BALNC-STATUS                   
               DISPLAY 'CAT812A: U3001 - ABENDING ON BAD FILE STATUS'           
               MOVE +3001 TO ABEND-CODE                                         
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
ET0004     MOVE LOW-VALUES TO GETVHOL-PARM                                      
ET0004     MOVE 'CAT812A'  TO GETVHOL-CALLING-PROGRAM                           
ET0004     MOVE 'N'        TO GETVHOL-FILE                                      
ET0004     MOVE 'O'        TO GETVHOL-FUNC                                      
ET0004     PERFORM 9600-CALL-GETVHOL                                            
           DISPLAY 'CAT812A: POSVSAM  OPENED FOR INPUT.  STATUS = '             
                                              POSVSAM-STATUS                    
                                                                                
           IF  POSVSAM-OKAY                                                     
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT812A: ERROR OPENING POSVSAM'                         
               DISPLAY 'CAT812A: OPEN STATUS = ' POSVSAM-STATUS                 
               DISPLAY 'CAT812A: U3001 - ABENDING ON BAD FILE STATUS'           
               MOVE +3001 TO ABEND-CODE                                         
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           OPEN INPUT MRGIMM.                                                   
           DISPLAY 'CAT812A: MRGIMM   OPENED FOR INPUT.  STATUS = '             
                                              MRGIMM-STATUS                     
                                                                                
           IF  MRGIMM-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT812A: ERROR OPENING MRGIMM'                          
               DISPLAY 'CAT812A: OPEN STATUS = ' MRGIMM-STATUS                  
               DISPLAY 'CAT812A: U3001 - ABENDING ON BAD FILE STATUS'           
               MOVE +3001 TO ABEND-CODE                                         
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           OPEN OUTPUT ACATRCRF.                                                
           DISPLAY 'CAT812A: ACATRCRF OPENED FOR OUTPUT. STATUS = '             
                                               ACATRCRF-FILE-STATUS.            
                                                                                
           IF  ACATRCRF-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT812A: ERROR OPENING ACATRCRF'                        
               DISPLAY 'CAT812A: OPEN STATUS = ' ACATRCRF-FILE-STATUS           
                            '.  OUTPUT-CNT = ' W-ACATRCRF-CNT                   
               DISPLAY 'CAT812A: U3001 - ABENDING ON BAD FILE STATUS'           
               MOVE +3001 TO ABEND-CODE                                         
               CALL ABEND-PROGRAM USING ABEND-CODE                              
           END-IF.                                                              
                                                                                
           PERFORM 1500-LOAD-B1 THRU 1500-EXIT.                                 
                                                                                
           MOVE SPACES                 TO   GETNA-PARAMETERS.                   
           MOVE 'CAT812A'              TO   GETNA-PGM-NAME.                     
           MOVE 'R'                    TO   GETNA-REQ-FUNC.                     
           MOVE 'R'                    TO   GETNA-REQ-FILE.                     
           MOVE 'R'                    TO   GETNA-REQ-FUNC2.                    
           MOVE 'N'                    TO   GETNA-REQ-YEAREND.                  
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT. EXIT.                                                         
      /                                                                         
       1500-LOAD-B1 SECTION.                                                    
           DISPLAY 'CAT812A: 1500-LOAD-B1'.                                     
                                                                                
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
      ******************************************************************        
      *  GET CLIENT FOR THIS STREAM, AND FETCH TRANSFERS                        
      ******************************************************************        
       2000-SORT-INPUT SECTION.                                                 
           MOVE '2000-SORT-INPUT         ' TO W-ROUTINE-1.                      
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1                                   
              UNTIL B1-SUB > 500                                                
                                                                                
              IF  B1-STREAM      (B1-SUB) = L-STREAM                            
              AND B1-STATUS      (B1-SUB) = 'A'                                 
              AND B1-ACAT-STATUS (B1-SUB) = 'A'                                 
              AND B1-BKR-CLR-NO  (B1-SUB) > ' '                                 
                  MOVE B1-ADP-CL-NO  (B1-SUB) TO W-CURRENT-CLIENT-N             
                  MOVE B1-BKR-CLR-NO (B1-SUB) TO W-CURRENT-BROKER               
                  MOVE B1-STREAM     (B1-SUB) TO W-CURRENT-STREAM               
                  PERFORM 2500-GETB1         THRU 2500-EXIT                     
                  IF  BH-ACAT-RESID-CRD-BEGIN-DAYS  > 0                         
                  AND BH-ACAT-RESID-CRD-NUMBER-DAYS > 0                         
                      PERFORM 3000-FETCH-TRANFER THRU 3000-EXIT                 
                  ELSE                                                          
                  DISPLAY '       BYPASS THIS CLIENT. B1#434536 NOT ON'         
                  END-IF                                                        
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
       2000-EXIT. EXIT.                                                         
      /                                                                         
       2500-GETB1          SECTION.                                             
                                                                                
DJ0002**-- CLIENT BREAK.                                                        
                                                                                
           MOVE ' '                        TO BH-BROKER-HEADER-INFO             
                                              BH-ACAT-INFO                      
                                              BH-BTS2-INFO                      
DJ0002     MOVE 0                          TO W-EXC-NUMBER-DAYS                 
DJ0002     MOVE 00000000                   TO W-EXC-DATE                        
                                                                                
           MOVE W-CURRENT-CLIENT (2:3)     TO BH-BROKER-NUMBER                  
           MOVE '015'                      TO BH-LOGICAL-RECORD-CODE            
           MOVE '434500'                   TO BH-B2-INFO-ID                     
           CALL ZGETB1V-PROGRAM         USING BH-BROKER-HEADER-INFO,            
                                              BH-ACAT-INFO                      
           END-CALL.                                                            
                                                                                
           MOVE '511000'                   TO BH-B2-INFO-ID                     
           CALL ZGETB1V-PROGRAM         USING BH-BROKER-HEADER-INFO,            
                                              BH-BTS2-INFO                      
           END-CALL.                                                            
                                                                                
           MOVE BH-BROKER-OLD-CLEARING-HOUSE(2:4) TO W-CURRENT-BROKER           
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'NEW-CLIENT = ' BH-BROKER-NUMBER                             
                                       ' ' BH-BROKER-NAME                       
                               ' BRK-NO= ' BH-BROKER-OLD-CLEARING-HOUSE         
           DISPLAY 'CAT812A: BH-ACAT-STATUS                 (434501) = '        
                             BH-ACAT-STATUS                                     
           DISPLAY 'CAT812A: BH-ACAT-LIQUIDATE-MMF          (434510) = '        
                             BH-ACAT-LIQUIDATE-MMF                              
           DISPLAY 'CAT812A: BH-ACAT-TYPE-3-BALANCES        (434512) = '        
                             BH-ACAT-TYPE-3-BALANCES                            
           DISPLAY 'CAT812A: BH-ACAT-WH-ASSET-CONTRA-CUSIP  (434517) = '        
                             BH-ACAT-WH-ASSET-CONTRA-CUSIP                      
           DISPLAY 'CAT812A: BH-ACAT-FRACT-ON-CNS-ELIG-SEC  (434521) = '        
                             BH-ACAT-FRACT-ON-CNS-ELIG-SEC                      
           DISPLAY 'CAT812A: BH-ACAT-WHOLD-STK-REC-MEMO-NO  (434533) = '        
                             BH-ACAT-WHOLD-STK-REC-MEMO-NO                      
           DISPLAY 'CAT812A: BH-ACAT-WHOLD-STK-REC-MEMO     (434533) = '        
                             BH-ACAT-WHOLD-STK-REC-MEMO (1:60)                  
           DISPLAY 'CAT812A: BH-ACAT-RESID-CRD-BEGIN-DAYS   (434536) = '        
                             BH-ACAT-RESID-CRD-BEGIN-DAYS                       
           DISPLAY 'CAT812A: BH-ACAT-RESID-CRD-NUMBER-DAYS  (434536) = '        
                             BH-ACAT-RESID-CRD-NUMBER-DAYS                      
           IF  BH-ACAT-RESID-CRD-DISPL-ONLINE = '1'                             
           DISPLAY 'CAT812A: BH-ACAT-RESID-CRD-DISPL-ONLINE (434536) = '        
                             BH-ACAT-RESID-CRD-DISPL-ONLINE                     
                             '  (AUTO-SUBMIT)'                                  
           ELSE                                                                 
           DISPLAY 'CAT812A: BH-ACAT-RESID-CRD-DISPL-ONLINE (434536) = '        
                             BH-ACAT-RESID-CRD-DISPL-ONLINE                     
                            '   (HOLD)'                                         
           END-IF.                                                              
           DISPLAY 'CAT812A: BH-ACAT-RESID-CRD-DEFLT-CODE   (434536) = '        
                             BH-ACAT-RESID-CRD-DEFLT-CODE                       
DJ0002     DISPLAY 'CAT812A: BH-ACAT-RESIDUAL-CR-NON-DEL    (434527) = '        
DJ0002                       BH-ACAT-RESIDUAL-CR-NON-DEL                        
DJ0002     DISPLAY 'CAT812A: BH-ACAT-RESIDUAL-CR-EQUITY-IND (434658) = '        
DJ0002                       BH-ACAT-RESIDUAL-CR-EQUITY-IND                     
DJ0002     DISPLAY 'CAT812A: BH-ACAT-RESIDUAL-CR-EQUITY-AMT (434658) = '        
DJ0002                       BH-ACAT-RESIDUAL-CR-EQUITY-AMT                     
DJ0002     DISPLAY 'CAT812A: BH-ACAT-RESIDUAL-CR-STL-DT-IND (434659) = '        
DJ0002                       BH-ACAT-RESIDUAL-CR-STL-DT-IND                     
DJ0002     DISPLAY 'CAT812A: BH-ACAT-RESIDUAL-CR-STL-DT-DAY (434659) = '        
DJ0002                       BH-ACAT-RESIDUAL-CR-STL-DT-DAY                     
ET0001     DISPLAY 'CAT812A: BH-ACAT-BALANCE-ADJUSTMENT     (434675) = '        
ET0001                       BH-ACAT-BALANCE-ADJUSTMENT                         
LRM005     DISPLAY 'CAT812A: BH-ACAT-LEGAL-BLOCK-IND        (434677) = '        
LRM005                       BH-ACAT-LEGAL-BLOCK-IND                            
LRM005     DISPLAY 'CAT812A: BH-ACAT-CLIENT-RESCIND-IND     (434678) = '        
LRM005                       BH-ACAT-CLIENT-RESCIND-IND                         
LRM005     DISPLAY 'CAT812A: BH-ACAT-BLOCK-SECURITY-IND     (434679) = '        
LRM005                       BH-ACAT-BLOCK-SECURITY-IND                         
DJ0011     DISPLAY 'CAT812A: BH-ACAT-RCR-SETTLE-DATE-POS    (434737) = '        
DJ0011                       BH-ACAT-RCR-SETTLE-DATE-POS                        
DJ0011     ' (1 = USE SETTLEMENT DATE POSITIONS INSTEAD OF TRADE DATE)'         
           DISPLAY 'CAT812A: BH-BTS2-ACAT-SK-MEMO-OVERRIDE  (511220) = '        
                             BH-BTS2-ACAT-SK-MEMO-OVERRIDE                      
                                                                                
           IF  BH-ACAT-RESID-CRD-BEGIN-DAYS  NOT NUMERIC                        
               MOVE 0 TO BH-ACAT-RESID-CRD-BEGIN-DAYS                           
           END-IF.                                                              
                                                                                
           IF  BH-ACAT-RESID-CRD-NUMBER-DAYS NOT NUMERIC                        
               MOVE 0 TO BH-ACAT-RESID-CRD-NUMBER-DAYS                          
           END-IF.                                                              
                                                                                
           IF  BH-ACAT-RESID-CRD-BEGIN-DAYS > 0                                 
               MOVE  'D'                 TO  BPDATES-REQ-TYPE                   
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*        MOVE  'US'                TO  BPDATES-CALENDAR-TYPE              
               MOVE  '  '                TO  BPDATES-CALENDAR-TYPE              
               MOVE  W-BPD-PROC-DATE     TO  BPDATES-BASE-DATE                  
               MOVE  'M'                 TO  BPDATES-DTSEARCH-IND               
               MOVE  'C'                 TO  BPDATES-DTSEARCH-TYPE              
               MOVE  BH-ACAT-RESID-CRD-BEGIN-DAYS                               
                                         TO  BPDATES-DTSEARCH-DISP              
               CALL ZBPDATES-PROGRAM  USING  BPDATES-PARAMETERS                 
               IF  NOT BPD-VALID-RETURN                                         
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' ZBPDATES(1) RETURN CODE = '                         
                        BPDATES-RETURN-CODE ' ABENDING '                        
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' BASE DATE ' BPDATES-BASE-DATE                       
                           ' DISPLACEMENT '  BPDATES-DTSEARCH-DISP              
                   MOVE +3250 TO ABEND-CODE                                     
                   CALL ABEND-PROGRAM USING ABEND-CODE                          
               END-IF                                                           
               MOVE BPD-DT-CALDATE       TO  W-BEGIN-DATE                       
           END-IF.                                                              
                                                                                
           IF  BH-ACAT-RESID-CRD-NUMBER-DAYS > 0                                
               MOVE  'D'                 TO  BPDATES-REQ-TYPE                   
CSG001*        MOVE  'US'                TO  BPDATES-CALENDAR-TYPE              
CSG001         MOVE  '  '                TO  BPDATES-CALENDAR-TYPE              
               MOVE  W-BPD-PROC-DATE     TO  BPDATES-BASE-DATE                  
               MOVE  'M'                 TO  BPDATES-DTSEARCH-IND               
               MOVE  'C'                 TO  BPDATES-DTSEARCH-TYPE              
               MOVE  BH-ACAT-RESID-CRD-NUMBER-DAYS                              
                                         TO  BPDATES-DTSEARCH-DISP              
               CALL ZBPDATES-PROGRAM  USING  BPDATES-PARAMETERS                 
               IF  NOT BPD-VALID-RETURN                                         
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' ZBPDATES(2) RETURN CODE = '                         
                            BPDATES-RETURN-CODE ' ABENDING '                    
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' BASE DATE ' BPDATES-BASE-DATE                       
                          ' DISPLACEMENT '  BPDATES-DTSEARCH-DISP               
                   MOVE +3250 TO ABEND-CODE                                     
                   CALL ABEND-PROGRAM USING ABEND-CODE                          
               END-IF                                                           
               MOVE BPD-DT-CALDATE       TO  W-END-DATE                         
           END-IF.                                                              
                                                                                
DJ0002     IF  BH-ACAT-RESIDUAL-CR-STL-DT-IND = '1'                             
DJ0002     AND BH-ACAT-RESIDUAL-CR-STL-DT-DAY NUMERIC                           
DJ0002         COMPUTE W-EXC-NUMBER-DAYS =                                      
DJ0002                 BH-ACAT-RESIDUAL-CR-STL-DT-DAY                           
DJ0002         MOVE  'D'                 TO  BPDATES-REQ-TYPE                   
CSG001*        MOVE  'US'                TO  BPDATES-CALENDAR-TYPE              
CSG001         MOVE  '  '                TO  BPDATES-CALENDAR-TYPE              
DJ0002         MOVE  W-BPD-PROC-DATE     TO  BPDATES-BASE-DATE                  
DJ0002         MOVE  'M'                 TO  BPDATES-DTSEARCH-IND               
DJ0002         MOVE  'C'                 TO  BPDATES-DTSEARCH-TYPE              
DJ0002         MOVE  BH-ACAT-RESIDUAL-CR-STL-DT-DAY                             
DJ0002                                   TO  BPDATES-DTSEARCH-DISP              
DJ0002         CALL ZBPDATES-PROGRAM  USING  BPDATES-PARAMETERS                 
DJ0002         IF  NOT BPD-VALID-RETURN                                         
DJ0002             DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0002                    ' ZBPDATES(3) RETURN CODE = '                         
DJ0002                      BPDATES-RETURN-CODE ' ABENDING '                    
DJ0002             DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0002                    ' BASE DATE ' BPDATES-BASE-DATE                       
DJ0002                    ' DISPLACEMENT '  BPDATES-DTSEARCH-DISP               
DJ0002             MOVE +3250 TO ABEND-CODE                                     
DJ0002             CALL ABEND-PROGRAM USING ABEND-CODE                          
DJ0002         END-IF                                                           
DJ0002         MOVE BPD-DT-CALDATE       TO  W-EXC-DATE                         
DJ0002     END-IF.                                                              
DJ0002     DISPLAY 'CAT812A: W-BEGIN-DATE = ' W-BPD-PROC-DATE ' - '             
DJ0002              BH-ACAT-RESID-CRD-BEGIN-DAYS  '  = ' W-BEGIN-DATE           
DJ0002            ' FOR RCR PROCESSING'                                         
DJ0002     DISPLAY 'CAT812A: W-END-DATE   = ' W-BPD-PROC-DATE ' - '             
DJ0002              BH-ACAT-RESID-CRD-NUMBER-DAYS  ' = ' W-END-DATE             
DJ0002            ' FOR RCR PROCESSING'                                         
DJ0002     DISPLAY 'CAT812A: W-EXC-DATE   = ' W-BPD-PROC-DATE ' - '             
DJ0002              W-EXC-NUMBER-DAYS              ' = ' W-EXC-DATE             
DJ0002            ' FOR EXCEPTION REPORTING'                                    
DJ0002     IF  BH-ACAT-RESIDUAL-CR-NON-DEL = '1'                                
DJ0002         DISPLAY 'CAT812A: THIS CLIENT WANTS'                             
DJ0002                 ' SEPARATE NON-DELIVERABLE REPORT'                       
DJ0002     ELSE                                                                 
DJ0002         DISPLAY 'CAT812A: THIS CLIENT DOES NOT WANT'                     
DJ0002                 ' SEPARATE NON-DELIVERABLE REPORT'                       
DJ0002     END-IF.                                                              
DJ0002     IF  BH-ACAT-RESIDUAL-CR-EQUITY-IND = '0'                             
DJ0002     AND BH-ACAT-RESIDUAL-CR-STL-DT-IND = '0'                             
DJ0002         DISPLAY 'CAT812A: THIS CLIENT DOES NOT WANT'                     
DJ0002                 ' EXCEPTION REPORTING'                                   
DJ0002     ELSE                                                                 
DJ0002         IF  BH-ACAT-RESID-CRD-DISPL-ONLINE = '1'                         
DJ0002             DISPLAY 'CAT812A: THIS CLIENT WANTS'                         
DJ0002                 ' EXCEPTION REPORTING AND GETS IT.'                      
DJ0002         ELSE                                                             
DJ0002             DISPLAY 'CAT812A: THIS CLIENT IS NOT GETTING'                
DJ0002                 ' EXCEPTION REPORTING. NOT AUTO-SUBMIT.'                 
DJ0002         END-IF                                                           
DJ0002     END-IF.                                                              
LRM028     IF BH-ACAT-MATUR-CALL-BOND-DAYS NOT NUMERIC                          
LRM028        MOVE 0 TO BH-ACAT-MATUR-CALL-BOND-DAYS                            
LRM028     END-IF.                                                              
LRM028     MOVE BH-ACAT-MATUR-CALL-BOND-DAYS   TO W-NUM-BOND-TO-EXP.            
LRM028     MOVE BH-ACAT-MATUR-CALL-BOND-ACTION TO W-BOND-EXP-ACT.               
LRM028     MOVE 99991231 TO WK-BOND-EXP-DATE                                    
LRM028     IF W-BOND-EXP-ACT NOT = '0'                                          
LRM028       MOVE W-BPD-PROC-DATE           TO BPDATES-BASE-DATE                
LRM028       SET BPD-DISPLACEMENT-DATE-INFO TO TRUE                             
LRM028       SET BPD-DISP-PLUS              TO TRUE                             
LRM028       SET BPD-DISP-CALENDAR          TO TRUE                             
LRM028       MOVE W-NUM-BOND-TO-EXP         TO BPDATES-DTSEARCH-DISP            
CSG001*      MOVE 'US'                      TO BPDATES-CALENDAR-TYPE            
CSG001       MOVE '  '                      TO BPDATES-CALENDAR-TYPE            
LRM028       CALL  ZBPDATES-PROGRAM   USING BPDATES-PARAMETERS                  
LRM028       IF NOT BPD-VALID-RETURN                                            
LRM028           DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE                 
LRM028           DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE               
LRM028           DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE                
LRM028           DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG                 
LRM028       ELSE                                                               
LRM028           MOVE BPD-DT-CALDATE TO WK-BOND-EXP-DATE                        
LRM028       END-IF                                                             
LRM028     END-IF.                                                              
LRM028     MOVE WK-BOND-EXP-DATE(1:4) TO  WK-MS-BOND-EXP-CCYY                   
LRM028     MOVE WK-BOND-EXP-DATE(5:2) TO  WK-MS-BOND-EXP-MM                     
LRM028     MOVE WK-BOND-EXP-DATE(7:2) TO  WK-MS-BOND-EXP-DD                     
LRM028     DISPLAY 'CAT812A: BH-ACAT-MATUR-CALL-BOND-DAYS   (434748) = '        
LRM028                      BH-ACAT-MATUR-CALL-BOND-DAYS                        
LRM028     DISPLAY '        BH-ACAT-MATUR-CALL-BOND-ACTION  (434748) = '        
LRM028                      BH-ACAT-MATUR-CALL-BOND-ACTION                      
LRM028     DISPLAY '        CALC MAT/CALL DATE ' WK-BOND-EXP-DATE               
ET0002                                                                          
ET0002     MOVE SPACE TO W-MMF-TABLE-AREA.                                      
ET0002     MOVE ZERO  TO TBL-SUB                                                
ET0002                   W-MMF-TBL-CNT.                                         
ET0002     IF NOT EOF-MMF                                                       
ET0002        PERFORM UNTIL  I-MMF-CLIENT-NUM > W-CURRENT-CLIENT-N              
ET0002                   OR  EOF-MMF                                            
ET0002                   OR  TBL-SUB > 999                                      
ET0002           IF I-MMF-CLIENT-NUM = W-CURRENT-CLIENT-N                       
ET0002              IF I-MMF-REDMPT-REC                                         
ET0002                  MOVE I-MMF-REDMPT-COUNT TO W-REDMPT-TBL-CNT             
ET0002                  PERFORM VARYING OCR-SUB FROM 1 BY 1                     
ET0002                           UNTIL OCR-SUB > I-MMF-REDMPT-COUNT             
ET0002                      MOVE I-MMF-REDMPT-SECURITY (OCR-SUB)                
ET0002                        TO W-REDMPT-SEC          (OCR-SUB)                
ET0002                  END-PERFORM                                             
ET0002              ELSE                                                        
ET0002                  ADD  1    TO  TBL-SUB  W-MMF-TBL-CNT                    
ET0002                  MOVE I-MMF-CLIENT-NUM                                   
ET0002                            TO W-MMF-CLT        (TBL-SUB)                 
ET0002                  MOVE I-MMF-SECURITY                                     
ET0002                            TO W-MMF-SEC        (TBL-SUB)                 
ET0002                  MOVE I-MMF-SWEEP-CODE                                   
ET0002                            TO W-MMF-SWEEP-CD   (TBL-SUB)                 
ET0002                  MOVE I-MMF-REDMPT-HRCHY                                 
ET0002                            TO W-MMF-REDMPT-IND (TBL-SUB)                 
LRM017                  MOVE I-MMF-THRESHOLD-COUNT TO                           
LRM017                               W-THRESHOLD-TBL-CNT (TBL-SUB)              
LRM017                  PERFORM VARYING TH-SUB FROM 1 BY 1                      
LRM017                           UNTIL TH-SUB > I-MMF-THRESHOLD-COUNT           
LRM017                     MOVE I-MMF-THRESHOLD-FUND(TH-SUB) TO                 
LRM017                          W-MMF-THRESHOLD-FUND (TBL-SUB, TH-SUB)          
LRM017                  END-PERFORM                                             
ET0002              END-IF                                                      
ET0002           END-IF                                                         
ET0002           PERFORM 2600-READ-MMF-FILE THRU 2600-EXIT                      
ET0002        END-PERFORM                                                       
ET0002     END-IF.                                                              
ET0002     PERFORM VARYING TBL-SUB FROM 1 BY 1 UNTIL TBL-SUB > 999              
ET0002         IF W-MMF-SEC (TBL-SUB) > SPACE                                   
ET0002            IF TBL-SUB = 1                                                
ET0002               DISPLAY ' '                                                
ET0002               DISPLAY '** CLT=' BH-BROKER-NUMBER ' - CAMS MONEY'         
ET0002                       ' MKT FUNDS PRIMARY REDEMPTION LIST'               
ET0002            END-IF                                                        
ET0002            DISPLAY '   SECURITY = ' W-MMF-SEC (TBL-SUB)                  
ET0002                  '   SWEEP CODE = ' W-MMF-SWEEP-CD (TBL-SUB)             
ET0002         ELSE                                                             
ET0002            MOVE 9000 TO TBL-SUB                                          
ET0002         END-IF                                                           
ET0002     END-PERFORM.                                                         
ET0002     PERFORM VARYING TBL-SUB FROM 1 BY 1 UNTIL TBL-SUB > 999              
ET0002         IF W-REDMPT-SEC (TBL-SUB) > SPACE                                
ET0002            IF TBL-SUB = 1                                                
ET0002               DISPLAY ' '                                                
ET0002               DISPLAY '** CLT=' BH-BROKER-NUMBER ' - CAMS MONEY'         
ET0002                       ' MKT FUNDS SECONDARY REDEMPTION LIST'             
ET0002            END-IF                                                        
ET0002            DISPLAY '   SECURITY = ' W-REDMPT-SEC (TBL-SUB)               
ET0002         ELSE                                                             
ET0002            MOVE 9000 TO TBL-SUB                                          
ET0002         END-IF                                                           
ET0002     END-PERFORM.                                                         
ET0002     DISPLAY ' '.                                                         
                                                                                
       2500-EXIT. EXIT.                                                         
      /                                                                         
ET0002 2600-READ-MMF-FILE.                                                      
ET0002     READ MMF-FILE                                                        
ET0002        AT END                                                            
ET0002           SET EOF-MMF  TO TRUE.                                          
ET0002     IF NOT EOF-MMF                                                       
ET0002        ADD 1 TO W-MMF-CNT.                                               
ET0002 2600-EXIT. EXIT.                                                         
ET0002/                                                                         
      ******************************************************************        
      *  IF FULL TRANSFER REQUEST, AND WE ARE THE DELIVERER,                    
      *     LOAD ASSETS                                                         
      ******************************************************************        
       3000-FETCH-TRANFER SECTION.                                              
           MOVE '3000-FETCH-TRANSFER        ' TO W-ROUTINE-1.                   
                                                                                
           EXEC SQL OPEN VTRNHSTY_CURSOR END-EXEC                               
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-TFR-SQLCODE                                   
                                                                                
           IF SQLCODE = +0                                                      
              DISPLAY 'VTRNHSTY_CURSOR OPENED FOR CLT ' W-CURRENT-CLIENT        
           ELSE                                                                 
              DISPLAY 'VTRNHSTY_CURSOR OPEN ERROR '                             
                            'SQLCODE = ' W-DB2-SQLCODE                          
           END-IF                                                               
                                                                                
           PERFORM UNTIL W-TFR-SQLCODE NOT = +0                                 
                                                                                
              ADD 1 TO W-INFILE-CNT                                             
                                                                                
              EXEC SQL                                                          
                   FETCH VTRNHSTY_CURSOR                                        
               INTO                                                             
                    :DCLVTRNHSTY.CLIENT-NBR                                     
                   ,:DCLVTRNHSTY.ACAT-CONTROL-NBR                               
                   ,:DCLVTRNHSTY.SBMTG-PRTCP-NBR                                
                   ,:DCLVTRNHSTY.DLVR-NBR                                       
                   ,:DCLVTRNHSTY.ACCT-DLVR-NBR                                  
                   ,:DCLVTRNHSTY.RCV-NBR                                        
                   ,:DCLVTRNHSTY.ACCT-RCV-NBR                                   
                   ,:DCLVTRNHSTY.TRNFR-TYPE-CD                                  
                   ,:DCLVTRNHSTY.TRANS-TYPE-CD                                  
                   ,:DCLVTRNHSTY.RCV-CUST-NM                                    
                   ,:DCLVTRNHSTY.RCV-SS-PRIM-NBR                                
                   ,:DCLVTRNHSTY.RCV-SS-SCNDY-NBR                               
                   ,:DCLVTRNHSTY.RCV-ACCT-TYPE-CD                               
                   ,:DCLVTRNHSTY.RCV-OCC-BRKR-NBR                               
                   ,:DCLVTRNHSTY.RCV-CRSPN-NBR                                  
                   ,:DCLVTRNHSTY.ACAT-CNTL-ASTD-NBR                             
                   ,:DCLVTRNHSTY.PRCS-DT                                        
                   ,:DCLVTRNHSTY.STTS-CD                                        
                   ,:DCLVTRNHSTY.STTLM-TM-CD                                    
                   ,:DCLVTRNHSTY.VAL-FREE-CD                                    
                   ,:DCLVTRNHSTY.TRANS-RFRN-ID-CD                               
                   ,:DCLVTRNHSTY.DB-CR-CD                                       
                   ,:DCLVTRNHSTY.DSTBN-SIDE-CD                                  
                   ,:DCLVTRNHSTY.SYS-ACT-CD                                     
                   ,:DCLVTRNHSTY.SYS-RJCT-RSN-CD                                
                   ,:DCLVTRNHSTY.TRNFR-TYPE-RJC1-CD                             
                   ,:DCLVTRNHSTY.TRNFR-TYPE-RJC2-CD                             
                   ,:DCLVTRNHSTY.TRNFR-TYPE-RJCT-CD                             
                   ,:DCLVTRNHSTY.RR-CD                                          
                   ,:DCLVTRNHSTY.BRANCH-CD                                      
                   ,:DCLVTRNHSTY.PRTCP-CONTRA-CD                                
                   ,:DCLVTRNHSTY.ACCT-DPLCT-TRN-IND                             
                   ,:DCLVTRNHSTY.NSCC-NON-ADP-IND                               
                   ,:DCLVTRNHSTY.DAYS-STTS-QTY                                  
                   ,:DCLVTRNHSTY.STTLM-DT                                       
                   ,:DCLVTRNHSTY.ACCT-NA-UPDT-IND                               
                   ,:DCLVTRNHSTY.ACCT-CD                                        
                   ,:DCLVTRNHSTY.STTLM-ASCTD-DT                                 
                   ,:DCLVTRNHSTY.NSCC-PEND-CD                                   
                   ,:DCLVTRNHSTY.PRGM-NM                                        
                   ,:DCLVTRNHSTY.CRT-TMSTP                                      
                   ,:DCLVTRNHSTY.UPDT-TMSTP                                     
                   ,:DCLVTRNHSTY.ACCT-EQUITY-AMT                                
LRM024             ,:DCLVTRNHSTY.CVRSN-ACCT-NBR                                 
              END-EXEC                                                          
                                                                                
           MOVE 'VTRNHSTY'               TO W-DB2-TABLE-NAME                    
           MOVE 'FETCH '                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
              MOVE SQLCODE      TO W-TFR-SQLCODE                                
DJ0002****         DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0002****                ' ' W-DB2-TABLE-NAME                                  
DJ0002****                ' ' W-DB2-ACTION                                      
DJ0002****                ' ' W-DB2-SQLCODE                                     
                                                                                
              EVALUATE SQLCODE                                                  
                  WHEN +0                                                       
                       PERFORM 4000-LOAD     THRU 4000-EXIT                     
                  WHEN +100                                                     
                       DISPLAY 'INP=' W-INFILE-CNT                              
                              ' VTRNHSTY_CURSOR FETCH NOT FOUND '               
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                       DISPLAY '    ' 'PREV-KEY:'                               
                        ' CLT=' WF-CLIENT-NBR                                   
                        ' ACC=' WF-BRANCH-CD                                    
                            ' ' WF-ACCT-CD                                      
                        ' CTL=' WF-ACAT-CONTROL-NBR                             
                  WHEN OTHER                                                    
                       DISPLAY 'INP=' W-INFILE-CNT                              
                              ' VTRNHSTY_CURSOR FETCH ERROR '                   
                              ' SQLCODE = ' W-DB2-SQLCODE                       
                       DISPLAY '    ' 'PREV-KEY:'                               
                        ' CLT=' WF-CLIENT-NBR                                   
                        ' ACC=' WF-BRANCH-CD                                    
                            ' ' WF-ACCT-CD                                      
                        ' CTL=' WF-ACAT-CONTROL-NBR                             
                       PERFORM  8500-SQL-ERROR THRU 8500-EXIT                   
              END-EVALUATE                                                      
                                                                                
           END-PERFORM                                                          
                                                                                
           EXEC SQL                                                             
                CLOSE VTRNHSTY_CURSOR                                           
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           MOVE SQLCODE      TO W-TFR-SQLCODE                                   
           IF  SQLCODE = +0                                                     
              DISPLAY 'VTRNHSTY_CURSOR CLOSED FOR CLT ' W-CURRENT-CLIENT        
           ELSE                                                                 
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'INP=' W-INFILE-CNT                                      
                      ' VTRNHSTY_CURSOR CLOSE ERROR '                           
                      ' SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
       3000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  FOR FULL TRANSFER REQUEST TO DELIVER                                   
      *  GET BALANCES AND POSITIONS AND LOAD TO THE INIT ASSET TABLES           
      *  FLAG ANY ERROR AND UPDATE THE TRANFER TABLE                            
      *  IF AUTO-REJECT, UPDATE/ADD TO THE INIT TRANSFER TABLE                  
      ******************************************************************        
       4000-LOAD                SECTION.                                        
           MOVE '4000-LOAD            ' TO W-ROUTINE-1.                         
                                                                                
           MOVE ' '                TO W-BAL-FND-SW                              
           MOVE ZEROES             TO W-BAL-TYPE1                               
                                      W-BAL-TYPE2                               
                                      W-BAL-TYPE3                               
                                      W-BAL-TYPE5                               
                                      W-BAL-SMA                                 
                                      W-BAL-MMKT                                
DJ0002                                W-BAL-EQUITY                              
ET0001                                W-BAL-PENDING-AMOUNT                      
                                                                                
           MOVE 0   TO W-ASSET-CNT                                              
DJ0002                 W-DEL-ASSET-CNT                                          
DJ0002                 W-NON-ASSET-CNT                                          
DJ0002                 W-EXC-ASSET-CNT                                          
           MOVE ' ' TO W-SHORT-IND                                              
DJ0003     MOVE ' ' TO W-NON-DELIVERABLE-IND                                    
DJ0002                 W-EXCEPTION-IND                                          
DJ0002                 W-EQUITY-EXC-IND                                         
DJ0002                 W-STLDAT-EXC-IND                                         
DJ0002                 W-SETTLING-TYP3-IND                                      
LRN024                 W-CONVERSION-IND                                         
LRM030                 W-DUPLICATE-IND                                          
                                                                                
           MOVE BRANCH-CD OF DCLVTRNHSTY     TO  W-BR-X                         
           MOVE ACCT-CD   OF DCLVTRNHSTY     TO  W-ACCT-X                       
                                                                                
           IF  RCV-CUST-NM OF DCLVTRNHSTY = ' '                                 
               GO TO 4000-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  STTLM-DT OF DCLVTRNHSTY = '0001-01-01'                           
               GO TO 4000-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  CLIENT-NBR OF DCLVTRNHSTY      = WF-CLIENT-NBR                   
           AND BRANCH-CD  OF DCLVTRNHSTY      = WF-BRANCH-CD                    
           AND ACCT-CD    OF DCLVTRNHSTY      = WF-ACCT-CD                      
ET0006     AND (W-ASSET-ADDED-FOR-THIS-ACCT-SW = 'Y' OR 'W')                    
               DISPLAY 'BYP=' W-INFILE-CNT                                      
                      ' CLT=' CLIENT-NBR       OF DCLVTRNHSTY                   
                      ' ACC=' BRANCH-CD        OF DCLVTRNHSTY                   
                          ' ' ACCT-CD          OF DCLVTRNHSTY                   
                      ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNHSTY                   
                      ' RCV=' RCV-NBR          OF DCLVTRNHSTY                   
                      ' RAC=' ACCT-RCV-NBR     OF DCLVTRNHSTY (1:12)            
                      ' DAC=' ACCT-DLVR-NBR    OF DCLVTRNHSTY (1:12)            
                       ' SD=' STTLM-DT         OF DCLVTRNHSTY                   
               DISPLAY '    ' 'DUPLICATE'                                       
                      ' CLT=' WF-CLIENT-NBR                                     
                      ' ACC=' WF-BRANCH-CD                                      
                          ' ' WF-ACCT-CD                                        
                      ' CTL=' WF-ACAT-CONTROL-NBR                               
                      ' RCV=' WF-RCV-NBR                                        
                      ' RAC=' WF-ACCT-RCV-NBR   (1:12)                          
                      ' DAC=' WF-ACCT-DLVR-NBR  (1:12)                          
                       ' SD=' WF-STTLM-DT                                       
               ADD 1 TO W-DUP-CNT                                               
               GO TO 4000-EXIT                                                  
           END-IF.                                                              
                                                                                
           MOVE CLIENT-NBR        OF DCLVTRNHSTY                                
                                             TO  WF-CLIENT-NBR                  
           MOVE BRANCH-CD         OF DCLVTRNHSTY                                
                                             TO  WF-BRANCH-CD                   
           MOVE ACCT-CD           OF DCLVTRNHSTY                                
                                             TO  WF-ACCT-CD                     
           MOVE ACAT-CONTROL-NBR  OF DCLVTRNHSTY                                
                                             TO  WF-ACAT-CONTROL-NBR            
           MOVE SBMTG-PRTCP-NBR   OF DCLVTRNHSTY                                
                                             TO  WF-SBMTG-PRTCP-NBR             
           MOVE DLVR-NBR          OF DCLVTRNHSTY                                
                                             TO  WF-DLVR-NBR                    
           MOVE ACCT-DLVR-NBR     OF DCLVTRNHSTY                                
                                             TO  WF-ACCT-DLVR-NBR               
           MOVE RCV-NBR           OF DCLVTRNHSTY                                
                                             TO  WF-RCV-NBR                     
           MOVE ACCT-RCV-NBR      OF DCLVTRNHSTY                                
                                             TO  WF-ACCT-RCV-NBR                
           MOVE TRNFR-TYPE-CD     OF DCLVTRNHSTY                                
                                             TO  WF-TRNFR-TYPE-CD               
           MOVE TRANS-TYPE-CD     OF DCLVTRNHSTY                                
                                             TO  WF-TRANS-TYPE-CD               
           MOVE PRCS-DT           OF DCLVTRNHSTY                                
                                             TO  WF-PRCS-DT                     
           MOVE STTS-CD           OF DCLVTRNHSTY                                
                                             TO  WF-STTS-CD                     
           MOVE NSCC-PEND-CD      OF DCLVTRNHSTY                                
                                             TO  WF-NSCC-PEND-CD                
           MOVE TRANS-RFRN-ID-CD  OF DCLVTRNHSTY                                
                                             TO  WF-TRANS-RFRN-ID-CD            
           MOVE DSTBN-SIDE-CD     OF DCLVTRNHSTY                                
                                             TO  WF-DSTBN-SIDE-CD               
           MOVE ACCT-EQUITY-AMT   OF DCLVTRNHSTY                                
                                             TO  WF-ACCT-EQUITY-AMT             
           MOVE STTLM-DT          OF DCLVTRNHSTY                                
                                             TO  WF-STTLM-DT                    
                                                                                
           PERFORM 6700-SELECT-VTRNFR THRU 6700-EXIT                            
                                                                                
           IF  W-TRANSFER-FND-SW = 'Y'                                          
               DISPLAY 'BYP=' W-INFILE-CNT                                      
                      ' CLT=' CLIENT-NBR         OF DCLVTRNHSTY                 
                      ' ACC=' BRANCH-CD          OF DCLVTRNHSTY                 
                          ' ' ACCT-CD            OF DCLVTRNHSTY                 
                      ' CTL=' ACAT-CONTROL-NBR   OF DCLVTRNHSTY                 
                      ' RCV=' RCV-NBR            OF DCLVTRNHSTY                 
                      ' RAC=' ACCT-RCV-NBR       OF DCLVTRNHSTY (1:12)          
                      ' DAC=' ACCT-DLVR-NBR      OF DCLVTRNHSTY (1:12)          
                       ' SD=' STTLM-DT           OF DCLVTRNHSTY                 
               DISPLAY '    ' '  ACTIVE:'                                       
                      ' CLT=' CLIENT-NBR         OF DCLVTRNFR                   
                      ' ACC=' BRANCH-CD          OF DCLVTRNFR                   
                          ' ' ACCT-CD            OF DCLVTRNFR                   
                      ' ASC=' ACAT-CNTL-ASTD-NBR OF DCLVTRNFR                   
                      ' CTL=' ACAT-CONTROL-NBR   OF DCLVTRNFR                   
                      ' STA=' STTS-CD            OF DCLVTRNFR                   
                       ' PD=' PRCS-DT            OF DCLVTRNFR                   
               DISPLAY '    ' '     '                                           
                      ' TRN=' TRANS-TYPE-CD      OF DCLVTRNFR                   
                      ' TFR=' TRNFR-TYPE-CD      OF DCLVTRNFR                   
                      ' DST=' DSTBN-SIDE-CD      OF DCLVTRNFR                   
                      ' DLV=' DLVR-NBR           OF DCLVTRNFR                   
                      ' DAC=' ACCT-DLVR-NBR      OF DCLVTRNFR (1:12)            
                      ' RCV=' RCV-NBR            OF DCLVTRNFR                   
                      ' RAC=' ACCT-RCV-NBR       OF DCLVTRNFR (1:12)            
               ADD 1 TO W-ACTIVE-CNT                                            
DJ0002         IF  TRNFR-TYPE-CD OF DCLVTRNFR = 'RCR'                           
DJ0002         AND BH-ACAT-TYPE-3-BALANCES = '1'                                
DJ0002             PERFORM 5000-GET-BALANCES    THRU 5000-EXIT                  
DJ0002           IF W-BAL-TYPE3 NOT = 0                                         
DJ0002             MOVE 'Y' TO W-SETTLING-TYP3-IND                              
DJ0002             DISPLAY '    ' '     ' 'WRITE SETTLING TYPE3 RECORD'         
DJ0002             COMPUTE W-WORK-BAL =                                         
DJ0002                     W-BAL-TYPE1 + W-BAL-TYPE3 - W-BAL-MMKT               
DJ0002             MOVE W-WORK-BAL           TO W-WORK-BAL-UNSIGN               
DJ0002             MOVE 'E'                  TO W-CSH-MGN-SHT                   
DJ0002             MOVE 'TYP3'               TO W-CASH-SMA                      
DJ0002             PERFORM 7200-WRITE-BALANCES  THRU 7200-EXIT                  
DJ0002             PERFORM 7300-WRITE-TI-RECORD THRU 7300-EXIT                  
DJ0002           END-IF                                                         
DJ0002         END-IF                                                           
DJ0002         IF  TRNFR-TYPE-CD OF DCLVTRNFR = 'RCR'                           
LRM030             GO TO 4000-EXIT                                              
LRM030         END-IF                                                           
LRM030         SET W-THIS-IS-DUPLICATE TO TRUE                                  
LRM030         MOVE ' ACTIVE' TO  W-DUPLICATE-DATABASE                  ACATRCRF
LRM030         DISPLAY '    ' '  ACTIVE TRANSFER FOUND. REPORT AS EXCPT'        
LRM030*********GO TO 4000-EXIT                                                  
           END-IF.                                                              
                                                                                
DJ0012     PERFORM 6800-SELECT-ACTITRF THRU 6800-EXIT                           
DJ0012     IF  W-ACTITRF-FND-SW = 'Y'                                           
LRM030         SET W-THIS-IS-DUPLICATE TO TRUE                                  
LRM030         MOVE 'INITIAL' TO  W-DUPLICATE-DATABASE                  ACATRCRF
DJ0012         DISPLAY 'BYP=' W-INFILE-CNT                                      
DJ0012                ' CLT=' CLIENT-NBR         OF DCLVTRNHSTY                 
DJ0012                ' ACC=' BRANCH-CD          OF DCLVTRNHSTY                 
DJ0012                    ' ' ACCT-CD            OF DCLVTRNHSTY                 
DJ0012                ' CTL=' ACAT-CONTROL-NBR   OF DCLVTRNHSTY                 
DJ0012                ' RCV=' RCV-NBR            OF DCLVTRNHSTY                 
DJ0012                ' RAC=' ACCT-RCV-NBR       OF DCLVTRNHSTY (1:12)          
DJ0012                ' DAC=' ACCT-DLVR-NBR      OF DCLVTRNHSTY (1:12)          
DJ0012                 ' SD=' STTLM-DT           OF DCLVTRNHSTY                 
DJ0012         DISPLAY '    ' ' ACTITRF:'                                       
DJ0012                ' CLT=' CLIENT-NBR         OF DCLACTITRF                  
DJ0012                ' ACC=' ACCT-DLVR-NBR      OF DCLACTITRF(1:3)             
DJ0012                    ' ' ACCT-DLVR-NBR      OF DCLACTITRF(4:5)             
DJ0012                ' ASC=' ACAT-CNTL-ASTD-NBR OF DCLACTITRF                  
DJ0012                ' CTL=' ACAT-CONTROL-NBR   OF DCLACTITRF                  
DJ0012                ' STA=' STTS-CD            OF DCLACTITRF                  
DJ0012                 ' PD=' PRCS-DT            OF DCLACTITRF                  
DJ0012         DISPLAY '    ' '     '                                           
DJ0012                ' TRN=' TRANS-TYPE-CD      OF DCLACTITRF                  
DJ0012                ' TFR=' TRNFR-TYPE-CD      OF DCLACTITRF                  
DJ0012                ' DST=' DSTBN-SIDE-CD      OF DCLACTITRF                  
DJ0012                ' DLV=' DLVR-NBR           OF DCLACTITRF                  
DJ0012                ' DAC=' ACCT-DLVR-NBR      OF DCLACTITRF(1:12)            
DJ0012                ' RCV=' RCV-NBR            OF DCLACTITRF                  
DJ0012                ' RAC=' ACCT-RCV-NBR       OF DCLACTITRF(1:12)            
LRM030         DISPLAY '    ' '  INIT TRANSFER FOUND. REPORT AS EXCPT'          
LRM030*********GO TO 4000-EXIT                                                  
DJ0012     END-IF.                                                              
                                                                                
           PERFORM 4050-GETNA          THRU 4050-EXIT                           
                                                                                
           IF  W-GETNA-FND-SW  = 'Y'                                            
           AND NAPPA-ACAT-CODE = 'D'                                            
               ADD 1 TO W-ACAT-CODE-D-CNT                                       
           ELSE                                                                 
               ADD 1 TO W-ACAT-CODE-NOT-D-CNT                                   
               GO TO 4000-COMMIT                                                
           END-IF.                                                              
                                                                                
           PERFORM 4100-CHECK-VRSDACC  THRU 4100-EXIT                           
                                                                                
           IF  W-VRSDACC-FND-SW  = 'Y'                                          
           AND W-VRSDSEC-ROW-CNT = 0                                            
               GO TO 4000-COMMIT                                                
           END-IF.                                                              
                                                                                
           IF  BH-ACAT-RESID-CRD-BEGIN-DAYS  > 0                                
           AND BH-ACAT-RESID-CRD-NUMBER-DAYS > 0                                
               PERFORM 4200-CHECK-STL-DATE THRU 4200-EXIT                       
               IF   W-BEGIN-DATE >= W-STL-DATE                                  
               AND  W-END-DATE   <= W-STL-DATE                                  
                    CONTINUE                                                    
                                                                                
               ELSE                                                             
TEST****************DISPLAY '   STL-DATE NOT IN RANGE BYPASS'                   
TEST******************' CTL=' ACAT-CONTROL-NBR   OF DCLVTRNHSTY                 
ET0006              MOVE 'W' TO W-ASSET-ADDED-FOR-THIS-ACCT-SW                  
                    GO TO 4000-COMMIT                                           
               END-IF                                                           
           ELSE                                                                 
****************DISPLAY '   B1-DAYS  NOT > 0 BYPASS'                            
                GO TO 4000-COMMIT                                               
           END-IF.                                                              
                                                                                
LRM005     PERFORM 4300-CHECK-VRSDBLK  THRU 4300-EXIT                           
LRM005                                                                          
LRM005     IF  W-CLIENT-RESCIND-FND-SW  = 'Y'                                   
LRM005     OR  W-LEGAL-BLOCK-FND-SW     = 'Y'                                   
LRM005         GO TO 4000-COMMIT                                                
LRM005     END-IF.                                                              
                                                                                
           ADD 1 TO W-LOAD-CNT.                                                 
DJ0003     MOVE ' ' TO W-ASSET-ADDED-FOR-THIS-ACCT-SW                           
                                                                                
           PERFORM 5000-GET-BALANCES  THRU 5000-EXIT.                           
                                                                                
DJ0002***--DO THE EXCEPTIONS FIRST TO SET FLAG FOR OTHERS                       
DJ0002***--ONLY IF CLIENT IS AUTO-SUBMIT                                        
DJ0002     IF  BH-ACAT-RESID-CRD-DISPL-ONLINE = '1'                             
DJ0002         PERFORM 5700-LOAD-EXCEPTION THRU 5700-EXIT                       
DJ0002     END-IF                                                               
                                                                                
           PERFORM 5100-GET-POSITIONS THRU 5100-EXIT.                           
                                                                                
           PERFORM 5600-LOAD-BALANCES THRU 5600-EXIT.                           
                                                                                
           IF  CMBL-KEY-CO-BR-ACCT = W-BAL-KEY-A                                
TK0016         PERFORM 5050-FOREIGN-CURR-BAL THRU 5050-EXIT.                    
                                                                                
           IF  W-ASSET-ADDED-FOR-THIS-ACCT-SW = 'Y'                             
               PERFORM 7300-WRITE-TI-RECORD THRU 7300-EXIT                      
           END-IF.                                                              
                                                                                
       4000-COMMIT.                                                             
                                                                                
           ADD +1 TO W-COMMIT-CTR                                               
           IF  W-COMMIT-CTR > +4                                                
               PERFORM 8120-SQL-COMMIT THRU 8120-EXIT                           
               MOVE 0 TO W-COMMIT-CTR                                           
           END-IF.                                                              
                                                                                
       4000-EXIT. EXIT.                                                         
      /                                                                         
       4050-GETNA          SECTION.                                             
           MOVE '4050-GETNA           ' TO W-ROUTINE-1.                         
                                                                                
           MOVE ' ' TO W-GETNA-FND-SW                                           
           MOVE WF-CLIENT-NBR (2:3)      TO GETNA-KEY-CLIENT.                   
           MOVE '00'                     TO GETNA-KEY-BRANCH1-2.                
           MOVE W-BR-X                   TO GETNA-KEY-BRANCH3-5.                
           MOVE '00000'                  TO GETNA-KEY-ACCOUNT1-5.               
           MOVE W-ACCT-X                 TO GETNA-KEY-ACCOUNT6-10.              
                                                                                
           CALL ZGETNA-PROGRAM        USING GETNA-PARAMETERS                    
                                            GETNA-SEGMENT-INCLUDES.             
                                                                                
           IF  GETNA-RETURN-FOUND                                               
               MOVE 'Y' TO W-GETNA-FND-SW                                       
               ADD 1 TO W-GETNA-FND-CNT                                         
           ELSE                                                                 
               MOVE 'N' TO W-GETNA-FND-SW                                       
               ADD 1 TO W-GETNA-NOTFND-CNT                                      
           END-IF.                                                              
                                                                                
       4050-EXIT. EXIT.                                                         
      /                                                                         
       4100-CHECK-VRSDACC       SECTION.                                        
           MOVE '4100-CHECK-VRSDACC   ' TO W-ROUTINE-1.                         
                                                                                
           MOVE ' '                TO DCLVRSDACC                                
                                                                                
           MOVE ' '                TO W-VRSDACC-FND-SW                          
           EXEC SQL SELECT                                                      
                        CLIENT_NBR                                              
                       ,ACCT_CD                                                 
                       ,BRANCH_CD                                               
                       ,BRANCH_ORGNL_CD                                         
                       ,ACCT_ORGNL_CD                                           
                       ,RR_CD                                                   
                   INTO                                                         
                        :DCLVRSDACC.CLIENT-NBR                                  
                       ,:DCLVRSDACC.ACCT-CD                                     
                       ,:DCLVRSDACC.BRANCH-CD                                   
                       ,:DCLVRSDACC.BRANCH-ORGNL-CD                             
                       ,:DCLVRSDACC.ACCT-ORGNL-CD                               
                       ,:DCLVRSDACC.RR-CD                                       
                   FROM VRSDACC                                                 
                  WHERE CLIENT_NBR        = :WF-CLIENT-NBR                      
                    AND BRANCH_CD         = :W-BR-X                             
                    AND ACCT_CD           = :W-ACCT-X                           
           END-EXEC                                                             
                                                                                
           MOVE 'VRSDACC '               TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
DJ0002****         DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0002****                ' CLT=' WF-CLIENT-NBR                                 
DJ0002****                ' ACC=' W-BR ' ' W-ACCT                               
DJ0002****                ' ' W-DB2-TABLE-NAME                                  
DJ0002****                ' ' W-DB2-ACTION                                      
DJ0002****                ' ' W-DB2-SQLCODE                                     
                                                                                
           IF  SQLCODE  =  +0                                                   
                   ADD 1 TO W-VRSDACC-FND-CNT                                   
                   MOVE 'Y'               TO W-VRSDACC-FND-SW                   
           ELSE                                                                 
                   ADD 1 TO W-VRSDACC-NOTFND-CNT                                
                   MOVE 'N'               TO W-VRSDACC-FND-SW                   
           END-IF.                                                              
                                                                                
           MOVE +0 TO W-VRSDSEC-ROW-CNT.                                        
           EXEC SQL                                                             
                 SELECT COUNT(*)                                                
                   INTO :W-VRSDSEC-ROW-CNT                                      
                   FROM VRSDSEC                                                 
                  WHERE CLIENT_NBR        = :WF-CLIENT-NBR                      
                    AND BRANCH_CD         = :W-BR-X                             
                    AND ACCT_CD           = :W-ACCT-X                           
           END-EXEC.                                                            
                                                                                
           MOVE 'VRSDSEC '               TO W-DB2-TABLE-NAME                    
           MOVE 'COUNT '                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
DJ0002****         DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0002****                ' CLT=' WF-CLIENT-NBR                                 
DJ0002****                ' ACC=' W-BR ' ' W-ACCT                               
DJ0002****                ' ' W-DB2-TABLE-NAME                                  
DJ0002****                ' ' W-DB2-ACTION                                      
DJ0002****                ' ' W-DB2-SQLCODE                                     
DJ0002****                  ' W-VRSDSEC-ROW-CNT = ' W-VRSDSEC-ROW-CNT           
                                                                                
           IF  SQLCODE  =  +0                                                   
                   ADD 1 TO W-VRSDSEC-FND-CNT                                   
                   IF  W-VRSDSEC-ROW-CNT > 0                                    
                       DISPLAY 'INP=' W-INFILE-CNT                              
                              ' CLT=' WF-CLIENT-NBR                             
                              ' ACC=' W-BR ' ' W-ACCT                           
                              ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNHSTY           
                           ' RSDACC=' W-VRSDACC-FND-SW                          
                       ' RSDSEC-CNT=' W-VRSDSEC-ROW-CNT                         
                   END-IF                                                       
           END-IF.                                                              
                                                                                
       4100-EXIT. EXIT.                                                         
      /                                                                         
       4200-CHECK-STL-DATE      SECTION.                                        
           MOVE '4200-CHECK-STL-DATE  ' TO W-ROUTINE-1.                         
                                                                                
           MOVE STTLM-DT OF DCLVTRNHSTY (1:4) TO W-STL-YEAR                     
           MOVE STTLM-DT OF DCLVTRNHSTY (6:2) TO W-STL-MM                       
           MOVE STTLM-DT OF DCLVTRNHSTY (9:2) TO W-STL-DD.                      
                                                                                
       4200-EXIT. EXIT.                                                         
      /                                                                         
LRM005 4300-CHECK-VRSDBLK       SECTION.                                        
           MOVE ' '  TO W-CLIENT-RESCIND-FND-SW                                 
                        W-LEGAL-BLOCK-FND-SW                                    
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,BLOCK_CD                                                    
               INTO                                                             
                    :DCLVRSDBLK.CLIENT-NBR                                      
                   ,:DCLVRSDBLK.BLOCK-CD                                        
               FROM VRSDBLK                                                     
              WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
                AND BRANCH_CD         = :W-BR-X                                 
                AND ACCT_CD           = :W-ACCT-X                               
                AND RCV_NBR           = :WF-RCV-NBR                             
                AND BLOCK_CD          = 'R'                                     
           END-EXEC                                                             
                                                                                
           MOVE 'VRSDBLK '               TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF (SQLCODE  =  +0 OR -811)                                          
           AND BH-ACAT-CLIENT-RESCIND-IND > '0'                                 
              MOVE 'Y'               TO W-CLIENT-RESCIND-FND-SW                 
              DISPLAY 'INP=' W-INFILE-CNT                                       
                  '    VRSDBLK CLIENT RESCIND FOUND FOR'                        
                                   ' '  WF-CLIENT-NBR                           
                                   ' '  W-BR-X                                  
                                   ' '  W-ACCT-X                                
                                   ' '  WF-RCV-NBR                              
           END-IF.                                                              
                                                                                
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,BLOCK_CD                                                    
               INTO                                                             
                    :DCLVRSDBLK.CLIENT-NBR                                      
                   ,:DCLVRSDBLK.BLOCK-CD                                        
               FROM VRSDBLK                                                     
              WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
                AND BRANCH_CD         = :W-BR-X                                 
                AND ACCT_CD           = :W-ACCT-X                               
                AND BLOCK_CD          = 'L'                                     
           END-EXEC                                                             
                                                                                
           MOVE 'VRSDBLK '               TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF (SQLCODE  =  +0 OR -811)                                          
           AND BH-ACAT-LEGAL-BLOCK-IND > '0'                                    
              MOVE 'Y'               TO W-LEGAL-BLOCK-FND-SW                    
              DISPLAY 'INP=' W-INFILE-CNT                                       
                  '    VRSDBLK LEGAL FOUND FOR'                                 
                                   ' '  WF-CLIENT-NBR                           
                                   ' '  W-BR-X                                  
                                   ' '  W-ACCT-X                                
           END-IF.                                                              
                                                                                
       4300-EXIT. EXIT.                                                         
      /                                                                         
       5000-GET-BALANCES   SECTION.                                             
      *****************************************************************         
      *  GET BALANCES                                                           
      *      TYPES 1, 3 = CASH                                                  
      *      TYPES 2    = MARGIN                                                
      *      TYPES 5    = SHORT                                                 
      *      SMA        = SMA                                                   
      *****************************************************************         
           MOVE '5000-GET-BALANCES             ' TO W-ROUTINE-1.                
                                                                                
DJ0001     MOVE SPACES                      TO W-BAL-KEY                        
           MOVE W-CURRENT-CLIENT-N          TO W-BAL-CLT                        
DJ0001     MOVE W-BR-X                      TO W-BAL-BR                         
DJ0001     MOVE W-ACCT-X                    TO W-BAL-ACCT                       
           MOVE '28'                        TO W-BAL-REC-TYPE                   
           MOVE '000000'                    TO W-BAL-CUR                        
           MOVE W-BAL-KEY                   TO CMBL-KEY                         
                                                                                
ET0004***  MOVE  LOW-VALUES                TO  GETVBAL-PARM.                    
ET0004     MOVE  'CAT812A '                TO  GETVBAL-CALLING-PROGRAM.         
ET0004     MOVE  'O'  TO GETVBAL-FILE                                           
ET0004     MOVE  'R'  TO GETVBAL-FUNC                                           
ET0004     MOVE W-CURRENT-CLIENT-N         TO  GETVBAL-OLD-CLIENT.              
ET0004     MOVE W-BAL-BR                   TO  GETVBAL-OLD-BRANCH.              
ET0004     MOVE W-BAL-ACCT                 TO  GETVBAL-OLD-ACCT.                
ET0004     MOVE ZEROES                     TO  GETVBAL-OLD-CUR-CODE.            
ET0004     SET GETVBAL-OLD-FILLER-SPACE    TO  TRUE.                            
ET0004     PERFORM 9500-CALL-GETVBAL                                            
                                                                                
           IF BALNC-OKAY                                                        
              CONTINUE                                                          
           ELSE                                                                 
             IF BALNC-END-OF-FILE                                               
             OR BALNC-NOT-FOUND                                                 
                GO TO 5000-EXIT                                                 
             ELSE                                                               
ET0004          DISPLAY ' ** CAT812A CALL GETVBAL PROBLEM'                      
                        ' FILE-STATUS = ' BALNC-STATUS                          
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                       ' W-BAL-KEY = ' W-BAL-CLT                                
                                   ' ' W-BAL-BR                                 
                                   ' ' W-BAL-ACCT                               
                MOVE +3999 TO ABEND-CODE                                        
                CALL ABEND-PROGRAM USING ABEND-CODE                             
             END-IF                                                             
           END-IF.                                                              
                                                                                
           ADD 1 TO W-BAL-CNT                                                   
                                                                                
           IF  CMBL-KEY NOT = W-BAL-KEY                                         
               GO TO 5000-EXIT                                                  
           ELSE                                                                 
               CONTINUE                                                         
           END-IF.                                                              
                                                                                
           MOVE 'Y' TO W-BAL-FND-SW                                             
                                                                                
DJ0011***--IF B1 434737 IS ON, USE SETTLEMENT DATE BALANCE                      
DJ0011***--ELSE USE TRADE DATE BALANCE                                          
           IF CMBL-ACTYP1-PRESENT = 1                                           
DJ0011      IF BH-ACAT-RCR-SETTLE-DATE-POS = '1'                                
              MOVE CMBL1-SETTLE-DATE-BAL-YSTDY(1) TO W-BAL-TYPE1                
DJ0011      ELSE                                                                
              MOVE CMBL1-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE1                
DJ0011      END-IF                                                              
           END-IF.                                                              
           IF CMBL-ACTYP2-PRESENT = 1                                           
DJ0011      IF BH-ACAT-RCR-SETTLE-DATE-POS = '1'                                
              MOVE CMBL2-SETTLE-DATE-BAL-YSTDY(1) TO W-BAL-TYPE2                
DJ0011      ELSE                                                                
              MOVE CMBL2-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE2                
DJ0011      END-IF                                                              
           END-IF.                                                              
           IF CMBL-ACTYP3-PRESENT = 1                                           
DJ0011      IF BH-ACAT-RCR-SETTLE-DATE-POS = '1'                                
              MOVE CMBL3-SETTLE-DATE-BAL-YSTDY(1) TO W-BAL-TYPE3                
DJ0011      ELSE                                                                
              MOVE CMBL3-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE3                
DJ0011      END-IF                                                              
           END-IF.                                                              
           IF CMBL-ACTYP5-PRESENT = 1                                           
DJ0011      IF BH-ACAT-RCR-SETTLE-DATE-POS = '1'                                
              MOVE CMBL5-SETTLE-DATE-BAL-YSTDY(1) TO W-BAL-TYPE5                
DJ0011      ELSE                                                                
              MOVE CMBL5-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE5                
DJ0011      END-IF                                                              
           END-IF.                                                              
           IF CMBL-TOTAL-SMA NOT = 0                                            
              MOVE CMBL-TOTAL-SMA                 TO W-BAL-SMA                  
           END-IF.                                                              
DJ0002     MOVE CMBL-TOTL-LIQDATNG-EQUITY TO W-BAL-EQUITY.                      
ET0001     MOVE CMBL-PENDING-AMOUNT       TO W-BAL-PENDING-AMOUNT.              
                                                                                
       5000-EXIT. EXIT.                                                         
      /                                                                         
TK0016 5050-FOREIGN-CURR-BAL  SECTION.                                          
TK0016     MOVE '5050-FOREIGN-CURR-BAL         ' TO W-ROUTINE-1.                
TK0016     MOVE SPACES                      TO W-BAL-KEY                        
TK0016     MOVE W-CURRENT-CLIENT-N          TO W-BAL-CLT                        
TK0016     MOVE W-BR-X                      TO W-BAL-BR                         
TK0016     MOVE W-ACCT-X                    TO W-BAL-ACCT                       
TK0016     MOVE '28'                        TO W-BAL-REC-TYPE                   
TK0016     MOVE '000002'                    TO W-BAL-CUR                        
TK0016     MOVE W-BAL-KEY                   TO CMBL-KEY                         
TK0016                                                                          
TK0016***  MOVE  LOW-VALUES                TO  GETVBAL-PARM.                    
TK0016     MOVE  'CAT812A '                TO  GETVBAL-CALLING-PROGRAM.         
TK0016     MOVE  'O'  TO GETVBAL-FILE                                           
TK0016     MOVE  'S'  TO GETVBAL-FUNC                                           
TK0016     MOVE W-CURRENT-CLIENT-N         TO  GETVBAL-OLD-CLIENT.              
TK0016     MOVE W-BAL-BR                   TO  GETVBAL-OLD-BRANCH.              
TK0016     MOVE W-BAL-ACCT                 TO  GETVBAL-OLD-ACCT.                
TK0016     MOVE '002'                      TO  GETVBAL-OLD-CUR-CODE.            
TK0016     SET GETVBAL-OLD-FILLER-SPACE    TO  TRUE.                            
TK0016 5050-READ-NEXT-BAL-CURR.                                                 
TK0016     PERFORM 9500-CALL-GETVBAL                                            
TK0016*****DISPLAY 'CALLED GETVBAL FCURR ' CMBL-KEY                             
TK0016     IF BALNC-OKAY                                                        
TK0016           CONTINUE                                                       
TK0016     ELSE                                                                 
TK0016       IF BALNC-END-OF-FILE                                               
TK0016       OR BALNC-NOT-FOUND                                                 
TK0016          GO TO 5050-EXIT                                                 
TK0016       ELSE                                                               
TK0016          DISPLAY ' ** CAT812A CALL GETVBAL PROBLEM IN 5050-'             
TK0016                  ' FILE-STATUS = ' BALNC-STATUS                          
TK0016             DISPLAY 'INP=' W-INFILE-CNT                                  
TK0016                 ' W-BAL-KEY = ' W-BAL-CLT                                
TK0016                             ' ' W-BAL-BR                                 
TK0016                             ' ' W-BAL-ACCT                               
TK0016          MOVE +4000 TO ABEND-CODE                                        
TK0016          CALL ABEND-PROGRAM USING ABEND-CODE                             
TK0016       END-IF                                                             
TK0016     END-IF.                                                              
TK0016                                                                          
TK0016     IF  CMBL-KEY-CO-BR-ACCT NOT = W-BAL-KEY-A                            
LRM038     OR (CMBL-CURRENCY-CODE = '000998' OR '000999')                       
TK0016         GO TO 5050-EXIT                                                  
TK0016     END-IF.                                                              
TK0016                                                                          
LRM038     IF CMBL-CURRENCY-CODE = '000254'                                     
LRM038        GO TO 5050-READ-NEXT-BAL-CURR                                     
LRM038     END-IF.                                                              
                                                                                
TK0016     MOVE ZEROES TO W-BAL-TYPE1                                           
TK0016                    W-BAL-TYPE2                                           
TK0016                    W-BAL-TYPE3                                           
TK0016                    W-BAL-TYPE5                                           
TK0016                                                                          
TK0016     IF CMBL-ACTYP1-PRESENT = 1                                           
TK0016      IF BH-ACAT-RCR-SETTLE-DATE-POS = '1'                                
TK0016        MOVE CMBL1-SETTLE-DATE-BAL-YSTDY(1) TO W-BAL-TYPE1                
TK0016      ELSE                                                                
TK0016        MOVE CMBL1-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE1                
TK0016      END-IF                                                              
TK0016     END-IF.                                                              
TK0016     IF CMBL-ACTYP2-PRESENT = 1                                           
TK0016      IF BH-ACAT-RCR-SETTLE-DATE-POS = '1'                                
TK0016        MOVE CMBL2-SETTLE-DATE-BAL-YSTDY(1) TO W-BAL-TYPE2                
TK0016      ELSE                                                                
TK0016        MOVE CMBL2-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE2                
TK0016      END-IF                                                              
TK0016     END-IF.                                                              
TK0016     IF CMBL-ACTYP3-PRESENT = 1                                           
TK0016      IF BH-ACAT-RCR-SETTLE-DATE-POS = '1'                                
TK0016        MOVE CMBL3-SETTLE-DATE-BAL-YSTDY(1) TO W-BAL-TYPE3                
TK0016      ELSE                                                                
TK0016        MOVE CMBL3-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE3                
TK0016      END-IF                                                              
TK0016     END-IF.                                                              
TK0016     IF CMBL-ACTYP5-PRESENT = 1                                           
TK0016      IF BH-ACAT-RCR-SETTLE-DATE-POS = '1'                                
TK0016        MOVE CMBL5-SETTLE-DATE-BAL-YSTDY(1) TO W-BAL-TYPE5                
TK0016      ELSE                                                                
TK0016        MOVE CMBL5-TRADE-DATE-BAL-YSTDY (1) TO W-BAL-TYPE5                
TK0016      END-IF                                                              
TK0016     END-IF.                                                              
TK0016                                                                          
TK0016     IF BH-ACAT-TYPE-3-BALANCES = '1'                                     
TK0016        ADD W-BAL-TYPE3  TO W-BAL-TYPE1                                   
TK0016     END-IF                                                               
TK0016                                                                          
TK0016     MOVE W-BAL-TYPE1              TO W-WORK-BAL-UNSIGN                   
TK0016                                      W-WORK-BAL                          
TK0016     IF  W-WORK-BAL-UNSIGN NOT = 0                                        
TK0016         MOVE 'C'                  TO W-CSH-MGN-SHT                       
TK0016         MOVE 'CASH'               TO W-CASH-SMA                          
TK0016         PERFORM 7200-WRITE-BALANCES  THRU 7200-EXIT                      
TK0016     END-IF                                                               
TK0016                                                                          
TK0016     MOVE W-BAL-TYPE2              TO W-WORK-BAL-UNSIGN                   
TK0016                                      W-WORK-BAL                          
TK0016     IF  W-WORK-BAL-UNSIGN NOT = 0                                        
TK0016         MOVE 'M'                  TO W-CSH-MGN-SHT                       
TK0016         MOVE 'CASH'               TO W-CASH-SMA                          
TK0016         PERFORM 7200-WRITE-BALANCES  THRU 7200-EXIT                      
TK0016     END-IF                                                               
TK0016                                                                          
TK0016     MOVE W-BAL-TYPE5              TO W-WORK-BAL-UNSIGN                   
TK0016                                      W-WORK-BAL                          
TK0016     IF  W-WORK-BAL-UNSIGN NOT = 0                                        
TK0016         MOVE 'S'                  TO W-CSH-MGN-SHT                       
TK0016         MOVE 'CASH'               TO W-CASH-SMA                          
TK0016         PERFORM 7200-WRITE-BALANCES  THRU 7200-EXIT                      
TK0016     END-IF.                                                              
TK0016     GO TO 5050-READ-NEXT-BAL-CURR.                                       
TK0016 5050-EXIT. EXIT.                                                         
      /                                                                         
       5100-GET-POSITIONS  SECTION.                                             
      *****************************************************************         
      *  GET POSITIONS                                                          
      *  SELECT ONLY TYPES 1(CASH), 2(MARGIN), 5(SHORT)                         
DJ0005*  BYPASS IRA, ANNUITY, SPAD, MONEY MARKET FUND SECURITIES.               
LRM053*  BYPASS OPEN ORDERS - CUSHOL DEFINED                                    
      *  BYPASS ZERO QTY RECORD                                                 
      *****************************************************************         
           MOVE '5100-GET-POSITIONS            ' TO W-ROUTINE-1.                
                                                                                
DJ0001     MOVE LOW-VALUES             TO W-CUSHOL-KEY                          
           MOVE W-CURRENT-CLIENT(2:3)  TO W-CUSHOL-CLIENT                       
DJ0001     MOVE W-BR-X                 TO W-CUSHOL-BRANCH                       
DJ0001     MOVE W-ACCT-X               TO W-CUSHOL-ACCOUNT                      
           MOVE ZEROS                  TO W-CUSHOL-FRGN-CURR-CODE               
ET0004     MOVE W-CUSHOL-KEY           TO GETVHOL-KEY                           
ET0004     MOVE SPACES                 TO GETVHOL-RETURN-PARAMETERS.            
ET0004                                                                          
ET0004**---RETURN THE NEW RECORD LAYOUT(CUSHOL)                                 
ET0004     MOVE 'N'                    TO GETVHOL-FILE.                         
ET0004                                                                          
ET0004**---DO A SKIP SEQUENTIAL READ TO GET RECORDS FOR THAT ACCOUNT.           
ET0004     MOVE 'S'                    TO GETVHOL-FUNC.                         
ET0004     MOVE SPACES                 TO GETVHOL-PREV-KEY.                     
ET0004                                                                          
                                                                                
       5100-READ-POS-NEXT.                                                      
ET0004**---DO READNEXT FOR NEXT RECORD FOR THAT ACCOUNT.                        
ET0004                                                                          
ET0004     PERFORM 9600-CALL-GETVHOL.                                           
ET0004                                                                          
ET0004     IF GETVHOL-END-OF-FILE                                               
                GO TO 5100-EXIT                                                 
           END-IF.                                                              
ET0004     IF NOT GETVHOL-SUCCESSFUL                                            
ET0004         DISPLAY 'CAT812A: CUSHOLV VSAM FILE, READ ERROR'                 
ET0004         DISPLAY 'CAT812A: GETVHOL-RETURN-CODE = '                        
ET0004                         GETVHOL-RETURN-CODE                              
ET0004         DISPLAY 'CAT812A: GETVHOL-FILE-STATUS = '                        
ET0004                         GETVHOL-FILE-STATUS                              
ET0004         MOVE +3999 TO ABEND-CODE                                         
ET0004         CALL ABEND-PROGRAM USING ABEND-CODE                              
ET0004     END-IF.                                                              
                                                                                
           ADD 1 TO W-POS-CNT                                                   
                                                                                
ET0004**---MOVE THE NEW RECORD FROM THE PARM AREA                               
LRM052     MOVE GETVHOL-NEW-RECORD   TO CUSHOL-RECORD.                          
ET0004                                                                          
LRM052     IF CUSHOL-REC-TYPE = HIGH-VALUES                                     
ET0004        GO TO 5100-READ-POS-NEXT.                                         
ET0004                                                                          
ET0004     IF CUSHOL-ACCOUNT-TYPE NOT NUMERIC                                   
ET0004        GO TO 5100-READ-POS-NEXT.                                         
ET0004                                                                          
ET0004     IF CUSHOL-KEY(1:11) NOT = W-CUSHOL-KEY(1:11)                         
ET0004          GO TO 5100-EXIT                                                 
ET0004     END-IF.                                                              
                                                                                
TK0016** BYPASS NON-ZERO CURRENCY                                               
TK0016**   IF  CUSHOL-FRGN-CURR-CODE NOT = '000'                                
TK0016**       GO TO 5100-READ-POS-NEXT                                         
TK0016**   END-IF                                                               
                                                                                
      ** BYPASS OPEN ORDERS                                                     
LRM053**** IF  CUSHOL-ACCOUNT-TYPE NOT NUMERIC                                  
LRM053     IF  CUSHOL-OPEN-ORDER                                                
               GO TO 5100-READ-POS-NEXT                                         
           END-IF                                                               
                                                                                
      ** SELECT ONLY TYPES 1,2,3,5                                              
           IF  (CUSHOL-ACCOUNT-TYPE = '1' OR '2' OR '3' OR '5')                 
                CONTINUE                                                        
           ELSE                                                                 
                GO TO 5100-READ-POS-NEXT                                        
           END-IF                                                               
                                                                                
DJ0011***---IF B1 434737 IS ON, USE SETTLEMENT DATE QUANTITY                    
DJ0011***---ELSE USE TRADE DATE QUANTITY                                        
DJ0011     IF BH-ACAT-RCR-SETTLE-DATE-POS = '1'                                 
DJ0011        MOVE CUSHOL-CPH-SD-QTY TO W-CUSHOL-QTY                            
DJ0011     ELSE                                                                 
DJ0011        MOVE CUSHOL-CPH-TD-QTY TO W-CUSHOL-QTY                            
DJ0011     END-IF                                                               
                                                                                
      ** BYPASS ZERO QUANTITY                                                   
           IF  (W-CUSHOL-QTY               NOT NUMERIC)                         
                   OR                                                           
               (W-CUSHOL-QTY               = ZERO)                              
                GO TO 5100-READ-POS-NEXT                                        
           END-IF                                                               
                                                                                
DJ0005** BYPASS THESE SECURITIES                                                
DJ0005     MOVE CUSHOL-SECURITY-NO TO W-SEC-TO-BYPASS-FIELD                     
LRM035                                  VALIDATE-MMF-SECURITY                   
DJ0005     IF  W-IRA-SECURITY                                                   
LRM035     OR CUSHOL-SECURITY-NO = 'A000928'                                    
                GO TO 5100-READ-POS-NEXT                                        
DJ0005     END-IF                                                               
DJ0005     IF  W-ANNUITY-SECURITY                                               
                GO TO 5100-READ-POS-NEXT                                        
DJ0005     END-IF                                                               
DJ0005     IF  W-SPAD-SECURITY                                                  
                GO TO 5100-READ-POS-NEXT                                        
           END-IF                                                               
                                                                                
      ** BYPASS IF NOT ON MSD                                                   
           PERFORM 5400-GETMSDC THRU 5400-EXIT                                  
           IF  GETMSD-RETURN-VALID                                              
               CONTINUE                                                         
           ELSE                                                                 
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' ACC=' W-BR ' ' W-ACCT                               
                          ' SEC=' CUSHOL-SECURITY-NO (1:7)                      
                          ' #BYPASS '                                           
                          ' GETMSD-RETURN-CODE=' GETMSD-RETURN-CODE             
                        ' ' MS-DESC1                                            
               GO TO 5100-READ-POS-NEXT                                         
           END-IF.                                                              
                                                                                
ET0002** BH-ACAT-LIQUIDATE-MMF (B1 434510) = '2' OR '3'                         
ET0002** LIQUIDATE IF IN PRIMARY REDEMPTION LIST                                
ET0002**                                                                        
ET0002     MOVE W-CURRENT-CLIENT (2:3) TO  GETNA-KEY-CLIENT.                    
ET0002     MOVE '00'                   TO  GETNA-KEY-BRANCH1-2.                 
ET0002     MOVE  W-BR-X                TO  GETNA-KEY-BRANCH3-5.                 
ET0002     MOVE '00000'                TO  GETNA-KEY-ACCOUNT1-5.                
ET0002     MOVE  W-ACCT-X              TO  GETNA-KEY-ACCOUNT6-10.               
ET0002     CALL ZGETNA-PROGRAM      USING  GETNA-SENDING-PARAMETERS             
ET0002                               GETNA-SEGMENT-INCLUDES.                    
ET0002     IF  GETNA-RETURN-FOUND                                               
ET0002         ADD 1 TO W-GETNA-FND-CNT                                         
ET0002     ELSE                                                                 
ET0002         ADD 1 TO W-GETNA-NOTFND-CNT                                      
ET0002     END-IF.                                                              
ET0002                                                                          
ET0002     IF GETNA-RETURN-FOUND                                                
ET0002     AND (BH-ACAT-LIQUIDATE-MMF = '2' OR '3')                             
LRM016     AND CUSHOL-FRGN-CURR-CODE = '000'                                    
ET0002        MOVE SPACE TO W-MMF-FOUND                                         
ET0002        PERFORM VARYING  TBL-SUB FROM 1 BY 1                              
ET0002                  UNTIL  TBL-SUB > W-MMF-TBL-CNT                          
LRM010                     OR  W-MMF-FOUND = 'Y' OR 'T'                         
LRM041           IF W-MMF-SWEEP-CD (TBL-SUB) = NAPPA-EXP-FUND-NBR-N             
ET0002              IF W-MMF-SEC (TBL-SUB) = CUSHOL-SECURITY-NO                 
ET0002                 MOVE 'Y' TO W-MMF-FOUND                                  
LRM010              ELSE                                                        
LRM017                 PERFORM VARYING TH-SUB FROM 1 BY 1                       
LRM017                    UNTIL TH-SUB > W-THRESHOLD-TBL-CNT (TBL-SUB)          
LRM017                      IF W-MMF-THRESHOLD-FUND (TBL-SUB, TH-SUB)           
LRM017                                    = CUSHOL-SECURITY-NO                  
LRM017                         MOVE 'T' TO W-MMF-FOUND                          
LRM017                      END-IF                                              
LRM017                 END-PERFORM                                              
ET0002              END-IF                                                      
ET0002           END-IF                                                         
ET0002        END-PERFORM                                                       
ET0002        IF W-MMF-FOUND = 'Y'                                              
ET0002           COMPUTE W-BAL-MMKT = W-BAL-MMKT                                
DJ0011                              + CUSHOL-CPH-MKT-VAL                        
DJ0011           MOVE CUSHOL-CPH-MKT-VAL         TO W-AMT-DISPLAY               
DJ0010           DISPLAY 'INP=' W-INFILE-CNT                                    
DJ0010                ' CLT=' WF-CLIENT-NBR                                     
DJ0010                ' ACC=' W-BR ' ' W-ACCT                                   
DJ0010                ' SEC=' CUSHOL-SECURITY-NO (1:7)                          
DJ0010                ' CUS=' CUSHOL-CPH-CUSIP     (1:12)                       
DJ0010                ' SYM=' CUSHOL-CPH-SYMBOL    (1:8)                        
DJ0010                ' PRIMARY MMF FOUND   '                                   
DJ0010           ' AMT=' W-AMT-DISPLAY                                          
ET0002           GO TO 5100-READ-POS-NEXT                                       
LRM010        ELSE                                                              
LRM010        IF W-MMF-FOUND = 'T'                                              
LRM010           COMPUTE W-BAL-MMKT = W-BAL-MMKT                                
DJ0011                              + CUSHOL-CPH-MKT-VAL                        
DJ0011           MOVE CUSHOL-CPH-MKT-VAL         TO W-AMT-DISPLAY               
DJ0010           DISPLAY 'INP=' W-INFILE-CNT                                    
DJ0010                ' CLT=' WF-CLIENT-NBR                                     
DJ0010                ' ACC=' W-BR ' ' W-ACCT                                   
DJ0010                ' SEC=' CUSHOL-SECURITY-NO (1:7)                          
DJ0010                ' CUS=' CUSHOL-CPH-CUSIP     (1:12)                       
DJ0010                ' SYM=' CUSHOL-CPH-SYMBOL    (1:8)                        
DJ0010                ' THRESHOLD FUND SLOT ' TBL-SUB                           
DJ0010           ' QTY=' W-AMT-DISPLAY                                          
LRM010           GO TO 5100-READ-POS-NEXT                                       
LRM010        END-IF                                                            
ET0002        END-IF                                                            
ET0002     END-IF.                                                              
ET0002                                                                          
ET0002** ADD MONEY MARKET FUNDS TO BALANCE TYPE 1                               
ET0002** BH-ACAT-LIQUIDATE-MMF (B1 434510) = '3'                                
ET0002** LIQUIDATE IF IN SECONDARY REDEMPTION LIST                              
ET0002**                                                                        
ET0002     IF BH-ACAT-LIQUIDATE-MMF = '3'                                       
LRM016     AND CUSHOL-FRGN-CURR-CODE = '000'                                    
ET0002        MOVE SPACE TO W-MMF-FOUND                                         
ET0002        PERFORM VARYING TBL-SUB FROM 1 BY 1                               
ET0002                        UNTIL TBL-SUB > W-MMF-TBL-CNT                     
ET0002                           OR W-MMF-FOUND > SPACE                         
ET0002           IF W-MMF-SEC (TBL-SUB) = CUSHOL-SECURITY-NO                    
ET0002              MOVE W-MMF-REDMPT-IND (TBL-SUB)  TO W-MMF-FOUND             
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
ET0002           COMPUTE W-BAL-MMKT = W-BAL-MMKT +                              
DJ0011                                CUSHOL-CPH-MKT-VAL                        
DJ0011           MOVE CUSHOL-CPH-MKT-VAL         TO W-AMT-DISPLAY               
DJ0010           DISPLAY 'INP=' W-INFILE-CNT                                    
DJ0010                ' CLT=' WF-CLIENT-NBR                                     
DJ0010                ' ACC=' W-BR ' ' W-ACCT                                   
DJ0010                ' SEC=' CUSHOL-SECURITY-NO (1:7)                          
DJ0010                ' CUS=' CUSHOL-CPH-CUSIP     (1:12)                       
DJ0010                ' SYM=' CUSHOL-CPH-SYMBOL    (1:8)                        
DJ0010                ' SECONDARY MMF FOUND  '                                  
DJ0010           ' AMT=' W-AMT-DISPLAY                                          
ET0002           GO TO 5100-READ-POS-NEXT                                       
ET0002        END-IF                                                            
ET0002     END-IF.                                                              
                                                                                
DJ0010***IF SECURITY IS ON ACTRBSC TABLE,                                       
DJ0010***DELIVER MONEY MARKET FUND AS CASH                                      
DJ0010     PERFORM 5530-CHECK-ACTRBSC THRU 5530-EXIT                            
DJ0010     IF  W-ACTRBSC-FOUND                                                  
LRM016     AND CUSHOL-FRGN-CURR-CODE = '000'                                    
DJ0011         MOVE CUSHOL-CPH-MKT-VAL         TO W-AMT-DISPLAY                 
DJ0010         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0010                ' CLT=' WF-CLIENT-NBR                                     
DJ0010                ' ACC=' W-BR ' ' W-ACCT                                   
DJ0010                ' SEC=' CUSHOL-SECURITY-NO (1:7)                          
DJ0010                ' CUS=' CUSHOL-CPH-CUSIP     (1:12)                       
DJ0010                ' SYM=' CUSHOL-CPH-SYMBOL    (1:8)                        
DJ0010                ' ACTRBSC MMF DLVR AS CASH '                              
DJ0010           ' AMT=' W-AMT-DISPLAY                                          
DJ0010         COMPUTE W-BAL-MMKT = W-BAL-MMKT +                                
LRM052                              CUSHOL-CPH-MKT-VAL                          
DJ0010         GO TO 5100-READ-POS-NEXT                                         
DJ0010     END-IF                                                               
                                                                                
      ** ADD MONEY MARKET FUNDS TO BALANCE TYPE 1 IF B1 IS ON                   
ET0002** BH-ACAT-LIQUIDATE-MMF (B1 434510) = '1'                                
LRM003** THE FOLLOWING 5 LINES ADDED TO CAUSE MMF FUNDS TO CREATE               
LRM003** ASSETS RATHER THAN BE SKIPPED FOR NEW B1 SETTINGS 2, 3.                
LRM003     IF (BH-ACAT-LIQUIDATE-MMF = '2' OR '3')                              
LRM003     AND ((WK-MS-CLASS-1-2 = '15' AND WK-MS-CLASS-7 = '6')                
LRM003       OR (WK-MS-CLASS-1-2 = '63' AND WK-MS-CLASS-7 = '6'))               
LRM003           DISPLAY 'CREATE ASSET FOR MMF ' CUSHOL-SECURITY-NO             
LRM003     ELSE                                                                 
                                                                                
LRM037       IF (W-MONEY-MARKET-SECURITY                                        
LRM035       OR VALID-MMF-SECURITY)                                             
LRM016       AND CUSHOL-FRGN-CURR-CODE = '000'                                  
               IF (WK-MS-CLASS-1-2 = '15' AND WK-MS-CLASS-7 = '6')              
               OR (WK-MS-CLASS-1-2 = '63' AND WK-MS-CLASS-7 = '6')              
LRM052             MOVE CUSHOL-CPH-MKT-VAL   TO W-AMT-DISPLAY                   
                   IF BH-ACAT-LIQUIDATE-MMF = '1'                               
DJ0010                DISPLAY 'INP=' W-INFILE-CNT                               
DJ0010                ' CLT=' WF-CLIENT-NBR                                     
DJ0010                ' ACC=' W-BR ' ' W-ACCT                                   
DJ0010                ' SEC=' CUSHOL-SECURITY-NO (1:7)                          
DJ0010                ' CUS=' CUSHOL-CPH-CUSIP     (1:12)                       
DJ0010                ' SYM=' CUSHOL-CPH-SYMBOL    (1:8)                        
DJ0010                ' LIQUIDATE MMF SECURITY   '                              
DJ0010                ' AMT=' W-AMT-DISPLAY                                     
                      COMPUTE W-BAL-MMKT = W-BAL-MMKT +                         
LRM052                                     CUSHOL-CPH-MKT-VAL                   
                   END-IF                                                       
LRM035         ELSE                                                             
LRM035             DISPLAY 'UNEXPECTED CLASS CODE ' WK-MS-CLASS                 
LRM035               ' ON MMF SECURITY ' CUSHOL-SECURITY-NO (1:7)               
               END-IF                                                           
               GO TO 5100-READ-POS-NEXT                                         
DJ0005       END-IF                                                             
           END-IF.                                                              
                                                                                
LRM009*  BYPASS "F" RESCIND BLOCKS                                              
LRM008     EXEC SQL SELECT                                                      
LRM008              CLIENT_NBR                                                  
LRM008             ,BLOCK_CD                                                    
LRM008             ,SECURITY_ADP_NBR                                            
LRM008         INTO                                                             
LRM008              :DCLVRSDBLK.CLIENT-NBR                                      
LRM008             ,:DCLVRSDBLK.BLOCK-CD                                        
LRM008             ,:DCLVRSDBLK.SECURITY-ADP-NBR                                
LRM008         FROM VRSDBLK                                                     
LRM008        WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
LRM008          AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
LRM008          AND BRANCH_CD         = :W-BR-X                                 
LRM008          AND ACCT_CD           = :W-ACCT-X                               
LRM008          AND BLOCK_CD = 'F'                                              
LRM008     END-EXEC                                                             
LRM008                                                                          
LRM008     MOVE 'VRSDBLK '               TO W-DB2-TABLE-NAME                    
LRM008     MOVE 'SELECT'                 TO W-DB2-ACTION                        
LRM008     MOVE SQLCODE                  TO W-DB2-SQLCODE                       
LRM008                                                                          
LRM008     IF (SQLCODE  =  +0 OR -811)                                          
LRM008        DISPLAY 'INP=' W-INFILE-CNT                                       
LRM008            '    VRSDBLK FAIL REVERSAL FOUND FOR'                         
LRM008                             ' '  WF-CLIENT-NBR                           
LRM008                             ' '  W-BR-X                                  
LRM008                             ' '  W-ACCT-X                                
LRM008                             ' '  WK-MS-SEC                               
LRM008        GO TO 5100-READ-POS-NEXT                                          
LRM008     END-IF.                                                              
                                                                                
           ADD 1 TO W-POSIT-CNT                                                 
                                                                                
                                                                                
           MOVE ' '                TO W-VRSDSEC-FND-SW                          
           MOVE ' '                TO W-RCR-EXCLUDED-SW                         
           IF  W-VRSDSEC-ROW-CNT NOT = 0                                        
               MOVE CUSHOL-CPH-CUSIP   TO WF-ISIN-SEC-ISSUE-CD                  
               PERFORM 5130-CHECK-VRSDSEC THRU 5130-EXIT                        
               IF  W-VRSDSEC-FND-SW = 'Y'                                       
                   MOVE 'Y' TO W-RCR-EXCLUDED-SW                                
               END-IF                                                           
           END-IF.                                                              
                                                                                
      ** RESTRICTED SECURITIES                                                  
           MOVE ' ' TO W-RESTRICTED-SW                                          
           PERFORM 5500-CHECK-RESTRICTED THRU 5500-EXIT                         
           IF (W-VRSTSEC-FND-SW  = 'Y' AND W-VRSTBRKR-ROW-CNT = 0)              
           OR (W-VRSTSEC-FND-SW  = 'Y' AND W-VRSTBRKR-FND-SW  = 'Y')            
               MOVE 'Y' TO W-RESTRICTED-SW                                      
LRM005     ELSE                                                                 
LRM005         PERFORM 5520-CHECK-SEC-BLOCK THRU 5520-EXIT                      
LRM005         IF W-VRSDBLK-SEC-FND-SW  = 'Y'                                   
LRM005            MOVE 'Y' TO W-RESTRICTED-SW                                   
               ELSE                                                             
LRM028            MOVE 'N' TO W-MATURE-CALLED-BOND-SW                           
LRM028            IF  WK-MS-SEC-ID = 'B'                                        
LRM028            AND W-BOND-EXP-ACT NOT = '0'                                  
LRM028               PERFORM 5515-CHECK-BOND-MAT-RTN   THRU 5515-EXIT           
LRM028            END-IF                                                        
                                                                                
LRM028            IF (W-BOND-EXP-ACT = '1' OR '2' OR '3')                       
LRM028            AND (W-MATURE-CALLED-BOND-SW  = 'Y')                          
LRM028               DISPLAY 'CALLED/MATURE BOND BYPASSED '                     
LRM028                  CUSHOL-SECURITY-NO                                      
LRM028               MOVE 'Y' TO W-RESTRICTED-SW                                
LRM028               IF W-BOND-EXP-ACT = '3'                                    
LRM028                  DISPLAY 'SKIP INSERT AUD ROW ON RCR'                    
LRM028****              PERFORM 6020-INSERT-ACTIAST-AUD   THRU 6020-EXIT        
LRM028               END-IF                                                     
LRM028              END-IF                                                      
LRM028            END-IF                                                        
           END-IF.                                                              
                                                                                
           IF  CUSHOL-CPH-CUSIP (10:3)       = '090'                            
           AND BH-ACAT-WH-ASSET-CONTRA-CUSIP = '1'                              
                       DISPLAY 'INP=' W-INFILE-CNT                              
                              ' CLT=' WF-CLIENT-NBR                             
                              ' ACC=' W-BR ' ' W-ACCT                           
                              ' SEC=' CUSHOL-SECURITY-NO (1:7)                  
                              ' CUS=' CUSHOL-CPH-CUSIP     (1:12)               
                              ' SYM=' CUSHOL-CPH-SYMBOL    (1:8)                
                              ' WARNING: CONTRA-CUSIP '                         
                                WK-MS-DESC1                                     
           END-IF.                                                              
                                                                                
           PERFORM 5440-ASSET-PRICING-CATEGORY THRU 5440-EXIT                   
                                                                                
           INITIALIZE WORK-MEMOS-TABLE                                          
           MOVE 0  TO W-N4-MEMO-QTY                                             
                      W-TF-MEMO-QTY                                             
                      W-TL-MEMO-QTY                                             
                      W-SFK-MEMO-QTY                                            
                      W-WHOLD-MEMO-QTY                                          
                      W-MEMO-QTY-EXCLUDED                                       
                                                                                
           PERFORM 5540-GET-MRGIMM-MEMO THRU 5540-EXIT                          
                                                                                
DJ0011     MOVE W-CUSHOL-QTY               TO WORK-POS-QTY-LEFT                 
           IF  W-WHOLD-MEMO-QTY NOT = 0                                         
               COMPUTE WORK-POS-QTY-LEFT =                                      
DJ0011                                     W-CUSHOL-QTY                         
                                         - W-WHOLD-MEMO-QTY                     
               IF  WORK-POS-QTY-LEFT <= 0                                       
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' ACC=' W-BR ' ' W-ACCT                               
                          ' SEC=' CUSHOL-SECURITY-NO (1:7)                      
                   ' QTY<=0 AFTER SUBTRACTING WHOLD-MEMOS. BYPASS'              
                   GO TO 5100-READ-POS-NEXT                                     
               END-IF                                                           
           END-IF.                                                              
                                                                                
DJ0011     COMPUTE WORK-POS-QTY = W-CUSHOL-QTY                                  
                                - W-MEMO-QTY-EXCLUDED                           
           MOVE WORK-POS-QTY        TO WORK-POS-QTY-INTEGER                     
                                       WORK-POS-QTY-DECIMAL                     
DJ0015     IF  W-MEMO-QTY-EXCLUDED > 0                                          
DJ0015       IF WORK-POS-QTY < 0                                                
DJ0015         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0015                ' CLT=' WF-CLIENT-NBR                                     
DJ0015                ' ACC=' W-BR ' ' W-ACCT                                   
DJ0015                ' SEC=' CUSHOL-SECURITY-NO (1:7)                          
DJ0015         ' QTY < 0 AFTER SUBTRACTING W-MEMO-QTY-EXCLUDED. BYPASS'         
DJ0015         MOVE W-CUSHOL-QTY          TO W-QTY-DISPLAY                      
DJ0015         MOVE W-MEMO-QTY-EXCLUDED   TO W-QTY-DISPLAY-2                    
DJ0015         MOVE WORK-POS-QTY          TO W-QTY-DISPLAY-3                    
DJ0015         DISPLAY '    W-CUSHOL-QTY:' W-QTY-DISPLAY                        
DJ0015           ' - W-MEMO-QTY-EXCLUDED:' W-QTY-DISPLAY-2                      
DJ0015                  ' = WORK-POS-QTY:' W-QTY-DISPLAY-3                      
DJ0015         GO TO 5100-READ-POS-NEXT                                         
DJ0015       END-IF                                                             
DJ0015     END-IF                                                               
                                                                                
           PERFORM 7100-WRITE-ACATRCRF  THRU 7100-EXIT.                         
                                                                                
           GO TO 5100-READ-POS-NEXT.                                            
                                                                                
       5100-EXIT. EXIT.                                                         
      /                                                                         
       5130-CHECK-VRSDSEC       SECTION.                                        
           MOVE '5130-CHECK-VRSDSEC   ' TO W-ROUTINE-1.                         
                                                                                
           MOVE ' '                TO DCLVRSDSEC                                
                                                                                
           EXEC SQL SELECT                                                      
                        CLIENT_NBR                                              
                       ,ACCT_CD                                                 
                       ,BRANCH_CD                                               
                       ,ISIN_SEC_ISSUE_CD                                       
                       ,SECURITY_ADP_NBR                                        
                   INTO                                                         
                        :DCLVRSDSEC.CLIENT-NBR                                  
                       ,:DCLVRSDSEC.ACCT-CD                                     
                       ,:DCLVRSDSEC.BRANCH-CD                                   
                       ,:DCLVRSDSEC.ISIN-SEC-ISSUE-CD                           
                       ,:DCLVRSDSEC.SECURITY-ADP-NBR                            
                   FROM VRSDSEC                                                 
                  WHERE CLIENT_NBR        = :WF-CLIENT-NBR                      
                    AND BRANCH_CD         = :W-BR-X                             
                    AND ACCT_CD           = :W-ACCT-X                           
                    AND ISIN_SEC_ISSUE_CD = :WF-ISIN-SEC-ISSUE-CD               
           END-EXEC                                                             
                                                                                
           MOVE 'VRSDSEC '               TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
DJ0002****         DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0002****                ' CLT=' WF-CLIENT-NBR                                 
DJ0002****                ' ACC=' W-BR ' ' W-ACCT                               
DJ0002****                ' ' W-DB2-TABLE-NAME                                  
DJ0002****                ' ' W-DB2-ACTION                                      
DJ0002****                ' ' W-DB2-SQLCODE                                     
                                                                                
           IF  SQLCODE  =  +0                                                   
                   ADD 1 TO W-VRSDSEC-FND-CNT                                   
                   MOVE 'Y'               TO W-VRSDSEC-FND-SW                   
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                       '    VRSDSEC FOUND FOR'                                  
                                        ' '  WF-CLIENT-NBR                      
                                        ' '  W-BR-X                             
                                        ' '  W-ACCT-X                           
                                        ' '  WF-ISIN-SEC-ISSUE-CD               
           ELSE                                                                 
                   ADD 1 TO W-VRSDSEC-NOTFND-CNT                                
           END-IF.                                                              
                                                                                
       5130-EXIT. EXIT.                                                         
      /                                                                         
       5400-GETMSDC        SECTION.                                             
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
                                            WK-MS-SYMBOL-9                      
                                            WK-MS-DESC1                         
                                            WK-MS-DESC2                         
                                            WK-MS-DESC3                         
                                            WK-MS-SYMBOL                        
                                            WK-MS-XREF-NO                       
                                            WK-MS-WI-CODE                       
                                            WK-MS-BOND-REG-CODE                 
LRM038                                      WK-MS-ISIN                          
           MOVE 'D'                      TO GETMSD-DEVICE-IND.                  
           MOVE 'R'                      TO GETMSD-ACCESS-IND.                  
           MOVE 'E'                      TO GETMSD-FORMAT-IND.                  
           MOVE SPACE                    TO GETMSD-RETURN-CODE.                 
DJ0009     MOVE LOW-VALUES               TO GETMSD-SEARCH-KEY-AREA.             
           MOVE CUSHOL-SECURITY-NO       TO GETMSD-SEARCH-KEY.                  
LRM052     IF CUSHOL-WI                                                         
              MOVE '1'                   TO GETMSD-WI-CODE                      
LRM052     ELSE                                                                 
              MOVE '0'                   TO GETMSD-WI-CODE                      
LRM052     END-IF.                                                              
DJ0009     MOVE W-CURRENT-CLIENT-N       TO GETMSD-CLIENT-PL2.                  
                                                                                
           CALL ZGETMSDC-PROGRAM     USING MASTER-SECURITY-RECORD.              
                                                                                
           IF  GETMSD-RETURN-VALID                                              
               CONTINUE                                                         
           ELSE                                                                 
               GO TO 5400-EXIT                                                  
           END-IF.                                                              
                                                                                
           MOVE MS-CUSIP-NO              TO WK-MS-CUSIP                         
           MOVE MS-SYMBOL                TO WK-MS-SYMBOL-9                      
           MOVE MS-DESC1                 TO WK-MS-DESC1                         
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
                                                                                
DJ0008     EVALUATE TRUE                                                        
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-1                                        
DJ0008            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 1            
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-10                                       
DJ0008            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 10           
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-100                                      
DJ0008            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 100          
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-1000                                     
DJ0008            COMPUTE WK-MS-CLOSING-PRICE = MS-CLOSING-PRICE * 1000         
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-10000                                    
DJ0008            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0008                                      MS-CLOSING-PRICE * 10000            
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-100000                                   
DJ0008            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0008                                      MS-CLOSING-PRICE * 100000           
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-1000000                                  
DJ0008            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0008                                      MS-CLOSING-PRICE * 1000000          
DJ0008       WHEN MS-MULTIPLY-PRICE-BY-10000000                                 
DJ0008            COMPUTE WK-MS-CLOSING-PRICE =                                 
DJ0008                                      MS-CLOSING-PRICE * 10000000         
DJ0008       WHEN OTHER                                                         
                  MOVE MS-CLOSING-PRICE  TO WK-MS-CLOSING-PRICE                 
DJ0008     END-EVALUATE.                                                        
                                                                                
           MOVE MS-XREF-NO               TO WK-MS-XREF-NO                       
           MOVE MS-WI-CODE               TO WK-MS-WI-CODE                       
           MOVE MS-BOND-REG-CODE         TO WK-MS-BOND-REG-CODE                 
LRM038     IF NOT MSD-SEG-14-ABSENT                                             
LRM038        MOVE MSD-ISIN              TO WK-MS-ISIN                          
LRM038     END-IF.                                                              
                                                                                
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
               PERFORM 5410-GETMSDC-OPTION-RTN                                  
LRM040         IF  WK-MS-SYMBOL = SPACES OR LOW-VALUES                          
                   MOVE SPACES           TO WK-MS-SYMBOL-9                      
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' ACC=' W-BR ' ' W-ACCT                               
                          ' OPTION '  CUSHOL-SECURITY-NO (1:7)                  
                          ' SYMBOL IS BLANK.'                                   
                          ' DESC = ' WK-MS-DESC1                                
                   PERFORM 5415-GETMSD-OPT-SYMBOL THRU 5415-EXIT                
               ELSE                                                             
LRM023*** PARA 5420- IS SUNSET FOR OPTION SYMBOLOGY CHANGE, OPRA CODE           
LRM023***  IS NOT LONGER AVAILABLE.                                             
LRM023****        IF L-STREAM NOT = 'Q'                                         
                     PERFORM 5420-SCAN-FOR-OPT-SYM THRU 5420-EXIT               
LRM023****        END-IF                                                        
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
LRM023     MOVE MS-EXP-OPT-STRIKE-PRC      TO WK-MS-OPT-PRICE-NEW               
LRM054*****MOVE MS-OPTION-FACTOR           TO WK-MS-OPTION-FACTOR               
LRM054     MOVE MSD-OPTION-FACTOR-N        TO WK-MS-OPTION-FACTOR               
ET0005     MOVE MSD-FRACTION-DECIMAL-IND   TO WK-MSD-FRAC-DECI-IND              
                                                                                
LRM023**** IF L-STREAM NOT = 'Q'                                                
      ****    IF  WK-MS-OPT-FRAC = ZERO                                         
      ****        MOVE ZERO                 TO WK-MS-OPT-FRAC-1                 
ET0005****                                     WK-MS-OPT-DECI-ROUNDED           
ET0005****    ELSE                                                              
ET0005****    IF  MSD-FRACTION-DECIMAL-IND = 'D'                                
ET0005****        COMPUTE WK-MS-OPT-DECI-ROUNDED = WK-MS-OPT-FRAC / 1000        
ET0005****        END-COMPUTE                                                   
ET0005****        DISPLAY 'USING DECIMAL STRIKE PRICE FOR '                     
ET0005****              WK-MS-SEC ' ' WK-MS-OPT-DECI-ROUNDED                    
      ****   ELSE                                                               
      ****        COMPUTE WK-MS-OPT-FRAC-6 = WK-MS-OPT-FRAC * 8                 
      ****        END-COMPUTE                                                   
LRM023****    END-IF                                                            
      **** END-IF.                                                              
LRM023**** IF L-STREAM = 'Q'                                                    
LRM023        MOVE MSD-OCC-OPTN-SYM-ID TO WK-MS-SYMBOL.                         
LRM023**** END-IF.                                                              
                                                                                
       5410-EXIT. EXIT.                                                         
      /                                                                         
       5415-GETMSD-OPT-SYMBOL.                                                  
                                                                                
           MOVE 'D'                      TO GETMSD-DEVICE-IND.                  
           MOVE 'R'                      TO GETMSD-ACCESS-IND.                  
           MOVE 'E'                      TO GETMSD-FORMAT-IND.                  
           MOVE SPACE                    TO GETMSD-RETURN-CODE.                 
DJ0009     MOVE LOW-VALUES               TO GETMSD-SEARCH-KEY-AREA.             
           MOVE WK-MS-XREF-NO            TO GETMSD-SEARCH-KEY.                  
           MOVE '0'                      TO GETMSD-WI-CODE                      
DJ0009     MOVE W-CURRENT-CLIENT-N       TO GETMSD-CLIENT-PL2.                  
                                                                                
           CALL ZGETMSDC-PROGRAM     USING MASTER-SECURITY-RECORD.              
                                                                                
           IF  GETMSD-RETURN-VALID                                              
               MOVE MS-SYMBOL-AREA       TO WK-MS-SYMBOL-9                      
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' ACC=' W-BR ' ' W-ACCT                               
*                         ' OPTION '  CUSHOL-SECURITY-NO (1:7)                  
*                         ' UNDERLYING SEC= ' WK-MS-XREF-NO                     
*                         ' FOUND SYMBOL = ' WK-MS-SYMBOL-9                     
           ELSE                                                                 
*              MOVE ' '                  TO WK-MS-SYMBOL-9                      
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' ACC=' W-BR ' ' W-ACCT                               
*                         ' OPTION '  CUSHOL-SECURITY-NO (1:7)                  
*                         ' UNDERLYING SEC= ' WK-MS-XREF-NO                     
*                         ' SYMBOL NOT FOUND '                                  
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
DJ0005         (WK-MS-SEC > '1999999' AND < '2200000'))                         
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
                   PERFORM 5431-GETMSDC-FOR-BOND                                
               WHEN OTHER                                                       
                   PERFORM 5431-GETMSDC-FOR-BOND                                
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
       5440-ASSET-PRICING-CATEGORY SECTION.                                     
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
DJ0004         MOVE 'ZERO' TO W-ASSET-PRC-CTGY-CD                               
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
              (WK-MS-CLASS-5-6-7 = '211' OR '711'))                             
           OR (WK-MS-CLASS-1 = '2'  AND                                         
              (WK-MS-CLASS-5-6-7 = '210' OR '710'))                             
               MOVE 'GOVT' TO W-ASSET-PRC-CTGY-CD                               
               GO TO 5440-EXIT                                                  
           END-IF.                                                              
                                                                                
DJ0004     IF  WK-MS-CLASS-1 = '2'                                              
DJ0004     AND (WK-MS-CLASS-4-5   NOT = '21' AND '71')                          
DJ0004     AND (WK-MS-CLASS-2     NOT = '9'                                     
DJ0004     AND  WK-MS-CLASS-5     NOT = '1')                                    
DJ0004     AND (WK-MS-CLASS-5-6-7 NOT = '701' AND '702' AND '703')              
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
       5500-CHECK-RESTRICTED     SECTION.                                       
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
                                                                                
           MOVE 'VRSTBRKR'               TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
                   IF  W-VRSTBRKR-ROW-CNT > 0                                   
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' ACC=' W-BR ' ' W-ACCT                               
                          ' SEC=' WK-MS-SEC                                     
                          ' VRSTBRKR FOUND'                                     
                          ' CNT='  W-VRSTBRKR-ROW-CNT                           
                   END-IF                                                       
           END-IF.                                                              
                                                                                
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,ISIN_SEC_ISSUE_CD                                           
                   ,BRKR_CONTRA_NBR                                             
                   ,SECURITY_ADP_NBR                                            
               INTO                                                             
                    :DCLVRSTBRKR.CLIENT-NBR                                     
                   ,:DCLVRSTBRKR.ISIN-SEC-ISSUE-CD                              
                   ,:DCLVRSTBRKR.BRKR-CONTRA-NBR                                
                   ,:DCLVRSTBRKR.SECURITY-ADP-NBR                               
               FROM VRSTBRKR                                                    
              WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
                AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
                AND BRKR_CONTRA_NBR   = :WF-RCV-NBR                             
           END-EXEC                                                             
                                                                                
           MOVE 'VRSTBRKR'               TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VRSTBRKR-FND-CNT                                      
               MOVE 'Y'            TO W-VRSTBRKR-FND-SW                         
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' WF-CLIENT-NBR                                 
                          ' ACC=' W-BR ' ' W-ACCT                               
                          ' SEC=' WK-MS-SEC                                     
                          ' RESTRICTED BRK FOUND'                               
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
                   ,SECURITY_ADP_NBR                                            
               INTO                                                             
                    :DCLVRSTSEC.CLIENT-NBR                                      
                   ,:DCLVRSTSEC.ISIN-SEC-ISSUE-CD                               
                   ,:DCLVRSTSEC.TRNFR-MEMO-IND                                  
                   ,:DCLVRSTSEC.TRNFR-BRKR-TYPE-CD                              
                   ,:DCLVRSTSEC.RSTRD-MSG-TXT                                   
                   ,:DCLVRSTSEC.SECURITY-ADP-NBR                                
               FROM VRSTSEC                                                     
              WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
                AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
                AND TRNFR_BRKR_TYPE_CD IN ('D','B')                             
           END-EXEC                                                             
                                                                                
           MOVE 'VRSTSEC '               TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VRSTSEC-FND-CNT                                       
               MOVE 'Y'               TO W-VRSTSEC-FND-SW                       
           ELSE                                                                 
               ADD 1 TO W-VRSTSEC-NOTFND-CNT                                    
               MOVE 'N'               TO W-VRSTSEC-FND-SW                       
           END-IF.                                                              
                                                                                
       5500-EXIT. EXIT.                                                         
      /                                                                         
LRM028 5515-CHECK-BOND-MAT-RTN   SECTION.                                       
TEST       DISPLAY 'WE ARE IN 5515- CALL/MAT LOOKUP'.                           
TEST       DISPLAY 'PRE-IND ' CUSHOL-CPH-CALL-PRE-IND                           
            ' PRE-DATE ' CUSHOL-CPH-CALL-PRE-DATE                               
            ' CALC EXP ' WK-BOND-EXP-DATE                                       
                                                                                
TEST       DISPLAY 'READING VBNDFTRV FOR FULLY CALLED ' WK-MS-SEC               
                                                                                
LRM029**** READ DB2 MSD...                                                      
LRM029     EXEC SQL SELECT                                                      
LRM029            RATE_BOND_DT                                                  
LRM029           ,TYPE_RATE_CD                                                  
LRM029         INTO                                                             
LRM029              :DCLVBNDFTRV.RATE-BOND-DT                                   
LRM029             ,:DCLVBNDFTRV.TYPE-RATE-CD                                   
LRM029         FROM VBNDFTRV                                                    
LRM029        WHERE SECURITY_ADP_NBR  = :WK-MS-SEC                              
LRM029          AND TYPE_RATE_CD      = 'FC'                                    
LRM029     END-EXEC                                                             
LRM029                                                                          
LRM029     IF (SQLCODE  =  +0 OR -811)                                          
LRM029       IF RATE-BOND-DT NOT > WK-MS-BOND-EXP-DATE-DB2                      
LRM029         ADD 1 TO W-VBNDFTRV-FND-CNT                                      
LRM029         DISPLAY 'FULLY CALLED BOND: CUSIP=' WK-MS-CUSIP                  
LRM029                                       ' ' WK-MS-SEC                      
LRM029                                  ' MSD=' RATE-BOND-DT                    
LRM029                        ' CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                
LRM029         MOVE 'Y'               TO W-MATURE-CALLED-BOND-SW                
LRM029*******  MOVE 'CALLED BOND'     TO W-ASSET-CMNT-TXT                       
LRM029         ADD 1 TO W-MATURE-FND-CNT                                        
LRM029         GO TO 5515-EXIT                                                  
LRM029       ELSE                                                               
LRM029          DISPLAY 'BOND DATE ' RATE-BOND-DT                               
LRM029          ' NOT WITHIN CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                   
LRM029     ELSE                                                                 
LRM029         IF SQLCODE  <  +0                                                
LRM029            MOVE SQLCODE      TO W-DB2-SQLCODE                            
LRM029            DISPLAY ' VBNDFTRV ERROR: ' WF-CLIENT-NBR                     
LRM029                                     ' ' WK-MS-SEC                        
LRM029                    ' SQLCODE = ' W-DB2-SQLCODE                           
LRM029         END-IF                                                           
LRM029     END-IF.                                                              
                                                                                
TEST       DISPLAY 'READING VBNDFTRV FOR PRTL CALLED ' WK-MS-SEC                
                                                                                
LRM029     EXEC SQL SELECT                                                      
LRM029            RATE_BOND_DT                                                  
LRM029         INTO                                                             
LRM029              :DCLVBNDFTRV.RATE-BOND-DT                                   
LRM029         FROM VBNDFTRV                                                    
LRM029        WHERE SECURITY_ADP_NBR  = :WK-MS-SEC                              
LRM029          AND TYPE_RATE_CD      = 'PD'                                    
LRM029          AND FEATURE_FRQNC_CD  = 'AC'                                    
LRM029          AND RATE_BOND_DT      > :WK-TODAY-DB2                           
LRM029     END-EXEC                                                             
LRM029                                                                          
TEST       DISPLAY 'SQLCODE ' SQLCODE                                           
LRM029     IF (SQLCODE  =  +0 OR -811)                                          
LRM029       IF RATE-BOND-DT NOT > WK-MS-BOND-EXP-DATE-DB2                      
LRM029       AND RATE-BOND-DT > WK-TODAY-DB2                                    
LRM029         ADD 1 TO W-VBNDFTRV-FND-CNT                                      
LRM029         DISPLAY 'PRTL CALLED BOND: CUSIP=' WK-MS-CUSIP                   
LRM029                                       ' ' WK-MS-SEC                      
LRM029                                  ' MSD=' RATE-BOND-DT                    
LRM029                        ' CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                
LRM029         MOVE 'Y'               TO W-MATURE-CALLED-BOND-SW                
LRM029*******  MOVE 'CALLED BOND'     TO W-ASSET-CMNT-TXT                       
LRM029         ADD 1 TO W-MATURE-FND-CNT                                        
LRM029         GO TO 5515-EXIT                                                  
LRM029       ELSE                                                               
LRM029         ADD 1 TO W-VBNDFTRV-NOTFND                                       
LRM029         MOVE 'N'               TO W-MATURE-CALLED-BOND-SW                
LRM029          DISPLAY 'BOND DATE ' RATE-BOND-DT                               
LRM029          ' NOT WITHIN CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                   
LRM029          ' AND GREATER THAN TODAY ' WK-TODAY-DB2                         
LRM029     ELSE                                                                 
LRM029         ADD 1 TO W-VBNDFTRV-NOTFND                                       
LRM029         MOVE 'N'               TO W-MATURE-CALLED-BOND-SW                
LRM029         IF SQLCODE  <  +0                                                
LRM029            MOVE SQLCODE      TO W-DB2-SQLCODE                            
LRM029            DISPLAY ' VBNDFTRV ERROR: ' WF-CLIENT-NBR                     
LRM029                                     ' ' WK-MS-SEC                        
LRM029                    ' SQLCODE = ' W-DB2-SQLCODE                           
LRM029         END-IF                                                           
LRM029     END-IF.                                                              
LRM029                                                                          
TEST       DISPLAY 'READING VBNDDT FOR ' WK-MS-SEC                              
                                                                                
LRM028**** READ DB2 MSD...                                                      
LRM028     EXEC SQL SELECT                                                      
LRM028            MATURITY_DT                                                   
LRM028         INTO                                                             
LRM028              :DCLVBNDDT.MATURITY-DT                                      
LRM028         FROM VBNDDT                                                      
LRM028        WHERE SECURITY_ADP_NBR  = :WK-MS-SEC                              
LRM028     END-EXEC                                                             
LRM028                                                                          
LRM028     IF  SQLCODE  =  +0                                                   
LRM028     AND MATURITY-DT NOT > WK-MS-BOND-EXP-DATE-DB2                        
LRM028         ADD 1 TO W-VBNDDT-FND-CNT                                        
LRM028         DISPLAY '   MATURED BOND: CUSIP=' WK-MS-CUSIP                    
LRM028                                       ' ' WK-MS-SEC                      
LRM028                                  ' MSD=' MATURITY-DT                     
LRM028                        ' CUTOFF ' WK-MS-BOND-EXP-DATE-DB2                
LRM028         MOVE 'Y'               TO W-MATURE-CALLED-BOND-SW                
LRM028******** MOVE 'MATURE BOND'     TO W-ASSET-CMNT-TXT                       
LRM028     ELSE                                                                 
LRM028         ADD 1 TO W-VBNDDT-NOTFND-CNT                                     
LRM028         MOVE 'N'               TO W-MATURE-CALLED-BOND-SW                
LRM028         IF SQLCODE  <  +0                                                
LRM028            MOVE SQLCODE      TO W-DB2-SQLCODE                            
LRM028            DISPLAY '   VBNDDT ERROR: ' WF-CLIENT-NBR                     
LRM028                                     ' ' WK-MS-SEC                        
LRM028                    ' SQLCODE = ' W-DB2-SQLCODE                           
LRM028         END-IF                                                           
LRM028     END-IF.                                                              
LRM028                                                                          
LRM028 5515-EXIT. EXIT.                                                         
                                                                                
LRM005 5520-CHECK-SEC-BLOCK      SECTION.                                       
           MOVE '5520-CHECK-SEC-BLOCK          ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                TO DCLVRSDBLK                                
           MOVE ' '                TO W-VRSDBLK-SEC-FND-SW                      
                                                                                
                                                                                
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,BLOCK_CD                                                    
                   ,SECURITY_ADP_NBR                                            
               INTO                                                             
                    :DCLVRSDBLK.CLIENT-NBR                                      
                   ,:DCLVRSDBLK.BLOCK-CD                                        
                   ,:DCLVRSDBLK.SECURITY-ADP-NBR                                
               FROM VRSDBLK                                                     
              WHERE CLIENT_NBR        = :WF-CLIENT-NBR                          
DJ0007          AND BRANCH_CD         = :W-BR-X                                 
DJ0007          AND ACCT_CD           = :W-ACCT-X                               
                AND SECURITY_ADP_NBR  = :WK-MS-SEC                              
                AND BLOCK_CD = 'S'                                              
           END-EXEC                                                             
                                                                                
           MOVE 'VRSDBLK '               TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
           AND BH-ACAT-BLOCK-SECURITY-IND > '0'                                 
               ADD 1 TO W-VRSDBLK-SEC-FND-CNT                                   
               MOVE 'Y'               TO W-VRSDBLK-SEC-FND-SW                   
               DISPLAY 'INP=' W-INFILE-CNT                                      
                  '    SECURITY BLOCK FOUND FOR'                                
                                   ' '  WF-CLIENT-NBR                           
                                   ' '  W-BR-X                                  
                                   ' '  W-ACCT-X                                
                                   ' '  WK-MS-SEC                               
           ELSE                                                                 
               MOVE 'N'               TO W-VRSDBLK-SEC-FND-SW                   
           END-IF.                                                              
                                                                                
       5520-EXIT. EXIT.                                                         
      /                                                                         
DJ0010 5530-CHECK-ACTRBSC        SECTION.                                       
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
DJ0010          AND BRANCH_CD         = :W-BR-X                                 
DJ0010          AND ACCT_CD           = :W-ACCT-X                               
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
       5540-GET-MRGIMM-MEMO     SECTION.                                        
           MOVE '5540-GET-MRGIMM-MEMO           ' TO W-ROUTINE-1.               
                                                                                
           MOVE 0                        TO W-SFK-MEMO-QTY                      
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
       5541-CHECK-N4-MEMO SECTION.                                              
           MOVE '5541-CHECK-N5-MEMO             ' TO W-ROUTINE-1.               
                                                                                
           MOVE 'N' TO W-MRGIMM-N4-FND-SW                                       
                                                                                
           PERFORM VARYING W-MM-SUB FROM 1 BY 1 UNTIL                           
                  W-MM-SUB > MRGI-MEMO-OCCURS-NO                                
                                                                                
             IF MRGI-FAM-IND  (W-MM-SUB) = 'N4'                                 
             OR MRGI-MEMO-IND (W-MM-SUB) = 'N4'                                 
                      MOVE 'Y' TO W-MRGIMM-N4-FND-SW                            
                        MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-N4-MEMO-QTY          
                        MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY          
                        DISPLAY 'INP=' W-INFILE-CNT                             
                               ' CLT=' WF-CLIENT-NBR                            
                               ' ACC=' W-BR ' ' W-ACCT                          
                               ' SEC=' CUSHOL-SECURITY-NO (1:7)                 
                               ' MRGIMM N4 MEMO '                               
                               ' FAM=' MRGI-FAM-IND (W-MM-SUB)                  
                               ' MEM=' MRGI-MEMO-IND (W-MM-SUB)                 
                               ' QTY=' W-QTY-DISPLAY                            
               DISPLAY '   '                                                    
                       'B1#511220 AND LEVEL-4. IGNORE SFK MEMO QTY'             
             END-IF                                                             
           END-PERFORM.                                                         
                                                                                
       5541-EXIT. EXIT.                                                         
      /                                                                         
       5542-CHECK-B1-MEMO SECTION.                                              
           MOVE '5542-CHECK-B1-MEMO             ' TO W-ROUTINE-1.               
                                                                                
           PERFORM VARYING W-MM-SUB FROM 1 BY 1 UNTIL                           
                  W-MM-SUB > MRGI-MEMO-OCCURS-NO                                
                                                                                
             MOVE 'N' TO W-MRGIMM-MEMO-FND-SW                                   
                                                                                
             PERFORM VARYING SUB1 FROM 1 BY 1 UNTIL                             
                  SUB1 > BH-ACAT-WHOLD-STK-REC-MEMO-NO                          
                  OR  W-MRGIMM-MEMO-FND-SW = 'Y'                                
               IF BH-ACAT-WHOLD-BY-STK-REC-MEMO (SUB1) =                        
                  'SK' OR 'SN' OR 'TL' OR 'TF'                                  
                  CONTINUE                                                      
               ELSE                                                             
                 IF MRGI-MEMO-IND (W-MM-SUB) =                                  
                                   BH-ACAT-WHOLD-BY-STK-REC-MEMO (SUB1)         
                    MOVE 'Y' TO W-MRGIMM-MEMO-FND-SW                            
                    ADD MRGI-MEMO-QTY (W-MM-SUB)                                
                                              TO W-MEMO-QTY-EXCLUDED            
                                                 W-WHOLD-MEMO-QTY               
                    MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY              
                        DISPLAY 'INP=' W-INFILE-CNT                             
                               ' CLT=' WF-CLIENT-NBR                            
                               ' ACC=' W-BR ' ' W-ACCT                          
                               ' SEC=' CUSHOL-SECURITY-NO (1:7)                 
                               ' MRGIMM B1 MEMO '                               
                                 BH-ACAT-WHOLD-BY-STK-REC-MEMO (SUB1)           
                               ' FND:'                                          
                               ' FAM=' MRGI-FAM-IND (W-MM-SUB)                  
                               ' MEM=' MRGI-MEMO-IND (W-MM-SUB)                 
                               ' QTY=' W-QTY-DISPLAY                            
                 END-IF                                                         
               END-IF                                                           
             END-PERFORM                                                        
                                                                                
             IF  W-MRGIMM-MEMO-FND-SW = 'Y'                                     
                 CONTINUE                                                       
             ELSE                                                               
                 IF (MRGI-FAM-IND (W-MM-SUB) = 'SK' OR 'SN')                    
                 AND W-MRGIMM-N4-FND-SW = 'N'                                   
                        MOVE MRGI-MEMO-QTY (W-MM-SUB)                           
                                               TO   W-SFK-MEMO-QTY              
                                                    W-QTY-DISPLAY               
                        ADD MRGI-MEMO-QTY (W-MM-SUB)                            
                                               TO W-MEMO-QTY-EXCLUDED           
                        MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY          
                        DISPLAY 'INP=' W-INFILE-CNT                             
                               ' CLT=' WF-CLIENT-NBR                            
                               ' ACC=' W-BR ' ' W-ACCT                          
                               ' SEC=' CUSHOL-SECURITY-NO (1:7)                 
                               ' MRGIMM SF MEMO '                               
                               ' FAM=' MRGI-FAM-IND (W-MM-SUB)                  
                               ' MEM=' MRGI-MEMO-IND (W-MM-SUB)                 
                               ' QTY=' W-QTY-DISPLAY                            
                 ELSE                                                           
                   IF MRGI-FAM-IND (W-MM-SUB) = 'TF'                            
                        MOVE MRGI-MEMO-QTY (W-MM-SUB)                           
                                               TO   W-TF-MEMO-QTY               
                        ADD MRGI-MEMO-QTY (W-MM-SUB)                            
                                               TO W-MEMO-QTY-EXCLUDED           
                        MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY          
                        DISPLAY 'INP=' W-INFILE-CNT                             
                               ' CLT=' WF-CLIENT-NBR                            
                               ' ACC=' W-BR ' ' W-ACCT                          
                               ' SEC=' CUSHOL-SECURITY-NO (1:7)                 
                               ' MRGIMM TF MEMO '                               
                               ' FAM=' MRGI-FAM-IND (W-MM-SUB)                  
                               ' MEM=' MRGI-MEMO-IND (W-MM-SUB)                 
                               ' QTY=' W-QTY-DISPLAY                            
                   ELSE                                                         
                     IF MRGI-FAM-IND (W-MM-SUB) = 'TL'                          
                        MOVE MRGI-MEMO-QTY (W-MM-SUB)                           
                                               TO   W-TL-MEMO-QTY               
                        ADD MRGI-MEMO-QTY (W-MM-SUB)                            
                                               TO W-MEMO-QTY-EXCLUDED           
                        MOVE MRGI-MEMO-QTY (W-MM-SUB) TO W-QTY-DISPLAY          
                        DISPLAY 'INP=' W-INFILE-CNT                             
                               ' CLT=' WF-CLIENT-NBR                            
                               ' ACC=' W-BR ' ' W-ACCT                          
                               ' SEC=' CUSHOL-SECURITY-NO (1:7)                 
                               ' MRGIMM TL MEMO '                               
                               ' FAM=' MRGI-FAM-IND (W-MM-SUB)                  
                               ' MEM=' MRGI-MEMO-IND (W-MM-SUB)                 
                               ' QTY=' W-QTY-DISPLAY                            
                     END-IF                                                     
                   END-IF                                                       
                 END-IF                                                         
             END-IF                                                             
                                                                                
           END-PERFORM.                                                         
                                                                                
       5542-EXIT. EXIT.                                                         
      /                                                                         
       5600-LOAD-BALANCES  SECTION.                                             
           MOVE '5600-LOAD-BALANCES            ' TO W-ROUTINE-1.                
                                                                                
           IF  BH-ACAT-TYPE-3-BALANCES = '1'                                    
           COMPUTE W-WORK-BAL =  W-BAL-TYPE1 + W-BAL-TYPE3 - W-BAL-MMKT         
           ELSE                                                                 
               COMPUTE W-WORK-BAL =  W-BAL-TYPE1 - W-BAL-MMKT                   
           END-IF                                                               
ET0001**<< B1:434675 - CASH BALANCE ADJUSTED BY PENDING AMOUNT >>               
ET0001     IF BH-ACAT-BALANCE-ADJUSTMENT = '1'                                  
ET0001        IF W-BAL-PENDING-AMOUNT  NOT = ZERO                               
ET0001           ADD  W-BAL-PENDING-AMOUNT  TO W-WORK-BAL                       
ET0001           MOVE W-WORK-BAL            TO W-BALANCE-DISPLAY                
ET0001           MOVE W-BAL-CLT             TO W-CLT-DISPLAY                    
ET0001           MOVE W-BAL-PENDING-AMOUNT  TO W-AMT-DISPLAY                    
ET0001             DISPLAY 'INP='  W-INFILE-CNT                                 
ET0001                     ' CLT=' W-CLT-DISPLAY                                
ET0001                     ' ACC=' W-BAL-BR                                     
ET0001                     ' '     W-BAL-ACCT                                   
ET0001                     '  HAS PENDING AMT ' W-AMT-DISPLAY                   
ET0001        END-IF                                                            
ET0001     END-IF                                                               
           MOVE W-WORK-BAL               TO W-WORK-BAL-UNSIGN                   
           IF  W-WORK-BAL-UNSIGN NOT = 0                                        
               MOVE 'C'                  TO W-CSH-MGN-SHT                       
               MOVE 'CASH'               TO W-CASH-SMA                          
               PERFORM 7200-WRITE-BALANCES  THRU 7200-EXIT                      
           END-IF                                                               
                                                                                
           COMPUTE W-WORK-BAL =  W-BAL-TYPE2                                    
           MOVE W-WORK-BAL               TO W-WORK-BAL-UNSIGN                   
           IF  W-WORK-BAL-UNSIGN NOT = 0                                        
               MOVE 'M'                  TO W-CSH-MGN-SHT                       
               MOVE 'CASH'               TO W-CASH-SMA                          
               PERFORM 7200-WRITE-BALANCES  THRU 7200-EXIT                      
           END-IF                                                               
                                                                                
           COMPUTE W-WORK-BAL =  W-BAL-TYPE5                                    
           MOVE W-WORK-BAL               TO W-WORK-BAL-UNSIGN                   
           IF  W-WORK-BAL-UNSIGN NOT = 0                                        
               MOVE 'S'                  TO W-CSH-MGN-SHT                       
               MOVE 'CASH'               TO W-CASH-SMA                          
               PERFORM 7200-WRITE-BALANCES  THRU 7200-EXIT                      
           END-IF.                                                              
                                                                                
           COMPUTE W-WORK-BAL =  W-BAL-SMA                                      
           MOVE W-WORK-BAL               TO W-WORK-BAL-UNSIGN                   
           IF  W-WORK-BAL-UNSIGN NOT = 0                                        
               MOVE 'M'                  TO W-CSH-MGN-SHT                       
               MOVE 'SMA '               TO W-CASH-SMA                          
               PERFORM 7200-WRITE-BALANCES  THRU 7200-EXIT                      
           END-IF.                                                              
                                                                                
                                                                                
       5600-EXIT. EXIT.                                                         
      /                                                                         
       5700-LOAD-EXCEPTION SECTION.                                             
           MOVE '5700-LOAD-EXCEPTION           ' TO W-ROUTINE-1.                
                                                                                
DJ0002***--CREATE A DUMMY BALANCE RECORD TO INDICATE EQUITY EXCEPTION           
DJ0002     IF  BH-ACAT-RESIDUAL-CR-EQUITY-IND = '1'                             
DJ0002     AND BH-ACAT-RESIDUAL-CR-EQUITY-AMT NUMERIC                           
DJ0002     AND BH-ACAT-RESIDUAL-CR-EQUITY-AMT > 0                               
DJ0002         IF  W-BAL-EQUITY > BH-ACAT-RESIDUAL-CR-EQUITY-AMT                
DJ0002*************MOVE*W-BAL-EQUITY*TO*W-BAL-DISPLAY*******************        
DJ0002*************DISPLAY*'EXC='*W-INFILE-CNT**************************        
DJ0002********************'*CLT='*WF-CLIENT-NBR*************************        
DJ0002********************'*ACC='*W-BR*'*'*W-ACCT***********************        
DJ0002********************'*EQY='*W-BAL-DISPLAY*************************        
DJ0002*******************'*>*B1='*BH-ACAT-RESIDUAL-CR-EQUITY-AMT********        
DJ0002             MOVE 'Y' TO W-EXCEPTION-IND                                  
DJ0002             MOVE 'Y' TO W-EQUITY-EXC-IND                                 
DJ0002             COMPUTE W-WORK-BAL =  W-BAL-EQUITY * -1                      
DJ0002             MOVE W-WORK-BAL           TO W-WORK-BAL-UNSIGN               
DJ0002             MOVE 'E'                  TO W-CSH-MGN-SHT                   
DJ0002             MOVE 'EQTY'               TO W-CASH-SMA                      
DJ0002             PERFORM 7200-WRITE-BALANCES  THRU 7200-EXIT                  
DJ0002         END-IF                                                           
DJ0002     END-IF.                                                              
                                                                                
DJ0002***--CREATE A DUMMY BALANCE RECORD TO INDICATE STLDATE EXCEPTION          
DJ0002     IF  BH-ACAT-RESIDUAL-CR-STL-DT-IND = '1'                             
DJ0002     AND BH-ACAT-RESIDUAL-CR-STL-DT-DAY NUMERIC                           
DJ0002     AND BH-ACAT-RESIDUAL-CR-STL-DT-DAY > 0                               
DJ0002     AND W-STL-DATE <= W-EXC-DATE                                         
DJ0002*********DISPLAY*'EXC='*W-INFILE-CNT******************************        
DJ0002****************'*CLT='*WF-CLIENT-NBR*****************************        
DJ0002****************'*ACC='*W-BR*'*'*W-ACCT***************************        
DJ0002****************'*STD='*W-STL-DATE********************************        
DJ0002****************'*<=*B1='*W-EXC-DATE******************************        
DJ0002****************'*DAY='*BH-ACAT-RESIDUAL-CR-STL-DT-DAY************        
DJ0002         MOVE 'Y' TO W-EXCEPTION-IND                                      
DJ0002         MOVE 'Y' TO W-STLDAT-EXC-IND                                     
DJ0002         MOVE 0 TO W-WORK-BAL W-WORK-BAL-UNSIGN                           
DJ0002             MOVE 'E'                  TO W-CSH-MGN-SHT                   
DJ0002             MOVE 'STLD'               TO W-CASH-SMA                      
DJ0002             PERFORM 7200-WRITE-BALANCES  THRU 7200-EXIT                  
DJ0002     END-IF.                                                              
                                                                                
       5700-EXIT. EXIT.                                                         
      /                                                                         
       6700-SELECT-VTRNFR         SECTION.                                      
           MOVE '6700-SELECT-VTRNFR            ' TO W-ROUTINE-1.                
                                                                                
           MOVE ' '                TO W-TRANSFER-FND-SW                         
           INITIALIZE DCLVTRNFR                                                 
                                                                                
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,ACAT_CONTROL_NBR                                            
                   ,DLVR_NBR                                                    
                   ,ACCT_DLVR_NBR                                               
                   ,RCV_NBR                                                     
                   ,ACCT_RCV_NBR                                                
                   ,TRNFR_TYPE_CD                                               
                   ,TRANS_TYPE_CD                                               
                   ,ACAT_CNTL_ASTD_NBR                                          
                   ,DSTBN_SIDE_CD                                               
                   ,PRCS_DT                                                     
                   ,STTS_CD                                                     
                   ,BRANCH_CD                                                   
                   ,ACCT_CD                                                     
               INTO                                                             
                    :DCLVTRNFR.CLIENT-NBR                                       
                   ,:DCLVTRNFR.ACAT-CONTROL-NBR                                 
                   ,:DCLVTRNFR.DLVR-NBR                                         
                   ,:DCLVTRNFR.ACCT-DLVR-NBR                                    
                   ,:DCLVTRNFR.RCV-NBR                                          
                   ,:DCLVTRNFR.ACCT-RCV-NBR                                     
                   ,:DCLVTRNFR.TRNFR-TYPE-CD                                    
                   ,:DCLVTRNFR.TRANS-TYPE-CD                                    
                   ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                               
                   ,:DCLVTRNFR.DSTBN-SIDE-CD                                    
                   ,:DCLVTRNFR.PRCS-DT                                          
                   ,:DCLVTRNFR.STTS-CD                                          
                   ,:DCLVTRNFR.BRANCH-CD                                        
                   ,:DCLVTRNFR.ACCT-CD                                          
               FROM  VTRNFR                                                     
                WHERE  CLIENT_NBR        = :DCLVTRNHSTY.CLIENT-NBR              
                  AND  BRANCH_CD         = :DCLVTRNHSTY.BRANCH-CD               
                  AND  ACCT_CD           = :DCLVTRNHSTY.ACCT-CD                 
                  AND  TRANS_TYPE_CD    <> 'R'                                  
           END-EXEC                                                             
                                                                                
           ADD 1 TO W-SQL-CNT                                                   
                                                                                
           MOVE 'VTRNFR  '               TO W-DB2-TABLE-NAME                    
           MOVE 'SELECT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
DJ0002****         DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0002****                ' CLT=' WF-CLIENT-NBR                                 
DJ0002****                ' ACC=' W-BR ' ' W-ACCT                               
DJ0002****                ' ' W-DB2-TABLE-NAME                                  
DJ0002****                ' ' W-DB2-ACTION                                      
DJ0002****                ' ' W-DB2-SQLCODE                                     
                                                                                
           IF  SQLCODE  =  +0 OR -811                                           
               MOVE 'Y'                TO W-TRANSFER-FND-SW                     
           ELSE                                                                 
               MOVE 'N'                TO W-TRANSFER-FND-SW                     
               IF  SQLCODE  =  +100                                             
                   CONTINUE                                                     
               ELSE                                                             
                   DISPLAY '   '                                                
                          'VTRNFR   PRIMARY KEY:'                               
                              ' CLT=' CLIENT-NBR OF DCLVTRNHSTY                 
                              ' ACC=' BRANCH-CD  OF DCLVTRNHSTY                 
                                  ' ' ACCT-CD    OF DCLVTRNHSTY                 
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT812A: ERROR SELECTING A ROW FROM VTRNFR'         
                        ' (ACAT-TRNFR TABLE)'                                   
                   PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
                   PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6700-EXIT. EXIT.                                                         
      /                                                                         
DJ0012 6800-SELECT-ACTITRF       SECTION.                                       
DJ0012     MOVE '6800-SELECT-ACTITRF           ' TO W-ROUTINE-1.                
DJ0012                                                                          
DJ0012     MOVE BRANCH-CD OF DCLVTRNHSTY     TO W-BRANCH-CD                     
DJ0012     MOVE ACCT-CD   OF DCLVTRNHSTY     TO W-ACCT-CD                       
DJ0012     MOVE W-BRN-ACCT-LIKE-X TO W-BRN-ACCT-LIKE.                           
DJ0012     INITIALIZE DCLACTITRF                                                
DJ0012     MOVE ' '   TO W-ACTITRF-FND-SW                                       
DJ0012                                                                          
DJ0012     EXEC SQL SELECT                                                      
DJ0012              CLIENT_NBR                                                  
DJ0012             ,ACAT_CONTROL_NBR                                            
DJ0012             ,DLVR_NBR                                                    
DJ0012             ,ACCT_DLVR_NBR                                               
DJ0012             ,RCV_NBR                                                     
DJ0012             ,ACCT_RCV_NBR                                                
DJ0012             ,TRNFR_TYPE_CD                                               
DJ0012             ,TRANS_TYPE_CD                                               
DJ0012             ,ACAT_CNTL_ASTD_NBR                                          
DJ0012             ,DSTBN_SIDE_CD                                               
DJ0012             ,PRCS_DT                                                     
DJ0012             ,STTS_CD                                                     
DJ0012         INTO                                                             
DJ0012              :DCLACTITRF.CLIENT-NBR                                      
DJ0012             ,:DCLACTITRF.ACAT-CONTROL-NBR                                
DJ0012             ,:DCLACTITRF.DLVR-NBR                                        
DJ0012             ,:DCLACTITRF.ACCT-DLVR-NBR                                   
DJ0012             ,:DCLACTITRF.RCV-NBR                                         
DJ0012             ,:DCLACTITRF.ACCT-RCV-NBR                                    
DJ0012             ,:DCLACTITRF.TRNFR-TYPE-CD                                   
DJ0012             ,:DCLACTITRF.TRANS-TYPE-CD                                   
DJ0012             ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                              
DJ0012             ,:DCLACTITRF.DSTBN-SIDE-CD                                   
DJ0012             ,:DCLACTITRF.PRCS-DT                                         
DJ0012             ,:DCLACTITRF.STTS-CD                                         
DJ0012        FROM  ACTITRF                                                     
DJ0012        WHERE CLIENT_NBR       = :WF-CLIENT-NBR                           
DJ0012          AND ACCT_DLVR_NBR LIKE :WF-ACCT-DLVR-NBR                        
DJ0012          AND DLVR_NBR         = :WF-DLVR-NBR                             
DJ0012          AND ACCT_DLVR_NBR LIKE :W-BRN-ACCT-LIKE                         
DJ0012     END-EXEC                                                             
DJ0012                                                                          
DJ0012     MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
DJ0012     MOVE 'SELECT'                 TO W-DB2-ACTION                        
DJ0012     MOVE SQLCODE                  TO W-DB2-SQLCODE                       
DJ0012                                                                          
DJ0012     ADD 1 TO W-SQL-CNT                                                   
DJ0012                                                                          
DJ0013     IF  SQLCODE = +0 OR -811                                             
DJ0012         MOVE 'Y'   TO W-ACTITRF-FND-SW                                   
DJ0012     ELSE                                                                 
DJ0012        IF  SQLCODE = +100                                                
DJ0012            MOVE 'N'   TO W-ACTITRF-FND-SW                                
DJ0012        ELSE                                                              
DJ0012             DISPLAY ' '                                                  
DJ0012             DISPLAY 'CAT812A: ERROR SELECTING A ROW IN ACTITRF'          
DJ0012                   ' (ACAT-TRNFR      TABLE)'                             
DJ0012             DISPLAY 'CAT812A: DCLACTITRF  ='                             
DJ0012                     '(' DCLACTITRF ')'                                   
DJ0012             PERFORM 8300-DISPLAY-KEY THRU 8300-EXIT                      
DJ0012             PERFORM 8500-SQL-ERROR   THRU 8500-EXIT                      
DJ0012        END-IF                                                            
DJ0012     END-IF.                                                              
DJ0012                                                                          
DJ0012 6800-EXIT. EXIT.                                                         
      /                                                                         
       7100-WRITE-ACATRCRF       SECTION.                                       
           MOVE '7100-WRITE-ACATRCRF               ' TO W-ROUTINE-1.            
                                                                                
           MOVE SPACES                   TO ACATRCRF-RECORD                     
           MOVE WF-CLIENT-NBR            TO ACATRCRF-CLIENT                     
           MOVE WF-ACCT-DLVR-NBR         TO ACATRCRF-ACCOUNT                    
           MOVE WF-ACAT-CONTROL-NBR      TO ACATRCRF-CONTROL-NBR                
           MOVE 'T'                      TO ACATRCRF-REC-ID                     
           MOVE CUSHOL-FRGN-CURR-CODE    TO ACATRCRF-CURRENCY-CODE              
           MOVE '0'                      TO ACATRCRF-ACCOUNT-TYPE(1:1)          
LRM052     MOVE CUSHOL-ACCOUNT-TYPE      TO ACATRCRF-ACCOUNT-TYPE(2:1)          
LRM052     MOVE CUSHOL-SECURITY-NO       TO ACATRCRF-SECURITY                   
LRM052     IF  CUSHOL-WI                                                        
LRM052         MOVE 'W'                  TO ACATRCRF-WI-KEY                     
LRM052     ELSE                                                                 
               MOVE 'N'                  TO ACATRCRF-WI-KEY                     
LRM052     END-IF.                                                              
           MOVE CUSHOL-SEQ-KEY           TO ACATRCRF-SEQ-KEY                    
           MOVE CUSHOL-CPH-CUSIP         TO ACATRCRF-CUSIP                      
           MOVE CUSHOL-CPH-SYMBOL        TO ACATRCRF-SYMBOL                     
DJ0011     MOVE W-CUSHOL-QTY                TO ACATRCRF-QTY                     
           MOVE CUSHOL-CPH-MKT-VAL          TO ACATRCRF-AMT                     
           MOVE W-ASSET-PRC-CTGY-CD      TO ACATRCRF-ASSET-PRC-CTGY-CD          
           MOVE WK-MS-SEC-ID             TO ACATRCRF-SEC-IND                    
           MOVE WK-MS-ASSET-TYPE         TO ACATRCRF-ASSET-TYPE                 
           MOVE WK-MS-BOND-IND           TO ACATRCRF-BOND-IND                   
           IF   WK-CNS-IND = 'Y'                                                
                MOVE 'C'                 TO ACATRCRF-CNS-IND                    
           END-IF                                                               
           IF   WK-DTC-IND = 'Y'                                                
                MOVE 'D'                 TO ACATRCRF-DTC-IND                    
           END-IF                                                               
           IF   W-MRGIMM-N4-FND-SW = 'Y'                                        
                MOVE 'Y'                 TO ACATRCRF-N4-MEMO-IND                
           END-IF                                                               
                                                                                
           MOVE WK-MS-CLOSING-PRICE      TO ACATRCRF-CLOSING-PRICE              
           MOVE WK-MS-CLASS              TO ACATRCRF-CLASS-CODE                 
           MOVE WK-MS-DESC1              TO ACATRCRF-DESC1                      
           MOVE WK-MS-DESC2              TO ACATRCRF-DESC2                      
           MOVE WK-MS-DESC3              TO ACATRCRF-DESC3                      
           MOVE ' '                      TO ACATRCRF-DESC4                      
           INITIALIZE                       W-POS-DESC5                         
           MOVE CUSHOL-SECURITY-NO       TO W-POS-DESC5-SEC                     
LRM038     MOVE WK-MS-ISIN               TO ACATRCRF-ISIN                       
           MOVE W-POS-DESC5              TO ACATRCRF-DESC5                      
                                                                                
           IF WK-MS-SEC-ID = 'O'                                                
              MOVE WK-MS-SYMBOL             TO ACATRCRF-OPT-SYM                 
              MOVE WK-MS-EXP-DATE           TO ACATRCRF-OPT-EXP-DT              
LRM023****    IF L-STREAM = 'Q'                                                 
LRM023           MOVE WK-MS-OPT-PRICE-NEW   TO ACATRCRF-OPT-PRICE-NEW           
LRM023****    ELSE                                                              
      ****       MOVE WK-MS-OPT-PRICE       TO ACATRCRF-OPT-PRICE               
LRM023****    END-IF                                                            
              MOVE WK-MS-OPTION-FACTOR      TO ACATRCRF-OPT-FACTOR              
ET0005        MOVE WK-MSD-FRAC-DECI-IND                                         
ET0005             TO ACATRCRF-OPT-FRAC-DECI-IND                                
              INITIALIZE                       W-OPT-DESC                       
              IF  ACATRCRF-QTY < 0                                              
                  MOVE 'BUY'                TO W-OPT-BUY-SELL                   
              ELSE                                                              
                  MOVE 'SELL'               TO W-OPT-BUY-SELL                   
              END-IF                                                            
              MOVE 'CLOS'                   TO W-OPT-OPEN-CLOSE                 
              MOVE WK-MS-PUT-CALL           TO W-OPT-CALL-PUT                   
              MOVE ACATRCRF-OPT-SYM         TO W-OPT-SYMBOL                     
              MOVE ACATRCRF-SYMBOL          TO W-OPT-MS-SYMBOL                  
LRM023****    IF L-STREAM = 'Q'                                                 
LRM023           MOVE WK-MS-SYMBOL          TO W-OPT-UNDLY-SYMBOL               
LRM023           MOVE WK-MS-EXP-MM-NEW      TO W-OPT-EXPTN-MM-NEW               
LRM023           MOVE '/'                   TO W-OPT-EXPTN-S1-NEW               
LRM023                                         W-OPT-EXPTN-S2-NEW               
LRM023           MOVE WK-MS-EXP-DD-NEW      TO W-OPT-EXPTN-DD-NEW               
LRM023           MOVE WK-MS-EXP-YY-NEW      TO W-OPT-EXPTN-YY-NEW               
LRM023           MOVE WK-MS-OPT-PRC-NEW     TO W-OPT-STRIKE-PRIC-NEW            
LRM023           IF WK-MS-OPT-FRAC-NEW = ZEROS                                  
LRM023              MOVE SPACES             TO W-OPT-STRIKE-FRAC-NEW            
LRM023           ELSE                                                           
LRM023              MOVE WK-MS-OPT-FRAC-NEW TO W-OPT-STRIKE-FRAC-NEW            
LRM023           END-IF                                                         
LRM023****    ELSE                                                              
      ****       MOVE WK-MS-EXP-DATE(5:2)  TO W-OPT-EXPTN-MM                    
      ****       MOVE '/'                  TO W-OPT-EXPTN-S1                    
      ****       MOVE WK-MS-EXP-DATE(1:2)  TO W-OPT-EXPTN-CC                    
      ****       MOVE WK-MS-EXP-DATE(3:2)  TO W-OPT-EXPTN-YY                    
      ****       MOVE WK-MS-OPT-PRC        TO W-STPRC-INTEGER-AMT               
      ****       MOVE WK-MS-OPT-FRAC-1     TO W-STPRC-FRCTN-AMT                 
      ****       MOVE W-STPRC-INTEGER-AMT  TO W-OPT-STRIKE-PRIC                 
      ****       IF   W-STPRC-FRCTN = '00'                                      
ET0005****       AND  WK-MSD-FRAC-DECI-IND NOT = 'D'                            
      ****             MOVE ' '         TO W-OPT-STRIKE-FRAC                    
      ****             MOVE ' '         TO W-OPT-SLASH-8                        
      ****       ELSE                                                           
ET0005****         IF WK-MSD-FRAC-DECI-IND = 'D'                                
ET0005****             MOVE '0'         TO W-OPT-STRIKE-FRAC                    
ET0005****         ELSE                                                         
      ****             MOVE W-STPRC-FRCTN (2:1)                                 
      ****                              TO W-OPT-STRIKE-FRAC                    
ET0005****         END-IF                                                       
      ****         MOVE '/8'            TO W-OPT-SLASH-8                        
      ****       END-IF                                                         
LRM023****    END-IF                                                            
              IF (ACATRCRF-DESC (1:60) = ' ')                                   
                    MOVE W-OPT-DESC TO ACATRCRF-DESC (1:60)                     
              ELSE                                                              
               IF (ACATRCRF-DESC (31:60) = ' ')                                 
                    MOVE W-OPT-DESC TO ACATRCRF-DESC (31:60)                    
               ELSE                                                             
                IF (ACATRCRF-DESC (61:60) = ' ')                                
                    MOVE W-OPT-DESC TO ACATRCRF-DESC (61:60)                    
                ELSE                                                            
                  IF (ACATRCRF-DESC (91:30) = ' ')                              
                    MOVE W-OPT-DESC TO ACATRCRF-DESC (91:30)                    
                  END-IF                                                        
                END-IF                                                          
               END-IF                                                           
              END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE W-N4-MEMO-QTY            TO ACATRCRF-N4-MEMO-QTY                
           MOVE W-TF-MEMO-QTY            TO ACATRCRF-TF-MEMO-QTY                
           MOVE W-TL-MEMO-QTY            TO ACATRCRF-TL-MEMO-QTY                
           MOVE W-SFK-MEMO-QTY           TO ACATRCRF-SFK-MEMO-QTY               
           MOVE W-WHOLD-MEMO-QTY         TO ACATRCRF-WHOLD-MEMO-QTY             
           MOVE W-MEMO-QTY-EXCLUDED      TO ACATRCRF-MEMO-QTY-EXCLUDED          
                                                                                
           MOVE WORK-POS-QTY             TO ACATRCRF-QTY-LEFT                   
           MOVE WORK-POS-QTY-INTEGER     TO ACATRCRF-QTY-INTEGER                
           MOVE WORK-POS-QTY-DECIMAL     TO ACATRCRF-QTY-DECIMAL                
                                                                                
DJ0014     IF (WK-MS-CLASS-1   = 1 OR 7)                                        
DJ0014     OR (WK-MS-CLASS-1-2 = '65')                                          
DJ0014     OR (WK-MS-CLASS-1   = '4' AND WK-MS-CLASS-7 = '3')                   
DJ0014         MOVE 'Y' TO W-FRACTION-EQUITY-IND                                
DJ0014         IF (WK-MS-CLASS-1 = 4 AND WK-MS-CLASS-7 = 3)                     
DJ0014            DISPLAY '   MUNI-TAX-EXEMPT-UNITS: '                          
DJ0014                        CUSHOL-SECURITY-NO                                
DJ0014         END-IF                                                           
DJ0014     ELSE                                                                 
DJ0014         MOVE 'N' TO W-FRACTION-EQUITY-IND                                
DJ0014     END-IF                                                               
                                                                                
TK0016     IF  CUSHOL-FRGN-CURR-CODE NOT = '000'                                
TK0016          MOVE 'N' TO ACATRCRF-NON-DELIVERABLE-IND                        
TK0016          MOVE 'Y' TO W-NON-DELIVERABLE-IND                               
TK0016          ADD 1 TO W-FCURR-POSN-CNT                                       
TK0016          GO TO 7100-CONT                                                 
TK0016     END-IF                                                               
                                                                                
      ******************************************************************        
      *****IF CNS AND EQUITY, IF BI IS ON, REMOVE THE FRACTION.    *****        
      *****IF CNS AND EQUITY, IF BI IS OFF, LEAVE THE FRACTION.    *****        
      *****IF CNS AND NOT EQUITY,           LEAVE THE FRACTION.    *****        
      *****IF CNS AND MUNI TAX EXEMPT UNITS AND B1 ON, REMOVE.     *****        
DJ0001*****CNS EQUITY INCLUDES CLASS CODE 1(EQUITY) AND 7(UNITS)   *****        
DJ0014*****MUNI TAX EXEMPT UNITS CLASS CODE 1=4, CODE 7=3.         *****        
      *****ALL OTHERS,                     REMOVE THE FRACTION.    *****        
      ******************************************************************        
           IF  (W-ASSET-PRC-CTGY-CD = 'MFMM' OR 'MFNM')                         
               MOVE ' ' TO ACATRCRF-REMOVE-FRAC-IND                             
           ELSE                                                                 
               IF  WK-CNS-IND = 'Y'                                             
DJ0014             IF W-FRACTION-EQUITY-IND = 'Y'                               
                   AND BH-ACAT-FRACT-ON-CNS-ELIG-SEC = '1'                      
DJ0001                ADD 1 TO W-REMOVE-FRACTION-CNT                            
                      MOVE ACATRCRF-QTY-INTEGER  TO ACATRCRF-QTY-LEFT           
                      MOVE 'F' TO ACATRCRF-REMOVE-FRAC-IND                      
                   ELSE                                                         
                      MOVE ' ' TO ACATRCRF-REMOVE-FRAC-IND                      
                   END-IF                                                       
               ELSE                                                             
DJ0001                ADD 1 TO W-REMOVE-FRACTION-CNT                            
                      MOVE ACATRCRF-QTY-INTEGER  TO ACATRCRF-QTY-LEFT           
                      MOVE 'F' TO ACATRCRF-REMOVE-FRAC-IND                      
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  ACATRCRF-QTY < 0                                                 
               MOVE 'S'                  TO W-SHORT-IND                         
               MOVE 'S'                  TO ACATRCRF-PSTN-CD                    
           ELSE                                                                 
               MOVE 'L'                  TO ACATRCRF-PSTN-CD                    
           END-IF                                                               
                                                                                
           IF   W-RESTRICTED-SW = 'Y'                                           
                MOVE 'R'                 TO ACATRCRF-RESTRICTED-IND             
DJ0002          MOVE 'N' TO ACATRCRF-NON-DELIVERABLE-IND                        
DJ0002          MOVE 'Y' TO W-NON-DELIVERABLE-IND                               
           END-IF                                                               
           IF   W-RCR-EXCLUDED-SW = 'Y'                                         
                MOVE 'X'                 TO ACATRCRF-EXCLUDED-IND               
DJ0002          MOVE 'N' TO ACATRCRF-NON-DELIVERABLE-IND                        
DJ0002          MOVE 'Y' TO W-NON-DELIVERABLE-IND                               
           END-IF                                                               
           IF CUSHOL-WI                                                         
DJ0002          MOVE 'N' TO ACATRCRF-NON-DELIVERABLE-IND                        
DJ0002          MOVE 'Y' TO W-NON-DELIVERABLE-IND                               
           END-IF                                                               
                                                                                
DJ0002***--FOR NON-DELIVERABLE REPORTING ONLY                                   
DJ0002     IF  ACATRCRF-PSTN-CD = 'L'                                           
DJ0002         IF  (ACATRCRF-QTY-LEFT NOT = 0)                                  
DJ0002         AND (ACATRCRF-QTY-LEFT > -.0001)                                 
DJ0002         AND (ACATRCRF-QTY-LEFT <  .0001)                                 
DJ0002             MOVE 'N' TO ACATRCRF-NON-DELIVERABLE-IND                     
DJ0002             MOVE 'Y' TO W-NON-DELIVERABLE-IND                            
DJ0002         END-IF                                                           
DJ0002     END-IF.                                                              
                                                                                
DJ0002***--EXCEPTION HAS PRIORITY OVER NON-DELIVERABLES                         
DJ0002     IF  BH-ACAT-RESIDUAL-CR-NON-DEL  = '1'                               
DJ0002     AND ACATRCRF-NON-DELIVERABLE-IND = 'N'                               
DJ0002     AND (W-EXCEPTION-IND = ' ')                                          
DJ0002         MOVE 'N' TO ACATRCRF-SORT-ID                                     
DJ0002     END-IF.                                                              
                                                                                
LRM024     IF W-THIS-IS-CONVERTED-OUT                                           
LRM024        MOVE 'N' TO ACATRCRF-NON-DELIVERABLE-IND                          
LRM024        MOVE 'C' TO ACATRCRF-CONVERSION-IND                               
LRM024     END-IF.                                                              
                                                                                
TK0016 7100-CONT.                                                               
LRM024***--CONVERSION OUT HAS PRIORITY OVER EVERYTHING                          
LRM024     IF CVRSN-ACCT-NBR OF DCLVTRNHSTY = 'CONVERSION'                      
LRM024         MOVE 'C' TO ACATRCRF-CONVERSION-IND                              
LRM024         MOVE 'N' TO ACATRCRF-SORT-ID                                     
LRM024         MOVE 'N' TO ACATRCRF-NON-DELIVERABLE-IND                         
LRM024         MOVE 'Y' TO W-NON-DELIVERABLE-IND                                
LRM024         ADD   1  TO W-CONV-EXC-CNT                                       
LRM024     END-IF.                                                              
                                                                                
LRM030     IF W-THIS-IS-DUPLICATE                                               
LRM030         MOVE 'P' TO ACATRCRF-DUPLICATE-IND                               
LRM030         MOVE 'N' TO ACATRCRF-SORT-ID                                     
LRM030         MOVE 'N' TO ACATRCRF-NON-DELIVERABLE-IND                         
LRM030         MOVE 'Y' TO W-NON-DELIVERABLE-IND                                
LRM030         ADD   1  TO W-DUPE-EXC-CNT                                       
LRM030     END-IF.                                                              
                                                                                
DJ0002     IF  ACATRCRF-NON-DELIVERABLE-IND = 'N'                               
DJ0002         ADD  1                    TO W-NON-ASSET-CNT                     
DJ0002     ELSE                                                                 
DJ0002         ADD  1                    TO W-DEL-ASSET-CNT                     
DJ0002     END-IF.                                                              
                                                                                
           MOVE 'Y' TO W-ASSET-ADDED-FOR-THIS-ACCT-SW                           
                                                                                
TEST*******DISPLAY '7100- RELEASE  RECID=' ACATRCRF-KEY-REC-ID                  
TEST*******      ' SORT-ID=' ACATRCRF-SORT-ID                                   
           ADD  1                        TO W-RELEASE-CNT.                      
           MOVE ACATRCRF-RECORD          TO SORT-RECORD                         
           RELEASE SORT-RECORD.                                                 
           ADD 1 TO W-ASSET-CNT.                                                
                                                                                
       7100-EXIT. EXIT.                                                         
      /                                                                         
       7200-WRITE-BALANCES       SECTION.                                       
           MOVE '7200-WRITE-BALANCES               ' TO W-ROUTINE-1.            
                                                                                
           MOVE SPACES                   TO ACATRCRF-RECORD                     
           INITIALIZE                       ACATRCRF-DTL-BODY                   
           MOVE WF-CLIENT-NBR            TO ACATRCRF-CLIENT                     
           MOVE WF-ACCT-DLVR-NBR         TO ACATRCRF-ACCOUNT                    
DJ0002     IF  W-SETTLING-TYP3-IND = 'Y'                                        
DJ0002         MOVE ACAT-CONTROL-NBR     OF DCLVTRNFR                           
DJ0002                                   TO ACATRCRF-CONTROL-NBR                
DJ0002     ELSE                                                                 
           MOVE WF-ACAT-CONTROL-NBR      TO ACATRCRF-CONTROL-NBR                
DJ0002     END-IF                                                               
           MOVE 'T'                      TO ACATRCRF-REC-ID                     
TK0016*****MOVE '000000'                 TO ACATRCRF-CURRENCY-CODE              
TK0016     MOVE CMBL-CURRENCY-CODE       TO ACATRCRF-CURRENCY-CODE              
TK0016     IF CMBL-CURRENCY-CODE NOT = '000000'                                 
TK0016          MOVE 'N' TO ACATRCRF-NON-DELIVERABLE-IND                        
TK0016          MOVE 'Y' TO W-NON-DELIVERABLE-IND                               
TK0016          ADD 1 TO W-FCURR-BAL-CNT                                        
TK0016     END-IF.                                                              
                                                                                
           IF  W-CSH-MGN-SHT = 'C'                                              
               MOVE '01'                 TO ACATRCRF-ACCOUNT-TYPE               
           ELSE                                                                 
             IF  W-CSH-MGN-SHT = 'M'                                            
                 MOVE '02'               TO ACATRCRF-ACCOUNT-TYPE               
             ELSE                                                               
               IF  W-CSH-MGN-SHT = 'S'                                          
                   MOVE '05'             TO ACATRCRF-ACCOUNT-TYPE               
               END-IF                                                           
             END-IF                                                             
           END-IF                                                               
           MOVE +0                       TO ACATRCRF-QTY                        
           MOVE W-WORK-BAL               TO ACATRCRF-AMT                        
                                                                                
           IF  W-WORK-BAL   > 0                                                 
               MOVE 'S'                  TO W-SHORT-IND                         
               MOVE 'S'                  TO ACATRCRF-PSTN-CD                    
               MOVE 'DEBIT CASH BALANCE' TO ACATRCRF-DESC1                      
               MOVE '   CASH'            TO ACATRCRF-SECURITY                   
           ELSE                                                                 
               MOVE 'L'                  TO ACATRCRF-PSTN-CD                    
               MOVE 'CREDIT CASH BALANCE' TO ACATRCRF-DESC1                     
               MOVE '   CASH'            TO ACATRCRF-SECURITY                   
           END-IF                                                               
                                                                                
           IF  W-CASH-SMA = 'SMA'                                               
               MOVE '   SMA '            TO ACATRCRF-SECURITY                   
               MOVE 'SPECIAL MISCELLANEOUS ACCOUNT'                             
                                         TO ACATRCRF-DESC1                      
DJ0002         IF W-SHORT-IND NOT = 'S'                                         
DJ0002            MOVE 'N' TO ACATRCRF-NON-DELIVERABLE-IND                      
DJ0002            MOVE 'Y' TO W-NON-DELIVERABLE-IND                             
DJ0002         END-IF                                                           
           END-IF                                                               
DJ0002     IF  W-CASH-SMA = 'EQTY'                                              
DJ0002         MOVE '    EQY'            TO ACATRCRF-SECURITY                   
DJ0002         MOVE 'TOTAL EQUITY EXCEPTION'    TO ACATRCRF-DESC1               
DJ0002         MOVE 'E' TO ACATRCRF-EXCEPTION-IND                               
DJ0002         ADD   1  TO W-EQUITY-EXC-CNT                                     
DJ0002     END-IF                                                               
DJ0002     IF  W-CASH-SMA = 'STLD'                                              
DJ0002         MOVE '    STL'            TO ACATRCRF-SECURITY                   
DJ0002         MOVE 'SETTLEMENT DATE EXCEPTION' TO ACATRCRF-DESC1               
DJ0002         MOVE 'E' TO ACATRCRF-EXCEPTION-IND                               
DJ0002         ADD   1  TO W-STLDAT-EXC-CNT                                     
DJ0002     END-IF                                                               
DJ0002     IF  W-CASH-SMA = 'TYP3'                                              
DJ0002         MOVE ' CAT820'            TO ACATRCRF-SECURITY                   
DJ0002         MOVE 'CAT820 TYPE 3 PROCESSING ' TO ACATRCRF-DESC1               
DJ0002         MOVE 'E' TO ACATRCRF-EXCEPTION-IND                               
DJ0002         ADD   1  TO W-STLDAT-EXC-CNT                                     
DJ0002     END-IF                                                               
                                                                                
LRM024***--CONVERSION OUT HAS PRIORITY OVER EVERYTHING                          
LRM024     IF CVRSN-ACCT-NBR OF DCLVTRNHSTY = 'CONVERSION'                      
LRM024         MOVE 'C' TO ACATRCRF-CONVERSION-IND                              
LRM024         MOVE 'N' TO ACATRCRF-SORT-ID                                     
LRM024         MOVE 'N' TO ACATRCRF-NON-DELIVERABLE-IND                         
LRM024         MOVE 'Y' TO W-NON-DELIVERABLE-IND                                
LRM024         ADD   1  TO W-CONV-EXC-CNT                                       
LRM024     END-IF.                                                              
                                                                                
LRM030     IF W-THIS-IS-DUPLICATE                                               
LRM030         MOVE 'P' TO ACATRCRF-DUPLICATE-IND                               
LRM030         MOVE 'N' TO ACATRCRF-SORT-ID                                     
LRM030         MOVE 'N' TO ACATRCRF-NON-DELIVERABLE-IND                         
LRM030         MOVE 'Y' TO W-NON-DELIVERABLE-IND                                
LRM030     END-IF                                                               
                                                                                
DJ0002***--EXCEPTION HAS PRIORITY OVER NON-DELIVERABLES                         
DJ0002     IF  BH-ACAT-RESIDUAL-CR-NON-DEL  = '1'                               
DJ0002     AND ACATRCRF-NON-DELIVERABLE-IND = 'N'                               
DJ0002     AND (W-EXCEPTION-IND = ' ')                                          
DJ0002         MOVE 'N' TO ACATRCRF-SORT-ID                                     
DJ0002     END-IF.                                                              
                                                                                
DJ0002     IF  ACATRCRF-EXCEPTION-IND = 'E'                                     
DJ0002         ADD  1                    TO W-EXC-ASSET-CNT                     
DJ0002     ELSE                                                                 
DJ0002       IF  ACATRCRF-NON-DELIVERABLE-IND = 'N'                             
DJ0002           ADD  1                  TO W-NON-ASSET-CNT                     
DJ0002           ADD  1                  TO W-ASSET-CNT                         
DJ0002       ELSE                                                               
DJ0002           ADD  1                  TO W-DEL-ASSET-CNT                     
DJ0002           ADD  1                  TO W-ASSET-CNT                         
DJ0002       END-IF                                                             
DJ0002     END-IF.                                                              
                                                                                
           MOVE 'Y' TO W-ASSET-ADDED-FOR-THIS-ACCT-SW                           
TEST*******DISPLAY '7200- RELEASE  RECID=' ACATRCRF-KEY-REC-ID                  
TEST*******      ' SORT-ID=' ACATRCRF-SORT-ID                                   
                                                                                
           ADD  1                        TO W-RELEASE-CNT.                      
           MOVE ACATRCRF-RECORD          TO SORT-RECORD                         
           RELEASE SORT-RECORD.                                                 
                                                                                
       7200-EXIT. EXIT.                                                         
      /                                                                         
       7300-WRITE-TI-RECORD      SECTION.                                       
           MOVE '7300-WRITE-TI-RECORD              ' TO W-ROUTINE-1.            
                                                                                
           MOVE SPACES                   TO ACATRCRF-RECORD                     
           INITIALIZE                       ACATRCRF-TI-BODY                    
           MOVE CLIENT-NBR               OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-CLIENT                  
           MOVE ACCT-DLVR-NBR            OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-ACCOUNT                 
DJ0002     IF  W-SETTLING-TYP3-IND = 'Y'                                        
DJ0002         MOVE ACAT-CONTROL-NBR     OF DCLVTRNFR                           
DJ0002                                   TO ACATRCRF-TI-CONTROL-NBR             
DJ0002     ELSE                                                                 
           MOVE ACAT-CONTROL-NBR         OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-CONTROL-NBR             
DJ0002     END-IF                                                               
           MOVE 'H'                      TO ACATRCRF-TI-REC-ID                  
           MOVE ' '                      TO ACATRCRF-TI-FILLER                  
           MOVE RCV-NBR                  OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-RCV-NBR                 
           MOVE ACCT-RCV-NBR             OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-ACCT-RCV-NBR            
           MOVE DLVR-NBR                 OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-DLVR-NBR                
           MOVE ACCT-DLVR-NBR            OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-ACCT-DLVR-NBR           
           MOVE TRNFR-TYPE-CD            OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-TRNFR-TYPE-CD           
           MOVE TRANS-TYPE-CD            OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-TRANS-TYPE-CD           
           MOVE RCV-CUST-NM              OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-RCV-CUST-NM             
           MOVE RCV-SS-PRIM-NBR          OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-RCV-SS-PRIM-NBR         
           MOVE RCV-SS-SCNDY-NBR         OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-RCV-SS-SCNDY-NBR        
           MOVE RCV-ACCT-TYPE-CD         OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-RCV-ACCT-TYPE-CD        
           MOVE RCV-OCC-BRKR-NBR         OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-RCV-OCC-BRKR-NBR        
           MOVE RCV-CRSPN-NBR            OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-RCV-CRSPN-NBR           
           MOVE PRTCP-CONTRA-CD          OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-PRTCP-CONTRA-CD         
           MOVE ACAT-CNTL-ASTD-NBR       OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-ASSC-CNTL-NBR           
           MOVE PRCS-DT                  OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-PRCS-DT                 
           MOVE DAYS-STTS-QTY            OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-DAYS-STTS-QTY           
           MOVE STTS-CD                  OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-STTS-CD                 
           MOVE STTLM-TM-CD              OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-STTLM-TM-CD             
           MOVE VAL-FREE-CD              OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-VAL-FREE-CD             
           MOVE TRANS-RFRN-ID-CD         OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-TRANS-RFRN-ID-CD        
           MOVE DB-CR-CD                 OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-DB-CR-CD                
           MOVE DSTBN-SIDE-CD            OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-DSTBN-SIDE-CD           
           MOVE NSCC-NON-ADP-IND         OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-NSCC-NON-ADP-IND        
           MOVE STTLM-DT                 OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-STTLM-DT                
           MOVE ACCT-NA-UPDT-IND         OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-ACCT-NA-UPDT-IND        
           MOVE STTLM-ASCTD-DT           OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-STTLM-ASCTD-DT          
           MOVE RR-CD                    OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-RR-CD                   
           MOVE CRT-TMSTP                OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-CRT-TMSTP               
           MOVE UPDT-TMSTP               OF DCLVTRNHSTY                         
                                         TO ACATRCRF-TI-UPDT-TMSTP              
                                                                                
           MOVE W-BAL-TYPE1              TO ACATRCRF-TYPE1-BAL                  
           MOVE W-BAL-TYPE2              TO ACATRCRF-TYPE2-BAL                  
           MOVE W-BAL-TYPE3              TO ACATRCRF-TYPE3-BAL                  
           MOVE W-BAL-TYPE5              TO ACATRCRF-TYPE5-BAL                  
           MOVE W-BAL-SMA                TO ACATRCRF-SMA-BAL                    
           MOVE W-BAL-MMKT               TO ACATRCRF-MMKT-BAL                   
DJ0002     MOVE W-BAL-EQUITY             TO ACATRCRF-ACCT-EQUITY-AMT            
                                                                                
           IF  BH-ACAT-TYPE-3-BALANCES = '1'                                    
               COMPUTE ACATRCRF-CASH-BAL = ACATRCRF-TYPE1-BAL                   
                                         + ACATRCRF-TYPE3-BAL                   
                                         - ACATRCRF-MMKT-BAL                    
           ELSE                                                                 
               COMPUTE ACATRCRF-CASH-BAL = ACATRCRF-TYPE1-BAL                   
                                         - ACATRCRF-MMKT-BAL                    
           END-IF                                                               
                                                                                
           MOVE ACATRCRF-TYPE2-BAL       TO ACATRCRF-MRGN-BAL                   
                                                                                
           MOVE ACATRCRF-TYPE5-BAL       TO ACATRCRF-SHRT-BAL                   
                                                                                
      ****FLAG DEBIT BALANCE (>0)                                               
           IF  ACATRCRF-CASH-BAL > 0                                            
               MOVE 'S' TO W-SHORT-IND                                          
           END-IF.                                                              
           IF  ACATRCRF-MRGN-BAL > 0                                            
               MOVE 'S' TO W-SHORT-IND                                          
           END-IF.                                                              
           IF  ACATRCRF-SHRT-BAL > 0                                            
               MOVE 'S' TO W-SHORT-IND                                          
           END-IF.                                                              
                                                                                
LRM024     IF CVRSN-ACCT-NBR OF DCLVTRNHSTY = 'CONVERSION'                      
LRM024        MOVE 'C' TO ACATRCRF-TI-CONVERSION-IND                            
LRM024        DISPLAY 'FOUND CONVERSION OUT ON HSTY '                           
LRM024            ' CTL=' ACAT-CONTROL-NBR OF DCLVTRNHSTY                       
LRM024        SET  W-THIS-IS-CONVERTED-OUT  TO TRUE                             
LRM024     END-IF.                                                              
DJ0002     IF  W-EQUITY-EXC-IND = 'Y'                                           
DJ0002         MOVE 'E' TO ACATRCRF-TI-EQUITY-IND                               
DJ0002     END-IF.                                                              
DJ0002     IF  W-STLDAT-EXC-IND = 'Y'                                           
DJ0002         MOVE 'D' TO ACATRCRF-TI-STLDAT-IND                               
DJ0002     END-IF.                                                              
DJ0002     IF  W-SETTLING-TYP3-IND = 'Y'                                        
DJ0002         MOVE '3' TO ACATRCRF-TI-TYPE3-IND                                
DJ0002     END-IF.                                                              
                                                                                
DJ0002     MOVE BH-ACAT-RESID-CRD-DISPL-ONLINE                                  
DJ0002                                   TO ACATRCRF-TI-AUTO-SUBMIT-IND         
                                                                                
LRM030     IF W-THIS-IS-DUPLICATE                                               
LRM030          MOVE 'P' TO ACATRCRF-TI-DUPLICATE-IND                           
LRM030          MOVE W-DUPLICATE-DATABASE TO ACATRCRF-DUPE-DATABASE     ACATRCRF
LRM030          IF W-DUPLICATE-DATABASE = 'INITIAL'                     ACATRCRF
LRM030             MOVE TRNFR-TYPE-CD OF DCLACTITRF                             
LRM030                                   TO ACATRCRF-DUPE-TRNFR-TYPE-CD ACATRCRF
LRM030             MOVE ACAT-CONTROL-NBR  OF DCLACTITRF                         
LRM030                                   TO ACATRCRF-DUPE-CONTROL-NBR   ACATRCRF
LRM030          ELSE                                                            
LRM030             MOVE TRNFR-TYPE-CD OF DCLVTRNFR                              
LRM030                                   TO ACATRCRF-DUPE-TRNFR-TYPE-CD ACATRCRF
LRM030             MOVE ACAT-CONTROL-NBR  OF DCLVTRNFR                          
LRM030                                   TO ACATRCRF-DUPE-CONTROL-NBR   ACATRCRF
LRM030          END-IF                                                          
LRM030     END-IF.                                                              
                                                                                
           MOVE W-SHORT-IND              TO ACATRCRF-TI-SHORT-IND               
                                                                                
DJ0002***--EXCEPTION AND SHORT A/C HAS PRIORITY OVER NON-DELIVERABLES           
DJ0002     IF (ACATRCRF-TI-SHORT-IND  = 'S'                                     
DJ0002     OR  W-EXCEPTION-IND        = 'Y')                                    
LRM030     AND NOT W-THIS-IS-DUPLICATE                                          
DJ0002         MOVE W-ASSET-CNT          TO ACATRCRF-ASSET-CNT                  
DJ0002         MOVE W-DEL-ASSET-CNT      TO ACATRCRF-DEL-ASSET-CNT              
DJ0002         MOVE W-NON-ASSET-CNT      TO ACATRCRF-NON-ASSET-CNT              
DJ0002         MOVE W-EXC-ASSET-CNT      TO ACATRCRF-EXC-ASSET-CNT              
DJ0002         MOVE ACATRCRF-RECORD      TO SORT-RECORD                         
TEST*******DISPLAY '7300- RELEASE  TI RECID1= ' ACATRCRF-KEY-REC-ID             
TEST*******      ' SORT-ID=' ACATRCRF-SORT-ID                                   
DJ0002         RELEASE SORT-RECORD                                              
DJ0002         ADD  1                    TO W-RELEASE-CNT                       
DJ0002         ADD  1                    TO W-TI-CNT                            
DJ0002     ELSE                                                                 
DJ0002         IF  BH-ACAT-RESIDUAL-CR-NON-DEL = '1'                            
DJ0002         AND (W-NON-ASSET-CNT > 0                                         
LRM030         OR W-THIS-IS-DUPLICATE)                                          
DJ0002             MOVE 'N'              TO ACATRCRF-TI-SORT-ID                 
DJ0002             MOVE W-NON-ASSET-CNT  TO ACATRCRF-ASSET-CNT                  
DJ0002             MOVE W-DEL-ASSET-CNT  TO ACATRCRF-DEL-ASSET-CNT              
DJ0002             MOVE W-NON-ASSET-CNT  TO ACATRCRF-NON-ASSET-CNT              
DJ0002             MOVE W-EXC-ASSET-CNT  TO ACATRCRF-EXC-ASSET-CNT              
DJ0002             MOVE ACATRCRF-RECORD  TO SORT-RECORD                         
TEST*******DISPLAY '7300- RELEASE  TI RECID2= ' ACATRCRF-KEY-REC-ID             
TEST*******      ' SORT-ID=' ACATRCRF-SORT-ID                                   
DJ0002             RELEASE SORT-RECORD                                          
DJ0002             ADD  1                TO W-RELEASE-CNT                       
DJ0002             ADD  1                TO W-TI-CNT                            
DJ0002             ADD  1                TO W-NON-DELIVERABLE-CNT               
DJ0002         END-IF                                                           
DJ0002             MOVE ' '              TO ACATRCRF-TI-SORT-ID                 
DJ0002             MOVE W-DEL-ASSET-CNT  TO ACATRCRF-ASSET-CNT                  
DJ0002             MOVE W-DEL-ASSET-CNT  TO ACATRCRF-DEL-ASSET-CNT              
DJ0002             MOVE W-NON-ASSET-CNT  TO ACATRCRF-NON-ASSET-CNT              
DJ0002             MOVE W-EXC-ASSET-CNT  TO ACATRCRF-EXC-ASSET-CNT              
DJ0002             MOVE ACATRCRF-RECORD  TO SORT-RECORD                         
TEST*******DISPLAY '7300- RELEASE  TI RECID3= ' ACATRCRF-KEY-REC-ID             
TEST*******      ' SORT-ID=' ACATRCRF-SORT-ID                                   
DJ0002             RELEASE SORT-RECORD                                          
DJ0002             ADD  1                TO W-RELEASE-CNT                       
DJ0002             ADD  1                TO W-TI-CNT                            
DJ0002     END-IF.                                                              
                                                                                
       7300-EXIT. EXIT.                                                         
      /                                                                         
       7500-SORT-OUTPUT    SECTION.                                             
           DISPLAY ' '.                                                         
           DISPLAY 'CAT812A: PERFORMING 7500-SORT-OUTPUT'.                      
                                                                                
           MOVE ' '                      TO TI-RCRA-RECORD                      
           MOVE ' '                      TO ACATRCRF-HDR-REC                    
           MOVE 'H'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
                                                                                
           CALL ZP2HDTR-PROGRAM       USING CP2-AREA                            
                                            ACATRCRF.                           
                                                                                
           MOVE CP2-RETURN-RECORD        TO ACATRCRF-HDR-REC                    
           DISPLAY 'CAT812A: ACATRCRF-HDR= ' ACATRCRF-HDR-REC (1:090)           
                                                                                
           WRITE OUT-RECORD FROM ACATRCRF-RECORD.                               
           DISPLAY 'CAT812A: ACATRCRF HEADER WRITTEN.    STATUS = '             
                                            ACATRCRF-FILE-STATUS.               
                                                                                
           MOVE '0'                      TO END-OF-SORT-SW.                     
                                                                                
       7500-LOOP.                                                               
                                                                                
           RETURN SORT-FILE                                                     
               AT END                                                           
                     MOVE '1'            TO END-OF-SORT-SW                      
                     DISPLAY 'CAT812A: SORT-EOF '                               
                                    ' RET=' W-RETURN-CNT                        
                     GO TO 7500-FINI.                                           
                                                                                
           ADD  1                        TO W-RETURN-CNT.                       
                                                                                
           MOVE SORT-RECORD              TO ACATRCRF-RECORD.                    
                                                                                
DJ0002***--SET THE SORT-ID: S=SHORT, N=NON-DELIVERABLE, X=EXCEPTION             
           IF  ACATRCRF-TI-RECORD                                               
LRM030         IF  ACATRCRF-TI-DUPLICATE-IND = 'P'                              
LRM030            CONTINUE                                                      
LRM030************MOVE 'N'            TO ACATRCRF-KEY-SORT-ID                   
LRM030         ELSE                                                             
DJ0002         IF (ACATRCRF-TI-SHORT-IND = 'S')                                 
                  MOVE ACATRCRF-TI-SHORT-IND TO ACATRCRF-KEY-SORT-ID            
DJ0002         ELSE                                                             
DJ0002           IF  ACATRCRF-TI-EQUITY-IND = 'E'                               
DJ0002           OR  ACATRCRF-TI-STLDAT-IND = 'D'                               
DJ0002           OR  ACATRCRF-TI-TYPE3-IND  = '3'                               
                     MOVE 'X'            TO ACATRCRF-KEY-SORT-ID                
DJ0002           END-IF                                                         
DJ0002         END-IF END-IF                                                    
               MOVE ACATRCRF-RECORD      TO TI-RCRA-RECORD                      
           ELSE                                                                 
TEST***********DISPLAY 'AFTER RETURN T-REC SORT-ID=' TI-RCRA-KEY-SORT-ID        
               IF  SORT-KEY-CLIENT         = TI-RCRA-KEY-CLIENT                 
               AND SORT-KEY-ACCOUNT        = TI-RCRA-KEY-ACCOUNT                
               AND SORT-KEY-CONTROL-NBR    = TI-RCRA-KEY-CONTROL-NBR            
DJ0002***--SHORT HAS PRIORITY                                                   
DJ0002           IF (TI-RCRA-KEY-SORT-ID = 'S')                                 
DJ0002              MOVE TI-RCRA-KEY-SORT-ID                                    
DJ0002                                      TO ACATRCRF-KEY-SORT-ID             
DJ0002           ELSE                                                           
DJ0002             IF (TI-RCRA-KEY-SORT-ID = 'X')                               
LRM030             OR (TI-RCRA-TI-DUPLICATE-IND = 'P')                          
DJ0002                MOVE TI-RCRA-KEY-SORT-ID                                  
DJ0002                                      TO ACATRCRF-KEY-SORT-ID             
TEST***************DISPLAY 'AFTER RETURN, USED RCRA- SORT ID='                  
TEST***************         TI-RCRA-KEY-SORT-ID                                 
DJ0002             END-IF                                                       
DJ0002           END-IF                                                         
               END-IF                                                           
           END-IF.                                                              
                                                                                
DJ0001     IF ACATRCRF-REC-IS-DTL                                               
CSG002*       MOVE ACATRCRF-DESC            TO W-TXT                            
CSG002*       PERFORM VARYING W-SUB1 FROM 1 BY 1 UNTIL W-SUB1 > 140             
CSG002*           EVALUATE W-TXT-BYTE (W-SUB1)                                  
CSG002*               WHEN '~'  MOVE ' ' TO W-TXT-BYTE (W-SUB1)                 
CSG002*               WHEN '_'  MOVE ' ' TO W-TXT-BYTE (W-SUB1)                 
CSG002*               WHEN '`'  MOVE ' ' TO W-TXT-BYTE (W-SUB1)                 
CSG002*               WHEN '{'  MOVE ' ' TO W-TXT-BYTE (W-SUB1)                 
CSG002*               WHEN '}'  MOVE ' ' TO W-TXT-BYTE (W-SUB1)                 
CSG002*               WHEN '|'  MOVE ' ' TO W-TXT-BYTE (W-SUB1)                 
CSG002*               WHEN '^'  MOVE ' ' TO W-TXT-BYTE (W-SUB1)                 
CSG002*               WHEN ''  MOVE ' ' TO W-TXT-BYTE (W-SUB1)                 
CSG002*               WHEN '\'  MOVE ' ' TO W-TXT-BYTE (W-SUB1)                 
CSG002*           END-EVALUATE                                                  
CSG002*       END-PERFORM                                                       
CSG002*       MOVE W-TXT                    TO ACATRCRF-DESC                    
CSG002* IN SOME CASES MSD DESCRIPTIONS CONTAIN SPECIAL CHARACTERS.              
CSG002* CORRECT THEM BY REPLACING SPECIAL CHARACTERS WITH SPACES.               
CSG002        MOVE ACATRCRF-DESC         TO W-ASSET-DESC-TXT                    
CSG002        PERFORM 7610-EDIT-ASSET-DESC-TXT THRU 7610-EXIT                   
CSG002        MOVE W-ASSET-DESC-TXT      TO ACATRCRF-DESC                       
DJ0001     END-IF.                                                              
                                                                                
           WRITE OUT-RECORD FROM ACATRCRF-RECORD.                               
           ADD 1 TO W-ACATRCRF-CNT.                                             
           GO TO 7500-LOOP.                                                     
                                                                                
       7500-FINI.                                                               
                                                                                
           MOVE ' '                      TO ACATRCRF-TRL-REC                    
           MOVE 'T'                      TO CP2-REQUEST-CODE.                   
           MOVE W-PGM-NAME               TO CP2-PROGRAM-ID.                     
           MOVE W-ACATRCRF-CNT           TO CP2-RECORD-COUNT.                   
           MOVE 999                      TO CP2-CLIENT-NUMBER.                  
                                                                                
           CALL ZP2HDTR-PROGRAM       USING CP2-AREA                            
                                            ACATRCRF.                           
                                                                                
           MOVE CP2-RETURN-RECORD        TO ACATRCRF-TRL-REC                    
           DISPLAY 'CAT812A: ACATRCRF-TRL= ' ACATRCRF-TRL-REC (1:090)           
                                                                                
           WRITE OUT-RECORD FROM ACATRCRF-RECORD.                               
           DISPLAY 'CAT812A: ACATRCRF  TRAILER WRITTEN. STATUS = '              
                                               ACATRCRF-FILE-STATUS.            
           DISPLAY ' '.                                                         
                                                                                
       7500-EXIT. EXIT.                                                         
      /                                                                         
CSG002 7610-EDIT-ASSET-DESC-TXT SECTION.                                        
CSG002* MOVE SPACES FOR THE SPECIAL CHARACTERS FOUND IN ASSET-DESC-TXT.         
CSG002* AND LEFT JUSTIFY THE FIRST DESCRIPTION IF FIRST CHAR IS SPACE           
CSG002* AFTER EDITED.                                                           
CSG002     MOVE SPACES                 TO W-EDIT-ASSET-DESC-TXT-FLAG            
CSG002     PERFORM                                                              
CSG002         VARYING W-SUB2 FROM 1 BY 1                                       
CSG002           UNTIL W-SUB2 > 140                                             
CSG002         MOVE W-ASSET-DESC-TXT(W-SUB2:1)    TO W-EDIT-CHAR-AREA2          
CSG002         IF NOT W-VALID-CHARACTER2                                        
CSG002            MOVE SPACES           TO W-ASSET-DESC-TXT(W-SUB2:1)           
CSG002            SET W-EDIT-ASSET-DESC-TXT-Y     TO TRUE                       
CSG002         END-IF                                                           
CSG002     END-PERFORM                                                          
CSG002*                                                                         
CSG002     IF W-EDIT-ASSET-DESC-TXT-Y AND                                       
CSG002        W-ASSET-DESC1-TXT(1:1) = SPACES                                   
CSG002        SET W-JUST-LEFT-NOT-DONE       TO TRUE                            
CSG002        PERFORM                                                           
CSG002          VARYING W-SUB2 FROM 2 BY 1                                      
CSG002            UNTIL W-SUB2 > 30 OR W-JUST-LEFT-DONE                         
CSG002          IF W-ASSET-DESC1-TXT(W-SUB2 : 1) NOT = SPACES           03760002
CSG002             MOVE SPACES               TO W-ASSET-DESC-TMP        03760002
CSG002             MOVE W-ASSET-DESC1-TXT(W-SUB2 : ) TO W-ASSET-DESC-TMP03760002
CSG002             MOVE W-ASSET-DESC-TMP     TO W-ASSET-DESC1-TXT               
CSG002             SET W-JUST-LEFT-DONE      TO TRUE                    03760002
CSG002          END-IF                                                  03760002
CSG002        END-PERFORM                                               03760002
CSG002     END-IF                                                       03760002
CSG002           .                                                      03760002
CSG002 7610-EXIT. EXIT.                                                         
CSG002/                                                                         
       8120-SQL-COMMIT     SECTION.                                             
                                                                                
           EXEC SQL COMMIT                                                      
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO COMMIT-SQLCA                                         
           MOVE SQLCODE TO COMMIT-RETURN                                        
                                                                                
           IF  COMMIT-AB                                                        
               DISPLAY 'CAT812A: '                                              
                   'SQL COMMIT FAILED. COMMIT-RETURN= '                         
                    COMMIT-RETURN                                               
                  ' INFILE-CNT= '           W-INFILE-CNT                        
                    ' PREV-CNT= '           W-LAST-COMMIT-INFILE-CNT            
           ELSE                                                                 
***************DISPLAY*'CAT812A:*'**************************************        
*******************'SQL*COMMIT*DONE.***COMMIT-RETURN=*'*****************        
********************COMMIT-RETURN***************************************        
******************'*INFILE-CNT=*'***********W-INFILE-CNT****************        
********************'*PREV-CNT=*'***********W-LAST-COMMIT-INFILE-CNT****        
               CONTINUE                                                         
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
                                                                                
           DISPLAY 'CAT812A: U3999 - ABENDING ON BAD DB2 STATUS'                
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT812A: PROGRAM ENDED ABNORMALLY'                          
           MOVE +3999 TO ABEND-CODE                                             
           CALL ABEND-PROGRAM USING ABEND-CODE.                                 
                                                                                
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
           DISPLAY 'CAT812A: VTRNHSTY READ     = ' W-INFILE-CNT                 
           DISPLAY 'CAT812A: VTRNHSTY PROCESSED= ' W-LOAD-CNT                   
           DISPLAY 'CAT812A: TRANSFERS LOADED  = ' W-TI-CNT                     
           DISPLAY 'CAT812A: POSITIONS LOADED  = ' W-POSIT-CNT                  
           DISPLAY 'CAT812A: ACATRCRF COUNT    = ' W-ACATRCRF-CNT               
                 ' (EXCLUDES HEADER AND TRAILER)'                               
ET0002     DISPLAY 'CAT812A: MMF FILE READ CNT = ' W-MMF-CNT                    
ET0002           ' (INCLUDES HEADER)'                                           
TK0016     DISPLAY 'CAT812A: FOREIGN CURR BAL  = ' W-FCURR-BAL-CNT              
TK0016     DISPLAY 'CAT812A: FOREIGN CURR POSN = ' W-FCURR-POSN-CNT             
           DISPLAY 'CAT812A: W-GETNA-FND-CNT   = ' W-GETNA-FND-CNT              
                           ' W-GETNA-NOTFND-CNT= ' W-GETNA-NOTFND-CNT           
           DISPLAY 'CAT812A: ACAT-CODE-D-CNT   = ' W-ACAT-CODE-D-CNT            
                           ' ACAT-CODE-NOT-D   = ' W-ACAT-CODE-NOT-D-CNT        
           DISPLAY 'CAT812A: BAL-READ-CNT      = ' W-BAL-CNT                    
           DISPLAY 'CAT812A: POS-READ-CNT      = ' W-POS-CNT                    
           DISPLAY 'CAT812A: W-MRGIMM-CNT      = ' W-MRGIMM-CNT                 
           DISPLAY 'CAT812A: W-MRGIMM-FND-CNT  = ' W-MRGIMM-FND-CNT             
                          ' W-MRGIMM-NOTFND-CNT= ' W-MRGIMM-NOTFND-CNT          
           DISPLAY 'CAT812A: VRSDACC-FND-CNT   = ' W-VRSDACC-FND-CNT            
                           ' VRSDACC-NOTFND    = ' W-VRSDACC-NOTFND-CNT         
           DISPLAY 'CAT812A: VRSTBRKR-FND-CNT  = ' W-VRSTBRKR-FND-CNT           
                           ' VRSTBRKR-NOTFND   = ' W-VRSTBRKR-NOTFND-CNT        
           DISPLAY 'CAT812A: VRSTSEC-FND-CNT   = ' W-VRSTSEC-FND-CNT            
                           ' VRSTSEC-NOTFND    = ' W-VRSTSEC-NOTFND-CNT         
DJ0010     DISPLAY 'CAT812A: ACTRBSC-FND-CNT   = ' W-ACTRBSC-FND-CNT            
DJ0010                     ' ACTRBSC-NOTFND    = ' W-ACTRBSC-NOTFND-CNT         
           DISPLAY 'CAT812A: DUPE-HISTORY-CNT  = ' W-DUP-CNT                    
                           ' DUPE-ACTIVE-CNT   = ' W-ACTIVE-CNT                 
DJ0002     DISPLAY 'CAT812A: EQUITY-EXC-CNT    = ' W-EQUITY-EXC-CNT             
DJ0002     DISPLAY 'CAT812A: STLDAT-EXC-CNT    = ' W-STLDAT-EXC-CNT             
DJ0002     DISPLAY 'CAT812A: NON-DELIVERABLE   = ' W-NON-DELIVERABLE-CNT        
LRM024     DISPLAY 'CAT812A: CONVERSION OUT    = ' W-CONV-EXC-CNT               
LRM030     DISPLAY 'CAT812A: DUPLICATE EXCPTN  = ' W-DUPE-EXC-CNT               
           DISPLAY 'CAT812A: SQL-CNT           = ' W-SQL-CNT                    
DJ0001     DISPLAY 'CAT812A: W-REMOVE-FRACTION = '                              
DJ0001                                         W-REMOVE-FRACTION-CNT            
           .                                                                    
       8900-EXIT. EXIT.                                                         
      /                                                                         
       9000-CLOSE-ROUTINE SECTION.                                              
           MOVE '9000-CLOSE-ROUTINE            ' TO W-ROUTINE-1.                
                                                                                
ET0002     CLOSE MMF-FILE.                                                      
           DISPLAY ' '.                                                         
ET0004     MOVE 'C' TO GETVBAL-FUNC.                                            
ET0004     PERFORM 9500-CALL-GETVBAL.                                           
ET0004     DISPLAY 'CAT812A: GETVBAL  CLOSED. STATUS = '                        
                                             BALNC-STATUS.                      
ET0004     MOVE 'C'        TO GETVHOL-FUNC                                      
ET0004     PERFORM 9600-CALL-GETVHOL.                                           
ET0004     DISPLAY 'CAT812A: GETVHOL  CLOSED. STATUS = '                        
                                             POSVSAM-STATUS.                    
           CLOSE MRGIMM                                                         
           DISPLAY 'CAT812A: MRGIMM   CLOSED. STATUS = '                        
                                             MRGIMM-STATUS.                     
           CLOSE ACATRCRF                                                       
           DISPLAY 'CAT812A: ACATRCRF CLOSED. STATUS = '                        
                                             ACATRCRF-FILE-STATUS.              
                                                                                
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT812A: PROGRAM ENDED SUCCESSFULLY'.                       
                                                                                
       9000-EXIT. EXIT.                                                         
ET0004/                                                                         
ET0004*                                                                         
ET0004 9500-CALL-GETVBAL.                                                       
ET0004     CALL GETVBAL USING GETVBAL-PARM.                                     
ET0004     MOVE GETVBAL-FILE-STATUS TO BALNC-STATUS                             
ET0004     IF GETVBAL-FILE = 'N'                                                
ET0004        MOVE GETVBAL-NEW-RECORD TO BAL-REC                                
ET0004     ELSE                                                                 
ET0004        MOVE GETVBAL-OLD-RECORD TO CMBL-CUSTOMER-BALANCE-SEGMENT.         
ET0004 9600-CALL-GETVHOL.                                                       
ET0004     CALL GETVHOL USING GETVHOL-PARM.                                     
ET0004     MOVE GETVHOL-FILE-STATUS TO       POSVSAM-STATUS.                    
      *################################################################         
