000001* PDX    - ACAT25PD C0330171 08/30/12 09:39:21 TBLAMUR            00001000
000001* PDX    - ACAT25PD C0318727 01/11/12 13:46:15 TBLAMUR            00001000
000001* PDX    - ACAT25PD C0279306 05/05/09 17:48:22 TBLAMUR            00001000
000001* LRM006 - SSR 64209 EDIT CONTRA BROKER ON S SCREEN, CHECK S/D            
000001* LRM006   GREATER TODAY.                                                 
000001* PDX    - ACAT25PD C0270299 09/15/08 16:32:51 TBLAMUR            00001000
000001* LRM SSRS 55766 55717 RECOMPILE ONLY FOR COPYS ACATCOM,90TS,JUMP.        
000001* PDX    - ACAT25PD C0250441 06/25/07 15:04:29 TBLAMUR            00001000
000001* PDX    - ACAT25PD C0250061 06/14/07 09:06:15 TBLAMUR            00001000
000001* PDX    - ACAT25PD C0245632 03/22/07 08:19:38 TBLAMUR            00001000
000001* PDX    - ACAT25PD C0210492 09/17/04 10:58:54 TBEDTAK            00001000
000001* PDX    - ACAT25PD C0205792 08/13/04 15:25:16 TBLAMUR            00001000
000001* PDX    - ACAT25PD C0179784 09/26/02 14:40:43 TBEDTAK            00001000
000001* PDX    - ACAT25PD C0160324 07/19/01 15:25:22 TBLAMUR            00001000
000001* PDX    - ACAT25PD C0131728 09/24/99 11:18:56 TBLAMUR            00001000
000001* PDX    - ACAT25PD C0125633 07/01/99 16:13:00 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT25PD.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *                 ACAT TRANSFER ASSET INQUIRY                   *         
      *****************************************************************         
      *  DATABASE:                                                    *         
      *   - VTRNFR   (PENDING TRANSFER)                               *         
      *   - VASSET   (PENDING ASSET)                                  *         
      *   - VTRNHSTY (HISTORY TRANSFER)                               *         
      *   - VASTHSTY (HISTORY ASSET)                                  *         
      *  PURPOSE:                                                     *         
      *   - THE PROGRAM DISPLAYS EITHER PENDING OR HISTORY TRANSFER   *         
      *     ASSET DATA.                                               *         
      *   - IF THE PROGRAM CONTROL IS PASSED FROM PENDING TRANSFER    *         
      *     INQUIRY PROGRAM 'ACAT21PT', THEN PENDING TRANSFER ASSET   *         
      *     DATA WILL BE DISPLAYED.                                   *         
      *   - IF THE PROGRAM CONTROL IS PASSED FROM HISTORY TRANSFER    *         
      *     INQUIRY PROGRAM 'ACAT22TH', THEN HISTORY TRANSFER ASSET   *         
      *     DATA WILL BE DISPLAYED.                                   *         
      *   - USER MAY SEARCH TRNASFER BY EITHER 'SEARCH BY ACAT#'      *         
      *     FIELD OR SEARCH ENGINE FIELDS ENTRIES.                    *         
      *   - THE PROGRAM INITIALLY DISPLAYS TRANSFERS IN SEQUENCE OF   *         
      *     PRIMARY KEY FOR THE REASON OF THE FASTER RESPONSE TIME.   *         
      *     HOWEVER IF THE USER ENTERS SEARCH ENGINE FIELDS, THE      *         
      *     PROGRAM DISPLAYS TRANSFERS IN BRANCH ACCT SEQUENCE ORDER  *         
      *     WHICH WILL SLOW DOWN THE RESPONSE TIME.                   *         
      *     IF THE USER CHOOSES TO SEARCH TRANSFER BY SELECTING THE   *         
      *     'SEARCH BY ACAT#', THEN THE PROGRAM AGAIN DISPLAYS IN     *         
      *     PRIMARY KEY SEQUENCE ORDER.                               *         
      *   - ALLOW USER TO VIEW ACCOUNT DATA BY PRESSING PF3 KEY WHICH *         
      *     WILL PROMPT THE PROGRAM TO LINK CONTROL TO THE MARGIN     *         
      *     TRANSACTION.                                              *         
      *     THE PROGRAM MUST TAKE CONTROL BACK FROM MARGIN'S PROGRAM  *         
      *     WHEN THE USER PRESSES PF11 KEY TO RETURN FROM MARGIN.     *         
LM0001* 6/18/01 ALLOW PF6 HOT KEY TO MUTUAL FUND CLEANUP ACAT33FC.    *         
LM0002* 8/13/04 ALLOW PF6 FOR PTR,PTD AND RCR DELIVERIES.             *         
ET0001* SEPT 04 ADD CAGE TAG# FIELD TO A MAP.  ADD ACTION FIELD FOR   *         
ET0001*         CAGE TAG# TO ALLOW USER TO JUMP TO "L" OR "Z" SCREEN. *         
LRM003* SSR 49202 CONTINUED - ADD DESCR DSPLY FOR REGT AND 90DR                 
LRM004* SSR 46214 ALLOW "L" LINK TO FRV SCREEN ON RCL DELIVERY                  
LRM005* SSR 53075 SPIN-OFF CHANGES                                              
LRM007* SSR 86856 UPGRADE FCUR BALANCE TO SHOW AMOUNT, NOT QTY = ZERO.          
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
       77  TWA-SIZE                       PIC S9(4) COMP.                       
       77  ACATVR-DATASET                 PIC X(08) VALUE 'ACATIT'.             
       77  WS-EDITMOD                     PIC X(08) VALUE 'ACATEDIT'.           
       77  WS-ACATMSD                     PIC X(08) VALUE 'ACATMSD'.    00140002
       77  CURR-EDIT-LEN                  PIC S9(4) COMP  VALUE +35.            
      *                                                                         
       01  TSQ-WORK-AREA.                                                       
           05  TWA-TSQ.                                                         
               09  TSQ-NAME.                                                    
                   11 TERM-ID             PIC X(04).                            
                   11 TRAN-ID             PIC X(04).                            
               09  ITEM-NUM               PIC S9(04) COMP VALUE +1.             
           05  ASSET-TSQ.                                                       
               09  ASSET-TSQ-NAME.                                              
                   11 ASSET-TERM          PIC X(04).                            
                   11 FILLER              PIC X(04) VALUE '25AS'.               
               09  ASSET-ITEM             PIC S9(04) COMP.                      
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
LRM006     05  WS-TDY-YYMMDD.                                                   
LRM006         09 WS-TDY-YY        PIC XX.                                      
LRM006         09 WS-TDY-MM        PIC XX.                                      
LRM006         09 WS-TDY-DD        PIC XX.                                      
LRM006     05  WS-STLM-YYMMDD.                                                  
LRM006         09 WS-STLM-YY       PIC XX.                                      
LRM006         09 WS-STLM-MM       PIC XX.                                      
LRM006         09 WS-STLM-DD       PIC XX.                                      
      *                                                                         
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
       01  WS-AMT                      USAGE COMP-2.                            
       EJECT                                                            00230002
      *                                                                         
       01  WS-SWITCH-AREA.                                                      
           05  WK-ERROR-SW                PIC X(01) VALUE SPACE.                
               88  WK-ERROR                         VALUE 'Y'.                  
           05  WK-MSG-ON-SW               PIC X(01) VALUE SPACE.                
               88  WK-MSG-ON                        VALUE 'Y'.                  
           05  WS-NO-MORE-DATA-SW         PIC X(01) VALUE SPACE.                
               88  WS-NO-MORE-DATA                  VALUE 'N'.                  
           05  WS-NO-MORE-BKR-DATA-SW     PIC X(01) VALUE SPACE.                
               88  WS-NO-MORE-BKR-DATA              VALUE 'N'.                  
           05  WS-SEARCH-CHANGED-SW       PIC X(01) VALUE SPACE.                
               88  WS-SEARCH-CHANGED                VALUE 'Y'.                  
           05  WS-TRNFR-FOUND-SW          PIC X(01) VALUE SPACE.                
               88  WS-TRNFR-FOUND                   VALUE 'Y'.                  
ET0001     05  WK-SEARCH-ENTERED-SW       PIC X(01) VALUE SPACE.                
ET0001         88  WK-SEARCH-ENTERED                VALUE 'Y'.                  
       01  ACAT-WORK-AREA.                                                      
           05  CURRENCY-NUM               PIC 9(03).                            
           05  CURRENCY-X REDEFINES CURRENCY-NUM                                
                                          PIC X(03).                            
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
           05  WK-RESP                    PIC S9(8) COMP.                       
           05  WK-BRW-KEY.                                                      
               09 WK-BRW-CLIENT           PIC X(03).                            
               09 WK-BRW-RECORD-TYPE      PIC X(02)   VALUE '90'.               
               09 WK-BRW-CUR-BR-AC.                                             
                  15 WK-BRW-CURRENCY      PIC X(03).                            
                  15 WK-BRW-BRANCH        PIC X(03).                            
                  15 WK-BRW-ACCOUNT       PIC X(05).                            
           05  WS-STATUS.                                                       
               07  WS-STATUS-STAT         PIC X(03).                            
               07  FILLER                 PIC X(01) VALUE '-'.                  
               07  WS-STATUS-DAYS         PIC X(02).                            
               07  WS-STATUS-DAYS-N  REDEFINES WS-STATUS-DAYS                   
                                          PIC 9(02).                            
           05  WS-STTLM-DT.                                                     
               07  WS-STTLM-CC            PIC X(02).                            
               07  WS-STTLM-YY            PIC X(02).                            
               07  FILLER                 PIC X(01) VALUE '-'.                  
               07  WS-STTLM-MM            PIC X(02).                            
               07  FILLER                 PIC X(01) VALUE '-'.                  
               07  WS-STTLM-DD            PIC X(02).                            
           05  WS-STTLM-DT-OUT.                                                 
               07  WS-STTLM-OUT-MM        PIC X(02).                            
               07  FILLER                 PIC X(01) VALUE '/'.                  
               07  WS-STTLM-OUT-DD        PIC X(02).                            
               07  FILLER                 PIC X(01) VALUE '/'.                  
               07  WS-STTLM-OUT-YY        PIC X(02).                            
           05  WS-LOOP-CNT                PIC S9(07) COMP-3.                    
           05  SEL-CNT                    PIC S9(07) COMP-3.                    
           05  WK-SUSPEND-COUNT           PIC S9(04) COMP VALUE ZERO.           
ET0001     05  WS-USER-ACTION             PIC X(01).                            
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
           05  WS-LINE-DELETED-SW         PIC X(01).                            
               88  WS-LINE-DELETED                  VALUE 'Y'.                  
           05  WS-SCROLL-KEY-FOUND-SW     PIC X(01).                            
               88  WS-SCROLL-KEY-FOUND              VALUE 'Y'.                  
           05  WS-KEY-FOUND-SW            PIC X(01).                            
               88  WS-KEY-FOUND                     VALUE 'Y'.                  
           05  WS-JUMP-AUTHORIZED-SW      PIC X(01).                            
               88  WS-JUMP-NOT-AUTHORIZED           VALUE 'N'.                  
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
           05  ERROR-PROG-MSG.                                                  
               09  ERROR-PROG-NAME        PIC X(08).                            
               09  FILLER                 PIC X(71)                             
                   VALUE ' PROGRAM NOT AVAILIABLE.'.                            
           05  DB2IO-ERR-MSG              PIC X(54).                            
           05  WS-NOT-AUTHORIZED-MSG.                                           
               09  FILLER                 PIC X(37)                             
                   VALUE 'NOT AUTHORIZED TO USE NEXT SELECTION '.               
               09  WS-NOT-AUTHORIZED-NEXT PIC X(01).                            
           05  SAVE-INTRAN-FLAG           PIC X(01).                            
           05  PREV-INTRAN-FLAG           PIC X(01).                            
           05  WS-SAVE-SRCH-ACAT          PIC X(14).                            
           05  WS-SAVE-SRCH-ENGINE        PIC X(28).                            
           05  WS-ACAT-NEXT               PIC X.                                
           05  SUB                        PIC S9(09) COMP-3 VALUE +0.           
           05  SUB2                       PIC S9(09) COMP-3.                    
           05  WS-SPACE-CNT               PIC S9(3).                            
ET0001     05  WS-ACTION-CNT              PIC 9(3).                             
           05  WS-YEAR                    PIC X(02).                            
           05  WS-YEAR-N    REDEFINES WS-YEAR                                   
                                          PIC 9(02).                            
           05  WS-DIVIDED                 PIC 9(03).                            
           05  WS-REMAIN                  PIC 9(03).                            
           05  WS-LEAP-YR-SW              PIC X(01).                            
               88  WS-LEAP-YR                       VALUE 'Y'.                  
       01  TS-ASSET-AREA.                                                       
           03  TS-ASSET-SCR  OCCURS 3 TIMES.                                    
               05  TS-SEC                 PIC X(09).                            
               05  TS-CTGRY               PIC X(04).                            
               05  TS-SLOC                PIC X(02).                            
               05  TS-CS-MG-SH            PIC X(01).                            
               05  TS-AMT                 USAGE COMP-2.                         
               05  TS-DESC                PIC X(60).                            
               05  TS-PSTN-CD             PIC X(01).                            
               05  TS-STTL-RSN            PIC X(04).                            
               05  TS-ASSET-CMNT          PIC X(120).                           
ET0001         05  TS-CAGE-TAG            PIC X(11).                            
      *                                                                         
       01  ACATPPIO-CALL-AREA.                                                  
           COPY ACATPPIO.                                                       
           EJECT                                                                
       01  ACATMSD-CALL-AREA.                                                   
           COPY ACATMSDI.                                                       
           EJECT                                                                
       01  ACAT25IO-COMMAREA.                                                   
           COPY ACAT25IO.                                                       
           EJECT                                                                
       01  WS-POP-UP-WORKAREA.                                                  
           COPY ACAT90TS.                                                       
           EJECT                                                        01660002
       01  ACATNAIO-CALL-AREA.                                                  
           COPY ACATNAIO.                                                       
           EJECT                                                                
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
       COPY ACAT25M.                                                            
       01  ACAT25MR REDEFINES ACAT25MI.                                         
           02  FILLER                       PIC X(164).                         
           02  ASSET-MAP       OCCURS 3 TIMES.                                  
ET0001         03  ACT-L                    PIC S9(4) COMP.                     
ET0001         03  ACT-A                    PIC X(01).                          
ET0001         03  ACT-O                    PIC X(01).                          
               03  SEC-L                    PIC S9(4) COMP.                     
               03  SEC-A                    PIC X(01).                          
               03  SEC-O                    PIC X(09).                          
               03  SLOC-L                   PIC S9(4) COMP.                     
               03  SLOC-A                   PIC X(01).                          
               03  SLOC-O                   PIC X(02).                          
               03  CTGRY-L                  PIC S9(4) COMP.                     
               03  CTGRY-A                  PIC X(01).                          
               03  CTGRY-O                  PIC X(04).                          
ET0001         03  TAGDSC-L                 PIC S9(4) COMP.                     
ET0001         03  TAGDSC-A                 PIC X(01).                          
ET0001         03  TAGDSC-O                 PIC X(05).                          
ET0001         03  TAG-L                    PIC S9(4) COMP.                     
ET0001         03  TAG-A                    PIC X(01).                          
ET0001         03  TAG-O                    PIC X(11).                          
               03  DESC-L                   PIC S9(4) COMP.                     
               03  DESC-A                   PIC X(01).                          
               03  DESC-O                   PIC X(60).                          
               03  AMT-L                    PIC S9(4) COMP.                     
               03  AMT-A                    PIC X(01).                          
               03  AMT-I                    PIC X(21).                          
               03  FILLER REDEFINES AMT-I.                                      
                   05  AMT-O  PIC ZZZ,ZZZ,ZZZ,ZZ9.9999-.                        
           02  FILLER                       PIC X(21).                          
            EJECT                                                               
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
           03  FILLER                       PIC X(2000).                        
                                                                                
       COPY TWACOMMN.                                                           
           03 TWA-ACAT-AREA.                                                    
              05 TWA-MAP-AREA.                                                  
                 07 TWA-MAP-TITLE           PIC X(07).                          
                 07 TWA-MAP-BR              PIC X(03).                          
                 07 TWA-MAP-AC              PIC X(05).                          
                 07 TWA-MAP-RR              PIC X(03).                          
                 07 TWA-MAP-NAME1           PIC X(30).                          
                 07 TWA-MAP-RD              PIC X(03).                          
                 07 TWA-MAP-CBKR            PIC X(04).                          
                 07 TWA-MAP-STAT            PIC X(06).                          
                 07 TWA-MAP-NAME2           PIC X(30).                          
                 07 TWA-MAP-ACAT            PIC X(14).                          
                 07 TWA-MAP-TFR             PIC X(03).                          
                 07 TWA-MAP-SD              PIC X(08).                          
                 07 TWA-MAP-SACAT           PIC X(14).                          
                 07 TWA-MAP-NEXT            PIC X(01).                          
                 07 TWA-MAP-ASSETS OCCURS 3 TIMES.                              
ET0001              09 TWA-MAP-ACT          PIC X(01).                          
                    09 TWA-MAP-SEC          PIC X(09).                          
                    09 TWA-MAP-CTGRY        PIC X(04).                          
                    09 TWA-MAP-SLOC         PIC X(02).                          
                    09 TWA-MAP-DESC         PIC X(60).                          
                    09 TWA-MAP-AMT          PIC X(21).                          
ET0001              09 TWA-MAP-TAG          PIC X(11).                          
              05 TWA-SAVE-AREA.                                                 
                 07 TWA-SRCH-SW             PIC X(01).                          
                    88 TWA-SRCH-BY-ACAT         VALUE 'A'.                      
                    88 TWA-SRCH-BY-ENGINE       VALUE 'E'.                      
                 07 TWA-PEND-HIST-SW        PIC X(01).                          
                    88 TWA-PEND-TRNFR           VALUE 'P'.                      
                    88 TWA-HIST-TRNFR           VALUE 'H'.                      
              05 TWA-WORK-AREA.                                                 
                 07 TWA-TRNFR-PAGE-NUM      PIC 9(05) COMP-3.                   
                 07 TWA-MAX-TRNFR-PAGE-NUM  PIC 9(05) COMP-3.                   
                 07 TWA-ASSET-PAGE-NUM      PIC 9(05) COMP-3.                   
                 07 TWA-MAX-ASSET-PAGE-NUM  PIC 9(05) COMP-3.                   
                 07 TWA-SCREEN              PIC X(01).                          
                 07 TWA-TRNFR-CMNT          PIC X(120).                         
                 07 TWA-CONT-ACCT           PIC X(20).                          
                 07 TWA-ACCT-TYPE           PIC X(02).                          
                 07 TWA-PREV-SACAT          PIC X(14).                          
                 07 TWA-OTHER-ASSET-INFO    OCCURS 3 TIMES.                     
                    09 TWA-ASSET-CMNT       PIC X(120).                         
              05 TWA-MAP-SEARCH.                                                
                 07 TWA-MAP-MMBR            PIC X(3).                           
                 07 TWA-MAP-MMAC            PIC X(5).                           
                 07 TWA-MAP-MMRR            PIC X(3).                           
                 07 TWA-MAP-MMTFR           PIC X(3).                           
                 07 TWA-MAP-MMRD            PIC X(1).                           
                 07 TWA-MAP-MMBKR           PIC X(4).                           
                 07 TWA-MAP-MMSTAT          PIC X(3).                           
                 07 TWA-MAP-MMSD            PIC X(6).                           
              05 TWA-PREV-MAP-SEARCH.                                           
                 07 TWA-PREV-MMBR           PIC X(3).                           
                 07 TWA-PREV-MMAC           PIC X(5).                           
                 07 TWA-PREV-MMRR           PIC X(3).                           
                 07 TWA-PREV-MMTFR          PIC X(3).                           
                 07 TWA-PREV-MMRD           PIC X(1).                           
                 07 TWA-PREV-MMBKR          PIC X(4).                           
                 07 TWA-PREV-MMSTAT         PIC X(3).                           
                 07 TWA-PREV-MMSD           PIC X(6).                           
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
              MOVE LOW-VALUE TO ACAT25MO                                        
              SET WK-ERROR TO TRUE                                              
              MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO SYSTEM-MSG             
              PERFORM  9000-ERROR-RTN.                                          
                                                                                
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                          
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       MAIN-PROCESSING.                                                         
           INITIALIZE ACAT25IO-COMMAREA.                                        
           MOVE EIBTRMID TO TERM-ID.                                            
           MOVE '25PD'   TO TRAN-ID.                                            
           MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                               
           MOVE 'N'           TO END-OF-DATA-FLAG.                              
           MOVE SPACES        TO SYSTEM-MSG.                                    
           MOVE 0             TO WK-CURSOR.                                     
           MOVE LOW-VALUE     TO HDRMAPO                                        
                                 ACAT25MO.                                      
           PERFORM 0100-GET-DATE-AND-TIME.                                      
           MOVE  DFHCOMMAREA     TO  ACATCOMM-COMMAREA.                         
           MOVE  TWA-CLIENT-NO-X TO WK-CLT-NBR.                                 
           MOVE  WK-CLT          TO  ACAT25-PASS-CLT.                           
                                                                                
           IF EIBAID = DFHPF10                                                  
           AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                              
               PERFORM 0250-RETURNED-FROM-POPUP                                 
           ELSE                                                                 
           IF  ACAT-PROGRAM-NAME = 'ACAT25PD'                                   
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
               PERFORM 0900-CONTINUE-PROCESS                                    
           ELSE                                                                 
           IF  ACAT-PROGRAM-NAME = 'RATT01  '                                   
               MOVE 'ACAT25PD' TO ACAT-PROGRAM-NAME                             
               MOVE SPACES TO ACAT-BR-AC                                        
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
               PERFORM 7000-READ-TSQ-RTN                                        
               PERFORM 7010-DELETE-TSQ-RTN                                      
               PERFORM 0110-RETURNED-FROM-MRGN                                  
           ELSE                                                                 
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
      *                                                                         
      *--------------------------------------------------------------*          
      *           RETURNED FROM MARGIN PROGRAM THRU RATT01           *          
      *--------------------------------------------------------------*          
       0110-RETURNED-FROM-MRGN.                                                 
           SET FIRST-TIME TO TRUE.                                              
           PERFORM 0800-RESET-SCREEN.                                           
           MOVE -1 TO MNEXTL.                                                   
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 8000-SEND-MAP-ERASE.                                         
           PERFORM 8800-RETURN-TO-CICS.                                         
      *                                                                         
      *----------------------------------------------------------------*        
      *       FIRST TIME ROUTINE                                       *        
      *----------------------------------------------------------------*        
       0200-FIRST-TIME-RTN.                                                     
           INITIALIZE TWA-ACAT-AREA.                                            
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           PERFORM 7210-DELETE-ASSET-TSQ.                                       
                                                                                
           IF  ACAT-CALLING-PROG-NAME = 'ACAT21PT'                              
           AND ACAT-CONTROL-NBR > SPACE                                         
           AND ACAT-BR-AC > SPACE                                               
               PERFORM 0300-FROM-PENDING-INQUIRY                                
           ELSE                                                                 
           IF  ACAT-CALLING-PROG-NAME = 'ACAT22TH'                              
           AND ACAT-CONTROL-NBR > SPACE                                         
           AND ACAT-BR-AC > SPACE                                               
               PERFORM 0400-FROM-HISTORY-INQUIRY                                
           END-IF.                                                              
                                                                                
           SET FIRST-TIME TO TRUE.                                              
           MOVE '0' TO ACAT-NEXT.                                               
           MOVE SPACES TO ACAT-CALLING-PROG-NAME.                               
           MOVE 'ACAT25PD' TO ACAT-PROGRAM-NAME.                                
           MOVE -1 TO MNEXTL.                                                   
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 8000-SEND-MAP-ERASE.                                         
           PERFORM 8800-RETURN-TO-CICS.                                         
       EJECT                                                                    
      *                                                                 10350002
      *----------------------------------------------------------------*        
      *      PROGRAM CONTROL TRANSFERED FROM POPUP (ACAT90CM)          *        
      *----------------------------------------------------------------*        
       0250-RETURNED-FROM-POPUP.                                                
           MOVE  SPACES    TO ACAT-CALLING-PROG-NAME.                           
           MOVE 'ACAT25PD' TO ACAT-PROGRAM-NAME.                                
           MOVE '0'        TO ACAT-NEXT.                                        
           PERFORM 7000-READ-TSQ-RTN.                                           
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           PERFORM 2010-CLEAR-TRNFR-SCREEN.                                     
           PERFORM 2020-CLEAR-ASSET-SCREEN.                                     
                                                                                
           MOVE TWA-MAP-BR     TO MBRO.                                         
           MOVE TWA-MAP-AC     TO MACO.                                         
           MOVE TWA-MAP-RR     TO MRRO.                                         
           MOVE TWA-MAP-NAME1  TO MNAME1O.                                      
           MOVE TWA-MAP-RD     TO MRDO.                                         
           MOVE TWA-MAP-CBKR   TO MCBKRO.                                       
           MOVE TWA-MAP-STAT   TO MSTATO.                                       
           MOVE TWA-MAP-NAME1  TO MNAME2O.                                      
           MOVE TWA-MAP-ACAT   TO MACATO.                                       
           MOVE TWA-MAP-TFR    TO MTFRO.                                        
           MOVE TWA-MAP-SD     TO MSDO.                                         
                                                                                
           PERFORM  VARYING SUB FROM 1 BY 1  UNTIL SUB > 3                      
              IF TWA-MAP-ASSETS (SUB) > SPACE                                   
                 MOVE TWA-MAP-SEC   (SUB)   TO SEC-O   (SUB)                    
                 MOVE TWA-MAP-CTGRY (SUB)   TO CTGRY-O (SUB)                    
                 MOVE TWA-MAP-SLOC  (SUB)   TO SLOC-O  (SUB)                    
                 MOVE TWA-MAP-DESC  (SUB)   TO DESC-O  (SUB)                    
                 MOVE TWA-MAP-AMT   (SUB)   TO AMT-I   (SUB)                    
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           SET FIRST-TIME TO TRUE.                                              
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 8000-SEND-MAP-ERASE.                                         
           PERFORM 8800-RETURN-TO-CICS.                                         
      *                                                                         
      *----------------------------------------------------------------*        
      *      PROGRAM CONTROL TRANSFERED FROM PENDING (ACAT21PT)        *        
      *----------------------------------------------------------------*        
       0300-FROM-PENDING-INQUIRY.                                               
           SET TWA-PEND-TRNFR TO TRUE.                                          
           PERFORM 2010-CLEAR-TRNFR-SCREEN                                      
           PERFORM 2020-CLEAR-ASSET-SCREEN                                      
           MOVE SPACES  TO ACAT-BR-AC.                                          
           PERFORM 0310-GET-TRNFR.                                              
           IF ACAT25IO-NOT-FOUND                                                
              SET WK-ERROR TO TRUE                                              
              MOVE 'NO TRANSFER FOUND'  TO SYSTEM-MSG                           
           ELSE                                                                 
           IF ACAT25IO-NORMAL                                                   
              MOVE +1 TO TWA-TRNFR-PAGE-NUM                             15960000
      **      SET TWA-SRCH-BY-ENGINE TO TRUE                            15960000
              SET TWA-SRCH-BY-ACAT   TO TRUE                            15960000
              PERFORM 0700-SETUP-TFR-SCREEN                             15960000
              PERFORM 0320-SAVE-ASSETS-IN-TS                            15960000
              MOVE +1 TO ASSET-ITEM                                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              IF WK-TS-READ-OK                                                  
                 PERFORM 0710-SETUP-ASSET-SCREEN                        15960000
                    THRU 0710-EXIT                                      15960000
                     VARYING SUB FROM 1 BY 1                            15960000
                     UNTIL SUB > 3                                      15960000
                 MOVE +1 TO TWA-ASSET-PAGE-NUM                                  
              END-IF.                                                           
       EJECT                                                                   2
      *                                                                         
      *--------------------------------------------------------------*          
      *             GET TRANSFER                                     *          
      *--------------------------------------------------------------*          
       0310-GET-TRNFR.                                                          
           MOVE ACAT-CONTROL-NBR    TO ACAT25-PASS-ACAT.                        
           SET  ACAT25-GET-TRNFR    TO TRUE.                                    
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
LRM005        MOVE                                                              
LRM005        'DB2 SELECT ERROR ON "0310-GET-TRNFR" - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                   2
      *                                                                         
      *--------------------------------------------------------------*          
      *     SAVE ASSETS DATA IN TEMP STORAGE QUEUE                   *          
      *--------------------------------------------------------------*          
       0320-SAVE-ASSETS-IN-TS.                                          15960000
           PERFORM 0500-OPEN-ASSET-CURSOR.                                      
           MOVE ZERO  TO SUB.                                                   
           MOVE SPACE TO TS-ASSET-AREA.                                         
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           PERFORM  UNTIL WS-NO-MORE-DATA                                       
              PERFORM 0510-FETCH-ASSET-CURSOR                                   
              IF ACAT25IO-NORMAL                                                
                 ADD +1 TO SUB                                                  
                 PERFORM 0330-CREATE-ASSET-TS                                   
              END-IF                                                            
           END-PERFORM.                                                         
           IF SUB > 0 AND SUB < 3                                               
              PERFORM 7220-WRITE-ASSET-TSQ                                      
              MOVE ASSET-ITEM TO TWA-MAX-ASSET-PAGE-NUM                         
           END-IF.                                                              
           PERFORM 0520-CLOSE-ASSET-CURSOR.                                     
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *             CREATE ASSET TS QUEUE                            *          
      *--------------------------------------------------------------*          
       0330-CREATE-ASSET-TS.                                                    
           MOVE ACAT25-AST-SECURITY   TO TS-SEC        (SUB).                   
           MOVE ACAT25-AST-PRC-CTGY   TO TS-CTGRY      (SUB).                   
           MOVE ACAT25-AST-STTLM-LCTN TO TS-SLOC       (SUB).                   
           MOVE ACAT25-AST-CS-MG-SH   TO TS-CS-MG-SH   (SUB).                   
           MOVE ACAT25-AST-DESCRIPT   TO TS-DESC       (SUB).                   
           MOVE ACAT25-AST-PSTN-CD    TO TS-PSTN-CD    (SUB).                   
           MOVE ACAT25-AST-STTLM-RSN  TO TS-STTL-RSN   (SUB).                   
           MOVE ACAT25-AST-COMMENT    TO TS-ASSET-CMNT (SUB).                   
ET0001     MOVE ACAT25-AST-CAGE-TAG   TO TS-CAGE-TAG   (SUB).                   
LRM003     IF (ACAT25-AST-STTLM-RSN = 'REGT' OR '90DR')                         
LRM003     AND ACAT25-AST-STTLM-LCTN = '45'                                     
LRM003     AND ACAT25-AST-DESCRIPT NOT GREATER SPACES                           
LRM003        MOVE ACAT25-AST-STTLM-RSN TO ACAT25-AST-DESCRIPT                  
LRM003        MOVE 'MEMO'               TO ACAT25-AST-DESCRIPT (6 : 4)          
LRM003        MOVE ACAT25-AST-DESCRIPT   TO TS-DESC (SUB)                       
LRM003     END-IF.                                                              
                                                                                
           IF ACAT25-AST-STTLM-LCTN = '40'                                      
              IF ACAT25-AST-CS-MG-SH = 'C' OR 'M' OR 'S'                        
                 IF ACAT25-AST-STTLM-RSN = 'CRED'                               
                    MULTIPLY ACAT25-AST-ASSET-AMT BY -1 GIVING WS-AMT           
                    MOVE WS-AMT TO TS-AMT (SUB)                                 
                 ELSE                                                           
                    MOVE ACAT25-AST-ASSET-AMT TO TS-AMT (SUB)                   
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
LRM007* SHOW AMOUNT, NOT QTY = ZERO ON 50 FCUR                                  
LRM007        IF ACAT25-AST-STTLM-LCTN = '50'                                   
LRM007        AND ACAT25-AST-STTLM-RSN = 'FCUR'                                 
LRM007           IF ACAT25-AST-PSTN-CD = 'S'                                    
LRM007              MOVE ACAT25-AST-ASSET-AMT TO TS-AMT (SUB)                   
LRM007           ELSE                                                           
LRM007              MULTIPLY ACAT25-AST-ASSET-AMT BY -1 GIVING WS-AMT           
LRM007              MOVE WS-AMT TO TS-AMT (SUB)                                 
LRM007           END-IF                                                         
LRM007        ELSE                                                              
              IF ACAT25-AST-PSTN-CD = 'S'                                       
                 MULTIPLY ACAT25-AST-ASSET-QTY BY -1 GIVING WS-AMT              
                 MOVE WS-AMT TO TS-AMT (SUB)                                    
              ELSE                                                              
                 MOVE ACAT25-AST-ASSET-QTY TO TS-AMT (SUB)                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF SUB = 3                                                           
              PERFORM 7220-WRITE-ASSET-TSQ                                      
              MOVE ASSET-ITEM TO TWA-MAX-ASSET-PAGE-NUM                         
              MOVE SPACE TO TS-ASSET-AREA                                       
              MOVE ZERO  TO SUB                                                 
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *        PROGRAM CONTROL TRANSFERED FROM HISTORY (ACAT22TH)      *        
      *----------------------------------------------------------------*        
       0400-FROM-HISTORY-INQUIRY.                                               
           SET TWA-HIST-TRNFR TO TRUE.                                          
           PERFORM 2010-CLEAR-TRNFR-SCREEN                                      
           PERFORM 2020-CLEAR-ASSET-SCREEN                                      
           MOVE SPACES  TO ACAT-BR-AC.                                          
           PERFORM 0410-GET-HIST-TRNFR.                                         
           IF ACAT25IO-NOT-FOUND                                                
              SET WK-ERROR TO TRUE                                              
              MOVE 'NO HISTORY TRANSFERS FOUND'  TO SYSTEM-MSG                  
           ELSE                                                                 
           IF ACAT25IO-NORMAL                                                   
              MOVE +1 TO TWA-TRNFR-PAGE-NUM                             15960000
      **      SET TWA-SRCH-BY-ENGINE TO TRUE                            15960000
              SET TWA-SRCH-BY-ACAT   TO TRUE                            15960000
              PERFORM 0700-SETUP-TFR-SCREEN                             15960000
              PERFORM 0420-SAVE-HIST-ASSETS-IN-TS                       15960000
              MOVE +1 TO ASSET-ITEM                                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              IF WK-TS-READ-OK                                                  
                 PERFORM 0710-SETUP-ASSET-SCREEN                        15960000
                    THRU 0710-EXIT                                      15960000
                     VARYING SUB FROM 1 BY 1                            15960000
                     UNTIL SUB > 3                                      15960000
                 MOVE +1 TO TWA-ASSET-PAGE-NUM                                  
              END-IF.                                                           
       EJECT                                                                   2
      *                                                                         
      *--------------------------------------------------------------*          
      *             GET HISTORY TRANSFER                             *          
      *--------------------------------------------------------------*          
       0410-GET-HIST-TRNFR.                                                     
           MOVE ACAT-CONTROL-NBR      TO ACAT25-PASS-ACAT.                      
           SET  ACAT25-GET-HST-TRNFR  TO TRUE.                                  
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
LRM005        MOVE                                                              
LRM005        'DB2 SELECT ERROR ON "GET-HIST-TRNFR" - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                   2
      *                                                                         
      *--------------------------------------------------------------*          
      *     SAVE HISTORY ASSETS DATA IN TEMP STORAGE QUEUE           *          
      *--------------------------------------------------------------*          
       0420-SAVE-HIST-ASSETS-IN-TS.                                     15960000
           PERFORM 0530-OPEN-HIST-ASSET-CSR.                                    
           MOVE ZERO  TO SUB.                                                   
           MOVE SPACE TO TS-ASSET-AREA.                                         
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           PERFORM  UNTIL WS-NO-MORE-DATA                                       
              PERFORM 0540-FETCH-HIST-ASSET-CSR                                 
              IF ACAT25IO-NORMAL                                                
                 ADD +1 TO SUB                                                  
                 PERFORM 0330-CREATE-ASSET-TS                                   
              END-IF                                                            
           END-PERFORM.                                                         
           IF SUB > 0 AND SUB < 3                                               
              PERFORM 7220-WRITE-ASSET-TSQ                                      
              MOVE ASSET-ITEM TO TWA-MAX-ASSET-PAGE-NUM                         
           END-IF.                                                              
           PERFORM 0550-CLOSE-HIST-ASSET-CSR.                                   
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN ACTIVE ASSET CURSOR TABLE                      *          
      *--------------------------------------------------------------*          
       0500-OPEN-ASSET-CURSOR.                                                  
           SET ACAT25-OPN-ASSET-CSR TO TRUE.                                    
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 OPEN ERROR ON ACTIVE ASSET CURSOR - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *         FETCH ACTIVE ASSET CURSOR TABLE                      *          
      *--------------------------------------------------------------*          
       0510-FETCH-ASSET-CURSOR.                                                 
           SET ACAT25-FET-ASSET-CSR TO TRUE.                                    
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0520-CLOSE-ASSET-CURSOR                                   
LRM005        MOVE                                                              
LRM005        'DB2 FETCH ERROR ON ACTIVE ASSET CURSOR - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLOSE ACTIVE ASSET CURSOR TABLE                      *          
      *--------------------------------------------------------------*          
       0520-CLOSE-ASSET-CURSOR.                                                 
           SET ACAT25-CLO-ASSET-CSR TO TRUE.                                    
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 CLOSE ERROR ON ACTIVE ASSET CURSOR - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN HISTORY ASSET CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       0530-OPEN-HIST-ASSET-CSR.                                                
           SET ACAT25-OPN-HST-ASSET-CSR TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 OPEN ERROR ON HISTORY ASSET CURSOR - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *         FETCH HISTORY ASSET CURSOR TABL                      *          
      *--------------------------------------------------------------*          
       0540-FETCH-HIST-ASSET-CSR.                                               
           SET ACAT25-FET-HST-ASSET-CSR TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0550-CLOSE-HIST-ASSET-CSR                                 
LRM005        MOVE                                                              
LRM005        'DB2 FETCH ERROR ON HISTORY ASSET CURSOR - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLOSE HISTORY ASSET CURSOR TABLE                     *          
      *--------------------------------------------------------------*          
       0550-CLOSE-HIST-ASSET-CSR.                                               
           SET ACAT25-CLO-HST-ASSET-CSR TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 CLOSE ERROR ON HISTORY ASSET CURSOR - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         DB2 ERROR ABEND AND DISPLAY                          *          
      *--------------------------------------------------------------*          
       0599-SEND-DB2-ERROR-MSG.                                                 
           SET WK-ERROR TO TRUE.                                                
           MOVE  ACAT25-SQLCODE   TO WK-ERR-SQLCODE.                            
           MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG.                                
           PERFORM 9000-ERROR-RTN.                                              
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        OPEN PENDING TRNFR CURSOR TABLE (ORDER BY ACAT#)      *          
      *--------------------------------------------------------------*          
       0600-OPEN-PEND-TRNFR-BY-ACAT.                                            
           SET ACAT25-OPN-TRN-ACAT-CSR TO TRUE.                                 
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 OPEN ERROR ON PEND TRNFR BY ACAT - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *       FETCH PENDING TRNFR CURSOR TABLE (ORDER BY ACAT#)      *          
      *--------------------------------------------------------------*          
       0601-FETCH-PEND-TRNFR-BY-ACAT.                                           
           SET ACAT25-FET-TRN-ACAT-CSR TO TRUE.                                 
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0602-CLOSE-PEND-TRNFR-BY-ACAT                             
LRM005        MOVE                                                              
LRM005        'DB2 FETCH ERROR ON PEND TRNFR BY ACAT - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *       CLOSE PENDING TRNFR CURSOR TABLE (ORDER BY ACAT#)      *          
      *--------------------------------------------------------------*          
       0602-CLOSE-PEND-TRNFR-BY-ACAT.                                           
           SET ACAT25-CLO-TRN-ACAT-CSR TO TRUE.                                 
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 CLOSE ERROR ON PEND TRNFR BY ACAT - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        OPEN PENDING TRNFR CURSOR TABLE (ORDER BY BRANCH)     *          
      *--------------------------------------------------------------*          
       0610-OPEN-PEND-TRNFR-BY-ENGIN.                                           
           SET ACAT25-OPN-TRN-ENGIN-CSR TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 OPEN ERROR ON PEND TRNFR BY BRACH - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *       FETCH PENDING TRNFR CURSOR TABLE (ORDER BY BRANCH)     *          
      *--------------------------------------------------------------*          
       0611-FETCH-PEND-TRNFR-BY-ENGIN.                                          
           SET ACAT25-FET-TRN-ENGIN-CSR TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0612-CLOSE-PEND-TRNFR-BY-ENGIN                            
LRM005        MOVE                                                              
LRM005        'DB2 FETCH ERROR ON PEND TRNFR BY BRACH - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *       CLOSE PENDING TRNFR CURSOR TABLE (ORDER BY BRANCH)     *          
      *--------------------------------------------------------------*          
       0612-CLOSE-PEND-TRNFR-BY-ENGIN.                                          
           SET ACAT25-CLO-TRN-ENGIN-CSR TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 CLOSE ERROR ON PEND TRNFR BY BRACH - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        OPEN HISTORY TRNFR CURSOR TABLE (ORDER BY ACAT#)      *          
      *--------------------------------------------------------------*          
       0620-OPEN-HIST-TRNFR-BY-ACAT.                                            
           SET ACAT25-OPN-HTRN-ACAT-CSR TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 OPEN ERROR ON HIST TRNFR BY ACAT - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *       FETCH HISTORY TRNFR CURSOR TABLE (ORDER BY ACAT#)      *          
      *--------------------------------------------------------------*          
       0621-FETCH-HIST-TRNFR-BY-ACAT.                                           
           SET ACAT25-FET-HTRN-ACAT-CSR TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0622-CLOSE-HIST-TRNFR-BY-ACAT                             
LRM005        MOVE                                                              
LRM005        'DB2 FETCH ERROR ON HIST TRNFR BY ACAT - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *       CLOSE HSITORY TRNFR CURSOR TABLE (ORDER BY ACAT#)      *          
      *--------------------------------------------------------------*          
       0622-CLOSE-HIST-TRNFR-BY-ACAT.                                           
           SET ACAT25-CLO-HTRN-ACAT-CSR TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 CLOSE ERROR ON HIST TRNFR BY ACAT - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        OPEN HISTORY TRNFR CURSOR TABLE (ORDER BY BRANCH)     *          
      *--------------------------------------------------------------*          
       0630-OPEN-HIST-TRNFR-BY-ENGIN.                                           
           SET ACAT25-OPN-HTRN-ENGIN-CSR TO TRUE.                               
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 OPEN ERROR ON HIST TRNFR BY BRANCH - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *       FETCH HISTORY TRNFR CURSOR TABLE (ORDER BY BRANCH)     *          
      *--------------------------------------------------------------*          
       0631-FETCH-HIST-TRNFR-BY-ENGIN.                                          
           SET ACAT25-FET-HTRN-ENGIN-CSR TO TRUE.                               
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0632-CLOSE-HIST-TRNFR-BY-ENGIN                            
LRM005        MOVE                                                              
LRM005        'DB2 FETCH ERROR ON HIST TRNFR BY BRANCH - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *       CLOSE HSITORY TRNFR CURSOR TABLE (ORDER BY BRANCH)     *          
      *--------------------------------------------------------------*          
       0632-CLOSE-HIST-TRNFR-BY-ENGIN.                                          
           SET ACAT25-CLO-HTRN-ENGIN-CSR TO TRUE.                               
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 CLOSE ERROR ON HIST TRNFR BY BRANCH - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      OPEN PENDING TRNFR CURSOR TABLE ORDER BY ACAT# (VER 2)  *          
      *--------------------------------------------------------------*          
       0640-OPEN-PEND-BY-ACAT2.                                                 
           SET ACAT25-OPN-TRN-ACAT-CSR2 TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 OPEN ERROR ON PEND TRNFR BY ACAT2- CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *     FETCH PENDING TRNFR CURSOR TABLE ORDER BY ACAT# (VER 2)  *          
      *--------------------------------------------------------------*          
       0641-FETCH-PEND-BY-ACAT2.                                                
           SET ACAT25-FET-TRN-ACAT-CSR2 TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0642-CLOSE-PEND-BY-ACAT2                                  
LRM005        MOVE                                                              
LRM005        'DB2 FECTH ERROR ON PEND TRNFR BY ACAT2 - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *    CLOSE PENDING TRNFR CURSOR TABLE ORDER BY ACAT# (VER 2)   *          
      *--------------------------------------------------------------*          
       0642-CLOSE-PEND-BY-ACAT2.                                                
           SET ACAT25-CLO-TRN-ACAT-CSR2 TO TRUE.                                
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 CLOSE ERROR ON PEND TRNFR BY ACAT2 - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *    OPEN PENDING TRNFR CURSOR TABLE ORDER BY BRANCH (VER 2)   *          
      *--------------------------------------------------------------*          
       0643-OPEN-PEND-BY-ENGIN2.                                                
           SET ACAT25-OPN-TRN-ENGIN-CSR2 TO TRUE.                               
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 OPEN ERROR ON PEND TRNFR BY BRACH2- CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *   FETCH PENDING TRNFR CURSOR TABLE ORDER BY BRANCH (VER 2)   *          
      *--------------------------------------------------------------*          
       0644-FETCH-PEND-BY-ENGIN2.                                               
           SET ACAT25-FET-TRN-ENGIN-CSR2 TO TRUE.                               
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0645-CLOSE-PEND-BY-ENGIN2                                 
LRM005        MOVE                                                              
LRM005        'DB2 FETCH ERROR ON PEND TRNFR BY BRACH2 - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *   CLSOE PENDING TRNFR CURSOR TABLE ORDER BY BRANCH (VER 2)   *          
      *--------------------------------------------------------------*          
       0645-CLOSE-PEND-BY-ENGIN2.                                               
           SET ACAT25-CLO-TRN-ENGIN-CSR2 TO TRUE.                               
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 CLOSE ERROR ON PEND TRNFR BY BRACH2 - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *    OPEN HISTORY TRNFR CURSOR TABLE ORDER BY ACAT# (VER 2)    *          
      *--------------------------------------------------------------*          
       0650-OPEN-HIST-BY-ACAT2.                                                 
           SET ACAT25-OPN-HTRN-ACAT-CSR2 TO TRUE.                               
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 OPEN ERROR ON HIST TRNFR BY ACAT2 - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *   FETCH HISTORY TRNFR CURSOR TABLE ORDER BY ACAT# (VER 2)    *          
      *--------------------------------------------------------------*          
       0651-FETCH-HIST-BY-ACAT2.                                                
           SET ACAT25-FET-HTRN-ACAT-CSR2 TO TRUE.                               
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0652-CLOSE-HIST-BY-ACAT2                                  
LRM005        MOVE                                                              
LRM005        'DB2 FETCH ERROR ON HIST TRNFR BY ACAT2 - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *   CLOSE HISTORY TRNFR CURSOR TABLE ORDER BY ACAT# (VER 2)    *          
      *--------------------------------------------------------------*          
       0652-CLOSE-HIST-BY-ACAT2.                                                
           SET ACAT25-CLO-HTRN-ACAT-CSR2 TO TRUE.                               
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 CLOSE ERROR ON HIST TRNFR BY ACAT2 - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *    OPEN HISTORY TRNFR CURSOR TABLE ORDER BY BRANCH (VER 2)   *          
      *--------------------------------------------------------------*          
       0653-OPEN-HIST-BY-ENGIN2.                                                
           SET ACAT25-OPN-HTRN-ENGIN-CSR2 TO TRUE.                              
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 OPEN ERROR ON HIST TRNFR BY BRANCH2 - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *   FETCH HISTORY TRNFR CURSOR TABLE ORDER BY BRANCH (VER 2)   *          
      *--------------------------------------------------------------*          
       0654-FETCH-HIST-BY-ENGIN2.                                               
           SET ACAT25-FET-HTRN-ENGIN-CSR2 TO TRUE.                              
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0655-CLOSE-HIST-BY-ENGIN2                                 
LRM005        MOVE                                                              
LRM005       'DB2 FETCH ERROR ON HIST TRNFR BY BRANCH2 - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *   CLOSE HISTORY TRNFR CURSOR TABLE ORDER BY BRANCH (VER 2)   *          
      *--------------------------------------------------------------*          
       0655-CLOSE-HIST-BY-ENGIN2.                                               
           SET ACAT25-CLO-HTRN-ENGIN-CSR2 TO TRUE.                              
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005       'DB2 CLOSE ERROR ON HIST TRNFR BY BRANCH2 - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *    OPEN PENDING TRNFR CURSOR TABLE IN DESCEND ORDER BY ACAT# *          
      *--------------------------------------------------------------*          
       0660-OPEN-PEND-BY-ACAT-D.                                                
           SET ACAT25-OPN-TRN-ACAT-CSR-D TO TRUE.                               
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 OPEN ERR ON TRNFR DESCEND BY ACAT - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *   FETCH PENDING TRNFR CURSOR TABLE IN DESCEND ORDER BY ACAT# *          
      *--------------------------------------------------------------*          
       0661-FETCH-PEND-BY-ACAT-D.                                               
           SET ACAT25-FET-TRN-ACAT-CSR-D TO TRUE.                               
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0662-CLOSE-PEND-BY-ACAT-D                                 
LRM005        MOVE                                                              
LRM005        'DB2 FETCH ERR ON TRNFR DESCEND BY ACAT - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE PENDING TRNFR CURSOR TABLE IN DESCEND ORDER BY ACAT#  *          
      *--------------------------------------------------------------*          
       0662-CLOSE-PEND-BY-ACAT-D.                                               
           SET ACAT25-CLO-TRN-ACAT-CSR-D TO TRUE.                               
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 CLOSE ERR ON TRNFR DESCEND BY ACAT - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *  OPEN PENDING TRNFR CURSOR TABLE IN DESCEND ORDER BY BR ACCT *          
      *--------------------------------------------------------------*          
       0670-OPEN-PEND-BY-ENGIN-D.                                               
           SET ACAT25-OPN-TRN-ENGIN-CSR-D TO TRUE.                              
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 OPEN ERR ON TRNFR DESCEND BY BRCH - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      * FETCH PENDING TRNFR CURSOR TABLE IN DESCEND ORDER BY BR ACCT *          
      *--------------------------------------------------------------*          
       0671-FETCH-PEND-BY-ENGIN-D.                                              
           SET ACAT25-FET-TRN-ENGIN-CSR-D TO TRUE.                              
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0672-CLOSE-PEND-BY-ENGIN-D                                
LRM005        MOVE                                                              
LRM005        'DB2 FETCH ERR ON TRNFR DESCEND BY BRCH - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      * CLOSE PENDING TRNFR CURSOR TABLE IN DESCEND ORDER BY BR ACCT *          
      *--------------------------------------------------------------*          
       0672-CLOSE-PEND-BY-ENGIN-D.                                              
           SET ACAT25-CLO-TRN-ENGIN-CSR-D TO TRUE.                              
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 CLOSE ERR ON TRNFR DESCEND BY BRCH - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   OPEN HISTORY TRNFR CURSOR TABLE IN DESCEND ORDER BY ACAT#  *          
      *--------------------------------------------------------------*          
       0680-OPEN-HIST-BY-ACAT-D.                                                
           SET ACAT25-OPN-HTRN-ACAT-CSR-D TO TRUE.                              
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 OPEN ERR ON HTRNFR DESCEND BY ACAT - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH HISTORY TRNFR CURSOR TABLE IN DESCEND ORDER BY ACAT#  *          
      *--------------------------------------------------------------*          
       0681-FETCH-HIST-BY-ACAT-D.                                               
           SET ACAT25-FET-HTRN-ACAT-CSR-D TO TRUE.                              
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0682-CLOSE-HIST-BY-ACAT-D                                 
LRM005        MOVE                                                              
LRM005        'DB2 FETCH ERR ON HTRNFR DESCEND BY ACAT - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE HISTORY TRNFR CURSOR TABLE IN DESCEND ORDER BY ACAT#  *          
      *--------------------------------------------------------------*          
       0682-CLOSE-HIST-BY-ACAT-D.                                               
           SET ACAT25-CLO-HTRN-ACAT-CSR-D TO TRUE.                              
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 CLOSE ERR ON HTRNFR DESCEND BY ACAT - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   OPEN HISTORY TRNFR CURSOR TABLE IN DESCEND ORDER BY BR AC  *          
      *--------------------------------------------------------------*          
       0690-OPEN-HIST-BY-ENGIN-D.                                               
           SET ACAT25-OPN-HTRN-ENGIN-CSR-D TO TRUE.                             
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 OPEN ERR ON HTRNFR DESCEND BY BR - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH HISTORY TRNFR CURSOR TABLE IN DESCEND ORDER BY BR AC  *          
      *--------------------------------------------------------------*          
       0691-FETCH-HIST-BY-ENGIN-D.                                              
           SET ACAT25-FET-HTRN-ENGIN-CSR-D TO TRUE.                             
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT25IO-NOT-FOUND                                                
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0692-CLOSE-HIST-BY-ENGIN-D                                
LRM005        MOVE                                                              
LRM005        'DB2 FETCH ERR ON HTRNFR DESCEND BY BR - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE HISTORY TRNFR CURSOR TABLE IN DESCEND ORDER BY BR AC  *          
      *--------------------------------------------------------------*          
       0692-CLOSE-HIST-BY-ENGIN-D.                                              
           SET ACAT25-CLO-HTRN-ENGIN-CSR-D TO TRUE.                             
           PERFORM 7600-LINK-TO-ACAT25DB.                                       
           IF ACAT25IO-ERROR                                                    
LRM005        MOVE                                                              
LRM005        'DB2 CLOSE ERR ON HTRNFR DESCEND BY BR - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0599-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        MOVE DATA FROM DATABASE TO TRANSFER MAP AREA          *          
      *--------------------------------------------------------------*          
       0700-SETUP-TFR-SCREEN.                                                   
           IF TWA-PEND-TRNFR                                                    
              MOVE 'PENDING' TO MTITLEO TWA-MAP-TITLE                           
           ELSE                                                                 
           IF TWA-HIST-TRNFR                                                    
              MOVE 'HISTORY' TO MTITLEO TWA-MAP-TITLE.                          
                                                                                
           MOVE ACAT25-TFR-BRANCH     TO MBRO     TWA-MAP-BR.                   
           MOVE ACAT25-TFR-ACCOUNT    TO MACO     TWA-MAP-AC.                   
           MOVE ACAT25-TFR-RR         TO MRRO     TWA-MAP-RR.                   
           MOVE ACAT25-TFR-NM1        TO MNAME1O  TWA-MAP-NAME1.                
           MOVE ACAT25-TFR-NM2        TO MNAME2O  TWA-MAP-NAME2.                
           MOVE ACAT25-TFR-ACAT       TO MACATO   TWA-MAP-ACAT.                 
           MOVE ACAT25-TFR-TFR-TYPE   TO MTFRO    TWA-MAP-TFR.                  
                                                                                
           IF ACAT25-TFR-DSTBN = 'D'                                            
              MOVE 'DLV'               TO MRDO    TWA-MAP-RD                    
              MOVE ACAT25-TFR-RCV-NBR  TO MCBKRO  TWA-MAP-CBKR                  
           ELSE                                                                 
           IF ACAT25-TFR-DSTBN = 'R'                                            
              MOVE 'RCV'               TO MRDO    TWA-MAP-RD                    
              MOVE ACAT25-TFR-DLVR-NBR TO MCBKRO  TWA-MAP-CBKR.                 
                                                                                
           EVALUATE  ACAT25-TFR-STTS                                            
              WHEN '100'    MOVE 'REQ' TO WS-STATUS-STAT                        
              WHEN '110'    MOVE 'RQA' TO WS-STATUS-STAT                        
              WHEN '120'    MOVE 'RAP' TO WS-STATUS-STAT                        
              WHEN '130'    MOVE 'RQP' TO WS-STATUS-STAT                        
              WHEN '140'    MOVE 'RQR' TO WS-STATUS-STAT                        
              WHEN '200'    MOVE 'REV' TO WS-STATUS-STAT                        
              WHEN '210'    MOVE 'RVA' TO WS-STATUS-STAT                        
              WHEN '220'    MOVE 'RVE' TO WS-STATUS-STAT                        
              WHEN '230'    MOVE 'RVX' TO WS-STATUS-STAT                        
              WHEN '300'    MOVE 'STP' TO WS-STATUS-STAT                        
              WHEN '310'    MOVE 'STC' TO WS-STATUS-STAT                        
              WHEN '400'    MOVE 'CLP' TO WS-STATUS-STAT                        
              WHEN '600'    MOVE 'REJ' TO WS-STATUS-STAT                        
              WHEN OTHER                                                        
                MOVE ACAT25-TFR-STTS   TO WS-STATUS-STAT                        
           END-EVALUATE.                                                        
                                                                                
           MOVE ACAT25-TFR-DAYS-STTS  TO WS-STATUS-DAYS-N.                      
           MOVE WS-STATUS             TO MSTATO   TWA-MAP-STAT.                 
                                                                                
           IF ACAT25-TFR-STTLM-DT = '0001-01-01'                                
              MOVE SPACE TO MSDO TWA-MAP-SD                                     
           ELSE                                                                 
              MOVE  ACAT25-TFR-STTLM-DT (6:2) TO WS-STTLM-OUT-MM                
              MOVE  ACAT25-TFR-STTLM-DT (9:2) TO WS-STTLM-OUT-DD                
              MOVE  ACAT25-TFR-STTLM-DT (3:2) TO WS-STTLM-OUT-YY                
              MOVE  WS-STTLM-DT-OUT TO MSDO TWA-MAP-SD                          
           END-IF.                                                              
                                                                                
           MOVE ACAT25-TFR-ACCT-TYPE  TO TWA-ACCT-TYPE.                         
           IF ACAT25-TFR-DSTBN = 'D'                                            
              MOVE ACAT25-TFR-RCV-ACCT  TO TWA-CONT-ACCT                        
           ELSE                                                                 
           IF ACAT25-TFR-DSTBN = 'R'                                            
              MOVE ACAT25-TFR-DLVR-ACCT TO TWA-CONT-ACCT.                       
                                                                                
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        MOVE ASSET DATA FROM TS QUEUE TO MAP AREA             *          
      *--------------------------------------------------------------*          
       0710-SETUP-ASSET-SCREEN.                                                 
           IF TS-ASSET-SCR (SUB) = SPACE                                        
              GO TO 0710-EXIT.                                                  
                                                                                
           MOVE TS-CTGRY   (SUB)                                                
                TO CTGRY-O (SUB) TWA-MAP-CTGRY (SUB).                           
           MOVE TS-SLOC    (SUB)                                                
                TO SLOC-O  (SUB) TWA-MAP-SLOC  (SUB).                           
           MOVE TS-DESC    (SUB)                                                
                TO DESC-O  (SUB) TWA-MAP-DESC  (SUB).                           
           MOVE TS-AMT (SUB)  TO AMT-O (SUB).                                   
           MOVE AMT-I  (SUB)  TO TWA-MAP-AMT (SUB).                             
           IF TS-SLOC (SUB) = '40'                                              
              IF TS-CS-MG-SH (SUB) = 'C'                                        
                 MOVE '(CASH)'   TO SEC-O (SUB) TWA-MAP-SEC (SUB)               
              ELSE                                                              
              IF TS-CS-MG-SH (SUB) = 'M'                                        
                 MOVE '(MARGIN)' TO SEC-O (SUB) TWA-MAP-SEC (SUB)               
              ELSE                                                              
              IF TS-CS-MG-SH (SUB) = 'S'                                        
                 MOVE '(SHORT)'  TO SEC-O (SUB) TWA-MAP-SEC (SUB)               
              END-IF END-IF END-IF                                              
           ELSE                                                                 
           IF TS-SLOC (SUB) = '45'                                              
              MOVE '(MEMO)'      TO SEC-O (SUB) TWA-MAP-SEC (SUB)               
           ELSE                                                                 
              MOVE TS-SEC (SUB)  TO SEC-O (SUB) TWA-MAP-SEC (SUB)               
           END-IF.                                                              
                                                                                
           MOVE TS-ASSET-CMNT (SUB) TO TWA-ASSET-CMNT (SUB).                    
ET0001     IF TWA-MAP-TFR = 'FUL' OR 'PTR' OR 'PTD' OR 'RCR'                    
LRM004                            OR 'RCL'                                      
ET0001                                                                          
ET0001        IF TWA-MAP-SLOC (SUB) = '10' OR '15' OR '20' OR                   
ET0001                                '25' OR '50'                              
ET0001                                                                          
ET0001            MOVE  SPACE              TO ACT-O       (SUB)                 
ET0001                                        TWA-MAP-ACT (SUB)                 
ET0001            MOVE  TS-CAGE-TAG (SUB)  TO TAG-O       (SUB)                 
ET0001                                        TWA-MAP-TAG (SUB)                 
ET0001            MOVE  ATT-ASKIP          TO TAGDSC-A    (SUB)                 
ET0001                                        TAG-A       (SUB)                 
ET0001            IF TWA-HIST-TRNFR                                             
LRM004               IF (TWA-MAP-RD = 'DLV' AND TWA-MAP-TFR NOT = 'RCL')        
LRM004               OR (TWA-MAP-RD = 'RCV' AND TWA-MAP-TFR     = 'RCL')        
ET0001                  MOVE ATT-UNPROT  TO ACT-A (SUB)                         
ET0001               ELSE                                                       
ET0001                  MOVE ATT-ASKIP   TO ACT-A (SUB)                         
ET0001               END-IF                                                     
ET0001            ELSE                                                          
ET0001               MOVE ATT-ASKIP  TO ACT-A (SUB)                             
ET0001            END-IF                                                        
ET0001        END-IF                                                            
ET0001     END-IF.                                                              
       0710-EXIT.                           EXIT.                               
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *        RESET MAP UPON RETURNING FROM MARGIN                    *        
      *----------------------------------------------------------------*        
       0800-RESET-SCREEN.                                                       
           IF TWA-PEND-TRNFR                                                    
              MOVE 'PENDING' TO MTITLEO TWA-MAP-TITLE                           
           ELSE                                                                 
           IF TWA-HIST-TRNFR                                                    
              MOVE 'HISTORY' TO MTITLEO TWA-MAP-TITLE.                          
                                                                                
           MOVE TWA-MAP-BR      TO MBRO.                                        
           MOVE TWA-MAP-AC      TO MACO.                                        
           MOVE TWA-MAP-RR      TO MRRO.                                        
           MOVE TWA-MAP-NAME1   TO MNAME1O.                                     
           MOVE TWA-MAP-NAME2   TO MNAME2O.                                     
           MOVE TWA-MAP-ACAT    TO MACATO.                                      
           MOVE TWA-MAP-TFR     TO MTFRO.                                       
           MOVE TWA-MAP-RD      TO MRDO.                                        
           MOVE TWA-MAP-CBKR    TO MCBKRO.                                      
           MOVE TWA-MAP-SD      TO MSDO.                                        
           MOVE TWA-MAP-STAT    TO MSTATO.                                      
                                                                                
           PERFORM VARYING  SUB FROM 1 BY 1  UNTIL SUB > 3                      
              IF TWA-MAP-ASSETS (SUB) > SPACE                                   
                 MOVE TWA-MAP-SEC   (SUB)  TO SEC-O   (SUB)                     
                 MOVE TWA-MAP-CTGRY (SUB)  TO CTGRY-O (SUB)                     
                 MOVE TWA-MAP-SLOC  (SUB)  TO SLOC-O  (SUB)                     
                 MOVE TWA-MAP-DESC  (SUB)  TO DESC-O  (SUB)                     
                 MOVE TWA-MAP-AMT   (SUB)  TO AMT-I   (SUB)                     
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
******* THE FOLLOWING MAP FIELDS ARE ON THE BOTTOM (LINES 23,24)                
           MOVE TWA-MAP-MMBR    TO MMBRO.                                       
           MOVE TWA-MAP-MMAC    TO MMACO.                                       
           MOVE TWA-MAP-MMRR    TO MMRRO.                                       
           MOVE TWA-MAP-MMTFR   TO MMTFRO.                                      
           MOVE TWA-MAP-MMRD    TO MMRDO.                                       
           MOVE TWA-MAP-MMBKR   TO MMBKRO.                                      
           MOVE TWA-MAP-MMSTAT  TO MMSTATO.                                     
           MOVE TWA-MAP-MMSD    TO MMSDO.                                       
                                                                                
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *        CONTINUE PROCESS AFTER FIRST TIME ENTRY                 *        
      *----------------------------------------------------------------*        
       0900-CONTINUE-PROCESS.                                                   
           PERFORM 8500-RECEIVE-MAP.                                            
           PERFORM 7000-READ-TSQ-RTN.                                           
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           SET DATA-ONLY TO TRUE.                                               
           EVALUATE TRUE                                                        
                WHEN EIBAID = DFHPF11 OR DFHCLEAR                               
                     PERFORM 8700-RETURN-CONTROL-RTN                            
                WHEN EIBAID = DFHPF10 OR DFHPF12                                
                     PERFORM 8800-RETURN-TO-CICS                                
                WHEN EIBAID = DFHENTER                                          
                     PERFORM 1000-ENTER-KEY                                     
                WHEN EIBAID = DFHPF3                                            
                     PERFORM 3000-JUMP-TO-MARGIN                                
                WHEN EIBAID = DFHPF6                                            
                     PERFORM 4000-JUMP-TO-MFC                                   
                WHEN EIBAID = DFHPF7                                            
                     PERFORM 6000-PREV-TFR-PAGE                                 
                WHEN EIBAID = DFHPF8                                            
                     PERFORM 6100-NEXT-TFR-PAGE                                 
                WHEN EIBAID = DFHPA1                                            
                     PERFORM 6200-NEXT-ASSET-PAGE                               
                WHEN EIBAID = DFHPA2                                            
                     PERFORM 6300-PREV-ASSET-PAGE                               
                WHEN OTHER                                                      
                     SET  WK-ERROR  TO TRUE                                     
                     MOVE LOW-VALUE TO ACAT25MO                                 
                     MOVE 'ERROR FUNCTION KEY'                                  
                       TO SYSTEM-MSG                                            
                     PERFORM 9000-ERROR-RTN                                     
           END-EVALUATE.                                                        
           MOVE -1 TO MNEXTL.                                                   
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 8100-SEND-MAP-DATA-ONLY.                                     
           PERFORM 8800-RETURN-TO-CICS.                                         
      *                                                                         
      *----------------------------------------------------------------*        
      *           ENTER KEY ROUTINE                                    *        
      *----------------------------------------------------------------*        
       1000-ENTER-KEY.                                                          
           MOVE SPACE  TO WK-ERROR-SW                                           
ET0001                    WK-SEARCH-ENTERED-SW                                  
                          WK-MSG-ON-SW.                                         
           PERFORM 1100-TWA-AREA-SAVE.                                          
           IF TWA-MAP-NEXT > SPACES                                             
              PERFORM 1200-NEXT-SELECTION                                       
           END-IF.                                                              
           PERFORM 1300-SEARCH-CHECK.                                           
ET0001     IF NOT WK-SEARCH-ENTERED                                             
ET0001        IF TWA-HIST-TRNFR                                                 
ET0001           PERFORM 1500-ACTION-ENTRY-RTN                                  
ET0001        END-IF                                                            
ET0001     END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *        SAVE USER INPUT ENTRY DATA TO TWA MAP AREA              *        
      *----------------------------------------------------------------*        
       1100-TWA-AREA-SAVE.                                                      
           IF MSACATL > 0                                                       
              IF MSACATO = TWA-MAP-SACAT                                        
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MSACATO TO TWA-MAP-SACAT                                  
              END-IF                                                            
           ELSE                                                                 
           IF MSACATA = ERASE-KEY                                               
              MOVE SPACE TO TWA-MAP-SACAT.                                      
           MOVE ATT-UNPROT TO MSACATA.                                          
      *                                                                         
           IF MNEXTL > 0                                                        
              IF MNEXTO = TWA-MAP-NEXT                                          
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MNEXTO TO TWA-MAP-NEXT                                    
              END-IF                                                            
           ELSE                                                                 
           IF MNEXTA = ERASE-KEY                                                
              MOVE SPACE TO TWA-MAP-NEXT.                                       
           IF TWA-MAP-NEXT = '0'                                                
              MOVE SPACE TO MNEXTO                                              
                            TWA-MAP-NEXT.                                       
           MOVE ATT-UNPROT TO MNEXTA.                                           
      *                                                                         
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
      *                                                                         
      *----------------------------------------------------------------*        
      *     IF "NEXT" FIELD IS ENTERED, XCTL TO OTHER SCREEN           *        
      *----------------------------------------------------------------*        
       1200-NEXT-SELECTION.                                                     
           MOVE TWA-MAP-NEXT   TO WS-ACAT-NEXT  ACAT-INP-SEL.                   
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
              PERFORM 1210-SCREEN-SECURITY-CHECK                                
              IF WS-JUMP-NOT-AUTHORIZED                                         
                 MOVE -1             TO MNEXTL                                  
                 MOVE ATT-UNPROT-BRT TO MNEXTA                                  
                 IF NOT WK-ERROR                                                
                    SET  WK-ERROR   TO TRUE                                     
                    MOVE TWA-MAP-NEXT TO WS-NOT-AUTHORIZED-NEXT                 
                    MOVE WS-NOT-AUTHORIZED-MSG TO SYSTEM-MSG                    
                 END-IF                                                         
              ELSE                                                              
                 MOVE SPACE TO ACAT-CONTROL-NBR ACAT-BR ACAT-AC                 
                 MOVE TWA-MAP-MMBR   TO ACAT-INP-BRANCH                         
                 MOVE TWA-MAP-MMAC   TO ACAT-INP-ACCOUNT                        
                 MOVE TWA-MAP-MMRR   TO ACAT-INP-RR                             
                 MOVE TWA-MAP-MMTFR  TO ACAT-INP-TFR-TYP                        
                 MOVE TWA-MAP-MMRD   TO ACAT-INP-RCV-DEL                        
                 MOVE TWA-MAP-MMBKR  TO ACAT-INP-CONTRA-BKR                     
                 MOVE TWA-MAP-MMSTAT TO ACAT-INP-STATUS                         
                 MOVE TWA-MAP-MMSD   TO ACAT-INP-STTL-DT                        
                 MOVE 'ACAT25PD'     TO ACAT-CALLING-PROG-NAME                  
                 MOVE  TWA-MAP-NEXT  TO ACAT-NEXT                               
                 PERFORM 7500-XCTL-TO-DETAIL-PROG.                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *      SCREEN SECURITY CHECK                                     *        
      *----------------------------------------------------------------*        
       1210-SCREEN-SECURITY-CHECK.                                              
           MOVE SPACE TO WS-JUMP-AUTHORIZED-SW.                                 
           IF  ACAT-SUPER-SIGN-ON-UPDATE                                        
                OR                                                              
               ACAT-SUPER-SIGN-ON-BROWSE                                        
                OR                                                              
               ACAT-JUMP-ANYWHERE                                               
                OR                                                              
               ACAT-NEXT = '$'                                                  
                CONTINUE                                                        
           ELSE                                                                 
ET0001**       MOVE TWA-MAP-NEXT TO ACAT-SCREEN-IND                             
ET0001         MOVE WS-ACAT-NEXT TO ACAT-SCREEN-IND                             
               SET ACAT-UPDATE-MODE TO TRUE                                     
               MOVE SPACES    TO SECLINK-LIST                                   
               MOVE '2'       TO SECLINK-ACTION-CODE                            
               MOVE 'SCON'    TO SECLINK-TYPE                                   
               MOVE ACAT-SEC-LIT TO SECLINK-ITEM                                
               PERFORM CALL-SECLINK-RTN                                         
               IF SECLINK-RETURN-CODE = '00' OR '20'                            
                  CONTINUE                                                      
               ELSE                                                             
                  SET WS-JUMP-NOT-AUTHORIZED TO TRUE                            
               END-IF                                                           
           END-IF.                                                              
      *                                                                         
      *----------------------------------------------------------------*        
      *      SEARCH BY ACAT#  VS  SEARCH BY SEARCH ENGINE              *        
      *----------------------------------------------------------------*        
       1300-SEARCH-CHECK.                                                       
           IF  TWA-MAP-SACAT = SPACE                                            
           AND TWA-MAP-SEARCH = SPACE                                           
              IF TWA-SRCH-BY-ACAT                                               
                 PERFORM 1320-SEARCH-BY-ACAT                                    
              ELSE                                                              
              IF TWA-SRCH-BY-ENGINE                                             
                 PERFORM 1360-SEARCH-BY-SEARCH-ENGINE                           
              END-IF                                                            
           ELSE                                                                 
           IF  TWA-MAP-SACAT > SPACE                                            
           AND TWA-MAP-SEARCH = SPACE                                           
              SET TWA-SRCH-BY-ACAT TO TRUE                                      
              PERFORM 1320-SEARCH-BY-ACAT                                       
           ELSE                                                                 
           IF  TWA-MAP-SACAT = SPACE                                            
           AND TWA-MAP-SEARCH > SPACE                                           
              SET TWA-SRCH-BY-ENGINE TO TRUE                                    
              PERFORM 1350-VALIDATE-SRCH-ENGINE                                 
              IF NOT WK-ERROR                                                   
                 PERFORM 1360-SEARCH-BY-SEARCH-ENGINE                           
              END-IF                                                            
           ELSE                                                                 
           IF  TWA-MAP-SACAT > SPACE                                            
           AND TWA-MAP-SEARCH > SPACE                                           
              MOVE -1 TO MSACATL                                                
              MOVE ATT-UNPROT-BRT                                               
                TO MSACATA                                                      
              MOVE ATT-UNPROT-BRT                                               
                TO MMBRA MMACA MMRRA MMTFRA MMRDA MMBKRA MMSTATA MMSDA          
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'ENTER EITHER SRCH ENGINE FLDS (BR, AC, AND ETC.)         
      -               'OR "SEARCH BY ACAT#" FLD'                                
                   TO  SYSTEM-MSG                                               
              END-IF.                                                           
      *                                                                         
      *----------------------------------------------------------------*        
      *          TRANSFER SEARCH BY ACAT# ROUTINE                      *        
      *----------------------------------------------------------------*        
       1320-SEARCH-BY-ACAT.                                                     
           IF TWA-MAP-SACAT = TWA-PREV-SACAT                                    
              CONTINUE                                                          
           ELSE                                                                 
ET0001        SET WK-SEARCH-ENTERED TO TRUE                                     
              MOVE TWA-MAP-SACAT TO WS-SAVE-SRCH-ACAT                           
              PERFORM 2000-INITIALIZE-FOR-NEW-SEARCH                            
              MOVE WK-CLT        TO ACAT25-PASS-CLT                             
              IF TWA-PEND-TRNFR                                                 
                 PERFORM 1330-PEND-TRNFR-BY-ACAT                                
              ELSE                                                              
              IF TWA-HIST-TRNFR                                                 
                 PERFORM 1340-HIST-TRNFR-BY-ACAT                                
              END-IF.                                                           
      *                                                                         
      *----------------------------------------------------------------*        
      *      RESET PENDING TRANSFER SERCHED BY ACAT#                   *        
      *----------------------------------------------------------------*        
       1330-PEND-TRNFR-BY-ACAT.                                                 
           MOVE 'PENDING' TO MTITLEO TWA-MAP-TITLE.                             
           MOVE WS-SAVE-SRCH-ACAT                                               
             TO MSACATO TWA-MAP-SACAT TWA-PREV-SACAT.                           
                                                                                
           MOVE WS-SAVE-SRCH-ACAT TO ACAT25-PASS-ACAT.                          
           PERFORM 0600-OPEN-PEND-TRNFR-BY-ACAT.                                
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           PERFORM 0601-FETCH-PEND-TRNFR-BY-ACAT.                               
           IF ACAT25IO-NOT-FOUND                                                
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'NO TRANSFER FOUND FOR THE REQUESTED ACAT#'               
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           ELSE                                                                 
           IF ACAT25IO-NORMAL                                                   
              ADD +1 TO TWA-TRNFR-PAGE-NUM                              15960000
              PERFORM 0700-SETUP-TFR-SCREEN                             15960000
              MOVE ACAT25-TFR-ACAT TO ACAT25-PASS-ACAT                          
              PERFORM 0320-SAVE-ASSETS-IN-TS                            15960000
              MOVE +1 TO ASSET-ITEM                                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              IF WK-TS-READ-OK                                                  
                 PERFORM 0710-SETUP-ASSET-SCREEN                        15960000
                    THRU 0710-EXIT                                      15960000
                     VARYING SUB FROM 1 BY 1                            15960000
                     UNTIL SUB > 3                                      15960000
                 MOVE +1 TO TWA-ASSET-PAGE-NUM                                  
              END-IF.                                                           
           PERFORM 0602-CLOSE-PEND-TRNFR-BY-ACAT.                               
      *                                                                         
      *----------------------------------------------------------------*        
      *      RESET HISTOTY TRANSFER SERCHED BY ACAT#                   *        
      *----------------------------------------------------------------*        
       1340-HIST-TRNFR-BY-ACAT.                                                 
           MOVE 'HISTORY' TO MTITLEO TWA-MAP-TITLE.                             
           MOVE WS-SAVE-SRCH-ACAT                                               
             TO MSACATO TWA-MAP-SACAT TWA-PREV-SACAT.                           
                                                                                
           MOVE WS-SAVE-SRCH-ACAT TO ACAT25-PASS-ACAT.                          
           PERFORM 0620-OPEN-HIST-TRNFR-BY-ACAT.                                
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           PERFORM 0621-FETCH-HIST-TRNFR-BY-ACAT.                               
           IF ACAT25IO-NOT-FOUND                                                
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'NO TRANSFER FOUND FOR THE REQUESTED ACAT#'               
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           ELSE                                                                 
           IF ACAT25IO-NORMAL                                                   
              ADD +1 TO TWA-TRNFR-PAGE-NUM                              15960000
              PERFORM 0700-SETUP-TFR-SCREEN                             15960000
              MOVE ACAT25-TFR-ACAT TO ACAT25-PASS-ACAT                          
              PERFORM 0420-SAVE-HIST-ASSETS-IN-TS                       15960000
              MOVE +1 TO ASSET-ITEM                                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              IF WK-TS-READ-OK                                                  
                 PERFORM 0710-SETUP-ASSET-SCREEN                        15960000
                    THRU 0710-EXIT                                      15960000
                     VARYING SUB FROM 1 BY 1                            15960000
                     UNTIL SUB > 3                                      15960000
                 MOVE +1 TO TWA-ASSET-PAGE-NUM                                  
              END-IF.                                                           
           PERFORM 0622-CLOSE-HIST-TRNFR-BY-ACAT.                               
      *                                                                         
      *----------------------------------------------------------------*        
      *           VALIDATE THE SEARCH ENGINE FLD ENTRY                 *        
      *----------------------------------------------------------------*        
       1350-VALIDATE-SRCH-ENGINE.                                               
           IF TWA-MAP-MMAC > SPACE                                              
              IF TWA-MAP-MMBR = SPACE                                           
                 MOVE -1             TO MMBRL                                   
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'ENTER BRANCH CODE'                                    
                      TO  SYSTEM-MSG                                            
                 END-IF.                                                        
           IF TWA-MAP-MMTFR > SPACE                                             
              IF TWA-MAP-MMTFR = 'FUL' OR 'STD' OR 'PTR' OR 'PTD' OR            
                                 'RCL' OR 'FRV' OR 'RCR' OR 'CRD'               
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE -1 TO MMTFRL                                              
                 MOVE ATT-UNPROT-BRT TO MMTFRA                                  
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'INVALID TRANSFER TYPE SEARCH CODE'                    
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              END-IF.                                                           
           IF TWA-MAP-MMRD > SPACE                                              
              IF TWA-MAP-MMRD = 'R' OR 'D'                                      
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE -1 TO MMRDL                                               
                 MOVE ATT-UNPROT-BRT TO MMRDA                                   
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'INVALID RECEIVER/DELIVERER CODE'                      
                      TO  SYSTEM-MSG                                            
                 END-IF.                                                        
           IF TWA-MAP-MMBKR > SPACE                                             
              IF TWA-MAP-MMRD = SPACE                                           
                 MOVE -1 TO MMRDL                                               
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'ENTER RECEIVER/DELIVERER CODE FOR CONTRA BRKR'        
                      TO  SYSTEM-MSG                                            
                 END-IF.                                                        
           IF SRCH-INP-STATUS > SPACE                                           
              IF ALLOWED-STATUS-CODE                                            
                 IF SRCH-INP-STATUS = 'RQR' OR 'CLP' OR                         
                                      'REJ' OR 'PUR' OR 'INT'                   
                     SET  SRCH-STATUS-ERR TO TRUE                               
                     IF SRCH-MSG = SPACE                                        
                        MOVE 'REQUESTED STATUS SEARCH NOT APPLICABLE'           
                          TO  SRCH-MSG                                          
                     END-IF                                                     
                 END-IF                                                         
              ELSE                                                              
                 SET  SRCH-STATUS-ERR TO TRUE                                   
                 IF SRCH-MSG = SPACE                                            
                    MOVE 'INVALID STATUS SEARCH CODE'                           
                      TO  SRCH-MSG                                              
                 END-IF.                                                        
           IF TWA-MAP-MMSTAT > SPACE                                            
              IF TWA-HIST-TRNFR                                                 
                 IF TWA-MAP-MMSTAT = 'REQ' OR 'RQA' OR 'RAP' OR 'RQP'           
                                  OR 'RQR' OR 'REV' OR 'RVA' OR 'RVE'           
                                  OR 'RVX' OR 'STP' OR 'STC' OR 'CLP'           
                                  OR 'REJ'                                      
                    CONTINUE                                                    
                 ELSE                                                           
                    MOVE -1 TO MMSTATL                                          
                    MOVE ATT-UNPROT-BRT TO MMSTATA                              
                    IF NOT WK-ERROR                                             
                       SET WK-ERROR TO TRUE                                     
                       MOVE 'STATUS CODE INVALID'                               
                         TO  SYSTEM-MSG                                         
                    END-IF                                                      
                 END-IF                                                         
              ELSE                                                              
              IF TWA-PEND-TRNFR                                                 
                 IF TWA-MAP-MMSTAT = 'REQ' OR 'RQA' OR 'RAP' OR 'RQP'           
                                  OR 'REV' OR 'RVA' OR 'RVE' OR 'STP'           
                                  OR 'STC'                                      
                    CONTINUE                                                    
                 ELSE                                                           
                 IF TWA-MAP-MMSTAT = 'RQR' OR 'REJ' OR                          
                                     'STP' OR 'STC' OR 'CLT'                    
                    MOVE -1 TO MMSTATL                                          
                    MOVE ATT-UNPROT-BRT TO MMSTATA                              
                    IF NOT WK-ERROR                                             
                       SET WK-ERROR TO TRUE                                     
                       MOVE 'REQUESTED STATUS SEARCH NOT APPLICABLE'            
                         TO  SYSTEM-MSG                                         
                    END-IF                                                      
                 ELSE                                                           
                    MOVE -1 TO MMSTATL                                          
                    MOVE ATT-UNPROT-BRT TO MMSTATA                              
                    IF NOT WK-ERROR                                             
                       SET WK-ERROR TO TRUE                                     
                       MOVE 'INVALID STATUS CODE' TO SYSTEM-MSG                 
                    END-IF.                                                     
                                                                                
           MOVE 0 TO WS-SPACE-CNT.                                              
           IF TWA-MAP-MMSD > SPACE                                              
              INSPECT TWA-MAP-MMSD                                              
                 TALLYING WS-SPACE-CNT  FOR ALL SPACES                          
              IF WS-SPACE-CNT > 0                                               
                 MOVE -1 TO MMSDL                                               
                 MOVE ATT-UNPROT-BRT TO MMSDA                                   
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'ENTER SETTLEMENT DATE IN MMDDYY FORMAT'               
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              ELSE                                                              
                 PERFORM 1351-SETTLE-DATE-CHECK.                                
      *                                                                         
      *--------------------------------------------------------------*          
      *          DATE CHECK FOR SETTLEMENT DATE                      *          
      *--------------------------------------------------------------*          
       1351-SETTLE-DATE-CHECK.                                                  
           MOVE SPACE TO WS-LEAP-YR-SW.                                         
           MOVE TWA-MAP-MMSD (5:2) TO WS-YEAR.                                  
           DIVIDE WS-YEAR-N BY 4                                                
                GIVING WS-DIVIDED  REMAINDER WS-REMAIN.                         
           IF WS-REMAIN = 0                                                     
              SET WS-LEAP-YR TO TRUE.                                           
                                                                                
           IF TWA-MAP-MMSD (1:2) < '01' OR > '12'                               
              MOVE -1 TO MMSDL                                                  
              MOVE ATT-UNPROT-BRT TO MMSDA                                      
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'INVALID DATE' TO SYSTEM-MSG                              
              END-IF                                                            
           ELSE                                                                 
           IF TWA-MAP-MMSD (1:2) = '02'                                         
           AND WS-LEAP-YR                                                       
           AND (TWA-MAP-MMSD (3:2) < '01' OR > '29')                            
                MOVE -1 TO MMSDL                                                
                MOVE ATT-UNPROT-BRT TO MMSDA                                    
                IF NOT WK-ERROR                                                 
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'INVALID DATE' TO SYSTEM-MSG                           
                END-IF                                                          
           ELSE                                                                 
           IF TWA-MAP-MMSD (1:2) = '02'                                         
           AND NOT WS-LEAP-YR                                                   
           AND TWA-MAP-MMSD (3:2) < '01' OR > '28'                              
                 MOVE -1 TO MMSDL                                               
                 MOVE ATT-UNPROT-BRT TO MMSDA                                   
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'INVALID DATE' TO SYSTEM-MSG                           
                 END-IF                                                         
              ELSE                                                              
                 IF (TWA-MAP-MMSD (1:2) = '04' OR                               
                                   '06' OR '09' OR '11')                        
                 AND TWA-MAP-MMSD (3:2) > '30'                                  
                    MOVE -1 TO MMSDL                                            
                    MOVE ATT-UNPROT-BRT TO MMSDA                                
                    IF NOT WK-ERROR                                             
                       SET WK-ERROR TO TRUE                                     
                       MOVE 'INVALID DATE' TO SYSTEM-MSG                        
                    END-IF                                                      
                 ELSE                                                           
                 IF TWA-MAP-MMSD (3:2) < '01' OR > '31'                         
                    MOVE -1 TO MMSDL                                            
                    MOVE ATT-UNPROT-BRT TO MMSDA                                
                    IF NOT WK-ERROR                                             
                       SET WK-ERROR TO TRUE                                     
                       MOVE 'INVALID DATE' TO SYSTEM-MSG                        
                    END-IF                                                      
                 ELSE                                                           
LRM006              MOVE WS-CUR-MM TO WS-TDY-MM                                 
LRM006              MOVE WS-CUR-DD TO WS-TDY-DD                                 
LRM006              MOVE WS-CUR-YY TO WS-TDY-YY                                 
LRM006              MOVE TWA-MAP-MMSD (1:2) TO WS-STLM-MM                       
LRM006              MOVE TWA-MAP-MMSD (3:2) TO WS-STLM-DD                       
LRM006              MOVE TWA-MAP-MMSD (5:2) TO WS-STLM-YY                       
LRM006              IF WS-STLM-YYMMDD > WS-TDY-YYMMDD                           
LRM006                 MOVE -1 TO MMSDL                                         
LRM006                 MOVE ATT-UNPROT-BRT TO MMSDA                             
LRM006                 IF NOT WK-ERROR                                          
LRM006                    SET WK-ERROR TO TRUE                                  
LRM006                    MOVE 'INVALID FUTURE DATE' TO SYSTEM-MSG              
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *       TRANSFER SEARCH BY SEARCH ENGINE ROUTINE                 *        
      *----------------------------------------------------------------*        
       1360-SEARCH-BY-SEARCH-ENGINE.                                            
           IF TWA-MAP-SEARCH = TWA-PREV-MAP-SEARCH                              
              CONTINUE                                                          
           ELSE                                                                 
ET0001        SET WK-SEARCH-ENTERED TO TRUE                                     
              MOVE TWA-MAP-SEARCH TO WS-SAVE-SRCH-ENGINE                        
              PERFORM 2000-INITIALIZE-FOR-NEW-SEARCH                            
              MOVE WK-CLT   TO ACAT25-PASS-CLT                                  
              MOVE WS-SAVE-SRCH-ENGINE TO TWA-PREV-MAP-SEARCH                   
              IF TWA-PEND-TRNFR                                                 
                 PERFORM 1370-PEND-TRNFR-BY-ENGINE                              
              ELSE                                                              
              IF TWA-HIST-TRNFR                                                 
                 PERFORM 1380-HIST-TRNFR-BY-ENGINE                              
              END-IF.                                                           
      *                                                                         
      *----------------------------------------------------------------*        
      *      RESET PENDING TRANSFER SERCHED BY SEARCH ENGINE           *        
      *----------------------------------------------------------------*        
       1370-PEND-TRNFR-BY-ENGINE.                                               
           MOVE 'PENDING' TO MTITLEO TWA-MAP-TITLE.                             
           MOVE WS-SAVE-SRCH-ENGINE TO TWA-MAP-SEARCH.                          
                                                                                
           PERFORM 1390-SETUP-PASS-PARMS.                                       
           PERFORM 0610-OPEN-PEND-TRNFR-BY-ENGIN.                               
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           PERFORM 0611-FETCH-PEND-TRNFR-BY-ENGIN.                              
           IF ACAT25IO-NOT-FOUND                                                
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'NO TRANSFER FOUND FOR THE REQUESTED ACCOUNT'             
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           ELSE                                                                 
           IF ACAT25IO-NORMAL                                                   
              ADD +1 TO TWA-TRNFR-PAGE-NUM                              15960000
              PERFORM 0700-SETUP-TFR-SCREEN                             15960000
              MOVE ACAT25-TFR-ACAT TO ACAT25-PASS-ACAT                          
              PERFORM 0320-SAVE-ASSETS-IN-TS                            15960000
              MOVE +1 TO ASSET-ITEM                                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              IF WK-TS-READ-OK                                                  
                 PERFORM 0710-SETUP-ASSET-SCREEN                        15960000
                    THRU 0710-EXIT                                      15960000
                     VARYING SUB FROM 1 BY 1                            15960000
                     UNTIL SUB > 3                                      15960000
                 MOVE +1 TO TWA-ASSET-PAGE-NUM                                  
              END-IF.                                                           
           PERFORM 0612-CLOSE-PEND-TRNFR-BY-ENGIN.                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *      RESET HISTORY TRANSFER SERCHED BY SEARCH ENGINE           *        
      *----------------------------------------------------------------*        
       1380-HIST-TRNFR-BY-ENGINE.                                               
           MOVE 'HISTORY' TO MTITLEO TWA-MAP-TITLE.                             
           MOVE WS-SAVE-SRCH-ENGINE TO TWA-MAP-SEARCH.                          
                                                                                
           PERFORM 1390-SETUP-PASS-PARMS.                                       
           PERFORM 0630-OPEN-HIST-TRNFR-BY-ENGIN.                               
           PERFORM 0631-FETCH-HIST-TRNFR-BY-ENGIN.                              
           IF ACAT25IO-NOT-FOUND                                                
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'NO TRANSFER FOUND FOR THE REQUESTED ACCOUNT'             
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           ELSE                                                                 
           IF ACAT25IO-NORMAL                                                   
              ADD +1 TO TWA-TRNFR-PAGE-NUM                              15960000
              PERFORM 0700-SETUP-TFR-SCREEN                             15960000
              MOVE ACAT25-TFR-ACAT TO ACAT25-PASS-ACAT                          
              PERFORM 0320-SAVE-ASSETS-IN-TS                            15960000
              MOVE +1 TO ASSET-ITEM                                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              IF WK-TS-READ-OK                                                  
                 PERFORM 0710-SETUP-ASSET-SCREEN                        15960000
                    THRU 0710-EXIT                                      15960000
                     VARYING SUB FROM 1 BY 1                            15960000
                     UNTIL SUB > 3                                      15960000
                 MOVE +1 TO TWA-ASSET-PAGE-NUM                                  
              END-IF.                                                           
           PERFORM 0632-CLOSE-HIST-TRNFR-BY-ENGIN.                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *         SEARCH ENGINE FIELD PASSING PARAMETERS                 *        
      *----------------------------------------------------------------*        
       1390-SETUP-PASS-PARMS.                                                   
           IF TWA-MAP-MMBR > SPACE                                              
              MOVE TWA-MAP-MMBR   TO ACAT25-PASS-BR                             
           ELSE                                                                 
              MOVE SPACE          TO ACAT25-PASS-BR.                            
           MOVE ACAT25-PASS-BR    TO ACAT25-PASS-TO-BR.                         
           IF TWA-MAP-MMAC > SPACE                                              
              MOVE TWA-MAP-MMAC   TO ACAT25-PASS-AC                             
           ELSE                                                                 
              MOVE SPACE          TO ACAT25-PASS-AC.                            
           IF TWA-MAP-MMRR > SPACE                                              
              MOVE TWA-MAP-MMRR   TO ACAT25-PASS-RR                             
           ELSE                                                                 
              MOVE ALL '%'        TO ACAT25-PASS-RR.                            
           IF TWA-MAP-MMTFR > SPACE                                             
              IF TWA-MAP-MMTFR = 'STD'                                          
                 MOVE 'FUL'          TO ACAT25-PASS-TFR                         
              ELSE                                                              
                 MOVE TWA-MAP-MMTFR  TO ACAT25-PASS-TFR                         
              END-IF                                                            
           ELSE                                                                 
              MOVE ALL '%'        TO ACAT25-PASS-TFR.                           
           IF TWA-MAP-MMRD > SPACE                                              
              MOVE TWA-MAP-MMRD   TO ACAT25-PASS-RD                             
           ELSE                                                                 
              MOVE ALL '%'        TO ACAT25-PASS-RD.                            
                                                                                
           IF TWA-MAP-MMBKR > SPACE                                             
              IF TWA-MAP-MMRD = 'R'                                             
                 MOVE TWA-MAP-MMBKR  TO ACAT25-PASS-CBRKR-DEL                   
                 MOVE ALL '%'        TO ACAT25-PASS-CBRKR-REC                   
              ELSE                                                              
                 MOVE TWA-MAP-MMBKR  TO ACAT25-PASS-CBRKR-REC                   
                 MOVE ALL '%'        TO ACAT25-PASS-CBRKR-DEL                   
              END-IF                                                            
           ELSE                                                                 
              MOVE ALL '%'  TO ACAT25-PASS-CBRKR-DEL                            
                               ACAT25-PASS-CBRKR-REC.                           
                                                                                
           EVALUATE  TWA-MAP-MMSTAT                                             
              WHEN 'REQ'  MOVE '100' TO ACAT25-PASS-STAT-FR                     
                                        ACAT25-PASS-STAT-TO                     
              WHEN 'RQA'  MOVE '110' TO ACAT25-PASS-STAT-FR                     
                                        ACAT25-PASS-STAT-TO                     
              WHEN 'RAP'  MOVE '120' TO ACAT25-PASS-STAT-FR                     
                                        ACAT25-PASS-STAT-TO                     
              WHEN 'RQP'  MOVE '130' TO ACAT25-PASS-STAT-FR                     
                                        ACAT25-PASS-STAT-TO                     
              WHEN 'RQR'  MOVE '140' TO ACAT25-PASS-STAT-FR                     
                                        ACAT25-PASS-STAT-TO                     
              WHEN 'REV'  MOVE '200' TO ACAT25-PASS-STAT-FR                     
                                        ACAT25-PASS-STAT-TO                     
              WHEN 'RVA'  MOVE '210' TO ACAT25-PASS-STAT-FR                     
                                        ACAT25-PASS-STAT-TO                     
              WHEN 'RVE'  MOVE '220' TO ACAT25-PASS-STAT-FR                     
                                        ACAT25-PASS-STAT-TO                     
              WHEN 'RVX'  MOVE '230' TO ACAT25-PASS-STAT-FR                     
                                        ACAT25-PASS-STAT-TO                     
              WHEN 'STP'  MOVE '300' TO ACAT25-PASS-STAT-FR                     
                                        ACAT25-PASS-STAT-TO                     
              WHEN 'STC'  MOVE '310' TO ACAT25-PASS-STAT-FR                     
                                        ACAT25-PASS-STAT-TO                     
              WHEN 'CLP'  MOVE '400' TO ACAT25-PASS-STAT-FR                     
                                        ACAT25-PASS-STAT-TO                     
              WHEN 'REJ'  MOVE '600' TO ACAT25-PASS-STAT-FR                     
                                        ACAT25-PASS-STAT-TO                     
              WHEN OTHER  MOVE '100' TO ACAT25-PASS-STAT-FR                     
                          MOVE '600' TO ACAT25-PASS-STAT-TO                     
           END-EVALUATE.                                                        
           IF TWA-MAP-MMSD > SPACE                                              
              MOVE  TWA-MAP-MMSD (1:2)  TO WS-STTLM-MM                          
              MOVE  TWA-MAP-MMSD (3:2)  TO WS-STTLM-DD                          
              MOVE  TWA-MAP-MMSD (5:2)  TO WS-STTLM-YY                          
              IF TWA-MAP-MMSD (5:2) >= '00' AND < '85'                          
                 MOVE  '20' TO  WS-STTLM-CC                                     
              ELSE                                                              
                 MOVE  '19' TO  WS-STTLM-CC                                     
              END-IF                                                            
              MOVE WS-STTLM-DT  TO ACAT25-PASS-SD-FR                            
              MOVE WS-STTLM-DT  TO ACAT25-PASS-SD-TO                            
           ELSE                                                                 
              MOVE '0001-01-01' TO ACAT25-PASS-SD-FR                            
              MOVE '9999-12-31' TO ACAT25-PASS-SD-TO                            
           END-IF.                                                              
ET0001*                                                                         
ET0001*----------------------------------------------------------------*        
ET0001*     ACTION FIELD USER ENTRY ROUTINE                            *        
ET0001*----------------------------------------------------------------*        
ET0001 1500-ACTION-ENTRY-RTN.                                                   
           MOVE ZERO TO WS-ACTION-CNT.                                          
                                                                                
           PERFORM 1510-CHECK-ACTION-CD  THRU 1510-EXIT                         
              VARYING SUB FROM 1 BY 1  UNTIL SUB > 3.                           
                                                                                
           IF NOT WK-ERROR                                                      
              IF WS-ACTION-CNT = 1                                              
                 IF WS-USER-ACTION = 'Z'                                        
                    MOVE 'Z'  TO WS-ACAT-NEXT                                   
                    PERFORM 1210-SCREEN-SECURITY-CHECK                          
                    MOVE SPACE        TO ACAT-SEARCH-FIELDS                     
                    MOVE TWA-MAP-BR   TO ACAT-BR                                
                    MOVE TWA-MAP-AC   TO ACAT-AC                                
                    MOVE TWA-MAP-ACAT TO ACAT-CONTROL-NBR                       
                    MOVE 'Z'          TO ACAT-NEXT                              
                    MOVE 'ACAT25PD'   TO ACAT-CALLING-PROG-NAME                 
                    MOVE 'ACAT33FC'   TO CALLED-PROGRAM-NAME                    
                 ELSE                                                           
                    MOVE 'L'  TO WS-ACAT-NEXT                                   
                    PERFORM 1210-SCREEN-SECURITY-CHECK                          
                    MOVE SPACE        TO ACAT-SEARCH-FIELDS                     
                    MOVE TWA-MAP-BR   TO ACAT-BR                                
                    MOVE TWA-MAP-AC   TO ACAT-AC                                
                    MOVE TWA-MAP-ACAT TO ACAT-CONTROL-NBR                       
                    MOVE 'L'          TO ACAT-NEXT                              
                    MOVE 'ACAT25PD'   TO ACAT-CALLING-PROG-NAME                 
                    MOVE 'ACAT13IF'   TO CALLED-PROGRAM-NAME                    
                 END-IF                                                         
                 PERFORM  7500-XCTL-TO-DETAIL-PROG                              
              ELSE                                                              
              IF WS-ACTION-CNT > 1                                              
                 PERFORM  VARYING SUB FROM 1 BY 1  UNTIL SUB > 3                
                    IF TWA-MAP-ACT (SUB) = 'R'                                  
                       MOVE -1   TO ACT-L (SUB)                                 
                       MOVE ATT-UNPROT-BRT TO ACT-A (SUB)                       
                       IF NOT WK-ERROR                                          
                          SET  WK-ERROR   TO TRUE                               
                          MOVE 'MULTIPLE RESUBMISSION NOT ALLOWED'              
                            TO  SYSTEM-MSG                                      
                       END-IF                                                   
                    END-IF                                                      
                 END-PERFORM                                                    
              END-IF                                                            
           END-IF.                                                              
       EJECT                                                                    
ET0001*                                                                         
ET0001*----------------------------------------------------------------*        
ET0001*     SAVE AND CHECK ACTION FIELD ENTRY                          *        
ET0001*----------------------------------------------------------------*        
ET0001 1510-CHECK-ACTION-CD.                                                    
                                                                                
LRM004*****IF  (TWA-MAP-RD = 'DLV'                                              
LRM004     IF (TWA-MAP-RD = 'DLV' AND TWA-MAP-TFR NOT = 'RCL')                  
LRM004     OR (TWA-MAP-RD = 'RCV' AND TWA-MAP-TFR     = 'RCL')                  
           AND (TWA-MAP-SLOC (SUB) = '10' OR '15' OR                            
                                     '20' OR '25' OR '50')                      
               IF ACT-L (SUB) > 0                                               
                  IF ACT-O (SUB) = TWA-MAP-ACT (SUB)                            
                     CONTINUE                                                   
                  ELSE                                                          
                     MOVE ACT-O (SUB) TO TWA-MAP-ACT (SUB)                      
                  END-IF                                                        
               ELSE                                                             
                  IF ACT-A (SUB) = ERASE-KEY                                    
                     MOVE SPACE TO TWA-MAP-ACT (SUB)                            
                  END-IF                                                        
               END-IF                                                           
               MOVE ATT-UNPROT TO ACT-A (SUB)                                   
           ELSE                                                                 
               GO TO 1510-EXIT                                                  
           END-IF.                                                              
                                                                                
           IF TWA-MAP-CTGRY (SUB) = 'MFMM' OR 'MFNM'                            
              IF TWA-MAP-ACT (SUB) > SPACE                                      
                 IF TWA-MAP-ACT (SUB) = 'L' OR 'Z'                              
                    ADD 1 TO WS-ACTION-CNT                                      
                    MOVE TWA-MAP-ACT (SUB) TO WS-USER-ACTION                    
                 ELSE                                                           
                    MOVE -1   TO ACT-L (SUB)                                    
                    MOVE ATT-UNPROT-BRT TO ACT-A (SUB)                          
                    IF NOT WK-ERROR                                             
                       SET  WK-ERROR   TO TRUE                                  
                       MOVE 'TYPE "L" TO INITIATE FAIL REVERSAL OR "Z" (        
      -                     'Z SCREEN) TO INITIATE MF CLEANUP'                  
                         TO  SYSTEM-MSG                                         
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              IF TWA-MAP-ACT (SUB) > SPACE                                      
                 IF TWA-MAP-ACT (SUB) = 'L'                                     
                    ADD 1 TO WS-ACTION-CNT                                      
                    MOVE TWA-MAP-ACT (SUB) TO WS-USER-ACTION                    
                 ELSE                                                           
                    MOVE -1   TO ACT-L (SUB)                                    
                    MOVE ATT-UNPROT-BRT TO ACT-A (SUB)                          
                    IF NOT WK-ERROR                                             
                       SET  WK-ERROR   TO TRUE                                  
                       MOVE 'TYPE "L" (L SCREEN) TO INITIATE FAIL REVERS        
      -                     'AL'                                                
                         TO  SYSTEM-MSG                                         
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
       1510-EXIT.    EXIT.                                                      
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *              POP-UP MENU ROUTINE                               *        
      *----------------------------------------------------------------*        
       1800-SEND-POPUP-MAP-RTN.                                                 
           INITIALIZE ACAT90CM-TS-AREA.                                         
           IF EIBCPOSN >= 0 AND < 560                                           
              MOVE 'A' TO ACAT90CM-TS-SCREEN                                    
              MOVE TWA-TRNFR-CMNT  TO ACAT90CM-TS-MCCMNT-X120                   
           ELSE                                                                 
           IF EIBCPOSN >= 800 AND < 1120                                        
              IF TWA-MAP-ASSETS (1) = SPACE                                     
                 MOVE ' ' TO ACAT90CM-TS-SCREEN                                 
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'INVALID CURSOR POSITION' TO SYSTEM-MSG                
                    PERFORM 9000-ERROR-RTN                                      
                 END-IF                                                         
              ELSE                                                              
                 MOVE TWA-ASSET-CMNT (1) TO ACAT90CM-TS-MCCMNT-X120             
                 IF TWA-MAP-SLOC (1) = '40'                                     
                    IF TWA-MAP-SEC (1) = '(CASH)'                               
                       MOVE '1' TO ACAT90CM-TS-SCREEN                           
                    END-IF                                                      
                    IF TWA-MAP-SEC (1) = '(MARGIN)'                             
                       MOVE '2' TO ACAT90CM-TS-SCREEN                           
                    END-IF                                                      
                    IF TWA-MAP-SEC (1) = '(SHORT)'                              
                       MOVE '5' TO ACAT90CM-TS-SCREEN                           
                    END-IF                                                      
                 ELSE                                                           
                    MOVE 'S' TO ACAT90CM-TS-SCREEN                              
                    MOVE TWA-MAP-SEC (1) TO ACAT90CM-TS-MNAME                   
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
           IF EIBCPOSN >= 1200 AND < 1520                                       
              IF TWA-MAP-ASSETS (2) = SPACE                                     
                 MOVE ' ' TO ACAT90CM-TS-SCREEN                                 
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'INVALID CURSOR POSITION' TO SYSTEM-MSG                   
                 PERFORM 9000-ERROR-RTN                                         
              ELSE                                                              
                 MOVE TWA-ASSET-CMNT (2) TO ACAT90CM-TS-MCCMNT-X120             
                 IF TWA-MAP-SLOC (2) = '40'                                     
                    IF TWA-MAP-SEC (2) = '(CASH)'                               
                       MOVE '1' TO ACAT90CM-TS-SCREEN                           
                    END-IF                                                      
                    IF TWA-MAP-SEC (2) = '(MARGIN)'                             
                       MOVE '2' TO ACAT90CM-TS-SCREEN                           
                    END-IF                                                      
                    IF TWA-MAP-SEC (2) = '(SHORT)'                              
                       MOVE '5' TO ACAT90CM-TS-SCREEN                           
                    END-IF                                                      
                 ELSE                                                           
                    MOVE 'S' TO ACAT90CM-TS-SCREEN                              
                    MOVE TWA-MAP-SEC (2) TO ACAT90CM-TS-MNAME                   
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           PERFORM 1810-ACAT90CM-TS-RTN.                                        
           PERFORM 7020-WRITE-TSQ-RTN.                                          
                                                                                
           MOVE 'ACAT25PD' TO ACAT-CALLING-PROG-NAME.                           
           MOVE '$' TO WS-ACAT-NEXT.                                            
           MOVE 'ACAT90CM' TO CALLED-PROGRAM-NAME.                              
           EXEC CICS XCTL PROGRAM(CALLED-PROGRAM-NAME)                          
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *         TRANSFER CONTROL TO POP-UP MENU PGM                    *        
      *----------------------------------------------------------------*        
       1810-ACAT90CM-TS-RTN.                                                    
           MOVE 'ACA$'   TO TRAN-ID.                                    02410002
           EXEC CICS DELETEQ                                            10490002
                TS QUEUE(TSQ-NAME)                                      10490002
           END-EXEC.                                                    10500002
           MOVE SPACE TO ACAT90CM-TS-UPDATE-IND.                                
           MOVE TWA-MAP-BR     TO ACAT90CM-TS-MBR.                              
           MOVE TWA-MAP-AC     TO ACAT90CM-TS-MAC.                              
           MOVE TWA-MAP-RR     TO ACAT90CM-TS-MRR.                              
           MOVE TWA-ACCT-TYPE  TO ACAT90CM-TS-MCTYPE.                           
           MOVE TWA-MAP-CBKR   TO ACAT90CM-TS-MCBRKR.                           
           MOVE TWA-CONT-ACCT  TO ACAT90CM-TS-MCACCT.                           
           MOVE TWA-MAP-NAME1  TO ACAT90CM-TS-MNAME2.                           
           MOVE TWA-MAP-NAME2  TO ACAT90CM-TS-MNAME3.                           
                                                                        02410002
           MOVE 'ACA$' TO TRAN-ID.                                      02410002
           MOVE +1     TO ITEM-NUM.                                            2
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                                 2
                               FROM(ACAT90CM-TS-AREA)                          2
                               LENGTH(LENGTH OF ACAT90CM-TS-AREA)              2
                               ITEM(ITEM-NUM)                                  2
           END-EXEC.                                                           2
           IF EIBRESP NOT = +0                                                 2
              MOVE LOW-VALUE TO ACAT25MO                                        
              MOVE 'ACAT25PD WRITE TSQ ERROR ON ACA$'                          2
                TO SYSTEM-MSG                                                  2
           END-IF.                                                             2
      *                                                                         
      *----------------------------------------------------------------*        
      *      FOR NEW SEARCH ENTRY, INITIALIZE AND DELETE               *        
      *----------------------------------------------------------------*        
       2000-INITIALIZE-FOR-NEW-SEARCH.                                          
           INITIALIZE TWA-MAP-AREA.                                             
           INITIALIZE TWA-WORK-AREA.                                            
           INITIALIZE TWA-MAP-SEARCH.                                           
           INITIALIZE TWA-PREV-MAP-SEARCH.                                      
           PERFORM 2010-CLEAR-TRNFR-SCREEN.                                     
           PERFORM 2020-CLEAR-ASSET-SCREEN.                                     
           PERFORM 7210-DELETE-ASSET-TSQ.                                       
           MOVE SPACE TO  ACAT25-PASS-FLDS.                                     
      *                                                                         
      *----------------------------------------------------------------*        
      *             CLEAR TRANSFER SCREEN AREA                         *        
      *----------------------------------------------------------------*        
       2010-CLEAR-TRNFR-SCREEN.                                                 
           MOVE SPACE TO MBRO                                                   
                         MACO                                                   
                         MRRO                                                   
                         MNAME1O                                                
                         MNAME2O                                                
                         MRDO                                                   
                         MCBKRO                                                 
                         MSTATO                                                 
                         MACATO                                                 
                         MTFRO                                                  
                         MSDO.                                                  
      *                                                                         
      *----------------------------------------------------------------*        
      *             CLEAR ASSET SCREEN AREA                            *        
      *----------------------------------------------------------------*        
       2020-CLEAR-ASSET-SCREEN.                                                 
           PERFORM VARYING  SUB FROM 1 BY 1  UNTIL SUB > 3                      
              MOVE SPACE                                                        
              TO   SEC-O         (SUB)                                          
ET0001             ACT-O         (SUB)                                          
                   CTGRY-O       (SUB)                                          
                   SLOC-O        (SUB)                                          
                   DESC-O        (SUB)                                          
                   AMT-I         (SUB)                                          
ET0001             TAG-O         (SUB)                                          
ET0001             TWA-MAP-ACT   (SUB)                                          
                   TWA-MAP-SEC   (SUB)                                          
                   TWA-MAP-CTGRY (SUB)                                          
                   TWA-MAP-SLOC  (SUB)                                          
                   TWA-MAP-DESC  (SUB)                                          
                   TWA-MAP-AMT   (SUB)                                          
ET0001             TWA-MAP-TAG   (SUB)                                          
ET0001        MOVE ATT-ASKIP                                                    
ET0001        TO   ACT-A         (SUB)                                          
ET0001        MOVE ATT-ASKIP-DRK                                                
ET0001        TO   TAGDSC-A      (SUB)                                          
ET0001             TAG-A         (SUB)                                          
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *             CLEAR SEARCH ENGINE FIELDS                         *        
      *----------------------------------------------------------------*        
       2030-CLEAR-SEARCH-ENGINE-FLDS.                                           
           MOVE SPACE TO MMBRO                                                  
                         MMACO                                                  
                         MMRRO                                                  
                         MMTFRO                                                 
                         MMRDO                                                  
                         MMBKRO                                                 
                         MMSTATO                                                
                         MMSDO.                                                 
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          PF3:  JUMP TO MARGIN INQUIRY                         *         
      *---------------------------------------------------------------*         
       3000-JUMP-TO-MARGIN.                                                     
           IF TWA-PEND-TRNFR OR TWA-HIST-TRNFR                                  
              MOVE TWA-MAP-BR  TO ACAT-BR                                       
              MOVE TWA-MAP-AC  TO ACAT-AC                                       
              MOVE 'ACAT25PD'  TO ACAT-CALLING-PROG-NAME                        
              PERFORM 7020-WRITE-TSQ-RTN                                        
              PERFORM 7510-XCTL-TO-CONTROL-PROG                                 
           ELSE                                                                 
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT25MO                                        
              MOVE 'ERROR FUNCTION KEY' TO SYSTEM-MSG                           
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          PF6:  JUMP TO MUTUAL FUND CLEANUP                    *         
      *---------------------------------------------------------------*         
       4000-JUMP-TO-MFC.                                                        
LRM002     IF TWA-HIST-TRNFR                                                    
             IF (TWA-MAP-TFR = 'FUL' OR 'PTR' OR 'PTD' OR 'RCR')                
             AND TWA-MAP-RD = 'DLV'                                             
             AND TWA-MAP-STAT(1 : 3) = 'STC'                                    
                MOVE TWA-MAP-BR  TO ACAT-BR                                     
                MOVE TWA-MAP-AC   TO ACAT-AC                                    
                MOVE TWA-MAP-ACAT TO ACAT-CONTROL-NBR                           
                MOVE 'Z'         TO  ACAT-NEXT                                  
                MOVE 'ACAT25PD'  TO  ACAT-CALLING-PROG-NAME                     
                MOVE 'ACAT33FC'  TO  CALLED-PROGRAM-NAME                        
                PERFORM 7500-XCTL-TO-DETAIL-PROG                                
             ELSE                                                               
                MOVE                                                            
LRM002          'TIF MUST BE DELIVERY IN STC STATUS TO USE PF6'                 
                         TO SYSTEM-MSG                                          
           ELSE                                                                 
              MOVE 'ERROR FUNCTION KEY' TO SYSTEM-MSG                           
           END-IF.                                                              
           SET  WK-ERROR  TO TRUE                                               
           MOVE LOW-VALUE TO ACAT25MO                                           
           PERFORM 9000-ERROR-RTN.                                              
      *                                                                         
      *---------------------------------------------------------------*         
      *          PF7:  PREV TRANSFER PAGE                             *         
      *---------------------------------------------------------------*         
       6000-PREV-TFR-PAGE.                                                      
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           IF TWA-PEND-TRNFR                                                    
              IF TWA-SRCH-BY-ACAT                                               
                 PERFORM 6010-PEND-PREV-PAGE-BY-ACAT                            
              ELSE                                                              
              IF TWA-SRCH-BY-ENGINE                                             
                 PERFORM 6020-PEND-PREV-PAGE-BY-ENGIN                           
              END-IF                                                            
           ELSE                                                                 
           IF TWA-HIST-TRNFR                                                    
              IF TWA-SRCH-BY-ACAT                                               
                 PERFORM 6030-HIST-PREV-PAGE-BY-ACAT                            
              ELSE                                                              
              IF TWA-SRCH-BY-ENGINE                                             
                 PERFORM 6040-HIST-PREV-PAGE-BY-ENGIN                           
              END-IF                                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          PF7:  PREV PENDING TFR BY ACAT SEARCH                *         
      *---------------------------------------------------------------*         
       6010-PEND-PREV-PAGE-BY-ACAT.                                             
           MOVE TWA-MAP-SACAT TO ACAT25-PASS-ACAT.                              
           MOVE TWA-MAP-ACAT  TO ACAT25-PASS-ACAT-2.                            
           PERFORM 0660-OPEN-PEND-BY-ACAT-D.                                    
           PERFORM 0661-FETCH-PEND-BY-ACAT-D.                                   
           IF ACAT25IO-NOT-FOUND                                                
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'FIRST PAGE' TO SYSTEM-MSG                                
              END-IF                                                            
           ELSE                                                                 
           IF ACAT25IO-NORMAL                                                   
              PERFORM 2010-CLEAR-TRNFR-SCREEN                                   
              PERFORM 2020-CLEAR-ASSET-SCREEN                                   
              PERFORM 2030-CLEAR-SEARCH-ENGINE-FLDS                             
              PERFORM 7210-DELETE-ASSET-TSQ                                     
              PERFORM 0700-SETUP-TFR-SCREEN                             15960000
              MOVE ACAT25-TFR-ACAT TO ACAT25-PASS-ACAT                          
              PERFORM 0320-SAVE-ASSETS-IN-TS                            15960000
              MOVE +1 TO ASSET-ITEM                                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              IF WK-TS-READ-OK                                                  
                 PERFORM 0710-SETUP-ASSET-SCREEN                        15960000
                    THRU 0710-EXIT                                      15960000
                     VARYING SUB FROM 1 BY 1                            15960000
                     UNTIL SUB > 3                                      15960000
                 MOVE +1 TO TWA-ASSET-PAGE-NUM                                  
              END-IF.                                                           
           PERFORM 0662-CLOSE-PEND-BY-ACAT-D.                                   
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          PF7:  PREV PENDING TFR BY SEARCH ENGINE SEARCH       *         
      *---------------------------------------------------------------*         
       6020-PEND-PREV-PAGE-BY-ENGIN.                                            
           PERFORM 1390-SETUP-PASS-PARMS.                                       
           MOVE TWA-MAP-BR   TO ACAT25-PASS-BR-2.                               
           MOVE ACAT25-PASS-BR    TO ACAT25-PASS-TO-BR.                         
           MOVE TWA-MAP-AC   TO ACAT25-PASS-AC-2.                               
           MOVE TWA-MAP-ACAT TO ACAT25-PASS-ACAT-2.                             
           PERFORM 0670-OPEN-PEND-BY-ENGIN-D.                                   
           PERFORM 0671-FETCH-PEND-BY-ENGIN-D.                                  
           IF ACAT25IO-NOT-FOUND                                                
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'FIRST PAGE' TO SYSTEM-MSG                                
              END-IF                                                            
           ELSE                                                                 
           IF ACAT25IO-NORMAL                                                   
              PERFORM 2010-CLEAR-TRNFR-SCREEN                                   
              PERFORM 2020-CLEAR-ASSET-SCREEN                                   
              PERFORM 7210-DELETE-ASSET-TSQ                                     
              PERFORM 0700-SETUP-TFR-SCREEN                             15960000
              MOVE ACAT25-TFR-ACAT TO ACAT25-PASS-ACAT                          
              PERFORM 0320-SAVE-ASSETS-IN-TS                            15960000
              MOVE +1 TO ASSET-ITEM                                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              IF WK-TS-READ-OK                                                  
                 PERFORM 0710-SETUP-ASSET-SCREEN                        15960000
                    THRU 0710-EXIT                                      15960000
                     VARYING SUB FROM 1 BY 1                            15960000
                     UNTIL SUB > 3                                      15960000
                 MOVE +1 TO TWA-ASSET-PAGE-NUM                                  
              END-IF.                                                           
           PERFORM 0672-CLOSE-PEND-BY-ENGIN-D.                                  
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          PF7:  PREV HISTORY TFR BY ACAT SEARCH                *         
      *---------------------------------------------------------------*         
       6030-HIST-PREV-PAGE-BY-ACAT.                                             
           MOVE TWA-MAP-SACAT TO ACAT25-PASS-ACAT.                              
           MOVE TWA-MAP-ACAT  TO ACAT25-PASS-ACAT-2.                            
           PERFORM 0680-OPEN-HIST-BY-ACAT-D.                                    
           PERFORM 0681-FETCH-HIST-BY-ACAT-D.                                   
           IF ACAT25IO-NOT-FOUND                                                
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'FIRST PAGE' TO SYSTEM-MSG                                
              END-IF                                                            
           ELSE                                                                 
           IF ACAT25IO-NORMAL                                                   
              PERFORM 2010-CLEAR-TRNFR-SCREEN                                   
              PERFORM 2020-CLEAR-ASSET-SCREEN                                   
              PERFORM 2030-CLEAR-SEARCH-ENGINE-FLDS                             
              PERFORM 7210-DELETE-ASSET-TSQ                                     
              PERFORM 0700-SETUP-TFR-SCREEN                             15960000
              MOVE ACAT25-TFR-ACAT TO ACAT25-PASS-ACAT                          
              PERFORM 0420-SAVE-HIST-ASSETS-IN-TS                       15960000
              MOVE +1 TO ASSET-ITEM                                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              IF WK-TS-READ-OK                                                  
                 PERFORM 0710-SETUP-ASSET-SCREEN                        15960000
                    THRU 0710-EXIT                                      15960000
                     VARYING SUB FROM 1 BY 1                            15960000
                     UNTIL SUB > 3                                      15960000
                 MOVE +1 TO TWA-ASSET-PAGE-NUM                                  
              END-IF.                                                           
           PERFORM 0682-CLOSE-HIST-BY-ACAT-D.                                   
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          PF7:  PREV HISTORY TFR BY SEARCH ENGINE SEARCH       *         
      *---------------------------------------------------------------*         
       6040-HIST-PREV-PAGE-BY-ENGIN.                                            
           PERFORM 1390-SETUP-PASS-PARMS.                                       
           MOVE TWA-MAP-BR   TO ACAT25-PASS-BR-2.                               
           MOVE ACAT25-PASS-BR    TO ACAT25-PASS-TO-BR.                         
           MOVE TWA-MAP-AC   TO ACAT25-PASS-AC-2.                               
           MOVE TWA-MAP-ACAT TO ACAT25-PASS-ACAT-2.                             
           PERFORM 0690-OPEN-HIST-BY-ENGIN-D.                                   
           PERFORM 0691-FETCH-HIST-BY-ENGIN-D.                                  
           IF ACAT25IO-NOT-FOUND                                                
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'FIRST PAGE' TO SYSTEM-MSG                                
              END-IF                                                            
           ELSE                                                                 
           IF ACAT25IO-NORMAL                                                   
              PERFORM 2010-CLEAR-TRNFR-SCREEN                                   
              PERFORM 2020-CLEAR-ASSET-SCREEN                                   
              PERFORM 7210-DELETE-ASSET-TSQ                                     
              PERFORM 0700-SETUP-TFR-SCREEN                             15960000
              MOVE ACAT25-TFR-ACAT TO ACAT25-PASS-ACAT                          
              PERFORM 0420-SAVE-HIST-ASSETS-IN-TS                       15960000
              MOVE +1 TO ASSET-ITEM                                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              IF WK-TS-READ-OK                                                  
                 PERFORM 0710-SETUP-ASSET-SCREEN                        15960000
                    THRU 0710-EXIT                                      15960000
                     VARYING SUB FROM 1 BY 1                            15960000
                     UNTIL SUB > 3                                      15960000
                 MOVE +1 TO TWA-ASSET-PAGE-NUM                                  
              END-IF.                                                           
           PERFORM 0692-CLOSE-HIST-BY-ENGIN-D.                                  
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          PF8:  NEXT TRANSFER PAGE                             *         
      *---------------------------------------------------------------*         
       6100-NEXT-TFR-PAGE.                                                      
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           IF TWA-PEND-TRNFR                                                    
              IF TWA-SRCH-BY-ACAT                                               
                 PERFORM 6110-PEND-NEXT-PAGE-BY-ACAT                            
              ELSE                                                              
              IF TWA-SRCH-BY-ENGINE                                             
                 PERFORM 6120-PEND-NEXT-PAGE-BY-ENGIN                           
              END-IF                                                            
           ELSE                                                                 
           IF TWA-HIST-TRNFR                                                    
              IF TWA-SRCH-BY-ACAT                                               
                 PERFORM 6130-HIST-NEXT-PAGE-BY-ACAT                            
              ELSE                                                              
              IF TWA-SRCH-BY-ENGINE                                             
                 PERFORM 6140-HIST-NEXT-PAGE-BY-ENGIN                           
              END-IF                                                            
           END-IF.                                                              
      *                                                                         
      *---------------------------------------------------------------*         
      *       PF8: NEXT PENDING TFR BY ACAT SEARCH                    *         
      *---------------------------------------------------------------*         
       6110-PEND-NEXT-PAGE-BY-ACAT.                                             
           MOVE TWA-MAP-ACAT  TO ACAT25-PASS-ACAT.                              
           PERFORM 0640-OPEN-PEND-BY-ACAT2.                                     
           PERFORM 0641-FETCH-PEND-BY-ACAT2.                                    
           IF ACAT25IO-NOT-FOUND                                                
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'LAST PAGE' TO SYSTEM-MSG                                 
              END-IF                                                            
           ELSE                                                                 
           IF ACAT25IO-NORMAL                                                   
              PERFORM 2010-CLEAR-TRNFR-SCREEN                                   
              PERFORM 2020-CLEAR-ASSET-SCREEN                                   
              PERFORM 2030-CLEAR-SEARCH-ENGINE-FLDS                             
              PERFORM 7210-DELETE-ASSET-TSQ                                     
              PERFORM 0700-SETUP-TFR-SCREEN                             15960000
              MOVE ACAT25-TFR-ACAT TO ACAT25-PASS-ACAT                          
              PERFORM 0320-SAVE-ASSETS-IN-TS                            15960000
              MOVE +1 TO ASSET-ITEM                                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              IF WK-TS-READ-OK                                                  
                 PERFORM 0710-SETUP-ASSET-SCREEN                        15960000
                    THRU 0710-EXIT                                      15960000
                     VARYING SUB FROM 1 BY 1                            15960000
                     UNTIL SUB > 3                                      15960000
                 MOVE +1 TO TWA-ASSET-PAGE-NUM                                  
              END-IF.                                                           
           PERFORM 0642-CLOSE-PEND-BY-ACAT2.                                    
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *       PF8: NEXT PENDING TFR BY SEARCH ENGINE SEARCH           *         
      *---------------------------------------------------------------*         
       6120-PEND-NEXT-PAGE-BY-ENGIN.                                            
           PERFORM 1390-SETUP-PASS-PARMS.                                       
           MOVE TWA-MAP-BR   TO ACAT25-PASS-BR.                                 
           MOVE ACAT25-PASS-BR    TO ACAT25-PASS-TO-BR.                         
           MOVE TWA-MAP-AC   TO ACAT25-PASS-AC.                                 
           MOVE TWA-MAP-ACAT TO ACAT25-PASS-ACAT.                               
           PERFORM 0643-OPEN-PEND-BY-ENGIN2.                                    
           PERFORM 0644-FETCH-PEND-BY-ENGIN2.                                   
           IF ACAT25IO-NOT-FOUND                                                
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'LAST PAGE' TO SYSTEM-MSG                                 
              END-IF                                                            
           ELSE                                                                 
           IF ACAT25IO-NORMAL                                                   
              PERFORM 2010-CLEAR-TRNFR-SCREEN                                   
              PERFORM 2020-CLEAR-ASSET-SCREEN                                   
              PERFORM 7210-DELETE-ASSET-TSQ                                     
              PERFORM 0700-SETUP-TFR-SCREEN                             15960000
              MOVE ACAT25-TFR-ACAT TO ACAT25-PASS-ACAT                          
              PERFORM 0320-SAVE-ASSETS-IN-TS                            15960000
              MOVE +1 TO ASSET-ITEM                                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              IF WK-TS-READ-OK                                                  
                 PERFORM 0710-SETUP-ASSET-SCREEN                        15960000
                    THRU 0710-EXIT                                      15960000
                     VARYING SUB FROM 1 BY 1                            15960000
                     UNTIL SUB > 3                                      15960000
                 MOVE +1 TO TWA-ASSET-PAGE-NUM                                  
              END-IF.                                                           
           PERFORM 0645-CLOSE-PEND-BY-ENGIN2.                                   
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *       PF8: NEXT HISTORY TFR BY ACAT SEARCH                    *         
      *---------------------------------------------------------------*         
       6130-HIST-NEXT-PAGE-BY-ACAT.                                             
           MOVE TWA-MAP-ACAT  TO ACAT25-PASS-ACAT.                              
           PERFORM 0650-OPEN-HIST-BY-ACAT2.                                     
           PERFORM 0651-FETCH-HIST-BY-ACAT2.                                    
           IF ACAT25IO-NOT-FOUND                                                
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'LAST PAGE' TO SYSTEM-MSG                                 
              END-IF                                                            
           ELSE                                                                 
           IF ACAT25IO-NORMAL                                                   
              PERFORM 2010-CLEAR-TRNFR-SCREEN                                   
              PERFORM 2020-CLEAR-ASSET-SCREEN                                   
              PERFORM 2030-CLEAR-SEARCH-ENGINE-FLDS                             
              PERFORM 7210-DELETE-ASSET-TSQ                                     
              PERFORM 0700-SETUP-TFR-SCREEN                             15960000
              MOVE ACAT25-TFR-ACAT TO ACAT25-PASS-ACAT                          
              PERFORM 0420-SAVE-HIST-ASSETS-IN-TS                       15960000
              MOVE +1 TO ASSET-ITEM                                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              IF WK-TS-READ-OK                                                  
                 PERFORM 0710-SETUP-ASSET-SCREEN                        15960000
                    THRU 0710-EXIT                                      15960000
                     VARYING SUB FROM 1 BY 1                            15960000
                     UNTIL SUB > 3                                      15960000
                 MOVE +1 TO TWA-ASSET-PAGE-NUM                                  
              END-IF.                                                           
           PERFORM 0652-CLOSE-HIST-BY-ACAT2.                                    
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *       PF8: NEXT HISTORY TFR BY SEARCH ENGINE SEARCH           *         
      *---------------------------------------------------------------*         
       6140-HIST-NEXT-PAGE-BY-ENGIN.                                            
           PERFORM 1390-SETUP-PASS-PARMS.                                       
           MOVE TWA-MAP-BR   TO ACAT25-PASS-BR.                                 
           MOVE ACAT25-PASS-BR    TO ACAT25-PASS-TO-BR.                         
           MOVE TWA-MAP-AC   TO ACAT25-PASS-AC.                                 
           MOVE TWA-MAP-ACAT TO ACAT25-PASS-ACAT.                               
           PERFORM 0653-OPEN-HIST-BY-ENGIN2.                                    
           PERFORM 0654-FETCH-HIST-BY-ENGIN2.                                   
           IF ACAT25IO-NOT-FOUND                                                
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'LAST PAGE' TO SYSTEM-MSG                                 
              END-IF                                                            
           ELSE                                                                 
           IF ACAT25IO-NORMAL                                                   
              PERFORM 2010-CLEAR-TRNFR-SCREEN                                   
              PERFORM 2020-CLEAR-ASSET-SCREEN                                   
              PERFORM 7210-DELETE-ASSET-TSQ                                     
              PERFORM 0700-SETUP-TFR-SCREEN                             15960000
              MOVE ACAT25-TFR-ACAT TO ACAT25-PASS-ACAT                          
              PERFORM 0420-SAVE-HIST-ASSETS-IN-TS                       15960000
              MOVE +1 TO ASSET-ITEM                                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              IF WK-TS-READ-OK                                                  
                 PERFORM 0710-SETUP-ASSET-SCREEN                        15960000
                    THRU 0710-EXIT                                      15960000
                     VARYING SUB FROM 1 BY 1                            15960000
                     UNTIL SUB > 3                                      15960000
                 MOVE +1 TO TWA-ASSET-PAGE-NUM                                  
              END-IF.                                                           
           PERFORM 0655-CLOSE-HIST-BY-ENGIN2.                                   
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          PA1:  NEXT ASSET PAGE                                *         
      *---------------------------------------------------------------*         
       6200-NEXT-ASSET-PAGE.                                                    
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           IF TWA-ASSET-PAGE-NUM = TWA-MAX-ASSET-PAGE-NUM                       
              SET   WK-ERROR    TO TRUE                                         
              MOVE 'LAST PAGE' TO SYSTEM-MSG                                    
           ELSE                                                                 
              PERFORM 2020-CLEAR-ASSET-SCREEN                                   
              ADD +1 TO TWA-ASSET-PAGE-NUM                                      
              MOVE TWA-ASSET-PAGE-NUM TO ASSET-ITEM                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              PERFORM 0710-SETUP-ASSET-SCREEN                           15960000
                 THRU 0710-EXIT                                         15960000
                   VARYING   SUB FROM 1 BY 1   UNTIL SUB > 3            15960000
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           PA2:   PREVIOUS ASSET PAGE                          *         
      *---------------------------------------------------------------*         
       6300-PREV-ASSET-PAGE.                                                    
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           IF TWA-ASSET-PAGE-NUM = 1                                            
              SET   WK-ERROR    TO TRUE                                         
              MOVE 'FIRST PAGE' TO SYSTEM-MSG                                   
           ELSE                                                                 
              PERFORM 2020-CLEAR-ASSET-SCREEN                                   
              SUBTRACT +1 FROM TWA-ASSET-PAGE-NUM                               
              MOVE TWA-ASSET-PAGE-NUM TO ASSET-ITEM                             
              PERFORM 7200-READ-ASSET-TSQ                                       
              PERFORM 0710-SETUP-ASSET-SCREEN                           15960000
                 THRU 0710-EXIT                                         15960000
                   VARYING   SUB FROM 1 BY 1   UNTIL SUB > 3            15960000
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *-------------------------------------------------------------*           
      *           TS QUEUE FOR TWA AREA                             *           
      *-------------------------------------------------------------*           
       7000-READ-TSQ-RTN.                                                       
           MOVE '25PD'   TO TRAN-ID.                                            
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                                   
                              INTO(TWA-AREA)                                    
                              LENGTH(LENGTH OF TWA-AREA)                        
                              ITEM(ITEM-NUM)                                    
           END-EXEC.                                                            
           IF (EIBRESP NOT = +0)                                                
           AND (NOT FIRST-TIME)                                                 
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT25MO                                        
              MOVE 'ACAT25PD READ TSQ ERROR'                                    
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
       7010-DELETE-TSQ-RTN.                                                     
           MOVE '25PD'   TO TRAN-ID.                                            
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                                 
           END-EXEC.                                                            
                                                                                
       7020-WRITE-TSQ-RTN.                                                      
           MOVE '25PD'   TO TRAN-ID.                                            
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                                  
                               FROM(TWA-AREA)                                   
                               LENGTH(LENGTH OF TWA-AREA)                       
                               ITEM(ITEM-NUM)                                   
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT25MO                                        
              MOVE 'ACAT25PD WRITE TSQ ERROR'                                   
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *-------------------------------------------------------------*           
      *           TS QUEUE FOR ASSET TABLE                          *           
      *-------------------------------------------------------------*           
       7200-READ-ASSET-TSQ.                                                     
           MOVE EIBTRMID TO ASSET-TERM.                                         
           MOVE SPACE TO WK-TS-READ-FLAG.                               15960000
           EXEC CICS READQ TS QUEUE(ASSET-TSQ)                                  
                              INTO(TS-ASSET-AREA)                               
                              LENGTH(LENGTH OF TS-ASSET-AREA)                   
                              ITEM(ASSET-ITEM)                                  
                              RESP(WK-RESP)                                     
           END-EXEC.                                                            
           IF WK-RESP = 0                                               15960000
              SET WK-TS-READ-OK TO TRUE                                 15960000
           ELSE                                                         15960000
           IF WK-RESP = DFHRESP(ITEMERR)                                15960000
              SET WK-TS-READ-ERROR TO TRUE.                             15960000
      *                                                                         
       7210-DELETE-ASSET-TSQ.                                                   
           MOVE EIBTRMID TO ASSET-TERM.                                         
           EXEC CICS DELETEQ TS QUEUE(ASSET-TSQ)                                
           END-EXEC.                                                            
                                                                                
                                                                                
       7220-WRITE-ASSET-TSQ.                                                    
           MOVE EIBTRMID TO ASSET-TERM.                                         
           EXEC CICS WRITEQ TS QUEUE(ASSET-TSQ)                                 
                               FROM(TS-ASSET-AREA)                              
                               LENGTH(LENGTH OF TS-ASSET-AREA)                  
                               ITEM(ASSET-ITEM)                                 
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT25MO                                        
              MOVE 'ACAT25PD ASSET WRITE TSQ ERROR'                             
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
      *                                                                         
       7230-REWRITE-ASSET-TSQ.                                                  
           MOVE EIBTRMID TO ASSET-TERM.                                         
           EXEC CICS WRITEQ TS QUEUE(ASSET-TSQ)                                 
                               FROM(TS-ASSET-AREA)                              
                               LENGTH(LENGTH OF TS-ASSET-AREA)                  
                               ITEM(ASSET-ITEM)                                 
                               REWRITE                                          
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT25MO                                        
              MOVE 'ACAT25PD ASSET REWRITE TSQ ERROR'                           
                TO SYSTEM-MSG                                                   
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
      *               XCTL TO CONTROL PROGRAM                       *           
      *-------------------------------------------------------------*           
       7510-XCTL-TO-CONTROL-PROG.                                               
           EXEC CICS XCTL                                                       
                  PROGRAM('ACAT01CP')                                           
                  COMMAREA(ACATCOMM-COMMAREA)                                   
                  LENGTH(LENGTH OF ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
      *                                                                         
      *-------------------------------------------------------------*           
      *            CALL DB2 I/O MODULE ACAT25DB                     *           
      *-------------------------------------------------------------*           
       7600-LINK-TO-ACAT25DB.                                                   
           EXEC CICS LINK                                                       
                     PROGRAM('ACAT25DB')                                        
                     COMMAREA(ACAT25IO-COMMAREA)                                
                     LENGTH(LENGTH OF ACAT25IO-COMMAREA)                        
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
      *       CALL NUMERIC EDIT MODULE                              *           
      *-------------------------------------------------------------*           
       7900-LINK-TO-ACATMSD.                                                    
           EXEC CICS LINK PROGRAM (WS-ACATMSD)                          02890002
                COMMAREA(ACATMSD-CALL-AREA)                             02900002
                LENGTH(LENGTH OF ACATMSD-CALL-AREA)                     02910002
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
           EXEC CICS SEND MAP('ACAT25M')                                        
                     MAPSET('ACAT25M')                                          
                     FROM(ACAT25MO)                                             
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
               EXEC CICS SEND MAP('ACAT25M')                                    
                         MAPSET('ACAT25M')                                      
                         FROM(ACAT25MO)                                         
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
           EXEC CICS RECEIVE MAP('ACAT25M')                                     
                             MAPSET('ACAT25M')                                  
                             FROM(ACAT-RECEIVE-MAP)                             
                             INTO(ACAT25MI)                                     
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)                    
           END-EXEC.                                                            
           EXEC CICS RECEIVE MAP('TRLMAP')                                      
                             MAPSET('ACAT00M')                                  
                             FROM(ACAT-RECEIVE-MAP)                             
                             INTO(TRLMAPI)                                      
                             LENGTH(ACAT-RECEIVE-MAP-LENGTH)                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
       8600-BR-AE-SECURITY.                                             04772510
           INITIALIZE ACAT-SRCH-COMM-AREA.                                      
           SET SECURITY-LOOKUP      TO TRUE.                                    
           MOVE ACAT25-TFR-BRANCH   TO SRCH-INP-BRANCH.                 04597609
           MOVE ACAT25-TFR-RR       TO SRCH-INP-RR.                     04597609
           EXEC CICS LINK                                                       
                     PROGRAM('ACATSRCH')                                        
                     COMMAREA(ACAT-SRCH-COMM-AREA)                              
                     LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)                      
           END-EXEC.                                                            
       EJECT                                                            04777303
                                                                        04777403
       CALL-SECLINK-RTN.                                                AEISAC07
           EXEC CICS LINK PROGRAM ('SECLINK')                           AEISAC07
                COMMAREA(SECLINK-LIST)                                          
                LENGTH(LENGTH OF SECLINK-LIST)                          AEISAC07
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
           IF TWA-PEND-TRNFR                                                    
           AND ACAT-CALLING-PROG-NAME NOT = 'ACAT21PT'                          
                MOVE 'ACAT21PT' TO ACAT-CALLING-PROG-NAME                       
           END-IF.                                                              
           IF TWA-HIST-TRNFR                                                    
           AND ACAT-CALLING-PROG-NAME NOT = 'ACAT22TH'                          
                MOVE 'ACAT22TH' TO ACAT-CALLING-PROG-NAME                       
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
                                                                                
