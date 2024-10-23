000001* PDX    - ACAT03DB C0330859 10/09/12 15:39:27 TBLAMUR            00001000
LRM018* SSR 85105 USE 12 ISIN ON DATABASE FOR A FOREIGN ISIN (NON US).          
000001* PDX    - ACAT03DB C0289853 01/05/10 14:04:54 TBLAMUR            00001000
LRM017* SSR 59603 OPTION SYMBOLOGY CHANGES.                                     
LRM016*   REMOVE TCICSRJE AND TCICSQUA HARD CODE.                               
000001* PDX    - ACAT03DB C0286335 10/30/09 07:19:41 TBLAMUR            00001000
LRM016* SSR 59603 OPTION SYMBOLOGY CHANGES.                                     
LRM016*   TCICSRJE AND TCICSQUA HARD CODE AT THIS TIME.                         
LRM016*   CHANGE ASSET DESC FORMATTING ON ADDITIONAL MSD LINES.                 
LRM016*   USE EXPANDED STRIKE PRICE FROM MSD.                                   
LRM016*   CHANGE SYMBOL TO MSD-OCC-OPTN-SYM-ID AND IF MISSING,                  
LRM016*   CALL MSD FOR ROOT SYMBOL.                                             
000001* PDX    - ACAT03DB C0275533 01/26/09 18:04:44 TBLAMUR            00001000
000001* PDX    - ACAT03DB C0272581 12/03/08 15:52:30 TBLAMUR            00001000
LRM015* SSR 61164 ALLOW PTF INITIATION.                                         
000001* PDX    - ACAT03DB C0267683 08/14/08 07:51:42 TBLAMUR            00001000
000001* PDX    - ACAT03DB C0263391 04/03/08 08:38:25 TBLAMUR            00001000
LRM014* SSR 55766 ASCENDIS INTERFACE. WIPE ACK_IND ON UPDATE.                   
000001* PDX    - ACAT03DB C0231507 04/07/06 09:32:52 TBLAMUR            00001000
LRM013* SSR 40661 RETAIN USER ID OF INITIATOR.                                  
000001* PDX    - ACAT03DB C0230641 02/13/06 10:53:18 TBLAMUR            00001000
LRM012* SSR# 40943 UPGRADE OPTION LOGIC                                         
000001* PDX    - ACAT03DB C0227932 12/14/05 15:55:32 TBLAMUR            00001000
LRM009* SSR# 45207 ALLOW FULL REQUEST OF CASH ASSET.                            
000001* PDX    - ACAT03DB C0225533 10/10/05 10:23:41 TBLAMUR            00001000
000001* PDX    - ACAT03DB C0216396 06/10/05 14:41:29 TBLAMUR            00001000
LRM007* SSR# 39561 ALLOW DUPLICATE PTR ENTRY.                                   
000001* PDX    - ACAT03DB C0215192 12/29/04 08:22:50 TBLAMUR            00001000
LRM002* SSR# 40042 USE NEW INITIAL TABLES / PHASE II.                           
000001* PDX    - ACAT03DB C0211811 10/14/04 09:17:32 TBLAMUR            00001000
LRM001* PMR P2297710 -811 ON DUP ACTIVE PTRS. IGNORE 300,310,510,600            
000001* PDX    - ACAT03DB C0157031 04/06/01 14:39:41 TBLAMUR            00001000
000001* PDX    - ACAT03DB C0124874 08/24/99 10:34:18 TBLAMUR            00001000
000001* PDX    - ACAT03DB C0120327 01/28/99 17:08:52 TBLAMUR            00001000
000001* PDX    - ACAT03DB C0119769 01/05/99 10:50:19 TBLAMUR            00001000
000001* PDX    - ACAT03DB C0109165 09/03/98 14:32:42 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID.    ACAT03DB.                                         00020000
       AUTHOR.        LARRY MUREY.                                      00030000
       DATE-WRITTEN.                                                    00040000
       DATE-COMPILED.                                                   00050000
      *---------------------------------------------------------------* 00060000
      *   THIS IS THE ACATS I/O MODULE FOR DB/2 DATABASE ACCESS       * 00070000
      *   FOR INITIAL PARTIAL TRANSFERS.                              * 00070000
      ***************************************************************** 00290000
       ENVIRONMENT DIVISION.                                            00420000
                                                                        00430000
       DATA DIVISION.                                                   00440000
                                                                        00450000
       WORKING-STORAGE SECTION.                                         00460000
       COPY PDXIDCOB.                                                   00120002
       01  FILLER                          PIC X(60)                    00470000
           VALUE 'ACAT03DB WORKING STORAGE BEGINS HERE'.                00480000
       77  WS-ACATSRCH                    PIC X(08) VALUE 'ACATSRCH'.   00140002
                                                                        00490000
           SKIP3                                                        00540000
       01  WS-ABEND-MESSAGE.                                            00550000
           05  FILLER                      PIC X(24) VALUE                      
             'ACAT03DB DETECTED ABEND'.                                         
           05  WS-ABCODE                   PIC X(04) VALUE 'XXXX'.              
                                                                                
       01  WS-ERRL-DATA.                                                        
           05  REQUEST-TYPE                PIC X(01).                           
               88  WRITE-ERROR-TO-LOG          VALUE 'W'.                       
           05  CALLING-TRAN-ID             PIC X(04).                           
           05  CALLING-PROGRAM-ID          PIC X(08).                           
           05  SQLCA-AREA                  PIC X(136).                          
       01  WS-WORK-AREA.                                                        
           05  WS-TIMESTAMP                PIC X(26).                           
           05  WS-BRANCH                   PIC X(3)  VALUE SPACES.              
           05  WS-EIBCALEN                 PIC S9(8) COMP.                      
LRM007     05  WS-NEXT-CNTL-NBR            PIC 9(3)  VALUE  001.                
LRM007     05  WS-TRANS-RFRN-ID-CD         PIC X(20).                           
LRM007     05  SUB                         PIC S9(3) COMP-3.                    
LRM007     05  SUB2                        PIC S9(3) COMP-3.                    
LRM012     05  SUB3                        PIC S9(3) COMP-3.                    
LRM008     05  WS-DUPE-ACAT-CONTROL-NBR    PIC X(14).                           
LRM008     05  WS-DUPE-ASSET-SW            PIC X(01)  VALUE 'N'.                
LRM008         88  ASSET-NOT-ON-OTHER-PTR             VALUE 'N'.                
LRM008         88  ASSET-ON-OTHER-PTR                 VALUE 'Y'.                
                                                                                
LRM012 01  WK-OPTION-FILEDS.                                                    
LRM012     05  WK-MS-CLASS.                                                     
LRM012         10  WK-MS-CLASS-1       PIC 9.                                   
LRM012         10  WK-MS-CLASS-2-5     PIC 9(4).                                
LRM012         10  WK-MS-CLASS-6-7     PIC 9(2).                                
LRM012     05  FILLER                  REDEFINES WK-MS-CLASS.                   
LRM012         10  WK-MS-CLASS-1-2-3   PIC 9(3).                                
LRM012         10  WK-MS-CLASS-4       PIC 9.                                   
LRM012         10  WK-MS-CLASS-5-7     PIC 9(3).                                
LRM012     05  FILLER                  REDEFINES WK-MS-CLASS.                   
LRM012         10  FILLER              PIC 9.                                   
LRM012         10  WK-MS-CLASS-2       PIC 9.                                   
LRM012         10  WK-MS-CLASS-3-4     PIC 9(2).                                
LRM012         10  WK-MS-CLASS-5       PIC 9.                                   
LRM012         10  WK-MS-CLASS-6       PIC 9.                                   
LRM012         10  WK-MS-CLASS-7       PIC 9.                                   
LRM012     05  FILLER                  REDEFINES WK-MS-CLASS.                   
LRM012         10  WK-MS-CLASS-1-2     PIC 9(2).                                
LRM012         10  FILLER              PIC 9(2).                                
LRM012         10  WK-MS-CLASS-5-6-7   PIC 9(3).                                
LRM012     05  FILLER                  REDEFINES WK-MS-CLASS.                   
LRM012         10  FILLER              PIC 9(3).                                
LRM012         10  WK-MS-CLASS-4-5     PIC 9(2).                                
LRM012         10  FILLER              PIC 9(2).                                
LRM012     05  WK-MS-SEC-TYPE-P        PIC 9(5)   COMP-3  VALUE 0.              
LRM012     05  FILLER                  REDEFINES WK-MS-SEC-TYPE-P.              
LRM012         10  WK-MS-SEC-TYPE-X    PIC X(2).                                
LRM012         10  FILLER              PIC 9.                                   
LRM012     05  WK-MS-SEC-TYPE-N        PIC 9(5)   VALUE 0.                      
LRM012     05  FILLER                  REDEFINES WK-MS-SEC-TYPE-N.              
LRM012         10  WK-MS-SEC-TYPE      PIC 9(4).                                
LRM012         10  FILLER              PIC 9.                                   
LRM012     05  WK-MS-ASSET-TYPE        PIC X         VALUE '0'.                 
LRM012         88  WK-MS-NON-OPT       VALUE '0'.                               
LRM012         88  WK-MS-EQUITY-OPT    VALUE '1'.                               
LRM012         88  WK-MS-NON-EQU-OPT   VALUE '2'.                               
LRM012     05  W-DATE.                                                          
LRM012         07  W-DATE-YEAR.                                                 
LRM012             09  W-DATE-CC         PIC X(2) VALUE ' '.                    
LRM012             09  W-DATE-YY         PIC X(2) VALUE ' '.                    
LRM012         07  FILLER                PIC X(1) VALUE '-'.                    
LRM012         07  W-DATE-MM             PIC X(2) VALUE ' '.                    
LRM012         07  FILLER                PIC X(1) VALUE '-'.                    
LRM012         07  W-DATE-DD             PIC X(2) VALUE ' '.                    
LRM012     05  WK-MS-DESC1                           VALUE SPACE.               
LRM012         10  WK-MS-PUT-CALL      PIC X(4).                                
LRM012         10  FILLER              PIC X(26).                               
LRM012     05  WK-MS-DESC2             PIC X(30)     VALUE SPACE.               
LRM012     05  WK-MS-DESC3             PIC X(30)     VALUE SPACE.               
LRM012     05  WK-MS-CLOSING-PRICE     PIC 9(4)V9(7) COMP-3 VALUE ZERO.         
LRM012     05  WK-POS-DESC4            PIC X(30)     VALUE SPACE.               
LRM012     05  WK-POS-DESC5.                                                    
LRM012         10  FILLER              PIC X(08) VALUE 'ADP-SEC:'.              
LRM012         10  WK-POS-DESC5-SEC    PIC X(07) VALUE ' '.                     
LRM012         10  WK-POS-DESC5-FIL    PIC X(05) VALUE ' '.                     
LRM012     05  WK-MS-EXP-DATE          PIC 9(8)      VALUE ZERO.                
LRM012     05  FILLER                  REDEFINES WK-MS-EXP-DATE.                
LRM012         10  FILLER              PIC 9(3).                                
LRM012         10  WK-MS-EXP-Y         PIC X(1).                                
LRM012         10  WK-MS-EXP-MM        PIC X(2).                                
LRM012         10  FILLER              PIC 9(2).                                
LRM016     05  FILLER REDEFINES WK-MS-EXP-DATE.                                 
LRM016         10  WK-MS-EXP-CC-NEW    PIC X(2).                                
LRM016         10  WK-MS-EXP-YY-NEW    PIC X(2).                                
LRM016         10  WK-MS-EXP-MM-NEW    PIC X(2).                                
LRM016         10  WK-MS-EXP-DD-NEW    PIC X(2).                                
LRM012     05  WK-MS-OPT-MMY                         VALUE ZERO.                
LRM012         10  WK-MS-OPT-MM        PIC X(2).                                
LRM012         10  WK-MS-OPT-Y         PIC X(1).                                
LRM012     05  WK-MS-OPT-PRICE         PIC S9(4)V9(5) VALUE ZERO.               
LRM012     05  FILLER                  REDEFINES WK-MS-OPT-PRICE.               
LRM012         10  WK-MS-OPT-PRC       PIC 9(4).                                
LRM012         10  WK-MS-OPT-FRAC      PIC 9(5).                                
LRM012     05  WK-MS-OPT-FRAC-6        PIC 9(6) VALUE ZEROS.                    
LRM012     05  FILLER REDEFINES    WK-MS-OPT-FRAC-6.                            
LRM012         10  WK-MS-OPT-FRAC-1    PIC 9.                                   
LRM012         10  FILLER              PIC 9(5).                                
LRM016     05  WK-MS-OPT-PRICE-NEW     PIC 9(5)V9(3) VALUE ZERO.                
LRM016     05  FILLER                  REDEFINES WK-MS-OPT-PRICE-NEW.           
LRM016         10  WK-MS-OPT-PRC-NEW   PIC 9(5).                                
LRM016         10  WK-MS-OPT-FRAC-NEW  PIC 9(3).                                
LRM016     05  WS-REGION-NAME          PIC X(08) VALUE SPACES.                  
LRM012     05  WK-MS-OPT-DECI-ROUNDED  PIC 9(2).                                
LRM012     05  WK-MS-OPTION-FACTOR     PIC S9(3)V9(4)  COMP-3.                  
LRM012     05  W-STPRC-INTEGER-AMT       PIC 9(05).                             
LRM012     05  W-STPRC-FRCTN.                                                   
LRM012         07  W-STPRC-FRCTN-AMT     PIC 9(02).                             
LRM012     05  W-OPT-DESC.                                                      
LRM012         07  W-OPT-BUY-SELL        PIC X(04) VALUE ' '.                   
LRM012         07  FILLER                PIC X(01) VALUE ' '.                   
LRM012         07  W-OPT-CALL-PUT        PIC X(04) VALUE ' '.                   
LRM012         07  FILLER                PIC X(01) VALUE ' '.                   
LRM012         07  W-OPT-OPEN-CLOSE      PIC X(04) VALUE ' '.                   
LRM012         07  FILLER                PIC X(01) VALUE ' '.                   
LRM012         07  W-OPT-SYMBOL          PIC X(06) VALUE ' '.                   
LRM012         07  FILLER                PIC X(01) VALUE ' '.                   
LRM012         07  W-OPT-MS-SYMBOL       PIC X(08) VALUE ' '.                   
LRM012         07  FILLER                PIC X(01) VALUE ' '.                   
LRM012         07  W-OPT-EXPTN-MM        PIC X(02) VALUE ' '.                   
LRM012         07  W-OPT-EXPTN-S1        PIC X(01) VALUE ' '.                   
LRM012         07  W-OPT-EXPTN-CC        PIC X(02) VALUE ' '.                   
LRM012         07  W-OPT-EXPTN-YY        PIC X(02) VALUE ' '.                   
LRM012         07  FILLER                PIC X(02) VALUE ' '.                   
LRM012         07  W-OPT-STRIKE-PRIC     PIC ZZZZ9.                             
LRM012         07  FILLER                PIC X(01) VALUE ' '.                   
LRM012         07  W-OPT-STRIKE-FRAC     PIC X(01) VALUE ' '.                   
LRM012         07  W-OPT-SLASH-8         PIC X(02) VALUE ' '.                   
LRM012         07  FILLER                PIC X(11) VALUE ' '.                   
LRM016     05  W-OPT-DESC-NEW REDEFINES W-OPT-DESC.                             
LRM016         07  FILLER                PIC X(22).                             
LRM016         07  W-OPT-UNDLY-SYMBOL    PIC X(06).                             
LRM016         07  FILLER                PIC X(02).                             
LRM016         07  W-OPT-EXPTN-MM-NEW    PIC X(02).                             
LRM016         07  W-OPT-EXPTN-S1-NEW    PIC X(01).                             
LRM016         07  W-OPT-EXPTN-DD-NEW    PIC X(02).                             
LRM016         07  W-OPT-EXPTN-S2-NEW    PIC X(01).                             
LRM016         07  W-OPT-EXPTN-YY-NEW    PIC X(02).                             
LRM016         07  FILLER                PIC X(01).                             
LRM016         07  W-OPT-STRIKE-PRIC-NEW PIC ZZZZ9.                             
LRM016         07  FILLER                PIC X(01).                             
LRM016         07  W-OPT-STRIKE-FRAC-NEW PIC X(03).                             
LRM016         07  FILLER                PIC X(12).                             
LRM012 01  OPT-WORK-AREA.                                                       
LRM012     05  OPT-SYMBOL         PIC X(03).                                    
LRM012     05  OPTION-SYMBOL   REDEFINES OPT-SYMBOL                             
LRM012                            PIC X(01) OCCURS 3 TIMES.                     
LRM012     05  OPTION-SYMBOL1     PIC X(01) OCCURS 3 TIMES.                     
LRM012     05  OPT-WORK1          PIC X(12).                                    
LRM012     05  OPT-WORK2   REDEFINES  OPT-WORK1.                                
LRM012       10  OPT-WORK3        PIC X(01) OCCURS 12 TIMES.                    
LRM012     05  WK-MS-SYMBOL-9                        VALUE ' '.                 
LRM012         10  WK-MS-SYMBOL        PIC X(6).                                
LRM012         10  WK-FILLER           PIC X(3).                                
                                                                                
       01  WS-COMMAREA.                                                         
           COPY ACAT03IO.                                               01510000
           EJECT                                                                
LRM012 COPY MSDIOCE.                                                            
           EJECT                                                        01350002
       COPY ACATSRCH.                                                   01360002
           EJECT                                                                
           EXEC SQL                                                             
           INCLUDE SQLCA                                                        
           END-EXEC                                                             
      *DCLGEN FOR INITIAL ACAT TRANSFER                                         
PC*********COPY AINTTRNF.                                                       
014700     EXEC SQL                                                     01400000
PC             INCLUDE ACTITRF                                          01410000
014900     END-EXEC.                                                    01420000
015000*                                                                 01430000
      *DCLGEN FOR INITIAL ACAT ASSET                                            
PC*********COPY AINTTRNF.                                                       
014700     EXEC SQL                                                     01400000
PC             INCLUDE ACTIAST                                          01410000
014900     END-EXEC.                                                    01420000
                                                                        01430000
LRM012*DCLGEN FOR INITIAL OPTION ASSET                                          
LRM012     EXEC SQL                                                     01400000
LRM012         INCLUDE ACTIOPN                                          01410000
LRM012     END-EXEC.                                                    01420000
LRM012*                                                                 01430000
      *DCLGEN FOR ACTIVE ACAT TRANSFER                                          
PC*********COPY VTRNFR.                                                         
           EXEC SQL                                                     01400000
               INCLUDE VTRNFR                                           01410000
           END-EXEC.                                                    01420000
      *DCLGEN FOR ACTIVE ACAT ASSET                                             
           EXEC SQL                                                     01400000
               INCLUDE VASSET                                           01410000
           END-EXEC.                                                    01420000
      *DCLGEN FOR HISORY ACAT TRANSFER                                          
           EXEC SQL                                                     01400000
               INCLUDE VTRNHSTY                                         01410000
           END-EXEC.                                                    01420000
015000*                                                                 01430000
      *--------------------------------------------------------*                
      *   TFR CURSRA: FOR THE SPECIFIED CLIENT/BRANCH/ACCOUNT  *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE TFRCSRA CURSOR FOR                                        
                  SELECT                                                        
                   DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,ACCT_RCV_NBR                                                 
                  ,RCV_ACCT_TYPE_CD                                             
                  ,ACAT_CONTROL_NBR                                             
                  ,TRNFR_TYPE_CD                                                
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,STTS_CD                                                      
                  ,RR_CD                                                        
                  ,UPDT_TMSTP                                                   
                   FROM ACTITRF                                         09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
                     AND NOT DSTBN_SIDE_CD                                      
                              = 'D'                                     09190000
                     AND TRNFR_TYPE_CD                                  09180000
LRM015                        = :ACAT03IO-TRNFR-TYPE-CD                 09190000
                     AND (ACCT_RCV_NBR                                          
                              > :ACAT03IO-RCV-ACCT                              
                     OR  (ACCT_RCV_NBR                                          
                              = :ACAT03IO-RCV-ACCT                              
                       AND DLVR_NBR                                             
                              > :ACAT03IO-DLVR-NBR)                             
                     OR  (ACCT_RCV_NBR                                          
                              = :ACAT03IO-RCV-ACCT                              
                       AND DLVR_NBR                                             
                              = :ACAT03IO-DLVR-NBR                              
                       AND ACCT_DLVR_NBR                                        
                              > :ACAT03IO-DLVR-ACCT)                            
LRM007               OR  (ACCT_RCV_NBR                                          
LRM007                        = :ACAT03IO-RCV-ACCT                              
LRM007                 AND DLVR_NBR                                             
LRM007                        = :ACAT03IO-DLVR-NBR                              
LRM007                 AND ACCT_DLVR_NBR                                        
LRM007                        = :ACAT03IO-DLVR-ACCT                             
LRM007                 AND ACAT_CONTROL_NBR                                     
LRM007                        > :ACAT03IO-CONTROL-NBR))                         
                  ORDER BY                                                      
                    ACCT_RCV_NBR                                                
                   ,DLVR_NBR                                            09180000
                   ,ACCT_DLVR_NBR                                       09180000
LRM002             ,ACAT_CONTROL_NBR                                            
           END-EXEC.                                                            
           EJECT                                                                
      *---------------------------------------------------------*               
      *   TFR CURSR1: FOR PREV SPECIFIED CLIENT/BRANCH/ACCOUNT  *               
      *---------------------------------------------------------*               
           EXEC SQL                                                             
              DECLARE TFRCSR1 CURSOR FOR                                        
                  SELECT                                                        
                   DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,ACCT_RCV_NBR                                                 
                  ,RCV_ACCT_TYPE_CD                                             
                  ,ACAT_CONTROL_NBR                                             
                  ,TRANS_TYPE_CD                                                
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,STTS_CD                                                      
                  ,RR_CD                                                        
                  ,UPDT_TMSTP                                                   
                   FROM ACTITRF                                         09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
                     AND TRNFR_TYPE_CD                                  09180000
LRM015                        = :ACAT03IO-TRNFR-TYPE-CD                 09190000
                     AND NOT DSTBN_SIDE_CD                                      
                              = 'D'                                     09190000
                     AND (ACCT_RCV_NBR                                          
                              < :ACAT03IO-RCV-ACCT                              
                     OR  (ACCT_RCV_NBR                                          
                              = :ACAT03IO-RCV-ACCT                              
                       AND DLVR_NBR                                             
                              < :ACAT03IO-DLVR-NBR)                             
                     OR  (ACCT_RCV_NBR                                          
                              = :ACAT03IO-RCV-ACCT                              
                       AND DLVR_NBR                                             
                              = :ACAT03IO-DLVR-NBR                              
                       AND ACCT_DLVR_NBR                                        
                              < :ACAT03IO-DLVR-ACCT)                            
LRM007               OR  (ACCT_RCV_NBR                                          
LRM007                        = :ACAT03IO-RCV-ACCT                              
LRM007                 AND DLVR_NBR                                             
LRM007                        = :ACAT03IO-DLVR-NBR                              
LRM007                 AND ACCT_DLVR_NBR                                        
LRM007                        = :ACAT03IO-DLVR-ACCT                             
LRM007                 AND ACAT_CONTROL_NBR                                     
LRM007                        < :ACAT03IO-CONTROL-NBR))                         
                  ORDER BY                                                      
                    ACCT_RCV_NBR  DESC                                          
                   ,DLVR_NBR      DESC                                  09180000
                   ,ACCT_DLVR_NBR DESC                                  09180000
LRM002             ,ACAT_CONTROL_NBR  DESC                                      
           END-EXEC.                                                            
           EJECT                                                                
      *--------------------------------------------------------*                
      *   TFR CURSRB: FOR THE SPECIFIED CLIENT/BRANCH          *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSRB CURSOR FOR                                       
                  SELECT                                                        
                   ACCT_RCV_NBR                                         09180000
                  ,DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,ACAT_CONTROL_NBR                                             
                  ,TRNFR_TYPE_CD                                                
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,STTS_CD                                                      
                  ,RR_CD                                                        
                  ,UPDT_TMSTP                                                   
                   FROM ACTITRF                                         09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
                     AND SUBSTR(ACCT_RCV_NBR,1,3)                       09180000
                              = :WS-BRANCH                                      
                     AND TRNFR_TYPE_CD                                  09180000
                              = :ACAT03IO-TRNFR-TYPE-CD                 09190000
                     AND NOT DSTBN_SIDE_CD                                      
                              = 'D'                                     09190000
                  ORDER BY                                                      
                    ACCT_RCV_NBR                                                
                   ,DLVR_NBR                                            09180000
                   ,ACCT_DLVR_NBR                                       09180000
LRM002             ,ACAT_CONTROL_NBR                                            
           END-EXEC.                                                            
      *--------------------------------------------------------*                
      *   TFR CURSRC: FOR THE SPECIFIED CLIENT                 *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSRC CURSOR FOR                                       
                  SELECT                                                        
                   ACCT_RCV_NBR                                         09180000
                  ,DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,ACAT_CONTROL_NBR                                             
                  ,TRNFR_TYPE_CD                                                
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,STTS_CD                                                      
                  ,RR_CD                                                        
                  ,UPDT_TMSTP                                                   
                   FROM ACTITRF                                         09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
                     AND TRNFR_TYPE_CD                                  09180000
LRM015                        = :ACAT03IO-TRNFR-TYPE-CD                 09190000
                     AND NOT DSTBN_SIDE_CD                                      
                              = 'D'                                     09190000
                  ORDER BY                                                      
                    ACCT_RCV_NBR                                                
                   ,DLVR_NBR                                            09180000
                   ,ACCT_DLVR_NBR                                       09180000
LRM002             ,ACAT_CONTROL_NBR                                            
           END-EXEC.                                                            
      *--------------------------------------------------------*                
      *   TFR CURSRS: FOR THE NEXT ASSET.                      *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSRS CURSOR FOR                                       
                  SELECT                                                        
                   ISIN_CNTRY_CD                                        09180000
                  ,ISIN_SEC_ISSUE_CD                                    09180000
                  ,ISIN_SEC_CDG_CD                                      09180000
                  ,STTLM_LCTN_CD                                        09180000
                  ,CSH_MGN_SHRT_CD                                      09180000
                  ,ASSET_PRC_CTGY_CD                                            
                  ,ASSET_RQST_QTY_CD                                            
                  ,AST_RQST_TRANS_CD                                            
                  ,WHI_CD                                                       
                  ,PSTN_CD                                                      
                  ,ASSET_DESC_TXT                                               
                  ,ASSET_AMT                                                    
                  ,ASSET_QTY                                                    
                  ,ASSET_PCT                                                    
                  ,ASSET_CMNT_TXT                                               
                  ,SECURITY_ADP_NBR                                             
                   FROM ACTIAST                                         09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
LRM007               AND ACAT_CONTROL_NBR                               09180000
LRM007                        = :ACAT03IO-CONTROL-NBR                   09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT03IO-RCV-ACCT                      09190000
                     AND DLVR_NBR                                       09180000
                              = :ACAT03IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT03IO-DLVR-ACCT                     09190000
                     AND NOT STTLM_LCTN_CD                                      
                              =  '40'                                           
                     AND NOT STTLM_RSN_CD                               09180000
                              = 'SMA '                                  09190000
LRM030               AND (ISIN_CNTRY_CD >                               09180000
LRM030                     :ACAT03IO-ISIN-CNTRY-CD                              
LRM030               OR  (ISIN_CNTRY_CD =                               09180000
LRM030                     :ACAT03IO-ISIN-CNTRY-CD                              
                      AND ISIN_SEC_ISSUE_CD >                           09180000
                           :ACAT03IO-CURRENT-SECR)                              
                                                                                
LRM030               OR  (ISIN_CNTRY_CD =                               09180000
LRM030                     :ACAT03IO-ISIN-CNTRY-CD                              
                       AND ISIN_SEC_ISSUE_CD =                          09180000
                           :ACAT03IO-CURRENT-SECR                               
                       AND STTLM_LCTN_CD   >                            09180000
                            :ACAT03IO-CURRENT-SLOC)                             
                                                                                
LRM030               OR  (ISIN_CNTRY_CD =                               09180000
LRM030                     :ACAT03IO-ISIN-CNTRY-CD                              
                       AND ISIN_SEC_ISSUE_CD =                          09180000
                           :ACAT03IO-CURRENT-SECR                               
                       AND STTLM_LCTN_CD   =                            09180000
                            :ACAT03IO-CURRENT-SLOC                              
                       AND CSH_MGN_SHRT_CD   >                          09180000
                            :ACAT03IO-CURRENT-TYPE))                            
                                                                                
                  ORDER BY                                                      
                    ISIN_CNTRY_CD                                       09180000
SEC                ,ISIN_SEC_ISSUE_CD                                   09180000
                   ,ISIN_SEC_CDG_CD                                     09180000
SLOC               ,STTLM_LCTN_CD                                       09180000
TYPE               ,CSH_MGN_SHRT_CD                                     09180000
           END-EXEC.                                                            
           EJECT                                                                
      *--------------------------------------------------------*                
      *   TFR CURSR4: FOR THE PREV ASSET.                      *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  TFRCSR4 CURSOR FOR                                       
                  SELECT                                                        
                   ISIN_CNTRY_CD                                        09180000
                  ,ISIN_SEC_ISSUE_CD                                    09180000
                  ,ISIN_SEC_CDG_CD                                      09180000
                  ,STTLM_LCTN_CD                                        09180000
                  ,CSH_MGN_SHRT_CD                                      09180000
                  ,ASSET_PRC_CTGY_CD                                            
                  ,ASSET_RQST_QTY_CD                                            
                  ,AST_RQST_TRANS_CD                                            
                  ,WHI_CD                                                       
                  ,PSTN_CD                                                      
                  ,ASSET_DESC_TXT                                               
                  ,ASSET_AMT                                                    
                  ,ASSET_QTY                                                    
                  ,ASSET_PCT                                                    
                  ,ASSET_CMNT_TXT                                               
                  ,SECURITY_ADP_NBR                                             
                   FROM ACTIAST                                         09170000
                  WHERE  CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
LRM007               AND ACAT_CONTROL_NBR                               09180000
LRM007                        = :ACAT03IO-CONTROL-NBR                   09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT03IO-RCV-ACCT                      09190000
                     AND DLVR_NBR                                       09180000
                              = :ACAT03IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT03IO-DLVR-ACCT                     09190000
                     AND NOT STTLM_LCTN_CD                                      
                              =  '40'                                           
                     AND NOT STTLM_RSN_CD                               09180000
                              = 'SMA '                                  09190000
LRM030               AND (ISIN_CNTRY_CD <                               09180000
LRM030                     :ACAT03IO-ISIN-CNTRY-CD                              
LRM030               OR  (ISIN_CNTRY_CD =                               09180000
LRM030                     :ACAT03IO-ISIN-CNTRY-CD                              
                      AND ISIN_SEC_ISSUE_CD <                           09180000
                           :ACAT03IO-CURRENT-SECR)                              
                                                                                
LRM030               OR  (ISIN_CNTRY_CD =                               09180000
LRM030                     :ACAT03IO-ISIN-CNTRY-CD                              
                       AND ISIN_SEC_ISSUE_CD =                          09180000
                           :ACAT03IO-CURRENT-SECR                               
                       AND STTLM_LCTN_CD   <                            09180000
                            :ACAT03IO-CURRENT-SLOC)                             
                                                                                
LRM030               OR  (ISIN_CNTRY_CD =                               09180000
LRM030                     :ACAT03IO-ISIN-CNTRY-CD                              
                       AND ISIN_SEC_ISSUE_CD =                          09180000
                           :ACAT03IO-CURRENT-SECR                               
                       AND STTLM_LCTN_CD   =                            09180000
                            :ACAT03IO-CURRENT-SLOC                              
                       AND CSH_MGN_SHRT_CD   <                          09180000
                            :ACAT03IO-CURRENT-TYPE))                            
                  ORDER BY                                                      
                    ISIN_CNTRY_CD      DESC                             09180000
SEC                ,ISIN_SEC_ISSUE_CD  DESC                             09180000
                   ,ISIN_SEC_CDG_CD    DESC                             09180000
SLOC               ,STTLM_LCTN_CD      DESC                             09180000
TYPE               ,CSH_MGN_SHRT_CD    DESC                             09180000
           END-EXEC.                                                            
      *--------------------------------------------------------*                
      *   ACTIVE TRANSFER CURSOR                               *                
      *   USED TO VERIFY THAT NO ACTIVE TRANSFERS EXIST WHERE  *                
      *   THIS ACCOUNT WAS REQUESTED TO BE DELIVERED.          *                
      *   MULTIPLE RECEIVES INTO THIS ACCOUNT ARE OK...        *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  VTRNFR_CRSR CURSOR FOR                                   
                  SELECT                                                        
                   CLIENT_NBR                                           09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,ACAT_CONTROL_NBR                                             
                  ,TRNFR_TYPE_CD                                                
                  ,STTS_CD                                                      
                   FROM VTRNFR                                          09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT03IO-RCV-ACCT                      09190000
LRM007               AND TRNFR_TYPE_CD                                          
LRM007                        = 'FUL'                                           
                     AND DSTBN_SIDE_CD                                          
                              = 'D'                                     09190000
                     AND NOT STTS_CD                                            
                              = '140'                                           
                     AND NOT STTS_CD                                            
                              = '600')                                          
           END-EXEC.                                                            
LRM008*--------------------------------------------------------------*          
LRM008*  ACTIVE TRANSFER CURSOR                                      *          
LRM008*  USED TO FIND ALL OTHER PTR DELIVERIES FROM THIS CONTRA      *          
LRM008*  AND CONTRA ACCOUNT                                          *          
LRM008*--------------------------------------------------------------*          
LRM008     EXEC SQL                                                             
LRM008        DECLARE VTRNFR_DUPE CURSOR FOR                                    
LRM008           SELECT                                                         
LRM008             ACAT_CONTROL_NBR                                             
LRM008           FROM VTRNFR                                                    
LRM008            WHERE (CLIENT_NBR                                             
LRM008                        = :ACAT03IO-CLIENT-NBR                            
LRM008               AND DSTBN_SIDE_CD = 'R'                                    
LRM008               AND TRNFR_TYPE_CD                                          
LRM015                        = :ACAT03IO-TRNFR-TYPE-CD                         
LRM008               AND STTS_CD IN ('200', '310')                              
LRM008               AND DLVR_NBR                                               
LRM008                        = :ACAT03IO-DLVR-NBR                              
LRM008               AND ACCT_DLVR_NBR                                          
LRM008                        = :ACAT03IO-DLVR-ACCT)                            
LRM008           FOR READ ONLY WITH UR                                          
LRM008      END-EXEC.                                                           
      *--------------------------------------------------------*                
      *   HISTORY TRANSFER CURSOR                              *                
      *   USED TO VERIFY THAT THIS ACCOUNT WAS NOT PREVIOUSLY  *                
      *   REQUESTED TO BE FUL DELIVERED.                       *                
      *--------------------------------------------------------*                
           EXEC SQL                                                             
              DECLARE  VTRNHSTY_CRSR CURSOR FOR                                 
                  SELECT                                                        
                   CLIENT_NBR                                           09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,ACAT_CONTROL_NBR                                             
                  ,TRNFR_TYPE_CD                                                
                  ,STTS_CD                                                      
                   FROM VTRNHSTY                                        09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT03IO-RCV-ACCT                      09190000
                     AND TRNFR_TYPE_CD                                          
                              = 'FUL'                                           
                     AND DSTBN_SIDE_CD                                          
                              = 'D'                                     09190000
                     AND NOT STTS_CD                                            
                              = '600')                                          
           END-EXEC.                                                            
LRM007*--------------------------------------------------------*                
LRM007*  INITIAL TRANSFER CURSOR                              *                 
LRM007*  USED TO FIND GREATEST CNTL NUMBER FOR THE GIVEN KEYS *                 
LRM007*--------------------------------------------------------*                
LRM007     EXEC SQL                                                     09140000
LRM007        DECLARE ACTITRF_LAST_CNTL CURSOR FOR                      09140000
LRM007           SELECT                                                         
LRM007             ACAT_CONTROL_NBR                                             
LRM007           FROM ACTITRF                                           09170000
LRM007            WHERE (CLIENT_NBR                                     09180000
LRM007                        = :ACAT03IO-CLIENT-NBR                    09190000
LRM007               AND DLVR_NBR                                       09180000
LRM007                        = :ACAT03IO-DLVR-NBR                      09190000
LRM007               AND ACCT_DLVR_NBR                                  09180000
LRM007                        = :ACAT03IO-DLVR-ACCT                     09190000
LRM007               AND RCV_NBR                                        09180000
LRM007                        = :ACAT03IO-RCV-NBR                       09190000
LRM007               AND ACCT_RCV_NBR                                   09180000
LRM007                        = :ACAT03IO-RCV-ACCT                      09190000
LRM007               AND TRNFR_TYPE_CD                                  09180000
LRM015                        = :ACAT03IO-TRNFR-TYPE-CD)                09190000
LRM007           ORDER BY  ACAT_CONTROL_NBR DESC                                
LRM007      END-EXEC.                                                   09200000
           EJECT                                                                
      **********************************************************        01460000
      *****      L I N K A G E  S E C T I O N              *****        01470000
      **********************************************************        01480000
       LINKAGE SECTION.                                                 01490000
                                                                        01500000
       01  DFHCOMMAREA.                                                 01490000
           05  FILLER             PIC X(2000).                                  
                                                                                
       EJECT                                                                    
      **********************************************************        01590000
      *****   P R O C E D U R E   D I V I S I O N           *****       01600000
      **********************************************************        01610000
       PROCEDURE DIVISION.                                              01620000
      *--------------------------------------------------------------*          
      * SAVE COMMAREA LENGTH SO THAT PRIOR TO RETURN, WILL PREVENT   *          
      * ALTERING STORAGE BEYOND THAT WHICH WAS SENT.                 *          
      *--------------------------------------------------------------*          
           MOVE EIBCALEN TO WS-EIBCALEN.                                        
           IF EIBCALEN > ZERO                                                   
              MOVE DFHCOMMAREA(1 : EIBCALEN) TO WS-COMMAREA                     
           ELSE                                                                 
              EXEC CICS RETURN END-EXEC                                 06220000
           END-IF.                                                              
                                                                                
           IF ACAT03IO-IT-READ                                                  
               PERFORM 0100-GET-ACTITRF THRU 0100-EXIT                  09130000
           ELSE                                                                 
           IF ACAT03IO-IT-READ-ASSET                                            
               PERFORM 0180-GET-ACTIAST                                 09130000
           ELSE                                                                 
           IF ACAT03IO-IT-READ-NEXTA                                            
               PERFORM 0050-OPEN-CURSORA                                09130000
               PERFORM 0075-READ-NEXTA                                  09130000
               PERFORM 0080-CLOSE-TFRCSRA                                       
           ELSE                                                                 
           IF ACAT03IO-IT-READ-PREV1                                            
               PERFORM 0050-OPEN-CURSOR1                                09130000
               PERFORM 0075-READ-PREV1                                  09130000
               PERFORM 0080-CLOSE-TFRCSR1                                       
           ELSE                                                                 
           IF ACAT03IO-IT-READ-NEXTB                                            
               PERFORM 0050-OPEN-CURSORB                                09130000
               PERFORM 0075-READ-NEXTB                                  09130000
               PERFORM 0080-CLOSE-TFRCSRB                                       
           ELSE                                                                 
           IF ACAT03IO-IT-READ-NEXTC                                            
               PERFORM 0050-OPEN-CURSORC                                09130000
               PERFORM 0075-READ-NEXTC                                  09130000
               PERFORM 0080-CLOSE-TFRCSRC                                       
           ELSE                                                                 
           IF ACAT03IO-IT-READ-NEXTS                                            
               PERFORM 0050-OPEN-CURSORS                                09130000
               PERFORM 0075-READ-NEXTS                                  09130000
               PERFORM 0080-CLOSE-TFRCSRS                                       
           ELSE                                                                 
           IF ACAT03IO-IT-READ-PREV4                                            
               PERFORM 0050-OPEN-CURSOR4                                09130000
               PERFORM 0075-READ-PREV4                                  09130000
               PERFORM 0080-CLOSE-TFRCSR4                                       
           ELSE                                                                 
           IF ACAT03IO-IT-GET-ACTIVE                                            
               PERFORM 0150-READ-ACTIVE-ACAT-DIRECT                             
           ELSE                                                                 
LRM008     IF ACAT03IO-DUPE-AST-CHECK                                           
LRM008         PERFORM 0170-CHECK-ASSET-ON-OTHER-PTR                            
LRM008     ELSE                                                                 
              EXEC SQL                                                          
                  SET :WS-TIMESTAMP = CURRENT TIMESTAMP                         
              END-EXEC                                                          
              IF ACAT03IO-IT-ISRT                                               
                  PERFORM 0200-ISRT-ACTITRF                                09130
                  PERFORM 0230-INSERT-ASSET-AMOUNTS                             
              ELSE                                                              
              IF ACAT03IO-IT-ISRT-ASSET                                         
                  PERFORM 0220-ISRT-ACTIAST                                09130
              ELSE                                                              
              IF ACAT03IO-IT-UPD                                                
                 PERFORM 0300-UPDATE-ACTITRF THRU 0300-EXIT                     
              ELSE                                                              
              IF ACAT03IO-IT-UPD-ASSET                                          
                 PERFORM 0370-UPDATE-ACTIAST                                    
              ELSE                                                              
              IF ACAT03IO-IT-DEL                                                
                 PERFORM 0400-DELETE-ACTITRF                                    
              ELSE                                                              
              IF ACAT03IO-IT-DEL-ASSET                                          
                 PERFORM 0420-DELETE-ACTIAST                                    
           END-IF.                                                              
                                                                                
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN).                    
           EXEC CICS RETURN END-EXEC.                                           
                                                                                
       0050-OPEN-CURSORA.                                               09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE WITH CLIENT/BRANCH/ACCOUNT                 *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSRA                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT03IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSRA OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       0050-OPEN-CURSOR1.                                               09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE WITH PREV CLIENT/BRANCH/ACCOUNT            *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSR1                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT03IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSR1 OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       0050-OPEN-CURSORB.                                               09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE WITH CLIENT/BRANCH ONLY                    *          
      *--------------------------------------------------------------*          
           MOVE ACAT03IO-RCV-ACCT(1 : 3) TO WS-BRANCH.                  09190000
           EXEC SQL                                                             
              OPEN TFRCSRB                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT03IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSRA OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       0050-OPEN-CURSORC.                                               09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE WITH CLIENT ONLY.                          *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSRC                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT03IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSRA OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       0050-OPEN-CURSORS.                                               09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE FOR NEXT ASSET.                            *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSRS                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT03IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSRS OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
       0050-OPEN-CURSOR4.                                               09130000
      *--------------------------------------------------------------*          
      *     SERACH ENGINE FOR PREV ASSET.                            *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN TFRCSR4                                                      
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT03IO-GOOD-RESP TO TRUE                            09240000
           ELSE                                                                 
    *******   MOVE '** TFRCSR4 OPEN ERROR **'                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
       0050-OPEN-VTRNFR.                                                09130000
      *--------------------------------------------------------------*          
      *     OPEN CURSOR FOR ACATIVE TRANSFER LOOKUP.                 *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN VTRNFR_CRSR                                                  
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              CONTINUE                                                  09240000
           ELSE                                                                 
    *******   MOVE '** VTRNFR OPEN ERROR **'                                    
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
       0050-OPEN-VTRNHSTY.                                              09130000
      *--------------------------------------------------------------*          
      *     OPEN CURSOR FOR TRANSFER HISTORY LOOKUP.                 *          
      *--------------------------------------------------------------*          
           EXEC SQL                                                             
              OPEN VTRNHSTY_CRSR                                                
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              CONTINUE                                                  09240000
           ELSE                                                                 
    *******   MOVE '** VTRNHSTY OPEN ERROR **'                                  
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
       EJECT                                                                    
                                                                                
       0075-READ-NEXTA.                                                 09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRA                                                       
                   INTO                                                 09160000
                    :ACAT03IO-DLVR-NBR                                  09190000
                   ,:ACAT03IO-DLVR-ACCT                                 09190000
                   ,:ACAT03IO-RCV-ACCT                                  09190000
                   ,:ACAT03IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT03IO-CONTROL-NBR                                       
                   ,:ACAT03IO-TRNFR-TYPE-CD                                     
                   ,:ACAT03IO-RCV-CUST-NM                                       
                   ,:ACAT03IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT03IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT03IO-CMNT-TXT                                          
                   ,:ACAT03IO-NSCC-PEND-CD                                      
                   ,:ACAT03IO-NSCC-ACK-IND                                      
                   ,:ACAT03IO-STTS-CD                                           
                   ,:ACAT03IO-RR-CD                                             
                   ,:ACAT03IO-UPDT-TMSTP                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              MOVE ACAT03IO-RR-CD TO SRCH-INP-RR                                
              MOVE ACAT03IO-RCV-ACCT(1 : 3) TO SRCH-INP-BRANCH                  
              PERFORM 0075-SIGNON-SECR-CHECK-RTN                                
              IF SRCH-SIGNON-SECR-CHECK-FAIL                                    
                 GO TO 0075-READ-NEXTA                                  09130000
              END-IF                                                            
              SET ACAT03IO-FOUND TO TRUE                                        
              PERFORM 0110-GET-ACTIAST-DOLLAR-AMTS                      09130000
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT03IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
    ******    MOVE '** ACAT03DB - TFRCSRA FETCH ERR  **     '                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       SKIP3                                                                    
       0075-READ-PREV1.                                                 09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSR1                                                       
                   INTO                                                 09160000
                    :ACAT03IO-DLVR-NBR                                  09190000
                   ,:ACAT03IO-DLVR-ACCT                                 09190000
                   ,:ACAT03IO-RCV-ACCT                                  09190000
                   ,:ACAT03IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT03IO-CONTROL-NBR                                       
                   ,:ACAT03IO-TRNFR-TYPE-CD                                     
                   ,:ACAT03IO-RCV-CUST-NM                                       
                   ,:ACAT03IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT03IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT03IO-CMNT-TXT                                          
                   ,:ACAT03IO-NSCC-PEND-CD                                      
                   ,:ACAT03IO-NSCC-ACK-IND                                      
                   ,:ACAT03IO-STTS-CD                                           
                   ,:ACAT03IO-RR-CD                                             
                   ,:ACAT03IO-UPDT-TMSTP                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              MOVE ACAT03IO-RR-CD TO SRCH-INP-RR                                
              MOVE ACAT03IO-RCV-ACCT(1 : 3) TO SRCH-INP-BRANCH                  
              PERFORM 0075-SIGNON-SECR-CHECK-RTN                                
              IF SRCH-SIGNON-SECR-CHECK-FAIL                                    
                 GO TO 0075-READ-PREV1                                  09130000
              END-IF                                                            
              SET ACAT03IO-FOUND TO TRUE                                        
              PERFORM 0110-GET-ACTIAST-DOLLAR-AMTS                      09130000
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT03IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
    ******    MOVE '** ACAT03DB - TFRCSR1 FETCH ERR  **     '                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       SKIP3                                                                    
       0075-READ-NEXTB.                                                 09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRB                                                       
                   INTO                                                 09160000
                    :ACAT03IO-RCV-ACCT                                  09190000
                   ,:ACAT03IO-DLVR-NBR                                  09190000
                   ,:ACAT03IO-DLVR-ACCT                                 09190000
                   ,:ACAT03IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT03IO-CONTROL-NBR                                       
                   ,:ACAT03IO-TRNFR-TYPE-CD                                     
                   ,:ACAT03IO-RCV-CUST-NM                                       
                   ,:ACAT03IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT03IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT03IO-CMNT-TXT                                          
                   ,:ACAT03IO-NSCC-PEND-CD                                      
                   ,:ACAT03IO-NSCC-ACK-IND                                      
                   ,:ACAT03IO-STTS-CD                                           
                   ,:ACAT03IO-RR-CD                                             
                   ,:ACAT03IO-UPDT-TMSTP                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              MOVE ACAT03IO-RR-CD TO SRCH-INP-RR                                
              MOVE ACAT03IO-RCV-ACCT(1 : 3) TO SRCH-INP-BRANCH                  
              PERFORM 0075-SIGNON-SECR-CHECK-RTN                                
              IF SRCH-SIGNON-SECR-CHECK-FAIL                                    
                 GO TO 0075-READ-NEXTB                                  09130000
              END-IF                                                            
              SET ACAT03IO-FOUND TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT03IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
    ******    MOVE '** ACAT03DB - TFRCSRA FETCH ERR  **     '                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       SKIP3.                                                                   
       0075-READ-NEXTC.                                                 09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRC                                                       
                   INTO                                                 09160000
                    :ACAT03IO-RCV-ACCT                                  09190000
                   ,:ACAT03IO-DLVR-NBR                                  09190000
                   ,:ACAT03IO-DLVR-ACCT                                 09190000
                   ,:ACAT03IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT03IO-CONTROL-NBR                                       
                   ,:ACAT03IO-TRNFR-TYPE-CD                                     
                   ,:ACAT03IO-RCV-CUST-NM                                       
                   ,:ACAT03IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT03IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT03IO-CMNT-TXT                                          
                   ,:ACAT03IO-NSCC-PEND-CD                                      
                   ,:ACAT03IO-NSCC-ACK-IND                                      
                   ,:ACAT03IO-STTS-CD                                           
                   ,:ACAT03IO-RR-CD                                             
                   ,:ACAT03IO-UPDT-TMSTP                                        
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              MOVE ACAT03IO-RR-CD TO SRCH-INP-RR                                
              MOVE ACAT03IO-RCV-ACCT(1 : 3) TO SRCH-INP-BRANCH                  
              PERFORM 0075-SIGNON-SECR-CHECK-RTN                                
              IF SRCH-SIGNON-SECR-CHECK-FAIL                                    
                 GO TO 0075-READ-NEXTC                                  09130000
              END-IF                                                            
              SET ACAT03IO-FOUND TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT03IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
    ******    MOVE '** ACAT03DB - TFRCSRA FETCH ERR  **     '                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       SKIP3.                                                                   
       0075-READ-NEXTS.                                                 09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSRS                                                       
                   INTO                                                 09160000
                   :ACAT03IO-ISIN-CNTRY-CD                                      
                  ,:ACAT03IO-ISIN-SEC-ISSUE-CD                                  
                  ,:ACAT03IO-ISIN-SEC-CDG-CD                                    
                  ,:ACAT03IO-STTLM-LCTN-CD                                      
                  ,:ACAT03IO-CSH-MGN-SHRT-CD                                    
                  ,:ACAT03IO-ASSET-PRC-CTGY-CD                                  
                  ,:ACAT03IO-ASSET-RQST-QTY-CD                                  
                  ,:ACAT03IO-AST-RQST-TRANS-CD                                  
                  ,:ACAT03IO-WHI-CD                                             
                  ,:ACAT03IO-PSTN-CD                                            
                  ,:ACAT03IO-DESC-TXT                                           
                  ,:ACAT03IO-ASSET-AMT                                          
                  ,:ACAT03IO-ASSET-QTY                                          
                  ,:ACAT03IO-ASSET-PCT                                          
                  ,:ACAT03IO-ASSET-CMNT-TXT                                     
                  ,:ACAT03IO-ADP-NBR                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT03IO-FOUND TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT03IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
    ******    MOVE '** ACAT03DB - TFRCSRS FETCH ERR  **     '                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       SKIP3                                                                    
       0075-READ-PREV4.                                                 09130000
           EXEC SQL                                                             
              FETCH                                                             
                  TFRCSR4                                                       
                   INTO                                                 09160000
                   :ACAT03IO-ISIN-CNTRY-CD                                      
                  ,:ACAT03IO-ISIN-SEC-ISSUE-CD                                  
                  ,:ACAT03IO-ISIN-SEC-CDG-CD                                    
                  ,:ACAT03IO-STTLM-LCTN-CD                                      
                  ,:ACAT03IO-CSH-MGN-SHRT-CD                                    
                  ,:ACAT03IO-ASSET-PRC-CTGY-CD                                  
                  ,:ACAT03IO-ASSET-RQST-QTY-CD                                  
                  ,:ACAT03IO-AST-RQST-TRANS-CD                                  
                  ,:ACAT03IO-WHI-CD                                             
                  ,:ACAT03IO-PSTN-CD                                            
                  ,:ACAT03IO-DESC-TXT                                           
                  ,:ACAT03IO-ASSET-AMT                                          
                  ,:ACAT03IO-ASSET-QTY                                          
                  ,:ACAT03IO-ASSET-PCT                                          
                  ,:ACAT03IO-ASSET-CMNT-TXT                                     
                  ,:ACAT03IO-ADP-NBR                                            
           END-EXEC.                                                            
           IF SQLCODE = 0                                                       
              SET ACAT03IO-FOUND TO TRUE                                        
           ELSE                                                                 
           IF SQLCODE = +100                                                    
              SET ACAT03IO-NOT-FOUND TO TRUE                                    
           ELSE                                                                 
    ******    MOVE '** ACAT03DB - TFRCSR4 FETCH ERR  **     '                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
       0075-SIGNON-SECR-CHECK-RTN.                                              
           IF ACAT03IO-SUPER-SIGN-ON                                            
              SET SRCH-SIGNON-SECR-CHECK-PASS TO TRUE                           
           ELSE                                                                 
              SET SECURITY-LOOKUP TO TRUE                                       
              EXEC CICS LINK PROGRAM (WS-ACATSRCH)                      02890002
                  COMMAREA(ACAT-SRCH-COMM-AREA)                         02900002
                  LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)                 02910002
              END-EXEC                                                  02920002
           END-IF.                                                              
       SKIP3                                                                    
       0080-CLOSE-TFRCSRA.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSRA                                                     
           END-EXEC.                                                            
       0080-CLOSE-TFRCSR1.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSR1                                                     
           END-EXEC.                                                            
       0080-CLOSE-TFRCSRB.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSRB                                                     
           END-EXEC.                                                            
       0080-CLOSE-TFRCSRC.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSRC                                                     
           END-EXEC.                                                            
       0080-CLOSE-TFRCSRS.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSRS                                                     
           END-EXEC.                                                            
       0080-CLOSE-TFRCSR4.                                                      
           EXEC SQL                                                             
              CLOSE TFRCSR4                                                     
           END-EXEC.                                                            
       0080-CLOSE-VTRNFR.                                                       
           EXEC SQL                                                             
              CLOSE VTRNFR_CRSR                                                 
           END-EXEC.                                                            
       0080-CLOSE-VTRNHSTY.                                                     
           EXEC SQL                                                             
              CLOSE VTRNHSTY_CRSR                                               
           END-EXEC.                                                            
       EJECT                                                                    
       0100-GET-ACTITRF.                                                09130000
           EXEC SQL SELECT                                              09140000
                   STTS_CD                                                      
LRM007            ,ACAT_CONTROL_NBR                                     09180000
                 INTO                                                   09160000
                   :ACAT03IO-STTS-CD                                            
LRM007            ,:ACAT03IO-CONTROL-NBR                                09190000
                 FROM ACTITRF                                           09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
                     AND DLVR_NBR                                       09180000
                              = :ACAT03IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT03IO-DLVR-ACCT                     09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
LRM007               AND DSTBN_SIDE_CD                                          
                              = 'D'                                     09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT03IO-RCV-ACCT                      09190000
                     AND TRNFR_TYPE_CD                                  09180000
                              = 'FUL')                                  09190000
093200      END-EXEC.                                                   09200000
093300*                                                                 09210000
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     SET ACAT03IO-FUL-FOUND TO TRUE                             
                     GO TO 0100-EXIT                                    09130000
093800          WHEN -811                                               09260000
                     SET ACAT03IO-FUL-FOUND TO TRUE                             
                     GO TO 0100-EXIT                                    09130000
093800          WHEN +100                                               09260000
                     CONTINUE                                                   
094000          WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
                                                                                
           EXEC SQL SELECT                                              09140000
                   RCV_ACCT_TYPE_CD                                             
                  ,ACAT_CONTROL_NBR                                             
                  ,TRNFR_TYPE_CD                                                
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,NSCC_PEND_CD                                                 
                  ,NSCC_ACK_IND                                                 
                  ,STTS_CD                                                      
                  ,RR_CD                                                        
                  ,UPDT_TMSTP                                                   
                 INTO                                                   09160000
                   :ACAT03IO-RCV-ACCT-TYPE-CD                                   
                  ,:ACAT03IO-CONTROL-NBR                                        
                  ,:ACAT03IO-TRNFR-TYPE-CD                                      
                  ,:ACAT03IO-RCV-CUST-NM                                        
                  ,:ACAT03IO-RCV-SS-PRIM-NBR                                    
                  ,:ACAT03IO-RCV-SS-SCNDY-NBR                                   
                  ,:ACAT03IO-CMNT-TXT                                           
                  ,:ACAT03IO-NSCC-PEND-CD                                       
                  ,:ACAT03IO-NSCC-ACK-IND                                       
                  ,:ACAT03IO-STTS-CD                                            
                  ,:ACAT03IO-RR-CD                                              
                  ,:ACAT03IO-UPDT-TMSTP                                         
                 FROM ACTITRF                                           09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
LRM007               AND ACAT_CONTROL_NBR                               09180000
LRM007                        = :ACAT03IO-CONTROL-NBR                           
                     AND DLVR_NBR                                       09180000
                              = :ACAT03IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT03IO-DLVR-ACCT                     09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
                     AND NOT DSTBN_SIDE_CD                                      
                              = 'D'                                     09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT03IO-RCV-ACCT                      09190000
                     AND TRNFR_TYPE_CD                                  09180000
LRM015                        = :ACAT03IO-TRNFR-TYPE-CD)                09190000
093200      END-EXEC.                                                   09200000
093300*                                                                 09210000
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     SET ACAT03IO-FOUND TO TRUE                                 
                     PERFORM 0110-GET-ACTIAST-DOLLAR-AMTS               09130000
093800          WHEN +100                                               09260000
LRM007               SET ACAT03IO-NOT-FOUND TO TRUE                             
LRM007***            PERFORM 0120-READ-ACTIVE-ACAT                              
094000          WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
            IF ACAT03IO-NOT-FOUND                                               
               PERFORM 0160-VERIFY-NON-DUPLICATE-RTN                            
                  THRU 0160-EXIT.                                               
                                                                                
094300*                                                                 09310000
094400 0100-EXIT.                                                       09320000
094500     EXIT.                                                        09330000
                                                                                
           EJECT                                                                
       0110-GET-ACTIAST-DOLLAR-AMTS.                                    09130000
      *** READ FOR TYPE 01 CASH                                                 
           EXEC SQL SELECT                                              09140000
                   ASSET_AMT                                                    
                  ,ASSET_CMNT_TXT                                               
                  ,STTLM_RSN_CD                                                 
LRM009            ,ASSET_RQST_QTY_CD                                            
                 INTO                                                   09160000
                   :DCLACTIAST.ASSET-AMT                                        
                  ,:ACAT03IO-ASSET-CMNT1-TXT                                    
                  ,:DCLACTIAST.STTLM-RSN-CD                                     
LRM009            ,:DCLACTIAST.ASSET-RQST-QTY-CD                                
                 FROM ACTIAST                                           09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
LRM007               AND ACAT_CONTROL_NBR                               09180000
LRM007                        = :ACAT03IO-CONTROL-NBR                   09190000
                     AND DLVR_NBR                                       09180000
                              = :ACAT03IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT03IO-DLVR-ACCT                     09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT03IO-RCV-ACCT                      09190000
                     AND ISIN_CNTRY_CD                                  09180000
                              = '  '                                    09190000
                     AND ISIN_SEC_ISSUE_CD                              09180000
                              = '         '                             09190000
                     AND STTLM_LCTN_CD                                  09180000
                              = '40'                                    09190000
                     AND CSH_MGN_SHRT_CD                                09180000
                              = 'C')                                    09190000
093200      END-EXEC.                                                   09200000
093300*                                                                 09210000
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     MOVE ASSET-AMT OF DCLACTIAST TO ACAT03IO-AMT-01            
                     IF STTLM-RSN-CD OF DCLACTIAST = 'CRED'                     
                        SET ACAT03IO-AMT-01-CREDIT TO TRUE                      
                     ELSE                                                       
                        MOVE SPACES TO ACAT03IO-AMT-01-CREDIT-IND               
                     END-IF                                                     
LRM009               MOVE ASSET-RQST-QTY-CD OF DCLACTIAST TO                    
LRM009                                 ACAT03IO-AMT-01-RQST-CD                  
093800          WHEN +100                                               09260000
                     MOVE ZEROS TO ACAT03IO-AMT-01                              
                     MOVE SPACES TO ACAT03IO-ASSET-CMNT1-TXT                    
LRM009                              ACAT03IO-AMT-01-RQST-CD                     
094000          WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
094300*                                                                 09310000
      *** READ FOR TYPE 02 MARGIN                                               
           EXEC SQL SELECT                                              09140000
                   ASSET_AMT                                                    
                  ,ASSET_CMNT_TXT                                               
                  ,STTLM_RSN_CD                                                 
LRM009            ,ASSET_RQST_QTY_CD                                            
                 INTO                                                   09160000
                   :DCLACTIAST.ASSET-AMT                                        
                  ,:ACAT03IO-ASSET-CMNT2-TXT                                    
                  ,:DCLACTIAST.STTLM-RSN-CD                                     
LRM009            ,:DCLACTIAST.ASSET-RQST-QTY-CD                                
                 FROM ACTIAST                                           09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
LRM007               AND ACAT_CONTROL_NBR                               09180000
LRM007                        = :ACAT03IO-CONTROL-NBR                   09190000
                     AND DLVR_NBR                                       09180000
                              = :ACAT03IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT03IO-DLVR-ACCT                     09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT03IO-RCV-ACCT                      09190000
                     AND ISIN_CNTRY_CD                                  09180000
                              = '  '                                    09190000
                     AND ISIN_SEC_ISSUE_CD                              09180000
                              = '         '                             09190000
                     AND STTLM_LCTN_CD                                  09180000
                              = '40'                                    09190000
                     AND CSH_MGN_SHRT_CD                                09180000
                              = 'M')                                    09190000
093200      END-EXEC.                                                   09200000
093300*                                                                 09210000
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     MOVE ASSET-AMT OF DCLACTIAST TO ACAT03IO-AMT-02            
                     IF STTLM-RSN-CD OF DCLACTIAST = 'CRED'                     
                        SET ACAT03IO-AMT-02-CREDIT TO TRUE                      
                     ELSE                                                       
                        MOVE SPACES TO ACAT03IO-AMT-02-CREDIT-IND               
                     END-IF                                                     
LRM009               MOVE ASSET-RQST-QTY-CD OF DCLACTIAST TO                    
LRM009                                 ACAT03IO-AMT-02-RQST-CD                  
093800          WHEN +100                                               09260000
                     MOVE ZEROS TO ACAT03IO-AMT-02                              
                     MOVE SPACES TO ACAT03IO-ASSET-CMNT2-TXT                    
LRM009                              ACAT03IO-AMT-02-RQST-CD                     
094000          WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
                                                                                
      *** READ FOR TYPE 05 SHORT                                                
           EXEC SQL SELECT                                              09140000
                   ASSET_AMT                                                    
                  ,ASSET_CMNT_TXT                                               
                  ,STTLM_RSN_CD                                                 
LRM009            ,ASSET_RQST_QTY_CD                                            
                 INTO                                                   09160000
                   :DCLACTIAST.ASSET-AMT                                        
                  ,:ACAT03IO-ASSET-CMNT5-TXT                                    
                  ,:DCLACTIAST.STTLM-RSN-CD                                     
LRM009            ,:DCLACTIAST.ASSET-RQST-QTY-CD                                
                 FROM ACTIAST                                           09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
LRM007               AND ACAT_CONTROL_NBR                               09180000
LRM007                        = :ACAT03IO-CONTROL-NBR                   09190000
                     AND DLVR_NBR                                       09180000
                              = :ACAT03IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT03IO-DLVR-ACCT                     09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT03IO-RCV-ACCT                      09190000
                     AND ISIN_CNTRY_CD                                  09180000
                              = '  '                                    09190000
                     AND ISIN_SEC_ISSUE_CD                              09180000
                              = '         '                             09190000
                     AND STTLM_LCTN_CD                                  09180000
                              = '40'                                    09190000
                     AND CSH_MGN_SHRT_CD                                09180000
                              = 'S')                                    09190000
093200      END-EXEC.                                                   09200000
093300*                                                                 09210000
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     MOVE ASSET-AMT OF DCLACTIAST TO ACAT03IO-AMT-05            
                     IF STTLM-RSN-CD OF DCLACTIAST = 'CRED'                     
                        SET ACAT03IO-AMT-05-CREDIT TO TRUE                      
                     ELSE                                                       
                        MOVE SPACES TO ACAT03IO-AMT-05-CREDIT-IND               
                     END-IF                                                     
LRM009               MOVE ASSET-RQST-QTY-CD OF DCLACTIAST TO                    
LRM009                                 ACAT03IO-AMT-05-RQST-CD                  
093800          WHEN +100                                               09260000
                     MOVE ZEROS TO ACAT03IO-AMT-05                              
                     MOVE SPACES TO ACAT03IO-ASSET-CMNT5-TXT                    
LRM009                              ACAT03IO-AMT-05-RQST-CD                     
094000          WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
                                                                                
      *** READ FOR SMA AMOUNT                                                   
           EXEC SQL SELECT                                              09140000
                   ASSET_AMT                                                    
                  ,ASSET_CMNT_TXT                                               
                  ,STTLM_RSN_CD                                                 
                 INTO                                                   09160000
                   :DCLACTIAST.ASSET-AMT                                        
                  ,:ACAT03IO-ASSET-CMNTM-TXT                                    
                  ,:DCLACTIAST.STTLM-RSN-CD                                     
                 FROM ACTIAST                                           09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
LRM007               AND ACAT_CONTROL_NBR                               09180000
LRM007                        = :ACAT03IO-CONTROL-NBR                   09190000
                     AND DLVR_NBR                                       09180000
                              = :ACAT03IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT03IO-DLVR-ACCT                     09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT03IO-RCV-ACCT                      09190000
                     AND ISIN_CNTRY_CD                                  09180000
                              = '  '                                    09190000
                     AND ISIN_SEC_ISSUE_CD                              09180000
                              = '         '                             09190000
                     AND STTLM_LCTN_CD                                  09180000
                              = '45'                                    09190000
                     AND STTLM_RSN_CD                                   09180000
                              = 'SMA ')                                 09190000
093200      END-EXEC.                                                   09200000
093300*                                                                 09210000
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     MOVE ASSET-AMT OF DCLACTIAST TO ACAT03IO-AMT-SMA           
                     MOVE SPACES TO ACAT03IO-AMT-SMA-CREDIT-IND                 
093800          WHEN +100                                               09260000
                     MOVE ZEROS TO ACAT03IO-AMT-SMA                             
                     MOVE SPACES TO ACAT03IO-ASSET-CMNTM-TXT                    
094000          WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
094300*                                                                 09310000
           EJECT                                                                
       0120-READ-ACTIVE-ACAT.                                                   
LRM****** NOT SURE IF THERE CAN BE MULTIPLE HITS ON ACTIVE TABLE BELOW          
LRM****** FOR GIVEN PTR, RCV, RCV-ACCT, DLVR, DLVR-ACCT FIELDS.                 
            EXEC SQL SELECT                                             09140000
                   ACAT_CONTROL_NBR                                     09180000
                  ,ACCT_RCV_NBR                                         09180000
                  ,DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,STTS_CD                                                      
                  ,RR_CD                                                        
                   INTO                                                 09160000
                    :ACAT03IO-CONTROL-NBR                                       
                   ,:ACAT03IO-RCV-ACCT                                  09190000
                   ,:ACAT03IO-DLVR-NBR                                  09190000
                   ,:ACAT03IO-DLVR-ACCT                                 09190000
                   ,:ACAT03IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT03IO-RCV-CUST-NM                                       
                   ,:ACAT03IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT03IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT03IO-CMNT-TXT                                          
                   ,:ACAT03IO-STTS-CD                                           
                   ,:ACAT03IO-RR-CD                                             
                   FROM VTRNFR                                          09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
                     AND DLVR_NBR                                       09180000
                              = :ACAT03IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT03IO-DLVR-ACCT                     09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
                     AND NOT DSTBN_SIDE_CD                                      
                              = 'D'                                     09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT03IO-RCV-ACCT                      09190000
LRM001               AND NOT STTS_CD = '300'                            09180000
LRM001               AND NOT STTS_CD = '310'                            09180000
LRM001               AND NOT STTS_CD = '510'                            09180000
LRM001               AND NOT STTS_CD = '600'                            09180000
                     AND (TRNFR_TYPE_CD                                 09180000
LRM015                        = :ACAT03IO-TRNFR-TYPE-CD                 09190000
                      OR  TRNFR_TYPE_CD                                 09180000
                              = 'FUL'))                                 09190000
            END-EXEC                                                            
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     SET ACAT03IO-ACTIVE-FOUND TO TRUE                          
                     MOVE 'H' TO ACAT03IO-NSCC-PEND-CD                          
LRM001          WHEN -811                                               09260000
LRM001               SET ACAT03IO-ACTIVE-FOUND TO TRUE                          
LRM001               MOVE 'H' TO ACAT03IO-NSCC-PEND-CD                          
093800          WHEN +100                                               09260000
                     SET ACAT03IO-NOT-FOUND TO TRUE                             
094000          WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
094300*                                                                 09310000
           EJECT                                                                
       0150-READ-ACTIVE-ACAT-DIRECT.                                            
            EXEC SQL SELECT                                             09140000
                   ACCT_RCV_NBR                                         09180000
                  ,DLVR_NBR                                             09180000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_ACCT_TYPE_CD                                             
                  ,RCV_CUST_NM                                                  
                  ,RCV_SS_PRIM_NBR                                      09150000
                  ,RCV_SS_SCNDY_NBR                                             
                  ,CMNT_TXT                                                     
                  ,STTS_CD                                                      
                  ,RR_CD                                                        
                   INTO                                                 09160000
                    :ACAT03IO-RCV-ACCT                                  09190000
                   ,:ACAT03IO-DLVR-NBR                                  09190000
                   ,:ACAT03IO-DLVR-ACCT                                 09190000
                   ,:ACAT03IO-RCV-ACCT-TYPE-CD                                  
                   ,:ACAT03IO-RCV-CUST-NM                                       
                   ,:ACAT03IO-RCV-SS-PRIM-NBR                                   
                   ,:ACAT03IO-RCV-SS-SCNDY-NBR                                  
                   ,:ACAT03IO-CMNT-TXT                                          
                   ,:ACAT03IO-STTS-CD                                           
                   ,:ACAT03IO-RR-CD                                             
                   FROM VTRNFR                                          09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
                     AND ACAT_CONTROL_NBR                               09180000
                              = :ACAT03IO-CONTROL-NBR                           
                     AND NOT DSTBN_SIDE_CD                                      
                              = 'D'                                     09190000
                     AND TRNFR_TYPE_CD                                  09180000
LRM015                        = :ACAT03IO-TRNFR-TYPE-CD)                09190000
            END-EXEC                                                            
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     SET ACAT03IO-FOUND TO TRUE                                 
                     MOVE 'H' TO ACAT03IO-NSCC-PEND-CD                          
093800          WHEN +100                                               09260000
                     SET ACAT03IO-NOT-FOUND TO TRUE                             
094000          WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
            IF ACAT03IO-NOT-FOUND                                               
               PERFORM 0160-VERIFY-NON-DUPLICATE-RTN                            
                  THRU 0160-EXIT.                                               
094300*                                                                 09310000
       0160-VERIFY-NON-DUPLICATE-RTN.                                           
           PERFORM 0050-OPEN-VTRNFR.                                    09130000
           EXEC SQL                                                             
              FETCH                                                             
                  VTRNFR_CRSR                                                   
                   INTO                                                 09160000
                    :ACAT03IO-DUPE-CLIENT                               02030002
                   ,:DCLVTRNFR.ACCT-DLVR-NBR                            09180000
                   ,:ACAT03IO-DUPE-CONTROL-NBR                          02030002
                   ,:ACAT03IO-DUPE-TRNFR-TYPE                           02030002
                   ,:ACAT03IO-DUPE-STATUS-CD                            02030002
           END-EXEC.                                                            
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT03IO-OTHER-ACTIVE TO TRUE                  09240000
                     GO TO 0160-EXIT                                            
093500          WHEN +100                                               09230000
093600               CONTINUE                                           09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
           PERFORM 0080-CLOSE-VTRNFR.                                           
                                                                                
           PERFORM 0050-OPEN-VTRNHSTY.                                  09130000
           EXEC SQL                                                             
              FETCH                                                             
                  VTRNHSTY_CRSR                                                 
                   INTO                                                 09160000
                    :ACAT03IO-DUPE-CLIENT                               02030002
                   ,:DCLVTRNHSTY.ACCT-DLVR-NBR                          09180000
                   ,:ACAT03IO-DUPE-CONTROL-NBR                          02030002
                   ,:ACAT03IO-DUPE-TRNFR-TYPE                           02030002
                   ,:ACAT03IO-DUPE-STATUS-CD                            02030002
           END-EXEC.                                                            
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT03IO-FUL-HISTORY TO TRUE                   09240000
                     GO TO 0160-EXIT                                            
093500          WHEN +100                                               09230000
093600               CONTINUE                                           09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
           PERFORM 0080-CLOSE-VTRNHSTY.                                         
       0160-EXIT. EXIT.                                                         
           SKIP3                                                                
LRM008 0170-CHECK-ASSET-ON-OTHER-PTR.                                           
LRM008     SET ASSET-NOT-ON-OTHER-PTR TO TRUE.                                  
LRM008     EXEC SQL                                                             
LRM008        OPEN VTRNFR_DUPE                                                  
LRM008     END-EXEC.                                                            
LRM008     IF SQLCODE = +0 OR +100                                              
LRM008        CONTINUE                                                          
LRM008     ELSE                                                                 
LRM008        PERFORM 9000-WRITE-TO-CICS-LOG                                    
LRM008        PERFORM 9500-RETURN-DB2-ERROR                                     
LRM008     END-IF.                                                              
LRM008     PERFORM UNTIL SQLCODE NOT = 0                                        
LRM008           OR ASSET-ON-OTHER-PTR                                          
LRM008        EXEC SQL                                                          
LRM008          FETCH                                                           
LRM008            VTRNFR_DUPE                                                   
LRM008             INTO                                                         
LRM008              :WS-DUPE-ACAT-CONTROL-NBR                                   
LRM008        END-EXEC                                                          
LRM008        IF SQLCODE = +0                                                   
LRM008           EXEC SQL                                                       
LRM008              SELECT                                                      
LRM008                CLIENT_NBR                                                
LRM008              INTO                                                        
LRM008                :DCLVTRNFR.CLIENT-NBR                                     
LRM008              FROM VASSET                                                 
LRM008            WHERE (CLIENT_NBR                                             
LRM008                        = :ACAT03IO-CLIENT-NBR                            
LRM008               AND ACAT_CONTROL_NBR                                       
LRM008                        = :WS-DUPE-ACAT-CONTROL-NBR                       
LRM008               AND ISIN_SEC_ISSUE_CD                                      
LRM008                        = :ACAT03IO-ISIN-SEC-ISSUE-CD                     
LRM008               AND SECURITY_ADP_NBR                                       
LRM008                        = :ACAT03IO-ADP-NBR                               
LRM008               AND CSH_MGN_SHRT_CD                                09180000
LRM008                        = :ACAT03IO-CSH-MGN-SHRT-CD)                      
LRM008           END-EXEC                                                       
LRM008                                                                          
LRM008           EVALUATE SQLCODE                                               
LRM008              WHEN +0                                                     
LRM008                  SET ACAT03IO-OTHER-AST-FND TO TRUE                      
LRM008                  SET ASSET-ON-OTHER-PTR TO TRUE                          
LRM008                  MOVE WS-DUPE-ACAT-CONTROL-NBR                           
LRM008                             TO ACAT03IO-DUPE-CONTROL-NBR                 
LRM008           END-EVALUATE                                                   
LRM008           MOVE +0 TO SQLCODE                                             
LRM008        END-IF                                                            
LRM008     END-PERFORM.                                                         
LRM008     EXEC SQL                                                             
LRM008        CLOSE VTRNFR_DUPE                                                 
LRM008     END-EXEC.                                                            
       0180-GET-ACTIAST.                                                09130000
      *----------------------------------------------------------------*        
      * DIRECT READ ON ASSET WITH FULL KEY.                                     
      *----------------------------------------------------------------*        
           EXEC SQL SELECT                                              09140000
                   ISIN_CNTRY_CD                                        09180000
                  ,ISIN_SEC_ISSUE_CD                                    09180000
                  ,ISIN_SEC_CDG_CD                                      09180000
                  ,STTLM_LCTN_CD                                        09180000
                  ,CSH_MGN_SHRT_CD                                      09180000
                  ,ASSET_PRC_CTGY_CD                                            
                  ,ASSET_RQST_QTY_CD                                            
                  ,AST_RQST_TRANS_CD                                            
                  ,WHI_CD                                                       
                  ,PSTN_CD                                                      
                  ,ASSET_DESC_TXT                                               
                  ,ASSET_AMT                                                    
                  ,ASSET_QTY                                                    
                  ,ASSET_PCT                                                    
                  ,ASSET_CMNT_TXT                                               
                  ,SECURITY_ADP_NBR                                             
                 INTO                                                   09160000
                   :ACAT03IO-ISIN-CNTRY-CD                                      
                  ,:ACAT03IO-ISIN-SEC-ISSUE-CD                                  
                  ,:ACAT03IO-ISIN-SEC-CDG-CD                                    
                  ,:ACAT03IO-STTLM-LCTN-CD                                      
                  ,:ACAT03IO-CSH-MGN-SHRT-CD                                    
                  ,:ACAT03IO-ASSET-PRC-CTGY-CD                                  
                  ,:ACAT03IO-ASSET-RQST-QTY-CD                                  
                  ,:ACAT03IO-AST-RQST-TRANS-CD                                  
                  ,:ACAT03IO-WHI-CD                                             
                  ,:ACAT03IO-PSTN-CD                                            
                  ,:ACAT03IO-DESC-TXT                                           
                  ,:ACAT03IO-ASSET-AMT                                          
                  ,:ACAT03IO-ASSET-QTY                                          
                  ,:ACAT03IO-ASSET-PCT                                          
                  ,:ACAT03IO-ASSET-CMNT-TXT                                     
                  ,:ACAT03IO-ADP-NBR                                            
                 FROM ACTIAST                                           09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
LRM007               AND ACAT_CONTROL_NBR                                       
LRM007                        = :ACAT03IO-CONTROL-NBR                           
                     AND DLVR_NBR                                       09180000
                              = :ACAT03IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT03IO-DLVR-ACCT                     09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT03IO-RCV-ACCT                      09190000
                     AND ISIN_CNTRY_CD                                  09180000
LRM018                        = :ACAT03IO-ISIN-CNTRY-CD                 09190000
                     AND ISIN_SEC_ISSUE_CD                              09180000
                              = :ACAT03IO-ISIN-SEC-ISSUE-CD                     
                     AND STTLM_LCTN_CD                                  09180000
                              = :ACAT03IO-STTLM-LCTN-CD                         
                     AND CSH_MGN_SHRT_CD                                09180000
                              = :ACAT03IO-CSH-MGN-SHRT-CD)                      
            END-EXEC.                                                   09200000
                                                                                
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     SET ACAT03IO-FOUND TO TRUE                                 
093800          WHEN +100                                               09260000
                     SET ACAT03IO-NOT-FOUND TO TRUE                             
                WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
                                                                                
           EJECT                                                                
       0200-ISRT-ACTITRF.                                               09130000
LRM007     IF ACAT03IO-DUPE-FOUND = 'Y'                                         
LRM007        PERFORM 0205-FIND-NEXT-DUMMY-CNTL-RTN                             
LRM007           THRU 0205-EXIT                                                 
LRM007     END-IF.                                                              
           INITIALIZE DCLACTITRF.                                               
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTITRF                       
                                  CRT-TMSTP OF DCLACTITRF                       
                                  ACAT03IO-UPDT-TMSTP.                          
           MOVE '0001-01-01'  TO PRCS-DT OF DCLACTITRF                          
                                STTLM-ASCTD-DT OF DCLACTITRF.                   
           MOVE ZERO TO PHSCL-SEQ-NBR OF DCLACTITRF                             
                        LGCL-SEQ-NBR  OF DCLACTITRF.                            
           MOVE 'B'  TO DSTBN-SIDE-CD OF DCLACTITRF.                            
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTITRF.                      
LRM007     MOVE ACAT03IO-DLVR-ACCT TO TRANS-RFRN-ID-CD OF DCLACTITRF            
LRM007                             WS-TRANS-RFRN-ID-CD                          
LRM007     IF ACAT03IO-CONTROL-NBR (1 : 2) = 'XX'                               
LRM007        PERFORM 0202-FORMAT-TRANS-RFRN-RTN                                
LRM007        MOVE WS-TRANS-RFRN-ID-CD                                          
LRM007                  TO TRANS-RFRN-ID-CD OF DCLACTITRF                       
LRM007     END-IF.                                                              
           EXEC SQL                                                     09140000
               INSERT INTO ACTITRF                                      09170000
                 (                                                      09150000
                   CLIENT_NBR                                           09180000
                  ,DLVR_NBR                                             09150000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_NBR                                              09180000
                  ,ACCT_RCV_NBR                                         09180000
                  ,TRNFR_TYPE_CD                                        09180000
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
                  ,CICS_SGNON_ID                                                
LRM013            ,CICS_NET_NM                                                  
LRM013            ,TPSCRT_USR_ID                                                
LRM013            ,TPSCRT_USR_NM                                                
                 )                                                      09150000
                 VALUES                                                         
                 (                                                      09150000
                    :ACAT03IO-CLIENT-NBR                                09190000
                   ,:ACAT03IO-DLVR-NBR                                  09190000
                   ,:ACAT03IO-DLVR-ACCT                                 09190000
                   ,:ACAT03IO-RCV-NBR                                   09190000
                   ,:ACAT03IO-RCV-ACCT                                  09190000
LRM015             ,:ACAT03IO-TRNFR-TYPE-CD                                     
                   ,:DCLACTITRF.RCV-NBR-STTS-CD                                 
                   ,:DCLACTITRF.DLVR-NBR-STTS-CD                                
                   ,:DCLACTITRF.ACCT-RCV-STTS-CD                                
                   ,:DCLACTITRF.ACCT-DLVR-STTS-CD                               
                   ,:ACAT03IO-RCV-NBR                                           
                   ,:DCLACTITRF.SBMT-PRT-NR-STS-CD                              
                   ,:ACAT03IO-CONTROL-NBR                                       
                   ,:DCLACTITRF.CONTROL-NBR-STS-CD                              
                   ,:DCLACTITRF.TRNFR-TYPE-STTS-CD                              
                   ,'A'                                                         
                   ,:DCLACTITRF.TRANS-TYPE-STTS-CD                              
                   ,:ACAT03IO-RCV-CUST-NM                                       
                   ,:DCLACTITRF.RCV-CUST-NM-STS-CD                              
                   ,:ACAT03IO-RCV-SS-PRIM-NBR                                   
                   ,:DCLACTITRF.RCV-SS-PRIM-STS-CD                              
                   ,:ACAT03IO-RCV-SS-SCNDY-NBR                                  
                   ,:DCLACTITRF.RCV-SS-SCDY-STS-CD                              
                   ,:ACAT03IO-RCV-ACCT-TYPE-CD                                  
                   ,:DCLACTITRF.RCV-ACT-TYP-STS-CD                              
                   ,:ACAT03IO-RCV-OCC-BRKR-NBR                                  
                   ,:DCLACTITRF.RCV-OCC-STTS-CD                                 
                   ,:DCLACTITRF.RCV-CRSPN-NBR                                   
                   ,:DCLACTITRF.RCV-CRSPN-STTS-CD                               
                   ,:DCLACTITRF.ACAT-CNTL-ASTD-NBR                              
                   ,:DCLACTITRF.CNTL-ASTD-STTS-CD                               
                   ,:ACAT03IO-CMNT-TXT                                          
                   ,:DCLACTITRF.CMNT-STTS-CD                                    
                   ,:DCLACTITRF.PRCS-DT                                         
                   ,:DCLACTITRF.STTS-CD                                         
                   ,:DCLACTITRF.DSTBN-SIDE-CD                                   
                   ,:DCLACTITRF.SYS-ACT-CD                                      
                   ,:DCLACTITRF.SYS-RJCT-RSN-CD                                 
                   ,:DCLACTITRF.TRNFR-TYPE-RJCT-CD                              
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
LRM007             ,:DCLACTITRF.TRANS-RFRN-ID-CD                                
                   ,:DCLACTITRF.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTITRF.DB-CR-CD                                        
                   ,:DCLACTITRF.STTLM-ASCTD-DT                                  
                   ,:DCLACTITRF.STTLM-ASCTD-STS-CD                              
                   ,:DCLACTITRF.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTITRF.RCRD-STTS-CD                                    
                   ,:ACAT03IO-NSCC-PEND-CD                                      
                   ,:DCLACTITRF.NSCC-ACK-IND                                    
                   ,:DCLACTITRF.UPDT-TMSTP                                      
                   ,:DCLACTITRF.CRT-TMSTP                                       
                   ,:DCLACTITRF.CICS-TERM-ID-CD                                 
                   ,'ACAT03DB'                                                  
                   ,:ACAT03IO-RR-CD                                             
                   ,:ACAT03IO-SIGN-ON-ID                                        
LRM013             ,:ACAT03IO-NETNAME                                           
LRM013             ,:ACAT03IO-USER-ID                                           
LRM013             ,:ACAT03IO-USER-NAME                                         
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
                                                                                
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT03IO-GOOD-RESP TO TRUE                     09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
                                                                                
           IF ACAT03IO-DESC-TXT(1 : 1) > SPACES                                 
              PERFORM 0220-ISRT-ACTIAST.                                   09130
                                                                                
LRM007 0202-FORMAT-TRANS-RFRN-RTN.                                              
LRM007     PERFORM VARYING SUB FROM 20 BY -1                                    
LRM007         UNTIL SUB < 1  OR WS-TRANS-RFRN-ID-CD (SUB : 1) > ' '            
LRM007     END-PERFORM.                                                         
LRM007     IF SUB > 16                                                          
LRM007        MOVE 16 TO SUB2                                                   
LRM007     ELSE                                                                 
LRM007        ADD 1 TO SUB GIVING SUB2                                          
LRM007     END-IF.                                                              
LRM007     MOVE ACAT03IO-CONTROL-NBR (1 : 5) TO                                 
LRM007             WS-TRANS-RFRN-ID-CD (SUB2 : 5).                              
           EJECT                                                                
LRM007 0205-FIND-NEXT-DUMMY-CNTL-RTN.                                           
LRM007     MOVE 'XX' TO ACAT03IO-CONTROL-NBR                                    
LRM007*** READ THE INIT TABLE FOR THE GREATEST ARTIFICIAL CNTL NBR              
LRM007*** FOR THIS SET OF KEYS... NONE FOUND USE XX0000                         
LRM007*** - NEED  SYNTAX FOR FIRST ONE                                          
   ******        FIRST 1 ROW ONLY                                               
           EXEC SQL OPEN                                                09140000
              ACTITRF_LAST_CNTL                                                 
           END-EXEC.                                                    09200000
           IF SQLCODE = +0                                              09220000
              EXEC SQL FETCH                                            09140000
                 ACTITRF_LAST_CNTL                                              
                 INTO                                                   09160000
                   :DCLACTITRF.ACAT-CONTROL-NBR                                 
               END-EXEC                                                 09200000
            END-IF.                                                             
      *                                                                 09210000
            EVALUATE SQLCODE                                            09220000
                WHEN +0                                                 09260000
                     IF ACAT-CONTROL-NBR OF DCLACTITRF (1 : 2) = 'XX'           
                     AND ACAT-CONTROL-NBR OF DCLACTITRF (3 : 3) NUMERIC         
                       MOVE ACAT-CONTROL-NBR OF DCLACTITRF (3 : 3)              
                                 TO WS-NEXT-CNTL-NBR                            
                       ADD 1 TO WS-NEXT-CNTL-NBR                                
                       MOVE WS-NEXT-CNTL-NBR TO                                 
                               ACAT03IO-CONTROL-NBR(3 : 3)                      
                     ELSE                                                       
                        MOVE '001' TO ACAT03IO-CONTROL-NBR(3 : 3)               
                     END-IF                                                     
                WHEN +100                                               09260000
                     MOVE '001' TO ACAT03IO-CONTROL-NBR(3 : 3)                  
                WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
            END-EVALUATE.                                               09300000
      *                                                                 09210000
LRM007 0205-EXIT. EXIT.                                                         
           EJECT                                                                
       0220-ISRT-ACTIAST.                                                  09130
           INITIALIZE DCLACTIAST.                                               
           MOVE 'N' TO BEARER-BOND-CD OF DCLACTIAST.                            
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTIAST                       
                                  CRT-TMSTP OF DCLACTIAST.                      
           MOVE ZEROS TO ASSET-SEQ-NBR OF DCLACTIAST                            
                         PHSCL-SEQ-NBR OF DCLACTIAST                            
                         LGCL-SEQ-NBR OF DCLACTIAST.                            
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTIAST.                      
                                                                                
           MOVE '00' TO OPTN-CTGY-CD OF DCLACTIAST.                             
           IF ACAT03IO-STTLM-LCTN-CD = '35'                                     
               MOVE 'OPT ' TO STTLM-RSN-CD OF DCLACTIAST                        
           ELSE                                                                 
           IF ACAT03IO-STTLM-LCTN-CD = '45'                                     
               MOVE 'COMT' TO STTLM-RSN-CD OF DCLACTIAST                        
           ELSE                                                                 
           IF ACAT03IO-STTLM-LCTN-CD = '50'                                     
               MOVE 'XSET' TO STTLM-RSN-CD OF DCLACTIAST                        
           END-IF.                                                              
LRM012     SET WK-MS-NON-OPT TO TRUE.                                           
LRM012     IF ACAT03IO-STTLM-LCTN-CD = '35'                                     
LRM012        PERFORM 0225-GETMSD-OPTIONS-RTN                                   
LRM012     END-IF.                                                              
LRM012     IF  WK-MS-NON-OPT                                                    
LRM012         MOVE '00'           TO OPTN-CTGY-CD       OF DCLACTIAST          
LRM012     ELSE                                                                 
LRM012       IF  WK-MS-EQUITY-OPT                                               
LRM012           MOVE '01'         TO OPTN-CTGY-CD       OF DCLACTIAST          
LRM012       ELSE                                                               
LRM012         IF  WK-MS-NON-EQU-OPT                                            
LRM012             MOVE '02'       TO OPTN-CTGY-CD       OF DCLACTIAST          
LRM012         ELSE                                                             
LRM012             MOVE '03'       TO OPTN-CTGY-CD       OF DCLACTIAST          
LRM012         END-IF                                                           
LRM012       END-IF                                                             
LRM012     END-IF.                                                              
LRM007     MOVE ACAT03IO-CONTROL-NBR TO ACAT-CONTROL-NBR OF DCLACTIAST.         
LRM007     MOVE ACAT03IO-DLVR-ACCT TO TRANS-RFRN-ID-CD OF DCLACTIAST            
LRM007                             WS-TRANS-RFRN-ID-CD                          
LRM007     IF ACAT03IO-CONTROL-NBR (1 : 2) = 'XX'                               
LRM007        PERFORM 0202-FORMAT-TRANS-RFRN-RTN                                
LRM007        MOVE WS-TRANS-RFRN-ID-CD                                          
LRM007                  TO TRANS-RFRN-ID-CD OF DCLACTIAST                       
LRM007     END-IF.                                                              
                                                                                
LRM012     IF ACAT03IO-STTLM-LCTN-CD = '35'                                     
LRM012        PERFORM 0227-BUILD-ACTIOPN                                        
LRM012     END-IF.                                                              
                                                                                
           EXEC SQL                                                     09140000
               INSERT INTO ACTIAST                                      09170000
                 (                                                      09150000
                   CLIENT_NBR                                           09180000
                  ,DLVR_NBR                                             09150000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_NBR                                              09180000
                  ,ACCT_RCV_NBR                                         09180000
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
                  ,CICS_SGNON_ID                                                
                 )                                                      09150000
                 VALUES                                                         
                 (                                                      09150000
                    :ACAT03IO-CLIENT-NBR                                09190000
                   ,:ACAT03IO-DLVR-NBR                                  09190000
                   ,:ACAT03IO-DLVR-ACCT                                 09190000
                   ,:ACAT03IO-RCV-NBR                                   09190000
                   ,:ACAT03IO-RCV-ACCT                                  09190000
                   ,:ACAT03IO-ISIN-CNTRY-CD                                     
                   ,:ACAT03IO-ISIN-SEC-ISSUE-CD                                 
                   ,:ACAT03IO-ISIN-SEC-CDG-CD                                   
                   ,:ACAT03IO-STTLM-LCTN-CD                                     
                   ,:ACAT03IO-CSH-MGN-SHRT-CD                                   
                   ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                              
                   ,:DCLACTIAST.STTLM-LCTN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                              
                   ,:ACAT03IO-RCV-NBR                                           
                   ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                              
                   ,:DCLACTIAST.ACAT-CONTROL-NBR                                
                   ,:DCLACTIAST.CONTROL-NBR-STS-CD                              
                   ,:DCLACTIAST.ASSET-SEQ-NBR                                   
                   ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                              
                   ,'A'                                                         
                   ,:DCLACTIAST.TRANS-TYPE-STTS-CD                              
                   ,:DCLACTIAST.PHSCL-SEQ-NBR                                   
                   ,:DCLACTIAST.PHSCL-SEQ-STTS-CD                               
                   ,:DCLACTIAST.LGCL-SEQ-NBR                                    
                   ,:DCLACTIAST.LGCL-SEQ-NR-STS-CD                              
                   ,:ACAT03IO-ASSET-PRC-CTGY-CD                                 
                   ,:DCLACTIAST.AST-PRC-CTG-STS-CD                              
                   ,:DCLACTIAST.STTLM-RSN-CD                                    
                   ,:DCLACTIAST.STTLM-RSN-STTS-CD                               
                   ,:ACAT03IO-DESC-TXT                                          
                   ,:DCLACTIAST.ASSET-DESC-STTS-CD                              
                   ,:ACAT03IO-ASSET-RQST-QTY-CD                                 
                   ,:DCLACTIAST.ASSET-RQST-STS-CD                               
                   ,:ACAT03IO-AST-RQST-TRANS-CD                                 
                   ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                              
                   ,:ACAT03IO-ASSET-QTY                                         
                   ,:DCLACTIAST.ASSET-QTY-STTS-CD                               
                   ,:ACAT03IO-ASSET-PCT                                         
                   ,:DCLACTIAST.ASSET-PCT-STTS-CD                               
                   ,:ACAT03IO-PSTN-CD                                           
                   ,:DCLACTIAST.PSTN-CD-STTS-CD                                 
                   ,:DCLACTIAST.ISO-CRNCY-CD                                    
                   ,:DCLACTIAST.ISO-CRNCY-STTS-CD                               
                   ,:ACAT03IO-ASSET-AMT                                         
                   ,:DCLACTIAST.ASSET-AMT-STTS-CD                               
                   ,:DCLACTIAST.BEARER-BOND-CD                                  
                   ,:DCLACTIAST.BEARER-BND-STTS-CD                              
                   ,:ACAT03IO-WHI-CD                                            
                   ,:DCLACTIAST.WHI-STTS-CD                                     
                   ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                               
                   ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                              
                   ,:DCLACTIAST.MBS-SERIAL-NBR                                  
                   ,:DCLACTIAST.MBS-SERIAL-STTS-CD                              
                   ,:ACAT03IO-ASSET-CMNT-TXT                                    
                   ,:DCLACTIAST.ASSET-CMNT-STTS-CD                              
                   ,:DCLACTIAST.NSCC-WTHLD-CD                                   
LRM007             ,:DCLACTIAST.TRANS-RFRN-ID-CD                        09190000
                   ,:DCLACTIAST.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                              
                   ,:DCLACTIAST.OPTN-CTGY-CD                                    
                   ,:DCLACTIAST.OPTN-CTGY-STTS-CD                               
                   ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTIAST.RCRD-STTS-CD                                    
                   ,:ACAT03IO-NSCC-PEND-CD                                      
                   ,:DCLACTIAST.NSCC-ACK-IND                                    
                   ,'ACAT03DB'                                                  
                   ,:DCLACTIAST.CICS-TERM-ID-CD                                 
                   ,:DCLACTIAST.UPDT-TMSTP                                      
                   ,:DCLACTIAST.CRT-TMSTP                                       
                   ,:ACAT03IO-ADP-NBR                                           
LRM015             ,:ACAT03IO-TRNFR-TYPE-CD                                     
                   ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                              
                   ,:DCLACTIAST.RCV-NBR-STTS-CD                                 
                   ,:DCLACTIAST.DLVR-NBR-STTS-CD                                
                   ,:ACAT03IO-SIGN-ON-ID                                        
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT03IO-GOOD-RESP TO TRUE                     09240000
LRM012               IF ACAT03IO-STTLM-LCTN-CD = '35'                           
LRM012                  PERFORM 0227-INSERT-ACTIOPN                             
LRM012               END-IF                                                     
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
                                                                                
LRM002 0225-GETMSD-OPTIONS-RTN.                                                 
LRM016     EXEC CICS ASSIGN APPLID                                              
LRM016             (WS-REGION-NAME)                                             
LRM016     END-EXEC.                                                            
LRM002* LINK TO MSDIO TO OBTAIN NEEDED FIELDS                                   
           MOVE 'E'                  TO MSDIO-ACCESS.                           
           MOVE ' '                  TO MSDIO-ACTION.                           
           MOVE ACAT03IO-ADP-NBR     TO MSDIO-SEARCH-KEY.                       
           IF  ACAT03IO-WHI-CD = 'W'                                            
               MOVE '1'              TO MSDIO-WHEN-ISSUE                        
           ELSE                                                                 
               MOVE ZERO             TO MSDIO-WHEN-ISSUE                        
           END-IF.                                                              
           MOVE SPACE                TO MSDIO-RETURN-CODE.                      
                                                                                
           EXEC CICS LINK PROGRAM ('MSDIO')                                     
                          COMMAREA (MSDIO-CALLING-AREA)                         
                          LENGTH (LENGTH OF MSDIO-CALLING-AREA)                 
           END-EXEC.                                                            
           IF MSDIO-RETURN-CODE = SPACE                                         
              MOVE MS-FORMAT-IND            TO WK-MS-CLASS-1                    
              MOVE MS-SECURITY-TYPE         TO WK-MS-SEC-TYPE-X                 
              MOVE WK-MS-SEC-TYPE-P         TO WK-MS-SEC-TYPE-N                 
              MOVE WK-MS-SEC-TYPE           TO WK-MS-CLASS-2-5                  
              MOVE MS-SECURITY-TYPE-2       TO WK-MS-CLASS-6-7                  
              MOVE MS-SYMBOL-AREA       TO WK-MS-SYMBOL-9                       
              EVALUATE TRUE                                                     
                  WHEN WK-MS-CLASS-5 = 5                                        
                      MOVE '3'              TO WK-MS-ASSET-TYPE                 
                  WHEN (WK-MS-CLASS-6 = 0 OR 4)                                 
                      MOVE '1'              TO WK-MS-ASSET-TYPE                 
                  WHEN OTHER                                                    
                      MOVE '2'              TO WK-MS-ASSET-TYPE                 
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
LRM012 0227-BUILD-ACTIOPN.                                                      
LRM012     MOVE ' ' TO DCLACTIOPN.                                              
LRM012     MOVE ACAT03IO-CLIENT-NBR    TO CLIENT-NBR OF DCLACTIOPN              
LRM012     MOVE ACAT03IO-DLVR-NBR      TO DLVR-NBR   OF DCLACTIOPN              
LRM012     MOVE ACAT03IO-RCV-NBR       TO RCV-NBR    OF DCLACTIOPN              
LRM012     MOVE ACAT03IO-DLVR-ACCT     TO ACCT-DLVR-NBR OF DCLACTIOPN           
LRM012     MOVE ACAT03IO-RCV-ACCT      TO ACCT-RCV-NBR OF DCLACTIOPN            
LRM012     MOVE ACAT03IO-ISIN-CNTRY-CD TO ISIN-CNTRY-CD OF DCLACTIOPN           
LRM012     MOVE ACAT03IO-ISIN-SEC-ISSUE-CD                                      
LRM012                             TO ISIN-SEC-ISSUE-CD OF DCLACTIOPN           
LRM012     MOVE ACAT03IO-ISIN-SEC-CDG-CD                                        
LRM012                               TO ISIN-SEC-CDG-CD OF DCLACTIOPN           
LRM012     MOVE ACAT03IO-STTLM-LCTN-CD                                          
LRM012                             TO STTLM-LCTN-CD OF DCLACTIOPN               
LRM012     MOVE ACAT03IO-CSH-MGN-SHRT-CD                                        
LRM012                           TO CSH-MGN-SHRT-CD OF DCLACTIOPN               
LRM012     MOVE ACAT03IO-ADP-NBR                                                
LRM012                          TO SECURITY-ADP-NBR OF DCLACTIOPN               
LRM012     MOVE ACAT03IO-CONTROL-NBR                                            
LRM012                          TO ACAT-CONTROL-NBR OF DCLACTIOPN               
LRM012     MOVE ZEROS           TO ASSET-SEQ-NBR    OF DCLACTIOPN               
LRM012     MOVE ACAT03IO-TRNFR-TYPE-CD                                          
LRM012                          TO TRNFR-TYPE-CD    OF DCLACTIOPN               
LRM012     MOVE EIBTRMID        TO CICS-TERM-ID-CD  OF DCLACTIOPN               
LRM012     MOVE MS-DESC1                 TO WK-MS-DESC1                         
LRM012     MOVE MS-DESC2                 TO WK-MS-DESC2                         
LRM012     IF  MS-DESC2 > ' '                                                   
LRM012         MOVE MS-DESC2             TO WK-MS-DESC2                         
LRM012     END-IF                                                               
LRM012     IF  MS-DESC3 > ' '                                                   
LRM012         MOVE MS-DESC3             TO WK-MS-DESC3                         
LRM012     END-IF                                                               
LRM012     INITIALIZE                W-OPT-DESC                                 
LRM012     MOVE MS-OPTION-EXP-DATE       TO WK-MS-EXP-DATE                      
LRM017*****IF (WS-REGION-NAME = 'TCICSRJE' OR 'TCICSQUA')                       
LRM016        MOVE WK-MS-EXP-MM-NEW          TO W-OPT-EXPTN-MM-NEW              
LRM016        MOVE '/'                       TO W-OPT-EXPTN-S1-NEW              
LRM016                                          W-OPT-EXPTN-S2-NEW              
LRM016        MOVE WK-MS-EXP-DD-NEW          TO W-OPT-EXPTN-DD-NEW              
LRM016        MOVE WK-MS-EXP-YY-NEW          TO W-OPT-EXPTN-YY-NEW              
LRM016        IF MS-EXP-OPT-STRIKE-PRC NOT = ZEROS                              
LRM016           MOVE MS-EXP-OPT-STRIKE-PRC TO WK-MS-OPT-PRICE-NEW              
LRM016        ELSE                                                              
LRM016           MOVE MS-EXP-OPTION-STRIKE-PRICE TO WK-MS-OPT-PRICE-NEW         
LRM016        END-IF                                                            
LRM016        MOVE WK-MS-OPT-PRC-NEW         TO W-OPT-STRIKE-PRIC-NEW           
LRM016        IF WK-MS-OPT-FRAC-NEW = ZEROS                                     
LRM016           MOVE SPACES                 TO W-OPT-STRIKE-FRAC-NEW           
LRM016        ELSE                                                              
LRM016           MOVE WK-MS-OPT-FRAC-NEW     TO W-OPT-STRIKE-FRAC-NEW           
LRM016        END-IF.                                                           
LRM016**** ELSE                                                                 
LRM012****    MOVE WK-MS-EXP-MM             TO WK-MS-OPT-MM                     
LRM012****    MOVE WK-MS-EXP-Y              TO WK-MS-OPT-Y                      
LRM012****    MOVE MS-EXP-OPTION-STRIKE-PRICE TO WK-MS-OPT-PRICE                
LRM012****    MOVE MS-OPTION-FACTOR           TO WK-MS-OPTION-FACTOR            
LRM012****                                                                      
LRM012****    IF  WK-MS-OPT-FRAC = ZERO                                         
LRM012****       MOVE ZERO                 TO WK-MS-OPT-FRAC-1                  
LRM012****                                  WK-MS-OPT-DECI-ROUNDED              
LRM012****    ELSE                                                              
LRM012****    IF MSD-FRACTION-DECIMAL-IND = 'D'                                 
LRM012****       COMPUTE WK-MS-OPT-DECI-ROUNDED = WK-MS-OPT-FRAC / 1000         
LRM012****       END-COMPUTE                                                    
LRM012****    ELSE                                                              
LRM012****       COMPUTE WK-MS-OPT-FRAC-6 = WK-MS-OPT-FRAC * 8                  
LRM012****       END-COMPUTE                                                    
LRM012**** END-IF.                                                              
LRM012                                                                          
LRM012****REVERSE THE BUY/SELL SIGN FOR OCC                                     
LRM012     IF ACAT03IO-PSTN-CD = 'S'                                            
LRM012         MOVE 'B'             TO BS-CD             OF DCLACTIOPN          
LRM012     ELSE                                                                 
LRM012         MOVE 'S'             TO BS-CD             OF DCLACTIOPN          
LRM012     END-IF                                                               
LRM012     MOVE WK-MS-PUT-CALL      TO PTCL-CD           OF DCLACTIOPN          
LRM012****OPEN/CLOSE IS ALWAYS CLOSE                                            
LRM012     MOVE 'C'                 TO OPTN-OPN-CLSD-CD  OF DCLACTIOPN          
LRM012                                                                          
LRM017**** IF (WS-REGION-NAME = 'TCICSRJE' OR 'TCICSQUA')                       
LRM016       MOVE WK-MS-OPT-PRC-NEW  TO STPRC-INTEGER-AMT OF DCLACTIOPN         
LRM016       MOVE WK-MS-OPT-FRAC-NEW TO STPRC-FRCTN-AMT   OF DCLACTIOPN.        
LRM016**** ELSE                                                                 
      ****    MOVE WK-MS-OPT-PRC    TO STPRC-INTEGER-AMT OF DCLACTIOPN          
      ****    IF MSD-FRACTION-DECIMAL-IND = 'D'                                 
      ****       MOVE WK-MS-OPT-DECI-ROUNDED                                    
      ****                          TO STPRC-FRCTN-AMT   OF DCLACTIOPN          
      ****    ELSE                                                              
      ****      MOVE WK-MS-OPT-FRAC-1 TO STPRC-FRCTN-AMT OF DCLACTIOPN          
      **** END-IF.                                                              
LRM012     MOVE WK-MS-EXP-DATE(1:4) TO W-DATE-YEAR                              
LRM012     MOVE WK-MS-EXP-DATE(5:2) TO W-DATE-MM                                
LRM012     MOVE WK-MS-EXP-DATE(7:2) TO W-DATE-DD                                
LRM012     IF W-DATE-MM < '01' OR > '12'                                        
LRM012        MOVE '12' TO W-DATE-MM                                            
LRM012     END-IF.                                                              
LRM012     IF W-DATE-DD < '01' OR > '31'                                        
LRM012        MOVE '31' TO W-DATE-DD                                            
LRM012     END-IF.                                                              
LRM012     IF W-DATE-YEAR NOT NUMERIC                                           
LRM012     OR W-DATE-YEAR = '0000'                                              
LRM012        MOVE '9999' TO W-DATE-YEAR                                        
LRM012     END-IF.                                                              
LRM012     MOVE W-DATE              TO EXPTN-DT          OF DCLACTIOPN          
LRM012     MOVE WK-MS-OPT-PRC       TO STPRC-INTEGER-AMT OF DCLACTIOPN          
LRM012     IF MSD-FRACTION-DECIMAL-IND = 'D'                                    
LRM012        MOVE WK-MS-OPT-DECI-ROUNDED                                       
LRM012                              TO STPRC-FRCTN-AMT   OF DCLACTIOPN          
LRM012     ELSE                                                                 
LRM012        MOVE WK-MS-OPT-FRAC-1 TO STPRC-FRCTN-AMT   OF DCLACTIOPN          
LRM012     END-IF.                                                              
LRM012     MOVE ' '                 TO DLVR-OCC-NBR      OF DCLACTIOPN          
LRM012     MOVE 'C'                 TO OPTN-ACCT-TYPE-CD OF DCLACTIOPN          
LRM017**** IF (WS-REGION-NAME = 'TCICSRJE' OR 'TCICSQUA')                       
LRM016       MOVE WK-MS-OPT-PRC-NEW  TO STPRC-INTEGER-AMT OF DCLACTIOPN         
LRM016       MOVE WK-MS-OPT-FRAC-NEW TO STPRC-FRCTN-AMT   OF DCLACTIOPN.        
LRM016**** ELSE                                                                 
LRM012****    MOVE WK-MS-OPT-PRC               TO W-STPRC-INTEGER-AMT           
LRM012****    MOVE WK-MS-OPT-FRAC-1            TO W-STPRC-FRCTN-AMT             
LRM012****    MOVE W-STPRC-INTEGER-AMT         TO W-OPT-STRIKE-PRIC             
LRM012****    IF   W-STPRC-FRCTN = '00'                                         
LRM012****    AND  MSD-FRACTION-DECIMAL-IND NOT = 'D'                           
LRM012****          MOVE ' '            TO W-OPT-STRIKE-FRAC                    
LRM012****          MOVE ' '            TO W-OPT-SLASH-8                        
LRM012****    ELSE                                                              
LRM012****          IF MSD-FRACTION-DECIMAL-IND = 'D'                           
LRM012****             MOVE '0'            TO W-OPT-STRIKE-FRAC                 
LRM012****          ELSE                                                        
LRM012****             MOVE W-STPRC-FRCTN (2:1)                                 
LRM012****                              TO W-OPT-STRIKE-FRAC                    
LRM012****          END-IF                                                      
LRM012****          MOVE '/8'           TO W-OPT-SLASH-8                        
LRM012**** END-IF.                                                              
                                                                                
LRM012     MOVE ' '                 TO ACCT-SUB-CD       OF DCLACTIOPN          
LRM012     MOVE WK-MS-DESC1         TO OPTN-CMNT-TXT     OF DCLACTIOPN          
LRM012                                                                          
LRM012     MOVE 'ACAT03DB'          TO PRGM-NM           OF DCLACTIOPN          
LRM012     MOVE WS-TIMESTAMP        TO CRT-TMSTP         OF DCLACTIOPN          
LRM012                                 UPDT-TMSTP        OF DCLACTIOPN          
LRM012     MOVE 'N'                 TO NSCC-ACK-IND      OF DCLACTIOPN          
LRM012     MOVE 'H'                 TO NSCC-PEND-CD      OF DCLACTIOPN          
LRM012                                                                          
LRM012     IF  BS-CD OF DCLACTIOPN = 'B'                                        
LRM012            MOVE 'BUY'          TO W-OPT-BUY-SELL                         
LRM012     ELSE                                                                 
LRM012            MOVE 'SELL'         TO W-OPT-BUY-SELL                         
LRM012     END-IF                                                               
LRM012     IF  OPTN-OPN-CLSD-CD OF DCLACTIOPN = 'O'                             
LRM012            MOVE 'OPEN'         TO W-OPT-OPEN-CLOSE                       
LRM012     ELSE                                                                 
LRM012            MOVE 'CLOS'         TO W-OPT-OPEN-CLOSE                       
LRM012     END-IF                                                               
LRM012     IF  PTCL-CD OF DCLACTIOPN = 'C'                                      
LRM012            MOVE 'CALL'         TO W-OPT-CALL-PUT                         
LRM012     ELSE                                                                 
LRM012            MOVE 'PUT '         TO W-OPT-CALL-PUT                         
LRM012     END-IF.                                                              
LRM017**** IF (WS-REGION-NAME = 'TCICSRJE' OR 'TCICSQUA')                       
LRM016        IF MSD-OCC-OPTN-SYM-ID > SPACES                                   
LRM016           MOVE MSD-OCC-OPTN-SYM-ID TO SYM-CD    OF DCLACTIOPN            
LRM016        ELSE                                                              
LRM016*-------------------------------------------------------------*           
LRM016* USE ADP NBR OF UNDERLYING SEC TO GET THE UNDERLYING SYMBOL.             
LRM016*-------------------------------------------------------------*           
LRM016        MOVE 'E'                  TO MSDIO-ACCESS                         
LRM016        MOVE ' '                  TO MSDIO-ACTION                         
LRM016        MOVE MS-XREF-NO           TO MSDIO-SEARCH-KEY                     
LRM016        IF  ACAT03IO-WHI-CD = 'W'                                         
LRM016            MOVE '1'              TO MSDIO-WHEN-ISSUE                     
LRM016        ELSE                                                              
LRM016            MOVE ZERO             TO MSDIO-WHEN-ISSUE                     
LRM016        END-IF                                                            
LRM016        MOVE SPACE                TO MSDIO-RETURN-CODE                    
LRM016                                                                          
LRM016        EXEC CICS LINK PROGRAM ('MSDIO')                                  
LRM016                       COMMAREA (MSDIO-CALLING-AREA)                      
LRM016                       LENGTH (LENGTH OF MSDIO-CALLING-AREA)              
LRM016        END-EXEC                                                          
LRM016        IF MSDIO-RETURN-CODE = SPACE                                      
LRM016           MOVE MS-SYMBOL-AREA TO SYM-CD        OF DCLACTIOPN             
LRM016        END-IF.                                                           
LRM016**** ELSE                                                                 
LRM012****    MOVE MS-SYMBOL                   TO W-OPT-MS-SYMBOL               
LRM012****    MOVE WK-MS-EXP-DATE(5:2)         TO W-OPT-EXPTN-MM                
LRM012****    MOVE '/'                         TO W-OPT-EXPTN-S1                
LRM012****    MOVE WK-MS-EXP-DATE(1:2)         TO W-OPT-EXPTN-CC                
LRM012****    MOVE WK-MS-EXP-DATE(3:2)         TO W-OPT-EXPTN-YY                
LRM012****                                                                      
LRM012****    PERFORM 0228-GETMSD-OPTION-SYMBOL                                 
LRM012****    MOVE WK-MS-SYMBOL                   TO W-OPT-SYMBOL               
LRM012****    MOVE WK-MS-SYMBOL        TO SYM-CD         OF DCLACTIOPN          
LRM016**** END-IF.                                                              
                                                                                
LRM012     IF (ACAT03IO-DESC-TXT (1:60) = ' ')                                  
LRM012           MOVE W-OPT-DESC TO ACAT03IO-DESC-TXT (1:60)                    
LRM012     ELSE                                                                 
LRM012      IF (ACAT03IO-DESC-TXT (31:60) = ' ')                                
LRM012           MOVE W-OPT-DESC TO ACAT03IO-DESC-TXT (31:60)                   
LRM012      ELSE                                                                
LRM012       IF (ACAT03IO-DESC-TXT (61:60) = ' ')                               
LRM012           MOVE W-OPT-DESC TO ACAT03IO-DESC-TXT (61:60)                   
LRM012       ELSE                                                               
LRM012        IF (ACAT03IO-DESC-TXT (91:30) = ' ')                              
LRM012           MOVE W-OPT-DESC TO ACAT03IO-DESC-TXT (91:30)                   
LRM012        END-IF                                                            
LRM012       END-IF                                                             
LRM012      END-IF                                                              
LRM012     END-IF.                                                              
LRM012 0227-INSERT-ACTIOPN.                                                     
LRM012     EXEC SQL                                                             
LRM012         INSERT INTO ACTIOPN                                              
LRM012           (                                                              
LRM012             CLIENT_NBR                                                   
LRM012            ,RCV_NBR                                                      
LRM012            ,DLVR_NBR                                                     
LRM012            ,ISIN_CNTRY_CD                                                
LRM012            ,ISIN_SEC_ISSUE_CD                                            
LRM012            ,ISIN_SEC_CDG_CD                                              
LRM012            ,STTLM_LCTN_CD                                                
LRM012            ,CSH_MGN_SHRT_CD                                              
LRM012            ,BS_STTS_CD                                                   
LRM012            ,PTCL_STTS_CD                                                 
LRM012            ,OPT_OPN_CLS_TST_CD                                           
LRM012            ,SYM_STTS_CD                                                  
LRM012            ,OPTN_EXPTN_DT_CD                                             
LRM012            ,STPRC_INTR_STTS_CD                                           
LRM012            ,STPRC_FRCT_STTS_CD                                           
LRM012            ,OPT_OCC_DLV_STS_CD                                           
LRM012            ,OPT_ACT_TYP_STS_CD                                           
LRM012            ,ACCT_SUB_STTS_CD                                             
LRM012            ,OPTN_CMNT_CD                                                 
LRM012            ,BS_CD                                                        
LRM012            ,PTCL_CD                                                      
LRM012            ,OPTN_OPN_CLSD_CD                                             
LRM012            ,SYM_CD                                                       
LRM012            ,EXPTN_DT                                                     
LRM012            ,STPRC_INTEGER_AMT                                            
LRM012            ,STPRC_FRCTN_AMT                                              
LRM012            ,DLVR_OCC_NBR                                                 
LRM012            ,OPTN_ACCT_TYPE_CD                                            
LRM012            ,ACCT_SUB_CD                                                  
LRM012            ,OPTN_CMNT_TXT                                                
LRM012            ,PRGM_NM                                                      
LRM012            ,CICS_TERM_ID_CD                                              
LRM012            ,CRT_TMSTP                                                    
LRM012            ,UPDT_TMSTP                                                   
LRM012            ,ACCT_DLVR_NBR                                                
LRM012            ,ACCT_RCV_NBR                                                 
LRM012            ,SECURITY_ADP_NBR                                             
LRM012            ,NSCC_ACK_IND                                                 
LRM012            ,NSCC_PEND_CD                                                 
LRM012            ,ACAT_CONTROL_NBR                                             
LRM012            ,ASSET_SEQ_NBR                                                
LRM012            ,TRNFR_TYPE_CD                                                
LRM012           )                                                              
LRM012           VALUES                                                         
LRM012           (                                                              
LRM012             :DCLACTIOPN.CLIENT-NBR                                       
LRM012            ,:DCLACTIOPN.RCV-NBR                                          
LRM012            ,:DCLACTIOPN.DLVR-NBR                                         
LRM012            ,:DCLACTIOPN.ISIN-CNTRY-CD                                    
LRM012            ,:DCLACTIOPN.ISIN-SEC-ISSUE-CD                                
LRM012            ,:DCLACTIOPN.ISIN-SEC-CDG-CD                                  
LRM012            ,:DCLACTIOPN.STTLM-LCTN-CD                                    
LRM012            ,:DCLACTIOPN.CSH-MGN-SHRT-CD                                  
LRM012            ,:DCLACTIOPN.BS-STTS-CD                                       
LRM012            ,:DCLACTIOPN.PTCL-STTS-CD                                     
LRM012            ,:DCLACTIOPN.OPT-OPN-CLS-TST-CD                               
LRM012            ,:DCLACTIOPN.SYM-STTS-CD                                      
LRM012            ,:DCLACTIOPN.OPTN-EXPTN-DT-CD                                 
LRM012            ,:DCLACTIOPN.STPRC-INTR-STTS-CD                               
LRM012            ,:DCLACTIOPN.STPRC-FRCT-STTS-CD                               
LRM012            ,:DCLACTIOPN.OPT-OCC-DLV-STS-CD                               
LRM012            ,:DCLACTIOPN.OPT-ACT-TYP-STS-CD                               
LRM012            ,:DCLACTIOPN.ACCT-SUB-STTS-CD                                 
LRM012            ,:DCLACTIOPN.OPTN-CMNT-CD                                     
LRM012            ,:DCLACTIOPN.BS-CD                                            
LRM012            ,:DCLACTIOPN.PTCL-CD                                          
LRM012            ,:DCLACTIOPN.OPTN-OPN-CLSD-CD                                 
LRM012            ,:DCLACTIOPN.SYM-CD                                           
LRM012            ,:DCLACTIOPN.EXPTN-DT                                         
LRM012            ,:DCLACTIOPN.STPRC-INTEGER-AMT                                
LRM012            ,:DCLACTIOPN.STPRC-FRCTN-AMT                                  
LRM012            ,:DCLACTIOPN.DLVR-OCC-NBR                                     
LRM012            ,:DCLACTIOPN.OPTN-ACCT-TYPE-CD                                
LRM012            ,:DCLACTIOPN.ACCT-SUB-CD                                      
LRM012            ,:DCLACTIOPN.OPTN-CMNT-TXT                                    
LRM012            ,:DCLACTIOPN.PRGM-NM                                          
LRM012            ,:DCLACTIOPN.CICS-TERM-ID-CD                                  
LRM012            ,:DCLACTIOPN.CRT-TMSTP                                        
LRM012            ,:DCLACTIOPN.UPDT-TMSTP                                       
LRM012            ,:DCLACTIOPN.ACCT-DLVR-NBR                                    
LRM012            ,:DCLACTIOPN.ACCT-RCV-NBR                                     
LRM012            ,:DCLACTIOPN.SECURITY-ADP-NBR                                 
LRM012            ,:DCLACTIOPN.NSCC-ACK-IND                                     
LRM012            ,:DCLACTIOPN.NSCC-PEND-CD                                     
LRM012            ,:DCLACTIOPN.ACAT-CONTROL-NBR                                 
LRM012            ,:DCLACTIOPN.ASSET-SEQ-NBR                                    
LRM012            ,:DCLACTIOPN.TRNFR-TYPE-CD                                    
LRM012           )                                                              
LRM012     END-EXEC.                                                            
LRM012 0228-GETMSD-OPTION-SYMBOL.                                               
LRM012     IF MSDIO-RETURN-CODE = SPACE                                         
LRM012     AND WK-MS-SYMBOL-9 > SPACES                                          
LRM012        PERFORM 0229-SCAN-FOR-OPT-SYM THRU 0229-EXIT                      
LRM012     END-IF.                                                              
LRM012 0229-SCAN-FOR-OPT-SYM.                                                   
LRM012                                                                          
LRM012     MOVE WK-MS-SYMBOL-9           TO OPT-WORK1                           
LRM012     MOVE    12                    TO SUB2                                
LRM012     PERFORM UNTIL NOT (OPT-WORK3 (SUB2) = SPACES)                        
LRM012         SUBTRACT 1              FROM SUB2                                
LRM012     END-PERFORM                                                          
LRM012                                                                          
LRM012     IF  OPT-WORK3 (SUB2) IS NUMERIC                                      
LRM012         SUBTRACT 1 FROM SUB2                                             
LRM012         PERFORM UNTIL NOT (OPT-WORK3 (SUB2) IS NUMERIC)                  
LRM012                 SUBTRACT 1 FROM SUB2                                     
LRM012         END-PERFORM                                                      
LRM012         SUBTRACT 1 FROM SUB2                                             
LRM012     ELSE                                                                 
LRM012         SUBTRACT 2              FROM SUB2                                
LRM012     END-IF                                                               
LRM012                                                                          
LRM012     MOVE SPACES                   TO OPTION-SYMBOL1 (1)                  
LRM012                                      OPTION-SYMBOL1 (2)                  
LRM012                                      OPTION-SYMBOL1 (3)                  
LRM012                                                                          
LRM012     MOVE 3                        TO SUB3                                
LRM012     PERFORM UNTIL SUB2 = 1                                               
LRM012         MOVE  OPT-WORK3 (SUB2)    TO OPTION-SYMBOL1 (SUB3)               
LRM012         SUBTRACT 1              FROM SUB2                                
LRM012                                      SUB3                                
LRM012         END-SUBTRACT                                                     
LRM012     END-PERFORM                                                          
LRM012                                                                          
LRM012     MOVE 1                        TO SUB2                                
LRM012                                      SUB3                                
LRM012     MOVE SPACES                   TO OPT-SYMBOL                          
LRM012     PERFORM UNTIL SUB3 > 3                                               
LRM012         IF  OPTION-SYMBOL1 (SUB3) = SPACES                               
LRM012             ADD  1                TO SUB3                                
LRM012         ELSE                                                             
LRM012             MOVE  OPTION-SYMBOL1 (SUB3) TO                               
LRM012                   OPTION-SYMBOL  (SUB2)                                  
LRM012             ADD  1                TO SUB3                                
LRM012                                      SUB2                                
LRM012             END-ADD                                                      
LRM012         END-IF                                                           
LRM012     END-PERFORM                                                          
LRM012                                                                          
LRM012     MOVE OPT-SYMBOL               TO WK-MS-SYMBOL-9.                     
LRM012                                                                          
LRM012 0229-EXIT. EXIT.                                                         
                                                                                
       0230-INSERT-ASSET-AMOUNTS.                                               
                                                                                
           INITIALIZE DCLACTIAST.                                               
           MOVE 'N' TO BEARER-BOND-CD OF DCLACTIAST                             
                       WHI-STTS-CD    OF DCLACTIAST.                            
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTIAST                       
                                  CRT-TMSTP OF DCLACTIAST.                      
           MOVE ZEROS TO ASSET-SEQ-NBR OF DCLACTIAST                            
                         PHSCL-SEQ-NBR OF DCLACTIAST                            
                         LGCL-SEQ-NBR OF DCLACTIAST.                            
           MOVE '00' TO OPTN-CTGY-CD OF DCLACTIAST.                             
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTIAST.                      
LRM007     MOVE ACAT03IO-CONTROL-NBR TO ACAT-CONTROL-NBR OF DCLACTIAST.         
LRM007     MOVE ACAT03IO-DLVR-ACCT TO TRANS-RFRN-ID-CD OF DCLACTIAST            
LRM007                                WS-TRANS-RFRN-ID-CD                       
LRM007     IF ACAT03IO-CONTROL-NBR (1 : 2) = 'XX'                               
LRM007        PERFORM 0202-FORMAT-TRANS-RFRN-RTN                                
LRM007        MOVE WS-TRANS-RFRN-ID-CD                                          
LRM007                  TO TRANS-RFRN-ID-CD OF DCLACTIAST                       
LRM007     END-IF.                                                              
LRM009     IF ACAT03IO-AMT-01-RQST-CD = 'F'                                     
LRM009        MOVE 'F' TO ASSET-RQST-QTY-CD OF DCLACTIAST                       
LRM009     ELSE                                                                 
LRM009        MOVE 'P' TO ASSET-RQST-QTY-CD OF DCLACTIAST                       
LRM009     END-IF.                                                              
                                                                                
      *** INSERT CASH                                                           
           IF ACAT03IO-AMT-01-CREDIT                                            
              MOVE 'CRED' TO STTLM-RSN-CD OF DCLACTIAST                         
              MOVE ' '    TO PSTN-CD      OF DCLACTIAST                         
           ELSE                                                                 
              MOVE 'DEB ' TO STTLM-RSN-CD OF DCLACTIAST                         
              MOVE ' '    TO PSTN-CD      OF DCLACTIAST                         
           END-IF.                                                              
           IF ACAT03IO-AMT-01 NOT = ZEROS                                       
LRM009     OR ACAT03IO-AMT-01-RQST-CD = 'F'                                     
              EXEC SQL                                                  09140000
               INSERT INTO ACTIAST                                      09170000
                 (                                                      09150000
                   CLIENT_NBR                                           09180000
                  ,DLVR_NBR                                             09150000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_NBR                                              09180000
                  ,ACCT_RCV_NBR                                         09180000
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
                  ,CICS_SGNON_ID                                                
                 )                                                      09150000
                 VALUES                                                         
                 (                                                      09150000
                    :ACAT03IO-CLIENT-NBR                                09190000
                   ,:ACAT03IO-DLVR-NBR                                  09190000
                   ,:ACAT03IO-DLVR-ACCT                                 09190000
                   ,:ACAT03IO-RCV-NBR                                   09190000
                   ,:ACAT03IO-RCV-ACCT                                  09190000
                   ,:DCLACTIAST.ISIN-CNTRY-CD                                   
                   ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                               
                   ,:DCLACTIAST.ISIN-SEC-CDG-CD                                 
                   ,'40'                                                        
                   ,'C'                                                         
                   ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                              
                   ,:DCLACTIAST.STTLM-LCTN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                              
                   ,:ACAT03IO-RCV-NBR                                           
                   ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                              
                   ,:DCLACTIAST.ACAT-CONTROL-NBR                                
                   ,:DCLACTIAST.CONTROL-NBR-STS-CD                              
                   ,:DCLACTIAST.ASSET-SEQ-NBR                                   
                   ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                              
                   ,'A'                                                         
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
LRM009             ,:DCLACTIAST.ASSET-RQST-QTY-CD                               
                   ,:DCLACTIAST.ASSET-RQST-STS-CD                               
                   ,'3'                                                         
                   ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                              
                   ,:DCLACTIAST.ASSET-QTY                                       
                   ,:DCLACTIAST.ASSET-QTY-STTS-CD                               
                   ,:DCLACTIAST.ASSET-PCT                                       
                   ,:DCLACTIAST.ASSET-PCT-STTS-CD                               
                   ,:DCLACTIAST.PSTN-CD                                         
                   ,:DCLACTIAST.PSTN-CD-STTS-CD                                 
                   ,:DCLACTIAST.ISO-CRNCY-CD                                    
                   ,:DCLACTIAST.ISO-CRNCY-STTS-CD                               
                   ,:ACAT03IO-AMT-01                                            
                   ,:DCLACTIAST.ASSET-AMT-STTS-CD                               
                   ,:DCLACTIAST.BEARER-BOND-CD                                  
                   ,:DCLACTIAST.BEARER-BND-STTS-CD                              
                   ,'N'                                                         
                   ,:DCLACTIAST.WHI-STTS-CD                                     
                   ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                               
                   ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                              
                   ,:DCLACTIAST.MBS-SERIAL-NBR                                  
                   ,:DCLACTIAST.MBS-SERIAL-STTS-CD                              
                   ,:ACAT03IO-ASSET-CMNT1-TXT                                   
                   ,:DCLACTIAST.ASSET-CMNT-STTS-CD                              
                   ,:DCLACTIAST.NSCC-WTHLD-CD                                   
LRM007             ,:DCLACTIAST.TRANS-RFRN-ID-CD                        09190000
                   ,:DCLACTIAST.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                              
                   ,:DCLACTIAST.OPTN-CTGY-CD                                    
                   ,:DCLACTIAST.OPTN-CTGY-STTS-CD                               
                   ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTIAST.RCRD-STTS-CD                                    
                   ,:ACAT03IO-NSCC-PEND-CD                                      
                   ,:DCLACTIAST.NSCC-ACK-IND                                    
                   ,'ACAT03DB'                                                  
                   ,:DCLACTIAST.CICS-TERM-ID-CD                                 
                   ,:DCLACTIAST.UPDT-TMSTP                                      
                   ,:DCLACTIAST.CRT-TMSTP                                       
                   ,:DCLACTIAST.SECURITY-ADP-NBR                                
LRM015             ,:ACAT03IO-TRNFR-TYPE-CD                                     
                   ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                              
                   ,:DCLACTIAST.RCV-NBR-STTS-CD                                 
                   ,:DCLACTIAST.DLVR-NBR-STTS-CD                                
                   ,:ACAT03IO-SIGN-ON-ID                                        
                 )                                                      09150000
              END-EXEC                                                  09200000
093400        EVALUATE SQLCODE                                          09220000
093500          WHEN +0                                                 09230000
093600               CONTINUE                                           09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200        END-EVALUATE                                              09300000
           END-IF.                                                              
                                                                                
      *** INSERT MARGIN                                                         
           IF ACAT03IO-AMT-02-CREDIT                                            
              MOVE 'CRED' TO STTLM-RSN-CD OF DCLACTIAST                         
              MOVE ' '    TO PSTN-CD      OF DCLACTIAST                         
           ELSE                                                                 
              MOVE 'DEB ' TO STTLM-RSN-CD OF DCLACTIAST                         
              MOVE ' '    TO PSTN-CD      OF DCLACTIAST                         
           END-IF.                                                              
LRM009     IF ACAT03IO-AMT-02-RQST-CD = 'F'                                     
LRM009        MOVE 'F' TO ASSET-RQST-QTY-CD OF DCLACTIAST                       
LRM009     ELSE                                                                 
LRM009        MOVE 'P' TO ASSET-RQST-QTY-CD OF DCLACTIAST                       
LRM009     END-IF.                                                              
           IF ACAT03IO-AMT-02 NOT = ZEROS                                       
LRM009     OR ACAT03IO-AMT-02-RQST-CD = 'F'                                     
              EXEC SQL                                                  09140000
               INSERT INTO ACTIAST                                      09170000
                 (                                                      09150000
                   CLIENT_NBR                                           09180000
                  ,DLVR_NBR                                             09150000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_NBR                                              09180000
                  ,ACCT_RCV_NBR                                         09180000
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
                  ,CICS_SGNON_ID                                                
                 )                                                      09150000
                 VALUES                                                         
                 (                                                      09150000
                    :ACAT03IO-CLIENT-NBR                                09190000
                   ,:ACAT03IO-DLVR-NBR                                  09190000
                   ,:ACAT03IO-DLVR-ACCT                                 09190000
                   ,:ACAT03IO-RCV-NBR                                   09190000
                   ,:ACAT03IO-RCV-ACCT                                  09190000
                   ,:DCLACTIAST.ISIN-CNTRY-CD                                   
                   ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                               
                   ,:DCLACTIAST.ISIN-SEC-CDG-CD                                 
                   ,'40'                                                        
                   ,'M'                                                         
                   ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                              
                   ,:DCLACTIAST.STTLM-LCTN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                              
                   ,:ACAT03IO-RCV-NBR                                           
                   ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                              
                   ,:DCLACTIAST.ACAT-CONTROL-NBR                                
                   ,:DCLACTIAST.CONTROL-NBR-STS-CD                              
                   ,:DCLACTIAST.ASSET-SEQ-NBR                                   
                   ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                              
                   ,'A'                                                         
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
LRM009             ,:DCLACTIAST.ASSET-RQST-QTY-CD                               
                   ,:DCLACTIAST.ASSET-RQST-STS-CD                               
                   ,'3'                                                         
                   ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                              
                   ,:DCLACTIAST.ASSET-QTY                                       
                   ,:DCLACTIAST.ASSET-QTY-STTS-CD                               
                   ,:DCLACTIAST.ASSET-PCT                                       
                   ,:DCLACTIAST.ASSET-PCT-STTS-CD                               
                   ,:DCLACTIAST.PSTN-CD                                         
                   ,:DCLACTIAST.PSTN-CD-STTS-CD                                 
                   ,:DCLACTIAST.ISO-CRNCY-CD                                    
                   ,:DCLACTIAST.ISO-CRNCY-STTS-CD                               
                   ,:ACAT03IO-AMT-02                                            
                   ,:DCLACTIAST.ASSET-AMT-STTS-CD                               
                   ,:DCLACTIAST.BEARER-BOND-CD                                  
                   ,:DCLACTIAST.BEARER-BND-STTS-CD                              
                   ,'N'                                                         
                   ,:DCLACTIAST.WHI-STTS-CD                                     
                   ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                               
                   ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                              
                   ,:DCLACTIAST.MBS-SERIAL-NBR                                  
                   ,:DCLACTIAST.MBS-SERIAL-STTS-CD                              
                   ,:ACAT03IO-ASSET-CMNT2-TXT                                   
                   ,:DCLACTIAST.ASSET-CMNT-STTS-CD                              
                   ,:DCLACTIAST.NSCC-WTHLD-CD                                   
LRM007             ,:DCLACTIAST.TRANS-RFRN-ID-CD                        09190000
                   ,:DCLACTIAST.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                              
                   ,:DCLACTIAST.OPTN-CTGY-CD                                    
                   ,:DCLACTIAST.OPTN-CTGY-STTS-CD                               
                   ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTIAST.RCRD-STTS-CD                                    
                   ,:ACAT03IO-NSCC-PEND-CD                                      
                   ,:DCLACTIAST.NSCC-ACK-IND                                    
                   ,'ACAT03DB'                                                  
                   ,:DCLACTIAST.CICS-TERM-ID-CD                                 
                   ,:DCLACTIAST.UPDT-TMSTP                                      
                   ,:DCLACTIAST.CRT-TMSTP                                       
                   ,:DCLACTIAST.SECURITY-ADP-NBR                                
LRM015             ,:ACAT03IO-TRNFR-TYPE-CD                                     
                   ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                              
                   ,:DCLACTIAST.RCV-NBR-STTS-CD                                 
                   ,:DCLACTIAST.DLVR-NBR-STTS-CD                                
                   ,:ACAT03IO-SIGN-ON-ID                                        
                 )                                                      09150000
              END-EXEC                                                  09200000
093400        EVALUATE SQLCODE                                          09220000
093500          WHEN +0                                                 09230000
093600               CONTINUE                                           09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200        END-EVALUATE                                              09300000
           END-IF.                                                              
                                                                                
      *** INSERT SHORT AMT                                                      
           IF ACAT03IO-AMT-05-CREDIT                                            
              MOVE 'CRED' TO STTLM-RSN-CD OF DCLACTIAST                         
              MOVE ' '    TO PSTN-CD      OF DCLACTIAST                         
           ELSE                                                                 
              MOVE 'DEB ' TO STTLM-RSN-CD OF DCLACTIAST                         
              MOVE ' '    TO PSTN-CD      OF DCLACTIAST                         
           END-IF.                                                              
LRM009     IF ACAT03IO-AMT-05-RQST-CD = 'F'                                     
LRM009        MOVE 'F' TO ASSET-RQST-QTY-CD OF DCLACTIAST                       
LRM009     ELSE                                                                 
LRM009        MOVE 'P' TO ASSET-RQST-QTY-CD OF DCLACTIAST                       
LRM009     END-IF.                                                              
           IF ACAT03IO-AMT-05 NOT = ZEROS                                       
LRM009     OR ACAT03IO-AMT-05-RQST-CD = 'F'                                     
              EXEC SQL                                                  09140000
               INSERT INTO ACTIAST                                      09170000
                 (                                                      09150000
                   CLIENT_NBR                                           09180000
                  ,DLVR_NBR                                             09150000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_NBR                                              09180000
                  ,ACCT_RCV_NBR                                         09180000
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
                  ,CICS_SGNON_ID                                                
                 )                                                      09150000
                 VALUES                                                         
                 (                                                      09150000
                    :ACAT03IO-CLIENT-NBR                                09190000
                   ,:ACAT03IO-DLVR-NBR                                  09190000
                   ,:ACAT03IO-DLVR-ACCT                                 09190000
                   ,:ACAT03IO-RCV-NBR                                   09190000
                   ,:ACAT03IO-RCV-ACCT                                  09190000
                   ,:DCLACTIAST.ISIN-CNTRY-CD                                   
                   ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                               
                   ,:DCLACTIAST.ISIN-SEC-CDG-CD                                 
                   ,'40'                                                        
                   ,'S'                                                         
                   ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                              
                   ,:DCLACTIAST.STTLM-LCTN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                              
                   ,:ACAT03IO-RCV-NBR                                           
                   ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                              
                   ,:DCLACTIAST.ACAT-CONTROL-NBR                                
                   ,:DCLACTIAST.CONTROL-NBR-STS-CD                              
                   ,:DCLACTIAST.ASSET-SEQ-NBR                                   
                   ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                              
                   ,'A'                                                         
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
LRM009             ,:DCLACTIAST.ASSET-RQST-QTY-CD                               
                   ,:DCLACTIAST.ASSET-RQST-STS-CD                               
                   ,'3'                                                         
                   ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                              
                   ,:DCLACTIAST.ASSET-QTY                                       
                   ,:DCLACTIAST.ASSET-QTY-STTS-CD                               
                   ,:DCLACTIAST.ASSET-PCT                                       
                   ,:DCLACTIAST.ASSET-PCT-STTS-CD                               
                   ,:DCLACTIAST.PSTN-CD                                         
                   ,:DCLACTIAST.PSTN-CD-STTS-CD                                 
                   ,:DCLACTIAST.ISO-CRNCY-CD                                    
                   ,:DCLACTIAST.ISO-CRNCY-STTS-CD                               
                   ,:ACAT03IO-AMT-05                                            
                   ,:DCLACTIAST.ASSET-AMT-STTS-CD                               
                   ,:DCLACTIAST.BEARER-BOND-CD                                  
                   ,:DCLACTIAST.BEARER-BND-STTS-CD                              
                   ,'N'                                                         
                   ,:DCLACTIAST.WHI-STTS-CD                                     
                   ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                               
                   ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                              
                   ,:DCLACTIAST.MBS-SERIAL-NBR                                  
                   ,:DCLACTIAST.MBS-SERIAL-STTS-CD                              
                   ,:ACAT03IO-ASSET-CMNT5-TXT                                   
                   ,:DCLACTIAST.ASSET-CMNT-STTS-CD                              
                   ,:DCLACTIAST.NSCC-WTHLD-CD                                   
LRM007             ,:DCLACTIAST.TRANS-RFRN-ID-CD                        09190000
                   ,:DCLACTIAST.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                              
                   ,:DCLACTIAST.OPTN-CTGY-CD                                    
                   ,:DCLACTIAST.OPTN-CTGY-STTS-CD                               
                   ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTIAST.RCRD-STTS-CD                                    
                   ,:ACAT03IO-NSCC-PEND-CD                                      
                   ,:DCLACTIAST.NSCC-ACK-IND                                    
                   ,'ACAT03DB'                                                  
                   ,:DCLACTIAST.CICS-TERM-ID-CD                                 
                   ,:DCLACTIAST.UPDT-TMSTP                                      
                   ,:DCLACTIAST.CRT-TMSTP                                       
                   ,:DCLACTIAST.SECURITY-ADP-NBR                                
LRM015             ,:ACAT03IO-TRNFR-TYPE-CD                                     
                   ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                              
                   ,:DCLACTIAST.RCV-NBR-STTS-CD                                 
                   ,:DCLACTIAST.DLVR-NBR-STTS-CD                                
                   ,:ACAT03IO-SIGN-ON-ID                                        
                 )                                                      09150000
              END-EXEC                                                  09200000
093400        EVALUATE SQLCODE                                          09220000
093500          WHEN +0                                                 09230000
093600               CONTINUE                                           09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200        END-EVALUATE                                              09300000
           END-IF.                                                              
                                                                                
      *** INSERT SMA                                                            
           MOVE 'SMA ' TO STTLM-RSN-CD     OF DCLACTIAST                        
           MOVE ' '    TO PSTN-CD          OF DCLACTIAST                        
           MOVE '45'   TO STTLM-LCTN-CD    OF DCLACTIAST.                       
           MOVE 'M'    TO CSH-MGN-SHRT-CD  OF DCLACTIAST.                       
           IF ACAT03IO-AMT-SMA NOT = ZEROS                                      
              EXEC SQL                                                  09140000
               INSERT INTO ACTIAST                                      09170000
                 (                                                      09150000
                   CLIENT_NBR                                           09180000
                  ,DLVR_NBR                                             09150000
                  ,ACCT_DLVR_NBR                                        09180000
                  ,RCV_NBR                                              09180000
                  ,ACCT_RCV_NBR                                         09180000
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
                  ,CICS_SGNON_ID                                                
                 )                                                      09150000
                 VALUES                                                         
                 (                                                      09150000
                    :ACAT03IO-CLIENT-NBR                                09190000
                   ,:ACAT03IO-DLVR-NBR                                  09190000
                   ,:ACAT03IO-DLVR-ACCT                                 09190000
                   ,:ACAT03IO-RCV-NBR                                   09190000
                   ,:ACAT03IO-RCV-ACCT                                  09190000
                   ,:DCLACTIAST.ISIN-CNTRY-CD                                   
                   ,:DCLACTIAST.ISIN-SEC-ISSUE-CD                               
                   ,:DCLACTIAST.ISIN-SEC-CDG-CD                                 
                   ,:DCLACTIAST.STTLM-LCTN-CD                                   
                   ,:DCLACTIAST.CSH-MGN-SHRT-CD                                 
                   ,:DCLACTIAST.CSH-MRG-SHT-STS-CD                              
                   ,:DCLACTIAST.STTLM-LCTN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-CNTRY-STTS-CD                              
                   ,:ACAT03IO-RCV-NBR                                           
                   ,:DCLACTIAST.SBMT-PRT-NR-STS-CD                              
                   ,:DCLACTIAST.ACAT-CONTROL-NBR                                
                   ,:DCLACTIAST.CONTROL-NBR-STS-CD                              
                   ,:DCLACTIAST.ASSET-SEQ-NBR                                   
                   ,:DCLACTIAST.AST-SEQ-NBR-STS-CD                              
                   ,'A'                                                         
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
                   ,:DCLACTIAST.ASSET-RQST-STS-CD                               
                   ,'P'                                                         
                   ,'3'                                                         
                   ,:DCLACTIAST.AST-RQ-TRAN-STS-CD                              
                   ,:DCLACTIAST.ASSET-QTY                                       
                   ,:DCLACTIAST.ASSET-QTY-STTS-CD                               
                   ,:DCLACTIAST.ASSET-PCT                                       
                   ,:DCLACTIAST.ASSET-PCT-STTS-CD                               
                   ,:DCLACTIAST.PSTN-CD                                         
                   ,:DCLACTIAST.PSTN-CD-STTS-CD                                 
                   ,:DCLACTIAST.ISO-CRNCY-CD                                    
                   ,:DCLACTIAST.ISO-CRNCY-STTS-CD                               
                   ,:ACAT03IO-AMT-SMA                                           
                   ,:DCLACTIAST.ASSET-AMT-STTS-CD                               
                   ,:DCLACTIAST.BEARER-BOND-CD                                  
                   ,:DCLACTIAST.BEARER-BND-STTS-CD                              
                   ,'N'                                                         
                   ,:DCLACTIAST.WHI-STTS-CD                                     
                   ,:DCLACTIAST.TRNFR-TYPE-RSN-CD                               
                   ,:DCLACTIAST.TRN-TYP-RSN-STS-CD                              
                   ,:DCLACTIAST.MBS-SERIAL-NBR                                  
                   ,:DCLACTIAST.MBS-SERIAL-STTS-CD                              
                   ,:ACAT03IO-ASSET-CMNTM-TXT                                   
                   ,:DCLACTIAST.ASSET-CMNT-STTS-CD                              
                   ,:DCLACTIAST.NSCC-WTHLD-CD                                   
LRM007             ,:DCLACTIAST.TRANS-RFRN-ID-CD                        09190000
                   ,:DCLACTIAST.TRANS-RFRN-STTS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-IS-STS-CD                              
                   ,:DCLACTIAST.ISIN-SEC-CD-STS-CD                              
                   ,:DCLACTIAST.OPTN-CTGY-CD                                    
                   ,:DCLACTIAST.OPTN-CTGY-STTS-CD                               
                   ,:DCLACTIAST.RCRD-LNGTH-STTS-CD                              
                   ,:DCLACTIAST.RCRD-STTS-CD                                    
                   ,:ACAT03IO-NSCC-PEND-CD                                      
                   ,:DCLACTIAST.NSCC-ACK-IND                                    
                   ,'ACAT03DB'                                                  
                   ,:DCLACTIAST.CICS-TERM-ID-CD                                 
                   ,:DCLACTIAST.UPDT-TMSTP                                      
                   ,:DCLACTIAST.CRT-TMSTP                                       
                   ,:DCLACTIAST.SECURITY-ADP-NBR                                
                   ,:ACAT03IO-TRNFR-TYPE-CD                                     
                   ,:DCLACTIAST.TRNFR-TYPE-STTS-CD                              
                   ,:DCLACTIAST.RCV-NBR-STTS-CD                                 
                   ,:DCLACTIAST.DLVR-NBR-STTS-CD                                
                   ,:ACAT03IO-SIGN-ON-ID                                        
                 )                                                      09150000
              END-EXEC                                                  09200000
093400        EVALUATE SQLCODE                                          09220000
093500          WHEN +0                                                 09230000
093600               CONTINUE                                           09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200        END-EVALUATE                                              09300000
           END-IF.                                                              
                                                                                
                                                                                
           EJECT                                                                
       0300-UPDATE-ACTITRF.                                                     
           PERFORM 0310-CHECK-TMSTP-AND-NSCC-RTN.                               
           IF ACAT03IO-UPDT-TMSTP-NG                                            
           OR ACAT03IO-NSCC-PEND-NG                                             
           OR ACAT03IO-NOT-FOUND                                                
              GO TO 0300-EXIT.                                                  
                                                                                
           MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLACTITRF                       
                                 ACAT03IO-UPDT-TMSTP.                           
           MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLACTITRF.                      
   ******* PRIMARY KEY CHANGE / INSERT AND DELETE...                            
           IF ACAT03IO-ORIG-DLVR-NBR  NOT = ACAT03IO-DLVR-NBR           09190000
           OR ACAT03IO-ORIG-DLVR-ACCT NOT = ACAT03IO-DLVR-ACCT          09190000
               PERFORM 0350-KEY-CHANGE-RTN                                      
           ELSE                                                                 
           EXEC SQL                                                     09140000
               UPDATE ACTITRF                                           09170000
                 SET                                                            
                   ACAT_CONTROL_NBR  =                                          
                    :ACAT03IO-CONTROL-NBR                                       
                  ,RCV_SS_PRIM_NBR   =                                          
                    :ACAT03IO-RCV-SS-PRIM-NBR                                   
                  ,RCV_SS_SCNDY_NBR  =                                          
                    :ACAT03IO-RCV-SS-SCNDY-NBR                                  
                  ,RCV_ACCT_TYPE_CD  =                                          
                    :ACAT03IO-RCV-ACCT-TYPE-CD                                  
                  ,RCV_OCC_BRKR_NBR  =                                          
                    :ACAT03IO-RCV-OCC-BRKR-NBR                                  
                  ,RCV_CUST_NM       =                                          
                    :ACAT03IO-RCV-CUST-NM                                       
C KEY?            ,TRNFR_TYPE_CD     =                                          
                    :ACAT03IO-TRNFR-TYPE-CD                                     
                  ,CMNT_TXT          =                                          
                    :ACAT03IO-CMNT-TXT                                          
                  ,NSCC_PEND_CD      =                                          
                    :ACAT03IO-NSCC-PEND-CD                                      
                  ,UPDT_TMSTP        =                                          
                    :DCLACTITRF.UPDT-TMSTP                                      
                  ,CICS_TERM_ID_CD   =                                          
                    :DCLACTITRF.CICS-TERM-ID-CD                                 
                  ,PRGM_NM           =                                          
                    'ACAT03DB'                                                  
                  ,RR_CD             =                                          
                    :ACAT03IO-RR-CD                                             
                  ,CICS_SGNON_ID     =                                          
                    :ACAT03IO-SIGN-ON-ID                                        
LRM014            ,NSCC_ACK_IND      =  ' '                                     
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT03IO-CLIENT-NBR   AND                          09190000
LRM007             ACAT_CONTROL_NBR =                                   09180000
LRM007              :ACAT03IO-CONTROL-NBR   AND                         09190000
                   DLVR_NBR      =                                      09150000
                    :ACAT03IO-ORIG-DLVR-NBR     AND                     09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT03IO-ORIG-DLVR-ACCT    AND                     09190000
                   RCV_NBR       =                                      09180000
                    :ACAT03IO-RCV-NBR      AND                          09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT03IO-RCV-ACCT     AND                          09190000
                   TRNFR_TYPE_CD =                                      09180000
LRM015              :ACAT03IO-TRNFR-TYPE-CD                                     
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
                                                                                
           EVALUATE SQLCODE                                             09220000
               WHEN +0                                                  09230000
                  SET ACAT03IO-GOOD-RESP TO TRUE                        09240000
               WHEN OTHER                                               09280000
                  SET ACAT03IO-DB2-ERROR TO TRUE                                
                  PERFORM 9000-WRITE-TO-CICS-LOG                                
                  PERFORM 9500-RETURN-DB2-ERROR                                 
           END-EVALUATE.                                                09300000
                                                                                
LRM007***  MOVE WS-TIMESTAMP TO  UPDT-TMSTP OF DCLVTRNFR.                       
LRM007***  MOVE EIBTRMID TO CICS-TERM-ID-CD OF DCLVTRNFR.                       
LRM007***  IF ACAT03IO-CONTROL-NBR > SPACES                                     
LRM007***     EXEC SQL                                                  09140000
LRM007***      UPDATE VTRNFR                                            09170000
LRM007***        SET                                                            
LRM007***          ACCT_RJCT_RSBM_IND =                                         
LRM007***           :ACAT03IO-ACCT-RJCT-RSBM-IND                        09170000
LRM007***         ,UPDT_TMSTP        =                                          
LRM007***           :DCLVTRNFR.UPDT-TMSTP                                       
LRM007***         ,CICS_TERM_ID_CD   =                                          
LRM007***           :DCLVTRNFR.CICS-TERM-ID-CD                                  
LRM007***         ,PRGM_NM           =                                          
LRM007***           'ACAT03DB'                                                  
LRM007***         WHERE (CLIENT_NBR                                     09180000
LRM007***                     = :ACAT03IO-CLIENT-NBR                    09190000
LRM007***            AND ACAT_CONTROL_NBR                               09180000
LRM007***                     = :ACAT03IO-CONTROL-NBR)                          
LRM007***     END-EXEC                                                  09200000
LRM007***     EVALUATE SQLCODE                                          09220000
LRM007***         WHEN +0                                               09230000
LRM007***            SET ACAT03IO-GOOD-RESP TO TRUE                     09240000
LRM007***         WHEN OTHER                                            09280000
LRM007***            SET ACAT03IO-DB2-ERROR TO TRUE                             
LRM007***            PERFORM 9000-WRITE-TO-CICS-LOG                             
LRM007***            PERFORM 9500-RETURN-DB2-ERROR                              
LRM007***     END-EVALUATE.                                             09300000
                                                                                
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT03IO-GOOD-RESP TO TRUE                     09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
                                                                                
           PERFORM 0430-DELETE-ALL-ASSETS-AMOUNTS.                              
           PERFORM 0230-INSERT-ASSET-AMOUNTS.                                   
                                                                                
******** REPLACE NSCC_PEND_CD ON ALL ASSETS ON THIS TIF.                        
           EXEC SQL                                                     09140000
               UPDATE ACTIAST                                           09170000
                 SET                                                            
                   NSCC_PEND_CD      =                                          
                    :ACAT03IO-NSCC-PEND-CD                                      
                  ,UPDT_TMSTP        =                                          
                    :DCLACTITRF.UPDT-TMSTP                                      
                  ,CICS_TERM_ID_CD   =                                          
                    :DCLACTITRF.CICS-TERM-ID-CD                                 
                  ,PRGM_NM           =                                          
                    'ACAT03DB'                                                  
                  ,CICS_SGNON_ID     =                                          
                   :ACAT03IO-SIGN-ON-ID                                         
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT03IO-CLIENT-NBR   AND                          09190000
LRM007             ACAT_CONTROL_NBR =                                   09180000
LRM007              :ACAT03IO-CONTROL-NBR   AND                         09190000
                   DLVR_NBR      =                                      09150000
                    :ACAT03IO-DLVR-NBR     AND                          09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT03IO-DLVR-ACCT    AND                          09190000
                   RCV_NBR       =                                      09180000
                    :ACAT03IO-RCV-NBR      AND                          09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT03IO-RCV-ACCT     AND                          09190000
                   TRNFR_TYPE_CD =                                      09180000
LRM015              :ACAT03IO-TRNFR-TYPE-CD                                     
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
                                                                                
           EVALUATE SQLCODE                                             09220000
               WHEN +0                                                  09230000
                  SET ACAT03IO-GOOD-RESP TO TRUE                        09240000
               WHEN +100                                                09230000
                  SET ACAT03IO-GOOD-RESP TO TRUE                        09240000
               WHEN OTHER                                               09280000
                  SET ACAT03IO-DB2-ERROR TO TRUE                                
                  PERFORM 9000-WRITE-TO-CICS-LOG                                
                  PERFORM 9500-RETURN-DB2-ERROR                                 
           END-EVALUATE.                                                09300000
        0300-EXIT. EXIT.                                                        
                                                                                
        0310-CHECK-TMSTP-AND-NSCC-RTN.                                          
      *---------------------------------------------------------------          
      *  READ THE EXISTING TIF TO OBTAIN NSCC-PEND-IND AND UPDATE               
      *  TIMESTAMP TO SEE IF SOMEONE ELSE CAUSED AN UPDATE WHILE THIS           
      *  USER WAS LOOKING AT THIS RECORD ON THIER SCREEN.                       
      *---------------------------------------------------------------          
           EXEC SQL SELECT                                              09140000
                   NSCC_PEND_CD                                                 
                  ,UPDT_TMSTP                                                   
                 INTO                                                   09160000
                   :DCLACTITRF.NSCC-PEND-CD                                     
                  ,:DCLACTITRF.UPDT-TMSTP                                       
                 FROM ACTITRF                                           09170000
                  WHERE (CLIENT_NBR                                     09180000
                              = :ACAT03IO-CLIENT-NBR                    09190000
LRM007               AND ACAT_CONTROL_NBR                               09180000
LRM007                        = :ACAT03IO-CONTROL-NBR                   09190000
                     AND DLVR_NBR                                       09180000
                              = :ACAT03IO-DLVR-NBR                      09190000
                     AND ACCT_DLVR_NBR                                  09180000
                              = :ACAT03IO-DLVR-ACCT                     09190000
                     AND RCV_NBR                                        09180000
                              = :ACAT03IO-RCV-NBR                       09190000
                     AND ACCT_RCV_NBR                                   09180000
                              = :ACAT03IO-RCV-ACCT                      09190000
                     AND TRNFR_TYPE_CD                                  09180000
                              = :ACAT03IO-TRNFR-TYPE-CD)                09190000
093200      END-EXEC.                                                   09200000
093300*                                                                 09210000
093400      EVALUATE SQLCODE                                            09220000
093800          WHEN +0                                                 09260000
                     SET ACAT03IO-FOUND TO TRUE                                 
                     IF NSCC-PEND-CD OF DCLACTITRF = 'Y'                        
                        SET ACAT03IO-NSCC-PEND-NG TO TRUE                       
                     ELSE                                                       
                     IF UPDT-TMSTP OF DCLACTITRF NOT =                          
                                 ACAT03IO-UPDT-TMSTP                            
                        SET ACAT03IO-UPDT-TMSTP-NG TO TRUE                      
                     END-IF END-IF                                              
093800          WHEN +100                                               09260000
                     SET ACAT03IO-NOT-FOUND TO TRUE                             
094000          WHEN OTHER                                              09280000
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200      END-EVALUATE.                                               09300000
                                                                                
       0350-KEY-CHANGE-RTN.                                                     
NG ******* MUST INSERT NEW HEADER AND COPY ACROSS ASSETS IF ALLOWED...          
NG ******* THIS NEEDS REASEARCH.                                                
           PERFORM 0200-ISRT-ACTITRF.                                   09130000
                                                                                
           IF SQLCODE NOT = 0                                                   
              PERFORM 9000-WRITE-TO-CICS-LOG                                    
              PERFORM 9500-RETURN-DB2-ERROR                                     
           END-IF.                                                              
                                                                                
           PERFORM 0400-DELETE-ACTITRF.                                         
                                                                                
       0370-UPDATE-ACTIAST.                                                     
LRM018*****IF  ACAT03IO-CURRENT-SECR = ACAT03IO-ISIN-SEC-ISSUE-CD               
LRM018     IF ACAT03IO-KEY-FIELDS(1:11) =                                       
LRM018                                 ACAT03IO-CURRENT-ASSET-KEY(1:11)         
           AND ACAT03IO-CURRENT-SLOC = ACAT03IO-STTLM-LCTN-CD                   
           AND ACAT03IO-CURRENT-TYPE = ACAT03IO-CSH-MGN-SHRT-CD                 
                                                                                
              IF ACAT03IO-STTLM-LCTN-CD = '35'                                  
                  MOVE 'OPT ' TO STTLM-RSN-CD OF DCLACTIAST                     
              ELSE                                                              
              IF ACAT03IO-STTLM-LCTN-CD = '45'                                  
                  MOVE 'COMT' TO STTLM-RSN-CD OF DCLACTIAST                     
              ELSE                                                              
              IF ACAT03IO-STTLM-LCTN-CD = '50'                                  
                  MOVE 'XSET' TO STTLM-RSN-CD OF DCLACTIAST                     
              ELSE                                                              
                  MOVE '    ' TO STTLM-RSN-CD OF DCLACTIAST                     
              END-IF END-IF END-IF                                              
              EXEC SQL                                                  09140000
                UPDATE ACTIAST                                          09170000
                  SET                                                           
                   ASSET_PRC_CTGY_CD  =                                         
                   :ACAT03IO-ASSET-PRC-CTGY-CD                                  
                  ,ASSET_RQST_QTY_CD  =                                         
                   :ACAT03IO-ASSET-RQST-QTY-CD                                  
                  ,AST_RQST_TRANS_CD  =                                         
                   :ACAT03IO-AST-RQST-TRANS-CD                                  
                  ,WHI_CD             =                                         
                   :ACAT03IO-WHI-CD                                             
                  ,PSTN_CD            =                                         
                   :ACAT03IO-PSTN-CD                                            
                  ,ASSET_DESC_TXT     =                                         
                   :ACAT03IO-DESC-TXT                                           
                  ,ASSET_AMT          =                                         
                   :ACAT03IO-ASSET-AMT                                          
                  ,ASSET_QTY          =                                         
                   :ACAT03IO-ASSET-QTY                                          
                  ,ASSET_PCT          =                                         
                   :ACAT03IO-ASSET-PCT                                          
                  ,ASSET_CMNT_TXT     =                                         
                   :ACAT03IO-ASSET-CMNT-TXT                                     
                  ,SECURITY_ADP_NBR   =                                         
                   :ACAT03IO-ADP-NBR                                            
                  ,STTLM_RSN_CD       =                                         
                   :DCLACTIAST.STTLM-RSN-CD                                     
                  ,CICS_SGNON_ID     =                                          
                   :ACAT03IO-SIGN-ON-ID                                         
               WHERE                                                            
                  (CLIENT_NBR    =                                      09180000
                    :ACAT03IO-CLIENT-NBR   AND                          09190000
LRM007             ACAT_CONTROL_NBR =                                   09180000
LRM007              :ACAT03IO-CONTROL-NBR   AND                         09190000
                   DLVR_NBR      =                                      09150000
                    :ACAT03IO-ORIG-DLVR-NBR     AND                     09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT03IO-ORIG-DLVR-ACCT    AND                     09190000
                   RCV_NBR       =                                      09180000
                    :ACAT03IO-RCV-NBR           AND                     09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT03IO-RCV-ACCT          AND                     09190000
                   ISIN_CNTRY_CD  =                                     09180000
                    :ACAT03IO-ISIN-CNTRY-CD     AND                             
                   ISIN_SEC_ISSUE_CD =                                  09180000
                    :ACAT03IO-ISIN-SEC-ISSUE-CD AND                             
                   ISIN_SEC_CDG_CD   =                                  09180000
                    :ACAT03IO-ISIN-SEC-CDG-CD   AND                             
                   STTLM_LCTN_CD     =                                  09180000
                    :ACAT03IO-STTLM-LCTN-CD     AND                             
                   CSH_MGN_SHRT_CD   =                                  09180000
                    :ACAT03IO-CSH-MGN-SHRT-CD                                   
                 )                                                      09150000
093200         END-EXEC                                                 09200000
                                                                                
093400        EVALUATE SQLCODE                                          09220000
093500             WHEN +0                                              09230000
093600               SET ACAT03IO-GOOD-RESP TO TRUE                     09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200        END-EVALUATE                                              09300000
           ELSE                                                                 
              PERFORM 0420-DELETE-ACTIAST                                       
              PERFORM 0220-ISRT-ACTIAST                                    09130
           END-IF.                                                              
           SKIP3                                                                
       0400-DELETE-ACTITRF.                                                     
           EXEC SQL                                                     09140000
               DELETE FROM ACTITRF                                      09170000
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT03IO-CLIENT-NBR   AND                          09190000
LRM007             ACAT_CONTROL_NBR =                                   09180000
LRM007              :ACAT03IO-CONTROL-NBR   AND                         09190000
                   DLVR_NBR      =                                      09150000
                    :ACAT03IO-ORIG-DLVR-NBR     AND                     09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT03IO-ORIG-DLVR-ACCT    AND                     09190000
                   RCV_NBR       =                                      09180000
                    :ACAT03IO-RCV-NBR      AND                          09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT03IO-RCV-ACCT     AND                          09190000
                   TRNFR_TYPE_CD =                                      09180000
LRM015              :ACAT03IO-TRNFR-TYPE-CD                                     
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
                                                                                
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT03IO-GOOD-RESP TO TRUE                     09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
      *--------------------------------------------------------------*          
      * THERE IS NO FOREIGN KEY FROM INITIAL TRANSFER TO INIT ASSET.            
      * MUST ISSUE GENERIC DELETE TO WIPE THEM (IF ANY).                        
      *--------------------------------------------------------------*          
           PERFORM 0410-DELETE-ALL-ASSETS-IN-TIF.                               
           EJECT                                                                
       0410-DELETE-ALL-ASSETS-IN-TIF.                                           
           EXEC SQL                                                     09140000
               DELETE FROM ACTIAST                                      09170000
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT03IO-CLIENT-NBR   AND                          09190000
LRM007             ACAT_CONTROL_NBR =                                   09180000
LRM007              :ACAT03IO-CONTROL-NBR   AND                         09190000
                   DLVR_NBR      =                                      09150000
                    :ACAT03IO-ORIG-DLVR-NBR     AND                     09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT03IO-ORIG-DLVR-ACCT    AND                     09190000
                   RCV_NBR       =                                      09180000
                    :ACAT03IO-RCV-NBR           AND                     09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT03IO-RCV-ACCT                                  09190000
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
                                                                                
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT03IO-GOOD-RESP TO TRUE                     09240000
                WHEN +100                                               09230000
                     SET ACAT03IO-GOOD-RESP TO TRUE                     09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
           EJECT                                                                
       0420-DELETE-ACTIAST.                                                     
           EXEC SQL                                                     09140000
               DELETE FROM ACTIAST                                      09170000
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT03IO-CLIENT-NBR   AND                          09190000
LRM007             ACAT_CONTROL_NBR =                                   09180000
LRM007              :ACAT03IO-CONTROL-NBR   AND                         09190000
                   DLVR_NBR      =                                      09150000
                    :ACAT03IO-ORIG-DLVR-NBR     AND                     09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT03IO-ORIG-DLVR-ACCT    AND                     09190000
                   RCV_NBR       =                                      09180000
                    :ACAT03IO-RCV-NBR           AND                     09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT03IO-RCV-ACCT          AND                     09190000
                   ISIN_CNTRY_CD  =                                     09180000
                    :ACAT03IO-ISIN-CNTRY-CD     AND                             
                   ISIN_SEC_ISSUE_CD =                                  09180000
                    :ACAT03IO-CURRENT-SECR      AND                             
                   ISIN_SEC_CDG_CD   =                                  09180000
                    :ACAT03IO-ISIN-SEC-CDG-CD   AND                             
                   STTLM_LCTN_CD     =                                  09180000
                    :ACAT03IO-CURRENT-SLOC      AND                             
                   CSH_MGN_SHRT_CD   =                                  09180000
                    :ACAT03IO-CURRENT-TYPE                                      
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
                                                                                
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT03IO-GOOD-RESP TO TRUE                     09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
           EJECT                                                                
       0430-DELETE-ALL-ASSETS-AMOUNTS.                                          
           EXEC SQL                                                     09140000
               DELETE FROM ACTIAST                                      09170000
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT03IO-CLIENT-NBR   AND                          09190000
LRM007             ACAT_CONTROL_NBR =                                   09180000
LRM007              :ACAT03IO-CONTROL-NBR   AND                         09190000
                   DLVR_NBR      =                                      09150000
                    :ACAT03IO-ORIG-DLVR-NBR     AND                     09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT03IO-ORIG-DLVR-ACCT    AND                     09190000
                   RCV_NBR       =                                      09180000
                    :ACAT03IO-RCV-NBR           AND                     09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT03IO-RCV-ACCT          AND                     09190000
                   ISIN_CNTRY_CD =                                      09180000
                        '  '                    AND                     09190000
                   ISIN_SEC_ISSUE_CD =                                  09180000
                      '         '               AND                     09190000
                    STTLM_LCTN_CD  =                                            
                       '40'                                                     
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
                                                                                
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               CONTINUE                                           09240000
                WHEN +100                                               09230000
                     CONTINUE                                           09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
           EXEC SQL                                                     09140000
               DELETE FROM ACTIAST                                      09170000
              WHERE                                                             
                  (CLIENT_NBR    =                                      09180000
                    :ACAT03IO-CLIENT-NBR   AND                          09190000
LRM007             ACAT_CONTROL_NBR =                                   09180000
LRM007              :ACAT03IO-CONTROL-NBR   AND                         09190000
                   DLVR_NBR      =                                      09150000
                    :ACAT03IO-ORIG-DLVR-NBR     AND                     09190000
                   ACCT_DLVR_NBR =                                      09180000
                    :ACAT03IO-ORIG-DLVR-ACCT    AND                     09190000
                   RCV_NBR       =                                      09180000
                    :ACAT03IO-RCV-NBR           AND                     09190000
                   ACCT_RCV_NBR  =                                      09180000
                    :ACAT03IO-RCV-ACCT          AND                     09190000
                   ISIN_CNTRY_CD =                                      09180000
                        '  '                    AND                     09190000
                   ISIN_SEC_ISSUE_CD =                                  09180000
                      '         '               AND                     09190000
                   STTLM_RSN_CD  =                                      09180000
                                'SMA '                                  09190000
                 )                                                      09150000
093200     END-EXEC.                                                    09200000
                                                                                
093400     EVALUATE SQLCODE                                             09220000
093500          WHEN +0                                                 09230000
093600               SET ACAT03IO-GOOD-RESP TO TRUE                     09240000
                WHEN +100                                               09230000
                     SET ACAT03IO-GOOD-RESP TO TRUE                     09240000
094000          WHEN OTHER                                              09280000
                     SET ACAT03IO-DB2-ERROR TO TRUE                             
                     PERFORM 9000-WRITE-TO-CICS-LOG                             
                     PERFORM 9500-RETURN-DB2-ERROR                              
094200     END-EVALUATE.                                                09300000
           EJECT                                                                
       ABENDED.                                                                 
     ***   EXEC CICS ASSIGN ABCODE(WS-ABCODE) END-EXEC.                         
     ***   MOVE WS-ABEND-MESSAGE TO BHST-MESSAGE.                               
     ***   MOVE '9999' TO BHST-RETURN-CODE.                                     
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN).                    
           EXEC CICS RETURN END-EXEC.                                           
      *==============================                                           
                                                                                
       9000-WRITE-TO-CICS-LOG.                                                  
      *==============================                                           
     ***   MOVE SQLCODE TO BHST-SQLCODE.                                        
           IF SQLCODE = -803                                                    
               CONTINUE                                                         
           ELSE                                                                 
               MOVE SPACES             TO WS-ERRL-DATA                          
               SET WRITE-ERROR-TO-LOG  TO TRUE                                  
               MOVE EIBTRNID           TO CALLING-TRAN-ID                       
               MOVE 'ACAT03DB'         TO CALLING-PROGRAM-ID                    
               MOVE SQLCA              TO SQLCA-AREA                            
               EXEC CICS LINK PROGRAM ('FPDB2LOG')                              
                     COMMAREA (WS-ERRL-DATA)                                    
                     LENGTH (LENGTH OF WS-ERRL-DATA) NOHANDLE                   
               END-EXEC                                                         
           END-IF.                                                              
                                                                                
       9500-RETURN-DB2-ERROR.                                                   
           EXEC CICS SYNCPOINT ROLLBACK END-EXEC.                               
           SET ACAT03IO-DB2-ERROR TO TRUE                                       
           MOVE SQLCAID TO ACAT03IO-SQLCAID                                     
           MOVE SQLCODE TO ACAT03IO-SQLCODE                                     
           MOVE SQLERRM TO ACAT03IO-SQLERRM                                     
           MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-EIBCALEN).                    
           EXEC CICS RETURN END-EXEC.                                   06220000
