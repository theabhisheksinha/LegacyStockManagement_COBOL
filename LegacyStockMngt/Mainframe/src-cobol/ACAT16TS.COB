000001* PDX    - ACAT16TS C0250441 06/25/07 14:32:35 TBLAMUR            00001000
000001* LRM001 - SSR 53075 SPIN-OFF CHANGES                                     
000001* PDX    - ACAT16TS C0179784 09/26/02 14:36:57 TBEDTAK            00001000
000001* PDX    - ACAT16TS C0160324 06/25/01 08:33:11 TBLAMUR            00001000
000001* PDX    - ACAT16TS C0123136 04/08/99 11:22:28 TBEDTAK            00001000
000001* PDX    - ACAT16TS C0122848 03/09/99 14:37:05 TBEDTAK            00001000
000001* PDX    - ACAT16TS C0120330 01/28/99 17:14:16 TBCHLUO            00001000
000001* PDX    - ACAT16TS C0117777 12/09/98 11:25:03 TBEDTAK            00001000
000001* PDX    - ACAT16TS C0109165 07/28/98 09:41:37 TBEDTAK            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT16TS.                                                 
       AUTHOR.  E.TAKAESU.                                                      
      *REMARKS.                                                                 
      *****************************************************************         
      *      DELIVERER OUTGOING TRANSFER REJECTED BY THE SYSTEM       *         
      *****************************************************************         
      *  DATABASE:                                                    *         
      *  - VTRNSFR  (TRANSFER)                                        *         
      *  PURPOSE:                                                     *         
      *  - THE PURPOSE OF THE PROGRAM IS TO DISPLAY 'FUL' OR 'PTR'    *         
      *    REJECTED TRANSFER THAT IS IN 'RQR' OR 'REJ' STATUS, AND    *         
      *    TRNFR_TYPE_RJCT_CD = '01' TO '09' AND DSTBN_SIDE_CD = 'D'. *         
      *  - PF7 & PF8 KEYS ARE USED TO PAGING FOWRWARS AND BACKWARDS.  *         
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
       77  TWA-SIZE                       PIC S9(4) COMP.                       
       77  ACATVR-DATASET                 PIC X(08) VALUE 'ACATIT'.             
       77  WS-EDITMOD                     PIC X(08) VALUE 'EDITMOD2'.           
       77  CURR-EDIT-LEN                  PIC S9(4) COMP  VALUE +35.            
      *                                                                         
       01  TSQ-WORK-AREA.                                                       
           05  TSQ-NAME.                                                        
               09 TERM-ID                     PIC X(04).                        
               09 TRAN-ID                     PIC X(04).                        
           05  ITEM-NUM                       PIC S9(04) COMP VALUE +1.         
      *                                                                         
       01  WSWORKAREA.                                                          
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
      *                                                                         
       01  WS-SWITCH-AREA.                                                      
           05  WK-ERROR-SW                PIC X(01) VALUE SPACE.                
               88  WK-ERROR                         VALUE 'Y'.                  
           05  WS-VALID-FETCH-SW          PIC X(01) VALUE SPACE.                
               88  VALID-FETCH                      VALUE 'Y'.                  
           05  WS-NO-MORE-DATA-SW         PIC X(01) VALUE SPACE.                
               88  NO-MORE-DATA                     VALUE 'N'.                  
           05  WS-SEARCH-CHANGED-SW       PIC X(01) VALUE SPACE.                
               88  WS-SEARCH-CHANGED                VALUE 'Y'.                  
           05  WS-ACCT-FOUND-SW           PIC X(01) VALUE SPACE.                
               88  WS-ACCT-FOUND                    VALUE 'A'.                  
               88  WS-NEXT-ACCT-FOUND               VALUE 'B'.                  
               88  WS-PREV-ACCT-FOUND               VALUE 'C'.                  
      *                                                                         
       01  ACAT-WORK-AREA.                                                      
           05  WS-SS-NUM.                                                       
               09  WS-SS-NUM1             PIC X(03).                            
               09  FILLER                 PIC X(01) VALUE '-'.                  
               09  WS-SS-NUM2             PIC X(02).                            
               09  FILLER                 PIC X(01) VALUE '-'.                  
               09  WS-SS-NUM3             PIC X(04).                            
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
           05  WS-NOT-RESUBMIT-MSG.                                             
               09  FILLER                 PIC X(40)                             
               VALUE 'RESUBMIT NOT ALLOWED - TRANSFER TYPE IS '.                
               09  WS-TFR-TYPE            PIC X(03).                            
           05  UNAUTH-MESSAGE             PIC X(79)                             
               VALUE 'UNAUTHORIZED USER.'.                                      
           05  SEC-MESSAGE                PIC X(79)                             
               VALUE 'SIGN ON SECURITY NOT AVAILABLE, TRY AGAIN.'.              
           05  ERROR-PROG-MSG.                                                  
               09  ERROR-PROG-NAME        PIC X(08).                            
               09  FILLER                 PIC X(71)                             
                   VALUE ' PROGRAM NOT AVAILIABLE.'.                            
           05  WS-DLVR-NBR-ACCT.                                                
               09  WS-DLVR-BR             PIC X(03).                            
               09  WS-DLVR-ACCT           PIC X(05).                            
               09  WS-DLVR-MASK           PIC X(12).                            
           05  WS-BR-MASK.                                                      
               09  WS-BRANCH-MASK         PIC X(03).                            
               09  FILLER                 PIC X(01) VALUE '%'.                  
           05  SAVE-INTRAN-FLAG           PIC X(01).                            
           05  PREV-INTRAN-FLAG           PIC X(01).                            
           05  WS-ACAT-NEXT               PIC X.                                
           05  WS-INIT-TFR-ROWS           PIC 9(03).                            
           05  LINE-COUNT                 PIC 9(03).                            
           05  SUB                        PIC S9(09) COMP-3.                    
           05  SUB1                       PIC S9(09) COMP-3.                    
           05  IDX                        PIC S9(03) COMP-3.                    
           05  C-IDX                      PIC S9(03) COMP-3.                    
           05  ROW-CNT                    PIC S9(09) COMP-3.                    
           05  WS-LOOP-CNT                PIC S9(09) COMP-3.                    
           05  WS-VALUE                   PIC S9(09) COMP-3.                    
           05  WS-REMAINDER               PIC S9(03) COMP-3.                    
           05  WS-SORT-KEY-NBR.                                                 
               09  WS-SORT-CLT            PIC X(04).                            
               09  WS-SORT-DLVR-NBR       PIC X(04).                            
               09  WS-SORT-DLVR-ACCT      PIC X(20).                            
               09  WS-SORT-RCV-NBR        PIC X(04).                            
               09  WS-SORT-RCV-ACCT       PIC X(20).                            
               09  WS-SORT-ACAT           PIC X(14).                            
      *                                                                         
       01  WS-REJECT-CODE-DESC.                                                 
           03  WS-REJECT-DESCRIPTION.                                           
               05  FILLER                      PIC X(32) VALUE                  
                  '01SS# TAX ID MISMATCH           '.                           
               05  FILLER                      PIC X(32) VALUE                  
                  '02ACCOUNT TITLE MISMATCH        '.                           
               05  FILLER                      PIC X(32) VALUE                  
                  '03DOCUMENTATION NEEDED          '.                           
               05  FILLER                      PIC X(32) VALUE                  
                  '04ACCOUNT FLAT                  '.                           
               05  FILLER                      PIC X(32) VALUE                  
                  '05INVALID ACCOUNT NUMBER        '.                           
               05  FILLER                      PIC X(32) VALUE                  
                  '06DUPLICATE                     '.                           
               05  FILLER                      PIC X(32) VALUE                  
                  '07ACCT IN DISTRIBUTION/TRANSFER '.                           
               05  FILLER                      PIC X(32) VALUE                  
                  '08CLIENT RESCINDED              '.                           
               05  FILLER                      PIC X(32) VALUE                  
                  '09MISSING AUTHORIZATION SIGNATUR'.                           
               05  FILLER                      PIC X(32) VALUE                  
                  '21VIOLATES CR POLICY OF RCV FIRM'.                           
               05  FILLER                      PIC X(32) VALUE                  
                  '22UNRECOGNIZED RESIDUAL CR BAL  '.                           
               05  FILLER                      PIC X(32) VALUE                  
                  '23PARTIAL TFR (DELVR INITIATED) '.                           
               05  FILLER                      PIC X(32) VALUE                  
                  '24FAIL REVERSAL REJECT          '.                           
               05  FILLER                      PIC X(32) VALUE                  
                  '25RECLAIM REJECT                '.                           
               05  FILLER                      PIC X(32) VALUE                  
                  '26CUSTODY RE-DELIVERY REJECT    '.                           
           03  FILLER    REDEFINES    WS-REJECT-DESCRIPTION.                    
               05  WS-REJECT-DESC-TBL      OCCURS  15 TIMES                     
                                           INDEXED BY  RJCT-IX.                 
                   07  WS-REJECT-CD            PIC X(02).                       
                   07  WS-REJECT-DESC          PIC X(30).                       
       01  ACAT16IO-COMMAREA.                                                   
       COPY ACAT16IO.                                                           
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
       COPY ACAT16M.                                                            
       01  ACAT16MR REDEFINES ACAT16MI.                                         
           02  FILLER                         PIC X(12).                        
           02  SCR-DISPLAY        OCCURS 2 TIMES.                               
               03  BRANCH-L                   PIC S9(4) COMP.                   
               03  BRANCH-A                   PIC X(01).                        
               03  BRANCH-O                   PIC X(03).                        
               03  ACCT-L                     PIC S9(4) COMP.                   
               03  ACCT-A                     PIC X(01).                        
               03  ACCT-O                     PIC X(05).                        
               03  RR-L                       PIC S9(4) COMP.                   
               03  RR-A                       PIC X(01).                        
               03  RR-O                       PIC X(03).                        
               03  CUST-TYPE-L                PIC S9(4) COMP.                   
               03  CUST-TYPE-A                PIC X(01).                        
               03  CUST-TYPE-O                PIC X(02).                        
               03  CONT-BRKR-L                PIC S9(4) COMP.                   
               03  CONT-BRKR-A                PIC X(01).                        
               03  CONT-BRKR-O                PIC X(04).                        
               03  CONT-ACCT-L                PIC S9(4) COMP.                   
               03  CONT-ACCT-A                PIC X(01).                        
               03  CONT-ACCT-O                PIC X(20).                        
               03  NAME1-L                    PIC S9(4) COMP.                   
               03  NAME1-A                    PIC X(01).                        
               03  NAME1-O                    PIC X(30).                        
               03  SS-NUM1-L                  PIC S9(4) COMP.                   
               03  SS-NUM1-A                  PIC X(01).                        
               03  SS-NUM1-O                  PIC X(11).                        
               03  NAME2-L                    PIC S9(4) COMP.                   
               03  NAME2-A                    PIC X(01).                        
               03  NAME2-O                    PIC X(30).                        
               03  SS-NUM2-L                  PIC S9(4) COMP.                   
               03  SS-NUM2-A                  PIC X(01).                        
               03  SS-NUM2-O                  PIC X(11).                        
               03  TFR-TYPE-L                 PIC S9(4) COMP.                   
               03  TFR-TYPE-A                 PIC X(01).                        
               03  TFR-TYPE-O                 PIC X(03).                        
               03  ACAT-L                     PIC S9(4) COMP.                   
               03  ACAT-A                     PIC X(01).                        
               03  ACAT-O                     PIC X(14).                        
               03  REJ-CODE-L                 PIC S9(4) COMP.                   
               03  REJ-CODE-A                 PIC X(01).                        
               03  REJ-CODE-O                 PIC X(02).                        
               03  REJ-DESC-L                 PIC S9(4) COMP.                   
               03  REJ-DESC-A                 PIC X(01).                        
               03  REJ-DESC-O                 PIC X(30).                        
               03  CMNT1-L                    PIC S9(4) COMP.                   
               03  CMNT1-A                    PIC X(01).                        
               03  CMNT1-O                    PIC X(60).                        
               03  CMNT2-L                    PIC S9(4) COMP.                   
               03  CMNT2-A                    PIC X(01).                        
               03  CMNT2-O                    PIC X(60).                        
           02  FILLER                         PIC X(04).                        
            EJECT                                                               
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
           03  FILLER                    PIC X(2000).                           
                                                                                
       COPY TWACOMMN.                                                           
           03  TWA-ACAT-AREA.                                                   
               05  TWA-B1-COUNTRY               PIC X(03).                      
               05  TWA-ACAT-NOT-FOUND-FLAG      PIC X(01).                      
                   88  TWA-ACAT-NOT-FOUND                VALUE 'Y'.             
               05  TWA-CONFIRM-FLAG             PIC X(01).                      
                   88  TWA-CONFIRM                       VALUE 'Y'.             
               05  TWA-INTRAN-FLAG              PIC X(01).                      
                   88  TWA-INTRAN-BRW                    VALUE 'B'.             
                   88  TWA-INTRAN-UPDATE                 VALUE 'U'.             
                   88  TWA-INTRAN-ACT                    VALUE 'T'.             
                   88  TWA-INTRAN-NO-CHANGE              VALUE 'N'.             
               05  TWA-SCR-ACCT-LINE            PIC 9(04).                      
               05  TWA-DLVR-NBR  OCCURS 2 TIMES PIC X(04).                      
               05  TWA-SAVE-SORT-KEY-1.                                         
                   07 TWA-SAVE-CLT-1            PIC X(04).                      
                   07 TWA-SAVE-DLVR-NBR-1       PIC X(04).                      
                   07 TWA-SAVE-DLVR-ACCT-1      PIC X(20).                      
                   07 TWA-SAVE-RCV-NBR-1        PIC X(04).                      
                   07 TWA-SAVE-RCV-ACCT-1       PIC X(20).                      
                   07 TWA-SAVE-ACAT-1           PIC X(14).                      
               05  TWA-SAVE-SORT-KEY-2.                                         
                   07 TWA-SAVE-CLT-2            PIC X(04).                      
                   07 TWA-SAVE-DLVR-NBR-2       PIC X(04).                      
                   07 TWA-SAVE-DLVR-ACCT-2      PIC X(20).                      
                   07 TWA-SAVE-RCV-NBR-2        PIC X(04).                      
                   07 TWA-SAVE-RCV-ACCT-2       PIC X(20).                      
                   07 TWA-SAVE-ACAT-2           PIC X(14).                      
               05  TWA-SRCH-SAVE.                                               
                   07  TWA-SRCH-BR              PIC X(03).                      
                   07  TWA-SRCH-AC              PIC X(05).                      
                   07  TWA-SRCH-RR              PIC X(03).                      
                   07  TWA-SRCH-TFR             PIC X(03).                      
                   07  TWA-SRCH-RD              PIC X(01).                      
                   07  TWA-SRCH-BKR             PIC X(04).                      
                   07  TWA-SRCH-STTS            PIC X(03).                      
                   07  TWA-SRCH-SD              PIC X(05).                      
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
              MOVE LOW-VALUE TO ACAT16MO                                        
              MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO SYSTEM-MSG             
              PERFORM  9000-ERROR-RTN.                                          
                                                                                
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                          
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
                                                                                
       MAIN-PROCESSING.                                                         
           INITIALIZE ACAT16IO-COMMAREA.                                        
           MOVE EIBTRMID TO TERM-ID.                                            
           MOVE EIBTRNID TO TRAN-ID.                                            
           MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                               
           MOVE 'N'           TO END-OF-DATA-FLAG.                              
           MOVE SPACES        TO SYSTEM-MSG.                                    
           MOVE 0             TO WK-SUSPEND-COUNT.                              
           MOVE 0             TO WK-CURSOR.                                     
           MOVE 0             TO LINE-COUNT.                                    
           MOVE LOW-VALUE     TO HDRMAPO                                        
                                 ACAT16MO.                                      
           PERFORM 0100-GET-DATE-AND-TIME.                                      
           MOVE  DFHCOMMAREA     TO  ACATCOMM-COMMAREA.                         
           MOVE  TWA-CLIENT-NO-X TO WK-CLT-NBR.                                 
           MOVE  WK-CLT          TO  ACAT16IO-PASS-CLT.                         
      *    IF  ACAT-CALLING-PROG-NAME = 'ACAT16TS'                              
      *        PERFORM RETURN-FROM-DETAIL-RTN                                   
      *    END-IF.                                                              
                                                                                
      *    IF  EIBAID = DFHPF10                                                 
      *    AND ACAT-CALLING-PROG-NAME = 'ACAT16TS'                              
      *        MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
      *        PERFORM BROWSING-RTN                                             
      *    ELSE                                                                 
           MOVE SPACES TO ACAT-CALLING-PROG-NAME                                
           IF  ACAT-PROGRAM-NAME = 'ACAT16TS'                                   
               PERFORM 1000-CONTINUE-PROCESS                                    
      *    ELSE                                                                 
      *    IF  ACAT-PROGRAM-NAME = 'RATT01  '                                   
      *        PERFORM 7000-READ-TSQ-RTN                                        
      *        PERFORM 7100-DELETE-TSQ-RTN                                      
      *        PERFORM BROWSING-RTN                                             
           ELSE                                                                 
               MOVE 'ACAT16TS' TO ACAT-PROGRAM-NAME                             
               PERFORM 0200-FIRST-TIME-THRU.                                    
                                                                                
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
      *         FIRST TIME ROUTINE                                   *          
      *--------------------------------------------------------------*          
       0200-FIRST-TIME-THRU.                                                    
           PERFORM 7100-DELETE-TSQ-RTN.                                         
           SET FIRST-TIME TO TRUE.                                              
           MOVE 'P' TO ACAT-NEXT.                                               
           PERFORM 0300-SETUP-MAP-RETURN.                                       
      *                                                                         
      *--------------------------------------------------------------*          
      *          SETUP SCREEN AND RETURN TO CONTROL PROGRAM          *          
      *--------------------------------------------------------------*          
       0300-SETUP-MAP-RETURN.                                                   
           PERFORM 0500-SETUP-SCR.                                              
           PERFORM 0800-SAVE-SRCH-ENGINE.                                       
           PERFORM 7200-WRITE-TSQ-RTN.                                          
           IF FIRST-TIME                                                        
              PERFORM 8000-SEND-MAP-ERASE                                       
           ELSE                                                                 
              PERFORM 8100-SEND-MAP-DATA-ONLY.                                  
           PERFORM 8800-RETURN-TO-CICS.                                         
                                                                                
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         SETUP SCREEN                                         *          
      *--------------------------------------------------------------*          
       0500-SETUP-SCR.                                                          
           PERFORM 0510-CLEAR-SCREEN                                            
              VARYING SUB FROM 1 BY 1 UNTIL SUB > 2.                            
           IF FIRST-TIME                                                        
              MOVE ATT-UNPROT          TO MMBRA                                 
                                          MMACA                                 
                                          MMRRA                                 
                                          MMBKRA                                
              MOVE ACAT-INP-BRANCH     TO MMBRO                                 
              MOVE ACAT-INP-ACCOUNT    TO MMACO                                 
              MOVE ACAT-INP-RR         TO MMRRO                                 
              MOVE ACAT-INP-CONTRA-BKR TO MMBKRO                                
              MOVE ACAT-INP-TFR-TYP    TO MMTFRO                                
              MOVE ACAT-INP-RCV-DEL    TO MMRDO                                 
              MOVE ACAT-INP-STATUS     TO MMSTATO                               
              MOVE ACAT-INP-STTL-DT    TO MMSDO                                 
              IF ACAT-SEARCH-FIELDS NOT = SPACE                                 
                 PERFORM 2400-VALIDATE-SRCH-ENGINE                              
                 IF WK-ERROR                                                    
                    GO TO 0500-EXIT                                             
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
           MOVE 0 TO TWA-SCR-ACCT-LINE.                                         
           PERFORM  0520-OPEN-CSR-TBL.                                          
           PERFORM VARYING SUB FROM 1 BY 1                                      
             UNTIL  SUB > 2  OR  NO-MORE-DATA                                   
                 PERFORM  0530-FETCH-CSR-TBL                                    
                 IF ACAT16IO-NORMAL   AND                                       
                     SRCH-SIGNON-SECR-CHECK-PASS                                
                    PERFORM 0600-SETUP-ACCT-INFO                                
                 ELSE                                                           
                    SUBTRACT 1 FROM SUB                                         
                 END-IF                                                         
           END-PERFORM.                                                         
           IF  LINE-COUNT = 0                                                   
               SET WK-ERROR   TO TRUE                                           
               MOVE 'NO REJECTED TRANSFER ACCOUNTS FOUND'                       
                 TO  SYSTEM-MSG.                                                
           MOVE  -1  TO MNEXTL.                                                 
      *                                                                         
           PERFORM  0550-CLOSE-CSR-TBL.                                         
       0500-EXIT.                                               EXIT.           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         CLEAR MAP                                            *          
      *--------------------------------------------------------------*          
       0510-CLEAR-SCREEN.                                                       
           MOVE SPACE TO BRANCH-O    (SUB)                                      
                         ACCT-O      (SUB)                                      
                         RR-O        (SUB)                                      
                         CUST-TYPE-O (SUB)                                      
                         CONT-BRKR-O (SUB)                                      
                         CONT-ACCT-O (SUB)                                      
                         NAME1-O     (SUB)                                      
                         SS-NUM1-O   (SUB)                                      
                         NAME2-O     (SUB)                                      
                         SS-NUM2-O   (SUB)                                      
                         TFR-TYPE-O  (SUB)                                      
                         ACAT-O      (SUB)                                      
                         REJ-CODE-O  (SUB)                                      
                         REJ-DESC-O  (SUB)                                      
                         CMNT1-O     (SUB)                                      
                         CMNT2-O     (SUB).                                     
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         OPEN CURSOR TABLE                                    *          
      *--------------------------------------------------------------*          
       0520-OPEN-CSR-TBL.                                                       
           MOVE SPACE  TO ACAT16IO-PASS-DLVR-ACCT.                              
           IF ACAT-INP-BRANCH > SPACE                                           
              IF ACAT-INP-ACCOUNT > SPACE                                       
                 MOVE ACAT-INP-BRANCH  TO WS-DLVR-BR                            
                 MOVE ACAT-INP-ACCOUNT TO WS-DLVR-ACCT                          
                 MOVE SPACE            TO WS-DLVR-MASK                          
                 MOVE WS-DLVR-NBR-ACCT TO ACAT16IO-PASS-DLVR-ACCT               
              ELSE                                                              
                 MOVE ACAT-INP-BRANCH  TO WS-DLVR-BR                            
                 MOVE SPACE            TO WS-DLVR-ACCT WS-DLVR-MASK             
                 MOVE WS-DLVR-NBR-ACCT TO ACAT16IO-PASS-DLVR-ACCT               
              END-IF.                                                           
                                                                                
           IF ACAT-INP-CONTRA-BKR > SPACE                                       
              MOVE ACAT-INP-CONTRA-BKR TO ACAT16IO-PASS-BRKR                    
           ELSE                                                                 
              MOVE ALL '%' TO ACAT16IO-PASS-BRKR.                               
                                                                                
           IF ACAT-INP-RR > SPACE                                               
              MOVE ACAT-INP-RR TO ACAT16IO-PASS-RR                              
           ELSE                                                                 
              MOVE ALL '%'     TO ACAT16IO-PASS-RR.                             
                                                                                
           IF ACAT-INP-TFR-TYP > SPACE                                          
              IF ACAT-INP-TFR-TYP = 'STD'                                       
                 MOVE 'FUL'         TO ACAT16IO-PASS-TRNFR1                     
                                       ACAT16IO-PASS-TRNFR2                     
              ELSE                                                              
                 MOVE ACAT-INP-TFR-TYP TO ACAT16IO-PASS-TRNFR1                  
                                          ACAT16IO-PASS-TRNFR2                  
              END-IF                                                            
           ELSE                                                                 
              MOVE 'FUL'   TO ACAT16IO-PASS-TRNFR1                              
              MOVE 'PTR'   TO ACAT16IO-PASS-TRNFR2.                             
                                                                                
           SET ACAT16IO-O-TFRCSR TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT16DB.                                       
           IF ACAT16IO-ERROR                                                    
              SET WK-ERROR TO TRUE                                              
LRM001        MOVE 'INITIAL TRANSFER TABLE OPEN ERROR - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              MOVE ACAT16IO-SQLCODE TO WK-ERR-SQLCODE                           
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *        FETCH CURSOR TABLE                                    *          
      *--------------------------------------------------------------*          
       0530-FETCH-CSR-TBL.                                                      
           SET ACAT16IO-F-TFRCSR TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT16DB.                                       
           IF ACAT16IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT16IO-NOT-FOUND                                                
              SET NO-MORE-DATA TO TRUE                                          
           ELSE                                                                 
              SET WK-ERROR TO TRUE                                              
LRM001        MOVE 'INITIAL TRANSFER TABLE FETCH ERROR - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE ACAT16IO-SQLCODE TO WK-ERR-SQLCODE                           
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
           IF (ACAT-SUPER-SIGN-ON-UPDATE                                        
               OR  ACAT-SUPER-SIGN-ON-BROWSE)                                   
               SET SRCH-SIGNON-SECR-CHECK-PASS TO TRUE                          
           ELSE                                                                 
               IF NOT NO-MORE-DATA                                              
                  PERFORM 5000-BR-AE-SECURITY.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *        CLOSE CURSOR TABLE                                    *          
      *--------------------------------------------------------------*          
       0550-CLOSE-CSR-TBL.                                                      
           SET ACAT16IO-C-TFRCSR TO TRUE.                                       
           PERFORM 7600-LINK-TO-ACAT16DB.                                       
           IF ACAT16IO-ERROR                                                    
              SET WK-ERROR TO TRUE                                              
LRM001        MOVE 'INITIAL TRANSFER TABLE CLOSE ERROR - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE ACAT16IO-SQLCODE TO WK-ERR-SQLCODE                           
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *         OPEN CURSOR TABLE IN DESCENDING ORDER                *          
      *--------------------------------------------------------------*          
       0560-OPEN-CSR-DESCEND.                                                   
           MOVE SPACE  TO ACAT16IO-PASS-DLVR-ACCT.                              
           IF ACAT-INP-BRANCH > SPACE                                           
              IF ACAT-INP-ACCOUNT > SPACE                                       
                 MOVE ACAT-INP-BRANCH  TO WS-DLVR-BR                            
                 MOVE ACAT-INP-ACCOUNT TO WS-DLVR-ACCT                          
                 MOVE SPACE            TO WS-DLVR-MASK                          
                 MOVE WS-DLVR-NBR-ACCT TO ACAT16IO-PASS-DLVR-ACCT               
              ELSE                                                              
                 MOVE ACAT-INP-BRANCH  TO WS-DLVR-BR                            
                 MOVE SPACE            TO WS-DLVR-ACCT WS-DLVR-MASK             
                 MOVE WS-DLVR-NBR-ACCT TO ACAT16IO-PASS-DLVR-ACCT               
              END-IF.                                                           
                                                                                
           IF ACAT-INP-CONTRA-BKR > SPACE                                       
              MOVE ACAT-INP-CONTRA-BKR TO ACAT16IO-PASS-BRKR                    
           ELSE                                                                 
              MOVE ALL '%' TO ACAT16IO-PASS-BRKR.                               
                                                                                
           IF ACAT-INP-RR > SPACE                                               
              MOVE ACAT-INP-RR TO ACAT16IO-PASS-RR                              
           ELSE                                                                 
              MOVE ALL '%'     TO ACAT16IO-PASS-RR.                             
                                                                                
           IF ACAT-INP-TFR-TYP > SPACE                                          
              IF ACAT-INP-TFR-TYP = 'STD'                                       
                 MOVE 'FUL'         TO ACAT16IO-PASS-TRNFR1                     
                                       ACAT16IO-PASS-TRNFR2                     
              ELSE                                                              
                 MOVE ACAT-INP-TFR-TYP TO ACAT16IO-PASS-TRNFR1                  
                                          ACAT16IO-PASS-TRNFR2                  
              END-IF                                                            
           ELSE                                                                 
              MOVE 'FUL' TO ACAT16IO-PASS-TRNFR1                                
              MOVE 'PTR' TO ACAT16IO-PASS-TRNFR2.                               
                                                                                
           SET ACAT16IO-O-TFRCSRD TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT16DB.                                       
           IF ACAT16IO-ERROR                                                    
              SET WK-ERROR TO TRUE                                              
LRM001        MOVE 'INITIAL TRANSFER TABLE OPEN ERROR - CALL HELP DESK'         
                TO  WK-DB2-ERROR                                                
              MOVE ACAT16IO-SQLCODE TO WK-ERR-SQLCODE                           
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
      *                                                                         
      *--------------------------------------------------------------*          
      *        FETCH CURSOR TABLE IN DESCENDING ORDER                *          
      *--------------------------------------------------------------*          
       0570-FETCH-CSR-DESCEND.                                                  
           SET ACAT16IO-F-TFRCSRD TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT16DB.                                       
           IF ACAT16IO-NORMAL                                                   
              CONTINUE                                                          
           ELSE                                                                 
           IF ACAT16IO-NOT-FOUND                                                
              SET NO-MORE-DATA TO TRUE                                          
           ELSE                                                                 
              SET WK-ERROR TO TRUE                                              
LRM001        MOVE 'INITIAL TRANSFER TABLE FETCH ERROR - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE ACAT16IO-SQLCODE TO WK-ERR-SQLCODE                           
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
           IF (ACAT-SUPER-SIGN-ON-UPDATE                                        
               OR  ACAT-SUPER-SIGN-ON-BROWSE)                                   
               SET SRCH-SIGNON-SECR-CHECK-PASS TO TRUE                          
           ELSE                                                                 
               IF NOT NO-MORE-DATA                                              
                  PERFORM 5000-BR-AE-SECURITY.                                  
      *                                                                         
      *--------------------------------------------------------------*          
      *        CLOSE CURSOR TABLE IN DESCENDING ORDER                *          
      *--------------------------------------------------------------*          
       0580-CLOSE-CSR-DESCEND.                                                  
           SET ACAT16IO-C-TFRCSRD TO TRUE.                                      
           PERFORM 7600-LINK-TO-ACAT16DB.                                       
           IF ACAT16IO-ERROR                                                    
              SET WK-ERROR TO TRUE                                              
LRM001        MOVE 'INITIAL TRANSFER TABLE CLOSE ERROR - CALL HELP DESK'        
                TO  WK-DB2-ERROR                                                
              MOVE ACAT16IO-SQLCODE TO WK-ERR-SQLCODE                           
              MOVE  WK-DB2-ERROR-MSG TO SYSTEM-MSG                              
              PERFORM 9000-ERROR-RTN.                                           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *             SETUP MAP FIELDS                                 *          
      *--------------------------------------------------------------*          
       0600-SETUP-ACCT-INFO.                                                    
           MOVE ACAT16IO-DLVR-ACCT TO WS-DLVR-NBR-ACCT.                         
           MOVE WS-DLVR-BR         TO BRANCH-O    (SUB).                        
           MOVE WS-DLVR-ACCT       TO ACCT-O      (SUB).                        
           MOVE ACAT16IO-RR        TO RR-O        (SUB).                        
           MOVE ACAT16IO-ACCT-TYPE TO CUST-TYPE-O (SUB).                        
           MOVE ACAT16IO-RCV-NBR   TO CONT-BRKR-O (SUB).                        
           MOVE ACAT16IO-RCV-ACCT  TO CONT-ACCT-O (SUB).                        
           MOVE ACAT16IO-CUST-NM1  TO NAME1-O     (SUB).                        
           MOVE ACAT16IO-CUST-NM2  TO NAME2-O     (SUB).                        
           MOVE ACAT16IO-TRNFR     TO TFR-TYPE-O  (SUB).                        
           MOVE ACAT16IO-ACAT-NBR  TO ACAT-O      (SUB).                        
           MOVE ACAT16IO-RJCT-CD   TO REJ-CODE-O  (SUB).                        
           MOVE ACAT16IO-CMNT1     TO CMNT1-O     (SUB).                        
           MOVE ACAT16IO-CMNT2     TO CMNT2-O     (SUB).                        
           IF ACAT16IO-SSN1 = SPACE                                             
              MOVE SPACE  TO SS-NUM1-O (SUB)                                    
           ELSE                                                                 
              MOVE ACAT16IO-SSN1(1:3) TO WS-SS-NUM1                             
              MOVE ACAT16IO-SSN1(4:2) TO WS-SS-NUM2                             
              MOVE ACAT16IO-SSN1(6:4) TO WS-SS-NUM3                             
              MOVE WS-SS-NUM          TO SS-NUM1-O (SUB).                       
           IF ACAT16IO-SSN2 = SPACE                                             
              MOVE SPACE  TO SS-NUM2-O (SUB)                                    
           ELSE                                                                 
              MOVE ACAT16IO-SSN2(1:3) TO WS-SS-NUM1                             
              MOVE ACAT16IO-SSN2(4:2) TO WS-SS-NUM2                             
              MOVE ACAT16IO-SSN2(6:4) TO WS-SS-NUM3                             
              MOVE WS-SS-NUM          TO SS-NUM2-O (SUB).                       
           IF  REJ-CODE-O (SUB) > SPACE                                         
               SET  RJCT-IX    TO  1                                            
               SEARCH  WS-REJECT-DESC-TBL                                       
                  AT END  MOVE SPACE TO REJ-DESC-O (SUB)                        
                  WHEN WS-REJECT-CD (RJCT-IX) = REJ-CODE-O (SUB)                
                       MOVE  WS-REJECT-DESC (RJCT-IX)                           
                         TO  REJ-DESC-O (SUB)                                   
           END-IF.                                                              
           MOVE ACAT16IO-DLVR-NBR  TO TWA-DLVR-NBR (SUB).                       
           MOVE SUB  TO  LINE-COUNT                                             
                         TWA-SCR-ACCT-LINE.                                     
      *                                                                         
      **<< FOR THE SCROLLING PURPOSE, SAVE THE 1ST AND THE 2ND KEY >>           
      *                                                                         
           IF LINE-COUNT = 1                                                    
              MOVE WK-CLT             TO TWA-SAVE-CLT-1                         
                                         TWA-SAVE-CLT-2                         
              MOVE ACAT16IO-RCV-NBR   TO TWA-SAVE-RCV-NBR-1                     
                                         TWA-SAVE-RCV-NBR-2                     
              MOVE ACAT16IO-RCV-ACCT  TO TWA-SAVE-RCV-ACCT-1                    
                                         TWA-SAVE-RCV-ACCT-2                    
              MOVE SPACES             TO TWA-SAVE-RCV-ACCT-1 (9:12)             
                                         TWA-SAVE-RCV-ACCT-2 (9:12)             
              MOVE ACAT16IO-ACAT-NBR  TO TWA-SAVE-ACAT-1                        
                                         TWA-SAVE-ACAT-2                        
              MOVE ACAT16IO-DLVR-NBR  TO TWA-SAVE-DLVR-NBR-1                    
                                         TWA-SAVE-DLVR-NBR-2                    
              MOVE ACAT16IO-DLVR-ACCT TO TWA-SAVE-DLVR-ACCT-1                   
                                         TWA-SAVE-DLVR-ACCT-2                   
              MOVE SPACES             TO TWA-SAVE-DLVR-ACCT-1 (9:12)            
                                         TWA-SAVE-DLVR-ACCT-2 (9:12)            
           ELSE                                                                 
           IF LINE-COUNT > 1                                                    
              MOVE WK-CLT             TO TWA-SAVE-CLT-2                         
              MOVE ACAT16IO-RCV-NBR   TO TWA-SAVE-RCV-NBR-2                     
              MOVE ACAT16IO-RCV-ACCT  TO TWA-SAVE-RCV-ACCT-2                    
              MOVE SPACES             TO TWA-SAVE-RCV-ACCT-2 (9:12)             
              MOVE ACAT16IO-ACAT-NBR  TO TWA-SAVE-ACAT-2                        
              MOVE ACAT16IO-DLVR-NBR  TO TWA-SAVE-DLVR-NBR-2                    
              MOVE ACAT16IO-DLVR-ACCT TO TWA-SAVE-DLVR-ACCT-2                   
              MOVE SPACES             TO TWA-SAVE-DLVR-ACCT-2 (9:12).           
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *             SAVE SEARCH ENGINE                               *          
      *--------------------------------------------------------------*          
       0800-SAVE-SRCH-ENGINE.                                                   
           MOVE SPACE      TO TWA-SRCH-SAVE.                                    
           MOVE MMBRO      TO TWA-SRCH-BR.                                      
           MOVE MMACO      TO TWA-SRCH-AC.                                      
           MOVE MMRRO      TO TWA-SRCH-RR.                                      
           MOVE MMTFRO     TO TWA-SRCH-TFR.                                     
           MOVE MMRDO      TO TWA-SRCH-RD.                                      
           MOVE MMBKRO     TO TWA-SRCH-BKR.                                     
           MOVE MMSTATO    TO TWA-SRCH-STTS.                                    
           MOVE MMSDO      TO TWA-SRCH-SD.                                      
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *             AFTER FIRST TIME                                 *          
      *--------------------------------------------------------------*          
       1000-CONTINUE-PROCESS.                                                   
           PERFORM 7000-READ-TSQ-RTN.                                           
           PERFORM 7100-DELETE-TSQ-RTN.                                         
           SET DATA-ONLY TO TRUE.                                               
           EVALUATE TRUE                                                        
                WHEN EIBAID = DFHPF11 OR DFHCLEAR                               
                     PERFORM 8700-RETURN-CONTROL-RTN                            
                WHEN EIBAID = DFHPF10 OR DFHPF12                                
                     PERFORM 8800-RETURN-TO-CICS                                
                WHEN EIBAID = DFHENTER OR DFHPF7 OR DFHPF8                      
                     PERFORM 2000-ENTER-KEY                                     
                WHEN OTHER                                                      
                     SET  WK-ERROR  TO TRUE                                     
                     MOVE LOW-VALUE TO ACAT16MO                                 
                     MOVE -1 TO MNEXTL                                          
                     MOVE 'ERROR FUNCTION KEY'                                  
                       TO SYSTEM-MSG                                            
                     PERFORM 9000-ERROR-RTN                                     
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *                                                                         
      *--------------------------------------------------------------*          
      *              ENTER KEY ROUTINE                               *          
      *--------------------------------------------------------------*          
       2000-ENTER-KEY.                                                          
           MOVE SPACE  TO WK-ERROR-SW.                                          
           PERFORM 8500-RECEIVE-MAP.                                            
           PERFORM 2300-NEXT-SELECTION-RTN.                                     
           IF NOT WK-ERROR                                                      
              IF EIBAID = DFHPF8                                                
                 PERFORM 3000-NEXT-PAGE                                         
              END-IF                                                            
              IF EIBAID = DFHPF7                                                
                 PERFORM 3100-PREV-PAGE                                         
              END-IF                                                            
           END-IF.                                                              
      *                                                                         
           IF NOT WK-ERROR                                                      
              MOVE -1    TO MNEXTL                                              
              MOVE SPACE TO TRLMSGO.                                            
           PERFORM  0800-SAVE-SRCH-ENGINE.                                      
           PERFORM  7200-WRITE-TSQ-RTN.                                         
           PERFORM  8100-SEND-MAP-DATA-ONLY.                                    
           PERFORM  8800-RETURN-TO-CICS.                                        
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       'NEXT' MAP FIELD ROUTINE                               *          
      *--------------------------------------------------------------*          
       2300-NEXT-SELECTION-RTN.                                                 
           MOVE ATT-UNPROT-MDT  TO MMBRA                                        
                                   MMACA                                        
                                   MMRRA                                        
                                   MMTFRA                                       
                                   MMRDA                                        
                                   MMBKRA                                       
                                   MMSTATA                                      
                                   MMSDA.                                       
           IF MMBRO  = LOW-VALUE                                                
              MOVE SPACE TO MMBRO.                                              
           IF MMACO  = LOW-VALUE                                                
              MOVE SPACE TO MMACO.                                              
           IF MMRRO  = LOW-VALUE                                                
              MOVE SPACE TO MMRRO.                                              
           IF MMTFRO = LOW-VALUE                                                
              MOVE SPACE TO MMTFRO.                                             
           IF MMRDO  = LOW-VALUE                                                
              MOVE SPACE TO MMRDO.                                              
           IF MMBKRO = LOW-VALUE                                                
              MOVE SPACE TO MMBKRO.                                             
           IF MMSTATO = LOW-VALUE                                               
              MOVE SPACE TO MMSTATO.                                            
           IF MMSDO   = LOW-VALUE                                               
              MOVE SPACE TO MMSDO.                                              
           MOVE MMBRO    TO ACAT-INP-BRANCH.                                    
           MOVE MMACO    TO ACAT-INP-ACCOUNT.                                   
           MOVE MMRRO    TO ACAT-INP-RR.                                        
           MOVE MMTFRO   TO ACAT-INP-TFR-TYP.                                   
           MOVE MMRDO    TO ACAT-INP-RCV-DEL.                                   
           MOVE MMBKRO   TO ACAT-INP-CONTRA-BKR.                                
           MOVE MMSTATO  TO ACAT-INP-STATUS.                                    
           MOVE MMSDO    TO ACAT-INP-STTL-DT.                                   
      *                                                                         
           MOVE ATT-UNPROT-MDT TO MNEXTA.                                       
           IF MNEXTO = LOW-VALUE                                                
              MOVE SPACE TO MNEXTO.                                             
           IF MNEXTO = 'P'                                                      
              MOVE SPACE TO MNEXTO.                                             
      *                                                                         
           IF  MNEXTO = SPACE                                                   
               MOVE  'P'    TO  ACAT-INP-SEL                                    
               PERFORM 2310-NEXT-SEL-SPACE-RTN                                  
           ELSE                                                                 
               MOVE  MNEXTO TO  ACAT-INP-SEL                                    
               PERFORM 2320-NEXT-SEL-ENTERED-RTN.                               
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       'NEXT' MAP FIELD NOT ENTERED                           *          
      *--------------------------------------------------------------*          
       2310-NEXT-SEL-SPACE-RTN.                                                 
           IF MMBRO   = SPACE  AND  MMACO  = SPACE  AND                         
              MMRRO   = SPACE  AND  MMTFRO = SPACE  AND                         
              MMRDO   = SPACE  AND  MMBKRO = SPACE  AND                         
              MMSTATO = SPACE  AND  MMSDO  = SPACE                              
                PERFORM  2410-CHECK-IF-SRCH-CHANGED                             
                IF WS-SEARCH-CHANGED                                            
                   PERFORM 0300-SETUP-MAP-RETURN                                
                END-IF                                                          
           ELSE                                                                 
                PERFORM  2400-VALIDATE-SRCH-ENGINE                              
                IF NOT WK-ERROR                                                 
                   PERFORM  2410-CHECK-IF-SRCH-CHANGED                          
                   IF WS-SEARCH-CHANGED                                         
                      PERFORM 0300-SETUP-MAP-RETURN                             
                   END-IF                                                       
                END-IF                                                          
           END-IF.                                                              
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       'NEXT' MAP FIELD ENTERED                               *          
      *--------------------------------------------------------------*          
       2320-NEXT-SEL-ENTERED-RTN.                                               
           MOVE  MNEXTO   TO  WS-ACAT-NEXT.                                     
       COPY ACATJUMP.                                                           
           IF CALLED-PROGRAM-NAME = SPACES                                      
              MOVE -1  TO MNEXTL                                                
              MOVE ATT-UNPROT-BRT-MDT TO MNEXTA                                 
              IF NOT WK-ERROR                                                   
                 SET  WK-ERROR   TO TRUE                                        
                 MOVE 'NEXT TRANSACTION SELECTION IS INVALID'                   
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           ELSE                                                                 
              MOVE 'ACAT16TS'  TO ACAT-CALLING-PROG-NAME                        
              MOVE  MNEXTO     TO ACAT-NEXT                                     
              PERFORM  7500-XCTL-TO-DETAIL-PROG.                                
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *           VALIDATE THE SEARCH ENGINE                         *          
      *--------------------------------------------------------------*          
       2400-VALIDATE-SRCH-ENGINE.                                               
      *                                                                         
           EXEC CICS LINK                                                       
                     PROGRAM('ACATSRCH')                                        
                     COMMAREA(ACAT-SEARCH-AREA)                                 
                     LENGTH(LENGTH OF ACAT-SEARCH-AREA)                         
           END-EXEC.                                                            
      *                                                                         
           IF  ACAT-SRCH-MSG > SPACE                                            
               IF NOT WK-ERROR                                                  
                  SET WK-ERROR TO TRUE                                          
                  MOVE ACAT-SRCH-MSG TO SYSTEM-MSG                              
               END-IF                                                           
               IF  ACAT-SRCH-BR = 'N'                                           
                   MOVE -1  TO MMBRL                                            
                   MOVE ATT-UNPROT-BRT-MDT TO MMBRA                             
               END-IF                                                           
               IF  ACAT-SRCH-ACCT = 'N'                                         
                   MOVE -1  TO MMACL                                            
                   MOVE ATT-UNPROT-BRT-MDT TO MMACA                             
               END-IF                                                           
               IF  ACAT-SRCH-RR = 'N'                                           
                   MOVE -1  TO MMRRL                                            
                   MOVE ATT-UNPROT-BRT-MDT TO MMRRA                             
               END-IF                                                           
               IF  ACAT-SRCH-TFR = 'N'                                          
                   MOVE -1  TO MMTFRL                                           
                   MOVE ATT-UNPROT-BRT-MDT TO MMTFRA                            
               END-IF                                                           
               IF  ACAT-SRCH-RD = 'N'                                           
                   MOVE -1  TO MMRDL                                            
                   MOVE ATT-UNPROT-BRT-MDT TO MMRDA                             
               END-IF                                                           
               IF  ACAT-SRCH-CONTRA-BKR = 'N'                                   
                   MOVE -1  TO MMBKRL                                           
                   MOVE ATT-UNPROT-BRT-MDT TO MMBKRA                            
               END-IF                                                           
               IF  ACAT-SRCH-STATUS = 'N'                                       
                   MOVE -1  TO MMSTATL                                          
                   MOVE ATT-UNPROT-BRT-MDT TO MMSTATA                           
               END-IF                                                           
               IF  ACAT-SRCH-STTLDT = 'N'                                       
                   MOVE -1             TO MMSDL                                 
                   MOVE ATT-UNPROT-BRT-MDT TO MMSDA                             
               END-IF                                                           
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *                                                                         
      *--------------------------------------------------------------*          
      *           DID USER CHANGE THE SEARCH ENGINE?                 *          
      *--------------------------------------------------------------*          
       2410-CHECK-IF-SRCH-CHANGED.                                              
           MOVE SPACE TO WS-SEARCH-CHANGED-SW.                                  
           IF MMBRO  NOT =  TWA-SRCH-BR                                         
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF MMACO  NOT =  TWA-SRCH-AC                                         
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF MMRRO  NOT =  TWA-SRCH-RR                                         
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF MMTFRO NOT =  TWA-SRCH-TFR                                        
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF MMRDO  NOT =  TWA-SRCH-RD                                         
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF MMBKRO NOT =  TWA-SRCH-BKR                                        
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF MMSTATO NOT = TWA-SRCH-STTS                                       
              SET WS-SEARCH-CHANGED TO TRUE.                                    
           IF MMSDO  NOT =  TWA-SRCH-SD                                         
              SET WS-SEARCH-CHANGED TO TRUE.                                    
       EJECT                                                                    
                                                                                
       INVOKE-DETAIL-PROGRAM-RTN.                                               
           EXEC CICS XCTL PROGRAM(CALLED-PROGRAM-NAME)                          
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
           MOVE CALLED-PROGRAM-NAME TO ERROR-PROG-NAME.                         
           MOVE 'P' TO ACAT-NEXT.                                               
           MOVE ERROR-PROG-MSG    TO SYSTEM-MSG.                                
           MOVE LOW-VALUE TO ACAT16MO.                                          
           MOVE SPACES     TO ACAT-CALLING-PROG-NAME.                           
                                                                                
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       PF8: NEXT PAGE                                         *          
      *--------------------------------------------------------------*          
       3000-NEXT-PAGE.                                                          
           PERFORM  0520-OPEN-CSR-TBL.                                          
           MOVE SPACE TO WS-NO-MORE-DATA-SW.                                    
           PERFORM  3010-FIND-SCR-ACCT                                          
              UNTIL WS-NEXT-ACCT-FOUND OR NO-MORE-DATA.                         
      *                                                                         
           IF NO-MORE-DATA                                                      
              SET WK-ERROR   TO TRUE                                            
              MOVE 'BOTTOM PAGE' TO SYSTEM-MSG                                  
           ELSE                                                                 
           IF WS-NEXT-ACCT-FOUND                                                
              PERFORM 0510-CLEAR-SCREEN                                         
                 VARYING SUB FROM 1 BY 1 UNTIL SUB > 2                          
              MOVE 1 TO SUB                                                     
              MOVE 0 TO TWA-SCR-ACCT-LINE                                       
              PERFORM 0600-SETUP-ACCT-INFO                                      
              MOVE SPACE TO SRCH-SECURITY                                       
              PERFORM UNTIL NO-MORE-DATA  OR                                    
                            SRCH-SIGNON-SECR-CHECK-PASS                         
                      PERFORM 0530-FETCH-CSR-TBL                                
              END-PERFORM                                                       
              IF  SRCH-SIGNON-SECR-CHECK-PASS   AND                             
                   NOT  NO-MORE-DATA                                            
                 MOVE 2 TO SUB                                                  
                 PERFORM 0600-SETUP-ACCT-INFO                                   
              END-IF.                                                           
           PERFORM 0550-CLOSE-CSR-TBL.                                          
           MOVE  -1   TO  MNEXTL.                                               
      *                                                                         
       3010-FIND-SCR-ACCT.                                                      
           PERFORM  0530-FETCH-CSR-TBL.                                         
           IF ACAT16IO-NORMAL  AND                                              
               SRCH-SIGNON-SECR-CHECK-PASS                                      
              MOVE ACAT16IO-CLT-NBR   TO WS-SORT-CLT                            
              MOVE ACAT16IO-DLVR-NBR  TO WS-SORT-DLVR-NBR                       
              MOVE ACAT16IO-DLVR-ACCT TO WS-SORT-DLVR-ACCT                      
              MOVE SPACES             TO WS-SORT-DLVR-ACCT (9:12)               
              MOVE ACAT16IO-RCV-NBR   TO WS-SORT-RCV-NBR                        
              MOVE ACAT16IO-RCV-ACCT  TO WS-SORT-RCV-ACCT                       
              MOVE SPACES             TO WS-SORT-RCV-ACCT (9:12)                
              MOVE ACAT16IO-ACAT-NBR  TO WS-SORT-ACAT                           
              IF WS-SORT-KEY-NBR > TWA-SAVE-SORT-KEY-2                          
                 SET WS-NEXT-ACCT-FOUND TO TRUE                                 
              END-IF                                                            
           ELSE                                                                 
           IF ACAT16IO-NOT-FOUND                                                
              SET NO-MORE-DATA TO TRUE.                                         
                                                                                
       EJECT                                                                    
      *                                                                         
      *--------------------------------------------------------------*          
      *       PF7: PREVIOUSE PAGE                                    *          
      *--------------------------------------------------------------*          
       3100-PREV-PAGE.                                                          
           PERFORM 0560-OPEN-CSR-DESCEND.                                       
           MOVE SPACE TO WS-NO-MORE-DATA-SW                                     
                         WS-ACCT-FOUND-SW.                                      
           PERFORM  3110-FIND-PREV-ACCT                                         
              UNTIL WS-PREV-ACCT-FOUND OR NO-MORE-DATA.                         
      *                                                                         
           IF NO-MORE-DATA                                                      
              SET WK-ERROR   TO TRUE                                            
              MOVE 'FIRST PAGE' TO SYSTEM-MSG                                   
           ELSE                                                                 
           IF WS-PREV-ACCT-FOUND                                                
              PERFORM 0510-CLEAR-SCREEN                                         
                 VARYING SUB FROM 1 BY 1 UNTIL SUB > 2                          
              MOVE 2 TO SUB                                                     
              PERFORM 0600-SETUP-ACCT-INFO                                      
              MOVE SPACE     TO SRCH-SECURITY                                   
              PERFORM UNTIL NO-MORE-DATA  OR                                    
                            SRCH-SIGNON-SECR-CHECK-PASS                         
                      PERFORM 0570-FETCH-CSR-DESCEND                            
              END-PERFORM                                                       
              IF SRCH-SIGNON-SECR-CHECK-PASS                                    
                 MOVE 1 TO SUB                                                  
                 PERFORM 0600-SETUP-ACCT-INFO                                   
              END-IF                                                            
              PERFORM 0580-CLOSE-CSR-DESCEND                                    
              PERFORM 3120-SAVE-SCROLL-KEYS                                     
              MOVE 2 TO TWA-SCR-ACCT-LINE                                       
              IF SUB = 2                                                        
                 PERFORM 0500-SETUP-SCR.                                        
           MOVE  -1   TO  MNEXTL.                                               
      *                                                                         
       3110-FIND-PREV-ACCT.                                                     
           PERFORM 0570-FETCH-CSR-DESCEND.                                      
           IF ACAT16IO-NORMAL  AND                                              
               SRCH-SIGNON-SECR-CHECK-PASS                                      
              MOVE ACAT16IO-CLT-NBR   TO WS-SORT-CLT                            
              MOVE ACAT16IO-DLVR-NBR  TO WS-SORT-DLVR-NBR                       
              MOVE ACAT16IO-DLVR-ACCT TO WS-SORT-DLVR-ACCT                      
              MOVE SPACES             TO WS-SORT-DLVR-ACCT (9:12)               
              MOVE ACAT16IO-RCV-NBR   TO WS-SORT-RCV-NBR                        
              MOVE ACAT16IO-RCV-ACCT  TO WS-SORT-RCV-ACCT                       
              MOVE ACAT16IO-ACAT-NBR  TO WS-SORT-ACAT                           
              IF WS-SORT-KEY-NBR < TWA-SAVE-SORT-KEY-1                          
                 SET WS-PREV-ACCT-FOUND TO TRUE.                                
      *                                                                         
       3120-SAVE-SCROLL-KEYS.                                                   
           IF BRANCH-O (1) > SPACE                                              
              MOVE WK-CLT             TO TWA-SAVE-CLT-1                         
                                         TWA-SAVE-CLT-2                         
              MOVE CONT-BRKR-O (1)    TO TWA-SAVE-RCV-NBR-1                     
                                         TWA-SAVE-RCV-NBR-2                     
              MOVE CONT-ACCT-O (1)    TO TWA-SAVE-RCV-ACCT-1                    
                                         TWA-SAVE-RCV-ACCT-2                    
              MOVE ACAT-O (1)         TO TWA-SAVE-ACAT-1                        
                                         TWA-SAVE-ACAT-2                        
              MOVE BRANCH-O (1)       TO WS-DLVR-BR                             
              MOVE ACCT-O (1)         TO WS-DLVR-ACCT                           
              MOVE SPACE              TO WS-DLVR-MASK                           
              MOVE WS-DLVR-NBR-ACCT   TO TWA-SAVE-DLVR-ACCT-1                   
                                         TWA-SAVE-DLVR-ACCT-2                   
              MOVE TWA-DLVR-NBR (1)   TO TWA-SAVE-DLVR-NBR-1                    
                                         TWA-SAVE-DLVR-NBR-2.                   
           IF BRANCH-O (2) > SPACE                                              
              MOVE WK-CLT             TO TWA-SAVE-CLT-2                         
              MOVE CONT-BRKR-O (2)    TO TWA-SAVE-RCV-NBR-2                     
              MOVE CONT-ACCT-O (2)    TO TWA-SAVE-RCV-ACCT-2                    
              MOVE ACAT-O (2)         TO TWA-SAVE-ACAT-2                        
              MOVE BRANCH-O (2)       TO WS-DLVR-BR                             
              MOVE ACCT-O (2)         TO WS-DLVR-ACCT                           
              MOVE SPACE              TO WS-DLVR-MASK                           
              MOVE WS-DLVR-NBR-ACCT   TO TWA-SAVE-DLVR-ACCT-2                   
              MOVE TWA-DLVR-NBR (2)   TO TWA-SAVE-DLVR-NBR-2.                   
           EJECT                                                                
       5000-BR-AE-SECURITY.                                             04772510
           INITIALIZE ACAT-SRCH-COMM-AREA.                                      
           SET SECURITY-LOOKUP      TO TRUE.                                    
042400     MOVE ACAT16IO-DLVR-ACCT(1:3)  TO SRCH-INP-BRANCH.            04597609
042400     MOVE ACAT16IO-RR         TO SRCH-INP-RR.                     04597609
           EXEC CICS LINK                                                       
                     PROGRAM('ACATSRCH')                                        
                     COMMAREA(ACAT-SRCH-COMM-AREA)                              
                     LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)                      
           END-EXEC.                                                            
044000                                                                  04785107
040300 EJECT                                                            04777303
040400                                                                  04777403
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
                     MOVE -1                  TO MNEXTL                         
                     MOVE ATT-UNPROT-BRT-MDT  TO MNEXTA                         
                     SET  WK-ERROR            TO TRUE                           
                     MOVE 'ACAT16TS' TO ACAT-PROGRAM-NAME                       
                     MOVE 'P'        TO ACAT-NEXT ACAT-INP-SEL                  
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
                                                                                
       EJECT                                                                    
                                                                                
       7000-READ-TSQ-RTN.                                                       
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                                   
                              INTO(TWA-AREA)                                    
                              LENGTH(LENGTH OF TWA-AREA)                        
                              ITEM(ITEM-NUM)                                    
           END-EXEC.                                                            
           IF (EIBRESP NOT = +0)                                                
           AND (NOT FIRST-TIME)                                                 
              MOVE LOW-VALUE TO ACAT16MO                                        
              MOVE 'ACAT16TS READ TSQ ERROR'                                    
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
       7100-DELETE-TSQ-RTN.                                                     
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                                 
           END-EXEC.                                                            
                                                                                
       7200-WRITE-TSQ-RTN.                                                      
           EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                                  
                               FROM(TWA-AREA)                                   
                               LENGTH(LENGTH OF TWA-AREA)                       
                               ITEM(ITEM-NUM)                                   
           END-EXEC.                                                            
           IF EIBRESP NOT = +0                                                  
              MOVE LOW-VALUE TO ACAT16MO                                        
              MOVE 'ACAT16TS WRITE TSQ ERROR'                                   
                TO SYSTEM-MSG                                                   
              PERFORM 9000-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
       7300-READ-B1-RTN.                                                        
           EXEC CICS READ                                                       
                     DATASET('B1PRINT')                                         
                     INTO(B1-RECORD)                                            
                     RIDFLD(B1-REC-ID)                                          
                     LENGTH(LENGTH OF B1-RECORD)                                
           END-EXEC.                                                            
       EJECT                                                                    
      *                                                                         
       7500-XCTL-TO-DETAIL-PROG.                                                
                                                                                
           PERFORM SCREEN-SECURITY-CHECK.                                       
                                                                                
           EXEC CICS XCTL                                                       
                  PROGRAM(CALLED-PROGRAM-NAME)                                  
                  COMMAREA(ACATCOMM-COMMAREA)                                   
                  LENGTH(LENGTH OF ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
      *                                                                         
       7600-LINK-TO-ACAT16DB.                                                   
           EXEC CICS LINK                                                       
                     PROGRAM('ACAT16DB')                                        
                     COMMAREA(ACAT16IO-COMMAREA)                                
                     LENGTH(LENGTH OF ACAT16IO-COMMAREA)                        
           END-EXEC.                                                            
       EJECT                                                                    
       8000-SEND-MAP-ERASE.                                                     
           IF WK-ERROR                                                          
              MOVE SYSTEM-MSG     TO TRLMSGO                                    
              MOVE ATT-ASKIP-BRT  TO TRLMSGA                                    
           ELSE                                                                 
              MOVE SPACE TO TRLMSGO.                                            
                                                                                
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
           EXEC CICS SEND MAP('ACAT16M')                                        
                     MAPSET('ACAT16M')                                          
                     FROM(ACAT16MO)                                             
                     ACCUM                                                      
                     CURSOR                                                     
           END-EXEC.                                                            
           EXEC CICS SEND MAP('TRLMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM(TRLMAPO)                                              
                     ACCUM                                                      
           END-EXEC.                                                            
           EXEC CICS SEND PAGE                                                  
           END-EXEC.                                                            
                                                                                
       EJECT                                                                    
                                                                                
       8100-SEND-MAP-DATA-ONLY.                                                 
           IF WK-ERROR                                                          
              MOVE SYSTEM-MSG     TO TRLMSGO                                    
              MOVE ATT-ASKIP-BRT  TO TRLMSGA                                    
           ELSE                                                                 
              MOVE SPACE TO TRLMSGO.                                            
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
               EXEC CICS SEND MAP('ACAT16M')                                    
                         MAPSET('ACAT16M')                                      
                         FROM(ACAT16MO)                                         
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
           EXEC CICS RECEIVE MAP('ACAT16M')                                     
                             MAPSET('ACAT16M')                                  
                             FROM(ACAT-RECEIVE-MAP)                             
                             INTO(ACAT16MI)                                     
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
           MOVE WK-CLT    TO MCLINBO.                                           
           MOVE SYSTEM-MSG     TO  TRLMSGO.                                     
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                                     
           PERFORM 0800-SAVE-SRCH-ENGINE.                                       
           PERFORM 7200-WRITE-TSQ-RTN.                                          
           PERFORM 8100-SEND-MAP-DATA-ONLY.                                     
           PERFORM 8800-RETURN-TO-CICS.                                         
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
