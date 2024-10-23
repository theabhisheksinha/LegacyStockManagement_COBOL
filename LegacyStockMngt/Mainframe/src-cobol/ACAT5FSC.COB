000001* PDX    - ACAT5FSC C0344162 09/16/13 08:37:49 TBLAMUR            00001000
LRM006* SSR 94296 RECOMPILE FOR EXPANDED BNWMASTW AND NEW VERSION               
000001*     OF COPYLIB NTWMASTP.                                                
000001* PDX    - ACAT5FSC C0323983 03/09/12 11:54:38 TBLAMUR            00001000
000001* PDX    - ACAT5FSC C0272581 12/06/08 10:36:02 TBLAMUR            00001000
000001* PDX    - ACAT5FSC C0263391 04/11/08 13:41:45 TBLAMUR            00001000
LRM005* SSR# 55766 ASCENDIS INTERFACE. ALLOW UPDATE FOR ASCENDIS USER,          
LRM005* WHEN HE WOULD HAVE HAD UPDATE AUTH BASED ON SNON IF NOT ASCEND.         
000001* PDX    - ACAT5FSC C0224301 08/16/05 15:28:40 TBDOJUN            00001000
DJ0002* DJ0002 SSR#43215 USE TRNFR-TYPE TO DETERMINE FULL-PARTIAL IND   00001000
DJ0002* DJ0002           FIX MATRIX LEVEL / NETWORK CONTROL IND         00001000
000001* PDX    - ACAT5FSC C0216396 06/10/05 14:39:10 TBLAMUR            00001000
LRM004* SSR 0039561 ALLOW LINK FROM J SCREEN AND RTN TO CALLER.                 
000001* PDX    - ACAT5FSC C0150439 04/25/05 15:46:02 TBLAMUR            00001000
000001* PDX    - ACAT5FSC C0215192 01/19/05 08:50:55 TBLAMUR            00001000
000001* PDX    - ACAT5FSC C0214488 12/08/04 12:55:56 TBLAMUR            00001000
LRM003* SSR 0039884 ALLOW LINK FROM E SCREEN AND RTN TO CALLER.                 
000001* PDX    - ACAT5FSC C0179784 09/27/02 09:52:13 TBEDTAK            00001000
000001* PDX    - ACAT5FSC C0151771 02/23/01 11:20:11 TBDOJUN            00001000
000001* PDX    - ACAT5FSC C0128918 07/29/99 14:54:31 TBTIKUO            00001000
000001* PDX    - ACAT5FSC C0120924 02/05/99 10:55:36 TBTARYB            00001000
000001* PDX    - ACAT5FSC C0113942 10/16/98 16:07:11 TBTARYB            00001000
      ******************************************************************        
       IDENTIFICATION DIVISION.                                                 
      ******************************************************************        
       PROGRAM-ID.    ACAT5FSC.                                                 
                                                                                
      *REMARKS.                                                                 
      ******************************************************************        
      * MUTUAL FUND: PROGRAM XCTL'D BY ACAT10NT, DISPLAYS              *        
      *      -  "MUTUAL FUND DELIVERER REGISTRATION"                   *        
      ******************************************************************        
TCK001* PDX#0128918 ----                                                        
TCK001*  (LOG# 254) ADD A DB2-MODE TO COPYBOOK.                                 
TCK001*             ALLOW DISPLAY MF INFO FOR REVIEW STATUS                     
      ******************************************************************        
                                                                                
      ******************************************************************        
       ENVIRONMENT DIVISION.                                                    
      ******************************************************************        
      ******************************************************************        
       DATA DIVISION.                                                           
      ******************************************************************        
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
       COPY PDXIDCOB.                                                           
       77  TWA-SIZE                       PIC S9(4) COMP.                       
       77  FIRST-TIME-SW                  PIC  X(01).                           
           88  FIRST-TIME                              VALUE 'Y'.               
           88  NOT-FIRST-TIME                          VALUE 'N'.               
       77  WS-CODE                        PIC  9(03)   VALUE 0.                 
       77  WS-ACAT-NEXT                   PIC  X(01)   VALUE SPACES.            
       77  CALLED-PROGRAM-NAME            PIC  X(08)   VALUE SPACES.            
       77  ERR-ACAT10NT                   PIC  X(78)   VALUE                    
           'PROGRAM ACAT10NT IS NOT AVAILABLE'.                                 
       77  NTW-HOUSE-ACCOUNT              PIC  X(20)   VALUE SPACES.            
       77  NTW-HOUSE-ACCT                 PIC  X(01)   VALUE 'N'.               
       77  NTW-OMNIBUS-ACCT               PIC  X(01)   VALUE 'N'.               
DJ0002 77  NTW-DST-MFE-ACCT               PIC  X(01)   VALUE 'N'.               
       77  WS-REGIST-RECEIV-BKR           PIC  X(01)   VALUE ' '.               
       77  W-FILE-NAME                    PIC  X(8)    VALUE SPACES.            
       77  WS-BRCH                        PIC  X(03)   VALUE SPACES.            
       77  WS-ACCT                        PIC  X(05)   VALUE SPACES.            
       77  RANGE-FOUND                    PIC  X(01)   VALUE 'N'.               
       77  S1                             PIC  9(03)   VALUE ZEROES.            
       77  WS-REG-DIVD-PAYEE-IND          PIC  X(01)   VALUE SPACES.            
       77  STOP-SW                        PIC  X(01).                           
           88  STOP-OK                                 VALUE 'Y'.               
           88  STOP-NOT-OK                             VALUE 'N'.               
                                                                                
       01  WS-CLIENT-NBR                  PIC  X(03).                           
       01  WS-CLIENT-NBR-N REDEFINES                                            
           WS-CLIENT-NBR                  PIC  9(03).                           
                                                                                
       01  WK-EDIT-MOD.                                                         
           05  REQUEST-TYPE            PIC X(01) VALUE 'G'.                     
           05  NO-OF-ACCT-NUMBERS      PIC S9(02) VALUE +1 COMP-3.              
           05  BR-ACCT-TC-IN.                                                   
            07  BR-ACCT-IN.                                                     
               10  CK-BRANCH           PIC X(03).                               
               10  CK-ACCT             PIC X(05).                               
            07  TC-IN.                                                          
               10  CK-TYPE             PIC X(01).                               
               10  CK-DIGIT            PIC X(01).                               
           05  BR-ACCT-TC-OUT.                                                  
               10  BR-ACCT-OUT         PIC X(08).                               
               10  TC-OUT              PIC X(02).                               
           05  EDIT-RETURN-CODE        PIC X(01).                               
                                                                                
       01  WS-EXEC-BKR-REC-NO     COMP-3  PIC  9(03)   VALUE ZEROES.            
       01  WS-EXEC-BKR-REC.                                                     
           05  WS-EXEC-BKR-ENTRY  OCCURS 200 TIMES.                             
               15  WS-EXEC-BKR-BRCH-LO    PIC  X(03).                           
               15  WS-EXEC-BKR-BRCH-HI    PIC  X(03).                           
               15  WS-EXEC-BKR-CLEAR      PIC  X(04).                           
                                                                                
       01  WS-TSQ-AREA.                                                         
           05  WS-TS-NAME.                                                      
               10 TERM-ID                 PIC  X(04).                           
               10 TRAN-ID                 PIC  X(04).                           
               10 ITEM-NUMBER             PIC S9(04) COMP VALUE +1.             
                                                                                
       01  WS-DATE-AREA.                                                        
           05  WSABSTIME                  PIC S9(08) COMP.                      
           05  WSMMDDYY.                                                        
               09 WS-CUR-MM               PIC  XX.                              
               09  FILLER                 PIC  X.                               
               09 WS-CUR-DD               PIC  XX.                              
               09  FILLER                 PIC  X.                               
               09 WS-CUR-YY               PIC  XX.                              
           05  WSDATESEP                  PIC  X(01) VALUE '/'.                 
           05  WSTIME.                                                          
               09  WS-TIME-HH             PIC  XX.                              
               09  FILLER                 PIC  X.                               
               09  WS-TIME-MM             PIC  XX.                              
               09  FILLER                 PIC  X.                               
               09  WS-TIME-SS             PIC  XX.                              
           05  WSTIMESEP                  PIC  X(01) VALUE ':'.                 
           05  WS-DB2-FORM-DATE.                                                
               09  WS-DATE-CC             PIC  X(02).                           
               09  WS-DATE-YY             PIC  X(02).                           
               09  FILLER                 PIC  X(01).                           
               09  WS-DATE-MM             PIC  X(02).                           
               09  FILLER                 PIC  X(01).                           
               09  WS-DATE-DD             PIC  X(02).                           
           05  WS-EDITED-DATE.                                                  
               09  WS-EDITED-MM           PIC  X(02).                           
               09  FILLER                 PIC  X(01) VALUE '/'.                 
               09  WS-EDITED-DD           PIC  X(02).                           
               09  FILLER                 PIC  X(01) VALUE '/'.                 
               09  WS-EDITED-YY           PIC  X(02).                           
                                                                                
       01  B1-PRINT-FILE.                                                       
           05  B1-PRINT-KEY.                                                    
               10  B1-PRINT-CLIENT          PIC  9(03)  COMP-3.                 
               10  B1-PRINT-CARD            PIC  9(06)  COMP-3.                 
               10  B1-PRINT-CLIENT-2        PIC  9(03)  COMP-3.                 
               10  B1-PRINT-SEQUENCE        PIC  9(05)  COMP-3.                 
           05  FILLER                       PIC  X(01)  VALUE ' '.              
           05  B1-COMMON-AREA               PIC  X(35).                         
           05  FIL1  REDEFINES  B1-COMMON-AREA.                                 
434336         10  B1-REGIST-RECEIVE-BKR    PIC  X(04).                         
               10  FILLER                   PIC  X(31).                         
434619     05  FIL2  REDEFINES  B1-COMMON-AREA.                                 
               10  B1-REG-DIVD-PAYEE-IND    PIC  X(01).                         
               10  FILLER                   PIC  X(34).                         
540167     05  FIL3  REDEFINES  B1-COMMON-AREA.                                 
               10  B1-EXEC-BKR-LO           PIC  X(03).                         
               10  B1-EXEC-BKR-HI           PIC  X(03).                         
               10  B1-EXEC-BKR-CLEAR        PIC  X(04).                         
               10  FILLER                   PIC  X(25).                         
                                                                                
       01  ERROR-MESSAGES.                                                      
           05  ERR-BAD-DB2.                                                     
               10  FILLER                 PIC  X(26)   VALUE                    
                   'DB2 FAILED WITH SQLCODE = '.                                
               10  ERR-BAD-DB2-CODE       PIC  -999.                            
                                                                                
           EJECT                                                                
           COPY ACATFIO.                                                        
                                                                                
           EJECT                                                                
           COPY ACAT5FIO.                                                       
                                                                                
           EJECT                                                                
           COPY ACATF5M.                                                        
                                                                                
           EJECT                                                        01660002
           COPY ACATCOM.                                                        
                                                                                
           EJECT                                                                
       01  MF-REG-KEY.                                                          
           05  MF-REG-CLIENT                PIC  X(03).                         
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  MF-REG-CUSIP                 PIC  X(09).                         
           05  FILLER                       PIC  X(04)  VALUE SPACES.           
                                                                                
       01  MF-REG-REC.                                                          
           COPY BNWREGOP.                                                       
                                                                                
           EJECT                                                                
           COPY MFRIOW.                                                         
                                                                                
           EJECT                                                                
       01  MAST-REC.                                                            
           COPY BNWMASTW.                                                       
                                                                                
           EJECT                                                                
           COPY DFHAID.                                                         
                                                                                
           EJECT                                                                
           COPY ATTR.                                                           
                                                                                
           EJECT                                                                
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
       01  DFHCOMMAREA.                                                         
           05  FILLER                    PIC X(2100).                           
                                                                                
           EJECT                                                                
      ******************************************************************        
       PROCEDURE DIVISION.                                                      
      ******************************************************************        
                                                                                
           EJECT                                                                
      *****************                                                         
       MAIN-PROCESSING.                                                         
      *****************                                                         
                                                                                
                                                                                
           EXEC CICS IGNORE CONDITION DUPKEY DUPREC  ENDFILE  ERROR             
                     ILLOGIC INVREQ   IOERR  ITEMERR LENGERR  MAPFAIL           
                     NOSPACE NOSTG    NOTFND         PGMIDERR QIDERR            
           END-EXEC.                                                            
                                                                                
*PROD*     MOVE DFHCOMMAREA                 TO  ACATCOMM-COMMAREA.              
*PROD*                                                                          
*PROD*     IF  ACAT-PROGRAM-NAME = 'ACAT5FSC'                                   
*PROD*         MOVE SPACES                  TO  ACAT-CALLING-PROG-NAME          
               PERFORM READ-COMMAREA                                            
               PERFORM RECEIVE-MAP                                              
               EVALUATE ACAT5FIO-NSCC-PEND-CD                                   
                  WHEN 'Y'                                                      
                     PERFORM XCTL-RTN                                           
                  WHEN OTHER                                                    
                     PERFORM BASIC-PROCESSING                                   
               PERFORM BASIC-PROCESSING                                         
           ELSE                                                                 
LRM005         MOVE ACAT-PROGRAM-NAME TO  ACAT5FIO-CALL-RTN-PROGRAM             
               MOVE 'ACAT5FSC'              TO  ACAT-PROGRAM-NAME               
               PERFORM FIRST-TIME-RTN                                           
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ******************                                                        
       BASIC-PROCESSING.                                                        
      ******************                                                        
                                                                                
           IF M5ERRMSGI (1:12) = 'INITIAL ASSE'                                 
              PERFORM XCTL-RTN                                                  
           ELSE                                                                 
           IF M5LITERI = 'UNDO CHANGES:'                                        
              PERFORM CHECK-FOR-UPDATES                                         
              IF ACAT5FIO-UPDATE-DATABASE                                       
                 PERFORM UNDO-CHANGES-VALIDATION                                
                 IF M5VALUEI = ' '                                              
                    PERFORM PREPARE-FIELDS                                      
                    PERFORM DATA-VALIDATION                                     
                    IF M5ERRMSGO = SPACES OR LOW-VALUES                         
                       IF EIBAID = DFHENTER                                     
                          PERFORM XCTL-RTN                                      
                       ELSE                                                     
                          PERFORM PROTECT-FIELDS                                
                          MOVE '     CONFIRM:' TO M5LITERO                      
                          MOVE -1              TO M5VALUEL                      
                       MOVE 'YOU ARE ABOUT TO UPDATE THE DATABASE - PLEA        
      -                     'SE CONFIRM WITH Y, OR REJECT WITH N'               
                                            TO  M5ERRMSGO                       
                       END-IF                                                   
                    END-IF                                                      
                    PERFORM SEND-MAP-DATAONLY                                   
                    PERFORM RETURN-TO-CICS                                      
                 ELSE                                                           
                    IF EIBAID = DFHENTER                                        
                       PERFORM FIRST-TIME-RTN                                   
                    END-IF                                                      
                    PERFORM XCTL-RTN                                            
                 END-IF                                                         
              ELSE                                                              
                 IF EIBAID = DFHENTER                                           
                    PERFORM PREPARE-FIELDS                                      
                    MOVE SPACES             TO  M5ERRMSGO                       
                                                M5VALUEO                        
                 END-IF                                                         
                 PERFORM XCTL-RTN                                               
              END-IF                                                            
           ELSE                                                                 
              IF M5LITERI = '     CONFIRM:'                                     
                 PERFORM CONFIRMATION-VALIDATION                                
                 IF M5VALUEI = 'Y'                                              
                    IF ACAT5FIO-NSCC-PEND-CD = 'A'                              
                       MOVE ' '                TO  ACAT5FIO-NSCC-PEND-CD        
                    END-IF                                                      
                    PERFORM LINK-TO-DB2                                         
                    PERFORM FORMAT-MAP-OUTPUT                                   
                 ELSE                                                           
                    IF EIBAID = DFHENTER                                        
                       PERFORM PREPARE-FIELDS                                   
                       MOVE 'UNDO CHANGES:'    TO  M5LITERO                     
                       MOVE SPACES             TO  M5VALUEO                     
                                                   M5ERRMSGO                    
                       MOVE -1                 TO  M5CACNL                      
                       PERFORM SEND-MAP-DATAONLY                                
                       PERFORM RETURN-TO-CICS                                   
                    END-IF                                                      
                 END-IF                                                         
                 MOVE SPACES                   TO  M5ERRMSGO                    
                                                   M5VALUEO                     
                 MOVE 'UNDO CHANGES:'          TO  M5LITERO                     
                 PERFORM XCTL-RTN                                               
              ELSE                                                              
                 PERFORM XCTL-RTN                                               
              END-IF                                                            
           END-IF                                                               
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       CHECK-FOR-UPDATES.                                                       
      *******************                                                       
                                                                                
           IF M5CACNI      NOT = ACAT5FIO-M5CACN    OR                          
              M5NCII       NOT = ACAT5FIO-M5NCI     OR                          
              M5DIVI       NOT = ACAT5FIO-M5DIV     OR                          
              M5ATII       NOT = ACAT5FIO-M5ATI     OR                          
              M5PAYINDI NOT = ACAT5FIO-M5PAYIND     OR                          
              M5BPHI       NOT = ACAT5FIO-M5BPH     OR                          
              M5EXBI       NOT = ACAT5FIO-M5EXB     OR                          
              M5FPII       NOT = ACAT5FIO-M5FPI                                 
              SET ACAT5FIO-UPDATE-DATABASE TO TRUE                              
           ELSE                                                                 
              MOVE 'N'                TO  ACAT5FIO-READ-UPDATE-DATABASE         
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ******************                                                        
       FIRST-TIME-RTN.                                                          
      ******************                                                        
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF5'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACATFIO-COMMAREA)                            
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
                                                                                
           MOVE SPACES                      TO  M5ERRMSGO.                      
           MOVE ACATFIO-CLIENT-NBR          TO  ACAT5FIO-CLIENT-NBR.            
           MOVE ACATFIO-DLVR-NBR            TO  ACAT5FIO-DLVR-NBR.              
           MOVE ACATFIO-RCV-NBR             TO  ACAT5FIO-RCV-NBR.               
           MOVE ACATFIO-ACCT-DLVR-NBR       TO  ACAT5FIO-ACCT-DLVR-NBR.         
           MOVE ACATFIO-ACCT-RCV-NBR        TO  ACAT5FIO-ACCT-RCV-NBR.          
           MOVE ACATFIO-ISIN-CNTRY-CD       TO  ACAT5FIO-ISIN-CNTRY-CD.         
           MOVE ACATFIO-ISIN-SEC-ISSUE-CD TO ACAT5FIO-ISIN-SEC-ISSUE-CD.        
           MOVE ACATFIO-ISIN-SEC-CDG-CD     TO ACAT5FIO-ISIN-SEC-CDG-CD.        
           MOVE ACATFIO-STTLM-LCTN-CD       TO ACAT5FIO-STTLM-LCTN-CD.          
           MOVE ACATFIO-CSH-MGN-SHRT-CD     TO ACAT5FIO-CSH-MGN-SHRT-CD.        
           MOVE ACATFIO-TRANS-TYPE-CD       TO  ACAT5FIO-TRANS-TYPE-CD.         
           MOVE ACATFIO-ASSET-DESC-TXT      TO  ACAT5FIO-ASSET-DESC-TXT.        
           MOVE ACATFIO-SECURITY-ADP-NBR   TO ACAT5FIO-SECURITY-ADP-NBR.        
LRM005     IF   ACATFIO-DB2-MODE = 'I'                                          
LRM005        MOVE 'B'                     TO ACAT5FIO-DB2-MODE                 
LRM005        SET ACAT5FIO-READ-INIT-DB    TO  TRUE                             
LRM005     ELSE                                                                 
TCK001        MOVE ACATFIO-DB2-MODE        TO ACAT5FIO-DB2-MODE                 
              SET ACAT5FIO-READ-DATABASE   TO  TRUE                             
LRM005     END-IF.                                                              
TCK001     MOVE ACATFIO-ACAT-CONTROL-NBR   TO ACAT5FIO-ACAT-CONTROL-NBR.        
TCK001     MOVE ACATFIO-ASSET-SEQ-NBR      TO ACAT5FIO-ASSET-SEQ-NBR.           
LRM005     MOVE ACATFIO-TRNFR-TYPE-CD      TO ACAT5FIO-TRNFR-TYPE-CD.           
                                                                                
           SET FIRST-TIME                   TO  TRUE.                           
           SET ACAT5FIO-NOT-FIRST-TIME      TO  TRUE.                           
                                                                                
           PERFORM LINK-TO-DB2.                                                 
                                                                                
TCK001     IF ACAT5FIO-UPDATE-ALLOWED                                           
              PERFORM PREPARE-FIELDS                                            
TCK001     ELSE                                                                 
TCK001        PERFORM PROTECT-FIELDS                                            
TCK001     END-IF.                                                              
                                                                                
           PERFORM FORMAT-MAP-OUTPUT.                                           
           EVALUATE ACAT5FIO-NSCC-PEND-CD                                       
              WHEN 'Y'                                                          
                 PERFORM PROTECT-FIELDS                                         
                 MOVE 'RECORD HAS ALREADY BEEN SENT TO NSCC - NO UPDATES        
      -               ' CAN BE DONE AT THIS TIME'                               
                                               TO  M5ERRMSGO                    
              WHEN 'A'                                                          
                 MOVE 'RECORD HAS BEEN ACKNOWLEDGED BY NSCC - UPDATES WI        
      -               'LL CAUSE RETRANSMISSION'                                 
                                               TO  M5ERRMSGO                    
              WHEN OTHER                                                        
                 CONTINUE                                                       
           END-EVALUATE.                                                        
                                                                                
DJ0001     IF  ACAT-SIGN-ON-UPDATE                                              
LRM005     OR  ACAT-SIGN-ON-ASCENDIS-RSTRCT                                     
DJ0001         CONTINUE                                                         
DJ0001     ELSE                                                                 
DJ0001         PERFORM PROTECT-FIELDS                                           
DJ0001         MOVE '(BROWSE ONLY)'         TO  M5LITERO                        
DJ0001         MOVE ATT-PROT                TO  M5VALUEA                        
DJ0001     END-IF.                                                              
                                                                                
           PERFORM SEND-MAP-ERASE.                                              
                                                                                
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       FORMAT-MAP-OUTPUT.                                                       
      *******************                                                       
                                                                                
           INITIALIZE ACATF5MO.                                                 
                                                                                
           MOVE -1                          TO  M5CACNL.                        
                                                                                
           MOVE ACAT5FIO-ISIN-SEC-ISSUE-CD  TO  M5SECO.                         
                                                                                
           MOVE ACAT5FIO-ASSET-DESC-TXT     TO  M5DESO.                         
                                                                                
           MOVE 'FUND ACCOUNT NUMBER:'      TO  M5CACN1O.                       
           MOVE ACAT5FIO-FNBR               TO  M5CACNO                         
                                                ACAT5FIO-M5CACN.                
                                                                                
           MOVE 'NETWORK LEVEL:'            TO  M5NCI1O.                        
           MOVE ACAT5FIO-NTWRK-CNTL-CD      TO  M5NCIO                          
                                                ACAT5FIO-M5NCI.                 
                                                                                
           MOVE 'DIVIDEND CODE:'            TO  M5DIV1O.                        
           EVALUATE TRUE                                                        
              WHEN ACAT5FIO-DVDND-CD = 'C'  AND                                 
                   ACAT5FIO-LTCG-CD  = 'C'  AND                                 
                   ACAT5FIO-STCG-CD  = 'C'                                      
                   MOVE '0'                 TO  M5DIVO                          
                                                ACAT5FIO-M5DIV                  
              WHEN ACAT5FIO-DVDND-CD = 'R'  AND                                 
                   ACAT5FIO-LTCG-CD  = 'R'  AND                                 
                   ACAT5FIO-STCG-CD  = 'R'                                      
                   MOVE '1'                 TO  M5DIVO                          
                                                ACAT5FIO-M5DIV                  
              WHEN ACAT5FIO-DVDND-CD = 'C'  AND                                 
                   ACAT5FIO-LTCG-CD  = 'C'  AND                                 
                   ACAT5FIO-STCG-CD  = 'R'                                      
                   MOVE '2'                 TO  M5DIVO                          
                                                ACAT5FIO-M5DIV                  
              WHEN ACAT5FIO-DVDND-CD = 'C'  AND                                 
                   ACAT5FIO-LTCG-CD  = 'R'  AND                                 
                   ACAT5FIO-STCG-CD  = 'R'                                      
                   MOVE '3'                 TO  M5DIVO                          
                                                ACAT5FIO-M5DIV                  
              WHEN ACAT5FIO-DVDND-CD = 'C'  AND                                 
                   ACAT5FIO-LTCG-CD  = 'R'  AND                                 
                   ACAT5FIO-STCG-CD  = 'C'                                      
                   MOVE '4'                 TO  M5DIVO                          
                                                ACAT5FIO-M5DIV                  
              WHEN ACAT5FIO-DVDND-CD = 'R'  AND                                 
                   ACAT5FIO-LTCG-CD  = 'C'  AND                                 
                   ACAT5FIO-STCG-CD  = 'C'                                      
                   MOVE '5'                 TO  M5DIVO                          
                                                ACAT5FIO-M5DIV                  
              WHEN ACAT5FIO-DVDND-CD = 'R'  AND                                 
                   ACAT5FIO-LTCG-CD  = 'R'  AND                                 
                   ACAT5FIO-STCG-CD  = 'C'                                      
                   MOVE '6'                 TO  M5DIVO                          
                                                ACAT5FIO-M5DIV                  
              WHEN ACAT5FIO-DVDND-CD = 'R'  AND                                 
                   ACAT5FIO-LTCG-CD  = 'C'  AND                                 
                   ACAT5FIO-STCG-CD  = 'R'                                      
                   MOVE '7'                 TO  M5DIVO                          
                                                ACAT5FIO-M5DIV                  
              WHEN OTHER                                                        
                   MOVE SPACES              TO  M5DIVO                          
                                                ACAT5FIO-M5DIV                  
           END-EVALUATE.                                                        
                                                                                
           MOVE 'ACCOUNT TYPE INDICATOR:'   TO  M5ATI1O.                        
           MOVE ACAT5FIO-ACCT-TYPE-CD       TO  M5ATIO                          
                                                ACAT5FIO-M5ATI.                 
                                                                                
           MOVE 'DIVIDEND PAYEE IND:'       TO  M5PAYI1O.                       
           EVALUATE ACAT5FIO-DVDND-PAYEE-CD                                     
              WHEN '0'                                                          
                 MOVE 'C'                   TO  M5PAYINDO                       
                                                ACAT5FIO-M5PAYIND               
              WHEN '1'                                                          
                 MOVE 'F'                   TO  M5PAYINDO                       
                                                ACAT5FIO-M5PAYIND               
              WHEN '2'                                                          
                 MOVE 'E'                   TO  M5PAYINDO                       
                                                ACAT5FIO-M5PAYIND               
              WHEN OTHER                                                        
                 MOVE 'N'                   TO  M5PAYINDO                       
                                                ACAT5FIO-M5PAYIND               
           END-EVALUATE.                                                        
                                                                                
           MOVE 'BOOK/PHYSICAL INDICATOR:'  TO  M5BPH1O.                        
           MOVE ACAT5FIO-BK-PHSCL-SHR-CD    TO  M5BPHO                          
                                                ACAT5FIO-M5BPH.                 
                                                                                
           MOVE 'EXECUTING BROKER:'         TO  M5EXB1O.                        
           MOVE ACAT5FIO-BRKR-EXCTG-NBR     TO  M5EXBO                          
                                                ACAT5FIO-M5EXB.                 
                                                                                
           MOVE 'FULL/PARTIAL INDICATOR:'   TO  M5FPI1O.                        
           EVALUATE ACAT5FIO-MF-FULL-PRTL-CD                                    
              WHEN '1'                                                          
                 MOVE 'F'                   TO  M5FPIO                          
                                                ACAT5FIO-M5FPI                  
              WHEN '2'                                                          
                 MOVE 'P'                   TO  M5FPIO                          
                                                ACAT5FIO-M5FPI                  
           END-EVALUATE.                                                        
                                                                                
TCK001     IF ACAT5FIO-BROWSE-ONLY                                              
TCK001        MOVE ' THIS TRANSFER IS IN REVIEW STATUS, BROWSE ONLY!'           
TCK001                                      TO  M5ERRMSGO                       
TCK001        MOVE SPACES                   TO  M5LITERO                        
TCK001                                          M5VALUEO                        
TCK001     ELSE                                                                 
              MOVE 'UNDO CHANGES:'          TO  M5LITERO                        
              MOVE ' '                      TO  M5VALUEO.                       
                                                                                
           EJECT                                                                
      ***************                                                           
       READ-COMMAREA.                                                           
      ***************                                                           
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF5'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT5FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ****************                                                          
       SEND-MAP-ERASE.                                                          
      ****************                                                          
                                                                                
           PERFORM GET-DATE-AND-TIME.                                           
                                                                                
           MOVE 'ACAX'                      TO  M5TRIDO.                        
           MOVE WSMMDDYY                    TO  M5DATEO.                        
           MOVE WSTIME                      TO  M5TIMEO.                        
                                                                                
           EXEC CICS SEND MAP('ACATF5M')                                        
                          MAPSET('ACATF5M')                                     
                          FROM(ACATF5MO)                                        
                          CURSOR                                                
                          ERASE                                                 
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *******************                                                       
       SEND-MAP-DATAONLY.                                                       
      *******************                                                       
                                                                                
           PERFORM GET-DATE-AND-TIME.                                           
           MOVE 'ACAX'                      TO  M5TRIDO.                        
           MOVE WSMMDDYY                    TO  M5DATEO.                        
           MOVE WSTIME                      TO  M5TIMEO.                        
                                                                                
           EXEC CICS SEND MAP('ACATF5M')                                        
                          MAPSET('ACATF5M')                                     
                          FROM(ACATF5MO)                                        
                          DATAONLY                                              
                          CURSOR                                                
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *************                                                             
       RECEIVE-MAP.                                                             
      *************                                                             
                                                                                
           MOVE LOW-VALUES                  TO  ACATF5MI.                       
                                                                                
           EXEC CICS  RECEIVE MAP('ACATF5M')                                    
                              MAPSET('ACATF5M')                                 
                              INTO(ACATF5MI)                                    
           END-EXEC.                                                            
                                                                                
                                                                                
           EJECT                                                                
      *****************                                                         
       DATA-VALIDATION.                                                         
      *****************                                                         
                                                                                
           MOVE SPACES                      TO  M5ERRMSGO.                      
                                                                                
           IF M5FPII = (SPACES OR LOW-VALUES) AND                               
              ACAT5FIO-TRANS-TYPE-CD = 'A'                                      
              MOVE 'FULL/PARTIAL INDICATOR IS REQUIRED WHEN TRANSACTION         
      -            ' TYPE IS ADD'           TO  M5ERRMSGO                       
                 MOVE -1                    TO  M5FPIL                          
           ELSE                                                                 
              IF M5FPII = ('F' OR 'P' OR SPACES)                                
                 EVALUATE M5FPII                                                
                    WHEN 'F'                                                    
                       MOVE '1'             TO  ACAT5FIO-MF-FULL-PRTL-CD        
                    WHEN 'P'                                                    
                       MOVE '2'             TO  ACAT5FIO-MF-FULL-PRTL-CD        
                    WHEN OTHER                                                  
                       MOVE SPACES          TO  ACAT5FIO-MF-FULL-PRTL-CD        
                 END-EVALUATE                                                   
              ELSE                                                              
                 MOVE 'FULL/PARTIAL INDICATOR MUST BE F OR P OR BLANK'          
                                            TO  M5ERRMSGO                       
                 MOVE -1                    TO  M5FPIL                          
                 MOVE ATT-UNPROT-BRT-MDT    TO  M5FPIA                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M5EXBL NOT = ZERO                                                 
              MOVE M5EXBI                   TO  ACAT5FIO-BRKR-EXCTG-NBR         
           END-IF.                                                              
           IF ACAT5FIO-BRKR-EXCTG-NBR = SPACES AND                              
              ACAT5FIO-TRANS-TYPE-CD = 'A'                                      
              MOVE 'EXECUTING BROKER NUMBER IS REQUIRED WHEN TRANSACTION        
      -            ' TYPE IS ADD'           TO  M5ERRMSGO                       
              MOVE -1                       TO  M5EXBL                          
           ELSE                                                                 
              IF ACAT5FIO-BRKR-EXCTG-NBR NUMERIC                                
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE 'EXECUTING BROKER NUMBER MUST BE NUMERIC'                 
                                            TO  M5ERRMSGO                       
                 MOVE -1                    TO  M5EXBL                          
                 MOVE ATT-UNPROT-BRT-MDT    TO  M5EXBA                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M5BPHL NOT = ZERO                                                 
              MOVE M5BPHI                   TO  ACAT5FIO-BK-PHSCL-SHR-CD        
           END-IF.                                                              
           IF ACAT5FIO-BK-PHSCL-SHR-CD = (SPACES OR LOW-VALUES) AND             
              ACAT5FIO-TRANS-TYPE-CD = 'A'                                      
              MOVE 'BOOK/PHYSICAL SHARE INDICATOR IS REQURIED WHEN TRANS        
      -            'ACTION TYPE IS ADD'     TO  M5ERRMSGO                       
              MOVE -1                       TO  M5BPHL                          
              MOVE ATT-UNPROT-BRT-MDT       TO  M5BPHA                          
           ELSE                                                                 
              IF ACAT5FIO-BK-PHSCL-SHR-CD = ('0' OR '1' OR '2' OR ' ')          
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE 'BOOK/PHYSICAL INDICATOR MUST BE 0, 1,2 OR BLANK'         
                                            TO  M5ERRMSGO                       
                 MOVE -1                    TO  M5BPHL                          
                 MOVE ATT-UNPROT-BRT-MDT    TO  M5BPHA                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M5PAYINDI = (SPACES OR LOW-VALUES) AND                            
              ACAT5FIO-TRANS-TYPE-CD = 'A'                                      
              MOVE 'DIVIDEND PAYEE INDICATOR IS REQUIRED WHEN TRANSACTIO        
      -            'N TYPE IS ADD'          TO  M5ERRMSGO                       
              MOVE -1                       TO  M5PAYINDL                       
           ELSE                                                                 
              IF M5PAYINDI = ('C' OR 'F' OR 'E' OR 'N' OR SPACES)               
                 EVALUATE M5PAYINDI                                             
                    WHEN 'C'                                                    
                       MOVE '0'             TO  ACAT5FIO-DVDND-PAYEE-CD         
                    WHEN 'F'                                                    
                       MOVE '1'             TO  ACAT5FIO-DVDND-PAYEE-CD         
                    WHEN 'E'                                                    
                       MOVE '2'             TO  ACAT5FIO-DVDND-PAYEE-CD         
                    WHEN 'N'                                                    
                       MOVE 'N'             TO  ACAT5FIO-DVDND-PAYEE-CD         
                    WHEN OTHER                                                  
                       MOVE SPACES          TO  ACAT5FIO-DVDND-PAYEE-CD         
                 END-EVALUATE                                                   
              ELSE                                                              
                 MOVE 'DIVIDEND PAYEED INDICATOR MUST BE C, F, E OR N'          
                                            TO  M5ERRMSGO                       
                 MOVE -1                    TO  M5PAYINDL                       
                 MOVE ATT-UNPROT-BRT-MDT    TO  M5PAYINDA                       
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M5ATIL NOT = ZERO                                                 
              MOVE M5ATII                   TO  ACAT5FIO-ACCT-TYPE-CD           
           END-IF.                                                              
           IF ACAT5FIO-ACCT-TYPE-CD = (SPACES OR LOW-VALUES) AND                
              ACAT5FIO-TRANS-TYPE-CD = 'A'                                      
              MOVE 'ACCOUNT TYPE INDICATOR IS REQUIRED WHEN TRANSACTION         
      -            ' TYPE IS ADD'           TO  M5ERRMSGO                       
              MOVE -1                       TO  M5ATIL                          
           ELSE                                                                 
              IF ACAT5FIO-ACCT-TYPE-CD = ('1' OR '2')                           
                 CONTINUE                                                       
              ELSE                                                              
                 MOVE 'ACCOUNT TYPE INDICATOR MUST BE 1 OR 2'                   
                                            TO  M5ERRMSGO                       
                 MOVE -1                    TO  M5ATIL                          
                 MOVE ATT-UNPROT-BRT-MDT    TO  M5ATIA                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M5DIVI = (SPACES OR LOW-VALUES) AND                               
              ACAT5FIO-TRANS-TYPE-CD = 'A'                                      
              MOVE 'DIVIDEND CODE IS REQUIRED WHEN TRANSACTION TYPE IS A        
      -            'DD'                     TO  M5ERRMSGO                       
              MOVE -1                       TO  M5DIVL                          
           ELSE                                                                 
              EVALUATE M5DIVI                                                   
                 WHEN '0'                                                       
                    MOVE 'C'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'C'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'C'             TO  ACAT5FIO-STCG-CD                   
                 WHEN '1'                                                       
                    MOVE 'R'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'R'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'R'             TO  ACAT5FIO-STCG-CD                   
                 WHEN '2'                                                       
                    MOVE 'C'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'C'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'R'             TO  ACAT5FIO-STCG-CD                   
                 WHEN '3'                                                       
                    MOVE 'C'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'R'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'R'             TO  ACAT5FIO-STCG-CD                   
                 WHEN '4'                                                       
                    MOVE 'C'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'R'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'C'             TO  ACAT5FIO-STCG-CD                   
                 WHEN '5'                                                       
                    MOVE 'R'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'C'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'C'             TO  ACAT5FIO-STCG-CD                   
                 WHEN '6'                                                       
                    MOVE 'R'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'R'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'C'             TO  ACAT5FIO-STCG-CD                   
                 WHEN '7'                                                       
                    MOVE 'R'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'C'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'R'             TO  ACAT5FIO-STCG-CD                   
                 WHEN OTHER                                                     
                   MOVE 'DIVIDEND CODE MUST BE 0, 1, 2, 3, 4, 5, 6 OR 7'        
                                            TO  M5ERRMSGO                       
                   MOVE -1                  TO  M5DIVL                          
                   MOVE ATT-UNPROT-BRT-MDT  TO  M5DIVA                          
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
           IF M5NCIL NOT = ZERO                                                 
              MOVE M5NCII                   TO  ACAT5FIO-NTWRK-CNTL-CD          
           END-IF.                                                              
           IF ACAT5FIO-NTWRK-CNTL-CD = SPACES AND                               
              ACAT5FIO-TRANS-TYPE-CD = 'A'                                      
              MOVE 'NETWORK CONTROL INDICATOR IS REQUIRED WHEN TRANSACTI        
      -            'ON TYPE IS ADD'         TO  M5ERRMSGO                       
              MOVE -1                       TO  M5NCIL                          
           ELSE                                                                 
LRM006        IF ACAT5FIO-NTWRK-CNTL-CD = ('0' OR '3' OR '4')                   
                 CONTINUE                                                       
              ELSE                                                              
LRM006           MOVE 'NETWORK LEVEL MUST BE 0, 3 OR 4'                         
                                            TO  M5ERRMSGO                       
                 MOVE -1                    TO  M5NCIL                          
                 MOVE ATT-UNPROT-BRT-MDT    TO  M5NCIA                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M5CACNI = (SPACES OR LOW-VALUES) AND                              
              ACAT5FIO-TRANS-TYPE-CD = 'A'                                      
              MOVE 'FUND ACCOUNT NUMBER IS REQUIRED WHEN TRANSACTION TYP        
      -            'E IS ADD'            TO  M5ERRMSGO                          
              MOVE -1                    TO  M5CACNL                            
              MOVE ATT-UNPROT-BRT-MDT    TO  M5CACNA                            
           ELSE                                                                 
              MOVE M5CACNI               TO  ACAT5FIO-FNBR                      
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ************************                                                  
       UNDO-CHANGES-VALIDATION.                                                 
      ************************                                                  
                                                                                
           EVALUATE TRUE                                                        
              WHEN M5VALUEI = (' ' OR 'Y')                                      
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 MOVE 'UNDO CHANGES FIELD SHOULD BE BLANK TO CONTINUE, O        
      -               'R Y TO STOP AND UNDO CHANGES'                            
                                         TO  M5ERRMSGO                          
                 MOVE -1                 TO  M5VALUEL                           
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *************************                                                 
       CONFIRMATION-VALIDATION.                                                 
      *************************                                                 
                                                                                
           EVALUATE TRUE                                                        
              WHEN M5VALUEI = ('Y' OR 'N')                                      
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 MOVE 'CONFIRMATION FIELD CAN BE ONLY Y OR N'                   
                                         TO  M5ERRMSGO                          
                 MOVE -1                 TO  M5VALUEL                           
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      **********                                                                
       XCTL-RTN.                                                                
      **********                                                                
                                                                                
           EVALUATE TRUE                                                        
              WHEN EIBAID = DFHPF11 OR DFHCLEAR                                 
                 PERFORM RETURN-CONTROL-RTN                                     
              WHEN EIBAID = DFHPF10 OR DFHPF12                                  
                 PERFORM RETURN-CONTROL-TO-MAIN                                 
              WHEN EIBAID = DFHENTER                                            
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
              WHEN OTHER                                                        
                 MOVE 'INVALID PF KEY'         TO  M5ERRMSGO                    
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *************                                                             
       LINK-TO-DB2.                                                             
      *************                                                             
                                                                                
TCK001**   MOVE 'Y'                    TO  ACAT5FIO-ACTIAST-FOUND-SW.           
                                                                                
           EXEC CICS LINK PROGRAM('ACAT5FDB')                                   
                         COMMAREA(ACAT5FIO-COMMAREA)                            
           END-EXEC.                                                            
                                                                                
TCK001     IF ACAT5FIO-ACTIAST-FOUND-SW = 'N'   AND                             
TCK001        ACAT5FIO-UPDATE-ALLOWED                                           
              MOVE ACAT5FIO-ISIN-SEC-ISSUE-CD TO M5SECO                         
              MOVE ACAT5FIO-ASSET-DESC-TXT TO M5DESO                            
              MOVE -1                         TO M5SECL                         
TCK001*       MOVE 'INITIAL ASSET RECORD DOES NOT EXIST, PLEASE EXIT!'          
TCK001        MOVE '  ASSET RECORD DOES NOT EXIST, PLEASE EXIT!      '          
                                            TO M5ERRMSGO                        
              PERFORM DARK-AND-PROTECT                                          
              PERFORM SEND-MAP-ERASE                                            
TCK001**      PERFORM RETURN-TO-CICS                                            
TCK001        PERFORM RETURN-CONTROL-TO-MAIN                                    
           END-IF.                                                              
                                                                                
TCK001     IF ACAT5FIO-VASSET-FOUND-SW = 'N'    AND                             
TCK001        ACAT5FIO-BROWSE-ONLY                                              
TCK001        MOVE ACAT5FIO-ISIN-SEC-ISSUE-CD TO M5SECO                         
TCK001        MOVE ACAT5FIO-ASSET-DESC-TXT TO M5DESO                            
TCK001        MOVE -1                         TO M5SECL                         
TCK001        MOVE '  ASSET RECORD DOES NOT EXIST, PLEASE EXIT!      '          
TCK001                                      TO M5ERRMSGO                        
TCK001        PERFORM DARK-AND-PROTECT                                          
TCK001        PERFORM SEND-MAP-ERASE                                            
TCK001        PERFORM RETURN-CONTROL-TO-MAIN                                    
           END-IF.                                                              
                                                                                
           IF ACAT5FIO-DB2-BAD-RETURN                                           
              MOVE LOW-VALUES               TO  ACATF5MO                        
              MOVE ACAT5FIO-DB2-RETURN-CODE TO  ERR-BAD-DB2-CODE                
              MOVE ERR-BAD-DB2              TO  M5ERRMSGO                       
              IF FIRST-TIME                                                     
                 MOVE ACAT5FIO-DB2-RETURN-CODE TO WS-CODE                       
                 IF WS-CODE = 100                                               
                    PERFORM CREATE-DEFAULTS                                     
                 END-IF                                                         
              ELSE                                                              
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       CREATE-DEFAULTS.                                                         
      *****************                                                         
                                                                                
           MOVE ACAT5FIO-CLIENT-NBR (2:3)   TO  WS-CLIENT-NBR.                  
           MOVE ACAT5FIO-ACCT-DLVR-NBR (1:3) TO WS-BRCH                         
                                                CK-BRANCH.                      
           MOVE ACAT5FIO-ACCT-DLVR-NBR (4:5) TO WS-ACCT                         
                                                CK-ACCT.                        
                                                                                
           MOVE WS-CLIENT-NBR               TO  MF-REG-CLIENT.                  
           MOVE ACAT5FIO-ISIN-SEC-ISSUE-CD  TO  MF-REG-CUSIP.                   
                                                                                
           EXEC CICS READ DATASET('NTWREG')                                     
                          INTO(MF-REG-REC)                                      
                          RIDFLD(MF-REG-KEY)                                    
                          KEYLENGTH(18)                                         
           END-EXEC.                                                            
                                                                                
           IF WS-CLIENT-NBR = CLIENT-NO OF MF-REG-REC  AND                      
              ACAT5FIO-ISIN-SEC-ISSUE-CD = CUSIP-9 OF MF-REG-REC                
              IF REG-OP-HOUSE-ACCT > SPACES                                     
                 MOVE REG-OP-HOUSE-ACCT     TO  NTW-HOUSE-ACCOUNT               
                 MOVE 'Y'                   TO  NTW-HOUSE-ACCT                  
              END-IF                                                            
              IF PROCESSING-CODE OF MF-REG-REC = 'O'                            
                 MOVE 'Y'                   TO  NTW-OMNIBUS-ACCT                
              END-IF                                                            
DJ0002        IF PROCESSING-CODE OF MF-REG-REC = 'D'                            
DJ0002           MOVE 'Y'                   TO  NTW-DST-MFE-ACCT                
DJ0002        END-IF                                                            
           END-IF.                                                              
                                                                                
           PERFORM READ-MASTER-NTWK.                                            
                                                                                
           MOVE SPACES                   TO  ACAT5FIO-FNBR.                     
                                                                                
           IF ACAT5FIO-TRANS-TYPE-CD = 'A'                                      
              MOVE WS-CLIENT-NBR         TO  ACAT5FIO-FNBR (1:3)                
              MOVE ACAT5FIO-ACCT-DLVR-NBR (1:8)                                 
                                         TO  ACAT5FIO-FNBR (4:8)                
              MOVE TC-OUT                TO  ACAT5FIO-FNBR (12:2)               
           END-IF.                                                              
           MOVE '0'                      TO  ACAT5FIO-NTWRK-CNTL-CD.            
           MOVE 'R'                      TO  ACAT5FIO-DVDND-CD                  
                                             ACAT5FIO-LTCG-CD                   
                                             ACAT5FIO-STCG-CD.                  
           MOVE '1'                      TO  ACAT5FIO-ACCT-TYPE-CD.             
           MOVE '1'                      TO  ACAT5FIO-BK-PHSCL-SHR-CD.          
           MOVE 'N'                      TO  ACAT5FIO-DVDND-PAYEE-CD.           
           MOVE '2'                      TO  ACAT5FIO-MF-FULL-PRTL-CD.          
                                                                                
           IF IO-SUCCESSFUL                                                     
              EVALUATE TRUE                                                     
LEVEL            WHEN MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'                   
                    MOVE WS-CLIENT-NBR   TO  ACAT5FIO-FNBR (1:3)                
                    MOVE ACAT5FIO-ACCT-DLVR-NBR (1:8)                           
                                         TO  ACAT5FIO-FNBR (4:8)                
                    MOVE TC-OUT          TO  ACAT5FIO-FNBR (12:2)               
                 WHEN MATRIX-LEVEL = '6'                                        
                    MOVE CUST-ACCT-NO    TO  ACAT5FIO-FNBR                      
                 WHEN OTHER                                                     
                    IF NTW-HOUSE-ACCT = 'Y'                                     
                       MOVE NTW-HOUSE-ACCOUNT TO ACAT5FIO-FNBR                  
                    END-IF                                                      
              END-EVALUATE                                                      
DJ0002        IF  MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'                       
DJ0002            MOVE MATRIX-LEVEL      TO  ACAT5FIO-NTWRK-CNTL-CD             
DJ0002        ELSE                                                              
DJ0002            MOVE '0'               TO  ACAT5FIO-NTWRK-CNTL-CD             
DJ0002        END-IF                                                            
              EVALUATE DIVIDEND-CODE                                            
                 WHEN '0'                                                       
                    MOVE 'C'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'C'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'C'             TO  ACAT5FIO-STCG-CD                   
                 WHEN '1'                                                       
                    MOVE 'R'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'R'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'R'             TO  ACAT5FIO-STCG-CD                   
                 WHEN '2'                                                       
                    MOVE 'C'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'C'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'R'             TO  ACAT5FIO-STCG-CD                   
                 WHEN '3'                                                       
                    MOVE 'C'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'R'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'R'             TO  ACAT5FIO-STCG-CD                   
                                                                                
              WHEN '4'                                                          
                    MOVE 'C'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'R'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'C'             TO  ACAT5FIO-STCG-CD                   
                 WHEN '5'                                                       
                    MOVE 'R'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'C'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'C'             TO  ACAT5FIO-STCG-CD                   
                 WHEN '6'                                                       
                    MOVE 'R'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'R'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'C'             TO  ACAT5FIO-STCG-CD                   
                 WHEN '7'                                                       
                    MOVE 'R'             TO  ACAT5FIO-DVDND-CD                  
                    MOVE 'C'             TO  ACAT5FIO-LTCG-CD                   
                    MOVE 'R'             TO  ACAT5FIO-STCG-CD                   
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
           IF NTW-OMNIBUS-ACCT = 'Y'                                            
              MOVE NTW-HOUSE-ACCOUNT        TO  ACAT5FIO-FNBR                   
           END-IF.                                                              
                                                                                
           IF NTW-OMNIBUS-ACCT = 'Y' OR                                         
              NTW-HOUSE-ACCT = 'Y'   OR                                         
             (IO-SUCCESSFUL AND MATRIX-LEVEL = '3')                             
              MOVE '2'                      TO  ACAT5FIO-ACCT-TYPE-CD           
           ELSE                                                                 
              IF IO-SUCCESSFUL                                                  
                 IF MATRIX-LEVEL = '1' OR '2' OR '4' OR '6'                     
                    MOVE '1'             TO  ACAT5FIO-ACCT-TYPE-CD              
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF NTW-HOUSE-ACCT = 'Y' OR                                           
              NTW-OMNIBUS-ACCT = 'Y' OR                                         
             (IO-SUCCESSFUL AND MATRIX-LEVEL = '6')                             
              MOVE '1'                TO  ACAT5FIO-BK-PHSCL-SHR-CD              
           ELSE                                                                 
              IF IO-SUCCESSFUL                                                  
                 IF MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'                     
                    MOVE '0'             TO  ACAT5FIO-BK-PHSCL-SHR-CD           
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE 'N'                         TO  RANGE-FOUND.                    
           SET STOP-NOT-OK                  TO  TRUE.                           
           MOVE ACAT5FIO-CLIENT-NBR (2:3)   TO  B1-PRINT-CLIENT                 
                                                B1-PRINT-CLIENT-2.              
           MOVE 1                           TO  B1-PRINT-SEQUENCE.              
           MOVE LOW-VALUES                  TO  B1-COMMON-AREA.                 
           MOVE 540167                      TO  B1-PRINT-CARD.                  
                                                                                
           EXEC CICS STARTBR  DATASET('B1PRINT')                                
                              RIDFLD(B1-PRINT-KEY)                              
                              GTEQ                                              
           END-EXEC.                                                            
                                                                                
           EXEC CICS READNEXT DATASET('B1PRINT')                                
                              INTO(B1-PRINT-FILE)                               
                              RIDFLD(B1-PRINT-KEY)                              
           END-EXEC.                                                            
                                                                                
           PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 200 OR                     
              STOP-OK OR RANGE-FOUND = 'Y'                                      
            IF EIBRCODE = SPACES OR LOW-VALUES                                  
              IF WS-CLIENT-NBR-N = B1-PRINT-CLIENT AND                          
                 B1-PRINT-CARD = 540167                                         
                 IF WS-BRCH >= B1-EXEC-BKR-LO AND                               
                    WS-BRCH <= B1-EXEC-BKR-HI                                   
                    MOVE B1-EXEC-BKR-CLEAR  TO  ACAT5FIO-BRKR-EXCTG-NBR         
                    MOVE 'Y'                TO  RANGE-FOUND                     
                 ELSE                                                           
                    EXEC CICS READNEXT DATASET('B1PRINT')                       
                                       INTO(B1-PRINT-FILE)                      
                                       RIDFLD(B1-PRINT-KEY)                     
                                       LENGTH(LENGTH OF B1-PRINT-FILE)          
                                       KEYLENGTH(LENGTH OF B1-PRINT-KEY)        
                    END-EXEC                                                    
              ELSE                                                              
                 SET STOP-OK                TO  TRUE                            
              END-IF                                                            
            ELSE                                                                
              SET STOP-OK                   TO  TRUE                            
            END-IF                                                              
           END-PERFORM.                                                         
                                                                                
           IF RANGE-FOUND = 'N' OR                                              
             (RANGE-FOUND = 'Y' AND                                             
              ACAT5FIO-BRKR-EXCTG-NBR = ('0000' OR                              
                                        SPACES OR                               
                                        LOW-VALUES))                            
              MOVE 434636                   TO  B1-PRINT-CARD                   
              PERFORM READ-B1-FILE                                              
              IF EIBRCODE = SPACES OR LOW-VALUES                                
                 MOVE B1-REGIST-RECEIVE-BKR TO  ACAT5FIO-BRKR-EXCTG-NBR         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF NTW-OMNIBUS-ACCT = 'Y'                                            
              MOVE 434636                   TO  B1-PRINT-CARD                   
              PERFORM READ-B1-FILE                                              
              IF EIBRCODE = SPACES OR LOW-VALUES                                
                 MOVE B1-REGIST-RECEIVE-BKR TO  ACAT5FIO-BRKR-EXCTG-NBR         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF NTW-OMNIBUS-ACCT = 'Y' OR                                         
              NTW-HOUSE-ACCT = 'Y'                                              
              MOVE '1'                      TO  ACAT5FIO-DVDND-PAYEE-CD         
           ELSE                                                                 
           IF IO-SUCCESSFUL                                                     
              IF MATRIX-LEVEL = '1' OR '2' OR '3' OR '4'                        
                 EVALUATE PAYABLE-INFO-INDICATOR                                
                    WHEN '0'                                                    
                        MOVE '0'            TO  ACAT5FIO-DVDND-PAYEE-CD         
                    WHEN '3'                                                    
                       MOVE '1'             TO  ACAT5FIO-DVDND-PAYEE-CD         
                    WHEN OTHER                                                  
                       MOVE 'N'             TO  ACAT5FIO-DVDND-PAYEE-CD         
                 END-EVALUATE                                                   
              END-IF                                                            
           ELSE                                                                 
              MOVE 434619                   TO  B1-PRINT-CARD                   
              PERFORM READ-B1-FILE                                              
              IF EIBRCODE = SPACES OR LOW-VALUES                                
                 MOVE B1-REG-DIVD-PAYEE-IND TO  WS-REG-DIVD-PAYEE-IND           
              END-IF                                                            
              EVALUATE WS-REG-DIVD-PAYEE-IND                                    
                 WHEN '0'                                                       
                    MOVE 'N'                TO  ACAT5FIO-DVDND-PAYEE-CD         
                 WHEN '1'                                                       
                    MOVE '0'                TO  ACAT5FIO-DVDND-PAYEE-CD         
                 WHEN '2'                                                       
                    MOVE '1'                TO  ACAT5FIO-DVDND-PAYEE-CD         
                 WHEN '3'                                                       
                    MOVE '2'                TO  ACAT5FIO-DVDND-PAYEE-CD         
                 WHEN OTHER                                                     
                    MOVE 'N'                TO  ACAT5FIO-DVDND-PAYEE-CD         
              END-EVALUATE                                                      
           END-IF                                                               
           END-IF.                                                              
                                                                                
DJ0002     MOVE '2'                         TO  ACAT5FIO-MF-FULL-PRTL-CD        
           IF NTW-OMNIBUS-ACCT = 'Y' OR                                         
DJ0002        NTW-DST-MFE-ACCT = 'Y' OR                                         
              NTW-HOUSE-ACCT = 'Y'                                              
              MOVE '2'                      TO  ACAT5FIO-MF-FULL-PRTL-CD        
           ELSE                                                                 
DJ0002        IF ACAT5FIO-TRNFR-TYPE-CD = 'FUL'                                 
DJ0002        AND (MATRIX-LEVEL = '1' OR '2' OR '3' OR '4')                     
                 MOVE '1'                   TO  ACAT5FIO-MF-FULL-PRTL-CD        
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ******************                                                        
       READ-MASTER-NTWK.                                                        
      ******************                                                        
                                                                                
           INITIALIZE MAST-KEY-AREA.                                            
           MOVE 0                           TO  PAYABLE-SEQUENCE-NO.            
           MOVE ZEROES                      TO  ACCT-ID OF MAST-REC.            
           MOVE WS-CLIENT-NBR               TO  CLIENT-NO OF MAST-REC           
                                                CLIENT OF MAST-REC.             
DJ0002     MOVE ACAT5FIO-ISIN-SEC-ISSUE-CD  TO  CUSIP-9 OF MAST-REC             
           MOVE WS-BRCH                     TO  BRANCH-3 OF MAST-REC.           
           MOVE WS-ACCT                     TO  ACCT-5 OF MAST-REC.             
           EVALUATE ACAT5FIO-CSH-MGN-SHRT-CD                                    
              WHEN 'C'                                                          
                 MOVE '1'                   TO  CK-TYPE                         
              WHEN 'M'                                                          
                 MOVE '2'                   TO  CK-TYPE                         
              WHEN 'S'                                                          
                 MOVE '5'                   TO  CK-TYPE                         
              WHEN OTHER                                                        
                 MOVE ' '                   TO  CK-TYPE                         
           END-EVALUATE.                                                        
           MOVE 'X'                         TO  CK-DIGIT.                       
           EXEC CICS LINK PROGRAM('EDITMOD')                                    
                          COMMAREA(WK-EDIT-MOD)                                 
           END-EXEC.                                                            
           IF EDIT-RETURN-CODE = SPACES                                         
              MOVE TC-OUT                   TO  ACCT-TYPE-CHK-DGT               
                                                OF MAST-REC                     
           END-IF.                                                              
                                                                                
           MOVE 3                           TO  W-IO-FUNCTION.                  
           PERFORM 8000-IO-MAST.                                                
                                                                                
      *    MOVE 1                           TO  W-IO-FUNCTION                   
      *    PERFORM 8000-IO-MAST.                                                
                                                                                
           COPY NTWMASTP.                                                       
                                                                                
           IF WS-CLIENT-NBR = CLIENT-NO OF MAST-REC            AND              
              ACAT5FIO-ISIN-SEC-ISSUE-CD = CUSIP-9 OF MAST-REC AND              
              WS-BRCH = BRANCH-3 OF MAST-REC                   AND              
              WS-ACCT = ACCT-5   OF MAST-REC                   AND              
              TC-OUT  = ACCT-TYPE-CHK-DGT OF MAST-REC                           
              SET IO-SUCCESSFUL             TO  TRUE                            
DJ0002     ELSE                                                                 
DJ0002        SET IO-NOTFND                 TO  TRUE                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      **************                                                            
       READ-B1-FILE.                                                            
      **************                                                            
                                                                                
           MOVE ACAT5FIO-CLIENT-NBR (2:3)   TO  B1-PRINT-CLIENT                 
                                                B1-PRINT-CLIENT-2.              
           MOVE 1                           TO  B1-PRINT-SEQUENCE.              
           MOVE LOW-VALUES                  TO  B1-COMMON-AREA.                 
                                                                                
           EXEC CICS READ   DATASET('B1PRINT')                                  
                            INTO(B1-PRINT-FILE)                                 
                            RIDFLD(B1-PRINT-KEY)                                
                            LENGTH(LENGTH OF B1-PRINT-FILE)                     
                            KEYLENGTH(LENGTH OF B1-PRINT-KEY)                   
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *****************                                                         
      *B1-IO-ERROR-RTN.                                                         
      *****************                                                         
                                                                                
      *    MOVE 'B1 FILE: I/O ERROR'        TO  M5ERRMSGO.                      
      *                                                                         
      *    PERFORM SEND-MAP-ERASE.                                              
      *    PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ****************                                                          
       PREPARE-FIELDS.                                                          
      ****************                                                          
                                                                                
           MOVE ATT-ASKIP-MDT               TO  M5CACN1A                        
                                                M5NCI1A                         
                                                M5DIV1A                         
                                                M5ATI1A                         
                                                M5PAYI1A                        
                                                M5BPH1A                         
                                                M5EXB1A                         
                                                M5FPI1A                         
                                                M5LITERA.                       
           MOVE ATT-ASKIP-MDT               TO  M5ERRMSGA.                      
                                                                                
           MOVE ATT-UNPROT-MDT              TO  M5CACNA                         
                                                M5BPHA                          
                                                M5NCIA                          
                                                M5ATIA                          
                                                M5DIVA                          
                                                M5PAYINDA                       
                                                M5EXBA                          
                                                M5FPIA                          
                                                M5VALUEA.                       
                                                                                
           EJECT                                                                
      ****************                                                          
       PROTECT-FIELDS.                                                          
      ****************                                                          
                                                                                
           MOVE ATT-PROT-MDT                TO  M5CACNA                         
                                                M5BPHA                          
                                                M5NCIA                          
                                                M5ATIA                          
                                                M5DIVA                          
                                                M5PAYINDA                       
                                                M5EXBA                          
                                                M5FPIA.                         
                                                                                
           EJECT                                                                
      **************                                                            
       CLEAR-FIELDS.                                                            
      **************                                                            
                                                                                
           MOVE SPACES                      TO  M5CACNO                         
                                                M5BPHO                          
                                                M5NCIO                          
                                                M5ATIO                          
                                                M5DIVO                          
                                                M5PAYINDO                       
                                                M5EXBO                          
                                                M5FPIO.                         
                                                                                
           MOVE ATT-PROT-MDT                TO  M5CACNA                         
                                                M5BPHA                          
                                                M5NCIA                          
                                                M5ATIA                          
                                                M5DIVA                          
                                                M5PAYINDA                       
                                                M5EXBA                          
                                                M5FPIA.                         
           EJECT                                                                
      ******************                                                        
       DARK-AND-PROTECT.                                                        
      ******************                                                        
                                                                                
           MOVE ATT-PROT-DRK-MDT            TO  M5CACN1A                        
                                                M5NCI1A                         
                                                M5DIV1A                         
                                                M5ATI1A                         
                                                M5PAYI1A                        
                                                M5BPH1A                         
                                                M5EXB1A                         
                                                M5FPI1A                         
                                                M5CACNA                         
                                                M5NCIA                          
                                                M5NCIA                          
                                                M5DIVA                          
                                                M5ATIA                          
                                                M5PAYINDA                       
                                                M5BPHA                          
                                                M5EXBA                          
                                                M5FPIA.                         
                                                                                
           EJECT                                                                
      *******************                                                       
       GET-DATE-AND-TIME.                                                       
      *******************                                                       
                                                                                
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
      ********************                                                      
       SEND-CONTROL-ERASE.                                                      
      ********************                                                      
                                                                                
           EXEC CICS SEND CONTROL                                               
                          ERASE                                                 
                          FREEKB                                                
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ************************                                                  
       READ-ACAT5FIO-COMMAREA.                                                  
      ************************                                                  
                                                                                
           MOVE EIBTRMID                   TO  TERM-ID.                         
           MOVE 'AMF5'                     TO  TRAN-ID.                         
           MOVE +1                         TO  ITEM-NUMBER.                     
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT5FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ********************                                                      
       RETURN-CONTROL-RTN.                                                      
      ********************                                                      
                                                                                
           PERFORM SEND-CONTROL-ERASE.                                          
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF5'                      TO  TERM-ID.                        
                                                                                
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
                                                                                
           EXEC CICS XCTL PROGRAM ('RATT01')                                    
           END-EXEC.                                                            
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ****************                                                          
       RETURN-TO-CICS.                                                          
      ****************                                                          
                                                                                
           MOVE EIBTRMID                   TO  TERM-ID.                         
           MOVE 'AMF5'                     TO  TRAN-ID.                         
           MOVE +1                         TO  ITEM-NUMBER.                     
                                                                                
           IF FIRST-TIME                                                        
              EXEC CICS                                                         
                 DELETEQ TS QUEUE(WS-TS-NAME)                                   
              END-EXEC                                                          
              EXEC CICS                                                         
                 WRITEQ TS QUEUE(WS-TS-NAME)                                    
                           FROM(ACAT5FIO-COMMAREA)                              
                           ITEM(ITEM-NUMBER)                                    
              END-EXEC                                                          
              SET NOT-FIRST-TIME           TO  TRUE                             
           ELSE                                                                 
              EXEC CICS                                                         
                 WRITEQ TS QUEUE(WS-TS-NAME)                                    
                           FROM(ACAT5FIO-COMMAREA)                              
                           ITEM(ITEM-NUMBER)                                    
                           REWRITE                                              
              END-EXEC                                                          
           END-IF.                                                              
                                                                                
*TEST**    EXEC CICS RETURN                                                     
*TEST**              TRANSID('AMF2')                                            
*TEST**              COMMAREA(ACATCOMM-COMMAREA)                                
*TEST**    END-EXEC.                                                            
                                                                                
*PROD*     EXEC CICS RETURN                                                     
*PROD*               TRANSID('ACAX')                                            
*PROD*               COMMAREA(ACATCOMM-COMMAREA)                                
*PROD*     END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ************************                                                  
       RETURN-CONTROL-TO-MAIN.                                                  
      ************************                                                  
                                                                                
           PERFORM SEND-CONTROL-ERASE.                                          
                                                                                
      *    MOVE EIBTRMID                    TO  TERM-ID.                        
      *    MOVE 'AMF5'                      TO  TERM-ID.                        
      *    EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
      *    END-EXEC.                                                            
                                                                                
           MOVE 'H'                         TO  WS-ACAT-NEXT.                   
           COPY ACATJUMP.                                                       
                                                                                
TCK001     MOVE 'ACAT5FSC'                  TO  ACAT-CALLING-PROG-NAME.         
LRM004     IF ACAT5FIO-CALL-RTN-PROGRAM = 'ACAT11PT'                            
LRM004        MOVE ACAT5FIO-CALL-RTN-PROGRAM TO CALLED-PROGRAM-NAME             
LRM004     ELSE                                                                 
TCK001        MOVE 'ACAT10NT'  TO CALLED-PROGRAM-NAME                           
LRM004     END-IF.                                                              
TCK001     EXEC CICS XCTL PROGRAM(CALLED-PROGRAM-NAME)                          
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE ERR-ACAT10NT                TO  M5ERRMSGO.                      
           MOVE SPACES                      TO  ACAT-CALLING-PROG-NAME.         
                                                                                
           PERFORM SEND-MAP-DATAONLY.                                           
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
           COPY WCPIOERP.                                                       
                                                                                
           EJECT                                                                
      ***********                                                               
       HANG-CICS.                                                               
      ***********                                                               
                                                                                
           GOBACK.                                                              
                                                                                
