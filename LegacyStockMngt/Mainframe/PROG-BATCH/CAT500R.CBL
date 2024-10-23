000001* PDX    - CAT500R  C0157686 04/20/01 14:01:47 TBLAMUR            00001000
000001* PDX    - CAT500R  C0121373 02/05/99 13:00:31 TBTARYB            00001000
000001* PDX    - CAT500R  C0121307 02/04/99 10:08:24 TBTARYB            00001000
000001* PDX    - CAT500R  C0121098 02/03/99 17:16:16 TBTARYB            00001000
000001* PDX    - CAT500R  C0120194 01/11/99 13:14:33 TBTARYB            00001000
000001* PDX    - CAT500R  C0118641 01/07/99 16:25:40 TBTARYB            00001000
000001* PDX    - CAT500R  C0119343 12/28/98 14:16:03 TBTARYB            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    CAT500R.                                                  
                                                                                
       DATE-WRITTEN.  NOV 98.                                                   
      ******************************************************************        
      *                       REMARKS                                  *        
      ******************************************************************        
      * THIS PROGRAM CREATES FUND REGISTRATION REPORT FOR THE ORIGINAL *        
      * RECEIVER. IT USES DATA FROM THE FILE CREATED BY CAT500 + SOME  *        
      * DATA FROM VFNDRGST TABLE.                                      *        
      ******************************************************************        
                                                                                
           EJECT                                                                
      ******************************************************************        
       ENVIRONMENT DIVISION.                                                    
      ******************************************************************        
                                                                                
       INPUT-OUTPUT SECTION.                                                    
                                                                                
       FILE-CONTROL.                                                            
                                                                                
           SELECT FR-INPUT          ASSIGN  TO  FRINPUT.                        
           SELECT FR-REPORT         ASSIGN  TO  FREPORT.                        
           SELECT SORT-FILE         ASSIGN  TO  SORTWK01.                       
                                                                                
      ******************************************************************        
       DATA DIVISION.                                                           
      ******************************************************************        
                                                                                
       FILE SECTION.                                                            
                                                                                
       FD  FR-INPUT                                                             
           RECORDING MODE IS V                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  FR-INPUT-REC                      PIC  X(2991).                      
                                                                                
       FD  FR-REPORT                                                            
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS                                             
           LABEL RECORDS ARE STANDARD                                           
           RECORD CONTAINS 143 CHARACTERS.                                      
                                                                                
       01  FR-REPORT-REC                    PIC  X(143).                        
                                                                                
       SD  SORT-FILE.                                                           
                                                                                
       01  SORT-RECORD.                                                         
           05  SORT-KEY.                                                        
               10  SORT-CLIENT             PIC  9(03).                          
               10  SORT-ACATS-CNTL-NBR     PIC  X(14).                          
               10  SORT-ASSET-SEQ-NBR      PIC  9(06).                          
           05  SORT-BODY                   PIC  X(2032).                        
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
       77  EOF-FR-INPUT-SW                  PIC  X(01)  VALUE 'N'.              
           88  EOF-FR-INPUT                             VALUE 'Y'.              
       77  EOF-SORT-FILE-SW                 PIC  X(01)  VALUE 'N'.              
           88  EOF-SORT-FILE                            VALUE 'Y'.              
       77  ABEND-CODE               COMP    PIC S9(04)  VALUE +9999.            
       77  B1-SUB                           PIC  9(03)  VALUE ZEROES.           
       77  S1                               PIC  9(03)  VALUE ZEROES.           
       77  S2                               PIC  9(03)  VALUE ZEROES.           
       77  WS-STREAM-IND                    PIC  X(01)  VALUE SPACES.           
       77  WS-STTLM-DT                      PIC  X(10)  VALUE SPACES.           
       77  WS-ACCT-RCV-NBR                  PIC  X(20)  VALUE SPACES.           
       77  WS-RCV-CUST-NM                   PIC  X(60)  VALUE SPACES.           
       77  WS-ACCT-DLVR-NBR                 PIC  X(20)  VALUE SPACES.           
       77  WS-RCV-ACCT-TYPE-CD              PIC  X(01)  VALUE SPACES.           
       77  WS-DAYS-STTS-QTY         COMP    PIC S9(04)  VALUE ZEROES.           
       77  WS-STTS-CD                       PIC  X(03)  VALUE SPACES.           
       77  WS-PAGE-CNTR                     PIC  9(04)  VALUE ZEROES.           
       77  WS-CLIENT-NBR-N                  PIC  9(04).                         
       77  WS-CLIENT-NBR REDEFINES                                              
           WS-CLIENT-NBR-N                  PIC  X(04).                         
       77  CLIENT-FOUND-SW                  PIC  X(01).                         
           88  CLIENT-FOUND                             VALUE 'Y'.              
           88  CLIENT-NOT-FOUND                         VALUE 'N'.              
       77  WS-PRTCP-NM                      PIC  X(60)  VALUE SPACES.           
       77  HOLD-RCV-NBR                     PIC  X(04).                         
       77  HOLD-DLVR-NBR                    PIC  X(04).                         
       77  HOLD-CLIENT-NBR                  PIC  9(03)  VALUE 999.              
       77  WS-CLEARING-NBR                  PIC  X(04)  VALUE SPACES.           
           COPY STUBCPY.                                                        
       01  CLIENT-TABLE-CNTR                PIC  9(03)  VALUE ZEROES.           
       01  CLIENT-TABLE-AREA.                                                   
           05  CLIENT-TABLE OCCURS 500 TIMES.                                   
               10  CLIENT-NUM               PIC  9(03)  VALUE ZEROES.           
               10  CLIENT-NAME              PIC  X(30)  VALUE SPACES.           
               10  CLIENT-CLEARING-NBR      PIC  X(04)  VALUE SPACES.           
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'DATES AREA'.                                                        
                                                                                
       01  FILLER.                                                              
                                                                                
           05  WS-DATE-TIME                 PIC  X(26).                         
           05  FILLER REDEFINES                                                 
               WS-DATE-TIME.                                                    
               10  WS-PROC-CC               PIC  X(02).                         
               10  WS-PROC-YY               PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-PROC-MM               PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-PROC-DD               PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-TIME-HH               PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-TIME-MM               PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-TIME-SS               PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  FILLER                   PIC  X(06).                         
                                                                                
           05  WS-SUBMIT-DATE.                                                  
               10  WS-SUBMIT-MM             PIC  X(02)  VALUE SPACES.           
               10  WS-SUBMIT-DD             PIC  X(02)  VALUE SPACES.           
               10  WS-SUBMIT-CC             PIC  X(02)  VALUE SPACES.           
               10  WS-SUBMIT-YY             PIC  X(02)  VALUE SPACES.           
                                                                                
       01  WS-DATE.                                                             
           05  WS-DATE-MM                   PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  WS-DATE-DD                   PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  WS-DATE-YY                   PIC  X(02)  VALUE SPACES.           
                                                                                
       01  WS-STTLM-DATE                    PIC  X(10).                         
       01  FILLER REDEFINES                                                     
           WS-STTLM-DATE.                                                       
           05  WS-STTLM-CC                  PIC  X(02).                         
           05  WS-STTLM-YY                  PIC  X(02).                         
           05  FILLER                       PIC  X(01).                         
           05  WS-STTLM-MM                  PIC  X(02).                         
           05  FILLER                       PIC  X(01).                         
           05  WS-STTLM-DD                  PIC  X(02).                         
                                                                                
       01  WS-CYCLE-NBR-AREA.                                                   
           05  FILLER                       PIC  X(01)  VALUE SPACES.           
           05  WS-CYCLE-NBR                 PIC  X(02)  VALUE SPACES.           
                                                                                
       01  SD-RECORD.                                                           
           05  SD-KEY.                                                          
               10  SD-CLIENT-NBR            PIC  9(03).                         
               10  SD-ACATS-CNTL-NBR        PIC  X(14).                         
               10  SD-ASSET-SEQ-NBR         PIC  9(06).                         
           05  SD-BODY.                                                         
               10  SD-ORG-RCV-NBR           PIC  X(04).                         
               10  SD-RCV-NAME              PIC  X(20).                         
               10  SD-RCV-ACCT-NBR          PIC  X(20).                         
               10  SD-RCV-ACCT-TYPE-CD      PIC  X(01).                         
               10  SD-ORG-DEL-NBR           PIC  X(04).                         
               10  SD-DLVR-ACCT-NBR         PIC  X(20).                         
               10  SD-TRANSFER-TYPE         PIC  X(03).                         
               10  SD-SSN-EIN-NBR           PIC  X(09).                         
               10  SD-STTS-CD               PIC  X(03).                         
               10  SD-DAYS-STTS-QTY         PIC  9(04).                         
               10  SD-STTLM-DT              PIC  X(10).                         
               10  SD-CUST-NA-TABLE  OCCURS 3 TIMES.                            
                   15  SD-CUST-NA-1         PIC  X(35).                         
                   15  SD-CUST-NA-2         PIC  X(35).                         
               10  SD-FRAC-IND              PIC  X(01).                         
               10  SD-MF-TRANS-TYPE         PIC  X(01).                         
               10  SD-XCUTE-BRKR            PIC  X(04).                         
               10  SD-FRCN-IND              PIC  X(01).                         
               10  SD-ACCT-REP-NAME         PIC  X(15).                         
               10  SD-NRA-TAX-PRCNT         PIC V9(02).                         
               10  SD-ACCT-REP-NBR          PIC  X(09).                         
               10  SD-CUST-ZIP-5            PIC  X(05).                         
               10  SD-CUST-ZIP-4            PIC  X(04).                         
               10  SD-ATD-ACCRU-CD          PIC  X(01).                         
               10  SD-BRANCH-ID-NBR         PIC  X(09).                         
               10  SD-ATD-CASH-CD           PIC  X(01).                         
               10  SD-STATE-CODE            PIC  X(02).                         
               10  SD-ATD-RESDU-CD          PIC  X(01).                         
               10  SD-CNTRY-CODE            PIC  X(02).                         
               10  SD-PAYABLE-INFO  OCCURS 6 TIMES.                             
                   15  SD-PAY-ACCT-NBR      PIC  X(20).                         
                   15  SD-PAY-ACCT-IND      PIC  X(01).                         
                   15  SD-PAY-ADDR-OPT      PIC  X(01).                         
                   15  SD-ALT-PAYA-IND      PIC  X(01).                         
                   15  SD-ALT-PAY-REASON    PIC  X(01).                         
                   15  SD-PBL-NA  OCCURS 3 TIMES.                               
                       20  SD-PBL-NA-1      PIC  X(35).                         
                       20  SD-PBL-NA-2      PIC  X(35).                         
                   15  SD-PAY-ZIP-5         PIC  X(05).                         
                   15  SD-PAY-ZIP-4         PIC  X(04).                         
               10  SD-SHARE-IND             PIC  X(01).                         
               10  SD-CUST-NAME             PIC  X(20).                         
               10  SD-PI-DEL-IND            PIC  X(01).                         
               10  SD-FND-CUST-ACCT-NBR     PIC  X(20).                         
               10  SD-TPA-NBR               PIC  X(01).                         
               10  SD-FND-ACCT-IND          PIC  X(01).                         
               10  SD-NETWRK-CNTL-IND       PIC  X(03).                         
               10  SD-DVDND-CD              PIC  X(01).                         
               10  SD-SSN-EIN-IND           PIC  X(01).                         
               10  SD-WITHOLD-IND           PIC  X(01).                         
               10  SD-ROA-LOI-VALUE         PIC  9(14)V99.                      
               10  SD-PAYABLE-IND           PIC  X(01).                         
               10  SD-LOI-NBR-DATE          PIC  X(08).                         
               10  SD-SOCIAL-CODE           PIC  X(02).                         
               10  SD-RLT-ACCT-NBR          PIC  X(20).                         
               10  SD-NAV-ACCT-IND          PIC  X(01).                         
               10  SD-RLT-ACCT-IND          PIC  X(01).                         
               10  SD-MARGN-ACCT-IND        PIC  X(01).                         
               10  SD-RLT-TRADE-IND         PIC  X(01).                         
               10  SD-SWP-IND               PIC  X(01).                         
               10  SD-SWP-PAC-EFF-DT        PIC  X(08).                         
               10  SD-ACH-IND               PIC  X(01).                         
               10  SD-MEMO-TEXT             PIC  X(12).                         
               10  SD-PAC-IND               PIC  X(01).                         
               10  SD-DISBURS-AMT           PIC  9(16).                         
               10  SD-DISBURS-OPT-CD        PIC  X(01).                         
               10  SD-MNTHLY-PAY-INDS       PIC  X(12).                         
               10  SD-CDSC-PAYMNT-CD        PIC  X(01).                         
               10  SD-PAY-DATE-VAL          PIC  X(02).                         
               10  SD-SHRHLDR-BNK-ACCT-NBR  PIC  X(20).                         
               10  SD-RETIRE-TAX-CD         PIC  X(02).                         
               10  SD-SHRHLDR-BNK-ACCT-TYPE PIC  X(01).                         
               10  SD-COST-BASIS-CD         PIC  X(01).                         
               10  SD-ABA-ROUTE-NBR         PIC  X(09).                         
               10  SD-NBR-OF-PAYABLES       PIC  9(02).                         
               10  SD-1ST-CHECK-DATE        PIC  X(08).                         
               10  SD-SEC-ID                PIC  X(09).                         
                                                                                
       01  WS-ACAT-CONTROL-NBR.                                                 
           05  WS-ACAT-CONTROL-NBR-1-7      PIC  X(07)  VALUE SPACES.           
           05  WS-ACAT-CONTROL-NBR-8-14     PIC  X(07)  VALUE SPACES.           
                                                                                
       01  WS-CONTROL-NBR.                                                      
           05  WS-CONTROL-NBR-1             PIC  X(07)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE '-'.              
           05  WS-CONTROL-NBR-2             PIC  X(07)  VALUE SPACES.           
                                                                                
       01  WS-SSN-TIN-NBR.                                                      
           05  WS-SSN-TIN-NBR-1             PIC  X(03)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE '-'.              
           05  WS-SSN-TIN-NBR-2             PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE '-'.              
           05  WS-SSN-TIN-NBR-3             PIC  X(04)  VALUE SPACES.           
                                                                                
       01  TRAC-RECORD.                                                         
           05  TRAC-DETAIL                  PIC  X(133).                        
           05  TRAC-CONTROL.                                                    
               10  TRAC-CLIENT      COMP-3  PIC  9(03)  VALUE ZEROES.           
               10  TRAC-CYCLE               PIC  X(02)  VALUE ZEROES.           
               10  FILLER                   PIC  X(06)  VALUE SPACES.           
                                                                                
       01  WS-NRA-TAX-PRCNT-AREA            PIC V9(02).                         
       01  WS-NRA-TAX-PRCNT REDEFINES                                           
           WS-NRA-TAX-PRCNT-AREA            PIC  9(02).                         
                                                                                
       01  WS-ROA-LOI-VALUE                 PIC  9(14)V99.                      
       01  FILLER REDEFINES                                                     
           WS-ROA-LOI-VALUE.                                                    
           05  WS-ROA-LOI-VALUE-INT         PIC  9(14).                         
           05  WS-ROA-LOI-VALUE-DEC         PIC  9(02).                         
                                                                                
       01  WS-ROA-LOI-AMT-AREA.                                                 
           05  WS-ROA-LOI-AMT-INT           PIC  9(11).                         
           05  WS-ROA-LOI-AMT-DEC           PIC  9(02).                         
       01  WS-ROA-LOI-AMT REDEFINES                                             
           WS-ROA-LOI-AMT-AREA              PIC  9(11)V9(02).                   
                                                                                
       01  WS-DISBURS-AMT-AREA.                                                 
           05  FILLER                       PIC  9(03).                         
           05  WS-DISBURS-AMT               PIC  9(13).                         
           05  WS-DISBURS-AMT-0 REDEFINES                                       
               WS-DISBURS-AMT               PIC  9(11)V9(02).                   
           05  WS-DISBURS-AMT-1 REDEFINES                                       
               WS-DISBURS-AMT               PIC  9(03)V9(10).                   
           05  WS-DISBURS-AMT-2 REDEFINES                                       
               WS-DISBURS-AMT               PIC  9(09)V9(04).                   
                                                                                
       01  HDR1-RECORD.                                                         
           05  HDR1-CC                      PIC  X(01)  VALUE '1'.              
           05  FILLER                       PIC  X(06)  VALUE                   
               'DATE: '.                                                        
           05  HDR1-PROC-DATE               PIC  X(08)  VALUE SPACES.           
           05  FILLER                       PIC  X(30)  VALUE SPACES.           
           05  FILLER                       PIC  X(42)  VALUE                   
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.                    
           05  FILLER                       PIC  X(34)  VALUE SPACES.           
           05  FILLER                       PIC  X(07)  VALUE                   
               'PAGE:  '.                                                       
           05  HDR1-PAGE-NBR                PIC  ZZZ9.                          
           05  FILLER                       PIC  X(01)  VALUE SPACES.           
                                                                                
                                                                                
       01  HDR2-RECORD.                                                         
           05  HDR2-CC                      PIC  X(01)  VALUE ' '.              
           05  FILLER                       PIC  X(06)  VALUE                   
               'TIME: '.                                                        
           05  HDR2-HH                      PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE ':'.              
           05  HDR2-MM                      PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE ':'.              
           05  HDR2-SS                      PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(25)  VALUE SPACES.           
           05  FILLER                       PIC  X(39)  VALUE                   
               'REGISTRATION DETAIL REPORT AS ORIGINAL '.                       
           05  FILLER                       PIC  X(16)  VALUE                   
               'ACCOUNT RECEIVER'.                                              
           05  FILLER                       PIC  X(38)  VALUE SPACES.           
                                                                                
       01  HDR3-RECORD.                                                         
           05  HDR3-CC                      PIC  X(01)  VALUE ' '.              
           05  FILLER                       PIC  X(54)  VALUE SPACES.           
           05  FILLER                       PIC  X(07)  VALUE                   
               'CYCLE  '.                                                       
           05  HDR3-CYCLE-NBR               PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(06)  VALUE                   
               ' FOR: '.                                                        
           05  HDR3-SUBMIT-MM               PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  HDR3-SUBMIT-DD               PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  HDR3-SUBMIT-CC               PIC  X(02)  VALUE SPACES.           
           05  HDR3-SUBMIT-YY               PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(53)  VALUE SPACES.           
                                                                                
       01  DTL1-RECORD.                                                         
           05  DTL1-CC                      PIC  X(01)  VALUE '0'.              
           05  FILLER                       PIC  X(17)  VALUE                   
               'REC PARTICIPANT:'.                                              
           05  DTL1-RCV-NBR                 PIC  X(04)  VALUE SPACES.           
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  DTL1-RCV-NAME                PIC  X(35)  VALUE SPACES.           
           05  FILLER                       PIC  X(15)  VALUE SPACES.           
           05  FILLER                       PIC  X(19)  VALUE                   
               'REC CUST ACCT NUM: '.                                           
           05  DTL1-RCV-ACCT-NBR            PIC  X(20)  VALUE SPACES.           
           05  FILLER                       PIC  X(17)  VALUE                   
               ' CUST ACCT TYPE: '.                                             
           05  DTL1-RCV-ACCT-TYPE           PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE SPACES.           
                                                                                
       01  DTL2-RECORD.                                                         
           05  DTL2-CC                      PIC  X(01)  VALUE ' '.              
           05  FILLER                       PIC  X(17)  VALUE                   
               'DEL PARTICIPANT:'.                                              
           05  DTL2-DLVR-NBR                PIC  X(04)  VALUE ' '.              
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  DTL2-DLVR-NAME               PIC  X(35)  VALUE ' '.              
           05  FILLER                       PIC  X(15)  VALUE SPACES.           
           05  FILLER                       PIC  X(19)  VALUE                   
               'DEL CUST ACCT NUM: '.                                           
           05  DTL2-DLVR-ACCT-NBR           PIC  X(20)  VALUE SPACES.           
           05  FILLER                       PIC  X(20)  VALUE SPACES.           
                                                                                
       01  DTL3-RECORD.                                                         
           05  DTL3-CC                      PIC  X(01)  VALUE '0'.              
           05  FILLER                       PIC  X(12)  VALUE                   
               'CONTROL NO: '.                                                  
           05  DTL3-ACAT-CONTROL-NBR        PIC  X(15)  VALUE SPACES.           
           05  FILLER                       PIC  X(08)  VALUE                   
               '  TYPE: '.                                                      
           05  DTL3-TRANSFER-TYPE           PIC  X(03)  VALUE SPACES.           
           05  FILLER                       PIC  X(14)  VALUE                   
               '  SSN/TAX-ID: '.                                                
           05  DTL3-SSN-TIN-NBR             PIC  X(11)  VALUE SPACES.           
           05  FILLER                       PIC  X(12)  VALUE SPACES.           
           05  FILLER                       PIC  X(17)  VALUE                   
               'TRANSFER STATUS: '.                                             
           05  DTL3-STTS                    PIC  X(15)  VALUE SPACES.           
           05  FILLER                       PIC  X(06)  VALUE SPACES.           
           05  FILLER                       PIC  X(06)  VALUE                   
               'DAYS: '.                                                        
           05  DTL3-DAYS                    PIC  ZZZ9.                          
           05  FILLER                       PIC  X(09)  VALUE SPACES.           
                                                                                
       01  DTL4-RECORD.                                                         
           05  DTL4-CC                      PIC  X(01)  VALUE ' '.              
           05  FILLER                       PIC  X(12)  VALUE                   
               ' ASSOC CTL: '.                                                  
           05  DTL4-ASSOC-CONTROL-NBR       PIC  X(15)  VALUE SPACES.           
           05  FILLER                       PIC  X(12)  VALUE                   
               '  SETL DTE: '.                                                  
           05  DTL4-STTLM-DATE              PIC  X(08)  VALUE SPACES.           
           05  FILLER                       PIC  X(24)  VALUE SPACES.           
           05  FILLER                       PIC  X(21)  VALUE                   
               'REGISTRATION SOURCE: '.                                         
           05  DTL4-REG-SOURCE              PIC  X(15)  VALUE                   
               'PARTICIPANT'.                                                   
           05  FILLER                       PIC  X(25)  VALUE SPACES.           
                                                                                
       01  DTL5-RECORD.                                                         
           05  DTL5-CC                      PIC  X(01)  VALUE ' '.              
           05  FILLER                       PIC  X(12)  VALUE                   
               ' CUST NAME: '.                                                  
           05  DTL5-CUST-NM                 PIC  X(20)  VALUE SPACES.           
           05  FILLER                       PIC  X(100) VALUE SPACES.           
                                                                                
       01  DTL6-RECORD.                                                         
           05  DTL6-CC                      PIC  X(01)  VALUE ' '.              
           05  DTL6-COL1-NAME               PIC  X(17)  VALUE SPACES.           
           05  DTL6-COL1-VALUE              PIC  X(06).                         
           05  FILLER REDEFINES                                                 
               DTL6-COL1-VALUE.                                                 
               10  DTL6-COL1-1-BYTE         PIC  X(01).                         
               10  FILLER                   PIC  X(05).                         
           05  FILLER REDEFINES                                                 
               DTL6-COL1-VALUE.                                                 
               10  DTL6-COL1-2-BYTES        PIC  X(02).                         
               10  FILLER                   PIC  X(04).                         
           05  FILLER REDEFINES                                                 
               DTL6-COL1-VALUE.                                                 
               10  DTL6-COL1-4-BYTES        PIC  X(04).                         
               10  FILLER                   PIC  X(02).                         
           05  FILLER                       PIC  X(03)  VALUE SPACES.           
           05  DTL6-COL2-NAME               PIC  X(17)  VALUE SPACES.           
           05  DTL6-COL2-VALUE              PIC  X(14)  VALUE SPACES.           
           05  FILLER REDEFINES                                                 
               DTL6-COL2-VALUE.                                                 
               10  DTL6-COL2-1-BYTE         PIC  X(01).                         
               10  FILLER                   PIC  X(13).                         
           05  FILLER REDEFINES                                                 
               DTL6-COL2-VALUE.                                                 
               10  DTL6-COL2-2-BYTES        PIC  X(02).                         
               10  FILLER                   PIC  X(12).                         
           05  FILLER REDEFINES                                                 
               DTL6-COL2-VALUE.                                                 
               10  DTL6-COL2-4-BYTES        PIC  X(04).                         
               10  FILLER                   PIC  X(10).                         
           05  FILLER REDEFINES                                                 
               DTL6-COL2-VALUE.                                                 
               10  DTL6-COL2-8-BYTES        PIC  X(08).                         
               10  FILLER                   PIC  X(06).                         
           05  FILLER REDEFINES                                                 
               DTL6-COL2-VALUE.                                                 
               10  DTL6-COL2-9-BYTES        PIC  X(09).                         
               10  FILLER                   PIC  X(05).                         
           05  FILLER REDEFINES                                                 
               DTL6-COL2-VALUE.                                                 
               10  DTL6-COL2-12-BYTES       PIC  X(12).                         
               10  FILLER                   PIC  X(02).                         
           05  DTL6-COL2-ROALOI REDEFINES                                       
               DTL6-COL2-VALUE              PIC  ZZZZZZZZZZ9.99.                
           05  DTL6-COL2-DISBURS-AMT-0 REDEFINES                                
               DTL6-COL2-VALUE              PIC  ZZZZZZZZZZ9.99.                
           05  DTL6-COL2-DISBURS-AMT-1 REDEFINES                                
               DTL6-COL2-VALUE              PIC  ZZ9.9999999999.                
           05  DTL6-COL2-DISBURS-AMT-2 REDEFINES                                
               DTL6-COL2-VALUE              PIC  ZZZZZZZZ9.9999.                
           05  FILLER                       PIC  X(03)  VALUE SPACES.           
           05  DTL6-COL3-1.                                                     
               10  DTL6-COL3-NAME           PIC  X(17).                         
               10  DTL6-COL3-VALUE          PIC  X(35).                         
               10  FILLER REDEFINES                                             
                   DTL6-COL3-VALUE.                                             
                   15  DTL6-COL3-1-BYTE     PIC  X(01).                         
                   15  FILLER               PIC  X(34).                         
               10  FILLER REDEFINES                                             
                   DTL6-COL3-VALUE.                                             
                   15  DTL6-COL3-8-BYTES    PIC  X(08).                         
                   15  FILLER               PIC  X(27).                         
           05  DTL6-COL3-2 REDEFINES                                            
               DTL6-COL3-1                  PIC  X(52).                         
           05  FILLER                       PIC  X(20)  VALUE SPACES.           
                                                                                
       01  TRL1-RECORD.                                                         
           05  TRL1-CC                      PIC  X(01)  VALUE ' '.              
           05  FILLER                       PIC  X(54)  VALUE                   
               'REPORT SEQUENCE:   1.  CONTROL NUMBER'.                         
           05  FILLER                       PIC  X(78)  VALUE                   
               'REPORT CONTENT: PARTICIPANT REGISTRATION DISPLAYED'.            
                                                                                
       01  TRL2-RECORD.                                                         
           05  TRL2-CC                      PIC  X(01)  VALUE ' '.              
           05  FILLER                       PIC  X(54)  VALUE                   
               '                   2.  ASSET SEQUENCE'.                         
           05  FILLER                       PIC  X(78)  VALUE SPACES.           
                                                                                
       01  NO-ACTIVITY-MSG.                                                     
           05  MSG-CC                       PIC  X(01)  VALUE '0'.              
           05  FILLER                       PIC  X(48)  VALUE SPACES.           
           05  FILLER                       PIC  X(36)  VALUE                   
               'NO FUND/SERV ACTIVITY FOR THIS CYCLE'.                          
           05  FILLER                       PIC  X(48)  VALUE SPACES.           
                                                                                
       01  DSNTIAR                          PIC  X(08)  VALUE 'DSNTIAR'.        
       01  WS-DB2-MESSAGE-AREA.                                                 
           05  WS-DB2-MSG-LEN       COMP    PIC S9(04)  VALUE +960.             
           05  WS-ERROR-MSG                 PIC  X(80)  OCCURS 12 TIMES         
               INDEXED BY WS-ERROR-INDEX.                                       
       01  WS-ERR-LINE-LEN            COMP  PIC S9(09)  VALUE +80.              
                                                                                
           EJECT                                                                
           COPY BHINFO.                                                         
                                                                                
           EJECT                                                                
           COPY BHACAT.                                                         
                                                                                
           EJECT                                                                
           COPY NSCCDHDR.                                                       
                                                                                
           EJECT                                                                
           COPY NSCCDFR.                                                        
                                                                                
           EJECT                                                                
           COPY GETNACOB.                                                       
       01  GETNA-SEGMENTS.                                                      
           COPY NASEGHDR.                                                       
           COPY NASEGPPA.                                                       
           COPY NASEGPPB.                                                       
           COPY NASEGEND.                                                       
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
       01  PARM-AREA.                                                           
           05  PARM-LENGTH          COMP    PIC S9(04).                         
           05  LS-STREAM-IND                PIC  X(01).                         
                                                                                
           EJECT                                                                
      ******************************************************************        
       PROCEDURE DIVISION USING PARM-AREA.                                      
      ******************************************************************        
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
           PERFORM INITIAL-ROUTINE.                                             
                                                                                
           SORT SORT-FILE                                                       
              ASCENDING KEY    SORT-KEY                                         
              INPUT PROCEDURE  SORT-INPUT-ROUTINE                               
              OUTPUT PROCEDURE SORT-OUTPUT-ROUTINE.                             
                                                                                
           PERFORM EOJ-ROUTINE.                                                 
                                                                                
           GOBACK.                                                              
                                                                                
           EJECT                                                                
      ********************                                                      
       SORT-INPUT-ROUTINE.                                                      
      ********************                                                      
                                                                                
           PERFORM UNTIL EOF-FR-INPUT                                           
              IF NSCCFR-ORG-RCV-NBR NOT = HOLD-RCV-NBR                          
                 MOVE NSCCFR-ORG-RCV-NBR     TO  WS-CLEARING-NBR                
                                                 SD-ORG-RCV-NBR                 
                                                 HOLD-RCV-NBR                   
                 PERFORM SEARCH-CLIENT-TABLE                                    
                 IF CLIENT-FOUND                                                
                    MOVE CLIENT-NUM (S1 - 1)  TO  SD-CLIENT-NBR                 
                    MOVE ZEROES               TO  WS-CLIENT-NBR-N               
                    MOVE SD-CLIENT-NBR        TO  WS-CLIENT-NBR-N               
                    MOVE CLIENT-NAME (S1 - 1) TO  SD-RCV-NAME                   
                 END-IF                                                         
              END-IF                                                            
              IF CLIENT-FOUND                                                   
                 PERFORM SELECT-FROM-VTRNFR                                     
                 MOVE WS-ACCT-RCV-NBR          TO  SD-RCV-ACCT-NBR              
                 MOVE WS-RCV-ACCT-TYPE-CD      TO  SD-RCV-ACCT-TYPE-CD          
                 MOVE NSCCFR-ORG-DEL-NBR       TO  SD-ORG-DEL-NBR               
                 MOVE WS-ACCT-DLVR-NBR         TO  SD-DLVR-ACCT-NBR             
                 MOVE NSCCFR-ACATS-CNTL-NBR    TO  SD-ACATS-CNTL-NBR            
                 MOVE NSCCFR-TRANSFER-TYPE     TO  SD-TRANSFER-TYPE             
                 MOVE NSCCFR-SSN-EIN-NBR       TO  SD-SSN-EIN-NBR               
                 MOVE WS-STTS-CD               TO  SD-STTS-CD                   
                 MOVE WS-DAYS-STTS-QTY         TO  SD-DAYS-STTS-QTY             
                 MOVE WS-STTLM-DT              TO  SD-STTLM-DT                  
                 MOVE NSCCFR-CUST-NA-1 (1)     TO  SD-CUST-NA-1 (1)             
                 MOVE NSCCFR-ASSET-SEQ-NBR     TO  SD-ASSET-SEQ-NBR             
                 MOVE NSCCFR-MF-TRANS-TYPE     TO  SD-MF-TRANS-TYPE             
                 MOVE NSCCFR-XCUTE-BRKR        TO  SD-XCUTE-BRKR                
                 MOVE NSCCFR-CUST-NA-2 (1)     TO  SD-CUST-NA-2 (1)             
                 MOVE NSCCFR-FRCN-IND          TO  SD-FRCN-IND                  
                 IF NSCCFR-ACCT-REP-NAME = LOW-VALUES OR HIGH-VALUES            
                    MOVE SPACES                TO  SD-ACCT-REP-NAME             
                 ELSE                                                           
                    MOVE NSCCFR-ACCT-REP-NAME  TO  SD-ACCT-REP-NAME             
                 END-IF                                                         
                 MOVE NSCCFR-CUST-NA-1 (2)     TO  SD-CUST-NA-1 (2)             
                 MOVE NSCCFR-NRA-TAX-PRCNT     TO  SD-NRA-TAX-PRCNT             
                 IF NSCCFR-ACCT-REP-NBR = LOW-VALUES OR                         
                    HIGH-VALUES OR ZEROES                                       
                    MOVE SPACES                TO  SD-ACCT-REP-NBR              
                 ELSE                                                           
                    MOVE NSCCFR-ACCT-REP-NBR   TO  SD-ACCT-REP-NBR              
                 END-IF                                                         
                 MOVE NSCCFR-CUST-ZIP-5        TO  SD-CUST-ZIP-5                
                 MOVE NSCCFR-CUST-ZIP-4        TO  SD-CUST-ZIP-4                
                 MOVE NSCCFR-ATD-ACCRU-CD      TO  SD-ATD-ACCRU-CD              
                 MOVE NSCCFR-BRANCH-ID-NBR     TO  SD-BRANCH-ID-NBR             
                 MOVE NSCCFR-ATD-CASH-CD       TO  SD-ATD-CASH-CD               
                 MOVE NSCCFR-STATE-CODE        TO  SD-STATE-CODE                
                 MOVE NSCCFR-ATD-RESDU-CD      TO  SD-ATD-RESDU-CD              
                 MOVE NSCCFR-CNTRY-CODE        TO  SD-CNTRY-CODE                
                 MOVE NSCCFR-PAY-ACCT-NBR (1)  TO  SD-PAY-ACCT-NBR (1)          
                 MOVE NSCCFR-SHARE-IND         TO  SD-SHARE-IND                 
                 MOVE NSCCFR-CUST-NAME         TO  SD-CUST-NAME                 
                 MOVE NSCCFR-PAY-ACCT-IND (1)  TO  SD-PAY-ACCT-IND (1)          
                 MOVE NSCCFR-PI-DEL-IND        TO  SD-PI-DEL-IND                
                 MOVE NSCCFR-FND-CUST-ACCT-NBR TO  SD-FND-CUST-ACCT-NBR         
                 MOVE NSCCFR-PAY-ADDR-OPT (1)  TO  SD-PAY-ADDR-OPT (1)          
                 MOVE NSCCFR-TPA-NBR           TO  SD-TPA-NBR                   
                 MOVE NSCCFR-FND-ACCT-IND      TO  SD-FND-ACCT-IND              
                 MOVE NSCCFR-ALT-PAYA-IND (1)  TO  SD-ALT-PAYA-IND (1)          
                 MOVE NSCCFR-NETWRK-CNTL-IND   TO  SD-NETWRK-CNTL-IND           
                 MOVE NSCCFR-ALT-PAY-REASON (1) TO SD-ALT-PAY-REASON (1)        
                 MOVE NSCCFR-DVDND-CD          TO  SD-DVDND-CD                  
                 MOVE NSCCFR-SSN-EIN-IND       TO  SD-SSN-EIN-IND               
                 MOVE NSCCFR-WITHOLD-IND       TO  SD-WITHOLD-IND               
                 MOVE NSCCFR-ROA-LOI-VALUE     TO  SD-ROA-LOI-VALUE             
                 MOVE NSCCFR-PBL-NA-1 (1, 1)   TO  SD-PBL-NA-1 (1, 1)           
                 MOVE NSCCFR-PAYABLE-IND       TO  SD-PAYABLE-IND               
                 MOVE NSCCFR-LOI-NBR-DATE      TO  SD-LOI-NBR-DATE              
                 MOVE NSCCFR-PBL-NA-2 (1, 1)   TO  SD-PBL-NA-2 (1, 1)           
                 MOVE NSCCFR-SOCIAL-CODE       TO  SD-SOCIAL-CODE               
                 MOVE NSCCFR-RLT-ACCT-NBR      TO  SD-RLT-ACCT-NBR              
                 MOVE NSCCFR-PBL-NA-1 (2, 1)   TO  SD-PBL-NA-1 (2, 1)           
                 MOVE NSCCFR-NAV-ACCT-IND      TO  SD-NAV-ACCT-IND              
                 MOVE NSCCFR-RLT-ACCT-IND      TO  SD-RLT-ACCT-IND              
                 MOVE NSCCFR-PAY-ZIP-5 (1)     TO  SD-PAY-ZIP-5 (1)             
                 MOVE NSCCFR-PAY-ZIP-4 (1)     TO  SD-PAY-ZIP-4 (1)             
                 MOVE NSCCFR-MARGN-ACCT-IND    TO  SD-MARGN-ACCT-IND            
                 MOVE NSCCFR-RLT-TRADE-IND     TO  SD-RLT-TRADE-IND             
                 MOVE NSCCFR-SWP-IND           TO  SD-SWP-IND                   
                 MOVE NSCCFR-SWP-PAC-EFF-DT    TO  SD-SWP-PAC-EFF-DT            
                 MOVE NSCCFR-ACH-IND           TO  SD-ACH-IND                   
                 MOVE NSCCFR-MEMO-TEXT         TO  SD-MEMO-TEXT                 
                 MOVE NSCCFR-PAC-IND           TO  SD-PAC-IND                   
                 MOVE NSCCFR-DISBURS-AMT       TO  SD-DISBURS-AMT               
                 MOVE NSCCFR-DISBURS-OPT-CD    TO  SD-DISBURS-OPT-CD            
                 MOVE NSCCFR-SWP-IND           TO  SD-SWP-IND                   
                 MOVE NSCCFR-MNTHLY-PAY-INDS   TO  SD-MNTHLY-PAY-INDS           
                 MOVE NSCCFR-CDSC-PAYMNT-CD    TO  SD-CDSC-PAYMNT-CD            
                 MOVE NSCCFR-PAY-DATE-VAL      TO  SD-PAY-DATE-VAL              
                 MOVE NSCCFR-SHRHLDR-BNK-ACCT-NBR                               
                                            TO  SD-SHRHLDR-BNK-ACCT-NBR         
                 MOVE NSCCFR-RETIRE-TAX-CD     TO  SD-RETIRE-TAX-CD             
                 MOVE NSCCFR-SHRHLDR-BNK-ACCT-TYPE                              
                                            TO  SD-SHRHLDR-BNK-ACCT-TYPE        
                 MOVE NSCCFR-COST-BASIS-CD     TO  SD-COST-BASIS-CD             
                 MOVE NSCCFR-ABA-ROUTE-NBR     TO  SD-ABA-ROUTE-NBR             
                 MOVE NSCCFR-NBR-OF-PAYABLES   TO  SD-NBR-OF-PAYABLES           
                 MOVE NSCCFR-1ST-CHECK-DATE    TO  SD-1ST-CHECK-DATE            
                 MOVE NSCCFR-SEC-ID            TO  SD-SEC-ID                    
                 RELEASE SORT-RECORD         FROM  SD-RECORD                    
              END-IF                                                            
              READ FR-INPUT               INTO  NSCCFR-AREA                     
                 AT END SET EOF-FR-INPUT    TO  TRUE                            
              END-READ                                                          
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      ********************                                                      
       SELECT-FROM-VTRNFR.                                                      
      ********************                                                      
                                                                                
           EXEC SQL                                                             
              SELECT                                                            
                    STTLM_DT                                                    
                   ,ACCT_RCV_NBR                                                
                   ,RCV_CUST_NM                                                 
                   ,ACCT_DLVR_NBR                                               
                   ,RCV_ACCT_TYPE_CD                                            
                   ,DAYS_STTS_QTY                                               
                   ,STTS_CD                                                     
              INTO                                                              
                    :WS-STTLM-DT                                                
                   ,:WS-ACCT-RCV-NBR                                            
                   ,:WS-RCV-CUST-NM                                             
                   ,:WS-ACCT-DLVR-NBR                                           
                   ,:WS-RCV-ACCT-TYPE-CD                                        
                   ,:WS-DAYS-STTS-QTY                                           
                   ,:WS-STTS-CD                                                 
              FROM  VTRNFR                                                      
              WHERE CLIENT_NBR       = :WS-CLIENT-NBR AND                       
                    ACAT_CONTROL_NBR = :NSCCFR-ACATS-CNTL-NBR                   
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY '*************************************************        
      -               '**********'                                              
              DISPLAY '* FOR CLIENT = ' WS-CLIENT-NBR                           
                      ' ACAT-CONTROL-NBR = ' NSCCFR-ACATS-CNTL-NBR              
              DISPLAY '* SELECT FROM VTRNFR FAILED BECAUSE:      *'             
              PERFORM DB2-ERROR-ROUTINE                                         
              DISPLAY '*************************************************        
      -               '**********'                                              
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *********************                                                     
       SORT-OUTPUT-ROUTINE.                                                     
      *********************                                                     
                                                                                
           MOVE 999                         TO  HOLD-CLIENT-NBR.                
                                                                                
           RETURN SORT-FILE               INTO  SD-RECORD                       
              AT END SET EOF-SORT-FILE      TO  TRUE                            
           END-RETURN.                                                          
                                                                                
           PERFORM UNTIL EOF-SORT-FILE                                          
              IF SD-CLIENT-NBR NOT = HOLD-CLIENT-NBR                            
                 MOVE SD-CLIENT-NBR         TO  TRAC-CLIENT                     
                                                HOLD-CLIENT-NBR                 
                 MOVE ZERO                  TO  WS-PAGE-CNTR                    
              END-IF                                                            
              PERFORM WRITE-HEADER-ROUTINE                                      
              PERFORM WRITE-DETAILS-ROUTINE                                     
              PERFORM WRITE-TRAILER-ROUTINE                                     
              RETURN SORT-FILE            INTO  SD-RECORD                       
                 AT END SET EOF-SORT-FILE   TO  TRUE                            
              END-RETURN                                                        
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      **********************                                                    
       WRITE-HEADER-ROUTINE.                                                    
      **********************                                                    
                                                                                
           ADD 1                            TO  WS-PAGE-CNTR.                   
           MOVE WS-PAGE-CNTR                TO  HDR1-PAGE-NBR.                  
                                                                                
           MOVE HDR1-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE HDR2-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE HDR3-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           EJECT                                                                
      ***********************                                                   
       WRITE-DETAILS-ROUTINE.                                                   
      ***********************                                                   
                                                                                
           MOVE SD-ORG-RCV-NBR              TO  DTL1-RCV-NBR.                   
           MOVE SD-RCV-NAME                 TO  DTL1-RCV-NAME.                  
           MOVE SD-RCV-ACCT-NBR             TO  DTL1-RCV-ACCT-NBR.              
           MOVE SD-RCV-ACCT-TYPE-CD         TO  DTL1-RCV-ACCT-TYPE.             
           MOVE DTL1-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SD-ORG-DEL-NBR              TO  DTL2-DLVR-NBR.                  
           IF SD-ORG-DEL-NBR NOT = HOLD-DLVR-NBR                                
              MOVE SD-ORG-DEL-NBR           TO  WS-CLEARING-NBR                 
      *       PERFORM SEARCH-CLIENT-TABLE                                       
      *       IF CLIENT-FOUND                                                   
      *          MOVE CLIENT-NAME (S1 - 1)  TO  DTL2-DLVR-NAME                  
      *       ELSE                                                              
      *          MOVE SPACES                TO  DTL2-DLVR-NAME                  
      *       END-IF                                                            
              PERFORM GET-DELIVERER-NAME                                        
              MOVE SD-ORG-DEL-NBR           TO  HOLD-DLVR-NBR                   
           END-IF.                                                              
           MOVE SD-DLVR-ACCT-NBR            TO  DTL2-DLVR-ACCT-NBR.             
           MOVE DTL2-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL3-ACAT-CONTROL-NBR           
                                                DTL4-ASSOC-CONTROL-NBR.         
           MOVE SD-ACATS-CNTL-NBR           TO  WS-ACAT-CONTROL-NBR.            
           MOVE WS-ACAT-CONTROL-NBR-1-7     TO  WS-CONTROL-NBR-1.               
           MOVE WS-ACAT-CONTROL-NBR-8-14    TO  WS-CONTROL-NBR-2.               
           MOVE WS-CONTROL-NBR              TO  DTL3-ACAT-CONTROL-NBR           
                                                DTL4-ASSOC-CONTROL-NBR.         
           MOVE SD-TRANSFER-TYPE            TO  DTL3-TRANSFER-TYPE.             
           MOVE SPACES                      TO  DTL3-SSN-TIN-NBR.               
           MOVE SD-SSN-EIN-NBR (1:3)        TO  WS-SSN-TIN-NBR-1.               
           MOVE SD-SSN-EIN-NBR (4:2)        TO  WS-SSN-TIN-NBR-2.               
           MOVE SD-SSN-EIN-NBR (6:4)        TO  WS-SSN-TIN-NBR-3.               
           MOVE WS-SSN-TIN-NBR              TO  DTL3-SSN-TIN-NBR.               
           EVALUATE  SD-STTS-CD                                                 
              WHEN '100'                                                        
                 MOVE 'REQUEST'             TO  DTL3-STTS                       
              WHEN '110'                                                        
                 MOVE 'REQUEST ADJUST'      TO  DTL3-STTS                       
              WHEN '120'                                                        
                 MOVE 'REQUEST ADJUST PAST' TO  DTL3-STTS                       
              WHEN '130'                                                        
                 MOVE 'REQUEST PAST'        TO  DTL3-STTS                       
              WHEN '140'                                                        
                 MOVE 'REQUEST REJECT'      TO  DTL3-STTS                       
              WHEN '200'                                                        
                 MOVE 'REVIEW'              TO  DTL3-STTS                       
              WHEN '210'                                                        
                 MOVE 'REVIEW ADJUST'       TO  DTL3-STTS                       
              WHEN '220'                                                        
                 MOVE 'REVIEW ERROR'        TO  DTL3-STTS                       
              WHEN '230'                                                        
                 MOVE 'REVIEW ACCELERATE'   TO  DTL3-STTS                       
              WHEN '300'                                                        
                 MOVE 'SETTLE PREP'         TO  DTL3-STTS                       
              WHEN '310'                                                        
                 MOVE 'SETTLE CLOSE'        TO  DTL3-STTS                       
              WHEN '400'                                                        
                 MOVE 'CLOSE PURGE'         TO  DTL3-STTS                       
              WHEN '500'                                                        
                 MOVE 'MEMO-PARTIAL TRANSFER REQUEST'                           
                                            TO  DTL3-STTS                       
              WHEN '510'                                                        
                 MOVE 'MEMO PURGE PARTIAL REQUEST'                              
                                            TO  DTL3-STTS                       
               WHEN '600'                                                       
                  MOVE 'REJECT'             TO  DTL3-STTS                       
           END-EVALUATE.                                                        
           MOVE SD-DAYS-STTS-QTY            TO  DTL3-DAYS.                      
           MOVE DTL3-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL4-ASSOC-CONTROL-NBR.         
           IF SD-STTLM-DT = '0001-01-01' OR                                     
              SPACES OR LOW-VALUES                                              
              MOVE SPACES                   TO  DTL4-STTLM-DATE                 
           ELSE                                                                 
              MOVE SD-STTLM-DT              TO  WS-STTLM-DATE                   
              MOVE WS-STTLM-MM              TO  WS-DATE-MM                      
              MOVE WS-STTLM-DD              TO  WS-DATE-DD                      
              MOVE WS-STTLM-YY              TO  WS-DATE-YY                      
              MOVE WS-DATE                  TO  DTL4-STTLM-DATE                 
           END-IF.                                                              
           MOVE DTL4-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SD-CUST-NA-1 (1)            TO  DTL5-CUST-NM.                   
           MOVE DTL5-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE '0'                         TO  DTL6-CC.                        
           MOVE 'ASSET SEQ:'                TO  DTL6-COL1-NAME.                 
           MOVE SD-ASSET-SEQ-NBR            TO  DTL6-COL1-VALUE.                
           MOVE 'ASSET ID:'                 TO  DTL6-COL2-NAME.                 
           MOVE SD-SEC-ID                   TO  DTL6-COL2-VALUE.                
           MOVE 'CUST NAME/ADDR:'           TO  DTL6-COL3-NAME.                 
           MOVE SD-CUST-NA-1 (1)            TO  DTL6-COL3-VALUE.                
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'TRANS TYPE:'               TO  DTL6-COL1-NAME.                 
           EVALUATE SD-MF-TRANS-TYPE                                            
              WHEN '1'                                                          
                 MOVE 'N'                   TO  DTL6-COL1-1-BYTE                
              WHEN '2'                                                          
                 MOVE 'E'                   TO  DTL6-COL1-1-BYTE                
              WHEN '3'                                                          
                 MOVE 'D'                   TO  DTL6-COL1-1-BYTE                
              WHEN OTHER                                                        
                 MOVE SPACES                TO  DTL6-COL1-1-BYTE                
           END-EVALUATE.                                                        
           MOVE 'EXECUTING PART:'           TO  DTL6-COL2-NAME.                 
           MOVE SD-XCUTE-BRKR               TO  DTL6-COL2-4-BYTES.              
           MOVE SD-CUST-NA-2 (1)            TO  DTL6-COL3-VALUE.                
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'FRACTION IND:'             TO  DTL6-COL1-NAME.                 
           EVALUATE SD-FRCN-IND                                                 
              WHEN '1'                                                          
                 MOVE 'F'                   TO  DTL6-COL1-1-BYTE                
              WHEN '2'                                                          
                 MOVE 'T'                   TO  DTL6-COL1-1-BYTE                
              WHEN OTHER                                                        
                 MOVE ' '                   TO  DTL6-COL1-1-BYTE                
           END-EVALUATE.                                                        
           MOVE 'ACCT REP NAME:'            TO  DTL6-COL2-NAME.                 
           MOVE SD-ACCT-REP-NAME            TO  DTL6-COL2-VALUE.                
           MOVE SD-CUST-NA-1 (2)            TO  DTL6-COL3-VALUE.                
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'NRA TAX PCT:'              TO  DTL6-COL1-NAME.                 
           MOVE SD-NRA-TAX-PRCNT            TO  WS-NRA-TAX-PRCNT-AREA.          
           MOVE WS-NRA-TAX-PRCNT            TO  DTL6-COL1-2-BYTES.              
           MOVE 'ACCT REP NUM:'             TO  DTL6-COL2-NAME.                 
           MOVE SD-ACCT-REP-NBR             TO  DTL6-COL2-8-BYTES.              
           MOVE 'CUST ZIP:'                 TO  DTL6-COL3-NAME.                 
           MOVE SD-CUST-ZIP-5               TO  DTL6-COL3-VALUE (1:5).          
           MOVE '-'                         TO  DTL6-COL3-VALUE (6:1).          
           MOVE SD-CUST-ZIP-4               TO  DTL6-COL3-VALUE (7:4).          
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'DISBR-ACCRUAL:'            TO  DTL6-COL1-NAME.                 
           EVALUATE SD-ATD-ACCRU-CD                                             
              WHEN '2'                                                          
                 MOVE 'C'                   TO  DTL6-COL1-1-BYTE                
              WHEN '4'                                                          
                 MOVE 'B'                   TO  DTL6-COL1-1-BYTE                
              WHEN OTHER                                                        
                 MOVE ' '                   TO  DTL6-COL1-1-BYTE                
           END-EVALUATE.                                                        
           MOVE 'BRANCH ID:'                TO  DTL6-COL2-NAME.                 
           MOVE SD-BRANCH-ID-NBR            TO  DTL6-COL2-8-BYTES.              
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'DISBR-FRAC/CSH:'           TO  DTL6-COL1-NAME.                 
           MOVE SD-ATD-CASH-CD              TO  DTL6-COL1-1-BYTE.               
           MOVE 'SALE STATE:'               TO  DTL6-COL2-NAME.                 
           MOVE SD-STATE-CODE               TO  DTL6-COL2-2-BYTES.              
           MOVE '----- PAYABLE DATA (1) -----'                                  
                                            TO  DTL6-COL3-2.                    
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'DISBR-RESIDUAL:'           TO  DTL6-COL1-NAME.                 
           MOVE SD-ATD-RESDU-CD             TO  DTL6-COL1-1-BYTE.               
           MOVE 'ORIGIN CNTRY:'             TO  DTL6-COL2-NAME.                 
           MOVE SD-CNTRY-CODE               TO  DTL6-COL2-2-BYTES.              
           MOVE 'PAY ACCT NUM:'             TO  DTL6-COL3-NAME.                 
           MOVE SD-PAY-ACCT-NBR (1)         TO  DTL6-COL3-8-BYTES.              
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'BOOK/PHYS:'                TO  DTL6-COL1-NAME.                 
           EVALUATE SD-SHARE-IND                                                
              WHEN '0'                                                          
                 MOVE 'B'                   TO  DTL6-COL1-1-BYTE                
              WHEN '1'                                                          
                 MOVE 'F'                   TO  DTL6-COL1-1-BYTE                
              WHEN '2'                                                          
                 MOVE 'P'                   TO  DTL6-COL1-1-BYTE                
              WHEN OTHER                                                        
                 MOVE SPACES                TO  DTL6-COL1-1-BYTE                
           END-EVALUATE.                                                        
           MOVE 'CUST NAME:'                TO  DTL6-COL2-NAME.                 
           MOVE SD-CUST-NAME                TO  DTL6-COL2-VALUE.                
           MOVE 'PAY ACCT IND:'             TO  DTL6-COL3-NAME.                 
           MOVE SD-PAY-ACCT-IND (1)         TO  DTL6-COL3-1-BYTE.               
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'PI DEL:'                   TO  DTL6-COL1-NAME.                 
           MOVE SD-PI-DEL-IND               TO  DTL6-COL1-1-BYTE.               
           EVALUATE SD-PI-DEL-IND                                               
              WHEN '0'                                                          
                 MOVE 'C'                   TO  DTL6-COL1-1-BYTE                
              WHEN '1'                                                          
                 MOVE 'B'                   TO  DTL6-COL1-1-BYTE                
              WHEN '2'                                                          
                 MOVE 'E'                   TO  DTL6-COL1-1-BYTE                
              WHEN OTHER                                                        
                 MOVE ' '                   TO  DTL6-COL1-1-BYTE                
           END-EVALUATE.                                                        
           MOVE 'FUND CUST ACCT:'           TO  DTL6-COL2-NAME.                 
           MOVE SD-FND-CUST-ACCT-NBR        TO  DTL6-COL2-VALUE.                
           MOVE 'PAY ADDR OPT:'             TO  DTL6-COL3-NAME.                 
           MOVE SD-PAY-ADDR-OPT (1)         TO  DTL6-COL3-1-BYTE.               
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'TPA NUM:'                  TO  DTL6-COL1-NAME.                 
           MOVE SD-TPA-NBR                  TO  DTL6-COL1-4-BYTES.              
           MOVE 'FUND ACCT IND:'            TO  DTL6-COL2-NAME.                 
           MOVE SD-FND-ACCT-IND             TO  DTL6-COL2-1-BYTE.               
           MOVE 'PAY ALT IND:'              TO  DTL6-COL3-NAME.                 
           MOVE SD-ALT-PAYA-IND (1)         TO  DTL6-COL3-VALUE.                
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'NETWORK CTL:'              TO  DTL6-COL1-NAME.                 
           MOVE SD-NETWRK-CNTL-IND          TO  DTL6-COL1-1-BYTE.               
           MOVE 'SSN/EIN:'                  TO  DTL6-COL2-NAME.                 
           MOVE SPACES                      TO  DTL6-COL2-VALUE.                
           MOVE SD-SSN-EIN-NBR (1:3)        TO  DTL6-COL2-VALUE (1:3).          
           MOVE '-'                         TO  DTL6-COL2-VALUE (4:1).          
           MOVE SD-SSN-EIN-NBR (4:2)        TO  DTL6-COL2-VALUE (5:2).          
           MOVE '-'                         TO  DTL6-COL2-VALUE (7:1).          
           MOVE SD-SSN-EIN-NBR (6:4)        TO  DTL6-COL2-VALUE (8:4).          
           MOVE 'PAY ALT REASON:'           TO  DTL6-COL3-NAME.                 
           MOVE SD-ALT-PAY-REASON (1)       TO  DTL6-COL3-VALUE.                
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'DIVD CDE:'                 TO  DTL6-COL1-NAME.                 
           MOVE SD-DVDND-CD                 TO  DTL6-COL1-1-BYTE.               
           MOVE 'SSN/EIN IND:'              TO  DTL6-COL2-NAME.                 
           IF SD-SSN-EIN-IND = '0'                                              
              MOVE 'T'                      TO  DTL6-COL2-1-BYTE                
           ELSE                                                                 
              IF SD-SSN-EIN-IND = '1'                                           
                 MOVE 'S'                   TO  DTL6-COL2-1-BYTE                
              ELSE                                                              
                 MOVE ' '                   TO  DTL6-COL2-1-BYTE                
              END-IF                                                            
           END-IF                                                               
           MOVE 'PAY ASSET ID:'             TO  DTL6-COL3-NAME.                 
           MOVE SPACES                      TO  DTL6-COL3-VALUE.                
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'WITHHOLD IND:'             TO  DTL6-COL1-NAME.                 
           MOVE SD-WITHOLD-IND              TO  DTL6-COL1-1-BYTE.               
           MOVE 'ROA/LOI:'                  TO  DTL6-COL2-NAME.                 
           MOVE SD-ROA-LOI-VALUE            TO  WS-ROA-LOI-VALUE.               
           MOVE WS-ROA-LOI-VALUE-INT (4:11) TO  WS-ROA-LOI-AMT-INT.             
           MOVE WS-ROA-LOI-VALUE-DEC        TO  WS-ROA-LOI-AMT-DEC.             
           MOVE WS-ROA-LOI-AMT              TO  DTL6-COL2-ROALOI.               
           MOVE 'PAY NAME/ADDR:'            TO  DTL6-COL3-NAME.                 
           MOVE SD-PBL-NA-1 (1, 1)          TO  DTL6-COL3-VALUE.                
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'PAYABLE INFO:'             TO  DTL6-COL1-NAME.                 
           EVALUATE SD-PAYABLE-IND                                              
              WHEN '0'                                                          
                 MOVE 'R'                   TO  DTL6-COL1-1-BYTE                
              WHEN '1'                                                          
                 MOVE 'P'                   TO  DTL6-COL1-1-BYTE                
              WHEN '2'                                                          
                 MOVE 'A'                   TO  DTL6-COL1-1-BYTE                
              WHEN '3'                                                          
                 MOVE 'C'                   TO  DTL6-COL1-1-BYTE                
              WHEN '4'                                                          
                 MOVE 'X'                   TO  DTL6-COL1-1-BYTE                
           END-EVALUATE.                                                        
           MOVE 'LOI DATE:'                 TO  DTL6-COL2-NAME.                 
           MOVE SPACES                      TO  DTL6-COL2-VALUE.                
           IF SD-LOI-NBR-DATE > SPACES                                          
              MOVE SD-LOI-NBR-DATE (5:2) TO DTL6-COL2-VALUE (1:2)               
              MOVE '/'                       TO DTL6-COL2-VALUE (3:1)           
              MOVE SD-LOI-NBR-DATE (7:2) TO DTL6-COL2-VALUE (4:2)               
              MOVE '/'                       TO DTL6-COL2-VALUE (6:1)           
              MOVE SD-LOI-NBR-DATE (1:4) TO DTL6-COL2-VALUE (7:4)               
           END-IF.                                                              
           MOVE SPACES                      TO  DTL6-COL3-NAME.                 
           MOVE SD-PBL-NA-2 (1, 1)          TO  DTL6-COL3-VALUE.                
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'SOCIAL CDE:'               TO  DTL6-COL1-NAME.                 
           MOVE SD-SOCIAL-CODE              TO  DTL6-COL1-2-BYTES.              
           MOVE 'RELATED ACCT:'             TO  DTL6-COL2-NAME.                 
           MOVE SD-RLT-ACCT-NBR             TO  DTL6-COL2-VALUE.                
           MOVE SD-PBL-NA-1 (2, 1)          TO  DTL6-COL3-VALUE.                
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'NAV IND:'                  TO  DTL6-COL1-NAME.                 
           EVALUATE SD-NAV-ACCT-IND                                             
              WHEN '0'                                                          
                 MOVE 'N'                   TO  DTL6-COL1-1-BYTE                
              WHEN '1'                                                          
                 MOVE 'Y'                   TO  DTL6-COL1-1-BYTE                
              WHEN OTHER                                                        
                 MOVE ' '                   TO  DTL6-COL1-1-BYTE                
           END-EVALUATE.                                                        
           MOVE 'REL ACCT IND:'             TO  DTL6-COL2-NAME.                 
           MOVE SD-RLT-ACCT-IND             TO  DTL6-COL2-1-BYTE.               
           MOVE 'PAY ZIP:'                  TO  DTL6-COL3-NAME.                 
           MOVE SPACES                      TO  DTL6-COL3-VALUE.                
           MOVE SD-PAY-ZIP-5 (1)            TO  DTL6-COL3-VALUE (1:5).          
           IF SD-PAY-ZIP-4 (1) = SPACES OR LOW-VALUES                           
              MOVE SPACES                   TO  DTL6-COL3-VALUE                 
           ELSE                                                                 
              MOVE '-'                      TO  DTL6-COL3-VALUE (6:1)           
              MOVE SD-PAY-ZIP-4 (1)         TO  DTL6-COL3-VALUE (7:4)           
           END-IF                                                               
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'MARGIN IND:'               TO  DTL6-COL1-NAME.                 
           MOVE SD-MARGN-ACCT-IND           TO  DTL6-COL1-1-BYTE.               
           MOVE 'REL TRADE IND:'            TO  DTL6-COL2-NAME.                 
           MOVE SD-RLT-TRADE-IND            TO  DTL6-COL2-1-BYTE.               
           MOVE SPACES                      TO  DTL6-COL3-VALUE.                
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'SWP IND:'                  TO  DTL6-COL1-NAME.                 
           MOVE SD-SWP-IND                  TO  DTL6-COL1-1-BYTE.               
           MOVE 'SWP/PAC EFF DTE:'          TO  DTL6-COL2-NAME.                 
           MOVE SPACES                      TO  DTL6-COL2-VALUE.                
           IF SD-SWP-PAC-EFF-DT > SPACES                                        
              MOVE SD-SWP-PAC-EFF-DT (5:2)                                      
                                            TO  DTL6-COL2-VALUE (1:2)           
              MOVE '/'                      TO  DTL6-COL2-VALUE (3:1)           
              MOVE SD-SWP-PAC-EFF-DT (7:2)                                      
                                            TO  DTL6-COL2-VALUE (4:2)           
              MOVE '/'                      TO  DTL6-COL2-VALUE (6:1)           
              MOVE SD-SWP-PAC-EFF-DT (1:4)                                      
                                            TO  DTL6-COL2-VALUE (7:4)           
           END-IF.                                                              
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'ACH IND:'                  TO  DTL6-COL1-NAME.                 
           MOVE SD-ACH-IND                  TO  DTL6-COL1-1-BYTE.               
           MOVE 'MEMO TEXT:'                TO  DTL6-COL2-NAME.                 
           MOVE SD-MEMO-TEXT                TO  DTL6-COL2-VALUE.                
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'PAC IND:'                  TO  DTL6-COL1-NAME.                 
           MOVE SD-PAC-IND                  TO  DTL6-COL1-1-BYTE.               
           MOVE 'DISBR AMT:'                TO  DTL6-COL2-NAME.                 
           MOVE SD-DISBURS-AMT              TO  WS-DISBURS-AMT-AREA.            
           EVALUATE SD-DISBURS-OPT-CD                                           
              WHEN '0'                                                          
                 MOVE WS-DISBURS-AMT-0      TO  DTL6-COL2-DISBURS-AMT-0         
              WHEN '1'                                                          
                 MOVE WS-DISBURS-AMT-1      TO  DTL6-COL2-DISBURS-AMT-1         
              WHEN '2'                                                          
                  MOVE WS-DISBURS-AMT-2     TO  DTL6-COL2-DISBURS-AMT-2         
               WHEN '3'                                                         
                   MOVE WS-DISBURS-AMT-2    TO  DTL6-COL2-DISBURS-AMT-2         
           END-EVALUATE.                                                        
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'SWP IND:'                  TO  DTL6-COL1-NAME.                 
           MOVE SD-SWP-IND                  TO  DTL6-COL1-1-BYTE.               
           MOVE 'MTHLY PYMT:'               TO  DTL6-COL2-NAME.                 
           MOVE SD-MNTHLY-PAY-INDS          TO  DTL6-COL2-12-BYTES.             
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'CDSC PYMT:'                TO  DTL6-COL1-NAME.                 
           EVALUATE SD-CDSC-PAYMNT-CD                                           
              WHEN '0'                                                          
                 MOVE 'G'                   TO  DTL6-COL1-1-BYTE                
              WHEN '1'                                                          
                 MOVE 'N'                   TO  DTL6-COL1-1-BYTE                
              WHEN '2'                                                          
                 MOVE ' '                   TO  DTL6-COL1-1-BYTE                
              WHEN OTHER                                                        
                 MOVE SPACES                TO  DTL6-COL1-1-BYTE                
           END-EVALUATE.                                                        
           MOVE 'PYMT DAY:'                 TO  DTL6-COL2-NAME.                 
           MOVE SD-PAY-DATE-VAL             TO  DTL6-COL2-2-BYTES.              
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'DISBR OPTION:'             TO  DTL6-COL1-NAME.                 
           MOVE SD-DISBURS-OPT-CD           TO  DTL6-COL1-1-BYTE.               
           EVALUATE SD-DISBURS-OPT-CD                                           
              WHEN '0'                                                          
                 MOVE 'C'                   TO  DTL6-COL1-1-BYTE                
              WHEN '1'                                                          
                 MOVE 'P'                   TO  DTL6-COL1-1-BYTE                
              WHEN '2'                                                          
                 MOVE 'S'                   TO  DTL6-COL1-1-BYTE                
              WHEN '3'                                                          
                 MOVE 'D'                   TO  DTL6-COL1-1-BYTE                
              WHEN OTHER                                                        
                 MOVE SPACES                TO  DTL6-COL1-1-BYTE                
           END-EVALUATE.                                                        
           MOVE 'SHRHLD BNK ACCT:'          TO  DTL6-COL2-NAME.                 
           MOVE SD-SHRHLDR-BNK-ACCT-NBR TO      DTL6-COL2-VALUE.                
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'RETIRE TAX CDE:'           TO  DTL6-COL1-NAME.                 
           MOVE SD-RETIRE-TAX-CD            TO  DTL6-COL1-2-BYTES.              
           MOVE 'SHRHLD ACCT TYP:'          TO  DTL6-COL2-NAME.                 
           MOVE SD-SHRHLDR-BNK-ACCT-TYPE TO DTL6-COL2-1-BYTE.                   
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'COST BASIS:'               TO  DTL6-COL1-NAME.                 
           EVALUATE SD-COST-BASIS-CD                                            
              WHEN '1'                                                          
                 MOVE 'U'                   TO  DTL6-COL1-1-BYTE                
              WHEN '2'                                                          
                 MOVE 'F'                   TO  DTL6-COL1-1-BYTE                
              WHEN '3'                                                          
                 MOVE 'L'                   TO  DTL6-COL1-1-BYTE                
              WHEN '4'                                                          
                 MOVE 'H'                   TO  DTL6-COL1-1-BYTE                
              WHEN '5'                                                          
                 MOVE 'B'                   TO  DTL6-COL1-1-BYTE                
              WHEN '6'                                                          
                 MOVE 'O'                   TO  DTL6-COL1-1-BYTE                
              WHEN OTHER                                                        
                 MOVE SPACES                TO  DTL6-COL1-1-BYTE                
           END-EVALUATE.                                                        
           MOVE 'ABA ROUTE NUM:'            TO  DTL6-COL2-NAME.                 
           MOVE SD-ABA-ROUTE-NBR            TO  DTL6-COL2-VALUE.                
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE SPACES                      TO  DTL6-RECORD.                    
           MOVE 'NUM OF PAYABLES:'          TO  DTL6-COL1-NAME.                 
           MOVE SD-NBR-OF-PAYABLES          TO  DTL6-COL1-2-BYTES.              
           MOVE 'FIRST CHK DTE:'            TO  DTL6-COL2-NAME.                 
           MOVE SPACES                      TO  DTL6-COL2-VALUE.                
           IF SD-1ST-CHECK-DATE = SPACES OR LOW-VALUES OR ZEROES                
              CONTINUE                                                          
           ELSE                                                                 
              MOVE SD-1ST-CHECK-DATE (5:2)                                      
                                            TO  DTL6-COL2-VALUE (1:2)           
              MOVE '/'                      TO  DTL6-COL2-VALUE (3:1)           
              MOVE SD-1ST-CHECK-DATE (7:2)                                      
                                            TO  DTL6-COL2-VALUE (4:2)           
              MOVE '/'                      TO  DTL6-COL2-VALUE (6:1)           
              MOVE SD-1ST-CHECK-DATE (1:4)                                      
                                            TO  DTL6-COL2-VALUE (7:4)           
           END-IF.                                                              
           MOVE DTL6-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           EJECT                                                                
      ***********************                                                   
       WRITE-TRAILER-ROUTINE.                                                   
      ***********************                                                   
                                                                                
           MOVE TRL1-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE TRL2-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           EJECT                                                                
      *********************                                                     
       SEARCH-CLIENT-TABLE.                                                     
      *********************                                                     
                                                                                
           SET CLIENT-NOT-FOUND             TO  TRUE.                           
                                                                                
           PERFORM VARYING S1 FROM 1 BY 1                                       
              UNTIL (S1 > CLIENT-TABLE-CNTR) OR CLIENT-FOUND                    
              IF WS-CLEARING-NBR = CLIENT-CLEARING-NBR (S1)                     
                 SET CLIENT-FOUND           TO  TRUE                            
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           IF CLIENT-NOT-FOUND                                                  
              DISPLAY '*********************************************'           
              DISPLAY '* CLEARING NUMBER ' WS-CLEARING-NBR                      
                      ' IS NOT ON ADP FILES! *'                                 
              DISPLAY '*********************************************'           
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ********************                                                      
       GET-DELIVERER-NAME.                                                      
      ********************                                                      
                                                                                
           EXEC SQL                                                             
              SELECT PRTCP_NM                                                   
              INTO  :WS-PRTCP-NM                                                
              FROM   VPRTCPPF                                                   
              WHERE  PRTCP_NBR = :SD-ORG-DEL-NBR                                
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = -911                                                    
              PERFORM VARYING S1 FROM 1 BY 1                                    
                 UNTIL S1 > 10 OR                                               
                 SQLCODE NOT = -911                                             
                 EXEC SQL                                                       
                    SELECT PRTCP_NM                                             
                    INTO  :WS-PRTCP-NM                                          
                    FROM   VPRTCPPF                                             
                    WHERE  PRTCP_NBR = :SD-ORG-DEL-NBR                          
                 END-EXEC                                                       
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           IF SQLCODE = +0                                                      
              MOVE WS-PRTCP-NM              TO  DTL2-DLVR-NAME                  
           ELSE                                                                 
              PERFORM SEARCH-CLIENT-TABLE                                       
              IF CLIENT-FOUND                                                   
                 MOVE CLIENT-NAME (S1)      TO  DTL2-DLVR-NAME                  
              ELSE                                                              
                 MOVE SPACES                TO  DTL2-DLVR-NAME                  
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ********************                                                      
       BUILD-CLIENT-TABLE.                                                      
      ********************                                                      
                                                                                
           MOVE ZEROES                      TO  S1.                             
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500                
              MOVE SPACES                   TO  BH-BROKER-HEADER-INFO           
              MOVE B1-SUB                   TO  BH-BROKER-NUMBER                
              MOVE '010'                    TO  BH-LOGICAL-RECORD-CODE          
              MOVE '434500'                 TO  BH-B2-INFO-ID                   
              CALL  GETB1V               USING  BH-BROKER-HEADER-INFO           
                                                                                
              IF BH-BROKER-ACTIVE                                               
                 ADD 1                      TO  S1                              
                 MOVE BH-BROKER-NUMBER      TO  CLIENT-NUM (S1)                 
                 MOVE BH-BROKER-NAME        TO  CLIENT-NAME (S1)                
                 MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                        
                                            TO  CLIENT-CLEARING-NBR (S1)        
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           MOVE S1                          TO  CLIENT-TABLE-CNTR.              
                                                                                
           EJECT                                                                
      *******************                                                       
       DB2-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           CALL DSNTIAR               USING  SQLCA                              
                                             WS-DB2-MESSAGE-AREA                
                                             WS-ERR-LINE-LEN.                   
                                                                                
           DISPLAY ' '                                                          
                                                                                
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
              UNTIL WS-ERROR-INDEX GREATER THAN 12                              
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                      
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)                
                 END-IF                                                         
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      *****************                                                         
       INITIAL-ROUTINE.                                                         
      *****************                                                         
                                                                                
           OPEN INPUT  FR-INPUT                                                 
                OUTPUT FR-REPORT.                                               
                                                                                
           READ FR-INPUT                  INTO  NSCC-HDR-RECORD                 
              AT END  SET EOF-FR-INPUT      TO  TRUE                            
           END-READ.                                                            
                                                                                
           IF EOF-FR-INPUT                                                      
              DISPLAY ' '                                                       
              DISPLAY '***************************************'                 
              DISPLAY '* NSCC INBOUND FILE HEADER IS MISSING *'                 
              DISPLAY '* PROGRAM IS ABENDING!                *'                 
              DISPLAY '***************************************'                 
              CALL ABEND                 USING  ABEND-CODE                      
           END-IF.                                                              
                                                                                
           EXEC SQL                                                             
              SET :WS-DATE-TIME = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE SPACES                   TO  HDR1-PROC-DATE                  
           ELSE                                                                 
              DISPLAY '***********************************************'         
              DISPLAY '* RUN DATE & TIME: ' WS-DATE-TIME ' *'                   
              DISPLAY '***********************************************'         
              MOVE WS-PROC-MM               TO  WS-DATE-MM                      
              MOVE WS-PROC-DD               TO  WS-DATE-DD                      
              MOVE WS-PROC-YY               TO  WS-DATE-YY                      
              MOVE WS-DATE                  TO  HDR1-PROC-DATE                  
           END-IF.                                                              
                                                                                
           PERFORM BUILD-CLIENT-TABLE.                                          
                                                                                
           MOVE WS-TIME-HH                  TO  HDR2-HH.                        
           MOVE WS-TIME-MM                  TO  HDR2-MM.                        
           MOVE WS-TIME-SS                  TO  HDR2-SS.                        
                                                                                
           MOVE NSCCDHDR-SUBMIT-DATE        TO  WS-SUBMIT-DATE.                 
           MOVE WS-SUBMIT-MM                TO  HDR3-SUBMIT-MM.                 
           MOVE WS-SUBMIT-DD                TO  HDR3-SUBMIT-DD.                 
           MOVE WS-SUBMIT-CC                TO  HDR3-SUBMIT-CC.                 
           MOVE WS-SUBMIT-YY                TO  HDR3-SUBMIT-YY.                 
                                                                                
           MOVE NSCCDHDR-MULTI-BATCH-NBR    TO  WS-CYCLE-NBR-AREA.              
           MOVE WS-CYCLE-NBR                TO  HDR3-CYCLE-NBR                  
                                                TRAC-CYCLE.                     
                                                                                
           READ FR-INPUT                  INTO  NSCCFR-AREA                     
              AT END SET EOF-FR-INPUT       TO  TRUE                            
           END-READ.                                                            
                                                                                
           MOVE LOW-VALUES                  TO  HOLD-RCV-NBR.                   
                                                                                
           EJECT                                                                
      *************                                                             
       EOJ-ROUTINE.                                                             
      *************                                                             
                                                                                
           CLOSE FR-INPUT                                                       
                 FR-REPORT.                                                     
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '*************************************'.                     
           DISPLAY '* CAT500R: COMPLETION IS SUCCESSFUL *'.                     
           DISPLAY '*************************************'.                     
                                                                                
