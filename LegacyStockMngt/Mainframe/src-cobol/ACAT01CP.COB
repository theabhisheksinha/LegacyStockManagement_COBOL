000001* PDX    - ACAT01CP C0305327 12/17/10 11:39:31 TBLAMUR            00001000
      * LRM013 - SSR 73637 PASS SECONDARY SSN EDIT B1 434685 IN COMMA.          
000001* PDX    - ACAT01CP C0302223 10/04/10 09:02:36 TBLAMUR            00001000
      * LRM012 - SSR 73011 SUPPORT PF3 LINK TO MRGR FROM Z SCREEN               
000001* PDX    - ACAT01CP C0281257 03/16/10 13:29:19 TBLAMUR            00001000
      * LRM011 - SSR 62882 PASS B1 434740 DELETE ALL ASSETS IN COMMAREA         
000001* PDX    - ACAT01CP C0275533 03/03/09 14:10:18 TBLAMUR            00001000
      * LRM010 - SSR 57674 PASS B1 DEFAULT TO SUBMIT IN COMMAREA                
000001* PDX    - ACAT01CP C0263391 08/27/08 11:27:27 TBLAMUR            00001000
      * LRM009 - SSR 55171 ADD FUNCTION "2" TO DELIVER RULES SCREEN             
      * LRM009 - REMOVED FOR NOW.                                               
000001* PDX    - ACAT01CP C0263391 05/27/08 08:29:23 TBLAMUR            00001000
      * LRM008 - SSR 55766 ASCENDIS INTERFACE. PASS B1 434735 IN COMMA.         
      * LRM008 - CORRECT SECURITY CHECK, TREAT SCON ACAX0 SAME AS ACAXT.        
000001* PDX    - ACAT01CP C0250441 06/25/07 09:25:00 TBLAMUR            00001000
      * LRM007 - SSR 53075 SPIN-OFF CHANGES                                     
000001* PDX    - ACAT01CP C0231507 04/05/06 16:08:10 TBLAMUR            00001000
      * LRM006 - SSR 45744 READ FREEZE B1                               00001000
000001* PDX    - ACAT01CP C0216396 05/31/05 15:15:29 TBLAMUR            00001000
      * LRM005 - SSR 0039561 PHASE-II CHANGE TO J SCREEN DISPLAY        00001000
000001* PDX    - ACAT01CP C0210492 09/14/04 16:53:18 TBEDTAK            00001000
      * ET0002 - XCTL FROM "L" TO "T" SCREEN                                    
000001* PDX    - ACAT01CP C0205792 07/06/04 14:30:35 TBEDTAK            00001000
      * ET0001 - RECOMPILE DUE TO ACATSRCH PROG CHANGE.                         
000001* PDX    - ACAT01CP C0179784 09/13/02 12:22:20 TBLAMUR            00001000
      * LRM004 - SSR 00026952 RESCIND BLOCK OPTION 1                            
000001* PDX    - ACAT01CP C0165548 10/17/01 10:25:26 TBLAMUR            00001000
      * LRM003 - SSR R29945600 PICK-UP BRANCH ACCOUNT FROM REORG                
000001* PDX    - ACAT01CP C0157168 08/17/01 15:22:36 TBLAMUR            00001000
000001* PDX    - ACAT01CP C0156118 06/13/01 11:17:51 TBLAMUR            00001000
      * LRM002 - FIX J SCREEN SECURITY                                  00001000
000001* PDX    - ACAT01CP C0154561 04/27/01 11:16:15 TBLAMUR            00001000
000001* PDX    - ACAT01CP C0152388 01/09/01 09:53:58 TBLAMUR            00001000
000001* PDX    - ACAT01CP C0133263 10/27/99 09:19:55 TBLAMUR            00001000
000001* PDX    - ACAT01CP C0124874 08/06/99 08:35:22 TBLAMUR            00001000
000001* PDX    - ACAT01CP C0125633 07/09/99 16:37:16 TBEDTAK            00001000
000001* PDX    - ACAT01CP C0120327 01/26/99 14:45:01 TBLAMUR            00001000
000001* PDX    - ACAT01CP C0119910 12/30/98 12:20:11 TBLAMUR            00001000
000001* PDX    - ACAT01CP C0117770 12/16/98 11:07:57 TBEDTAK            00001000
000001* PDX    - ACAT01CP C0109165 11/12/98 15:49:27 TBLAMUR            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    ACAT01CP.                                                 
       AUTHOR.        TINA KUO.                                                 
      *REMARKS.                                                                 
      **-------------------------------------------------------------**         
      **-------------------------------------------------------------**         
      *                   ACAT CONTROL PROGRAM                        *         
      **-------------------------------------------------------------**         
      **-------------------------------------------------------------**         
       ENVIRONMENT DIVISION.                                                    
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       COPY PDXIDCOB.                                                           
       77  TWA-SIZE                       PIC S9(4) COMP.                       
005400******************************************************************00550002
005500*      B1 WORK AREA                                               00560002
005400******************************************************************00550002
       01  B1-RECORD.                                                   00580002
           05  B1-REC-ID.                                               00590002
               09  B1-CLIENT-NO          PIC 9(03) COMP-3.              00600002
               09  B1-CARD-NO            PIC 9(07) COMP-3.              00610002
               09  B1-CLIENT             PIC 9(03) COMP-3.              00620002
               09  B1-SEQUENCE           PIC 9(05) COMP-3 VALUE 1.      00630002
           05  B1-REC-TYP-3              PIC X(01) VALUE '3'.           00640002
           05  B1-RETURN-AREA.                                          00650002
               09  B1-RETURN-VALUE       PIC X(01).                     00650002
               09  B1-RETURN-CLR-NBR     PIC X(04).                     00650002
           05  FILLER                    PIC X(05).                     00660002
                                                                                
LRM013 01  B1READ-PARM-AREA.                                                    
LRM013     05  B1READ-REQUEST-AREA.                                             
LRM013         10  B1READ-CLIENT            PIC 9(03).                          
LRM013         10  B1READ-REC-CODE          PIC 9(03).                          
LRM013         10  B1READ-CARD-NUM          PIC X(06).                          
LRM013     05  B1READ-RETURN-AREA.                                              
LRM013         10  B1READ-RETURN-CODE       PIC X(01).                          
LRM013         10  B1READ-INFO-AREA         PIC X(17200).                       
LRM013                                                                          
LRM013     COPY  BHACAT.                                                        
LRM013                                                                  00670002
006000 EJECT                                                            00680002
001970******************************************************************DTIR0102
00198 *      GET DATE TIME LAYOUT                                       DTIR01  
001990******************************************************************DTIR0102
00200  01  WSWORKAREA.                                                  DTIR01  
00201      05  WSABSTIME           PIC S9(08) COMP.                     DTIR01  
00202      05  WSMMDDYY            PIC X(08).                           DTIR01  
00203      05  WSDATESEP           PIC X(01) VALUE '/'.                 DTIR01  
00204      05  WSTIME              PIC X(08).                           DTIR01  
00205      05  WSTIMESEP           PIC X(01) VALUE ':'.                 DTIR01  
00570                                                                   DTIR01  
       01  TWA-CLIENT-NO-X.                                                     
           05  TWA-CLIENT-NO-9             PIC 9(03).                           
       EJECT                                                                    
       01  ACAT-WORK-AREA.                                                      
           05  IDX                         PIC S9(05) COMP-3.           01280002
           05  WS-ACAT-NEXT                PIC X(01) VALUE SPACES.              
               88  VALID-ACAT-NEXT   VALUE 'A', 'B', 'C', 'D', 'E',             
                                           'F', 'G', 'H', 'I', 'J',             
                                           'K', 'L', 'M', 'N', 'O',             
                                           'P', 'Q', 'R', 'S', 'T', 'U',        
LRM002                                     'V', 'W', 'X', 'Y', 'Z', '1'.        
LRM009*************************            '2'.                                 
           05  TSQ-NAME.                                                        
               09  TERM-ID                PIC X(04).                            
               09  TRAN-ID                PIC X(04).                            
           05  TSQ-SECR.                                                        
               09  TERM-ID-SECR           PIC X(04).                            
               09  TRAN-ID-SECR           PIC X(04)  VALUE 'AC@X'.              
           05  ITEM-NUM                   PIC S9(04) COMP VALUE +1.             
           05  ERASE-KEY-VALUE            PIC S9(04) COMP VALUE +128.           
           05  FILLER REDEFINES ERASE-KEY-VALUE.                                
               09  FILLER                 PIC X(01).                            
               09  ERASE-KEY              PIC X(01).                            
           05  CALLED-PROGRAM-NAME        PIC X(08).                            
           05  REFORMAT-TIME              PIC 9(07).                            
           05  FILLER REDEFINES REFORMAT-TIME.                                  
               09  FILLER                 PIC X(01).                            
               09  REFORMAT-HH            PIC X(02).                            
               09  REFORMAT-MM            PIC X(02).                            
               09  FILLER                 PIC X(02).                            
           05  CALL-RATT-AND-RETURN.                                            
             10                       PIC X(08) VALUE 'BRAACCT/'.               
             10  CR-ACCOUNT           PIC X(10) VALUE SPACES.                   
             10                       PIC X(08) VALUE '/SYMBOL/'.               
             10  CR-SECURITY          PIC X(09).                                
             10                       PIC X(06) VALUE '/CALL/'.                 
             10  CR-TRANSID           PIC X(04).                                
             10                       PIC X(20) VALUE                           
               '/CALL/ACAX$$ACAT01CP'.                                          
             10                       PIC X(05) VALUE '/END/'.                  
           05  ASK-RATT-INFO.                                                   
             10                       PIC X(08) VALUE 'BRAACCT?'.               
             10  AR-ACCOUNT           PIC X(10) VALUE SPACES.                   
             10                       PIC X(08) VALUE '?SYMBOL?'.               
             10  AR-SECURITY          PIC X(12) VALUE SPACES.                   
             10                       PIC X(04) VALUE '?RR?'.                   
             10  AR-RR-NUM            PIC X(03) VALUE SPACES.                   
             10                       PIC X(01) VALUE '?'.                      
           05  WS-LENGTH                  PIC S9(4) COMP VALUE +0.              
           05  KICK-OUT-MSG               PIC X(33) VALUE                       
               'ACCESS NOT GRANTED TO ACAT SYSTEM'.                             
           05  OPEN-ERROR-FLAG            PIC X(01) VALUE 'N'.                  
           05  WORK-TIME.                                                       
               09  WORK-HH                PIC X(02).                            
               09  FILLER                 PIC X(01) VALUE ':'.                  
               09  WORK-MM                PIC X(02).                            
           05  INPUT-NEXT-SPACE-FLAG      PIC X(01)  VALUE 'N'.                 
               88  INPUT-NEXT-SPACE       VALUE  'Y'.                           
           05  INPUT-ERROR-FLAG           PIC X(01)  VALUE 'N'.                 
               88  INPUT-ERROR            VALUE  'Y'.                           
           05  DATA-ONLY-FLAG             PIC X(01)  VALUE 'N'.                 
               88  DATA-ONLY              VALUE  'Y'.                           
           05  CALL-RATT-RTN-FLAG         PIC X(01)  VALUE 'N'.                 
               88  CALL-RATT-RTN-YES      VALUE 'Y'.                            
           05  ALARM-NEEDED-FLAG          PIC X(01)  VALUE 'N'.                 
               88  ALARM-NEEDED           VALUE  'Y'.                           
           05  MAP-LOADED-FLAG            PIC X(01)  VALUE 'N'.                 
               88  MAP-LOADED             VALUE  'Y'.                           
           05  END-OF-DATA-FLAG           PIC X(01)  VALUE 'N'.                 
               88  END-OF-DATA            VALUE  'Y'.                           
           05  SYSTEM-MSG                 PIC X(79) VALUE SPACES.               
011100     05  UNAUTH-MESSAGE             PIC X(79)                     01190002
011500         VALUE 'ERROR SELECTION, UNAUTHORIZED USER.'.             01230002
           05  SEC-MESSAGE                PIC X(79) VALUE                       
               'SIGN ON SECURITY NOT AVAILABLE, TRY AGAIN.'.                    
           05  ERROR-PROG-MSG.                                                  
               09  ERROR-PROG-NAME        PIC X(08).                            
               09  FILLER                 PIC X(71)                             
                   VALUE ' PROGRAM NOT AVAILIABLE.'.                            
           05  LINE-COUNT                 PIC 9(03).                            
           05  RR-IDX                     PIC 9(05) COMP-3.                     
00029      05  SECLINK-TABLE-POINTER      PIC S9(8) COMP VALUE +0.      AEISAC07
00030      05  SECLINK-TABLE-PTR REDEFINES                              AEISAC07
00031          SECLINK-TABLE-POINTER    USAGE IS POINTER.               AEISAC07
00029      05  SECLINK-TABLE-POINTER-RR   PIC S9(8) COMP VALUE +0.      AEISAC07
00030      05  SECLINK-TABLE-PTR-RR REDEFINES                           AEISAC07
00031          SECLINK-TABLE-POINTER-RR USAGE IS POINTER.               AEISAC07
00032 ****                                                              AEISAC07
           05  WS-MSG-OUT                 PIC X(79).                            
           05  WS-CICS-MSG.                                                     
               10  WS-CICS-DISPLAY        PIC X(21) VALUE SPACES.               
               10  FILLER                 PIC X     VALUE SPACES.               
               10  WS-DISPLAY-CICS-DESC.                                        
                   15  FILLER             PIC X(20) VALUE                       
                         'CICS RETURN CODE = '.                                 
                   15  FILLER             PIC X(02) VALUE SPACES.               
                   15  WS-CICS-RC         PIC X(06) VALUE SPACES.               
                   15  FILLER             PIC X(05) VALUE SPACES.               
               10  FILLER                 PIC X(17) VALUE                       
LRM007                   'CONTACT HELP DESK'.                                   
LRM006     05  WS-NETNAME                 PIC X(08) VALUE SPACES.               
LRM006     05  WS-USERID                  PIC X(08) VALUE SPACES.               
LRM006     05  WS-USER-NAME               PIC X(20) VALUE SPACES.               
            EJECT                                                               
       COPY DFHAID.                                                             
            EJECT                                                               
       COPY ATTR.                                                               
            EJECT                                                               
       01  MSD-WORK-AREA.                                                       
       COPY MSDCOMC.                                                            
            EJECT                                                               
       COPY SECLINKC.                                                           
            EJECT                                                               
       COPY ACATCOM.                                                            
            EJECT                                                               
       01  ACAT01M-IO-AREA                 PIC X(1000).                         
      ************* HDR & TRL MAPS *************************                    
       COPY ACAT00M.                                                            
      ******************************************************                    
       COPY ACAT01M.                                                            
            EJECT                                                               
       01  WS-ACAT01CP-IOAREA.                                                  
       COPY ACATCPIO.                                                           
            EJECT                                                               
       01  TSQ-SECR-AREA.                                                       
              05 TSQ-USER-ID                  PIC X(4).                         
              05 TSQ-LK-SEC-BR-TABLE.                                   02040002
00384            07 TSQ-LK-SEC-BR-AREA OCCURS 999 TIMES.                02050002
00391               09 TSQ-LK-SEC-BR-LO       PIC X(3).                 02060002
00392               09 TSQ-LK-SEC-BR-COMMA    PIC X.                    02070002
00393               09 TSQ-LK-SEC-BR-HI       PIC X(3).                 02080002
              05 TSQ-LK-SEC-RR-TABLE.                                   02090002
00384            07 TSQ-LK-SEC-RR-AREA OCCURS  999 TIMES.               02100002
00391               09 TSQ-LK-SEC-RR-LO       PIC X(3).                 02110002
00392               09 TSQ-LK-SEC-RR-COMMA    PIC X.                    02120002
00393               09 TSQ-LK-SEC-RR-HI       PIC X(3).                 02130002
      *********  END OF WORKING STORAGE  *******************                    
            EJECT                                                               
       LINKAGE SECTION.                                                         
       01  DFHCOMMAREA.                                                         
           03  DFHCOMM-PROGRAM             PIC X(08).                           
           03  FILLER                      PIC X(1992).                         
            EJECT                                                       01400002
00376  01  LK-SEC-ADDRESS.                                              01700002
00377      05 LK-SEC-LENGTH              PIC S9(8) COMP.                01710002
00378      05 LK-SEC-BR-CNT              PIC 9(7)  COMP-3.              01720002
00379      05 LK-SEC-BR-DISP             PIC S9(8) COMP.                01730002
00380      05 LK-SEC-RR-CNT              PIC 9(7)  COMP-3.              01740002
00381      05 LK-SEC-RR-DISP             PIC S9(8) COMP.                01750002
00382      05 FILLER                     PIC S9(8) COMP.                01760002
00383      05 FILLER                     PIC S9(8) COMP.                01770002
           05 LK-SEC-BR-TABLE.                                          01780002
00384         07 LK-SEC-BR-AREA OCCURS 0 TO 999 TIMES DEPENDING ON      01790002
                                         LK-SEC-BR-CNT.                         
00391            09 LK-SEC-BR-LO         PIC X(3).                      01810002
00392            09 LK-SEC-BR-COMMA      PIC X.                         01820002
00393            09 LK-SEC-BR-HI         PIC X(3).                      01830002
                                                                                
       01  LK-SEC-ADDRESS-RR.                                           01780002
           05 LK-SEC-RR-TABLE.                                          01780002
              07 LK-SEC-RR-AREA OCCURS 0 TO 999 TIMES DEPENDING ON      01790002
                                         LK-SEC-RR-CNT.                         
                 09 LK-SEC-RR-LO         PIC X(3).                      01810002
                 09 LK-SEC-RR-COMMA      PIC X.                         01820002
                 09 LK-SEC-RR-HI         PIC X(3).                      01830002
                                                                                
            EJECT                                                       01400002
       COPY TWACOMMN.                                                           
           03  TWA-WORK-AREA.                                                   
               05  FILLER                PIC X(1000).                           
                                                                                
           EJECT                                                                
       PROCEDURE DIVISION.                                                      
      *                                                                         
       INITIALIZATION.                                                          
           EXEC CICS IGNORE CONDITION DUPKEY DUPREC  ENDFILE  ERROR             
                     ILLOGIC INVREQ   IOERR  ITEMERR LENGERR  MAPFAIL           
                     NOSPACE NOSTG    NOTFND         PGMIDERR QIDERR            
           END-EXEC.                                                            
           EXEC CICS HANDLE CONDITION NOTOPEN(NOT-OPEN)                         
                                      DISABLED(NOT-OPEN)                        
                                      DSIDERR(NOT-OPEN)                         
           END-EXEC.                                                            
                                                                                
           EXEC CICS ASSIGN TWALENG (TWA-SIZE)                                  
           END-EXEC.                                                            
           IF TWA-SIZE = 0                                                      
              MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO SYSTEM-MSG             
              PERFORM  ERROR-RTN.                                               
                                                                                
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                          
           END-EXEC.                                                            
           MOVE TWA-CLIENT-NO   TO TWA-CLIENT-NO-9.                     03580002
           EJECT                                                                
      *                                                                         
       MAIN-PROCESSING.                                                         
           MOVE LOW-VALUE TO ACAT01M-IO-AREA.                                   
           PERFORM GET-DATE-AND-TIME-RTN.                                       
                                                                                
******* THE SPECIAL LINK TO MARGIN BELOW WAS ADDED FOR ACAT SCREENS WITH        
******* MULTIPLE BRANCH/ACCOUNTS ON THEM.  UPON PF3, CONTROL IS PASSED          
******* BACK TO THE APPLICATION SCREEN, SO THEY CAN RESOLVE WHICH BRAC          
******* IS SELECTED. THE APPLICATION PROGRAM THEN XCTLS BACK TO HERE,           
******* FILLING IN CALLING-PROG AND BRAC IN COMMAREA, AND LINK IS DONE.         
******* THE AID PF3 WILL BE WIPED OUT WHEN BRAC IS MISSING TO PREVENT           
******* LOOPING, AND CONTROL WILL BE SENT BACK TO APPLICATION SCREEN.           
           IF EIBCALEN > ZERO                                                   
              MOVE DFHCOMMAREA(1 : EIBCALEN) TO ACATCOMM-COMMAREA               
              IF (ACAT-CALLING-PROG-NAME = 'ACAT20OO' OR 'ACAT24AA' OR          
                                           'ACAT25PD')                          
              AND EIBAID = DFHPF3                                               
                 PERFORM LINK-TO-MRGN-RTN                                       
                 MOVE DFHENTER TO EIBAID                                        
           END-IF.                                                              
                                                                                
           IF (EIBCALEN = +0)                                                   
           OR (EIBCALEN = +4 AND ACAT-COMM-TRANSID = 'RATT')                    
               MOVE SPACES    TO ACAT-COMMON-WORK-AREA                          
               IF (EIBCALEN = +4 AND ACAT-COMM-TRANSID = 'RATT')                
                  PERFORM GET-COM-INFO-FROM-RATT                                
               END-IF                                                           
               PERFORM FIRST-TIME-THRU                                          
           ELSE                                                                 
               IF DFHCOMM-PROGRAM = 'ACAT01CP'                                  
                  PERFORM RETURN-FROM-RATT-RTN                                  
               ELSE                                                             
                  PERFORM CONTINUE-PROCESS                                      
               END-IF                                                           
           END-IF.                                                              
           EJECT                                                                
      *                                                                         
      ****************************************************************          
       FIRST-TIME-THRU.                                                         
           PERFORM GET-B1-CLIENT-AUTH-RTN.                              03570002
           MOVE LOW-VALUES TO MENUMAPI, TRLMAPI.                                
           SET ACAT-MAIN-MENU TO TRUE.                                          
           MOVE SPACES                     TO  MMBRO, MMACO, MMRRO,             
                                               MMTFRO, MMRDO, MMBKRO,           
                                               MMSTATO, MMSDO, MCURO            
           IF  ACAT-COMM-TRANSID = 'RATT'                                       
               IF AR-ACCOUNT  NOT = SPACES AND LOW-VALUE                        
                  SET ACAT-CHANGES-MADE TO TRUE                                 
LRM003            IF (ACAT-BR-AC = SPACES OR LOW-VALUES)                        
LRM003            AND AR-ACCOUNT > SPACES                                       
LRM003            AND AR-ACCOUNT NOT = '0000000000'                             
LRM003               MOVE AR-ACCOUNT    TO  ACAT-INP-BR-AC-FIELDS               
LRM003            ELSE                                                          
                     MOVE AR-ACCOUNT    TO  ACAT-BR-AC                          
LRM003            END-IF                                                        
                  MOVE ACAT-INP-BRANCH  TO MMBRO                                
                  MOVE ACAT-INP-ACCOUNT TO MMACO                                
      *           MOVE ACAT-INP-RR         TO MMRRO                             
      *           MOVE ACAT-INP-TFR-TYP    TO MMTFRO                            
      *           MOVE ACAT-INP-RCV-DEL    TO MMRDO                             
      *           MOVE ACAT-INP-CONTRA-BKR TO MMBKRO                            
      *           MOVE ACAT-INP-STATUS     TO MMSTATO                           
      *           MOVE ACAT-INP-STTL-DT    TO MMSDO                             
               END-IF                                                           
           END-IF.                                                              
                                                                                
********* DELETE THE SECURITY TABLE HERE IN THE EVENT SOMEONE CHANGES           
********* THEIR VALUES AND RESTARTS THIS TRANSACTION, TO CAUSE LOGIC            
********* BELOW TO REBUILD THE TABLE WITH CURRENT VALUES.                       
           MOVE 'AC@X'                   TO TRAN-ID-SECR.                       
           MOVE EIBTRMID                 TO TERM-ID-SECR.                       
           EXEC CICS DELETEQ TS QUEUE (TSQ-SECR)                                
           END-EXEC.                                                            
                                                                                
           PERFORM SIGN-ON-SEC-CHECK-RTN.                                       
           MOVE -1                         TO  MMSELL                           
           MOVE 'ENTER SELECTION PLEASE!'  TO  SYSTEM-MSG                       
LRM005     MOVE 'ACAT01CP' TO ACAT-CALLING-PROG-NAME                            
           PERFORM SEND-MENU-MAP-RETURN.                                        
                                                                                
           EJECT                                                                
                                                                                
       CONTINUE-PROCESS.                                                        
           IF ACAT-PROGRAM-NAME = 'ACAT90CM'                                    
              MOVE '$' TO ACAT-NEXT                                             
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           ELSE                                                                 
              IF ACAT-PROGRAM-NAME = 'ACAT5FSC'                                 
                 MOVE '#' TO ACAT-NEXT                                          
                 PERFORM INVOKE-DETAIL-PROGRAM-RTN                              
              END-IF                                                            
           END-IF.                                                              
      **                                                                        
           PERFORM FUNCTION-KEY-RTN.                                            
           MOVE LOW-VALUE TO ACAT01M-IO-AREA.                                   
           IF ACAT-PROGRAM-NAME = 'ACAT01CP'                                    
              PERFORM RECEIVE-MENU-RTN                                          
           ELSE                                                                 
              PERFORM RECEIVE-DETAIL-RTN                                        
              IF MTRANSI = 'ACAX'  OR  LOW-VALUES                               
                 PERFORM INVOKE-DETAIL-PROGRAM-RTN                              
              ELSE                                                              
                 PERFORM LINK-TO-RATT-RTN                                       
           END-IF.                                                              
      *                                                                         
           IF MTRANSI = 'ACAX'  OR  LOW-VALUES                                  
              CONTINUE                                                          
           ELSE                                                                 
              MOVE 'Y'     TO CALL-RATT-RTN-FLAG                                
           END-IF.                                                              
      *                                                                         
           IF EIBAID = DFHENTER                                                 
              CONTINUE                                                          
           ELSE                                                                 
              PERFORM FIND-CURSOR-POSITION                                      
              MOVE 'ERROR FUNCTION KEY' TO SYSTEM-MSG                           
              PERFORM ERROR-RTN                                                 
           END-IF.                                                              
      *                                                                         
           PERFORM EDIT-ACAT01M-RTN.                                            
      *                                                                         
           IF ACAT-CHANGES-MADE                                                 
              PERFORM VALIDATE-NEXT-OPTION-RTN                                  
           END-IF.                                                              
      ***                                                                       
           IF INPUT-ERROR                                                       
              MOVE 'INVALID SELECTION '  TO SYSTEM-MSG                          
              PERFORM FIND-CURSOR-POSITION                                      
              PERFORM ERROR-RTN.                                                
                                                                                
      ***                                                                       
           PERFORM EDIT-ACAT00M-RTN.                                            
      *                                                                         
           IF ACAT-SRCH-ENTRY                                                   
              MOVE SPACES TO ACAT-SEARCH-RETURN                                 
              PERFORM CALL-ACATSRCH-RTN                                         
              IF ACAT-SRCH-MSG = SPACES OR LOW-VALUES                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE ACAT-SRCH-MSG TO SYSTEM-MSG                               
                 PERFORM SRCH-CURSOR-RTN                                        
                 PERFORM ERROR-RTN                                              
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF MTRANSI = 'ACAX'  OR  LOW-VALUE                                   
              IF ACAT-INP-SEL > SPACE OR LOW-VALUE                              
                 MOVE ACAT-INP-SEL TO ACAT-NEXT                                 
                 IF ACAT-NEXT = ' ' OR 'R' OR 'D' OR 'I' OR 'O'                 
                    MOVE ACAT-NEXT         TO ACAT-MENU-FLAG                    
                    MOVE SPACES         TO MMBRO, MMACO, MMRRO, MCURO           
                                           MMTFRO, MMRDO, MMBKRO,               
                                           MMSTATO, MMSDO, TRLMSGO              
                    MOVE 'ENTER SELECTION PLEASE!' TO SYSTEM-MSG                
                    PERFORM SEND-MENU-MAP-RETURN                                
                 END-IF                                                         
              ELSE                                                              
                 MOVE 'ENTER SELECTION PLEASE!' TO SYSTEM-MSG                   
                 PERFORM FIND-CURSOR-POSITION                                   
                 PERFORM ERROR-RTN                                              
              END-IF                                                            
           END-IF.                                                              
      *                                                                         
      ****                                                                      
           IF CALL-RATT-RTN-YES                                                 
              PERFORM LINK-TO-RATT-RTN                                          
           END-IF.                                                              
      ****                                                                      
           MOVE LOW-VALUE TO ACAT01M-IO-AREA.                                   
           PERFORM INVOKE-DETAIL-PROGRAM-RTN.                                   
      ******************************************************************        
      /                                                                         
       FIND-CURSOR-POSITION.                                                    
           EVALUATE ACAT-MENU-FLAG                                              
               WHEN ' '                                                         
                  MOVE -1                 TO MMSELL                             
                  MOVE ATT-UNPROT-BRT-MDT TO MMSELA                             
               WHEN 'R'                                                         
                  MOVE -1                 TO MRSELL                             
                  MOVE ATT-UNPROT-BRT-MDT TO MRSELA                             
               WHEN 'D'                                                         
                  MOVE -1                 TO MDSELL                             
                  MOVE ATT-UNPROT-BRT-MDT TO MDSELA                             
               WHEN 'I'                                                         
                  MOVE -1                 TO MISELL                             
                  MOVE ATT-UNPROT-BRT-MDT TO MISELA                             
               WHEN 'O'                                                         
                  MOVE -1                 TO MPSELL                             
                  MOVE ATT-UNPROT-BRT-MDT TO MPSELA                             
            END-EVALUATE.                                                       
       EJECT                                                                    
       CALL-ACATSRCH-RTN.                                                       
           EXEC CICS LINK                                                       
                PROGRAM ('ACATSRCH')                                            
                COMMAREA (ACAT-SEARCH-AREA)                                     
           END-EXEC.                                                            
125100     IF EIBRESP NOT = +0                                          10410002
              MOVE 'LINK TO ACATSRCH IS FAILED! ' TO SYSTEM-MSG                 
              PERFORM FIND-CURSOR-POSITION                                      
              PERFORM ERROR-RTN                                                 
           END-IF.                                                              
                                                                                
       SRCH-CURSOR-RTN.                                                         
           IF ACAT-SRCH-BR = SPACES  OR  LOW-VALUES                             
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1    TO  MMBRL                                              
              MOVE ATT-UNPROT-BRT-MDT  TO MMBRA                                 
           END-IF.                                                              
                                                                                
           IF ACAT-SRCH-ACCT = SPACES  OR  LOW-VALUES                           
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1    TO  MMACL                                              
              MOVE ATT-UNPROT-BRT-MDT  TO MMACA                                 
           END-IF.                                                              
                                                                                
           IF ACAT-SRCH-RR   =  SPACES  OR  LOW-VALUES                          
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1    TO  MMRRL                                              
              MOVE ATT-UNPROT-BRT-MDT  TO MMRRA                                 
           END-IF.                                                              
                                                                                
           IF ACAT-SRCH-TFR  =  SPACES  OR  LOW-VALUES                          
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1    TO  MMTFRL                                             
              MOVE ATT-UNPROT-BRT-MDT  TO MMTFRA                                
           END-IF.                                                              
                                                                                
           IF ACAT-SRCH-RD   =  SPACES  OR  LOW-VALUES                          
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1    TO  MMRDL                                              
              MOVE ATT-UNPROT-BRT-MDT  TO MMRDA                                 
           END-IF.                                                              
                                                                                
           IF ACAT-SRCH-CONTRA-BKR =  SPACES  OR  LOW-VALUES                    
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1    TO  MMBKRL                                             
              MOVE ATT-UNPROT-BRT-MDT  TO MMBKRA                                
           END-IF.                                                              
                                                                                
           IF ACAT-SRCH-STATUS =  SPACES  OR  LOW-VALUES                        
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1    TO  MMSTATL                                            
              MOVE ATT-UNPROT-BRT-MDT  TO MMSTATA                               
           END-IF.                                                              
                                                                                
           IF ACAT-SRCH-STTLDT =  SPACES  OR  LOW-VALUES                        
              CONTINUE                                                          
           ELSE                                                                 
              MOVE -1    TO  MMSDL                                              
              MOVE ATT-UNPROT-BRT-MDT  TO MMSDA                                 
           END-IF.                                                              
                                                                                
           EJECT                                                                
       FUNCTION-KEY-RTN.                                                        
      *** 06/04/99------------------------------------------------*             
      *  PF10 IN ACAT25PD (TFR ASSET INQUIRY) XCTL TO ACAT21PT                  
           IF EIBAID = DFHPF10   AND                                            
              ACAT-CALLING-PROG-NAME = 'ACAT21PT'  AND                          
              ACAT-PROGRAM-NAME = 'ACAT25PD'       AND                          
              ACAT-CONTROL-NBR > SPACE                                          
              MOVE 'S'        TO ACAT-NEXT                                      
              MOVE 'ACAT21PT' TO CALLED-PROGRAM-NAME                            
              MOVE 'ACAT25PD' TO ACAT-CALLING-PROG-NAME                         
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           END-IF.                                                              
      *END*                                                                     
ET0002*** 09/14/04------------------------------------------------*             
ET0002*  PF10 IN ACAT13IF (FAIL REVERSAL) XCTL TO ACAT22TH                      
ET0002     IF EIBAID = DFHPF10   AND                                            
ET0002        ACAT-CALLING-PROG-NAME = 'ACAT22TH'  AND                          
ET0002        ACAT-PROGRAM-NAME = 'ACAT13IF'                                    
ET0002          MOVE 'T'        TO ACAT-NEXT                                    
ET0002          MOVE 'ACAT22TH' TO CALLED-PROGRAM-NAME                          
ET0002          MOVE 'ACAT13IF' TO ACAT-CALLING-PROG-NAME                       
ET0002          PERFORM INVOKE-DETAIL-PROGRAM-RTN                               
ET0002     END-IF.                                                              
ET0002*END*                                                                     
      *** 06/04/99------------------------------------------------*             
      *  PF10 IN ACAT25PD (TFR ASSET INQUIRY) XCTL TO ACAT22TH                  
           IF EIBAID = DFHPF10   AND                                            
              ACAT-CALLING-PROG-NAME = 'ACAT22TH'  AND                          
              ACAT-PROGRAM-NAME = 'ACAT25PD'       AND                          
              ACAT-CONTROL-NBR > SPACE                                          
              MOVE 'T'        TO ACAT-NEXT                                      
              MOVE 'ACAT22TH' TO CALLED-PROGRAM-NAME                            
              MOVE 'ACAT25PD' TO ACAT-CALLING-PROG-NAME                         
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           END-IF.                                                              
      *END*                                                                     
      *** 10/9/98 ------------------------------------------------*             
      *  PF10 IN ACAT10NT (NEW DELIVER SCREEN) XCTL TO ACAT21PT                 
           IF EIBAID = DFHPF10   AND                                            
              ACAT-CALLING-PROG-NAME = 'ACAT21PT'  AND                          
              ACAT-PROGRAM-NAME = 'ACAT10NT'       AND                          
              ACAT-CONTROL-NBR > SPACE                                          
              MOVE 'S'        TO ACAT-NEXT                                      
              MOVE 'ACAT21PT' TO CALLED-PROGRAM-NAME                            
              MOVE 'ACAT10NT' TO ACAT-CALLING-PROG-NAME                         
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           END-IF.                                                              
      *END*                                                                     
      *** 08/6/99 ------------------------------------------------*             
      *  PF10 IN ACAT11PT (PTD/PTR DELIVERER) XCTL TO ACAT21PT                  
           IF EIBAID = DFHPF10   AND                                            
              ACAT-CALLING-PROG-NAME = 'ACAT21PT'  AND                          
              ACAT-PROGRAM-NAME = 'ACAT11PT'       AND                          
              ACAT-CONTROL-NBR > SPACE                                          
              MOVE 'S'        TO ACAT-NEXT                                      
              MOVE 'ACAT21PT' TO CALLED-PROGRAM-NAME                            
              MOVE 'ACAT11PT' TO ACAT-CALLING-PROG-NAME                         
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           END-IF.                                                              
      *END*                                                                     
      *** 08/14/01 -----------------------------------------------*             
      *  PF10 IN ACAT33FC (MFC DELIVERER) XCTL TO ACAT21PT                      
           IF EIBAID = DFHPF10   AND                                            
              ACAT-CALLING-PROG-NAME = 'ACAT21PT'  AND                          
              ACAT-PROGRAM-NAME = 'ACAT33FC'       AND                          
              ACAT-CONTROL-NBR > SPACE                                          
              MOVE 'S'        TO ACAT-NEXT                                      
              MOVE 'ACAT21PT' TO CALLED-PROGRAM-NAME                            
              MOVE 'ACAT33FC' TO ACAT-CALLING-PROG-NAME                         
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           END-IF.                                                              
      *END*                                                                     
      *** 08/14/01 -----------------------------------------------*             
      *  PF10 IN ACAT33FC (MFC DELIVERER) XCTL TO ACAT22TH                      
           IF EIBAID = DFHPF10   AND                                            
              ACAT-CALLING-PROG-NAME = 'ACAT22TH'  AND                          
              ACAT-PROGRAM-NAME = 'ACAT33FC'       AND                          
              ACAT-CONTROL-NBR > SPACE                                          
              MOVE 'T'        TO ACAT-NEXT                                      
              MOVE 'ACAT22TH' TO CALLED-PROGRAM-NAME                            
              MOVE 'ACAT33FC' TO ACAT-CALLING-PROG-NAME                         
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           END-IF.                                                              
      *END*                                                                     
      *** 01/13/99 -----------------------------------------------*             
      *  PF10 IN ACAT12IR,13IF,14RC XCTL TO ACAT21PT                            
           IF EIBAID = DFHPF10   AND                                            
              ACAT-CALLING-PROG-NAME = 'ACAT21PT'  AND                          
             (ACAT-PROGRAM-NAME = 'ACAT12IR'                                    
                               OR 'ACAT13IF'                                    
                               OR 'ACAT14RC') AND                               
              ACAT-CONTROL-NBR > SPACE                                          
              MOVE 'S'        TO ACAT-NEXT                                      
              MOVE 'ACAT21PT' TO CALLED-PROGRAM-NAME                            
              MOVE ACAT-PROGRAM-NAME TO ACAT-CALLING-PROG-NAME                  
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           END-IF.                                                              
      *END*                                                                     
      *** 01/13/99 -----------------------------------------------*             
      *  PF10 IN ACAT11PT,12IR,13IF XCTL TO ACAT15TC                            
           IF EIBAID = DFHPF10   AND                                            
              ACAT-CALLING-PROG-NAME = 'ACAT15TC'  AND                          
             (ACAT-PROGRAM-NAME = 'ACAT11PT'                                    
                               OR 'ACAT12IR'                                    
                               OR 'ACAT13IF') AND                               
              ACAT-CONTROL-NBR > SPACE                                          
              MOVE 'N'        TO ACAT-NEXT                                      
              MOVE 'ACAT15TC' TO CALLED-PROGRAM-NAME                            
              MOVE ACAT-PROGRAM-NAME TO ACAT-CALLING-PROG-NAME                  
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           END-IF.                                                              
      *END*                                                                     
      *** 01/19/99 -----------------------------------------------*             
      *  PF10 IN ACAT02IT XCTL TO ACAT22TH                                      
           IF EIBAID = DFHPF10   AND                                            
              ACAT-CALLING-PROG-NAME = 'ACAT22TH'  AND                          
              ACAT-PROGRAM-NAME = 'ACAT02IT'       AND                          
              ACAT-CONTROL-NBR > SPACE                                          
              MOVE 'T'        TO ACAT-NEXT                                      
              MOVE 'ACAT22TH' TO CALLED-PROGRAM-NAME                            
              MOVE ACAT-PROGRAM-NAME TO ACAT-CALLING-PROG-NAME                  
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           END-IF.                                                              
      *END*                                                                     
      *** 10/9/98 ------------------------------------------------*             
      *  PF10 IN ACAT04RS (RECEIVER REVIEW SCREEN) XCTL TO ACAT21PT             
           IF EIBAID = DFHPF10   AND                                            
              ACAT-CALLING-PROG-NAME = 'ACAT21PT'  AND                          
              ACAT-PROGRAM-NAME = 'ACAT04RS'       AND                          
              ACAT-CONTROL-NBR > SPACE                                          
              MOVE 'S'        TO ACAT-NEXT                                      
              MOVE 'ACAT21PT' TO CALLED-PROGRAM-NAME                            
              MOVE 'ACAT04RS' TO ACAT-CALLING-PROG-NAME                         
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           END-IF.                                                              
      *END*                                                                     
      *** 11/5/98 ------------------------------------------------*             
      *  PF10 IN ACAT05RN (REC/NON-STAND REV SCREEN) XCTL TO ACAT21PT           
           IF EIBAID = DFHPF10   AND                                            
              ACAT-CALLING-PROG-NAME = 'ACAT21PT'  AND                          
              ACAT-PROGRAM-NAME = 'ACAT05RN'       AND                          
              ACAT-CONTROL-NBR > SPACE                                          
              MOVE 'S'        TO ACAT-NEXT                                      
              MOVE 'ACAT21PT' TO CALLED-PROGRAM-NAME                            
              MOVE 'ACAT05RN' TO ACAT-CALLING-PROG-NAME                         
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           END-IF.                                                              
      *** 12/15/98 ------------------------------------------------*            
      *  PF10 IN ACAT02IT (REC/INITIATE FULL TRNFR) XCTL TO ACAT06JC            
           IF EIBAID = DFHPF10   AND                                            
              ACAT-CALLING-PROG-NAME = 'ACAT06JC'  AND                          
              ACAT-PROGRAM-NAME = 'ACAT02IT'       AND                          
              ACAT-CONTROL-NBR > SPACE                                          
              MOVE 'F'        TO ACAT-NEXT                                      
              MOVE 'ACAT06JC' TO CALLED-PROGRAM-NAME                            
              MOVE 'ACAT02IT' TO ACAT-CALLING-PROG-NAME                         
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           END-IF.                                                              
      *** 12/16/98 ------------------------------------------------*            
      *  PF10 IN ACAT02IT (REC/INITIATE FULL TRNFR) XCTL TO ACAT07JS            
           IF EIBAID = DFHPF10   AND                                            
              ACAT-CALLING-PROG-NAME = 'ACAT07JS'  AND                          
              ACAT-PROGRAM-NAME = 'ACAT02IT'       AND                          
              ACAT-CONTROL-NBR > SPACE                                          
              MOVE 'G'        TO ACAT-NEXT                                      
              MOVE 'ACAT07JS' TO CALLED-PROGRAM-NAME                            
              MOVE 'ACAT02IT' TO ACAT-CALLING-PROG-NAME                         
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           END-IF.                                                              
      *END*                                                                     
           EVALUATE TRUE                                                        
              WHEN EIBAID = DFHPF10 OR DFHPF12                                  
                   PERFORM RETURN-TO-MENU-RTN                                   
              WHEN EIBAID = DFHPF11 OR DFHCLEAR                                 
                   PERFORM RETURN-CONTROL-RTN                                   
           END-EVALUATE.                                                        
                                                                                
                                                                                
       RETURN-FROM-DETAIL-RTN.                                                  
           IF (ACAT-PROGRAM-NAME = 'ACAT04RS' OR 'ACAT05RN' OR                  
                                   'ACAT10NT' OR 'ACAT11PT' OR                  
                                   'ACAT20OO' OR 'ACAT24AA')                    
              MOVE ACAT-COM-RESTORE-AREA TO ACAT-COMMON-WORK-AREA               
              PERFORM INVOKE-DETAIL-PROGRAM-RTN                                 
           END-IF.                                                              
                                                                                
       EJECT                                                                    
                                                                                
       RETURN-TO-MENU-RTN.                                                      
     *** THE FOLLOWING 5 LINES ADDED TO SEND SUB-MENU WHEN PF10 RETURN          
     *** AND USER ORIGINALLY TOOK THIS PATH.                                    
           IF EIBAID = DFHPF10                                                  
           AND (ACAT-MENU-FLAG = 'R' OR 'D' OR 'I' OR 'O')                      
           AND  ACAT-PROGRAM-NAME NOT = 'ACAT01CP'                              
              CONTINUE                                                          
           ELSE                                                                 
              MOVE ' '       TO ACAT-MENU-FLAG                                  
11/12      END-IF.                                                              
           MOVE -1        TO MMSELL.                                            
           MOVE 'ENTER SELECTION PLEASE!'  TO SYSTEM-MSG.                       
           MOVE SPACES    TO ACAT-PROGRAM-NAME                                  
                             ACAT-CALLING-PROG-NAME                             
TCK                          ACAT-INPUT-AREA.                                   
                                                                                
           MOVE  LOW-VALUES          TO MENUMAPI.                               
LRM****** PUT BACK THE FOLLOWING MOVES:                                         
      *    MOVE SPACES               TO  MMBRO, MMACO, MMRRO, MCURO,            
      *                                  MMTFRO, MMRDO, MMBKRO,                 
      *                                  MMSTATO, MMSDO                         
           MOVE  ACAT-INP-BRANCH     TO MMBRO.                                  
           MOVE  ACAT-INP-ACCOUNT    TO MMACO.                                  
           MOVE  ACAT-INP-RR         TO MMRRO.                                  
           MOVE  ACAT-INP-TFR-TYP    TO MMTFRO.                                 
           MOVE  ACAT-INP-RCV-DEL    TO MMRDO.                                  
           MOVE  ACAT-INP-CONTRA-BKR TO MMBKRO.                                 
           MOVE  ACAT-INP-STATUS     TO MMSTATO.                                
           MOVE  ACAT-INP-STTL-DT    TO MMSDO.                                  
LRM005     MOVE 'ACAT01CP' TO ACAT-CALLING-PROG-NAME                            
           PERFORM SEND-MENU-MAP-RETURN.                                        
                                                                                
       EJECT                                                                    
       LINK-TO-RATT-RTN.                                                        
           MOVE MTRANSI  TO  CR-TRANSID.                                        
           PERFORM INVOKE-RATT-RTN.                                             
                                                                                
       EJECT                                                                    
       RECEIVE-MENU-RTN.                                                        
           MOVE +1000 TO ACAT-RECEIVE-MAP-LENGTH.                               
           EXEC CICS RECEIVE                                                    
                     INTO(ACAT-RECEIVE-MAP)                                     
                     LENGTH(ACAT-RECEIVE-MAP-LENGTH)                            
           END-EXEC.                                                            
                                                                                
           MOVE LOW-VALUES TO  HDRMAPI, TRLMAPI.                                
           EVALUATE TRUE                                                        
              WHEN ACAT-MAIN-MENU                                               
                   PERFORM RECEIVE-MAIN-MENU                                    
              WHEN ACAT-RECEIVER-MENU                                           
                   PERFORM RECEIVE-RECEIVER-MENU                                
              WHEN ACAT-DELIVER-MENU                                            
                   PERFORM RECEIVE-DELIVER-MENU                                 
              WHEN ACAT-INQUIRY-MENU                                            
                   PERFORM RECEIVE-INQUIRY-MENU                                 
              WHEN ACAT-PROCESS-MENU                                            
                   PERFORM RECEIVE-PROCESS-MENU                                 
           END-EVALUATE.                                                        
                                                                                
       RECEIVE-MAIN-MENU.                                                       
           MOVE LOW-VALUES TO  MENUMAPI.                                        
      ***  HEADER MAP PORTION                                                   
           EXEC CICS RECEIVE MAP('HDRMAP')                                      
                     MAPSET('ACAT00M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(HDRMAPI)                                              
           END-EXEC                                                             
      ***  MAP BODY PORTION                                                     
           EXEC CICS RECEIVE MAP('MENUMAP')                                     
                     MAPSET('ACAT01M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(MENUMAPI)                                             
           END-EXEC                                                             
      ***  TRAILER MAP PORTION                                                  
           EXEC CICS RECEIVE MAP('TRLMAP')                                      
                     MAPSET('ACAT00M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(TRLMAPI)                                              
           END-EXEC.                                                            
                                                                                
       RECEIVE-RECEIVER-MENU.                                                   
           MOVE LOW-VALUES TO  MENURI.                                          
      ***  HEADER MAP PORTION                                                   
           EXEC CICS RECEIVE MAP('HDRMAP')                                      
                     MAPSET('ACAT00M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(HDRMAPI)                                              
           END-EXEC                                                             
      ***  MAP BODY PORTION                                                     
           EXEC CICS RECEIVE MAP('MENUR')                                       
                     MAPSET('ACAT01M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(MENURI)                                               
           END-EXEC                                                             
      ***  TRAILER MAP PORTION                                                  
           EXEC CICS RECEIVE MAP('TRLMAP')                                      
                     MAPSET('ACAT00M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(TRLMAPI)                                              
           END-EXEC.                                                            
                                                                                
       RECEIVE-DELIVER-MENU.                                                    
           MOVE LOW-VALUES TO  MENUDI.                                          
      ***  HEADER MAP PORTION                                                   
           EXEC CICS RECEIVE MAP('HDRMAP')                                      
                     MAPSET('ACAT00M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(HDRMAPI)                                              
           END-EXEC                                                             
      ***  MAP BODY PORTION                                                     
           EXEC CICS RECEIVE MAP('MENUD')                                       
                     MAPSET('ACAT01M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(MENUDI)                                               
           END-EXEC                                                             
      ***  TRAILER MAP PORTION                                                  
           EXEC CICS RECEIVE MAP('TRLMAP')                                      
                     MAPSET('ACAT00M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(TRLMAPI)                                              
           END-EXEC.                                                            
                                                                                
       RECEIVE-INQUIRY-MENU.                                                    
           MOVE LOW-VALUES TO  MENUII.                                          
      ***  HEADER MAP PORTION                                                   
           EXEC CICS RECEIVE MAP('HDRMAP')                                      
                     MAPSET('ACAT00M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(HDRMAPI)                                              
           END-EXEC                                                             
      ***  MAP BODY PORTION                                                     
           EXEC CICS RECEIVE MAP('MENUI')                                       
                     MAPSET('ACAT01M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(MENUII)                                               
           END-EXEC                                                             
      ***  TRAILER MAP PORTION                                                  
           EXEC CICS RECEIVE MAP('TRLMAP')                                      
                     MAPSET('ACAT00M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(TRLMAPI)                                              
           END-EXEC.                                                            
                                                                                
       RECEIVE-PROCESS-MENU.                                                    
           MOVE LOW-VALUES TO  MENUPI.                                          
      ***  HEADER MAP PORTION                                                   
           EXEC CICS RECEIVE MAP('HDRMAP')                                      
                     MAPSET('ACAT00M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(HDRMAPI)                                              
           END-EXEC                                                             
      ***  MAP BODY PORTION                                                     
           EXEC CICS RECEIVE MAP('MENUP')                                       
                     MAPSET('ACAT01M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(MENUPI)                                               
           END-EXEC                                                             
                                                                                
      ***  TRAILER MAP PORTION                                                  
           EXEC CICS RECEIVE MAP('TRLMAP')                                      
                     MAPSET('ACAT00M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(TRLMAPI)                                              
           END-EXEC.                                                            
           EJECT                                                                
       RECEIVE-DETAIL-RTN.                                                      
           MOVE +1000 TO ACAT-RECEIVE-MAP-LENGTH.                               
LRM        MOVE LOW-VALUES TO ACAT-RECEIVE-MAP.                                 
           EXEC CICS RECEIVE                                                    
                     INTO(ACAT-RECEIVE-MAP)                                     
                     LENGTH(ACAT-RECEIVE-MAP-LENGTH)                            
           END-EXEC.                                                            
                                                                                
      ***  HEADER MAP PORTION                                                   
           EXEC CICS RECEIVE MAP('HDRMAP')                                      
                     MAPSET('ACAT00M')                                          
                     FROM(ACAT-RECEIVE-MAP)                                     
                     INTO(HDRMAPI)                                              
           END-EXEC.                                                            
           EJECT                                                                
                                                                                
       VALIDATE-NEXT-OPTION-RTN.                                                
           MOVE 'N'             TO INPUT-ERROR-FLAG.                            
           MOVE ACAT-INP-SEL    TO WS-ACAT-NEXT.                                
           EVALUATE TRUE                                                        
              WHEN NOT VALID-ACAT-NEXT                                          
                  SET INPUT-ERROR TO TRUE                                       
           END-EVALUATE.                                                        
      **** TCK                                                                  
      **** IF ACAT-INP-SEL = 'R'  OR  'D'                                       
      ****    MOVE                                                              
       EJECT                                                                    
      *                                                                         
       EDIT-ACAT01M-RTN.                                                        
      ******************************************************************        
      *                    EDIT  INDIVIDUAL  MAP                       *        
      ******************************************************************        
           IF ACAT-MENU-FLAG = ' '                                              
              IF MMSELL > 0                                                     
                 IF MMSELI = SPACES OR LOW-VALUES                               
                    CONTINUE                                                    
                 ELSE                                                           
                    MOVE MMSELI           TO ACAT-INP-SEL                       
      ****          MOVE -1               TO MMSELL                             
      ****          MOVE ATT-UNPROT-BRT   TO MMSELA                             
                    SET ACAT-CHANGES-MADE TO TRUE                               
                 END-IF                                                         
              ELSE                                                              
                 IF MMSELA = ERASE-KEY                                          
                    MOVE SPACES TO ACAT-INP-SEL                                 
                    SET ACAT-CHANGES-MADE TO TRUE                               
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF ACAT-MENU-FLAG = 'R'                                              
              IF MRSELL > 0                                                     
                 IF MRSELI = SPACES OR LOW-VALUES                               
                    CONTINUE                                                    
                 ELSE                                                           
                    MOVE MRSELI           TO ACAT-INP-SEL                       
      ***           MOVE -1               TO MRSELL                             
      ***           MOVE ATT-UNPROT-BRT   TO MRSELA                             
                    SET ACAT-CHANGES-MADE TO TRUE                               
                 END-IF                                                         
              ELSE                                                              
                 IF MRSELA = ERASE-KEY                                          
                    MOVE SPACES TO ACAT-INP-SEL                                 
                    SET ACAT-CHANGES-MADE TO TRUE                               
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF ACAT-MENU-FLAG = 'D'                                              
              IF MDSELL > 0                                                     
                 IF MDSELI = SPACES OR LOW-VALUES                               
                    CONTINUE                                                    
                 ELSE                                                           
                    MOVE MDSELI           TO ACAT-INP-SEL                       
      ****          MOVE -1               TO MDSELL                             
      ****          MOVE ATT-UNPROT-BRT   TO MDSELA                             
                    SET ACAT-CHANGES-MADE TO TRUE                               
                 END-IF                                                         
              ELSE                                                              
                 IF MDSELA = ERASE-KEY                                          
                    MOVE SPACES TO ACAT-INP-SEL                                 
                    SET ACAT-CHANGES-MADE TO TRUE                               
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF ACAT-MENU-FLAG = 'I'                                              
              IF MISELL > 0                                                     
                 IF MISELI = SPACES OR LOW-VALUES                               
                    CONTINUE                                                    
                 ELSE                                                           
                    MOVE MISELI           TO ACAT-INP-SEL                       
      ****          MOVE -1               TO MISELL                             
      ****          MOVE ATT-UNPROT-BRT   TO MISELA                             
                    SET ACAT-CHANGES-MADE TO TRUE                               
                 END-IF                                                         
              ELSE                                                              
                 IF MISELA = ERASE-KEY                                          
                    MOVE SPACES TO ACAT-INP-SEL                                 
                    SET ACAT-CHANGES-MADE TO TRUE                               
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF ACAT-MENU-FLAG = 'O'                                              
              IF MPSELL > 0                                                     
                 IF MPSELI = SPACES OR LOW-VALUES                               
                    CONTINUE                                                    
                 ELSE                                                           
                    MOVE MPSELI           TO ACAT-INP-SEL                       
      ****          MOVE -1               TO MISELL                             
      ****          MOVE ATT-UNPROT-BRT   TO MISELA                             
                    SET ACAT-CHANGES-MADE TO TRUE                               
                 END-IF                                                         
              ELSE                                                              
                 IF MPSELA = ERASE-KEY                                          
                    MOVE SPACES TO ACAT-INP-SEL                                 
                    SET ACAT-CHANGES-MADE TO TRUE                               
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
      /                                                                         
       EDIT-ACAT00M-RTN.                                                        
      ******************************************************************        
      *                    EDIT  TRAILER  MAP   (SEARCH BAR ENTRIES)   *        
      ******************************************************************        
      *                                                                         
           IF MMBRL > 0                                                         
              IF MMBRI = SPACES OR LOW-VALUES                                   
                 MOVE SPACES TO ACAT-INP-BRANCH, MMBRO                          
              ELSE                                                              
                 MOVE MMBRI TO ACAT-INP-BRANCH                                  
                 SET ACAT-SRCH-ENTRY   TO TRUE                                  
           ELSE                                                                 
              IF MMBRA = ERASE-KEY                                              
                 MOVE SPACES TO ACAT-INP-BRANCH, MMBRO                          
                 SET ACAT-SRCH-ENTRY   TO TRUE                                  
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF MMACL > 0                                                         
              IF MMACI = SPACES OR LOW-VALUES                                   
                 MOVE SPACES TO ACAT-INP-ACCOUNT, MMACO                         
              ELSE                                                              
                 MOVE MMACI TO ACAT-INP-ACCOUNT                                 
                 SET ACAT-SRCH-ENTRY TO TRUE                                    
           ELSE                                                                 
              IF MMACA = ERASE-KEY                                              
                 MOVE SPACES TO ACAT-INP-ACCOUNT, MMACO                         
                 SET ACAT-SRCH-ENTRY TO TRUE                                    
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF MMRRL > 0                                                         
              IF MMRRI = SPACES OR LOW-VALUES                                   
                 MOVE SPACES TO ACAT-INP-RR, MMRRO                              
              ELSE                                                              
                 MOVE MMRRI TO ACAT-INP-RR                                      
                 SET ACAT-SRCH-ENTRY TO TRUE                                    
           ELSE                                                                 
              IF MMRRA = ERASE-KEY                                              
                 MOVE SPACES TO ACAT-INP-RR, MMRRO                              
                 SET ACAT-SRCH-ENTRY TO TRUE                                    
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF MCURL > 0                                                         
              IF MCURI = SPACES OR LOW-VALUES                                   
                 MOVE SPACES TO ACAT-INP-CUR, MCURO                             
              ELSE                                                              
                 MOVE MCURI TO ACAT-INP-CUR                                     
                 SET ACAT-SRCH-ENTRY TO TRUE                                    
           ELSE                                                                 
              IF MCURA = ERASE-KEY                                              
                 MOVE SPACES TO ACAT-INP-CUR, MCURO                             
                 SET ACAT-SRCH-ENTRY TO TRUE                                    
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF MMTFRL > 0                                                        
              IF MMTFRI = SPACES OR LOW-VALUES                                  
                 MOVE SPACES TO ACAT-INP-TFR-TYP, MMTFRO                        
              ELSE                                                              
              MOVE MMTFRI TO ACAT-INP-TFR-TYP                                   
              SET ACAT-SRCH-ENTRY TO TRUE                                       
           ELSE                                                                 
              IF MMTFRA = ERASE-KEY                                             
                 MOVE SPACES TO ACAT-INP-TFR-TYP, MMTFRO                        
                 SET ACAT-SRCH-ENTRY TO TRUE                                    
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF MMRDL > 0                                                         
              IF MMRDI = SPACES OR LOW-VALUES                                   
                 MOVE SPACES TO ACAT-INP-RCV-DEL, MMRDO                         
              ELSE                                                              
                 MOVE MMRDI TO ACAT-INP-RCV-DEL                                 
                 SET ACAT-SRCH-ENTRY TO TRUE                                    
           ELSE                                                                 
              IF MMRDA = ERASE-KEY                                              
                 MOVE SPACES TO ACAT-INP-RCV-DEL, MMRDO                         
                 SET ACAT-SRCH-ENTRY TO TRUE                                    
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF MMBKRL > 0                                                        
              IF MMBKRI = SPACES OR LOW-VALUES                                  
                 MOVE SPACES TO ACAT-INP-CONTRA-BKR, MMBKRO                     
              ELSE                                                              
              MOVE MMBKRI TO ACAT-INP-CONTRA-BKR                                
              SET ACAT-SRCH-ENTRY TO TRUE                                       
           ELSE                                                                 
              IF MMBKRA = ERASE-KEY                                             
                 MOVE SPACES TO ACAT-INP-CONTRA-BKR, MMBKRO                     
                 SET ACAT-SRCH-ENTRY TO TRUE                                    
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF MMSTATL > 0                                                       
              IF MMSTATI = SPACES OR LOW-VALUES                                 
                 MOVE SPACES TO ACAT-INP-STATUS, MMSTATO                        
              ELSE                                                              
                 MOVE MMSTATI TO ACAT-INP-STATUS                                
                 SET ACAT-SRCH-ENTRY TO TRUE                                    
           ELSE                                                                 
              IF MMSTATA = ERASE-KEY                                            
                 MOVE SPACES TO ACAT-INP-STATUS, MMSTATO                        
                 SET ACAT-SRCH-ENTRY TO TRUE                                    
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF MMSDL > 0                                                         
              IF MMSDI = SPACES OR LOW-VALUES                                   
                 MOVE SPACES TO ACAT-INP-STTL-DT, MMSDO                         
              ELSE                                                              
                 MOVE MMSDI TO ACAT-INP-STTL-DT                                 
                 SET ACAT-SRCH-ENTRY TO TRUE                                    
           ELSE                                                                 
              IF MMSDA = ERASE-KEY                                              
                 MOVE SPACES TO ACAT-INP-STTL-DT, MMSDO                         
                 SET ACAT-SRCH-ENTRY TO TRUE                                    
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF (ACAT-INP-BRANCH = SPACES OR LOW-VALUES)     AND                  
              (ACAT-INP-ACCOUNT = SPACES OR LOW-VALUES)    AND                  
              (ACAT-INP-RR = SPACE OR LOW-VALUES)          AND                  
              (ACAT-INP-TFR-TYP = SPACES OR LOW-VALUES)    AND                  
              (ACAT-INP-RCV-DEL = SPACE  OR LOW-VALUES)    AND                  
              (ACAT-INP-CONTRA-BKR = SPACES OR LOW-VALUES) AND                  
              (ACAT-INP-STATUS = SPACES OR LOW-VALUES)     AND                  
              (ACAT-INP-STTL-DT = SPACES OR LOW-VALUES)                         
               MOVE SPACES TO TRLMSGO,                                          
                              ACAT-SEARCH-RETURN                                
               SET ACAT-NO-SRCH-ENTRY TO TRUE                                   
           END-IF.                                                              
       EJECT                                                                    
                                                                                
       INVOKE-DETAIL-PROGRAM-RTN.                                               
      *** TBTIKUO --------------------------------- 6/27/98                     
           IF (EIBAID = DFHPF3   AND                                            
              (ACAT-PROGRAM-NAME = 'ACAT04RS' OR 'ACAT05RN' OR                  
                                   'ACAT10NT' OR 'ACAT11PT' OR                  
LRM012                             'ACAT33FC'))                                 
LRM001     OR (EIBAID = DFHPF2   AND                                            
LRM001        (ACAT-PROGRAM-NAME = 'ACAT04RS'))                                 
10/22 *TCK    IF ACAT-INP-BR-AC-FIELDS = SPACES OR LOW-VALUES                   
              IF ACAT-BR-AC = SPACES OR LOW-VALUES                              
                 CONTINUE                                                       
              ELSE                                                              
                 IF ACAT-PROGRAM-NAME = 'ACAT24AA'                              
                    MOVE DFHPF2 TO EIBAID                                       
                 END-IF                                                         
                 PERFORM LINK-TO-MRGN-RTN                                       
              END-IF                                                            
           END-IF.                                                              
      *** TBTIKUO --------------------------------- 6/27/98                     
           PERFORM SELECT-XCTL-PROGRAM-RTN.                                     
      **                                                                        
LRM002     PERFORM SCREEN-SECURITY-CHECK                                        
LRM002        THRU SCREEN-SECURITY-CHECK-EXIT.                                  
           IF (EIBAID NOT = DFHENTER)                                           
              SET ACAT-NO-CHANGES-MADE TO TRUE                                  
           END-IF.                                                              
           EXEC CICS XCTL PROGRAM(CALLED-PROGRAM-NAME)                          
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
           MOVE CALLED-PROGRAM-NAME TO ERROR-PROG-NAME.                         
           MOVE ERROR-PROG-MSG      TO SYSTEM-MSG.                              
           PERFORM ERROR-RTN.                                                   
096300     EJECT                                                        07630002
                                                                                
      *READ-ACAT-TABLE.                                                 03700002
      *    EXEC CICS READ                                               03710002
      *              DATASET('ACATXXX')                                 03720002
      *              INTO(XXXXXXXXX)                                    03730002
      *              RIDFLD(XXXXXX-ID)                                  03740002
      *              LENGTH(LENGTH OF B1-RECORD)                        03750002
      *    END-EXEC.                                                    03760002
                                                                        03770002
      *EJECT                                                                    
                                                                                
       SEND-MENU-MAP-RETURN.                                                    
           EVALUATE TRUE                                                        
              WHEN ACAT-MAIN-MENU                                               
                   PERFORM SEND-MAIN-MENU                                       
              WHEN ACAT-RECEIVER-MENU                                           
      *            PERFORM READ-ACAT-TABLE                                      
                   PERFORM SEND-RECEIVER-MENU                                   
              WHEN ACAT-DELIVER-MENU                                            
      *            PERFORM READ-ACAT-TABLE                                      
                   PERFORM SEND-DELIVER-MENU                                    
              WHEN ACAT-INQUIRY-MENU                                            
                   PERFORM SEND-INQUIRY-MENU                                    
              WHEN ACAT-PROCESS-MENU                                            
                   PERFORM SEND-PROCESS-MENU                                    
           END-EVALUATE.                                                        
      *                                                                         
      ******************************************************************        
      *           SEND MAIN MENU SCREEN                                *        
      ******************************************************************        
       SEND-MAIN-MENU.                                                          
                                                                                
           MOVE 'ACAX'           TO  MTRANSO.                                   
           MOVE WSMMDDYY         TO  MDATEO.                                    
           MOVE WSTIME           TO  MTIMEO.                                    
           MOVE TWA-CLIENT-NO-9  TO  MCLINBO.                                   
      ***  MAP HEADER                                                           
           EXEC CICS SEND MAP('HDRMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM (HDRMAPO)                                             
                     ERASE                                                      
                     ACCUM                                                      
           END-EXEC.                                                            
      ***  MAP BODY                                                             
           MOVE -1        TO  MMSELL.                                           
           MOVE SPACE     TO  MMSELO.                                           
           EXEC CICS SEND MAP('MENUMAP')                                        
                     MAPSET('ACAT01M')                                          
                     FROM(MENUMAPO)                                             
                     CURSOR                                                     
                     ACCUM                                                      
           END-EXEC                                                             
      ***  MAP TRAILER                                                          
           MOVE SYSTEM-MSG     TO  TRLMSGO.                                     
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                                     
           EXEC CICS SEND MAP('TRLMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM(TRLMAPO)                                              
                     ACCUM                                                      
           END-EXEC.                                                            
           EXEC CICS SEND PAGE                                                  
           END-EXEC.                                                            
           IF EIBRCODE NOT EQUAL LOW-VALUES                                     
              MOVE 'SEND-MAIN-MENU'  TO WS-CICS-DISPLAY                         
              MOVE EIBRCODE          TO WS-CICS-RC                              
              MOVE WS-CICS-MSG       TO WS-MSG-OUT                              
              PERFORM SEND-MSG-RETURN-TO-CICS                                   
           ELSE                                                                 
              MOVE 'ACAT01CP' TO ACAT-PROGRAM-NAME.                             
              MOVE SPACES   TO ACAT-NEXT, ACAT-INP-SEL.                         
              PERFORM RETURN-TO-CICS.                                           
           EJECT                                                                
      *                                                                         
      ******************************************************************        
      *           SEND RECEIVER MENU SCREEN                            *        
      ******************************************************************        
       SEND-RECEIVER-MENU.                                                      
      ***                                                                       
           MOVE LOW-VALUES       TO MENURI.                                     
           MOVE 'ACAX'           TO  MTRANSO.                                   
           MOVE WSMMDDYY         TO  MDATEO.                                    
           MOVE WSTIME           TO  MTIMEO.                                    
           MOVE TWA-CLIENT-NO-9  TO  MCLINBO.                                   
      *** MAP HEADER                                                            
           EXEC CICS SEND MAP('HDRMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM (HDRMAPO)                                             
                     ERASE                                                      
                     ACCUM                                                      
           END-EXEC.                                                            
      *** MAP BODY                                                              
           MOVE -1        TO  MRSELL.                                           
           MOVE SPACE     TO  MRSELO.                                           
           EXEC CICS SEND MAP('MENUR')                                          
                     MAPSET('ACAT01M')                                          
                     FROM(MENURO)                                               
                     CURSOR                                                     
                     ACCUM                                                      
           END-EXEC                                                             
      *** MAP TRAILER                                                           
           MOVE SYSTEM-MSG     TO  TRLMSGO.                                     
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                                     
           EXEC CICS SEND MAP('TRLMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM(TRLMAPO)                                              
                     ACCUM                                                      
           END-EXEC.                                                            
           EXEC CICS SEND PAGE                                                  
           END-EXEC.                                                            
           IF EIBRCODE NOT EQUAL LOW-VALUES                                     
              MOVE 'SEND-RECEIVER-MENU'  TO WS-CICS-DISPLAY                     
              MOVE EIBRCODE              TO WS-CICS-RC                          
              MOVE WS-CICS-MSG           TO WS-MSG-OUT                          
              PERFORM SEND-MSG-RETURN-TO-CICS                                   
           ELSE                                                                 
              MOVE 'ACAT01CP' TO ACAT-PROGRAM-NAME.                             
              MOVE SPACES   TO ACAT-NEXT, ACAT-INP-SEL.                         
              PERFORM RETURN-TO-CICS.                                           
           EJECT                                                                
                                                                                
      ******************************************************************        
      *           SEND DELIVER  MENU SCREEN                            *        
      ******************************************************************        
       SEND-DELIVER-MENU.                                                       
      ***                                                                       
           MOVE LOW-VALUES       TO MENUDI.                                     
           MOVE 'ACAX'           TO  MTRANSO.                                   
           MOVE WSMMDDYY         TO  MDATEO.                                    
           MOVE WSTIME           TO  MTIMEO.                                    
           MOVE TWA-CLIENT-NO-9  TO  MCLINBO.                                   
      *** MAP HEADER                                                            
           EXEC CICS SEND MAP('HDRMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM (HDRMAPO)                                             
                     ERASE                                                      
                     ACCUM                                                      
           END-EXEC.                                                            
      *** MAP BODY                                                              
           MOVE -1        TO  MDSELL.                                           
           MOVE SPACE     TO  MDSELO.                                           
           EXEC CICS SEND MAP('MENUD')                                          
                     MAPSET('ACAT01M')                                          
                     FROM(MENUDO)                                               
                     CURSOR                                                     
                     ACCUM                                                      
           END-EXEC.                                                            
      *** MAP TRAILER                                                           
           MOVE SYSTEM-MSG     TO  TRLMSGO.                                     
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                                     
           EXEC CICS SEND MAP('TRLMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM(TRLMAPO)                                              
                     ACCUM                                                      
           END-EXEC.                                                            
           EXEC CICS SEND PAGE                                                  
           END-EXEC.                                                            
           IF EIBRCODE NOT EQUAL LOW-VALUES                                     
              MOVE 'SEND-DELIVER-MENU'   TO WS-CICS-DISPLAY                     
              MOVE EIBRCODE              TO WS-CICS-RC                          
              MOVE WS-CICS-MSG           TO WS-MSG-OUT                          
              PERFORM SEND-MSG-RETURN-TO-CICS                                   
           ELSE                                                                 
              MOVE 'ACAT01CP' TO ACAT-PROGRAM-NAME.                             
              MOVE SPACES   TO ACAT-NEXT, ACAT-INP-SEL.                         
              PERFORM RETURN-TO-CICS.                                           
           EJECT                                                                
                                                                                
      ******************************************************************        
      *           SEND INQUIRY  MENU SCREEN                            *        
      ******************************************************************        
       SEND-INQUIRY-MENU.                                                       
      ***                                                                       
           MOVE LOW-VALUES       TO MENUII.                                     
           MOVE 'ACAX'           TO  MTRANSO.                                   
           MOVE WSMMDDYY         TO  MDATEO.                                    
           MOVE WSTIME           TO  MTIMEO.                                    
           MOVE TWA-CLIENT-NO-9  TO  MCLINBO.                                   
      *** MAP HEADER                                                            
           EXEC CICS SEND MAP('HDRMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM (HDRMAPO)                                             
                     ERASE                                                      
                     ACCUM                                                      
           END-EXEC.                                                            
      *** MAP BODY                                                              
           MOVE -1        TO  MISELL.                                           
           MOVE SPACE     TO  MISELI.                                           
           EXEC CICS SEND MAP('MENUI')                                          
                     MAPSET('ACAT01M')                                          
                     FROM(MENUIO)                                               
                     CURSOR                                                     
                     ACCUM                                                      
           END-EXEC.                                                            
      *** MAP TRAILER                                                           
           MOVE SYSTEM-MSG     TO  TRLMSGO.                                     
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                                     
           EXEC CICS SEND MAP('TRLMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM(TRLMAPO)                                              
                     ACCUM                                                      
           END-EXEC.                                                            
           EXEC CICS SEND PAGE                                                  
           END-EXEC.                                                            
           IF EIBRCODE NOT EQUAL LOW-VALUES                                     
              MOVE 'SEND-INQUIRY-MENU'   TO WS-CICS-DISPLAY                     
              MOVE EIBRCODE              TO WS-CICS-RC                          
              MOVE WS-CICS-MSG           TO WS-MSG-OUT                          
              PERFORM SEND-MSG-RETURN-TO-CICS                                   
           ELSE                                                                 
              MOVE 'ACAT01CP' TO ACAT-PROGRAM-NAME.                             
              MOVE SPACES   TO ACAT-NEXT, ACAT-INP-SEL.                         
              PERFORM RETURN-TO-CICS.                                           
           EJECT                                                                
                                                                                
      ******************************************************************        
      *           SEND PROCESSING  MENU SCREEN                         *        
      ******************************************************************        
       SEND-PROCESS-MENU.                                                       
      ***                                                                       
           MOVE LOW-VALUES       TO MENUPI.                                     
           MOVE 'ACAX'           TO  MTRANSO.                                   
           MOVE WSMMDDYY         TO  MDATEO.                                    
           MOVE WSTIME           TO  MTIMEO.                                    
           MOVE TWA-CLIENT-NO-9  TO  MCLINBO.                                   
      *** MAP HEADER                                                            
           EXEC CICS SEND MAP('HDRMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM (HDRMAPO)                                             
                     ERASE                                                      
                     ACCUM                                                      
           END-EXEC.                                                            
      *** MAP BODY                                                              
           MOVE -1        TO  MPSELL.                                           
           MOVE SPACE     TO  MPSELO.                                           
           EXEC CICS SEND MAP('MENUP')                                          
                     MAPSET('ACAT01M')                                          
                     FROM(MENUPO)                                               
                     CURSOR                                                     
                     ACCUM                                                      
           END-EXEC.                                                            
                                                                                
      ***  MAP TRAILER                                                          
           MOVE SYSTEM-MSG     TO  TRLMSGO.                                     
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                                     
           EXEC CICS SEND MAP('TRLMAP')                                         
                     MAPSET('ACAT00M')                                          
                     FROM(TRLMAPO)                                              
                     ACCUM                                                      
           END-EXEC.                                                            
           EXEC CICS SEND PAGE                                                  
           END-EXEC.                                                            
           IF EIBRCODE NOT EQUAL LOW-VALUES                                     
              MOVE 'SEND-PROCESSING-MENU'  TO WS-CICS-DISPLAY                   
              MOVE EIBRCODE                TO WS-CICS-RC                        
              MOVE WS-CICS-MSG             TO WS-MSG-OUT                        
              PERFORM SEND-MSG-RETURN-TO-CICS                                   
           ELSE                                                                 
              MOVE 'ACAT01CP' TO ACAT-PROGRAM-NAME                              
              MOVE SPACES   TO ACAT-NEXT, ACAT-INP-SEL                          
              PERFORM RETURN-TO-CICS.                                           
           EJECT                                                                
                                                                                
       SEND-MAP-DATA-ONLY.                                                      
           EVALUATE TRUE                                                        
              WHEN ACAT-MAIN-MENU                                               
                   PERFORM SEND-MAIN-DATA                                       
              WHEN ACAT-RECEIVER-MENU                                           
                   PERFORM SEND-RECEIVER-DATA                                   
              WHEN ACAT-DELIVER-MENU                                            
                   PERFORM SEND-DELIVER-DATA                                    
              WHEN ACAT-INQUIRY-MENU                                            
                   PERFORM SEND-INQUIRY-DATA                                    
              WHEN ACAT-PROCESS-MENU                                            
                   PERFORM SEND-PROCESS-DATA                                    
           END-EVALUATE.                                                        
      *                                                                         
       SEND-MAIN-DATA.                                                          
      ***  MAP BODY                                                             
      *    MOVE -1             TO MMSELL                                        
      *    MOVE ATT-UNPROT-BRT TO MMSELA                                        
LRM        IF MMSELL = -1                                                       
              EXEC CICS SEND MAP('MENUMAP')                                     
                        MAPSET('ACAT01M')                                       
                        FROM(MENUMAPO)                                          
                        CURSOR                                                  
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
      ***  MAP TRAILER                                                          
              EXEC CICS SEND MAP('TRLMAP')                                      
                        MAPSET('ACAT00M')                                       
                        FROM(TRLMAPO)                                           
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
           ELSE                                                                 
              EXEC CICS SEND MAP('MENUMAP')                                     
                        MAPSET('ACAT01M')                                       
                        FROM(MENUMAPO)                                          
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
      ***  MAP TRAILER                                                          
              EXEC CICS SEND MAP('TRLMAP')                                      
                        MAPSET('ACAT00M')                                       
                        FROM(TRLMAPO)                                           
                        CURSOR                                                  
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
           END-IF.                                                              
           EXEC CICS SEND PAGE                                                  
           END-EXEC.                                                            
           IF EIBRCODE NOT EQUAL LOW-VALUES                                     
              MOVE 'SEND-MAIN-DATA   '   TO WS-CICS-DISPLAY                     
              MOVE EIBRCODE              TO WS-CICS-RC                          
              MOVE WS-CICS-MSG           TO WS-MSG-OUT                          
              PERFORM SEND-MSG-RETURN-TO-CICS                                   
           ELSE                                                                 
              MOVE 'ACAT01CP' TO ACAT-PROGRAM-NAME                              
              MOVE SPACES   TO ACAT-NEXT, ACAT-INP-SEL                          
              PERFORM RETURN-TO-CICS                                            
           END-IF.                                                              
                                                                                
       SEND-RECEIVER-DATA.                                                      
      *    MOVE -1             TO MRSELL                                        
      *    MOVE ATT-UNPROT-BRT TO MRSELA                                        
LRM        IF MRSELL = -1                                                       
              EXEC CICS SEND MAP('MENUR')                                       
                        MAPSET('ACAT01M')                                       
                        FROM(MENURO)                                            
                        CURSOR                                                  
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
      ***  MAP TRAILER                                                          
              EXEC CICS SEND MAP('TRLMAP')                                      
                        MAPSET('ACAT00M')                                       
                        FROM(TRLMAPO)                                           
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
           ELSE                                                                 
              EXEC CICS SEND MAP('MENUR')                                       
                        MAPSET('ACAT01M')                                       
                        FROM(MENURO)                                            
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
      ***  MAP TRAILER                                                          
              EXEC CICS SEND MAP('TRLMAP')                                      
                        MAPSET('ACAT00M')                                       
                        FROM(TRLMAPO)                                           
                        CURSOR                                                  
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
           END-IF.                                                              
           EXEC CICS SEND PAGE                                                  
           END-EXEC.                                                            
           IF EIBRCODE NOT EQUAL LOW-VALUES                                     
              MOVE 'SEND-RECEIVER-DATA'  TO WS-CICS-DISPLAY                     
              MOVE EIBRCODE              TO WS-CICS-RC                          
              MOVE WS-CICS-MSG           TO WS-MSG-OUT                          
              PERFORM SEND-MSG-RETURN-TO-CICS                                   
           ELSE                                                                 
              MOVE 'ACAT01CP' TO ACAT-PROGRAM-NAME                              
              MOVE SPACES   TO ACAT-NEXT, ACAT-INP-SEL                          
              PERFORM RETURN-TO-CICS                                            
           END-IF.                                                              
                                                                                
       SEND-DELIVER-DATA.                                                       
      *    MOVE -1                TO MDSELL                                     
      *    MOVE ATT-UNPROT-BRT TO MDSELA                                        
LRM        IF MDSELL = -1                                                       
              EXEC CICS SEND MAP('MENUD')                                       
                        MAPSET('ACAT01M')                                       
                        FROM(MENUDO)                                            
                        CURSOR                                                  
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
      ***  MAP TRAILER                                                          
              EXEC CICS SEND MAP('TRLMAP')                                      
                        MAPSET('ACAT00M')                                       
                        FROM(TRLMAPO)                                           
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
           ELSE                                                                 
              EXEC CICS SEND MAP('MENUD')                                       
                        MAPSET('ACAT01M')                                       
                        FROM(MENUDO)                                            
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
      ***  MAP TRAILER                                                          
              EXEC CICS SEND MAP('TRLMAP')                                      
                        MAPSET('ACAT00M')                                       
                        FROM(TRLMAPO)                                           
                        CURSOR                                                  
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
           END-IF.                                                              
           EXEC CICS SEND PAGE                                                  
           END-EXEC.                                                            
           IF EIBRCODE NOT EQUAL LOW-VALUES                                     
              MOVE 'SEND-DELIVER-DATA'   TO WS-CICS-DISPLAY                     
              MOVE EIBRCODE              TO WS-CICS-RC                          
              MOVE WS-CICS-MSG           TO WS-MSG-OUT                          
              PERFORM SEND-MSG-RETURN-TO-CICS                                   
           ELSE                                                                 
              MOVE 'ACAT01CP' TO ACAT-PROGRAM-NAME                              
              MOVE SPACES   TO ACAT-NEXT, ACAT-INP-SEL                          
              PERFORM RETURN-TO-CICS.                                           
                                                                                
                                                                                
       SEND-INQUIRY-DATA.                                                       
      *    MOVE -1                TO MISELL                                     
      *    MOVE ATT-UNPROT-BRT TO MISELA                                        
LRM        IF MISELL = -1                                                       
              EXEC CICS SEND MAP('MENUI')                                       
                        MAPSET('ACAT01M')                                       
                        FROM(MENUIO)                                            
                        CURSOR                                                  
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
      ***  MAP TRAILER                                                          
              EXEC CICS SEND MAP('TRLMAP')                                      
                        MAPSET('ACAT00M')                                       
                        FROM(TRLMAPO)                                           
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
           ELSE                                                                 
              EXEC CICS SEND MAP('MENUI')                                       
                        MAPSET('ACAT01M')                                       
                        FROM(MENUIO)                                            
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
      ***  MAP TRAILER                                                          
              EXEC CICS SEND MAP('TRLMAP')                                      
                        MAPSET('ACAT00M')                                       
                        FROM(TRLMAPO)                                           
                        CURSOR                                                  
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
           END-IF.                                                              
           EXEC CICS SEND PAGE                                                  
           END-EXEC.                                                            
           IF EIBRCODE NOT EQUAL LOW-VALUES                                     
              MOVE 'SEND-INQUIRY-DATA'   TO WS-CICS-DISPLAY                     
              MOVE EIBRCODE              TO WS-CICS-RC                          
              MOVE WS-CICS-MSG           TO WS-MSG-OUT                          
              PERFORM SEND-MSG-RETURN-TO-CICS                                   
           ELSE                                                                 
              MOVE 'ACAT01CP' TO ACAT-PROGRAM-NAME                              
              MOVE SPACES   TO ACAT-NEXT, ACAT-INP-SEL                          
              PERFORM RETURN-TO-CICS.                                           
                                                                                
                                                                                
       SEND-PROCESS-DATA.                                                       
      *    MOVE -1                TO MPSELL                                     
      *    MOVE ATT-UNPROT-BRT TO MPSELA                                        
LRM        IF MPSELL = -1                                                       
              EXEC CICS SEND MAP('MENUP')                                       
                        MAPSET('ACAT01M')                                       
                        FROM(MENUPO)                                            
                        CURSOR                                                  
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
      ***  MAP TRAILER                                                          
              EXEC CICS SEND MAP('TRLMAP')                                      
                        MAPSET('ACAT00M')                                       
                        FROM(TRLMAPO)                                           
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
           ELSE                                                                 
              EXEC CICS SEND MAP('MENUP')                                       
                        MAPSET('ACAT01M')                                       
                        FROM(MENUPO)                                            
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
      ***  MAP TRAILER                                                          
              EXEC CICS SEND MAP('TRLMAP')                                      
                        MAPSET('ACAT00M')                                       
                        FROM(TRLMAPO)                                           
                        CURSOR                                                  
                        DATAONLY                                                
                        ACCUM                                                   
              END-EXEC                                                          
           END-IF.                                                              
           IF EIBRCODE NOT EQUAL LOW-VALUES                                     
              MOVE 'SEND-PROCESS-MENU'   TO WS-CICS-DISPLAY                     
              MOVE EIBRCODE              TO WS-CICS-RC                          
              MOVE WS-CICS-MSG           TO WS-MSG-OUT                          
              PERFORM SEND-MSG-RETURN-TO-CICS                                   
           ELSE                                                                 
              MOVE 'ACAT01CP' TO ACAT-PROGRAM-NAME                              
              MOVE SPACES   TO ACAT-NEXT, ACAT-INP-SEL                          
              PERFORM RETURN-TO-CICS                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
                                                                                
       ERROR-RTN.                                                               
           IF  INPUT-NEXT-SPACE                                                 
               MOVE SPACES TO ACAT-INP-SEL                                      
                              ACAT-NEXT                                         
           END-IF.                                                              
           MOVE SYSTEM-MSG TO TRLMSGO                                           
           MOVE ATT-ASKIP-BRT TO TRLMSGA                                        
           PERFORM SEND-MAP-DATA-ONLY.                                          
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
                                                                                
       SELECT-XCTL-PROGRAM-RTN.                                                 
           MOVE ACAT-NEXT TO WS-ACAT-NEXT.                                      
                                                                                
       COPY ACATJUMP.                                                           
                                                                                
           EJECT                                                                
                                                                                
      ***************************************************************** *       
       SIGN-ON-SEC-CHECK-RTN.                                                   
00436      MOVE SPACES        TO SECLINK-LIST.                          AEISAC07
00436      MOVE SPACES        TO ACAT-SUPER-SIGN-ON-SEC-FLAG.           AEISAC07
           MOVE '1'           TO SECLINK-ACTION-CODE.                   AEISAC07
           PERFORM CALL-SECLINK-RTN.                                    AEISAC07
00         IF SECLINK-NO-SECURITY                                       AEISAC07
              SET ACAT-SUPER-SIGN-ON-UPDATE TO TRUE                     AEISAC07
              MOVE SECLINK-USER-ID TO ACAT-SIGN-ON-ID                           
                                      TSQ-USER-ID                               
           ELSE                                                                 
11            IF SECLINK-USER-SIGN-ON                                   AEISAC07
                 MOVE SECLINK-USER-ID TO ACAT-SIGN-ON-ID                        
                                         TSQ-USER-ID                            
                 MOVE SPACES     TO SECLINK-LIST                        AEISAC07
                 MOVE '3'        TO SECLINK-ACTION-CODE                 AEISAC07
                 MOVE 'SCON'     TO SECLINK-TYPE                                
                 MOVE 'ACAX*'    TO SECLINK-ITEM                                
                 PERFORM CALL-SECLINK-RTN                               AEISAC07
                    IF (SECLINK-RETURN-CODE = '00' OR '31')             AEISAC07
                       SET ACAT-SUPER-SIGN-ON-UPDATE TO TRUE                    
                    END-IF                                                      
              ELSE                                                              
                 IF SECLINK-TERMINAL-NOT-SIGNED-ON                      AEISAC07
                    SET ACAT-JUMP-ANYWHERE TO TRUE                              
                    MOVE SPACE TO  ACAT-SIGN-ON-ID                              
                 ELSE                                                           
                    MOVE SECLINK-USER-ID TO ACAT-SIGN-ON-ID                     
                                            TSQ-USER-ID                         
00436               MOVE SPACES  TO SECLINK-LIST                        AEISAC07
                    MOVE '3'     TO SECLINK-ACTION-CODE                 AEISAC07
                    MOVE 'SCON'  TO SECLINK-TYPE                                
                    MOVE 'ACAX*' TO SECLINK-ITEM                                
                    PERFORM CALL-SECLINK-RTN                            AEISAC07
                    IF (SECLINK-RETURN-CODE = '00' OR '31')             AEISAC07
*********           OR (SECLINK-ITEM = 'END')                                   
                       SET ACAT-SUPER-SIGN-ON-BROWSE TO TRUE                    
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
00436      MOVE SPACES        TO SECLINK-LIST                           AEISAC07
           MOVE '2'           TO SECLINK-ACTION-CODE                    AEISAC07
           MOVE 'SCON'        TO SECLINK-TYPE                                   
           MOVE 'ACAX*U'      TO SECLINK-ITEM                                   
           PERFORM CALL-SECLINK-RTN                                     AEISAC07
           IF (SECLINK-RETURN-CODE = '00' OR '20')                      AEISAC07
              SET ACAT-SUPER-SIGN-ON-UPDATE TO TRUE                             
           ELSE                                                                 
00436         MOVE SPACES        TO SECLINK-LIST                        AEISAC07
              MOVE '2'           TO SECLINK-ACTION-CODE                 AEISAC07
              MOVE 'SCON'        TO SECLINK-TYPE                                
              MOVE 'ACAX*'       TO SECLINK-ITEM                                
              PERFORM CALL-SECLINK-RTN                                  AEISAC07
              IF (SECLINK-RETURN-CODE = '00' OR '20')                   AEISAC07
                 SET ACAT-SUPER-SIGN-ON-BROWSE TO TRUE                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF ACAT-SUPER-SIGN-ON-UPDATE                                         
           OR ACAT-SUPER-SIGN-ON-BROWSE                                         
              CONTINUE                                                          
           ELSE                                                                 
              MOVE SPACES        TO SECLINK-LIST                           AEIS 
              MOVE '2'           TO SECLINK-ACTION-CODE                    AEIS 
              MOVE 'SCON'        TO SECLINK-TYPE                                
              MOVE 'ACAX*J'      TO SECLINK-ITEM                                
              PERFORM CALL-SECLINK-RTN                                     AEIS 
              IF (SECLINK-RETURN-CODE = '20')                              AEIS 
                 SET ACAT-JUMP-ANYWHERE TO TRUE                                 
              END-IF                                                            
              PERFORM GET-BR-AE-RANGE-RTN                                       
                 THRU GET-BR-AE-RANGE-RTN-EXIT                                  
           END-IF.                                                              
                                                                                
LRM008     IF ACAT-ASCENDIS-CLIENT                                              
LRM008        MOVE SPACES         TO SECLINK-LIST                          AEIS 
LRM008        MOVE '2'            TO SECLINK-ACTION-CODE                   AEIS 
LRM008        MOVE 'SCON'         TO SECLINK-TYPE                               
LRM008        MOVE 'ACAXASCENDIS' TO SECLINK-ITEM                               
LRM008        PERFORM CALL-SECLINK-RTN                                     AEIS 
LRM008        IF (SECLINK-RETURN-CODE = '00' OR '20')                      AEIS 
LRM008           SET ACAT-ASCENDIS-OVERRIDE TO TRUE                             
LRM008        END-IF                                                            
LRM008     END-IF.                                                              
       EJECT                                                                    
       GET-BR-AE-RANGE-RTN.                                                     
           MOVE 'AC@X'                   TO TRAN-ID-SECR.                       
           MOVE EIBTRMID                 TO TERM-ID-SECR.                       
           MOVE 1 TO ITEM-NUM.                                                  
           EXEC CICS  READQ TS QUEUE (TSQ-SECR)                                 
                      INTO (TSQ-SECR-AREA)                                      
                      ITEM(ITEM-NUM)                                            
           END-EXEC.                                                            
           IF EIBRESP = +0                                              10410002
           AND ACAT-SIGN-ON-ID  =  TSQ-USER-ID                                  
              GO TO GET-BR-AE-RANGE-RTN-EXIT                                    
           END-IF.                                                              
           EXEC CICS DELETEQ TS QUEUE (TSQ-SECR)                                
           END-EXEC.                                                            
           MOVE HIGH-VALUE TO TSQ-LK-SEC-BR-TABLE.                      02970002
           MOVE HIGH-VALUE TO TSQ-LK-SEC-RR-TABLE.                      02970002
           PERFORM GET-AE-RANGE-RTN.                                    03080002
           PERFORM GET-BR-RANGE-RTN.                                    03090002
           MOVE 1 TO ITEM-NUM.                                                  
           EXEC CICS WRITEQ TS                                                  
                     QUEUE (TSQ-SECR)                                           
                     FROM (TSQ-SECR-AREA)                                       
                     LENGTH (LENGTH OF TSQ-SECR-AREA)                           
                     ITEM(ITEM-NUM)                                             
           END-EXEC.                                                            
125100     IF EIBRESP NOT = +0                                          10410002
              MOVE LOW-VALUE TO ACAT01M-IO-AREA                                 
              MOVE                                                              
125300        'ACAT01CP WRITE TSQ SECR ERROR, CONTACT HELP DESK'        10440002
125200                                          TO SYSTEM-MSG           10430002
125400        PERFORM ERROR-RTN                                         10450002
125500     END-IF.                                                      10460002
       GET-BR-AE-RANGE-RTN-EXIT.  EXIT.                                         
                                                                        03110002
       GET-BR-RANGE-RTN.                                                03140002
           MOVE SPACES            TO SECLINK-LIST.                      03150002
           MOVE '7'               TO SECLINK-ACTION-CODE.               03160002
           SET SECLINK-TYPE-MRGN  TO TRUE.                              03170002
           MOVE 'BR'              TO SECLINK-ITEM.                      03180002
           MOVE HIGH-VALUE        TO SECLINK-TABLE-COUNT.               03190002
           PERFORM CALL-SECLINK-RTN.                                    03200002
           IF SECLINK-RETURN-CODE = '72' OR '73'                        03210002
              MOVE SECLINK-TABLE-ADDRESS TO SECLINK-TABLE-POINTER       03220002
              SET ADDRESS OF LK-SEC-ADDRESS TO SECLINK-TABLE-PTR        03230002
              PERFORM VARYING IDX FROM 1 BY 1                                   
                      UNTIL (IDX > LK-SEC-BR-CNT) OR (IDX > 999)                
                  MOVE LK-SEC-BR-AREA(IDX)                              03240002
                    TO TSQ-LK-SEC-BR-AREA(IDX)                          03240002
              END-PERFORM                                                       
           ELSE                                                         03250002
           IF SECLINK-RETURN-CODE = '00'                                03410002
              MOVE 'ALL,END' TO TSQ-LK-SEC-BR-AREA(1)                   03000002
           ELSE                                                         03250002
00447      IF SECLINK-RETURN-CODE = '7A'                                03260002
00448         MOVE SEC-MESSAGE      TO SYSTEM-MSG                       03270002
              PERFORM      UNAUTHORIZED-USER-RTN                        03280002
           ELSE                                                         03290002
00448         MOVE SECLINK-MESSAGE TO SYSTEM-MSG                        03300002
              PERFORM      UNAUTHORIZED-USER-RTN                        03310002
           END-IF END-IF END-IF.                                        03320002
                                                                        03330002
       GET-AE-RANGE-RTN.                                                03351006
           MOVE SPACES        TO SECLINK-LIST.                          AEISAC07
           MOVE '7'           TO SECLINK-ACTION-CODE.                   AEISAC07
           SET SECLINK-TYPE-MRGN  TO TRUE.                              03170002
           MOVE 'RR'              TO SECLINK-ITEM.                      03180002
           MOVE HIGH-VALUE        TO SECLINK-TABLE-COUNT.               03190002
           PERFORM CALL-SECLINK-RTN.                                    AEISAC07
           IF SECLINK-RETURN-CODE = '75' OR '76'                        03210002
              MOVE SECLINK-TABLE-ADDRESS TO SECLINK-TABLE-POINTER       03220002
                                            SECLINK-TABLE-POINTER-RR            
              SET ADDRESS OF LK-SEC-ADDRESS TO SECLINK-TABLE-PTR        03230002
              ADD LK-SEC-RR-DISP         TO SECLINK-TABLE-POINTER-RR    01750002
              SET ADDRESS OF LK-SEC-ADDRESS-RR TO SECLINK-TABLE-PTR-RR  03230002
              PERFORM VARYING IDX FROM 1 BY 1                                   
                      UNTIL (IDX > LK-SEC-RR-CNT) OR (IDX > 999)                
                  MOVE LK-SEC-RR-AREA(IDX)                              03240002
                    TO TSQ-LK-SEC-RR-AREA(IDX)                          03240002
              END-PERFORM                                                       
           ELSE                                                         03250002
           IF SECLINK-RETURN-CODE = '00'                                03410002
              MOVE 'ALL,END' TO TSQ-LK-SEC-RR-AREA(1)                   03000002
           ELSE                                                         03250002
00447      IF SECLINK-RETURN-CODE = '7A'                                03260002
00448         MOVE SEC-MESSAGE      TO SYSTEM-MSG                       03270002
              PERFORM      UNAUTHORIZED-USER-RTN                        03280002
           ELSE                                                         03290002
00448         MOVE SECLINK-MESSAGE TO SYSTEM-MSG                        03300002
              PERFORM      UNAUTHORIZED-USER-RTN                        03310002
           END-IF END-IF END-IF.                                        03320002
                                                                        07640002
       UNAUTHORIZED-USER-RTN.                                           10191004
           EXEC CICS SEND TEXT FROM (SYSTEM-MSG)                        10192004
                               LENGTH (79)                              10193004
                               ERASE                                    10194004
           END-EXEC.                                                    10195004
                                                                        10196004
           EXEC CICS RETURN END-EXEC.                                   10197004
                                                                                
           EJECT                                                                
                                                                        10198004
       SCREEN-SECURITY-CHECK.                                                   
           IF  ACAT-SUPER-SIGN-ON-UPDATE                                        
               SET ACAT-SIGN-ON-UPDATE TO TRUE                                  
           ELSE                                                                 
           IF  ACAT-SUPER-SIGN-ON-BROWSE                                        
               MOVE SPACE  TO ACAT-SIGN-ON-SEC-FLAG                             
           ELSE                                                                 
           IF ACAT-JUMP-ANYWHERE                                                
               CONTINUE                                                         
           ELSE                                                                 
               MOVE ACAT-NEXT TO ACAT-SCREEN-IND                                
               SET ACAT-UPDATE-MODE TO TRUE                                     
00436          MOVE SPACES    TO SECLINK-LIST                           AEISAC07
               MOVE '2'       TO SECLINK-ACTION-CODE                    AEISAC07
               MOVE 'SCON'    TO SECLINK-TYPE                                   
               MOVE ACAT-SEC-LIT TO SECLINK-ITEM                                
LRM008         IF SECLINK-ITEM(5 : 1) = '0'                                     
LRM008            MOVE 'T' TO SECLINK-ITEM(5 : 1)                               
LRM008         END-IF                                                           
               PERFORM CALL-SECLINK-RTN                                 AEISAC07
               IF SECLINK-RETURN-CODE = '00' OR '20'                    AEISAC07
                  SET ACAT-SIGN-ON-UPDATE TO TRUE                               
                  MOVE SECLINK-USER-ID TO ACAT-SIGN-ON-ID                       
                                          TSQ-USER-ID                           
               ELSE                                                             
LRM002            IF ACAT-NEXT = 'J'                                            
LRM002               MOVE ACAT-NEXT TO ACAT-SCREEN-IND                          
LRM002               MOVE 'A'       TO ACAT-UPDATE-IND                          
LRM002               MOVE SPACES    TO SECLINK-LIST                             
LRM002               MOVE '2'       TO SECLINK-ACTION-CODE                      
LRM002               MOVE 'SCON'    TO SECLINK-TYPE                             
LRM002               MOVE ACAT-SEC-LIT TO SECLINK-ITEM                          
LRM002               PERFORM CALL-SECLINK-RTN                                   
LRM002               IF SECLINK-RETURN-CODE = '00' OR '20'                      
LRM002                  SET ACAT-SIGN-ON-UPDATE TO TRUE                         
LRM002                  MOVE SECLINK-USER-ID TO ACAT-SIGN-ON-ID                 
LRM002                                          TSQ-USER-ID                     
LRM002                  GO TO SCREEN-SECURITY-CHECK-EXIT                        
LRM002               END-IF                                                     
LRM002            END-IF                                                        
                  SET ACAT-BROWSE-MODE TO TRUE                                  
00436             MOVE SPACES    TO SECLINK-LIST                        AEISAC07
                  MOVE '2'       TO SECLINK-ACTION-CODE                 AEISAC07
                  MOVE 'SCON'    TO SECLINK-TYPE                                
                  MOVE ACAT-SEC-LIT TO SECLINK-ITEM                             
LRM008            IF SECLINK-ITEM(5 : 1) = '0'                                  
LRM008               MOVE 'T' TO SECLINK-ITEM(5 : 1)                            
LRM008            END-IF                                                        
                  PERFORM CALL-SECLINK-RTN                              AEISAC07
                  IF SECLINK-RETURN-CODE = '00' OR '20'                 AEISAC07
                     MOVE SPACE TO ACAT-SIGN-ON-SEC-FLAG                        
                  ELSE                                                          
                     IF ACAT-NEXT = '$'                                         
                        CONTINUE                                                
                     ELSE                                                       
                     MOVE 'USER NOT AUTHORIZED TO USE NEXT SELECTION '  AEISAC07
00448                     TO SYSTEM-MSG                                 AEISAC07
00448                MOVE ACAT-NEXT                                     AEISAC07
00448                     TO SYSTEM-MSG(44 : 1)                         AEISAC07
                     MOVE -1 TO MRSELL                                          
                     PERFORM ERROR-RTN                                          
                  END-IF                                                        
               END-IF                                                           
           END-IF END-IF.                                                       
LRM002 SCREEN-SECURITY-CHECK-EXIT.                                              
                                                                                
           EJECT                                                                
       RETURN-FROM-RATT-RTN.                                                    
           MOVE 'AC$X'                   TO TRAN-ID.                            
           MOVE EIBTRMID                 TO TERM-ID.                            
           EXEC CICS  READQ TS QUEUE (TSQ-NAME)                                 
                      INTO (ACATCOMM-COMMAREA)                                  
           END-EXEC.                                                            
125100     IF EIBRESP NOT = +0                                          10410002
125300        MOVE 'ACAT01CP READ TSQ ERROR, CONTACT HELP DESK'         10440002
125300                                         TO SYSTEM-MSG            10440002
              MOVE LOW-VALUE TO ACAT01M-IO-AREA                                 
                                MENUMAPI                                        
              MOVE 'M'       TO ACAT-MENU-FLAG                                  
              SET ACAT-MAIN-MENU  TO  TRUE                                      
125400        PERFORM ERROR-RTN                                         10450002
125500     END-IF.                                                      10460002
           EXEC CICS DELETEQ TS QUEUE (TSQ-NAME)                                
           END-EXEC.                                                            
           MOVE 'RATT01  '  TO ACAT-PROGRAM-NAME.                               
           PERFORM INVOKE-DETAIL-PROGRAM-RTN.                                   
                                                                                
           EJECT                                                                
       INVOKE-RATT-RTN.                                                         
      *                                                                         
      *    PERFORM EXAMINE-CURSOR-RTN.                                          
      *** TCK                                                                   
10/22 *    MOVE ACAT-INP-BR-AC-FIELDS    TO CR-ACCOUNT.                         
           MOVE ACAT-BR-AC               TO CR-ACCOUNT.                         
           MOVE 'AC$X'                   TO TRAN-ID.                            
           MOVE EIBTRMID                 TO TERM-ID.                            
           EXEC CICS WRITEQ TS                                                  
                     QUEUE (TSQ-NAME)                                           
                     FROM (ACATCOMM-COMMAREA)                                   
                     ITEM(ITEM-NUM)                                             
           END-EXEC.                                                            
125100     IF EIBRESP NOT = +0                                          10410002
              MOVE LOW-VALUE TO ACAT01M-IO-AREA                                 
125300        MOVE 'ACAT01CP WRITE TSQ ERROR, CONTACT HELP DESK'        10440002
125200                                          TO SYSTEM-MSG           10430002
125400        PERFORM ERROR-RTN                                         10450002
125500     END-IF.                                                      10460002
      **                                                                        
LRM001     IF  EIBAID = DFHPF2                                                  
LRM001     AND ACAT-PROGRAM-NAME = 'ACAT04RS'                                   
LRM001           MOVE ACAT-PROGRAM-NAME TO CR-SECURITY                          
LRM001           MOVE DFHPF3 TO EIBAID                                          
LRM001     ELSE                                                                 
LRM001           MOVE SPACES            TO CR-SECURITY                          
LRM001     END-IF.                                                              
           EXEC CICS XCTL PROGRAM ('RATT01')                                    
                         COMMAREA (CALL-RATT-AND-RETURN)                        
           END-EXEC.                                                            
      **                                                                        
125100     IF (EIBRESP NOT = +0)                                        10410002
              MOVE 'RATT01  '       TO ERROR-PROG-NAME                          
              MOVE ERROR-PROG-MSG   TO SYSTEM-MSG                               
              PERFORM ERROR-RTN                                                 
125500     END-IF.                                                      10460002
032200     EJECT                                                        03550002
                                                                                
       GET-B1-CLIENT-AUTH-RTN.                                          03570002
           MOVE TWA-CLIENT-NO   TO B1-CLIENT-NO B1-CLIENT               03580002
LRM013                                         B1READ-CLIENT                    
           MOVE '0'              TO  ACAT-CLIENT-NO(1 : 1).                     
           MOVE TWA-CLIENT-NO-X  TO  ACAT-CLIENT-NO(2 : 3).                     
           MOVE 015                         TO B1READ-REC-CODE.                 
           MOVE 434500                      TO B1READ-CARD-NUM.                 
                                                                                
LRM013     EXEC CICS LINK                                                       
LRM013          PROGRAM  ('B1READ')                                             
LRM013          COMMAREA (B1READ-PARM-AREA)                                     
LRM013          LENGTH   (LENGTH OF B1READ-PARM-AREA)                           
LRM013     END-EXEC.                                                            
                                                                                
      *** CHECK CARD #434501 434502===========>                                 
LRM013     IF (B1READ-RETURN-CODE = 'N' OR 'O' OR 'X')                          
              MOVE 'CLIENT B1 NOT SET ON USE THIS TRANSACTION'          03630002
                TO SYSTEM-MSG                                           03640002
              PERFORM ERROR-RTN.                                                
                                                                                
LRM013     MOVE B1READ-INFO-AREA   TO BH-ACAT-INFO                              
LRM013     IF NOT BH-ACAT-ACTIVE                                                
LRM013     OR BH-ACAT-SERVICE-STATUS NOT GREATER '0'                            
LRM013        MOVE 'CLIENT B1 NOT SET ON USE THIS TRANSACTION'          03630002
LRM013          TO SYSTEM-MSG                                           03640002
LRM013        PERFORM ERROR-RTN.                                                
                                                                                
      *** CHECK CARD #01000 ==================>                                 
           MOVE 01000           TO B1-CARD-NO.                          03590002
           PERFORM READ-B1-RTN.                                         03600002
           IF EIBRESP NOT = +0                                          03610002
           OR (EIBRESP  = +0      AND                                   03610002
              B1-RETURN-CLR-NBR NOT GREATER SPACES)                             
                MOVE                                                            
               'TRANSACTION NOT AVAILABLE; CLEARING HOUSE NBR INVALID'  03630002
                    TO SYSTEM-MSG                                       03640002
              PERFORM ERROR-RTN.                                                
           MOVE B1-RETURN-CLR-NBR TO ACAT-ADP-BROKER.                           
                                                                                
      *** CHECK CARD #06014 ==================>                                 
           MOVE 06014           TO B1-CARD-NO.                          03590002
           PERFORM READ-B1-RTN.                                         03600002
           IF EIBRESP NOT = +0                                          03610002
           OR (EIBRESP  = +0        AND                                 03610002
               B1-RETURN-CLR-NBR NOT GREATER SPACES)                            
              MOVE 'B1 006014 OCC CLEARING NBR MISSING'                 03630002
                TO SYSTEM-MSG                                           03640002
              PERFORM ERROR-RTN.                                                
11/24***   MOVE B1-RETURN-CLR-NBR TO ACAT-OCC-BROKER.                           
11/24      IF B1-RETURN-CLR-NBR = ZERO                                          
              MOVE SPACES            TO ACAT-OCC-BROKER                         
           ELSE                                                                 
              MOVE B1-RETURN-CLR-NBR TO ACAT-OCC-BROKER                         
11/24      END-IF.                                                              
                                                                                
LRM006*** CHECK CARD #32958 ==================>                                 
LRM006     MOVE 32958           TO B1-CARD-NO.                          03590002
LRM006     PERFORM READ-B1-RTN.                                         03600002
LRM006     IF EIBRESP NOT = +0                                          03610002
LRM006        MOVE '0'              TO ACAT-ACCOUNT-FREEZE-IND                  
LRM006     ELSE                                                                 
LRM006        MOVE B1-RETURN-VALUE  TO ACAT-ACCOUNT-FREEZE-IND                  
LRM006     END-IF.                                                              
                                                                                
LRM008*** PASS CARD #434735 ASCENDIS CLIENT =>                                  
LRM013     MOVE BH-ACAT-ASCENDIS-USER TO ACAT-ASCENDIS-CLIENT-IND               
                                                                                
LRM010*** PASS  CARD #434738 DEFAULT TO SUBMIT CLIENT =>                        
LRM013     MOVE BH-ACAT-ONLINE-ENT-AUTO-SUBMIT TO                               
LRM013                                     ACAT-DEFAULT-TO-SUBMIT-IND           
                                                                                
LRM011*** PASS CARD #434740 ALLOW DELETE ALL ASSET ON H SCREEN                  
LRM013     MOVE BH-ACAT-FULL-DLVY-ASSET-DELETE TO                               
LRM011                                 ACAT-FULL-DLVY-ASSET-DELETE              
                                                                                
LRM013*** PASS CARD #434685 SECONDARY SSN EDIT                                  
LRM013     MOVE BH-ACAT-SECONDARY-SSN  TO ACAT-SECONDARY-SSN-EDIT               
                                                                                
LRM006     EXEC CICS ASSIGN                                                     
                             NETNAME(WS-NETNAME)                                
                             USERID(WS-USERID)                                  
                             USERNAME(WS-USER-NAME)                             
LRM006     END-EXEC.                                                            
LRM006     MOVE WS-NETNAME   TO  ACAT-CICS-NETNAME.                             
LRM006     MOVE WS-USERID    TO  ACAT-CICS-USER-ID.                             
LRM006     MOVE WS-USER-NAME TO  ACAT-CICS-USER-NAME.                           
                                                                                
       EJECT                                                            03680002
       READ-B1-RTN.                                                     03700002
           EXEC CICS READ                                               03710002
                     DATASET('B1PRINT')                                 03720002
                     INTO(B1-RECORD)                                    03730002
                     RIDFLD(B1-REC-ID)                                  03740002
                     LENGTH(LENGTH OF B1-RECORD)                        03750002
           END-EXEC.                                                    03760002
                                                                                
       GET-DATE-AND-TIME-RTN.                                           DTIR01  
           EXEC  CICS ASKTIME                                           DTIR01  
                 ABSTIME(WSABSTIME)                                     DTIR01  
           END-EXEC.                                                    DTIR01  
           EXEC  CICS FORMATTIME                                        DTIR01  
                 ABSTIME(WSABSTIME)                                     DTIR01  
                 MMDDYY(WSMMDDYY)                                       DTIR01  
                 DATESEP(WSDATESEP)                                     DTIR01  
                 TIME(WSTIME)                                           DTIR01  
                 TIMESEP(WSTIMESEP)                                     DTIR01  
           END-EXEC.                                                    DTIR01  
                                                                        DTIR01  
       GET-COM-INFO-FROM-RATT.                                                  
           MOVE SPACES TO AR-ACCOUNT.                                           
           MOVE SPACES TO AR-SECURITY.                                          
           MOVE SPACES TO AR-RR-NUM.                                            
           EXEC CICS LINK PROGRAM('RATT01  ')                                   
                COMMAREA(ASK-RATT-INFO)                                         
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
       CALL-SECLINK-RTN.                                                AEISAC07
00442      EXEC CICS LINK PROGRAM ('SECLINK')                           AEISAC07
                COMMAREA(SECLINK-LIST)                                          
00443           LENGTH(LENGTH OF SECLINK-LIST)                          AEISAC07
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *****************************************************************         
       NOT-OPEN.                                                                
           MOVE LOW-VALUE TO ACAT01M-IO-AREA.                                   
           MOVE 'B1 FILE IS NOT AVAILABLE' TO SYSTEM-MSG.                       
           MOVE 'Y' TO OPEN-ERROR-FLAG                                          
           PERFORM ERROR-RTN.                                                   
                                                                        04770310
       EJECT                                                                    
                                                                                
       SECLINK-FAIL-RTN.                                                        
           EXEC CICS SEND TEXT FROM (SYSTEM-MSG)                                
                               LENGTH (79)                                      
                               ERASE                                            
           END-EXEC.                                                            
                                                                                
           EXEC CICS RETURN END-EXEC.                                           
                                                                                
           EJECT                                                                
                                                                                
       RETURN-TO-CICS.                                                          
           EXEC CICS RETURN                                                     
                     TRANSID('ACAX')                                            
                     COMMAREA(ACAT-RETURN-CICS-AREA)                            
           END-EXEC.                                                            
                                                                                
       RETURN-CONTROL-RTN.                                                      
           EXEC CICS SEND CONTROL                                               
                            ERASE                                               
                           FREEKB                                               
           END-EXEC.                                                            
           EXEC CICS XCTL PROGRAM ('RATT01')                                    
           END-EXEC.                                                            
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
       SEND-MSG-RETURN-TO-CICS.                                                 
           EXEC CICS                                                            
                SEND                                                            
                FROM (WS-MSG-OUT)                                               
                ERASE                                                           
           END-EXEC.                                                            
                                                                                
           EXEC CICS                                                            
                RETURN                                                          
           END-EXEC.                                                            
                                                                                
       HANG-CICS.                                                               
           GOBACK.                                                              
      *VALIDATE-BR-AC-RTN.                                                      
                                                                                
      *    IF  ACAT-INP-BRANCH GREATER SPACES                                   
      *    AND ACAT-INP-BRANCH NOT NUMERIC                                      
      *       MOVE ATT-UNPROT-BRT TO MMBRA                                      
      *       IF NOT INPUT-ERROR                                                
      *          MOVE 'BRANCH NOT NUMERIC' TO SYSTEM-MSG                        
      *          MOVE -1 TO MMBRL                                               
      *          SET INPUT-ERROR TO TRUE.                                       
                                                                                
      *    IF  ACAT-INP-ACCOUNT GREATER SPACES                                  
      *    AND ACAT-INP-ACCOUNT NOT NUMERIC                                     
      *       MOVE ATT-UNPROT-BRT TO MMACA                                      
      *       IF NOT INPUT-ERROR                                                
      *          MOVE 'ACCOUNT NOT NUMERIC' TO SYSTEM-MSG                       
      *          MOVE -1 TO MMACL                                               
      *          SET INPUT-ERROR TO TRUE.                                       
                                                                                
      *    IF  ACAT-INP-ACCOUNT GREATER SPACES                                  
      *    AND ACAT-INP-BRANCH NOT GREATER SPACES                               
      *       MOVE ATT-UNPROT-BRT TO MMBRA                                      
      *       IF NOT INPUT-ERROR                                                
      *          MOVE 'PLEASE ENTER BRANCH NUMBER.' TO SYSTEM-MSG               
      *          MOVE -1 TO MMBRL                                               
      *          SET INPUT-ERROR TO TRUE.                                       
                                                                                
      *    IF  ACAT-INP-RR NOT GREATER SPACES                                   
      *       MOVE ATT-UNPROT-BRT TO MMRRA                                      
      *       IF NOT INPUT-ERROR                                                
      *          MOVE 'PLEASE ENTER RR FIELD' TO SYSTEM-MSG                     
      *          MOVE -1 TO MMRRL                                               
      *          SET INPUT-ERROR TO TRUE.                                       
                                                                                
      *    IF  ACAT-INP-TFR-TYP NOT GREATER SPACES                              
      *       MOVE ATT-UNPROT-BRT TO MMTFRA                                     
      *       IF NOT INPUT-ERROR                                                
      *          MOVE 'PLEASE ENTER TRANSFER TYPE' TO SYSTEM-MSG                
      *          MOVE -1 TO MMTFRL                                              
      *          SET INPUT-ERROR TO TRUE.                                       
                                                                                
      *    IF  ACAT-INP-RCV-DEL NOT GREATER SPACES                              
      *       MOVE ATT-UNPROT-BRT TO MMRDA                                      
      *       IF NOT INPUT-ERROR                                                
      *          MOVE 'PLEASE ENTER DR FIELD' TO SYSTEM-MSG                     
      *          MOVE -1 TO MMDRL                                               
      *          SET INPUT-ERROR TO TRUE.                                       
                                                                                
      *    IF  ACAT-INP-CONTRA-BKR NOT GREATER SPACES                           
      *       MOVE ATT-UNPROT-BRT TO MMBKRA                                     
      *       IF NOT INPUT-ERROR                                                
      *          MOVE 'PLEASE ENTER BROKER ID' TO SYSTEM-MSG                    
      *          MOVE -1 TO MMBKRL                                              
      *          SET INPUT-ERROR TO TRUE.                                       
                                                                                
      *    IF  ACAT-INP-STATUS NOT GREATER SPACES                               
      *       MOVE ATT-UNPROT-BRT TO MMSTATA                                    
      *       IF NOT INPUT-ERROR                                                
      *          MOVE 'PLEASE ENTER STATUS ' TO SYSTEM-MSG                      
      *          MOVE -1 TO MMSTATL                                             
      *          SET INPUT-ERROR TO TRUE.                                       
                                                                                
      *    IF INPUT-ERROR                                                       
      *       PERFORM ERROR-RTN.                                                
                                                                                
       LINK-TO-MRGN-RTN.                                                        
           MOVE 'MRGN' TO  CR-TRANSID.                                          
           PERFORM INVOKE-RATT-RTN.                                             
