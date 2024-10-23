000001* PDX    - CAT770   C0317345 12/07/11 09:41:03 TBLAMUR            00001000
      * LRM006 SSR 80728 CREATE Y SCREEN UPDATE WHEN MUTUAL FUND                
      * WITH NTW LVL=4 WAS WITHHELD. READ AND DELETE ACTIAST ROWS               
      * WITH CLIENT= L### TO DRIVE Y SCREEN UPDATE.                             
000001* PDX    - CAT770   C0318430 10/31/11 09:16:03 TBLAMUR            00001000
      * LRM005 SSR 80412 FUND DELETE W/NO PRICING CATEGORY                      
000001* PDX    - CAT770   C0278295 04/06/09 13:10:05 TBDOJUN            00001000
      * DJ0004 SSR 61867 USE ADP-NO IN ISIN_SEC_ISSUE_CD(NO MORE CUSIP)         
000001* PDX    - CAT770   C0276276 03/24/09 16:34:04 TBDOJUN                    
      * DJ0003 SSR 69509 UNDELIVERABLE RESIDUAL                                 
      * DJ0003 ADD UNDELIVERABLE DELIVERY ASSETS (STL-LOC 30)                   
      * DJ0003 TO VRSTSEC TO BLOCK RCR                                          
000001* PDX    - CAT770   C0249006 06/29/07 12:31:29 TBDOJUN                    
      * DJ0002 SSR 47339 SUPPORT DUALLY LISTED SECURITIES                       
      * DJ0002           POPULATE GETMSD-CLIENT-PL2 WHEN CALLING GETMSD         
000001* PDX    - CAT770   C0215169 02/14/05 07:54:45 TBDOJUN                    
      * DJ0001 SSR# 40633 RECOMPILED FOR NEW COPYBOOK (ANNUITY)                 
000001* PDX    - CAT770   C0211125 10/18/04 08:56:29 TBLAMUR                    
LRM001* SSR 0029649 AUTO-FUND DELETE B1 434689, FOR THE RECEIVER, NO            
LRM001* LONGER CREATE X SCREEN UPDATES; INBOUND RCR EDITS WILL BE               
LRM001* DONE IN CAT515 VERIFYING THE FUND AGREEMENT.                            
000001* PDX    - CAT770   C0159384 09/04/01 11:26:38 TBLAMUR                    
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT770.                                                     
      *****************************************************************         
      * CAT770 - MUTUAL FUND ASSETS RECEIVER ADJUSTMENTS.             *         
      *        - UNDELIVERABLE RESIDUAL CREDITS                       *         
      *                                                               *         
      * 1. REPORT -                                                   *         
      *    A REPORT WILL BE PRODUCED DAILY OF ALL MUTUAL FUND ASSETS  *         
      *    DELETED ON THE PREVIOUS DAY.                               *         
      *    THE REPORT WILL LIST ITEMS DELETED WHERE THE USER          *         
      *    WAS THE RECEIVER AND DELIVERER.                            *         
      *                                                               *         
      * 2. RESIDUAL PROCESSING - DELIVERER SIDE ONLY                  *         
      *    MUTUAL FUND ITEMS DELETED BY A RECEIVER MUST BE EXCLUDED   *         
      *    FROM RESIDUAL PROCESSING.  TO ACCOMPLISH THIS, THE ACCOUNT *         
      *    NUMBER AND SECURITY WILL BE ADDED TO THE RESIDUAL CREDIT   *         
      *    EXCLUSION FILE IN THE NIGHTLY BATCH CYCLE.                 *         
      *    THIS INFORMATION WILL ALSO BE DISPLAYED ON THE RESIDUAL    *         
      *    CREDIT EXCLUSIONS SCREEN.                                  *         
      *                                                               *         
      * 3. RESTRICTED SECURITIES - RECEIVER SIDE ONLY                 *         
LRM001* B1 434689 ON, DO NOT DO THIS... CAT515 TO LOOKUP                        
      *    MUTUAL FUND ITEMS DELETED BY A RECEIVER MUST BE EXCLUDED   *         
      *    FROM FURTHER PROCESSING.  TO ACCOMPLISH THIS, THE ACCOUNT  *         
      *    NUMBER AND SECURITY WILL BE ADDED TO THE RESTRICTED        *         
      *    SECURITIES FILE IN THE NIGHTLY BATCH CYCLE FOR BOTH SIDE.  *         
      *    THIS INFORMATION WILL ALSO BE DISPLAYED ON THE RESTRICTED  *         
      *    SECURITIES SCREEN(VRSTSEC).                                *         
      *                                                               *         
DJ0003* 4. RESIDUAL PROCESSING - DELIVERER SIDE ONLY                  *         
DJ0003*    UNDELIVERABLE SETTLING LOCATION 30                         *         
      *                                                               *         
      * INPUT  - NSCC ACATS TRANSACTION FILE   - GDG                  *         
      *        - B1 FILE                       - VSAM                 *         
      *                                                               *         
      * OUTPUT - REPORT                        - GDG                  *         
      *                                                               *         
      *****************************************************************         
      * 05/25/01 DJ     SSR#R3848800 MUTUAL FUND RECEIVER ADJUSTMENTS *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-STAT.                 
                                                                                
           SELECT REPTFILE         ASSIGN       TO REPTFILE                     
                                   FILE STATUS  IS REPTFILE-STAT.               
                                                                                
           SELECT SORT-FILE        ASSIGN       TO UT-S-SORTWK01.               
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 4000 CHARACTERS                  
              DEPENDING ON W-REC-LEN-IN                                         
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:== BY ==INFILE==.                
                                                                                
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==NSCCMHDR==.              
                                                                                
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==NSCCMTRL==.              
                                                                                
       FD  REPTFILE                                                             
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  REPT-REC.                                                            
           03 REPT-LINE             PIC  X(133).                                
           03 REPT-CLT              PIC S9(003) COMP-3.                         
           03 REPT-FIL              PIC  X(008).                                
                                                                                
       SD  SORT-FILE.                                                           
                                                                                
       01  SORT-RECORD.                                                         
        03  SORT-REC.                                                           
         05  SORT-KEY.                                                          
           10  SORT-KEY-STREAM-CD            PIC X(0001).                       
           10  SORT-KEY-CLIENT-NBR           PIC X(0004).                       
DJ0001     10  SORT-KEY-CLIENT-NUM REDEFINES                                    
DJ0001         SORT-KEY-CLIENT-NBR           PIC 9(0004).                       
           10  SORT-KEY-ACAT-CTL-NBR         PIC X(0014).                       
           10  SORT-KEY-ASSET-SEQ-NBR        PIC 9(0006).                       
           10  SORT-KEY-TFR-TYPE             PIC X(0003).                       
           10  SORT-KEY-REC-TYPE             PIC X(0002).                       
             88  SORT-KEY-REC-TYPE-IS-TI     VALUE '10'.                        
             88  SORT-KEY-REC-TYPE-IS-AT     VALUE '20'.                        
             88  SORT-KEY-REC-TYPE-IS-FR     VALUE '30'.                        
                                                                                
         05  SORT-DATA.                                                         
           10  SORT-TI-ACCT-RCV-NBR          PIC X(0020).                       
           10  SORT-TI-ACCT-DLVR-NBR         PIC X(0020).                       
           10  SORT-MS-ADP-NO                PIC X(0007).                       
           10  SORT-CYCLE                    PIC X(0002).                       
           10  SORT-DIST-PARTICIPANT         PIC X(0004).                       
                                                                                
      ***---AT-DATA FROM SIAC.                                                  
           10 SORT-AT-DATA.                                                     
             15  SORT-AT-REC-TYPE            PIC X(0002).                       
                 88  SORT-REC-TYPE-IS-AT     VALUE 'AT'.                        
             15  SORT-AT-REC-LEN             PIC 9(0004).                       
             15  SORT-AT-PHSCL-SEQ-NBR       PIC 9(0002).                       
             15  SORT-AT-LGCL-SEQ-NBR        PIC 9(0002).                       
             15  SORT-AT-TRAN-TYPE           PIC X(0001).                       
                 88  SORT-AT-ADD             VALUE 'A'.                         
                 88  SORT-AT-CHANGE          VALUE 'C'.                         
                 88  SORT-AT-DELETE          VALUE 'D'.                         
             15  SORT-AT-ACAT-CTL-NBR        PIC X(0014).                       
             15  SORT-AT-TFR-TYPE            PIC X(0003).                       
             15  FILLER                            PIC X(0004).                 
             15  SORT-AT-SUB-PART-NBR        PIC X(0004).                       
             15  FILLER                            PIC X(0004).                 
             15  SORT-AT-RCV-NBR             PIC X(0004).                       
             15  FILLER                            PIC X(0004).                 
             15  SORT-AT-DEL-NBR             PIC X(0004).                       
             15  SORT-AT-TRAN-REF-ID         PIC X(0020).                       
             15  SORT-AT-ASSET-SEQ-NBR       PIC 9(0006).                       
             15  FILLER                            PIC X(0002).                 
             15  SORT-AT-ASSET-PRC-CATG      PIC X(0004).                       
             15  SORT-AT-OPT-CATG            PIC X(0002).                       
             15  SORT-AT-STL-LOC             PIC X(0002).                       
             15  SORT-AT-STL-LOC-RSN-CD      PIC X(0004).                       
             15  SORT-AT-SEC-CNTRY-CD        PIC X(0002).                       
             15  SORT-AT-SEC-ID              PIC X(0009).                       
             15  SORT-AT-SEC-CHKDGT          PIC X(0001).                       
             15  FILLER                            PIC X(0004).                 
             15  SORT-AT-ASSET-DESC          PIC X(0140).                       
             15  SORT-AT-ASSET-QTY-RQIND     PIC X(0001).                       
             15  SORT-AT-ASSET-REQ-TRNCD     PIC X(0001).                       
             15  SORT-AT-ASSET-QTY           PIC X(0017).                       
             15  SORT-AT-ASSET-PCT           PIC X(0015).                       
             15  SORT-AT-POS-CD              PIC X(0001).                       
             15  SORT-AT-ISO-CURCY-CD        PIC X(0003).                       
             15  SORT-AT-ASSET-AMT           PIC X(0017).                       
             15  SORT-AT-BEARER-BOND         PIC X(0001).                       
             15  SORT-AT-CASH-MRGN-SHTCD     PIC X(0001).                       
             15  SORT-AT-WHN-ISS-IND         PIC X(0001).                       
             15  SORT-AT-TFR-TYPE-RSN        PIC X(0002).                       
             15  SORT-AT-MBS-SER-NT          PIC X(0003).                       
             15  SORT-AT-ASST-COMMENT        PIC X(0120).                       
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT770'.            
           05  END-OF-INFILE-SW          PIC  X(001) VALUE '0'.                 
               88 END-OF-INFILE                      VALUE '1'.                 
           05  END-OF-SORT-SW            PIC  X(001) VALUE ' '.                 
               88  END-OF-SORT                       VALUE '1'.                 
           05  INFILE-STAT               PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING   VALUE '35'.                            
           05  REPTFILE-STAT             PIC  X(002).                           
               88 REPTFILE-OKAY          VALUE '00' THRU '09', '97'.            
               88 REPTFILE-END-OF-FILE   VALUE '10'.                            
               88 REPTFILE-EMPTY-MISSING VALUE '35'.                            
           05  W-PROC-DATE.                                                     
               10 W-PROC-DATE-CC         PIC  X(02).                            
               10 W-PROC-DATE-YY         PIC  X(02).                            
               10 W-PROC-DATE-MM         PIC  X(02).                            
               10 W-PROC-DATE-DD         PIC  X(02).                            
           05  W-PROC-DATE-N REDEFINES                                          
               W-PROC-DATE               PIC  9(008).                           
           05  W-SYS-DATE                PIC  9(006) VALUE 0.                   
           05          REDEFINES W-SYS-DATE.                                    
               10  W-SYS-YY              PIC  X(002).                           
               10  W-SYS-MM              PIC  X(002).                           
               10  W-SYS-DD              PIC  X(002).                           
           05  W-SYS-TIME                PIC  9(008) VALUE 0.                   
           05          REDEFINES W-SYS-TIME.                                    
               10  W-SYS-HH              PIC  X(002).                           
               10  W-SYS-MN              PIC  X(002).                           
               10  W-SYS-SS              PIC  X(002).                           
               10  W-SYS-MS              PIC  X(002).                           
           05  W-REPT-CLT                PIC  9(03) VALUE 0.                    
           05  W-REPT-LINE               PIC  X(133).                           
           05  W-CLT-CNT                 PIC  9(11) VALUE 0.                    
                                                                                
           05  W-BROKER-FOUND-SW         PIC  X(001) VALUE ' '.                 
               88  W-BROKER-FOUND-ON-B1              VALUE '1'.                 
               88  W-BROKER-NOT-FOUND                VALUE ' '.                 
           05  W-PREV-BROKER-NBR         PIC X(0004) VALUE ' '.                 
                                                                                
DJ0003     05  W-UNDELIVERABLE-CNT       PIC  9(011) VALUE 0.                   
           05  W-MF-DELETE-FOUND-CNT     PIC  9(011) VALUE 0.                   
           05  W-DELIVERER-CNT           PIC  9(011) VALUE 0.                   
           05  W-RECEIVER-CNT            PIC  9(011) VALUE 0.                   
           05  W-MSD-FOUND-CNT           PIC  9(011) VALUE 0.                   
           05  W-MSD-NOT-FOUND-CNT       PIC  9(011) VALUE 0.                   
           05  W-TRANSFER-FND-SW         PIC  X(001) VALUE ' '.                 
               88 W-TRANSFER-FOUND                   VALUE 'Y'.                 
           05  W-VTRNFR-FOUND-CNT        PIC  9(011) VALUE 0.                   
           05  W-VTRNFR-NOT-FOUND-CNT    PIC  9(011) VALUE 0.                   
           05  W-VRSTSEC-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-VRSTSEC-FOUND                    VALUE 'Y'.                 
           05  W-VRSTSEC-FOUND-CNT       PIC  9(011) VALUE 0.                   
           05  W-VRSTSEC-NOT-FOUND-CNT   PIC  9(011) VALUE 0.                   
           05  W-VRSTSEC-INSERT-CNT      PIC  9(011) VALUE 0.                   
           05  W-VRSTSEC-NOT-INSERT-CNT  PIC  9(011) VALUE 0.                   
           05  W-VRSTSEC-UPDATE-CNT      PIC  9(011) VALUE 0.                   
           05  W-VRSTSEC-NOT-UPDATE-CNT  PIC  9(011) VALUE 0.                   
LRM006     05  W-ACTIAST-FETCH-COUNT     PIC  9(011) VALUE 0.                   
LRM006     05  W-ACTIAST-DLET-COUNT      PIC  9(011) VALUE 0.                   
                                                                                
      ***--RESIDUAL CREDIT EXCLUSION TABLES                                     
           05  W-VRSDSEC-FND-SW          PIC  X(001) VALUE ' '.                 
               88 W-VRSDSEC-FOUND                    VALUE 'Y'.                 
           05  W-VRSDACC-INSERT-CNT      PIC  9(011) VALUE 0.                   
           05  W-VRSDACC-NOT-INSERT-CNT  PIC  9(011) VALUE 0.                   
           05  W-VRSDSEC-INSERT-CNT      PIC  9(011) VALUE 0.                   
           05  W-VRSDSEC-NOT-INSERT-CNT  PIC  9(011) VALUE 0.                   
           05  W-VRSDSEC-DUPE-CNT        PIC  9(011) VALUE 0.                   
           05  W-VRSDSEC-FOREIGN-KY-CNT  PIC  9(011) VALUE 0.                   
                                                                                
           05  W-PREV-CLIENT-NBR         PIC X(0004) VALUE ' '.                 
           05  W-PREV-CONTROL-NBR        PIC X(0014) VALUE ' '.                 
           05  W-PREV-RCV-NBR            PIC X(0004) VALUE ' '.                 
           05  W-PREV-RCV-ACCT           PIC X(0020) VALUE ' '.                 
                                                                                
           05  W-SUB1                    PIC  9(003) VALUE 0.                   
           05  W-SUB1-SAVE               PIC  9(003) VALUE 0.                   
           05  W-SUB2                    PIC  9(003) VALUE 0.                   
           05  TAB-X                     PIC  9(003) VALUE 0.                   
                                                                                
           05  W-INFILE-CNT              PIC  9(011) VALUE 0.                   
           05  W-REPTFILE-CNT            PIC  9(011) VALUE 0.                   
           05  W-DETAIL-CNT              PIC  9(011) VALUE 0.                   
           05  W-RELEASE-CNT             PIC  9(011) VALUE 0.                   
           05  W-RETURN-CNT              PIC  9(011) VALUE 0.                   
           05  W-PAGE-CNT                PIC  9(011) VALUE 0.                   
           05  W-LINE-CNT                PIC  9(011) VALUE 60.                  
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.                   
           05  W-REC-LEN-OUT             PIC  9(005) VALUE 0.                   
           05  W-REC-LEN-SRT             PIC  9(005) VALUE 0.                   
                                                                                
           05  W-COMMA-PTR               PIC  9(002) VALUE 0.                   
           05  W-QTY-PTR                 PIC  9(002) VALUE 0.                   
           05  W-INT-PTR                 PIC  9(002) VALUE 0.                   
           05  W-DEC-PTR                 PIC  9(002) VALUE 0.                   
           05  W-COMMA-FND-SW            PIC  X(001) VALUE ' '.                 
           05  W-ASSET-QTY               USAGE COMP-2.                          
           05  W-ASSET-AMT               USAGE COMP-2.                          
           05  W-ASSET-QTY-X             PIC ZZZZZZ9.9999.                      
           05  W-ASSET-AMT-X             PIC ZZZZZZZZ9.99.                      
                                                                                
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
      /                                                                         
       01                                PIC X(008) VALUE 'TRN-REC '.           
           COPY NSCCMTRN REPLACING ==:NSCCMTRN:== BY ==W-TRN==.                 
      /                                                                         
       01                                PIC X(008) VALUE 'HDR-REC '.           
           COPY NSCCMHDR REPLACING ==:NSCCMHDR:== BY ==W-HDR==.                 
      /                                                                         
       01                                PIC X(008) VALUE 'TRL-REC '.           
           COPY NSCCMTRL REPLACING ==:NSCCMTRL:== BY ==W-TRL==.                 
      /                                                                         
       01                                PIC X(008) VALUE 'B1-TABLE'.           
       01  B1-TABLE-AREA.                                                       
           03  B1-TABLE OCCURS 500 TIMES.                                       
               05  B1-CLT-NBR               PIC 9(04).                          
               05  B1-CLT-NAME              PIC X(30).                          
               05  B1-BKR-CLR-NO            PIC X(04).                          
               05  B1-STREAM                PIC X(01).                          
               05  B1-STATUS                PIC X(01).                          
               05  B1-ACAT-STATUS           PIC X(01).                          
               05  B1-ACAT-MF-RCVR-ADJ-RPT  PIC X(01).                          
               05  B1-PRINT                 PIC X(01).                          
               05  B1-ACAT-MF-RCVR-ADJ      PIC X(01).                          
LRM001         05  B1-ACAT-MF-AUTO-DEL      PIC X(01).                          
LRM006         05  B1-ACAT-DELIVER-NTW-LVL4-FUND                                
LRM006                                      PIC X(01).                          
       01  B1-WORK-FIELDS.                                                      
           03  B1-SUB                       PIC 9(04) VALUE 0.                  
           03  B1-ACTIVE-CNT                PIC 9(04) VALUE 0.                  
           03  B1-PRT-SUB                   PIC 9(04) VALUE 1.                  
           03  B1-ACAT-MF-RCVR-ADJ-RPT-CURR PIC X(01) VALUE ' '.                
      /                                                                         
       01  W-SIAC-HEADER-SW          PIC  X(001) VALUE ' '.                     
           88 W-SIAC-HEADER-IS-OKAY              VALUE 'Y'.                     
           88 W-SIAC-HEADER-NOT-OKAY             VALUE 'N'.                     
       01  W-SIAC-HEADER.                                                       
           05                            PIC  X(006).                           
           05  W-SIAC-HEADER-DATE        PIC  X(008).                           
           05                            PIC  X(040).                           
           05  W-SIAC-HEADER-CYCLE.                                             
               07  W-SIAC-HEADER-CYCLE-N PIC  9(002).                           
           05                            PIC  X(033).                           
           05                            PIC  X(044).                           
                                                                                
      /                                                                         
       01                                PIC X(008) VALUE 'W-SORT  '.           
       01  W-SORT-RECORD.                                                       
        03  W-SORT-REC.                                                         
         05  W-SORT-KEY.                                                        
           10  W-SORT-KEY-STREAM-CD            PIC X(0001).                     
           10  W-SORT-KEY-CLIENT-NBR           PIC X(0004).                     
           10  W-SORT-KEY-CLIENT-NBR-N REDEFINES                                
               W-SORT-KEY-CLIENT-NBR           PIC 9(0004).                     
           10  W-SORT-KEY-ACAT-CTL-NBR         PIC X(0014).                     
           10  W-SORT-KEY-ASSET-SEQ-NBR        PIC 9(0006).                     
           10  W-SORT-KEY-TFR-TYPE             PIC X(0003).                     
           10  W-SORT-KEY-REC-TYPE             PIC X(0002).                     
                                                                                
      /                                                                         
       01  W-HDR1-REC.                                                          
           05                               PIC  X(01) VALUE '1'.               
           05                               PIC  X(08) VALUE                    
               'CAT770 -'.                                                      
           05  W-HDR1-CLT                   PIC  Z999.                          
           05                               PIC  X(01) VALUE ' '.               
           05  W-HDR1-CLT-NAME              PIC  X(30) VALUE ' '.               
           05                               PIC  X(04) VALUE ' '.               
           05                               PIC  X(42) VALUE                    
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.                    
           05                               PIC  X(11) VALUE ' '.               
           05                               PIC  X(13) VALUE                    
               'PROCESS DATE '.                                                 
           05  W-HDR1-MM                    PIC  X(02).                         
           05  W-HDR1-S1                    PIC  X(01) VALUE '/'.               
           05  W-HDR1-DD                    PIC  X(02).                         
           05  W-HDR1-S2                    PIC  X(01) VALUE '/'.               
           05  W-HDR1-YY                    PIC  X(02).                         
           05                               PIC  X(01) VALUE ' '.               
           05                               PIC  X(05) VALUE                    
               'PAGE '.                                                         
           05  W-HDR1-PAGE                  PIC  ZZZ9.                          
                                                                                
       01  W-HDR2-REC.                                                          
           05                               PIC  X(01) VALUE ' '.               
           05                               PIC  X(08) VALUE                    
               'BROKER  '.                                                      
           05  W-HDR2-BKR                   PIC  X(04).                         
           05                               PIC  X(40) VALUE ' '.               
           05                               PIC  X(42) VALUE                    
               'MUTUAL FUND ASSETS DELETED REPORT'.                             
           05                               PIC  X(10) VALUE ' '.               
           05                               PIC  X(09) VALUE                    
               'RUN TIME '.                                                     
           05  W-HDR2-MM                    PIC  X(02).                         
           05  W-HDR2-S1                    PIC  X(01) VALUE '/'.               
           05  W-HDR2-DD                    PIC  X(02).                         
           05  W-HDR2-S2                    PIC  X(01) VALUE '/'.               
           05  W-HDR2-YY                    PIC  X(02).                         
           05                               PIC  X(01) VALUE ' '.               
           05  W-HDR2-HH                    PIC  X(02).                         
           05  W-HDR2-CC                    PIC  X(01) VALUE ':'.               
           05  W-HDR2-MN                    PIC  X(02).                         
           05                               PIC  X(04) VALUE ' '.               
                                                                                
       01  W-HDR3-REC.                                                          
           05                               PIC  X(01) VALUE '0'.               
           05                               PIC  X(18) VALUE                    
               'ACCOUNT NO. '.                                                  
           05  W-HDR3-BR                    PIC  X(003) VALUE ' '.              
           05                               PIC  X(001) VALUE '-'.              
           05  W-HDR3-ACCT                  PIC  X(005) VALUE ' '.              
           05                               PIC  X(105) VALUE ' '.              
                                                                                
       01  W-HDR4-REC.                                                          
           05         PIC X(19) VALUE ' CONTRA BROKER NO. ' .                   
           05  W-HDR4-CONTRA-BROKER         PIC X(04) VALUE ' '.                
           05                               PIC X(13) VALUE ' '.                
           05         PIC X(21) VALUE 'CONTRA ACCOUNT       '.                  
           05  W-HDR4-CONTRA-ACCOUNT        PIC X(20) VALUE ' '.                
           05                               PIC X(56) VALUE ' '.                
                                                                                
       01  W-HDR5-REC.                                                          
           05         PIC X(19) VALUE ' ACATS CONTROL NO. '.                    
           05  W-HDR5-CONTROL-NBR           PIC X(14) VALUE ' '.                
           05                               PIC X(03) VALUE ' '.                
           05         PIC X(21) VALUE 'ORIGINAL SETTLE DATE '.                  
           05  W-HDR5-SETTLE-DATE           PIC X(10) VALUE ' '.                
           05                               PIC X(66) VALUE ' '.                
                                                                                
       01  W-HDR6-REC.                                                          
           05                               PIC  X(01) VALUE '0'.               
           05                               PIC  X(01) VALUE ' '.               
           05                               PIC  X(14) VALUE                    
               '  CONTROL-NO  '.                                                
           05                               PIC  X(01) VALUE ' '.               
           05                               PIC  X(08) VALUE                    
               'ACCT-NO'.                                                       
           05                               PIC  X(01) VALUE ' '.               
           05                               PIC  X(04) VALUE                    
               'RCVR'.                                                          
           05                               PIC  X(01) VALUE ' '.               
           05                               PIC  X(04) VALUE                    
               'DLVR'.                                                          
           05                               PIC  X(01) VALUE ' '.               
           05                               PIC  X(17) VALUE                    
               '        QUANTITY '.                                             
           05                               PIC  X(02) VALUE ' '.               
           05                               PIC  X(12) VALUE                    
               '  ASSET-ID  '.                                                  
           05                               PIC  X(02) VALUE ' '.               
           05                               PIC  X(30) VALUE                    
               '        DESCRIPTION           '.                                
           05                               PIC  X(01) VALUE ' '.               
           05                               PIC  X(17) VALUE                    
               '          AMOUNT '.                                             
           05                               PIC  X(02) VALUE ' '.               
           05                               PIC  X(03) VALUE                    
               'L/S'.                                                           
           05                               PIC  X(06) VALUE                    
               ' C/M/S'.                                                        
           05                               PIC  X(04) VALUE                    
               ' CYC'.                                                          
           05                               PIC  X(18) VALUE ' '.               
                                                                                
       01  W-DTL1-REC.                                                          
           05                               PIC  X(01) VALUE '0'.               
           05                               PIC  X(01) VALUE ' '.               
           05  W-DTL1-CONTROL-NBR           PIC  X(14) VALUE ' '.               
           05                               PIC  X(01) VALUE ' '.               
           05  W-DTL1-ACCT-NBR              PIC  X(08) VALUE ' '.               
           05                               PIC  X(01) VALUE ' '.               
           05  W-DTL1-RCV-NBR               PIC  X(04).                         
           05                               PIC  X(01) VALUE ' '.               
           05  W-DTL1-DEL-NBR               PIC  X(04).                         
           05                               PIC  X(01) VALUE ' '.               
           05  W-DTL1-QTY                   PIC  ZZZZZZZZZZZ9.9999.             
           05                               PIC  X(02) VALUE ' '.               
           05  W-DTL1-SEC-CNTRY-CD          PIC  X(02) VALUE ' '.               
           05  W-DTL1-SEC-ID                PIC  X(09) VALUE ' '.               
           05  W-DTL1-SEC-CHKDGT            PIC  X(01) VALUE ' '.               
           05                               PIC  X(02) VALUE ' '.               
           05  W-DTL1-DESC1                 PIC  X(30).                         
           05                               PIC  X(02) VALUE ' '.               
           05  W-DTL1-AMT                   PIC  ZZZZZZZZZZZZZ9.99.             
           05                               PIC  X(02) VALUE ' '.               
           05  W-DTL1-LONG-SHORT            PIC  X(01) VALUE ' '.               
           05                               PIC  X(04) VALUE ' '.               
           05  W-DTL1-CASH-MRGN-SHTCD       PIC  X(01).                         
           05                               PIC  X(03) VALUE ' '.               
           05  W-DTL1-CYCLE                 PIC  X(02).                         
           05                               PIC  X(18) VALUE ' '.               
                                                                                
       01  W-DTL2-REC.                                                          
           05                               PIC  X(01) VALUE ' '.               
           05                               PIC  X(50) VALUE ' '.               
           05                               PIC  X(16) VALUE ' '.               
           05  W-DTL2-DESC2                 PIC  X(30).                         
           05                               PIC  X(49) VALUE ' '.               
                                                                                
       01  W-DTLX-REC.                                                          
           05                               PIC  X(01) VALUE '0'.               
           05                               PIC  X(02) VALUE ' '.               
           05                               PIC  X(40) VALUE                    
           'NO MUTUAL FUNDS DELETED TODAY'.                                     
           05                               PIC  X(90) VALUE ' '.               
                                                                                
      /                                                                         
      ******************************************************************        
      * B1 HEADER                                                      *        
      ******************************************************************        
       01                                PIC X(08) VALUE 'BHINFO  '.            
           COPY BHINFO.                                                         
      /                                                                         
      ******************************************************************        
      * B1 ACAT SECTION                                                *        
      ******************************************************************        
       01                                PIC X(08) VALUE 'BHACAT  '.            
           COPY BHACAT.                                                         
      /                                                                         
       01                                PIC X(008) VALUE 'BPDATESC'.           
                                                                                
           COPY BPDATESC.                                                       
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'GETMSDCE'.            
           COPY GETMSDCE.                                                       
      /                                                                         
      ***===> COBOL LE                                                          
       01  W-ABEND-AREA.                                                        
           05  ABEND-CODE                PIC S9(04) COMP SYNC.                  
           05  DSNTIAR                   PIC X(008) VALUE 'DSNTIAR'.            
                                                                                
       01                                PIC  X(08) VALUE 'STUBCPY '.           
           COPY STUBCPY.                                                        
      ***<=== COBOL LE                                                          
      /                                                                         
      ******************************************************************        
      * DB2                                                            *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'SQLCA   '.           
           EXEC SQL INCLUDE SQLCA        END-EXEC.                              
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'VTRNFR'.             
           EXEC SQL INCLUDE VTRNFR       END-EXEC.                              
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'VRSTSEC '.           
           EXEC SQL INCLUDE VRSTSEC      END-EXEC.                              
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'VRSDACC '.           
           EXEC SQL INCLUDE VRSDACC      END-EXEC.                              
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'VRSDSEC '.           
           EXEC SQL INCLUDE VRSDSEC      END-EXEC.                              
      /                                                                         
LRM001 01  FILLER                        PIC X(008) VALUE 'VRSDBLK '.           
LRM001     EXEC SQL INCLUDE VRSDBLK      END-EXEC.                              
      /                                                                         
LRM006 01  FILLER                        PIC X(008) VALUE 'ACTIAST '.           
LRM006     EXEC SQL                                                     CAT770  
LRM006        INCLUDE ACTIAST                                           CAT770  
LRM006     END-EXEC.                                                    CAT770  
LRM006                                                                          
LRM006* DECLARE CURSOR TO OBTAIN ALL WITHHELD ASSETS WHICH WERE NETWORK         
LRM006* LEVEL 4. THESE HAVE L FOLLOWED BY CLIENT NUMBER                         
LRM006     EXEC SQL                                                             
LRM006        DECLARE NSCC_AT1_CRSR CURSOR WITH HOLD FOR                        
LRM006           SELECT                                                         
LRM006              ACAT_CONTROL_NBR                                            
LRM006             ,ISIN_SEC_ISSUE_CD                                           
LRM006             ,SECURITY_ADP_NBR                                            
LRM006             ,ASSET_CMNT_TXT                                              
LRM006           FROM ACTIAST                                                   
LRM006           WHERE  CLIENT_NBR   =  :DCLACTIAST.CLIENT-NBR                  
LRM006     END-EXEC.                                                            
LRM006/                                                                         
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
           05  W-COMMIT-CNT              PIC  9(009) VALUE 0.                   
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(011) VALUE 0.                   
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC ---9.                              
           05  W-SQLERRD-3                   PIC  S9(9).                        
                                                                                
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
                                                                                
       01                                PIC X(008) VALUE 'END-O-WS'.           
      /                                                                         
      *****************************************************************         
      *    LINKAGE SECTION                                            *         
      *****************************************************************         
       LINKAGE SECTION.                                                         
       01  L-JCL-PARMS.                                                         
           05  PARMLENGTH                PIC S9(004) COMP SYNC.                 
           05  L-STREAM                  PIC  X(001).                           
                                                                                
      *****************************************************************         
      *                                                               *         
      *****************************************************************         
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                                                                         
           DISPLAY 'CAT770 - MUTUAL FUND ASSETS DELETED REPORT'                 
           DISPLAY '   INPUT=BZZZ.SIAC0716.ACAT.TRAN'                           
           DISPLAY '   UPDATE RESTRICTED TABLE FOR RECEIVER FOR'                
           DISPLAY '       NON AUTO-FUND DELETE CLIENT'                         
           DISPLAY '   UPDATE RESIDUAL TABLE FOR DELIVERER FOR'                 
           DISPLAY '       NON AUTO-FUND DELETE CLIENT'                         
           DISPLAY '   UPDATE RESCIND BLOCK FOR DELIVERER FOR'                  
           DISPLAY '       AUTO-FUND DELETE CLIENT'                             
DJ0003     DISPLAY '   UPDATE RESIDUAL TABLE FOR DELIVERER FOR'                 
DJ0003     DISPLAY '       UNDELIVERABLE SETTLING LOCATION 30'                  
LRM006     DISPLAY '   UPDATE RESIDUAL TABLE FOR DELIVERER FOR'                 
LRM006     DISPLAY '       NETWORK LEVEL 4 FUNDS'                               
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '                                                          
                                                                                
           PERFORM 1000-INIT           THRU 1000-EXIT                           
                                                                                
           SORT SORT-FILE ON ASCENDING SORT-KEY                                 
                INPUT  PROCEDURE IS 2000-SORT-INPUT  THRU 2000-EXIT             
                OUTPUT PROCEDURE IS 5000-SORT-OUTPUT THRU 5000-EXIT             
                                                                                
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT                           
                                                                                
           GOBACK                                                               
           .                                                                    
      /                                                                         
       1000-INIT.                                                               
                                                                                
           DISPLAY 'CAT770: L-STREAM         = '                                
                            L-STREAM.                                           
           DISPLAY ' '                                                          
                                                                                
           EXEC SQL                                                             
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP                     
           END-EXEC                                                             
                                                                                
           IF  SQLCODE = +0                                                     
               DISPLAY ' '                                                      
               DISPLAY 'CAT770: W-CURRENT-TIMESTAMP = '                         
                                                    W-CURRENT-TIMESTAMP         
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT770: W-CURRENT-TIMESTAMP NOT SET'                    
               MOVE SQLCODE      TO W-DB2-SQLCODE                               
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8500-SQL-ERROR THRU 8500-EXIT                           
           END-IF.                                                              
                                                                                
           ACCEPT W-SYS-DATE              FROM DATE                             
           ACCEPT W-SYS-TIME              FROM TIME                             
           DISPLAY 'CAT770: SYS-DATE ' W-SYS-DATE                               
                          ' SYS-TIME ' W-SYS-TIME                               
                                                                                
           DISPLAY ' '                                                          
                                                                                
           MOVE 'CAT770'                  TO BPDATES-CALLING-PGM                
           SET  LNKDATZ-REQUEST           TO TRUE                               
           CALL BPDATES USING BPDATES-PARAMETERS                                
           MOVE BPD-PROC-DATE            TO W-PROC-DATE                         
                                                                                
           DISPLAY 'CAT770: PROC-DATE= ' BPD-PROC-DATE                          
                                                                                
           DISPLAY ' '                                                          
                                                                                
           OPEN INPUT INFILE                                                    
           DISPLAY 'CAT770: INFILE   OPENED FOR INPUT.  STATUS = '              
                                               INFILE-STAT                      
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT770: ERROR OPENING INFILE'                           
               DISPLAY 'CAT770: OPEN STATUS = ' INFILE-STAT                     
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT770: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF                                                               
                                                                                
           OPEN OUTPUT REPTFILE                                                 
           DISPLAY 'CAT770: REPTFILE OPENED FOR OUTPUT. STATUS = '              
                                               REPTFILE-STAT                    
                                                                                
           IF  REPTFILE-OKAY                                                    
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT770: ERROR OPENING REPTFILE'                         
               DISPLAY 'CAT770: OPEN STATUS = ' REPTFILE-STAT                   
                            '.  INPUT-CNT = ' W-REPTFILE-CNT                    
               DISPLAY 'CAT770: U3002 - ABENDING ON BAD FILE STATUS'            
               MOVE +3002    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF                                                               
                                                                                
           DISPLAY ' '                                                          
           PERFORM 1500-LOAD-B1           THRU 1500-EXIT                        
                                                                                
           MOVE 'D'              TO GETMSD-DEVICE-IND                           
           MOVE 'R'              TO GETMSD-ACCESS-IND                           
           MOVE 'E'              TO GETMSD-FORMAT-IND                           
                                                                                
           DISPLAY ' '                                                          
           .                                                                    
       1000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       1500-LOAD-B1.                                                            
           DISPLAY 'CAT770: 1500-LOAD-B1'                                       
                                                                                
           MOVE SPACES                   TO  B1-TABLE-AREA                      
           MOVE 0                        TO  B1-SUB                             
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500                
                                                                                
             MOVE  ' '                   TO  BH-BROKER-HEADER-INFO              
                                             BH-ACAT-INFO                       
             MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N                 
             MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE             
             MOVE  '434500'              TO  BH-B2-INFO-ID                      
             CALL   GETB1V             USING BH-BROKER-HEADER-INFO              
                                             BH-ACAT-INFO                       
             IF   BH-BROKER-ACTIVE                                              
                   MOVE  BH-BROKER-NUMBER-N                                     
                                         TO B1-CLT-NBR (B1-SUB)                 
                   MOVE  BH-BROKER-NAME                                         
                                         TO B1-CLT-NAME (B1-SUB)                
                   MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)                     
                                         TO B1-BKR-CLR-NO (B1-SUB)              
                   IF  BH-BROKER-MINI-MAXI-SUBGROUP > ' '                       
                       MOVE BH-BROKER-MINI-MAXI-SUBGROUP                        
                                         TO B1-STREAM     (B1-SUB)              
                   ELSE                                                         
                       MOVE BH-BROKER-MINI-MAXI-INDICATOR                       
                                         TO B1-STREAM     (B1-SUB)              
                   END-IF                                                       
                   MOVE  BH-BROKER-STATUS                                       
                                         TO B1-STATUS     (B1-SUB)              
               IF  BH-ACAT-ACTIVE                                               
                   ADD 1 TO B1-ACTIVE-CNT                                       
                   MOVE  BH-ACAT-MF-RCVR-ADJ-RPT                                
                                TO B1-ACAT-MF-RCVR-ADJ-RPT(B1-SUB)              
                   MOVE  BH-ACAT-STATUS                                         
                                         TO B1-ACAT-STATUS(B1-SUB)              
                   MOVE  BH-ACAT-RCR-EXCLUSION-FOR-MF                           
                                         TO B1-ACAT-MF-RCVR-ADJ(B1-SUB)         
LRM001             MOVE  BH-ACAT-MF-AUTO-DELETE                                 
LRM001                                   TO B1-ACAT-MF-AUTO-DEL(B1-SUB)         
LRM006             MOVE BH-ACAT-DELIVER-NTW-LVL4-FUND                           
LRM006                         TO B1-ACAT-DELIVER-NTW-LVL4-FUND(B1-SUB)         
                       DISPLAY      ' CLT ' B1-CLT-NBR    (B1-SUB)              
                                        ' ' B1-CLT-NAME   (B1-SUB)              
                                    ' BKR ' B1-BKR-CLR-NO (B1-SUB)              
                                    ' STR ' B1-STREAM     (B1-SUB)              
                                    ' STA ' B1-STATUS     (B1-SUB)              
                                   ' ACAT ' B1-ACAT-STATUS(B1-SUB)              
LRM001                           ' DELETE ' B1-ACAT-MF-AUTO-DEL(B1-SUB)         
TEST                           ' Y-SCREEN ' B1-ACAT-MF-RCVR-ADJ(B1-SUB)         
                       ' MFC-RPT ' B1-ACAT-MF-RCVR-ADJ-RPT(B1-SUB)              
               ELSE                                                             
                   MOVE ' '              TO B1-ACAT-STATUS(B1-SUB)              
               END-IF                                                           
             END-IF                                                             
                                                                                
           END-PERFORM                                                          
                                                                                
           DISPLAY ' '                                                          
           DISPLAY  'B1 ACTIVE COUNT = ' B1-ACTIVE-CNT                          
           DISPLAY ' '                                                          
           .                                                                    
       1500-EXIT. EXIT.                                                         
      /                                                                         
       2000-SORT-INPUT.                                                         
                                                                                
           PERFORM UNTIL END-OF-INFILE                                          
                   PERFORM 3000-READ-INPUT THRU 3000-EXIT                       
                   IF  NOT END-OF-INFILE                                        
                       PERFORM 4000-FORMAT-SORT THRU 4000-EXIT                  
                   END-IF                                                       
           END-PERFORM                                                          
                                                                                
LRM006     PERFORM VARYING W-SUB1 FROM 1 BY 1                                   
LRM006                   UNTIL W-SUB1 > 500                                     
LRM006         MOVE B1-CLT-NBR   (W-SUB1)                                       
LRM006                                TO SORT-KEY-CLIENT-NBR                    
LRM006         MOVE W-SUB1 TO W-SUB1-SAVE                                       
LRM006         MOVE SORT-KEY-CLIENT-NBR     TO W-PREV-CLIENT-NBR                
LRM006         PERFORM 3500-NTW-LVL4-RTN                                CAT770  
LRM006     END-PERFORM                                                          
           .                                                                    
       2000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       3000-READ-INPUT.                                                         
                                                                                
           IF  END-OF-INFILE                                                    
               GO 3000-EXIT                                                     
           END-IF                                                               
                                                                                
           READ INFILE                                                          
                AT END                                                          
                   SET END-OF-INFILE TO TRUE                                    
                   DISPLAY 'CAT770: END OF INPUT REACHED'                       
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
                   GO TO 3000-EXIT                                              
           END-READ                                                             
                                                                                
           ADD  1                        TO W-INFILE-CNT                        
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT770: ERROR READING INFILE'                           
               DISPLAY 'CAT770: READ STATUS = ' INFILE-STAT                     
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT770: U3008 - ABENDING ON BAD FILE STATUS'            
               MOVE +3008    TO ABEND-CODE                                      
               CALL ABEND USING ABEND-CODE                                      
           END-IF                                                               
                                                                                
           IF  INFILE-REC-TYPE = '1'                                            
               MOVE INFILE-RECORD TO W-SIAC-HEADER                              
               DISPLAY ' '                                                      
               DISPLAY 'CAT770: THIS IS THE SIAC HEADER RECORD: '               
               DISPLAY '        COLS.007 = SIAC HEADER DATE '                   
                                '(' W-SIAC-HEADER-DATE ')'                      
               DISPLAY '        COLS.055 = SIAC HEADER CYCLE NUMBER '           
                                '(' W-SIAC-HEADER-CYCLE-N ')'                   
               DISPLAY 'COLS.001-063 => '                                       
                       '----+----1----+----2----+----3----+----4'               
                       '----+----5----+----6---'                                
               DISPLAY 'COLS.001-063 => ' INFILE-RECORD (1 : 63)                
                       ' <= COLS.001-063'                                       
               DISPLAY ' '                                                      
               DISPLAY 'COLS.064-133 => '                                       
                       '-+----7----+----8----+----9----+----0'                  
                       '----+----1----+----2----+----3---'                      
               DISPLAY 'COLS.064-133 => ' INFILE-RECORD (64: 70)                
                       ' <= COLS.064-133'                                       
               DISPLAY ' '                                                      
               IF  W-SIAC-HEADER-DATE = BPD-PROC-DATE                           
                   SET W-SIAC-HEADER-IS-OKAY     TO TRUE                        
                   DISPLAY 'CAT770: W-SIAC-HEADER-DATE'                         
                                '(' W-SIAC-HEADER-DATE ')'                      
                                ' = BPD-PROC-DATE '                             
                                '(' BPD-PROC-DATE '). OK'                       
               ELSE                                                             
                   SET W-SIAC-HEADER-NOT-OKAY    TO TRUE                        
                   DISPLAY 'CAT770: W-SIAC-HEADER-DATE'                         
                                '(' W-SIAC-HEADER-DATE ')'                      
                                ' NOT = BPD-PROC-DATE '                         
                                '(' BPD-PROC-DATE ').NOT OKAY!!!!'              
               END-IF                                                           
               GO TO 3000-READ-INPUT                                            
           END-IF                                                               
                                                                                
           IF  W-SIAC-HEADER-IS-OKAY                                            
           AND INFILE-ASSET-OUTPUT                                              
LRM005*** ONLY FUND DELETES ARE ALLOWED BY THE RECEIVER...                      
             IF ((INFILE-AT-ASSET-PRC-CATG = 'MFNM' OR 'MFMM')                  
LRM005       OR  INFILE-AT-SUB-PART-NBR   = INFILE-AT-RCV-NBR)                  
             AND INFILE-AT-TRAN-TYPE      = 'D'                                 
                 CONTINUE                                                       
             ELSE                                                               
DJ0003         IF (INFILE-AT-STL-LOC       = '30')                              
DJ0003         AND INFILE-DIST-PARTICIPANT = INFILE-AT-DEL-NBR                  
DJ0003         AND INFILE-AT-TRAN-TYPE     = 'A'                                
DJ0003         AND INFILE-AT-SEC-ID        > ' '                                
                   CONTINUE                                                     
               ELSE                                                             
                   GO TO 3000-READ-INPUT                                        
               END-IF                                                           
             END-IF                                                             
DJ0003     ELSE                                                                 
DJ0003             GO TO 3000-READ-INPUT                                        
           END-IF                                                               
                                                                                
           .                                                                    
       3000-EXIT.                                                               
           EXIT.                                                                
LRM006 3500-NTW-LVL4-RTN.                                               CAT770  
LRM006     MOVE 'L'             TO CLIENT-NBR OF DCLACTIAST (1:1).      CAT770  
LRM006     MOVE SORT-KEY-CLIENT-NBR (2:3)                               CAT770  
LRM006                          TO CLIENT-NBR OF DCLACTIAST (2:3).      CAT770  
LRM006     EXEC SQL                                                             
LRM006        OPEN NSCC_AT1_CRSR                                                
LRM006     END-EXEC                                                             
LRM006                                                                          
LRM006     IF SQLCODE NOT = +0                                                  
LRM006        DISPLAY '** CAT770 ABENDED: SQL AT1 CURSOR OPEN - CLT='   CAT770  
LRM006                CLIENT-NBR OF DCLACTIAST                          CAT770  
LRM006        MOVE SQLCODE TO W-DB2-SQLCODE                                     
LRM006        DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                                
LRM006        PERFORM 8500-SQL-ERROR                                    CAT770  
LRM006     END-IF                                                               
LRM006                                                                          
LRM006     PERFORM UNTIL SQLCODE NOT = +0                                       
LRM006        EXEC SQL                                                          
LRM006           FETCH NSCC_AT1_CRSR                                            
LRM006              INTO                                                        
LRM006              :DCLACTIAST.ACAT-CONTROL-NBR                                
LRM006             ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                               
LRM006             ,:DCLACTIAST.SECURITY-ADP-NBR                                
LRM006             ,:DCLACTIAST.ASSET-CMNT-TXT                                  
LRM006        END-EXEC                                                          
LRM006        IF SQLCODE = +0                                                   
LRM006           ADD 1 TO W-ACTIAST-FETCH-COUNT                                 
LRM006           MOVE SECURITY-ADP-NBR  OF DCLACTIAST TO MS-ADP-NO      CAT770  
LRM006           DISPLAY 'FETCHED ' CLIENT-NBR OF DCLACTIAST                    
LRM006             ' ' SECURITY-ADP-NBR OF DCLACTIAST                           
LRM006           MOVE ACAT-CONTROL-NBR OF DCLACTIAST TO                         
LRM006                                   SORT-KEY-ACAT-CTL-NBR                  
LRM006           PERFORM 4200-GET-VTRNFR THRU 4200-EXIT                         
LRM006           IF W-TRANSFER-FND-SW = 'Y'                                     
LRM006           AND (STTS-CD OF DCLVTRNFR NOT = '140' AND '600')               
LRM006           AND B1-ACAT-DELIVER-NTW-LVL4-FUND(W-SUB1) = '0'                
LRM006              PERFORM 4310-INSERT-VRSDACC                                 
LRM006              MOVE 'HELD IN LEVEL 4 AT FUND'                              
LRM006                                    TO SORT-AT-ASST-COMMENT               
LRM006              PERFORM 4320-INSERT-VRSDSEC                                 
LRM006           END-IF                                                         
LRM006           PERFORM 3520-DELETE-ACTIAST-ROW                                
LRM006           MOVE +0 TO SQLCODE                                             
LRM006        ELSE                                                              
LRM006        IF SQLCODE = +100                                                 
LRM006            CONTINUE                                                      
LRM006        ELSE                                                              
LRM006           DISPLAY '** CAT770 ABENDED: SQL AT1 FETCH '            CAT770  
LRM006           MOVE SQLCODE      TO W-DB2-SQLCODE                             
LRM006           DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                             
LRM006           PERFORM  8500-SQL-ERROR THRU 8500-EXIT                         
LRM006           MOVE SQLCODE TO W-DB2-SQLCODE                                  
LRM006           DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                             
LRM006        END-IF END-IF                                                     
LRM006     END-PERFORM.                                                         
LRM006                                                                          
LRM006     EXEC SQL                                                             
LRM006        CLOSE NSCC_AT1_CRSR                                               
LRM006     END-EXEC                                                             
LRM006                                                                          
LRM006     IF SQLCODE NOT = +0                                                  
LRM006        DISPLAY '** CAT770 ABENDED: SQL AT1 CURSOR CLOSE - CLT='  CAT770  
LRM006                CLIENT-NBR OF DCLACTIAST                          CAT770  
LRM006        MOVE SQLCODE      TO W-DB2-SQLCODE                                
LRM006        DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                                
LRM006        PERFORM  8500-SQL-ERROR THRU 8500-EXIT                            
LRM006     END-IF.                                                              
LRM006                                                                          
LRM006 3500-EXIT.    EXIT.                                              CAT770  
     *                                                                  CAT770  
LRM006 3520-DELETE-ACTIAST-ROW.                                                 
LRM006     EXEC SQL DELETE                                                      
LRM006         FROM  ACTIAST                                                    
LRM006        WHERE  CLIENT_NBR        = :DCLACTIAST.CLIENT-NBR                 
LRM006          AND  SECURITY_ADP_NBR  = :DCLACTIAST.SECURITY-ADP-NBR           
LRM006          AND  ACAT_CONTROL_NBR  = :DCLACTIAST.ACAT-CONTROL-NBR           
LRM006     END-EXEC.                                                            
LRM006     IF SQLCODE NOT = +0                                                  
LRM006        DISPLAY '** CAT770 ABENDED: SQL ACTIAST DELETE - CLT='    CAT770  
LRM006                CLIENT-NBR OF DCLACTIAST                          CAT770  
LRM006        MOVE SQLCODE TO W-DB2-SQLCODE                                     
LRM006        DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                                
LRM006        PERFORM 8500-SQL-ERROR                                    CAT770  
LRM006     END-IF.                                                              
LRM006     ADD 1 TO W-ACTIAST-DLET-COUNT.                                       
      /                                                                         
       4000-FORMAT-SORT.                                                        
                                                                                
           MOVE SPACES                   TO SORT-RECORD                         
                                                                                
           SET W-BROKER-NOT-FOUND TO TRUE                                       
           MOVE ' ' TO B1-ACAT-MF-RCVR-ADJ-RPT-CURR                             
           PERFORM VARYING W-SUB1 FROM 1 BY 1                                   
                   UNTIL W-SUB1 > 500                                           
                   OR W-BROKER-FOUND-ON-B1                                      
                IF B1-BKR-CLR-NO     (W-SUB1) = INFILE-DIST-PARTICIPANT         
                   MOVE B1-CLT-NBR   (W-SUB1)                                   
                                       TO SORT-KEY-CLIENT-NBR                   
                   MOVE W-SUB1 TO W-SUB1-SAVE                                   
                   SET W-BROKER-FOUND-ON-B1 TO TRUE                             
                   MOVE INFILE-DIST-PARTICIPANT TO W-PREV-BROKER-NBR            
                   MOVE SORT-KEY-CLIENT-NBR     TO W-PREV-CLIENT-NBR            
                   MOVE B1-ACAT-MF-RCVR-ADJ-RPT (W-SUB1)                        
                     TO B1-ACAT-MF-RCVR-ADJ-RPT-CURR                            
                END-IF                                                          
           END-PERFORM                                                          
                                                                                
           IF  W-BROKER-FOUND-ON-B1                                             
               CONTINUE                                                         
           ELSE                                                                 
               GO TO 4000-EXIT                                                  
           END-IF                                                               
                                                                                
           MOVE INFILE-AT-ACAT-CTL-NBR                                          
                                       TO SORT-KEY-ACAT-CTL-NBR                 
           MOVE INFILE-AT-ASSET-SEQ-NBR                                         
                                       TO SORT-KEY-ASSET-SEQ-NBR                
           MOVE INFILE-AT-TFR-TYPE                                              
                                       TO SORT-KEY-TFR-TYPE                     
                                                                                
           MOVE '20'                   TO SORT-KEY-REC-TYPE                     
                                                                                
           PERFORM 4100-GETMSD     THRU 4100-EXIT                               
                                                                                
           PERFORM 4200-GET-VTRNFR THRU 4200-EXIT                               
                                                                                
TEST       DISPLAY 'HAVE CNTL ' INFILE-AT-ACAT-CTL-NBR                          
--->       MOVE ACCT-DLVR-NBR    OF DCLVTRNFR TO SORT-TI-ACCT-DLVR-NBR          
--->       MOVE ACCT-RCV-NBR     OF DCLVTRNFR TO SORT-TI-ACCT-RCV-NBR           
--->       MOVE MS-ADP-NO                     TO SORT-MS-ADP-NO                 
--->       MOVE INFILE-CYCLE                  TO SORT-CYCLE                     
--->       MOVE INFILE-DIST-PARTICIPANT  TO SORT-DIST-PARTICIPANT               
                                                                                
           MOVE INFILE-AT-DATA           TO SORT-AT-DATA                        
                                                                                
TEST       DISPLAY 'DST=' INFILE-DIST-PARTICIPANT                               
                        ' DEL=' INFILE-AT-DEL-NBR                               
           IF  INFILE-DIST-PARTICIPANT = INFILE-AT-DEL-NBR                      
           AND W-BROKER-FOUND-ON-B1                                             
           AND (B1-ACAT-MF-RCVR-ADJ (W-SUB1-SAVE) = '1' OR '3')                 
LRM005*****AND (INFILE-AT-ASSET-PRC-CATG = 'MFNM' OR 'MFMM')                    
LRM005     AND INFILE-AT-SUB-PART-NBR   = INFILE-AT-RCV-NBR                     
LRM005     AND INFILE-AT-TRAN-TYPE      = 'D'                                   
               ADD 1                    TO W-DELIVERER-CNT                      
               PERFORM 4300-ADD-SEC-TO-RESIDUAL-EXCL THRU 4300-EXIT             
           ELSE                                                                 
           IF  INFILE-DIST-PARTICIPANT NOT = INFILE-AT-DEL-NBR                  
           AND (B1-ACAT-MF-RCVR-ADJ (W-SUB1-SAVE) = '2' OR '3')                 
LRM001     AND  B1-ACAT-MF-AUTO-DEL (W-SUB1-SAVE) NOT = '1'                     
DJ0003     AND (INFILE-AT-ASSET-PRC-CATG = 'MFNM' OR 'MFMM')                    
               ADD 1                    TO W-RECEIVER-CNT                       
               PERFORM 4400-ADD-SEC-TO-RESTRICTED    THRU 4400-EXIT             
           END-IF.                                                              
                                                                                
           IF  B1-ACAT-MF-RCVR-ADJ-RPT-CURR = '1'                               
           AND ((INFILE-AT-ASSET-PRC-CATG = 'MFNM' OR 'MFMM')                   
LRM005     OR (INFILE-AT-TRAN-TYPE      = 'D'                                   
LRM005     AND INFILE-AT-SUB-PART-NBR   = INFILE-AT-RCV-NBR))                   
               RELEASE SORT-RECORD                                              
               ADD 1                    TO W-RELEASE-CNT                        
           END-IF                                                               
                                                                                
DJ0003* ADD UNDELIVERABLE FULL DELIVERY ASSETS (STL-LOC 30)                     
DJ0003* TO VRSTSEC TO BLOCK RCR                                                 
DJ0003     IF  INFILE-DIST-PARTICIPANT = INFILE-AT-DEL-NBR                      
DJ0003     AND (INFILE-AT-STL-LOC = '30')                                       
DJ0003         PERFORM 4400-ADD-SEC-TO-RESTRICTED    THRU 4400-EXIT             
DJ0003     END-IF                                                               
                                                                                
DJ0003     IF (INFILE-AT-STL-LOC = '30')                                        
DJ0003         ADD 1 TO W-UNDELIVERABLE-CNT                                     
DJ0003     ELSE                                                                 
               ADD 1 TO W-MF-DELETE-FOUND-CNT                                   
DJ0003     END-IF                                                               
           .                                                                    
       4000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4100-GETMSD.                                                             
                                                                                
DJ0001     MOVE LOW-VALUES               TO GETMSD-SEARCH-KEY-AREA              
           MOVE INFILE-AT-SEC-ID         TO GETMSD-SEARCH-KEY                   
           MOVE ALL ZERO                 TO GETMSD-WI-CODE                      
           IF  INFILE-AT-WHN-ISS-IND = 'W'                                      
               MOVE '1'                  TO GETMSD-WI-CODE                      
           END-IF                                                               
                                                                                
DJ0001     MOVE SORT-KEY-CLIENT-NUM      TO GETMSD-CLIENT-PL2                   
           CALL GETMSDC               USING MASTER-SECURITY-RECORD              
                                                                                
           IF  GETMSD-RETURN-VALID                                              
               ADD 1 TO W-MSD-FOUND-CNT                                         
           ELSE                                                                 
               ADD 1 TO W-MSD-NOT-FOUND-CNT                                     
               DISPLAY 'INP=' W-INFILE-CNT                                      
                      ' CLT=' SORT-KEY-CLIENT-NBR                               
                      ' CTL=' SORT-KEY-ACAT-CTL-NBR                             
                      ' SEC=' INFILE-AT-SEC-ID                                  
                      ' MSD NOTFND'                                             
           END-IF                                                               
           .                                                                    
       4100-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4200-GET-VTRNFR.                                                         
                                                                                
           INITIALIZE DCLVTRNFR                                                 
                                                                                
           MOVE SORT-KEY-CLIENT-NBR    TO CLIENT-NBR   OF DCLVTRNFR             
           MOVE SORT-KEY-ACAT-CTL-NBR  TO ACAT-CONTROL-NBR OF DCLVTRNFR         
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,ACAT_CONTROL_NBR                                            
                   ,SBMTG_PRTCP_NBR                                             
                   ,DLVR_NBR                                                    
                   ,ACCT_DLVR_NBR                                               
                   ,RCV_NBR                                                     
                   ,ACCT_RCV_NBR                                                
                   ,BRANCH_CD                                                   
                   ,ACCT_CD                                                     
                   ,RR_CD                                                       
LRM006             ,STTS_CD                                                     
              INTO                                                              
                    :DCLVTRNFR.CLIENT-NBR                                       
                   ,:DCLVTRNFR.ACAT-CONTROL-NBR                                 
                   ,:DCLVTRNFR.SBMTG-PRTCP-NBR                                  
                   ,:DCLVTRNFR.DLVR-NBR                                         
                   ,:DCLVTRNFR.ACCT-DLVR-NBR                                    
                   ,:DCLVTRNFR.RCV-NBR                                          
                   ,:DCLVTRNFR.ACCT-RCV-NBR                                     
                   ,:DCLVTRNFR.BRANCH-CD                                        
                   ,:DCLVTRNFR.ACCT-CD                                          
                   ,:DCLVTRNFR.RR-CD                                            
LRM006             ,:DCLVTRNFR.STTS-CD                                          
               FROM  VTRNFR                                                     
               WHERE CLIENT_NBR       = :DCLVTRNFR.CLIENT-NBR                   
                 AND ACAT_CONTROL_NBR = :DCLVTRNFR.ACAT-CONTROL-NBR             
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNFR-FOUND-CNT                                      
               MOVE 'Y'                TO W-TRANSFER-FND-SW                     
TEST           DISPLAY 'FND VTRNFR ' SORT-KEY-CLIENT-NBR                        
TEST                            ' '  SORT-KEY-ACAT-CTL-NBR                      
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-FOUND-CNT                                  
               MOVE 'N'                TO W-TRANSFER-FND-SW                     
               DISPLAY 'INP=' W-INFILE-CNT                                      
                       ' CLT=' SORT-KEY-CLIENT-NBR                              
                       ' CTL=' SORT-KEY-ACAT-CTL-NBR                            
                       ' VTRNFR NOTFND'                                         
                       ' SQLCODE = ' W-DB2-SQLCODE                              
           END-IF                                                               
           .                                                                    
       4200-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4300-ADD-SEC-TO-RESIDUAL-EXCL.                                           
                                                                                
           IF  W-TRANSFER-FND-SW = 'Y'                                          
               IF  GETMSD-RETURN-VALID                                          
                   PERFORM 4310-INSERT-VRSDACC                                  
                   PERFORM 4320-INSERT-VRSDSEC                                  
               END-IF                                                           
           END-IF                                                               
           .                                                                    
       4300-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4310-INSERT-VRSDACC.                                                     
                                                                                
           INITIALIZE DCLVRSDACC                                                
           MOVE SORT-KEY-CLIENT-NBR TO CLIENT-NBR         OF DCLVRSDACC         
           MOVE ACCT-CD   OF DCLVTRNFR                                          
                                    TO ACCT-CD            OF DCLVRSDACC         
           MOVE BRANCH-CD OF DCLVTRNFR                                          
                                    TO BRANCH-CD          OF DCLVRSDACC         
           MOVE ' '                 TO BRANCH-ORGNL-CD    OF DCLVRSDACC         
           MOVE ' '                 TO ACCT-ORGNL-CD      OF DCLVRSDACC         
           MOVE RR-CD     OF DCLVTRNFR                                          
                                    TO RR-CD              OF DCLVRSDACC         
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP          OF DCLVRSDACC         
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP         OF DCLVRSDACC         
           MOVE ' '                 TO CICS-TERM-ID-CD    OF DCLVRSDACC         
           MOVE 'CAT770'            TO PRGM-NM            OF DCLVRSDACC         
                                                                                
           EXEC SQL                                                             
              INSERT INTO VRSDACC                                               
                (  CLIENT_NBR                                                   
                  ,ACCT_CD                                                      
                  ,BRANCH_CD                                                    
                  ,BRANCH_ORGNL_CD                                              
                  ,ACCT_ORGNL_CD                                                
                  ,RR_CD                                                        
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,CICS_TERM_ID_CD                                              
                  ,PRGM_NM )                                                    
              VALUES                                                            
                ( :DCLVRSDACC.CLIENT-NBR                                        
                 ,:DCLVRSDACC.ACCT-CD                                           
                 ,:DCLVRSDACC.BRANCH-CD                                         
                 ,:DCLVRSDACC.BRANCH-ORGNL-CD                                   
                 ,:DCLVRSDACC.ACCT-ORGNL-CD                                     
                 ,:DCLVRSDACC.RR-CD                                             
                 ,:DCLVRSDACC.CRT-TMSTP                                         
                 ,:DCLVRSDACC.UPDT-TMSTP                                        
                 ,:DCLVRSDACC.CICS-TERM-ID-CD                                   
                 ,:DCLVRSDACC.PRGM-NM )                                         
           END-EXEC.                                                            
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           IF  SQLCODE = 0                                                      
               ADD 1 TO W-VRSDACC-INSERT-CNT                                    
               DISPLAY 'CYCLE=' SORT-CYCLE                                      
                    ' ' SORT-KEY-ACAT-CTL-NBR                                   
                    ' ' SORT-KEY-ASSET-SEQ-NBR                                  
                    ' ' CLIENT-NBR         OF DCLVRSDACC                        
                    ' ' BRANCH-CD          OF DCLVRSDACC                        
                    ' ' ACCT-CD            OF DCLVRSDACC                        
                      ' VRSDACC INSERTED'                                       
           ELSE                                                                 
               ADD 1 TO W-VRSDACC-NOT-INSERT-CNT                                
               DISPLAY 'CYCLE=' SORT-CYCLE                                      
                    ' ' SORT-KEY-ACAT-CTL-NBR                                   
                    ' ' SORT-KEY-ASSET-SEQ-NBR                                  
                    ' ' CLIENT-NBR         OF DCLVRSDACC                        
                    ' ' BRANCH-CD          OF DCLVRSDACC                        
                    ' ' ACCT-CD            OF DCLVRSDACC                        
                      ' VRSDACC NOT INSERTED'                                   
                      ' SQLCODE = ' W-DB2-SQLCODE                               
           END-IF                                                               
           .                                                                    
       4310-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4320-INSERT-VRSDSEC.                                                     
                                                                                
           INITIALIZE DCLVRSDSEC                                                
           MOVE SORT-KEY-CLIENT-NBR TO CLIENT-NBR        OF DCLVRSDSEC          
           MOVE ACCT-CD   OF DCLVTRNFR                                          
                                    TO ACCT-CD           OF DCLVRSDSEC          
           MOVE BRANCH-CD OF DCLVTRNFR                                          
                                    TO BRANCH-CD         OF DCLVRSDSEC          
           MOVE SORT-AT-SEC-ID      TO ISIN-SEC-ISSUE-CD OF DCLVRSDSEC          
           MOVE MS-ADP-NO           TO SECURITY-ADP-NBR  OF DCLVRSDSEC          
           MOVE 'CAT770'            TO PRGM-NM           OF DCLVRSDSEC          
           MOVE ' '                 TO CICS-TERM-ID-CD   OF DCLVRSDSEC          
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLVRSDSEC          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLVRSDSEC          
LRM006     MOVE SORT-AT-ASST-COMMENT TO COMMENT-TXT      OF DCLVRSDSEC          
                                                                                
           EXEC SQL                                                             
              INSERT INTO VRSDSEC                                               
                (  CLIENT_NBR                                                   
                  ,ACCT_CD                                                      
                  ,BRANCH_CD                                                    
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,SECURITY_ADP_NBR                                             
                  ,PRGM_NM                                                      
                  ,CICS_TERM_ID_CD                                              
                  ,COMMENT_TXT                                                  
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP )                                                 
              VALUES                                                            
                ( :DCLVRSDSEC.CLIENT-NBR                                        
                 ,:DCLVRSDSEC.ACCT-CD                                           
                 ,:DCLVRSDSEC.BRANCH-CD                                         
                 ,:DCLVRSDSEC.ISIN-SEC-ISSUE-CD                                 
                 ,:DCLVRSDSEC.SECURITY-ADP-NBR                                  
                 ,:DCLVRSDSEC.PRGM-NM                                           
                 ,:DCLVRSDSEC.CICS-TERM-ID-CD                                   
LRM006           ,:DCLVRSDSEC.COMMENT-TXT                                       
                 ,:DCLVRSDSEC.CRT-TMSTP                                         
                 ,:DCLVRSDSEC.UPDT-TMSTP )                                      
           END-EXEC.                                                            
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           IF  SQLCODE = 0                                                      
               ADD 1 TO W-VRSDSEC-INSERT-CNT                                    
               DISPLAY 'CYCLE=' SORT-CYCLE                                      
                    ' ' SORT-KEY-ACAT-CTL-NBR                                   
                    ' ' SORT-KEY-ASSET-SEQ-NBR                                  
                    ' ' CLIENT-NBR         OF DCLVRSDSEC                        
                    ' ' BRANCH-CD          OF DCLVRSDACC                        
                    ' ' ACCT-CD            OF DCLVRSDACC                        
                    ' ' ISIN-SEC-ISSUE-CD  OF DCLVRSDSEC                        
                    ' ' SECURITY-ADP-NBR   OF DCLVRSDSEC                        
                      ' VRSDSEC INSERTED'                                       
           ELSE                                                                 
               ADD 1 TO W-VRSDSEC-NOT-INSERT-CNT                                
               DISPLAY 'CYCLE=' SORT-CYCLE                                      
                    ' ' SORT-KEY-ACAT-CTL-NBR                                   
                    ' ' SORT-KEY-ASSET-SEQ-NBR                                  
                    ' ' CLIENT-NBR         OF DCLVRSDSEC                        
                    ' ' BRANCH-CD          OF DCLVRSDACC                        
                    ' ' ACCT-CD            OF DCLVRSDACC                        
                    ' ' ISIN-SEC-ISSUE-CD  OF DCLVRSDSEC                        
                    ' ' SECURITY-ADP-NBR   OF DCLVRSDSEC                        
                      ' VRSDSEC NOT INSERTED'                                   
                      ' SQLCODE = ' W-DB2-SQLCODE                               
               IF  SQLCODE  =  -803                                             
                   ADD 1 TO W-VRSDSEC-DUPE-CNT                                  
               ELSE                                                             
                   IF  SQLCODE  =  -530                                         
                       ADD 1 TO W-VRSDSEC-FOREIGN-KY-CNT                        
                   END-IF                                                       
               END-IF                                                           
           END-IF                                                               
           .                                                                    
       4320-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4400-ADD-SEC-TO-RESTRICTED.                                              
                                                                                
           IF  W-TRANSFER-FND-SW = 'Y'                                          
               IF  GETMSD-RETURN-VALID                                          
                   PERFORM 4410-GET-VRSTSEC                                     
                   IF  W-VRSTSEC-FND-SW = 'Y'                                   
                       PERFORM 4420-UPDATE-VRSTSEC THRU 4420-EXIT               
                   ELSE                                                         
                       PERFORM 4430-INSERT-VRSTSEC THRU 4430-EXIT               
                   END-IF                                                       
               END-IF                                                           
           END-IF                                                               
           .                                                                    
       4400-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4410-GET-VRSTSEC.                                                        
                                                                                
           INITIALIZE DCLVRSTSEC                                                
                                                                                
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
              WHERE CLIENT_NBR       = :SORT-KEY-CLIENT-NBR                     
DJ0004         AND ISIN_SEC_ISSUE_CD = :MS-ADP-NO                               
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VRSTSEC-FOUND-CNT                                     
               MOVE 'Y'                TO W-VRSTSEC-FND-SW                      
               DISPLAY 'CYCLE=' SORT-CYCLE                                      
                    ' ' SORT-KEY-ACAT-CTL-NBR                                   
                    ' ' SORT-KEY-ASSET-SEQ-NBR                                  
                    ' ' CLIENT-NBR         OF DCLVRSTSEC                        
                    ' ' ISIN-SEC-ISSUE-CD  OF DCLVRSTSEC                        
                    ' ' TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC                        
                    ' ' SECURITY-ADP-NBR   OF DCLVRSTSEC                        
                      ' VRSTSEC FOUND   '                                       
           ELSE                                                                 
               ADD 1 TO W-VRSTSEC-NOT-FOUND-CNT                                 
               MOVE 'N'                TO W-VRSTSEC-FND-SW                      
               DISPLAY 'CYCLE=' SORT-CYCLE                                      
                    ' ' SORT-KEY-ACAT-CTL-NBR                                   
                    ' ' SORT-KEY-ASSET-SEQ-NBR                                  
                    ' ' SORT-KEY-CLIENT-NBR                                     
                    ' ' SORT-AT-SEC-ID                                          
                      ' VRSTSEC NOTFND'                                         
                      ' SQLCODE = ' W-DB2-SQLCODE                               
           END-IF                                                               
           .                                                                    
       4410-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4420-UPDATE-VRSTSEC.                                                     
                                                                                
           IF INFILE-DIST-PARTICIPANT = INFILE-AT-DEL-NBR                       
              IF TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC = 'R'                         
                 MOVE 'B'       TO TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC             
              END-IF                                                            
           ELSE                                                                 
              IF TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC = 'D'                         
DJ0003        AND (INFILE-AT-STL-LOC NOT = '30')                                
                 MOVE 'B'       TO TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC             
              END-IF                                                            
           END-IF                                                               
                                                                                
           MOVE 'CAT770'            TO PRGM-NM            OF DCLVRSTSEC         
           MOVE ' '                 TO CICS-TERM-ID-CD    OF DCLVRSTSEC         
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP         OF DCLVRSTSEC         
                                                                                
           EXEC SQL                                                             
               UPDATE VRSTSEC                                                   
                SET TRNFR_BRKR_TYPE_CD = :DCLVRSTSEC.TRNFR-BRKR-TYPE-CD         
                   ,PRGM_NM            = :DCLVRSTSEC.PRGM-NM                    
                   ,CICS_TERM_ID_CD    = :DCLVRSTSEC.CICS-TERM-ID-CD            
                   ,UPDT_TMSTP         = :DCLVRSTSEC.UPDT-TMSTP                 
               WHERE CLIENT_NBR        = :SORT-KEY-CLIENT-NBR                   
DJ0004         AND ISIN_SEC_ISSUE_CD = :MS-ADP-NO                               
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           IF  SQLCODE = 0                                                      
               ADD 1 TO W-VRSTSEC-UPDATE-CNT                                    
               DISPLAY 'CYCLE=' SORT-CYCLE                                      
                    ' ' SORT-KEY-ACAT-CTL-NBR                                   
                    ' ' SORT-KEY-ASSET-SEQ-NBR                                  
                    ' ' CLIENT-NBR         OF DCLVRSTSEC                        
                    ' ' ISIN-SEC-ISSUE-CD  OF DCLVRSTSEC                        
                    ' ' TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC                        
                    ' ' SECURITY-ADP-NBR   OF DCLVRSTSEC                        
                      ' VRSTSEC UPDATED '                                       
           ELSE                                                                 
               ADD 1 TO W-VRSTSEC-NOT-UPDATE-CNT                                
               DISPLAY 'CYCLE=' SORT-CYCLE                                      
                    ' ' SORT-KEY-ACAT-CTL-NBR                                   
                    ' ' SORT-KEY-ASSET-SEQ-NBR                                  
                    ' ' CLIENT-NBR         OF DCLVRSTSEC                        
                    ' ' ISIN-SEC-ISSUE-CD  OF DCLVRSTSEC                        
                    ' ' TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC                        
                    ' ' SECURITY-ADP-NBR   OF DCLVRSTSEC                        
                      ' VRSTSEC NOT UPDATED '                                   
                      ' SQLCODE = ' W-DB2-SQLCODE                               
           END-IF                                                               
           .                                                                    
       4420-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       4430-INSERT-VRSTSEC.                                                     
                                                                                
           INITIALIZE DCLVRSTSEC                                                
           MOVE SORT-KEY-CLIENT-NBR TO CLIENT-NBR         OF DCLVRSTSEC         
DJ0004     MOVE MS-ADP-NO           TO ISIN-SEC-ISSUE-CD  OF DCLVRSTSEC         
           MOVE 'N'                 TO TRNFR-MEMO-IND     OF DCLVRSTSEC         
           IF  INFILE-DIST-PARTICIPANT = INFILE-AT-DEL-NBR                      
               MOVE 'D'             TO TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC         
           ELSE                                                                 
               MOVE 'R'             TO TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC         
           END-IF                                                               
           MOVE 'MF RECEIVER ADJ'   TO RSTRD-MSG-TXT      OF DCLVRSTSEC         
           MOVE 'CAT770'            TO PRGM-NM            OF DCLVRSTSEC         
           MOVE ' '                 TO CICS-TERM-ID-CD    OF DCLVRSTSEC         
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP          OF DCLVRSTSEC         
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP         OF DCLVRSTSEC         
           MOVE MS-ADP-NO           TO SECURITY-ADP-NBR   OF DCLVRSTSEC         
                                                                                
DJ0003     IF INFILE-AT-STL-LOC = '30'                                          
DJ0003         MOVE 'D'             TO TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC         
DJ0003         MOVE 'SETTLE LOC 30 UNDELIVERABLE'                               
DJ0003                              TO RSTRD-MSG-TXT      OF DCLVRSTSEC         
DJ0003         DISPLAY 'INP=' W-INFILE-CNT                                      
DJ0003                ' CLT=' SORT-KEY-CLIENT-NBR                               
DJ0003                ' CTL=' SORT-KEY-ACAT-CTL-NBR                             
DJ0003                ' SEC=' INFILE-AT-SEC-ID                                  
DJ0003                ' ADP=' MS-ADP-NO                                         
DJ0003                ' UNDELIVERABLE'                                          
DJ0003                ' DEL=' INFILE-AT-DEL-NBR                                 
DJ0003                ' LOC=' INFILE-AT-STL-LOC                                 
DJ0003                ' TFR=' INFILE-AT-TFR-TYPE                                
DJ0003     END-IF                                                               
                                                                                
           EXEC SQL                                                             
              INSERT INTO VRSTSEC                                               
                (  CLIENT_NBR                                                   
                  ,ISIN_SEC_ISSUE_CD                                            
                  ,TRNFR_MEMO_IND                                               
                  ,TRNFR_BRKR_TYPE_CD                                           
                  ,RSTRD_MSG_TXT                                                
                  ,PRGM_NM                                                      
                  ,CICS_TERM_ID_CD                                              
                  ,CRT_TMSTP                                                    
                  ,UPDT_TMSTP                                                   
                  ,SECURITY_ADP_NBR )                                           
              VALUES                                                            
                ( :DCLVRSTSEC.CLIENT-NBR                                        
                 ,:DCLVRSTSEC.ISIN-SEC-ISSUE-CD                                 
                 ,:DCLVRSTSEC.TRNFR-MEMO-IND                                    
                 ,:DCLVRSTSEC.TRNFR-BRKR-TYPE-CD                                
                 ,:DCLVRSTSEC.RSTRD-MSG-TXT                                     
                 ,:DCLVRSTSEC.PRGM-NM                                           
                 ,:DCLVRSTSEC.CICS-TERM-ID-CD                                   
                 ,:DCLVRSTSEC.CRT-TMSTP                                         
                 ,:DCLVRSTSEC.UPDT-TMSTP                                        
                 ,:DCLVRSTSEC.SECURITY-ADP-NBR )                                
           END-EXEC.                                                            
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           IF  SQLCODE = 0                                                      
               ADD 1 TO W-VRSTSEC-INSERT-CNT                                    
               DISPLAY 'CYCLE=' SORT-CYCLE                                      
                    ' ' SORT-KEY-ACAT-CTL-NBR                                   
                    ' ' SORT-KEY-ASSET-SEQ-NBR                                  
                    ' ' CLIENT-NBR         OF DCLVRSTSEC                        
                    ' ' ISIN-SEC-ISSUE-CD  OF DCLVRSTSEC                        
                    ' ' TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC                        
                    ' ' SECURITY-ADP-NBR   OF DCLVRSTSEC                        
                      ' VRSTSEC INSERTED'                                       
           ELSE                                                                 
               ADD 1 TO W-VRSTSEC-NOT-INSERT-CNT                                
               DISPLAY 'CYCLE=' SORT-CYCLE                                      
                    ' ' SORT-KEY-ACAT-CTL-NBR                                   
                    ' ' SORT-KEY-ASSET-SEQ-NBR                                  
                    ' ' CLIENT-NBR         OF DCLVRSTSEC                        
                    ' ' ISIN-SEC-ISSUE-CD  OF DCLVRSTSEC                        
                    ' ' TRNFR-BRKR-TYPE-CD OF DCLVRSTSEC                        
                    ' ' SECURITY-ADP-NBR   OF DCLVRSTSEC                        
                      ' VRSTSEC NOT INSERTED'                                   
                      ' SQLCODE = ' W-DB2-SQLCODE                               
           END-IF                                                               
           .                                                                    
       4430-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5000-SORT-OUTPUT.                                                        
                                                                                
           DISPLAY 'CAT770: PERFORMING 5000-SORT-OUTPUT'                        
                                                                                
           PERFORM 5500-RETURN-SORT THRU 5500-EXIT                              
                                                                                
           PERFORM UNTIL END-OF-SORT                                            
                                                                                
               IF  B1-PRT-SUB   < W-SORT-KEY-CLIENT-NBR-N                       
                   PERFORM 6000-CLT-BREAK     THRU 6000-EXIT                    
               END-IF                                                           
                                                                                
               PERFORM 7000-WRITE-REPORT  THRU 7000-EXIT                        
                                                                                
               IF  END-OF-SORT                                                  
                   DISPLAY 'END-OF-SORT ALREADY'                                
               ELSE                                                             
                   PERFORM 5500-RETURN-SORT   THRU 5500-EXIT                    
               END-IF                                                           
                                                                                
           END-PERFORM                                                          
                                                                                
           DISPLAY 'PERFORMING LAST 6000-CLT-BREAK'                             
           PERFORM 6000-CLT-BREAK     THRU 6000-EXIT                            
           .                                                                    
       5000-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       5500-RETURN-SORT.                                                        
                                                                                
           RETURN SORT-FILE                                                     
               AT END                                                           
                     MOVE 500 TO W-SORT-KEY-CLIENT-NBR-N                        
                     SET END-OF-SORT TO TRUE                                    
                     DISPLAY 'CAT770: SORT-EOF '                                
                                         ' RET=' W-RETURN-CNT                   
           END-RETURN                                                           
                                                                                
           IF  END-OF-SORT                                                      
               CONTINUE                                                         
           ELSE                                                                 
               ADD  1                        TO W-RETURN-CNT                    
               MOVE SORT-KEY                 TO W-SORT-KEY                      
           END-IF                                                               
           .                                                                    
       5500-EXIT.                                                               
           EXIT.                                                                
      /                                                                         
       6000-CLT-BREAK.                                                          
           DISPLAY '6000-CLT-BREAK'                                             
               ' SORT-CLIENT-NBR= ' W-SORT-KEY-CLIENT-NBR-N                     
               ' B1-PRT-SUB= ' B1-PRT-SUB.                                      
                                                                                
       6000-LOOP.                                                               
                                                                                
           IF  B1-PRT-SUB < W-SORT-KEY-CLIENT-NBR-N                             
               IF   B1-ACAT-STATUS (B1-PRT-SUB) = 'A'                           
                 IF  (B1-PRINT            (B1-PRT-SUB) NOT = '1')               
                 AND (B1-ACAT-MF-RCVR-ADJ-RPT (B1-PRT-SUB) = '1')               
                    PERFORM 7100-WRITE-NO-ACT THRU 7100-EXIT                    
                 END-IF                                                         
               END-IF                                                           
           ELSE                                                                 
               GO TO 6000-EXIT                                                  
           END-IF                                                               
                                                                                
           IF  B1-PRT-SUB < 500                                                 
               ADD 1 TO B1-PRT-SUB                                              
               MOVE 0                    TO W-PAGE-CNT                          
               MOVE 60                   TO W-LINE-CNT                          
               MOVE 0                    TO W-CLT-CNT                           
               GO TO 6000-LOOP                                                  
           END-IF                                                               
           .                                                                    
       6000-EXIT. EXIT.                                                         
      /                                                                         
       7000-WRITE-REPORT.                                                       
                                                                                
           MOVE '1' TO B1-PRINT (B1-PRT-SUB)                                    
                                                                                
           IF  (W-SORT-KEY-CLIENT-NBR-N   NOT = W-PREV-CLIENT-NBR)              
                MOVE 60 TO W-LINE-CNT                                           
           END-IF                                                               
                                                                                
           MOVE SORT-KEY-CLIENT-NBR        TO W-PREV-CLIENT-NBR                 
           MOVE SORT-KEY-ACAT-CTL-NBR      TO W-PREV-CONTROL-NBR                
                                                                                
           INITIALIZE W-DTL1-REC                                                
                      W-DTL2-REC                                                
           MOVE SORT-KEY-ACAT-CTL-NBR       TO W-DTL1-CONTROL-NBR               
                                                                                
           IF  SORT-DIST-PARTICIPANT = SORT-AT-RCV-NBR                          
               MOVE SORT-TI-ACCT-RCV-NBR    TO W-DTL1-ACCT-NBR                  
           ELSE                                                                 
               MOVE SORT-TI-ACCT-DLVR-NBR   TO W-DTL1-ACCT-NBR                  
           END-IF                                                               
                                                                                
           MOVE SORT-AT-RCV-NBR             TO W-DTL1-RCV-NBR                   
           MOVE SORT-AT-DEL-NBR             TO W-DTL1-DEL-NBR                   
           MOVE SORT-AT-SEC-CNTRY-CD        TO W-DTL1-SEC-CNTRY-CD              
           MOVE SORT-AT-SEC-ID              TO W-DTL1-SEC-ID                    
           MOVE SORT-AT-SEC-CHKDGT          TO W-DTL1-SEC-CHKDGT                
           MOVE SORT-AT-ASSET-DESC          TO W-DTL1-DESC1                     
           MOVE SORT-AT-POS-CD              TO W-DTL1-LONG-SHORT                
                                                                                
           PERFORM 7200-FORMAT-QTY THRU 7200-EXIT                               
           MOVE W-QTY-N                     TO W-DTL1-QTY                       
                                                                                
           PERFORM 7300-FORMAT-AMT THRU 7300-EXIT                               
           MOVE W-QTY-N                     TO W-DTL1-AMT                       
                                                                                
           MOVE SORT-CYCLE                  TO W-DTL1-CYCLE                     
           MOVE SORT-AT-CASH-MRGN-SHTCD     TO W-DTL1-CASH-MRGN-SHTCD           
                                                                                
           MOVE W-DTL1-REC               TO W-REPT-LINE                         
           PERFORM 7700-WRITE-LINE THRU 7700-EXIT                               
           ADD 2                         TO W-LINE-CNT                          
                                                                                
           IF  SORT-AT-ASSET-DESC(31:30) > ' '                                  
               MOVE SORT-AT-ASSET-DESC(31:30) TO W-DTL2-DESC2                   
               MOVE W-DTL2-REC           TO W-REPT-LINE                         
               PERFORM 7700-WRITE-LINE THRU 7700-EXIT                           
               ADD 1                     TO W-LINE-CNT                          
               IF  SORT-AT-ASSET-DESC(61:30) > ' '                              
                   MOVE SORT-AT-ASSET-DESC(61:30) TO W-DTL2-DESC2               
                   MOVE W-DTL2-REC           TO W-REPT-LINE                     
                   PERFORM 7700-WRITE-LINE THRU 7700-EXIT                       
                   ADD 1                     TO W-LINE-CNT                      
               END-IF                                                           
           END-IF                                                               
                                                                                
           ADD  1                        TO W-CLT-CNT                           
           .                                                                    
       7000-EXIT. EXIT.                                                         
      /                                                                         
       7100-WRITE-NO-ACT.                                                       
                                                                                
           DISPLAY 'CAT770: '                                                   
                       B1-PRT-SUB                                               
                   ' ' B1-CLT-NAME (B1-PRT-SUB)                                 
                   ' NO MUTUAL FUND ADJUSTMENTS TODAY'                          
           MOVE B1-PRT-SUB               TO W-HDR1-CLT                          
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                        
                                         TO W-HDR1-CLT-NAME                     
                                                                                
           ADD  1                        TO W-PAGE-CNT                          
           MOVE 3                        TO W-LINE-CNT                          
                                                                                
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE                         
                                                                                
           MOVE B1-PRT-SUB               TO W-HDR1-CLT                          
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                        
                                         TO W-HDR1-CLT-NAME                     
                                                                                
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM                           
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD                           
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY                           
                                                                                
           MOVE W-HDR1-REC               TO REPT-LINE                           
           MOVE B1-PRT-SUB               TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL                            
           WRITE REPT-REC                                                       
                                                                                
           MOVE B1-BKR-CLR-NO (B1-PRT-SUB) TO W-HDR2-BKR                        
           MOVE W-SYS-MM                 TO W-HDR2-MM                           
           MOVE W-SYS-DD                 TO W-HDR2-DD                           
           MOVE W-SYS-YY                 TO W-HDR2-YY                           
           MOVE W-SYS-HH                 TO W-HDR2-HH                           
           MOVE W-SYS-MN                 TO W-HDR2-MN                           
                                                                                
           MOVE W-HDR2-REC               TO REPT-LINE                           
           MOVE B1-PRT-SUB               TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL                            
           WRITE REPT-REC                                                       
                                                                                
           MOVE W-DTLX-REC               TO REPT-LINE                           
           MOVE B1-PRT-SUB               TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL                            
           WRITE REPT-REC                                                       
           .                                                                    
       7100-EXIT. EXIT.                                                         
      /                                                                         
       7200-FORMAT-QTY.                                                         
           MOVE SORT-AT-ASSET-QTY        TO W-QTY-X                             
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
           END-IF                                                               
           MOVE W-INT                    TO W-QTY-INT                           
           MOVE W-DEC                    TO W-QTY-DEC                           
           .                                                                    
       7200-EXIT. EXIT.                                                         
      /                                                                         
       7300-FORMAT-AMT.                                                         
                                                                                
           MOVE SORT-AT-ASSET-AMT        TO W-QTY-X                             
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
           END-IF                                                               
           MOVE W-INT                    TO W-QTY-INT                           
           MOVE W-DEC                    TO W-QTY-DEC                           
           .                                                                    
       7300-EXIT. EXIT.                                                         
      /                                                                         
       7700-WRITE-LINE.                                                         
                                                                                
           IF   W-LINE-CNT > 56                                                 
                PERFORM 7800-WRITE-HDR THRU 7800-EXIT                           
           END-IF                                                               
                                                                                
           MOVE W-REPT-LINE              TO REPT-LINE                           
           MOVE B1-PRT-SUB               TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL                            
           WRITE REPT-REC                                                       
           .                                                                    
       7700-EXIT. EXIT.                                                         
      /                                                                         
       7800-WRITE-HDR.                                                          
                                                                                
           ADD  1                        TO W-PAGE-CNT                          
                                                                                
           MOVE W-PAGE-CNT               TO W-HDR1-PAGE                         
                                                                                
           MOVE B1-PRT-SUB               TO W-HDR1-CLT                          
           MOVE B1-CLT-NAME (B1-PRT-SUB)                                        
                                         TO W-HDR1-CLT-NAME                     
                                                                                
           MOVE W-PROC-DATE-MM           TO W-HDR1-MM                           
           MOVE W-PROC-DATE-DD           TO W-HDR1-DD                           
           MOVE W-PROC-DATE-YY           TO W-HDR1-YY                           
                                                                                
           MOVE W-HDR1-REC               TO REPT-LINE                           
           MOVE B1-PRT-SUB               TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL                            
           WRITE REPT-REC                                                       
                                                                                
           MOVE B1-BKR-CLR-NO (B1-PRT-SUB) TO W-HDR2-BKR                        
           MOVE W-SYS-MM                 TO W-HDR2-MM                           
           MOVE W-SYS-DD                 TO W-HDR2-DD                           
           MOVE W-SYS-YY                 TO W-HDR2-YY                           
           MOVE W-SYS-HH                 TO W-HDR2-HH                           
           MOVE W-SYS-MN                 TO W-HDR2-MN                           
                                                                                
           MOVE W-HDR2-REC               TO REPT-LINE                           
           MOVE B1-PRT-SUB               TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL                            
           WRITE REPT-REC                                                       
                                                                                
           MOVE W-HDR6-REC               TO REPT-LINE                           
           MOVE B1-PRT-SUB               TO REPT-CLT                            
           MOVE LOW-VALUES               TO REPT-FIL                            
           WRITE REPT-REC                                                       
                                                                                
           MOVE 7                        TO W-LINE-CNT                          
           .                                                                    
       7800-EXIT. EXIT.                                                         
      /                                                                         
       8500-SQL-ERROR      SECTION.                                             
           DISPLAY ' '                                                          
           DISPLAY '8500-SQL-ERROR'                                             
                  ' INFILE-CNT = ' W-INFILE-CNT                                 
           ' LAST-COMMIT-INFILE-CNT = ' W-LAST-COMMIT-INFILE-CNT                
                                                                                
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
                                                                                
           DISPLAY 'CAT770: U3999 - ABENDING ON BAD DB2 STATUS'                 
           DISPLAY 'CAT770: PROGRAM ENDED ABNORMALLY'                           
           MOVE +3999 TO ABEND-CODE                                             
           CALL  ABEND  USING ABEND-CODE                                        
           .                                                                    
       8500-EXIT. EXIT.                                                         
      /                                                                         
       9000-CLOSE-ROUTINE.                                                      
                                                                                
           DISPLAY ' '                                                          
                                                                                
           CLOSE INFILE                                                         
           DISPLAY 'CAT770: INFILE   CLOSED. STATUS  = '                        
                                                   INFILE-STAT                  
           CLOSE REPTFILE                                                       
           DISPLAY 'CAT770: REPTFILE CLOSED. STATUS  = '                        
                                                   REPTFILE-STAT                
                                                                                
           DISPLAY 'CAT770: INFILE     INPUT  COUNT  = '                        
                                                   W-INFILE-CNT                 
           DISPLAY 'CAT770: DETAIL            COUNT  = '                        
                                                   W-DETAIL-CNT                 
           DISPLAY 'CAT770: REPTFILE   OUTPUT COUNT  = '                        
                                                   W-REPTFILE-CNT               
DJ0003     DISPLAY 'CAT770: W-UNDELIVERABLE-CNT      = '                        
DJ0003                      W-UNDELIVERABLE-CNT                                 
           DISPLAY 'CAT770: W-MF-DELETE-FOUND-CNT    = '                        
                            W-MF-DELETE-FOUND-CNT                               
           DISPLAY 'CAT770: W-DELIVERER-CNT          = '                        
                            W-DELIVERER-CNT                                     
           DISPLAY 'CAT770: W-RECEIVER-CNT           = '                        
                            W-RECEIVER-CNT                                      
           DISPLAY 'CAT770: W-MSD-FOUND-CNT          = '                        
                            W-MSD-FOUND-CNT                                     
           DISPLAY 'CAT770: W-MSD-NOT-FOUND-CNT      = '                        
                            W-MSD-NOT-FOUND-CNT                                 
           DISPLAY 'CAT770: W-VTRNFR-FOUND-CNT       = '                        
                            W-VTRNFR-FOUND-CNT                                  
           DISPLAY 'CAT770: W-VTRNFR-NOT-FOUND-CNT   = '                        
                            W-VTRNFR-NOT-FOUND-CNT                              
           DISPLAY 'CAT770: W-VRSTSEC-FOUND-CNT      = '                        
                            W-VRSTSEC-FOUND-CNT                                 
           DISPLAY 'CAT770: W-VRSTSEC-NOT-FOUND-CNT  = '                        
                            W-VRSTSEC-NOT-FOUND-CNT                             
           DISPLAY 'CAT770: W-VRSTSEC-UPDATE-CNT     = '                        
                            W-VRSTSEC-UPDATE-CNT                                
           DISPLAY 'CAT770: W-VRSTSEC-NOT-UPDATE-CNT = '                        
                            W-VRSTSEC-NOT-UPDATE-CNT                            
           DISPLAY 'CAT770: W-VRSTSEC-INSERT-CNT     = '                        
                            W-VRSTSEC-INSERT-CNT                                
           DISPLAY 'CAT770: W-VRSTSEC-NOT-INSERT-CNT = '                        
                            W-VRSTSEC-NOT-INSERT-CNT                            
           DISPLAY 'CAT770: W-VRSDACC-INSERT-CNT     = '                        
                            W-VRSDACC-INSERT-CNT                                
           DISPLAY 'CAT770: W-VRSDACC-NOT-INSERT-CNT = '                        
                            W-VRSDACC-NOT-INSERT-CNT                            
           DISPLAY 'CAT770: W-VRSDSEC-INSERT-CNT     = '                        
                            W-VRSDSEC-INSERT-CNT                                
           DISPLAY 'CAT770: W-VRSDSEC-NOT-INSERT-CNT = '                        
                            W-VRSDSEC-NOT-INSERT-CNT                            
           DISPLAY 'CAT770: W-VRSDSEC-DUPE-CNT       = '                        
                            W-VRSDSEC-DUPE-CNT                                  
           DISPLAY 'CAT770: W-VRSDSEC-FOREIGN-KY-CNT = '                        
                            W-VRSDSEC-FOREIGN-KY-CNT                            
           DISPLAY 'CAT770: W-NETWORK-LVL4-FETCH-CNT = '                        
LRM006                      W-ACTIAST-FETCH-COUNT                               
           DISPLAY 'CAT770: W-NETWORK-LVL4-DLET-CNT  = '                        
LRM006                      W-ACTIAST-DLET-COUNT                                
           DISPLAY ' '                                                          
           DISPLAY 'CAT770: PROGRAM ENDED SUCCESSFULLY'                         
           .                                                                    
       9000-EXIT.                                                               
           EXIT.                                                                
