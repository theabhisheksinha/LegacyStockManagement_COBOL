000001* PDX    - CAT710   C0355480 05/23/14 04:41:19 TBCHKOP            00001000
      * CSG002 SSR 101121 REPLACE ILLEGAL CHARS IN MSD-DESC WITH SPACES.        
000001* PDX    - CAT710   C0348882 01/27/14 06:16:19 TBCHKOP            00001000
      * CSG001 SSR# 91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.                 
000001* PDX    - CAT710   C0350737 01/23/14 10:57:42 TBLAMUR            00001000
      * LRM023 SSR# 99427 SAME CODE AS SSR 54991 FOR CLIENT 313,                
      *  TO NOT UPDATE RCVR ACCOUNT WHEN CVSRN IS MARKED.                       
000001* PDX    - CAT710   C0329036 09/26/12 14:38:11 TBLAMUR            00001000
      * LRM022 SSR 86856 INCLUDE BALS HELD IN FOREIGN CURRENCY ON THE           
      * DELIVERY AS SLOC=50, LOOKUP CURRENCY ON CURLOOK.                        
      * LRM021 SSR 84763 RECOGNIZE FCUR POSITION DELIVERY AND                   
      *    POPULATE CRNCY-CD ON VASSET WHEN INSERTING MISSING ASSET.            
000001* PDX    - CAT710   C0325225 04/17/12 15:48:57 TBLAMUR            00001000
      * LRM020 SSR 83069 REMOVE S/D +1 FOR QA.                                  
000001* PDX    - CAT710   C0311598 05/13/11 08:37:09 TBLAMUR            00001000
      * LRM019 SSR 77445 CALL MSISINB WITH SUBMITTER ISIN FOR BETTER            
      *   MATCH TO MSD.                                                         
000001* PDX    - CAT710   C0300196 08/10/10 11:45:27 TBLAMUR            00001000
      * LRM018 SSR 70308 REMOVE OLD OPTION LOOKUP, FILES MSDINF MSDIDX          
000001* PDX    - CAT710   C0292359 03/09/10 15:50:07 TBLAMUR            00001000
      * LRM017 SSR 66487 REPLACE ADP NBR IN SETTLE CLOSE WHEN NO CAGE           
      *  FAILS ARE INVOLVED (NOT SETTLE LOC 10,50).                             
000001* PDX    - CAT710   C0293243 03/03/10 15:21:02 TBLAMUR            00001000
      * LRM016 SSR 59603 QUAL OPTION LOOKUP BY OPEN/CLOSE                       
000001* PDX    - CAT710   C0293001 02/25/10 13:37:13 TBLAMUR            00001000
      * LRM015 SSR 59603 REMOVE OLD OPTION SYMBOL REFERENCES                    
      * AND CORRECT ISSUE WITH OPTION EXPIRATION DATE                           
000001* PDX    - CAT710   C0290020 02/04/10 12:44:13 TBLAMUR            00001000
      * LRM014 SSR 59603 OPTION SYMB; REMOVE HARDCODE Q STREAM                  
      * LRM013 SSR 59603 OPTION SYMBOLOGY CONTINUED, POPULATE                   
      *   STPRC-INTEGER2-AMT                                                    
000001* PDX    - CAT710   C0286143 11/02/09 10:08:27 TBLAMUR            00001000
      * LRM013 SSR 59603 OPTION SYMBOLOGY CHANGES.                              
      *   USE PARM-STREAM = Q HARD CODE AT THIS TIME.                           
      *   CALL GETADPNO TO OBTAIN ADP NBR, USE THIS TO READ MSD.                
      *   CHANGE ASSET DESC FORMATTING WHEN MSD NOTFND FOR OPTIONS.             
000001* PDX    - CAT710   C0150647 09/18/09 09:03:46 TBLAMUR            00001000
      * LRM012 SSR 67172 CHANGE SYMBOL FILE TO THE 6 BYTE KEY VERSION.          
000001* PDX    - CAT710   C0283807 07/21/09 08:41:00 TBLAMUR            00001000
      * LRM011 SSR 66080 CSH-MRGN-SHRT = SPACE ON PTR CAUSED MISMATCH           
      *   ON CAGE TAG LOOKUP.  DONT SPACE OUT C/M/S IF NOT PROVIDED.            
000001* PDX    - CAT710   C0276888 04/06/09 10:51:15 TBDOJUN            00001000
      * DJ0010 SSR 61684 AUCTION RATE SECURITY                                  
      * LRM010 SSR 64085 DO NOT UPDATE PFT RCVR ASSET-QTY TO ZERO.              
000001* PDX    - CAT710   C0274114 01/29/09 11:41:59 TBDOJUN            00001000
      * DJ0009 SSR 60131 IF 12 DIGIT CUSIP NOT FND FOR BOND, USE 9.             
      * DJ0009 SSR 62537 USE PRNGFL FILE TO CHECK FOR PRIVATE RANGE             
000001* PDX    - CAT710   C0271515 12/24/08 16:37:52 TBDOJUN            00001000
      * DJ0008 SSR 59678 IF WHEN-ISSUE NOT FOUND, USE REGULAR SECURITY.         
      * DJ0008 IF ASSET CAME IN WITH W-NSCC-AT-WHN-ISS-IND = 'W',               
      * DJ0008 AND NOT A WHEN-ISSUE, MOVE 'I' TO W-NSCC-AT-WHN-ISS-IND          
      * DJ0008 AND TO WHI-CD OF DCLVASSET.                                      
000001* PDX    - CAT710   C0267760 10/20/08 16:33:56 TBDOJUN            00001000
      * DJ0007 SSR 57532 USE ISIN TO LOOKUP MSD WHEN CUSIP NOT FOUND            
      * DJ0007 SSR 55766 ASCENDIS(WORKFLOW) PARALLEL RUN                        
000001* PDX    - CAT710   C0260091 07/07/08 10:10:24 TBDOJUN            00001000
      * DJ0006 SSR 55766 ASCENDIS(WORKFLOW) SET ASCENDIS INDICATOR              
      * DJ0006 FOR FUL,PTR,PTD ONLY AND BH-ACAT-ASCENDIS-USER = '1'             
000001* PDX    - CAT710   C0262101 03/10/08 08:48:07 TBLAMUR            00001000
      * LRM008 SSR 43644 ADDL FOR PTD,MFC,FRV,RCL AS THE RECEIVER               
      * LRM008            AND PTR AS THE DELIVERER.                             
000001* PDX    - CAT710   C0261812 03/04/08 11:01:29 TBLAMUR            00001000
      * LRM007 SSR 43644 DO NOT REFRESH ACCT NBRS ON CLIENT 6 RCR               
000001* PDX    - CAT710   C0249006 06/29/07 12:26:10 TBDOJUN            00001000
      * DJ0005 SSR 47339 SUPPORT DUALLY LISTED SECURITIES                       
      * DJ0005           POPULATE GETMSD-CLIENT-PL2 WHEN CALLING GETMSD         
000001* PDX    - CAT710   C0240752 11/20/06 10:54:08 TBDOJUN                    
000001* PDX    - CAT710   C0215169 02/14/05 07:54:02 TBDOJUN                    
      * DJ0004 SSR# 40633 RECOMPILED FOR NEW COPYBOOK (ANNUITY)                 
      * DJ0004 MIPS REDUCTION. DATE CHECK                                       
000001* PDX    - CAT710   C0206964 06/07/04 13:33:54 TBLAMUR                    
      * LRM006 SSR 38232 FORCE S/D TO BE PLUS ONE IN Q STREAM.                  
000001* PDX    - CAT710   C0197067 10/20/03 08:26:17 TBLAMUR                    
000001* LRM005 - NSCC REGULATORY CHANGE, FUND RE-REG DATE FOR MFC               
000001* PDX    - CAT710   C0187502 03/10/03 09:41:12 TBLAMUR                    
      * LRM004 - RETURN CODE 12 WHEN LESS THAN 100 PROD INPUT DETAILS           
000001* PDX    - CAT710   C0177507 07/18/02 14:32:57 TBYOHON                    
000001* PDX    - CAT710   C0176464 06/13/02 15:39:04 TBLAMUR                    
000001* PDX    - CAT710   C0160782 07/24/01 15:27:03 TBLAMUR                    
000001* DJ0003 SSR# R        FUND-CUST-ACCT-RCV                                 
000001*                      OPT-DEC-FRAC-IND                                   
000001* PDX    - CAT710   C0155175 05/03/01 14:00:28 TBLAMUR                    
000001* PDX    - CAT710   C0156226 03/21/01 23:08:44 TBDOJUN                    
000001* PDX    - CAT710   C0151178 12/18/00 08:40:21 TBDOJUN                    
000001* DJ0002 SSR# R2262400 W8 FIELDS COPYBOOK RECOMPILE. COBOL LE             
000001* PDX    - CAT710   C0141412 08/28/00 10:14:35 TBDOJUN                    
000001* PDX    - CAT710   C0127169 06/19/99 11:04:34 TBDOJUN                    
000001* DJ0001 - DOUBLE-CHECK OPTION SYMBOL RETURNED FROM MSD WITH NSCC         
000001* PDX    - CAT710   C0124431 05/14/99 12:10:18 TBTIKUO                    
000001* PDX    - CAT710   C0124189 04/12/99 11:15:18 TBDOJUN                    
000001* PDX    - CAT710   C0122870 03/17/99 22:33:08 TBDOJUN                    
000001* PDX    - CAT710   C0122736 03/11/99 15:09:10 TBDOJUN                    
000001* DJ     - RECOMPILED FOR EXPANDED RECMDIDX                               
000001* PDX    - CAT710   C0122542 03/05/99 11:44:28 TBDOJUN                    
000001* PDX    - CAT710   C0122392 02/26/99 14:30:13 TBDOJUN                    
000001* PDX    - CAT710   C0122248 02/24/99 14:32:11 TBDOJUN                    
000001* PDX    - CAT710   C0122194 02/23/99 11:46:58 TBDOJUN                    
000001* PDX    - CAT710   C0122069 02/21/99 15:18:33 TBDOJUN                    
000001* PDX    - CAT710   C0121866 02/17/99 14:23:47 TBDOJUN                    
000001* PDX    - CAT710   C0120784 01/27/99 12:41:15 TBDOJUN                    
000001* PDX    - CAT710   C0120203 01/22/99 10:07:07 TBDOJUN                    
000001* PDX    - CAT710   C0119526 12/23/98 08:16:30 TBLAMUR                    
000001* PDX    - CAT710   C0118401 12/10/98 14:11:51 TBDOJUN                    
000001* PDX    - CAT710   C0115343 11/13/98 13:48:24 TBDOJUN                    
      *****************************************************************         
       IDENTIFICATION DIVISION.                                                 
      *****************************************************************         
       PROGRAM-ID.  CAT710                                                      
       AUTHOR.      T. KUO.                                                     
       DATE-WRITTEN.  SEPT 1998.                                                
      *****************************************************************         
      *                                                                         
      * ACATS - AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM                      
      *         EOD POSITION RECONCILIATION                                     
      *                                                                         
      * ---------------------------------------------------------------         
      * 5/99  - MOVE NSCCP-VALUE-FREE-IND TO ASSET_AMT_STTS_CD (VASSET)         
      *                                                                         
      ******************************************************************        
       ENVIRONMENT DIVISION.                                                    
       CONFIGURATION SECTION.                                                   
                                                                                
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT  NSCC-POSITION-FILE    ASSIGN  TO  ACATPOSN                   
                                         FILE STATUS IS ACATPOSN-STAT.          
                                                                                
           SELECT PRNGFL            ASSIGN TO PRNGFL                            
                  ACCESS            DYNAMIC                                     
                  ORGANIZATION      INDEXED                                     
                  RECORD KEY IS     PRNGKEY                                     
                  FILE STATUS IS    PRNGFL-STAT.                                
                                                                                
                                                                                
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  NSCC-POSITION-FILE                                                   
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS                  
              DEPENDING ON W-REC-LEN-IN                                         
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  NSCCP-DUMMY-RECORD             PIC X(4000).                          
                                                                                
       01  NSCCP-RECORD.                                                        
           05  NSCCP-REC-TYPE             PIC X(01).                            
               88  NSCCP-HEADER                     VALUE 'H'.                  
               88  NSCCP-POSITION-MRO               VALUE 'P'.                  
               88  NSCCP-SETTLMNT-MRO               VALUE 'S'.                  
               88  NSCCP-TRAILER                    VALUE 'T'.                  
           05  NSCCP-REC-SUBTYPE          PIC X(01).                            
               88  NSCCP-XFER                       VALUE 'T'.                  
               88  NSCCP-ASSET                      VALUE 'A'.                  
               88  NSCCP-FND-RGS                    VALUE 'F'.                  
DJ0004         88  NSCCP-INS-REG                    VALUE 'I'.                  
           05  FILLER                     PIC X(3266).                          
      /                                                                         
       FD  PRNGFL.                                                              
           COPY PRNGRECC.                                                       
                                                                                
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
           COPY PDXIDCOB.                                                       
                                                                                
       01  W-ROUTINE                     PIC X(32) VALUE ' '.                   
       01  W-BRANCH-ACCT.                                                       
           05 W-BRANCH-CD    PIC XXX.                                           
           05 W-ACCT-CD      PIC X(5).                                          
                                                                                
       01  CAT710-WORKING-AREA.                                                 
           05  W-REC-LEN-IN              PIC 9(005) VALUE 0.                    
           05  WS-REC-LEN                PIC 9(05)  VALUE 0.                    
           05  W-INFILE-CNT              PIC 9(07)  VALUE 0.                    
           05  FILLER                    PIC X(10)  VALUE 'VTRNFR CNT'.         
           05  VTRNFR-CNT.                                                      
               10  FILLER               PIC X(10)  VALUE 'VTRNFR FND'.          
               10  VTRNFR-FND-CNT       PIC 9(07)  VALUE 0.                     
               10  FILLER               PIC X(12)  VALUE 'VTRNFR NOTFN'.        
               10  VTRNFR-NOTFND-CNT    PIC 9(07)  VALUE 0.                     
               10  FILLER               PIC X(11)  VALUE 'VTRNFR UPDT'.         
               10  VTRNFR-UPDT-CNT      PIC 9(07)  VALUE 0.                     
               10  FILLER               PIC X(12)  VALUE 'VTRNFR NOTUP'.        
               10  VTRNFR-NOTUPD-CNT    PIC 9(07)  VALUE 0.                     
               10  NSCC-TIF-CNT         PIC 9(07)  VALUE 0.                     
               10  NSCC-ASSET-CNT       PIC 9(07)  VALUE 0.                     
               10  NSCC-OPTION-CNT      PIC 9(07)  VALUE 0.                     
               10  NSCC-MF-CNT          PIC 9(07)  VALUE 0.                     
               10  NSCC-REG-ASSET-CNT   PIC 9(07)  VALUE 0.                     
               10  VASSET-FND-CNT       PIC 9(07)  VALUE 0.                     
               10  VASSET-UPDT-CNT      PIC 9(07)  VALUE 0.                     
               10  VASSET-NOTFND-CNT    PIC 9(07)  VALUE 0.                     
               10  VASSET-NOT-UPDATED-CNT PIC 9(07) VALUE 0.                    
               10  VOPTN-FND-CNT        PIC 9(07)  VALUE 0.                     
               10  VOPTN-NOTFND-CNT     PIC 9(07)  VALUE 0.                     
               10  VMF-FND-CNT          PIC 9(07)  VALUE 0.                     
               10  VMF-NOTFND-CNT       PIC 9(07)  VALUE 0.                     
           05  WS-SETTLED-CNT            PIC 9(07)  VALUE 0.                    
TCKNEW     05  WS-VALUE-FREE-CNT         PIC 9(07)  VALUE 0.                    
           05  WS-BROKER-NBR             PIC X(04)  VALUE SPACES.               
DJ0005     05  WS-ADP-CLIENT             PIC 9(04)  VALUE ZEROES.               
           05  SV-CLIENT-NBR             PIC X(04).                             
           05  SV-ACAT-CNTL-NBR          PIC X(14)  VALUE SPACES.               
           05  WS-CLNT-NO                PIC S9(3)  COMP-3 VALUE +0.            
           05  WS-RECONCILED-TIF.                                               
               10 WS-RECONCILED-TIF-CLT  PIC X(04).                             
               10 WS-RECONCILED-TIF-ACAT PIC X(14).                             
           05  ACATPOSN-STAT             PIC X(02).                             
               88 ACATPOSN-OKAY          VALUE '00' THRU '09', '97'.            
               88 ACATPOSN-EOF           VALUE '10'.                            
               88 ACATPOSN-EMPTY         VALUE '35'.                            
           05  END-OF-ACATPOSN-SW        PIC X(01) VALUE 'N'.                   
               88  END-OF-ACATPOSN       VALUE 'Y'.                             
           05  FILLER         PIC X(14)  VALUE 'VTRNFR RETURN:'.                
           05  VTRNFR-SW                 PIC X(01)  VALUE ' '.                  
               88  VTRNFR-UPDT           VALUE 'U'.                             
               88  VTRNFR-NOT-UPDT       VALUE 'X'.                             
           05  VTRNFR-FOUND-SW           PIC X(01)  VALUE ' '.                  
               88  VTRNFR-FOUND          VALUE 'Y'.                             
               88  VTRNFR-NOT-FOUND      VALUE 'N'.                             
           05  ASSET-FOUND-SW            PIC X(01)  VALUE ' '.                  
               88  ASSET-FOUND           VALUE 'F'.                             
           05  OPTION-FOUND-SW           PIC X(01)  VALUE ' '.                  
               88  OPTION-FOUND          VALUE 'F'.                             
           05  MUTUAL-FUND-FOUND-SW      PIC X(01)  VALUE ' '.                  
               88  MUTUAL-FUND-FOUND     VALUE 'F'.                             
           05  DIFFERENCE-FOUND-SW       PIC X(01)  VALUE ' '.                  
               88  DIFFERENCE-FOUND      VALUE 'F'.                             
           05  WS-STRIKE-PRICE-INT       PIC X(05).                             
           05  WS-STRIKE-PRICE-INT-N REDEFINES WS-STRIKE-PRICE-INT              
                                         PIC 9(05).                             
           05  WS-STRIKE-PRICE-FRC       PIC X(02).                             
           05  WS-STRIKE-PRICE-FRC-N REDEFINES WS-STRIKE-PRICE-FRC              
                                         PIC 9(02).                             
LRM013     05  WS-STRIKE-PRICE-FRC-NEW   PIC X(03).                             
LRM013     05  WS-STRIKE-PRICE-FRC-NEW-N                                        
LRM013               REDEFINES WS-STRIKE-PRICE-FRC-NEW                          
                                         PIC 9(03).                             
           05  WS-ASSET-QTY              USAGE COMP-2.                          
           05  WS-ASSET-PCT              USAGE COMP-2.                          
           05  WS-ASSET-AMT              USAGE COMP-2.                          
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
      *                                                                         
           05  WK-DATE.                                                         
               10  WK-DT-YYYY            PIC X(04).                             
               10  WK-DT-MM              PIC X(02).                             
               10  WK-DT-DD              PIC X(02).                             
           05  WK-FMT-DATE.                                                     
               10  WK-DT-1               PIC X(04).                             
               10  FILLER                PIC X  VALUE '-'.                      
               10  WK-DT-2               PIC X(02).                             
               10  FILLER                PIC X  VALUE '-'.                      
               10  WK-DT-3               PIC X(02).                             
      *                                                                         
           05  WS-QTY-9                  PIC 9(03)  VALUE 0.                    
           05  WS-QTY-9-PACK             PIC S9(03) COMP-3 VALUE +0.            
      *                                                                         
           05  W-NO-CLT-CNT              PIC  9(007) VALUE 0.                   
           05  W-MSD-FND-CNT             PIC  9(007) VALUE 0.                   
           05  W-MSD-NOTFND-CNT          PIC  9(007) VALUE 0.                   
           05  W-MSD-NOTFND-SW           PIC  X(001) VALUE ' '.                 
               88 W-MSD-NOTFND                       VALUE 'Y'.                 
           05  W-XRF-FND-CNT             PIC  9(007) VALUE 0.                   
           05  W-XRF-NOTFND-CNT          PIC  9(007) VALUE 0.                   
           05  W-BOND-FND-CNT            PIC  9(007) VALUE 0.                   
           05  W-BOND-NOTFND-CNT         PIC  9(007) VALUE 0.                   
DJ0007     05  W-ISIN-FND-CNT            PIC  9(007) VALUE 0.                   
DJ0007     05  W-ISIN-NOTFND-CNT         PIC  9(007) VALUE 0.                   
DJ0007     05  W-SUB-ISIN-FND-CNT        PIC  9(007) VALUE 0.                   
DJ0007     05  W-SUB-ISIN-NOTFND-CNT     PIC  9(007) VALUE 0.                   
           05  W-BLANK-SEC-CNT           PIC  9(007) VALUE 0.                   
           05  W-NSET-CNT                PIC  9(007) VALUE 0.                   
           05  W-VTRNFR-INSERTED-CNT     PIC  9(007) VALUE 0.                   
           05  W-VTRNFR-NOT-INSERTED-CNT PIC  9(007) VALUE 0.                   
           05  W-VASSET-INSERTED-CNT     PIC  9(007) VALUE 0.                   
           05  W-VASSET-NOT-INSERTED-CNT PIC  9(007) VALUE 0.                   
           05  W-VOPTN-INSERTED-CNT      PIC  9(007) VALUE 0.                   
           05  W-VOPTN-NOT-INSERTED-CNT  PIC  9(007) VALUE 0.                   
           05  W-VMF-INSERTED-CNT        PIC  9(007) VALUE 0.                   
           05  W-VMF-NOT-INSERTED-CNT    PIC  9(007) VALUE 0.                   
DJ0010     05  W-AUCTION-RATE-CNT        PIC  9(007) VALUE 0.                   
           05  W-DESC                    PIC  X(030) VALUE ' '.                 
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
LRM013     05  W-OPT-DESC-NEW REDEFINES W-OPT-DESC.                             
LRM013         07  FILLER                PIC X(22).                             
LRM013         07  W-OPT-UNDLY-SYMBOL    PIC X(06).                             
LRM013         07  FILLER                PIC X(02).                             
LRM013         07  W-OPT-EXPTN-MM-NEW    PIC X(02).                             
LRM013         07  W-OPT-EXPTN-S1-NEW    PIC X(01).                             
LRM013         07  W-OPT-EXPTN-DD-NEW    PIC X(02).                             
LRM013         07  W-OPT-EXPTN-S2-NEW    PIC X(01).                             
LRM013         07  W-OPT-EXPTN-YY-NEW    PIC X(02).                             
LRM013         07  FILLER                PIC X(01).                             
LRM013         07  W-OPT-STRIKE-PRIC-NEW PIC ZZZZ9.                             
LRM013         07  FILLER                PIC X(01).                             
LRM013         07  W-OPT-STRIKE-FRAC-NEW PIC X(03).                             
LRM013         07  FILLER                PIC X(12).                             
CSG002*                                                                         
CSG002     05  W-EDIT-ASSET-DESC-TXT-AREA.                                      
CSG002         10 W-SUB1                       PIC S9(03) COMP-3.               
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
      *                                                                         
DJ0004     05  W-PROC-DATE               PIC X(8) VALUE ' '.                    
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
           05  W-SYS-DATE                PIC  9(006) VALUE 0.                   
           05  W-SYS-TIME                PIC  9(008) VALUE 0.                   
           05  PRNGFL-STAT               PIC X(002).                            
               88 VALID-PRNGFL-STAT      VALUE '00' '04' '10' '23'.             
               88 PRNGFL-OKAY            VALUE '00' THRU '09', '97'.            
               88 PRNGFL-END-OF-FILE     VALUE '10'.                            
               88 PRNGFL-NOT-FOUND       VALUE '23'.                            
               88 PRNGFL-EMPTY-MISSING   VALUE '35'.                            
           05  W-PRNGFL-SW               PIC  X(001) VALUE ' '.                 
               88 W-PRNGFL-FOUND                     VALUE 'Y'.                 
                                                                                
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
           05  ADP-SYMBOL-SUB               PIC S9(4) COMP SYNC.                
           05  FMT-SYMBOL-SUB               PIC S9(4) COMP SYNC.                
                                                                                
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
                                                                                
DJ0001 01  OPT-WORK-AREA.                                                       
DJ0001     05  SUB2               PIC 9(02).                                    
DJ0001     05  SUB3               PIC 9(02).                                    
DJ0001     05  OPT-SYMBOL         PIC X(03).                                    
DJ0001     05  OPTION-SYMBOL   REDEFINES OPT-SYMBOL                             
DJ0001                            PIC X(01) OCCURS 3 TIMES.                     
DJ0001     05  OPTION-SYMBOL1     PIC X(01) OCCURS 3 TIMES.                     
DJ0001     05  OPT-WORK1          PIC X(12).                                    
DJ0001     05  OPT-WORK2   REDEFINES  OPT-WORK1.                                
DJ0001       10  OPT-WORK3        PIC X(01) OCCURS 12 TIMES.                    
                                                                                
DJ0007 01  W-BOND-AREA.                                                         
DJ0007     03  W-GETXRF-KEY-9             PIC X(9).                             
      /                                                                         
LRM012 01  FILLER                        PIC X(08) VALUE 'RECMDIN2'.            
LRM012     COPY RECMDIN2.                                                       
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'RECMDIDX'.            
           COPY RECMDIDX.                                                       
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'GETXRFC '.            
           COPY GETXRFC.                                                        
      /                                                                         
LRM019     COPY MSISINC.                                                        
      /                                                                         
      ******************************************************************        
      * GETMSD COMMAREA                                                *        
      ******************************************************************        
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.            
           COPY GETMSDCE.                                                       
      /                                                                         
      ******************************************************************        
       01  FILLER                        PIC X(16) VALUE 'WS-VTRNFR=='.         
       01  DB2-IO-AREA.                                                         
           05  WS-VTRNFR.                                                       
               10 WS-CLIENT-NBR          PIC X(4).                              
               10 WS-ACAT-CNTL-NBR       PIC X(14).                             
               10 WS-SBMTG-PRTCP-NBR     PIC X(4).                              
               10 WS-DLVR-NBR            PIC X(4).                              
               10 WS-ACCT-DLVR-NBR       PIC X(20).                             
               10 WS-RCV-NBR             PIC X(4).                              
               10 WS-ACCT-RCV-NBR        PIC X(20).                             
               10 WS-TRNFR-TYPE-CD       PIC X(3).                              
               10 WS-TRANS-TYPE-CD       PIC X(1).                              
               10 WS-RCV-CUST-NM         PIC X(60).                             
               10 WS-RCV-SS-PRIM-NBR     PIC X(9).                              
               10 WS-RCV-SS-SCNDY-NBR    PIC X(9).                              
               10 WS-RCV-ACCT-TYPE-CD    PIC X(2).                              
               10 WS-RCV-OCC-BRKR-NBR    PIC X(5).                              
               10 WS-RCV-CRSPN-NBR       PIC X(4).                              
               10 WS-ACAT-CNTL-ASTD-NBR  PIC X(14).                             
               10 WS-CMNT-TXT            PIC X(120).                            
               10 WS-PRCS-DT             PIC X(10).                             
               10 WS-STTS-CD             PIC X(3).                              
               10 WS-STTLM-TM-CD         PIC X(1).                              
               10 WS-VAL-FREE-CD         PIC X(1).                              
               10 WS-TRANS-RFRN-ID-CD    PIC X(20).                             
               10 WS-DB-CR-CD            PIC X(1).                              
               10 WS-DSTBN-SIDE-CD       PIC X(1).                              
               10 WS-SYS-RJCT-RSN-CD     PIC X(2).                              
               10 WS-TRNFR-TYPE-RJCT-CD  PIC X(2).                              
               10 WS-PHSCL-SEQ-NBR       PIC S9(4) USAGE COMP.                  
               10 WS-LGCL-SEQ-NBR        PIC S9(4) USAGE COMP.                  
               10 WS-RR-CD               PIC X(3).                              
               10 WS-BRANCH-CD           PIC X(3).                              
               10 WS-DAYS-STTS-QTY       PIC S9(4) USAGE COMP.                  
               10 WS-STTLM-DT            PIC X(10).                             
               10 WS-ACCT-CD             PIC X(5).                              
               10 WS-STTLM-ASCTD-DT      PIC X(10).                             
DJ0005         10 WS-GIFT-IND            PIC X(1).                              
LRM007         10 WS-CVRSN-ACCT-NBR      PIC X(20).                             
DJ0006         10 WS-NSCC-ACK-IND        PIC X(1).                              
DJ0010     05  WS-VASSET.                                                       
DJ0010         10 WS-AUCTION-RT-IND      PIC X(1).                              
      ******************************************************************        
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'HDR-REC='.            
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:==  BY ==WS-HDR==.               
      *----------------------------------------------------------------*        
       01  FILLER                        PIC X(08) VALUE 'POS-REC='.            
       01  WS-POS-REC                    PIC X(475).                            
       01  FILLER                        PIC X(08) VALUE 'TI-REC '.             
           COPY NSCCP    REPLACING ==:NSCCP:==     BY ==W-NSCC==.               
      *----------------------------------------------------------------*        
       01  FILLER                        PIC X(08) VALUE 'TRL-REC='.            
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:==  BY ==WS-TRL==.               
      /                                                                         
LRM022    COPY CURLOOK.                                                         
CSG002/                                                                         
CSG002******************************************************************        
CSG002* ACATS VALID CHARACTER SET FROM "ACATS USER GUIDE (SECTION 19)" *        
CSG002******************************************************************        
CSG002 01  FILLER                        PIC X(08) VALUE 'CATVCHAR'.            
CSG002     COPY CATVCHAR.                                                       
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'BHINFO=='.            
           COPY BHINFO.                                                         
                                                                                
       01  FILLER                        PIC X(08) VALUE 'BHACAT=='.            
           COPY BHACAT.                                                         
                                                                                
       01  FILLER                        PIC X(08) VALUE 'B1-AREA='.            
       01  WS-B1-TABLE-AREA.                                                    
           05  WS-CLIENT-TABLE-ENTRY  OCCURS 500 TIMES                          
               INDEXED BY SUB.                                                  
               07  WS-TBL-ADP-CLIENT-NBR     PIC 9(04).                         
               07  WS-TBL-BROKER-NBR         PIC X(04).                         
               07  WS-TBL-BROKER-NAME        PIC X(30).                         
               07  WS-TBL-STREAM             PIC X(01).                         
               07  WS-TBL-BROKER-STATUS      PIC X(01).                         
               07  WS-TBL-ACAT-STATUS        PIC X(01).                         
DJ0006         07  WS-TBL-ACAT-ASCENDIS-USER PIC X(01).                         
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'SQLCA   '.            
           EXEC SQL                                                             
               INCLUDE SQLCA                                                    
           END-EXEC.                                                            
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'VTRNFR  '.            
           EXEC SQL                                                             
               INCLUDE VTRNFR                                                   
           END-EXEC.                                                            
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'VASSET  '.            
           EXEC SQL                                                             
               INCLUDE VASSET                                                   
           END-EXEC.                                                            
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'VOPTN   '.            
           EXEC SQL                                                             
               INCLUDE VOPTN                                                    
           END-EXEC.                                                            
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'VMF     '.            
           EXEC SQL                                                             
               INCLUDE VMF                                                      
           END-EXEC.                                                            
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'DB2AREA '.            
       01  DB2-ABEND-WORK-AREA.                                                 
           03  DB2-ABEND-CODE                PIC S9(04) COMP.                   
           03  WS-NSCC-PEND-IND              PIC X(01)  VALUE SPACES.           
           03  WS-DB2-MESSAGE-AREA.                                             
               05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.        
               05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES         
                   INDEXED BY WS-ERROR-INDEX.                                   
           03  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.         
           03  W-DB2-TABLE-NAME          PIC  X(008).                           
           03  W-DB2-ACTION              PIC  X(008).                           
           03  W-DB2-SQLCODE             PIC  -999.                             
                                                                                
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
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(009) VALUE 0.                   
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
LRM006 01  DAY-SUB                       PIC  S9(04) COMP.                      
LRM006     COPY BPDATESC.                                                       
      /                                                                         
DJ0002***===> COBOL LE                                                          
DJ0002 01  W-ABEND-AREA.                                                        
DJ0002     05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
DJ0002 01  CALL-MODULES.                                                        
DJ0002     05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.           
DJ0002     05  GETXREF                   PIC  X(08) VALUE 'ZGETXREF'.           
LRM013     05  GETADPNO                  PIC  X(08) VALUE 'GETADPNO'.           
DJ0002 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.           
DJ0002     COPY STUBCPY.                                                        
LRM019     03  MSISINB           PIC X(08) VALUE 'MSISINB '.                    
DJ0002***<=== COBOL LE                                                          
                                                                                
LRM013     COPY GETADPC.                                                        
                                                                                
       01  FILLER                        PIC X(08) VALUE 'END-O-WS'.            
      /                                                                         
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
       01  PARM-AREA.                                                           
           05  PARM-LENGTH              PIC  S9(4) COMP.                        
           05  PARM-STREAM-IND          PIC  X(01).                             
DJ0004     05  L-BYP-DATECHK-SW         PIC  X(01).                             
DJ0004         88  L-BYP-DATECHK                   VALUE '1'.                   
      /                                                                         
       PROCEDURE DIVISION USING PARM-AREA.                                      
       0000-MAIN-ROUTINE.                                                       
           DISPLAY 'CAT710 - ACATS EOD POSITION RECONCILIATION'                 
           DISPLAY '         INPUT = BZZZ.SIAC0718.ACAT.POSN'                   
           DISPLAY '         UPDATE ACTIVE TIF AND ASSET TABLES'                
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
                                                                                
           INITIALIZE WS-REC-LEN,                                               
                      W-INFILE-CNT,                                             
                      VTRNFR-CNT,                                               
                      WS-BROKER-NBR,                                            
                      WS-ADP-CLIENT,                                            
                      SV-CLIENT-NBR,                                            
                      WS-CLNT-NO,                                               
                      SV-ACAT-CNTL-NBR,                                         
                      ACATPOSN-STAT,                                            
                      END-OF-ACATPOSN-SW,                                       
                      VTRNFR-SW,                                                
                      WS-QTY-9,                                                 
                      WS-QTY-9-PACK.                                            
                                                                                
           PERFORM 1000-OPEN-ACATPOSN THRU 1000-EXIT.                           
           DISPLAY ' '                                                          
           PERFORM 1500-LOAD-B1-RTN.                                            
           DISPLAY ' '                                                          
           DISPLAY                                                              
           '**** CAT710 --- BEGIN TO READ POSITION FILE *****'.                 
           PERFORM 2000-PROCESS-ACATPOSN THRU 2000-EXIT                         
              UNTIL END-OF-ACATPOSN.                                            
           PERFORM 9000-CLOSE-ACATPOSN THRU 9000-EXIT.                          
LRM004     IF PARM-LENGTH > ZERO                                                
LRM004     AND PARM-STREAM-IND = 'Z'                                            
LRM004     AND W-INFILE-CNT LESS 100                                            
LRM004        MOVE 12 TO RETURN-CODE                                            
LRM004        DISPLAY 'CAT710 - CHECK INPUT FILE ACATPOSN '                     
LRM004        DISPLAY 'CALL NSCC AND VERIFY INPUT RECORD COUNT'                 
LRM004        DISPLAY 'SIAC 0718 FILE HAD LOW RECORD COUNT = '                  
LRM004                      W-INFILE-CNT                                        
LRM004        DISPLAY 'RETURN-CODE SET TO STOP PROCESSING'                      
LRM004     END-IF.                                                              
           GOBACK.                                                              
                                                                                
       1000-OPEN-ACATPOSN.                                                      
                                                                                
           DISPLAY ' '.                                                         
DJ0004     DISPLAY    'PARM-STREAM-IND  = ' PARM-STREAM-IND                     
DJ0004     IF L-BYP-DATECHK-SW  = '1'                                           
DJ0004        DISPLAY 'L-BYP-DATECHK-SW = ' L-BYP-DATECHK-SW                    
DJ0004                '  1=BYPASS DATE CHECK '                                  
DJ0004     ELSE                                                                 
DJ0004        DISPLAY 'L-BYP-DATECHK-SW = ' L-BYP-DATECHK-SW                    
DJ0004                '  DO DATE CHECK '                                        
DJ0004     END-IF                                                               
           DISPLAY ' '.                                                         
                                                                                
           EXEC SQL                                                             
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP                     
           END-EXEC                                                             
                                                                                
           IF  SQLCODE = +0                                                     
               DISPLAY ' '                                                      
               DISPLAY 'CAT710: W-CURRENT-TIMESTAMP = '                         
                                                    W-CURRENT-TIMESTAMP         
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT710: W-CURRENT-TIMESTAMP NOT SET'                    
               PERFORM 8500-SQL-ERROR-ROUTINE                                   
           END-IF.                                                              
                                                                                
DJ0004     MOVE 'CAT710'                  TO BPDATES-CALLING-PGM.               
DJ0004     SET  LNKDATZ-REQUEST           TO TRUE.                              
DJ0004     CALL BPDATES USING BPDATES-PARAMETERS.                               
DJ0004     MOVE BPD-PROC-DATE TO W-PROC-DATE.                                   
DJ0004     DISPLAY 'CAT710: BPD-PROC-DATE = ' BPD-PROC-DATE                     
                                                                                
           OPEN INPUT NSCC-POSITION-FILE.                                       
           DISPLAY 'CAT710: ACATPOSN OPENED FOR INPUT.  STATUS = '              
                                                 ACATPOSN-STAT                  
                                                                                
           IF ACATPOSN-OKAY                                                     
                CONTINUE                                                        
           ELSE                                                                 
                DISPLAY 'CAT710: ERROR OPENING ACATPOSN'                        
                DISPLAY 'CAT710: OPEN STATUS = ' ACATPOSN-STAT                  
                        '.  INPUT RECORD COUNT  = ' W-INFILE-CNT                
                DISPLAY 'CAT710: U3001 - ABENDING ON BAD OPEN STATUS'           
                MOVE +3001    TO ABEND-CODE                                     
                CALL ABEND USING ABEND-CODE.                                    
                                                                                
           OPEN INPUT PRNGFL.                                                   
           DISPLAY 'CAT710: PRNGFL   OPENED FOR INPUT.  STATUS = '              
                                              PRNGFL-STAT                       
                                                                                
           IF  PRNGFL-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT710: ERROR OPENING PRNGFL'                           
               DISPLAY 'CAT710: OPEN STATUS = ' PRNGFL-STAT                     
               DISPLAY 'CAT710: U3004 - ABENDING ON BAD FILE STATUS'            
               MOVE +3004    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF.                                                              
           MOVE 'D'              TO GETMSD-DEVICE-IND                           
           MOVE 'R'              TO GETMSD-ACCESS-IND                           
           MOVE 'E'              TO GETMSD-FORMAT-IND                           
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       1500-LOAD-B1-RTN.                                                        
           PERFORM VARYING WS-CLNT-NO FROM 1 BY 1                               
                    UNTIL WS-CLNT-NO > 500                                      
                                                                                
              MOVE SPACES TO WS-CLIENT-TABLE-ENTRY(WS-CLNT-NO)                  
              MOVE  ' '                   TO  BH-BROKER-HEADER-INFO             
                                              BH-ACAT-INFO                      
              MOVE  WS-CLNT-NO            TO  BH-BROKER-NUMBER-N                
                                  WS-TBL-ADP-CLIENT-NBR(WS-CLNT-NO)             
              MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE            
              MOVE  '434500'              TO  BH-B2-INFO-ID                     
              CALL  GETB1V              USING BH-BROKER-HEADER-INFO             
                                              BH-ACAT-INFO                      
                                                                                
              IF BH-BROKER-ACTIVE                                               
                 MOVE BH-BROKER-CLEARING-HOUSE(2 : 4)                           
                                  TO WS-TBL-BROKER-NBR(WS-CLNT-NO)              
                 MOVE BH-BROKER-NAME                                            
                                  TO WS-TBL-BROKER-NAME(WS-CLNT-NO)             
                 MOVE BH-BROKER-STATUS                                          
                                  TO WS-TBL-BROKER-STATUS(WS-CLNT-NO)           
                 MOVE BH-ACAT-STATUS                                            
                                  TO WS-TBL-ACAT-STATUS(WS-CLNT-NO)             
DJ0006           MOVE BH-ACAT-ASCENDIS-USER                                     
DJ0006                         TO WS-TBL-ACAT-ASCENDIS-USER(WS-CLNT-NO)         
                 IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '                         
                     MOVE BH-BROKER-MINI-MAXI-SUBGROUP                          
                                  TO WS-TBL-STREAM(WS-CLNT-NO)                  
                 ELSE                                                           
                    MOVE BH-BROKER-MINI-MAXI-INDICATOR                          
                                  TO WS-TBL-STREAM(WS-CLNT-NO)                  
                 END-IF                                                         
                 IF BH-ACAT-ACTIVE                                              
                    DISPLAY 'B1-CLT=' WS-CLNT-NO                                
                                  ' ' WS-TBL-BROKER-NAME   (WS-CLNT-NO)         
                              ' BKR ' WS-TBL-BROKER-NBR    (WS-CLNT-NO)         
                              ' STR ' WS-TBL-STREAM        (WS-CLNT-NO)         
                              ' STA ' WS-TBL-BROKER-STATUS (WS-CLNT-NO)         
                             ' ACAT ' WS-TBL-ACAT-STATUS   (WS-CLNT-NO)         
DJ0006               ' ASCENDIS ' WS-TBL-ACAT-ASCENDIS-USER(WS-CLNT-NO)         
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
      /                                                                         
       2000-PROCESS-ACATPOSN.                                                   
                                                                                
           PERFORM 3000-READ-ACATPOSN  THRU 3000-EXIT.                          
                                                                                
           IF  END-OF-ACATPOSN                                                  
               GO 2000-EXIT                                                     
           END-IF.                                                              
                                                                                
           IF W-NSCC-DIST-PARTICIPANT NOT = WS-BROKER-NBR                       
              MOVE W-NSCC-DIST-PARTICIPANT TO WS-BROKER-NBR                     
                                                                                
              SET SUB  TO  +1                                                   
              SEARCH WS-CLIENT-TABLE-ENTRY                                      
                 VARYING SUB                                                    
                AT END                                                          
                   MOVE 0000                        TO WS-ADP-CLIENT            
                   DISPLAY 'NEW-BRK=' WS-BROKER-NBR                             
                          ' BAD BROKER NUMBER FROM NSCC -'                      
                          ' NOT FOUND IN B1 -'                                  
                          ' CLT=' WS-ADP-CLIENT                                 
               WHEN                                                             
                   WS-BROKER-NBR = WS-TBL-BROKER-NBR (SUB)                      
                   MOVE WS-TBL-ADP-CLIENT-NBR (SUB) TO WS-ADP-CLIENT            
                   DISPLAY 'NEW-BRK=' WS-BROKER-NBR                             
                          ' CLT=' WS-TBL-ADP-CLIENT-NBR(SUB)                    
                              ' ' WS-TBL-BROKER-NAME   (SUB)                    
                          ' STR ' WS-TBL-STREAM        (SUB)                    
                          ' STA ' WS-TBL-BROKER-STATUS (SUB)                    
                         ' ACAT ' WS-TBL-ACAT-STATUS   (SUB)                    
DJ0006               ' ASCENDIS ' WS-TBL-ACAT-ASCENDIS-USER(SUB)                
              END-SEARCH                                                        
           END-IF.                                                              
           IF  WS-ADP-CLIENT NOT = 0000                                         
               PERFORM 4000-PROCESS-RTN  THRU 4000-EXIT                         
           ELSE                                                                 
               ADD 1 TO W-NO-CLT-CNT                                            
           END-IF.                                                              
                                                                                
       2000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       3000-READ-ACATPOSN.                                                      
                                                                                
           READ NSCC-POSITION-FILE                                              
                AT END                                                          
                   MOVE 'Y'   TO END-OF-ACATPOSN-SW                             
                   DISPLAY 'CAT710: END OF NSCC POSTION FILE, '                 
                           'NSCC POSTIONS RECORD-CNT = ' W-INFILE-CNT           
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           ADD  1   TO W-INFILE-CNT.                                            
                                                                                
           IF  ACATPOSN-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT710: ERROR READING ACATPOSN'                         
               DISPLAY 'CAT710: READ STATUS = ' ACATPOSN-STAT                   
                  '.  NSCC POSTISION REC-CNT = ' W-INFILE-CNT                   
               DISPLAY 'CAT710: U3002 - ABENDING ON BAD READ STATUS'            
               MOVE +3004 TO ABEND-CODE                                         
               PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT                        
           END-IF.                                                              
                                                                                
      **<< SKIP RECORD IF NSCCP-REC-TYPE = '1' (UNKNOWN HEADER REC)>>           
           IF NSCCP-REC-TYPE = '1'                                              
              DISPLAY ' '                                                       
              DISPLAY 'FILE HEADER:'                                            
              DISPLAY  NSCCP-RECORD (1 : W-REC-LEN-IN)                          
              DISPLAY ' '                                                       
DJ0004        IF NSCCP-RECORD (7:8) = W-PROC-DATE                               
DJ0004           DISPLAY 'FILE HEADER DATE (' NSCCP-RECORD (7:8) ')'            
DJ0004                   ' = PROC-DATE (' W-PROC-DATE '). OK.'                  
DJ0004        ELSE                                                              
DJ0004           DISPLAY 'FILE HEADER DATE (' NSCCP-RECORD (7:8) ')'            
DJ0004           ' NOT = PROC-DATE (' W-PROC-DATE '). NOT OK.'                  
DJ0004           IF L-BYP-DATECHK                                               
DJ0004              DISPLAY 'CAT710: BYPASS DATECHECK PER JCL PARM'             
DJ0004           ELSE                                                           
DJ0004              DISPLAY 'CAT710: U3006 - ABENDING ON BAD FILE DATE'         
DJ0004              MOVE +3006    TO ABEND-CODE                                 
DJ0004              CALL ABEND USING ABEND-CODE                                 
DJ0004           END-IF                                                         
DJ0004        END-IF                                                            
              GO TO 3000-READ-ACATPOSN                                          
           END-IF.                                                              
                                                                                
           IF NSCCP-HEADER                                                      
              MOVE ' '           TO  WS-HDR-RECORD                              
              MOVE NSCCP-RECORD     (1 : W-REC-LEN-IN)  TO                      
                   WS-HDR-RECORD    (1 : W-REC-LEN-IN)                          
              DISPLAY ' '                                                       
              DISPLAY 'BRK-HDR:' WS-HDR-RECORD                                  
              GO TO 3000-READ-ACATPOSN                                          
           END-IF                                                               
                                                                                
           IF NSCCP-POSITION-MRO                                                
              IF (NSCCP-XFER OR NSCCP-ASSET)                                    
                 MOVE ' '          TO W-NSCC-RECORD                             
                 MOVE NSCCP-RECORD     (1 : W-REC-LEN-IN)  TO                   
                      W-NSCC-RECORD    (1 : W-REC-LEN-IN)                       
##               GO TO 3000-EXIT                                                
              ELSE                                                              
                 GO TO 3000-READ-ACATPOSN                                       
              END-IF                                                            
           END-IF                                                               
                                                                                
           IF NSCCP-SETTLMNT-MRO                                                
              GO TO 3000-READ-ACATPOSN                                          
           END-IF                                                               
                                                                                
           IF NSCCP-TRAILER                                                     
              MOVE ' '           TO  WS-TRL-RECORD                              
              MOVE NSCCP-RECORD     (1 : W-REC-LEN-IN)  TO                      
                   WS-TRL-RECORD    (1 : W-REC-LEN-IN)                          
              DISPLAY 'BRK-TRL:' WS-TRL-RECORD                                  
              DISPLAY 'CAT710: END OF BROKER. '                                 
                      'NSCC POSTIONS RECORD-CNT = ' W-INFILE-CNT                
              GO TO 3000-READ-ACATPOSN                                          
           ELSE                                                                 
              DISPLAY ' CAT710 - BAD RECORD TYPE'                               
              DISPLAY '  NSCCP-REC-TYPE = '  NSCCP-REC-TYPE                     
              DISPLAY '  NSCCP-REC-SUBTYPE = '  NSCCP-REC-SUBTYPE               
              DISPLAY '  NSCC POSTIONS RECORD-CNT = ' W-INFILE-CNT              
              MOVE +3005 TO ABEND-CODE                                          
              PERFORM 8000-ABEND-ROUTINE THRU 8000-EXIT                         
           END-IF.                                                              
                                                                                
       3000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4000-PROCESS-RTN.                                                        
           MOVE SPACES  TO SV-ACAT-CNTL-NBR.                                    
                                                                                
           IF W-NSCC-REC-SUBTYPE = 'T'                                          
              ADD  1 TO NSCC-TIF-CNT                                            
              MOVE W-NSCC-ACAT-CTL-NBR  TO  SV-ACAT-CNTL-NBR                    
              MOVE WS-ADP-CLIENT        TO  SV-CLIENT-NBR                       
              MOVE SV-CLIENT-NBR        TO  WS-CLIENT-NBR                       
LRM020********IF PARM-STREAM-IND = 'Q'                                          
LRM020********AND W-NSCC-SETTLEMENT-DATE       > '00000000'                     
LRM020***********PERFORM 4020-INCRIMENT-STTLM-DT                                
LRM020********END-IF                                                            
              PERFORM 5000-RETRIEVE-VTRNFR THRU 5000-EXIT                       
              IF VTRNFR-FOUND                                                   
                 MOVE SV-CLIENT-NBR    TO WS-RECONCILED-TIF-CLT                 
                 MOVE SV-ACAT-CNTL-NBR TO WS-RECONCILED-TIF-ACAT                
                 PERFORM 5010-CHECK-TIF-DIFFERNCE                               
*****************IF DIFFERENCE-FOUND                                            
                    PERFORM 6000-RECONCILE-TIF                                  
                    PERFORM 6100-UPDATE-TIF THRU 6100-EXIT                      
*****************END-IF                                                         
              ELSE                                                              
                 IF  SV-CLIENT-NBR NOT = '0000'                                 
                      DISPLAY 'TIF   NOTFND: '                                  
                        'CLT=' SV-CLIENT-NBR                                    
                       ' CTL=' SV-ACAT-CNTL-NBR                                 
                       ' TFR=' W-NSCC-TI-TFR-TYPE                               
                       ' STA=' W-NSCC-STATUS                                    
                        ' SD=' W-NSCC-SETTLEMENT-DATE                           
                       ' SQL=' W-DB2-SQLCODE                                    
                     PERFORM 7600-INSERT-VTRNFR THRU 7600-EXIT                  
                     MOVE SV-CLIENT-NBR    TO WS-RECONCILED-TIF-CLT             
                     MOVE SV-ACAT-CNTL-NBR TO WS-RECONCILED-TIF-ACAT            
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
      **<< RECONCILIATE ASSET  >>**                                             
           IF W-NSCC-REC-SUBTYPE = 'A'                                          
              ADD 1 TO NSCC-ASSET-CNT                                           
              IF  W-NSCC-AT-OPT-CATG > '00'                                     
                    ADD 1 TO NSCC-OPTION-CNT                                    
                    MOVE W-NSCC-ATO-OPT-COMMENT      TO W-DESC                  
              ELSE                                                              
                  IF W-NSCC-AT-STL-LOC = '10'                                   
                     ADD 1 TO NSCC-MF-CNT                                       
                     MOVE W-NSCC-AT-ASSET-DESC (1:30) TO W-DESC                 
                  ELSE                                                          
                     ADD 1 TO NSCC-REG-ASSET-CNT                                
                     MOVE W-NSCC-AT-ASSET-DESC (1:30) TO W-DESC                 
                  END-IF                                                        
              END-IF                                                            
              MOVE WS-ADP-CLIENT        TO  SV-CLIENT-NBR                       
              MOVE W-NSCC-ACAT-CTL-NBR  TO  SV-ACAT-CNTL-NBR                    
              IF  SV-CLIENT-NBR     = WS-RECONCILED-TIF-CLT  AND                
                  SV-ACAT-CNTL-NBR  = WS-RECONCILED-TIF-ACAT                    
                  MOVE SPACE TO ASSET-FOUND-SW                                  
                  PERFORM 7000-RETRIEVE-ASSET THRU 7000-EXIT                    
##                PERFORM 7010-CHECK-ASSET-DIFFERNCE                            
                  IF ASSET-FOUND                                                
                     ADD 1 TO VASSET-FND-CNT                                    
                     IF WS-ASSET-QTY NOT = 0                                    
                        PERFORM 7680-GET-ADP-NO THRU 7680-EXIT                  
                      END-IF                                                    
                         PERFORM 7100-UPDATE-ASSET THRU 7100-EXIT               
                         ADD 1 TO VASSET-UPDT-CNT                               
                      PERFORM 4100-UPDATE-OTHER-DATABASE THRU 4100-EXIT         
                  ELSE                                                          
                       IF SV-CLIENT-NBR NOT = '0000'                            
                          ADD 1 TO VASSET-NOTFND-CNT                            
                          DISPLAY 'ASSET NOTFND: '                              
                           'CLT=' SV-CLIENT-NBR                                 
                          ' CTL=' W-NSCC-ACAT-CTL-NBR                           
                          ' TFR=' W-NSCC-AT-TFR-TYPE                            
                          ' STA=' W-NSCC-STATUS                                 
                          ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                       
                          ' STL=' W-NSCC-AT-STL-LOC                             
                          ' ' W-NSCC-AT-OPT-CATG                                
                          ' ' W-DESC                                            
                          PERFORM 7610-INSERT-VASSET THRU 7610-EXIT             
                       END-IF                                                   
                  END-IF                                                        
              ELSE                                                              
                   ADD 1 TO VASSET-NOT-UPDATED-CNT                              
                      DISPLAY 'ASSET NOT UPD:'                                  
                        'CLT=' SV-CLIENT-NBR                                    
                       ' CTL=' W-NSCC-ACAT-CTL-NBR                              
                       ' TFR=' W-NSCC-AT-TFR-TYPE                               
                       ' STA=' W-NSCC-STATUS                                    
                       ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                          
                       ' STL=' W-NSCC-AT-STL-LOC                                
                       ' ' W-NSCC-AT-OPT-CATG                                   
                       ' ' W-DESC                                               
              END-IF.                                                           
                                                                                
           ADD +1 TO W-COMMIT-CTR                                               
           IF  W-COMMIT-CTR > +19                                               
               PERFORM 8100-SQL-COMMIT THRU 8100-EXIT                           
               MOVE 0 TO W-COMMIT-CTR                                           
           END-IF.                                                              
                                                                                
       4000-EXIT.                                                               
           EXIT.                                                                
      *                                                                         
LRM006 4020-INCRIMENT-STTLM-DT.                                                 
LRM006     SET BPD-DISPLACEMENT-DATE-INFO TO TRUE.                              
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001***  MOVE 'US' TO  BPDATES-CALENDAR-TYPE.                                 
CSG001     MOVE '  ' TO  BPDATES-CALENDAR-TYPE.                                 
LRM006     MOVE W-NSCC-SETTLEMENT-DATE TO BPDATES-BASE-DATE.                    
LRM006     SET BPD-DISP-PLUS TO TRUE.                                           
LRM006     SET BPD-DISP-CALENDAR TO TRUE.                                       
LRM006     MOVE '0' TO BPD-DT-DAY-TYPE                                          
LRM006     PERFORM VARYING DAY-SUB FROM 1 BY 1                                  
LRM006        UNTIL DAY-SUB > 20                                                
LRM006            OR BPD-DT-TD-AND-SD                                           
LRM006        MOVE DAY-SUB TO BPDATES-DTSEARCH-DISP                             
LRM006        CALL  BPDATES  USING BPDATES-PARAMETERS                           
LRM006        END-CALL                                                          
LRM006     END-PERFORM.                                                         
LRM006     IF NOT BPD-VALID-RETURN                                              
LRM006        DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE                    
LRM006        DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE                  
LRM006        DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE                   
LRM006        DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG                    
LRM006        MOVE +4020 TO ABEND-CODE                                          
LRM006        CALL ABEND USING ABEND-CODE                                       
LRM006     ELSE                                                                 
LRM006        MOVE BPD-DT-CALDATE TO W-NSCC-SETTLEMENT-DATE                     
LRM006        DISPLAY 'CHANGING S/D  FROM ' BPDATES-BASE-DATE                   
LRM006                               ' TO ' BPD-DT-CALDATE                      
LRM006     END-IF.                                                              
      *                                                                         
       4100-UPDATE-OTHER-DATABASE.                                              
           IF W-NSCC-AT-OPT-CATG > '00'                                         
              MOVE SPACE TO OPTION-FOUND-SW                                     
              PERFORM 7200-RETRIEVE-OPTION THRU 7200-EXIT                       
              IF OPTION-FOUND                                                   
                 PERFORM 7210-CHECK-OPTION-DIFFERENCE                           
*****************IF DIFFERENCE-FOUND                                            
                    PERFORM 7300-UPDATE-OPTION THRU 7300-EXIT                   
*****************END-IF                                                         
              ELSE                                                              
                      DISPLAY 'OPT   NOTFND: '                                  
                        'CLT=' SV-CLIENT-NBR                                    
                       ' CTL=' W-NSCC-ACAT-CTL-NBR                              
                       ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                          
                       ' TFR=' W-NSCC-AT-TFR-TYPE                               
                       ' STL=' W-NSCC-AT-STL-LOC                                
                       ' ' W-NSCC-AT-OPT-CATG                                   
                       ' ' W-DESC                                               
                      PERFORM 7620-INSERT-VOPTN THRU 7620-EXIT                  
              END-IF                                                            
           ELSE                                                                 
           IF W-NSCC-AT-STL-LOC = '10'                                          
              MOVE SPACE TO MUTUAL-FUND-FOUND-SW                                
              PERFORM 7400-RETRIEVE-MUTUAL THRU 7400-EXIT                       
              IF MUTUAL-FUND-FOUND                                              
                 PERFORM 7410-CHECK-MUTUAL-DIFFERENCE                           
*****************IF DIFFERENCE-FOUND                                            
                    PERFORM 7500-UPDATE-MUTUAL THRU 7500-EXIT                   
*****************END-IF                                                         
              ELSE                                                              
DJ0007****            DISPLAY 'MF    NOTFND: '                                  
DJ0007****              'CLT=' SV-CLIENT-NBR                                    
DJ0007****             ' CTL=' W-NSCC-ACAT-CTL-NBR                              
DJ0007****             ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                          
DJ0007****             ' TFR=' W-NSCC-AT-TFR-TYPE                               
DJ0007****             ' STL=' W-NSCC-AT-STL-LOC                                
DJ0007****             ' ' W-NSCC-AT-OPT-CATG                                   
DJ0007****             ' ' W-DESC                                               
                      PERFORM 7630-INSERT-VMF THRU 7630-EXIT                    
              END-IF.                                                           
       4100-EXIT. EXIT.                                                         
      /                                                                         
       5000-RETRIEVE-VTRNFR.                                                    
                                                                                
           MOVE +0 TO SQLCODE                                                   
                                                                                
           EXEC SQL                                                             
                SELECT                                                          
                       CLIENT_NBR                                               
                     , ACAT_CONTROL_NBR                                         
                     , SBMTG_PRTCP_NBR                                          
                     , DLVR_NBR                                                 
                     , ACCT_DLVR_NBR                                            
                     , RCV_NBR                                                  
                     , ACCT_RCV_NBR                                             
                     , TRNFR_TYPE_CD                                            
                     , TRANS_TYPE_CD                                            
                     , RCV_CUST_NM                                              
                     , RCV_SS_PRIM_NBR                                          
                     , RCV_SS_SCNDY_NBR                                         
                     , RCV_ACCT_TYPE_CD                                         
                     , RCV_OCC_BRKR_NBR                                         
                     , RCV_CRSPN_NBR                                            
                     , ACAT_CNTL_ASTD_NBR                                       
                     , CMNT_TXT                                                 
                     , STTLM_TM_CD                                              
                     , VAL_FREE_CD                                              
                     , TRANS_RFRN_ID_CD                                         
                     , DB_CR_CD                                                 
                     , DSTBN_SIDE_CD                                            
                     , SYS_RJCT_RSN_CD                                          
                     , TRNFR_TYPE_RJCT_CD                                       
                     , PHSCL_SEQ_NBR                                            
                     , LGCL_SEQ_NBR                                             
                     , RR_CD                                                    
                     , BRANCH_CD                                                
                     , ACCT_CD                                                  
                     , DAYS_STTS_QTY                                            
                     , STTS_CD                                                  
                     , PRCS_DT                                                  
                     , STTLM_DT                                                 
                     , STTLM_ASCTD_DT                                           
LRM007               , CVRSN_ACCT_NBR                                           
DJ0006               , NSCC_ACK_IND                                             
                INTO                                                            
                       :WS-CLIENT-NBR                                           
                     , :WS-ACAT-CNTL-NBR                                        
                     , :WS-SBMTG-PRTCP-NBR                                      
                     , :WS-DLVR-NBR                                             
                     , :WS-ACCT-DLVR-NBR                                        
                     , :WS-RCV-NBR                                              
                     , :WS-ACCT-RCV-NBR                                         
                     , :WS-TRNFR-TYPE-CD                                        
                     , :WS-TRANS-TYPE-CD                                        
                     , :WS-RCV-CUST-NM                                          
                     , :WS-RCV-SS-PRIM-NBR                                      
                     , :WS-RCV-SS-SCNDY-NBR                                     
                     , :WS-RCV-ACCT-TYPE-CD                                     
                     , :WS-RCV-OCC-BRKR-NBR                                     
                     , :WS-RCV-CRSPN-NBR                                        
                     , :WS-ACAT-CNTL-ASTD-NBR                                   
                     , :WS-CMNT-TXT                                             
                     , :WS-STTLM-TM-CD                                          
                     , :WS-VAL-FREE-CD                                          
                     , :WS-TRANS-RFRN-ID-CD                                     
                     , :WS-DB-CR-CD                                             
                     , :WS-DSTBN-SIDE-CD                                        
                     , :WS-SYS-RJCT-RSN-CD                                      
                     , :WS-TRNFR-TYPE-RJCT-CD                                   
                     , :WS-PHSCL-SEQ-NBR                                        
                     , :WS-LGCL-SEQ-NBR                                         
                     , :WS-RR-CD                                                
                     , :WS-BRANCH-CD                                            
                     , :WS-ACCT-CD                                              
                     , :WS-DAYS-STTS-QTY                                        
                     , :WS-STTS-CD                                              
                     , :WS-PRCS-DT                                              
                     , :WS-STTLM-DT                                             
                     , :WS-STTLM-ASCTD-DT                                       
LRM007               , :WS-CVRSN-ACCT-NBR                                       
DJ0006               , :WS-NSCC-ACK-IND                                         
                                                                                
                FROM VTRNFR                                                     
                WHERE CLIENT_NBR       = :SV-CLIENT-NBR                         
                 AND  ACAT_CONTROL_NBR = :SV-ACAT-CNTL-NBR                      
           END-EXEC.                                                            
                                                                                
           MOVE SQLCODE                  TO W-DB2-SQLCODE.                      
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                   SET VTRNFR-FOUND TO TRUE                                     
                   ADD    1   TO  VTRNFR-FND-CNT                                
              WHEN +100                                                         
                   SET VTRNFR-NOT-FOUND TO TRUE                                 
                   ADD    1   TO  VTRNFR-NOTFND-CNT                             
              WHEN OTHER                                                        
                   SET VTRNFR-NOT-FOUND TO TRUE                                 
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                          ' CLT=' SV-CLIENT-NBR,                                
                          ' CTL=' SV-ACAT-CNTL-NBR                              
                          ' VTRNFR ERROR '                                      
                          ' SQL=' W-DB2-SQLCODE                                 
                          ' ' W-NSCC-COMMON-AREA                                
                   PERFORM 8500-SQL-ERROR-ROUTINE                               
           END-EVALUATE.                                                        
                                                                                
       5000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5010-CHECK-TIF-DIFFERNCE.                                                
           MOVE SPACE TO DIFFERENCE-FOUND-SW.                                   
                                                                                
           MOVE  W-NSCC-DAYS-IN-STATUS    TO  WS-QTY-9.                         
           IF WS-QTY-9 NOT = WS-DAYS-STTS-QTY                                   
              SET DIFFERENCE-FOUND TO TRUE.                                     
                                                                                
           IF W-NSCC-TI-ASSC-STL-DT > SPACE                                     
              IF W-NSCC-TI-ASSC-STL-DT  > '00000000'                            
                 MOVE  W-NSCC-TI-ASSC-STL-DT TO  WK-DATE                        
                 MOVE  WK-DT-YYYY         TO  WK-DT-1                           
                 MOVE  WK-DT-MM           TO  WK-DT-2                           
                 MOVE  WK-DT-DD           TO  WK-DT-3                           
              ELSE                                                              
                 MOVE  '0001'             TO  WK-DT-1                           
                 MOVE  '01'               TO  WK-DT-2                           
                 MOVE  '01'               TO  WK-DT-3                           
              END-IF                                                            
           ELSE                                                                 
                 MOVE  '0001'             TO  WK-DT-1                           
                 MOVE  '01'               TO  WK-DT-2                           
                 MOVE  '01'               TO  WK-DT-3                           
           END-IF.                                                              
           IF WK-FMT-DATE NOT = WS-STTLM-ASCTD-DT                               
              SET DIFFERENCE-FOUND TO TRUE.                                     
                                                                                
           IF W-NSCC-PROC-DATE > SPACE                                          
              IF W-NSCC-PROC-DATE > '00000000'                                  
                 MOVE  W-NSCC-PROC-DATE     TO  WK-DATE                         
                 MOVE  WK-DT-YYYY         TO  WK-DT-1                           
                 MOVE  WK-DT-MM           TO  WK-DT-2                           
                 MOVE  WK-DT-DD           TO  WK-DT-3                           
              ELSE                                                              
                 MOVE  '0001'             TO  WK-DT-1                           
                 MOVE  '01'               TO  WK-DT-2                           
                 MOVE  '01'               TO  WK-DT-3                           
              END-IF                                                            
           ELSE                                                                 
                 MOVE  '0001'             TO  WK-DT-1                           
                 MOVE  '01'               TO  WK-DT-2                           
                 MOVE  '01'               TO  WK-DT-3                           
           END-IF.                                                              
           IF WK-FMT-DATE NOT = WS-PRCS-DT                                      
              SET DIFFERENCE-FOUND TO TRUE.                                     
                                                                                
           IF W-NSCC-STATUS > 299 AND                                           
              W-NSCC-SETTLEMENT-DATE       > '00000000'                         
              MOVE W-NSCC-SETTLEMENT-DATE TO  WK-DATE                           
                    MOVE WK-DT-YYYY       TO  WK-DT-1                           
                    MOVE WK-DT-MM         TO  WK-DT-2                           
                    MOVE WK-DT-DD         TO  WK-DT-3                           
           ELSE                                                                 
                 MOVE  '0001'             TO  WK-DT-1                           
                 MOVE  '01'               TO  WK-DT-2                           
                 MOVE  '01'               TO  WK-DT-3                           
           END-IF.                                                              
                                                                                
           IF WK-FMT-DATE NOT = WS-STTLM-DT                                     
              SET DIFFERENCE-FOUND TO TRUE.                                     
                                                                                
      /                                                                         
       6000-RECONCILE-TIF.                                                      
      *-------------------------------------------------------------*           
***********DISPLAY '6000-RECONCILE-TIF.       '                                 
      *-------------------------------------------------------------*           
                                                                                
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR                      
               MOVE 'D'                   TO  W-NSCC-DIST-SIDE                  
           ELSE                                                                 
               MOVE 'R'                   TO  W-NSCC-DIST-SIDE                  
           END-IF.                                                              
                                                                                
LRM023     IF (WS-CLIENT-NBR = '0006' OR '0313')                                
LRM008     AND WS-TRNFR-TYPE-CD = ('RCR'                                        
LRM008                          OR 'PTD' OR 'MFC' OR 'FRV' OR 'RCL')            
LRM007     AND WS-DSTBN-SIDE-CD = 'R'                                           
LRM007     AND WS-CVRSN-ACCT-NBR > SPACES                                       
LRM007        DISPLAY 'SKIP RVCR ACCT UPDT FROM ' WS-ACCT-RCV-NBR(1:8)          
LRM007                ' TO ' W-NSCC-TI-RCV-ACCT-NBR                             
LRM007                ' CONV ACCT ' WS-CVRSN-ACCT-NBR                           
LRM008                 ' CTL=' SV-ACAT-CNTL-NBR                                 
LRM008                 ' TFR=' W-NSCC-TI-TFR-TYPE                               
LRM007        MOVE WS-ACCT-RCV-NBR TO W-NSCC-TI-RCV-ACCT-NBR                    
LRM007     ELSE                                                                 
LRM007        MOVE  W-NSCC-TI-RCV-ACCT-NBR   TO  WS-ACCT-RCV-NBR                
LRM007     END-IF.                                                              
                                                                                
LRM023     IF (WS-CLIENT-NBR = '0006' OR '0313')                                
LRM008     AND WS-TRNFR-TYPE-CD =  'PTR'                                        
LRM008     AND WS-DSTBN-SIDE-CD = 'D'                                           
LRM008     AND WS-CVRSN-ACCT-NBR > SPACES                                       
LRM008        DISPLAY 'SKIP DLVR ACCT UPDT FROM ' WS-ACCT-DLVR-NBR(1:8)         
LRM008                ' TO ' W-NSCC-TI-DEL-ACCT-NBR                             
LRM008                ' CONV ACCT ' WS-CVRSN-ACCT-NBR                           
LRM008                 ' CTL=' SV-ACAT-CNTL-NBR                                 
LRM008                 ' TFR=' W-NSCC-TI-TFR-TYPE                               
LRM008        MOVE WS-ACCT-DLVR-NBR TO W-NSCC-TI-DEL-ACCT-NBR                   
LRM008     ELSE                                                                 
LRM008        MOVE  W-NSCC-TI-DEL-ACCT-NBR   TO  WS-ACCT-DLVR-NBR               
LRM008     END-IF.                                                              
                                                                                
           IF  W-NSCC-DIST-PARTICIPANT   = W-NSCC-TI-RCV-NBR                    
               MOVE W-NSCC-TI-RCV-ACCT-NBR(1:3) TO W-BRANCH-CD                  
               MOVE W-NSCC-TI-RCV-ACCT-NBR(4:5) TO W-ACCT-CD                    
           ELSE                                                                 
               MOVE W-NSCC-TI-DEL-ACCT-NBR(1:3) TO W-BRANCH-CD                  
               MOVE W-NSCC-TI-DEL-ACCT-NBR(4:5) TO W-ACCT-CD                    
           END-IF                                                               
                                                                                
           MOVE  W-NSCC-DIST-SIDE         TO  WS-DSTBN-SIDE-CD.                 
                                                                                
           MOVE  W-NSCC-DIST-PARTICIPANT  TO  WS-SBMTG-PRTCP-NBR.               
           IF    W-NSCC-STATUS > ' '                                            
                 MOVE  W-NSCC-STATUS      TO  WS-STTS-CD                        
           ELSE                                                                 
               DISPLAY 'INP=' W-INFILE-CNT                                      
                      ' CLT=' SV-CLIENT-NBR,                                    
                      ' CTL=' SV-ACAT-CNTL-NBR                                  
                      ' W-NSCC-STATUS = ' W-NSCC-STATUS                         
           END-IF.                                                              
           MOVE  W-NSCC-SETTLEMENT-TIMING TO  WS-STTLM-TM-CD.                   
           MOVE  W-NSCC-VALUE-FREE-IND    TO  WS-VAL-FREE-CD.                   
           MOVE  W-NSCC-DEBIT-CREDIT-IND  TO  WS-DB-CR-CD.                      
           MOVE  W-NSCC-TI-TFR-TYPE       TO  WS-TRNFR-TYPE-CD.                 
           MOVE  W-NSCC-TI-RCV-NBR        TO  WS-RCV-NBR.                       
           MOVE  W-NSCC-TI-DEL-NBR        TO  WS-DLVR-NBR.                      
           MOVE  W-NSCC-TI-RCV-CUST-NAME  TO  WS-RCV-CUST-NM.                   
           MOVE  W-NSCC-TI-RCV-SSN-PRM    TO  WS-RCV-SS-PRIM-NBR.               
           MOVE  W-NSCC-TI-RCV-SSN-SEC    TO  WS-RCV-SS-SCNDY-NBR.              
           MOVE  W-NSCC-TI-RCV-ACCT-TYPE  TO  WS-RCV-ACCT-TYPE-CD.              
           MOVE  W-NSCC-TI-RCV-OCC-BRKR   TO  WS-RCV-OCC-BRKR-NBR.              
           MOVE  W-NSCC-TI-RCV-CRSPN-NBR  TO  WS-RCV-CRSPN-NBR.                 
           MOVE  W-NSCC-TI-TFR-TYPE-REJ   TO  WS-TRNFR-TYPE-RJCT-CD.            
           MOVE  W-NSCC-TI-ASSC-CTL-NBR   TO  WS-ACAT-CNTL-ASTD-NBR.            
           MOVE  W-NSCC-TI-TRAN-REF-ID    TO  WS-TRANS-RFRN-ID-CD.              
           MOVE  W-NSCC-TI-COMMENTS       TO  WS-CMNT-TXT.                      
DJ0005     MOVE  W-NSCC-TI-GIFT-IND       TO  WS-GIFT-IND.                      
                                                                                
           MOVE  W-NSCC-DAYS-IN-STATUS    TO  WS-QTY-9.                         
                 MOVE WS-QTY-9            TO  WS-DAYS-STTS-QTY.                 
                                                                                
*DJ        IF  W-NSCC-TI-ASSC-STL-DT       > '00000000'                         
*DJ            MOVE  W-NSCC-TI-ASSC-STL-DT TO  WK-DATE                          
                 MOVE  WK-DT-YYYY         TO  WK-DT-1                           
                 MOVE  WK-DT-MM           TO  WK-DT-2                           
                 MOVE  WK-DT-DD           TO  WK-DT-3                           
                 MOVE  WK-FMT-DATE        TO  WS-STTLM-ASCTD-DT                 
*DJ        ELSE                                                                 
                 MOVE  '0001'             TO  WK-DT-1                           
                 MOVE  '01'               TO  WK-DT-2                           
                 MOVE  '01'               TO  WK-DT-3                           
                 MOVE  WK-FMT-DATE        TO  WS-STTLM-ASCTD-DT                 
*DJ        END-IF                                                               
           IF (WK-DT-1 < '0001')                                                
           OR (WK-DT-2 > '12'   OR                                              
               WK-DT-2 < '01')                                                  
           OR (WK-DT-3 > '31'   OR                                              
               WK-DT-3 < '01')                                                  
               DISPLAY 'INP=' W-INFILE-CNT                                      
                      ' CLT=' SV-CLIENT-NBR,                                    
                      ' CTL=' SV-ACAT-CNTL-NBR                                  
                      ' BAD DATE W-NSCC-TI-ASSC-STL-DT = '                      
                                 W-NSCC-TI-ASSC-STL-DT                          
                 MOVE  '0001'             TO  WK-DT-1                           
                 MOVE  '01'               TO  WK-DT-2                           
                 MOVE  '01'               TO  WK-DT-3                           
           END-IF.                                                              
           MOVE  WK-FMT-DATE        TO  WS-STTLM-ASCTD-DT                       
                                                                                
                                                                                
*DJ        IF  W-NSCC-PROC-DATE            > '00000000'                         
*              MOVE  W-NSCC-PROC-DATE     TO  WK-DATE                           
                 MOVE  WK-DT-YYYY         TO  WK-DT-1                           
                 MOVE  WK-DT-MM           TO  WK-DT-2                           
                 MOVE  WK-DT-DD           TO  WK-DT-3                           
                 MOVE  WK-FMT-DATE        TO  WS-PRCS-DT                        
*DJ        ELSE                                                                 
                 MOVE  '0001'             TO  WK-DT-1                           
                 MOVE  '01'               TO  WK-DT-2                           
                 MOVE  '01'               TO  WK-DT-3                           
                 MOVE  WK-FMT-DATE        TO  WS-PRCS-DT                        
*DJ        END-IF                                                               
           IF (WK-DT-1 < '0001')                                                
           OR (WK-DT-2 > '12'   OR                                              
               WK-DT-2 < '01')                                                  
           OR (WK-DT-3 > '31'   OR                                              
               WK-DT-3 < '01')                                                  
               DISPLAY 'INP=' W-INFILE-CNT                                      
                      ' CLT=' SV-CLIENT-NBR,                                    
                      ' CTL=' SV-ACAT-CNTL-NBR                                  
                      ' BAD DATE W-NSCC-PROC-DATE = '                           
                                 W-NSCC-PROC-DATE                               
                 MOVE  '0001'             TO  WK-DT-1                           
                 MOVE  '01'               TO  WK-DT-2                           
                 MOVE  '01'               TO  WK-DT-3                           
           END-IF.                                                              
           MOVE  WK-FMT-DATE        TO  WS-PRCS-DT                              
                                                                                
                                                                                
           IF W-NSCC-STATUS > 299 AND                                           
              W-NSCC-SETTLEMENT-DATE       > '00000000'                         
              MOVE W-NSCC-SETTLEMENT-DATE TO  WK-DATE                           
                    MOVE WK-DT-YYYY       TO  WK-DT-1                           
                    MOVE WK-DT-MM         TO  WK-DT-2                           
                    MOVE WK-DT-DD         TO  WK-DT-3                           
                    MOVE WK-FMT-DATE      TO  WS-STTLM-DT                       
              ADD 1 TO WS-SETTLED-CNT                                           
*DJ        ELSE                                                                 
                 MOVE  '0001'             TO  WK-DT-1                           
                 MOVE  '01'               TO  WK-DT-2                           
                 MOVE  '01'               TO  WK-DT-3                           
                 MOVE  WK-FMT-DATE        TO  WS-STTLM-DT                       
           END-IF.                                                              
           IF (WK-DT-1 < '0001')                                                
           OR (WK-DT-2 > '12'   OR                                              
               WK-DT-2 < '01')                                                  
           OR (WK-DT-3 > '31'   OR                                              
               WK-DT-3 < '01')                                                  
               DISPLAY 'INP=' W-INFILE-CNT                                      
                      ' CLT=' SV-CLIENT-NBR,                                    
                      ' CTL=' SV-ACAT-CNTL-NBR                                  
                      ' BAD DATE W-NSCC-SETTLEMENT-DATE  = '                    
                                 W-NSCC-SETTLEMENT-DATE                         
                 MOVE  '0001'             TO  WK-DT-1                           
                 MOVE  '01'               TO  WK-DT-2                           
                 MOVE  '01'               TO  WK-DT-3                           
           END-IF.                                                              
           MOVE  WK-FMT-DATE        TO  WS-STTLM-DT.                            
                                                                                
DJ0007     IF (WS-TRNFR-TYPE-CD = 'FUL' OR 'PTD' OR 'PTR')                      
DJ0007        EVALUATE WS-TBL-ACAT-ASCENDIS-USER(SUB)                           
DJ0007           WHEN '1'   MOVE 'A' TO WS-NSCC-ACK-IND                         
DJ0007           WHEN '2'   MOVE 'P' TO WS-NSCC-ACK-IND                         
DJ0007           WHEN OTHER MOVE ' ' TO WS-NSCC-ACK-IND                         
DJ0007        END-EVALUATE                                                      
DJ0006     ELSE                                                                 
DJ0006         MOVE ' '              TO WS-NSCC-ACK-IND                         
DJ0006     END-IF.                                                              
                                                                                
      /                                                                         
       6100-UPDATE-TIF.                                                         
                                                                                
           EXEC SQL                                                             
                UPDATE VTRNFR                                                   
                   SET                                                          
                       SBMTG_PRTCP_NBR    = : WS-SBMTG-PRTCP-NBR                
                     , DLVR_NBR           = : WS-DLVR-NBR                       
                     , ACCT_DLVR_NBR      = : WS-ACCT-DLVR-NBR                  
                     , RCV_NBR            = : WS-RCV-NBR                        
                     , ACCT_RCV_NBR       = : WS-ACCT-RCV-NBR                   
                     , TRNFR_TYPE_CD      = : WS-TRNFR-TYPE-CD                  
                     , TRANS_TYPE_CD      = : WS-TRANS-TYPE-CD                  
                     , RCV_CUST_NM        = : WS-RCV-CUST-NM                    
                     , RCV_SS_PRIM_NBR    = : WS-RCV-SS-PRIM-NBR                
                     , RCV_SS_SCNDY_NBR   = : WS-RCV-SS-SCNDY-NBR               
                     , RCV_ACCT_TYPE_CD   = : WS-RCV-ACCT-TYPE-CD               
                     , RCV_OCC_BRKR_NBR   = : WS-RCV-OCC-BRKR-NBR               
                     , RCV_CRSPN_NBR      = : WS-RCV-CRSPN-NBR                  
                     , ACAT_CNTL_ASTD_NBR = : WS-ACAT-CNTL-ASTD-NBR             
                     , CMNT_TXT           = : WS-CMNT-TXT                       
                     , STTS_CD            = : WS-STTS-CD                        
                     , STTLM_TM_CD        = : WS-STTLM-TM-CD                    
                     , VAL_FREE_CD        = : WS-VAL-FREE-CD                    
                     , TRANS_RFRN_ID_CD   = : WS-TRANS-RFRN-ID-CD               
                     , DB_CR_CD           = : WS-DB-CR-CD                       
                     , DSTBN_SIDE_CD      = : WS-DSTBN-SIDE-CD                  
                     , DAYS_STTS_QTY      = : WS-DAYS-STTS-QTY                  
                     , PRCS_DT            = : WS-PRCS-DT                        
                     , STTLM_DT           = : WS-STTLM-DT                       
                     , STTLM_ASCTD_DT     = : WS-STTLM-ASCTD-DT                 
                     , PRGM_NM            =  'CAT710'                           
                     , UPDT_TMSTP         = : W-CURRENT-TIMESTAMP               
                     , BRANCH_CD          = : W-BRANCH-CD                       
                     , ACCT_CD            = : W-ACCT-CD                         
DJ0005               , GIFT_IND           = : WS-GIFT-IND                       
DJ0006               , NSCC_ACK_IND       = : WS-NSCC-ACK-IND                   
                WHERE CLIENT_NBR       = :WS-CLIENT-NBR                         
                 AND  ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR                      
           END-EXEC.                                                            
                                                                                
           EVALUATE SQLCODE                                                     
              WHEN +0                                                           
                   SET VTRNFR-UPDT TO TRUE                                      
                   ADD 1 TO  VTRNFR-UPDT-CNT                                    
              WHEN OTHER                                                        
                   SET VTRNFR-NOT-UPDT  TO TRUE                                 
                   ADD 1 TO  VTRNFR-NOTUPD-CNT                                  
                   DISPLAY '6100-UPDATE-TIF ROUTINE ABENDING'                   
                   DISPLAY 'VTRNFR-NOT-UPDT'                                    
                   PERFORM 8500-SQL-ERROR-ROUTINE                               
           END-EVALUATE.                                                        
                                                                                
       6100-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
      *----------------------------------------------------------*              
      *          ASSET RECONCILIATION                                           
      *----------------------------------------------------------*              
       7000-RETRIEVE-ASSET.                                                     
           INITIALIZE DCLVASSET.                                                
           MOVE SPACE TO ASSET-FOUND-SW.                                        
           MOVE SV-CLIENT-NBR TO CLIENT-NBR OF DCLVASSET.                       
           MOVE W-NSCC-AT-ACAT-CTL-NBR TO ACAT-CONTROL-NBR OF DCLVASSET.        
           MOVE W-NSCC-AT-ASSET-SEQ-NBR TO ASSET-SEQ-NBR OF DCLVASSET.          
                                                                                
           EXEC SQL                                                             
               SELECT                                                           
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
DJ0010            ,AUCTION_RT_IND                                               
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
DJ0010            ,:DCLVASSET.AUCTION-RT-IND                                    
               FROM                                                             
                   VASSET                                                       
               WHERE                                                            
                   CLIENT_NBR = :DCLVASSET.CLIENT-NBR                           
                   AND  ACAT_CONTROL_NBR = :DCLVASSET.ACAT-CONTROL-NBR          
                   AND  ASSET_SEQ_NBR = :DCLVASSET.ASSET-SEQ-NBR                
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              SET ASSET-FOUND TO TRUE                                           
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY 'DB2 SELECT ERR AT 7000-RETRIEVE-ASSET ROUTINE'           
              PERFORM 8500-SQL-ERROR-ROUTINE.                                   
                                                                                
       7000-EXIT. EXIT.                                                         
      /                                                                         
       7010-CHECK-ASSET-DIFFERNCE.                                              
           MOVE SPACE TO DIFFERENCE-FOUND-SW.                                   
                                                                                
           IF W-NSCC-AT-ASSET-QTY > SPACE                                       
              PERFORM 7011-REFORMAT-ASSET-QTY THRU 7011-EXIT                    
              MOVE W-QTY-N  TO WS-ASSET-QTY                                     
           ELSE                                                                 
              MOVE ZERO TO WS-ASSET-QTY.                                        
                                                                                
           IF W-NSCC-AT-ASSET-PCT > SPACE                                       
              PERFORM 7012-REFORMAT-ASSET-PCT THRU 7012-EXIT                    
              MOVE W-QTY-N   TO WS-ASSET-PCT                                    
           ELSE                                                                 
              MOVE ZERO      TO WS-ASSET-PCT.                                   
                                                                                
           IF W-NSCC-AT-ASSET-AMT > SPACE                                       
              PERFORM 7013-REFORMAT-ASSET-AMT THRU 7013-EXIT                    
              MOVE W-QTY-N   TO WS-ASSET-AMT                                    
           ELSE                                                                 
              MOVE ZERO      TO WS-ASSET-AMT.                                   
                                                                                
LRM011*----------------------------------------------------------------*        
LRM011* FOR PTR ASSET, IF NSCC DOES NOT SUPPLY C/M/S, AND WE ALREADY            
LRM011* HAVE A VALUE FROM INTRA DAY, LEAVE ALONE, DONT BLANK IT OUT.            
LRM011*----------------------------------------------------------------*        
LRM011     IF (W-NSCC-AT-TFR-TYPE = 'PTR'                                       
LRM011     AND CSH-MGN-SHRT-CD  OF DCLVASSET  > SPACES                          
LRM011     AND W-NSCC-AT-CASH-MRGN-SHTCD NOT > SPACES)                          
LRM011            MOVE CSH-MGN-SHRT-CD  OF DCLVASSET TO                         
LRM011            W-NSCC-AT-CASH-MRGN-SHTCD                                     
LRM011******    DISPLAY 'PTR ASSET TYPE REMAINS AS C/M/S '                      
LRM011******            'CLT=' SV-CLIENT-NBR                                    
LRM011******           ' CTL=' W-NSCC-ACAT-CTL-NBR                              
LRM011******           ' TYPE= ' CSH-MGN-SHRT-CD  OF DCLVASSET                  
LRM011     ELSE                                                                 
           IF (CSH-MGN-SHRT-CD  OF DCLVASSET  NOT =                             
                W-NSCC-AT-CASH-MRGN-SHTCD)                                      
              IF (W-NSCC-AT-STL-LOC = '40')                                     
                  MOVE CSH-MGN-SHRT-CD  OF DCLVASSET TO                         
                  W-NSCC-AT-CASH-MRGN-SHTCD                                     
              ELSE                                                              
                 SET DIFFERENCE-FOUND TO TRUE                                   
              END-IF                                                            
           END-IF.                                                              
                                                                                
       7010-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  REFORMAT ASSET QTY - UP TO 4 DECIMAL PLACES                            
      *****************************************************************         
       7011-REFORMAT-ASSET-QTY.                                                 
                                                                                
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
LRM            DISPLAY 'WIPED GARBAGE QTY FOR '                                 
LRM                     'CLT=' SV-CLIENT-NBR                                    
LRM                    ' CTL=' W-NSCC-ACAT-CTL-NBR                              
LRM                    ' TFR=' W-NSCC-AT-TFR-TYPE                               
LRM                    ' STA=' W-NSCC-STATUS                                    
LRM                    ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                          
LRM                     ' VALUE ' W-NSCC-AT-ASSET-QTY                           
LRM        END-IF.                                                              
                                                                                
       7011-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  REFORMAT ASSET PCT - UP TO 4 DECIMAL PLACES                            
      *****************************************************************         
       7012-REFORMAT-ASSET-PCT.                                                 
                                                                                
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
                                                                                
       7012-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  REFORMAT ASSET AMT - UP TO 4 DECIMAL PLACES                            
      *                       IF ISO-CURR = USD  - UP TO 2 DECIMAL              
      *                       IF ISO-CURR = FCUR - UP TO 4 DECIMAL              
      *****************************************************************         
       7013-REFORMAT-ASSET-AMT.                                                 
                                                                                
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
LRM                     'CLT=' SV-CLIENT-NBR                                    
LRM                    ' CTL=' W-NSCC-ACAT-CTL-NBR                              
LRM                    ' TFR=' W-NSCC-AT-TFR-TYPE                               
LRM                    ' STA=' W-NSCC-STATUS                                    
LRM                    ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                          
LRM                     ' VALUE ' W-NSCC-AT-ASSET-AMT                           
LRM        END-IF.                                                              
                                                                                
       7013-EXIT. EXIT.                                                         
      /                                                                         
       7100-UPDATE-ASSET.                                                       
LRM010*****************************************************************         
LRM010*** THE FOLLOWING 5 LINES ADDED TO NOT WIPE OUT THE PTF RCVR SIDE         
LRM010*** QTY WHEN A FULL-PULL WAS REQUESTED. THI QTY WAS UPDATED BY            
LRM010*** CAT580 FROM THE FUNDSERV FILE.                                        
LRM010*****************************************************************         
LRM010     IF  W-NSCC-AT-TFR-TYPE = 'PTF'                                       
LRM010     AND W-NSCC-DIST-PARTICIPANT   = W-NSCC-TI-RCV-NBR                    
LRM010     AND ASSET-QTY OF DCLVASSET NOT = ZERO                                
LRM010     AND WS-ASSET-QTY = ZERO                                              
LRM010        DISPLAY 'BYPASS ASSET-QTY UPDATE ON PTF RCV '                     
LRM010           W-NSCC-AT-ACAT-CTL-NBR                                         
LRM010     ELSE                                                                 
              MOVE WS-ASSET-QTY  TO ASSET-QTY OF DCLVASSET                      
LRM010     END-IF.                                                              
                                                                                
           MOVE WS-ASSET-PCT  TO ASSET-PCT OF DCLVASSET.                        
           MOVE WS-ASSET-AMT  TO ASSET-AMT OF DCLVASSET.                        
           IF   W-NSCC-AT-STL-LOC-RSN-CD = 'NSET'                               
                MOVE 'XSET'          TO W-NSCC-AT-STL-LOC-RSN-CD                
                ADD 1 TO W-NSET-CNT                                             
           END-IF                                                               
                                                                                
           MOVE PSTN-CD OF DCLVASSET TO W-NSCC-AT-POS-CD                        
                                                                                
           IF  W-NSCC-AT-POS-CD = 'N'                                           
               MOVE 'L'              TO W-NSCC-AT-POS-CD                        
           END-IF                                                               
                                                                                
           IF  W-NSCC-AT-OPT-CATG > '00'                                        
               IF W-NSCC-ATO-OPT-BS-IND = 'B'                                   
                  MOVE 'S'           TO W-NSCC-AT-POS-CD                        
               ELSE                                                             
                  MOVE 'L'           TO W-NSCC-AT-POS-CD                        
               END-IF                                                           
           END-IF                                                               
                                                                                
DJ0007     IF (W-NSCC-AT-TFR-TYPE = 'FUL' OR 'PTD' OR 'PTR')                    
DJ0007        EVALUATE WS-TBL-ACAT-ASCENDIS-USER(SUB)                           
DJ0007           WHEN '1'   MOVE 'A' TO WS-NSCC-ACK-IND                         
DJ0007           WHEN '2'   MOVE 'P' TO WS-NSCC-ACK-IND                         
DJ0007           WHEN OTHER MOVE ' ' TO WS-NSCC-ACK-IND                         
DJ0007        END-EVALUATE                                                      
DJ0006     ELSE                                                                 
DJ0006         MOVE ' '              TO WS-NSCC-ACK-IND                         
DJ0006     END-IF.                                                              
                                                                                
DJ0010     IF W-NSCC-AT-DTC-SUB-ISSUE-TYPE = 'A'                                
DJ0010        MOVE 'Y'               TO WS-AUCTION-RT-IND                       
DJ0010        ADD 1 TO W-AUCTION-RATE-CNT                                       
DJ0010     ELSE                                                                 
DJ0010        MOVE 'N'               TO WS-AUCTION-RT-IND                       
DJ0010     END-IF                                                               
                                                                                
           EXEC SQL                                                             
              UPDATE VASSET                                                     
                 SET                                                            
                    ASSET_PRC_CTGY_CD   = :W-NSCC-AT-ASSET-PRC-CATG             
                   ,STTLM_LCTN_CD       = :W-NSCC-AT-STL-LOC                    
                   ,STTLM_RSN_CD        = :W-NSCC-AT-STL-LOC-RSN-CD             
                   ,ISIN_CNTRY_CD       = :W-NSCC-AT-SEC-CNTRY-CD               
                   ,ISIN_SEC_ISSUE_CD   = :W-NSCC-AT-SEC-ID                     
                   ,ISIN_SEC_CDG_CD     = :W-NSCC-AT-SEC-CHKDGT                 
                   ,ASSET_DESC_TXT      = :W-NSCC-AT-ASSET-DESC                 
                   ,ASSET_RQST_QTY_CD   = :W-NSCC-AT-ASSET-QTY-RQIND            
                   ,AST_RQST_TRANS_CD   = :W-NSCC-AT-ASSET-REQ-TRNCD            
                   ,ASSET_QTY           = :DCLVASSET.ASSET-QTY                  
                   ,ASSET_PCT           = :DCLVASSET.ASSET-PCT                  
TCKNEW             ,ASSET_AMT_STTS_CD   = :W-NSCC-VALUE-FREE-IND                
                   ,PSTN_CD             = :W-NSCC-AT-POS-CD                     
                   ,ISO_CRNCY_CD        = :W-NSCC-AT-ISO-CURCY-CD               
                   ,ASSET_AMT           = :DCLVASSET.ASSET-AMT                  
                   ,BEARER_BOND_CD      = :W-NSCC-AT-BEARER-BOND                
                   ,CSH_MGN_SHRT_CD     = :W-NSCC-AT-CASH-MRGN-SHTCD            
                   ,WHI_CD              = :W-NSCC-AT-WHN-ISS-IND                
                   ,TRNFR_TYPE_RSN_CD   = :W-NSCC-AT-TFR-TYPE-RSN               
                   ,MBS_SERIAL_NBR      = :W-NSCC-AT-MBS-SER-NT                 
                   ,ASSET_CMNT_TXT      = :W-NSCC-AT-ASSET-COMMENT              
                   ,TRANS_RFRN_ID_CD    = :W-NSCC-AT-TRAN-REF-ID                
                   ,OPTN_CTGY_CD        = :W-NSCC-AT-OPT-CATG                   
                   ,UPDT_TMSTP          = :W-CURRENT-TIMESTAMP                  
                   ,SECURITY_ADP_NBR    = :DCLVASSET.SECURITY-ADP-NBR           
                   ,PRGM_NM             = 'CAT710'                              
                   ,TRNFR_TYPE_CD       = :W-NSCC-AT-TFR-TYPE                   
DJ0006             ,NSCC_ACK_IND        = :WS-NSCC-ACK-IND                      
DJ0010             ,AUCTION_RT_IND      = :WS-AUCTION-RT-IND                    
                WHERE                                                           
                   CLIENT_NBR           = :DCLVASSET.CLIENT-NBR                 
                   AND ACAT_CONTROL_NBR = :DCLVASSET.ACAT-CONTROL-NBR           
                   AND ASSET_SEQ_NBR    = :DCLVASSET.ASSET-SEQ-NBR              
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
TCKNEW        IF W-NSCC-VALUE-FREE-IND = 'F'                                    
TCKNEW           ADD  1   TO  WS-VALUE-FREE-CNT                                 
TCKNEW        END-IF                                                            
           ELSE                                                                 
              DISPLAY 'DB2 UPDATE ERROR AT 7100-UPDATE-ASSET ROUTINE'           
              PERFORM 8500-SQL-ERROR-ROUTINE.                                   
       7100-EXIT. EXIT.                                                         
      /                                                                         
      *----------------------------------------------------------*              
      *          OPTION RECONCILIATION                                          
      *----------------------------------------------------------*              
       7200-RETRIEVE-OPTION.                                                    
           MOVE SPACE TO OPTION-FOUND-SW.                                       
           MOVE SV-CLIENT-NBR TO CLIENT-NBR OF DCLVOPTN.                        
           MOVE W-NSCC-AT-ACAT-CTL-NBR TO ACAT-CONTROL-NBR OF DCLVOPTN.         
           MOVE W-NSCC-AT-ASSET-SEQ-NBR TO ASSET-SEQ-NBR OF DCLVOPTN.           
                                                                                
           EXEC SQL                                                             
               SELECT                                                           
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
LRM013             ,STPRC_INTEGER2_AMT                                          
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
DJ0003             ,STPRC_DEC_FRCN_IND                                          
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
LRM013            ,:DCLVOPTN.STPRC-INTEGER2-AMT                                 
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
DJ0003            ,:DCLVOPTN.STPRC-DEC-FRCN-IND                                 
                 FROM                                                           
                    VOPTN                                                       
                WHERE                                                           
                    CLIENT_NBR = :DCLVOPTN.CLIENT-NBR                           
                    AND  ACAT_CONTROL_NBR = :DCLVOPTN.ACAT-CONTROL-NBR          
                    AND  ASSET_SEQ_NBR = :DCLVOPTN.ASSET-SEQ-NBR                
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              ADD 1 TO VOPTN-FND-CNT                                            
              SET OPTION-FOUND TO TRUE                                          
           ELSE                                                                 
              ADD 1 TO VOPTN-NOTFND-CNT                                         
           IF SQLCODE = +100                                                    
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY 'DB2 SELECT ERR AT 7200-RETRIEVE-OPTION ROUTINE'          
              PERFORM 8500-SQL-ERROR-ROUTINE.                                   
       7200-EXIT. EXIT.                                                         
      /                                                                         
       7210-CHECK-OPTION-DIFFERENCE.                                            
           MOVE SPACE TO DIFFERENCE-FOUND-SW.                                   
                                                                                
LRM013     MOVE W-NSCC-ATO-OPT-EXP-CC-NEW TO W-DATE-CC                          
LRM013     MOVE W-NSCC-ATO-OPT-EXP-YY-NEW TO W-DATE-YY                          
LRM013     MOVE W-NSCC-ATO-OPT-EXP-MM-NEW TO W-DATE-MM                          
LRM013     MOVE W-NSCC-ATO-OPT-EXP-DD-NEW TO W-DATE-DD                          
           IF  (W-DATE-MM             > '12' OR                                 
                W-DATE-MM             < '01')                                   
           OR  (W-DATE-CC             < '00')                                   
           OR  (W-DATE-CC             > '99')                                   
           OR  (W-DATE-YY             < '00')                                   
           OR  (W-DATE-YY             > '99')                                   
           OR  W-NSCC-ATO-OPT-EXP-DT-NEW NOT NUMERIC                            
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' SV-CLIENT-NBR,                                    
                          ' ' W-NSCC-ACAT-CTL-NBR                               
                      ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                           
                      ' OPT=' W-NSCC-ATO-OPT-SYM                                
                      ' BAD DATE W-NSCC-ATO-OPT-EXP-DT = '                      
                                 W-NSCC-ATO-OPT-EXP-DT-NEW                      
                 MOVE  '0001'             TO  WK-DT-1                           
                 MOVE  '01'               TO  WK-DT-2                           
                 MOVE  '01'               TO  WK-DT-3                           
           ELSE                                                                 
               MOVE W-DATE TO  WK-FMT-DATE                                      
           END-IF.                                                              
                                                                                
           IF W-NSCC-ATO-OPT-STKPRC-INT-NEW NUMERIC                             
              MOVE W-NSCC-ATO-OPT-STKPRC-INT-NEW                                
                        TO WS-STRIKE-PRICE-INT-N                                
           ELSE                                                                 
              MOVE ZERO TO WS-STRIKE-PRICE-INT-N.                               
                                                                                
LRM013     MOVE W-NSCC-ATO-OPT-STKPRC-FRC-NEW                                   
LRM013          TO WS-STRIKE-PRICE-FRC-NEW.                                     
                                                                                
       7210-EXIT. EXIT.                                                         
      /                                                                         
       7300-UPDATE-OPTION.                                                      
           MOVE WK-FMT-DATE TO EXPTN-DT OF DCLVOPTN.                            
           MOVE WS-STRIKE-PRICE-INT-N TO STPRC-INTEGER-AMT OF DCLVOPTN          
LRM013                                   STPRC-INTEGER2-AMT OF DCLVOPTN.        
LRM013     MOVE WS-STRIKE-PRICE-FRC-NEW-N                                       
LRM013                                TO STPRC-FRCTN-AMT   OF DCLVOPTN.         
                                                                                
           EXEC SQL                                                             
              UPDATE VOPTN                                                      
                 SET                                                            
                     BS_CD              = :W-NSCC-ATO-OPT-BS-IND                
                    ,PTCL_CD            = :W-NSCC-ATO-OPT-PC-IND                
                    ,OPTN_OPN_CLSD_CD   = :W-NSCC-ATO-OPT-OC-IND                
                    ,SYM_CD             = :W-NSCC-ATO-OPT-SYM                   
                    ,EXPTN_DT           = :DCLVOPTN.EXPTN-DT                    
                    ,STPRC_INTEGER_AMT  = :DCLVOPTN.STPRC-INTEGER-AMT           
LRM013              ,STPRC_INTEGER2_AMT = :DCLVOPTN.STPRC-INTEGER2-AMT          
                    ,STPRC_FRCTN_AMT    = :DCLVOPTN.STPRC-FRCTN-AMT             
                    ,DLVR_OCC_NBR       = :W-NSCC-ATO-OPT-OCC-DEL-NBR           
                    ,OPTN_ACCT_TYPE_CD  = :W-NSCC-ATO-OPT-ACCT-TYP              
                    ,ACCT_SUB_CD        = :W-NSCC-ATO-SUB-ACCT-ID               
                    ,OPTN_CMNT_TXT      = :W-NSCC-ATO-OPT-COMMENT               
                    ,UPDT_TMSTP         = :W-CURRENT-TIMESTAMP                  
                    ,PRGM_NM            = 'CAT710'                              
DJ0003              ,STPRC_DEC_FRCN_IND = 'D'                                   
                WHERE                                                           
                   CLIENT_NBR           = :DCLVOPTN.CLIENT-NBR                  
                   AND ACAT_CONTROL_NBR = :DCLVOPTN.ACAT-CONTROL-NBR            
                   AND ASSET_SEQ_NBR    = :DCLVOPTN.ASSET-SEQ-NBR               
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY 'DB2 UPDATE ERROR AT 7300-UPDATE-OPTION ROUTINE'          
              PERFORM 8500-SQL-ERROR-ROUTINE.                                   
       7300-EXIT. EXIT.                                                         
      /                                                                         
       7400-RETRIEVE-MUTUAL.                                                    
           MOVE SPACE TO MUTUAL-FUND-FOUND-SW                                   
           MOVE W-NSCC-AT-ASSET-SEQ-NBR TO ASSET-SEQ-NBR OF DCLVMF.             
           MOVE SV-CLIENT-NBR TO CLIENT-NBR OF DCLVMF.                          
           MOVE W-NSCC-AT-ACAT-CTL-NBR TO ACAT-CONTROL-NBR OF DCLVMF.           
           MOVE W-NSCC-AT-ASSET-SEQ-NBR TO ASSET-SEQ-NBR OF DCLVMF.             
                                                                                
           EXEC SQL                                                             
               SELECT                                                           
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
DJ0003            ,FCST_RCVR_STTS_CD                                            
DJ0003            ,FCST_ACCT_RCVR_NBR                                           
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
DJ0003            ,:DCLVMF.FCST-RCVR-STTS-CD                                    
DJ0003            ,:DCLVMF.FCST-ACCT-RCVR-NBR                                   
                FROM                                                            
                    VMF                                                         
                WHERE                                                           
                    CLIENT_NBR = :DCLVMF.CLIENT-NBR                             
                    AND  ACAT_CONTROL_NBR = :DCLVMF.ACAT-CONTROL-NBR            
                    AND  ASSET_SEQ_NBR = :DCLVMF.ASSET-SEQ-NBR                  
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              ADD 1 TO VMF-FND-CNT                                              
              SET MUTUAL-FUND-FOUND TO TRUE                                     
           ELSE                                                                 
              ADD 1 TO VMF-NOTFND-CNT                                           
           IF SQLCODE = +100                                                    
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY 'DB2 SELECT ERROR AT 7400-RETRIEVE-MUTUAL ROUTINE'        
              PERFORM 8500-SQL-ERROR-ROUTINE.                                   
       7400-EXIT. EXIT.                                                         
      /                                                                         
       7410-CHECK-MUTUAL-DIFFERENCE.                                            
           MOVE SPACE TO DIFFERENCE-FOUND-SW.                                   
                                                                                
           IF   W-NSCC-ATF-DIV-CD = '0' OR '2' OR '3' OR '4'                    
                MOVE 'C'             TO DVDND-CD           OF DCLVMF            
           ELSE                                                                 
                MOVE 'R'             TO DVDND-CD           OF DCLVMF            
           END-IF                                                               
           IF   W-NSCC-ATF-DIV-CD = '0' OR '2' OR '5' OR '7'                    
                MOVE 'C'             TO LTCG-CD            OF DCLVMF            
           ELSE                                                                 
                MOVE 'R'             TO LTCG-CD            OF DCLVMF            
           END-IF                                                               
           IF   W-NSCC-ATF-DIV-CD = '0' OR '4' OR '5' OR '6'                    
                MOVE 'C'             TO STCG-CD            OF DCLVMF            
           ELSE                                                                 
                MOVE 'R'             TO STCG-CD            OF DCLVMF            
           END-IF.                                                              
                                                                                
       7410-EXIT. EXIT.                                                         
      /                                                                         
       7500-UPDATE-MUTUAL.                                                      
                                                                                
           EXEC SQL                                                             
              UPDATE VMF                                                        
                 SET                                                            
                    BK_PHSCL_SHR_CD   = :W-NSCC-ATF-PHSCL-SHR-IND               
                   ,NTWRK_CNTL_CD     = :W-NSCC-ATF-NTWRK-CTL-IND               
                   ,ACCT_TYPE_CD      = :W-NSCC-ATF-ACCT-TYP-IND                
                   ,DVDND_CD          = :DCLVMF.DVDND-CD                        
                   ,LTCG_CD           = :DCLVMF.LTCG-CD                         
                   ,STCG_CD           = :DCLVMF.STCG-CD                         
                   ,DVDND_PAYEE_CD    = :W-NSCC-ATF-DIV-PAYEE-IND               
                   ,BRKR_EXCTG_NBR    = :W-NSCC-ATF-EXEC-BRKR                   
                   ,MF_FULL_PRTL_CD   = :W-NSCC-ATF-FULL-PART-IND               
                   ,FNBR              = :W-NSCC-ATF-CUS-ACCT                    
                   ,UPDT_TMSTP        = :W-CURRENT-TIMESTAMP                    
                   ,PRGM_NM           = 'CAT710'                                
DJ0003             ,FCST_ACCT_RCVR_NBR = :W-NSCC-ATF-FUND-AC-NBR-RCV            
                WHERE                                                           
                   CLIENT_NBR           = :DCLVMF.CLIENT-NBR                    
                   AND ACAT_CONTROL_NBR = :DCLVMF.ACAT-CONTROL-NBR              
                   AND ASSET_SEQ_NBR    = :DCLVMF.ASSET-SEQ-NBR                 
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = 0                                                       
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY 'DB2 UPDATE ERR AT 7500-UPDATE-MUTUAL ROUTINE'            
              PERFORM 8500-SQL-ERROR-ROUTINE.                                   
       7500-EXIT. EXIT.                                                         
      /                                                                         
       7600-INSERT-VTRNFR.                                                      
           MOVE '7600-INSERT-VTRNFR     ' TO W-ROUTINE.                         
                                                                                
           MOVE ' '                  TO DCLVTRNFR                               
           MOVE SV-CLIENT-NBR        TO CLIENT-NBR         OF DCLVTRNFR         
                                                                                
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR                      
               MOVE 'D'              TO DSTBN-SIDE-CD      OF DCLVTRNFR         
           ELSE                                                                 
               MOVE 'R'              TO DSTBN-SIDE-CD      OF DCLVTRNFR         
           END-IF                                                               
                                                                                
           MOVE W-NSCC-ACAT-CTL-NBR  TO ACAT-CONTROL-NBR   OF DCLVTRNFR         
                                                                                
           MOVE W-NSCC-PROC-YEAR     TO W-DATE-YEAR                             
           MOVE W-NSCC-PROC-MM       TO W-DATE-MM                               
           MOVE W-NSCC-PROC-DD       TO W-DATE-DD                               
           IF  (W-DATE-MM             > '12' OR                                 
                W-DATE-MM             < '01')                                   
           OR  (W-DATE-DD             > '31' OR                                 
                W-DATE-DD             < '01')                                   
           OR  (W-DATE-YEAR           < '0001')                                 
                DISPLAY 'INP=' W-INFILE-CNT                                     
                       ' CLT=' SV-CLIENT-NBR                                    
                       ' CTL=' W-NSCC-ACAT-CTL-NBR                              
                       ' W-NSCC-PROC-DATE INVALID: '                            
                         W-NSCC-PROC-DATE                                       
                      '  DEFAULT TO 0001-01-01'                                 
                MOVE '00'                   TO W-DATE-CC                        
                MOVE '01'                   TO W-DATE-YY                        
                MOVE '01'                   TO W-DATE-MM                        
                MOVE '01'                   TO W-DATE-DD                        
           END-IF                                                               
                                                                                
           MOVE W-DATE               TO PRCS-DT            OF DCLVTRNFR         
                                                                                
           MOVE '00'                 TO CYCLE-CD           OF DCLVTRNFR         
           MOVE '0'                  TO SYS-ACT-CD         OF DCLVTRNFR         
           MOVE '  '                 TO SYS-RJCT-RSN-CD    OF DCLVTRNFR         
           MOVE W-NSCC-STATUS        TO STTS-CD            OF DCLVTRNFR         
           MOVE W-NSCC-DAYS-IN-STATUS                                           
                                     TO DAYS-STTS-QTY      OF DCLVTRNFR         
           MOVE 01                   TO PHSCL-SEQ-NBR      OF DCLVTRNFR         
           MOVE 01                   TO LGCL-SEQ-NBR       OF DCLVTRNFR         
           MOVE 'A'                  TO TRANS-TYPE-CD      OF DCLVTRNFR         
           MOVE W-NSCC-TI-TFR-TYPE   TO TRNFR-TYPE-CD      OF DCLVTRNFR         
           MOVE W-NSCC-DIST-PARTICIPANT                                         
                                     TO SBMTG-PRTCP-NBR    OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-NBR    TO RCV-NBR            OF DCLVTRNFR         
           MOVE W-NSCC-TI-DEL-NBR    TO DLVR-NBR           OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-ACCT-NBR                                          
                                     TO ACCT-RCV-NBR       OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-CUST-NAME                                         
                                     TO RCV-CUST-NM        OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-SSN-PRM                                           
                                     TO RCV-SS-PRIM-NBR    OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-SSN-SEC                                           
                                     TO RCV-SS-SCNDY-NBR   OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-ACCT-TYPE                                         
                                     TO RCV-ACCT-TYPE-CD   OF DCLVTRNFR         
DJ0005     MOVE W-NSCC-TI-GIFT-IND                                              
DJ0005                               TO GIFT-IND           OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-OCC-BRKR                                          
                                     TO RCV-OCC-BRKR-NBR   OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-CRSPN-NBR                                         
                                     TO RCV-CRSPN-NBR      OF DCLVTRNFR         
           MOVE ' '                  TO PRTCP-CONTRA-CD    OF DCLVTRNFR         
           MOVE W-NSCC-TI-DEL-ACCT-NBR                                          
                                     TO ACCT-DLVR-NBR      OF DCLVTRNFR         
           MOVE W-NSCC-TI-TFR-TYPE-REJ                                          
                                     TO TRNFR-TYPE-RJCT-CD OF DCLVTRNFR         
           MOVE W-NSCC-TI-ASSC-CTL-NBR                                          
                                     TO ACAT-CNTL-ASTD-NBR OF DCLVTRNFR         
                                                                                
           IF   W-NSCC-TI-ASSC-STL-DT > ' '                                     
                MOVE W-NSCC-TI-ASSC-STL-YEAR TO W-DATE-YEAR                     
                MOVE W-NSCC-TI-ASSC-STL-MM   TO W-DATE-MM                       
                MOVE W-NSCC-TI-ASSC-STL-DD   TO W-DATE-DD                       
           ELSE                                                                 
                MOVE '0001'                  TO W-DATE-YEAR                     
                MOVE '01'                    TO W-DATE-MM                       
                MOVE '01'                    TO W-DATE-DD                       
           END-IF                                                               
           IF  (W-DATE-MM             > '12' OR                                 
                W-DATE-MM             < '01')                                   
           OR  (W-DATE-DD             > '31' OR                                 
                W-DATE-DD             < '01')                                   
           OR  (W-DATE-YEAR           < '0001')                                 
                DISPLAY 'INP=' W-INFILE-CNT                                     
                       ' CLT=' SV-CLIENT-NBR                                    
                       ' CTL=' W-NSCC-ACAT-CTL-NBR                              
                       ' W-NSCC-TI-ASSC-STL-DT INVALID: '                       
                         W-NSCC-TI-ASSC-STL-DT                                  
                      '  DEFAULT TO 0001-01-01'                                 
                MOVE '00'                   TO W-DATE-CC                        
                MOVE '01'                   TO W-DATE-YY                        
                MOVE '01'                   TO W-DATE-MM                        
                MOVE '01'                   TO W-DATE-DD                        
           END-IF                                                               
           MOVE W-DATE               TO STTLM-ASCTD-DT     OF DCLVTRNFR         
                                                                                
           MOVE W-NSCC-TI-TRAN-REF-ID                                           
                                     TO TRANS-RFRN-ID-CD   OF DCLVTRNFR         
                                                                                
           MOVE W-NSCC-TI-COMMENTS   TO CMNT-TXT           OF DCLVTRNFR         
                                                                                
           MOVE 'CAT710'             TO PRGM-NM            OF DCLVTRNFR         
           MOVE ' '                  TO CICS-TERM-ID-CD    OF DCLVTRNFR         
           MOVE W-CURRENT-TIMESTAMP  TO CRT-TMSTP          OF DCLVTRNFR         
           MOVE W-CURRENT-TIMESTAMP  TO UPDT-TMSTP         OF DCLVTRNFR         
DJ0006     MOVE WS-NSCC-ACK-IND      TO NSCC-ACK-IND       OF DCLVTRNFR         
           MOVE ' '                  TO NSCC-PEND-CD       OF DCLVTRNFR         
           MOVE ' '                  TO TRNFR-TYPE-RJC1-CD OF DCLVTRNFR         
           MOVE ' '                  TO TRNFR-TYPE-RJC2-CD OF DCLVTRNFR         
           MOVE ' '                  TO BRANCH-CD          OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-CD            OF DCLVTRNFR         
           MOVE ' '                  TO RR-CD              OF DCLVTRNFR         
           MOVE ' '                  TO ACM-HOLDER-NAA-CD  OF DCLVTRNFR         
           MOVE ' '                  TO CASH-SWEEP-NAA-CD  OF DCLVTRNFR         
           MOVE ' '                  TO DVDND-NAA-CD       OF DCLVTRNFR         
           MOVE ' '                  TO SELL-INSTN-NAA-CD  OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-TIN-MSMTH-IND OF DCLVTRNFR         
           MOVE ' '                  TO DB-CR-CD           OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-ACTIVITY-IND  OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-AST-EXCS-IND  OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-BRKR-TIF-IND  OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-CUST-70-IND   OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-DB-BAL-T1-IND OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-DLRV-PRGR-IND OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-DPLCT-TRN-IND OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-LTD-PRTNR-IND OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-MNGD-IND      OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-MRGN-DB-IND   OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-NA-UPDT-IND   OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-OPTN-PSTN-IND OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-ORDERS-IND    OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-PRVT-RNG-IND  OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-QULFD-PLN-IND OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-RJCT-RSBM-IND OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-SEC-RSTRD-IND OF DCLVTRNFR         
           MOVE ' '                  TO ACCT-SHRT-PSTN-IND OF DCLVTRNFR         
           MOVE 0                    TO ACCT-EQUITY-AMT    OF DCLVTRNFR         
           MOVE 0                    TO ACCT-IRA-MAINT-AMT OF DCLVTRNFR         
           MOVE 0                    TO ACCT-IRA-TRMNT-AMT OF DCLVTRNFR         
           MOVE 0                    TO ACCT-TRNFR-FEE-AMT OF DCLVTRNFR         
           MOVE '0001-01-01'         TO STTLM-DT           OF DCLVTRNFR         
           MOVE ' '                  TO STTLM-TM-CD        OF DCLVTRNFR         
           MOVE 'V'                  TO VAL-FREE-CD        OF DCLVTRNFR         
                                                                                
           MOVE ' '                  TO NSCC-NON-ADP-IND   OF DCLVTRNFR         
                                                                                
           IF  W-NSCC-DIST-PARTICIPANT   = W-NSCC-TI-RCV-NBR                    
               MOVE W-NSCC-TI-RCV-ACCT-NBR(1:3)                                 
                                              TO BRANCH-CD OF DCLVTRNFR         
               MOVE W-NSCC-TI-RCV-ACCT-NBR(4:5)                                 
                                              TO ACCT-CD   OF DCLVTRNFR         
           ELSE                                                                 
               MOVE W-NSCC-TI-DEL-ACCT-NBR(1:3)                                 
                                              TO BRANCH-CD OF DCLVTRNFR         
               MOVE W-NSCC-TI-DEL-ACCT-NBR(4:5)                                 
                                              TO ACCT-CD   OF DCLVTRNFR         
           END-IF                                                               
                                                                                
DJ0007     IF (WS-TRNFR-TYPE-CD = 'FUL' OR 'PTD' OR 'PTR')                      
DJ0007        EVALUATE WS-TBL-ACAT-ASCENDIS-USER(SUB)                           
DJ0007           WHEN '1'   MOVE 'A' TO NSCC-ACK-IND OF DCLVTRNFR               
DJ0007           WHEN '2'   MOVE 'P' TO NSCC-ACK-IND OF DCLVTRNFR               
DJ0007           WHEN OTHER MOVE ' ' TO NSCC-ACK-IND OF DCLVTRNFR               
DJ0007        END-EVALUATE                                                      
DJ0006     ELSE                                                                 
DJ0006         MOVE ' '              TO NSCC-ACK-IND OF DCLVTRNFR               
DJ0006     END-IF.                                                              
                                                                                
           EXEC SQL                                                             
               INSERT INTO VTRNFR                                               
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
                  ,TRNFR_TYPE_RJC1_CD                                           
                  ,TRNFR_TYPE_RJC2_CD                                           
                  ,UPDT_TMSTP                                                   
                  ,ACCT_ACTIVITY_IND                                            
                  ,ACCT_AST_EXCS_IND                                            
                  ,ACCT_BRKR_TIF_IND                                            
                  ,ACCT_CD                                                      
                  ,ACCT_CUST_70_IND                                             
                  ,ACCT_DB_BAL_T1_IND                                           
                  ,ACCT_DLRV_PRGR_IND                                           
                  ,ACCT_DPLCT_TRN_IND                                           
                  ,ACCT_EQUITY_AMT                                              
                  ,ACCT_IRA_MAINT_AMT                                           
                  ,ACCT_IRA_TRMNT_AMT                                           
                  ,ACCT_LTD_PRTNR_IND                                           
                  ,ACCT_MNGD_IND                                                
                  ,ACCT_MRGN_DB_IND                                             
                  ,ACCT_NA_UPDT_IND                                             
                  ,ACCT_OPTN_PSTN_IND                                           
                  ,ACCT_ORDERS_IND                                              
                  ,ACCT_PRVT_RNG_IND                                            
                  ,ACCT_QULFD_PLN_IND                                           
                  ,ACCT_RJCT_RSBM_IND                                           
                  ,ACCT_SEC_RSTRD_IND                                           
                  ,ACCT_SHRT_PSTN_IND                                           
                  ,ACCT_TIN_MSMTH_IND                                           
                  ,ACCT_TRNFR_FEE_AMT                                           
                  ,ACM_HOLDER_NAA_CD                                            
                  ,BRANCH_CD                                                    
                  ,CASH_SWEEP_NAA_CD                                            
                  ,DVDND_NAA_CD                                                 
                  ,NSCC_NON_ADP_IND                                             
                  ,RR_CD                                                        
                  ,SELL_INSTN_NAA_CD                                            
                  ,STTLM_DT                                                     
                  ,STTLM_TM_CD                                                  
                  ,VAL_FREE_CD                                                  
DJ0005            ,GIFT_IND                                                     
                 )                                                              
                 VALUES                                                         
                 (                                                              
                   :DCLVTRNFR.CLIENT-NBR                                        
                  ,:DCLVTRNFR.DSTBN-SIDE-CD                                     
                  ,:DCLVTRNFR.ACAT-CONTROL-NBR                                  
                  ,:DCLVTRNFR.PRCS-DT                                           
                  ,:DCLVTRNFR.CYCLE-CD                                          
                  ,:DCLVTRNFR.SYS-ACT-CD                                        
                  ,:DCLVTRNFR.SYS-RJCT-RSN-CD                                   
                  ,:DCLVTRNFR.STTS-CD                                           
                  ,:DCLVTRNFR.DAYS-STTS-QTY                                     
                  ,:DCLVTRNFR.RCRD-STTS-CD                                      
                  ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                                
                  ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                                 
                  ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                                
                  ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                                
                  ,:DCLVTRNFR.CONTROL-NBR-STS-CD                                
                  ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                                
                  ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                                
                  ,:DCLVTRNFR.RCV-NBR-STTS-CD                                   
                  ,:DCLVTRNFR.DLVR-NBR-STTS-CD                                  
                  ,:DCLVTRNFR.ACCT-RCV-STTS-CD                                  
                  ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                                
                  ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                                
                  ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                                
                  ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                                
                  ,:DCLVTRNFR.RCV-OCC-STTS-CD                                   
                  ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                                 
                  ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                                 
                  ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                                
                  ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                                 
                  ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                                
                  ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                                
                  ,:DCLVTRNFR.CMNT-STTS-CD                                      
                  ,:DCLVTRNFR.PHSCL-SEQ-NBR                                     
                  ,:DCLVTRNFR.LGCL-SEQ-NBR                                      
                  ,:DCLVTRNFR.TRANS-TYPE-CD                                     
                  ,:DCLVTRNFR.TRNFR-TYPE-CD                                     
                  ,:DCLVTRNFR.SBMTG-PRTCP-NBR                                   
                  ,:DCLVTRNFR.RCV-NBR                                           
                  ,:DCLVTRNFR.DLVR-NBR                                          
                  ,:DCLVTRNFR.ACCT-RCV-NBR                                      
                  ,:DCLVTRNFR.RCV-CUST-NM                                       
                  ,:DCLVTRNFR.RCV-SS-PRIM-NBR                                   
                  ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                                  
                  ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                                  
                  ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                                  
                  ,:DCLVTRNFR.RCV-CRSPN-NBR                                     
                  ,:DCLVTRNFR.PRTCP-CONTRA-CD                                   
                  ,:DCLVTRNFR.ACCT-DLVR-NBR                                     
                  ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                                
                  ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                                
                  ,:DCLVTRNFR.STTLM-ASCTD-DT                                    
                  ,:DCLVTRNFR.TRANS-RFRN-ID-CD                                  
                  ,:DCLVTRNFR.CMNT-TXT                                          
                  ,:DCLVTRNFR.CICS-TERM-ID-CD                                   
                  ,:DCLVTRNFR.CRT-TMSTP                                         
                  ,:DCLVTRNFR.DB-CR-CD                                          
                  ,:DCLVTRNFR.NSCC-ACK-IND                                      
                  ,:DCLVTRNFR.NSCC-PEND-CD                                      
                  ,:DCLVTRNFR.PRGM-NM                                           
                  ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                                
                  ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                                
                  ,:DCLVTRNFR.UPDT-TMSTP                                        
                  ,:DCLVTRNFR.ACCT-ACTIVITY-IND                                 
                  ,:DCLVTRNFR.ACCT-AST-EXCS-IND                                 
                  ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                                 
                  ,:DCLVTRNFR.ACCT-CD                                           
                  ,:DCLVTRNFR.ACCT-CUST-70-IND                                  
                  ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                                
                  ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                                
                  ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                                
                  ,:DCLVTRNFR.ACCT-EQUITY-AMT                                   
                  ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                                
                  ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                                
                  ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                                
                  ,:DCLVTRNFR.ACCT-MNGD-IND                                     
                  ,:DCLVTRNFR.ACCT-MRGN-DB-IND                                  
                  ,:DCLVTRNFR.ACCT-NA-UPDT-IND                                  
                  ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                                
                  ,:DCLVTRNFR.ACCT-ORDERS-IND                                   
                  ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                                 
                  ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                                
                  ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                                
                  ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                                
                  ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                                
                  ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                                
                  ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                                
                  ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                                 
                  ,:DCLVTRNFR.BRANCH-CD                                         
                  ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                                 
                  ,:DCLVTRNFR.DVDND-NAA-CD                                      
                  ,:DCLVTRNFR.NSCC-NON-ADP-IND                                  
                  ,:DCLVTRNFR.RR-CD                                             
                  ,:DCLVTRNFR.SELL-INSTN-NAA-CD                                 
                  ,:DCLVTRNFR.STTLM-DT                                          
                  ,:DCLVTRNFR.STTLM-TM-CD                                       
                  ,:DCLVTRNFR.VAL-FREE-CD                                       
DJ0005            ,:DCLVTRNFR.GIFT-IND                                          
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'VTRNFR  '               TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE.                      
                                                                                
           IF  SQLCODE = 0                                                      
               ADD 1 TO W-VTRNFR-INSERTED-CNT                                   
                  MOVE W-NSCC-ACAT-CTL-NBR TO SV-ACAT-CNTL-NBR                  
                  MOVE SV-CLIENT-NBR       TO WS-RECONCILED-TIF-CLT             
                  MOVE SV-ACAT-CNTL-NBR    TO WS-RECONCILED-TIF-ACAT            
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-INSERTED-CNT                               
               DISPLAY 'VTRNFR NOT INSERTED.'                                   
                      ' CLT=' SV-CLIENT-NBR,                                    
                      ' CTL=' SV-ACAT-CNTL-NBR                                  
                      ' SQL=' W-DB2-SQLCODE                                     
           END-IF.                                                              
                                                                                
       7600-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       7610-INSERT-VASSET.                                                      
           MOVE '7610-INSERT-VASSET     ' TO W-ROUTINE.                         
                                                                                
           INITIALIZE DCLVASSET                                                 
                                                                                
DJ0009     IF WS-ASSET-QTY NOT = 0                                              
              PERFORM 7680-GET-ADP-NO THRU 7680-EXIT                            
DJ0009     END-IF                                                               
                                                                                
           MOVE SV-CLIENT-NBR                                                   
                                     TO CLIENT-NBR         OF DCLVASSET         
           MOVE W-NSCC-ACAT-CTL-NBR                                             
                                     TO ACAT-CONTROL-NBR   OF DCLVASSET         
           MOVE W-NSCC-AT-ASSET-SEQ-NBR                                         
                                     TO ASSET-SEQ-NBR      OF DCLVASSET         
           MOVE 01                                                              
                                     TO PHSCL-SEQ-NBR      OF DCLVASSET         
           MOVE 01                                                              
                                     TO LGCL-SEQ-NBR       OF DCLVASSET         
?          MOVE 'A'                                                             
                                     TO TRANS-TYPE-CD      OF DCLVASSET         
           MOVE W-NSCC-AT-TFR-TYPE                                              
                                     TO TRNFR-TYPE-CD      OF DCLVASSET         
           MOVE W-NSCC-DIST-PARTICIPANT                                         
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
                ADD 1 TO W-NSET-CNT                                             
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
                                                                                
           MOVE WS-ASSET-QTY         TO ASSET-QTY          OF DCLVASSET.        
           MOVE WS-ASSET-PCT         TO ASSET-PCT          OF DCLVASSET.        
                                                                                
TCKNEW     MOVE W-NSCC-VALUE-FREE-IND TO ASSET-AMT-STTS-CD OF DCLVASSET.        
TCKNEW     IF W-NSCC-VALUE-FREE-IND = 'F'                                       
TCKNEW        ADD 1   TO WS-VALUE-FREE-CNT                                      
TCKNEW     END-IF.                                                              
                                                                                
           IF  W-NSCC-AT-OPT-CATG > '00'                                        
               IF W-NSCC-ATO-OPT-BS-IND = 'B'                                   
                  MOVE 'S'           TO W-NSCC-AT-POS-CD                        
               ELSE                                                             
                  MOVE 'L'           TO W-NSCC-AT-POS-CD                        
               END-IF                                                           
           END-IF                                                               
                                                                                
           MOVE W-NSCC-AT-POS-CD                                                
                                     TO PSTN-CD            OF DCLVASSET         
           MOVE W-NSCC-AT-ISO-CURCY-CD                                          
                                     TO ISO-CRNCY-CD       OF DCLVASSET         
                                                                                
           MOVE WS-ASSET-AMT         TO ASSET-AMT          OF DCLVASSET.        
                                                                                
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
           MOVE W-NSCC-AT-ASSET-COMMENT                                         
                                     TO ASSET-CMNT-TXT     OF DCLVASSET         
DJ0010     IF W-NSCC-AT-DTC-SUB-ISSUE-TYPE = 'A'                                
DJ0010        MOVE 'Y'               TO AUCTION-RT-IND     OF DCLVASSET         
DJ0010        ADD 1 TO W-AUCTION-RATE-CNT                                       
DJ0010     ELSE                                                                 
DJ0010        MOVE 'N'               TO AUCTION-RT-IND     OF DCLVASSET         
DJ0010     END-IF                                                               
           MOVE 'CAT710'             TO PRGM-NM            OF DCLVASSET         
           MOVE ' '                  TO CICS-TERM-ID-CD    OF DCLVASSET         
           MOVE W-CURRENT-TIMESTAMP  TO CRT-TMSTP          OF DCLVASSET         
           MOVE W-CURRENT-TIMESTAMP  TO UPDT-TMSTP         OF DCLVASSET         
           MOVE ' '                  TO NSCC-PEND-CD       OF DCLVASSET         
DJ0007     IF (W-NSCC-AT-TFR-TYPE = 'FUL' OR 'PTD' OR 'PTR')                    
DJ0007        EVALUATE WS-TBL-ACAT-ASCENDIS-USER(SUB)                           
DJ0007           WHEN '1'   MOVE 'A' TO NSCC-ACK-IND       OF DCLVASSET         
DJ0007           WHEN '2'   MOVE 'P' TO NSCC-ACK-IND       OF DCLVASSET         
DJ0007           WHEN OTHER MOVE ' ' TO NSCC-ACK-IND       OF DCLVASSET         
DJ0007        END-EVALUATE                                                      
DJ0006     ELSE                                                                 
DJ0006         MOVE ' '              TO NSCC-ACK-IND       OF DCLVASSET         
DJ0006     END-IF.                                                              
                                                                                
           MOVE ' '                  TO NSCC-NON-ADP-IND   OF DCLVASSET         
                                                                                
           MOVE ' '                  TO RCL-SENT-NSCC-IND  OF DCLVASSET         
           MOVE ' '                  TO FAIL-OPEN-CAGE-IND OF DCLVASSET         
           MOVE ' '                  TO FAIL-SENT-CAGE-IND OF DCLVASSET         
           MOVE ' '                  TO FRV-SENT-NSCC-IND  OF DCLVASSET         
           MOVE 'N'                  TO ISIN-SEC-EXCPT-IND OF DCLVASSET         
                                                                                
LRM021     IF W-NSCC-AT-ASSET-COMMENT(1:18)  =  'ORIGINAL CURRENCY '            
LRM021     AND W-NSCC-AT-ASSET-COMMENT(19:3) NUMERIC                            
LRM021        MOVE W-NSCC-AT-ASSET-COMMENT(19:3)                                
LRM021                               TO CRNCY-CD           OF DCLVASSET         
LRM022        ELSE                                                              
LRM022        IF W-NSCC-AT-ISO-CURCY-CD NOT = 'USD' AND SPACES                  
LRM022           MOVE SPACES TO CURLOOK-DATA                                    
LRM022           MOVE W-NSCC-AT-ISO-CURCY-CD  TO CU-ARGUMENT-X                  
LRM022           MOVE 'DTC CODE REQUESTED' TO CU-DTC-CD                         
LRM022           CALL CURLOOK USING CURLOOK-DATA                                
LRM022           IF CU-RETURN NOT = SPACE                                       
LRM022              DISPLAY 'UNKNOWN ISO CURRENCY IN 5100- FCURR  DLVY '        
LRM022                'BAL - CURRENCY ' W-NSCC-AT-ISO-CURCY-CD                  
LRM022           ELSE                                                           
LRM022              MOVE CU-NUMBER  TO CRNCY-CD OF DCLVASSET                    
LRM021     END-IF.                                                              
CSG002* IN SOME CASES MSD DESCRIPTIONS CONTAIN SPECIAL CHARACTERS.              
CSG002* CORRECT THEM BY REPLACING SPECIAL CHARACTERS WITH SPACES.               
CSG002     MOVE ASSET-DESC-TXT OF DCLVASSET TO W-ASSET-DESC-TXT                 
CSG002     PERFORM 7640-EDIT-ASSET-DESC-TXT THRU 7640-EXIT                      
CSG002     MOVE W-ASSET-DESC-TXT TO ASSET-DESC-TXT OF DCLVASSET                 
                                                                                
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
DJ0010            ,AUCTION_RT_IND                                               
LRM021            ,CRNCY_CD                                                     
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
DJ0010            ,:DCLVASSET.AUCTION-RT-IND                                    
LRM021            ,:DCLVASSET.CRNCY-CD                                          
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'VASSET  '               TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE.                      
           IF  SQLCODE = 0                                                      
               ADD 1 TO W-VASSET-INSERTED-CNT                                   
               IF W-NSCC-AT-OPT-CATG > '00'                                     
                  PERFORM 7620-INSERT-VOPTN THRU 7620-EXIT                      
               ELSE                                                             
                  IF W-NSCC-AT-STL-LOC = '10'                                   
                     PERFORM 7630-INSERT-VMF THRU 7630-EXIT                     
                  END-IF                                                        
               END-IF                                                           
           ELSE                                                                 
               ADD 1 TO W-VASSET-NOT-INSERTED-CNT                               
               DISPLAY 'ASSET NOT INSERTED.'                                    
                      ' CLT=' SV-CLIENT-NBR,                                    
                      ' CTL=' SV-ACAT-CNTL-NBR                                  
                      ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                           
                      ' SQL=' W-DB2-SQLCODE                                     
           END-IF.                                                              
                                                                                
       7610-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       7620-INSERT-VOPTN.                                                       
           MOVE '7620-INSERT-VOPTN      ' TO W-ROUTINE.                         
                                                                                
           INITIALIZE DCLVOPTN                                                  
           MOVE SV-CLIENT-NBR                                                   
                                     TO CLIENT-NBR         OF DCLVOPTN.         
           MOVE W-NSCC-ACAT-CTL-NBR                                             
                                     TO ACAT-CONTROL-NBR   OF DCLVOPTN.         
           MOVE W-NSCC-AT-ASSET-SEQ-NBR                                         
                                     TO ASSET-SEQ-NBR      OF DCLVOPTN.         
                                                                                
           MOVE W-NSCC-ATO-OPT-BS-IND                                           
                                     TO BS-CD              OF DCLVOPTN.         
           MOVE W-NSCC-ATO-OPT-PC-IND                                           
                                     TO PTCL-CD            OF DCLVOPTN.         
           MOVE W-NSCC-ATO-OPT-OC-IND                                           
                                     TO OPTN-OPN-CLSD-CD   OF DCLVOPTN.         
           MOVE W-NSCC-ATO-OPT-SYM                                              
                                     TO SYM-CD             OF DCLVOPTN.         
                                                                                
LRM013     MOVE W-NSCC-ATO-OPT-EXP-CC-NEW  TO W-DATE-CC                         
LRM013     MOVE W-NSCC-ATO-OPT-EXP-YY-NEW  TO W-DATE-YY                         
LRM013     MOVE W-NSCC-ATO-OPT-EXP-MM-NEW  TO W-DATE-MM                         
LRM013     MOVE W-NSCC-ATO-OPT-EXP-DD-NEW  TO W-DATE-DD                         
           IF  (W-DATE-MM             > '12' OR                                 
                W-DATE-MM             < '01')                                   
           OR  (W-DATE-CC             < '00')                                   
           OR  (W-DATE-CC             > '99')                                   
           OR  (W-DATE-YY             < '00')                                   
           OR  (W-DATE-YY             > '99')                                   
           OR  W-NSCC-ATO-OPT-EXP-DT-NEW NOT NUMERIC                            
                DISPLAY 'INP=' W-INFILE-CNT                                     
                       ' CLT=' SV-CLIENT-NBR,                                   
                       ' CTL=' W-NSCC-ACAT-CTL-NBR                              
                       ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                          
                       ' OPT-EXP-DT(MMYYCC) IS INVALID: '                       
                                            W-NSCC-ATO-OPT-EXP-DT-NEW           
                      '  DEFAULT TO 0001-01-01'                                 
                MOVE '00'                   TO W-DATE-CC                        
                MOVE '01'                   TO W-DATE-YY                        
                MOVE '01'                   TO W-DATE-MM                        
                MOVE '01'                   TO W-DATE-DD                        
           END-IF                                                               
                                                                                
           MOVE W-DATE               TO EXPTN-DT           OF DCLVOPTN.         
                                                                                
           MOVE W-NSCC-ATO-OPT-STKPRC-INT-NEW                                   
                                     TO STPRC-INTEGER-AMT  OF DCLVOPTN          
LRM013                                  STPRC-INTEGER2-AMT OF DCLVOPTN.         
           MOVE W-NSCC-ATO-OPT-STKPRC-FRC-NEW                                   
                                     TO STPRC-FRCTN-AMT    OF DCLVOPTN.         
           MOVE W-NSCC-ATO-OPT-OCC-DEL-NBR                                      
                                     TO DLVR-OCC-NBR       OF DCLVOPTN.         
           MOVE W-NSCC-ATO-OPT-ACCT-TYP                                         
                                     TO OPTN-ACCT-TYPE-CD  OF DCLVOPTN.         
           MOVE W-NSCC-ATO-SUB-ACCT-ID                                          
                                     TO ACCT-SUB-CD        OF DCLVOPTN.         
           MOVE W-NSCC-ATO-OPT-COMMENT                                          
                                     TO OPTN-CMNT-TXT      OF DCLVOPTN.         
           MOVE 'CAT710'             TO PRGM-NM            OF DCLVOPTN          
           MOVE ' '                  TO CICS-TERM-ID-CD    OF DCLVOPTN          
           MOVE W-CURRENT-TIMESTAMP  TO CRT-TMSTP          OF DCLVOPTN          
           MOVE W-CURRENT-TIMESTAMP  TO UPDT-TMSTP         OF DCLVOPTN          
           MOVE ' '                  TO ACCT-TYPE-MSMT-IND OF DCLVOPTN          
                                                                                
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
LRM013            ,STPRC_INTEGER2_AMT                                           
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
LRM013            ,:DCLVOPTN.STPRC-INTEGER2-AMT                                 
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
                                                                                
           MOVE 'VOPTN   '               TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE.                      
           IF  SQLCODE = 0                                                      
               ADD 1 TO W-VOPTN-INSERTED-CNT                                    
           ELSE                                                                 
               ADD 1 TO W-VOPTN-NOT-INSERTED-CNT                                
               DISPLAY 'OPTN  NOT INSERTED.'                                    
                      ' CLT=' SV-CLIENT-NBR,                                    
                      ' CTL=' SV-ACAT-CNTL-NBR                                  
                      ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                           
                      ' SQL=' W-DB2-SQLCODE                                     
           END-IF.                                                              
                                                                                
       7620-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       7630-INSERT-VMF.                                                         
           MOVE '7630-INSERT-VMF        ' TO W-ROUTINE.                         
                                                                                
           INITIALIZE DCLVMF                                                    
           MOVE SV-CLIENT-NBR                                                   
                                     TO CLIENT-NBR         OF DCLVMF.           
                                                                                
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-AT-DEL-NBR                      
               MOVE 'D'              TO DSTBN-SIDE-CD      OF DCLVMF            
           ELSE                                                                 
               MOVE 'R'              TO DSTBN-SIDE-CD      OF DCLVMF            
           END-IF                                                               
                                                                                
           MOVE W-NSCC-ACAT-CTL-NBR                                             
                                     TO ACAT-CONTROL-NBR   OF DCLVMF.           
           MOVE W-NSCC-AT-ASSET-SEQ-NBR                                         
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
           MOVE W-NSCC-ATF-CUS-ACCT                                             
                                     TO FNBR               OF DCLVMF.           
           MOVE W-NSCC-ATF-PHSCL-SHR-IND                                        
                                     TO BK-PHSCL-SHR-CD    OF DCLVMF.           
           MOVE W-NSCC-ATF-NTWRK-CTL-IND                                        
                                     TO NTWRK-CNTL-CD      OF DCLVMF.           
           MOVE W-NSCC-ATF-ACCT-TYP-IND                                         
                                     TO ACCT-TYPE-CD       OF DCLVMF.           
                                                                                
           IF   W-NSCC-ATF-DIV-CD = '0' OR '2' OR '3' OR '4'                    
                MOVE 'C'             TO DVDND-CD           OF DCLVMF            
           ELSE                                                                 
                MOVE 'R'             TO DVDND-CD           OF DCLVMF            
           END-IF                                                               
           IF   W-NSCC-ATF-DIV-CD = '0' OR '2' OR '5' OR '7'                    
                MOVE 'C'             TO LTCG-CD            OF DCLVMF            
           ELSE                                                                 
                MOVE 'R'             TO LTCG-CD            OF DCLVMF            
           END-IF                                                               
           IF   W-NSCC-ATF-DIV-CD = '0' OR '4' OR '5' OR '6'                    
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
           MOVE 'CAT710'             TO PRGM-NM            OF DCLVMF.           
           MOVE ' '                  TO CICS-TERM-ID-CD    OF DCLVMF.           
           MOVE W-CURRENT-TIMESTAMP  TO CRT-TMSTP          OF DCLVMF.           
           MOVE W-CURRENT-TIMESTAMP  TO UPDT-TMSTP         OF DCLVMF.           
DJ0003     MOVE W-NSCC-ATF-FUND-AC-NBR-RCV                                      
DJ0003                               TO FCST-ACCT-RCVR-NBR OF DCLVMF.           
                                                                                
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
                  ,FCST_ACCT_RCVR_NBR                                           
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
                  ,:DCLVMF.FCST-ACCT-RCVR-NBR                                   
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'VMF     '               TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE.                      
                                                                                
           IF  SQLCODE = 0                                                      
               ADD 1 TO W-VMF-INSERTED-CNT                                      
           ELSE                                                                 
               ADD 1 TO W-VMF-NOT-INSERTED-CNT                                  
               DISPLAY 'MF    NOT INSERTED.'                                    
                      ' CLT=' SV-CLIENT-NBR,                                    
                      ' CTL=' SV-ACAT-CNTL-NBR                                  
                      ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                           
                      ' SQL=' W-DB2-SQLCODE                                     
           END-IF.                                                              
                                                                                
       7630-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
CSG002 7640-EDIT-ASSET-DESC-TXT.                                                
CSG002* MOVE SPACES FOR THE SPECIAL CHARACTERS FOUND IN ASSET-DESC-TXT.         
CSG002* AND LEFT JUSTIFY THE FIRST DESCRIPTION IF FIRST CHAR IS SPACE           
CSG002* AFTER EDITED.                                                           
CSG002     MOVE SPACES                 TO W-EDIT-ASSET-DESC-TXT-FLAG            
CSG002     PERFORM                                                              
CSG002         VARYING W-SUB1 FROM 1 BY 1                                       
CSG002           UNTIL W-SUB1 > 140                                             
CSG002         MOVE W-ASSET-DESC-TXT(W-SUB1:1)    TO W-EDIT-CHAR-AREA2          
CSG002         IF NOT W-VALID-CHARACTER2                                        
CSG002            MOVE SPACES           TO W-ASSET-DESC-TXT(W-SUB1:1)           
CSG002            SET W-EDIT-ASSET-DESC-TXT-Y     TO TRUE                       
CSG002         END-IF                                                           
CSG002     END-PERFORM                                                          
CSG002*                                                                         
CSG002     IF W-EDIT-ASSET-DESC-TXT-Y AND                                       
CSG002        W-ASSET-DESC1-TXT(1:1) = SPACES                                   
CSG002        SET W-JUST-LEFT-NOT-DONE       TO TRUE                            
CSG002        PERFORM                                                           
CSG002          VARYING W-SUB1 FROM 2 BY 1                                      
CSG002            UNTIL W-SUB1 > 30 OR W-JUST-LEFT-DONE                         
CSG002          IF W-ASSET-DESC1-TXT(W-SUB1 : 1) NOT = SPACES           03760002
CSG002             MOVE SPACES               TO W-ASSET-DESC-TMP                
CSG002             MOVE W-ASSET-DESC1-TXT(W-SUB1 : ) TO W-ASSET-DESC-TMP03760002
CSG002             MOVE W-ASSET-DESC-TMP     TO W-ASSET-DESC1-TXT               
CSG002             SET W-JUST-LEFT-DONE      TO TRUE                    03760002
CSG002          END-IF                                                  03760002
CSG002        END-PERFORM                                               03760002
CSG002     END-IF                                                       03760002
CSG002           .                                                      03760002
CSG002 7640-EXIT. EXIT.                                                         
CSG002/                                                                         
       7680-GET-ADP-NO.                                                         
           MOVE '7680-GET-ADP-NO        ' TO W-ROUTINE.                         
                                                                                
           IF (W-NSCC-AT-OP-LEN                                                 
           AND W-NSCC-AT-OPT-CATG > '00')                                       
LRM013         PERFORM 7699-GETADPNO-OPTION THRU 7699-EXIT                      
           ELSE                                                                 
               PERFORM 7700-GETMSDC THRU 7700-EXIT                              
           END-IF.                                                              
                                                                                
                                                                                
       7680-EXIT. EXIT.                                                         
      /                                                                         
LRM013 7699-GETADPNO-OPTION.                                                    
LRM013                                                                          
LRM013     MOVE ' '                      TO W-OPT-DESC                          
LRM013     MOVE ' '                      TO FMT-ADP-SEC-NO                      
LRM013     MOVE W-NSCC-ATO-OPT-BS-IND    TO FMT-BUY-SELL-IND                    
LRM013     MOVE W-NSCC-ATO-OPT-PC-IND    TO FMT-OPT-PUT-CALL                    
LRM013     MOVE W-NSCC-ATO-OPT-OC-IND    TO FMT-OPEN-CLOSE                      
LRM013     MOVE W-NSCC-ATO-OPT-SYM       TO FMT-OPT-SYMBOL                      
LRM013     INITIALIZE                   W-DATE                                  
LRM013     IF   W-NSCC-ATO-OPT-EXP-DT-NEW > ' '                                 
LRM013          MOVE W-NSCC-ATO-OPT-EXP-CC-NEW  TO W-DATE-CC                    
LRM013          MOVE W-NSCC-ATO-OPT-EXP-YY-NEW  TO W-DATE-YY                    
LRM013          MOVE W-NSCC-ATO-OPT-EXP-MM-NEW  TO W-DATE-MM                    
LRM013          MOVE W-NSCC-ATO-OPT-EXP-DD-NEW  TO W-DATE-DD                    
LRM013     ELSE                                                                 
LRM013          MOVE '00'                   TO W-DATE-CC                        
LRM013          MOVE '01'                   TO W-DATE-YY                        
LRM013          MOVE '01'                   TO W-DATE-MM                        
LRM013          MOVE '01'                   TO W-DATE-DD                        
LRM013     END-IF                                                               
LRM013                                                                          
LRM013     IF  (W-DATE-MM             > '12' OR                                 
LRM013          W-DATE-MM             < '01')                                   
LRM013     OR  (W-DATE-DD             > '31' OR                                 
LRM013          W-DATE-DD             < '01')                                   
LRM013     OR  (W-DATE-CC             < '00')                                   
LRM013     OR  (W-DATE-YY             < '00')                                   
LRM013          MOVE '00'                   TO W-DATE-CC                        
LRM013          MOVE '01'                   TO W-DATE-YY                        
LRM013          MOVE '01'                   TO W-DATE-MM                        
LRM013          MOVE '01'                   TO W-DATE-DD                        
LRM013     END-IF                                                               
LRM013                                                                          
LRM013     MOVE W-DATE-CC                TO FMT-OPT-EXP-CC                      
LRM013     MOVE W-DATE-YY                TO FMT-OPT-EXP-YY                      
LRM013     MOVE W-DATE-MM                TO FMT-OPT-EXP-MM                      
LRM013     MOVE W-DATE-DD                TO FMT-OPT-EXP-DD                      
LRM013     MOVE W-NSCC-ATO-OPT-ACCT-TYP  TO FMT-OPT-ACT-TYPE                    
LRM013                                                                          
LRM013     DISPLAY 'INP=' W-INFILE-CNT                                          
LRM013            ' OPT:' W-NSCC-ATO-OPT-SYM                                    
LRM013               '  ' W-NSCC-ATO-OPT-BS-IND                                 
LRM013                ' ' W-NSCC-ATO-OPT-PC-IND                                 
LRM013                ' ' W-NSCC-ATO-OPT-OC-IND                                 
LRM013                ' ' W-NSCC-ATO-OPT-EXP-DT-NEW                             
LRM013                ' ' W-NSCC-ATO-OPT-STKPRC-INT-NEW                         
LRM013                ' ' W-NSCC-ATO-OPT-STKPRC-FRC-NEW                         
LRM013                ' ' W-NSCC-ATO-OPT-COMMENT                                
LRM013                                                                          
LRM013     INITIALIZE GETADP-COMMAREA                                           
LRM013     MOVE  ZEROS                       TO GETADP-CLIENT-NBR               
LRM013     MOVE  W-NSCC-ATO-OPT-SYM          TO GETADP-OPTION-UNDSEC            
LRM013     MOVE  W-NSCC-ATO-OPT-EXP-MM-NEW   TO GETADP-OPTION-MONTH             
LRM013     MOVE  W-NSCC-ATO-OPT-EXP-DD-NEW   TO GETADP-OPTION-DAY               
LRM013     MOVE  W-NSCC-ATO-OPT-EXP-YY-NEW   TO GETADP-OPTION-YR                
LRM016     IF WS-DSTBN-SIDE-CD = 'R'                                            
LRM032        IF (W-NSCC-ATO-OPT-BS-IND = 'B' AND FMT-OPEN)                     
LRM032        OR (W-NSCC-ATO-OPT-BS-IND = 'S' AND FMT-CLOSE)                    
LRM029           MOVE 'L'           TO GETADP-OPTION-LS                         
LRM029        ELSE                                                              
LRM032*****IF (W-NSCC-ATO-OPT-BS-IND = 'S' AND FMT-OPEN)                        
LRM032*****OR (W-NSCC-ATO-OPT-BS-IND = 'B' AND FMT-CLOSE)                       
LRM029        MOVE 'S'           TO GETADP-OPTION-LS                            
LRM029     ELSE                                                                 
LRM013        IF W-NSCC-ATO-OPT-BS-IND = 'B'                                    
LRM013           MOVE 'S'           TO GETADP-OPTION-LS                         
LRM013        ELSE                                                              
LRM013           MOVE 'L'           TO GETADP-OPTION-LS                         
LRM016     END-IF.                                                              
LRM013     MOVE  W-NSCC-ATO-OPT-PC-IND       TO GETADP-OPTION-PC                
LRM013     IF  W-NSCC-ATO-OPT-STKPRC-INT-NEW NUMERIC                            
LRM013     AND W-NSCC-ATO-OPT-STKPRC-FRC-NEW NUMERIC                            
LRM013        MOVE W-NSCC-ATO-OPT-STKPRC-INT-NEW                                
LRM013                                      TO GETADP-OPTION-STRIKE(1:5)        
LRM013        MOVE W-NSCC-ATO-OPT-STKPRC-FRC-NEW                                
LRM013                                      TO GETADP-OPTION-STRIKE(6:3)        
LRM013     ELSE                                                                 
LRM013        MOVE ZERO TO GETADP-OPTION-STRIKE                                 
LRM013     END-IF.                                                              
LRM013                                                                          
TEST       DISPLAY 'CALLING GETADPNO WITH ' GETADP-COMMAREA.                    
LRM013     CALL GETADPNO USING GETADP-COMMAREA.                                 
LRM013                                                                          
LRM013     EVALUATE GETADP-RET-CODE                                             
LRM013        WHEN SPACES                                                       
LRM013             DISPLAY '   FND ' GETADP-ADP-NBR                             
LRM013             MOVE 'XX'                TO FMT-CUSIP-NO (1:2)               
LRM013             MOVE GETADP-ADP-NBR TO FMT-ADP-SEC-NO                        
LRM013                                    FMT-CUSIP-NO (3:7)                    
LRM013                                    GETMSD-SEARCH-KEY                     
LRM013             MOVE ZERO              TO GETMSD-WI-CODE                     
LRM013             MOVE WS-ADP-CLIENT     TO GETMSD-CLIENT-PL2                  
LRM013             PERFORM 7900-CALL-GETMSDC     THRU 7900-EXIT                 
LRM013             IF GETMSD-RETURN-VALID                                       
LRM013                MOVE SPACES TO MS-CUSIP-NO                                
LRM013                               MSD-ISIN                                   
LRM013                MOVE MS-DESC1            TO FMT-DESC1                     
LRM013                MOVE MS-DESC2            TO FMT-DESC2                     
LRM013                MOVE MS-DESC3            TO FMT-DESC3                     
LRM013             END-IF                                                       
LRM013        WHEN 'N'                                                          
LRM013             DISPLAY '   GETADPNO NOT FOUND'                              
LRM013        WHEN 'D'                                                          
LRM013             DISPLAY '**** PROGRAM CAT710'                                
LRM013             DISPLAY '**** CALL GETADPNO PROBLEM  ****'                   
LRM013             DISPLAY '**** IN  7699-GETADPNO'                             
LRM013             MOVE GETADP-SQLCA TO SQLCA                                   
LRM013             MOVE SQLCODE      TO W-DB2-SQLCODE                           
LRM013             DISPLAY 'GETADP SQLCODE ' W-DB2-SQLCODE                      
LRM013             DISPLAY 'GETADP-SQLCA ' GETADP-SQLCA                         
LRM013             MOVE 7699 TO ABEND-CODE                                      
LRM013             CALL ABEND USING ABEND-CODE                                  
LRM013     END-EVALUATE.                                                        
LRM013                                                                          
LRM013     IF  FMT-ADP-SEC-NO > ' '                                             
LRM013          MOVE 'N'         TO W-MSD-NOTFND-SW                             
LRM013          SET DIFFERENCE-FOUND TO TRUE                                    
LRM013          IF W-NSCC-SETTLE-CLOSE                                          
LRM017          AND (W-NSCC-AT-STL-LOC = '10' OR '50')                          
LRM013          AND W-NSCC-TI-TFR-TYPE NOT = 'RCR'                              
LRM013             IF SECURITY-ADP-NBR  OF DCLVASSET = ' '                      
LRM013                DISPLAY 'INP=' W-INFILE-CNT                               
LRM013                     ' ' SV-CLIENT-NBR,                                   
LRM013                     ' ' W-NSCC-ACAT-CTL-NBR                              
LRM013                 ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                          
LRM013                    ' SETTLE-CLOSE'                                       
LRM013                    ' SEC=' W-NSCC-AT-SEC-ID                              
LRM013                    ' OLD=' SECURITY-ADP-NBR  OF DCLVASSET                
LRM013                    ' NEW=' FMT-ADP-SEC-NO '(NOT REPLACED1)'              
LRM013             END-IF                                                       
LRM013          ELSE                                                            
LRM016          IF FMT-ADP-SEC-NO NOT = SECURITY-ADP-NBR OF DCLVASSET           
LRM016            DISPLAY 'CHANGING ADP-NBR ON OPTION FROM '                    
LRM016              SECURITY-ADP-NBR OF DCLVASSET ' TO ' FMT-ADP-SEC-NO         
LRM016          END-IF                                                          
LRM013          MOVE FMT-ADP-SEC-NO TO SECURITY-ADP-NBR  OF DCLVASSET           
LRM013          END-IF                                                          
LRM013          MOVE FMT-CUSIP-NO   TO ISIN-SEC-ISSUE-CD OF DCLVASSET           
LRM013          MOVE 'N'           TO ISIN-SEC-EXCPT-IND OF DCLVASSET           
LRM013          MOVE FMT-CUSIP-NO   TO W-NSCC-AT-SEC-ID                         
LRM013          MOVE FMT-DESC1 TO W-NSCC-ATO-OPT-COMMENT                        
LRM013          MOVE ' '       TO W-NSCC-AT-ASSET-DESC                          
LRM013          MOVE FMT-DESC1 TO W-NSCC-AT-ASSET-DESC (1:30)                   
LRM013          MOVE FMT-DESC2 TO W-NSCC-AT-ASSET-DESC (31:30)                  
LRM013          MOVE FMT-DESC3 TO W-NSCC-AT-ASSET-DESC (61:30)                  
LRM013          MOVE FMT-ADP-SEC-NO TO WK-POS-DESC5-SEC                         
LRM013          MOVE WK-POS-DESC5 TO W-NSCC-AT-ASSET-DESC (121:20)              
LRM013     ELSE                                                                 
LRM013          IF NOT W-NSCC-SETTLE-CLOSE                                      
LRM013           OR  W-NSCC-TI-TFR-TYPE  = 'RCR'                                
LRM013               MOVE ' '        TO SECURITY-ADP-NBR OF DCLVASSET           
LRM013          END-IF                                                          
LRM013          MOVE 'Y'         TO W-MSD-NOTFND-SW                             
LRM013          DISPLAY 'INP=' W-INFILE-CNT                                     
LRM013                     ' ' SV-CLIENT-NBR,                                   
LRM013                     ' ' W-NSCC-ACAT-CTL-NBR                              
LRM013                 ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                          
LRM013                 ' OPT NOT FND:'                                          
LRM013                 ' SYM=' FMT-OPT-SYMBOL                                   
LRM013                  ' BS=' FMT-BUY-SELL-IND                                 
LRM013                  ' PC=' FMT-OPT-PUT-CALL                                 
LRM013                  ' OC=' FMT-OPEN-CLOSE                                   
LRM013                  ' ED=' FMT-OPT-EXP-DATE                                 
LRM013                  ' PR=' W-OPT-STRIKE-PRIC-NEW                            
LRM013                     ' ' W-OPT-STRIKE-FRAC-NEW                            
LRM013          DISPLAY '    OPT-COMMENT=' W-NSCC-ATO-OPT-COMMENT               
LRM013     END-IF.                                                              
LRM013     IF  W-NSCC-AT-OPT-CATG   > '00'                                      
LRM013         IF W-NSCC-ATO-OPT-BS-IND      = 'B'                              
LRM013            MOVE 'BUY'          TO W-OPT-BUY-SELL                         
LRM013         ELSE                                                             
LRM013            MOVE 'SELL'         TO W-OPT-BUY-SELL                         
LRM013         END-IF                                                           
LRM013         IF W-NSCC-ATO-OPT-OC-IND      = 'O'                              
LRM013            MOVE 'OPEN'         TO W-OPT-OPEN-CLOSE                       
LRM013         ELSE                                                             
LRM013            MOVE 'CLOS'         TO W-OPT-OPEN-CLOSE                       
LRM013         END-IF                                                           
LRM013         IF W-NSCC-ATO-OPT-PC-IND     = 'C'                               
LRM013            MOVE 'CALL'         TO W-OPT-CALL-PUT                         
LRM013         ELSE                                                             
LRM013            MOVE 'PUT '         TO W-OPT-CALL-PUT                         
LRM013         END-IF                                                           
LRM013         MOVE W-NSCC-ATO-OPT-SYM TO W-OPT-UNDLY-SYMBOL                    
LRM013         MOVE W-NSCC-ATO-OPT-EXP-MM-NEW   TO W-OPT-EXPTN-MM-NEW           
LRM013         MOVE '/'                         TO W-OPT-EXPTN-S1-NEW           
LRM013                                             W-OPT-EXPTN-S2-NEW           
LRM013         MOVE W-NSCC-ATO-OPT-EXP-DD-NEW   TO W-OPT-EXPTN-DD-NEW           
LRM013         MOVE W-NSCC-ATO-OPT-EXP-YY-NEW   TO W-OPT-EXPTN-YY-NEW           
LRM013         MOVE W-NSCC-ATO-OPT-STKPRC-INT-NEW TO W-STPRC-INTEGER-AMT        
LRM013         MOVE W-STPRC-INTEGER-AMT   TO W-OPT-STRIKE-PRIC-NEW              
LRM013         IF W-NSCC-ATO-OPT-STKPRC-FRC-NEW = '000'                         
LRM013            MOVE SPACES             TO W-OPT-STRIKE-FRAC-NEW              
LRM013         ELSE                                                             
LRM013            MOVE W-NSCC-ATO-OPT-STKPRC-FRC-NEW                            
LRM013                                    TO W-OPT-STRIKE-FRAC-NEW              
LRM013         END-IF                                                           
LRM013         DISPLAY 'INP=' W-INFILE-CNT                                      
LRM013                  ' W-OPT-DESC = ' W-OPT-DESC                             
LRM013     END-IF.                                                              
LRM013     IF  W-NSCC-AT-OPT-CATG     > '00'                                    
LRM013       IF (W-NSCC-AT-ASSET-DESC        (1:60) = ' ')                      
LRM013              MOVE W-OPT-DESC TO W-NSCC-AT-ASSET-DESC      (1:60)         
LRM013              DISPLAY 'INP=' W-INFILE-CNT                                 
LRM013                ' W-OPT-DESC = ' W-OPT-DESC                               
LRM013       ELSE                                                               
LRM013        IF (W-NSCC-AT-ASSET-DESC        (31:60) = ' ')                    
LRM013              MOVE W-OPT-DESC TO W-NSCC-AT-ASSET-DESC      (31:60)        
LRM013        ELSE                                                              
LRM013         IF (W-NSCC-AT-ASSET-DESC        (61:60) = ' ')                   
LRM013              MOVE W-OPT-DESC TO W-NSCC-AT-ASSET-DESC      (61:60)        
LRM013         ELSE                                                             
LRM013          IF (W-NSCC-AT-ASSET-DESC        (91:30) = ' ')                  
LRM013              MOVE W-OPT-DESC TO W-NSCC-AT-ASSET-DESC      (91:30)        
LRM013          END-IF                                                          
LRM013         END-IF                                                           
LRM013        END-IF                                                            
LRM013       END-IF                                                             
LRM013     END-IF.                                                              
LRM013 7699-EXIT. EXIT.                                                         
      /                                                                         
       7700-GETMSDC.                                                            
           MOVE '7700-GETMSDC           ' TO W-ROUTINE.                         
                                                                                
           IF  W-NSCC-AT-ASSET-PRC-CATG =                                       
              'CORP' OR 'MUNI' OR 'ZERO'                                        
               PERFORM 7800-BONDS      THRU 7800-EXIT                           
               GO TO 7700-EXIT                                                  
           END-IF                                                               
                                                                                
           IF  W-NSCC-AT-SEC-ID = ' '                                           
               MOVE ' '              TO W-MSD-NOTFND-SW                         
               ADD 1 TO W-BLANK-SEC-CNT                                         
           END-IF                                                               
                                                                                
           MOVE ' '                    TO GETMSD-RETURN-CODE.                   
DJ0005     MOVE LOW-VALUES             TO GETMSD-SEARCH-KEY-AREA.               
                                                                                
DJ0007***--IF VASSET ALREADY EXIST, GET ADP-SEC-NO FROM VASSET                  
DJ0007     IF  ASSET-FOUND                                                      
DJ0007     AND SECURITY-ADP-NBR OF DCLVASSET > ' '                              
DJ0007         MOVE SECURITY-ADP-NBR OF DCLVASSET TO GETMSD-SEARCH-KEY          
DJ0007         IF  WHI-CD OF DCLVASSET   = 'W'                                  
DJ0007             MOVE '0'               TO GETMSD-WI-CODE                     
DJ0007             DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0007             ' ' SV-CLIENT-NBR ' ' W-BRANCH-CD W-ACCT-CD                  
DJ0007             ' ' W-NSCC-ACAT-CTL-NBR ' ' W-NSCC-AT-ASSET-SEQ-NBR          
DJ0007             ' ' SECURITY-ADP-NBR OF DCLVASSET                            
DJ0007             ' ' WHI-CD OF DCLVASSET                                      
DJ0007             ' SIDE=' WS-DSTBN-SIDE-CD                                    
DJ0007             ' WHEN-ISSUE SECURITY-ADP-NBR USE 0'                         
DJ0007         ELSE                                                             
DJ0007             MOVE '0'               TO GETMSD-WI-CODE                     
DJ0007         END-IF                                                           
DJ0007     ELSE                                                                 
               MOVE W-NSCC-AT-SEC-ID  TO GETMSD-SEARCH-KEY                      
DJ0007         IF   W-NSCC-AT-WHN-ISS-IND = 'W'                                 
DJ0007              MOVE '0'               TO GETMSD-WI-CODE                    
DJ0008             DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0008             ' ' SV-CLIENT-NBR ' ' W-BRANCH-CD W-ACCT-CD                  
DJ0008             ' ' W-NSCC-ACAT-CTL-NBR ' ' W-NSCC-AT-ASSET-SEQ-NBR          
DJ0008             ' ' W-NSCC-AT-SEC-CNTRY-CD                                   
DJ0008                 W-NSCC-AT-SEC-ID                                         
DJ0008                 W-NSCC-AT-SEC-CHKDGT                                     
DJ0008             ' ' W-NSCC-AT-WHN-ISS-IND                                    
DJ0008             ' SIDE=' WS-DSTBN-SIDE-CD                                    
DJ0008             ' WHEN-ISSUE W-NSCC-AT-WHN-ISS-IND USE 0'                    
DJ0007         ELSE                                                             
DJ0007              MOVE '0'               TO GETMSD-WI-CODE                    
DJ0007         END-IF                                                           
DJ0007     END-IF                                                               
                                                                                
DJ0005     MOVE WS-ADP-CLIENT          TO GETMSD-CLIENT-PL2                     
DJ0009     PERFORM 7900-CALL-GETMSDC     THRU 7900-EXIT                         
                                                                                
DJ0009***--IF NOT FOUND BECAUSE OF PRIVATE RANGE, GO TO NOTFND.                 
DJ0007     IF W-PRNGFL-SW = 'Y'                                                 
DJ0007        PERFORM 7720-MSD-NOTFND THRU 7720-EXIT                            
DJ0007     ELSE                                                                 
             IF GETMSD-RETURN-VALID                                             
DJ0008         IF W-NSCC-AT-WHN-ISS-IND = 'W'                                   
DJ0008            MOVE 'I'             TO W-NSCC-AT-WHN-ISS-IND                 
DJ0008            DISPLAY 'INP=' W-INFILE-CNT                                   
DJ0008             ' ' SV-CLIENT-NBR ' ' W-BRANCH-CD W-ACCT-CD                  
DJ0008             ' ' W-NSCC-ACAT-CTL-NBR ' ' W-NSCC-AT-ASSET-SEQ-NBR          
DJ0008             ' ' W-NSCC-AT-SEC-CNTRY-CD                                   
DJ0008                 W-NSCC-AT-SEC-ID                                         
DJ0008                 W-NSCC-AT-SEC-CHKDGT                                     
DJ0008             ' ' W-NSCC-AT-WHN-ISS-IND                                    
DJ0008             ' SIDE=' WS-DSTBN-SIDE-CD                                    
DJ0008             ' WHEN-ISSUE W-NSCC-AT-WHN-ISS-IND MOVE I'                   
DJ0008         END-IF                                                           
DJ0007          PERFORM 7710-MSD-FOUND THRU 7710-EXIT                           
             ELSE                                                               
DJ0009***-----IF NOT FOUND FOR REGULAR, BUT WHN-ISS = W, TRY WHEN-ISSUE         
DJ0007         IF W-NSCC-AT-WHN-ISS-IND = 'W'                                   
DJ0008            DISPLAY 'INP=' W-INFILE-CNT                                   
DJ0008             ' ' SV-CLIENT-NBR ' ' W-BRANCH-CD W-ACCT-CD                  
DJ0008             ' ' W-NSCC-ACAT-CTL-NBR ' ' W-NSCC-AT-ASSET-SEQ-NBR          
DJ0008             ' ' W-NSCC-AT-SEC-CNTRY-CD                                   
DJ0008                 W-NSCC-AT-SEC-ID                                         
DJ0008                 W-NSCC-AT-SEC-CHKDGT                                     
DJ0008             ' ' W-NSCC-AT-WHN-ISS-IND                                    
DJ0008             ' SIDE=' WS-DSTBN-SIDE-CD                                    
DJ0008             ' WHEN-ISSUE W-NSCC-AT-WHN-ISS-IND USE 1'                    
DJ0008            MOVE 'W'             TO W-NSCC-AT-WHN-ISS-IND                 
DJ0007            MOVE '1'             TO GETMSD-WI-CODE                        
DJ0009            PERFORM 7900-CALL-GETMSDC     THRU 7900-EXIT                  
DJ0007            IF GETMSD-RETURN-VALID                                        
DJ0007               PERFORM 7710-MSD-FOUND THRU 7710-EXIT                      
DJ0007            ELSE                                                          
DJ0009***------------IF WI NOT FOUND, TRY ISIN                                  
DJ0007               PERFORM 7703-USE-ISIN-FOR-GETMSD THRU 7703-EXIT            
DJ0007            END-IF                                                        
DJ0007         ELSE                                                             
DJ0009***-----IF NOT FOUND FOR REGULAR, TRY ISIN                                
DJ0007            PERFORM 7703-USE-ISIN-FOR-GETMSD THRU 7703-EXIT               
DJ0007         END-IF                                                           
DJ0007       END-IF                                                             
           END-IF.                                                              
                                                                                
       7700-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
DJ0007 7703-USE-ISIN-FOR-GETMSD SECTION.                                        
DJ0007*WHEN CUSIP NOT FOUND, TRY ISIN NUMBER                                    
DJ0007                                                                          
DJ0007***USE ALL THREE ISIN FIELDS FROM SIAC TO LOOK UP MSD                     
DJ0007     MOVE W-NSCC-AT-SEC-CNTRY-CD TO GETMSD-SEARCH-KEY(1:2)                
DJ0007     MOVE W-NSCC-AT-SEC-ID       TO GETMSD-SEARCH-KEY(3:9)                
DJ0007     MOVE W-NSCC-AT-SEC-CHKDGT   TO GETMSD-SEARCH-KEY(12:1)               
DJ0009     PERFORM 7900-CALL-GETMSDC     THRU 7900-EXIT                         
DJ0007     IF  GETMSD-RETURN-VALID                                              
DJ0007         ADD 1 TO W-ISIN-FND-CNT                                          
DJ0007         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0007           ' ' SV-CLIENT-NBR ' ' W-BRANCH-CD W-ACCT-CD                    
DJ0007           ' ' W-NSCC-ACAT-CTL-NBR ' ' W-NSCC-AT-ASSET-SEQ-NBR            
DJ0007           ' ISIN12 FND'                                                  
DJ0007           ' ISN=' W-NSCC-AT-SEC-CNTRY-CD                                 
DJ0007                    W-NSCC-AT-SEC-ID                                      
DJ0007                    W-NSCC-AT-SEC-CHKDGT                                  
DJ0007            ' CT=' W-NSCC-AT-ASSET-PRC-CATG                               
DJ0007            ' SL=' W-NSCC-AT-STL-LOC                                      
DJ0007            ' RS=' W-NSCC-AT-STL-LOC-RSN-CD                               
DJ0007            ' WH=' W-NSCC-AT-WHN-ISS-IND                                  
DJ0007            ' BD=' W-NSCC-AT-BEARER-BOND                                  
DJ0007            ' OP=' W-NSCC-AT-OPT-CATG                                     
DJ0007            ' CU=' W-NSCC-AT-ISO-CURCY-CD                                 
DJ0007         DISPLAY '    '                                                   
DJ0007            'DESC=' W-NSCC-AT-ASSET-DESC (1:110)                          
DJ0007            '     ' W-NSCC-AT-ASSET-DESC (111:30) '<='                    
DJ0007         DISPLAY '    ADP=' MS-ADP-NO                                     
DJ0007                ' ' MS-DESC1 MS-DESC2 MS-DESC3                            
DJ0007         PERFORM 7710-MSD-FOUND  THRU 7710-EXIT                           
DJ0007     ELSE                                                                 
DJ0007       IF  W-NSCC-AT-ASSET-DESC (114:15) = 'SUBMITTER ISIN:'              
DJ0007       AND W-NSCC-AT-ASSET-DESC (138:1) > ' '                             
DJ0007       AND W-NSCC-AT-ASSET-DESC (139:1) > ' '                             
DJ0007          PERFORM 7705-SUBMITTER-ISIN THRU 7705-EXIT                      
DJ0007       ELSE                                                               
DJ0007          ADD 1 TO W-ISIN-NOTFND-CNT                                      
DJ0007          PERFORM 7720-MSD-NOTFND THRU 7720-EXIT                          
DJ0007       END-IF                                                             
DJ0007     END-IF.                                                              
DJ0007                                                                          
DJ0007 7703-EXIT. EXIT.                                                         
           EXIT.                                                                
      /                                                                         
DJ0007 7705-SUBMITTER-ISIN      SECTION.                                        
DJ0007* USE "SUBMITTER-ISIN:" IN THE ASSET DESCRIPTION FIELD                    
LRM037*---------------------------------------------------------------          
LRM037* FIRST CALL MSISINB WITH ISIN AND COUNTRY FOR MATCH.  IF FOUND           
LRM037* USE THE ADP NUMBER RETURNED, OTHER LOOKUP THE OLD WAY.                  
LRM037*---------------------------------------------------------------          
LRM019     MOVE 'G' TO MSISIN-ACTION                                            
LRM019     MOVE W-NSCC-AT-ASSET-DESC (129:12) TO MSISIN-ISIN-NBR                
LRM019     IF W-NSCC-AT-SEC-CNTRY-CD > SPACES                                   
LRM019        MOVE W-NSCC-AT-SEC-CNTRY-CD     TO MSISIN-COUNTRY                 
LRM019     ELSE                                                                 
LRM019        MOVE W-NSCC-AT-ASSET-DESC (129:2) TO MSISIN-COUNTRY               
LRM019     END-IF.                                                              
LRM019     DISPLAY 'CALLING MSISINB WITH ' MSISIN-ISIN-NBR                      
LRM019                                 ' ' MSISIN-COUNTRY                       
LRM019     CALL MSISINB                                                         
LRM019         USING MSISIN-COMMAREA.                                           
LRM019     IF MSISIN-RETURN-CODE NOT = SPACES                                   
LRM019        DISPLAY 'MSISIN RET-CODE ' MSISIN-RETURN-CODE                     
LRM019     ELSE                                                                 
LRM019        DISPLAY  'MSISIN-ADP-NO ' MSISIN-ADP-NO                           
LRM019        MOVE MSISIN-ADP-NO               TO GETMSD-SEARCH-KEY             
LRM019        PERFORM 7900-CALL-GETMSDC     THRU 7900-EXIT                      
LRM019        IF  GETMSD-RETURN-VALID                                           
LRM019          MOVE 'I' TO NSCC-NON-ADP-IND   OF DCLVASSET                     
LRM019          DISPLAY 'INP=' W-INFILE-CNT                                     
LRM019                      ' 7705-SUBMITTER-MSISIN FOUND '                     
LRM019           '"' W-NSCC-AT-ASSET-DESC (114:27)                              
LRM019          PERFORM 7710-MSD-FOUND  THRU 7710-EXIT                          
LRM019          ADD 1 TO W-SUB-ISIN-FND-CNT                                     
LRM019          GO TO 7705-EXIT                                                 
LRM019     END-IF.                                                              
DJ0007                                                                          
DJ0007* USE "SUBMITTER-ISIN:" 12 BYTES                                          
DJ0007     MOVE W-NSCC-AT-ASSET-DESC (129:12) TO GETMSD-SEARCH-KEY              
DJ0009     PERFORM 7900-CALL-GETMSDC     THRU 7900-EXIT                         
DJ0007     IF  GETMSD-RETURN-VALID                                              
DJ0007         ADD 1 TO W-SUB-ISIN-FND-CNT                                      
DJ0007         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0007           ' ' SV-CLIENT-NBR ' ' W-BRANCH-CD W-ACCT-CD                    
DJ0007           ' ' W-NSCC-ACAT-CTL-NBR ' ' W-NSCC-AT-ASSET-SEQ-NBR            
DJ0007           ' SUBM-FND-1'                                                  
DJ0007           ' ISN=' W-NSCC-AT-SEC-CNTRY-CD                                 
DJ0007                    W-NSCC-AT-SEC-ID                                      
DJ0007                    W-NSCC-AT-SEC-CHKDGT                                  
DJ0007            ' CT=' W-NSCC-AT-ASSET-PRC-CATG                               
DJ0007            ' SL=' W-NSCC-AT-STL-LOC                                      
DJ0007            ' RS=' W-NSCC-AT-STL-LOC-RSN-CD                               
DJ0007            ' WH=' W-NSCC-AT-WHN-ISS-IND                                  
DJ0007            ' BD=' W-NSCC-AT-BEARER-BOND                                  
DJ0007            ' OP=' W-NSCC-AT-OPT-CATG                                     
DJ0007            ' CU=' W-NSCC-AT-ISO-CURCY-CD                                 
DJ0007         DISPLAY '    '                                                   
DJ0007            'DESC=' W-NSCC-AT-ASSET-DESC (1:110)                          
DJ0007            '     ' W-NSCC-AT-ASSET-DESC (111:30) '<='                    
DJ0007         DISPLAY '    ADP=' MS-ADP-NO                                     
DJ0007                ' ' MS-DESC1 MS-DESC2 MS-DESC3                            
DJ0007         PERFORM 7710-MSD-FOUND  THRU 7710-EXIT                           
DJ0007     ELSE                                                                 
DJ0007***----USE "SUBMITTER-ISIN:" 9 BYTES                                      
DJ0007      MOVE ' '                          TO GETMSD-SEARCH-KEY              
DJ0007      MOVE W-NSCC-AT-ASSET-DESC (131:9) TO GETMSD-SEARCH-KEY(1:9)         
DJ0009      PERFORM 7900-CALL-GETMSDC     THRU 7900-EXIT                        
DJ0007      IF  GETMSD-RETURN-VALID                                             
DJ0007         ADD 1 TO W-SUB-ISIN-FND-CNT                                      
DJ0007         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0007           ' ' SV-CLIENT-NBR ' ' W-BRANCH-CD W-ACCT-CD                    
DJ0007           ' ' W-NSCC-ACAT-CTL-NBR ' ' W-NSCC-AT-ASSET-SEQ-NBR            
DJ0007           ' SUBM-FND-9'                                                  
DJ0007           ' ISN=' W-NSCC-AT-SEC-CNTRY-CD                                 
DJ0007                    W-NSCC-AT-SEC-ID                                      
DJ0007                    W-NSCC-AT-SEC-CHKDGT                                  
DJ0007            ' CT=' W-NSCC-AT-ASSET-PRC-CATG                               
DJ0007            ' SL=' W-NSCC-AT-STL-LOC                                      
DJ0007            ' RS=' W-NSCC-AT-STL-LOC-RSN-CD                               
DJ0007            ' WH=' W-NSCC-AT-WHN-ISS-IND                                  
DJ0007            ' BD=' W-NSCC-AT-BEARER-BOND                                  
DJ0007            ' OP=' W-NSCC-AT-OPT-CATG                                     
DJ0007            ' CU=' W-NSCC-AT-ISO-CURCY-CD                                 
DJ0007         DISPLAY '    '                                                   
DJ0007            'DESC=' W-NSCC-AT-ASSET-DESC (1:110)                          
DJ0007            '     ' W-NSCC-AT-ASSET-DESC (111:30) '<='                    
DJ0007         DISPLAY '    ADP=' MS-ADP-NO                                     
DJ0007                ' ' MS-DESC1 MS-DESC2 MS-DESC3                            
DJ0007         PERFORM 7710-MSD-FOUND  THRU 7710-EXIT                           
DJ0007      ELSE                                                                
DJ0007         ADD 1 TO W-SUB-ISIN-NOTFND-CNT                                   
DJ0007         PERFORM 7720-MSD-NOTFND THRU 7720-EXIT                           
DJ0007      END-IF                                                              
DJ0007     END-IF.                                                              
DJ0007                                                                          
DJ0007 7705-EXIT. EXIT.                                                         
           EXIT.                                                                
      /                                                                         
       7710-MSD-FOUND       SECTION.                                            
                                                                                
           ADD 1 TO W-MSD-FND-CNT                                               
           MOVE 'N'         TO W-MSD-NOTFND-SW                                  
           SET DIFFERENCE-FOUND TO TRUE                                         
           IF W-NSCC-SETTLE-CLOSE                                               
LRM017     AND (W-NSCC-AT-STL-LOC = '10' OR '50')                               
           AND W-NSCC-TI-TFR-TYPE NOT = 'RCR'                                   
                   IF SECURITY-ADP-NBR  OF DCLVASSET = ' '                      
                      DISPLAY 'INP=' W-INFILE-CNT                               
                           ' ' SV-CLIENT-NBR,                                   
                           ' ' W-NSCC-ACAT-CTL-NBR                              
                       ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                          
DJ0007                    ' SETTLE-CLOSE'                                       
                          ' SEC=' W-NSCC-AT-SEC-ID                              
                          ' OLD=' SECURITY-ADP-NBR  OF DCLVASSET                
                          ' NEW=' MS-ADP-NO      '(NOT REPLACED2)'              
                   END-IF                                                       
           ELSE                                                                 
              MOVE MS-ADP-NO  TO SECURITY-ADP-NBR OF DCLVASSET                  
           END-IF                                                               
DJ0007     MOVE ' '      TO W-NSCC-AT-ASSET-DESC                                
           MOVE MS-DESC1 TO W-NSCC-AT-ASSET-DESC (1:30)                         
           MOVE MS-DESC2 TO W-NSCC-AT-ASSET-DESC (31:30)                        
           MOVE MS-DESC3 TO W-NSCC-AT-ASSET-DESC (61:30)                        
           MOVE MS-ADP-NO            TO WK-POS-DESC5-SEC                        
           MOVE WK-POS-DESC5 TO W-NSCC-AT-ASSET-DESC (121:20)                   
DJ0007     IF W-NSCC-AT-SEC-ID = ' '                                            
DJ0007        IF MS-CUSIP-NO > ' '                                              
DJ0007           MOVE 'US'              TO W-NSCC-AT-SEC-CNTRY-CD               
DJ0007           MOVE MS-CUSIP-NO       TO W-NSCC-AT-SEC-ID                     
DJ0007        ELSE                                                              
DJ0007          IF MSD-ISIN > ' '                                               
DJ0007             MOVE MSD-ISIN(1:2)  TO W-NSCC-AT-SEC-CNTRY-CD                
DJ0007             MOVE MSD-ISIN(3:9)  TO W-NSCC-AT-SEC-ID                      
DJ0007             MOVE MSD-ISIN(12:1) TO W-NSCC-AT-SEC-CHKDGT                  
DJ0007             DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0007             ' ' SV-CLIENT-NBR ' ' W-BRANCH-CD W-ACCT-CD                  
DJ0007             ' ' W-NSCC-ACAT-CTL-NBR ' ' W-NSCC-AT-ASSET-SEQ-NBR          
DJ0007             ' MSD-ISIN  '                                                
DJ0007             ' ISN=' W-NSCC-AT-SEC-CNTRY-CD                               
DJ0007                     W-NSCC-AT-SEC-ID                                     
DJ0007                     W-NSCC-AT-SEC-CHKDGT                                 
DJ0007              ' CT=' W-NSCC-AT-ASSET-PRC-CATG                             
DJ0007              ' SL=' W-NSCC-AT-STL-LOC                                    
DJ0007              ' RS=' W-NSCC-AT-STL-LOC-RSN-CD                             
DJ0007              ' WH=' W-NSCC-AT-WHN-ISS-IND                                
DJ0007              ' BD=' W-NSCC-AT-BEARER-BOND                                
DJ0007              ' OP=' W-NSCC-AT-OPT-CATG                                   
DJ0007              ' CU=' W-NSCC-AT-ISO-CURCY-CD                               
DJ0007              DISPLAY '    '                                              
DJ0007              'DESC=' W-NSCC-AT-ASSET-DESC (1:110)                        
DJ0007              '     ' W-NSCC-AT-ASSET-DESC (111:30) '<='                  
DJ0007           DISPLAY '    ADP=' MS-ADP-NO                                   
DJ0007                  ' ' MS-DESC1 MS-DESC2 MS-DESC3                          
DJ0007          ELSE                                                            
DJ0007               MOVE 'US'           TO W-NSCC-AT-SEC-CNTRY-CD              
DJ0007               MOVE 'XX'           TO W-NSCC-AT-SEC-ID (1:2)              
DJ0007               MOVE MS-ADP-NO      TO W-NSCC-AT-SEC-ID (3:7)              
DJ0007          END-IF                                                          
DJ0007        END-IF                                                            
DJ0007     END-IF.                                                              
                                                                                
       7710-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       7720-MSD-NOTFND      SECTION.                                            
                                                                                
           IF NOT W-NSCC-SETTLE-CLOSE                                           
             OR  W-NSCC-TI-TFR-TYPE  = 'RCR'                                    
              MOVE ' '        TO SECURITY-ADP-NBR OF DCLVASSET                  
           END-IF                                                               
           ADD 1 TO W-MSD-NOTFND-CNT                                            
           MOVE 'Y'         TO W-MSD-NOTFND-SW                                  
           DISPLAY 'INP=' W-INFILE-CNT                                          
DJ0007           ' ' SV-CLIENT-NBR ' ' W-BRANCH-CD W-ACCT-CD                    
DJ0007           ' ' W-NSCC-ACAT-CTL-NBR ' ' W-NSCC-AT-ASSET-SEQ-NBR            
                  ' MSD-NOTFND'                                                 
DJ0007           ' ISN=' W-NSCC-AT-SEC-CNTRY-CD                                 
DJ0007                    W-NSCC-AT-SEC-ID                                      
DJ0007                    W-NSCC-AT-SEC-CHKDGT                                  
                  ' CT=' W-NSCC-AT-ASSET-PRC-CATG                               
                  ' SL=' W-NSCC-AT-STL-LOC                                      
                  ' RS=' W-NSCC-AT-STL-LOC-RSN-CD                               
                  ' WH=' W-NSCC-AT-WHN-ISS-IND                                  
                  ' BD=' W-NSCC-AT-BEARER-BOND                                  
                  ' OP=' W-NSCC-AT-OPT-CATG                                     
                  ' CU=' W-NSCC-AT-ISO-CURCY-CD                                 
DJ0007     DISPLAY '    '                                                       
DJ0007            'DESC=' W-NSCC-AT-ASSET-DESC (1:110)                          
DJ0007            '     ' W-NSCC-AT-ASSET-DESC (111:30) '<='.                   
                                                                                
       7720-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       7800-BONDS           SECTION.                                            
                                                                                
DJ0009     MOVE ' ' TO W-GETXRF-KEY-9                                           
DJ0008     IF  W-NSCC-AT-WHN-ISS-IND = 'W'                                      
DJ0008             DISPLAY 'INP=' W-INFILE-CNT                                  
DJ0008             ' ' SV-CLIENT-NBR ' ' W-BRANCH-CD W-ACCT-CD                  
DJ0008             ' ' W-NSCC-ACAT-CTL-NBR ' ' W-NSCC-AT-ASSET-SEQ-NBR          
DJ0008             ' ' W-NSCC-AT-SEC-CNTRY-CD                                   
DJ0008                 W-NSCC-AT-SEC-ID                                         
DJ0008                 W-NSCC-AT-SEC-CHKDGT                                     
DJ0008             ' ' W-NSCC-AT-WHN-ISS-IND                                    
DJ0008             ' SIDE=' WS-DSTBN-SIDE-CD                                    
DJ0008             ' WHEN-ISSUE BOND (IGNORE IT)'                               
DJ0008         MOVE 'I'              TO W-NSCC-AT-WHN-ISS-IND                   
DJ0008     END-IF                                                               
                                                                                
DJ0009***--DON'T CALL GETMSD IF THERE IS NO CUSIP                               
DJ0009     IF W-NSCC-AT-SEC-ID > ' '                                            
DJ0008***----IGNORE WHEN ISSUE INDICATOR FOR BONDS, USE REGULAR                 
DJ0008       MOVE '0'              TO GETXRF-WI-CODE                            
DJ0007       MOVE W-NSCC-AT-SEC-ID TO W-GETXRF-KEY-9                            
             IF  W-NSCC-AT-BEARER-BOND = 'B'                                    
                 PERFORM 7810-BEARER-BOND THRU 7810-EXIT                        
             ELSE                                                               
               IF  W-NSCC-AT-ASSET-PRC-CATG = 'MUNI'                            
                   PERFORM 7820-MUNI-BOND THRU 7820-EXIT                        
               ELSE                                                             
                   PERFORM 7830-REGISTERED-BOND THRU 7830-EXIT                  
               END-IF                                                           
             END-IF                                                             
DJ0009     ELSE                                                                 
DJ0009       MOVE 'N'          TO GETMSD-RETURN-CODE                            
DJ0009       MOVE 'N'          TO GETXRF-RETURN-CODE                            
DJ0009     END-IF                                                               
                                                                                
DJ0007     IF  GETXRF-RETURN-VALID                                              
DJ0007     AND GETMSD-RETURN-VALID                                              
DJ0007         CONTINUE                                                         
DJ0007     ELSE                                                                 
DJ0007       IF W-NSCC-AT-ASSET-DESC (114:15) = 'SUBMITTER ISIN:'               
DJ0009       AND W-NSCC-AT-ASSET-DESC (138:1) > ' '                             
DJ0009       AND W-NSCC-AT-ASSET-DESC (139:1) > ' '                             
DJ0007          MOVE W-NSCC-AT-ASSET-DESC (131:9) TO W-GETXRF-KEY-9             
DJ0007          IF  W-NSCC-AT-BEARER-BOND = 'B'                                 
DJ0007              PERFORM 7810-BEARER-BOND THRU 7810-EXIT                     
DJ0007          ELSE                                                            
DJ0007              IF  W-NSCC-AT-ASSET-PRC-CATG = 'MUNI'                       
DJ0007                  PERFORM 7820-MUNI-BOND THRU 7820-EXIT                   
DJ0007              ELSE                                                        
DJ0007                  PERFORM 7830-REGISTERED-BOND THRU 7830-EXIT             
DJ0007              END-IF                                                      
DJ0007          END-IF                                                          
DJ0007          IF  GETXRF-RETURN-VALID                                         
DJ0007          AND GETMSD-RETURN-VALID                                         
DJ0007           ADD 1 TO W-SUB-ISIN-FND-CNT                                    
DJ0007           DISPLAY 'INP=' W-INFILE-CNT                                    
DJ0007           ' ' SV-CLIENT-NBR ' ' W-BRANCH-CD W-ACCT-CD                    
DJ0007           ' ' W-NSCC-ACAT-CTL-NBR ' ' W-NSCC-AT-ASSET-SEQ-NBR            
DJ0007               ' SUBB-FND-9'                                              
DJ0007           ' ISN=' W-NSCC-AT-SEC-CNTRY-CD                                 
DJ0007                    W-NSCC-AT-SEC-ID                                      
DJ0007                    W-NSCC-AT-SEC-CHKDGT                                  
DJ0007               ' CT=' W-NSCC-AT-ASSET-PRC-CATG                            
DJ0007               ' SL=' W-NSCC-AT-STL-LOC                                   
DJ0007               ' RS=' W-NSCC-AT-STL-LOC-RSN-CD                            
DJ0007               ' WH=' W-NSCC-AT-WHN-ISS-IND                               
DJ0007               ' BD=' W-NSCC-AT-BEARER-BOND                               
DJ0007               ' OP=' W-NSCC-AT-OPT-CATG                                  
DJ0007               ' CU=' W-NSCC-AT-ISO-CURCY-CD                              
DJ0007           DISPLAY '    '                                                 
DJ0007               'DESC=' W-NSCC-AT-ASSET-DESC (1:110)                       
DJ0007               '     ' W-NSCC-AT-ASSET-DESC (111:30) '<='                 
DJ0007           DISPLAY '    ADP=' MS-ADP-NO                                   
DJ0007                  ' ' MS-DESC1 MS-DESC2 MS-DESC3                          
DJ0007          ELSE                                                            
DJ0007           ADD 1 TO W-SUB-ISIN-NOTFND-CNT                                 
DJ0007          END-IF                                                          
DJ0007       END-IF                                                             
DJ0007     END-IF                                                               
                                                                                
           IF  GETXRF-RETURN-VALID                                              
           AND GETMSD-RETURN-VALID                                              
DJ0009         PERFORM 7803-BOND-FOUND THRU 7803-EXIT                           
           ELSE                                                                 
DJ0009***----IF ALL ELSE FAIL, TRY JUST 9 BYTE CUSIP                            
DJ0009       IF  W-GETXRF-KEY-9 > ' '                                           
DJ0009       AND W-GETXRF-KEY-9(8:1) > ' '                                      
DJ0009       AND W-GETXRF-KEY-9(9:1) > ' '                                      
DJ0009         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0009         ' ' SV-CLIENT-NBR ' ' W-BRANCH-CD W-ACCT-CD                      
DJ0009         ' ' W-NSCC-ACAT-CTL-NBR ' ' W-NSCC-AT-ASSET-SEQ-NBR              
DJ0009         ' USE 9 BYTES FOR BOND: ' W-GETXRF-KEY-9                         
DJ0009         '-' W-NSCC-AT-SEC-ID '-' W-NSCC-AT-ASSET-DESC(131:9) '-'         
DJ0009         MOVE W-GETXRF-KEY-9   TO GETMSD-SEARCH-KEY                       
DJ0009         PERFORM 7900-CALL-GETMSDC     THRU 7900-EXIT                     
DJ0009         IF  GETMSD-RETURN-VALID                                          
DJ0009             PERFORM 7803-BOND-FOUND THRU 7803-EXIT                       
DJ0009         ELSE                                                             
DJ0009             PERFORM 7805-BOND-NOT-FOUND THRU 7805-EXIT                   
DJ0009         END-IF                                                           
DJ0009       ELSE                                                               
DJ0009             PERFORM 7805-BOND-NOT-FOUND THRU 7805-EXIT                   
DJ0009       END-IF                                                             
           END-IF.                                                              
                                                                                
       7800-EXIT. EXIT.                                                         
      /                                                                         
DJ0009 7803-BOND-FOUND.                                                         
           ADD 1 TO W-MSD-FND-CNT                                               
           ADD 1 TO W-BOND-FND-CNT                                              
           MOVE 'N'           TO W-MSD-NOTFND-SW                                
           IF W-NSCC-SETTLE-CLOSE                                               
LRM017     AND (W-NSCC-AT-STL-LOC = '10' OR '50')                               
           AND W-NSCC-TI-TFR-TYPE NOT = 'RCR'                                   
                   IF SECURITY-ADP-NBR  OF DCLVASSET = ' '                      
                      DISPLAY 'INP=' W-INFILE-CNT                               
                           ' ' SV-CLIENT-NBR,                                   
                           ' ' W-NSCC-ACAT-CTL-NBR                              
                       ' SEQ=' W-NSCC-AT-ASSET-SEQ-NBR                          
DJ0007                    ' SETTLE-CLOSE'                                       
                          ' SEC=' W-NSCC-AT-SEC-ID                              
                          ' OLD=' SECURITY-ADP-NBR  OF DCLVASSET                
                          ' NEW=' MS-ADP-NO      '(NOT REPLACED3)'              
                   END-IF                                                       
           ELSE                                                                 
              MOVE MS-ADP-NO  TO SECURITY-ADP-NBR OF DCLVASSET                  
           END-IF                                                               
           MOVE ' '           TO W-NSCC-AT-ASSET-DESC                           
           MOVE MS-DESC1      TO W-NSCC-AT-ASSET-DESC (1:30)                    
           MOVE MS-DESC2      TO W-NSCC-AT-ASSET-DESC (31:30)                   
           MOVE MS-DESC3      TO W-NSCC-AT-ASSET-DESC (61:30)                   
           MOVE MS-ADP-NO     TO WK-POS-DESC5-SEC                               
           MOVE WK-POS-DESC5  TO W-NSCC-AT-ASSET-DESC (121:20)                  
DJ0007     IF W-NSCC-AT-SEC-ID = ' '                                            
DJ0007        IF  MS-CUSIP-NO > ' '                                             
DJ0007            MOVE 'US'        TO W-NSCC-AT-SEC-CNTRY-CD                    
DJ0007            MOVE MS-CUSIP-NO TO W-NSCC-AT-SEC-ID                          
DJ0007        ELSE                                                              
DJ0007         IF MSD-ISIN > ' '                                                
DJ0007            MOVE MSD-ISIN(1:2)  TO W-NSCC-AT-SEC-CNTRY-CD                 
DJ0007            MOVE MSD-ISIN(3:9)  TO W-NSCC-AT-SEC-ID                       
DJ0007            MOVE MSD-ISIN(12:1) TO W-NSCC-AT-SEC-CHKDGT                   
DJ0007         ELSE                                                             
DJ0007             MOVE 'US'        TO W-NSCC-AT-SEC-CNTRY-CD                   
DJ0007             MOVE 'XX'        TO W-NSCC-AT-SEC-ID (1:2)                   
DJ0007             MOVE MS-ADP-NO   TO W-NSCC-AT-SEC-ID (3:7)                   
DJ0007         END-IF                                                           
DJ0007        END-IF                                                            
DJ0007     END-IF.                                                              
DJ0009 7803-EXIT. EXIT.                                                         
      /                                                                         
DJ0009 7805-BOND-NOT-FOUND.                                                     
LRM        IF NOT W-NSCC-SETTLE-CLOSE                                           
             OR  W-NSCC-TI-TFR-TYPE  = 'RCR'                                    
              MOVE ' '        TO SECURITY-ADP-NBR OF DCLVASSET                  
           END-IF                                                               
           ADD 1 TO W-MSD-NOTFND-CNT                                            
           ADD 1 TO W-BOND-NOTFND-CNT                                           
           MOVE 'Y'         TO W-MSD-NOTFND-SW                                  
           MOVE ' '         TO SECURITY-ADP-NBR   OF DCLVASSET                  
           MOVE 'Y'         TO ISIN-SEC-EXCPT-IND OF DCLVASSET                  
           DISPLAY 'INP=' W-INFILE-CNT                                          
DJ0007        ' ' SV-CLIENT-NBR ' ' W-BRANCH-CD W-ACCT-CD                       
DJ0007        ' ' W-NSCC-ACAT-CTL-NBR ' ' W-NSCC-AT-ASSET-SEQ-NBR               
DJ0007        ' BOND-NOTFD'                                                     
DJ0007        ' ISN=' W-NSCC-AT-SEC-CNTRY-CD                                    
DJ0007                 W-NSCC-AT-SEC-ID                                         
DJ0007                 W-NSCC-AT-SEC-CHKDGT                                     
                  ' CT=' W-NSCC-AT-ASSET-PRC-CATG                               
                  ' SL=' W-NSCC-AT-STL-LOC                                      
                  ' RS=' W-NSCC-AT-STL-LOC-RSN-CD                               
                  ' WH=' W-NSCC-AT-WHN-ISS-IND                                  
                  ' BD=' W-NSCC-AT-BEARER-BOND                                  
                  ' OP=' W-NSCC-AT-OPT-CATG                                     
                  ' CU=' W-NSCC-AT-ISO-CURCY-CD                                 
           DISPLAY '    '                                                       
                  'DESC=' W-NSCC-AT-ASSET-DESC (1:110)                          
DJ0007            '     ' W-NSCC-AT-ASSET-DESC (111:30) '<='.                   
DJ0009 7805-EXIT. EXIT.                                                         
      /                                                                         
       7810-BEARER-BOND.                                                        
                                                                                
DJ0007     MOVE W-GETXRF-KEY-9       TO GETXRF-SEARCH-KEY (1:9)                 
                                                                                
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7810-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7810-EXIT                                                   
           END-IF.                                                              
                                                                                
       7810-EXIT. EXIT.                                                         
      /                                                                         
       7820-MUNI-BOND.                                                          
                                                                                
DJ0007     MOVE W-GETXRF-KEY-9       TO GETXRF-SEARCH-KEY (1:9)                 
                                                                                
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7820-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7820-EXIT                                                   
           END-IF.                                                              
                                                                                
       7820-EXIT. EXIT.                                                         
      /                                                                         
       7830-REGISTERED-BOND.                                                    
                                                                                
DJ0007     MOVE W-GETXRF-KEY-9       TO GETXRF-SEARCH-KEY (1:9)                 
                                                                                
           MOVE '060'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '020'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '040'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '050'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '010'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '000'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7830-EXIT                                                   
           END-IF.                                                              
                                                                                
           MOVE '030'                TO GETXRF-SEARCH-KEY (10:3)                
           PERFORM 7840-GETXREF THRU 7840-EXIT                                  
           IF GETXRF-RETURN-VALID                                               
              GO TO 7830-EXIT                                                   
           END-IF.                                                              
                                                                                
       7830-EXIT. EXIT.                                                         
      /                                                                         
       7840-GETXREF.                                                            
                                                                                
           MOVE ' '          TO GETMSD-RETURN-CODE                              
           MOVE ' '          TO GETXRF-RETURN-CODE                              
           MOVE ' '          TO MSD-XREF-RECORD-AREA                            
           CALL GETXREF USING GETXRF-CALLING-INFO.                              
           EVALUATE TRUE                                                        
               WHEN  GETXRF-RETURN-VALID                                        
                                                                                
DJ0005             MOVE LOW-VALUES       TO GETMSD-SEARCH-KEY-AREA              
                   MOVE MSXREF-ADP-NO    TO GETMSD-SEARCH-KEY                   
                   MOVE ZERO             TO GETMSD-WI-CODE                      
DJ0005             MOVE WS-ADP-CLIENT    TO GETMSD-CLIENT-PL2                   
DJ0009             PERFORM 7900-CALL-GETMSDC     THRU 7900-EXIT                 
                                                                                
                   IF GETMSD-RETURN-VALID                                       
                      MOVE MS-SYMBOL           TO FMT-SEC-SYMBOL                
                      MOVE MS-ADP-NO           TO FMT-ADP-SEC-NO                
                      MOVE MS-CUSIP-AREA       TO FMT-CUSIP-NO                  
                      MOVE MS-DESC1            TO FMT-DESC1                     
                      MOVE MS-DESC2            TO FMT-DESC2                     
                      MOVE MS-DESC3            TO FMT-DESC3                     
                   ELSE                                                         
                     DISPLAY 'INP=' W-INFILE-CNT                                
                     ' BOND MSDFD'                                              
                     ' SEC=' W-NSCC-AT-SEC-ID                                   
                     ' CTG=' W-NSCC-AT-ASSET-PRC-CATG                           
                     ' BND=' W-NSCC-AT-BEARER-BOND                              
                     ' KEY=' GETXRF-SEARCH-KEY                                  
                     ' ADP=' MSXREF-ADP-NO                                      
                   END-IF                                                       
                                                                                
               WHEN  GETXRF-RETURN-EOF                                          
                 OR  GETXRF-INVALID-SYMBOL-CUSIP                                
                 OR  GETXRF-RETURN-REC-NOT-FOUND                                
                 OR  GETXRF-REQ-KEY-SECURITY-NO                                 
                   CONTINUE                                                     
                                                                                
               WHEN  GETXRF-RETURN-IO-ERROR                                     
                     DISPLAY ' CAT710: CALL GETXREF ERROR'                      
                             ' GETXRF-RETURN-CODE='                             
                               GETXRF-RETURN-CODE                               
                     DISPLAY ' GETXRF-CALLING-INFO='                            
                               GETXRF-CALLING-INFO                              
                     DISPLAY ' MSD-XREF-RECORD-AREA='                           
                               MSD-XREF-RECORD-AREA                             
                     MOVE +3705    TO ABEND-CODE                                
                     CALL ABEND USING ABEND-CODE                                
               WHEN  OTHER                                                      
                   CONTINUE                                                     
           END-EVALUATE.                                                        
                                                                                
       7840-EXIT. EXIT.                                                         
      /                                                                         
       7900-CALL-GETMSDC.                                                       
                                                                                
DJ0009     MOVE 'N'  TO W-PRNGFL-SW                                             
           CALL GETMSDC USING MASTER-SECURITY-RECORD                            
           IF  GETMSD-RETURN-VALID                                              
               IF  W-NSCC-DIST-PARTICIPANT   = W-NSCC-TI-RCV-NBR                
                   PERFORM 7910-CHECK-PRNGFL     THRU 7910-EXIT                 
               END-IF                                                           
           END-IF.                                                              
                                                                                
       7900-EXIT. EXIT.                                                         
      /                                                                         
       7910-CHECK-PRNGFL.                                                       
DJ0009***IF PRIVATE RANGE FOUND THAT BELONGS TO SOMEONE ELSE,                   
DJ0009***SET GETMSD-RETURN-REC-NOT-FOUND TO TRUE                                
           MOVE '7910-CHECK-PRNGFL             ' TO W-ROUTINE.                  
                                                                                
           MOVE SPACES                      TO PRNGREC                          
           MOVE MS-ADP-NO                   TO PRNGKEY                          
                                                                                
           START PRNGFL KEY NOT < PRNGKEY                                       
                                                                                
           IF PRNGFL-OKAY                                                       
              CONTINUE                                                          
           ELSE                                                                 
             IF PRNGFL-END-OF-FILE                                              
             OR PRNGFL-NOT-FOUND                                                
                GO TO 7910-EXIT                                                 
             ELSE                                                               
                DISPLAY ' ** CAT710 - PRNGFL FILE, START BROWSE ERROR'          
                        ' FILE-STATUS = ' PRNGFL-STAT                           
                DISPLAY 'W-PRNGFL-KEY = ' MS-ADP-NO                             
                MOVE +3105    TO ABEND-CODE                                     
                CALL ABEND USING ABEND-CODE                                     
             END-IF                                                             
           END-IF.                                                              
                                                                                
       7910-READ-PRNGFL-NEXT.                                                   
                                                                                
           READ PRNGFL NEXT RECORD.                                             
                                                                                
           IF PRNGFL-OKAY                                                       
              CONTINUE                                                          
           ELSE                                                                 
             IF PRNGFL-END-OF-FILE                                              
                GO TO 7910-EXIT                                                 
             ELSE                                                               
                DISPLAY ' ** CAT710 - PRNGFL FILE, READ NEXT ERROR'             
                        ' FILE-STATUS = ' PRNGFL-STAT                           
                DISPLAY 'W-PRNGFL-KEY = ' PRNGKEY                               
                MOVE +3106    TO ABEND-CODE                                     
                CALL ABEND USING ABEND-CODE                                     
             END-IF                                                             
           END-IF.                                                              
                                                                                
                                                                                
           EVALUATE TRUE                                                        
               WHEN ((MS-ADP-NO       < PRSECLO)                                
                          OR                                                    
                    (PRCLNT  =  '000' OR '096'))                                
                    MOVE 'N'  TO W-PRNGFL-SW                                    
               WHEN OTHER                                                       
                 IF   PRCLNT   = WS-ADP-CLIENT (2 : 3)                          
                   OR PRACLNT1 = WS-ADP-CLIENT (2 : 3)                          
                   OR PRACLNT2 = WS-ADP-CLIENT (2 : 3)                          
                   OR PRACLNT3 = WS-ADP-CLIENT (2 : 3)                          
                   OR PRACLNT4 = WS-ADP-CLIENT (2 : 3)                          
                   OR PRACLNT5 = WS-ADP-CLIENT (2 : 3)                          
                   OR PRACLNT6 = WS-ADP-CLIENT (2 : 3)                          
                   OR PRACLNT7 = WS-ADP-CLIENT (2 : 3)                          
                    CONTINUE                                                    
                   ELSE                                                         
                    MOVE 'Y'  TO W-PRNGFL-SW                                    
                    SET GETMSD-RETURN-REC-NOT-FOUND TO TRUE                     
                    DISPLAY 'INP=' W-INFILE-CNT                                 
DJ0007              ' ' SV-CLIENT-NBR ' ' W-BRANCH-CD W-ACCT-CD                 
DJ0007              ' ' W-NSCC-ACAT-CTL-NBR ' ' W-NSCC-AT-ASSET-SEQ-NBR         
DJ0009                     ' PRNGFL FOUND: SEC:' MS-ADP-NO                      
DJ0009                     ' CLT:' PRCLNT ' DESC:' MS-DESC1                     
DJ0009              DISPLAY '    GETMSD-KEY:' GETMSD-SEARCH-KEY                 
DJ0009                     ' SEC:' MS-ADP-NO                                    
DJ0009                     ' PRIVATE RANGE BELONGS TO CLT '  PRCLNT             
DJ0009                     '. FLAG AS MSD NOT FOUND'                            
                   END-IF                                                       
           END-EVALUATE.                                                        
                                                                                
       7910-EXIT. EXIT.                                                         
      /                                                                         
       8000-ABEND-ROUTINE.                                                      
                                                                                
           DISPLAY '!!!! 8000-ABEND-ROUTINE '                                   
           DISPLAY '    CAT710: INPUT-CNT = ' W-INFILE-CNT                      
                   ' VTRNFR-NOT-FOUND-CNT = ' VTRNFR-NOTFND-CNT                 
           DISPLAY ' CAT710 - BAD RECORD TYPE'                                  
           DISPLAY '  '  W-NSCC-COMMON-AREA                                     
                                                                                
           CALL ABEND USING ABEND-CODE.                                         
                                                                                
       8000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       8100-SQL-COMMIT     SECTION.                                             
                                                                                
           EXEC SQL COMMIT                                                      
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO COMMIT-SQLCA                                         
           MOVE SQLCODE TO COMMIT-RETURN                                        
                                                                                
           IF  COMMIT-AB                                                        
               ACCEPT W-SYS-DATE              FROM DATE                         
               ACCEPT W-SYS-TIME              FROM TIME                         
               DISPLAY 'TIME=' W-SYS-TIME ' COMMIT FAILED '                     
                          ' RC=' COMMIT-RETURN                                  
                     ' INP-CNT=' W-INFILE-CNT                                   
                         ' REC=' W-NSCC-RECORD (1:60)                           
           ELSE                                                                 
               CONTINUE                                                         
***************ACCEPT*W-SYS-DATE**************FROM*DATE*****************        
***************ACCEPT*W-SYS-TIME**************FROM*TIME*****************        
***************DISPLAY*'TIME='*W-SYS-TIME*'*COMMITED'*******************        
*********************'*INP-CNT='*W-INFILE-CNT***************************        
*************************'*REC='*W-NSCC-RECORD*(1:60)*******************        
           END-IF.                                                              
                                                                                
           MOVE W-INFILE-CNT            TO W-LAST-COMMIT-INFILE-CNT             
           .                                                                    
       8100-EXIT. EXIT.                                                         
      /                                                                         
       8200-SQL-ROLLBACK   SECTION.                                             
           DISPLAY '8200-SQL-ROLLBACK'                                          
                     ' INP-CNT='           W-INFILE-CNT                         
                         ' REC=' W-NSCC-RECORD (1:31)                           
                  ' LAST-COMMIT-INFILE-CNT = '                                  
                                            W-LAST-COMMIT-INFILE-CNT            
                                                                                
           EXEC SQL ROLLBACK WORK                                               
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO ROLLBACK-SQLCA                                       
           MOVE SQLCODE TO ROLLBACK-RETURN                                      
                                                                                
           IF ROLLBACK-AB                                                       
               DISPLAY 'CAT710: '                                               
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '                   
                   ROLLBACK-RETURN                                              
           ELSE                                                                 
               DISPLAY 'CAT710: '                                               
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '               
                   ROLLBACK-RETURN                                              
           END-IF.                                                              
                                                                                
       8200-EXIT. EXIT.                                                         
      /                                                                         
       8500-SQL-ERROR-ROUTINE.                                                  
                                                                                
           CALL DSNTIAR               USING  SQLCA                              
                                             WS-DB2-MESSAGE-AREA                
                                             WS-ERR-LINE-LEN                    
                                                                                
           DISPLAY ' '                                                          
                                                                                
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
              UNTIL WS-ERROR-INDEX GREATER THAN 12                              
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                      
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)                
                 END-IF                                                         
           END-PERFORM                                                          
           DISPLAY ' '                                                          
           DISPLAY ' *** CAT710 ABENDED ****'                                   
           DISPLAY ' ACAT-CLIENT IS : ' WS-CLIENT-NBR.                          
           DISPLAY ' ACAT-CONTROL-NBR = ' WS-ACAT-CNTL-NBR.                     
           DISPLAY ' INPUT RECORD = ' W-NSCC-RECORD                             
           DISPLAY ' '                                                          
                                                                                
           PERFORM 8200-SQL-ROLLBACK THRU 8200-EXIT                             
                                                                                
           DISPLAY 'CAT710: U3999 - ABENDING ON BAD DB2 STATUS'                 
           DISPLAY 'CAT710: PROGRAM ENDED ABNORMALLY'                           
           MOVE +3999    TO ABEND-CODE                                          
           CALL ABEND USING ABEND-CODE.                                         
                                                                                
       9000-CLOSE-ACATPOSN.                                                     
           CLOSE NSCC-POSITION-FILE.                                            
           DISPLAY 'CAT710: ACATPOSN CLOSED. STATUS = '                         
                                                 ACATPOSN-STAT                  
                                                                                
           CLOSE PRNGFL                                                         
           DISPLAY 'CAT710: PRNGFL   CLOSED. STATUS = '                         
                                             PRNGFL-STAT.                       
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'ACATPOSN CLOSED. STATUS = ' ACATPOSN-STAT.                  
           DISPLAY '## INPUT RECORD COUNT = ' W-INFILE-CNT      ' ##'.          
           DISPLAY '## NSCC TIF INPUT CNT = ' NSCC-TIF-CNT      ' ##'.          
           DISPLAY '## NSCC ASSET INP CNT = ' NSCC-ASSET-CNT    ' ##'.          
           DISPLAY '## W-NO-CLT-CNT       = ' W-NO-CLT-CNT      ' ##'.          
           DISPLAY ' '                                                          
           DISPLAY '## TIF FOUND COUNT    = ' VTRNFR-FND-CNT    ' ##'.          
           DISPLAY '## TIF UPDATED COUNT  = ' VTRNFR-UPDT-CNT   ' ##'.          
           DISPLAY '## TIF NOT FOUND CNT  = ' VTRNFR-NOTFND-CNT ' ##'.          
           DISPLAY '## TRNFR INSERTED     = ' W-VTRNFR-INSERTED-CNT             
                                                                ' ##'.          
           DISPLAY '## TRNFR NOT INSERTED = ' W-VTRNFR-NOT-INSERTED-CNT         
                                                                ' ##'.          
           DISPLAY ' '                                                          
           DISPLAY '## NSCC REG ASSET CNT = ' NSCC-REG-ASSET-CNT ' ##'.         
           DISPLAY '## NSCC OPT   INP CNT = ' NSCC-OPTION-CNT   ' ##'.          
           DISPLAY '## NSCC MF    INP CNT = ' NSCC-MF-CNT       ' ##'.          
           DISPLAY ' '                                                          
           DISPLAY '## ASSET FOUND COUNT  = ' VASSET-FND-CNT    ' ##'.          
           DISPLAY '## ASSET UPDATED CNT  = ' VASSET-UPDT-CNT   ' ##'.          
           DISPLAY '## ASSET NOTFOUND CNT = ' VASSET-NOTFND-CNT ' ##'.          
           DISPLAY '## ASSET NOT UPDATED  = ' VASSET-NOT-UPDATED-CNT            
                                                                ' ##'.          
           DISPLAY '## ASSET INSERTED     = ' W-VASSET-INSERTED-CNT             
                                                                ' ##'.          
           DISPLAY '## ASSET NOT INSERTED = ' W-VASSET-NOT-INSERTED-CNT         
                                                                ' ##'.          
           DISPLAY '## OPTN  FOUND COUNT  = ' VOPTN-FND-CNT     ' ##'.          
           DISPLAY '## OPTN  NOTFOUND CNT = ' VOPTN-NOTFND-CNT  ' ##'.          
           DISPLAY '## OPTN  INSERTED     = ' W-VOPTN-INSERTED-CNT              
                                                                ' ##'.          
           DISPLAY '## OPTN  NOT INSERTED = ' W-VOPTN-NOT-INSERTED-CNT          
                                                                ' ##'.          
           DISPLAY '## MF    FOUND COUNT  = ' VMF-FND-CNT       ' ##'.          
           DISPLAY '## MF    NOTFOUND CNT = ' VMF-NOTFND-CNT    ' ##'.          
           DISPLAY '## MF    INSERTED     = ' W-VMF-INSERTED-CNT                
                                                                ' ##'.          
           DISPLAY '## MF    NOT INSERTED = ' W-VMF-NOT-INSERTED-CNT            
                                                                ' ##'.          
           DISPLAY ' '                                                          
           DISPLAY '## W-MSD-FND-CNT      = ' W-MSD-FND-CNT     ' ##'.          
           DISPLAY '## W-MSD-NOTFND-CNT   = ' W-MSD-NOTFND-CNT  ' ##'.          
           DISPLAY '## W-XRF-FND-CNT      = ' W-XRF-FND-CNT     ' ##'.          
           DISPLAY '## W-XRF-NOTFND-CNT   = ' W-XRF-NOTFND-CNT  ' ##'.          
           DISPLAY '## W-BOND-FND-CNT     = ' W-BOND-FND-CNT    ' ##'.          
           DISPLAY '## W-BOND-NOTFND-CNT  = ' W-BOND-NOTFND-CNT ' ##'.          
DJ0007     DISPLAY '## W-ISIN-FND         = ' W-ISIN-FND-CNT                    
DJ0007     DISPLAY '## W-ISIN-NOTFND      = ' W-ISIN-NOTFND-CNT                 
DJ0007     DISPLAY '## W-SUB-ISIN-FND     = ' W-SUB-ISIN-FND-CNT                
DJ0007     DISPLAY '## W-SUB-ISIN-NOTFND  = ' W-SUB-ISIN-NOTFND-CNT             
           DISPLAY '## W-BLANK-SEC-CNT    = ' W-BLANK-SEC-CNT   ' ##'.          
           DISPLAY '## W-NSET-CNT         = ' W-NSET-CNT        ' ##'.          
           DISPLAY '## WS-SETTLED-CNT     = ' WS-SETTLED-CNT    ' ##'.          
TCKNEW     DISPLAY '## WS-VALUE-FREE-CNT  = ' WS-VALUE-FREE-CNT ' ##'.          
DJ0010     DISPLAY '## W-AUCTION-RATE-CNT = ' W-AUCTION-RATE-CNT ' ##'.         
       9000-EXIT.                                                               
           EXIT.                                                                
      *#################################################################        
