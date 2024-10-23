000001* PDX    - CAT950   C0348882 12/06/13 06:53:40 TBCHKOP            00001000
CSG001* SSR 91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.                         
000001* PDX    - CAT950   C0325207 04/16/12 09:08:21 TBLAMUR            00001000
LRM011* SSR 85040 DONT REQUIRE OPTION EXP DATE ON DELETE RECORDS.               
000001* PDX    - CAT950   C0322641 02/22/12 11:35:48 TBLAMUR            00001000
LRM010* SSR 82993 ADD PARM FOR CYCLE NUMBER, AND VERIFY IF PRESENT.             
000001* PDX    - CAT950   C0314678 07/26/11 09:31:46 TBLAMUR            00001000
LRM009* SSR 78541 EXPAND ASSET LIMIT ON PTR TO 10,000                           
000001* PDX    - CAT950   C0293936 04/12/10 13:52:22 TBLAMUR            00001000
LRM008* SSR 69229 ALLOW MUTIPLE SETS OF PTF IN SAME RUN WITH                    
LRM008*   SAME KEYS.  BUILD CONTROL NUMBER XX### AS NEEDED.                     
LRM008*   VERIFY THE SAME PTF ASSET IS NOT ON ANOTHER PTF (DUPE).               
000001* PDX    - CAT950   C0290020 01/06/10 07:24:56 TBLAMUR            00001000
LRM007* SSR 59603 OPTION SYMB; REMOVE HARDCODE Q STREAM;                        
LRM007* ALSO RELAX EDIT FOR PTF DELIVERIES.                                     
000001* PDX    - CAT950   C0286877 11/19/09 13:51:36 TBLAMUR            00001000
LRM006* SSR 59603 OPTION SYMBOLOGY CHANGES, PHASE I. HARD CODE                  
LRM006*   Q STREAM ONLY TO FORMAT TO NEW OPTION ASSET INPUT TO NSCC.            
000001* PDX    - CAT950   C0279843 05/11/09 09:00:06 TBLAMUR            00001000
LRM005* SSR 64012 LOOK FOR ADP-SEC: LABEL IN ASSET DESCRIPTION WHICH            
LRM005*   MAY OPTIONALLY BE PROVIDED ON THE CLIENT FEED.                        
LRM005*   ADD PTF RULES THE SAME AS PTR.                                        
000001* PDX    - CAT950   C0240752 11/16/06 09:04:40 TBLAMUR            00001000
LRM004* SSR 49202 ADD GIFT IND FOR PTD                                          
000001* PDX    - CAT950   C0235319 05/25/06 11:30:56 TBLAMUR            00001000
LRM003* SSR 39867 FIX PTD DELIVERY SIDE ISSUE.                                  
000001* PDX    - CAT950   C0227519 11/08/05 13:24:40 TBLAMUR            00001000
LRM002* ALLOW PTR FULL POSITION REQUEST                                         
000001* PDX    - CAT950   C0222270 07/27/05 14:09:21 TBLAMUR            00001000
LRM001* SSR 39867 RECOGNIZE DELIVERY SIDE TIFS AND ASSETS                       
LRM001* SSR 38813 CLIENT 39 FEED (CHANGE TO MULTI CLIENT PROCESS)               
000001* PDX    - CAT950   C0215263 12/30/04 16:09:21 TBLAMUR            00001000
LRM000* SSR 40042 REPLACE DB2 INIT TBL WITH ACTI*** NEW KEY STRUCTURE.          
000001* PDX    - CAT950   C0196416 06/15/04 08:16:22 TBLAMUR            00001000
000001* PDX    - CAT950   C0196253 09/29/03 12:33:33 TBLAMUR            00001000
000001* PDX    - CAT950   C0196331 09/29/03 11:08:04 TBLAMUR            00001000
000001* PDX    - CAT950   C0172274 03/11/02 11:48:41 TBLAMUR            00001000
000001* PDX    - CAT950   C0158537 06/25/01 16:27:42 TBDOJUN            00001000
      * DJ0001 SSR# R5246800 NEW TRANSFER TYPE MFC -MUTUAL FUND CLEANUP 00001000
      *          EXPAND MF RECORD LENGTH FROM 465 TO 550                00001000
000001* PDX    - CAT950   C0149989 02/08/01 15:02:20 TBTIKUO            00001000
000001* PDX    - CAT950   C0124208 04/07/99 14:15:54 TBLAMUR            00001000
000001* PDX    - CAT950   C0118401 11/20/98 14:50:14 TBLAMUR            00001000
000001* PDX    - CAT950   C0115132 10/30/98 15:58:41 TBTARYB            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT950.                                                     
       AUTHOR.      T. RYBALOVA.                                                
       DATE-WRITTEN.  SEPTEMBER 1998.                                           
                                                                                
      ******************************************************************        
      *                        REMARKS                                 *        
      ******************************************************************        
      * THIS PROGRAM READS A FILE FROM E.D. JONES, AND INSERTS THE READ*        
      * RECORDS INTO ACTITRF, ACTIAST, ACTIOPN AND ACTIMF TABLES.      *        
      * E.D. JONES FILE SHOULD CONTAIN ONLY 'TI' AND 'AT' RECORDS WITH *        
      * TRANSFER TYPES OF 'FUL' AND 'PTR' ONLY.                        *        
      ******************************************************************        
                                                                                
           EJECT                                                                
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
      *****************************************************************         
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INPACAT-FILE                  ASSIGN  TO  INPACAT.            
                                                                                
           SELECT OUTACAT-FILE                  ASSIGN  TO  OUTACAT.            
                                                                                
      *****************************************************************         
       DATA DIVISION.                                                           
      *****************************************************************         
                                                                                
       FILE SECTION.                                                            
                                                                                
       FD  INPACAT-FILE                                                         
           RECORDING MODE IS V                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  INPACAT-REC                            PIC  X(2991).                 
                                                                                
       FD  OUTACAT-FILE                                                         
           RECORDING MODE IS V                                                  
           BLOCK CONTAINS 0 RECORDS                                             
           DATA RECORDS ARE                                                     
           OUTACAT-REC                                                          
           OUTACAT-HEADER-TRAILER                                               
           OUTACAT-TI-REC                                                       
           OUTACAT-AT-REC OUTACAT-AT-OPTN-REC OUTACAT-AT-MF-REC.                
                                                                                
       01  OUTACAT-REC                            PIC  X(2991).                 
                                                                                
       01  OUTACAT-HEADER-TRAILER                 PIC  X(080).                  
                                                                                
       01  OUTACAT-TI-REC                         PIC  X(356).                  
                                                                                
       01  OUTACAT-AT-REC                         PIC  X(431).                  
                                                                                
       01  OUTACAT-AT-OPTN-REC.                                                 
           05  OUTACAT-AT-BASIC1                  PIC  X(431).                  
           05  OUTACAT-AT-OPTN                    PIC  X(066).                  
                                                                                
       01  OUTACAT-AT-MF-REC.                                                   
           05  OUTACAT-AT-BASIC2                  PIC  X(431).                  
DJ0001     05  OUTACAT-AT-MF                      PIC  X(119).                  
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
       77  ABEND-CODE                 COMP  PIC S9(04)   VALUE +9999.           
       77  WS-CURRENT-REC                   PIC  X(02)   VALUE SPACES.          
       77  WS-PREV-REC                      PIC  X(02)   VALUE SPACES.          
       77  S1                               PIC  9(03)   VALUE ZEROES.          
       77  S2                               PIC  9(03)   VALUE ZEROES.          
       77  S3                               PIC  9(05)   VALUE ZEROES.          
       77  NUMBER-OF-INT-POS                PIC  9(03)   VALUE ZEROES.          
       77  NUMBER-OF-DEC-POS                PIC  9(03)   VALUE ZEROES.          
       77  WS-STTLM-ASCTD-DT                PIC  X(10).                         
       77  WS-PRCS-DT                       PIC  X(10).                         
       77  WS-ASSET-SEQ-NBR         COMP    PIC S9(04)   VALUE ZEROES.          
       77  WS-ASSET-QTY             COMP-2               VALUE ZEROES.          
       77  WS-ASSET-PCT             COMP-2               VALUE ZEROES.          
       77  WS-ASSET-AMT             COMP-2               VALUE ZEROES.          
       77  WS-EXPTN-DT                      PIC  X(10).                         
       77  WS-STPRC-INTEGER-AMT     COMP    PIC S9(04)   VALUE ZEROES.          
       77  WS-STPRC-FRCTN-AMT       COMP    PIC S9(04)   VALUE ZEROES.          
LRM009 77  SUB                              PIC  9(05)   VALUE ZEROES.          
LRM001 77  WS-BKR-CLR-NO                    PIC  X(04).                         
LRM008 77  WS-NEXT-CNTL-NBR                 PIC 9(3)  VALUE  001.               
LRM008 77  WS-ACAT-CONTROL-NBR              PIC X(14).                          
                                                                                
       01  CLIENT-NBR-1.                                                        
           05  FILLER                       PIC  X(01)   VALUE '0'.             
           05  WS-CLIENT-NBR                PIC  9(03)   VALUE ZEROES.          
       01  CLIENT-NUMBER REDEFINES                                              
           CLIENT-NBR-1                     PIC  X(04).                         
                                                                                
       01  HOLD-KEY.                                                            
           05  HOLD-KEY-RCV-NBR             PIC  X(04).                         
           05  HOLD-KEY-DLVR-NBR            PIC  X(04).                         
           05  HOLD-KEY-TRANS-REF-ID        PIC  X(20).                         
                                                                                
       01  FILLER                           PIC  X(12)   VALUE                  
           'FLAGS AREA'.                                                        
                                                                                
       01  FILLER.                                                              
           05  EOF-SW                       PIC  X(01).                         
               88  EOF-YES                               VALUE 'Y'.             
               88  EOF-NO                                VALUE 'N'.             
           05  TRAILER-FOUND-SW             PIC  X(01).                         
               88  TRAILER-FOUND                         VALUE 'Y'.             
               88  TRAILER-NOT-FOUND                     VALUE 'N'.             
           05  EOF-SORT-SW                  PIC  X(01).                         
               88  EOF-SORT-YES                          VALUE 'Y'.             
               88  EOF-SORT-NO                           VALUE 'N'.             
           05  TI-EDIT-CHECK-FLAG           PIC  X(01).                         
               88  TI-EDIT-CHECK-OK                      VALUE 'Y'.             
               88  TI-EDIT-CHECK-NOT-OK                  VALUE 'N'.             
           05  AT-EDIT-CHECK-FLAG           PIC  X(01).                         
               88  AT-EDIT-CHECK-OK                      VALUE 'Y'.             
               88  AT-EDIT-CHECK-NOT-OK                  VALUE 'N'.             
           05  AT-FOUND-SW                  PIC  X(01).                         
               88  AT-FOUND                              VALUE 'Y'.             
               88  AT-NOT-FOUND                          VALUE 'N'.             
           05  AT-EDITED-FLAG               PIC  X(01).                         
               88  AT-EDITED                             VALUE 'Y'.             
               88  AT-NOT-EDITED                         VALUE 'N'.             
           05  STOP-OK-SW                   PIC  X(01).                         
               88  STOP-OK                               VALUE 'Y'.             
               88  STOP-NOT-OK                           VALUE 'N'.             
           05  GOOD-EDIT-FLAG               PIC  X(01).                         
               88  GOOD-EDIT                             VALUE 'G'.             
               88  BAD-EDIT                              VALUE 'B'.             
                                                                                
       01  AT-STORAGE-AREA.                                                     
LRM009     05  AT-STORAGE OCCURS 10000 TIMES  PIC  X(550).                      
                                                                                
       01  WS-QTY-TABLE.                                                        
           05  WS-QTY-LIT OCCURS 17 TIMES   PIC  X(01).                         
                                                                                
       01  WS-PRCNT-TABLE.                                                      
           05  WS-PRCNT-LIT OCCURS 15 TIMES PIC  X(01).                         
                                                                                
       01  WS-AMT-TABLE.                                                        
           05  WS-AMT-LIT OCCURS 17 TIMES   PIC  X(01).                         
                                                                                
       01  FILLER                           PIC  X(20)   VALUE                  
           'QTY+PRCNT WORK AREA'.                                               
       01  FILLER.                                                              
                                                                                
           05  WS-QTY1.                                                         
               10  WS-QTY-INT-1             PIC  9(15).                         
               10  WS-QTY-DEC-1             PIC  9(01).                         
           05  WS-QTY-1 REDEFINES WS-QTY1   PIC  9(15)V9(01).                   
                                                                                
           05  WS-QTY2.                                                         
               10  WS-QTY-INT-2             PIC  9(14).                         
               10  WS-QTY-DEC-2             PIC  9(02).                         
           05  WS-QTY-2 REDEFINES WS-QTY2   PIC  9(14)V9(2).                    
                                                                                
           05  WS-QTY3.                                                         
               10  WS-QTY-INT-3             PIC  9(13).                         
               10  WS-QTY-DEC-3             PIC  9(03).                         
           05  WS-QTY-3 REDEFINES WS-QTY3   PIC  9(13)V9(03).                   
                                                                                
           05  WS-QTY4.                                                         
               10  WS-QTY-INT-4             PIC  9(12).                         
               10  WS-QTY-DEC-4             PIC  9(04).                         
           05  WS-QTY-4 REDEFINES WS-QTY4   PIC  9(12)V9(04).                   
                                                                                
           05  WS-PRCNT1.                                                       
               10  WS-PRCNT-INT-1           PIC  9(13).                         
               10  WS-PRCNT-DEC-1           PIC  9(01).                         
           05  WS-PRCNT-1 REDEFINES                                             
               WS-PRCNT1                    PIC  9(13)V9(01).                   
                                                                                
           05  WS-PRCNT2.                                                       
               10  WS-PRCNT-INT-2           PIC  9(12).                         
               10  WS-PRCNT-DEC-2           PIC  9(02).                         
           05  WS-PRCNT-2 REDEFINES                                             
               WS-PRCNT2                    PIC  9(12)V9(02).                   
                                                                                
           05  WS-PRCNT3.                                                       
               10  WS-PRCNT-INT-3           PIC  9(11).                         
               10  WS-PRCNT-DEC-3           PIC  9(03).                         
           05  WS-PRCNT-3 REDEFINES                                             
               WS-PRCNT3                    PIC  9(11)V9(03).                   
                                                                                
           05  WS-PRCNT4.                                                       
               10  WS-PRCNT-INT-4           PIC  9(10).                         
               10  WS-PRCNT-DEC-4           PIC  9(04).                         
           05  WS-PRCNT-4 REDEFINES                                             
               WS-PRCNT4                    PIC  9(10)V9(04).                   
                                                                                
           05  WS-AMT1.                                                         
               10  WS-AMT-INT               PIC  9(14).                         
               10  WS-AMT-DEC               PIC  9(02).                         
           05  WS-AMT REDEFINES WS-AMT1     PIC  9(14)V9(02).                   
                                                                                
LRM005     05  WS-ADP-NBR                   PIC  X(07).                         
       01  FILLER                           PIC  X(12)   VALUE                  
           'DATES AREA'.                                                        
                                                                                
       01  FILLER.                                                              
                                                                                
           05  WS-PROC-DATE-CCYYMMDD.                                           
               10  WS-PROC-CC               PIC  9(02).                         
               10  WS-PROC-YY               PIC  9(02).                         
               10  WS-PROC-MM               PIC  9(02).                         
               10  WS-PROC-DD               PIC  9(02).                         
           05  WS-PROC-DATE REDEFINES                                           
               WS-PROC-DATE-CCYYMMDD        PIC  9(08).                         
                                                                                
           05  WS-HDR-DATE-MMDDCCYY.                                            
               10  WS-HDR-DATE-MM           PIC  9(02).                         
               10  WS-HDR-DATE-DD           PIC  9(02).                         
               10  WS-HDR-DATE-CC           PIC  9(02).                         
               10  WS-HDR-DATE-YY           PIC  9(02).                         
           05  WS-HDR-DATE REDEFINES                                            
               WS-HDR-DATE-MMDDCCYY         PIC  9(08).                         
                                                                                
           05  WS-DB-DATE-CCYY-MM-DD.                                           
               10  WS-DB-DATE-CCYY          PIC  X(04).                         
               10  WS-DB-SEP1               PIC  X(01).                         
               10  WS-DB-DATE-MM            PIC  X(02).                         
               10  WS-DB-SEP2               PIC  X(01).                         
               10  WS-DB-DATE-DD            PIC  X(02).                         
           05  WS-DB-DATE REDEFINES                                             
               WS-DB-DATE-CCYY-MM-DD        PIC  X(10).                         
                                                                                
       01  VALID-ACCT-TYPES                 PIC  X(02).                         
           88  VALID-ACCT-TYPE  VALUE '4K' 'AG' 'BC' 'CO' 'CT' 'CU' 'DR'        
                                      'DR' 'EI' 'ES' 'IR' 'JT' 'MS' 'OT'        
                                      'QP' 'RI' 'SI' 'SN' 'TR'                  
LRM004                                'BI' 'BR' 'HS' '4B' '5P' '7B'.            
                                                                                
       01  VALID-REJECT-CODES               PIC  X(02).                         
           88  VALID-REJECT-CODE VALUE '21' '22' '23' '24' '25' '26'            
                                       '  '.                                    
           88  VALID-REJECT-CODE-FUL VALUE  '01' '02' '03' '04' '05'            
                                            '06' '07' '08' '09' '  '.           
                                                                                
       01  VALID-AT-REC-LENGTHS             PIC  9(04).                         
DJ0001     88  VALID-AT-REC-LENGTH VALUE 431 465 497 550.                       
                                                                                
       01  VALID-PRICE-CTGS                 PIC  X(04).                         
           88  VALID-PRICE-CTG VALUE 'ANNU' 'CDCP' 'CORP' 'EQU ' ' EQU'         
                                     'FCUR' 'FDEB' 'FEQU' 'GOVT' 'LPAR'         
                                     'MBS ' ' MBS' 'MFMM' 'MFNM' 'MUNI'         
                                     'OTH ' ' OTH' 'UARP' 'UDSC' 'UIT '         
                                     ' UIT' 'ZERO' '    '                       
LRM004                               'REGT' '90DR'.                             
                                                                                
       01  VALID-OPTION-CTGS                PIC  X(02).                         
           88  VALID-OPTION-CTG VALUE '00' '01' '02' '03'.                      
                                                                                
       01  VALID-STTLM-LCTNS                PIC  X(02).                         
           88  VALID-STTLM-LCTN VALUE '00' '05' '10' '15' '20' '25' '30'        
                                      '35' '40' '45' '50'.                      
                                                                                
       01  VALID-POSITION-CDS               PIC  X(01).                         
           88  VALID-POSITION-CD VALUE 'S' 'L' 'N'.                             
                                                                                
       01  VALID-WI-CDS                     PIC  X(01).                         
LRM001     88  VALID-WI-CD VALUE 'W' 'N' ' '.                                   
LRM001*****88  VALID-WI-CD VALUE 'W' 'N'.                                       
                                                                                
       01  VALID-REQ-SET-RSNS-35            PIC  X(04).                         
           88  VALID-REQ-SET-RSN-35 VALUE 'EXPO' 'OPT ' ' OPT' 'USEC'.          
                                                                                
       01  VALID-REQ-SET-RSNS-40            PIC  X(04).                         
           88  VALID-REQ-SET-RSN-40 VALUE 'CRED' 'DEB ' ' DEB' 'EXPO'           
                                          'OPT ' ' OPT' 'USEC'.                 
                                                                                
       01  VALID-REQ-SET-RSNS-45            PIC  X(04).                         
           88  VALID-REQ-SET-RSN-45 VALUE 'CASH' 'COMT' 'SMA ' ' SMA'           
                                          'USEC' 'EXPO' 'OPT ' ' OPT'           
LRM004                                    'REGT' '90DR'.                        
                                                                                
       01  VALID-REQ-SET-RSNS-50            PIC  X(04).                         
           88  VALID-REQ-SET-RSN-50 VALUE 'RSEC' 'SFK ' ' SFK' 'XSET'           
                                          'FCUR' 'DDEL' 'EXPO' 'OPT '           
                                          ' OPT' 'USEC'.                        
                                                                                
       01  VALID-QTY-REQ-INDS               PIC  X(01).                         
           88  VALID-QTY-REQ-IND VALUE 'F' 'P'.                                 
                                                                                
       01  VALID-REQ-TRAN-CODES             PIC  X(01).                         
           88  VALID-REQ-TRAN-CODE VALUE '1' '2' '3'.                           
                                                                                
       01  VALID-BEARER-BONDS               PIC  X(01).                         
           88  VALID-BEARER-BOND VALUE 'B' 'N'.                                 
                                                                                
       01  VALID-CASH-MRG-SHRT-CDS          PIC  X(01).                         
           88  VALID-CASH-MRG-SHRT-CD VALUE 'C' 'M' 'S'.                        
                                                                                
       01  VALID-TI-ORG-RCV-ACCT-TYPES      PIC  X(20).                         
           88  VALID-TI-ORG-RCV-ACCT-TYPE VALUE '4K' 'DR' 'EI' 'IR' 'MS'        
                                                'QP' 'RI' 'SI'.                 
                                                                                
       01  VALID-BUY-SELL-CDS               PIC  X(01).                         
           88  VALID-BUY-SELL-CD VALUE 'B' 'S'.                                 
                                                                                
       01  VALID-PUT-CALL-CDS               PIC  X(01).                         
           88  VALID-PUT-CALL-CD VALUE 'P' 'C'.                                 
                                                                                
       01  VALID-OPEN-CLOSE-CDS             PIC  X(01).                         
           88  VALID-OPEN-CLOSE-CD VALUE 'O' 'C'.                               
                                                                                
       01  VALID-STRIKE-FRCTNS              PIC  X(02).                         
           88  VALID-STRIKE-FRCTN VALUE '00' '01' '02' '03' '04' '05'           
                                        '06' '07'.                              
                                                                                
       01  VALID-OPTN-ACCT-TYPE-CDS         PIC  X(01).                         
           88  VALID-OPTN-ACCT-TYPE-CD VALUE 'C' 'F' 'M'.                       
                                                                                
       01  VALID-BK-PHSCL-SHR-CDS           PIC  X(01).                         
           88  VALID-BK-PHSCL-SHR-CD VALUE '1' '2'.                             
                                                                                
       01  VALID-NTWRK-CNTL-CDS             PIC  X(01).                         
           88  VALID-NTWRK-CNTL-CD VALUE '0' '1' '2' '3' '4'.                   
                                                                                
       01  VALID-MF-ACCT-TYPE-CDS           PIC  X(01).                         
           88  VALID-MF-ACCT-TYPE-CD VALUE '1' '2'.                             
                                                                                
       01  VALID-DVDND-CDS                  PIC  X(01).                         
           88  VALID-DVDND-CD VALUE '0' '1' '2' '3' '4' '5' '6' '7'.            
                                                                                
       01  VALID-DVDND-PAYEE-CDS            PIC  X(01).                         
           88  VALID-DVDND-PAYEE-CD VALUE '0' '1' '2' 'N'.                      
                                                                                
       01  VALID-FULL-PARTIAL-CDS           PIC  X(01).                         
           88  VALID-FULL-PARTIAL-CD VALUE '1' '2'.                             
                                                                                
       01  FILLER                           PIC  X(12)   VALUE                  
           'COUNTERS'.                                                          
                                                                                
       01  FILLER.                                                              
           05  INPUT-REC-CNTR       COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  INPUT-TI-CNTR        COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  INPUT-AT-CNTR        COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  INPUT-OTHER-CNTR     COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  OUTPUT-REC-CNTR      COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  TI-INSERTED-CNTR     COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  TI-UPDATED-CNTR      COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  TI-REJECTED-CNTR     COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  AT-INSERTED-CNTR     COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  AT-UPDATED-CNTR      COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  AT-REJECTED-CNTR     COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  MF-INSERTED-CNTR     COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  MF-UPDATED-CNTR      COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  OP-INSERTED-CNTR     COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  OP-UPDATED-CNTR      COMP-3  PIC  9(09)   VALUE ZEROES.          
           05  OTHER-REJECTED-CNTR  COMP-3  PIC  9(09)   VALUE ZEROES.          
                                                                                
       01  DSNTIAR                       PIC X(08)  VALUE 'DSNTIAR'.            
       01  WS-DB2-MESSAGE-AREA.                                                 
           05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.            
           05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES             
               INDEXED BY WS-ERROR-INDEX.                                       
       01  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80.             
                                                                                
           EJECT                                                                
           COPY BPDATESC.                                                       
           EJECT                                                                
LRM001     COPY BHINFO.                                                         
LRM001                                                                          
LRM001     COPY BHACAT.                                                         
                                                                                
           EJECT                                                                
           COPY NSCCDHDR.                                                       
                                                                                
           EJECT                                                                
           COPY NSCCDTRL.                                                       
                                                                                
           EJECT                                                                
           COPY NSCCDTI.                                                        
                                                                                
           EJECT                                                                
           COPY NSCCDAT.                                                        
                                                                                
           EJECT                                                                
           COPY GETNACOB.                                                       
                                                                                
           EJECT                                                                
       01  GETNA-SEGMENTS.                                                      
           COPY  NASEGHDR.                                                      
           COPY  NASEGPPA.                                                      
           COPY  NASEGPPB.                                                      
           COPY  NASEGEND.                                                      
                                                                                
           EJECT                                                                
TCK001     COPY STUBCPY.                                                        
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE ACTITRF                                                   
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE ACTIAST                                                   
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE ACTIOPN                                                   
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE ACTIMF                                                    
           END-EXEC.                                                            
                                                                                
LRM008*--------------------------------------------------------*                
LRM008*  INITIAL TRANSFER CURSOR                              *                 
LRM008*  USED TO FIND GREATEST CNTL NUMBER FOR THE GIVEN KEYS *                 
LRM008*--------------------------------------------------------*                
LRM008     EXEC SQL                                                             
LRM008        DECLARE ACTITRF_LAST_CNTL CURSOR FOR                              
LRM008           SELECT                                                         
LRM008             ACAT_CONTROL_NBR                                             
LRM008           FROM ACTITRF                                                   
LRM008            WHERE (CLIENT_NBR                                             
LRM008                        = :CLIENT-NUMBER                                  
LRM008               AND DLVR_NBR                                               
LRM008                        = :NSCCTI-ORG-DEL-NBR                             
LRM008               AND ACCT_DLVR_NBR                                          
LRM008                        = :NSCCTI-ORG-DEL-ACCT-NBR                        
LRM008               AND RCV_NBR                                                
LRM008                        = :NSCCTI-ORG-RCV-NBR                             
LRM008               AND ACCT_RCV_NBR                                           
LRM008                        = :NSCCTI-ORG-RCV-CUS-ACCT                        
LRM008               AND TRNFR_TYPE_CD                                          
LRM008                        = :NSCCTI-TRNFR-TYPE)                             
LRM008           ORDER BY  ACAT_CONTROL_NBR DESC                                
LRM008      END-EXEC.                                                           
           EJECT                                                                
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
       01  PARM-AREA.                                                           
           05  PARM-LENGTH                  PIC  S9(04) COMP.                   
           05  LS-CLIENT-NBR                PIC   X(03).                        
LRM006     05  PARM-STREAM                  PIC   X(01).                        
           05  PARM-DATE-BYPASS             PIC   X(06).                        
               88  BYPASS-DATE-CHECK                  VALUE 'BYPASS'.           
LRM010     05  PARM-CYCLE                   PIC   X(01).                        
                                                                                
           EJECT                                                                
      ******************************************************************        
       PROCEDURE DIVISION USING PARM-AREA.                                      
      ******************************************************************        
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
           PERFORM INITIAL-RTN.                                                 
                                                                                
           PERFORM READ-INPACAT-FILE.                                           
                                                                                
           PERFORM PROCESS-INPACAT-FILE                                         
              UNTIL EOF-YES.                                                    
                                                                                
           PERFORM END-OF-JOB-RTN.                                              
                                                                                
           STOP RUN.                                                            
                                                                                
           EJECT                                                                
      **********************                                                    
       PROCESS-INPACAT-FILE.                                                    
      **********************                                                    
                                                                                
           EVALUATE INPACAT-REC (1:2)                                           
              WHEN 'TI'                                                         
                 ADD 1                      TO  INPUT-TI-CNTR                   
                 PERFORM TI-EDIT-CHECK  THRU TI-EDIT-CHECK-EXIT                 
                 IF TI-EDIT-CHECK-OK                                            
                    EVALUATE NSCCTI-TRNFR-TYPE                                  
                       WHEN 'FUL'                                               
                          PERFORM ADD-TI-RECORD-TO-DATABASE                     
                             THRU ADD-TI-RECORD-EXIT                            
                          PERFORM READ-INPACAT-FILE                             
                       WHEN 'PTR'                                               
LRM001                 WHEN 'PTD'                                               
LRM005                 WHEN 'PTF'                                               
                          SET STOP-NOT-OK   TO  TRUE                            
                          SET AT-NOT-FOUND  TO  TRUE                            
                          SET GOOD-EDIT     TO  TRUE                            
                          SET AT-NOT-EDITED TO  TRUE                            
                          MOVE 0            TO  SUB                             
                          PERFORM RETRIEVE-ALL-CORRESP-AT-RECS                  
                             UNTIL STOP-OK                                      
                          IF AT-FOUND                                           
                             IF GOOD-EDIT                                       
                                PERFORM ADD-TI-RECORD-TO-DATABASE               
                                   THRU ADD-TI-RECORD-EXIT                      
                                PERFORM VARYING S3 FROM 1 BY 1                  
                                   UNTIL S3 > SUB                               
                                   MOVE AT-STORAGE (S3) TO NSCCAT-RECORD        
                                   PERFORM ADD-AT-RECORD-TO-DATABASE            
                                END-PERFORM                                     
                             ELSE                                               
                                MOVE 'H'     TO  NSCCTI-COMMENTS (120:1)        
LRM001                          DISPLAY 'IREC ' INPUT-REC-CNTR                  
LRM001                            ' FAIL ON AT EDIT'                            
                                WRITE OUTACAT-TI-REC FROM NSCCTI-RECORD         
                                PERFORM VARYING S3 FROM 1 BY 1                  
                                   UNTIL S3 > SUB                               
                                   MOVE AT-STORAGE (S3) TO NSCCAT-RECORD        
                                   PERFORM WRITE-AT-RECORD                      
                                END-PERFORM                                     
                             END-IF                                             
                          ELSE                                                  
                             MOVE 'B'       TO  NSCCTI-COMMENTS (120:1)         
LRM001                       DISPLAY 'IREC ' INPUT-REC-CNTR                     
LRM001                         ' FAIL ON AT NOTFND'                             
                             WRITE OUTACAT-TI-REC FROM NSCCTI-RECORD            
                          END-IF                                                
                       WHEN OTHER                                               
                          MOVE 'G'          TO  NSCCTI-COMMENTS (120:1)         
LRM001                    DISPLAY 'IREC ' INPUT-REC-CNTR                        
LRM001                      ' FAIL ON NON PTD PTR PTF'                          
                          WRITE OUTACAT-TI-REC FROM NSCCTI-RECORD               
                          PERFORM READ-INPACAT-FILE                             
                    END-EVALUATE                                                
                 ELSE                                                           
                    PERFORM READ-INPACAT-FILE                                   
                 END-IF                                                         
              WHEN 'AT'                                                         
                 ADD 1                      TO  INPUT-AT-CNTR                   
                 IF AT-EDITED                                                   
                    SET AT-NOT-EDITED       TO  TRUE                            
                 ELSE                                                           
                    PERFORM AT-EDIT-CHECK THRU AT-EDIT-CHECK-EXIT               
                 END-IF                                                         
                 IF NSCCAT-TRANSFER-TYPE = 'FUL'                                
                    IF AT-EDIT-CHECK-OK                                         
                       PERFORM ADD-AT-RECORD-TO-DATABASE                        
                    ELSE                                                        
                       PERFORM WRITE-AT-RECORD                                  
                    END-IF                                                      
                 ELSE                                                           
LRM005              IF (NSCCAT-TRANSFER-TYPE = 'PTR' OR 'PTD' OR 'PTF')         
                       MOVE 'I'         TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001                 DISPLAY 'IREC ' INPUT-REC-CNTR                           
LRM001                   ' FAIL ON PTR AT'                                      
                       PERFORM WRITE-AT-RECORD                                  
                    END-IF                                                      
                 END-IF                                                         
                 PERFORM READ-INPACAT-FILE                                      
              WHEN 'EN'                                                         
                 SET TRAILER-FOUND           TO  TRUE                           
LRM001           MOVE INPACAT-REC TO NSCC-TRL-RECORD                            
                 PERFORM READ-INPACAT-FILE                                      
              WHEN OTHER                                                        
                 ADD 1                       TO  INPUT-OTHER-CNTR               
                 WRITE OUTACAT-REC         FROM  INPACAT-REC                    
                 ADD 1                       TO  OUTPUT-REC-CNTR                
                                                 OTHER-REJECTED-CNTR            
                 PERFORM READ-INPACAT-FILE                                      
           END-EVALUATE.                                                        
                                                                                
           IF TRAILER-FOUND AND NOT EOF-YES                                     
              DISPLAY ' '                                                       
              DISPLAY '**********************************************'          
              DISPLAY '* TRAILER RECORD IS NOT THE LAST RECORD!     *'          
              DISPLAY '* RECORDS AFTER THE TRAILER ARE DISREGARDED. *'          
              DISPLAY '**********************************************'          
              SET EOF-YES                   TO  TRUE                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ******************************                                            
       RETRIEVE-ALL-CORRESP-AT-RECS.                                            
      ******************************                                            
                                                                                
           PERFORM READ-INPACAT-FILE.                                           
                                                                                
           IF NOT EOF-YES                                                       
              IF INPACAT-REC (1:2) = 'AT'                                       
                 ADD 1                      TO  INPUT-AT-CNTR                   
                 PERFORM AT-EDIT-CHECK THRU AT-EDIT-CHECK-EXIT                  
LRM005           IF ((NSCCAT-TRANSFER-TYPE = 'PTR' OR 'PTF')   AND              
                    NSCCAT-SUB-PART-NBR  = NSCCTI-SUB-PART-NBR AND              
                    NSCCAT-ORG-RCV-NBR   = NSCCTI-ORG-RCV-NBR  AND              
                    NSCCAT-ORG-DEL-NBR   = NSCCTI-ORG-DEL-NBR  AND              
                    NSCCAT-TRANS-REF-ID  = NSCCTI-ORG-RCV-CUS-ACCT)             
LRM008           OR ((NSCCAT-TRANSFER-TYPE = 'PTD' OR 'PTF')   AND              
LRM003              NSCCAT-SUB-PART-NBR  = NSCCTI-SUB-PART-NBR AND              
LRM003              NSCCAT-ORG-RCV-NBR   = NSCCTI-ORG-RCV-NBR  AND              
LRM003              NSCCAT-ORG-DEL-NBR   = NSCCTI-ORG-DEL-NBR)                  
LRM009              IF SUB > 9999                                               
                       DISPLAY 'CAT950 TABLE OVERFLOW '                         
                       DISPLAY 'OVER 9999 AT RECORDS ON PTR/PTF INPUT '         
                       DISPLAY 'PROGRAM ABENDS'                                 
                       MOVE +1111 TO ABEND-CODE                                 
TCK001                 CALL  ABEND             USING  ABEND-CODE                
                    END-IF                                                      
                    ADD 1                TO  SUB                                
                    SET AT-FOUND         TO  TRUE                               
                    IF AT-EDIT-CHECK-NOT-OK                                     
                       SET BAD-EDIT      TO  TRUE                               
                    END-IF                                                      
                    MOVE NSCCAT-RECORD   TO  AT-STORAGE (SUB)                   
                 ELSE                                                           
                    SET STOP-OK          TO  TRUE                               
                 END-IF                                                         
              ELSE                                                              
                 SET STOP-OK                TO  TRUE                            
           ELSE                                                                 
              SET STOP-OK                   TO  TRUE                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       READ-INPACAT-FILE.                                                       
      *******************                                                       
                                                                                
           READ INPACAT-FILE                                                    
              AT END SET EOF-YES            TO  TRUE                            
           END-READ.                                                            
                                                                                
           IF NOT EOF-YES                                                       
LRM001     AND (INPACAT-REC(1 : 3) NOT = 'HDR' AND 'END')                       
              ADD 1                         TO  INPUT-REC-CNTR                  
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ***************                                                           
       TI-EDIT-CHECK.                                                           
      ***************                                                           
                                                                                
           SET TI-EDIT-CHECK-OK             TO  TRUE.                           
           MOVE INPACAT-REC                 TO  NSCCTI-RECORD.                  
                                                                                
           IF NSCCTI-TRANS-TYPE NOT = 'A' AND 'C' AND 'R'                       
LRM001*****IF NSCCTI-TRANS-TYPE NOT = 'A'                                       
              MOVE 'F'                      TO  NSCCTI-COMMENTS (120:1)         
LRM001        DISPLAY 'IREC ' INPUT-REC-CNTR                                    
LRM001           ' FAIL ON TRANS TYPE A,C,R'                                    
              PERFORM TI-ERROR-ROUTINE                                          
              GO TO TI-EDIT-CHECK-EXIT                                          
           END-IF.                                                              
                                                                                
LRM001     IF (NSCCTI-TRANS-TYPE = 'C' OR 'R')                                  
LRM001     AND (NSCCTI-ACATS-CNTL-NBR NOT > SPACES)                             
LRM001        MOVE 'F'                      TO  NSCCTI-COMMENTS (120:1)         
LRM001        DISPLAY 'IREC ' INPUT-REC-CNTR                                    
LRM001           ' FAIL ON TRANS TYPE C,R MISSING CNTL NBR'                     
LRM001        PERFORM TI-ERROR-ROUTINE                                          
LRM001        GO TO TI-EDIT-CHECK-EXIT                                          
LRM001     END-IF.                                                              
                                                                                
LRM005     IF NSCCTI-TRNFR-TYPE = 'FUL' OR 'PTR' OR 'PTF' OR 'MFC'              
LRM001                         OR 'PTD'                                         
              CONTINUE                                                          
           ELSE                                                                 
              MOVE 'U'                      TO  NSCCTI-COMMENTS (120:1)         
LRM001        DISPLAY 'IREC ' INPUT-REC-CNTR                                    
LRM001           ' TRANSFER TYPE NOT VALID ' NSCCTI-TRNFR-TYPE                  
              PERFORM TI-ERROR-ROUTINE                                          
              GO TO TI-EDIT-CHECK-EXIT                                          
           END-IF.                                                              
                                                                                
           MOVE ZEROES                      TO  GETNA-KEY.                      
           MOVE WS-CLIENT-NBR               TO  GETNA-KEY-CLIENT.               
LRM001     IF NSCCTI-TRNFR-TYPE = 'PTD'                                         
LRM001     OR (NSCCTI-TRNFR-TYPE = 'FUL'                                        
LRM001     AND (NSCCTI-TRANS-TYPE = 'C' OR 'R'))                                
LRM008     OR (NSCCTI-TRNFR-TYPE = 'PTF'                                        
LRM008     AND NSCCAT-ORG-DEL-NBR = WS-BKR-CLR-NO)                              
LRM001       MOVE NSCCTI-ORG-DEL-ACCT-NBR (1:3) TO GETNA-KEY-BRANCH3-5          
LRM001       MOVE NSCCTI-ORG-DEL-ACCT-NBR (4:5) TO GETNA-KEY-ACCOUNT6-10        
LRM001     ELSE                                                                 
             MOVE NSCCTI-ORG-RCV-CUS-ACCT (1:3) TO GETNA-KEY-BRANCH3-5          
             MOVE NSCCTI-ORG-RCV-CUS-ACCT (4:5) TO GETNA-KEY-ACCOUNT6-10        
LRM001     END-IF.                                                              
           MOVE 'CAT950'                    TO  GETNA-PGM-NAME.                 
           MOVE 'R'                         TO  GETNA-REQ-FUNC.                 
           MOVE 'R'                         TO  GETNA-REQ-FUNC2.                
           MOVE 'R'                         TO  GETNA-REQ-FILE.                 
           MOVE 'N'                         TO  GETNA-REQ-YEAREND.              
TCK001     CALL  GETNA                   USING  GETNA-PARAMETERS                
                                                GETNA-SEGMENTS.                 
                                                                                
LRM001     IF GETNA-RETURN-NOT-FOUND                                            
LRM001     AND (NSCCTI-TRANS-TYPE = 'C' OR 'R' OR 'X')                          
LRM001        CONTINUE                                                          
LRM001     ELSE                                                                 
           IF GETNA-RETURN-NOT-FOUND                                            
              MOVE 'A'                      TO  NSCCTI-COMMENTS (120:1)         
LRM001        DISPLAY 'IREC ' INPUT-REC-CNTR                                    
LRM001        ' N/A NOTFND ' GETNA-KEY-BRANCH3-5 GETNA-KEY-ACCOUNT6-10          
              PERFORM TI-ERROR-ROUTINE                                          
              GO TI-EDIT-CHECK-EXIT                                             
           ELSE                                                                 
              IF NOT GETNA-RETURN-FOUND                                         
                 DISPLAY ' '                                                    
                 DISPLAY '************************'                             
                 DISPLAY '* ERROR ON N&A FILE    *'                             
                 DISPLAY '* VSAM STATUS IS ' GETNA-VSAM-STATUS '    *'          
                 DISPLAY '* PROGRAM IS ABENDING! *'                             
                 DISPLAY '************************'                             
                 DISPLAY ' '                                                    
TCK001           CALL  ABEND             USING  ABEND-CODE                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE NSCCTI-ORG-RCV-ACCT-TYP     TO  VALID-ACCT-TYPES.               
           MOVE NSCCTI-TRNFR-TYPE-REJ       TO  VALID-REJECT-CODES.             
                                                                                
LRM001     IF NSCCTI-TRANS-TYPE = 'R'                                           
LRM001     AND NSCCTI-TRNFR-TYPE = 'FUL'                                        
LRM001        IF NOT VALID-REJECT-CODE-FUL                                      
LRM001           MOVE 'D'                   TO  NSCCTI-COMMENTS (120:1)         
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
LRM001           ' RECT CODE ON FUL ' NSCCTI-TRNFR-TYPE-REJ                     
LRM001           PERFORM TI-ERROR-ROUTINE                                       
LRM001           GO TO TI-EDIT-CHECK-EXIT                                       
LRM001        ELSE                                                              
LRM001           CONTINUE                                                       
LRM001     ELSE                                                                 
           IF (NSCCTI-REC-LENGTH NOT = 356)                    OR               
              (NSCCTI-PHSCL-SEQ-NBR NOT = 1)                   OR               
              (NSCCTI-LGCL-SEQ-NBR NOT = 1)                    OR               
             ((NSCCTI-ACATS-CNTL-NBR NOT = SPACES)                              
LRM001              AND NSCCTI-TRANS-TYPE = 'A')               OR               
              (NSCCTI-SUB-PART-NBR = SPACES)                   OR               
              (NSCCTI-ORG-RCV-NBR = SPACES)                    OR               
              (NSCCTI-ORG-DEL-NBR = SPACES)                    OR               
              (NSCCTI-ORG-RCV-CUS-ACCT = SPACES)               OR               
              (NSCCTI-ORG-RCV-CUS-NAME = SPACES)               OR               
              (NSCCTI-ORG-RCV-SSN-PRM NOT NUMERIC)             OR               
              (NOT VALID-ACCT-TYPE)                            OR               
              (NSCCTI-ORG-DEL-ACCT-NBR = SPACES)               OR               
              (NOT VALID-REJECT-CODE)                                           
              MOVE 'D'                      TO  NSCCTI-COMMENTS (120:1)         
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
LRM001           ' GENERAL EDIT FAILED'                                         
LRM001        PERFORM TI-GENERAL-DISPLAY-RTN                                    
              PERFORM TI-ERROR-ROUTINE                                          
              GO TO TI-EDIT-CHECK-EXIT                                          
           END-IF.                                                              
                                                                                
LRM001     IF (NSCCTI-TRANS-TYPE = 'R')                                         
LRM001        CONTINUE                                                          
LRM001     ELSE                                                                 
           IF NSCCTI-ORG-RCV-SSN-SEC NOT = SPACES                               
              IF NSCCTI-ORG-RCV-SSN-SEC NOT NUMERIC                             
                 MOVE 'D'                   TO  NSCCTI-COMMENTS (120:1)         
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
LRM001           ' SSN NOT NUMERIC'                                             
                 PERFORM TI-ERROR-ROUTINE                                       
                 GO TO TI-EDIT-CHECK-EXIT                                       
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF NSCCTI-ASSC-ACATS-CNTL NOT = SPACES                               
              IF NSCCTI-ASSC-ACATS-CNTL NOT NUMERIC                             
                 MOVE 'D'                   TO  NSCCTI-COMMENTS (120:1)         
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
LRM001           ' ASSC CNTL NBR NOT NUMERIC ' NSCCTI-ASSC-ACATS-CNTL           
                 PERFORM TI-ERROR-ROUTINE                                       
                 GO TO TI-EDIT-CHECK-EXIT                                       
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF NSCCTI-ASSC-STTLM-DATE NOT = SPACES                               
              IF NSCCTI-ASSC-STTLM-DATE (1:2) > 20 OR                           
                 NSCCTI-ASSC-STTLM-DATE (1:2) < 19 OR                           
                 NSCCTI-ASSC-STTLM-DATE (5:2) > 12 OR                           
                 NSCCTI-ASSC-STTLM-DATE (7:2) > 31                              
                 MOVE 'D'                   TO  NSCCTI-COMMENTS (120:1)         
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
LRM001           ' STTLM DT NG ' NSCCTI-ASSC-STTLM-DATE                         
                 PERFORM TI-ERROR-ROUTINE                                       
                 GO TO TI-EDIT-CHECK-EXIT                                       
              END-IF                                                            
           ELSE                                                                 
              MOVE '00010101'               TO  NSCCTI-ASSC-STTLM-DATE          
           END-IF.                                                              
                                                                                
LRM008     IF NSCCTI-TRNFR-TYPE = 'PTF'                                         
LRM008        CONTINUE                                                          
LRM008     ELSE                                                                 
LRM005     IF (NSCCTI-TRNFR-TYPE = 'PTR')                                       
              IF NSCCTI-TRNFR-REF-ID = SPACES OR                                
                 NSCCTI-TRNFR-REF-ID NOT = NSCCTI-ORG-RCV-CUS-ACCT              
                 MOVE 'D'                   TO  NSCCTI-COMMENTS (120:1)         
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
LRM001           ' REF ID ON PTR/PTF NOT = CUST ' NSCCTI-TRNFR-REF-ID           
                 PERFORM TI-ERROR-ROUTINE                                       
                 GO TO TI-EDIT-CHECK-EXIT                                       
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ********************                                                      
       TI-EDIT-CHECK-EXIT.                                                      
      ********************                                                      
                                                                                
           EXIT.                                                                
                                                                                
LRM001 TI-GENERAL-DISPLAY-RTN.                                                  
           IF (NSCCTI-REC-LENGTH NOT = 356)                                     
              DISPLAY 'TI REC LENGTH NOT 356 ' NSCCTI-REC-LENGTH                
           END-IF.                                                              
           IF (NSCCTI-PHSCL-SEQ-NBR NOT = 1)                                    
              DISPLAY 'TI PHYS SEQ NOT 1' NSCCTI-PHSCL-SEQ-NBR                  
           END-IF.                                                              
           IF (NSCCTI-LGCL-SEQ-NBR NOT = 1)                                     
              DISPLAY 'TI LGCL SEQ NOT 1' NSCCTI-LGCL-SEQ-NBR                   
           END-IF.                                                              
           IF (NSCCTI-ACATS-CNTL-NBR NOT = SPACES)                              
           AND NSCCTI-TRANS-TYPE = 'A'                                          
              DISPLAY 'TI CNTL NBR NOT BLANK' NSCCTI-ACATS-CNTL-NBR             
           END-IF.                                                              
           IF (NSCCTI-SUB-PART-NBR = SPACES)                                    
              DISPLAY 'TI SUB PARTIC BLANK'                                     
           END-IF.                                                              
           IF (NSCCTI-ORG-RCV-NBR = SPACES)                                     
              DISPLAY 'TI ORG RCV NBR BLANK'                                    
           END-IF.                                                              
           IF (NSCCTI-ORG-DEL-NBR = SPACES)                                     
              DISPLAY 'TI ORG DEL NBR BLANK'                                    
           END-IF.                                                              
           IF (NSCCTI-ORG-RCV-CUS-ACCT = SPACES)                                
              DISPLAY 'TI RCV CUST AC BLANK'                                    
           END-IF.                                                              
           IF (NSCCTI-ORG-RCV-CUS-NAME = SPACES)                                
              DISPLAY 'TI RCV CUST NAME BLANK'                                  
           END-IF.                                                              
           IF (NSCCTI-ORG-RCV-SSN-PRM NOT NUMERIC)                              
              DISPLAY 'TI SSN NOT NUMERIC'                                      
           END-IF.                                                              
           IF (NOT VALID-ACCT-TYPE)                                             
              DISPLAY 'TI ACCT TYPE ' NSCCTI-ORG-RCV-ACCT-TYP                   
           END-IF.                                                              
           IF (NSCCTI-ORG-DEL-ACCT-NBR = SPACES)                                
              DISPLAY 'TI DEL ACCT BLANK'                                       
           END-IF.                                                              
           IF (NOT VALID-REJECT-CODE)                                           
              DISPLAY 'TI REJECT CODE ' NSCCTI-TRNFR-TYPE-REJ                   
           END-IF.                                                              
           EJECT                                                                
      ******************                                                        
       TI-ERROR-ROUTINE.                                                        
      ******************                                                        
                                                                                
           SET TI-EDIT-CHECK-NOT-OK         TO  TRUE.                           
           WRITE OUTACAT-TI-REC           FROM  NSCCTI-RECORD.                  
           ADD 1                            TO  OUTPUT-REC-CNTR                 
                                                TI-REJECTED-CNTR.               
                                                                                
           EJECT                                                                
      ***************                                                           
       AT-EDIT-CHECK.                                                           
      ***************                                                           
                                                                                
           SET AT-EDIT-CHECK-OK             TO  TRUE.                           
           MOVE INPACAT-REC                 TO  NSCCAT-AREA.                    
                                                                                
           IF NSCCAT-TRANS-TYPE NOT = 'A'                                       
              MOVE 'F'                  TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001        DISPLAY 'IREC ' INPUT-REC-CNTR                                    
LRM001         ' TRANS TYPE MUST BE A ON AT RECORDS'                            
              SET AT-EDIT-CHECK-NOT-OK      TO  TRUE                            
              GO TO AT-EDIT-CHECK-EXIT                                          
           END-IF.                                                              
                                                                                
           EVALUATE NSCCAT-TRANSFER-TYPE                                        
              WHEN 'PTR'                                                        
LRM003        WHEN 'PTD'                                                        
LRM005        WHEN 'PTF'                                                        
                IF NSCCAT-ACATS-CNTL-NBR NOT = SPACES                           
                   MOVE 'E'             TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001             DISPLAY 'IREC ' INPUT-REC-CNTR                               
LRM001             ' PTR/D/F AT WITH CNTL NBR ' NSCCAT-ACATS-CNTL-NBR           
                   DISPLAY 'FAIL ON CNTL NBR POPULATED ' INPUT-AT-CNTR          
                   SET AT-EDIT-CHECK-NOT-OK TO  TRUE                            
                   GO TO AT-EDIT-CHECK-EXIT                                     
                END-IF                                                          
DJ0001        WHEN 'MFC'                                                        
              WHEN 'FUL'                                                        
                IF NSCCAT-ACATS-CNTL-NBR NOT NUMERIC                            
                   MOVE 'E'             TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001             DISPLAY 'IREC ' INPUT-REC-CNTR                               
LRM001             ' CNTL NBR NOT NUMERIC ON MFC,FUL '                          
LRM001                   NSCCAT-ACATS-CNTL-NBR                                  
                   DISPLAY 'FAIL ON CNTL NBR NUMERIC ' INPUT-AT-CNTR            
                   SET AT-EDIT-CHECK-NOT-OK TO  TRUE                            
                   GO TO AT-EDIT-CHECK-EXIT                                     
                END-IF                                                          
              WHEN OTHER                                                        
                 MOVE 'G'               TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
LRM001             ' INVALID TRANSFER TYPE ON AT ' NSCCAT-TRANSFER-TYPE         
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-EXIT                                       
           END-EVALUATE.                                                        
                                                                                
           MOVE NSCCAT-REC-LENGTH           TO  VALID-AT-REC-LENGTHS.           
           MOVE NSCCAT-ASSET-PRICE-CATG     TO  VALID-PRICE-CTGS.               
           MOVE NSCCAT-OPTION-CAT           TO  VALID-OPTION-CTGS.              
           MOVE NSCCAT-REQ-SET-LOCATION     TO  VALID-STTLM-LCTNS.              
           MOVE NSCCAT-POSITION-CODE        TO  VALID-POSITION-CDS.             
           MOVE NSCCAT-WHEN-ISSUED-IND      TO  VALID-WI-CDS.                   
                                                                                
           IF (NOT VALID-AT-REC-LENGTH)                       OR                
              (NSCCAT-PHSCL-SEQ-NBR NOT = 1)                  OR                
              (NSCCAT-LGCL-SEQ-NBR  NOT = 1)                  OR                
              (NSCCAT-SUB-PART-NBR = SPACES)                  OR                
              (NSCCAT-ORG-RCV-NBR = SPACES)                   OR                
              (NSCCAT-ORG-DEL-NBR = SPACES)                   OR                
              (NSCCAT-ASSET-SEQ-NBR NOT NUMERIC)              OR                
              (NSCCAT-ASSET-SEQ-NBR NOT = ZERO)               OR                
              (NOT VALID-OPTION-CTG)                          OR                
              (NOT VALID-STTLM-LCTN)                          OR                
              (NOT VALID-POSITION-CD)                         OR                
              (NOT VALID-WI-CD)                               OR                
              (NOT VALID-PRICE-CTG)                                             
              MOVE 'E'                  TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001        DISPLAY 'IREC ' INPUT-REC-CNTR                                    
LRM001         ' ASSET GROUP TEST '                                             
              SET AT-EDIT-CHECK-NOT-OK      TO  TRUE                            
              PERFORM DISPLAY-GROUP-ERRORS                                      
              GO TO AT-EDIT-CHECK-EXIT                                          
           END-IF.                                                              
                                                                                
           EVALUATE NSCCAT-TRANSFER-TYPE                                        
DJ0001        WHEN 'MFC'                                                        
LRM001        WHEN 'PTD'                                                        
              WHEN 'FUL'                                                        
                 IF NSCCAT-SUB-PART-NBR NOT = NSCCAT-ORG-DEL-NBR                
                    MOVE 'E'            TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001              DISPLAY 'IREC ' INPUT-REC-CNTR                              
LRM001              ' SUBMIT PARTICIPANT WRONG'                                 
                    SET AT-EDIT-CHECK-NOT-OK TO TRUE                            
                    GO TO AT-EDIT-CHECK-EXIT                                    
                 END-IF                                                         
              WHEN 'PTR'                                                        
                 IF NSCCAT-SUB-PART-NBR NOT = NSCCAT-ORG-RCV-NBR                
                    MOVE 'E'            TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001              DISPLAY 'IREC ' INPUT-REC-CNTR                              
LRM001               ' PTR SUBMIT PARTICIPANT'                                  
                    SET AT-EDIT-CHECK-NOT-OK TO TRUE                            
                    GO TO AT-EDIT-CHECK-EXIT                                    
                 END-IF                                                         
LRM007        WHEN 'PTF'                                                        
LRM007           IF NSCCAT-SUB-PART-NBR NOT = NSCCAT-ORG-RCV-NBR                
LRM007           AND NSCCAT-SUB-PART-NBR NOT = NSCCAT-ORG-DEL-NBR               
LRM007              MOVE 'E'            TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM007              DISPLAY 'IREC ' INPUT-REC-CNTR                              
LRM007               ' PTF SUBMIT PARTICIPANT'                                  
LRM007              SET AT-EDIT-CHECK-NOT-OK TO TRUE                            
LRM007              GO TO AT-EDIT-CHECK-EXIT                                    
LRM007           END-IF                                                         
           END-EVALUATE.                                                        
                                                                                
LRM008     IF  NSCCAT-TRANSFER-TYPE = 'PTF'                                     
LRM008        CONTINUE                                                          
LRM008     ELSE                                                                 
LRM005     IF (NSCCAT-TRANSFER-TYPE = 'PTR' OR 'PTF') AND                       
              NSCCAT-TRANS-REF-ID NOT = NSCCTI-TRNFR-REF-ID                     
              MOVE 'C'                  TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001        DISPLAY 'IREC ' INPUT-REC-CNTR                                    
LRM001          ' TRANS REF ID ' NSCCAT-TRANS-REF-ID                            
              SET AT-EDIT-CHECK-NOT-OK      TO  TRUE                            
              GO TO AT-EDIT-CHECK-EXIT                                          
           END-IF.                                                              
                                                                                
           MOVE NSCCAT-REQ-SET-REASON       TO  VALID-REQ-SET-RSNS-35           
                                                VALID-REQ-SET-RSNS-40           
                                                VALID-REQ-SET-RSNS-45           
                                                VALID-REQ-SET-RSNS-50.          
                                                                                
           IF (NSCCAT-REQ-SET-LOCATION = '35'  AND                              
               NOT VALID-REQ-SET-RSN-35)                                        
                           OR                                                   
              (NSCCAT-REQ-SET-LOCATION = '40' AND                               
               NOT VALID-REQ-SET-RSN-40)                                        
                           OR                                                   
              (NSCCAT-REQ-SET-LOCATION = '45' AND                               
               NOT VALID-REQ-SET-RSN-45)                                        
                           OR                                                   
               (NSCCAT-REQ-SET-LOCATION = '50' AND                              
                NOT VALID-REQ-SET-RSN-50)                                       
                MOVE 'E'                TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001          DISPLAY 'IREC ' INPUT-REC-CNTR                                  
LRM001           ' FAIL SETLLE LOC ' INPUT-AT-CNTR                              
                SET AT-EDIT-CHECK-NOT-OK    TO  TRUE                            
                GO TO AT-EDIT-CHECK-EXIT                                        
           END-IF.                                                              
                                                                                
           IF NSCCAT-ASSET-DESC = SPACES AND                                    
              NSCCAT-ISIN-SECU-ISSU-ID = SPACES                                 
              IF (NSCCAT-REQ-SET-LOCATION = '30' AND                            
                  NSCCAT-OPTION-CAT > 0)                                        
                          OR                                                    
                  NSCCAT-REQ-SET-LOCATION = '35'                                
LRM001                                   OR '40'                                
                          OR                                                    
                 (NSCCAT-REQ-SET-LOCATION = '45' AND                            
                  NSCCAT-REQ-SET-REASON = ('CASH' OR 'COMT' OR 'SMA '           
                                           OR ' SMA'))                          
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
LRM001           ' FAIL SETLLE LOC '                                            
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-EXIT                                       
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF NSCCAT-ISIN-CNTRY-CODE = SPACES OR 'US'                           
              IF NSCCAT-ISIN-SECU-CHK-DIG = SPACES                              
                 CONTINUE                                                       
              END-IF                                                            
           ELSE                                                                 
              IF NSCCAT-ISIN-SECU-CHK-DIG = SPACES                              
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
                  ' FAIL CHECK DIGIT ' INPUT-AT-CNTR                            
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-EXIT                                       
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF NSCCAT-ASSET-DESC = SPACES AND                                    
              NSCCAT-ISIN-SECU-ISSU-ID = SPACES                                 
              IF (NSCCAT-REQ-SET-LOCATION = '35'                                
                           OR                                                   
                 NSCCAT-REQ-SET-LOCATION = '40'                                 
                           OR                                                   
                 (NSCCAT-REQ-SET-LOCATION = '45' AND                            
                  NSCCAT-REQ-SET-REASON = ('CASH' OR 'COMT' OR 'SMA '           
                                           OR ' SMA')))                         
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
                  ' FAIL ISIN AND DESCRIPTION BLANK'                            
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-EXIT                                       
              END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE NSCCAT-QTY-REQ-IND          TO  VALID-QTY-REQ-INDS.             
                                                                                
LRM008     DISPLAY 'TYPE ' NSCCAT-TRANSFER-TYPE                                 
LRM008      ' AT-DLV-NBR 'NSCCAT-ORG-DEL-NBR ' WS-BRKR ' WS-BKR-CLR-NO          
LRM008      ' REQ-IN '  NSCCAT-QTY-REQ-IND                                      
                                                                                
LRM008     IF (NSCCAT-TRANSFER-TYPE = 'PTF')                                    
LRM008     AND NSCCAT-ORG-DEL-NBR = WS-BKR-CLR-NO                               
LRM008     AND NSCCAT-QTY-REQ-IND = SPACES                                      
LRM008        CONTINUE                                                          
LRM008     ELSE                                                                 
LRM005     IF (NSCCAT-TRANSFER-TYPE = 'PTR' OR 'PTF')                           
              IF NSCCAT-QTY-REQ-IND = SPACES                                    
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
                  ' FAIL PTR/PTF AT REQUEST TYPE'                               
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-EXIT                                       
              ELSE                                                              
                 IF NOT VALID-QTY-REQ-IND                                       
                    MOVE 'E'            TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001              DISPLAY 'IREC ' INPUT-REC-CNTR                              
                     ' FAIL QTY REQ ' NSCCAT-QTY-REQ-IND                        
                    SET AT-EDIT-CHECK-NOT-OK TO TRUE                            
                    GO TO AT-EDIT-CHECK-EXIT                                    
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              IF NSCCAT-QTY-REQ-IND NOT = SPACES                                
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
                  ' FAIL QTY REQ NON PTR/PTF '                                  
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-EXIT                                       
              END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE NSCCAT-REQ-TRAN-CODE        TO  VALID-REQ-TRAN-CODES.           
                                                                                
LRM008     IF (NSCCAT-TRANSFER-TYPE = 'PTF')                                    
LRM008     AND NSCCAT-ORG-DEL-NBR = WS-BKR-CLR-NO                               
LRM008     AND NSCCAT-QTY-REQ-IND = SPACES                                      
LRM008        CONTINUE                                                          
LRM008     ELSE                                                                 
LRM005     IF (NSCCAT-TRANSFER-TYPE = 'PTR' OR 'PTF')                           
              IF NSCCAT-REQ-TRAN-CODE = SPACES                                  
LRM002           IF NSCCAT-QTY-REQ-IND = 'F'                                    
LRM002              CONTINUE                                                    
LRM002           ELSE                                                           
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
                  ' FAIL TRAN CODE MISSING'                                     
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-EXIT                                       
              ELSE                                                              
                 IF NOT VALID-REQ-TRAN-CODE                                     
                    MOVE 'E'            TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001              DISPLAY 'IREC ' INPUT-REC-CNTR                              
                     ' FAIL TRAN CODE ' NSCCAT-REQ-TRAN-CODE                    
                    SET AT-EDIT-CHECK-NOT-OK TO TRUE                            
                    GO TO AT-EDIT-CHECK-EXIT                                    
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              IF NSCCAT-REQ-TRAN-CODE NOT = SPACES                              
                 MOVE 'E'              TO  NSCCAT-ASSET-COMMENT (120:1)         
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
                  ' FAIL TRAN CODE OTHER ' NSCCAT-REQ-TRAN-CODE                 
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO AT-EDIT-CHECK-EXIT                                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF (NSCCAT-ASSET-QTY = ZEROES OR SPACES OR LOW-VALUES)               
LRM005        IF ((NSCCAT-TRANSFER-TYPE = 'PTR' OR 'PTF') AND                   
                  NSCCAT-REQ-TRAN-CODE = ('1' OR '3'))                          
                              OR                                                
LRM008            NSCCAT-REQ-SET-LOCATION = '40'                                
LRM008                        OR                                                
                  NSCCAT-REQ-SET-LOCATION = '40'                                
                              OR                                                
                 (NSCCAT-REQ-SET-LOCATION = '45' AND                            
                  NSCCAT-REQ-SET-REASON = ('CASH' OR 'COMT' OR 'SMA '           
                                           OR ' SMA'))                          
LRM002                        OR                                                
LRM002           (NSCCAT-REQ-TRAN-CODE = SPACES AND                             
LRM002            NSCCAT-QTY-REQ-IND = 'F')                                     
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
                  ' FAIL ON PTR/PTF CASH 3 '                                    
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-EXIT                                       
              END-IF                                                            
           ELSE                                                                 
              INSPECT NSCCAT-ASSET-QTY REPLACING ALL SPACES BY ZEROES           
              MOVE NSCCAT-ASSET-QTY TO WS-QTY-TABLE                             
              MOVE ZERO                    TO  S2                               
              PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 17                      
                 IF WS-QTY-LIT (S1) = ','                                       
                    CONTINUE                                                    
                 ELSE                                                           
                    IF WS-QTY-LIT (S1) NOT NUMERIC                              
                       MOVE 'E'         TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001                 DISPLAY 'IREC ' INPUT-REC-CNTR                           
                        ' FAIL QTY DIGITS '                                     
                       MOVE 18              TO  S1                              
                    END-IF                                                      
                 END-IF                                                         
              END-PERFORM                                                       
              IF NSCCAT-ASSET-COMMENT (120:1) = 'E'                             
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-EXIT                                       
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF NSCCAT-ASSET-PRCNT = (ZEROES OR SPACES OR LOW-VALUES) AND         
LRM005       (NSCCAT-TRANSFER-TYPE = 'PTR' OR 'PTF')                AND         
              NSCCAT-REQ-TRAN-CODE = '1'                                        
              MOVE 'E'                  TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001        DISPLAY 'IREC ' INPUT-REC-CNTR                                    
               ' FAIL PCT'                                                      
              SET AT-EDIT-CHECK-NOT-OK      TO  TRUE                            
              GO TO AT-EDIT-CHECK-EXIT                                          
           ELSE                                                                 
              INSPECT NSCCAT-ASSET-PRCNT REPLACING ALL SPACES BY ZEROES         
              MOVE NSCCAT-ASSET-PRCNT       TO  WS-PRCNT-TABLE                  
              PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 15                      
                 IF WS-PRCNT-LIT (S1) = ','                                     
                    CONTINUE                                                    
                 ELSE                                                           
                    IF WS-PRCNT-LIT (S1) NOT NUMERIC                            
                       MOVE 'E'         TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001                 DISPLAY 'IREC ' INPUT-REC-CNTR                           
                        ' FAIL PCT DIGITS '                                     
                       MOVE 16              TO  S1                              
                    END-IF                                                      
                 END-IF                                                         
              END-PERFORM                                                       
              IF NSCCAT-ASSET-COMMENT (120:1) = 'E'                             
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-EXIT                                       
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EVALUATE NSCCAT-POSITION-CODE                                        
              WHEN 'S'                                                          
                 CONTINUE                                                       
              WHEN 'L'                                                          
                 CONTINUE                                                       
              WHEN 'N'                                                          
                 IF NSCCAT-REQ-SET-REASON NOT = 'COMT'                          
                    MOVE 'E'            TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001              DISPLAY 'IREC ' INPUT-REC-CNTR                              
                     ' FAIL POSN CODE '                                         
                    SET AT-EDIT-CHECK-NOT-OK TO  TRUE                           
                    GO TO AT-EDIT-CHECK-EXIT                                    
                 END-IF                                                         
              WHEN OTHER                                                        
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
LRM001            ' POSN CODE ' NSCCAT-POSITION-CODE                            
                 GO TO AT-EDIT-CHECK-EXIT                                       
           END-EVALUATE.                                                        
                                                                                
********** AS PER SYSTEM SPECS - ONLY USD CURRENCY IS USED                      
           EVALUATE NSCCAT-ISO-CRNCY-CD                                         
              WHEN SPACES                                                       
                 IF NSCCAT-ASSET-PRICE-CATG = 'FCUR'                            
                    MOVE 'E'            TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001              DISPLAY 'IREC ' INPUT-REC-CNTR                              
                     ' FAIL PRICE FCUR ' NSCCAT-ISO-CRNCY-CD                    
                    SET AT-EDIT-CHECK-NOT-OK TO TRUE                            
                    GO TO AT-EDIT-CHECK-EXIT                                    
                 ELSE                                                           
                    MOVE 'USD'              TO  NSCCAT-ISO-CRNCY-CD             
                 END-IF                                                         
              WHEN 'USD'                                                        
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
                 ' FAIL PRICE FCUR UNKNOWN ' NSCCAT-ISO-CRNCY-CD                
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-EXIT                                       
           END-EVALUATE.                                                        
                                                                                
           INSPECT NSCCAT-ASSET-AMOUNT REPLACING ALL SPACES BY ZEROES.          
           IF (NSCCAT-ASSET-AMOUNT = ZEROES OR SPACES OR LOW-VALUES OR          
                                     HIGH-VALUES)                               
LRM005        IF ((NSCCAT-TRANSFER-TYPE = 'PTR' OR 'PTF') AND                   
                  NSCCAT-REQ-TRAN-CODE = ('1' OR '2'))                          
LRM002                       OR                                                 
LRM005          ((NSCCAT-TRANSFER-TYPE = 'PTR' OR 'PTF') AND                    
LRM002            NSCCAT-REQ-TRAN-CODE = SPACES AND                             
LRM002            NSCCAT-QTY-REQ-IND = 'F')                                     
                             OR                                                 
                 (NSCCAT-REQ-SET-LOCATION = '45' AND                            
                  NSCCAT-REQ-SET-REASON = ('CASH' OR 'COMT' OR 'SMA '           
                                           OR ' SMA'))                          
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
                  ' FAIL ON CASH 4 '                                            
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-EXIT                                       
              END-IF                                                            
           ELSE                                                                 
              IF NSCCAT-ASSET-AMOUNT (15:1) NOT = ',' AND                       
                 NSCCAT-ISO-CRNCY-CD = 'USD'                                    
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
                  ' FAIL AMT COMMA '                                            
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-EXIT                                       
              ELSE                                                              
                 IF NSCCAT-ASSET-AMOUNT (1:14) NOT NUMERIC OR                   
                    NSCCAT-ASSET-AMOUNT (16:2) NOT NUMERIC                      
                    MOVE 'E'            TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001              DISPLAY 'IREC ' INPUT-REC-CNTR                              
                     ' FAIL AMT NUMERIC '                                       
                    SET AT-EDIT-CHECK-NOT-OK TO TRUE                            
                    GO TO AT-EDIT-CHECK-EXIT                                    
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE NSCCAT-BEARER-BOND          TO  VALID-BEARER-BONDS.             
                                                                                
           IF VALID-BEARER-BOND                                                 
              CONTINUE                                                          
           ELSE                                                                 
              IF NSCCAT-BEARER-BOND = SPACE                                     
                 IF NSCCAT-REQ-SET-LOCATION = ('35' OR '40'                     
LRM001                                     OR '45')                             
                              OR                                                
                    (NSCCAT-REQ-SET-LOCATION = '40' AND                         
                     NSCCAT-REQ-SET-REASON = ('CASH' OR 'COMT' OR 'SMA '        
                                              OR ' SMA'))                       
                    CONTINUE                                                    
                 ELSE                                                           
                    MOVE 'E'            TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001              DISPLAY 'IREC ' INPUT-REC-CNTR                              
                     ' FAIL BEARER '                                            
LRM001                 ' VALUE=' NSCCAT-BEARER-BOND                             
                    SET AT-EDIT-CHECK-NOT-OK TO TRUE                            
                    GO TO AT-EDIT-CHECK-EXIT                                    
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE NSCCAT-CASH-MRG-SHRT-CD     TO  VALID-CASH-MRG-SHRT-CDS.        
                                                                                
           IF VALID-CASH-MRG-SHRT-CD                                            
              CONTINUE                                                          
           ELSE                                                                 
              IF NSCCAT-CASH-MRG-SHRT-CD = SPACE                                
                 IF (NSCCAT-REQ-SET-LOCATION = ('40' OR '45')) OR               
                    VALID-ACCT-TYPE                                             
                    CONTINUE                                                    
                 ELSE                                                           
                    MOVE 'E'            TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001              DISPLAY 'IREC ' INPUT-REC-CNTR                              
                    ' FAIL ON CASH 5 '                                          
                    SET AT-EDIT-CHECK-NOT-OK TO TRUE                            
                    GO TO AT-EDIT-CHECK-EXIT                                    
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EVALUATE NSCCAT-REQ-SET-LOCATION                                     
              WHEN '35'                                                         
LRM011         IF NSCCAT-TRANS-TYPE NOT = 'D'                                   
                 IF NSCCAT-OPTION-CAT > ZERO                                    
                    IF NSCCAT-REC-LENGTH NOT = 497                              
                       MOVE 'E'         TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001                 DISPLAY 'IREC ' INPUT-REC-CNTR                           
                        ' FAIL LEN 497 '                                        
                       SET AT-EDIT-CHECK-NOT-OK TO TRUE                         
                       GO TO AT-EDIT-CHECK-EXIT                                 
                    ELSE                                                        
                       PERFORM AT-EDIT-CHECK-OPTION                             
                          THRU AT-EDIT-CHECK-OPTION-EXIT                        
                    END-IF                                                      
                 END-IF                                                         
LRM011         END-IF                                                           
              WHEN '10'                                                         
DJ0001           IF NSCCAT-REC-LENGTH NOT = (465 AND 550)                       
                    MOVE 'E'            TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001              DISPLAY 'IREC ' INPUT-REC-CNTR                              
                     ' FAIL LEN 465 550 '                                       
LRM001               ' LENGTH READ ' NSCCAT-REC-LENGTH                          
                    SET AT-EDIT-CHECK-NOT-OK TO TRUE                            
                    GO TO AT-EDIT-CHECK-EXIT                                    
                 ELSE                                                           
                    PERFORM AT-EDIT-CHECK-MF                                    
                 END-IF                                                         
           END-EVALUATE.                                                        
                                                                                
LRM008     IF NSCCAT-TRANSFER-TYPE = 'PTF'                                      
LRM008        EXEC SQL SELECT                                                   
LRM008              CLIENT_NBR                                                  
LRM008           INTO                                                           
LRM008              :DCLACTIAST.CLIENT-NBR                                      
LRM008          FROM ACTIAST                                                    
LRM008           WHERE CLIENT_NBR       = :CLIENT-NUMBER             AND        
LRM008              DLVR_NBR            = :NSCCAT-ORG-DEL-NBR        AND        
LRM008              ACCT_DLVR_NBR       = :NSCCTI-ORG-DEL-ACCT-NBR   AND        
LRM008              RCV_NBR             = :NSCCAT-ORG-RCV-NBR        AND        
LRM008              ACCT_RCV_NBR        = :NSCCTI-ORG-RCV-CUS-ACCT   AND        
LRM008              ISIN_CNTRY_CD       = :NSCCAT-ISIN-CNTRY-CODE    AND        
LRM008              ISIN_SEC_ISSUE_CD   = :NSCCAT-ISIN-SECU-ISSU-ID  AND        
LRM008              ISIN_SEC_CDG_CD     = :NSCCAT-ISIN-SECU-CHK-DIG  AND        
LRM008              STTLM_LCTN_CD       = :NSCCAT-REQ-SET-LOCATION   AND        
LRM008              CSH_MGN_SHRT_CD     = :NSCCAT-CASH-MRG-SHRT-CD   AND        
LRM008              TRNFR_TYPE_CD       = :NSCCAT-TRANSFER-TYPE                 
LRM008        END-EXEC                                                          
LRM008        IF SQLCODE = +0 OR -811                                           
LRM008           MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM008           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
LRM008            ' FAIL PTF DUPE ASSET'                                        
LRM008              SET AT-EDIT-CHECK-NOT-OK TO TRUE                            
LRM008              GO TO AT-EDIT-CHECK-EXIT                                    
LRM008        END-IF                                                            
LRM008     END-IF.                                                              
                                                                                
           EJECT                                                                
      ********************                                                      
       AT-EDIT-CHECK-EXIT.                                                      
      ********************                                                      
                                                                                
           EXIT.                                                                
                                                                                
       DISPLAY-GROUP-ERRORS.                                                    
           IF (NOT VALID-AT-REC-LENGTH)                                         
             DISPLAY 'REC LEN ' INPUT-AT-CNTR                                   
           END-IF.                                                              
           IF (NSCCAT-PHSCL-SEQ-NBR NOT = 1)                                    
             DISPLAY 'PHYS SEQ ' INPUT-AT-CNTR                                  
           END-IF.                                                              
           IF (NSCCAT-LGCL-SEQ-NBR NOT = 1)                                     
             DISPLAY 'LGCL SEQ ' INPUT-AT-CNTR                                  
           END-IF.                                                              
           IF (NSCCAT-SUB-PART-NBR = SPACES)                                    
             DISPLAY 'SUB PART ' INPUT-AT-CNTR                                  
           END-IF.                                                              
           IF (NSCCAT-ORG-RCV-NBR = SPACES)                                     
             DISPLAY 'ORG RCV ' INPUT-AT-CNTR                                   
           END-IF.                                                              
           IF (NSCCAT-ORG-DEL-NBR = SPACES)                                     
             DISPLAY 'ORG DEL ' INPUT-AT-CNTR                                   
           END-IF.                                                              
           IF (NSCCAT-ASSET-SEQ-NBR NOT NUMERIC)                                
             DISPLAY 'AST SEQ ' INPUT-AT-CNTR                                   
           END-IF.                                                              
           IF (NSCCAT-ASSET-SEQ-NBR NOT = ZERO)                                 
             DISPLAY 'AST ZERO ' INPUT-AT-CNTR                                  
           END-IF.                                                              
           IF (NOT VALID-PRICE-CTG)                                             
             DISPLAY 'PRC CTG ' INPUT-AT-CNTR                                   
           END-IF.                                                              
           IF (NOT VALID-OPTION-CTG)                                            
             DISPLAY 'OPT CTG ' INPUT-AT-CNTR                                   
           END-IF.                                                              
           IF (NOT VALID-STTLM-LCTN)                                            
             DISPLAY 'STTLM L ' INPUT-AT-CNTR                                   
           END-IF.                                                              
           IF (NOT VALID-POSITION-CD)                                           
             DISPLAY 'POSN CD ' INPUT-AT-CNTR                                   
           END-IF.                                                              
           IF (NOT VALID-WI-CD)                                                 
             DISPLAY 'WI CD ' INPUT-AT-CNTR                                     
           END-IF.                                                              
           EJECT                                                                
      **********************                                                    
       AT-EDIT-CHECK-OPTION.                                                    
      **********************                                                    
                                                                                
LRM007**** IF PARM-STREAM = 'Q'                                                 
LRM006        PERFORM AT-EDIT-CHECK-OPTION-NEW                                  
LRM006           THRU AT-EDIT-CHECK-OPTION-NEW-EXIT                             
LRM006           GO TO AT-EDIT-CHECK-OPTION-EXIT.                               
LRM006**** END-IF.                                                              
                                                                                
           MOVE NSCCAT-OPT-BUY-SELL-IND    TO  VALID-BUY-SELL-CDS.              
           MOVE NSCCAT-P-C-IND             TO  VALID-PUT-CALL-CDS.              
           MOVE NSCCAT-OPT-STRK-FRCTN      TO  VALID-STRIKE-FRCTNS.             
                                                                                
           IF (NOT VALID-BUY-SELL-CD)                           OR              
              (NOT VALID-PUT-CALL-CD)                           OR              
              (NSCCAT-OPTION-SYM = SPACES)                      OR              
              (NSCCAT-EXP-DATE = SPACES)                        OR              
              (NSCCAT-OPT-STPRC-INTR = SPACES)                  OR              
              (NOT VALID-STRIKE-FRCTN)                                          
              MOVE 'E'                  TO  NSCCAT-ASSET-COMMENT (120:1)        
                                                NSCCAT-OPTION-COMMENT           
LRM001        DISPLAY 'IREC ' INPUT-REC-CNTR                                    
               ' FAIL OPTION '                                                  
              SET AT-EDIT-CHECK-NOT-OK      TO  TRUE                            
              GO TO AT-EDIT-CHECK-OPTION-EXIT                                   
           END-IF.                                                              
                                                                                
           MOVE NSCCAT-O-C-IND              TO  VALID-OPEN-CLOSE-CDS.           
                                                                                
           IF NSCCAT-O-C-IND NOT = SPACES                                       
              IF NOT VALID-OPEN-CLOSE-CD                                        
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
                                                NSCCAT-OPTION-COMMENT           
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
                  ' FAIL O-C ' NSCCAT-O-C-IND                                   
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-OPTION-EXIT                                
              END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE NSCCAT-OPT-ACCT-TYPE        TO VALID-OPTN-ACCT-TYPE-CDS.        
           IF NSCCAT-OPT-ACCT-TYPE NOT = SPACES                                 
              IF NOT VALID-OPTN-ACCT-TYPE-CD                                    
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
                                                NSCCAT-OPTION-COMMENT           
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
                  ' FAIL OPT ACC TYPE ' NSCCAT-OPT-ACCT-TYPE                    
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ***************************                                               
       AT-EDIT-CHECK-OPTION-EXIT.                                               
      ***************************                                               
                                                                                
           EXIT.                                                                
                                                                                
           EJECT                                                                
      **********************                                                    
LRM006 AT-EDIT-CHECK-OPTION-NEW.                                                
      **********************                                                    
                                                                                
           MOVE NSCCAT-OPT-BUY-SELL-IND    TO  VALID-BUY-SELL-CDS.              
           MOVE NSCCAT-P-C-IND             TO  VALID-PUT-CALL-CDS.              
           MOVE NSCCAT-OPT-STRK-FRCTN      TO  VALID-STRIKE-FRCTNS.             
                                                                                
           IF (NOT VALID-BUY-SELL-CD)                           OR              
              (NOT VALID-PUT-CALL-CD)                           OR              
              (NSCCAT-OPTION-SYM = SPACES)                      OR              
              (NSCCAT-EXP-DATE-NEW NOT NUMERIC)                 OR              
              (NSCCAT-EXP-DATE-NEW (5 : 2) < '01' OR > '12')    OR              
              (NSCCAT-EXP-DATE-NEW (7 : 2) < '01' OR > '31')    OR              
              (NSCCAT-OPT-STPRC-INTR = SPACES)                  OR              
              (NSCCAT-OPT-STRK-FRCTN-NEW NOT NUMERIC)                           
              MOVE 'E'                  TO  NSCCAT-ASSET-COMMENT (120:1)        
                                                NSCCAT-OPTION-COMMENT           
LRM001        DISPLAY 'IREC ' INPUT-REC-CNTR                                    
               ' FAIL OPTION '                                                  
              SET AT-EDIT-CHECK-NOT-OK      TO  TRUE                            
              GO TO AT-EDIT-CHECK-OPTION-EXIT                                   
           END-IF.                                                              
                                                                                
           MOVE NSCCAT-O-C-IND              TO  VALID-OPEN-CLOSE-CDS.           
                                                                                
           IF NSCCAT-O-C-IND NOT = SPACES                                       
              IF NOT VALID-OPEN-CLOSE-CD                                        
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
                                                NSCCAT-OPTION-COMMENT           
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
                  ' FAIL O-C ' NSCCAT-O-C-IND                                   
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
                 GO TO AT-EDIT-CHECK-OPTION-EXIT                                
              END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE NSCCAT-OPT-ACCT-TYPE        TO VALID-OPTN-ACCT-TYPE-CDS.        
           IF NSCCAT-OPT-ACCT-TYPE NOT = SPACES                                 
              IF NOT VALID-OPTN-ACCT-TYPE-CD                                    
                 MOVE 'E'               TO  NSCCAT-ASSET-COMMENT (120:1)        
                                                NSCCAT-OPTION-COMMENT           
LRM001           DISPLAY 'IREC ' INPUT-REC-CNTR                                 
                  ' FAIL OPT ACC TYPE ' NSCCAT-OPT-ACCT-TYPE                    
                 SET AT-EDIT-CHECK-NOT-OK   TO  TRUE                            
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ***************************                                               
       AT-EDIT-CHECK-OPTION-NEW-EXIT.                                           
      ***************************                                               
                                                                                
           EXIT.                                                                
                                                                                
           EJECT                                                                
      ******************                                                        
       AT-EDIT-CHECK-MF.                                                        
      ******************                                                        
                                                                                
           MOVE NSCCAT-MF-SHR-IND           TO  VALID-BK-PHSCL-SHR-CDS.         
           MOVE NSCCAT-MF-NTWK-CNTL-IND     TO  VALID-NTWRK-CNTL-CDS.           
           MOVE NSCCAT-MF-ACCT-TYPE-IND     TO  VALID-MF-ACCT-TYPE-CDS.         
           MOVE NSCCAT-DIVDND-CODE          TO  VALID-DVDND-CDS.                
           MOVE NSCCAT-DIVDND-PAYEE-IND     TO  VALID-DVDND-PAYEE-CDS.          
           MOVE NSCCAT-MF-FULPART-IND       TO  VALID-FULL-PARTIAL-CDS.         
                                                                                
LRM007     IF NSCCAT-TRANSFER-TYPE = 'PTF'                                      
LRM007        CONTINUE                                                          
LRM007     ELSE                                                                 
           IF (NOT VALID-BK-PHSCL-SHR-CD)   OR                                  
              (NOT VALID-NTWRK-CNTL-CD)     OR                                  
              (NOT VALID-MF-ACCT-TYPE-CD)   OR                                  
              (NOT VALID-DVDND-CD)          OR                                  
              (NOT VALID-DVDND-PAYEE-CD)    OR                                  
              (NSCCAT-EXC-BROKR = SPACES)   OR                                  
              (NOT VALID-FULL-PARTIAL-CD)                                       
              MOVE 'E'                  TO  NSCCAT-ASSET-COMMENT (120:1)        
LRM001        DISPLAY 'IREC ' INPUT-REC-CNTR                                    
               ' FAIL MF GROUP EDIT'                                            
              SET AT-EDIT-CHECK-NOT-OK       TO  TRUE                           
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ***************************                                               
       ADD-TI-RECORD-TO-DATABASE.                                               
      ***************************                                               
                                                                                
LRM008     IF NSCCTI-TRNFR-TYPE = 'PTF'                                         
LRM008        PERFORM 0205-FIND-NEXT-DUMMY-CNTL-RTN                             
LRM008        MOVE WS-ACAT-CONTROL-NBR                                          
LRM008                    TO NSCCTI-ACATS-CNTL-NBR                              
LRM008                       NSCCAT-ACATS-CNTL-NBR                              
LRM008        IF NSCCTI-ASSC-STTLM-DATE = SPACES OR LOW-VALUES                  
LRM008           MOVE '0001'                    TO  WS-DB-DATE-CCYY             
LRM008           MOVE '01'                      TO  WS-DB-DATE-MM               
LRM008           MOVE '01'                      TO  WS-DB-DATE-DD               
LRM008           MOVE '-'                       TO  WS-DB-SEP1                  
LRM008                                              WS-DB-SEP2                  
LRM008        ELSE                                                              
LRM008           MOVE NSCCTI-ASSC-STTLM-DATE (1:4) TO  WS-DB-DATE-CCYY          
LRM008           MOVE NSCCTI-ASSC-STTLM-DATE (5:2) TO  WS-DB-DATE-MM            
LRM008           MOVE NSCCTI-ASSC-STTLM-DATE (7:2) TO  WS-DB-DATE-DD            
LRM008           MOVE '-'                          TO  WS-DB-SEP1               
LRM008                                                 WS-DB-SEP2               
LRM008        END-IF                                                            
LRM008        MOVE WS-DB-DATE                TO  WS-STTLM-ASCTD-DT              
LRM008        MOVE '0001'                       TO  WS-DB-DATE-CCYY             
LRM008        MOVE '01'                         TO  WS-DB-DATE-MM               
LRM008        MOVE '01'                         TO  WS-DB-DATE-DD               
LRM008        MOVE WS-DB-DATE                   TO  WS-PRCS-DT                  
LRM008        PERFORM INSERT-TI-RECORD                                          
LRM008        GO TO ADD-TI-RECORD-EXIT                                          
LRM008     END-IF.                                                              
                                                                                
           PERFORM UPDATE-TI-RECORD.                                            
           IF SQLCODE = +100                                                    
              PERFORM INSERT-TI-RECORD                                          
           END-IF.                                                              
       ADD-TI-RECORD-EXIT. EXIT.                                                
                                                                                
           EJECT                                                                
      ***************************                                               
       ADD-AT-RECORD-TO-DATABASE.                                               
      ***************************                                               
                                                                                
           PERFORM UPDATE-AT-RECORD                                             
LRM008        THRU UPDATE-AT-RECORD-EXIT.                                       
           IF SQLCODE = +100                                                    
              PERFORM INSERT-AT-RECORD                                          
           END-IF.                                                              
                                                                                
           EVALUATE NSCCAT-REC-LENGTH                                           
              WHEN 431                                                          
                CONTINUE                                                        
DJ0001        WHEN 550                                                          
              WHEN 465                                                          
                PERFORM UPDATE-AT-MF-RECORD                                     
                IF SQLCODE = +100                                               
                  PERFORM INSERT-AT-MF-RECORD                                   
                END-IF                                                          
              WHEN 497                                                          
                PERFORM UPDATE-AT-OPN-RECORD                                    
                IF SQLCODE = +100                                               
                 PERFORM INSERT-AT-OPN-RECORD                                   
                END-IF                                                          
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *****************                                                         
       WRITE-AT-RECORD.                                                         
      *****************                                                         
                                                                                
           EVALUATE NSCCAT-REC-LENGTH                                           
              WHEN 431                                                          
                 MOVE NSCCAT-RECORD         TO  OUTACAT-AT-REC                  
                 WRITE OUTACAT-AT-REC                                           
DJ0001        WHEN 550                                                          
              WHEN 465                                                          
                 MOVE NSCCAT-RECORD         TO  OUTACAT-AT-BASIC2               
                 MOVE NSCCAT-MF-AREA        TO  OUTACAT-AT-MF                   
                 WRITE OUTACAT-AT-MF-REC                                        
              WHEN 497                                                          
                 MOVE NSCCAT-RECORD         TO  OUTACAT-AT-BASIC1               
                 MOVE NSCCAT-OPTION-AREA    TO  OUTACAT-AT-OPTN                 
                 WRITE OUTACAT-AT-OPTN-REC                                      
              WHEN OTHER                                                        
                 MOVE NSCCAT-RECORD         TO  OUTACAT-AT-BASIC1               
                 MOVE NSCCAT-OPTION-AREA    TO  OUTACAT-AT-MF                   
                 WRITE OUTACAT-AT-OPTN-REC                                      
           END-EVALUATE.                                                        
           ADD 1                            TO  OUTPUT-REC-CNTR                 
                                                AT-REJECTED-CNTR.               
                                                                                
           EJECT                                                                
      ******************                                                        
       UPDATE-TI-RECORD.                                                        
      ******************                                                        
                                                                                
           IF NSCCTI-ASSC-STTLM-DATE = SPACES OR LOW-VALUES                     
              MOVE '0001'                    TO  WS-DB-DATE-CCYY                
              MOVE '01'                      TO  WS-DB-DATE-MM                  
              MOVE '01'                      TO  WS-DB-DATE-DD                  
              MOVE '-'                       TO  WS-DB-SEP1                     
                                                 WS-DB-SEP2                     
           ELSE                                                                 
              MOVE NSCCTI-ASSC-STTLM-DATE (1:4) TO  WS-DB-DATE-CCYY             
              MOVE NSCCTI-ASSC-STTLM-DATE (5:2) TO  WS-DB-DATE-MM               
              MOVE NSCCTI-ASSC-STTLM-DATE (7:2) TO  WS-DB-DATE-DD               
              MOVE '-'                          TO  WS-DB-SEP1                  
                                                    WS-DB-SEP2                  
           END-IF.                                                              
           MOVE WS-DB-DATE                   TO  WS-STTLM-ASCTD-DT.             
                                                                                
           MOVE '0001'                       TO  WS-DB-DATE-CCYY.               
           MOVE '01'                         TO  WS-DB-DATE-MM.                 
           MOVE '01'                         TO  WS-DB-DATE-DD.                 
           MOVE WS-DB-DATE                   TO  WS-PRCS-DT.                    
                                                                                
           EXEC SQL                                                             
              UPDATE ACTITRF                                                    
              SET  SBMTG_PRTCP_NBR    = :NSCCTI-SUB-PART-NBR                    
                  ,ACAT_CONTROL_NBR   = :NSCCTI-ACATS-CNTL-NBR                  
                  ,TRANS_TYPE_CD      = :NSCCTI-TRANS-TYPE                      
                  ,RCV_CUST_NM        = :NSCCTI-ORG-RCV-CUS-NAME                
                  ,RCV_SS_PRIM_NBR    = :NSCCTI-ORG-RCV-SSN-PRM                 
                  ,RCV_SS_SCNDY_NBR   = :NSCCTI-ORG-RCV-SSN-SEC                 
                  ,RCV_ACCT_TYPE_CD   = :NSCCTI-ORG-RCV-ACCT-TYP                
                  ,RCV_OCC_BRKR_NBR   = :NSCCTI-ORG-OCC-BRKR-NBR                
                  ,RCV_CRSPN_NBR      = :NSCCTI-ORG-RCV-CRRSP                   
                  ,ACAT_CNTL_ASTD_NBR = :NSCCTI-ASSC-ACATS-CNTL                 
                  ,CMNT_TXT           = :NSCCTI-COMMENTS                        
                  ,PRCS_DT            = :WS-PRCS-DT                             
                  ,TRNFR_TYPE_RJCT_CD = :NSCCTI-TRNFR-TYPE-REJ                  
                  ,TRANS_RFRN_ID_CD   = :NSCCTI-TRNFR-REF-ID                    
                  ,STTLM_ASCTD_DT     = :WS-STTLM-ASCTD-DT                      
                  ,NSCC_PEND_CD       =  ' '                                    
                  ,UPDT_TMSTP         =  CURRENT TIMESTAMP                      
                  ,CRT_TMSTP          =  CURRENT TIMESTAMP                      
                  ,PRGM_NM            =  'CAT950  '                             
LRM004            ,GIFT_IND           =  :NSCCTI-GIFT-IND                       
              WHERE CLIENT_NBR         = :CLIENT-NUMBER         AND             
                    DLVR_NBR           = :NSCCTI-ORG-DEL-NBR    AND             
                    ACCT_DLVR_NBR      = :NSCCTI-ORG-DEL-ACCT-NBR AND           
                    RCV_NBR            = :NSCCTI-ORG-RCV-NBR      AND           
                    ACCT_RCV_NBR       = :NSCCTI-ORG-RCV-CUS-ACCT AND           
                    TRNFR_TYPE_CD      = :NSCCTI-TRNFR-TYPE                     
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = +0                                                      
              ADD 1                         TO  TI-UPDATED-CNTR                 
           ELSE                                                                 
              IF SQLCODE = +100                                                 
                 CONTINUE                                                       
              ELSE                                                              
                 DISPLAY 'CAT950 DB2 PROBLEM ACTITRF UPD'                       
                 PERFORM SQL-ERROR-ROUTINE                                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ******************                                                        
       INSERT-TI-RECORD.                                                        
      ******************                                                        
                                                                                
           INITIALIZE DCLACTITRF.                                               
           MOVE SPACE                        TO  NSCC-PEND-CD                   
                                             OF  DCLACTITRF.                    
LRM001     IF NSCCTI-TRNFR-TYPE = 'PTD'                                         
LRM008     OR (NSCCTI-TRNFR-TYPE = 'PTF'                                        
LRM008     AND NSCCTI-ORG-DEL-NBR = WS-BKR-CLR-NO)                              
              MOVE 'D' TO DSTBN-SIDE-CD OF DCLACTITRF                           
           ELSE                                                                 
              MOVE 'R' TO DSTBN-SIDE-CD OF DCLACTITRF                           
           END-IF.                                                              
                                                                                
           EXEC SQL                                                             
              INSERT INTO ACTITRF                                               
                 ( CLIENT_NBR                                                   
                   ,DLVR_NBR                                                    
                   ,ACCT_DLVR_NBR                                               
                   ,RCV_NBR                                                     
                   ,ACCT_RCV_NBR                                                
                   ,TRNFR_TYPE_CD                                               
                   ,RCV_NBR_STTS_CD                                             
                   ,DLVR_NBR_STTS_CD                                            
                   ,ACCT_RCV_STTS_CD                                            
                   ,ACCT_DLVR_STTS_CD                                           
                   ,SBMTG_PRTCP_NBR                                             
                   ,SBMT_PRT_NR_STS_CD                                          
                   ,ACAT_CONTROL_NBR                                            
                   ,CONTROL_NBR_STS_CD                                          
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
                   ,DSTBN_SIDE_CD                                               
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,TRNFR_TYPE_RJCT_CD                                          
                   ,TRNFR_TYPE_RJC1_CD                                          
                   ,TRNFR_TYPE_RJC2_CD                                          
                   ,TRN_TYP_RJC_STS_CD                                          
                   ,PHSCL_SEQ_NBR                                               
                   ,PHSCL_SEQ_STTS_CD                                           
                   ,LGCL_SEQ_NBR                                                
                   ,LGCL_SEQ_NR_STS_CD                                          
                   ,PRTCP_CONTRA_CD                                             
                   ,CYCLE_CD                                                    
                   ,DAYS_STTS_QTY                                               
                   ,TRANS_RFRN_ID_CD                                            
                   ,TRANS_RFRN_STTS_CD                                          
                   ,DB_CR_CD                                                    
                   ,STTLM_ASCTD_DT                                              
                   ,STTLM_ASCTD_STS_CD                                          
                   ,RCRD_LNGTH_STTS_CD                                          
                   ,RCRD_STTS_CD                                                
                   ,NSCC_PEND_CD                                                
                   ,NSCC_ACK_IND                                                
                   ,UPDT_TMSTP                                                  
                   ,CRT_TMSTP                                                   
                   ,CICS_TERM_ID_CD                                             
                   ,PRGM_NM                                                     
                   ,RR_CD                                                       
LRM004             ,GIFT_IND)                                                   
              VALUES                                                            
                  ( :CLIENT-NUMBER                                              
                   ,:NSCCTI-ORG-DEL-NBR                                         
                   ,:NSCCTI-ORG-DEL-ACCT-NBR                                    
                   ,:NSCCTI-ORG-RCV-NBR                                         
                   ,:NSCCTI-ORG-RCV-CUS-ACCT                                    
                   ,:NSCCTI-TRNFR-TYPE                                          
                   ,:DCLACTITRF.RCV-NBR-STTS-CD                                 
                   ,:DCLACTITRF.DLVR-NBR-STTS-CD                                
                   ,:DCLACTITRF.ACCT-RCV-STTS-CD                                
                   ,:DCLACTITRF.ACCT-DLVR-STTS-CD                               
                   ,:NSCCTI-SUB-PART-NBR                                        
                   ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                              
                   ,:NSCCTI-ACATS-CNTL-NBR                                      
                   ,:DCLACTITRF.CONTROL-NBR-STS-CD                              
                   ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                              
                   ,:NSCCTI-TRANS-TYPE                                          
                   ,:DCLACTITRF.TRANS-TYPE-STTS-CD                              
                   ,:NSCCTI-ORG-RCV-CUS-NAME                                    
                   ,:DCLACTITRF.RCV-CUST-NM-STS-CD                              
                   ,:NSCCTI-ORG-RCV-SSN-PRM                                     
                   ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                              
                   ,:NSCCTI-ORG-RCV-SSN-SEC                                     
                   ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                              
                   ,:NSCCTI-ORG-RCV-ACCT-TYP                                    
                   ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                              
                   ,:NSCCTI-ORG-OCC-BRKR-NBR                                    
                   ,:DCLACTITRF.RCV-OCC-STTS-CD                                 
                   ,:NSCCTI-ORG-RCV-CRRSP                                       
                   ,:DCLACTITRF.RCV-CRSPN-STTS-CD                               
                   ,:NSCCTI-ASSC-ACATS-CNTL                                     
                   ,:DCLACTITRF.CNTL-ASTD-STTS-CD                               
                   ,:NSCCTI-COMMENTS                                            
                   ,:DCLACTITRF.CMNT-STTS-CD                                    
                   ,:WS-PRCS-DT                                                 
                   ,:DCLACTITRF.STTS-CD                                         
                   ,:DCLACTITRF.DSTBN-SIDE-CD                                   
                   ,:DCLACTITRF.SYS-ACT-CD                                      
                   ,:DCLACTITRF.SYS-RJCT-RSN-CD                                 
                   ,:NSCCTI-TRNFR-TYPE-REJ                                      
                   ,:DCLACTITRF.TRNFR-TYPE-RJC1-CD                              
                   ,:DCLACTITRF.TRNFR-TYPE-RJC2-CD                              
                   ,:DCLACTITRF.TRN-TYP-RJC-STS-CD                              
                   ,:DCLACTITRF.PHSCL-SEQ-NBR                                   
                   ,:DCLACTITRF.PHSCL-SEQ-STTS-CD                               
                   ,:DCLACTITRF.LGCL-SEQ-NBR                                    
                   ,:DCLACTITRF.LGCL-SEQ-NR-STS-CD                              
                   ,:DCLACTITRF.PRTCP-CONTRA-CD                                 
                   ,:DCLACTITRF.CYCLE-CD                                        
                   ,:DCLACTITRF.DAYS-STTS-QTY                                   
                   ,:NSCCTI-TRNFR-REF-ID                                        
                   ,:DCLACTITRF.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTITRF.DB-CR-CD                                        
                   ,:WS-STTLM-ASCTD-DT                                          
                   ,:DCLACTITRF.STTLM-ASCTD-STS-CD                              
                   ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTITRF.RCRD-STTS-CD                                    
                   ,:DCLACTITRF.NSCC-PEND-CD                                    
                   ,:DCLACTITRF.NSCC-ACK-IND                                    
                   ,CURRENT TIMESTAMP                                           
                   ,CURRENT TIMESTAMP                                           
                   ,:DCLACTITRF.CICS-TERM-ID-CD                                 
                   ,'CAT950  '                                                  
                   ,:DCLACTITRF.RR-CD                                           
LRM004             ,:NSCCTI-GIFT-IND                                            
                    )                                                           
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'CAT950 DB2 PROBLEM INSERT ACTITRF'                       
              PERFORM SQL-ERROR-ROUTINE                                         
           ELSE                                                                 
              ADD 1                         TO  TI-INSERTED-CNTR                
           END-IF.                                                              
                                                                                
LRM008 0205-FIND-NEXT-DUMMY-CNTL-RTN.                                           
LRM008     MOVE 'XX' TO WS-ACAT-CONTROL-NBR                                     
LRM008*** READ THE INIT TABLE FOR THE GREATEST ARTIFICIAL CNTL NBR              
LRM008*** FOR THIS SET OF KEYS... NONE FOUND USE SPACES                         
LRM008*** - NEED  SYNTAX FOR FIRST ONE                                          
   ******        FIRST 1 ROW ONLY                                               
           EXEC SQL OPEN                                                        
              ACTITRF_LAST_CNTL                                                 
           END-EXEC.                                                            
           IF SQLCODE = +0                                                      
              EXEC SQL FETCH                                                    
                 ACTITRF_LAST_CNTL                                              
                 INTO                                                           
                   :DCLACTITRF.ACAT-CONTROL-NBR                                 
               END-EXEC                                                         
            END-IF.                                                             
            EVALUATE SQLCODE                                                    
                WHEN +0                                                         
                     IF ACAT-CONTROL-NBR OF DCLACTITRF (1 : 2) = 'XX'           
                     AND ACAT-CONTROL-NBR OF DCLACTITRF (3 : 3) NUMERIC         
                       MOVE ACAT-CONTROL-NBR OF DCLACTITRF (3 : 3)              
                                 TO WS-NEXT-CNTL-NBR                            
                       ADD 1 TO WS-NEXT-CNTL-NBR                                
                       MOVE WS-NEXT-CNTL-NBR TO                                 
                               WS-ACAT-CONTROL-NBR(3 : 3)                       
                     ELSE                                                       
                        MOVE '001' TO WS-ACAT-CONTROL-NBR(3 : 3)                
                     END-IF                                                     
                WHEN +100                                                       
                     MOVE SPACES TO WS-ACAT-CONTROL-NBR                         
                WHEN OTHER                                                      
                     DISPLAY 'CAT950 DB2 FETCH DUMMY CNTL NBR'                  
                     PERFORM SQL-ERROR-ROUTINE                                  
            END-EVALUATE.                                                       
           EXEC SQL CLOSE                                                       
              ACTITRF_LAST_CNTL                                                 
           END-EXEC.                                                            
           EJECT                                                                
      ******************                                                        
       UPDATE-AT-RECORD.                                                        
      ******************                                                        
                                                                                
                                                                                
           MOVE NSCCAT-ASSET-SEQ-NBR       TO  WS-ASSET-SEQ-NBR                 
           MOVE NSCCAT-ASSET-QTY           TO  WS-QTY-TABLE.                    
           MOVE ZEROES                     TO  NUMBER-OF-INT-POS                
                                               NUMBER-OF-DEC-POS                
                                               S2                               
                                               WS-QTY-1                         
                                               WS-QTY-2                         
                                               WS-QTY-3                         
                                               WS-QTY-4.                        
           PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 17                         
              IF WS-QTY-LIT (S1) = ','                                          
                 MOVE S2                   TO  NUMBER-OF-INT-POS                
                 MOVE 0                    TO  S2                               
              ELSE                                                              
                 ADD 1                     TO  S2                               
              END-IF                                                            
           END-PERFORM.                                                         
           MOVE S2                         TO  NUMBER-OF-DEC-POS.               
           EVALUATE NUMBER-OF-DEC-POS                                           
              WHEN 0                                                            
                 MOVE NSCCAT-ASSET-QTY        TO WS-ASSET-QTY                   
              WHEN 1                                                            
                 MOVE NSCCAT-ASSET-QTY (1:15) TO WS-QTY-INT-1                   
                 MOVE NSCCAT-ASSET-QTY (17:1) TO WS-QTY-DEC-1                   
                 MOVE WS-QTY-1                TO WS-ASSET-QTY                   
              WHEN 2                                                            
                 MOVE NSCCAT-ASSET-QTY (1:14) TO WS-QTY-INT-2                   
                 MOVE NSCCAT-ASSET-QTY (16:2) TO WS-QTY-DEC-2                   
                 MOVE WS-QTY-2                TO WS-ASSET-QTY                   
              WHEN 3                                                            
                 MOVE NSCCAT-ASSET-QTY (1:13) TO WS-QTY-INT-3                   
                 MOVE NSCCAT-ASSET-QTY (15:3) TO WS-QTY-DEC-3                   
                 MOVE WS-QTY-3                TO WS-ASSET-QTY                   
              WHEN 4                                                            
                 MOVE NSCCAT-ASSET-QTY (1:12) TO WS-QTY-INT-4                   
                 MOVE NSCCAT-ASSET-QTY (14:4) TO WS-QTY-DEC-4                   
                 MOVE WS-QTY-4                TO WS-ASSET-QTY                   
              WHEN 5                                                            
                 MOVE NSCCAT-ASSET-QTY (1:11) TO WS-QTY-INT-4                   
                 MOVE NSCCAT-ASSET-QTY (13:4) TO WS-QTY-DEC-4                   
                 MOVE WS-QTY-4                TO WS-ASSET-QTY                   
              WHEN 6                                                            
                 MOVE NSCCAT-ASSET-QTY (1:10) TO WS-QTY-INT-4                   
                 MOVE NSCCAT-ASSET-QTY (12:4) TO WS-QTY-DEC-4                   
                 MOVE WS-QTY-4                TO WS-ASSET-QTY                   
              WHEN 7                                                            
                 MOVE NSCCAT-ASSET-QTY (1:9)  TO WS-QTY-INT-4                   
                 MOVE NSCCAT-ASSET-QTY (11:4) TO WS-QTY-DEC-4                   
                 MOVE WS-QTY-4                TO WS-ASSET-QTY                   
              WHEN 8                                                            
                 MOVE NSCCAT-ASSET-QTY (1:8)  TO WS-QTY-INT-4                   
                 MOVE NSCCAT-ASSET-QTY (10:4) TO WS-QTY-DEC-4                   
                 MOVE WS-QTY-4                TO WS-ASSET-QTY                   
              WHEN 9                                                            
                 MOVE NSCCAT-ASSET-QTY (1:7)  TO WS-QTY-INT-4                   
                 MOVE NSCCAT-ASSET-QTY (9:4)  TO WS-QTY-DEC-4                   
                 MOVE WS-QTY-4                TO WS-ASSET-QTY                   
              WHEN 10                                                           
                 MOVE NSCCAT-ASSET-QTY (1:6)  TO WS-QTY-INT-4                   
                 MOVE NSCCAT-ASSET-QTY (8:4)  TO WS-QTY-DEC-4                   
                 MOVE WS-QTY-4                TO WS-ASSET-QTY                   
              WHEN 11                                                           
                 MOVE NSCCAT-ASSET-QTY (1:5)  TO WS-QTY-INT-4                   
                 MOVE NSCCAT-ASSET-QTY (7:4)  TO WS-QTY-DEC-4                   
                 MOVE WS-QTY-4                TO WS-ASSET-QTY                   
              WHEN 12                                                           
                 MOVE NSCCAT-ASSET-QTY (1:4)  TO WS-QTY-INT-4                   
                 MOVE NSCCAT-ASSET-QTY (6:4)  TO WS-QTY-INT-4                   
                 MOVE WS-QTY-4                TO WS-ASSET-QTY                   
              WHEN 13                                                           
                 MOVE NSCCAT-ASSET-QTY (1:3)  TO WS-QTY-INT-4                   
                 MOVE NSCCAT-ASSET-QTY (5:4)  TO WS-QTY-DEC-4                   
                 MOVE WS-QTY-4                TO WS-ASSET-QTY                   
              WHEN 14                                                           
                 MOVE NSCCAT-ASSET-QTY (1:2)  TO WS-QTY-INT-4                   
                 MOVE NSCCAT-ASSET-QTY (4:4)  TO WS-QTY-DEC-4                   
                 MOVE WS-QTY-4                TO WS-ASSET-QTY                   
              WHEN 15                                                           
                 MOVE NSCCAT-ASSET-QTY (1:1)  TO WS-QTY-INT-4                   
                 MOVE NSCCAT-ASSET-QTY (3:4)  TO WS-QTY-DEC-4                   
                 MOVE WS-QTY-4                TO WS-ASSET-QTY                   
              WHEN 16                                                           
                 CONTINUE                                                       
              WHEN 17                                                           
                 MOVE ZERO                    TO WS-QTY-INT-4                   
                 MOVE NSCCAT-ASSET-QTY (1:4)  TO WS-QTY-DEC-4                   
                 MOVE WS-QTY-4                TO WS-ASSET-QTY                   
           END-EVALUATE.                                                        
                                                                                
           MOVE NSCCAT-ASSET-PRCNT         TO  WS-PRCNT-TABLE.                  
           MOVE ZERO                       TO  NUMBER-OF-INT-POS                
                                               NUMBER-OF-DEC-POS                
                                               S2                               
                                               WS-PRCNT-1                       
                                               WS-PRCNT-2                       
                                               WS-PRCNT-3                       
                                               WS-PRCNT-4.                      
           PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 15                         
              IF WS-PRCNT-LIT (S1) = ','                                        
                 MOVE S2                   TO  NUMBER-OF-INT-POS                
                 MOVE 0                    TO  S2                               
              ELSE                                                              
                 ADD 1                     TO  S2                               
              END-IF                                                            
           END-PERFORM.                                                         
           MOVE S2                         TO  NUMBER-OF-DEC-POS.               
           EVALUATE NUMBER-OF-DEC-POS                                           
              WHEN 0                                                            
                 MOVE NSCCAT-ASSET-PRCNT        TO WS-ASSET-PCT                 
              WHEN 1                                                            
                 MOVE NSCCAT-ASSET-PRCNT (1:13) TO WS-PRCNT-INT-1               
                 MOVE NSCCAT-ASSET-PRCNT (15:1) TO WS-PRCNT-DEC-1               
                 MOVE WS-PRCNT-1                TO WS-ASSET-PCT                 
              WHEN 2                                                            
                 MOVE NSCCAT-ASSET-PRCNT (1:12) TO WS-PRCNT-INT-2               
                 MOVE NSCCAT-ASSET-PRCNT (14:2) TO WS-PRCNT-DEC-2               
                 MOVE WS-PRCNT-2                TO WS-ASSET-PCT                 
              WHEN 3                                                            
                 MOVE NSCCAT-ASSET-PRCNT (1:11) TO WS-PRCNT-INT-3               
                 MOVE NSCCAT-ASSET-PRCNT (13:3) TO WS-PRCNT-DEC-3               
                 MOVE WS-PRCNT-3                TO WS-ASSET-PCT                 
              WHEN 4                                                            
                 MOVE NSCCAT-ASSET-PRCNT (1:10) TO WS-PRCNT-INT-4               
                 MOVE NSCCAT-ASSET-PRCNT (12:4) TO WS-PRCNT-DEC-4               
                 MOVE WS-PRCNT-4                TO WS-ASSET-PCT                 
              WHEN 5                                                            
                 MOVE NSCCAT-ASSET-PRCNT (1:9)  TO WS-PRCNT-INT-4               
                 MOVE NSCCAT-ASSET-PRCNT (11:4) TO WS-PRCNT-DEC-4               
                 MOVE WS-PRCNT-4                TO WS-ASSET-PCT                 
              WHEN 6                                                            
                 MOVE NSCCAT-ASSET-PRCNT (1:8)  TO WS-PRCNT-INT-4               
                 MOVE NSCCAT-ASSET-PRCNT (10:4) TO WS-PRCNT-DEC-4               
                 MOVE WS-PRCNT-4                TO WS-ASSET-PCT                 
              WHEN 7                                                            
                 MOVE NSCCAT-ASSET-PRCNT (1:7)  TO WS-PRCNT-INT-4               
                 MOVE NSCCAT-ASSET-PRCNT (9:4)  TO WS-PRCNT-DEC-4               
                 MOVE WS-PRCNT-4                TO WS-ASSET-PCT                 
              WHEN 8                                                            
                 MOVE NSCCAT-ASSET-PRCNT (1:6)  TO WS-PRCNT-INT-4               
                 MOVE NSCCAT-ASSET-PRCNT (8:4)  TO WS-PRCNT-DEC-4               
                 MOVE WS-PRCNT-4                TO WS-ASSET-PCT                 
              WHEN 9                                                            
                 MOVE NSCCAT-ASSET-PRCNT (1:5)  TO WS-PRCNT-INT-4               
                 MOVE NSCCAT-ASSET-PRCNT (7:4)  TO WS-PRCNT-DEC-4               
                 MOVE WS-PRCNT-4                TO WS-ASSET-PCT                 
              WHEN 10                                                           
                 MOVE NSCCAT-ASSET-PRCNT (1:4)  TO WS-PRCNT-INT-4               
                 MOVE NSCCAT-ASSET-PRCNT (6:4)  TO WS-PRCNT-DEC-4               
                 MOVE WS-PRCNT-4                TO WS-ASSET-PCT                 
              WHEN 11                                                           
                 MOVE NSCCAT-ASSET-PRCNT (1:3)  TO WS-PRCNT-INT-4               
                 MOVE NSCCAT-ASSET-PRCNT (5:4)  TO WS-PRCNT-DEC-4               
                 MOVE WS-PRCNT-4                TO WS-ASSET-PCT                 
              WHEN 12                                                           
                 MOVE NSCCAT-ASSET-PRCNT (1:2)  TO WS-PRCNT-INT-4               
                 MOVE NSCCAT-ASSET-PRCNT (4:4)  TO WS-PRCNT-INT-4               
                 MOVE WS-PRCNT-4                TO WS-ASSET-PCT                 
              WHEN 13                                                           
                 MOVE NSCCAT-ASSET-PRCNT (1:1)  TO WS-PRCNT-INT-4               
                 MOVE NSCCAT-ASSET-PRCNT (3:4)  TO WS-PRCNT-DEC-4               
                 MOVE WS-PRCNT-4                TO WS-ASSET-PCT                 
              WHEN 14                                                           
                 CONTINUE                                                       
              WHEN 15                                                           
                 MOVE ZERO                      TO WS-PRCNT-INT-4               
                 MOVE NSCCAT-ASSET-PRCNT (1:4)  TO WS-PRCNT-DEC-4               
                 MOVE WS-PRCNT-4                TO WS-ASSET-PCT                 
           END-EVALUATE.                                                        
           MOVE ZERO                       TO  WS-AMT.                          
           MOVE NSCCAT-ASSET-AMOUNT (1:14) TO  WS-AMT-INT.                      
           MOVE NSCCAT-ASSET-AMOUNT (16:2) TO  WS-AMT-DEC.                      
           MOVE WS-AMT                     TO  WS-ASSET-AMT.                    
                                                                                
LRM005     IF NSCCAT-RECORD(229 : 8) = 'ADP-SEC:'                               
LRM005        MOVE NSCCAT-RECORD(237 : 7) TO WS-ADP-NBR                         
LRM005        IF NSCCAT-ISIN-SECU-ISSU-ID = SPACES                              
LRM005           MOVE 'XX'       TO NSCCAT-ISIN-SECU-ISSU-ID(1:2)               
LRM005           MOVE WS-ADP-NBR TO NSCCAT-ISIN-SECU-ISSU-ID(3:7)               
LRM005        END-IF                                                            
LRM005     ELSE                                                                 
LRM005        MOVE SPACES                 TO WS-ADP-NBR                         
LRM005     END-IF.                                                              
                                                                                
LRM008     IF NSCCAT-TRANSFER-TYPE = 'PTF'                                      
LRM008        MOVE WS-ACAT-CONTROL-NBR                                          
LRM008                    TO NSCCAT-ACATS-CNTL-NBR                              
LRM008        MOVE +100 TO SQLCODE                                              
LRM008        GO TO UPDATE-AT-RECORD-EXIT                                       
LRM008     END-IF.                                                              
                                                                                
           EXEC SQL                                                             
              UPDATE ACTIAST                                                    
              SET  SBMTG_PRTCP_NBR     = :NSCCAT-SUB-PART-NBR                   
                  ,TRANS_TYPE_CD       = :NSCCAT-TRANS-TYPE                     
                  ,ASSET_PRC_CTGY_CD   = :NSCCAT-ASSET-PRICE-CATG               
                  ,STTLM_RSN_CD        = :NSCCAT-REQ-SET-REASON                 
                  ,ASSET_DESC_TXT      = :NSCCAT-ASSET-DESC                     
                  ,ASSET_RQST_QTY_CD   = :NSCCAT-QTY-REQ-IND                    
                  ,AST_RQST_TRANS_CD   = :NSCCAT-REQ-TRAN-CODE                  
                  ,ASSET_QTY           = :WS-ASSET-QTY                          
                  ,ASSET_PCT           = :WS-ASSET-PCT                          
                  ,PSTN_CD             = :NSCCAT-POSITION-CODE                  
                  ,ISO_CRNCY_CD        = :NSCCAT-ISO-CRNCY-CD                   
                  ,ASSET_AMT           = :WS-ASSET-AMT                          
                  ,BEARER_BOND_CD      = :NSCCAT-BEARER-BOND                    
                  ,WHI_CD              = :NSCCAT-WHEN-ISSUED-IND                
                  ,TRNFR_TYPE_RSN_CD   = :NSCCAT-XFER-TYPE-REASN                
                  ,MBS_SERIAL_NBR      = :NSCCAT-MBS-SERIAL-NOTE                
                  ,ASSET_CMNT_TXT      = :NSCCAT-ASSET-COMMENT                  
                  ,TRANS_RFRN_ID_CD    = :NSCCAT-TRANS-REF-ID                   
                  ,OPTN_CTGY_CD        = :NSCCAT-OPTION-CAT                     
                  ,NSCC_PEND_CD        =  ' '                                   
                  ,PRGM_NM             =  'CAT950  '                            
                  ,UPDT_TMSTP          =  CURRENT TIMESTAMP                     
                  ,CRT_TMSTP           =  CURRENT TIMESTAMP                     
LRM005            ,SECURITY_ADP_NBR    = :WS-ADP-NBR                            
              WHERE CLIENT_NBR          = :CLIENT-NUMBER             AND        
                    DLVR_NBR            = :NSCCAT-ORG-DEL-NBR        AND        
                    ACCT_DLVR_NBR       = :NSCCTI-ORG-DEL-ACCT-NBR   AND        
                    RCV_NBR             = :NSCCAT-ORG-RCV-NBR        AND        
                    ACCT_RCV_NBR        = :NSCCTI-ORG-RCV-CUS-ACCT   AND        
                    ISIN_CNTRY_CD       = :NSCCAT-ISIN-CNTRY-CODE    AND        
                    ISIN_SEC_ISSUE_CD   = :NSCCAT-ISIN-SECU-ISSU-ID  AND        
                    ISIN_SEC_CDG_CD     = :NSCCAT-ISIN-SECU-CHK-DIG  AND        
                    STTLM_LCTN_CD       = :NSCCAT-REQ-SET-LOCATION   AND        
                    CSH_MGN_SHRT_CD     = :NSCCAT-CASH-MRG-SHRT-CD   AND        
LRM000              ACAT_CONTROL_NBR    = :NSCCAT-ACATS-CNTL-NBR     AND        
LRM000              ASSET_SEQ_NBR       = :WS-ASSET-SEQ-NBR          AND        
LRM000              TRNFR_TYPE_CD       = :NSCCAT-TRANSFER-TYPE                 
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = +0                                                      
              ADD 1                         TO  AT-UPDATED-CNTR                 
           ELSE                                                                 
              IF SQLCODE = +100                                                 
                 CONTINUE                                                       
              ELSE                                                              
                 DISPLAY 'CAT950 DB2 UPDATE ACTIAST'                            
                 PERFORM SQL-ERROR-ROUTINE                                      
              END-IF                                                            
           END-IF.                                                              
LRM008 UPDATE-AT-RECORD-EXIT. EXIT.                                             
                                                                                
           EJECT                                                                
      ******************                                                        
       INSERT-AT-RECORD.                                                        
      ******************                                                        
                                                                                
           INITIALIZE DCLACTIAST.                                               
           MOVE SPACE                      TO  NSCC-PEND-CD                     
                                           OF  DCLACTIAST.                      
                                                                                
           EXEC SQL                                                             
              INSERT INTO ACTIAST                                               
                 ( CLIENT_NBR                                                   
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
                  ,DLVR_NBR_STTS_CD)                                            
              VALUES                                                            
                 ( :CLIENT-NUMBER                                               
                  ,:NSCCAT-ORG-DEL-NBR                                          
                  ,:NSCCTI-ORG-DEL-ACCT-NBR                                     
                  ,:NSCCAT-ORG-RCV-NBR                                          
                  ,:NSCCTI-ORG-RCV-CUS-ACCT                                     
                  ,:NSCCAT-ISIN-CNTRY-CODE                                      
                  ,:NSCCAT-ISIN-SECU-ISSU-ID                                    
                  ,:NSCCAT-ISIN-SECU-CHK-DIG                                    
                  ,:NSCCAT-REQ-SET-LOCATION                                     
                  ,:NSCCAT-CASH-MRG-SHRT-CD                                     
                  ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                               
                  ,:DCLACTIAST.STTLM-LCTN-STTS-CD                               
                  ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                               
                  ,:NSCCAT-SUB-PART-NBR                                         
                  ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                               
                  ,:NSCCAT-ACATS-CNTL-NBR                                       
                  ,:DCLACTIAST.CONTROL-NBR-STS-CD                               
                  ,:WS-ASSET-SEQ-NBR                                            
                  ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                               
                  ,:NSCCAT-TRANS-TYPE                                           
                  ,:DCLACTIAST.TRANS-TYPE-STTS-CD                               
                  ,:DCLACTIAST.PHSCL-SEQ-NBR                                    
                  ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                                
                  ,:DCLACTIAST.LGCL-SEQ-NBR                                     
                  ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                               
                  ,:NSCCAT-ASSET-PRICE-CATG                                     
                  ,:DCLACTIAST.AST-PRC-CTG-STS-CD                               
                  ,:NSCCAT-REQ-SET-REASON                                       
                  ,:DCLACTIAST.STTLM-RSN-STTS-CD                                
                  ,:NSCCAT-ASSET-DESC                                           
                  ,:DCLACTIAST.ASSET-DESC-STTS-CD                               
                  ,:NSCCAT-QTY-REQ-IND                                          
                  ,:DCLACTIAST.ASSET-RQST-STS-CD                                
                  ,:NSCCAT-REQ-TRAN-CODE                                        
                  ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                               
                  ,:WS-ASSET-QTY                                                
                  ,:DCLACTIAST.ASSET-QTY-STTS-CD                                
                  ,:WS-ASSET-PCT                                                
                  ,:DCLACTIAST.ASSET-PCT-STTS-CD                                
                  ,:NSCCAT-POSITION-CODE                                        
                  ,:DCLACTIAST.PSTN-CD-STTS-CD                                  
                  ,:NSCCAT-ISO-CRNCY-CD                                         
                  ,:DCLACTIAST.ISO-CRNCY-STTS-CD                                
                  ,:WS-ASSET-AMT                                                
                  ,:DCLACTIAST.ASSET-AMT-STTS-CD                                
                  ,:NSCCAT-BEARER-BOND                                          
                  ,:DCLACTIAST.BEARER-BND-STTS-CD                               
                  ,:NSCCAT-WHEN-ISSUED-IND                                      
                  ,:DCLACTIAST.WHI-STTS-CD                                      
                  ,:NSCCAT-XFER-TYPE-REASN                                      
                  ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                               
                  ,:NSCCAT-MBS-SERIAL-NOTE                                      
                  ,:DCLACTIAST.MBS-SERIAL-STTS-CD                               
                  ,:NSCCAT-ASSET-COMMENT                                        
                  ,:DCLACTIAST.ASSET-CMNT-STTS-CD                               
                  ,:DCLACTIAST.NSCC-WTHLD-CD                                    
                  ,:NSCCAT-TRANS-REF-ID                                         
                  ,:DCLACTIAST.TRANS-RFRN-STTS-CD                               
                  ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                               
                  ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                               
                  ,:NSCCAT-OPTION-CAT                                           
                  ,:DCLACTIAST.OPTN-CTGY-STTS-CD                                
                  ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                               
                  ,:DCLACTIAST.RCRD-STTS-CD                                     
                  ,:DCLACTIAST.NSCC-PEND-CD                                     
                  ,:DCLACTIAST.NSCC-ACK-IND                                     
                  ,'CAT950  '                                                   
                  ,:DCLACTIAST.CICS-TERM-ID-CD                                  
                  ,CURRENT TIMESTAMP                                            
                  ,CURRENT TIMESTAMP                                            
LRM005            ,:WS-ADP-NBR                                                  
                  ,:NSCCAT-TRANSFER-TYPE                                        
                  ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                               
                  ,:DCLACTIAST.RCV-NBR-STTS-CD                                  
                  ,:DCLACTIAST.DLVR-NBR-STTS-CD)                                
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'CAT950 DB2 INSERT ACTIAST'                               
              PERFORM SQL-ERROR-ROUTINE                                         
           ELSE                                                                 
              ADD 1                         TO  AT-INSERTED-CNTR                
           END-IF.                                                              
                                                                                
           EJECT                                                                
      **********************                                                    
       UPDATE-AT-OPN-RECORD.                                                    
      **********************                                                    
                                                                                
LRM011     IF NSCCAT-EXP-DATE-NEW > SPACES                                      
LRM006        MOVE NSCCAT-EXP-DATE-NEW (1:4)   TO  WS-DB-DATE-CCYY              
LRM006        MOVE NSCCAT-EXP-DATE-NEW (5:2)   TO  WS-DB-DATE-MM                
LRM006        MOVE NSCCAT-EXP-DATE-NEW (7:2)   TO  WS-DB-DATE-DD                
LRM011     ELSE                                                                 
LRM011        MOVE '0001'                      TO  WS-DB-DATE-CCYY              
LRM011        MOVE '01'                        TO  WS-DB-DATE-MM                
LRM011        MOVE '01'                        TO  WS-DB-DATE-DD                
LRM011     END-IF.                                                              
           MOVE '-'                         TO  WS-DB-SEP1                      
                                                WS-DB-SEP2                      
           MOVE WS-DB-DATE                  TO  WS-EXPTN-DT.                    
           MOVE NSCCAT-OPT-STPRC-INTR       TO  WS-STPRC-INTEGER-AMT.           
           MOVE NSCCAT-OPT-STRK-FRCTN       TO  WS-STPRC-FRCTN-AMT.             
                                                                                
           EXEC SQL                                                             
              UPDATE ACTIOPN                                                    
              SET  BS_CD                = :NSCCAT-OPT-BUY-SELL-IND              
                  ,PTCL_CD              = :NSCCAT-P-C-IND                       
                  ,OPTN_OPN_CLSD_CD     = :NSCCAT-O-C-IND                       
                  ,SYM_CD               = :NSCCAT-OPTION-SYM                    
                  ,EXPTN_DT             = :WS-EXPTN-DT                          
                  ,STPRC_INTEGER_AMT    = :WS-STPRC-INTEGER-AMT                 
                  ,STPRC_FRCTN_AMT      = :WS-STPRC-FRCTN-AMT                   
                  ,DLVR_OCC_NBR         = :NSCCAT-OPT-OCC-DEL-NBR               
                  ,OPTN_ACCT_TYPE_CD    = :NSCCAT-OPT-ACCT-TYPE                 
                  ,ACCT_SUB_CD          = :NSCCAT-SUB-ACCT-ID                   
                  ,OPTN_CMNT_TXT        = :NSCCAT-OPTION-COMMENT                
                  ,NSCC_PEND_CD         =  ' '                                  
                  ,CRT_TMSTP            =  CURRENT TIMESTAMP                    
                  ,UPDT_TMSTP           =  CURRENT TIMESTAMP                    
                  ,PRGM_NM              = 'CAT950  '                            
              WHERE CLIENT_NBR         = :CLIENT-NUMBER             AND         
                   DLVR_NBR            = :NSCCAT-ORG-DEL-NBR        AND         
                   ACCT_DLVR_NBR       = :NSCCTI-ORG-DEL-ACCT-NBR   AND         
                   RCV_NBR             = :NSCCAT-ORG-RCV-NBR        AND         
                   ACCT_RCV_NBR        = :NSCCTI-ORG-RCV-CUS-ACCT  AND          
                   ISIN_CNTRY_CD       = :NSCCAT-ISIN-CNTRY-CODE    AND         
                   ISIN_SEC_ISSUE_CD   = :NSCCAT-ISIN-SECU-ISSU-ID  AND         
                   ISIN_SEC_CDG_CD     = :NSCCAT-ISIN-SECU-CHK-DIG  AND         
                   STTLM_LCTN_CD       = :NSCCAT-REQ-SET-LOCATION   AND         
                   CSH_MGN_SHRT_CD     = :NSCCAT-CASH-MRG-SHRT-CD   AND         
LRM000             ACAT_CONTROL_NBR    = :NSCCAT-ACATS-CNTL-NBR     AND         
LRM000             ASSET_SEQ_NBR       = :WS-ASSET-SEQ-NBR          AND         
LRM000             TRNFR_TYPE_CD       = :NSCCAT-TRANSFER-TYPE                  
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = +0                                                      
              ADD 1                        TO  OP-UPDATED-CNTR                  
           ELSE                                                                 
              IF SQLCODE = +100                                                 
                 CONTINUE                                                       
              ELSE                                                              
                 DISPLAY 'CAT950 DB2 UPDATE ACTIOPN'                            
                 PERFORM SQL-ERROR-ROUTINE                                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      **********************                                                    
       INSERT-AT-OPN-RECORD.                                                    
      **********************                                                    
                                                                                
           INITIALIZE DCLACTIOPN.                                               
           MOVE SPACE                       TO  NSCC-PEND-CD                    
                                            OF  DCLACTIOPN.                     
                                                                                
           EXEC SQL                                                             
              INSERT INTO ACTIOPN                                               
                 ( CLIENT_NBR                                                   
                  ,DLVR_NBR                                                     
                  ,ACCT_DLVR_NBR                                                
                  ,RCV_NBR                                                      
                  ,ACCT_RCV_NBR                                                 
                  ,ISIN_CNTRY_CD                                                
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,ISIN_SEC_CDG_CD                                              
                  ,STTLM_LCTN_CD                                                
                  ,CSH_MGN_SHRT_CD                                              
                  ,BS_CD                                                        
                  ,BS_STTS_CD                                                   
                  ,PTCL_CD                                                      
                  ,PTCL_STTS_CD                                                 
                  ,OPTN_OPN_CLSD_CD                                             
                  ,OPT_OPN_CLS_TST_CD                                           
                  ,SYM_CD                                                       
                  ,SYM_STTS_CD                                                  
                  ,EXPTN_DT                                                     
                  ,STPRC_INTEGER_AMT                                            
                  ,STPRC_INTR_STTS_CD                                           
                  ,STPRC_FRCTN_AMT                                              
                  ,STPRC_FRCT_STTS_CD                                           
                  ,DLVR_OCC_NBR                                                 
                  ,OPTN_ACCT_TYPE_CD                                            
                  ,OPT_ACT_TYP_STS_CD                                           
                  ,ACCT_SUB_CD                                                  
                  ,ACCT_SUB_STTS_CD                                             
                  ,OPTN_CMNT_TXT                                                
                  ,OPTN_CMNT_CD                                                 
                  ,OPTN_EXPTN_DT_CD                                             
                  ,OPT_OCC_DLV_STS_CD                                           
                  ,NSCC_ACK_IND                                                 
                  ,NSCC_PEND_CD                                                 
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,CICS_TERM_ID_CD                                              
                  ,PRGM_NM                                                      
                  ,SECURITY_ADP_NBR                                             
LRM000            ,ACAT_CONTROL_NBR                                             
LRM000            ,ASSET_SEQ_NBR                                                
LRM000            ,TRNFR_TYPE_CD)                                               
              VALUES                                                            
                 ( :CLIENT-NUMBER                                               
                  ,:NSCCAT-ORG-DEL-NBR                                          
                  ,:NSCCTI-ORG-DEL-ACCT-NBR                                     
                  ,:NSCCAT-ORG-RCV-NBR                                          
                  ,:NSCCTI-ORG-RCV-CUS-ACCT                                     
                  ,:NSCCAT-ISIN-CNTRY-CODE                                      
                  ,:NSCCAT-ISIN-SECU-ISSU-ID                                    
                  ,:NSCCAT-ISIN-SECU-CHK-DIG                                    
                  ,:NSCCAT-REQ-SET-LOCATION                                     
                  ,:NSCCAT-CASH-MRG-SHRT-CD                                     
                  ,:NSCCAT-OPT-BUY-SELL-IND                                     
                  ,:DCLACTIOPN.BS-STTS-CD                                       
                  ,:NSCCAT-P-C-IND                                              
                  ,:DCLACTIOPN.PTCL-STTS-CD                                     
                  ,:NSCCAT-O-C-IND                                              
                  ,:DCLACTIOPN.OPT-OPN-CLS-TST-CD                               
                  ,:NSCCAT-OPTION-SYM                                           
                  ,:DCLACTIOPN.SYM-STTS-CD                                      
                  ,:WS-EXPTN-DT                                                 
                  ,:WS-STPRC-INTEGER-AMT                                        
                  ,:DCLACTIOPN.STPRC-INTR-STTS-CD                               
                  ,:WS-STPRC-FRCTN-AMT                                          
                  ,:DCLACTIOPN.STPRC-FRCT-STTS-CD                               
                  ,:NSCCAT-OPT-OCC-DEL-NBR                                      
                  ,:NSCCAT-OPT-ACCT-TYPE                                        
                  ,:DCLACTIOPN.OPT-ACT-TYP-STS-CD                               
                  ,:NSCCAT-SUB-ACCT-ID                                          
                  ,:DCLACTIOPN.ACCT-SUB-STTS-CD                                 
                  ,:NSCCAT-OPTION-COMMENT                                       
                  ,:DCLACTIOPN.OPTN-CMNT-CD                                     
                  ,:DCLACTIOPN.OPTN-EXPTN-DT-CD                                 
                  ,:DCLACTIOPN.OPT-OCC-DLV-STS-CD                               
                  ,:DCLACTIOPN.NSCC-ACK-IND                                     
                  ,:DCLACTIOPN.NSCC-PEND-CD                                     
                  ,CURRENT TIMESTAMP                                            
                  ,CURRENT TIMESTAMP                                            
                  ,:DCLACTIOPN.CICS-TERM-ID-CD                                  
                  ,'CAT950  '                                                   
LRM005            ,:WS-ADP-NBR                                                  
LRM000            ,:NSCCAT-ACATS-CNTL-NBR                                       
LRM000            ,:WS-ASSET-SEQ-NBR                                            
LRM000            ,:NSCCAT-TRANSFER-TYPE )                                      
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'CAT950 DB2 INSERT ACTIOPN'                               
              PERFORM SQL-ERROR-ROUTINE                                         
           ELSE                                                                 
              ADD 1                         TO  OP-INSERTED-CNTR                
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *********************                                                     
       UPDATE-AT-MF-RECORD.                                                     
      *********************                                                     
                                                                                
           EXEC SQL                                                             
              UPDATE ACTIMF                                                     
              SET  BK_PHSCL_SHR_CD = :NSCCAT-MF-SHR-IND                         
                  ,NTWRK_CNTL_CD   = :NSCCAT-MF-NTWK-CNTL-IND                   
                  ,ACCT_TYPE_CD    = :NSCCAT-MF-ACCT-TYPE-IND                   
                  ,DVDND_CD        = :NSCCAT-DIVDND-CODE                        
                  ,DVDND_PAYEE_CD  = :NSCCAT-DIVDND-PAYEE-IND                   
                  ,BRKR_EXCTG_NBR  = :NSCCAT-EXC-BROKR                          
                  ,MF_FULL_PRTL_CD = :NSCCAT-MF-FULPART-IND                     
                  ,FNBR            = :NSCCAT-MF-CUST-ACCT                       
                  ,CRT_TMSTP       =  CURRENT TIMESTAMP                         
                  ,UPDT_TMSTP      =  CURRENT TIMESTAMP                         
                  ,PRGM_NM         =  'CAT950  '                                
LRM005            ,SECURITY_ADP_NBR = :WS-ADP-NBR                               
              WHERE CLIENT_NBR        = :CLIENT-NUMBER             AND          
                    DLVR_NBR          = :NSCCAT-ORG-DEL-NBR        AND          
                    RCV_NBR           = :NSCCAT-ORG-RCV-NBR        AND          
                    ACCT_DLVR_NBR     = :NSCCTI-ORG-DEL-ACCT-NBR   AND          
                    ACCT_RCV_NBR      = :NSCCTI-ORG-RCV-CUS-ACCT   AND          
                    ISIN_CNTRY_CD     = :NSCCAT-ISIN-CNTRY-CODE    AND          
                    ISIN_SEC_ISSUE_CD = :NSCCAT-ISIN-SECU-ISSU-ID  AND          
                    ISIN_SEC_CDG_CD   = :NSCCAT-ISIN-SECU-CHK-DIG  AND          
                    STTLM_LCTN_CD     = :NSCCAT-REQ-SET-LOCATION   AND          
                    CSH_MGN_SHRT_CD   = :NSCCAT-CASH-MRG-SHRT-CD   AND          
LRM000              ACAT_CONTROL_NBR  = :NSCCAT-ACATS-CNTL-NBR     AND          
LRM000              ASSET_SEQ_NBR     = :WS-ASSET-SEQ-NBR          AND          
LRM000              TRNFR_TYPE_CD     = :NSCCAT-TRANSFER-TYPE                   
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = +0                                                      
              ADD 1                         TO  MF-UPDATED-CNTR                 
           ELSE                                                                 
              IF SQLCODE = +100                                                 
                 CONTINUE                                                       
              ELSE                                                              
                 DISPLAY 'CAT950 DB2 UPDATE ACTIMF'                             
                 PERFORM SQL-ERROR-ROUTINE                                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *********************                                                     
       INSERT-AT-MF-RECORD.                                                     
      *********************                                                     
                                                                                
           INITIALIZE DCLACTIMF.                                                
           MOVE '0001'                      TO  WS-DB-DATE-CCYY.                
           MOVE '01'                        TO  WS-DB-DATE-MM.                  
           MOVE '01'                        TO  WS-DB-DATE-DD.                  
           MOVE '-'                         TO  WS-DB-SEP1                      
                                                WS-DB-SEP2.                     
           MOVE WS-DB-DATE                  TO  PRCS-DT                         
                                            OF  DCLACTIMF.                      
LRM001     IF NSCCTI-TRNFR-TYPE = 'PTD'                                         
LRM008     OR (NSCCTI-TRNFR-TYPE = 'PTF'                                        
LRM008     AND NSCCTI-ORG-DEL-NBR = WS-BKR-CLR-NO)                              
              MOVE 'D' TO DSTBN-SIDE-CD OF DCLACTIMF                            
           ELSE                                                                 
              MOVE 'R' TO DSTBN-SIDE-CD OF DCLACTIMF                            
           END-IF.                                                              
                                                                                
           EXEC SQL                                                             
              INSERT INTO ACTIMF                                                
                 ( CLIENT_NBR                                                   
                  ,DLVR_NBR                                                     
                  ,RCV_NBR                                                      
                  ,ACCT_DLVR_NBR                                                
                  ,ACCT_RCV_NBR                                                 
                  ,ISIN_CNTRY_CD                                                
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,ISIN_SEC_CDG_CD                                              
                  ,STTLM_LCTN_CD                                                
                  ,CSH_MGN_SHRT_CD                                              
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
                  ,SECURITY_ADP_NBR                                             
LRM000            ,FCST_ACCT_RCVR_NBR                                           
LRM000            ,ACAT_CONTROL_NBR                                             
LRM000            ,ASSET_SEQ_NBR                                                
LRM000            ,TRNFR_TYPE_CD)                                               
              VALUES                                                            
                 ( :CLIENT-NUMBER                                               
                  ,:NSCCAT-ORG-DEL-NBR                                          
                  ,:NSCCAT-ORG-RCV-NBR                                          
                  ,:NSCCTI-ORG-DEL-ACCT-NBR                                     
                  ,:NSCCTI-ORG-RCV-CUS-ACCT                                     
                  ,:NSCCAT-ISIN-CNTRY-CODE                                      
                  ,:NSCCAT-ISIN-SECU-ISSU-ID                                    
                  ,:NSCCAT-ISIN-SECU-CHK-DIG                                    
                  ,:NSCCAT-REQ-SET-LOCATION                                     
                  ,:NSCCAT-CASH-MRG-SHRT-CD                                     
                  ,:NSCCAT-MF-SHR-IND                                           
                  ,:DCLACTIMF.BK-PHSC-SHR-STS-CD                                
                  ,:NSCCAT-MF-NTWK-CNTL-IND                                     
                  ,:DCLACTIMF.NTWRK-CNTL-STTS-CD                                
                  ,:NSCCAT-MF-ACCT-TYPE-IND                                     
                  ,:DCLACTIMF.ACCT-TYPE-STTS-CD                                 
                  ,:NSCCAT-DIVDND-CODE                                          
                  ,:DCLACTIMF.DVDND-STTS-CD                                     
                  ,:NSCCAT-DIVDND-PAYEE-IND                                     
                  ,:DCLACTIMF.DVDND-PYE-STTS-CD                                 
                  ,:DCLACTIMF.LTCG-CD                                           
                  ,:NSCCAT-EXC-BROKR                                            
                  ,:DCLACTIMF.BRKR-EXCTG-STTS-CD                                
                  ,:DCLACTIMF.STCG-CD                                           
                  ,:NSCCAT-MF-FULPART-IND                                       
                  ,:DCLACTIMF.MF-FUL-PRTL-STS-CD                                
                  ,:DCLACTIMF.RGSTN-CD                                          
                  ,:NSCCAT-MF-CUST-ACCT                                         
                  ,:DCLACTIMF.FND-ACT-NBR-STS-CD                                
                  ,:DCLACTIMF.DSTBN-SIDE-CD                                     
                  ,:DCLACTIMF.PRCS-DT                                           
                  ,CURRENT TIMESTAMP                                            
                  ,CURRENT TIMESTAMP                                            
                  ,:DCLACTIMF.CICS-TERM-ID-CD                                   
                  ,'CAT950  '                                                   
LRM005            ,:WS-ADP-NBR                                                  
LRM000            ,:DCLACTIMF.FCST-ACCT-RCVR-NBR                                
LRM000            ,:NSCCAT-ACATS-CNTL-NBR                                       
LRM000            ,:WS-ASSET-SEQ-NBR                                            
LRM000            ,:NSCCAT-TRANSFER-TYPE )                                      
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'CAT950 DB2 INSERT ACTIMF'                                
              PERFORM SQL-ERROR-ROUTINE                                         
           ELSE                                                                 
              ADD 1                         TO  MF-INSERTED-CNTR                
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       SQL-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           CALL DSNTIAR               USING  SQLCA                              
                                             WS-DB2-MESSAGE-AREA                
                                             WS-ERR-LINE-LEN.                   
                                                                                
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
              UNTIL WS-ERROR-INDEX GREATER THAN 12                              
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                      
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)                
                 END-IF                                                         
           END-PERFORM.                                                         
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '*** PROGRAM IS ABENDING'.                                   
           DISPLAY ' '.                                                         
                                                                                
           EXEC SQL  ROLLBACK  END-EXEC.                                        
TCK001     CALL  ABEND     USING ABEND-CODE.                                    
                                                                                
           EJECT                                                                
      *************                                                             
       INITIAL-RTN.                                                             
      *************                                                             
                                                                                
LRM010     DISPLAY 'PARM-LENGTH ' PARM-LENGTH                                   
LRM010        ' PARM-AREA ' PARM-AREA.                                          
                                                                                
LRM001     MOVE  LS-CLIENT-NBR       TO  BH-BROKER-NUMBER                       
LRM001     MOVE  '015'               TO  BH-LOGICAL-RECORD-CODE                 
LRM001     MOVE  '434500'            TO  BH-B2-INFO-ID                          
LRM001     CALL  GETB1V            USING BH-BROKER-HEADER-INFO                  
LRM001                                   BH-ACAT-INFO                           
LRM001     END-CALL.                                                            
LRM001     IF  BH-ACAT-ACTIVE                                                   
LRM001         MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                          
LRM001                         TO WS-BKR-CLR-NO                                 
LRM001     ELSE                                                                 
LRM001         DISPLAY 'NON ACAT CLIENT PARM / B1 SETTING '                     
LRM001         DISPLAY 'CAT950 ABENDS'                                          
LRM001         MOVE +1000 TO ABEND-CODE                                         
LRM001         CALL  ABEND                USING  ABEND-CODE                     
LRM001     END-IF.                                                              
LRM001     DISPLAY 'CLEARING NUMBER ' WS-BKR-CLR-NO                             
LRM001             ' CLIENT NUMBER ' LS-CLIENT-NBR                              
           OPEN INPUT  INPACAT-FILE                                             
                OUTPUT OUTACAT-FILE.                                            
                                                                                
           SET EOF-NO                       TO  TRUE.                           
           SET TRAILER-NOT-FOUND            TO  TRUE.                           
                                                                                
           MOVE 'CAT950'                    TO  BPDATES-CALLING-PGM.            
           MOVE 'C'                         TO  BPDATES-REQ-TYPE.               
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*    MOVE 'US'                        TO  BPDATES-CALENDAR-TYPE.          
CSG001     MOVE '  '                        TO  BPDATES-CALENDAR-TYPE.          
TCK001     CALL  BPDATES                 USING  BPDATES-PARAMETERS.             
                                                                                
           IF BPD-VALID-RETURN                                                  
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY ' '                                                       
              DISPLAY '*******************************'                         
              DISPLAY '* BPDATES INAVLID RETURN = ' BPDATES-RETURN-CODE         
                      ' *'                                                      
              DISPLAY '* PROGRAM IS ABENDING!       *'                          
TCK001        CALL  ABEND                USING  ABEND-CODE                      
           END-IF.                                                              
                                                                                
           MOVE BPD-PROC-DATE               TO  WS-PROC-DATE-CCYYMMDD.          
           DISPLAY ' '                                                          
           DISPLAY 'TODAY DATE IS ' WS-PROC-CC WS-PROC-YY                       
                   '-' WS-PROC-MM '-' WS-PROC-DD.                               
                                                                                
           MOVE WS-PROC-MM                  TO  WS-HDR-DATE-MM.                 
           MOVE WS-PROC-DD                  TO  WS-HDR-DATE-DD.                 
           MOVE WS-PROC-CC                  TO  WS-HDR-DATE-CC.                 
           MOVE WS-PROC-YY                  TO  WS-HDR-DATE-YY.                 
                                                                                
           PERFORM READ-INPACAT-FILE.                                           
           MOVE INPACAT-REC                 TO  NSCC-HDR-RECORD.                
                                                                                
           IF EOF-YES                                                           
              DISPLAY ' '                                                       
              DISPLAY '**********************************'                      
              DISPLAY '* CLIENT FEED HAS NO RECORDS     *'                      
              DISPLAY '* PROGRAM IS ABENDING!           *'                      
              DISPLAY '**********************************'                      
              DISPLAY ' '                                                       
TCK001        CALL  ABEND                USING  ABEND-CODE                      
           END-IF.                                                              
                                                                                
           IF NSCCDHDR-HDRS = 'HDR.S'                                           
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY ' '                                                       
              DISPLAY '****************************************'                
LRM001        DISPLAY '* CLIENT FEED HAS NO HEADER RECORD     *'                
LRM001        DISPLAY '* SEE DSN ON DD=INPACAT                *'                
              DISPLAY '* PROGRAM IS ABENDING!                 *'                
              DISPLAY '****************************************'                
              DISPLAY ' '                                                       
TCK001        CALL  ABEND                USING  ABEND-CODE                      
           END-IF.                                                              
                                                                                
           IF NSCCDHDR-SUBMIT-DATE = WS-HDR-DATE                                
              CONTINUE                                                          
           ELSE                                                                 
           IF BYPASS-DATE-CHECK                                                 
              DISPLAY '*********************************'                       
              DISPLAY '* WRONG DATE ON CLIENT FEED     *'                       
LRM001                ' ' NSCCDHDR-SUBMIT-DATE                                  
              DISPLAY '* PROGRAM WILL IGNORE INPUT FILE*'                       
              DISPLAY '*********************************'                       
              SET EOF-YES TO TRUE                                               
           ELSE                                                                 
              DISPLAY ' '                                                       
              DISPLAY '*********************************'                       
              DISPLAY '* WRONG DATE ON CLIENT FEED     *'                       
LRM001                ' ' NSCCDHDR-SUBMIT-DATE                                  
              DISPLAY '* PROGRAM IS ABENDING!          *'                       
              DISPLAY '*********************************'                       
              DISPLAY ' '                                                       
TCK001        CALL  ABEND                USING  ABEND-CODE                      
           END-IF.                                                              
                                                                                
LRM001     IF NSCCDHDR-SUB-ORIGINATOR NOT = WS-BKR-CLR-NO                       
LRM001        DISPLAY ' '                                                       
LRM001        DISPLAY '**************************************'                  
LRM001        DISPLAY '* WRONG BROKER NUMBER ON CLIENT FEED *'                  
LRM001        DISPLAY '* PROGRAM IS ABENDING!               *'                  
LRM001        DISPLAY '**************************************'                  
LRM001        DISPLAY ' '                                                       
LRM001        CALL  ABEND                USING  ABEND-CODE                      
LRM001     END-IF.                                                              
LRM001                                                                          
                                                                                
LRM010     IF PARM-LENGTH < 11                                                  
LRM010        CONTINUE                                                          
LRM010     ELSE                                                                 
LRM010     IF NSCCDHDR-MULTI-BATCH-NBR(1 : 2) = '00'                            
LRM010     AND NSCCDHDR-MULTI-BATCH-NBR(3 : 1) = PARM-CYCLE                     
LRM010        DISPLAY 'FILE HEADER/CYCLE ' NSCCDHDR-MULTI-BATCH-NBR             
LRM010          ' MATCHES EXPECTED JCL PARM CYCLE ' PARM-CYCLE                  
LRM010        CONTINUE                                                          
LRM010     ELSE                                                                 
LRM010        DISPLAY 'FILE HEADER/CYCLE NBR ' NSCCDHDR-MULTI-BATCH-NBR         
LRM010         ' DOES NOT MATCH JCL PARM CYCLE ' PARM-CYCLE                     
LRM010        DISPLAY 'PROGRAM CAT950 ABENDS'                                   
LRM010        CALL  ABEND                USING  ABEND-CODE                      
LRM010     END-IF.                                                              
LRM010                                                                          
                                                                                
           WRITE OUTACAT-HEADER-TRAILER   FROM  NSCC-HDR-RECORD.                
           ADD 1                            TO  OUTPUT-REC-CNTR.                
                                                                                
           MOVE 'CAT950'                    TO  GETNA-PGM-NAME.                 
           MOVE 'O'                         TO  GETNA-REQ-FUNC.                 
           MOVE 'R'                         TO  GETNA-REQ-FUNC2.                
           MOVE 'R'                         TO  GETNA-REQ-FILE.                 
           MOVE 'N'                         TO  GETNA-REQ-YEAREND.              
TCK001     CALL  GETNA                   USING  GETNA-PARAMETERS                
                                                GETNA-SEGMENTS.                 
           IF GETNA-OPEN-ERROR                                                  
              DISPLAY ' '                                                       
              DISPLAY '**************************'                              
              DISPLAY '* OPEN ERROR ON N&A FILE *'                              
              DISPLAY '* VSAM STATUS IS ' GETNA-VSAM-STATUS '      *'           
              DISPLAY '* PROGRAM IS ABENDING!   *'                              
              DISPLAY '**************************'                              
              DISPLAY ' '                                                       
TCK001        CALL  ABEND                USING  ABEND-CODE                      
           END-IF.                                                              
                                                                                
           MOVE LS-CLIENT-NBR               TO  WS-CLIENT-NBR.                  
                                                                                
           EJECT                                                                
      ****************                                                          
       END-OF-JOB-RTN.                                                          
      ****************                                                          
                                                                                
           IF TRAILER-NOT-FOUND                                                 
              DISPLAY ' '                                                       
              DISPLAY '******************************************'              
              DISPLAY '* CLIENT FEED HAS NO TRAILER RECORD!     *'              
              DISPLAY '******************************************'              
              DISPLAY ' '                                                       
           END-IF.                                                              
                                                                                
           EXEC SQL  COMMIT  END-EXEC.                                          
                                                                                
           IF INPUT-REC-CNTR NOT = NSCCDTRL-REC-COUNT                           
              DISPLAY ' '                                                       
              DISPLAY '*********************************************'           
              DISPLAY '* RECORD COUNT CLIENT FEED TRAILER IS NOT   *'           
              DISPLAY '* EQUAL TO THE NUMBER OF INPUT-RECORDS!!!   *'           
LRM001        DISPLAY 'FILE TRAILER '  NSCCDTRL-REC-COUNT                       
LRM001                '  DETAILS READ ' INPUT-REC-CNTR                          
              DISPLAY '*********************************************'           
              DISPLAY ' '                                                       
           END-IF.                                                              
                                                                                
           ADD 1                            TO  OUTPUT-REC-CNTR.                
           MOVE OUTPUT-REC-CNTR             TO  NSCCDTRL-REC-COUNT.             
           WRITE OUTACAT-HEADER-TRAILER   FROM  NSCC-TRL-RECORD.                
                                                                                
           CLOSE INPACAT-FILE                                                   
                 OUTACAT-FILE.                                                  
                                                                                
           MOVE 'CAT950'                    TO  GETNA-PGM-NAME.                 
           MOVE 'P'                         TO  GETNA-REQ-FUNC.                 
TCK001     CALL  GETNA                   USING  GETNA-PARAMETERS                
                                                GETNA-SEGMENTS.                 
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '         TOTALS FOR CAT950'.                                
           DISPLAY '         -----------------'.                                
           DISPLAY ' '.                                                         
           DISPLAY 'INPUT RECORDS:         ' INPUT-REC-CNTR.                    
           DISPLAY 'INPUT TI RECORDS:      ' INPUT-TI-CNTR.                     
           DISPLAY 'INPUT AT RECORDS:      ' INPUT-AT-CNTR.                     
           DISPLAY 'INPUT OTHER RECORDS:   ' INPUT-OTHER-CNTR.                  
           DISPLAY ' '.                                                         
           DISPLAY 'UPDATED TI RECORDS:    ' TI-UPDATED-CNTR.                   
           DISPLAY 'UPDATED AT RECORDS:    ' AT-UPDATED-CNTR.                   
           DISPLAY 'UPDATED OPN RECORDS:   ' OP-UPDATED-CNTR.                   
           DISPLAY 'UPDATED MF RECORDS:    ' MF-UPDATED-CNTR.                   
           DISPLAY ' '.                                                         
           DISPLAY 'INSERTED TI RECORDS:   ' TI-INSERTED-CNTR.                  
           DISPLAY 'INSERTED AT RECORDS:   ' AT-INSERTED-CNTR.                  
           DISPLAY 'INSERTED OPN RECORDS:  ' OP-INSERTED-CNTR.                  
           DISPLAY 'INSERTED MF RECORDS:   ' MF-INSERTED-CNTR.                  
           DISPLAY ' '.                                                         
           DISPLAY 'REJECTED TI RECORDS:   ' TI-REJECTED-CNTR.                  
           DISPLAY 'REJECTED AT RECORDS:   ' AT-REJECTED-CNTR.                  
           DISPLAY 'REJECTED OTHER RECORDS:' OTHER-REJECTED-CNTR.               
           DISPLAY ' '.                                                         
           DISPLAY ' '.                                                         
           DISPLAY '*****************************************'.                 
           DISPLAY '* PROGRAM CAT950 COMPLETED SUCCESSFULLY *'.                 
           DISPLAY '*****************************************'.                 
           DISPLAY ' '.                                                         
