000001* PDX    - ACAT13IF C0331385 09/20/12 08:25:46 TBLAMUR            00001000
000001* LRM015 SSR 85941 BLOCK FRV ENTRY IF ASSET ALREADY FRV-ED.               
000001* PDX    - ACAT13IF C0318727 01/11/12 13:31:02 TBLAMUR            00001000
000001* PDX    - ACAT13IF C0296313 05/12/10 10:04:38 TBLAMUR            00001000
000001* LRM014 SSR 62894 CHANGE PF2 MESSAGE AFTER FRV INSERT.                   
000001* PDX    - ACAT13IF C0290044 12/30/09 14:32:32 TBLAMUR            00001000
000001* LRM013 - SSR 65717 ADD MSG WHEN ALL ELIGIBLE ASSETS ARE ACTIVE          
000001* PDX    - ACAT13IF C0270299 09/15/08 16:29:40 TBLAMUR            00001000
000001* LRM SSRS 55766 55717 RECOMPILE ONLY FOR COPYS ACATCOM,90TS,JUMP.        
000001* PDX    - ACAT13IF C0250441 06/25/07 13:54:39 TBLAMUR            00001000
000001* LRM012 - SSR 53075 SPIN-OFF CHANGES                                     
000001* PDX    - ACAT13IF C0233602 06/20/06 10:13:15 TBLAMUR            00001000
000001* LRM011 - SSR# 40661 RETAIN USER ID OF INITIATOR.                        
000001* PDX    - ACAT13IF C0230185 01/30/06 11:37:35 TBEDTAK            00001000
000001* ET0010 - SSR39684: ALLOW USERS TO SCROLL THRU NEWLY ENTERED FRVS00001000
000001* PDX    - ACAT13IF C0222638 07/05/05 14:30:59 TBEDTAK            00001000
000001* ET0009 - SSR 43163 - DO NOT DISPLAY ASSETS ALREADY INVOLVED WITH00001000
000001*        - ANOTHER FRV.                                           00001000
000001* PDX    - ACAT13IF C0216719 04/22/05 14:03:34 TBEDTAK            00001000
000001* ET0008 - ALLOW DUPLICATE FRVS WHILE FRV RECORD IN INIT TBL.     00001000
000001*        - PF7 & 8 FOR MULTI FRVS WITHIN SAME ACCT FROM INIT TBL. 00001000
000001* PDX    - ACAT13IF C0215192 01/24/05 13:40:16 TBEDTAK            00001000
000001* ET0007 - DROP COMMENTS CARRIED FROM ORIGINAL FULL TRANSFER      00001000
000001* ET0006 - FIX BUG - DISABLE DELETE FUNCTION IF NSCC_PEND IS 'Y'  00001000
000001* PDX    - ACAT13IF C0210492 10/18/04 14:08:53 TBEDTAK            00001000
000001* ET0005 - DISPLAY ADP NBR IF ASSET HAS NO CUSIP                  00001000
000001*          DISPLAY WARNING MESSAGE IF ASSET HAS NO CUSIP & ADP NBR00001000
000001* ET0004 - SSR 34535 - ADD "SEARCH BY CAGE TAG#" FIELD            00001000
000001* ET0003 - SSR 34535 - CAGE TAG NUMBER FROM ORIGINAL FAIL         00001000
000001* PDX    - ACAT13IF C0205792 08/24/04 17:10:35 TBEDTAK            00001000
000001* ET0002 - FIX BUG - PF10 AT COMMENT SCREEN IS NOT RETURNING      00001000
000001*          CONTROL BACK TO FRV SCREEN BUT TO 'S' SCREEN WHILE FRV 00001000
000001*          SCREEN IS BEING BROWSED VIA 'S' SCREEN.                00001000
000001* ET0001 - ALLOW DELIVERER TO RECLAIM NON-STANDARD TRANSFERS.     00001000
000001*        - ALLOW MULTI TRANSFERS OF AN ACCOUNT TO BE RECLAIMED.   00001000
000001*        - ADD SCROLLING FUNCTION (PF7 & PF8) FOR THE MULTI TRNS. 00001000
000001* PDX    - ACAT13IF C0204666 04/15/04 10:49:43 TBLAMUR            00001000
000001* SSR 0037930 ALLOW FRV FOR SETTLE LOC 10                                 
000001* PDX    - ACAT13IF C0179784 09/26/02 14:36:04 TBEDTAK            00001000
000001* PDX    - ACAT13IF C0160324 06/25/01 08:31:55 TBLAMUR            00001000
000001* PDX    - ACAT13IF C0123136 04/08/99 16:43:29 TBEDTAK            00001000
000001* PDX    - ACAT13IF C0122652 03/05/99 10:56:46 TBEDTAK            00001000
000001* PDX    - ACAT13IF C0121529 02/10/99 15:26:13 TBEDTAK            00001000
000001* PDX    - ACAT13IF C0120330 01/31/99 16:23:03 TBCHLUO            00001000
000001* PDX    - ACAT13IF C0119329 01/06/99 17:02:28 TBEDTAK            00001000
000001* PDX    - ACAT13IF C0117817 12/07/98 15:25:11 TBEDTAK            00001000
000001* PDX    - ACAT13IF C0109165 08/18/98 11:43:28 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT13IF.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *              ACAT INITIATE A FAIL REVERSAL                    *         
      *****************************************************************         
      * - THE PURPOSE OF THIS PROGRAM IS TO HAVE USER ISSUE A FAIL    *         
      *   REVERSAL AGAINST BOTH THE ACCOUNT AND THE ASSET.            *         
      * - UPON RECLAIM, THE PROGRAM READS AND EXAMINES ACTIVE TRANSFER*         
      *   AND ASSET TABLES TO MAKE SURE THERE ARE NO DUPLICATE RAIL   *         
      *   REVERSALS EXIST, AND THEN CREATES INIT_TRNFR & INIT_ASSET.  *         
      * - NEWLY CREATED REVERSAL TRANSFER CAN BE DELETED IF IT HAS    *         
      *   NOT BEEN TRANSMITTED TO NSCC.                               *         
      * - THE USER MUST PLACE A CURSOR AT ACCOUNT FIELD AREA IF       *         
      *   ACCOUNT LEVEL COMMENT IS TO BE ATTACHED, OR AT EACH ASSET   *         
      *   FIELD AREA IF SECURITY LEVEL COMMENTS ARE TO BE ATTACHED,   *         
      *   THEN PRESS PF1 TO GET COMMENT POP-UP SCREEN.                *         
      * - THE USER CAN ENTER '?' AT REASON CODE FIELD TO GET A POP-UP *         
      *   SCREEN FOR THE REASON CODE SELECTION SCREEN.                *         
      * - THE PROGRAM ALSO HANDLES TO VIEW THE DETAILS OF PENDING     *         
      *   FAIL REVERSAL THRU "ACAT21PT" (PENDING INQUIRY) WHICH       *         
      *   TRANSFERS PROGRAM CONTROL TO THIS PROGRAM.                  *         
      * - REJECTED REVERSAL TRANSFER CAN BE RESURRECTED THRU          *         
      *   "ACAT15TC" (REJECTED BY CONTRA BROKER) WHICH TRANSFERS A    *         
      *   PROGRAM CONTROL TO THIS PROGRAM.                            *         
ET0003* - XCTL FROM ACAT25PD (ASSET INQUIRY) VIA HISTORY TRNFR INQUIRY*         
ET0003*   TO INITIATE FAIL REVERSAL.                                  *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
       77  TWA-SIZE                       PIC S9(4) COMP.                       
       77  ACATVR-DATASET                 PIC X(08) VALUE 'ACATIT'.             
       77  WS-EDITMOD                     PIC X(08) VALUE 'ACATEDIT'.           
       77  CURR-EDIT-LEN                  PIC S9(4) COMP  VALUE +35.            
ET0004 77  CAGETAG-IX-DATASET             PIC X(08) VALUE 'ACATCG  '.           
ET0009 77  MAX-TBL                        PIC S9(7) COMP-3 VALUE +800.          
      *                                                                         
       01  TSQ-WORK-AREA.                                                       
           05  TWA-TSQ.                                                         
               09  TSQ-NAME.                                                    
                   11 TERM-ID             PIC X(04).                            
                   11 TRAN-ID             PIC X(04).                            
               09  ITEM-NUM               PIC S9(04) COMP VALUE +1.             
           05  HIST-ASSET-TSQ.                                                  
               09  WS-HST-TSQ-NAME.                                             
                   11 WS-HST-TERM         PIC X(04).                            
                   11 FILLER              PIC X(04) VALUE '13HS'.               
               09  WS-HST-ITEM            PIC S9(04) COMP VALUE +1.             
           05  INIT-ASSET-TSQ.                                                  
               09  WS-INI-TSQ-NAME.                                             
                   11 WS-INI-TERM         PIC X(04).                            
                   11 FILLER              PIC X(04) VALUE '13IN'.               
               09  WS-INI-ITEM            PIC S9(04) COMP VALUE +1.             
      *                                                                         
       01  WS-DATE-AREA.                                                        
           05  WSABSTIME           PIC S9(08) COMP.                             
           05  WSMMDDYY.                                                        
               09 WS-CUR-MM        PIC XX.                                      
               09  FILLER          PIC X.                                       
               09 WS-CUR-DD        PIC XX.                                      
               09  FILLER          PIC X.                                       
               09 WS-CUR-YY        PIC XX.                                      
           05  WSDATESEP           PIC X(01) VALUE '/'.                         
           05  WSTIME.                                                          
               09  WS-TIME-HH      PIC XX.                                      
               09  FILLER          PIC X.                                       
               09  WS-TIME-MM      PIC XX.                                      
               09  FILLER          PIC X.                                       
               09  WS-TIME-SS      PIC XX.                                      
           05  WSTIMESEP           PIC X(01) VALUE ':'.                         
           05  WS-DB2-FORM-DATE.                                                
               09  WS-DATE-CC      PIC X(02).                                   
               09  WS-DATE-YY      PIC X(02).                                   
               09  FILLER          PIC X(01).                                   
               09  WS-DATE-MM      PIC X(02).                                   
               09  FILLER          PIC X(01).                                   
               09  WS-DATE-DD      PIC X(02).                                   
           05  WS-EDITED-DATE.                                                  
               09  WS-EDITED-MM    PIC X(02).                                   
               09  FILLER          PIC X(01) VALUE '/'.                         
               09  WS-EDITED-DD    PIC X(02).                                   
               09  FILLER          PIC X(01) VALUE '/'.                         
               09  WS-EDITED-YY    PIC X(02).                                   
ET0004*                                                                         
ET0004*                                                                         
ET0004 01  WS-CAGE-TAG-KEY.                                                     
ET0004     05  WS-CAGE-TAG-CLT           PIC X(04).                             
ET0004     05  WS-CAGE-TAG-NBR           PIC X(11).                             
ET0004     05  WS-CAGE-TAG-ACAT-NBR      PIC X(14).                             
      *                                                                         
       01  B1-RECORD.                                                           
           05  B1-REC-ID.                                                       
               09  B1-CLIENT-NO          PIC 9(03) COMP-3.                      
               09  B1-CARD-NO            PIC 9(07) COMP-3.                      
               09  B1-CLIENT             PIC 9(03) COMP-3.                      
               09  B1-SEQUENCE           PIC 9(05) COMP-3 VALUE 1.              
           05  B1-REC-TYP-3              PIC X(01) VALUE '3'.                   
           05  B1-COUNTRY                PIC X(03).                             
           05  FILLER                    PIC X(07).                             
      *--------------------------------------------------------------*          
      *      EDITMOD WORK AREA                                       *          
      *--------------------------------------------------------------*          
       01  EDIT-AMT-AREA.                                                       
           05  WK-AMT-CODE                PIC X(01) VALUE 'D'.                  
           05  WK-AMT-NUM-ITEM            PIC S9(03) COMP-3 VALUE +1.           
           05  WK-AMT-IN-LEN              PIC S9(03) COMP-3 VALUE +19.          
           05  WK-AMT-OUT-LEN             PIC S9(03) COMP-3 VALUE +17.          
           05  WK-AMT-IN                  PIC X(19) VALUE LOW-VALUE.            
           05  WK-AMT-OUT                 PIC S9(15)V99.                        
           05  WK-AMT-DECIMAL-LEN         PIC S9(03) COMP-3 VALUE +2.           
           05  WK-AMT-COMMAR              PIC X(01) VALUE 'Y'.                  
           05  WK-AMT-RET-CODE            PIC X(01) VALUE SPACE.                
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.           
                                                                                
       01  WK-FORMATTED-AMT.                                                    
           05  WK-AMT-COMMAS-3      PIC ZZZ,ZZZ,ZZZ,ZZZ.99-.                    
           05  WK-AMT-COMMAS-2      PIC ZZZZZZZ,ZZZ,ZZZ.99-.                    
           05  WK-AMT-COMMAS-1      PIC ZZZZZZZZZZZ,ZZZ.99-.                    
           05  WK-AMT-COMMAS-0      PIC ZZZZZZZZZZZZZZZ.99-.                    
                                                                                
       01  EDIT-QTY-AREA.                                                       
           05  WK-QTY-CODE                PIC X(01) VALUE 'D'.                  
           05  WK-QTY-NUM-ITEM            PIC S9(03) COMP-3 VALUE +1.           
           05  WK-QTY-IN-LEN              PIC S9(03) COMP-3 VALUE +22.          
           05  WK-QTY-OUT-LEN             PIC S9(03) COMP-3 VALUE +21.          
           05  WK-QTY-IN                  PIC X(22) VALUE LOW-VALUE.            
           05  WK-QTY-OUT.                                                      
               07  WK-QTY-OUT-WHOLE       PIC 9(17).                            
               07  WK-QTY-OUT-FRACTION    PIC SV9(04).                          
           05  WK-QTY-OUT-D1X REDEFINES WK-QTY-OUT.                             
               07  FILLER                 PIC X.                                
               07  WK-QTY-OUT-D1          PIC S9(16)V9.                         
               07  FILLER                 PIC X(03).                            
           05  WK-QTY-OUT-D2X REDEFINES WK-QTY-OUT.                             
               07  FILLER                 PIC X(02).                            
               07  WK-QTY-OUT-D2          PIC S9(15)V99.                        
               07  FILLER                 PIC X(02).                            
           05  WK-QTY-OUT-D3X REDEFINES WK-QTY-OUT.                             
               07  FILLER                 PIC X(03).                            
               07  WK-QTY-OUT-D3          PIC S9(14)V999.                       
               07  FILLER                 PIC X.                                
           05  WK-QTY-OUT-D4X REDEFINES WK-QTY-OUT.                             
               07  FILLER                 PIC X(04).                            
               07  WK-QTY-OUT-D4          PIC S9(13)V9999.                      
           05  WK-QTY-DECIMAL-LEN         PIC S9(03) COMP-3 VALUE +4.           
           05  WK-QTY-COMMAR              PIC X(01) VALUE 'Y'.                  
           05  WK-QTY-RET-CODE            PIC X(01) VALUE SPACE.                
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.           
                                                                                
       01  WS-MQTY-AREA.                                                        
           05  WS-MQTY-ED-D4           PIC ZZZZ,ZZZ,ZZZ,ZZZ.9999-.              
           05  WS-MQTY-ED-D3 REDEFINES WS-MQTY-ED-D4                            
                                       PIC ZZZZZ,ZZZ,ZZZ,ZZZ.999-.              
           05  WS-MQTY-ED-D2 REDEFINES WS-MQTY-ED-D3                            
                                       PIC ZZZZZZ,ZZZ,ZZZ,ZZZ.99-.              
           05  WS-MQTY-ED-D1 REDEFINES WS-MQTY-ED-D2                            
                                       PIC ZZZZZZZ,ZZZ,ZZZ,ZZZ.9-.              
           05  WS-MQTY-ED-D0 REDEFINES WS-MQTY-ED-D1                            
                                       PIC ZZZZZ,ZZZ,ZZZ,ZZZ,ZZZ-.              
       01  WS-QTY                      USAGE COMP-2.                            
       EJECT                                                            00230002
      *                                                                         
       01  WS-SWITCH-AREA.                                                      
           05  WK-ERROR-SW                PIC X(01) VALUE SPACE.                
               88  WK-ERROR                         VALUE 'Y'.                  
           05  WK-MSG-ON-SW               PIC X(01) VALUE SPACE.                
               88  WK-MSG-ON                        VALUE 'Y'.                  
           05  WS-NO-MORE-DATA-SW         PIC X(01) VALUE SPACE.                
               88  WS-NO-MORE-DATA                  VALUE 'N'.                  
           05  WS-NO-MORE-TRNFR-SW        PIC X(01) VALUE SPACE.                
               88  WS-NO-MORE-TRNFR                 VALUE 'N'.                  
           05  WS-NO-MORE-ASSET-SW        PIC X(01) VALUE SPACE.                
               88  WS-NO-MORE-ASSET                 VALUE 'N'.                  
           05  WS-SEARCH-CHANGED-SW       PIC X(01) VALUE SPACE.                
               88  WS-SEARCH-CHANGED                VALUE 'Y'.                  
           05  WS-VALID-QTY-SW            PIC X(01).                            
               88  WS-VALID-QTY                     VALUE 'Y'.                  
           05  WS-UPDATE-SW               PIC X(01) VALUE SPACES.               
               88  WS-UPDATE-OK                     VALUE 'Y'.                  
ET0001     05  WS-NEXT-PAGE-FOUND-SW      PIC X(01) VALUE SPACE.                
ET0001         88  WS-NEXT-PAGE-FOUND               VALUE 'Y'.                  
ET0001     05  WS-PREV-PAGE-FOUND-SW      PIC X(01) VALUE SPACE.                
ET0001         88  WS-PREV-PAGE-FOUND               VALUE 'Y'.                  
ET0006**   05  WS-NSCC-PEND-CD-IS-Y-SW    PIC X(01).                            
ET0006**       88  WS-NSCC-PEND-CD-IS-Y             VALUE 'Y'.                  
ET0003     05  WS-XCTL-FROM-ACAT25PD-SW   PIC X(01).                            
ET0003         88  WS-XCTL-FROM-ACAT25PD            VALUE 'Y'.                  
ET0004     05  WS-SEARCH-BY-TAG-SW        PIC X(01).                            
ET0004         88  WS-SEARCH-BY-TAG                 VALUE 'Y'.                  
ET0004     05  WS-TAG-FOUND-SW            PIC X(01).                            
ET0004         88  WS-TAG-FOUND                     VALUE 'Y'.                  
ET0004         88  WS-TAG-NOT-FOUND                 VALUE 'N'.                  
ET0009     05  WS-FRV-ASSET-FOUND-SW      PIC X(01).                            
ET0009         88  WS-FRV-ASSET-FOUND               VALUE 'Y'.                  
LRM013     05  WS-ACTIVE-FRV-ASSET-COUNT  PIC S9(4) COMP VALUE ZERO.            
       01  ACAT-WORK-AREA.                                                      
           05  WS-SS-NUM.                                                       
               09  WS-SS-NUM1             PIC X(03).                            
               09  FILLER                 PIC X(01) VALUE '-'.                  
               09  WS-SS-NUM2             PIC X(02).                            
               09  FILLER                 PIC X(01) VALUE '-'.                  
               09  WS-SS-NUM3             PIC X(04).                            
           05  WS-DLVR-ACCT.                                                    
               09  WS-BRANCH              PIC X(03).                            
               09  WS-ACCT                PIC X(05).                            
           05  WK-RESP                    PIC S9(8) COMP.                       
           05  WS-REASON.                                                       
               09  WS-REASON1             PIC X(01).                            
               09  WS-REASON2             PIC X(01).                            
           05  WS-DESC.                                                         
               09  WS-DESC1               PIC X(60).                            
               09  WS-DESC2               PIC X(60).                            
           05  CURRENCY-NUM               PIC 9(03).                            
           05  CURRENCY-X REDEFINES CURRENCY-NUM                                
                                          PIC X(03).                            
           05  WORK-AUTH-BRANCH           PIC X(03).                            
           05  WORK-AUTH-AE               PIC X(03).                            
           05  CALLED-PROGRAM-NAME        PIC X(08).                            
           05  WORK-QTY-X                 PIC X(20).                            
           05  FILLER REDEFINES WORK-QTY-X.                                     
               09 WORK-QTY                PIC 9(12)V9(05).                      
               09 FILLER                  PIC X(03).                            
           05  WORK-DATE-X.                                                     
               09 WORK-DATE-X-MM          PIC X(02).                            
               09 FILLER                  PIC X(01).                            
               09 WORK-DATE-X-YY          PIC X(02).                            
           05  WORK-DATE.                                                       
               09 WORK-DATE-MM            PIC X(02).                            
               09 WORK-DATE-YY            PIC X(02).                            
           05  TWA-CLIENT-NO-X.                                                 
               09 TWA-CLIENT-NO-9         PIC 9(03).                            
           05  WK-CLT.                                                          
               09 FILLER                  PIC X(01) VALUE '0'.                  
               09 WK-CLT-NBR              PIC X(03).                            
           05  WS-PASS-ACCT-DLV.                                                
               09 WS-PASS-BR              PIC X(03).                            
               09 WS-PASS-ACCT            PIC X(05).                            
               09 WS-PASS-ACCT-MASK       PIC X(12).                            
ET0008     05  WS-ADP-CONTROL-NBR.                                              
ET0008         09 WS-CONTROL-XX           PIC X(02).                            
ET0008         09 WS-CONTROL-SEQ          PIC 9(03).                            
ET0008     05  WS-RFRN-DLVR-ACCT          PIC X(20).                            
ET0008     05  WS-TRANS-RFRN-ID           PIC X(20).                            
           05  WK-BRW-KEY.                                                      
               09 WK-BRW-CLIENT           PIC X(03).                            
               09 WK-BRW-RECORD-TYPE      PIC X(02)   VALUE '90'.               
               09 WK-BRW-CUR-BR-AC.                                             
                  15 WK-BRW-CURRENCY      PIC X(03).                            
                  15 WK-BRW-BRANCH        PIC X(03).                            
                  15 WK-BRW-ACCOUNT       PIC X(05).                            
ET0010     05  WS-NEXT-INITRN-KEY.                                              
ET0010         09  WS-NEXT-DLVR-ACCT-KEY  PIC X(20).                            
ET0010         09  WS-NEXT-RCV-ACCT-KEY   PIC X(20).                            
ET0010         09  WS-NEXT-ADP-ACAT-KEY   PIC X(14).                            
ET0010     05  WS-CURR-INITRN-KEY.                                              
ET0010         09  WS-CURR-DLVR-ACCT-KEY  PIC X(20).                            
ET0010         09  WS-CURR-RCV-ACCT-KEY   PIC X(20).                            
ET0010         09  WS-CURR-ADP-ACAT-KEY   PIC X(14).                            
           05  WK-SUSPEND-COUNT           PIC S9(04) COMP VALUE ZERO.           
           05  WK-BROWSE-FORWARD-FLAG     PIC X(01) VALUE 'Y'.                  
               88  WK-BROWSE-FORWARD      VALUE 'Y'.                            
               88  WK-BROWSE-BACKWARD     VALUE 'N'.                            
           05  ALARM-NEEDED-FLAG          PIC X(01)  VALUE 'N'.                 
               88  ALARM-NEEDED           VALUE  'Y'.                           
           05  END-OF-DATA-FLAG           PIC X(01)  VALUE 'N'.                 
               88  END-OF-DATA            VALUE  'Y'.                           
           05  INPUT-ERROR-FLAG           PIC X(01)  VALUE 'N'.                 
               88  INPUT-ERROR            VALUE  'Y'.                           
           05  FIRST-TIME-FLAG            PIC X(01)  VALUE 'N'.                 
               88  FIRST-TIME             VALUE  'Y'.                           
           05  WS-DELETE-FLAG             PIC X(01)  VALUE 'N'.                 
               88  WS-DELETE              VALUE 'Y'.                            
           05  WS-ERROR-THIS-LINE-FLAG    PIC X(01)  VALUE 'N'.                 
               88  ERROR-THIS-LINE        VALUE  'Y'.                           
           05  WK-TS-READ-FLAG            PIC X(01).                    15960000
               88 WK-TS-READ-OK           VALUE 'Y'.                    15960000
               88 WK-TS-READ-ERROR        VALUE 'N'.                    15960000
ET0009     05  WS-TFR-FOUND-SW            PIC X(01).                            
ET0009         88  WS-TFR-FOUND                     VALUE 'Y'.                  
           05  WS-TFR-INIT-FOUND-SW       PIC X(01).                            
               88  WS-TFR-INIT-FOUND                VALUE 'Y'.                  
           05  WS-ASSET-INIT-FOUND-SW     PIC X(01).                            
               88  WS-ASSET-INIT-FOUND              VALUE 'Y'.                  
           05  WS-TFR-HIST-FOUND-SW       PIC X(01).                            
               88  WS-TFR-HIST-FOUND                VALUE 'Y'.                  
           05  WS-ASSET-HIST-FOUND-SW     PIC X(01).                            
               88  WS-ASSET-HIST-FOUND              VALUE 'Y'.                  
           05  WS-FAIL-ASSET-FOUND-SW     PIC X(01).                            
               88  WS-FAIL-ASSET-FOUND              VALUE 'Y'.                  
           05  WS-SUBMIT-ALLOWED-SW       PIC X(01).                            
               88  WS-SUBMIT-ALLOWED                VALUE 'Y'.                  
           05  ERASE-KEY-VALUE            PIC S9(04) COMP VALUE +128.           
           05  FILLER REDEFINES ERASE-KEY-VALUE.                                
               09  FILLER                 PIC X(01).                            
               09  ERASE-KEY              PIC X(01).                            
           05  REFORMAT-TIME              PIC 9(07).                            
           05  FILLER REDEFINES REFORMAT-TIME.                                  
               09  FILLER                 PIC X(01).                            
               09  REFORMAT-HH            PIC X(02).                            
               09  REFORMAT-MM            PIC X(02).                            
               09  FILLER                 PIC X(02).                            
           05  WORK-TIME.                                                       
               09  WORK-HH                PIC X(02).                            
               09  FILLER                 PIC X(01) VALUE ':'.                  
               09  WORK-MM                PIC X(02).                            
           05  INPUT-OPT-SPACE-FLAG       PIC X(01)  VALUE 'N'.                 
               88  INPUT-OPT-SPACE        VALUE  'Y'.                           
           05  DATA-ONLY-FLAG             PIC X(01)  VALUE 'N'.                 
               88  DATA-ONLY              VALUE  'Y'.                           
           05  WK-CURSOR                  PIC S9(04) COMP.                      
           05  SYSTEM-MSG                 PIC X(79) VALUE SPACES.               
           05  WK-DB2-ERROR-MSG.                                                
               09  WK-DB2-ERROR           PIC X(60).                            
               09  FILLER                 PIC X(13) VALUE                       
                   ' => SQLCODE: '.                                             
               09  WK-ERR-SQLCODE         PIC -999.                             
           05  ABEND-LINE.                                                      
               09  ABEND-MSG              PIC X(30).                            
               09  FILLER                 PIC X(11) VALUE ' EIBRESP ='.         
               09  ABEND-EIBRESP          PIC 99.                               
           05  UNAUTH-MESSAGE             PIC X(79)                             
               VALUE 'UNAUTHORIZED USER.'.                                      
           05  SEC-MESSAGE                PIC X(79)                             
               VALUE 'SIGN ON SECURITY NOT AVAILABLE, TRY AGAIN.'.              
ET0005     05  NO-CUSIP-MESSAGE           PIC X(79) VALUE                       
LRM012        'WARNING: ASSET WITHOUT CUSIP & BRD SEC NUMBER FOUND'.            
           05  ERROR-PROG-MSG.                                                  
               09  ERROR-PROG-NAME        PIC X(08).                            
               09  FILLER                 PIC X(71)                             
                   VALUE ' PROGRAM NOT AVAILIABLE.'.                            
           05  DB2IO-ERR-MSG              PIC X(54).                            
ET0001     05  DUPE-ASSET-MSG.                                                  
ET0001         09  FILLER                 PIC X(13) VALUE                       
ET0001            'UNPROCESSED "'.                                              
ET0001         09  WS-TRNFR-MSG           PIC X(03).                            
ET0001         09  FILLER                 PIC X(45) VALUE                       
ET0001            '" FOUND; MUST ACT ON THAT TRANSFER FIRST'.                   
           05  SAVE-INTRAN-FLAG           PIC X(01).                            
           05  PREV-INTRAN-FLAG           PIC X(01).                            
           05  WS-ACAT-NEXT               PIC X.                                
           05  WS-ACTION-COUNT            PIC 9(02).                            
           05  WS-INIT-TFR-ROWS           PIC 9(03).                            
           05  SUB                        PIC S9(09) COMP-3.                    
ET0008     05  SUB2                       PIC S9(09) COMP-3.                    
ET0009     05  SUB3                       PIC S9(09) COMP-3.                    
           05  C-IDX                      PIC S9(03) COMP-3.                    
ET0009 01  WS-FRV-ASSET-TABLE.                                                  
ET0009     03  WS-FRV-ASSET-TBL     OCCURS 800 TIMES.                           
ET0009         05  WS-FRV-ASSET-SECUR     PIC X(09).                            
ET0009         05  WS-FRV-ASSET-ADP-NBR   PIC X(07).                            
ET0009         05  WS-FRV-ASSET-CS-MG-SH  PIC X(01).                            
      *                                                                         
       01  TS-HST-ASSET-AREA.                                                   
           03  TS-HST-AST-RECORD          OCCURS 2 TIMES.                       
               05  TS-HST-SECUR           PIC X(12).                            
               05  TS-HST-CTGRY           PIC X(04).                            
               05  TS-HST-STTL-LOC        PIC X(02).                            
               05  TS-HST-TYPE            PIC X(01).                            
               05  TS-HST-DESC            PIC X(140).                           
               05  TS-HST-QTY-ORIG        USAGE COMP-2.                         
               05  TS-HST-REASON          PIC X(02).                            
               05  TS-HST-CMNTS           PIC X(120).                           
               05  TS-HST-RCLM-IND        PIC X(01).                            
               05  TS-HST-SEQ-NBR         PIC S9(4) COMP.                       
               05  TS-HST-PSTN-CD         PIC X(01).                            
               05  TS-HST-RCLMED          PIC X(01).                            
ET0003         05  TS-HST-TAG             PIC X(11).                            
ET0005         05  TS-HST-ADP-NBR         PIC X(07).                            
       01  TS-INI-ASSET-AREA.                                                   
           03  TS-INI-AST-RECORD          OCCURS 2 TIMES.                       
               05  TS-INI-SECUR           PIC X(12).                            
               05  TS-INI-CTGRY           PIC X(04).                            
               05  TS-INI-STTL-LOC        PIC X(02).                            
               05  TS-INI-TYPE            PIC X(01).                            
               05  TS-INI-DESC            PIC X(140).                           
               05  TS-INI-QTY-RCLM        USAGE COMP-2.                         
               05  TS-INI-REASON          PIC X(02).                            
               05  TS-INI-CMNTS           PIC X(120).                           
               05  TS-INI-RCLM-IND        PIC X(01).                            
               05  TS-INI-PSTN-CD         PIC X(01).                            
ET0003         05  TS-INI-TAG             PIC X(11).                            
ET0005         05  TS-INI-ADP-NBR         PIC X(07).                            
      *                                                                         
       01  ACATPPIO-CALL-AREA.                                                  
           COPY ACATPPIO.                                                       
      *                                                                         
       01  ACAT13IO-COMMAREA.                                                   
           COPY ACAT13IO.                                                       
           EJECT                                                                
       01  WS-POP-UP-WORKAREA.                                                  
           COPY ACAT90TS.                                                       
           EJECT                                                        01660002
       COPY ACATCOM.                                                            
           EJECT                                                                
       COPY ACATSRCH.                                                           
           EJECT                                                                
       COPY SECLINKC.                                                           
           EJECT                                                                
       COPY ATTR.                                                               
           EJECT                                                                
       COPY DFHAID.                                                             
           EJECT                                                                
       COPY ACAT00M.                                                            
       COPY ACAT13M.                                                            
       01  ACAT13MR REDEFINES ACAT13MI.                                         
ET0004     02  FILLER PIC X(275).                                               
           02  MASSET    OCCURS 2 TIMES.                                        
               03  MSECR-L   PIC S9(4) COMP.                                    
               03  MSECR-A   PIC X(01).                                         
               03  MSECR-O   PIC X(12).                                         
               03  MCATGR-L  PIC S9(4) COMP.                                    
               03  MCATGR-A  PIC X(01).                                         
               03  MCATGR-O  PIC X(04).                                         
               03  MSLOC-L   PIC S9(4) COMP.                                    
               03  MSLOC-A   PIC X(01).                                         
               03  MSLOC-O   PIC X(02).                                         
               03  MTYPE-L   PIC S9(4) COMP.                                    
               03  MTYPE-A   PIC X(01).                                         
               03  MTYPE-O   PIC X(01).                                         
               03  MDESC1-L  PIC S9(4) COMP.                                    
               03  MDESC1-A  PIC X(01).                                         
               03  MDESC1-O  PIC X(60).                                         
               03  MDESC2-L  PIC S9(4) COMP.                                    
               03  MDESC2-A  PIC X(01).                                         
               03  MDESC2-O  PIC X(60).                                         
               03  MQTY-L    PIC S9(4) COMP.                                    
               03  MQTY-A    PIC X(01).                                         
               03  MQTY-I    PIC X(22).                                         
               03  FILLER REDEFINES MQTY-I.                                     
                   05  MQTY-O    PIC ZZZZ,ZZZ,ZZZ,ZZZ.9999-.                    
               03  MRSON-L   PIC S9(4) COMP.                                    
               03  MRSON-A   PIC X(01).                                         
               03  MRSON-O   PIC X(02).                                         
               03  MRCLM-L   PIC S9(4) COMP.                                    
               03  MRCLM-A   PIC X(01).                                         
               03  MRCLM-O   PIC X(01).                                         
ET0003         03  MTAG-L    PIC S9(4) COMP.                                    
ET0003         03  MTAG-A    PIC X(01).                                         
ET0003         03  MTAG-O    PIC X(11).                                         
           02  FILLER PICTURE X(12).                                            
            EJECT                                                               
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
           03  FILLER                    PIC X(2000).                           
                                                                                
       COPY TWACOMMN.                                                           
           03  TWA-ACAT-AREA.                                                   
               05  TWA-TFR-UPDATE-IND           PIC X(01).                      
                   88  TWA-TFR-NEW                       VALUE 'N'.             
                   88  TWA-TFR-UPDATE                    VALUE 'U'.             
                   88  TWA-TFR-INQUIRY                   VALUE 'I'.             
               05  TWA-ASSET-CMNT-LINE-IND      PIC X(01).                      
                   88  TWA-ASSET-CMNT-LINE-1             VALUE '1'.             
                   88  TWA-ASSET-CMNT-LINE-2             VALUE '2'.             
ET0008         05  TWA-ADD-FRV-SW               PIC X(01).                      
ET0008             88  TWA-ADD-FRV                       VALUE 'Y'.             
ET0010         05  TWA-SRCH-ALL-FRVS-SW         PIC X(01).                      
ET0010             88  TWA-SRCH-ALL-FRVS                 VALUE 'Y'.             
               05  TWA-RESUB-REJECT             PIC X(01).                      
               05  TWA-DELETE-CONFIRM           PIC X(01).                      
               05  TWA-PAGE-NUM                 PIC 9(05) COMP-3.               
               05  TWA-MAX-PAGE-HST             PIC 9(05) COMP-3.               
               05  TWA-MAX-PAGE-INI             PIC 9(05) COMP-3.               
               05  TWA-FIRST-ENTER-RTN          PIC X(01).                      
               05  TWA-SCREEN                   PIC X(01).                      
               05  TWA-ACAT                     PIC X(14).                      
               05  TWA-DLVR-ACCT                PIC X(20).                      
ET0003         05  TWA-CALLING-PROG             PIC X(08).                      
ET0004         05  TWA-SRCH-TAG-AREA.                                           
ET0004             07  TWA-SRCH-TAG             PIC X(11).                      
ET0004             07  TWA-PREV-SRCH-TAG        PIC X(11).                      
ET0006         05  TWA-NSCC-PEND-CD-IS-Y-SW     PIC X(01).                      
ET0006             88  TWA-NSCC-PEND-CD-IS-Y              VALUE 'Y'.            
ET0008         05  TWA-ADP-CONTROL-NBR          PIC X(14).                      
               05  TWA-MAP-AREA.                                                
                   07  TWA-MAP-BR               PIC X(3).                       
                   07  TWA-MAP-AC               PIC X(5).                       
                   07  TWA-MAP-RR               PIC X(3).                       
                   07  TWA-MAP-CBRKR            PIC X(4).                       
                   07  TWA-MAP-CBNAM            PIC X(30).                      
                   07  TWA-MAP-CTYPE            PIC X(2).                       
                   07  TWA-MAP-SD               PIC X(8).                       
                   07  TWA-MAP-CACCT            PIC X(20).                      
ET0001             07  TWA-MAP-TFR-TYPE         PIC X(03).                      
                   07  TWA-MAP-ACAT             PIC X(14).                      
                   07  TWA-MAP-STAT             PIC X(30).                      
                   07  TWA-MAP-NAME             PIC X(30).                      
                   07  TWA-MAP-SSN              PIC X(11).                      
                   07  TWA-MAP-NAME2            PIC X(30).                      
                   07  TWA-MAP-SSN2             PIC X(11).                      
                   07  TWA-MAP-ACT-CMNTS        PIC X(120).                     
                   07  TWA-MAP-ASSET         OCCURS 2 TIMES.                    
                       09  TWA-MAP-SECR         PIC X(12).                      
                       09  TWA-MAP-CATGR        PIC X(4).                       
                       09  TWA-MAP-SLOC         PIC X(2).                       
                       09  TWA-MAP-TYPE         PIC X(1).                       
                       09  TWA-MAP-DESC1        PIC X(60).                      
                       09  TWA-MAP-DESC2        PIC X(60).                      
                       09  TWA-MAP-QTY          PIC X(22).                      
                       09  TWA-MAP-RSON         PIC X(2).                       
                       09  TWA-MAP-RCLM         PIC X(1).                       
                       09  TWA-MAP-RCLMED       PIC X(1).                       
ET0003                 09  TWA-MAP-TAG          PIC X(11).                      
ET0005                 09  TWA-MAP-ADP-NBR      PIC X(07).                      
                   07  TWA-MAP-NEXT             PIC X(1).                       
                   07  TWA-MAP-SUB              PIC X(1).                       
                   07  TWA-MAP-DEL              PIC X(1).                       
               05  TWA-MAP-SEARCH.                                              
                   07  TWA-MAP-MMBR             PIC X(3).                       
                   07  TWA-MAP-MMAC             PIC X(5).                       
                   07  TWA-MAP-MMRR             PIC X(3).                       
                   07  TWA-MAP-MMTFR            PIC X(3).                       
                   07  TWA-MAP-MMRD             PIC X(1).                       
                   07  TWA-MAP-MMBKR            PIC X(4).                       
                   07  TWA-MAP-MMSTAT           PIC X(3).                       
                   07  TWA-MAP-MMSD             PIC X(6).                       
               05  TWA-MAP-KEY.                                                 
                   07  TWA-MAP-KEY-ACCT.                                        
                       09  TWA-MAP-KEY-BR       PIC X(03).                      
                       09  TWA-MAP-KEY-AC       PIC X(05).                      
ET0004 COPY ACATCGIX.                                                           
ET0004*01  ACAT-CAGE-TAG-INDEX-REC.                                             
ET0004*    05  ACAT-CAGE-INDEX-KEY.                                             
ET0004*        07  ACAT-CAGE-TAG-CLIENT-NBR   PIC X(04).                        
ET0004*        07  ACAT-CAGE-TAG-NBR          PIC X(09).                        
ET0004*        07  ACAT-CAGE-CONTROL-NBR      PIC X(14)  VALUE SPACES.          
ET0004*    05  ACAT-CAGE-INDEX-DETAIL.                                          
ET0004*        07  ACAT-CAGE-ASSET-SEQ-NBR    PIC S9(04) COMP.                  
ET0004*        07  FILLER                     PIC X(11)  VALUE SPACES.          
           EJECT                                                                
                                                                                
       PROCEDURE DIVISION.                                                      
       INITIALIZATION.                                                          
           EXEC CICS IGNORE CONDITION DUPKEY DUPREC  ENDFILE  ERROR             
                     ILLOGIC INVREQ   IOERR  ITEMERR LENGERR  MAPFAIL           
                     NOSPACE NOSTG    NOTFND         PGMIDERR QIDERR            
           END-EXEC.                                                            
      *    EXEC CICS HANDLE CONDITION NOTOPEN (NOT-OPEN)                        
      *                              DISABLED (NOT-OPEN)                        
      *                              DSIDERR  (NOT-OPEN)                        
      *    END-EXEC.                                                            
                                                                                
           EXEC CICS ASSIGN TWALENG (TWA-SIZE)                                  
           END-EXEC.                                                            
           IF TWA-SIZE = 0                                                      
              MOVE LOW-VALUE TO ACAT13MO                                        
              SET WK-ERROR TO TRUE                                              
              MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO SYSTEM-MSG             
              PERFORM  9000-ERROR-RTN.                                          
                                                                                
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                          
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       MAIN-PROCESSING.                                                         
           INITIALIZE ACAT13IO-COMMAREA.                                        
           MOVE EIBTRMID TO TERM-ID.                                            
           MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                               
           MOVE 'N'           TO END-OF-DATA-FLAG.                              
           MOVE SPACES        TO SYSTEM-MSG.                                    
           MOVE 0             TO WK-CURSOR.                                     
           MOVE LOW-VALUE     TO HDRMAPO                                        
                                 ACAT13MO.                                      
           PERFORM 0100-GET-DATE-AND-TIME.                                      
           MOVE  DFHCOMMAREA     TO  ACATCOMM-COMMAREA.                         
           MOVE  TWA-CLIENT-NO-X TO WK-CLT-NBR.                                 
           MOVE  WK-CLT          TO  ACAT13-PASS-CLT.                           
                                                                                
           IF ACAT-SUPER-SIGN-ON-UPDATE                                         
              SET WS-UPDATE-OK     TO TRUE                                      
           ELSE                                                                 
              PERFORM 0150-CHECK-UPDATE-MODE.                                   
                                                                                
ET0003     IF  ACAT-CALLING-PROG-NAME = 'ACAT25PD'                              
ET0003     AND ACAT-CONTROL-NBR > SPACE  AND  ACAT-BR-AC > SPACE                
ET0003     AND ACAT-INP-SEL NOT = 'L'                                           
ET0003         MOVE 'ACAT13IF' TO ACAT-PROGRAM-NAME                             
ET0003         PERFORM 0550-FROM-TRNFR-HISTORY                                  
ET0003     END-IF.                                                              
           IF  ACAT-CALLING-PROG-NAME = 'ACAT15TC'                              
           AND ACAT-CONTROL-NBR > SPACE  AND  ACAT-BR-AC > SPACE                
               MOVE 'ACAT13IF' TO ACAT-PROGRAM-NAME                             
               PERFORM 0600-RESUB-REJECTED-REVERSAL                             
           ELSE                                                                 
           IF  ACAT-CALLING-PROG-NAME = 'ACAT21PT'                              
           AND ACAT-CONTROL-NBR > SPACE  AND  ACAT-BR-AC > SPACE                
               MOVE 'ACAT13IF' TO ACAT-PROGRAM-NAME                             
               PERFORM 0700-INQUIRY-FROM-PEND-PROG                              
           END-IF.                                                              
                                                                                
                                                                                
      *    IF  EIBAID = DFHPF10                                                 
      *    AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                              
      *        MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
      *        PERFORM BROWSING-RTN                                             
      *    ELSE                                                                 
      *    MOVE SPACES TO ACAT-CALLING-PROG-NAME.                               
           IF  ACAT-PROGRAM-NAME = 'ACAT13IF'                                   
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
               PERFORM 0900-CONTINUE-PROCESS                                    
      *    ELSE                                                                 
      *    IF  ACAT-PROGRAM-NAME = 'RATT01  '                                   
      *        PERFORM 7000-READ-TSQ-RTN                                        
      *        PERFORM 7010-DELETE-TSQ-RTN                                      
      *        PERFORM BROWSING-RTN                                             
           ELSE                                                                 
               MOVE 'ACAT13IF' TO ACAT-PROGRAM-NAME                             
               PERFORM 0200-FIRST-TIME-RTN.                                     
           EJECT                                                                
                                                                                
       0100-GET-DATE-AND-TIME.                                                  
           EXEC  CICS ASKTIME                                                   
                 ABSTIME(WSABSTIME)                                             
           END-EXEC.                                                            
           EXEC  CICS FORMATTIME                                                
                 ABSTIME(WSABSTIME)                                             
                 MMDDYY(WSMMDDYY)                                               
                 DATESEP(WSDATESEP)                                             
                 TIME(WSTIME)                                                   
                 TIMESEP(WSTIMESEP)                                             
           END-EXEC.                                                            
           EJECT                                                                
       0150-CHECK-UPDATE-MODE.                                                  
           MOVE SPACES    TO SECLINK-LIST.                              AEISAC07
           MOVE '2'       TO SECLINK-ACTION-CODE.                       AEISAC07
           MOVE 'SCON'    TO SECLINK-TYPE.                                      
           MOVE 'ACAXLU'  TO SECLINK-ITEM.                                      
           PERFORM CALL-SECLINK-RTN.                                    AEISAC07
           IF SECLINK-RETURN-CODE = '00' OR '20'                        AEISAC07
              SET WS-UPDATE-OK  TO TRUE.                                        
      *                                                                         
       0200-FIRST-TIME-RTN.                                                     
           SET FIRST-TIME TO TRUE.                                              
           INITIALIZE TWA-ACAT-AREA.                                            
           MOVE 'L' TO ACAT-NEXT.                                               
           IF EIBAID = DFHPF10                                                  
           AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                              
              MOVE SPACES TO ACAT-CALLING-PROG-NAME                             
              PERFORM 7000-READ-TSQ-RTN                                 03810002
              PERFORM 7010-DELETE-TSQ-RTN                                       
              PERFORM 0210-RETURNED-FROM-ACAT90CM                       10350002
              PERFORM 0300-RESET-MAP                                    10350002
              IF TWA-TFR-NEW                                                    
                 MOVE TWA-PAGE-NUM TO WS-HST-ITEM                               
                 PERFORM 7100-READ-HIST-ASSET-TSQ                               
                 IF WK-TS-READ-OK                                               
                    PERFORM 1520-VALIDATE-RSON-RCLM THRU 1520-EXIT              
                       VARYING SUB FROM 1 BY 1  UNTIL SUB > 2                   
ET0001              IF NOT WK-ERROR                                     11000000
ET0001                 MOVE -1 TO MNEXTL                                11000000
ET0001              END-IF                                              11000000
                 END-IF                                                         
ET0002        ELSE                                                              
ET0002           MOVE -1 TO MNEXTL                                      11000000
              END-IF                                                            
              PERFORM 7020-WRITE-TSQ-RTN                                        
              PERFORM 8000-SEND-MAP-ERASE                                       
              PERFORM 8800-RETURN-TO-CICS.                                      
                                                                                
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           PERFORM 7110-DELETE-HIST-ASSET-TSQ.                                  
           PERFORM 7210-DELETE-INIT-ASSET-TSQ.                                  
           MOVE SPACES TO ACAT-CALLING-PROG-NAME.                               
           PERFORM 0500-INITIAL-MAP-PROTECT.                                    
           IF ACAT-SEARCH-FIELDS = SPACE                                        
              MOVE '0' TO TWA-FIRST-ENTER-RTN                                   
              SET WK-MSG-ON TO TRUE                                             
              MOVE -1              TO MBRL                                      
              MOVE 'ENTER BRANCH'  TO SYSTEM-MSG                                
           ELSE                                                                 
              PERFORM 0205-CHECK-SRCH-ENGINE                                    
           END-IF.                                                              
                                                                                
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 8000-SEND-MAP-ERASE.                                         
           PERFORM 8800-RETURN-TO-CICS.                                         
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *  CHECK SEARCH ENGINE IF FIELDS WERE PASSED FROM OTHER SCREEN   *        
      *----------------------------------------------------------------*        
       0205-CHECK-SRCH-ENGINE.                                                  
           MOVE '1' TO TWA-FIRST-ENTER-RTN.                                     
                                                                                
           MOVE ACAT-INP-BRANCH  TO MMBRO TWA-MAP-MMBR                          
                                    MBRO  TWA-MAP-BR  TWA-MAP-KEY-BR.           
           MOVE ACAT-INP-ACCOUNT TO MMACO TWA-MAP-MMAC                          
                                    MACO  TWA-MAP-AC  TWA-MAP-KEY-AC.           
           MOVE ACAT-INP-RR         TO MMRRO   TWA-MAP-MMRR.                    
           MOVE ACAT-INP-TFR-TYP    TO MMTFRO  TWA-MAP-MMTFR.                   
           MOVE ACAT-INP-RCV-DEL    TO MMRDO   TWA-MAP-MMRD.                    
           MOVE ACAT-INP-CONTRA-BKR TO MMBKRO  TWA-MAP-MMBKR.                   
           MOVE ACAT-INP-STATUS     TO MMSTATO TWA-MAP-MMSTAT.                  
           MOVE ACAT-INP-STTL-DT    TO MMSDO   TWA-MAP-MMSD.                    
                                                                                
           PERFORM 1640-VALIDATE-SRCH-ENGINE.                                   
           IF WK-ERROR                                                          
              CONTINUE                                                          
           ELSE                                                                 
              PERFORM 2000-NEW-ACCT-ENTRY                                       
              IF NOT WK-ERROR                                                   
                 MOVE -1 TO MNEXTL                                              
              END-IF                                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *       CONTROL WAS PASSED FROM POP-UP SCREEN PROGRAM            *        
      *----------------------------------------------------------------*        
       0210-RETURNED-FROM-ACAT90CM.                                     10350002
           MOVE 'ACA$'   TO TRAN-ID.                                    02410002
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                           10360002
                              INTO(ACAT90CM-TS-AREA)                    10370002
                              LENGTH(LENGTH OF ACAT90CM-TS-AREA)        10380002
                              ITEM(ITEM-NUM)                            10390002
           END-EXEC.                                                    10400002
           IF EIBRESP = +0                                              10410002
              IF ACAT90CM-TS-SCREEN = 'A'                                       
                 MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-MAP-ACT-CMNTS              
                 MOVE -1 TO MBRL                                                
              ELSE                                                              
              IF ACAT90CM-TS-SCREEN = 'S'                                       
                 IF TWA-TFR-NEW                                                 
                    MOVE TWA-PAGE-NUM TO WS-HST-ITEM                            
                    PERFORM 7100-READ-HIST-ASSET-TSQ                            
                    IF TWA-ASSET-CMNT-LINE-1                                    
                       MOVE ACAT90CM-TS-MCCMNT-X120 TO TS-HST-CMNTS (1)         
ET0001**               MOVE -1 TO MRSON-L (1)                                   
                    END-IF                                                      
                    IF TWA-ASSET-CMNT-LINE-2                                    
                       MOVE ACAT90CM-TS-MCCMNT-X120 TO TS-HST-CMNTS (2)         
ET0001**               MOVE -1 TO MRSON-L (2)                                   
                    END-IF                                                      
                    PERFORM 7130-REWRITE-HIST-ASSET-TSQ                         
                 END-IF                                                         
                 IF TWA-TFR-UPDATE                                              
                    MOVE TWA-PAGE-NUM TO WS-INI-ITEM                            
                    PERFORM 7200-READ-INIT-ASSET-TSQ                            
                    IF TWA-ASSET-CMNT-LINE-1                                    
                       MOVE ACAT90CM-TS-MCCMNT-X120 TO TS-INI-CMNTS (1)         
ET0001**               MOVE -1 TO MRSON-L (1)                                   
                    END-IF                                                      
                    IF TWA-ASSET-CMNT-LINE-2                                    
                       MOVE ACAT90CM-TS-MCCMNT-X120 TO TS-INI-CMNTS (2)         
ET0001**               MOVE -1 TO MRSON-L (2)                                   
                    END-IF                                                      
                 END-IF                                                         
              ELSE                                                              
              IF ACAT90CM-TS-SCREEN = 'R'                                       
                 MOVE TWA-MAP-RSON (1) TO WS-REASON                             
                 IF WS-REASON1 = '?' OR                                         
                    WS-REASON2 = '?'                                            
                      MOVE ACAT90CM-TS-MREAS TO TWA-MAP-RSON (1)                
ET0001**              MOVE -1 TO MRSON-L (1)                                    
                 ELSE                                                           
                 MOVE TWA-MAP-RSON (2) TO WS-REASON                             
                 IF WS-REASON1 = '?' OR                                         
                    WS-REASON2 = '?'                                            
                      MOVE ACAT90CM-TS-MREAS TO TWA-MAP-RSON (2)                
ET0001**              MOVE -1 TO MRSON-L (2)                                    
                 END-IF  END-IF                                                 
              END-IF.                                                           
                                                                                
           MOVE SPACES   TO TWA-SCREEN.                                         
           MOVE 'ACA$'   TO TRAN-ID.                                    02410002
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         10490002
           END-EXEC.                                                    10500002
       EJECT                                                                   2
      *                                                                         
      *----------------------------------------------------------------*        
      *    RESET MAP AREA UPON RETURNING FROM POP-UP SCREEN            *        
      *----------------------------------------------------------------*        
       0300-RESET-MAP.                                                  10350002
ET0004     IF TWA-SRCH-TAG > SPACE                                              
ET0004        MOVE TWA-SRCH-TAG       TO SRCHTAGO                               
ET0004     END-IF.                                                              
           MOVE TWA-MAP-BR            TO MBRO.                                  
           MOVE TWA-MAP-AC            TO MACO.                                  
           MOVE TWA-MAP-CBRKR         TO MCBRKRO.                               
           MOVE TWA-MAP-CACCT         TO MCACCTO.                               
ET0001     MOVE TWA-MAP-TFR-TYPE      TO MTRNFRO.                               
           MOVE TWA-MAP-RR            TO MRRO.                                  
           MOVE TWA-MAP-CBNAM         TO MCBNAMO.                               
           MOVE TWA-MAP-CTYPE         TO MCTYPEO.                               
           MOVE TWA-MAP-SD            TO MSDO.                                  
           MOVE TWA-MAP-ACAT          TO MACATO.                                
ET0008     IF TWA-TFR-UPDATE                                                    
ET0008        IF TWA-ADP-CONTROL-NBR > SPACE                                    
ET0008           MOVE TWA-ADP-CONTROL-NBR TO MACATO                             
ET0008        ELSE                                                              
ET0008           MOVE SPACE  TO MACATO                                          
ET0008        END-IF                                                            
ET0008     END-IF.                                                              
           MOVE TWA-MAP-STAT          TO MSTATO.                                
           MOVE TWA-MAP-NAME          TO MNAMEO.                                
           MOVE TWA-MAP-SSN           TO MSSNO.                                 
           MOVE TWA-MAP-NAME2         TO MNAME2O.                               
           MOVE TWA-MAP-SSN2          TO MSSN2O.                                
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 2                        
             MOVE ATT-ASKIP TO MRSON-A (SUB) MRCLM-A (SUB)                      
ET0003                         MTAG-A  (SUB)                                    
             MOVE SPACE TO MSECR-O  (SUB)                                       
                           MCATGR-O (SUB)                                       
                           MSLOC-O  (SUB)                                       
                           MTYPE-O  (SUB)                                       
                           MDESC1-O (SUB)                                       
                           MDESC2-O (SUB)                                       
                           MQTY-I   (SUB)                                       
                           MRSON-O  (SUB)                                       
                           MRCLM-O  (SUB)                                       
ET0003                     MTAG-O   (SUB)                                       
ET0005       IF TWA-MAP-QTY (SUB) > SPACE                                       
ET0005          IF TWA-MAP-SECR (SUB) > SPACE                                   
                   MOVE TWA-MAP-SECR    (SUB) TO MSECR-O (SUB)                  
ET0005          ELSE                                                            
ET0005          IF TWA-MAP-ADP-NBR (SUB) > SPACE                                
ET0005             MOVE TWA-MAP-ADP-NBR (SUB) TO MSECR-O (SUB)                  
ET0005          ELSE                                                            
ET0005             MOVE SPACE TO MSECR-O (SUB) TWA-MAP-SECR    (SUB)            
ET0005                                         TWA-MAP-ADP-NBR (SUB)            
ET0005             SET WK-MSG-ON TO TRUE                                        
ET0005             MOVE NO-CUSIP-MESSAGE  TO SYSTEM-MSG                         
ET0005          END-IF                                                          
ET0005          END-IF                                                          
                MOVE TWA-MAP-CATGR (SUB) TO MCATGR-O (SUB)                      
                MOVE TWA-MAP-SLOC  (SUB) TO MSLOC-O  (SUB)                      
                MOVE TWA-MAP-TYPE  (SUB) TO MTYPE-O  (SUB)                      
                MOVE TWA-MAP-DESC1 (SUB) TO MDESC1-O (SUB)                      
                MOVE TWA-MAP-DESC2 (SUB) TO MDESC2-O (SUB)                      
                MOVE TWA-MAP-QTY   (SUB) TO MQTY-I   (SUB)                      
                MOVE TWA-MAP-RSON  (SUB) TO MRSON-O  (SUB)                      
                MOVE TWA-MAP-RCLM  (SUB) TO MRCLM-O  (SUB)                      
ET0003          MOVE TWA-MAP-TAG   (SUB) TO MTAG-O   (SUB)                      
                IF TWA-TFR-NEW                                                  
                   MOVE ATT-UNPROT TO MRSON-A (SUB) MRCLM-A (SUB)               
ET0003                                MTAG-A  (SUB)                             
                END-IF                                                          
             END-IF                                                             
           END-PERFORM.                                                         
           MOVE TWA-MAP-NEXT          TO MNEXTO.                                
           MOVE SPACE                 TO MNEXTO TWA-MAP-NEXT.                   
           MOVE SPACE                 TO MSUBO  TWA-MAP-SUB.                    
           MOVE SPACE                 TO MDELO  TWA-MAP-DEL.                    
           MOVE TWA-MAP-MMBR          TO MMBRO.                                 
           MOVE TWA-MAP-MMAC          TO MMACO.                                 
           MOVE TWA-MAP-MMRR          TO MMRRO.                                 
           MOVE TWA-MAP-MMTFR         TO MMTFRO.                                
           MOVE TWA-MAP-MMRD          TO MMRDO.                                 
           MOVE TWA-MAP-MMBKR         TO MMBKRO.                                
           MOVE TWA-MAP-MMSTAT        TO MMSTATO.                               
           MOVE TWA-MAP-MMSD          TO MMSDO.                                 
           IF TWA-TFR-NEW                                                       
              MOVE ATT-UNPROT TO MSUBA                                          
              MOVE ATT-ASKIP  TO MDELA                                          
           ELSE                                                                 
           IF TWA-TFR-UPDATE                                                    
              MOVE ATT-ASKIP  TO MSUBA                                          
              MOVE ATT-UNPROT TO MDELA                                          
ET0002     ELSE                                                                 
ET0002        MOVE ATT-ASKIP  TO MSUBA                                          
ET0002                           MDELA                                          
ET0002                           MBRA                                           
ET0002                           MACA                                           
           END-IF.                                                              
       EJECT                                                                   2
      *                                                                         
      *----------------------------------------------------------------*        
      *       PROTECT MAP AREA FOR THE FIRST TIME                      *        
      *----------------------------------------------------------------*        
       0500-INITIAL-MAP-PROTECT.                                                
           MOVE ATT-ASKIP  TO MSUBA                                             
                              MDELA.                                            
           PERFORM VARYING SUB FROM 1 BY 1                                      
             UNTIL SUB > 2                                                      
               MOVE ATT-ASKIP TO MRSON-A (SUB)                                  
                                 MRCLM-A (SUB)                                  
ET0003                           MTAG-A  (SUB)                                  
           END-PERFORM.                                                         
       EJECT                                                                    
ET0003*                                                                         
ET0003*----------------------------------------------------------------*        
ET0003*  CONTROL WAS TRANSFERED FROM ACAT25PD (TRNFR HISTORY ASSET     *        
ET0003*  INQUIRY) VIA ACAT22TH (TRFR HISTORY) TO INITIATE REVERSAL     *        
ET0003*  WITH CAGE TAG#.                                               *        
ET0003*----------------------------------------------------------------*        
ET0003 0550-FROM-TRNFR-HISTORY.                                                 
           SET FIRST-TIME TO TRUE.                                              
           INITIALIZE TWA-ACAT-AREA.                                            
           MOVE ACAT-CONTROL-NBR TO TWA-ACAT.                                   
           MOVE ACAT-BR TO TWA-MAP-BR TWA-MAP-KEY-BR.                           
           MOVE ACAT-AC TO TWA-MAP-AC TWA-MAP-KEY-AC.                           
           MOVE 'L'        TO ACAT-NEXT.                                        
      ***  MOVE 'ACAT22TH' TO ACAT-CALLING-PROG-NAME.                           
           MOVE 'ACAT22TH' TO TWA-CALLING-PROG.                                 
           MOVE SPACES     TO ACAT-BR-AC.                                       
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           SET  TWA-TFR-NEW     TO TRUE.                                        
           MOVE '2'  TO TWA-FIRST-ENTER-RTN.                                    
           PERFORM 0500-INITIAL-MAP-PROTECT.                                    
           SET  WS-XCTL-FROM-ACAT25PD  TO TRUE.                                 
           PERFORM 2000-NEW-ACCT-ENTRY.                                         
           IF NOT WK-ERROR                                                      
              MOVE -1 TO MBRL                                                   
           END-IF.                                                              
           PERFORM  7020-WRITE-TSQ-RTN.                                         
           PERFORM  8000-SEND-MAP-ERASE.                                        
           PERFORM  8800-RETURN-TO-CICS.                                        
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    CONTROL WAS TRANSFERED FROM ACAT15TC (REJECTED BY CONTRA)   *        
      *    TO RESUBMIT THE REJECTED FAIL REVERSAL.                     *        
      *----------------------------------------------------------------*        
       0600-RESUB-REJECTED-REVERSAL.                                            
           SET FIRST-TIME TO TRUE.                                              
           INITIALIZE TWA-ACAT-AREA.                                            
           MOVE 'L' TO ACAT-NEXT.                                               
           MOVE SPACES TO ACAT-CALLING-PROG-NAME.                               
           MOVE SPACES TO ACAT-BR-AC.                                           
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           SET  TWA-TFR-NEW     TO TRUE.                                        
           MOVE 'Y'  TO TWA-RESUB-REJECT.                                       
           MOVE '2'  TO TWA-FIRST-ENTER-RTN.                                    
           PERFORM 0500-INITIAL-MAP-PROTECT.                                    
           PERFORM 0690-GET-REJECTED-TRANSFER.                                  
           IF ACAT13-NOT-FOUND                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'REJECTED REVERSAL TRANSFER NOT FOUND' TO SYSTEM-MSG         
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
           PERFORM 2000-NEW-ACCT-ENTRY.                                         
           IF NOT WK-ERROR                                                      
              MOVE -1 TO MBRL                                                   
           END-IF.                                                              
           PERFORM  7020-WRITE-TSQ-RTN.                                         
           PERFORM  8000-SEND-MAP-ERASE.                                        
           PERFORM  8800-RETURN-TO-CICS.                                        
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      * READ REJECTED TRANSFER FROM ACTIVE TRANSFER TABLE FOR RESUBMIT *        
      *----------------------------------------------------------------*        
       0690-GET-REJECTED-TRANSFER.                                              
           MOVE ACAT-CONTROL-NBR TO ACAT13-PASS-ACAT.                           
           SET  ACAT13-GET-TRANSFER TO TRUE.                                    
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MNEXTL                                                 
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'DB2 GET TRANSFER ERROR - CALL HELP DESK'                    
LRM012                      TO WK-DB2-ERROR                                     
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT13-NORMAL                                                     
              MOVE ACAT13-TFR-DLVR-ACCT(1:8) TO WS-DLVR-ACCT                    
              MOVE ACAT13-TFR-RR             TO TWA-MAP-RR                      
              PERFORM 2500-BR-AE-SECURITY                                       
              IF SRCH-SIGNON-SECR-CHECK-PASS                                    
                 MOVE ACAT13-TFR-DLVR-ACCT TO WS-PASS-ACCT-DLV                  
                 MOVE WS-PASS-BR     TO MBRO TWA-MAP-BR TWA-MAP-KEY-BR          
                 MOVE WS-PASS-ACCT   TO MACO TWA-MAP-AC TWA-MAP-KEY-AC          
                 MOVE ACAT13-TFR-RCV      TO MCBRKRO TWA-MAP-CBRKR              
                 MOVE ACAT13-TFR-RCV-ACCT TO MCACCTO TWA-MAP-CACCT              
                 MOVE ATT-UNPROT TO MBRA MACA                                   
              ELSE                                                              
                 MOVE -1        TO MNEXTL                                       
                 SET WK-MSG-ON  TO TRUE                                         
                 MOVE 'UNAUTHORIZED FOR THE REQUESTED BRANCH.'                  
                                TO SYSTEM-MSG                                   
                 PERFORM 9000-ERROR-RTN.                                        
      *                                                                         
      *----------------------------------------------------------------*        
      *    CONTROL WAS PASSED FROM ACAT21PT TO VIEW THE DETAIL         *        
      *----------------------------------------------------------------*        
       0700-INQUIRY-FROM-PEND-PROG.                                             
           SET FIRST-TIME TO TRUE.                                              
           INITIALIZE TWA-ACAT-AREA.                                            
           MOVE 'L' TO ACAT-NEXT.                                               
           MOVE SPACES TO ACAT-CALLING-PROG-NAME.                               
           MOVE SPACES TO ACAT-BR-AC.                                           
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           PERFORM 7110-DELETE-HIST-ASSET-TSQ.                                  
           PERFORM 7210-DELETE-INIT-ASSET-TSQ.                                  
           SET  TWA-TFR-INQUIRY  TO TRUE.                                       
           PERFORM 0710-CLEAR-SCR-FOR-INQUIRY.                                  
           PERFORM 0790-GET-ACTIVE-TRANSFER.                                    
           IF ACAT13-NORMAL                                                     
              MOVE ACAT-CONTROL-NBR TO ACAT13-PASS-ACAT                         
              PERFORM 5600-OPEN-ASSET-CURSOR                                    
              INITIALIZE TS-HST-ASSET-AREA                                      
              MOVE SPACE TO WS-NO-MORE-ASSET-SW                                 
              MOVE 0 TO SUB                                                     
              PERFORM 0720-SAVE-ASSET-IN-TS THRU 0720-EXIT                      
                  UNTIL WS-NO-MORE-ASSET                                        
              PERFORM 5620-CLOSE-ASSET-CURSOR                                   
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'FAIL REVERSAL TRANSFER NOT FOUND' TO SYSTEM-MSG             
              PERFORM 9000-ERROR-RTN.                                           
           PERFORM 2300-FROM-TFR.                                               
           MOVE +1  TO TWA-PAGE-NUM  WS-HST-ITEM.                               
           PERFORM 2315-FROM-HIST-TS.                                           
           PERFORM 0730-PROTECT-ALL-FLDS.                                       
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           MOVE -1 TO MNEXTL.                                                   
           PERFORM 8000-SEND-MAP-ERASE.                                         
           PERFORM 8800-RETURN-TO-CICS.                                         
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    CLEAR SCREEN FOR THE INQUIRY ONLY                           *        
      *----------------------------------------------------------------*        
       0710-CLEAR-SCR-FOR-INQUIRY.                                              
           MOVE SPACE TO MBRO                                                   
                         MACO                                                   
ET0004                   SRCHTAGO                                               
                         MCBRKRO                                                
                         MCACCTO                                                
ET0001                   MTRNFRO                                                
                         MRRO                                                   
                         MCBNAMO                                                
                         MCTYPEO                                                
                         MSDO                                                   
                         MACATO                                                 
                         MSTATO                                                 
                         MNAMEO                                                 
                         MSSNO                                                  
                         MNAME2O                                                
                         MSSN2O                                                 
                         MNEXTO                                                 
                         MSUBO                                                  
                         MDELO                                                  
                         MMBRO                                                  
                         MMACO                                                  
                         MMRRO                                                  
                         MCURO                                                  
                         MMTFRO                                                 
                         MMRDO                                                  
                         MMBKRO                                                 
                         MMSTATO                                                
                         MMSDO.                                                 
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 2                        
              MOVE SPACE TO  MSECR-O  (SUB)                                     
                             MCATGR-O (SUB)                                     
                             MSLOC-O  (SUB)                                     
                             MTYPE-O  (SUB)                                     
                             MDESC1-O (SUB)                                     
                             MDESC2-O (SUB)                                     
                             MQTY-I   (SUB)                                     
                             MRSON-O  (SUB)                                     
                             MRCLM-O  (SUB)                                     
ET0003                       MTAG-O   (SUB)                                     
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    FETCH ACTIVE TABLE AND SAVE IT IN TEMP STORAGE              *        
      *    NOTE: HST-ASSET-TSQ (USED TO SAVE HISTORY ASSET) IS ALSO    *        
      *          USED TO SAVE ACTIVE ASSET.                            *        
      *----------------------------------------------------------------*        
       0720-SAVE-ASSET-IN-TS.                                                   
           PERFORM 5610-FETCH-ASSET-CURSOR.                                     
           IF WS-NO-MORE-ASSET                                                  
              IF SUB = 1                                                        
                 PERFORM 7120-WRITE-HIST-ASSET-TSQ                              
                 ADD 1 TO TWA-MAX-PAGE-HST                                      
              END-IF                                                            
              GO TO 0720-EXIT.                                                  
      ***  IF ACAT13-AST-STTL-LOC = '10' OR '30' OR '35' OR                     
      ***                           '40' OR '45' OR '50'                        
      ***      GO TO 0720-EXIT.                                                 
           IF ACAT13-AST-STTL-LOC =         '30' OR '35' OR                     
                                    '40' OR '45' OR '05'                        
               GO TO 0720-EXIT.                                                 
                                                                                
      ***************************************************                       
      ****     THESE LINES ARE TEMPORARILY SUPPRESSED ***                       
      ****     FOR CLIENT TO TEST                     ***                       
      ***************************************************                       
      ****     !!!!!!!!!!!!!!!!!!!!!!!!!!!            ***                       
      ****     CHANGE IT BACK AFTER TEST COMPLETES    ***                       
      ****     !!!!!!!!!!!!!!!!!!!!!!!!!!!            ***                       
      ***************************************************                       
      **      ACAT13-AST-FAIL-SNT-CAGE = 'Y'                                    
      **       CONTINUE                                                         
      **   ELSE                                                                 
      **       GO TO 0720-EXIT.                                                 
      ***************************************************                       
LRM015     IF ACAT13-AST-FAIL-OPN-CAGE = 'R'                                    
LRM015         GO TO 0720-EXIT.                                                 
                                                                                
           IF ACAT13-AST-QTY  NOT = 0                                           
              ADD +1 TO SUB                                                     
              MOVE ACAT13-AST-SEC       TO TS-HST-SECUR    (SUB)                
              MOVE ACAT13-AST-CTGRY     TO TS-HST-CTGRY    (SUB)                
              MOVE ACAT13-AST-STTL-LOC  TO TS-HST-STTL-LOC (SUB)                
              MOVE ACAT13-AST-CS-MG-SH  TO TS-HST-TYPE     (SUB)                
              MOVE ACAT13-AST-DESC      TO TS-HST-DESC     (SUB)                
              MOVE ACAT13-AST-QTY       TO TS-HST-QTY-ORIG (SUB)                
              MOVE ACAT13-AST-REASON    TO TS-HST-REASON   (SUB)                
              MOVE ACAT13-AST-SEQ-NBR   TO TS-HST-SEQ-NBR  (SUB)                
              MOVE ACAT13-AST-PSTN-CD   TO TS-HST-PSTN-CD  (SUB)                
              MOVE ACAT13-AST-CMNTS     TO TS-HST-CMNTS    (SUB)                
              MOVE 'Y'                  TO TS-HST-RCLMED   (SUB)                
ET0003        MOVE ACAT13-AST-CAGE-TAG  TO TS-HST-TAG      (SUB)                
ET0005        MOVE ACAT13-AST-ADP-NBR   TO TS-HST-ADP-NBR  (SUB)                
              IF SUB >= 2                                                       
                 MOVE 0 TO SUB                                                  
                 PERFORM 7120-WRITE-HIST-ASSET-TSQ                              
                 ADD 1 TO TWA-MAX-PAGE-HST                                      
                 INITIALIZE TS-HST-ASSET-AREA                                   
              END-IF                                                            
           END-IF.                                                              
       0720-EXIT.                                          EXIT.                
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *   PROTECT ALL SCREEN FIELDS FOR INQUIRY ONLY                   *        
      *----------------------------------------------------------------*        
       0730-PROTECT-ALL-FLDS.                                                   
           MOVE ATT-ASKIP  TO MBRA                                              
                              MACA                                              
                              MSUBA                                             
                              MDELA                                             
                              MMBRA                                             
                              MMACA                                             
                              MMRRA                                             
                              MCURA                                             
                              MMTFRA                                            
                              MMRDA                                             
                              MMBKRA                                            
                              MMSTATA                                           
                              MMSDA.                                            
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 2                        
              MOVE ATT-ASKIP TO MRSON-A (SUB)                                   
                                MRCLM-A (SUB)                                   
ET0003                          MTAG-A  (SUB)                                   
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *  READ ACTIVE TRANSFER TBL AND SETUP TWA-MAP-AREA FOR INQUIRY   *        
      *----------------------------------------------------------------*        
       0790-GET-ACTIVE-TRANSFER.                                                
           MOVE ACAT-CONTROL-NBR TO ACAT13-PASS-ACAT.                           
           SET  ACAT13-GET-TRANSFER TO TRUE.                                    
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-NOT-FOUND                                                  
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MNEXTL                                                 
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'DB2 GET TRANSFER ERROR - CALL HEL DESK'                     
LRM012                      TO WK-DB2-ERROR                                     
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
           IF ACAT13-NORMAL                                                     
              MOVE ACAT13-TFR-DLVR-ACCT(1:8) TO WS-DLVR-ACCT                    
              MOVE ACAT13-TFR-RR             TO TWA-MAP-RR                      
              PERFORM 2500-BR-AE-SECURITY                                       
              IF SRCH-SIGNON-SECR-CHECK-PASS                                    
                 MOVE ACAT13-TFR-DLVR-ACCT TO TWA-DLVR-ACCT                     
                 MOVE TWA-DLVR-ACCT        TO WS-DLVR-ACCT                      
                 MOVE WS-BRANCH            TO TWA-MAP-BR                        
                 MOVE WS-ACCT              TO TWA-MAP-AC                        
                 MOVE ACAT13-TFR-RCV       TO TWA-MAP-CBRKR                     
                 MOVE ACAT13-TFR-RCV-ACCT  TO TWA-MAP-CACCT                     
ET0001           MOVE ACAT13-TFR-TYPE      TO TWA-MAP-TFR-TYPE                  
                 MOVE ACAT13-TFR-ACAT      TO TWA-MAP-ACAT TWA-ACAT             
                 MOVE ACAT13-TFR-STTS      TO TWA-MAP-STAT                      
                 MOVE ACAT13-TFR-ACCT-TYPE TO TWA-MAP-CTYPE                     
                 MOVE ACAT13-TFR-RR        TO TWA-MAP-RR                        
                 MOVE ACAT13-TFR-CMNTS     TO TWA-MAP-ACT-CMNTS                 
                 IF ACAT13-TFR-STTL-DT = '0001-01-01'                           
                    MOVE SPACE             TO TWA-MAP-SD                        
                 ELSE                                                           
                    IF ACAT13-TFR-STTL-DT > SPACE                               
                       MOVE ACAT13-TFR-STTL-DT  TO WS-DB2-FORM-DATE             
                       MOVE WS-DATE-YY        TO WS-EDITED-YY                   
                       MOVE WS-DATE-MM        TO WS-EDITED-MM                   
                       MOVE WS-DATE-DD        TO WS-EDITED-DD                   
                       MOVE WS-EDITED-DATE    TO TWA-MAP-SD                     
                    ELSE                                                        
                       MOVE SPACE             TO TWA-MAP-SD                     
                    END-IF                                                      
                 END-IF                                                         
                 MOVE ACAT13-TFR-NM1       TO TWA-MAP-NAME                      
                 MOVE ACAT13-TFR-NM2       TO TWA-MAP-NAME2                     
                 IF ACAT13-TFR-SS1 = SPACE                                      
                    MOVE SPACE             TO TWA-MAP-SSN                       
                 ELSE                                                           
                    MOVE ACAT13-TFR-SS1(1:3) TO WS-SS-NUM1                      
                    MOVE ACAT13-TFR-SS1(4:2) TO WS-SS-NUM2                      
                    MOVE ACAT13-TFR-SS1(6:4) TO WS-SS-NUM3                      
                    MOVE WS-SS-NUM           TO TWA-MAP-SSN                     
                 END-IF                                                         
                 IF ACAT13-TFR-SS2 = SPACE                                      
                    MOVE SPACE             TO TWA-MAP-SSN2                      
                 ELSE                                                           
                    MOVE ACAT13-TFR-SS2(1:3) TO WS-SS-NUM1                      
                    MOVE ACAT13-TFR-SS2(4:2) TO WS-SS-NUM2                      
                    MOVE ACAT13-TFR-SS2(6:4) TO WS-SS-NUM3                      
                    MOVE WS-SS-NUM           TO TWA-MAP-SSN2                    
                 END-IF                                                         
              ELSE                                                              
                 MOVE -1        TO MNEXTL                                       
                 SET WK-MSG-ON  TO TRUE                                         
                 MOVE 'UNAUTHORIZED FOR THE REQUESTED BRANCH'                   
                   TO SYSTEM-MSG                                                
                 PERFORM 9000-ERROR-RTN                                         
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *        AFTER FIRST TIME PROCESS                                *        
      *----------------------------------------------------------------*        
       0900-CONTINUE-PROCESS.                                                   
           PERFORM 7000-READ-TSQ-RTN.                                           
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           SET DATA-ONLY TO TRUE.                                               
           EVALUATE TRUE                                                        
                WHEN EIBAID = DFHPF11 OR DFHCLEAR                               
                     PERFORM 8700-RETURN-CONTROL-RTN                            
                WHEN EIBAID = DFHPF10 OR DFHPF12                                
                     PERFORM 8800-RETURN-TO-CICS                                
                WHEN EIBAID = DFHPF1                                            
                     IF  (TWA-TFR-NEW OR TWA-TFR-UPDATE)                        
                                    OR                                          
                               TWA-TFR-INQUIRY                                  
                         PERFORM 1800-SEND-POPUP-MAP-RTN                        
                     ELSE                                                       
                        SET  WK-ERROR  TO TRUE                                  
                        MOVE LOW-VALUE TO ACAT13MO                              
                        MOVE -1 TO MNEXTL                                       
                        MOVE 'PF1 KEY DISABLED AT THIS TIME'                    
                          TO  SYSTEM-MSG                                        
                        PERFORM 9000-ERROR-RTN                                  
                     END-IF                                                     
ET0008          WHEN EIBAID = DFHPF2                                            
ET0008               PERFORM 1700-ADD-FAIL-REV                                  
ET0010          WHEN EIBAID = DFHPF4                                            
ET0010               PERFORM  5800-SRCH-ALL-NEW-FRVS                            
                WHEN EIBAID = DFHENTER                                          
                     PERFORM 8500-RECEIVE-MAP                                   
                     PERFORM 1000-ENTER-KEY                                     
                WHEN EIBAID = DFHPA1                                            
                     PERFORM 6000-NEXT-PAGE                                     
                WHEN EIBAID = DFHPA2                                            
                     PERFORM 6100-PREV-PAGE                                     
ET0001          WHEN EIBAID = DFHPF7                                            
ET0001               PERFORM 6500-PREV-PAGE-TIF                                 
ET0001          WHEN EIBAID = DFHPF8                                            
ET0001               PERFORM 6600-NEXT-PAGE-TIF                                 
                WHEN OTHER                                                      
                     SET  WK-ERROR  TO TRUE                                     
                     MOVE LOW-VALUE TO ACAT13MO                                 
                     MOVE -1 TO MNEXTL                                          
                     MOVE 'ERROR FUNCTION KEY'                                  
                       TO SYSTEM-MSG                                            
                     PERFORM 9000-ERROR-RTN                                     
           END-EVALUATE.                                                        
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *        ENTER KEY ROUTINE                                       *        
      *----------------------------------------------------------------*        
       1000-ENTER-KEY.                                                          
           MOVE SPACE  TO WK-ERROR-SW                                           
                          WK-MSG-ON-SW.                                         
           IF TWA-TFR-INQUIRY                                                   
              PERFORM 1600-NEXT-SELECTION-RTN                                   
              PERFORM 0730-PROTECT-ALL-FLDS                                     
              PERFORM 7020-WRITE-TSQ-RTN                                        
              PERFORM 8100-SEND-MAP-DATA-ONLY                                   
              PERFORM 8800-RETURN-TO-CICS                                       
           END-IF.                                                              
                                                                                
ET0004     PERFORM 1010-SEARCH-BY-TAG-RTN.                                      
ET0004                                                                          
           IF TWA-FIRST-ENTER-RTN = '0'                                         
              MOVE '1' TO TWA-FIRST-ENTER-RTN                                   
           ELSE                                                                 
           IF TWA-FIRST-ENTER-RTN = '1'                                         
              MOVE '2' TO TWA-FIRST-ENTER-RTN.                                  
                                                                                
ET0004     IF WS-SEARCH-BY-TAG                                                  
ET0004        MOVE ATT-UNPROT TO MBRA MACA                                      
ET0004     ELSE                                                                 
              PERFORM 1100-VALIDATE-ACCT-ENTRY                                  
ET0004     END-IF.                                                              
           IF WK-ERROR                                                          
              CONTINUE                                                          
           ELSE                                                                 
              IF TWA-FIRST-ENTER-RTN = '1'                                      
                 IF TWA-MAP-KEY-BR = MBRO AND                                   
                    TWA-MAP-KEY-AC = MACO                                       
                     CONTINUE                                                   
                 ELSE                                                           
                    MOVE MBRO     TO TWA-MAP-KEY-BR                             
                    MOVE MACO     TO TWA-MAP-KEY-AC                             
                    PERFORM 2000-NEW-ACCT-ENTRY                                 
                    IF NOT WK-ERROR                                             
                       MOVE -1 TO MNEXTL                                        
                    END-IF                                                      
                    PERFORM  7020-WRITE-TSQ-RTN                                 
                    PERFORM  8100-SEND-MAP-DATA-ONLY                            
                    PERFORM  8800-RETURN-TO-CICS                                
                 END-IF                                                         
              ELSE                                                              
                 IF TWA-MAP-KEY-BR = TWA-MAP-BR  AND                            
                    TWA-MAP-KEY-AC = TWA-MAP-AC                                 
                     CONTINUE                                                   
                 ELSE                                                           
                    MOVE TWA-MAP-BR TO TWA-MAP-KEY-BR                           
                    MOVE TWA-MAP-AC TO TWA-MAP-KEY-AC                           
                    PERFORM 2000-NEW-ACCT-ENTRY                                 
                    IF NOT WK-ERROR                                             
                       MOVE -1 TO MNEXTL                                        
                    END-IF                                                      
                    PERFORM  7020-WRITE-TSQ-RTN                                 
                    PERFORM  8100-SEND-MAP-DATA-ONLY                            
                    PERFORM  8800-RETURN-TO-CICS                                
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF TWA-TFR-NEW                                                       
              MOVE TWA-PAGE-NUM TO WS-HST-ITEM                                  
              PERFORM 7100-READ-HIST-ASSET-TSQ                                  
              IF WK-TS-READ-OK                                                  
                 PERFORM 1520-VALIDATE-RSON-RCLM THRU 1520-EXIT                 
                    VARYING SUB FROM 1 BY 1  UNTIL SUB > 2                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
           PERFORM 1600-NEXT-SELECTION-RTN.                                     
                                                                                
           IF TWA-TFR-NEW                                                       
              IF MSUBL > 0                                                      
                 IF MSUBI = TWA-MAP-SUB                                         
                    CONTINUE                                                    
                 ELSE                                                           
                    MOVE MSUBI TO TWA-MAP-SUB                                   
                 END-IF                                                         
              ELSE                                                              
                 IF MSUBA = ERASE-KEY                                           
                    MOVE SPACES TO TWA-MAP-SUB                                  
                 END-IF                                                         
              END-IF                                                            
              IF TWA-MAP-SUB = LOW-VALUE                                        
                 MOVE SPACE TO TWA-MAP-SUB                                      
              END-IF                                                            
              MOVE ATT-UNPROT TO MSUBA                                          
              IF NOT WK-ERROR                                           11000000
                 PERFORM 4000-SUBMIT-RTN                                        
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF TWA-TFR-UPDATE                                                    
ET0006     AND (NOT TWA-NSCC-PEND-CD-IS-Y)                                      
              IF MDELL > 0                                                      
                 IF MDELI = TWA-MAP-DEL                                         
                    CONTINUE                                                    
                 ELSE                                                           
                    MOVE MDELI TO TWA-MAP-DEL                                   
                 END-IF                                                         
              ELSE                                                              
                 IF MDELA = ERASE-KEY                                           
                    MOVE SPACES TO TWA-MAP-DEL                                  
                 END-IF                                                         
              END-IF                                                            
              IF TWA-MAP-DEL = LOW-VALUE                                        
                 MOVE SPACE TO TWA-MAP-DEL                                      
              END-IF                                                            
              MOVE ATT-UNPROT TO MDELA                                          
              IF TWA-MAP-DEL = SPACE                                            
                 MOVE SPACE TO TWA-DELETE-CONFIRM                               
              ELSE                                                              
                 PERFORM 4100-DELETE-RTN THRU 4100-EXIT                         
              END-IF                                                            
           END-IF.                                                              
           IF NOT WK-ERROR                                                      
              MOVE -1    TO MNEXTL                                              
              MOVE SPACE TO TRLMSGO.                                            
           PERFORM  7020-WRITE-TSQ-RTN.                                         
           IF FIRST-TIME                                                        
              PERFORM 8000-SEND-MAP-ERASE                                       
           ELSE                                                                 
              PERFORM 8100-SEND-MAP-DATA-ONLY.                                  
           PERFORM  8800-RETURN-TO-CICS.                                        
       EJECT                                                                    
ET0004*                                                                         
ET0004*----------------------------------------------------------------*        
ET0004*       CHECK "SEARCH BY CAGE TAG #" FIELD                       *        
ET0004*----------------------------------------------------------------*        
ET0004 1010-SEARCH-BY-TAG-RTN.                                                  
           IF SRCHTAGL > 0                                                      
              IF SRCHTAGI = TWA-SRCH-TAG                                        
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE SRCHTAGI TO TWA-SRCH-TAG                                  
              END-IF                                                            
           ELSE                                                                 
              IF SRCHTAGA = ERASE-KEY                                           
                 MOVE SPACES TO TWA-SRCH-TAG                                    
              END-IF                                                            
           END-IF.                                                              
           MOVE ATT-UNPROT TO SRCHTAGA.                                         
                                                                                
           IF TWA-SRCH-TAG = SPACE                                              
               MOVE SPACE TO TWA-PREV-SRCH-TAG                                  
           ELSE                                                                 
              IF TWA-SRCH-TAG = TWA-PREV-SRCH-TAG                               
                 CONTINUE                                                       
              ELSE                                                              
                 SET WS-SEARCH-BY-TAG TO TRUE                                   
                 MOVE TWA-SRCH-TAG TO TWA-PREV-SRCH-TAG                         
                 SET WS-TAG-FOUND TO TRUE                                       
                 PERFORM 1020-TRNFR-REC-THRU-CAGE-TAG                           
                    THRU 1020-EXIT                                              
                 IF WS-TAG-FOUND                                                
                    CONTINUE                                                    
                 ELSE                                                           
                    MOVE SPACE TO MBRO TWA-MAP-BR TWA-MAP-KEY-BR                
                                  MACO TWA-MAP-AC TWA-MAP-KEY-AC                
                    PERFORM 2010-CLEAR-SCR                                      
                    MOVE ATT-UNPROT-BRT  TO SRCHTAGA                            
                    IF NOT WK-ERROR                                             
                       MOVE -1        TO SRCHTAGL                               
                       SET WK-ERROR   TO TRUE                                   
                       MOVE 'REQUESTED CAGE TAG NUMBER NOT FOUND'               
                         TO  SYSTEM-MSG                                         
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
       EJECT                                                                    
ET0004*                                                                         
ET0004*----------------------------------------------------------------*        
ET0004*  (1) FIND ACAT CONTROL NBR FROM CAGE TAG XREF FILE.            *        
ET0004*  (2) GET A TRANSFER REC FROM HISTORY TRNFR TABLE WHOSE ACAT    *        
ET0004*      NBR IS EQUAL TO THE ACAT NBR FOUND AT (1), THEN GET       *        
ET0004*      BRANCH AND ACCOUNT NBRS.                                  *        
ET0004*  (3) INSERT BRANCH AND ACCOUNT INTO BRANCH ACCOUNT MAP FIELDS. *        
ET0004*  (4) DISPLAY TIF AND ASSET DATA ON A SCREEN WHERE ACAT CONTROL *        
ET0004*      NBR IS EQUAL TO ACAT NBR FOUND AT (1).                    *        
ET0004*----------------------------------------------------------------*        
ET0004 1020-TRNFR-REC-THRU-CAGE-TAG.                                            
                                                                                
           MOVE SPACES               TO WS-CAGE-TAG-KEY.                        
           MOVE ACAT-CLIENT-NO       TO WS-CAGE-TAG-CLT.                        
           MOVE TWA-SRCH-TAG         TO WS-CAGE-TAG-NBR.                        
           PERFORM 7310-START-BRW-CAGE-TAG.                                     
           IF EIBRESP = +13                                                     
              SET WS-TAG-NOT-FOUND TO TRUE                                      
              PERFORM 7330-END-BRW-CAGE-TAG                                     
              GO TO 1020-EXIT                                                   
           END-IF.                                                              
                                                                                
           PERFORM 7320-READ-NEXT-CAGE-TAG.                                     
           IF EIBRESP = +16                                                     
              SET WS-TAG-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
           IF EIBRESP = +0                                                      
              IF ACAT-CAGE-TAG-NBR = TWA-SRCH-TAG                               
                 PERFORM  1030-GET-ACCOUNT-THRU-HIST                            
              ELSE                                                              
                 SET WS-TAG-NOT-FOUND TO TRUE                                   
              END-IF                                                            
           END-IF.                                                              
                                                                                
           PERFORM 7330-END-BRW-CAGE-TAG.                                       
ET0004 1020-EXIT.          EXIT.                                                
ET0004*                                                                         
ET0004*----------------------------------------------------------------*        
ET0004*    GET AN ACCOUNT NBR FROM HIST TRNFR TABLE.                   *        
ET0004*    PLACE ACCOUNT NBR INTO MAP FILED AS IF USER HAS JUST        *        
ET0004*    ENTERED NEW ACCOUNT NUMBER.                                 *        
ET0004*----------------------------------------------------------------*        
ET0004 1030-GET-ACCOUNT-THRU-HIST.                                              
           INITIALIZE ACAT13-RET-VALUES                                         
                      ACAT13-TRANSFER.                                          
           MOVE ACAT-CAGE-CONTROL-NBR  TO ACAT13-PASS-ACAT.                     
           SET ACAT13-GET-TFRHST  TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-NORMAL                                                     
              MOVE ACAT13-TFR-DLVR-ACCT TO WS-DLVR-ACCT                         
              MOVE WS-BRANCH            TO MBRO TWA-MAP-BR                      
              MOVE WS-ACCT              TO MACO TWA-MAP-AC                      
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              SET WS-TAG-NOT-FOUND TO TRUE                                      
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'DB2 READ ERR ON HIST TRANSFER TBL - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *  VALIDATE BRANCH, ACCT, CONTRA BRKR, CONTRA BRKR ACCT ENTRIES  *        
      *----------------------------------------------------------------*        
       1100-VALIDATE-ACCT-ENTRY.                                                
           IF MBRL > 0                                                          
              IF MBRI = TWA-MAP-BR                                              
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MBRI TO TWA-MAP-BR                                        
              END-IF                                                            
           ELSE                                                                 
           IF MBRA = ERASE-KEY                                                  
              MOVE SPACES TO TWA-MAP-BR.                                        
           MOVE ATT-UNPROT TO MBRA.                                             
           IF TWA-MAP-BR = SPACE OR LOW-VALUE                                   
              MOVE ATT-UNPROT-BRT     TO MBRA                                   
              IF NOT WK-ERROR                                                   
                 MOVE -1        TO MBRL                                         
                 SET WK-ERROR   TO TRUE                                         
                 MOVE 'ENTER BRANCH' TO SYSTEM-MSG.                             
                                                                                
           IF MACL > 0                                                          
              IF MACI = TWA-MAP-AC                                              
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MACI TO TWA-MAP-AC                                        
              END-IF                                                            
           ELSE                                                                 
           IF MACA = ERASE-KEY                                                  
              MOVE SPACES TO TWA-MAP-AC.                                        
           MOVE ATT-UNPROT TO MACA.                                             
           IF TWA-MAP-AC = SPACE OR LOW-VALUE                                   
              MOVE ATT-UNPROT-BRT     TO MACA                                   
              IF NOT WK-ERROR                                                   
                 MOVE -1        TO MACL                                         
                 SET WK-ERROR   TO TRUE                                         
                 MOVE 'ENTER ACCOUNT' TO SYSTEM-MSG.                            
                                                                                
           IF WK-ERROR                                                          
              PERFORM 1600-NEXT-SELECTION-RTN                                   
              PERFORM 2010-CLEAR-SCR                                            
ET0004        IF NOT WS-SEARCH-BY-TAG                                           
ET0004           MOVE SPACE      TO SRCHTAGO  TWA-SRCH-TAG-AREA                 
ET0004        END-IF                                                            
              PERFORM 7110-DELETE-HIST-ASSET-TSQ                                
              PERFORM 7210-DELETE-INIT-ASSET-TSQ                                
              MOVE SPACE TO TWA-TFR-UPDATE-IND TWA-MAP-KEY                      
              MOVE 0 TO TWA-PAGE-NUM.                                           
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *           VALIDATE REASON CODE & RECLAIM                       *        
      *----------------------------------------------------------------*        
       1520-VALIDATE-RSON-RCLM.                                                 
           IF TS-HST-QTY-ORIG (SUB) = 0                                         
              GO TO 1520-EXIT.                                                  
           IF MRSON-L (SUB) > 0                                                 
              IF MRSON-O (SUB) = TWA-MAP-RSON (SUB)                             
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MRSON-O (SUB) TO TWA-MAP-RSON (SUB)                       
              END-IF                                                            
           ELSE                                                                 
              IF MRSON-A (SUB) = ERASE-KEY                                      
                 MOVE SPACES TO TWA-MAP-RSON (SUB)                              
              END-IF.                                                           
           IF TWA-MAP-RSON (SUB) = LOW-VALUE                                    
              MOVE LOW-VALUE TO TWA-MAP-RSON (SUB).                             
           IF MRCLM-L (SUB)> 0                                                  
              IF MRCLM-O (SUB) = TWA-MAP-RCLM (SUB)                             
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MRCLM-O (SUB) TO TWA-MAP-RCLM (SUB)                       
              END-IF                                                            
           ELSE                                                                 
              IF MRCLM-A (SUB) = ERASE-KEY                                      
                 MOVE SPACES TO TWA-MAP-RCLM (SUB)                              
              END-IF.                                                           
           IF TWA-MAP-RCLM (SUB) = LOW-VALUE                                    
              MOVE SPACE TO TWA-MAP-RCLM (SUB).                                 
                                                                                
ET0003     IF MTAG-L (SUB)> 0                                                   
ET0003        IF MTAG-O (SUB) = TWA-MAP-TAG (SUB)                               
ET0003           CONTINUE                                                       
ET0003        ELSE                                                              
ET0003           MOVE MTAG-O (SUB) TO TWA-MAP-TAG (SUB)                         
ET0003        END-IF                                                            
ET0003     ELSE                                                                 
ET0003        IF MTAG-A (SUB) = ERASE-KEY                                       
ET0003           MOVE SPACES TO TWA-MAP-TAG (SUB)                               
ET0003        END-IF.                                                           
ET0003     IF TWA-MAP-TAG (SUB) = LOW-VALUE                                     
ET0003        MOVE SPACE TO TWA-MAP-TAG (SUB).                                  
                                                                                
           IF TS-HST-RCLMED (SUB) = 'Y'                                         
              MOVE ATT-ASKIP  TO MRSON-A (SUB) MRCLM-A (SUB)            11000000
ET0003                           MTAG-A  (SUB)                          11000000
           ELSE                                                                 
              MOVE ATT-UNPROT TO MRSON-A (SUB) MRCLM-A (SUB)            11000000
ET0003                           MTAG-A  (SUB)                          11000000
ET0003     END-IF.                                                              
                                                                                
           IF TWA-MAP-RSON (SUB) = SPACE                                        
              IF TWA-MAP-RCLM (SUB) = 'Y'                                       
                 MOVE -1 TO MRSON-L (SUB)                               11000000
                 MOVE ATT-UNPROT-BRT TO MRSON-A (SUB)                   11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'ENTER REASON, OR TYPE "?" FOR THE REASON CODE 11000000
      -                  'INQUIRY/SELECTION'                            11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              ELSE                                                              
                 CONTINUE                                               11000000
              END-IF                                                            
           ELSE                                                         11000000
           IF TWA-MAP-RSON (SUB) = '40' OR '41' OR '42' OR '43' OR              
                                   '44' OR '45' OR '46' OR '47'                 
ET0001**      CONTINUE                                                          
ET0001        IF TWA-MAP-RCLM (SUB) = 'Y'                                       
ET0001           CONTINUE                                                       
ET0001        ELSE                                                              
ET0001           MOVE -1 TO MRCLM-L (SUB)                               11000000
ET0001           MOVE ATT-UNPROT-BRT TO MRCLM-A (SUB)                   11000000
ET0001           IF NOT WK-ERROR                                        11000000
ET0001              SET   WK-ERROR   TO TRUE                            11000000
ET0001              MOVE 'ENTER "Y" TO RECLAIM' TO SYSTEM-MSG           11000000
ET0001           END-IF                                                 11000000
ET0001        END-IF                                                            
           ELSE                                                                 
              MOVE TWA-MAP-RSON (SUB) TO WS-REASON                              
              IF WS-REASON1 = '?' OR                                            
                 WS-REASON2 = '?'                                               
                  MOVE 'R' TO TWA-SCREEN                                        
                  PERFORM 1800-SEND-POPUP-MAP-RTN                               
              ELSE                                                              
                  MOVE -1  TO MRSON-L (SUB)                             11000000
                  MOVE ATT-UNPROT-BRT TO MRSON-A (SUB)                  11000000
                  IF NOT WK-ERROR                                       11000000
                     SET   WK-ERROR   TO TRUE                           11000000
                     MOVE 'INVALID REASON CODE'                         11000000
                       TO  SYSTEM-MSG                                   11000000
                  END-IF                                                11000000
              END-IF.                                                           
                                                                        11000000
           IF TWA-MAP-RCLM (SUB) = SPACE OR 'Y'                                 
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MRCLM-L (SUB)                                  11000000
              MOVE ATT-UNPROT-BRT TO MRCLM-A (SUB)                      11000000
              IF NOT WK-ERROR                                           11000000
                 SET   WK-ERROR   TO  TRUE                              11000000
              MOVE 'ENTER "Y" TO RECLAIM OR ENTER SPACE OTHERWISE'      11000000
                TO SYSTEM-MSG                                           11000000
              END-IF                                                    11000000
           END-IF.                                                      11000000
           IF NOT WK-ERROR                                                      
              IF TS-HST-RCLMED (SUB) NOT = 'Y'                                  
                 IF (TWA-MAP-RCLM (SUB) NOT = TS-HST-RCLM-IND (SUB))            
                 OR (TWA-MAP-RSON (SUB) NOT = TS-HST-REASON (SUB))              
                      MOVE TWA-MAP-RCLM (SUB) TO TS-HST-RCLM-IND (SUB)          
                      MOVE TWA-MAP-RSON (SUB) TO TS-HST-REASON (SUB)            
                      MOVE TWA-PAGE-NUM       TO WS-HST-ITEM                    
                      PERFORM 7130-REWRITE-HIST-ASSET-TSQ                       
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
ET0003                                                                          
ET0003     IF TWA-MAP-TAG (SUB) NOT = TS-HST-TAG (SUB)                          
ET0003        MOVE TWA-MAP-TAG (SUB)  TO TS-HST-TAG (SUB)                       
ET0003        MOVE TWA-PAGE-NUM       TO WS-HST-ITEM                            
ET0003        PERFORM 7130-REWRITE-HIST-ASSET-TSQ                               
ET0003     END-IF.                                                              
       1520-EXIT.                                       EXIT.                   
       EJECT                                                            11000000
      *                                                                         
      *----------------------------------------------------------------*        
      *              JUMP TO NEXT SELECTION                            *        
      *----------------------------------------------------------------*        
       1600-NEXT-SELECTION-RTN.                                                 
           IF MMBRL > 0                                                         
              IF MMBRI = TWA-MAP-MMBR                                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMBRI TO TWA-MAP-MMBR                                     
              END-IF                                                            
           ELSE                                                                 
              IF MMBRA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-MMBR                                    
              END-IF.                                                           
           IF TWA-MAP-MMBR = LOW-VALUE                                          
              MOVE SPACE TO TWA-MAP-MMBR.                                       
           MOVE ATT-UNPROT TO MMBRA.                                            
                                                                                
           IF MMACL > 0                                                         
              IF MMACI = TWA-MAP-MMAC                                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMACI TO TWA-MAP-MMAC                                     
              END-IF                                                            
           ELSE                                                                 
              IF MMACA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-MMAC                                    
              END-IF.                                                           
           IF TWA-MAP-MMAC = LOW-VALUE                                          
              MOVE SPACE TO TWA-MAP-MMAC.                                       
           MOVE ATT-UNPROT TO MMACA.                                            
                                                                                
           IF MMRRL > 0                                                         
              IF MMRRI = TWA-MAP-MMRR                                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMRRI TO TWA-MAP-MMRR                                     
              END-IF                                                            
           ELSE                                                                 
              IF MMRRA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-MMRR                                    
              END-IF.                                                           
           IF TWA-MAP-MMRR = LOW-VALUE                                          
              MOVE SPACE TO TWA-MAP-MMRR.                                       
           MOVE ATT-UNPROT TO MMRRA.                                            
                                                                                
           IF MMTFRL > 0                                                        
              IF MMTFRI = TWA-MAP-MMTFR                                         
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMTFRI TO TWA-MAP-MMTFR                                   
              END-IF                                                            
           ELSE                                                                 
              IF MMTFRA = ERASE-KEY                                             
                 MOVE SPACES TO TWA-MAP-MMTFR                                   
              END-IF.                                                           
           IF TWA-MAP-MMTFR = LOW-VALUE                                         
              MOVE SPACE TO TWA-MAP-MMTFR.                                      
           MOVE ATT-UNPROT TO MMTFRA.                                           
                                                                                
           IF MMRDL > 0                                                         
              IF MMRDI = TWA-MAP-MMRD                                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMRDI TO TWA-MAP-MMRD                                     
              END-IF                                                            
           ELSE                                                                 
              IF MMRDA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-MMRD                                    
              END-IF.                                                           
           IF TWA-MAP-MMRD = LOW-VALUE                                          
              MOVE SPACE TO TWA-MAP-MMRD.                                       
           MOVE ATT-UNPROT TO MMRDA.                                            
                                                                                
           IF MMBKRL > 0                                                        
              IF MMBKRI = TWA-MAP-MMBKR                                         
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMBKRI TO TWA-MAP-MMBKR                                   
              END-IF                                                            
           ELSE                                                                 
              IF MMBKRA = ERASE-KEY                                             
                 MOVE SPACES TO TWA-MAP-MMBKR                                   
              END-IF.                                                           
           IF TWA-MAP-MMBKR = LOW-VALUE                                         
              MOVE SPACE TO TWA-MAP-MMBKR.                                      
           MOVE ATT-UNPROT TO MMBKRA.                                           
                                                                                
           IF MMSTATL > 0                                                       
              IF MMSTATI = TWA-MAP-MMSTAT                                       
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMSTATI TO TWA-MAP-MMSTAT                                 
              END-IF                                                            
           ELSE                                                                 
              IF MMSTATA = ERASE-KEY                                            
                 MOVE SPACES TO TWA-MAP-MMSTAT                                  
              END-IF.                                                           
           IF TWA-MAP-MMSTAT = LOW-VALUE                                        
              MOVE SPACE TO TWA-MAP-MMSTAT.                                     
           MOVE ATT-UNPROT TO MMSTATA.                                          
                                                                                
           IF MMSDL > 0                                                         
              IF MMSDI = TWA-MAP-MMSD                                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMSDI TO TWA-MAP-MMSD                                     
              END-IF                                                            
           ELSE                                                                 
              IF MMSDA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-MMSD                                    
              END-IF.                                                           
           IF TWA-MAP-MMSD = LOW-VALUE                                          
              MOVE SPACE TO TWA-MAP-MMSD.                                       
           MOVE ATT-UNPROT TO MMSDA.                                            
                                                                                
           MOVE TWA-MAP-MMBR   TO ACAT-INP-BRANCH.                              
           MOVE TWA-MAP-MMAC   TO ACAT-INP-ACCOUNT.                             
           MOVE TWA-MAP-MMRR   TO ACAT-INP-RR.                                  
           MOVE TWA-MAP-MMTFR  TO ACAT-INP-TFR-TYP.                             
           MOVE TWA-MAP-MMRD   TO ACAT-INP-RCV-DEL.                             
           MOVE TWA-MAP-MMBKR  TO ACAT-INP-CONTRA-BKR.                          
           MOVE TWA-MAP-MMSTAT TO ACAT-INP-STATUS.                              
           MOVE TWA-MAP-MMSD   TO ACAT-INP-STTL-DT.                             
                                                                                
           IF MNEXTL > 0                                                        
              IF MNEXTI = TWA-MAP-NEXT                                          
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MNEXTI TO TWA-MAP-NEXT                                    
              END-IF                                                            
           ELSE                                                                 
              IF MNEXTA = ERASE-KEY                                             
                 MOVE SPACES TO TWA-MAP-NEXT                                    
              END-IF.                                                           
           IF TWA-MAP-NEXT = LOW-VALUE                                          
              MOVE SPACE TO TWA-MAP-NEXT.                                       
           IF TWA-MAP-NEXT = 'L'                                                
              MOVE SPACE TO MNEXTO                                              
                            TWA-MAP-NEXT.                                       
      *                                                                         
           IF TWA-MAP-NEXT = SPACE                                              
              IF TWA-MAP-SEARCH > SPACE                                         
                 PERFORM 1610-NEXT-SEL-SPACE-RTN                                
              END-IF                                                            
           ELSE                                                                 
              MOVE TWA-MAP-NEXT TO ACAT-INP-SEL                                 
              PERFORM 1620-NEXT-SEL-ENTERED-RTN.                                
       EJECT                                                                    
      *                                                                         
       1610-NEXT-SEL-SPACE-RTN.                                                 
           MOVE  'L'   TO  ACAT-INP-SEL.                                        
           PERFORM 1640-VALIDATE-SRCH-ENGINE.                                   
           IF WK-ERROR                                                          
              CONTINUE                                                          
           ELSE                                                                 
              IF ((TWA-MAP-MMBR = TWA-MAP-BR)                                   
              AND (TWA-MAP-MMAC = TWA-MAP-AC))                                  
                 CONTINUE                                                       
              ELSE                                                              
                 PERFORM 4500-CLEAR-SCREEN-N-STORAGE                            
                 PERFORM 1615-SET-MESSAGE                                       
                 IF NOT WK-ERROR                                                
                    MOVE TWA-MAP-MMBR TO MBRO TWA-MAP-BR TWA-MAP-KEY-BR         
                    MOVE TWA-MAP-MMAC TO MACO TWA-MAP-AC TWA-MAP-KEY-AC         
                    PERFORM 2000-NEW-ACCT-ENTRY                                 
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
      *                                                                         
       1615-SET-MESSAGE.                                                        
           IF TWA-MAP-MMBR > SPACE                                              
              MOVE TWA-MAP-MMBR TO MBRO TWA-MAP-BR                              
           END-IF.                                                              
           IF TWA-MAP-MMAC > SPACE                                              
              MOVE TWA-MAP-MMAC TO MACO TWA-MAP-AC                              
           END-IF.                                                              
           SET WK-MSG-ON TO TRUE.                                               
           IF TWA-MAP-MMBR > SPACE                                              
              IF TWA-MAP-MMAC > SPACE                                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE -1 TO MACL                                                
                 MOVE 'ENTER ACCOUNT #' TO SYSTEM-MSG                           
              END-IF                                                            
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              MOVE 'ENTER BRANCH' TO SYSTEM-MSG.                                
       EJECT                                                                    
       1620-NEXT-SEL-ENTERED-RTN.                                               
           MOVE TWA-MAP-NEXT   TO WS-ACAT-NEXT.                                 
       COPY ACATJUMP.                                                           
           IF CALLED-PROGRAM-NAME = SPACES                                      
              MOVE -1             TO MNEXTL                                     
              MOVE ATT-UNPROT-BRT TO MNEXTA                                     
              IF NOT WK-ERROR                                                   
                 SET  WK-ERROR   TO TRUE                                        
                 MOVE 'INVALID "NEXT" SELECTION'                                
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           ELSE                                                                 
              PERFORM 2600-SCREEN-SECURITY-CHECK                                
              PERFORM 7110-DELETE-HIST-ASSET-TSQ                                
              PERFORM 7210-DELETE-INIT-ASSET-TSQ                                
              MOVE 'ACAT13IF'    TO ACAT-CALLING-PROG-NAME                      
              MOVE  TWA-MAP-NEXT TO ACAT-NEXT                                   
              PERFORM 7500-XCTL-TO-DETAIL-PROG.                                 
       EJECT                                                                    
      *                                                                         
       1640-VALIDATE-SRCH-ENGINE.                                               
           EXEC CICS LINK                                                       
                     PROGRAM('ACATSRCH')                                        
                     COMMAREA(ACAT-SEARCH-AREA)                                 
                     LENGTH(LENGTH OF ACAT-SEARCH-AREA)                         
           END-EXEC.                                                            
           IF  ACAT-SRCH-MSG > SPACE                                            
               IF NOT WK-ERROR                                                  
                  SET WK-ERROR TO TRUE                                          
                  MOVE ACAT-SRCH-MSG TO SYSTEM-MSG                              
               END-IF                                                           
               IF  ACAT-SRCH-BR = 'N'                                           
                   MOVE -1             TO MMBRL                                 
                   MOVE ATT-UNPROT-BRT TO MMBRA                                 
               END-IF                                                           
               IF  ACAT-SRCH-ACCT = 'N'                                         
                   MOVE -1             TO MMACL                                 
                   MOVE ATT-UNPROT-BRT TO MMACA                                 
               END-IF                                                           
               IF  ACAT-SRCH-RR = 'N'                                           
                   MOVE -1             TO MMRRL                                 
                   MOVE ATT-UNPROT-BRT TO MMRRA                                 
               END-IF                                                           
               IF  ACAT-SRCH-TFR = 'N'                                          
                   MOVE -1             TO MMTFRL                                
                   MOVE ATT-UNPROT-BRT TO MMTFRA                                
               END-IF                                                           
               IF  ACAT-SRCH-RD = 'N'                                           
                   MOVE -1             TO MMRDL                                 
                   MOVE ATT-UNPROT-BRT TO MMRDA                                 
               END-IF                                                           
               IF  ACAT-SRCH-CONTRA-BKR = 'N'                                   
                   MOVE -1             TO MMBKRL                                
                   MOVE ATT-UNPROT-BRT TO MMBKRA                                
               END-IF                                                           
               IF  ACAT-SRCH-STATUS = 'N'                                       
                   MOVE -1             TO MMSTATL                               
                   MOVE ATT-UNPROT-BRT TO MMSTATA                               
               END-IF                                                           
               IF  ACAT-SRCH-STTLDT = 'N'                                       
                   MOVE -1             TO MMSDL                                 
                   MOVE ATT-UNPROT-BRT TO MMSDA                                 
               END-IF                                                           
           END-IF.                                                              
       EJECT                                                                    
ET0008*                                                                         
ET0008*----------------------------------------------------------------*        
ET0008*                PF2: ADD FAIL REVERSAL                         *         
ET0008*                                                               *         
ET0008*   WHILE NEW FAIL REVERSAL RECORD IS IN INITIAL TRANSFER TBL,  *         
ET0008*   USER CAN ADD ADDITIONAL FRV RECORDS FOR THE SAME ACCOUNT    *         
ET0008*   TO THE TABLE.                                               *         
ET0008*----------------------------------------------------------------*        
ET0008 1700-ADD-FAIL-REV.                                                       
ET0010**   IF TWA-TFR-NEW OR TWA-TFR-INQUIRY                                    
ET0010     IF NOT TWA-TFR-UPDATE                                                
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
LRM013***     MOVE -1 TO MNEXTL                                                 
              MOVE -1              TO MBRL                                      
LRM013        MOVE 'PF2 KEY NOT AVAILABLE / ENTER BRANCH ACCOUNT TO VIEW        
LRM013-            ' HISTORY, THEN PF2 TO ADD'                                  
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
              SET TWA-ADD-FRV  TO TRUE                                          
              SET TWA-TFR-NEW  TO TRUE                                          
              MOVE SPACE TO TWA-MAP-KEY-BR TWA-MAP-KEY-AC                       
              PERFORM 1000-ENTER-KEY                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *             POP-UP SCREEN ROUTINE                              *        
      *----------------------------------------------------------------*        
       1800-SEND-POPUP-MAP-RTN.                                                 
           IF TWA-SCREEN = 'R'                                                  
              MOVE 'R' TO ACAT90CM-TS-SCREEN                                    
           ELSE                                                                 
              MOVE SPACE TO TWA-ASSET-CMNT-LINE-IND                             
              IF EIBCPOSN >= 240 AND < 800                                      
                 MOVE 'A' TO ACAT90CM-TS-SCREEN                                 
              ELSE                                                              
              IF EIBCPOSN >= 880  AND < 1280                                    
                 IF TWA-MAP-QTY (1) = SPACE OR LOW-VALUE                        
                    MOVE ' ' TO ACAT90CM-TS-SCREEN                              
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'PF1 DISABLED' TO SYSTEM-MSG                           
                    PERFORM 9000-ERROR-RTN                                      
                 ELSE                                                           
                    MOVE 'S' TO ACAT90CM-TS-SCREEN                              
                    SET TWA-ASSET-CMNT-LINE-1  TO TRUE                          
                 END-IF                                                         
              ELSE                                                              
              IF EIBCPOSN >= 1280 AND < 1680                                    
                 IF TWA-MAP-QTY (2) = SPACE OR LOW-VALUE                        
                    MOVE ' ' TO ACAT90CM-TS-SCREEN                              
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'PF1 DISABLED' TO SYSTEM-MSG                           
                    PERFORM 9000-ERROR-RTN                                      
                 ELSE                                                           
                    MOVE 'S' TO ACAT90CM-TS-SCREEN                              
                    SET TWA-ASSET-CMNT-LINE-2  TO TRUE                          
                 END-IF                                                         
              ELSE                                                              
                 MOVE ' ' TO ACAT90CM-TS-SCREEN                                 
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'INVALID CURSOR POSITION' TO SYSTEM-MSG                   
                 PERFORM 9000-ERROR-RTN.                                        
                                                                                
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 1810-ACAT90CM-TS-RTN.                                        
ET0002     MOVE 'L' TO ACAT-INP-SEL.                                            
           MOVE '$' TO WS-ACAT-NEXT.                                            
           MOVE 'ACAT90CM' TO CALLED-PROGRAM-NAME.                              
           PERFORM 1900-INVOKE-DETAIL-PGM-RTN.                          07225010
                                                                                
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *       PASS PARMS TO ACAT90CM POP-UP SCREEN PROGRAM             *        
      *----------------------------------------------------------------*        
       1810-ACAT90CM-TS-RTN.                                                    
           MOVE 'ACA$'   TO TRAN-ID.                                    02410002
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         10490002
           END-EXEC.                                                    10500002
                                                                        10510002
           IF TWA-TFR-NEW                                                       
              MOVE 'Y'   TO ACAT90CM-TS-UPDATE-IND                              
           ELSE                                                                 
           IF TWA-TFR-UPDATE OR TWA-TFR-INQUIRY                                 
              MOVE SPACE TO ACAT90CM-TS-UPDATE-IND.                             
                                                                                
           IF ACAT90CM-TS-SCREEN = 'A'                                          
              MOVE TWA-MAP-ACT-CMNTS    TO ACAT90CM-TS-MCCMNT-X120              
           ELSE                                                                 
           IF ACAT90CM-TS-SCREEN = 'S'                                          
              IF TWA-TFR-NEW                                                    
                 MOVE TWA-PAGE-NUM TO WS-HST-ITEM                               
                 PERFORM 7100-READ-HIST-ASSET-TSQ                               
                 IF TWA-ASSET-CMNT-LINE-1                                       
                    MOVE TS-HST-CMNTS (1) TO ACAT90CM-TS-MCCMNT-X120            
                 ELSE                                                           
                 IF TWA-ASSET-CMNT-LINE-2                                       
                    MOVE TS-HST-CMNTS (2) TO ACAT90CM-TS-MCCMNT-X120            
                 END-IF  END-IF                                                 
              END-IF                                                            
              IF TWA-TFR-UPDATE                                                 
                 MOVE TWA-PAGE-NUM TO WS-INI-ITEM                               
                 PERFORM 7200-READ-INIT-ASSET-TSQ                               
                 IF TWA-ASSET-CMNT-LINE-1                                       
                    MOVE TS-INI-CMNTS (1) TO ACAT90CM-TS-MCCMNT-X120            
                 ELSE                                                           
                 IF TWA-ASSET-CMNT-LINE-2                                       
                    MOVE TS-INI-CMNTS (2) TO ACAT90CM-TS-MCCMNT-X120            
                 END-IF  END-IF                                                 
              END-IF                                                            
           END-IF.                                                              
           MOVE TWA-MAP-BR     TO ACAT90CM-TS-MBR.                              
           MOVE TWA-MAP-AC     TO ACAT90CM-TS-MAC.                              
           MOVE TWA-MAP-RR     TO ACAT90CM-TS-MRR.                              
           MOVE TWA-MAP-CTYPE  TO ACAT90CM-TS-MCTYPE.                           
           MOVE TWA-MAP-CBRKR  TO ACAT90CM-TS-MCBRKR.                           
           MOVE TWA-MAP-CACCT  TO ACAT90CM-TS-MCACCT.                           
           IF TWA-ASSET-CMNT-LINE-1                                             
ET0005        IF TWA-MAP-SECR (1) > SPACE                                       
                 MOVE TWA-MAP-SECR (1)    TO ACAT90CM-TS-MNAME                  
ET0005        ELSE                                                              
ET0005           MOVE TWA-MAP-ADP-NBR (1) TO ACAT90CM-TS-MNAME                  
ET0005        END-IF                                                            
ET0005     END-IF.                                                              
           IF TWA-ASSET-CMNT-LINE-2                                             
ET0005        IF TWA-MAP-SECR (2) > SPACE                                       
                 MOVE TWA-MAP-SECR (2)    TO ACAT90CM-TS-MNAME                  
ET0005        ELSE                                                              
ET0005           MOVE TWA-MAP-ADP-NBR (2) TO ACAT90CM-TS-MNAME                  
ET0005        END-IF                                                            
ET0005     END-IF.                                                              
           MOVE TWA-MAP-NAME   TO ACAT90CM-TS-MNAME2.                           
           MOVE TWA-MAP-NAME2  TO ACAT90CM-TS-MNAME3.                           
           MOVE 'ACA$' TO TRAN-ID.                                      02410002
           MOVE +1     TO ITEM-NUM.                                            2
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                                 2
                               FROM(ACAT90CM-TS-AREA)                          2
                               LENGTH(LENGTH OF ACAT90CM-TS-AREA)              2
                               ITEM(ITEM-NUM)                                  2
           END-EXEC.                                                           2
           IF EIBRESP NOT = +0                                                 2
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE 'ACAT13 WRITE TSQ ERROR ON ACA$'                            2
                TO SYSTEM-MSG                                                  2
           END-IF.                                                             2
      *                                                                         
      *----------------------------------------------------------------*        
      *       XCTL TO ACAT90CM POP-UP SCREEN PROGRAM                   *        
      *----------------------------------------------------------------*        
       1900-INVOKE-DETAIL-PGM-RTN.                                             0
           EXEC CICS XCTL PROGRAM(CALLED-PROGRAM-NAME)                          
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
           MOVE CALLED-PROGRAM-NAME TO ERROR-PROG-NAME.                         
           MOVE 'L' TO ACAT-NEXT.                                               
           MOVE ERROR-PROG-MSG    TO SYSTEM-MSG.                                
           MOVE LOW-VALUE TO ACAT13MO.                                          
           MOVE SPACES    TO ACAT-CALLING-PROG-NAME.                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *                 USER ENTERED NEW ACCOUNT                       *        
      *----------------------------------------------------------------*        
       2000-NEW-ACCT-ENTRY.                                                     
ET0006     MOVE SPACE TO TWA-NSCC-PEND-CD-IS-Y-SW.                              
ET0010     MOVE SPACE TO TWA-SRCH-ALL-FRVS-SW.                                  
ET0010                                                                          
ET0004     IF NOT WS-SEARCH-BY-TAG                                              
ET0004        MOVE SPACE      TO SRCHTAGO  TWA-SRCH-TAG-AREA                    
ET0004     END-IF.                                                              
           PERFORM 2010-CLEAR-SCR.                                              
           PERFORM 7110-DELETE-HIST-ASSET-TSQ.                                  
           PERFORM 7210-DELETE-INIT-ASSET-TSQ.                                  
           PERFORM 2100-SAVE-ASSETS-IN-TS                                       
ET0008        THRU 2100-EXIT.                                                   
           MOVE SPACE TO TWA-TFR-UPDATE-IND.                                    
           IF WS-TFR-HIST-FOUND                                                 
              MOVE TWA-MAP-BR   TO WS-BRANCH                                    
              MOVE TWA-MAP-AC   TO WS-ACCT                                      
              PERFORM 2500-BR-AE-SECURITY                                       
              IF SRCH-SIGNON-SECR-CHECK-FAIL                                    
                 MOVE -1        TO MBRL                                         
                 MOVE ATT-UNPROT-BRT TO MBRA MACA                               
                 SET WK-MSG-ON  TO TRUE                                         
                 MOVE 'UNAUTHORIZED FOR THE REQUESTED BRANCH'                   
                   TO SYSTEM-MSG                                                
                 PERFORM 9000-ERROR-RTN                                         
              END-IF                                                            
              PERFORM 2200-SETUP-NEW THRU 2200-EXIT                             
           ELSE                                                                 
              MOVE  0 TO TWA-PAGE-NUM                                           
              MOVE -1 TO MBRL                                                   
              MOVE ATT-UNPROT-BRT TO MBRA MACA                                  
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'NO FAILED TRANSFER FOUND FOR THE REQUESTED ACCT'         
                   TO  SYSTEM-MSG                                               
ET0004           IF WS-SEARCH-BY-TAG                                            
ET0004              MOVE 'REQUESTED CAGE TAG # NOT FOUND'                       
ET0004                TO  SYSTEM-MSG                                            
ET0004           END-IF                                                         
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *              CLEAR SCREEN ROUTINE                              *        
      *----------------------------------------------------------------*        
       2010-CLEAR-SCR.                                                          
           MOVE SPACE TO MRRO                                                   
                         MCBRKRO                                                
                         MCACCTO                                                
ET0001                   MTRNFRO                                                
                         MCBNAMO                                                
                         MCTYPEO                                                
                         MSDO                                                   
                         MACATO                                                 
                         MSTATO                                                 
                         MNAMEO                                                 
                         MSSNO                                                  
                         MNAME2O                                                
                         MSSN2O                                                 
                         MNEXTO                                                 
                         MSUBO                                                  
                         MDELO.                                                 
           MOVE ATT-ASKIP TO MSUBA                                              
                             MDELA.                                             
           PERFORM VARYING SUB FROM 1 BY 1  UNTIL SUB > 2                       
              MOVE  SPACES   TO MSECR-O  (SUB)                                  
                                MCATGR-O (SUB)                                  
                                MSLOC-O  (SUB)                                  
                                MTYPE-O  (SUB)                                  
                                MDESC1-O (SUB)                                  
                                MDESC2-O (SUB)                                  
                                MQTY-I   (SUB)                                  
                                MRSON-O  (SUB)                                  
                                MRCLM-O  (SUB)                                  
ET0003                          MTAG-O   (SUB)                                  
              MOVE ATT-ASKIP TO MRSON-A  (SUB)                                  
                                MRCLM-A  (SUB)                                  
ET0003                          MTAG-A   (SUB)                                  
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *-----------------------------------------------------------*             
      *   ASSET DATA IS STORED IN TEMP STORAGE                    *             
      *-----------------------------------------------------------*             
       2100-SAVE-ASSETS-IN-TS.                                                  
           MOVE 0  TO TWA-MAX-PAGE-HST                                          
                      TWA-MAX-PAGE-INI.                                         
                                                                                
           MOVE ACAT-ADP-BROKER  TO ACAT13-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR TO WS-PASS-BR.                                       
           MOVE TWA-MAP-AC TO WS-PASS-ACCT.                                     
           MOVE ALL '%'    TO WS-PASS-ACCT-MASK.                                
           MOVE WS-PASS-ACCT-DLV TO ACAT13-PASS-ACCT-DLV.                       
           MOVE TWA-MAP-CBRKR TO ACAT13-PASS-CON-BRKR.                          
           MOVE TWA-MAP-CACCT TO ACAT13-PASS-CON-ACCT.                          
                                                                                
ET0003     IF WS-XCTL-FROM-ACAT25PD                                             
ET0004     OR WS-SEARCH-BY-TAG                                                  
ET0003        PERFORM 3000-GET-TFR-HIST                                         
ET0003     ELSE                                                                 
ET0001        PERFORM 2900-OPEN-TRNFR-HIST                                      
ET0001        PERFORM 2910-FETCH-TRNFR-HIST                                     
ET0001        PERFORM 2920-CLOSE-TRNFR-HIST                                     
ET0003     END-IF.                                                              
           IF WS-TFR-HIST-FOUND                                                 
ET0001        PERFORM 2970-TRNF-HIST-TO-TWA                                     
ET0009        PERFORM 2120-CREATE-FRV-TABLE                                     
ET0009        IF WK-ERROR                                                       
ET0009           GO TO 2100-EXIT                                                
ET0009        END-IF                                                            
              MOVE SPACE TO WS-FAIL-ASSET-FOUND-SW                              
              PERFORM 3010-OPEN-ASSET-HIST                                      
              IF WS-ASSET-HIST-FOUND                                            
                 INITIALIZE TS-HST-ASSET-AREA                                   
                 MOVE SPACE TO WS-NO-MORE-DATA-SW                               
                 MOVE 0 TO SUB                                                  
                 PERFORM  3500-SAVE-HST-ASSET-IN-TS THRU 3500-EXIT              
                      UNTIL WS-NO-MORE-DATA                                     
                 IF SUB > 0                                                     
                    PERFORM 7120-WRITE-HIST-ASSET-TSQ                           
                    ADD 1 TO TWA-MAX-PAGE-HST                                   
                 END-IF                                                         
                 IF TWA-MAX-PAGE-HST > 0                                        
                    SET WS-FAIL-ASSET-FOUND TO TRUE                             
                 END-IF                                                         
ET0001**         PERFORM 5000-CHECK-DUPLICATE-ASSETS                            
              END-IF                                                            
              PERFORM 3030-CLOSE-ASSET-HIST                                     
           END-IF.                                                              
                                                                                
ET0008     IF TWA-ADD-FRV                                                       
ET0008        GO TO 2100-EXIT                                                   
ET0008     END-IF.                                                              
                                                                                
ET0008**   PERFORM 3100-GET-TFR-INIT.                                           
ET0008     PERFORM 3102-OPEN-TRNFR-INIT.                                        
ET0008     PERFORM 3103-FETCH-TRNFR-INIT.                                       
ET0008     PERFORM 3104-CLOSE-TRNFR-INIT.                                       
           IF WS-TFR-INIT-FOUND                                                 
ET0008        PERFORM 3109-TRNF-INIT-TO-TWA                                     
              PERFORM 3110-OPEN-ASSET-INIT                                      
              IF WS-ASSET-INIT-FOUND                                            
                 INITIALIZE TS-INI-ASSET-AREA                                   
                 MOVE 0 TO SUB                                                  
                 MOVE SPACE TO WS-NO-MORE-DATA-SW                               
                 PERFORM 3600-SAVE-INI-ASSET-IN-TS THRU 3600-EXIT               
                     UNTIL WS-NO-MORE-DATA                                      
                 IF SUB > 0                                                     
                    PERFORM 7220-WRITE-INIT-ASSET-TSQ                           
                    ADD 1 TO TWA-MAX-PAGE-INI                                   
                 END-IF                                                         
              END-IF                                                            
              PERFORM 3130-CLOSE-ASSET-INIT                                     
           END-IF.                                                              
ET0008 2100-EXIT.    EXIT.                                                      
       EJECT                                                                    
ET0009*                                                                         
ET0009*-------------------------------------------------------------*           
ET0009* IS THERE ANY OTHER FRV IN INIT TRNFR TABLE FOR THIS ACCT?   *           
ET0009* IF SO, MOVE ITS ASSETS IN A FRV TABLE IN WORK STORAGE.      *           
ET0009* LATER, THE PROGRAM SEARCHES THIS TABLE TO DETERMINE IF      *           
ET0009* ASSET SHOULD BE SHOWN ON A SCREEN.                          *           
ET0009*-------------------------------------------------------------*           
ET0009 2120-CREATE-FRV-TABLE.                                                   
           MOVE +0    TO SUB3.                                                  
           MOVE SPACE TO WS-FRV-ASSET-TABLE.                                    
                                                                                
           PERFORM 2140-INIT-TRNFR-TO-FRV-TBL.                                  
           PERFORM 2160-ACTIVE-TRNFR-TO-FRV-TBL.                                
ET0009*                                                                         
ET0009*-------------------------------------------------------------*           
ET0009*   SEARCH INITIAL TRANSFER TABLE FOR FRV                     *           
ET0009*-------------------------------------------------------------*           
ET0009 2140-INIT-TRNFR-TO-FRV-TBL.                                              
           MOVE TWA-ACAT TO ACAT13-PASS-ACAT.                                   
           PERFORM 3200-OPEN-TRNFR-INIT-SRCH.                                   
                                                                                
           MOVE SPACE TO  WS-NO-MORE-TRNFR-SW.                                  
           PERFORM UNTIL WS-NO-MORE-TRNFR                                       
              PERFORM 3210-FETCH-TRNFR-INIT-SRCH                                
              IF WS-TFR-INIT-FOUND                                              
                 PERFORM 2145-SEARCH-INIT-ASSETS                                
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 3220-CLOSE-TRNFR-INIT-SRCH.                                  
       EJECT                                                                    
ET0009*                                                                         
ET0009*-------------------------------------------------------------*           
ET0009*    MOVE INIT ASSETS TO FRV ASSET TABLE IN WORKING STORAGE   *           
ET0009*-------------------------------------------------------------*           
ET0009 2145-SEARCH-INIT-ASSETS.                                                 
           MOVE ACAT13-TFR-ACAT     TO ACAT13-PASS-ADP-CONTROL.                 
           MOVE ACAT13-TFR-RCV      TO ACAT13-PASS-CON-BRKR.                    
           MOVE ACAT13-TFR-RCV-ACCT TO ACAT13-PASS-CON-ACCT.                    
           MOVE ACAT13-TFR-RFRN-ID  TO ACAT13-PASS-TRANS-RFRN-ID.               
           PERFORM 3240-OPEN-ASSET-INIT-SRCH.                                   
                                                                                
           MOVE SPACE TO WS-NO-MORE-ASSET-SW.                                   
           PERFORM UNTIL WS-NO-MORE-ASSET OR SUB3 > MAX-TBL                     
              PERFORM 3250-FETCH-ASSET-INIT-SRCH                                
              IF WS-ASSET-INIT-FOUND                                            
                 ADD +1 TO SUB3                                                 
                 IF SUB3 > MAX-TBL                                              
                    MOVE -1 TO MBRL                                             
                    MOVE ATT-UNPROT-BRT TO MBRA MACA                            
                    IF NOT WK-ERROR                                             
                       SET WK-ERROR TO TRUE                                     
                       MOVE 'FRV ASSET TBL EXCEEDING MAX TBL SIZE - CALL        
LRM012-                     ' HELP DESK TO INCREASE TBL SIZE'                   
                         TO  SYSTEM-MSG                                         
                    END-IF                                                      
                 ELSE                                                           
                    MOVE ACAT13-AST-SEC                                         
                      TO WS-FRV-ASSET-SECUR    (SUB3)                           
                    MOVE ACAT13-AST-ADP-NBR                                     
                      TO WS-FRV-ASSET-ADP-NBR  (SUB3)                           
                    MOVE ACAT13-AST-CS-MG-SH                                    
                      TO WS-FRV-ASSET-CS-MG-SH (SUB3)                           
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 3260-CLOSE-ASSET-INIT-SRCH.                                  
ET0009 EJECT                                                                    
ET0009*                                                                         
ET0009*--------------------------------------------------------------*          
ET0009* SEARCH ACTIVE TRANSFER TABLE FOR FRV                         *          
ET0009*--------------------------------------------------------------*          
ET0009 2160-ACTIVE-TRNFR-TO-FRV-TBL.                                            
           MOVE TWA-ACAT TO ACAT13-PASS-ACAT.                                   
           PERFORM 5530-OPEN-ACTIVE-TRNFR-CSR.                                  
                                                                                
           MOVE SPACE TO WS-NO-MORE-TRNFR-SW.                                   
           PERFORM UNTIL WS-NO-MORE-TRNFR                                       
              PERFORM 5540-FETCH-ACTIVE-TRNFR-CSR                               
              IF WS-TFR-FOUND                                                   
                 PERFORM 2165-SEARCH-ACTIVE-ASSETS                              
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 5550-CLOSE-ACTIVE-TRNFR-CSR.                                 
       EJECT                                                                    
ET0009*                                                                         
ET0009*-------------------------------------------------------------*           
ET0009*    MOVE ACTIVE ASSETS TO FRV ASSET TABLE IN WORK STORAGE    *           
ET0009*-------------------------------------------------------------*           
ET0009 2165-SEARCH-ACTIVE-ASSETS.                                               
           MOVE ACAT13-TFR-ACAT TO ACAT13-PASS-ACAT.                            
           PERFORM 5600-OPEN-ASSET-CURSOR.                                      
                                                                                
           MOVE SPACE TO WS-NO-MORE-ASSET-SW.                                   
           PERFORM UNTIL WS-NO-MORE-ASSET OR SUB3 > MAX-TBL                     
              PERFORM 5610-FETCH-ASSET-CURSOR                                   
              IF WS-NO-MORE-ASSET                                               
                 CONTINUE                                                       
              ELSE                                                              
                 ADD +1 TO SUB3                                                 
                 IF SUB3 > MAX-TBL                                              
                    MOVE -1 TO MBRL                                             
                    MOVE ATT-UNPROT-BRT TO MBRA MACA                            
                    IF NOT WK-ERROR                                             
                       SET WK-ERROR TO TRUE                                     
                       MOVE 'FRV ASSET TBL EXCEEDING MAX TBL SIZE - CALL        
      -                  ' HELP DESK TO INCREASE TBL SIZE'                      
                         TO  SYSTEM-MSG                                         
                    END-IF                                                      
                 ELSE                                                           
                    MOVE ACAT13-AST-SEC                                         
                      TO WS-FRV-ASSET-SECUR   (SUB3)                            
                    MOVE ACAT13-AST-ADP-NBR                                     
                      TO WS-FRV-ASSET-ADP-NBR (SUB3)                            
                    MOVE ACAT13-AST-CS-MG-SH                                    
                      TO WS-FRV-ASSET-CS-MG-SH (SUB3)                           
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 5620-CLOSE-ASSET-CURSOR.                                     
       EJECT                                                                    
      *                                                                         
      *-------------------------------------------------------------*           
      * PREPARE TO DISPLAY FRV DATA.                                *           
      *   TWA-TFR-NEW    = DISPLAY ACCT DATA FROM HISTORY TBL.      *           
      *                    ALLOW USER TO CREATE NEW FRV.            *           
      *   TWA-TFR-UPDATE = DISPLAY NEWLY CREATED FRV FROM INIT TBL. *           
      *                    ALLOW USER TO DELETE FRV FROM INIT TBL.  *           
      *-------------------------------------------------------------*           
       2200-SETUP-NEW.                                                          
ET0001     SET TWA-TFR-NEW TO TRUE.                                             
ET0008                                                                          
ET0008     IF NOT TWA-ADD-FRV                                                   
           IF WS-TFR-INIT-FOUND                                                 
              SET TWA-TFR-UPDATE TO TRUE                                        
              IF WS-ASSET-INIT-FOUND                                            
                 PERFORM 2300-FROM-TFR                                          
                 MOVE +1 TO TWA-PAGE-NUM                                        
                            WS-INI-ITEM                                         
                 PERFORM 2325-FROM-INIT-TS                                      
                 GO TO 2200-EXIT.                                               
                                                                                
ET0008     IF TWA-ADD-FRV                                                       
ET0008        MOVE SPACE TO TWA-ADD-FRV-SW                                      
ET0008     END-IF.                                                              
           IF WS-ASSET-HIST-FOUND                                               
              IF WS-FAIL-ASSET-FOUND                                            
ET0001**         SET TWA-TFR-NEW TO TRUE                                        
                 PERFORM 2300-FROM-TFR                                          
                 MOVE +1 TO TWA-PAGE-NUM                                        
                            WS-HST-ITEM                                         
                 PERFORM 2315-FROM-HIST-TS                                      
              ELSE                                                              
ET0001           PERFORM 2300-FROM-TFR                                          
                 MOVE 0 TO TWA-PAGE-NUM                                         
                 MOVE -1 TO MBRL                                                
                 SET WK-MSG-ON TO TRUE                                          
LRM013           IF WS-ACTIVE-FRV-ASSET-COUNT > 0                               
LRM013             MOVE 'ALL ELIGIBLE ASSETS FOUND ON ACTIVE TRANSFERS'         
LRM013              TO SYSTEM-MSG                                               
LRM013           ELSE                                                           
                  MOVE 'NO ASSETS FOUND FOR THE REQUESTED ACCOUNT'              
                   TO  SYSTEM-MSG                                               
LRM013           END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              MOVE 0 TO TWA-PAGE-NUM                                            
              MOVE -1 TO MBRL                                                   
              SET WK-MSG-ON TO TRUE                                             
LRM013        IF WS-ACTIVE-FRV-ASSET-COUNT > 0                                  
LRM013           MOVE 'ALL ELIGIBLE ASSETS FOUND ON ACTIVE TRANSFERS'           
LRM013            TO SYSTEM-MSG                                                 
LRM013        ELSE                                                              
                MOVE 'NO ASSETS FOUND FOR THE REQUESTED ACCOUNT'                
                  TO  SYSTEM-MSG                                                
LRM013        END-IF                                                            
           END-IF.                                                              
       2200-EXIT.                                           EXIT.               
       EJECT                                                                    
      *                                                                         
      *-----------------------------------------------------------*             
      *       SETUP SCREEN FROM HISTORY TRANSFER TABLE            *             
      *-----------------------------------------------------------*             
       2300-FROM-TFR.                                                           
ET0004     MOVE TWA-SRCH-TAG   TO SRCHTAGO.                                     
           MOVE TWA-MAP-BR     TO MBRO.                                         
           MOVE TWA-MAP-AC     TO MACO.                                         
           MOVE TWA-MAP-RR     TO MRRO.                                         
           MOVE TWA-MAP-CBRKR  TO MCBRKRO.                                      
           MOVE TWA-MAP-CACCT  TO MCACCTO.                                      
ET0001     MOVE TWA-MAP-TFR-TYPE TO MTRNFRO.                                    
                                                                                
           MOVE TWA-MAP-CBRKR  TO ACATPPIO-BRKR.                                
           SET ACATPPIO-READ TO TRUE.                                           
           PERFORM 7700-LINK-TO-ACATPPIO.                                       
           IF ACATPPIO-FOUND                                                    
              MOVE ACATPPIO-NAME TO MCBNAMO TWA-MAP-CBNAM                       
           ELSE                                                                 
              MOVE SPACE         TO MCBNAMO TWA-MAP-CBNAM.                      
                                                                                
           MOVE TWA-MAP-CTYPE  TO MCTYPEO.                                      
           MOVE TWA-MAP-SD     TO MSDO.                                         
           MOVE TWA-MAP-ACAT   TO MACATO.                                       
ET0008     IF TWA-TFR-UPDATE                                                    
ET0008        IF TWA-ADP-CONTROL-NBR > SPACE                                    
ET0008           MOVE TWA-ADP-CONTROL-NBR TO MACATO                             
ET0008        ELSE                                                              
ET0008           MOVE SPACE  TO MACATO                                          
ET0008        END-IF                                                            
ET0008     END-IF.                                                              
           MOVE TWA-MAP-NAME   TO MNAMEO.                                       
           MOVE TWA-MAP-NAME2  TO MNAME2O.                                      
           EVALUATE TWA-MAP-STAT                                        08505010
               WHEN '100'                                               08506010
                    MOVE '100-REQUEST'                                  08507010
                      TO  MSTATO                                        08507010
               WHEN '110'                                               08506010
                    MOVE '110-REQUEST ADJUST'                           08507010
                      TO  MSTATO                                        08507010
               WHEN '120'                                               08506010
                    MOVE '120-REQUEST ADJUST PAST'                      08507010
                      TO  MSTATO                                        08507010
               WHEN '130'                                               08506010
                    MOVE '130-REQUEST PAST'                             08507010
                      TO  MSTATO                                        08507010
               WHEN '140'                                               08506010
                    MOVE '140-REQUEST REJECT'                           08507010
                      TO  MSTATO                                        08507010
               WHEN '200'                                               08506010
                    MOVE '200-REVIEW'                                   08507010
                      TO  MSTATO                                        08507010
               WHEN '210'                                               08507110
                    MOVE '210-REVIEW ADJUST'                            08508010
                      TO  MSTATO                                        08507010
               WHEN '220'                                               08509010
                    MOVE '220-REVIEW ERROR'                             08509110
                      TO  MSTATO                                        08507010
               WHEN '230'                                               08509010
                    MOVE '230-REVIEW ACCELERATE'                        08509110
                      TO  MSTATO                                        08507010
               WHEN '300'                                               08509210
                    MOVE '300-SETTLE PREP'                              08509310
                      TO  MSTATO                                        08507010
               WHEN '310'                                               08509410
                    MOVE '310-SETTLE CLOSE'                             08509510
                      TO  MSTATO                                        08507010
               WHEN '400'                                               08509710
                    MOVE '400-CLOSE PURGE'                              08509810
                      TO  MSTATO                                        08507010
               WHEN '500'                                               08509910
                    MOVE '500-MEMO PARTIAL REQUEST'                     08510010
                      TO  MSTATO                                        08507010
               WHEN '510'                                               08510110
                    MOVE '510-MEMO PURGE PARTIAL REQUEST'               08510210
                      TO  MSTATO                                        08507010
               WHEN '600'                                               08510110
                    MOVE '600-REJECT'                                   08510210
                      TO  MSTATO                                        08507010
               WHEN OTHER                                               08510110
                    MOVE TWA-MAP-STAT                                   08510210
                      TO  MSTATO                                        08507010
           END-EVALUATE.                                                08510310
           MOVE TWA-MAP-SSN  TO MSSNO.                                          
           MOVE TWA-MAP-SSN2 TO MSSN2O.                                         
                                                                                
       EJECT                                                                    
      *                                                                         
      *-----------------------------------------------------------*             
      *       SETUP SCREEN FROM HISTORY ASSET TABLE               *             
      *-----------------------------------------------------------*             
       2315-FROM-HIST-TS.                                                       
           MOVE ATT-UNPROT  TO MSUBA.                                           
           MOVE ATT-ASKIP   TO MDELA.                                           
           PERFORM 7100-READ-HIST-ASSET-TSQ.                                    
           IF WK-TS-READ-OK                                                     
              PERFORM VARYING SUB FROM 1 BY 1                                   
                          UNTIL SUB > 2                                         
ET0005           IF TS-HST-QTY-ORIG (SUB) NOT = ZERO                            
                    IF TS-HST-RCLMED (SUB) = 'Y'                                
                    OR TWA-TFR-INQUIRY                                          
                        MOVE TS-HST-REASON (SUB)                                
                          TO MRSON-O (SUB) TWA-MAP-RSON (SUB)                   
                        MOVE TS-HST-RCLMED (SUB)                                
                          TO MRCLM-O (SUB) TWA-MAP-RCLM (SUB)                   
                                           TWA-MAP-RCLMED (SUB)                 
                    ELSE                                                        
                        MOVE SPACE                                              
                          TO TWA-MAP-RSON (SUB) TWA-MAP-RCLM (SUB)              
                    END-IF                                                      
ET0005              IF TS-HST-SECUR (SUB) > SPACE                               
ET0005                 MOVE TS-HST-SECUR (SUB)                                  
ET0005                      TO MSECR-O (SUB) TWA-MAP-SECR (SUB)                 
ET0005              ELSE                                                        
ET0005              IF TS-HST-ADP-NBR (SUB) > SPACE                             
ET0005                 MOVE TS-HST-ADP-NBR (SUB)                                
ET0005                      TO MSECR-O (SUB) TWA-MAP-ADP-NBR (SUB)              
ET0005              ELSE                                                        
ET0005                 MOVE SPACE TO MSECR-O (SUB) TWA-MAP-SECR    (SUB)        
ET0005                                             TWA-MAP-ADP-NBR (SUB)        
ET0005                 SET WK-MSG-ON TO TRUE                                    
ET0005                 MOVE NO-CUSIP-MESSAGE  TO SYSTEM-MSG                     
ET0005              END-IF                                                      
ET0005              END-IF                                                      
                    MOVE TS-HST-CTGRY    (SUB) TO MCATGR-O      (SUB)           
                                                  TWA-MAP-CATGR (SUB)           
                    MOVE TS-HST-STTL-LOC (SUB) TO MSLOC-O       (SUB)           
                                                  TWA-MAP-SLOC  (SUB)           
                    MOVE TS-HST-TYPE     (SUB) TO MTYPE-O       (SUB)           
                                                  TWA-MAP-TYPE  (SUB)           
                    MOVE TS-HST-DESC     (SUB) TO WS-DESC                       
                    MOVE WS-DESC1              TO MDESC1-O      (SUB)           
                                                  TWA-MAP-DESC1 (SUB)           
                    MOVE WS-DESC2              TO MDESC2-O      (SUB)           
                                                  TWA-MAP-DESC2 (SUB)           
ET0003              MOVE TS-HST-TAG      (SUB) TO MTAG-O        (SUB)           
ET0003                                            TWA-MAP-TAG   (SUB)           
                    IF TS-HST-PSTN-CD (SUB) = 'S'                               
                       MULTIPLY TS-HST-QTY-ORIG (SUB) BY -1                     
                                                  GIVING WS-QTY                 
                       MOVE WS-QTY       TO MQTY-O (SUB)                        
                       MOVE MQTY-I (SUB) TO TWA-MAP-QTY (SUB)                   
                    ELSE                                                        
                       MOVE TS-HST-QTY-ORIG (SUB) TO MQTY-O (SUB)               
                       MOVE MQTY-I (SUB) TO TWA-MAP-QTY (SUB)                   
                    END-IF                                                      
                    IF TS-HST-RCLMED (SUB) = 'Y'                                
                       MOVE ATT-ASKIP  TO MRSON-A (SUB) MRCLM-A (SUB)           
ET0003                                    MTAG-A  (SUB)                         
                    ELSE                                                        
                       MOVE ATT-UNPROT TO MRSON-A (SUB) MRCLM-A (SUB)           
ET0003                                    MTAG-A  (SUB)                         
                    END-IF                                                      
                 END-IF                                                         
              END-PERFORM                                                       
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *-----------------------------------------------------------*             
      *       SETUP SCREEN FROM INITIAL ASSET TABLE               *             
      *-----------------------------------------------------------*             
       2325-FROM-INIT-TS.                                                       
           MOVE ATT-ASKIP   TO MSUBA.                                           
           MOVE ATT-UNPROT  TO MDELA.                                           
ET0006     IF TWA-NSCC-PEND-CD-IS-Y                                             
ET0006        MOVE ATT-ASKIP  TO MDELA                                          
ET0006        SET WK-MSG-ON TO TRUE                                             
ET0006        MOVE 'RECORD TRANSMISSION TO NSCC IS IN PROGRESS - NO DELE        
ET0006-            'TION ALLOWED'                                               
ET0006          TO  SYSTEM-MSG                                                  
ET0006     END-IF.                                                              
           PERFORM 7200-READ-INIT-ASSET-TSQ.                                    
           IF WK-TS-READ-OK                                                     
              PERFORM VARYING SUB FROM 1 BY 1                                   
                                  UNTIL SUB > 2                                 
ET0005           IF TS-INI-QTY-RCLM (SUB) NOT = ZERO                            
                    MOVE TS-INI-REASON   (SUB) TO MRSON-O       (SUB)           
                                                  TWA-MAP-RSON  (SUB)           
                    MOVE TS-INI-RCLM-IND (SUB) TO MRCLM-O       (SUB)           
                                                  TWA-MAP-RCLM  (SUB)           
ET0005              IF TS-INI-SECUR (SUB) > SPACE                               
ET0005                 MOVE TS-INI-SECUR (SUB)                                  
ET0005                      TO MSECR-O (SUB) TWA-MAP-SECR (SUB)                 
ET0005              ELSE                                                        
ET0005              IF TS-INI-ADP-NBR (SUB) > SPACE                             
ET0005                 MOVE TS-INI-ADP-NBR (SUB)                                
ET0005                      TO MSECR-O (SUB) TWA-MAP-ADP-NBR (SUB)              
ET0005              ELSE                                                        
ET0005                 MOVE SPACE TO MSECR-O (SUB) TWA-MAP-SECR    (SUB)        
ET0005                                             TWA-MAP-ADP-NBR (SUB)        
ET0005                 SET WK-MSG-ON TO TRUE                                    
ET0005                 MOVE NO-CUSIP-MESSAGE  TO SYSTEM-MSG                     
ET0005              END-IF                                                      
ET0005              END-IF                                                      
                    MOVE TS-INI-CTGRY    (SUB) TO MCATGR-O      (SUB)           
                                                  TWA-MAP-CATGR (SUB)           
                    MOVE TS-INI-STTL-LOC (SUB) TO MSLOC-O       (SUB)           
                                                  TWA-MAP-SLOC  (SUB)           
                    MOVE TS-INI-TYPE     (SUB) TO MTYPE-O       (SUB)           
                                                  TWA-MAP-TYPE  (SUB)           
                    MOVE TS-INI-DESC     (SUB) TO WS-DESC                       
                    MOVE WS-DESC1              TO MDESC1-O      (SUB)           
                                                  TWA-MAP-DESC1 (SUB)           
                    MOVE WS-DESC2              TO MDESC2-O      (SUB)           
                                                  TWA-MAP-DESC2 (SUB)           
ET0003              MOVE TS-INI-TAG      (SUB) TO MTAG-O        (SUB)           
ET0003                                            TWA-MAP-TAG   (SUB)           
                    IF TS-INI-PSTN-CD (SUB) = 'S'                               
                       MULTIPLY TS-INI-QTY-RCLM (SUB) BY -1                     
                                                  GIVING WS-QTY                 
                       MOVE WS-QTY       TO MQTY-O (SUB)                        
                       MOVE MQTY-I (SUB) TO TWA-MAP-QTY (SUB)                   
                    ELSE                                                        
                       MOVE TS-INI-QTY-RCLM (SUB) TO MQTY-O (SUB)               
                       MOVE MQTY-I (SUB) TO TWA-MAP-QTY (SUB)                   
                    END-IF                                                      
                 END-IF                                                         
              END-PERFORM                                                       
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *-----------------------------------------------------------*             
      *       CHECK SIGNON SECURITY                               *             
      *-----------------------------------------------------------*             
       2500-BR-AE-SECURITY.                                             04772510
           INITIALIZE ACAT-SRCH-COMM-AREA.                                      
           SET SECURITY-LOOKUP      TO TRUE.                                    
           MOVE WS-BRANCH           TO SRCH-INP-BRANCH.                 04597609
           MOVE TWA-MAP-RR          TO SRCH-INP-RR.                     04597609
           EXEC CICS LINK                                                       
                     PROGRAM('ACATSRCH')                                        
                     COMMAREA(ACAT-SRCH-COMM-AREA)                              
                     LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)                      
           END-EXEC.                                                            
                                                                        04785107
       EJECT                                                            04777303
                                                                        04777403
      *                                                                         
      *-----------------------------------------------------------*             
      *    CHECK SECURITY BEFORE JUMPING TO NEXT SCREEN           *             
      *-----------------------------------------------------------*             
       2600-SCREEN-SECURITY-CHECK.                                              
           IF  ACAT-SUPER-SIGN-ON-UPDATE                                        
                OR                                                              
               ACAT-SUPER-SIGN-ON-BROWSE                                        
                OR                                                              
               ACAT-JUMP-ANYWHERE                                               
                OR                                                              
               ACAT-NEXT = '$'                                                  
                CONTINUE                                                        
           ELSE                                                                 
               MOVE TWA-MAP-NEXT TO ACAT-SCREEN-IND                             
               SET ACAT-UPDATE-MODE TO TRUE                                     
               MOVE SPACES    TO SECLINK-LIST                           AEISAC07
               MOVE '2'       TO SECLINK-ACTION-CODE                    AEISAC07
               MOVE 'SCON'    TO SECLINK-TYPE                                   
               MOVE ACAT-SEC-LIT TO SECLINK-ITEM                                
               PERFORM CALL-SECLINK-RTN                                 AEISAC07
               IF SECLINK-RETURN-CODE = '00' OR '20'                    AEISAC07
                  SET ACAT-SIGN-ON-UPDATE TO TRUE                               
                  MOVE SECLINK-USER-ID TO ACAT-SIGN-ON-ID                       
               ELSE                                                             
                  SET ACAT-BROWSE-MODE TO TRUE                                  
                  MOVE SPACES    TO SECLINK-LIST                        AEISAC07
                  MOVE '2'       TO SECLINK-ACTION-CODE                 AEISAC07
                  MOVE 'SCON'    TO SECLINK-TYPE                                
                  MOVE ACAT-SEC-LIT TO SECLINK-ITEM                             
                  PERFORM CALL-SECLINK-RTN                              AEISAC07
                  IF SECLINK-RETURN-CODE = '00' OR '20'                 AEISAC07
                     MOVE SPACE TO ACAT-SIGN-ON-SEC-FLAG                        
                  ELSE                                                          
                     MOVE -1              TO MNEXTL                             
                     MOVE ATT-UNPROT-BRT  TO MNEXTA                             
                     MOVE 'L' TO ACAT-INP-SEL                                   
                     IF NOT WK-ERROR                                    AEISAC07
                        MOVE 'USER NOT AUTHORIZED TO USE NEXT SELECTION'AEISAC07
                          TO SYSTEM-MSG                                 AEISAC07
                        MOVE TWA-MAP-NEXT                               AEISAC07
                          TO SYSTEM-MSG(44 : 1)                         AEISAC07
                        SET WK-ERROR  TO TRUE                                   
                     END-IF                                             AEISAC07
                     PERFORM 9000-ERROR-RTN                                     
                  END-IF                                                        
               END-IF                                                           
           END-IF.                                                              
      *                                                                         
      *                                                                         
       CALL-SECLINK-RTN.                                                AEISAC07
           EXEC CICS LINK PROGRAM ('SECLINK')                           AEISAC07
                COMMAREA(SECLINK-LIST)                                          
                LENGTH(LENGTH OF SECLINK-LIST)                          AEISAC07
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*        OPEN HISTORY TRANSFER CURSOR TABLE                     *         
ET0001*---------------------------------------------------------------*         
ET0001 2900-OPEN-TRNFR-HIST.                                                    
           INITIALIZE ACAT13-RET-VALUES.                                        
           SET ACAT13-OPN-TFRHST  TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
                                                                                
           IF ACAT13-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012        'DB2 OPEN ERROR ON TRN HIST CURSOR TABLE - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*           FETCH HISTORY TRANSFER CURSOR TABLE                 *         
ET0001*---------------------------------------------------------------*         
ET0001 2910-FETCH-TRNFR-HIST.                                                   
           MOVE SPACE TO WS-NO-MORE-DATA-SW                                     
                         WS-TFR-HIST-FOUND-SW.                                  
           INITIALIZE ACAT13-RET-VALUES                                         
                      ACAT13-TRANSFER.                                          
           SET ACAT13-FET-TFRHST TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-NORMAL                                                     
              SET WS-TFR-HIST-FOUND TO TRUE                                     
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012       'DB2 FETCH ERROR ON TRN HIST CURSOR TABLE - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*           CLOSE HISTORY TRANSFER CURSOR TABLE                 *         
ET0001*---------------------------------------------------------------*         
ET0001 2920-CLOSE-TRNFR-HIST.                                                   
           INITIALIZE ACAT13-RET-VALUES.                                        
           SET  ACAT13-CLO-TFRHST  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012       'DB2 CLOSE ERROR ON TRN HIST CURSOR TABLE - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*     OPEN HISTORY TRANSFER CURSOR TABLE IN DESCENDING ORDER    *         
ET0001*---------------------------------------------------------------*         
       2940-OPEN-TRNFR-HIST-DESC.                                               
           INITIALIZE ACAT13-RET-VALUES.                                        
           SET ACAT13-OPN-TFRHST-DESC  TO TRUE.                                 
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
                                                                                
           IF ACAT13-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 OPEN ERROR ON TRN HIST CURSR TBL DESCEND'               
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*    FETCH HISTORY TRANSFER CURSOR TABLE IN DESCENDING ORDER    *         
ET0001*---------------------------------------------------------------*         
       2950-FETCH-TRNFR-HIST-DESC.                                              
           MOVE SPACE TO WS-TFR-HIST-FOUND-SW                                   
                         WS-NO-MORE-DATA-SW.                                    
           INITIALIZE ACAT13-RET-VALUES                                         
                      ACAT13-TRANSFER.                                          
           SET ACAT13-FET-TFRHST-DESC TO TRUE.                                  
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-NORMAL                                                     
              SET WS-TFR-HIST-FOUND TO TRUE                                     
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 FETCH ERROR ON TRN HIST DESCEND CURSOR TABLE'           
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*    CLOSE HISTORY TRANSFER CURSOR TABLE IN DESCENDING ORDER    *         
ET0001*---------------------------------------------------------------*         
       2960-CLOSE-TRNFR-HIST-DESC.                                              
           INITIALIZE ACAT13-RET-VALUES.                                        
           SET  ACAT13-CLO-TFRHST-DESC  TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 CLOSE ERROR ON TRN HIST DESCEND CURSOR TABLE'           
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*         MOVE TRANSFER HISTORY DATA TO TWA AREA.               *         
ET0001*---------------------------------------------------------------*         
ET0001 2970-TRNF-HIST-TO-TWA.                                                   
           MOVE SPACE                  TO TWA-MAP-AREA.                         
           MOVE ACAT13-TFR-DLVR-ACCT   TO TWA-DLVR-ACCT.                        
           MOVE TWA-DLVR-ACCT          TO WS-DLVR-ACCT.                         
           MOVE WS-BRANCH              TO TWA-MAP-BR.                           
           MOVE WS-ACCT                TO TWA-MAP-AC.                           
           MOVE ACAT13-TFR-RCV         TO TWA-MAP-CBRKR.                        
           MOVE ACAT13-TFR-RCV-ACCT    TO TWA-MAP-CACCT.                        
ET0001     MOVE ACAT13-TFR-TYPE        TO TWA-MAP-TFR-TYPE.                     
           MOVE ACAT13-TFR-ACAT        TO TWA-MAP-ACAT                          
                                          TWA-ACAT.                             
           MOVE ACAT13-TFR-STTS        TO TWA-MAP-STAT.                         
           MOVE ACAT13-TFR-ACCT-TYPE   TO TWA-MAP-CTYPE.                        
           MOVE ACAT13-TFR-RR          TO TWA-MAP-RR.                           
ET0007**   MOVE ACAT13-TFR-CMNTS       TO TWA-MAP-ACT-CMNTS.                    
                                                                                
           IF ACAT13-TFR-STTL-DT > SPACE                                        
              MOVE ACAT13-TFR-STTL-DT  TO WS-DB2-FORM-DATE                      
              MOVE WS-DATE-YY          TO WS-EDITED-YY                          
              MOVE WS-DATE-MM          TO WS-EDITED-MM                          
              MOVE WS-DATE-DD          TO WS-EDITED-DD                          
              MOVE WS-EDITED-DATE      TO TWA-MAP-SD                            
           ELSE                                                                 
              MOVE SPACE               TO TWA-MAP-SD                            
           END-IF.                                                              
                                                                                
           MOVE ACAT13-TFR-NM1         TO TWA-MAP-NAME.                         
           MOVE ACAT13-TFR-NM2         TO TWA-MAP-NAME2.                        
                                                                                
           IF ACAT13-TFR-SS1 = SPACE                                            
              MOVE SPACE               TO TWA-MAP-SSN                           
           ELSE                                                                 
              MOVE ACAT13-TFR-SS1(1:3) TO WS-SS-NUM1                            
              MOVE ACAT13-TFR-SS1(4:2) TO WS-SS-NUM2                            
              MOVE ACAT13-TFR-SS1(6:4) TO WS-SS-NUM3                            
              MOVE WS-SS-NUM           TO TWA-MAP-SSN                           
           END-IF.                                                              
                                                                                
           IF ACAT13-TFR-SS2 = SPACE                                            
              MOVE SPACE               TO TWA-MAP-SSN2                          
           ELSE                                                                 
              MOVE ACAT13-TFR-SS2(1:3) TO WS-SS-NUM1                            
              MOVE ACAT13-TFR-SS2(4:2) TO WS-SS-NUM2                            
              MOVE ACAT13-TFR-SS2(6:4) TO WS-SS-NUM3                            
              MOVE WS-SS-NUM           TO TWA-MAP-SSN2                          
           END-IF.                                                              
      *                                                                         
      *---------------------------------------------------------------*         
      *           READ HISTORY TRANSFER TABLE                         *         
      *---------------------------------------------------------------*         
       3000-GET-TFR-HIST.                                                       
           MOVE SPACE TO WS-TFR-HIST-FOUND-SW.                                  
           INITIALIZE ACAT13-RET-VALUES                                         
                      ACAT13-TRANSFER.                                          
           MOVE TWA-ACAT   TO ACAT13-PASS-ACAT.                                 
ET0004     IF WS-SEARCH-BY-TAG                                                  
ET0004        MOVE ACAT-CAGE-CONTROL-NBR  TO ACAT13-PASS-ACAT                   
ET0004     END-IF.                                                              
           SET ACAT13-GET-TFRHST  TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-NORMAL                                                     
              SET WS-TFR-HIST-FOUND TO TRUE                                     
              MOVE SPACE                TO TWA-MAP-AREA                         
              MOVE ACAT13-TFR-DLVR-ACCT TO TWA-DLVR-ACCT                        
              MOVE TWA-DLVR-ACCT        TO WS-DLVR-ACCT                         
              MOVE WS-BRANCH            TO TWA-MAP-BR                           
              MOVE WS-ACCT              TO TWA-MAP-AC                           
              MOVE ACAT13-TFR-RCV       TO TWA-MAP-CBRKR                        
              MOVE ACAT13-TFR-RCV-ACCT  TO TWA-MAP-CACCT                        
ET0001        MOVE ACAT13-TFR-TYPE      TO TWA-MAP-TFR-TYPE                     
              MOVE ACAT13-TFR-ACAT      TO TWA-MAP-ACAT                         
                                           TWA-ACAT                             
              MOVE ACAT13-TFR-STTS      TO TWA-MAP-STAT                         
              MOVE ACAT13-TFR-ACCT-TYPE TO TWA-MAP-CTYPE                        
              MOVE ACAT13-TFR-RR        TO TWA-MAP-RR                           
              MOVE ACAT13-TFR-CMNTS     TO TWA-MAP-ACT-CMNTS                    
              IF ACAT13-TFR-STTL-DT > SPACE                                     
                 MOVE ACAT13-TFR-STTL-DT  TO WS-DB2-FORM-DATE                   
                 MOVE WS-DATE-YY        TO WS-EDITED-YY                         
                 MOVE WS-DATE-MM        TO WS-EDITED-MM                         
                 MOVE WS-DATE-DD        TO WS-EDITED-DD                         
                 MOVE WS-EDITED-DATE    TO TWA-MAP-SD                           
              ELSE                                                              
                 MOVE SPACE             TO TWA-MAP-SD                           
              END-IF                                                            
              MOVE ACAT13-TFR-NM1       TO TWA-MAP-NAME                         
              MOVE ACAT13-TFR-NM2       TO TWA-MAP-NAME2                        
              IF ACAT13-TFR-SS1 = SPACE                                         
                 MOVE SPACE             TO TWA-MAP-SSN                          
              ELSE                                                              
                 MOVE ACAT13-TFR-SS1(1:3) TO WS-SS-NUM1                         
                 MOVE ACAT13-TFR-SS1(4:2) TO WS-SS-NUM2                         
                 MOVE ACAT13-TFR-SS1(6:4) TO WS-SS-NUM3                         
                 MOVE WS-SS-NUM           TO TWA-MAP-SSN                        
              END-IF                                                            
              IF ACAT13-TFR-SS2 = SPACE                                         
                 MOVE SPACE             TO TWA-MAP-SSN2                         
              ELSE                                                              
                 MOVE ACAT13-TFR-SS2(1:3) TO WS-SS-NUM1                         
                 MOVE ACAT13-TFR-SS2(4:2) TO WS-SS-NUM2                         
                 MOVE ACAT13-TFR-SS2(6:4) TO WS-SS-NUM3                         
                 MOVE WS-SS-NUM           TO TWA-MAP-SSN2                       
              END-IF                                                            
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              CONTINUE                                                          
ET0003**   ELSE                                                                 
ET0003**   IF ACAT13-SQLCODE = -811                                             
ET0003**      MOVE -1 TO MBRL                                                   
ET0003**      SET WK-ERROR TO TRUE                                              
ET0003**      MOVE 'MULTIPLE FULL TRNASFERS FOUND FOR THE REQUESTED ACCT        
ET0003**           ' - REVERSAL DENIED'                                         
ET0003**        TO  SYSTEM-MSG                                                  
ET0003**      PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012        'DB2 READ ERROR ON HIST TRANSFER TABLE - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
      *---------------------------------------------------------------*         
      *           OPEN HISTORY ASSET CURSOR TABLE                     *         
      *---------------------------------------------------------------*         
       3010-OPEN-ASSET-HIST.                                                    
           MOVE SPACE TO WS-ASSET-HIST-FOUND-SW.                                
           MOVE TWA-ACAT     TO ACAT13-PASS-ACAT.                               
           INITIALIZE ACAT13-RET-VALUES.                                        
           SET  ACAT13-OPN-ASTHST  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-NORMAL                                                     
              SET WS-ASSET-HIST-FOUND TO TRUE                                   
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012          'DB2 OPEN ERROR ON HIST ASSET TABLE - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
      *---------------------------------------------------------------*         
      *           FETCH HISTORY ASSET CURSOR TABLE                    *         
      *---------------------------------------------------------------*         
       3020-FETCH-ASSET-HIST.                                                   
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           INITIALIZE ACAT13-RET-VALUES                                         
                      ACAT13-ASSET.                                             
           SET ACAT13-FET-ASTHST TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012          'DB2 FETCH ERROR ON HIST ASSET TABLE - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
      *---------------------------------------------------------------*         
      *           CLOSE HISTORY ASSET CURSOR TABLE                    *         
      *---------------------------------------------------------------*         
       3030-CLOSE-ASSET-HIST.                                                   
           INITIALIZE ACAT13-RET-VALUES.                                        
           SET  ACAT13-CLO-ASTHST  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012         'DB2 CLOSE ERROR ON HIST ASSET TABLE - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           READ INITIAL TRANSFER TABLE                         *         
      *---------------------------------------------------------------*         
       3100-GET-TFR-INIT.                                                       
           MOVE SPACE TO WS-TFR-INIT-FOUND-SW.                                  
ET0006**   MOVE SPACE TO WS-NSCC-PEND-CD-IS-Y-SW.                               
           INITIALIZE ACAT13-RET-VALUES                                         
                      ACAT13-TRANSFER.                                          
           SET  ACAT13-GET-TFRINI  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-NORMAL                                                     
ET0001        IF ACAT13-TFR-NSCC-PEND = 'Y'                                     
ET0006           SET TWA-NSCC-PEND-CD-IS-Y TO TRUE                              
ET0006        ELSE                                                              
ET0006           MOVE SPACE TO TWA-NSCC-PEND-CD-IS-Y-SW                         
ET0001        END-IF                                                            
              SET  WS-TFR-INIT-FOUND    TO TRUE                                 
              MOVE SPACE                TO TWA-MAP-AREA                         
              MOVE ACAT13-TFR-DLVR-ACCT TO WS-DLVR-ACCT                         
              MOVE WS-BRANCH            TO TWA-MAP-BR                           
              MOVE WS-ACCT              TO TWA-MAP-AC                           
              MOVE ACAT13-TFR-RCV       TO TWA-MAP-CBRKR                        
              MOVE ACAT13-TFR-RCV-ACCT  TO TWA-MAP-CACCT                        
ET0001        MOVE ACAT13-TFR-TYPE      TO TWA-MAP-TFR-TYPE                     
              MOVE ACAT13-TFR-STTS      TO TWA-MAP-STAT                         
              MOVE ACAT13-TFR-ACCT-TYPE TO TWA-MAP-CTYPE                        
              MOVE ACAT13-TFR-ACAT-ASTD TO TWA-ACAT                             
              MOVE ACAT13-TFR-RR        TO TWA-MAP-RR                           
              MOVE ACAT13-TFR-CMNTS     TO TWA-MAP-ACT-CMNTS                    
              IF ACAT13-TFR-STTL-DT > SPACE                                     
                 MOVE ACAT13-TFR-STTL-DT  TO WS-DB2-FORM-DATE                   
                 MOVE WS-DATE-YY        TO WS-EDITED-YY                         
                 MOVE WS-DATE-MM        TO WS-EDITED-MM                         
                 MOVE WS-DATE-DD        TO WS-EDITED-DD                         
                 MOVE WS-EDITED-DATE    TO TWA-MAP-SD                           
              ELSE                                                              
                 MOVE SPACE             TO TWA-MAP-SD                           
              END-IF                                                            
              MOVE ACAT13-TFR-NM1       TO TWA-MAP-NAME                         
              MOVE ACAT13-TFR-NM2       TO TWA-MAP-NAME2                        
              IF ACAT13-TFR-SS1 = SPACE                                         
                 MOVE SPACE             TO TWA-MAP-SSN                          
              ELSE                                                              
                 MOVE ACAT13-TFR-SS1(1:3) TO WS-SS-NUM1                         
                 MOVE ACAT13-TFR-SS1(4:2) TO WS-SS-NUM2                         
                 MOVE ACAT13-TFR-SS1(6:4) TO WS-SS-NUM3                         
                 MOVE WS-SS-NUM           TO TWA-MAP-SSN                        
              END-IF                                                            
              IF ACAT13-TFR-SS2 = SPACE                                         
                 MOVE SPACE             TO TWA-MAP-SSN2                         
              ELSE                                                              
                 MOVE ACAT13-TFR-SS2(1:3) TO WS-SS-NUM1                         
                 MOVE ACAT13-TFR-SS2(4:2) TO WS-SS-NUM2                         
                 MOVE ACAT13-TFR-SS2(6:4) TO WS-SS-NUM3                         
                 MOVE WS-SS-NUM           TO TWA-MAP-SSN2                       
              END-IF                                                            
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012         'DB2 READ ERROR ON INIT TRANSFER TABLE - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*            OPEN INITIAL TRANSFER CURSOR TABLE                 *         
ET0008*---------------------------------------------------------------*         
ET0008 3102-OPEN-TRNFR-INIT.                                                    
           INITIALIZE ACAT13-RET-VALUES.                                        
           SET ACAT13-OPN-TFRINI  TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
                                                                                
           IF ACAT13-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012        'DB2 OPEN ERROR ON TRN INIT CURSOR TABLE - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*           FETCH INITIAL TRANSFER CURSOR TABLE                 *         
ET0008*---------------------------------------------------------------*         
ET0008 3103-FETCH-TRNFR-INIT.                                                   
           MOVE SPACE TO WS-NO-MORE-DATA-SW                                     
                         WS-TFR-INIT-FOUND-SW.                                  
           INITIALIZE ACAT13-RET-VALUES                                         
                      ACAT13-TRANSFER.                                          
           SET ACAT13-FET-TFRINI TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-NORMAL                                                     
              SET WS-TFR-INIT-FOUND  TO TRUE                                    
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012       'DB2 FETCH ERROR ON TRN INIT CURSOR TABLE - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*           CLOSE INITIAL TRANSFER CURSOR TABLE                 *         
ET0008*---------------------------------------------------------------*         
ET0008 3104-CLOSE-TRNFR-INIT.                                                   
           INITIALIZE ACAT13-RET-VALUES.                                        
           SET  ACAT13-CLO-TFRINI  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012       'DB2 CLOSE ERROR ON TRF INIT CURSOR TABLE - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*     OPEN INITIAL TRANSFER CURSOR TABLE IN DESCENDING ORDER    *         
ET0008*---------------------------------------------------------------*         
       3105-OPEN-TRNFR-INIT-DESC.                                               
           INITIALIZE ACAT13-RET-VALUES.                                        
           SET ACAT13-OPN-TFRINI-DESC  TO TRUE.                                 
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
                                                                                
           IF ACAT13-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 OPEN ERROR ON TRF INIT CURSOR TBL DESCEND'              
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*    FETCH INITIAL TRANSFER CURSOR TABLE IN DESCENDING ORDER    *         
ET0008*---------------------------------------------------------------*         
       3106-FETCH-TRNFR-INIT-DESC.                                              
           MOVE SPACE TO WS-TFR-INIT-FOUND-SW                                   
                         WS-NO-MORE-DATA-SW.                                    
           INITIALIZE ACAT13-RET-VALUES                                         
                      ACAT13-TRANSFER.                                          
           SET ACAT13-FET-TFRINI-DESC TO TRUE.                                  
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-NORMAL                                                     
              SET WS-TFR-INIT-FOUND  TO TRUE                                    
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 FETCH ERROR ON TRF INIT DESCEND CURSOR TABLE'           
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*    CLOSE INITIAL TRANSFER CURSOR TABLE IN DESCENDING ORDER    *         
ET0008*---------------------------------------------------------------*         
       3107-CLOSE-TRNFR-INIT-DESC.                                              
           INITIALIZE ACAT13-RET-VALUES.                                        
           SET  ACAT13-CLO-TFRINI-DESC  TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 CLOSE ERROR ON TRN INIT DESCEND CURSOR TABLE'           
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*         MOVE INITIAL TRANSFER DATA TO TWA AREA.               *         
ET0008*---------------------------------------------------------------*         
ET0008 3109-TRNF-INIT-TO-TWA.                                                   
           IF ACAT13-TFR-NSCC-PEND = 'Y'                                        
              SET TWA-NSCC-PEND-CD-IS-Y TO TRUE                                 
           ELSE                                                                 
              MOVE SPACE TO TWA-NSCC-PEND-CD-IS-Y-SW                            
           END-IF.                                                              
           SET  WS-TFR-INIT-FOUND    TO TRUE.                                   
           MOVE SPACE                TO TWA-MAP-AREA.                           
ET0010**   MOVE ACAT13-TFR-DLVR-ACCT TO WS-DLVR-ACCT.                           
ET0010     MOVE ACAT13-TFR-DLVR-ACCT TO TWA-DLVR-ACCT.                          
ET0010     MOVE TWA-DLVR-ACCT        TO WS-DLVR-ACCT.                           
           MOVE WS-BRANCH            TO TWA-MAP-BR.                             
           MOVE WS-ACCT              TO TWA-MAP-AC.                             
           MOVE ACAT13-TFR-RCV       TO TWA-MAP-CBRKR.                          
           MOVE ACAT13-TFR-RCV-ACCT  TO TWA-MAP-CACCT.                          
           MOVE ACAT13-TFR-TYPE      TO TWA-MAP-TFR-TYPE.                       
           MOVE ACAT13-TFR-STTS      TO TWA-MAP-STAT.                           
           MOVE ACAT13-TFR-ACCT-TYPE TO TWA-MAP-CTYPE.                          
           MOVE ACAT13-TFR-ACAT-ASTD TO TWA-ACAT.                               
           MOVE ACAT13-TFR-RR        TO TWA-MAP-RR.                             
           MOVE ACAT13-TFR-CMNTS     TO TWA-MAP-ACT-CMNTS.                      
           IF ACAT13-TFR-STTL-DT > SPACE                                        
              MOVE ACAT13-TFR-STTL-DT  TO WS-DB2-FORM-DATE                      
              MOVE WS-DATE-YY        TO WS-EDITED-YY                            
              MOVE WS-DATE-MM        TO WS-EDITED-MM                            
              MOVE WS-DATE-DD        TO WS-EDITED-DD                            
              MOVE WS-EDITED-DATE    TO TWA-MAP-SD                              
           ELSE                                                                 
              MOVE SPACE             TO TWA-MAP-SD                              
           END-IF.                                                              
           MOVE ACAT13-TFR-NM1       TO TWA-MAP-NAME.                           
           MOVE ACAT13-TFR-NM2       TO TWA-MAP-NAME2.                          
           IF ACAT13-TFR-SS1 = SPACE                                            
              MOVE SPACE             TO TWA-MAP-SSN                             
           ELSE                                                                 
              MOVE ACAT13-TFR-SS1(1:3) TO WS-SS-NUM1                            
              MOVE ACAT13-TFR-SS1(4:2) TO WS-SS-NUM2                            
              MOVE ACAT13-TFR-SS1(6:4) TO WS-SS-NUM3                            
              MOVE WS-SS-NUM           TO TWA-MAP-SSN                           
           END-IF.                                                              
           IF ACAT13-TFR-SS2 = SPACE                                            
              MOVE SPACE             TO TWA-MAP-SSN2                            
           ELSE                                                                 
              MOVE ACAT13-TFR-SS2(1:3) TO WS-SS-NUM1                            
              MOVE ACAT13-TFR-SS2(4:2) TO WS-SS-NUM2                            
              MOVE ACAT13-TFR-SS2(6:4) TO WS-SS-NUM3                            
              MOVE WS-SS-NUM           TO TWA-MAP-SSN2                          
           END-IF.                                                              
           MOVE ACAT13-TFR-ACAT      TO TWA-ADP-CONTROL-NBR.                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           OPEN INITIAL ASSET CUROSOR TABLE                    *         
      *---------------------------------------------------------------*         
       3110-OPEN-ASSET-INIT.                                                    
           MOVE SPACE TO WS-ASSET-INIT-FOUND-SW.                                
           INITIALIZE ACAT13-RET-VALUES.                                        
ET0001     MOVE TWA-DLVR-ACCT TO ACAT13-PASS-ACCT-DLV.                          
ET0008     MOVE TWA-MAP-CACCT       TO ACAT13-PASS-CON-ACCT.                    
ET0008     MOVE TWA-ADP-CONTROL-NBR TO ACAT13-PASS-ADP-CONTROL.                 
           SET  ACAT13-OPN-ASTINI  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-NORMAL                                                     
              SET WS-ASSET-INIT-FOUND TO TRUE                                   
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012        'DB2 OPEN ERROR ON INIT ASSET TABLE - CALL HELP DESK'             
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
      *---------------------------------------------------------------*         
      *          FETCH INITIAL ASSET CUROSOR TABLE                    *         
      *---------------------------------------------------------------*         
       3120-FETCH-ASSET-INIT.                                                   
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           INITIALIZE ACAT13-RET-VALUES                                         
                      ACAT13-ASSET.                                             
           SET  ACAT13-FET-ASTINI  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012          'DB2 FETCH ERROR ON INIT ASSET TABLE - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
      *---------------------------------------------------------------*         
      *          CLOSE INITIAL ASSET CUROSOR TABLE                    *         
      *---------------------------------------------------------------*         
       3130-CLOSE-ASSET-INIT.                                                   
           INITIALIZE ACAT13-RET-VALUES.                                        
           SET  ACAT13-CLO-ASTINI  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012          'DB2 CLOSE ERROR ON INIT ASSET TABLE - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0009*                                                                         
ET0009*---------------------------------------------------------------*         
ET0009*    OPEN INITIAL TRNFR CUROSOR TABLE TO SEARCH ALL FRV ASSETS  *         
ET0009*---------------------------------------------------------------*         
ET0009 3200-OPEN-TRNFR-INIT-SRCH.                                               
           SET ACAT13-OPN-TFRINI2 TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
                                                                                
           IF ACAT13-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012       'DB2 OPEN ERROR ON TRN INIT2 CURSOR TABLE - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
ET0009*                                                                         
ET0009*---------------------------------------------------------------*         
ET0009*   FETCH INITIAL TRNFR CUROSOR TABLE TO SEARCH ALL FRV ASSETS  *         
ET0009*---------------------------------------------------------------*         
ET0009 3210-FETCH-TRNFR-INIT-SRCH.                                              
           MOVE SPACE TO WS-TFR-INIT-FOUND-SW.                                  
           INITIALIZE ACAT13-RET-VALUES                                         
                      ACAT13-TRANSFER.                                          
           SET ACAT13-FET-TFRINI2   TO TRUE.                                    
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
                                                                                
           IF ACAT13-NORMAL                                                     
              SET WS-TFR-INIT-FOUND TO TRUE                                     
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              SET WS-NO-MORE-TRNFR TO TRUE                                      
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 FETCH ERROR ON TRF INIT2 CURSOR TABLE'                  
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
ET0009*                                                                         
ET0009*---------------------------------------------------------------*         
ET0009*   CLOSH INITIAL TRNFR CUROSOR TABLE TO SEARCH ALL FRV ASSETS  *         
ET0009*---------------------------------------------------------------*         
ET0009 3220-CLOSE-TRNFR-INIT-SRCH.                                              
           INITIALIZE ACAT13-RET-VALUES.                                        
           SET  ACAT13-CLO-TFRINI2   TO TRUE.                                   
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 CLOSE ERROR ON TRN INIT2 CURSOR TABLE'                  
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
ET0009*                                                                         
ET0009*---------------------------------------------------------------*         
ET0009*    OPEN INITIAL ASSET CUROSOR TABLE TO SEARCH ALL FRV ASSETS  *         
ET0009*---------------------------------------------------------------*         
ET0009 3240-OPEN-ASSET-INIT-SRCH.                                               
           SET ACAT13-OPN-ASTINI3      TO TRUE.                                 
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
                                                                                
           IF ACAT13-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 OPEN ERROR ON ASSET INIT CURSOR TBL #3'                 
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
ET0009*                                                                         
ET0009*---------------------------------------------------------------*         
ET0009*   FETCH INITIAL ASSET CUROSOR TABLE TO SEARCH ALL FRV ASSETS  *         
ET0009*---------------------------------------------------------------*         
ET0009 3250-FETCH-ASSET-INIT-SRCH.                                              
           INITIALIZE ACAT13-RET-VALUES                                         
                      ACAT13-ASSET.                                             
                                                                                
           MOVE SPACE TO WS-ASSET-INIT-FOUND-SW.                                
           SET  ACAT13-FET-ASTINI3  TO TRUE.                                    
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
                                                                                
           IF ACAT13-NORMAL                                                     
              SET WS-ASSET-INIT-FOUND TO TRUE                                   
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              SET WS-NO-MORE-ASSET TO TRUE                                      
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012        'DB2 FETCH ERROR ON INIT ASSET TABLE #3 - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
ET0009*                                                                         
ET0009*---------------------------------------------------------------*         
ET0009*   CLOSE INITIAL ASSET CUROSOR TABLE TO SEARCH ALL FRV ASSETS  *         
ET0009*---------------------------------------------------------------*         
ET0009 3260-CLOSE-ASSET-INIT-SRCH.                                              
           INITIALIZE ACAT13-RET-VALUES.                                        
           SET  ACAT13-CLO-ASTINI3  TO TRUE.                                    
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012        'DB2 CLOSE ERROR ON INIT ASSET TABLE #3 - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           SAVE HISTORY ASSETS IN TS QUEUE                     *         
      *---------------------------------------------------------------*         
       3500-SAVE-HST-ASSET-IN-TS.                                               
           PERFORM 3020-FETCH-ASSET-HIST.                                       
           IF WS-NO-MORE-DATA                                                   
              GO TO 3500-EXIT.                                                  
      ***  IF ACAT13-AST-STTL-LOC = '10' OR '30' OR '35' OR                     
      ***                           '40' OR '45' OR '50'                        
      ***      GO TO 3500-EXIT.                                                 
           IF ACAT13-AST-STTL-LOC =         '30' OR '35' OR                     
                                    '40' OR '45' OR '05'                        
               GO TO 3500-EXIT.                                                 
                                                                                
      ***************************************************                       
      ****     THESE LINES ARE TEMPORARILY SUPPRESSED ***                       
      ****     FOR CLIENT TO TEST                     ***                       
      ***************************************************                       
      ****     !!!!!!!!!!!!!!!!!!!!!!!!!!!            ***                       
      ****     CHANGE IT BACK AFTER TEST COMPLETES    ***                       
      ****     !!!!!!!!!!!!!!!!!!!!!!!!!!!            ***                       
      ***************************************************                       
      **   IF ACAT13-AST-FAIL-OPN-CAGE = 'Y' AND                                
      **      ACAT13-AST-FAIL-SNT-CAGE = 'Y'                                    
      **       CONTINUE                                                         
      **   ELSE                                                                 
      **       GO TO 3500-EXIT.                                                 
      ***************************************************                       
                                                                                
ET0009     MOVE SPACE TO WS-FRV-ASSET-FOUND-SW.                                 
ET0009     PERFORM VARYING SUB3 FROM 1 BY 1                                     
ET0009                    UNTIL SUB3 > MAX-TBL                                  
ET0009                       OR WS-FRV-ASSET-TBL(SUB3) = SPACE                  
ET0009                       OR WS-FRV-ASSET-FOUND                              
ET0009         IF WS-FRV-ASSET-SECUR (SUB3) > SPACE                             
ET0009            IF  ACAT13-AST-SEC      = WS-FRV-ASSET-SECUR    (SUB3)        
ET0009            AND ACAT13-AST-CS-MG-SH = WS-FRV-ASSET-CS-MG-SH (SUB3)        
ET0009                 SET WS-FRV-ASSET-FOUND TO TRUE                           
LRM013                 ADD 1 TO WS-ACTIVE-FRV-ASSET-COUNT                       
ET0009            END-IF                                                        
ET0009         ELSE                                                             
ET0009         IF WS-FRV-ASSET-ADP-NBR (SUB3) > SPACE                           
ET0009            IF  ACAT13-AST-ADP-NBR  = WS-FRV-ASSET-ADP-NBR  (SUB3)        
ET0009            AND ACAT13-AST-CS-MG-SH = WS-FRV-ASSET-CS-MG-SH (SUB3)        
ET0009                SET WS-FRV-ASSET-FOUND TO TRUE                            
LRM013                ADD 1 TO WS-ACTIVE-FRV-ASSET-COUNT                        
ET0009            END-IF                                                        
ET0009         END-IF                                                           
ET0009         END-IF                                                           
ET0009     END-PERFORM.                                                         
ET0009                                                                          
ET0009     IF WS-FRV-ASSET-FOUND                                                
ET0009         GO TO 3500-EXIT                                                  
ET0009     END-IF.                                                              
ET0009                                                                          
           IF ACAT13-AST-QTY  NOT = 0                                           
              ADD +1 TO SUB                                                     
              MOVE ACAT13-AST-SEC       TO TS-HST-SECUR    (SUB)                
              MOVE ACAT13-AST-CTGRY     TO TS-HST-CTGRY    (SUB)                
              MOVE ACAT13-AST-STTL-LOC  TO TS-HST-STTL-LOC (SUB)                
              MOVE ACAT13-AST-CS-MG-SH  TO TS-HST-TYPE     (SUB)                
              MOVE ACAT13-AST-DESC      TO TS-HST-DESC     (SUB)                
              MOVE ACAT13-AST-QTY       TO TS-HST-QTY-ORIG (SUB)                
              MOVE SPACE                TO TS-HST-REASON   (SUB)                
              MOVE ACAT13-AST-SEQ-NBR   TO TS-HST-SEQ-NBR  (SUB)                
              MOVE ACAT13-AST-PSTN-CD   TO TS-HST-PSTN-CD  (SUB)                
ET0007**      MOVE ACAT13-AST-CMNTS     TO TS-HST-CMNTS    (SUB)                
ET0007        MOVE SPACES               TO TS-HST-CMNTS    (SUB)                
ET0002        MOVE ACAT13-AST-CAGE-TAG  TO TS-HST-TAG      (SUB)                
ET0005        MOVE ACAT13-AST-ADP-NBR   TO TS-HST-ADP-NBR  (SUB)                
              IF SUB >= 2                                                       
                 MOVE 0 TO SUB                                                  
                 PERFORM 7120-WRITE-HIST-ASSET-TSQ                              
                 ADD 1 TO TWA-MAX-PAGE-HST                                      
                 INITIALIZE TS-HST-ASSET-AREA                                   
              END-IF                                                            
           END-IF.                                                              
       3500-EXIT.                                          EXIT.                
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           SAVE INITIAL ASSETS IN TS QUEUE                     *         
      *---------------------------------------------------------------*         
       3600-SAVE-INI-ASSET-IN-TS.                                               
           PERFORM 3120-FETCH-ASSET-INIT.                                       
           IF WS-NO-MORE-DATA                                                   
              GO TO 3600-EXIT.                                                  
           IF ACAT13-AST-QTY  NOT = 0                                           
              ADD +1 TO SUB                                                     
              MOVE ACAT13-AST-SEC       TO TS-INI-SECUR    (SUB)                
              MOVE ACAT13-AST-CTGRY     TO TS-INI-CTGRY    (SUB)                
              MOVE ACAT13-AST-STTL-LOC  TO TS-INI-STTL-LOC (SUB)                
              MOVE ACAT13-AST-CS-MG-SH  TO TS-INI-TYPE     (SUB)                
              MOVE ACAT13-AST-DESC      TO TS-INI-DESC     (SUB)                
              MOVE ACAT13-AST-QTY       TO TS-INI-QTY-RCLM (SUB)                
              MOVE ACAT13-AST-REASON    TO TS-INI-REASON   (SUB)                
              MOVE ACAT13-AST-CMNTS     TO TS-INI-CMNTS    (SUB)                
              MOVE ACAT13-AST-PSTN-CD   TO TS-INI-PSTN-CD  (SUB)                
              MOVE 'Y'                  TO TS-INI-RCLM-IND (SUB)                
ET0003        MOVE ACAT13-AST-CAGE-TAG  TO TS-INI-TAG      (SUB)                
ET0003        MOVE ACAT13-AST-ADP-NBR   TO TS-INI-ADP-NBR  (SUB)                
              IF SUB >= 2                                                       
                 MOVE 0 TO SUB                                                  
                 PERFORM 7220-WRITE-INIT-ASSET-TSQ                              
                 ADD 1 TO TWA-MAX-PAGE-INI                                      
                 INITIALIZE TS-INI-ASSET-AREA                                   
              END-IF                                                            
           END-IF.                                                              
       3600-EXIT.                                          EXIT.                
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           SUBMIT ROUTINE - CREATE INITIAL TRANSFER            *         
      *---------------------------------------------------------------*         
       4000-SUBMIT-RTN.                                                         
           PERFORM 4010-CHECK-IF-SUBMIT-ALLOWED.                                
           IF NOT WS-SUBMIT-ALLOWED                                             
              IF TWA-MAP-SUB > SPACE                                            
                 MOVE -1 TO MSUBL                                               
                 MOVE ATT-UNPROT-BRT TO MSUBA                                   
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'SUBMIT NOT ALLOWED - "REASON CODE" OR "RECLAIM        
      -                  '" FIELD ENTRY MISSING'                                
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
           IF TWA-MAP-SUB > SPACE                                               
              IF TWA-MAP-SUB = 'Y'                                              
                 IF WS-UPDATE-OK                                                
ET0008**            PERFORM 4020-CHECK-DUP-INIT-ASSET                           
ET0008**            IF NOT WK-ERROR                                             
                       PERFORM 4030-CREATE-RECLAIM                              
ET0008**            END-IF                                                      
                 ELSE                                                           
                    MOVE ATT-UNPROT-BRT TO MSUBA                                
                    IF NOT WK-ERROR                                             
                       MOVE -1 TO MSUBL                                         
                       SET WK-ERROR TO TRUE                                     
                       MOVE 'UNAUTHORIZED TO SUBMIT' TO SYSTEM-MSG              
                    END-IF                                                      
                 END-IF                                                         
              ELSE                                                              
                 MOVE -1 TO MSUBL                                               
                 MOVE ATT-UNPROT-BRT TO MSUBA                                   
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'TYPE "Y" TO SUBMIT'                                   
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *               SUBMIT ALLOWED ?                                *         
      *---------------------------------------------------------------*         
       4010-CHECK-IF-SUBMIT-ALLOWED.                                            
           MOVE SPACE TO WS-SUBMIT-ALLOWED-SW.                                  
           MOVE +1 TO WS-HST-ITEM.                                              
           PERFORM  UNTIL WS-HST-ITEM > TWA-MAX-PAGE-HST                        
              PERFORM 7100-READ-HIST-ASSET-TSQ                                  
              PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 2                     
                 IF TS-HST-RCLMED (SUB) NOT = 'Y'                               
                    IF  (TS-HST-RCLM-IND (SUB) = 'Y')                           
                    AND (TS-HST-REASON (SUB) = '40' OR '41' OR '42' OR          
                               '43' OR '44' OR '45' OR '46' OR '47')            
                        SET WS-SUBMIT-ALLOWED TO TRUE                           
                    END-IF                                                      
                 END-IF                                                         
              END-PERFORM                                                       
              IF WS-SUBMIT-ALLOWED                                              
                 MOVE TWA-MAX-PAGE-HST TO WS-HST-ITEM                           
              END-IF                                                            
              ADD +1 TO WS-HST-ITEM                                             
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *   MAKE SURE THAT NO DUPLICATE INITIAL ASSET EXIST.            *         
      *   THE OVERNIGH BATCH PRODUCES 'RCR' RECORDS IN INIT ASSET     *         
      *   TABLE.  'RCR' RECORD CONTAINS SAME RECORD KEY AS 'FRV'      *         
      *   RECORD.  THEREFORE IF THE PROGRAM ATTEMPTS TO INSERT 'FRV'  *         
      *   RECORD, WHILE 'RCR' RECORD EXISTS, DB2 DUPLICATE KEY ERROR  *         
      *   OCCURS.                                                     *         
ET0008*   THIS ROUTINE IS NO LONGER EXECUTED - WE NOW ALLOW USER TO   *         
ET0008*   CREATE DUPLICATE FAIL REVERSALS IN INITIAL TABLES.          *         
      *---------------------------------------------------------------*         
       4020-CHECK-DUP-INIT-ASSET.                                               
           MOVE ACAT-ADP-BROKER  TO ACAT13-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR        TO WS-PASS-BR.                                
           MOVE TWA-MAP-AC        TO WS-PASS-ACCT.                              
      **   MOVE WS-PASS-ACCT-DLV  TO ACAT13-PASS-ACCT-DLV.                      
           MOVE TWA-DLVR-ACCT     TO ACAT13-PASS-ACCT-DLV.                      
           MOVE TWA-MAP-CBRKR     TO ACAT13-PASS-CON-BRKR.                      
           MOVE TWA-MAP-CACCT     TO ACAT13-PASS-CON-ACCT.                      
ET0001     SET ACAT13-OPN-ASTINI2 TO TRUE.                                      
ET0001     PERFORM 7600-LINK-TO-ACAT13DB.                                       
ET0001     IF ACAT13-ERROR                                                      
ET0001        MOVE -1 TO MNEXTL                                                 
ET0001        SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012        'DB2 OPEN CURSOR #2 INITIAL ASSET TBL - CALL HELP DESK'           
ET0001          TO  WK-DB2-ERROR                                                
ET0001        MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
ET0001        MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
ET0001        PERFORM 9000-ERROR-RTN.                                           
                                                                                
           SET ACAT13-FND-ASTINI TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-FOUND                                                      
              MOVE -1 TO MSUBL                                                  
              MOVE ATT-UNPROT-BRT TO MSUBA                                      
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
ET0001           MOVE ACAT13-AST-TRNFR-TYP TO WS-TRNFR-MSG                      
ET0001           MOVE DUPE-ASSET-MSG TO SYSTEM-MSG                              
              END-IF                                                            
           ELSE                                                                 
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MNEXTL                                                 
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012        'DB2 FIND ERROR ON INITIAL ASSET TBL - CALL HELP DESK'            
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
                                                                                
ET0001     SET ACAT13-CLO-ASTINI2 TO TRUE.                                      
ET0001     PERFORM 7600-LINK-TO-ACAT13DB.                                       
ET0001     IF ACAT13-ERROR                                                      
ET0001        MOVE -1 TO MNEXTL                                                 
ET0001        SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012        'DB2 OPEN CURSOR #2 INITIAL ASSET TBL - CALL HELP DESK'           
ET0001          TO  WK-DB2-ERROR                                                
ET0001        MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
ET0001        MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
ET0001        PERFORM 9000-ERROR-RTN.                                           
                                                                                
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          CREATE INITIAL TRANSFER FOR A RECLAIM                *         
      *---------------------------------------------------------------*         
       4030-CREATE-RECLAIM.                                                     
           MOVE ACAT-ADP-BROKER  TO ACAT13-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR        TO WS-PASS-BR.                                
           MOVE TWA-MAP-AC        TO WS-PASS-ACCT.                              
      **   MOVE WS-PASS-ACCT-DLV  TO ACAT13-PASS-ACCT-DLV.                      
           MOVE TWA-DLVR-ACCT     TO ACAT13-PASS-ACCT-DLV.                      
           MOVE TWA-MAP-CBRKR     TO ACAT13-PASS-CON-BRKR.                      
           MOVE TWA-MAP-CACCT     TO ACAT13-PASS-CON-ACCT.                      
           MOVE EIBTRMID          TO ACAT13-PASS-TERMID.                        
           MOVE TWA-MAP-ACT-CMNTS TO ACAT13-PASS-CMNTS.                         
           MOVE TWA-ACAT          TO ACAT13-PASS-ACAT.                          
           MOVE ACAT-ADP-BROKER   TO ACAT13-PASS-SBMT-CLT.                      
ET0008     MOVE SPACE             TO WS-ADP-CONTROL-NBR.                        
ET0008     MOVE 'XX'              TO WS-CONTROL-XX.                             
ET0008     MOVE ZERO              TO WS-CONTROL-SEQ.                            
LRM011     MOVE ACAT-SIGN-ON-ID      TO ACAT13-SNON-ID                          
LRM011     MOVE ACAT-CICS-NETNAME    TO ACAT13-NETNAME                          
LRM011     MOVE ACAT-CICS-USER-ID    TO ACAT13-USER-ID                          
LRM011     MOVE ACAT-CICS-USER-NAME  TO ACAT13-USER-NAME                        
ET0008                                                                          
ET0005     PERFORM UNTIL ACAT13-NORMAL OR WS-CONTROL-SEQ = 999                  
ET0005        ADD 1 TO WS-CONTROL-SEQ                                           
ET0005        MOVE WS-ADP-CONTROL-NBR TO ACAT13-PASS-ADP-CONTROL                
ET0005        PERFORM 4031-BUILD-TRANS-RFRN-ID                                  
ET0005        MOVE SPACE              TO ACAT13-PASS-TRANS-RFRN-ID              
ET0005        MOVE WS-RFRN-DLVR-ACCT  TO ACAT13-PASS-TRANS-RFRN-ID              
ET0005        SET ACAT13-INS-TFRINI TO TRUE                                     
ET0005        PERFORM 7600-LINK-TO-ACAT13DB                                     
ET0005        IF ACAT13-NORMAL OR ACAT13-FOUND                                  
ET0005           CONTINUE                                                       
ET0005        ELSE                                                              
ET0005           MOVE -1 TO MBRL                                                
ET0005           SET WK-ERROR TO TRUE                                           
LRM012           MOVE                                                           
LRM012           'DB2 INITIAL TRANSFER INSERT ERROR - CALL HELP DESK'           
ET0005             TO  WK-DB2-ERROR                                             
ET0005           MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                       
ET0005           MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                           
ET0005           PERFORM 9000-ERROR-RTN                                         
ET0005        END-IF                                                            
ET0005     END-PERFORM.                                                         
ET0005     IF ACAT13-NORMAL                                                     
ET0005        PERFORM 4040-CREATE-INIT-ASSET                                    
ET0005           VARYING WS-HST-ITEM FROM 1 BY 1                                
ET0005              UNTIL WS-HST-ITEM > TWA-MAX-PAGE-HST                        
ET0005        MOVE 'Y' TO ACAT13-PASS-RESUB-IND                                 
ET0005        PERFORM 4200-UPDATE-RJCT-RESUB-IND                                
ET0005        PERFORM 4500-CLEAR-SCREEN-N-STORAGE                               
ET0005        PERFORM 4510-CLEAR-SEARCH-ENGINE                                  
ET0005        SET WK-MSG-ON TO TRUE                                             
ET0005        MOVE -1 TO MBRL                                                   
ET0005        MOVE 'FAIL REVERSAL COMPLETED SUCCESSFULLY - ENTER BRANCH'        
ET0005          TO  SYSTEM-MSG                                                  
ET0005     ELSE                                                                 
ET0005        SET WK-MSG-ON TO TRUE                                             
ET0005        MOVE -1 TO MBRL                                                   
ET0005        MOVE 'REACHED MAX RCL - TRY AGAIN LATER, PF10 TO EXIT'            
ET0005          TO  SYSTEM-MSG                                                  
ET0005     END-IF.                                                              
ET0005                                                                          
ET0008**   SET ACAT13-CNT-TFRINI  TO TRUE.                                      
ET0008**   PERFORM 7600-LINK-TO-ACAT13DB.                                       
ET0008**   IF ACAT13-FOUND                                                      
ET0008**      MOVE -1 TO MSUBL                                                  
ET0008**      SET WK-ERROR TO TRUE                                              
ET0008**      MOVE 'REVERSAL FAILED - REVERSAL ALREADY EXISTS'                  
ET0008**        TO  SYSTEM-MSG                                                  
ET0008**      PERFORM 9000-ERROR-RTN.                                           
ET0008**                                                                        
ET0008**   SET ACAT13-INS-TFRINI TO TRUE.                                       
ET0008**   PERFORM 7600-LINK-TO-ACAT13DB.                                       
ET0008**   IF ACAT13-NORMAL                                                     
ET0008**      PERFORM 4040-CREATE-INIT-ASSET                                    
ET0008**         VARYING WS-HST-ITEM FROM 1 BY 1                                
ET0008**            UNTIL WS-HST-ITEM > TWA-MAX-PAGE-HST                        
ET0008**      MOVE 'Y' TO ACAT13-PASS-RESUB-IND                                 
ET0008**      PERFORM 4200-UPDATE-RJCT-RESUB-IND                                
ET0008**      PERFORM 4500-CLEAR-SCREEN-N-STORAGE                               
ET0008**      PERFORM 4510-CLEAR-SEARCH-ENGINE                                  
ET0008**      SET WK-MSG-ON TO TRUE                                             
ET0008**      MOVE -1 TO MBRL                                                   
ET0008**      MOVE 'FAIL REVERSAL COMPLETED SUCCESSFULLY - ENTER BRANCH'        
ET0008**        TO  SYSTEM-MSG                                                  
ET0008**   ELSE                                                                 
ET0008**   IF ACAT13-FOUND                                                      
ET0008**      MOVE -1 TO MSUBL                                                  
ET0008**      MOVE ATT-UNPROT TO MSUBA                                          
ET0008**      IF NOT WK-ERROR                                                   
ET0008**         SET WK-ERROR TO TRUE                                           
ET0008**         MOVE 'REVERSAL FAILED - DUPLICATE REVERSALS FOUND'             
ET0008**           TO  SYSTEM-MSG                                               
ET0008**      END-IF                                                            
ET0008**   ELSE                                                                 
ET0008**      MOVE -1 TO MBRL                                                   
ET0008**      SET WK-ERROR TO TRUE                                              
ET0008**      MOVE 'DB2 INITIAL TRANSFER INSERT ERROR - CALL HELP DESK'         
ET0008**        TO  WK-DB2-ERROR                                                
ET0008**      MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
ET0008**      MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
ET0008**      PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008* TRANS-RFRN-ID-CD = DLVR-ACCT-NBR + XXNNN WHERE NNN IS A SEQ # *         
ET0008*---------------------------------------------------------------*         
ET0008 4031-BUILD-TRANS-RFRN-ID.                                                
           MOVE SPACE          TO WS-RFRN-DLVR-ACCT.                            
           MOVE TWA-DLVR-ACCT  TO WS-RFRN-DLVR-ACCT.                            
                                                                                
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 15                       
               OR WS-RFRN-DLVR-ACCT (SUB : 1) NOT > SPACE                       
           END-PERFORM.                                                         
                                                                                
           PERFORM VARYING SUB2 FROM 1 BY 1 UNTIL SUB2 > 5                      
               MOVE WS-ADP-CONTROL-NBR (SUB2 : 1)                               
                 TO WS-RFRN-DLVR-ACCT  (SUB : 1)                                
               ADD  +1  TO  SUB                                                 
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *    CREATE INITIAL ASSET TABLE FOR EACH BALANCE AND SECURITY   *         
      *---------------------------------------------------------------*         
       4040-CREATE-INIT-ASSET.                                                  
           INITIALIZE  ACAT13-ASSET.                                            
           PERFORM 7100-READ-HIST-ASSET-TSQ.                                    
           IF NOT WK-TS-READ-ERROR                                      15960000
              MOVE 0 TO SUB                                             15960000
              PERFORM 2 TIMES                                           15960000
                 ADD +1 TO SUB                                                  
                 IF TS-HST-RCLM-IND (SUB) = 'Y'                                 
                    MOVE TS-HST-QTY-ORIG (SUB) TO ACAT13-PASS-QTY               
                    MOVE TS-HST-CMNTS    (SUB) TO ACAT13-PASS-CMNTS             
                    MOVE TS-HST-REASON   (SUB) TO ACAT13-PASS-REASON            
                    MOVE TS-HST-SEQ-NBR  (SUB) TO ACAT13-PASS-SEQ-NBR           
ET0003              MOVE TS-HST-TAG      (SUB) TO ACAT13-PASS-CAGE-TAG          
                    SET ACAT13-INS-ASTINI TO TRUE                               
                    PERFORM 7600-LINK-TO-ACAT13DB                               
                    IF ACAT13-NORMAL                                            
                       CONTINUE                                                 
                    ELSE                                                        
                       MOVE -1 TO MNEXTL                                        
                       SET WK-ERROR TO TRUE                                     
                       MOVE 'REVERSAL FAILED - INIT ASSET INSERT ERROR'         
                         TO  WK-DB2-ERROR                                       
                       MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                 
                       MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                     
                       PERFORM 9000-ERROR-RTN                                   
                    END-IF                                                      
                 END-IF                                                         
              END-PERFORM.                                              15960000
                                                                                
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *     DELETE ROUTINE.                                           *         
      *     REVERSALS ON INITIAL TRANSFER TABLE CAN NOT BE MODIFIED   *         
      *     BUT CAN BE DELETED FROM A TABLE.                          *         
      *---------------------------------------------------------------*         
       4100-DELETE-RTN.                                                         
           IF WK-ERROR                                                          
              MOVE SPACE TO TWA-DELETE-CONFIRM                                  
              GO TO 4100-EXIT.                                                  
           IF TWA-MAP-DEL = 'Y'                                                 
              IF WS-UPDATE-OK                                                   
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE SPACE TO TWA-DELETE-CONFIRM                               
                 MOVE ATT-UNPROT-BRT TO MDELA                                   
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE -1 TO MDELL                                            
                    MOVE 'UNAUTHORIZED TO DELETE'  TO SYSTEM-MSG                
                 END-IF                                                         
                 GO TO 4100-EXIT                                                
              END-IF                                                            
           ELSE                                                                 
              MOVE SPACE TO TWA-DELETE-CONFIRM                                  
              MOVE -1 TO MDELL                                                  
              MOVE ATT-UNPROT-BRT TO MDELA                                      
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'TYPE "Y" TO DELETE'                                      
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
              GO TO 4100-EXIT                                                   
           END-IF.                                                              
           IF TWA-DELETE-CONFIRM = 'Y'                                          
              MOVE SPACE TO TWA-DELETE-CONFIRM                                  
              MOVE ACAT-ADP-BROKER  TO ACAT13-PASS-DLVR-NBR                     
              MOVE TWA-MAP-BR TO WS-PASS-BR                                     
              MOVE TWA-MAP-AC TO WS-PASS-ACCT                                   
      **      MOVE WS-PASS-ACCT-DLV TO ACAT13-PASS-ACCT-DLV                     
              MOVE TWA-DLVR-ACCT    TO ACAT13-PASS-ACCT-DLV                     
              MOVE TWA-MAP-CBRKR TO ACAT13-PASS-CON-BRKR                        
              MOVE TWA-MAP-CACCT TO ACAT13-PASS-CON-ACCT                        
              MOVE TWA-ACAT TO ACAT13-PASS-ACAT                                 
ET0008        MOVE TWA-ADP-CONTROL-NBR TO ACAT13-PASS-ADP-CONTROL               
              MOVE EIBTRMID  TO ACAT13-PASS-TERMID                              
              PERFORM 4110-CHECK-IF-NOT-DELETED                                 
              SET ACAT13-DEL-RECLAIM  TO TRUE                                   
              PERFORM 7600-LINK-TO-ACAT13DB                                     
              IF ACAT13-NORMAL                                                  
                 MOVE ' ' TO ACAT13-PASS-RESUB-IND                              
                 PERFORM 4200-UPDATE-RJCT-RESUB-IND                             
ET0010           IF TWA-SRCH-ALL-FRVS                                           
ET0010              PERFORM 4105-ALL-FRVS-AFTER-DELETION                        
ET0010              IF WS-NO-MORE-TRNFR                                         
ET0010                 CONTINUE                                                 
ET0010              ELSE                                                        
ET0010                 GO TO 4100-EXIT                                          
ET0010              END-IF                                                      
ET0010           END-IF                                                         
                 PERFORM 4500-CLEAR-SCREEN-N-STORAGE                            
                 PERFORM 4510-CLEAR-SEARCH-ENGINE                               
                 MOVE -1 TO MBRL                                                
                 SET WK-MSG-ON TO TRUE                                          
                 MOVE 'DELETION COMPLETED SUCCESSFULLY - ENTER BRANCH'          
                   TO  SYSTEM-MSG                                               
              ELSE                                                              
                 MOVE -1 TO MBRL                                                
                 MOVE SPACE TO TWA-DELETE-CONFIRM                               
                 SET WK-ERROR TO TRUE                                           
LRM012           MOVE 'DB2 DELETION ERROR - CALL HELP DESK'                     
                   TO  WK-DB2-ERROR                                             
                 MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                       
                 MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                           
                 PERFORM 9000-ERROR-RTN                                         
              END-IF                                                            
           ELSE                                                                 
              MOVE 'Y' TO TWA-DELETE-CONFIRM                                    
              MOVE -1 TO MDELL                                                  
              SET WK-ERROR  TO TRUE                                             
ET0009**      MOVE 'ARE YOU SURE TO DELETE?  IF SO, PRESS ENTER AGAIN'          
ET0009        MOVE 'DELETE OK?  PRESS ENTER TO CONFIRM A DELETE'                
                TO  SYSTEM-MSG.                                                 
       4100-EXIT.                                          EXIT.                
       EJECT                                                                    
ET0010*                                                                         
ET0010*---------------------------------------------------------------*         
ET0008*  REFORMAT SCREEN AFTER FRV RECORD IS DELETED IN PF4 MODE      *         
ET0010*   - PAINT A MAP WITH NEXT AVAILABLE FRV RECORD                *         
ET0010*   - IF NEXT RCORD IS NOT AVAILABLE, DISPLAY PREVIOUSE RECORD  *         
ET0010*   - IF NONE IS AVAILABLE, THEN DISPLAY BLANK SCREEN           *         
ET0010*---------------------------------------------------------------*         
ET0010 4105-ALL-FRVS-AFTER-DELETION.                                            
           MOVE ACAT-ADP-BROKER  TO ACAT13-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR TO WS-PASS-BR.                                       
           MOVE TWA-MAP-AC TO WS-PASS-ACCT.                                     
           MOVE ALL '%'    TO WS-PASS-ACCT-MASK.                                
           MOVE WS-PASS-ACCT-DLV TO ACAT13-PASS-ACCT-DLV.                       
           PERFORM 5630-OPEN-INITRN-ALL-FRVS.                                   
                                                                                
           MOVE SPACE TO WS-NEXT-PAGE-FOUND-SW                                  
                         WS-NO-MORE-TRNFR-SW.                                   
           PERFORM UNTIL WS-NEXT-PAGE-FOUND OR WS-NO-MORE-TRNFR                 
              PERFORM 5640-FETCH-INITRN-ALL-FRVS                                
              IF WS-TFR-INIT-FOUND                                              
                 MOVE ACAT13-TFR-DLVR-ACCT   TO WS-NEXT-DLVR-ACCT-KEY           
                 MOVE ACAT13-TFR-RCV-ACCT    TO WS-NEXT-RCV-ACCT-KEY            
                 MOVE ACAT13-TFR-ACAT        TO WS-NEXT-ADP-ACAT-KEY            
                 MOVE TWA-DLVR-ACCT          TO WS-CURR-DLVR-ACCT-KEY           
                 MOVE TWA-MAP-CACCT          TO WS-CURR-RCV-ACCT-KEY            
                 MOVE TWA-ADP-CONTROL-NBR    TO WS-CURR-ADP-ACAT-KEY            
                 IF WS-NEXT-INITRN-KEY > WS-CURR-INITRN-KEY                     
                    SET WS-NEXT-PAGE-FOUND TO TRUE                              
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 5650-CLOSE-INITRN-ALL-FRVS.                                  
                                                                                
           IF WS-NO-MORE-TRNFR                                                  
              PERFORM 4106-ALL-FRVS-AFTER-DEL-CONT                              
           ELSE                                                                 
              PERFORM 3109-TRNF-INIT-TO-TWA                                     
              PERFORM 6710-SETUP-INIT-ASSET                                     
              MOVE TWA-MAP-BR  TO TWA-MAP-KEY-BR                                
              MOVE TWA-MAP-AC  TO TWA-MAP-KEY-AC                                
           END-IF.                                                              
        EJECT                                                                   
ET0010*                                                                         
ET0010*---------------------------------------------------------------*         
ET0010*   CONTINUE FROM 4105-ALL-FRVS-AFTER-DELETION TO SRCH          *         
ET0010*   FRV TRANSFER RECORD - SEARCH PREVIOUSE RECORD THIS TIME.    *         
ET0010*---------------------------------------------------------------*         
ET0010 4106-ALL-FRVS-AFTER-DEL-CONT.                                            
           PERFORM 5660-OPEN-INITRN-ALL-FRVS-DES.                               
                                                                                
           MOVE SPACE TO WS-PREV-PAGE-FOUND-SW                                  
                         WS-NO-MORE-TRNFR-SW.                                   
           PERFORM UNTIL WS-PREV-PAGE-FOUND OR WS-NO-MORE-TRNFR                 
              PERFORM 5670-FETCH-INITRN-ALL-FRVS-DES                            
              IF WS-TFR-INIT-FOUND                                              
                 MOVE ACAT13-TFR-DLVR-ACCT   TO WS-NEXT-DLVR-ACCT-KEY           
                 MOVE ACAT13-TFR-RCV-ACCT    TO WS-NEXT-RCV-ACCT-KEY            
                 MOVE ACAT13-TFR-ACAT        TO WS-NEXT-ADP-ACAT-KEY            
                 MOVE TWA-DLVR-ACCT          TO WS-CURR-DLVR-ACCT-KEY           
                 MOVE TWA-MAP-CACCT          TO WS-CURR-RCV-ACCT-KEY            
                 MOVE TWA-ADP-CONTROL-NBR    TO WS-CURR-ADP-ACAT-KEY            
                 IF WS-NEXT-INITRN-KEY < WS-CURR-INITRN-KEY                     
                    SET WS-PREV-PAGE-FOUND TO TRUE                              
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 5680-CLOSE-INITRN-ALL-FRVS-DES.                              
                                                                                
           IF WS-NO-MORE-TRNFR                                                  
              CONTINUE                                                          
           ELSE                                                                 
              PERFORM 3109-TRNF-INIT-TO-TWA                                     
              PERFORM 6710-SETUP-INIT-ASSET                                     
              MOVE TWA-MAP-BR  TO TWA-MAP-KEY-BR                                
              MOVE TWA-MAP-AC  TO TWA-MAP-KEY-AC                                
           END-IF.                                                              
       4106-EXIT.   EXIT.                                                       
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *   BEFORE DELETE, CHECK IF INITIAL TRANSFER AND ASSETS EXIST   *         
      *---------------------------------------------------------------*         
       4110-CHECK-IF-NOT-DELETED.                                               
           SET ACAT13-CNT-TFRINI TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-FOUND                                                      
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'DB2 DELETION ERROR - CALL HELP DESK'                        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
              SET WK-ERROR TO TRUE                                              
              MOVE 'DELETION FAILED - REVERSAL HAS BEEN ALREADY DELETED'        
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN.                                           
                                                                                
           SET ACAT13-CNT-ASTINI TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-FOUND                                                      
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'DB2 DELETION ERROR - CALL HELP DESK'                        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
              SET WK-ERROR TO TRUE                                              
              MOVE 'DELETION FAILED - REVERSAL HAS BEEN ALREADY DELETED'        
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *  WHEN RESUBMITTING THE REJECTED REVERSAL, OR DELETING A NEWLY *         
      *  CREATED REVERSAL                                             *         
      *   1. CHECK IF ANY REJECTED REVERSAL TRANSFER EXISTS           *         
      *   2. IF REJECTED TRANSFER FOUND                               *         
      *       - WHEN RESUBMIT                                         *         
      *           SET 'Y' TO ACCT-RJCT-RSBM-IND OF REJECTED TRANSFER  *         
      *       - WHEN DELETE                                           *         
      *           SET ' ' TO ACCT-RJCT-RSBM-IND OF REJECTED TRANSFER  *         
      *---------------------------------------------------------------*         
       4200-UPDATE-RJCT-RESUB-IND.                                              
           MOVE ACAT-ADP-BROKER  TO ACAT13-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR TO WS-PASS-BR.                                       
           MOVE TWA-MAP-AC TO WS-PASS-ACCT.                                     
      **   MOVE WS-PASS-ACCT-DLV TO ACAT13-PASS-ACCT-DLV.                       
           MOVE TWA-DLVR-ACCT    TO ACAT13-PASS-ACCT-DLV.                       
           MOVE TWA-MAP-CBRKR TO ACAT13-PASS-CON-BRKR.                          
           MOVE TWA-MAP-CACCT TO ACAT13-PASS-CON-ACCT.                          
           MOVE EIBTRMID      TO ACAT13-PASS-TERMID.                            
           SET ACAT13-CNT-REJ-RCLM TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'DB2 REJECT FRV COUNT ERROR - CALL HELP DESK'                
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
           IF ACAT13-FOUND                                                      
              SET ACAT13-UPD-RESUB  TO TRUE                                     
              PERFORM 7600-LINK-TO-ACAT13DB                                     
              IF ACAT13-ERROR                                                   
                 MOVE -1 TO MSUBL                                               
                 SET WK-ERROR TO TRUE                                           
LRM012           MOVE                                                           
LRM012          'DB2 ERR ON UPDATE REJECT RESUBMIT IND - CALL HELP DESK'        
                   TO  WK-DB2-ERROR                                             
                 MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                       
                 MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                           
                 PERFORM 9000-ERROR-RTN.                                        
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *   CLEAR MAP AND STORAGE AREAS                                 *         
      *---------------------------------------------------------------*         
       4500-CLEAR-SCREEN-N-STORAGE.                                             
           PERFORM 7110-DELETE-HIST-ASSET-TSQ                                   
           PERFORM 7210-DELETE-INIT-ASSET-TSQ                                   
           PERFORM 2010-CLEAR-SCR.                                              
           MOVE SPACE      TO MBRO                                              
                              MACO.                                             
           MOVE ATT-UNPROT TO MBRA                                              
                              MACA.                                             
           INITIALIZE TWA-TFR-UPDATE-IND                                        
                      TWA-MAP-AREA                                              
                      TWA-MAP-KEY.                                              
ET0004     MOVE SPACE      TO SRCHTAGO.                                         
ET0004     MOVE ATT-UNPROT TO SRCHTAGA.                                         
ET0004     MOVE SPACE      TO TWA-SRCH-TAG-AREA.                                
                                                                                
      *                                                                         
      *---------------------------------------------------------------*         
      *   CLEAR SEARCH ENGINE                                         *         
      *---------------------------------------------------------------*         
       4510-CLEAR-SEARCH-ENGINE.                                                
           MOVE SPACE      TO MMBRO                                             
                              MMACO                                             
                              MMRRO                                             
                              MMTFRO                                            
                              MMRDO                                             
                              MMBKRO                                            
                              MMSTATO                                           
                              MMSDO                                             
                              TWA-MAP-SEARCH.                                   
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *   MAKE SURE THE ASSETS CAN NOT BE RECLAIMED MORE THAN ONCE    *         
      *   BY INSPECTING ACTIVE TRANSFER & ASSET TABLES.               *         
      *   (IF ASSETS ARE FOUND IN ACTIVE ASSET TABLE, THOSE ASSETS    *         
      *    HAVE BEEN ALREADY RECLAIMED(REVERSED)).                    *         
      * ** NOTE **                                                    *         
      * ** THIS ROUTINE IS NO LONGER USED **                          *         
      *---------------------------------------------------------------*         
       5000-CHECK-DUPLICATE-ASSETS.                                             
           MOVE ACAT-ADP-BROKER  TO ACAT13-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR TO WS-PASS-BR.                                       
           MOVE TWA-MAP-AC TO WS-PASS-ACCT.                                     
      **   MOVE WS-PASS-ACCT-DLV TO ACAT13-PASS-ACCT-DLV.                       
           MOVE TWA-DLVR-ACCT    TO ACAT13-PASS-ACCT-DLV.                       
           MOVE TWA-MAP-CBRKR    TO ACAT13-PASS-CON-BRKR.                       
           MOVE TWA-MAP-CACCT    TO ACAT13-PASS-CON-ACCT.                       
ET0001     MOVE TWA-ACAT         TO ACAT13-PASS-ACAT-ASTD-NBR.                  
           MOVE SPACE TO WS-NO-MORE-TRNFR-SW.                                   
           PERFORM 5500-OPEN-TRNFR-CURSOR.                                      
           PERFORM 5100-CHECK-TRANSFER                                          
                   UNTIL WS-NO-MORE-TRNFR.                                      
           PERFORM 5520-CLOSE-TRNFR-CURSOR.                                     
      *                                                                         
       5100-CHECK-TRANSFER.                                                     
           PERFORM 5510-FETCH-TRNFR-CURSOR.                                     
           IF ACAT13-NORMAL                                                     
              MOVE ACAT13-TFR-ACAT TO ACAT13-PASS-ACAT                          
              MOVE SPACE TO WS-NO-MORE-ASSET-SW                                 
              PERFORM 5600-OPEN-ASSET-CURSOR                                    
              PERFORM 5200-CHECK-ASSET  THRU 5200-EXIT                          
                    UNTIL WS-NO-MORE-ASSET                                      
              PERFORM 5620-CLOSE-ASSET-CURSOR                                   
           END-IF.                                                              
      *                                                                         
       5200-CHECK-ASSET.                                                        
           PERFORM 5610-FETCH-ASSET-CURSOR.                                     
           IF WS-NO-MORE-ASSET                                                  
              GO TO 5200-EXIT.                                                  
                                                                                
           MOVE +1 TO WS-HST-ITEM.                                              
           PERFORM UNTIL WS-HST-ITEM > TWA-MAX-PAGE-HST                         
              PERFORM 7100-READ-HIST-ASSET-TSQ                                  
              IF NOT WK-TS-READ-ERROR                                   15960000
                 PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 2                  
                    IF TS-HST-SECUR (SUB) > SPACE                               
                       IF TS-HST-SECUR (SUB) = ACAT13-AST-SEC                   
                          MOVE ACAT13-AST-REASON TO TS-HST-REASON (SUB)         
                          MOVE 'Y' TO TS-HST-RCLMED (SUB)                       
                          PERFORM 7130-REWRITE-HIST-ASSET-TSQ                   
                          MOVE  TWA-MAX-PAGE-HST TO WS-HST-ITEM                 
                       END-IF                                                   
                    END-IF                                                      
                 END-PERFORM                                                    
              END-IF                                                            
              ADD +1 TO WS-HST-ITEM                                             
           END-PERFORM.                                                         
       5200-EXIT.                                                               
           EXIT.                                                                
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          ACTIVE TRANSFER CURSOR AREA                          *         
      *---------------------------------------------------------------*         
       5500-OPEN-TRNFR-CURSOR.                                                  
           SET ACAT13-OPN-TRANSFER TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'OPEN TRNSFER ERROR - CALL HELP DESK'                        
LRM012                   TO WK-DB2-ERROR                                        
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
       5510-FETCH-TRNFR-CURSOR.                                                 
           SET ACAT13-FET-TRANSFER TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-NOT-FOUND                                                  
              SET WS-NO-MORE-TRNFR TO TRUE                                      
           ELSE                                                                 
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'FETCH TRNSFER ERROR - CALL HELP DESK'                       
LRM012                    TO WK-DB2-ERROR                                       
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
       5520-CLOSE-TRNFR-CURSOR.                                                 
           SET ACAT13-CLO-TRANSFER TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'CLOSE TRNSFER ERROR - CALL HELP DESK'                       
LRM012                    TO WK-DB2-ERROR                                       
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0009*                                                                         
ET0009*---------------------------------------------------------------*         
ET0009*    OPEN ACTIVE TRANSFER CURSOR FOR FRV ASSET TABLE SEARCH     *         
ET0009*---------------------------------------------------------------*         
ET0009 5530-OPEN-ACTIVE-TRNFR-CSR.                                              
           SET ACAT13-OPN-TRNFR TO TRUE.                                        
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'OPEN TRNFR ERROR - CALL HELP DESK'                          
LRM012                   TO WK-DB2-ERROR                                        
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
ET0009*                                                                         
ET0009*---------------------------------------------------------------*         
ET0009*   FETCH ACTIVE TRANSFER CURSOR FOR FRV ASSET TABLE SEARCH     *         
ET0009*---------------------------------------------------------------*         
ET0009 5540-FETCH-ACTIVE-TRNFR-CSR.                                             
           MOVE SPACE TO WS-TFR-FOUND-SW.                                       
                                                                                
           SET ACAT13-FET-TRNFR TO TRUE.                                        
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
                                                                                
           IF ACAT13-NORMAL                                                     
              SET WS-TFR-FOUND TO TRUE                                          
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              SET WS-NO-MORE-TRNFR TO TRUE                                      
           ELSE                                                                 
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'FETCH TRNFR ERROR - CALL HELP DESK'                         
LRM012                    TO WK-DB2-ERROR                                       
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
ET0009*                                                                         
ET0009*---------------------------------------------------------------*         
ET0009*   CLOSE ACTIVE TRANSFER CURSOR FOR FRV ASSET TABLE SEARCH     *         
ET0009*---------------------------------------------------------------*         
ET0009 5550-CLOSE-ACTIVE-TRNFR-CSR.                                             
           SET ACAT13-CLO-TRNFR TO TRUE.                                        
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'CLOSE TRNFR ERROR - CALL HELP DESK'                         
LRM012                    TO WK-DB2-ERROR                                       
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          ACTIVE ASSET CURSOR AREA                             *         
      *---------------------------------------------------------------*         
       5600-OPEN-ASSET-CURSOR.                                                  
           SET ACAT13-OPN-ASSET TO TRUE.                                        
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'OPEN ASSET TBL ERROR - CALL HELP DESK'                      
LRM012                         TO WK-DB2-ERROR                                  
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
       5610-FETCH-ASSET-CURSOR.                                                 
           SET ACAT13-FET-ASSET TO TRUE.                                        
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-NOT-FOUND                                                  
              SET WS-NO-MORE-ASSET TO TRUE                                      
           ELSE                                                                 
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'FETCH ASSET TBL ERROR - CALL HELP DESK'                     
LRM012                    TO WK-DB2-ERROR                                       
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
       5620-CLOSE-ASSET-CURSOR.                                                 
           SET ACAT13-CLO-ASSET TO TRUE.                                        
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'CLOSE ASSET TBL ERROR - CALL HELP DESK'                     
LRM012                          TO WK-DB2-ERROR                                 
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0010*                                                                         
ET0010*---------------------------------------------------------------*         
ET0010*      INITIAL TRANSFER CURSOR AREA FOR ALL ACCOUNT RECLAIMS    *         
ET0010*---------------------------------------------------------------*         
ET0010 5630-OPEN-INITRN-ALL-FRVS.                                               
           SET ACAT13-OPN-INITRN-FRV TO TRUE.                                   
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
                                                                                
           IF ACAT13-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE 'DB2 OPEN ERROR ON INITRN_CSR TABLE - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
ET0010 5640-FETCH-INITRN-ALL-FRVS.                                              
           MOVE SPACE TO WS-TFR-INIT-FOUND-SW                                   
                         WS-NO-MORE-TRNFR-SW.                                   
                                                                                
           SET ACAT13-FET-INITRN-FRV TO TRUE.                                   
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
                                                                                
           IF ACAT13-NORMAL                                                     
              SET WS-TFR-INIT-FOUND TO TRUE                                     
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              SET WS-NO-MORE-TRNFR TO TRUE                                      
           ELSE                                                                 
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012         'DB2 FETCH ERROR ON INITRN_CSR TABLE - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
ET0010 5650-CLOSE-INITRN-ALL-FRVS.                                              
           SET ACAT13-CLO-INITRN-FRV TO TRUE.                                   
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012        'DB2 CLOSE ERROR ON INITRN_CSR TABLE - CALL HELP DESK'            
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0010*                                                                         
ET0010*---------------------------------------------------------------*         
ET0010*   INIT TRANSFER CURSOR AREA FOR ALL ACCT FRVS IN DESCEND ORDR *         
ET0010*---------------------------------------------------------------*         
ET0010 5660-OPEN-INITRN-ALL-FRVS-DES.                                           
           SET ACAT13-OPN-INITRN-FRV-D TO TRUE.                                 
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
                                                                                
           IF ACAT13-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012        'DB2 OPEN ERROR ON INITRN_CSR_D TABLE - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
ET0010 5670-FETCH-INITRN-ALL-FRVS-DES.                                          
           MOVE SPACE TO WS-TFR-INIT-FOUND-SW                                   
                         WS-NO-MORE-TRNFR-SW.                                   
                                                                                
           SET ACAT13-FET-INITRN-FRV-D TO TRUE.                                 
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
                                                                                
           IF ACAT13-NORMAL                                                     
              SET WS-TFR-INIT-FOUND TO TRUE                                     
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              SET WS-NO-MORE-TRNFR TO TRUE                                      
           ELSE                                                                 
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012        'DB2 FETCH ERROR ON INITRN_CSR_D TABLE - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
ET0010 5680-CLOSE-INITRN-ALL-FRVS-DES.                                          
           SET ACAT13-CLO-INITRN-FRV-D TO TRUE.                                 
           PERFORM 7600-LINK-TO-ACAT13DB.                                       
           IF ACAT13-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM012        MOVE                                                              
LRM012        'DB2 CLOSE ERROR ON INITRN_CSR_D TABLE - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT13-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0010*                                                                         
ET0010*---------------------------------------------------------------*         
ET0010*   PF4: GET ALL NEWLY ENTERED FAIL REVERSALS FROM INIT TRNFR   *         
ET0010*---------------------------------------------------------------*         
ET0010 5800-SRCH-ALL-NEW-FRVS.                                                  
           PERFORM 2010-CLEAR-SCR.                                              
                                                                                
           MOVE SPACE TO WS-TFR-INIT-FOUND-SW.                                  
                                                                                
           PERFORM 5630-OPEN-INITRN-ALL-FRVS.                                   
           IF ACAT13-NORMAL                                                     
              SET TWA-SRCH-ALL-FRVS TO TRUE                                     
              SET TWA-TFR-UPDATE    TO TRUE                                     
           END-IF.                                                              
                                                                                
           PERFORM 5640-FETCH-INITRN-ALL-FRVS.                                  
           IF ACAT13-NORMAL                                                     
              SET WS-TFR-INIT-FOUND TO TRUE                                     
              PERFORM 3109-TRNF-INIT-TO-TWA                                     
              PERFORM 7210-DELETE-INIT-ASSET-TSQ                                
              PERFORM 3110-OPEN-ASSET-INIT                                      
              IF WS-ASSET-INIT-FOUND                                            
                 INITIALIZE TS-INI-ASSET-AREA                                   
                 MOVE SPACE TO WS-NO-MORE-DATA-SW                               
                 MOVE 0     TO SUB                                              
                 PERFORM 3600-SAVE-INI-ASSET-IN-TS  THRU 3600-EXIT              
                     UNTIL WS-NO-MORE-DATA                                      
                 IF SUB > 0                                                     
                    PERFORM 7220-WRITE-INIT-ASSET-TSQ                           
                    ADD 1 TO TWA-MAX-PAGE-INI                                   
                 END-IF                                                         
              END-IF                                                            
              PERFORM 3130-CLOSE-ASSET-INIT                                     
              PERFORM 2200-SETUP-NEW THRU 2200-EXIT                             
              MOVE '1'          TO TWA-FIRST-ENTER-RTN                          
              MOVE TWA-MAP-BR   TO TWA-MAP-KEY-BR                               
              MOVE TWA-MAP-AC   TO TWA-MAP-KEY-AC                               
              PERFORM 1000-ENTER-KEY                                            
           ELSE                                                                 
           IF ACAT13-NOT-FOUND                                                  
              MOVE SPACE TO TWA-SRCH-ALL-FRVS-SW                                
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'NEW FAIL REVERSALS NOT FOUND'                               
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *      PA1: NEXT PAGE ROUTINE                                   *         
      *---------------------------------------------------------------*         
       6000-NEXT-PAGE.                                                          
           IF TWA-TFR-NEW OR TWA-TFR-INQUIRY                                    
              IF TWA-MAX-PAGE-HST = 0                                           
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE                                                        
                    'PA1 KEY NOT AVAILABLE - NO SECURITY ASSETS FOUND'          
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              ELSE                                                              
              IF TWA-PAGE-NUM = TWA-MAX-PAGE-HST                                
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'BOTTOM PAGE ASSET DATA' TO SYSTEM-MSG                 
                 END-IF                                                         
              ELSE                                                              
                 ADD +1 TO TWA-PAGE-NUM                                         
                 MOVE TWA-PAGE-NUM TO WS-HST-ITEM                               
                 PERFORM 7100-READ-HIST-ASSET-TSQ                               
                 PERFORM 6200-CLEAR-SCROLL-MAP                                  
                 PERFORM 6300-SETUP-ASSET-MAP-AREA                              
              END-IF.                                                           
           IF TWA-TFR-UPDATE                                                    
              IF TWA-MAX-PAGE-INI = 0                                           
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE                                                        
                    'PA1 KEY NOT AVAILABLE - NO SECURITY ASSETS FOUND'          
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              ELSE                                                              
              IF TWA-PAGE-NUM = TWA-MAX-PAGE-INI                                
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'BOTTOM PAGE ASSET DATA' TO SYSTEM-MSG                 
                 END-IF                                                         
              ELSE                                                              
                 ADD +1 TO TWA-PAGE-NUM                                         
                 MOVE TWA-PAGE-NUM TO WS-INI-ITEM                               
                 PERFORM 7200-READ-INIT-ASSET-TSQ                               
                 PERFORM 6200-CLEAR-SCROLL-MAP                                  
                 PERFORM 6300-SETUP-ASSET-MAP-AREA                              
              END-IF.                                                           
           IF TWA-TFR-UPDATE-IND = SPACE OR LOW-VALUE                           
              SET WK-ERROR TO TRUE                                              
              MOVE 'BOTTOM PAGE ASSET DATA' TO SYSTEM-MSG.                      
           IF TWA-TFR-INQUIRY                                                   
              MOVE -1 TO MNEXTL                                                 
           ELSE                                                                 
              MOVE -1 TO MBRL.                                                  
           PERFORM  7020-WRITE-TSQ-RTN.                                         
           PERFORM  8100-SEND-MAP-DATA-ONLY.                                    
           PERFORM  8800-RETURN-TO-CICS.                                        
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *      PA2: PREVIOUSE PAGE ROUTINE                              *         
      *---------------------------------------------------------------*         
       6100-PREV-PAGE.                                                          
           IF TWA-TFR-UPDATE-IND = SPACE OR LOW-VALUE                           
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'TOP PAGE ASSET DATA' TO SYSTEM-MSG                       
              END-IF                                                            
           ELSE                                                                 
           IF TWA-PAGE-NUM = +1                                                 
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'TOP PAGE ASSET DATA' TO SYSTEM-MSG                       
              END-IF                                                            
           ELSE                                                                 
           IF TWA-TFR-NEW OR TWA-TFR-INQUIRY                                    
              COMPUTE TWA-PAGE-NUM = TWA-PAGE-NUM - 1                           
              MOVE TWA-PAGE-NUM TO WS-HST-ITEM                                  
              PERFORM 7100-READ-HIST-ASSET-TSQ                                  
              PERFORM 6200-CLEAR-SCROLL-MAP                                     
              PERFORM 6300-SETUP-ASSET-MAP-AREA                                 
           ELSE                                                                 
           IF TWA-TFR-UPDATE                                                    
              COMPUTE TWA-PAGE-NUM = TWA-PAGE-NUM - 1                           
              MOVE TWA-PAGE-NUM TO WS-INI-ITEM                                  
              PERFORM 7200-READ-INIT-ASSET-TSQ                                  
              PERFORM 6200-CLEAR-SCROLL-MAP                                     
              PERFORM 6300-SETUP-ASSET-MAP-AREA                                 
           END-IF.                                                              
           IF TWA-TFR-INQUIRY                                                   
              MOVE -1 TO MNEXTL                                                 
           ELSE                                                                 
              MOVE -1 TO MBRL.                                                  
           PERFORM  7020-WRITE-TSQ-RTN.                                         
           PERFORM  8100-SEND-MAP-DATA-ONLY.                                    
           PERFORM  8800-RETURN-TO-CICS.                                        
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *      CLEAR MAP FOR THE SCROLLING PAGES                        *         
      *---------------------------------------------------------------*         
       6200-CLEAR-SCROLL-MAP.                                                   
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 2                        
             MOVE SPACE     TO MSECR-O  (SUB)                                   
                               MCATGR-O (SUB)                                   
                               MSLOC-O  (SUB)                                   
                               MTYPE-O  (SUB)                                   
                               MDESC1-O (SUB)                                   
                               MDESC2-O (SUB)                                   
                               MQTY-I   (SUB)                                   
                               MRSON-O  (SUB)                                   
                               MRCLM-O  (SUB)                                   
ET0003                         MTAG-O   (SUB)                                   
                               TWA-MAP-ASSET (SUB)                              
             MOVE ATT-ASKIP TO MRSON-A (SUB)                                    
                               MRCLM-A (SUB)                                    
ET0003                         MTAG-A  (SUB)                                    
           END-PERFORM.                                                         
           MOVE SPACE  TO MNEXTO                                                
                          MSUBO                                                 
                          MDELO.                                                
           IF TWA-TFR-INQUIRY                                                   
              MOVE ATT-ASKIP TO MSUBA MDELA.                                    
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *      SETUP MAP FOR THE SCROLLING PAGES                        *         
      *---------------------------------------------------------------*         
       6300-SETUP-ASSET-MAP-AREA.                                               
           IF TWA-TFR-NEW OR TWA-TFR-INQUIRY                                    
              PERFORM VARYING SUB FROM 1 BY 1                                   
                              UNTIL SUB > 2                                     
ET0005           IF TS-HST-QTY-ORIG (SUB) NOT = ZERO                            
ET0005              IF TS-HST-SECUR (SUB) > SPACE                               
ET0005                 MOVE TS-HST-SECUR (SUB)                                  
ET0005                   TO MSECR-O (SUB) TWA-MAP-SECR (SUB)                    
ET0005              ELSE                                                        
ET0005              IF TS-HST-ADP-NBR (SUB) > SPACE                             
ET0005                 MOVE TS-HST-ADP-NBR (SUB)                                
ET0005                   TO MSECR-O (SUB) TWA-MAP-ADP-NBR (SUB)                 
ET0005              ELSE                                                        
ET0005                 MOVE SPACE TO MSECR-O (SUB) TWA-MAP-SECR    (SUB)        
ET0005                                             TWA-MAP-ADP-NBR (SUB)        
ET0005                 SET WK-MSG-ON TO TRUE                                    
ET0005                 MOVE NO-CUSIP-MESSAGE  TO SYSTEM-MSG                     
ET0005              END-IF                                                      
ET0005              END-IF                                                      
                    MOVE TS-HST-CTGRY    (SUB) TO MCATGR-O      (SUB)           
                                                  TWA-MAP-CATGR (SUB)           
                    MOVE TS-HST-STTL-LOC (SUB) TO MSLOC-O       (SUB)           
                                                  TWA-MAP-SLOC  (SUB)           
                    MOVE TS-HST-TYPE     (SUB) TO MTYPE-O       (SUB)           
                                                  TWA-MAP-TYPE  (SUB)           
                    MOVE TS-HST-DESC     (SUB) TO WS-DESC                       
                    MOVE WS-DESC1              TO MDESC1-O      (SUB)           
                                                  TWA-MAP-DESC1 (SUB)           
                    MOVE WS-DESC2              TO MDESC2-O      (SUB)           
                                                  TWA-MAP-DESC2 (SUB)           
                    MOVE TS-HST-REASON   (SUB) TO MRSON-O       (SUB)           
                                                  TWA-MAP-RSON  (SUB)           
ET0003              MOVE TS-HST-TAG      (SUB) TO MTAG-O        (SUB)           
ET0003                                            TWA-MAP-TAG   (SUB)           
                    IF TWA-TFR-INQUIRY OR TS-HST-RCLMED (SUB) = 'Y'             
                       MOVE TS-HST-RCLMED (SUB)                                 
                         TO MRCLM-O (SUB) TWA-MAP-RCLM (SUB)                    
                                          TWA-MAP-RCLMED (SUB)                  
                    ELSE                                                        
                       MOVE TS-HST-RCLM-IND (SUB)                               
                         TO MRCLM-O (SUB) TWA-MAP-RCLM (SUB)                    
                    END-IF                                                      
                    IF TS-HST-PSTN-CD (SUB) = 'S'                               
                       MULTIPLY TS-HST-QTY-ORIG (SUB) BY -1                     
                                        GIVING WS-QTY                           
                       MOVE WS-QTY                TO MQTY-O      (SUB)          
                       MOVE MQTY-I          (SUB) TO TWA-MAP-QTY (SUB)          
                    ELSE                                                        
                       MOVE TS-HST-QTY-ORIG (SUB) TO MQTY-O      (SUB)          
                       MOVE MQTY-I          (SUB) TO TWA-MAP-QTY (SUB)          
                    END-IF                                                      
                    IF TWA-TFR-INQUIRY OR TS-HST-RCLMED (SUB) = 'Y'             
                       MOVE ATT-ASKIP  TO MRSON-A (SUB) MRCLM-A (SUB)           
ET0003                                    MTAG-A  (SUB)                         
                    ELSE                                                        
                       MOVE ATT-UNPROT TO MRSON-A (SUB) MRCLM-A (SUB)           
ET0003                                    MTAG-A  (SUB)                         
                    END-IF                                                      
                 END-IF                                                         
              END-PERFORM                                                       
           END-IF.                                                              
           IF TWA-TFR-UPDATE                                                    
              PERFORM VARYING SUB FROM 1 BY 1  UNTIL SUB > 2                    
ET0005           IF TS-INI-QTY-RCLM (SUB) NOT = ZERO                            
ET0005              IF TS-INI-SECUR (SUB) > SPACE                               
ET0005                 MOVE TS-INI-SECUR (SUB)                                  
ET0005                   TO MSECR-O (SUB) TWA-MAP-SECR (SUB)                    
ET0005              ELSE                                                        
ET0005              IF TS-INI-ADP-NBR (SUB) > SPACE                             
ET0005                 MOVE TS-INI-ADP-NBR (SUB)                                
ET0005                   TO MSECR-O (SUB) TWA-MAP-ADP-NBR (SUB)                 
ET0005              ELSE                                                        
ET0005                 MOVE SPACE TO MSECR-O (SUB) TWA-MAP-SECR    (SUB)        
ET0005                                             TWA-MAP-ADP-NBR (SUB)        
ET0005                 SET WK-MSG-ON TO TRUE                                    
ET0005                 MOVE NO-CUSIP-MESSAGE  TO SYSTEM-MSG                     
ET0005              END-IF                                                      
ET0005              END-IF                                                      
                    MOVE TS-INI-CTGRY    (SUB) TO MCATGR-O      (SUB)           
                                                  TWA-MAP-CATGR (SUB)           
                    MOVE TS-INI-STTL-LOC (SUB) TO MSLOC-O       (SUB)           
                                                  TWA-MAP-SLOC  (SUB)           
                    MOVE TS-INI-TYPE     (SUB) TO MTYPE-O       (SUB)           
                                                  TWA-MAP-TYPE  (SUB)           
                    MOVE TS-INI-DESC     (SUB) TO WS-DESC                       
                    MOVE WS-DESC1              TO MDESC1-O      (SUB)           
                                                  TWA-MAP-DESC1 (SUB)           
                    MOVE WS-DESC2              TO MDESC2-O      (SUB)           
                                                  TWA-MAP-DESC2 (SUB)           
                    MOVE TS-INI-REASON   (SUB) TO MRSON-O       (SUB)           
                                                  TWA-MAP-RSON  (SUB)           
                    MOVE TS-INI-RCLM-IND (SUB) TO MRCLM-O       (SUB)           
                                                  TWA-MAP-RCLM  (SUB)           
ET0003              MOVE TS-INI-TAG      (SUB) TO MTAG-O        (SUB)           
ET0003                                            TWA-MAP-TAG   (SUB)           
                    IF TS-INI-PSTN-CD (SUB) = 'S'                               
                       MULTIPLY TS-INI-QTY-RCLM (SUB) BY -1                     
                                        GIVING WS-QTY                           
                       MOVE WS-QTY                TO MQTY-O      (SUB)          
                       MOVE MQTY-I          (SUB) TO TWA-MAP-QTY (SUB)          
                    ELSE                                                        
                       MOVE TS-INI-QTY-RCLM (SUB) TO MQTY-O      (SUB)          
                       MOVE MQTY-I          (SUB) TO TWA-MAP-QTY (SUB)          
                    END-IF                                                      
                 END-IF                                                         
              END-PERFORM                                                       
           END-IF.                                                              
       EJECT                                                                    
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*    PF7:  TRANSFER PREVIOUSE PAGE                              *         
ET0001*---------------------------------------------------------------*         
ET0001 6500-PREV-PAGE-TIF.                                                      
ET0008**   IF NOT TWA-TFR-NEW                                                   
           IF TWA-TFR-INQUIRY                                                   
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'PF7 KEY DISABLED AT THIS TIME'                              
              TO  SYSTEM-MSG                                                    
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE ACAT-ADP-BROKER  TO ACAT13-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR TO WS-PASS-BR.                                       
           MOVE TWA-MAP-AC TO WS-PASS-ACCT.                                     
           MOVE ALL '%'    TO WS-PASS-ACCT-MASK.                                
           MOVE WS-PASS-ACCT-DLV TO ACAT13-PASS-ACCT-DLV.                       
                                                                                
ET0008     IF TWA-TFR-NEW                                                       
ET0008        PERFORM 6510-PF7-FROM-HISTORY-TBL                                 
ET0008     END-IF.                                                              
ET0008     IF TWA-TFR-UPDATE                                                    
ET0010        IF TWA-SRCH-ALL-FRVS                                              
ET0010           PERFORM 6530-PF7-FOR-ALL-INIT-FRVS                             
ET0010        ELSE                                                              
ET0008           PERFORM 6520-PF7-FROM-INITIAL-TBL                              
ET0010        END-IF                                                            
ET0010     END-IF.                                                              
                                                                                
           MOVE -1 TO MBRL.                                                     
           PERFORM  7020-WRITE-TSQ-RTN.                                         
           PERFORM  8100-SEND-MAP-DATA-ONLY.                                    
           PERFORM  8800-RETURN-TO-CICS.                                        
       EJECT                                                                    
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*   PF7 FOR TWA-TFR-NEW MODE : TO CREATE NEW FRV.               *         
ET0008*   (DATA FETCH FROM HISTORY TRANSFER TABLE)                    *         
ET0008*---------------------------------------------------------------*         
ET0008 6510-PF7-FROM-HISTORY-TBL.                                               
           PERFORM 2940-OPEN-TRNFR-HIST-DESC.                                   
                                                                                
           MOVE SPACE TO WS-PREV-PAGE-FOUND-SW.                                 
           PERFORM UNTIL WS-PREV-PAGE-FOUND OR WS-NO-MORE-DATA                  
              PERFORM 2950-FETCH-TRNFR-HIST-DESC                                
              IF WS-TFR-HIST-FOUND                                              
                 IF ACAT13-TFR-ACAT < TWA-ACAT                                  
                    SET WS-PREV-PAGE-FOUND TO TRUE                              
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           IF WS-NO-MORE-DATA                                                   
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'TOP PAGE ACCOUNT DATA' TO SYSTEM-MSG                     
              END-IF                                                            
           ELSE                                                                 
              PERFORM 2970-TRNF-HIST-TO-TWA                                     
              PERFORM 6700-SETUP-ASSET-DATA                                     
           END-IF.                                                              
                                                                                
       EJECT                                                                    
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*   PF7 FOR TWA-TFR-UPDATE MODE: TO UPDATE(DELETE) FRV.         *         
ET0008*   (DATA FETCH FROM INITIAL TRANSFER TABLE)                    *         
ET0008*---------------------------------------------------------------*         
ET0008 6520-PF7-FROM-INITIAL-TBL.                                               
           PERFORM 3105-OPEN-TRNFR-INIT-DESC.                                   
                                                                                
           MOVE SPACE TO WS-PREV-PAGE-FOUND-SW.                                 
           PERFORM UNTIL WS-PREV-PAGE-FOUND OR WS-NO-MORE-DATA                  
              PERFORM 3106-FETCH-TRNFR-INIT-DESC                                
              IF WS-TFR-INIT-FOUND                                              
                 IF ACAT13-TFR-ACAT < TWA-ADP-CONTROL-NBR                       
                    SET WS-PREV-PAGE-FOUND TO TRUE                              
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 3107-CLOSE-TRNFR-INIT-DESC.                                  
                                                                                
           IF WS-NO-MORE-DATA                                                   
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'TOP PAGE ACCOUNT DATA' TO SYSTEM-MSG                     
              END-IF                                                            
           ELSE                                                                 
              PERFORM 3109-TRNF-INIT-TO-TWA                                     
              PERFORM 6710-SETUP-INIT-ASSET                                     
           END-IF.                                                              
       EJECT                                                                    
ET0010*                                                                         
ET0010*---------------------------------------------------------------*         
ET0010*  PF7 FOR TWA-TFR-UPDATE MODE: TO UPDATE(DELETE) FRV TRANSFER  *         
ET0010*                                                               *         
ET0010*   (RETRIEVE ALL FAIL REVERSALS FROM INIT TRANSFER TABLE)      *         
ET0010*---------------------------------------------------------------*         
ET0010 6530-PF7-FOR-ALL-INIT-FRVS.                                              
           PERFORM 5660-OPEN-INITRN-ALL-FRVS-DES.                               
                                                                                
           MOVE SPACE TO WS-PREV-PAGE-FOUND-SW.                                 
           PERFORM UNTIL WS-PREV-PAGE-FOUND OR WS-NO-MORE-TRNFR                 
              PERFORM 5670-FETCH-INITRN-ALL-FRVS-DES                            
              IF WS-TFR-INIT-FOUND                                              
                 MOVE ACAT13-TFR-DLVR-ACCT   TO WS-NEXT-DLVR-ACCT-KEY           
                 MOVE ACAT13-TFR-RCV-ACCT    TO WS-NEXT-RCV-ACCT-KEY            
                 MOVE ACAT13-TFR-ACAT        TO WS-NEXT-ADP-ACAT-KEY            
                 MOVE TWA-DLVR-ACCT          TO WS-CURR-DLVR-ACCT-KEY           
                 MOVE TWA-MAP-CACCT          TO WS-CURR-RCV-ACCT-KEY            
                 MOVE TWA-ADP-CONTROL-NBR    TO WS-CURR-ADP-ACAT-KEY            
                 IF WS-NEXT-INITRN-KEY < WS-CURR-INITRN-KEY                     
                    SET WS-PREV-PAGE-FOUND TO TRUE                              
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 5680-CLOSE-INITRN-ALL-FRVS-DES.                              
                                                                                
           IF WS-NO-MORE-TRNFR                                                  
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'TOP PAGE ACCOUNT DATA' TO SYSTEM-MSG                     
              END-IF                                                            
           ELSE                                                                 
              PERFORM 3109-TRNF-INIT-TO-TWA                                     
              PERFORM 6710-SETUP-INIT-ASSET                                     
              MOVE TWA-MAP-BR  TO TWA-MAP-KEY-BR                                
              MOVE TWA-MAP-AC  TO TWA-MAP-KEY-AC                                
           END-IF.                                                              
       EJECT                                                                    
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*    PF8:  TRANSFER NEXT PAGE                                   *         
ET0001*---------------------------------------------------------------*         
ET0001 6600-NEXT-PAGE-TIF.                                                      
ET0008**   IF NOT TWA-TFR-NEW                                                   
           IF TWA-TFR-INQUIRY                                                   
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'PF8 KEY DISABLED AT THIS TIME'                              
              TO  SYSTEM-MSG                                                    
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE ACAT-ADP-BROKER  TO ACAT13-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR TO WS-PASS-BR.                                       
           MOVE TWA-MAP-AC TO WS-PASS-ACCT.                                     
           MOVE ALL '%'    TO WS-PASS-ACCT-MASK.                                
           MOVE WS-PASS-ACCT-DLV TO ACAT13-PASS-ACCT-DLV.                       
                                                                                
ET0008     IF TWA-TFR-NEW                                                       
ET0008        PERFORM 6610-PF8-FROM-HISTORY-TBL                                 
ET0008     END-IF.                                                              
ET0008     IF TWA-TFR-UPDATE                                                    
ET0010        IF TWA-SRCH-ALL-FRVS                                              
ET0010           PERFORM 6630-PF8-FOR-ALL-INIT-FRVS                             
ET0010        ELSE                                                              
ET0008           PERFORM 6620-PF8-FROM-INITIAL-TBL                              
ET0010        END-IF                                                            
ET0008     END-IF.                                                              
                                                                                
           MOVE -1 TO MBRL.                                                     
           PERFORM  7020-WRITE-TSQ-RTN.                                         
           PERFORM  8100-SEND-MAP-DATA-ONLY.                                    
           PERFORM  8800-RETURN-TO-CICS.                                        
       EJECT                                                                    
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*   PF8 FOR TWA-TFR-NEW MODE : TO CREATE NEW FRV.               *         
ET0008*   (DATA FETCH FROM HISTORY TRANSFER TABLE)                    *         
ET0008*---------------------------------------------------------------*         
ET0008 6610-PF8-FROM-HISTORY-TBL.                                               
           PERFORM 2900-OPEN-TRNFR-HIST.                                        
                                                                                
           MOVE SPACE TO WS-NEXT-PAGE-FOUND-SW.                                 
           PERFORM UNTIL WS-NEXT-PAGE-FOUND OR WS-NO-MORE-DATA                  
              PERFORM 2910-FETCH-TRNFR-HIST                                     
              IF WS-TFR-HIST-FOUND                                              
                 IF ACAT13-TFR-ACAT > TWA-ACAT                                  
                    SET WS-NEXT-PAGE-FOUND TO TRUE                              
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 2920-CLOSE-TRNFR-HIST.                                       
                                                                                
           IF WS-NO-MORE-DATA                                                   
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'BOTTOM PAGE ACCOUNT DATA' TO SYSTEM-MSG                  
              END-IF                                                            
           ELSE                                                                 
              PERFORM 2970-TRNF-HIST-TO-TWA                                     
              PERFORM 6700-SETUP-ASSET-DATA                                     
           END-IF.                                                              
       EJECT                                                                    
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*   PF8 FOR TWA-TFR-UPDATE MODE: TO UPDATE(DELETE) FRV.         *         
ET0008*   (DATA FETCH FROM INITIAL TRANSFER TABLE)                    *         
ET0008*---------------------------------------------------------------*         
ET0008 6620-PF8-FROM-INITIAL-TBL.                                               
           PERFORM 3102-OPEN-TRNFR-INIT.                                        
                                                                                
           MOVE SPACE TO WS-NEXT-PAGE-FOUND-SW.                                 
           PERFORM UNTIL WS-NEXT-PAGE-FOUND OR WS-NO-MORE-DATA                  
              PERFORM 3103-FETCH-TRNFR-INIT                                     
              IF WS-TFR-INIT-FOUND                                              
                 IF ACAT13-TFR-ACAT > TWA-ADP-CONTROL-NBR                       
                    SET WS-NEXT-PAGE-FOUND TO TRUE                              
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 3104-CLOSE-TRNFR-INIT.                                       
                                                                                
           IF WS-NO-MORE-DATA                                                   
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'BOTTOM PAGE ACCOUNT DATA' TO SYSTEM-MSG                  
              END-IF                                                            
           ELSE                                                                 
              PERFORM 3109-TRNF-INIT-TO-TWA                                     
              PERFORM 6710-SETUP-INIT-ASSET                                     
           END-IF.                                                              
       EJECT                                                                    
ET0010*                                                                         
ET0010*---------------------------------------------------------------*         
ET0010*   PF8 FOR TWA-TFR-UPDATE MODE: TO UPDATE(DELETE) FRV.         *         
ET0010*                                                               *         
ET0010*   (RETRIEVE ALL FAIL REVERSALS FROM INIT TRANSFER TABLE)      *         
ET0010*---------------------------------------------------------------*         
ET0010 6630-PF8-FOR-ALL-INIT-FRVS.                                              
           PERFORM 5630-OPEN-INITRN-ALL-FRVS.                                   
                                                                                
           MOVE SPACE TO WS-NEXT-PAGE-FOUND-SW.                                 
           PERFORM UNTIL WS-NEXT-PAGE-FOUND OR WS-NO-MORE-TRNFR                 
              PERFORM 5640-FETCH-INITRN-ALL-FRVS                                
              IF WS-TFR-INIT-FOUND                                              
                 MOVE ACAT13-TFR-DLVR-ACCT   TO WS-NEXT-DLVR-ACCT-KEY           
                 MOVE ACAT13-TFR-RCV-ACCT    TO WS-NEXT-RCV-ACCT-KEY            
                 MOVE ACAT13-TFR-ACAT        TO WS-NEXT-ADP-ACAT-KEY            
                 MOVE TWA-DLVR-ACCT          TO WS-CURR-DLVR-ACCT-KEY           
                 MOVE TWA-MAP-CACCT          TO WS-CURR-RCV-ACCT-KEY            
                 MOVE TWA-ADP-CONTROL-NBR    TO WS-CURR-ADP-ACAT-KEY            
                 IF WS-NEXT-INITRN-KEY > WS-CURR-INITRN-KEY                     
                    SET WS-NEXT-PAGE-FOUND TO TRUE                              
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 5650-CLOSE-INITRN-ALL-FRVS.                                  
                                                                                
           IF WS-NO-MORE-TRNFR                                                  
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'BOTTOM PAGE ACCOUNT DATA' TO SYSTEM-MSG                  
              END-IF                                                            
           ELSE                                                                 
              PERFORM 3109-TRNF-INIT-TO-TWA                                     
              PERFORM 6710-SETUP-INIT-ASSET                                     
              MOVE TWA-MAP-BR  TO TWA-MAP-KEY-BR                                
              MOVE TWA-MAP-AC  TO TWA-MAP-KEY-AC                                
           END-IF.                                                              
       EJECT                                                                    
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*    FOR PF7 OR PF8 KEY                                         *         
ET0001*      - CREATE HISTORY ASSET TEMP STORAGE                      *         
ET0001*      - SET UP SCREEN DATA FOR ASSET                           *         
ET0001*---------------------------------------------------------------*         
ET0001 6700-SETUP-ASSET-DATA.                                                   
           MOVE SPACE TO WS-FAIL-ASSET-FOUND-SW.                                
           PERFORM 3010-OPEN-ASSET-HIST.                                        
           IF WS-ASSET-HIST-FOUND                                               
ET0009        PERFORM 2120-CREATE-FRV-TABLE                                     
              PERFORM 7110-DELETE-HIST-ASSET-TSQ                                
              MOVE 0     TO TWA-MAX-PAGE-HST                                    
              INITIALIZE TS-HST-ASSET-AREA                                      
              MOVE SPACE TO TWA-MAP-SUB TWA-MAP-DEL                             
              MOVE SPACE TO WS-NO-MORE-DATA-SW                                  
              MOVE 0     TO SUB                                                 
              PERFORM  3500-SAVE-HST-ASSET-IN-TS THRU 3500-EXIT                 
                   UNTIL WS-NO-MORE-DATA                                        
              IF SUB > 0                                                        
                 PERFORM 7120-WRITE-HIST-ASSET-TSQ                              
                 ADD 1 TO TWA-MAX-PAGE-HST                                      
              END-IF                                                            
              IF TWA-MAX-PAGE-HST > 0                                           
                 SET WS-FAIL-ASSET-FOUND TO TRUE                                
              END-IF                                                            
              PERFORM 3030-CLOSE-ASSET-HIST                                     
              PERFORM 2010-CLEAR-SCR                                            
ET0004        MOVE SPACE  TO SRCHTAGO  TWA-SRCH-TAG-AREA                        
              PERFORM 2300-FROM-TFR                                             
              IF WS-FAIL-ASSET-FOUND                                            
                 MOVE +1 TO TWA-PAGE-NUM                                        
                            WS-HST-ITEM                                         
                 PERFORM 2315-FROM-HIST-TS                                      
              ELSE                                                              
                 MOVE 0 TO TWA-PAGE-NUM                                         
                 SET WK-MSG-ON TO TRUE                                          
LRM013           IF WS-ACTIVE-FRV-ASSET-COUNT > 0                               
LRM013             MOVE 'ALL ELIGIBLE ASSETS FOUND ON ACTIVE TRANSFERS'         
LRM013              TO SYSTEM-MSG                                               
LRM013           ELSE                                                           
                  MOVE 'NO ASSETS FOUND FOR THE REQUESTED ACCOUNT'              
                   TO  SYSTEM-MSG                                               
LRM013           END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              MOVE 0 TO TWA-PAGE-NUM                                            
              SET WK-MSG-ON TO TRUE                                             
LRM013        IF WS-ACTIVE-FRV-ASSET-COUNT > 0                                  
LRM013           MOVE 'ALL ELIGIBLE ASSETS FOUND ON ACTIVE TRANSFERS'           
LRM013             TO SYSTEM-MSG                                                
LRM013        ELSE                                                              
               MOVE 'NO ASSETS FOUND FOR THE REQUESTED ACCOUNT'                 
                TO  SYSTEM-MSG                                                  
LRM013        END-IF                                                            
           END-IF.                                                              
       EJECT                                                                    
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*    FOR TWA-TFR-UPDATE MODE PF7 OR PF8 KEY                     *         
ET0008*      - CREATE INITIAL ASSET TEMP STORAGE                      *         
ET0008*      - SET UP SCREEN DATA FOR ASSET                           *         
ET0008*---------------------------------------------------------------*         
ET0008 6710-SETUP-INIT-ASSET.                                                   
           MOVE SPACE TO WS-FAIL-ASSET-FOUND-SW.                                
           PERFORM 3110-OPEN-ASSET-INIT.                                        
           IF WS-ASSET-INIT-FOUND                                               
              PERFORM 7210-DELETE-INIT-ASSET-TSQ                                
              MOVE 0     TO TWA-MAX-PAGE-INI                                    
              INITIALIZE TS-INI-ASSET-AREA                                      
              MOVE SPACE TO TWA-MAP-SUB TWA-MAP-DEL                             
              MOVE SPACE TO WS-NO-MORE-DATA-SW                                  
              MOVE 0     TO SUB                                                 
              PERFORM 3600-SAVE-INI-ASSET-IN-TS THRU 3600-EXIT                  
                  UNTIL WS-NO-MORE-DATA                                         
              IF SUB > 0                                                        
                 PERFORM 7220-WRITE-INIT-ASSET-TSQ                              
                 ADD 1 TO TWA-MAX-PAGE-INI                                      
              END-IF                                                            
              IF TWA-MAX-PAGE-INI > 0                                           
                 SET WS-FAIL-ASSET-FOUND TO TRUE                                
              END-IF                                                            
              PERFORM 3130-CLOSE-ASSET-INIT                                     
              PERFORM 2010-CLEAR-SCR                                            
              MOVE SPACE  TO SRCHTAGO  TWA-SRCH-TAG-AREA                        
              PERFORM 2300-FROM-TFR                                             
              IF WS-FAIL-ASSET-FOUND                                            
                 MOVE +1 TO TWA-PAGE-NUM                                        
                            WS-HST-ITEM                                         
                 PERFORM 2325-FROM-INIT-TS                                      
              ELSE                                                              
                 MOVE 0 TO TWA-PAGE-NUM                                         
                 SET WK-MSG-ON TO TRUE                                          
LRM013           IF WS-ACTIVE-FRV-ASSET-COUNT > 0                               
LRM013            MOVE 'ALL ELIGIBLE ASSETS FOUND ON ACTIVE TRANSFERS'          
LRM013             TO SYSTEM-MSG                                                
LRM013           ELSE                                                           
                  MOVE 'NO ASSETS FOUND FOR THE REQUESTED ACCOUNT'              
                   TO  SYSTEM-MSG                                               
LRM013           END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              MOVE 0 TO TWA-PAGE-NUM                                            
              SET WK-MSG-ON TO TRUE                                             
LRM013        IF WS-ACTIVE-FRV-ASSET-COUNT > 0                                  
LRM013         MOVE 'ALL ELIGIBLE ASSETS FOUND ON ACTIVE TRANSFERS'             
LRM013          TO SYSTEM-MSG                                                   
LRM013        ELSE                                                              
               MOVE 'NO ASSETS FOUND FOR THE REQUESTED ACCOUNT'                 
                TO  SYSTEM-MSG                                                  
LRM013        END-IF                                                            
           END-IF.                                                              
      *                                                                         
      *-------------------------------------------------------------*           
      *           TS QUEUE FOR TWA AREA                             *           
      *-------------------------------------------------------------*           
       7000-READ-TSQ-RTN.                                                       
           MOVE '13IF'   TO TRAN-ID.                                            
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                                   
                              INTO(TWA-AREA)                                    
                              LENGTH(LENGTH OF TWA-AREA)                        
                              ITEM(ITEM-NUM)                                    
           END-EXEC.                                                            
           IF (EIBRESP NOT = +0)                                                
           AND (NOT FIRST-TIME)                                                 
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE 'ACAT13IF READ TSQ ERROR'                                    
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
       7010-DELETE-TSQ-RTN.                                                     
           MOVE '13IF'   TO TRAN-ID.                                            
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                                 
           END-EXEC.                                                            
                                                                                
       7020-WRITE-TSQ-RTN.                                                      
           MOVE '13IF'   TO TRAN-ID.                                            
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                                  
                               FROM(TWA-AREA)                                   
                               LENGTH(LENGTH OF TWA-AREA)                       
                               ITEM(ITEM-NUM)                                   
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE 'ACAT13IF WRITE TSQ ERROR'                                   
                TO SYSTEM-MSG                                                   
ET0001**      PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *-------------------------------------------------------------*           
      *           TS QUEUE FOR HISTORY ASSET TABLE                  *           
      *-------------------------------------------------------------*           
       7100-READ-HIST-ASSET-TSQ.                                                
           MOVE SPACE TO WK-TS-READ-FLAG.                               15960000
           EXEC CICS READQ TS QUEUE(HIST-ASSET-TSQ)                             
                              INTO(TS-HST-ASSET-AREA)                           
                              LENGTH(LENGTH OF TS-HST-ASSET-AREA)               
                              ITEM(WS-HST-ITEM)                                 
                              RESP(WK-RESP)                                     
           END-EXEC.                                                            
           IF WK-RESP = 0                                               15960000
              SET WK-TS-READ-OK TO TRUE                                 15960000
           ELSE                                                         15960000
           IF WK-RESP = DFHRESP(ITEMERR)                                15960000
              SET WK-TS-READ-ERROR TO TRUE.                             15960000
      *                                                                         
       7110-DELETE-HIST-ASSET-TSQ.                                              
           EXEC CICS DELETEQ TS QUEUE(HIST-ASSET-TSQ)                           
           END-EXEC.                                                            
                                                                                
       7120-WRITE-HIST-ASSET-TSQ.                                               
           EXEC CICS WRITEQ TS QUEUE(HIST-ASSET-TSQ)                            
                               FROM(TS-HST-ASSET-AREA)                          
                               LENGTH(LENGTH OF TS-HST-ASSET-AREA)              
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE 'ACAT13IF HISTORY ASSET WRITE TSQ ERROR'                     
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
      *                                                                         
       7130-REWRITE-HIST-ASSET-TSQ.                                             
           EXEC CICS WRITEQ TS QUEUE(HIST-ASSET-TSQ)                            
                               FROM(TS-HST-ASSET-AREA)                          
                               LENGTH(LENGTH OF TS-HST-ASSET-AREA)              
                               ITEM(WS-HST-ITEM)                                
                               REWRITE                                          
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE 'ACAT13IF HISTORY ASSET REWRITE TSQ ERROR'                   
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
           EJECT                                                                
      *                                                                         
      *-------------------------------------------------------------*           
      *           TS QUEUE FOR INITIAL ASSET TABLE                  *           
      *-------------------------------------------------------------*           
       7200-READ-INIT-ASSET-TSQ.                                                
           MOVE SPACE TO WK-TS-READ-FLAG.                               15960000
           EXEC CICS READQ TS QUEUE(INIT-ASSET-TSQ)                             
                              INTO(TS-INI-ASSET-AREA)                           
                              LENGTH(LENGTH OF TS-INI-ASSET-AREA)               
                              ITEM(WS-INI-ITEM)                                 
                              RESP(WK-RESP)                                     
           END-EXEC.                                                            
           IF WK-RESP = 0                                               15960000
              SET WK-TS-READ-OK TO TRUE                                 15960000
           ELSE                                                         15960000
           IF WK-RESP = DFHRESP(ITEMERR)                                15960000
              SET WK-TS-READ-ERROR TO TRUE.                             15960000
      *                                                                         
       7210-DELETE-INIT-ASSET-TSQ.                                              
           EXEC CICS DELETEQ TS QUEUE(INIT-ASSET-TSQ)                           
           END-EXEC.                                                            
                                                                                
       7220-WRITE-INIT-ASSET-TSQ.                                               
           EXEC CICS WRITEQ TS QUEUE(INIT-ASSET-TSQ)                            
                               FROM(TS-INI-ASSET-AREA)                          
                               LENGTH(LENGTH OF TS-INI-ASSET-AREA)              
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE 'ACAT13IF INITIAL ASSET WRITE TSQ ERROR'                     
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
      *                                                                         
       7230-REWRITE-INIT-ASSET-TSQ.                                             
           EXEC CICS WRITEQ TS QUEUE(INIT-ASSET-TSQ)                            
                               FROM(TS-INI-ASSET-AREA)                          
                               LENGTH(LENGTH OF TS-INI-ASSET-AREA)              
                               ITEM(WS-INI-ITEM)                                
                               REWRITE                                          
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE 'ACAT13IF INITIAL ASSET REWRITE TSQ ERROR'                   
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
           EJECT                                                                
      *                                                                         
      *-------------------------------------------------------------*           
      *               READ B1                                       *           
      *-------------------------------------------------------------*           
       7300-READ-B1-RTN.                                                        
           EXEC CICS READ                                                       
                     DATASET('B1PRINT')                                         
                     INTO(B1-RECORD)                                            
                     RIDFLD(B1-REC-ID)                                          
                     LENGTH(LENGTH OF B1-RECORD)                                
           END-EXEC.                                                            
ET0004*                                                                         
ET0004*-------------------------------------------------------------*           
ET0004*         START BROWE CAGE TAG INDEX FILE                     *           
ET0004*-------------------------------------------------------------*           
ET0004 7310-START-BRW-CAGE-TAG.                                                 
           EXEC CICS STARTBR DATASET(CAGETAG-IX-DATASET)                        
                             RIDFLD(WS-CAGE-TAG-KEY)                            
                             GTEQ                                               
           END-EXEC.                                                            
           IF EIBRESP = +13                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'CAGE TAG FILE NOT AVAILABLE' TO SYSTEM-MSG                  
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
ET0004*                                                                         
ET0004*-------------------------------------------------------------*           
ET0004*           READ NEXT CAGE TAG INDEX FILE                     *           
ET0004*-------------------------------------------------------------*           
ET0004 7320-READ-NEXT-CAGE-TAG.                                                 
           EXEC CICS READNEXT DATASET(CAGETAG-IX-DATASET)                       
                     RIDFLD(WS-CAGE-TAG-KEY)                                    
                     SET(ADDRESS OF ACAT-CAGE-TAG-INDEX-REC)                    
           END-EXEC.                                                            
           IF EIBRESP = +20                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'CAGE TAG FILE READ ERROR' TO SYSTEM-MSG                     
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
ET0004*                                                                         
ET0004*-------------------------------------------------------------*           
ET0004*           END BROWE CAGE TAG INDEX FILE                     *           
ET0004*-------------------------------------------------------------*           
ET0004 7330-END-BRW-CAGE-TAG.                                                   
           EXEC CICS ENDBR DATASET(CAGETAG-IX-DATASET)                          
           END-EXEC.                                                            
           IF EIBRESP  = +0 OR +16                                              
              CONTINUE                                                          
           ELSE                                                                 
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT13MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'CAGE TAG FILE END BROWSE ERROR' TO SYSTEM-MSG               
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *-------------------------------------------------------------*           
      *               XCTL TO OTHER PROGRAM                         *           
      *-------------------------------------------------------------*           
       7500-XCTL-TO-DETAIL-PROG.                                                
           EXEC CICS XCTL                                                       
                  PROGRAM(CALLED-PROGRAM-NAME)                                  
                  COMMAREA(ACATCOMM-COMMAREA)                                   
                  LENGTH(LENGTH OF ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
      *                                                                         
      *-------------------------------------------------------------*           
      *            CALL DB2 I/O MODULE ACAT13DB                     *           
      *-------------------------------------------------------------*           
       7600-LINK-TO-ACAT13DB.                                                   
           EXEC CICS LINK                                                       
                     PROGRAM('ACAT13DB')                                        
                     COMMAREA(ACAT13IO-COMMAREA)                                
                     LENGTH(LENGTH OF ACAT13IO-COMMAREA)                        
           END-EXEC.                                                            
      *                                                                         
      *-------------------------------------------------------------*           
      *     CALL DB2 I/O MODULE - PARTICIPANT BROKER NAME SEARCH    *           
      *-------------------------------------------------------------*           
       7700-LINK-TO-ACATPPIO.                                                   
           EXEC CICS LINK PROGRAM ('ACATPPDB')                          02890002
                COMMAREA(ACATPPIO-CALL-AREA)                            02900002
                LENGTH(LENGTH OF ACATPPIO-CALL-AREA)                    02910002
           END-EXEC.                                                    02920002
       EJECT                                                            02920002
      *                                                                         
      *-------------------------------------------------------------*           
      *       CALL NUMERIC EDIT MODULE                              *           
      *-------------------------------------------------------------*           
       7800-LINK-TO-EDITMOD.                                                    
           EXEC CICS LINK PROGRAM(WS-EDITMOD)                                   
                       COMMAREA(EDIT-QTY-AREA)                                  
                       LENGTH(LENGTH OF EDIT-QTY-AREA)                          
           END-EXEC.                                                    02920002
      *                                                                         
      *-------------------------------------------------------------*           
      *            SEND MAP ERASE FOR THE FIRST TIME                *           
      *-------------------------------------------------------------*           
       8000-SEND-MAP-ERASE.                                                     
           IF WK-ERROR OR WK-MSG-ON                                             
              MOVE SYSTEM-MSG     TO TRLMSGO                                    
              MOVE ATT-ASKIP-BRT  TO TRLMSGA                                    
           ELSE                                                                 
              MOVE SPACE  TO TRLMSGO                                            
           END-IF.                                                              
           MOVE 'ACAX'    TO MTRANSO.                                           
           MOVE WSTIME    TO MTIMEO.                                            
           MOVE WSMMDDYY  TO MDATEO.                                            
           MOVE WK-CLT    TO MCLINBO.                                           
           EXEC CICS SEND MAP('HDRMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM(HDRMAPO)                                              
                     ACCUM                                                      
                     CURSOR                                                     
                     ERASE                                                      
           END-EXEC.                                                            
           EXEC CICS SEND MAP('ACAT13M')                                        
                     MAPSET('ACAT13M')                                          
                     FROM(ACAT13MO)                                             
                     ACCUM                                                      
                     CURSOR                                                     
           END-EXEC.                                                            
           EXEC CICS SEND MAP('TRLMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM(TRLMAPO)                                              
                     ACCUM                                                      
                     CURSOR                                                     
           END-EXEC.                                                            
           EXEC CICS SEND PAGE                                                  
           END-EXEC.                                                            
                                                                                
       EJECT                                                                    
                                                                                
       8100-SEND-MAP-DATA-ONLY.                                                 
           IF WK-ERROR OR WK-MSG-ON                                             
              MOVE SYSTEM-MSG     TO TRLMSGO                                    
              MOVE ATT-ASKIP-BRT  TO TRLMSGA                                    
           ELSE                                                                 
              MOVE SPACE  TO TRLMSGO                                            
           END-IF.                                                              
      *                                                                         
           MOVE 'ACAX'    TO MTRANSO.                                           
           MOVE WSTIME    TO MTIMEO.                                            
           MOVE WSMMDDYY  TO MDATEO.                                            
           MOVE WK-CLT    TO MCLINBO.                                           
      *    IF FIRST-TIME                                                        
      *    AND (WK-CURSOR NOT = 0)                                              
              EXEC CICS SEND MAP('HDRMAP')                                      
                        MAPSET('ACAT00M')                                       
                        FROM(HDRMAPO)                                           
                        CURSOR                                                  
                        DATAONLY                                                
                        ACCUM                                                   
               END-EXEC                                                         
               EXEC CICS SEND MAP('ACAT13M')                                    
                         MAPSET('ACAT13M')                                      
                         FROM(ACAT13MO)                                         
                         CURSOR                                                 
                         DATAONLY                                               
                         ACCUM                                                  
               END-EXEC                                                         
               EXEC CICS SEND MAP('TRLMAP')                                     
                         MAPSET('ACAT00M')                                      
                         FROM(TRLMAPO)                                          
                         CURSOR                                                 
                         DATAONLY                                               
                         ACCUM                                                  
               END-EXEC                                                         
               EXEC CICS SEND PAGE                                              
               END-EXEC.                                                        
       EJECT                                                                    
                                                                                
       8500-RECEIVE-MAP.                                                        
           EXEC CICS RECEIVE MAP('HDRMAP')                                      
                             MAPSET('ACAT00M')                                  
                             FROM(ACAT-RECEIVE-MAP)                             
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)                    
           END-EXEC.                                                            
           EXEC CICS RECEIVE MAP('ACAT13M')                                     
                             MAPSET('ACAT13M')                                  
                             FROM(ACAT-RECEIVE-MAP)                             
                             INTO(ACAT13MI)                                     
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)                    
           END-EXEC.                                                            
           EXEC CICS RECEIVE MAP('TRLMAP')                                      
                             MAPSET('ACAT00M')                                  
                             FROM(ACAT-RECEIVE-MAP)                             
                             INTO(TRLMAPI)                                      
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       8700-RETURN-CONTROL-RTN.                                                 
           EXEC CICS SEND CONTROL                                               
                            ERASE                                               
                           FREEKB                                               
           END-EXEC.                                                            
           EXEC CICS XCTL PROGRAM ('RATT01')                                    
           END-EXEC.                                                            
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       8800-RETURN-TO-CICS.                                                     
ET0003     IF TWA-CALLING-PROG = 'ACAT22TH'                                     
ET0003        MOVE 'ACAT22TH' TO ACAT-CALLING-PROG-NAME                         
ET0003     END-IF.                                                              
           IF  TWA-TFR-INQUIRY                                                  
           AND ACAT-CALLING-PROG-NAME NOT = 'ACAT21PT'                          
                MOVE 'ACAT21PT' TO ACAT-CALLING-PROG-NAME                       
           END-IF.                                                              
           IF  TWA-RESUB-REJECT = 'Y'                                           
           AND ACAT-CALLING-PROG-NAME NOT = 'ACAT15TC'                          
                MOVE 'ACAT15TC' TO ACAT-CALLING-PROG-NAME                       
           END-IF.                                                              
           EXEC CICS RETURN                                                     
                     TRANSID('ACAX')                                            
                     COMMAREA(ACATCOMM-COMMAREA)                                
           END-EXEC.                                                            
       EJECT                                                                    
       9000-ERROR-RTN.                                                          
           MOVE WSTIME         TO  MTIMEO.                                      
           MOVE WSMMDDYY       TO  MDATEO.                                      
           MOVE SYSTEM-MSG     TO  TRLMSGO.                                     
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                                     
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 8100-SEND-MAP-DATA-ONLY.                                     
           PERFORM 8800-RETURN-TO-CICS.                                         
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
                                                                                
