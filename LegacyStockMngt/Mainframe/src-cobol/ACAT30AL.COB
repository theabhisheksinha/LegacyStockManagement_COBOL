000001* PDX    - ACAT30AL C0318727 01/11/12 13:47:12 TBLAMUR            00001000
000001* PDX    - ACAT30AL C0270299 09/15/08 16:33:19 TBLAMUR            00001000
000001* LRM SSRS 55766 55717 RECOMPILE ONLY FOR COPYS ACATCOM,90TS,JUMP.        
000001* PDX    - ACAT30AL C0250441 06/25/07 15:08:09 TBLAMUR            00001000
000001* LRM001 - SSR 53075 SPIN-OFF CHANGES                                     
000001* PDX    - ACAT30AL C0179784 09/26/02 14:41:23 TBEDTAK            00001000
000001* PDX    - ACAT30AL C0160324 06/25/01 08:38:25 TBLAMUR            00001000
000001* PDX    - ACAT30AL C0126743 06/10/99 09:39:16 TBEDTAK            00001000
000001* PDX    - ACAT30AL C0123136 03/25/99 17:13:57 TBEDTAK            00001000
000001* PDX    - ACAT30AL C0119329 12/17/98 16:52:29 TBEDTAK            00001000
000001* PDX    - ACAT30AL C0109165 09/14/98 16:29:29 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT30AL.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *                 ACAT PROCESS/ALERT MESSAGES                   *         
      *****************************************************************         
      *  DATABASE:                                                    *         
      *      VALERT (ALERT MESSAGE)                                   *         
      *  PURPOSE:                                                     *         
      *  THE PROGRAM WILL INSERT, UPDATE, AND DELETE DATA ENTIRELY    *         
      *  WITH THE ACAT_ALERT TABLE. THESE MESSAGES WILL BE ESTABLISED *         
      *  BY USER FOR SELECTED ACCOUNTS THAT MAY OR MAY NOT BE         *         
      *  INVOLVED IN ANY KIND OF ACAT TRANSFER.                       *         
      *  THE USER CAN OVERTYPE THE MESSAGES TO MODIFY, OR TYPE 'Y' AT *         
      *  DELETE FIELD TO DELETE AN ACCOUNT MESSAGE RECORD.            *         
      *  THE PROGRAM ALSO UPDATES ALERT INDICATOR OF TRANSFER TABLE   *         
      *  WHENEVER ALERT MESSAGE IS ADDED OR DELETED FROM ALERT TABLE. *         
      *  PF2 KEY IS USED TO ADD A NEW ACCOUNT WITH MESSAGES.          *         
      *  PF3 KEY IS USED TO EXIT FROM ADDITION MODE.                  *         
      *  PF5 KEY IS USED TO UPDATE THE DATABASE FOR THE NEW OR        *         
      *  MODIFIED ACCOUNT.                                            *         
      *  PF7 AND PF8 ARE USED TO NAVIGATE THE ALERT MESSAGE TABLE.    *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
       77  TWA-SIZE                       PIC S9(4) COMP.                       
       77  ACATVR-DATASET                 PIC X(08) VALUE 'ACATIT'.             
       77  WS-EDITMOD                     PIC X(08) VALUE 'ACATEDIT'.           
       77  WS-ACATNAIO                    PIC X(08) VALUE 'ACAT00NA'.   00140002
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
               88  WS-NO-MORE-DATA                     VALUE 'N'.               
           05  WS-SEARCH-CHANGED-SW       PIC X(01) VALUE SPACE.                
               88  WS-SEARCH-CHANGED                VALUE 'Y'.                  
           05  WS-VALID-QTY-SW            PIC X(01).                            
               88  WS-VALID-QTY                     VALUE 'Y'.                  
           05  LENGTH-DETERMINED-SW       PIC X(01).                            
               88  LENGTH-DETERMINED                VALUE 'Y'.                  
           05  WS-TRNFR-NOT-FOUND-SW      PIC X(01).                            
               88  WS-TRNFR-NOT-FOUND              VALUE 'Y'.                   
       01  ACAT-WORK-AREA.                                                      
           05  WS-ALERT-MSG.                                                    
               09  WS-ALERT-MSG1          PIC X(79).                            
               09  WS-ALERT-MSG2          PIC X(79).                            
               09  WS-ALERT-MSG3          PIC X(79).                            
               09  WS-ALERT-MSG4          PIC X(79).                            
               09  WS-ALERT-MSG5          PIC X(79).                            
               09  WS-ALERT-MSG6          PIC X(79).                            
               09  WS-ALERT-MSG7          PIC X(79).                            
               09  WS-ALERT-MSG8          PIC X(79).                            
               09  WS-ALERT-MSG9          PIC X(08).                            
           05  WS-ALERT-MSG-RED REDEFINES WS-ALERT-MSG.                         
               09  WS-ALERT-MSG-TXT       PIC X(1) OCCURS 640 TIMES.            
           05  TXT-LENGTH                 PIC S9(4) COMP.                       
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
           05  WS-ALT-KEY.                                                      
               09  WS-KEY-CLT             PIC X(04).                            
               09  WS-KEY-BRANCH          PIC X(03).                            
               09  WS-KEY-ACCT            PIC X(05).                            
           05  WS-LOOP-CNT                PIC S9(07) COMP-3.                    
           05  TFR-WITH-ASSET-CNT         PIC S9(07) COMP-3.                    
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
           05  SAVE-INTRAN-FLAG           PIC X(01).                            
           05  PREV-INTRAN-FLAG           PIC X(01).                            
           05  WS-ACAT-NEXT               PIC X.                                
           05  WS-ACTION-COUNT            PIC 9(02).                            
           05  WS-INIT-TFR-ROWS           PIC 9(03).                            
           05  SUB                        PIC S9(09) COMP-3.                    
           05  C-IDX                      PIC S9(03) COMP-3.                    
      *                                                                         
       01  ACATPPIO-CALL-AREA.                                                  
           COPY ACATPPIO.                                                       
           EJECT                                                                
       01  ACAT30IO-COMMAREA.                                                   
           COPY ACAT30IO.                                                       
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
       COPY ACAT30M.                                                            
            EJECT                                                               
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
           03  FILLER                    PIC X(2000).                           
                                                                                
       COPY TWACOMMN.                                                           
           03  TWA-ACAT-AREA.                                                   
               05  TWA-ADD-MOD-IND              PIC X(01).                      
                   88  TWA-ALERT-ADD                     VALUE 'A'.             
                   88  TWA-ALERT-MOD                     VALUE 'M'.             
               05  TWA-MAP-AREA.                                                
                   07  TWA-MAP-BR               PIC X(3).                       
                   07  TWA-MAP-AC               PIC X(5).                       
                   07  TWA-MAP-RR               PIC X(3).                       
                   07  TWA-MAP-NAME             PIC X(30).                      
                   07  TWA-MAP-NAME2            PIC X(30).                      
                   07  TWA-MAP-ADMD             PIC X(03).                      
                   07  TWA-MAP-ALMSG.                                           
                       09  TWA-MAP-ALMSG1       PIC X(79).                      
                       09  TWA-MAP-ALMSG2       PIC X(79).                      
                       09  TWA-MAP-ALMSG3       PIC X(79).                      
                       09  TWA-MAP-ALMSG4       PIC X(79).                      
                       09  TWA-MAP-ALMSG5       PIC X(79).                      
                       09  TWA-MAP-ALMSG6       PIC X(79).                      
                       09  TWA-MAP-ALMSG7       PIC X(79).                      
                       09  TWA-MAP-ALMSG8       PIC X(79).                      
                       09  TWA-MAP-ALMSG9       PIC X(8).                       
                   07  TWA-MAP-NEXT             PIC X(1).                       
                   07  TWA-MAP-DEL              PIC X(1).                       
               05  TWA-PREV-ALT-KEY.                                            
                   07  TWA-PREV-KEY-CLT         PIC X(4).                       
                   07  TWA-PREV-KEY-BR          PIC X(3).                       
                   07  TWA-PREV-KEY-AC          PIC X(5).                       
               05  TWA-MAP-SEARCH.                                              
                   07  TWA-MAP-MMBR             PIC X(3).                       
                   07  TWA-MAP-MMAC             PIC X(5).                       
                   07  TWA-MAP-MMRR             PIC X(3).                       
                   07  TWA-MAP-MMTFR            PIC X(3).                       
                   07  TWA-MAP-MMRD             PIC X(1).                       
                   07  TWA-MAP-MMBKR            PIC X(4).                       
                   07  TWA-MAP-MMSTAT           PIC X(3).                       
                   07  TWA-MAP-MMSD             PIC X(6).                       
               05  TWA-PREV-MAP-SEARCH.                                         
                   07  TWA-PREV-MMBR            PIC X(3).                       
                   07  TWA-PREV-MMAC            PIC X(5).                       
                   07  TWA-PREV-MMRR            PIC X(3).                       
                   07  TWA-PREV-MMTFR           PIC X(3).                       
                   07  TWA-PREV-MMRD            PIC X(1).                       
                   07  TWA-PREV-MMBKR           PIC X(4).                       
                   07  TWA-PREV-MMSTAT          PIC X(3).                       
                   07  TWA-PREV-MMSD            PIC X(6).                       
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
              MOVE LOW-VALUE TO ACAT30MO                                        
              SET WK-ERROR TO TRUE                                              
              MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO SYSTEM-MSG             
              PERFORM  9000-ERROR-RTN.                                          
                                                                                
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                          
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       MAIN-PROCESSING.                                                         
           INITIALIZE ACAT30IO-COMMAREA.                                        
           MOVE EIBTRMID TO TERM-ID.                                            
           MOVE EIBTRNID TO TRAN-ID.                                            
           MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                               
           MOVE 'N'           TO END-OF-DATA-FLAG.                              
           MOVE SPACES        TO SYSTEM-MSG.                                    
           MOVE 0             TO WK-CURSOR.                                     
           MOVE LOW-VALUE     TO HDRMAPO                                        
                                 ACAT30MO.                                      
           PERFORM 0100-GET-DATE-AND-TIME.                                      
           MOVE  DFHCOMMAREA     TO  ACATCOMM-COMMAREA.                         
           MOVE  TWA-CLIENT-NO-X TO WK-CLT-NBR.                                 
           MOVE  WK-CLT          TO  ACAT30-PASS-CLT.                           
                                                                                
      *    IF  ACAT-CALLING-PROG-NAME = 'ACAT30AL'                              
      *        PERFORM RETURN-FROM-DETAIL-RTN                                   
      *    END-IF.                                                              
                                                                                
      *    IF  EIBAID = DFHPF10                                                 
      *    AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                              
      *        MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
      *        PERFORM BROWSING-RTN                                             
      *    ELSE                                                                 
      *    MOVE SPACES TO ACAT-CALLING-PROG-NAME.                               
           IF  ACAT-PROGRAM-NAME = 'ACAT30AL'                                   
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
               PERFORM 0900-CONTINUE-PROCESS                                    
      *    ELSE                                                                 
      *    IF  ACAT-PROGRAM-NAME = 'RATT01  '                                   
      *        PERFORM 7000-READ-TSQ-RTN                                        
      *        PERFORM 7010-DELETE-TSQ-RTN                                      
      *        PERFORM BROWSING-RTN                                             
           ELSE                                                                 
               MOVE 'ACAT30AL' TO ACAT-PROGRAM-NAME                             
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
           MOVE 'W' TO ACAT-NEXT.                                               
           PERFORM 7010-DELETE-TSQ-RTN.                                         
           MOVE SPACES TO ACAT-CALLING-PROG-NAME.                               
           PERFORM 2000-ATTRIB-TO-ASKIP.                                        
           MOVE ACAT-INP-BRANCH                                                 
             TO MMBRO   TWA-MAP-MMBR   TWA-PREV-MMBR.                           
           MOVE ACAT-INP-ACCOUNT                                                
             TO MMACO   TWA-MAP-MMAC   TWA-PREV-MMAC.                           
           MOVE ACAT-INP-RR                                                     
             TO MMRRO   TWA-MAP-MMRR   TWA-PREV-MMRR.                           
           MOVE ACAT-INP-TFR-TYP                                                
             TO MMTFRO  TWA-MAP-MMTFR  TWA-PREV-MMTFR.                          
           MOVE ACAT-INP-RCV-DEL                                                
             TO MMRDO   TWA-MAP-MMRD   TWA-PREV-MMRD.                           
           MOVE ACAT-INP-CONTRA-BKR                                             
             TO MMBKRO  TWA-MAP-MMBKR  TWA-PREV-MMBKR.                          
           MOVE ACAT-INP-STATUS                                                 
             TO MMSTATO TWA-MAP-MMSTAT TWA-PREV-MMSTAT.                         
           MOVE ACAT-INP-STTL-DT                                                
             TO MMSDO   TWA-MAP-MMSD   TWA-PREV-MMSD.                           
           PERFORM 1640-VALIDATE-SRCH-ENGINE.                                   
           IF NOT WK-ERROR                                                      
              MOVE -1 TO MNEXTL                                                 
              PERFORM 0400-REFRESH-WITH-NEW-ALERT.                              
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 8000-SEND-MAP-ERASE.                                         
           PERFORM 8800-RETURN-TO-CICS.                                         
       EJECT                                                                    
       0400-REFRESH-WITH-NEW-ALERT.                                             
           PERFORM 0500-OPEN-CURSOR-TBL.                                        
           PERFORM 0540-FETCH-CURSOR-TBL.                                       
           IF ACAT30-NORMAL                                                     
              SET TWA-ALERT-MOD TO TRUE                                         
              PERFORM 0600-SETUP-SCREEN                                         
           ELSE                                                                 
           IF ACAT30-NOT-FOUND                                                  
              MOVE -1 TO MNEXTL                                                 
              SET WK-MSG-ON TO TRUE                                             
              MOVE 'NO ACCOUNTS WITH ALERT MESSAGES FOUND FOR THIS REQUE        
      -            'ST'                                                         
                TO  SYSTEM-MSG                                                  
           END-IF.                                                              
           PERFORM 0550-CLOSE-CURSOR-TBL.                                       
       EJECT                                                                   2
      *                                                                         
      *---------------------------------------------------------------*         
      *          OPEN ALERT CURSOR TABLE                              *         
      *---------------------------------------------------------------*         
       0500-OPEN-CURSOR-TBL.                                                    
           IF ACAT-INP-BRANCH = SPACE                                           
              MOVE SPACE            TO ACAT30-PASS-BRANCH                       
           ELSE                                                                 
              MOVE ACAT-INP-BRANCH  TO ACAT30-PASS-BRANCH.                      
           IF ACAT-INP-ACCOUNT = SPACE                                          
              MOVE SPACE            TO ACAT30-PASS-ACCT                         
           ELSE                                                                 
              MOVE ACAT-INP-ACCOUNT TO ACAT30-PASS-ACCT.                        
           IF ACAT-INP-RR = SPACE                                               
              MOVE ALL '%'          TO ACAT30-PASS-RR                           
           ELSE                                                                 
              MOVE ACAT-INP-RR      TO ACAT30-PASS-RR.                          
           SET ACAT30-OPN-ALTCSR  TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT30DB.                                       
           IF ACAT30-ERROR                                                      
LRM001        MOVE 'DB2 OPEN ERROR ON ALERT TABLE - CALL HELP DESK'             
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *---------------------------------------------------------------*         
      *          FETCH ALERT CURSOR TABLE                             *         
      *---------------------------------------------------------------*         
       0540-FETCH-CURSOR-TBL.                                                   
           SET ACAT30-FET-ALTCSR  TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT30DB.                                       
           IF ACAT30-ERROR                                                      
              PERFORM 0550-CLOSE-CURSOR-TBL                                     
LRM001        MOVE 'DB2 OPEN ERROR ON ALERT TABLE - CALL HELP DESK'             
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *---------------------------------------------------------------*         
      *          CLOSE ALERT CURSOR TABLE                             *         
      *---------------------------------------------------------------*         
       0550-CLOSE-CURSOR-TBL.                                                   
           SET ACAT30-CLO-ALTCSR  TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT30DB.                                       
           IF ACAT30-ERROR                                                      
LRM001        MOVE 'DB2 CLOSE ERROR ON ALERT TABLE - CALL HELP DESK'            
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *         OPEN ALERT CURSOR TABLE IN DESCENDING ORDER           *         
      *---------------------------------------------------------------*         
       0560-OPEN-CURSOR-DESCEND.                                                
           IF ACAT-INP-BRANCH = SPACE                                           
              MOVE SPACE            TO ACAT30-PASS-BRANCH                       
           ELSE                                                                 
              MOVE ACAT-INP-BRANCH  TO ACAT30-PASS-BRANCH.                      
           IF ACAT-INP-ACCOUNT = SPACE                                          
              MOVE SPACE            TO ACAT30-PASS-ACCT                         
           ELSE                                                                 
              MOVE ACAT-INP-ACCOUNT TO ACAT30-PASS-ACCT.                        
           IF ACAT-INP-RR = SPACE                                               
              MOVE ALL '%'          TO ACAT30-PASS-RR                           
           ELSE                                                                 
              MOVE ACAT-INP-RR      TO ACAT30-PASS-RR.                          
           SET ACAT30-OPN-ALTCSRD   TO TRUE.                                    
           PERFORM 7600-LINK-TO-ACAT30DB.                                       
           IF ACAT30-ERROR                                                      
LRM001        MOVE 'DB2 OPEN ERROR ON ALERT TABLE - CALL HELP DESK'             
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *---------------------------------------------------------------*         
      *        FETCH ALERT CURSOR TABLE IN DESCENDING ORDER           *         
      *---------------------------------------------------------------*         
       0570-FETCH-CURSOR-DESCEND.                                               
           SET ACAT30-FET-ALTCSRD  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT30DB.                                       
           IF ACAT30-ERROR                                                      
              PERFORM 0580-CLOSE-CURSOR-DESCEND                                 
LRM001        MOVE 'DB2 OPEN ERROR ON ALERT TABLE - CALL HELP DESK'             
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
      *                                                                         
      *---------------------------------------------------------------*         
      *        CLOSE ALERT CURSOR TABLE IN DESCENDING ORDER           *         
      *---------------------------------------------------------------*         
       0580-CLOSE-CURSOR-DESCEND.                                               
           SET ACAT30-CLO-ALTCSRD  TO TRUE.                                     
           PERFORM 7600-LINK-TO-ACAT30DB.                                       
           IF ACAT30-ERROR                                                      
LRM001        MOVE 'DB2 CLOSE ERROR ON ALERT TABLE - CALL HELP DESK'            
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *         SETUP SCREEN                                          *         
      *---------------------------------------------------------------*         
       0600-SETUP-SCREEN.                                                       
           MOVE ATT-UNPROT TO MALMSG1A                                          
                              MALMSG2A                                          
                              MALMSG3A                                          
                              MALMSG4A                                          
                              MALMSG5A                                          
                              MALMSG6A                                          
                              MALMSG7A                                          
                              MALMSG8A                                          
                              MALMSG9A                                          
                              MDELA.                                            
           MOVE ACAT30-ALT-BRANCH  TO MBRO TWA-MAP-BR.                          
           MOVE ACAT30-ALT-ACCT    TO MACO TWA-MAP-AC.                          
           MOVE ACAT30-ALT-RR      TO MRRO TWA-MAP-RR.                          
                                                                                
           SET ACATNAIO-NA-READ TO TRUE.                                        
           MOVE WK-CLT(2:3) TO ACATNAIO-CLIENT.                                 
           MOVE TWA-MAP-BR  TO ACATNAIO-BR.                                     
           MOVE TWA-MAP-AC  TO ACATNAIO-AC.                                     
           PERFORM 7900-LINK-TO-ACATNAIO.                                       
           IF ACATNAIO-NOT-FOUND                                                
              MOVE SPACE          TO MNAMEO  TWA-MAP-NAME                       
                                     MNAME2O TWA-MAP-NAME2                      
           ELSE                                                                 
              MOVE ACATNAIO-NAME  TO MNAMEO  TWA-MAP-NAME                       
              MOVE ACATNAIO-NAME2 TO MNAME2O TWA-MAP-NAME2.                     
                                                                                
           MOVE SPACE TO WS-ALERT-MSG.                                          
           MOVE ACAT30-ALT-MSG-TXT TO WS-ALERT-MSG.                             
           INSPECT WS-ALERT-MSG REPLACING ALL LOW-VALUES BY SPACE.              
           MOVE WS-ALERT-MSG   TO TWA-MAP-ALMSG.                                
           MOVE WS-ALERT-MSG1  TO MALMSG1O.                                     
           MOVE WS-ALERT-MSG2  TO MALMSG2O.                                     
           MOVE WS-ALERT-MSG3  TO MALMSG3O.                                     
           MOVE WS-ALERT-MSG4  TO MALMSG4O.                                     
           MOVE WS-ALERT-MSG5  TO MALMSG5O.                                     
           MOVE WS-ALERT-MSG6  TO MALMSG6O.                                     
           MOVE WS-ALERT-MSG7  TO MALMSG7O.                                     
           MOVE WS-ALERT-MSG8  TO MALMSG8O.                                     
           MOVE WS-ALERT-MSG9  TO MALMSG9O.                                     
           IF TWA-ALERT-ADD                                                     
              MOVE 'ADD' TO MADMDO TWA-MAP-ADMD                                 
           ELSE                                                                 
           IF TWA-ALERT-MOD                                                     
              MOVE 'MOD' TO MADMDO TWA-MAP-ADMD                                 
           ELSE                                                                 
              MOVE SPACE TO MADMDO TWA-MAP-ADMD.                                
                                                                                
           MOVE ACAT30-ALT-CLT    TO TWA-PREV-KEY-CLT.                          
           MOVE ACAT30-ALT-BRANCH TO TWA-PREV-KEY-BR.                           
           MOVE ACAT30-ALT-ACCT   TO TWA-PREV-KEY-AC.                           
       EJECT                                                                    
       0800-SEND-DB2-ERROR-MSG.                                                 
           MOVE -1 TO MNEXTL.                                                   
           SET WK-ERROR TO TRUE.                                                
           MOVE  ACAT30-SQLCODE   TO WK-ERR-SQLCODE.                            
           MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG.                                
           PERFORM 9000-ERROR-RTN.                                              
       EJECT                                                                    
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
                WHEN EIBAID = DFHPF2                                            
                     PERFORM 3000-ADD-ACCT-RTN                                  
                WHEN EIBAID = DFHPF3                                            
                     PERFORM 3100-EXIT-ADD-RTN                                  
                WHEN EIBAID = DFHPF7                                            
                     PERFORM 5000-PREV-ACCT-RTN                                 
                WHEN EIBAID = DFHPF8                                            
                     PERFORM 5100-NEXT-ACCT-RTN                                 
                WHEN OTHER                                                      
                     SET  WK-ERROR  TO TRUE                                     
                     MOVE LOW-VALUE TO ACAT30MO                                 
                     MOVE -1 TO MNEXTL                                          
                     MOVE 'ERROR FUNCTION KEY'                                  
                       TO SYSTEM-MSG                                            
                     PERFORM 9000-ERROR-RTN                                     
           END-EVALUATE.                                                        
           PERFORM 7020-WRITE-TSQ-RTN.                                          
           PERFORM 8100-SEND-MAP-DATA-ONLY.                                     
           PERFORM 8800-RETURN-TO-CICS.                                         
       EJECT                                                                    
       1000-ENTER-KEY.                                                          
           PERFORM 8500-RECEIVE-MAP.                                            
           MOVE SPACE  TO WK-ERROR-SW                                           
                          WK-MSG-ON-SW.                                         
           IF TWA-ALERT-ADD                                                     
              PERFORM 1100-VALIDATE-ACCT-RTN.                                   
           IF TWA-ALERT-ADD OR TWA-ALERT-MOD                                    
              PERFORM 1200-MESSAGE-RTN.                                         
           PERFORM 1600-NEXT-SELECTION-RTN.                                     
           IF TWA-ALERT-MOD                                                     
              IF NOT WK-ERROR                                                   
                 PERFORM 1700-DELETE-RTN.                                       
           IF EIBAID = DFHPF5                                                   
              IF NOT WK-ERROR                                                   
                 PERFORM 4000-UPDATE-RTN.                                       
           IF NOT WK-ERROR                                                      
              MOVE -1    TO MNEXTL                                              
              MOVE SPACE TO TRLMSGO.                                            
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *            VALIDATE ACCOUNT                                    *        
      *----------------------------------------------------------------*        
       1100-VALIDATE-ACCT-RTN.                                                  
           IF MBRL > 0                                                          
              IF MBRO = TWA-MAP-BR                                              
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MBRO TO TWA-MAP-BR                                        
              END-IF                                                            
           ELSE                                                                 
           IF MBRA = ERASE-KEY                                                  
              MOVE SPACE TO TWA-MAP-BR.                                         
           IF TWA-MAP-BR = LOW-VALUE                                            
              MOVE SPACE TO TWA-MAP-BR.                                         
           MOVE ATT-UNPROT TO MBRA.                                             
           IF MACL > 0                                                          
              IF MACO = TWA-MAP-AC                                              
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MACO TO TWA-MAP-AC                                        
              END-IF                                                            
           ELSE                                                                 
           IF MACA = ERASE-KEY                                                  
              MOVE SPACE TO TWA-MAP-AC.                                         
           IF TWA-MAP-AC = LOW-VALUE                                            
              MOVE SPACE TO TWA-MAP-AC.                                         
           MOVE ATT-UNPROT TO MACA.                                             
                                                                                
           IF TWA-MAP-BR = SPACE                                                
              MOVE -1 TO MBRL                                                   
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'ENTER BRANCH' TO SYSTEM-MSG                              
              END-IF.                                                           
           IF TWA-MAP-AC = SPACE                                                
              MOVE -1 TO MACL                                                   
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'ENTER ACCOUNT' TO SYSTEM-MSG                             
              END-IF.                                                           
                                                                                
           IF TWA-MAP-BR > SPACE  AND  TWA-MAP-AC > SPACE                       
              SET ACATNAIO-NA-READ TO TRUE                                      
              MOVE WK-CLT(2:3) TO ACATNAIO-CLIENT                               
              MOVE TWA-MAP-BR  TO ACATNAIO-BR                                   
              MOVE TWA-MAP-AC  TO ACATNAIO-AC                                   
              PERFORM 7900-LINK-TO-ACATNAIO                                     
              IF ACATNAIO-NOT-FOUND                                             
                 MOVE -1 TO MBRL                                                
                 MOVE ATT-UNPROT-BRT TO MBRA MACA                               
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'BRANCH/ACCT NOT IN NAME & ADDRESS FILE'               
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              ELSE                                                              
                 MOVE ACATNAIO-NAME  TO MNAMEO  TWA-MAP-NAME                    
                 MOVE ACATNAIO-NAME2 TO MNAME2O TWA-MAP-NAME2                   
                 MOVE ACATNAIO-RR    TO MRRO    TWA-MAP-RR                      
              END-IF.                                                           
                                                                                
           MOVE WK-CLT TO WS-KEY-CLT.                                           
           MOVE MBRI   TO WS-KEY-BRANCH.                                        
           MOVE MACI   TO WS-KEY-ACCT.                                          
           IF WS-ALT-KEY = TWA-PREV-ALT-KEY                                     
              CONTINUE                                                          
           ELSE                                                                 
              MOVE WS-ALT-KEY  TO TWA-PREV-ALT-KEY                              
              MOVE WK-CLT      TO ACAT30-PASS-CLT                               
              MOVE TWA-MAP-BR  TO ACAT30-PASS-BRANCH                            
              MOVE TWA-MAP-AC  TO ACAT30-PASS-ACCT                              
              SET ACAT30-CNT-ALERT TO TRUE                                      
              PERFORM 7600-LINK-TO-ACAT30DB                                     
              IF ACAT30-FOUND                                                   
                 MOVE -1 TO MBRL                                                
                 MOVE ATT-UNPROT-BRT TO MBRA MACA                               
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'BR/ACCOUNT ERROR - ACCOUNT ALREADY EXISTS'            
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              ELSE                                                              
              IF ACAT30-NOT-FOUND                                               
                 CONTINUE                                                       
              ELSE                                                              
              IF ACAT30-ERROR                                                   
LRM001           MOVE 'DB2 SELECT COUNT ERROR - CALL HELP DESK'                 
                   TO  WK-DB2-ERROR                                             
                 PERFORM 0800-SEND-DB2-ERROR-MSG.                               
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *         MESSAGE MUST BE ENTERED TO ADD NEW ACCOUNT             *        
      *----------------------------------------------------------------*        
       1200-MESSAGE-RTN.                                                        
           IF MALMSG1L > 0                                                      
              IF MALMSG1O = TWA-MAP-ALMSG1                                      
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MALMSG1O TO TWA-MAP-ALMSG1                                
              END-IF                                                            
           ELSE                                                                 
           IF MALMSG1A = ERASE-KEY                                              
              MOVE SPACE TO TWA-MAP-ALMSG1.                                     
           IF TWA-MAP-ALMSG1 = LOW-VALUE                                        
              MOVE SPACE TO TWA-MAP-ALMSG1.                                     
           MOVE ATT-UNPROT TO MALMSG1A.                                         
                                                                                
           IF MALMSG2L > 0                                                      
              IF MALMSG2O = TWA-MAP-ALMSG2                                      
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MALMSG2O TO TWA-MAP-ALMSG2                                
              END-IF                                                            
           ELSE                                                                 
           IF MALMSG2A = ERASE-KEY                                              
              MOVE SPACE TO TWA-MAP-ALMSG2.                                     
           IF TWA-MAP-ALMSG2 = LOW-VALUE                                        
              MOVE SPACE TO TWA-MAP-ALMSG2.                                     
           MOVE ATT-UNPROT TO MALMSG2A.                                         
                                                                                
           IF MALMSG3L > 0                                                      
              IF MALMSG3O = TWA-MAP-ALMSG3                                      
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MALMSG3O TO TWA-MAP-ALMSG3                                
              END-IF                                                            
           ELSE                                                                 
           IF MALMSG3A = ERASE-KEY                                              
              MOVE SPACE TO TWA-MAP-ALMSG3.                                     
           IF TWA-MAP-ALMSG3 = LOW-VALUE                                        
              MOVE SPACE TO TWA-MAP-ALMSG3.                                     
           MOVE ATT-UNPROT TO MALMSG3A.                                         
                                                                                
           IF MALMSG4L > 0                                                      
              IF MALMSG4O = TWA-MAP-ALMSG4                                      
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MALMSG4O TO TWA-MAP-ALMSG4                                
              END-IF                                                            
           ELSE                                                                 
           IF MALMSG4A = ERASE-KEY                                              
              MOVE SPACE TO TWA-MAP-ALMSG4.                                     
           IF TWA-MAP-ALMSG4 = LOW-VALUE                                        
              MOVE SPACE TO TWA-MAP-ALMSG4.                                     
           MOVE ATT-UNPROT TO MALMSG4A.                                         
                                                                                
           IF MALMSG5L > 0                                                      
              IF MALMSG5O = TWA-MAP-ALMSG5                                      
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MALMSG5O TO TWA-MAP-ALMSG5                                
              END-IF                                                            
           ELSE                                                                 
           IF MALMSG5A = ERASE-KEY                                              
              MOVE SPACE TO TWA-MAP-ALMSG5.                                     
           IF TWA-MAP-ALMSG5 = LOW-VALUE                                        
              MOVE SPACE TO TWA-MAP-ALMSG5.                                     
           MOVE ATT-UNPROT TO MALMSG5A.                                         
                                                                                
           IF MALMSG6L > 0                                                      
              IF MALMSG6O = TWA-MAP-ALMSG6                                      
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MALMSG6O TO TWA-MAP-ALMSG6                                
              END-IF                                                            
           ELSE                                                                 
           IF MALMSG6A = ERASE-KEY                                              
              MOVE SPACE TO TWA-MAP-ALMSG6.                                     
           IF TWA-MAP-ALMSG6 = LOW-VALUE                                        
              MOVE SPACE TO TWA-MAP-ALMSG6.                                     
           MOVE ATT-UNPROT TO MALMSG6A.                                         
                                                                                
           IF MALMSG7L > 0                                                      
              IF MALMSG7O = TWA-MAP-ALMSG7                                      
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MALMSG7O TO TWA-MAP-ALMSG7                                
              END-IF                                                            
           ELSE                                                                 
           IF MALMSG7A = ERASE-KEY                                              
              MOVE SPACE TO TWA-MAP-ALMSG7.                                     
           IF TWA-MAP-ALMSG7 = LOW-VALUE                                        
              MOVE SPACE TO TWA-MAP-ALMSG7.                                     
           MOVE ATT-UNPROT TO MALMSG7A.                                         
                                                                                
           IF MALMSG8L > 0                                                      
              IF MALMSG8O = TWA-MAP-ALMSG8                                      
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MALMSG8O TO TWA-MAP-ALMSG8                                
              END-IF                                                            
           ELSE                                                                 
           IF MALMSG8A = ERASE-KEY                                              
              MOVE SPACE TO TWA-MAP-ALMSG8.                                     
           IF TWA-MAP-ALMSG8 = LOW-VALUE                                        
              MOVE SPACE TO TWA-MAP-ALMSG8.                                     
           MOVE ATT-UNPROT TO MALMSG8A.                                         
                                                                                
           IF MALMSG9L > 0                                                      
              IF MALMSG9O = TWA-MAP-ALMSG9                                      
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MALMSG9O TO TWA-MAP-ALMSG9                                
              END-IF                                                            
           ELSE                                                                 
           IF MALMSG9A = ERASE-KEY                                              
              MOVE SPACE TO TWA-MAP-ALMSG9.                                     
           IF TWA-MAP-ALMSG9 = LOW-VALUE                                        
              MOVE SPACE TO TWA-MAP-ALMSG9.                                     
           MOVE ATT-UNPROT TO MALMSG9A.                                         
                                                                                
           IF TWA-ALERT-ADD                                                     
              IF TWA-MAP-ALMSG = SPACE                                          
                 MOVE -1 TO MALMSG1L                                            
                 IF NOT WK-ERROR                                                
                    SET WK-ERROR TO TRUE                                        
                    MOVE 'ENTER MESSAGE' TO SYSTEM-MSG                          
                 END-IF                                                         
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
           IF TWA-MAP-NEXT = 'W'                                                
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
           MOVE  'W'   TO  ACAT-INP-SEL.                                        
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
      *           NEXT SELECTION WAS NOT ENTERED                       *        
      *----------------------------------------------------------------*        
       1615-SETUP-NEW-SEARCH-SCR.                                               
           MOVE SPACE TO TWA-ADD-MOD-IND.                                       
           INITIALIZE TWA-MAP-AREA.                                             
           INITIALIZE TWA-PREV-ALT-KEY.                                         
           PERFORM 2000-ATTRIB-TO-ASKIP.                                        
           PERFORM 2010-CLEAR-SCR.                                              
           PERFORM 0400-REFRESH-WITH-NEW-ALERT.                                 
           MOVE -1 TO MNEXTL.                                                   
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
              MOVE 'ACAT30AL'    TO ACAT-CALLING-PROG-NAME                      
              MOVE  TWA-MAP-NEXT TO ACAT-NEXT                                   
              PERFORM 7500-XCTL-TO-DETAIL-PROG.                                 
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *           VALIDATE THE SEARCH ENGINED                          *        
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
      *                                                                         
      *----------------------------------------------------------------*        
      *           DELETE ROUTINE                                       *        
      *----------------------------------------------------------------*        
       1700-DELETE-RTN.                                                         
           IF MDELL > 0                                                         
              IF MDELI = TWA-MAP-DEL                                            
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MDELI TO TWA-MAP-DEL                                      
              END-IF                                                            
           ELSE                                                                 
              IF MDELA = ERASE-KEY                                              
                 MOVE SPACES TO TWA-MAP-DEL                                     
              END-IF.                                                           
           IF TWA-MAP-DEL = LOW-VALUE                                           
              MOVE SPACE TO TWA-MAP-DEL.                                        
           MOVE ATT-UNPROT TO MDELA.                                            
                                                                                
           IF TWA-MAP-DEL = SPACE                                               
              CONTINUE                                                          
           ELSE                                                                 
           IF TWA-MAP-DEL = 'Y'                                                 
              MOVE WK-CLT     TO ACAT30-PASS-CLT                                
              MOVE TWA-MAP-BR TO ACAT30-PASS-BRANCH                             
              MOVE TWA-MAP-AC TO ACAT30-PASS-ACCT                               
              SET ACAT30-DEL-ALERT TO TRUE                                      
              PERFORM 7600-LINK-TO-ACAT30DB                                     
              IF ACAT30-NORMAL                                                  
                 MOVE 'N' TO ACAT30-PASS-ALERT-IND                              
                 PERFORM 4700-UPDATE-TRNFR-ALERT-IND                            
                 PERFORM 1800-REFRESH-WITH-NEXT-ACCT                            
              ELSE                                                              
                 SET WK-ERROR TO TRUE                                           
LRM001           MOVE 'DB2 DELETE ERROR ON ALERT TABLE - CALL HELP DESK'        
                   TO  WK-DB2-ERROR                                             
                 PERFORM 0800-SEND-DB2-ERROR-MSG                                
              END-IF                                                            
           ELSE                                                                 
              MOVE -1 TO MDELL                                                  
              MOVE ATT-UNPROT-BRT TO MDELA                                      
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'ENTER "Y" TO DELETE AN ACCOUNT WITH MESSAGE'             
                   TO  SYSTEM-MSG.                                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    AFTER DELETING THE ACCT, DISPLAY THE NEXT AVAILABLE ACCT.   *        
      *----------------------------------------------------------------*        
       1800-REFRESH-WITH-NEXT-ACCT.                                             
           MOVE SPACE TO WS-KEY-FOUND-SW                                        
                         WS-NO-MORE-DATA-SW.                                    
           PERFORM 0500-OPEN-CURSOR-TBL.                                        
           PERFORM 1810-FIND-NEXT-KEY                                           
                UNTIL WS-KEY-FOUND OR WS-NO-MORE-DATA.                          
           IF WS-KEY-FOUND                                                      
              PERFORM 2010-CLEAR-SCR                                            
              PERFORM 0600-SETUP-SCREEN                                         
              PERFORM 0550-CLOSE-CURSOR-TBL                                     
           ELSE                                                                 
           IF WS-NO-MORE-DATA                                                   
              PERFORM 0550-CLOSE-CURSOR-TBL                                     
              MOVE SPACE TO WS-NO-MORE-DATA-SW                                  
              PERFORM 0560-OPEN-CURSOR-DESCEND                                  
              PERFORM 1820-FIND-PREV-KEY                                        
                   UNTIL WS-KEY-FOUND OR WS-NO-MORE-DATA                        
              IF WS-KEY-FOUND                                                   
                 PERFORM 2010-CLEAR-SCR                                         
                 PERFORM 0600-SETUP-SCREEN                                      
                 PERFORM 0580-CLOSE-CURSOR-DESCEND                              
              ELSE                                                              
              IF WS-NO-MORE-DATA                                                
                 PERFORM 0580-CLOSE-CURSOR-DESCEND                              
                 PERFORM 2000-ATTRIB-TO-ASKIP                                   
                 PERFORM 2010-CLEAR-SCR                                         
                 MOVE SPACE TO TWA-ADD-MOD-IND                                  
                               TWA-MAP-AREA                                     
                               TWA-PREV-ALT-KEY                                 
                 MOVE -1 TO MNEXTL                                              
                 SET WK-MSG-ON TO TRUE                                          
                 MOVE 'THERE ARE NO MORE ACCOUNTS TO BE DISPLAYED'              
                   TO  SYSTEM-MSG.                                              
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *    FIND NEXT AVAILABLE ALERT RECORD                            *        
      *----------------------------------------------------------------*        
       1810-FIND-NEXT-KEY.                                                      
           PERFORM 0540-FETCH-CURSOR-TBL.                                       
           IF ACAT30-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              MOVE ACAT30-ALT-CLT    TO WS-KEY-CLT                              
              MOVE ACAT30-ALT-BRANCH TO WS-KEY-BRANCH                           
              MOVE ACAT30-ALT-ACCT   TO WS-KEY-ACCT                             
              IF WS-ALT-KEY > TWA-PREV-ALT-KEY                                  
                 SET WS-KEY-FOUND TO TRUE.                                      
      *                                                                         
      *----------------------------------------------------------------*        
      *    FIND PREVIOUSE AVAILABLE ALERT RECORD                       *        
      *----------------------------------------------------------------*        
       1820-FIND-PREV-KEY.                                                      
           PERFORM 0570-FETCH-CURSOR-DESCEND.                                   
           IF ACAT30-NOT-FOUND                                                  
              SET WS-NO-MORE-DATA TO TRUE                                       
           ELSE                                                                 
              MOVE ACAT30-ALT-CLT    TO WS-KEY-CLT                              
              MOVE ACAT30-ALT-BRANCH TO WS-KEY-BRANCH                           
              MOVE ACAT30-ALT-ACCT   TO WS-KEY-ACCT                             
              IF WS-ALT-KEY < TWA-PREV-ALT-KEY                                  
                 SET WS-KEY-FOUND TO TRUE.                                      
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *             CLEAR SCREEN WITH SPACE                            *        
      *----------------------------------------------------------------*        
       2000-ATTRIB-TO-ASKIP.                                                    
           MOVE ATT-ASKIP TO MBRA                                               
                             MACA                                               
                             MALMSG1A                                           
                             MALMSG2A                                           
                             MALMSG3A                                           
                             MALMSG4A                                           
                             MALMSG5A                                           
                             MALMSG6A                                           
                             MALMSG7A                                           
                             MALMSG8A                                           
                             MALMSG9A                                           
                             MDELA.                                             
      *                                                                         
      *----------------------------------------------------------------*        
      *             CLEAR SCREEN WITH SPACE                            *        
      *----------------------------------------------------------------*        
       2010-CLEAR-SCR.                                                          
           MOVE SPACE TO MBRO                                                   
                         MACO                                                   
                         MRRO                                                   
                         MNAMEO                                                 
                         MADMDO                                                 
                         MNAME2O                                                
                         MALMSG1O                                               
                         MALMSG2O                                               
                         MALMSG3O                                               
                         MALMSG4O                                               
                         MALMSG5O                                               
                         MALMSG6O                                               
                         MALMSG7O                                               
                         MALMSG8O                                               
                         MALMSG9O                                               
                         MNEXTO                                                 
                         MDELO.                                                 
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *         PF1: ADD NEW ACCOUNT ROUTINE                           *        
      *----------------------------------------------------------------*        
       3000-ADD-ACCT-RTN.                                                       
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG                                             
                         ACAT-SEARCH-FIELDS.                                    
           INITIALIZE TWA-ACAT-AREA.                                            
           SET TWA-ALERT-ADD TO TRUE.                                           
           PERFORM 2010-CLEAR-SCR.                                              
           MOVE 'ADD' TO MADMDO TWA-MAP-ADMD.                                   
           MOVE SPACE TO MMBRO                                                  
                         MMACO                                                  
                         MMRRO                                                  
                         MMTFRO                                                 
                         MMRDO                                                  
                         MMBKRO                                                 
                         MMSTATO                                                
                         MMSDO.                                                 
           MOVE ATT-UNPROT TO MBRA                                              
                              MACA                                              
                              MALMSG1A                                          
                              MALMSG2A                                          
                              MALMSG3A                                          
                              MALMSG4A                                          
                              MALMSG5A                                          
                              MALMSG6A                                          
                              MALMSG7A                                          
                              MALMSG8A                                          
                              MALMSG9A.                                         
           MOVE ATT-ASKIP  TO MDELA.                                            
           MOVE -1 TO MBRL.                                                     
           SET WK-MSG-ON TO TRUE.                                               
           MOVE 'ENTER BRANCH' TO SYSTEM-MSG.                                   
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *         PF3: EXIT ADD MODE                                     *        
      *----------------------------------------------------------------*        
       3100-EXIT-ADD-RTN.                                                       
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           IF NOT TWA-ALERT-ADD                                                 
              SET WK-ERROR TO TRUE                                              
              MOVE LOW-VALUE TO ACAT30MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'PF3 KEY CURRENTLY DISABLED'                                 
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
           INITIALIZE TWA-ACAT-AREA.                                            
           PERFORM 2000-ATTRIB-TO-ASKIP.                                        
           PERFORM 2010-CLEAR-SCR.                                              
           PERFORM 0400-REFRESH-WITH-NEW-ALERT.                                 
           MOVE -1 TO MNEXTL.                                                   
       EJECT                                                                    
      *                                                                         
      *----------------------------------------------------------------*        
      *         PF5: UPDATE ALERT MESSAGE TABLE                        *        
      *----------------------------------------------------------------*        
       4000-UPDATE-RTN.                                                         
           IF TWA-ADD-MOD-IND = SPACE                                           
              MOVE -1 TO MNEXTL                                                 
              SET WK-ERROR TO TRUE                                              
              MOVE 'PF5 KEY IS DISABLED AT THIS TIME'                           
                TO  SYSTEM-MSG                                                  
              PERFORM 9000-ERROR-RTN.                                           
                                                                                
           MOVE WK-CLT        TO ACAT30-PASS-CLT.                               
           MOVE TWA-MAP-BR    TO ACAT30-PASS-BRANCH.                            
           MOVE TWA-MAP-AC    TO ACAT30-PASS-ACCT.                              
           MOVE TWA-MAP-RR    TO ACAT30-PASS-RR.                                
           MOVE TWA-MAP-ALMSG TO ACAT30-PASS-MSG-TXT.                           
           MOVE EIBTRMID      TO ACAT30-PASS-TERMID.                            
           MOVE TWA-MAP-ALMSG TO WS-ALERT-MSG.                                  
           PERFORM 4100-COUNT-VARCHAR-LENGTH.                                   
           MOVE TXT-LENGTH TO ACAT30-PASS-MSG-LEN.                              
           IF TWA-ALERT-MOD                                                     
              PERFORM 4500-MODIFY-RTN                                           
           ELSE                                                                 
           IF TWA-ALERT-ADD                                                     
              IF TWA-MAP-ALMSG = SPACE                                          
                 SET WK-ERROR TO TRUE                                           
                 MOVE -1 TO MALMSG1L                                            
                 MOVE 'UPDATE NOT ALLOWED - NO MESSAGE ENTERED'                 
                   TO  SYSTEM-MSG                                               
              ELSE                                                              
                 PERFORM 4600-ADD-RTN.                                          
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *     DETERMINE CHARACTER TEXT LENGTH FOR A VAR CHARACTER       *         
      *---------------------------------------------------------------*         
       4100-COUNT-VARCHAR-LENGTH.                                               
           MOVE +640 TO TXT-LENGTH.                                             
           IF TWA-MAP-ALMSG9 = SPACE                                            
                 MOVE +632 TO TXT-LENGTH.                                       
           IF TWA-MAP-ALMSG9 = SPACE AND                                        
              TWA-MAP-ALMSG8 = SPACE                                            
                 MOVE +553 TO TXT-LENGTH.                                       
           IF TWA-MAP-ALMSG9 = SPACE AND                                        
              TWA-MAP-ALMSG8 = SPACE AND                                        
              TWA-MAP-ALMSG7 = SPACE                                            
                 MOVE +474 TO TXT-LENGTH.                                       
           IF TWA-MAP-ALMSG9 = SPACE AND                                        
              TWA-MAP-ALMSG8 = SPACE AND                                        
              TWA-MAP-ALMSG7 = SPACE AND                                        
              TWA-MAP-ALMSG6 = SPACE                                            
                 MOVE +395 TO TXT-LENGTH.                                       
           IF TWA-MAP-ALMSG9 = SPACE AND                                        
              TWA-MAP-ALMSG8 = SPACE AND                                        
              TWA-MAP-ALMSG7 = SPACE AND                                        
              TWA-MAP-ALMSG6 = SPACE AND                                        
              TWA-MAP-ALMSG5 = SPACE                                            
                 MOVE +316 TO TXT-LENGTH.                                       
           IF TWA-MAP-ALMSG9 = SPACE AND                                        
              TWA-MAP-ALMSG8 = SPACE AND                                        
              TWA-MAP-ALMSG7 = SPACE AND                                        
              TWA-MAP-ALMSG6 = SPACE AND                                        
              TWA-MAP-ALMSG5 = SPACE AND                                        
              TWA-MAP-ALMSG4 = SPACE                                            
                 MOVE +237 TO TXT-LENGTH.                                       
           IF TWA-MAP-ALMSG9 = SPACE AND                                        
              TWA-MAP-ALMSG8 = SPACE AND                                        
              TWA-MAP-ALMSG7 = SPACE AND                                        
              TWA-MAP-ALMSG6 = SPACE AND                                        
              TWA-MAP-ALMSG5 = SPACE AND                                        
              TWA-MAP-ALMSG4 = SPACE AND                                        
              TWA-MAP-ALMSG3 = SPACE                                            
                 MOVE +158 TO TXT-LENGTH.                                       
           IF TWA-MAP-ALMSG9 = SPACE AND                                        
              TWA-MAP-ALMSG8 = SPACE AND                                        
              TWA-MAP-ALMSG7 = SPACE AND                                        
              TWA-MAP-ALMSG6 = SPACE AND                                        
              TWA-MAP-ALMSG5 = SPACE AND                                        
              TWA-MAP-ALMSG4 = SPACE AND                                        
              TWA-MAP-ALMSG3 = SPACE AND                                        
              TWA-MAP-ALMSG2 = SPACE                                            
                 MOVE +79  TO TXT-LENGTH.                                       
           IF TWA-MAP-ALMSG9 = SPACE AND                                        
              TWA-MAP-ALMSG8 = SPACE AND                                        
              TWA-MAP-ALMSG7 = SPACE AND                                        
              TWA-MAP-ALMSG6 = SPACE AND                                        
              TWA-MAP-ALMSG5 = SPACE AND                                        
              TWA-MAP-ALMSG4 = SPACE AND                                        
              TWA-MAP-ALMSG3 = SPACE AND                                        
              TWA-MAP-ALMSG2 = SPACE AND                                        
              TWA-MAP-ALMSG1 = SPACE                                            
                 MOVE +0   TO TXT-LENGTH.                                       
                                                                                
           MOVE SPACE TO LENGTH-DETERMINED-SW.                                  
           PERFORM UNTIL LENGTH-DETERMINED                                      
              IF TXT-LENGTH > 0                                                 
                 IF WS-ALERT-MSG-TXT (TXT-LENGTH) = SPACE                       
                    SUBTRACT 1 FROM TXT-LENGTH                                  
                 ELSE                                                           
                    SET LENGTH-DETERMINED TO TRUE                               
                 END-IF                                                         
              ELSE                                                              
                 SET LENGTH-DETERMINED TO TRUE                                  
              END-IF                                                            
           END-PERFORM.                                                         
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *              MODIFY ALERT MESSAGE RECORD                      *         
      *---------------------------------------------------------------*         
       4500-MODIFY-RTN.                                                         
           SET ACAT30-UPD-ALERT TO TRUE.                                        
           PERFORM 7600-LINK-TO-ACAT30DB.                                       
           IF ACAT30-NORMAL                                                     
              SET WK-MSG-ON TO TRUE                                             
              MOVE 'ACCOUNT UPDATED SUCCESSFULLY'                               
                TO  SYSTEM-MSG                                                  
           ELSE                                                                 
           IF ACAT30-NOT-FOUND                                                  
              SET WK-ERROR TO TRUE                                              
              MOVE 'UPDATE FAILED - THE ACCOUNT ALREADY DELETED BY SYSTE        
      -            'M OR OTHER USER'                                            
                TO  SYSTEM-MSG                                                  
           ELSE                                                                 
           IF ACAT30-ERROR                                                      
LRM001        MOVE 'DB2 UPDATE ERROR ON ALERT TABLE - CALL HELP DESK'           
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *              ADD NEW ACCOUNT WITH MESSAGE                     *         
      *---------------------------------------------------------------*         
       4600-ADD-RTN.                                                            
           SET ACAT30-CNT-ALERT TO TRUE.                                        
           PERFORM 7600-LINK-TO-ACAT30DB.                                       
           IF ACAT30-FOUND                                                      
              IF NOT WK-ERROR                                                   
                 SET WK-ERROR TO TRUE                                           
                 MOVE 'UPDATE FAILED - ACCOUNT ALREADY ADDED BY OTHER US        
      -               'ER'                                                      
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
              MOVE -1 TO MBRL                                                   
              MOVE ATT-UNPROT-BRT TO MBRA MACA                                  
           ELSE                                                                 
           IF ACAT30-NOT-FOUND                                                  
              SET ACAT30-INS-ALERT TO TRUE                                      
              PERFORM 7600-LINK-TO-ACAT30DB                                     
              IF ACAT30-NORMAL                                                  
                 MOVE 'Y' TO ACAT30-PASS-ALERT-IND                              
                 PERFORM 4700-UPDATE-TRNFR-ALERT-IND                            
                 PERFORM 3000-ADD-ACCT-RTN                                      
                 MOVE 'NEW ACCOUNT IS UPDATED SUCCESSFULLY - ENTER BRANC        
      -               'H FOR THE NEXT ACCOUNT'                                  
                   TO  SYSTEM-MSG                                               
              ELSE                                                              
              IF ACAT30-ERROR                                                   
LRM001           MOVE 'DB2 INSERT ERROR ON ALERT TABLE - CALL HELP DESK'        
                   TO  WK-DB2-ERROR                                             
                 PERFORM 0800-SEND-DB2-ERROR-MSG                                
              END-IF                                                            
              END-IF                                                            
           ELSE                                                                 
           IF ACAT30-ERROR                                                      
LRM001        MOVE 'DB2 SELECT COUNT ERROR - CALL HELP DESK'                    
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG.                                  
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *    UPDATE ALERT INDICATOR OF TRANSFER TABLE                   *         
      *    - WHEN ADDED, SET INDICATOR TO 'Y'                         *         
      *    - WHEN DELETED, SET INDICATOR TO SPACE                     *         
      *---------------------------------------------------------------*         
       4700-UPDATE-TRNFR-ALERT-IND.                                             
           SET ACAT30-CNT-TRNFR  TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT30DB.                                       
           IF ACAT30-ERROR                                                      
LRM001        MOVE 'DB2 COUNT ERROR ON TRANSFER TABLE - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              PERFORM 0800-SEND-DB2-ERROR-MSG                                   
           ELSE                                                                 
           IF ACAT30-FOUND                                                      
              SET ACAT30-UPD-TRNFR  TO TRUE                                     
              PERFORM 7600-LINK-TO-ACAT30DB                                     
              IF ACAT30-ERROR                                                   
LRM001           MOVE                                                           
LRM001           'DB2 UPDATE ERROR ON TRANSFER TABLE - CALL HELP DESK'          
                   TO  WK-DB2-ERROR                                             
                 PERFORM 0800-SEND-DB2-ERROR-MSG                                
              END-IF.                                                           
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *          PF7:  PREVIOUSE PAGE                                 *         
      *---------------------------------------------------------------*         
       5000-PREV-ACCT-RTN.                                                      
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           IF NOT TWA-ALERT-MOD                                                 
              SET WK-ERROR TO TRUE                                              
              MOVE LOW-VALUE TO ACAT30MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'FIRST PAGE'                                                 
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE SPACE TO WS-KEY-FOUND-SW                                        
                         WS-NO-MORE-DATA-SW.                                    
           PERFORM 0560-OPEN-CURSOR-DESCEND.                                    
           PERFORM 1820-FIND-PREV-KEY                                           
                UNTIL WS-KEY-FOUND OR WS-NO-MORE-DATA.                          
           IF WS-KEY-FOUND                                                      
              PERFORM 2010-CLEAR-SCR                                            
              PERFORM 0600-SETUP-SCREEN                                         
           ELSE                                                                 
           IF WS-NO-MORE-DATA                                                   
              SET WK-MSG-ON TO TRUE                                             
              MOVE 'FIRST PAGE' TO SYSTEM-MSG.                                  
           PERFORM 0580-CLOSE-CURSOR-DESCEND.                                   
           MOVE -1 TO MNEXTL.                                                   
       EJECT                                                                    
      *                                                                         
      *---------------------------------------------------------------*         
      *           PF8:    NEXT PAGE                                   *         
      *---------------------------------------------------------------*         
       5100-NEXT-ACCT-RTN.                                                      
           MOVE SPACE TO WK-ERROR-SW                                            
                         WK-MSG-ON-SW                                           
                         SYSTEM-MSG.                                            
           IF NOT TWA-ALERT-MOD                                                 
              SET WK-ERROR TO TRUE                                              
              MOVE LOW-VALUE TO ACAT30MO                                        
              MOVE -1 TO MNEXTL                                                 
              MOVE 'LAST PAGE'                                                  
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE SPACE TO WS-KEY-FOUND-SW                                        
                         WS-NO-MORE-DATA-SW.                                    
           PERFORM 0500-OPEN-CURSOR-TBL.                                        
           PERFORM 1810-FIND-NEXT-KEY                                           
                UNTIL WS-KEY-FOUND OR WS-NO-MORE-DATA.                          
           IF WS-KEY-FOUND                                                      
              PERFORM 2010-CLEAR-SCR                                            
              PERFORM 0600-SETUP-SCREEN                                         
           ELSE                                                                 
           IF WS-NO-MORE-DATA                                                   
              SET WK-MSG-ON TO TRUE                                             
              MOVE 'LAST PAGE' TO SYSTEM-MSG.                                   
           PERFORM 0550-CLOSE-CURSOR-TBL.                                       
           MOVE -1 TO MNEXTL.                                                   
       EJECT                                                                    
      *                                                                         
      *-----------------------------------------------------------*             
      *    CHECK SIGN-ON SECURITY BEFORE JUMPING TO NEXT SCREEN   *             
      *-----------------------------------------------------------*             
       6000-SCREEN-SECURITY-CHECK.                                              
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
               PERFORM 6100-CALL-SECLINK-RTN                            AEISAC07
               IF SECLINK-RETURN-CODE = '00' OR '20'                    AEISAC07
                  SET ACAT-SIGN-ON-UPDATE TO TRUE                               
                  MOVE SECLINK-USER-ID TO ACAT-SIGN-ON-ID                       
               ELSE                                                             
                  SET ACAT-BROWSE-MODE TO TRUE                                  
                  MOVE SPACES    TO SECLINK-LIST                        AEISAC07
                  MOVE '2'       TO SECLINK-ACTION-CODE                 AEISAC07
                  MOVE 'SCON'    TO SECLINK-TYPE                                
                  MOVE ACAT-SEC-LIT TO SECLINK-ITEM                             
                  PERFORM 6100-CALL-SECLINK-RTN                         AEISAC07
                  IF SECLINK-RETURN-CODE = '00' OR '20'                 AEISAC07
                     MOVE SPACE TO ACAT-SIGN-ON-SEC-FLAG                        
                  ELSE                                                          
                     MOVE 'USER NOT AUTHORIZED TO USE NEXT SELECTION '  AEISAC07
                          TO SYSTEM-MSG                                 AEISAC07
                     MOVE ACAT-NEXT                                     AEISAC07
                          TO SYSTEM-MSG(44 : 1)                         AEISAC07
                     MOVE -1              TO MNEXTL                             
                     MOVE ATT-UNPROT-BRT  TO MNEXTA                             
                     SET WK-ERROR         TO TRUE                               
                     SET WK-MSG-ON        TO TRUE                               
                     MOVE 'ACAT30AL' TO ACAT-PROGRAM-NAME                       
                     MOVE 'W'        TO ACAT-NEXT                               
                     MOVE  SPACE     TO ACAT-CALLING-PROG-NAME                  
                     PERFORM 9000-ERROR-RTN                                     
                  END-IF                                                        
               END-IF                                                           
           END-IF.                                                              
      *                                                                         
       6100-CALL-SECLINK-RTN.                                           AEISAC07
           EXEC CICS LINK PROGRAM ('SECLINK')                           AEISAC07
                COMMAREA(SECLINK-LIST)                                          
                LENGTH(LENGTH OF SECLINK-LIST)                          AEISAC07
           END-EXEC.                                                            
                                                                                
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
              MOVE LOW-VALUE TO ACAT30MO                                        
              MOVE 'ACAT30AL READ TSQ ERROR'                                    
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
              MOVE LOW-VALUE TO ACAT30MO                                        
              MOVE 'ACAT30AL WRITE TSQ ERROR'                                   
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
           PERFORM 6000-SCREEN-SECURITY-CHECK.                                  
           EXEC CICS XCTL                                                       
                  PROGRAM(CALLED-PROGRAM-NAME)                                  
                  COMMAREA(ACATCOMM-COMMAREA)                                   
                  LENGTH(LENGTH OF ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
      *                                                                         
      *-------------------------------------------------------------*           
      *            CALL DB2 I/O MODULE ACAT30DB                     *           
      *-------------------------------------------------------------*           
       7600-LINK-TO-ACAT30DB.                                                   
           EXEC CICS LINK                                                       
                     PROGRAM('ACAT30DB')                                        
                     COMMAREA(ACAT30IO-COMMAREA)                                
                     LENGTH(LENGTH OF ACAT30IO-COMMAREA)                        
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
       7900-LINK-TO-ACATNAIO.                                                   
           EXEC CICS LINK PROGRAM (WS-ACATNAIO)                         02890002
                COMMAREA(ACATNAIO-CALL-AREA)                            02900002
                LENGTH(LENGTH OF ACATNAIO-CALL-AREA)                    02910002
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
           EXEC CICS SEND MAP('ACAT30M')                                        
                     MAPSET('ACAT30M')                                          
                     FROM(ACAT30MO)                                             
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
               EXEC CICS SEND MAP('ACAT30M')                                    
                         MAPSET('ACAT30M')                                      
                         FROM(ACAT30MO)                                         
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
           EXEC CICS RECEIVE MAP('ACAT30M')                                     
                             MAPSET('ACAT30M')                                  
                             FROM(ACAT-RECEIVE-MAP)                             
                             INTO(ACAT30MI)                                     
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
