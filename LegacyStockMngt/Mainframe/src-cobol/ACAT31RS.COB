000001* PDX    - ACAT31RS C0318727 01/11/12 13:48:04 TBLAMUR            00001000
000001* PDX    - ACAT31RS C0278346 03/24/09 16:14:49 TBLAMUR            00001000
LRM003* SSR 61867 MAINTAIN VRSTSEC VRSTBRKR BY ADP NBR NOT CUSIP.               
LRM003*           ALLOW SECURITY SEARCH WHEN NON UPDATE SNON                    
000001* PDX    - ACAT31RS C0270299 09/15/08 16:33:44 TBLAMUR            00001000
000001* LRM SSRS 55766 55717 RECOMPILE ONLY FOR COPYS ACATCOM,90TS,JUMP.        
000001* PDX    - ACAT31RS C0258681 02/11/08 14:41:29 TBLAMUR            00001000
LRM002* SSR 47237 ADD OPTIONAL EXPIRATION DATE AND COMMENT TO MAP               
000001* PDX    - ACAT31RS C0250441 06/25/07 15:17:36 TBLAMUR            00001000
000001* LRM001 - SSR 53075 SPIN-OFF CHANGES                                     
000001* PDX    - ACAT31RS C0179784 09/26/02 14:41:57 TBEDTAK            00001000
000001* PDX    - ACAT31RS C0160324 06/25/01 08:38:47 TBLAMUR            00001000
000001* PDX    - ACAT31RS C0151771 02/23/01 11:17:45 TBDOJUN            00001000
000001* PDX    - ACAT31RS C0126743 06/10/99 09:40:29 TBEDTAK            00001000
000001* PDX    - ACAT31RS C0123136 03/25/99 11:22:22 TBEDTAK            00001000
000001* PDX    - ACAT31RS C0120838 01/26/99 11:46:24 TBCHLUO            00001000
000001* PDX    - ACAT31RS C0120330 01/21/99 15:22:17 TBEDTAK            00001000
000001* PDX    - ACAT31RS C0109165 09/30/98 10:56:23 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT31RS.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *              ACAT PROCESS/RESTRICTED SECURITIES               *         
      *****************************************************************         
      *  DATABASE:                                                    *         
      *      VRSTSEC  (RESTRICTED SECURITIES)                         *         
      *      VRSTBRKR (RESTRICTED BROKERS)                            *         
      *  PURPOSE:                                                     *         
      *  THE PROGRAM DISPLAYS A LIST OF RESTRICTED SECURITIES FROM    *         
      *  A RESTRICTED SECURITY TABLE, ALONG WITH THE ASSOCIATED       *         
      *  CONTRA BROKERS FROM RESTRICTED BROKER TABLE.                 *         
      *  THE USER CAN OVERTYPE THE FIELDS TO MODIFY, OR TYPE 'D' IN   *         
      *  THE ACTION FIELD TO DELETE THE SECURITIES.                   *         
LRM002*  PF1 KEY IS USED TO ADD COMMENT/REASON FOR RESTRICTION.       *         
      *  PF2 KEY IS USED TO ADD NEW RESTRICTED SECURITIES.            *         
      *  PF3 KEY IS USED TO CANCEL ADDING NEW SECURITIES.             *         
      *  PF5 KEY IS USED TO UPDATE THE DATABASE FOR ADD/MOD/DEL.      *         
      *  PA1 AND PA2 ARE USED TO PAGING FORWARDS AND BACKWARDS.       *         
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
           05  WS-NO-MORE-DATA-SW         PIC X(01) VALUE SPACE.                
               88  WS-NO-MORE-DATA                  VALUE 'N'.                  
           05  WS-NO-MORE-BKR-DATA-SW     PIC X(01) VALUE SPACE.                
               88  WS-NO-MORE-BKR-DATA              VALUE 'N'.                  
           05  WS-SEARCH-CHANGED-SW       PIC X(01) VALUE SPACE.                
               88  WS-SEARCH-CHANGED                VALUE 'Y'.                  
           05  WS-VALID-QTY-SW            PIC X(01).                            
               88  WS-VALID-QTY                     VALUE 'Y'.                  
           05  LENGTH-DETERMINED-SW       PIC X(01).                            
               88  LENGTH-DETERMINED                VALUE 'Y'.                  
       01  ACAT-WORK-AREA.                                                      
           05  WS-DELETE-CUSIP-TBL.                                             
               07  WS-DELETE-CUSIP        PIC X(12) OCCURS 3 TIMES.             
           05  CURRENCY-NUM               PIC 9(03).                            
           05  CURRENCY-X REDEFINES CURRENCY-NUM                                
                                          PIC X(03).                            
LRM002     05  WK-RESP                    PIC S9(8) COMP.                       
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
           05  WS-LOOP-CNT                PIC S9(07) COMP-3.                    
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
           05  WS-LINE-DELETED-SW         PIC X(01).                            
               88  WS-LINE-DELETED                  VALUE 'Y'.                  
           05  WS-SCROLL-KEY-FOUND-SW     PIC X(01).                            
               88  WS-SCROLL-KEY-FOUND              VALUE 'Y'.                  
           05  WS-KEY-FOUND-SW            PIC X(01).                            
               88  WS-KEY-FOUND                     VALUE 'Y'.                  
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
           05  WS-DIVIDED                 PIC 9(09).                            
           05  WS-REMAIN                  PIC 9(02).                            
           05  WS-ACAT-NEXT               PIC X.                                
           05  WS-INIT-TFR-ROWS           PIC 9(03).                            
           05  WS-SECURITY                PIC X(12).                            
           05  SUB                        PIC S9(09) COMP-3.                    
           05  SUB2                       PIC S9(09) COMP-3.                    
           05  SUB3                       PIC S9(09) COMP-3.                    
           05  C-IDX                      PIC S9(03) COMP-3.                    
      *                                                                         
       01  ACATPPIO-CALL-AREA.                                                  
           COPY ACATPPIO.                                                       
           EJECT                                                                
       01  ACATMSD-CALL-AREA.                                                   
           COPY ACATMSDI.                                                       
           EJECT                                                                
       01  ACAT31IO-COMMAREA.                                                   
           COPY ACAT31IO.                                                       
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
       COPY ACAT31M.                                                            
       01  ACAT31MR REDEFINES ACAT31MI.                                         
           02  FILLER                          PIC X(12).                       
           02  RESTRICT-INFO   OCCURS 3 TIMES.                                  
               03  ACTION-L                    PIC S9(4) COMP.                  
               03  ACTION-A                    PIC X(01).                       
               03  ACTION-O                    PIC X(01).                       
               03  CUSIP-L                     PIC S9(4) COMP.                  
               03  CUSIP-A                     PIC X(01).                       
               03  CUSIP-O                     PIC X(12).                       
LRM002         03  CMNT-L                      PIC S9(4) COMP.                  
LRM002         03  CMNT-A                      PIC X(01).                       
LRM002         03  CMNT-O                      PIC X(01).                       
LRM002         03  EXPDT-L                     PIC S9(4) COMP.                  
LRM002         03  EXPDT-A                     PIC X(01).                       
LRM002         03  EXPDT-O                     PIC X(08).                       
               03  DESC1-L                     PIC S9(4) COMP.                  
               03  DESC1-A                     PIC X(01).                       
               03  DESC1-O                     PIC X(30).                       
               03  MEMO-L                      PIC S9(4) COMP.                  
               03  MEMO-A                      PIC X(01).                       
               03  MEMO-O                      PIC X(01).                       
               03  TYPE-L                      PIC S9(4) COMP.                  
               03  TYPE-A                      PIC X(01).                       
               03  TYPE-O                      PIC X(04).                       
               03  ISIN-L                      PIC S9(4) COMP.                  
               03  ISIN-A                      PIC X(01).                       
LRM003         03  ISIN-O                      PIC X(12).                       
               03  DESC2-L                     PIC S9(4) COMP.                  
               03  DESC2-A                     PIC X(01).                       
               03  DESC2-O                     PIC X(30).                       
LRM002         03  CRTDT-L                     PIC S9(4) COMP.                  
LRM002         03  CRTDT-A                     PIC X(01).                       
LRM002         03  CRTDT-O                     PIC X(08).                       
               03  DESC3-L                     PIC S9(4) COMP.                  
               03  DESC3-A                     PIC X(01).                       
               03  DESC3-O                     PIC X(30).                       
               03  CONTRA-BROKER  OCCURS 14 TIMES.                              
                   05  CBRKR-L                 PIC S9(4) COMP.                  
                   05  CBRKR-A                 PIC X(01).                       
                   05  CBRKR-O                 PIC X(04).                       
               03  RSTMSG-L                    PIC S9(4) COMP.                  
               03  RSTMSG-A                    PIC X(01).                       
               03  RSTMSG-O                    PIC X(70).                       
           02  FILLER                          PIC X(19).                       
            EJECT                                                               
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
           03  FILLER                          PIC X(2000).                     
                                                                                
       COPY TWACOMMN.                                                           
           03 TWA-ACAT-AREA.                                                    
              05 TWA-MAP-AREA.                                                  
                 07 TWA-MAP-SEC-AREA    OCCURS 3 TIMES.                         
                    09 TWA-MAP-ACTION       PIC X(01).                          
                    09 TWA-MAP-CUSIP        PIC X(12).                          
LRM002              09 TWA-MAP-CMNT         PIC X(01).                          
LRM002              09 TWA-MAP-COMMENT      PIC X(120).                         
LRM002              09 TWA-MAP-EXPDT        PIC X(10).                          
LRM002              09 FILLER REDEFINES TWA-MAP-EXPDT.                          
LRM002                 11 TWA-MAP-EXPDT-MM  PIC X(02).                          
LRM002                 11 TWA-MAP-EXPDT-S1  PIC X(01).                          
LRM002                 11 TWA-MAP-EXPDT-DD  PIC X(02).                          
LRM002                 11 TWA-MAP-EXPDT-S2  PIC X(01).                          
LRM002                 11 TWA-MAP-EXPDT-YY  PIC X(02).                          
LRM002              09 TWA-MAP-CRTDT        PIC X(08).                          
                    09 TWA-MAP-DESC1        PIC X(30).                          
                    09 TWA-MAP-MEMO         PIC X(01).                          
                    09 TWA-MAP-TYPE         PIC X(04).                          
                    09 TWA-MAP-ADP-NBR      PIC X(07).                          
LRM003              09 TWA-MAP-ISIN         PIC X(12).                          
                    09 TWA-MAP-DESC2        PIC X(30).                          
                    09 TWA-MAP-DESC3        PIC X(30).                          
                    09 TWA-MAP-CONTRA.                                          
                       11 TWA-MAP-CBRKR     PIC X(04) OCCURS 14 TIMES.          
                    09 TWA-MAP-RSTMSG       PIC X(70).                          
                 07 TWA-MAP-SEC             PIC X(12).                          
                 07 TWA-MAP-NEXT            PIC X(01).                          
              05 TWA-MAP-SAVE-AREA.                                             
                 07 TWA-MAP-ORIGNAL-AREA  OCCURS 3 TIMES.                       
LRM002********      09 TWA-ORIG-COMMENT     PIC X(120).                         
LRM002              09 TWA-ORIG-EXPDT       PIC X(10).                          
                    09 TWA-ORIG-MEMO        PIC X(01).                          
                    09 TWA-ORIG-TYPE        PIC X(04).                          
                    09 TWA-ORIG-RSTMSG      PIC X(70).                          
                    09 TWA-ORIG-CONTRA.                                         
                       11 TWA-ORIG-CBRKR    PIC X(04) OCCURS 14 TIMES.          
                 07 TWA-MAP-CHG-IND       OCCURS 3 TIMES.                       
                    09 TWA-MAP-SEC-CHG-IND  PIC X(01).                          
                    09 TWA-MAP-BKR-CHG-IND  PIC X(01).                          
                 07 TWA-PREV-MAP-SEC        PIC X(12).                          
                 07 TWA-SEC-SCR-LINE        PIC 9(03).                          
                 07 TWA-UPDATE-IND          PIC X(01).                          
                    88 TWA-UPDATE-ADD                 VALUE 'A'.                
                    88 TWA-UPDATE-MOD                 VALUE 'M'.                
LRM002           07 TWA-CMNT-SUB            PIC 9(01).                          
              05 TWA-SEC-SEARCH-ERR-SW      PIC X(01).                          
                 88 TWA-SEC-SEARCH-ERR                VALUE 'Y'.                
              05 TWA-MAP-KEY-AREA.                                              
                 07 TWA-MAP-KEY-FIRST.                                          
                    09 TWA-KEY-CLT-FIRST    PIC X(04).                          
                    09 TWA-KEY-SEC-FIRST    PIC X(09).                          
                 07 TWA-MAP-KEY-LAST.                                           
                    09 TWA-KEY-CLT-LAST     PIC X(04).                          
                    09 TWA-KEY-SEC-LAST     PIC X(09).                          
              05 TWA-MAP-SEARCH.                                                
                 07 TWA-MAP-MMBR            PIC X(3).                           
                 07 TWA-MAP-MMAC            PIC X(5).                           
                 07 TWA-MAP-MMRR            PIC X(3).                           
                 07 TWA-MAP-MMTFR           PIC X(3).                           
                 07 TWA-MAP-MMRD            PIC X(1).                           
                 07 TWA-MAP-MMBKR           PIC X(4).                           
                 07 TWA-MAP-MMSTAT          PIC X(3).                           
                 07 TWA-MAP-MMSD            PIC X(6).                           
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
              MOVE LOW-VALUE TO ACAT31MO                                        
              SET WK-ERROR TO TRUE                                              
              MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO SYSTEM-MSG             
              PERFORM  9000-ERROR-RTN.                                          
                                                                                
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                          
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       MAIN-PROCESSING.                                                         
           INITIALIZE ACAT31IO-COMMAREA.                                        
           MOVE EIBTRMID TO TERM-ID.                                            
           MOVE EIBTRNID TO TRAN-ID.                                            
           MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                               
           MOVE 'N'           TO END-OF-DATA-FLAG.                              
           MOVE SPACES        TO SYSTEM-MSG.                                    
           INITIALIZE TWA-MAP-AREA.                                             
           INITIALIZE TWA-MAP-SAVE-AREA.                                        
           MOVE LOW-VALUE     TO HDRMAPO                                        
                                 ACAT31MO.                                      
           PERFORM 0100-GET-DATE-AND-TIME.                                      
           MOVE  DFHCOMMAREA     TO  ACATCOMM-COMMAREA.                         
           MOVE  TWA-CLIENT-NO-X TO WK-CLT-NBR.                                 
           MOVE  WK-CLT          TO  ACAT31-PASS-CLT.                           
                                                                                
           IF  ACAT-PROGRAM-NAME = 'ACAT31RS'                                   
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
               PERFORM 0900-CONTINUE-PROCESS                                    
           ELSE                                                                 
               MOVE 'ACAT31RS' TO ACAT-PROGRAM-NAME                             
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
       0200-FIRST-TIME-RTN.                                                     
           SET FIRST-TIME TO TRUE.                                              
           MOVE 'X' TO ACAT-NEXT.                                               
LRM002     IF EIBAID = DFHPF10                                                  
LRM002     AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                              
LRM002        MOVE SPACES TO ACAT-CALLING-PROG-NAME                             
LRM002        PERFORM 7000-READ-TSQ-RTN                                         
LRM002        PERFORM 7010-DELETE-TSQ-RTN                                       
LRM002        PERFORM 0210-RETURNED-FROM-ACAT90CM                               
LRM002        MOVE ZERO  TO TWA-SEC-SCR-LINE                                    
LRM003        IF TWA-MAP-SEC > SPACES                                           
LRM003           PERFORM 1710-SECURITY-SEARCH                                   
LRM003        ELSE                                                              
LRM002           PERFORM 5000-RESET-SCR-DISPLAY                                 
LRM003        END-IF                                                            
LRM002        MOVE -1 TO MNEXTL                                                 
LRM002        PERFORM 7020-WRITE-TSQ-RTN                                        
LRM002        PERFORM 8000-SEND-MAP-ERASE                                       
LRM002        PERFORM 8800-RETURN-TO-CICS                                       
LRM002     END-IF.                                                              
                                                                                
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           MOVE SPACES TO ACAT-CALLING-PROG-NAME                                
                          TWA-UPDATE-IND.                                       
           PERFORM 2000-ATTRIB-TO-ASKIP.                                        
           MOVE ACAT-INP-BRANCH     TO  MMBRO   TWA-MAP-MMBR.                   
           MOVE ACAT-INP-ACCOUNT    TO  MMACO   TWA-MAP-MMAC.                   
           MOVE ACAT-INP-RR         TO  MMRRO   TWA-MAP-MMRR.                   
           MOVE ACAT-INP-TFR-TYP    TO  MMTFRO  TWA-MAP-MMTFR.                  
           MOVE ACAT-INP-RCV-DEL    TO  MMRDO   TWA-MAP-MMRD.                   
           MOVE ACAT-INP-CONTRA-BKR TO  MMBKRO  TWA-MAP-MMBKR.                  
           MOVE ACAT-INP-STATUS     TO  MMSTATO TWA-MAP-MMSTAT.                 
           MOVE ACAT-INP-STTL-DT    TO  MMSDO   TWA-MAP-MMSD.                   
           MOVE  SPACE TO  MSECO TWA-MAP-SEC TWA-PREV-MAP-SEC.                  
           MOVE  'X'   TO  ACAT-INP-SEL.                                        
           PERFORM 1840-VALIDATE-SRCH-ENGINE.                                   
           IF NOT WK-ERROR                                                      
              MOVE SPACE TO WS-DELETE-CUSIP-TBL                                 
              MOVE ZERO  TO TWA-SEC-SCR-LINE                                    
              PERFORM 0400-REFRESH-WITH-NEW-SECUR                               
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
LRM002     IF WK-RESP = 0                                                       
LRM002        MOVE TWA-CMNT-SUB TO SUB                                          
LRM002        MOVE ACAT90CM-TS-MCCMNT-X120                                      
LRM002                     TO TWA-MAP-COMMENT (SUB)                             
LRM002        MOVE 'Y' TO TWA-MAP-SEC-CHG-IND (SUB)                             
LRM002        PERFORM 4000-UPDATE-RTN                                           
LRM002        END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *    DISPLAY A LIST OF RESCRICTED SECURITY FROM DB2 TABLE      *          
      *--------------------------------------------------------------*          
       0400-REFRESH-WITH-NEW-SECUR.                                             
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           PERFORM 0500-OPEN-SEC-CURSOR-TBL.                                    
           PERFORM VARYING SUB FROM 1 BY 1                                      
                       UNTIL WS-NO-MORE-DATA  OR  SUB > 3                       
              PERFORM 0510-FETCH-SEC-CURSOR-TBL                                 
              IF WS-NO-MORE-DATA                                                
                 IF SUB = 1                                                     
                    MOVE -1 TO MNEXTL                                           
                    SET WK-MSG-ON TO TRUE                                       
                    MOVE 'NO RESTRICTED SECURITIES FOUND FOR THIS REQUES        
      -                  'T'                                                    
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              ELSE                                                              
                 PERFORM 0700-SETUP-SCREEN                                      
              END-IF                                                            
           END-PERFORM.                                                         
           PERFORM 0520-CLOSE-SEC-CURSOR-TBL.                                   
       EJECT                                                                   2
      *                                                                         
      *--------------------------------------------------------------*          
      *          OPEN RESTRICTED SECURITY CURSOR TABLE               *          
      *--------------------------------------------------------------*          
       0500-OPEN-SEC-CURSOR-TBL.                                                
           SET ACAT31-OPN-SECCSR TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-ERROR                                                      
LRM001        MOVE                                                              
LRM001        'DB2 OPEN ERROR ON REST SECURITY TBL - CALL HELP DESK'            
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *                                                                         
      *--------------------------------------------------------------*          
      *         FETCH RESTRICTED SECURITY CURSOR TABLE               *          
      *--------------------------------------------------------------*          
       0510-FETCH-SEC-CURSOR-TBL.                                               
           SET ACAT31-FET-SECCSR TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT31-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0520-CLOSE-SEC-CURSOR-TBL                                 
LRM001        MOVE                                                              
LRM001        'DB2 FETCH ERROR ON REST SECURITY TABLE - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
                                                                                
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLOSE RESTRICTED SECURITY CURSOR TABLE               *          
      *--------------------------------------------------------------*          
       0520-CLOSE-SEC-CURSOR-TBL.                                               
           SET ACAT31-CLO-SECCSR  TO TRUE                                       
           INITIALIZE ACAT31-RET-VALUES.                                        
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-ERROR                                                      
LRM001        MOVE                                                              
LRM001        'DB2 CLOSE ERROR ON REST SECURITY TABLE - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *   OPEN RESTRICTED SECURITY CURSOR TABLE IN DESCENDING ORDER  *          
      *--------------------------------------------------------------*          
       0530-OPEN-SEC-CURSOR-DESCEND.                                            
           SET ACAT31-OPN-SECCSRD TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-ERROR                                                      
LRM001        MOVE 'DB2 OPEN ERROR ON SECURITY DESCEND - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *                                                                         
      *--------------------------------------------------------------*          
      *  FETCH RESTRICTED SECURITY CURSOR TABLE IN DESCENDING ORDER  *          
      *--------------------------------------------------------------*          
       0540-FETCH-SEC-CURSOR-DESCEND.                                           
           SET ACAT31-FET-SECCSRD TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT31-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              PERFORM 0550-CLOSE-SEC-CURSOR-DESCEND                             
LRM001        MOVE                                                              
LRM001        'DB2 FETCH ERROR ON SECURITY DESCEND - CALL HELP DESK'            
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
                                                                                
      *                                                                         
      *--------------------------------------------------------------*          
      *  CLOSE RESTRICTED SECURITY CURSOR TABLE IN DESCENDING ORDER  *          
      *--------------------------------------------------------------*          
       0550-CLOSE-SEC-CURSOR-DESCEND.                                           
           SET ACAT31-CLO-SECCSRD TO TRUE.                                      
           INITIALIZE ACAT31-RET-VALUES.                                        
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-ERROR                                                      
LRM001        MOVE                                                              
LRM001        'DB2 CLOSE ERROR ON SECURITY DESCEND - CALL HELP DESK'            
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         OPEN RESTRICTED BROKER CURSOR TABLE                  *          
      *--------------------------------------------------------------*          
       0560-OPEN-BRKR-CURSOR-TBL.                                               
           SET ACAT31-OPN-BKRCSR TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-ERROR                                                      
LRM001        MOVE 'DB2 OPEN ERROR ON REST BROKER TBL - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *        FETCH RESTRICTED BROKER CURSOR TABLE                  *          
      *--------------------------------------------------------------*          
       0570-FETCH-BRKR-CURSOR-TBL.                                              
           SET ACAT31-FET-BKRCSR TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-NORMAL                                                     
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT31-NOT-FOUND                                                  
              SET WS-NO-MORE-BKR-DATA TO TRUE                                   
           ELSE                                                                 
              PERFORM 0580-CLOSE-BRKR-CURSOR-TBL                                
LRM001        MOVE                                                              
LRM001        'DB2 FETCH ERROR ON REST BROKER TABLE - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *        CLSOE RESTRICTED BROKER CURSOR TABLE                  *          
      *--------------------------------------------------------------*          
       0580-CLOSE-BRKR-CURSOR-TBL.                                              
           SET ACAT31-CLO-BKRCSR  TO TRUE                                       
           INITIALIZE ACAT31-RET-VALUES.                                        
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-ERROR                                                      
LRM001        MOVE                                                              
LRM001        'DB2 CLOSE ERROR ON REST BROKER TABLE - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        MOVE DATA FROM DATABASE TABLE TO THE MAP              *          
      *--------------------------------------------------------------*          
       0700-SETUP-SCREEN.                                                       
           SET TWA-UPDATE-MOD TO TRUE.                                          
LRM003     MOVE ATT-UNPROT TO MSECA                                             
DJ0001     IF  ACAT-SIGN-ON-UPDATE                                              
               MOVE ATT-UNPROT TO ACTION-A (SUB)                                
                                  MEMO-A   (SUB)                                
LRM002                            EXPDT-A  (SUB)                                
                                  TYPE-A   (SUB)                                
                                  RSTMSG-A (SUB)                                
DJ0001     END-IF.                                                              
                                                                                
           IF TWA-UPDATE-MOD                                                    
DJ0001      IF  ACAT-SIGN-ON-UPDATE                                             
                PERFORM VARYING SUB2 FROM 1 BY 1 UNTIL SUB2 > 14                
                    MOVE ATT-UNPROT  TO CBRKR-A (SUB SUB2)                      
                END-PERFORM                                                     
DJ0001      END-IF                                                              
           END-IF.                                                              
                                                                                
           MOVE ACAT31-SEC-SECURITY                                             
             TO CUSIP-O         (SUB)                                           
LRM003          TWA-MAP-ADP-NBR (SUB)                                           
                TWA-MAP-CUSIP   (SUB).                                          
                                                                                
LRM002     IF ACAT31-SEC-EXPDT = '0001-01-01'                                   
LRM002        MOVE SPACES           TO TWA-MAP-EXPDT (SUB)                      
LRM002                                 TWA-ORIG-EXPDT (SUB)                     
LRM002     ELSE                                                                 
LRM002        MOVE ACAT31-SEC-EXPDT-MM TO TWA-MAP-EXPDT-MM (SUB)                
LRM002        MOVE ACAT31-SEC-EXPDT-DD TO TWA-MAP-EXPDT-DD (SUB)                
LRM002        MOVE ACAT31-SEC-EXPDT-YY TO TWA-MAP-EXPDT-YY (SUB)                
LRM002        MOVE '/' TO TWA-MAP-EXPDT-S1 (SUB)                                
LRM002                    TWA-MAP-EXPDT-S2 (SUB)                                
LRM002        MOVE TWA-MAP-EXPDT (SUB) TO EXPDT-O (SUB)                         
LRM002                                 TWA-ORIG-EXPDT (SUB)                     
LRM002     END-IF.                                                              
LRM002     MOVE ACAT31-DATE-ADDED (6 :2) TO TWA-MAP-CRTDT (SUB) (1:2)           
LRM002     MOVE '/'                      TO TWA-MAP-CRTDT (SUB) (3:1)           
LRM002     MOVE ACAT31-DATE-ADDED (3 :2) TO TWA-MAP-CRTDT (SUB) (7:2)           
LRM002     MOVE '/'                      TO TWA-MAP-CRTDT (SUB) (6:1)           
LRM002     MOVE ACAT31-DATE-ADDED (9 :2) TO TWA-MAP-CRTDT (SUB) (4:2)           
LRM002     MOVE TWA-MAP-CRTDT (SUB) TO CRTDT-O (SUB).                           
                                                                                
LRM002     MOVE ACAT31-SEC-COMMENT                                              
LRM002       TO TWA-MAP-COMMENT (SUB).                                          
LRM002*******   TWA-ORIG-COMMENT (SUB).                                         
LRM002     IF ACAT31-SEC-COMMENT NOT = SPACES                                   
LRM002        MOVE 'Y' TO TWA-MAP-CMNT (SUB) CMNT-O (SUB)                       
LRM002     ELSE                                                                 
LRM002        MOVE ' ' TO TWA-MAP-CMNT (SUB) CMNT-O (SUB)                       
LRM002     END-IF.                                                              
                                                                                
           MOVE ACAT31-SEC-MEMO                                                 
             TO MEMO-O          (SUB)                                           
                TWA-MAP-MEMO    (SUB)                                           
                TWA-ORIG-MEMO   (SUB).                                          
           MOVE ACAT31-SEC-MSG                                                  
             TO RSTMSG-O        (SUB)                                           
                TWA-MAP-RSTMSG  (SUB)                                           
                TWA-ORIG-RSTMSG (SUB).                                          
           IF ACAT31-SEC-TYPE = 'D'                                             
              MOVE 'DLV'                                                        
                TO TYPE-O        (SUB)                                          
                   TWA-MAP-TYPE  (SUB)                                          
                   TWA-ORIG-TYPE (SUB)                                          
           ELSE                                                                 
           IF ACAT31-SEC-TYPE = 'R'                                             
              MOVE 'RCV'                                                        
                TO TYPE-O        (SUB)                                          
                   TWA-MAP-TYPE  (SUB)                                          
                   TWA-ORIG-TYPE (SUB)                                          
           ELSE                                                                 
           IF ACAT31-SEC-TYPE = 'B'                                             
              MOVE 'BOTH'                                                       
                TO TYPE-O        (SUB)                                          
                   TWA-MAP-TYPE  (SUB)                                          
                   TWA-ORIG-TYPE (SUB).                                         
                                                                                
           MOVE TWA-MAP-ADP-NBR (SUB) TO ACATMSD-SEARCH-KEY.                    
           SET ACATMSD-MSD-READ TO TRUE.                                        
           PERFORM 7900-LINK-TO-ACATMSD.                                        
           IF ACATMSD-FOUND                                                     
              MOVE ACATMSD-DESC  TO DESC1-O (SUB) TWA-MAP-DESC1 (SUB)           
              MOVE ACATMSD-DESC2 TO DESC2-O (SUB) TWA-MAP-DESC2 (SUB)           
              MOVE ACATMSD-DESC3 TO DESC3-O (SUB) TWA-MAP-DESC3 (SUB)           
LRM003        MOVE ACATMSD-CUSIP TO ISIN-O  (SUB) TWA-MAP-ISIN  (SUB)           
           ELSE                                                                 
              MOVE SPACE TO DESC1-O (SUB)  TWA-MAP-DESC1 (SUB)                  
                            DESC2-O (SUB)  TWA-MAP-DESC2 (SUB)                  
                            DESC3-O (SUB)  TWA-MAP-DESC3 (SUB)                  
LRM003                      ISIN-O  (SUB)  TWA-MAP-ISIN  (SUB).                 
                                                                                
           MOVE SPACE TO WS-NO-MORE-BKR-DATA-SW.                                
LRM003**** MOVE TWA-MAP-CUSIP (SUB) TO ACAT31-PASS-SECURITY.                    
LRM003     MOVE TWA-MAP-ADP-NBR (SUB) TO ACAT31-PASS-SECURITY.                  
           PERFORM 0560-OPEN-BRKR-CURSOR-TBL.                                   
           PERFORM VARYING SUB2 FROM 1 BY 1                                     
                UNTIL WS-NO-MORE-BKR-DATA  OR  SUB2 > 14                        
              PERFORM 0570-FETCH-BRKR-CURSOR-TBL                                
              IF ACAT31-NORMAL                                                  
                 MOVE ACAT31-BKR-BROKER                                         
                   TO CBRKR-O        (SUB SUB2)                                 
                      TWA-MAP-CBRKR  (SUB SUB2)                                 
              END-IF                                                            
           END-PERFORM.                                                         
           PERFORM 0580-CLOSE-BRKR-CURSOR-TBL.                                  
                                                                                
           MOVE TWA-MAP-CONTRA (SUB) TO TWA-ORIG-CONTRA (SUB).                  
           MOVE SUB TO TWA-SEC-SCR-LINE.                                        
           IF SUB = 1                                                           
              MOVE WK-CLT              TO TWA-KEY-CLT-FIRST                     
                                          TWA-KEY-CLT-LAST                      
              MOVE TWA-MAP-CUSIP (SUB) TO TWA-KEY-SEC-FIRST                     
                                          TWA-KEY-SEC-LAST                      
           ELSE                                                                 
              MOVE WK-CLT              TO TWA-KEY-CLT-LAST                      
              MOVE TWA-MAP-CUSIP (SUB) TO TWA-KEY-SEC-LAST.                     
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *        DB2 ERROR MESSAGE ROUTINE                             *          
      *--------------------------------------------------------------*          
       0800-SEND-DB2-ERROR-MSG.                                                 
           MOVE -1 TO MNEXTL.                                                   
           SET WK-ERROR TO TRUE.                                                
           MOVE  ACAT31-SQLCODE   TO WK-ERR-SQLCODE.                            
           MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG.                                
           PERFORM 9000-ERROR-RTN.                                              
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *            AFTER FIRST-TIME                                  *          
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
LRM002               PERFORM 1900-SEND-POPUP-MAP-RTN                            
                WHEN EIBAID = DFHPF2                                            
                     PERFORM 3000-ADD-SECURITY-RTN                              
                WHEN EIBAID = DFHPF3                                            
                     PERFORM 3100-CANCEL-ADD-RTN                                
                WHEN EIBAID = DFHPA2                                            
                     PERFORM 6000-PREV-PAGE-RTN                                 
                WHEN EIBAID = DFHPA1                                            
                     PERFORM 6100-NEXT-PAGE-RTN                                 
                WHEN OTHER                                                      
                     SET  WK-ERROR  TO TRUE                                     
                     MOVE LOW-VALUE TO ACAT31MO                                 
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
      *            ENTER KEY ROUTINE                                 *          
      *--------------------------------------------------------------*          
       1000-ENTER-KEY.                                                          
           PERFORM 8500-RECEIVE-MAP.                                            
           MOVE SPACE  TO WK-ERROR-SW                                           
                          WK-MSG-ON-SW.                                         
           MOVE 0 TO SUB2 SUB3.                                                 
           IF TWA-UPDATE-MOD                                                    
              PERFORM 1050-VALIDATION-RTN VARYING SUB FROM 1 BY 1               
                 UNTIL  SUB > 3  OR  SUB > TWA-SEC-SCR-LINE                     
           ELSE                                                                 
           IF TWA-UPDATE-ADD                                                    
              PERFORM 1050-VALIDATION-RTN VARYING SUB FROM 1 BY 1               
                 UNTIL  SUB > 3                                                 
           END-IF.                                                              
           IF TWA-UPDATE-MOD                                                    
              IF NOT WK-ERROR                                                   
                 PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 3                  
                   IF TWA-MAP-SEC-CHG-IND (SUB) = 'Y'                           
                   OR TWA-MAP-BKR-CHG-IND (SUB) = 'Y'                           
                   OR TWA-MAP-ACTION (SUB) > SPACE                              
                      MOVE 4 TO SUB                                             
                      SET WK-MSG-ON TO TRUE                                     
                      MOVE 'PRESS PF5 TO CONFIRM MODIFICATION/DELETION'         
                        TO  SYSTEM-MSG                                          
                    END-IF                                                      
                 END-PERFORM                                                    
              END-IF                                                            
           ELSE                                                                 
           IF TWA-UPDATE-ADD                                                    
              IF NOT WK-ERROR                                                   
                 PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 3                  
                    IF TWA-MAP-CUSIP (SUB) > SPACE                              
                       MOVE 4 TO SUB                                            
                       SET WK-MSG-ON TO TRUE                                    
                       MOVE 'PRESS PF5 TO CONFIRM ADDITION'                     
                         TO  SYSTEM-MSG                                         
                    END-IF                                                      
                 END-PERFORM                                                    
              END-IF                                                            
           END-IF.                                                              
           PERFORM 1700-SEARCH-BY-SECURITY THRU 1700-EXIT.                      
           PERFORM 1800-NEXT-SELECTION-RTN.                                     
                                                                                
           IF EIBAID = DFHPF5                                                   
              IF NOT WK-ERROR                                                   
                 PERFORM 4000-UPDATE-RTN.                                       
           IF NOT WK-ERROR                                                      
              MOVE -1    TO MNEXTL                                              
              MOVE SPACE TO TRLMSGO.                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *            VALIDATE USER ENTRIES                               *        
      *----------------------------------------------------------------*        
       1050-VALIDATION-RTN.                                                     
           IF TWA-UPDATE-MOD                                                    
              PERFORM 1100-VALIDATE-ACTION-FLDS.                                
           IF TWA-UPDATE-ADD                                                    
              PERFORM 1200-VALIDATE-CUSIP-RTN.                                  
           IF TWA-UPDATE-MOD OR TWA-UPDATE-ADD                                  
              PERFORM 1250-VALIDATE-EXPDT-RTN                                   
              PERFORM 1300-VALIDATE-MEMO-RTN                                    
              PERFORM 1400-VALIDATE-TFR-TYPE                                    
              PERFORM 1500-VALIDATE-BROKERS                                     
                 VARYING SUB2 FROM 1 BY 1 UNTIL SUB2 > 14                       
              PERFORM 1580-MESSAGE-RTN.                                         
                                                                                
           IF TWA-UPDATE-MOD                                                    
              PERFORM 1600-CHECK-IF-ENTRY-CHANGED.                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *            VALIDATE ACTION FIELDS WHEN MODIFYING               *        
      *----------------------------------------------------------------*        
       1100-VALIDATE-ACTION-FLDS.                                               
           IF ACTION-L (SUB) > 0                                                
              IF ACTION-O (SUB) = TWA-MAP-ACTION (SUB)                          
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE ACTION-O (SUB) TO TWA-MAP-ACTION (SUB)                    
              END-IF                                                            
           ELSE                                                                 
           IF ACTION-A (SUB) = ERASE-KEY                                        
              MOVE SPACE TO TWA-MAP-ACTION (SUB).                               
           IF TWA-MAP-ACTION (SUB) = LOW-VALUE                                  
              MOVE SPACE TO TWA-MAP-ACTION (SUB).                               
           MOVE ATT-UNPROT TO ACTION-A (SUB).                                   
                                                                                
           IF TWA-MAP-ACTION (SUB) = SPACE                                      
              CONTINUE                                                          
           ELSE                                                                 
           IF TWA-MAP-ACTION (SUB) = 'D'                                        
              ADD +1 TO SUB3                                                    
              MOVE TWA-MAP-CUSIP (SUB) TO WS-DELETE-CUSIP (SUB3)                
           ELSE                                                                 
              MOVE ATT-UNPROT-BRT TO ACTION-A (SUB)                             
              MOVE -1 TO ACTION-L (SUB)                                         
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'ENTER "D" TO DELETE' TO SYSTEM-MSG                       
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *            VALIDATE CUSIP WHEN ADDING                          *        
      *----------------------------------------------------------------*        
      *  NOTE: IN CASE OF NO CUSIP NUMBER (UPON READING ACATMSD        *        
      *        MODULE, THE MODULE RETURNS NO CUSIP BUT ADP NUMBER),    *        
      *        ADP SECURITY NUMBER IS USED TO REPLACE THE CUSIP.       *        
      *----------------------------------------------------------------*        
       1200-VALIDATE-CUSIP-RTN.                                                 
           IF CUSIP-L (SUB) > 0                                                 
              IF CUSIP-O (SUB) = TWA-MAP-CUSIP (SUB)                            
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE CUSIP-O (SUB) TO TWA-MAP-CUSIP (SUB)                      
              END-IF                                                            
           ELSE                                                                 
           IF CUSIP-A (SUB) = ERASE-KEY                                         
              MOVE SPACE TO TWA-MAP-CUSIP (SUB).                                
           MOVE ATT-UNPROT TO CUSIP-A (SUB).                                    
                                                                                
           IF TWA-MAP-CUSIP (SUB) = SPACE                                       
               MOVE SPACE  TO ISIN-O (SUB) TWA-MAP-ISIN (SUB)                   
                              DESC1-O  (SUB) TWA-MAP-DESC1   (SUB)              
                              DESC2-O  (SUB) TWA-MAP-DESC2   (SUB)              
                              DESC3-O  (SUB) TWA-MAP-DESC3   (SUB).             
           IF TWA-MAP-CUSIP (SUB) > SPACE                                       
              MOVE TWA-MAP-CUSIP (SUB) TO ACATMSD-SEARCH-KEY                    
              SET ACATMSD-MSD-READ TO TRUE                                      
              PERFORM 7900-LINK-TO-ACATMSD                                      
              IF ACATMSD-FOUND                                                  
                 MOVE ACATMSD-ADP-NBR TO TWA-MAP-ADP-NBR (SUB)                  
                 IF ACATMSD-CUSIP (1:9) > SPACE                                 
                    MOVE ACATMSD-CUSIP                                          
                      TO ISIN-O (SUB) TWA-MAP-ISIN (SUB)                        
                 ELSE                                                           
                     MOVE SPACES                                                
                      TO ISIN-O (SUB) TWA-MAP-ISIN (SUB)                        
                 END-IF                                                         
                 PERFORM 4800-CHECK-IF-SEC-TBL-EXIST                            
                 IF ACAT31-FOUND                                                
                    MOVE ATT-UNPROT-BRT TO CUSIP-A (SUB)                        
                    MOVE -1 TO CUSIP-L (SUB)                                    
                    IF NOT WK-ERROR                                             
                       SET WK-ERROR TO TRUE                                     
                       MOVE 'ALREADY PROCESSED AS A RESTRICTED SECURITY'        
                         TO  SYSTEM-MSG                                         
                    END-IF                                                      
                 ELSE                                                           
                    MOVE ACATMSD-DESC    TO DESC1-O         (SUB)               
                                            TWA-MAP-DESC1   (SUB)               
                    MOVE ACATMSD-DESC2   TO DESC2-O         (SUB)               
                                            TWA-MAP-DESC2   (SUB)               
                    MOVE ACATMSD-DESC3   TO DESC3-O         (SUB)               
                                            TWA-MAP-DESC3   (SUB)               
                 END-IF                                                         
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO CUSIP-A (SUB)                           
                 MOVE -1 TO CUSIP-L (SUB)                                       
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE '"SEC/CUS/SYM" NOT FOUND IN MSD'                       
                      TO SYSTEM-MSG                                             
                 END-IF.                                                        
       EJECT                                                                    
      *                                                                         
LRM002*----------------------------------------------------------------*        
LRM002*            VALIDATE EXPIRATION DATE (OPTIONAL FIELD)           *        
LRM002*----------------------------------------------------------------*        
LRM002 1250-VALIDATE-EXPDT-RTN.                                                 
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
LRM002     IF TWA-MAP-EXPDT (SUB) = SPACES                                      
LRM002        CONTINUE                                                          
LRM002     ELSE                                                                 
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
LRM002        IF NOT WK-ERROR                                                   
LRM002           SET WK-ERROR TO TRUE                                           
LRM002           IF NOT WK-ERROR                                                
LRM002              SET WK-ERROR TO TRUE                                        
LRM002              MOVE 'EXPIRE DATE MM/DD/YY NOT VALID' TO SYSTEM-MSG         
LRM002           END-IF.                                                        
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *            VALIDATE MEMO                                       *        
      *----------------------------------------------------------------*        
       1300-VALIDATE-MEMO-RTN.                                                  
           IF MEMO-L (SUB) > 0                                                  
              IF MEMO-O (SUB) = TWA-MAP-MEMO (SUB)                              
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MEMO-O (SUB) TO TWA-MAP-MEMO (SUB)                        
              END-IF                                                            
           ELSE                                                                 
           IF MEMO-A (SUB) = ERASE-KEY                                          
              MOVE SPACE TO TWA-MAP-MEMO (SUB).                                 
           MOVE ATT-UNPROT TO MEMO-A (SUB).                                     
                                                                                
           IF TWA-MAP-CUSIP (SUB) = SPACE                                       
              IF TWA-MAP-MEMO (SUB) = SPACE                                     
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE -1 TO CUSIP-L (SUB)                                       
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'ENTER "SEC/CUS/SYM"' TO SYSTEM-MSG                    
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              IF TWA-MAP-MEMO (SUB) = SPACE                                     
                 MOVE ATT-UNPROT-BRT TO MEMO-A (SUB)                            
                 MOVE -1 TO MEMO-L (SUB)                                        
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'ENTER "Y" OR "N" FOR MEMO PROCESS'                    
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              ELSE                                                              
              IF TWA-MAP-MEMO (SUB) = 'Y' OR 'N'                                
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO MEMO-A (SUB)                            
                 MOVE -1 TO MEMO-L (SUB)                                        
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'ENTER "Y" TO SEND MEMO ONLY OR "N" TO EXCLUDE         
      -                  'FROM MEMO PROCESS'                                    
                      TO  SYSTEM-MSG                                            
                 END-IF.                                                        
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *            VALIDATE TRANSFER BROKER TYPE                       *        
      *----------------------------------------------------------------*        
       1400-VALIDATE-TFR-TYPE.                                                  
           IF TYPE-L (SUB) > 0                                                  
              IF TYPE-O (SUB) = TWA-MAP-TYPE (SUB)                              
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE TYPE-O (SUB) TO TWA-MAP-TYPE (SUB)                        
              END-IF                                                            
           ELSE                                                                 
           IF TYPE-A (SUB) = ERASE-KEY                                          
              MOVE SPACE TO TWA-MAP-TYPE (SUB).                                 
           MOVE ATT-UNPROT TO TYPE-A (SUB).                                     
                                                                                
           IF TWA-MAP-CUSIP (SUB) = SPACE                                       
              IF TWA-MAP-TYPE (SUB) = SPACE                                     
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE -1 TO CUSIP-L (SUB)                                       
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'ENTER "SEC/CUS/SYM"' TO SYSTEM-MSG                    
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              IF TWA-MAP-TYPE (SUB) = SPACE                                     
                 MOVE -1 TO TYPE-L (SUB)                                        
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'ENTER "DLV", "RCV" OR "BOTH" FOR THE TRANSFER         
      -                  'BROKER TYPE'                                          
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              ELSE                                                              
              IF TWA-MAP-TYPE (SUB) = 'DLV' OR 'RCV' OR 'BOTH'                  
                  CONTINUE                                                      
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO TYPE-A (SUB)                            
                 MOVE -1 TO TYPE-L (SUB)                                        
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'ENTER "RCV", "DLV", OR "BOTH" FOR RECEIVER, DE        
      -                  'LIVERER OR FOR BOTH'                                  
                      TO  SYSTEM-MSG                                            
                 END-IF.                                                        
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *            VALIDATE CONTRA BROKER NUMBERS                      *        
      *----------------------------------------------------------------*        
       1500-VALIDATE-BROKERS.                                                   
           IF CBRKR-L (SUB SUB2) > 0                                            
              IF CBRKR-O (SUB SUB2) = TWA-MAP-CBRKR (SUB SUB2)                  
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE CBRKR-O (SUB SUB2) TO TWA-MAP-CBRKR (SUB SUB2)            
              END-IF                                                            
           ELSE                                                                 
           IF CBRKR-A (SUB SUB2) = ERASE-KEY                                    
              MOVE SPACE TO TWA-MAP-CBRKR (SUB SUB2).                           
           MOVE ATT-UNPROT TO CBRKR-A (SUB SUB2).                               
                                                                                
           IF TWA-MAP-CUSIP (SUB) = SPACE                                       
              IF TWA-MAP-CBRKR (SUB SUB2) = SPACE                               
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE -1 TO CUSIP-L (SUB)                                       
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'ENTER "SEC/CUS/SYM"' TO SYSTEM-MSG                    
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
           IF TWA-MAP-CBRKR (SUB SUB2) > SPACE                                  
              MOVE TWA-MAP-CBRKR (SUB SUB2) TO ACATPPIO-BRKR                    
              SET ACATPPIO-READ TO TRUE                                         
              PERFORM 7700-LINK-TO-ACATPPIO                                     
              IF NOT ACATPPIO-FOUND                                             
                 MOVE ATT-UNPROT-BRT TO CBRKR-A (SUB SUB2)                      
                 MOVE -1 TO CBRKR-L (SUB SUB2)                                  
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'INVALID BROKER NUMBER' TO SYSTEM-MSG                  
                 END-IF                                                         
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *            CHECK MESSAGE FIELD                                 *        
      *----------------------------------------------------------------*        
       1580-MESSAGE-RTN.                                                        
           IF RSTMSG-L (SUB) > 0                                                
              IF RSTMSG-O (SUB) = TWA-MAP-RSTMSG (SUB)                          
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE RSTMSG-O (SUB) TO TWA-MAP-RSTMSG (SUB)                    
              END-IF                                                            
           ELSE                                                                 
           IF RSTMSG-A (SUB) = ERASE-KEY                                        
              MOVE SPACE TO TWA-MAP-RSTMSG (SUB).                               
           IF TWA-MAP-RSTMSG (SUB) = LOW-VALUE                                  
              MOVE SPACE TO TWA-MAP-RSTMSG (SUB).                               
           MOVE ATT-UNPROT TO RSTMSG-A (SUB).                                   
                                                                                
           IF TWA-MAP-CUSIP (SUB) = SPACE                                       
              IF TWA-MAP-RSTMSG (SUB) > SPACE                                   
                 MOVE -1 TO CUSIP-L (SUB)                                       
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'ENTER "SEC/CUS/SYM"' TO SYSTEM-MSG                    
                 END-IF.                                                        
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    CHECK IF USER MODIFIED ANY FIELD IN ORDER TO DETERMINE      *        
      *    WHETHER TO UPDATE ANY DATABASE (RESTRICTED SECURITY TABLE,  *        
      *    RESTRICTED BROKER TABLE, OR BOTH).                          *        
      *----------------------------------------------------------------*        
       1600-CHECK-IF-ENTRY-CHANGED.                                             
           MOVE SPACE TO TWA-MAP-SEC-CHG-IND (SUB)                              
                         TWA-MAP-BKR-CHG-IND (SUB)                              
                                                                                
           IF (TWA-MAP-MEMO   (SUB) NOT = TWA-ORIG-MEMO   (SUB)) OR             
              (TWA-MAP-TYPE   (SUB) NOT = TWA-ORIG-TYPE   (SUB)) OR             
              (TWA-MAP-RSTMSG (SUB) NOT = TWA-ORIG-RSTMSG (SUB)) OR             
LRM002********(TWA-MAP-COMMENT (SUB) NOT = TWA-ORIG-COMMENT (SUB)) OR           
LRM002        (TWA-MAP-EXPDT  (SUB) NOT = TWA-ORIG-EXPDT  (SUB))                
                 MOVE 'Y'  TO  TWA-MAP-SEC-CHG-IND (SUB)                        
           END-IF.                                                              
           PERFORM VARYING  SUB2 FROM 1 BY 1  UNTIL SUB2 > 14                   
              IF TWA-MAP-CBRKR  (SUB SUB2 )                                     
                 NOT = TWA-ORIG-CBRKR (SUB SUB2 )                               
                    MOVE 'Y'  TO  TWA-MAP-BKR-CHG-IND (SUB)                     
                    MOVE 15   TO  SUB2                                          
              END-IF                                                            
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    SECURITY FIELD AT MAP LINE 21 IS USED AS THE ONLY SEARCH    *        
      *    ENGINE FOR THIS SCREEN.                                     *        
      *----------------------------------------------------------------*        
       1700-SEARCH-BY-SECURITY.                                                 
           IF TWA-UPDATE-ADD                                                    
              GO TO 1700-EXIT.                                                  
                                                                                
           IF MSECL > 0                                                         
              IF MSECI = TWA-MAP-SEC                                            
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MSECI TO TWA-MAP-SEC                                      
              END-IF                                                            
           ELSE                                                                 
              IF MSECA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-SEC                                     
              END-IF.                                                           
           MOVE ATT-UNPROT TO MSECA.                                            
                                                                                
           IF TWA-MAP-SEC = TWA-PREV-MAP-SEC                                    
              IF TWA-SEC-SEARCH-ERR                                             
                 MOVE ATT-UNPROT-BRT TO MSECA                                   
                 MOVE -1 TO MSECL                                               
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'SECURITY SEARCH ERROR'                                
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              MOVE TWA-MAP-SEC TO WS-SECURITY                                   
              INITIALIZE TWA-ACAT-AREA                                          
              MOVE SPACE       TO WK-ERROR-SW WK-MSG-ON-SW SYSTEM-MSG           
              MOVE WS-SECURITY TO TWA-MAP-SEC                                   
                                  TWA-PREV-MAP-SEC                              
              PERFORM 2000-ATTRIB-TO-ASKIP                                      
              PERFORM 2010-CLEAR-SCR                                            
              PERFORM 2020-CLEAR-SRCH-FIELDS                                    
              IF TWA-MAP-SEC = SPACE                                            
                 PERFORM 0400-REFRESH-WITH-NEW-SECUR                            
              ELSE                                                              
                 PERFORM 1710-SECURITY-SEARCH                                   
              END-IF.                                                           
       1700-EXIT.                                              EXIT.            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *  SEARCH BY SECURITY.                                           *        
      *  IF FOUND, DISPLAY THE DATA, OTHERWISE DISPLAY 'NOT FOUND' MSG *        
      *----------------------------------------------------------------*        
       1710-SECURITY-SEARCH.                                                    
           MOVE TWA-MAP-SEC TO ACATMSD-SEARCH-KEY.                              
           SET ACATMSD-MSD-READ TO TRUE.                                        
           PERFORM 7900-LINK-TO-ACATMSD.                                        
           IF ACATMSD-FOUND                                                     
LRM003        MOVE ACATMSD-ADP-NBR  TO ACAT31-PASS-ADP-NBR                      
LRM003                                 ACAT31-PASS-SECURITY.                    
LRM003*****   IF ACATMSD-CUSIP (1:9) > SPACE                                    
LRM003*****      MOVE ACATMSD-CUSIP    TO ACAT31-PASS-SECURITY                  
LRM003*****   ELSE                                                              
LRM003*****      MOVE SPACES           TO WS-ADPSEC-EDITED                      
LRM003*****      MOVE 'XX'             TO WS-XX-ADPSEC                          
LRM003*****      MOVE ACATMSD-ADP-NBR  TO WS-ADPSEC                             
LRM003*****      MOVE WS-ADPSEC-EDITED TO ACAT31-PASS-SECURITY                  
LRM003*****   END-IF                                                            
LRM003*****ELSE                                                                 
LRM003*****   MOVE TWA-MAP-SEC    TO ACAT31-PASS-SECURITY.                      
           SET ACAT31-FND-SECURITY TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-FOUND                                                      
              MOVE SPACE TO TWA-SEC-SEARCH-ERR-SW                               
              MOVE 1 TO SUB                                                     
              PERFORM 0700-SETUP-SCREEN                                         
              MOVE SPACE TO TWA-MAP-KEY-FIRST                                   
                            TWA-MAP-KEY-LAST                                    
           ELSE                                                                 
           IF ACAT31-NOT-FOUND                                                  
              SET TWA-SEC-SEARCH-ERR TO TRUE                                    
              MOVE ATT-UNPROT-BRT TO MSECA                                      
              MOVE -1 TO MSECL                                                  
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'NO RESTRICTED SECURITY FOUND FOR THIS REQUEST'           
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           ELSE                                                                 
LRM001        MOVE                                                              
LRM001        'DB2 READ ERROR ON REST SECURITY TABLE - CALL HELP DESK'          
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *              JUMP TO NEXT SELECTION                            *        
      *----------------------------------------------------------------*        
       1800-NEXT-SELECTION-RTN.                                                 
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
           IF TWA-MAP-NEXT = 'X'                                                
              MOVE SPACE TO MNEXTO                                              
                            TWA-MAP-NEXT.                                       
      *                                                                         
           IF TWA-MAP-NEXT = SPACE                                              
              IF NOT TWA-SEC-SEARCH-ERR                                         
                 PERFORM 1810-NEXT-SEL-SPACE-RTN                                
              END-IF                                                            
           ELSE                                                                 
              MOVE TWA-MAP-NEXT TO ACAT-INP-SEL                                 
              PERFORM 1820-NEXT-SEL-ENTERED-RTN.                                
                                                                                
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      * - NEXT SELECTION WAS NOT ENTERED                               *        
      * - NONE OF THE SEARCH ENGINE FIELDS ARE APPLICABLE FOR THIS SCR *        
      *----------------------------------------------------------------*        
       1810-NEXT-SEL-SPACE-RTN.                                                 
           MOVE  'X'   TO  ACAT-INP-SEL.                                        
           IF TWA-MAP-SEARCH > SPACE                                            
              PERFORM 1840-VALIDATE-SRCH-ENGINE                                 
              INITIALIZE TWA-MAP-AREA                                           
                         TWA-MAP-SAVE-AREA                                      
                         TWA-MAP-KEY-AREA                                       
      ***     MOVE SPACE TO WK-ERROR-SW WK-MSG-ON-SW                            
              PERFORM 2000-ATTRIB-TO-ASKIP                                      
              PERFORM 2010-CLEAR-SCR                                            
           ELSE                                                                 
           IF TWA-UPDATE-IND = SPACE                                            
              MOVE SPACE TO WS-DELETE-CUSIP-TBL                                 
              MOVE ZERO  TO TWA-SEC-SCR-LINE                                    
              PERFORM 0400-REFRESH-WITH-NEW-SECUR.                              
      *                                                                         
      *----------------------------------------------------------------*        
      *           NEXT SELECTION WAS ENTERED                           *        
      *----------------------------------------------------------------*        
       1820-NEXT-SEL-ENTERED-RTN.                                               
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
              MOVE 'ACAT31RS'    TO ACAT-CALLING-PROG-NAME                      
              MOVE  TWA-MAP-NEXT TO ACAT-NEXT                                   
              PERFORM 7500-XCTL-TO-DETAIL-PROG.                                 
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *           VALIDATE THE SEARCH ENGINED                          *        
      *----------------------------------------------------------------*        
       1840-VALIDATE-SRCH-ENGINE.                                               
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
LRM002*----------------------------------------------------------------*        
LRM002*             POP-UP SCREEN ROUTINE                              *        
LRM002*----------------------------------------------------------------*        
LRM002 1900-SEND-POPUP-MAP-RTN.                                                 
LRM002     IF EIBCPOSN >= 240 AND < 640                                         
LRM002        MOVE 1 TO TWA-CMNT-SUB                                            
LRM002     ELSE                                                                 
LRM002     IF EIBCPOSN >= 720 AND < 1120                                        
LRM002        MOVE 2 TO TWA-CMNT-SUB                                            
LRM002     ELSE                                                                 
LRM002     IF EIBCPOSN >= 1200 AND < 1600                                       
LRM002        MOVE 3 TO TWA-CMNT-SUB                                            
LRM002     ELSE                                                                 
LRM002        SET WK-ERROR TO TRUE                                              
LRM002        MOVE 'INVALID CURSOR POSITION' TO SYSTEM-MSG                      
LRM002        PERFORM 9000-ERROR-RTN                                            
LRM002     END-IF.                                                              
                                                                                
LRM002     MOVE SPACES TO ACAT90CM-TS-AREA                                      
LRM002     MOVE TWA-MAP-COMMENT (TWA-CMNT-SUB)                                  
LRM002                         TO ACAT90CM-TS-MCCMNT-X120                       
LRM002     MOVE TWA-MAP-DESC1 (TWA-CMNT-SUB) TO ACAT90CM-TS-MNAME               
LRM002     MOVE 'A' TO ACAT90CM-TS-SCREEN                                       
LRM002     MOVE 'R' TO ACAT90CM-TS-MSUBM                                        
LRM002     PERFORM 7020-WRITE-TSQ-RTN.                                          
LRM002     PERFORM 1910-ACAT90CM-TS-RTN.                                        
LRM002     MOVE 'X' TO ACAT-INP-SEL.                                            
LRM002     MOVE '$' TO WS-ACAT-NEXT.                                            
LRM002     MOVE 'ACAT90CM' TO CALLED-PROGRAM-NAME.                              
LRM002     PERFORM 7500-XCTL-TO-DETAIL-PROG.                                    
LRM002*----------------------------------------------------------------*        
LRM002*       PASS PARMS TO ACAT90CM POP-UP SCREEN PROGRAM             *        
LRM002*----------------------------------------------------------------*        
LRM002 1910-ACAT90CM-TS-RTN.                                                    
LRM002     MOVE 'ACA$'   TO TRAN-ID.                                            
LRM002     EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                                 
LRM002     END-EXEC.                                                            
LRM002                                                                          
LRM002     IF TWA-UPDATE-MOD                                                    
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
              MOVE LOW-VALUE TO ACAT31MO                                        
              MOVE 'ACAT13 WRITE TSQ ERROR ON ACA$'                             
                TO SYSTEM-MSG                                                   
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *             SET ALL SCREEN ATTRIBUTES TO ASKIP                 *        
      *----------------------------------------------------------------*        
       2000-ATTRIB-TO-ASKIP.                                                    
           PERFORM VARYING SUB FROM 1 BY 1   UNTIL SUB > 3                      
               MOVE ATT-ASKIP TO ACTION-A (SUB)                                 
                                 CUSIP-A  (SUB)                                 
                                 DESC1-A  (SUB)                                 
                                 MEMO-A   (SUB)                                 
LRM002                           EXPDT-A  (SUB)                                 
                                 TYPE-A   (SUB)                                 
                                 ISIN-A   (SUB)                                 
                                 DESC2-A  (SUB)                                 
                                 DESC3-A  (SUB)                                 
                                 RSTMSG-A (SUB)                                 
               PERFORM VARYING SUB2 FROM 1 BY 1 UNTIL SUB2 > 14                 
                  MOVE ATT-ASKIP TO CBRKR-A (SUB SUB2)                          
               END-PERFORM                                                      
           END-PERFORM.                                                         
      ***  MOVE ATT-ASKIP TO MSECA.                                             
      *                                                                         
      *----------------------------------------------------------------*        
      *             CLEAR SCREEN WITH SPACES                           *        
      *----------------------------------------------------------------*        
       2010-CLEAR-SCR.                                                          
           PERFORM VARYING SUB FROM 1 BY 1   UNTIL SUB > 3                      
              MOVE SPACE     TO ACTION-O (SUB)                                  
                                CUSIP-O  (SUB)                                  
                                DESC1-O  (SUB)                                  
                                MEMO-O   (SUB)                                  
LRM002                          EXPDT-O  (SUB)                                  
LRM002                          CRTDT-O  (SUB)                                  
LRM002                          CMNT-O   (SUB)                                  
                                TYPE-O   (SUB)                                  
                                ISIN-O   (SUB)                                  
                                DESC2-O  (SUB)                                  
                                DESC3-O  (SUB)                                  
                                RSTMSG-O (SUB)                                  
              PERFORM VARYING SUB2 FROM 1 BY 1 UNTIL SUB2 > 14                  
                 MOVE SPACE      TO CBRKR-O  (SUB SUB2)                         
              END-PERFORM                                                       
           END-PERFORM.                                                         
           MOVE SPACE TO MNEXTO.                                                
           IF WS-LINE-DELETED                                                   
              MOVE SPACE TO MSECO                                               
           END-IF.                                                              
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
           INITIALIZE TWA-ACAT-AREA.                                            
           SET TWA-UPDATE-ADD TO TRUE.                                          
           PERFORM 2010-CLEAR-SCR.                                              
           MOVE SPACE TO MSECO.                                                 
           PERFORM 2020-CLEAR-SRCH-FIELDS.                                      
           PERFORM VARYING SUB FROM 1 BY 1 UNTIL SUB > 3                        
              MOVE ATT-ASKIP  TO ACTION-A (SUB)                                 
              MOVE ATT-UNPROT TO CUSIP-A  (SUB)                                 
                                 MEMO-A   (SUB)                                 
LRM002                           EXPDT-A  (SUB)                                 
                                 TYPE-A   (SUB)                                 
                                 RSTMSG-A (SUB)                                 
              PERFORM VARYING SUB2 FROM 1 BY 1 UNTIL SUB2 > 14                  
                  MOVE ATT-UNPROT TO CBRKR-A (SUB SUB2)                         
              END-PERFORM                                                       
           END-PERFORM.                                                         
           MOVE ATT-ASKIP TO MSECA.                                             
           MOVE -1 TO CUSIP-L (1).                                              
           SET WK-MSG-ON TO TRUE.                                               
           MOVE 'ENTER SEC/CUS/SYM' TO SYSTEM-MSG.                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *         PF3: CANCEL ADDING A RESTRICTED SECURITY               *        
      *----------------------------------------------------------------*        
       3100-CANCEL-ADD-RTN.                                                     
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           IF NOT TWA-UPDATE-ADD                                                
              SET WK-ERROR TO TRUE                                              
              MOVE LOW-VALUE TO ACAT31MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'PF3 KEY CURRENTLY DISABLED'                                 
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
           INITIALIZE TWA-ACAT-AREA.                                            
           PERFORM 2000-ATTRIB-TO-ASKIP.                                        
           PERFORM 2010-CLEAR-SCR.                                              
           PERFORM 0400-REFRESH-WITH-NEW-SECUR.                                 
           MOVE -1 TO MNEXTL.                                                   
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *         PF5: UPDATE RESTRICTED SECURITY AND BROKER TABLES      *        
      *----------------------------------------------------------------*        
       4000-UPDATE-RTN.                                                         
DJ0001     IF NOT ACAT-SIGN-ON-UPDATE                                           
DJ0001        PERFORM 2000-ATTRIB-TO-ASKIP                                      
DJ0001        MOVE -1 TO MNEXTL                                                 
DJ0001        SET WK-ERROR TO TRUE                                              
DJ0001        MOVE 'UNAUTHORIZED TO UPDATE'                                     
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
              MOVE SPACE TO WS-LINE-DELETED-SW                                  
              PERFORM 4500-MODIFY-RTN   VARYING SUB FROM 1 BY 1                 
                 UNTIL SUB > 3 OR SUB > TWA-SEC-SCR-LINE                        
              IF WS-LINE-DELETED                                                
                 PERFORM 5000-RESET-SCR-DISPLAY                                 
              END-IF                                                            
           ELSE                                                                 
           IF TWA-UPDATE-ADD                                                    
              IF TWA-MAP-AREA = SPACE                                           
                 SET WK-ERROR TO TRUE                                           
                 MOVE -1 TO CUSIP-L (1)                                         
                 MOVE 'UPDATE NOT ALLOWED - NO DATA ENTERED'                    
                   TO  SYSTEM-MSG                                               
              ELSE                                                              
                 PERFORM 4600-ADD-RTN THRU 4600-EXIT                            
                    VARYING  SUB FROM 1 BY 1  UNTIL SUB > 3                     
                 PERFORM 3000-ADD-SECURITY-RTN                                  
                 MOVE -1 TO CUSIP-L (1)                                         
                 MOVE 'UPDATE COMPLETED SUCCESSFULLY - ENTER SEC/CUUS/SY        
      -               'M'                                                       
                 TO   SYSTEM-MSG                                                
              END-IF.                                                           
                                                                                
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          MODIFY/DELETE RESTRICTED SECURITIES                  *         
      *---------------------------------------------------------------*         
       4500-MODIFY-RTN.                                                         
           IF TWA-MAP-ACTION (SUB) = 'D'                                        
              PERFORM 4510-DELETE-SECUIRTY THRU 4510-EXIT                       
              SET WK-MSG-ON TO TRUE                                             
              MOVE 'UPDATE COMPLETED SUCESSFULLY'                               
                TO  SYSTEM-MSG                                                  
           ELSE                                                                 
           IF TWA-MAP-SEC-CHG-IND (SUB) = 'Y'  OR                               
              TWA-MAP-BKR-CHG-IND (SUB) = 'Y'                                   
                 PERFORM 4540-MODIFY-SECURITY THRU 4540-EXIT                    
                 SET WK-MSG-ON TO TRUE                                          
                 MOVE 'UPDATE COMPLETED SUCESSFULLY'                            
                   TO  SYSTEM-MSG.                                              
                                                                                
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           DELETE RESTRICTED BROKERS FIRST,                    *         
      *           THEN  DELETE RESTRICTED SECURITY                    *         
      *---------------------------------------------------------------*         
       4510-DELETE-SECUIRTY.                                                    
           PERFORM 4800-CHECK-IF-SEC-TBL-EXIST.                                 
           IF ACAT31-NOT-FOUND                                                  
              MOVE ATT-UNPROT-BRT TO ACTION-A (SUB)                             
              MOVE -1 TO ACTION-L (SUB)                                         
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'UPDATE FAILED - SECURITY ALREADY DELETED BY SYSTE        
      -               'EM OR BY OTHER USER'                                     
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
              GO TO 4510-EXIT                                                   
           END-IF.                                                              
                                                                                
           PERFORM 4810-CHECK-IF-BKR-TBL-EXIST.                                 
           IF ACAT31-FOUND                                                      
              SET ACAT31-DEL-BROKER   TO TRUE                                   
              PERFORM 7600-LINK-TO-ACAT31DB                                     
              IF ACAT31-ERROR                                                   
LRM001           MOVE                                                           
LRM001           'DB2 DELETE ERROR ON BROKER TABLE - CALL HELP DESK'            
                   TO  WK-DB2-ERROR                                             
                 PERFORM 0800-SEND-DB2-ERROR-MSG.                               
                                                                                
LRM003**** MOVE TWA-MAP-CUSIP (SUB)  TO ACAT31-PASS-SECURITY.                   
LRM003     MOVE TWA-MAP-ADP-NBR (SUB) TO ACAT31-PASS-SECURITY.                  
           SET ACAT31-DEL-SECURITY TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-NORMAL                                                     
              SET WS-LINE-DELETED TO TRUE                                       
           ELSE                                                                 
           IF ACAT31-ERROR                                                      
LRM001        MOVE 'DB2 DELETE ERROR ON SECURITY TABLE - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
                                                                                
           SET ACAT31-CNT-ASSET TO TRUE.                                        
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-ERROR                                                      
LRM001        MOVE 'DB2 COUNT ERROR ON ASSET TABLE - CALL HELP DESK'            
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG                                   
           ELSE                                                                 
           IF ACAT31-FOUND                                                      
              MOVE 'N'  TO ACAT31-PASS-RESTRICTED-IND                           
              SET ACAT31-UPD-ASSET TO TRUE                                      
              PERFORM 7600-LINK-TO-ACAT31DB                                     
              IF ACAT31-ERROR                                                   
LRM001           MOVE 'DB2 UPDATE ERROR ON ASSET TABLE - CALL HELP DESK'        
                   TO  WK-DB2-ERROR                                             
                 PERFORM 0800-SEND-DB2-ERROR-MSG                                
              END-IF.                                                           
       4510-EXIT.                                          EXIT.                
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *   MODIFY SECURITY AND BROKER TABLES.                          *         
      *   BROKER TABLE ROWS ARE FIRST DELETED AND THEN INSERTED.      *         
      *---------------------------------------------------------------*         
       4540-MODIFY-SECURITY.                                                    
LRM003*****MOVE TWA-MAP-CUSIP   (SUB)  TO ACAT31-PASS-SECURITY.                 
LRM003     MOVE TWA-MAP-ADP-NBR (SUB)  TO ACAT31-PASS-SECURITY.                 
           MOVE TWA-MAP-MEMO    (SUB)  TO ACAT31-PASS-MEMO.                     
           MOVE TWA-MAP-RSTMSG  (SUB)  TO ACAT31-PASS-MSG.                      
           MOVE TWA-MAP-ADP-NBR (SUB)  TO ACAT31-PASS-ADP-NBR.                  
           MOVE EIBTRMID               TO ACAT31-PASS-TERMID.                   
           IF TWA-MAP-TYPE (SUB) = 'DLV'                                        
              MOVE 'D' TO ACAT31-PASS-TYPE                                      
           ELSE                                                                 
           IF TWA-MAP-TYPE (SUB) = 'RCV'                                        
              MOVE 'R' TO ACAT31-PASS-TYPE                                      
           ELSE                                                                 
           IF TWA-MAP-TYPE (SUB) = 'BOTH'                                       
              MOVE 'B' TO ACAT31-PASS-TYPE.                                     
LRM002     IF TWA-MAP-EXPDT (SUB) NOT GREATER SPACES                            
LRM002        MOVE '0001-01-01'           TO ACAT31-PASS-EXPDT                  
LRM002     ELSE                                                                 
LRM002        MOVE TWA-MAP-EXPDT-MM (SUB) TO ACAT31-PASS-EXPDT-MM               
LRM002        MOVE TWA-MAP-EXPDT-DD (SUB) TO ACAT31-PASS-EXPDT-DD               
LRM002        MOVE TWA-MAP-EXPDT-YY (SUB) TO ACAT31-PASS-EXPDT-YY               
LRM002        MOVE '20'                   TO ACAT31-PASS-EXPDT-CC               
LRM002        MOVE '-'                    TO ACAT31-PASS-EXPDT-S1               
LRM002                                       ACAT31-PASS-EXPDT-S2               
LRM002     END-IF.                                                              
LRM002     MOVE TWA-MAP-COMMENT (SUB) TO ACAT31-PASS-COMMENT.                   
LRM002     MOVE ACAT-SIGN-ON-ID      TO ACAT31-SIGN-ON-ID.                      
LRM002     MOVE ACAT-CICS-NETNAME    TO ACAT31-NET-NAME.                        
LRM002     MOVE ACAT-CICS-USER-ID    TO ACAT31-USER-ID.                         
LRM002     MOVE ACAT-CICS-USER-NAME  TO ACAT31-USER-NAME.                       
           PERFORM 4800-CHECK-IF-SEC-TBL-EXIST.                                 
           IF ACAT31-NOT-FOUND                                                  
              MOVE -1 TO ACTION-L (SUB)                                         
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'UPDATE FAILED - SECURITY ALREADY DELETED BY SYSTE        
      -               'EM OR BY OTHER USER'                                     
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
              GO TO 4540-EXIT.                                                  
                                                                                
           IF TWA-MAP-SEC-CHG-IND (SUB) = 'Y'                                   
              MOVE TWA-MAP-MEMO (SUB)   TO TWA-ORIG-MEMO (SUB)                  
              MOVE TWA-MAP-TYPE (SUB)   TO TWA-ORIG-TYPE (SUB)                  
              MOVE TWA-MAP-RSTMSG (SUB) TO TWA-ORIG-RSTMSG (SUB)                
LRM002        MOVE TWA-MAP-EXPDT (SUB)  TO TWA-ORIG-EXPDT (SUB)                 
LRM002********MOVE TWA-MAP-COMMENT (SUB) TO TWA-ORIG-COMMENT (SUB)              
              SET ACAT31-UPD-SECURITY   TO TRUE                                 
              PERFORM 7600-LINK-TO-ACAT31DB                                     
              IF ACAT31-ERROR                                                   
LRM001           MOVE                                                           
LRM001           'DB2 UPDATE ERROR ON SECURITY TABLE - CALL HELP DESK'          
                   TO  WK-DB2-ERROR                                             
                 PERFORM 0800-SEND-DB2-ERROR-MSG.                               
                                                                                
           IF TWA-MAP-BKR-CHG-IND (SUB) = 'Y'                                   
              MOVE TWA-MAP-CONTRA (SUB) TO TWA-ORIG-CONTRA (SUB)                
              PERFORM 4810-CHECK-IF-BKR-TBL-EXIST                               
              IF ACAT31-FOUND                                                   
                 SET ACAT31-DEL-BROKER   TO TRUE                                
                 PERFORM 7600-LINK-TO-ACAT31DB                                  
                 IF ACAT31-ERROR                                                
LRM001              MOVE                                                        
LRM001              'DB2 DELETE ERROR ON BROKER TABLE - CALL HELP DESK'         
                      TO  WK-DB2-ERROR                                          
                    PERFORM 0800-SEND-DB2-ERROR-MSG                             
                 END-IF                                                         
                 IF TWA-MAP-CONTRA (SUB) > SPACE                                
                    PERFORM 4700-CREATE-BROKER-TBL                              
                        VARYING SUB2 FROM 1 BY 1 UNTIL SUB2 > 14                
                 END-IF                                                         
              ELSE                                                              
              IF ACAT31-NOT-FOUND                                               
                 IF TWA-MAP-CONTRA (SUB) > SPACE                                
                    PERFORM 4700-CREATE-BROKER-TBL                              
                        VARYING SUB2 FROM 1 BY 1 UNTIL SUB2 > 14                
                 END-IF.                                                        
                                                                                
       4540-EXIT.                                              EXIT.            
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *    CREATE NEW RESTRICTED SECURITY ALONG WITH BROKERS          *         
      *---------------------------------------------------------------*         
       4600-ADD-RTN.                                                            
           IF TWA-MAP-CUSIP (SUB) = SPACE                                       
              GO TO 4600-EXIT.                                                  
                                                                                
LRM003**** MOVE TWA-MAP-CUSIP   (SUB) TO ACAT31-PASS-SECURITY.                  
LRM003     MOVE TWA-MAP-ADP-NBR (SUB) TO ACAT31-PASS-SECURITY.                  
           MOVE TWA-MAP-MEMO    (SUB) TO ACAT31-PASS-MEMO.                      
           MOVE TWA-MAP-RSTMSG  (SUB) TO ACAT31-PASS-MSG.                       
           MOVE TWA-MAP-ADP-NBR (SUB) TO ACAT31-PASS-ADP-NBR.                   
LRM002     IF TWA-MAP-EXPDT (SUB) NOT GREATER SPACES                            
LRM002        MOVE '0001-01-01'           TO ACAT31-PASS-EXPDT                  
LRM002     ELSE                                                                 
LRM002        MOVE TWA-MAP-EXPDT-MM (SUB) TO ACAT31-PASS-EXPDT-MM               
LRM002        MOVE TWA-MAP-EXPDT-DD (SUB) TO ACAT31-PASS-EXPDT-DD               
LRM002        MOVE TWA-MAP-EXPDT-YY (SUB) TO ACAT31-PASS-EXPDT-YY               
LRM002        MOVE '20'                   TO ACAT31-PASS-EXPDT-CC               
LRM002        MOVE '-'                    TO ACAT31-PASS-EXPDT-S1               
LRM002                                       ACAT31-PASS-EXPDT-S2               
LRM002     END-IF.                                                              
LRM002     MOVE TWA-MAP-COMMENT (SUB) TO ACAT31-PASS-COMMENT.                   
LRM002     MOVE ACAT-SIGN-ON-ID      TO ACAT31-SIGN-ON-ID.                      
LRM002     MOVE ACAT-CICS-NETNAME    TO ACAT31-NET-NAME.                        
LRM002     MOVE ACAT-CICS-USER-ID    TO ACAT31-USER-ID.                         
LRM002     MOVE ACAT-CICS-USER-NAME  TO ACAT31-USER-NAME.                       
           MOVE EIBTRMID              TO ACAT31-PASS-TERMID.                    
           IF TWA-MAP-TYPE (SUB) = 'RCV'                                        
              MOVE 'R' TO ACAT31-PASS-TYPE                                      
           ELSE                                                                 
           IF TWA-MAP-TYPE (SUB) = 'DLV'                                        
              MOVE 'D' TO ACAT31-PASS-TYPE                                      
           ELSE                                                                 
           IF TWA-MAP-TYPE (SUB) = 'BOTH'                                       
              MOVE 'B' TO ACAT31-PASS-TYPE.                                     
           PERFORM 4800-CHECK-IF-SEC-TBL-EXIST.                                 
           IF ACAT31-FOUND                                                      
              MOVE ATT-UNPROT-BRT TO CUSIP-A (SUB)                              
              MOVE -1 TO CUSIP-L (SUB)                                          
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'UPDATE FAILED - SECURITY ALREADY EXISTS'                 
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
              GO TO 4600-EXIT.                                                  
                                                                                
           SET ACAT31-INS-SECURITY TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-ERROR                                                      
LRM001        MOVE 'DB2 INSERT SECURITY ERROR - CALL HELP DESK'                 
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
                                                                                
           IF TWA-MAP-CONTRA (SUB) > SPACE                                      
              PERFORM 4700-CREATE-BROKER-TBL                                    
                   VARYING SUB2 FROM 1 BY 1 UNTIL SUB2 > 14.                    
                                                                                
           SET ACAT31-CNT-ASSET TO TRUE.                                        
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-ERROR                                                      
LRM001        MOVE 'DB2 COUNT ERROR ON ASSET TABLE - CALL HELP DESK'            
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG                                   
           ELSE                                                                 
           IF ACAT31-FOUND                                                      
              MOVE 'Y' TO ACAT31-PASS-RESTRICTED-IND                            
              SET ACAT31-UPD-ASSET TO TRUE                                      
              PERFORM 7600-LINK-TO-ACAT31DB                                     
              IF ACAT31-ERROR                                                   
LRM001           MOVE 'DB2 UPDATE ASSET TABLE ERROR - CALL HELP DESK'           
                   TO  WK-DB2-ERROR                                             
                 PERFORM 0800-SEND-DB2-ERROR-MSG                                
              END-IF.                                                           
       4600-EXIT.                                     EXIT.                     
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *            CREATE RESTRICTED BROKER TABLE                     *         
      *---------------------------------------------------------------*         
       4700-CREATE-BROKER-TBL.                                                  
           IF TWA-MAP-CBRKR (SUB SUB2) > SPACE                                  
              MOVE TWA-MAP-CBRKR (SUB SUB2) TO ACAT31-PASS-BROKER               
              SET ACAT31-INS-BROKER TO TRUE                                     
              PERFORM 7600-LINK-TO-ACAT31DB                                     
              IF ACAT31-ERROR                                                   
LRM001           MOVE 'DB2 INSERT ERR ON BROKER TABLE - CALL HELP DESK'         
                   TO  WK-DB2-ERROR                                             
                 PERFORM 0800-SEND-DB2-ERROR-MSG                                
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *     BEFORE UPDATING SECURITY, CHECK IF A TABLE ROW EXISTS     *         
      *---------------------------------------------------------------*         
       4800-CHECK-IF-SEC-TBL-EXIST.                                             
LRM003**** MOVE TWA-MAP-CUSIP (SUB)  TO ACAT31-PASS-SECURITY.                   
LRM003     MOVE TWA-MAP-ADP-NBR (SUB) TO ACAT31-PASS-SECURITY.                  
           SET ACAT31-FND-SECURITY TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-ERROR                                                      
LRM001        MOVE                                                              
LRM001        'DB2 FIND ERROR ON RST SECURITY TABLE - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
                                                                                
      *                                                                         
      *---------------------------------------------------------------*         
      *   BEFORE UPDATING BROKER TBL, CHECK IF A TABLE ROW EXISTS     *         
      *---------------------------------------------------------------*         
       4810-CHECK-IF-BKR-TBL-EXIST.                                             
           SET ACAT31-CNT-BROKER  TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT31DB.                                       
           IF ACAT31-ERROR                                                      
LRM001        MOVE 'DB2 COUNT ERROR ON BROKER ABLE - CALL HELP DESK'            
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *      RESET THE MAP AFTER SECURITY IS DELETED                  *         
      *---------------------------------------------------------------*         
       5000-RESET-SCR-DISPLAY.                                                  
           MOVE 0 TO WS-LOOP-CNT.                                               
           PERFORM 5010-FIND-LOOP-CNT.                                          
           IF WS-LOOP-CNT = 0                                                   
              PERFORM 0500-OPEN-SEC-CURSOR-TBL                                  
              PERFORM 5020-RESET-MAP                                            
           ELSE                                                                 
           IF WS-LOOP-CNT > 0                                                   
              PERFORM 0500-OPEN-SEC-CURSOR-TBL                                  
              PERFORM 0510-FETCH-SEC-CURSOR-TBL WS-LOOP-CNT TIMES               
              PERFORM 5020-RESET-MAP                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          READ SECURITY CURSOR TABLE UNTIL KEY FOUND           *         
      *---------------------------------------------------------------*         
       5010-FIND-LOOP-CNT.                                                      
           PERFORM 0500-OPEN-SEC-CURSOR-TBL.                                    
                                                                                
           MOVE SPACE TO WS-NO-MORE-DATA-SW                                     
                         WS-KEY-FOUND-SW.                                       
           MOVE 0 TO SUB.                                                       
           PERFORM  UNTIL WS-KEY-FOUND  OR  WS-NO-MORE-DATA                     
              ADD +1 TO SUB                                                     
              PERFORM 0510-FETCH-SEC-CURSOR-TBL                                 
              IF ACAT31-NORMAL                                                  
                 MOVE ACAT31-SEC-CLT       TO WS-SEC-CLT-KEY                    
                 MOVE ACAT31-SEC-SECURITY  TO WS-SEC-SEC-KEY                    
                 IF WS-SEC-KEY  NOT <  TWA-MAP-KEY-FIRST                        
                    SET WS-KEY-FOUND TO TRUE                                    
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
           IF WS-NO-MORE-DATA                                                   
              IF SUB = 1 OR 2 OR 3 OR 4                                         
                 MOVE 0 TO WS-LOOP-CNT                                          
              ELSE                                                              
                 DIVIDE SUB BY 3 GIVING WS-DIVIDED REMAINDER WS-REMAIN          
                 IF WS-REMAIN = 1                                               
                    SUBTRACT 4 FROM SUB GIVING WS-LOOP-CNT                      
                 END-IF                                                         
                 IF WS-REMAIN = 2                                               
                    SUBTRACT 2 FROM SUB GIVING WS-LOOP-CNT                      
                 END-IF                                                         
                 IF WS-REMAIN = 0                                               
                    SUBTRACT 3 FROM SUB GIVING WS-LOOP-CNT                      
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              IF SUB = 1 OR 2 OR 3                                              
                 MOVE 0 TO WS-LOOP-CNT                                          
              ELSE                                                              
                 SUBTRACT 1 FROM SUB GIVING WS-LOOP-CNT                         
              END-IF.                                                           
                                                                                
           PERFORM 0520-CLOSE-SEC-CURSOR-TBL.                                   
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *         DISPLAY NEXT AVALABLE SECURITIES                      *         
      *---------------------------------------------------------------*         
       5020-RESET-MAP.                                                          
           INITIALIZE TWA-ACAT-AREA.                                            
           PERFORM 2000-ATTRIB-TO-ASKIP.                                        
           PERFORM 2010-CLEAR-SCR.                                              
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           PERFORM VARYING SUB FROM 1 BY 1                                      
                   UNTIL WS-NO-MORE-DATA  OR  SUB > 3                           
               PERFORM 0510-FETCH-SEC-CURSOR-TBL                                
               IF ACAT31-NORMAL                                                 
                  PERFORM 0700-SETUP-SCREEN                                     
               END-IF                                                           
           END-PERFORM.                                                         
           PERFORM 0520-CLOSE-SEC-CURSOR-TBL.                                   
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          PA2:  PREVIOUSE PAGE                                 *         
      *---------------------------------------------------------------*         
       6000-PREV-PAGE-RTN.                                                      
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           IF NOT TWA-UPDATE-MOD  OR                                            
              TWA-MAP-SEC > SPACE                                               
                SET WK-ERROR TO TRUE                                            
                MOVE LOW-VALUE TO ACAT31MO                                      
                MOVE -1 TO MNEXTL                                               
                MOVE 'PA2 KEY DISABLED AT THIS TIME'                            
                  TO SYSTEM-MSG                                                 
                PERFORM 9000-ERROR-RTN                                          
           END-IF.                                                              
                                                                                
           MOVE SPACE TO WS-SCROLL-KEY-FOUND-SW                                 
                         WS-NO-MORE-DATA-SW.                                    
           MOVE -1 TO MNEXTL.                                                   
           MOVE +0 TO WS-LOOP-CNT.                                              
           PERFORM 6010-FIND-PA2-LOOP-CNT.                                      
           IF WS-LOOP-CNT = -1                                                  
              SET WK-ERROR TO TRUE                                              
              MOVE 'FIRST PAGE' TO SYSTEM-MSG                                   
           ELSE                                                                 
              PERFORM 0500-OPEN-SEC-CURSOR-TBL                                  
              PERFORM 0510-FETCH-SEC-CURSOR-TBL WS-LOOP-CNT TIMES               
              PERFORM 5020-RESET-MAP                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          READ SECURITY CURSOR TABLE UNTIL KEY FOUND           *         
      *---------------------------------------------------------------*         
       6010-FIND-PA2-LOOP-CNT.                                                  
           PERFORM 0500-OPEN-SEC-CURSOR-TBL.                                    
                                                                                
           MOVE SPACE TO WS-NO-MORE-DATA-SW                                     
                         WS-KEY-FOUND-SW.                                       
           MOVE +0 TO SUB.                                                      
           PERFORM  UNTIL WS-KEY-FOUND  OR  WS-NO-MORE-DATA                     
               ADD +1 TO SUB                                                    
               PERFORM 0510-FETCH-SEC-CURSOR-TBL                                
               IF ACAT31-NORMAL                                                 
                  MOVE ACAT31-SEC-CLT       TO WS-SEC-CLT-KEY                   
                  MOVE ACAT31-SEC-SECURITY  TO WS-SEC-SEC-KEY                   
                  IF WS-SEC-KEY  NOT <  TWA-MAP-KEY-FIRST                       
                     SET WS-KEY-FOUND TO TRUE                                   
                  END-IF                                                        
               END-IF                                                           
           END-PERFORM.                                                         
           IF SUB = 1 OR 2 OR 3                                                 
              MOVE  -1 TO WS-LOOP-CNT                                           
           ELSE                                                                 
           IF SUB = 4                                                           
              MOVE  0 TO WS-LOOP-CNT                                            
           ELSE                                                                 
              DIVIDE SUB BY 3 GIVING WS-DIVIDED REMAINDER WS-REMAIN             
              IF WS-REMAIN = 1                                                  
                 SUBTRACT 4 FROM SUB GIVING WS-LOOP-CNT                         
              ELSE                                                              
              IF WS-REMAIN = 2                                                  
                 SUBTRACT 5 FROM SUB GIVING WS-LOOP-CNT                         
              ELSE                                                              
              IF WS-REMAIN = 0                                                  
                 SUBTRACT 6 FROM SUB GIVING WS-LOOP-CNT.                        
                                                                                
           PERFORM 0520-CLOSE-SEC-CURSOR-TBL.                                   
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           PA1:    NEXT PAGE                                   *         
      *---------------------------------------------------------------*         
       6100-NEXT-PAGE-RTN.                                                      
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           IF NOT TWA-UPDATE-MOD  OR                                            
              TWA-MAP-SEC > SPACE                                               
                SET WK-ERROR TO TRUE                                            
                MOVE LOW-VALUE TO ACAT31MO                                      
                MOVE -1 TO MNEXTL                                               
                MOVE 'PA1 KEY DISABLED AT THIS TIME' TO SYSTEM-MSG              
                PERFORM 9000-ERROR-RTN                                          
           END-IF.                                                              
                                                                                
           MOVE SPACE TO WS-SCROLL-KEY-FOUND-SW                                 
                         WS-NO-MORE-DATA-SW.                                    
           MOVE -1 TO MNEXTL.                                                   
           MOVE +0 TO WS-LOOP-CNT.                                              
           PERFORM 6110-FIND-PA1-LOOP-CNT.                                      
           IF WS-LOOP-CNT = 0                                                   
              SET WK-ERROR TO TRUE                                              
              MOVE 'BOTTOM PAGE' TO SYSTEM-MSG                                  
           ELSE                                                                 
           IF WS-LOOP-CNT > 0                                                   
              PERFORM 0500-OPEN-SEC-CURSOR-TBL                                  
              PERFORM 0510-FETCH-SEC-CURSOR-TBL WS-LOOP-CNT TIMES               
              PERFORM 5020-RESET-MAP                                            
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *     READ SECURITY CURSOR TABLE UNTIL PA2 SCROLL KEY FOUND     *         
      *---------------------------------------------------------------*         
       6110-FIND-PA1-LOOP-CNT.                                                  
           PERFORM 0500-OPEN-SEC-CURSOR-TBL.                                    
                                                                                
           MOVE SPACE TO WS-NO-MORE-DATA-SW                                     
                         WS-KEY-FOUND-SW.                                       
           MOVE 0 TO SUB.                                                       
           PERFORM  UNTIL WS-KEY-FOUND  OR  WS-NO-MORE-DATA                     
              ADD 1 TO SUB                                                      
              PERFORM 0510-FETCH-SEC-CURSOR-TBL                                 
              IF ACAT31-NORMAL                                                  
                 MOVE ACAT31-SEC-CLT       TO WS-SEC-CLT-KEY                    
                 MOVE ACAT31-SEC-SECURITY  TO WS-SEC-SEC-KEY                    
                 IF WS-SEC-KEY > TWA-MAP-KEY-LAST                               
                    SET WS-KEY-FOUND TO TRUE                                    
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                         
           IF WS-NO-MORE-DATA                                                   
              MOVE 0 TO WS-LOOP-CNT                                             
           ELSE                                                                 
              SUBTRACT 1 FROM SUB GIVING WS-LOOP-CNT.                           
                                                                                
           PERFORM 0520-CLOSE-SEC-CURSOR-TBL.                                   
       EJECT                                                                    
      *-------------------------------------------------------------*           
      *           TS QUEUE FOR TWA AREA                             *           
      *-------------------------------------------------------------*           
       7000-READ-TSQ-RTN.                                                       
           MOVE EIBTRNID TO TRAN-ID.                                            
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                                   
                              INTO(TWA-AREA)                                    
                              LENGTH(LENGTH OF TWA-AREA)                        
                              ITEM(ITEM-NUM)                                    
           END-EXEC.                                                            
           IF (EIBRESP NOT = +0)                                                
           AND (NOT FIRST-TIME)                                                 
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT31MO                                        
              MOVE 'ACAT31AL READ TSQ ERROR'                                    
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
       7010-DELETE-TSQ-RTN.                                                     
           MOVE EIBTRNID TO TRAN-ID.                                            
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                                 
           END-EXEC.                                                            
                                                                                
       7020-WRITE-TSQ-RTN.                                                      
           MOVE EIBTRNID TO TRAN-ID.                                            
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                                  
                               FROM(TWA-AREA)                                   
                               LENGTH(LENGTH OF TWA-AREA)                       
                               ITEM(ITEM-NUM)                                   
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              SET  WK-ERROR  TO TRUE                                            
              MOVE LOW-VALUE TO ACAT31MO                                        
              MOVE 'ACAT31AL WRITE TSQ ERROR'                                   
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
           PERFORM SCREEN-SECURITY-CHECK.                                       
           EXEC CICS XCTL                                                       
                  PROGRAM(CALLED-PROGRAM-NAME)                                  
                  COMMAREA(ACATCOMM-COMMAREA)                                   
                  LENGTH(LENGTH OF ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
      *                                                                         
       SCREEN-SECURITY-CHECK.                                                   
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
                     MOVE 'ACAT31RS' TO ACAT-PROGRAM-NAME                       
                     MOVE 'X'        TO ACAT-NEXT ACAT-INP-SEL                  
                     MOVE  SPACES    TO ACAT-CALLING-PROG-NAME                  
                     PERFORM 9000-ERROR-RTN                                     
                  END-IF                                                        
               END-IF                                                           
           END-IF.                                                              
                                                                                
           EJECT                                                                
       CALL-SECLINK-RTN.                                                AEISAC07
           EXEC CICS LINK PROGRAM ('SECLINK')                           AEISAC07
                COMMAREA(SECLINK-LIST)                                          
                LENGTH(LENGTH OF SECLINK-LIST)                          AEISAC07
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
      *                                                                         
      *-------------------------------------------------------------*           
      *            CALL DB2 I/O MODULE ACAT31DB                     *           
      *-------------------------------------------------------------*           
       7600-LINK-TO-ACAT31DB.                                                   
           EXEC CICS LINK                                                       
                     PROGRAM('ACAT31DB')                                        
                     COMMAREA(ACAT31IO-COMMAREA)                                
                     LENGTH(LENGTH OF ACAT31IO-COMMAREA)                        
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
           EXEC CICS SEND MAP('ACAT31M')                                        
                     MAPSET('ACAT31M')                                          
                     FROM(ACAT31MO)                                             
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
               EXEC CICS SEND MAP('ACAT31M')                                    
                         MAPSET('ACAT31M')                                      
                         FROM(ACAT31MO)                                         
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
           EXEC CICS RECEIVE MAP('ACAT31M')                                     
                             MAPSET('ACAT31M')                                  
                             FROM(ACAT-RECEIVE-MAP)                             
                             INTO(ACAT31MI)                                     
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
                                                                                
