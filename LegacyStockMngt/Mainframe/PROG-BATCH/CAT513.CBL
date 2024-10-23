000001* PDX    - CAT513   C0359500 10/30/14 14:45:07 TBLAMUR            00001000
      * LRM026 SSR 100867 CORRECT MISSING TOA SPAD ISSUE.                       
000001* PDX    - CAT513   C0350589 02/09/14 14:57:44 TBLAMUR            00001000
      * LRM025 SSR 96014 CORRECT RR REVERSAL AFTER REJECT PROBLEM BY            
      *  NOT UPDATING THE ORIGINAL RR ON VTRNFR UNLESS THE ACCOUNT              
      *  CHANGES.  THIS WILL LEAVE ORIGINAL VALUE AFTER FULL DLVY               
      *  GOES INTO REVIEW AND THEN GETS REJECTED.                               
000001* PDX    - CAT513   C0351300 02/05/14 10:26:44 TBLAMUR            00001000
      * LRM024 SSR# 99741 RE-EDIT SSN WHEN CONTRA SUBMIT TI CHANGE.             
000001* PDX    - CAT513   C0350737 01/23/14 12:35:04 TBLAMUR            00001000
      * LRM023 SSR# 99427 SAME CODE AS SSR 54991 FOR CLIENT 313,                
      * LRM023   CONV CHANGES FOR RCR ONLY ON RECEIVER SIDE, TO                 
      * LRM023   USE AUX FILE TO REPLACE ACCOUNT WITH TO ACCOUNT.               
000001* PDX    - CAT513   C0331456 01/22/13 13:51:30 TBLAMUR            00001000
      * LRM022 SSR 85484 CHANGE ACCOUNT FREEZE EDIT ON FUL DLVY TO              
      *   USE 'OR' LOGIC, THAT EITHER FREEZE SEC-OUT OR CASH OUT                
      *   (NOT BOTH) CAUSES A HIT.                                              
000001* PDX    - CAT513   C0326750 05/21/12 15:24:31 TBLAMUR            00001000
      * LRM021 SSR 83557 ADDITIONAL SPECIAL ACCOUNTS DEFINED BY NEW             
      *    B1 434914 BY BRANCH RANGES.                                          
000001* PDX    - CAT513   C0307327 02/07/11 11:50:11 TBLAMUR            00001000
      * LRM020 SSR 70607 WIPE OUT LAST DAY TO UPDATE IND FOR ANY STTS           
      * CHANGE                                                                  
000001* PDX    - CAT513   C0304091 11/15/10 16:10:03 TBLAMUR            00001000
000001* PDX    - CAT513   C0298081 07/07/10 08:32:41 TBLAMUR            00001000
      * LRM019 SSR 68565 DONT COPY ORIG CMNT TO REJECT                          
000001* PDX    - CAT513   C0296134 06/01/10 10:26:32 TBLAMUR            00001000
      * LRM017 SSR 65158 CONSIDER MFRS OFFSHORE IND                             
      * LRM018 ADDL CHANGE TO SSR 66264 TO CORRECT EARLY SUBMISSION OF          
      *   ASSETS.  WIPE OUT STTLM-TM-CD ON VTRNFR WHEN STTS-CD IS 140           
      *   REQUEST REJECT, AS THE RECEIVER CAN RESUBMIT, THEN WE HAVE            
      *   UNTIL TOMORROW TO SUBMIT ASSETS, TO CAUSE CAT521 TO WAIT.             
000001* PDX    - CAT513   C0291396 03/10/10 15:09:46 TBLAMUR            00001000
      * LRM016 SSR 64900 PENSON CHANGE TO REJECT DLVY RQST ON AUXFILE           
      *   FOR CLIENT 10 ONLY.  POPULATE CVRSN-ACCT-NBR WITH 'CONV'              
      *   TO CAUSE CONVERSION EXCEPTION TO GET PASSED TO ASCENDIS IN            
      *   CAT525.  PTR AND FUL BUILD REJECT ON HOLD W/COMMENT, UNDER            
      *   ASCENDIS CONTROL, RCL AND FRV (AS ORIG RECEIVER) BUILD REJECT         
      *   TO GO OUT ON NEXT CYCLE.                                              
000001* PDX    - CAT513   C0280695 06/08/09 08:46:29 TBLAMUR            00001000
      * LRM015 SSR 63147 DONT RE-EDIT SSN ON DLVR ACCOUNT CHANGE                
000001* PDX    - CAT513   C0272583 12/08/08 09:46:26 TBDOJUN            00001000
      * DJ0014 SSR 61164 POSITION TRANSFER FUND(PTF)                            
000001* PDX    - CAT513   C0270214 10/20/08 11:58:24 TBDOJUN            00001000
      * DJ0013 SSR 55766 ASCENDIS(WORKFLOW) PARALLEL RUN                        
000001* PDX    - CAT513   C0260091 07/07/08 10:04:50 TBDOJUN            00001000
      * DJ0012 SSR 55766 ASCENDIS(WORKFLOW) SET ASCENDIS INDICATOR              
      * DJ0012 FOR FUL,PTR,PTD ONLY AND BH-ACAT-ASCENDIS-USER = '1'             
000001* PDX    - CAT513   C0262101 03/12/08 19:21:14 TBLAMUR            00001000
      * LRM013 SSR# 54091 ADDL CONV CHANGES FOR PTD MFC FRV RLC ON              
      * LRM013 RECEIVER SIDE, AND PTR AS THE DELIVERER.                         
000001* PDX    - CAT513   C0253977 10/08/07 14:27:01 TBLAMUR            00001000
      * LRM012 SSR# 54091 ONGOING INBOUND CONVERSION CHANGES CLIENT 6.          
      *        ON RCVR SIDE RCR, AND DLVR FULL REQUEST, LOOKUP THE 12           
      *        BYTE ACCOUNT NBR (MUST START WITH 1) ON AUX23 FILE. EDIT         
      *        THE SSN(S) STD LOGIC, WHEN OK, REPL THE ACCT-RCV-NBR FOR         
      *        THE RCR, AND THE ACCT-DLVR-NBR FOR THE FULL DELIVERY,            
      *        WITH THE BROADRIDGE ACCT. SAVE THE BETA ACCT IN NEW              
      *        COL CVRSN-ACCT-NBR ON VTRNFR. CAT519 WILL BUILD A TI             
      *        CHANGE ROW FOR THE FULL.  THESE CHANGED FULL AND RCR             
      *        XFERS WILL SHOW UNDER THE CONVERTED ACCT NUMBERS ON ACAX.        
000001* PDX    - CAT513   C0246568 04/19/07 14:11:12 TBDOJUN            00001000
      * DJ0011 FIX ALT BR LOGIC. GET FROM N/A. DO NOT OVERLAY THE FIELD.        
000001* PDX    - CAT513   C0241847 01/08/07 14:51:32 TBDOJUN            00001000
      * DJ0010 SSR# 48334 RBC DAIN ADOPTION AGREEMENT(ADTS DOCUMENT)            
      *        FULL DELIVERY ONLY. CHECK IF DOC IS THERE.                       
000001* PDX    - CAT513   C0240752 11/13/06 16:04:06 TBDOJUN            00001000
      * DJ0009 SSR# 49202 GIFT IND                                              
000001* PDX    - CAT513   C0239593 09/22/06 10:45:26 TBLAMUR            00001000
      * LRM009 SSR# 48434 RECOMPILE ONLY FOR FACZ1CA CHANGE.                    
000001* PDX    - CAT513   C0238236 08/15/06 13:42:35 TBLAMUR            00001000
      * LRM008 SSR# 45744 ADDL CHANGE TO NOT LOOKUP FREEZE ON RCVR SIDE         
      *        PTR IN MEMO (500) STATUS.                                        
000001* PDX    - CAT513   C0236781 07/10/06 10:22:45 TBDOJUN            00001000
      * DJ0008 SSR# 45744 CHECK ACCOUNT FREEZE ALL THE TIME                     
000001* PDX    - CAT513   C0234715 06/12/06 08:06:43 TBDOJUN            00001000
      * DJ0007 SSR# 45744 ACCOUNT FREEZE IF B1 032958 = 1                       
000001* PDX    - CAT513   C0223378 08/08/05 10:51:16 TBDOJUN            00001000
      * DJ0006 SSR# 41393 DO NOT FLAG SS# MISMATCH IF B1 434568 = 0-00          
000001* PDX    - CAT513   C0215363 02/14/05 07:56:37 TBDOJUN            00001000
      * DJ0005 SSR# 40042 NEW DB2 INIT TBL: ACTI***,NEW KEY STRUCTURE           
      * DJ0005 SSR# 40633 RECOMPILED FOR NEW COPYBOOK (ANNUITY)                 
      * DJ0005 SSR# 39561 PTR PHASE 2: DEL VALIDATION                           
      * DJ0005 MIPS REDUCTION: CHG TO PIC 9 COMP-3.                             
      * PDX    - CAT513   C0210006 10/04/04 10:15:28 TBDOJUN                    
      * DJ0004 - SSR# 29512 COPY RR-CODE FROM INIT TABLE FOR FUL RCV.           
      * PDX    - CAT513   C0206314 08/09/04 10:37:21 TBDOJUN                    
      * DJ0003 - SSR# 38232 NEW B1'S FOR PTR DELIVERY EDITS                     
      * DJ0003 - B1 434569 434570 434571                                        
      * PDX    - CAT513   C0197146 11/10/03 16:03:41 TBEDTAK                    
      * ET0001 - FOR IRA AND JOINT ACCTS, READ PRIMARY AND SECONDARY            
      *          SS NUMBERS TO DETERMINE SSN MISMATCH REJECT.                   
      * PDX    - CAT513   C0179727 12/04/02 13:40:05 TBLAMUR                    
      * LRM005 - SSR 0026952 RESCIND BLOCK                                      
      * PDX    - CAT513   C0158537 06/25/01 16:22:36 TBDOJUN                    
      * DJ0002 SSR# R5246800 NEW TRANSFER TYPE MFC -MUTUAL FUND CLEANUP         
      * PDX    - CAT513   C0151178 12/18/00 08:35:21 TBDOJUN                    
      * DJ     SSR# R2262400 W8 FIELDS COPYBOOK RECOMPILE                       
      * PDX    - CAT513   C0144778 11/21/00 15:44:45 TBLAMUR                    
      ** TCK001- SSR#- R4125500 - (COBOL LE CHG ARE INCLUDED)                   
      **       LEH WARNING FOR QUALIFIED RET PLAN TRANSFER IN ACAT              
      **       B1 - 434564                                                      
      **       THE REC HAS TO BE "DELIVER", "FULL" , "ADD" OR "CHG"             
      **       ACCT TYPE HAS TO BE 'QP', '4K', 'DR', 'SI', 'EI', 'IR',          
      **                           'RI'.                                        
      * PDX    - CAT513   C0141535 05/10/00 11:28:09 TBLAMUR                    
      * PDX    - CAT513   C0129756 08/16/99 12:19:24 TBDOJUN                    
      * DJ001  - COMMIT AFTER EVERY UPDATE                                      
      * PDX    - CAT513   C0125737 06/14/99 10:16:38 TBDOJUN                    
      * DJ     - LOOK UP ALERT TABLE FOR ACCOUNT                                
      *        - BYPASS GETNA REJECT FOR RECEIVER                               
      *        - IF BH-ACAT-PART-TRANSFR-ASSET-EXC = '1', EDIT PTD/PTR          
      * PDX    - CAT513   C0124764 04/26/99 10:49:07 TBDOJUN                    
      * DJ     - USE TRNFR-TYPE-RJC1-CD = 'SP' TO FLAG SPECIAL ACCOUNT          
      * PDX    - CAT513   C0123822 03/29/99 15:27:17 TBDOJUN                    
      * PDX    - CAT513   C0123102 03/24/99 16:56:29 TBDOJUN                    
      * PDX    - CAT513   C0122736 03/11/99 18:45:19 TBDOJUN                    
      * PDX    - CAT513   C0122542 03/05/99 10:45:56 TBDOJUN                    
      * PDX    - CAT513   C0122248 02/24/99 15:55:45 TBDOJUN                    
      * PDX    - CAT513   C0122194 02/23/99 11:57:05 TBDOJUN                    
      * PDX    - CAT513   C0122069 02/21/99 11:46:31 TBDOJUN                    
      * PDX    - CAT513   C0121541 02/10/99 21:10:41 TBDOJUN                    
      * PDX    - CAT513   C0121209 02/03/99 11:54:16 TBDOJUN                    
      * PDX    - CAT513   C0121087 01/31/99 10:54:40 TBDOJUN                    
      * PDX    - CAT513   C0120784 01/29/99 11:14:04 TBDOJUN                    
      * PDX    - CAT513   C0120203 01/21/99 14:59:53 TBDOJUN                    
      * PDX    - CAT513   C0119389 01/04/99 15:31:20 TBDOJUN                    
      * PDX    - CAT513   C0118401 12/01/98 11:00:53 TBDOJUN                    
      * DJ     - FIX DSTBN-SIDE-CD LOGIC                                        
      * DJ     - FIX DELETE        LOGIC                                        
      * DJ     - FIX S0C7 - DAYS-IN-STATUS                                      
      * PDX    - CAT513   C0109316 11/13/98 10:11:04 TBDOJUN                    
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT513.                                                     
      *****************************************************************         
      * THIS PROGRAM CONTAINS DB2.                                    *         
      *****************************************************************         
      * CAT513 - PROCESS TRANSFER ('T') TRANSACTIONS FROM NSCC.       *         
      *                                                               *         
      * PROCESS ONLY TRANSFER RECORDS FROM THE INPUT FILE.            *         
      *                                                               *         
      * IF THE SUBMITTING PARTICIPANT = DISTRIBUTION PARTICIPANT,     *         
      * DELETE THE ROW FROM THE INIT TABLE.                           *         
      *                                                               *         
      * ADD ALL TRANSFERS TO ACTIVE TABLE.                            *         
      *                                                               *         
      * ELSE, (RECORD IS INITIATED FROM OTHER BROKER),                *         
      * EDIT AND ADD A NEW ROW TO THE ACTIVE-TABLE. LOOK UP NON NSCC  *         
      * FIELDS.                                                       *         
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
      *        - DB2 DATABASE UPDATED                                 *         
      *                                                               *         
      * BH-ACAT-INVALID-ACCT-AUTO-REJ  (434523)                       *         
      * BH-ACAT-SPECIAL-ACCOUNTS-NO    (434538)                       *         
      * BH-ACAT-SPECIAL-ACCOUNTS       (434538)                       *         
      * BH-ACAT-REJ-PEND-FULL-REC-CMT  (434544)                       *         
      * BH-ACAT-REJ-PEND-FULL-DEL-DUP  (434558)                       *         
      * BH-ACAT-REJ-PEND-FULL-DEL-MM   (434559)                       *         
      * BH-ACAT-REJ-PEND-FULL-DEL-IRA  (434563)                       *         
      * BH-ACAT-REJ-PEND-FULL-DEL-QRP  (434564)                       *         
      * BH-ACAT-REJ-PEND-FULL-DEL-SP   (434565)                       *         
      * BH-ACAT-REJ-PEND-FULL-DEL-SS   (434568)                       *         
DJ0003* BH-ACAT-REJ-PEND-PTR-DEL-SS    (434569)                       *         
DJ0003* BH-ACAT-REJ-PEND-PTR-DEL-MM    (434570)                       *         
DJ0003* BH-ACAT-REJ-PEND-PTR-DEL-DUP   (434571)                       *         
      * BH-ACAT-TIFLESS-BROKER-NUM-NO  (434655)                       *         
      * BH-ACAT-LEGAL-BLOCK-IND        (434677)                       *         
      * BH-ACAT-CLIENT-RESCIND-IND     (434678)                       *         
ET0001* BH-ACAT-SECONDARY-SSN          (434685)                       *         
      *                                                               *         
      * 04/20/99 USE TRNFR-TYPE-RJC1-CD = 'SP' TO FLAG SPECIAL ACCOUNT*         
      *                                                               *         
      *****************************************************************         
      * 06/25/98 DJ    NEW PROGRAM                                    *         
      *****************************************************************         
      /                                                                         
       ENVIRONMENT DIVISION.                                                    
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                                
           SELECT INFILE           ASSIGN       TO INFILE                       
                                   FILE STATUS  IS INFILE-STAT.                 
                                                                                
DJ0010     SELECT ADTCUS           ASSIGN       TO ADTCUS                       
DJ0010                             ACCESS MODE  IS DYNAMIC                      
DJ0010                             ORGANIZATION IS INDEXED                      
DJ0010                             RECORD KEY   IS ADT1CUS-KEY                  
DJ0010                             FILE STATUS  IS ADTCUS-STAT.                 
                                                                                
LRM012     SELECT AUXFILE          ASSIGN       TO AUXFILE                      
LRM012                             ACCESS MODE  IS DYNAMIC                      
LRM012                             ORGANIZATION IS INDEXED                      
LRM012                             RECORD KEY   IS FD-AUX23-XREF-KEY            
LRM012                             FILE STATUS  IS AUXFILE-STAT.                
      /                                                                         
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  INFILE                                                               
           RECORDING MODE IS V                                                  
           RECORD IS VARYING IN SIZE FROM 1 TO 3326 CHARACTERS                  
              DEPENDING ON W-REC-LEN-IN                                         
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:== BY ==INFILE==.                
                                                                                
DJ0010 FD  ADTCUS                                                               
DJ0010     LABEL RECORDS ARE STANDARD.                                          
DJ0010     COPY ADT1CUS.                                                        
                                                                                
LRM012 FD  AUXFILE                                                              
LRM012     LABEL RECORDS ARE STANDARD.                                          
LRM012     COPY AUX23REC REPLACING ==:PFX:== BY ==FD-==.                        
      /                                                                         
       WORKING-STORAGE SECTION.                                                 
           COPY PDXIDCOB.                                                       
                                                                                
       01  W-FIELDS.                                                            
           05  W-PGM-NAME                PIC  X(008) VALUE 'CAT513'.            
           05  W-ROUTINE-1               PIC  X(032) VALUE ' '.                 
           05  END-OF-INPUT-SW           PIC  X(001) VALUE '0'.                 
               88 END-OF-INPUT                       VALUE '1'.                 
           05  INFILE-STAT               PIC  X(002).                           
               88 INFILE-OKAY            VALUE '00' THRU '09', '97'.            
               88 INFILE-END-OF-FILE     VALUE '10'.                            
               88 INFILE-EMPTY-MISSING VALUE '35'.                              
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
           05  LD-PROC-DATE.                                                    
               10 LD-PROC-DATE-MM        PIC  X(002).                           
               10 LD-PROC-DATE-DD        PIC  X(002).                           
               10 LD-PROC-DATE-YY        PIC  X(002).                           
           05  W-HDR-TRL-SW              PIC  X(001) VALUE 'T'.                 
               88 HDR-FOUND                          VALUE 'H'.                 
               88 TRL-FOUND                          VALUE 'T'.                 
           05  W-BRK-SW                  PIC  X(001) VALUE ' '.                 
               88 BRK-FOUND                          VALUE 'Y'.                 
           05  FILLER                    PIC  X(008) VALUE 'RECLENIN'.          
           05  W-REC-LEN-IN              PIC  9(005) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'RECLENOT'.          
           05  W-REC-LEN-OUT             PIC  9(005) VALUE 0.                   
           05  FILLER                    PIC  X(008) VALUE 'W-SUB1  '.          
           05  W-SUB1                    PIC  9(004) COMP-3 VALUE 0.            
DJ0010     05  W-SUB2                    PIC  9(004) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'INPUTCNT'.          
           05  W-INFILE-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'DETAILCT'.          
           05  W-DETAIL-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  FILLER                    PIC  X(008) VALUE 'LOAD-CNT'.          
           05  W-LOAD-CNT                PIC  9(009) COMP-3 VALUE 0.            
           05  W-TI-CNT                  PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-NOT-FND-CNT      PIC  9(009) COMP-3 VALUE 0.            
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
           05  W-GETNA-FND-CNT           PIC  9(009) COMP-3 VALUE 0.            
           05  W-GETNA-NOTFND-CNT        PIC  9(009) COMP-3 VALUE 0.            
           05  W-CUST-TYPE-MATCHED-CNT   PIC  9(009) COMP-3 VALUE 0.            
           05  W-CUST-TYPE-UNMATCH-CNT   PIC  9(009) COMP-3 VALUE 0.            
           05  W-TIN-MATCHED-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-TIN-MISMATCHED-CNT      PIC  9(009) COMP-3 VALUE 0.            
           05  W-SPECIAL-ACCT-FND-CNT    PIC  9(009) COMP-3 VALUE 0.            
           05  W-EDIT-DELIVERY-CNT       PIC  9(009) COMP-3 VALUE 0.            
           05  W-EDIT-RECEIVE-CNT        PIC  9(009) COMP-3 VALUE 0.            
DJ0003     05  W-PTR-EDIT-DEL-CNT        PIC  9(009) COMP-3 VALUE 0.            
           05  W-VTRNFR-DUPE-CNT         PIC  9(009) COMP-3 VALUE 0.            
           05  W-REJECT-SWITCHES.                                               
               10  W-REJ-DUP             PIC  X(001) VALUE ' '.                 
               10  W-REJ-NA              PIC  X(001) VALUE ' '.                 
               10  W-REJ-MM              PIC  X(001) VALUE ' '.                 
               10  W-REJ-IRA             PIC  X(001) VALUE ' '.                 
               10  W-REJ-QRP             PIC  X(001) VALUE ' '.                 
               10  W-REJ-SP              PIC  X(001) VALUE ' '.                 
               10  W-REJ-SS              PIC  X(001) VALUE ' '.                 
               10  W-REJ-CMT             PIC  X(001) VALUE ' '.                 
DJ0003         10  W-REJ-SS-MAIN         PIC  X(001) VALUE ' '.                 
DJ0003             88  W-REJ-SS-MAIN-BLANK           VALUE ' '.                 
DJ0003             88  W-REJ-SS-MAIN-MATCHED         VALUE 'N'.                 
DJ0003             88  W-REJ-SS-MAIN-MISMATCHED      VALUE 'Y'.                 
DJ0003         10  W-REJ-SS-IRA          PIC  X(001) VALUE ' '.                 
DJ0003             88  W-REJ-SS-IRA-BLANK            VALUE ' '.                 
DJ0003             88  W-REJ-SS-IRA-MATCHED          VALUE 'N'.                 
DJ0003             88  W-REJ-SS-IRA-MISMATCHED       VALUE 'Y'.                 
DJ0003         10  W-REJ-SS-JOINT        PIC  X(001) VALUE ' '.                 
DJ0003             88  W-REJ-SS-JOINT-BLANK          VALUE ' '.                 
DJ0003             88  W-REJ-SS-JOINT-MATCHED        VALUE 'N'.                 
DJ0003             88  W-REJ-SS-JOINT-MISMATCHED     VALUE 'Y'.                 
DJ0010         10  W-REJ-ADTS            PIC  X(001) VALUE ' '.                 
           05  W-REJECT-AUTO-SW          PIC  X(001) VALUE ' '.                 
           05  W-REJ-CMT-CNT             PIC  9(009) COMP-3 VALUE 0.            
LRM012     05  W-CONV-ACCT               PIC X(20)  VALUE SPACES.               
LRM012     05  W-CONV-SUSPENSE-ACCT      PIC X(12)  VALUE '09424200'.           
LRM025     05  W-SAVE-ACCT-DLVR-NBR      PIC X(20)  VALUE ' '.                  
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'WORKFLDS'.           
       01  W-WORK-FIELDS.                                                       
           05 W-DATE.                                                           
              10 W-DATE-YEAR.                                                   
                 15 W-DATE-CC            PIC  X(02) VALUE ' '.                  
                 15 W-DATE-YY            PIC  X(02) VALUE ' '.                  
              10 FILLER                  PIC  X(01) VALUE '-'.                  
              10 W-DATE-MM               PIC  X(02) VALUE ' '.                  
              10 FILLER                  PIC  X(01) VALUE '-'.                  
              10 W-DATE-DD               PIC  X(02) VALUE ' '.                  
           05 W-BPD-PROC-DATE.                                                  
              10 W-BPD-PROC-YEAR         PIC  9(04).                            
              10 W-BPD-PROC-MM           PIC  9(02).                            
              10 W-BPD-PROC-DD           PIC  9(02).                            
           05 W-BIRTH-DATE               PIC  9(08).                            
           05 FILLER REDEFINES W-BIRTH-DATE.                                    
              10 W-BIRTH-YEAR            PIC  9(04).                            
              10 W-BIRTH-MM              PIC  9(02).                            
              10 W-BIRTH-DD              PIC  9(02).                            
           05 W-CALC-PROC-DATE.                                                 
              10 W-CALC-PROC-YEAR        PIC  9(04).                            
              10 W-CALC-PROC-MM          PIC  9(02).                            
              10 W-CALC-PROC-DD          PIC  9(02).                            
           05 W-AGE70                    PIC  9(08).                            
           05 FILLER REDEFINES W-AGE70.                                         
              10 W-AGE70-YEAR            PIC  9(04).                            
              10 W-AGE70-MM              PIC  9(02).                            
              10 W-AGE70-DD              PIC  9(02).                            
           05 W-ADT-CUSTOMER-TYPE-N      PIC  9(03).                            
           05 W-ADT-CUSTOMER-TYPE-X REDEFINES                                   
              W-ADT-CUSTOMER-TYPE-N      PIC  X(03).                            
ET0001 01  W-SSN-FIELDS.                                                        
ET0001     05 W-RCV-SSN1                 PIC  X(09).                            
ET0001     05 W-RCV-SSN2                 PIC  X(09).                            
ET0001     05 W-NA-SSN1                  PIC  X(09).                            
ET0001     05 W-NA-SSN2                  PIC  X(09).                            
       01  W-ACTITRF-SELECT-FIELDS.                                             
           05 W-ACAT-CONTROL-NO          PIC  X(014).                           
           05 W-TRANS-TYPE-CD            PIC  X(001).                           
           05 W-NSCC-PEND-CD             PIC  X(001).                           
           05 W-PRCS-DT                  PIC  X(010).                           
           05 W-PRGM-NM                  PIC  X(008).                           
           05 W-UPDT-TMSTP               PIC  X(026).                           
           05 W-ACAT-CNTL-ASTD-NBR       PIC  X(014).                           
DJ0004     05 W-INIT-RR-CD               PIC  X(003).                           
       01  W-CUST-TYPE-FIELDS.                                                  
           05 W-CUST-TYPE                PIC  X(002).                           
           05 W-CUST-TYPE-SW             PIC  X(001).                           
              88 W-CUST-TYPE-VALID            VALUE 'Y'.                        
           05 W-IRA-B1-SW                PIC  X(001).                           
              88 W-IRA-B1-FOUND               VALUE 'Y'.                        
           05 W-CUST-TYPE-B1-SW          PIC  X(001).                           
              88 W-CUST-TYPE-B1-FOUND         VALUE 'Y'.                        
           05 W-RETIRE-ACCOUNT-SW        PIC  X(001).                           
              88 W-RETIRE-ACCOUNT-FOUND       VALUE 'Y'.                        
           05 W-IRA-BR-RANGE-SW          PIC  X(001).                           
              88 W-IRA-BR-RANGE-FOUND         VALUE 'Y'.                        
           05 W-IRA-BR-ACT-RANGE-SW      PIC  X(001).                           
              88 W-IRA-BR-ACT-RANGE-FOUND     VALUE 'Y'.                        
           05 W-SPECIAL-ACCOUNTS-SW      PIC  X(001).                           
              88 W-SPECIAL-ACCOUNTS-FOUND     VALUE 'Y'.                        
           05 W-EDIT-DELIVERY-SW         PIC  X(001).                           
              88 W-EDIT-DELIVERY              VALUE 'Y'.                        
           05 W-EDIT-RECEIVE-SW          PIC  X(001).                           
              88 W-EDIT-RECEIVE               VALUE 'Y'.                        
DJ0003     05 W-PTR-EDIT-DEL-SW          PIC  X(001).                           
DJ0003        88 W-PTR-EDIT-DEL               VALUE 'Y'.                        
           05 W-TRANSFER-FND-SW          PIC  X(001).                           
              88 W-TRANSFER-FOUND             VALUE 'Y'.                        
           05 W-TRANSFER-DUPE-SW         PIC  X(001).                           
              88 W-TRANSFER-DUPE              VALUE 'Y'.                        
           05  W-TIFLESS-SW              PIC  X(001).                           
              88 W-TIFLESS-BROKER-FOUND       VALUE 'Y'.                        
       01  W-VALERT-FIELDS.                                                     
           05 W-VALERT-FND-SW            PIC  X(001).                           
              88 W-VALERT-FOUND               VALUE 'Y'.                        
           05  W-VALERT-FND-CNT          PIC  9(009) COMP-3 VALUE 0.            
           05  W-VALERT-NOTFND-CNT       PIC  9(009) COMP-3 VALUE 0.            
LRM005 01  W-VRSDBLK-FIELDS.                                                    
LRM005     05  W-RESCIND-BLOCK-CNT       PIC  9(009) COMP-3 VALUE 0.            
LRM005     05  W-LEGAL-BLOCK-CNT         PIC  9(009) COMP-3 VALUE 0.            
       01  W-VTRNFR-ONLY-FIELDS.                                                
           05 W-BRN-ACCT-LIKE-X.                                                
              10 W-BRN-ACCT.                                                    
                 15 W-BRANCH-CD          PIC  X(03).                            
                 15 W-ACCT-CD            PIC  X(05).                            
              10 FILLER                  PIC  X(01) VALUE '%'.                  
           05 W-BRN-ACCT-LIKE            PIC  X(09).                            
           05 W-RR-CD                    PIC  X(03).                            
           05 W-SAVE-STTS-CD             PIC  X(03).                            
LRM026     05 W-SAVE-PRCS-DT             PIC  X(10).                            
           05 W-NEW-ACCOUNT              PIC  X(20).                            
           05 W-OLD-ACCOUNT              PIC  X(20).                            
       01  W-VTRNFR-SELECT-FIELDS.                                              
           05 W-VTRNFR-ACAT-CONTROL-NBR  PIC  X(14).                            
           05 W-VTRNFR-TRNFR-TYPE-CD     PIC  X(03).                            
           05 W-VTRNFR-TRANS-TYPE-CD     PIC  X(01).                            
           05 W-VTRNFR-STTS-CD           PIC  X(03).                            
           05 W-VTRNFR-DAYS-STTS-QTY     PIC  S9(4) USAGE COMP.                 
           05 W-VTRNFR-PRCS-DT           PIC  X(10).                            
           05 W-VTRNFR-STTLM-DT          PIC  X(10).                            
           05 W-VTRNFR-SYS-ACT-CD        PIC  X(01).                            
           05 W-VTRNFR-SYS-RJCT-RSN-CD   PIC  X(02).                            
           05 W-VTRNFR-BRANCH-CD         PIC  X(03).                            
           05 W-VTRNFR-ACCT-CD           PIC  X(05).                            
           05 W-VTRNFR-ACCT-DLVR-NBR     PIC  X(20).                            
           05 W-VTRNFR-ACCT-RCV-NBR      PIC  X(20).                            
           05 W-VTRNFR-RCV-NBR           PIC  X(04).                            
           05 W-VTRNFR-PRGM-NM           PIC  X(08).                            
           05 W-VTRNFR-UPDT-TMSTP        PIC  X(26).                            
           05 W-VTRNFR-NSCC-PEND-CD      PIC  X(01).                            
      /                                                                         
      ******************************************************************        
      * NSCC EXTRACT FILE                                              *        
      ******************************************************************        
       01  FILLER PIC X(016) VALUE 'CURRENT-RECORD='.                           
       01  FILLER                        PIC X(008) VALUE 'W-NSCC'.             
           COPY NSCCMEXT REPLACING ==:NSCCMEXT:==  BY ==W-NSCC==.               
      /                                                                         
DJ0007******************************************************************        
DJ0007* FACZ1B   COMMAREA - ACCOUNT FREEZE                             *        
DJ0007******************************************************************        
DJ0007 01  FILLER                        PIC X(008) VALUE  'FACZ1CA'.           
DJ0007 01  FACZ1B                        PIC X(008) VALUE  'FACZ1B'.            
DJ0007 01  W-FAC-AREA.                                                          
DJ0007     10  W-FAC-CASH-IN-IND          PIC  X(01).                           
DJ0007      88 W-FAC-CASH-IN-FRZ-YES                 VALUE 'Y'.                 
DJ0007      88 W-FAC-CASH-IN-FRZ-NOT                 VALUE 'N'.                 
DJ0007     10  W-FAC-CASH-OUT-IND         PIC  X(01).                           
DJ0007      88 W-FAC-CASH-OUT-FRZ-YES                VALUE 'Y'.                 
DJ0007      88 W-FAC-CASH-OUT-FRZ-NOT                VALUE 'N'.                 
DJ0007     10  W-FAC-SEC-IN-IND           PIC  X(01).                           
DJ0007      88 W-FAC-SEC-IN-FRZ-YES                  VALUE 'Y'.                 
DJ0007      88 W-FAC-SEC-IN-FRZ-NOT                  VALUE 'N'.                 
DJ0007     10  W-FAC-SEC-OUT-IND          PIC  X(01).                           
DJ0007      88 W-FAC-SEC-OUT-FRZ-YES                 VALUE 'Y'.                 
DJ0007      88 W-FAC-SEC-OUT-FRZ-NOT                 VALUE 'N'.                 
DJ0007                                                                          
DJ0007     COPY FACZ1CA REPLACING ==:P:== BY ==F-==.                            
      /                                                                         
      ******************************************************************        
      * DOCUMENT TRACKING                                              *        
      ******************************************************************        
DJ0010 01  W-ADTCUS-FIELDS.                                                     
DJ0010     05  ADTCUS-STAT               PIC  X(002).                           
DJ0010         88 ADTCUS-OKAY            VALUE '00' THRU '09', '97'.            
DJ0010         88 ADTCUS-FOUND           VALUE '00'.                            
DJ0010         88 ADTCUS-NOT-FOUND       VALUE '23'.                            
DJ0010         88 ADTCUS-END-OF-FILE     VALUE '10'.                            
DJ0010         88 ADTCUS-EMPTY-MISSING   VALUE '35'.                            
DJ0010     05  W-ADTCUS-CNT              PIC  9(009) COMP-3 VALUE 0.            
DJ0010     05  W-ADTCUS-DOC-SW           PIC  X(01)  VALUE 'N'.                 
DJ0010         88  W-ADTCUS-DOC-FOUND                VALUE 'Y'.                 
DJ0010         88  W-ADTCUS-DOC-MISSING              VALUE 'N'.                 
DJ0010     05  WS-LAST-ADTS-DOC-CODE     PIC X(4)    VALUE ' '.                 
DJ0010     05  WS-LAST-ADTS-REJ-CODE     PIC X(2)    VALUE ' '.                 
DJ0010     05  WS-LAST-ADTS-REJ-CMNT     PIC X(45)   VALUE ' ' .                
                                                                                
LRM012 01  W-AUXFILE-FIELDS.                                                    
LRM012     05  AUXFILE-STAT              PIC  X(002).                           
LRM012         88 AUXFILE-OKAY           VALUE '00' THRU '09', '97'.            
LRM012         88 AUXFILE-FOUND          VALUE '00'.                            
LRM012         88 AUXFILE-NOT-FOUND      VALUE '23'.                            
LRM012         88 AUXFILE-END-OF-FILE    VALUE '10'.                            
LRM012         88 AUXFILE-EMPTY-MISSING  VALUE '35'.                            
LRM012     05  W-AUXFILE-CNT             PIC  9(009) COMP-3 VALUE 0.            
      /                                                                         
      ******************************************************************        
      * GETNA    COMMAREA                                              *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE  'GETNACOB'.          
                                                                                
           COPY GETNACOB.                                                       
                                                                                
       01  GETNA-SEGMENT-INCLUDES.                                              
           COPY NASEGPPA.                                                       
DJ0011     COPY NNASGRPB.                                                       
           COPY NASEGEND.                                                       
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'BHINFO  '.            
           COPY BHINFO.                                                         
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'BHACAT  '.            
           COPY BHACAT.                                                         
LRM021     COPY BHAT3.                                                          
      /                                                                         
       01  FILLER                        PIC X(08) VALUE 'BHMGCA  '.            
           COPY BHMGCA.                                                         
      /                                                                         
DJ0007 01  FILLER                        PIC X(08) VALUE 'BHREQ   '.            
DJ0007     COPY BHREQ.                                                          
      /                                                                         
DJ0010 01  FILLER                        PIC X(08) VALUE 'BHICS   '.            
DJ0010     COPY BHICS.                                                          
      /                                                                         
       01  FILLER                        PIC X(008) VALUE 'BPDATESC'.           
                                                                                
           COPY BPDATESC.                                                       
      /                                                                         
TCK001 01  FILLER                        PIC X(007) VALUE 'STUBCPY'.            
TCK001     COPY STUBCPY.                                                        
TCK001 01  ABEND-CD                      PIC  S9(04) COMP SYNC VALUE 0.         
      /                                                                         
      ******************************************************************        
      * TRANSFER INIT   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'ACTITRF'.            
           EXEC SQL INCLUDE ACTITRF      END-EXEC.                              
      /                                                                         
      ******************************************************************        
      * TRANSFER ACTIVE TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VTRNFR'.             
           EXEC SQL INCLUDE VTRNFR       END-EXEC.                              
      /                                                                         
      ******************************************************************        
      * ALERT MESSAGE   TABLE                                          *        
      ******************************************************************        
       01  FILLER                        PIC X(008) VALUE 'VALERT'.             
           EXEC SQL INCLUDE VALERT       END-EXEC.                              
      /                                                                         
LRM005******************************************************************        
LRM005* RESCIND BLOCK  TABLE                                           *        
LRM005******************************************************************        
LRM005 01  FILLER                        PIC X(008) VALUE 'VRSDBLK'.            
LRM005     EXEC SQL INCLUDE VRSDBLK      END-EXEC.                              
      /                                                                         
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
DJ0001     05  W-COMMIT-CNT              PIC  9(009) COMP-3 VALUE 0.            
           05  W-LAST-COMMIT-INFILE-CNT  PIC  9(009) COMP-3 VALUE 0.            
           05  W-DB2-TABLE-NAME          PIC  X(008).                           
           05  W-DB2-ACTION              PIC  X(008).                           
           05  W-DB2-SQLCODE             PIC  ---9.                             
           05  W-SQLERRD-3               PIC  S9(9).                            
           05  W-SQL-DELETE-COUNT        PIC  --------9.                        
                                                                                
       01  FILLER                        PIC  X(008) VALUE 'TIMESTMP'.          
       01  W-CURRENT-TIMESTAMP           PIC  X(026).                           
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
                                                                                
       PROCEDURE DIVISION USING L-JCL-PARMS.                                    
      *                         ===========                                     
           DISPLAY 'CAT513 - PROCESS TRANSFER (TI) RECORDS'                     
                   ' INBOUND FROM NSCC'.                                        
           DISPLAY '         '                                                  
           'DELETE TRANSFER ROWS FROM INIT DB2 TABLE'                           
           DISPLAY '         '                                                  
           'INSERT TRANSFER ROWS INTO ACTIVE DB2 TABLE'                         
           DISPLAY '         '                                                  
           'ADD EXCEPTION TRANSFERS TO INIT DB2 TABLE'                          
           DISPLAY '         '                                                  
           'RESET NSCC-PEND SWITCH'                                             
           DISPLAY ' '.                                                         
           COPY MSGCOBO.                                                        
           DISPLAY ' '.                                                         
                                                                                
           PERFORM 1000-INIT          THRU 1000-EXIT.                           
                                                                                
           PERFORM 2000-PROCESS-INPUT THRU 2000-EXIT                            
                   UNTIL END-OF-INPUT.                                          
                                                                                
           PERFORM 9000-CLOSE-ROUTINE  THRU 9000-EXIT.                          
                                                                                
           GOBACK.                                                              
      /                                                                         
       1000-INIT.                                                               
           MOVE '1000-INIT                     ' TO W-ROUTINE-1.                
                                                                                
           EXEC SQL                                                             
               SET :W-CURRENT-TIMESTAMP = CURRENT TIMESTAMP                     
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE      TO W-DB2-SQLCODE                                   
           IF  SQLCODE = +0                                                     
               DISPLAY ' '                                                      
               DISPLAY 'CAT513: W-CURRENT-TIMESTAMP = '                         
                                                    W-CURRENT-TIMESTAMP         
               DISPLAY ' '                                                      
           ELSE                                                                 
               DISPLAY 'CAT513: W-CURRENT-TIMESTAMP NOT SET'                    
               DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                               
               PERFORM  8000-SQL-ERROR THRU 8000-EXIT                           
           END-IF.                                                              
                                                                                
           ACCEPT W-SYS-DATE              FROM DATE.                            
           ACCEPT W-SYS-TIME              FROM TIME.                            
           DISPLAY 'CAT513: SYS-DATE ' W-SYS-DATE                               
                          ' SYS-TIME ' W-SYS-TIME.                              
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT513: L-BYP-DATECHK-SW = '                                
                            L-BYP-DATECHK-SW                                    
           ' (1=BYPASS DATE CHECK)'                                             
           DISPLAY 'CAT513: L-BYP-FILECHK-SW = '                                
                            L-BYP-FILECHK-SW                                    
           ' (1=BYPASS FILE CHECK. BYPASS EMPTY FILE,DB2 ABENDS.)'              
           DISPLAY 'CAT513: L-RERUN-SW       = '                                
                            L-RERUN-SW                                          
           ' (1=THIS IS A RERUN. ALLOW DUPES AND NOTFNDS.)'                     
           IF  L-BYP-DATECHK                                                    
               DISPLAY 'CAT513: DATE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT513: DATE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-BYP-FILECHK                                                    
               DISPLAY 'CAT513: FILE CHECK WILL BE BYPASSED'                    
           ELSE                                                                 
               DISPLAY 'CAT513: FILE CHECK WILL BE PERFORMED'                   
           END-IF.                                                              
           IF  L-RERUN                                                          
               DISPLAY ' '                                                      
               DISPLAY '*--------------------------------------------*'         
               DISPLAY 'CAT513: THIS IS A RERUN.'                               
               DISPLAY '*--------------------------------------------*'         
               DISPLAY ' '                                                      
           END-IF.                                                              
                                                                                
           MOVE 'CAT513'                  TO BPDATES-CALLING-PGM.               
           SET  LNKDATZ-REQUEST           TO TRUE.                              
TCK001     CALL BPDATES   USING BPDATES-PARAMETERS.                             
           MOVE BPD-PROC-DATE(3:2)        TO LD-PROC-DATE-YY.                   
           MOVE BPD-PROC-DATE(5:2)        TO LD-PROC-DATE-MM.                   
           MOVE BPD-PROC-DATE(7:2)        TO LD-PROC-DATE-DD.                   
           MOVE BPD-PROC-DATE             TO W-BPD-PROC-DATE.                   
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY 'CAT513:       BPD-PROC-DATE= ' BPD-PROC-DATE                
                                '  LD-PROC-DATE= ' LD-PROC-DATE.                
           DISPLAY 'CAT513: BPD-PRIOR-PROC-DATE= ' BPD-PRIOR-PROC-DATE.         
           DISPLAY ' '.                                                         
                                                                                
           MOVE '000'                  TO BH-BROKER-NUMBER                      
                                                                                
           OPEN INPUT INFILE.                                                   
           DISPLAY 'CAT513: INFILE  OPENED FOR INPUT.  STATUS = '               
                                               INFILE-STAT.                     
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT513: ERROR OPENING INFILE'                           
               DISPLAY 'CAT513: OPEN STATUS = ' INFILE-STAT                     
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT513: U3001 - ABENDING ON BAD FILE STATUS'            
               MOVE +3001    TO ABEND-CD                                        
TCK001         CALL ABEND USING ABEND-CD                                        
           END-IF.                                                              
                                                                                
           PERFORM 1500-CHECK-HDR-REC  THRU 1500-EXIT.                          
                                                                                
DJ0010     OPEN INPUT ADTCUS.                                                   
DJ0010     DISPLAY 'CAT513: ADTCUS   OPENED FOR INPUT.  STATUS = '              
DJ0010                                        ADTCUS-STAT                       
DJ0010                                                                          
DJ0010     IF  ADTCUS-OKAY                                                      
DJ0010         CONTINUE                                                         
DJ0010     ELSE                                                                 
DJ0010         DISPLAY 'CAT513: ERROR OPENING ADTCUS'                           
DJ0010         DISPLAY 'CAT513: OPEN STATUS = ' ADTCUS-STAT                     
DJ0010         DISPLAY 'CAT513: U3001 - ABENDING ON BAD FILE STATUS'            
DJ0010         MOVE +3002    TO ABEND-CD                                        
DJ0010         CALL ABEND USING ABEND-CD                                        
DJ0010     END-IF.                                                              
                                                                                
LRM012     OPEN INPUT AUXFILE.                                                  
LRM012     DISPLAY 'CAT513: AUXFILE   OPENED FOR INPUT.  STATUS = '             
LRM012                                        AUXFILE-STAT                      
LRM012     IF  AUXFILE-OKAY                                                     
LRM012         CONTINUE                                                         
LRM012     ELSE                                                                 
LRM012         DISPLAY 'CAT513: ERROR OPENING AUXFILE'                          
LRM012         DISPLAY 'CAT513: OPEN STATUS = ' AUXFILE-STAT                    
LRM012         DISPLAY 'CAT513: U3001 - ABENDING ON BAD FILE STATUS'            
LRM012         MOVE +3003    TO ABEND-CD                                        
LRM012         CALL ABEND USING ABEND-CD                                        
LRM012     END-IF.                                                              
                                                                                
           MOVE SPACES                 TO   GETNA-PARAMETERS.                   
           MOVE 'CAT513'               TO   GETNA-PGM-NAME.                     
           MOVE 'R'                    TO   GETNA-REQ-FUNC.                     
           MOVE 'R'                    TO   GETNA-REQ-FILE.                     
           MOVE 'R'                    TO   GETNA-REQ-FUNC2.                    
           MOVE 'N'                    TO   GETNA-REQ-YEAREND.                  
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE HDR REC  TO GET THE TIMESTAMP                                 
      *  FOR THE LAST TIME WE TRANSMITTED TO NSCC                               
      ******************************************************************        
       1500-CHECK-HDR-REC.                                                      
                                                                                
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF  END-OF-INPUT                                                     
               DISPLAY 'CAT513: END OF INPUT REACHED'                           
               IF  L-BYP-FILECHK                                                
                   DISPLAY 'CAT513: BYPASSING FILE CHECK PER JCLPARM'           
                   GO TO 1500-EXIT                                              
               ELSE                                                             
                   DISPLAY 'CAT513: U3003 - ABENDING ON EMPTY FILE'             
                   MOVE +3004    TO ABEND-CD                                    
TCK001             CALL ABEND USING ABEND-CD                                    
               END-IF                                                           
           END-IF.                                                              
           IF  INFILE-HDR-RECORD                                                
               SET INFILE-DATE-FOUND TO TRUE                                    
               DISPLAY 'CAT513: INFILE  DATE = '                                
                                              INFILE-HDR-PROC-DATE              
                             ', UPDT BY PGM=' INFILE-HDR-PGM-NAME               
                                     ' DATE=' INFILE-HDR-SYS-DATE               
                                     ' TIME=' INFILE-HDR-SYS-TIME               
               IF  INFILE-HDR-PROC-DATE = LD-PROC-DATE                          
                   DISPLAY 'CAT513: INFILE  DATE = PROC DATE. OKAY'             
               ELSE                                                             
                   DISPLAY 'CAT513: INFILE  DATE NOT = PROC DATE'               
                   IF L-BYP-DATECHK                                             
                   DISPLAY 'CAT513: BYPASSING DATE CHECK PER JCLPARM'           
                   ELSE                                                         
                      DISPLAY 'CAT513: U3004 - ABENDING ON BAD DATE'            
                      MOVE +3005    TO ABEND-CD                                 
TCK001                CALL ABEND USING ABEND-CD                                 
                   END-IF                                                       
               END-IF                                                           
           ELSE                                                                 
               DISPLAY 'CAT513: INFILE  DATE RECORD MISSING'                    
                   IF L-BYP-DATECHK                                             
                   DISPLAY 'CAT513: BYPASSING DATE CHECK PER JCLPARM'           
                   ELSE                                                         
                      DISPLAY 'CAT513: U3005 - ABENDING ON BAD DATE'            
                      MOVE +3006   TO ABEND-CD                                  
TCK001                CALL ABEND USING ABEND-CD                                 
                   END-IF                                                       
           END-IF.                                                              
                                                                                
           DISPLAY '**********************************'                         
           DISPLAY 'CAT513: INBOUND-CYCLE-NBR     = '                           
                                         INFILE-HDR-CYCLE-NBR                   
           DISPLAY '**********************************'                         
                                                                                
           DISPLAY ' '.                                                         
                                                                                
       1500-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE NSCC FILE AND PROCESS ONLY TRANSFER ('T') RECORDS.            
      *  LOAD 'TI' RECORDS                                                      
      ******************************************************************        
       2000-PROCESS-INPUT.                                                      
           MOVE '2000-PROCESS-INPUT         ' TO W-ROUTINE-1.                   
                                                                                
           PERFORM 3000-READ-INPUT THRU 3000-EXIT                               
                                                                                
           IF  END-OF-INPUT                                                     
               CONTINUE                                                         
           ELSE                                                                 
                   EVALUATE W-NSCC-REC-SUBTYPE                                  
                       WHEN 'T'                                                 
                               PERFORM 4000-LOAD      THRU 4000-EXIT            
                   END-EVALUATE                                                 
           END-IF.                                                              
                                                                                
       2000-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  READ THE NSCC FILE AND MOVE TO WORKING-STORAGE.                        
      ******************************************************************        
       3000-READ-INPUT.                                                         
           MOVE '3000-READ-INPUT            ' TO W-ROUTINE-1.                   
                                                                                
           IF  END-OF-INPUT                                                     
               DISPLAY 'CAT513: WARNING - READING AFTER EOF'                    
               GO 3000-EXIT                                                     
           END-IF.                                                              
                                                                                
           READ INFILE                                                          
                AT END                                                          
                   MOVE '1'              TO END-OF-INPUT-SW                     
                   DISPLAY 'CAT513: END OF INPUT REACHED'                       
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
                   GO TO 3000-EXIT                                              
           END-READ.                                                            
                                                                                
           ADD  1                        TO W-INFILE-CNT.                       
                                                                                
           IF  INFILE-OKAY                                                      
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY 'CAT513: ERROR READING INFILE'                           
               DISPLAY 'CAT513: READ STATUS = ' INFILE-STAT                     
                            '.  INPUT-CNT = ' W-INFILE-CNT                      
               DISPLAY 'CAT513: U3006 - ABENDING ON BAD FILE STATUS'            
               MOVE +3007    TO ABEND-CD                                        
TCK001         CALL ABEND USING ABEND-CD                                        
           END-IF.                                                              
                                                                                
           MOVE SPACES                   TO W-NSCC-RECORD                       
           MOVE W-REC-LEN-IN             TO W-REC-LEN-OUT                       
                                                                                
           MOVE INFILE-RECORD   (1 : W-REC-LEN-IN) TO                           
                W-NSCC-RECORD   (1 : W-REC-LEN-IN)                              
                                                                                
           IF  INFILE-HDR-RECORD                                                
               DISPLAY 'CAT513: INFILE-HDR-REC= '                               
                                                 INFILE-HDR-REC (1:120)         
               GO TO 3000-EXIT                                                  
           ELSE                                                                 
               IF  INFILE-TRL-RECORD                                            
               DISPLAY 'CAT513: INFILE-TRL-REC= '                               
                                                 INFILE-TRL-REC (1:120)         
               DISPLAY 'CAT513: INFILE-TRL-REC-CNT = '                          
                                                     INFILE-TRL-REC-CNT         
               DISPLAY 'CAT513: W-DETAIL-CNT       = '                          
                                                     W-DETAIL-CNT               
               GO TO 3000-READ-INPUT                                            
               END-IF                                                           
           END-IF.                                                              
                                                                                
           ADD  1                        TO W-DETAIL-CNT.                       
                                                                                
           EVALUATE W-NSCC-REC-SUBTYPE                                          
               WHEN 'T'      ADD 1 TO W-TI-CNT                                  
           END-EVALUATE                                                         
                                                                                
           IF  W-NSCC-KEY-CLIENT-NBR(2:3) > '000'                               
               IF  W-NSCC-KEY-CLIENT-NBR(2:3) = BH-BROKER-NUMBER                
                   CONTINUE                                                     
               ELSE                                                             
                   PERFORM 3500-GETB1 THRU 3500-EXIT                            
               END-IF                                                           
           END-IF.                                                              
                                                                                
       3000-EXIT. EXIT.                                                         
      /                                                                         
       3500-GETB1.                                                              
                                                                                
           MOVE ' '                        TO BH-BROKER-HEADER-INFO             
                                              BH-ACAT-INFO                      
                                              BH-MGCA-INFO                      
DJ0010                                        BH-ICS-INFO                       
LRM021                                        BH-AT3-INFO                       
           MOVE W-NSCC-KEY-CLIENT-NBR(2:3) TO BH-BROKER-NUMBER                  
           MOVE '015'                      TO BH-LOGICAL-RECORD-CODE            
           MOVE '434500'                   TO BH-B2-INFO-ID                     
TCK001     CALL  GETB1V                 USING BH-BROKER-HEADER-INFO,            
                                              BH-ACAT-INFO                      
           END-CALL.                                                            
LRM021     MOVE '015'                      TO BH-LOGICAL-RECORD-CODE.           
LRM021     MOVE '434910'                   TO BH-B2-INFO-ID.                    
LRM021     CALL  GETB1V                 USING BH-BROKER-HEADER-INFO,            
LRM021                                        BH-AT3-INFO                       
LRM021     END-CALL.                                                            
                                                                                
           MOVE '009110'                   TO BH-B2-INFO-ID                     
TCK001     CALL  GETB1V                 USING BH-BROKER-HEADER-INFO,            
                                              BH-MGCA-INFO                      
           END-CALL.                                                            
                                                                                
DJ0007     MOVE ' '                       TO  BH-B2-INFO-ID                     
DJ0007     MOVE '114'                     TO  BH-LOGICAL-RECORD-CODE            
DJ0007     CALL GETB1V                  USING BH-BROKER-HEADER-INFO             
DJ0007                                        BH-REQ-INFO                       
DJ0007     END-CALL                                                             
                                                                                
DJ0010     MOVE '501000'                  TO  BH-B2-INFO-ID                     
DJ0010     MOVE '015'                     TO  BH-LOGICAL-RECORD-CODE            
DJ0010     CALL GETB1V                  USING BH-BROKER-HEADER-INFO             
DJ0010                                        BH-ICS-INFO                       
DJ0010     END-CALL                                                             
                                                                                
           DISPLAY ' '                                                          
           DISPLAY 'NEW-CLIENT = ' BH-BROKER-NUMBER                             
                                       ' ' BH-BROKER-NAME                       
                               ' BRK-NO= ' BH-BROKER-OLD-CLEARING-HOUSE         
           DISPLAY 'CAT513: BH-ACAT-STATUS                 (434501) = '         
                            BH-ACAT-STATUS                                      
           DISPLAY 'CAT513: BH-ACAT-DEFINE-CUSTOMER-TYPE   (434504) = '         
                            BH-ACAT-DEFINE-CUSTOMER-TYPE                        
           DISPLAY 'CAT513: BH-ACAT-INVALID-ACCT-AUTO-REJ  (434523) = '         
                            BH-ACAT-INVALID-ACCT-AUTO-REJ                       
           DISPLAY 'CAT513: BH-ACAT-PART-TRANSFR-ASSET-EXC (434526) = '         
                            BH-ACAT-PART-TRANSFR-ASSET-EXC                      
           DISPLAY 'CAT513: BH-ACAT-DEFAULT-CUSTOMER-TYPE  (434531) = '         
                            BH-ACAT-DEFAULT-CUSTOMER-TYPE                       
           DISPLAY 'CAT513: BH-ACAT-RETIRE-ACT-SUB-CTG-NO  (434534) = '         
                            BH-ACAT-RETIRE-ACT-SUB-CTG-NO                       
                            ' (65 BYTES DISLAYED)'                              
           DISPLAY '        BH-ACAT-RETIRE-ACT-SUB-CTG     (434534) = '         
                            BH-ACAT-RETIRE-ACT-SUB-CTG (1:65)                   
           DISPLAY 'CAT513: BH-ACAT-CUST-TYPE-VALUE-NO     (434535) = '         
                            BH-ACAT-CUST-TYPE-VALUE-NO                          
                            ' (65 BYTES DISLAYED)'                              
           DISPLAY '        BH-ACAT-CUST-TYPE-VALUES       (434535) = '         
                            BH-ACAT-CUST-TYPE-VALUES   (1:65)                   
           DISPLAY 'CAT513: BH-ACAT-SPECIAL-ACCOUNTS-NO    (434538) = '         
                            BH-ACAT-SPECIAL-ACCOUNTS-NO                         
           MOVE 1 TO W-SUB1.                                                    
                                                                                
       3500-LOOP0.                                                              
           IF  BH-ACAT-SPECIAL-ACCOUNTS-NO     > 0                              
           DISPLAY '        BH-ACAT-SPECIAL-ACCOUNTS   (' W-SUB1 ') = '         
                            BH-ACAT-SPECIAL-ACCOUNTS-LO(W-SUB1)                 
                       '-'  BH-ACAT-SPECIAL-ACCOUNTS-HI(W-SUB1)                 
               IF  W-SUB1 < BH-ACAT-SPECIAL-ACCOUNTS-NO                         
                   ADD 1 TO W-SUB1                                              
                   GO TO 3500-LOOP0                                             
               END-IF                                                           
           END-IF.                                                              
                                                                                
LRM021     MOVE 1 TO W-SUB1.                                                    
LRM021 3500-LOOP0-A.                                                            
LRM021     IF BH-AT3-ACTIVE                                                     
LRM021     AND BH-AT3-SP-DEL-ADDL-ACCTS-NO     > 0                              
LRM021     DISPLAY '    BH-AT3-SP-DEL-ADDL-ACCTS  (' W-SUB1 ') = '              
LRM021                  BH-AT3-SP-DEL-ADDL-ACCTS-BR-LO (W-SUB1)                 
LRM021            '-'   BH-AT3-SP-DEL-ADDL-ACCTS-BR-HI (W-SUB1)                 
LRM021            ' '   BH-AT3-SP-DEL-ADDL-ACCTS-AC-LO (W-SUB1)                 
LRM021            '-'   BH-AT3-SP-DEL-ADDL-ACCTS-AC-HI (W-SUB1)                 
LRM021         IF  W-SUB1 < BH-AT3-SP-DEL-ADDL-ACCTS-NO                         
LRM021             ADD 1 TO W-SUB1                                              
LRM021             GO TO 3500-LOOP0-A                                           
LRM021         END-IF                                                           
LRM021     END-IF.                                                              
                                                                                
           DISPLAY 'CAT513: BH-ACAT-RETIRE-ACCOUNTS        (434539) = '         
                            BH-ACAT-RETIRE-ACCOUNTS    (1:65)                   
           DISPLAY 'CAT513: BH-ACAT-REJ-PEND-FULL-REC-CMT  (434544) = '         
                            BH-ACAT-REJ-PEND-FULL-REC-CMT                       
           DISPLAY 'CAT513: BH-ACAT-REJ-PEND-FULL-DEL-DUP  (434558) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-DUP                       
           DISPLAY 'CAT513: BH-ACAT-REJ-PEND-FULL-DEL-MM   (434559) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-MM                        
           DISPLAY 'CAT513: BH-ACAT-REJ-PEND-FULL-DEL-IRA  (434563) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-IRA                       
TCK001     DISPLAY 'CAT513: BH-ACAT-REJ-PEND-FULL-DEL-QRP  (434564) = '         
TCK001                      BH-ACAT-REJ-PEND-FULL-DEL-QRP                       
           DISPLAY 'CAT513: BH-ACAT-REJ-PEND-FULL-DEL-SP   (434565) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-SP                        
           DISPLAY 'CAT513: BH-ACAT-REJ-PEND-FULL-DEL-SS   (434568) = '         
                            BH-ACAT-REJ-PEND-FULL-DEL-SS                        
DJ0003     DISPLAY 'CAT513: BH-ACAT-REJ-PEND-PTR-DEL-SS    (434569) = '         
DJ0003                      BH-ACAT-REJ-PEND-PTR-DEL-SS                         
DJ0003     DISPLAY 'CAT513: BH-ACAT-REJ-PEND-PTR-DEL-MM    (434570) = '         
DJ0003                      BH-ACAT-REJ-PEND-PTR-DEL-MM                         
DJ0003     DISPLAY 'CAT513: BH-ACAT-REJ-PEND-PTR-DEL-DUP   (434571) = '         
DJ0003                      BH-ACAT-REJ-PEND-PTR-DEL-DUP                        
                                                                                
           DISPLAY 'CAT513: BH-ACAT-TIFLESS-BROKER-NUM-NO  (434655) = '         
                            BH-ACAT-TIFLESS-BROKER-NUM-NO                       
           MOVE 1 TO W-SUB1.                                                    
       3500-LOOP1.                                                              
           IF  BH-ACAT-TIFLESS-BROKER-NUM-NO   > 0                              
           DISPLAY '        BH-ACAT-TIFLESS-BROKER-NUM (' W-SUB1 ') = '         
                            BH-ACAT-TIFLESS-BROKER-NUM (W-SUB1)                 
               IF  W-SUB1 < BH-ACAT-TIFLESS-BROKER-NUM-NO                       
                   ADD 1 TO W-SUB1                                              
                   GO TO 3500-LOOP1                                             
               END-IF                                                           
           END-IF.                                                              
                                                                                
LRM005     DISPLAY 'CAT513: BH-ACAT-LEGAL-BLOCK-IND        (434677) = '         
LRM005                      BH-ACAT-LEGAL-BLOCK-IND                             
LRM005     DISPLAY 'CAT513: BH-ACAT-CLIENT-RESCIND-IND     (434678) = '         
LRM005                      BH-ACAT-CLIENT-RESCIND-IND                          
ET0001     DISPLAY 'CAT513: BH-ACAT-SECONDARY-SSN          (434685) = '         
ET0001                      BH-ACAT-SECONDARY-SSN                               
DJ0012     DISPLAY 'CAT513: BH-ACAT-ASCENDIS-USER          (434735) = '         
DJ0012                      BH-ACAT-ASCENDIS-USER                               
                                                                                
           DISPLAY 'CAT513: BH-MGCA-IRA-BR-RANGE-NO        (009125) = '         
                            BH-MGCA-IRA-BR-RANGE-NO                             
           MOVE 1 TO W-SUB1.                                                    
       3500-LOOP2.                                                              
           IF  BH-MGCA-IRA-BR-RANGE-NO > 0                                      
           DISPLAY '        BH-MGCA-IRA-BR-RANGE   (' W-SUB1 ') = '             
                            BH-MGCA-IRA-BR-RANGE-LO (W-SUB1)                    
                       '-'  BH-MGCA-IRA-BR-RANGE-HI (W-SUB1)                    
               IF  W-SUB1 < BH-MGCA-IRA-BR-RANGE-NO                             
                   ADD 1 TO W-SUB1                                              
                   GO TO 3500-LOOP2                                             
               END-IF                                                           
           END-IF.                                                              
                                                                                
           DISPLAY 'CAT513: BH-MGCA-IRA-BR-ACT-RANGE-NO    (009126) = '         
                            BH-MGCA-IRA-BR-ACT-RANGE-NO                         
           MOVE 1 TO W-SUB1.                                                    
       3500-LOOP3.                                                              
           IF  BH-MGCA-IRA-BR-ACT-RANGE-NO > 0                                  
           DISPLAY '        BH-MGCA-IRA-BR-ACT-RANGE (' W-SUB1 ') = '           
                            BH-MGCA-IRA-BR-ACT-BR-LO   (W-SUB1)                 
                       '-'  BH-MGCA-IRA-BR-ACT-BR-HI   (W-SUB1)                 
                       '-'  BH-MGCA-IRA-BR-ACT-ACT-LO  (W-SUB1)                 
                       '-'  BH-MGCA-IRA-BR-ACT-ACT-HI  (W-SUB1)                 
               IF  W-SUB1 < BH-MGCA-IRA-BR-ACT-RANGE-NO                         
                   ADD 1 TO W-SUB1                                              
                   GO TO 3500-LOOP3                                             
               END-IF                                                           
           END-IF.                                                              
                                                                                
DJ0007     DISPLAY 'CAT513: BH-REQ-ACCT-FREEZE-PROC        (032958) = '         
DJ0007                      BH-REQ-ACCT-FREEZE-PROC                             
                                                                                
DJ0010**--B1#501282 IS THE BTS DOCUMENT TRACKING SYSTEM                         
DJ0010     DISPLAY 'CAT513: BH-BTS-COMMOD-INQUIRY          (501282) = '         
DJ0010                      BH-BTS-COMMOD-INQUIRY                               
DJ0010                      ' (ADTS - BTS DOCUMENT TRACKING SYSTEM)'            
DJ0010     DISPLAY 'CAT513: BH-ACAT-ADTS-DOCUM-EDIT-NO     (434733) = '         
DJ0010                      BH-ACAT-ADTS-DOCUM-EDIT-NO                          
DJ0010     MOVE 1 TO W-SUB1.                                                    
DJ0010 3500-LOOP4.                                                              
DJ0010     IF  BH-ACAT-ADTS-DOCUM-EDIT-NO > 0                                   
DJ0010     DISPLAY '        BH-ACAT-ADTS-DOCUM-EDIT (' W-SUB1 ') = '            
DJ0010                      BH-ACAT-ADTS-DOCUM-EDIT (W-SUB1)                    
DJ0010         IF  W-SUB1 < BH-ACAT-ADTS-DOCUM-EDIT-NO                          
DJ0010             ADD 1 TO W-SUB1                                              
DJ0010             GO TO 3500-LOOP4                                             
DJ0010         END-IF                                                           
DJ0010     END-IF.                                                              
                                                                                
       3500-EXIT. EXIT.                                                         
      /                                                                         
      ******************************************************************        
      *  IF TRANSACTION TYPE = ADD                                              
      *     1. READ THE INIT-TABLE TO GET THE TRANSFER.                         
      *     2. FORMAT FIELDS FOR THE ACTIVE-TABLE.                              
      *     3. ADD TO THE ACTIVE-TABLE.                                         
      *     4. DELETE FROM THE INIT-TABLE.                                      
      *  IF SUBMITTED BY THIS BROKER                                            
      *     1. DELETE FROM THE INIT-TABLE.                                      
      ******************************************************************        
       4000-LOAD.                                                               
           MOVE '4000-LOAD                  ' TO W-ROUTINE-1.                   
                                                                                
           ADD 1    TO W-LOAD-CNT                                               
           MOVE ' ' TO W-REJECT-SWITCHES                                        
           MOVE ' ' TO W-REJECT-AUTO-SW                                         
           MOVE ' ' TO W-EDIT-DELIVERY-SW                                       
           MOVE ' ' TO W-EDIT-RECEIVE-SW                                        
DJ0003     MOVE ' ' TO W-PTR-EDIT-DEL-SW                                        
           MOVE ' ' TO DCLVTRNFR                                                
                       DCLACTITRF                                               
                                                                                
           IF  W-NSCC-REC-SUBTYPE      = 'T'                                    
           AND (W-NSCC-TI-TRAN-TYPE    = 'A' OR 'C')                            
           AND W-NSCC-TI-TFR-TYPE      = 'FUL'                                  
               IF W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR                   
                  MOVE 'Y' TO W-EDIT-DELIVERY-SW                                
                  ADD   1  TO W-EDIT-DELIVERY-CNT                               
               ELSE                                                             
                  MOVE 'Y' TO W-EDIT-RECEIVE-SW                                 
                  ADD   1  TO W-EDIT-RECEIVE-CNT                                
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  W-NSCC-REC-SUBTYPE      = 'T'                                    
           AND (W-NSCC-TI-TRAN-TYPE    = 'A' OR 'C')                            
           AND W-NSCC-TI-TFR-TYPE      = 'PTR'                                  
           AND W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR                      
               IF BH-ACAT-PART-TRANSFR-ASSET-EXC = '1'                          
                  MOVE 'Y' TO W-EDIT-DELIVERY-SW                                
                  ADD   1  TO W-EDIT-DELIVERY-CNT                               
                  DISPLAY 'INP=' W-INFILE-CNT                                   
                             ' ' W-NSCC-KEY-CLIENT-NBR                          
                             ' ' W-NSCC-TI-ACAT-CTL-NBR                         
                             ' ' W-NSCC-TI-TFR-TYPE                             
                         ' TRN=' W-NSCC-TI-TRAN-TYPE                            
                         ' STA=' W-NSCC-STATUS                                  
                         ' PTR W-EDIT-DELIVERY-SW=Y'                            
               ELSE                                                             
DJ0003            MOVE 'Y' TO W-PTR-EDIT-DEL-SW                                 
DJ0003            ADD   1  TO W-PTR-EDIT-DEL-CNT                                
DJ0003            DISPLAY 'INP=' W-INFILE-CNT                                   
DJ0003                       ' ' W-NSCC-KEY-CLIENT-NBR                          
DJ0003                       ' ' W-NSCC-TI-ACAT-CTL-NBR                         
DJ0003                       ' ' W-NSCC-TI-TFR-TYPE                             
DJ0003                   ' TRN=' W-NSCC-TI-TRAN-TYPE                            
DJ0003                   ' STA=' W-NSCC-STATUS                                  
DJ0003                   ' PTR  W-PTR-EDIT-DEL-SW=Y'                            
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  W-NSCC-REC-SUBTYPE      = 'T'                                    
           AND (W-NSCC-TI-TRAN-TYPE    = 'A' OR 'C')                            
           AND W-NSCC-TI-TFR-TYPE      = 'PTD'                                  
           AND W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-RCV-NBR                      
               IF BH-ACAT-PART-TRANSFR-ASSET-EXC = '1'                          
                  MOVE 'Y' TO W-EDIT-RECEIVE-SW                                 
                  ADD   1  TO W-EDIT-RECEIVE-CNT                                
                  DISPLAY 'INP=' W-INFILE-CNT                                   
                             ' ' W-NSCC-KEY-CLIENT-NBR                          
                             ' ' W-NSCC-TI-ACAT-CTL-NBR                         
                             ' ' W-NSCC-TI-TFR-TYPE                             
                         ' TRN=' W-NSCC-TI-TRAN-TYPE                            
                         ' STA=' W-NSCC-STATUS                                  
                         ' PTD W-EDIT-RECEIVE-SW=Y'                             
               END-IF                                                           
           END-IF.                                                              
                                                                                
           PERFORM 5400-SELECT-VTRNFR       THRU 5400-EXIT                      
                                                                                
DJ0004***--SAVE THE RR-CODE BEFORE THE INIT TABLE IS DELETED                    
DJ0004     MOVE ' ' TO W-INIT-RR-CD                                             
DJ0004     IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-SUB-PART-NBR                 
DJ0004     AND W-NSCC-TI-TRAN-TYPE    = 'A'                                     
DJ0004         PERFORM 6110-GET-ACTITRF-RR-CD                                   
DJ0004     END-IF.                                                              
                                                                                
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-SUB-PART-NBR                 
           OR  W-NSCC-TI-TRAN-TYPE    = 'C'                                     
               PERFORM 5800-DELETE-INIT THRU 5800-EXIT                          
           END-IF.                                                              
                                                                                
SOC7       IF  W-NSCC-DAYS-IN-STATUS NOT NUMERIC                                
               MOVE ZEROS TO W-NSCC-DAYS-IN-STATUS                              
           END-IF.                                                              
                                                                                
           IF  W-NSCC-SYSTEM-ACTION  = '2'                                      
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-NSCC-KEY-CLIENT-NBR                             
                          ' ' W-NSCC-TI-ACAT-CTL-NBR                            
                          ' ' W-NSCC-TI-TFR-TYPE                                
                      ' TRN=' W-NSCC-TI-TRAN-TYPE                               
                      ' STA=' W-NSCC-STATUS                                     
                      ' ACT=' W-NSCC-SYSTEM-ACTION                              
                      ' REJ=' W-NSCC-SYSTEM-REJ-RSN                             
                      ' SYSTEM REJECTED'                                        
                      ' BYPASS ADD/UPDATE'                                      
           ELSE                                                                 
               IF  W-NSCC-TI-TRAN-TYPE   = 'A'                                  
               AND W-NSCC-DAYS-IN-STATUS < 002                                  
                   PERFORM 5100-MOVE-NSCC-TO-ACTIVE THRU 5100-EXIT              
                   PERFORM 5200-EDIT-INPUT          THRU 5200-EXIT              
                   PERFORM 5600-INSERT-ACTIVE       THRU 5600-EXIT              
                   IF W-REJECT-AUTO-SW = 'Y'                                    
                      PERFORM 5900-INSERT-ACTITRF   THRU 5900-EXIT              
                   END-IF                                                       
               ELSE                                                             
                   PERFORM 5100-MOVE-NSCC-TO-ACTIVE THRU 5100-EXIT              
                   PERFORM 5200-EDIT-INPUT          THRU 5200-EXIT              
                   PERFORM 5700-UPDATE-ACTIVE       THRU 5700-EXIT              
                   IF W-REJECT-AUTO-SW = 'Y'                                    
                      PERFORM 5900-INSERT-ACTITRF   THRU 5900-EXIT              
                   END-IF                                                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       4000-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  MOVE NSCC FIELDS TO ACTIVE TABLE,                                      
      *****************************************************************         
       5100-MOVE-NSCC-TO-ACTIVE.                                                
                                                                                
           MOVE W-NSCC-KEY-CLIENT-NBR                                           
                                     TO CLIENT-NBR         OF DCLVTRNFR         
***********MOVE W-NSCC-DIST-SIDE                                                
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR                      
               MOVE 'D'              TO DSTBN-SIDE-CD      OF DCLVTRNFR         
           ELSE                                                                 
               MOVE 'R'              TO DSTBN-SIDE-CD      OF DCLVTRNFR         
           END-IF                                                               
                                                                                
           MOVE W-NSCC-ACAT-CTL-NBR                                             
                                     TO ACAT-CONTROL-NBR   OF DCLVTRNFR         
                                                                                
           MOVE W-NSCC-PROC-YEAR     TO W-DATE-YEAR                             
           MOVE W-NSCC-PROC-MM       TO W-DATE-MM                               
           MOVE W-NSCC-PROC-DD       TO W-DATE-DD                               
           IF  (W-DATE-MM             > '12' OR                                 
                W-DATE-MM             < '01')                                   
           OR  (W-DATE-DD             > '31' OR                                 
                W-DATE-DD             < '01')                                   
           OR  (W-DATE-YEAR           < '0001')                                 
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-NSCC-KEY-CLIENT-NBR                             
                          ' ' W-NSCC-TI-ACAT-CTL-NBR                            
                          ' ' W-NSCC-TI-TFR-TYPE                                
                      ' TRN=' W-NSCC-TI-TRAN-TYPE                               
                      ' STA=' W-NSCC-STATUS                                     
                        ' W-NSCC-PROC-DATE INVALID: '                           
                                            W-NSCC-PROC-DATE                    
                        '  DEFAULT TO 0001-01-01'                               
                MOVE '00'                   TO W-DATE-CC                        
                MOVE '01'                   TO W-DATE-YY                        
                MOVE '01'                   TO W-DATE-MM                        
                MOVE '01'                   TO W-DATE-DD                        
           END-IF                                                               
                                                                                
           MOVE W-DATE               TO PRCS-DT            OF DCLVTRNFR         
                                                                                
           MOVE W-NSCC-CYCLE                                                    
                                     TO CYCLE-CD           OF DCLVTRNFR         
           MOVE W-NSCC-SYSTEM-ACTION                                            
                                     TO SYS-ACT-CD         OF DCLVTRNFR         
           MOVE W-NSCC-SYSTEM-REJ-RSN                                           
                                     TO SYS-RJCT-RSN-CD    OF DCLVTRNFR         
           IF   W-NSCC-STATUS = ' '                                             
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-NSCC-KEY-CLIENT-NBR                             
                          ' ' W-NSCC-TI-ACAT-CTL-NBR                            
                          ' ' W-NSCC-TI-TFR-TYPE                                
                      ' TRN=' W-NSCC-TI-TRAN-TYPE                               
                      ' STA=' W-NSCC-STATUS                                     
                      ' ACT=' W-NSCC-SYSTEM-ACTION                              
                      ' REJ=' W-NSCC-SYSTEM-REJ-RSN                             
                      ' W-NSCC-STATUS = BLANK'                                  
                      ' ORIGNAL = ' W-SAVE-STTS-CD                              
           ELSE                                                                 
                MOVE W-NSCC-STATUS   TO STTS-CD            OF DCLVTRNFR         
           END-IF                                                               
           MOVE W-NSCC-DAYS-IN-STATUS                                           
                                     TO DAYS-STTS-QTY      OF DCLVTRNFR         
           MOVE W-NSCC-TI-REC-TYPE-ST                                           
                                     TO RCRD-STTS-CD       OF DCLVTRNFR         
           MOVE W-NSCC-TI-REC-LEN-ST                                            
                                     TO RCRD-LNGTH-STTS-CD OF DCLVTRNFR         
           MOVE W-NSCC-TI-PHSCL-SEQ-ST                                          
                                     TO PHSCL-SEQ-STTS-CD  OF DCLVTRNFR         
           MOVE W-NSCC-TI-LGCL-SEQ-ST                                           
                                     TO LGCL-SEQ-NR-STS-CD OF DCLVTRNFR         
           MOVE W-NSCC-TI-TRAN-TYPE-ST                                          
                                     TO TRANS-TYPE-STTS-CD OF DCLVTRNFR         
           MOVE W-NSCC-TI-ACAT-CTL-ST                                           
                                     TO CONTROL-NBR-STS-CD OF DCLVTRNFR         
           MOVE W-NSCC-TI-TFR-TYPE-ST                                           
                                     TO TRNFR-TYPE-STTS-CD OF DCLVTRNFR         
           MOVE W-NSCC-TI-SUB-PART-ST                                           
                                     TO SBMT-PRT-NR-STS-CD OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-NBR-ST                                            
                                     TO RCV-NBR-STTS-CD    OF DCLVTRNFR         
           MOVE W-NSCC-TI-DEL-NBR-ST                                            
                                     TO DLVR-NBR-STTS-CD   OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-ACCT-NBR-ST                                       
                                     TO ACCT-RCV-STTS-CD   OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-CUST-NAME-ST                                      
                                     TO RCV-CUST-NM-STS-CD OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-SSN-PR-ST                                         
                                     TO RCV-SS-PRIM-STS-CD OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-SSN-SE-ST                                         
                                     TO RCV-SS-SCDY-STS-CD OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-ACCT-TYPE-ST                                      
                                     TO RCV-ACT-TYP-STS-CD OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-OCC-ST                                            
                                     TO RCV-OCC-STTS-CD    OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-CRSPN-ST                                          
                                     TO RCV-CRSPN-STTS-CD  OF DCLVTRNFR         
           MOVE W-NSCC-TI-DEL-ACCT-NBR-ST                                       
                                     TO ACCT-DLVR-STTS-CD  OF DCLVTRNFR         
           MOVE W-NSCC-TI-TFR-TYPE-REJ-ST                                       
                                     TO TRN-TYP-RJC-STS-CD OF DCLVTRNFR         
           MOVE W-NSCC-TI-ASSC-CTL-NBR-ST                                       
                                     TO CNTL-ASTD-STTS-CD  OF DCLVTRNFR         
           MOVE W-NSCC-TI-ASSC-STL-DT-ST                                        
                                     TO STTLM-ASCTD-STS-CD OF DCLVTRNFR         
           MOVE W-NSCC-TI-TRAN-REF-ID-ST                                        
                                     TO TRANS-RFRN-STTS-CD OF DCLVTRNFR         
           MOVE W-NSCC-TI-COMMENTS-ST                                           
                                     TO CMNT-STTS-CD       OF DCLVTRNFR         
           MOVE W-NSCC-TI-PHSCL-SEQ-NBR                                         
                                     TO PHSCL-SEQ-NBR      OF DCLVTRNFR         
           MOVE W-NSCC-TI-LGCL-SEQ-NBR                                          
                                     TO LGCL-SEQ-NBR       OF DCLVTRNFR         
           MOVE W-NSCC-TI-TRAN-TYPE                                             
                                     TO TRANS-TYPE-CD      OF DCLVTRNFR         
           MOVE W-NSCC-TI-TFR-TYPE                                              
                                     TO TRNFR-TYPE-CD      OF DCLVTRNFR         
           MOVE W-NSCC-TI-SUB-PART-NBR                                          
                                     TO SBMTG-PRTCP-NBR    OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-NBR                                               
                                     TO RCV-NBR            OF DCLVTRNFR         
           MOVE W-NSCC-TI-DEL-NBR                                               
                                     TO DLVR-NBR           OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-ACCT-NBR                                          
                                     TO ACCT-RCV-NBR       OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-CUS-NAME                                          
                                     TO RCV-CUST-NM        OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-SSN-PRM                                           
                                     TO RCV-SS-PRIM-NBR    OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-SSN-SEC                                           
                                     TO RCV-SS-SCNDY-NBR   OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-ACCT-TYPE                                         
                                     TO RCV-ACCT-TYPE-CD   OF DCLVTRNFR         
DJ0009     MOVE W-NSCC-TI-GIFT-IND                                              
DJ0009                               TO GIFT-IND           OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-OCC-BRKR                                          
                                     TO RCV-OCC-BRKR-NBR   OF DCLVTRNFR         
           MOVE W-NSCC-TI-RCV-CRSPN-NBR                                         
                                     TO RCV-CRSPN-NBR      OF DCLVTRNFR         
           MOVE W-NSCC-TI-CONTRA-PART-TYPE                                      
                                     TO PRTCP-CONTRA-CD    OF DCLVTRNFR         
LRM025     MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO W-SAVE-ACCT-DLVR-NBR              
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
                          ' ' W-NSCC-KEY-CLIENT-NBR                             
                          ' ' W-NSCC-TI-ACAT-CTL-NBR                            
                          ' ' W-NSCC-TI-TFR-TYPE                                
                      ' TRN=' W-NSCC-TI-TRAN-TYPE                               
                      ' STA=' W-NSCC-STATUS                                     
                        ' W-NSCC-TI-ASSC-STL-DT INVALID: '                      
                                            W-NSCC-TI-ASSC-STL-DT               
                        '  DEFAULT TO 0001-01-01'                               
                MOVE '0001'                  TO W-DATE-YEAR                     
                MOVE '01'                    TO W-DATE-MM                       
                MOVE '01'                    TO W-DATE-DD                       
           END-IF                                                               
           MOVE W-DATE               TO STTLM-ASCTD-DT     OF DCLVTRNFR         
                                                                                
           MOVE W-NSCC-TI-TRAN-REF-ID                                           
                                     TO TRANS-RFRN-ID-CD   OF DCLVTRNFR         
                                                                                
           IF  W-NSCC-TI-COMMENTS = 'INITIAL CONVERSION'                        
               MOVE ' '              TO CMNT-TXT           OF DCLVTRNFR         
           ELSE                                                                 
               MOVE W-NSCC-TI-COMMENTS                                          
                                     TO CMNT-TXT           OF DCLVTRNFR         
           END-IF.                                                              
                                                                                
       5100-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  MOVE FIELDS FROM NSCC FILE TO ACTIVE-TABLE                             
      *  LOOK UP NON NSCC FIELDS                                                
      *****************************************************************         
       5200-EDIT-INPUT.                                                         
           MOVE '5200-EDIT-INPUT            ' TO W-ROUTINE-1.                   
                                                                                
           MOVE W-PGM-NAME           TO PRGM-NM            OF DCLVTRNFR         
           MOVE ' '                  TO CICS-TERM-ID-CD    OF DCLVTRNFR         
           MOVE W-CURRENT-TIMESTAMP  TO UPDT-TMSTP         OF DCLVTRNFR         
                                                                                
           IF  W-NSCC-DIST-PARTICIPANT   = W-NSCC-TI-RCV-NBR                    
               MOVE W-NSCC-TI-RCV-ACCT-NBR(1:3) TO W-BRANCH-CD                  
               MOVE W-NSCC-TI-RCV-ACCT-NBR(4:5) TO W-ACCT-CD                    
           ELSE                                                                 
               MOVE W-NSCC-TI-DEL-ACCT-NBR(1:3) TO W-BRANCH-CD                  
               MOVE W-NSCC-TI-DEL-ACCT-NBR(4:5) TO W-ACCT-CD                    
           END-IF                                                               
                                                                                
           MOVE W-BRANCH-CD          TO BRANCH-CD          OF DCLVTRNFR         
           MOVE W-ACCT-CD            TO ACCT-CD            OF DCLVTRNFR         
                                                                                
DJ0008     IF  BH-REQ-ACCT-FREEZE-PROC = '1'                                    
DJ0008         PERFORM 6120-CHECK-ACCT-FREEZE THRU 6120-EXIT                    
DJ0008     END-IF                                                               
                                                                                
           IF  W-NSCC-TI-TRAN-TYPE = 'R'                                        
           AND (W-NSCC-DIST-PARTICIPANT  = W-NSCC-TI-SUB-PART-NBR)              
               GO TO 5200-EXIT                                                  
           END-IF                                                               
                                                                                
           IF (W-NSCC-REC-SUBTYPE      = 'T'               AND                  
               W-NSCC-TI-TRAN-TYPE     = 'C'               AND                  
               W-NSCC-TI-TFR-TYPE      = 'FUL'             AND                  
               W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR AND                  
               W-NSCC-TI-DEL-ACCT-NBR-ST = '1')                                 
               DISPLAY 'INP=' W-INFILE-CNT                                      
                              ' ' W-NSCC-KEY-CLIENT-NBR                         
                              ' ' W-NSCC-TI-ACAT-CTL-NBR                        
                              ' ' W-NSCC-TI-TFR-TYPE                            
                          ' TRN=' W-NSCC-TI-TRAN-TYPE                           
                          ' STA=' W-NSCC-STATUS                                 
                                ' DELIVER ACCT CHANGED'                         
                          ' ACC=' W-NSCC-TI-DEL-ACCT-NBR                        
                   PERFORM 5201-EDIT-CHG THRU 5201-EXIT                         
           ELSE                                                                 
                                                                                
               IF  W-NSCC-REQ-ADJ                                               
               AND W-NSCC-TI-TRAN-TYPE   = 'C'                                  
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                              ' ' W-NSCC-KEY-CLIENT-NBR                         
                              ' ' W-NSCC-TI-ACAT-CTL-NBR                        
                              ' ' W-NSCC-TI-TFR-TYPE                            
                          ' TRN=' W-NSCC-TI-TRAN-TYPE                           
                          ' STA=' W-NSCC-STATUS                                 
                                ' REQ-ADJ RESET INDICATORS'                     
                   PERFORM 5201-EDIT-CHG THRU 5201-EXIT                         
               END-IF                                                           
           END-IF                                                               
                                                                                
           IF (W-EDIT-RECEIVE-SW  = 'Y'                                         
               AND BH-ACAT-REJ-PEND-REC-CMT-IND = '1')                          
            IF W-NSCC-TI-COMMENTS > ' '                                         
               MOVE 'Y' TO W-REJ-CMT                                            
               ADD   1  TO W-REJ-CMT-CNT                                        
               MOVE 'Y'              TO CMNT-STTS-CD       OF DCLVTRNFR         
               IF  BH-ACAT-REJ-PEND-REC-CMT-CODE > '00'                         
DJ0010                     DISPLAY 'INP=' W-INFILE-CNT                          
DJ0010                                ' ' W-NSCC-KEY-CLIENT-NBR                 
DJ0010                                ' ' W-NSCC-TI-ACAT-CTL-NBR                
DJ0010                   ' W-REJ-CMT FLAGGED TO BE REJECTED'                    
                   MOVE 'Y' TO W-REJECT-AUTO-SW                                 
               END-IF                                                           
            END-IF                                                              
           END-IF.                                                              
                                                                                
DJ0005***SET COMMENT INDICATOR FOR ANY PARTIAL                                  
DJ0005     IF  (BH-ACAT-REJ-PEND-REC-CMT-IND = '1')                             
DJ0005     AND (W-NSCC-TI-TFR-TYPE = 'PTR' OR 'PTD')                            
DJ0005      IF W-NSCC-TI-COMMENTS > ' '                                         
DJ0005         MOVE 'Y' TO W-REJ-CMT                                            
DJ0005         ADD   1  TO W-REJ-CMT-CNT                                        
DJ0005         MOVE 'Y'              TO CMNT-STTS-CD       OF DCLVTRNFR         
DJ0005      END-IF                                                              
DJ0005     END-IF.                                                              
                                                                                
           PERFORM 5210-TIFLESS-BROKER-EDIT THRU 5210-EXIT.                     
                                                                                
           PERFORM 5220-CHECK-ALERT-TABLE   THRU 5220-EXIT.                     
                                                                                
           IF  (W-EDIT-DELIVERY-SW = 'Y'                                        
                AND BH-ACAT-REJ-PEND-DEL-SP-IND = '1')                          
               PERFORM 5230-CHECK-SPECIAL-ACCOUNTS THRU 5230-EXIT               
LRM021         IF W-SPECIAL-ACCOUNTS-SW NOT = 'Y'                               
LRM021         AND BH-AT3-ACTIVE                                                
LRM021         AND BH-AT3-SP-DEL-ADDL-ACCTS-NO  > 0                             
LRM021            PERFORM 5240-CHECK-SPECIAL-ACCT-BR-RNG THRU 5240-EXIT         
           END-IF.                                                              
                                                                                
LRM012     MOVE SPACES TO W-CONV-ACCT.                                          
LRM012     IF W-NSCC-KEY-CLIENT-NBR(2:3) = '006'                                
LRM012     AND W-NSCC-TI-TRAN-TYPE = 'A'                                        
LRM013         IF (W-NSCC-TI-TFR-TYPE = 'FUL' OR 'PTR')                         
LRM012         AND DSTBN-SIDE-CD OF DCLVTRNFR = 'D'                             
LRM012         AND ACCT-DLVR-NBR OF DCLVTRNFR (1:1) = '1'                       
LRM012              MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO W-CONV-ACCT              
LRM012              PERFORM 5250-FIND-CONVERSION-ACCT-RTN                       
LRM012                 THRU 5250-EXIT                                           
LRM012         ELSE                                                             
LRM013         IF (W-NSCC-TI-TFR-TYPE = 'RCR'                                   
LRM013             OR 'PTD' OR 'RCL' OR 'MFC' OR 'FRV')                         
LRM012         AND DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                             
LRM012         AND ACCT-RCV-NBR OF DCLVTRNFR (1:1) = '1'                        
LRM012              MOVE ACCT-RCV-NBR OF DCLVTRNFR TO W-CONV-ACCT               
LRM012              PERFORM 5250-FIND-CONVERSION-ACCT-RTN                       
LRM012                 THRU 5250-EXIT                                           
LRM012         END-IF END-IF                                                    
LRM012     END-IF.                                                              
                                                                                
LRM023     IF W-NSCC-KEY-CLIENT-NBR(2:3) = '313'                                
LRM023     AND W-NSCC-TI-TRAN-TYPE = 'A'                                        
LRM023         IF (W-NSCC-TI-TFR-TYPE = 'FUL' OR 'PTR')                         
LRM023         AND DSTBN-SIDE-CD OF DCLVTRNFR = 'D'                             
LRM023         AND ACCT-DLVR-NBR OF DCLVTRNFR (1:1) = '1'                       
LRM023              MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO W-CONV-ACCT              
LRM023              PERFORM 5250-FIND-CONVERSION-ACCT-RTN                       
LRM023                 THRU 5250-EXIT                                           
LRM023         ELSE                                                             
LRM023         IF (W-NSCC-TI-TFR-TYPE = 'RCR'                                   
LRM023             OR 'PTD' OR 'RCL' OR 'MFC' OR 'FRV')                         
LRM023         AND DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                             
LRM023              MOVE ACCT-RCV-NBR OF DCLVTRNFR TO W-CONV-ACCT               
LRM023              PERFORM 5250-FIND-CONVERSION-ACCT-RTN                       
LRM023                 THRU 5250-EXIT                                           
LRM023         END-IF END-IF                                                    
LRM023     END-IF.                                                              
                                                                                
LRM016     IF W-NSCC-KEY-CLIENT-NBR(2:3) = '010'                                
LRM016     AND (W-NSCC-TI-TRAN-TYPE = 'A' OR 'C')                               
LRM016         IF ((W-NSCC-TI-TFR-TYPE = 'FUL' OR 'PTR')                        
LRM016         AND DSTBN-SIDE-CD OF DCLVTRNFR = 'D')                            
LRM016              MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO W-CONV-ACCT              
LRM016              PERFORM 5260-FIND-CONVERSION-ACCT-RTN                       
LRM016                 THRU 5260-EXIT                                           
LRM016         ELSE                                                             
LRM016         IF ((W-NSCC-TI-TFR-TYPE = 'RCL' OR 'FRV')                        
LRM016         AND DSTBN-SIDE-CD OF DCLVTRNFR = 'R')                            
LRM016              MOVE ACCT-RCV-NBR OF DCLVTRNFR TO W-CONV-ACCT               
LRM016              PERFORM 5260-FIND-CONVERSION-ACCT-RTN                       
LRM016                 THRU 5260-EXIT                                           
LRM016         END-IF END-IF                                                    
LRM016     END-IF.                                                              
                                                                                
           PERFORM 6100-GETNA THRU 6100-EXIT                                    
                                                                                
           IF  W-EDIT-DELIVERY-SW  = 'Y'                                        
               PERFORM 5300-FULL-DELIVERY-EDIT THRU 5300-EXIT                   
           ELSE                                                                 
               IF  W-PTR-EDIT-DEL-SW  = 'Y'                                     
                   PERFORM 5301-PTR-EDIT-DELIVERY THRU 5301-EXIT                
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5200-EXIT. EXIT.                                                         
      *****************************************************************         
      /                                                                         
      *****************************************************************         
       5201-EDIT-CHG.                                                           
                                                                                
           IF  DSTBN-SIDE-CD OF DCLVTRNFR = 'R'                                 
               MOVE ACCT-RCV-NBR  OF DCLVTRNFR TO W-OLD-ACCOUNT                 
               MOVE W-NSCC-TI-RCV-ACCT-NBR     TO W-NEW-ACCOUNT                 
           ELSE                                                                 
               MOVE ACCT-DLVR-NBR OF DCLVTRNFR TO W-OLD-ACCOUNT                 
               MOVE W-NSCC-TI-DEL-ACCT-NBR     TO W-NEW-ACCOUNT                 
           END-IF                                                               
                                                                                
           IF  W-OLD-ACCOUNT NOT = W-NEW-ACCOUNT                                
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-NSCC-KEY-CLIENT-NBR                             
                          ' ' W-NSCC-TI-ACAT-CTL-NBR                            
                          ' ' W-NSCC-TI-TFR-TYPE                                
                      ' TRN=' W-NSCC-TI-TRAN-TYPE                               
                      ' STA=' W-NSCC-STATUS                                     
                       ' ACCT-CHG NEW=' W-NEW-ACCOUNT                           
                                ' OLD=' W-OLD-ACCOUNT                           
           END-IF.                                                              
           MOVE ' '              TO ACCT-DB-BAL-T1-IND OF DCLVTRNFR             
           MOVE ' '              TO ACCT-MRGN-DB-IND   OF DCLVTRNFR             
           MOVE ' '              TO ACCT-SHRT-PSTN-IND OF DCLVTRNFR             
           MOVE ' '              TO ACCT-SEC-RSTRD-IND OF DCLVTRNFR             
           MOVE ' '              TO ACCT-AST-EXCS-IND  OF DCLVTRNFR             
           MOVE ' '              TO ACCT-OPTN-PSTN-IND OF DCLVTRNFR             
           MOVE ' '              TO ACCT-LTD-PRTNR-IND OF DCLVTRNFR             
           MOVE ' '              TO ACCT-TIN-MSMTH-IND OF DCLVTRNFR             
           MOVE ' '              TO ACCT-DPLCT-TRN-IND OF DCLVTRNFR             
           MOVE ' '              TO ACCT-CUST-70-IND   OF DCLVTRNFR             
           MOVE ' '              TO ACCT-QULFD-PLN-IND OF DCLVTRNFR             
           MOVE ' '              TO ACCT-MNGD-IND      OF DCLVTRNFR             
           MOVE ' '              TO ACCT-PRVT-RNG-IND  OF DCLVTRNFR             
           MOVE ' '              TO ACCT-BRKR-TIF-IND  OF DCLVTRNFR             
           MOVE ' '              TO NSCC-NON-ADP-IND   OF DCLVTRNFR             
           MOVE ' '              TO CMNT-STTS-CD       OF DCLVTRNFR             
           MOVE ' '              TO ACM-HOLDER-NAA-CD  OF DCLVTRNFR             
           MOVE ' '              TO CASH-SWEEP-NAA-CD  OF DCLVTRNFR             
           MOVE ' '              TO SELL-INSTN-NAA-CD  OF DCLVTRNFR             
           MOVE ' '              TO DVDND-NAA-CD       OF DCLVTRNFR             
           MOVE ' '              TO RR-CD              OF DCLVTRNFR             
LRM005     MOVE ' '              TO ACCT-RB-SEC-IND    OF DCLVTRNFR             
LRM005     MOVE ' '              TO ACCT-CLT-RSCND-IND OF DCLVTRNFR             
LRM005     MOVE ' '              TO ACCT-LGL-BLK-IND   OF DCLVTRNFR             
DJ0009     MOVE ' '              TO FRV-MFC-CMPLT-IND  OF DCLVTRNFR             
DJ0009     MOVE ' '              TO RSTR-TRD-90-DY-IND OF DCLVTRNFR             
DJ0009     MOVE ' '              TO REG-T-IND          OF DCLVTRNFR             
DJ0009     MOVE ' '              TO ADOPT-AGRMT-IND    OF DCLVTRNFR             
DJ0009     MOVE ' '              TO RR-ORGNL-CD        OF DCLVTRNFR             
           MOVE 0                TO ACCT-EQUITY-AMT    OF DCLVTRNFR             
           MOVE 0                TO ACCT-IRA-MAINT-AMT OF DCLVTRNFR             
           MOVE 0                TO ACCT-IRA-TRMNT-AMT OF DCLVTRNFR             
           MOVE 0                TO ACCT-TRNFR-FEE-AMT OF DCLVTRNFR.            
           MOVE ' '              TO ALERT-IND          OF DCLVTRNFR.            
                                                                                
       5201-EXIT. EXIT.                                                         
      *****************************************************************         
      /                                                                         
       5210-TIFLESS-BROKER-EDIT.                                                
           MOVE '5210-TIFLESS-BROKER-EDIT      ' TO W-ROUTINE-1.                
                                                                                
           MOVE 'N' TO W-TIFLESS-SW.                                            
           IF  BH-ACAT-TIFLESS-BROKER-NUM-NO   = 0                              
               GO TO 5210-EXIT                                                  
           END-IF.                                                              
           MOVE 1 TO W-SUB1.                                                    
                                                                                
       5210-LOOP.                                                               
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR                      
           AND BH-ACAT-TIFLESS-BROKER-NUM (W-SUB1) =  W-NSCC-TI-RCV-NBR         
               MOVE 'Y' TO W-TIFLESS-SW                                         
               MOVE 'Y'               TO ACCT-BRKR-TIF-IND OF DCLVTRNFR         
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-NSCC-KEY-CLIENT-NBR                             
                          ' ' W-NSCC-TI-ACAT-CTL-NBR                            
                          ' ' W-NSCC-TI-TFR-TYPE                                
                      ' TRN=' W-NSCC-TI-TRAN-TYPE                               
                      ' STA=' W-NSCC-STATUS                                     
                      ' TIFLESS-BROKER FND RCV=' W-NSCC-TI-RCV-NBR              
               GO TO 5210-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-RCV-NBR                      
           AND BH-ACAT-TIFLESS-BROKER-NUM (W-SUB1) =  W-NSCC-TI-DEL-NBR         
               MOVE 'Y' TO W-TIFLESS-SW                                         
               MOVE 'Y'               TO ACCT-BRKR-TIF-IND OF DCLVTRNFR         
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-NSCC-KEY-CLIENT-NBR                             
                          ' ' W-NSCC-TI-ACAT-CTL-NBR                            
                          ' ' W-NSCC-TI-TFR-TYPE                                
                      ' TRN=' W-NSCC-TI-TRAN-TYPE                               
                      ' STA=' W-NSCC-STATUS                                     
                       ' TIFLESS-BROKER FND DEL=' W-NSCC-TI-RCV-NBR             
               GO TO 5210-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  W-SUB1 < BH-ACAT-TIFLESS-BROKER-NUM-NO                           
               ADD 1 TO W-SUB1                                                  
               GO TO 5210-LOOP                                                  
           END-IF.                                                              
                                                                                
       5210-EXIT. EXIT.                                                         
      /                                                                         
       5220-CHECK-ALERT-TABLE.                                                  
           MOVE '5220-CHECK-ALERT-TABLE           ' TO W-ROUTINE-1.             
                                                                                
           MOVE ' '                TO DCLVALERT                                 
                                                                                
           MOVE ' '                TO W-VALERT-FND-SW                           
           EXEC SQL SELECT                                                      
                        CLIENT_NBR                                              
                       ,BRANCH_CD                                               
                       ,ACCT_CD                                                 
                       ,ACCT_MSG_TXT                                            
                       ,RR_CD                                                   
                       ,CRT_TMSTP                                               
                       ,UPDT_TMSTP                                              
                       ,CICS_TERM_ID_CD                                         
                       ,PRGM_NM                                                 
                   INTO                                                         
                        :DCLVALERT.CLIENT-NBR                                   
                       ,:DCLVALERT.BRANCH-CD                                    
                       ,:DCLVALERT.ACCT-CD                                      
                       ,:DCLVALERT.ACCT-MSG-TXT                                 
                       ,:DCLVALERT.RR-CD                                        
                       ,:DCLVALERT.CRT-TMSTP                                    
                       ,:DCLVALERT.UPDT-TMSTP                                   
                       ,:DCLVALERT.CICS-TERM-ID-CD                              
                       ,:DCLVALERT.PRGM-NM                                      
                   FROM VALERT                                                  
               WHERE CLIENT_NBR       = :W-NSCC-KEY-CLIENT-NBR                  
                 AND BRANCH_CD        = :W-BRANCH-CD                            
                 AND ACCT_CD          = :W-ACCT-CD                              
           END-EXEC                                                             
                                                                                
           IF  SQLCODE  =  +0                                                   
                   ADD 1 TO W-VALERT-FND-CNT                                    
                   MOVE 'Y'          TO W-VALERT-FND-SW                         
                   MOVE 'Y'          TO ALERT-IND          OF DCLVTRNFR         
           ELSE                                                                 
                   ADD 1 TO W-VALERT-NOTFND-CNT                                 
                   MOVE 'N'          TO W-VALERT-FND-SW                         
                   MOVE 'N'          TO ALERT-IND          OF DCLVTRNFR         
           END-IF.                                                              
                                                                                
       5220-EXIT. EXIT.                                                         
      /                                                                         
       5230-CHECK-SPECIAL-ACCOUNTS.                                             
      ***BH-ACAT-REJ-PEND-DEL-SP-IND = '1'                                      
      ***BH-ACAT-SPECIAL-ACCOUNTS-NO > 0                                        
           MOVE '5230-CHECK-SPECIAL-ACCOUNTS ' TO W-ROUTINE-1.                  
                                                                                
           IF  BH-ACAT-SPECIAL-ACCOUNTS-NO = 0                                  
               GO TO 5230-EXIT.                                                 
                                                                                
           MOVE 'N' TO W-SPECIAL-ACCOUNTS-SW.                                   
           MOVE 1 TO W-SUB1.                                                    
       5230-LOOP.                                                               
           IF  W-BRN-ACCT >= BH-ACAT-SPECIAL-ACCOUNTS-LO (W-SUB1) AND           
               W-BRN-ACCT <= BH-ACAT-SPECIAL-ACCOUNTS-HI (W-SUB1)               
               MOVE 'Y' TO W-SPECIAL-ACCOUNTS-SW                                
               ADD 1    TO W-SPECIAL-ACCT-FND-CNT                               
                           DISPLAY 'INP=' W-INFILE-CNT                          
                                      ' ' W-NSCC-KEY-CLIENT-NBR                 
                                      ' ' W-NSCC-TI-ACAT-CTL-NBR                
                                      ' ' W-NSCC-TI-TFR-TYPE                    
                                  ' TRN=' W-NSCC-TI-TRAN-TYPE                   
                      ' ' W-BRN-ACCT                                            
                      ' SPECIAL ACCOUNT'                                        
                     ' LO= ' BH-ACAT-SPECIAL-ACCOUNTS-LO (W-SUB1)               
                     ' HI= ' BH-ACAT-SPECIAL-ACCOUNTS-HI (W-SUB1)               
           ELSE                                                                 
               IF  W-SUB1 < BH-ACAT-SPECIAL-ACCOUNTS-NO                         
                   ADD 1 TO W-SUB1                                              
               GO TO 5230-LOOP                                                  
           END-IF.                                                              
                                                                                
           IF  W-SPECIAL-ACCOUNTS-SW   = 'Y'                                    
               CONTINUE                                                         
           ELSE                                                                 
               GO TO 5230-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  W-EDIT-DELIVERY-SW      = 'Y'                                    
             IF  BH-ACAT-REJ-PEND-DEL-SP-IND  = '1'                             
               IF  W-SPECIAL-ACCOUNTS-SW   = 'Y'                                
                   MOVE 'SP'        TO TRNFR-TYPE-RJC1-CD OF DCLVTRNFR          
                   MOVE 'Y' TO W-REJ-SP                                         
                   IF  BH-ACAT-REJ-PEND-DEL-SP-CODE  > '00'                     
DJ0010                     DISPLAY 'INP=' W-INFILE-CNT                          
DJ0010                                ' ' W-NSCC-KEY-CLIENT-NBR                 
DJ0010                                ' ' W-NSCC-TI-ACAT-CTL-NBR                
DJ0010                       ' W-REJ-SP FLAGGED TO BE REJECTED'                 
                       MOVE 'Y' TO W-REJECT-AUTO-SW                             
                   END-IF                                                       
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
       5230-EXIT. EXIT.                                                         
                                                                                
LRM021 5240-CHECK-SPECIAL-ACCT-BR-RNG.                                          
LRM021***BH-ACAT-REJ-PEND-DEL-SP-IND = '1'                                      
LRM021***BH-AT3-SP-DEL-ADDL-ACCTS-NO > 0                                        
LRM021     MOVE '5240-CHECK-SPECIAL-ACCT-BR-RNG' TO W-ROUTINE-1.                
LRM021                                                                          
LRM021     IF  BH-AT3-SP-DEL-ADDL-ACCTS-NO = 0                                  
LRM021         GO TO 5240-EXIT.                                                 
LRM021                                                                          
LRM021     MOVE 1 TO W-SUB1.                                                    
LRM021 5240-LOOP.                                                               
LRM021     IF  W-BRANCH-CD >=  BH-AT3-SP-DEL-ADDL-ACCTS-BR-LO (W-SUB1)          
LRM021     AND W-BRANCH-CD <=  BH-AT3-SP-DEL-ADDL-ACCTS-BR-HI (W-SUB1)          
LRM021     AND W-ACCT-CD >=  BH-AT3-SP-DEL-ADDL-ACCTS-AC-LO (W-SUB1)            
LRM021     AND W-ACCT-CD <=  BH-AT3-SP-DEL-ADDL-ACCTS-AC-HI (W-SUB1)            
LRM021         MOVE 'Y' TO W-SPECIAL-ACCOUNTS-SW                                
LRM021         ADD 1    TO W-SPECIAL-ACCT-FND-CNT                               
LRM021                     DISPLAY 'INP=' W-INFILE-CNT                          
LRM021                                ' ' W-NSCC-KEY-CLIENT-NBR                 
LRM021                                ' ' W-NSCC-TI-ACAT-CTL-NBR                
LRM021                                ' ' W-NSCC-TI-TFR-TYPE                    
LRM021                            ' TRN=' W-NSCC-TI-TRAN-TYPE                   
LRM021                ' ' W-BRN-ACCT                                            
LRM021                ' SPECIAL ACCOUNT ON B1 434914 # ' W-SUB1                 
LRM021     ELSE                                                                 
LRM021         IF  W-SUB1 < BH-AT3-SP-DEL-ADDL-ACCTS-NO                         
LRM021             ADD 1 TO W-SUB1                                              
LRM021         GO TO 5240-LOOP                                                  
LRM021     END-IF.                                                              
LRM021                                                                          
LRM021     IF  W-SPECIAL-ACCOUNTS-SW   = 'Y'                                    
LRM021         CONTINUE                                                         
LRM021     ELSE                                                                 
LRM021         GO TO 5240-EXIT                                                  
LRM021     END-IF.                                                              
LRM021                                                                          
LRM021     IF  W-EDIT-DELIVERY-SW      = 'Y'                                    
LRM021       IF  BH-ACAT-REJ-PEND-DEL-SP-IND  = '1'                             
LRM021         IF  W-SPECIAL-ACCOUNTS-SW   = 'Y'                                
LRM021             MOVE 'SP'        TO TRNFR-TYPE-RJC1-CD OF DCLVTRNFR          
LRM021             MOVE 'Y' TO W-REJ-SP                                         
LRM021             IF  BH-ACAT-REJ-PEND-DEL-SP-CODE  > '00'                     
LRM021                     DISPLAY 'INP=' W-INFILE-CNT                          
LRM021                                ' ' W-NSCC-KEY-CLIENT-NBR                 
LRM021                                ' ' W-NSCC-TI-ACAT-CTL-NBR                
LRM021                       ' W-REJ-SP FLAGGED TO BE REJECTED'                 
LRM021                 MOVE 'Y' TO W-REJECT-AUTO-SW                             
LRM021             END-IF                                                       
LRM021         END-IF                                                           
LRM021       END-IF                                                             
LRM021     END-IF.                                                              
LRM021                                                                          
LRM021 5240-EXIT. EXIT.                                                         
      /                                                                         
LRM012 5250-FIND-CONVERSION-ACCT-RTN.                                           
LRM023     IF W-CONV-ACCT(1:3) NOT NUMERIC                                      
LRM023        DISPLAY 'CLIENT CONVERSION BRANCH ALPHA ' W-CONV-ACCT             
LRM023                ' ' W-NSCC-TI-TFR-TYPE ' BYPASS CONV'                     
LRM023        MOVE SPACES TO W-CONV-ACCT                                        
LRM023        GO TO 5250-EXIT                                                   
LRM023     END-IF.                                                              
                                                                                
LRM012     MOVE SPACES TO FD-AUX23-XREF-KEY.                                    
LRM023     MOVE W-CONV-ACCT(1:3) TO FD-AUX23-XREF-KEY(2:4)                      
LRM023     MOVE W-CONV-ACCT(4:5) TO FD-AUX23-XREF-KEY(8:7)                      
LRM012     READ AUXFILE.                                                        
LRM012     ADD 1 TO W-AUXFILE-CNT.                                              
LRM012     IF NOT AUXFILE-FOUND                                                 
LRM012     AND W-NSCC-TI-TFR-TYPE = 'RCR'                                       
LRM023        DISPLAY  W-NSCC-KEY-CLIENT-NBR                                    
LRM023             ' ' W-NSCC-TI-ACAT-CTL-NBR                                   
LRM012         ' CONVERISION SUSPENSE ACCT USED '                               
LRM012           W-CONV-ACCT ' TO ' W-CONV-SUSPENSE-ACCT                        
LRM012        MOVE W-CONV-SUSPENSE-ACCT TO W-BRN-ACCT                           
LRM012                                    ACCT-RCV-NBR OF DCLVTRNFR             
LRM012        MOVE W-BRANCH-CD         TO BRANCH-CD OF DCLVTRNFR                
LRM012        MOVE W-ACCT-CD           TO ACCT-CD OF DCLVTRNFR                  
LRM012        MOVE W-CONV-ACCT TO CVRSN-ACCT-NBR OF DCLVTRNFR                   
LRM012        IF  BH-REQ-ACCT-FREEZE-PROC = '1'                                 
LRM012            PERFORM 6120-CHECK-ACCT-FREEZE THRU 6120-EXIT                 
LRM012        END-IF                                                            
LRM012     ELSE                                                                 
LRM012     IF AUXFILE-FOUND                                                     
LRM012        MOVE FD-AUX23-ADP-BRANCH  TO W-BRANCH-CD                          
LRM012                                     BRANCH-CD OF DCLVTRNFR               
LRM012        MOVE FD-AUX23-ADP-ACCOUNT TO W-ACCT-CD                            
LRM012                                     ACCT-CD OF DCLVTRNFR                 
LRM013******* IF W-NSCC-TI-TFR-TYPE = 'FUL'                                     
LRM013        IF DSTBN-SIDE-CD OF DCLVTRNFR = 'D'                               
LRM012           MOVE W-BRN-ACCT TO ACCT-DLVR-NBR OF DCLVTRNFR                  
LRM012        ELSE                                                              
LRM012           MOVE W-BRN-ACCT TO ACCT-RCV-NBR OF DCLVTRNFR                   
LRM012        END-IF                                                            
LRM012        MOVE W-CONV-ACCT TO CVRSN-ACCT-NBR OF DCLVTRNFR                   
LRM023        DISPLAY  W-NSCC-KEY-CLIENT-NBR                                    
LRM023               ' CONV ACCT FOUND - CHANGE '                               
LRM012           W-CONV-ACCT ' TO ' W-BRANCH-CD ' ' W-ACCT-CD                   
LRM012           ' ' W-NSCC-TI-TFR-TYPE ' ' W-NSCC-ACAT-CTL-NBR                 
LRM012        IF  BH-REQ-ACCT-FREEZE-PROC = '1'                                 
LRM012            PERFORM 6120-CHECK-ACCT-FREEZE THRU 6120-EXIT                 
LRM012        END-IF                                                            
LRM012     ELSE                                                                 
LRM023        DISPLAY ' CONV ACCT NOTFND ' W-CONV-ACCT                          
LRM012             ' STUTUS ' AUXFILE-STAT ' ' W-NSCC-TI-TFR-TYPE               
LRM013             ' ' W-NSCC-ACAT-CTL-NBR                                      
LRM013        MOVE 'NOTFND' TO W-CONV-ACCT                                      
LRM012     END-IF.                                                              
LRM012 5250-EXIT. EXIT.                                                         
      /                                                                         
LRM016 5260-FIND-CONVERSION-ACCT-RTN.                                           
      * FIRST ASSURE THIS IS A 8 DIGIT ACCOUNT NUMBER.                          
LRM016     IF W-CONV-ACCT(6:1) NOT > ' '                                        
LRM016     OR W-CONV-ACCT(7:1) NOT > ' '                                        
LRM016     OR W-CONV-ACCT(8:1) NOT > ' '                                        
LRM016        DISPLAY 'CLIENT CONVERSION ACCT NOT 8 BYTES ' W-CONV-ACCT         
LRM016                ' ' W-NSCC-TI-TFR-TYPE                                    
LRM016        MOVE SPACES TO W-CONV-ACCT                                        
LRM016        GO TO 5260-EXIT                                                   
LRM016     END-IF.                                                              
                                                                                
LRM016     MOVE SPACES TO FD-AUX23-XREF-KEY.                                    
LRM016     MOVE W-CONV-ACCT(1:3) TO FD-AUX23-XREF-KEY(2:3)                      
LRM016     MOVE W-CONV-ACCT(4:5) TO FD-AUX23-XREF-KEY(8:5)                      
LRM016     READ AUXFILE.                                                        
LRM016     ADD 1 TO W-AUXFILE-CNT.                                              
LRM016     IF AUXFILE-FOUND                                                     
LRM016        IF ((W-NSCC-TI-TFR-TYPE = 'FUL' OR 'PTR')                         
LRM016        AND DSTBN-SIDE-CD OF DCLVTRNFR = 'D')                             
LRM016        OR ((W-NSCC-TI-TFR-TYPE = 'RCL' OR 'FRV')                         
LRM016        AND DSTBN-SIDE-CD OF DCLVTRNFR = 'R')                             
LRM016           MOVE 'CONV REJECT'  TO CVRSN-ACCT-NBR OF DCLVTRNFR             
LRM016           MOVE 'NOTFND' TO W-CONV-ACCT                                   
LRM016           MOVE 'Y' TO W-REJECT-AUTO-SW                                   
LRM016        ELSE                                                              
LRM016           MOVE 'CONV'         TO CVRSN-ACCT-NBR OF DCLVTRNFR             
LRM016                            W-CONV-ACCT                                   
LRM016        END-IF                                                            
LRM016        DISPLAY 'CLIENT 10 CONV ACCT FOUND '                              
LRM016           FD-AUX23-XREF-KEY                                              
LRM016          ' ' W-NSCC-TI-TFR-TYPE ' ' W-NSCC-ACAT-CTL-NBR                  
LRM016          ' FORCE CONV REJECT'                                            
LRM016     ELSE                                                                 
LRM016        MOVE SPACES  TO CVRSN-ACCT-NBR OF DCLVTRNFR                       
LRM016        DISPLAY 'CLIENT 10 CONVERISION ACCT NOTFND ' W-CONV-ACCT          
LRM016             ' STUTUS ' AUXFILE-STAT ' ' W-NSCC-TI-TFR-TYPE               
LRM016             ' ' W-NSCC-ACAT-CTL-NBR                                      
LRM016        MOVE SPACES  TO W-CONV-ACCT                                       
LRM016     END-IF.                                                              
LRM016 5260-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
       5300-FULL-DELIVERY-EDIT.                                                 
      *****************************************************************         
      *--BH-ACAT-REJ-PEND-DEL-DUP                                               
      *--BH-ACAT-REJ-PEND-DEL-SS                                                
      *--BH-ACAT-REJ-PEND-DEL-MM                                                
      ***BH-ACAT-REJ-PEND-DEL-IRA                                               
      ***BH-ACAT-REJ-PEND-DEL-QRP                                               
      ***BH-ACAT-REJ-PEND-DEL-SP                                                
           MOVE '5300-FULL-DELIVERY-EDIT     ' TO W-ROUTINE-1.                  
                                                                                
           MOVE ' '      TO W-TRANSFER-DUPE-SW                                  
           MOVE ' '      TO W-REJ-SS-MAIN                                       
           MOVE ' '      TO W-REJ-SS-IRA                                        
           MOVE ' '      TO W-REJ-SS-JOINT                                      
           MOVE ' '      TO W-CUST-TYPE-SW                                      
                                                                                
           IF  BH-ACAT-REJ-PEND-DEL-DUP-IND = '1'                               
               PERFORM 5305-CHECK-DUPE-TRANSFER THRU 5305-EXIT                  
               IF  W-TRANSFER-DUPE-SW      = 'Y'                                
                   MOVE 'Y'           TO ACCT-DPLCT-TRN-IND OF DCLVTRNFR        
                   MOVE 'Y' TO W-REJ-DUP                                        
                   IF  BH-ACAT-REJ-PEND-DEL-DUP-CODE > '00'                     
DJ0010                     DISPLAY 'INP=' W-INFILE-CNT                          
DJ0010                                ' ' W-NSCC-KEY-CLIENT-NBR                 
DJ0010                                ' ' W-NSCC-TI-ACAT-CTL-NBR                
DJ0010                       ' W-REJ-DUP FLAGGED TO BE REJECTED'                
                       MOVE 'Y' TO W-REJECT-AUTO-SW                             
                   END-IF                                                       
               ELSE                                                             
                   MOVE 'N'           TO ACCT-DPLCT-TRN-IND OF DCLVTRNFR        
               END-IF                                                           
           END-IF.                                                              
                                                                                
TCK001* IF  BH-ACAT-REJ-PEND-DEL-QRP-IND = '1'                                  
TCK001* QRP = QUALIFIED RETIREMENT PLAN (B1- 434564)                            
TCK001     IF BH-ACAT-REJ-PEND-DEL-QRP-IND = '1'                                
LRM001        IF (W-NSCC-TI-RCV-ACCT-TYPE =                                     
LRM001           'QP' OR '4K' OR 'DR' OR 'SI' OR 'EI' OR 'IR' OR 'RI')          
TCK001           MOVE 'Y'       TO W-REJ-QRP                                    
TCK001           MOVE 'Y'       TO ACCT-QULFD-PLN-IND OF DCLVTRNFR              
TCK001           IF BH-ACAT-REJ-PEND-DEL-QRP-CODE > '00'                        
DJ0010                     DISPLAY 'INP=' W-INFILE-CNT                          
DJ0010                                ' ' W-NSCC-KEY-CLIENT-NBR                 
DJ0010                                ' ' W-NSCC-TI-ACAT-CTL-NBR                
DJ0010                       ' W-REJ-QRP FLAGGED TO BE REJECTED'                
TCK001              MOVE 'Y'    TO W-REJECT-AUTO-SW                             
TCK001           END-IF                                                         
TCK001       END-IF                                                             
TCK001     END-IF.                                                              
                                                                                
LRM005     PERFORM 5380-CHECK-VRSDBLK      THRU 5380-EXIT.                      
                                                                                
           IF  GETNA-RETURN-FOUND                                               
DJ0006         IF BH-ACAT-REJ-PEND-DEL-SS-IND = '1'                             
                  PERFORM 5310-CHECK-SOC-SEC  THRU 5310-EXIT                    
DJ0006         END-IF                                                           
               PERFORM 5320-EDIT-CUST-TYPE THRU 5320-EXIT                       
               PERFORM 5340-CALC-IRA-AGE   THRU 5340-EXIT                       
DJ0010         IF BH-ACAT-ADTS-DOCUM-EDIT-NO > 0                                
DJ0010            PERFORM 5350-ADTS-DOCUMENT  THRU 5350-EXIT                    
DJ0010         END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  GETNA-RETURN-FOUND                                               
DJ0003     AND BH-ACAT-REJ-PEND-DEL-SS-IND = '1'                                
DJ0003         IF W-REJ-SS = 'Y'                                                
DJ0003            IF BH-ACAT-REJ-PEND-DEL-SS-CODE > '00'                        
DJ0010                     DISPLAY 'INP=' W-INFILE-CNT                          
DJ0010                                ' ' W-NSCC-KEY-CLIENT-NBR                 
DJ0010                                ' ' W-NSCC-TI-ACAT-CTL-NBR                
DJ0010                       ' W-REJ-SS FLAGGED TO BE REJECTED'                 
DJ0003               MOVE 'Y' TO W-REJECT-AUTO-SW                               
DJ0003            END-IF                                                        
DJ0003         END-IF                                                           
DJ0003     END-IF.                                                              
                                                                                
           IF  GETNA-RETURN-FOUND                                               
           AND W-CUST-TYPE-SW = 'N'                                             
               IF BH-ACAT-REJ-PEND-DEL-MM-IND = '1'                             
                        MOVE '02'     TO TRNFR-TYPE-RJCT-CD OF DCLVTRNFR        
                        MOVE '3'      TO RCV-ACT-TYP-STS-CD OF DCLVTRNFR        
                        MOVE 'Y'      TO W-REJ-MM                               
                   IF BH-ACAT-REJ-PEND-DEL-MM-CODE > '00'                       
DJ0010                     DISPLAY 'INP=' W-INFILE-CNT                          
DJ0010                                ' ' W-NSCC-KEY-CLIENT-NBR                 
DJ0010                                ' ' W-NSCC-TI-ACAT-CTL-NBR                
DJ0010                       ' W-REJ-MM FLAGGED TO BE REJECTED'                 
                           MOVE 'Y' TO W-REJECT-AUTO-SW                         
                           DISPLAY 'INP=' W-INFILE-CNT                          
                                      ' ' W-NSCC-KEY-CLIENT-NBR                 
                                      ' ' W-NSCC-TI-ACAT-CTL-NBR                
                                      ' ' W-NSCC-TI-TFR-TYPE                    
                                  ' TRN=' W-NSCC-TI-TRAN-TYPE                   
                                   ' ' W-BRN-ACCT                               
                                  ' AUTO-REJECT:CUST TYPE MISMATCH'             
                              ' NSCC=' W-NSCC-TI-RCV-ACCT-TYPE                  
                               ' ADP=' W-CUST-TYPE                              
                               ' IRA=' NAPPA-IRA-KEOUGH-IND                     
                               ' CLS=' NAPPA-ACCT-CLASS-EXP                     
                               ' CUS=' NAPPA-ADT-CUSTOMER-TYPE                  
                   ELSE                                                         
                           DISPLAY 'INP=' W-INFILE-CNT                          
                                      ' ' W-NSCC-KEY-CLIENT-NBR                 
                                      ' ' W-NSCC-TI-ACAT-CTL-NBR                
                                      ' ' W-NSCC-TI-TFR-TYPE                    
                                  ' TRN=' W-NSCC-TI-TRAN-TYPE                   
                                   ' ' W-BRN-ACCT                               
                                  ' WARNING:CUST TYPE MISMATCH'                 
                              ' NSCC=' W-NSCC-TI-RCV-ACCT-TYPE                  
                               ' ADP=' W-CUST-TYPE                              
                               ' IRA=' NAPPA-IRA-KEOUGH-IND                     
                               ' CLS=' NAPPA-ACCT-CLASS-EXP                     
                               ' CUS=' NAPPA-ADT-CUSTOMER-TYPE                  
                   END-IF                                                       
               ELSE                                                             
                           DISPLAY 'INP=' W-INFILE-CNT                          
                                      ' ' W-NSCC-KEY-CLIENT-NBR                 
                                      ' ' W-NSCC-TI-ACAT-CTL-NBR                
                                      ' ' W-NSCC-TI-TFR-TYPE                    
                                  ' TRN=' W-NSCC-TI-TRAN-TYPE                   
                                   ' ' W-BRN-ACCT                               
                                  ' NO-EDIT: CUST TYPE MISMATCH'                
                              ' NSCC=' W-NSCC-TI-RCV-ACCT-TYPE                  
                               ' ADP=' W-CUST-TYPE                              
                               ' IRA=' NAPPA-IRA-KEOUGH-IND                     
                               ' CLS=' NAPPA-ACCT-CLASS-EXP                     
                               ' CUS=' NAPPA-ADT-CUSTOMER-TYPE                  
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5300-EXIT. EXIT.                                                         
      *****************************************************************         
      /                                                                         
      *****************************************************************         
       5301-PTR-EDIT-DELIVERY.                                                  
      *****************************************************************         
      *--SSR# 38232                                                             
      *--SOC SEC MISMATCH  : (434569) BH-ACAT-REJ-PEND-PTR-DEL-IND              
      *--CUST TYPE MISMATCH: (434570) BH-ACAT-REJ-PEND-PTR-DEL-MM-IN            
      *--DUPE TRANSFER     : (434571) BH-ACAT-REJ-PEND-PTR-DEL-DP-IN            
           MOVE '5301-PTR-EDIT-DELIVERY      ' TO W-ROUTINE-1.                  
                                                                                
           MOVE ' '      TO W-TRANSFER-DUPE-SW                                  
           MOVE ' '      TO W-REJ-SS-MAIN                                       
           MOVE ' '      TO W-REJ-SS-IRA                                        
           MOVE ' '      TO W-REJ-SS-JOINT                                      
           MOVE ' '      TO W-CUST-TYPE-SW                                      
                                                                                
           IF  BH-ACAT-REJ-PEND-PTR-DEL-DP-IN = '1'                             
               PERFORM 5304-CHECK-DUPE-FUL-TRANSFER THRU 5304-EXIT              
               IF  W-TRANSFER-DUPE-SW = 'Y'                                     
                   DISPLAY '    ' 'PTR DUPE FULL TRANSFER'                      
                   MOVE 'Y'           TO ACCT-DPLCT-TRN-IND OF DCLVTRNFR        
                   MOVE 'Y' TO W-REJ-DUP                                        
                   IF  BH-ACAT-REJ-PEND-PTR-DEL-DP-CD > '00'                    
                       MOVE 'Y' TO W-REJECT-AUTO-SW                             
                   END-IF                                                       
               ELSE                                                             
                   MOVE 'N'           TO ACCT-DPLCT-TRN-IND OF DCLVTRNFR        
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  GETNA-RETURN-FOUND                                               
           AND BH-ACAT-REJ-PEND-PTR-DEL-IND = '1'                               
               PERFORM 5310-CHECK-SOC-SEC  THRU 5310-EXIT                       
               IF W-REJ-SS = 'Y'                                                
                   DISPLAY '    ' 'PTR SOC-SEC-NUM MISMATCH'                    
                  IF BH-ACAT-REJ-PEND-PTR-DEL-CODE > '00'                       
                     MOVE 'Y' TO W-REJECT-AUTO-SW                               
                  END-IF                                                        
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  GETNA-RETURN-FOUND                                               
           AND BH-ACAT-REJ-PEND-PTR-DEL-MM-IN = '1'                             
               PERFORM 5320-EDIT-CUST-TYPE THRU 5320-EXIT                       
             IF W-CUST-TYPE-SW = 'N'                                            
               IF BH-ACAT-REJ-PEND-PTR-DEL-MM-IN = '1'                          
                   DISPLAY '    ' 'PTR CUSTOMER TYPE MISMATCH'                  
                        MOVE '3'      TO RCV-ACT-TYP-STS-CD OF DCLVTRNFR        
                        MOVE 'Y'      TO W-REJ-MM                               
                   IF BH-ACAT-REJ-PEND-PTR-DEL-MM-CD > '00'                     
                           MOVE 'Y' TO W-REJECT-AUTO-SW                         
                           DISPLAY 'INP=' W-INFILE-CNT                          
                                      ' ' W-NSCC-KEY-CLIENT-NBR                 
                                      ' ' W-NSCC-TI-ACAT-CTL-NBR                
                                      ' ' W-NSCC-TI-TFR-TYPE                    
                                  ' TRN=' W-NSCC-TI-TRAN-TYPE                   
                                   ' ' W-BRN-ACCT                               
                                  ' AUTO-REJECT:CUST TYPE MISMATCH'             
                              ' NSCC=' W-NSCC-TI-RCV-ACCT-TYPE                  
                               ' ADP=' W-CUST-TYPE                              
                               ' IRA=' NAPPA-IRA-KEOUGH-IND                     
                               ' CLS=' NAPPA-ACCT-CLASS-EXP                     
                               ' CUS=' NAPPA-ADT-CUSTOMER-TYPE                  
                   ELSE                                                         
                           DISPLAY 'INP=' W-INFILE-CNT                          
                                      ' ' W-NSCC-KEY-CLIENT-NBR                 
                                      ' ' W-NSCC-TI-ACAT-CTL-NBR                
                                      ' ' W-NSCC-TI-TFR-TYPE                    
                                  ' TRN=' W-NSCC-TI-TRAN-TYPE                   
                                   ' ' W-BRN-ACCT                               
                                  ' WARNING:CUST TYPE MISMATCH'                 
                              ' NSCC=' W-NSCC-TI-RCV-ACCT-TYPE                  
                               ' ADP=' W-CUST-TYPE                              
                               ' IRA=' NAPPA-IRA-KEOUGH-IND                     
                               ' CLS=' NAPPA-ACCT-CLASS-EXP                     
                               ' CUS=' NAPPA-ADT-CUSTOMER-TYPE                  
                   END-IF                                                       
               ELSE                                                             
                           DISPLAY 'INP=' W-INFILE-CNT                          
                                      ' ' W-NSCC-KEY-CLIENT-NBR                 
                                      ' ' W-NSCC-TI-ACAT-CTL-NBR                
                                      ' ' W-NSCC-TI-TFR-TYPE                    
                                  ' TRN=' W-NSCC-TI-TRAN-TYPE                   
                                   ' ' W-BRN-ACCT                               
                                  ' NO-EDIT: CUST TYPE MISMATCH'                
                              ' NSCC=' W-NSCC-TI-RCV-ACCT-TYPE                  
                               ' ADP=' W-CUST-TYPE                              
                               ' IRA=' NAPPA-IRA-KEOUGH-IND                     
                               ' CLS=' NAPPA-ACCT-CLASS-EXP                     
                               ' CUS=' NAPPA-ADT-CUSTOMER-TYPE                  
               END-IF                                                           
             END-IF                                                             
           END-IF.                                                              
                                                                                
DJ0005     IF  GETNA-RETURN-FOUND                                               
DJ0005         PERFORM 5340-CALC-IRA-AGE   THRU 5340-EXIT                       
DJ0005     END-IF.                                                              
DJ0005                                                                          
DJ0005* IF  BH-ACAT-REJ-PEND-DEL-QRP-IND = '1'                                  
DJ0005* QRP = QUALIFIED RETIREMENT PLAN (B1- 434564)                            
DJ0005     IF BH-ACAT-REJ-PEND-DEL-QRP-IND = '1'                                
DJ0005        IF (W-NSCC-TI-RCV-ACCT-TYPE =                                     
DJ0005           'QP' OR '4K' OR 'DR' OR 'SI' OR 'EI' OR 'IR' OR 'RI')          
DJ0005           MOVE 'Y'       TO W-REJ-QRP                                    
DJ0005           MOVE 'Y'       TO ACCT-QULFD-PLN-IND OF DCLVTRNFR              
DJ0005           IF BH-ACAT-REJ-PEND-DEL-QRP-CODE > '00'                        
DJ0005              MOVE 'Y'    TO W-REJECT-AUTO-SW                             
DJ0005           END-IF                                                         
DJ0005       END-IF                                                             
DJ0005     END-IF.                                                              
DJ0005                                                                          
DJ0005     PERFORM 5380-CHECK-VRSDBLK      THRU 5380-EXIT.                      
                                                                                
       5301-EXIT. EXIT.                                                         
      *****************************************************************         
      /                                                                         
       5304-CHECK-DUPE-FUL-TRANSFER.                                            
           MOVE '5304-CHECK-DUPE-FUL-TRANSFER' TO W-ROUTINE-1.                  
                                                                                
           INITIALIZE W-VTRNFR-SELECT-FIELDS                                    
           EXEC SQL SELECT                                                      
                    ACAT_CONTROL_NBR                                            
                   ,TRNFR_TYPE_CD                                               
                   ,TRANS_TYPE_CD                                               
                   ,STTS_CD                                                     
                   ,DAYS_STTS_QTY                                               
                   ,PRCS_DT                                                     
                   ,STTLM_DT                                                    
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,BRANCH_CD                                                   
                   ,ACCT_CD                                                     
                   ,ACCT_DLVR_NBR                                               
                   ,ACCT_RCV_NBR                                                
                   ,RCV_NBR                                                     
                   ,PRGM_NM                                                     
               INTO                                                             
                     :W-VTRNFR-ACAT-CONTROL-NBR                                 
                    ,:W-VTRNFR-TRNFR-TYPE-CD                                    
                    ,:W-VTRNFR-TRANS-TYPE-CD                                    
                    ,:W-VTRNFR-STTS-CD                                          
                    ,:W-VTRNFR-DAYS-STTS-QTY                                    
                    ,:W-VTRNFR-PRCS-DT                                          
                    ,:W-VTRNFR-STTLM-DT                                         
                    ,:W-VTRNFR-SYS-ACT-CD                                       
                    ,:W-VTRNFR-SYS-RJCT-RSN-CD                                  
                    ,:W-VTRNFR-BRANCH-CD                                        
                    ,:W-VTRNFR-ACCT-CD                                          
                    ,:W-VTRNFR-ACCT-DLVR-NBR                                    
                    ,:W-VTRNFR-ACCT-RCV-NBR                                     
                    ,:W-VTRNFR-RCV-NBR                                          
                    ,:W-VTRNFR-PRGM-NM                                          
               FROM  VTRNFR                                                     
               WHERE CLIENT_NBR       = :W-NSCC-KEY-CLIENT-NBR                  
                 AND DLVR_NBR         = :W-NSCC-TI-DEL-NBR                      
                 AND BRANCH_CD        = :W-BRANCH-CD                            
                 AND ACCT_CD          = :W-ACCT-CD                              
                 AND TRNFR_TYPE_CD    = 'FUL'                                   
                 AND TRANS_TYPE_CD   <> 'R'                                     
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           IF  SQLCODE  =  +0 OR -811                                           
               IF  W-VTRNFR-ACAT-CONTROL-NBR                                    
                                      NOT =  W-NSCC-ACAT-CTL-NBR                
                   ADD 1 TO W-VTRNFR-DUPE-CNT                                   
                   MOVE 'Y'           TO W-TRANSFER-DUPE-SW                     
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                         ' DUPE FUL  TFR'                                       
                         ' CLT=' W-NSCC-KEY-CLIENT-NBR                          
                         ' DEL=' W-NSCC-TI-DEL-NBR                              
                         ' ACC=' W-NSCC-TI-DEL-ACCT-NBR                         
                         ' RCV=' W-NSCC-TI-RCV-NBR                              
                         ' ACC=' W-NSCC-TI-RCV-ACCT-NBR                         
                         ' SQL=' W-DB2-SQLCODE                                  
                   PERFORM 7900-DISPLAY-KEY     THRU 7900-EXIT                  
                   DISPLAY '   PREV:'                                           
                          ' CTL=' W-VTRNFR-ACAT-CONTROL-NBR                     
                          ' DVA=' W-VTRNFR-ACCT-DLVR-NBR (1:10)                 
                          ' RCV=' W-VTRNFR-RCV-NBR                              
                          ' RVA=' W-VTRNFR-ACCT-RCV-NBR  (1:10)                 
                          ' TFR=' W-VTRNFR-TRNFR-TYPE-CD                        
                          ' TRN=' W-VTRNFR-TRANS-TYPE-CD                        
                          ' STA=' W-VTRNFR-STTS-CD                              
                           ' PD=' W-VTRNFR-PRCS-DT                              
                          ' PGM=' W-VTRNFR-PRGM-NM                              
               ELSE                                                             
                   CONTINUE                                                     
               END-IF                                                           
           ELSE                                                                 
               CONTINUE                                                         
           END-IF.                                                              
                                                                                
           INITIALIZE W-VTRNFR-SELECT-FIELDS                                    
           MOVE W-BRN-ACCT-LIKE-X TO W-BRN-ACCT-LIKE.                           
           EXEC SQL SELECT                                                      
                    ACAT_CONTROL_NBR                                            
                   ,TRNFR_TYPE_CD                                               
                   ,TRANS_TYPE_CD                                               
                   ,STTS_CD                                                     
                   ,DAYS_STTS_QTY                                               
                   ,PRCS_DT                                                     
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,ACCT_DLVR_NBR                                               
                   ,ACCT_RCV_NBR                                                
                   ,RCV_NBR                                                     
                   ,PRGM_NM                                                     
                   ,UPDT_TMSTP                                                  
                   ,NSCC_PEND_CD                                                
                   ,ACAT_CNTL_ASTD_NBR                                          
               INTO                                                             
                     :W-VTRNFR-ACAT-CONTROL-NBR                                 
                    ,:W-VTRNFR-TRNFR-TYPE-CD                                    
                    ,:W-VTRNFR-TRANS-TYPE-CD                                    
                    ,:W-VTRNFR-STTS-CD                                          
                    ,:W-VTRNFR-DAYS-STTS-QTY                                    
                    ,:W-VTRNFR-PRCS-DT                                          
                    ,:W-VTRNFR-SYS-ACT-CD                                       
                    ,:W-VTRNFR-SYS-RJCT-RSN-CD                                  
                    ,:W-VTRNFR-ACCT-DLVR-NBR                                    
                    ,:W-VTRNFR-ACCT-RCV-NBR                                     
                    ,:W-VTRNFR-RCV-NBR                                          
                    ,:W-VTRNFR-PRGM-NM                                          
                    ,:W-VTRNFR-UPDT-TMSTP                                       
                    ,:W-VTRNFR-NSCC-PEND-CD                                     
                    ,:W-ACAT-CNTL-ASTD-NBR                                      
               FROM  ACTITRF                                                    
               WHERE CLIENT_NBR       = :W-NSCC-KEY-CLIENT-NBR                  
                 AND DLVR_NBR         = :W-NSCC-TI-DEL-NBR                      
                 AND ACCT_DLVR_NBR LIKE :W-BRN-ACCT-LIKE                        
                 AND TRNFR_TYPE_CD    = 'FUL'                                   
                 AND TRANS_TYPE_CD   <> 'R'                                     
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           IF  SQLCODE  =  +0 OR -811                                           
               IF  W-VTRNFR-ACAT-CONTROL-NBR                                    
                                      NOT =  W-NSCC-ACAT-CTL-NBR                
                   ADD 1 TO W-VTRNFR-DUPE-CNT                                   
                   MOVE 'Y'           TO W-TRANSFER-DUPE-SW                     
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                         ' DUP F INT TFR'                                       
                         ' CLT=' W-NSCC-KEY-CLIENT-NBR                          
                         ' DEL=' W-NSCC-TI-DEL-NBR                              
                         ' ACC=' W-NSCC-TI-DEL-ACCT-NBR                         
                         ' RCV=' W-NSCC-TI-RCV-NBR                              
                         ' ACC=' W-NSCC-TI-RCV-ACCT-NBR                         
                         ' SQL=' W-DB2-SQLCODE                                  
                   PERFORM 7900-DISPLAY-KEY     THRU 7900-EXIT                  
                   DISPLAY '   INIT:'                                           
                          ' CTL=' W-VTRNFR-ACAT-CONTROL-NBR                     
                          ' DVA=' W-VTRNFR-ACCT-DLVR-NBR (1:10)                 
                          ' RCV=' W-VTRNFR-RCV-NBR                              
                          ' RVA=' W-VTRNFR-ACCT-RCV-NBR  (1:10)                 
                          ' TFR=' W-VTRNFR-TRNFR-TYPE-CD                        
                          ' TRN=' W-VTRNFR-TRANS-TYPE-CD                        
                           ' PD=' W-VTRNFR-PRCS-DT                              
                          ' PGM=' W-VTRNFR-PRGM-NM                              
                          ' UPD=' W-VTRNFR-UPDT-TMSTP                           
                         ' PEND=' W-VTRNFR-NSCC-PEND-CD                         
                          ' ASC=' W-ACAT-CNTL-ASTD-NBR                          
               ELSE                                                             
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                         ' DUP INIT SAME CTL '                                  
                         ' CLT=' W-NSCC-KEY-CLIENT-NBR                          
                         ' DEL=' W-NSCC-TI-DEL-NBR                              
                         ' ACC=' W-NSCC-TI-DEL-ACCT-NBR                         
                     ' SQLCODE=' W-DB2-SQLCODE                                  
                   PERFORM 7900-DISPLAY-KEY     THRU 7900-EXIT                  
                   DISPLAY '   INIT:'                                           
                          ' TFR=' W-VTRNFR-TRNFR-TYPE-CD                        
                          ' TRN=' W-VTRNFR-TRANS-TYPE-CD                        
                         ' PEND=' W-VTRNFR-NSCC-PEND-CD                         
                           ' PD=' W-VTRNFR-PRCS-DT                              
                          ' PGM=' W-VTRNFR-PRGM-NM                              
                          ' UPD=' W-VTRNFR-UPDT-TMSTP                           
                         ' PEND=' W-VTRNFR-NSCC-PEND-CD                         
                          ' ASC=' W-ACAT-CNTL-ASTD-NBR                          
               END-IF                                                           
           ELSE                                                                 
               CONTINUE                                                         
           END-IF.                                                              
                                                                                
       5304-EXIT. EXIT.                                                         
      /                                                                         
       5305-CHECK-DUPE-TRANSFER.                                                
           MOVE '5305-CHECK-DUPE-TRANSFER    ' TO W-ROUTINE-1.                  
                                                                                
           INITIALIZE W-VTRNFR-SELECT-FIELDS                                    
           EXEC SQL SELECT                                                      
                    ACAT_CONTROL_NBR                                            
                   ,TRNFR_TYPE_CD                                               
                   ,TRANS_TYPE_CD                                               
                   ,STTS_CD                                                     
                   ,DAYS_STTS_QTY                                               
                   ,PRCS_DT                                                     
                   ,STTLM_DT                                                    
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,BRANCH_CD                                                   
                   ,ACCT_CD                                                     
                   ,ACCT_DLVR_NBR                                               
                   ,ACCT_RCV_NBR                                                
                   ,RCV_NBR                                                     
                   ,PRGM_NM                                                     
               INTO                                                             
                     :W-VTRNFR-ACAT-CONTROL-NBR                                 
                    ,:W-VTRNFR-TRNFR-TYPE-CD                                    
                    ,:W-VTRNFR-TRANS-TYPE-CD                                    
                    ,:W-VTRNFR-STTS-CD                                          
                    ,:W-VTRNFR-DAYS-STTS-QTY                                    
                    ,:W-VTRNFR-PRCS-DT                                          
                    ,:W-VTRNFR-STTLM-DT                                         
                    ,:W-VTRNFR-SYS-ACT-CD                                       
                    ,:W-VTRNFR-SYS-RJCT-RSN-CD                                  
                    ,:W-VTRNFR-BRANCH-CD                                        
                    ,:W-VTRNFR-ACCT-CD                                          
                    ,:W-VTRNFR-ACCT-DLVR-NBR                                    
                    ,:W-VTRNFR-ACCT-RCV-NBR                                     
                    ,:W-VTRNFR-RCV-NBR                                          
                    ,:W-VTRNFR-PRGM-NM                                          
               FROM  VTRNFR                                                     
               WHERE CLIENT_NBR       = :W-NSCC-KEY-CLIENT-NBR                  
                 AND DLVR_NBR         = :W-NSCC-TI-DEL-NBR                      
                 AND BRANCH_CD        = :W-BRANCH-CD                            
                 AND ACCT_CD          = :W-ACCT-CD                              
                 AND TRANS_TYPE_CD   <> 'R'                                     
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           IF  SQLCODE  =  +0 OR -811                                           
               IF  W-VTRNFR-ACAT-CONTROL-NBR                                    
                                      NOT =  W-NSCC-ACAT-CTL-NBR                
                   ADD 1 TO W-VTRNFR-DUPE-CNT                                   
                   MOVE 'Y'           TO W-TRANSFER-DUPE-SW                     
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                         ' DUPLICATE TFR'                                       
                         ' CLT=' W-NSCC-KEY-CLIENT-NBR                          
                         ' DEL=' W-NSCC-TI-DEL-NBR                              
                         ' ACC=' W-NSCC-TI-DEL-ACCT-NBR                         
                         ' RCV=' W-NSCC-TI-RCV-NBR                              
                         ' ACC=' W-NSCC-TI-RCV-ACCT-NBR                         
                         ' SQL=' W-DB2-SQLCODE                                  
                   PERFORM 7900-DISPLAY-KEY     THRU 7900-EXIT                  
                   DISPLAY '   PREV:'                                           
                          ' CTL=' W-VTRNFR-ACAT-CONTROL-NBR                     
                          ' DVA=' W-VTRNFR-ACCT-DLVR-NBR (1:10)                 
                          ' RCV=' W-VTRNFR-RCV-NBR                              
                          ' RVA=' W-VTRNFR-ACCT-RCV-NBR  (1:10)                 
                          ' TFR=' W-VTRNFR-TRNFR-TYPE-CD                        
                          ' TRN=' W-VTRNFR-TRANS-TYPE-CD                        
                          ' STA=' W-VTRNFR-STTS-CD                              
                           ' PD=' W-VTRNFR-PRCS-DT                              
                          ' PGM=' W-VTRNFR-PRGM-NM                              
               ELSE                                                             
                   CONTINUE                                                     
               END-IF                                                           
           ELSE                                                                 
               CONTINUE                                                         
           END-IF.                                                              
                                                                                
           INITIALIZE W-VTRNFR-SELECT-FIELDS                                    
           MOVE W-BRN-ACCT-LIKE-X TO W-BRN-ACCT-LIKE.                           
           EXEC SQL SELECT                                                      
                    ACAT_CONTROL_NBR                                            
                   ,TRNFR_TYPE_CD                                               
                   ,TRANS_TYPE_CD                                               
                   ,STTS_CD                                                     
                   ,DAYS_STTS_QTY                                               
                   ,PRCS_DT                                                     
                   ,SYS_ACT_CD                                                  
                   ,SYS_RJCT_RSN_CD                                             
                   ,ACCT_DLVR_NBR                                               
                   ,ACCT_RCV_NBR                                                
                   ,RCV_NBR                                                     
                   ,PRGM_NM                                                     
                   ,UPDT_TMSTP                                                  
                   ,NSCC_PEND_CD                                                
                   ,ACAT_CNTL_ASTD_NBR                                          
               INTO                                                             
                     :W-VTRNFR-ACAT-CONTROL-NBR                                 
                    ,:W-VTRNFR-TRNFR-TYPE-CD                                    
                    ,:W-VTRNFR-TRANS-TYPE-CD                                    
                    ,:W-VTRNFR-STTS-CD                                          
                    ,:W-VTRNFR-DAYS-STTS-QTY                                    
                    ,:W-VTRNFR-PRCS-DT                                          
                    ,:W-VTRNFR-SYS-ACT-CD                                       
                    ,:W-VTRNFR-SYS-RJCT-RSN-CD                                  
                    ,:W-VTRNFR-ACCT-DLVR-NBR                                    
                    ,:W-VTRNFR-ACCT-RCV-NBR                                     
                    ,:W-VTRNFR-RCV-NBR                                          
                    ,:W-VTRNFR-PRGM-NM                                          
                    ,:W-VTRNFR-UPDT-TMSTP                                       
                    ,:W-VTRNFR-NSCC-PEND-CD                                     
                    ,:W-ACAT-CNTL-ASTD-NBR                                      
               FROM  ACTITRF                                                    
               WHERE CLIENT_NBR       = :W-NSCC-KEY-CLIENT-NBR                  
                 AND DLVR_NBR         = :W-NSCC-TI-DEL-NBR                      
                 AND ACCT_DLVR_NBR LIKE :W-BRN-ACCT-LIKE                        
                 AND TRANS_TYPE_CD   <> 'R'                                     
           END-EXEC                                                             
                                                                                
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           IF  SQLCODE  =  +0 OR -811                                           
               IF  W-VTRNFR-ACAT-CONTROL-NBR                                    
                                      NOT =  W-NSCC-ACAT-CTL-NBR                
                   ADD 1 TO W-VTRNFR-DUPE-CNT                                   
                   MOVE 'Y'           TO W-TRANSFER-DUPE-SW                     
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                         ' DUPL INIT TFR'                                       
                         ' CLT=' W-NSCC-KEY-CLIENT-NBR                          
                         ' DEL=' W-NSCC-TI-DEL-NBR                              
                         ' ACC=' W-NSCC-TI-DEL-ACCT-NBR                         
                         ' RCV=' W-NSCC-TI-RCV-NBR                              
                         ' ACC=' W-NSCC-TI-RCV-ACCT-NBR                         
                         ' SQL=' W-DB2-SQLCODE                                  
                   PERFORM 7900-DISPLAY-KEY     THRU 7900-EXIT                  
                   DISPLAY '   INIT:'                                           
                          ' CTL=' W-VTRNFR-ACAT-CONTROL-NBR                     
                          ' DVA=' W-VTRNFR-ACCT-DLVR-NBR (1:10)                 
                          ' RCV=' W-VTRNFR-RCV-NBR                              
                          ' RVA=' W-VTRNFR-ACCT-RCV-NBR  (1:10)                 
                          ' TFR=' W-VTRNFR-TRNFR-TYPE-CD                        
                          ' TRN=' W-VTRNFR-TRANS-TYPE-CD                        
                           ' PD=' W-VTRNFR-PRCS-DT                              
                          ' PGM=' W-VTRNFR-PRGM-NM                              
                          ' UPD=' W-VTRNFR-UPDT-TMSTP                           
                         ' PEND=' W-VTRNFR-NSCC-PEND-CD                         
                          ' ASC=' W-ACAT-CNTL-ASTD-NBR                          
               ELSE                                                             
                   DISPLAY 'INP=' W-INFILE-CNT                                  
                         ' DUP INIT SAME CTL '                                  
                         ' CLT=' W-NSCC-KEY-CLIENT-NBR                          
                         ' DEL=' W-NSCC-TI-DEL-NBR                              
                         ' ACC=' W-NSCC-TI-DEL-ACCT-NBR                         
                     ' SQLCODE=' W-DB2-SQLCODE                                  
                   PERFORM 7900-DISPLAY-KEY     THRU 7900-EXIT                  
                   DISPLAY '   INIT:'                                           
                          ' TFR=' W-VTRNFR-TRNFR-TYPE-CD                        
                          ' TRN=' W-VTRNFR-TRANS-TYPE-CD                        
                         ' PEND=' W-VTRNFR-NSCC-PEND-CD                         
                           ' PD=' W-VTRNFR-PRCS-DT                              
                          ' PGM=' W-VTRNFR-PRGM-NM                              
                          ' UPD=' W-VTRNFR-UPDT-TMSTP                           
                         ' PEND=' W-VTRNFR-NSCC-PEND-CD                         
                          ' ASC=' W-ACAT-CNTL-ASTD-NBR                          
               END-IF                                                           
           ELSE                                                                 
               CONTINUE                                                         
           END-IF.                                                              
                                                                                
       5305-EXIT. EXIT.                                                         
      /                                                                         
       5310-CHECK-SOC-SEC.                                                      
           MOVE '5310-CHECK-SOC-SEC          ' TO W-ROUTINE-1.                  
                                                                                
LRM015* WHEN OUR CLIENT (THE DELIVERER) CHANGES THE ACCOUNT NUMBER ON           
LRM015* THE H SCREEN, SKIP THE SSN EDIT, AS THIS WAS THEIR INTENTION TO         
LRM015* USE THIS DELIVER ACCOUNT.                                               
LRM015     IF  W-NSCC-TI-TRAN-TYPE = 'C'                                        
LRM015     AND W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR                      
LRM024     AND W-NSCC-TI-SUB-PART-NBR  = W-NSCC-TI-DEL-NBR                      
LRM015            DISPLAY 'DLVY SIDE TI CHANGE / SKIP SSN EDIT.'                
LRM015            ' ORIG TIN MSMTH ' ACCT-TIN-MSMTH-IND OF DCLVTRNFR            
LRM015            GO TO 5310-EXIT.                                              
                                                                                
DJ0003     PERFORM 5311-EDIT-SOC-SEC THRU 5311-EXIT                             
                                                                                
DJ0003     IF  W-REJ-SS-IRA = 'N'                                               
                  ADD   1   TO W-TIN-MATCHED-CNT                                
                  MOVE 'N'  TO ACCT-TIN-MSMTH-IND OF DCLVTRNFR                  
******************DISPLAY ' IRA ACCT - SSN MATCHED:'                            
           ELSE                                                                 
DJ0003         IF W-REJ-SS-IRA = 'Y'                                            
                  ADD 1 TO W-TIN-MISMATCHED-CNT                                 
                  MOVE 'Y'      TO ACCT-TIN-MSMTH-IND OF DCLVTRNFR              
                  MOVE 'Y'      TO W-REJ-SS                                     
                  DISPLAY ' IRA ACCT FLAGGED  - SSN MISMATCH:'                  
               END-IF                                                           
           END-IF.                                                              
                                                                                
DJ0003     IF  W-REJ-SS-JOINT = 'N'                                             
                  ADD   1   TO W-TIN-MATCHED-CNT                                
                  MOVE 'N'  TO ACCT-TIN-MSMTH-IND OF DCLVTRNFR                  
******************DISPLAY ' JOINT ACCT - SSN MATCHED:'                          
           ELSE                                                                 
DJ0003         IF W-REJ-SS-JOINT = 'Y'                                          
                  ADD 1 TO W-TIN-MISMATCHED-CNT                                 
                  MOVE 'Y'      TO ACCT-TIN-MSMTH-IND OF DCLVTRNFR              
                  MOVE 'Y'      TO W-REJ-SS                                     
                  DISPLAY ' JOINT ACCT FLAGGED  - SSN MISMATCH.'                
               END-IF                                                           
           END-IF.                                                              
                                                                                
DJ0003     IF  W-REJ-SS-MAIN = 'N'                                              
                  ADD   1   TO W-TIN-MATCHED-CNT                                
                  MOVE 'N'  TO ACCT-TIN-MSMTH-IND OF DCLVTRNFR                  
           ELSE                                                                 
DJ0003         IF W-REJ-SS-MAIN = 'Y'                                           
                  ADD 1 TO W-TIN-MISMATCHED-CNT                                 
                  MOVE 'Y'      TO ACCT-TIN-MSMTH-IND OF DCLVTRNFR              
                  MOVE 'Y'      TO W-REJ-SS                                     
DJ0004            DISPLAY 'INP=' W-INFILE-CNT                                   
DJ0004                           ' ' W-NSCC-KEY-CLIENT-NBR                      
DJ0004                           ' ' W-NSCC-TI-ACAT-CTL-NBR                     
DJ0004                           ' ' W-NSCC-TI-TFR-TYPE                         
DJ0004                       ' TRN=' W-NSCC-TI-TRAN-TYPE                        
DJ0004                       ' STA=' W-NSCC-STATUS                              
DJ0004                  ' DLV-ACCT=' W-NSCC-TI-DEL-ACCT-NBR (1:8)               
DJ0004                  ' RCV-ACCT=' W-NSCC-TI-RCV-ACCT-NBR                     
DJ0004            DISPLAY ' PRIMARY SSN= ' W-NSCC-TI-RCV-SSN-PRM                
DJ0004                    ' N/A SSN= ' NAPPA-SOC-SEC-TAX-ID1                    
DJ0004                    ' PRIMARY SSN MISMATCH: FLAGGED.'                     
DJ0004         END-IF                                                           
           END-IF.                                                              
                                                                                
       5310-EXIT. EXIT.                                                         
      /                                                                         
       5311-EDIT-SOC-SEC.                                                       
           MOVE '5311-EDIT-SOC-SEC           ' TO W-ROUTINE-1.                  
                                                                                
ET0001     IF (W-NSCC-TI-RCV-SSN-PRM = ALL ZEROES)                              
ET0001     OR (W-NSCC-TI-RCV-SSN-PRM = '999999999')                             
ET0001        MOVE SPACE                 TO W-RCV-SSN1                          
ET0001     ELSE                                                                 
ET0001        MOVE W-NSCC-TI-RCV-SSN-PRM TO W-RCV-SSN1                          
ET0001     END-IF.                                                              
ET0001     IF (W-NSCC-TI-RCV-SSN-SEC = ALL ZEROES)                              
ET0001     OR (W-NSCC-TI-RCV-SSN-SEC = '999999999')                             
ET0001        MOVE SPACE                 TO W-RCV-SSN2                          
ET0001     ELSE                                                                 
ET0001        MOVE W-NSCC-TI-RCV-SSN-SEC TO W-RCV-SSN2                          
ET0001     END-IF.                                                              
ET0001                                                                          
ET0001     IF (NAPPA-SOC-SEC-TAX-ID1 = ALL ZEROES)                              
ET0001     OR (NAPPA-SOC-SEC-TAX-ID1 = '999999999')                             
ET0001            MOVE SPACE                 TO W-NA-SSN1                       
ET0001     ELSE                                                                 
ET0001            MOVE NAPPA-SOC-SEC-TAX-ID1 TO W-NA-SSN1                       
ET0001     END-IF                                                               
ET0001     IF (NAPPA-SOC-SEC-TAX-ID2 = ALL ZEROES)                              
ET0001     OR (NAPPA-SOC-SEC-TAX-ID2 = '999999999')                             
ET0001            MOVE SPACE                 TO W-NA-SSN2                       
ET0001     ELSE                                                                 
ET0001            MOVE NAPPA-SOC-SEC-TAX-ID2 TO W-NA-SSN2                       
ET0001     END-IF.                                                              
ET0001                                                                          
ET0001     IF  (BH-ACAT-SECONDARY-SSN = '1')                                    
ET0001      AND (W-NSCC-TI-RCV-ACCT-TYPE = 'IR' OR 'RI' OR 'DR'                 
ET0001                                  OR 'SI' OR 'EL' OR 'QP')                
ET0001      AND (W-NA-SSN1  > SPACE  OR  W-NA-SSN2  > SPACE OR                  
ET0001           W-RCV-SSN1 > SPACE  OR  W-RCV-SSN2 > SPACE)                    
ET0001                 PERFORM 5312-IRA-PRIM-SECD-SSN THRU 5312-EXIT            
ET0001     ELSE                                                                 
ET0001       IF  (BH-ACAT-SECONDARY-SSN = '1')                                  
ET0001       AND (W-NSCC-TI-RCV-ACCT-TYPE = 'JT')                               
ET0001       AND (W-NA-SSN1  > SPACE  OR  W-NA-SSN2  > SPACE OR                 
ET0001              W-RCV-SSN1 > SPACE  OR  W-RCV-SSN2 > SPACE)                 
ET0001                PERFORM 5313-JOINT-PRIM-SECD-SSN THRU 5313-EXIT           
ET0001       ELSE                                                               
                 IF  NAPPA-SOC-SEC-TAX-ID1 = W-NSCC-TI-RCV-SSN-PRM              
DJ0003               MOVE 'N'      TO W-REJ-SS-MAIN                             
                 ELSE                                                           
DJ0003               MOVE 'Y'      TO W-REJ-SS-MAIN                             
                 END-IF                                                         
ET0001       END-IF                                                             
ET0001      END-IF.                                                             
                                                                                
       5311-EXIT. EXIT.                                                         
      /                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*  B1: 434685 - (IN CASE OF IRA ACCOUNT)                                  
ET0001*  FOR RECEIVING FIRM SUBMITTING FOR AN IRA/RETIREMENT ACCT,              
ET0001*  IF EITHER PRIMARY OR SECONDARY SSN MATCHES WITH DELIVERER'S            
ET0001*  PRIMARY OR SECONDARY SSN, THEN PROCESS THE TRANSFER,                   
ET0001*  OTHERWISE REJECT IT.                                                   
ET0001*--------------------------------------------------------------*          
ET0001 5312-IRA-PRIM-SECD-SSN.                                                  
           MOVE '5312-IRA-PRIM-SECD-SSN      ' TO W-ROUTINE-1.                  
           IF ((W-RCV-SSN1 > SPACE) AND (W-RCV-SSN1 = W-NA-SSN1))               
           OR                                                                   
              ((W-RCV-SSN1 > SPACE) AND (W-RCV-SSN1 = W-NA-SSN2))               
           OR                                                                   
              ((W-RCV-SSN2 > SPACE) AND (W-RCV-SSN2 = W-NA-SSN1))               
           OR                                                                   
              ((W-RCV-SSN2 > SPACE) AND (W-RCV-SSN2 = W-NA-SSN2))               
DJ0003            MOVE 'N'      TO W-REJ-SS-IRA                                 
           ELSE                                                                 
DJ0003            MOVE 'Y'      TO W-REJ-SS-IRA                                 
           END-IF.                                                              
                                                                                
DJ0004     IF W-REJ-SS-IRA = 'Y'                                                
DJ0004        DISPLAY 'INP=' W-INFILE-CNT                                       
DJ0004                          ' ' W-NSCC-KEY-CLIENT-NBR                       
DJ0004                          ' ' W-NSCC-TI-ACAT-CTL-NBR                      
DJ0004                          ' ' W-NSCC-TI-TFR-TYPE                          
DJ0004                      ' TRN=' W-NSCC-TI-TRAN-TYPE                         
DJ0004                      ' STA=' W-NSCC-STATUS                               
DJ0004                 ' DLV-ACCT=' W-NSCC-TI-DEL-ACCT-NBR (1:8)                
DJ0004                 ' RCV-ACCT=' W-NSCC-TI-RCV-ACCT-NBR                      
              DISPLAY ' RCV.P.SSN=' W-RCV-SSN1                                  
                      ' RCV.S.SSN=' W-RCV-SSN2                                  
                      ' DLV.P.SSN=' W-NA-SSN1                                   
                      ' DLV.S.SSN=' W-NA-SSN2                                   
DJ0004     END-IF.                                                              
ET0001 5312-EXIT. EXIT.                                                         
ET0001/                                                                         
ET0001*--------------------------------------------------------------*          
ET0001*  B1: 434685 - (IN CASE OF JOINT ACCOUNT)                                
ET0001*  FOR RECEIVING FIRM SUBMITTING FOR JOINT ACCOUNT,                       
ET0001*  IF BOTH PRIMARY AND SECONDARY SS NUMBERS ARE PROVIDED,                 
ET0001*  THEN BOTH SS NUMBERS MUST BE FOUND IN DELIVERER'S SSN LIST.            
ET0001*  IF ONLY 1 SSN IS PROVIDED, THE SS NUMBER MUST BE IN                    
ET0001*  DELIVERER'S SS NUMBER LIST.                                            
ET0001*  IF ONE SSN IS PROVIDED FOR DELIVER SIDE, THEN ONE RECEIVER'S           
ET0001*  SSN MUST MATCH WITH DELIVERER'S SSN.                                   
ET0001*--------------------------------------------------------------*          
ET0001 5313-JOINT-PRIM-SECD-SSN.                                                
           MOVE '5313-JOINT-PRIM-SECD-SSN    ' TO W-ROUTINE-1.                  
           IF (W-NA-SSN1 > SPACE AND W-NA-SSN2 > SPACE)                         
               PERFORM 5314-NA-SSN1-SS2 THRU 5314-EXIT                          
           ELSE                                                                 
           IF (W-NA-SSN1 > SPACE AND W-NA-SSN2 NOT > SPACE)                     
               PERFORM 5315-NA-SSN1-ONLY THRU 5315-EXIT                         
           ELSE                                                                 
           IF (W-NA-SSN1 NOT > SPACE AND W-NA-SSN2 > SPACE)                     
               PERFORM 5316-NA-SSN2-ONLY THRU 5316-EXIT                         
           ELSE                                                                 
DJ0003         MOVE 'Y' TO W-REJ-SS-JOINT                                       
               DISPLAY ' JOINT ACCT FLAGGED  - RECEIVER SSN NOT FOUND'          
           END-IF.                                                              
                                                                                
DJ0004     IF W-REJ-SS-JOINT = 'Y'                                              
DJ0004        DISPLAY 'INP=' W-INFILE-CNT                                       
DJ0004                          ' ' W-NSCC-KEY-CLIENT-NBR                       
DJ0004                          ' ' W-NSCC-TI-ACAT-CTL-NBR                      
DJ0004                          ' ' W-NSCC-TI-TFR-TYPE                          
DJ0004                      ' TRN=' W-NSCC-TI-TRAN-TYPE                         
DJ0004                      ' STA=' W-NSCC-STATUS                               
DJ0004                 ' DLV-ACCT=' W-NSCC-TI-DEL-ACCT-NBR (1:8)                
DJ0004                 ' RCV-ACCT=' W-NSCC-TI-RCV-ACCT-NBR                      
              DISPLAY ' RCV.P.SSN=' W-RCV-SSN1                                  
                      ' RCV.S.SSN=' W-RCV-SSN2                                  
                      ' DLV.P.SSN=' W-NA-SSN1                                   
                      ' DLV.S.SSN=' W-NA-SSN2                                   
DJ0004     END-IF.                                                              
                                                                                
ET0001 5313-EXIT. EXIT.                                                         
      *                                                                         
ET0001 5314-NA-SSN1-SS2.                                                        
           MOVE '5314-NA-SSN1-SS2            ' TO W-ROUTINE-1.                  
           IF  (W-RCV-SSN1  > SPACE  AND  W-RCV-SSN2 > SPACE)                   
              IF  (W-RCV-SSN1 = W-NA-SSN1  OR  W-RCV-SSN1 = W-NA-SSN2)          
              AND (W-RCV-SSN2 = W-NA-SSN1  OR  W-RCV-SSN2 = W-NA-SSN2)          
DJ0003            MOVE 'N'      TO W-REJ-SS-JOINT                               
               ELSE                                                             
DJ0003            MOVE 'Y'      TO W-REJ-SS-JOINT                               
               END-IF                                                           
           ELSE                                                                 
           IF  (W-RCV-SSN1 > SPACE  AND  W-RCV-SSN2 NOT > SPACE)                
               IF (W-RCV-SSN1 = W-NA-SSN1  OR  W-RCV-SSN1 = W-NA-SSN2)          
DJ0003            MOVE 'N'      TO W-REJ-SS-JOINT                               
               ELSE                                                             
DJ0003            MOVE 'Y'      TO W-REJ-SS-JOINT                               
               END-IF                                                           
           ELSE                                                                 
           IF  (W-RCV-SSN1 NOT > SPACE  AND  W-RCV-SSN2 > SPACE)                
               IF (W-RCV-SSN2 = W-NA-SSN1  OR  W-RCV-SSN2 = W-NA-SSN2)          
DJ0003            MOVE 'N'      TO W-REJ-SS-JOINT                               
               ELSE                                                             
DJ0003            MOVE 'Y'      TO W-REJ-SS-JOINT                               
               END-IF                                                           
           ELSE                                                                 
DJ0003            MOVE 'Y'      TO W-REJ-SS-JOINT                               
           END-IF.                                                              
DJ0003 5314-EXIT. EXIT.                                                         
      *                                                                         
ET0001 5315-NA-SSN1-ONLY.                                                       
           MOVE '5315-NA-SSN1-ONLY           ' TO W-ROUTINE-1.                  
           IF  (W-RCV-SSN1  > SPACE  AND  W-RCV-SSN2 > SPACE)                   
               IF  (W-RCV-SSN1 = W-NA-SSN1  OR  W-RCV-SSN2 = W-NA-SSN1)         
DJ0003            MOVE 'N'      TO W-REJ-SS-JOINT                               
               ELSE                                                             
DJ0003            MOVE 'Y'      TO W-REJ-SS-JOINT                               
               END-IF                                                           
           ELSE                                                                 
           IF  (W-RCV-SSN1 > SPACE  AND  W-RCV-SSN2 NOT > SPACE)                
               IF (W-RCV-SSN1 = W-NA-SSN1)                                      
DJ0003            MOVE 'N'      TO W-REJ-SS-JOINT                               
               ELSE                                                             
DJ0003            MOVE 'Y'      TO W-REJ-SS-JOINT                               
               END-IF                                                           
           ELSE                                                                 
           IF  (W-RCV-SSN1 NOT > SPACE  AND  W-RCV-SSN2 > SPACE)                
               IF (W-RCV-SSN2 = W-NA-SSN1)                                      
DJ0003            MOVE 'N'      TO W-REJ-SS-JOINT                               
               ELSE                                                             
DJ0003            MOVE 'Y'      TO W-REJ-SS-JOINT                               
               END-IF                                                           
           ELSE                                                                 
DJ0003            MOVE 'Y'      TO W-REJ-SS-JOINT                               
           END-IF.                                                              
DJ0003 5315-EXIT. EXIT.                                                         
      *                                                                         
ET0001 5316-NA-SSN2-ONLY.                                                       
           MOVE '5316-NA-SSN2-ONLY           ' TO W-ROUTINE-1.                  
           IF  (W-RCV-SSN1 > SPACE  AND  W-RCV-SSN2 > SPACE)                    
               IF  (W-RCV-SSN1 = W-NA-SSN2  OR  W-RCV-SSN2 = W-NA-SSN2)         
DJ0003            MOVE 'N'      TO W-REJ-SS-JOINT                               
               ELSE                                                             
DJ0003            MOVE 'Y'      TO W-REJ-SS-JOINT                               
               END-IF                                                           
           ELSE                                                                 
           IF  (W-RCV-SSN1 > SPACE  AND  W-RCV-SSN2 NOT > SPACE)                
               IF (W-RCV-SSN1 = W-NA-SSN2)                                      
DJ0003            MOVE 'N'      TO W-REJ-SS-JOINT                               
               ELSE                                                             
DJ0003            MOVE 'Y'      TO W-REJ-SS-JOINT                               
               END-IF                                                           
           ELSE                                                                 
           IF  (W-RCV-SSN1 NOT > SPACE  AND  W-RCV-SSN2 > SPACE)                
               IF (W-RCV-SSN2 = W-NA-SSN2)                                      
DJ0003            MOVE 'N'      TO W-REJ-SS-JOINT                               
               ELSE                                                             
DJ0003            MOVE 'Y'      TO W-REJ-SS-JOINT                               
               END-IF                                                           
           ELSE                                                                 
DJ0003            MOVE 'Y'      TO W-REJ-SS-JOINT                               
           END-IF.                                                              
DJ0003 5316-EXIT. EXIT.                                                         
      /                                                                         
       5320-EDIT-CUST-TYPE.                                                     
           MOVE '5320-EDIT-CUST-TYPE           ' TO W-ROUTINE-1.                
                                                                                
           PERFORM 5322-GET-CUST-TYPE THRU 5322-EXIT.                           
                                                                                
           IF W-CUST-TYPE =  W-NSCC-TI-RCV-ACCT-TYPE                            
              MOVE 'Y'    TO W-CUST-TYPE-SW                                     
              ADD 1 TO W-CUST-TYPE-MATCHED-CNT                                  
           ELSE                                                                 
              MOVE 'N'    TO W-CUST-TYPE-SW                                     
              ADD 1 TO W-CUST-TYPE-UNMATCH-CNT                                  
           END-IF.                                                              
                                                                                
       5320-EXIT. EXIT.                                                         
      /                                                                         
       5322-GET-CUST-TYPE.                                                      
           MOVE '5322-GET-CUST-TYPE            ' TO W-ROUTINE-1.                
                                                                                
           IF  BH-ACAT-DEFAULT-CUSTOMER-TYPE > ' '                              
               MOVE BH-ACAT-DEFAULT-CUSTOMER-TYPE TO W-CUST-TYPE                
           ELSE                                                                 
               MOVE 'SN'                          TO W-CUST-TYPE                
           END-IF.                                                              
                                                                                
           PERFORM 5327-CHECK-IRA-BR-RANGE THRU 5327-EXIT.                      
           IF  W-IRA-BR-RANGE-SW = 'Y'                                          
               CONTINUE                                                         
           ELSE                                                                 
               PERFORM 5328-CHECK-IRA-BR-ACT-RANGE THRU 5328-EXIT               
           END-IF.                                                              
                                                                                
           IF  BH-ACAT-RETIRE-ACT-SUB-CTG-NO > 0                                
           AND NAPPA-IRA-KEOUGH-IND > ' '                                       
               PERFORM 5323-EDIT-IRA-IND THRU 5323-EXIT                         
           ELSE                                                                 
               IF  BH-ACAT-DEFINE-CUSTOMER-TYPE = '0'                           
                   PERFORM 5324-EDIT-CLASS-CODE THRU 5324-EXIT                  
               ELSE                                                             
                   IF  BH-ACAT-DEFINE-CUSTOMER-TYPE = '1'                       
                       PERFORM 5325-EDIT-ADT-CUST-TYPE THRU 5325-EXIT           
                   END-IF                                                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
***********PERFORM 5326-CHECK-RETIRE-RANGE THRU 5326-EXIT.                      
                                                                                
       5322-EXIT. EXIT.                                                         
      /                                                                         
       5323-EDIT-IRA-IND.                                                       
           MOVE '5323-EDIT-IRA-IND             ' TO W-ROUTINE-1.                
                                                                                
           MOVE 'N' TO W-IRA-B1-SW.                                             
           MOVE 1 TO W-SUB1.                                                    
       5323-LOOP.                                                               
           IF  BH-ACAT-RETIRE-ACT-IRA-CODE (W-SUB1) = ' '                       
               GO TO 5323-EXIT                                                  
           END-IF                                                               
           IF  BH-ACAT-RETIRE-ACT-IRA-CODE (W-SUB1) =                           
                                             NAPPA-IRA-KEOUGH-IND               
               MOVE BH-ACAT-RETIRE-ACT-CUST-TYPE (W-SUB1)                       
                                             TO W-CUST-TYPE                     
               MOVE 'Y' TO W-IRA-B1-SW                                          
           END-IF                                                               
           IF  W-SUB1 < BH-ACAT-RETIRE-ACT-SUB-CTG-NO                           
               ADD 1 TO W-SUB1                                                  
               GO TO 5323-LOOP                                                  
           END-IF.                                                              
                                                                                
       5323-EXIT. EXIT.                                                         
      /                                                                         
       5324-EDIT-CLASS-CODE.                                                    
           MOVE '5324-EDIT-CLASS-CODE          ' TO W-ROUTINE-1.                
                                                                                
           MOVE 'N' TO W-CUST-TYPE-B1-SW.                                       
           MOVE 1 TO W-SUB1.                                                    
       5324-LOOP.                                                               
           IF  BH-ACAT-CUST-TYPE-FROM-NA (W-SUB1) = ' '                         
               GO TO 5324-EXIT                                                  
           END-IF                                                               
           IF  BH-ACAT-CUST-TYPE-FROM-NA (W-SUB1)                               
                                           = NAPPA-ACCT-CLASS-EXP               
               MOVE BH-ACAT-CUST-ACCT-TYPE (W-SUB1)                             
                                                 TO W-CUST-TYPE                 
               MOVE 'Y' TO W-CUST-TYPE-B1-SW                                    
           END-IF                                                               
           IF  W-SUB1 < BH-ACAT-CUST-TYPE-VALUE-NO                              
               ADD 1 TO W-SUB1                                                  
               GO TO 5324-LOOP                                                  
           END-IF.                                                              
                                                                                
       5324-EXIT. EXIT.                                                         
      /                                                                         
       5325-EDIT-ADT-CUST-TYPE.                                                 
           MOVE '5325-EDIT-ADT-CUST-TYPE       ' TO W-ROUTINE-1.                
                                                                                
           MOVE NAPPA-ADT-CUSTOMER-TYPE TO W-ADT-CUSTOMER-TYPE-N.               
                                                                                
           IF  BH-ACAT-CUST-TYPE-VALUE-NO = 0                                   
               EVALUATE NAPPA-ADT-CUSTOMER-TYPE                                 
                    WHEN  000     CONTINUE                                      
                    WHEN  001     MOVE 'TR' TO W-CUST-TYPE                      
                    WHEN  003     MOVE 'CU' TO W-CUST-TYPE                      
                    WHEN  004     MOVE 'CO' TO W-CUST-TYPE                      
                    WHEN  008     MOVE 'SN' TO W-CUST-TYPE                      
                    WHEN  011     MOVE 'JT' TO W-CUST-TYPE                      
                    WHEN  012     MOVE 'JT' TO W-CUST-TYPE                      
                    WHEN  013     MOVE 'AG' TO W-CUST-TYPE                      
                    WHEN  015     MOVE 'QP' TO W-CUST-TYPE                      
                    WHEN  018     MOVE 'TR' TO W-CUST-TYPE                      
                    WHEN  021     MOVE 'JT' TO W-CUST-TYPE                      
                    WHEN OTHER    MOVE 'OT' TO W-CUST-TYPE                      
               END-EVALUATE                                                     
               GO TO 5325-EXIT                                                  
           END-IF.                                                              
                                                                                
           MOVE 'N' TO W-CUST-TYPE-B1-SW.                                       
           MOVE 1 TO W-SUB1.                                                    
       5325-LOOP.                                                               
           IF  BH-ACAT-CUST-TYPE-FROM-NA (W-SUB1) = ' '                         
               GO TO 5325-EXIT                                                  
           END-IF                                                               
           IF  BH-ACAT-CUST-TYPE-FROM-NA (W-SUB1)                               
                                           = W-ADT-CUSTOMER-TYPE-X              
               MOVE BH-ACAT-CUST-ACCT-TYPE (W-SUB1)                             
                                                 TO W-CUST-TYPE                 
               MOVE 'Y' TO W-CUST-TYPE-B1-SW                                    
           END-IF                                                               
           IF  W-SUB1 < BH-ACAT-CUST-TYPE-VALUE-NO                              
               ADD 1 TO W-SUB1                                                  
               GO TO 5325-LOOP                                                  
           END-IF.                                                              
                                                                                
       5325-EXIT. EXIT.                                                         
      /                                                                         
*******5326-CHECK-RETIRE-RANGE.                                                 
********** MOVE '5326-CHECK-RETIRE-RANGE     ' TO W-ROUTINE-1.                  
**********                                                                      
********** MOVE 'N' TO W-RETIRE-ACCOUNT-SW.                                     
********** IF  W-SUB1 < BH-ACAT-RETIRE-ACCOUNTS-NO                              
**********     GO TO 5326-EXIT                                                  
********** END-IF.                                                              
**********                                                                      
********** MOVE 1 TO W-SUB1.                                                    
*******5326-LOOP.                                                               
********** IF  BH-ACAT-RETIRE-ACCOUNTS-LO (W-SUB1) = ' '                        
**********     GO TO 5326-EXIT                                                  
********** END-IF.                                                              
********** IF  W-BRN-ACCT >= BH-ACAT-RETIRE-ACCOUNTS-LO (W-SUB1) AND            
**********     W-BRN-ACCT <= BH-ACAT-RETIRE-ACCOUNTS-HI (W-SUB1)                
**********     MOVE 'IR'  TO W-CUST-TYPE                                        
**********     MOVE 'Y' TO W-RETIRE-ACCOUNT-SW                                  
********** ELSE                                                                 
**********     IF  W-SUB1 < BH-ACAT-RETIRE-ACCOUNTS-NO                          
**********         ADD 1 TO W-SUB1                                              
**********     GO TO 5326-LOOP                                                  
********** END-IF.                                                              
**********                                                                      
*******5326-EXIT. EXIT.                                                         
      /                                                                         
       5327-CHECK-IRA-BR-RANGE.                                                 
           MOVE '5327-CHECK-IRA-BR-RANGE     ' TO W-ROUTINE-1.                  
                                                                                
           MOVE 'N' TO W-IRA-BR-RANGE-SW.                                       
           IF  BH-MGCA-IRA-BR-RANGE-NO = 0                                      
               GO TO 5327-EXIT.                                                 
           MOVE 1 TO W-SUB1.                                                    
       5327-LOOP.                                                               
           IF  W-BRN-ACCT >= BH-MGCA-IRA-BR-RANGE-LO (W-SUB1) AND               
               W-BRN-ACCT <= BH-MGCA-IRA-BR-RANGE-HI (W-SUB1)                   
               MOVE 'IR'  TO W-CUST-TYPE                                        
               MOVE 'Y' TO W-IRA-BR-RANGE-SW                                    
           ELSE                                                                 
               IF  W-SUB1 < BH-MGCA-IRA-BR-RANGE-NO                             
                   ADD 1 TO W-SUB1                                              
               GO TO 5327-LOOP                                                  
           END-IF.                                                              
                                                                                
       5327-EXIT. EXIT.                                                         
      /                                                                         
       5328-CHECK-IRA-BR-ACT-RANGE.                                             
           MOVE '5328-CHECK-IRA-BR-ACT-RANGE     ' TO W-ROUTINE-1.              
                                                                                
           MOVE 'N' TO W-IRA-BR-ACT-RANGE-SW.                                   
           IF  BH-MGCA-IRA-BR-ACT-RANGE-NO = 0                                  
               GO TO 5328-EXIT.                                                 
           MOVE 1 TO W-SUB1.                                                    
       5328-LOOP.                                                               
           IF  (W-BRANCH-CD >= BH-MGCA-IRA-BR-ACT-BR-LO  (W-SUB1) AND           
                W-BRANCH-CD <= BH-MGCA-IRA-BR-ACT-BR-HI  (W-SUB1))              
           AND (W-ACCT-CD   >= BH-MGCA-IRA-BR-ACT-ACT-LO (W-SUB1) AND           
                W-ACCT-CD   <= BH-MGCA-IRA-BR-ACT-ACT-HI (W-SUB1))              
                  MOVE 'IR'  TO W-CUST-TYPE                                     
                  MOVE 'Y' TO W-IRA-BR-ACT-RANGE-SW                             
           ELSE                                                                 
               IF  W-SUB1 < BH-MGCA-IRA-BR-ACT-RANGE-NO                         
                   ADD 1 TO W-SUB1                                              
               GO TO 5328-LOOP                                                  
           END-IF.                                                              
                                                                                
       5328-EXIT. EXIT.                                                         
      /                                                                         
       5340-CALC-IRA-AGE.                                                       
      * CHECK IF IRA AGE IS > 70 1/2 ONLY IF B1 (434563) IS ON.                 
      * THIS ROUTINE NEEDS W-CUST-TYPE FROM 5320-EDIT-CUST-TYPE                 
                                                                                
           IF  BH-ACAT-REJ-PEND-DEL-IRA-IND = '1'                               
           AND (W-CUST-TYPE             = 'IR' OR 'RI' OR 'SI')                 
               CONTINUE                                                         
           ELSE                                                                 
               GO TO 5340-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF  NAPPA-DATE-OF-BIRTH = 0                                          
               GO TO 5340-EXIT                                                  
           END-IF.                                                              
                                                                                
           MOVE W-BPD-PROC-DATE          TO W-CALC-PROC-DATE                    
                                                                                
           IF  W-CALC-PROC-MM < 6                                               
               COMPUTE W-CALC-PROC-MM   = W-CALC-PROC-MM   + 12                 
               COMPUTE W-CALC-PROC-YEAR = W-CALC-PROC-YEAR -  1                 
           END-IF.                                                              
                                                                                
           COMPUTE W-AGE70-YEAR = W-CALC-PROC-YEAR - 70.                        
           COMPUTE W-AGE70-MM = W-CALC-PROC-MM  - 6.                            
           COMPUTE W-AGE70-DD = W-CALC-PROC-DD                                  
                                                                                
           MOVE NAPPA-DATE-OF-BIRTH TO W-BIRTH-DATE.                            
                                                                                
           IF  W-BIRTH-DATE > W-AGE70                                           
               MOVE 'N'              TO ACCT-CUST-70-IND   OF DCLVTRNFR         
           ELSE                                                                 
                           DISPLAY 'INP=' W-INFILE-CNT                          
                                      ' ' W-NSCC-KEY-CLIENT-NBR                 
                                      ' ' W-NSCC-TI-ACAT-CTL-NBR                
                                      ' ' W-NSCC-TI-TFR-TYPE                    
                                  ' TRN=' W-NSCC-TI-TRAN-TYPE                   
                      ' ' W-BRN-ACCT                                            
                       ' BIRTH-DATE=' W-BIRTH-DATE                              
                       ' < ' W-AGE70 '(W-AGE70-70.5).'                          
                       ' OLDER THAN 70 1/2'                                     
               MOVE 'Y' TO W-REJ-IRA                                            
               MOVE 'Y'              TO ACCT-CUST-70-IND   OF DCLVTRNFR         
               IF  BH-ACAT-REJ-PEND-DEL-IRA-CODE > '00'                         
DJ0010                     DISPLAY 'INP=' W-INFILE-CNT                          
DJ0010                                ' ' W-NSCC-KEY-CLIENT-NBR                 
DJ0010                                ' ' W-NSCC-TI-ACAT-CTL-NBR                
DJ0010                       ' W-REJ-IRA FLAGGED TO BE REJECTED'                
                   MOVE 'Y' TO W-REJECT-AUTO-SW                                 
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5340-EXIT. EXIT.                                                         
      /                                                                         
DJ0010 5350-ADTS-DOCUMENT.                                                      
DJ0010     MOVE '5350-ADTS-DOCUMENT             ' TO W-ROUTINE-1.               
DJ0010***FOR RBC DAIN:                                                          
DJ0010***IF  ACCOUNT IS AN IRA ACCOUNT(B1#434535),                              
DJ0010***AND TRANSFER IS A "FUL" DELIVERY,                                      
DJ0010***AND CLIENT IS AN ADTS CLIENT(B1#501282),                               
DJ0010***    (B1#501282 = BTS DOCUMENT TRACKING SYSTEM)                         
DJ0010***    (B1#501282 = BH-BTS-COMMOD-INQUIRY)                                
DJ0010***AND NEW B1 IS ON,                                                      
DJ0010***THEN B1-DOCUMENT MUST BE ON THE ADTS FILE.                             
DJ0010***                                                                       
DJ0010***IF B1-DOCUMENT IS NOT ON THE ADTS FILE,                                
DJ0010***REJECT OR PEND THE TRANSFER BASED ON THE VALUE IN THE NEW B1.          
DJ0010***                                                                       
DJ0010***NEW B1:                                                                
DJ0010***  FORMAT: TT-DDDD-RR-CCC(TOTAL OF 45 OCCURENCES)                       
DJ0010***  TT   = USE ADP CUSTOMER ACCOUNT TYPE FROM NAME/ADDRESS               
DJ0010***  DDDD = DOCUMENT CODE FROM ADTS                                       
DJ0010***  RR   = 00 - DO NOT REJECT, ## - REJECT (##=REJECT-CODE)              
DJ0010***  CCC  = COMMENT                                                       
DJ0010                                                                          
DJ0010     IF  BH-BTS-COMMOD-INQUIRY = '1'                                      
DJ0010     AND W-NSCC-TI-TFR-TYPE = 'FUL'                                       
DJ0010         PERFORM 5351-READ-ADTCUS THRU 5351-EXIT                          
DJ0010         IF  ADTCUS-FOUND                                                 
DJ0010             PERFORM 5352-ADTS-FOUND THRU 5352-EXIT                       
DJ0010         ELSE                                                             
DJ0010             PERFORM 5353-ADTS-NOT-FOUND THRU 5353-EXIT                   
DJ0010         END-IF                                                           
DJ0010     END-IF.                                                              
DJ0010                                                                          
DJ0010 5350-EXIT. EXIT.                                                         
      /                                                                         
DJ0010 5351-READ-ADTCUS.                                                        
DJ0010     MOVE '5351-READ-ADTCUS              ' TO W-ROUTINE-1.                
DJ0010                                                                          
DJ0010     MOVE SPACES                     TO  ADT1CUS-KEY.                     
DJ0010     MOVE W-NSCC-KEY-CLIENT-NBR(2:3) TO  ADT1CUSK-CLIENT.                 
DJ0010     MOVE W-BRANCH-CD                TO  ADT1CUSK-BRANCH.                 
DJ0010     MOVE W-ACCT-CD                  TO  ADT1CUSK-ACCT.                   
DJ0010                                                                          
DJ0010     READ ADTCUS.                                                         
DJ0010     ADD 1 TO W-ADTCUS-CNT.                                               
DJ0010                                                                          
DJ0010 5351-EXIT. EXIT.                                                         
      /                                                                         
DJ0010 5352-ADTS-FOUND.                                                         
DJ0010     MOVE '5352-ADTS-FOUND             ' TO W-ROUTINE-1.                  
DJ0010                                                                          
DJ0010     MOVE ' ' TO WS-LAST-ADTS-DOC-CODE                                    
DJ0010                 WS-LAST-ADTS-REJ-CODE                                    
DJ0010                 WS-LAST-ADTS-REJ-CMNT                                    
DJ0010     MOVE 1 TO W-SUB1.                                                    
DJ0010     SET W-ADTCUS-DOC-MISSING TO TRUE.                                    
DJ0010                                                                          
DJ0010 5352-LOOP.                                                               
DJ0010     IF  W-CUST-TYPE      = BH-ACAT-ADTS-DOCUM-EDIT-TT (W-SUB1)           
DJ0010     AND BH-ACAT-ADTS-DOCUM-EDIT-DDDD (W-SUB1) > ' '                      
DJ0010         SET W-ADTCUS-DOC-MISSING TO TRUE                                 
DJ0010                                                                          
DJ0010         PERFORM VARYING W-SUB2 FROM 1 BY 1                               
DJ0010           UNTIL W-ADTCUS-DOC-FOUND                                       
DJ0010              OR W-SUB2 > ADT1CUSD-DOC-COUNT OR W-SUB2 > 120              
DJ0010                 IF ADT1CUSD-DOC-CODE (W-SUB2) =                          
DJ0010                            BH-ACAT-ADTS-DOCUM-EDIT-DDDD(W-SUB1)  1)      
DJ0010                    IF ADT1CUSD-DOC-MISSING-NO (W-SUB2)                   
DJ0010                       SET W-ADTCUS-DOC-FOUND TO TRUE                     
DJ0010                     DISPLAY 'INP=' W-INFILE-CNT                          
DJ0010                                ' ' W-NSCC-KEY-CLIENT-NBR                 
DJ0010                                ' ' W-NSCC-TI-ACAT-CTL-NBR                
DJ0010                        ' ' W-BRANCH-CD                                   
DJ0010                        ' ' W-ACCT-CD                                     
DJ0010                        ' ' W-CUST-TYPE                                   
DJ0010                        ' ADTS DOC-FOUND  '                               
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-DDDD(W-SUB1)          
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-RR (W-SUB1)           
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-DESC(W-SUB1)          
DJ0010                    END-IF                                                
DJ0010                 END-IF                                                   
DJ0010         END-PERFORM                                                      
DJ0010                                                                          
DJ0010**-----DOCUMENT IS MISSING                                                
DJ0010**-----IF REJECT CODE IS ON, SET REJECT                                   
DJ0010**-----IF REJECT CODE NOT ON, DO WARNING                                  
DJ0010         IF W-ADTCUS-DOC-MISSING                                          
DJ0010            IF BH-ACAT-ADTS-DOCUM-EDIT-RR (W-SUB1) > '00'                 
DJ0010               MOVE BH-ACAT-ADTS-DOCUM-EDIT-DDDD(W-SUB1)                  
DJ0010                 TO WS-LAST-ADTS-DOC-CODE                                 
DJ0010               MOVE BH-ACAT-ADTS-DOCUM-EDIT-RR (W-SUB1)                   
DJ0010                 TO WS-LAST-ADTS-REJ-CODE                                 
DJ0010               MOVE BH-ACAT-ADTS-DOCUM-EDIT-DESC(W-SUB1)                  
DJ0010                 TO WS-LAST-ADTS-REJ-CMNT                                 
DJ0010               MOVE 'Y' TO W-REJECT-AUTO-SW                               
DJ0010               MOVE 'Y' TO W-REJ-ADTS                                     
DJ0010               MOVE 'N' TO ADOPT-AGRMT-IND    OF DCLVTRNFR                
DJ0010               DISPLAY 'INP=' W-INFILE-CNT                                
DJ0010                                ' ' W-NSCC-KEY-CLIENT-NBR                 
DJ0010                                ' ' W-NSCC-TI-ACAT-CTL-NBR                
DJ0010                        ' ' W-BRANCH-CD                                   
DJ0010                        ' ' W-ACCT-CD                                     
DJ0010                        ' ' W-CUST-TYPE                                   
DJ0010                        ' ADTS DOC-MISSING'                               
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-DDDD(W-SUB1)          
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-RR (W-SUB1)           
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-DESC(W-SUB1)          
DJ0010            ELSE                                                          
DJ0010               MOVE 'Y' TO W-REJ-ADTS                                     
DJ0010               MOVE 'N' TO ADOPT-AGRMT-IND    OF DCLVTRNFR                
DJ0010               DISPLAY 'INP=' W-INFILE-CNT                                
DJ0010                                ' ' W-NSCC-KEY-CLIENT-NBR                 
DJ0010                                ' ' W-NSCC-TI-ACAT-CTL-NBR                
DJ0010                        ' ' W-BRANCH-CD                                   
DJ0010                        ' ' W-ACCT-CD                                     
DJ0010                        ' ' W-CUST-TYPE                                   
DJ0010                        ' ADTS DOC-WARNING'                               
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-DDDD(W-SUB1)          
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-RR (W-SUB1)           
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-DESC(W-SUB1)          
DJ0010            END-IF                                                        
DJ0010         END-IF                                                           
DJ0010     END-IF                                                               
DJ0010                                                                          
DJ0010     IF  W-SUB1 < BH-ACAT-ADTS-DOCUM-EDIT-NO                              
DJ0010         ADD 1 TO W-SUB1                                                  
DJ0010         GO TO 5352-LOOP                                                  
DJ0010     END-IF.                                                              
DJ0010                                                                          
DJ0010 5352-EXIT. EXIT.                                                         
      /                                                                         
DJ0010 5353-ADTS-NOT-FOUND.                                                     
DJ0010     MOVE '5353-ADTS-NOT-FOUND           ' TO W-ROUTINE-1.                
DJ0010                                                                          
DJ0010     MOVE ' ' TO WS-LAST-ADTS-DOC-CODE                                    
DJ0010                 WS-LAST-ADTS-REJ-CODE                                    
DJ0010                 WS-LAST-ADTS-REJ-CMNT                                    
DJ0010     MOVE 1 TO W-SUB1.                                                    
DJ0010                                                                          
DJ0010 5353-LOOP.                                                               
DJ0010     IF  W-CUST-TYPE = BH-ACAT-ADTS-DOCUM-EDIT-TT (W-SUB1)                
DJ0010     AND BH-ACAT-ADTS-DOCUM-EDIT-DDDD(W-SUB1) > ' '                       
DJ0010                                                                          
DJ0010         IF BH-ACAT-ADTS-DOCUM-EDIT-RR (W-SUB1) > '00'                    
DJ0010               MOVE BH-ACAT-ADTS-DOCUM-EDIT-DDDD(W-SUB1)                  
DJ0010                 TO WS-LAST-ADTS-DOC-CODE                                 
DJ0010               MOVE BH-ACAT-ADTS-DOCUM-EDIT-RR (W-SUB1)                   
DJ0010                 TO WS-LAST-ADTS-REJ-CODE                                 
DJ0010               MOVE BH-ACAT-ADTS-DOCUM-EDIT-DESC(W-SUB1)                  
DJ0010                 TO WS-LAST-ADTS-REJ-CMNT                                 
DJ0010               MOVE 'Y' TO W-REJECT-AUTO-SW                               
DJ0010               MOVE 'Y' TO W-REJ-ADTS                                     
DJ0010               MOVE 'N' TO ADOPT-AGRMT-IND    OF DCLVTRNFR                
DJ0010               DISPLAY 'INP=' W-INFILE-CNT                                
DJ0010                                ' ' W-NSCC-KEY-CLIENT-NBR                 
DJ0010                                ' ' W-NSCC-TI-ACAT-CTL-NBR                
DJ0010                        ' ' W-BRANCH-CD                                   
DJ0010                        ' ' W-ACCT-CD                                     
DJ0010                        ' ' W-CUST-TYPE                                   
DJ0010                        ' ADTS DOC-MISSIN2'                               
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-DDDD(W-SUB1)          
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-RR (W-SUB1)           
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-DESC(W-SUB1)          
DJ0010         ELSE                                                             
DJ0010               MOVE 'Y' TO W-REJ-ADTS                                     
DJ0010               MOVE 'N' TO ADOPT-AGRMT-IND    OF DCLVTRNFR                
DJ0010               DISPLAY 'INP=' W-INFILE-CNT                                
DJ0010                                ' ' W-NSCC-KEY-CLIENT-NBR                 
DJ0010                                ' ' W-NSCC-TI-ACAT-CTL-NBR                
DJ0010                        ' ' W-BRANCH-CD                                   
DJ0010                        ' ' W-ACCT-CD                                     
DJ0010                        ' ' W-CUST-TYPE                                   
DJ0010                        ' ADTS DOC-WARNIN2'                               
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-DDDD(W-SUB1)          
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-RR (W-SUB1)           
DJ0010                        ' ' BH-ACAT-ADTS-DOCUM-EDIT-DESC(W-SUB1)          
DJ0010         END-IF                                                           
DJ0010     END-IF                                                               
DJ0010                                                                          
DJ0010     IF  W-SUB1 < BH-ACAT-ADTS-DOCUM-EDIT-NO                              
DJ0010     AND (W-REJ-ADTS NOT = 'Y')                                           
DJ0010         ADD 1 TO W-SUB1                                                  
DJ0010         GO TO 5353-LOOP                                                  
DJ0010     END-IF.                                                              
DJ0010                                                                          
DJ0010 5353-EXIT. EXIT.                                                         
      /                                                                         
LRM005 5380-CHECK-VRSDBLK.                                                      
           MOVE '5380-CHECK-VRSDBLK            ' TO W-ROUTINE-1.                
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,BLOCK_CD                                                    
                   ,CMNT_TXT                                                    
               INTO                                                             
                    :DCLVRSDBLK.CLIENT-NBR                                      
                   ,:DCLVRSDBLK.BLOCK-CD                                        
                   ,:DCLVRSDBLK.CMNT-TXT                                        
               FROM VRSDBLK                                                     
              WHERE CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR                  
                AND BRANCH_CD         = :W-BRANCH-CD                            
                AND ACCT_CD           = :W-ACCT-CD                              
                AND RCV_NBR           = :W-NSCC-TI-RCV-NBR                      
                AND BLOCK_CD = 'R'                                              
                AND NOT ACTION_CD = 'D'                                         
           END-EXEC                                                             
           IF  SQLCODE  =  +0                                                   
           AND (BH-ACAT-CLIENT-RESCIND-IND =  '1' OR '2')                       
                   ADD 1 TO W-RESCIND-BLOCK-CNT                                 
                   MOVE 'Y'          TO ACCT-CLT-RSCND-IND OF DCLVTRNFR         
                   MOVE CMNT-TXT OF DCLVRSDBLK TO                               
                                        CMNT-TXT           OF DCLVTRNFR         
              IF BH-ACAT-CLIENT-RESCIND-IND = '2'                               
                   MOVE 'Y' TO W-REJECT-AUTO-SW                                 
              END-IF                                                            
              DISPLAY 'FOUND CLIENT RESCIND '                                   
                     W-NSCC-KEY-CLIENT-NBR                                      
                 ' ' W-BRANCH-CD                                                
                 ' ' W-ACCT-CD                                                  
                 ' ' W-NSCC-TI-RCV-NBR                                          
           ELSE                                                                 
                   MOVE 'N'          TO ACCT-CLT-RSCND-IND OF DCLVTRNFR         
           END-IF.                                                              
                                                                                
           EXEC SQL SELECT                                                      
                    CLIENT_NBR                                                  
                   ,BLOCK_CD                                                    
                   ,CMNT_TXT                                                    
               INTO                                                             
                    :DCLVRSDBLK.CLIENT-NBR                                      
                   ,:DCLVRSDBLK.BLOCK-CD                                        
                   ,:DCLVRSDBLK.CMNT-TXT                                        
               FROM VRSDBLK                                                     
              WHERE CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR                  
                AND BRANCH_CD         = :W-BRANCH-CD                            
                AND ACCT_CD           = :W-ACCT-CD                              
                AND BLOCK_CD = 'L'                                              
                AND NOT ACTION_CD = 'D'                                         
           END-EXEC                                                             
           IF  SQLCODE  =  +0                                                   
           AND (BH-ACAT-LEGAL-BLOCK-IND = '1' OR '2')                           
                   ADD 1 TO W-LEGAL-BLOCK-CNT                                   
                   MOVE 'Y'          TO ACCT-LGL-BLK-IND   OF DCLVTRNFR         
                   MOVE CMNT-TXT OF DCLVRSDBLK TO                               
                                        CMNT-TXT           OF DCLVTRNFR         
              IF BH-ACAT-LEGAL-BLOCK-IND = '2'                                  
                   MOVE 'Y' TO W-REJECT-AUTO-SW                                 
              END-IF                                                            
              DISPLAY 'FOUND LEGAL BLOCK '                                      
                     W-NSCC-KEY-CLIENT-NBR                                      
                 ' ' W-BRANCH-CD                                                
                 ' ' W-ACCT-CD                                                  
           ELSE                                                                 
                   MOVE 'N'          TO ACCT-LGL-BLK-IND   OF DCLVTRNFR         
           END-IF.                                                              
                                                                                
       5380-EXIT. EXIT.                                                         
      /                                                                         
       5400-SELECT-VTRNFR.                                                      
           MOVE '5400-SELECT-VTRNFR               ' TO W-ROUTINE-1.             
                                                                                
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
LRM005             ,ACCT_RB_SEC_IND                                             
LRM005             ,ACCT_CLT_RSCND_IND                                          
LRM005             ,ACCT_LGL_BLK_IND                                            
DJ0009             ,FRV_MFC_CMPLT_IND                                           
DJ0009             ,ACCT_FRZN_IND                                               
DJ0009             ,BRANCH_ALTNT_CD                                             
DJ0009             ,GIFT_IND                                                    
DJ0009             ,RSTR_TRD_90_DY_IND                                          
DJ0009             ,REG_T_IND                                                   
DJ0009             ,ADOPT_AGRMT_IND                                             
DJ0009             ,RR_ORGNL_CD                                                 
LRM012             ,CVRSN_ACCT_NBR                                              
LRM026             ,TRNFR_STTS_110_IND                                          
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
LRM005              ,:DCLVTRNFR.ACCT-RB-SEC-IND                                 
LRM005              ,:DCLVTRNFR.ACCT-CLT-RSCND-IND                              
LRM005              ,:DCLVTRNFR.ACCT-LGL-BLK-IND                                
DJ0009              ,:DCLVTRNFR.FRV-MFC-CMPLT-IND                               
DJ0009              ,:DCLVTRNFR.ACCT-FRZN-IND                                   
DJ0009              ,:DCLVTRNFR.BRANCH-ALTNT-CD                                 
DJ0009              ,:DCLVTRNFR.GIFT-IND                                        
DJ0009              ,:DCLVTRNFR.RSTR-TRD-90-DY-IND                              
DJ0009              ,:DCLVTRNFR.REG-T-IND                                       
DJ0009              ,:DCLVTRNFR.ADOPT-AGRMT-IND                                 
DJ0009              ,:DCLVTRNFR.RR-ORGNL-CD                                     
LRM012              ,:DCLVTRNFR.CVRSN-ACCT-NBR                                  
LRM026              ,:DCLVTRNFR.TRNFR-STTS-110-IND                              
               FROM  VTRNFR                                                     
               WHERE CLIENT_NBR       = :W-NSCC-KEY-CLIENT-NBR                  
                 AND ACAT_CONTROL_NBR = :W-NSCC-ACAT-CTL-NBR                    
           END-EXEC                                                             
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNFR-FND-CNT                                        
               MOVE 'Y'                TO W-TRANSFER-FND-SW                     
               MOVE STTS-CD OF DCLVTRNFR TO W-SAVE-STTS-CD                      
                           DISPLAY 'INP=' W-INFILE-CNT                          
                                      ' ' W-NSCC-KEY-CLIENT-NBR                 
                                      ' ' W-NSCC-TI-ACAT-CTL-NBR                
                                      ' ' W-NSCC-TI-TFR-TYPE                    
                                  ' TRN=' W-NSCC-TI-TRAN-TYPE                   
                        ' STA=' W-NSCC-STATUS                                   
                        ' VTRNFR FOUND'                                         
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                        ' ACC=' BRANCH-CD OF DCLVTRNFR                          
                                ACCT-CD   OF DCLVTRNFR                          
LRM026         MOVE PRCS-DT OF DCLVTRNFR TO W-SAVE-PRCS-DT                      
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-FND-CNT                                    
               MOVE 'N'                TO W-TRANSFER-FND-SW                     
               MOVE ' '                TO W-SAVE-STTS-CD                        
               IF  W-NSCC-TI-TRAN-TYPE = 'A'                                    
                   CONTINUE                                                     
               ELSE                                                             
                           DISPLAY 'INP=' W-INFILE-CNT                          
                                      ' ' W-NSCC-KEY-CLIENT-NBR                 
                                      ' ' W-NSCC-TI-ACAT-CTL-NBR                
                                      ' ' W-NSCC-TI-TFR-TYPE                    
                                  ' TRN=' W-NSCC-TI-TRAN-TYPE                   
                                  ' STA=' W-NSCC-STATUS                         
                                        ' VTRNFR NOT FOUND'                     
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5400-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR TRANSFER NOT ON ACTIVE-TABLE,                                      
      *  ADD THE NEW ROW TO THE ACTIVE-TABLE                                    
      *****************************************************************         
       5600-INSERT-ACTIVE.                                                      
           MOVE '5600-INSERT-ACTIVE           ' TO W-ROUTINE-1.                 
                                                                                
***********DISPLAY '5600-INSERT-ACTIVE'.                                        
                                                                                
           IF  W-TRANSFER-FND-SW = 'Y'                                          
               PERFORM 5610-UPDATE-ACTIVE      THRU 5610-EXIT                   
               GO TO 5600-EXIT                                                  
           END-IF                                                               
                                                                                
           PERFORM 6200-INSERT-VTRNFR     THRU 6200-EXIT                        
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNFR-ADD-CNT                                        
DJ0001         PERFORM 7100-SQL-COMMIT THRU 7100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-ADD-CNT                                    
               DISPLAY '  '     ' VTRNFR NOT ADDED.'                            
                        ' PRIMARY KEY:'                                         
                        ' CLT=' W-NSCC-KEY-CLIENT-NBR                           
                        ' CTL=' W-NSCC-TI-ACAT-CTL-NBR                          
                                ' SQLCODE = ' W-DB2-SQLCODE                     
               IF  SQLCODE  =  -803                                             
                   DISPLAY '   BYPASSING DUPE ON VTRNFR. NOT ADDED.'            
                             ' UPDATE IT'                                       
                       PERFORM 5610-UPDATE-ACTIVE      THRU 5610-EXIT           
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT513: ERROR INSERTING A ROW INTO VTRNFR'          
                        ' (ACAT-TRNFR TABLE)'                                   
                   DISPLAY 'CAT513: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT513: DCLVTRNFR  ='                               
                        '(' DCLVTRNFR ')'                                       
                          PERFORM 7900-DISPLAY-KEY     THRU 7900-EXIT           
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5600-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  IF VTRNFR ALREADY EXIST, UPDATE IT                                     
      *****************************************************************         
       5610-UPDATE-ACTIVE.                                                      
                                                                                
           PERFORM 6300-UPDATE-VTRNFR       THRU 6300-EXIT.                     
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNFR-UPD-CNT                                        
DJ0001         PERFORM 7100-SQL-COMMIT THRU 7100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-UPD-CNT                                    
                   DISPLAY '   VTRNFR NOT UPDATED.'                             
                           ' PRIMARY KEY:'                                      
                           ' CLT=' W-NSCC-KEY-CLIENT-NBR                        
                           ' CTL=' W-NSCC-TI-ACAT-CTL-NBR                       
                           ' SQLCODE = ' W-DB2-SQLCODE                          
                   PERFORM 7900-DISPLAY-KEY     THRU 7900-EXIT                  
                   DISPLAY '   VTRNFR  UPDATE KEY:'                             
                           ' CLT=' W-NSCC-KEY-CLIENT-NBR                        
                           ' CTL=' W-NSCC-TI-ACAT-CTL-NBR                       
                           ' RCV=' W-NSCC-TI-RCV-NBR                            
                           ' DLV=' W-NSCC-TI-DEL-NBR                            
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT513: ERROR UPDATING A ROW IN VTRNFR'             
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT513: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT513: DCLVTRNFR  ='                               
                           '(' DCLVTRNFR ')'                                    
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT                       
           END-IF.                                                              
                                                                                
       5610-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR CHANGES,                                                           
      *  UPDATE THE ROW IN THE ACTIVE-TABLE                                     
      *  WITH THE FIELDS FROM THE NSCC FILE                                     
      *****************************************************************         
       5700-UPDATE-ACTIVE.                                                      
           MOVE '5700-UPDATE-ACTIVE            ' TO W-ROUTINE-1.                
                                                                                
           PERFORM 6300-UPDATE-VTRNFR       THRU 6300-EXIT.                     
                                                                                
           IF  W-TRANSFER-FND-SW = 'Y'                                          
               CONTINUE                                                         
           ELSE                                                                 
               DISPLAY '   5700: VTRNFR NOT FOUND. INSERT IT.'                  
               PERFORM 5710-INSERT-ACTIVE THRU 5710-EXIT                        
               GO TO 5700-EXIT                                                  
           END-IF                                                               
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNFR-UPD-CNT                                        
DJ0001         PERFORM 7100-SQL-COMMIT THRU 7100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-UPD-CNT                                    
               DISPLAY '  '     ' VTRNFR NOT UPDATED.'                          
                        ' PRIMARY KEY:'                                         
                        ' CLT=' W-NSCC-KEY-CLIENT-NBR                           
                        ' CTL=' W-NSCC-TI-ACAT-CTL-NBR                          
                                    ' SQLCODE = ' W-DB2-SQLCODE                 
               DISPLAY '   '                                                    
                      'VTRNFR  UPDATE KEY:'                                     
                        ' CLT=' W-NSCC-KEY-CLIENT-NBR                           
                        ' CTL=' W-NSCC-TI-ACAT-CTL-NBR                          
                        ' RCV=' W-NSCC-TI-RCV-NBR                               
                        ' DLV=' W-NSCC-TI-DEL-NBR                               
               IF  SQLCODE  =  +100                                             
                   DISPLAY '   BYPASSING VTRNFR UPDATE NOT FOUND.'              
                             ' INSERT IT.'                                      
                   PERFORM 5710-INSERT-ACTIVE THRU 5710-EXIT                    
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT513: ERROR UPDATING A ROW IN VTRNFR'             
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT513: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT513: DCLVTRNFR  ='                               
                           '(' DCLVTRNFR ')'                                    
                          PERFORM 7900-DISPLAY-KEY     THRU 7900-EXIT           
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5700-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  IF UPDATE NOT FOUND, INSERT IT                                         
      *****************************************************************         
       5710-INSERT-ACTIVE.                                                      
                                                                                
           PERFORM 6200-INSERT-VTRNFR     THRU 6200-EXIT                        
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-VTRNFR-ADD-CNT                                        
DJ0001         PERFORM 7100-SQL-COMMIT THRU 7100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-VTRNFR-NOT-ADD-CNT                                    
                   DISPLAY '  '     ' VTRNFR NOT ADDED.'                        
                        ' PRIMARY KEY:'                                         
                        ' CLT=' W-NSCC-KEY-CLIENT-NBR                           
                        ' CTL=' W-NSCC-TI-ACAT-CTL-NBR                          
                                    ' SQLCODE = ' W-DB2-SQLCODE                 
                   PERFORM 7900-DISPLAY-KEY     THRU 7900-EXIT                  
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT513: ERROR INSERTING A ROW INTO VTRNFR'          
                        ' (ACAT-TRNFR TABLE)'                                   
                   DISPLAY 'CAT513: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT513: DCLVTRNFR  ='                               
                        '(' DCLVTRNFR ')'                                       
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT                       
           END-IF.                                                              
                                                                                
       5710-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR INIT-TABLE TRANSFER THAT WAS MOVED TO ACTIVE TABLE,                
      *  DELETE THE ROW FROM THE INIT-TABLE                                     
      *****************************************************************         
       5800-DELETE-INIT.                                                        
           MOVE '5800-DELETE-INIT              ' TO W-ROUTINE-1.                
                                                                                
***********DISPLAY '5800-DELETE-INIT'.                                          
                                                                                
           IF  W-NSCC-TI-TRAN-TYPE    = 'C'                                     
           AND  W-NSCC-ACAT-CTL-NBR > SPACES                                    
              EXEC SQL                                                          
                DELETE FROM ACTITRF                                             
                WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR               
                  AND ACAT_CONTROL_NBR   = :W-NSCC-ACAT-CTL-NBR                 
                END-EXEC                                                        
                MOVE SQLERRD(3)          TO W-SQLERRD-3                         
                MOVE W-SQLERRD-3         TO W-SQL-DELETE-COUNT                  
                DISPLAY 'ACTITRF CHANGE DELETE ' W-SQL-DELETE-COUNT             
           ELSE                                                                 
              EXEC SQL                                                          
                DELETE FROM ACTITRF                                             
                WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR               
                  AND  RCV_NBR           = :W-NSCC-TI-RCV-NBR                   
                  AND  DLVR_NBR          = :W-NSCC-TI-DEL-NBR                   
                  AND  ACCT_RCV_NBR      = :W-NSCC-TI-RCV-ACCT-NBR              
                  AND  ACCT_DLVR_NBR     = :W-NSCC-TI-DEL-ACCT-NBR              
                  AND  TRNFR_TYPE_CD     = :W-NSCC-TI-TFR-TYPE                  
                  AND  TRANS_RFRN_ID_CD  = :W-NSCC-TI-TRAN-REF-ID               
              END-EXEC                                                          
           END-IF.                                                              
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'DELETE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTITRF-DEL-CNT                                       
DJ0001         PERFORM 7100-SQL-COMMIT THRU 7100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-ACTITRF-NOT-DEL-CNT                                   
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-NSCC-KEY-CLIENT-NBR                             
                          ' ' W-NSCC-TI-ACAT-CTL-NBR                            
                              ' INIT NOT DEL.'                                  
                              ' ' W-NSCC-TI-TRAN-TYPE                           
                              ' ' W-NSCC-TI-TFR-TYPE                            
                              ' ' W-NSCC-TI-RCV-NBR                             
                              ' ' W-NSCC-TI-RCV-ACCT-NBR                        
                              ' ' W-NSCC-TI-DEL-NBR                             
                              ' ' W-NSCC-TI-DEL-ACCT-NBR                        
               IF  SQLCODE  =  +100                                             
                   CONTINUE                                                     
               ELSE                                                             
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT513: ERROR DELETING A ROW IN ACTITRF'            
                         ' (ACAT-INIT-TRNFR TABLE)'                             
                   DISPLAY 'CAT513: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT513: DCLACTITRF='                                
                           '(' DCLACTITRF ')'                                   
                          PERFORM 7900-DISPLAY-KEY     THRU 7900-EXIT           
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5800-EXIT. EXIT.                                                         
      /                                                                         
      *****************************************************************         
      *  FOR TRANSFER THAT ARE REJECTED                                         
      *  ADD THE NEW ROW TO THE INIT-TABLE                                      
      *****************************************************************         
       5900-INSERT-ACTITRF.                                                     
           MOVE '5900-INSERT-ACTITRF         ' TO W-ROUTINE-1.                  
                                                                                
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
DJ0009     MOVE GIFT-IND           OF DCLVTRNFR                                 
DJ0009                             TO GIFT-IND           OF DCLACTITRF          
                                                                                
           IF  TRNFR-TYPE-CD OF DCLVTRNFR = 'FUL'                               
               MOVE TRANS-RFRN-ID-CD   OF DCLVTRNFR                             
                                   TO TRANS-RFRN-ID-CD   OF DCLACTITRF          
           ELSE                                                                 
               MOVE ' '            TO TRANS-RFRN-ID-CD   OF DCLACTITRF          
           END-IF                                                               
                                                                                
LRM019*    MOVE CMNT-TXT           OF DCLVTRNFR                                 
LRM019     IF W-NSCC-TI-COMMENTS = CMNT-TXT OF DCLVTRNFR                        
LRM019        DISPLAY 'DONT MOVE CONTRA CMNT '                                  
LRM019                ' ' W-NSCC-TI-TFR-TYPE  ' '                               
LRM019                     CMNT-TXT OF DCLVTRNFR (1:30)                         
LRM019        MOVE SPACES          TO CMNT-TXT           OF DCLACTITRF          
LRM019     ELSE                                                                 
              MOVE CMNT-TXT        OF DCLVTRNFR                                 
                                   TO CMNT-TXT           OF DCLACTITRF          
LRM019     END-IF.                                                              
           MOVE CICS-TERM-ID-CD    OF DCLVTRNFR                                 
                                   TO CICS-TERM-ID-CD    OF DCLACTITRF          
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLACTITRF          
           MOVE DB-CR-CD           OF DCLVTRNFR                                 
                                   TO DB-CR-CD           OF DCLACTITRF          
           MOVE NSCC-ACK-IND       OF DCLVTRNFR                                 
                                   TO NSCC-ACK-IND       OF DCLACTITRF          
           MOVE PRGM-NM            OF DCLVTRNFR                                 
                                   TO PRGM-NM            OF DCLACTITRF          
           MOVE RR-CD              OF DCLVTRNFR                                 
                                   TO RR-CD              OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJC1-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJC1-CD OF DCLACTITRF          
           MOVE TRNFR-TYPE-RJC2-CD OF DCLVTRNFR                                 
                                   TO TRNFR-TYPE-RJC2-CD OF DCLACTITRF          
           MOVE W-CURRENT-TIMESTAMP TO UPDT-TMSTP        OF DCLACTITRF          
                                                                                
           MOVE 'R'                TO TRANS-TYPE-CD      OF DCLACTITRF          
                                                                                
DJ0010     DISPLAY 'CREATING RJCT'                                              
DJ0010                        ' ' W-NSCC-KEY-CLIENT-NBR                         
DJ0010                        ' ' W-NSCC-TI-ACAT-CTL-NBR                        
DJ0010                        ' ' W-BRANCH-CD                                   
DJ0010                        ' ' W-ACCT-CD                                     
DJ0010     IF  (W-REJ-ADTS = 'Y')                                               
DJ0010         IF (W-REJ-NA  = 'Y')                                             
DJ0010         OR (W-REJ-DUP = 'Y'                                              
DJ0010             AND BH-ACAT-REJ-PEND-DEL-DUP-CODE > '00')                    
DJ0010         OR (W-REJ-MM  = 'Y'                                              
DJ0010             AND BH-ACAT-REJ-PEND-DEL-MM-CODE  > '00')                    
DJ0010         OR (W-REJ-IRA = 'Y'                                              
DJ0010             AND BH-ACAT-REJ-PEND-DEL-IRA-CODE > '00')                    
DJ0010         OR (W-REJ-QRP = 'Y'                                              
DJ0010             AND BH-ACAT-REJ-PEND-DEL-QRP-CODE > '00')                    
DJ0010         OR (W-REJ-SP  = 'Y'                                              
DJ0010             AND BH-ACAT-REJ-PEND-DEL-SP-CODE  > '00')                    
DJ0010         OR (W-REJ-SS  = 'Y'                                              
DJ0010             AND BH-ACAT-REJ-PEND-DEL-SS-CODE  > '00')                    
DJ0010           DISPLAY 'W-REJECT-SWITCHES = (' W-REJECT-SWITCHES ')'          
DJ0010         ELSE                                                             
DJ0010            DISPLAY    'W-REJ-ADTS DONE'                                  
DJ0010                        ' ' W-NSCC-KEY-CLIENT-NBR                         
DJ0010                        ' ' W-BRANCH-CD                                   
DJ0010                        ' ' W-ACCT-CD                                     
DJ0010                        ' ' W-CUST-TYPE                                   
DJ0010                        ' ' WS-LAST-ADTS-DOC-CODE                         
DJ0010                        ' ' WS-LAST-ADTS-REJ-CODE                         
DJ0010                        ' ' WS-LAST-ADTS-REJ-CMNT                         
DJ0010             MOVE WS-LAST-ADTS-REJ-CODE                                   
DJ0010                             TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0010             MOVE WS-LAST-ADTS-REJ-CMNT                                   
DJ0010                             TO CMNT-TXT           OF DCLACTITRF          
DJ0010             MOVE ' '        TO NSCC-PEND-CD       OF DCLACTITRF          
DJ0010         END-IF                                                           
DJ0010     END-IF                                                               
                                                                                
      *****CHECK FOR INVALID ACCT FIRST                                         
           IF  W-REJ-NA = 'Y'                                                   
LRM016     OR CVRSN-ACCT-NBR OF DCLVTRNFR (1:11) = 'CONV REJECT'                
DJ0010             DISPLAY    'W-REJ-NA  DONE'                                  
               MOVE '05'           TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
               IF  W-NSCC-DIST-PARTICIPANT   = W-NSCC-TI-RCV-NBR                
                   MOVE '3'        TO RCV-NBR-STTS-CD    OF DCLACTITRF          
               ELSE                                                             
                   MOVE '3'        TO DLVR-NBR-STTS-CD   OF DCLACTITRF          
               END-IF                                                           
               IF  BH-ACAT-INVALID-ACCT-AUTO-REJ = '1'                          
                   MOVE 'H'        TO NSCC-PEND-CD       OF DCLACTITRF          
               ELSE                                                             
                   MOVE ' '        TO NSCC-PEND-CD       OF DCLACTITRF          
               END-IF                                                           
           END-IF.                                                              
                                                                                
           IF  W-REJ-SP           = 'Y'                                         
             IF  W-EDIT-DELIVERY-SW = 'Y'                                       
               IF  BH-ACAT-REJ-PEND-DEL-SP-CODE > '00'                          
DJ0010             DISPLAY    'W-REJ-SP  DONE'                                  
                   MOVE BH-ACAT-REJ-PEND-DEL-SP-CODE                            
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   MOVE ' '        TO NSCC-PEND-CD       OF DCLACTITRF          
               END-IF                                                           
             END-IF                                                             
           END-IF                                                               
                                                                                
           IF  W-REJ-IRA = 'Y'                                                  
               IF  BH-ACAT-REJ-PEND-DEL-IRA-CODE > '00'                         
DJ0010             DISPLAY    'W-REJ-IRA DONE'                                  
                   MOVE BH-ACAT-REJ-PEND-DEL-IRA-CODE                           
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   MOVE ' '        TO NSCC-PEND-CD       OF DCLACTITRF          
               END-IF                                                           
           END-IF                                                               
                                                                                
TCK001     IF  W-REJ-QRP = 'Y'                                                  
TCK001         IF  BH-ACAT-REJ-PEND-DEL-QRP-CODE > '00'                         
DJ0010             DISPLAY    'W-REJ-QRP DONE'                                  
TCK001             MOVE BH-ACAT-REJ-PEND-DEL-QRP-CODE                           
TCK001                             TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
TCK001             MOVE ' '        TO NSCC-PEND-CD       OF DCLACTITRF          
TCK001         END-IF                                                           
TCK001     END-IF                                                               
                                                                                
           IF  W-REJ-SS = 'Y'                                                   
               IF  W-EDIT-DELIVERY-SW = 'Y'                                     
               AND BH-ACAT-REJ-PEND-DEL-SS-CODE > '00'                          
DJ0010             DISPLAY    'W-REJ-SS  DONE'                                  
                   MOVE BH-ACAT-REJ-PEND-DEL-SS-CODE                            
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   MOVE ' '        TO NSCC-PEND-CD       OF DCLACTITRF          
               END-IF                                                           
DJ0003         IF  W-PTR-EDIT-DEL-SW = 'Y'                                      
DJ0003         AND BH-ACAT-REJ-PEND-PTR-DEL-CODE > '00'                         
DJ0003             MOVE BH-ACAT-REJ-PEND-PTR-DEL-CODE                           
DJ0003                             TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0003             MOVE ' '        TO NSCC-PEND-CD       OF DCLACTITRF          
DJ0003         END-IF                                                           
               MOVE '3'            TO RCV-SS-PRIM-STS-CD OF DCLACTITRF          
           END-IF                                                               
                                                                                
           IF  W-REJ-MM = 'Y'                                                   
               IF  W-EDIT-DELIVERY-SW = 'Y'                                     
               AND BH-ACAT-REJ-PEND-DEL-MM-CODE > '00'                          
DJ0010             DISPLAY    'W-REJ-MM  DONE'                                  
                   MOVE BH-ACAT-REJ-PEND-DEL-MM-CODE                            
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   MOVE ' '        TO NSCC-PEND-CD       OF DCLACTITRF          
               END-IF                                                           
DJ0003         IF  W-PTR-EDIT-DEL-SW = 'Y'                                      
DJ0003         AND BH-ACAT-REJ-PEND-PTR-DEL-MM-CD > '00'                        
DJ0003             MOVE BH-ACAT-REJ-PEND-PTR-DEL-MM-CD                          
DJ0003                             TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0003             MOVE ' '        TO NSCC-PEND-CD       OF DCLACTITRF          
               END-IF                                                           
               MOVE '3'            TO RCV-ACT-TYP-STS-CD OF DCLACTITRF          
           END-IF                                                               
                                                                                
           IF  W-REJ-DUP = 'Y'                                                  
               IF  W-EDIT-DELIVERY-SW = 'Y'                                     
               AND BH-ACAT-REJ-PEND-DEL-DUP-CODE > '00'                         
DJ0010             DISPLAY    'W-REJ-DUP DONE'                                  
                   MOVE BH-ACAT-REJ-PEND-DEL-DUP-CODE                           
                                   TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
                   MOVE ' '        TO NSCC-PEND-CD       OF DCLACTITRF          
               END-IF                                                           
DJ0003         IF  W-PTR-EDIT-DEL-SW = 'Y'                                      
DJ0003         AND BH-ACAT-REJ-PEND-PTR-DEL-DP-CD > '00'                        
DJ0003             MOVE BH-ACAT-REJ-PEND-PTR-DEL-DP-CD                          
DJ0003                             TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF          
DJ0003             MOVE ' '        TO NSCC-PEND-CD       OF DCLACTITRF          
DJ0003         END-IF                                                           
           END-IF                                                               
                                                                                
LRM005     IF ACCT-CLT-RSCND-IND OF DCLVTRNFR = 'Y'                             
LRM005     AND BH-ACAT-CLIENT-RESCIND-IND = '2'                                 
LRM005         MOVE '08' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF                    
LRM005         MOVE ' '        TO NSCC-PEND-CD       OF DCLACTITRF              
LRM005     END-IF.                                                              
LRM005     IF ACCT-LGL-BLK-IND   OF DCLVTRNFR = 'Y'                             
LRM005     AND BH-ACAT-LEGAL-BLOCK-IND = '2'                                    
LRM005         MOVE '03' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF                    
LRM005         MOVE ' '        TO NSCC-PEND-CD       OF DCLACTITRF              
LRM005     END-IF.                                                              
                                                                                
           IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-RCV-NBR                      
               IF W-NSCC-TI-TFR-TYPE = 'RCR'                                    
                  MOVE '22' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF                 
               ELSE                                                             
                 IF W-NSCC-TI-TFR-TYPE = 'PTD'                                  
                    MOVE '23' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF               
                 ELSE                                                           
                   IF W-NSCC-TI-TFR-TYPE = 'FRV'                                
                      MOVE '24' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF             
                   ELSE                                                         
                     IF W-NSCC-TI-TFR-TYPE = 'RCL'                              
                        MOVE '25' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF           
                     ELSE                                                       
                       IF W-NSCC-TI-TFR-TYPE = 'CRD'                            
                          MOVE '26' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF         
                       ELSE                                                     
DJ0002                   IF W-NSCC-TI-TFR-TYPE = 'MFC'                          
DJ0002                    MOVE '27' TO TRNFR-TYPE-RJCT-CD OF DCLACTITRF         
DJ0002                   END-IF                                                 
                       END-IF                                                   
                     END-IF                                                     
                   END-IF                                                       
                 END-IF                                                         
               END-IF                                                           
           END-IF.                                                              
                                                                                
LRM016     IF CVRSN-ACCT-NBR OF DCLVTRNFR (1:11) = 'CONV REJECT'                
LRM016        MOVE ' '        TO NSCC-PEND-CD       OF DCLACTITRF               
LRM016        IF (W-NSCC-TI-TFR-TYPE = 'FUL' OR 'PTR')                          
LRM016           MOVE                                                           
LRM016           'ACCOUNT WAS TRANSFERRED TO 0543.  PLEASE RE-SUBMIT'           
LRM016                           TO  CMNT-TXT OF DCLACTITRF                     
LRM016        ELSE                                                              
LRM016           MOVE                                                           
LRM016            'ACCOUNT WAS TRANSFERRED TO 0543.  PLEASE CALL 1-800-7        
LRM016-           '76-9610'                                                     
LRM016                           TO  CMNT-TXT OF DCLACTITRF                     
LRM016        END-IF                                                            
LRM016     END-IF.                                                              
                                                                                
DJ0013     IF (W-NSCC-TI-TFR-TYPE = 'FUL' OR 'PTD' OR 'PTR')                    
DJ0013        EVALUATE BH-ACAT-ASCENDIS-USER                                    
DJ0013           WHEN '1'   MOVE 'A' TO NSCC-ACK-IND OF DCLACTITRF              
DJ0013           WHEN '2'   MOVE 'P' TO NSCC-ACK-IND OF DCLACTITRF              
DJ0013           WHEN OTHER MOVE ' ' TO NSCC-ACK-IND OF DCLACTITRF              
DJ0013        END-EVALUATE                                                      
DJ0012     ELSE                                                                 
DJ0012         MOVE ' '        TO NSCC-ACK-IND       OF DCLACTITRF              
DJ0012     END-IF.                                                              
                                                                                
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
DJ0009            ,GIFT_IND                                                     
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
DJ0009            ,:DCLACTITRF.GIFT-IND                                         
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTITRF-ADD-CNT                                       
DJ0001         PERFORM 7100-SQL-COMMIT THRU 7100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-ACTITRF-NOT-ADD-CNT                                   
                                                                                
               IF  SQLCODE  =  -803                                             
                   PERFORM 5950-UPDATE-INIT        THRU 5950-EXIT               
               ELSE                                                             
                   DISPLAY '  '     ' ACTITRF NOT ADDED.'                       
                                    ' SQLCODE = ' W-DB2-SQLCODE                 
                   DISPLAY '   '                                                
                          'ACTITRF PRIMARY KEY:'                                
                              ' CLT=' W-NSCC-KEY-CLIENT-NBR                     
                              ' TFR=' W-NSCC-TI-TFR-TYPE                        
                   DISPLAY '    DLV=' W-NSCC-TI-DEL-NBR                         
                           ' DLV-AC=' W-NSCC-TI-DEL-ACCT-NBR                    
                              ' RCV=' W-NSCC-TI-RCV-NBR                         
                           ' RCV-AC=' W-NSCC-TI-RCV-ACCT-NBR                    
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT513: ERROR INSERTING A ROW INTO ACTITRF'         
                        ' (ACAT-TRNFR TABLE)'                                   
                   DISPLAY 'CAT513: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT513: DCLACTITRF  ='                              
                        '(' DCLACTITRF ')'                                      
                          PERFORM 7900-DISPLAY-KEY     THRU 7900-EXIT           
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT                       
               END-IF                                                           
           END-IF.                                                              
                                                                                
       5900-EXIT. EXIT.                                                         
      /                                                                         
       5950-UPDATE-INIT.                                                        
           MOVE '5950-UPDATE-INIT            ' TO W-ROUTINE-1.                  
                                                                                
           MOVE ' '                      TO W-ACTITRF-SELECT-FIELDS             
                                                                                
           EXEC SQL SELECT                                                      
                      ACAT_CONTROL_NBR                                          
                     ,TRANS_TYPE_CD                                             
                     ,NSCC_PEND_CD                                              
                     ,PRCS_DT                                                   
                     ,PRGM_NM                                                   
                     ,UPDT_TMSTP                                                
               INTO  :W-ACAT-CONTROL-NO                                         
                    ,:W-TRANS-TYPE-CD                                           
                    ,:W-NSCC-PEND-CD                                            
                    ,:W-PRCS-DT                                                 
                    ,:W-PRGM-NM                                                 
                    ,:W-UPDT-TMSTP                                              
               FROM  ACTITRF                                                    
              WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR                 
                AND  RCV_NBR           = :W-NSCC-TI-RCV-NBR                     
                AND  DLVR_NBR          = :W-NSCC-TI-DEL-NBR                     
                AND  ACCT_RCV_NBR      = :W-NSCC-TI-RCV-ACCT-NBR                
                AND  ACCT_DLVR_NBR     = :W-NSCC-TI-DEL-ACCT-NBR                
                AND  TRNFR_TYPE_CD     = :W-NSCC-TI-TFR-TYPE                    
           END-EXEC                                                             
                                                                                
           DISPLAY 'INP=' W-INFILE-CNT                                          
                           ' INIT FND CTL=' W-ACAT-CONTROL-NO                   
                                    ' TRN=' W-TRANS-TYPE-CD                     
                                   ' PEND=' W-NSCC-PEND-CD                      
                                   ' PRCS=' W-PRCS-DT                           
                                   ' PRGM=' W-PRGM-NM                           
                                   ' UPDT=' W-UPDT-TMSTP                        
                                                                                
DJ0013     IF (W-NSCC-TI-TFR-TYPE = 'FUL' OR 'PTD' OR 'PTR')                    
DJ0013        EVALUATE BH-ACAT-ASCENDIS-USER                                    
DJ0013           WHEN '1'   MOVE 'A' TO NSCC-ACK-IND OF DCLACTITRF              
DJ0013           WHEN '2'   MOVE 'P' TO NSCC-ACK-IND OF DCLACTITRF              
DJ0013           WHEN OTHER MOVE ' ' TO NSCC-ACK-IND OF DCLACTITRF              
DJ0013        END-EVALUATE                                                      
DJ0012     ELSE                                                                 
DJ0012         MOVE ' '        TO NSCC-ACK-IND       OF DCLACTITRF              
DJ0012     END-IF.                                                              
                                                                                
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
DJ0009            ,GIFT_IND            = :DCLACTITRF.GIFT-IND                   
DJ0012            ,NSCC_ACK_IND        = :DCLACTITRF.NSCC-ACK-IND               
                WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR               
                  AND  RCV_NBR           = :W-NSCC-TI-RCV-NBR                   
                  AND  DLVR_NBR          = :W-NSCC-TI-DEL-NBR                   
                  AND  ACCT_RCV_NBR      = :W-NSCC-TI-RCV-ACCT-NBR              
                  AND  ACCT_DLVR_NBR     = :W-NSCC-TI-DEL-ACCT-NBR              
                  AND  TRNFR_TYPE_CD     = :W-NSCC-TI-TFR-TYPE                  
??****************AND  ACAT_CONTROL_NBR  = :W-NSCC-TI-ACAT-CTL-NBR              
??****************AND  NSCC_PEND_CD      = 'H'                                  
           END-EXEC.                                                            
                                                                                
           MOVE 'ACTITRF'                TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
                                                                                
           IF  SQLCODE  =  +0                                                   
               ADD 1 TO W-ACTITRF-UPD-CNT                                       
DJ0001         PERFORM 7100-SQL-COMMIT THRU 7100-EXIT                           
           ELSE                                                                 
               ADD 1 TO W-ACTITRF-NOT-UPD-CNT                                   
               DISPLAY '  '     ' ACTITRF NOT UPDATED '                         
                                ' SQLCODE = ' W-DB2-SQLCODE                     
                          PERFORM 7900-DISPLAY-KEY     THRU 7900-EXIT           
               DISPLAY '   '                                                    
                      'ACTITRF PRIMARY KEY:'                                    
                          ' CLT=' W-NSCC-KEY-CLIENT-NBR                         
                          ' TFR=' W-NSCC-TI-TFR-TYPE                            
               DISPLAY '    DLV=' W-NSCC-TI-DEL-NBR                             
                       ' DLV-AC=' W-NSCC-TI-DEL-ACCT-NBR                        
                          ' RCV=' W-NSCC-TI-RCV-NBR                             
                       ' RCV-AC=' W-NSCC-TI-RCV-ACCT-NBR                        
               DISPLAY '   '                                                    
                      'ACTITRF  UPDATE KEY:'                                    
                          ' CLT=' W-NSCC-KEY-CLIENT-NBR                         
                          ' TFR=' W-NSCC-TI-TFR-TYPE                            
               DISPLAY '    DLV=' W-NSCC-TI-DEL-NBR                             
                       ' DLV-AC=' W-NSCC-TI-DEL-ACCT-NBR                        
                          ' RCV=' W-NSCC-TI-RCV-NBR                             
                       ' RCV-AC=' W-NSCC-TI-RCV-ACCT-NBR                        
               DISPLAY '    CTL=' W-NSCC-TI-ACAT-CTL-NBR                        
***********************' NSCC_PEND_CD = H'                                      
             IF  L-RERUN                                                        
             AND SQLCODE  =  +100                                               
                   DISPLAY '   BYPASSING ACTITRF UPDATE NOT FOUND.'             
             ELSE                                                               
                   DISPLAY ' '                                                  
                   DISPLAY 'CAT513: ERROR UPDATING A ROW IN ACTITRF'            
                         ' (ACAT-TRNFR      TABLE)'                             
                   DISPLAY 'CAT513: INPUT  REC ='                               
                        '(' W-NSCC-RECORD ')'                                   
                   DISPLAY 'CAT513: DCLACTITRF  ='                              
                           '(' DCLACTITRF ')'                                   
                          PERFORM 7900-DISPLAY-KEY     THRU 7900-EXIT           
                   PERFORM  8000-SQL-ERROR THRU 8000-EXIT                       
             END-IF                                                             
           END-IF.                                                              
                                                                                
       5950-EXIT. EXIT.                                                         
      /                                                                         
       6100-GETNA.                                                              
                                                                                
           MOVE W-NSCC-KEY-CLIENT-NBR(2:3) TO GETNA-KEY-CLIENT.                 
           MOVE '00'                     TO GETNA-KEY-BRANCH1-2.                
           MOVE W-BRANCH-CD              TO GETNA-KEY-BRANCH3-5.                
           MOVE '00000'                  TO GETNA-KEY-ACCOUNT1-5.               
           MOVE W-ACCT-CD                TO GETNA-KEY-ACCOUNT6-10.              
                                                                                
TCK001     CALL  GETNA                USING GETNA-PARAMETERS                    
                                            GETNA-SEGMENT-INCLUDES.             
                                                                                
           IF  GETNA-RETURN-FOUND                                               
LRM013     AND W-CONV-ACCT NOT = 'NOTFND'                                       
               ADD 1 TO W-GETNA-FND-CNT                                         
               MOVE NAPPA-RR1-3                                                 
                                     TO RR-CD              OF DCLVTRNFR         
LRM025*** ONLY UPDATE ORGINAL RR WHEN NEEDED:                                   
LRM025         IF W-TRANSFER-FND-SW = 'Y'                                       
LRM025         AND DSTBN-SIDE-CD OF DCLVTRNFR = 'D'                             
LRM025         AND ACCT-DLVR-NBR OF DCLVTRNFR = W-SAVE-ACCT-DLVR-NBR            
LRM025            DISPLAY 'LEAVE ORGNL RR THE SAME '                            
LRM025                      ' ' W-NSCC-KEY-CLIENT-NBR                           
LRM025                      ' ' W-NSCC-TI-ACAT-CTL-NBR                          
LRM025                      ' ' W-NSCC-STATUS                                   
LRM025              ' DB2-ACCT=' ACCT-DLVR-NBR OF DCLVTRNFR(1:10)               
LRM025              ' ORG=' RR-ORGNL-CD OF DCLVTRNFR                            
LRM025              ' N/A=' NAPPA-RR1-3                                         
LRM025         ELSE                                                             
LRM025            DISPLAY 'REPL ORGNL RR '                                      
LRM025                      ' ' W-NSCC-KEY-CLIENT-NBR                           
LRM025                      ' ' W-NSCC-TI-ACAT-CTL-NBR                          
LRM025                      ' ' W-NSCC-STATUS ' '                               
LRM025              W-SAVE-ACCT-DLVR-NBR(1:8)                                   
LRM025              ' ' RR-ORGNL-CD OF DCLVTRNFR                                
LRM025              ' WITH ' NAPPA-RR1-3                                        
LRM025            MOVE NAPPA-RR1-3 TO   RR-ORGNL-CD        OF DCLVTRNFR         
LRM025         END-IF                                                           
               MOVE NAPPA-CASH-MNGMNT                                           
                                     TO ACM-HOLDER-NAA-CD  OF DCLVTRNFR         
               MOVE NAPPA-FUND-TRNSFR                                           
                                     TO CASH-SWEEP-NAA-CD  OF DCLVTRNFR         
               MOVE NAPPA-DIV-CODE                                              
                                     TO DVDND-NAA-CD       OF DCLVTRNFR         
               MOVE NAPPA-SELL-CODE                                             
                                     TO SELL-INSTN-NAA-CD  OF DCLVTRNFR         
               MOVE 'N'              TO NSCC-NON-ADP-IND   OF DCLVTRNFR         
           ELSE                                                                 
             ADD 1 TO W-GETNA-NOTFND-CNT                                        
             IF  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-SUB-PART-NBR               
             AND W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-RCV-NBR                    
LRM012*******AND W-CONV-ACCT = SPACES                                           
DJ0004           MOVE W-INIT-RR-CD   TO RR-CD              OF DCLVTRNFR         
DJ0009                                  RR-ORGNL-CD        OF DCLVTRNFR         
                 DISPLAY 'INP=' W-INFILE-CNT                                    
                            ' ' W-NSCC-KEY-CLIENT-NBR                           
                            ' ' W-NSCC-TI-ACAT-CTL-NBR                          
                            ' ' W-NSCC-TI-TFR-TYPE                              
                        ' TRN=' W-NSCC-TI-TRAN-TYPE                             
                        ' STA=' W-NSCC-STATUS                                   
                              ' BYPASS GETNA-NOTFND FOR RCV'                    
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                        ' ACC=' W-BRN-ACCT                                      
DJ0004                   ' RR=' W-INIT-RR-CD                                    
             ELSE                                                               
                                                                                
*************IF NOT ON N/A, REJECT WITH '05'                                    
DJ0003**------BYPASS N/A EDIT FOR FAIL REVERAL AND RECLAIM DELIVER SIDE         
DJ0014**------BYPASS N/A REJECT FOR PTF                                         
DJ0014        IF (W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-SUB-PART-NBR              
LRM016            AND CVRSN-ACCT-NBR OF DCLVTRNFR (1:11) NOT =                  
LRM016                                      'CONV REJECT'                       
DJ0003            AND  W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR              
DJ0014            AND (W-NSCC-TI-TFR-TYPE = 'RCL' OR 'FRV'))                    
DJ0014        OR (W-NSCC-TI-TFR-TYPE = 'PTF')                                   
DJ0003           CONTINUE                                                       
DJ0003        ELSE                                                              
               MOVE 'Y'              TO NSCC-NON-ADP-IND   OF DCLVTRNFR         
               MOVE 'Y' TO W-REJ-NA                                             
               MOVE 'Y' TO W-REJECT-AUTO-SW                                     
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-NSCC-KEY-CLIENT-NBR                             
                          ' ' W-NSCC-TI-ACAT-CTL-NBR                            
                          ' ' W-NSCC-TI-TFR-TYPE                                
                      ' TRN=' W-NSCC-TI-TRAN-TYPE                               
                            ' GETNA-NOTFND'                                     
                      ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                        
                      ' ACC=' W-BRN-ACCT                                        
DJ0003                ' REJECT WITH "05"'                                       
DJ0010                       ' W-REJ-NA'                                        
                                                                                
DJ0003        END-IF                                                            
             END-IF                                                             
           END-IF.                                                              
                                                                                
LRM013     IF W-CONV-ACCT = 'NOTFND'                                            
LRM013        MOVE SPACES TO W-CONV-ACCT                                        
LRM013     END-IF.                                                              
                                                                                
       6100-EXIT. EXIT.                                                         
      /                                                                         
DJ0004 6110-GET-ACTITRF-RR-CD.                                                  
DJ0004* TRANSFERS INITIALIZED TODAY FOR A NEW ACCOUNT THAT WAS                  
DJ0004* OPENED TODAY, IT WILL NOT BE ON THE BATCH NAME/ADDRESS.                 
DJ0004* GET THE RR CODE FROM THE INIT TABLE.                                    
DJ0004                                                                          
DJ0004     EXEC SQL SELECT                                                      
DJ0004               RR_CD                                                      
DJ0004         INTO :W-INIT-RR-CD                                               
DJ0004         FROM  ACTITRF                                                    
DJ0004        WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR                 
DJ0004          AND  RCV_NBR           = :W-NSCC-TI-RCV-NBR                     
DJ0004          AND  DLVR_NBR          = :W-NSCC-TI-DEL-NBR                     
DJ0004          AND  ACCT_RCV_NBR      = :W-NSCC-TI-RCV-ACCT-NBR                
DJ0004          AND  ACCT_DLVR_NBR     = :W-NSCC-TI-DEL-ACCT-NBR                
DJ0004          AND  TRNFR_TYPE_CD     = :W-NSCC-TI-TFR-TYPE                    
DJ0004     END-EXEC.                                                            
                                                                                
       6110-EXIT. EXIT.                                                         
      /                                                                         
       6120-CHECK-ACCT-FREEZE.                                                  
      ** FULL RECEIVE - CASH-IN  AND SEC-IN  = FREEZE                           
      **   IF  W-NSCC-TI-TFR-TYPE      = 'FUL'                                  
      **   AND W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-RCV-NBR                      
      ** FULL DELIVER - CASH-OUT AND SEC-OUT = FREEZE                           
      **   IF  W-NSCC-TI-TFR-TYPE      = 'FUL'                                  
      **   AND W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR                      
      ** PTD  DELIVER - CASH-IN  AND SEC-IN  AND                                
      **                CASH-OUT AND SEC-OUT = FREEZE                           
      **   IF  W-NSCC-TI-TFR-TYPE      = 'PTD'                                  
      **   AND W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR                      
???   ** PTR  DELIVER - CASH-IN  AND SEC-IN  AND                                
???   **                CASH-OUT AND SEC-OUT = FREEZE                           
???   **   IF  W-NSCC-TI-TFR-TYPE      = 'PTR'                                  
???   **   AND W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR                      
                                                                                
LRM008     IF  W-NSCC-TI-TFR-TYPE      = 'PTR'                                  
LRM008     AND W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-RCV-NBR                      
LRM008     AND W-NSCC-STATUS = '500'                                            
LRM008        DISPLAY 'SKIP FREEZE LOOKUP FOR PTR MEMO '                        
LRM008        W-NSCC-ACAT-CTL-NBR                                               
LRM008        GO TO 6120-EXIT                                                   
LRM008     END-IF.                                                              
                                                                                
           MOVE ' '                      TO F-COMMAREA-FACZ1CA                  
           MOVE 'CAT513'                 TO F-CA-I-CALLER-PGM-ID                
           MOVE W-NSCC-KEY-CLIENT-NBR    TO F-CA-I-CLIENT4                      
           MOVE W-BRANCH-CD              TO F-CA-I-BRANCH                       
           MOVE W-ACCT-CD                TO F-CA-I-ACCT                         
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
                            ' ' W-NSCC-TI-ACAT-CTL-NBR                          
                            ' ' W-NSCC-TI-TFR-TYPE                              
                        ' TRN=' W-NSCC-TI-TRAN-TYPE                             
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                            ' ' W-BRN-ACCT ' FREEZE LOOKUP IN'                  
                DISPLAY '   1FAC-CA-INPUT-REQUEST-AREA: '                       
                             F-CA-INPUT-REQUEST-AREA                            
                DISPLAY '   1FAC-CA-REQUEST-RESPONSE-AREA:'                     
                             F-CA-REQUEST-RESPONSE-AREA                         
             END-IF                                                             
           ELSE                                                                 
               DISPLAY 'INP=' W-INFILE-CNT                                      
                          ' ' W-NSCC-KEY-CLIENT-NBR                             
                          ' ' W-NSCC-TI-ACAT-CTL-NBR                            
                          ' ' W-NSCC-TI-TFR-TYPE                                
                      ' TRN=' W-NSCC-TI-TRAN-TYPE                               
                      ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                        
                          ' ' W-BRN-ACCT ' FREEZE LOOKUP IN'                    
               DISPLAY '   1FAC-CA-L-RETURN-CODE= ' F-CA-L-RETURN-CODE          
               DISPLAY '   1FAC-CA-L-ERR-MSG= ' F-CA-L-ERR-MSG                  
           END-IF.                                                              
                                                                                
           MOVE ' '                      TO F-COMMAREA-FACZ1CA                  
           MOVE 'CAT513'                 TO F-CA-I-CALLER-PGM-ID                
           MOVE W-NSCC-KEY-CLIENT-NBR    TO F-CA-I-CLIENT4                      
           MOVE W-BRANCH-CD              TO F-CA-I-BRANCH                       
           MOVE W-ACCT-CD                TO F-CA-I-ACCT                         
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
                            ' ' W-NSCC-TI-ACAT-CTL-NBR                          
                            ' ' W-NSCC-TI-TFR-TYPE                              
                        ' TRN=' W-NSCC-TI-TRAN-TYPE                             
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                            ' ' W-BRN-ACCT ' FREEZE LOOKUP OUT'                 
                DISPLAY '2FAC-CA-INPUT-REQUEST-AREA: '                          
                          F-CA-INPUT-REQUEST-AREA                               
                DISPLAY '2FAC-CA-REQUEST-RESPONSE-AREA:'                        
                          F-CA-REQUEST-RESPONSE-AREA                            
             END-IF                                                             
           ELSE                                                                 
                 DISPLAY 'INP=' W-INFILE-CNT                                    
                            ' ' W-NSCC-KEY-CLIENT-NBR                           
                            ' ' W-NSCC-TI-ACAT-CTL-NBR                          
                            ' ' W-NSCC-TI-TFR-TYPE                              
                        ' TRN=' W-NSCC-TI-TRAN-TYPE                             
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                            ' ' W-BRN-ACCT ' FREEZE LOOKUP OUT'                 
               DISPLAY '2FAC-CA-L-RETURN-CODE= ' F-CA-L-RETURN-CODE             
               DISPLAY '2FAC-CA-L-ERR-MSG= ' F-CA-L-ERR-MSG                     
           END-IF.                                                              
                                                                                
           IF (W-NSCC-TI-TFR-TYPE      = 'FUL' AND                              
               W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-RCV-NBR)                     
               IF F-CA-A-CASH-IN-FRZ-YES     AND                                
                  F-CA-A-SEC-IN-FRZ-YES                                         
                  MOVE 'Y'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
                 DISPLAY 'INP=' W-INFILE-CNT                                    
                            ' ' W-NSCC-KEY-CLIENT-NBR                           
                            ' ' W-NSCC-TI-ACAT-CTL-NBR                          
                            ' ' W-NSCC-TI-TFR-TYPE                              
                        ' TRN=' W-NSCC-TI-TRAN-TYPE                             
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                            ' ' W-BRN-ACCT                                      
                              ' FREEZE IS ON'                                   
               ELSE                                                             
                  MOVE 'N'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
               END-IF                                                           
           END-IF.                                                              
           IF (W-NSCC-TI-TFR-TYPE      = 'FUL' AND                              
               W-NSCC-DIST-PARTICIPANT = W-NSCC-TI-DEL-NBR)                     
LRM022         IF (F-CA-A-CASH-OUT-FRZ-YES OR                                   
                  F-CA-A-SEC-OUT-FRZ-YES)                                       
LRM022           IF (F-CA-A-CASH-OUT-FRZ-YES AND                                
LRM022               F-CA-A-SEC-OUT-FRZ-YES)                                    
                    MOVE 'Y'         TO ACCT-FRZN-IND      OF DCLVTRNFR         
LRM022           ELSE                                                           
LRM022              MOVE 'O'         TO ACCT-FRZN-IND      OF DCLVTRNFR         
LRM022           END-IF                                                         
                 DISPLAY 'INP=' W-INFILE-CNT                                    
                            ' ' W-NSCC-KEY-CLIENT-NBR                           
                            ' ' W-NSCC-TI-ACAT-CTL-NBR                          
                            ' ' W-NSCC-TI-TFR-TYPE                              
                        ' TRN=' W-NSCC-TI-TRAN-TYPE                             
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                            ' ' W-BRN-ACCT                                      
                              ' FREEZE IS ON'                                   
LRM022                  ' TYPE=' ACCT-FRZN-IND      OF DCLVTRNFR                
               ELSE                                                             
                  MOVE 'N'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
               END-IF                                                           
           END-IF.                                                              
           IF (W-NSCC-TI-TFR-TYPE      = 'PTD')                                 
               IF (F-CA-A-CASH-IN-FRZ-YES    OR                                 
                   F-CA-A-SEC-IN-FRZ-YES     OR                                 
                   F-CA-A-CASH-OUT-FRZ-YES OR                                   
                   F-CA-A-SEC-OUT-FRZ-YES)                                      
                  MOVE 'Y'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
                 DISPLAY 'INP=' W-INFILE-CNT                                    
                            ' ' W-NSCC-KEY-CLIENT-NBR                           
                            ' ' W-NSCC-TI-ACAT-CTL-NBR                          
                            ' ' W-NSCC-TI-TFR-TYPE                              
                        ' TRN=' W-NSCC-TI-TRAN-TYPE                             
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                            ' ' W-BRN-ACCT                                      
                              ' FREEZE IS ON'                                   
               ELSE                                                             
                  MOVE 'N'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
               END-IF                                                           
           END-IF.                                                              
           IF (W-NSCC-TI-TFR-TYPE      = 'PTR')                                 
               IF (F-CA-A-CASH-IN-FRZ-YES    OR                                 
                   F-CA-A-SEC-IN-FRZ-YES     OR                                 
                   F-CA-A-CASH-OUT-FRZ-YES OR                                   
                   F-CA-A-SEC-OUT-FRZ-YES)                                      
                  MOVE 'Y'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
                 DISPLAY 'INP=' W-INFILE-CNT                                    
                            ' ' W-NSCC-KEY-CLIENT-NBR                           
                            ' ' W-NSCC-TI-ACAT-CTL-NBR                          
                            ' ' W-NSCC-TI-TFR-TYPE                              
                        ' TRN=' W-NSCC-TI-TRAN-TYPE                             
                        ' DST=' DSTBN-SIDE-CD OF DCLVTRNFR                      
                            ' ' W-BRN-ACCT                                      
                              ' FREEZE IS ON'                                   
               ELSE                                                             
                  MOVE 'N'         TO ACCT-FRZN-IND      OF DCLVTRNFR           
               END-IF                                                           
           END-IF.                                                              
                                                                                
       6120-EXIT. EXIT.                                                         
      /                                                                         
       6200-INSERT-VTRNFR.                                                      
           MOVE '6200-INSERT-VTRNFR            ' TO W-ROUTINE-1.                
                                                                                
DJ0011     IF  GETNA-RETURN-FOUND                                               
DJ0011     AND (NOT NNARPB-SEGMENT-MISSING)                                     
DJ0011         MOVE NNARPB-ALT-BRANCH                                           
DJ0011                             TO BRANCH-ALTNT-CD    OF DCLVTRNFR           
LRM017         MOVE NAPPA-GEO-LOC  TO GEO-CD             OF DCLVTRNFR           
DJ0011     END-IF                                                               
                                                                                
           MOVE 0                  TO ACCT-EQUITY-AMT    OF DCLVTRNFR           
           MOVE 0                  TO ACCT-IRA-MAINT-AMT OF DCLVTRNFR           
           MOVE 0                  TO ACCT-IRA-TRMNT-AMT OF DCLVTRNFR           
           MOVE 0                  TO ACCT-TRNFR-FEE-AMT OF DCLVTRNFR           
           MOVE '0001-01-01'       TO STTLM-DT           OF DCLVTRNFR           
           MOVE 'V'                TO VAL-FREE-CD        OF DCLVTRNFR           
           MOVE W-CURRENT-TIMESTAMP TO CRT-TMSTP         OF DCLVTRNFR           
                                                                                
DJ0013     IF (W-NSCC-TI-TFR-TYPE = 'FUL' OR 'PTD' OR 'PTR')                    
DJ0013        EVALUATE BH-ACAT-ASCENDIS-USER                                    
DJ0013           WHEN '1'   MOVE 'A' TO NSCC-ACK-IND OF DCLVTRNFR               
DJ0013           WHEN '2'   MOVE 'P' TO NSCC-ACK-IND OF DCLVTRNFR               
DJ0013           WHEN OTHER MOVE ' ' TO NSCC-ACK-IND OF DCLVTRNFR               
DJ0013        END-EVALUATE                                                      
DJ0012     ELSE                                                                 
DJ0012         MOVE ' '        TO NSCC-ACK-IND       OF DCLVTRNFR               
DJ0012     END-IF.                                                              
                                                                                
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
                  ,ALERT_IND                                                    
LRM005            ,ACCT_RB_SEC_IND                                              
LRM005            ,ACCT_CLT_RSCND_IND                                           
LRM005            ,ACCT_LGL_BLK_IND                                             
DJ0009            ,FRV_MFC_CMPLT_IND                                            
DJ0007            ,ACCT_FRZN_IND                                                
DJ0009            ,BRANCH_ALTNT_CD                                              
DJ0009            ,GIFT_IND                                                     
DJ0009            ,RSTR_TRD_90_DY_IND                                           
DJ0009            ,REG_T_IND                                                    
DJ0009            ,ADOPT_AGRMT_IND                                              
DJ0009            ,RR_ORGNL_CD                                                  
LRM012            ,CVRSN_ACCT_NBR                                               
LRM017            ,GEO_CD                                                       
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
                  ,:DCLVTRNFR.ALERT-IND                                         
LRM005            ,:DCLVTRNFR.ACCT-RB-SEC-IND                                   
LRM005            ,:DCLVTRNFR.ACCT-CLT-RSCND-IND                                
LRM005            ,:DCLVTRNFR.ACCT-LGL-BLK-IND                                  
DJ0009            ,:DCLVTRNFR.FRV-MFC-CMPLT-IND                                 
DJ0007            ,:DCLVTRNFR.ACCT-FRZN-IND                                     
DJ0009            ,:DCLVTRNFR.BRANCH-ALTNT-CD                                   
DJ0009            ,:DCLVTRNFR.GIFT-IND                                          
DJ0009            ,:DCLVTRNFR.RSTR-TRD-90-DY-IND                                
DJ0009            ,:DCLVTRNFR.REG-T-IND                                         
DJ0009            ,:DCLVTRNFR.ADOPT-AGRMT-IND                                   
DJ0009            ,:DCLVTRNFR.RR-ORGNL-CD                                       
LRM012            ,:DCLVTRNFR.CVRSN-ACCT-NBR                                    
LRM017            ,:DCLVTRNFR.GEO-CD                                            
                 )                                                              
           END-EXEC.                                                            
                                                                                
           MOVE 'VTRNFR  '               TO W-DB2-TABLE-NAME                    
           MOVE 'INSERT'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           .                                                                    
       6200-EXIT. EXIT.                                                         
      /                                                                         
       6300-UPDATE-VTRNFR.                                                      
           MOVE '6300-UPDATE-VTRNFR            ' TO W-ROUTINE-1.                
                                                                                
           IF  STTLM-DT           OF DCLVTRNFR = ' '                            
               MOVE '0001-01-01'     TO STTLM-DT           OF DCLVTRNFR         
           END-IF                                                               
           IF  ACCT-IRA-MAINT-AMT OF DCLVTRNFR NOT NUMERIC                      
               MOVE 0                TO ACCT-IRA-MAINT-AMT OF DCLVTRNFR         
           END-IF                                                               
           IF  ACCT-IRA-TRMNT-AMT OF DCLVTRNFR NOT NUMERIC                      
               MOVE 0                TO ACCT-IRA-TRMNT-AMT OF DCLVTRNFR         
           END-IF                                                               
           IF  ACCT-TRNFR-FEE-AMT OF DCLVTRNFR NOT NUMERIC                      
               MOVE 0                TO ACCT-TRNFR-FEE-AMT OF DCLVTRNFR         
           END-IF                                                               
           IF  VAL-FREE-CD        OF DCLVTRNFR = ' '                            
               MOVE 'V'              TO VAL-FREE-CD        OF DCLVTRNFR         
           END-IF                                                               
LRM017     IF  GETNA-RETURN-FOUND                                               
LRM017        MOVE NAPPA-GEO-LOC     TO GEO-CD             OF DCLVTRNFR         
LRM017     ELSE                                                                 
LRM017        MOVE SPACES            TO GEO-CD             OF DCLVTRNFR         
LRM017     END-IF                                                               
LRM012*----------------------------------------------------------------         
LRM012* WHEN THE FULL DELIVERY TI CHANGE TAKES PLACE, WIPE OUT THE              
LRM012* CONVERSION ACCOUNT, AS THIS NO LONGER APPLIES TO ONGOING                
LRM012* PROCESSING SUCH A REJECT, TO PREVENT CAT500CV FROM USING THIS.          
LRM012*----------------------------------------------------------------         
LRM012     IF TRANS-TYPE-CD       OF DCLVTRNFR = 'C'                            
LRM012         MOVE SPACES      TO CVRSN-ACCT-NBR OF DCLVTRNFR                  
LRM012     END-IF                                                               
                                                                                
DJ0013     IF (W-NSCC-TI-TFR-TYPE = 'FUL' OR 'PTD' OR 'PTR')                    
DJ0013        EVALUATE BH-ACAT-ASCENDIS-USER                                    
DJ0013           WHEN '1'   MOVE 'A' TO NSCC-ACK-IND OF DCLVTRNFR               
DJ0013           WHEN '2'   MOVE 'P' TO NSCC-ACK-IND OF DCLVTRNFR               
DJ0013           WHEN OTHER MOVE ' ' TO NSCC-ACK-IND OF DCLVTRNFR               
DJ0013        END-EVALUATE                                                      
DJ0012     ELSE                                                                 
DJ0012         MOVE ' '        TO NSCC-ACK-IND       OF DCLVTRNFR               
DJ0012     END-IF.                                                              
                                                                                
LRM018* WIPE OUT STTLM-TM-CD WHEN REQUEST REJECT STATUS                         
LRM018     IF (W-NSCC-REQ-REJ                                                   
LRM020      OR W-NSCC-REVIEW-ADJ)                                               
LRM020        IF STTLM-TM-CD OF DCLVTRNFR = 'L'                                 
LRM018           MOVE SPACES TO STTLM-TM-CD OF DCLVTRNFR                        
TEST             DISPLAY                                                        
TEST                ' ' CLIENT-NBR OF DCLVTRNFR                                 
TEST                ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                           
TEST                ' NEW-STTS=' STTS-CD OF DCLVTRNFR                           
TEST                ' WAS=' W-SAVE-STTS-CD ' WIPE OUT LAST-DAY '                
LRM020        END-IF                                                            
LRM020     ELSE                                                                 
LRM020     IF STTS-CD OF DCLVTRNFR NOT = W-SAVE-STTS-CD                         
LRM020        IF W-NSCC-TI-TFR-TYPE      = 'FUL'                                
LRM020           IF (W-NSCC-REQ                                                 
LRM020            OR W-NSCC-REQ-ADJ                                             
LRM020            OR W-NSCC-REVIEW                                              
LRM020            OR W-NSCC-REVIEW-ADJ                                          
LRM020            OR W-NSCC-REVIEW-ACCEL                                        
LRM020            OR W-NSCC-REVIEW-ADJ-RCV-ACCL                                 
LRM020            OR W-NSCC-REJECT)                                             
LRM020              IF STTLM-TM-CD OF DCLVTRNFR = 'L'                           
TEST                   DISPLAY                                                  
TEST                    ' ' CLIENT-NBR OF DCLVTRNFR                             
TEST                    ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                       
TEST                    ' NEW-STTS=' STTS-CD OF DCLVTRNFR                       
TEST                    ' WAS=' W-SAVE-STTS-CD ' NOT LAST-DAY '                 
LRM020                 MOVE ' '    TO STTLM-TM-CD OF DCLVTRNFR                  
LRM020              END-IF                                                      
LRM020           ELSE                                                           
TEST                DISPLAY                                                     
TEST                 ' ' CLIENT-NBR OF DCLVTRNFR                                
TEST                 ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                          
TEST                 ' NEW-STTS=' STTS-CD OF DCLVTRNFR                          
TEST                 ' WAS=' W-SAVE-STTS-CD ' MARK AS LAST-DAY '                
LRM020              MOVE 'L'    TO STTLM-TM-CD OF DCLVTRNFR                     
LRM018     END-IF.                                                              
                                                                                
LRM026*** CAT754 MARKS THE TRANSFER AS 110-IND = S WHEN THE DAY1 SPAD           
LRM026*** MESSAGES WERE CREATED FOR THIS TRANSFER AND PRIOR ACCOUNT.            
LRM026*** WHEN ACCOUNT CHANGED OR SPAD NOT SENT BECAUSE OF DAY1 REJECT,         
LRM026*** MARK THE TRANSFER AS DAY1 SPAD NEEDED, 110-IND = Y.                   
LRM026     IF W-SAVE-STTS-CD = '140'                                            
LRM026     AND STTS-CD OF DCLVTRNFR = '110'                                     
LRM026     AND W-SAVE-PRCS-DT NOT = PRCS-DT OF DCLVTRNFR                        
LRM026     AND (W-OLD-ACCOUNT NOT = W-NEW-ACCOUNT                               
LRM026      OR (W-OLD-ACCOUNT = W-NEW-ACCOUNT                                   
LRM026      AND TRNFR-STTS-110-IND OF DCLVTRNFR NOT = 'S'))                     
LRM026        MOVE 'Y' TO TRNFR-STTS-110-IND OF DCLVTRNFR                       
TEST          DISPLAY 'MARK AS NEED SPAD TOA'                                   
TEST          DISPLAY                                                           
TEST                ' ' CLIENT-NBR OF DCLVTRNFR                                 
TEST                ' ' ACAT-CONTROL-NBR OF DCLVTRNFR                           
TEST                ' NEW-STTS=' STTS-CD OF DCLVTRNFR                           
TEST                ' WAS=' W-SAVE-STTS-CD ' RE-SUBMITTED'                      
TEST                ' ACCT=' W-NEW-ACCOUNT                                      
TEST                ' WAS=' W-OLD-ACCOUNT                                       
TEST                ' PRCS-DT ' PRCS-DT OF DCLVTRNFR                            
LRM026              ' WAS=' W-SAVE-PRCS-DT                                      
LRM026     END-IF.                                                              
                                                                                
           EXEC SQL                                                             
             UPDATE VTRNFR                                                      
                SET                                                             
                   CLIENT_NBR          = :DCLVTRNFR.CLIENT-NBR                  
                  ,ACAT_CONTROL_NBR    = :DCLVTRNFR.ACAT-CONTROL-NBR            
                  ,SBMTG_PRTCP_NBR     = :DCLVTRNFR.SBMTG-PRTCP-NBR             
                  ,SBMT_PRT_NR_STS_CD  = :DCLVTRNFR.SBMT-PRT-NR-STS-CD          
                  ,CONTROL_NBR_STS_CD  = :DCLVTRNFR.CONTROL-NBR-STS-CD          
                  ,DLVR_NBR            = :DCLVTRNFR.DLVR-NBR                    
                  ,DLVR_NBR_STTS_CD    = :DCLVTRNFR.DLVR-NBR-STTS-CD            
                  ,ACCT_DLVR_NBR       = :DCLVTRNFR.ACCT-DLVR-NBR               
                  ,ACCT_DLVR_STTS_CD   = :DCLVTRNFR.ACCT-DLVR-STTS-CD           
                  ,RCV_NBR             = :DCLVTRNFR.RCV-NBR                     
                  ,RCV_NBR_STTS_CD     = :DCLVTRNFR.RCV-NBR-STTS-CD             
                  ,ACCT_RCV_NBR        = :DCLVTRNFR.ACCT-RCV-NBR                
                  ,ACCT_RCV_STTS_CD    = :DCLVTRNFR.ACCT-RCV-STTS-CD            
                  ,TRNFR_TYPE_CD       = :DCLVTRNFR.TRNFR-TYPE-CD               
                  ,TRNFR_TYPE_STTS_CD  = :DCLVTRNFR.TRNFR-TYPE-STTS-CD          
                  ,TRANS_TYPE_CD       = :DCLVTRNFR.TRANS-TYPE-CD               
                  ,TRANS_TYPE_STTS_CD  = :DCLVTRNFR.TRANS-TYPE-STTS-CD          
                  ,RCV_CUST_NM         = :DCLVTRNFR.RCV-CUST-NM                 
                  ,RCV_CUST_NM_STS_CD  = :DCLVTRNFR.RCV-CUST-NM-STS-CD          
                  ,RCV_SS_PRIM_NBR     = :DCLVTRNFR.RCV-SS-PRIM-NBR             
                  ,RCV_SS_PRIM_STS_CD  = :DCLVTRNFR.RCV-SS-PRIM-STS-CD          
                  ,RCV_SS_SCNDY_NBR    = :DCLVTRNFR.RCV-SS-SCNDY-NBR            
                  ,RCV_SS_SCDY_STS_CD  = :DCLVTRNFR.RCV-SS-SCDY-STS-CD          
                  ,RCV_ACCT_TYPE_CD    = :DCLVTRNFR.RCV-ACCT-TYPE-CD            
                  ,RCV_ACT_TYP_STS_CD  = :DCLVTRNFR.RCV-ACT-TYP-STS-CD          
                  ,RCV_OCC_BRKR_NBR    = :DCLVTRNFR.RCV-OCC-BRKR-NBR            
                  ,RCV_OCC_STTS_CD     = :DCLVTRNFR.RCV-OCC-STTS-CD             
                  ,RCV_CRSPN_NBR       = :DCLVTRNFR.RCV-CRSPN-NBR               
                  ,RCV_CRSPN_STTS_CD   = :DCLVTRNFR.RCV-CRSPN-STTS-CD           
                  ,ACAT_CNTL_ASTD_NBR  = :DCLVTRNFR.ACAT-CNTL-ASTD-NBR          
                  ,CNTL_ASTD_STTS_CD   = :DCLVTRNFR.CNTL-ASTD-STTS-CD           
                  ,CMNT_TXT            = :DCLVTRNFR.CMNT-TXT                    
                  ,CMNT_STTS_CD        = :DCLVTRNFR.CMNT-STTS-CD                
                  ,PRCS_DT             = :DCLVTRNFR.PRCS-DT                     
                  ,STTS_CD             = :DCLVTRNFR.STTS-CD                     
                  ,STTLM_TM_CD         = :DCLVTRNFR.STTLM-TM-CD                 
                  ,VAL_FREE_CD         = :DCLVTRNFR.VAL-FREE-CD                 
                  ,TRANS_RFRN_ID_CD    = :DCLVTRNFR.TRANS-RFRN-ID-CD            
                  ,TRANS_RFRN_STTS_CD  = :DCLVTRNFR.TRANS-RFRN-STTS-CD          
                  ,DB_CR_CD            = :DCLVTRNFR.DB-CR-CD                    
                  ,DSTBN_SIDE_CD       = :DCLVTRNFR.DSTBN-SIDE-CD               
                  ,SYS_ACT_CD          = :DCLVTRNFR.SYS-ACT-CD                  
                  ,SYS_RJCT_RSN_CD     = :DCLVTRNFR.SYS-RJCT-RSN-CD             
                  ,TRNFR_TYPE_RJC1_CD  = :DCLVTRNFR.TRNFR-TYPE-RJC1-CD          
                  ,TRNFR_TYPE_RJC2_CD  = :DCLVTRNFR.TRNFR-TYPE-RJC2-CD          
                  ,TRNFR_TYPE_RJCT_CD  = :DCLVTRNFR.TRNFR-TYPE-RJCT-CD          
                  ,TRN_TYP_RJC_STS_CD  = :DCLVTRNFR.TRN-TYP-RJC-STS-CD          
                  ,PHSCL_SEQ_NBR       = :DCLVTRNFR.PHSCL-SEQ-NBR               
                  ,PHSCL_SEQ_STTS_CD   = :DCLVTRNFR.PHSCL-SEQ-STTS-CD           
                  ,LGCL_SEQ_NBR        = :DCLVTRNFR.LGCL-SEQ-NBR                
                  ,LGCL_SEQ_NR_STS_CD  = :DCLVTRNFR.LGCL-SEQ-NR-STS-CD          
                  ,RR_CD               = :DCLVTRNFR.RR-CD                       
                  ,BRANCH_CD           = :DCLVTRNFR.BRANCH-CD                   
                  ,DVDND_NAA_CD        = :DCLVTRNFR.DVDND-NAA-CD                
                  ,SELL_INSTN_NAA_CD   = :DCLVTRNFR.SELL-INSTN-NAA-CD           
                  ,CASH_SWEEP_NAA_CD   = :DCLVTRNFR.CASH-SWEEP-NAA-CD           
                  ,PRTCP_CONTRA_CD     = :DCLVTRNFR.PRTCP-CONTRA-CD             
                  ,ACM_HOLDER_NAA_CD   = :DCLVTRNFR.ACM-HOLDER-NAA-CD           
                  ,ACCT_ACTIVITY_IND   = :DCLVTRNFR.ACCT-ACTIVITY-IND           
                  ,ACCT_ORDERS_IND     = :DCLVTRNFR.ACCT-ORDERS-IND             
                  ,ACCT_RJCT_RSBM_IND  = :DCLVTRNFR.ACCT-RJCT-RSBM-IND          
                  ,ACCT_DB_BAL_T1_IND  = :DCLVTRNFR.ACCT-DB-BAL-T1-IND          
                  ,ACCT_MRGN_DB_IND    = :DCLVTRNFR.ACCT-MRGN-DB-IND            
                  ,ACCT_SHRT_PSTN_IND  = :DCLVTRNFR.ACCT-SHRT-PSTN-IND          
                  ,ACCT_SEC_RSTRD_IND  = :DCLVTRNFR.ACCT-SEC-RSTRD-IND          
                  ,ACCT_AST_EXCS_IND   = :DCLVTRNFR.ACCT-AST-EXCS-IND           
                  ,ACCT_OPTN_PSTN_IND  = :DCLVTRNFR.ACCT-OPTN-PSTN-IND          
                  ,ACCT_LTD_PRTNR_IND  = :DCLVTRNFR.ACCT-LTD-PRTNR-IND          
                  ,ACCT_TIN_MSMTH_IND  = :DCLVTRNFR.ACCT-TIN-MSMTH-IND          
                  ,ACCT_DPLCT_TRN_IND  = :DCLVTRNFR.ACCT-DPLCT-TRN-IND          
                  ,ACCT_CUST_70_IND    = :DCLVTRNFR.ACCT-CUST-70-IND            
                  ,ACCT_QULFD_PLN_IND  = :DCLVTRNFR.ACCT-QULFD-PLN-IND          
                  ,ACCT_MNGD_IND       = :DCLVTRNFR.ACCT-MNGD-IND               
                  ,ACCT_PRVT_RNG_IND   = :DCLVTRNFR.ACCT-PRVT-RNG-IND           
                  ,ACCT_BRKR_TIF_IND   = :DCLVTRNFR.ACCT-BRKR-TIF-IND           
                  ,NSCC_NON_ADP_IND    = :DCLVTRNFR.NSCC-NON-ADP-IND            
                  ,CYCLE_CD            = :DCLVTRNFR.CYCLE-CD                    
                  ,DAYS_STTS_QTY       = :DCLVTRNFR.DAYS-STTS-QTY               
                  ,STTLM_DT            = :DCLVTRNFR.STTLM-DT                    
                  ,ACCT_NA_UPDT_IND    = :DCLVTRNFR.ACCT-NA-UPDT-IND            
                  ,ACCT_TRNFR_FEE_AMT  = :DCLVTRNFR.ACCT-TRNFR-FEE-AMT          
                  ,ACCT_IRA_TRMNT_AMT  = :DCLVTRNFR.ACCT-IRA-TRMNT-AMT          
                  ,ACCT_IRA_MAINT_AMT  = :DCLVTRNFR.ACCT-IRA-MAINT-AMT          
                  ,ACCT_DLRV_PRGR_IND  = :DCLVTRNFR.ACCT-DLRV-PRGR-IND          
                  ,ACCT_CD             = :DCLVTRNFR.ACCT-CD                     
                  ,STTLM_ASCTD_DT      = :DCLVTRNFR.STTLM-ASCTD-DT              
                  ,STTLM_ASCTD_STS_CD  = :DCLVTRNFR.STTLM-ASCTD-STS-CD          
                  ,RCRD_LNGTH_STTS_CD  = :DCLVTRNFR.RCRD-LNGTH-STTS-CD          
                  ,RCRD_STTS_CD        = :DCLVTRNFR.RCRD-STTS-CD                
                  ,NSCC_PEND_CD        = :DCLVTRNFR.NSCC-PEND-CD                
                  ,NSCC_ACK_IND        = :DCLVTRNFR.NSCC-ACK-IND                
                  ,CICS_TERM_ID_CD     = :DCLVTRNFR.CICS-TERM-ID-CD             
                  ,PRGM_NM             = :DCLVTRNFR.PRGM-NM                     
                  ,CRT_TMSTP           = :DCLVTRNFR.CRT-TMSTP                   
                  ,UPDT_TMSTP          = :DCLVTRNFR.UPDT-TMSTP                  
                  ,ACCT_EQUITY_AMT     = :DCLVTRNFR.ACCT-EQUITY-AMT             
                  ,ALERT_IND           = :DCLVTRNFR.ALERT-IND                   
LRM005            ,ACCT_RB_SEC_IND     = :DCLVTRNFR.ACCT-RB-SEC-IND             
LRM005            ,ACCT_CLT_RSCND_IND  = :DCLVTRNFR.ACCT-CLT-RSCND-IND          
LRM005            ,ACCT_LGL_BLK_IND    = :DCLVTRNFR.ACCT-LGL-BLK-IND            
DJ0009            ,FRV_MFC_CMPLT_IND   = :DCLVTRNFR.FRV-MFC-CMPLT-IND           
DJ0007            ,ACCT_FRZN_IND       = :DCLVTRNFR.ACCT-FRZN-IND               
DJ0009            ,GIFT_IND            = :DCLVTRNFR.GIFT-IND                    
DJ0009            ,RSTR_TRD_90_DY_IND  = :DCLVTRNFR.RSTR-TRD-90-DY-IND          
DJ0009            ,REG_T_IND           = :DCLVTRNFR.REG-T-IND                   
DJ0009            ,ADOPT_AGRMT_IND     = :DCLVTRNFR.ADOPT-AGRMT-IND             
DJ0009            ,RR_ORGNL_CD         = :DCLVTRNFR.RR-ORGNL-CD                 
LRM012            ,CVRSN_ACCT_NBR      = :DCLVTRNFR.CVRSN-ACCT-NBR              
LRM017            ,GEO_CD              = :DCLVTRNFR.GEO-CD                      
LRM026            ,TRNFR_STTS_110_IND  = :DCLVTRNFR.TRNFR-STTS-110-IND          
                WHERE  CLIENT_NBR        = :W-NSCC-KEY-CLIENT-NBR               
                  AND  ACAT_CONTROL_NBR  = :W-NSCC-TI-ACAT-CTL-NBR              
           END-EXEC.                                                            
                                                                                
           MOVE 'VTRNFR  '               TO W-DB2-TABLE-NAME                    
           MOVE 'UPDATE'                 TO W-DB2-ACTION                        
           MOVE SQLCODE                  TO W-DB2-SQLCODE                       
           .                                                                    
       6300-EXIT. EXIT.                                                         
      /                                                                         
       7100-SQL-COMMIT.                                                         
                                                                                
           EXEC SQL COMMIT                                                      
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO COMMIT-SQLCA                                         
           MOVE SQLCODE TO COMMIT-RETURN                                        
                                                                                
           IF  COMMIT-AB                                                        
               DISPLAY 'CAT513: '                                               
                   'SQL COMMIT FAILED. COMMIT-RETURN= '                         
                    COMMIT-RETURN                                               
                  ' INFILE-CNT= '           W-INFILE-CNT                        
                    ' PREV-CNT= '           W-LAST-COMMIT-INFILE-CNT            
                      ' TI-CNT= '           W-TI-CNT                            
           ELSE                                                                 
DJ0001         ADD 1 TO W-COMMIT-CNT                                            
           END-IF.                                                              
                                                                                
           MOVE W-INFILE-CNT             TO W-LAST-COMMIT-INFILE-CNT.           
                                                                                
       7100-EXIT. EXIT.                                                         
      /                                                                         
       7200-SQL-ROLLBACK.                                                       
           DISPLAY '7200-SQL-ROLLBACK'                                          
                  ' INFILE-CNT = ' W-INFILE-CNT                                 
                  ' LAST-COMMIT-INFILE-CNT = '                                  
                                            W-LAST-COMMIT-INFILE-CNT            
                                                                                
           EXEC SQL ROLLBACK WORK                                               
           END-EXEC                                                             
                                                                                
           MOVE SQLCA   TO ROLLBACK-SQLCA                                       
           MOVE SQLCODE TO ROLLBACK-RETURN                                      
                                                                                
           IF ROLLBACK-AB                                                       
               DISPLAY 'CAT513: '                                               
                   'AUTO ROLLBACK FAILED. ROLLBACK-RETURN = '                   
                   ROLLBACK-RETURN                                              
           ELSE                                                                 
               DISPLAY 'CAT513: '                                               
                   'AUTO ROLLBACK SUCCESSFUL. ROLLBACK-RETURN = '               
                   ROLLBACK-RETURN                                              
           END-IF.                                                              
                                                                                
       7200-EXIT. EXIT.                                                         
      /                                                                         
       7900-DISPLAY-KEY.                                                        
           DISPLAY '   KEY:'                                                    
                                 ' CLT=' W-NSCC-KEY-CLIENT-NBR                  
                                 ' CTL=' W-NSCC-TI-ACAT-CTL-NBR                 
                                 ' TFR=' W-NSCC-TI-TFR-TYPE                     
                                 ' TRN=' W-NSCC-TI-TRAN-TYPE                    
                                 ' STA=' W-NSCC-STATUS                          
                                 ' ACT=' W-NSCC-SYSTEM-ACTION                   
                                 ' REJ=' W-NSCC-SYSTEM-REJ-RSN                  
           DISPLAY '       '                                                    
                                 ' SUB=' W-NSCC-TI-SUB-PART-NBR                 
                                 ' DLV=' W-NSCC-TI-DEL-NBR                      
                              ' DLV-AC=' W-NSCC-TI-DEL-ACCT-NBR                 
                                 ' RCV=' W-NSCC-TI-RCV-NBR                      
                              ' RCV-AC=' W-NSCC-TI-RCV-ACCT-NBR                 
           .                                                                    
       7900-EXIT. EXIT.                                                         
      /                                                                         
       8000-SQL-ERROR.                                                          
           DISPLAY ' '                                                          
           DISPLAY '8000-SQL-ERROR'                                             
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
                                                                                
           PERFORM 7200-SQL-ROLLBACK THRU 7200-EXIT                             
                                                                                
           DISPLAY 'CAT513: U3999 - ABENDING ON BAD DB2 STATUS'                 
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT513: PROGRAM ENDED ABNORMALLY'                           
           MOVE +3999    TO ABEND-CD                                            
TCK001     CALL ABEND USING ABEND-CD.                                           
                                                                                
       8000-EXIT. EXIT.                                                         
      /                                                                         
       8900-DISPLAY-CNT.                                                        
           DISPLAY ' '                                                          
           DISPLAY 'CAT513: INFILE  COUNT      = ' W-INFILE-CNT                 
                 ' (INCLUDES HEADER AND TRAILER)'                               
           DISPLAY 'CAT513: DETAIL  COUNT      = ' W-DETAIL-CNT                 
                 ' (EXCLUDES HEADER AND TRAILER)'                               
           DISPLAY 'CAT513: W-TI-CNT  (TRANSFER)    = ' W-TI-CNT                
           DISPLAY ' '                                                          
           DISPLAY 'CAT513: W-LOAD-CNT         = ' W-LOAD-CNT                   
           DISPLAY ' '                                                          
           DISPLAY 'CAT513: W-GETNA-FND-CNT    = ' W-GETNA-FND-CNT              
                          ' W-GETNA-NOTFND-CNT = ' W-GETNA-NOTFND-CNT           
           DISPLAY 'CAT513: W-VALERT-FND-CNT   = ' W-VALERT-FND-CNT             
                          ' W-VALERT-NOTFND-CNT= ' W-VALERT-NOTFND-CNT          
LRM005     DISPLAY 'CAT513: W-RESCIND-BLOCK-CNT= ' W-RESCIND-BLOCK-CNT          
LRM005     DISPLAY 'CAT513: W-LEGAL-BLOCK-CNT  = ' W-LEGAL-BLOCK-CNT            
           DISPLAY 'CAT513: W-EDIT-DELIVERY-CNT= ' W-EDIT-DELIVERY-CNT          
           DISPLAY 'CAT513: W-EDIT-RECEIVE-CNT = ' W-EDIT-RECEIVE-CNT           
DJ0003     DISPLAY 'CAT513: W-PTR-EDIT-DEL-CNT = ' W-PTR-EDIT-DEL-CNT           
           DISPLAY 'CAT513: W-VTRNFR-DUPE-CNT  = ' W-VTRNFR-DUPE-CNT            
           DISPLAY 'CAT513: W-TIN-MATCHED      = ' W-TIN-MATCHED-CNT            
                          ' W-TIN-MISMATCHED   = ' W-TIN-MISMATCHED-CNT         
           DISPLAY 'CAT513: W-CUST-TYPE-MATCHED= '                              
                                                W-CUST-TYPE-MATCHED-CNT         
                          ' W-CUST-TYPE-UNMATCH= '                              
                                                W-CUST-TYPE-UNMATCH-CNT         
           DISPLAY 'CAT513: W-SPECIAL-ACCOUNTS = '                              
                                                W-SPECIAL-ACCT-FND-CNT          
           DISPLAY 'CAT513: W-REJ-CMT-CNT      = ' W-REJ-CMT-CNT                
           DISPLAY 'CAT513: VTRNFR-FND-CNT     = ' W-VTRNFR-FND-CNT             
                          ' VTRNFR-NOT-FND-CNT = ' W-VTRNFR-NOT-FND-CNT         
DJ0010     DISPLAY 'CAT513: W-ADTCUS-CNT       = ' W-ADTCUS-CNT                 
LRM012     DISPLAY 'CAT513: W-AUXFILE-CNT      = ' W-AUXFILE-CNT                
           DISPLAY ' '                                                          
DJ0001     DISPLAY 'CAT513: W-COMMIT-CNT       = ' W-COMMIT-CNT                 
           DISPLAY 'CAT513: VTRNFR-ADD-CNT     = ' W-VTRNFR-ADD-CNT             
                          ' VTRNFR-NOT-ADD-CNT = ' W-VTRNFR-NOT-ADD-CNT         
           DISPLAY 'CAT513: VTRNFR-UPD-CNT     = ' W-VTRNFR-UPD-CNT             
                          ' VTRNFR-NOT-UPD-CNT = ' W-VTRNFR-NOT-UPD-CNT         
           DISPLAY 'CAT513: ACTITRF-DEL-CNT    = ' W-ACTITRF-DEL-CNT            
                          ' ACTITRF-NOTDEL-CNT = '                              
                                               W-ACTITRF-NOT-DEL-CNT            
           DISPLAY 'CAT513: ACTITRF-ADD-CNT    = ' W-ACTITRF-ADD-CNT            
                          ' ACTITRF-NOTADD-CNT = '                              
                                               W-ACTITRF-NOT-ADD-CNT            
           DISPLAY 'CAT513: ACTITRF-UPD-CNT    = ' W-ACTITRF-UPD-CNT            
                          ' ACTITRF-NOTUPD-CNT = '                              
                                               W-ACTITRF-NOT-UPD-CNT            
           .                                                                    
       8900-EXIT. EXIT.                                                         
      /                                                                         
       9000-CLOSE-ROUTINE.                                                      
           MOVE '9000-CLOSE-ROUTINE            ' TO W-ROUTINE-1.                
                                                                                
           DISPLAY ' '.                                                         
                                                                                
           CLOSE INFILE                                                         
           DISPLAY 'CAT513: INFILE  CLOSED. STATUS = '                          
                                             INFILE-STAT.                       
                                                                                
DJ0010     CLOSE ADTCUS                                                         
DJ0010     DISPLAY 'CAT513: ADTCUS  CLOSED. STATUS = '                          
DJ0010                                       ADTCUS-STAT.                       
                                                                                
LRM012     CLOSE AUXFILE                                                        
LRM012     DISPLAY 'CAT513: AUXFILE  CLOSED. STATUS = '                         
LRM012                                       AUXFILE-STAT.                      
                                                                                
           PERFORM 8900-DISPLAY-CNT THRU 8900-EXIT                              
           DISPLAY 'CAT513: PROGRAM ENDED SUCCESSFULLY'.                        
                                                                                
       9000-EXIT. EXIT.                                                         
      *################################################################         
