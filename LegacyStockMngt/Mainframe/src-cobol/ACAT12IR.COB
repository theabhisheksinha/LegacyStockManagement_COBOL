000001* PDX    - ACAT12IR C0318727 01/11/12 13:29:07 TBLAMUR            00001000
000001* PDX    - ACAT12IR C0296313 05/12/10 09:03:49 TBLAMUR            00001000
000001* LRM011 SSR 62894 CHANGE PF2 MESSAGE AFTER RCL INSERT.                   
000001* PDX    - ACAT12IR C0270299 09/15/08 16:27:49 TBLAMUR            00001000
000001* LRM SSRS 55766 55717 RECOMPILE ONLY FOR COPYS ACATCOM,90TS,JUMP.        
000001* PDX    - ACAT12IR C0250441 06/25/07 12:09:11 TBLAMUR            00001000
000001* LRM010 - SSR 53075 SPIN-OFF CHANGES                                     
000001* PDX    - ACAT12IR C0233602 04/10/06 14:13:21 TBLAMUR            00001000
000001* LRM009 - SSR# 40661 RETAIN USER ID OF INITIATOR.                        
000001* PDX    - ACAT12IR C0230185 01/30/06 11:40:00 TBEDTAK            00001000
000001* ET0008 - SSR39684: ALLOW USERS TO SCROLL THRU NEWLY ENTERED RCLS00001000
000001* PDX    - ACAT12IR C0227439 11/17/05 16:10:04 TBEDTAK            00001000
000001* ET0007 - ADD PF6 HOT KEY TO RECLAIM ALL ASSETS.                 00001000
000001* PDX    - ACAT12IR C0216719 05/31/05 15:26:31 TBEDTAK            00001000
000001* ET0006 - ALLOW TO RECLAIM ASSETS NOT ON HISTORY ASSET TBL.      00001000
000001* ET0005 - ALLOW DUPLICATE RECLAIMS WHILE RCL RECORD IN INIT TBL. 00001000
000001*        - PF7 & 8 FOR MULTI RCLS WITHIN SAME ACCT FROM INIT TBL. 00001000
000001* PDX    - ACAT12IR C0215192 01/20/05 11:55:09 TBEDTAK            00001000
000001* ET0004 - DROP COMMENTS CARRIED FROM ORIGINAL FULL TRANSFER      00001000
000001* ET0003 - FIX BUG - DISABLE DELETION IF PEND-CODE IS 'Y'         00001000
000001* PDX    - ACAT12IR C0211261 09/20/04 12:07:14 TBEDTAK            00001000
000001* PDX    - ACAT12IR C0205792 08/24/04 17:09:43 TBEDTAK            00001000
000001* ET0002 - FIX BUG - PF10 AT COMMENT SCREEN IS NOT RETURNING      00001000
000001*          CONTROL BACK TO RCL SCREEN BUT TO 'S' SCREEN WHILE RCL 00001000
000001*          SCREEN IS BEING BROWSED VIA 'S' SCREEN.                00001000
000001* ET0001 - ALLOW DELIVERER TO RECLAIM NON-STANDARD TRANSFERS.     00001000
000001*          ALLOW MULTI TRANSFERS OF ACCOUNT TO BE RECLAIMED.      00001000
000001*          ADD SCROLLING FUNCTION (PF7 & PF8) FOR THE MULTI TRNS. 00001000
000001*          ALLOW DELIVERER TO RECLAIM CASH EVEN NO CASH AVAILABLE.00001000
000001* PDX    - ACAT12IR C0179784 09/26/02 14:33:38 TBEDTAK            00001000
000001* PDX    - ACAT12IR C0160324 06/25/01 08:31:22 TBLAMUR            00001000
000001* PDX    - ACAT12IR C0129227 08/19/99 10:11:13 TBEDTAK            00001000
000001* PDX    - ACAT12IR C0123136 04/09/99 09:21:30 TBEDTAK            00001000
000001* PDX    - ACAT12IR C0122652 03/05/99 10:55:40 TBEDTAK            00001000
000001* PDX    - ACAT12IR C0121529 02/10/99 15:49:30 TBEDTAK            00001000
000001* PDX    - ACAT12IR C0120330 01/31/99 21:01:26 TBEDTAK            00001000
000001* PDX    - ACAT12IR C0119329 01/07/99 16:04:16 TBEDTAK            00001000
000001* PDX    - ACAT12IR C0117817 12/07/98 11:49:17 TBEDTAK            00001000
000001* PDX    - ACAT12IR C0109165 08/18/98 11:28:38 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT12IR.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *              ACAT INITIATE A RECLAIM                          *         
      *****************************************************************         
      * - THE PURPOSE OF THIS PROGRAM IS TO HAVE USER RECLAIM ALL OR  *         
      *   PART OF ASSETS AGAINST BOTH THE ACCOUNT & THE ASSET IF THE  *         
      *   ACCOUNT WAS PREVIOUSLY DELIVERED OFF.                       *         
      * - UPON RECLAIM, THE PROGRAM EXAMINES ACTIVE TRANSFER AND      *         
      *   ASSET TABLES TO SEE NO DUPLICATE RECLAIMS EXIST.            *         
      * - NEWLY CREATED RECLAIMED TRANSFER CAN BE DELETED IF IT IS    *         
      *   NOT YET TRANSMITTED TO NSCC.                                *         
      * - THE USER MUST PLACE A CURSOR AT ACCOUNT FIELD AREA IF       *         
      *   ACCOUNT LEVEL COMMENT IS TO BE ATTACHED, OR AT EACH ASSET   *         
      *   FIELD AREA IF SECURITY LEVEL COMMENTS ARE TO BE ATTACHED,   *         
      *   THEN PRESS PF1 TO GET COMMENT POP-UP SCREEN.                *         
      * - THE USER CAN ENTER '?' AT REASON CODE FIELD TO GET A POP-UP *         
      *   SCREEN FOR THE REASON CODE SELECTION SCREEN.                *         
      * - THE PROGRAM ALSO HANDLES TO VIEW THE DETAILS OF PENDING     *         
      *   RECLAIM THRU "ACAT21PT" (PENDING INQUIRY) WHICH TRANSFERS   *         
      *   PROGRAM CONTROL TO THIS PROGRAM.                            *         
      * - REJECTED RECLAIMED ACCOUNT CAN BE RESURRECTED THRU          *         
      *   "ACAT15TC" (REJECTED BY CONTRA BROKER) WHICH TRANSFERS A    *         
      *   PROGRAM CONTROL TO THIS PROGRAM.                            *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
       77  TWA-SIZE                       PIC S9(4) COMP.                       
       77  ACATVR-DATASET                 PIC X(08) VALUE 'ACATIT'.             
       77  WS-EDITMOD                     PIC X(08) VALUE 'ACATEDIT'.           
ET0006 77  WS-ACATMSD                     PIC X(08) VALUE 'ACATMSD '.           
       77  CURR-EDIT-LEN                  PIC S9(4) COMP  VALUE +35.            
      *                                                                         
       01  TSQ-WORK-AREA.                                                       
           05  TWA-TSQ.                                                         
               09  TSQ-NAME.                                                    
                   11 TERM-ID             PIC X(04).                            
                   11 TRAN-ID             PIC X(04).                            
               09  ITEM-NUM               PIC S9(04) COMP VALUE +1.             
      *                                                                         
           05  HST-ASSET-TSQ.                                                   
               09  WS-HST-TSQ-NAME.                                             
                   11 WS-HST-TERM         PIC X(04).                            
                   11 FILLER              PIC X(04) VALUE '12AC'.               
               09  WS-HST-ITEM            PIC S9(4) COMP.                       
      *                                                                         
           05  INI-ASSET-TSQ.                                                   
               09  WS-INI-TSQ-NAME.                                             
                   11 WS-INI-TERM         PIC X(04).                            
                   11 FILLER              PIC X(04) VALUE '12IN'.               
               09  WS-INI-ITEM            PIC S9(4) COMP.                       
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
      *--------------------------------------------------------------*  00300002
      *      EDITMOD WORK AREA                                          00310002
      *--------------------------------------------------------------*  00300002
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
        01  WS-SHORT-PSTN.                                                      
           05  WS-SHORT-AMT               PIC S9(14)V99 COMP-3.                 
           05  WS-SHORT-AMT-ORG           PIC S9(14)V99 COMP-3.                 
           05  WS-SHORT-QTY               USAGE COMP-2.                         
           05  WS-SHORT-QTY-ORG           USAGE COMP-2.                         
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
           05  WS-UPDATE-SW               PIC X(01) VALUE SPACE.                
               88  WS-UPDATE-OK                     VALUE 'Y'.                  
ET0001     05  WS-NEXT-PAGE-FOUND-SW      PIC X(01) VALUE SPACE.                
ET0001         88  WS-NEXT-PAGE-FOUND               VALUE 'Y'.                  
ET0001     05  WS-PREV-PAGE-FOUND-SW      PIC X(01) VALUE SPACE.                
ET0001         88  WS-PREV-PAGE-FOUND               VALUE 'Y'.                  
ET0003**   05  WS-NSCC-PEND-CD-IS-Y-SW    PIC X(01).                            
ET0003**       88  WS-NSCC-PEND-CD-IS-Y             VALUE 'Y'.                  
ET0006     05  WS-DUPE-SEC-FOUND-SW       PIC X(01) VALUE SPACE.                
ET0006         88  WS-DUPE-SEC-FOUND                VALUE 'Y'.                  
      *                                                                         
       01  WS-ENTRY-FLD-SW.                                                     
           05  WS-VALID-BAL01-SW          PIC X(01).                            
               88  WS-VALID-BAL01         VALUE 'Y'.                            
           05  WS-VALID-BAL02-SW          PIC X(01).                            
               88  WS-VALID-BAL02         VALUE 'Y'.                            
           05  WS-VALID-BAL05-SW          PIC X(01).                            
               88  WS-VALID-BAL05         VALUE 'Y'.                            
           05  WS-VALID-QTY-SW            PIC X(01).                            
               88  WS-VALID-QTY           VALUE 'Y'.                            
ET0006     05  WS-VALID-AMT-SW            PIC X(01).                            
ET0006         88  WS-VALID-AMT           VALUE 'Y'.                            
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
ET0005     05  WS-ADP-CONTROL-NBR.                                              
ET0005         09 WS-CONTROL-XX           PIC X(02).                            
ET0005         09 WS-CONTROL-SEQ          PIC 9(03).                            
ET0005     05  WS-RFRN-DLVR-ACCT          PIC X(20).                            
ET0005     05  WS-TRANS-RFRN-ID           PIC X(20).                            
           05  WK-BRW-KEY.                                                      
               09 WK-BRW-CLIENT           PIC X(03).                            
               09 WK-BRW-RECORD-TYPE      PIC X(02)   VALUE '90'.               
               09 WK-BRW-CUR-BR-AC.                                             
                  15 WK-BRW-CURRENCY      PIC X(03).                            
                  15 WK-BRW-BRANCH        PIC X(03).                            
                  15 WK-BRW-ACCOUNT       PIC X(05).                            
ET0008     05  WS-NEXT-INITRN-KEY.                                              
ET0008         09  WS-NEXT-DLVR-ACCT-KEY  PIC X(20).                            
ET0008         09  WS-NEXT-RCV-ACCT-KEY   PIC X(20).                            
ET0008         09  WS-NEXT-ADP-ACAT-KEY   PIC X(14).                            
ET0008     05  WS-CURR-INITRN-KEY.                                              
ET0008         09  WS-CURR-DLVR-ACCT-KEY  PIC X(20).                            
ET0008         09  WS-CURR-RCV-ACCT-KEY   PIC X(20).                            
ET0008         09  WS-CURR-ADP-ACAT-KEY   PIC X(14).                            
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
           05  WS-TFR-INIT-FOUND-SW       PIC X(01).                            
               88  WS-TFR-INIT-FOUND      VALUE 'Y'.                            
           05  WS-ASSET-INIT-FOUND-SW     PIC X(01).                            
               88  WS-ASSET-INIT-FOUND    VALUE 'Y'.                            
           05  WS-TFR-HIST-FOUND-SW       PIC X(01).                            
               88  WS-TFR-HIST-FOUND      VALUE 'Y'.                            
           05  WS-ASSET-HIST-FOUND-SW     PIC X(01).                            
               88  WS-ASSET-HIST-FOUND    VALUE 'Y'.                            
           05  WS-RCLM-ASSET-FOUND-SW     PIC X(01).                            
               88  WS-RCLM-ASSET-FOUND    VALUE 'Y'.                            
           05  WS-SUBMIT-ALLOWED-SW       PIC X(01).                            
               88  WS-SUBMIT-ALLOWED      VALUE 'Y'.                            
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
LRM010     05  TFR-FIND-ERR-MSG           PIC X(49) VALUE                       
LRM010         'DB2 FIND ERROR ON HIST TFR TABLE - CALL HELP DESK'.             
           05  UNAUTH-MESSAGE             PIC X(79)                             
               VALUE 'UNAUTHORIZED USER.'.                                      
           05  SEC-MESSAGE                PIC X(79)                             
               VALUE 'SIGN ON SECURITY NOT AVAILABLE, TRY AGAIN.'.              
           05  ERROR-PROG-MSG.                                                  
               09  ERROR-PROG-NAME        PIC X(08).                            
               09  FILLER                 PIC X(71)                             
                   VALUE ' PROGRAM NOT AVAILIABLE.'.                            
ET0001     05  DUPE-ASSET-MSG.                                                  
ET0001         09  FILLER                 PIC X(13) VALUE                       
ET0001             'UNPROCESSED "'.                                             
ET0001         09  WS-TRNFR-TYPE-MSG      PIC X(03).                            
ET0001         09  FILLER                 PIC X(45) VALUE                       
ET0001             '" FOUND; MUST ACT ON THAT TRANSFER FIRST'.                  
           05  DB2IO-ERR-MSG              PIC X(54).                            
           05  SAVE-INTRAN-FLAG           PIC X(01).                            
           05  PREV-INTRAN-FLAG           PIC X(01).                            
           05  WS-ACAT-NEXT               PIC X.                                
           05  WS-ACTION-COUNT            PIC 9(02).                            
           05  WS-INIT-TFR-ROWS           PIC 9(03).                            
           05  SUB                        PIC S9(09) COMP-3.                    
ET0005     05  SUB2                       PIC S9(09) COMP-3.                    
           05  C-IDX                      PIC S9(03) COMP-3.                    
           05  WS-SECURITY-AMT            USAGE COMP-2.                         
ET0006     05  WS-CUSIP-IN-TS             PIC X(09).                            
ET0006     05  WS-CUSIP-IN-TWA            PIC X(09).                            
ET0006     05  WS-DESCRIPTION-3.                                                
ET0006         09  WS-DESC-1              PIC X(30).                            
ET0006         09  WS-DESC-2              PIC X(30).                            
ET0006         09  WS-DESC-3              PIC X(30).                            
ET0006     05  WS-DESCRIPTION             REDEFINES WS-DESCRIPTION-3.           
ET0006         09  WS-DESCRIPT-1          PIC X(60).                            
ET0006         09  WS-DESCRIPT-2          PIC X(30).                            
ET0006     05  WK-CNS-IND                 PIC X(01)  VALUE 'N'.                 
ET0006     05  WK-DTC-IND                 PIC X(01)  VALUE 'N'.                 
ET0006     05  WK-MS-CLASS.                                                     
ET0006         09  WK-MS-CLASS-1          PIC 9.                                
ET0006         09  WK-MS-CLASS-2-5        PIC 9(4).                             
ET0006         09  WK-MS-CLASS-6-7        PIC 9(2).                             
ET0006     05  FILLER                     REDEFINES WK-MS-CLASS.                
ET0006         09  WK-MS-CLASS-1-2-3      PIC 9(3).                             
ET0006         09  WK-MS-CLASS-4          PIC 9.                                
ET0006         09  WK-MS-CLASS-5-7        PIC 9(3).                             
ET0006     05  FILLER                     REDEFINES WK-MS-CLASS.                
ET0006         09  FILLER                 PIC 9.                                
ET0006         09  WK-MS-CLASS-2          PIC 9.                                
ET0006         09  WK-MS-CLASS-3-4        PIC 9(2).                             
ET0006         09  WK-MS-CLASS-5          PIC 9.                                
ET0006         09  WK-MS-CLASS-6          PIC 9.                                
ET0006         09  WK-MS-CLASS-7          PIC 9.                                
ET0006     05  FILLER                     REDEFINES WK-MS-CLASS.                
ET0006         09  WK-MS-CLASS-1-2        PIC 9(2).                             
ET0006         09  FILLER                 PIC 9(2).                             
ET0006         09  WK-MS-CLASS-5-6-7      PIC 9(3).                             
ET0006     05  FILLER                     REDEFINES WK-MS-CLASS.                
ET0006         09  FILLER                 PIC 9(3).                             
ET0006         09  WK-MS-CLASS-4-5        PIC 9(2).                             
ET0006         09  FILLER                 PIC 9(2).                             
      *                                                                         
       01  TS-HST-ASSET-AREA.                                                   
           03  TS-HST-SECURITY            PIC X(12).                            
ET0006     03  TS-HST-ADP-NBR             PIC X(07).                            
           03  TS-HST-CTGRY               PIC X(04).                            
           03  TS-HST-STTL-LOC            PIC X(02).                            
           03  TS-HST-TYPE                PIC X(01).                            
           03  TS-HST-DESC                PIC X(140).                           
           03  TS-HST-AMT-ORIG            USAGE COMP-2.                         
           03  TS-HST-QTY-ORIG            USAGE COMP-2.                         
           03  TS-HST-QTY-RECL            USAGE COMP-2.                         
           03  TS-HST-QTY-SIGN            PIC X(01).                            
           03  TS-HST-REASON              PIC X(02).                            
           03  TS-HST-CMNTS               PIC X(120).                           
           03  TS-HST-RECL-IND            PIC X(01).                            
           03  TS-HST-SEQ-NBR             PIC S9(4) COMP.                       
           03  TS-HST-PSTN-CD             PIC X(01).                            
           03  TS-HST-RCLMED              PIC X(01).                            
ET0001     03  TS-HST-STTLM-RSN           PIC X(04).                            
ET0006     03  TS-HST-ASSET-AMT           USAGE COMP-2.                         
ET0006     03  TS-HST-ADD-ASSET           PIC X(01).                            
      *                                                                         
       01  TS-INI-ASSET-AREA.                                                   
           03  TS-INI-SECURITY            PIC X(12).                            
           03  TS-INI-CTGRY               PIC X(04).                            
           03  TS-INI-STTL-LOC            PIC X(02).                            
           03  TS-INI-TYPE                PIC X(01).                            
           03  TS-INI-DESC                PIC X(140).                           
           03  TS-INI-QTY-ORIG            USAGE COMP-2.                         
           03  TS-INI-QTY-RECL            USAGE COMP-2.                         
           03  TS-INI-REASON              PIC X(02).                            
           03  TS-INI-CMNTS               PIC X(120).                           
           03  TS-INI-RECL-IND            PIC X(01).                            
           03  TS-INI-PSTN-CD             PIC X(01).                            
ET0001     03  TS-INI-STTLM-RSN           PIC X(04).                            
      *                                                                         
       01  ACATPPIO-CALL-AREA.                                                  
           COPY ACATPPIO.                                                       
      *                                                                         
ET0006 01  ACATMSDIO-CALL-AREA.                                                 
ET0006     COPY ACATMSDI.                                                       
      *                                                                         
       01  ACAT12IO-COMMAREA.                                                   
           COPY ACAT12IO.                                                       
           EJECT                                                                
       01  WS-POP-UP-WORKAREA.                                                  
           COPY ACAT90TS.                                                       
           EJECT                                                        01660002
       COPY ACATSRCH.                                                           
           EJECT                                                                
       COPY SECLINKC.                                                           
           EJECT                                                                
       COPY ACATCOM.                                                            
           EJECT                                                                
       COPY ATTR.                                                               
           EJECT                                                                
       COPY DFHAID.                                                             
           EJECT                                                                
       COPY ACAT00M.                                                            
       COPY ACAT12M.                                                            
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
ET0005         05  TWA-ADD-RECLAIM-SW           PIC X(01).                      
ET0005             88  TWA-ADD-RECLAIM                   VALUE 'Y'.             
ET0006         05  TWA-ADD-ASSET-SW             PIC X(01).                      
ET0006             88  TWA-ADD-ASSET                     VALUE 'Y'.             
ET0008         05  TWA-SRCH-ALL-RCLS-SW         PIC X(01).                      
ET0008             88  TWA-SRCH-ALL-RCLS                 VALUE 'Y'.             
               05  TWA-RESUB-REJECT             PIC X(01).                      
               05  TWA-DELETE-CONFIRM           PIC X(01).                      
               05  TWA-PAGE-NUM                 PIC 9(05) COMP-3.               
               05  TWA-MAX-PAGE-INI             PIC 9(05) COMP-3.               
               05  TWA-MAX-PAGE-HST             PIC 9(05) COMP-3.               
               05  TWA-FIRST-ENTER-RTN          PIC X(01).                      
               05  TWA-SCREEN                   PIC X(01).                      
ET0001         05  TWA-NO-ASSET-SW              PIC X(01).                      
ET0001             88  TWA-NO-ASSET                      VALUE 'N'.             
ET0003         05  TWA-NSCC-PEND-CD-IS-Y-SW     PIC X(01).                      
ET0003             88  TWA-NSCC-PEND-CD-IS-Y             VALUE 'Y'.             
               05  TWA-MAP-AREA.                                                
                   07  TWA-DLVR                 PIC X(04).                      
                   07  TWA-DLVR-ACCT            PIC X(20).                      
                   07  TWA-RCV                  PIC X(04).                      
                   07  TWA-RCV-ACCT             PIC X(20).                      
                   07  TWA-RR                   PIC X(03).                      
                   07  TWA-CNAME                PIC X(30).                      
                   07  TWA-ACCT-TYPE            PIC X(02).                      
                   07  TWA-STTL-DATE            PIC X(10).                      
                   07  TWA-TFR-TYPE             PIC X(03).                      
                   07  TWA-ACAT                 PIC X(14).                      
                   07  TWA-STATUS               PIC X(03).                      
                   07  TWA-CUST-NM1             PIC X(30).                      
                   07  TWA-CUST-NM2             PIC X(30).                      
                   07  TWA-SS1                  PIC X(09).                      
                   07  TWA-SS2                  PIC X(09).                      
                   07  TWA-ACCT-CMNTS           PIC X(120).                     
                   07  TWA-SECUR                PIC X(12).                      
ET0006**           07  TWA-CATGRY               PIC X(02).                      
ET0006             07  TWA-CATGRY               PIC X(04).                      
                   07  TWA-SLOC                 PIC X(02).                      
                   07  TWA-SEC-TYPE             PIC X(01).                      
                   07  TWA-DESCRIPT             PIC X(120).                     
ET0005             07  TWA-ADP-CONTROL-NBR      PIC X(14).                      
ET0006             07  TWA-PREV-SECUR           PIC X(12).                      
ET0006             07  TWA-PREV-CATGRY          PIC X(04).                      
ET0006             07  TWA-PREV-SLOC            PIC X(02).                      
ET0006             07  TWA-PREV-SEC-TYPE        PIC X(01).                      
ET0006             07  TWA-PREV-QTY             PIC X(22).                      
ET0006             07  TWA-PREV-AMT             PIC X(19).                      
ET0006             07  TWA-PREV-RSON4           PIC X(02).                      
ET0006             07  TWA-PREV-RCLM4           PIC X(01).                      
ET0001         05  TWA-SAVE-MAP-ACCT-ENTRY.                                     
                   07  TWA-MAP-BR               PIC X(03).                      
                   07  TWA-MAP-AC               PIC X(05).                      
               05  TWA-SAVE-MAP-ENTRY.                                          
                   07  TWA-MAP-BAL01            PIC X(19).                      
                   07  TWA-MAP-BAL02            PIC X(19).                      
                   07  TWA-MAP-BAL05            PIC X(19).                      
                   07  TWA-MAP-QTY              PIC X(22).                      
                   07  TWA-MAP-RSON1            PIC X(02).                      
                   07  TWA-MAP-RSON2            PIC X(02).                      
                   07  TWA-MAP-RSON3            PIC X(02).                      
                   07  TWA-MAP-RSON4            PIC X(02).                      
                   07  TWA-MAP-RCLM1            PIC X(01).                      
                   07  TWA-MAP-RCLM2            PIC X(01).                      
                   07  TWA-MAP-RCLM3            PIC X(01).                      
                   07  TWA-MAP-RCLM4            PIC X(01).                      
                   07  TWA-MAP-RCLMED1          PIC X(01).                      
                   07  TWA-MAP-RCLMED2          PIC X(01).                      
                   07  TWA-MAP-RCLMED3          PIC X(01).                      
                   07  TWA-MAP-RCLMED4          PIC X(01).                      
ET0006             07  TWA-MAP-AMT              PIC X(19).                      
                   07  TWA-MAP-SUB              PIC X(01).                      
                   07  TWA-MAP-DEL              PIC X(01).                      
                   07  TWA-MAP-NEXT             PIC X(01).                      
               05  TWA-SAVE-SCR-KEY.                                            
                   07  TWA-SAVE-MAP-ACCT.                                       
                       09  TWA-SAVE-MAP-BR      PIC X(03).                      
                       09  TWA-SAVE-MAP-AC      PIC X(05).                      
               05  TWA-SAVE-HIST-BALANCE.                                       
                   07  TWA-SV-HST-BAL01-ORG     PIC S9(14)V99 COMP-3.           
                   07  TWA-SV-HST-BAL01         PIC S9(14)V99 COMP-3.           
                   07  TWA-SV-HST-STTLM-RSN1    PIC X(04).                      
                   07  TWA-SV-HST-BAL01-SIGN    PIC X(01).                      
                   07  TWA-SV-HST-RSN1          PIC X(02).                      
                   07  TWA-SV-HST-RCL1          PIC X(01).                      
                   07  TWA-SV-HST-CMNTS1        PIC X(120).                     
                   07  TWA-SV-HST-PSTN-CD1      PIC X(1).                       
                   07  TWA-SV-HST-SEQ-NBR1      PIC S9(4) COMP.                 
                   07  TWA-SV-HST-BAL1-RCLMED   PIC X(1).                       
ET0006**           07  TWA-SV-HST-ASSET-DESC1   PIC X(140).                     
                   07  TWA-SV-HST-BAL02-ORG     PIC S9(14)V99 COMP-3.           
                   07  TWA-SV-HST-BAL02         PIC S9(14)V99 COMP-3.           
                   07  TWA-SV-HST-STTLM-RSN2    PIC X(04).                      
                   07  TWA-SV-HST-BAL02-SIGN    PIC X(01).                      
                   07  TWA-SV-HST-RSN2          PIC X(02).                      
                   07  TWA-SV-HST-RCL2          PIC X(01).                      
                   07  TWA-SV-HST-CMNTS2        PIC X(120).                     
                   07  TWA-SV-HST-PSTN-CD2      PIC X(1).                       
                   07  TWA-SV-HST-SEQ-NBR2      PIC S9(4) COMP.                 
                   07  TWA-SV-HST-BAL2-RCLMED   PIC X(1).                       
ET0006**           07  TWA-SV-HST-ASSET-DESC2   PIC X(140).                     
                   07  TWA-SV-HST-BAL05-ORG     PIC S9(14)V99 COMP-3.           
                   07  TWA-SV-HST-BAL05         PIC S9(14)V99 COMP-3.           
                   07  TWA-SV-HST-STTLM-RSN5    PIC X(04).                      
                   07  TWA-SV-HST-BAL05-SIGN    PIC X(01).                      
                   07  TWA-SV-HST-RSN5          PIC X(02).                      
                   07  TWA-SV-HST-RCL5          PIC X(01).                      
                   07  TWA-SV-HST-CMNTS5        PIC X(120).                     
                   07  TWA-SV-HST-PSTN-CD5      PIC X(1).                       
                   07  TWA-SV-HST-SEQ-NBR5      PIC S9(4) COMP.                 
                   07  TWA-SV-HST-BAL5-RCLMED   PIC X(1).                       
ET0006**           07  TWA-SV-HST-ASSET-DESC5   PIC X(140).                     
               05  TWA-SAVE-INIT-BALANCE.                                       
                   07  TWA-SV-INI-BAL01         PIC S9(14)V99 COMP-3.           
                   07  TWA-SV-INI-STTLM-RSN1    PIC X(04).                      
                   07  TWA-SV-INI-RSN1          PIC X(02).                      
                   07  TWA-SV-INI-CMNTS1        PIC X(120).                     
                   07  TWA-SV-INI-PSTN-CD1      PIC X(1).                       
                   07  TWA-SV-INI-BAL02         PIC S9(14)V99 COMP-3.           
                   07  TWA-SV-INI-STTLM-RSN2    PIC X(04).                      
                   07  TWA-SV-INI-RSN2          PIC X(02).                      
                   07  TWA-SV-INI-CMNTS2        PIC X(120).                     
                   07  TWA-SV-INI-PSTN-CD2      PIC X(1).                       
                   07  TWA-SV-INI-BAL05         PIC S9(14)V99 COMP-3.           
                   07  TWA-SV-INI-STTLM-RSN5    PIC X(04).                      
                   07  TWA-SV-INI-RSN5          PIC X(02).                      
                   07  TWA-SV-INI-CMNTS5        PIC X(120).                     
                   07  TWA-SV-INI-PSTN-CD5      PIC X(1).                       
               05  TWA-MAP-SEARCH.                                              
                   07  TWA-MAP-MMBR             PIC X(03).                      
                   07  TWA-MAP-MMAC             PIC X(05).                      
                   07  TWA-MAP-MMRR             PIC X(03).                      
                   07  TWA-MAP-MMTFR            PIC X(03).                      
                   07  TWA-MAP-MMRD             PIC X(01).                      
                   07  TWA-MAP-MMBKR            PIC X(04).                      
                   07  TWA-MAP-MMSTAT           PIC X(03).                      
                   07  TWA-MAP-MMSD             PIC X(06).                      
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
              MOVE LOW-VALUE TO ACAT12MO                                        
              SET WK-ERROR TO TRUE                                              
              MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO SYSTEM-MSG             
              PERFORM  9000-ERROR-RTN.                                          
                                                                                
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                          
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       MAIN-PROCESSING.                                                         
           INITIALIZE ACAT12IO-COMMAREA.                                        
           MOVE EIBTRMID TO TERM-ID.                                            
           MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                               
           MOVE 'N'           TO END-OF-DATA-FLAG.                              
           MOVE SPACES        TO SYSTEM-MSG.                                    
           MOVE 0             TO WK-CURSOR.                                     
           MOVE LOW-VALUE     TO HDRMAPO                                        
                                 ACAT12MO.                                      
           PERFORM 0100-GET-DATE-AND-TIME.                                      
           MOVE  DFHCOMMAREA     TO  ACATCOMM-COMMAREA.                         
           MOVE  TWA-CLIENT-NO-X TO WK-CLT-NBR.                                 
           MOVE  WK-CLT          TO  ACAT12-PASS-CLT.                           
           IF ACAT-SUPER-SIGN-ON-UPDATE                                         
              SET WS-UPDATE-OK     TO TRUE                                      
           ELSE                                                                 
              PERFORM 0150-CHECK-UPDATE-MODE.                                   
                                                                                
           IF  ACAT-CALLING-PROG-NAME = 'ACAT15TC'                              
           AND ACAT-CONTROL-NBR > SPACE  AND  ACAT-BR-AC > SPACE                
               MOVE 'ACAT12IR' TO ACAT-PROGRAM-NAME                             
               PERFORM 0600-RESUBMIT-REJECTED-RCLM                              
           ELSE                                                                 
           IF  ACAT-CALLING-PROG-NAME = 'ACAT21PT'                              
           AND ACAT-CONTROL-NBR > SPACE  AND  ACAT-BR-AC > SPACE                
               MOVE 'ACAT12IR' TO ACAT-PROGRAM-NAME                             
               PERFORM 0700-INQUIRE-PEND-RCLM                                   
           END-IF.                                                              
                                                                                
           IF  ACAT-PROGRAM-NAME = 'ACAT12IR'                                   
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
               PERFORM 0900-CONTINUE-PROCESS                                    
           ELSE                                                                 
               MOVE 'ACAT12IR' TO ACAT-PROGRAM-NAME                             
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
      *                                                                         
       0150-CHECK-UPDATE-MODE.                                                  
           MOVE SPACES    TO SECLINK-LIST.                              AEISAC07
           MOVE '2'       TO SECLINK-ACTION-CODE.                       AEISAC07
           MOVE 'SCON'    TO SECLINK-TYPE.                                      
           MOVE 'ACAXKU'  TO SECLINK-ITEM.                                      
           PERFORM CALL-SECLINK-RTN.                                    AEISAC07
           IF SECLINK-RETURN-CODE = '00' OR '20'                        AEISAC07
              SET WS-UPDATE-OK  TO TRUE.                                        
       EJECT                                                                    
      *                                                                         
       0200-FIRST-TIME-RTN.                                                     
           SET FIRST-TIME TO TRUE.                                              
           INITIALIZE TWA-ACAT-AREA.                                            
           MOVE 'K' TO ACAT-NEXT.                                               
           IF EIBAID = DFHPF10                                                  
           AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                              
              MOVE SPACES TO ACAT-CALLING-PROG-NAME                             
              PERFORM 7000-READ-TSQ-RTN                                         
              PERFORM 7010-DELETE-TSQ-RTN                                       
              PERFORM 0210-RETURNED-FROM-ACAT90CM                               
              PERFORM 0300-RESET-MAP                                            
              IF TWA-TFR-NEW                                                    
                 PERFORM 1000-ENTER-KEY                                         
              ELSE                                                              
                 PERFORM 7020-WRITE-TSQ-RTN                                     
                 PERFORM 8000-SEND-MAP-ERASE                                    
                 PERFORM 8800-RETURN-TO-CICS                                    
              END-IF.                                                           
      *                                                                         
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           PERFORM 7110-DELETE-HIST-ASSET-TSQ.                                  
           PERFORM 7210-DELETE-INIT-ASSET-TSQ.                                  
           MOVE SPACES TO ACAT-CALLING-PROG-NAME.                               
           IF ACAT-SEARCH-FIELDS = SPACE                                        
              MOVE '0' TO TWA-FIRST-ENTER-RTN                                   
              PERFORM 0500-INITIAL-MAP-PROTECT                                  
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
                                    MBRO  TWA-MAP-BR  TWA-SAVE-MAP-BR.          
           MOVE ACAT-INP-ACCOUNT TO MMACO TWA-MAP-MMAC                          
                                    MACO  TWA-MAP-AC  TWA-SAVE-MAP-AC.          
                                                                                
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
                 MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-ACCT-CMNTS                 
ET0001**         MOVE -1 TO MBRL                                                
              ELSE                                                              
              IF ACAT90CM-TS-SCREEN = '1'                                       
                 IF TWA-TFR-NEW                                                 
                    MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-SV-HST-CMNTS1           
                 ELSE                                                           
                    MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-SV-INI-CMNTS1           
                 END-IF                                                         
ET0001**         MOVE -1 TO MBAL01L                                             
              ELSE                                                              
              IF ACAT90CM-TS-SCREEN = '2'                                       
                 IF TWA-TFR-NEW                                                 
                    MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-SV-HST-CMNTS2           
                 ELSE                                                           
                    MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-SV-INI-CMNTS2           
                 END-IF                                                         
ET0001**         MOVE -1 TO MBAL02L                                             
              ELSE                                                              
              IF ACAT90CM-TS-SCREEN = '5'                                       
                 IF TWA-TFR-NEW                                                 
                    MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-SV-HST-CMNTS5           
                 ELSE                                                           
                    MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-SV-INI-CMNTS5           
                 END-IF                                                         
ET0001**         MOVE -1 TO MBAL05L                                             
              ELSE                                                              
              IF ACAT90CM-TS-SCREEN = 'S'                                       
                 IF TWA-TFR-NEW                                                 
                    MOVE TWA-PAGE-NUM TO WS-HST-ITEM                            
                    PERFORM 7100-READ-HIST-ASSET-TSQ                            
                    MOVE ACAT90CM-TS-MCCMNT-X120 TO TS-HST-CMNTS                
                    PERFORM 7130-REWRITE-HIST-ASSET-TSQ                         
                 END-IF                                                         
                 IF TWA-TFR-UPDATE                                              
                    MOVE TWA-PAGE-NUM TO WS-INI-ITEM                            
                    PERFORM 7200-READ-INIT-ASSET-TSQ                            
                    MOVE ACAT90CM-TS-MCCMNT-X120 TO TS-INI-CMNTS                
                 END-IF                                                         
                 IF TWA-TFR-INQUIRY                                             
                    MOVE TWA-PAGE-NUM TO WS-HST-ITEM                            
                    PERFORM 7100-READ-HIST-ASSET-TSQ                            
                    MOVE ACAT90CM-TS-MCCMNT-X120 TO TS-HST-CMNTS                
                 END-IF                                                         
ET0001**         MOVE -1 TO MQTYL                                               
              ELSE                                                              
              IF ACAT90CM-TS-SCREEN = 'R'                                       
                 IF TWA-MAP-RSON1(1:1) = '?' OR                                 
                    TWA-MAP-RSON1(2:1) = '?'                                    
                     MOVE ACAT90CM-TS-MREAS TO TWA-MAP-RSON1                    
ET0001**             MOVE -1 TO REASON1L                                        
                 ELSE                                                           
                 IF TWA-MAP-RSON2(1:1) = '?' OR                                 
                    TWA-MAP-RSON2(2:1) = '?'                                    
                     MOVE ACAT90CM-TS-MREAS TO TWA-MAP-RSON2                    
ET0001**             MOVE -1 TO REASON2L                                        
                 ELSE                                                           
                 IF TWA-MAP-RSON3(1:1) = '?' OR                                 
                    TWA-MAP-RSON3(2:1) = '?'                                    
                     MOVE ACAT90CM-TS-MREAS TO TWA-MAP-RSON3                    
ET0001**             MOVE -1 TO REASON3L                                        
                 ELSE                                                           
                 IF TWA-MAP-RSON4(1:1) = '?' OR                                 
                    TWA-MAP-RSON4(2:1) = '?'                                    
                     MOVE ACAT90CM-TS-MREAS TO TWA-MAP-RSON4                    
ET0001**             MOVE -1 TO REASON4L.                                       
ET0001           .                                                              
                                                                                
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
           MOVE TWA-RR        TO MRRO.                                          
           MOVE TWA-RCV       TO MCBRKRO.                                       
           MOVE TWA-RCV-ACCT  TO MCACCTO.                                       
ET0001     MOVE TWA-TFR-TYPE  TO MTRNFRO.                                       
           MOVE TWA-CNAME     TO MCBNAMO.                                       
           MOVE TWA-ACCT-TYPE TO MCTYPEO.                                       
           IF TWA-STTL-DATE = '0001-01-01'                                      
              MOVE SPACE          TO MSDO                               10350002
           ELSE                                                                 
           IF TWA-STTL-DATE > SPACE                                             
              MOVE TWA-STTL-DATE  TO WS-DB2-FORM-DATE                           
              MOVE WS-DATE-YY     TO WS-EDITED-YY                               
              MOVE WS-DATE-MM     TO WS-EDITED-MM                               
              MOVE WS-DATE-DD     TO WS-EDITED-DD                               
              MOVE WS-EDITED-DATE TO MSDO.                                      
           MOVE TWA-ACAT          TO MACATO.                                    
           IF TWA-TFR-UPDATE                                                    
ET0005**      MOVE SPACE          TO MACATO.                                    
ET0005        IF TWA-ADP-CONTROL-NBR > SPACE                                    
ET0005           MOVE TWA-ADP-CONTROL-NBR TO MACATO                             
ET0005        ELSE                                                              
ET0005           MOVE SPACE  TO MACATO                                          
ET0005        END-IF                                                            
ET0005     END-IF.                                                              
           EVALUATE TWA-STATUS                                          08505010
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
                    MOVE TWA-STATUS                                     08510210
                      TO  MSTATO                                        08507010
           END-EVALUATE.                                                08510310
           MOVE TWA-CUST-NM1      TO MNAMEO.                                    
           MOVE TWA-CUST-NM2      TO MNAME2O.                                   
           IF TWA-SS1 = SPACE                                                   
              MOVE SPACE  TO MSSNO                                              
           ELSE                                                                 
              MOVE TWA-SS1(1:3)       TO WS-SS-NUM1                             
              MOVE TWA-SS1(4:2)       TO WS-SS-NUM2                             
              MOVE TWA-SS1(6:4)       TO WS-SS-NUM3                             
              MOVE WS-SS-NUM          TO MSSNO.                                 
           IF TWA-SS2 = SPACE                                                   
              MOVE SPACE  TO MSSN2O                                             
           ELSE                                                                 
              MOVE TWA-SS2(1:3)       TO WS-SS-NUM1                             
              MOVE TWA-SS2(4:2)       TO WS-SS-NUM2                             
              MOVE TWA-SS2(6:4)       TO WS-SS-NUM3                             
              MOVE WS-SS-NUM          TO MSSN2O.                                
           MOVE TWA-SECUR             TO MSECRO.                                
           MOVE TWA-CATGRY            TO MCATGRO.                               
           MOVE TWA-SLOC              TO MSLOCO.                                
           MOVE TWA-SEC-TYPE          TO MTYPEO.                                
           MOVE TWA-DESCRIPT(1:60)    TO MDESC1O.                               
           MOVE TWA-DESCRIPT(61:60)   TO MDESC2O.                               
           MOVE TWA-MAP-BR            TO MBRO.                                  
           MOVE TWA-MAP-AC            TO MACO.                                  
           MOVE TWA-MAP-BAL01         TO MBAL01I.                               
           MOVE TWA-MAP-BAL02         TO MBAL02I.                               
           MOVE TWA-MAP-BAL05         TO MBAL05I.                               
           MOVE TWA-MAP-QTY           TO MQTYI.                                 
           MOVE TWA-MAP-RSON1         TO REASON1O.                              
           MOVE TWA-MAP-RSON2         TO REASON2O.                              
           MOVE TWA-MAP-RSON3         TO REASON3O.                              
           MOVE TWA-MAP-RSON4         TO REASON4O.                              
           MOVE TWA-MAP-RCLM1         TO RECLM1O.                               
           IF TWA-MAP-RCLMED1 = 'Y'                                             
              MOVE 'Y'                TO RECLM1O.                               
           MOVE TWA-MAP-RCLM2         TO RECLM2O.                               
           IF TWA-MAP-RCLMED2 = 'Y'                                             
              MOVE 'Y'                TO RECLM2O.                               
           MOVE TWA-MAP-RCLM3         TO RECLM3O.                               
           IF TWA-MAP-RCLMED3 = 'Y'                                             
              MOVE 'Y'                TO RECLM3O.                               
           MOVE TWA-MAP-RCLM4         TO RECLM4O.                               
           IF TWA-MAP-RCLMED4 = 'Y'                                             
              MOVE 'Y'                TO RECLM4O.                               
           MOVE SPACE                 TO MNEXTO TWA-MAP-NEXT.                   
           MOVE SPACE                 TO MSUBO  TWA-MAP-SUB.                    
           MOVE SPACE                 TO MDELO  TWA-MAP-DEL.                    
           IF TWA-TFR-NEW                                                       
              MOVE ATT-ASKIP  TO MDELA                                          
              IF TWA-MAP-BAL01 = SPACE OR LOW-VALUE                             
                  MOVE ATT-ASKIP  TO MBAL01A REASON1A RECLM1A                   
              ELSE                                                              
                  IF TWA-MAP-RCLMED1 = 'Y'                                      
                     MOVE ATT-ASKIP  TO MBAL01A REASON1A RECLM1A                
                  END-IF                                                        
              END-IF                                                            
              IF TWA-MAP-BAL02 = SPACE OR LOW-VALUE                             
                 MOVE ATT-ASKIP  TO MBAL02A REASON2A RECLM2A                    
              ELSE                                                              
                  IF TWA-MAP-RCLMED2 = 'Y'                                      
                     MOVE ATT-ASKIP  TO MBAL02A REASON2A RECLM2A                
                  END-IF                                                        
              END-IF                                                            
              IF TWA-MAP-BAL05 = SPACE OR LOW-VALUE                             
                 MOVE ATT-ASKIP  TO MBAL05A REASON3A RECLM3A                    
              ELSE                                                              
                  IF TWA-MAP-RCLMED3 = 'Y'                                      
                     MOVE ATT-ASKIP  TO MBAL05A REASON3A RECLM3A                
                  END-IF                                                        
              END-IF                                                            
              IF TWA-MAP-QTY = SPACE OR LOW-VALUE                               
                 MOVE ATT-ASKIP  TO MQTYA   REASON4A RECLM4A                    
              ELSE                                                              
                  IF TWA-MAP-RCLMED4 = 'Y'                                      
                     MOVE ATT-ASKIP  TO MQTYA REASON4A RECLM4A                  
                  END-IF                                                        
              END-IF                                                            
           ELSE                                                                 
ET0002**   IF TWA-TFR-UPDATE                                                    
ET0002**      MOVE ATT-UNPROT TO MDELA                                          
ET0002        MOVE -1 TO MNEXTL                                                 
              MOVE ATT-ASKIP  TO MBAL01A                                        
                                 REASON1A                                       
                                 RECLM1A                                        
                                 MBAL02A                                        
                                 REASON2A                                       
                                 RECLM2A                                        
                                 MBAL05A                                        
                                 REASON3A                                       
                                 RECLM3A                                        
                                 MQTYA                                          
                                 REASON4A                                       
                                 RECLM4A                                        
                                 MSUBA                                          
ET0002                           MBRA                                           
ET0002                           MACA                                           
ET0002                           MDELA                                          
ET0002        IF TWA-TFR-UPDATE                                                 
ET0002           MOVE ATT-UNPROT TO MBRA                                        
ET0002                              MACA                                        
ET0002**                            MDELA                                       
ET0003           IF NOT TWA-NSCC-PEND-CD-IS-Y                                   
ET0003              MOVE ATT-UNPROT TO MDELA                                    
ET0003           END-IF                                                         
ET0002        END-IF.                                                           
                                                                                
ET0006     IF TWA-TFR-NEW AND TWA-ADD-ASSET                                     
ET0006        MOVE ATT-UNPROT     TO MSECRA                                     
ET0006                               MCATGRA                                    
ET0006                               MSLOCA                                     
ET0006                               MTYPEA                                     
ET0006                               MQTYA                                      
ET0006                               MAMTA                                      
ET0006        MOVE TWA-MAP-AMT    TO MAMTI                                      
ET0006        MOVE ATT-ASKIP      TO AMTDESCA                                   
ET0006     ELSE                                                                 
ET0006        MOVE ATT-ASKIP      TO MSECRA                                     
ET0006                               MCATGRA                                    
ET0006                               MSLOCA                                     
ET0006                               MTYPEA                                     
ET0006        MOVE SPACE          TO MAMTI                                      
ET0006        MOVE ATT-ASKIP-DRK  TO AMTDESCA                                   
ET0006                               MAMTA                                      
ET0006     END-IF.                                                              
                                                                                
           MOVE TWA-MAP-MMBR   TO MMBRO.                                        
           MOVE TWA-MAP-MMAC   TO MMACO.                                        
           MOVE TWA-MAP-MMRR   TO MMRRO.                                        
           MOVE TWA-MAP-MMTFR  TO MMTFRO.                                       
           MOVE TWA-MAP-MMRD   TO MMRDO.                                        
           MOVE TWA-MAP-MMBKR  TO MMBKRO.                                       
           MOVE TWA-MAP-MMSTAT TO MMSTATO.                                      
           MOVE TWA-MAP-MMSD   TO MMSDO.                                        
       EJECT                                                                   2
      *                                                                         
      *----------------------------------------------------------------*        
      *    INITIALIZE MAP AREA FOR THE FIRST TIME                      *        
      *----------------------------------------------------------------*        
       0500-INITIAL-MAP-PROTECT.                                                
ET0006     MOVE ATT-ASKIP-DRK TO AMTDESCA                                       
ET0006                           MAMTA.                                         
                                                                                
           MOVE ATT-ASKIP  TO MBAL01A                                           
                              REASON1A                                          
                              RECLM1A                                           
                              MBAL02A                                           
                              REASON2A                                          
                              RECLM2A                                           
                              MBAL05A                                           
                              REASON3A                                          
                              RECLM3A                                           
ET0006                        MSECRA                                            
ET0006                        MCATGRA                                           
ET0006                        MSLOCA                                            
ET0006                        MTYPEA                                            
                              MQTYA                                             
                              REASON4A                                          
                              RECLM4A                                           
                              MSUBA                                             
                              MDELA.                                            
                                                                                
           MOVE ATT-UNPROT TO MBRA                                              
                              MACA                                              
                              MMBRA                                             
                              MMACA                                             
                              MMRRA                                             
                              MCURA                                             
                              MMTFRA                                            
                              MMRDA                                             
                              MMBKRA                                            
                              MMSTATA                                           
                              MMSDA.                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    CONTROL WAS TRANSFERED FROM ACAT15TC (REJECTED BY CONTRA)   *        
      *    TO RESUBMIT THE REJECTED RECLAIM.                           *        
      *----------------------------------------------------------------*        
       0600-RESUBMIT-REJECTED-RCLM.                                             
           SET FIRST-TIME TO TRUE.                                              
           INITIALIZE TWA-ACAT-AREA.                                            
           MOVE 'K' TO ACAT-NEXT.                                               
           MOVE SPACES TO ACAT-CALLING-PROG-NAME.                               
           MOVE SPACES TO ACAT-BR-AC.                                           
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           SET  TWA-TFR-NEW     TO TRUE.                                        
           MOVE 'Y'  TO TWA-RESUB-REJECT.                                       
           MOVE '2'  TO TWA-FIRST-ENTER-RTN.                                    
           PERFORM 0500-INITIAL-MAP-PROTECT.                                    
           PERFORM 0690-GET-REJECTED-TRANSFER.                                  
           IF ACAT12-NOT-FOUND                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'REJECTED RECLAIM TRANSFER NOT FOUND' TO SYSTEM-MSG          
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
           PERFORM 2000-NEW-ACCT-ENTRY.                                         
           IF NOT WK-ERROR                                                      
              MOVE -1 TO MNEXTL                                                 
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
           MOVE ACAT-CONTROL-NBR TO ACAT12-PASS-ACAT.                           
           SET  ACAT12-GET-TRANSFER TO TRUE.                                    
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MNEXTL                                                 
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 GET TRANSFER ERROR - CALL HELP DESK'                    
LRM010                        TO WK-DB2-ERROR                                   
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT12-NORMAL                                                     
              MOVE ACAT12-TFR-DLVR-ACCT(1:8) TO WS-DLVR-ACCT                    
              MOVE ACAT12-TFR-RR             TO TWA-RR                          
              PERFORM 2500-BR-AE-SECURITY                               04772510
              IF SRCH-SIGNON-SECR-CHECK-PASS                            04772510
                 MOVE ACAT12-TFR-DLVR      TO TWA-DLVR                          
                 MOVE ACAT12-TFR-DLVR-ACCT TO WS-PASS-ACCT-DLV                  
                 MOVE WS-PASS-BR   TO MBRO TWA-MAP-BR TWA-SAVE-MAP-BR           
                 MOVE WS-PASS-ACCT TO MACO TWA-MAP-AC TWA-SAVE-MAP-AC           
                 MOVE ACAT12-TFR-RCV      TO MCBRKRO TWA-RCV                    
                 MOVE ACAT12-TFR-RCV-ACCT TO MCACCTO TWA-RCV-ACCT               
ET0001           MOVE ACAT12-TFR-TYPE     TO MTRNFRO TWA-TFR-TYPE               
                 MOVE ATT-UNPROT TO MBRA MACA                                   
              ELSE                                                      04772510
                 MOVE -1      TO MNEXTL                                 04772510
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'UNAUTHORIZED FOR THE REQUESTED BRANCH'           04772510
                   TO  SYSTEM-MSG                                               
                 PERFORM 9000-ERROR-RTN                                         
              END-IF.                                                   04772510
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    CONTROL WAS PASSED FROM ACAT21PT TO INQUIRE PENDIG RECLAIM  *        
      *----------------------------------------------------------------*        
       0700-INQUIRE-PEND-RCLM.                                                  
           SET FIRST-TIME TO TRUE.                                              
           INITIALIZE TWA-ACAT-AREA.                                            
           MOVE 'K' TO ACAT-NEXT.                                               
           MOVE SPACES TO ACAT-CALLING-PROG-NAME.                               
           MOVE SPACES TO ACAT-BR-AC.                                           
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           PERFORM 7110-DELETE-HIST-ASSET-TSQ.                                  
           PERFORM 7210-DELETE-INIT-ASSET-TSQ.                                  
           SET  TWA-TFR-INQUIRY  TO TRUE.                                       
           PERFORM 0710-CLEAR-SCR-FOR-INQUIRY.                                  
           PERFORM 0790-GET-ACTIVE-TRANSFER.                                    
           IF ACAT12-NORMAL                                                     
              INITIALIZE TWA-SAVE-HIST-BALANCE                                  
              MOVE SPACE TO WS-NO-MORE-ASSET-SW                                 
              MOVE ACAT-CONTROL-NBR TO ACAT12-PASS-ACAT                         
              PERFORM 5600-OPEN-ASSET-CURSOR                                    
              PERFORM 0720-SAVE-ASSET-IN-TS THRU 0720-EXIT                      
                  UNTIL WS-NO-MORE-ASSET                                        
              PERFORM 5620-CLOSE-ASSET-CURSOR                                   
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'RECLAIM TRANSFER NOT FOUND' TO SYSTEM-MSG                   
              PERFORM 9000-ERROR-RTN.                                           
           PERFORM 2300-FROM-TFR.                                               
           PERFORM 2310-FROM-HIST-TWA.                                          
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
                         MBAL01I                                                
                         REASON1O                                               
                         RECLM1O                                                
                         MBAL02I                                                
                         REASON2O                                               
                         RECLM2O                                                
                         MBAL05I                                                
                         REASON3O                                               
                         RECLM3O                                                
                         MSECRO                                                 
                         MCATGRO                                                
                         MSLOCO                                                 
                         MTYPEO                                                 
                         MDESC1O                                                
                         MDESC2O                                                
                         MQTYI                                                  
                         REASON4O                                               
                         RECLM4O                                                
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
              GO TO 0720-EXIT.                                                  
ET0001**   IF ACAT12-AST-STTL-LOC = '30' OR '45'                                
ET0001**      GO TO 0720-EXIT.                                                  
ET0001     IF ACAT12-AST-STTL-LOC = '10' OR '30' OR '35' OR '45'                
ET0001        GO TO 0720-EXIT.                                                  
           IF ACAT12-AST-STTL-LOC = '40'                                        
              IF ACAT12-AST-AMT NOT = 0                                         
                 IF ACAT12-AST-CS-MG-SH = 'C'                                   
                    MOVE ACAT12-AST-AMT       TO TWA-SV-HST-BAL01-ORG           
                    MOVE ACAT12-AST-REASON    TO TWA-SV-HST-RSN1                
                    MOVE ACAT12-AST-CMNTS     TO TWA-SV-HST-CMNTS1              
                    MOVE ACAT12-AST-PSTN-CD   TO TWA-SV-HST-PSTN-CD1            
                    MOVE ACAT12-AST-STTLM-RSN TO TWA-SV-HST-STTLM-RSN1          
ET0006**            MOVE ACAT12-AST-DESC      TO TWA-SV-HST-ASSET-DESC1         
                 END-IF                                                         
                 IF ACAT12-AST-CS-MG-SH = 'M'                                   
                    MOVE ACAT12-AST-AMT       TO TWA-SV-HST-BAL02-ORG           
                    MOVE ACAT12-AST-REASON    TO TWA-SV-HST-RSN2                
                    MOVE ACAT12-AST-CMNTS     TO TWA-SV-HST-CMNTS2              
                    MOVE ACAT12-AST-PSTN-CD   TO TWA-SV-HST-PSTN-CD2            
                    MOVE ACAT12-AST-STTLM-RSN TO TWA-SV-HST-STTLM-RSN2          
ET0006**            MOVE ACAT12-AST-DESC      TO TWA-SV-HST-ASSET-DESC2         
                 END-IF                                                         
                 IF ACAT12-AST-CS-MG-SH = 'S'                                   
                    MOVE ACAT12-AST-AMT       TO TWA-SV-HST-BAL05-ORG           
                    MOVE ACAT12-AST-REASON    TO TWA-SV-HST-RSN5                
                    MOVE ACAT12-AST-CMNTS     TO TWA-SV-HST-CMNTS5              
                    MOVE ACAT12-AST-PSTN-CD   TO TWA-SV-HST-PSTN-CD5            
                    MOVE ACAT12-AST-STTLM-RSN TO TWA-SV-HST-STTLM-RSN5          
ET0006**            MOVE ACAT12-AST-DESC      TO TWA-SV-HST-ASSET-DESC5         
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              IF ACAT12-AST-QTY NOT = 0                                         
                 INITIALIZE TS-HST-ASSET-AREA                                   
                 MOVE ACAT12-AST-SEC         TO TS-HST-SECURITY                 
                 MOVE ACAT12-AST-CTGRY       TO TS-HST-CTGRY                    
                 MOVE ACAT12-AST-STTL-LOC    TO TS-HST-STTL-LOC                 
                 MOVE ACAT12-AST-CS-MG-SH    TO TS-HST-TYPE                     
                 MOVE ACAT12-AST-DESC        TO TS-HST-DESC                     
                 MOVE ACAT12-AST-QTY         TO TS-HST-QTY-ORIG                 
                 MOVE ACAT12-AST-REASON      TO TS-HST-REASON                   
                 MOVE ACAT12-AST-CMNTS       TO TS-HST-CMNTS                    
                 MOVE ACAT12-AST-PSTN-CD     TO TS-HST-PSTN-CD                  
ET0001           MOVE ACAT12-AST-STTLM-RSN   TO TS-HST-STTLM-RSN                
                 MOVE 'Y'                    TO TS-HST-RCLMED                   
                 PERFORM 7120-WRITE-HIST-ASSET-TSQ                              
                 ADD 1 TO TWA-MAX-PAGE-HST                                      
              END-IF                                                            
           END-IF.                                                              
       0720-EXIT.                                          EXIT.                
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *   PROTECT ALL SCREEN FIELDS FOR INQUIRY ONLY                   *        
      *----------------------------------------------------------------*        
       0730-PROTECT-ALL-FLDS.                                                   
ET0006     MOVE ATT-ASKIP-DRK TO AMTDESCA                                       
ET0006                           MAMTA.                                         
                                                                                
           MOVE ATT-ASKIP  TO MBRA                                              
                              MACA                                              
                              MCBRKRA                                           
                              MCACCTA                                           
ET0001                        MTRNFRA                                           
                              MBAL01A                                           
                              REASON1A                                          
                              RECLM1A                                           
                              MBAL02A                                           
                              REASON2A                                          
                              RECLM2A                                           
                              MBAL05A                                           
                              REASON3A                                          
                              RECLM3A                                           
ET0006                        MSECRA                                            
ET0006                        MCATGRA                                           
ET0006                        MSLOCA                                            
ET0006                        MTYPEA                                            
                              MQTYA                                             
                              REASON4A                                          
                              RECLM4A                                           
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
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *  READ ACTIVE TRANSFER TBL AND SETUP TWA-MAP-AREA FOR INQUIRY   *        
      *----------------------------------------------------------------*        
       0790-GET-ACTIVE-TRANSFER.                                                
           MOVE ACAT-CONTROL-NBR TO ACAT12-PASS-ACAT.                           
           SET  ACAT12-GET-TRANSFER TO TRUE.                                    
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-NOT-FOUND                                                  
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MNEXTL                                                 
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 GET TRANSFER ERROR - CALL HELP DESK'                    
LRM010                           TO WK-DB2-ERROR                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
           IF ACAT12-NORMAL                                                     
              MOVE ACAT12-TFR-DLVR-ACCT(1:8) TO WS-DLVR-ACCT                    
              MOVE ACAT12-TFR-RR             TO TWA-RR                          
              PERFORM 2500-BR-AE-SECURITY                               04772510
              IF SRCH-SIGNON-SECR-CHECK-PASS                            04772510
                 MOVE SPACE                TO TWA-MAP-AREA                      
                 MOVE ACAT12-TFR-DLVR      TO TWA-DLVR                          
                 MOVE ACAT12-TFR-DLVR-ACCT TO TWA-DLVR-ACCT                     
                 MOVE ACAT12-TFR-RCV       TO TWA-RCV                           
                 MOVE ACAT12-TFR-RCV-ACCT  TO TWA-RCV-ACCT                      
                 MOVE ACAT12-TFR-ACAT      TO TWA-ACAT                          
                 MOVE ACAT12-TFR-STTS      TO TWA-STATUS                        
                 MOVE ACAT12-TFR-ACCT-TYPE TO TWA-ACCT-TYPE                     
                 MOVE ACAT12-TFR-STTL-DT   TO TWA-STTL-DATE                     
                 MOVE ACAT12-TFR-NM1       TO TWA-CUST-NM1                      
                 MOVE ACAT12-TFR-NM2       TO TWA-CUST-NM2                      
                 MOVE ACAT12-TFR-SS1       TO TWA-SS1                           
                 MOVE ACAT12-TFR-SS2       TO TWA-SS2                           
                 MOVE ACAT12-TFR-RR        TO TWA-RR                            
                 MOVE ACAT12-TFR-TYPE      TO TWA-TFR-TYPE                      
                 MOVE ACAT12-TFR-CMNTS     TO TWA-ACCT-CMNTS                    
              ELSE                                                      04772510
                 MOVE -1      TO MNEXTL                                 04772510
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'UNAUTHORIZED FOR THE REQUESTED BRANCH'           04772510
                   TO  SYSTEM-MSG                                               
                 PERFORM 9000-ERROR-RTN                                         
              END-IF                                                    04772510
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
                     IF TWA-TFR-NEW OR TWA-TFR-UPDATE OR TWA-TFR-INQUIRY        
                         PERFORM 1800-SEND-POPUP-MAP-RTN                        
                     ELSE                                                       
                        SET  WK-ERROR  TO TRUE                                  
                        MOVE LOW-VALUE TO ACAT12MO                              
                        MOVE -1 TO MNEXTL                                       
                        MOVE 'PF1 KEY DISABLED AT THIS TIME'                    
                          TO  SYSTEM-MSG                                        
                        PERFORM 9000-ERROR-RTN                                  
                     END-IF                                                     
ET0005          WHEN EIBAID = DFHPF2                                            
ET0005               PERFORM  1900-ADD-RECLAIM                                  
ET0008          WHEN EIBAID = DFHPF4                                            
ET0008               PERFORM  5800-SRCH-ALL-NEW-RCLS                            
ET0006          WHEN EIBAID = DFHPF5                                            
ET0006               PERFORM  2700-ADD-ASSET                                    
ET0007          WHEN EIBAID = DFHPF6                                            
ET0007               PERFORM  3800-RECLAIM-ALL                                  
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
                     MOVE LOW-VALUE TO ACAT12MO                                 
                     MOVE -1 TO MNEXTL                                          
                     MOVE 'ERROR FUNCTION KEY'                                  
                       TO SYSTEM-MSG                                            
                     PERFORM 9000-ERROR-RTN                                     
           END-EVALUATE.                                                        
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *        ENTER KEY                                               *        
      *----------------------------------------------------------------*        
       1000-ENTER-KEY.                                                          
           MOVE SPACE  TO WK-ERROR-SW                                           
                          WK-MSG-ON-SW                                          
                          WS-ENTRY-FLD-SW.                                      
ET0006                                                                          
ET0006     PERFORM 1600-NEXT-SELECTION-RTN.                                     
ET0006                                                                          
           IF TWA-TFR-INQUIRY                                                   
ET0006**      PERFORM 1600-NEXT-SELECTION-RTN                                   
              PERFORM 0730-PROTECT-ALL-FLDS                                     
              PERFORM 7020-WRITE-TSQ-RTN                                        
              PERFORM 8100-SEND-MAP-DATA-ONLY                                   
              PERFORM 8800-RETURN-TO-CICS                                       
           END-IF.                                                              
                                                                                
           IF TWA-FIRST-ENTER-RTN = '0'                                         
              MOVE '1' TO TWA-FIRST-ENTER-RTN                                   
           ELSE                                                                 
           IF TWA-FIRST-ENTER-RTN = '1'                                         
              MOVE '2' TO TWA-FIRST-ENTER-RTN.                                  
                                                                                
           PERFORM 1100-VALIDATE-ACCT-ENTRY.                                    
           IF WK-ERROR                                                          
              CONTINUE                                                          
           ELSE                                                                 
              IF TWA-FIRST-ENTER-RTN = '1'                                      
                 IF TWA-SAVE-MAP-BR = MBRO  AND                                 
                    TWA-SAVE-MAP-AC = MACO                                      
                     CONTINUE                                                   
                 ELSE                                                           
                    MOVE MBRO  TO TWA-SAVE-MAP-BR                               
                    MOVE MACO  TO TWA-SAVE-MAP-AC                               
                    MOVE SPACE TO TWA-MAP-SUB TWA-MAP-DEL                       
                    PERFORM 2000-NEW-ACCT-ENTRY                                 
                    PERFORM 7020-WRITE-TSQ-RTN                                  
                    PERFORM 8100-SEND-MAP-DATA-ONLY                             
                    PERFORM 8800-RETURN-TO-CICS                                 
                 END-IF                                                         
              ELSE                                                              
                 IF TWA-SAVE-MAP-BR = TWA-MAP-BR  AND                           
                    TWA-SAVE-MAP-AC = TWA-MAP-AC                                
                     CONTINUE                                                   
                 ELSE                                                           
                    MOVE TWA-MAP-BR TO TWA-SAVE-MAP-BR                          
                    MOVE TWA-MAP-AC TO TWA-SAVE-MAP-AC                          
                    MOVE SPACE TO TWA-MAP-SUB TWA-MAP-DEL                       
                    PERFORM 2000-NEW-ACCT-ENTRY                                 
                    PERFORM 7020-WRITE-TSQ-RTN                                  
                    PERFORM 8100-SEND-MAP-DATA-ONLY                             
                    PERFORM 8800-RETURN-TO-CICS                                 
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF TWA-TFR-NEW                                                       
ET0001     AND (NOT TWA-NO-ASSET)                                               
ET0001**      IF TWA-SV-HST-BAL01-ORG = 0                                       
ET0001**      OR TWA-SV-HST-BAL1-RCLMED = 'Y'                                   
ET0001        IF TWA-SV-HST-BAL1-RCLMED = 'Y'                                   
                 CONTINUE                                                       
              ELSE                                                              
                 PERFORM 1200-VALIDATE-BAL01-RTN                                
              END-IF                                                            
ET0001**      IF TWA-SV-HST-BAL02-ORG = 0                                       
ET0001**      OR TWA-SV-HST-BAL2-RCLMED = 'Y'                                   
ET0001        IF TWA-SV-HST-BAL2-RCLMED = 'Y'                                   
                 CONTINUE                                                       
              ELSE                                                              
                 PERFORM 1300-VALIDATE-BAL02-RTN                                
              END-IF                                                            
ET0001**      IF TWA-SV-HST-BAL05-ORG = 0                                       
ET0001**      OR TWA-SV-HST-BAL5-RCLMED = 'Y'                                   
ET0001        IF TWA-SV-HST-BAL5-RCLMED = 'Y'                                   
                 CONTINUE                                                       
              ELSE                                                              
                 PERFORM 1400-VALIDATE-BAL05-RTN                                
              END-IF                                                            
ET0006        IF TWA-ADD-ASSET                                                  
ET0006           PERFORM 1450-ADD-ASSET-RTN    THRU 1450-EXIT                   
ET0006        ELSE                                                              
                 PERFORM 1500-VALIDATE-QTY-RTN THRU 1500-EXIT                   
ET0006        END-IF                                                            
ET0006     ELSE                                                                 
ET0006        IF TWA-TFR-NEW                                                    
ET0006        AND TWA-NO-ASSET                                                  
ET0006        AND TWA-ADD-ASSET                                                 
ET0006              PERFORM 1200-VALIDATE-BAL01-RTN                             
ET0006              PERFORM 1300-VALIDATE-BAL02-RTN                             
ET0006              PERFORM 1400-VALIDATE-BAL05-RTN                             
ET0006              PERFORM 1450-ADD-ASSET-RTN THRU 1450-EXIT                   
ET0006        END-IF                                                            
ET0006     END-IF.                                                              
                                                                                
ET0006**   PERFORM 1600-NEXT-SELECTION-RTN.                                     
                                                                                
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
ET0003     AND (NOT TWA-NSCC-PEND-CD-IS-Y)                                      
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
                 MOVE '0' TO TWA-DELETE-CONFIRM                                 
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
      *                                                                         
      *----------------------------------------------------------------*        
      *        VALIDATE USER ENTRY OF BRANCH AND ACCOUNT DATA          *        
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
              MOVE -1                 TO MBRL                                   
              MOVE ATT-UNPROT-BRT     TO MBRA                                   
              IF NOT WK-ERROR                                                   
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
              MOVE -1                 TO MACL                                   
              MOVE ATT-UNPROT-BRT     TO MACA                                   
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR   TO TRUE                                         
                 MOVE 'ENTER ACCOUNT' TO SYSTEM-MSG.                            
                                                                                
ET0006**   IF WK-ERROR                                                          
ET0006**      PERFORM 1600-NEXT-SELECTION-RTN                                   
ET0006**      PERFORM 2010-CLEAR-SCR                                            
ET0006**      PERFORM 7110-DELETE-HIST-ASSET-TSQ                                
ET0006**      PERFORM 7210-DELETE-INIT-ASSET-TSQ                                
ET0006**      MOVE SPACE TO TWA-TFR-UPDATE-IND TWA-SAVE-SCR-KEY                 
ET0006**      MOVE 0 TO TWA-PAGE-NUM.                                           
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *               VALIDATE MONEY BALANCE 01                        *        
      *----------------------------------------------------------------*        
       1200-VALIDATE-BAL01-RTN.                                                 
           IF MBAL01L > 0                                                       
              IF MBAL01I = TWA-MAP-BAL01                                        
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MBAL01I TO TWA-MAP-BAL01                                  
              END-IF                                                            
           ELSE                                                                 
           IF MBAL01A = ERASE-KEY                                               
              MOVE SPACES TO TWA-MAP-BAL01.                                     
           IF TWA-MAP-BAL01 = SPACE OR LOW-VALUE                                
              IF TWA-SV-HST-STTLM-RSN1 = 'CRED'                                 
                 MULTIPLY TWA-SV-HST-BAL01-ORG BY -1                            
                                     GIVING WS-SHORT-AMT                        
                 MOVE WS-SHORT-AMT          TO MBAL01O                          
                 MOVE MBAL01I               TO TWA-MAP-BAL01                    
              ELSE                                                              
                 MOVE TWA-SV-HST-BAL01-ORG  TO MBAL01O                          
                 MOVE MBAL01I               TO TWA-MAP-BAL01                    
              END-IF                                                            
              MOVE -1 TO MBAL01L                                                
              MOVE ATT-UNPROT-BRT TO MBAL01A                                    
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR   TO TRUE                                         
                 MOVE 'SPACE NOT ALLOWED - REPLACED BY ORIGINAL PRICE'  11000000
                   TO  SYSTEM-MSG                                       11000000
              END-IF                                                    11000000
           ELSE                                                                 
              MOVE TWA-MAP-BAL01  TO WK-AMT-IN                                  
              EXEC CICS LINK PROGRAM(WS-EDITMOD)                                
                          COMMAREA(EDIT-AMT-AREA)                               
                          LENGTH(LENGTH OF EDIT-AMT-AREA)                       
              END-EXEC                                                  02920002
              IF WK-AMT-RET-CODE = SPACE                                        
                 PERFORM 1550-FORMAT-AMT-RTN                                    
                 MOVE WK-FORMATTED-AMT TO MBAL01I                               
                                          TWA-MAP-BAL01                         
                 MOVE WK-AMT-OUT TO TWA-SV-HST-BAL01                            
                 IF TWA-SV-HST-BAL01 < 0                                        
                    COMPUTE TWA-SV-HST-BAL01 = TWA-SV-HST-BAL01 * -1            
                    MOVE 'N'   TO TWA-SV-HST-BAL01-SIGN                         
                 ELSE                                                           
                    MOVE SPACE TO TWA-SV-HST-BAL01-SIGN                         
                 END-IF                                                         
ET0001***        PERFORM 1210-VALIDATE-BAL01                                    
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO MBAL01A                                 
                 MOVE -1 TO MBAL01L                                             
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'INVALID BALANCE 01'                                   
                      TO SYSTEM-MSG                                             
                 END-IF                                                         
              END-IF.                                                           
                                                                        10870002
ET0001**   IF WS-VALID-BAL01                                                    
              MOVE ATT-UNPROT TO MBAL01A                                        
              PERFORM 1220-VALIDATE-RSON-RCLM-01 THRU 1220-EXIT                 
              IF NOT WK-ERROR                                           11000000
                 MOVE ATT-UNPROT TO REASON1A                                    
                                    RECLM1A                                     
                 MOVE TWA-MAP-RSON1 TO TWA-SV-HST-RSN1                          
                 MOVE TWA-MAP-RCLM1 TO TWA-SV-HST-RCL1                          
              END-IF.                                                           
       EJECT                                                                    
       1210-VALIDATE-BAL01.                                             11000000
           MOVE SPACE TO WS-VALID-BAL01-SW.                                     
           IF TWA-SV-HST-BAL01 = 0                                              
              IF TWA-SV-HST-STTLM-RSN1 = 'CRED'                                 
                 MULTIPLY TWA-SV-HST-BAL01-ORG BY -1                            
                                   GIVING WS-SHORT-AMT                          
                 MOVE WS-SHORT-AMT         TO MBAL01O                           
                 MOVE MBAL01O              TO TWA-MAP-BAL01                     
              ELSE                                                              
                 MOVE TWA-SV-HST-BAL01-ORG TO MBAL01O                           
                 MOVE MBAL01O              TO TWA-MAP-BAL01                     
              END-IF                                                            
              MOVE -1  TO MBAL01L                                       11000000
              MOVE ATT-UNPROT-BRT TO MBAL01A                            11000000
              IF NOT WK-ERROR                                           11000000
                 SET   WK-ERROR   TO  TRUE                              11000000
                 MOVE '0 AMOUNT CAN NOT BE RECLAIMED - REPLACED BY ORIGI11000000
      -               'NAL AMOUNT'                                      11000000
                   TO  SYSTEM-MSG                                       11000000
              END-IF.                                                   11000000
           IF TWA-SV-HST-STTLM-RSN1 = 'CRED'                                    
              MULTIPLY TWA-SV-HST-BAL01-ORG BY -1                               
                                  GIVING WS-SHORT-AMT-ORG                       
              IF TWA-SV-HST-BAL01-SIGN = 'N'                                    
                 MULTIPLY TWA-SV-HST-BAL01 BY -1 GIVING WS-SHORT-AMT            
                 IF WS-SHORT-AMT < WS-SHORT-AMT-ORG                             
                    MOVE -1  TO MBAL01L                                 11000000
                    MOVE ATT-UNPROT-BRT TO MBAL01A                      11000000
                    IF NOT WK-ERROR                                     11000000
                       SET   WK-ERROR   TO TRUE                         11000000
                       MOVE 'RECLAIM EXCEEDING THE ORIGINAL AMOUNT'     11000000
                         TO  SYSTEM-MSG                                 11000000
                    END-IF                                              11000000
                 ELSE                                                   11000000
                    SET WS-VALID-BAL01 TO TRUE                          11000000
                 END-IF                                                 11000000
              ELSE                                                              
                 MOVE -1  TO MBAL01L                                    11000000
                 MOVE ATT-UNPROT-BRT TO MBAL01A                         11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'RECLAIM AMOUNT ERROR'                         11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF                                                            
           ELSE                                                                 
              IF TWA-SV-HST-BAL01-SIGN = 'N'                                    
                 MOVE -1  TO MBAL01L                                    11000000
                 MOVE ATT-UNPROT-BRT TO MBAL01A                         11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'RECLAIM AMOUNT ERROR'                         11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              ELSE                                                              
                 IF TWA-SV-HST-BAL01 > TWA-SV-HST-BAL01-ORG                     
                    MOVE -1  TO MBAL01L                                 11000000
                    MOVE ATT-UNPROT-BRT TO MBAL01A                      11000000
                    IF NOT WK-ERROR                                     11000000
                       SET   WK-ERROR   TO TRUE                         11000000
                       MOVE 'RECLAIM EXCEEDING THE ORIGINAL AMOUNT'     11000000
                         TO  SYSTEM-MSG                                 11000000
                    END-IF                                              11000000
                 ELSE                                                   11000000
                    SET WS-VALID-BAL01 TO TRUE                          11000000
                 END-IF                                                 11000000
              END-IF.                                                           
       EJECT                                                            11000000
       1220-VALIDATE-RSON-RCLM-01.                                              
           IF REASON1L > 0                                                      
              IF REASON1I = TWA-MAP-RSON1                                       
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE REASON1I TO TWA-MAP-RSON1                                 
              END-IF                                                            
           ELSE                                                                 
           IF REASON1A = ERASE-KEY                                              
              MOVE SPACES TO TWA-MAP-RSON1.                                     
           IF RECLM1L > 0                                                       
              IF RECLM1I = TWA-MAP-RCLM1                                        
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE RECLM1I TO TWA-MAP-RCLM1                                  
              END-IF                                                            
           ELSE                                                                 
           IF RECLM1A = ERASE-KEY                                               
              MOVE SPACES TO TWA-MAP-RCLM1.                                     
                                                                                
ET0001**   IF NOT WS-VALID-BAL01                                                
ET0001     IF TWA-SV-HST-BAL01 = 0                                              
              IF TWA-MAP-RSON1 > SPACE                                          
                 MOVE -1 TO REASON1L                                    11000000
                 MOVE ATT-UNPROT-BRT TO REASON1A MBAL01A                11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'REASON CODE NOT APPLICABLE'                   11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF                                                    11000000
              IF TWA-MAP-RCLM1 > SPACE                                          
                 MOVE -1 TO RECLM1L                                     11000000
                 MOVE ATT-UNPROT-BRT TO RECLM1A MBAL01A                 11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'RECLAIM NOT APPLICABLE'                       11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF                                                    11000000
              GO TO 1220-EXIT                                           11000000
           END-IF.                                                              
                                                                                
           IF TWA-MAP-RSON1 = SPACE                                             
              IF TWA-MAP-RCLM1 > SPACE                                          
                 MOVE -1 TO REASON1L                                    11000000
                 MOVE ATT-UNPROT-BRT TO REASON1A                        11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'ENTER REASON, OR TYPE "?" FOR REASON CODE INQU11000000
      -                  'IRY/SELECTION'                                11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              ELSE                                                              
                 CONTINUE                                               11000000
              END-IF                                                            
           ELSE                                                         11000000
              IF TWA-MAP-RSON1 = '60' OR '61' OR '62' OR                        
                                 '63' OR '64' OR '65'                           
ET0001**         CONTINUE                                               11000000
ET0001           IF TWA-MAP-RCLM1 = 'Y'                                         
ET0001              CONTINUE                                                    
ET0001           ELSE                                                           
ET0001              MOVE -1 TO RECLM1L                                          
ET0001              MOVE ATT-UNPROT-BRT TO RECLM1A                      11000000
ET0001              IF NOT WK-ERROR                                     11000000
ET0001                 SET   WK-ERROR   TO TRUE                         11000000
ET0001              MOVE 'ENTER "Y" TO RECLAIM' TO SYSTEM-MSG           11000000
ET0001           END-IF                                                 11000000
              ELSE                                                              
              IF TWA-MAP-RSON1(1:1) = '?' OR                                    
                 TWA-MAP-RSON1(1:2) = '?'                                       
                  MOVE 'R' TO TWA-SCREEN                                        
                  PERFORM 1800-SEND-POPUP-MAP-RTN                               
              ELSE                                                              
                 MOVE -1  TO REASON1L                                   11000000
                 MOVE ATT-UNPROT-BRT TO REASON1A                        11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'INVALID REASON CODE'                          11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF.                                                           
                                                                        11000000
           IF TWA-MAP-RCLM1  =  SPACE OR 'Y'                                    
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO RECLM1L                                        11000000
              MOVE ATT-UNPROT-BRT TO RECLM1A                            11000000
              IF NOT WK-ERROR                                           11000000
                 SET   WK-ERROR   TO  TRUE                              11000000
              MOVE 'ENTER "Y" TO RECLAIM OR SPACE OTHERWISE'            11000000
                TO SYSTEM-MSG                                           11000000
              END-IF                                                    11000000
           END-IF.                                                      11000000
       1220-EXIT.                                       EXIT.                   
       EJECT                                                            11000000
      *                                                                         
      *----------------------------------------------------------------*        
      *               VALIDATE MONEY BALANCE 02                        *        
      *----------------------------------------------------------------*        
       1300-VALIDATE-BAL02-RTN.                                                 
           IF MBAL02L > 0                                                       
              IF MBAL02I = TWA-MAP-BAL02                                        
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MBAL02I TO TWA-MAP-BAL02                                  
              END-IF                                                            
           ELSE                                                                 
              IF MBAL02A = ERASE-KEY                                            
                 MOVE SPACES TO TWA-MAP-BAL02                                   
              END-IF                                                            
           END-IF.                                                              
           IF TWA-MAP-BAL02 = SPACE OR LOW-VALUE                                
              IF TWA-SV-HST-STTLM-RSN2 = 'CRED'                                 
                 MULTIPLY TWA-SV-HST-BAL02-ORG BY -1                            
                                     GIVING WS-SHORT-AMT                        
                 MOVE WS-SHORT-AMT          TO MBAL02O                          
                 MOVE MBAL02I               TO TWA-MAP-BAL02                    
              ELSE                                                              
                 MOVE TWA-SV-HST-BAL02-ORG  TO MBAL02O                          
                 MOVE MBAL02I               TO TWA-MAP-BAL02                    
              END-IF                                                            
              MOVE -1 TO MBAL02L                                                
              MOVE ATT-UNPROT-BRT TO MBAL02A                                    
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR   TO TRUE                                         
                 MOVE 'SPACE NOT ALLOWED - REPLACED BY ORIGINAL AMOUNT' 11000000
                   TO  SYSTEM-MSG                                       11000000
              END-IF                                                    11000000
           ELSE                                                                 
              MOVE TWA-MAP-BAL02  TO WK-AMT-IN                                  
              EXEC CICS LINK PROGRAM(WS-EDITMOD)                                
                          COMMAREA(EDIT-AMT-AREA)                               
                          LENGTH(LENGTH OF EDIT-AMT-AREA)                       
              END-EXEC                                                  02920002
              IF WK-AMT-RET-CODE = SPACE                                        
                 PERFORM 1550-FORMAT-AMT-RTN                                    
                 MOVE WK-FORMATTED-AMT TO MBAL02I                               
                                          TWA-MAP-BAL02                         
                 MOVE WK-AMT-OUT TO TWA-SV-HST-BAL02                            
                 IF TWA-SV-HST-BAL02 < 0                                        
                    COMPUTE TWA-SV-HST-BAL02 = TWA-SV-HST-BAL02 * -1            
                    MOVE 'N'   TO TWA-SV-HST-BAL02-SIGN                         
                 ELSE                                                           
                    MOVE SPACE TO TWA-SV-HST-BAL02-SIGN                         
                 END-IF                                                         
ET0001**         PERFORM 1310-VALIDATE-BAL02                                    
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO MBAL02A                                 
                 MOVE -1 TO MBAL02L                                             
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'INVALID BALANCE 02'                                   
                      TO SYSTEM-MSG                                             
                 END-IF                                                         
              END-IF.                                                           
                                                                        10870002
ET0001**   IF WS-VALID-BAL02                                                    
              MOVE ATT-UNPROT TO MBAL02A                                        
              PERFORM 1320-VALIDATE-RSON-RCLM-02 THRU 1320-EXIT                 
              IF NOT WK-ERROR                                           11000000
                 MOVE ATT-UNPROT TO REASON2A                                    
                                    RECLM2A                                     
                 MOVE TWA-MAP-RSON2 TO TWA-SV-HST-RSN2                          
                 MOVE TWA-MAP-RCLM2 TO TWA-SV-HST-RCL2                          
              END-IF.                                                           
       EJECT                                                                    
       1310-VALIDATE-BAL02.                                             11000000
           MOVE SPACE TO WS-VALID-BAL02-SW.                                     
           IF TWA-SV-HST-BAL02 = 0                                              
              IF TWA-SV-HST-STTLM-RSN2 = 'CRED'                                 
                 MULTIPLY TWA-SV-HST-BAL02-ORG BY -1                            
                                   GIVING WS-SHORT-AMT                          
                 MOVE WS-SHORT-AMT         TO MBAL02O                           
                 MOVE MBAL02O              TO TWA-MAP-BAL02                     
              ELSE                                                              
                 MOVE TWA-SV-HST-BAL02-ORG TO MBAL02O                           
                 MOVE MBAL02O              TO TWA-MAP-BAL02                     
              END-IF                                                            
              MOVE -1  TO MBAL02L                                       11000000
              MOVE ATT-UNPROT-BRT TO MBAL02A                            11000000
              IF NOT WK-ERROR                                           11000000
                 SET   WK-ERROR   TO  TRUE                              11000000
                 MOVE '0 AMOUNT CAN NOT BE RECLAIMED - REPLACED BY ORIGI11000000
      -               'NAL AMOUNT'                                      11000000
                   TO  SYSTEM-MSG                                       11000000
              END-IF.                                                   11000000
           IF TWA-SV-HST-STTLM-RSN2 = 'CRED'                                    
              MULTIPLY TWA-SV-HST-BAL02-ORG BY -1                               
                                  GIVING WS-SHORT-AMT-ORG                       
              IF TWA-SV-HST-BAL02-SIGN = 'N'                                    
                 MULTIPLY TWA-SV-HST-BAL02 BY -1 GIVING WS-SHORT-AMT            
                 IF WS-SHORT-AMT < WS-SHORT-AMT-ORG                             
                    MOVE -1  TO MBAL02L                                 11000000
                    MOVE ATT-UNPROT-BRT TO MBAL02A                      11000000
                    IF NOT WK-ERROR                                     11000000
                       SET   WK-ERROR   TO TRUE                         11000000
                       MOVE 'RECLAIM EXCEEDING THE ORIGINAL AMOUNT'     11000000
                         TO  SYSTEM-MSG                                 11000000
                    END-IF                                              11000000
                 ELSE                                                   11000000
                    SET WS-VALID-BAL02 TO TRUE                          11000000
                 END-IF                                                 11000000
              ELSE                                                              
                 MOVE -1  TO MBAL02L                                    11000000
                 MOVE ATT-UNPROT-BRT TO MBAL02A                         11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'RECLAIM AMOUNT ERROR'                         11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF                                                            
           ELSE                                                                 
              IF TWA-SV-HST-BAL02-SIGN = 'N'                                    
                 MOVE -1  TO MBAL02L                                    11000000
                 MOVE ATT-UNPROT-BRT TO MBAL02A                         11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'RECLAIM AMOUNT ERROR'                         11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              ELSE                                                              
                 IF TWA-SV-HST-BAL02 > TWA-SV-HST-BAL02-ORG                     
                    MOVE -1  TO MBAL02L                                 11000000
                    MOVE ATT-UNPROT-BRT TO MBAL02A                      11000000
                    IF NOT WK-ERROR                                     11000000
                       SET   WK-ERROR   TO TRUE                         11000000
                       MOVE 'RECLAIM EXCEEDING THE ORIGINAL AMOUNT'     11000000
                         TO  SYSTEM-MSG                                 11000000
                    END-IF                                              11000000
                 ELSE                                                   11000000
                    SET WS-VALID-BAL02 TO TRUE                          11000000
                 END-IF                                                 11000000
              END-IF.                                                   11000000
       EJECT                                                            11000000
       1320-VALIDATE-RSON-RCLM-02.                                              
           IF REASON2L > 0                                                      
              IF REASON2I = TWA-MAP-RSON2                                       
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE REASON2I TO TWA-MAP-RSON2                                 
              END-IF                                                            
           ELSE                                                                 
           IF REASON2A = ERASE-KEY                                              
              MOVE SPACES TO TWA-MAP-RSON2.                                     
           IF RECLM2L > 0                                                       
              IF RECLM2I = TWA-MAP-RCLM2                                        
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE RECLM2I TO TWA-MAP-RCLM2                                  
              END-IF                                                            
           ELSE                                                                 
           IF RECLM2A = ERASE-KEY                                               
              MOVE SPACES TO TWA-MAP-RCLM2.                                     
                                                                                
ET0001**   IF NOT WS-VALID-BAL02                                                
ET0001     IF TWA-SV-HST-BAL02 = 0                                              
              IF TWA-MAP-RSON2 > SPACE                                          
                 MOVE -1 TO REASON2L                                    11000000
                 MOVE ATT-UNPROT-BRT TO REASON2A MBAL02A                11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'REASON CODE NOT APPLICABLE'                   11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF                                                    11000000
              IF TWA-MAP-RCLM2 > SPACE                                          
                 MOVE -1 TO RECLM2L                                     11000000
                 MOVE ATT-UNPROT-BRT TO RECLM2A MBAL02A                 11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'RECLAIM NOT APPLICABLE'                       11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF                                                    11000000
              GO TO 1320-EXIT                                           11000000
           END-IF.                                                              
                                                                                
           IF TWA-MAP-RSON2 = SPACE                                             
              IF TWA-MAP-RCLM2 > SPACE                                          
                 MOVE -1 TO REASON2L                                    11000000
                 MOVE ATT-UNPROT-BRT TO REASON2A                        11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'ENTER REASON, OR TYPE "?" FOR REASON CODE INQU11000000
      -                  'IRY/SELECTION'                                11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              ELSE                                                              
                 CONTINUE                                               11000000
              END-IF                                                            
           ELSE                                                         11000000
              IF TWA-MAP-RSON2 = '60' OR '61' OR '62' OR                        
                                 '63' OR '64' OR '65'                           
ET0001**         CONTINUE                                               11000000
ET0001           IF TWA-MAP-RCLM2 = 'Y'                                         
ET0001              CONTINUE                                                    
ET0001           ELSE                                                           
ET0001              MOVE -1 TO RECLM2L                                          
ET0001              MOVE ATT-UNPROT-BRT TO RECLM2A                      11000000
ET0001              IF NOT WK-ERROR                                     11000000
ET0001                 SET   WK-ERROR   TO TRUE                         11000000
ET0001              MOVE 'ENTER "Y" TO RECLAIM' TO SYSTEM-MSG           11000000
ET0001           END-IF                                                 11000000
              ELSE                                                              
              IF TWA-MAP-RSON2(1:1) = '?' OR                                    
                 TWA-MAP-RSON2(1:2) = '?'                                       
                  MOVE 'R' TO TWA-SCREEN                                        
                  PERFORM 1800-SEND-POPUP-MAP-RTN                               
              ELSE                                                              
                 MOVE -1  TO REASON2L                                   11000000
                 MOVE ATT-UNPROT-BRT TO REASON2A                        11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'INVALID REASON CODE'                          11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF.                                                           
                                                                        11000000
           IF TWA-MAP-RCLM2  =  SPACE OR 'Y'                                    
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO RECLM2L                                        11000000
              MOVE ATT-UNPROT-BRT TO RECLM2A                            11000000
              IF NOT WK-ERROR                                           11000000
                 SET   WK-ERROR   TO  TRUE                              11000000
              MOVE 'ENTER "Y" TO RECLAIM OR SPACE OTHERWISE'            11000000
                TO SYSTEM-MSG                                           11000000
              END-IF                                                    11000000
           END-IF.                                                      11000000
       1320-EXIT.                                       EXIT.                   
       EJECT                                                            11000000
      *                                                                         
      *----------------------------------------------------------------*        
      *               VALIDATE MONEY BALANCE 05                        *        
      *----------------------------------------------------------------*        
       1400-VALIDATE-BAL05-RTN.                                                 
           IF MBAL05L > 0                                                       
              IF MBAL05I = TWA-MAP-BAL05                                        
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MBAL05I TO TWA-MAP-BAL05                                  
              END-IF                                                            
           ELSE                                                                 
              IF MBAL05A = ERASE-KEY                                            
                 MOVE SPACES TO TWA-MAP-BAL05                                   
              END-IF                                                            
           END-IF.                                                              
           IF TWA-MAP-BAL05 = SPACE OR LOW-VALUE                                
              IF TWA-SV-HST-STTLM-RSN5 = 'CRED'                                 
                 MULTIPLY TWA-SV-HST-BAL05-ORG BY -1                            
                                     GIVING WS-SHORT-AMT                        
                 MOVE WS-SHORT-AMT          TO MBAL05O                          
                 MOVE MBAL05I               TO TWA-MAP-BAL05                    
              ELSE                                                              
                 MOVE TWA-SV-HST-BAL05-ORG  TO MBAL05O                          
                 MOVE MBAL05I               TO TWA-MAP-BAL05                    
              END-IF                                                            
              MOVE -1 TO MBAL05L                                                
              MOVE ATT-UNPROT-BRT TO MBAL05A                                    
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR   TO TRUE                                         
                 MOVE 'SPACE NOT ALLOWED - REPLACED BY ORIGINAL AMOUNT' 11000000
                   TO  SYSTEM-MSG                                       11000000
              END-IF                                                    11000000
           ELSE                                                                 
              MOVE TWA-MAP-BAL05  TO WK-AMT-IN                                  
              EXEC CICS LINK PROGRAM(WS-EDITMOD)                                
                          COMMAREA(EDIT-AMT-AREA)                               
                          LENGTH(LENGTH OF EDIT-AMT-AREA)                       
              END-EXEC                                                  02920002
              IF WK-AMT-RET-CODE = SPACE                                        
                 PERFORM 1550-FORMAT-AMT-RTN                                    
                 MOVE WK-FORMATTED-AMT TO MBAL05I                               
                                          TWA-MAP-BAL05                         
                 MOVE WK-AMT-OUT TO TWA-SV-HST-BAL05                            
                 IF TWA-SV-HST-BAL05 < 0                                        
                    COMPUTE TWA-SV-HST-BAL05 = TWA-SV-HST-BAL05 * -1            
                    MOVE 'N'   TO TWA-SV-HST-BAL05-SIGN                         
                 ELSE                                                           
                    MOVE SPACE TO TWA-SV-HST-BAL05-SIGN                         
                 END-IF                                                         
ET0001**         PERFORM 1410-VALIDATE-BAL05                                    
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO MBAL05A                                 
                 MOVE -1 TO MBAL05L                                             
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'INVALID BALANCE 05'                                   
                      TO SYSTEM-MSG                                             
                 END-IF                                                         
              END-IF.                                                           
                                                                        10870002
ET0001**   IF WS-VALID-BAL05                                                    
              MOVE ATT-UNPROT TO MBAL05A                                        
              PERFORM 1420-VALIDATE-RSON-RCLM-03 THRU 1420-EXIT                 
              IF NOT WK-ERROR                                           11000000
                 MOVE ATT-UNPROT TO REASON3A                                    
                                    RECLM3A                                     
                 MOVE TWA-MAP-RSON3 TO TWA-SV-HST-RSN5                          
                 MOVE TWA-MAP-RCLM3 TO TWA-SV-HST-RCL5                          
              END-IF.                                                           
       EJECT                                                                    
       1410-VALIDATE-BAL05.                                             11000000
           MOVE SPACE TO WS-VALID-BAL05-SW.                                     
           IF TWA-SV-HST-BAL05 = 0                                              
              IF TWA-SV-HST-STTLM-RSN5 = 'CRED'                                 
                 MULTIPLY TWA-SV-HST-BAL05-ORG BY -1                            
                                     GIVING WS-SHORT-AMT                        
                 MOVE WS-SHORT-AMT         TO MBAL05O                           
                 MOVE MBAL05O              TO TWA-MAP-BAL05                     
              ELSE                                                              
                 MOVE TWA-SV-HST-BAL05-ORG TO MBAL05O                           
                 MOVE MBAL05O              TO TWA-MAP-BAL05                     
              END-IF                                                            
              MOVE -1  TO MBAL05L                                       11000000
              MOVE ATT-UNPROT-BRT TO MBAL05A                            11000000
              IF NOT WK-ERROR                                           11000000
                 SET   WK-ERROR   TO  TRUE                              11000000
                 MOVE '0 AMOUNT CAN NOT BE RECLAIMED - REPLACED BY ORIGI11000000
      -               'NAL AMOUNT'                                      11000000
                   TO  SYSTEM-MSG                                       11000000
              END-IF.                                                   11000000
           IF TWA-SV-HST-STTLM-RSN5 = 'CRED'                                    
              MULTIPLY TWA-SV-HST-BAL05-ORG BY -1                               
                                  GIVING WS-SHORT-AMT-ORG                       
              IF TWA-SV-HST-BAL05-SIGN = 'N'                                    
                 MULTIPLY TWA-SV-HST-BAL05 BY -1 GIVING WS-SHORT-AMT            
                 IF WS-SHORT-AMT < WS-SHORT-AMT-ORG                             
                    MOVE -1  TO MBAL05L                                 11000000
                    MOVE ATT-UNPROT-BRT TO MBAL05A                      11000000
                    IF NOT WK-ERROR                                     11000000
                       SET   WK-ERROR   TO TRUE                         11000000
                       MOVE 'RECLAIM EXCEEDING THE ORIGINAL AMOUNT'     11000000
                         TO  SYSTEM-MSG                                 11000000
                    END-IF                                              11000000
                 ELSE                                                   11000000
                    SET WS-VALID-BAL05 TO TRUE                          11000000
                 END-IF                                                 11000000
              ELSE                                                              
                 MOVE -1  TO MBAL05L                                    11000000
                 MOVE ATT-UNPROT-BRT TO MBAL05A                         11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'RECLAIM AMOUNT ERROR'                         11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF                                                            
           ELSE                                                                 
              IF TWA-SV-HST-BAL05-SIGN = 'N'                                    
                 MOVE -1  TO MBAL05L                                    11000000
                 MOVE ATT-UNPROT-BRT TO MBAL05A                         11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'RECLAIM AMOUNT ERROR'                         11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              ELSE                                                              
                 IF TWA-SV-HST-BAL05 > TWA-SV-HST-BAL05-ORG                     
                    MOVE -1  TO MBAL05L                                 11000000
                    MOVE ATT-UNPROT-BRT TO MBAL05A                      11000000
                    IF NOT WK-ERROR                                     11000000
                       SET   WK-ERROR   TO TRUE                         11000000
                       MOVE 'RECLAIM EXCEEDING THE ORIGINAL AMOUNT'     11000000
                         TO  SYSTEM-MSG                                 11000000
                    END-IF                                              11000000
                 ELSE                                                   11000000
                    SET WS-VALID-BAL05 TO TRUE                          11000000
                 END-IF                                                 11000000
              END-IF.                                                   11000000
       EJECT                                                            11000000
       1420-VALIDATE-RSON-RCLM-03.                                              
           IF REASON3L > 0                                                      
              IF REASON3I = TWA-MAP-RSON3                                       
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE REASON3I TO TWA-MAP-RSON3                                 
              END-IF                                                            
           ELSE                                                                 
           IF REASON3A = ERASE-KEY                                              
              MOVE SPACES TO TWA-MAP-RSON3.                                     
           IF RECLM3L > 0                                                       
              IF RECLM3I = TWA-MAP-RCLM3                                        
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE RECLM3I TO TWA-MAP-RCLM3                                  
              END-IF                                                            
           ELSE                                                                 
           IF RECLM3A = ERASE-KEY                                               
              MOVE SPACES TO TWA-MAP-RCLM3.                                     
                                                                                
ET0001**   IF NOT WS-VALID-BAL05                                                
ET0001     IF TWA-SV-HST-BAL05 = 0                                              
              IF TWA-MAP-RSON3 > SPACE                                          
                 MOVE -1 TO REASON3L                                    11000000
                 MOVE ATT-UNPROT-BRT TO REASON3A MBAL05A                11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'REASON CODE NOT APPLICABLE'                   11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF                                                    11000000
              IF TWA-MAP-RCLM3 > SPACE                                          
                 MOVE -1 TO RECLM3L                                     11000000
                 MOVE ATT-UNPROT-BRT TO RECLM3A MBAL05A                 11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'RECLAIM NOT APPLICABLE'                       11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF                                                    11000000
              GO TO 1420-EXIT                                           11000000
           END-IF.                                                              
                                                                                
           IF TWA-MAP-RSON3 = SPACE                                             
              IF TWA-MAP-RCLM3 > SPACE                                          
                 MOVE -1 TO REASON3L                                    11000000
                 MOVE ATT-UNPROT-BRT TO REASON3A                        11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'ENTER REASON, OR TYPE "?" FOR REASON CODE INQU11000000
      -                  'IRY/SELECTION'                                11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              ELSE                                                              
                 CONTINUE                                               11000000
              END-IF                                                            
           ELSE                                                         11000000
              IF TWA-MAP-RSON3 = '60' OR '61' OR '62' OR                        
                                 '63' OR '64' OR '65'                           
ET0001**         CONTINUE                                               11000000
ET0001           IF TWA-MAP-RCLM3 = 'Y'                                         
ET0001              CONTINUE                                                    
ET0001           ELSE                                                           
ET0001              MOVE -1 TO RECLM3L                                          
ET0001              MOVE ATT-UNPROT-BRT TO RECLM3A                      11000000
ET0001              IF NOT WK-ERROR                                     11000000
ET0001                 SET   WK-ERROR   TO TRUE                         11000000
ET0001              MOVE 'ENTER "Y" TO RECLAIM' TO SYSTEM-MSG           11000000
ET0001           END-IF                                                 11000000
              ELSE                                                              
              IF TWA-MAP-RSON3(1:1) = '?' OR                                    
                 TWA-MAP-RSON3(1:2) = '?'                                       
                  MOVE 'R' TO TWA-SCREEN                                        
                  PERFORM 1800-SEND-POPUP-MAP-RTN                               
              ELSE                                                              
                 MOVE -1  TO REASON3L                                   11000000
                 MOVE ATT-UNPROT-BRT TO REASON3A                        11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'INVALID REASON CODE'                          11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF.                                                           
                                                                        11000000
           IF TWA-MAP-RCLM3  =  SPACE OR 'Y'                                    
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO RECLM3L                                        11000000
              MOVE ATT-UNPROT-BRT TO RECLM3A                            11000000
              IF NOT WK-ERROR                                           11000000
                 SET   WK-ERROR   TO  TRUE                              11000000
              MOVE 'ENTER "Y" TO RECLAIM OR SPACE OTHERWISE'            11000000
                TO SYSTEM-MSG                                           11000000
              END-IF                                                    11000000
           END-IF.                                                      11000000
       1420-EXIT.                                       EXIT.                   
       EJECT                                                            11000000
ET0006*                                                                         
ET0006*----------------------------------------------------------------*        
ET0006*               PF5: ADD ASSET ROUTINE                           *        
ET0006*----------------------------------------------------------------*        
ET0006 1450-ADD-ASSET-RTN.                                                      
           IF TWA-PAGE-NUM > TWA-MAX-PAGE-HST                                   
              CONTINUE                                                          
           ELSE                                                                 
              IF TWA-PAGE-NUM > 0                                               
                 MOVE TWA-PAGE-NUM TO WS-HST-ITEM                               
                 PERFORM 7100-READ-HIST-ASSET-TSQ                               
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF MSECRL > 0                                                        
              IF MSECRI = TWA-SECUR                                             
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MSECRI TO TWA-SECUR                                       
              END-IF                                                            
           ELSE                                                                 
              IF MSECRA = ERASE-KEY                                             
                 MOVE SPACES TO TWA-SECUR                                       
              END-IF                                                            
           END-IF.                                                              
           IF TWA-SECUR = LOW-VALUE                                             
              MOVE SPACES TO TWA-SECUR                                          
           END-IF.                                                              
                                                                                
           IF MCATGRL > 0                                                       
              IF MCATGRI = TWA-CATGRY                                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MCATGRI TO TWA-CATGRY                                     
              END-IF                                                            
           ELSE                                                                 
              IF MCATGRA = ERASE-KEY                                            
                 MOVE SPACES TO TWA-CATGRY                                      
              END-IF                                                            
           END-IF.                                                              
           IF TWA-CATGRY = LOW-VALUE                                            
              MOVE SPACES TO TWA-CATGRY                                         
           END-IF.                                                              
                                                                                
           IF MSLOCL > 0                                                        
              IF MSLOCI = TWA-SLOC                                              
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MSLOCI TO TWA-SLOC                                        
              END-IF                                                            
           ELSE                                                                 
              IF MSLOCA = ERASE-KEY                                             
                 MOVE SPACES TO TWA-SLOC                                        
              END-IF                                                            
           END-IF.                                                              
           IF TWA-SLOC = LOW-VALUE                                              
              MOVE SPACES TO TWA-SLOC                                           
           END-IF.                                                              
                                                                                
           IF MTYPEL > 0                                                        
              IF MTYPEI = TWA-SEC-TYPE                                          
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MTYPEI TO TWA-SEC-TYPE                                    
              END-IF                                                            
           ELSE                                                                 
              IF MTYPEA = ERASE-KEY                                             
                 MOVE SPACES TO TWA-SEC-TYPE                                    
              END-IF                                                            
           END-IF.                                                              
           IF TWA-SEC-TYPE = LOW-VALUE                                          
              MOVE SPACES TO TWA-SEC-TYPE                                       
           END-IF.                                                              
                                                                                
           IF MQTYI > 0                                                         
              IF MQTYI = TWA-MAP-QTY                                            
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MQTYI TO TWA-MAP-QTY                                      
              END-IF                                                            
           ELSE                                                                 
              IF MQTYA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-QTY                                     
              END-IF                                                            
           END-IF.                                                              
           IF TWA-MAP-QTY = LOW-VALUE                                           
              MOVE SPACES TO TWA-MAP-QTY                                        
           END-IF.                                                              
                                                                                
      **<< SECURITY ENTRY CHECK >>                                              
           MOVE ATT-UNPROT  TO  MSECRA.                                 11000000
                                                                                
           IF TWA-SECUR = SPACE                                                 
              GO TO 1450-EXIT                                           11000000
           ELSE                                                                 
              PERFORM 1452-MSD-CHECK                                            
              IF TWA-SECUR = TWA-PREV-SECUR                                     
                 CONTINUE                                                       
              ELSE                                                              
                 IF ACATMSD-FOUND                                               
                    IF TWA-CATGRY = SPACE                                       
                       PERFORM 1455-SET-DEFAULT-CATEGORY                        
                    END-IF                                                      
                    IF TWA-SLOC = SPACE                                         
                       PERFORM 1457-SET-DEFAULT-STTL-LOC                        
                    END-IF                                                      
                    IF TWA-SEC-TYPE = SPACE                                     
                       MOVE 'C'  TO MTYPEO TWA-SEC-TYPE                         
                    END-IF                                                      
                    PERFORM 1454-CUSIP-DUPE-CHECK                               
                    IF WS-DUPE-SEC-FOUND                                        
                       SET  WK-MSG-ON TO TRUE                                   
                       MOVE 'ASSET ALREADY ADDED/EXISTED - GENERIC BROWS        
      -                     'E ASSUMED'                                         
                       TO    SYSTEM-MSG                                         
                       GO TO 1450-EXIT                                          
                    ELSE                                                        
                       COMPUTE TWA-PAGE-NUM = TWA-MAX-PAGE-HST + 1              
                       MOVE SPACE TO TWA-PREV-CATGRY                            
                                     TWA-PREV-SLOC                              
                                     TWA-PREV-SEC-TYPE                          
                                     TWA-PREV-QTY                               
                                     TWA-PREV-AMT                               
                                     TWA-PREV-RSON4                             
                                     TWA-PREV-RCLM4                             
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
      **<< SECURITY CATEGORY ENTRY CHECK >>                                     
           MOVE ATT-UNPROT TO MCATGRA.                                          
                                                                                
           IF (TWA-CATGRY = 'ANNU' OR 'CDCP' OR 'CORP' OR 'EQU '                
               OR 'FCUR' OR 'FDEB' OR 'GOVT' OR 'LPAR' OR 'MBS '                
               OR 'MUNI' OR 'OTH ' OR 'UARP' OR 'UDSC' OR 'UIT '                
               OR 'MFMM' OR 'MFNM' OR 'ZERO')                                   
                  CONTINUE                                                      
           ELSE                                                                 
              MOVE -1 TO MCATGRL                                                
              MOVE ATT-UNPROT-BRT TO MCATGRA                                    
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'INVALID CATEGORY CODE' TO SYSTEM-MSG                     
              END-IF                                                            
           END-IF.                                                              
                                                                                
      **<< STTL LOC ENTRY CHECK >>                                              
           MOVE ATT-UNPROT TO MSLOCA.                                           
           IF (TWA-SLOC = '05' OR '15' OR '20' OR '25' OR '50')                 
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MSLOCL                                                 
              MOVE ATT-UNPROT-BRT TO MSLOCA                                     
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR    TO TRUE                                        
                 MOVE 'INVALID SETTLE LOC CODE - ENTER "05", "15", "20",        
      -               ' "25", OR "50"'                                          
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           END-IF.                                                              
                                                                                
      **<< ASSET TYPE ENTRY CHECK>>                                             
           MOVE ATT-UNPROT TO MTYPEA.                                           
                                                                                
           IF TWA-SEC-TYPE  NOT = 'C' AND 'M' AND 'S'                           
              MOVE -1 TO MTYPEL                                                 
              MOVE ATT-UNPROT-BRT TO MTYPEA                                     
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'ENTER "C", "M" OR "S" FOR CASH, MARGIN, OR SHORT'        
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           END-IF.                                                              
                                                                                
      **<< IF EVERYTHING OK, SAVE IT IN TS AREA >>                              
           IF TWA-SECUR > SPACE                                                 
              IF TWA-SECUR NOT = TWA-PREV-SECUR                                 
                 IF ACATMSD-FOUND AND (NOT WK-ERROR)                            
                    INITIALIZE  TS-HST-ASSET-AREA                               
                    MOVE TWA-SECUR       TO TS-HST-SECURITY                     
                    MOVE ACATMSD-ADP-NBR TO TS-HST-ADP-NBR                      
                    MOVE TWA-CATGRY      TO TS-HST-CTGRY                        
                    MOVE TWA-SLOC        TO TS-HST-STTL-LOC                     
                    MOVE TWA-SEC-TYPE    TO TS-HST-TYPE                         
                    MOVE TWA-DESCRIPT    TO TS-HST-DESC                         
                    MOVE 'Y'             TO TS-HST-ADD-ASSET                    
                    PERFORM 7120-WRITE-HIST-ASSET-TSQ                           
                    ADD 1 TO TWA-MAX-PAGE-HST                                   
                    MOVE TWA-SECUR       TO TWA-PREV-SECUR                      
                    MOVE TWA-CATGRY      TO TWA-PREV-CATGRY                     
                    MOVE TWA-SLOC        TO TWA-PREV-SLOC                       
                    MOVE TWA-SEC-TYPE    TO TWA-PREV-SEC-TYPE                   
                    MOVE TWA-MAP-QTY     TO TWA-PREV-QTY                        
                    MOVE TWA-MAP-AMT     TO TWA-PREV-AMT                        
                    MOVE TWA-MAP-RSON4   TO TWA-PREV-RSON4                      
                    MOVE TWA-MAP-RCLM4   TO TWA-PREV-RCLM4                      
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
      **<< ASSET QUANTITY ENTRY CHECK >>                                        
           PERFORM 1470-ADD-ASSET-QTY-CHECK.                                    
                                                                                
      **<< ASSET AMT >>                                                         
           PERFORM 1472-ASSET-AMT-CHECK.                                        
                                                                                
      **<< REWRITE TS FOR ENTRY CHANGE IF CUSIP IS ALREADY WRITTEN >>           
      **<< IN TS.                                                  >>           
           IF TWA-SECUR = SPACE                                                 
              CONTINUE                                                          
           ELSE                                                                 
              IF  (TWA-CATGRY   = TWA-PREV-CATGRY  )                            
              AND (TWA-SLOC     = TWA-PREV-SLOC    )                            
              AND (TWA-SEC-TYPE = TWA-PREV-SEC-TYPE)                            
              AND (TWA-MAP-QTY  = TWA-PREV-QTY     )                            
              AND (TWA-MAP-AMT  = TWA-PREV-AMT     )                            
                   CONTINUE                                                     
              ELSE                                                              
                   MOVE TWA-CATGRY    TO TWA-PREV-CATGRY                        
                   MOVE TWA-SLOC      TO TWA-PREV-SLOC                          
                   MOVE TWA-SEC-TYPE  TO TWA-PREV-SEC-TYPE                      
                   MOVE TWA-MAP-QTY   TO TWA-PREV-QTY                           
                   MOVE TWA-MAP-AMT   TO TWA-PREV-AMT                           
                   MOVE TWA-MAP-RSON4 TO TWA-PREV-RSON4                         
                   MOVE TWA-MAP-RCLM4 TO TWA-PREV-RCLM4                         
                   IF NOT WK-ERROR                                              
                      IF TWA-SECUR > SPACE                                      
                         IF  TS-HST-ADD-ASSET = 'Y'                             
                             MOVE TS-HST-QTY-RECL TO TS-HST-QTY-ORIG            
                             MOVE TWA-CATGRY      TO TS-HST-CTGRY               
                             MOVE TWA-SLOC        TO TS-HST-STTL-LOC            
                             MOVE TWA-SEC-TYPE    TO TS-HST-TYPE                
                             MOVE TWA-PAGE-NUM    TO WS-HST-ITEM                
                             PERFORM 7130-REWRITE-HIST-ASSET-TSQ                
                         END-IF                                                 
                      END-IF                                                    
                   END-IF                                                       
              END-IF                                                            
           END-IF.                                                              
                                                                        10870002
      **<< QTY REASON CODE & RECLAIM IND CHECK, THEN REWRITE TS >>              
           IF WS-VALID-QTY AND WS-VALID-AMT                                     
              PERFORM 1520-VALIDATE-RSON-RCLM-04 THRU 1520-EXIT                 
              IF (TWA-MAP-RSON4 NOT = TWA-PREV-RSON4)                           
              OR (TWA-MAP-RCLM4 NOT = TWA-PREV-RCLM4)                           
                   MOVE TWA-MAP-RSON4 TO TWA-PREV-RSON4                         
                   MOVE TWA-MAP-RCLM4 TO TWA-PREV-RCLM4                         
              END-IF                                                            
              IF NOT WK-ERROR                                           11000000
                 IF  (TWA-MAP-RSON4 > SPACE)                                    
                 AND (TWA-MAP-RCLM4 > SPACE)                                    
                       MOVE TWA-MAP-RSON4 TO TS-HST-REASON                      
                       MOVE TWA-MAP-RCLM4 TO TS-HST-RECL-IND                    
                       MOVE TWA-PAGE-NUM  TO WS-HST-ITEM                        
                       PERFORM 7130-REWRITE-HIST-ASSET-TSQ                      
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
       1450-EXIT.     EXIT.                                                     
       EJECT                                                                    
ET0006*                                                                         
ET0006*----------------------------------------------------------------*        
ET0006*   VALIDATE SEC/CUS/SYM ENTRY THRU MSD FILE FOR PF5 (ADD ASET)  *        
ET0006*----------------------------------------------------------------*        
ET0006 1452-MSD-CHECK.                                                          
           MOVE SPACES TO ACATMSDIO-CALL-AREA                                   
           SET ACATMSD-MSD-READ TO TRUE                                         
           MOVE TWA-SECUR TO ACATMSD-SEARCH-KEY                                 
           PERFORM 7800-LINK-TO-ACATMSDIO-RTN.                                  
                                                                                
           IF ACATMSD-FOUND                                                     
              MOVE ACATMSD-CUSIP  TO MSECRO TWA-SECUR                           
              MOVE ACATMSD-DESC   TO WS-DESC-1                                  
              MOVE ACATMSD-DESC2  TO WS-DESC-2                                  
              MOVE ACATMSD-DESC3  TO WS-DESC-3                                  
              MOVE WS-DESCRIPTION TO TWA-DESCRIPT                               
              MOVE WS-DESCRIPT-1  TO MDESC1O                                    
              MOVE WS-DESCRIPT-2  TO MDESC2O                                    
           ELSE                                                                 
           IF ACATMSD-NOT-FOUND                                                 
              MOVE ATT-UNPROT-BRT TO MSECRA                                     
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE -1 TO MSECRL                                              
                 MOVE 'SECURITY NOT FOUND ON MSD' TO SYSTEM-MSG                 
              END-IF                                                            
           ELSE                                                                 
           IF ACATMSD-NOT-AVAIL                                                 
              MOVE ATT-UNPROT-BRT TO MSECRA                                     
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE -1 TO MSECRL                                              
                 MOVE 'MSD FILE IS NOT AVAILABLE' TO SYSTEM-MSG                 
              END-IF                                                            
           ELSE                                                                 
           IF ACATMSD-ERROR                                                     
              MOVE ATT-UNPROT-BRT TO MSECRA                                     
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR    TO TRUE                                        
                 MOVE -1 TO MSECRL                                              
LRM010           MOVE 'MSD FILE PROBLEM / CALL HELP DESK'                       
LRM010                        TO SYSTEM-MSG                                     
              END-IF                                                            
           END-IF.                                                              
       EJECT                                                                    
ET0006*                                                                         
ET0006*----------------------------------------------------------------*        
ET0006*     CHECK IF CUSIP ALREADY IN HIST TEMP STORAGE                *        
ET0006*----------------------------------------------------------------*        
ET0006 1454-CUSIP-DUPE-CHECK.                                                   
           MOVE SPACE  TO WS-DUPE-SEC-FOUND-SW.                                 
                                                                                
           MOVE TWA-SECUR  TO WS-CUSIP-IN-TWA.                                  
           PERFORM VARYING SUB FROM 1 BY 1                                      
                    UNTIL SUB > TWA-MAX-PAGE-HST OR WS-DUPE-SEC-FOUND           
               MOVE SUB TO WS-HST-ITEM                                          
               PERFORM 7100-READ-HIST-ASSET-TSQ                                 
               MOVE TS-HST-SECURITY TO WS-CUSIP-IN-TS                           
               IF WS-CUSIP-IN-TS = WS-CUSIP-IN-TWA                              
                  SET WS-DUPE-SEC-FOUND TO TRUE                                 
                  MOVE SUB TO TWA-PAGE-NUM                                      
                  PERFORM 6200-SETUP-ASSET-MAP-AREA                             
               END-IF                                                           
           END-PERFORM.                                                         
       EJECT                                                                    
ET0006*                                                                         
ET0006*---------------------------------------------------------------*         
ET0006* ASSET PRICING CATEGORY - BASED ON MSD CLASS CODE              *         
ET0006*---------------------------------------------------------------*         
ET0006* CATEGORY                            MSD CLASS CODE            *         
ET0006* ----------------------------------  --------------            *         
ET0006* ANNU - ANNUITY                      6XXXXX7; 6XXXXX8          *         
ET0006* CDCP - CD & COMMERCIAL PAPER        27XXXX5; 27XXXX6;         *         
ET0006*                                     27XXXX7; 27XXXX9;         *         
ET0006* CORP - CORPORATE BOND               POS 1 = 2 (EXCLUDE 2XX21X;*         
ET0006*                                     2XX71X; 29XX1X; 2XXX701;  *         
ET0006*                                     2XX702; 2XX703            *         
ET0006*                                                               *         
ET0006* EQU  - EQUITIES                     1XXXXXX; 65XXXXX          *         
ET0006* FCUR - FOREIGN CURRENCY             -------                   *         
ET0006* FDEB - FOREIGN DEBT                 2XXXXXX; 3XXXXXX; 4XXXXXX;*         
ET0006*                                     7XXXXXX; AND FIRST THREE  *         
ET0006*                                     CHARACTERS OF DESCRIPTION *         
ET0006*                                     EQUAL TO '***'            *         
ET0006* FEQU - FOREIGN EQUITY               1XXXXXX; AND FIRST THREE  *         
ET0006*                                     CHARACTERS OF DESCRIPTION *         
ET0006*                                     EQUAL TO '***'            *         
ET0006* GOVT - US GOVT & GOVT AGENCY        3XXX211; 3XXX711; 2XXX210;*         
ET0006*                                     2XXX710                   *         
ET0006* LPAR - LIMITED PARTNERSHIPS         6XXXXX1; 1XXXXX1          *         
ET0006* MBS  - FHLMC, FNMA, GNMA            2XXXXX1; 2XXXXX2; 2XXXXX3 *         
ET0006* MFMM - MUTUAL FD MONEY MKT          63XXXX6                   *         
ET0006* MFNM - MUTUAL FD NON-MONEY MKT      POS 1 & 2 = 63 AND        *         
ET0006*                                     POS 7 IS NOT EQUAL TO 6   *         
ET0006* MUNI - MUNICIPAL BONDS              4XXXXXX                   *         
ET0006* UARP - ACTION RATE PREFERRED - UIT  -------                   *         
ET0006* UDSC - DEFERRED SALES CHARGE - UIT  -------                   *         
ET0006* UIT  - UNIT INVESTMENT TRUST        7XXXXXX                   *         
ET0006* ZERO - ZERO COUPON BONDS            29XXXXX; 39XXXXX; 49XXXXX *         
ET0006* OTH  - OTHER                        NOT DEFINED ABOVE         *         
ET0006*---------------------------------------------------------------*         
ET0006 1455-SET-DEFAULT-CATEGORY.                                               
           IF  ACATMSD-CLASS-CD(1 : 1) = '6'                                    
           AND (ACATMSD-CLASS-CD(7 : 1) = '7' OR '8')                           
              MOVE 'ANNU' TO MCATGRO TWA-CATGRY                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 2) = '27'                                   
           AND (ACATMSD-CLASS-CD(7 : 1) = '5' OR '6' OR '7' OR '9' )            
              MOVE 'CDCP' TO MCATGRO TWA-CATGRY                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 1) = '2'                                    
           AND (ACATMSD-CLASS-CD(4 : 2) NOT = '21' AND '71')                    
           AND (ACATMSD-CLASS-CD(2 : 1) NOT = '9'                               
           AND  ACATMSD-CLASS-CD(5 : 1) NOT = '1')                              
           AND (ACATMSD-CLASS-CD(5 : 3) NOT = '701' AND '702' AND '703')        
              MOVE 'CORP' TO MCATGRO TWA-CATGRY                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 1) = '1'                                    
           OR  (ACATMSD-CLASS-CD(1 : 2) = '65')                                 
              MOVE 'EQU ' TO MCATGRO TWA-CATGRY                                 
           ELSE                                                                 
           IF (ACATMSD-CLASS-CD(1 : 1) = '2' OR '3' OR '4' OR '7')              
           AND ACATMSD-DESC(1 : 3) = '***'                                      
              MOVE 'FDEB' TO MCATGRO TWA-CATGRY                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 1) = '1'                                    
           AND ACATMSD-DESC(1 : 3) = '***'                                      
              MOVE 'FEQU' TO MCATGRO TWA-CATGRY                                 
           ELSE                                                                 
           IF (ACATMSD-CLASS-CD(1 : 1) = '3'                                    
           AND (ACATMSD-CLASS-CD(5 : 3) = '211' OR '711'))                      
           OR (ACATMSD-CLASS-CD(1 : 1) = '2'                                    
           AND (ACATMSD-CLASS-CD(5 : 3) = '210' OR '710'))                      
              MOVE 'GOVT' TO MCATGRO TWA-CATGRY                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 1) = '6'                                    
           AND ACATMSD-CLASS-CD(7 : 1) = '1'                                    
              MOVE 'LPAR' TO MCATGRO TWA-CATGRY                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 1) = '1'                                    
           AND (ACATMSD-CLASS-CD(7 : 1) = '1' OR '2' OR '3')                    
              MOVE 'MBS ' TO MCATGRO TWA-CATGRY                                 
           ELSE                                                                 
           IF (ACATMSD-CLASS-CD(1 : 2) = '15'                                   
           AND  ACATMSD-CLASS-CD(7 : 1) = '6')                                  
           OR (ACATMSD-CLASS-CD(1 : 2) = '63'                                   
           AND  ACATMSD-CLASS-CD(7 : 1) = '6')                                  
              MOVE 'MFMM' TO MCATGRO TWA-CATGRY                                 
           ELSE                                                                 
           IF (ACATMSD-CLASS-CD(1 : 2) = '15' OR '63')                          
           AND (ACATMSD-CLASS-CD(7 : 1) NOT = '6')                              
              MOVE 'MFNM' TO MCATGRO TWA-CATGRY                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 1) = '4'                                    
              MOVE 'MUNI' TO MCATGRO TWA-CATGRY                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 1) = '7'                                    
              MOVE 'UIT ' TO MCATGRO TWA-CATGRY                                 
           ELSE                                                                 
           IF (ACATMSD-CLASS-CD(1 : 2) = '29' OR '39')                          
              MOVE 'ZERO' TO MCATGRO TWA-CATGRY                                 
           ELSE                                                                 
              MOVE 'OTH ' TO MCATGRO TWA-CATGRY                                 
           END-IF.                                                              
       EJECT                                                                    
ET0006*                                                                         
ET0006*----------------------------------------------------------------*        
ET0006*  SET DEFAULT SETTLE LOCATION CODE WHEN SECURITY FOUND IN MSD   *        
ET0006*  FOR PF5 FUNCTION (ADD ASSET)                                  *        
ET0006*----------------------------------------------------------------*        
ET0006 1457-SET-DEFAULT-STTL-LOC.                                               
           MOVE ACATMSD-CLASS-CD TO WK-MS-CLASS.                                
                                                                                
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
           END-EVALUATE.                                                        
                                                                                
           MOVE '05' TO  MSLOCO TWA-SLOC.                                       
                                                                                
           IF (WK-MS-CLASS (4:1) = '2' OR '3' OR '4'                            
                                OR '5' OR '6' OR '7')                           
               MOVE  'Y'           TO WK-DTC-IND                                
           END-IF.                                                              
                                                                                
           IF  WK-DTC-IND = 'Y'                                                 
               MOVE '25'           TO MSLOCO TWA-SLOC                           
           END-IF                                                               
           IF  WK-CNS-IND = 'Y'                                                 
               MOVE '05'           TO MSLOCO TWA-SLOC                           
           END-IF                                                               
           IF  (TWA-CATGRY = 'MFMM' OR 'MFNM')                                  
               MOVE '10'           TO MSLOCO TWA-SLOC                           
           END-IF                                                               
           IF  (ACATMSD-ADP-NBR (1:1) = '8' OR '9')                             
                    AND                                                         
                (WK-MS-CLASS-1-2-3 = '664' OR '665')                            
              MOVE '35' TO  MSLOCO TWA-SLOC                                     
           END-IF.                                                              
       EJECT                                                                    
ET0006*                                                                         
ET0006*----------------------------------------------------------------*        
ET0006*    ASSET QUANTITY ENTRY CHECK FOR PF5 FUNCTION (ADD ASSET)     *        
ET0006*----------------------------------------------------------------*        
ET0006 1470-ADD-ASSET-QTY-CHECK.                                                
           IF MQTYL > 0                                                         
              IF MQTYI = TWA-MAP-QTY                                            
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MQTYI TO TWA-MAP-QTY                                      
              END-IF                                                            
           ELSE                                                                 
              IF MQTYA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-QTY                                     
              END-IF                                                            
           END-IF.                                                              
           IF TWA-MAP-QTY = LOW-VALUE                                           
              MOVE SPACES TO TWA-MAP-QTY                                        
           END-IF.                                                              
                                                                                
           MOVE ATT-UNPROT TO MQTYA.                                            
                                                                                
           IF TWA-MAP-QTY = SPACE                                               
              MOVE -1  TO MQTYL                                         11000000
              MOVE ATT-UNPROT-BRT TO MQTYA                              11000000
              IF NOT WK-ERROR                                           11000000
                 SET   WK-ERROR   TO  TRUE                              11000000
                 MOVE 'ENTER QUANTITY'  TO SYSTEM-MSG                   11000000
              END-IF                                                    11000000
           ELSE                                                                 
              MOVE TWA-MAP-QTY  TO WK-QTY-IN                                    
              EXEC CICS LINK PROGRAM(WS-EDITMOD)                                
                          COMMAREA(EDIT-QTY-AREA)                               
                          LENGTH(LENGTH OF EDIT-QTY-AREA)                       
              END-EXEC                                                  02920002
              MOVE SPACE TO WS-VALID-QTY-SW                             11000000
              IF WK-QTY-RET-CODE = SPACE                                        
ET0006**         PERFORM 1560-FORMAT-QTY-RTN                                    
ET0006           MOVE WK-QTY-OUT-D4 TO WS-MQTY-ED-D4 TS-HST-QTY-RECL            
                 MOVE WS-MQTY-AREA  TO MQTYI TWA-MAP-QTY                        
                 IF TS-HST-QTY-RECL = 0                                         
                    MOVE -1  TO MQTYL                                   11000000
                    MOVE ATT-UNPROT-BRT TO MQTYA                        11000000
                    IF NOT WK-ERROR                                     11000000
                       SET   WK-ERROR   TO  TRUE                        11000000
                       MOVE '0 QTY CAN NOT BE RECLAIMED'                11000000
                         TO  SYSTEM-MSG                                 11000000
                    END-IF                                              11000000
                 ELSE                                                           
                    SET WS-VALID-QTY  TO TRUE                           11000000
                    IF TS-HST-QTY-RECL < 0                                      
                       COMPUTE TS-HST-QTY-RECL = TS-HST-QTY-RECL * -1           
                       MOVE 'N'     TO TS-HST-QTY-SIGN                          
                       MOVE 'S'     TO TS-HST-PSTN-CD                           
                    ELSE                                                        
                       MOVE SPACE   TO TS-HST-QTY-SIGN                          
                       MOVE 'L'     TO TS-HST-PSTN-CD                           
                    END-IF                                                      
                 END-IF                                                         
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO MQTYA                                   
                 MOVE -1 TO MQTYL                                               
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'INVALID QTY' TO SYSTEM-MSG                            
                 END-IF                                                         
              END-IF.                                                           
                                                                                
       EJECT                                                                    
ET0006*                                                                         
ET0006*----------------------------------------------------------------*        
ET0006*     ASSET AMOUNT ENTRY CHECK FOR PF5 FUNCTION (ADD ASSET)      *        
ET0006*----------------------------------------------------------------*        
ET0006 1472-ASSET-AMT-CHECK.                                                    
           IF MAMTL > 0                                                         
              IF MAMTI = TWA-MAP-AMT                                            
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MAMTI TO TWA-MAP-AMT                                      
              END-IF                                                            
           ELSE                                                                 
              IF MAMTA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-AMT                                     
              END-IF                                                            
           END-IF.                                                              
           IF TWA-MAP-AMT = LOW-VALUE                                           
              MOVE SPACES TO TWA-MAP-AMT                                        
           END-IF.                                                              
                                                                                
           MOVE ATT-UNPROT TO MAMTA.                                            
                                                                                
           IF TWA-MAP-QTY = SPACE                                               
              MOVE SPACE TO MAMTI TWA-MAP-AMT                                   
           ELSE                                                                 
              IF TWA-MAP-AMT = SPACE                                            
                 MOVE -1  TO MAMTL                                      11000000
                 MOVE ATT-UNPROT-BRT TO MAMTA                           11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO  TRUE                           11000000
                    MOVE 'ENTER ASSET AMOUNT' TO SYSTEM-MSG             11000000
                 END-IF                                                 11000000
              ELSE                                                              
                 MOVE TWA-MAP-AMT    TO WK-AMT-IN                               
                 EXEC CICS LINK PROGRAM(WS-EDITMOD)                             
                             COMMAREA(EDIT-AMT-AREA)                            
                             LENGTH(LENGTH OF EDIT-AMT-AREA)                    
                 END-EXEC                                               02920002
                 IF WK-AMT-RET-CODE = SPACE                                     
                    PERFORM 1474-FORMAT-AMT-RTN                                 
                    PERFORM 1476-VALIDATE-ASSET-AMT                             
                 ELSE                                                           
                    MOVE ATT-UNPROT-BRT TO MAMTA                                
                    MOVE -1 TO MAMTL                                            
                    IF NOT WK-ERROR                                             
                       SET WK-ERROR TO TRUE                                     
                       MOVE 'INVALID ASSET AMT' TO SYSTEM-MSG                   
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
       EJECT                                                                    
ET0006*                                                                         
ET0006*----------------------------------------------------------------*        
ET0006*       FORMAT ASSET AMOUNT FOR PF5 FUNCTION (ADD ASSET)         *        
ET0006*----------------------------------------------------------------*        
ET0006 1474-FORMAT-AMT-RTN.                                                     
           IF (WK-AMT-OUT NOT > 999999999999.99 AND                             
                         NOT < -999999999999.99)                                
              MOVE WK-AMT-OUT      TO WK-AMT-COMMAS-3 TS-HST-ASSET-AMT          
              MOVE WK-AMT-COMMAS-3 TO MAMTI TWA-MAP-AMT                         
           ELSE                                                                 
           IF (WK-AMT-OUT NOT > 9999999999999.99 AND                            
                         NOT < -9999999999999.99)                               
              MOVE WK-AMT-OUT      TO WK-AMT-COMMAS-2 TS-HST-ASSET-AMT          
              MOVE WK-AMT-COMMAS-2 TO MAMTI TWA-MAP-AMT                         
           ELSE                                                                 
           IF (WK-AMT-OUT NOT > 99999999999999.99 AND                           
                         NOT < -99999999999999.99)                              
              MOVE WK-AMT-OUT      TO WK-AMT-COMMAS-1 TS-HST-ASSET-AMT          
              MOVE WK-AMT-COMMAS-1 TO MAMTI TWA-MAP-AMT                         
           ELSE                                                                 
              MOVE WK-AMT-OUT      TO WK-AMT-COMMAS-0 TS-HST-ASSET-AMT          
              MOVE WK-AMT-COMMAS-0 TO MAMTI TWA-MAP-AMT                         
           END-IF.                                                              
       EJECT                                                                    
ET0006*                                                                         
ET0006*----------------------------------------------------------------*        
ET0006*       VALIDATE ASSET AMOUNT FOR PF5 FUNCTION (ADD ASSET)       *        
ET0006*----------------------------------------------------------------*        
ET0006 1476-VALIDATE-ASSET-AMT.                                                 
           MOVE SPACE TO WS-VALID-AMT-SW.                                       
           IF TS-HST-ASSET-AMT = 0                                              
              MOVE ATT-UNPROT-BRT TO MAMTA                                      
              MOVE -1 TO MAMTL                                                  
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'ASSET AMOUNT MUST NOT BE ZERO' TO SYSTEM-MSG             
              END-IF                                                            
           ELSE                                                                 
           IF TS-HST-ASSET-AMT < 0                                              
              IF TS-HST-PSTN-CD = 'S'                                           
                 SET WS-VALID-AMT TO TRUE                                       
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO MAMTA                                   
                 MOVE -1 TO MAMTL                                               
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'INVALID NEGATIVE AMOUNT FOR LONG POSITION'            
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
           IF TS-HST-ASSET-AMT > 0                                              
              IF TS-HST-PSTN-CD = 'L'                                           
                 SET WS-VALID-AMT TO TRUE                                       
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO MAMTA                                   
                 MOVE -1 TO MAMTL                                               
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'INVALID POSITIVE AMOUNT FOR SHORT POSITION'           
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *               VALIDATE ASSET QUANTITY ENTRY                    *        
      *----------------------------------------------------------------*        
       1500-VALIDATE-QTY-RTN.                                                   
           MOVE TWA-PAGE-NUM TO WS-HST-ITEM.                                    
           PERFORM 7100-READ-HIST-ASSET-TSQ.                                    
           IF NOT WK-TS-READ-OK                                                 
              GO TO 1500-EXIT.                                                  
           IF TS-HST-QTY-ORIG = 0                                               
              GO TO 1500-EXIT.                                                  
           IF TS-HST-RCLMED = 'Y'                                               
              GO TO 1500-EXIT.                                                  
                                                                                
           IF MQTYL > 0                                                         
              IF MQTYI = TWA-MAP-QTY                                            
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MQTYI TO TWA-MAP-QTY                                      
              END-IF                                                            
           ELSE                                                                 
              IF MQTYA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-QTY                                     
              END-IF                                                            
           END-IF.                                                              
           IF TWA-MAP-QTY = LOW-VALUE                                           
              MOVE SPACES TO TWA-MAP-QTY.                                       
                                                                                
           IF TWA-MAP-QTY = SPACE                                               
              IF TS-HST-PSTN-CD = 'S'                                           
                 MULTIPLY TS-HST-QTY-ORIG BY -1 GIVING WS-SHORT-QTY             
                 MOVE WS-SHORT-QTY       TO MQTYO                               
                 MOVE MQTYO              TO TWA-MAP-QTY                         
              ELSE                                                              
                 MOVE TS-HST-QTY-ORIG    TO MQTYO                               
                 MOVE MQTYO              TO TWA-MAP-QTY                         
              END-IF                                                            
              MOVE -1  TO MQTYL                                         11000000
              MOVE ATT-UNPROT-BRT TO MQTYA                              11000000
              IF NOT WK-ERROR                                           11000000
                 SET   WK-ERROR   TO  TRUE                              11000000
                 MOVE 'SPACE NOT ALLOWED - REPLACED BY ORIGINAL QTY'    11000000
                   TO  SYSTEM-MSG                                       11000000
              END-IF                                                    11000000
           ELSE                                                                 
              MOVE TWA-MAP-QTY  TO WK-QTY-IN                                    
              EXEC CICS LINK PROGRAM(WS-EDITMOD)                                
                          COMMAREA(EDIT-QTY-AREA)                               
                          LENGTH(LENGTH OF EDIT-QTY-AREA)                       
              END-EXEC                                                  02920002
              IF WK-QTY-RET-CODE = SPACE                                        
ET0006**         PERFORM 1560-FORMAT-QTY-RTN                                    
ET0006           MOVE WK-QTY-OUT-D4 TO WS-MQTY-ED-D4 TS-HST-QTY-RECL            
                 MOVE WS-MQTY-AREA  TO MQTYI                                    
                                       TWA-MAP-QTY                              
                 IF TS-HST-QTY-RECL < 0                                         
                    COMPUTE TS-HST-QTY-RECL = TS-HST-QTY-RECL * -1              
                    MOVE 'N'   TO TS-HST-QTY-SIGN                               
                 ELSE                                                           
                    MOVE SPACE TO TS-HST-QTY-SIGN                               
                 END-IF                                                         
                 PERFORM 1510-VALIDATE-QTY                                      
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO MQTYA                                   
                 MOVE -1 TO MQTYL                                               
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'INVALID QTY' TO SYSTEM-MSG                            
                 END-IF                                                         
              END-IF.                                                           
                                                                        10870002
           IF WS-VALID-QTY                                                      
              MOVE ATT-UNPROT TO MQTYA                                          
              PERFORM 1520-VALIDATE-RSON-RCLM-04 THRU 1520-EXIT                 
              IF NOT WK-ERROR                                           11000000
                 IF (TWA-MAP-RSON4 NOT = TS-HST-REASON)                         
                 OR (TWA-MAP-RCLM4 NOT = TS-HST-RECL-IND)                       
                     MOVE TWA-MAP-RSON4 TO TS-HST-REASON                        
                     MOVE TWA-MAP-RCLM4 TO TS-HST-RECL-IND                      
                     MOVE TWA-PAGE-NUM  TO WS-HST-ITEM                          
                     PERFORM 7130-REWRITE-HIST-ASSET-TSQ                        
                 END-IF                                                         
              END-IF.                                                           
       1500-EXIT.                                 EXIT.                         
       EJECT                                                                    
       1510-VALIDATE-QTY.                                               11000000
           MOVE SPACE TO WS-VALID-QTY-SW.                                       
           IF TS-HST-QTY-RECL = 0                                               
              IF TS-HST-PSTN-CD = 'S'                                           
                 MULTIPLY TS-HST-QTY-ORIG BY -1 GIVING WS-SHORT-QTY             
                 MOVE WS-SHORT-QTY    TO MQTYO                                  
                 MOVE MQTYO           TO TWA-MAP-QTY                            
              ELSE                                                              
                 MOVE TS-HST-QTY-ORIG TO MQTYO                                  
                 MOVE MQTYO           TO TWA-MAP-QTY                            
              END-IF                                                            
              MOVE -1  TO MQTYL                                         11000000
              MOVE ATT-UNPROT-BRT TO MQTYA                              11000000
              IF NOT WK-ERROR                                           11000000
                 SET   WK-ERROR   TO  TRUE                              11000000
                 MOVE '0 QTY CAN NOT BE RECLAIMED - REPLACED BY ORIGINAL11000000
      -               ' QUANTITY'                                       11000000
                   TO  SYSTEM-MSG                                       11000000
              END-IF.                                                   11000000
           IF TS-HST-PSTN-CD = 'S'                                              
              MULTIPLY TS-HST-QTY-ORIG BY -1 GIVING WS-SHORT-QTY-ORG            
              IF TS-HST-QTY-SIGN = 'N'                                          
                 MULTIPLY TS-HST-QTY-RECL BY -1 GIVING WS-SHORT-QTY             
                 IF WS-SHORT-QTY < WS-SHORT-QTY-ORG                             
                    MOVE -1  TO MQTYL                                   11000000
                    MOVE ATT-UNPROT-BRT TO MQTYA                        11000000
                    IF NOT WK-ERROR                                     11000000
                       SET   WK-ERROR   TO TRUE                         11000000
                       MOVE 'RECLAIM EXCEEDING THE ORIGINAL QUANTITIY'  11000000
                         TO  SYSTEM-MSG                                 11000000
                    END-IF                                              11000000
                 ELSE                                                   11000000
                    SET WS-VALID-QTY TO TRUE                            11000000
                 END-IF                                                 11000000
              ELSE                                                              
                 MOVE -1  TO MQTYL                                      11000000
                 MOVE ATT-UNPROT-BRT TO MQTYA                           11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'RECLAIM QUANTITY ERROR'                       11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF                                                            
           ELSE                                                                 
              IF TS-HST-QTY-SIGN = 'N'                                          
                 MOVE -1  TO MQTYL                                      11000000
                 MOVE ATT-UNPROT-BRT TO MQTYA                           11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'RECLAIM QUANTITY ERROR'                       11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              ELSE                                                              
              IF TS-HST-QTY-RECL > TS-HST-QTY-ORIG                              
                 MOVE -1  TO MQTYL                                      11000000
                 MOVE ATT-UNPROT-BRT TO MQTYA                           11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'RECLAIM EXCEEDING THE ORIGINAL QUANTITY'      11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              ELSE                                                      11000000
                 SET WS-VALID-QTY  TO TRUE                              11000000
              END-IF.                                                   11000000
       EJECT                                                            11000000
                                                                                
       1520-VALIDATE-RSON-RCLM-04.                                              
           IF REASON4L > 0                                                      
              IF REASON4I = TWA-MAP-RSON4                                       
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE REASON4I TO TWA-MAP-RSON4                                 
              END-IF                                                            
           ELSE                                                                 
           IF REASON4A = ERASE-KEY                                              
              MOVE SPACES TO TWA-MAP-RSON4.                                     
           IF RECLM4L > 0                                                       
              IF RECLM4I = TWA-MAP-RCLM4                                        
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE RECLM4I TO TWA-MAP-RCLM4                                  
              END-IF                                                            
           ELSE                                                                 
           IF RECLM4A = ERASE-KEY                                               
              MOVE SPACES TO TWA-MAP-RCLM4.                                     
                                                                                
           MOVE ATT-UNPROT TO REASON4A                                  11000000
                              RECLM4A.                                          
           IF NOT WS-VALID-QTY                                                  
              IF TWA-MAP-RSON4 > SPACE                                          
                 MOVE -1 TO REASON4L                                    11000000
                 MOVE ATT-UNPROT-BRT TO REASON4A MQTYA                  11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'REASON CODE NOT APPLICABLE'                   11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF                                                    11000000
              IF TWA-MAP-RCLM4 > SPACE                                          
                 MOVE -1 TO RECLM4L                                     11000000
                 MOVE ATT-UNPROT-BRT TO RECLM4A MQTYA                   11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'RECLAIM NOT APPLICABLE'                       11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF                                                    11000000
              GO TO 1520-EXIT                                           11000000
           END-IF.                                                              
                                                                                
           IF TWA-MAP-RSON4 = SPACE                                             
              IF TWA-MAP-RCLM4 > SPACE                                          
                 MOVE -1 TO REASON4L                                    11000000
                 MOVE ATT-UNPROT-BRT TO REASON4A                        11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'ENTER REASON, OR TYPE "?" FOR REASON CODE INQU11000000
      -                  'IRY/SELECTION'                                11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              ELSE                                                              
                 CONTINUE                                               11000000
              END-IF                                                            
           ELSE                                                         11000000
              IF TWA-MAP-RSON4 = '60' OR '61' OR '62' OR                        
                                 '63' OR '64' OR '65'                           
ET0001**         CONTINUE                                               11000000
ET0001           IF TWA-MAP-RCLM4 = 'Y'                                         
ET0001              CONTINUE                                                    
ET0001           ELSE                                                           
ET0001              MOVE -1 TO RECLM4L                                          
ET0001              MOVE ATT-UNPROT-BRT TO RECLM4A                      11000000
ET0001              IF NOT WK-ERROR                                     11000000
ET0001                 SET   WK-ERROR   TO TRUE                         11000000
ET0001              MOVE 'ENTER "Y" TO RECLAIM' TO SYSTEM-MSG           11000000
ET0001           END-IF                                                 11000000
              ELSE                                                              
              IF TWA-MAP-RSON4(1:1) = '?' OR                                    
                 TWA-MAP-RSON4(1:2) = '?' OR                                    
                 TWA-MAP-RSON4      = '??'                                      
                  MOVE 'R' TO TWA-SCREEN                                        
                  PERFORM 1800-SEND-POPUP-MAP-RTN                               
              ELSE                                                              
                 MOVE -1  TO REASON4L                                   11000000
                 MOVE ATT-UNPROT-BRT TO REASON4A                        11000000
                 IF NOT WK-ERROR                                        11000000
                    SET   WK-ERROR   TO TRUE                            11000000
                    MOVE 'INVALID REASON CODE'                          11000000
                      TO  SYSTEM-MSG                                    11000000
                 END-IF                                                 11000000
              END-IF.                                                           
                                                                        11000000
           IF TWA-MAP-RCLM4 = SPACE OR 'Y'                                      
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO RECLM4L                                        11000000
              MOVE ATT-UNPROT-BRT TO RECLM4A                            11000000
              IF NOT WK-ERROR                                           11000000
                 SET   WK-ERROR   TO  TRUE                              11000000
              MOVE 'ENTER "Y" TO RECLAIM OR ENTER SPACE OTHERWISE'      11000000
                TO SYSTEM-MSG                                           11000000
              END-IF                                                    11000000
           END-IF.                                                      11000000
       1520-EXIT.                                       EXIT.                   
       EJECT                                                            11000000
      *                                                                         
      *----------------------------------------------------------------*        
      *               FORMAT AMOUNT ROUTINE                            *        
      *----------------------------------------------------------------*        
       1550-FORMAT-AMT-RTN.                                                     
           IF (WK-AMT-OUT NOT > 999999999999.99 AND                             
                         NOT < -999999999999.99)                                
              MOVE WK-AMT-OUT TO WK-AMT-COMMAS-3                                
           ELSE                                                                 
           IF (WK-AMT-OUT NOT > 9999999999999.99 AND                            
                         NOT < -9999999999999.99)                               
              MOVE WK-AMT-OUT TO WK-AMT-COMMAS-2                                
           ELSE                                                                 
           IF (WK-AMT-OUT NOT > 99999999999999.99 AND                           
                         NOT < -99999999999999.99)                              
              MOVE WK-AMT-OUT TO WK-AMT-COMMAS-1                                
           ELSE                                                                 
              MOVE WK-AMT-OUT TO WK-AMT-COMMAS-0                                
           END-IF.                                                              
       EJECT                                                                    
       1560-FORMAT-QTY-RTN.                                                     
           IF WK-QTY-OUT-FRACTION(4 : 1) NOT = '0'                              
              MOVE WK-QTY-OUT-D4 TO WS-MQTY-ED-D4 TS-HST-QTY-RECL               
           ELSE                                                                 
           IF WK-QTY-OUT-FRACTION(3 : 1) NOT = '0'                              
              MOVE WK-QTY-OUT-D3 TO WS-MQTY-ED-D3 TS-HST-QTY-RECL               
           ELSE                                                                 
           IF WK-QTY-OUT-FRACTION(2 : 1) NOT = '0'                              
              MOVE WK-QTY-OUT-D2 TO WS-MQTY-ED-D2 TS-HST-QTY-RECL               
           ELSE                                                                 
           IF WK-QTY-OUT-FRACTION(1 : 1) NOT = '0'                              
              MOVE WK-QTY-OUT-D1 TO WS-MQTY-ED-D1 TS-HST-QTY-RECL               
           ELSE                                                                 
              MOVE WK-QTY-OUT-WHOLE TO WS-MQTY-ED-D0 TS-HST-QTY-RECL            
           END-IF.                                                              
       EJECT                                                                    
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
           MOVE ATT-UNPROT TO MNEXTA.                                           
           IF TWA-MAP-NEXT = 'K'                                                
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
      *----------------------------------------------------------------*        
      *     NEXT FIELD IS SPACE - CHECK SEARCH ENGINE                  *        
      *----------------------------------------------------------------*        
       1610-NEXT-SEL-SPACE-RTN.                                                 
           MOVE  'K'   TO  ACAT-INP-SEL.                                        
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
                    MOVE TWA-MAP-MMBR TO MBRO TWA-MAP-BR TWA-SAVE-MAP-BR        
                    MOVE TWA-MAP-MMAC TO MACO TWA-MAP-AC TWA-SAVE-MAP-AC        
                    PERFORM 2000-NEW-ACCT-ENTRY                                 
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
      *                                                                         
      *                                                                         
      *----------------------------------------------------------------*        
      *    BOTH BRANCH AND ACCOUNT FIELDS MUST BE ENTERED/FILLED,      *        
      *    OTHERWISE SEND MESSAGE.                                     *        
      *----------------------------------------------------------------*        
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
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE -1 TO MACL                                             
                    MOVE 'ENTER ACCOUNT #' TO SYSTEM-MSG                        
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE -1 TO MBRL                                                
                 MOVE 'ENTER BRANCH' TO SYSTEM-MSG                              
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *     NEXT FIELD IS ENTERED - CHECK NEXT AND SEARCH ENGINE       *        
      *----------------------------------------------------------------*        
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
              MOVE 'ACAT12IR'    TO ACAT-CALLING-PROG-NAME                      
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
       1800-SEND-POPUP-MAP-RTN.                                                 
           IF TWA-SCREEN = 'R'                                                  
              MOVE 'R' TO ACAT90CM-TS-SCREEN                                    
           ELSE                                                                 
              IF EIBCPOSN >= 240 AND < 720                                      
                 MOVE 'A' TO ACAT90CM-TS-SCREEN                                 
              ELSE                                                              
              IF EIBCPOSN >= 880 AND < 960                                      
                 IF TWA-MAP-BAL01 = SPACE OR LOW-VALUE                          
                    MOVE ' ' TO ACAT90CM-TS-SCREEN                              
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'INVALID CURSOR POSITION' TO SYSTEM-MSG                
                    PERFORM 9000-ERROR-RTN                                      
                 ELSE                                                           
                    MOVE '1' TO ACAT90CM-TS-SCREEN                              
                 END-IF                                                         
              ELSE                                                              
              IF EIBCPOSN >= 960 AND < 1040                                     
                 IF TWA-MAP-BAL02 = SPACE OR LOW-VALUE                          
                    MOVE ' ' TO ACAT90CM-TS-SCREEN                              
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'PF1 DISABLED' TO SYSTEM-MSG                           
                    PERFORM 9000-ERROR-RTN                                      
                 ELSE                                                           
                    MOVE '2' TO ACAT90CM-TS-SCREEN                              
                 END-IF                                                         
              ELSE                                                              
              IF EIBCPOSN >= 1040 AND < 1120                                    
                 IF TWA-MAP-BAL05 = SPACE OR LOW-VALUE                          
                    MOVE ' ' TO ACAT90CM-TS-SCREEN                              
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'PF1 DISABLED' TO SYSTEM-MSG                           
                    PERFORM 9000-ERROR-RTN                                      
                 ELSE                                                           
                    MOVE '5' TO ACAT90CM-TS-SCREEN                              
                 END-IF                                                         
              ELSE                                                              
              IF EIBCPOSN >= 1200 AND < 1600                                    
                 IF TWA-MAP-QTY = SPACE OR LOW-VALUE                            
                    MOVE ' ' TO ACAT90CM-TS-SCREEN                              
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'PF1 DISABLED' TO SYSTEM-MSG                           
                    PERFORM 9000-ERROR-RTN                                      
                 ELSE                                                           
                    MOVE 'S' TO ACAT90CM-TS-SCREEN                              
                 END-IF                                                         
              ELSE                                                              
                 MOVE ' ' TO ACAT90CM-TS-SCREEN                                 
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'INVALID CURSOR POSITION' TO SYSTEM-MSG                   
                 PERFORM 9000-ERROR-RTN.                                        
                                                                                
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 1810-ACAT90CM-TS-RTN.                                        
ET0002     MOVE 'K' TO ACAT-INP-SEL.                                            
           MOVE '$' TO WS-ACAT-NEXT.                                            
           MOVE 'ACAT90CM' TO CALLED-PROGRAM-NAME.                              
           PERFORM 1820-INVOKE-DETAIL-PGM-RTN.                          07225010
                                                                                
       EJECT                                                                    
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
              MOVE TWA-ACCT-CMNTS    TO ACAT90CM-TS-MCCMNT-X120                 
           ELSE                                                                 
           IF ACAT90CM-TS-SCREEN = '1'                                          
              IF TWA-TFR-NEW OR TWA-TFR-INQUIRY                                 
                 MOVE TWA-SV-HST-CMNTS1 TO ACAT90CM-TS-MCCMNT-X120              
              ELSE                                                              
                 MOVE TWA-SV-INI-CMNTS1 TO ACAT90CM-TS-MCCMNT-X120              
              END-IF                                                            
           ELSE                                                                 
           IF ACAT90CM-TS-SCREEN = '2'                                          
              IF TWA-TFR-NEW OR TWA-TFR-INQUIRY                                 
                 MOVE TWA-SV-HST-CMNTS2 TO ACAT90CM-TS-MCCMNT-X120              
              ELSE                                                              
                 MOVE TWA-SV-INI-CMNTS2 TO ACAT90CM-TS-MCCMNT-X120              
              END-IF                                                            
           ELSE                                                                 
           IF ACAT90CM-TS-SCREEN = '5'                                          
              IF TWA-TFR-NEW OR TWA-TFR-INQUIRY                                 
                 MOVE TWA-SV-HST-CMNTS5 TO ACAT90CM-TS-MCCMNT-X120              
              ELSE                                                              
                 MOVE TWA-SV-INI-CMNTS5 TO ACAT90CM-TS-MCCMNT-X120              
              END-IF                                                            
           ELSE                                                                 
           IF ACAT90CM-TS-SCREEN = 'S'                                          
              IF TWA-TFR-NEW OR TWA-TFR-INQUIRY                                 
                 MOVE TWA-PAGE-NUM TO WS-HST-ITEM                               
                 PERFORM 7100-READ-HIST-ASSET-TSQ                               
                 MOVE TS-HST-CMNTS TO ACAT90CM-TS-MCCMNT-X120                   
              END-IF                                                            
              IF TWA-TFR-UPDATE                                                 
                 MOVE TWA-PAGE-NUM TO WS-INI-ITEM                               
                 PERFORM 7200-READ-INIT-ASSET-TSQ                               
                 MOVE TS-INI-CMNTS TO ACAT90CM-TS-MCCMNT-X120                   
              END-IF                                                            
           END-IF.                                                              
           MOVE TWA-MAP-BR     TO ACAT90CM-TS-MBR.                              
           MOVE TWA-MAP-AC     TO ACAT90CM-TS-MAC.                              
           MOVE TWA-RR         TO ACAT90CM-TS-MRR.                              
           MOVE TWA-ACCT-TYPE  TO ACAT90CM-TS-MCTYPE.                           
           MOVE TWA-RCV        TO ACAT90CM-TS-MCBRKR.                           
           MOVE TWA-RCV-ACCT   TO ACAT90CM-TS-MCACCT.                           
           MOVE TWA-SECUR      TO ACAT90CM-TS-MNAME.                            
           MOVE TWA-CUST-NM1   TO ACAT90CM-TS-MNAME2.                           
           MOVE TWA-CUST-NM2   TO ACAT90CM-TS-MNAME3.                           
           MOVE 'ACA$' TO TRAN-ID.                                      02410002
           MOVE +1     TO ITEM-NUM.                                            2
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                                 2
                               FROM(ACAT90CM-TS-AREA)                          2
                               LENGTH(LENGTH OF ACAT90CM-TS-AREA)              2
                               ITEM(ITEM-NUM)                                  2
           END-EXEC.                                                           2
           IF EIBRESP NOT = +0                                                 2
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE 'ACAT12IR WRITE TSQ ERROR ON ACA$'                          2
                TO SYSTEM-MSG                                                  2
           END-IF.                                                             2
                                                                                
       1820-INVOKE-DETAIL-PGM-RTN.                                             0
           EXEC CICS XCTL PROGRAM(CALLED-PROGRAM-NAME)                          
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
           MOVE CALLED-PROGRAM-NAME TO ERROR-PROG-NAME.                         
           MOVE 'K' TO ACAT-NEXT.                                               
           MOVE ERROR-PROG-MSG    TO SYSTEM-MSG.                                
           MOVE LOW-VALUE TO ACAT12MO.                                          
           MOVE SPACES    TO ACAT-CALLING-PROG-NAME.                            
           EJECT                                                                
ET0005*                                                                         
ET0005*---------------------------------------------------------------*         
ET0005*                PF2: ADD RECLAIM                               *         
ET0005*                                                               *         
ET0005*   WHILE NEW RCL RECORD IS STILL IN INITIAL TRANSFER TABLE,    *         
ET0005*   USER CAN ADD ADDITIONAL RCL RECORDS FOR THE SAME ACCOUNT    *         
ET0005*   TO THE TABLE.                                               *         
ET0005*---------------------------------------------------------------*         
ET0005 1900-ADD-RECLAIM.                                                        
ET0008**   IF TWA-TFR-NEW OR TWA-TFR-INQUIRY                                    
ET0008     IF NOT TWA-TFR-UPDATE                                                
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE -1              TO MBRL                                      
LRM011***     MOVE -1 TO MNEXTL                                                 
LRM011        MOVE 'PF2 KEY NOT AVAILABLE / ENTER BRANCH ACCOUNT TO VIEW        
LRM011-            ' HISTORY, THEN PF2 TO ADD'                                  
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
              SET TWA-ADD-RECLAIM TO TRUE                                       
              SET TWA-TFR-NEW  TO TRUE                                          
              MOVE SPACE TO TWA-SAVE-MAP-BR TWA-SAVE-MAP-AC                     
              PERFORM 1000-ENTER-KEY                                            
           END-IF.                                                              
ET0005 EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *                 USER ENTERED NEW ACCOUNT                       *        
      *----------------------------------------------------------------*        
       2000-NEW-ACCT-ENTRY.                                                     
ET0003     MOVE SPACE TO TWA-NSCC-PEND-CD-IS-Y-SW.                              
ET0006     MOVE SPACE TO TWA-ADD-ASSET-SW.                                      
ET0008     MOVE SPACE TO TWA-SRCH-ALL-RCLS-SW.                                  
           PERFORM 2010-CLEAR-SCR.                                              
           PERFORM 7110-DELETE-HIST-ASSET-TSQ.                                  
           PERFORM 7210-DELETE-INIT-ASSET-TSQ.                                  
           PERFORM 2100-SAVE-ASSETS-IN-TS                                       
ET0005        THRU 2100-EXIT.                                                   
ET0001     MOVE SPACE TO TWA-SAVE-MAP-ENTRY.                                    
           MOVE SPACE TO TWA-TFR-UPDATE-IND.                                    
           IF WS-TFR-HIST-FOUND                                                 
              MOVE TWA-MAP-BR   TO WS-BRANCH                                    
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
              IF NOT WK-ERROR                                                   
                 MOVE -1 TO MNEXTL                                              
              END-IF                                                            
           ELSE                                                                 
              MOVE  0 TO TWA-PAGE-NUM                                           
              MOVE -1 TO MBRL                                                   
              MOVE ATT-UNPROT-BRT TO MBRA MACA                                  
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'NO TRANSFER FOUND FOR THE REQUESTED ACCOUNT'             
                   TO  SYSTEM-MSG                                               
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *              CLEAR SCREEN AREA                                 *        
      *----------------------------------------------------------------*        
       2010-CLEAR-SCR.                                                          
           MOVE SPACE     TO MRRO                                               
                             MCBRKRO                                            
                             MCACCTO                                            
ET0001                       MTRNFRO                                            
                             MCBNAMO                                            
                             MCTYPEO                                            
                             MSDO                                               
                             MACATO                                             
                             MSTATO                                             
                             MNAMEO                                             
                             MSSNO                                              
                             MNAME2O                                            
                             MSSN2O                                             
                             MBAL01I                                            
                             REASON1O                                           
                             RECLM1O                                            
                             MBAL02I                                            
                             REASON2O                                           
                             RECLM2O                                            
                             MBAL05I                                            
                             REASON3O                                           
                             RECLM3O                                            
                             MSECRO                                             
                             MCATGRO                                            
                             MSLOCO                                             
                             MTYPEO                                             
                             MDESC1O                                            
                             MDESC2O                                            
                             MQTYI                                              
                             REASON4O                                           
                             RECLM4O                                            
ET0006                       MAMTI                                              
                             MNEXTO                                             
                             MSUBO                                              
                             MDELO.                                             
           MOVE ATT-ASKIP TO MBAL01A                                            
                             MBAL02A                                            
                             MBAL05A                                            
                             MQTYA                                              
                             REASON1A                                           
                             REASON2A                                           
                             REASON3A                                           
                             REASON4A                                           
                             RECLM1A                                            
                             RECLM2A                                            
                             RECLM3A                                            
                             RECLM4A                                            
                             MSUBA                                              
                             MDELA.                                             
ET0006                                                                          
ET0006     MOVE ATT-ASKIP TO MSECRA                                             
ET0006                       MCATGRA                                            
ET0006                       MSLOCA                                             
ET0006                       MTYPEA.                                            
                                                                                
ET0006     MOVE ATT-ASKIP-DRK  TO AMTDESCA                                      
ET0006                            MAMTA.                                        
       EJECT                                                                    
ET0006*                                                                         
ET0006*---------------------------------------------------------------*         
ET0006*        UNPROTECT SECURITY FIELDS TO ADD ADDITINAL ASSET       *         
ET0006*---------------------------------------------------------------*         
ET0006 2020-CLEAR-RESET-SCR-FOR-PF5.                                            
           MOVE ATT-UNPROT TO MSECRA                                            
                              MCATGRA                                           
                              MSLOCA                                            
                              MTYPEA                                            
                              MQTYA                                             
                              MAMTA                                             
                              REASON4A                                          
                              RECLM4A.                                          
                                                                                
           MOVE ATT-ASKIP  TO AMTDESCA.                                         
                                                                                
           MOVE SPACE      TO MCATGRO                                           
                              MSLOCO                                            
                              MTYPEO                                            
                              MDESC1O                                           
                              MDESC2O                                           
                              MQTYI                                             
                              MAMTI                                             
                              REASON4O                                          
                              RECLM4O.                                          
                                                                                
           MOVE SPACE      TO TWA-CATGRY                                        
                              TWA-SLOC                                          
                              TWA-SEC-TYPE                                      
                              TWA-DESCRIPT                                      
                              TWA-MAP-QTY                                       
                              TWA-MAP-RSON4                                     
                              TWA-MAP-RCLM4                                     
                              TWA-MAP-RCLMED4                                   
                              TWA-MAP-AMT                                       
                              TWA-PREV-CATGRY                                   
                              TWA-PREV-SLOC                                     
                              TWA-PREV-SEC-TYPE                                 
                              TWA-PREV-QTY                                      
                              TWA-PREV-AMT                                      
                              TWA-PREV-RSON4                                    
                              TWA-PREV-RCLM4.                                   
                                                                                
           MOVE ATT-UNPROT TO MSUBA.                                            
           MOVE ATT-ASKIP  TO MDELA.                                            
                                                                                
ET0006*                                                                         
ET0006*---------------------------------------------------------------*         
ET0006*   WHEN HIT PF5 AND NO ASSETS EXIST, UNPROTECT MONEY FIELDS.   *         
ET0006*---------------------------------------------------------------*         
ET0006 2030-OPEN-MONEY-LINES.                                                   
           IF TWA-MAP-BAL01 > SPACE                                             
              CONTINUE                                                          
           ELSE                                                                 
              MOVE TWA-SV-HST-BAL01-ORG  TO MBAL01O                             
              MOVE MBAL01O               TO TWA-MAP-BAL01                       
           END-IF.                                                              
           MOVE ATT-UNPROT  TO MBAL01A  REASON1A  RECLM1A.                      
                                                                                
           IF TWA-MAP-BAL02 > SPACE                                             
              CONTINUE                                                          
           ELSE                                                                 
              MOVE TWA-SV-HST-BAL02-ORG  TO MBAL02O                             
              MOVE MBAL02O               TO TWA-MAP-BAL02                       
           END-IF.                                                              
           MOVE ATT-UNPROT  TO MBAL02A  REASON2A  RECLM2A.                      
                                                                                
           IF TWA-MAP-BAL05 > SPACE                                             
              CONTINUE                                                          
           ELSE                                                                 
              MOVE TWA-SV-HST-BAL05-ORG  TO MBAL05O                             
              MOVE MBAL05O               TO TWA-MAP-BAL05                       
           END-IF.                                                              
           MOVE ATT-UNPROT  TO MBAL05A  REASON3A  RECLM3A.                      
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
ET0001***READ HISTORY TRNFR, IF FOUND                                  *        
ET0001*  READ HISTORY TRNFR CURSOR TABLE, IF FOUND                     *        
      *     - READ HISTORY ASSETS, IF FOUND                            *        
      *          - SAVE HISTORY ASSETS IN HIST TEMP STORAGE            *        
      *  READ INIT TRNFR BEFORE SENT TO NSCC, IF FOUND                 *        
      *     - READ INIT ASSETS, IF FOUND                               *        
      *          - SAVE INIT ASSETS IN INIT TEMP STORAGE               *        
      *----------------------------------------------------------------*        
       2100-SAVE-ASSETS-IN-TS.                                                  
           MOVE 0     TO TWA-MAX-PAGE-HST                                       
                         TWA-MAX-PAGE-INI.                                      
                                                                                
           MOVE ACAT-ADP-BROKER  TO ACAT12-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR TO WS-PASS-BR.                                       
           MOVE TWA-MAP-AC TO WS-PASS-ACCT.                                     
           MOVE ALL '%'    TO WS-PASS-ACCT-MASK.                                
           MOVE WS-PASS-ACCT-DLV TO ACAT12-PASS-ACCT-DLV.                       
                                                                                
ET0001**   PERFORM 3000-GET-TFR-HIST.                                           
                                                                                
ET0001     PERFORM 2900-OPEN-TRNFR-HIST.                                        
ET0001     PERFORM 2910-FETCH-TRNFR-HIST.                                       
ET0001     PERFORM 2920-CLOSE-TRNFR-HIST.                                       
           IF WS-TFR-HIST-FOUND                                                 
ET0001        PERFORM 2970-TRNF-HIST-TO-TWA                                     
              MOVE SPACE TO WS-RCLM-ASSET-FOUND-SW                              
              PERFORM 3010-OPEN-ASSET-HIST                                      
              IF WS-ASSET-HIST-FOUND                                            
                 INITIALIZE TWA-SAVE-HIST-BALANCE                               
                            TS-HST-ASSET-AREA                                   
                 MOVE SPACE TO WS-NO-MORE-DATA-SW                               
                 PERFORM  3500-SAVE-ASSET-HIST-IN-TS THRU 3500-EXIT             
                      UNTIL WS-NO-MORE-DATA                                     
ET0001**         PERFORM 3030-CLOSE-ASSET-HIST                                  
ET0001**         PERFORM 5000-CHECK-DUPLICATE-ASSETS                            
              END-IF                                                            
ET0001        PERFORM 3030-CLOSE-ASSET-HIST                                     
ET0001     END-IF.                                                              
                                                                                
ET0005     IF TWA-ADD-RECLAIM                                                   
ET0005        GO TO 2100-EXIT                                                   
ET0005     END-IF.                                                              
                                                                                
ET0005**   PERFORM 3100-GET-TFR-INIT.                                           
ET0005     PERFORM 3102-OPEN-TRNFR-INIT.                                        
ET0005     PERFORM 3103-FETCH-TRNFR-INIT.                                       
ET0005     PERFORM 3104-CLOSE-TRNFR-INIT.                                       
           IF WS-TFR-INIT-FOUND                                                 
ET0005        PERFORM 3109-TRNF-INIT-TO-TWA                                     
              PERFORM 3110-OPEN-ASSET-INIT                                      
              IF WS-ASSET-INIT-FOUND                                            
                 INITIALIZE TWA-SAVE-INIT-BALANCE                               
                            TS-INI-ASSET-AREA                                   
                 MOVE SPACE TO WS-NO-MORE-DATA-SW                               
                 PERFORM 3600-SAVE-ASSET-INIT-IN-TS THRU 3600-EXIT              
                     UNTIL WS-NO-MORE-DATA                                      
              END-IF                                                            
ET0001        PERFORM 3130-CLOSE-ASSET-INIT                                     
ET0001     END-IF.                                                              
ET0005 2100-EXIT.  EXIT.                                                        
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      * - INIT ASSET TEMP STORAGE FOUND                                *        
      *     IT IMPLIES THAT SOME OR ALL ASSETS WERE ALREADY RECLAIMED. *        
      *     ONCE THE ASSETS WERE RECLAIMED, THE USER CAN NO LONGER     *        
      *     RECLAIM THE SAME ASSET AGAIN, BUT DELETE IT.               *        
      *     THE PROGRAM SETS UP A SCREEN FROM INITIAL TRANSFER AND     *        
      *     ASSET TABLES FOR INQUIRY/DELETION (NOT FOR RECLAIM).       *        
      *     DELETING ASSETS MEANS A CANCELLATION OF ALREADY RECLAIMED  *        
      *     ASSETS.                                                    *        
      *                                                                *        
      * - INIT ASSET TEMP STORAGE NOT FOUND                            *        
      *     IT IMPLIES THAT ALREADY RECLAIMED ASSETS (IF RECLAIMED)    *        
      *     WERE SENT TO NSCC.                                         *        
      *     SETUP A SCREEN FROM HISTORY TRANSFER AND ASSET TABLES.     *        
      *----------------------------------------------------------------*        
       2200-SETUP-NEW.                                                          
ET0001     MOVE SPACE TO TWA-NO-ASSET-SW.                                       
ET0001     SET TWA-TFR-NEW TO TRUE.                                             
ET0005                                                                          
ET0005     IF NOT TWA-ADD-RECLAIM                                               
           IF WS-TFR-INIT-FOUND                                                 
              SET TWA-TFR-UPDATE TO TRUE                                        
              IF WS-ASSET-INIT-FOUND                                            
                 PERFORM 2300-FROM-TFR                                          
                 PERFORM 2320-FROM-INIT-TWA                                     
                 MOVE +1 TO TWA-PAGE-NUM                                        
                            WS-INI-ITEM                                         
                 PERFORM 2325-FROM-INIT-TS                                      
                 GO TO 2200-EXIT.                                               
                                                                                
ET0005     IF TWA-ADD-RECLAIM                                                   
ET0005        MOVE SPACE TO TWA-ADD-RECLAIM-SW                                  
ET0005     END-IF.                                                              
           IF WS-ASSET-HIST-FOUND                                               
              IF WS-RCLM-ASSET-FOUND                                            
                 PERFORM 2300-FROM-TFR                                          
ET0001**         SET TWA-TFR-NEW TO TRUE                                        
                 PERFORM 2310-FROM-HIST-TWA                                     
                 MOVE +1 TO TWA-PAGE-NUM                                        
                            WS-HST-ITEM                                         
                 PERFORM 2315-FROM-HIST-TS                                      
              ELSE                                                              
ET0001           SET TWA-NO-ASSET TO TRUE                                       
                 MOVE 0 TO TWA-PAGE-NUM                                         
ET0001           PERFORM 2300-FROM-TFR                                          
                 MOVE -1 TO MBRL                                                
                 SET WK-MSG-ON TO TRUE                                          
                 MOVE 'NO ASSETS FOUND FOR THE REQUESTED ACCOUNT'               
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           ELSE                                                                 
ET0001        SET TWA-NO-ASSET TO TRUE                                          
              MOVE 0 TO TWA-PAGE-NUM                                            
              MOVE -1 TO MBRL                                                   
              SET WK-MSG-ON TO TRUE                                             
              MOVE 'NO ASSETS FOUND FOR THE REQUESTED ACCOUNT'                  
                TO  SYSTEM-MSG                                                  
           END-IF.                                                              
       2200-EXIT.                                           EXIT.               
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *   SETUP TRANSFER DATA                                          *        
      *----------------------------------------------------------------*        
       2300-FROM-TFR.                                                           
           MOVE TWA-DLVR-ACCT  TO WS-DLVR-ACCT.                                 
ET0002**   MOVE WS-BRANCH      TO MBRO.                                         
ET0002**   MOVE WS-ACCT        TO MACO.                                         
ET0002     MOVE WS-BRANCH      TO MBRO TWA-MAP-BR.                              
ET0002     MOVE WS-ACCT        TO MACO TWA-MAP-AC.                              
           MOVE TWA-RR         TO MRRO.                                         
           MOVE TWA-RCV        TO MCBRKRO.                                      
           MOVE TWA-RCV-ACCT   TO MCACCTO.                                      
ET0001     MOVE TWA-TFR-TYPE   TO MTRNFRO.                                      
                                                                                
           MOVE TWA-RCV      TO ACATPPIO-BRKR.                                  
           SET ACATPPIO-READ TO TRUE.                                           
           PERFORM 7700-LINK-TO-ACATPPIO.                                       
           IF ACATPPIO-FOUND                                                    
              MOVE ACATPPIO-NAME TO MCBNAMO TWA-CNAME                           
           ELSE                                                                 
              MOVE SPACES        TO MCBNAMO TWA-CNAME.                          
                                                                                
           MOVE TWA-ACCT-TYPE  TO MCTYPEO.                                      
           IF TWA-STTL-DATE = '0001-01-01'                                      
              MOVE SPACE          TO MSDO                               10350002
           ELSE                                                                 
           IF TWA-STTL-DATE > SPACE                                             
              MOVE TWA-STTL-DATE  TO WS-DB2-FORM-DATE                           
              MOVE WS-DATE-YY     TO WS-EDITED-YY                               
              MOVE WS-DATE-MM     TO WS-EDITED-MM                               
              MOVE WS-DATE-DD     TO WS-EDITED-DD                               
              MOVE WS-EDITED-DATE TO MSDO.                                      
           MOVE TWA-ACAT       TO MACATO.                                       
           IF TWA-TFR-UPDATE                                                    
ET0005        IF TWA-ADP-CONTROL-NBR > SPACE                                    
ET0005           MOVE TWA-ADP-CONTROL-NBR TO MACATO                             
ET0005        ELSE                                                              
                 MOVE SPACE  TO MACATO                                          
ET0005        END-IF                                                            
ET0005     END-IF.                                                              
           MOVE TWA-CUST-NM1   TO MNAMEO.                                       
           MOVE TWA-CUST-NM2   TO MNAME2O.                                      
           EVALUATE TWA-STATUS                                          08505010
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
                    MOVE TWA-STATUS                                     08510210
                      TO  MSTATO                                        08507010
           END-EVALUATE.                                                08510310
           IF TWA-SS1 = SPACE                                                   
              MOVE SPACE  TO MSSNO                                              
           ELSE                                                                 
              MOVE TWA-SS1(1:3)       TO WS-SS-NUM1                             
              MOVE TWA-SS1(4:2)       TO WS-SS-NUM2                             
              MOVE TWA-SS1(6:4)       TO WS-SS-NUM3                             
              MOVE WS-SS-NUM          TO MSSNO.                                 
           IF TWA-SS2 = SPACE                                                   
              MOVE SPACE  TO MSSN2O                                             
           ELSE                                                                 
              MOVE TWA-SS2(1:3)       TO WS-SS-NUM1                             
              MOVE TWA-SS2(4:2)       TO WS-SS-NUM2                             
              MOVE TWA-SS2(6:4)       TO WS-SS-NUM3                             
              MOVE WS-SS-NUM          TO MSSN2O.                                
                                                                                
       EJECT                                                                    
      *                                                                         
      *-----------------------------------------------------------*             
      *    SETUP MONEY BALANCE OF HISTORY TBL FROM TWA AREA       *             
      *-----------------------------------------------------------*             
       2310-FROM-HIST-TWA.                                                      
           MOVE ATT-UNPROT  TO MSUBA.                                           
           MOVE ATT-ASKIP   TO MDELA.                                           
           IF TWA-SV-HST-BAL01-ORG NOT = 0                                      
              IF TWA-SV-HST-STTLM-RSN1 = 'CRED'                                 
                 MULTIPLY TWA-SV-HST-BAL01-ORG BY -1                            
                          GIVING WS-SHORT-AMT                                   
                 MOVE WS-SHORT-AMT   TO MBAL01O                                 
                 MOVE MBAL01O        TO TWA-MAP-BAL01                           
              ELSE                                                              
                 MOVE TWA-SV-HST-BAL01-ORG  TO MBAL01O                          
                 MOVE MBAL01O               TO TWA-MAP-BAL01                    
              END-IF                                                            
              IF TWA-TFR-INQUIRY                                                
                 MOVE TWA-SV-HST-RSN1 TO REASON1O TWA-MAP-RSON1                 
                 MOVE 'Y'             TO RECLM1O  TWA-MAP-RCLM1                 
              ELSE                                                              
                 MOVE SPACE  TO TWA-MAP-RSON1 TWA-MAP-RCLM1                     
              END-IF                                                            
              IF TWA-SV-HST-BAL1-RCLMED = 'Y'                                   
                 MOVE TWA-SV-HST-RSN1 TO REASON1O TWA-MAP-RSON1                 
                 MOVE 'Y'             TO RECLM1O  TWA-MAP-RCLMED1               
                 MOVE ATT-ASKIP   TO MBAL01A  REASON1A  RECLM1A                 
              ELSE                                                              
                 MOVE ATT-UNPROT  TO MBAL01A  REASON1A  RECLM1A                 
              END-IF                                                            
ET0001     ELSE                                                                 
ET0001        IF TWA-TFR-NEW                                                    
ET0001           MOVE TWA-SV-HST-BAL01-ORG  TO MBAL01O                          
ET0001           MOVE MBAL01O               TO TWA-MAP-BAL01                    
ET0001           MOVE ATT-UNPROT  TO MBAL01A  REASON1A  RECLM1A                 
ET0001        END-IF                                                            
           END-IF.                                                              
           IF TWA-SV-HST-BAL02-ORG NOT = 0                                      
              IF TWA-SV-HST-STTLM-RSN2 = 'CRED'                                 
                 MULTIPLY TWA-SV-HST-BAL02-ORG BY -1                            
                          GIVING WS-SHORT-AMT                                   
                 MOVE WS-SHORT-AMT   TO MBAL02O                                 
                 MOVE MBAL02O        TO TWA-MAP-BAL02                           
              ELSE                                                              
                 MOVE TWA-SV-HST-BAL02-ORG  TO MBAL02O                          
                 MOVE MBAL02O               TO TWA-MAP-BAL02                    
              END-IF                                                            
              IF TWA-TFR-INQUIRY                                                
                 MOVE TWA-SV-HST-RSN2 TO REASON2O TWA-MAP-RSON2                 
                 MOVE 'Y'             TO RECLM2O  TWA-MAP-RCLM2                 
              ELSE                                                              
                 MOVE SPACE  TO TWA-MAP-RSON2 TWA-MAP-RCLM2                     
              END-IF                                                            
              IF TWA-SV-HST-BAL2-RCLMED = 'Y'                                   
                 MOVE TWA-SV-HST-RSN2 TO REASON2O TWA-MAP-RSON2                 
                 MOVE 'Y'             TO RECLM2O TWA-MAP-RCLMED2                
                 MOVE ATT-ASKIP   TO MBAL02A  REASON2A  RECLM2A                 
              ELSE                                                              
                 MOVE ATT-UNPROT  TO MBAL02A  REASON2A  RECLM2A                 
              END-IF                                                            
ET0001     ELSE                                                                 
ET0001        IF TWA-TFR-NEW                                                    
ET0001           MOVE TWA-SV-HST-BAL02-ORG  TO MBAL02O                          
ET0001           MOVE MBAL02O               TO TWA-MAP-BAL02                    
ET0001           MOVE ATT-UNPROT  TO MBAL02A  REASON2A  RECLM2A                 
ET0001        END-IF                                                            
           END-IF.                                                              
           IF TWA-SV-HST-BAL05-ORG NOT = 0                                      
              IF TWA-SV-HST-STTLM-RSN5 = 'CRED'                                 
                 MULTIPLY TWA-SV-HST-BAL05-ORG BY -1                            
                          GIVING WS-SHORT-AMT                                   
                 MOVE WS-SHORT-AMT   TO MBAL05O                                 
                 MOVE MBAL05O        TO TWA-MAP-BAL05                           
              ELSE                                                              
                 MOVE TWA-SV-HST-BAL05-ORG  TO MBAL05O                          
                 MOVE MBAL05O               TO TWA-MAP-BAL05                    
              END-IF                                                            
              IF TWA-TFR-INQUIRY                                                
                 MOVE TWA-SV-HST-RSN5 TO REASON3O TWA-MAP-RSON3                 
                 MOVE 'Y'             TO RECLM3O  TWA-MAP-RCLM3                 
              ELSE                                                              
                 MOVE SPACE  TO TWA-MAP-RSON3 TWA-MAP-RCLM3                     
              END-IF                                                            
              IF TWA-SV-HST-BAL5-RCLMED = 'Y'                                   
                 MOVE TWA-SV-HST-RSN5 TO REASON3O TWA-MAP-RSON3                 
                 MOVE 'Y'             TO RECLM3O TWA-MAP-RCLMED3                
                 MOVE ATT-ASKIP   TO MBAL05A  REASON3A  RECLM3A                 
              ELSE                                                              
                 MOVE ATT-UNPROT  TO MBAL05A  REASON3A  RECLM3A                 
              END-IF                                                            
ET0001     ELSE                                                                 
ET0001        IF TWA-TFR-NEW                                                    
ET0001           MOVE TWA-SV-HST-BAL05-ORG  TO MBAL05O                          
ET0001           MOVE MBAL05O               TO TWA-MAP-BAL05                    
ET0001           MOVE ATT-UNPROT  TO MBAL05A  REASON3A  RECLM3A                 
ET0001        END-IF                                                            
           END-IF.                                                              
      *                                                                         
      *-----------------------------------------------------------*             
      *       SETUP ASSETS FROM HISTORY ASSET TS                  *             
      *-----------------------------------------------------------*             
       2315-FROM-HIST-TS.                                                       
           PERFORM 7100-READ-HIST-ASSET-TSQ.                                    
           IF WK-TS-READ-OK                                                     
              IF TS-HST-QTY-ORIG NOT = 0                                        
                 IF TS-HST-PSTN-CD = 'S'                                        
                    MULTIPLY TS-HST-QTY-ORIG BY -1 GIVING WS-SHORT-QTY          
                    MOVE WS-SHORT-QTY       TO MQTYO                            
                    MOVE MQTYO              TO TWA-MAP-QTY                      
                 ELSE                                                           
                    MOVE TS-HST-QTY-ORIG    TO MQTYO                            
                    MOVE MQTYO              TO TWA-MAP-QTY                      
                 END-IF                                                         
                 MOVE SPACE  TO TWA-MAP-RSON4 TWA-MAP-RCLM4                     
                 MOVE TS-HST-SECURITY    TO MSECRO  TWA-SECUR                   
                 MOVE TS-HST-CTGRY       TO MCATGRO TWA-CATGRY                  
                 MOVE TS-HST-STTL-LOC    TO MSLOCO  TWA-SLOC                    
                 MOVE TS-HST-TYPE        TO MTYPEO  TWA-SEC-TYPE                
                 MOVE TS-HST-DESC(1:60)  TO MDESC1O                             
                 MOVE TS-HST-DESC(61:60) TO MDESC2O                             
                 MOVE TS-HST-DESC        TO TWA-DESCRIPT                        
                 IF TWA-TFR-INQUIRY                                             
                    MOVE TS-HST-REASON TO REASON4O TWA-MAP-RSON4                
                    MOVE TS-HST-RCLMED TO RECLM4O  TWA-MAP-RCLM4                
                    MOVE ATT-ASKIP  TO MQTYA REASON4A RECLM4A                   
                 ELSE                                                           
                 IF TWA-TFR-NEW                                                 
                    IF TS-HST-RCLMED = 'Y'                                      
                       MOVE TS-HST-REASON TO REASON4O TWA-MAP-RSON4             
                       MOVE TS-HST-RCLMED TO RECLM4O TWA-MAP-RCLMED4            
                       MOVE ATT-ASKIP     TO MQTYA REASON4A RECLM4A             
                    ELSE                                                        
                       MOVE ATT-UNPROT TO MQTYA REASON4A RECLM4A                
                    END-IF                                                      
                 ELSE                                                           
                    MOVE ATT-ASKIP  TO MQTYA REASON4A RECLM4A                   
                 END-IF.                                                        
       EJECT                                                                    
      *                                                                         
      *-----------------------------------------------------------*             
      *    SETUP MONEY BALANCE OF INITIAL TBL FROM TWA AREA       *             
      *-----------------------------------------------------------*             
       2320-FROM-INIT-TWA.                                                      
           MOVE ATT-ASKIP   TO MSUBA.                                           
           MOVE ATT-UNPROT  TO MDELA.                                           
ET0003     IF TWA-NSCC-PEND-CD-IS-Y                                             
ET0003        MOVE ATT-ASKIP  TO MDELA                                          
ET0003        SET WK-MSG-ON TO TRUE                                             
ET0003        MOVE 'RECORD TRANSMISSION TO NSCC IS IN PROGRESS - NO DELE        
ET0003-            'TION ALLOWED'                                               
ET0003          TO  SYSTEM-MSG                                                  
ET0003     END-IF.                                                              
           IF TWA-SV-INI-BAL01 NOT = 0                                          
              IF TWA-SV-INI-STTLM-RSN1 = 'CRED'                                 
                 MULTIPLY TWA-SV-INI-BAL01 BY -1 GIVING WS-SHORT-AMT            
                 MOVE WS-SHORT-AMT   TO MBAL01O                                 
                 MOVE MBAL01O        TO TWA-MAP-BAL01                           
              ELSE                                                              
                 MOVE TWA-SV-INI-BAL01  TO MBAL01O                              
                 MOVE MBAL01O           TO TWA-MAP-BAL01                        
              END-IF                                                            
              MOVE TWA-SV-INI-RSN1   TO REASON1O TWA-MAP-RSON1                  
              MOVE 'Y'               TO RECLM1O  TWA-MAP-RCLM1                  
              MOVE ATT-ASKIP         TO MBAL01A  REASON1A  RECLM1A              
           END-IF.                                                              
           IF TWA-SV-INI-BAL02 NOT = 0                                          
              IF TWA-SV-INI-STTLM-RSN2 = 'CRED'                                 
                 MULTIPLY TWA-SV-INI-BAL02 BY -1 GIVING WS-SHORT-AMT            
                 MOVE WS-SHORT-AMT   TO MBAL02O                                 
                 MOVE MBAL02O        TO TWA-MAP-BAL02                           
              ELSE                                                              
                 MOVE TWA-SV-INI-BAL02  TO MBAL02O                              
                 MOVE MBAL02I           TO TWA-MAP-BAL02                        
              END-IF                                                            
              MOVE TWA-SV-INI-RSN2   TO REASON2O TWA-MAP-RSON2                  
              MOVE 'Y'               TO RECLM2O  TWA-MAP-RCLM2                  
              MOVE ATT-ASKIP         TO MBAL02A  REASON2A  RECLM2A              
           END-IF.                                                              
           IF TWA-SV-INI-BAL05 NOT = 0                                          
              IF TWA-SV-INI-STTLM-RSN5 = 'CRED'                                 
                 MULTIPLY TWA-SV-INI-BAL05 BY -1 GIVING WS-SHORT-AMT            
                 MOVE WS-SHORT-AMT   TO MBAL05O                                 
                 MOVE MBAL05O        TO TWA-MAP-BAL05                           
              ELSE                                                              
                 MOVE TWA-SV-INI-BAL05  TO MBAL05O                              
                 MOVE MBAL05I           TO TWA-MAP-BAL05                        
              END-IF                                                            
              MOVE TWA-SV-INI-RSN5   TO REASON3O TWA-MAP-RSON3                  
              MOVE 'Y'               TO RECLM3O  TWA-MAP-RCLM3                  
              MOVE ATT-ASKIP         TO MBAL05A  REASON3A  RECLM3A              
           END-IF.                                                              
      *                                                                         
      *-----------------------------------------------------------*             
      *       SETUP ASSETS FROM INITIAL ASSET TS                  *             
      *-----------------------------------------------------------*             
       2325-FROM-INIT-TS.                                                       
           PERFORM 7200-READ-INIT-ASSET-TSQ.                                    
           IF WK-TS-READ-OK                                                     
              MOVE ATT-ASKIP  TO MQTYA REASON4A RECLM4A                         
ET0006        MOVE ATT-ASKIP-DRK  TO AMTDESCA                                   
ET0006                               MAMTA                                      
              IF TS-INI-PSTN-CD = 'S'                                           
                 MULTIPLY TS-INI-QTY-RECL BY -1 GIVING WS-SHORT-QTY             
                 MOVE WS-SHORT-QTY       TO MQTYO                               
                 MOVE MQTYO              TO TWA-MAP-QTY                         
              ELSE                                                              
                 MOVE TS-INI-QTY-RECL    TO MQTYO                               
                 MOVE MQTYI              TO TWA-MAP-QTY                         
              END-IF                                                            
              MOVE TS-INI-REASON      TO REASON4O TWA-MAP-RSON4                 
              MOVE TS-INI-RECL-IND    TO RECLM4O  TWA-MAP-RCLM4                 
              MOVE TS-INI-SECURITY    TO MSECRO   TWA-SECUR                     
              MOVE TS-INI-CTGRY       TO MCATGRO  TWA-CATGRY                    
              MOVE TS-INI-STTL-LOC    TO MSLOCO   TWA-SLOC                      
              MOVE TS-INI-TYPE        TO MTYPEO   TWA-SEC-TYPE                  
              MOVE TS-INI-DESC(1:60)  TO MDESC1O                                
              MOVE TS-INI-DESC(61:60) TO MDESC2O                                
              MOVE TS-INI-DESC        TO TWA-DESCRIPT.                          
       EJECT                                                                    
      *                                                                         
      *-----------------------------------------------------------*             
      *       CHECK SIGNON SECURITY                               *             
      *-----------------------------------------------------------*             
       2500-BR-AE-SECURITY.                                             04772510
           INITIALIZE ACAT-SRCH-COMM-AREA.                                      
           SET SECURITY-LOOKUP      TO TRUE.                                    
           MOVE WS-BRANCH           TO SRCH-INP-BRANCH.                 04597609
           MOVE TWA-RR              TO SRCH-INP-RR.                     04597609
           EXEC CICS LINK                                                       
                     PROGRAM('ACATSRCH')                                        
                     COMMAREA(ACAT-SRCH-COMM-AREA)                              
                     LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)                      
           END-EXEC.                                                            
                                                                        04785107
       EJECT                                                            04777303
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
                     MOVE 'K'             TO ACAT-INP-SEL                       
                     IF NOT WK-ERROR                                    AEISAC07
                        SET WK-ERROR      TO TRUE                               
                        MOVE 'USER NOT AUTHORIZED TO USE NEXT SELECTION'AEISAC07
                          TO SYSTEM-MSG                                 AEISAC07
                        MOVE TWA-MAP-NEXT                               AEISAC07
                          TO SYSTEM-MSG(44 : 1)                         AEISAC07
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
ET0006*                                                                         
ET0006*---------------------------------------------------------------*         
ET0006*      PF5: ADD ADDITIONAL ASSET NOT ON HISTORY TO RECLAIM      *         
ET0006*---------------------------------------------------------------*         
ET0006 2700-ADD-ASSET.                                                          
           IF NOT TWA-TFR-NEW                                                   
              MOVE SPACE TO TWA-ADD-ASSET-SW                                    
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'PF5 KEY NOT AVAILABLE THIS TIME'                            
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
              MOVE SPACE  TO  MSECRO                                            
                              TWA-SECUR                                         
                              TWA-PREV-SECUR                                    
              SET TWA-ADD-ASSET TO TRUE                                         
              COMPUTE TWA-PAGE-NUM = TWA-MAX-PAGE-HST + 1                       
              PERFORM 2020-CLEAR-RESET-SCR-FOR-PF5                              
              IF TWA-NO-ASSET                                                   
                 PERFORM 2030-OPEN-MONEY-LINES                                  
              END-IF                                                            
              PERFORM 7020-WRITE-TSQ-RTN                                        
              SET  WK-MSG-ON  TO TRUE                                           
              IF TWA-NO-ASSET                                                   
                 MOVE -1 TO MBAL01L                                             
              ELSE                                                              
                 MOVE 'ENTER SEC/CUS/SYM' TO SYSTEM-MSG                         
                 MOVE -1 TO MSECRL                                              
              END-IF                                                            
              PERFORM 8100-SEND-MAP-DATA-ONLY                                   
              PERFORM 8800-RETURN-TO-CICS                                       
           END-IF.                                                              
       EJECT                                                                    
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*        OPEN HISTORY TRANSFER CURSOR TABLE                     *         
ET0001*---------------------------------------------------------------*         
ET0001 2900-OPEN-TRNFR-HIST.                                                    
           INITIALIZE ACAT12-RET-VALUES.                                        
           SET ACAT12-OPN-TFRHST  TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
                                                                                
           IF ACAT12-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 OPEN ERROR ON TRN HIST CURSOR - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*           FETCH HISTORY TRANSFER CURSOR TABLE                 *         
ET0001*---------------------------------------------------------------*         
ET0001 2910-FETCH-TRNFR-HIST.                                                   
           MOVE SPACE TO WS-NO-MORE-DATA-SW                                     
                         WS-TFR-HIST-FOUND-SW.                                  
           INITIALIZE ACAT12-RET-VALUES                                         
                      ACAT12-TRANSFER.                                          
           SET ACAT12-FET-TFRHST TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-NORMAL                                                     
              SET WS-TFR-HIST-FOUND TO TRUE                                     
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 FETCH ERROR ON TRN HIST CURSOR - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*           CLOSE HISTORY TRANSFER CURSOR TABLE                 *         
ET0001*---------------------------------------------------------------*         
ET0001 2920-CLOSE-TRNFR-HIST.                                                   
           INITIALIZE ACAT12-RET-VALUES.                                        
           SET  ACAT12-CLO-TFRHST  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 CLOSE ERROR ON TRN HIST CURSOR - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*     OPEN HISTORY TRANSFER CURSOR TABLE IN DESCENDING ORDER    *         
ET0001*---------------------------------------------------------------*         
       2940-OPEN-TRNFR-HIST-DESC.                                               
           INITIALIZE ACAT12-RET-VALUES.                                        
           SET ACAT12-OPN-TFRHST-DESC  TO TRUE.                                 
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
                                                                                
           IF ACAT12-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 OPEN ERROR ON TRN HIST CURSR TBL DESCEND'               
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*    FETCH HISTORY TRANSFER CURSOR TABLE IN DESCENDING ORDER    *         
ET0001*---------------------------------------------------------------*         
       2950-FETCH-TRNFR-HIST-DESC.                                              
           MOVE SPACE TO WS-TFR-HIST-FOUND-SW                                   
                         WS-NO-MORE-DATA-SW.                                    
           INITIALIZE ACAT12-RET-VALUES                                         
                      ACAT12-TRANSFER.                                          
           SET ACAT12-FET-TFRHST-DESC TO TRUE.                                  
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-NORMAL                                                     
              SET WS-TFR-HIST-FOUND TO TRUE                                     
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 FETCH ERROR ON TRN HIST DESCEND CURSOR TABLE'           
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*    CLOSE HISTORY TRANSFER CURSOR TABLE IN DESCENDING ORDER    *         
ET0001*---------------------------------------------------------------*         
       2960-CLOSE-TRNFR-HIST-DESC.                                              
           INITIALIZE ACAT12-RET-VALUES.                                        
           SET  ACAT12-CLO-TFRHST-DESC  TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 CLOSE ERROR ON TRN HIST DESCEND CURSOR TABLE'           
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*         MOVE TRANSFER HISTORY DATA TO TWA AREA.               *         
ET0001*---------------------------------------------------------------*         
ET0001 2970-TRNF-HIST-TO-TWA.                                                   
           MOVE SPACE                TO TWA-MAP-AREA                            
           MOVE ACAT12-TFR-DLVR      TO TWA-DLVR                                
           MOVE ACAT12-TFR-DLVR-ACCT TO TWA-DLVR-ACCT                           
           MOVE ACAT12-TFR-RCV       TO TWA-RCV                                 
           MOVE ACAT12-TFR-RCV-ACCT  TO TWA-RCV-ACCT                            
           MOVE ACAT12-TFR-ACAT      TO TWA-ACAT                                
           MOVE ACAT12-TFR-STTS      TO TWA-STATUS                              
           MOVE ACAT12-TFR-ACCT-TYPE TO TWA-ACCT-TYPE                           
           MOVE ACAT12-TFR-STTL-DT   TO TWA-STTL-DATE                           
           MOVE ACAT12-TFR-NM1       TO TWA-CUST-NM1                            
           MOVE ACAT12-TFR-NM2       TO TWA-CUST-NM2                            
           MOVE ACAT12-TFR-SS1       TO TWA-SS1                                 
           MOVE ACAT12-TFR-SS2       TO TWA-SS2                                 
           MOVE ACAT12-TFR-RR        TO TWA-RR                                  
           MOVE ACAT12-TFR-TYPE      TO TWA-TFR-TYPE.                           
ET0004**   MOVE ACAT12-TFR-CMNTS     TO TWA-ACCT-CMNTS.                         
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           READ HISTORY TRANSFER TABLE                         *         
      *---------------------------------------------------------------*         
       3000-GET-TFR-HIST.                                                       
           MOVE SPACE TO WS-TFR-HIST-FOUND-SW.                                  
           INITIALIZE ACAT12-RET-VALUES                                         
                      ACAT12-TRANSFER.                                          
           SET ACAT12-GET-TFRHST  TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-NORMAL                                                     
              SET WS-TFR-HIST-FOUND TO TRUE                                     
              MOVE SPACE                TO TWA-MAP-AREA                         
              MOVE ACAT12-TFR-DLVR      TO TWA-DLVR                             
              MOVE ACAT12-TFR-DLVR-ACCT TO TWA-DLVR-ACCT                        
              MOVE ACAT12-TFR-RCV       TO TWA-RCV                              
              MOVE ACAT12-TFR-RCV-ACCT  TO TWA-RCV-ACCT                         
              MOVE ACAT12-TFR-ACAT      TO TWA-ACAT                             
              MOVE ACAT12-TFR-STTS      TO TWA-STATUS                           
              MOVE ACAT12-TFR-ACCT-TYPE TO TWA-ACCT-TYPE                        
              MOVE ACAT12-TFR-STTL-DT   TO TWA-STTL-DATE                        
              MOVE ACAT12-TFR-NM1       TO TWA-CUST-NM1                         
              MOVE ACAT12-TFR-NM2       TO TWA-CUST-NM2                         
              MOVE ACAT12-TFR-SS1       TO TWA-SS1                              
              MOVE ACAT12-TFR-SS2       TO TWA-SS2                              
              MOVE ACAT12-TFR-RR        TO TWA-RR                               
              MOVE ACAT12-TFR-TYPE      TO TWA-TFR-TYPE                         
              MOVE ACAT12-TFR-CMNTS     TO TWA-ACCT-CMNTS                       
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT12-SQLCODE = -811                                             
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'MULTIPLE FULL TRANSFERS FOUND FOR THE REQUESTED ACCT        
      -            ' - RECLAIM DENIED'                                          
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 READ ERROR ON HIST TRANSFER - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
      *---------------------------------------------------------------*         
      *           OPEN HISTORY ASSET CURSOR TABLE                     *         
      *---------------------------------------------------------------*         
       3010-OPEN-ASSET-HIST.                                                    
           MOVE SPACE TO WS-ASSET-HIST-FOUND-SW.                                
           MOVE TWA-ACAT TO ACAT12-PASS-ACAT.                                   
           INITIALIZE ACAT12-RET-VALUES.                                        
           SET  ACAT12-OPN-ASTHST  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-NORMAL                                                     
              SET WS-ASSET-HIST-FOUND TO TRUE                                   
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 OPEN ERROR ON HIST ASSET - CALL HELP DESK'              
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
      *---------------------------------------------------------------*         
      *           FETCH HISTORY ASSET CURSOR TABLE                    *         
      *---------------------------------------------------------------*         
       3020-FETCH-ASSET-HIST.                                                   
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           INITIALIZE ACAT12-RET-VALUES                                         
                      ACAT12-ASSET.                                             
           SET ACAT12-FET-ASTHST TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 FETCH ERROR ON HIST ASSET - CALL HELP DESK'             
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
      *---------------------------------------------------------------*         
      *           CLOSE HISTORY ASSET CURSOR TABLE                    *         
      *---------------------------------------------------------------*         
       3030-CLOSE-ASSET-HIST.                                                   
           INITIALIZE ACAT12-RET-VALUES.                                        
           SET  ACAT12-CLO-ASTHST  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 CLOSE ERROR ON HIST ASSET - CALL HELP DESK'             
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
ET0001* *** READ INITIAL TRANSFER TABLE WHERE NSCC_PEND_CD NOT = 'Y'  *         
ET0001*     READ INITIAL TRANSFER TABLE FOR ALL NSCC_PEND_CD          *         
      *     (NSCC_PEND_CD = 'Y' MEANS THAT INIT_TRNFR DATA HAS BEEN   *         
      *      ALREADY SENT TO NSCC)                                    *         
      *---------------------------------------------------------------*         
       3100-GET-TFR-INIT.                                                       
           MOVE SPACE TO WS-TFR-INIT-FOUND-SW.                                  
ET0001**   MOVE SPACE TO WS-NSCC-PEND-CD-IS-Y-SW.                               
           INITIALIZE ACAT12-RET-VALUES                                         
                      ACAT12-TRANSFER.                                          
           SET  ACAT12-GET-TFRINI  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-NORMAL                                                     
ET0001        IF ACAT12-TFR-NSCC-PEND = 'Y'                                     
ET0003           SET TWA-NSCC-PEND-CD-IS-Y TO TRUE                              
ET0003        ELSE                                                              
ET0003           MOVE SPACE TO TWA-NSCC-PEND-CD-IS-Y-SW                         
ET0001        END-IF                                                            
              SET WS-TFR-INIT-FOUND  TO TRUE                                    
              MOVE SPACE                TO TWA-MAP-AREA                         
              MOVE ACAT12-TFR-DLVR      TO TWA-DLVR                             
              MOVE ACAT12-TFR-DLVR-ACCT TO TWA-DLVR-ACCT                        
              MOVE ACAT12-TFR-RCV       TO TWA-RCV                              
              MOVE ACAT12-TFR-RCV-ACCT  TO TWA-RCV-ACCT                         
              MOVE ACAT12-TFR-STTS      TO TWA-STATUS                           
              MOVE ACAT12-TFR-ACCT-TYPE TO TWA-ACCT-TYPE                        
              MOVE ACAT12-TFR-ACAT-ASTD TO TWA-ACAT                             
              MOVE ACAT12-TFR-NM1       TO TWA-CUST-NM1                         
              MOVE ACAT12-TFR-NM2       TO TWA-CUST-NM2                         
              MOVE ACAT12-TFR-SS1       TO TWA-SS1                              
              MOVE ACAT12-TFR-SS2       TO TWA-SS2                              
              MOVE ACAT12-TFR-RR        TO TWA-RR                               
              MOVE ACAT12-TFR-TYPE      TO TWA-TFR-TYPE                         
              MOVE ACAT12-TFR-CMNTS     TO TWA-ACCT-CMNTS                       
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 READ ERROR ON INIT TRANSFER - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0005*                                                                         
ET0005*---------------------------------------------------------------*         
ET0005*            OPEN INITIAL TRANSFER CURSOR TABLE                 *         
ET0005*---------------------------------------------------------------*         
ET0005 3102-OPEN-TRNFR-INIT.                                                    
           INITIALIZE ACAT12-RET-VALUES.                                        
           SET ACAT12-OPN-TFRINI  TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
                                                                                
           IF ACAT12-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 OPEN ERROR ON TRN INIT CURSOR - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0005*                                                                         
ET0005*---------------------------------------------------------------*         
ET0005*           FETCH INITIAL TRANSFER CURSOR TABLE                 *         
ET0005*---------------------------------------------------------------*         
ET0005 3103-FETCH-TRNFR-INIT.                                                   
           MOVE SPACE TO WS-NO-MORE-DATA-SW                                     
                         WS-TFR-INIT-FOUND-SW.                                  
           INITIALIZE ACAT12-RET-VALUES                                         
                      ACAT12-TRANSFER.                                          
           SET ACAT12-FET-TFRINI TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-NORMAL                                                     
              SET WS-TFR-INIT-FOUND  TO TRUE                                    
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 FETCH ERROR ON TRN INIT CURSOR - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0005*                                                                         
ET0005*---------------------------------------------------------------*         
ET0005*           CLOSE INITIAL TRANSFER CURSOR TABLE                 *         
ET0005*---------------------------------------------------------------*         
ET0005 3104-CLOSE-TRNFR-INIT.                                                   
           INITIALIZE ACAT12-RET-VALUES.                                        
           SET  ACAT12-CLO-TFRINI  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 CLOSE ERROR ON TRF INIT CURSOR - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0005*                                                                         
ET0005*---------------------------------------------------------------*         
ET0005*     OPEN INITIAL TRANSFER CURSOR TABLE IN DESCENDING ORDER    *         
ET0005*---------------------------------------------------------------*         
       3105-OPEN-TRNFR-INIT-DESC.                                               
           INITIALIZE ACAT12-RET-VALUES.                                        
           SET ACAT12-OPN-TFRINI-DESC  TO TRUE.                                 
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
                                                                                
           IF ACAT12-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 OPEN ERROR ON TRF INIT CURSOR TBL DESCEND'              
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0005*                                                                         
ET0005*---------------------------------------------------------------*         
ET0005*    FETCH INITIAL TRANSFER CURSOR TABLE IN DESCENDING ORDER    *         
ET0005*---------------------------------------------------------------*         
       3106-FETCH-TRNFR-INIT-DESC.                                              
           MOVE SPACE TO WS-TFR-INIT-FOUND-SW                                   
                         WS-NO-MORE-DATA-SW.                                    
           INITIALIZE ACAT12-RET-VALUES                                         
                      ACAT12-TRANSFER.                                          
           SET ACAT12-FET-TFRINI-DESC TO TRUE.                                  
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-NORMAL                                                     
              SET WS-TFR-INIT-FOUND  TO TRUE                                    
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 FETCH ERROR ON TRF INIT DESCEND CURSOR TABLE'           
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
ET0005*                                                                         
ET0005*---------------------------------------------------------------*         
ET0005*    CLOSE INITIAL TRANSFER CURSOR TABLE IN DESCENDING ORDER    *         
ET0005*---------------------------------------------------------------*         
       3107-CLOSE-TRNFR-INIT-DESC.                                              
           INITIALIZE ACAT12-RET-VALUES.                                        
           SET  ACAT12-CLO-TFRINI-DESC  TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'DB2 CLOSE ERROR ON TRN INIT DESCEND CURSOR TABLE'           
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0005*                                                                         
ET0005*---------------------------------------------------------------*         
ET0005*         MOVE INITIAL TRANSFER DATA TO TWA AREA.               *         
ET0005*---------------------------------------------------------------*         
ET0005 3109-TRNF-INIT-TO-TWA.                                                   
           IF ACAT12-TFR-NSCC-PEND = 'Y'                                        
              SET TWA-NSCC-PEND-CD-IS-Y TO TRUE                                 
           ELSE                                                                 
              MOVE SPACE TO TWA-NSCC-PEND-CD-IS-Y-SW                            
           END-IF.                                                              
           MOVE SPACE                TO TWA-MAP-AREA.                           
           MOVE ACAT12-TFR-DLVR      TO TWA-DLVR.                               
           MOVE ACAT12-TFR-DLVR-ACCT TO TWA-DLVR-ACCT.                          
           MOVE ACAT12-TFR-RCV       TO TWA-RCV.                                
           MOVE ACAT12-TFR-RCV-ACCT  TO TWA-RCV-ACCT.                           
           MOVE ACAT12-TFR-STTS      TO TWA-STATUS.                             
           MOVE ACAT12-TFR-ACCT-TYPE TO TWA-ACCT-TYPE.                          
           MOVE ACAT12-TFR-ACAT-ASTD TO TWA-ACAT.                               
           MOVE ACAT12-TFR-NM1       TO TWA-CUST-NM1.                           
           MOVE ACAT12-TFR-NM2       TO TWA-CUST-NM2.                           
           MOVE ACAT12-TFR-SS1       TO TWA-SS1.                                
           MOVE ACAT12-TFR-SS2       TO TWA-SS2.                                
           MOVE ACAT12-TFR-RR        TO TWA-RR.                                 
           MOVE ACAT12-TFR-TYPE      TO TWA-TFR-TYPE.                           
           MOVE ACAT12-TFR-CMNTS     TO TWA-ACCT-CMNTS.                         
           MOVE ACAT12-TFR-ACAT      TO TWA-ADP-CONTROL-NBR.                    
      *                                                                         
      *---------------------------------------------------------------*         
      *     OPEN INITIAL ASSET CURSOR TABLE                           *         
      *---------------------------------------------------------------*         
       3110-OPEN-ASSET-INIT.                                                    
           MOVE SPACE TO WS-ASSET-INIT-FOUND-SW.                                
           INITIALIZE ACAT12-RET-VALUES.                                        
ET0005     MOVE TWA-RCV-ACCT        TO ACAT12-PASS-CON-ACCT.                    
ET0005     MOVE TWA-DLVR-ACCT       TO ACAT12-PASS-ACCT-DLV.                    
ET0005     MOVE TWA-ADP-CONTROL-NBR TO ACAT12-PASS-ACAT.                        
           SET  ACAT12-OPN-ASTINI  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-NORMAL                                                     
              SET WS-ASSET-INIT-FOUND TO TRUE                                   
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 OPEN ERROR ON INIT ASSET - CALL HELP DESK'              
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
      *---------------------------------------------------------------*         
      *     FETCH INITIAL ASSET CURSOR TABLE                          *         
      *---------------------------------------------------------------*         
       3120-FETCH-ASSET-INIT.                                                   
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           INITIALIZE ACAT12-RET-VALUES                                         
                      ACAT12-ASSET.                                             
           SET  ACAT12-FET-ASTINI  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 FETCH ERROR ON INIT ASSET - CALL HELP DESK'             
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
      *---------------------------------------------------------------*         
      *     CLOSE INITIAL ASSET CURSOR TABLE                          *         
      *---------------------------------------------------------------*         
       3130-CLOSE-ASSET-INIT.                                                   
           INITIALIZE ACAT12-RET-VALUES.                                        
           SET  ACAT12-CLO-ASTINI  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 CLOSE ERROR ON INIT ASSET - CALL HELP DESK'             
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           SAVE HISTORY ASSETS IN TS QUEUE                     *         
      *---------------------------------------------------------------*         
       3500-SAVE-ASSET-HIST-IN-TS.                                              
           PERFORM 3020-FETCH-ASSET-HIST.                                       
           IF WS-NO-MORE-DATA                                                   
              GO TO 3500-EXIT.                                                  
      *                                                                         
ET0001**   IF ACAT12-AST-STTL-LOC = '30' OR '45'                                
ET0001**      GO TO 3500-EXIT.                                                  
ET0001     IF ACAT12-AST-STTL-LOC = '10' OR '30' OR '35' OR '45'                
ET0001        GO TO 3500-EXIT.                                                  
ET0001                                                                          
12/21 ***  IF ACAT12-AST-RCL-SENT = 'Y' OR                                      
12/21 ***     ACAT12-AST-FRV-SENT = 'Y'                                         
12/21 ***       GO TO 3500-EXIT.                                                
           IF ACAT12-AST-STTL-LOC = '40'                                        
              SET WS-RCLM-ASSET-FOUND TO TRUE                                   
              IF ACAT12-AST-AMT NOT = 0                                         
                 IF ACAT12-AST-CS-MG-SH = 'C'                                   
                    MOVE ACAT12-AST-AMT       TO TWA-SV-HST-BAL01-ORG           
                    MOVE ACAT12-AST-REASON    TO TWA-SV-HST-RSN1                
                    MOVE ACAT12-AST-SEQ-NBR   TO TWA-SV-HST-SEQ-NBR1            
                    MOVE ACAT12-AST-PSTN-CD   TO TWA-SV-HST-PSTN-CD1            
                    MOVE ACAT12-AST-STTLM-RSN TO TWA-SV-HST-STTLM-RSN1          
                 END-IF                                                         
                 IF ACAT12-AST-CS-MG-SH = 'M'                                   
                    MOVE ACAT12-AST-AMT       TO TWA-SV-HST-BAL02-ORG           
                    MOVE ACAT12-AST-REASON    TO TWA-SV-HST-RSN2                
                    MOVE ACAT12-AST-SEQ-NBR   TO TWA-SV-HST-SEQ-NBR2            
                    MOVE ACAT12-AST-PSTN-CD   TO TWA-SV-HST-PSTN-CD2            
                    MOVE ACAT12-AST-STTLM-RSN TO TWA-SV-HST-STTLM-RSN2          
                 END-IF                                                         
                 IF ACAT12-AST-CS-MG-SH = 'S'                                   
                    MOVE ACAT12-AST-AMT       TO TWA-SV-HST-BAL05-ORG           
                    MOVE ACAT12-AST-REASON    TO TWA-SV-HST-RSN5                
                    MOVE ACAT12-AST-SEQ-NBR   TO TWA-SV-HST-SEQ-NBR5            
                    MOVE ACAT12-AST-PSTN-CD   TO TWA-SV-HST-PSTN-CD5            
                    MOVE ACAT12-AST-STTLM-RSN TO TWA-SV-HST-STTLM-RSN5          
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              IF ACAT12-AST-QTY NOT = 0                                         
                 MOVE ACAT12-AST-SEC         TO TS-HST-SECURITY                 
                 MOVE ACAT12-AST-CTGRY       TO TS-HST-CTGRY                    
                 MOVE ACAT12-AST-STTL-LOC    TO TS-HST-STTL-LOC                 
                 MOVE ACAT12-AST-CS-MG-SH    TO TS-HST-TYPE                     
                 MOVE ACAT12-AST-DESC        TO TS-HST-DESC                     
                 MOVE ACAT12-AST-AMT         TO TS-HST-AMT-ORIG                 
                 MOVE ACAT12-AST-QTY         TO TS-HST-QTY-ORIG                 
                 MOVE SPACE                  TO TS-HST-REASON                   
                 MOVE ACAT12-AST-SEQ-NBR     TO TS-HST-SEQ-NBR                  
                 MOVE ACAT12-AST-PSTN-CD     TO TS-HST-PSTN-CD                  
ET0001           MOVE ACAT12-AST-STTLM-RSN   TO TS-HST-STTLM-RSN                
                 PERFORM 7120-WRITE-HIST-ASSET-TSQ                              
                 ADD 1 TO TWA-MAX-PAGE-HST                                      
                 SET WS-RCLM-ASSET-FOUND TO TRUE                                
              END-IF.                                                           
       3500-EXIT.                                          EXIT.                
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           SAVE INITIAL ASSETS IN TS QUEUE AND TWA             *         
      *---------------------------------------------------------------*         
       3600-SAVE-ASSET-INIT-IN-TS.                                              
           PERFORM 3120-FETCH-ASSET-INIT.                                       
           IF WS-NO-MORE-DATA                                                   
              GO TO 3600-EXIT.                                                  
      *                                                                         
           IF ACAT12-AST-STTL-LOC = '40'                                        
              IF ACAT12-AST-CS-MG-SH = 'C'                                      
                 MOVE ACAT12-AST-AMT       TO TWA-SV-INI-BAL01                  
                 MOVE ACAT12-AST-REASON    TO TWA-SV-INI-RSN1                   
                 MOVE ACAT12-AST-CMNTS     TO TWA-SV-INI-CMNTS1                 
                 MOVE ACAT12-AST-PSTN-CD   TO TWA-SV-INI-PSTN-CD1               
                 MOVE ACAT12-AST-STTLM-RSN TO TWA-SV-INI-STTLM-RSN1             
              END-IF                                                            
              IF ACAT12-AST-CS-MG-SH = 'M'                                      
                 MOVE ACAT12-AST-AMT       TO TWA-SV-INI-BAL02                  
                 MOVE ACAT12-AST-REASON    TO TWA-SV-INI-RSN2                   
                 MOVE ACAT12-AST-CMNTS     TO TWA-SV-INI-CMNTS2                 
                 MOVE ACAT12-AST-PSTN-CD   TO TWA-SV-INI-PSTN-CD2               
                 MOVE ACAT12-AST-STTLM-RSN TO TWA-SV-INI-STTLM-RSN2             
              END-IF                                                            
              IF ACAT12-AST-CS-MG-SH = 'S'                                      
                 MOVE ACAT12-AST-AMT       TO TWA-SV-INI-BAL05                  
                 MOVE ACAT12-AST-REASON    TO TWA-SV-INI-RSN5                   
                 MOVE ACAT12-AST-CMNTS     TO TWA-SV-INI-CMNTS5                 
                 MOVE ACAT12-AST-PSTN-CD   TO TWA-SV-INI-PSTN-CD5               
                 MOVE ACAT12-AST-STTLM-RSN TO TWA-SV-INI-STTLM-RSN5             
              END-IF                                                            
           ELSE                                                                 
              MOVE ACAT12-AST-SEC       TO TS-INI-SECURITY                      
              MOVE ACAT12-AST-CTGRY     TO TS-INI-CTGRY                         
              MOVE ACAT12-AST-STTL-LOC  TO TS-INI-STTL-LOC                      
              MOVE ACAT12-AST-CS-MG-SH  TO TS-INI-TYPE                          
              MOVE ACAT12-AST-DESC      TO TS-INI-DESC                          
              MOVE ACAT12-AST-QTY       TO TS-INI-QTY-RECL                      
              MOVE ACAT12-AST-REASON    TO TS-INI-REASON                        
              MOVE ACAT12-AST-CMNTS     TO TS-INI-CMNTS                         
              MOVE ACAT12-AST-PSTN-CD   TO TS-INI-PSTN-CD                       
ET0001        MOVE ACAT12-AST-STTLM-RSN TO TS-INI-STTLM-RSN                     
              MOVE 'Y'                  TO TS-INI-RECL-IND                      
              PERFORM 7220-WRITE-INIT-ASSET-TSQ                                 
              ADD 1 TO TWA-MAX-PAGE-INI.                                        
       3600-EXIT.                                          EXIT.                
       EJECT                                                                    
ET0007*                                                                         
ET0007*---------------------------------------------------------------*         
ET0007*       PF6:  RECALIM ALL ASSETS                                *         
ET0007*---------------------------------------------------------------*         
ET0007*  SET ALL CASH AND SECURITY RECLAIM INDICATOR TO 'Y' AND       *         
ET0007*  REASON CODE TO '65' AS IF USER WERE RECLAIMING ALL ASSETS.   *         
ET0007*---------------------------------------------------------------*         
ET0007 3800-RECLAIM-ALL.                                                        
           IF NOT TWA-TFR-NEW                                                   
              MOVE SPACE TO TWA-ADD-ASSET-SW                                    
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'PF6 KEY NOT AVAILABLE THIS TIME'                            
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
              IF  TWA-SV-HST-BAL01-ORG = 0                                      
              AND TWA-SV-HST-BAL02-ORG = 0                                      
              AND TWA-SV-HST-BAL05-ORG = 0                                      
              AND TWA-MAX-PAGE-HST     = 0                                      
                 SET  WK-ERROR  TO TRUE                                         
                 MOVE LOW-VALUE TO ACAT12MO                                     
                 MOVE -1 TO MNEXTL                                              
                 MOVE 'INVALID PF6 - ACCOUNT HAS NO ASSETS TO RECLAIM'          
                   TO  SYSTEM-MSG                                               
                 PERFORM 9000-ERROR-RTN                                         
              ELSE                                                              
                 PERFORM 3810-UPDATE-CASH                                       
                 IF TWA-MAX-PAGE-HST NOT = 0                                    
                    PERFORM 3820-UPDATE-ASSET                                   
                        VARYING SUB FROM 1 BY 1                                 
                             UNTIL SUB > TWA-MAX-PAGE-HST                       
                 END-IF                                                         
                 PERFORM 0300-RESET-MAP                                         
                 PERFORM 7020-WRITE-TSQ-RTN                                     
                 PERFORM 8000-SEND-MAP-ERASE                                    
                 PERFORM 8800-RETURN-TO-CICS                                    
              END-IF                                                            
           END-IF.                                                              
       EJECT                                                                    
ET0007*                                                                         
ET0007*---------------------------------------------------------------*         
ET0007*    SET ALL CASH AMTS TO BE RECLAIMED WITH REASON CODE '65'.   *         
ET0007*                                                               *         
ET0007*      - ASSET AMT IS FOUND IN TWA-SAVE-HIST-BALANCE            *         
ET0007*      - CURRENT MAP ENTRY INFO IS IN TWA-SAVE-MAP-ENTRY        *         
ET0007*---------------------------------------------------------------*         
ET0007 3810-UPDATE-CASH.                                                        
           IF TWA-SV-HST-BAL01-ORG NOT = 0                                      
              MOVE TWA-SV-HST-BAL01-ORG  TO TWA-SV-HST-BAL01                    
                                                                                
              IF TWA-SV-HST-STTLM-RSN1 = 'CRED'                                 
                 MULTIPLY TWA-SV-HST-BAL01-ORG BY -1                            
                                   GIVING WS-SHORT-AMT                          
                 MOVE WS-SHORT-AMT         TO MBAL01O                           
                 MOVE MBAL01O              TO TWA-MAP-BAL01                     
                 MOVE 'N'                  TO TWA-SV-HST-BAL01-SIGN             
              ELSE                                                              
                 MOVE TWA-SV-HST-BAL01-ORG TO MBAL01O                           
                 MOVE MBAL01O              TO TWA-MAP-BAL01                     
                 MOVE ' '                  TO TWA-SV-HST-BAL01-SIGN             
              END-IF                                                            
                                                                                
              MOVE '65'     TO TWA-SV-HST-RSN1                                  
                               TWA-MAP-RSON1                                    
              MOVE 'Y'      TO TWA-SV-HST-RCL1                                  
                               TWA-MAP-RCLM1                                    
           END-IF.                                                              
                                                                                
           IF TWA-SV-HST-BAL02-ORG NOT = 0                                      
              MOVE TWA-SV-HST-BAL02-ORG  TO TWA-SV-HST-BAL02                    
                                                                                
              IF TWA-SV-HST-STTLM-RSN2 = 'CRED'                                 
                 MULTIPLY TWA-SV-HST-BAL02-ORG BY -1                            
                                   GIVING WS-SHORT-AMT                          
                 MOVE WS-SHORT-AMT         TO MBAL02O                           
                 MOVE MBAL02O              TO TWA-MAP-BAL02                     
                 MOVE 'N'                  TO TWA-SV-HST-BAL02-SIGN             
              ELSE                                                              
                 MOVE TWA-SV-HST-BAL02-ORG TO MBAL02O                           
                 MOVE MBAL02O              TO TWA-MAP-BAL02                     
                 MOVE ' '                  TO TWA-SV-HST-BAL02-SIGN             
              END-IF                                                            
                                                                                
              MOVE '65'     TO TWA-SV-HST-RSN2                                  
                               TWA-MAP-RSON2                                    
              MOVE 'Y'      TO TWA-SV-HST-RCL2                                  
                               TWA-MAP-RCLM2                                    
           END-IF.                                                              
                                                                                
           IF TWA-SV-HST-BAL05-ORG NOT = 0                                      
              MOVE TWA-SV-HST-BAL05-ORG  TO TWA-SV-HST-BAL05                    
                                                                                
              IF TWA-SV-HST-STTLM-RSN5 = 'CRED'                                 
                 MULTIPLY TWA-SV-HST-BAL05-ORG BY -1                            
                                   GIVING WS-SHORT-AMT                          
                 MOVE WS-SHORT-AMT         TO MBAL05O                           
                 MOVE MBAL05O              TO TWA-MAP-BAL05                     
                 MOVE 'N'                  TO TWA-SV-HST-BAL05-SIGN             
              ELSE                                                              
                 MOVE TWA-SV-HST-BAL05-ORG TO MBAL05O                           
                 MOVE MBAL05O              TO TWA-MAP-BAL05                     
                 MOVE ' '                  TO TWA-SV-HST-BAL05-SIGN             
              END-IF                                                            
                                                                                
              MOVE '65'     TO TWA-SV-HST-RSN5                                  
                               TWA-MAP-RSON3                                    
              MOVE 'Y'      TO TWA-SV-HST-RCL5                                  
                               TWA-MAP-RCLM3                                    
           END-IF.                                                              
       EJECT                                                                    
ET0007*                                                                         
ET0007*---------------------------------------------------------------*         
ET0007*   SET SECURITY QTYS TO BE RECLAIMED WITH REASON CODE '65'     *         
ET0007*                                                               *         
ET0007*      - ASSET QTY IS FOUND IN TS-HST-ASSET-AREA                *         
ET0007*      - CURRENT MAP ENTRY INFO IS IN TWA-SAVE-MAP-ENTRY        *         
ET0007*---------------------------------------------------------------*         
ET0007 3820-UPDATE-ASSET.                                                       
           MOVE SUB TO WS-HST-ITEM.                                             
           PERFORM 7100-READ-HIST-ASSET-TSQ.                                    
                                                                                
           MOVE TS-HST-QTY-ORIG   TO TS-HST-QTY-RECL.                           
           MOVE '65'              TO TS-HST-REASON.                             
           MOVE 'Y'               TO TS-HST-RECL-IND.                           
           IF TS-HST-PSTN-CD = 'S'                                              
              MOVE 'N'  TO TS-HST-QTY-SIGN                                      
           ELSE                                                                 
              MOVE ' '  TO TS-HST-QTY-SIGN                                      
           END-IF.                                                              
                                                                                
           PERFORM 7130-REWRITE-HIST-ASSET-TSQ.                                 
                                                                                
           IF SUB = 1                                                           
              MOVE  SUB  TO TWA-PAGE-NUM                                        
              IF TS-HST-PSTN-CD = 'S'                                           
                 MULTIPLY TS-HST-QTY-RECL BY -1 GIVING WS-SHORT-QTY             
                 MOVE WS-SHORT-QTY     TO MQTYO                                 
              ELSE                                                              
                 MOVE TS-HST-QTY-RECL  TO MQTYO                                 
              END-IF                                                            
              MOVE MQTYI TO TWA-MAP-QTY                                         
              MOVE '65'  TO TWA-MAP-RSON4                                       
              MOVE 'Y'   TO TWA-MAP-RCLM4                                       
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           SUBMIT ROUTINE - CREATE INITIAL TRANSFER            *         
      *---------------------------------------------------------------*         
       4000-SUBMIT-RTN.                                                         
           PERFORM 4010-CHECK-IF-SUBMIT-ALLOWED THRU 4010-EXIT.                 
           IF WS-SUBMIT-ALLOWED                                                 
              IF TWA-MAP-SUB > SPACE                                            
                 IF TWA-MAP-SUB = 'Y'                                           
                    IF WS-UPDATE-OK                                             
ET0005**               PERFORM 4020-CHECK-DUP-INIT-ASSET                        
ET0005**               IF NOT WK-ERROR                                          
                          PERFORM 4030-CREATE-RECLAIM                           
ET0005**               END-IF                                                   
                    ELSE                                                        
                       MOVE ATT-UNPROT-BRT TO MSUBA                             
                       IF NOT WK-ERROR                                          
                          SET WK-ERROR TO TRUE                                  
                          MOVE -1 TO MSUBL                                      
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
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              IF TWA-MAP-SUB > SPACE                                            
                 MOVE -1 TO MSUBL                                               
                 MOVE ATT-UNPROT-BRT TO MSUBA                                   
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'SUBMIT NOT ALLOWED - "REASON CODE" OR "RECLAIM        
      -                  '" FIELD ENTRY MISSING'                                
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
           IF TWA-SV-HST-RCL1 = 'Y'                                             
              SET WS-SUBMIT-ALLOWED TO TRUE                                     
              GO TO 4010-EXIT                                                   
           ELSE                                                                 
           IF TWA-SV-HST-RCL2 = 'Y'                                             
              SET WS-SUBMIT-ALLOWED TO TRUE                                     
              GO TO 4010-EXIT                                                   
           ELSE                                                                 
           IF TWA-SV-HST-RCL5 = 'Y'                                             
              SET WS-SUBMIT-ALLOWED TO TRUE                                     
              GO TO 4010-EXIT.                                                  
                                                                                
           MOVE +1 TO WS-HST-ITEM.                                              
           PERFORM  UNTIL WS-HST-ITEM > TWA-MAX-PAGE-HST                        
              PERFORM 7100-READ-HIST-ASSET-TSQ                                  
              IF TS-HST-RECL-IND = 'Y'                                          
                 SET WS-SUBMIT-ALLOWED TO TRUE                                  
                 MOVE TWA-MAX-PAGE-HST TO WS-HST-ITEM                           
              END-IF                                                            
              ADD +1 TO WS-HST-ITEM                                             
           END-PERFORM.                                                         
       4010-EXIT.                                           EXIT.               
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *   MAKE SURE THAT NO DUPLICATE INITIAL ASSET EXIST.            *         
      *   THE OVERNIGH BATCH PRODUCES 'RCR' RECORDS IN INIT ASSET     *         
      *   TABLE.  'RCR' RECORD CONTAINS SAME RECORD KEY AS 'RCL'      *         
      *   RECORD.  THEREFORE IF THE PROGRAM ATTEMPTS TO INSERT 'RCL'  *         
      *   RECORD, WHEN 'RCR' RECORD EXISTS, DB2 DUPLICATE KEY ERROR   *         
      *   OCCURS.                                                     *         
ET0005*   THIS ROUTINE IS NO LONGER EXECUTED - WE NOW ALLOW USER TO   *         
ET0005*   CREATE DUPLICATE RECLAIMS IN INITIAL TABLES.                *         
      *---------------------------------------------------------------*         
       4020-CHECK-DUP-INIT-ASSET.                                               
           MOVE ACAT-ADP-BROKER  TO ACAT12-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR TO WS-PASS-BR.                                       
           MOVE TWA-MAP-AC TO WS-PASS-ACCT.                                     
      **   MOVE WS-PASS-ACCT-DLV TO ACAT12-PASS-ACCT-DLV.                       
           MOVE TWA-DLVR-ACCT    TO ACAT12-PASS-ACCT-DLV.                       
           MOVE TWA-RCV          TO ACAT12-PASS-CON-BRKR.                       
           MOVE TWA-RCV-ACCT     TO ACAT12-PASS-CON-ACCT.                       
ET0001     SET ACAT12-OPN-ASTINI2 TO TRUE.                                      
ET0001     PERFORM 7600-LINK-TO-ACAT12DB.                                       
ET0001     IF ACAT12-ERROR                                                      
ET0001        MOVE -1 TO MNEXTL                                                 
ET0001        SET WK-ERROR TO TRUE                                              
LRM010        MOVE                                                              
LRM010          'DB2 OPEN CURSOR #2 INITIAL ASSET TBL - CALL HELP DESK'         
ET0001          TO  WK-DB2-ERROR                                                
ET0001        MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
ET0001        MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
ET0001        PERFORM 9000-ERROR-RTN.                                           
                                                                                
                                                                                
           SET ACAT12-FND-ASTINI TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-FOUND                                                      
              MOVE -1 TO MSUBL                                                  
              MOVE ATT-UNPROT-BRT TO MSUBA                                      
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
ET0001           MOVE ACAT12-AST-TRNFR-TYP TO WS-TRNFR-TYPE-MSG                 
ET0001           MOVE DUPE-ASSET-MSG TO SYSTEM-MSG                              
              END-IF                                                            
           ELSE                                                                 
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MNEXTL                                                 
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE                                                              
LRM010          'DB2 FIND ERROR ON INITIAL ASSET TBL - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
                                                                                
ET0001     SET ACAT12-CLO-ASTINI2 TO TRUE.                                      
ET0001     PERFORM 7600-LINK-TO-ACAT12DB.                                       
ET0001     IF ACAT12-ERROR                                                      
ET0001        MOVE -1 TO MNEXTL                                                 
ET0001        SET WK-ERROR TO TRUE                                              
LRM010        MOVE                                                              
LRM010          'DB2 CLOSE CURSOR #2 INITIAL ASSET TBL - CALL HELP DESK'        
ET0001          TO  WK-DB2-ERROR                                                
ET0001        MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
ET0001        MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
ET0001        PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          CREATE INITIAL TRANSFER FOR A RECLAIM                *         
      *---------------------------------------------------------------*         
       4030-CREATE-RECLAIM.                                                     
           MOVE ACAT-ADP-BROKER  TO ACAT12-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR TO WS-PASS-BR.                                       
           MOVE TWA-MAP-AC TO WS-PASS-ACCT.                                     
      **   MOVE WS-PASS-ACCT-DLV TO ACAT12-PASS-ACCT-DLV.                       
           MOVE TWA-DLVR-ACCT    TO ACAT12-PASS-ACCT-DLV.                       
           MOVE TWA-RCV          TO ACAT12-PASS-CON-BRKR.                       
           MOVE TWA-RCV-ACCT     TO ACAT12-PASS-CON-ACCT.                       
           MOVE EIBTRMID         TO ACAT12-PASS-TERMID.                         
           MOVE TWA-ACCT-CMNTS   TO ACAT12-PASS-CMNTS.                          
           MOVE TWA-ACAT         TO ACAT12-PASS-ACAT.                           
           MOVE ACAT-ADP-BROKER  TO ACAT12-PASS-SBMT-CLT.                       
ET0005     MOVE SPACE            TO WS-ADP-CONTROL-NBR.                         
ET0005     MOVE 'XX'             TO WS-CONTROL-XX.                              
ET0005     MOVE ZERO             TO WS-CONTROL-SEQ.                             
LRM009     MOVE ACAT-SIGN-ON-ID      TO ACAT12-SNON-ID                          
LRM009     MOVE ACAT-CICS-NETNAME    TO ACAT12-NETNAME                          
LRM009     MOVE ACAT-CICS-USER-ID    TO ACAT12-USER-ID                          
LRM009     MOVE ACAT-CICS-USER-NAME  TO ACAT12-USER-NAME                        
ET0005                                                                          
ET0005     PERFORM UNTIL ACAT12-NORMAL OR WS-CONTROL-SEQ = 999                  
ET0005        ADD 1 TO WS-CONTROL-SEQ                                           
ET0005        MOVE WS-ADP-CONTROL-NBR TO ACAT12-PASS-ADP-CONTROL                
ET0005        PERFORM 4031-BUILD-TRANS-RFRN-ID                                  
ET0005        MOVE SPACE              TO ACAT12-PASS-TRANS-RFRN-ID              
ET0005        MOVE WS-RFRN-DLVR-ACCT  TO ACAT12-PASS-TRANS-RFRN-ID              
ET0005        SET ACAT12-INS-TFRINI TO TRUE                                     
ET0005        PERFORM 7600-LINK-TO-ACAT12DB                                     
ET0005        IF ACAT12-NORMAL OR ACAT12-FOUND                                  
ET0005           CONTINUE                                                       
ET0005        ELSE                                                              
ET0005           MOVE -1 TO MBRL                                                
ET0005           SET WK-ERROR TO TRUE                                           
LRM010           MOVE                                                           
LRM010            'DB2 INITIAL TRANSFER INSERT ERROR - CALL HELP DESK'          
ET0005             TO  WK-DB2-ERROR                                             
ET0005           MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                       
ET0005           MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                           
ET0005           PERFORM 9000-ERROR-RTN                                         
ET0005        END-IF                                                            
ET0005     END-PERFORM.                                                         
ET0005     IF ACAT12-NORMAL                                                     
ET0005        PERFORM 4040-CREATE-INIT-ASSET                                    
ET0005        MOVE 'Y' TO ACAT12-PASS-RESUB-IND                                 
ET0005        PERFORM 4200-UPDATE-RJCT-RESUB-IND                                
ET0005        PERFORM 4500-CLEAR-SCREEN-N-STORAGE                               
ET0005        PERFORM 4510-CLEAR-SEARCH-ENGINE                                  
ET0005        SET WK-MSG-ON TO TRUE                                             
ET0005        MOVE -1 TO MBRL                                                   
ET0005        MOVE 'RECLAIM COMPLETED SUCCESSFULLY - ENTER BRANCH'              
ET0005          TO  SYSTEM-MSG                                                  
ET0005     ELSE                                                                 
ET0005        SET WK-MSG-ON TO TRUE                                             
ET0005        MOVE -1 TO MBRL                                                   
ET0005        MOVE 'REACHED MAX RCL - TRY AGAIN LATER, PF10 TO EXIT'            
ET0005          TO  SYSTEM-MSG                                                  
ET0005     END-IF.                                                              
ET0005                                                                          
ET0005**   SET ACAT12-CNT-TFRINI TO TRUE.                                       
ET0005**   PERFORM 7600-LINK-TO-ACAT12DB.                                       
ET0005**   IF ACAT12-FOUND                                                      
ET0005**      MOVE -1 TO MSUBL                                                  
ET0005**      SET WK-ERROR TO TRUE                                              
ET0005**      MOVE 'RECLAIM FAILED - RECLAIM ALREADY EXISTS'                    
ET0005**        TO  SYSTEM-MSG                                                  
ET0005**      PERFORM 9000-ERROR-RTN.                                           
ET0005**                                                                        
ET0005**   SET ACAT12-INS-TFRINI TO TRUE.                                       
ET0005**   PERFORM 7600-LINK-TO-ACAT12DB.                                       
ET0005**   IF ACAT12-NORMAL                                                     
ET0005**      PERFORM 4040-CREATE-INIT-ASSET                                    
ET0005**      MOVE 'Y' TO ACAT12-PASS-RESUB-IND                                 
ET0005**      PERFORM 4200-UPDATE-RJCT-RESUB-IND                                
ET0005**      PERFORM 4500-CLEAR-SCREEN-N-STORAGE                               
ET0005**      PERFORM 4510-CLEAR-SEARCH-ENGINE                                  
ET0005**      SET WK-MSG-ON TO TRUE                                             
ET0005**      MOVE -1 TO MBRL                                                   
ET0005**      MOVE 'RECLAIM COMPLETED SUCCESSFULLY - ENTER BRANCH'              
ET0005**        TO  SYSTEM-MSG                                                  
ET0005**   ELSE                                                                 
ET0005**   IF ACAT12-FOUND                                                      
ET0005**      MOVE -1 TO MSUBL                                                  
ET0005**      MOVE ATT-UNPROT TO MSUBA                                          
ET0005**      IF NOT WK-ERROR                                                   
ET0005**         SET WK-ERROR TO TRUE                                           
ET0005**         MOVE 'RECLAIM FAILED - DUPLICATE RECLAIM FOUND'                
ET0005**           TO  SYSTEM-MSG                                               
ET0005**      END-IF                                                            
ET0005**   ELSE                                                                 
ET0005**      MOVE -1 TO MBRL                                                   
ET0005**      SET WK-ERROR TO TRUE                                              
ET0005**      MOVE 'DB2 INITIAL TRANSFER INSERT ERROR - CALL HELP DESK'         
ET0005**        TO  WK-DB2-ERROR                                                
ET0005**      MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
ET0005**      MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
ET0005**      PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0005*                                                                         
ET0005*---------------------------------------------------------------*         
ET0005* TRANS-RFRN-ID-CD = DLVR-ACCT-NBR + XXNNN WHERE NNN IS A SEQ # *         
ET0005*---------------------------------------------------------------*         
ET0005 4031-BUILD-TRANS-RFRN-ID.                                                
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
           INITIALIZE  ACAT12-ASSET.                                            
           IF TWA-SV-HST-RCL1 = 'Y'                                             
              MOVE TWA-SV-HST-BAL01       TO ACAT12-PASS-AMT                    
              MOVE 0                      TO ACAT12-PASS-QTY                    
              MOVE TWA-SV-HST-RSN1        TO ACAT12-PASS-REASON                 
              MOVE TWA-SV-HST-CMNTS1      TO ACAT12-PASS-CMNTS                  
              MOVE TWA-SV-HST-SEQ-NBR1    TO ACAT12-PASS-SEQ-NBR                
ET0001        MOVE 'C'                    TO ACAT12-PASS-CSH-MGN-SHT            
ET0001        IF TWA-SV-HST-BAL01-SIGN = 'N'                                    
ET0001           MOVE 'CRED' TO ACAT12-PASS-STTLM-RSN-CD                        
ET0001           MOVE 'CREDIT CASH BALANCE' TO ACAT12-PASS-ASSET-DESC           
ET0001        ELSE                                                              
ET0001           MOVE 'DEB ' TO ACAT12-PASS-STTLM-RSN-CD                        
ET0001           MOVE 'DEBIT CASH BALANCE' TO ACAT12-PASS-ASSET-DESC            
ET0001        END-IF                                                            
ET0001        IF TWA-SV-HST-BAL01-ORG = 0                                       
ET0001            SET ACAT12-INS-ASTINI-CASH TO TRUE                            
ET0001        ELSE                                                              
ET0001            SET ACAT12-INS-ASTINI TO TRUE                                 
ET0001        END-IF                                                            
ET0001**      SET ACAT12-INS-ASTINI TO TRUE                                     
              PERFORM 7600-LINK-TO-ACAT12DB                                     
              IF ACAT12-NORMAL                                                  
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE -1 TO MBRL                                                
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'RECALAIM FAILED - INIT ASSET INSERT ERROR'               
                   TO  WK-DB2-ERROR                                             
                 MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                       
                 MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                           
                 PERFORM 9000-ERROR-RTN                                         
              END-IF.                                                           
           IF TWA-SV-HST-RCL2 = 'Y'                                             
              MOVE TWA-SV-HST-BAL02       TO ACAT12-PASS-AMT                    
              MOVE 0                      TO ACAT12-PASS-QTY                    
              MOVE TWA-SV-HST-RSN2        TO ACAT12-PASS-REASON                 
              MOVE TWA-SV-HST-CMNTS2      TO ACAT12-PASS-CMNTS                  
              MOVE TWA-SV-HST-SEQ-NBR2    TO ACAT12-PASS-SEQ-NBR                
ET0001        MOVE 'M'                    TO ACAT12-PASS-CSH-MGN-SHT            
ET0001        IF TWA-SV-HST-BAL02-SIGN = 'N'                                    
ET0001           MOVE 'CRED' TO ACAT12-PASS-STTLM-RSN-CD                        
ET0001           MOVE 'CREDIT CASH BALANCE' TO ACAT12-PASS-ASSET-DESC           
ET0001        ELSE                                                              
ET0001           MOVE 'DEB ' TO ACAT12-PASS-STTLM-RSN-CD                        
ET0001           MOVE 'DEBIT CASH BALANCE' TO ACAT12-PASS-ASSET-DESC            
ET0001        END-IF                                                            
ET0001        IF TWA-SV-HST-BAL02-ORG = 0                                       
ET0001            SET ACAT12-INS-ASTINI-CASH TO TRUE                            
ET0001        ELSE                                                              
ET0001            SET ACAT12-INS-ASTINI TO TRUE                                 
ET0001        END-IF                                                            
ET0001**      SET ACAT12-INS-ASTINI TO TRUE                                     
              PERFORM 7600-LINK-TO-ACAT12DB                                     
              IF ACAT12-NORMAL                                                  
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE -1 TO MBRL                                                
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'RECLAIM FAILED - INIT ASSET INSERT ERROR'                
                   TO  WK-DB2-ERROR                                             
                 MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                       
                 MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                           
                 PERFORM 9000-ERROR-RTN                                         
              END-IF.                                                           
           IF TWA-SV-HST-RCL5 = 'Y'                                             
              MOVE TWA-SV-HST-BAL05       TO ACAT12-PASS-AMT                    
              MOVE 0                      TO ACAT12-PASS-QTY                    
              MOVE TWA-SV-HST-RSN5        TO ACAT12-PASS-REASON                 
              MOVE TWA-SV-HST-CMNTS5      TO ACAT12-PASS-CMNTS                  
              MOVE TWA-SV-HST-SEQ-NBR5    TO ACAT12-PASS-SEQ-NBR                
              SET ACAT12-INS-ASTINI TO TRUE                                     
ET0001        MOVE 'S'                    TO ACAT12-PASS-CSH-MGN-SHT            
ET0001        IF TWA-SV-HST-BAL05-SIGN = 'N'                                    
ET0001           MOVE 'CRED' TO ACAT12-PASS-STTLM-RSN-CD                        
ET0001           MOVE 'CREDIT CASH BALANCE' TO ACAT12-PASS-ASSET-DESC           
ET0001        ELSE                                                              
ET0001           MOVE 'DEB ' TO ACAT12-PASS-STTLM-RSN-CD                        
ET0001           MOVE 'DEBIT CASH BALANCE' TO ACAT12-PASS-ASSET-DESC            
ET0001        END-IF                                                            
ET0001        IF TWA-SV-HST-BAL05-ORG = 0                                       
ET0001            SET ACAT12-INS-ASTINI-CASH TO TRUE                            
ET0001        ELSE                                                              
ET0001            SET ACAT12-INS-ASTINI TO TRUE                                 
ET0001        END-IF                                                            
ET0001**      SET ACAT12-INS-ASTINI TO TRUE                                     
              PERFORM 7600-LINK-TO-ACAT12DB                                     
              IF ACAT12-NORMAL                                                  
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE -1 TO MBRL                                                
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'RECLAIM FAILED - INIT ASSET INSERT ERROR'                
                   TO  WK-DB2-ERROR                                             
                 MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                       
                 MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                           
                 PERFORM 9000-ERROR-RTN                                         
              END-IF.                                                           
                                                                                
           MOVE +1 TO WS-HST-ITEM                                               
           PERFORM UNTIL WS-HST-ITEM > TWA-MAX-PAGE-HST                         
              PERFORM 7100-READ-HIST-ASSET-TSQ                                  
              IF NOT WK-TS-READ-ERROR                                   15960000
                 IF TS-HST-RECL-IND = 'Y'                                       
                    PERFORM 4050-GET-SECURITY-AMT                               
                    MOVE WS-SECURITY-AMT TO ACAT12-PASS-AMT                     
                    MOVE TS-HST-QTY-RECL TO ACAT12-PASS-QTY                     
                    MOVE TS-HST-CMNTS    TO ACAT12-PASS-CMNTS                   
                    MOVE TS-HST-REASON   TO ACAT12-PASS-REASON                  
                    MOVE TS-HST-SEQ-NBR  TO ACAT12-PASS-SEQ-NBR                 
                    MOVE TS-HST-STTLM-RSN TO ACAT12-PASS-STTLM-RSN-CD           
                    MOVE TS-HST-DESC      TO ACAT12-PASS-ASSET-DESC             
ET0006              IF TS-HST-ADD-ASSET = 'Y'                                   
ET0006                 MOVE 'Y'              TO ACAT12-PASS-ADD-ASSET           
ET0006                 MOVE TS-HST-SECURITY  TO ACAT12-PASS-SECURITY            
ET0006                 MOVE TS-HST-ADP-NBR   TO ACAT12-PASS-ADP-NBR             
ET0006                 MOVE TS-HST-CTGRY     TO ACAT12-PASS-CATEGORY            
ET0006                 MOVE TS-HST-TYPE      TO ACAT12-PASS-CSH-MGN-SHT         
ET0006                 MOVE TS-HST-STTL-LOC  TO ACAT12-PASS-STTL-LOC            
ET0006                 MOVE TS-HST-PSTN-CD   TO ACAT12-PASS-PSTN-CD             
ET0006                 MOVE TS-HST-ASSET-AMT TO ACAT12-PASS-AMT                 
ET0006              END-IF                                                      
                    SET ACAT12-INS-ASTINI TO TRUE                               
                    PERFORM 7600-LINK-TO-ACAT12DB                               
                    IF ACAT12-NORMAL                                            
                       CONTINUE                                                 
                    ELSE                                                        
                       MOVE -1 TO MBRL                                          
                       SET WK-ERROR TO TRUE                                     
                       MOVE 'RECALAIM FAILED - INIT ASSET INSERT ERROR'         
                         TO  WK-DB2-ERROR                                       
                       MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                 
                       MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                     
                       PERFORM 9000-ERROR-RTN                                   
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
              ADD +1 TO WS-HST-ITEM                                             
           END-PERFORM.                                                         
      *                                                                         
       4050-GET-SECURITY-AMT.                                                   
           MOVE 0 TO WS-SECURITY-AMT.                                           
           IF TS-HST-QTY-ORIG > 0                                               
              COMPUTE WS-SECURITY-AMT =                                         
                TS-HST-QTY-RECL * TS-HST-AMT-ORIG / TS-HST-QTY-ORIG.            
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *     DELETE ROUTINE                                            *         
      *       RECLAIMS ON INITIAL TRANSFER TABLE CAN NOT BE MODIFIED  *         
      *       BUT CAN BE DELETED FROM A TABLE.                        *         
      *---------------------------------------------------------------*         
       4100-DELETE-RTN.                                                         
           IF TWA-MAP-DEL = 'Y'                                                 
              IF WS-UPDATE-OK                                                   
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE SPACE TO TWA-DELETE-CONFIRM                               
                 MOVE ATT-UNPROT-BRT TO MDELA                                   
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE -1 TO MDELL                                            
                    MOVE 'UNAUTHORIZED TO DELETE' TO SYSTEM-MSG                 
                 END-IF                                                         
                 GO TO 4100-EXIT                                                
              END-IF                                                            
           ELSE                                                                 
              MOVE SPACE TO TWA-DELETE-CONFIRM                                  
              MOVE ATT-UNPROT-BRT TO MDELA                                      
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE -1 TO MDELL                                               
                 MOVE 'TYPE "Y" TO DELETE'                                      
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
              GO TO 4100-EXIT                                                   
           END-IF.                                                              
           IF TWA-DELETE-CONFIRM = 'Y'                                          
              MOVE SPACE TO TWA-DELETE-CONFIRM                                  
              MOVE ACAT-ADP-BROKER  TO ACAT12-PASS-DLVR-NBR                     
              MOVE TWA-MAP-BR TO WS-PASS-BR                                     
              MOVE TWA-MAP-AC TO WS-PASS-ACCT                                   
              MOVE TWA-DLVR-ACCT    TO ACAT12-PASS-ACCT-DLV                     
              MOVE TWA-RCV       TO ACAT12-PASS-CON-BRKR                        
              MOVE TWA-RCV-ACCT  TO ACAT12-PASS-CON-ACCT                        
              MOVE TWA-ACAT TO ACAT12-PASS-ACAT                                 
ET0005        MOVE TWA-ADP-CONTROL-NBR TO ACAT12-PASS-ADP-CONTROL               
              MOVE EIBTRMID  TO ACAT12-PASS-TERMID                              
              PERFORM 4110-CHECK-IF-NOT-DELETED                                 
              SET ACAT12-DEL-RECLAIM  TO TRUE                                   
              PERFORM 7600-LINK-TO-ACAT12DB                                     
              IF ACAT12-NORMAL                                                  
                 MOVE SPACE TO ACAT12-PASS-RESUB-IND                            
                 PERFORM 4200-UPDATE-RJCT-RESUB-IND                             
ET0008           IF TWA-SRCH-ALL-RCLS                                           
ET0008              PERFORM 4105-ALL-RCLS-AFTER-DELETION                        
ET0008              IF WS-NO-MORE-TRNFR                                         
ET0008                 CONTINUE                                                 
ET0008              ELSE                                                        
ET0008                 GO TO 4100-EXIT                                          
ET0008              END-IF                                                      
ET0008           END-IF                                                         
                 PERFORM 4500-CLEAR-SCREEN-N-STORAGE                            
                 PERFORM 4510-CLEAR-SEARCH-ENGINE                               
                 MOVE -1 TO MBRL                                                
                 SET WK-MSG-ON TO TRUE                                          
                 MOVE 'DELETION COMPLETED SUCCESSFULY - ENTER BRANCH'           
                   TO  SYSTEM-MSG                                               
              ELSE                                                              
                 MOVE -1 TO MBRL                                                
                 MOVE SPACE TO TWA-DELETE-CONFIRM                               
                 SET WK-ERROR TO TRUE                                           
LRM010           MOVE 'DB2 DELETION ERROR - CALL HELP DESK'                     
                   TO  WK-DB2-ERROR                                             
                 MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                       
                 MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                           
                 PERFORM 9000-ERROR-RTN                                         
              END-IF                                                            
           ELSE                                                                 
              MOVE 'Y' TO TWA-DELETE-CONFIRM                                    
              MOVE -1 TO MDELL                                                  
              SET WK-ERROR  TO TRUE                                             
              MOVE 'PRESS ENTER AGAIN TO CONFIRM A DELETION'                    
                TO  SYSTEM-MSG.                                                 
       4100-EXIT.                                          EXIT.                
       EJECT                                                                    
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*  REFORMAT SCREEN AFTER RECLAIM RECORD IS DELETED IN PF4 MODE  *         
ET0008*   - PAINT A MAP WITH NEXT AVAILABLE RCL RECORD                *         
ET0008*   - IF NEXT RCORD IS NOT AVAILABLE, DISPLAY PREVIOUSE RECORD  *         
ET0008*   - IF NONE IS AVAILABLE, THEN DISPLAY BLANK SCREEN           *         
ET0008*---------------------------------------------------------------*         
ET0008 4105-ALL-RCLS-AFTER-DELETION.                                            
                                                                                
           MOVE ACAT-ADP-BROKER  TO ACAT12-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR TO WS-PASS-BR.                                       
           MOVE TWA-MAP-AC TO WS-PASS-ACCT.                                     
           MOVE ALL '%'    TO WS-PASS-ACCT-MASK.                                
           MOVE WS-PASS-ACCT-DLV TO ACAT12-PASS-ACCT-DLV.                       
           PERFORM 5630-OPEN-INITRN-ALL-RCLS.                                   
                                                                                
           MOVE SPACE TO WS-NEXT-PAGE-FOUND-SW                                  
                         WS-NO-MORE-TRNFR-SW.                                   
           PERFORM UNTIL WS-NEXT-PAGE-FOUND OR WS-NO-MORE-TRNFR                 
              PERFORM 5640-FETCH-INITRN-ALL-RCLS                                
              IF WS-TFR-INIT-FOUND                                              
                 MOVE ACAT12-TFR-DLVR-ACCT   TO WS-NEXT-DLVR-ACCT-KEY           
                 MOVE ACAT12-TFR-RCV-ACCT    TO WS-NEXT-RCV-ACCT-KEY            
                 MOVE ACAT12-TFR-ACAT        TO WS-NEXT-ADP-ACAT-KEY            
                 MOVE TWA-DLVR-ACCT          TO WS-CURR-DLVR-ACCT-KEY           
                 MOVE TWA-RCV-ACCT           TO WS-CURR-RCV-ACCT-KEY            
                 MOVE TWA-ADP-CONTROL-NBR    TO WS-CURR-ADP-ACAT-KEY            
                 IF WS-NEXT-INITRN-KEY > WS-CURR-INITRN-KEY                     
                    SET WS-NEXT-PAGE-FOUND TO TRUE                              
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 5650-CLOSE-INITRN-ALL-RCLS.                                  
                                                                                
           IF WS-NO-MORE-TRNFR                                                  
              PERFORM 4106-ALL-RCLS-AFTER-DEL-CONT                              
           ELSE                                                                 
              PERFORM 3109-TRNF-INIT-TO-TWA                                     
              PERFORM 6710-SETUP-INIT-ASSET                                     
              MOVE TWA-MAP-BR  TO TWA-SAVE-MAP-BR                               
              MOVE TWA-MAP-AC  TO TWA-SAVE-MAP-AC                               
           END-IF.                                                              
        EJECT                                                                   
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*   CONTINUE FROM 4105-ALL-RCLS-AFTER-DELETION TO SRCH          *         
ET0008*   RCLAIM TRANSFER RECORD - SEARCH PREVIOUSE RECORD THIS TIME. *         
ET0008*---------------------------------------------------------------*         
ET0008 4106-ALL-RCLS-AFTER-DEL-CONT.                                            
           PERFORM 5660-OPEN-INITRN-ALL-RCLS-DES.                               
                                                                                
           MOVE SPACE TO WS-PREV-PAGE-FOUND-SW                                  
                         WS-NO-MORE-TRNFR-SW.                                   
           PERFORM UNTIL WS-PREV-PAGE-FOUND OR WS-NO-MORE-TRNFR                 
              PERFORM 5670-FETCH-INITRN-ALL-RCLS-DES                            
              IF WS-TFR-INIT-FOUND                                              
                 MOVE ACAT12-TFR-DLVR-ACCT   TO WS-NEXT-DLVR-ACCT-KEY           
                 MOVE ACAT12-TFR-RCV-ACCT    TO WS-NEXT-RCV-ACCT-KEY            
                 MOVE ACAT12-TFR-ACAT        TO WS-NEXT-ADP-ACAT-KEY            
                 MOVE TWA-DLVR-ACCT          TO WS-CURR-DLVR-ACCT-KEY           
                 MOVE TWA-RCV-ACCT           TO WS-CURR-RCV-ACCT-KEY            
                 MOVE TWA-ADP-CONTROL-NBR    TO WS-CURR-ADP-ACAT-KEY            
                 IF WS-NEXT-INITRN-KEY < WS-CURR-INITRN-KEY                     
                    SET WS-PREV-PAGE-FOUND TO TRUE                              
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 5680-CLOSE-INITRN-ALL-RCLS-DES.                              
                                                                                
           IF WS-NO-MORE-TRNFR                                                  
              CONTINUE                                                          
           ELSE                                                                 
              PERFORM 3109-TRNF-INIT-TO-TWA                                     
              PERFORM 6710-SETUP-INIT-ASSET                                     
              MOVE TWA-MAP-BR  TO TWA-SAVE-MAP-BR                               
              MOVE TWA-MAP-AC  TO TWA-SAVE-MAP-AC                               
           END-IF.                                                              
ET0008 4106-EXIT.   EXIT.                                                       
ET0008 EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *  IS THERE ANY RECLAIM TO BE DELETED IN INIT TRANSFER TABLE?   *         
      *---------------------------------------------------------------*         
       4110-CHECK-IF-NOT-DELETED.                                               
           SET ACAT12-CNT-TFRINI TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-FOUND                                                      
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 DELETION ERROR - CALL HELP DESK'                        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
              SET WK-ERROR TO TRUE                                              
              MOVE 'DELETION FAILED - RECLAIM HAS BEEN ALREADY DELETED'         
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN.                                           
                                                                                
           SET ACAT12-CNT-ASTINI TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-FOUND                                                      
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 DELETION ERROR - CALL HELP DESK'                        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
              SET WK-ERROR TO TRUE                                              
              MOVE 'DELETION FAILED - RECLAIM HAS BEEN ALREADY DELETED'         
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *  WHEN RESUBMITTING THE REJECTED RECLAIM, OR DELETING A NEWLY  *         
      *  CREATED RECLAIM                                              *         
      *   1. CHECK IF ANY REJECTED RECLAIM EXISTS                     *         
      *   2. IF REJECTED RECLAIM FOUND                                *         
      *       - WHEN RESUBMIT                                         *         
      *           SET 'Y' TO ACCT-RJCT-RSBM-IND OF REJECTED RECLAIM   *         
      *       - WHEN DELETE                                           *         
      *           SET ' ' TO ACCT-RJCT-RSBM-IND OF REJECTED RECLAIM   *         
      *---------------------------------------------------------------*         
       4200-UPDATE-RJCT-RESUB-IND.                                              
           MOVE ACAT-ADP-BROKER  TO ACAT12-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR TO WS-PASS-BR.                                       
           MOVE TWA-MAP-AC TO WS-PASS-ACCT.                                     
      **   MOVE WS-PASS-ACCT-DLV TO ACAT12-PASS-ACCT-DLV.                       
           MOVE TWA-DLVR-ACCT TO ACAT12-PASS-ACCT-DLV.                          
           MOVE TWA-RCV       TO ACAT12-PASS-CON-BRKR.                          
           MOVE TWA-RCV-ACCT  TO ACAT12-PASS-CON-ACCT.                          
           MOVE EIBTRMID      TO ACAT12-PASS-TERMID.                            
           SET ACAT12-CNT-REJ-RCLM TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 REJECT RCL COUNT ERROR - CALL HELP DESK'                
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
           IF ACAT12-FOUND                                                      
              SET ACAT12-UPD-RESUB  TO TRUE                                     
              PERFORM 7600-LINK-TO-ACAT12DB                                     
              IF ACAT12-ERROR                                                   
                 MOVE -1 TO MSUBL                                               
                 SET WK-ERROR TO TRUE                                           
LRM010           MOVE                                                           
LRM010         'DB2 ERR ON UPDATE REJECT RESUBMIT IND - CALL HELP DESK'         
                   TO  WK-DB2-ERROR                                             
                 MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                       
                 MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                           
                 PERFORM 9000-ERROR-RTN.                                        
       EJECT                                                                    
       4500-CLEAR-SCREEN-N-STORAGE.                                             
           PERFORM 7110-DELETE-HIST-ASSET-TSQ                                   
           PERFORM 7210-DELETE-INIT-ASSET-TSQ                                   
           PERFORM 2010-CLEAR-SCR.                                              
           MOVE SPACE      TO MBRO                                              
                              MACO.                                             
           MOVE ATT-UNPROT TO MBRA                                              
                              MACA.                                             
           INITIALIZE    TWA-TFR-UPDATE-IND                                     
                         TWA-MAP-AREA                                           
ET0001                   TWA-SAVE-MAP-ACCT-ENTRY                                
                         TWA-SAVE-MAP-ENTRY                                     
                         TWA-SAVE-HIST-BALANCE                                  
                         TWA-SAVE-INIT-BALANCE                                  
                         TWA-SAVE-SCR-KEY.                                      
ET0006                                                                          
ET0006     MOVE SPACE TO TWA-ADD-ASSET-SW.                                      
      *                                                                         
       4510-CLEAR-SEARCH-ENGINE.                                                
           MOVE SPACE TO MMBRO                                                  
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
      *   MAKE SURE THE SAME ASSETS CAN NOT BE RECLAIMED MORE THAN    *         
      *   ONCE BY INSPECTING ACTIVE TRANSFER & ASSET TABLES.          *         
      *   (IF ASSETS ARE FOUND IN ACTIVE ASSET TABLE, THOSE ASSETS    *         
      *    HAVE BEEN ALREADY RECLAIMED.)                              *         
      *---------------------------------------------------------------*         
       5000-CHECK-DUPLICATE-ASSETS.                                             
           MOVE ACAT-ADP-BROKER  TO ACAT12-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR TO WS-PASS-BR.                                       
           MOVE TWA-MAP-AC TO WS-PASS-ACCT.                                     
      **   MOVE WS-PASS-ACCT-DLV TO ACAT12-PASS-ACCT-DLV.                       
           MOVE TWA-DLVR-ACCT    TO ACAT12-PASS-ACCT-DLV.                       
           MOVE TWA-RCV          TO ACAT12-PASS-CON-BRKR.                       
           MOVE TWA-RCV-ACCT     TO ACAT12-PASS-CON-ACCT.                       
ET0001     MOVE TWA-ACAT         TO ACAT12-PASS-ACAT-ASTD-NBR.                  
           MOVE SPACE TO WS-NO-MORE-TRNFR-SW.                                   
           PERFORM 5500-OPEN-TRNFR-CURSOR.                                      
           PERFORM 5100-CHECK-TRANSFER                                          
                   UNTIL WS-NO-MORE-TRNFR.                                      
           PERFORM 5520-CLOSE-TRNFR-CURSOR.                                     
      *                                                                         
       5100-CHECK-TRANSFER.                                                     
           PERFORM 5510-FETCH-TRNFR-CURSOR.                                     
           IF ACAT12-NORMAL                                                     
              MOVE ACAT12-TFR-ACAT TO ACAT12-PASS-ACAT                          
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
                                                                                
           IF ACAT12-AST-STTL-LOC = '40'                                        
              IF ACAT12-AST-CS-MG-SH = 'C'                                      
                 IF TWA-SV-HST-BAL01-ORG > 0                                    
                    MOVE ACAT12-AST-REASON TO TWA-SV-HST-RSN1                   
                    MOVE 'Y' TO TWA-SV-HST-BAL1-RCLMED                          
                 END-IF                                                         
              END-IF                                                            
              IF ACAT12-AST-CS-MG-SH = 'M'                                      
                 IF TWA-SV-HST-BAL02-ORG > 0                                    
                    MOVE ACAT12-AST-REASON TO TWA-SV-HST-RSN2                   
                    MOVE 'Y' TO TWA-SV-HST-BAL2-RCLMED                          
                 END-IF                                                         
              END-IF                                                            
              IF ACAT12-AST-CS-MG-SH = 'S'                                      
                 IF TWA-SV-HST-BAL05-ORG > 0                                    
                    MOVE ACAT12-AST-REASON TO TWA-SV-HST-RSN5                   
                    MOVE 'Y' TO TWA-SV-HST-BAL5-RCLMED                          
                 END-IF                                                         
              END-IF                                                            
              GO TO 5200-EXIT.                                                  
                                                                                
           MOVE +1 TO WS-HST-ITEM.                                              
           PERFORM UNTIL WS-HST-ITEM > TWA-MAX-PAGE-HST                         
              PERFORM 7100-READ-HIST-ASSET-TSQ                                  
              IF NOT WK-TS-READ-ERROR                                   15960000
                 IF TS-HST-SECURITY = ACAT12-AST-SEC                            
                    MOVE ACAT12-AST-REASON TO TS-HST-REASON                     
                    MOVE 'Y' TO TS-HST-RCLMED                                   
                    PERFORM 7130-REWRITE-HIST-ASSET-TSQ                         
                    MOVE  TWA-MAX-PAGE-HST TO WS-HST-ITEM                       
                 END-IF                                                         
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
           SET ACAT12-OPN-TRANSFER TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'OPEN TRNSFER ERROR - CALL HELP DESK'                        
LRM010                  TO WK-DB2-ERROR                                         
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
       5510-FETCH-TRNFR-CURSOR.                                                 
           SET ACAT12-FET-TRANSFER TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-NOT-FOUND                                                  
              SET WS-NO-MORE-TRNFR TO TRUE                                      
           ELSE                                                                 
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'FETCH TRNSFER ERROR - CALL HELP DESK'                       
LRM010                    TO WK-DB2-ERROR                                       
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
       5520-CLOSE-TRNFR-CURSOR.                                                 
           SET ACAT12-CLO-TRANSFER TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'CLOSE TRNSFER ERROR - CALL HELP DESK'                       
LRM010                    TO WK-DB2-ERROR                                       
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          ACTIVE ASSET CURSOR AREA                             *         
      *---------------------------------------------------------------*         
       5600-OPEN-ASSET-CURSOR.                                                  
           SET ACAT12-OPN-ASSET TO TRUE.                                        
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'OPEN ASSET TBL ERROR - CALL HELP DESK'                      
LRM010                         TO WK-DB2-ERROR                                  
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
       5610-FETCH-ASSET-CURSOR.                                                 
           SET ACAT12-FET-ASSET TO TRUE.                                        
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-NOT-FOUND                                                  
              SET WS-NO-MORE-ASSET TO TRUE                                      
           ELSE                                                                 
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'FETCH ASSET TBL ERROR - CALL HELP DESK'                     
LRM010                         TO WK-DB2-ERROR                                  
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
       5620-CLOSE-ASSET-CURSOR.                                                 
           SET ACAT12-CLO-ASSET TO TRUE.                                        
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'CLOSE ASSET TBL ERROR - CALL HELP DESK'                     
LRM010                     TO WK-DB2-ERROR                                      
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*      INITIAL TRANSFER CURSOR AREA FOR ALL ACCOUNT RECLAIMS    *         
ET0008*---------------------------------------------------------------*         
ET0008 5630-OPEN-INITRN-ALL-RCLS.                                               
           SET ACAT12-OPN-INITRN-RCL TO TRUE.                                   
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
                                                                                
           IF ACAT12-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE 'DB2 OPEN ERROR ON INITRN_CSR TABLE - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
ET0008 5640-FETCH-INITRN-ALL-RCLS.                                              
           MOVE SPACE TO WS-TFR-INIT-FOUND-SW                                   
                         WS-NO-MORE-TRNFR-SW.                                   
                                                                                
           SET ACAT12-FET-INITRN-RCL TO TRUE.                                   
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
                                                                                
           IF ACAT12-NORMAL                                                     
              SET WS-TFR-INIT-FOUND TO TRUE                                     
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              SET WS-NO-MORE-TRNFR TO TRUE                                      
           ELSE                                                                 
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE                                                              
LRM010          'DB2 FETCH ERROR ON INITRN_CSR TABLE - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
ET0008 5650-CLOSE-INITRN-ALL-RCLS.                                              
           SET ACAT12-CLO-INITRN-RCL TO TRUE.                                   
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE                                                              
LRM010          'DB2 CLOSE ERROR ON INITRN_CSR TABLE - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*   INIT TRANSFER CURSOR AREA FOR ALL ACCT RECLAIMS IN DESCEND  *         
ET0008*---------------------------------------------------------------*         
ET0008 5660-OPEN-INITRN-ALL-RCLS-DES.                                           
           SET ACAT12-OPN-INITRN-RCL-D TO TRUE.                                 
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
                                                                                
           IF ACAT12-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1 TO MBRL                                                   
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE                                                              
LRM010          'DB2 OPEN ERROR ON INITRN_CSR_D TABLE - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
ET0008 5670-FETCH-INITRN-ALL-RCLS-DES.                                          
           MOVE SPACE TO WS-TFR-INIT-FOUND-SW                                   
                         WS-NO-MORE-TRNFR-SW.                                   
                                                                                
           SET ACAT12-FET-INITRN-RCL-D TO TRUE.                                 
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
                                                                                
           IF ACAT12-NORMAL                                                     
              SET WS-TFR-INIT-FOUND TO TRUE                                     
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              SET WS-NO-MORE-TRNFR TO TRUE                                      
           ELSE                                                                 
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE                                                              
LRM010          'DB2 FETCH ERROR ON INITRN_CSR_D TABLE - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
ET0008 5680-CLOSE-INITRN-ALL-RCLS-DES.                                          
           SET ACAT12-CLO-INITRN-RCL-D TO TRUE.                                 
           PERFORM 7600-LINK-TO-ACAT12DB.                                       
           IF ACAT12-ERROR                                                      
              MOVE -1 TO MSUBL                                                  
              SET WK-ERROR TO TRUE                                              
LRM010        MOVE                                                              
LRM010          'DB2 CLOSE ERROR ON INITRN_CSR_D TABLE - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE  ACAT12-SQLCODE   TO WK-ERR-SQLCODE                          
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*      PF4: GET ALL NEWLY ENTERED RECLAIMS FROM INIT TRNFR      *         
ET0008*---------------------------------------------------------------*         
ET0008 5800-SRCH-ALL-NEW-RCLS.                                                  
           PERFORM 2010-CLEAR-SCR.                                              
                                                                                
           MOVE SPACE TO WS-TFR-INIT-FOUND-SW.                                  
                                                                                
           PERFORM 5630-OPEN-INITRN-ALL-RCLS.                                   
           IF ACAT12-NORMAL                                                     
              SET TWA-SRCH-ALL-RCLS TO TRUE                                     
              SET TWA-TFR-UPDATE    TO TRUE                                     
           END-IF.                                                              
                                                                                
           PERFORM 5640-FETCH-INITRN-ALL-RCLS.                                  
           IF ACAT12-NORMAL                                                     
              SET WS-TFR-INIT-FOUND TO TRUE                                     
              PERFORM 3109-TRNF-INIT-TO-TWA                                     
              PERFORM 7210-DELETE-INIT-ASSET-TSQ                                
              PERFORM 3110-OPEN-ASSET-INIT                                      
              IF WS-ASSET-INIT-FOUND                                            
                 INITIALIZE TWA-SAVE-INIT-BALANCE                               
                            TS-INI-ASSET-AREA                                   
                 MOVE SPACE TO WS-NO-MORE-DATA-SW                               
                 PERFORM 3600-SAVE-ASSET-INIT-IN-TS THRU 3600-EXIT              
                     UNTIL WS-NO-MORE-DATA                                      
              END-IF                                                            
              PERFORM 3130-CLOSE-ASSET-INIT                                     
              PERFORM 2200-SETUP-NEW THRU 2200-EXIT                             
              MOVE '1'          TO TWA-FIRST-ENTER-RTN                          
              MOVE TWA-MAP-BR   TO TWA-SAVE-MAP-BR                              
              MOVE TWA-MAP-AC   TO TWA-SAVE-MAP-AC                              
              PERFORM 1000-ENTER-KEY                                            
           ELSE                                                                 
           IF ACAT12-NOT-FOUND                                                  
              MOVE SPACE TO TWA-SRCH-ALL-RCLS-SW                                
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'NEW RCLAIMS NOT FOUND'                                      
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *         PA1: NEXT PAGE RTN                                    *         
      *---------------------------------------------------------------*         
       6000-NEXT-PAGE.                                                          
           IF TWA-TFR-NEW OR TWA-TFR-INQUIRY                                    
              IF TWA-MAX-PAGE-HST = 0                                           
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE                                                        
                    'BOTTOM PAGE ASSET DATA' TO SYSTEM-MSG                      
                 END-IF                                                         
              ELSE                                                              
ET0006**      IF TWA-PAGE-NUM = TWA-MAX-PAGE-HST                                
ET0006        IF TWA-PAGE-NUM  >=  TWA-MAX-PAGE-HST                             
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'BOTTOM PAGE ASSET DATA' TO SYSTEM-MSG                 
                 END-IF                                                         
              ELSE                                                              
                 ADD +1 TO TWA-PAGE-NUM                                         
                 MOVE TWA-PAGE-NUM TO WS-HST-ITEM                               
                 PERFORM 7100-READ-HIST-ASSET-TSQ                               
                 PERFORM 6200-SETUP-ASSET-MAP-AREA                              
              END-IF.                                                           
           IF TWA-TFR-UPDATE                                                    
              IF TWA-MAX-PAGE-INI = 0                                           
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE                                                        
                    'BOTTOM PAGE' TO SYSTEM-MSG                                 
                 END-IF                                                         
              ELSE                                                              
              IF TWA-PAGE-NUM = TWA-MAX-PAGE-INI                                
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'BOTTOM PAGE' TO SYSTEM-MSG                            
                 END-IF                                                         
              ELSE                                                              
                 ADD +1 TO TWA-PAGE-NUM                                         
                 MOVE TWA-PAGE-NUM TO WS-INI-ITEM                               
                 PERFORM 7200-READ-INIT-ASSET-TSQ                               
                 PERFORM 6200-SETUP-ASSET-MAP-AREA                              
              END-IF.                                                           
           IF TWA-TFR-UPDATE-IND = SPACE OR LOW-VALUE                           
              SET WK-ERROR TO TRUE                                              
              MOVE 'PA1 KEY CURRENTLY DISABLED'                                 
                TO  SYSTEM-MSG.                                                 
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
      *         PA2: PREV PAGE RTN                                    *         
      *---------------------------------------------------------------*         
       6100-PREV-PAGE.                                                          
           IF TWA-TFR-UPDATE-IND = SPACE OR LOW-VALUE                           
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'TOP PAGE ASSET DATA'                                     
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           ELSE                                                                 
ET0001***  IF TWA-PAGE-NUM = +1                                                 
ET0001     IF TWA-PAGE-NUM = +1 OR 0                                            
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'TOP PAGE ASSET DATA' TO SYSTEM-MSG                       
              END-IF                                                            
           ELSE                                                                 
           IF TWA-TFR-NEW OR TWA-TFR-INQUIRY                                    
              COMPUTE TWA-PAGE-NUM = TWA-PAGE-NUM - 1                           
              MOVE TWA-PAGE-NUM TO WS-HST-ITEM                                  
              PERFORM 7100-READ-HIST-ASSET-TSQ                                  
              PERFORM 6200-SETUP-ASSET-MAP-AREA                                 
           ELSE                                                                 
           IF TWA-TFR-UPDATE                                                    
              COMPUTE TWA-PAGE-NUM = TWA-PAGE-NUM - 1                           
              MOVE TWA-PAGE-NUM TO WS-INI-ITEM                                  
              PERFORM 7200-READ-INIT-ASSET-TSQ                                  
              PERFORM 6200-SETUP-ASSET-MAP-AREA                                 
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
      *       RESET MAP AREA FOR THE SCROLLING ASSET PAGE             *         
      *---------------------------------------------------------------*         
       6200-SETUP-ASSET-MAP-AREA.                                               
ET0006     IF TWA-TFR-NEW AND (TS-HST-ADD-ASSET = 'Y')                          
ET0006        SET TWA-ADD-ASSET  TO TRUE                                        
ET0006        MOVE ATT-UNPROT    TO MSECRA                                      
ET0006                              MCATGRA                                     
ET0006                              MSLOCA                                      
ET0006                              MTYPEA                                      
ET0006                              MAMTA                                       
ET0006        MOVE ATT-ASKIP     TO AMTDESCA                                    
ET0006     ELSE                                                                 
ET0006        MOVE SPACE         TO TWA-ADD-ASSET-SW                            
ET0006        MOVE ATT-ASKIP     TO MSECRA                                      
ET0006                              MCATGRA                                     
ET0006                              MSLOCA                                      
ET0006                              MTYPEA                                      
ET0006        MOVE ATT-ASKIP-DRK TO MAMTA                                       
ET0006                              AMTDESCA                                    
ET0006     END-IF.                                                              
                                                                                
           MOVE LOW-VALUE TO MSECRO                                             
                             MCATGRO                                            
                             MSLOCO                                             
                             MTYPEO                                             
                             MDESC1O                                            
                             MDESC2O                                            
                             MQTYI                                              
                             REASON4O                                           
                             RECLM4O                                            
ET0006                       MAMTI                                              
                             MNEXTO                                             
                             MSUBO                                              
                             MDELO.                                             
           IF TWA-TFR-NEW OR TWA-TFR-INQUIRY                                    
              MOVE TS-HST-SECURITY     TO MSECRO  TWA-SECUR                     
              MOVE TS-HST-CTGRY        TO MCATGRO TWA-CATGRY                    
              MOVE TS-HST-STTL-LOC     TO MSLOCO  TWA-SLOC                      
              MOVE TS-HST-TYPE         TO MTYPEO  TWA-SEC-TYPE                  
              MOVE TS-HST-DESC(1:60)   TO MDESC1O                               
              MOVE TS-HST-DESC(61:60)  TO MDESC2O                               
              MOVE TS-HST-DESC         TO TWA-DESCRIPT                          
              IF TS-HST-QTY-RECL = 0                                            
                 IF TS-HST-PSTN-CD = 'S'                                        
                    MULTIPLY TS-HST-QTY-ORIG BY -1 GIVING WS-SHORT-QTY          
                    MOVE WS-SHORT-QTY     TO MQTYO                              
                 ELSE                                                           
                    MOVE TS-HST-QTY-ORIG  TO MQTYO                              
                 END-IF                                                         
              ELSE                                                              
                 IF TS-HST-PSTN-CD = 'S'                                        
                    MULTIPLY TS-HST-QTY-RECL BY -1 GIVING WS-SHORT-QTY          
                    MOVE WS-SHORT-QTY     TO MQTYO                              
                 ELSE                                                           
                    MOVE TS-HST-QTY-RECL  TO MQTYO                              
                 END-IF                                                         
              END-IF                                                            
              MOVE MQTYI TO TWA-MAP-QTY                                         
              MOVE TS-HST-REASON TO REASON4O TWA-MAP-RSON4                      
              IF TWA-TFR-INQUIRY                                                
                 MOVE TS-HST-RCLMED TO RECLM4O  TWA-MAP-RCLM4                   
                 MOVE ATT-ASKIP     TO MQTYA REASON4A RECLM4A                   
              ELSE                                                              
                 IF TS-HST-RCLMED = 'Y'                                         
                    MOVE TS-HST-RCLMED TO RECLM4O  TWA-MAP-RCLM4                
                    MOVE ATT-ASKIP     TO MQTYA REASON4A RECLM4A                
                 ELSE                                                           
                    MOVE TS-HST-RECL-IND TO RECLM4O  TWA-MAP-RCLM4              
                    MOVE ATT-UNPROT      TO MQTYA REASON4A RECLM4A              
                 END-IF                                                         
              END-IF.                                                           
                                                                                
ET0006     IF TWA-TFR-NEW AND TWA-ADD-ASSET                                     
ET0006        IF TS-HST-ASSET-AMT > 0                                           
ET0006           IF TS-HST-PSTN-CD = 'S'                                        
ET0006              MULTIPLY TS-HST-ASSET-AMT BY -1 GIVING WS-SHORT-QTY         
ET0006              MOVE WS-SHORT-QTY     TO MAMTO                              
ET0006           ELSE                                                           
ET0006              MOVE TS-HST-ASSET-AMT TO MAMTO                              
ET0006           END-IF                                                         
ET0006        ELSE                                                              
ET0006           MOVE 0 TO MAMTO                                                
ET0006        END-IF                                                            
ET0006        MOVE MAMTI            TO TWA-MAP-AMT                              
ET0006        MOVE TWA-SECUR        TO TWA-PREV-SECUR                           
ET0006        MOVE TWA-CATGRY       TO TWA-PREV-CATGRY                          
ET0006        MOVE TWA-SLOC         TO TWA-PREV-SLOC                            
ET0006        MOVE TWA-SEC-TYPE     TO TWA-PREV-SEC-TYPE                        
ET0006        MOVE TWA-MAP-QTY      TO TWA-PREV-QTY                             
ET0006        MOVE TWA-MAP-RSON4    TO TWA-PREV-RSON4                           
ET0006        MOVE TWA-MAP-RCLM4    TO TWA-PREV-RCLM4                           
ET0006        MOVE TWA-MAP-AMT      TO TWA-PREV-AMT                             
ET0006     END-IF.                                                              
                                                                                
           IF TWA-TFR-UPDATE                                                    
              MOVE TS-INI-SECURITY     TO MSECRO  TWA-SECUR                     
              MOVE TS-INI-CTGRY        TO MCATGRO TWA-CATGRY                    
              MOVE TS-INI-STTL-LOC     TO MSLOCO  TWA-SLOC                      
              MOVE TS-INI-TYPE         TO MTYPEO  TWA-SEC-TYPE                  
              MOVE TS-INI-DESC(1:60)   TO MDESC1O                               
              MOVE TS-INI-DESC(61:60)  TO MDESC2O                               
              MOVE TS-INI-DESC         TO TWA-DESCRIPT                          
              IF TS-INI-PSTN-CD = 'S'                                           
                 MULTIPLY TS-INI-QTY-RECL BY -1 GIVING WS-SHORT-QTY             
                 MOVE WS-SHORT-QTY     TO MQTYO                                 
              ELSE                                                              
                 MOVE TS-INI-QTY-RECL  TO MQTYO                                 
              END-IF                                                            
              MOVE MQTYI           TO TWA-MAP-QTY                               
              MOVE TS-INI-REASON   TO REASON4O TWA-MAP-RSON4                    
              MOVE TS-INI-RECL-IND TO RECLM4O  TWA-MAP-RCLM4.                   
       EJECT                                                                    
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*    PF7:  TRANSFER PREVIOUSE PAGE                              *         
ET0001*---------------------------------------------------------------*         
ET0001 6500-PREV-PAGE-TIF.                                                      
           IF TWA-TFR-INQUIRY                                                   
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'PF7 KEY DISABLED AT THIS TIME'                              
              TO  SYSTEM-MSG                                                    
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE ACAT-ADP-BROKER  TO ACAT12-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR TO WS-PASS-BR.                                       
           MOVE TWA-MAP-AC TO WS-PASS-ACCT.                                     
           MOVE ALL '%'    TO WS-PASS-ACCT-MASK.                                
           MOVE WS-PASS-ACCT-DLV TO ACAT12-PASS-ACCT-DLV.                       
                                                                                
ET0005     IF TWA-TFR-NEW                                                       
ET0005        PERFORM 6510-PF7-FROM-HISTORY-TBL                                 
ET0005     END-IF.                                                              
ET0005     IF TWA-TFR-UPDATE                                                    
ET0008        IF TWA-SRCH-ALL-RCLS                                              
ET0008           PERFORM 6530-PF7-FOR-ALL-INIT-RECLAIMS                         
ET0008        ELSE                                                              
ET0005           PERFORM 6520-PF7-FROM-INITIAL-TBL                              
ET0008        END-IF                                                            
ET0005     END-IF.                                                              
                                                                                
           MOVE -1 TO MBRL.                                                     
           PERFORM  7020-WRITE-TSQ-RTN.                                         
           PERFORM  8100-SEND-MAP-DATA-ONLY.                                    
           PERFORM  8800-RETURN-TO-CICS.                                        
       EJECT                                                                    
ET0005*                                                                         
ET0005*---------------------------------------------------------------*         
ET0005*   PF7 FOR TWA-TFR-NEW MODE : TO CREATE NEW RECLAIM TRANSFER.  *         
ET0005*   (DATA FETCH FROM HISTORY TRANSFER TABLE)                    *         
ET0005*---------------------------------------------------------------*         
ET0005 6510-PF7-FROM-HISTORY-TBL.                                               
           PERFORM 2940-OPEN-TRNFR-HIST-DESC.                                   
                                                                                
           MOVE SPACE TO WS-PREV-PAGE-FOUND-SW.                                 
           PERFORM UNTIL WS-PREV-PAGE-FOUND OR WS-NO-MORE-DATA                  
              PERFORM 2950-FETCH-TRNFR-HIST-DESC                                
              IF WS-TFR-HIST-FOUND                                              
                 IF ACAT12-TFR-ACAT < TWA-ACAT                                  
                    SET WS-PREV-PAGE-FOUND TO TRUE                              
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 2960-CLOSE-TRNFR-HIST-DESC.                                  
                                                                                
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
ET0005*                                                                         
ET0005*---------------------------------------------------------------*         
ET0005*  PF7 FOR TWA-TFR-UPDATE MODE: TO UPDATE(DELETE) RECLAIM TRNFR.*         
ET0005*  (DATA FETCH FROM INITIAL TRANSFER TABLE)                     *         
ET0005*---------------------------------------------------------------*         
ET0005 6520-PF7-FROM-INITIAL-TBL.                                               
           PERFORM 3105-OPEN-TRNFR-INIT-DESC.                                   
                                                                                
           MOVE SPACE TO WS-PREV-PAGE-FOUND-SW.                                 
           PERFORM UNTIL WS-PREV-PAGE-FOUND OR WS-NO-MORE-DATA                  
              PERFORM 3106-FETCH-TRNFR-INIT-DESC                                
              IF WS-TFR-INIT-FOUND                                              
                 IF ACAT12-TFR-ACAT < TWA-ADP-CONTROL-NBR                       
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
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*  PF7 FOR TWA-TFR-UPDATE MODE: TO UPDATE(DELETE) RECLAIM TRNFR.*         
ET0008*                                                               *         
ET0008*   (RETRIEVE ALL RECLAIMS FROM INITIAL TRANSFER TABLE)         *         
ET0008*---------------------------------------------------------------*         
ET0008 6530-PF7-FOR-ALL-INIT-RECLAIMS.                                          
           PERFORM 5660-OPEN-INITRN-ALL-RCLS-DES.                               
                                                                                
           MOVE SPACE TO WS-PREV-PAGE-FOUND-SW.                                 
           PERFORM UNTIL WS-PREV-PAGE-FOUND OR WS-NO-MORE-TRNFR                 
              PERFORM 5670-FETCH-INITRN-ALL-RCLS-DES                            
              IF WS-TFR-INIT-FOUND                                              
                 MOVE ACAT12-TFR-DLVR-ACCT   TO WS-NEXT-DLVR-ACCT-KEY           
                 MOVE ACAT12-TFR-RCV-ACCT    TO WS-NEXT-RCV-ACCT-KEY            
                 MOVE ACAT12-TFR-ACAT        TO WS-NEXT-ADP-ACAT-KEY            
                 MOVE TWA-DLVR-ACCT          TO WS-CURR-DLVR-ACCT-KEY           
                 MOVE TWA-RCV-ACCT           TO WS-CURR-RCV-ACCT-KEY            
                 MOVE TWA-ADP-CONTROL-NBR    TO WS-CURR-ADP-ACAT-KEY            
                 IF WS-NEXT-INITRN-KEY < WS-CURR-INITRN-KEY                     
                    SET WS-PREV-PAGE-FOUND TO TRUE                              
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 5680-CLOSE-INITRN-ALL-RCLS-DES.                              
                                                                                
           IF WS-NO-MORE-TRNFR                                                  
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'TOP PAGE ACCOUNT DATA' TO SYSTEM-MSG                     
              END-IF                                                            
           ELSE                                                                 
              PERFORM 3109-TRNF-INIT-TO-TWA                                     
              PERFORM 6710-SETUP-INIT-ASSET                                     
              MOVE TWA-MAP-BR  TO TWA-SAVE-MAP-BR                               
              MOVE TWA-MAP-AC  TO TWA-SAVE-MAP-AC                               
           END-IF.                                                              
ET0008 EJECT                                                                    
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0001*    PF8:  TRANSFER NEXT PAGE                                   *         
ET0001*---------------------------------------------------------------*         
ET0001 6600-NEXT-PAGE-TIF.                                                      
           IF TWA-TFR-INQUIRY                                                   
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'PF8 KEY DISABLED AT THIS TIME'                              
              TO  SYSTEM-MSG                                                    
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE ACAT-ADP-BROKER  TO ACAT12-PASS-DLVR-NBR.                       
           MOVE TWA-MAP-BR TO WS-PASS-BR.                                       
           MOVE TWA-MAP-AC TO WS-PASS-ACCT.                                     
           MOVE ALL '%'    TO WS-PASS-ACCT-MASK.                                
           MOVE WS-PASS-ACCT-DLV TO ACAT12-PASS-ACCT-DLV.                       
                                                                                
ET0005     IF TWA-TFR-NEW                                                       
ET0005        PERFORM 6610-PF8-FROM-HISTORY-TBL                                 
ET0005     END-IF.                                                              
ET0005     IF TWA-TFR-UPDATE                                                    
ET0008        IF TWA-SRCH-ALL-RCLS                                              
ET0008           PERFORM 6630-PF8-FOR-ALL-INIT-RECLAIMS                         
ET0008        ELSE                                                              
ET0005           PERFORM 6620-PF8-FROM-INITIAL-TBL                              
ET0008        END-IF                                                            
ET0005     END-IF.                                                              
                                                                                
           MOVE -1 TO MNEXTL.                                                   
           PERFORM  7020-WRITE-TSQ-RTN.                                         
           PERFORM  8100-SEND-MAP-DATA-ONLY.                                    
           PERFORM  8800-RETURN-TO-CICS.                                        
       EJECT                                                                    
ET0005*                                                                         
ET0005*---------------------------------------------------------------*         
ET0005*   PF8 FOR TWA-TFR-NEW MODE : TO CREATE NEW RECLAIM TRANSFER.  *         
ET0005*   (DATA FETCH FROM HISTORY TRANSFER TABLE)                    *         
ET0005*---------------------------------------------------------------*         
ET0005 6610-PF8-FROM-HISTORY-TBL.                                               
           PERFORM 2900-OPEN-TRNFR-HIST.                                        
                                                                                
           MOVE SPACE TO WS-NEXT-PAGE-FOUND-SW.                                 
           PERFORM UNTIL WS-NEXT-PAGE-FOUND OR WS-NO-MORE-DATA                  
              PERFORM 2910-FETCH-TRNFR-HIST                                     
              IF WS-TFR-HIST-FOUND                                              
                 IF ACAT12-TFR-ACAT > TWA-ACAT                                  
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
ET0005*                                                                         
ET0005*---------------------------------------------------------------*         
ET0005*   PF8 FOR TWA-TFR-UPDATE MODE: TO UPDATE(DELETE) RECLAIM.     *         
ET0005*   (DATA FETCH FROM INITIAL TRANSFER TABLE)                    *         
ET0005*---------------------------------------------------------------*         
ET0005 6620-PF8-FROM-INITIAL-TBL.                                               
           PERFORM 3102-OPEN-TRNFR-INIT.                                        
                                                                                
           MOVE SPACE TO WS-NEXT-PAGE-FOUND-SW.                                 
           PERFORM UNTIL WS-NEXT-PAGE-FOUND OR WS-NO-MORE-DATA                  
              PERFORM 3103-FETCH-TRNFR-INIT                                     
              IF WS-TFR-INIT-FOUND                                              
                 IF ACAT12-TFR-ACAT > TWA-ADP-CONTROL-NBR                       
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
ET0008*                                                                         
ET0008*---------------------------------------------------------------*         
ET0008*   PF8 FOR TWA-TFR-UPDATE MODE: TO UPDATE(DELETE) RECLAIM.     *         
ET0008*                                                               *         
ET0008*   (RETRIEVE ALL RECLAIMS FROM INITIAL TRANSFER TABLE)         *         
ET0008*---------------------------------------------------------------*         
ET0008 6630-PF8-FOR-ALL-INIT-RECLAIMS.                                          
           PERFORM 5630-OPEN-INITRN-ALL-RCLS.                                   
                                                                                
           MOVE SPACE TO WS-NEXT-PAGE-FOUND-SW.                                 
           PERFORM UNTIL WS-NEXT-PAGE-FOUND OR WS-NO-MORE-TRNFR                 
              PERFORM 5640-FETCH-INITRN-ALL-RCLS                                
              IF WS-TFR-INIT-FOUND                                              
                 MOVE ACAT12-TFR-DLVR-ACCT   TO WS-NEXT-DLVR-ACCT-KEY           
                 MOVE ACAT12-TFR-RCV-ACCT    TO WS-NEXT-RCV-ACCT-KEY            
                 MOVE ACAT12-TFR-ACAT        TO WS-NEXT-ADP-ACAT-KEY            
                 MOVE TWA-DLVR-ACCT          TO WS-CURR-DLVR-ACCT-KEY           
                 MOVE TWA-RCV-ACCT           TO WS-CURR-RCV-ACCT-KEY            
                 MOVE TWA-ADP-CONTROL-NBR    TO WS-CURR-ADP-ACAT-KEY            
                 IF WS-NEXT-INITRN-KEY > WS-CURR-INITRN-KEY                     
                    SET WS-NEXT-PAGE-FOUND TO TRUE                              
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           PERFORM 5650-CLOSE-INITRN-ALL-RCLS.                                  
                                                                                
           IF WS-NO-MORE-TRNFR                                                  
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'BOTTOM PAGE ACCOUNT DATA' TO SYSTEM-MSG                  
              END-IF                                                            
           ELSE                                                                 
              PERFORM 3109-TRNF-INIT-TO-TWA                                     
              PERFORM 6710-SETUP-INIT-ASSET                                     
              MOVE TWA-MAP-BR  TO TWA-SAVE-MAP-BR                               
              MOVE TWA-MAP-AC  TO TWA-SAVE-MAP-AC                               
           END-IF.                                                              
       EJECT                                                                    
ET0001*                                                                         
ET0001*---------------------------------------------------------------*         
ET0005*    FOR TWA-TFR-NEW MODE PF7 OR PF8 KEY                        *         
ET0001*      - CREATE HISTORY ASSET TEMP STORAGE                      *         
ET0001*      - SET UP SCREEN DATA FOR ASSET                           *         
ET0001*---------------------------------------------------------------*         
ET0001 6700-SETUP-ASSET-DATA.                                                   
           MOVE SPACE TO TWA-SAVE-MAP-ENTRY.                                    
           MOVE SPACE TO WS-RCLM-ASSET-FOUND-SW.                                
           MOVE SPACE TO TWA-NO-ASSET-SW.                                       
           PERFORM 3010-OPEN-ASSET-HIST.                                        
           IF WS-ASSET-HIST-FOUND                                               
              PERFORM 7110-DELETE-HIST-ASSET-TSQ                                
              MOVE 0     TO TWA-MAX-PAGE-HST                                    
              INITIALIZE TWA-SAVE-HIST-BALANCE                                  
                         TS-HST-ASSET-AREA                                      
              MOVE SPACE TO TWA-MAP-SUB TWA-MAP-DEL                             
              MOVE SPACE TO WS-NO-MORE-DATA-SW                                  
              PERFORM  3500-SAVE-ASSET-HIST-IN-TS THRU 3500-EXIT                
                   UNTIL WS-NO-MORE-DATA                                        
              PERFORM 3030-CLOSE-ASSET-HIST                                     
              PERFORM 2010-CLEAR-SCR                                            
              PERFORM 2300-FROM-TFR                                             
              IF WS-RCLM-ASSET-FOUND                                            
                 MOVE +1 TO TWA-PAGE-NUM                                        
                            WS-HST-ITEM                                         
                 PERFORM 2310-FROM-HIST-TWA                                     
                 PERFORM 2315-FROM-HIST-TS                                      
              ELSE                                                              
                 MOVE 0 TO TWA-PAGE-NUM                                         
                 SET WK-MSG-ON TO TRUE                                          
                 SET TWA-NO-ASSET TO TRUE                                       
                 MOVE 'NO ASSETS FOUND FOR THE REQUESTED ACCOUNT'               
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           ELSE                                                                 
              MOVE 0 TO TWA-PAGE-NUM                                            
              SET WK-MSG-ON TO TRUE                                             
              SET TWA-NO-ASSET TO TRUE                                          
              MOVE 'NO ASSETS FOUND FOR THE REQUESTED ACCOUNT'                  
                TO  SYSTEM-MSG                                                  
           END-IF.                                                              
       EJECT                                                                    
ET0005*                                                                         
ET0005*---------------------------------------------------------------*         
ET0005*    FOR TWA-TFR-UPDATE MODE PF7 OR PF8 KEY                     *         
ET0005*      - CREATE INITIAL ASSET TEMP STORAGE                      *         
ET0005*      - SET UP SCREEN DATA FOR ASSET                           *         
ET0005*---------------------------------------------------------------*         
ET0005 6710-SETUP-INIT-ASSET.                                                   
           MOVE SPACE TO TWA-SAVE-MAP-ENTRY.                                    
           MOVE SPACE TO TWA-NO-ASSET-SW.                                       
           PERFORM 3110-OPEN-ASSET-INIT.                                        
           IF WS-ASSET-INIT-FOUND                                               
              PERFORM 7210-DELETE-INIT-ASSET-TSQ                                
              MOVE 0     TO TWA-MAX-PAGE-INI                                    
              INITIALIZE TWA-SAVE-INIT-BALANCE                                  
                         TS-INI-ASSET-AREA                                      
              MOVE SPACE TO TWA-MAP-SUB TWA-MAP-DEL                             
              MOVE SPACE TO WS-NO-MORE-DATA-SW                                  
              PERFORM 3600-SAVE-ASSET-INIT-IN-TS THRU 3600-EXIT                 
                   UNTIL WS-NO-MORE-DATA                                        
              PERFORM 3130-CLOSE-ASSET-INIT                                     
              PERFORM 2010-CLEAR-SCR                                            
              PERFORM 2300-FROM-TFR                                             
              MOVE +1 TO TWA-PAGE-NUM                                           
                         WS-INI-ITEM                                            
              PERFORM 2320-FROM-INIT-TWA                                        
              PERFORM 2325-FROM-INIT-TS                                         
           ELSE                                                                 
              MOVE 0 TO TWA-PAGE-NUM                                            
              SET WK-MSG-ON TO TRUE                                             
              SET TWA-NO-ASSET TO TRUE                                          
              MOVE 'NO ASSETS FOUND FOR THE REQUESTED ACCOUNT'                  
                TO  SYSTEM-MSG                                                  
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *-------------------------------------------------------------*           
      *           TS QUEUE FOR TWA AREA                             *           
      *-------------------------------------------------------------*           
       7000-READ-TSQ-RTN.                                                       
           MOVE '12IR'   TO TRAN-ID.                                            
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                                   
                              INTO(TWA-AREA)                                    
                              LENGTH(LENGTH OF TWA-AREA)                        
                              ITEM(ITEM-NUM)                                    
           END-EXEC.                                                            
           IF (EIBRESP NOT = +0)                                                
           AND (NOT FIRST-TIME)                                                 
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE 'ACAT12IR READ TSQ ERROR'                                    
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
       7010-DELETE-TSQ-RTN.                                                     
           MOVE '12IR'   TO TRAN-ID.                                            
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                                 
           END-EXEC.                                                            
                                                                                
       7020-WRITE-TSQ-RTN.                                                      
           MOVE '12IR'   TO TRAN-ID.                                            
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                                  
                               FROM(TWA-AREA)                                   
                               LENGTH(LENGTH OF TWA-AREA)                       
                               ITEM(ITEM-NUM)                                   
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE 'ACAT12IR WRITE TSQ ERROR'                                   
                TO SYSTEM-MSG                                                   
ET0001**      PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *-------------------------------------------------------------*           
      *           TS QUEUE FOR ASSET HISTORY TABLE                  *           
      *-------------------------------------------------------------*           
       7100-READ-HIST-ASSET-TSQ.                                                
           MOVE SPACE TO WK-TS-READ-FLAG.                               15960000
           EXEC CICS READQ TS QUEUE(HST-ASSET-TSQ)                              
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
           EXEC CICS DELETEQ TS QUEUE(HST-ASSET-TSQ)                            
           END-EXEC.                                                            
                                                                                
       7120-WRITE-HIST-ASSET-TSQ.                                               
           EXEC CICS WRITEQ TS QUEUE(HST-ASSET-TSQ)                             
                               FROM(TS-HST-ASSET-AREA)                          
                               LENGTH(LENGTH OF TS-HST-ASSET-AREA)              
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE 'ACAT12IR HST-ASST WRITE TSQ ERROR'                          
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
      *                                                                         
       7130-REWRITE-HIST-ASSET-TSQ.                                             
           EXEC CICS WRITEQ TS QUEUE(HST-ASSET-TSQ)                             
                               FROM(TS-HST-ASSET-AREA)                          
                               LENGTH(LENGTH OF TS-HST-ASSET-AREA)              
                               ITEM(WS-HST-ITEM)                                
                               REWRITE                                          
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE 'ACAT12IR HST-ASST REWRITE TSQ ERROR'                        
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
           EJECT                                                                
      *                                                                         
      *-------------------------------------------------------------*           
      *           TS QUEUE FOR INTIAL ASSET TABLE                   *           
      *-------------------------------------------------------------*           
       7200-READ-INIT-ASSET-TSQ.                                                
           MOVE SPACE TO WK-TS-READ-FLAG.                               15960000
           EXEC CICS READQ TS QUEUE(INI-ASSET-TSQ)                              
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
                                                                                
       7210-DELETE-INIT-ASSET-TSQ.                                              
           EXEC CICS DELETEQ TS QUEUE(INI-ASSET-TSQ)                            
           END-EXEC.                                                            
                                                                                
       7220-WRITE-INIT-ASSET-TSQ.                                               
           EXEC CICS WRITEQ TS QUEUE(INI-ASSET-TSQ)                             
                               FROM(TS-INI-ASSET-AREA)                          
                               LENGTH(LENGTH OF TS-INI-ASSET-AREA)              
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE 'ACAT12IR INI-ASST WRITE TSQ ERROR'                          
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
      *                                                                         
       7230-REWRITE-INIT-ASSET-TSQ.                                             
           EXEC CICS WRITEQ TS QUEUE(INI-ASSET-TSQ)                             
                               FROM(TS-INI-ASSET-AREA)                          
                               LENGTH(LENGTH OF TS-HST-ASSET-AREA)              
                               ITEM(WS-INI-ITEM)                                
                               REWRITE                                          
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT12MO                                        
              MOVE 'ACAT12IR INI-ASST REWRITE TSQ ERROR'                        
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
      *            CALL DB2 I/O MODULE FOR ACAT12DB                 *           
      *-------------------------------------------------------------*           
       7600-LINK-TO-ACAT12DB.                                                   
           EXEC CICS LINK                                                       
                     PROGRAM('ACAT12DB')                                        
                     COMMAREA(ACAT12IO-COMMAREA)                                
                     LENGTH(LENGTH OF ACAT12IO-COMMAREA)                        
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
ET0006*                                                                         
ET0006*-------------------------------------------------------------*           
ET0006*     CALL MSD ROUTINE                                        *           
ET0006*-------------------------------------------------------------*           
ET0006 7800-LINK-TO-ACATMSDIO-RTN.                                              
           EXEC CICS LINK PROGRAM (WS-ACATMSD)                          02890002
                COMMAREA(ACATMSDIO-CALL-AREA)                           02900002
                LENGTH(LENGTH OF ACATMSDIO-CALL-AREA)                   02910002
           END-EXEC.                                                    02920002
       EJECT                                                            02920002
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
           EXEC CICS SEND MAP('ACAT12M')                                        
                     MAPSET('ACAT12M')                                          
                     FROM(ACAT12MO)                                             
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
               EXEC CICS SEND MAP('ACAT12M')                                    
                         MAPSET('ACAT12M')                                      
                         FROM(ACAT12MO)                                         
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
           EXEC CICS RECEIVE MAP('ACAT12M')                                     
                             MAPSET('ACAT12M')                                  
                             FROM(ACAT-RECEIVE-MAP)                             
                             INTO(ACAT12MI)                                     
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
                                                                                
       8800-RETURN-TO-CICS.                                                     
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
