000001* PDX    - ACAT33FC C0305327 12/14/10 08:56:51 TBLAMUR            00001000
LRM014* SSR# 73009 USE COPY CATACTYP TO STANDARIZE ACCOUNT TYPE LOOKUP.         
000001* PDX    - ACAT33FC C0278346 03/17/09 08:18:28 TBLAMUR            00001000
LRM013* SSR# 61867 UPGRADE RESTICTED SECURITY FOUND MSG                         
000001* PDX    - ACAT33FC C0272581 11/20/08 08:10:36 TBLAMUR            00001000
LRM012* SSR# 66164 DO NOT ALLOW MFC FOR PTF AND CORRECT LOW-VALUE BUG           
LRM012* DUE TO ERASE-EOF IN MAME AND SECR DESC FIELDS.                          
000001* PDX    - ACAT33FC C0270299 09/15/08 16:34:28 TBLAMUR            00001000
000001* LRM SSRS 55766 55717 RECOMPILE ONLY FOR COPYS ACATCOM,90TS,JUMP.        
000001* PDX    - ACAT33FC C0250441 06/25/07 15:52:00 TBLAMUR            00001000
LRM011* SSR 53075 SPIN-OFF CHANGES                                              
000001* PDX    - ACAT33FC C0240592 10/20/06 14:29:42 TBLAMUR            00001000
LRM010* SSR# 48634 USE N/A ADT CUSTOMER TYPE TO LOOKUP ACCOUNT TYPE             
000001* PDX    - ACAT33FC C0231507 06/20/06 10:56:44 TBLAMUR            00001000
LRM009* SSR# 45744 RECOMPILE ONLY DUE TO ACATRST COPY EXPANDED.                 
LRM009* SSR# 40661 RETAIN USER ID OF INITIATOR.                                 
000001* PDX    - ACAT33FC C0227932 12/12/05 15:40:08 TBLAMUR            00001000
LRM008* SSR# 42405 RECOMPILE ONLY DUE TO ACATRST COPY EXPANDED.                 
000001* PDX    - ACAT33FC C0222929 07/01/05 08:52:04 TBLAMUR            00001000
000001* PDX    - ACAT33FC C0216396 06/15/05 16:05:50 TBLAMUR            00001000
LRM007* SSR 0039561 PHASE-II ALLOW DUPLICATE MFC ON SAME HISTORY TIF            
LRM007* ON THE SAME CYCLE.  CLIENT NEEDS ABILITY TO SUBMIT ONE ASSET            
LRM007* PER MFC.  DELETE ALL ASSETS MISSING FUND ACCOUNT NBR WHEN               
LRM007* WHEN SUBMITTING.  DO NOT SHOW ASSET INVOLED IN MFC IN LIST ON           
LRM007* 2ND EFFORT.  DO NOT ALLOW SUBMIT IF NO ASSETS HAVE FUND NBR.            
000001* PDX    - ACAT33FC C0210492 10/18/04 13:58:59 TBLAMUR            00001000
LRM002* SSR 0034535 ADD CAGE TAG NUMBER TO SCREEN AND ASSET                     
000001* PDX    - ACAT33FC C0204074 05/12/04 11:36:56 TBLAMUR            00001000
LRM001* SSR 0037453 POPULATE CENTS IN ASSET VALUE, DEFAULT ZERO WHEN            
LRM001* CONTRA IS A BANK, ALLOW ZERO IN VALUE FIELD REGARDLESS.                 
000001* PDX    - ACAT33FC C0197017 11/05/03 16:30:15 TBEDTAK            00001000
ET0001* ADD RE-REGISTRATION DATE ENTRY FIELD.                           00001000
000001* PDX    - ACAT33FC C0182233 02/14/03 11:53:02 TBLAMUR            00001000
000001* PDX    - ACAT33FC C0179784 09/27/02 09:51:17 TBEDTAK            00001000
000001* PDX    - ACAT33FC C0157168 09/05/01 13:51:15 TBLAMUR            00001000
000100 IDENTIFICATION DIVISION.                                         00020002
000200 PROGRAM-ID.    ACAT33FC.                                         00030002
000300 AUTHOR.  LARRY MUREY.                                            00040002
000400*REMARKS.                                                         00050002
000500**-------------------------------------------------------------** 00060002
000600*  ACAT INITIATE MUTUAL FUND CLEANUP MFC (DELIVERER).           *         
000662*  BRANCH ACCOUNT OR TIF NUMBER WILL BE USED TO VERIFY THERE    *         
000663*  EXISTS ONE OR MORE SETTLED FULL DELIVERY REQUESTS ON THE     *         
000664*  HISTORY DATABASE.  ONLY MFNM MFMM ASSETS ARE ELIGABLE TO BE  *         
000665*  BUILT.                                                                 
000667*  PAGING IS ALLOWED THRU BOTH MFC(S) VIA PF7,PF8               *         
000667*  FOR TIF(S), AND PA1 PA1 FOR ASSETS.                          *         
000700**-------------------------------------------------------------** 00080002
000800 ENVIRONMENT DIVISION.                                            00090002
000900 DATA DIVISION.                                                   00100002
001000 WORKING-STORAGE SECTION.                                         00110002
001100 COPY PDXIDCOB.                                                   00120002
001200 77  TWA-SIZE                       PIC S9(4) COMP.               00130002
       77  WS-B1PRINT-LENGTH              PIC S9(4) COMP.               00130002
TEMP   77  WS-EDITMOD                     PIC X(08) VALUE 'ACATEDIT'.   00140002
TEMP   77  WS-ACATNAIO                    PIC X(08) VALUE 'ACAT00NA'.   00140002
TEMP   77  WS-ACATPPIO                    PIC X(08) VALUE 'ACATPPDB'.   00140002
TEMP   77  WS-ACATMSD                     PIC X(08) VALUE 'ACATMSD '.   00140002
TEMP   77  WS-ACATRST                     PIC X(08) VALUE 'ACATRST '.   00140002
TEMP   77  WS-ACAT33DB                    PIC X(08) VALUE 'ACAT33DB'.   00140002
TEMP   77  WS-ACATSRCH                    PIC X(08) VALUE 'ACATSRCH'.   00140002
       77  WS-CALC-PRICE                  PIC S9(9)V9(7) COMP-3.                
                                                                                
       77  WS-MCACCT                      PIC X(20) VALUE SPACES.               
       77  CURR-EDIT-LEN                  PIC S9(4) COMP  VALUE +35.            
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
           'ACAT33FC - DB2 UNEXPECTED ERROR '.                                  
           05  WS-DB2-PROBLEM-FUNCTION    PIC X(06) VALUE SPACES.               
           05  WS-DB2-PROBLEM-TABLE       PIC X(09) VALUE SPACES.               
           05  WS-DB2-PROBLEM-ID          PIC -999  VALUE SPACES.               
LRM011     05  FILLER                     PIC X(15) VALUE                       
LRM011         ' CALL HELP DESK'.                                               
                                                                                
       01  WS-SUBMITTED-MSG               PIC X(70) VALUE                       
           'TIF ALREADY SUBMITTED TO NSCC; AWAITING REPLY; BROWSE ONLY'.        
       01  WS-ACKNOWLEDGE-MSG             PIC X(70) VALUE                       
           'TIF AWAITING CONTRA BROKER ACKNOWLEDGEMENT; BROWSE ONLY'.           
LRM013 01  WS-CUSIP-RESTRICTED-MSG.                                             
LRM013     05  FILLER                     PIC X(47) VALUE                       
LRM013             'CUSIP NUMBER FOUND ON RESTRICTED SECURITY TABLE'.           
LRM013     05  FILLER                     PIC X(16) VALUE                       
LRM013             '/BROADRIDGE NBR '.                                          
LRM013     05  WS-CUSIP-RESTRICTED-ADP-NO PIC X(07).                            
002200 EJECT                                                            00230002
002900*******************************************************           00300002
003000*      EDITMOD WORK AREA                                          00310002
003100*******************************************************           00320002
       01  EDIT-AMT-AREA.                                                       
           05  WK-AMT-CODE                PIC X(01) VALUE 'D'.                  
           05  WK-AMT-NUM-ITEM            PIC S9(03) COMP-3 VALUE +1.           
           05  WK-AMT-IN-LEN              PIC S9(03) COMP-3 VALUE +22.          
           05  WK-AMT-OUT-LEN             PIC S9(03) COMP-3 VALUE +17.          
           05  WK-AMT-IN                  PIC X(22) VALUE LOW-VALUE.            
           05  WK-AMT-OUT                 PIC S9(15)V99.                        
           05  WK-AMT-DECIMAL-LEN         PIC S9(03) COMP-3 VALUE +2.           
           05  WK-AMT-COMMAR              PIC X(01) VALUE 'Y'.                  
           05  WK-AMT-RET-CODE            PIC X(01) VALUE SPACE.                
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.           
                                                                                
       01  EDIT-QTY-AREA.                                                       
           05  WK-QTY-CODE                PIC X(01) VALUE 'D'.                  
           05  WK-QTY-NUM-ITEM            PIC S9(03) COMP-3 VALUE +1.           
           05  WK-QTY-IN-LEN              PIC S9(03) COMP-3 VALUE +22.          
           05  WK-QTY-OUT-LEN             PIC S9(03) COMP-3 VALUE +21.          
           05  WK-QTY-IN                  PIC X(22) VALUE LOW-VALUE.            
           05  WK-QTY-OUT-D5X.                                                  
               07  FILLER                 PIC X(04).                            
               07  WK-QTY-OUT             PIC S9(12)V9(5).                      
           05  WK-QTY-DECIMAL-LEN         PIC S9(03) COMP-3 VALUE +5.           
           05  WK-QTY-COMMAR              PIC X(01) VALUE 'Y'.                  
           05  WK-QTY-RET-CODE            PIC X(01) VALUE SPACE.                
           05  FILLER                     PIC X(01) VALUE HIGH-VALUE.           
                                                                                
        01  WS-MQTY-AREA.                                                       
           05  WS-MQTY-ED-D5           PIC ZZZZZZZ,ZZZ,ZZZ.99999-.              
           05  WS-MQTY-ED-D4 REDEFINES WS-MQTY-ED-D5                            
                                       PIC ZZZZ,ZZZ,ZZZ,ZZZ.9999-.              
           05  WS-MQTY-ED-D3 REDEFINES WS-MQTY-ED-D4                            
                                       PIC ZZZZZ,ZZZ,ZZZ,ZZZ.999-.              
           05  WS-MQTY-ED-D2 REDEFINES WS-MQTY-ED-D3                            
                                       PIC ZZZZZZ,ZZZ,ZZZ,ZZZ.99-.              
           05  WS-MQTY-ED-D1 REDEFINES WS-MQTY-ED-D2                            
                                       PIC ZZZZZZZ,ZZZ,ZZZ,ZZZ.9-.              
           05  WS-MQTY-ED-D0 REDEFINES WS-MQTY-ED-D1                            
                                       PIC ZZZZZ,ZZZ,ZZZ,ZZZ,ZZZ-.              
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
ET0001     05  WS-DIVIDED          PIC 9(03).                           00520002
ET0001     05  WS-REMAIN           PIC 9(02).                           00520002
ET0001     05  WS-LEAP-YEAR-SW     PIC X(01).                           00520002
ET0001         88  WS-LEAP-YEAR              VALUE 'Y'.                 00520002
ET0001     05  WS-VALID-DATE-SW    PIC X(01).                           00520002
ET0001         88  WS-VALID-DATE             VALUE 'Y'.                 00520002
ET0001     05  WS-DB2-FORM-DATE.                                        00520002
ET0001         09  WS-DATE-CC      PIC X(02).                           00520002
ET0001         09  WS-DATE-YY      PIC X(02).                           00520002
ET0001         09  WS-HYPHON1      PIC X(01).                           00520002
ET0001         09  WS-DATE-MM      PIC X(02).                           00520002
ET0001         09  WS-HYPHON2      PIC X(01).                           00520002
ET0001         09  WS-DATE-DD      PIC X(02).                           00520002
ET0001     05  WS-EDITED-DATE.                                          00520002
ET0001         09  WS-EDITED-MM    PIC X(02).                           00520002
ET0001         09  FILLER          PIC X(01) VALUE '/'.                 00520002
ET0001         09  WS-EDITED-DD    PIC X(02).                           00520002
ET0001         09  FILLER          PIC X(01) VALUE '/'.                 00520002
ET0001         09  WS-EDITED-YY    PIC X(02).                           00520002
ET0001     05  WS-REG-DATE.                                             00520002
ET0001         09  WS-REG-MM       PIC X(02).                           00520002
ET0001         09  WS-REG-SLASH1   PIC X(01).                           00520002
ET0001         09  WS-REG-DD       PIC X(02).                           00520002
ET0001         09  WS-REG-SLASH2   PIC X(01).                           00520002
ET0001         09  WS-REG-YY       PIC X(02).                           00520002
ET0001         09  WS-REG-YY-N   REDEFINES WS-REG-YY                    00520002
ET0001                             PIC 9(02).                           00520002
ET0001     05  WS-REG-DATE-EDITED.                                      00520002
ET0001         09  WS-REG-DT-CC    PIC X(02).                           00520002
ET0001         09  WS-REG-DT-YY    PIC X(02).                           00520002
ET0001         09  WS-REG-DT-MM    PIC X(02).                           00520002
ET0001         09  WS-REG-DT-DD    PIC X(02).                           00520002
ET0001     05  WS-TOD-DATE.                                             00520002
ET0001         09  WS-TOD-CC       PIC X(02).                           00520002
ET0001         09  WS-TOD-YY       PIC X(02).                           00520002
ET0001         09  WS-TOD-MM       PIC X(02).                           00520002
ET0001         09  WS-TOD-DD       PIC X(02).                           00520002
ET0001     05  WS-MDY-DATE.                                             00520002
ET0001         09  WS-MMDDYY.                                           00520002
ET0001             11  WS-MDY-MM   PIC X(02).                           00520002
ET0001             11  WS-MDY-DD   PIC X(02).                           00520002
ET0001             11  WS-MDY-YY   PIC X(02).                           00520002
ET0001         09  FILLER          PIC X(02).                           00520002
005200                                                                  00530002
005300 EJECT                                                            00540002
005400*******************************************************           00550002
005500*      I/O CALL AREAS.                                            00560002
005600*******************************************************           00570002
       01  ACATNAIO-CALL-AREA.                                                  
           COPY ACATNAIO.                                                       
                                                                                
       01  ACATPPIO-CALL-AREA.                                                  
           COPY ACATPPIO.                                                       
                                                                                
       01  ACATMSDIO-CALL-AREA.                                                 
           COPY ACATMSDI.                                                       
                                                                                
       01  ACATRSTIO-CALL-AREA.                                                 
           COPY ACATRSIO.                                                       
                                                                                
       01  ACAT33IO-CALL-AREA.                                                  
           COPY ACAT33IO.                                                       
00342      EJECT                                                        MRGIPS05
005300 EJECT                                                            00540002
005400*******************************************************           00550002
005500*      B1 WORK AREA                                               00560002
005600*******************************************************           00570002
       01  B1-RECORD.                                                   00580002
           05  B1-REC-ID.                                               00590002
               09  B1-CLIENT-NO          PIC 9(03) COMP-3.              00600002
               09  B1-CARD-NO            PIC 9(07) COMP-3.              00610002
               09  B1-CLIENT             PIC 9(03) COMP-3.              00620002
               09  B1-SEQUENCE           PIC 9(05) COMP-3 VALUE 1.      00630002
           05  B1-REC-TYP-3              PIC X(01) VALUE '3'.           00640002
           05  B1-RETURN-VALUE           PIC X(35).                     00650002
006100                                                                  00670002
006000 EJECT                                                            00680002
006100                                                                  00690002
006200*******************************************************           00700002
006300*      ACAT33 WORK AREA                                           00710002
006400*******************************************************           00720002
006500 01  ACAT-WORK-AREA.                                              00730002
00314      05  UNPK-TYPE.                                               MRGIPS05
00315          10  FILLER                 PIC 9 VALUE ZERO.             MRGIPS05
00316          10  WK-PS-TYPE             PIC X VALUE ZERO.             MRGIPS05
           05  B1-CARD-OPTION             PIC X.                                
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
007800     05  WK-BRW-KEY.                                              00860002
007900         09 WK-BRW-CLIENT           PIC X(03).                    00870002
007900         09 WK-BRW-RECORD-TYPE      PIC X(02)   VALUE '90'.       00870002
008000         09 WK-BRW-CUR-BR-AC.                                     00880002
                  15 WK-BRW-CURRENCY      PIC X(03).                            
                  15 WK-BRW-BRANCH        PIC X(03).                            
                  15 WK-BRW-ACCOUNT       PIC X(05).                            
           05  WK-SUSPEND-COUNT           PIC S9(04) COMP VALUE ZERO.           
           05  WK-BROWSE-FORWARD-FLAG     PIC X(01) VALUE 'Y'.                  
               88  WK-BROWSE-FORWARD      VALUE 'Y'.                            
               88  WK-BROWSE-BACKWARD     VALUE 'N'.                            
008300     05  ALARM-NEEDED-FLAG          PIC X(01)  VALUE 'N'.         00910002
008400         88  ALARM-NEEDED           VALUE  'Y'.                   00920002
008700     05  END-OF-DATA-FLAG           PIC X(01)  VALUE 'N'.         00950002
008800         88  END-OF-DATA            VALUE  'Y'.                   00960002
008900     05  INPUT-ERROR-FLAG           PIC X(01)  VALUE 'N'.         00970002
009000         88  INPUT-ERROR            VALUE  'Y'.                   00980002
009100     05  FIRST-TIME-FLAG            PIC X(01)  VALUE 'N'.         00990002
009200         88  FIRST-TIME             VALUE  'Y'.                   01000002
           05  WS-DELETE-FLAG             PIC X(01)  VALUE 'N'.         00990002
               88  WS-DELETE              VALUE 'Y'.                            
           05  WS-ERROR-THIS-LINE-FLAG    PIC X(01)  VALUE 'N'.         00990002
009200         88  ERROR-THIS-LINE        VALUE  'Y'.                   01000002
           05  WS-DUPLICATE-MFC-FLAG      PIC X(01)  VALUE 'N'.         00990002
               88  DUPLICATE-MFC          VALUE 'Y'.                            
           05  WS-MCACCT-SW               PIC X(01)  VALUE 'N'.         00990002
               88  MCACCT-ERROR           VALUE 'Y'.                            
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
010700     05  INPUT-OPT-SPACE-FLAG       PIC X(01)  VALUE 'N'.         01150002
010800         88  INPUT-OPT-SPACE        VALUE  'Y'.                   01160002
010900     05  DATA-ONLY-FLAG             PIC X(01)  VALUE 'N'.         01170002
011000         88  DATA-ONLY              VALUE  'Y'.                   01180002
           05  WK-CURSOR                  PIC S9(04) COMP.                      
           05  SYSTEM-MSG                 PIC X(79) VALUE SPACES.       01190002
           05  WS-MRGN-MSG.                                                     
               09  WS-MRGN-MSG-LIT        PIC X(45).                            
               09  WS-MRGN-MSG-AMT        PIC ZZZ,ZZZ,ZZZ,ZZZ.99-.      MRGIML03
           05  WS-MRGN-QTY-MSG.                                                 
               09  WS-MRGN-MSG-LIT-QTY    PIC X(45).                            
               09  WS-MRGN-MSG-QTY        PIC ZZZ,ZZZ,ZZZ,ZZZ.99999-.   MRGIML03
           05  ERR-MSG.                                                 MRGIPS05
               09  ERR-EIBDS              PIC X(8)  VALUE SPACES.               
               09  ERR-MSG2               PIC X(70) VALUE SPACES.               
           05  ABEND-LINE.                                              03630002
               09  ABEND-MSG              PIC X(30).                    03630002
               09  FILLER                 PIC X(11) VALUE ' EIBRESP ='.         
               09  ABEND-EIBRESP          PIC 99.                               
011100     05  UNAUTH-MESSAGE             PIC X(79)                     01190002
011500         VALUE 'UNAUTHORIZED USER.'.                              01230002
011100     05  SEC-MESSAGE                PIC X(79)                     01190002
011500         VALUE 'SIGN ON SECURITY NOT AVAILABLE, TRY AGAIN.'.      01230002
011200     05  ERROR-PROG-MSG.                                          01200002
011300         09  ERROR-PROG-NAME        PIC X(08).                    01210002
011400         09  FILLER                 PIC X(71)                     01220002
011500             VALUE ' PROGRAM NOT AVAILIABLE.'.                    01230002
011600     05  SAVE-INTRAN-FLAG           PIC X(01).                    01240002
011700     05  PREV-INTRAN-FLAG           PIC X(01).                    01250002
011800     05  WS-ACAT-NEXT               PIC X.                        01260002
011900     05  LINE-COUNT                 PIC 9(03).                    01270002
012000     05  SUB                        PIC S9(03) COMP-3.            01280002
012000     05  SUB2                       PIC S9(03) COMP-3.            01280002
           05  WS-MQTY-9-UNSIGNED      USAGE COMP-2.                            
           05  WS-SSN-EDIT-FLAG           PIC X  VALUE SPACES.                  
               88  SSN-INVALID            VALUE 'I'.                            
               88  SSN-VALID              VALUE 'V'.                            
           05  WS-SSN-EDIT                PIC X(11) VALUE SPACES.               
           05  WS-TYPE-9                  PIC S9(04) COMP VALUE +0.             
           05  FILLER REDEFINES WS-TYPE-9.                                      
               07  FILLER                 PIC X.                                
               07  WS-TYPE                PIC X.                                
                                                                                
           05  W-SUB1                    PIC  9(004) VALUE 0.           CAT513  
           05 W-IRA-B1-SW                PIC  X(001).                   CAT513  
              88 W-IRA-B1-FOUND               VALUE 'Y'.                CAT513  
           05 W-CLASS-CODE-B1-SW         PIC  X(001).                   CAT513  
              88 W-CLASS-CODE-B1-FOUND        VALUE 'Y'.                CAT513  
LRM010     05 W-CUST-TYPE-B1-SW          PIC  X(001).                           
LRM010        88 W-CUST-TYPE-B1-FOUND         VALUE 'Y'.                        
LRM010     05 W-ADT-CUSTOMER-TYPE.                                              
LRM010        07 W-ADT-CUSTOMER-TYPE-9   PIC  9(003).                           
           05 W-RETIRE-ACCOUNT-SW        PIC  X(001).                   CAT513  
              88 W-RETIRE-ACCOUNT-FOUND       VALUE 'Y'.                CAT513  
           05 W-IRA-BR-RANGE-SW          PIC  X(001).                   CAT513  
              88 W-IRA-BR-RANGE-FOUND         VALUE 'Y'.                CAT513  
           05 W-IRA-BR-ACT-RANGE-SW      PIC  X(001).                   CAT513  
              88 W-IRA-BR-ACT-RANGE-FOUND     VALUE 'Y'.                CAT513  
434531     05  BH-ACAT-DEFAULT-CUSTOMER-TYPE   PIC XX VALUE SPACES.             
434504     05  BH-ACAT-DEFINE-CUSTOMER-TYPE   PIC X(1) VALUE '0'.       BHACAT  
434534     05  BH-ACAT-RETIRE-ACT-SUB-CTG-NO   PIC S9(3) COMP-3 VALUE 0.CAT513  
           05  BH-ACAT-RETIRE-ACT-SUB-CTG.                              BHACAT  
               07  BH-ACAT-RETIRE-ACT-SUB-CTG-ENT OCCURS 40 TIMES.      BHACAT  
                   09  BH-ACAT-RETIRE-ACT-IRA-CODE     PIC X(1).        BHACAT  
                   09  FILLER                          PIC X.                   
                   09  BH-ACAT-RETIRE-ACT-CUST-TYPE    PIC X(2).        BHACAT  
434535     05  BH-ACAT-CUST-TYPE-VALUE-NO    PIC 9(3) COMP-3 VALUE 0.   BHACAT  
           05  BH-ACAT-CUST-TYPE-VALUES.                                BHACAT  
               07  BH-ACAT-CUST-TYPE-VALUE-ENTRY  OCCURS 100 TIMES.     BHACAT  
                   09  BH-ACAT-CUST-TYPE-FROM-NA       PIC X(3).        BHACAT  
                   09  FILLER                          PIC X.                   
                   09  BH-ACAT-CUST-ACCT-TYPE          PIC X(2).        BHACAT  
009125     05  BH-MGCA-IRA-BR-RANGE-NO       PIC 9(3) COMP-3 VALUE 0.   BHMGCA  
           05  BH-MGCA-IRA-BR-RANGE.                                    BHMGCA  
               07  BH-MGCA-IRA-BR-RANGE-ENTRY      OCCURS 50 TIMES.     BHMGCA  
                   09  BH-MGCA-IRA-BR-RANGE-LO         PIC X(3).        BHMGCA  
                   09  FILLER                          PIC X.                   
                   09  BH-MGCA-IRA-BR-RANGE-HI         PIC X(3).        BHMGCA  
009126     05  BH-MGCA-IRA-BR-ACT-RANGE-NO   PIC 9(3) COMP-3 VALUE 0.   BHMGCA  
           05  BH-MGCA-IRA-BR-ACT-RANGE.                                BHMGCA  
               07  BH-MGCA-IRA-BR-ACT-RANGE-ENTRY  OCCURS 50 TIMES.     BHMGCA  
                   09  BH-MGCA-IRA-BR-ACT-BR-LO        PIC X(3).        BHMGCA  
                   09  FILLER                          PIC X.                   
                   09  BH-MGCA-IRA-BR-ACT-BR-HI        PIC X(3).        BHMGCA  
                   09  FILLER                          PIC X.                   
                   09  BH-MGCA-IRA-BR-ACT-ACT-LO       PIC X(5).        BHMGCA  
                   09  FILLER                          PIC X.                   
                   09  BH-MGCA-IRA-BR-ACT-ACT-HI       PIC X(5).        BHMGCA  
           05  WS-ASSET-X.                                                      
               07  WS-ASSET-ED             PIC ZZZ9.                            
           05  WS-STTLM-DT-MMDDYY.                                      02030002
               07  WS-STTLM-DT-MM          PIC XX.                      02030002
               07  WS-STTLM-DT-DD          PIC XX.                      02030002
               07  WS-STTLM-DT-YY          PIC XX.                      02030002
00032                                                                   01320002
           EJECT                                                        01350002
       COPY ACATCOM.                                                    01360002
           EJECT                                                        01350002
       COPY SECLINKC.                                                   01360002
           EJECT                                                        01350002
       COPY ACATSRCH.                                                   01360002
           EJECT                                                        01350002
017600 COPY ATTR.                                                       01410002
017700     EJECT                                                        01420002
017800 COPY DFHAID.                                                     01430002
017900     EJECT                                                        01440002
018000 COPY ACAT00M.                                                    01450002
018000 COPY ACAT33M.                                                    01450002
                                                                                
LRM002 COPY ACATCGIX.                                                           
       01  ACATCG-RESPONSE             PIC  S9(8) COMP VALUE +0.                
       01  WS-ACATCG-KEY               PIC X(29).                               
                                                                                
           EJECT                                                                
LRM014 COPY CATACTYP.                                                           
021300     EJECT                                                        01660002
       01  WS-POP-UP-WORKAREA.                                                  
            COPY ACAT90TS.                                                      
021300      EJECT                                                       01660002
021400 LINKAGE SECTION.                                                 01670002
021500 01  DFHCOMMAREA.                                                 01680002
021600     03  FILLER                    PIC X(2000).                   01690002
                                                                        01900002
       COPY TWACOMMN.                                                   01910002
021800     03 TWA-ACAT-AREA.                                            01920002
              05 TWA-ACAT-NOT-FOUND-FLAG      PIC X(01).                01930002
014100           88 TWA-ACAT-NOT-FOUND        VALUE 'Y'.                01950002
              05  TWA-CONFIRM-FLAG            PIC X.                            
                 88 TWA-CONFIRM               VALUE 'Y'.                        
013800        05 TWA-INTRAN-FLAG              PIC X.                    01940002
014100           88 TWA-INTRAN-BRW            VALUE 'B'.                01950002
014200           88 TWA-INTRAN-UPDATE         VALUE 'U'.                01960002
014200           88 TWA-INTRAN-ACT            VALUE 'T'.                01970002
014300           88 TWA-INTRAN-NO-CHANGE      VALUE 'N'.                01980002
              05 TWA-ACTION            PIC X.                                   
                 88 TWA-TIF-ADD               VALUE 'A'.                        
                 88 TWA-TIF-BROWSE            VALUE 'B'.                        
                 88 TWA-TIF-CHANGE            VALUE 'C'.                        
                 88 TWA-TIF-REFORMAT-MAP      VALUE 'R'.                        
                 88 TWA-TIF-CNTL-FROM-HSTY    VALUE '7'.                        
              05 TWA-MAP-TABLE.                                         02000002
                  07 TWA-SCREEN        PIC X(01).                       02030002
                  07 TWA-ACAT90CM-UPDATE-IND                            02030002
                                       PIC X(01).                               
                  07 TWA-MBR.                                           02030002
                     09 TWA-MBR-9      PIC 9(03).                       02030002
                  07 TWA-MAC.                                           02030002
                     09 TWA-MAC-9      PIC 9(05).                       02030002
                  07 TWA-MRR           PIC X(03).                       02030002
                  07 TWA-MCTYPE        PIC X(02).                       02030002
                  07 TWA-MCBRKR        PIC X(04).                       02030002
                  07 TWA-MCBNAM        PIC X(30).                       02030002
                  07 TWA-MCACCT        PIC X(20).                       02030002
                  07 TWA-MNAME         PIC X(30).                       02030002
                  07 TWA-MNAME2        PIC X(30).                       02030002
                  07 FILLER            PIC X(30).                       02030002
                  07 TWA-MSSN          PIC X(11).                       02030002
                  07 TWA-MSSN2         PIC X(11).                       02030002
                  07 TWA-MCCMNT-X120.                                           
                     09 TWA-MCCMNT     PIC X(60).                               
                     09 TWA-MCCMNT2    PIC X(60).                               
                  07 TWA-NA-IRA        PIC X(01).                               
                  07 TWA-MSUBM         PIC X(01).                       02030002
                  07 TWA-MACAT         PIC X(14).                       02030002
                  07 TWA-MSTAT         PIC X(03).                       02030002
                  07 TWA-MNEXT         PIC X(01).                       02030002
                  07 TWA-MCMNT         PIC X(01).                       02030002
                  07 TWA-MDEL          PIC X(01).                       02030002
                  07 TWA-MMRR          PIC X(03).                       02030002
                  07 TWA-MSD           PIC X(08).                               
                  07 TWA-CONTROL-NBR   PIC X(14).                       02030002
                  07 TWA-ORIG-RCV-NBR  PIC X(04).                               
                  07 TWA-ORIG-RCV-ACCT PIC X(20).                               
                  07 TWA-TRNFR-TYPE-CD PIC X(03).                               
                  07 TWA-STTS-CD       PIC X(03).                               
                  07 TWA-M1CMNT-X120.                                           
                     09 TWA-M1CMNT     PIC X(60).                               
                     09 TWA-M1CMNT2    PIC X(60).                               
                  07 TWA-M2CMNT-X120.                                           
                     09 TWA-M2CMNT     PIC X(60).                               
                     09 TWA-M2CMNT2    PIC X(60).                               
                  07 TWA-M5CMNT-X120.                                           
                     09 TWA-M5CMNT     PIC X(60).                               
                     09 TWA-M5CMNT2    PIC X(60).                               
                  07 TWA-MMCMNT-X120.                                           
                     09 TWA-MMCMNT     PIC X(60).                               
                     09 TWA-MMCMNT2    PIC X(60).                               
                  07 TWA-UPDT-TMSTP    PIC X(26).                               
LRM007            07 TWA-DUPE-FOUND    PIC X.                                   
LRM007            07 TWA-CNTL-ASTD-NBR PIC X(14).                               
                  07 TWA-OCC-BRKR      PIC X(05).                               
                  07 TWA-STTLM-DT      PIC X(08).                       02030002
                  07 TWA-DB2-STTLM-DT  PIC X(10).                       02030002
                  07 TWA-ORIG-MACAT    PIC X(14).                               
LRM001            07 TWA-VALUE-FREE    PIC X.                                   
                  07 TWA-ASSET-AREA.                                            
                     09 TWA-MSECR      PIC X(12).                               
                     09 TWA-ORIG-MSECR PIC X(12).                               
                     09 TWA-MCD        PIC X(01).                               
                     09 TWA-MCATGR     PIC X(04).                               
                     09 TWA-MSLOC      PIC X(02).                               
                     09 TWA-MTYPE      PIC X(01).                               
                     09 TWA-ORIG-MTYPE PIC X(01).                               
                     09 TWA-KEY-FIELDS.                                         
                        11  TWA-ISIN-CNTRY-CD     PIC X(02).                    
                        11  TWA-ISIN-SEC-ISSUE-CD PIC X(09).                    
                        11  TWA-ISIN-SEC-CDG-CD   PIC X.                        
                     09 TWA-FUND-ACCOUNT-NBR PIC X(20).                         
ET0001               09 TWA-RE-REGIST-DATE   PIC X(08).                         
LRM002               09 TWA-CAGE-TAG         PIC X(11).                         
                     09 TWA-ADP-NBR    PIC X(07).                               
                     09 TWA-MDESC-GROUP.                                        
                        11 TWA-MDESC   PIC X(30).                               
                        11 TWA-MDESC2  PIC X(30).                               
                        11 TWA-MDESC3  PIC X(30).                               
                     09 TWA-MQTY        PIC X(22).                              
                     09 TWA-ORIG-MQTY   PIC X(22).                              
                     09 TWA-MQTY-9     USAGE COMP-2.                            
                     09 TWA-MAMT        PIC X(22).                              
                     09 TWA-ORIG-MAMT   PIC X(22).                              
                     09 TWA-MAMT-9     USAGE COMP-2.                            
                     09 TWA-BOND-REG-CODE  PIC X.                               
                  07 TWA-MSCMNT-X120.                                           
                     09 TWA-MSCMNT     PIC X(60).                               
                     09 TWA-MSCMNT2    PIC X(60).                               
                                                                                
              05 TWA-SUBMIT-APPROVAL   PIC X  VALUE 'N'.                        
                 88 TWA-APPROVAL-AUTH         VALUE 'A'.                        
                 88 TWA-APPROVAL-NO-AUTH      VALUE 'N'.                        
              05 TWA-ACTIVE-DB         PIC X.                                   
              05 TWA-SECR-ACTION       PIC X.                                   
              05 TWA-INP-TFR-TYP       PIC X(03).                               
              05 TWA-CALLING-PROG      PIC X(08).                               
              05 TWA-PRIOR-INP-SEL     PIC X.                                   
              05 TWA-PAGE-AREA.                                         02000002
                  07 TWA-PAGE-NO       PIC S9(08) COMP.                 02030002
                  07 TWA-PAGE-MODE     PIC X.                           02030002
                     88 TWA-ASSET-LVL-PG  VALUE 'A'.                            
                  07 TWA-CURRENT-ASSET-KEY.                             02030002
                     09 TWA-ORIG-SECR     PIC X(09).                            
                     09 TWA-ORIG-SLOC     PIC X(02).                            
                     09 TWA-ORIG-TYPE     PIC X(01).                            
                     09 TWA-ASSET-SEQ     PIC S9(4) COMP.                       
00427      EJECT                                                        MRGIPS05
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
              MOVE LOW-VALUE TO ACAT33MO                                        
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
026900     MOVE LOW-VALUE     TO ACAT33MO.                              02460002
     ***   MOVE ATT-UNPROT TO NEXTA                                     02480002
027100     PERFORM GET-DATE-AND-TIME-RTN.                               02530002
027200     MOVE DFHCOMMAREA          TO ACATCOMM-COMMAREA.              02540002
           PERFORM SET-TRANSACTION-SECURITY-RTN.                                
NEW ET     IF ACAT-CALLING-PROG-NAME = 'ACAT21PT'                               
           AND ACAT-INP-SEL NOT = 'Z'                                           
LRM008        MOVE 'Y' TO TWA-ACTIVE-DB                                         
              MOVE '6' TO TWA-ACTION                                            
              MOVE ACAT-CALLING-PROG-NAME TO TWA-CALLING-PROG                   
              MOVE ACAT-INP-SEL TO TWA-PRIOR-INP-SEL                            
           ELSE                                                                 
           IF ACAT-CALLING-PROG-NAME = 'ACAT25PD'                               
           AND ACAT-INP-SEL NOT = 'Z'                                           
LRM008        MOVE 'Y' TO TWA-ACTIVE-DB                                         
              MOVE '7' TO TWA-ACTION                                            
              MOVE 'ACAT22TH'             TO TWA-CALLING-PROG                   
              MOVE ACAT-INP-SEL TO TWA-PRIOR-INP-SEL                            
           ELSE                                                                 
              MOVE SPACES                 TO TWA-CALLING-PROG                   
           END-IF.                                                              
           IF  ACAT-PROGRAM-NAME = 'ACAT33FC'                           02550002
               MOVE SPACES TO ACAT-CALLING-PROG-NAME                            
028100         PERFORM CONTINUE-PROCESS                                 02560002
028000     ELSE                                                         02570002
           IF  ACAT-PROGRAM-NAME = 'RATT01  '                           02550002
               MOVE 'ACAT33FC' TO ACAT-PROGRAM-NAME                             
032500         PERFORM READ-TSQ-RTN                                     03810002
032600         PERFORM DELETE-TSQ-RTN                                   03820002
               SET FIRST-TIME TO TRUE                                   02810002
               PERFORM REFORMAT-SCREEN-DETAIL                                   
               MOVE TWA-INP-TFR-TYP     TO MMTFRO                               
               PERFORM REFORMAT-SCREEN-ASSET                                    
               PERFORM PROCESS-MAP-ITEMS THRU PROCESS-MAP-ITEMS-EXIT            
               IF TWA-ACTION = 'B' OR 'R'                                       
               OR NOT ACAT-SIGN-ON-UPDATE                                       
                  PERFORM ASKIP-MAP-RTN                                         
                  MOVE ATT-UNPROT TO  MACATA                                    
                  MOVE -1         TO  MACATL                                    
               END-IF                                                           
               PERFORM SEND-MAP-ERASE                                           
               PERFORM WRITE-TSQ-RTN                                        1079
               PERFORM RETURN-TO-CICS                                       0835
028000     ELSE                                                         02570002
LRM008         MOVE 'Y' TO TWA-ACTIVE-DB                                        
               MOVE 'ACAT33FC' TO ACAT-PROGRAM-NAME                             
027900         PERFORM FIRST-TIME-RTN                                   02580002
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
031000 FIRST-TIME-RTN.                                                  02790002
           IF EIBAID = DFHPF10                                                  
           AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                              
              PERFORM READ-TSQ-RTN                                      03810002
              PERFORM DELETE-TSQ-RTN                                    03820002
              PERFORM READ-ACAT90CM-TS-RTN                              10350002
              MOVE 'DISPLAY REFRESHED' TO SYSTEM-MSG                            
           ELSE                                                                 
           IF EIBAID NOT = DFHPF5                                               
              MOVE SPACES              TO TWA-MAP-TABLE                    02000
              MOVE ZEROS TO TWA-MQTY-9                                          
                            TWA-MAMT-9                                          
              MOVE ACAT-INP-BRANCH     TO TWA-MBR  MMBRO                        
              MOVE ACAT-INP-ACCOUNT    TO TWA-MAC  MMACO                        
              MOVE ACAT-INP-RR         TO TWA-MMRR MMRRO                        
              MOVE ACAT-INP-CONTRA-BKR TO TWA-MCBRKR  MMBKRO                    
              IF TWA-INP-TFR-TYP NOT = 'MFC'                                    
                 MOVE 'MFC' TO TWA-INP-TFR-TYP                                  
              END-IF                                                            
              MOVE TWA-INP-TFR-TYP     TO MMTFRO                                
           END-IF.                                                              
           MOVE SPACES TO TWA-MCMNT MCMNTO.                                     
*********  MOVE SPACES TO TWA-MACMNT MACMNTO.                                   
           SET FIRST-TIME TO TRUE.                                      02810002
           MOVE ZERO TO TWA-PAGE-NO.                                            
           MOVE 'Z' TO ACAT-NEXT                                                
           PERFORM DELETE-TSQ-RTN.                                      02800002
           IF EIBAID = DFHPF10                                                  
           AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                              
              CONTINUE                                                          
           ELSE                                                                 
           IF EIBAID = DFHPF5 OR DFHPF2                                         
              CONTINUE                                                          
           ELSE                                                                 
           IF TWA-ACTION = '7'                                                  
              PERFORM FORMAT-FROM-HISTORY-RTN                                   
           ELSE                                                                 
XXX        IF ACAT-CALLING-PROG-NAME = 'ACAT21PT'                               
           AND ACAT-CONTROL-NBR > SPACES                                        
LRM008        MOVE 'Y' TO TWA-ACTIVE-DB                                         
              MOVE ACAT-CONTROL-NBR TO TWA-CONTROL-NBR                          
              PERFORM READ-ACTIVE-MFC-RTN                                       
              IF ACAT33IO-FOUND                                                 
              OR ACAT33IO-ASSET-FOUND                                           
                 MOVE '6' TO TWA-ACTION                                         
                 PERFORM MOVE-ACAT33IO-TO-TWA-RTN                               
                 PERFORM REFORMAT-SCREEN-DETAIL                                 
                 PERFORM MOVE-ACAT33IO-ASSET-TO-TWA                             
                 PERFORM REFORMAT-SCREEN-ASSET                                  
                 PERFORM ASKIP-MAP-RTN                                          
                 MOVE 'B' TO TWA-ACTION                                         
                 MOVE ATT-UNPROT TO  MACATA                                     
                 MOVE -1         TO  MACATL                                     
                 MOVE 'ACTIVE MFC DISPLAYED; BROWSE ONLY'                       
                    TO SYSTEM-MSG                                               
              ELSE                                                              
                 MOVE 'ACTIVE TIF NOT FOUND' TO SYSTEM-MSG                      
              END-IF                                                            
              MOVE SPACES TO ACAT-CALLING-PROG-NAME                             
              PERFORM SEND-MAP-ERASE                                            
              PERFORM WRITE-TSQ-RTN                                     10790002
              PERFORM RETURN-TO-CICS                                    08350002
           ELSE                                                                 
              MOVE SPACES TO TWA-CONTROL-NBR                                    
              MOVE ZERO   TO TWA-ASSET-SEQ                                      
              PERFORM PAGE-FORWARD-TIF                                          
           END-IF.                                                              
           PERFORM REFORMAT-SCREEN-DETAIL.                                      
           PERFORM REFORMAT-SCREEN-ASSET.                                       
           PERFORM PROCESS-MAP-ITEMS THRU PROCESS-MAP-ITEMS-EXIT.               
                                                                                
   ***** CAUSE UPDATE UPON RETURN FROM POP-UP IF NO ERRORS FOUND.               
           IF ACAT-SIGN-ON-UPDATE                                               
           AND NOT INPUT-ERROR                                                  
           AND ACAT-CALLING-PROG-NAME = 'ACAT90CM'                              
               PERFORM UPDATE-ACAT-IT-RTN.                                      
                                                                                
           IF NOT ACAT-SIGN-ON-UPDATE                                           
           AND EIBAID = DFHPF2                                                  
              MOVE 'USER DOES NOT HAVE CREATE AUTHORITY; PF2 IGNORED'           
                 TO SYSTEM-MSG.                                                 
                                                                                
           MOVE SPACES TO ACAT-CALLING-PROG-NAME                                
           PERFORM SEND-MAP-ERASE.                                              
           PERFORM WRITE-TSQ-RTN.                                       10790002
           PERFORM RETURN-TO-CICS.                                      08350002
       EJECT                                                            02860002
       SET-TRANSACTION-SECURITY-RTN.                                            
     *** ASSUME SUPER SIGNON(UPDATE) CAN DO EVERYTING.                          
     ***  SCON ACAXJA HAS APPROVAL AUTHORITY TO SUBMIT MFC.                     
     ***  SCON ACAXJ MAY CREATE, DELETE OR UPDATE BUT NOT SUBMIT.               
     ***  SUBMIT MEANS CHANGE SUBMIT IND TO 'Y'; ELIGABLE TO GO TO NSCC.        
           SET TWA-APPROVAL-NO-AUTH TO TRUE.                                    
           IF ACAT-SUPER-SIGN-ON-UPDATE                                         
              SET ACAT-SIGN-ON-UPDATE TO TRUE                                   
              SET TWA-APPROVAL-AUTH TO TRUE                                     
           ELSE                                                                 
               MOVE 'ZU'         TO ACAT-SCREEN-IND                             
               SET ACAT-UPDATE-MODE TO TRUE                                     
               MOVE SPACES    TO SECLINK-LIST                           AEISAC07
               MOVE '2'       TO SECLINK-ACTION-CODE                    AEISAC07
               MOVE 'SCON'    TO SECLINK-TYPE                                   
               MOVE ACAT-SEC-LIT TO SECLINK-ITEM                                
               PERFORM CALL-SECLINK-RTN                                 AEISAC07
               IF SECLINK-RETURN-CODE = '00' OR '20'                    AEISAC07
                  SET ACAT-SIGN-ON-UPDATE TO TRUE                               
               ELSE                                                             
                  SET ACAT-SIGN-ON-BROWSE TO TRUE                               
               END-IF                                                           
                                                                                
               MOVE 'ZA'         TO ACAT-SCREEN-IND                             
               SET ACAT-UPDATE-MODE TO TRUE                                     
               MOVE SPACES    TO SECLINK-LIST                           AEISAC07
               MOVE '2'       TO SECLINK-ACTION-CODE                    AEISAC07
               MOVE 'SCON'    TO SECLINK-TYPE                                   
               MOVE ACAT-SEC-LIT TO SECLINK-ITEM                                
               PERFORM CALL-SECLINK-RTN                                 AEISAC07
               IF SECLINK-RETURN-CODE = '00' OR '20'                    AEISAC07
                  SET ACAT-SIGN-ON-UPDATE TO TRUE                               
                  SET TWA-APPROVAL-AUTH TO TRUE                                 
           END-IF.                                                              
       EJECT                                                            02860002
                                                                        03690002
       READ-B1-RTN.                                                     03700002
           MOVE +22 TO WS-B1PRINT-LENGTH.                                       
           EXEC CICS READ                                                       
                     DATASET('B1PRINT')                                         
                     INTO(B1-RECORD)                                            
                     RIDFLD(B1-REC-ID)                                          
                     LENGTH(WS-B1PRINT-LENGTH)                                  
           END-EXEC.                                                    03760002
       READ-B1-RTN-LONG.                                                03700002
           EXEC CICS READ                                               03710002
                     DATASET('B1PRINT')                                 03720002
                     INTO(B1-RECORD)                                    03730002
                     RIDFLD(B1-REC-ID)                                  03740002
                     LENGTH(LENGTH OF B1-RECORD)                        03750002
           END-EXEC.                                                    03760002
       EJECT                                                            03780002
                                                                        03790002
   400 CONTINUE-PROCESS.                                                03800009
032500     PERFORM READ-TSQ-RTN.                                        03810002
032600     PERFORM DELETE-TSQ-RTN.                                      03820002
032700     SET DATA-ONLY TO TRUE.                                       03830002
033000     EVALUATE TRUE                                                03840002
033100          WHEN EIBAID = DFHPF11 OR DFHCLEAR                       03850002
033200               PERFORM RETURN-CONTROL-RTN                         03860002
033300          WHEN EIBAID = DFHENTER OR DFHPF9                        03870002
033400               PERFORM ENTER-KEY-RTN                              03880002
                WHEN EIBAID = DFHPF1                                            
                     PERFORM SEND-POPUP-MAP-RTN                                 
                WHEN EIBAID = DFHPF2                                            
LRM008               MOVE 'I' TO TWA-ACTIVE-DB                                  
LRM007               IF TWA-DUPE-FOUND = 'Y'                                    
LRM007                  MOVE 'A' TO TWA-ACTION TWA-SECR-ACTION                  
LRM007                  MOVE SPACES TO TWA-ASSET-AREA                   02790002
LRM007                  MOVE ZEROS  TO TWA-MQTY-9                               
LRM007                              TWA-MAMT-9                                  
LRM007                  MOVE DFHPF6 TO EIBAID                                   
LRM007                  PERFORM CREATE-MFC-FROM-HST-RTN                 02790002
LRM007               END-IF                                                     
                     MOVE 'A' TO TWA-ACTION TWA-SECR-ACTION                     
                     MOVE SPACES TO TWA-MAP-TABLE                       02790002
LRM001                              TWA-INTRAN-FLAG                     01940002
                     MOVE 'MFC' TO TWA-INP-TFR-TYP                              
                     PERFORM FIRST-TIME-RTN                             02790002
                WHEN EIBAID = DFHPF5                                            
                     MOVE 'A' TO TWA-SECR-ACTION                                
                     MOVE SPACES TO TWA-ASSET-AREA                      02790002
                     MOVE ZEROS  TO TWA-MQTY-9                                  
                                    TWA-MAMT-9                                  
                     PERFORM FIRST-TIME-RTN                             02790002
                WHEN EIBAID = DFHPF6                                    03910002
                     PERFORM CREATE-MFC-FROM-HST-RTN                            
033700          WHEN EIBAID = DFHPF7                                    03910002
033800               PERFORM PAGE-BACKWARD-TIF                          03920002
033500          WHEN EIBAID = DFHPF8                                    03890002
033600               PERFORM PAGE-FORWARD-TIF                           03900002
033500          WHEN EIBAID = DFHPA1                                    03890002
033600               PERFORM PAGE-FORWARD-RTN                           03900002
                        THRU PAGE-FORWARD-RTN-EXIT                              
033700          WHEN EIBAID = DFHPA2                                    03910002
033800               PERFORM PAGE-BACKWARD-RTN                          03920002
033900          WHEN OTHER                                              03930002
                     MOVE LOW-VALUE TO ACAT33MO                         03940002
                     MOVE -1 TO MNEXTL                                          
034000               MOVE 'ERROR FUNCTION KEY'                          03950002
034100                 TO SYSTEM-MSG                                    03960002
034200               PERFORM ERROR-RTN                                  03970002
034300     END-EVALUATE.                                                03980002
034400                                                                  03990002
DD6700     EJECT                                                        04240002
036800                                                                  04250002
037500 RECEIVE-MAP-RTN.                                                 04320002
037600     EXEC CICS RECEIVE MAP('TRLMAP')                                      
037700                       MAPSET('ACAT00M')                          04340002
                             FROM(ACAT-RECEIVE-MAP)                     04350002
037800                       LENGTH(ACAT-RECEIVE-MAP-LENGTH)            04360002
037900     END-EXEC.                                                    04370002
           MOVE +1000 TO ACAT-RECEIVE-MAP-LENGTH.                               
037600     EXEC CICS RECEIVE MAP('ACAT33M')                                     
037700                       MAPSET('ACAT33M')                          04340002
                             FROM(ACAT-RECEIVE-MAP)                     04350002
037800                       LENGTH(ACAT-RECEIVE-MAP-LENGTH)            04360002
037900     END-EXEC.                                                    04370002
038000                                                                  04380002
038100     EJECT                                                        04390002
038200                                                                  04400002
038300 ENTER-KEY-RTN.                                                   04410002
038400     PERFORM RECEIVE-MAP-RTN.                                     04420002
038700     PERFORM EDIT-INPUT-BRW-RTN.                                  04440010
*******    IF ACAT-SIGN-ON-UPDATE                                               
038600        PERFORM MERGE-MAP-DTL-RTN.                                04430002
038600     PERFORM MERGE-MAP-NEXT-RTN.                                  04430002
039300     IF TWA-MNEXT GREATER SPACES AND NOT = 'Z'                    04470002
              MOVE TWA-MNEXT TO ACAT-INP-SEL                                    
039300        PERFORM PROCESS-JUMP-RTN.                                 04470002
           IF TWA-MCMNT GREATER ' '                                             
              MOVE 'A' TO TWA-SCREEN                                            
              PERFORM SEND-POPUP-MAP-RTN.                                       
           IF TWA-MCTYPE(1 : 1) = '?'                                           
           OR EIBAID = DFHPF9                                                   
              MOVE 'T' TO TWA-SCREEN                                            
              PERFORM SEND-POPUP-MAP-RTN.                                       
*********  IF TWA-MACMNT GREATER ' '                                            
*********     MOVE 'S' TO TWA-SCREEN                                            
*********     PERFORM SEND-POPUP-MAP-RTN.                                       
           IF ACAT-SIGN-ON-UPDATE                                               
065800        MOVE 'N' TO INPUT-ERROR-FLAG                                      
              PERFORM PROCESS-MAP-ITEMS THRU PROCESS-MAP-ITEMS-EXIT             
              IF INPUT-ERROR                                                    
              OR TWA-INTRAN-BRW                                         01950002
              OR FIRST-TIME                                                     
                 MOVE SPACES TO TWA-INTRAN-FLAG                         01940002
                 PERFORM ERROR-RTN                                              
              ELSE                                                              
                PERFORM UPDATE-ACAT-IT-RTN                                      
                PERFORM ERROR-RTN.                                              
                                                                                
           PERFORM ERROR-RTN.                                                   
040200                                                                  04560002
040300 EJECT                                                            04570002
040300 PROCESS-JUMP-RTN.                                                04570002
           MOVE 'ACAT33FC' TO ACAT-CALLING-PROG-NAME.                           
           MOVE ACAT-INP-SEL   TO WS-ACAT-NEXT.                                 
           MOVE 'Z'            TO ACAT-NEXT ACAT-INP-SEL.                       
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
       EJECT                                                            04770210
                                                                        04770310
   100 EDIT-INPUT-BRW-RTN.                                              04800010
      *    MOVE TWA-INTRAN-FLAG TO SAVE-INTRAN-FLAG.                    04812002
           IF MMRRL > 0                                                 04809210
              MOVE MMRRI TO    ACAT-INP-RR                                      
           ELSE                                                         04809510
           IF MMRRA = ERASE-KEY                                         04809610
                 MOVE SPACES TO ACAT-INP-RR                             04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MMTFRL > 0                                                04809210
              MOVE MMTFRI TO   TWA-INP-TFR-TYP                                  
           ELSE                                                         04809510
           IF MMTFRA = ERASE-KEY                                        04809610
                 MOVE SPACES TO TWA-INP-TFR-TYP                         04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MMRDL > 0                                                 04809210
              MOVE MMRDI TO    ACAT-INP-RCV-DEL                                 
           ELSE                                                         04809510
           IF MMRDA = ERASE-KEY                                         04809610
                 MOVE SPACES TO ACAT-INP-RCV-DEL                        04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MMBKRL > 0                                                04809210
              MOVE MMBKRI TO   ACAT-INP-CONTRA-BKR                              
           ELSE                                                         04809510
           IF MMBKRA = ERASE-KEY                                        04809610
                 MOVE SPACES TO ACAT-INP-CONTRA-BKR                     04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MMSTATL > 0                                               04809210
              MOVE MMSTATI TO  ACAT-INP-STATUS                                  
           ELSE                                                         04809510
           IF MMSTATA = ERASE-KEY                                       04809610
                 MOVE SPACES TO ACAT-INP-STATUS                         04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MMSDL > 0                                                 04809210
              MOVE MMSDI TO    ACAT-INP-STTL-DT                                 
           ELSE                                                         04809510
           IF MMSDA = ERASE-KEY                                         04809610
                 MOVE SPACES TO ACAT-INP-STTL-DT                        04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MBRL > 0                                                  04809210
              IF MBRI = TWA-MBR                                                 
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MBRI TO TWA-MBR                                           
                 SET TWA-INTRAN-BRW TO TRUE                             04809410
              END-IF                                                            
           ELSE                                                         04809510
           IF MBRA = ERASE-KEY                                          04809610
                 MOVE SPACES TO TWA-MBR                                 04809710
                 SET TWA-INTRAN-BRW TO TRUE                             04809810
           END-IF END-IF.                                               04809910
                                                                                
           IF MACL > 0                                                  04809210
              IF MACI = TWA-MAC                                                 
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MACI TO TWA-MAC                                           
                 SET TWA-INTRAN-BRW TO TRUE                             04809410
              END-IF                                                            
           ELSE                                                         04809510
           IF MACA = ERASE-KEY                                          04809610
                 MOVE SPACES TO TWA-MAC                                 04809710
                 SET TWA-INTRAN-BRW TO TRUE                             04809810
           END-IF END-IF.                                               04809910
                                                                                
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
              IF MMTFRI = TWA-INP-TFR-TYP                                       
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MMTFRI TO TWA-INP-TFR-TYP                                 
                 SET TWA-INTRAN-BRW TO TRUE                             04809410
              END-IF                                                            
           ELSE                                                         04809510
           IF MMTFRA = ERASE-KEY                                        04809610
                 MOVE SPACES TO TWA-INP-TFR-TYP                         04809710
                 SET TWA-INTRAN-BRW TO TRUE                             04809810
           END-IF END-IF.                                               04809910
                                                                                
           IF MACATL > 0                                                        
              IF MACATI = TWA-MACAT                                     02030002
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MACATL TO TWA-MACAT                               02030002
           ELSE                                                                 
           IF MACATA = ERASE-KEY                                        04809610
              MOVE SPACES TO TWA-MACAT                                  02030002
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
                                                                                
           IF MSDL > 0                                                  04809210
              MOVE MSDI TO TWA-STTLM-DT                                         
           ELSE                                                         04809510
           IF MSDA = ERASE-KEY                                          04809610
              MOVE SPACES TO TWA-STTLM-DT                               04809710
           END-IF END-IF.                                               04809910
                                                                                
                                                                                
062900 MERGE-MAP-DTL-RTN.                                               06100002
           IF MCBRKRL > 0                                               04809210
              IF MCBRKRI = TWA-MCBRKR                                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MCBRKRI TO TWA-MCBRKR                                     
           ELSE                                                         04809510
           IF MCBRKRA = ERASE-KEY                                       04809610
                 MOVE SPACES TO TWA-MCBRKR                              04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MCACCTL > 0                                               04809210
              IF MCACCTI = TWA-MCACCT                                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE MCACCTI(1 : MCACCTL) TO TWA-MCACCT                        
           ELSE                                                         04809510
           IF MCACCTA = ERASE-KEY                                       04809610
                 MOVE SPACES TO TWA-MCACCT                              04809710
           END-IF END-IF.                                               04809910
                                                                                
           PERFORM                                                              
               VARYING SUB2 FROM 1 BY 1                                         
                  UNTIL SUB2 > 20                                               
              IF TWA-MCACCT(SUB2 : 1) < SPACES                                  
                 MOVE SPACES TO TWA-MCACCT(SUB2 : 1)                            
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           IF MCTYPEL > 0                                               04809210
              MOVE MCTYPEI TO TWA-MCTYPE                                        
           ELSE                                                         04809510
           IF MCTYPEA = ERASE-KEY                                       04809610
                 MOVE SPACES TO TWA-MCTYPE                              04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MCBNAML > 0                                               04809210
              MOVE MCBNAMI TO TWA-MCBNAM                                        
           ELSE                                                         04809510
           IF MCBNAMA = ERASE-KEY                                       04809610
                 MOVE SPACES TO TWA-MCBNAM                              04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MNAMEL > 0                                                04809210
              MOVE MNAMEI(1 : MNAMEL) TO TWA-MNAME                              
           ELSE                                                         04809510
           IF MNAMEA = ERASE-KEY                                        04809610
                 MOVE SPACES TO TWA-MNAME                               04809710
           END-IF END-IF.                                               04809910
           IF MNAME2L > 0                                               04809210
              MOVE MNAME2I(1 : MNAME2L) TO TWA-MNAME2                           
           ELSE                                                         04809510
           IF MNAME2A = ERASE-KEY                                       04809610
                 MOVE SPACES TO TWA-MNAME2                              04809710
           END-IF END-IF.                                               04809910
                                                                                
LRM012     PERFORM                                                              
LRM012         VARYING SUB2 FROM 1 BY 1                                         
LRM012            UNTIL SUB2 > 30                                               
LRM012        IF TWA-MNAME(SUB2 : 1) < SPACES                                   
LRM012           MOVE SPACES TO TWA-MNAME(SUB2 : 1)                             
LRM012        END-IF                                                            
LRM012        IF TWA-MNAME2(SUB2 : 1) < SPACES                                  
LRM012           MOVE SPACES TO TWA-MNAME2(SUB2 : 1)                            
LRM012        END-IF                                                            
LRM012     END-PERFORM.                                                         
                                                                                
           IF MSSNL > 0                                                 04809210
              MOVE MSSNI(1 : MSSNL) TO TWA-MSSN                                 
           ELSE                                                         04809510
           IF MSSNA = ERASE-KEY                                         04809610
                 MOVE SPACES TO TWA-MSSN                                04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MSSN2L > 0                                                04809210
              MOVE MSSN2I(1 : MSSN2L) TO TWA-MSSN2                              
           ELSE                                                         04809510
           IF MSSN2A = ERASE-KEY                                        04809610
                 MOVE SPACES TO TWA-MSSN2                               04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MACATL > 0                                                04809210
              IF MACATI NOT = TWA-MACAT                                         
XXX              MOVE MACATI TO TWA-MACAT                                       
                 IF TWA-INP-TFR-TYP = 'MFC'                                     
                 AND TWA-ACTION NOT = 'A'                                       
                    PERFORM PAGE-FORWARD-RTN                                    
                       THRU PAGE-FORWARD-RTN-EXIT                               
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                         04809510
           IF MACATA = ERASE-KEY                                        04809610
              IF TWA-MACAT NOT = SPACES                                 04809710
                 MOVE SPACES TO TWA-MACAT                               04809710
                 IF TWA-INP-TFR-TYP = 'MFC'                                     
                 AND TWA-ACTION NOT = 'A'                                       
                    PERFORM PAGE-FORWARD-RTN                                    
                       THRU PAGE-FORWARD-RTN-EXIT                               
                 END-IF                                                         
           END-IF END-IF.                                               04809910
                                                                                
           IF MSTATL > 0                                                04809210
              MOVE MSTATI TO TWA-MSTAT                                          
           ELSE                                                         04809510
           IF MSTATA = ERASE-KEY                                        04809610
                 MOVE SPACES TO TWA-MSTAT                               04809710
           END-IF END-IF.                                               04809910
                                                                                
     ****** ASSET SECTION                                                       
           IF MSECRL > 0                                                04809210
              MOVE MSECRI(1 : MSECRL) TO TWA-MSECR                              
           ELSE                                                         04809510
           IF MSECRA = ERASE-KEY                                        04809610
                 MOVE SPACES TO TWA-MSECR                               04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MSLOCL > 0                                                04809210
              MOVE MSLOCI TO TWA-MSLOC                                          
           ELSE                                                         04809510
           IF MSLOCA = ERASE-KEY                                        04809610
                 MOVE SPACES TO TWA-MSLOC                               04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MCATGRL > 0                                               04809210
              MOVE MCATGRI TO TWA-MCATGR                                        
           ELSE                                                         04809510
           IF MCATGRA = ERASE-KEY                                       04809610
                 MOVE SPACES TO TWA-MCATGR                              04809710
           END-IF END-IF.                                               04809910
                                                                                
*********  IF MACMNTL > 0                                               04809210
*********     MOVE MACMNTI TO TWA-MACMNT                                        
*********  ELSE                                                         04809510
*********  IF MACMNTA = ERASE-KEY                                       04809610
*********        MOVE SPACES TO TWA-MACMNT                              04809710
*********  END-IF END-IF.                                               04809910
                                                                                
           IF MCDL > 0                                                  04809210
              MOVE MCDI TO TWA-MCD                                              
           ELSE                                                         04809510
           IF MCDA = ERASE-KEY                                          04809610
                 MOVE SPACES TO TWA-MCD                                 04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MQTYL > 0                                                 04809210
              MOVE MQTYI TO TWA-MQTY                                            
           ELSE                                                         04809510
           IF MQTYA = ERASE-KEY                                         04809610
                 MOVE SPACES TO TWA-MQTY                                04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MAMTL > 0                                                 04809210
              MOVE MAMTI TO TWA-MAMT                                            
           ELSE                                                         04809510
           IF MAMTA = ERASE-KEY                                         04809610
                 MOVE SPACES TO TWA-MAMT                                04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MDESCL > 0                                                04809210
              MOVE MDESCI(1 : MDESCL) TO TWA-MDESC                              
           ELSE                                                         04809510
           IF MDESCA = ERASE-KEY                                        04809610
                 MOVE SPACES TO TWA-MDESC                               04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MTYPEL > 0                                                04809210
              MOVE MTYPEI TO TWA-MTYPE                                          
           ELSE                                                         04809510
           IF MTYPEA = ERASE-KEY                                        04809610
                 MOVE SPACES TO TWA-MTYPE                               04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MFUNDACL > 0                                              04809210
              MOVE MFUNDACI TO TWA-FUND-ACCOUNT-NBR                             
           ELSE                                                         04809510
           IF MFUNDACA = ERASE-KEY                                      04809210
                 MOVE SPACES TO TWA-FUND-ACCOUNT-NBR                    04809710
           END-IF END-IF.                                               04809910
                                                                                
ET0001     IF MREGDTL > 0                                                       
ET0001        MOVE MREGDTI TO TWA-RE-REGIST-DATE                                
ET0001     ELSE                                                                 
ET0001        IF MREGDTA = ERASE-KEY                                            
ET0001           MOVE SPACE  TO  TWA-RE-REGIST-DATE                             
ET0001        END-IF                                                            
ET0001     END-IF.                                                              
ET0001                                                                          
                                                                                
LRM002     IF CAGETAGL > 0                                                      
LRM002        MOVE CAGETAGI TO TWA-CAGE-TAG                                     
LRM002     ELSE                                                                 
LRM002        IF CAGETAGA = ERASE-KEY                                           
LRM002           MOVE SPACE  TO  TWA-CAGE-TAG                                   
LRM002        END-IF                                                            
LRM002     END-IF.                                                              
LRM002                                                                          
                                                                                
           IF MDESC2L > 0                                               04809210
              MOVE MDESC2I(1 : MDESC2L) TO TWA-MDESC2                           
           ELSE                                                         04809510
           IF MDESC2A = ERASE-KEY                                       04809610
                 MOVE SPACES TO TWA-MDESC2                              04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MDESC3L > 0                                               04809210
              MOVE MDESC3I(1 : MDESC3L) TO TWA-MDESC3                           
           ELSE                                                         04809510
           IF MDESC3A = ERASE-KEY                                       04809610
                 MOVE SPACES TO TWA-MDESC3                              04809710
           END-IF END-IF.                                               04809910
                                                                                
LRM002 READ-CAGE-TAG-INDEX-RTN.                                                 
           MOVE TWA-CLIENT-NO-X TO ACAT-CAGE-TAG-CLIENT-NBR.            00850002
           MOVE TWA-CAGE-TAG    TO ACAT-CAGE-TAG-NBR.                           
           MOVE SPACES          TO ACAT-CAGE-CONTROL-NBR.                       
           MOVE ACAT-CAGE-INDEX-KEY TO WS-ACATCG-KEY.                           
           EXEC CICS READ                                               03710002
                     DATASET('ACATCG')                                  03720002
                     INTO(ACAT-CAGE-TAG-INDEX-REC)                      03730002
                     RIDFLD(ACAT-CAGE-INDEX-KEY)                        03740002
                     RESP(ACATCG-RESPONSE)                                      
                     LENGTH(LENGTH OF ACAT-CAGE-TAG-INDEX-REC)          03750002
                     GTEQ                                                       
           END-EXEC.                                                    03760002
062900 MERGE-MAP-NEXT-RTN.                                              06100002
           IF MNEXTL > 0                                                04809210
              MOVE MNEXTI TO TWA-MNEXT                                          
           ELSE                                                         04809510
           IF MNEXTA = ERASE-KEY                                        04809610
                 MOVE SPACES TO TWA-MNEXT                               04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MSUBML > 0                                                04809210
              MOVE MSUBMI TO TWA-MSUBM                                          
           ELSE                                                         04809510
           IF MSUBMA = ERASE-KEY                                        04809610
                 MOVE SPACES TO TWA-MSUBM                               04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MCMNTL > 0                                                04809210
              MOVE MCMNTI TO TWA-MCMNT                                          
           ELSE                                                         04809510
           IF MCMNTA = ERASE-KEY                                        04809610
                 MOVE SPACES TO TWA-MCMNT                               04809710
           END-IF END-IF.                                               04809910
                                                                                
           IF MDELL > 0                                                 04809210
              MOVE MDELI TO TWA-MDEL                                            
           ELSE                                                         04809510
           IF MDELA = ERASE-KEY                                         04809610
                 MOVE SPACES TO TWA-MDEL                                04809710
           END-IF END-IF.                                               04809910
                                                                                
       EJECT                                                                    
       MOVE-ACAT33IO-TO-TWA-RTN.                                                
           MOVE ACAT33IO-ACTIVE-DB TO TWA-ACTIVE-DB.                            
           MOVE ACAT33IO-RCV-NBR    TO TWA-MCBRKR                               
LRM009                                 TWA-ORIG-RCV-NBR                         
           MOVE ACAT33IO-RCV-ACCT   TO TWA-MCACCT                               
LRM009                                 TWA-ORIG-RCV-ACCT                        
           MOVE ACAT33IO-DLVR-ACCT  TO TWA-MBR                                  
                                       ACAT-BR.                         02030002
           MOVE ACAT33IO-DLVR-ACCT(4 : 5) TO TWA-MAC                            
                                             ACAT-AC.                           
           MOVE ACAT33IO-RR-CD            TO TWA-MRR.                           
           MOVE ACAT33IO-CMNT-TXT TO TWA-MCCMNT-X120.                           
           MOVE ACAT33IO-ASSET-CMNT1-TXT TO TWA-M1CMNT-X120.                    
           MOVE ACAT33IO-ASSET-CMNT2-TXT TO TWA-M2CMNT-X120.                    
           MOVE ACAT33IO-ASSET-CMNT5-TXT TO TWA-M5CMNT-X120.                    
           MOVE ACAT33IO-ASSET-CMNTM-TXT TO TWA-MMCMNT-X120.                    
           MOVE ACAT33IO-RCV-ACCT-TYPE-CD TO TWA-MCTYPE.                02030002
           MOVE ACAT33IO-RCV-CUST-NM            TO TWA-MNAME.           02030002
           MOVE ACAT33IO-RCV-CUST-NM(31 : 30)   TO TWA-MNAME2.          02030002
           MOVE ACAT33IO-RCV-SS-PRIM-NBR(1 : 3) TO TWA-MSSN.            02030002
           MOVE ACAT33IO-RCV-SS-PRIM-NBR(4 : 2) TO TWA-MSSN(5 : 2).     02030002
           MOVE ACAT33IO-RCV-SS-PRIM-NBR(6 : 4) TO TWA-MSSN(8 : 4).     02030002
           MOVE '-'                             TO TWA-MSSN(4 : 1)      02030002
                                                   TWA-MSSN(7 : 1).     02030002
           IF ACAT33IO-RCV-SS-SCNDY-NBR NOT GREATER SPACES                      
              MOVE SPACES TO TWA-MSSN2                                          
           ELSE                                                                 
              MOVE ACAT33IO-RCV-SS-SCNDY-NBR(1 : 3) TO TWA-MSSN2                
              MOVE ACAT33IO-RCV-SS-SCNDY-NBR(4 : 2) TO TWA-MSSN2(5 : 2)         
              MOVE ACAT33IO-RCV-SS-SCNDY-NBR(6 : 4) TO TWA-MSSN2(8 : 4)         
              MOVE '-'                              TO TWA-MSSN2(4 : 1) 02030002
                                                       TWA-MSSN2(7 : 1) 02030002
           END-IF.                                                              
           MOVE ACAT33IO-TRNFR-TYPE-CD TO TWA-TRNFR-TYPE-CD  MMTFRO             
                                          TWA-INP-TFR-TYP.                      
           IF TWA-INP-TFR-TYP = 'MFC'                                           
           AND (ACAT33IO-NSCC-SUBMIT-ELIGABLE                                   
           OR ACAT33IO-NSCC-SUBMITTED)                                          
               MOVE 'Y'   TO TWA-MSUBM                                  02030002
           ELSE                                                                 
              MOVE SPACES TO TWA-MSUBM.                                         
LRM008     IF TWA-ACTIVE-DB NOT = 'I'                                           
           OR ACAT33IO-NSCC-SUBMITTED                                           
           OR NOT ACAT-SIGN-ON-UPDATE                                           
               MOVE 'B' TO TWA-ACTION                                           
           ELSE                                                                 
               MOVE 'C' TO TWA-ACTION.                                          
                                                                                
LRM007     MOVE ACAT33IO-CONTROL-NBR TO TWA-CONTROL-NBR TWA-MACAT.              
LRM007     MOVE ACAT33IO-CNTL-ASTD-NBR TO TWA-CNTL-ASTD-NBR.                    
           MOVE ACAT33IO-STTS-CD       TO TWA-STTS-CD.                          
           IF ACAT33IO-STTLM-DT > SPACES                                        
           AND ACAT33IO-STTLM-DT NOT = '0001-01-01'                             
              MOVE ACAT33IO-STTLM-DT      TO TWA-DB2-STTLM-DT                   
              MOVE ACAT33IO-STTLM-DT(6:2) TO TWA-STTLM-DT(1:2)                  
              MOVE ACAT33IO-STTLM-DT(9:2) TO TWA-STTLM-DT(4:2)                  
              MOVE ACAT33IO-STTLM-DT(3:2) TO TWA-STTLM-DT(7:2)                  
              MOVE '/'                    TO TWA-STTLM-DT(3:1)                  
                                             TWA-STTLM-DT(6:1)                  
           ELSE                                                                 
              MOVE SPACES TO                 TWA-STTLM-DT                       
           END-IF.                                                              
                                                                                
LRM001     MOVE ACAT33IO-VALUE-FREE         TO TWA-VALUE-FREE.                  
           MOVE ACAT33IO-UPDT-TMSTP TO TWA-UPDT-TMSTP.                          
           IF TWA-INP-TFR-TYP = 'MFC'                                           
              MOVE ACAT33IO-RCV-OCC-BRKR-NBR TO TWA-OCC-BRKR                    
           ELSE                                                                 
              MOVE '0'                       TO TWA-OCC-BRKR(1 : 1)             
              MOVE ACAT33IO-RCV-NBR          TO TWA-OCC-BRKR(2 : 4)             
           END-IF.                                                              
                                                                                
     ****** ASSET SECTION:                                                      
       MOVE-ACAT33IO-ASSET-TO-TWA.                                              
DJ0001     IF   ACAT33IO-BEARER-BOND-CD = 'B'                                   
DJ0001          MOVE '1' TO TWA-BOND-REG-CODE                                   
DJ0001     ELSE                                                                 
DJ0001          MOVE '0' TO TWA-BOND-REG-CODE                                   
DJ0001     END-IF                                                               
           MOVE ACAT33IO-ISIN-CNTRY-CD      TO TWA-ISIN-CNTRY-CD.               
           MOVE ACAT33IO-ISIN-SEC-ISSUE-CD  TO TWA-MSECR                        
                                               TWA-ORIG-SECR                    
                                               TWA-ORIG-MSECR.                  
           MOVE SPACES                      TO TWA-ISIN-SEC-CDG-CD.             
           MOVE ACAT33IO-STTLM-LCTN-CD      TO TWA-MSLOC                        
                                               TWA-ORIG-SLOC.                   
           MOVE ACAT33IO-FUND-ACCOUNT-NBR   TO TWA-FUND-ACCOUNT-NBR.            
ET0001                                                                          
ET0001     IF ACAT33IO-RE-REGIST-DATE = SPACE OR LOW-VALUE                      
ET0001        MOVE SPACE TO TWA-RE-REGIST-DATE                                  
ET0001     ELSE                                                                 
ET0001     IF ACAT33IO-RE-REGIST-DATE = '0001-01-01'                            
ET0001        MOVE SPACE TO TWA-RE-REGIST-DATE                                  
ET0001     ELSE                                                                 
ET0001        MOVE ACAT33IO-RE-REGIST-DATE TO WS-DB2-FORM-DATE                  
ET0001        MOVE WS-DATE-MM              TO WS-EDITED-MM                      
ET0001        MOVE WS-DATE-DD              TO WS-EDITED-DD                      
ET0001        MOVE WS-DATE-YY              TO WS-EDITED-YY                      
ET0001        MOVE WS-EDITED-DATE          TO TWA-RE-REGIST-DATE                
ET0001     END-IF.                                                              
LRM002     MOVE ACAT33IO-CAGE-TAG           TO TWA-CAGE-TAG.                    
           MOVE ACAT33IO-ADP-NBR            TO TWA-ADP-NBR.                     
           MOVE ACAT33IO-ASSET-PRC-CTGY-CD  TO TWA-MCATGR.                      
                                                                                
           IF ACAT33IO-CASH-ASSET                                               
              MOVE '1' TO TWA-MTYPE                                             
           ELSE                                                                 
           IF ACAT33IO-MARGIN-ASSET                                             
              MOVE '2' TO TWA-MTYPE                                             
           ELSE                                                                 
           IF ACAT33IO-SHORT-ASSET                                              
              MOVE '5' TO TWA-MTYPE                                             
           ELSE                                                                 
              MOVE SPACES TO TWA-MTYPE                                          
           END-IF.                                                              
           MOVE TWA-MTYPE TO  TWA-ORIG-MTYPE                                    
                              TWA-ORIG-TYPE.                                    
                                                                                
           MOVE 'P' TO TWA-MCD                                                  
           MOVE ACAT33IO-ASSET-QTY TO TWA-MQTY-9                                
           MOVE ACAT33IO-ASSET-AMT TO TWA-MAMT-9.                               
                                                                                
    **** ACAT33IO-PSTN-CD BASED ON POSITIVE OR NEGATIVE QTY BELOW.              
    **** THERE IS NO SIGN ON DATABASE NUMERIC FIELDS.                           
           IF ACAT33IO-SHORT-ASSET-QTY                                          
              COMPUTE TWA-MQTY-9 = TWA-MQTY-9 * -1                              
              COMPUTE TWA-MAMT-9 = TWA-MAMT-9 * -1                              
              END-COMPUTE.                                                      
                                                                                
           MOVE ACAT33IO-CSH-MGN-SHRT-CD TO TWA-ORIG-TYPE.                      
           MOVE ACAT33IO-ASSET-SEQ-NBR   TO TWA-ASSET-SEQ.                      
                                                                                
           MOVE ACAT33IO-DESC-TXT  TO TWA-MDESC-GROUP.                          
           MOVE ACAT33IO-ASSET-CMNT-TXT  TO TWA-MSCMNT-X120.                    
                                                                                
       REFORMAT-SCREEN-DETAIL.                                                  
********   MOVE LOW-VALUES  TO ACAT33MO.                                        
           MOVE TWA-MBR     TO MBRO    ACAT-BR.                         02030002
           MOVE TWA-MAC     TO MACO    ACAT-AC.                         02030002
           MOVE TWA-MRR     TO MRRO.                                            
           MOVE TWA-MCTYPE  TO MCTYPEO.                                         
           MOVE TWA-MCBRKR  TO MCBRKRO                                          
                              ACATPPIO-BRKR.                                    
           SET ACATPPIO-READ TO TRUE                                            
           PERFORM LINK-TO-ACATPPIO-RTN                                         
           IF ACATPPIO-FOUND                                                    
              MOVE ACATPPIO-NAME TO TWA-MCBNAM  MCBNAMO                         
           ELSE                                                                 
              MOVE SPACES        TO TWA-MCBNAM  MCBNAMO                         
              IF ACATPPIO-DB-ERROR                                              
                 MOVE 'READ'            TO WS-DB2-PROBLEM-FUNCTION              
                 MOVE ACATPPIO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                 
                 MOVE ACATPPIO-SQLCODE  TO WS-DB2-PROBLEM-ID                    
                 MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                          
                 PERFORM DB2-ERROR-RTN                                          
           END-IF.                                                              
           MOVE TWA-MCACCT  TO MCACCTO.                                         
LRM007     MOVE TWA-CNTL-ASTD-NBR TO ORGACATO.                                  
           MOVE TWA-MNAME   TO MNAMEO.                                          
           MOVE TWA-MNAME2  TO MNAME2O.                                         
           MOVE TWA-MSSN    TO MSSNO.                                           
           MOVE TWA-MSSN2   TO MSSN2O.                                          
           MOVE TWA-MACAT   TO MACATO.                                          
           MOVE TWA-STTLM-DT TO MSDO.                                           
           MOVE TWA-MSTAT   TO MSTATO.                                          
           MOVE TWA-MNEXT   TO MNEXTO.                                          
           MOVE TWA-MSUBM   TO MSUBMO.                                          
           IF TWA-MSUBM = 'S'                                                   
              MOVE '          MFC RESPONSE FOUND' TO PF6MSGO                    
           ELSE                                                                 
           IF ACAT-SIGN-ON-UPDATE                                               
LRM014     AND (TWA-INP-TFR-TYP = 'FUL' OR 'PTR' OR 'PTD' OR 'RCR')             
           AND TWA-CONTROL-NBR > SPACES                                         
              MOVE '          PF6 TO CREATE MFC'  TO PF6MSGO                    
           ELSE                                                                 
              MOVE SPACES               TO PF6MSGO                              
           END-IF.                                                              
                                                                                
           MOVE TWA-MCMNT   TO MCMNTO.                                          
           MOVE TWA-MDEL    TO MDELO.                                           
                                                                                
           PERFORM SET-STATUS-MSG-RTN.                                          
                                                                                
           MOVE TWA-STTLM-DT TO MSDO.                                           
     **** FIELDS ON ASSET SECTION...                                            
                                                                                
       REFORMAT-SCREEN-ASSET.                                                   
           MOVE TWA-MSECR    TO MSECRO.                                         
           MOVE TWA-MCATGR   TO MCATGRO.                                        
           MOVE TWA-MSLOC    TO MSLOCO.                                         
           MOVE TWA-MCD      TO MCDO.                                           
           IF TWA-MQTY-9 NOT = ZEROS                                            
              MOVE TWA-MQTY-9 TO WS-MQTY-ED-D5                                  
              MOVE WS-MQTY-AREA TO MQTYO TWA-MQTY TWA-ORIG-MQTY                 
           ELSE                                                                 
              MOVE SPACES       TO MQTYO TWA-MQTY TWA-ORIG-MQTY                 
           END-IF.                                                              
                                                                                
LRM001***  IF TWA-MAMT-9 = ZEROS                                                
LRM001***     MOVE SPACES       TO MAMTO TWA-MAMT TWA-ORIG-MAMT                 
LRM001***  ELSE                                                                 
LRM001***     MOVE TWA-MAMT-9 TO WS-MQTY-ED-D2                                  
LRM001***     MOVE WS-MQTY-AREA TO MAMTO TWA-MAMT TWA-ORIG-MAMT                 
LRM001***  END-IF.                                                              
LRM001     MOVE TWA-MAMT-9 TO WS-MQTY-ED-D2.                                    
LRM001     MOVE WS-MQTY-AREA TO MAMTO TWA-MAMT TWA-ORIG-MAMT.                   
                                                                                
           MOVE TWA-MTYPE TO MTYPEO.                                            
           MOVE TWA-FUND-ACCOUNT-NBR TO MFUNDACO.                               
ET0001     MOVE TWA-RE-REGIST-DATE   TO MREGDTO.                                
LRM002     MOVE TWA-CAGE-TAG         TO CAGETAGO.                               
           MOVE TWA-MDESC TO MDESCO.                                            
           MOVE TWA-MDESC2 TO MDESC2O.                                          
           MOVE TWA-MDESC3 TO MDESC3O.                                          
                                                                                
           SKIP3                                                                
       SET-STATUS-MSG-RTN.                                                      
           IF TWA-STTS-CD NOT GREATER SPACES                            08505010
              MOVE SPACES TO MSTATO                                             
           ELSE                                                                 
           EVALUATE TWA-STTS-CD                                         08505010
               WHEN '100'                                               08506010
                    MOVE '100-REQUEST'               TO MSTATO          08507010
               WHEN '110'                                               08506010
                    MOVE '110-REQUEST ADJUST'        TO MSTATO          08507010
               WHEN '120'                                               08506010
                    MOVE '120-REQUEST ADJUST PAST'   TO MSTATO          08507010
               WHEN '130'                                               08506010
                    MOVE '130-REQUEST PAST'          TO MSTATO          08507010
               WHEN '140'                                               08506010
                    MOVE '140-REQUEST REJECT'        TO MSTATO          08507010
               WHEN '200'                                               08506010
                    MOVE '200-REVIEW'                TO MSTATO          08507010
               WHEN '210'                                               08507110
                    MOVE '210-REVIEW ADJUST'         TO MSTATO          08508010
               WHEN '220'                                               08509010
                    MOVE '220-REVIEW ERROR'          TO MSTATO          08509110
               WHEN '230'                                               08509010
                    MOVE '230-REVIEW ACCELERATE'     TO MSTATO          08509110
               WHEN '240'                                               08509010
                    MOVE '240-REV-ADJ-REC-ACL'       TO MSTATO          08509110
               WHEN '300'                                               08509210
                    MOVE '300-SETTLE PREP'   TO MSTATO                  08509310
               WHEN '310'                                               08509410
                    MOVE '310-SETTLE CLOSE'  TO MSTATO                  08509510
               WHEN '400'                                               08509710
                    MOVE '400-CLOSE PURGE'   TO MSTATO                  08509810
               WHEN '500'                                               08509910
                    MOVE '500-MEMO PARTIAL REQUEST'      TO MSTATO      08510010
               WHEN '510'                                               08510110
                    MOVE '510-MEMO PURGE PARTIAL REQUEST' TO MSTATO     08510210
               WHEN '600'                                               08510110
                    MOVE '600-REJECT'    TO MSTATO                      08510210
               WHEN OTHER                                               08510110
                    MOVE TWA-STTS-CD     TO MSTATO                      08510210
           END-EVALUATE.                                                08510310
                                                                                
           EJECT                                                                
       PROCESS-MAP-ITEMS.                                                       
           IF TWA-INP-TFR-TYP NOT > SPACES                              04809710
              MOVE 'MFC' TO TWA-INP-TFR-TYP   MMTFRO.                           
                                                                                
OUT******  IF TWA-INP-TFR-TYP = 'MFC'                                   04809710
           IF (TWA-ACTION NOT = 'A' AND 'C')                                    
              PERFORM ASKIP-MAP-RTN                                             
              GO TO PROCESS-MAP-ITEMS-EXIT.                                     
                                                                                
           MOVE ATT-UNPROT TO MACATA.                                           
                                                                                
           IF TWA-INTRAN-BRW                                                    
              PERFORM READ-ACTIVE-MFC-RTN                                       
              IF ACAT33IO-FOUND                                                 
                 IF ACAT33IO-TRNFR-TYPE-CD NOT = 'MFC'                          
                    MOVE ATT-UNPROT-BRT TO MACATA                               
                    IF NOT INPUT-ERROR                                          
                       MOVE -1 TO MACATL                                        
                       MOVE 'ACTIVE ACAT MUST BE MFC FOR THIS SCREEN'           
                          TO SYSTEM-MSG                                         
                       SET INPUT-ERROR TO TRUE                                  
                    END-IF                                                      
                 ELSE                                                           
                    CONTINUE                                                    
              ELSE                                                              
              IF ACAT33IO-MFC-ACTIVE-FOUND                                      
                 MOVE '6' TO TWA-ACTION                                         
                 PERFORM MOVE-ACAT33IO-TO-TWA-RTN                               
                 PERFORM REFORMAT-SCREEN-DETAIL                                 
                 PERFORM READ-NEXT-ASSET-RTN                                    
                 SET INPUT-ERROR TO TRUE                                        
                 MOVE 'MFC HAS ACTIVE MFC / BROWSE ONLY'                        
                     TO SYSTEM-MSG                                              
              ELSE                                                              
              IF ACAT33IO-MFC-INITIAL-FOUND                                     
                 PERFORM MOVE-ACAT33IO-TO-TWA-RTN                               
                 PERFORM REFORMAT-SCREEN-DETAIL                                 
                 PERFORM READ-NEXT-ASSET-RTN                                    
                 SET INPUT-ERROR TO TRUE                                        
                 MOVE 'MFC POINTS TO EXISTING INITIAL MFC'                      
                     TO SYSTEM-MSG                                              
              ELSE                                                              
                 IF TWA-MACAT NOT > SPACES                                      
                 OR (TWA-MACAT > SPACES                                         
                 AND TWA-MACAT = TWA-ORIG-MACAT)                                
                    CONTINUE                                                    
                 ELSE                                                           
                 IF  TWA-ACTION = 'A'                                           
                 MOVE TWA-MACAT TO TWA-ORIG-MACAT TWA-CONTROL-NBR               
                 SET ACAT33IO-IT-GET-HISTORY TO TRUE                            
                 MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR                  
                 MOVE TWA-MACAT         TO ACAT33IO-CONTROL-NBR                 
                 MOVE 'FUL'             TO ACAT33IO-TRNFR-TYPE-CD               
                 PERFORM LINK-TO-ACAT33IO-RTN                                   
                 IF ACAT33IO-HISTORY-FOUND                                      
                    MOVE 'H' TO TWA-ACTIVE-DB                                   
                    PERFORM MOVE-ACAT33IO-TO-TWA-RTN                            
LRM001*******       PERFORM CREATE-MFC-FROM-HST-RTN                             
                 ELSE                                                           
                    MOVE ATT-UNPROT-BRT TO MACATA                               
                    MOVE -1 TO MACATL                                           
                    MOVE                                                        
                      'ACAT CONTROL NBR NOT FOUND ON HISTORY FILE'              
                          TO SYSTEM-MSG                                         
XXX********         SET INPUT-ERROR TO TRUE                                     
XXX********         GO TO PROCESS-MAP-ITEMS-EXIT                                
           END-IF.                                                              
                                                                                
           MOVE ATT-UNPROT TO MBRA.                                             
           IF TWA-MBR NOT GREATER SPACES                                        
              MOVE ATT-UNPROT-BRT TO MBRA                                       
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MBRL                                                
                 IF TWA-MACAT NOT > SPACES                                      
LRM002           AND TWA-CAGE-TAG NOT > SPACES                                  
                 AND TWA-ACTION = 'A'                                           
                    MOVE                                                        
                    'EITHER BR/AC OR ACAT CONTROL NBR IS REQUIRED'              
                       TO SYSTEM-MSG                                            
                 END-IF                                                         
                 SET INPUT-ERROR TO TRUE.                                       
                                                                                
           MOVE ATT-UNPROT TO MACA.                                             
           IF TWA-MAC NOT GREATER SPACES                                        
              MOVE ATT-UNPROT-BRT TO MACA                                       
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MACL                                                
                 MOVE 'ACCOUNT IS REQUIRED' TO SYSTEM-MSG                       
                 SET INPUT-ERROR TO TRUE.                                       
                                                                                
           IF NOT INPUT-ERROR                                                   
              SET ACATNAIO-NA-READ TO TRUE                                      
              MOVE TWA-CLIENT-NO-X(2 : 3) TO ACATNAIO-CLIENT                    
              MOVE TWA-MBR         TO ACATNAIO-BR                               
              MOVE TWA-MAC         TO ACATNAIO-AC                               
              PERFORM LINK-TO-ACATNAIO-RTN                                      
              IF ACATNAIO-NOT-FOUND                                             
                 MOVE ATT-UNPROT-BRT TO MBRA                                    
                                        MACA                                    
                 MOVE -1 TO MBRL                                                
                 MOVE 'BRANCH/ACCOUNT NOT ON N/A' TO SYSTEM-MSG                 
                 SET INPUT-ERROR TO TRUE                                        
              ELSE                                                              
                 MOVE TWA-MBR TO ACAT-INP-BRANCH  ACAT-BR                       
                 MOVE TWA-MAC TO ACAT-INP-ACCOUNT ACAT-AC                       
                 MOVE TWA-MRR  TO SRCH-INP-RR                                   
                 MOVE TWA-MBR  TO SRCH-INP-BRANCH                               
                 MOVE ACATNAIO-RR    TO TWA-MRR     MRRO                        
                 IF  ACAT-SUPER-SIGN-ON-UPDATE                                  
                 OR  ACAT-SUPER-SIGN-ON-BROWSE                                  
                    CONTINUE                                                    
                 ELSE                                                           
                    PERFORM SIGNON-SECR-CHECK-RTN                               
                    IF SRCH-SIGNON-SECR-CHECK-FAIL                              
                       MOVE ATT-UNPROT-BRT TO MBRA                              
                                              MACA                              
                       MOVE -1 TO MBRL                                          
                       MOVE SRCH-MSG TO SYSTEM-MSG                              
                       SET INPUT-ERROR TO TRUE                                  
                       PERFORM ERROR-RTN                                        
                    END-IF                                                      
                 END-IF                                                         
                 PERFORM CHECK-ACCOUNT-RESTRICTIONS-RTN                         
                 IF TWA-MNAME NOT > SPACES                                      
LRM******           MOVE 'SN'           TO TWA-MCTYPE  MCTYPEO                  
                    IF ACATNAIO-SSN(1 : 1) GREATER SPACES                       
                       MOVE ACATNAIO-SSN(1 : 3) TO TWA-MSSN(1 : 3)              
                       MOVE '-'                 TO TWA-MSSN(4 : 1)              
                       MOVE ACATNAIO-SSN(4 : 2) TO TWA-MSSN(5 : 2)              
                       MOVE '-'                 TO TWA-MSSN(7 : 1)              
                       MOVE ACATNAIO-SSN(6 : 4) TO TWA-MSSN(8 : 4)              
                    ELSE                                                        
                       MOVE SPACES TO TWA-MSSN                                  
                    END-IF                                                      
                    MOVE TWA-MSSN TO MSSNO                                      
                    IF ACATNAIO-SSN2(1 : 1) GREATER SPACES                      
                       MOVE ACATNAIO-SSN2(1 : 3) TO TWA-MSSN2(1 : 3)            
                       MOVE '-'                  TO TWA-MSSN2(4 : 1)            
                       MOVE ACATNAIO-SSN2(4 : 2) TO TWA-MSSN2(5 : 2)            
                       MOVE '-'                  TO TWA-MSSN2(7 : 1)            
                       MOVE ACATNAIO-SSN2(6 : 4) TO TWA-MSSN2(8 : 4)            
                    ELSE                                                        
                       MOVE SPACES TO TWA-MSSN2                                 
                    END-IF                                                      
                    MOVE TWA-MSSN2 TO MSSN2O                                    
                    MOVE ACATNAIO-IRA   TO TWA-NA-IRA                           
                    MOVE ACATNAIO-NAME  TO TWA-MNAME   MNAMEO                   
                    MOVE ACATNAIO-NAME2 TO TWA-MNAME2  MNAME2O.                 
                                                                                
           MOVE ATT-UNPROT TO MCTYPEA.                                          
           IF TWA-MCTYPE NOT GREATER SPACES                                     
           AND ACATNAIO-FOUND                                                   
              PERFORM SET-CUST-TYPE-B1-DEFAULT-RTN                              
              MOVE TWA-MCTYPE  TO MCTYPEO                                       
           END-IF.                                                              
                                                                                
           IF TWA-MCTYPE NOT GREATER SPACES                                     
              MOVE ATT-UNPROT-BRT TO MCTYPEA                                    
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MCTYPEL                                             
                 MOVE                                                           
                   'CUST ACCOUNT TYPE IS REQUIRED; PRESS PF9 FOR LIST'          
                        TO SYSTEM-MSG                                           
                 SET INPUT-ERROR TO TRUE                                        
              END-IF                                                            
           ELSE                                                                 
              MOVE 1 TO SUB                                                     
LRM014        PERFORM UNTIL SUB > WS-ACCOUNT-TYPE-CHOICES                       
                        OR WS-ACCOUNT-TYPE(SUB) = TWA-MCTYPE                    
                 ADD 1 TO SUB                                                   
              END-PERFORM                                                       
LRM014        IF SUB > WS-ACCOUNT-TYPE-CHOICES                                  
                 MOVE ATT-UNPROT-BRT TO MCTYPEA                                 
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MCTYPEL                                          
                    MOVE                                                        
                        'CUST ACCOUNT TYPE IS INVALID; ENTER ? FOR LIST'        
                            TO SYSTEM-MSG                                       
                    SET INPUT-ERROR TO TRUE.                                    
                                                                                
           MOVE ATT-UNPROT TO MCBRKRA.                                          
           IF TWA-MCBRKR NOT GREATER SPACES                                     
              MOVE ATT-UNPROT-BRT TO MCBRKRA                                    
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MCBRKRL                                             
                 MOVE 'CONTRA BROKER IS REQUIRED' TO SYSTEM-MSG                 
                 SET INPUT-ERROR TO TRUE                                        
              END-IF                                                            
           ELSE                                                                 
           IF TWA-MCBRKR = ACAT-ADP-BROKER                                      
              MOVE ATT-UNPROT-BRT TO MCBRKRA                                    
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MCBRKRL                                             
                 MOVE 'CONTRA BROKER CANNOT BE YOURSELF' TO SYSTEM-MSG          
                 SET INPUT-ERROR TO TRUE                                        
              END-IF                                                            
           ELSE                                                                 
              MOVE TWA-MCBRKR TO ACATPPIO-BRKR                                  
              SET ACATPPIO-READ TO TRUE                                         
              PERFORM LINK-TO-ACATPPIO-RTN                                      
              IF ACATPPIO-FOUND                                                 
                 MOVE ACATPPIO-NAME TO TWA-MCBNAM  MCBNAMO                      
              ELSE                                                              
                 MOVE SPACES        TO TWA-MCBNAM  MCBNAMO                      
                 MOVE ATT-UNPROT-BRT TO MCBRKRA                                 
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MCBRKRL                                          
                    SET INPUT-ERROR TO TRUE                                     
                    IF ACATPPIO-NOT-FOUND                                       
                       MOVE 'CONTRA BROKER IS INVALID' TO SYSTEM-MSG            
                    ELSE                                                        
                    IF ACATPPIO-DB-ERROR                                        
                       MOVE 'READ'            TO WS-DB2-PROBLEM-FUNCTION        
                       MOVE ACATPPIO-SQLCAID  TO WS-DB2-PROBLEM-TABLE           
                       MOVE ACATPPIO-SQLCODE  TO WS-DB2-PROBLEM-ID              
                       MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                    
                       PERFORM DB2-ERROR-RTN.                                   
                                                                                
           MOVE ATT-UNPROT TO MCACCTA.                                          
           PERFORM JUSTIFY-LEFT-MCACCT.                                         
           IF MCACCT-ERROR                                                      
              MOVE ATT-UNPROT-BRT TO MCACCTA                                    
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MCACCTL                                             
                 MOVE 'CONTRA ACCOUNT CHARACTERS NOT A THRU Z, 0 THRU 9'        
                                TO SYSTEM-MSG                                   
                 SET INPUT-ERROR TO TRUE                                        
              END-IF                                                            
           ELSE                                                                 
           IF TWA-MCACCT(1 : 1) NOT GREATER SPACES                              
              MOVE ATT-UNPROT-BRT TO MCACCTA                                    
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MCACCTL                                             
                 MOVE 'CONTRA ACCOUNT IS REQUIRED' TO SYSTEM-MSG                
                 SET INPUT-ERROR TO TRUE                                        
              END-IF                                                            
           ELSE                                                                 
              MOVE TWA-MCACCT TO MCACCTO.                                       
                                                                                
      *---------------------------------------------------------------*         
      * THE ACTION DETERMINATION LOGIC BELOW ASSUMES (INSERT) WHEN TIF          
      * NOT FOUND AND (UPDATE) WHEN FOUND.  ONCE A RECORD IS DISPLAYED,         
      * THEN CHANGES TO BR/AC IS A LOGICAL KEY CHANGE (NEW SESSION),            
      * CHANGES TO DLVR BRKR/ACCT IS AN (UPDATE) TO THIS RECORD.                
      *---------------------------------------------------------------*         
******** ON KEY CHANGE, SEE WHAT'S ON FILE...                                   
           IF NOT INPUT-ERROR                                                   
           AND (TWA-INTRAN-BRW                                          04809810
             OR TWA-MCBRKR NOT = TWA-ORIG-RCV-NBR                               
             OR TWA-MCACCT NOT = TWA-ORIG-RCV-ACCT)                             
              PERFORM READ-ACAT-RTN                                             
              IF (ACAT33IO-NOT-FOUND                                            
              OR (ACAT33IO-ACTIVE-FOUND                                         
                 AND ACAT33IO-STTS-CD = '140' OR '600'))                        
                 IF ACAT-SIGN-ON-UPDATE                                         
                    MOVE 'A' TO TWA-ACTION TWA-SECR-ACTION                      
                 ELSE                                                           
                    SET TWA-INTRAN-BRW TO TRUE                                  
                    MOVE ATT-UNPROT-BRT TO MCBRKRA                              
                                           MCACCTA                              
                    IF NOT INPUT-ERROR                                          
                       MOVE -1 TO MCBRKRL                                       
                       MOVE                                                     
                       'TIF NOT FOUND; USE PA1 FOR GENERIC BROWSE'              
                                TO SYSTEM-MSG                                   
                       SET INPUT-ERROR TO TRUE                                  
                    END-IF                                                      
              ELSE                                                              
  ********** FOUND...                                                           
                 IF NOT TWA-INTRAN-BRW                                          
                 AND TWA-ACTION = 'C'                                           
                 AND TWA-ORIG-RCV-NBR > SPACES                                  
                 AND (TWA-ORIG-RCV-NBR NOT = TWA-MCBRKR                         
                   OR TWA-ORIG-RCV-ACCT NOT = TWA-MCACCT)                       
                    MOVE ATT-UNPROT-BRT TO MCBRKRA                              
                                           MCACCTA                              
                    IF NOT INPUT-ERROR                                          
                       MOVE -1 TO MCBRKRL                                       
                       MOVE                                                     
                     'CONTRA BRKR/ACCOUNT ALREADY EXISTS ON ANOTHER TIF'        
                                TO SYSTEM-MSG                                   
                       SET INPUT-ERROR TO TRUE                                  
                    END-IF                                                      
                 ELSE                                                           
                    PERFORM READ-NEXT-ASSET-RTN                                 
                    IF TWA-INTRAN-BRW                                           
                    OR (TWA-ACTION NOT = 'B' AND 'C')                           
                       PERFORM MOVE-ACAT33IO-TO-TWA-RTN                         
                       PERFORM REFORMAT-SCREEN-DETAIL                           
                       MOVE 'TRANSFER DISPLAYED' TO SYSTEM-MSG                  
                       SET TWA-INTRAN-BRW TO TRUE                               
                       IF NOT ACAT33IO-ACTIVE-FOUND                             
                       OR (ACAT33IO-ACTIVE-FOUND                                
                          AND (ACAT33IO-STTS-CD = '140' OR '600'))              
ASSET                  OR (ACAT33IO-ASSET-FOUND                                 
                          AND (ACAT33IO-NSCC-SUBMIT-ELIGABLE                    
                            OR ACAT33IO-NSCC-SUBMIT-HOLD))                      
                          MOVE 'C' TO TWA-ACTION                                
                          MOVE -1 TO MNAMEL                                     
                          MOVE ACAT33IO-RCV-NBR   TO TWA-ORIG-RCV-NBR           
                          MOVE ACAT33IO-RCV-ACCT TO TWA-ORIG-RCV-ACCT           
                          IF TWA-MSUBM = 'Y'                                    
                             MOVE 'TIF DISPLAYED / AWAITNG NSCC XMIT'           
                                  TO SYSTEM-MSG                                 
                          ELSE                                                  
                             MOVE 'TIF DISPLAYED / SUBMIT PENDING'              
                                  TO SYSTEM-MSG                                 
                          END-IF                                                
                          MOVE -1 TO MNAMEL                                     
                       ELSE                                                     
                          MOVE 'B' TO TWA-ACTION                                
                          MOVE -1 TO MBRL                                       
                          SET INPUT-ERROR TO TRUE                               
                          IF ACAT33IO-NSCC-ACKNOWLEDGEMENT                      
                             MOVE WS-ACKNOWLEDGE-MSG TO SYSTEM-MSG              
                          ELSE                                                  
                          IF ACAT33IO-NSCC-SUBMITTED                            
                             MOVE WS-SUBMITTED-MSG TO SYSTEM-MSG                
                          ELSE                                                  
                          IF ACAT33IO-ACTIVE-FOUND                              
                             MOVE                                               
                               'ACTIVE TRANSFER DISPLAYED / BROWSE ONLY'        
                                  TO SYSTEM-MSG                                 
                          ELSE                                                  
                             MOVE 'TRANSFER DISPLAYED / BROWSE ONLY'            
                                  TO SYSTEM-MSG.                                
                                                                                
           MOVE ATT-UNPROT TO  MNAMEA                                           
                               MNAME2A.                                         
                                                                                
           MOVE ATT-UNPROT TO  MSSNA.                                           
           IF TWA-MSSN = SPACES                                                 
              MOVE ATT-UNPROT-BRT TO MSSNA                                      
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MSSNL                                               
                 MOVE 'TAX ID NUMBER IS REQUIRED' TO SYSTEM-MSG                 
                 SET INPUT-ERROR TO TRUE                                        
              END-IF                                                            
           ELSE                                                                 
              MOVE TWA-MSSN TO WS-SSN-EDIT                                      
              PERFORM SSN-EDIT-RTN                                              
              IF SSN-INVALID                                                    
                 MOVE ATT-UNPROT-BRT TO MSSNA                                   
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MSSNL                                            
                    MOVE 'TAX ID NUMBER IS INVALID' TO SYSTEM-MSG               
                    SET INPUT-ERROR TO TRUE                                     
                 END-IF                                                         
              ELSE                                                              
                 MOVE WS-SSN-EDIT TO TWA-MSSN MSSNO.                            
                                                                                
           MOVE ATT-UNPROT TO  MSSN2A.                                          
           IF TWA-MSSN2 NOT = SPACES AND LOW-VALUES                             
              MOVE TWA-MSSN2 TO WS-SSN-EDIT                                     
              PERFORM SSN-EDIT-RTN                                              
              IF SSN-INVALID                                                    
                 MOVE ATT-UNPROT-BRT TO MSSN2A                                  
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MSSN2L                                           
                    MOVE '2ND TAX ID NUMBER IS INVALID' TO SYSTEM-MSG           
                    SET INPUT-ERROR TO TRUE                                     
                 END-IF                                                         
              ELSE                                                              
                 MOVE WS-SSN-EDIT TO TWA-MSSN2 MSSN2O.                          
                                                                                
           IF (TWA-ACTION = 'A' OR 'C')                                         
LRM002        IF TWA-ACTION = 'A'                                               
LRM002        AND TWA-CAGE-TAG > SPACES                                         
LRM002        AND TWA-MACAT NOT > SPACES                                02030002
LRM002           PERFORM READ-CAGE-TAG-INDEX-RTN                                
LRM002           IF ACATCG-RESPONSE = +0                                        
LRM002           AND ACAT-CAGE-INDEX-KEY(1 : 15) = WS-ACATCG-KEY(1 : 15)        
LRM002              MOVE ACAT-CAGE-CONTROL-NBR TO TWA-MACAT MACATO              
LRM002              MOVE TWA-MACAT TO MACATO                                    
LRM002           ELSE                                                           
LRM002           IF ACATCG-RESPONSE = +13                                       
LRM002              MOVE 'TAG NUMBER NOT FOUND' TO SYSTEM-MSG                   
LRM002              SET INPUT-ERROR TO TRUE                                     
LRM002           ELSE                                                           
LRM002              MOVE 'TAG NUMBER SEARCH NOT AVAILABLE' TO SYSTEM-MSG        
LRM002              SET INPUT-ERROR TO TRUE                                     
LRM002           END-IF END-IF                                                  
LRM002        END-IF                                                            
LRM007        IF TWA-ACTION = 'C'                                               
LRM007           MOVE ATT-ASKIP TO MACATA                                       
LRM007        ELSE                                                              
              IF TWA-MACAT NOT > SPACES                                 02030002
                 MOVE ATT-UNPROT-BRT TO MACATA                                  
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MACATL                                           
                    MOVE 'ORIGINAL CONTROL NUMBER IS REQUIRED'                  
                       TO SYSTEM-MSG                                            
                    SET INPUT-ERROR TO TRUE                                     
                 END-IF                                                         
              ELSE                                                              
              IF TWA-MACAT NOT NUMERIC                                  02030002
                 MOVE ATT-UNPROT-BRT TO MACATA                                  
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MACATL                                           
                    MOVE 'ORIGINAL CONTROL NUMBER NOT NUMERIC'                  
                       TO SYSTEM-MSG                                            
                    SET INPUT-ERROR TO TRUE                                     
                 END-IF                                                         
              ELSE                                                              
               IF TWA-MACAT NOT = TWA-CONTROL-NBR                               
               AND TWA-ACTION = 'A'                                             
                 MOVE TWA-MACAT TO TWA-CONTROL-NBR                              
                 SET ACAT33IO-IT-GET-HISTORY TO TRUE                            
                 MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR                  
                 MOVE TWA-MACAT         TO ACAT33IO-CONTROL-NBR                 
                 MOVE 'FUL'             TO ACAT33IO-TRNFR-TYPE-CD               
                 PERFORM LINK-TO-ACAT33IO-RTN                                   
                 IF ACAT33IO-HISTORY-FOUND                                      
                    PERFORM MOVE-ACAT33IO-TO-TWA-RTN                            
                    PERFORM REFORMAT-SCREEN-DETAIL                              
                    PERFORM MOVE-ACAT33IO-ASSET-TO-TWA                          
                    PERFORM REFORMAT-SCREEN-ASSET                               
                 END-IF                                                         
TEST           END-IF                                                           
              END-IF                                                            
           END-IF.                                                              
           MOVE ATT-UNPROT TO  MSDA.                                            
           IF TWA-STTLM-DT = SPACES                                             
              MOVE ATT-UNPROT-BRT TO MSDA                                       
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MSDL                                                
                 MOVE 'ORIGINAL SETTLEMENT DATE IS REQUIRED'                    
                        TO SYSTEM-MSG                                           
                 SET INPUT-ERROR TO TRUE                                        
              END-IF                                                            
           ELSE                                                                 
              IF TWA-STTLM-DT(3 : 1) = '/' OR '-'                               
                 MOVE TWA-STTLM-DT(1 : 2) TO WS-STTLM-DT-MM                     
                 MOVE TWA-STTLM-DT(4 : 2) TO WS-STTLM-DT-DD                     
                 MOVE TWA-STTLM-DT(7 : 2) TO WS-STTLM-DT-YY                     
              ELSE                                                              
                 MOVE TWA-STTLM-DT(1 : 2) TO WS-STTLM-DT-MM                     
                 MOVE TWA-STTLM-DT(3 : 2) TO WS-STTLM-DT-DD                     
                 MOVE TWA-STTLM-DT(5 : 2) TO WS-STTLM-DT-YY                     
              END-IF                                                            
              IF WS-STTLM-DT-MMDDYY NOT NUMERIC                                 
              OR (WS-STTLM-DT-MM  < '01' OR > '12')                             
              OR (WS-STTLM-DT-DD  < '01' OR > '31')                             
                 MOVE ATT-UNPROT-BRT TO MSDA                                    
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MSDL                                             
                    MOVE 'ORIGINAL SETTLEMENT DATE MM/DD/YY IS INVALID'         
                        TO SYSTEM-MSG                                           
                    SET INPUT-ERROR TO TRUE                                     
                 END-IF                                                         
              ELSE                                                              
                 IF WS-STTLM-DT-YY > '90'                               02030002
                    MOVE '19' TO TWA-DB2-STTLM-DT(1 : 2)                02030002
                 ELSE                                                           
                    MOVE '20' TO TWA-DB2-STTLM-DT(1 : 2)                02030002
                 END-IF                                                         
                 MOVE WS-STTLM-DT-YY TO TWA-DB2-STTLM-DT(3 : 2)         02030002
                 MOVE WS-STTLM-DT-MM TO TWA-DB2-STTLM-DT(6 : 2)         02030002
                 MOVE WS-STTLM-DT-DD TO TWA-DB2-STTLM-DT(9 : 2)         02030002
                 MOVE '-'            TO TWA-DB2-STTLM-DT(5 : 1)         02030002
                                        TWA-DB2-STTLM-DT(8 : 1)         02030002
           END-IF.                                                              
                                                                                
           MOVE ATT-UNPROT TO MCMNTA.                                           
           IF TWA-MCMNT GREATER SPACES                                          
           AND TWA-MCMNT NOT = 'Y' AND 'N'                                      
              MOVE ATT-UNPROT-BRT TO MCMNTA                                     
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MCMNTL                                              
                 MOVE 'COMMENT INDICATOR MUST BE Y OR SPACE'                    
                             TO SYSTEM-MSG                                      
                 SET INPUT-ERROR TO TRUE.                                       
                                                                                
           MOVE ATT-UNPROT TO MSUBMA.                                           
           IF TWA-MSUBM GREATER SPACES                                          
           AND TWA-MSUBM NOT = 'Y' AND 'N'                                      
              MOVE ATT-UNPROT-BRT TO MSUBMA                                     
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MSUBML                                              
                 MOVE 'SUBMIT INDICATOR MUST BE Y, N OR SPACE'                  
                             TO SYSTEM-MSG                                      
                 SET INPUT-ERROR TO TRUE.                                       
                                                                                
LRM007     IF TWA-MSUBM = 'Y'                                                   
LRM007     AND TWA-FUND-ACCOUNT-NBR NOT > SPACES                                
LRM007        SET ACAT33IO-COUNT-ASSETS-W-FNBR TO TRUE                          
LRM007        MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR                     
LRM007        MOVE TWA-CONTROL-NBR   TO ACAT33IO-CONTROL-NBR                    
LRM007        MOVE TWA-DB2-STTLM-DT  TO ACAT33IO-STTLM-DT               02030002
LRM007        MOVE TWA-MCBRKR        TO ACAT33IO-RCV-NBR                        
LRM007        MOVE TWA-MCACCT        TO ACAT33IO-RCV-ACCT                       
LRM007        MOVE ACAT-ADP-BROKER   TO ACAT33IO-DLVR-NBR                       
LRM007        MOVE TWA-MBR           TO ACAT33IO-DLVR-ACCT                      
LRM007        MOVE TWA-MAC           TO ACAT33IO-DLVR-ACCT(4 : 5)               
LRM007        MOVE 'MFC'             TO ACAT33IO-TRNFR-TYPE-CD                  
LRM007        PERFORM LINK-TO-ACAT33IO-RTN                                      
LRM007        IF ACAT33IO-ASSET-W-FUND-NBR NOT > ZEROS                          
LRM007           MOVE ATT-UNPROT-BRT TO MSUBMA                                  
LRM007           IF NOT INPUT-ERROR                                             
LRM007              MOVE -1 TO MSUBML                                           
LRM007              MOVE 'SUBMIT NOT ALLOWED; NO ASSETS HAVE FUND NBR'          
LRM007                       TO SYSTEM-MSG                                      
LRM007              MOVE ACAT33IO-ASSET-TOTAL-COUNT TO WS-ASSET-ED              
LRM007              MOVE WS-ASSET-X TO SYSTEM-MSG(45 : 4)                       
LRM007              SET INPUT-ERROR TO TRUE.                                    
LRM007                                                                          
           MOVE ATT-UNPROT TO MDELA.                                            
           IF TWA-MDEL GREATER SPACES                                           
           AND TWA-MDEL NOT = 'Y' AND 'N'                                       
              MOVE ATT-UNPROT-BRT TO MDELA                                      
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MDELL                                               
                 MOVE 'DELETE INDICATOR MUST BE Y, N OR SPACE'                  
                             TO SYSTEM-MSG                                      
                 SET INPUT-ERROR TO TRUE.                                       
                                                                                
           IF TWA-ACTION NOT = 'C'                                              
              MOVE ATT-ASKIP TO MDELA.                                          
                                                                                
******** ALLOW USER TO DELETE ANY EXISTING MFC.                                 
           IF TWA-MDEL = 'Y'                                                    
           AND TWA-ACTION = 'C'                                                 
           AND TWA-INP-TFR-TYP = 'MFC'                                          
              MOVE 'N' TO INPUT-ERROR-FLAG                              00970002
              GO TO PROCESS-MAP-ITEMS-EXIT.                                     
                                                                                
     **** FIELDS ON ASSET SECTION...                                            
           MOVE ATT-UNPROT TO MSECRA.                                           
           IF TWA-MSECR NOT GREATER SPACES                                      
              CONTINUE                                                          
           ELSE                                                                 
           IF TWA-SECR-ACTION NOT = 'A'                                         
KEYCH      AND TWA-MSECR NOT = TWA-ORIG-MSECR                                   
              PERFORM BROWSE-ASSET-RTN                                          
           ELSE                                                                 
           IF TWA-SECR-ACTION = 'A'                                             
              SET ACATMSD-MSD-READ TO TRUE                                      
              MOVE TWA-MSECR TO ACATMSD-SEARCH-KEY                              
              PERFORM LINK-TO-ACATMSDIO-RTN                                     
              IF ACATMSD-FOUND                                                  
                 MOVE ACATMSD-ADP-NBR TO TWA-ADP-NBR                            
                 MOVE ACATMSD-BOND-REG-CODE TO TWA-BOND-REG-CODE                
                 IF TWA-MDESC(1 : 1) NOT GREATER SPACES                         
                 OR TWA-MSECR NOT = TWA-ORIG-MSECR                              
                    MOVE ACATMSD-CUSIP   TO TWA-MSECR MSECRO                    
                                            TWA-ORIG-MSECR                      
                                            TWA-ORIG-SECR                       
                    IF TWA-MDESC(1 : 1) NOT GREATER SPACES                      
                       MOVE ACATMSD-DESC    TO TWA-MDESC MDESCO                 
                       MOVE ACATMSD-DESC2   TO TWA-MDESC2 MDESC2O               
                       MOVE ACATMSD-DESC3   TO TWA-MDESC3 MDESC3O               
                    END-IF                                                      
                 END-IF                                                         
                 PERFORM CHECK-ISIN-RESTRICTIONS-RTN                            
                 IF TWA-MCATGR NOT GREATER SPACES                               
                 OR TWA-MSECR NOT = TWA-ORIG-MSECR                              
                    PERFORM SET-DEFAULT-CATEGORY-CODE-RTN                       
                 END-IF                                                         
              ELSE                                                              
              IF ACATMSD-NOT-FOUND                                              
                 MOVE ATT-UNPROT-BRT TO MSECRA                                  
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MSECRL                                           
                    MOVE 'SECURITY NOT FOUND ON MSD' TO SYSTEM-MSG              
                    SET INPUT-ERROR TO TRUE                                     
                 END-IF                                                         
              ELSE                                                              
              IF ACATMSD-NOT-AVAIL                                              
                 MOVE ATT-UNPROT-BRT TO MSECRA                                  
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MSECRL                                           
                    MOVE 'MSD FILE IS NOT AVAILABLE' TO SYSTEM-MSG              
                    SET INPUT-ERROR TO TRUE                                     
                 END-IF                                                         
              ELSE                                                              
              IF ACATMSD-ERROR                                                  
                 MOVE ATT-UNPROT-BRT TO MSECRA                                  
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MSECRL                                           
LRM011              MOVE 'MSD FILE PROBLEM / CALL HELP DESK'                    
LRM011                             TO SYSTEM-MSG                                
                    SET INPUT-ERROR TO TRUE                                     
                 END-IF.                                                        
                                                                                
           IF TWA-MSECR NOT GREATER SPACES                                      
              IF (TWA-MDESC > SPACES                                            
                OR TWA-MCATGR > SPACES                                          
                OR TWA-MSLOC > SPACES                                           
                OR TWA-MQTY > SPACES                                            
                OR TWA-MAMT > SPACES                                            
                OR TWA-MCD > SPACES                                             
                OR TWA-FUND-ACCOUNT-NBR > SPACES                                
ET0001          OR TWA-RE-REGIST-DATE > SPACES                                  
                OR TWA-MTYPE > SPACES)                                          
                   MOVE ATT-UNPROT-BRT TO MSECRA                                
                   IF NOT INPUT-ERROR                                           
                      MOVE -1 TO MSECRL                                         
                      MOVE                                                      
               'CUSIP IS REQUIRED WHEN OTHER ASSET FIELDS ARE PRESENT'          
                            TO SYSTEM-MSG                                       
                      SET INPUT-ERROR TO TRUE                                   
                   END-IF                                                       
              ELSE                                                              
                 GO TO SKIP-ASSET-EDIT.                                         
                                                                                
           MOVE ATT-UNPROT TO MCATGRA.                                          
           IF TWA-MCATGR > SPACES                                               
              IF (TWA-MCATGR = 'MFMM' OR 'MFNM')                                
                     CONTINUE                                                   
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO MCATGRA                                 
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MCATGRL                                          
                    MOVE 'CATEGORY CODE IS INVALID' TO SYSTEM-MSG               
                    SET INPUT-ERROR TO TRUE.                                    
                                                                                
           MOVE ATT-UNPROT TO MSLOCA.                                           
           IF TWA-MSLOC NOT GREATER SPACES                                      
              MOVE '50' TO TWA-MSLOC MSLOCO                                     
           ELSE                                                                 
           IF TWA-MSLOC NOT = '50'                                              
              MOVE ATT-UNPROT-BRT TO MSLOCA                                     
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MSLOCL                                              
                 MOVE 'LOCATION CODE MUST BE 50' TO SYSTEM-MSG                  
                 SET INPUT-ERROR TO TRUE                                        
              END-IF.                                                           
                                                                                
           MOVE ATT-UNPROT TO MTYPEA.                                           
           IF TWA-MTYPE NOT GREATER SPACES                                      
              MOVE '1' TO TWA-MTYPE MTYPEO                                      
           ELSE                                                                 
              IF TWA-MTYPE NOT = '1' AND '2' AND '5'                            
                 MOVE ATT-UNPROT-BRT TO MTYPEA                                  
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MTYPEL                                           
                    MOVE 'ASSET TYPE MUST BE 1, 2 OR 5' TO SYSTEM-MSG           
                    SET INPUT-ERROR TO TRUE                                     
                 END-IF.                                                        
                                                                                
           MOVE ATT-UNPROT TO MFUNDACA.                                         
           IF TWA-FUND-ACCOUNT-NBR NOT GREATER SPACES                           
              MOVE ATT-UNPROT-BRT TO MFUNDACA                                   
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MFUNDACL                                            
                 MOVE 'FUND ACCOUNT NBR IS REQUIRED' TO SYSTEM-MSG              
                 SET INPUT-ERROR TO TRUE                                        
              END-IF                                                            
           END-IF.                                                              
                                                                                
ET0001     MOVE ATT-UNPROT TO MREGDTA.                                          
ET0001     IF TWA-RE-REGIST-DATE NOT GREATER SPACES                             
ET0001        MOVE ATT-UNPROT-BRT TO MREGDTA                                    
ET0001        IF NOT INPUT-ERROR                                                
ET0001           MOVE -1 TO MREGDTL                                             
ET0001           MOVE 'RE-REGISTRATION DATE IS REQUIRED' TO SYSTEM-MSG          
ET0001           SET INPUT-ERROR TO TRUE                                        
ET0001        END-IF                                                            
ET0001     ELSE                                                                 
ET0001        PERFORM  DATE-FORMAT-CHECK                                        
ET0001     END-IF.                                                              
                                                                                
           MOVE ATT-UNPROT TO  MCDA.                                            
           IF TWA-MCD = 'D'                                                     
              IF TWA-SECR-ACTION = 'C'                                          
                 MOVE 'D' TO TWA-SECR-ACTION                                    
LRM001           MOVE 'N' TO INPUT-ERROR-FLAG                                   
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO MCDA                                    
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MCDL                                             
                    MOVE 'DELETE (D) ONLY ALLOWED ON AN EXISTING ASSET'         
                         TO SYSTEM-MSG                                          
                    SET INPUT-ERROR TO TRUE                                     
                 END-IF                                                         
           ELSE                                                                 
           IF TWA-MQTY > SPACES                                                 
           AND TWA-MCD NOT > SPACES                                             
              MOVE 'P' TO TWA-MCD MCDI                                          
           ELSE                                                                 
           IF (TWA-MCD > SPACES                                                 
             OR TWA-MQTY > SPACES)                                              
           AND (TWA-MCD NOT = 'P')                                              
              MOVE ATT-UNPROT-BRT TO MCDA                                       
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MCDL                                                
                 MOVE                                                           
              'NUMERIC OPTION CD MUST BE P(SHARES)'                             
                      TO SYSTEM-MSG                                             
                 SET INPUT-ERROR TO TRUE                                        
              END-IF.                                                           
                                                                                
           MOVE ATT-UNPROT TO  MQTYA.                                           
           IF TWA-MQTY GREATER SPACES                                           
              IF TWA-MCD = 'P' OR ' '                                           
                 PERFORM EDIT-QTY-RTN                                           
              ELSE                                                              
              IF TWA-MCD = 'D'                                                  
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO MQTYA                                   
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MQTYL                                            
                    SET INPUT-ERROR TO TRUE                                     
                    MOVE                                                        
            'QTY FIELD NOT ALLOWED WITHOUT CD / ERASE FOR FULL POSITION'        
                                TO SYSTEM-MSG                                   
                 END-IF                                                         
           ELSE                                                                 
***********   IF TWA-MCD = 'P' OR 'V' OR '%'                                    
                 MOVE ATT-UNPROT-BRT TO MQTYA                                   
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MQTYL                                            
                    MOVE 'NUMBER OF SHARES IS REQUIRED'                         
                       TO SYSTEM-MSG                                            
                 SET INPUT-ERROR TO TRUE                                        
              END-IF.                                                           
********** DON'T EDIT ANY OTHER ASSET FIELDS WHEN MARKED FOR DELETE             
********** ON EXISTING ASSET.                                                   
           IF TWA-MCD = 'D'                                                     
              AND (TWA-ORIG-MSECR > SPACES                                      
               OR  TWA-ORIG-SLOC  > SPACES                                      
               OR  TWA-ORIG-MTYPE > SPACES)                                     
              GO TO SKIP-ASSET-EDIT.                                            
                                                                                
           MOVE ATT-UNPROT TO MDESCA.                                           
           IF TWA-MDESC(1 : 1) NOT GREATER SPACES                               
              MOVE ATT-UNPROT-BRT TO MDESCA                                     
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MDESCL                                              
                 MOVE 'THE FIRST DESCRIPTION IS REQUIRED' TO SYSTEM-MSG         
                 SET INPUT-ERROR TO TRUE                                        
LRM012        ELSE                                                              
LRM012           PERFORM VARYING SUB FROM 1 BY 1                                
LRM012                 UNTIL SUB GREATER 30                                     
LRM012              IF TWA-MDESC(SUB : 1) < ' '                                 
LRM012                 MOVE SPACE TO TWA-MDESC (SUB : 1)                        
LRM012              END-IF                                                      
LRM012              IF TWA-MDESC2(SUB : 1) < ' '                                
LRM012                 MOVE SPACE TO TWA-MDESC2 (SUB : 1)                       
LRM012              END-IF                                                      
LRM012              IF TWA-MDESC3(SUB : 1) < ' '                                
LRM012                 MOVE SPACE TO TWA-MDESC3 (SUB : 1)                       
LRM012              END-IF                                                      
LRM012           END-PERFORM.                                                   
                                                                                
   ****** ON ASSET KEY CHANGE, MAKE SURE THE TARGET ASSET KEY IS NOT            
   ****** ALREADY ON FILE:                                                      
              IF NOT INPUT-ERROR                                                
              AND (TWA-MSECR NOT = TWA-ORIG-MSECR                               
                OR TWA-MSLOC NOT =  TWA-ORIG-SLOC                               
                OR TWA-MTYPE NOT =  TWA-ORIG-MTYPE)                             
                  MOVE 'A' TO TWA-SECR-ACTION                                   
                  PERFORM READ-ASSET-RTN                                        
                  IF ACAT33IO-ASSET-FOUND                                       
                     MOVE ATT-UNPROT-BRT TO MSECRA                              
                                            MSLOCA                              
                                            MTYPEA                              
                     IF NOT INPUT-ERROR                                         
                        MOVE -1 TO MSECRL                                       
                        MOVE                                                    
              'ASSET KEYS SECR/LOC/TYPE ALREADY EXISTS; DELETE FIRST'           
                            TO SYSTEM-MSG                                       
                        SET INPUT-ERROR TO TRUE                                 
                     END-IF                                                     
           END-IF.                                                              
                                                                                
           MOVE ATT-UNPROT TO MAMTA.                                            
           IF TWA-MAMT NOT GREATER SPACES                                       
              MOVE ATT-UNPROT-BRT TO MAMTA                                      
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MAMTL                                               
                 SET INPUT-ERROR TO TRUE                                        
                 MOVE 'AMOUNT FIELD IS REQUIRED'                                
                             TO SYSTEM-MSG                                      
              END-IF                                                            
           ELSE                                                                 
              PERFORM EDIT-AMT-RTN                                              
           END-IF.                                                              
                                                                                
           MOVE ATT-UNPROT TO MDESC2A                                           
                              MDESC3A                                           
                              CAGETAGA.                                         
                                                                                
           IF TWA-MSUBM = 'Y'                                                   
           AND TWA-FUND-ACCOUNT-NBR NOT > SPACES                                
              SET ACAT33IO-COUNT-ASSETS-W-FNBR TO TRUE                          
              MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR                     
              MOVE TWA-CONTROL-NBR   TO ACAT33IO-CONTROL-NBR                    
              MOVE TWA-DB2-STTLM-DT  TO ACAT33IO-STTLM-DT               02030002
              MOVE TWA-MCBRKR        TO ACAT33IO-RCV-NBR                        
              MOVE TWA-MCACCT        TO ACAT33IO-RCV-ACCT                       
              MOVE ACAT-ADP-BROKER   TO ACAT33IO-DLVR-NBR                       
              MOVE TWA-MBR           TO ACAT33IO-DLVR-ACCT                      
              MOVE TWA-MAC           TO ACAT33IO-DLVR-ACCT(4 : 5)               
              MOVE 'MFC'             TO ACAT33IO-TRNFR-TYPE-CD                  
              PERFORM LINK-TO-ACAT33IO-RTN                                      
              IF ACAT33IO-ASSET-W-FUND-NBR NOT > ZEROS                          
                 MOVE ATT-UNPROT-BRT TO MSUBMA                                  
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MSUBML                                           
                    MOVE 'SUBMIT NOT ALLOWED; NO ASSETS HAVE FUND NBR'          
                             TO SYSTEM-MSG                                      
                    MOVE ACAT33IO-ASSET-TOTAL-COUNT TO WS-ASSET-ED              
                    MOVE WS-ASSET-X TO SYSTEM-MSG(45 : 4)                       
                    SET INPUT-ERROR TO TRUE.                                    
      *                                                                         
       SKIP-ASSET-EDIT.                                                         
   ****** ASSURE AT LEAST ONE ASSET RECORD EXISTS.                              
           IF TWA-MDESC(1 : 1) NOT > SPACES                                     
           OR TWA-MSECR NOT GREATER SPACES                                      
              MOVE SPACES         TO MSECRO                                     
              MOVE ATT-UNPROT-BRT TO MSECRA                                     
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MSECRL                                              
                 MOVE 'AT LEAST ONE ASSET IS REQUIRED ON TIF'                   
                    TO SYSTEM-MSG                                               
                 SET INPUT-ERROR TO TRUE                                        
              END-IF.                                                           
                                                                                
           IF TWA-ACTION = '6'                                                  
              PERFORM ASKIP-MAP-RTN                                             
              MOVE 'TIF DISPLAYED FROM ACTIVE TABLE'  TO SYSTEM-MSG             
              MOVE -1 TO MBRL                                                   
           ELSE                                                                 
           IF TWA-ACTION = 'B' OR 'R'                                           
           OR NOT ACAT-SIGN-ON-UPDATE                                           
              PERFORM ASKIP-MAP-RTN                                             
              MOVE 'TIF DISPLAYED / BROWSE ONLY'  TO SYSTEM-MSG                 
              MOVE -1 TO MBRL                                                   
           ELSE                                                                 
           IF EIBAID = DFHPF2                                                   
              MOVE 'PLEASE ENTER NEW TIF' TO SYSTEM-MSG                         
              IF TWA-MBR  > SPACES                                      CAT513  
                 MOVE -1 TO MCBRKRL                                     02030002
              ELSE                                                              
                 MOVE -1 TO MBRL                                                
              END-IF                                                            
           ELSE                                                                 
           IF EIBAID = DFHPF5                                                   
              MOVE -1 TO MSECRL                                                 
              MOVE 'PLEASE ENTER NEXT ASSET' TO SYSTEM-MSG                      
           ELSE                                                                 
           IF NOT INPUT-ERROR                                                   
           AND SYSTEM-MSG = SPACES                                              
           AND EIBAID = DFHENTER                                                
              MOVE 'NO ERRORS FOUND' TO SYSTEM-MSG                              
              MOVE -1 TO MNAMEL.                                                
                                                                                
            IF (TWA-ACTION = 'A' OR 'C')                                        
            AND TWA-APPROVAL-AUTH                                               
               MOVE ATT-UNPROT TO MSUBMA                                        
            ELSE                                                                
               MOVE ATT-ASKIP TO MSUBMA                                         
            END-IF.                                                             
       PROCESS-MAP-ITEMS-EXIT. EXIT.                                            
                                                                                
ET0001 DATE-FORMAT-CHECK.                                                       
           MOVE SPACE TO WS-VALID-DATE-SW.                                      
           MOVE TWA-RE-REGIST-DATE  TO WS-MDY-DATE.                             
           IF WS-MMDDYY IS NUMERIC                                              
              MOVE WS-MDY-MM  TO WS-REG-MM                                      
              MOVE WS-MDY-DD  TO WS-REG-DD                                      
              MOVE WS-MDY-YY  TO WS-REG-YY                                      
              MOVE '/'        TO WS-REG-SLASH1 WS-REG-SLASH2                    
           ELSE                                                                 
              MOVE TWA-RE-REGIST-DATE  TO WS-REG-DATE                           
           END-IF.                                                              
                                                                                
           IF  WS-REG-MM IS NUMERIC                                             
           AND WS-REG-DD IS NUMERIC                                             
           AND WS-REG-YY IS NUMERIC                                             
              IF  WS-REG-SLASH1 = '/'                                           
              AND WS-REG-SLASH2 = '/'                                           
                  PERFORM RE-REGIST-DATE-CHECK                                  
              ELSE                                                              
                  MOVE ATT-UNPROT-BRT TO MREGDTA                                
                  MOVE -1 TO MREGDTL                                            
                  IF NOT INPUT-ERROR                                            
                     SET INPUT-ERROR TO TRUE                                    
                     MOVE 'INVALID DATE FORMAT (MMDDYY OR MM/DD/YY)'            
                       TO  SYSTEM-MSG                                           
                  END-IF                                                        
              END-IF                                                            
           ELSE                                                                 
              MOVE ATT-UNPROT-BRT TO MREGDTA                                    
              MOVE -1 TO MREGDTL                                                
              IF NOT INPUT-ERROR                                                
                 SET INPUT-ERROR TO TRUE                                        
                 MOVE 'INVALID DATE FORMAT (MMDDYY OR MM/DD/YY)'                
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF WS-VALID-DATE                                                     
              MOVE WS-REG-DATE TO TWA-RE-REGIST-DATE                            
                                  MREGDTO                                       
           END-IF.                                                              
                                                                                
ET0001 RE-REGIST-DATE-CHECK.                                                    
           MOVE SPACE TO WS-LEAP-YEAR-SW.                                       
                                                                                
           DIVIDE WS-REG-YY-N BY 4                                              
                  GIVING WS-DIVIDED REMAINDER WS-REMAIN.                        
           IF WS-REMAIN = 0                                                     
              SET WS-LEAP-YEAR TO TRUE                                          
           END-IF.                                                              
                                                                                
           IF (WS-REG-MM = '01' OR '03' OR '05' OR '07'                         
                       OR '08' OR '10' OR '12')                                 
              IF (WS-REG-DD > '00' AND WS-REG-DD < '32')                        
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO MREGDTA                                 
                 MOVE -1 TO MREGDTL                                             
                 IF NOT INPUT-ERROR                                             
                    SET INPUT-ERROR TO TRUE                                     
                    MOVE 'INVALID RE-REGISTRATION DATE'                         
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
           IF (WS-REG-MM = '04' OR '06' OR '09' OR '11')                        
              IF (WS-REG-DD > '00' AND WS-REG-DD < '31')                        
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO MREGDTA                                 
                 MOVE -1 TO MREGDTL                                             
                 IF NOT INPUT-ERROR                                             
                    SET INPUT-ERROR TO TRUE                                     
                    MOVE 'INVALID RE-REGISTRATION DATE'                         
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
           IF WS-REG-MM = '02'                                                  
              IF WS-LEAP-YEAR                                                   
                 IF (WS-REG-DD > '00' AND WS-REG-DD < '30')                     
                    CONTINUE                                                    
                 ELSE                                                           
                    MOVE ATT-UNPROT-BRT TO MREGDTA                              
                    MOVE -1 TO MREGDTL                                          
                    IF NOT INPUT-ERROR                                          
                       SET INPUT-ERROR TO TRUE                                  
                       MOVE 'INVALID RE-REGISTRATION DATE'                      
                         TO  SYSTEM-MSG                                         
                    END-IF                                                      
                 END-IF                                                         
              ELSE                                                              
                 IF WS-REG-DD > '00' AND WS-REG-DD < '29'                       
                    CONTINUE                                                    
                 ELSE                                                           
                    MOVE ATT-UNPROT-BRT TO MREGDTA                              
                    MOVE -1 TO MREGDTL                                          
                    IF NOT INPUT-ERROR                                          
                       SET INPUT-ERROR TO TRUE                                  
                       MOVE 'INVALID RE-REGISTRATION DATE'                      
                         TO  SYSTEM-MSG                                         
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              MOVE ATT-UNPROT-BRT TO MREGDTA                                    
              MOVE -1 TO MREGDTL                                                
              IF NOT INPUT-ERROR                                                
                 SET INPUT-ERROR TO TRUE                                        
                 MOVE 'INVALID RE-REGISTRATION DATE'                            
                   TO  SYSTEM-MSG                                               
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF NOT INPUT-ERROR                                                   
              IF WS-REG-YY > '00'                                               
                 SET WS-VALID-DATE TO TRUE                                      
              ELSE                                                              
                 MOVE ATT-UNPROT-BRT TO MREGDTA                                 
                 MOVE -1 TO MREGDTL                                             
                 IF NOT INPUT-ERROR                                             
                    SET INPUT-ERROR TO TRUE                                     
                    MOVE 'YEAR MUST BE GREATER 2000'                            
                      TO  SYSTEM-MSG                                            
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
       SIGNON-SECR-CHECK-RTN.                                                   
           SET SECURITY-LOOKUP TO TRUE.                                         
           EXEC CICS LINK PROGRAM (WS-ACATSRCH)                         02890002
                COMMAREA(ACAT-SRCH-COMM-AREA)                           02900002
                LENGTH(LENGTH OF ACAT-SRCH-COMM-AREA)                   02910002
           END-EXEC.                                                    02920002
                                                                                
       JUSTIFY-LEFT-MCACCT.                                                     
           MOVE 1 TO SUB SUB2.                                                  
           MOVE SPACES TO WS-MCACCT.                                            
           PERFORM UNTIL SUB GREATER 20                                         
              IF TWA-MCACCT(SUB : 1) NOT = SPACES AND LOW-VALUES                
                 IF ((TWA-MCACCT(SUB : 1) >= 'A' AND <= 'Z')                    
                  OR (TWA-MCACCT(SUB : 1) >= '0' AND <= '9'))                   
                    MOVE TWA-MCACCT(SUB : 1) TO WS-MCACCT(SUB2 : 1)             
                    ADD 1 TO SUB2                                               
                 ELSE                                                           
                    SET MCACCT-ERROR TO TRUE                                    
                    MOVE 20 TO SUB                                              
                 END-IF                                                         
              END-IF                                                            
              ADD 1 TO SUB                                                      
           END-PERFORM.                                                         
                                                                                
           IF NOT MCACCT-ERROR                                                  
              MOVE WS-MCACCT TO TWA-MCACCT.                                     
                                                                                
       SSN-EDIT-RTN.                                                            
           IF (WS-SSN-EDIT(1 : 3) NUMERIC                                       
           AND WS-SSN-EDIT(4 : 1) = '-'                                         
           AND WS-SSN-EDIT(7 : 1) = '-'                                         
           AND WS-SSN-EDIT(5 : 2) NUMERIC                                       
           AND WS-SSN-EDIT(8 : 4) NUMERIC)                                      
              SET SSN-VALID TO TRUE                                             
           ELSE                                                                 
           IF (WS-SSN-EDIT(1 : 9) NUMERIC                                       
           AND WS-SSN-EDIT(10 : 2) = SPACES)                                    
              MOVE WS-SSN-EDIT(8 : 2) TO WS-SSN-EDIT(10 : 2)                    
              MOVE WS-SSN-EDIT(6 : 2) TO WS-SSN-EDIT(8 : 2)                     
              MOVE WS-SSN-EDIT(5 : 1) TO WS-SSN-EDIT(6 : 1)                     
              MOVE WS-SSN-EDIT(4 : 1) TO WS-SSN-EDIT(5 : 1)                     
              MOVE '-'                TO WS-SSN-EDIT(4 : 1)                     
                                         WS-SSN-EDIT(7 : 1)                     
              SET SSN-VALID TO TRUE                                             
           ELSE                                                                 
              SET SSN-INVALID TO TRUE                                           
           END-IF.                                                              
                                                                                
       EDIT-QTY-RTN.                                                            
           MOVE TWA-MQTY  TO WK-QTY-IN                                          
           EXEC CICS LINK PROGRAM(WS-EDITMOD)                                   
                       COMMAREA(EDIT-QTY-AREA)                                  
                       LENGTH(LENGTH OF EDIT-QTY-AREA)                          
           END-EXEC                                                             
           IF WK-QTY-RET-CODE = SPACE                                           
              MOVE WK-QTY-OUT TO WS-MQTY-ED-D5 TWA-MQTY-9                       
              MOVE WS-MQTY-AREA TO MQTYO TWA-ORIG-MQTY                          
              IF WK-QTY-OUT LESS ZERO                                           
                 MOVE ATT-UNPROT-BRT TO MQTYA                                   
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MQTYL                                            
                    SET INPUT-ERROR TO TRUE                                     
                    MOVE 'QTY FIELD MUST BE POSITIVE'  TO SYSTEM-MSG            
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              MOVE ATT-UNPROT-BRT TO MQTYA                                      
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MQTYL                                               
                 SET INPUT-ERROR TO TRUE                                        
                 MOVE 'QTY FIELD IS INVALID' TO SYSTEM-MSG                      
           END-IF.                                                              
                                                                                
       EDIT-AMT-RTN.                                                            
           MOVE TWA-MAMT  TO WK-AMT-IN                                          
           EXEC CICS LINK PROGRAM(WS-EDITMOD)                                   
                       COMMAREA(EDIT-AMT-AREA)                                  
                       LENGTH(LENGTH OF EDIT-AMT-AREA)                          
           END-EXEC                                                             
           IF WK-AMT-RET-CODE = SPACE                                           
              MOVE WK-AMT-OUT    TO WS-MQTY-ED-D2  TWA-MAMT-9                   
              MOVE WS-MQTY-AREA TO MAMTO TWA-ORIG-MAMT                          
LRM001        IF WK-AMT-OUT LESS .00                                            
                 MOVE ATT-UNPROT-BRT TO MAMTA                                   
                 IF NOT INPUT-ERROR                                             
                    MOVE -1 TO MAMTL                                            
                    SET INPUT-ERROR TO TRUE                                     
LRM001              MOVE 'AMOUNT FIELD MUST BE POSITIVE OR ZERO'                
LRM001************  MOVE 'AMOUNT FIELD MUST BE POSITIVE'                        
                                TO SYSTEM-MSG                                   
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              MOVE ATT-UNPROT-BRT TO MAMTA                                      
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MAMTL                                               
                 SET INPUT-ERROR TO TRUE                                        
                 MOVE 'AMOUNT FIELD IS INVALID'                                 
                             TO SYSTEM-MSG                                      
           END-IF.                                                              
                                                                                
       SET-CUST-TYPE-B1-DEFAULT-RTN.                                            
           MOVE TWA-CLIENT-NO   TO B1-CLIENT-NO B1-CLIENT.              03580002
           MOVE 434531          TO B1-CARD-NO.                          03590002
           PERFORM READ-B1-RTN.                                         03600002
           IF EIBRESP  = +0                                             03610002
           AND B1-RETURN-VALUE(1 : 2) GREATER SPACES                            
               MOVE B1-RETURN-VALUE(1 : 2) TO TWA-MCTYPE                        
                                        BH-ACAT-DEFAULT-CUSTOMER-TYPE           
           END-IF.                                                              
           IF  BH-ACAT-DEFAULT-CUSTOMER-TYPE > ' '                      CAT513  
               MOVE BH-ACAT-DEFAULT-CUSTOMER-TYPE TO TWA-MCTYPE         CAT513  
           ELSE                                                         CAT513  
               MOVE 'SN'                          TO TWA-MCTYPE         CAT513  
           END-IF.                                                      CAT513  
                                                                        CAT513  
***********PERFORM 5314-CHECK-RETIRE-RANGE THRU 5314-EXIT.              CAT513  
                                                                        CAT513  
           PERFORM 5315-CHECK-IRA-BR-RANGE THRU 5315-EXIT.              CAT513  
           IF  W-IRA-BR-RANGE-SW = 'Y'                                  CAT513  
               CONTINUE                                                 CAT513  
           ELSE                                                         CAT513  
               PERFORM 5316-CHECK-IRA-BR-ACT-RANGE THRU 5316-EXIT       CAT513  
           END-IF.                                                      CAT513  
                                                                                
           MOVE 434534          TO B1-CARD-NO.                          03590002
           MOVE ZERO TO EIBRESP.                                        03610002
           MOVE 1 TO B1-SEQUENCE.                                       00630002
           PERFORM UNTIL EIBRESP NOT = ZERO                                     
                    OR B1-SEQUENCE > 39                                 CAT513  
              PERFORM READ-B1-RTN                                       03600002
              IF EIBRESP  = +0                                          03610002
                 IF B1-RETURN-VALUE(1 : 1) GREATER SPACES                       
                    ADD 1 TO BH-ACAT-RETIRE-ACT-SUB-CTG-NO              CAT513  
                    MOVE B1-RETURN-VALUE(1 : 4) TO                              
                         BH-ACAT-RETIRE-ACT-SUB-CTG-ENT(B1-SEQUENCE)    BHACAT  
                 END-IF                                                         
                 ADD 1 TO B1-SEQUENCE                                   00630002
              END-IF                                                            
           END-PERFORM.                                                 BHACAT  
           MOVE 1 TO B1-SEQUENCE.                                       00630002
                                                                                
           MOVE 434504          TO B1-CARD-NO.                          03590002
           PERFORM READ-B1-RTN.                                         03600002
           IF EIBRESP  = +0                                             03610002
           AND B1-RETURN-VALUE(1 : 1) GREATER SPACES                            
               MOVE B1-RETURN-VALUE(1 : 1) TO                                   
                   BH-ACAT-DEFINE-CUSTOMER-TYPE                         CAT513  
           END-IF.                                                              
                                                                                
           IF  BH-ACAT-RETIRE-ACT-SUB-CTG-NO > 0                        CAT513  
           AND ACATNAIO-IRA > ' '                                       CAT513  
               PERFORM 5311-EDIT-IRA-IND THRU 5311-EXIT                 CAT513  
           ELSE                                                         CAT513  
LRM010         PERFORM 5312-LOAD-CLASS-CODE-B1                                  
               IF  BH-ACAT-DEFINE-CUSTOMER-TYPE = '0'                   CAT513  
                   PERFORM 5312-EDIT-CLASS-CODE THRU 5312-EXIT          CAT513  
               ELSE                                                     CAT513  
                   IF  BH-ACAT-DEFINE-CUSTOMER-TYPE = '1'               CAT513  
                       PERFORM 5313-EDIT-ADT-CUST-TYPE THRU 5313-EXIT   CAT513  
                   END-IF                                               CAT513  
               END-IF                                                   CAT513  
           END-IF.                                                      CAT513  
                                                                        CAT513  
                                                                        CAT513  
       5311-EDIT-IRA-IND.                                               CAT513  
           MOVE 434534          TO B1-CARD-NO.                          03590002
           MOVE ZERO TO EIBRESP.                                        03610002
           MOVE 1 TO B1-SEQUENCE.                                       00630002
           PERFORM UNTIL EIBRESP NOT = ZERO                                     
                    OR B1-SEQUENCE > 39                                 CAT513  
              PERFORM READ-B1-RTN                                       03600002
              IF EIBRESP  = +0                                          03610002
                 ADD 1 TO BH-ACAT-RETIRE-ACT-SUB-CTG-NO                 CAT513  
                 MOVE B1-RETURN-VALUE(1 : 4) TO                                 
                        BH-ACAT-RETIRE-ACT-SUB-CTG-ENT(B1-SEQUENCE)     BHACAT  
                 ADD 1 TO B1-SEQUENCE                                   00630002
              END-IF                                                            
           END-PERFORM.                                                 BHACAT  
           MOVE 1 TO B1-SEQUENCE.                                       00630002
                                                                                
           MOVE 'N' TO W-IRA-B1-SW.                                     CAT513  
           MOVE 1 TO W-SUB1.                                            CAT513  
       5311-LOOP.                                                       CAT513  
           IF  BH-ACAT-RETIRE-ACT-IRA-CODE (W-SUB1) = ' '               CAT513  
               GO TO 5311-EXIT                                          CAT513  
           END-IF                                                       CAT513  
           IF  BH-ACAT-RETIRE-ACT-IRA-CODE (W-SUB1) =                   CAT513  
                                             ACATNAIO-IRA               CAT513  
               MOVE BH-ACAT-RETIRE-ACT-CUST-TYPE (W-SUB1)               CAT513  
                                             TO TWA-MCTYPE              CAT513  
               MOVE 'Y' TO W-IRA-B1-SW                                  CAT513  
           END-IF                                                       CAT513  
           IF  W-SUB1 < BH-ACAT-RETIRE-ACT-SUB-CTG-NO                   CAT513  
               ADD 1 TO W-SUB1                                          CAT513  
               GO TO 5311-LOOP                                          CAT513  
           END-IF.                                                      CAT513  
                                                                        CAT513  
       5311-EXIT. EXIT.                                                 CAT513  
      /                                                                 CAT513  
LRM010 5312-LOAD-CLASS-CODE-B1.                                                 
           MOVE 434535          TO B1-CARD-NO.                          03590002
           MOVE ZERO TO EIBRESP.                                        03610002
           MOVE 1 TO B1-SEQUENCE.                                       00630002
           PERFORM UNTIL EIBRESP NOT = ZERO                                     
                    OR B1-SEQUENCE > 99                                 BHACAT  
              PERFORM READ-B1-RTN                                       03600002
              IF EIBRESP  = +0                                          03610002
                 ADD 1 TO B1-SEQUENCE                                           
LRM004           IF B1-RETURN-VALUE(1 : 3) > SPACES                     CAT513  
                    ADD 1 TO  BH-ACAT-CUST-TYPE-VALUE-NO                        
                    MOVE B1-RETURN-VALUE(1 : 6) TO                      BHACAT  
                        BH-ACAT-CUST-TYPE-VALUE-ENTRY(B1-SEQUENCE)      00630002
LRM004           END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                 BHACAT  
           MOVE 1 TO B1-SEQUENCE.                                       00630002
                                                                        CAT513  
       5312-EDIT-CLASS-CODE.                                            CAT513  
           MOVE 'N' TO W-CLASS-CODE-B1-SW.                              CAT513  
           MOVE 1 TO W-SUB1.                                            CAT513  
       5312-LOOP.                                                       CAT513  
           IF  W-SUB1 > BH-ACAT-CUST-TYPE-VALUE-NO                      CAT513  
           OR  BH-ACAT-CUST-TYPE-FROM-NA (W-SUB1) = ' '                 CAT513  
           OR  W-CLASS-CODE-B1-SW  = 'Y'                                CAT513  
               GO TO 5312-EXIT                                          CAT513  
           END-IF                                                       CAT513  
           IF  BH-ACAT-CUST-TYPE-FROM-NA (W-SUB1)                       CAT513  
                                           = ACATNAIO-ACCT-CLASS-EXP    CAT513  
               MOVE BH-ACAT-CUST-ACCT-TYPE (W-SUB1)                     CAT513  
                                                 TO TWA-MCTYPE          CAT513  
               MOVE 'Y' TO W-CLASS-CODE-B1-SW                           CAT513  
LRM010         GO TO 5312-EXIT                                                  
           END-IF                                                       CAT513  
           IF  W-SUB1 < BH-ACAT-CUST-TYPE-VALUE-NO                      CAT513  
           AND W-CLASS-CODE-B1-SW NOT = 'Y'                             CAT513  
               ADD 1 TO W-SUB1                                          CAT513  
               GO TO 5312-LOOP                                          CAT513  
           END-IF.                                                      CAT513  
                                                                        CAT513  
       5312-EXIT. EXIT.                                                 CAT513  
      /                                                                 CAT513  
       5313-EDIT-ADT-CUST-TYPE.                                         CAT513  
                                                                        CAT513  
LRM010     IF BH-ACAT-CUST-TYPE-VALUE-NO = 0                                    
              EVALUATE ACATNAIO-ADT-CUSTOMER-TYPE                       CAT513  
                    WHEN  000     CONTINUE                              CAT513  
                    WHEN  001     MOVE 'TR' TO TWA-MCTYPE               CAT513  
                    WHEN  003     MOVE 'CU' TO TWA-MCTYPE               CAT513  
                    WHEN  004     MOVE 'CO' TO TWA-MCTYPE               CAT513  
                    WHEN  008     MOVE 'SN' TO TWA-MCTYPE               CAT513  
                    WHEN  011     MOVE 'JT' TO TWA-MCTYPE               CAT513  
                    WHEN  012     MOVE 'JT' TO TWA-MCTYPE               CAT513  
                    WHEN  013     MOVE 'AG' TO TWA-MCTYPE               CAT513  
                    WHEN  015     MOVE 'QP' TO TWA-MCTYPE               CAT513  
                    WHEN  018     MOVE 'TR' TO TWA-MCTYPE               CAT513  
                    WHEN  021     MOVE '21' TO TWA-MCTYPE               CAT513  
                    WHEN OTHER    MOVE 'OT' TO TWA-MCTYPE               CAT513  
              END-EVALUATE                                              CAT513  
LRM010        GO TO 5313-EXIT                                                   
LRM010     END-IF.                                                              
LRM010                                                                          
LRM010     MOVE 'N' TO W-CUST-TYPE-B1-SW.                                       
LRM010     MOVE 1 TO W-SUB1.                                                    
LRM010     MOVE ACATNAIO-ADT-CUSTOMER-TYPE TO W-ADT-CUSTOMER-TYPE-9.            
LRM010 5313-LOOP.                                                               
LRM010     IF  BH-ACAT-CUST-TYPE-FROM-NA (W-SUB1) = ' '                         
LRM010         GO TO 5313-EXIT                                                  
LRM010     END-IF                                                               
LRM010     IF  BH-ACAT-CUST-TYPE-FROM-NA (W-SUB1)                               
LRM010                               =  W-ADT-CUSTOMER-TYPE                     
LRM010         MOVE BH-ACAT-CUST-ACCT-TYPE (W-SUB1)                             
LRM010                                           TO TWA-MCTYPE                  
LRM010         MOVE 'Y' TO W-CUST-TYPE-B1-SW                                    
LRM010         GO TO 5313-EXIT                                                  
LRM010     END-IF                                                               
LRM010     IF  W-SUB1 < BH-ACAT-CUST-TYPE-VALUE-NO                              
LRM010         ADD 1 TO W-SUB1                                                  
LRM010         GO TO 5313-LOOP                                                  
LRM010     END-IF.                                                              
LRM010                                                                          
                                                                        CAT513  
       5313-EXIT. EXIT.                                                 CAT513  
      /                                                                 CAT513  
       5315-CHECK-IRA-BR-RANGE.                                         CAT513  
           MOVE 009125          TO B1-CARD-NO.                          03590002
           MOVE ZERO TO EIBRESP.                                        03610002
           MOVE 1 TO B1-SEQUENCE.                                       00630002
           PERFORM UNTIL EIBRESP NOT = ZERO                                     
                    OR B1-SEQUENCE > 49                                 BHACAT  
              PERFORM READ-B1-RTN                                       03600002
              IF EIBRESP  = +0                                          03610002
                 IF B1-RETURN-VALUE(1 : 3) > SPACES                             
                    ADD 1 TO BH-MGCA-IRA-BR-RANGE-NO                    CAT513  
                    MOVE B1-RETURN-VALUE(1 : 7) TO                              
                        BH-MGCA-IRA-BR-RANGE-ENTRY(B1-SEQUENCE)         BHMGCA  
                    ADD 1 TO B1-SEQUENCE                                00630002
                 ELSE                                                           
                    MOVE +13 TO EIBRESP                                         
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                 BHACAT  
           MOVE 1 TO B1-SEQUENCE.                                       00630002
                                                                        CAT513  
           MOVE 'N' TO W-IRA-BR-RANGE-SW.                               CAT513  
           IF  BH-MGCA-IRA-BR-RANGE-NO = 0                              CAT513  
               GO TO 5315-EXIT.                                         CAT513  
           MOVE 1 TO W-SUB1.                                            CAT513  
       5315-LOOP.                                                       CAT513  
           IF  TWA-MBR  >= BH-MGCA-IRA-BR-RANGE-LO (W-SUB1) AND         CAT513  
               TWA-MBR  <= BH-MGCA-IRA-BR-RANGE-HI (W-SUB1)             CAT513  
               MOVE 'IR'  TO TWA-MCTYPE                                 CAT513  
               MOVE 'Y' TO W-IRA-BR-RANGE-SW                            CAT513  
***************DISPLAY*'***IRA-BR*FOUND*'*******************************CAT513  
*********************'*LO='*BH-MGCA-IRA-BR-RANGE-LO*(W-SUB1)************CAT513  
*********************'*HI='*BH-MGCA-IRA-BR-RANGE-HI*(W-SUB1)************CAT513  
           ELSE                                                         CAT513  
               IF  W-SUB1 < BH-MGCA-IRA-BR-RANGE-NO                     CAT513  
                   ADD 1 TO W-SUB1                                      CAT513  
               GO TO 5315-LOOP                                          CAT513  
           END-IF.                                                      CAT513  
                                                                        CAT513  
       5315-EXIT. EXIT.                                                 CAT513  
      /                                                                 CAT513  
       5316-CHECK-IRA-BR-ACT-RANGE.                                     CAT513  
           MOVE 009126          TO B1-CARD-NO.                          03590002
           MOVE ZERO TO EIBRESP.                                        03610002
           MOVE 1 TO B1-SEQUENCE.                                       00630002
           PERFORM UNTIL EIBRESP NOT = ZERO                                     
                    OR B1-SEQUENCE > 49                                 BHACAT  
              PERFORM READ-B1-RTN-LONG                                  03600002
              IF EIBRESP  = +0                                          03610002
                 IF B1-RETURN-VALUE(1 : 3) > SPACES                             
                    ADD 1 TO BH-MGCA-IRA-BR-ACT-RANGE-NO                BHMGCA  
                    MOVE B1-RETURN-VALUE(1 : 19) TO                             
                        BH-MGCA-IRA-BR-ACT-RANGE-ENTRY(B1-SEQUENCE)     BHMGCA  
                    ADD 1 TO B1-SEQUENCE                                00630002
                 ELSE                                                           
                    MOVE +13 TO EIBRESP                                         
                 END-IF                                                         
              END-IF                                                            
           END-PERFORM.                                                 BHACAT  
           MOVE 1 TO B1-SEQUENCE.                                       00630002
                                                                        CAT513  
           MOVE 'N' TO W-IRA-BR-ACT-RANGE-SW.                           CAT513  
           IF  BH-MGCA-IRA-BR-ACT-RANGE-NO = 0                          CAT513  
               GO TO 5316-EXIT.                                         CAT513  
           MOVE 1 TO W-SUB1.                                            CAT513  
       5316-LOOP.                                                       CAT513  
           IF  (TWA-MBR >= BH-MGCA-IRA-BR-ACT-BR-LO (W-SUB1) AND        CAT513  
                TWA-MBR <= BH-MGCA-IRA-BR-ACT-BR-HI (W-SUB1))           CAT513  
           AND (TWA-MAC >= BH-MGCA-IRA-BR-ACT-ACT-LO (W-SUB1) AND       CAT513  
                TWA-MAC <= BH-MGCA-IRA-BR-ACT-ACT-HI (W-SUB1))          CAT513  
                  MOVE 'IR'  TO TWA-MCTYPE                              CAT513  
                  MOVE 'Y' TO W-IRA-BR-ACT-RANGE-SW                     CAT513  
******************DISPLAY*'***IRA-BR-ACT*FOUND*'************************CAT513  
*********************'*LO='*BH-MGCA-IRA-BR-ACT-BR-LO*(W-SUB1)***********CAT513  
*********************'*HI='*BH-MGCA-IRA-BR-ACT-BR-HI*(W-SUB1)***********CAT513  
*********************'*LO='*BH-MGCA-IRA-BR-ACT-ACT-LO*(W-SUB1)**********CAT513  
*********************'*HI='*BH-MGCA-IRA-BR-ACT-ACT-HI*(W-SUB1)**********CAT513  
           ELSE                                                         CAT513  
               IF  W-SUB1 < BH-MGCA-IRA-BR-ACT-RANGE-NO                 CAT513  
                   ADD 1 TO W-SUB1                                      CAT513  
               GO TO 5316-LOOP                                          CAT513  
           END-IF.                                                      CAT513  
                                                                        CAT513  
       5316-EXIT. EXIT.                                                 CAT513  
                                                                                
       CHECK-ISIN-RESTRICTIONS-RTN.                                             
           SET ACATRSIO-VERIFY-ISIN-SEC TO TRUE.                                
           SET ACATRSIO-DELIVERER TO TRUE.                                      
           MOVE TWA-CLIENT-NO-X TO ACATRSIO-CLIENT-NBR.                         
           MOVE TWA-MSECR       TO ACATRSIO-ISIN-SEC.                           
           MOVE TWA-ADP-NBR     TO ACATRSIO-ADP-NBR.                            
           MOVE TWA-MCBRKR      TO ACATRSIO-BRKR-CONTRA-NBR.                    
           PERFORM LINK-TO-ACATRSTIO-RTN.                                       
           IF ACATRSIO-DB2-ERROR                                                
              MOVE 'RSS-RD'          TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACATRSIO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACATRSIO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
           IF ACATRSIO-FOUND                                                    
              MOVE ATT-UNPROT-BRT TO MSECRA                                     
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MSECRL                                              
LRM013           MOVE TWA-ADP-NBR TO WS-CUSIP-RESTRICTED-ADP-NO                 
LRM013           MOVE WS-CUSIP-RESTRICTED-MSG                                   
LRM013********     'CUSIP NUMBER FOUND ON RESTRICTED SECURITY TABLE'            
                            TO SYSTEM-MSG                                       
                 SET INPUT-ERROR TO TRUE                                        
              END-IF                                                            
           ELSE                                                                 
           IF ACATRSIO-PRIVATE-RANGE-FOUND                                      
              MOVE ATT-UNPROT-BRT TO MSECRA                                     
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MSECRL                                              
LRM011           MOVE 'BRD SEC NUMBER FOUND ON PRIVATE RANGE FILE'              
                            TO SYSTEM-MSG                                       
                 SET INPUT-ERROR TO TRUE                                        
           END-IF.                                                              
                                                                                
                                                                                
       CHECK-ACCOUNT-RESTRICTIONS-RTN.                                          
           SET ACATRSIO-VERIFY-ACCOUNT TO TRUE.                                 
           MOVE TWA-CLIENT-NO-X TO ACATRSIO-CLIENT-NBR.                         
           MOVE TWA-MBR         TO ACATRSIO-BRANCH.                             
           MOVE TWA-MAC         TO ACATRSIO-ACCOUNT.                            
           PERFORM LINK-TO-ACATRSTIO-RTN.                                       
           IF ACATRSIO-DB2-ERROR                                                
              MOVE 'RSB-RD'          TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACATRSIO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACATRSIO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
           IF ACATRSIO-FOUND                                                    
              MOVE ATT-UNPROT-BRT TO MBRA  MACA                                 
              IF NOT INPUT-ERROR                                                
                 MOVE -1 TO MBRL                                                
LRM011           MOVE 'BRD BRANCH/ACCOUNT IS RESTRICTED'                        
                            TO SYSTEM-MSG                                       
                 SET INPUT-ERROR TO TRUE                                        
              END-IF.                                                           
                                                                                
                                                                                
       SET-DEFAULT-CATEGORY-CODE-RTN.                                           
           IF  ACATMSD-CLASS-CD(1 : 1) = '1'                                    
           AND ACATMSD-DESC(1 : 3) = '***'                                      
              MOVE 'FEQU' TO TWA-MCATGR MCATGRO                                 
           ELSE                                                                 
           IF (ACATMSD-CLASS-CD(1 : 1) = '2' OR '3' OR '4' OR '7')              
           AND ACATMSD-DESC(1 : 3) = '***'                                      
              MOVE 'FDEB' TO TWA-MCATGR MCATGRO                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 1) = '4'                                    
              MOVE 'MUNI' TO TWA-MCATGR MCATGRO                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 1) = '7'                                    
              MOVE 'UIT ' TO TWA-MCATGR MCATGRO                                 
           ELSE                                                                 
           IF (ACATMSD-CLASS-CD(1 : 2) = '29' OR '39' OR '49')                  
              MOVE 'ZERO' TO TWA-MCATGR MCATGRO                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 2) = '27'                                   
           AND (ACATMSD-CLASS-CD(7 : 1) = '5' OR '6' OR '7' OR '9' )            
              MOVE 'CDCP' TO TWA-MCATGR MCATGRO                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 1) = '2'                                    
           AND (ACATMSD-CLASS-CD(7 : 1) = '1' OR '2' OR '3')                    
              MOVE 'MBS ' TO TWA-MCATGR MCATGRO                                 
           ELSE                                                                 
           IF (ACATMSD-CLASS-CD(1 : 1) = '3'                                    
           AND (ACATMSD-CLASS-CD(5 : 3) = '211' OR '711'))                      
           OR (ACATMSD-CLASS-CD(1 : 1) = '2'                                    
           AND (ACATMSD-CLASS-CD(5 : 3) = '210' OR '710'))                      
              MOVE 'GOVT' TO TWA-MCATGR MCATGRO                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 1) = '2'                                    
           AND (ACATMSD-CLASS-CD(4 : 2) NOT = '21' AND '71')                    
           AND (ACATMSD-CLASS-CD(2 : 1) NOT = '9'                               
           AND  ACATMSD-CLASS-CD(5 : 1) NOT = '1')                              
           AND (ACATMSD-CLASS-CD(5 : 3) NOT = '701' AND '702' AND '703')        
              MOVE 'CORP' TO TWA-MCATGR MCATGRO                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 1) = '6'                                    
           AND (ACATMSD-CLASS-CD(7 : 1) = '7' OR '8')                           
              MOVE 'ANNU' TO TWA-MCATGR MCATGRO                                 
           ELSE                                                                 
           IF (ACATMSD-CLASS-CD(1 : 1) = '6'                                    
           AND ACATMSD-CLASS-CD(7 : 1) = '1')                                   
           OR (ACATMSD-CLASS-CD(1 : 1) = '1'                                    
           AND ACATMSD-CLASS-CD(7 : 1) = '1')                                   
              MOVE 'LPAR' TO TWA-MCATGR MCATGRO                                 
           ELSE                                                                 
           IF (ACATMSD-CLASS-CD(1 : 2) = '63')                                  
           AND (ACATMSD-CLASS-CD(7 : 1) NOT = '6')                              
              MOVE 'MFNM' TO TWA-MCATGR MCATGRO                                 
           ELSE                                                                 
           IF (ACATMSD-CLASS-CD(1 : 2) = '63'                                   
           AND  ACATMSD-CLASS-CD(7 : 1) = '6')                                  
              MOVE 'MFMM' TO TWA-MCATGR MCATGRO                                 
           ELSE                                                                 
           IF  ACATMSD-CLASS-CD(1 : 1) = '1'                                    
           OR  (ACATMSD-CLASS-CD(1 : 2) = '65')                                 
              MOVE 'EQU ' TO TWA-MCATGR MCATGRO                                 
           ELSE                                                                 
********     UNDEFINED TEST...                                                  
********      MOVE 'FCUR' TO TWA-MCATGR MCATGRO                                 
********   ELSE                                                                 
********     UNDEFINED TEST...                                                  
********      MOVE 'UARP' TO TWA-MCATGR MCATGRO                                 
********   ELSE                                                                 
********     UNDEFINED TEST...                                                  
********      MOVE 'UDSC' TO TWA-MCATGR MCATGRO                                 
********   ELSE                                                                 
              MOVE 'OTH ' TO TWA-MCATGR MCATGRO                                 
           END-IF.                                                              
                                                                                
062700 EJECT                                                            06080002
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
           MOVE 'Z' TO ACAT-NEXT.                                               
           MOVE ERROR-PROG-MSG    TO SYSTEM-MSG.                                
           MOVE LOW-VALUE TO ACAT33MO.                                          
           MOVE SPACES     TO ACAT-CALLING-PROG-NAME.                           
                                                                                
096300     EJECT                                                        07630002
096400                                                                  07640002
   500 INIT-MAP-RTN.                                                    07650005
096600     MOVE SPACES     TO ACAT33MO                                  07660002
                              TWA-MAP-TABLE.                            02000002
098100     EJECT                                                        07770002
                                                                                
           SKIP3                                                                
       ASKIP-MAP-RTN.                                                           
           MOVE ATT-ASKIP TO MCTYPEA                                            
                             MCBRKRA                                            
                             MCBNAMA                                            
                             MCACCTA                                            
                             MNAMEA                                             
                             MNAME2A                                            
                             MSSNA                                              
                             MSSN2A                                             
                             MACATA                                             
                             MSTATA                                             
                             MSDA                                               
                             MSUBMA                                             
                             MCMNTA.                                            
                                                                                
           PERFORM ASKIP-MAP-SECURITY-SECTION.                                  
                                                                                
       ASKIP-MAP-SECURITY-SECTION.                                              
           MOVE ATT-ASKIP TO MSECRA                                             
                             MCATGRA                                            
                             MSLOCA                                             
                             MFUNDACA                                           
ET0001                       MREGDTA                                            
                             MQTYA                                              
                             MAMTA                                              
                             MCDA                                               
                             MTYPEA                                             
                             MDESCA                                             
                             MDESC2A                                            
                             MDESC3A                                            
                             CAGETAGA.                                          
********                     MACMNTA.                                           
102000 EJECT                                                            07940002
102100                                                                  07950002
103000 SEND-MAP-RETURN.                                                 08040002
           MOVE -1 TO MBRL.                                                     
103600     IF (LINE-COUNT = 0)                                          08120002
103700     AND DATA-ONLY                                                08130002
104000        EVALUATE TRUE                                             08140002
104100           WHEN EIBAID = DFHPA1                                   08150002
104200               SET ALARM-NEEDED TO TRUE                           08160002
104300               MOVE 'BOTTOM OF DATA.         ' TO SYSTEM-MSG      08170002
104400           WHEN EIBAID = DFHPA2                                   08180002
104500               SET ALARM-NEEDED TO TRUE                           08190002
104600               MOVE 'TOP OF DATA.            ' TO SYSTEM-MSG      08200002
104700           WHEN OTHER                                             08210002
104800               PERFORM ACAT-IT-NOT-FOUND-RTN                      08220002
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
           MOVE 'ACAT33FC' TO ACAT-PROGRAM-NAME.                        08340002
106000     PERFORM RETURN-TO-CICS.                                      08350002
106100                                                                  08360002
106200     EJECT                                                        08370002
106100                                                                  08360002
       INIT-MAP-INPUT-AREA.                                                     
           MOVE ACAT-INP-BRANCH      TO MBRO.                                   
           MOVE ACAT-INP-ACCOUNT     TO MACO.                                   
           MOVE TWA-CLIENT-NO-X(2 : 3) TO MCLINBO.                              
029700     MOVE WSTIME            TO MTIMEO.                            02740002
029800     MOVE WSMMDDYY          TO MDATEO.                            02750002
106100                                                                  08360002
106200     EJECT                                                        08370002
106100                                                                  08360002
       ACAT-IT-NOT-FOUND-RTN.                                                   
           IF EIBAID = DFHPF10                                                  
           OR WS-DELETE                                                         
           OR FIRST-TIME                                                        
           OR TWA-INTRAN-BRW                                                    
              MOVE LOW-VALUE TO ACAT33MO                                        
              PERFORM INIT-MAP-RTN                                              
              MOVE LOW-VALUE TO TWA-MAP-TABLE                                   
                                ACAT33MO.                                       
           MOVE SPACES TO TWA-CONTROL-NBR.                                      
                                                                                
           PERFORM INIT-MAP-INPUT-AREA.                                         
           MOVE ATT-UNPROT TO MNEXTA.                                   02480002
           MOVE ATT-UNPROT-BRT TO MBRA                                  02490002
           MOVE -1 TO MBRL                                                      
           IF NOT ACAT-SIGN-ON-UPDATE                                           
              PERFORM ASKIP-MAP-RTN.                                            
           IF WS-DELETE                                                         
              MOVE 'RECORD DELETED / NO RECORDS FOUND' TO TRLMSGO       08220002
           ELSE                                                                 
              MOVE 'NO RECORDS FOUND' TO TRLMSGO.                       08220002
           MOVE ATT-ASKIP-BRT  TO  TRLMSGA                              08280002
           IF FIRST-TIME                                                        
           OR WS-DELETE                                                         
              MOVE 'ACAT33FC' TO ACAT-PROGRAM-NAME                      08340002
              PERFORM SEND-MAP-ERASE                                    08330002
           ELSE                                                                 
              PERFORM SEND-MAP-DATA-ONLY.                                       
                                                                                
           PERFORM WRITE-TSQ-RTN                                        10790002
           PERFORM RETURN-TO-CICS.                                      08350002
                                                                                
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
106500     EXEC CICS SEND MAP('ACAT33M')                                08410002
106600               MAPSET('ACAT33M')                                  08420002
106700               FROM(ACAT33MO)                                     08430002
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
107600         EXEC CICS SEND MAP('ACAT33M')                            08520002
107700                   MAPSET('ACAT33M')                              08530002
107800                   FROM(ACAT33MO)                                 08540002
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
       SEND-POPUP-MAP-RTN.                                                      
                                                                                
           IF TWA-SCREEN NOT = 'A'                                              
           AND EIBAID = DFHPF1                                                  
              IF EIBCPOSN >= 560 AND < 640                                      
                 MOVE '1' TO TWA-SCREEN                                         
              ELSE                                                              
              IF EIBCPOSN >= 640 AND < 720                                      
                 MOVE '2' TO TWA-SCREEN                                         
              ELSE                                                              
              IF EIBCPOSN >= 800 AND < 880                                      
                 MOVE '5' TO TWA-SCREEN                                         
              ELSE                                                              
              IF EIBCPOSN >= 880 AND < 960                                      
                 MOVE 'M' TO TWA-SCREEN                                         
              ELSE                                                              
              IF EIBCPOSN < 1121                                                
                 MOVE 'A' TO TWA-SCREEN                                         
              ELSE                                                              
                 MOVE 'S' TO TWA-SCREEN                                         
           END-IF.                                                              
                                                                                
           MOVE SPACES TO TWA-MCMNT.                                            
           PERFORM WRITE-TSQ-RTN.                                       10790002
           MOVE 'Z' TO ACAT-INP-SEL.                                            
           PERFORM WRITE-ACAT90CM-TS-RTN.                                       
           MOVE '$' TO WS-ACAT-NEXT.                                            
           MOVE 'ACAT90CM' TO CALLED-PROGRAM-NAME.                              
           PERFORM INVOKE-DETAIL-PROGRAM-RTN.                           07225010
                                                                                
       WRITE-ACAT90CM-TS-RTN.                                                   
           IF ACAT-SIGN-ON-UPDATE                                               
           AND (TWA-ACTION = 'A' OR 'C')                                        
              MOVE 'Y' TO TWA-ACAT90CM-UPDATE-IND.                      02030002
                                                                                
           MOVE 'ACA$'   TO TRAN-ID.                                    02410002
           EXEC CICS DELETEQ TS QUEUE(TSQ-NAME)                         10490002
           END-EXEC.                                                    10500002
                                                                        10510002
           MOVE TWA-MAP-TABLE TO ACAT90CM-TS-AREA.                              
           IF TWA-SCREEN = 'A'                                                  
              MOVE TWA-MCCMNT-X120 TO ACAT90CM-TS-MCCMNT-X120                   
           ELSE                                                                 
           IF TWA-SCREEN = '1'                                                  
              MOVE TWA-M1CMNT-X120 TO ACAT90CM-TS-MCCMNT-X120                   
           ELSE                                                                 
           IF TWA-SCREEN = '2'                                                  
              MOVE TWA-M2CMNT-X120 TO ACAT90CM-TS-MCCMNT-X120                   
           ELSE                                                                 
           IF TWA-SCREEN = '5'                                                  
              MOVE TWA-M5CMNT-X120 TO ACAT90CM-TS-MCCMNT-X120                   
           ELSE                                                                 
           IF TWA-SCREEN = 'M'                                                  
              MOVE TWA-MMCMNT-X120 TO ACAT90CM-TS-MCCMNT-X120                   
           ELSE                                                                 
           IF TWA-SCREEN = 'S'                                                  
              MOVE TWA-MSCMNT-X120 TO ACAT90CM-TS-MCCMNT-X120                   
              MOVE TWA-MDESC       TO ACAT90CM-TS-MNAME                         
              MOVE TWA-MDESC2      TO ACAT90CM-TS-MNAME2                        
              MOVE TWA-MDESC3      TO ACAT90CM-TS-MNAME3                        
           END-IF.                                                              
124700     EXEC CICS WRITEQ TS QUEUE(TSQ-NAME)                          10530002
124800                         FROM(ACAT90CM-TS-AREA)                   10540002
124900                         LENGTH(LENGTH OF ACAT90CM-TS-AREA)       10550002
                               ITEM(ITEM-NUM)                           10560002
125000     END-EXEC.                                                    10570002
125100     IF EIBRESP NOT = +0                                          10580002
              MOVE LOW-VALUE TO ACAT33MO                                        
125200        MOVE 'ACAT33 WRITE TSQ ERROR ON ACA$'                     10590002
125300          TO SYSTEM-MSG                                           10600002
125500     END-IF.                                                      10620002
                                                                                
123600 READ-ACAT90CM-TS-RTN.                                            10350002
           MOVE 'ACA$'   TO TRAN-ID.                                    02410002
           EXEC CICS READQ TS QUEUE(TSQ-NAME)                           10360002
                              INTO(ACAT90CM-TS-AREA)                    10370002
                              LENGTH(LENGTH OF ACAT90CM-TS-AREA)        10380002
                              ITEM(ITEM-NUM)                            10390002
124000     END-EXEC.                                                    10400002
125100     IF EIBRESP = +0                                              10410002
              IF ACAT90CM-TS-SCREEN = 'A'                                       
                 MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-MCCMNT-X120                
                 MOVE ACAT90CM-TS-MSUBM       TO TWA-MSUBM                      
              ELSE                                                              
              IF ACAT90CM-TS-SCREEN = '1'                                       
                 MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-M1CMNT-X120                
                 MOVE ACAT90CM-TS-MSUBM       TO TWA-MSUBM                      
              ELSE                                                              
              IF ACAT90CM-TS-SCREEN = '2'                                       
                 MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-M2CMNT-X120                
                 MOVE ACAT90CM-TS-MSUBM       TO TWA-MSUBM                      
              ELSE                                                              
              IF ACAT90CM-TS-SCREEN = '5'                                       
                 MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-M5CMNT-X120                
                 MOVE ACAT90CM-TS-MSUBM       TO TWA-MSUBM                      
              ELSE                                                              
              IF ACAT90CM-TS-SCREEN = 'M'                                       
                 MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-MMCMNT-X120                
                 MOVE ACAT90CM-TS-MSUBM       TO TWA-MSUBM                      
              ELSE                                                              
              IF ACAT90CM-TS-SCREEN = 'S'                                       
                 MOVE ACAT90CM-TS-MCCMNT-X120 TO TWA-MSCMNT-X120                
                 MOVE ACAT90CM-TS-MSUBM       TO TWA-MSUBM                      
              ELSE                                                              
              IF ACAT90CM-TS-SCREEN = 'T'                                       
                 MOVE ACAT90CM-TS-MCTYPE TO TWA-MCTYPE                          
           END-IF.                                                              
           MOVE SPACES   TO TWA-SCREEN.                                         
           MOVE 'ACAX'   TO TRAN-ID.                                    02410002
108300 EJECT                                                            08590002
108400                                                                  08600002
108500 PAGE-FORWARD-RTN.                                                08610002
           MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR.                       
           MOVE TWA-MCBRKR        TO ACAT33IO-RCV-NBR.                          
           MOVE TWA-MCACCT        TO ACAT33IO-RCV-ACCT.                         
           MOVE ACAT-ADP-BROKER   TO ACAT33IO-DLVR-NBR.                         
           MOVE TWA-MBR           TO ACAT33IO-DLVR-ACCT.                        
           MOVE TWA-MAC           TO ACAT33IO-DLVR-ACCT(4 : 5).                 
           MOVE TWA-CURRENT-ASSET-KEY TO ACAT33IO-CURRENT-ASSET-KEY.            
           MOVE TWA-ASSET-SEQ     TO ACAT33IO-ASSET-SEQ-NBR.                    
LRM001     MOVE TWA-VALUE-FREE    TO ACAT33IO-VALUE-FREE.                       
           MOVE TWA-CONTROL-NBR TO ACAT33IO-CONTROL-NBR.                        
                                                                                
           IF TWA-ACTION = '6'                                                  
           OR TWA-ACTIVE-DB = 'Y'                                               
              MOVE -1 TO MACATL                                                 
              MOVE 'MFC'             TO ACAT33IO-TRNFR-TYPE-CD                  
              SET ACAT33IO-IT-READ-NEXTSA TO TRUE                               
           ELSE                                                                 
           IF TWA-ACTIVE-DB = 'H'                                               
              SET ACAT33IO-IT-READ-NEXTHA TO TRUE                               
           ELSE                                                                 
              MOVE 'MFC'             TO ACAT33IO-TRNFR-TYPE-CD                  
              SET ACAT33IO-IT-READ-NEXTS TO TRUE                                
           END-IF.                                                              
           PERFORM LINK-TO-ACAT33IO-RTN.                                        
           IF ACAT33IO-ASSET-NOT-FOUND                                          
              IF EIBAID = DFHPF6 OR DFHPF7                                      
                                                                                
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE 'BOTTOM OF ASSET DATA' TO SYSTEM-MSG                      
                 PERFORM  ERROR-RTN                                     03650002
           ELSE                                                                 
           IF NOT ACAT33IO-ASSET-FOUND                                          
              MOVE LOW-VALUE TO ACAT33MO                                03620002
              MOVE 'NX-AS'           TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT33IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT33IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
           IF ACAT33IO-ASSET-FOUND                                              
              PERFORM MOVE-ACAT33IO-ASSET-TO-TWA                                
              PERFORM REFORMAT-SCREEN-ASSET                                     
              MOVE 'C' TO TWA-SECR-ACTION                                       
           END-IF.                                                              
                                                                                
           IF EIBAID = DFHPF6                                                   
LRM008*****OR TWA-ACTIVE-DB = 'I'                                               
              GO TO PAGE-FORWARD-RTN-EXIT.                                      
                                                                                
           IF TWA-INP-TFR-TYP = 'MFC'                                           
              IF FIRST-TIME                                                     
                 IF TWA-ACTIVE-DB = 'Y'                                         
                    MOVE 'ACTIVE MFC DISPLAYED; BROWSE ONLY'                    
                       TO SYSTEM-MSG                                            
                 ELSE                                                           
                    MOVE 'MFC DISPLAYED' TO SYSTEM-MSG                          
                 END-IF                                                         
              ELSE                                                              
                 IF EIBAID = DFHPF7                                             
                    MOVE 'PRIOR MFC DISPLAYED' TO SYSTEM-MSG                    
                 ELSE                                                           
                 IF EIBAID = DFHPF8                                             
                    MOVE 'NEXT MFC DISPLAYED' TO SYSTEM-MSG                     
                 ELSE                                                           
                    MOVE 'NEXT MFC ASSET DISPLAYED' TO SYSTEM-MSG               
           ELSE                                                                 
              MOVE 'NEXT ASSET DISPLAYED' TO SYSTEM-MSG                         
LRM008     END-IF.                                                              
           PERFORM PROCESS-MAP-ITEMS THRU PROCESS-MAP-ITEMS-EXIT.               
                                                                                
           IF FIRST-TIME                                                        
              PERFORM SEND-MAP-ERASE                                            
           ELSE                                                                 
              PERFORM SEND-MAP-DATA-ONLY.                               10250002
           PERFORM WRITE-TSQ-RTN.                                       10790002
           PERFORM RETURN-TO-CICS.                                      08350002
       PAGE-FORWARD-RTN-EXIT. EXIT.                                             
                                                                        08960002
       BROWSE-ASSET-RTN.                                                        
           MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR.                       
           MOVE 'MFC'             TO ACAT33IO-TRNFR-TYPE-CD.                    
           MOVE TWA-MCBRKR        TO ACAT33IO-RCV-NBR.                          
           MOVE TWA-MCACCT        TO ACAT33IO-RCV-ACCT.                         
           MOVE ACAT-ADP-BROKER   TO ACAT33IO-DLVR-NBR.                         
           MOVE TWA-MBR           TO ACAT33IO-DLVR-ACCT.                        
           MOVE TWA-MAC           TO ACAT33IO-DLVR-ACCT(4 : 5).                 
******* WHEN THE USER CHANGES CUSIP/ADP/SYMBOL ON SCREEN, TRY TO OBTAIN         
******* THE ASSOCIATED CUSIP NBR TO USE FOR BROWSING. IF NOT FOUND, USE         
******* THIS FIELD ASIS (EG. 123 ) AS THE STARTING POINT.                       
           IF TWA-MSECR NOT = TWA-ORIG-SECR                                     
              SET ACATMSD-MSD-READ TO TRUE                                      
              MOVE TWA-MSECR TO ACATMSD-SEARCH-KEY                              
              PERFORM LINK-TO-ACATMSDIO-RTN                                     
              IF ACATMSD-FOUND                                                  
                 MOVE ACATMSD-CUSIP   TO ACAT33IO-CURRENT-SECR                  
              ELSE                                                              
                 MOVE TWA-MSECR TO ACAT33IO-CURRENT-SECR                02030002
           ELSE                                                                 
              MOVE TWA-MSECR TO ACAT33IO-CURRENT-SECR                   02030002
           END-IF.                                                              
                                                                                
           MOVE TWA-MSLOC TO ACAT33IO-CURRENT-SLOC.                             
           IF TWA-MTYPE = '1'                                                   
              SET ACAT33IO-CASH-ASSET TO TRUE                                   
           ELSE                                                                 
           IF TWA-MTYPE = '2'                                                   
              SET ACAT33IO-MARGIN-ASSET TO TRUE                                 
           ELSE                                                                 
           IF TWA-MTYPE = '5'                                                   
              SET ACAT33IO-SHORT-ASSET TO TRUE                                  
           ELSE                                                                 
              MOVE SPACES TO ACAT33IO-CSH-MGN-SHRT-CD                           
           END-IF.                                                              
           MOVE ACAT33IO-CSH-MGN-SHRT-CD TO WS-TYPE.                    02030002
LRM***** BACK SUBTRACT 1 BIT FROM TYPE (LAST KEY FIELD) TO CAUSE                
******** GREATER THEN LOGIC TO READ PROPPER RECORD.                             
           COMPUTE WS-TYPE-9 = WS-TYPE-9 - 1.                                   
           MOVE WS-TYPE TO ACAT33IO-CURRENT-TYPE.                       02030002
                                                                                
           SET ACAT33IO-IT-READ-NEXTS TO TRUE                                   
           PERFORM LINK-TO-ACAT33IO-RTN.                                        
           IF ACAT33IO-ASSET-NOT-FOUND                                          
              MOVE 'BOTTOM OF ASSET DATA' TO SYSTEM-MSG                         
              PERFORM  ERROR-RTN                                        03650002
           ELSE                                                                 
           IF NOT ACAT33IO-ASSET-FOUND                                          
              MOVE LOW-VALUE TO ACAT33MO                                03620002
              MOVE 'BR-AS'           TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT33IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT33IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
           PERFORM MOVE-ACAT33IO-ASSET-TO-TWA.                                  
           PERFORM REFORMAT-SCREEN-ASSET.                                       
           PERFORM PROCESS-MAP-ITEMS THRU PROCESS-MAP-ITEMS-EXIT.               
                                                                                
           IF ACAT33IO-ISIN-SEC-ISSUE-CD NOT = ACAT33IO-CURRENT-SECR    02030002
           OR ACAT33IO-STTLM-LCTN-CD     NOT = ACAT33IO-CURRENT-SLOC            
           OR ACAT33IO-CSH-MGN-SHRT-CD   NOT = ACAT33IO-CURRENT-TYPE            
              MOVE 'NEXT ASSET NOT FOUND; GENERIC BROWSE ASSUMED'               
                  TO SYSTEM-MSG                                                 
           ELSE                                                                 
              MOVE 'NEXT ASSET DISPLAYED' TO SYSTEM-MSG                         
           END-IF.                                                              
           PERFORM SEND-MAP-DATA-ONLY.                                  10250002
           PERFORM WRITE-TSQ-RTN.                                       10790002
           PERFORM RETURN-TO-CICS.                                      08350002
                                                                        08960002
111200     EJECT                                                        08970002
111300                                                                  08980002
111400 PAGE-BACKWARD-RTN.                                               08990002
           MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR.                       
           MOVE 'MFC'             TO ACAT33IO-TRNFR-TYPE-CD.                    
           MOVE TWA-MCBRKR        TO ACAT33IO-RCV-NBR.                          
           MOVE TWA-MCACCT        TO ACAT33IO-RCV-ACCT.                         
           MOVE ACAT-ADP-BROKER   TO ACAT33IO-DLVR-NBR.                         
           MOVE TWA-MBR           TO ACAT33IO-DLVR-ACCT.                        
           MOVE TWA-MAC           TO ACAT33IO-DLVR-ACCT(4 : 5).                 
           MOVE TWA-CURRENT-ASSET-KEY TO ACAT33IO-CURRENT-ASSET-KEY.            
           MOVE TWA-ASSET-SEQ     TO ACAT33IO-ASSET-SEQ-NBR.                    
LRM001     MOVE TWA-VALUE-FREE    TO ACAT33IO-VALUE-FREE.                       
           MOVE TWA-CONTROL-NBR TO ACAT33IO-CONTROL-NBR.                        
                                                                                
           IF TWA-ACTION = '6'                                                  
           OR TWA-ACTIVE-DB = 'Y'                                               
              MOVE -1 TO MACATL                                                 
              MOVE 'MFC'             TO ACAT33IO-TRNFR-TYPE-CD                  
              SET ACAT33IO-IT-READ-PREV4A TO TRUE                               
           ELSE                                                                 
           IF TWA-ACTIVE-DB = 'H'                                               
              SET ACAT33IO-IT-READ-PREVHA TO TRUE                               
           ELSE                                                                 
              MOVE 'MFC'             TO ACAT33IO-TRNFR-TYPE-CD                  
              SET ACAT33IO-IT-READ-PREV4 TO TRUE                                
           END-IF.                                                              
                                                                                
           PERFORM LINK-TO-ACAT33IO-RTN.                                        
           IF ACAT33IO-ASSET-NOT-FOUND                                          
              MOVE 'TOP OF ASSET DATA' TO SYSTEM-MSG                            
              PERFORM  ERROR-RTN                                        03650002
           ELSE                                                                 
           IF NOT ACAT33IO-ASSET-FOUND                                          
              MOVE LOW-VALUE TO ACAT33MO                                03620002
              MOVE 'PR-AS'           TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT33IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT33IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
           PERFORM MOVE-ACAT33IO-ASSET-TO-TWA.                                  
           PERFORM REFORMAT-SCREEN-ASSET.                                       
           IF TWA-INP-TFR-TYP = 'MFC'                                           
              MOVE 'PREV MFC ASSET DISPLAYED' TO SYSTEM-MSG                     
           ELSE                                                                 
              PERFORM PROCESS-MAP-ITEMS THRU PROCESS-MAP-ITEMS-EXIT             
              MOVE 'PREV ASSET DISPLAYED' TO SYSTEM-MSG.                        
LRM001     MOVE 'C' TO TWA-SECR-ACTION.                                         
           PERFORM SEND-MAP-DATA-ONLY.                                  10250002
           PERFORM WRITE-TSQ-RTN.                                       10790002
           PERFORM RETURN-TO-CICS.                                      08350002
                                                                        08960002
           EJECT                                                        09240002
033800 PAGE-FORWARD-TIF.                                                03920002
LRM008     IF TWA-ACTION = 'A'                                                  
LRM008     OR TWA-ACTIVE-DB = 'I'                                               
LRM008        MOVE 'I'    TO TWA-ACTIVE-DB ACAT33IO-ACTIVE-DB                   
LRM008        MOVE 'C' TO TWA-ACTION TWA-SECR-ACTION.                           
           MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR.                       
           MOVE TWA-MCBRKR        TO ACAT33IO-RCV-NBR.                          
           MOVE TWA-MCACCT        TO ACAT33IO-RCV-ACCT.                         
           MOVE ACAT-ADP-BROKER   TO ACAT33IO-DLVR-NBR.                         
           MOVE TWA-MBR           TO ACAT33IO-DLVR-ACCT.                        
           MOVE TWA-MAC           TO ACAT33IO-DLVR-ACCT(4 : 5).                 
           MOVE TWA-CURRENT-ASSET-KEY TO ACAT33IO-CURRENT-ASSET-KEY.            
LRM008     MOVE TWA-CONTROL-NBR   TO ACAT33IO-CONTROL-NBR                       
                                                                                
           IF TWA-INP-TFR-TYP = 'MFC'                                           
LRM008     AND (TWA-ACTIVE-DB = 'Y' OR 'H')                                     
              SET ACAT33IO-GET-NEXT-MFC TO TRUE                                 
              MOVE 'MFC'          TO ACAT33IO-TRNFR-TYPE-CD                     
              MOVE -1         TO  MACATL                                        
           ELSE                                                                 
              SET ACAT33IO-IT-READ-NEXTA TO TRUE                                
              MOVE 'MFC'          TO ACAT33IO-TRNFR-TYPE-CD                     
           END-IF.                                                              
           PERFORM LINK-TO-ACAT33IO-RTN.                                        
           IF ACAT33IO-NOT-FOUND                                                
              MOVE 'BOTTOM OF TIF(S)' TO SYSTEM-MSG                             
              PERFORM  ERROR-RTN                                        03650002
           ELSE                                                                 
           IF NOT ACAT33IO-ACTIVE-FOUND                                         
           AND NOT ACAT33IO-FOUND                                               
              MOVE LOW-VALUE TO ACAT33MO                                03620002
              MOVE 'NX-AC'           TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT33IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT33IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
           SET TWA-INTRAN-BRW TO TRUE.                                          
           PERFORM MOVE-ACAT33IO-TO-TWA-RTN.                                    
           PERFORM REFORMAT-SCREEN-DETAIL.                                      
LRM008     IF TWA-ACTION NOT = 'C'                                              
              PERFORM ASKIP-MAP-RTN                                             
LRM008        MOVE ATT-UNPROT TO  MACATA                                        
LRM008        MOVE 'R'        TO TWA-ACTION                                     
              MOVE ZEROS      TO TWA-ASSET-SEQ                                  
LRM008     END-IF.                                                              
LRM008     MOVE SPACES TO TWA-CURRENT-ASSET-KEY                                 
LRM008     MOVE SPACES TO TWA-INTRAN-FLAG                               01940002
LRM008     MOVE ZERO   TO TWA-ASSET-SEQ                                         
           PERFORM PAGE-FORWARD-RTN                                     03900002
              THRU PAGE-FORWARD-RTN-EXIT.                                       
                                                                                
           PERFORM PROCESS-MAP-ITEMS THRU PROCESS-MAP-ITEMS-EXIT.               
           MOVE 'NEXT MFC TIF DISPLAYED' TO SYSTEM-MSG                          
LRM008     IF ACAT33IO-NSCC-SUBMITTED                                           
LRM008        MOVE WS-SUBMITTED-MSG  TO SYSTEM-MSG                              
LRMM08     END-IF.                                                              
           PERFORM SEND-MAP-DATA-ONLY.                                  10250002
           PERFORM WRITE-TSQ-RTN.                                       10790002
           PERFORM RETURN-TO-CICS.                                      08350002
                                                                        08960002
033800 PAGE-BACKWARD-TIF.                                               03920002
LRM008     IF TWA-ACTION = 'A'                                                  
LRM008     OR TWA-ACTIVE-DB = 'I'                                               
LRM008        MOVE 'I'    TO TWA-ACTIVE-DB ACAT33IO-ACTIVE-DB                   
LRM008        MOVE 'C' TO TWA-ACTION TWA-SECR-ACTION.                           
           MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR.                       
           MOVE 'MFC'             TO ACAT33IO-TRNFR-TYPE-CD.                    
           MOVE TWA-MCBRKR        TO ACAT33IO-RCV-NBR.                          
           MOVE TWA-MCACCT        TO ACAT33IO-RCV-ACCT.                         
           MOVE ACAT-ADP-BROKER   TO ACAT33IO-DLVR-NBR.                         
           MOVE TWA-MBR           TO ACAT33IO-DLVR-ACCT.                        
           MOVE TWA-MAC           TO ACAT33IO-DLVR-ACCT(4 : 5).                 
           MOVE TWA-CURRENT-ASSET-KEY TO ACAT33IO-CURRENT-ASSET-KEY.            
LRM008     MOVE TWA-CONTROL-NBR TO ACAT33IO-CONTROL-NBR                         
                                                                                
           IF TWA-INP-TFR-TYP = 'MFC'                                           
LRM008     AND (TWA-ACTIVE-DB = 'Y' OR 'H')                                     
              SET ACAT33IO-GET-PREV-MFC TO TRUE                                 
              MOVE 'MFC'          TO ACAT33IO-TRNFR-TYPE-CD                     
              MOVE -1         TO  MACATL                                        
           ELSE                                                                 
              SET ACAT33IO-IT-READ-PREV1 TO TRUE                                
              MOVE 'MFC'          TO ACAT33IO-TRNFR-TYPE-CD                     
           END-IF.                                                              
                                                                                
           PERFORM LINK-TO-ACAT33IO-RTN.                                        
           IF ACAT33IO-NOT-FOUND                                                
              MOVE 'TOP OF TIF(S)' TO SYSTEM-MSG                                
              PERFORM  ERROR-RTN                                        03650002
           ELSE                                                                 
           IF NOT ACAT33IO-ACTIVE-FOUND                                         
           AND NOT ACAT33IO-FOUND                                               
              MOVE LOW-VALUE TO ACAT33MO                                03620002
              MOVE 'PV-AC'           TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT33IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT33IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
           SET TWA-INTRAN-BRW TO TRUE.                                          
           PERFORM MOVE-ACAT33IO-TO-TWA-RTN.                                    
           PERFORM REFORMAT-SCREEN-DETAIL.                                      
LRM008     IF TWA-ACTION NOT = 'C'                                              
              PERFORM ASKIP-MAP-RTN                                             
              MOVE ATT-UNPROT TO  MACATA                                        
              MOVE 'R'        TO TWA-ACTION                                     
              MOVE ZEROS      TO TWA-ASSET-SEQ                                  
LRM008     END-IF.                                                              
LRM008     MOVE SPACES TO TWA-CURRENT-ASSET-KEY                                 
LRM008     MOVE SPACES TO TWA-INTRAN-FLAG                               01940002
LRM008     MOVE ZERO   TO TWA-ASSET-SEQ                                         
              MOVE SPACES     TO TWA-ASSET-AREA                                 
              MOVE LOW-VALUES TO TWA-CURRENT-ASSET-KEY                          
              MOVE ZEROS TO TWA-MQTY-9                                          
                            TWA-MAMT-9                                          
              PERFORM REFORMAT-SCREEN-ASSET                                     
              INITIALIZE ACAT33IO-PT-ASSET-FIELDS                       03900002
              MOVE SPACES     TO TWA-ASSET-AREA                                 
              PERFORM PAGE-FORWARD-RTN                                          
                 THRU PAGE-FORWARD-RTN-EXIT.                                    
                                                                                
           PERFORM PROCESS-MAP-ITEMS THRU PROCESS-MAP-ITEMS-EXIT.               
           MOVE 'PRIOR TIF DISPLAYED' TO SYSTEM-MSG.                            
LRM008     IF ACAT33IO-NSCC-SUBMITTED                                           
LRM008        MOVE WS-SUBMITTED-MSG  TO SYSTEM-MSG                              
LRMM08     END-IF.                                                              
           PERFORM SEND-MAP-DATA-ONLY.                                  10250002
           PERFORM WRITE-TSQ-RTN.                                       10790002
           PERFORM RETURN-TO-CICS.                                      08350002
                                                                        09250002
           EJECT                                                        09510002
       LINK-TO-ACATNAIO-RTN.                                                    
00442      EXEC CICS LINK PROGRAM (WS-ACATNAIO)                         02890002
                COMMAREA(ACATNAIO-CALL-AREA)                            02900002
00443           LENGTH(LENGTH OF ACATNAIO-CALL-AREA)                    02910002
           END-EXEC.                                                    02920002
                                                                                
       LINK-TO-ACATPPIO-RTN.                                                    
00442      EXEC CICS LINK PROGRAM (WS-ACATPPIO)                         02890002
                COMMAREA(ACATPPIO-CALL-AREA)                            02900002
00443           LENGTH(LENGTH OF ACATPPIO-CALL-AREA)                    02910002
           END-EXEC.                                                    02920002
                                                                                
       LINK-TO-ACATMSDIO-RTN.                                                   
00442      EXEC CICS LINK PROGRAM (WS-ACATMSD)                          02890002
                COMMAREA(ACATMSDIO-CALL-AREA)                           02900002
00443           LENGTH(LENGTH OF ACATMSDIO-CALL-AREA)                   02910002
           END-EXEC.                                                    02920002
                                                                                
       LINK-TO-ACATRSTIO-RTN.                                                   
00442      EXEC CICS LINK PROGRAM (WS-ACATRST)                          02890002
                COMMAREA(ACATRSTIO-CALL-AREA)                           02900002
00443           LENGTH(LENGTH OF ACATRSTIO-CALL-AREA)                   02910002
           END-EXEC.                                                    02920002
                                                                                
       LINK-TO-ACAT33IO-RTN.                                                    
00442      EXEC CICS LINK PROGRAM (WS-ACAT33DB)                         02890002
                COMMAREA(ACAT33IO-CALL-AREA)                            02900002
00443           LENGTH(LENGTH OF ACAT33IO-CALL-AREA)                    02910002
           END-EXEC.                                                    02920002
       UPDATE-ACAT-IT-RTN.                                                      
              IF TWA-ACTION = 'A'                                               
                 PERFORM CREATE-ACAT-IT-RECORD                                  
              ELSE                                                              
              MOVE TWA-CURRENT-ASSET-KEY TO ACAT33IO-CURRENT-ASSET-KEY  02030002
              IF TWA-ACTION = 'C'                                               
                 IF TWA-MDEL = 'Y'                                              
                    PERFORM DELETE-ACAT-IT-RECORD                               
                 ELSE                                                           
                    PERFORM UPDATE-ACAT-IT-RECORD                               
              END-IF END-IF END-IF.                                             
                                                                                
           EJECT                                                        09870002
       CREATE-ACAT-IT-RECORD.                                                   
           SET ACAT33IO-IT-ISRT TO TRUE.                                        
           MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR.                       
LRM007     MOVE TWA-CONTROL-NBR   TO ACAT33IO-CNTL-ASTD-NBR                     
LRM007     MOVE SPACES            TO ACAT33IO-CONTROL-NBR.                      
           MOVE TWA-DB2-STTLM-DT  TO ACAT33IO-STTLM-DT.                 02030002
LRM001     MOVE TWA-VALUE-FREE    TO ACAT33IO-VALUE-FREE.                       
           MOVE TWA-MCBRKR        TO ACAT33IO-RCV-NBR.                          
           MOVE TWA-MCACCT        TO ACAT33IO-RCV-ACCT.                         
           MOVE ACAT-ADP-BROKER   TO ACAT33IO-DLVR-NBR.                         
           MOVE TWA-MBR           TO ACAT33IO-DLVR-ACCT.                        
           MOVE TWA-MAC           TO ACAT33IO-DLVR-ACCT(4 : 5).                 
           MOVE 'MFC'             TO ACAT33IO-TRNFR-TYPE-CD.                    
           MOVE TWA-MCCMNT-X120   TO ACAT33IO-CMNT-TXT.                         
           MOVE TWA-M1CMNT-X120   TO ACAT33IO-ASSET-CMNT1-TXT.                  
           MOVE TWA-M2CMNT-X120   TO ACAT33IO-ASSET-CMNT2-TXT.                  
           MOVE TWA-M5CMNT-X120   TO ACAT33IO-ASSET-CMNT5-TXT.                  
           MOVE TWA-MMCMNT-X120   TO ACAT33IO-ASSET-CMNTM-TXT.                  
LRM007     MOVE TWA-DUPE-FOUND    TO ACAT33IO-DUPE-FOUND.                       
           MOVE TWA-OCC-BRKR      TO ACAT33IO-RCV-OCC-BRKR-NBR.                 
           MOVE TWA-MRR           TO ACAT33IO-RR-CD.                    02030002
           MOVE TWA-MCTYPE        TO ACAT33IO-RCV-ACCT-TYPE-CD.         02030002
           MOVE TWA-MNAME         TO ACAT33IO-RCV-CUST-NM.              02030002
           MOVE TWA-MNAME2        TO ACAT33IO-RCV-CUST-NM(31 : 30).     02030002
           MOVE TWA-MSSN(1 : 3)   TO ACAT33IO-RCV-SS-PRIM-NBR(1 : 3).   02030002
           MOVE TWA-MSSN(5 : 2)   TO ACAT33IO-RCV-SS-PRIM-NBR(4 : 2).   02030002
           MOVE TWA-MSSN(8 : 4)   TO ACAT33IO-RCV-SS-PRIM-NBR(6 : 4).   02030002
           IF TWA-MSSN2(1 : 1) NOT GREATER SPACES                               
              MOVE SPACES           TO ACAT33IO-RCV-SS-SCNDY-NBR                
           ELSE                                                                 
              MOVE TWA-MSSN2(1 : 3) TO ACAT33IO-RCV-SS-SCNDY-NBR(1 : 3)         
              MOVE TWA-MSSN2(5 : 2) TO ACAT33IO-RCV-SS-SCNDY-NBR(4 : 2)         
              MOVE TWA-MSSN2(8 : 4) TO ACAT33IO-RCV-SS-SCNDY-NBR(6 : 4)         
           END-IF.                                                              
           IF TWA-MSUBM = 'Y'                                           02030002
              SET ACAT33IO-NSCC-SUBMIT-ELIGABLE TO TRUE                         
           ELSE                                                                 
              SET ACAT33IO-NSCC-SUBMIT-HOLD     TO TRUE.                        
                                                                                
           MOVE 'MFC' TO ACAT33IO-TRNFR-TYPE-CD                                 
           MOVE 'US' TO ACAT33IO-ISIN-CNTRY-CD                                  
           MOVE TWA-MSECR TO ACAT33IO-ISIN-SEC-ISSUE-CD.                        
           MOVE SPACES TO ACAT33IO-ISIN-SEC-CDG-CD                              
           MOVE TWA-MSLOC  TO ACAT33IO-STTLM-LCTN-CD.                           
           MOVE TWA-ADP-NBR TO ACAT33IO-ADP-NBR.                                
           MOVE TWA-MCATGR  TO ACAT33IO-ASSET-PRC-CTGY-CD.                      
           MOVE TWA-FUND-ACCOUNT-NBR TO ACAT33IO-FUND-ACCOUNT-NBR.              
ET0001     IF TWA-RE-REGIST-DATE = SPACE                                        
ET0001        MOVE '0001-01-01' TO WS-DB2-FORM-DATE                             
ET0001     ELSE                                                                 
ET0001        MOVE TWA-RE-REGIST-DATE  TO WS-REG-DATE                           
ET0001        MOVE WS-REG-MM           TO WS-DATE-MM                            
ET0001        MOVE WS-REG-DD           TO WS-DATE-DD                            
ET0001        MOVE WS-REG-YY           TO WS-DATE-YY                            
ET0001        MOVE '20'                TO WS-DATE-CC                            
ET0001        MOVE '-'                 TO WS-HYPHON1 WS-HYPHON2                 
ET0001     END-IF.                                                              
ET0001     MOVE WS-DB2-FORM-DATE TO ACAT33IO-RE-REGIST-DATE.                    
ET0001                                                                          
LRM002     MOVE TWA-CAGE-TAG TO ACAT33IO-CAGE-TAG.                              
           MOVE 'P' TO ACAT33IO-ASSET-RQST-QTY-CD.                              
    **** SET ACAT33IO-PSTN-CD BASED ON POSITIVE OR NEGATIVE QTY BELOW.          
           IF TWA-MQTY-9 < ZERO                                                 
              SET ACAT33IO-SHORT-ASSET-QTY TO TRUE                              
           ELSE                                                                 
           IF TWA-MQTY-9 > ZERO                                                 
              SET ACAT33IO-LONG-ASSET-QTY TO TRUE                               
           ELSE                                                                 
              SET ACAT33IO-NA-ASSET-QTY TO TRUE                                 
           END-IF.                                                              
                                                                                
           MOVE ZEROS              TO ACAT33IO-ASSET-AMT                        
                                      ACAT33IO-ASSET-QTY                        
                                      ACAT33IO-ASSET-PCT.                       
                                                                                
           IF TWA-MQTY-9 LESS ZERO                                              
              COMPUTE WS-MQTY-9-UNSIGNED =  TWA-MQTY-9 * -1                     
              END-COMPUTE                                                       
           ELSE                                                                 
              MOVE TWA-MQTY-9      TO WS-MQTY-9-UNSIGNED                        
           END-IF.                                                              
           IF TWA-MCD = 'V'                                                     
              SET ACAT33IO-RQST-ASSET-AMT TO TRUE                               
              MOVE WS-MQTY-9-UNSIGNED TO ACAT33IO-ASSET-AMT                     
           ELSE                                                                 
           IF TWA-MCD = 'P'                                                     
              SET ACAT33IO-RQST-ASSET-QTY TO TRUE                               
              MOVE WS-MQTY-9-UNSIGNED TO ACAT33IO-ASSET-QTY                     
           ELSE                                                                 
           IF TWA-MCD = '%'                                                     
              SET ACAT33IO-RQST-ASSET-PCT TO TRUE                               
              MOVE WS-MQTY-9-UNSIGNED TO ACAT33IO-ASSET-PCT                     
           ELSE                                                                 
              MOVE SPACES TO ACAT33IO-AST-RQST-TRANS-CD                         
              MOVE 'F' TO ACAT33IO-ASSET-RQST-QTY-CD                            
              MOVE ZEROS           TO ACAT33IO-ASSET-QTY                        
              SET ACAT33IO-NA-ASSET-QTY TO TRUE                                 
           END-IF.                                                              
           MOVE TWA-MAMT-9         TO ACAT33IO-ASSET-AMT.                       
                                                                                
           IF TWA-MTYPE = '1'                                                   
              SET ACAT33IO-CASH-ASSET TO TRUE                                   
           ELSE                                                                 
           IF TWA-MTYPE = '2'                                                   
              SET ACAT33IO-MARGIN-ASSET TO TRUE                                 
           ELSE                                                                 
           IF TWA-MTYPE = '5'                                                   
              SET ACAT33IO-SHORT-ASSET TO TRUE                                  
           ELSE                                                                 
              MOVE SPACES TO ACAT33IO-CSH-MGN-SHRT-CD                           
           END-IF.                                                              
                                                                                
           MOVE TWA-MDESC-GROUP TO ACAT33IO-DESC-TXT.                           
                                                                                
           MOVE TWA-MSCMNT-X120 TO ACAT33IO-ASSET-CMNT-TXT.                     
           IF TWA-INP-TFR-TYP = 'MFC'                                           
              MOVE TWA-MACAT TO ACAT33IO-CONTROL-NBR                            
              MOVE 'S' TO ACAT33IO-ACCT-RJCT-RSBM-IND                           
           ELSE                                                                 
LRM001     IF TWA-ACTION NOT = 'A'                                              
              MOVE SPACES    TO ACAT33IO-CONTROL-NBR                            
                          ACAT33IO-ACCT-RJCT-RSBM-IND                           
                          TWA-CONTROL-NBR                                       
           END-IF.                                                              
           IF TWA-BOND-REG-CODE = '1'                                           
              MOVE 'B' TO ACAT33IO-BEARER-BOND-CD                               
           ELSE                                                                 
              MOVE 'N' TO ACAT33IO-BEARER-BOND-CD                               
           END-IF.                                                              
LRM009     MOVE ACAT-SIGN-ON-ID      TO ACAT33IO-SNON-ID                        
LRM009     MOVE ACAT-CICS-NETNAME    TO ACAT33IO-NETNAME                        
LRM009     MOVE ACAT-CICS-USER-ID    TO ACAT33IO-USER-ID                        
LRM009     MOVE ACAT-CICS-USER-NAME  TO ACAT33IO-USER-NAME                      
           PERFORM LINK-TO-ACAT33IO-RTN.                                        
           IF ACAT33IO-GOOD-RESP                                                
              MOVE -1 TO MSUBML                                                 
              IF TWA-MSUBM = 'Y'                                                
                 MOVE 'RECORD CREATED SUCCESSFULLY' TO SYSTEM-MSG               
              ELSE                                                              
                 MOVE 'RECORD RETAINED / SUBMIT PENDING' TO SYSTEM-MSG          
              END-IF                                                            
              MOVE 'C' TO TWA-ACTION  TWA-SECR-ACTION                           
              MOVE ACAT33IO-RCV-NBR   TO TWA-ORIG-RCV-NBR                       
              MOVE ACAT33IO-RCV-ACCT TO TWA-ORIG-RCV-ACCT                       
              MOVE TWA-MSECR TO  TWA-ORIG-MSECR                                 
                                 TWA-ORIG-SECR                                  
              MOVE TWA-MSLOC TO  TWA-ORIG-SLOC                                  
              MOVE TWA-MTYPE TO  TWA-ORIG-MTYPE                                 
              MOVE ACAT33IO-CSH-MGN-SHRT-CD TO TWA-ORIG-TYPE                    
              MOVE ATT-UNPROT TO MDELA                                          
              MOVE ACAT33IO-UPDT-TMSTP TO TWA-UPDT-TMSTP                        
LRM007********IF TWA-DUPE-FOUND = 'Y'                                           
LRM007           MOVE ACAT33IO-CONTROL-NBR TO TWA-CONTROL-NBR                   
LRM007           MOVE TWA-CONTROL-NBR TO MACATO                                 
LRM007           MOVE ACAT33IO-CNTL-ASTD-NBR TO TWA-CNTL-ASTD-NBR               
LRM007           MOVE TWA-CNTL-ASTD-NBR TO ORGACATO                             
LRM007********END-IF                                                            
LRM007        MOVE 'N'  TO TWA-DUPE-FOUND                                       
              PERFORM  ERROR-RTN                                        03650002
           ELSE                                                                 
              MOVE LOW-VALUE TO ACAT33MO                                03620002
              MOVE 'WRITE'           TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT33IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT33IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
           SKIP3                                                                
                                                                                
       UPDATE-ACAT-IT-RECORD.                                                   
           SET ACAT33IO-IT-UPD  TO TRUE.                                        
           MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR.                       
           MOVE TWA-CONTROL-NBR   TO ACAT33IO-CONTROL-NBR                       
LRM007     MOVE TWA-DB2-STTLM-DT  TO ACAT33IO-STTLM-DT.                 02030002
           MOVE TWA-MCBRKR        TO ACAT33IO-RCV-NBR.                          
           MOVE TWA-MCACCT        TO ACAT33IO-RCV-ACCT.                         
           MOVE ACAT-ADP-BROKER   TO ACAT33IO-DLVR-NBR.                         
           MOVE TWA-MBR           TO ACAT33IO-DLVR-ACCT.                        
           MOVE TWA-MAC           TO ACAT33IO-DLVR-ACCT(4 : 5).                 
           MOVE TWA-MCCMNT-X120   TO ACAT33IO-CMNT-TXT.                         
           MOVE TWA-M1CMNT-X120   TO ACAT33IO-ASSET-CMNT1-TXT.                  
           MOVE TWA-M2CMNT-X120   TO ACAT33IO-ASSET-CMNT2-TXT.                  
           MOVE TWA-M5CMNT-X120   TO ACAT33IO-ASSET-CMNT5-TXT.                  
           MOVE TWA-MMCMNT-X120   TO ACAT33IO-ASSET-CMNTM-TXT.                  
           MOVE TWA-MRR           TO ACAT33IO-RR-CD.                    02030002
           MOVE TWA-MCTYPE        TO ACAT33IO-RCV-ACCT-TYPE-CD.         02030002
           MOVE TWA-MNAME         TO ACAT33IO-RCV-CUST-NM.              02030002
           MOVE TWA-MNAME2        TO ACAT33IO-RCV-CUST-NM(31 : 30).     02030002
           MOVE TWA-MSSN(1 : 3)   TO ACAT33IO-RCV-SS-PRIM-NBR(1 : 3).   02030002
           MOVE TWA-MSSN(5 : 2)   TO ACAT33IO-RCV-SS-PRIM-NBR(4 : 2).   02030002
           MOVE TWA-MSSN(8 : 4)   TO ACAT33IO-RCV-SS-PRIM-NBR(6 : 4).   02030002
           IF TWA-MSSN2(1 : 1) NOT GREATER SPACES                               
              MOVE SPACES           TO ACAT33IO-RCV-SS-SCNDY-NBR                
           ELSE                                                                 
              MOVE TWA-MSSN2(1 : 3) TO ACAT33IO-RCV-SS-SCNDY-NBR(1 : 3)         
              MOVE TWA-MSSN2(5 : 2) TO ACAT33IO-RCV-SS-SCNDY-NBR(4 : 2)         
              MOVE TWA-MSSN2(8 : 4) TO ACAT33IO-RCV-SS-SCNDY-NBR(6 : 4)         
           END-IF.                                                              
           MOVE TWA-OCC-BRKR      TO ACAT33IO-RCV-OCC-BRKR-NBR.                 
           IF TWA-MSUBM = 'Y'                                           02030002
              SET ACAT33IO-NSCC-SUBMIT-ELIGABLE TO TRUE                         
           ELSE                                                                 
              SET ACAT33IO-NSCC-SUBMIT-HOLD     TO TRUE.                        
                                                                                
           MOVE 'MFC' TO ACAT33IO-TRNFR-TYPE-CD                                 
           MOVE ' '   TO ACAT33IO-ACCT-RJCT-RSBM-IND.                           
                                                                                
           MOVE TWA-ORIG-RCV-NBR   TO ACAT33IO-ORIG-RCV-NBR.                    
           MOVE TWA-ORIG-RCV-ACCT TO ACAT33IO-ORIG-RCV-ACCT.                    
                                                                                
           MOVE 'US' TO ACAT33IO-ISIN-CNTRY-CD                                  
           MOVE TWA-MSECR TO ACAT33IO-ISIN-SEC-ISSUE-CD.                        
           MOVE SPACES TO ACAT33IO-ISIN-SEC-CDG-CD                              
           MOVE TWA-MSLOC  TO ACAT33IO-STTLM-LCTN-CD.                           
           MOVE TWA-ADP-NBR TO ACAT33IO-ADP-NBR.                                
           MOVE TWA-MCATGR  TO ACAT33IO-ASSET-PRC-CTGY-CD.                      
           MOVE TWA-FUND-ACCOUNT-NBR TO ACAT33IO-FUND-ACCOUNT-NBR.              
ET0001     IF TWA-RE-REGIST-DATE = SPACE                                        
ET0001        MOVE '0001-01-01' TO WS-DB2-FORM-DATE                             
ET0001     ELSE                                                                 
ET0001        MOVE TWA-RE-REGIST-DATE  TO WS-REG-DATE                           
ET0001        MOVE WS-REG-MM           TO WS-DATE-MM                            
ET0001        MOVE WS-REG-DD           TO WS-DATE-DD                            
ET0001        MOVE WS-REG-YY           TO WS-DATE-YY                            
ET0001        MOVE '20'                TO WS-DATE-CC                            
ET0001        MOVE '-'                 TO WS-HYPHON1 WS-HYPHON2                 
ET0001     END-IF.                                                              
ET0001     MOVE WS-DB2-FORM-DATE TO ACAT33IO-RE-REGIST-DATE.                    
ET0001                                                                          
LRM002     MOVE TWA-CAGE-TAG TO ACAT33IO-CAGE-TAG.                              
           MOVE 'P' TO ACAT33IO-ASSET-RQST-QTY-CD.                              
    **** SET ACAT33IO-PSTN-CD BASED ON POSITIVE OR NEGATIVE QTY BELOW.          
           IF TWA-MQTY-9 < ZERO                                                 
              SET ACAT33IO-SHORT-ASSET-QTY TO TRUE                              
           ELSE                                                                 
           IF TWA-MQTY-9 > ZERO                                                 
              SET ACAT33IO-LONG-ASSET-QTY TO TRUE                               
           ELSE                                                                 
              SET ACAT33IO-NA-ASSET-QTY TO TRUE                                 
           END-IF.                                                              
                                                                                
           MOVE ZEROS              TO ACAT33IO-ASSET-AMT                        
                                      ACAT33IO-ASSET-QTY                        
                                      ACAT33IO-ASSET-PCT.                       
                                                                                
           IF TWA-MQTY-9 LESS ZERO                                              
              COMPUTE WS-MQTY-9-UNSIGNED =  TWA-MQTY-9 * -1                     
              END-COMPUTE                                                       
           ELSE                                                                 
              MOVE TWA-MQTY-9      TO WS-MQTY-9-UNSIGNED                        
           END-IF.                                                              
           IF TWA-MCD = 'V'                                                     
              SET ACAT33IO-RQST-ASSET-AMT TO TRUE                               
              MOVE WS-MQTY-9-UNSIGNED TO ACAT33IO-ASSET-AMT                     
           ELSE                                                                 
           IF TWA-MCD = 'P'                                                     
              SET ACAT33IO-RQST-ASSET-QTY TO TRUE                               
              MOVE WS-MQTY-9-UNSIGNED TO ACAT33IO-ASSET-QTY                     
           ELSE                                                                 
           IF TWA-MCD = '%'                                                     
              SET ACAT33IO-RQST-ASSET-PCT TO TRUE                               
              MOVE WS-MQTY-9-UNSIGNED TO ACAT33IO-ASSET-PCT                     
           ELSE                                                                 
              MOVE SPACES TO ACAT33IO-AST-RQST-TRANS-CD                         
              MOVE 'F' TO ACAT33IO-ASSET-RQST-QTY-CD                            
              MOVE ZEROS           TO ACAT33IO-ASSET-QTY                        
              SET ACAT33IO-NA-ASSET-QTY TO TRUE                                 
           END-IF.                                                              
           MOVE TWA-MAMT-9         TO ACAT33IO-ASSET-AMT.                       
           IF ACAT33IO-ASSET-AMT < ZERO                                         
              COMPUTE ACAT33IO-ASSET-AMT =                                      
                      ACAT33IO-ASSET-AMT * -1                                   
              END-COMPUTE.                                                      
                                                                                
           IF TWA-MCD = 'V'                                                     
              SET ACAT33IO-RQST-ASSET-AMT TO TRUE                               
           ELSE                                                                 
           IF TWA-MCD = 'P'                                                     
              SET ACAT33IO-RQST-ASSET-QTY TO TRUE                               
           ELSE                                                                 
           IF TWA-MCD = '%'                                                     
              SET ACAT33IO-RQST-ASSET-PCT TO TRUE                               
           ELSE                                                                 
              MOVE SPACES TO ACAT33IO-AST-RQST-TRANS-CD                         
              MOVE 'F' TO ACAT33IO-ASSET-RQST-QTY-CD                            
              MOVE ZEROS           TO ACAT33IO-ASSET-QTY                        
              SET ACAT33IO-NA-ASSET-QTY TO TRUE                                 
           END-IF.                                                              
           IF TWA-MTYPE = '1'                                                   
              SET ACAT33IO-CASH-ASSET TO TRUE                                   
           ELSE                                                                 
           IF TWA-MTYPE = '2'                                                   
              SET ACAT33IO-MARGIN-ASSET TO TRUE                                 
           ELSE                                                                 
           IF TWA-MTYPE = '5'                                                   
              SET ACAT33IO-SHORT-ASSET TO TRUE                                  
           ELSE                                                                 
              MOVE SPACES TO ACAT33IO-CSH-MGN-SHRT-CD                           
           END-IF.                                                              
                                                                                
           MOVE TWA-MDESC-GROUP TO ACAT33IO-DESC-TXT.                           
                                                                                
           MOVE TWA-MSCMNT-X120 TO ACAT33IO-ASSET-CMNT-TXT.                     
           IF TWA-BOND-REG-CODE = '1'                                           
              MOVE 'B' TO ACAT33IO-BEARER-BOND-CD                               
           ELSE                                                                 
              MOVE 'N' TO ACAT33IO-BEARER-BOND-CD                               
           END-IF.                                                              
           MOVE TWA-UPDT-TMSTP  TO ACAT33IO-UPDT-TMSTP.                         
LRM009     MOVE ACAT-SIGN-ON-ID      TO ACAT33IO-SNON-ID                        
LRM009     MOVE ACAT-CICS-NETNAME    TO ACAT33IO-NETNAME                        
LRM009     MOVE ACAT-CICS-USER-ID    TO ACAT33IO-USER-ID                        
LRM009     MOVE ACAT-CICS-USER-NAME  TO ACAT33IO-USER-NAME                      
                                                                                
           PERFORM LINK-TO-ACAT33IO-RTN.                                        
           IF ACAT33IO-GOOD-RESP                                                
              MOVE ACAT33IO-UPDT-TMSTP TO TWA-UPDT-TMSTP                        
              IF (TWA-MSECR > SPACES OR TWA-MDESC(1 : 1) > SPACES)              
              AND (TWA-SECR-ACTION = 'A' OR 'C' OR 'D')                         
                 PERFORM UPDATE-ASSET-RTN                                       
              END-IF                                                            
              IF TWA-MSUBM = 'Y'                                                
                 MOVE -1 TO MBRL                                                
                 MOVE 'RECORD UPDATED SUCCESSFULLY / AWAITNG NSCC XMIT'         
                      TO SYSTEM-MSG                                             
              ELSE                                                              
                 MOVE -1 TO MSUBML                                              
                 MOVE 'UPDATE RETAINED / SUBMIT PENDING' TO SYSTEM-MSG          
              END-IF                                                            
              PERFORM  ERROR-RTN                                        03650002
           ELSE                                                                 
           IF ACAT33IO-UPDT-TMSTP-NG                                            
           OR ACAT33IO-NSCC-PEND-NG                                             
           OR ACAT33IO-NOT-FOUND                                                
              PERFORM UPDATE-FAIL-RTN                                           
           ELSE                                                                 
              MOVE LOW-VALUE TO ACAT33MO                                03620002
              MOVE 'REPL '           TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT33IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT33IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
           MOVE ATT-UNPROT TO MDELA.                                            
                                                                                
       UPDATE-FAIL-RTN.                                                         
           IF ACAT33IO-NOT-FOUND                                                
              MOVE                                                              
             'UPDATE REJECTED; THIS TIF WAS DELETED BY SOMEONE ELSE'            
                TO SYSTEM-MSG                                                   
              MOVE ' ' TO TWA-ACTION                                            
              MOVE SPACES TO TWA-MAP-TABLE                              02000002
              MOVE LOW-VALUES TO ACAT33MO                                       
              MOVE -1 TO MBRL                                                   
              MOVE ACAT33IO-RCV-NBR   TO TWA-MCBRKR                             
              MOVE ACAT33IO-RCV-ACCT  TO TWA-MCACCT                             
              MOVE ACAT33IO-DLVR-ACCT   TO TWA-MBR                              
              MOVE ACAT33IO-DLVR-ACCT(4 : 5)   TO TWA-MAC                       
              SET FIRST-TIME TO TRUE                                            
              PERFORM ERROR-RTN                                         10220002
           END-IF.                                                              
                                                                                
           IF ACAT33IO-UPDT-TMSTP-NG                                            
              MOVE                                                              
             'UPDATE REJECTED; OTHER CHANGE MADE PRIOR TO THIS REQUEST;         
      -      'SCREEN REFRESHED'                                                 
                TO SYSTEM-MSG                                                   
           ELSE                                                                 
           IF ACAT33IO-NSCC-PEND-NG                                             
              MOVE                                                              
             'UPDATE REJECTED; THIS TIF ALREADY SENT TO NSCC; SCREEN REF        
      -      'RESHED'                                                           
                TO SYSTEM-MSG                                                   
           ELSE                                                                 
              MOVE  'UPDATE REJECTED; SCREEN REFRESHED'  TO SYSTEM-MSG          
           END-IF.                                                              
                                                                                
   ***** REREAD RECORD, MOVE TO TWA AND SCREEN, DISPLAY:                        
           PERFORM READ-ACAT-RTN.                                               
           PERFORM MOVE-ACAT33IO-TO-TWA-RTN.                                    
           PERFORM REFORMAT-SCREEN-DETAIL.                                      
           PERFORM ERROR-RTN.                                           10220002
                                                                                
           EJECT                                                                
       CREATE-MFC-FROM-HST-RTN.                                                 
           IF NOT ACAT-SIGN-ON-UPDATE                                           
              MOVE 'USER DOES NOT HAVE CREATE AUTHORITY; PF6 IGNORED'           
                 TO SYSTEM-MSG                                                  
              MOVE -1 TO MACATL                                                 
              PERFORM ERROR-RTN                                                 
           END-IF.                                                              
           IF TWA-CALLING-PROG = 'ACAT22TH'                                     
LRM007     OR TWA-DUPE-FOUND = 'Y'                                              
           OR TWA-ACTIVE-DB = 'H'                                               
              CONTINUE                                                          
           ELSE                                                                 
              MOVE                                                              
             'PF6 ONLY AVAILABLE WHEN USER STARTS ON HISTORY DETAIL'            
                 TO SYSTEM-MSG                                                  
              MOVE -1 TO MACATL                                                 
              PERFORM ERROR-RTN                                                 
           END-IF.                                                              
                                                                                
      * THERE IS A VALID MFC DISPLAYED AT THIS POINT...                         
      * INSERT MFC HEADER AND ACAT33DB WILL PROCESS                             
      * ASSETS ONE-BY-ONE, TRYING TO COPY ALL TO INITIAL DB.                    
                                                                                
           MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR.                       
LRM007     IF TWA-DUPE-FOUND = 'Y'                                              
LRM007        MOVE TWA-CNTL-ASTD-NBR TO ACAT33IO-CNTL-ASTD-NBR                  
LRM007     ELSE                                                                 
              MOVE TWA-CONTROL-NBR   TO ACAT33IO-CNTL-ASTD-NBR                  
LRM007     END-IF.                                                              
LRM007     MOVE SPACES            TO ACAT33IO-CONTROL-NBR.                      
           MOVE TWA-DB2-STTLM-DT  TO ACAT33IO-STTLM-DT.                 02030002
LRM001     MOVE TWA-VALUE-FREE    TO ACAT33IO-VALUE-FREE.                       
           MOVE TWA-MCBRKR        TO ACAT33IO-RCV-NBR.                          
           MOVE TWA-MCACCT        TO ACAT33IO-RCV-ACCT.                         
           MOVE ACAT-ADP-BROKER   TO ACAT33IO-DLVR-NBR.                         
           MOVE TWA-MBR           TO ACAT33IO-DLVR-ACCT.                        
           MOVE TWA-MAC           TO ACAT33IO-DLVR-ACCT(4 : 5).                 
           MOVE 'MFC'             TO ACAT33IO-TRNFR-TYPE-CD                     
           MOVE TWA-MCTYPE        TO ACAT33IO-RCV-ACCT-TYPE-CD.         02030002
           MOVE TWA-MNAME         TO ACAT33IO-RCV-CUST-NM.              02030002
           MOVE TWA-MNAME2        TO ACAT33IO-RCV-CUST-NM(31 : 30).     02030002
           MOVE TWA-MSSN(1 : 3)   TO ACAT33IO-RCV-SS-PRIM-NBR(1 : 3).   02030002
           MOVE TWA-MSSN(5 : 2)   TO ACAT33IO-RCV-SS-PRIM-NBR(4 : 2).   02030002
           MOVE TWA-MSSN(8 : 4)   TO ACAT33IO-RCV-SS-PRIM-NBR(6 : 4).   02030002
           IF TWA-MSSN2(1 : 1) NOT GREATER SPACES                               
              MOVE SPACES           TO ACAT33IO-RCV-SS-SCNDY-NBR                
           ELSE                                                                 
              MOVE TWA-MSSN2(1 : 3) TO ACAT33IO-RCV-SS-SCNDY-NBR(1 : 3)         
              MOVE TWA-MSSN2(5 : 2) TO ACAT33IO-RCV-SS-SCNDY-NBR(4 : 2)         
              MOVE TWA-MSSN2(8 : 4) TO ACAT33IO-RCV-SS-SCNDY-NBR(6 : 4)         
           END-IF.                                                              
           SET ACAT33IO-NSCC-SUBMIT-HOLD     TO TRUE.                           
           MOVE TWA-MRR           TO ACAT33IO-RR-CD.                    02030002
                                                                                
           IF ACAT-OCC-BROKER > '000'                                           
              MOVE '0'             TO ACAT33IO-RCV-OCC-BRKR-NBR(1 : 1)          
              MOVE ACAT-OCC-BROKER TO ACAT33IO-RCV-OCC-BRKR-NBR(2 : 4)          
           ELSE                                                                 
              MOVE SPACES          TO ACAT33IO-RCV-OCC-BRKR-NBR.                
           SET ACAT33IO-NSCC-SUBMIT-HOLD TO TRUE.                               
           MOVE ' '   TO TWA-MSUBM.                                     02030002
           MOVE ZEROS     TO ACAT33IO-ASSET-SEQ-NBR.                            
           MOVE SPACES TO TWA-MCCMNT-X120                                       
                          TWA-M1CMNT-X120                                       
                          TWA-M2CMNT-X120                                       
                          TWA-M5CMNT-X120                                       
                          TWA-MMCMNT-X120                                       
                          TWA-MSCMNT-X120.                                      
           MOVE EIBTRMID  TO ACAT33IO-EIBTRMID.                                 
                                                                                
           SET ACAT33IO-COPY-HISTORY-TO-MFC TO TRUE.                            
LRM007     MOVE TWA-DUPE-FOUND TO ACAT33IO-DUPE-FOUND.                          
LRM009     MOVE ACAT-SIGN-ON-ID      TO ACAT33IO-SNON-ID                        
LRM009     MOVE ACAT-CICS-NETNAME    TO ACAT33IO-NETNAME                        
LRM009     MOVE ACAT-CICS-USER-ID    TO ACAT33IO-USER-ID                        
LRM009     MOVE ACAT-CICS-USER-NAME  TO ACAT33IO-USER-NAME                      
           PERFORM LINK-TO-ACAT33IO-RTN.                                        
           IF ACAT33IO-SQLCODE = -803                                           
              SET DUPLICATE-MFC TO TRUE                                         
******** REREAD THE MFC FROM THE INITIAL DB TO OBTAIN CORRECT VALUES.           
              SET ACAT33IO-IT-REREAD TO TRUE                                    
              PERFORM LINK-TO-ACAT33IO-RTN                                      
           ELSE                                                                 
           IF ACAT33IO-DB2-ERROR                                                
              MOVE 'COPY P'          TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT33IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT33IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
           MOVE 'MFC' TO TWA-INP-TFR-TYP  MMTFRO.                               
           MOVE 'I'    TO TWA-ACTIVE-DB ACAT33IO-ACTIVE-DB.                     
           MOVE 'C' TO TWA-ACTION.                                              
           PERFORM MOVE-ACAT33IO-TO-TWA-RTN.                                    
           MOVE ACAT33IO-RCV-NBR  TO TWA-ORIG-RCV-NBR                           
           MOVE ACAT33IO-RCV-ACCT TO TWA-ORIG-RCV-ACCT                          
           PERFORM REFORMAT-SCREEN-DETAIL.                                      
           MOVE SPACES TO TWA-INTRAN-FLAG                               01940002
******** READ FIRST ASSET.                                                      
           MOVE LOW-VALUES TO TWA-CURRENT-ASSET-KEY.                    02030002
           INITIALIZE ACAT33IO-PT-ASSET-FIELDS.                                 
           MOVE DFHPF6 TO EIBAID.                                               
           PERFORM PAGE-FORWARD-RTN                                     08610002
              THRU PAGE-FORWARD-RTN-EXIT.                                       
           IF ACAT33IO-ASSET-FOUND                                              
              MOVE 'C' TO TWA-SECR-ACTION                                       
           ELSE                                                                 
              MOVE SPACES TO TWA-ASSET-AREA                                     
              MOVE ZEROS  TO TWA-MQTY-9                                         
                             TWA-MAMT-9                                         
              MOVE 'A' TO TWA-SECR-ACTION                                       
           END-IF.                                                              
                                                                                
           PERFORM PROCESS-MAP-ITEMS THRU PROCESS-MAP-ITEMS-EXIT.               
           IF DUPLICATE-MFC                                                     
              MOVE 'MFC FOUND FOR THIS ACAT HISTORY' TO SYSTEM-MSG              
LRM007        MOVE 'PF2 TO CREATE ADDITIONAL TIF' TO PF6MSGO                    
LRM007        MOVE 'Y'  TO TWA-DUPE-FOUND                                       
LRM007        MOVE ACAT33IO-CONTROL-NBR TO TWA-CONTROL-NBR TWA-MACAT            
LRM007                                     MACATO                               
LRM007        MOVE ACAT33IO-CNTL-ASTD-NBR TO TWA-CNTL-ASTD-NBR                  
LRM007                                       ORGACATO                           
LRM007        MOVE ATT-ASKIP TO MACATA                                          
           ELSE                                                                 
              MOVE 'MFC CREATED; REVIEW ALL ASSETS' TO SYSTEM-MSG               
LRM007        MOVE ACAT33IO-CONTROL-NBR TO TWA-CONTROL-NBR TWA-MACAT            
LRM007                                     MACATO                               
LRM007        MOVE ATT-ASKIP TO MACATA                                          
LRM007        MOVE 'N'  TO TWA-DUPE-FOUND                                       
              IF ACAT33IO-MFC-ASSETS-CREATED > ZERO                             
                 MOVE ACAT33IO-MFC-ASSETS-CREATED TO WS-ASSET-ED                
                 MOVE WS-ASSET-X TO SYSTEM-MSG(32 : 4)                          
                 MOVE 'FND ACCT NBR REQD FOR ASSETS TO BE SENT'                 
                         TO SYSTEM-MSG(38 : 39)                                 
                 MOVE -1 TO MFUNDACL                                            
              ELSE                                                              
                 MOVE 'NO ASSETS FOUND ON MFC' TO SYSTEM-MSG(14 : 22)           
           END-IF.                                                              
                                                                                
           PERFORM SEND-MAP-DATA-ONLY.                                  10250002
           PERFORM WRITE-TSQ-RTN.                                       10790002
           PERFORM RETURN-TO-CICS.                                      08350002
                                                                        08960002
           EJECT                                                                
       UPDATE-ASSET-RTN.                                                        
           IF TWA-SECR-ACTION = 'A'                                             
              SET ACAT33IO-IT-ISRT-ASSET TO TRUE                                
              PERFORM LINK-TO-ACAT33IO-RTN                                      
              MOVE 'C' TO TWA-SECR-ACTION                                       
           ELSE                                                                 
           IF TWA-SECR-ACTION = 'C'                                             
              SET ACAT33IO-IT-UPD-ASSET TO TRUE                                 
              PERFORM LINK-TO-ACAT33IO-RTN                                      
           ELSE                                                                 
           IF TWA-SECR-ACTION = 'D'                                             
              SET ACAT33IO-IT-DEL-ASSET TO TRUE                                 
              PERFORM LINK-TO-ACAT33IO-RTN                                      
           END-IF.                                                              
           MOVE TWA-MSECR TO  TWA-ORIG-MSECR                                    
                              TWA-ORIG-SECR.                                    
           MOVE TWA-MSLOC TO  TWA-ORIG-SLOC.                                    
           MOVE TWA-MTYPE TO  TWA-ORIG-MTYPE.                                   
           MOVE ACAT33IO-CSH-MGN-SHRT-CD TO TWA-ORIG-TYPE.                      
                                                                                
           IF NOT ACAT33IO-GOOD-RESP                                            
              MOVE LOW-VALUE TO ACAT33MO                                03620002
              MOVE 'REPL A'          TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT33IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT33IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
           IF TWA-SECR-ACTION = 'D'                                             
              MOVE SPACES TO TWA-ASSET-AREA                                     
              MOVE ZEROS  TO TWA-MQTY-9                                         
                             TWA-MAMT-9                                         
              PERFORM REFORMAT-SCREEN-ASSET                                     
              MOVE 'ASSET DELETED' TO SYSTEM-MSG                                
              PERFORM READ-NEXT-ASSET-RTN.                                      
                                                                                
           EJECT                                                                
       READ-ACAT-RTN.                                                           
           MOVE SPACES TO ACAT33IO-CALL-AREA.                                   
           SET ACAT33IO-IT-READ TO TRUE.                                        
           MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR.                       
           MOVE TWA-MCBRKR        TO ACAT33IO-RCV-NBR.                          
           MOVE TWA-MCACCT        TO ACAT33IO-RCV-ACCT.                         
           MOVE ACAT-ADP-BROKER   TO ACAT33IO-DLVR-NBR.                         
           MOVE TWA-MBR           TO ACAT33IO-DLVR-ACCT.                        
           MOVE TWA-MAC           TO ACAT33IO-DLVR-ACCT(4 : 5).                 
           MOVE 'MFC'             TO ACAT33IO-TRNFR-TYPE-CD.                    
           PERFORM LINK-TO-ACAT33IO-RTN.                                        
           IF ACAT33IO-DB2-ERROR                                                
              MOVE 'READ'            TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT33IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT33IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
       READ-ACTIVE-MFC-RTN.                                                     
           MOVE SPACES TO ACAT33IO-CALL-AREA.                                   
           MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR.                       
           MOVE TWA-CONTROL-NBR TO ACAT33IO-CONTROL-NBR                         
           SET ACAT33IO-IT-GET-ACTIVE  TO TRUE                                  
           PERFORM LINK-TO-ACAT33IO-RTN.                                        
           IF ACAT33IO-DB2-ERROR                                                
              MOVE 'READ A'          TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT33IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT33IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
       READ-NEXT-ASSET-RTN.                                                     
           IF TWA-ACTION = '6'                                                  
              SET ACAT33IO-IT-READ-NEXTSA TO TRUE                               
           ELSE                                                                 
              SET ACAT33IO-IT-READ-NEXTS TO TRUE.                               
           PERFORM LINK-TO-ACAT33IO-RTN.                                        
                                                                                
           IF ACAT33IO-ASSET-FOUND                                              
              PERFORM MOVE-ACAT33IO-ASSET-TO-TWA                                
              PERFORM REFORMAT-SCREEN-ASSET                                     
              MOVE 'C' TO TWA-SECR-ACTION                                       
           END-IF.                                                              
                                                                                
           IF ACAT33IO-DB2-ERROR                                                
              MOVE LOW-VALUE TO ACAT33MO                                03620002
              MOVE 'NXT-A'           TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT33IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT33IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
       READ-ASSET-RTN.                                                          
           MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR.                       
           MOVE TWA-MCBRKR        TO ACAT33IO-RCV-NBR.                          
           MOVE TWA-MCACCT        TO ACAT33IO-RCV-ACCT.                         
           MOVE ACAT-ADP-BROKER   TO ACAT33IO-DLVR-NBR.                         
           MOVE TWA-MBR           TO ACAT33IO-DLVR-ACCT.                        
           MOVE TWA-MAC           TO ACAT33IO-DLVR-ACCT(4 : 5).                 
           MOVE TWA-MCTYPE        TO ACAT33IO-RCV-ACCT-TYPE-CD.         02030002
           MOVE 'MFC' TO ACAT33IO-TRNFR-TYPE-CD                                 
                                                                                
           MOVE TWA-ORIG-RCV-NBR   TO ACAT33IO-ORIG-RCV-NBR.                    
           MOVE TWA-ORIG-RCV-ACCT TO ACAT33IO-ORIG-RCV-ACCT.                    
                                                                                
           MOVE 'US' TO ACAT33IO-ISIN-CNTRY-CD                                  
           MOVE TWA-MSECR TO ACAT33IO-ISIN-SEC-ISSUE-CD.                        
           MOVE SPACES TO ACAT33IO-ISIN-SEC-CDG-CD                              
           MOVE TWA-MSLOC  TO ACAT33IO-STTLM-LCTN-CD.                           
           MOVE TWA-ADP-NBR TO ACAT33IO-ADP-NBR.                                
    **** SET ACAT33IO-PSTN-CD BASED ON POSITIVE OR NEGATIVE QTY BELOW.          
           IF TWA-MQTY-9 < ZERO                                                 
              SET ACAT33IO-SHORT-ASSET-QTY TO TRUE                              
           ELSE                                                                 
           IF TWA-MQTY-9 > ZERO                                                 
              SET ACAT33IO-LONG-ASSET-QTY TO TRUE                               
           ELSE                                                                 
              SET ACAT33IO-NA-ASSET-QTY TO TRUE                                 
           END-IF.                                                              
                                                                                
           IF TWA-MTYPE = '1'                                                   
              SET ACAT33IO-CASH-ASSET TO TRUE                                   
           ELSE                                                                 
           IF TWA-MTYPE = '2'                                                   
              SET ACAT33IO-MARGIN-ASSET TO TRUE                                 
           ELSE                                                                 
           IF TWA-MTYPE = '5'                                                   
              SET ACAT33IO-SHORT-ASSET TO TRUE                                  
           ELSE                                                                 
              MOVE SPACES TO ACAT33IO-CSH-MGN-SHRT-CD                           
           END-IF.                                                              
                                                                                
LRM001     MOVE TWA-VALUE-FREE    TO ACAT33IO-VALUE-FREE.                       
           SET ACAT33IO-IT-READ-ASSET TO TRUE                                   
           PERFORM LINK-TO-ACAT33IO-RTN                                         
           IF ACAT33IO-DB2-ERROR                                                
              MOVE LOW-VALUE TO ACAT33MO                                03620002
              MOVE 'GET-A'           TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT33IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT33IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
                                                                                
           SKIP3                                                                
       FORMAT-FROM-HISTORY-RTN.                                                 
           SET ACAT33IO-IT-GET-HISTORY TO TRUE.                                 
           MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR.                       
           MOVE ACAT-CONTROL-NBR  TO ACAT33IO-CONTROL-NBR.                      
           MOVE ACAT-INP-TFR-TYP  TO ACAT33IO-TRNFR-TYPE-CD.                    
                                                                                
           PERFORM LINK-TO-ACAT33IO-RTN.                                        
           IF ACAT33IO-HISTORY-FOUND                                            
           OR ACAT33IO-ACTIVE-FOUND                                             
           OR ACAT33IO-MFC-INITIAL-FOUND                                        
              MOVE ACAT33IO-ACTIVE-DB TO TWA-ACTIVE-DB                          
              PERFORM MOVE-ACAT33IO-TO-TWA-RTN                                  
              PERFORM REFORMAT-SCREEN-DETAIL                                    
              PERFORM MOVE-ACAT33IO-ASSET-TO-TWA                                
              PERFORM REFORMAT-SCREEN-ASSET                                     
              IF ACAT-SIGN-ON-UPDATE                                            
              AND ACAT33IO-TRNFR-TYPE-CD = 'MFC'                                
              AND ACAT33IO-ACTIVE-DB NOT = 'Y'                                  
              AND (ACAT33IO-NSCC-SUBMIT-ELIGABLE                                
                OR ACAT33IO-NSCC-SUBMIT-HOLD)                                   
                 MOVE 'C' TO TWA-ACTION                                         
              ELSE                                                              
                 IF ACAT-SIGN-ON-UPDATE                                         
                 AND ACAT33IO-TRNFR-TYPE-CD = 'MFC'                             
                    MOVE 'R' TO TWA-ACTION                                      
                 ELSE                                                           
                    MOVE 'B' TO TWA-ACTION                                      
                 END-IF                                                         
                 PERFORM ASKIP-MAP-RTN                                          
                 MOVE ATT-UNPROT TO  MACATA                                     
                 MOVE -1         TO  MACATL                                     
           END-IF.                                                              
                                                                                
           PERFORM PROCESS-MAP-ITEMS THRU PROCESS-MAP-ITEMS-EXIT.               
           IF ACAT33IO-ACTIVE-FOUND                                             
              IF TWA-INP-TFR-TYP = 'MFC'                                        
                 MOVE 'MFC TIF DISPLAYED' TO SYSTEM-MSG                         
              ELSE                                                              
                 MOVE 'MFC TIF DISPLAYED' TO SYSTEM-MSG                         
           ELSE                                                                 
              MOVE 'NO ACTIVE TIFS FOUND' TO SYSTEM-MSG                         
           END-IF.                                                              
                                                                                
           MOVE SPACES TO ACAT-CALLING-PROG-NAME                                
           IF EIBAID = DFHPF2                                                   
           AND NOT ACAT33IO-ACTIVE-FOUND                                        
              CONTINUE                                                          
           ELSE                                                                 
              PERFORM SEND-MAP-ERASE                                            
              PERFORM WRITE-TSQ-RTN                                     10790002
              PERFORM RETURN-TO-CICS.                                   08350002
                                                                                
           EJECT                                                                
       DELETE-ACAT-IT-RECORD.                                                   
           SET ACAT33IO-IT-DEL TO TRUE.                                         
           MOVE TWA-CLIENT-NO-X   TO ACAT33IO-CLIENT-NBR.                       
           MOVE TWA-MCBRKR        TO ACAT33IO-RCV-NBR.                          
           MOVE TWA-MCACCT        TO ACAT33IO-RCV-ACCT.                         
           MOVE ACAT-ADP-BROKER   TO ACAT33IO-DLVR-NBR.                         
           MOVE TWA-MBR           TO ACAT33IO-DLVR-ACCT.                        
           MOVE TWA-MAC           TO ACAT33IO-DLVR-ACCT(4 : 5).                 
           MOVE 'MFC'             TO ACAT33IO-TRNFR-TYPE-CD.                    
           MOVE TWA-ORIG-RCV-NBR   TO ACAT33IO-ORIG-RCV-NBR.                    
           MOVE TWA-ORIG-RCV-ACCT TO ACAT33IO-ORIG-RCV-ACCT.                    
           MOVE TWA-CONTROL-NBR   TO ACAT33IO-CONTROL-NBR.                      
           PERFORM LINK-TO-ACAT33IO-RTN.                                        
                                                                                
           IF ACAT33IO-DB2-ERROR                                                
              MOVE 'DELETE'          TO WS-DB2-PROBLEM-FUNCTION                 
              MOVE ACAT33IO-SQLCAID  TO WS-DB2-PROBLEM-TABLE                    
              MOVE ACAT33IO-SQLCODE  TO WS-DB2-PROBLEM-ID                       
              MOVE WS-DB2-PROBLEM-MSG TO SYSTEM-MSG                             
              PERFORM DB2-ERROR-RTN.                                            
           MOVE SPACES TO TWA-MAP-TABLE.                                02000002
           MOVE 'A' TO TWA-ACTION                                               
           PERFORM REFORMAT-SCREEN-DETAIL.                                      
           PERFORM REFORMAT-SCREEN-ASSET                                        
           PERFORM PROCESS-MAP-ITEMS THRU PROCESS-MAP-ITEMS-EXIT.               
           MOVE 'TIF DELETED' TO SYSTEM-MSG.                                    
           PERFORM SEND-MAP-ERASE.                                              
           PERFORM WRITE-TSQ-RTN.                                       10790002
           PERFORM RETURN-TO-CICS.                                      08350002
120800                                                                  10041009
       EJECT                                                                    
120800                                                                  10130002
120900 NOT-OPEN.                                                        10140002
           IF FIRST-TIME                                                        
              MOVE 'ACAT33FC' TO ACAT-PROGRAM-NAME                      08340002
              MOVE LOW-VALUES TO ACAT33MO.                                      
                                                                                
           PERFORM INIT-MAP-RTN.                                        07650005
           MOVE 'ACATVR FILE IS NOT AVAILABLE.' TO TRLMSGO.             10150002
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
              MOVE LOW-VALUE TO ACAT33MO                                        
125200        MOVE 'ACAT33 READ TSQ ERROR.'                             10430002
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
              MOVE LOW-VALUE TO ACAT33MO                                        
125200        MOVE 'ACAT33 WRITE TSQ ERROR.'                            10590002
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
           MOVE TWA-CALLING-PROG TO ACAT-CALLING-PROG-NAME.                     
127300     EXEC CICS RETURN                                             10800002
127400               TRANSID('ACAX')                                    10810002
127500               COMMAREA(ACATCOMM-COMMAREA)                        10820002
127600     END-EXEC.                                                    10830002
127700                                                                  10840002
127800 HANG-CICS.                                                       10850002
127900     GOBACK.                                                      10860002
