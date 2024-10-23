000001* PDX    - ACAT23AS C0318727 01/11/12 13:38:07 TBLAMUR            00001000
000001* PDX    - ACAT23AS C0270299 09/15/08 16:31:58 TBLAMUR            00001000
000001* LRM SSRS 55766 55717 RECOMPILE ONLY FOR COPYS ACATCOM,90TS,JUMP.        
000001* PDX    - ACAT23AS C0250441 06/25/07 14:43:22 TBLAMUR            00001000
000001* LRM004 - SSR 53075 SPIN-OFF CHANGES                                     
000001* PDX    - ACAT23AS C0228006 12/22/05 15:04:18 TBLAMUR            00001000
000001* LRM003 SSR# 25386 ALSO DISPLAY MEMO ASSETS                              
000001* PDX    - ACAT23AS C0179784 09/26/02 14:39:31 TBEDTAK            00001000
000001* PDX    - ACAT23AS C0160324 06/25/01 08:37:12 TBLAMUR            00001000
000001* PDX    - ACAT23AS C0122261 03/10/99 08:08:10 TBLAMUR            00001000
000001* PDX    - ACAT23AS C0121428 02/11/99 13:47:23 TBLAMUR            00001000
000001* PDX    - ACAT23AS C0120327 01/24/99 15:52:37 TBLAMUR            00001000
000001* PDX    - ACAT23AS C0109165 10/31/98 13:40:19 TBLAMUR            00001000
000100 IDENTIFICATION DIVISION.                                         00020002
000200 PROGRAM-ID.    ACAT23AS.                                         00030002
000300 AUTHOR.  LARRY MUREY.                                            00040002
000400*REMARKS.                                                         00050002
000500**-------------------------------------------------------------** 00060002
000600*  ACAT ASSETS WITHHELD INQUIRY.                                *         
000700**-------------------------------------------------------------** 00080002
000800 ENVIRONMENT DIVISION.                                            00090002
000900 DATA DIVISION.                                                   00100002
001000 WORKING-STORAGE SECTION.                                         00110002
001100 COPY PDXIDCOB.                                                   00120002
001200 77  TWA-SIZE                       PIC S9(4) COMP.               00130002
TEMP   77  WS-ACATNAIO                    PIC X(08) VALUE 'ACAT00NA'.   00140002
TEMP   77  WS-ACAT23DB                    PIC X(08) VALUE 'ACAT23DB'.   00140002
TEMP   77  WS-ACATSRCH                    PIC X(08) VALUE 'ACATSRCH'.   00140002
                                                                                
       77  WS-STATUS                      PIC X(30) VALUE SPACES.               
001400*******************************************************           00150002
001500*      TSQ WORK AREA                                              00160002
001600*******************************************************           00170002
001700 01  TSQ-WORK-AREA.                                               00180002
001800     05  TSQ-NAME.                                                00190002
001900         09 TERM-ID                     PIC X(04).                00200002
002000         09 TRAN-ID                     PIC X(04).                00210002
002100     05  ITEM-NUM                       PIC S9(04) COMP VALUE +1. 00220002
002200 EJECT                                                            00230002
       01  WS-DB2-PROBLEM-MSG.                                                  
           05  FILLER                     PIC X(36) VALUE                       
           'ACAT23AS - DB2 UNEXPECTED ERROR '.                                  
           05  WS-DB2-PROBLEM-FUNCTION    PIC X(06) VALUE SPACES.               
           05  WS-DB2-PROBLEM-TABLE       PIC X(09) VALUE SPACES.               
           05  WS-DB2-PROBLEM-ID          PIC -999  VALUE SPACES.               
LRM002     05  FILLER                     PIC X(15) VALUE                       
LRM002         ' CALL HELP DESK'.                                               
                                                                                
002200 EJECT                                                            00230002
004300*******************************************************           00440002
004400*      GET DATE TIME LAYOUT                                       00450002
004500*******************************************************           00460002
004600 01  WSWORKAREA.                                                  00470002
004700     05  WSABSTIME           PIC S9(08) COMP.                     00480002
004800     05  WSMMDDYY.                                                00490002
               09 WS-CUR-MM        PIC XX.                                      
               09  FILLER          PIC X.                                       
               09 WS-CUR-DD        PIC XX.                                      
               09  FILLER          PIC X.                                       
               09 WS-CUR-YY        PIC XX.                                      
004900     05  WSDATESEP           PIC X(01) VALUE '/'.                 00500002
005000     05  WSTIME.                                                  00510002
               09  WS-TIME-HH      PIC XX.                                      
               09  FILLER          PIC X.                                       
               09  WS-TIME-MM      PIC XX.                                      
               09  FILLER          PIC X.                                       
               09  WS-TIME-SS      PIC XX.                                      
005100     05  WSTIMESEP           PIC X(01) VALUE ':'.                 00520002
           05  WS-DATE-MMDDYY.                                                  
               09  WS-DATE-MM      PIC XX.                                      
               09  FILLER          PIC X(01) VALUE '/'.                 00500002
               09  WS-DATE-DD      PIC XX.                                      
               09  FILLER          PIC X(01) VALUE '/'.                 00500002
               09  WS-DATE-YY      PIC XX.                                      
005200                                                                  00530002
005300 EJECT                                                            00540002
005400*******************************************************           00550002
005500*      I/O CALL AREAS.                                            00560002
005600*******************************************************           00570002
       01  ACATNAIO-CALL-AREA.                                                  
           COPY ACATNAIO.                                                       
                                                                                
       01  ACAT23IO-CALL-AREA.                                                  
           COPY ACAT23IO.                                                       
005300 EJECT                                                            00540002
006100                                                                  00690002
006200*******************************************************           00700002
006300*      ACAT23 WORK AREA                                           00710002
006400*******************************************************           00720002
006500 01  ACAT-WORK-AREA.                                              00730002
           05  CURRENCY-NUM               PIC 9(03).                            
           05  CURRENCY-X REDEFINES CURRENCY-NUM                                
                                          PIC X(03).                            
           05  WORK-AUTH-BRANCH           PIC X(03).                            
           05  WORK-AUTH-AE               PIC X(03).                            
006600     05  CALLED-PROGRAM-NAME        PIC X(08).                    00740002
006600     05  WORK-QTY-X                 PIC X(20).                    00740002
006700     05  FILLER REDEFINES WORK-QTY-X.                             00750002
006800         09 WORK-QTY                PIC 9(12)V9(05).              00760002
006900         09 FILLER                  PIC X(03).                    00770002
007000     05  WORK-DATE-X.                                             00780002
007100         09 WORK-DATE-X-MM          PIC X(02).                    00790002
007200         09 FILLER                  PIC X(01).                    00800002
007300         09 WORK-DATE-X-YY          PIC X(02).                    00810002
007400     05  WORK-DATE.                                               00820002
007500         09 WORK-DATE-MM            PIC X(02).                    00830002
007600         09 WORK-DATE-YY            PIC X(02).                    00840002
007700     05  TWA-CLIENT-NO-X.                                         00850002
007700         09 TWA-CLIENT-NO-9         PIC 9(04).                    00850002
           05  WK-SUSPEND-COUNT           PIC S9(04) COMP VALUE ZERO.           
008300     05  ALARM-NEEDED-FLAG          PIC X(01)  VALUE 'N'.         00910002
008400         88  ALARM-NEEDED           VALUE  'Y'.                   00920002
008700     05  END-OF-DATA-FLAG           PIC X(01)  VALUE 'N'.         00950002
008800         88  END-OF-DATA            VALUE  'Y'.                   00960002
008900     05  INPUT-ERROR-FLAG           PIC X(01)  VALUE 'N'.         00970002
009000         88  INPUT-ERROR            VALUE  'Y'.                   00980002
009100     05  SEARCH-ENGINE-VERIFY-FLAG  PIC X(01)  VALUE 'N'.         00990002
               88 REQUESTED-SEARCH-VALID     VALUE 'Y'.                         
               88 REQUESTED-SEARCH-INVALID   VALUE 'N'.                         
009100     05  FIRST-TIME-FLAG            PIC X(01)  VALUE 'N'.         00990002
009200         88  FIRST-TIME             VALUE  'Y'.                   01000002
009300     05  ERASE-KEY-VALUE            PIC S9(04) COMP VALUE +128.   01010002
009400     05  FILLER REDEFINES ERASE-KEY-VALUE.                        01020002
009500         09  FILLER                 PIC X(01).                    01030002
009600         09  ERASE-KEY              PIC X(01).                    01040002
009700     05  REFORMAT-TIME              PIC 9(07).                    01050002
009800     05  FILLER REDEFINES REFORMAT-TIME.                          01060002
009900         09  FILLER                 PIC X(01).                    01070002
010000         09  REFORMAT-HH            PIC X(02).                    01080002
010100         09  REFORMAT-MM            PIC X(02).                    01090002
010200         09  FILLER                 PIC X(02).                    01100002
010300     05  WORK-TIME.                                               01110002
010400         09  WORK-HH                PIC X(02).                    01120002
010500         09  FILLER                 PIC X(01) VALUE ':'.          01130002
010600         09  WORK-MM                PIC X(02).                    01140002
010900     05  DATA-ONLY-FLAG             PIC X(01)  VALUE 'N'.         01170002
011000         88  DATA-ONLY              VALUE  'Y'.                   01180002
           05  WK-CURSOR                  PIC S9(04) COMP.                      
           05  SYSTEM-MSG                 PIC X(79) VALUE SPACES.       01190002
011100     05  UNAUTH-MESSAGE             PIC X(79)                     01190002
011500         VALUE 'UNAUTHORIZED USER.'.                              01230002
011100     05  SEC-MESSAGE                PIC X(79)                     01190002
011500         VALUE 'SIGN ON SECURITY NOT AVAILABLE, TRY AGAIN.'.      01230002
011200     05  ERROR-PROG-MSG.                                          01200002
011300         09  ERROR-PROG-NAME        PIC X(08).                    01210002
011400         09  FILLER                 PIC X(71)                     01220002
011500             VALUE ' PROGRAM NOT AVAILIABLE.'.                    01230002
011800     05  WS-ACAT-NEXT               PIC X.                        01260002
011900     05  LINE-COUNT                 PIC 9(03).                    01270002
012000     05  SUB                        PIC S9(03) COMP-3.            01280002
012000     05  SUB1                       PIC S9(03) COMP-3.            01280002
012000     05  SUB3                       PIC S9(03) COMP-3.            01280002
012000     05  SUB4                       PIC S9(03) COMP-3.            01280002
00032                                                                   01320002
           EJECT                                                        01350002
       COPY ACATCOM.                                                    01360002
           EJECT                                                        01350002
       COPY ACATSRCH.                                                   01360002
           EJECT                                                        01350002
       COPY SECLINKC.                                                   01360002
           EJECT                                                        01350002
017600 COPY ATTR.                                                       01410002
017700     EJECT                                                        01420002
017800 COPY DFHAID.                                                     01430002
017900     EJECT                                                        01440002
018000 COPY ACAT00M.                                                    01450002
018000 COPY ACAT23M.                                                    01450002
       01  FILLER REDEFINES ACAT23MO.                                           
           05  FILLER                             PIC X(12).                    
           05  WS-MAP-DETAIL-ENTRY OCCURS 4 TIMES.                              
               09  MSDATEL                        PIC S9(4) COMP.               
               09  MSDATEA                        PIC X(01).                    
               09  MSDATEO                        PIC X(008).                   
               09  MBRL                           PIC S9(4) COMP.               
               09  MBRA                           PIC X(01).                    
               09  MBRO                           PIC X(003).                   
               09  MACL                           PIC S9(4) COMP.               
               09  MACA                           PIC X(01).                    
               09  MACO                           PIC X(005).                   
               09  MRRL                           PIC S9(4) COMP.               
               09  MRRA                           PIC X(01).                    
               09  MRRO                           PIC X(003).                   
               09  MDESCL                         PIC S9(4) COMP.               
               09  MDESCA                         PIC X(01).                    
               09  MDESCO                         PIC X(030).                   
               09  MCBRKRL                        PIC S9(4) COMP.               
               09  MCBRKRA                        PIC X(01).                    
               09  MCBRKRO                        PIC X(004).                   
               09  MSECRL                         PIC S9(4) COMP.               
               09  MSECRA                         PIC X(01).                    
               09  MSECRO                         PIC X(009).                   
               09  MDESC2L                        PIC S9(4) COMP.               
               09  MDESC2A                        PIC X(01).                    
               09  MDESC2O                        PIC X(030).                   
               09  MACATL                         PIC S9(4) COMP.               
               09  MACATA                         PIC X(01).                    
               09  MACATO                         PIC X(014).                   
               09  MTYPEL                         PIC S9(4) COMP.               
               09  MTYPEA                         PIC X(01).                    
               09  MTYPEO                         PIC X(003).                   
               09  MSTATL                         PIC S9(4) COMP.               
               09  MSTATA                         PIC X(01).                    
               09  MSTATO                         PIC X(030).                   
                                                                                
021300      EJECT                                                       01660002
       01  WS-POP-UP-WORKAREA.                                                  
            COPY ACAT90TS.                                                      
021300      EJECT                                                       01660002
021400 LINKAGE SECTION.                                                 01670002
021500 01  DFHCOMMAREA.                                                 01680002
021600     03  FILLER                    PIC X(2000).                   01690002
                                                                        01900002
021700 COPY TWACOMMN.                                                   01910002
021800     03 TWA-ACAT-AREA.                                            01920002
              05 TWA-ACAT-NOT-FOUND-FLAG      PIC X(01).                01930002
014100           88 TWA-ACAT-NOT-FOUND        VALUE 'Y'.                01950002
              05  TWA-CONFIRM-FLAG            PIC X.                            
                 88 TWA-CONFIRM               VALUE 'Y'.                        
013800        05 TWA-INTRAN-FLAG              PIC X.                    01940002
014100           88 TWA-INTRAN-BRW            VALUE 'B'.                01950002
014300           88 TWA-INTRAN-NO-CHANGE      VALUE 'N'.                01980002
              05 TWA-MAP-TABLE.                                         02000002
                  07 TWA-MNEXT         PIC X(01).                       02030002
                  07 TWA-ASSET-AREA OCCURS 4 TIMES.                             
                     09 TWA-MSDATE     PIC X(08).                               
                     09 TWA-MCACCT     PIC X(20).                       02030002
                     09 TWA-MBR        PIC X(03).                       02030002
                     09 TWA-MAC        PIC X(05).                       02030002
                     09 TWA-MRR        PIC X(03).                       02030002
                     09 TWA-MTYPE      PIC X(03).                       02030002
                     09 TWA-STTS-CD    PIC X(03).                               
                     09 TWA-MSECR      PIC X(12).                               
                     09 TWA-MCBRKR     PIC X(04).                               
                     09 TWA-KEY-FIELDS PIC X(56).                               
                     09 TWA-MDESC-GROUP.                                        
                        11 TWA-MDESC   PIC X(30).                               
                        11 TWA-MDESC2  PIC X(30).                               
                     09 TWA-MACAT         PIC X(14).                    02030002
                                                                                
              05 TWA-PAGE-AREA.                                         02000002
                 07 TWA-TOP-DB-KEY.                                     02030002
                    09 TWA-TOP-CONTROL-NBR      PIC X(14).                      
                    09 TWA-TOP-DLVR-ACCT        PIC X(20).                      
                    09 TWA-TOP-STTLM-DT         PIC X(10).                      
                    09 TWA-TOP-INIT-SECR        PIC X(09).                      
                    09 TWA-TOP-INIT-SLOC        PIC X(02).                      
                    09 TWA-TOP-INIT-CSH-MGN     PIC X(01).                      
                 07 TWA-LAST-DB-KEY.                                    02030002
                    09 TWA-LAST-CONTROL-NBR     PIC X(14).                      
                    09 TWA-LAST-DLVR-ACCT       PIC X(20).                      
                    09 TWA-LAST-STTLM-DT        PIC X(10).                      
                    09 TWA-LAST-INIT-SECR       PIC X(09).                      
                    09 TWA-LAST-INIT-SLOC       PIC X(02).                      
                    09 TWA-LAST-INIT-CSH-MGN    PIC X(01).                      
           EJECT                                                        01350002
023800                                                                  02160002
024000 PROCEDURE DIVISION.                                              02170002
024100 INITIALIZATION.                                                  02180002
024200     EXEC CICS IGNORE CONDITION DUPKEY DUPREC  ENDFILE  ERROR     02190002
024300               ILLOGIC INVREQ   IOERR  ITEMERR LENGERR  MAPFAIL   02200002
024400               NOSPACE NOSTG    NOTFND         PGMIDERR QIDERR    02210002
024500     END-EXEC.                                                    02220002
024600     EXEC CICS HANDLE CONDITION NOTOPEN (NOT-OPEN)                02230002
024700                               DISABLED (NOT-OPEN)                02240002
024800                               DSIDERR  (NOT-OPEN)                02250002
024900     END-EXEC.                                                    02260002
025000                                                                  02270002
025100     EXEC CICS ASSIGN TWALENG (TWA-SIZE)                          02280002
025200     END-EXEC.                                                    02290002
025300     IF TWA-SIZE = 0                                              02300002
              MOVE LOW-VALUE TO ACAT23MO                                        
025400        MOVE 'TWA SIZE EQUAL ZERO, FATAL ERROR' TO SYSTEM-MSG     02310002
025500        PERFORM  ERROR-RTN.                                       02320002
025600                                                                  02330002
025700     EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                  02340002
025800     END-EXEC.                                                    02350002
025900                                                                  02360002
026000     EJECT                                                        02370002
026100                                                                  02380002
026200 MAIN-PROCESSING.                                                 02390002
026300     MOVE EIBTRMID TO TERM-ID.                                    02400002
026400     MOVE EIBTRNID TO TRAN-ID.                                    02410002
026500     MOVE TWA-CLIENT-NO TO TWA-CLIENT-NO-9.                       02420002
026600     MOVE 'N'           TO END-OF-DATA-FLAG.                      02430002
026700     MOVE SPACES        TO SYSTEM-MSG.                            02440002
           MOVE 0             TO WK-SUSPEND-COUNT.                              
           MOVE 0             TO WK-CURSOR.                                     
026800     MOVE 0             TO LINE-COUNT.                            02450002
026900     MOVE LOW-VALUE     TO ACAT23MO.                              02460002
027100     PERFORM GET-DATE-AND-TIME-RTN.                               02530002
027200     MOVE DFHCOMMAREA          TO ACATCOMM-COMMAREA.              02540002
TEMP       SET ACAT-SIGN-ON-UPDATE TO TRUE.                                     
           IF  ACAT-PROGRAM-NAME = 'ACAT23AS'                           02550002
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
028100         PERFORM CONTINUE-PROCESS                                 02560002
028000     ELSE                                                         02570002
           IF  ACAT-PROGRAM-NAME = 'RATT01  '                           02550002
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
032500         PERFORM READ-TSQ-RTN                                     03810002
032600         PERFORM DELETE-TSQ-RTN                                   03820002
028000     ELSE                                                         02570002
               MOVE 'ACAT23AS' TO ACAT-PROGRAM-NAME                             
027900         PERFORM FIRST-TIME-THRU                                  02580002
028200     END-IF END-IF.                                               02590002
028300                                                                  02600002
028400     EJECT                                                        02610002
028500                                                                  02620002
028600 GET-DATE-AND-TIME-RTN.                                           02630002
028700     EXEC  CICS ASKTIME                                           02640002
028800           ABSTIME(WSABSTIME)                                     02650002
028900     END-EXEC.                                                    02660002
029000     EXEC  CICS FORMATTIME                                        02670002
029100           ABSTIME(WSABSTIME)                                     02680002
029200           MMDDYY(WSMMDDYY)                                       02690002
029300           DATESEP(WSDATESEP)                                     02700002
029400           TIME(WSTIME)                                           02710002
029500           TIMESEP(WSTIMESEP)                                     02720002
029600     END-EXEC.                                                    02730002
029900                                                                  02760002
030800     EJECT                                                        02770002
030900                                                                  02780002
031000 FIRST-TIME-THRU.                                                 02790002
           SET FIRST-TIME TO TRUE.                                      02810002
           MOVE 'U' TO ACAT-NEXT                                                
           PERFORM DELETE-TSQ-RTN.                                      02800002
           MOVE LOW-VALUES TO TWA-PAGE-AREA.                                    
           PERFORM READ-ASSETS-WITHHELD-RTN.                            08610002
       EJECT                                                            02860002
                                                                        03690002
   400 CONTINUE-PROCESS.                                                03800009
032500     PERFORM READ-TSQ-RTN.                                        03810002
032600     PERFORM DELETE-TSQ-RTN.                                      03820002
032700     SET DATA-ONLY TO TRUE.                                       03830002
033000     EVALUATE TRUE                                                03840002
033100          WHEN EIBAID = DFHPF11 OR DFHCLEAR                       03850002
033200               PERFORM RETURN-CONTROL-RTN                         03860002
033300          WHEN EIBAID = DFHENTER OR DFHPF3                        03870002
033400               PERFORM ENTER-KEY-RTN                              03880002
033500          WHEN EIBAID = DFHPA1                                    03890002
033600               PERFORM PAGE-FORWARD-RTN                           03900002
033700          WHEN EIBAID = DFHPA2                                    03910002
033800               PERFORM PAGE-BACKWARD-RTN                          03920002
033900          WHEN OTHER                                              03930002
                     MOVE LOW-VALUE TO ACAT23MO                         03940002
                     MOVE -1 TO MNEXTL                                          
034000               MOVE 'ERROR FUNCTION KEY'                          03950002
034100                 TO SYSTEM-MSG                                    03960002
034200               PERFORM ERROR-RTN                                  03970002
034300     END-EVALUATE.                                                03980002
034400                                                                  03990002
DD6700     EJECT                                                        04240002
037500 RECEIVE-MAP-RTN.                                                 04320002
037600     EXEC CICS RECEIVE MAP('TRLMAP')                                      
037700                       MAPSET('ACAT00M')                          04340002
                             FROM(ACAT-RECEIVE-MAP)                     04350002
037800                       LENGTH(ACAT-RECEIVE-MAP-LENGTH)            04360002
037900     END-EXEC.                                                    04370002
038000                                                                  04380002
           MOVE +1000 TO ACAT-RECEIVE-MAP-LENGTH.                               
037600     EXEC CICS RECEIVE MAP('ACAT23M')                                     
037700                       MAPSET('ACAT23M')                          04340002
                             FROM(ACAT-RECEIVE-MAP)                     04350002
037800                       LENGTH(ACAT-RECEIVE-MAP-LENGTH)            04360002
037900     END-EXEC.                                                    04370002
038000                                                                  04380002
038100     EJECT                                                        04390002
038200                                                                  04400002
038300 ENTER-KEY-RTN.                                                   04410002
038400     PERFORM RECEIVE-MAP-RTN.                                     04420002
038700     PERFORM EDIT-INPUT-BRW-RTN.                                  04440010
038600     PERFORM MERGE-MAP-NEXT-RTN.                                  04430002
039300     IF TWA-MNEXT GREATER SPACES AND NOT = 'U'                    04470002
              MOVE TWA-MNEXT TO ACAT-INP-SEL                                    
039300        PERFORM PROCESS-JUMP-RTN.                                 04470002
                                                                                
WAIT****   IF EIBAID = DFHPF3                                                   
********      PERFORM 7510-XCTL-TO-CONTROL-PROG.                                
           IF TWA-INTRAN-BRW                                            04809410
              PERFORM READ-ASSETS-WITHHELD-RTN.                         08610002
           PERFORM ERROR-RTN.                                                   
040200                                                                  04560002
040300 EJECT                                                            04570002
040300 PROCESS-JUMP-RTN.                                                04570002
           MOVE 'ACAT23AS' TO ACAT-CALLING-PROG-NAME.                           
           MOVE ACAT-INP-SEL   TO WS-ACAT-NEXT.                                 
           MOVE 'U'            TO ACAT-NEXT ACAT-INP-SEL.                       
  *****    MOVE ACAT-COMMON-WORK-AREA TO ACAT-SUM-RESTORE-AREA                  
  *****                                  ACAT-NFD-RESTORE-AREA.                 
           PERFORM SCREEN-SECURITY-CHECK.                                       
                                                                                
       COPY ACATJUMP.                                                           
           IF CALLED-PROGRAM-NAME = SPACES                                      
              MOVE -1             TO MNEXTL                                     
              MOVE ATT-UNPROT-BRT TO MNEXTA                                     
              MOVE 'NEXT TRANSACTION SELECTION IS INVALID' TO                   
                  SYSTEM-MSG                                                    
              MOVE SPACES     TO ACAT-CALLING-PROG-NAME                         
              PERFORM ERROR-RTN.                                                
                                                                                
           MOVE -1 TO MNEXTL.                                                   
           MOVE WS-ACAT-NEXT         TO ACAT-INP-SEL ACAT-NEXT.                 
           PERFORM INVOKE-DETAIL-PROGRAM-RTN.                                   
           MOVE -1 TO MNEXTL.                                                   
           PERFORM ERROR-RTN.                                                   
                                                                        04770310
       SCREEN-SECURITY-CHECK.                                                   
           IF  ACAT-SUPER-SIGN-ON-UPDATE                                        
           OR  ACAT-SUPER-SIGN-ON-BROWSE                                        
           OR  ACAT-JUMP-ANYWHERE                                               
           OR  WS-ACAT-NEXT = '$'                                               
               CONTINUE                                                         
           ELSE                                                                 
               MOVE WS-ACAT-NEXT TO ACAT-SCREEN-IND                             
               SET ACAT-UPDATE-MODE TO TRUE                                     
               MOVE SPACES    TO SECLINK-LIST                           AEISAC07
               MOVE '2'       TO SECLINK-ACTION-CODE                    AEISAC07
               MOVE 'SCON'    TO SECLINK-TYPE                                   
               MOVE ACAT-SEC-LIT TO SECLINK-ITEM                                
               PERFORM CALL-SECLINK-RTN                                 AEISAC07
               IF SECLINK-RETURN-CODE = '00' OR '20'                    AEISAC07
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
                     MOVE WS-ACAT-NEXT                                  AEISAC07
                          TO SYSTEM-MSG(44 : 1)                         AEISAC07
                     MOVE -1             TO MNEXTL                              
                     MOVE ATT-UNPROT-BRT TO MNEXTA                              
                     PERFORM ERROR-RTN                                          
                  END-IF                                                        
               END-IF                                                           
           END-IF.                                                              
      *-------------------------------------------------------------*           
      *               XCTL TO CONTROL PROGRAM                       *           
      *-------------------------------------------------------------*           
       7510-XCTL-TO-CONTROL-PROG.                                               
           MOVE SPACES TO ACAT-BR-AC.                                           
           IF EIBCPOSN < 640                                                    
              MOVE TWA-MBR(1) TO ACAT-BR                                02030002
              MOVE TWA-MAC(1) TO ACAT-AC                                02030002
           ELSE                                                                 
           IF EIBCPOSN < 1040                                                   
              MOVE TWA-MBR(2) TO ACAT-BR                                02030002
              MOVE TWA-MAC(2) TO ACAT-AC                                02030002
           ELSE                                                                 
           IF EIBCPOSN < 1440                                                   
              MOVE TWA-MBR(3) TO ACAT-BR                                02030002
              MOVE TWA-MAC(3) TO ACAT-AC                                02030002
           ELSE                                                                 
              MOVE TWA-MBR(4) TO ACAT-BR                                02030002
              MOVE TWA-MAC(4) TO ACAT-AC                                02030002
           END-IF.                                                              
           IF ACAT-BR NOT > SPACES                                              
              MOVE 'CUSOR NOT ON POSITIONED ON DETAIL - PF3 IGNORED'            
                 TO SYSTEM-MSG                                                  
              PERFORM ERROR-RTN                                                 
           END-IF.                                                              
           PERFORM WRITE-TSQ-RTN.                                       10790002
           EXEC CICS XCTL                                                       
                  PROGRAM('ACAT01CP')                                           
                  COMMAREA(ACATCOMM-COMMAREA)                                   
                  LENGTH(LENGTH OF ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
       EJECT                                                            04770210
062900 MERGE-MAP-NEXT-RTN.                                              06100002
           IF MNEXTL > 0                                                04809210
              MOVE MNEXTI TO TWA-MNEXT                                          
           ELSE                                                         04809510
           IF MNEXTA = ERASE-KEY                                        04809610
                 MOVE SPACES TO TWA-MNEXT                               04809710
           END-IF END-IF.                                               04809910
                                                                                
       EDIT-INPUT-BRW-RTN.                                              04800010
           IF MMBRL > 0                                                 04809210
              IF MMBRI = ACAT-INP-BRANCH                                        
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMBRI TO ACAT-INP-BRANCH                                  
                 SET TWA-INTRAN-BRW TO TRUE                             04809410
              END-IF                                                            
           ELSE                                                         04809510
           IF MMBRA = ERASE-KEY                                         04809610
                 MOVE SPACES TO ACAT-INP-BRANCH                         04809710
                 SET TWA-INTRAN-BRW TO TRUE                             04809810
           END-IF END-IF.                                               04809910
                                                                                
           IF MMACL > 0                                                 04809210
              IF MMACI = ACAT-INP-ACCOUNT                                       
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMACI TO ACAT-INP-ACCOUNT                                 
                 SET TWA-INTRAN-BRW TO TRUE                             04809410
              END-IF                                                            
           ELSE                                                         04809510
           IF MMACA = ERASE-KEY                                         04809610
                 MOVE SPACES TO ACAT-INP-ACCOUNT                        04809710
                 SET TWA-INTRAN-BRW TO TRUE                             04809810
           END-IF END-IF.                                               04809910
                                                                                
           IF MMBKRL > 0                                                04809210
              IF MMBKRI = ACAT-INP-CONTRA-BKR                                   
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMBKRI TO ACAT-INP-CONTRA-BKR                             
                 SET TWA-INTRAN-BRW TO TRUE                             04809410
              END-IF                                                            
           ELSE                                                         04809510
           IF MMBKRA = ERASE-KEY                                        04809610
                 MOVE SPACES TO ACAT-INP-CONTRA-BKR                     04809710
                 SET TWA-INTRAN-BRW TO TRUE                             04809810
           END-IF END-IF.                                               04809910
                                                                                
           IF MMRRL > 0                                                 04809210
              IF MMRRI = ACAT-INP-RR                                            
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMRRI TO ACAT-INP-RR                                      
                 SET TWA-INTRAN-BRW TO TRUE                             04809410
              END-IF                                                            
           ELSE                                                         04809510
           IF MMRRA = ERASE-KEY                                         04809610
                 MOVE SPACES TO ACAT-INP-RR                             04809710
                 SET TWA-INTRAN-BRW TO TRUE                             04809810
           END-IF END-IF.                                               04809910
                                                                                
           IF MMTFRL > 0                                                04809210
              IF MMTFRI = ACAT-INP-TFR-TYP                                      
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMTFRI TO ACAT-INP-TFR-TYP                                
                 SET TWA-INTRAN-BRW TO TRUE                             04809410
              END-IF                                                            
           ELSE                                                         04809510
           IF MMTFRA = ERASE-KEY                                        04809610
                 MOVE SPACES TO ACAT-INP-TFR-TYP                        04809710
                 SET TWA-INTRAN-BRW TO TRUE                             04809810
           END-IF END-IF.                                               04809910
                                                                                
           IF MMSTATL > 0                                               04809210
              IF MMSTATI = ACAT-INP-STATUS                                      
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMSTATI TO ACAT-INP-STATUS                                
                 SET TWA-INTRAN-BRW TO TRUE                             04809410
              END-IF                                                            
           ELSE                                                         04809510
           IF MMSTATA = ERASE-KEY                                       04809610
                 MOVE SPACES TO ACAT-INP-STATUS                         04809710
                 SET TWA-INTRAN-BRW TO TRUE                             04809810
           END-IF END-IF.                                               04809910
                                                                                
                                                                                
       EJECT                                                                    
       MOVE-ACAT23IO-TO-TWA-RTN.                                                
           IF ACAT23IO-ASCTD-DT > SPACES                                        
           AND ACAT23IO-ASCTD-DT NOT = '0001-01-01'                             
              MOVE ACAT23IO-ASCTD-DT(6 : 2) TO WS-DATE-MM                       
              MOVE ACAT23IO-ASCTD-DT(9 : 2) TO WS-DATE-DD                       
              MOVE ACAT23IO-ASCTD-DT(3 : 2) TO WS-DATE-YY                       
              MOVE WS-DATE-MMDDYY      TO TWA-MSDATE(SUB)                       
           ELSE                                                                 
              MOVE '          '        TO TWA-MSDATE(SUB)                       
           END-IF.                                                              
           MOVE ACAT23IO-RCV-NBR    TO TWA-MCBRKR(SUB).                         
           MOVE ACAT23IO-RCV-ACCT   TO TWA-MCACCT(SUB).                         
           MOVE ACAT23IO-DLVR-ACCT  TO TWA-MBR(SUB).                            
           MOVE ACAT23IO-DLVR-ACCT(4 : 5) TO TWA-MAC(SUB).                      
           MOVE ACAT23IO-CONTROL-NBR   TO TWA-MACAT(SUB).                       
           MOVE ACAT23IO-TRNFR-TYPE-CD TO TWA-MTYPE(SUB).                       
           MOVE ACAT23IO-STTS-CD       TO TWA-STTS-CD(SUB).                     
           MOVE ACAT23IO-ISIN-SEC-ISSUE-CD  TO TWA-MSECR(SUB).                  
           MOVE ACAT23IO-DESC-TXT  TO TWA-MDESC-GROUP(SUB).                     
                                                                                
           IF SUB = 1                                                           
              MOVE ACAT23IO-CONTROL-NBR       TO TWA-TOP-CONTROL-NBR            
              MOVE ACAT23IO-DLVR-ACCT         TO TWA-TOP-DLVR-ACCT              
              MOVE ACAT23IO-ASCTD-DT          TO TWA-TOP-STTLM-DT               
              MOVE ACAT23IO-ISIN-SEC-ISSUE-CD TO TWA-TOP-INIT-SECR              
              MOVE ACAT23IO-STTLM-LCTN-CD     TO TWA-TOP-INIT-SLOC              
              MOVE ACAT23IO-CSH-MGN-SHRT-CD   TO TWA-TOP-INIT-CSH-MGN           
LRM002        MOVE TWA-TOP-DB-KEY             TO TWA-KEY-FIELDS (SUB)           
           ELSE                                                                 
           IF SUB > 1                                                           
              MOVE ACAT23IO-CONTROL-NBR       TO TWA-LAST-CONTROL-NBR           
              MOVE ACAT23IO-DLVR-ACCT         TO TWA-LAST-DLVR-ACCT             
              MOVE ACAT23IO-ASCTD-DT          TO TWA-LAST-STTLM-DT              
              MOVE ACAT23IO-ISIN-SEC-ISSUE-CD TO TWA-LAST-INIT-SECR             
              MOVE ACAT23IO-STTLM-LCTN-CD     TO TWA-LAST-INIT-SLOC             
              MOVE ACAT23IO-CSH-MGN-SHRT-CD   TO TWA-LAST-INIT-CSH-MGN          
LRM002        MOVE TWA-LAST-DB-KEY            TO TWA-KEY-FIELDS (SUB)           
           END-IF.                                                              
                                                                                
       REFORMAT-SCREEN-DETAIL.                                                  
********   MOVE LOW-VALUES  TO ACAT23MO.                                        
           MOVE 1 TO SUB.                                                       
           PERFORM UNTIL SUB > 4                                                
              MOVE TWA-MSDATE(SUB) TO MSDATEO(SUB)                              
              MOVE TWA-MBR(SUB)    TO MBRO(SUB)                                 
              MOVE TWA-MAC(SUB)    TO MACO(SUB)                                 
              MOVE TWA-MRR(SUB)    TO MRRO(SUB)                                 
              MOVE TWA-MCBRKR(SUB) TO MCBRKRO(SUB)                              
              MOVE TWA-MTYPE(SUB)  TO MTYPEO(SUB)                               
              MOVE TWA-MDESC(SUB)  TO MDESCO(SUB)                               
              MOVE TWA-MDESC2(SUB) TO MDESC2O(SUB)                              
              MOVE TWA-MACAT(SUB)  TO MACATO(SUB)                               
              MOVE TWA-MSECR(SUB)  TO MSECRO(SUB)                               
              PERFORM SET-STATUS-MSG-RTN                                        
              MOVE WS-STATUS       TO MSTATO(SUB)                               
              ADD 1 TO SUB                                                      
           END-PERFORM.                                                         
                                                                                
           MOVE ACAT-INP-BRANCH    TO MMBRO.                                    
           MOVE ACAT-INP-ACCOUNT   TO MMACO.                                    
           MOVE ACAT-INP-RR        TO MMRRO.                                    
           MOVE ACAT-INP-CONTRA-BKR TO MMBKRO.                                  
           MOVE ACAT-INP-TFR-TYP   TO MMTFRO.                                   
           MOVE ACAT-INP-STATUS    TO MMSTATO.                                  
           SKIP3                                                                
       SET-STATUS-MSG-RTN.                                                      
           IF TWA-STTS-CD(SUB) NOT GREATER SPACES                       08505010
              MOVE SPACES TO WS-STATUS                                          
           ELSE                                                                 
           EVALUATE TWA-STTS-CD(SUB)                                    08505010
               WHEN '100'                                               08506010
                    MOVE '100-REQUEST'               TO WS-STATUS       08507010
               WHEN '110'                                               08506010
                    MOVE '110-REQUEST ADJUST'        TO WS-STATUS       08507010
               WHEN '120'                                               08506010
                    MOVE '120-REQUEST ADJUST PAST'   TO WS-STATUS       08507010
               WHEN '130'                                               08506010
                    MOVE '130-REQUEST PAST'          TO WS-STATUS       08507010
               WHEN '140'                                               08506010
                    MOVE '140-REQUEST REJECT'        TO WS-STATUS       08507010
               WHEN '200'                                               08506010
                    MOVE '200-REVIEW'                TO WS-STATUS       08507010
               WHEN '210'                                               08507110
                    MOVE '210-REVIEW ADJUST'         TO WS-STATUS       08508010
               WHEN '220'                                               08509010
                    MOVE '220-REVIEW ERROR'          TO WS-STATUS       08509110
               WHEN '230'                                               08509010
                    MOVE '230-REVIEW ACCELERATE'     TO WS-STATUS       08509110
               WHEN '300'                                               08509210
                    MOVE '300-SETTLE PREP'   TO WS-STATUS               08509310
               WHEN '310'                                               08509410
                    MOVE '310-SETTLE CLOSE'  TO WS-STATUS               08509510
               WHEN '400'                                               08509710
                    MOVE '400-CLOSE PURGE'   TO WS-STATUS               08509810
               WHEN '500'                                               08509910
                    MOVE '500-MEMO PARTIAL REQUEST'      TO WS-STATUS   08510010
               WHEN '510'                                               08510110
                    MOVE '510-MEMO PURGE PARTIAL REQUEST' TO WS-STATUS  08510210
               WHEN '600'                                               08510110
                    MOVE '600-REJECT'     TO WS-STATUS                  08510210
               WHEN OTHER                                               08510110
                    MOVE TWA-STTS-CD(SUB) TO WS-STATUS                  08510210
           END-EVALUATE.                                                08510310
                                                                                
           EJECT                                                                
062700 EJECT                                                            06080002
062800                                                                  06090002
       RETURN-FROM-DETAIL-RTN.                                                  
031100     PERFORM DELETE-TSQ-RTN.                                      02800002
031200     SET FIRST-TIME TO TRUE.                                      02810002
070900                                                                  06740002
071000 EJECT                                                            06750002
       CALL-SECLINK-RTN.                                                AEISAC07
00442      EXEC CICS LINK PROGRAM ('SECLINK')                           AEISAC07
                COMMAREA(SECLINK-LIST)                                          
00443           LENGTH(LENGTH OF SECLINK-LIST)                          AEISAC07
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
087100                                                                  07220110
       INVOKE-DETAIL-PROGRAM-RTN.                                       07225010
           EXEC CICS XCTL PROGRAM(CALLED-PROGRAM-NAME)                          
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
  ******** MOVE 'Y' TO ACAT-NOTFND-FLAG.                                        
           MOVE CALLED-PROGRAM-NAME TO ERROR-PROG-NAME.                         
           MOVE 'B' TO ACAT-NEXT.                                               
           MOVE ERROR-PROG-MSG    TO SYSTEM-MSG.                                
           MOVE LOW-VALUE TO ACAT23MO.                                          
           MOVE SPACES     TO ACAT-CALLING-PROG-NAME.                           
                                                                                
                                                                                
096300     EJECT                                                        07630002
096400                                                                  07640002
   500 INIT-MAP-RTN.                                                    07650005
096600     MOVE SPACES     TO ACAT23MO                                  07660002
                              TWA-MAP-TABLE.                            02000002
098100     EJECT                                                        07770002
                                                                                
           SKIP3                                                                
                                                                                
103000 SEND-MAP-RETURN.                                                 08040002
           MOVE -1 TO MMBRL.                                                    
103600     IF (LINE-COUNT = 0)                                          08120002
103700     AND DATA-ONLY                                                08130002
104000        EVALUATE TRUE                                             08140002
104100           WHEN EIBAID = DFHPA1                                   08150002
104200               SET ALARM-NEEDED TO TRUE                           08160002
104300               MOVE 'BOTTOM OF DATA.         ' TO SYSTEM-MSG      08170002
104400           WHEN EIBAID = DFHPA2                                   08180002
104500               SET ALARM-NEEDED TO TRUE                           08190002
104600               MOVE 'TOP OF DATA.            ' TO SYSTEM-MSG      08200002
104900        END-EVALUATE                                              08230002
105000     END-IF.                                                      08240002
           PERFORM INIT-MAP-INPUT-AREA.                                         
           MOVE ATT-UNPROT TO MNEXTA                                    02480002
105100     SET TWA-INTRAN-NO-CHANGE TO TRUE.                            08250002
105100     MOVE 'N' TO  TWA-ACAT-NOT-FOUND-FLAG.                        08250002
105200     MOVE SYSTEM-MSG     TO  TRLMSGO.                             08260002
105300     IF  SYSTEM-MSG NOT = SPACES                                  08270002
105400         MOVE ATT-ASKIP-BRT  TO  TRLMSGA                          08280002
105500     END-IF.                                                      08290002
127200     PERFORM WRITE-TSQ-RTN.                                       10790002
    00     IF  DATA-ONLY                                                08300002
105700         PERFORM SEND-MAP-DATA-ONLY                               08310002
105800     ELSE                                                         08320002
105900         PERFORM SEND-MAP-ERASE                                   08330002
           END-IF.                                                              
           MOVE 'ACAT23AS' TO ACAT-PROGRAM-NAME.                        08340002
106000     PERFORM RETURN-TO-CICS.                                      08350002
106100                                                                  08360002
106200     EJECT                                                        08370002
106100                                                                  08360002
       INIT-MAP-INPUT-AREA.                                                     
           MOVE ACAT-INP-BRANCH     TO MMBRO.                                   
           MOVE ACAT-INP-ACCOUNT    TO MMACO.                                   
           MOVE ACAT-INP-RR         TO MMRRO.                                   
           MOVE ACAT-INP-CONTRA-BKR TO MMBKRO.                                  
           MOVE ACAT-INP-TFR-TYP   TO MMTFRO.                                   
           MOVE ACAT-INP-STATUS    TO MMSTATO.                                  
                                                                                
           MOVE TWA-CLIENT-NO-X(2 : 3) TO MCLINBO.                              
029700     MOVE WSTIME              TO MTIMEO.                          02740002
029800     MOVE WSMMDDYY            TO MDATEO.                          02750002
106100                                                                  08360002
106200     EJECT                                                        08370002
106100                                                                  08360002
106400 SEND-MAP-ERASE.                                                  08390002
027000     MOVE 'ACAX'        TO MTRANSO.                               08400002
           MOVE TWA-CLIENT-NO-X(2 : 3) TO MCLINBO.                              
029700     MOVE WSTIME        TO MTIMEO.                                02740002
029800     MOVE WSMMDDYY      TO MDATEO.                                02750002
106500     EXEC CICS SEND MAP('HDRMAP')                                 08410002
106600               MAPSET('ACAT00M')                                  08420002
106700               FROM(HDRMAPO)                                      08430002
106800               ACCUM                                              08440002
                     CURSOR                                                     
106900               ERASE                                              08450002
107000     END-EXEC.                                                    08460002
106500     EXEC CICS SEND MAP('ACAT23M')                                08410002
106600               MAPSET('ACAT23M')                                  08420002
106700               FROM(ACAT23MO)                                     08430002
106800               ACCUM                                              08440002
                     CURSOR                                                     
107000     END-EXEC.                                                    08460002
           MOVE SYSTEM-MSG TO TRLMSGO.                                          
106500     EXEC CICS SEND MAP('TRLMAP')                                 08410002
106600               MAPSET('ACAT00M')                                  08420002
106700               FROM(TRLMAPO)                                      08430002
106800               ACCUM                                              08440002
107000     END-EXEC.                                                    08460002
106500     EXEC CICS SEND PAGE                                          08410002
107000     END-EXEC.                                                    08460002
107100                                                                  08470002
107200 EJECT                                                            08480002
107300                                                                  08490002
107400 SEND-MAP-DATA-ONLY.                                              08500002
027000     MOVE 'ACAX'         TO MTRANSO.                              08510002
           MOVE TWA-CLIENT-NO-X(2 : 3) TO MCLINBO.                              
029700     MOVE WSTIME         TO MTIMEO.                               02740002
029800     MOVE WSMMDDYY       TO MDATEO.                               02750002
    ***    IF FIRST-TIME                                                        
    ***    AND (WK-CURSOR NOT = 0)                                              
              EXEC CICS SEND MAP('HDRMAP')                              08410002
                        MAPSET('ACAT00M')                               08420002
                        FROM(HDRMAPO)                                   08430002
                        ACCUM                                           08440002
                        CURSOR                                          08550002
                        DATAONLY                                        08560002
               END-EXEC                                                 08460002
107600         EXEC CICS SEND MAP('ACAT23M')                            08520002
107700                   MAPSET('ACAT23M')                              08530002
107800                   FROM(ACAT23MO)                                 08540002
107900                   CURSOR                                         08550002
108000                   DATAONLY                                       08560002
                         ACCUM                                             08440
108100         END-EXEC                                                         
               MOVE SYSTEM-MSG TO TRLMSGO                                       
               EXEC CICS SEND MAP('TRLMAP')                                08410
                         MAPSET('ACAT00M')                                 08420
                         FROM(TRLMAPO)                                     08430
                         DATAONLY                                       08560002
                         ACCUM                                             08440
               END-EXEC                                                    08460
               EXEC CICS SEND PAGE                                      08410002
               END-EXEC.                                                08460002
108200                                                                  08580002
108500 READ-ASSETS-WITHHELD-RTN.                                        08610002
           MOVE TWA-CLIENT-NO-X   TO ACAT23IO-CLIENT-NBR.                       
           MOVE ACAT-ADP-BROKER   TO ACAT23IO-DLVR-NBR.                         
                                                                                
           MOVE ACAT-INP-BRANCH   TO ACAT23IO-DLVR-ACCT.                        
           MOVE ACAT-INP-ACCOUNT  TO ACAT23IO-DLVR-ACCT(4 : 5).                 
           MOVE ACAT23IO-DLVR-ACCT TO ACAT23IO-SE-DLVR-ACCT.                    
LRM003     PERFORM VARYING SUB FROM 1 BY 1                                      
LRM003              UNTIL SUB > 20                                              
LRM003        IF ACAT23IO-SE-DLVR-ACCT(SUB : 1) NOT > ' '                       
LRM003           MOVE '%' TO  ACAT23IO-SE-DLVR-ACCT(SUB : 1)                    
LRM003        END-IF                                                            
LRM003     END-PERFORM.                                                         
           MOVE ACAT-INP-RR        TO ACAT23IO-SE-RR.                           
           MOVE ACAT-INP-CONTRA-BKR TO ACAT23IO-RCV-NBR                         
                                       ACAT23IO-SE-RCV-NBR.                     
           MOVE ACAT-INP-TFR-TYP   TO ACAT23IO-SE-TRNFR-TYPE.                   
           MOVE ACAT-INP-STATUS    TO ACAT23IO-SE-STATUS.                       
                                                                                
           MOVE LOW-VALUES        TO ACAT23IO-PAGE-AREA.                        
           MOVE SPACES            TO TWA-MAP-TABLE.                     02000002
                                                                                
           SET ACAT23IO-OPEN-CURSORA TO TRUE                                    
           IF ACAT-INP-STATUS = 'PUR'                                           
              SET ACAT23IO-HISTORY-DB TO TRUE                                   
           ELSE                                                                 
           IF ACAT-INP-STATUS = 'INT'                                           
              SET ACAT23IO-INITIAL-DB TO TRUE                                   
           ELSE                                                                 
              MOVE SPACES TO ACAT23IO-DB2-TABLE-RQST.                           
                                                                                
           PERFORM LINK-TO-ACAT23IO-RTN.                                        
           SET ACAT23IO-READ-NEXT TO TRUE                                       
           PERFORM LINK-TO-ACAT23IO-RTN.                                        
           IF ACAT23IO-NOT-FOUND                                                
              MOVE 'NO ASSETS WITHHELD ON FILE' TO SYSTEM-MSG                   
              PERFORM  ERROR-RTN                                        03650002
           ELSE                                                                 
           IF NOT ACAT23IO-FOUND                                                
              MOVE LOW-VALUE TO ACAT23MO                                03620002
              MOVE 'READ-N'          TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT23IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT23IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
           MOVE ZERO TO SUB.                                                    
           PERFORM UNTIL SUB > 3                                                
                     OR NOT ACAT23IO-FOUND                                      
              PERFORM CHECK-SEARCH-ENGINE-RTN                                   
                 THRU CHECK-SEARCH-ENGINE-EXIT                                  
              IF REQUESTED-SEARCH-VALID                                         
                 ADD 1 TO SUB                                                   
                 PERFORM MOVE-ACAT23IO-TO-TWA-RTN                               
                 SET ACAT23IO-READ-NEXT TO TRUE                                 
              END-IF                                                            
              PERFORM LINK-TO-ACAT23IO-RTN                                      
           END-PERFORM.                                                         
                                                                                
LRM003     PERFORM UNTIL SUB > 3                                                
LRM003        ADD 1 TO SUB                                                      
LRM003        MOVE SPACES TO TWA-ASSET-AREA (SUB)                               
LRM003     END-PERFORM.                                                         
                                                                                
           IF SUB NOT GREATER ZERO                                              
              MOVE 'NO ASSETS WITHHELD ON FILE' TO SYSTEM-MSG                   
              PERFORM  ERROR-RTN                                        03650002
           END-IF.                                                              
                                                                                
           PERFORM REFORMAT-SCREEN-DETAIL.                                      
           MOVE 'NEXT ASSET(S) DISPLAYED' TO SYSTEM-MSG.                        
           PERFORM SEND-MAP-RETURN.                                     10250002
           PERFORM WRITE-TSQ-RTN.                                       10790002
           PERFORM RETURN-TO-CICS.                                      08350002
                                                                        08960002
       CHECK-SEARCH-ENGINE-RTN.                                                 
           SET REQUESTED-SEARCH-INVALID TO TRUE.                                
           IF  ACAT-INP-BRANCH > SPACES                                         
           AND ACAT-INP-BRANCH NOT = ACAT23IO-DLVR-ACCT(1 : 3)                  
               GO TO CHECK-SEARCH-ENGINE-EXIT                                   
           END-IF.                                                              
                                                                                
           IF  ACAT-INP-ACCOUNT > SPACES                                        
           AND ACAT-INP-ACCOUNT NOT = ACAT23IO-DLVR-ACCT(4 : 5)                 
               GO TO CHECK-SEARCH-ENGINE-EXIT                                   
           END-IF.                                                              
                                                                                
           IF  ACAT-INP-RR > SPACES                                             
           AND ACAT-INP-ACCOUNT NOT = ACAT23IO-RR                               
               GO TO CHECK-SEARCH-ENGINE-EXIT                                   
           END-IF.                                                              
                                                                                
           IF (ACAT-INP-TFR-TYP = 'FUL'                                         
           AND ACAT23IO-TRNFR-TYPE-CD NOT = 'FUL')                              
           OR (ACAT-INP-TFR-TYP = 'RCR'                                         
           AND ACAT23IO-TRNFR-TYPE-CD NOT = 'RCR')                              
               GO TO CHECK-SEARCH-ENGINE-EXIT                                   
           END-IF.                                                              
                                                                                
           IF  ACAT-INP-CONTRA-BKR > SPACES                                     
           AND ACAT-INP-CONTRA-BKR NOT = ACAT23IO-RCV-NBR                       
               GO TO CHECK-SEARCH-ENGINE-EXIT                                   
           END-IF.                                                              
                                                                                
           IF (ACAT-INP-STATUS = 'RQR'                                          
           AND ACAT23IO-STTS-CD NOT = '140')                                    
           OR (ACAT-INP-STATUS = 'REJ'                                          
           AND ACAT23IO-STTS-CD NOT = '600')                                    
           OR (ACAT-INP-STATUS = 'CLP'                                          
           AND ACAT23IO-STTS-CD NOT = '400')                                    
               GO TO CHECK-SEARCH-ENGINE-EXIT                                   
           END-IF.                                                              
                                                                                
           SET REQUESTED-SEARCH-VALID TO TRUE.                                  
       CHECK-SEARCH-ENGINE-EXIT. EXIT.                                          
                                                                                
           EJECT                                                                
108500 PAGE-FORWARD-RTN.                                                08610002
                                                                                
           MOVE TWA-CLIENT-NO-X   TO ACAT23IO-CLIENT-NBR                        
           MOVE ACAT-ADP-BROKER   TO ACAT23IO-DLVR-NBR                          
           MOVE TWA-LAST-DB-KEY   TO ACAT23IO-DB-KEY                            
                                                                                
           SET ACAT23IO-OPEN-CURSORA TO TRUE                                    
           IF ACAT-INP-STATUS = 'PUR'                                           
              SET ACAT23IO-HISTORY-DB TO TRUE                                   
           ELSE                                                                 
           IF ACAT-INP-STATUS = 'INT'                                           
              SET ACAT23IO-INITIAL-DB TO TRUE                                   
           ELSE                                                                 
              MOVE SPACES TO ACAT23IO-DB2-TABLE-RQST.                           
                                                                                
           PERFORM LINK-TO-ACAT23IO-RTN                                         
           SET ACAT23IO-READ-NEXT TO TRUE                                       
           PERFORM LINK-TO-ACAT23IO-RTN                                         
           IF ACAT23IO-NOT-FOUND                                                
              MOVE 'BOTTOM OF WITHHELD ASSETS' TO SYSTEM-MSG                    
              PERFORM  ERROR-RTN                                        50002   
           ELSE                                                                 
           IF NOT ACAT23IO-FOUND                                                
              MOVE LOW-VALUE TO ACAT23MO                                20002   
              MOVE 'NX-AS'           TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT23IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT23IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
           MOVE 1 TO SUB.                                                       
           PERFORM UNTIL SUB > 4                                                
                     OR NOT ACAT23IO-FOUND                                      
              PERFORM MOVE-ACAT23IO-TO-TWA-RTN                                  
              ADD 1 TO SUB                                                      
              PERFORM LINK-TO-ACAT23IO-RTN                                      
           END-PERFORM.                                                         
                                                                                
           IF SUB = 1                                                           
              MOVE 'BOTTOM OF WITHHELD ASSETS' TO SYSTEM-MSG                    
              PERFORM ERROR-RTN                                                 
           ELSE                                                                 
              MOVE 'NEXT WITHHELD ASSETS DISPLAYED' TO SYSTEM-MSG.              
                                                                                
LRM003     PERFORM UNTIL SUB > 4                                                
LRM003        MOVE SPACES TO TWA-ASSET-AREA (SUB)                               
LRM003        ADD 1 TO SUB                                                      
LRM003     END-PERFORM.                                                         
                                                                                
           PERFORM REFORMAT-SCREEN-DETAIL.                                      
           PERFORM SEND-MAP-DATA-ONLY.                                  10250002
           PERFORM WRITE-TSQ-RTN.                                       10790002
           PERFORM RETURN-TO-CICS.                                      08350002
                                                                        08960002
111200     EJECT                                                        08970002
111300                                                                  08980002
111400 PAGE-BACKWARD-RTN.                                               08990002
           MOVE TWA-CLIENT-NO-X   TO ACAT23IO-CLIENT-NBR.                       
           MOVE ACAT-ADP-BROKER   TO ACAT23IO-DLVR-NBR.                         
           MOVE TWA-TOP-DB-KEY TO ACAT23IO-DB-KEY.                              
LRM003     PERFORM VARYING SUB FROM 1 BY 1                                      
LRM003              UNTIL SUB > 20                                              
LRM003        IF ACAT23IO-SE-DLVR-ACCT(SUB : 1) NOT > ' '                       
LRM003           MOVE '%' TO  ACAT23IO-SE-DLVR-ACCT(SUB : 1)                    
LRM003        END-IF                                                            
LRM003     END-PERFORM.                                                         
LRM003     MOVE ACAT-INP-RR        TO ACAT23IO-SE-RR.                           
LRM003     MOVE ACAT-INP-CONTRA-BKR TO ACAT23IO-RCV-NBR                         
LRM003                                 ACAT23IO-SE-RCV-NBR.                     
LRM003     MOVE ACAT-INP-TFR-TYP   TO ACAT23IO-SE-TRNFR-TYPE.                   
LRM003     MOVE ACAT-INP-STATUS    TO ACAT23IO-SE-STATUS.                       
                                                                                
LRM003     MOVE TWA-TOP-INIT-SECR  TO ACAT23IO-CURRENT-SECR.                    
LRM003     MOVE TWA-TOP-INIT-SLOC  TO ACAT23IO-CURRENT-SLOC.                    
LRM003     MOVE TWA-TOP-INIT-CSH-MGN TO ACAT23IO-CURRENT-TYPE.                  
                                                                                
           SET ACAT23IO-OPEN-CURSORB TO TRUE                                    
           IF ACAT-INP-STATUS = 'PUR'                                           
              SET ACAT23IO-HISTORY-DB TO TRUE                                   
           ELSE                                                                 
           IF ACAT-INP-STATUS = 'INT'                                           
              SET ACAT23IO-INITIAL-DB TO TRUE                                   
           ELSE                                                                 
              MOVE SPACES TO ACAT23IO-DB2-TABLE-RQST.                           
                                                                                
           PERFORM LINK-TO-ACAT23IO-RTN.                                        
           SET ACAT23IO-READ-PREV TO TRUE                                       
           PERFORM LINK-TO-ACAT23IO-RTN.                                        
           IF ACAT23IO-NOT-FOUND                                                
              MOVE 'TOP OF ASSET' TO SYSTEM-MSG                                 
              PERFORM  ERROR-RTN                                        03650002
           ELSE                                                                 
           IF NOT ACAT23IO-FOUND                                                
              MOVE LOW-VALUE TO ACAT23MO                                03620002
              MOVE 'PR-AS'           TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT23IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT23IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
           MOVE 1 TO SUB SUB1.                                                  
           PERFORM UNTIL SUB1 > 4                                               
                     OR NOT ACAT23IO-FOUND                                      
              ADD 1 TO SUB1                                                     
              PERFORM SHIFT-DOWN-TWA-ASSETS-RTN                                 
              PERFORM MOVE-ACAT23IO-TO-TWA-RTN                                  
              PERFORM LINK-TO-ACAT23IO-RTN                                      
           END-PERFORM.                                                         
LRM002     MOVE TWA-KEY-FIELDS(4) TO TWA-LAST-DB-KEY                            
                                                                                
           PERFORM REFORMAT-SCREEN-DETAIL.                                      
           MOVE 'PREV ASSET DISPLAYED' TO SYSTEM-MSG.                           
           PERFORM SEND-MAP-DATA-ONLY.                                  10250002
           PERFORM WRITE-TSQ-RTN.                                       10790002
           PERFORM RETURN-TO-CICS.                                      08350002
                                                                        08960002
       SHIFT-DOWN-TWA-ASSETS-RTN.                                               
           MOVE 3 TO SUB3.                                                      
           PERFORM UNTIL SUB3 < 1                                               
              ADD 1 SUB3 GIVING SUB4                                            
              MOVE TWA-ASSET-AREA(SUB3) TO TWA-ASSET-AREA(SUB4)                 
              SUBTRACT 1 FROM SUB3                                              
           END-PERFORM.                                                         
           EJECT                                                        09240002
       LINK-TO-ACATNAIO-RTN.                                                    
00442      EXEC CICS LINK PROGRAM (WS-ACATNAIO)                         02890002
                COMMAREA(ACATNAIO-CALL-AREA)                            02900002
00443           LENGTH(LENGTH OF ACATNAIO-CALL-AREA)                    02910002
           END-EXEC.                                                    02920002
                                                                                
       LINK-TO-ACAT23IO-RTN.                                                    
           MOVE ACAT-SUPER-SIGN-ON-SEC-FLAG                                     
                    TO ACAT23IO-SUPER-SIGN-FLAG.                                
00442      EXEC CICS LINK PROGRAM (WS-ACAT23DB)                         02890002
                COMMAREA(ACAT23IO-CALL-AREA)                            02900002
00443           LENGTH(LENGTH OF ACAT23IO-CALL-AREA)                    02910002
           END-EXEC.                                                    02920002
           EJECT                                                                
120800                                                                  10130002
120900 NOT-OPEN.                                                        10140002
           IF FIRST-TIME                                                        
              MOVE 'ACAT23AS' TO ACAT-PROGRAM-NAME                      08340002
              MOVE LOW-VALUES TO ACAT23MO.                                      
                                                                                
           PERFORM INIT-MAP-RTN.                                        07650005
           MOVE 'ACAT FILE IS NOT AVAILABLE.' TO TRLMSGO.               10150002
           MOVE  ATT-ASKIP-BRT                TO TRLMSGA.               10160002
           MOVE -1 TO MNEXTL.                                           04773110
127200     PERFORM WRITE-TSQ-RTN.                                       10790002
121200     PERFORM SEND-MAP-ERASE.                                      10170002
121300     PERFORM RETURN-TO-CICS.                                      10180002
120800                                                                  10181004
120700     EJECT                                                        10182004
                                                                                
       DB2-ERROR-RTN.                                                           
           PERFORM ERROR-RTN.                                                   
121400                                                                  10190002
121700 ERROR-RTN.                                                       10220002
           MOVE TWA-CLIENT-NO-X(2 : 3) TO MCLINBO.                              
029700     MOVE WSTIME         TO  MTIMEO.                              02740002
029800     MOVE WSMMDDYY       TO  MDATEO.                              02750002
   800     MOVE SYSTEM-MSG     TO  TRLMSGO.                             10230002
121900     MOVE ATT-ASKIP-BRT  TO  TRLMSGA.                             10240002
           IF FIRST-TIME                                                        
              PERFORM SEND-MAP-ERASE                                    08330002
           ELSE                                                                 
              PERFORM SEND-MAP-DATA-ONLY.                               10250002
127200     PERFORM WRITE-TSQ-RTN.                                       10790002
122100     PERFORM RETURN-TO-CICS.                                      10260002
122200                                                                  10270002
122300     EJECT                                                        10288002
122400                                                                  10290002
123600 READ-TSQ-RTN.                                                    10350002
123700     EXEC CICS READQ TS QUEUE(TSQ-NAME)                           10360002
123800                        INTO(TWA-AREA)                            10370002
123900                        LENGTH(LENGTH OF TWA-AREA)                10380002
                              ITEM(ITEM-NUM)                            10390002
124000     END-EXEC.                                                    10400002
125100     IF (EIBRESP NOT = +0)                                        10410002
           AND (NOT FIRST-TIME)                                         10420002
              MOVE LOW-VALUE TO ACAT23MO                                        
125200        MOVE 'ACAT23 READ TSQ ERROR.'                             10430002
125300          TO SYSTEM-MSG                                           10440002
125400        PERFORM ERROR-RTN                                         10450002
125500     END-IF.                                                      10460002
124100                                                                  10470002
124200 DELETE-TSQ-RTN.                                                  10480002
124300     EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         10490002
124400     END-EXEC.                                                    10500002
124500                                                                  10510002
124600 WRITE-TSQ-RTN.                                                   10520002
124700     EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                          10530002
124800                         FROM(TWA-AREA)                           10540002
124900                         LENGTH(LENGTH OF TWA-AREA)               10550002
                               ITEM(ITEM-NUM)                           10560002
125000     END-EXEC.                                                    10570002
125100     IF EIBRESP NOT = +0                                          10580002
              MOVE LOW-VALUE TO ACAT23MO                                        
125200        MOVE 'ACAT23 WRITE TSQ ERROR.'                            10590002
125300          TO SYSTEM-MSG                                           10600002
125500     END-IF.                                                      10620002
125600                                                                  10630002
136400     EJECT                                                        00110040
125800                                                                  10650002
125900 RETURN-CONTROL-RTN.                                              10660002
126000     EXEC CICS SEND CONTROL                                       10670002
126100                      ERASE                                       10680002
126200                     FREEKB                                       10690002
126300     END-EXEC.                                                    10700002
126400     EXEC CICS XCTL PROGRAM ('RATT01')                            10710002
126500     END-EXEC.                                                    10720002
126600     EXEC CICS RETURN                                             10730002
126700     END-EXEC.                                                    10740002
126800                                                                  10750002
126900     EJECT                                                        10760002
127000                                                                  10770002
127100 RETURN-TO-CICS.                                                  10780002
127300     EXEC CICS RETURN                                             10800002
127400               TRANSID('ACAX')                                    10810002
127500               COMMAREA(ACATCOMM-COMMAREA)                        10820002
127600     END-EXEC.                                                    10830002
127700                                                                  10840002
127800 HANG-CICS.                                                       10850002
127900     GOBACK.                                                      10860002
