000001* PDX    - ACAT32RX C0318727 01/11/12 13:48:57 TBLAMUR            00001000
000001* PDX    - ACAT32RX C0270299 09/15/08 16:34:06 TBLAMUR            00001000
000001* LRM SSRS 55766 55717 RECOMPILE ONLY FOR COPYS ACATCOM,90TS,JUMP.        
000001* PDX    - ACAT32RX C0250441 06/25/07 15:48:24 TBLAMUR            00001000
LRM003* SSR 53075 SPIN-OFF CHANGES                                              
000001* PDX    - ACAT32RX C0246057 05/17/07 15:17:49 TBLAMUR            00001000
LRM002* SSR 47213 ADD OPTIONAL EXPIRATION DATE AND COMMENT TO MAP               
000001* PDX    - ACAT32RX C0179784 09/26/02 14:42:35 TBEDTAK            00001000
000001* PDX    - ACAT32RX C0157168 06/25/01 09:05:48 TBLAMUR            00001000
000001* PDX    - ACAT32RX C0156118 06/13/01 11:10:33 TBLAMUR            00001000
000001* PDX    - ACAT32RX C0151771 02/23/01 11:18:23 TBDOJUN            00001000
000001* PDX    - ACAT32RX C0123136 04/09/99 10:15:04 TBEDTAK            00001000
000001* PDX    - ACAT32RX C0121529 02/10/99 11:41:23 TBEDTAK            00001000
000001* PDX    - ACAT32RX C0109165 10/29/98 15:32:55 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT32RX.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *            ACAT PROCESS/RESIDUAL CREDIT EXCLUSIONS            *         
      *****************************************************************         
      *  DATABASE:                                                    *         
      *  - VRSDACC  (ACCT EXCLUDED FROM RESIDUAL CREDIT)              *         
      *  - VRSDSEC  (SECURITY EXCLUDED FROM RESIDUAL CREDIT)          *         
      *  PURPOSE:                                                     *         
      *  - THE PROGRAM DISPLAYS A LIST OF ACCOUNTS THAT WERE          *         
      *    PREVIOUSLY DELIVERED OUT VIA AN ACAT BUT REMAIN ACTIVE AT  *         
      *    THE DELIVERING FIRM AND SHOULD NOT BE PART OF THE RESIDUAL *         
      *    CREDIT SWEEP PROCESS.                                      *         
      *  - THE PROGRAM ALLOWS THE USER TO DELETE ACCT, OR SECURITIES  *         
      *    THAT BELONG TO AN ACCT BY TYPING 'D' IN THE ACTION FIELD.  *         
      *  - THE PROGRAM ALSO ALLOWS THE USER TO ADD A NEW ACCOUNT WITH *         
      *    SECURITIES OR ADD ONLY SECURITIES THAT BELONG TO AN ACCT.  *         
      *  - PF2 KEY IS USED TO ADD ACCOUNT WITH SECURITIES.            *         
      *  - PF3 KEY IS USED TO CANCEL ADDING MODE.                     *         
      *  - PF5 KEY IS USED TO UPDATE THE DATABASE FOR ADD/DEL.        *         
      *  - PF7 & PF8 KEYS ARE USED FOR PAGING.                        *         
LRM001*  CORRECT BUG WHERE USER CAN'T DELETE SECURITY WHEN THE MSD    *         
LRM001*  CUSIP WAS CHANGED SINCE IT WAS ENTERED.  SAVE DATABASE CUSIP *         
LRM001*  IN THE TWA IN MAINTENANCE MODE NOT THE CURRENT MSD CUSIP.    *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
       77  TWA-SIZE                       PIC S9(4) COMP.                       
       77  ACATVR-DATASET                 PIC X(08) VALUE 'ACATIT'.             
       77  WS-EDITMOD                     PIC X(08) VALUE 'ACATEDIT'.           
       77  WS-ACATMSD                     PIC X(08) VALUE 'ACATMSD'.    00140002
       77  WS-ACATNAIO                    PIC X(08) VALUE 'ACAT00NA'.   00140002
       77  CURR-EDIT-LEN                  PIC S9(4) COMP  VALUE +35.            
      *                                                                         
       01  TSQ-WORK-AREA.                                                       
           05  TWA-TSQ.                                                         
               09  TSQ-NAME.                                                    
                   11 TERM-ID             PIC X(04).                            
                   11 TRAN-ID             PIC X(04).                            
               09  ITEM-NUM               PIC S9(04) COMP VALUE +1.             
           05  TSQ-SAVE-AREA.                                                   
               09  TSQ-SAVE.                                                    
                   11 TS-TERM             PIC X(04).                            
                   11 TS-KEY1             PIC X(04) VALUE 'KEY1'.               
               09  TS-ITEM                PIC S9(04) COMP.                      
      *                                                                         
       01  TS-SAVE-KEY-AREA.                                                    
           05  TS-SAVE-BR-AC.                                                   
               07  TS-SAVE-BR             PIC X(03).                            
               07  TS-SAVE-AC             PIC X(05).                            
           05  TS-SAVE-SEC                PIC X(09).                            
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
       01  WS-QTY                      USAGE COMP-2.                            
       EJECT                                                            00230002
      *                                                                         
       01  WS-SWITCH-AREA.                                                      
           05  WK-ERROR-SW                PIC X(01) VALUE SPACE.                
               88  WK-ERROR                         VALUE 'Y'.                  
           05  WK-MSG-ON-SW               PIC X(01) VALUE SPACE.                
               88  WK-MSG-ON                        VALUE 'Y'.                  
           05  WS-NO-MORE-ACCT-SW         PIC X(01) VALUE SPACE.                
               88  WS-NO-MORE-ACCT                  VALUE 'N'.                  
           05  WS-NO-MORE-SEC-SW          PIC X(01) VALUE SPACE.                
               88  WS-NO-MORE-SEC                   VALUE 'N'.                  
           05  WS-DELETE-SW               PIC X(01) VALUE SPACE.                
               88  WS-DELETE-SW-ON                  VALUE 'D'.                  
           05  WS-SEARCH-CHANGED-SW       PIC X(01).                            
               88  WS-SEARCH-CHANGED                VALUE 'Y'.                  
           05  WS-PARENT-ACCT-FOUND-SW    PIC X(01).                            
               88  WS-PARENT-ACCT-FOUND             VALUE 'Y'.                  
           05  WS-NO-ACCT-DATA-EXIST-SW   PIC X(01).                            
               88  WS-NO-ACCT-DATA-EXIST            VALUE 'N'.                  
           05  WS-SEC-FOUND-SW            PIC X(01).                            
               88  WS-SEC-FOUND                     VALUE 'Y'.                  
           05  WS-UPDATE-SW               PIC X(01) VALUE SPACES.               
               88  WS-UPDATE-OK                     VALUE 'Y'.                  
LRM002     05  WS-EXPDT-ERROR-SW          PIC X(01) VALUE SPACES.               
LRM002         88  EXPDT-OK                         VALUE 'Y'.                  
LRM002         88  EXPDT-ERROR                      VALUE 'N'.                  
       01  ACAT-WORK-AREA.                                                      
           05  WS-DELETE-CUSIP-TBL.                                             
               07  WS-DELETE-CUSIP        PIC X(12) OCCURS 3 TIMES.             
           05  WS-ACCT-IN-TBL-IND-AREA.                                         
               07  WS-ACCT-IN-TBL-IND     PIC X(01) OCCURS 8 TIMES.             
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
           05  WK-BRW-KEY.                                                      
               09 WK-BRW-CLIENT           PIC X(03).                            
               09 WK-BRW-RECORD-TYPE      PIC X(02)   VALUE '90'.               
               09 WK-BRW-CUR-BR-AC.                                             
                  15 WK-BRW-CURRENCY      PIC X(03).                            
                  15 WK-BRW-BRANCH        PIC X(03).                            
                  15 WK-BRW-ACCOUNT       PIC X(05).                            
           05  WS-RR-CODE                 PIC X(03).                            
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
           05  TS-READ-FLAG               PIC X(01).                    15960000
               88 TS-READ-OK                        VALUE 'O'.          15960000
               88 TS-READ-ITEM-ERR                  VALUE 'I'.          15960000
               88 TS-READ-QID-ERR                   VALUE 'Q'.          15960000
           05  WS-LINE-DELETED-SW         PIC X(01).                            
               88  WS-LINE-DELETED                  VALUE 'Y'.                  
           05  WS-KEY-FOUND-SW            PIC X(01).                            
               88  WS-KEY-FOUND                     VALUE 'Y'.                  
           05  WS-SEC-KEY-FOUND-SW        PIC X(01).                            
               88  WS-SEC-KEY-FOUND                 VALUE 'Y'.                  
           05  WS-ACCT-FOUND-SW           PIC X(01).                            
               88  WS-ACCT-EQUAL-FOUND              VALUE 'E'.                  
               88  WS-ACCT-GREATER-FOUND            VALUE 'G'.                  
               88  WS-ACCT-SMALLER-FOUND            VALUE 'S'.                  
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
           05  WS-SEC-KEY.                                                      
               09  WS-SEC-CLT-KEY         PIC X(04).                            
               09  WS-SEC-SEC-KEY         PIC X(09).                            
           05  WS-BR-AC-KEY.                                                    
               09  WS-BR-KEY              PIC X(03).                            
               09  WS-AC-KEY              PIC X(05).                            
           05  WS-BR-AC-NBR.                                                    
               09  WS-BR-NBR              PIC X(03).                            
               09  WS-AC-NBR              PIC X(05).                            
           05  WS-PREV-PAGE-KEY           PIC X(08).                            
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
           05  WS-ADPSEC-EDITED.                                                
               09  WS-XX-ADPSEC           PIC X(02).                            
               09  WS-ADPSEC              PIC X(07).                            
               09  FILLER                 PIC X(03).                            
           05  DB2IO-ERR-MSG              PIC X(54).                            
           05  SAVE-INTRAN-FLAG           PIC X(01).                            
           05  PREV-INTRAN-FLAG           PIC X(01).                            
           05  WS-ACAT-NEXT               PIC X.                                
           05  WS-SECURITY                PIC X(12).                            
           05  WS-DIVIDED                 PIC S9(09) COMP-3.                    
           05  WS-REMAIN                  PIC S9(03) COMP-3.                    
           05  WS-LOOP-CNT                PIC S9(09) COMP-3.                    
           05  SUB                        PIC S9(09) COMP-3.                    
           05  SUB2                       PIC S9(09) COMP-3.                    
           05  SUB3                       PIC S9(09) COMP-3.                    
           05  C-IDX                      PIC S9(03) COMP-3.                    
           05  WS-SEC-LINE                PIC S9(03) COMP-3.                    
           05  WS-MAP-LINE                PIC S9(03) COMP-3.                    
      *                                                                         
       01  ACATPPIO-CALL-AREA.                                                  
           COPY ACATPPIO.                                                       
           EJECT                                                                
       01  ACATMSD-CALL-AREA.                                                   
           COPY ACATMSDI.                                                       
           EJECT                                                                
       01  ACAT32IO-COMMAREA.                                                   
           COPY ACAT32IO.                                                       
           EJECT                                                                
       01  WS-POP-UP-WORKAREA.                                                  
           COPY ACAT90TS.                                                       
           EJECT                                                        01660002
       01  ACATNAIO-CALL-AREA.                                                  
           COPY ACATNAIO.                                                       
           EJECT                                                                
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
       COPY ACAT32M.                                                            
       01  ACAT32MR REDEFINES ACAT32MI.                                         
           02  FILLER                          PIC X(12).                       
           02  SECURITY-INFO     OCCURS 8 TIMES.                                
               03  ACT-L                       PIC S9(4) COMP.                  
               03  ACT-A                       PIC X(01).                       
               03  ACT-O                       PIC X(01).                       
               03  BR-L                        PIC S9(4) COMP.                  
               03  BR-A                        PIC X(01).                       
               03  BR-O                        PIC X(03).                       
               03  AC-L                        PIC S9(4) COMP.                  
               03  AC-A                        PIC X(01).                       
               03  AC-O                        PIC X(05).                       
               03  RR-L                        PIC S9(4) COMP.                  
               03  RR-A                        PIC X(01).                       
               03  RR-O                        PIC X(03).                       
LRM002         03  CMNT-L                      PIC S9(4) COMP.                  
LRM002         03  CMNT-A                      PIC X(01).                       
LRM002         03  CMNT-O                      PIC X(01).                       
LRM002         03  EXPDT-L                     PIC S9(4) COMP.                  
LRM002         03  EXPDT-A                     PIC X(01).                       
LRM002         03  EXPDT-O                     PIC X(08).                       
               03  SEC-L                       PIC S9(4) COMP.                  
               03  SEC-A                       PIC X(01).                       
               03  SEC-O                       PIC X(12).                       
               03  DESC1-L                     PIC S9(4) COMP.                  
               03  DESC1-A                     PIC X(01).                       
               03  DESC1-O                     PIC X(30).                       
               03  NAME-L                      PIC S9(4) COMP.                  
               03  NAME-A                      PIC X(01).                       
               03  NAME-O                      PIC X(30).                       
               03  DESC2-L                     PIC S9(4) COMP.                  
               03  DESC2-A                     PIC X(01).                       
               03  DESC2-O                     PIC X(30).                       
           02  FILLER                          PIC X(04).                       
LRM002 01  TSQ-COMMENT-AREA.                                                    
LRM002     02  TSQ-COMMENT-ENTRY OCCURS 8 TIMES.                                
LRM002         03 TSQ-MAP-COMMENT   PIC X(120).                                 
            EJECT                                                               
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
           03  FILLER                          PIC X(2000).                     
                                                                                
       COPY TWACOMMN.                                                           
           03 TWA-ACAT-AREA.                                                    
              05 TWA-PAGE-NUM               PIC S9(04) COMP.                    
              05 TWA-MAP-AREA.                                                  
                 07 TWA-MAP-ACCT-AREA.                                          
                    09 FILLER   OCCURS 8 TIMES.                                 
                       11 TWA-MAP-ACT       PIC X(01).                          
                       11 TWA-MAP-BR-AC.                                        
                          13 TWA-MAP-BR     PIC X(03).                          
                          13 TWA-MAP-AC     PIC X(05).                          
                       11 TWA-MAP-RR        PIC X(03).                          
LRM002                 11 TWA-MAP-CMNT      PIC X(01).                          
LRM002                 11 TWA-MAP-EXPDT.                                        
LRM002                    13 TWA-MAP-EXPDT-MM  PIC X(02).                       
LRM002                    13 TWA-MAP-EXPDT-S1  PIC X(01).                       
LRM002                    13 TWA-MAP-EXPDT-DD  PIC X(02).                       
LRM002                    13 TWA-MAP-EXPDT-S2  PIC X(01).                       
LRM002                    13 TWA-MAP-EXPDT-YY  PIC X(02).                       
LRM002                 11 TWA-ORIG-EXPDT    PIC X(10).                          
                       11 TWA-MAP-SEC       PIC X(12).                          
                       11 TWA-MAP-DESC1     PIC X(30).                          
                       11 TWA-MAP-NAME      PIC X(30).                          
                       11 TWA-MAP-DESC2     PIC X(30).                          
                       11 TWA-MAP-ADP-NBR   PIC X(07).                          
                 07 TWA-MAP-NEXT            PIC X(01).                          
              05 TWA-MAP-SAVE-AREA.                                             
                 07 TWA-SCR-LINE            PIC 9(03).                          
                 07 TWA-UPDATE-IND          PIC X(01).                          
                    88 TWA-UPDATE-MOD                 VALUE 'M'.                
                    88 TWA-UPDATE-ADD                 VALUE 'A'.                
                 07 TWA-SCR-KEYS.                                               
                    09 TWA-BR-AC-KEY-FIRST.                                     
                       11 TWA-BR-KEY-FIRST  PIC X(03).                          
                       11 TWA-AC-KEY-FIRST  PIC X(05).                          
                    09 TWA-SEC-KEY-FIRST    PIC X(09).                          
                    09 TWA-BR-AC-KEY-LAST.                                      
                       11 TWA-BR-KEY-LAST   PIC X(03).                          
                       11 TWA-AC-KEY-LAST   PIC X(05).                          
                    09 TWA-SEC-KEY-LAST     PIC X(09).                          
LRM002           07 TWA-CMNT-SUB            PIC 9(01).                          
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
              MOVE LOW-VALUE TO ACAT32MO                                        
              SET WK-ERROR TO TRUE                                              
              MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO SYSTEM-MSG             
              PERFORM  9000-ERROR-RTN.                                          
                                                                                
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                          
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       MAIN-PROCESSING.                                                         
           INITIALIZE ACAT32IO-COMMAREA.                                        
           MOVE EIBTRMID TO TERM-ID.                                            
           MOVE 'ACAX'   TO TRAN-ID.                                            
           MOVE EIBTRMID TO TS-TERM.                                            
           MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                               
           MOVE 'N'           TO END-OF-DATA-FLAG.                              
           MOVE SPACES        TO SYSTEM-MSG.                                    
           MOVE 0             TO WK-CURSOR.                                     
           MOVE LOW-VALUE     TO HDRMAPO                                        
                                 ACAT32MO.                                      
           PERFORM 0100-GET-DATE-AND-TIME.                                      
           MOVE  DFHCOMMAREA     TO  ACATCOMM-COMMAREA.                         
           MOVE  TWA-CLIENT-NO-X TO  WK-CLT-NBR.                                
           MOVE  WK-CLT          TO  ACAT32-PASS-CLT                            
                                     ACAT32-PASS-SRCH-CLT.                      
           IF ACAT-SUPER-SIGN-ON-UPDATE                                         
              SET WS-UPDATE-OK     TO TRUE                                      
           ELSE                                                                 
              PERFORM 0150-CHECK-UPDATE-MODE.                                   
                                                                                
      *    IF  ACAT-CALLING-PROG-NAME = 'ACAT32RX'                              
      *        PERFORM RETURN-FROM-DETAIL-RTN                                   
      *    END-IF.                                                              
                                                                                
      *    IF  EIBAID = DFHPF10                                                 
      *    AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                              
      *        MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
      *        PERFORM BROWSING-RTN                                             
      *    ELSE                                                                 
      *    MOVE SPACES TO ACAT-CALLING-PROG-NAME.                               
           IF  ACAT-PROGRAM-NAME = 'ACAT32RX'                                   
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
               PERFORM 0900-CONTINUE-PROCESS                                    
      *    ELSE                                                                 
      *    IF  ACAT-PROGRAM-NAME = 'RATT01  '                                   
      *        PERFORM 7000-READ-TSQ-RTN                                        
      *        PERFORM 7010-DELETE-TSQ-RTN                                      
      *        PERFORM BROWSING-RTN                                             
           ELSE                                                                 
               MOVE 'ACAT32RX' TO ACAT-PROGRAM-NAME                             
               PERFORM 0200-FIRST-TIME-RTN.                                     
           EJECT                                                                
      *                                                                         
      *--------------------------------------------------------*                
      *    GET CURRENT DATE AND TIME                           *                
      *--------------------------------------------------------*                
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
      *--------------------------------------------------------*                
      *     IS USER ALLOWED TO UPDATE?                         *                
      *--------------------------------------------------------*                
       0150-CHECK-UPDATE-MODE.                                                  
           MOVE SPACES    TO SECLINK-LIST.                                      
           MOVE '2'       TO SECLINK-ACTION-CODE.                               
           MOVE 'SCON'    TO SECLINK-TYPE.                                      
           MOVE 'ACAXYU'  TO SECLINK-ITEM.                                      
           PERFORM CALL-SECLINK-RTN.                                    AEISAC07
           IF SECLINK-RETURN-CODE = '00' OR '20'                                
              SET WS-UPDATE-OK  TO TRUE.                                        
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------*                
      *         FIRST TIME ROUTINE                             *                
      *--------------------------------------------------------*                
       0200-FIRST-TIME-RTN.                                                     
           SET FIRST-TIME TO TRUE.                                              
           MOVE 'Y' TO ACAT-NEXT.                                               
LRM002     IF EIBAID = DFHPF10                                                  
LRM002     AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                              
LRM002        MOVE SPACES TO ACAT-CALLING-PROG-NAME                             
LRM002        PERFORM 7000-READ-TSQ-RTN                                         
LRM002        PERFORM 7010-DELETE-TSQ-RTN                                       
LRM002        PERFORM 0210-RETURNED-FROM-ACAT90CM                               
LRM002        IF TWA-PAGE-NUM > 1                                               
LRM002           SUBTRACT 1 FROM TWA-PAGE-NUM                                   
LRM002           MOVE TWA-PAGE-NUM TO TS-ITEM                                   
LRM002           PERFORM 7030-READ-TSQ-SAVE                                     
LRM002           MOVE TS-SAVE-BR-AC       TO TWA-BR-AC-KEY-LAST                 
LRM002           MOVE TS-SAVE-SEC         TO TWA-SEC-KEY-LAST                   
LRM002        ELSE                                                              
LRM002           MOVE 0 TO TWA-PAGE-NUM                                         
LRM002           MOVE SPACES              TO TWA-BR-AC-KEY-LAST                 
LRM002                                       TWA-SEC-KEY-LAST                   
LRM002        END-IF                                                            
LRM002        PERFORM 6100-NEXT-PAGE-RTN                                        
LRM002        MOVE -1 TO MNEXTL                                                 
LRM002        PERFORM 7020-WRITE-TSQ-RTN                                        
LRM002        PERFORM 8000-SEND-MAP-ERASE                                       
LRM002        PERFORM 8800-RETURN-TO-CICS                                       
LRM002     END-IF.                                                              
                                                                                
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           PERFORM 7040-DELETE-TSQ-SAVE.                                        
           INITIALIZE TWA-ACAT-AREA.                                            
LRM002     MOVE SPACES TO TSQ-COMMENT-AREA.                                     
           PERFORM 2000-ATTRIB-TO-ASKIP.                                        
           MOVE  ACAT-INP-BRANCH     TO MMBRO   TWA-MAP-MMBR.                   
           MOVE  ACAT-INP-ACCOUNT    TO MMACO   TWA-MAP-MMAC.                   
           MOVE  ACAT-INP-RR         TO MMRRO   TWA-MAP-MMRR.                   
           MOVE  ACAT-INP-TFR-TYP    TO MMTFRO  TWA-MAP-MMTFR.                  
           MOVE  ACAT-INP-RCV-DEL    TO MMRDO   TWA-MAP-MMRD.                   
           MOVE  ACAT-INP-CONTRA-BKR TO MMBKRO  TWA-MAP-MMBKR.                  
           MOVE  ACAT-INP-STATUS     TO MMSTATO TWA-MAP-MMSTAT.                 
           MOVE  ACAT-INP-STTL-DT    TO MMSDO   TWA-MAP-MMSD.                   
           MOVE  TWA-MAP-SEARCH      TO TWA-PREV-MAP-SEARCH.                    
           MOVE  'Y'   TO  ACAT-INP-SEL.                                        
           PERFORM 1640-VALIDATE-SRCH-ENGINE.                                   
           IF NOT WK-ERROR                                                      
              PERFORM 0300-REFRESH-WITH-NEW-ACCTS                               
              MOVE -1 TO MNEXTL.                                                
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 8000-SEND-MAP-ERASE.                                         
           PERFORM 8800-RETURN-TO-CICS.                                         
       EJECT                                                                    
LRM002 0210-RETURNED-FROM-ACAT90CM.                                             
LRM002     MOVE 'ACA$' TO TRAN-ID.                                              
LRM002     MOVE +1     TO ITEM-NUM.                                             
LRM002     EXEC CICS READQ TS QUEUE(TSQ-NAME)                                   
LRM002                         INTO(ACAT90CM-TS-AREA)                           
LRM002                         LENGTH(LENGTH OF ACAT90CM-TS-AREA)               
LRM002                         ITEM(ITEM-NUM)                                   
LRM002                         RESP(WK-RESP)                                    
LRM002     END-EXEC.                                                            
LRM002     IF WK-RESP = 0                                               15960000
LRM002        MOVE TWA-CMNT-SUB TO SUB                                          
LRM002        MOVE ACAT90CM-TS-MCCMNT-X120                                      
LRM002                     TO TSQ-MAP-COMMENT (SUB)                             
LRM002        IF TWA-MAP-BR-AC (SUB) = SPACE                                    
LRM002           PERFORM 4510-FIND-PARENT-ACCT-NBR                              
LRM002        ELSE                                                              
LRM002           MOVE TWA-MAP-BR (SUB) TO WS-BR-NBR                             
LRM002           MOVE TWA-MAP-AC (SUB) TO WS-AC-NBR                             
LRM002        END-IF                                                            
LRM002        IF TWA-MAP-SEC (SUB) GREATER SPACES                               
LRM002           PERFORM 4540-UPDATE-SECURITY                                   
LRM002        ELSE                                                              
LRM002           PERFORM 4550-UPDATE-ACCOUNT                                    
LRM002        END-IF.                                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *        REFRESH MAP                                           *          
      *--------------------------------------------------------------*          
       0300-REFRESH-WITH-NEW-ACCTS.                                             
           PERFORM 7040-DELETE-TSQ-SAVE.                                        
           PERFORM 0500-OPEN-ACCT-CURSOR-TBL.                                   
           MOVE 0   TO TWA-SCR-LINE  SUB  WS-SEC-LINE.                          
           MOVE SPACE TO WS-NO-MORE-ACCT-SW.                                    
           PERFORM 0400-SETUP-SCREEN                                            
               UNTIL SUB >= 8 OR WS-NO-MORE-ACCT.                               
           PERFORM 0520-CLOSE-ACCT-CURSOR-TBL.                                  
           IF TWA-SCR-LINE > 0                                                  
              MOVE +1 TO TWA-PAGE-NUM                                           
              PERFORM 0430-SAVE-KEYS-IN-TS.                                     
                                                                               2
      *                                                                         
      *--------------------------------------------------------------*          
      *             SETUP MAP                                        *          
      *--------------------------------------------------------------*          
       0400-SETUP-SCREEN.                                                       
           PERFORM 0510-FETCH-ACCT-CURSOR-TBL.                                  
           IF WS-NO-MORE-ACCT                                                   
              IF TWA-SCR-LINE = 0                                               
                 MOVE -1 TO MNEXTL                                              
                 SET WK-MSG-ON TO TRUE                                          
                 MOVE 'NO RESTRICTED ACCOUNTS FOUND FOR THIS REQUEST'           
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           ELSE                                                                 
              PERFORM 0410-SETUP-ACCT.                                          
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        MOVE ACCOUNT DATA FROM DATABASE TABLE TO MAP          *          
      *--------------------------------------------------------------*          
       0410-SETUP-ACCT.                                                         
           SET TWA-UPDATE-MOD TO TRUE.                                          
           ADD +1 TO SUB.                                                       
                                                                                
DJ0001     IF  ACAT-SIGN-ON-UPDATE                                              
           MOVE ATT-UNPROT TO ACT-A (SUB) EXPDT-A (SUB).                        
                                                                                
           MOVE ACAT32-ACT-BRANCH TO BR-O (SUB) TWA-MAP-BR (SUB).               
           MOVE ACAT32-ACT-ACCT   TO AC-O (SUB) TWA-MAP-AC (SUB).               
           MOVE ACAT32-ACT-RR     TO RR-O (SUB) TWA-MAP-RR (SUB).               
LRM002     IF ACAT32-ACT-COMMENT NOT = SPACES                                   
LRM002        MOVE ACAT32-ACT-COMMENT  TO TSQ-MAP-COMMENT (SUB)                 
LRM002        MOVE 'Y'   TO CMNT-O (SUB)  TWA-MAP-CMNT (SUB)                    
LRM002     ELSE                                                                 
LRM002        MOVE SPACES              TO TSQ-MAP-COMMENT (SUB)                 
LRM002                      CMNT-O (SUB)  TWA-MAP-CMNT (SUB)                    
LRM002     END-IF                                                               
                                                                                
LRM002     IF ACAT32-ACT-EXPDT = '0001-01-01'                                   
LRM002        MOVE SPACES           TO TWA-MAP-EXPDT (SUB)                      
LRM002                                 TWA-ORIG-EXPDT (SUB)                     
LRM002     ELSE                                                                 
LRM002        MOVE ACAT32-ACT-EXPDT-MM TO TWA-MAP-EXPDT-MM (SUB)                
LRM002        MOVE ACAT32-ACT-EXPDT-DD TO TWA-MAP-EXPDT-DD (SUB)                
LRM002        MOVE ACAT32-ACT-EXPDT-YY TO TWA-MAP-EXPDT-YY (SUB)                
LRM002        MOVE '/' TO TWA-MAP-EXPDT-S1 (SUB)                                
LRM002                    TWA-MAP-EXPDT-S2 (SUB)                                
LRM002        MOVE TWA-MAP-EXPDT (SUB) TO EXPDT-O (SUB)                         
LRM002                                 TWA-ORIG-EXPDT (SUB)                     
LRM002     END-IF                                                               
                                                                                
           IF SUB = 1                                                           
              MOVE TWA-MAP-BR (SUB)                                             
                TO TWA-BR-KEY-FIRST  TWA-BR-KEY-LAST                            
              MOVE TWA-MAP-AC (SUB)                                             
                TO TWA-AC-KEY-FIRST  TWA-AC-KEY-LAST                            
           ELSE                                                                 
              MOVE TWA-MAP-BR (SUB) TO TWA-BR-KEY-LAST                          
              MOVE TWA-MAP-AC (SUB) TO TWA-AC-KEY-LAST.                         
                                                                                
           MOVE SUB  TO TWA-SCR-LINE.                                           
                                                                                
           MOVE WK-CLT(2:3) TO ACATNAIO-CLIENT.                                 
           MOVE TWA-MAP-BR (SUB) TO ACATNAIO-BR.                                
           MOVE TWA-MAP-AC (SUB) TO ACATNAIO-AC.                                
           SET ACATNAIO-NA-READ TO TRUE.                                        
           PERFORM 7800-LINK-TO-ACATNAIO.                                       
           IF ACATNAIO-FOUND                                                    
              MOVE ACATNAIO-NAME  TO NAME-O (SUB) TWA-MAP-NAME (SUB).           
                                                                                
           MOVE TWA-MAP-BR (SUB) TO ACAT32-PASS-BR.                             
           MOVE TWA-MAP-AC (SUB) TO ACAT32-PASS-AC.                             
           MOVE SUB TO TWA-SCR-LINE.                                            
           PERFORM 0600-OPEN-SEC-CURSOR-TBL.                                    
           SUBTRACT 1 FROM SUB GIVING SUB2.                                     
           MOVE SPACE TO WS-SEC-FOUND-SW                                        
                         WS-NO-MORE-SEC-SW.                                     
           PERFORM 0420-SETUP-SECURITY THRU 0420-EXIT                           
              UNTIL SUB2 >= 8  OR WS-NO-MORE-SEC.                               
           PERFORM 0620-CLOSE-SEC-CURSOR-TBL.                                   
           IF NOT WS-SEC-FOUND                                                  
              ADD 1 TO SUB2.                                                    
           MOVE SUB2 TO SUB.                                                    
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        MOVE SECURITY DATA FROM DATABASE TABLE TO MAP         *          
      *--------------------------------------------------------------*          
       0420-SETUP-SECURITY.                                                     
           MOVE 0 TO SUB3.                                                      
           PERFORM 0610-FETCH-SEC-CURSOR-TBL.                                   
           IF WS-NO-MORE-SEC                                                    
              GO TO 0420-EXIT.                                                  
                                                                                
           ADD +1 TO SUB2 SUB3.                                                 
           ADD +1 TO WS-SEC-LINE.                                               
           SET WS-SEC-FOUND TO TRUE.                                            
LRM001     MOVE ACAT32-SEC-SECURITY TO TWA-MAP-SEC (SUB2).                      
           MOVE ACAT32-SEC-ADP-NBR  TO ACATMSD-SEARCH-KEY.                      
           SET ACATMSD-MSD-READ TO TRUE.                                        
           PERFORM 7900-LINK-TO-ACATMSD.                                        
           IF ACATMSD-FOUND                                                     
              MOVE ACATMSD-ADP-NBR TO TWA-MAP-ADP-NBR (SUB2)                    
LRM001********MOVE ACATMSD-CUSIP TO SEC-O   (SUB2) TWA-MAP-SEC   (SUB2)         
LRM001        MOVE ACATMSD-CUSIP TO SEC-O   (SUB2)                              
              MOVE ACATMSD-DESC  TO DESC1-O (SUB2) TWA-MAP-DESC1 (SUB2)         
              MOVE ACATMSD-DESC2 TO DESC2-O (SUB2) TWA-MAP-DESC2 (SUB2)         
DJ0002     ELSE                                                                 
DJ0002        MOVE ACAT32-SEC-SECURITY TO SEC-O (SUB2)                          
DJ0002        MOVE 'MSD NOT AVAILABLE'                                          
DJ0002                           TO DESC1-O (SUB2) TWA-MAP-DESC1 (SUB2)         
DJ0002     END-IF.                                                              
                                                                                
LRM002     IF ACAT32-SEC-COMMENT NOT = SPACES                                   
LRM002        MOVE ACAT32-SEC-COMMENT  TO TSQ-MAP-COMMENT (SUB2)                
LRM002        MOVE 'Y'   TO CMNT-O (SUB2) TWA-MAP-CMNT (SUB2)                   
LRM002     ELSE                                                                 
LRM002        MOVE SPACES              TO TSQ-MAP-COMMENT (SUB2)                
LRM002                      CMNT-O (SUB2) TWA-MAP-CMNT (SUB2)                   
LRM002     END-IF                                                               
                                                                                
LRM002     IF ACAT32-SEC-EXPDT = '0001-01-01'                                   
LRM002        MOVE SPACES           TO TWA-MAP-EXPDT (SUB2)                     
LRM002                                 TWA-ORIG-EXPDT (SUB2)                    
LRM002     ELSE                                                                 
LRM002        MOVE ACAT32-SEC-EXPDT-MM TO TWA-MAP-EXPDT-MM (SUB2)               
LRM002        MOVE ACAT32-SEC-EXPDT-DD TO TWA-MAP-EXPDT-DD (SUB2)               
LRM002        MOVE ACAT32-SEC-EXPDT-YY TO TWA-MAP-EXPDT-YY (SUB2)               
LRM002        MOVE '/' TO TWA-MAP-EXPDT-S1 (SUB2)                               
LRM002                    TWA-MAP-EXPDT-S2 (SUB2)                               
LRM002        MOVE TWA-MAP-EXPDT (SUB2) TO EXPDT-O (SUB2)                       
LRM002                                 TWA-ORIG-EXPDT (SUB2)                    
LRM002     END-IF                                                               
                                                                                
           IF WS-SEC-LINE = 1                                                   
              MOVE TWA-MAP-SEC (SUB2)                                           
                TO TWA-SEC-KEY-FIRST TWA-SEC-KEY-LAST                           
           ELSE                                                                 
           IF WS-SEC-LINE > 1                                                   
              MOVE TWA-MAP-SEC (SUB2)                                           
                TO TWA-SEC-KEY-LAST                                             
           END-IF.                                                              
           MOVE SUB2 TO TWA-SCR-LINE.                                           
DJ0001     IF  ACAT-SIGN-ON-UPDATE                                              
           MOVE ATT-UNPROT  TO ACT-A (SUB2) EXPDT-A (SUB2).                     
       0420-EXIT.                                           EXIT.               
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *      SAVE ACCT AND SEC KEYS FOR THE PURPOSE OF PAGE DOWN     *          
      *--------------------------------------------------------------*          
       0430-SAVE-KEYS-IN-TS.                                                    
           MOVE SPACE TO TS-SAVE-KEY-AREA.                                      
           IF TWA-BR-AC-KEY-LAST > SPACE                                        
              MOVE TWA-BR-AC-KEY-LAST TO TS-SAVE-BR-AC.                         
           IF TWA-SEC-KEY-LAST > SPACE                                          
              MOVE TWA-SEC-KEY-LAST   TO TS-SAVE-SEC.                           
           MOVE TWA-PAGE-NUM TO TS-ITEM.                                        
           PERFORM 7030-READ-TSQ-SAVE.                                          
           IF TS-READ-OK                                                15960000
              PERFORM 7060-REWRITE-TSQ-SAVE                                     
           ELSE                                                         15960000
           IF TS-READ-ITEM-ERR OR TS-READ-QID-ERR                       15960000
              PERFORM 7050-WRITE-TSQ-SAVE.                                      
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           OPEN ACCT CURSOR TABLE IN ASCENDING ORDER          *          
      *--------------------------------------------------------------*          
       0500-OPEN-ACCT-CURSOR-TBL.                                               
           IF TWA-MAP-MMBR > SPACE                                              
              MOVE TWA-MAP-MMBR TO ACAT32-PASS-SRCH-BR                          
           ELSE                                                                 
              MOVE SPACES       TO ACAT32-PASS-SRCH-BR.                         
           IF TWA-MAP-MMAC > SPACE                                              
              MOVE TWA-MAP-MMAC TO ACAT32-PASS-SRCH-AC                          
           ELSE                                                                 
              MOVE SPACES       TO ACAT32-PASS-SRCH-AC.                         
           IF TWA-MAP-MMRR > SPACE                                              
              MOVE TWA-MAP-MMRR TO ACAT32-PASS-SRCH-RR                          
           ELSE                                                                 
              MOVE ALL '%'      TO ACAT32-PASS-SRCH-RR.                         
                                                                                
           SET ACAT32-OPN-ACTCSR TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-ERROR                                                      
LRM003        MOVE                                                              
LRM003        'DB2 OPEN ERROR ON RESID ACCOUNT TBL - CALL HELP DESK'            
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        FETCH ACCOUNT CURSOR TABLE IN ASCENDING ORDER         *          
      *--------------------------------------------------------------*          
       0510-FETCH-ACCT-CURSOR-TBL.                                              
           MOVE SPACE TO WS-NO-MORE-ACCT-SW.                                    
           SET ACAT32-FET-ACTCSR  TO TRUE                                       
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT32-NOT-FOUND                                                  
              SET WS-NO-MORE-ACCT TO TRUE                                       
           ELSE                                                                 
              PERFORM 0620-CLOSE-SEC-CURSOR-TBL                                 
LRM003        MOVE                                                              
LRM003        'DB2 FETCH ERROR ON RESID ACCOUNT TABLE - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
                                                                                
      *                                                                         
      *--------------------------------------------------------------*          
      *       CLOSE ACCOUNT CURSOR TABLE IN ASCENDING ORDER          *          
      *--------------------------------------------------------------*          
       0520-CLOSE-ACCT-CURSOR-TBL.                                              
           SET ACAT32-CLO-ACTCSR  TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-ERROR                                                      
LRM003        MOVE                                                              
LRM003        'DB2 CLOSE ERROR ON RESIDUAL ACCT TABLE - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           OPEN ACCT CURSOR TABLE IN DESCENDING ORDER         *          
      *--------------------------------------------------------------*          
       0550-OPEN-ACCT-CUR-DESCEND.                                              
           IF TWA-MAP-MMBR > SPACE                                              
              MOVE TWA-MAP-MMBR TO ACAT32-PASS-SRCH-BR                          
           ELSE                                                                 
              MOVE SPACES       TO ACAT32-PASS-SRCH-BR.                         
           IF TWA-MAP-MMAC > SPACE                                              
              MOVE TWA-MAP-MMAC TO ACAT32-PASS-SRCH-AC                          
           ELSE                                                                 
              MOVE SPACES       TO ACAT32-PASS-SRCH-AC.                         
           IF TWA-MAP-MMRR > SPACE                                              
              MOVE TWA-MAP-MMRR TO ACAT32-PASS-SRCH-RR                          
           ELSE                                                                 
              MOVE ALL '%'      TO ACAT32-PASS-SRCH-RR.                         
                                                                                
           SET ACAT32-OPN-ACTCSR-D TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-ERROR                                                      
LRM003        MOVE                                                              
LRM003        'DB2 OPEN ERROR ON RESTRICT ACCT DESCEND - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        FETCH ACCOUNT CURSOR TABLE IN DESCENDING ORDER        *          
      *--------------------------------------------------------------*          
       0560-FETCH-ACCT-CUR-DESCEND.                                             
           MOVE SPACE TO WS-NO-MORE-ACCT-SW.                                    
           SET ACAT32-FET-ACTCSR-D  TO TRUE                                     
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT32-NOT-FOUND                                                  
              SET WS-NO-MORE-ACCT TO TRUE                                       
           ELSE                                                                 
              PERFORM 0620-CLOSE-SEC-CURSOR-TBL                                 
LRM003        MOVE                                                              
LRM003        'DB2 FETCH ERROR ON ACCT DESCEND TABLE - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
                                                                                
      *                                                                         
      *--------------------------------------------------------------*          
      *       CLOSE ACCOUNT CURSOR TABLE IN DESCENDING ORDER         *          
      *--------------------------------------------------------------*          
       0570-CLOSE-ACCT-CUR-DESCEND.                                             
           SET ACAT32-CLO-ACTCSR-D  TO TRUE.                                    
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-ERROR                                                      
LRM003        MOVE                                                              
LRM003        'DB2 CLOSE ERROR ON ACCT DESCEND TABLE - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         OPEN SECURITY TABLE IN ASCENDING ORDER               *          
      *--------------------------------------------------------------*          
       0600-OPEN-SEC-CURSOR-TBL.                                                
           SET ACAT32-OPN-SECCSR TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-ERROR                                                      
LRM003        MOVE                                                              
LRM003        'DB2 OPEN ERROR ON RESID SECURITY TBL - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *        FETCH SECURITY TABLE IN ASCENDING ORDER               *          
      *--------------------------------------------------------------*          
       0610-FETCH-SEC-CURSOR-TBL.                                               
           MOVE SPACE TO WS-NO-MORE-SEC-SW.                                     
           SET ACAT32-FET-SECCSR TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT32-NOT-FOUND                                                  
              SET WS-NO-MORE-SEC      TO TRUE                                   
           ELSE                                                                 
LRM003        MOVE                                                              
LRM003        'DB2 FETCH ERROR ON RESID SECURITY TBL - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *        CLOSE SECURITY TABLE IN ASCENDING ORDER               *          
      *--------------------------------------------------------------*          
       0620-CLOSE-SEC-CURSOR-TBL.                                               
           SET ACAT32-CLO-SECCSR TO TRUE                                        
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-ERROR                                                      
LRM003        MOVE                                                              
LRM003        'DB2 CLOSE ERROR ON RESID SECURITY TBL - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         OPEN SECURITY TABLE IN DESCENDING ORDER              *          
      *--------------------------------------------------------------*          
       0650-OPEN-SEC-CUR-DESCEND.                                               
           SET ACAT32-OPN-SECCSR-D TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-ERROR                                                      
LRM003        MOVE                                                              
LRM003        'DB2 OPEN ERROR ON SECURITY DESCEND TBL - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *        FETCH SECURITY TABLE IN DESCENDING ORDER              *          
      *--------------------------------------------------------------*          
       0660-FETCH-SEC-CUR-DESCEND.                                              
           MOVE SPACE TO WS-NO-MORE-SEC-SW.                                     
           SET ACAT32-FET-SECCSR-D TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT32-NOT-FOUND                                                  
              SET WS-NO-MORE-SEC      TO TRUE                                   
           ELSE                                                                 
LRM003        MOVE                                                              
LRM003        'DB2 FETCH ERROR ON SECURITY DESCEND TBL - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *        CLOSE SECURITY TABLE IN DESCENDING ORDER              *          
      *--------------------------------------------------------------*          
       0670-CLOSE-SEC-CUR-DESCEND.                                              
           SET ACAT32-CLO-SECCSR-D TO TRUE                                      
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-ERROR                                                      
LRM003        MOVE                                                              
LRM003        'DB2 CLOSE ERROR ON SECURITY DESCEND TBL - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           DB2 ERROR MESSAGE ROUTINE                          *          
      *--------------------------------------------------------------*          
       0800-SEND-DB2-ERROR-MSG.                                                 
           MOVE -1 TO MNEXTL.                                                   
           SET WK-ERROR TO TRUE.                                                
           MOVE  ACAT32-SQLCODE   TO WK-ERR-SQLCODE.                            
           MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG.                                
           PERFORM 9000-ERROR-RTN.                                              
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           CONTINUE PROCESSING                                *          
      *--------------------------------------------------------------*          
       0900-CONTINUE-PROCESS.                                                   
           PERFORM 7000-READ-TSQ-RTN.                                           
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           SET DATA-ONLY TO TRUE.                                               
           EVALUATE TRUE                                                        
                WHEN EIBAID = DFHPF11 OR DFHCLEAR                               
                     PERFORM 8700-RETURN-CONTROL-RTN                            
                WHEN EIBAID = DFHPF10 OR DFHPF12                                
                     PERFORM 8800-RETURN-TO-CICS                                
                WHEN EIBAID = DFHENTER OR DFHPF5                                
                     PERFORM 1000-ENTER-KEY                                     
LRM002          WHEN EIBAID = DFHPF1                                            
LRM002               PERFORM 1800-SEND-POPUP-MAP-RTN                            
                WHEN EIBAID = DFHPF2                                            
                     PERFORM 3000-ADD-SECURITY-RTN                              
                WHEN EIBAID = DFHPF3                                            
                     PERFORM 3100-CANCEL-ADD-RTN                                
                WHEN EIBAID = DFHPF7                                            
                     PERFORM 6000-PREV-PAGE-RTN                                 
                WHEN EIBAID = DFHPF8                                            
                     PERFORM 6100-NEXT-PAGE-RTN                                 
                WHEN OTHER                                                      
                     SET  WK-ERROR  TO TRUE                                     
                     MOVE LOW-VALUE TO ACAT32MO                                 
                     MOVE -1 TO MNEXTL                                          
                     MOVE 'ERROR FUNCTION KEY'                                  
                       TO SYSTEM-MSG                                            
                     PERFORM 9000-ERROR-RTN                                     
           END-EVALUATE.                                                        
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 8100-SEND-MAP-DATA-ONLY.                                     
           PERFORM 8800-RETURN-TO-CICS.                                         
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           USER HIT ENTER KEY OR PF5 KEY                      *          
      *--------------------------------------------------------------*          
       1000-ENTER-KEY.                                                          
           PERFORM 8500-RECEIVE-MAP.                                            
           MOVE SPACE  TO WK-ERROR-SW                                           
                          WK-MSG-ON-SW.                                         
                                                                                
           IF TWA-UPDATE-MOD                                                    
              MOVE SPACE TO WS-DELETE-SW                                        
              PERFORM 1100-VALIDATE-ACTION                                      
                 VARYING SUB FROM 1 BY 1                                        
                 UNTIL  SUB > 8  OR  SUB > TWA-SCR-LINE                         
              IF WS-DELETE-SW-ON                                                
                 IF NOT WK-ERROR                                                
                    MOVE -1 TO MNEXTL                                           
                    SET WK-MSG-ON TO TRUE                                       
                    MOVE 'PRESS PF5 TO CONFIRM DELETION' TO SYSTEM-MSG          
                 END-IF                                                         
              END-IF.                                                           
                                                                                
           IF TWA-UPDATE-ADD                                                    
              PERFORM 1200-VALIDATE-ACCT-N-SEC                                  
                 VARYING SUB FROM 1 BY 1 UNTIL SUB > 8                          
              IF TWA-MAP-ACCT-AREA > SPACE                                      
                 IF NOT WK-ERROR                                                
                    MOVE -1 TO MNEXTL                                           
                    SET WK-MSG-ON TO TRUE                                       
                    MOVE 'PRESS PF5 TO CONFIRM ADDITION' TO SYSTEM-MSG          
                 END-IF                                                         
              ELSE                                                              
                 MOVE -1 TO BR-L (1)                                            
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'ENTER ACCOUNT(BR+ACCT)' TO SYSTEM-MSG                 
                 END-IF.                                                        
                                                                                
           PERFORM 1600-NEXT-SELECTION-RTN.                                     
                                                                                
           IF EIBAID = DFHPF5                                                   
              IF NOT WK-ERROR                                                   
                 IF WS-UPDATE-OK                                                
                    PERFORM 4000-UPDATE-RTN                                     
                 ELSE                                                           
                    MOVE -1 TO MNEXTL                                           
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'UNAUTHORIZED TO UPDATE' TO SYSTEM-MSG                 
                 END-IF.                                                        
                                                                                
           IF (NOT WK-ERROR) OR (NOT WK-MSG-ON)                                 
              MOVE -1 TO MNEXTL.                                                
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *            VALIDATE ACTION FIELDS                              *        
      *----------------------------------------------------------------*        
       1100-VALIDATE-ACTION.                                                    
           IF ACT-L (SUB) > 0                                                   
              IF ACT-O (SUB) = TWA-MAP-ACT (SUB)                                
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE ACT-O (SUB) TO TWA-MAP-ACT (SUB)                          
              END-IF                                                            
           ELSE                                                                 
           IF ACT-A (SUB) = ERASE-KEY                                           
              MOVE SPACE TO TWA-MAP-ACT (SUB).                                  
           MOVE ATT-UNPROT TO ACT-A (SUB).                                      
                                                                                
           IF TWA-MAP-ACT (SUB) = SPACE                                         
              CONTINUE                                                          
           ELSE                                                                 
           IF TWA-MAP-ACT (SUB) = 'D'                                           
              SET WS-DELETE-SW-ON TO TRUE                                       
           ELSE                                                                 
              MOVE ATT-UNPROT-BRT TO ACT-A (SUB)                                
              MOVE -1 TO ACT-L (SUB)                                            
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'ENTER "D" TO DELETE'  TO SYSTEM-MSG                      
              END-IF.                                                           
                                                                                
LRM002     IF EXPDT-L (SUB) > 0                                                 
LRM002        IF EXPDT-O (SUB) = TWA-MAP-EXPDT (SUB)                            
LRM002           CONTINUE                                                       
LRM002        ELSE                                                              
LRM002           MOVE EXPDT-O (SUB) TO TWA-MAP-EXPDT (SUB)                      
LRM002        END-IF                                                            
LRM002     ELSE                                                                 
LRM002     IF EXPDT-A (SUB) = ERASE-KEY                                         
LRM002        MOVE SPACE TO TWA-MAP-EXPDT (SUB).                                
LRM002     MOVE ATT-UNPROT TO EXPDT-A (SUB).                                    
LRM002                                                                          
LRM002     IF TWA-MAP-EXPDT (SUB) NOT = TWA-ORIG-EXPDT (SUB)                    
LRM002        SET EXPDT-OK TO TRUE                                              
LRM002        IF TWA-MAP-EXPDT (SUB) NOT = SPACES                               
LRM002           PERFORM 1350-EXPDT-CHECK                                       
LRM002        END-IF                                                            
LRM002        IF EXPDT-OK                                                       
LRM002           IF TWA-MAP-BR-AC (SUB) = SPACE                                 
LRM002              PERFORM 4510-FIND-PARENT-ACCT-NBR                           
LRM002           ELSE                                                           
LRM002              MOVE TWA-MAP-BR (SUB) TO WS-BR-NBR                          
LRM002              MOVE TWA-MAP-AC (SUB) TO WS-AC-NBR                          
LRM002           END-IF                                                         
LRM002           IF TWA-MAP-SEC (SUB) GREATER SPACES                            
LRM002              PERFORM 4540-UPDATE-SECURITY                                
LRM002           ELSE                                                           
LRM002              PERFORM 4550-UPDATE-ACCOUNT                                 
LRM002           END-IF                                                         
LRM002           MOVE TWA-MAP-EXPDT (SUB) TO TWA-ORIG-EXPDT (SUB)               
LRM002     END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *            VALIDATE NEW ACCOUNT/SECURITY ENTRIES               *        
      *----------------------------------------------------------------*        
       1200-VALIDATE-ACCT-N-SEC.                                                
           IF BR-L (SUB) > 0                                                    
              IF BR-O (SUB) = TWA-MAP-BR (SUB)                                  
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE BR-O (SUB) TO TWA-MAP-BR (SUB)                            
              END-IF                                                            
           ELSE                                                                 
           IF BR-A (SUB) = ERASE-KEY                                            
              MOVE SPACE TO TWA-MAP-BR (SUB).                                   
           MOVE ATT-UNPROT TO BR-A (SUB).                                       
                                                                                
           IF AC-L (SUB) > 0                                                    
              IF AC-O (SUB) = TWA-MAP-AC (SUB)                                  
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE AC-O (SUB) TO TWA-MAP-AC (SUB)                            
              END-IF                                                            
           ELSE                                                                 
           IF AC-A (SUB) = ERASE-KEY                                            
              MOVE SPACE TO TWA-MAP-AC (SUB).                                   
           MOVE ATT-UNPROT TO AC-A (SUB).                                       
                                                                                
LRM002     IF EXPDT-L (SUB) > 0                                                 
LRM002        IF EXPDT-O (SUB) = TWA-MAP-EXPDT (SUB)                            
LRM002           CONTINUE                                                       
LRM002        ELSE                                                              
LRM002           MOVE EXPDT-O (SUB) TO TWA-MAP-EXPDT (SUB)                      
LRM002        END-IF                                                            
LRM002     ELSE                                                                 
LRM002     IF EXPDT-A (SUB) = ERASE-KEY                                         
LRM002        MOVE SPACE TO TWA-MAP-EXPDT (SUB).                                
LRM002     MOVE ATT-UNPROT TO EXPDT-A (SUB).                                    
LRM002                                                                          
           IF SEC-L (SUB) > 0                                                   
              IF SEC-O (SUB) = TWA-MAP-SEC (SUB)                                
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE SEC-O (SUB) TO TWA-MAP-SEC (SUB)                          
              END-IF                                                            
           ELSE                                                                 
           IF SEC-A (SUB) = ERASE-KEY                                           
              MOVE SPACE TO TWA-MAP-SEC (SUB).                                  
           MOVE ATT-UNPROT TO SEC-A (SUB).                                      
                                                                                
           MOVE 'N' TO WS-ACCT-IN-TBL-IND (SUB).                                
           IF TWA-MAP-BR (SUB) = SPACE AND TWA-MAP-AC (SUB) = SPACE             
              MOVE SPACE TO RR-O   (SUB) TWA-MAP-RR   (SUB)                     
LRM002                      CMNT-O (SUB) TWA-MAP-EXPDT (SUB)                    
LRM002                                   TWA-ORIG-EXPDT (SUB)                   
                            NAME-O (SUB) TWA-MAP-NAME (SUB)                     
           ELSE                                                                 
           IF TWA-MAP-BR (SUB) = SPACE AND TWA-MAP-AC (SUB) > SPACE             
              MOVE -1 TO BR-L (SUB)                                             
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'ENTER BRANCH' TO SYSTEM-MSG                              
              END-IF                                                            
           ELSE                                                                 
           IF TWA-MAP-BR (SUB) > SPACE AND TWA-MAP-AC (SUB) = SPACE             
              MOVE -1 TO AC-L (SUB)                                             
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'ENTER ACCOUNT' TO SYSTEM-MSG                             
              END-IF                                                            
           ELSE                                                                 
           IF TWA-MAP-BR (SUB) > SPACE AND TWA-MAP-AC (SUB) > SPACE             
              PERFORM 1300-ACCOUNT-CHECK.                                       
                                                                                
LRM002     IF TWA-MAP-EXPDT (SUB) > SPACE                                       
LRM002        PERFORM 1350-EXPDT-CHECK                                          
LRM002     END-IF.                                                              
                                                                                
           IF WS-ACCT-IN-TBL-IND (SUB) = 'Y'                                    
              IF TWA-MAP-SEC (SUB) = SPACE                                      
                 MOVE -1 TO SEC-L (SUB)                                         
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'ENTER SECURITY'                                       
                      TO  SYSTEM-MSG                                            
                 END-IF.                                                        
                                                                                
           IF TWA-MAP-SEC (SUB) > SPACE                                         
              IF TWA-MAP-BR-AC (SUB) > SPACE                                    
                 MOVE TWA-MAP-BR (SUB) TO WS-BR-NBR                             
                 MOVE TWA-MAP-AC (SUB) TO WS-AC-NBR                             
                 PERFORM 1400-SECURITY-CHECK                                    
              ELSE                                                              
                 PERFORM 4510-FIND-PARENT-ACCT-NBR                              
                 IF WS-PARENT-ACCT-FOUND                                        
                    PERFORM 1400-SECURITY-CHECK                                 
                 ELSE                                                           
                    MOVE -1 TO BR-L (SUB)                                       
                    IF NOT WK-ERROR                                             
                       SET WK-ERROR TO TRUE                                     
                       MOVE 'MISSING ACCOUNT NBR - ENTER ACCOUNT'               
                         TO  SYSTEM-MSG                                         
                    END-IF                                                      
                 END-IF.                                                        
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *     CHECK IF ACCOUNT IS IN DATABASE TABLE.                     *        
      *       1.  IF IN DB TABLE, CHECK SECURITY ENTRY.                *        
      *       2.  IF NOT IN DB TABLE, VALIDATE ACCT ENTRY.             *        
      *----------------------------------------------------------------*        
       1300-ACCOUNT-CHECK.                                                      
           MOVE TWA-MAP-BR (SUB) TO ACAT32-PASS-BR.                             
           MOVE TWA-MAP-AC (SUB) TO ACAT32-PASS-AC.                             
           SET ACAT32-FND-ACCT   TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-FOUND                                                      
              MOVE 'Y' TO WS-ACCT-IN-TBL-IND (SUB)                              
           ELSE                                                                 
           IF ACAT32-NOT-FOUND                                                  
              MOVE 'N' TO WS-ACCT-IN-TBL-IND (SUB)                              
           ELSE                                                                 
LRM003        MOVE 'DB2 COUNT ERROR ON FIND ACCT TBL - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
                                                                                
           SET ACATNAIO-NA-READ TO TRUE.                                        
           MOVE WK-CLT(2:3) TO ACATNAIO-CLIENT.                                 
           MOVE TWA-MAP-BR (SUB) TO ACATNAIO-BR.                                
           MOVE TWA-MAP-AC (SUB) TO ACATNAIO-AC.                                
           PERFORM 7800-LINK-TO-ACATNAIO.                                       
           IF ACATNAIO-FOUND                                                    
              MOVE ACATNAIO-RR   TO RR-O   (SUB) TWA-MAP-RR   (SUB)             
              MOVE ACATNAIO-NAME TO NAME-O (SUB) TWA-MAP-NAME (SUB)             
           ELSE                                                                 
              MOVE ATT-UNPROT-BRT TO BR-A (SUB)                                 
              MOVE -1 TO BR-L (SUB)                                             
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'BRANCH/ACCOUNT NOT ON NAME & ADDRESS FILE'               
                   TO  SYSTEM-MSG                                               
              END-IF.                                                           
       EJECT                                                                    
LRM002 1350-EXPDT-CHECK.                                                        
LRM002     IF TWA-MAP-EXPDT-MM (SUB) NOT NUMERIC                                
LRM002     OR (TWA-MAP-EXPDT-MM (SUB) < '01' OR > '12')                         
LRM002     OR TWA-MAP-EXPDT-DD (SUB) NOT NUMERIC                                
LRM002     OR (TWA-MAP-EXPDT-DD (SUB) < '01' OR > '31')                         
LRM002     OR TWA-MAP-EXPDT-YY (SUB) NOT NUMERIC                                
LRM002     OR (TWA-MAP-EXPDT-YY (SUB) < '01' OR > '98')                         
LRM002     OR TWA-MAP-EXPDT-S1 (SUB) NOT = '/'                                  
LRM002     OR TWA-MAP-EXPDT-S2 (SUB) NOT = '/'                                  
LRM002     OR (TWA-MAP-EXPDT-MM (SUB) = '02'                                    
LRM002     AND TWA-MAP-EXPDT-DD (SUB) > '28')                                   
LRM002     OR ((TWA-MAP-EXPDT-MM (SUB) = '04' OR '06' OR '09' OR '11')          
LRM002     AND TWA-MAP-EXPDT-DD (SUB) > '30')                                   
LRM002        MOVE ATT-UNPROT-BRT TO EXPDT-A (SUB)                              
LRM002        MOVE -1 TO EXPDT-L (SUB)                                          
LRM002        SET EXPDT-ERROR TO TRUE                                           
LRM002        IF NOT WK-ERROR                                                   
LRM002           SET WK-ERROR TO TRUE                                           
LRM002           MOVE 'EXPIRE DATE MM/DD/YY NOT VALID' TO  SYSTEM-MSG           
LRM002     END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *       VALIDATE SECURITY BY CALLING MSD MODULE                  *        
      *----------------------------------------------------------------*        
       1400-SECURITY-CHECK.                                                     
                                                                                
           MOVE TWA-MAP-SEC (SUB) TO ACATMSD-SEARCH-KEY                         
           SET ACATMSD-MSD-READ TO TRUE                                         
           PERFORM 7900-LINK-TO-ACATMSD                                         
           IF ACATMSD-FOUND                                                     
              IF ACATMSD-CUSIP (1:9) > SPACE                                    
                 MOVE ACATMSD-CUSIP    TO TWA-MAP-SEC (SUB) SEC-O (SUB)         
              ELSE                                                              
                 MOVE SPACES           TO WS-ADPSEC-EDITED                      
                 MOVE 'XX'             TO WS-XX-ADPSEC                          
                 MOVE ACATMSD-ADP-NBR  TO WS-ADPSEC                             
                 MOVE WS-ADPSEC-EDITED TO TWA-MAP-SEC (SUB) SEC-O (SUB)         
              END-IF                                                            
              MOVE ACATMSD-ADP-NBR  TO TWA-MAP-ADP-NBR (SUB)                    
              MOVE ACATMSD-DESC  TO TWA-MAP-DESC1 (SUB) DESC1-O (SUB)           
              MOVE ACATMSD-DESC2 TO TWA-MAP-DESC2 (SUB) DESC2-O (SUB)           
              MOVE WS-BR-NBR TO ACAT32-PASS-BR                                  
              MOVE WS-AC-NBR TO ACAT32-PASS-AC                                  
              MOVE TWA-MAP-SEC (SUB) TO ACAT32-PASS-SEC                         
              SET ACAT32-FND-SEC TO TRUE                                        
              PERFORM 7600-LINK-TO-ACAT32DB                                     
              IF ACAT32-ERROR                                                   
LRM003           MOVE                                                           
LRM003           'DB2 FIND ERROR ON SECURITY TABLE - CALL HELP DESK'            
                   TO  WK-DB2-ERROR                                             
                 PERFORM 0800-SEND-DB2-ERROR-MSG                                
              ELSE                                                              
              IF ACAT32-FOUND                                                   
                 MOVE ATT-UNPROT-BRT TO SEC-A (SUB)                             
                 MOVE -1 TO SEC-L (SUB)                                         
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'SECURITY ALREADY EXISTS' TO SYSTEM-MSG                
                 END-IF                                                         
              END-IF END-IF                                                     
           ELSE                                                                 
           IF ACATMSD-NOT-AVAIL                                                 
              MOVE SPACES         TO SEC-O (SUB) TWA-MAP-SEC (SUB)              
              MOVE ATT-UNPROT-BRT TO SEC-A (SUB)                                
              MOVE -1 TO SEC-L (SUB)                                            
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'MSD FILE NOT AVAILABE NOW - TRY IT LATER AGAIN'          
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           ELSE                                                                 
              MOVE ATT-UNPROT-BRT TO SEC-A (SUB)                                
              MOVE -1 TO SEC-L (SUB)                                            
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'INVALID SECURITY' TO SYSTEM-MSG                          
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
           IF TWA-MAP-NEXT = 'Y'                                                
              MOVE SPACE TO MNEXTO                                              
                            TWA-MAP-NEXT.                                       
      *                                                                         
           IF TWA-MAP-NEXT = SPACE                                              
              PERFORM 1610-NEXT-SEL-SPACE-RTN                                   
           ELSE                                                                 
              MOVE TWA-MAP-NEXT TO ACAT-INP-SEL                                 
              PERFORM 1620-NEXT-SEL-ENTERED-RTN.                                
                                                                                
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *           NEXT SELECTION WAS NOT ENTERED                       *        
      *----------------------------------------------------------------*        
       1610-NEXT-SEL-SPACE-RTN.                                                 
           MOVE  'Y'   TO  ACAT-INP-SEL.                                        
           IF TWA-MAP-SEARCH > SPACE                                            
              PERFORM 1640-VALIDATE-SRCH-ENGINE                                 
              IF NOT WK-ERROR                                                   
                 PERFORM 1650-CHECK-IF-SRCH-CHANGED                             
                 IF WS-SEARCH-CHANGED                                           
                    PERFORM 1615-SETUP-NEW-SEARCH-SCR                           
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              PERFORM 1650-CHECK-IF-SRCH-CHANGED                                
              IF WS-SEARCH-CHANGED                                              
                 PERFORM 1615-SETUP-NEW-SEARCH-SCR                              
              END-IF.                                                           
      *                                                                         
      *----------------------------------------------------------------*        
      *        SRCH FIELDS > SPACE AND NEXT FLD = SPACE                *        
      *----------------------------------------------------------------*        
       1615-SETUP-NEW-SEARCH-SCR.                                               
           INITIALIZE TWA-MAP-AREA.                                             
LRM002     MOVE SPACES TO TSQ-COMMENT-AREA.                                     
           INITIALIZE TWA-MAP-SAVE-AREA.                                        
           PERFORM 2000-ATTRIB-TO-ASKIP.                                        
           PERFORM 2010-CLEAR-SCR.                                              
           PERFORM 0300-REFRESH-WITH-NEW-ACCTS.                                 
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *           NEXT SELECTION WAS ENTERED                           *        
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
              MOVE 'ACAT32RX'    TO ACAT-CALLING-PROG-NAME                      
              MOVE  TWA-MAP-NEXT TO ACAT-NEXT                                   
              PERFORM 7500-XCTL-TO-DETAIL-PROG.                                 
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *           VALIDATE THE SEARCH ENGINE                           *        
      *----------------------------------------------------------------*        
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
      *                                                                         
      *----------------------------------------------------------------*        
      *             SEARCH ENGINE CHANGED?                             *        
      *----------------------------------------------------------------*        
       1650-CHECK-IF-SRCH-CHANGED.                                              
           MOVE SPACE TO WS-SEARCH-CHANGED-SW.                                  
           IF TWA-MAP-MMBR NOT = TWA-PREV-MMBR                                  
              MOVE TWA-MAP-MMBR TO TWA-PREV-MMBR                                
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF TWA-MAP-MMAC NOT = TWA-PREV-MMAC                                  
              MOVE TWA-MAP-MMAC TO TWA-PREV-MMAC                                
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF TWA-MAP-MMRR NOT = TWA-PREV-MMRR                                  
              MOVE TWA-MAP-MMRR TO TWA-PREV-MMRR                                
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF TWA-MAP-MMTFR NOT = TWA-PREV-MMTFR                                
              MOVE TWA-MAP-MMTFR TO TWA-PREV-MMTFR                              
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF TWA-MAP-MMRD NOT = TWA-PREV-MMRD                                  
              MOVE TWA-MAP-MMRD TO TWA-PREV-MMRD                                
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF TWA-MAP-MMBKR NOT = TWA-PREV-MMBKR                                
              MOVE TWA-MAP-MMBKR TO TWA-PREV-MMBKR                              
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF TWA-MAP-MMSTAT NOT = TWA-PREV-MMSTAT                              
              MOVE TWA-MAP-MMSTAT TO TWA-PREV-MMSTAT                            
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF TWA-MAP-MMSD NOT = TWA-PREV-MMSD                                  
              MOVE TWA-MAP-MMSD TO TWA-PREV-MMSD                                
              SET WS-SEARCH-CHANGED TO TRUE.                                    
       EJECT                                                                    
LRM002*----------------------------------------------------------------*        
LRM002*             POP-UP SCREEN ROUTINE                              *        
LRM002*----------------------------------------------------------------*        
LRM002 1800-SEND-POPUP-MAP-RTN.                                                 
LRM002     IF EIBCPOSN >= 320 AND < 480                                         
LRM002        MOVE 1 TO TWA-CMNT-SUB                                            
LRM002     ELSE                                                                 
LRM002     IF EIBCPOSN >= 480 AND < 640                                         
LRM002        MOVE 2 TO TWA-CMNT-SUB                                            
LRM002     ELSE                                                                 
LRM002     IF EIBCPOSN >= 640 AND < 800                                         
LRM002        MOVE 3 TO TWA-CMNT-SUB                                            
LRM002     ELSE                                                                 
LRM002     IF EIBCPOSN >= 800 AND < 960                                         
LRM002        MOVE 4 TO TWA-CMNT-SUB                                            
LRM002     ELSE                                                                 
LRM002     IF EIBCPOSN >= 960 AND < 1120                                        
LRM002        MOVE 5 TO TWA-CMNT-SUB                                            
LRM002     ELSE                                                                 
LRM002     IF EIBCPOSN >= 1120 AND < 1280                                       
LRM002        MOVE 6 TO TWA-CMNT-SUB                                            
LRM002     ELSE                                                                 
LRM002     IF EIBCPOSN >= 1280 AND < 1440                                       
LRM002        MOVE 7 TO TWA-CMNT-SUB                                            
LRM002     ELSE                                                                 
LRM002     IF EIBCPOSN >= 1440 AND < 1600                                       
LRM002        MOVE 8 TO TWA-CMNT-SUB                                            
LRM002     ELSE                                                                 
LRM002        SET WK-ERROR TO TRUE                                              
LRM002        MOVE 'INVALID CURSOR POSITION' TO SYSTEM-MSG                      
LRM002        PERFORM 9000-ERROR-RTN                                            
LRM002     END-IF.                                                              
                                                                                
LRM002     IF (TWA-MAP-BR (TWA-CMNT-SUB) = SPACE OR LOW-VALUE)                  
LRM002     AND (TWA-MAP-SEC (TWA-CMNT-SUB) = SPACE OR LOW-VALUE)                
LRM002        SET WK-ERROR TO TRUE                                              
LRM002        MOVE 'PF1 DISABLED' TO SYSTEM-MSG                                 
LRM002        PERFORM 9000-ERROR-RTN                                            
LRM002     END-IF.                                                              
LRM002                                                                          
LRM002     MOVE TWA-CMNT-SUB TO SUB2                                            
LRM002     IF TWA-MAP-BR-AC (TWA-CMNT-SUB) = SPACE                              
LRM002        MOVE TWA-CMNT-SUB TO SUB                                          
LRM002        PERFORM 4510-FIND-PARENT-ACCT-NBR                                 
LRM002           IF WS-PARENT-ACCT-FOUND                                        
LRM002              MOVE SUB3 TO SUB2                                           
LRM002     END-IF.                                                              
LRM002     MOVE SPACES TO ACAT90CM-TS-AREA                                      
LRM002     MOVE TSQ-MAP-COMMENT (TWA-CMNT-SUB)                                  
LRM002                         TO ACAT90CM-TS-MCCMNT-X120                       
LRM002     MOVE TWA-MAP-BR (SUB2) TO ACAT90CM-TS-MBR                            
LRM002     MOVE TWA-MAP-AC (SUB2) TO ACAT90CM-TS-MAC                            
LRM002     MOVE TWA-MAP-RR (SUB2) TO ACAT90CM-TS-MRR                            
LRM002     MOVE TWA-MAP-DESC1 (TWA-CMNT-SUB) TO ACAT90CM-TS-MNAME               
LRM002     MOVE TWA-MAP-NAME (TWA-CMNT-SUB) TO ACAT90CM-TS-MNAME2               
LRM002     MOVE 'A' TO ACAT90CM-TS-SCREEN                                       
LRM002     MOVE 'R' TO ACAT90CM-TS-MSUBM                                        
LRM002     PERFORM 7020-WRITE-TSQ-RTN.                                          
LRM002     PERFORM 1810-ACAT90CM-TS-RTN.                                        
LRM002     MOVE 'Y' TO ACAT-INP-SEL.                                            
LRM002     MOVE '$' TO WS-ACAT-NEXT.                                            
LRM002     MOVE 'ACAT90CM' TO CALLED-PROGRAM-NAME.                              
LRM002     PERFORM 7500-XCTL-TO-DETAIL-PROG.                                    
LRM002*----------------------------------------------------------------*        
LRM002*       PASS PARMS TO ACAT90CM POP-UP SCREEN PROGRAM             *        
LRM002*----------------------------------------------------------------*        
LRM002 1810-ACAT90CM-TS-RTN.                                                    
LRM002     MOVE 'ACA$'   TO TRAN-ID.                                            
LRM002     EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                                 
LRM002     END-EXEC.                                                            
LRM002                                                                          
LRM002     IF WS-UPDATE-OK                                                      
LRM002        MOVE 'Y'   TO ACAT90CM-TS-UPDATE-IND                              
LRM002     ELSE                                                                 
LRM002        MOVE SPACE TO ACAT90CM-TS-UPDATE-IND.                             
LRM002                                                                          
           MOVE 'ACA$' TO TRAN-ID.                                              
           MOVE +1     TO ITEM-NUM.                                             
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                                  
                               FROM(ACAT90CM-TS-AREA)                           
                               LENGTH(LENGTH OF ACAT90CM-TS-AREA)               
                               ITEM(ITEM-NUM)                                   
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              MOVE LOW-VALUE TO ACAT32MO                                        
              MOVE 'ACAT13 WRITE TSQ ERROR ON ACA$'                             
                TO SYSTEM-MSG                                                   
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *        SET ALL KEYABLE SCREEN ATTRIBUTES TO ASKIP              *        
      *----------------------------------------------------------------*        
       2000-ATTRIB-TO-ASKIP.                                                    
           PERFORM VARYING  SUB FROM 1 BY 1  UNTIL SUB > 8                      
               MOVE ATT-ASKIP TO ACT-A (SUB)                                    
                                 BR-A  (SUB)                                    
                                 AC-A  (SUB)                                    
                                 SEC-A (SUB)                                    
LRM002                         EXPDT-A (SUB)                                    
           END-PERFORM.                                                         
      *                                                                         
      *----------------------------------------------------------------*        
      *             CLEAR SCREEN WITH SPACES                           *        
      *----------------------------------------------------------------*        
       2010-CLEAR-SCR.                                                          
           PERFORM VARYING SUB FROM 1 BY 1   UNTIL SUB > 8                      
              MOVE SPACE  TO ACT-O   (SUB)                                      
                             BR-O    (SUB)                                      
                             AC-O    (SUB)                                      
                             RR-O    (SUB)                                      
                             SEC-O   (SUB)                                      
LRM002                       CMNT-O  (SUB)                                      
LRM002                       EXPDT-O (SUB)                                      
                             DESC1-O (SUB)                                      
                             NAME-O  (SUB)                                      
                             DESC2-O (SUB)                                      
           END-PERFORM.                                                         
           MOVE SPACE TO MNEXTO.                                                
      *                                                                         
       2020-CLEAR-SRCH-FIELDS.                                                  
           MOVE SPACE TO MMBRO                                                  
                         MMACO                                                  
                         MMRRO                                                  
                         MMTFRO                                                 
                         MMRDO                                                  
                         MMBKRO                                                 
                         MMSTATO                                                
                         MMSDO.                                                 
      *                                                                         
      *----------------------------------------------------------------*        
      *             SET ATTRIBUTES FOR ADD MODE                        *        
      *----------------------------------------------------------------*        
       2030-SET-ATTRI-ADD-MODE.                                                 
           PERFORM VARYING  SUB FROM 1 BY 1  UNTIL SUB > 8                      
               MOVE ATT-ASKIP  TO ACT-A (SUB)                                   
               MOVE ATT-UNPROT TO BR-A  (SUB)                                   
                                  AC-A  (SUB)                                   
                                  SEC-A (SUB)                                   
LRM002                          EXPDT-A (SUB)                                   
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *          ACAT SEARCH SECURITY                                  *        
      *----------------------------------------------------------------*        
       2500-BR-AE-SECURITY.                                                     
           INITIALIZE ACAT-SRCH-COMM-AREA.                                      
           SET SECURITY-LOOKUP      TO TRUE.                                    
           MOVE ACAT32-ACT-BRANCH   TO SRCH-INP-BRANCH.                         
           MOVE ACAT32-ACT-RR       TO SRCH-INP-RR.                             
           EXEC CICS LINK                                                       
                     PROGRAM('ACATSRCH')                                        
                     COMMAREA(ACAT-SRCH-COMM-AREA)                              
                     LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)                      
           END-EXEC.                                                            
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
               MOVE ACAT-NEXT TO ACAT-SCREEN-IND                                
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
                     MOVE 'USER NOT AUTHORIZED TO USE NEXT SELECTION '  AEISAC07
                          TO SYSTEM-MSG                                 AEISAC07
                     MOVE ACAT-NEXT                                     AEISAC07
                          TO SYSTEM-MSG(44 : 1)                         AEISAC07
                     MOVE -1              TO MNEXTL                             
                     MOVE ATT-UNPROT-BRT  TO MNEXTA                             
                     SET WK-MSG-ON        TO TRUE                               
                     MOVE 'ACAT32RX' TO ACAT-PROGRAM-NAME                       
                     MOVE 'Y'        TO ACAT-NEXT                               
                     MOVE  SPACE     TO ACAT-CALLING-PROG-NAME                  
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
      *                                                                         
      *----------------------------------------------------------------*        
      *         PF2: ADD NEW ACCOUNT ROUTINE                           *        
      *----------------------------------------------------------------*        
       3000-ADD-SECURITY-RTN.                                                   
DJ0001     IF NOT ACAT-SIGN-ON-UPDATE                                           
DJ0001        PERFORM 2000-ATTRIB-TO-ASKIP                                      
DJ0001        MOVE -1 TO MNEXTL                                                 
DJ0001        SET WK-ERROR TO TRUE                                              
DJ0001        MOVE 'UNAUTHORIZED TO ADD'                                        
DJ0001          TO  SYSTEM-MSG                                                  
DJ0001        PERFORM 9000-ERROR-RTN                                            
DJ0001     END-IF.                                                              
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           PERFORM 7040-DELETE-TSQ-SAVE.                                        
           INITIALIZE TWA-ACAT-AREA.                                            
LRM002     MOVE SPACES TO TSQ-COMMENT-AREA.                                     
           SET TWA-UPDATE-ADD TO TRUE.                                          
           PERFORM 2030-SET-ATTRI-ADD-MODE.                                     
           PERFORM 2010-CLEAR-SCR.                                              
           PERFORM 2020-CLEAR-SRCH-FIELDS.                                      
           MOVE -1 TO BR-L (1).                                                 
           SET WK-MSG-ON TO TRUE.                                               
           MOVE 'ENTER ACCOUNT(BRANCH+ACCT)' TO SYSTEM-MSG.                     
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *         PF3: GET OUT FROM ADD MODE                             *        
      *----------------------------------------------------------------*        
       3100-CANCEL-ADD-RTN.                                                     
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           IF NOT TWA-UPDATE-ADD                                                
              SET WK-ERROR TO TRUE                                              
              MOVE LOW-VALUE TO ACAT32MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'PF3 KEY CURRENTLY DISABLED'                                 
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
           INITIALIZE TWA-ACAT-AREA.                                            
LRM002     MOVE SPACES TO TSQ-COMMENT-AREA.                                     
           PERFORM 2000-ATTRIB-TO-ASKIP.                                        
           PERFORM 2010-CLEAR-SCR.                                              
           PERFORM 0300-REFRESH-WITH-NEW-ACCTS.                                 
           MOVE -1 TO MNEXTL.                                                   
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *         PF5: UPDATE ADDITITON / DELETION                       *        
      *----------------------------------------------------------------*        
       4000-UPDATE-RTN.                                                         
DJ0001     IF NOT ACAT-SIGN-ON-UPDATE                                           
DJ0001        PERFORM 2000-ATTRIB-TO-ASKIP                                      
DJ0001        MOVE -1 TO MNEXTL                                                 
DJ0001        SET WK-ERROR TO TRUE                                              
DJ0001        MOVE 'UNAUTHORIZED TO UPDATE(2)'                                  
DJ0001          TO  SYSTEM-MSG                                                  
DJ0001        PERFORM 9000-ERROR-RTN                                            
DJ0001     END-IF.                                                              
           IF TWA-UPDATE-IND = SPACE                                            
              MOVE -1 TO MNEXTL                                                 
              SET WK-ERROR TO TRUE                                              
              MOVE 'PF5 KEY IS DISABLED AT THIS TIME'                           
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN                                            
           ELSE                                                                 
           IF TWA-UPDATE-MOD                                                    
              IF WS-DELETE-SW-ON                                                
                 PERFORM 4500-DELETE-RTN   VARYING SUB FROM 1 BY 1              
                    UNTIL SUB > 8 OR SUB > TWA-SCR-LINE                         
                 PERFORM 5000-RESET-SCR-DISPLAY THRU 5000-EXIT                  
                 MOVE -1 TO MNEXTL                                              
                 SET WK-MSG-ON TO TRUE                                          
                 MOVE 'DELETION COMPLETED SUCCESSFULLY' TO SYSTEM-MSG           
              ELSE                                                              
                 MOVE -1 TO MNEXTL                                              
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'PF5 KEY ERROR - THERE IS NOTHING TO DELETE'              
                   TO  SYSTEM-MSG                                               
                 PERFORM 9000-ERROR-RTN                                         
              END-IF                                                            
           ELSE                                                                 
           IF TWA-UPDATE-ADD                                                    
              IF TWA-MAP-AREA = SPACE                                           
                 SET WK-ERROR TO TRUE                                           
                 MOVE -1 TO BR-L (1)                                            
                 MOVE 'UPDATE NOT ALLOWED - NO DATA ENTERED'                    
                   TO  SYSTEM-MSG                                               
              ELSE                                                              
                 PERFORM 4600-ADD-RTN                                           
                    VARYING  SUB FROM 1 BY 1  UNTIL SUB > 8                     
                 PERFORM 3000-ADD-SECURITY-RTN                                  
                 MOVE -1 TO BR-L (1)                                            
                 SET WK-MSG-ON TO TRUE                                          
                 MOVE 'UPDATE COMPLETED SUCCESSFULLY - ENTER ACCOUNT'           
                   TO  SYSTEM-MSG                                               
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *             DELETE ACCOUNT/SECURITY                           *         
      *---------------------------------------------------------------*         
       4500-DELETE-RTN.                                                         
           IF TWA-MAP-ACT (SUB) = 'D'                                           
              IF TWA-MAP-BR-AC (SUB) = SPACE                                    
                 PERFORM 4510-FIND-PARENT-ACCT-NBR                              
                 PERFORM 4520-DELETE-SECURITY                                   
              ELSE                                                              
                 MOVE TWA-MAP-BR (SUB) TO WS-BR-NBR                             
                 MOVE TWA-MAP-AC (SUB) TO WS-AC-NBR                             
                 IF TWA-MAP-SEC (SUB) = SPACE                                   
                    PERFORM 4530-DELETE-ACCOUNT                                 
                 ELSE                                                           
                    PERFORM 4520-DELETE-SECURITY                                
                 END-IF.                                                        
      *                                                                         
      *                                                                         
      *---------------------------------------------------------------*         
      *         FIND A PARENT ACCOUNT NUMBER                          *         
      *---------------------------------------------------------------*         
       4510-FIND-PARENT-ACCT-NBR.                                               
           MOVE SPACE TO WS-PARENT-ACCT-FOUND-SW.                               
           MOVE SUB TO SUB2.                                                    
           PERFORM UNTIL SUB2 < 1 OR WS-PARENT-ACCT-FOUND                       
              IF TWA-MAP-BR-AC (SUB2) > SPACE                                   
                 MOVE TWA-MAP-BR (SUB2) TO WS-BR-NBR                            
                 MOVE TWA-MAP-AC (SUB2) TO WS-AC-NBR                            
                 MOVE TWA-MAP-RR (SUB2) TO WS-RR-CODE                           
                 SET WS-PARENT-ACCT-FOUND TO TRUE                               
LRM002           MOVE SUB2 TO SUB3                                              
              END-IF                                                            
              SUBTRACT 1 FROM SUB2                                              
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           DELETE SECURITY IF EXISTS                           *         
      *---------------------------------------------------------------*         
       4520-DELETE-SECURITY.                                                    
           MOVE WS-BR-NBR TO ACAT32-PASS-BR.                                    
           MOVE WS-AC-NBR TO ACAT32-PASS-AC.                                    
           MOVE TWA-MAP-SEC (SUB) TO ACAT32-PASS-SEC.                           
           SET ACAT32-FND-SEC TO TRUE.                                          
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-ERROR                                                      
LRM003        MOVE 'DB2 FIND ERROR ON SECURITY TABLE - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG                                   
           ELSE                                                                 
           IF ACAT32-FOUND                                                      
              SET ACAT32-DEL-SEC  TO TRUE                                       
              PERFORM 7600-LINK-TO-ACAT32DB                                     
              IF ACAT32-ERROR                                                   
LRM003           MOVE                                                           
LRM003           'DB2 DELETE ERROR ON SECURITY TBL - CALL HELP DESK'            
                   TO  WK-DB2-ERROR                                             
                 PERFORM 0800-SEND-DB2-ERROR-MSG.                               
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          DELETE ACCOUNT IF EXISTS.                            *         
      *---------------------------------------------------------------*         
       4530-DELETE-ACCOUNT.                                                     
           MOVE WS-BR-NBR TO ACAT32-PASS-BR.                                    
           MOVE WS-AC-NBR TO ACAT32-PASS-AC.                                    
           SET ACAT32-FND-ACCT TO TRUE.                                         
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-ERROR                                                      
LRM003        MOVE 'DB2 FIND ERROR ON ACCOUNT TABLE - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG                                   
           ELSE                                                                 
           IF ACAT32-FOUND                                                      
              SET ACAT32-DEL-ACCT TO TRUE                                       
              PERFORM 7600-LINK-TO-ACAT32DB                                     
              IF ACAT32-ERROR                                                   
LRM003           MOVE 'DB2 DELETE ERROR ON ACCT TBL - CALL HELP DESK'           
                   TO  WK-DB2-ERROR                                             
                 PERFORM 0800-SEND-DB2-ERROR-MSG.                               
LRM002 EJECT                                                                    
LRM002*                                                                         
LRM002*---------------------------------------------------------------*         
LRM002*           UPDATE SECURITY IF EXISTS                           *         
LRM002*---------------------------------------------------------------*         
LRM002 4540-UPDATE-SECURITY.                                                    
LRM002     MOVE WS-BR-NBR     TO ACAT32-PASS-BR                                 
LRM002     MOVE WS-AC-NBR     TO ACAT32-PASS-AC                                 
LRM002     MOVE TWA-MAP-SEC (SUB) TO ACAT32-PASS-SEC.                           
LRM002     SET ACAT32-FND-SEC TO TRUE.                                          
LRM002     PERFORM 7600-LINK-TO-ACAT32DB.                                       
LRM002     IF ACAT32-ERROR                                                      
LRM003        MOVE 'DB2 FIND ERROR ON SECURITY TABLE - CALL HELP DESK'          
LRM002          TO  WK-DB2-ERROR                                                
LRM002        PERFORM 0800-SEND-DB2-ERROR-MSG                                   
LRM002     ELSE                                                                 
LRM002     IF ACAT32-FOUND                                                      
LRM002        SET ACAT32-UPD-SEC  TO TRUE                                       
LRM002        MOVE TSQ-MAP-COMMENT (SUB) TO ACAT32-SEC-COMMENT                  
LRM002        IF TWA-MAP-EXPDT (SUB) NOT GREATER SPACES                         
LRM002           MOVE '0001-01-01'           TO ACAT32-SEC-EXPDT                
LRM002        ELSE                                                              
LRM002           MOVE TWA-MAP-EXPDT-MM (SUB) TO ACAT32-SEC-EXPDT-MM             
LRM002           MOVE TWA-MAP-EXPDT-DD (SUB) TO ACAT32-SEC-EXPDT-DD             
LRM002           MOVE TWA-MAP-EXPDT-YY (SUB) TO ACAT32-SEC-EXPDT-YY             
LRM002           MOVE '20'                   TO ACAT32-SEC-EXPDT-CC             
LRM002           MOVE '-'                    TO ACAT32-SEC-EXPDT-S1             
LRM002                                          ACAT32-SEC-EXPDT-S2             
LRM002        END-IF                                                            
LRM002        PERFORM 7600-LINK-TO-ACAT32DB                                     
LRM002        IF ACAT32-ERROR                                                   
LRM003           MOVE                                                           
LRM003           'DB2 UPDATE ERROR ON SECURITY TBL - CALL HELP DESK'            
LRM002             TO  WK-DB2-ERROR                                             
LRM002           PERFORM 0800-SEND-DB2-ERROR-MSG.                               
LRM002 EJECT                                                                    
LRM002*                                                                         
LRM002*---------------------------------------------------------------*         
LRM002*          UPDATE ACCOUNT IF EXISTS.                            *         
LRM002*---------------------------------------------------------------*         
LRM002 4550-UPDATE-ACCOUNT.                                                     
LRM002     MOVE TWA-MAP-BR-AC (SUB)         TO ACAT32-PASS-BR                   
LRM002     MOVE TWA-MAP-BR-AC (SUB) (4 : 5) TO ACAT32-PASS-AC                   
LRM002     SET ACAT32-FND-ACCT TO TRUE.                                         
LRM002     PERFORM 7600-LINK-TO-ACAT32DB.                                       
LRM002     IF ACAT32-ERROR                                                      
LRM003        MOVE 'DB2 FIND ERROR ON ACCOUNT TABLE - CALL HELP DESK'           
LRM002          TO  WK-DB2-ERROR                                                
LRM002        PERFORM 0800-SEND-DB2-ERROR-MSG                                   
LRM002     ELSE                                                                 
LRM002     IF ACAT32-FOUND                                                      
LRM002        SET ACAT32-UPD-ACCT TO TRUE                                       
LRM002        MOVE TSQ-MAP-COMMENT (SUB) TO ACAT32-ACT-COMMENT                  
LRM002        IF TWA-MAP-EXPDT (SUB) NOT GREATER SPACES                         
LRM002           MOVE '0001-01-01'           TO ACAT32-ACT-EXPDT                
LRM002        ELSE                                                              
LRM002           MOVE TWA-MAP-EXPDT-MM (SUB) TO ACAT32-ACT-EXPDT-MM             
LRM002           MOVE TWA-MAP-EXPDT-DD (SUB) TO ACAT32-ACT-EXPDT-DD             
LRM002           MOVE TWA-MAP-EXPDT-YY (SUB) TO ACAT32-ACT-EXPDT-YY             
LRM002           MOVE '20'                   TO ACAT32-ACT-EXPDT-CC             
LRM002           MOVE '-'                    TO ACAT32-ACT-EXPDT-S1             
LRM002                                          ACAT32-ACT-EXPDT-S2             
LRM002        END-IF                                                            
LRM002        PERFORM 7600-LINK-TO-ACAT32DB                                     
LRM002        IF ACAT32-ERROR                                                   
LRM003           MOVE 'DB2 UPDATE ERROR ON ACCT TBL - CALL HELP DESK'           
LRM002             TO  WK-DB2-ERROR                                             
LRM002           PERFORM 0800-SEND-DB2-ERROR-MSG.                               
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *   CREATE NEW ACCOUNT/SECURITY                                 *         
      *      1. WS-ACCT-IN-TBL-IND = 'Y'                              *         
      *         MEANS ACCOUNT ALREADY EXISTS IN ACCOUNT TBL.          *         
      *         - IF SECURITY IS ENTERED, ADD ONLY SECURITY.          *         
      *      2. WS-ACCT-IN-TBL-IND = SPACE                            *         
      *         MEANS ACCOUNT NOT EXIST IN ACCT TBL.                  *         
      *         - ADD ACCOUNT.                                        *         
      *         - IF SECURITY IS ENTERED, ADD SECURITY.               *         
      *                                                               *         
      *   NOTE: IF NO SECURITIES ARE CREATED IN A SECURITY TABLE,     *         
      *         ALL THE SECURITIES THAT BELONG TO AN ACCOUNT ARE      *         
      *         ASSUMED TO BE EXCLUDED FROM A RESIDUAL CREDIT PROCESS.*         
      *---------------------------------------------------------------*         
       4600-ADD-RTN.                                                            
           IF TWA-MAP-BR-AC (SUB) = SPACE                                       
              IF TWA-MAP-SEC (SUB) > SPACE                                      
                 PERFORM 4510-FIND-PARENT-ACCT-NBR                              
                 PERFORM 4620-ADD-SECURITY                                      
              END-IF                                                            
           ELSE                                                                 
              MOVE TWA-MAP-BR (SUB) TO WS-BR-NBR                                
              MOVE TWA-MAP-AC (SUB) TO WS-AC-NBR                                
              MOVE TWA-MAP-RR (SUB) TO WS-RR-CODE                               
              IF WS-ACCT-IN-TBL-IND (SUB) = 'Y'                                 
                 IF TWA-MAP-SEC (SUB) > SPACE                                   
                    PERFORM 4620-ADD-SECURITY                                   
                 END-IF                                                         
              ELSE                                                              
                 PERFORM 4610-ADD-ACCOUNT                                       
                 IF TWA-MAP-SEC (SUB) > SPACE                                   
                    PERFORM 4620-ADD-SECURITY                                   
                 END-IF                                                         
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *            CREATE ACCOUNT ROW IN ACCOUNT TABLE                *         
      *---------------------------------------------------------------*         
       4610-ADD-ACCOUNT.                                                        
           MOVE WS-BR-NBR  TO ACAT32-PASS-BR.                                   
           MOVE WS-AC-NBR  TO ACAT32-PASS-AC.                                   
           MOVE WS-RR-CODE TO ACAT32-PASS-RR.                                   
           MOVE EIBTRMID   TO ACAT32-PASS-TERMID.                               
LRM002     IF TWA-MAP-EXPDT (SUB) NOT GREATER SPACES                            
LRM002        MOVE '0001-01-01'           TO ACAT32-PASS-EXPDT                  
LRM002     ELSE                                                                 
LRM002        MOVE TWA-MAP-EXPDT-MM (SUB) TO ACAT32-PASS-EXPDT-MM               
LRM002        MOVE TWA-MAP-EXPDT-DD (SUB) TO ACAT32-PASS-EXPDT-DD               
LRM002        MOVE TWA-MAP-EXPDT-YY (SUB) TO ACAT32-PASS-EXPDT-YY               
LRM002        MOVE '20'                   TO ACAT32-PASS-EXPDT-CC               
LRM002        MOVE '-'                    TO ACAT32-PASS-EXPDT-S1               
LRM002                                       ACAT32-PASS-EXPDT-S2               
LRM002     END-IF.                                                              
LRM002     MOVE SPACES                 TO ACAT32-PASS-COMMENT                   
           SET ACAT32-FND-ACCT TO TRUE.                                         
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-ERROR                                                      
LRM003        MOVE 'DB2 FIND ERROR ON ACCOUNT TABLE - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG                                   
           ELSE                                                                 
           IF ACAT32-NOT-FOUND                                                  
              SET ACAT32-INS-ACCT TO TRUE                                       
              PERFORM 7600-LINK-TO-ACAT32DB                                     
              IF ACAT32-ERROR                                                   
LRM003           MOVE                                                           
LRM003           'DB2 INSERT ERROR ON ACCOUNT TABLE - CALL HELP DESK'           
                   TO  WK-DB2-ERROR                                             
                 PERFORM 0800-SEND-DB2-ERROR-MSG                                
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *            CREATE SECURITY ROW IN SECURITY TABLE              *         
      *---------------------------------------------------------------*         
       4620-ADD-SECURITY.                                                       
           MOVE WS-BR-NBR  TO ACAT32-PASS-BR.                                   
           MOVE WS-AC-NBR  TO ACAT32-PASS-AC.                                   
           MOVE EIBTRMID   TO ACAT32-PASS-TERMID.                               
LRM002     IF TWA-MAP-EXPDT (SUB) NOT GREATER SPACES                            
LRM002        MOVE '0001-01-01'           TO ACAT32-PASS-EXPDT                  
LRM002     ELSE                                                                 
LRM002        MOVE TWA-MAP-EXPDT-MM (SUB) TO ACAT32-PASS-EXPDT-MM               
LRM002        MOVE TWA-MAP-EXPDT-DD (SUB) TO ACAT32-PASS-EXPDT-DD               
LRM002        MOVE TWA-MAP-EXPDT-YY (SUB) TO ACAT32-PASS-EXPDT-YY               
LRM002        MOVE '20'                   TO ACAT32-PASS-EXPDT-CC               
LRM002        MOVE '-'                    TO ACAT32-PASS-EXPDT-S1               
LRM002                                       ACAT32-PASS-EXPDT-S2               
LRM002     END-IF.                                                              
LRM002     MOVE SPACES                TO ACAT32-PASS-COMMENT                    
           MOVE TWA-MAP-SEC (SUB)     TO ACAT32-PASS-SEC.                       
           MOVE TWA-MAP-ADP-NBR (SUB) TO ACAT32-PASS-ADP-NBR.                   
           SET ACAT32-FND-SEC  TO TRUE.                                         
           PERFORM 7600-LINK-TO-ACAT32DB.                                       
           IF ACAT32-ERROR                                                      
LRM003        MOVE 'DB2 FIND ERROR ON SECURITY TABLE - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG                                   
           ELSE                                                                 
           IF ACAT32-NOT-FOUND                                                  
              SET ACAT32-INS-SEC TO TRUE                                        
              PERFORM 7600-LINK-TO-ACAT32DB                                     
              IF ACAT32-ERROR                                                   
LRM003           MOVE                                                           
LRM003           'DB2 INSERT ERROR ON SECURITY TABLE - CALL HELP DESK'          
                   TO  WK-DB2-ERROR                                             
                 PERFORM 0800-SEND-DB2-ERROR-MSG                                
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *         AFTER DELETION, RESET THE SCREEN DISPLAY              *         
      *---------------------------------------------------------------*         
       5000-RESET-SCR-DISPLAY.                                                  
           IF TWA-PAGE-NUM = +1                                                 
              MOVE 0 TO TWA-PAGE-NUM                                            
              INITIALIZE TWA-MAP-AREA                                           
LRM002        MOVE SPACES TO TSQ-COMMENT-AREA                                   
              INITIALIZE TWA-MAP-SAVE-AREA                                      
              PERFORM 2000-ATTRIB-TO-ASKIP                                      
              PERFORM 2010-CLEAR-SCR                                            
              PERFORM 0300-REFRESH-WITH-NEW-ACCTS                               
              GO TO 5000-EXIT.                                                  
                                                                                
           PERFORM 0500-OPEN-ACCT-CURSOR-TBL.                                   
           MOVE SPACE TO WS-ACCT-FOUND-SW                                       
                         WS-NO-MORE-ACCT-SW.                                    
           PERFORM 5010-GET-ACCT-ROW VARYING SUB FROM 1 BY 1                    
              UNTIL WS-NO-MORE-ACCT                                             
                 OR WS-ACCT-EQUAL-FOUND                                         
                 OR WS-ACCT-GREATER-FOUND.                                      
           IF WS-NO-MORE-ACCT                                                   
              PERFORM 0520-CLOSE-ACCT-CURSOR-TBL                                
              PERFORM 6000-PREV-PAGE-RTN                                        
           ELSE                                                                 
           IF WS-ACCT-GREATER-FOUND                                             
              PERFORM 5020-RESET-FROM-NEXT-ACCT                                 
           ELSE                                                                 
           IF WS-ACCT-EQUAL-FOUND                                               
              PERFORM 5040-FIND-NEXT-SEC                                        
              IF WS-SEC-KEY-FOUND                                               
                 PERFORM 5030-RESET-FROM-NEXT-SEC                               
              ELSE                                                              
                 PERFORM 0620-CLOSE-SEC-CURSOR-TBL                              
                 PERFORM 0510-FETCH-ACCT-CURSOR-TBL                             
                 IF ACAT32-NORMAL                                               
                    PERFORM 5020-RESET-FROM-NEXT-ACCT                           
                 ELSE                                                           
                    MOVE -1 TO MNEXTL                                           
                    SET WK-MSG-ON TO TRUE                                       
                    MOVE 'BOTTOM PAGE' TO SYSTEM-MSG                            
                    PERFORM 0520-CLOSE-ACCT-CURSOR-TBL                          
                 END-IF                                                         
              END-IF.                                                           
                                                                                
           IF (NOT WK-MSG-ON) OR (NOT WK-ERROR)                                 
              MOVE -1 TO MNEXTL.                                                
       5000-EXIT.                                            EXIT.              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          READ ACCOUNT CURSOR TABLE UNTIL KEY FOUND            *         
      *---------------------------------------------------------------*         
       5010-GET-ACCT-ROW.                                                       
           PERFORM 0510-FETCH-ACCT-CURSOR-TBL.                                  
           IF ACAT32-NORMAL                                                     
              MOVE ACAT32-ACT-BRANCH TO WS-BR-KEY                               
              MOVE ACAT32-ACT-ACCT   TO WS-AC-KEY                               
              IF WS-BR-AC-KEY = TWA-BR-AC-KEY-FIRST                             
                 SET WS-ACCT-EQUAL-FOUND TO TRUE                                
              ELSE                                                              
              IF WS-BR-AC-KEY > TWA-BR-AC-KEY-FIRST                             
                 SET WS-ACCT-GREATER-FOUND TO TRUE                              
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *         DISPLAY ACCOUNTS                                      *         
      *---------------------------------------------------------------*         
       5020-RESET-FROM-NEXT-ACCT.                                               
           INITIALIZE TWA-MAP-AREA.                                             
LRM002     MOVE SPACES TO TSQ-COMMENT-AREA.                                     
           INITIALIZE TWA-MAP-SAVE-AREA.                                        
           PERFORM 2000-ATTRIB-TO-ASKIP.                                        
           PERFORM 2010-CLEAR-SCR.                                              
           MOVE 0 TO SUB WS-SEC-LINE.                                           
           PERFORM UNTIL SUB >= 8 OR WS-NO-MORE-ACCT                            
              PERFORM 0410-SETUP-ACCT                                           
              PERFORM 0510-FETCH-ACCT-CURSOR-TBL                                
           END-PERFORM.                                                         
           PERFORM 0520-CLOSE-ACCT-CURSOR-TBL.                                  
           PERFORM 0430-SAVE-KEYS-IN-TS.                                        
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *         DISPLAY REMAINING SECURITIES OF THE ACCOUNT FIRST     *         
      *---------------------------------------------------------------*         
       5030-RESET-FROM-NEXT-SEC.                                                
           INITIALIZE TWA-MAP-AREA.                                             
LRM002     MOVE SPACES TO TSQ-COMMENT-AREA.                                     
           INITIALIZE TWA-MAP-SAVE-AREA.                                        
           PERFORM 2000-ATTRIB-TO-ASKIP.                                        
           PERFORM 2010-CLEAR-SCR.                                              
           MOVE 0   TO TWA-SCR-LINE  SUB  WS-SEC-LINE.                          
           PERFORM UNTIL SUB >= 8 OR WS-NO-MORE-ACCT                            
              PERFORM 6120-RESET-ACCT-DISPLAY                                   
              PERFORM 0510-FETCH-ACCT-CURSOR-TBL                                
           END-PERFORM.                                                         
           PERFORM 0520-CLOSE-ACCT-CURSOR-TBL.                                  
           PERFORM 0430-SAVE-KEYS-IN-TS.                                        
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *     GET NEXT SECURITY THAT BELONGS TO THE ACCOUNT             *         
      *---------------------------------------------------------------*         
       5040-FIND-NEXT-SEC.                                                      
           MOVE TWA-BR-KEY-FIRST TO ACAT32-PASS-BR.                             
           MOVE TWA-AC-KEY-FIRST TO ACAT32-PASS-AC.                             
           PERFORM 0600-OPEN-SEC-CURSOR-TBL.                                    
           MOVE SPACE TO WS-SEC-KEY-FOUND-SW                                    
                         WS-NO-MORE-SEC-SW.                                     
           PERFORM UNTIL WS-SEC-KEY-FOUND OR WS-NO-MORE-SEC                     
             PERFORM 0610-FETCH-SEC-CURSOR-TBL                                  
             IF ACAT32-NORMAL                                                   
                IF ACAT32-SEC-SECURITY >= TWA-SEC-KEY-FIRST                     
                   SET WS-SEC-KEY-FOUND TO TRUE                                 
                END-IF                                                          
             END-IF                                                             
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          PF7:  PREVIOUSE PAGE                                 *         
      *---------------------------------------------------------------*         
       6000-PREV-PAGE-RTN.                                                      
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           MOVE 9 TO WS-MAP-LINE.                                               
           IF NOT TWA-UPDATE-MOD                                                
                SET WK-ERROR TO TRUE                                            
                MOVE LOW-VALUE TO ACAT32MO                                      
                MOVE -1 TO MNEXTL                                               
                MOVE 'PF7 KEY DISABLED AT THIS TIME'                            
                  TO SYSTEM-MSG                                                 
                PERFORM 9000-ERROR-RTN                                          
           END-IF.                                                              
                                                                                
           PERFORM 0550-OPEN-ACCT-CUR-DESCEND.                                  
           MOVE SPACE TO WS-ACCT-FOUND-SW                                       
                         WS-NO-MORE-ACCT-SW.                                    
                                                                                
           PERFORM 6050-GET-PREV-ACCT                                           
             UNTIL WS-ACCT-EQUAL-FOUND                                          
                OR WS-ACCT-SMALLER-FOUND                                        
                OR WS-NO-MORE-ACCT.                                             
                                                                                
           IF WS-NO-MORE-ACCT                                                   
              MOVE -1 TO MNEXTL                                                 
              SET WK-MSG-ON TO TRUE                                             
              MOVE 'TOP PAGE' TO SYSTEM-MSG                                     
           ELSE                                                                 
           IF WS-ACCT-SMALLER-FOUND                                             
              PERFORM 6002-GET-NEXT-ACCT-SEC                                    
           ELSE                                                                 
           IF WS-ACCT-EQUAL-FOUND                                               
              MOVE ACAT32-ACT-BRANCH TO WS-BR-KEY                               
              MOVE ACAT32-ACT-ACCT   TO WS-AC-KEY                               
              IF TWA-PAGE-NUM > 1                                               
                 SUBTRACT +1 FROM TWA-PAGE-NUM GIVING TS-ITEM                   
                 PERFORM 7030-READ-TSQ-SAVE                                     
                 IF WS-BR-AC-KEY = TS-SAVE-BR-AC                                
                    PERFORM 6004-GET-CURRENT-ACCT-SEC                           
                 ELSE                                                           
                    PERFORM 0560-FETCH-ACCT-CUR-DESCEND                         
                    IF ACAT32-NORMAL                                            
                       PERFORM 6002-GET-NEXT-ACCT-SEC                           
                    ELSE                                                        
                       MOVE -1 TO MNEXTL                                        
                       SET WK-MSG-ON TO TRUE                                    
                       MOVE 'TOP PAGE' TO SYSTEM-MSG                            
                    END-IF                                                      
                 END-IF                                                         
              ELSE                                                              
                 MOVE -1 TO MNEXTL                                              
                 SET WK-MSG-ON TO TRUE                                          
                 MOVE 'TOP PAGE' TO SYSTEM-MSG                                  
              END-IF.                                                           
                                                                                
           PERFORM 0570-CLOSE-ACCT-CUR-DESCEND.                                 
           PERFORM 6070-GET-ACCT-SEC-KEYS.                                      
                                                                                
           IF (NOT WK-MSG-ON) OR (NOT WK-ERROR)                                 
              MOVE -1 TO MNEXTL.                                                
                                                                                
      **<< IF EVERY SCREEN LINE IS NOT FILLED, THEN DELETION OR  >>             
      **<< ADDITION WAS MADE BY OTHER USER.  THUS REDISPLAY THE  >>             
      **<< ACCOUNT FROM THE BEGINING OF THE ACCOUNT TABLE.       >>             
      *                                                                         
           IF WS-MAP-LINE > 1 AND < 9                                           
              MOVE 0 TO TWA-PAGE-NUM                                            
              PERFORM 0300-REFRESH-WITH-NEW-ACCTS.                              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *   DISPLAY STARTING FROM THE NEXT ACCOUNT SECURITIS            *         
      *   NOTE: ACCT AND SECURITY TABLES ARE READ IN DESCENDING ORDER *         
      *---------------------------------------------------------------*         
       6002-GET-NEXT-ACCT-SEC.                                                  
           MOVE ACAT32-ACT-BRANCH TO ACAT32-PASS-BR WS-BR-KEY.                  
           MOVE ACAT32-ACT-ACCT   TO ACAT32-PASS-AC WS-AC-KEY.                  
           PERFORM 0650-OPEN-SEC-CUR-DESCEND.                                   
           PERFORM 6006-INITIALIZE-RTN.                                         
           PERFORM 6010-SETUP-MAP-BOTTOM-UP                                     
              UNTIL WS-NO-MORE-ACCT OR WS-MAP-LINE <= 1.                        
           IF WS-MAP-LINE = 1                                                   
              SUBTRACT +1 FROM TWA-PAGE-NUM                                     
              PERFORM 0430-SAVE-KEYS-IN-TS.                                     
      *                                                                         
      *---------------------------------------------------------------*         
      *   DISPLAY STARTING FROM NEXT SECURITIES OF THE CURRENT ACCT   *         
      *   NOTE: ACCT AND SECURITY TABLES ARE READ IN DESCENDING ORDER *         
      *---------------------------------------------------------------*         
       6004-GET-CURRENT-ACCT-SEC.                                               
           MOVE ACAT32-ACT-BRANCH TO ACAT32-PASS-BR WS-BR-KEY.                  
           MOVE ACAT32-ACT-ACCT   TO ACAT32-PASS-AC WS-AC-KEY.                  
           PERFORM 0650-OPEN-SEC-CUR-DESCEND.                                   
           MOVE SPACE TO WS-NO-MORE-SEC-SW.                                     
           PERFORM 6060-FIND-SEC-KEY                                            
               UNTIL WS-SEC-KEY-FOUND OR WS-NO-MORE-SEC.                        
           IF WS-SEC-KEY-FOUND                                                  
              PERFORM 6006-INITIALIZE-RTN                                       
              PERFORM 6010-SETUP-MAP-BOTTOM-UP                                  
                 UNTIL WS-NO-MORE-ACCT OR WS-MAP-LINE <= 1                      
              IF WS-MAP-LINE = 1                                                
                 SUBTRACT +1 FROM TWA-PAGE-NUM                                  
                 PERFORM 0430-SAVE-KEYS-IN-TS                                   
              END-IF                                                            
           ELSE                                                                 
              PERFORM 0670-CLOSE-SEC-CUR-DESCEND                                
              PERFORM 0560-FETCH-ACCT-CUR-DESCEND                               
              IF ACAT32-NORMAL                                                  
                 PERFORM 6002-GET-NEXT-ACCT-SEC                                 
              ELSE                                                              
                 PERFORM 0570-CLOSE-ACCT-CUR-DESCEND                            
                 MOVE 0 TO TWA-PAGE-NUM                                         
                 PERFORM 0300-REFRESH-WITH-NEW-ACCTS                            
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *        INITIALIZE ROUTINE                                     *         
      *---------------------------------------------------------------*         
       6006-INITIALIZE-RTN.                                                     
           INITIALIZE TWA-MAP-AREA.                                             
LRM002     MOVE SPACES TO TSQ-COMMENT-AREA.                                     
           INITIALIZE TWA-MAP-SAVE-AREA.                                        
           MOVE 8 TO TWA-SCR-LINE.                                              
           SET TWA-UPDATE-MOD TO TRUE.                                          
           PERFORM 2000-ATTRIB-TO-ASKIP.                                        
           PERFORM 2010-CLEAR-SCR.                                              
      *                                                                         
      *---------------------------------------------------------------*         
      *        MOVE DATA STARTING FROM THE BOTTOM OF THE MAP          *         
      *---------------------------------------------------------------*         
       6010-SETUP-MAP-BOTTOM-UP.                                                
           MOVE SPACE TO WS-NO-MORE-SEC-SW.                                     
           MOVE 0 TO SUB.                                                       
           PERFORM UNTIL WS-NO-MORE-SEC OR WS-MAP-LINE <= 1                     
              PERFORM 0660-FETCH-SEC-CUR-DESCEND                                
              ADD +1 TO SUB                                                     
              IF ACAT32-NORMAL                                                  
                 SUBTRACT 1 FROM WS-MAP-LINE                                    
DJ0001           IF  ACAT-SIGN-ON-UPDATE                                        
                     MOVE ATT-UNPROT TO ACT-A (WS-MAP-LINE)                     
LRM002                                EXPDT-A (WS-MAP-LINE)                     
DJ0001           END-IF                                                         
                 PERFORM 6020-SETUP-SEC-BOTTOM-UP                               
                 IF WS-MAP-LINE = 1                                             
                    PERFORM 6030-SETUP-ACCT-BOTTOM-UP                           
                 END-IF                                                         
              ELSE                                                              
                 IF SUB = 1                                                     
                    SUBTRACT 1 FROM WS-MAP-LINE                                 
                 END-IF                                                         
DJ0001           IF  ACAT-SIGN-ON-UPDATE                                        
                     MOVE ATT-UNPROT TO ACT-A (WS-MAP-LINE)                     
LRM002                                EXPDT-A (WS-MAP-LINE)                     
DJ0001           END-IF                                                         
                 PERFORM 6030-SETUP-ACCT-BOTTOM-UP                              
              END-IF                                                            
           END-PERFORM.                                                         
           PERFORM 0670-CLOSE-SEC-CUR-DESCEND.                                  
           PERFORM 0560-FETCH-ACCT-CUR-DESCEND.                                 
           IF ACAT32-NORMAL                                                     
              MOVE ACAT32-ACT-BRANCH TO ACAT32-PASS-BR WS-BR-KEY                
              MOVE ACAT32-ACT-ACCT   TO ACAT32-PASS-AC WS-AC-KEY                
              PERFORM 0650-OPEN-SEC-CUR-DESCEND.                                
      *                                                                         
      *---------------------------------------------------------------*         
      *    MOVE SEC DATA STARTING FROM THE BOTTOM OF THE MAP          *         
      *---------------------------------------------------------------*         
       6020-SETUP-SEC-BOTTOM-UP.                                                
           MOVE ACAT32-SEC-SECURITY TO ACATMSD-SEARCH-KEY.                      
           SET ACATMSD-MSD-READ TO TRUE.                                        
           PERFORM 7900-LINK-TO-ACATMSD.                                        
           IF ACATMSD-FOUND                                                     
              MOVE ACATMSD-ADP-NBR TO TWA-MAP-ADP-NBR (WS-MAP-LINE)             
              MOVE ACATMSD-CUSIP                                                
                TO SEC-O   (WS-MAP-LINE) TWA-MAP-SEC (WS-MAP-LINE)              
              MOVE ACATMSD-DESC                                                 
                TO DESC1-O (WS-MAP-LINE) TWA-MAP-DESC1 (WS-MAP-LINE)            
              MOVE ACATMSD-DESC2                                                
                TO DESC2-O (WS-MAP-LINE) TWA-MAP-DESC2 (WS-MAP-LINE).           
                                                                                
LRM002     IF ACAT32-SEC-COMMENT NOT = SPACES                                   
LRM002        MOVE ACAT32-SEC-COMMENT  TO TSQ-MAP-COMMENT (WS-MAP-LINE)         
LRM002        MOVE 'Y'   TO CMNT-O (WS-MAP-LINE)                                
LRM002                      TWA-MAP-CMNT (WS-MAP-LINE)                          
LRM002     ELSE                                                                 
LRM002        MOVE SPACES              TO TSQ-MAP-COMMENT (WS-MAP-LINE)         
LRM002                      CMNT-O (WS-MAP-LINE)                                
LRM002                      TWA-MAP-CMNT (WS-MAP-LINE)                          
LRM002     END-IF                                                               
                                                                                
LRM002     IF ACAT32-SEC-EXPDT = '0001-01-01'                                   
LRM002        MOVE SPACES           TO TWA-MAP-EXPDT (WS-MAP-LINE)              
LRM002                                 TWA-ORIG-EXPDT (WS-MAP-LINE)             
LRM002     ELSE                                                                 
LRM002        MOVE ACAT32-SEC-EXPDT-MM TO TWA-MAP-EXPDT-MM (WS-MAP-LINE)        
LRM002        MOVE ACAT32-SEC-EXPDT-DD TO TWA-MAP-EXPDT-DD (WS-MAP-LINE)        
LRM002        MOVE ACAT32-SEC-EXPDT-YY TO TWA-MAP-EXPDT-YY (WS-MAP-LINE)        
LRM002        MOVE '/' TO TWA-MAP-EXPDT-S1 (WS-MAP-LINE)                        
LRM002                    TWA-MAP-EXPDT-S2 (WS-MAP-LINE)                        
LRM002        MOVE TWA-MAP-EXPDT (WS-MAP-LINE) TO EXPDT-O (WS-MAP-LINE)         
LRM002                                 TWA-ORIG-EXPDT (WS-MAP-LINE)             
LRM002     END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *    MOVE ACCT DATA STARTING FROM THE BOTTOM OF THE MAP         *         
      *---------------------------------------------------------------*         
       6030-SETUP-ACCT-BOTTOM-UP.                                               
           MOVE ACAT32-ACT-BRANCH                                               
             TO BR-O (WS-MAP-LINE) TWA-MAP-BR (WS-MAP-LINE).                    
           MOVE ACAT32-ACT-ACCT                                                 
             TO AC-O (WS-MAP-LINE) TWA-MAP-AC (WS-MAP-LINE).                    
           MOVE ACAT32-ACT-RR                                                   
             TO RR-O (WS-MAP-LINE) TWA-MAP-RR (WS-MAP-LINE).                    
                                                                                
           MOVE WK-CLT(2:3) TO ACATNAIO-CLIENT.                                 
           MOVE TWA-MAP-BR (WS-MAP-LINE) TO ACATNAIO-BR.                        
           MOVE TWA-MAP-AC (WS-MAP-LINE) TO ACATNAIO-AC.                        
           SET ACATNAIO-NA-READ TO TRUE.                                        
           PERFORM 7800-LINK-TO-ACATNAIO.                                       
           IF ACATNAIO-FOUND                                                    
              MOVE ACATNAIO-NAME                                                
                TO NAME-O (WS-MAP-LINE) TWA-MAP-NAME (WS-MAP-LINE).             
                                                                                
LRM002     IF ACAT32-ACT-COMMENT NOT = SPACES                                   
LRM002        MOVE ACAT32-ACT-COMMENT  TO TSQ-MAP-COMMENT (WS-MAP-LINE)         
LRM002        MOVE 'Y'   TO CMNT-O (WS-MAP-LINE)                                
LRM002                      TWA-MAP-CMNT (WS-MAP-LINE)                          
LRM002     ELSE                                                                 
LRM002        MOVE SPACES              TO TSQ-MAP-COMMENT (WS-MAP-LINE)         
LRM002                      CMNT-O (WS-MAP-LINE)                                
LRM002                      TWA-MAP-CMNT (WS-MAP-LINE)                          
LRM002     END-IF                                                               
                                                                                
LRM002     IF ACAT32-ACT-EXPDT = '0001-01-01'                                   
LRM002        MOVE SPACES           TO TWA-MAP-EXPDT (WS-MAP-LINE)              
LRM002                                 TWA-ORIG-EXPDT (WS-MAP-LINE)             
LRM002     ELSE                                                                 
LRM002        MOVE ACAT32-ACT-EXPDT-MM TO TWA-MAP-EXPDT-MM (WS-MAP-LINE)        
LRM002        MOVE ACAT32-ACT-EXPDT-DD TO TWA-MAP-EXPDT-DD (WS-MAP-LINE)        
LRM002        MOVE ACAT32-ACT-EXPDT-YY TO TWA-MAP-EXPDT-YY (WS-MAP-LINE)        
LRM002        MOVE '/' TO TWA-MAP-EXPDT-S1 (WS-MAP-LINE)                        
LRM002                    TWA-MAP-EXPDT-S2 (WS-MAP-LINE)                        
LRM002        MOVE TWA-MAP-EXPDT (WS-MAP-LINE) TO EXPDT-O (WS-MAP-LINE)         
LRM002                                 TWA-ORIG-EXPDT (WS-MAP-LINE)             
LRM002     END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *       FIND PREV ACCOUNT                                       *         
      *---------------------------------------------------------------*         
       6050-GET-PREV-ACCT.                                                      
           PERFORM 0560-FETCH-ACCT-CUR-DESCEND.                                 
           IF ACAT32-NORMAL                                                     
              MOVE ACAT32-ACT-BRANCH TO WS-BR-KEY                               
              MOVE ACAT32-ACT-ACCT   TO WS-AC-KEY                               
              IF WS-BR-AC-KEY = TWA-BR-AC-KEY-FIRST                             
                 SET WS-ACCT-EQUAL-FOUND TO TRUE                                
              ELSE                                                              
              IF WS-BR-AC-KEY < TWA-BR-AC-KEY-FIRST                             
                 SET WS-ACCT-SMALLER-FOUND TO TRUE                              
              END-IF.                                                           
      *                                                                         
      *---------------------------------------------------------------*         
      *       FIND SECURITY DIPLAYED AT THE FIRST LINE OF THE SCREEN  *         
      *---------------------------------------------------------------*         
       6060-FIND-SEC-KEY.                                                       
           MOVE SPACE TO WS-SEC-KEY-FOUND-SW.                                   
           PERFORM 0660-FETCH-SEC-CUR-DESCEND                                   
           IF ACAT32-NORMAL                                                     
              IF ACAT32-SEC-SECURITY = TWA-SEC-KEY-FIRST                        
                 SET WS-SEC-KEY-FOUND TO TRUE.                                  
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *      SAVE FIRST AND LAST SEARCH KEYS FOR ACCT AND SECURITY    *         
      *---------------------------------------------------------------*         
       6070-GET-ACCT-SEC-KEYS.                                                  
           MOVE SPACE TO TWA-SCR-KEYS.                                          
           MOVE TWA-MAP-BR (1) TO TWA-BR-KEY-FIRST.                             
           MOVE TWA-MAP-AC (1) TO TWA-AC-KEY-FIRST.                             
           MOVE TWA-MAP-BR (1) TO TWA-BR-KEY-LAST.                              
           MOVE TWA-MAP-AC (1) TO TWA-AC-KEY-LAST.                              
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 8                        
              IF TWA-MAP-BR (SUB) > SPACE                                       
                 MOVE TWA-MAP-BR (SUB) TO TWA-BR-KEY-LAST                       
              END-IF                                                            
              IF TWA-MAP-AC (SUB) > SPACE                                       
                 MOVE TWA-MAP-AC (SUB) TO TWA-AC-KEY-LAST                       
              END-IF                                                            
              IF TWA-MAP-SEC (SUB) > SPACE                                      
                 IF TWA-SEC-KEY-FIRST = SPACE                                   
                    MOVE TWA-MAP-SEC (SUB) TO TWA-SEC-KEY-FIRST                 
                 END-IF                                                         
                 MOVE TWA-MAP-SEC (SUB) TO TWA-SEC-KEY-LAST                     
              END-IF                                                            
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           PF8:    NEXT PAGE                                   *         
      *---------------------------------------------------------------*         
       6100-NEXT-PAGE-RTN.                                                      
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
                                                                                
           IF NOT TWA-UPDATE-MOD                                                
              SET WK-ERROR TO TRUE                                              
              MOVE LOW-VALUE TO ACAT32MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'PF8 KEY DISABLED AT THIS TIME' TO SYSTEM-MSG                
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           PERFORM 0500-OPEN-ACCT-CURSOR-TBL.                                   
           MOVE SPACE TO WS-ACCT-FOUND-SW                                       
                         WS-NO-MORE-ACCT-SW.                                    
           PERFORM 6150-GET-NEXT-ACCT                                           
             UNTIL WS-ACCT-EQUAL-FOUND                                          
                OR WS-ACCT-GREATER-FOUND                                        
                OR WS-NO-MORE-ACCT.                                             
           IF WS-NO-MORE-ACCT                                                   
              MOVE -1 TO MNEXTL                                                 
              SET WK-MSG-ON TO TRUE                                             
              MOVE 'BOTTOM PAGE' TO SYSTEM-MSG                                  
              PERFORM 0520-CLOSE-ACCT-CURSOR-TBL                                
           ELSE                                                                 
           IF WS-ACCT-GREATER-FOUND                                             
              PERFORM 6170-RESET-MAP-FOR-PF8                                    
           ELSE                                                                 
           IF WS-ACCT-EQUAL-FOUND                                               
              PERFORM 6160-FIND-NEXT-SEC                                        
              IF WS-SEC-KEY-FOUND                                               
                 PERFORM 6110-RESET-MAP-FROM-NEXT-SEC                           
              ELSE                                                              
                 PERFORM 0620-CLOSE-SEC-CURSOR-TBL                              
                 PERFORM 0510-FETCH-ACCT-CURSOR-TBL                             
                 IF ACAT32-NORMAL                                               
                    PERFORM 6170-RESET-MAP-FOR-PF8                              
                 ELSE                                                           
                    MOVE -1 TO MNEXTL                                           
                    SET WK-MSG-ON TO TRUE                                       
                    MOVE 'BOTTOM PAGE' TO SYSTEM-MSG                            
                    PERFORM 0520-CLOSE-ACCT-CURSOR-TBL                          
                 END-IF                                                         
              END-IF.                                                           
                                                                                
           IF (NOT WK-MSG-ON) OR (NOT WK-ERROR)                                 
              MOVE -1 TO MNEXTL.                                                
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *       DISPLAY REMAINING SECURITIES OF THE ACCOUNT FIRST       *         
      *---------------------------------------------------------------*         
       6110-RESET-MAP-FROM-NEXT-SEC.                                            
           INITIALIZE TWA-MAP-AREA.                                             
LRM002     MOVE SPACES TO TSQ-COMMENT-AREA.                                     
           INITIALIZE TWA-MAP-SAVE-AREA.                                        
           PERFORM 2000-ATTRIB-TO-ASKIP.                                        
           PERFORM 2010-CLEAR-SCR.                                              
           MOVE 0   TO TWA-SCR-LINE  SUB  WS-SEC-LINE.                          
           PERFORM UNTIL SUB >= 8 OR WS-NO-MORE-ACCT                            
              PERFORM 6120-RESET-ACCT-DISPLAY                                   
              PERFORM 0510-FETCH-ACCT-CURSOR-TBL                                
           END-PERFORM.                                                         
           PERFORM 0520-CLOSE-ACCT-CURSOR-TBL.                                  
           IF TWA-SCR-LINE > 0                                                  
              ADD +1 TO TWA-PAGE-NUM                                            
              PERFORM 0430-SAVE-KEYS-IN-TS.                                     
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          MOVE ACCOUNT DATA TO MAP                             *         
      *---------------------------------------------------------------*         
       6120-RESET-ACCT-DISPLAY.                                                 
           SET TWA-UPDATE-MOD TO TRUE.                                          
           ADD +1 TO SUB.                                                       
DJ0001     IF  ACAT-SIGN-ON-UPDATE                                              
           MOVE ATT-UNPROT TO ACT-A (SUB) EXPDT-A (SUB).                        
                                                                                
           MOVE ACAT32-ACT-BRANCH TO BR-O (SUB) TWA-MAP-BR (SUB).               
           MOVE ACAT32-ACT-ACCT   TO AC-O (SUB) TWA-MAP-AC (SUB).               
           MOVE ACAT32-ACT-RR     TO RR-O (SUB) TWA-MAP-RR (SUB).               
                                                                                
LRM002     IF ACAT32-ACT-COMMENT NOT = SPACES                                   
LRM002        MOVE ACAT32-ACT-COMMENT  TO TSQ-MAP-COMMENT (SUB)                 
LRM002        MOVE 'Y'   TO CMNT-O (SUB)  TWA-MAP-CMNT (SUB)                    
LRM002     ELSE                                                                 
LRM002        MOVE SPACES              TO TSQ-MAP-COMMENT (SUB)                 
LRM002                      CMNT-O (SUB)  TWA-MAP-CMNT (SUB)                    
LRM002     END-IF                                                               
                                                                                
LRM002     IF ACAT32-ACT-EXPDT = '0001-01-01'                                   
LRM002        MOVE SPACES           TO TWA-MAP-EXPDT (SUB)                      
LRM002                                 TWA-ORIG-EXPDT (SUB)                     
LRM002     ELSE                                                                 
LRM002        MOVE ACAT32-ACT-EXPDT-MM TO TWA-MAP-EXPDT-MM (SUB)                
LRM002        MOVE ACAT32-ACT-EXPDT-DD TO TWA-MAP-EXPDT-DD (SUB)                
LRM002        MOVE ACAT32-ACT-EXPDT-YY TO TWA-MAP-EXPDT-YY (SUB)                
LRM002        MOVE '/' TO TWA-MAP-EXPDT-S1 (SUB)                                
LRM002                    TWA-MAP-EXPDT-S2 (SUB)                                
LRM002        MOVE TWA-MAP-EXPDT (SUB) TO EXPDT-O (SUB)                         
LRM002                                 TWA-ORIG-EXPDT (SUB)                     
LRM002     END-IF                                                               
                                                                                
           IF SUB = 1                                                           
              MOVE TWA-MAP-BR (SUB)                                             
                TO TWA-BR-KEY-FIRST  TWA-BR-KEY-LAST                            
              MOVE TWA-MAP-AC (SUB)                                             
                TO TWA-AC-KEY-FIRST  TWA-AC-KEY-LAST                            
           ELSE                                                                 
              MOVE TWA-MAP-BR (SUB) TO TWA-BR-KEY-LAST                          
              MOVE TWA-MAP-AC (SUB) TO TWA-AC-KEY-LAST.                         
                                                                                
           MOVE SUB  TO TWA-SCR-LINE.                                           
                                                                                
           MOVE WK-CLT(2:3) TO ACATNAIO-CLIENT.                                 
           MOVE TWA-MAP-BR (SUB) TO ACATNAIO-BR.                                
           MOVE TWA-MAP-AC (SUB) TO ACATNAIO-AC.                                
           SET ACATNAIO-NA-READ TO TRUE.                                        
           PERFORM 7800-LINK-TO-ACATNAIO.                                       
           IF ACATNAIO-FOUND                                                    
              MOVE ACATNAIO-NAME  TO NAME-O (SUB) TWA-MAP-NAME (SUB).           
                                                                                
           MOVE TWA-MAP-BR (SUB) TO ACAT32-PASS-BR.                             
           MOVE TWA-MAP-AC (SUB) TO ACAT32-PASS-AC.                             
           MOVE SUB TO TWA-SCR-LINE.                                            
           IF SUB > 1                                                           
              PERFORM 0600-OPEN-SEC-CURSOR-TBL.                                 
           SUBTRACT 1 FROM SUB GIVING SUB2.                                     
           MOVE SPACE TO WS-NO-MORE-SEC-SW                                      
                         WS-SEC-FOUND-SW.                                       
           PERFORM 6130-RESET-SECURITY-DISPLAY THRU 6130-EXIT                   
              UNTIL SUB2 >= 8  OR WS-NO-MORE-SEC.                               
           PERFORM 0620-CLOSE-SEC-CURSOR-TBL.                                   
           IF NOT WS-SEC-FOUND                                                  
              ADD 1 TO SUB2.                                                    
           MOVE SUB2 TO SUB.                                                    
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          MOVE SECURITY DATA TO MAP                            *         
      *---------------------------------------------------------------*         
       6130-RESET-SECURITY-DISPLAY.                                             
           IF SUB2 > 0                                                          
              PERFORM 0610-FETCH-SEC-CURSOR-TBL                                 
              IF WS-NO-MORE-SEC                                                 
                 GO TO 6130-EXIT.                                               
                                                                                
           ADD +1 TO SUB2 WS-SEC-LINE.                                          
           SET WS-SEC-FOUND TO TRUE.                                            
                                                                                
           MOVE ACAT32-SEC-SECURITY TO ACATMSD-SEARCH-KEY.                      
           SET ACATMSD-MSD-READ TO TRUE.                                        
           PERFORM 7900-LINK-TO-ACATMSD.                                        
           IF ACATMSD-FOUND                                                     
              MOVE ACATMSD-ADP-NBR TO TWA-MAP-ADP-NBR (SUB2)                    
              MOVE ACATMSD-CUSIP TO SEC-O   (SUB2) TWA-MAP-SEC   (SUB2)         
              MOVE ACATMSD-DESC  TO DESC1-O (SUB2) TWA-MAP-DESC1 (SUB2)         
              MOVE ACATMSD-DESC2 TO DESC2-O (SUB2) TWA-MAP-DESC2 (SUB2).        
                                                                                
LRM002     IF ACAT32-SEC-COMMENT NOT = SPACES                                   
LRM002        MOVE ACAT32-SEC-COMMENT  TO TSQ-MAP-COMMENT (SUB2)                
LRM002        MOVE 'Y'   TO CMNT-O (SUB2) TWA-MAP-CMNT (SUB2)                   
LRM002     ELSE                                                                 
LRM002        MOVE SPACES              TO TSQ-MAP-COMMENT (SUB2)                
LRM002                      CMNT-O (SUB2) TWA-MAP-CMNT (SUB2)                   
LRM002     END-IF                                                               
                                                                                
LRM002     IF ACAT32-SEC-EXPDT = '0001-01-01'                                   
LRM002        MOVE SPACES           TO TWA-MAP-EXPDT (SUB2)                     
LRM002                                 TWA-ORIG-EXPDT (SUB2)                    
LRM002     ELSE                                                                 
LRM002        MOVE ACAT32-SEC-EXPDT-MM TO TWA-MAP-EXPDT-MM (SUB2)               
LRM002        MOVE ACAT32-SEC-EXPDT-DD TO TWA-MAP-EXPDT-DD (SUB2)               
LRM002        MOVE ACAT32-SEC-EXPDT-YY TO TWA-MAP-EXPDT-YY (SUB2)               
LRM002        MOVE '/' TO TWA-MAP-EXPDT-S1 (SUB2)                               
LRM002                    TWA-MAP-EXPDT-S2 (SUB2)                               
LRM002        MOVE TWA-MAP-EXPDT (SUB2) TO EXPDT-O (SUB2)                       
LRM002                                 TWA-ORIG-EXPDT (SUB2)                    
LRM002     END-IF                                                               
                                                                                
           IF WS-SEC-LINE = 1                                                   
              MOVE TWA-MAP-SEC (SUB2)                                           
                TO TWA-SEC-KEY-FIRST TWA-SEC-KEY-LAST                           
           ELSE                                                                 
           IF WS-SEC-LINE > 1                                                   
              MOVE TWA-MAP-SEC (SUB2)                                           
                TO TWA-SEC-KEY-LAST                                             
           END-IF.                                                              
           MOVE SUB2 TO TWA-SCR-LINE.                                           
DJ0001     IF  ACAT-SIGN-ON-UPDATE                                              
           MOVE ATT-UNPROT  TO ACT-A (SUB2) EXPDT-A (SUB2).                     
       6130-EXIT.                                            EXIT.              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          READ NEXT ACCOUNT UNTIL KEY FOUND                    *         
      *---------------------------------------------------------------*         
       6150-GET-NEXT-ACCT.                                                      
           PERFORM 0510-FETCH-ACCT-CURSOR-TBL.                                  
           IF ACAT32-NORMAL                                                     
              MOVE ACAT32-ACT-BRANCH TO WS-BR-KEY                               
              MOVE ACAT32-ACT-ACCT   TO WS-AC-KEY                               
              IF WS-BR-AC-KEY = TWA-BR-AC-KEY-LAST                              
                 SET WS-ACCT-EQUAL-FOUND  TO TRUE                               
              ELSE                                                              
              IF WS-BR-AC-KEY > TWA-BR-AC-KEY-LAST                              
                 SET WS-ACCT-GREATER-FOUND TO TRUE                              
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *       FIND NEXT SECURITY BELONGING TO THE ACCOUNT             *         
      *---------------------------------------------------------------*         
       6160-FIND-NEXT-SEC.                                                      
           MOVE TWA-BR-KEY-LAST  TO ACAT32-PASS-BR.                             
           MOVE TWA-AC-KEY-LAST  TO ACAT32-PASS-AC.                             
           PERFORM 0600-OPEN-SEC-CURSOR-TBL.                                    
           MOVE SPACE TO WS-SEC-KEY-FOUND-SW                                    
                         WS-NO-MORE-SEC-SW.                                     
           PERFORM UNTIL WS-SEC-KEY-FOUND OR WS-NO-MORE-SEC                     
             PERFORM 0610-FETCH-SEC-CURSOR-TBL                                  
             IF ACAT32-NORMAL                                                   
                IF ACAT32-SEC-SECURITY > TWA-SEC-KEY-LAST                       
                   SET WS-SEC-KEY-FOUND TO TRUE                                 
                END-IF                                                          
             END-IF                                                             
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *         DISPLAY ACCOUNTS                                      *         
      *---------------------------------------------------------------*         
       6170-RESET-MAP-FOR-PF8.                                                  
           INITIALIZE TWA-MAP-AREA.                                             
LRM002     MOVE SPACES TO TSQ-COMMENT-AREA.                                     
           INITIALIZE TWA-MAP-SAVE-AREA.                                        
           PERFORM 2000-ATTRIB-TO-ASKIP.                                        
           PERFORM 2010-CLEAR-SCR.                                              
           MOVE 0 TO SUB WS-SEC-LINE.                                           
           PERFORM UNTIL SUB >= 8 OR WS-NO-MORE-ACCT                            
              PERFORM 0410-SETUP-ACCT                                           
              PERFORM 0510-FETCH-ACCT-CURSOR-TBL                                
           END-PERFORM.                                                         
           PERFORM 0520-CLOSE-ACCT-CURSOR-TBL.                                  
           IF TWA-SCR-LINE > 0                                                  
              ADD +1 TO TWA-PAGE-NUM                                            
              PERFORM 0430-SAVE-KEYS-IN-TS.                                     
      *                                                                         
      *-------------------------------------------------------------*           
      *           TS QUEUE FOR TWA AREA                             *           
      *-------------------------------------------------------------*           
       7000-READ-TSQ-RTN.                                                       
           MOVE 'ACAX'   TO TRAN-ID.                                            
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                                   
                              INTO(TWA-AREA)                                    
                              LENGTH(LENGTH OF TWA-AREA)                        
                              ITEM(ITEM-NUM)                                    
           END-EXEC.                                                            
           IF (EIBRESP NOT = +0)                                                
           AND (NOT FIRST-TIME)                                                 
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT32MO                                        
              MOVE 'ACAT32RX READ TSQ ERROR'                                    
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
LRM002     MOVE 'ACAC'   TO TRAN-ID.                                            
LRM002     EXEC CICS READQ TS QUEUE(TSQ-NAME)                                   
LRM002                        INTO(TSQ-COMMENT-AREA)                            
LRM002                        LENGTH(LENGTH OF TSQ-COMMENT-AREA)                
LRM002                        ITEM(ITEM-NUM)                                    
LRM002                        RESP(WK-RESP)                                     
LRM002     END-EXEC.                                                            
LRM002     IF WK-RESP NOT = 0                                           15960000
LRM002        MOVE SPACES TO TSQ-COMMENT-AREA                           15960000
LRM002     END-IF.                                                      15960000
       7010-DELETE-TSQ-RTN.                                                     
           MOVE 'ACAX'   TO TRAN-ID.                                            
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                                 
           END-EXEC.                                                            
LRM002     MOVE 'ACAC'   TO TRAN-ID.                                            
LRM002     EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                                 
LRM002     END-EXEC.                                                            
                                                                                
       7020-WRITE-TSQ-RTN.                                                      
           MOVE 'ACAX'   TO TRAN-ID.                                            
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                                  
                               FROM(TWA-AREA)                                   
                               LENGTH(LENGTH OF TWA-AREA)                       
                               ITEM(ITEM-NUM)                                   
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT32MO                                        
              MOVE 'ACAT32RX WRITE TSQ ERROR'                                   
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
LRM002     MOVE 'ACAC'   TO TRAN-ID.                                            
LRM002     EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                                  
LRM002                         FROM(TSQ-COMMENT-AREA)                           
LRM002                         LENGTH(LENGTH OF TSQ-COMMENT-AREA)               
LRM002                         ITEM(ITEM-NUM)                                   
LRM002                         RESP(WK-RESP)                                    
LRM002     END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
      *-------------------------------------------------------------*           
      *           TS QUEUE FOR SAVE KEY AREA                        *           
      *-------------------------------------------------------------*           
       7030-READ-TSQ-SAVE.                                                      
LRM002     MOVE 'ACAX'   TO TRAN-ID.                                            
           EXEC CICS READQ TS QUEUE(TSQ-SAVE)                                   
                              INTO(TS-SAVE-KEY-AREA)                            
                              LENGTH(LENGTH OF TS-SAVE-KEY-AREA)                
                              ITEM(TS-ITEM)                                     
                              RESP(WK-RESP)                                     
           END-EXEC.                                                            
           IF WK-RESP = 0                                               15960000
              SET TS-READ-OK TO TRUE                                    15960000
           ELSE                                                         15960000
           IF WK-RESP = DFHRESP(ITEMERR)                                15960000
              SET TS-READ-ITEM-ERR TO TRUE                              15960000
           ELSE                                                         15960000
           IF WK-RESP = DFHRESP(QIDERR)                                 15960000
              SET TS-READ-QID-ERR TO TRUE                               15960000
           ELSE                                                         15960000
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT32MO                                        
              MOVE 'ACAT32RX READ TSQ-SAVE ERROR'                               
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
       7040-DELETE-TSQ-SAVE.                                                    
LRM002     MOVE 'ACAX'   TO TRAN-ID.                                            
           EXEC CICS DELETEQ TS QUEUE(TSQ-SAVE)                                 
           END-EXEC.                                                            
                                                                                
       7050-WRITE-TSQ-SAVE.                                                     
           MOVE 'ACAX'   TO TRAN-ID.                                            
           EXEC CICS WRITEQ TS QUEUE(TSQ-SAVE)                                  
                               FROM(TS-SAVE-KEY-AREA)                           
                               LENGTH(LENGTH OF TS-SAVE-KEY-AREA)               
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT32MO                                        
              MOVE 'ACAT32RX WRITE TSQ-SAVE ERROR'                              
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
       7060-REWRITE-TSQ-SAVE.                                                   
           MOVE 'ACAX'   TO TRAN-ID.                                            
           EXEC CICS WRITEQ TS QUEUE(TSQ-SAVE)                                  
                               FROM(TS-SAVE-KEY-AREA)                           
                               LENGTH(LENGTH OF TS-SAVE-KEY-AREA)               
                               ITEM(TS-ITEM)                                    
                               REWRITE                                          
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT32MO                                        
              MOVE 'ACAT32RX REWRITE TSQ-SAVE ERROR'                            
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
      *            CALL DB2 I/O MODULE ACAT32DB                     *           
      *-------------------------------------------------------------*           
       7600-LINK-TO-ACAT32DB.                                                   
           EXEC CICS LINK                                                       
                     PROGRAM('ACAT32DB')                                        
                     COMMAREA(ACAT32IO-COMMAREA)                                
                     LENGTH(LENGTH OF ACAT32IO-COMMAREA)                        
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
      *       CALL NA MODULE                                        *           
      *-------------------------------------------------------------*           
       7800-LINK-TO-ACATNAIO.                                                   
           EXEC CICS LINK PROGRAM (WS-ACATNAIO)                                 
                COMMAREA(ACATNAIO-CALL-AREA)                                    
                LENGTH(LENGTH OF ACATNAIO-CALL-AREA)                            
           END-EXEC.                                                            
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
           EXEC CICS SEND MAP('ACAT32M')                                        
                     MAPSET('ACAT32M')                                          
                     FROM(ACAT32MO)                                             
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
               EXEC CICS SEND MAP('ACAT32M')                                    
                         MAPSET('ACAT32M')                                      
                         FROM(ACAT32MO)                                         
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
           EXEC CICS RECEIVE MAP('ACAT32M')                                     
                             MAPSET('ACAT32M')                                  
                             FROM(ACAT-RECEIVE-MAP)                             
                             INTO(ACAT32MI)                                     
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
