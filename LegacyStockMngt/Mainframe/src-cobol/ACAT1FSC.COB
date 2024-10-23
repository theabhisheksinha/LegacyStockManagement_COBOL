000001* PDX    - ACAT1FSC C0323983 03/09/12 11:43:51 TBLAMUR            00001000
LRM005* SSR# 81383 SUNSET NETWORK LEVELS 1,2                                    
000001* PDX    - ACAT1FSC C0263391 04/11/08 13:34:41 TBLAMUR            00001000
LRM004* SSR# 55766 ASCENDIS INTERFACE. ALLOW UPDATE FOR ASCENDIS USER,          
LRM004* WHEN HE WOULD HAVE HAD UPDATE AUTH BASED ON SNON IF NOT ASCEND.         
000001* PDX    - ACAT1FSC C0263391 04/10/08 16:25:35 TBLAMUR            00001000
000001* PDX    - ACAT1FSC C0214488 12/08/04 11:36:26 TBLAMUR            00001000
LRM003* SSR 0039884 ALLOW LINK FROM E SCREEN AND RTN TO CALLER.                 
000001* PDX    - ACAT1FSC C0151771 02/23/01 11:13:37 TBDOJUN            00001000
000001* PDX    - ACAT1FSC C0120352 01/25/99 11:11:18 TBTARYB            00001000
000001* PDX    - ACAT1FSC C0119770 12/28/98 14:01:22 TBTARYB            00001000
000001* PDX    - ACAT1FSC C0118708 12/24/98 13:53:42 TBTARYB            00001000
000001* PDX    - ACAT1FSC C0113942 11/11/98 13:59:25 TBTARYB            00001000
000001* PDX    - ACAT1FSC C0117820 11/06/98 11:56:25 TBTARYB            00001000
000001* PDX    - ACAT1FSC C0113942 11/02/98 13:54:34 TBTARYB            00001000
      ******************************************************************        
       IDENTIFICATION DIVISION.                                                 
      ******************************************************************        
       PROGRAM-ID.    ACAT1FSC.                                                 
                                                                                
      *REMARKS.                                                                 
      ******************************************************************        
      * FUND/SERV: PORGRAM (XCTL'ED BY ACAT10CP) DISPLAYS              *        
      *      -  "RECEIVER REGISTRATION 1" SCREEN;                      *        
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
       77  S1                             PIC  9(02)   VALUE ZERO.              
       77  S2                             PIC  9(02)   VALUE ZERO.              
       77  S3                             PIC S9(02)   VALUE ZERO.              
       77  STOP-OK-SW                     PIC  X(01).                           
           88  STOP-OK                                  VALUE 'O'.              
           88  STOP-NOT-OK                              VALUE 'N'.              
       77  NTWRK-VALIDATION-SW            PIC  X(01)    VALUE 'N'.              
       77  LEVEL-OK                       PIC  X(01)    VALUE 'Y'.              
       77  PERIOD-SW                      PIC  X(01).                           
           88  BEFORE-PERIOD                            VALUE 'B'.              
           88  AFTER-PERIOD                             VALUE 'A'.              
       77  WS-CODE                        PIC  9(03)    VALUE ZERO.             
       77  ROA-LOI-VALID-FLAG             PIC  X(01).                           
           88  ROA-LOI-VALID                            VALUE 'V'.              
           88  ROA-LOI-INVALID                          VALUE 'N'.              
       77  LTCG-VALID-FLAG                PIC  X(01).                           
           88  LTCG-VALID                               VALUE 'V'.              
           88  LTCG-INVALID                             VALUE 'N'.              
       77  STCG-VALID-FLAG                PIC  X(01).                           
           88  STCG-VALID                               VALUE 'V'.              
           88  STCG-INVALID                             VALUE 'N'.              
       77  DVDND-VALID-FLAG               PIC  X(01).                           
           88  DVDND-VALID                              VALUE 'V'.              
           88  DVDND-INVALID                            VALUE 'N'.              
       77  WS-CNTR                        PIC  9(02) VALUE ZEROES.              
       77  MOVE-1-9-SW                    PIC  X(01).                           
           88  MOVE-1                                   VALUE '1'.              
           88  MOVE-9                                   VALUE '9'.              
       77  WS-M1RLAMTI                    PIC  X(17)    VALUE SPACES.           
                                                                                
       01  WS-TSQ-AREA.                                                         
           05  WS-TS-NAME.                                                      
               10 TERM-ID             PIC X(04).                                
               10 TRAN-ID             PIC X(04).                                
               10 ITEM-NUMBER         PIC S9(04) COMP VALUE +1.                 
                                                                                
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
               09  WS-EDITED-YY             PIC X(02).                          
                                                                                
       01  WS-ROA-LOI-AMT.                                                      
           05  WS-ROA-LOI-AMT-INT           PIC  X(14).                         
           05  FILLER                       PIC  X(01)  VALUE '.'.              
           05  WS-ROA-LOI-AMT-FRAC          PIC  X(02).                         
                                                                                
       01  WS-RL-AMT-TABLE.                                                     
           05  WS-RL-AMT OCCURS 17 TIMES    PIC  X(01).                         
                                                                                
       01  WS-RL-AMT-AREA.                                                      
           05  WS-RL-AMT-DEC                PIC  9(14).                         
           05  WS-RL-AMT-FRAC               PIC  9(02).                         
       01  WS-RL-AMOUNT REDEFINES                                               
           WS-RL-AMT-AREA                   PIC  9(14)V9(02).                   
                                                                                
       01  VALID-STATE-CODES               PIC X(2).                            
           88 VALID-STATE-CODE VALUE  '  ' 'AL' 'AK' 'AZ' 'AR' 'CA'             
      *           'CZ' 'CO' 'CT' 'DE' 'DC' 'FL' 'GA' 'GU' 'HI' 'ID'             
                  'CO' 'CT' 'DE' 'DC' 'FL' 'GA' 'HI' 'ID'                       
                  'IL' 'IN' 'IA' 'KS' 'KY' 'LA' 'ME' 'MD' 'MA' 'MI'             
                  'MN' 'MS' 'MO' 'MT' 'NE' 'NV' 'NH' 'NJ' 'NM' 'NY'             
      *           'NC' 'ND' 'OH' 'OK' 'OR' 'PA' 'PR' 'RI' 'SC' 'SD'             
                  'NC' 'ND' 'OH' 'OK' 'OR' 'PA' 'RI' 'SC' 'SD'                  
      *           'TN' 'TX' 'UT' 'VT' 'VA' 'VI' 'WA' 'WV' 'WI' 'WY'             
                  'TN' 'TX' 'UT' 'VT' 'VA' 'WA' 'WV' 'WI' 'WY'                  
                  'FF'.                                                         
                                                                                
       01  VALID-SOCIAL-CDS                 PIC  X(02).                         
           88  VALID-SOCIAL-CD  VALUE '01' THRU '18', '99'.                     
                                                                                
       01  VALID-ROA-LOI-ZEROES             PIC  X(17).                         
           88  VALID-ROA-LOI-ZEROE  VALUE '00000000000000.00'                   
                                          '              .00'                   
                                          '             0.00'                   
                                          '0.00             '                   
                                          '0.0              '                   
                                          '0                '.                  
                                                                                
       01  VALID-TCS                        PIC  X(02).                         
           88  VALID-TC VALUE '  ' '1X' '2X' '3X' '4X' '5X'                     
                              '6X' '7X' '8X' '9X'.                              
                                                                                
       01  ERROR-MESSAGES.                                                      
           05  ERR-BAD-DB2.                                                     
               10  FILLER                   PIC  X(26)   VALUE                  
                   'DB2 FAILED WITH SQLCODE = '.                                
               10  ERR-BAD-DB2-CODE         PIC  -999.                          
           05  ERR-ACAT1FSC                 PIC  X(78)   VALUE                  
               'PROGRAM ACAT1FSC IS NOT AVAILABLE'.                             
           05  ERR-ACAT2FSC                 PIC  X(78)   VALUE                  
               'PROGRAM ACAT2FSC IS NOT AVAILABLE'.                             
           05  ERR-ACAT3FSC                 PIC  X(78)  VALUE                   
               'PROGRAM ACAT3FSC IS NOT AVAILABLE'.                             
           05  ERR-ACAT4FSC                 PIC  X(78)  VALUE                   
               'PROGRAM ACAT4FSC IS NOT AVAILABLE'.                             
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'ZIP-AREA'.                                                          
                                                                                
       01  FILLER.                                                              
           05  ZIP-FOUND-SW                 PIC  X(01).                         
               88  ZIP-FOUND                             VALUE 'Y'.             
               88  ZIP-NOT-FOUND                         VALUE 'N'.             
           05  W-ADDRESS-WORK-BYTES.                                            
               10  W-ADDRESS-WORK-BYTE  OCCURS 35 TIMES                         
                                            PIC  X(01).                         
           05  ADDRESS-SUB                  PIC  9(02).                         
           05  W-ZIP-WORK-BYTES.                                                
               10  W-ZIP-WORK-BYTE OCCURS 9 TIMES                               
                                            PIC  9(01).                         
           05  ZIP-SUB                      PIC  9(02).                         
                                                                                
       01  WK-EDIT-MOD.                                                         
           05  REQUEST-TYPE                 PIC  X(01) VALUE 'G'.               
           05  NO-OF-ACCT-NUMBERS   COMP-3  PIC S9(02) VALUE +1.                
           05  BR-ACCT-TC-IN.                                                   
               10  BR-ACCT-IN.                                                  
                   15  CK-BRANCH            PIC  X(03).                         
                   15  CK-ACCT              PIC  X(05).                         
               10  TC-IN.                                                       
                   15  CK-TYPE              PIC  X(01).                         
                   15  CK-DIGIT             PIC  X(01).                         
           05  BR-ACCT-TC-OUT.                                                  
               10  BR-ACCT-OUT              PIC  X(08).                         
               10  TC-OUT                   PIC  X(02).                         
           05  EDIT-RETURN-CODE             PIC  X(01).                         
                                                                                
           EJECT                                                                
           COPY BNWTAXWW.                                                       
                                                                                
           EJECT                                                                
           COPY ACAT0FIO.                                                       
                                                                                
           EJECT                                                                
           COPY ACATFB1.                                                        
                                                                                
           EJECT                                                                
           COPY ACATF1M.                                                        
                                                                                
           EJECT                                                                
           COPY ACAT1FIO.                                                       
                                                                                
           EJECT                                                                
           COPY ACAT2FIO.                                                       
                                                                                
           EJECT                                                                
           COPY ACAT3FIO.                                                       
                                                                                
           EJECT                                                                
           COPY ACAT4FIO.                                                       
                                                                                
           EJECT                                                        01660002
           COPY ACATCOM.                                                        
                                                                                
           EJECT                                                                
           COPY DFHAID.                                                         
                                                                                
           EJECT                                                                
           COPY ATTR.                                                           
                                                                                
           EJECT                                                                
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
       01  DFHCOMMAREA.                                                         
           05  FILLER                    PIC X(2000).                           
                                                                                
           COPY TWACOMMN.                                                       
                                                                                
           EJECT                                                                
      ******************************************************************        
       PROCEDURE DIVISION.                                                      
      ******************************************************************        
                                                                                
           EJECT                                                                
      ****************                                                          
       INITIALIZATION.                                                          
      ****************                                                          
                                                                                
           EXEC CICS IGNORE CONDITION DUPKEY DUPREC  ENDFILE  ERROR             
                     ILLOGIC INVREQ   IOERR  ITEMERR LENGERR  MAPFAIL           
                     NOSPACE NOSTG    NOTFND         PGMIDERR QIDERR            
           END-EXEC.                                                            
                                                                                
           EXEC CICS                                                            
              ASSIGN TWALENG(TWA-SIZE)                                          
           END-EXEC.                                                            
                                                                                
           IF TWA-SIZE = ZERO                                                   
              MOVE LOW-VALUES               TO  ACATF1MO                        
              MOVE 'TWA SIZE EQUAL ZERO - PROGRAM CANNOT FUNCTION'              
                                            TO  M1ERRMSGO                       
              PERFORM WRITE-ACAT1FIO-COMMAREA                                   
              PERFORM SEND-MAP-ERASE                                            
              PERFORM RETURN-TO-CICS                                            
           END-IF.                                                              
                                                                                
           EXEC CICS                                                            
              ADDRESS TWA (ADDRESS OF TWA-AREA)                                 
           END-EXEC.                                                            
                                                                                
           MOVE DFHCOMMAREA                 TO  ACATCOMM-COMMAREA.              
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           MOVE 'AXB1'                      TO  TRAN-ID.                        
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACATF-B1-NA-AREA)                            
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           MOVE 'AMF1'                      TO  TRAN-ID.                        
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT1FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           SET MOVE-1                       TO  TRUE.                           
                                                                                
           EJECT                                                                
      *****************                                                         
       MAIN-PROCESSING.                                                         
      *****************                                                         
                                                                                
      *    IF  ACAT-PROGRAM-NAME = 'ACAT1FSC'                                   
      *        MOVE SPACES                  TO  ACAT-CALLING-PROG-NAME          
      *        PERFORM CONTINUE-PROCESSESING                                    
      *    ELSE                                                                 
      *        MOVE 'ACAT1FSC'              TO  ACAT-PROGRAM-NAME               
      *        PERFORM FIRST-TIME-RTN                                           
      *    END-IF.                                                              
                                                                                
           IF ACAT1FIO-FIRST-TIME                                               
              PERFORM FIRST-TIME-RTN                                            
           ELSE                                                                 
              PERFORM RECEIVE-MAP                                               
              EVALUATE ACAT1FIO-NSCC-PEND-CD                                    
                 WHEN 'Y'                                                       
                    PERFORM XCTL-RTN                                            
                 WHEN OTHER                                                     
                    PERFORM BASIC-PROCESSING                                    
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ******************                                                        
       FIRST-TIME-RTN.                                                          
      ******************                                                        
                                                                                
           SET FIRST-TIME                   TO  TRUE.                           
           SET ACAT1FIO-NOT-FIRST-TIME      TO  TRUE.                           
           SET ACAT1FIO-READ-DATABASE       TO  TRUE.                           
                                                                                
           IF (ACAT1FIO-CLIENT-NBR = SPACES OR ZEROES OR LOW-VALUES)            
                              OR                                                
              (ACAT1FIO-ACAT-CONTROL-NBR =                                      
                                     SPACES OR ZEROES OR LOW-VALUES)            
                              OR                                                
              (ACAT1FIO-ASSET-SEQ-NBR = ZEROES)                                 
              MOVE 'NO KEY DATA WAS PASSED FROM ACAT04RS'                       
                                            TO  M1ERRMSGO                       
           ELSE                                                                 
              MOVE EIBTRMID                 TO  TERM-ID                         
              MOVE 'AXB1'                   TO  TRAN-ID                         
              MOVE +1                       TO  ITEM-NUMBER                     
              EXEC CICS READQ TS QUEUE(WS-TS-NAME)                              
                                 INTO(ACATF-B1-NA-AREA)                         
                                 ITEM(ITEM-NUMBER)                              
              END-EXEC                                                          
              PERFORM LINK-TO-DB2                                               
              PERFORM PREPARE-FIELDS                                            
              PERFORM FORMAT-MAP-OUTPUT                                         
              EVALUATE ACAT1FIO-NSCC-PEND-CD                                    
                 WHEN 'Y'                                                       
                    PERFORM PROTECT-ALL-FIELDS                                  
                    MOVE 'RECORD HAS ALREADY BEEN SENT TO NSCC - NO UPDA        
      -                  'TES CAN BE DONE AT THIS TIME'                         
                                            TO  M1ERRMSGO                       
                 WHEN 'A'                                                       
                    MOVE 'RECORD HAS BEEN ACKNOWLEDGED BY NSCC - UPDATES        
      -                  'WILL CAUSE RETRANSMISSION'                            
                                            TO  M1ERRMSGO                       
                 WHEN OTHER                                                     
                    CONTINUE                                                    
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
DJ0001     IF  ACAT-SIGN-ON-UPDATE                                              
LRM004     OR  ACAT-SIGN-ON-ASCENDIS-RSTRCT                                     
DJ0001         CONTINUE                                                         
DJ0001     ELSE                                                                 
DJ0001         PERFORM PROTECT-ALL-FIELDS                                       
DJ0001         MOVE '(BROWSE ONLY)'         TO  M1LITERO                        
DJ0001         MOVE ATT-PROT                TO  M1VALUEA                        
DJ0001     END-IF.                                                              
                                                                                
           PERFORM SEND-MAP-ERASE.                                              
           SET NOT-FIRST-TIME               TO  TRUE.                           
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       FORMAT-MAP-OUTPUT.                                                       
      *******************                                                       
                                                                                
           INITIALIZE ACATF1MO.                                                 
                                                                                
           MOVE -1                          TO  M1BOOKL.                        
           MOVE ACAT1FIO-ACAT-CONTROL-NBR   TO  M1CNTLNO.                       
           MOVE ACAT1FIO-DLVR-NBR           TO  M1DELBKRO.                      
           MOVE ACAT1FIO-BRKR-EXCTG-NBR     TO  M1EXBKRO.                       
           MOVE ACAT1FIO-FUND-BK-CD         TO  M1BOOKO                         
                                                ACAT1FIO-M1BOOK.                
           MOVE ACAT1FIO-TC                 TO  M1TCO.                          
           MOVE ACAT1FIO-BRANCH             TO  M1BRCHO.                        
           MOVE ACAT1FIO-ACCOUNT            TO  M1ACCTO.                        
           MOVE ACAT1FIO-ISIN-SEC-ISSUE-CD  TO  M1SECO.                         
           MOVE ACAT1FIO-ACCT-RR-CD         TO  M1RRNBRO.                       
           MOVE ACAT1FIO-ACCT-RR-NM         TO  M1RRNAMEO.                      
           MOVE ACAT1FIO-NTWRK-CNTL-CD      TO  M1LEVELO                        
                                                ACAT1FIO-M1LEVEL.               
           MOVE ACAT1FIO-DVDND-CD           TO  M1DVDNDO                        
                                                ACAT1FIO-M1DVDND.               
           MOVE ACAT1FIO-LTCG-CD            TO  M1LTCGO                         
                                                ACAT1FIO-M1LTCG.                
           MOVE ACAT1FIO-STCG-CD            TO  M1STCGO                         
                                                ACAT1FIO-M1STCG.                
           MOVE NA-IRA-IND                  TO  M1IRAO                          
                                                ACAT1FIO-M1IRA.                 
           MOVE ACAT1FIO-BRCH-NBR           TO  M1BROVO.                        
           MOVE ACAT1FIO-NAV-ACCT-IND       TO  M1NAVO                          
                                                ACAT1FIO-M1NAV.                 
           MOVE ACAT1FIO-ROA-LOI-CD         TO  M1ROALOIO                       
                                                ACAT1FIO-M1ROALOI.              
           IF ACAT1FIO-ROA-LOI-AMT = '00000000000000.00'                        
              MOVE SPACES                   TO  M1RLAMTO                        
                                                ACAT1FIO-M1RLAMT                
           ELSE                                                                 
              PERFORM LEFT-JUSTIFY-RL-AMT                                       
              MOVE WS-M1RLAMTI              TO  M1RLAMTO                        
                                                ACAT1FIO-M1RLAMT                
           END-IF.                                                              
                                                                                
           IF ACAT1FIO-LOI-DT = '00010101'                                      
              MOVE SPACES                   TO  M1LOIDATO                       
                                                ACAT1FIO-M1LOIDAT               
           ELSE                                                                 
              MOVE ACAT1FIO-LOI-DT          TO  M1LOIDATO                       
                                                ACAT1FIO-M1LOIDAT               
           END-IF.                                                              
           MOVE ACAT1FIO-SOC-CD             TO  M1SOCIALO                       
                                                ACAT1FIO-M1SOCIAL.              
           MOVE ACAT1FIO-SL-ST-CD           TO  M1STATEO                        
                                                ACAT1FIO-M1STATE.               
           MOVE ACAT1FIO-SS-TIN-NBR         TO  M1SSNBRO                        
                                                ACAT1FIO-M1SSNBR.               
           EVALUATE ACAT1FIO-SS-TIN-CD                                          
              WHEN '0'                                                          
                 MOVE 'T'                   TO  M1SSTINO                        
                                                ACAT1FIO-M1SSTIN                
              WHEN '1'                                                          
                 MOVE 'S'                   TO  M1SSTINO                        
                                                ACAT1FIO-M1SSTIN                
              WHEN OTHER                                                        
                 MOVE SPACES                TO  M1SSTINO                        
                                                ACAT1FIO-M1SSTIN                
           END-EVALUATE.                                                        
           MOVE ACAT1FIO-WTHLD-CD           TO  M1WTHTAXO                       
                                                ACAT1FIO-M1WTHTAX.              
           IF ACAT1FIO-NRA-TAX-PCT = ZEROES                                     
              MOVE SPACES                   TO  M1NRAPCO                        
                                                ACAT1FIO-M1NRAPC                
           ELSE                                                                 
              MOVE ACAT1FIO-NRA-TAX-PCT     TO  M1NRAPCO                        
                                                ACAT1FIO-M1NRAPC                
           END-IF.                                                              
           MOVE ACAT1FIO-FNBR               TO  M1OLDACCO                       
                                                ACAT1FIO-M1OLDACC.              
           EVALUATE ACAT1FIO-PYBL-INFO-CD                                       
              WHEN '0'                                                          
                 MOVE 'R'                   TO  M1PAYINDO                       
                                                ACAT1FIO-M1PAYIND               
              WHEN '1'                                                          
                 MOVE 'P'                   TO  M1PAYINDO                       
                                                ACAT1FIO-M1PAYIND               
              WHEN '2'                                                          
                 MOVE 'A'                   TO  M1PAYINDO                       
                                                ACAT1FIO-M1PAYIND               
              WHEN '3'                                                          
                 MOVE 'C'                   TO  M1PAYINDO                       
                                                ACAT1FIO-M1PAYIND               
              WHEN '4'                                                          
                 MOVE 'X'                   TO  M1PAYINDO                       
                                                ACAT1FIO-M1PAYIND               
              WHEN OTHER                                                        
                 MOVE SPACES                TO  M1PAYINDO                       
                                                ACAT1FIO-M1PAYIND               
           END-EVALUATE.                                                        
           MOVE ACAT1FIO-PYBL-QTY           TO  M1PBLNBRO                       
                                                ACAT1FIO-M1PBLNBR.              
           MOVE ACAT1FIO-CHCK-WRTNG-IND     TO  M1CHCKPRO                       
                                                ACAT1FIO-M1CHCKPR.              
           MOVE ACAT1FIO-CUST-NM            TO  M1TINAMEO                       
                                                ACAT1FIO-M1TINAME.              
           IF 1 <= ACAT1FIO-NA-LINES-NBR                                        
              MOVE ACAT1FIO-NA-LINE (1)     TO  M1NA1O                          
                                                ACAT1FIO-M1NA1                  
           ELSE                                                                 
              MOVE SPACES                   TO  M1NA1O                          
                                                ACAT1FIO-M1NA1                  
           END-IF.                                                              
           MOVE ACAT1FIO-ZIP5-CD            TO  M1ZIP5O                         
                                                ACAT1FIO-M1ZIP5.                
           MOVE ACAT1FIO-ZIP4-CD            TO  M1ZIP4O                         
                                                ACAT1FIO-M1ZIP4.                
           IF 2 <= ACAT1FIO-NA-LINES-NBR                                        
              MOVE ACAT1FIO-NA-LINE (2)     TO  M1NA2O                          
                                                ACAT1FIO-M1NA2                  
           ELSE                                                                 
              MOVE SPACES                   TO  M1NA2O                          
                                                ACAT1FIO-M1NA2                  
           END-IF.                                                              
           MOVE ACAT1FIO-ACCT-RLTD-NBR      TO  M1RELACCO                       
                                                ACAT1FIO-M1RELACC.              
           EVALUATE ACAT1FIO-ACCT-RLTD-CD                                       
              WHEN '1'                                                          
                 MOVE 'F'                   TO  M1BFCODEO                       
                                                ACAT1FIO-M1BFCODE               
              WHEN '2'                                                          
                 MOVE 'B'                   TO  M1BFCODEO                       
                                                ACAT1FIO-M1BFCODE               
              WHEN OTHER                                                        
                 MOVE SPACES                TO  M1BFCODEO                       
                                                ACAT1FIO-M1BFCODE               
           END-EVALUATE.                                                        
           IF 3 <= ACAT1FIO-NA-LINES-NBR                                        
              MOVE ACAT1FIO-NA-LINE (3)     TO  M1NA3O                          
                                                ACAT1FIO-M1NA3                  
           ELSE                                                                 
              MOVE SPACES                   TO  M1NA3O                          
                                                ACAT1FIO-M1NA3                  
           END-IF.                                                              
      *    MOVE ACAT1FIO-                   TO  M1RELSECO.                      
           IF 4 <= ACAT1FIO-NA-LINES-NBR                                        
              MOVE ACAT1FIO-NA-LINE (4)     TO  M1NA4O                          
                                                ACAT1FIO-M1NA4                  
           ELSE                                                                 
              MOVE SPACES                   TO  M1NA4O                          
                                                ACAT1FIO-M1NA4                  
           END-IF.                                                              
           IF 5 <= ACAT1FIO-NA-LINES-NBR                                        
              MOVE ACAT1FIO-NA-LINE (5)     TO  M1NA5O                          
                                                ACAT1FIO-M1NA5                  
           ELSE                                                                 
              MOVE SPACES                   TO  M1NA5O                          
                                                ACAT1FIO-M1NA5                  
           END-IF.                                                              
           IF 6 <= ACAT1FIO-NA-LINES-NBR                                        
              MOVE ACAT1FIO-NA-LINE (6)     TO  M1NA6O                          
                                                ACAT1FIO-M1NA6                  
           ELSE                                                                 
              MOVE SPACES                   TO  M1NA6O                          
                                                ACAT1FIO-M1NA6                  
           END-IF.                                                              
           MOVE ACAT1FIO-ASSET-DESC         TO  M1FUNDO.                        
           MOVE 'UNDO CHANGES:'             TO  M1LITERO.                       
           MOVE ' '                         TO  M1VALUEO.                       
                                                                                
           EJECT                                                                
      *********************                                                     
       LEFT-JUSTIFY-RL-AMT.                                                     
      *********************                                                     
                                                                                
           SET BEFORE-PERIOD                TO  TRUE.                           
           MOVE 0                           TO  WS-CNTR                         
                                                S2.                             
           MOVE ACAT1FIO-ROA-LOI-AMT        TO  WS-RL-AMT-TABLE.                
                                                                                
           PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 17                         
              EVALUATE WS-RL-AMT (S1)                                           
                 WHEN '0'                                                       
                    IF BEFORE-PERIOD                                            
                       ADD 1                TO  WS-CNTR                         
                    ELSE                                                        
                       ADD 1                TO  WS-CNTR                         
                                                S2                              
                       IF WS-CNTR <= 2                                          
                          ADD 1             TO  S2                              
                          MOVE WS-RL-AMT (S1) TO WS-M1RLAMTI (S2:1)             
                       ELSE                                                     
                          MOVE ' '          TO  WS-M1RLAMTI (S2:1)              
                       END-IF                                                   
                       ADD 1                TO  WS-CNTR                         
                    END-IF                                                      
                 WHEN '.'                                                       
                    IF WS-CNTR >= 14                                            
                       MOVE '0'             TO  WS-M1RLAMTI (1:1)               
                       MOVE '.'             TO  WS-M1RLAMTI (2:1)               
                       MOVE 2               TO  S2                              
                    ELSE                                                        
                       ADD 1                TO  S2                              
                       MOVE '.'             TO  WS-M1RLAMTI (S2:1)              
                    END-IF                                                      
                    MOVE 0                  TO  WS-CNTR                         
                    SET AFTER-PERIOD        TO  TRUE                            
                 WHEN OTHER                                                     
                    IF BEFORE-PERIOD                                            
                       ADD 1                TO  S2                              
                       MOVE WS-RL-AMT (S1)  TO  WS-M1RLAMTI (S2:1)              
                    ELSE                                                        
                       ADD 1                TO  WS-CNTR                         
                                                S2                              
                       IF WS-CNTR <= 2                                          
                          MOVE WS-RL-AMT (S1) TO WS-M1RLAMTI (S2:1)             
                       ELSE                                                     
                          MOVE ' '          TO  WS-M1RLAMTI (S2:1)              
                       END-IF                                                   
                    END-IF                                                      
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      ******************                                                        
       BASIC-PROCESSING.                                                        
      ******************                                                        
                                                                                
           IF M1ERRMSGI (1:10) = 'NEW N-LVL/'                                   
              MOVE SPACES                   TO  M1ERRMSGO                       
           END-IF.                                                              
                                                                                
           IF M1LITERI = 'UNDO CHANGES:'                                        
              PERFORM CHECK-FOR-UPDATES                                         
              IF ACAT1FIO-UPDATE-DATABASE                                       
                 PERFORM UNDO-CHANGES-VALIDATION                                
                 IF M1VALUEI = ' '                                              
                    PERFORM PREPARE-FIELDS                                      
                    PERFORM NTWRK-BOOK-VALIDATION                               
                       THRU NTWRK-BOOK-VALIDATION-EXIT                          
                    PERFORM DATA-VALIDATION                                     
                    IF M1ERRMSGO = SPACES OR LOW-VALUES                         
                       IF EIBAID = DFHENTER                                     
                          PERFORM XCTL-RTN                                      
                       ELSE                                                     
                          PERFORM FORMAT-NA-LINES                               
                          MOVE '     CONFIRM:' TO M1LITERO                      
                          MOVE -1              TO M1VALUEL                      
                       MOVE 'YOU ARE ABOUT TO UPDATE THE DATABASE - PLEA        
      -                     'SE CONFIRM WITH Y, OR REJECT WITH N'               
                                            TO  M1ERRMSGO                       
                       END-IF                                                   
      *             ELSE                                                        
      *                IF EIBAID NOT = DFHENTER                                 
      *                   PERFORM XCTL-RTN                                      
      *                END-IF                                                   
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
                    MOVE SPACES             TO  M1ERRMSGO                       
                                                M1VALUEO                        
                 END-IF                                                         
                 PERFORM XCTL-RTN                                               
              END-IF                                                            
           ELSE                                                                 
              IF M1LITERI = '     CONFIRM:'                                     
                 PERFORM CONFIRMATION-VALIDATION                                
                 IF M1VALUEI = 'Y'                                              
                    IF ACAT1FIO-NSCC-PEND-CD = 'A'                              
                       MOVE ' '             TO  ACAT1FIO-NSCC-PEND-CD           
                    END-IF                                                      
                    PERFORM LINK-TO-DB2                                         
                    PERFORM FORMAT-MAP-OUTPUT                                   
                 ELSE                                                           
                    IF EIBAID = DFHENTER                                        
                       PERFORM FIRST-TIME-RTN                                   
                    END-IF                                                      
                 END-IF                                                         
                 MOVE SPACES                TO  M1ERRMSGO                       
                                                M1VALUEO                        
                 MOVE 'UNDO CHANGES:'       TO  M1LITERO                        
                 PERFORM XCTL-RTN                                               
              ELSE                                                              
                 PERFORM XCTL-RTN                                               
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       CHECK-FOR-UPDATES.                                                       
      *******************                                                       
                                                                                
           IF M1BOOKI    NOT = ACAT1FIO-M1BOOK   OR                             
              M1LEVELI   NOT = ACAT1FIO-M1LEVEL  OR                             
              M1DVDNDI   NOT = ACAT1FIO-M1DVDND  OR                             
              M1STCGI    NOT = ACAT1FIO-M1STCG   OR                             
              M1LTCGI    NOT = ACAT1FIO-M1LTCG   OR                             
              M1IRAI     NOT = ACAT1FIO-M1IRA    OR                             
              M1NAVI     NOT = ACAT1FIO-M1NAV    OR                             
              M1ROALOII  NOT = ACAT1FIO-M1ROALOI OR                             
              M1RLAMTI   NOT = ACAT1FIO-M1RLAMT  OR                             
              M1LOIDATI  NOT = ACAT1FIO-M1LOIDAT OR                             
              M1SOCIALI  NOT = ACAT1FIO-M1SOCIAL OR                             
              M1STATEI   NOT = ACAT1FIO-M1STATE  OR                             
              M1SSNBRI   NOT = ACAT1FIO-M1SSNBR  OR                             
              M1SSTINI   NOT = ACAT1FIO-M1SSTIN  OR                             
              M1WTHTAXI  NOT = ACAT1FIO-M1WTHTAX OR                             
              M1NRAPCI   NOT = ACAT1FIO-M1NRAPC  OR                             
              M1OLDACCI  NOT = ACAT1FIO-M1OLDACC OR                             
              M1PAYINDI  NOT = ACAT1FIO-M1PAYIND OR                             
      *       M1PBLNBRI  NOT = ACAT1FIO-M1PBLNBR OR                             
              M1CHCKPRI  NOT = ACAT1FIO-M1CHCKPR OR                             
              M1TINAMEI  NOT = ACAT1FIO-M1TINAME OR                             
              M1ZIP5I    NOT = ACAT1FIO-M1ZIP5   OR                             
              M1ZIP4I    NOT = ACAT1FIO-M1ZIP4   OR                             
              M1RELACCI  NOT = ACAT1FIO-M1RELACC OR                             
              M1BFCODEI  NOT = ACAT1FIO-M1BFCODE OR                             
              M1NA1I     NOT = ACAT1FIO-M1NA1    OR                             
              M1NA2I     NOT = ACAT1FIO-M1NA2    OR                             
              M1NA3I     NOT = ACAT1FIO-M1NA3    OR                             
              M1NA4I     NOT = ACAT1FIO-M1NA4    OR                             
              M1NA5I     NOT = ACAT1FIO-M1NA5    OR                             
              M1NA6I     NOT = ACAT1FIO-M1NA6                                   
              SET ACAT1FIO-UPDATE-DATABASE  TO  TRUE                            
           ELSE                                                                 
              MOVE 'N'                 TO  ACAT1FIO-READ-UPDATE-DATABASE        
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ************************                                                  
       UNDO-CHANGES-VALIDATION.                                                 
      ************************                                                  
                                                                                
           EVALUATE TRUE                                                        
              WHEN M1VALUEI = (' ' OR 'Y')                                      
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 MOVE 'UNDO CHANGES FIELD SHOULD BE BLANK TO CONTINUE, O        
      -               'R Y TO STOP AND UNDO CHANGES'                            
                                         TO  M1ERRMSGO                          
                 MOVE -1                 TO  M1VALUEL                           
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *************************                                                 
       CONFIRMATION-VALIDATION.                                                 
      *************************                                                 
                                                                                
           EVALUATE TRUE                                                        
              WHEN M1VALUEI = ('Y' OR 'N')                                      
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 MOVE 'CONFIRMATION FIELD CAN BE ONLY Y OR N'                   
                                         TO  M1ERRMSGO                          
                 MOVE -1                 TO  M1VALUEL                           
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      ****************                                                          
       SEND-MAP-ERASE.                                                          
      ****************                                                          
                                                                                
           PERFORM GET-DATE-AND-TIME.                                           
                                                                                
           MOVE 'AMFX'                      TO  M1TRIDO.                        
           MOVE WSMMDDYY                    TO  M1DATEO.                        
           MOVE WSTIME                      TO  M1TIMEO.                        
                                                                                
           EXEC CICS SEND MAP('ACATF1M')                                        
                          MAPSET('ACATF1M')                                     
                          FROM(ACATF1MO)                                        
                          CURSOR                                                
                          ERASE                                                 
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *******************                                                       
       SEND-MAP-DATAONLY.                                                       
      *******************                                                       
                                                                                
           PERFORM GET-DATE-AND-TIME.                                           
           MOVE 'AMFX'                      TO  M1TRIDO.                        
           MOVE WSMMDDYY                    TO  M1DATEO.                        
           MOVE WSTIME                      TO  M1TIMEO.                        
                                                                                
           EXEC CICS SEND MAP('ACATF1M')                                        
                          MAPSET('ACATF1M')                                     
                          FROM(ACATF1MO)                                        
                          DATAONLY                                              
                          CURSOR                                                
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *************                                                             
       RECEIVE-MAP.                                                             
      *************                                                             
                                                                                
           MOVE LOW-VALUES                  TO  ACATF1MI.                       
                                                                                
                                                                                
           EXEC CICS  RECEIVE MAP('ACATF1M')                                    
                              MAPSET('ACATF1M')                                 
                              INTO(ACATF1MI)                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ***********************                                                   
       NTWRK-BOOK-VALIDATION.                                                   
      ***********************                                                   
                                                                                
           MOVE 'Y'                         TO  NTWRK-VALIDATION-SW             
                                                LEVEL-OK.                       
                                                                                
           IF M1LEVELI = LOW-VALUES                                             
              MOVE SPACES                   TO  M1LEVELI                        
           END-IF.                                                              
                                                                                
LRM005     IF M1LEVELI = ('0' OR '3' OR '4')                                    
              CONTINUE                                                          
           ELSE                                                                 
LRM005        MOVE 'NETWORK LEVEL SHOULD BE 0, 3, 4'                            
                                            TO  M1ERRMSGO                       
              MOVE -1                       TO  M1LEVELL                        
              MOVE ATT-UNPROT-BRT           TO  M1LEVELA                        
              MOVE 'N'                      TO  LEVEL-OK                        
                                                NTWRK-VALIDATION-SW             
           END-IF.                                                              
                                                                                
           IF M1BOOKI = LOW-VALUES                                              
              MOVE SPACES                   TO  M1BOOKI                         
           END-IF.                                                              
           IF M1BOOKI = ('  ' OR 'BB' OR 'BC' OR 'BN' OR 'BS')                  
              IF LEVEL-OK = 'Y'                                                 
                 IF M1LEVELI = '0' AND                                          
                    M1BOOKI = '  '                                              
                    MOVE 'BOOK CODE IS REQUIRED WHEN NETWORK LEVEL IS 0'        
                                            TO  M1ERRMSGO                       
                    MOVE -1                 TO  M1BOOKL                         
                    MOVE ATT-UNPROT-BRT     TO  M1BOOKA                         
                    MOVE 'N'                TO  NTWRK-VALIDATION-SW             
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              MOVE 'BOOK CODE SHOULD BE BB, BC, BN, BS OR BLANK'                
                                            TO  M1ERRMSGO                       
              MOVE -1                       TO  M1BOOKL                         
              MOVE ATT-UNPROT-BRT           TO  M1BOOKA                         
              MOVE 'N'                      TO  NTWRK-VALIDATION-SW             
           END-IF.                                                              
                                                                                
           IF NTWRK-VALIDATION-SW = 'N'                                         
              PERFORM SEND-MAP-DATAONLY                                         
              PERFORM RETURN-TO-CICS                                            
           END-IF.                                                              
                                                                                
           IF M1LEVELI = ACAT1FIO-NTWRK-CNTL-CD AND                             
              M1BOOKI  = ACAT1FIO-FUND-BK-CD                                    
              GO TO NTWRK-BOOK-VALIDATION-EXIT                                  
           ELSE                                                                 
              MOVE M1LEVELI                 TO  ACAT1FIO-NTWRK-CNTL-CD          
              MOVE M1BOOKI                  TO  ACAT1FIO-FUND-BK-CD             
           END-IF                                                               
                                                                                
           IF ACAT1FIO-NTWRK-CNTL-CD = '0'                                      
              EVALUATE ACAT1FIO-FUND-BK-CD                                      
                 WHEN 'BB'                                                      
                   MOVE B1-REG-537311     TO  ACAT1FIO-NA-LINE (1)              
                   MOVE B1-REG-537312     TO  ACAT1FIO-NA-LINE (2)              
                   MOVE B1-REG-537313     TO  ACAT1FIO-NA-LINE (3)              
                   MOVE B1-REG-537314     TO  ACAT1FIO-NA-LINE (4)              
                   MOVE SPACES            TO  ACAT1FIO-NA-LINE (5)              
                                              ACAT1FIO-NA-LINE (6)              
                   MOVE B1-TIN-537326     TO  ACAT1FIO-SS-TIN-NBR               
                   MOVE 'T'               TO  ACAT1FIO-SS-TIN-CD                
                   MOVE 1                 TO  ACAT1FIO-NM-END-LN-QTY            
                   PERFORM FIND-ZIP-CODE                                        
                 WHEN 'BN'                                                      
                   PERFORM FIND-ZIP-CODE                                        
537260             EVALUATE B1-BOOK-OPTION                                      
                     WHEN '1'                                                   
                       MOVE B1-REG-537315   TO  ACAT1FIO-NA-LINE (1)            
                       MOVE B1-REG-537316   TO  ACAT1FIO-NA-LINE (2)            
                       MOVE B1-REG-537317   TO  ACAT1FIO-NA-LINE (3)            
                       MOVE B1-REG-537318   TO  ACAT1FIO-NA-LINE (4)            
                       MOVE SPACES          TO  ACAT1FIO-NA-LINE (5)            
                                                ACAT1FIO-NA-LINE (6)            
                       MOVE B1-TIN-537327   TO  ACAT1FIO-SS-TIN-NBR             
                       MOVE 'T'             TO  ACAT1FIO-SS-TIN-CD              
                       MOVE 1               TO  ACAT1FIO-NM-END-LN-QTY          
                     WHEN '2'                                                   
                      MOVE B1-REG-537315 TO ACAT1FIO-NA-LINE (1)                
                      MOVE 'A/C'         TO ACAT1FIO-NA-LINE (2) (1:4)          
                      MOVE ACAT1FIO-BRANCH                                      
                                         TO ACAT1FIO-NA-LINE (2) (5:3)          
                      MOVE '-'           TO ACAT1FIO-NA-LINE (2) (8:1)          
                      MOVE ACAT1FIO-ACCOUNT                                     
                                         TO ACAT1FIO-NA-LINE (2) (9:5)          
                      MOVE '-'           TO ACAT1FIO-NA-LINE (2) (14:1)         
                      MOVE ACAT1FIO-TC   TO ACAT1FIO-NA-LINE (2) (15:2)         
                      MOVE ACAT1FIO-ACCT-RR-CD (1:3)                            
                                         TO ACAT1FIO-NA-LINE (2) (18:3)         
                      MOVE SPACES        TO ACAT1FIO-NA-LINE (2) (21:15)        
                      MOVE B1-TIN-537327 TO ACAT1FIO-SS-TIN-NBR                 
                      MOVE 'T'           TO ACAT1FIO-SS-TIN-CD                  
                      MOVE 1             TO ACAT1FIO-NM-END-LN-QTY              
                     WHEN '3'                                                   
                      MOVE B1-REG-537315 TO ACAT1FIO-NA-LINE (1)                
                      MOVE NA-LINE (1)   TO ACAT1FIO-NA-LINE (3)                
                      MOVE B1-REG-537316 TO ACAT1FIO-NA-LINE (4)                
                      MOVE B1-REG-537317 TO ACAT1FIO-NA-LINE (5)                
                      MOVE B1-REG-537318 TO ACAT1FIO-NA-LINE (6)                
                      MOVE 3             TO ACAT1FIO-NM-END-LN-QTY              
                      IF NA-IRA-IND = 'Y'                                       
                         MOVE 'IRA CUST FBO'                                    
                                         TO ACAT1FIO-NA-LINE (2) (1:13)         
                         MOVE ACAT1FIO-BRANCH                                   
                                         TO ACAT1FIO-NA-LINE (2) (14:3)         
                         MOVE '-'        TO ACAT1FIO-NA-LINE (2) (17:1)         
                         MOVE ACAT1FIO-ACCOUNT                                  
                                         TO ACAT1FIO-NA-LINE (2) (18:5)         
                         MOVE '-'        TO ACAT1FIO-NA-LINE (2) (23:1)         
                         MOVE SPACES     TO ACAT1FIO-NA-LINE (2) (24:2)         
                         MOVE '-'        TO ACAT1FIO-NA-LINE (2) (26:1)         
                         MOVE ACAT1FIO-ACCT-RR-CD (1:3)                         
                                         TO ACAT1FIO-NA-LINE (2) (27:3)         
                         MOVE ACAT1FIO-TC TO ACAT1FIO-NA-LINE (2) (30:6)        
                         MOVE B1-TIN-537328 TO ACAT1FIO-SS-TIN-NBR              
                         MOVE 'T'           TO ACAT1FIO-SS-TIN-CD               
                      ELSE                                                      
                         MOVE 'A/C'      TO ACAT1FIO-NA-LINE (2) (1:4)          
                         MOVE ACAT1FIO-BRANCH                                   
                                         TO ACAT1FIO-NA-LINE (2) (5:3)          
                         MOVE '-'        TO ACAT1FIO-NA-LINE (2) (8:1)          
                         MOVE ACAT1FIO-ACCOUNT                                  
                                         TO ACAT1FIO-NA-LINE (2) (9:5)          
                         MOVE '-'        TO ACAT1FIO-NA-LINE (2) (14:1)         
                         MOVE SPACES     TO ACAT1FIO-NA-LINE (2) (15:2)         
                         MOVE '-'        TO ACAT1FIO-NA-LINE (2) (17:1)         
                         MOVE ACAT1FIO-ACCT-RR-CD (1:3)                         
                                         TO ACAT1FIO-NA-LINE (2) (18:3)         
                        MOVE ACAT1FIO-TC TO ACAT1FIO-NA-LINE (2) (21:15)        
                         MOVE B1-TIN-537327 TO ACAT1FIO-SS-TIN-NBR              
                         MOVE 'T'           TO ACAT1FIO-SS-TIN-CD               
                      END-IF                                                    
                   END-EVALUATE                                                 
                 WHEN 'BS'                                                      
                   MOVE NA-LINE (1)         TO  ACAT1FIO-NA-LINE (1)            
                   MOVE B1-REG-537315       TO  ACAT1FIO-NA-LINE (2)            
                   MOVE B1-REG-537316       TO  ACAT1FIO-NA-LINE (3)            
                   MOVE B1-REG-537317       TO  ACAT1FIO-NA-LINE (4)            
                   MOVE B1-REG-537318       TO  ACAT1FIO-NA-LINE (5)            
                   MOVE SPACES              TO  ACAT1FIO-NA-LINE (6)            
                   MOVE NA-SOC-SEC          TO  ACAT1FIO-SS-TIN-NBR             
                   MOVE NA-SOC-SEC-CD       TO  ACAT1FIO-SS-TIN-CD              
                   MOVE 1                   TO  ACAT1FIO-NM-END-LN-QTY          
                   PERFORM FIND-ZIP-CODE                                        
                 WHEN 'BC'                                                      
                   MOVE NA-LINE (1)         TO  ACAT1FIO-NA-LINE (1)            
                   MOVE NA-LINE (2)         TO  ACAT1FIO-NA-LINE (2)            
                   MOVE NA-LINE (3)         TO  ACAT1FIO-NA-LINE (3)            
                   MOVE NA-LINE (4)         TO  ACAT1FIO-NA-LINE (4)            
                   MOVE NA-LINE (5)         TO  ACAT1FIO-NA-LINE (5)            
                   MOVE NA-LINE (6)         TO  ACAT1FIO-NA-LINE (6)            
                   MOVE NA-SOC-SEC          TO  ACAT1FIO-SS-TIN-NBR             
                   MOVE NA-SOC-SEC-CD       TO  ACAT1FIO-SS-TIN-CD              
                   MOVE NA-ZIP              TO  ACAT1FIO-ZIP5-CD                
                   MOVE NA-NAME-IND         TO  ACAT1FIO-NM-END-LN-QTY          
                 WHEN OTHER                                                     
                   IF NTWREG-HOUSE-ACCT > SPACES                                
                      MOVE 'BB'             TO  ACAT1FIO-FUND-BK-CD             
                      MOVE B1-REG-537311    TO  ACAT1FIO-NA-LINE (1)            
                      MOVE B1-REG-537312    TO  ACAT1FIO-NA-LINE (2)            
                      MOVE B1-REG-537313    TO  ACAT1FIO-NA-LINE (3)            
                      MOVE B1-REG-537314    TO  ACAT1FIO-NA-LINE (4)            
                      MOVE SPACES           TO  ACAT1FIO-NA-LINE (5)            
                                                ACAT1FIO-NA-LINE (6)            
                      MOVE B1-TIN-537326    TO  ACAT1FIO-SS-TIN-NBR             
                      MOVE 'T'              TO  ACAT1FIO-SS-TIN-CD              
                      MOVE 1                TO  ACAT1FIO-NM-END-LN-QTY          
                      PERFORM FIND-ZIP-CODE                                     
                   ELSE                                                         
                      MOVE 'BC'             TO  ACAT1FIO-FUND-BK-CD             
                      MOVE NA-LINE (1)      TO  ACAT1FIO-NA-LINE (1)            
                      MOVE NA-LINE (2)      TO  ACAT1FIO-NA-LINE (2)            
                      MOVE NA-LINE (3)      TO  ACAT1FIO-NA-LINE (3)            
                      MOVE NA-LINE (4)      TO  ACAT1FIO-NA-LINE (4)            
                      MOVE NA-LINE (5)      TO  ACAT1FIO-NA-LINE (5)            
                      MOVE NA-LINE (6)      TO  ACAT1FIO-NA-LINE (6)            
                      MOVE NA-SOC-SEC       TO  ACAT1FIO-SS-TIN-NBR             
                      MOVE NA-SOC-SEC-CD    TO  ACAT1FIO-SS-TIN-CD              
                      MOVE NA-NAME-IND      TO  ACAT1FIO-NM-END-LN-QTY          
                   END-IF                                                       
              END-EVALUATE                                                      
           END-IF.                                                              
LRM005* THE FOLLOWING CODE WILL BE REMOVED IN THE FUTURE.                       
           IF ACAT1FIO-NTWRK-CNTL-CD = '1'                                      
              MOVE NA-LINE (1)              TO  ACAT1FIO-NA-LINE (1)            
              MOVE NA-LINE (2)              TO  ACAT1FIO-NA-LINE (2)            
              MOVE NA-LINE (3)              TO  ACAT1FIO-NA-LINE (3)            
              MOVE NA-LINE (4)              TO  ACAT1FIO-NA-LINE (4)            
              MOVE NA-LINE (5)              TO  ACAT1FIO-NA-LINE (5)            
              MOVE NA-LINE (6)              TO  ACAT1FIO-NA-LINE (6)            
              IF NA-IRA-IND = 'Y'                                               
                 MOVE B1-TIN-537533         TO  ACAT1FIO-SS-TIN-NBR             
                 MOVE 'T'                   TO  ACAT1FIO-SS-TIN-CD              
              ELSE                                                              
                 MOVE NA-SOC-SEC            TO  ACAT1FIO-SS-TIN-NBR             
                 MOVE NA-SOC-SEC-CD         TO  ACAT1FIO-SS-TIN-CD              
              END-IF                                                            
              IF B1-REG-SETUP-OPTION = '7'                                      
                 MOVE B1-REG-537536 (21:5)  TO  ACAT1FIO-ZIP5-CD                
                 MOVE B1-REG-537536 (27:4)  TO  ACAT1FIO-ZIP4-CD                
              ELSE                                                              
                 MOVE NA-ZIP (1:5)          TO  ACAT1FIO-ZIP5-CD                
                 MOVE NA-ZIP (6:4)          TO  ACAT1FIO-ZIP4-CD                
              END-IF                                                            
              MOVE NA-NAME-IND              TO  ACAT1FIO-NM-END-LN-QTY          
           END-IF.                                                              
                                                                                
           IF ACAT1FIO-NTWRK-CNTL-CD = '2' OR '4'                               
              MOVE NA-LINE (1)              TO  ACAT1FIO-NA-LINE (1)            
              MOVE NA-LINE (2)              TO  ACAT1FIO-NA-LINE (2)            
              MOVE NA-LINE (3)              TO  ACAT1FIO-NA-LINE (3)            
              MOVE NA-LINE (4)              TO  ACAT1FIO-NA-LINE (4)            
              MOVE NA-LINE (5)              TO  ACAT1FIO-NA-LINE (5)            
              MOVE NA-LINE (6)              TO  ACAT1FIO-NA-LINE (6)            
              MOVE NA-SOC-SEC               TO  ACAT1FIO-SS-TIN-NBR             
              MOVE NA-SOC-SEC-CD            TO  ACAT1FIO-SS-TIN-CD              
              IF ACAT1FIO-NTWRK-CNTL-CD = '4' AND                               
                 (NA-IRA-VALUE = '1' OR '2' OR '3' OR '4' OR '5' OR             
                                 'X' OR 'H' OR 'J' OR 'O' OR 'Z' OR             
                                 'I' OR 'W')                                    
                 MOVE B1-TIN-537402         TO  ACAT1FIO-SS-TIN-NBR             
                 MOVE 'T'                   TO  ACAT1FIO-SS-TIN-CD              
              END-IF                                                            
              MOVE NA-ZIP (1:5)             TO  ACAT1FIO-ZIP5-CD                
              MOVE NA-ZIP (6:4)             TO  ACAT1FIO-ZIP4-CD                
              MOVE NA-NAME-IND              TO  ACAT1FIO-NM-END-LN-QTY          
           END-IF.                                                              
                                                                                
           IF ACAT1FIO-NTWRK-CNTL-CD = '3'                                      
              IF NTWREG-HOUSE-REG = '6'                                         
                 IF NA-IRA-IND = 'Y'                                            
                    MOVE NA-LINE (1)        TO  ACAT1FIO-NA-LINE (1)            
                    MOVE NA-LINE (2)        TO  ACAT1FIO-NA-LINE (2)            
                    MOVE NA-LINE (3)        TO  ACAT1FIO-NA-LINE (3)            
                    MOVE NA-LINE (4)        TO  ACAT1FIO-NA-LINE (4)            
                    MOVE NA-LINE (5)        TO  ACAT1FIO-NA-LINE (5)            
                    MOVE NA-LINE (6)        TO  ACAT1FIO-NA-LINE (6)            
                    MOVE B1-TIN-537532      TO  ACAT1FIO-SS-TIN-NBR             
                    MOVE 'T'                TO  ACAT1FIO-SS-TIN-CD              
                    MOVE NA-ZIP (1:5)       TO  ACAT1FIO-ZIP5-CD                
                    MOVE NA-ZIP (6:4)       TO  ACAT1FIO-ZIP4-CD                
                    MOVE NA-NAME-IND        TO  ACAT1FIO-NM-END-LN-QTY          
                 ELSE                                                           
                    MOVE B1-REG-537534      TO  ACAT1FIO-NA-LINE (1)            
                    MOVE NA-LINE (1)        TO  ACAT1FIO-NA-LINE (2)            
                    MOVE NA-LINE (2)        TO  ACAT1FIO-NA-LINE (3)            
                    MOVE NA-LINE (3)        TO  ACAT1FIO-NA-LINE (4)            
                    MOVE NA-LINE (4)        TO  ACAT1FIO-NA-LINE (5)            
                    MOVE NA-LINE (5)        TO  ACAT1FIO-NA-LINE (6)            
                    MOVE B1-TIN-537533      TO  ACAT1FIO-SS-TIN-NBR             
                    MOVE 'T'                TO  ACAT1FIO-SS-TIN-CD              
                    IF NA-NAME-IND > 1                                          
                       MOVE 3               TO  ACAT1FIO-NM-END-LN-QTY          
                    ELSE                                                        
                       MOVE 2               TO  ACAT1FIO-NM-END-LN-QTY          
                    END-IF                                                      
                    PERFORM FIND-ZIP-CODE                                       
                 END-IF                                                         
              ELSE                                                              
537503           EVALUATE B1-REG-SETUP-OPTION                                   
                    WHEN '0'                                                    
                       MOVE NA-LINE (1)     TO  ACAT1FIO-NA-LINE (1)            
                       MOVE NA-LINE (2)     TO  ACAT1FIO-NA-LINE (2)            
                       MOVE NA-LINE (3)     TO  ACAT1FIO-NA-LINE (3)            
                       MOVE NA-LINE (4)     TO  ACAT1FIO-NA-LINE (4)            
                       MOVE NA-LINE (5)     TO  ACAT1FIO-NA-LINE (5)            
                       MOVE NA-LINE (6)     TO  ACAT1FIO-NA-LINE (6)            
                       MOVE NA-SOC-SEC      TO  ACAT1FIO-SS-TIN-NBR             
                       MOVE 'T'             TO  ACAT1FIO-SS-TIN-CD              
                       MOVE NA-ZIP (1:5)    TO  ACAT1FIO-ZIP5-CD                
                       MOVE NA-ZIP (6:4)    TO  ACAT1FIO-ZIP4-CD                
                       MOVE NA-NAME-IND     TO  ACAT1FIO-NM-END-LN-QTY          
                    WHEN '1'                                                    
                       MOVE B1-REG-537534   TO  ACAT1FIO-NA-LINE (1)            
                       MOVE B1-REG-537535   TO  ACAT1FIO-NA-LINE (2)            
                       MOVE B1-REG-537536   TO  ACAT1FIO-NA-LINE (3)            
                       MOVE B1-REG-537537   TO  ACAT1FIO-NA-LINE (4)            
                       MOVE SPACES          TO  ACAT1FIO-NA-LINE (5)            
                                                ACAT1FIO-NA-LINE (6)            
                       MOVE B1-TIN-537532   TO  ACAT1FIO-SS-TIN-NBR             
                       MOVE 'T'             TO  ACAT1FIO-SS-TIN-CD              
                       MOVE 1               TO  ACAT1FIO-NM-END-LN-QTY          
                       PERFORM FIND-ZIP-CODE                                    
                    WHEN '2'                                                    
                       MOVE B1-REG-537534   TO  ACAT1FIO-NA-LINE (1)            
                       INSPECT ACAT1FIO-NA-LINE (1)                             
                          REPLACING LEADING '    ' BY ' FBO'                    
                       MOVE NA-LINE (1)     TO  ACAT1FIO-NA-LINE (2)            
                       MOVE B1-REG-537535   TO  ACAT1FIO-NA-LINE (3)            
                       MOVE B1-REG-537536   TO  ACAT1FIO-NA-LINE (4)            
                       MOVE B1-REG-537537   TO  ACAT1FIO-NA-LINE (5)            
                       MOVE SPACES          TO  ACAT1FIO-NA-LINE (6)            
                       MOVE B1-TIN-537532   TO  ACAT1FIO-SS-TIN-NBR             
                       MOVE 'T'             TO  ACAT1FIO-SS-TIN-CD              
                       MOVE 2               TO  ACAT1FIO-NM-END-LN-QTY          
                       PERFORM FIND-ZIP-CODE                                    
                    WHEN '3'                                                    
                      IF NA-IRA-IND = 'Y'                                       
                       MOVE B1-REG-537538 TO ACAT1FIO-NA-LINE (1)               
                       MOVE ACAT1FIO-BRANCH                             )       
                                          TO ACAT1FIO-NA-LINE (2) (1:3)         
                       MOVE '-'           TO ACAT1FIO-NA-LINE (2) (4:1)         
                       MOVE ACAT1FIO-ACCOUNT                                    
                                          TO ACAT1FIO-NA-LINE (2) (5:5)         
                       MOVE '-'           TO ACAT1FIO-NA-LINE (2) (10:1)        
                       MOVE SPACES        TO ACAT1FIO-NA-LINE (2) (11:2)        
                       MOVE ACAT1FIO-TC  TO ACAT1FIO-NA-LINE (2) (13:18)        
                       MOVE B1-REG-537539 TO ACAT1FIO-NA-LINE (3)               
                       MOVE B1-REG-537540 TO ACAT1FIO-NA-LINE (4)               
                       MOVE B1-REG-537541 TO ACAT1FIO-NA-LINE (5)               
                       MOVE SPACES        TO ACAT1FIO-NA-LINE (6)               
                       MOVE B1-TIN-537533 TO ACAT1FIO-SS-TIN-NBR                
                       MOVE 'T'           TO ACAT1FIO-SS-TIN-CD                 
                       MOVE 1             TO ACAT1FIO-NM-END-LN-QTY             
                      ELSE                                                      
                       MOVE B1-REG-537534 TO ACAT1FIO-NA-LINE (1)               
                       MOVE ACAT1FIO-BRANCH                             )       
                                          TO ACAT1FIO-NA-LINE (2) (1:3)         
                       MOVE '-'           TO ACAT1FIO-NA-LINE (2) (4:1)         
                       MOVE ACAT1FIO-ACCOUNT                                    
                                          TO ACAT1FIO-NA-LINE (2) (5:5)         
                       MOVE '-'           TO ACAT1FIO-NA-LINE (2) (10:1)        
                       MOVE ACAT1FIO-TC   TO ACAT1FIO-NA-LINE (2) (11:2)        
                       MOVE SPACES       TO ACAT1FIO-NA-LINE (2) (13:18)        
                       MOVE B1-REG-537535 TO ACAT1FIO-NA-LINE (3)               
                       MOVE B1-REG-537536 TO ACAT1FIO-NA-LINE (4)               
                       MOVE B1-REG-537537 TO ACAT1FIO-NA-LINE (5)               
                       MOVE SPACES        TO ACAT1FIO-NA-LINE (6)               
                       MOVE B1-TIN-537532 TO ACAT1FIO-SS-TIN-NBR                
                       MOVE 'T'           TO ACAT1FIO-SS-TIN-CD                 
                       MOVE 1             TO ACAT1FIO-NM-END-LN-QTY             
                      END-IF                                                    
                      INSPECT ACAT1FIO-NA-LINE (1)                              
                         REPLACING LEADING '    ' BY ' FBO'                     
                      PERFORM FIND-ZIP-CODE                                     
                    WHEN '4'                                                    
                       IF NA-IRA-IND = 'Y'                                      
                          MOVE B1-REG-537538 TO  ACAT1FIO-NA-LINE (1)           
                          MOVE 'IRA CUST FBO' TO ACAT1FIO-NA-LINE (2)           
                          MOVE NA-LINE (1)   TO  ACAT1FIO-NA-LINE (3)           
                          MOVE B1-REG-537539 TO  ACAT1FIO-NA-LINE (4)           
                          MOVE B1-REG-537540 TO  ACAT1FIO-NA-LINE (5)           
                          MOVE B1-REG-537541 TO  ACAT1FIO-NA-LINE (6)           
                          MOVE B1-TIN-537533 TO  ACAT1FIO-SS-TIN-NBR            
                          MOVE 'T'           TO  ACAT1FIO-SS-TIN-CD             
                          MOVE 3             TO  ACAT1FIO-NM-END-LN-QTY         
                       ELSE                                                     
                          MOVE B1-REG-537534 TO  ACAT1FIO-NA-LINE (1)           
                          MOVE NA-LINE (1)   TO  ACAT1FIO-NA-LINE (2)           
                          MOVE B1-REG-537535 TO  ACAT1FIO-NA-LINE (3)           
                          MOVE B1-REG-537536 TO  ACAT1FIO-NA-LINE (4)           
                          MOVE B1-REG-537537 TO  ACAT1FIO-NA-LINE (5)           
                          MOVE SPACES        TO  ACAT1FIO-NA-LINE (6)           
                          MOVE B1-TIN-537532 TO  ACAT1FIO-SS-TIN-NBR            
                          MOVE 'T'           TO  ACAT1FIO-SS-TIN-CD             
                          MOVE 2             TO  ACAT1FIO-NM-END-LN-QTY         
                       END-IF                                                   
                       INSPECT ACAT1FIO-NA-LINE (1)                             
                          REPLACING LEADING '    ' BY ' FBO'                    
                       PERFORM FIND-ZIP-CODE                                    
                    WHEN '5'                                                    
                      MOVE B1-REG-537538 TO ACAT1FIO-NA-LINE (1)                
                      MOVE ' FBO'        TO ACAT1FIO-NA-LINE (2) (1:4)          
                      MOVE ACAT1FIO-BRANCH                                      
                                         TO ACAT1FIO-NA-LINE (2) (5:3)          
                      MOVE '-'           TO ACAT1FIO-NA-LINE (2) (8:1)          
                      MOVE ACAT1FIO-ACCOUNT                                     
                                         TO ACAT1FIO-NA-LINE (2) (9:5)          
                      MOVE '-'           TO ACAT1FIO-NA-LINE (2) (14:1)         
                      MOVE ACAT1FIO-TC   TO ACAT1FIO-NA-LINE (2) (15:2)         
                      MOVE SPACES        TO ACAT1FIO-NA-LINE (2) (17:14)        
                      MOVE B1-REG-537539 TO ACAT1FIO-NA-LINE (3)                
                      MOVE B1-REG-537540 TO ACAT1FIO-NA-LINE (4)                
                      MOVE B1-REG-537541 TO ACAT1FIO-NA-LINE (5)                
                      MOVE SPACES        TO ACAT1FIO-NA-LINE (6)                
                      MOVE B1-TIN-537533 TO ACAT1FIO-SS-TIN-NBR                 
                      MOVE 'T'           TO ACAT1FIO-SS-TIN-CD                  
                      MOVE 1             TO ACAT1FIO-NM-END-LN-QTY              
                      PERFORM FIND-ZIP-CODE                                     
                    WHEN '7'                                                    
                      IF NA-NAME-IND > 1                                        
                       MOVE B1-REG-537534 TO ACAT1FIO-NA-LINE (1)               
                       MOVE NA-LINE (1)   TO ACAT1FIO-NA-LINE (2)               
                       MOVE NA-LINE (2)   TO ACAT1FIO-NA-LINE (3)               
                       MOVE 'EDJ# '       TO ACAT1FIO-NA-LINE (4) (1:5)         
                       MOVE ACAT1FIO-BRANCH                                     
                                          TO ACAT1FIO-NA-LINE (4) (6:3)         
                       MOVE '-'           TO ACAT1FIO-NA-LINE (4) (9:1)         
                       MOVE ACAT1FIO-ACCOUNT                                    
                                          TO ACAT1FIO-NA-LINE (4) (10:5)        
                       MOVE '-'           TO ACAT1FIO-NA-LINE (4) (15:1)        
                       MOVE ACAT1FIO-TC   TO ACAT1FIO-NA-LINE (4) (16:2)        
                       MOVE SPACES       TO ACAT1FIO-NA-LINE (4) (19:13)        
                       MOVE B1-REG-537535 TO ACAT1FIO-NA-LINE (5)               
                       MOVE B1-REG-537536 TO ACAT1FIO-NA-LINE (6)               
                       MOVE B1-TIN-537532 TO ACAT1FIO-SS-TIN-NBR                
                       MOVE 'T'           TO ACAT1FIO-SS-TIN-CD                 
                       MOVE 3             TO ACAT1FIO-NM-END-LN-QTY             
                      ELSE                                                      
                       MOVE B1-REG-537534 TO ACAT1FIO-NA-LINE (1)               
                       MOVE NA-LINE (1)   TO ACAT1FIO-NA-LINE (2)               
                       MOVE 'EDJ# '       TO ACAT1FIO-NA-LINE (3) (1:5)         
                       MOVE ACAT1FIO-BRANCH                                     
                                          TO ACAT1FIO-NA-LINE (3) (6:3)         
                       MOVE '-'           TO ACAT1FIO-NA-LINE (3) (9:1)         
                       MOVE ACAT1FIO-ACCOUNT                                    
                                          TO ACAT1FIO-NA-LINE (3) (10:5)        
                       MOVE '-'           TO ACAT1FIO-NA-LINE (3) (15:1)        
                       MOVE ACAT1FIO-TC   TO ACAT1FIO-NA-LINE (3) (16:2)        
                       MOVE SPACES       TO ACAT1FIO-NA-LINE (3) (19:13)        
                       MOVE B1-REG-537535 TO ACAT1FIO-NA-LINE (4)               
                       MOVE B1-REG-537536 TO ACAT1FIO-NA-LINE (5)               
                       MOVE SPACES        TO ACAT1FIO-NA-LINE (6)               
                       MOVE B1-TIN-537532 TO ACAT1FIO-SS-TIN-NBR                
                       MOVE 'T'           TO ACAT1FIO-SS-TIN-CD                 
                       MOVE 2             TO ACAT1FIO-NM-END-LN-QTY             
                      END-IF                                                    
                      MOVE B1-REG-537536 (21:5) TO ACAT1FIO-ZIP5-CD             
                      MOVE B1-REG-537536 (27:4) TO ACAT1FIO-ZIP4-CD             
                    WHEN OTHER                                                  
                      MOVE NA-LINE (1)      TO  ACAT1FIO-NA-LINE (1)            
                      MOVE NA-LINE (2)      TO  ACAT1FIO-NA-LINE (2)            
                      MOVE NA-LINE (3)      TO  ACAT1FIO-NA-LINE (3)            
                      MOVE NA-LINE (4)      TO  ACAT1FIO-NA-LINE (4)            
                      MOVE NA-LINE (5)      TO  ACAT1FIO-NA-LINE (5)            
                      MOVE NA-LINE (6)      TO  ACAT1FIO-NA-LINE (6)            
                      IF NA-IRA-IND = 'Y'                                       
                         MOVE B1-TIN-537533 TO  ACAT1FIO-SS-TIN-NBR             
                         MOVE 'T'           TO  ACAT1FIO-SS-TIN-CD              
                      ELSE                                                      
                         MOVE NA-SOC-SEC    TO  ACAT1FIO-SS-TIN-NBR             
                         MOVE NA-SOC-SEC-CD TO  ACAT1FIO-SS-TIN-CD              
                      END-IF                                                    
                      MOVE NA-ZIP (1:5)     TO  ACAT1FIO-ZIP5-CD                
                      MOVE NA-ZIP (6:4)     TO  ACAT1FIO-ZIP4-CD                
                      MOVE NA-NAME-IND      TO  ACAT1FIO-NM-END-LN-QTY          
                 END-EVALUATE                                                   
              END-IF                                                            
           END-IF.                                                              
                                                                                
434608     IF B1-CUST-ACCT-OPTION = '0'                                         
              IF NA-NAME-IND > 1                                                
                 MOVE B1-REG-537534     TO  ACAT1FIO-NA-LINE (1)                
                 MOVE NA-LINE (1)       TO  ACAT1FIO-NA-LINE (2)                
                 MOVE NA-LINE (2)       TO  ACAT1FIO-NA-LINE (3)                
                 MOVE 'EDJ# '           TO  ACAT1FIO-NA-LINE (4) (1:5)          
                 MOVE ACAT1FIO-BRANCH   TO  ACAT1FIO-NA-LINE (4) (6:3)          
                 MOVE '-'               TO  ACAT1FIO-NA-LINE (4) (9:1)          
                 MOVE ACAT1FIO-ACCOUNT  TO  ACAT1FIO-NA-LINE (4) (10:5)         
                 MOVE '-'               TO  ACAT1FIO-NA-LINE (4) (15:1)         
                 MOVE ACAT1FIO-TC       TO  ACAT1FIO-NA-LINE (4) (16:2)         
                 MOVE SPACES            TO  ACAT1FIO-NA-LINE (4) (19:13)        
                 MOVE B1-REG-537535     TO  ACAT1FIO-NA-LINE (5)                
                 MOVE B1-REG-537536     TO  ACAT1FIO-NA-LINE (6)                
                 MOVE B1-TIN-537532     TO  ACAT1FIO-SS-TIN-NBR                 
                 MOVE 'T'               TO  ACAT1FIO-SS-TIN-CD                  
                 MOVE 3                 TO  ACAT1FIO-NM-END-LN-QTY              
              ELSE                                                              
                 MOVE B1-REG-537534     TO  ACAT1FIO-NA-LINE (1)                
                 MOVE NA-LINE (1)       TO  ACAT1FIO-NA-LINE (2)                
                 MOVE 'EDJ# '           TO  ACAT1FIO-NA-LINE (3) (1:5)          
                 MOVE ACAT1FIO-BRANCH   TO  ACAT1FIO-NA-LINE (3) (6:3)          
                 MOVE '-'               TO  ACAT1FIO-NA-LINE (3) (9:1)          
                 MOVE ACAT1FIO-ACCOUNT  TO  ACAT1FIO-NA-LINE (3) (10:5)         
                 MOVE '-'               TO  ACAT1FIO-NA-LINE (3) (15:1)         
                 MOVE ACAT1FIO-TC       TO  ACAT1FIO-NA-LINE (3) (16:2)         
                 MOVE SPACES            TO  ACAT1FIO-NA-LINE (3) (19:13)        
                 MOVE B1-REG-537535     TO  ACAT1FIO-NA-LINE (4)                
                 MOVE B1-REG-537536     TO  ACAT1FIO-NA-LINE (5)                
                 MOVE SPACES            TO  ACAT1FIO-NA-LINE (6)                
                 MOVE B1-TIN-537532     TO  ACAT1FIO-SS-TIN-NBR                 
                 MOVE 'T'               TO  ACAT1FIO-SS-TIN-CD                  
                 MOVE 2                 TO  ACAT1FIO-NM-END-LN-QTY              
              END-IF                                                            
              MOVE B1-REG-537536 (21:5) TO  ACAT1FIO-ZIP5-CD                    
              MOVE B1-REG-537536 (27:4) TO  ACAT1FIO-ZIP4-CD                    
           END-IF.                                                              
                                                                                
           MOVE SPACES                  TO  TAXW-SEARCH-KEY.                    
           MOVE NA-WITHHOLD             TO  TAXW-NA-WITHHOLDING-IND.            
           MOVE NA-IRA-IND              TO  TAXW-IRA-IND.                       
           MOVE ACAT1FIO-NTWRK-CNTL-CD  TO  TAXW-MATRIX-LEVEL.                  
           MOVE NA-SOC-SEC              TO  TAXW-SS-OR-TAX.                     
           MOVE ACAT1FIO-FUND-BK-CD     TO  TAXW-BOOK-CODE.                     
           PERFORM 8000-TRANSLATE-TAX.                                          
           MOVE TAXW-NSCC-WITHHOLDING-IND TO ACAT1FIO-WTHLD-CD.                 
                                                                                
      *    IF M1SSNBRI NOT = ACAT1FIO-SS-TIN-NBR    OR                          
      *       M1SSTINI NOT = ACAT1FIO-SS-TIN-CD     OR                          
      *       M1NA1I   NOT = ACAT1FIO-NA-LINE (1)   OR                          
      *       M1NA2I   NOT = ACAT1FIO-NA-LINE (2)   OR                          
      *       M1NA3I   NOT = ACAT1FIO-NA-LINE (3)   OR                          
      *       M1NA4I   NOT = ACAT1FIO-NA-LINE (4)   OR                          
      *       M1NA5I   NOT = ACAT1FIO-NA-LINE (5)   OR                          
      *       M1NA6I   NOT = ACAT1FIO-NA-LINE (6)   OR                          
      *       M1ZIP5I  NOT = ACAT1FIO-ZIP5-CD       OR                          
      *       M1ZIP4I  NOT = ACAT1FIO-ZIP4-CD                                   
              MOVE ACAT1FIO-NA-LINE (1)     TO  M1NA1O.                         
              MOVE ACAT1FIO-NA-LINE (2)     TO  M1NA2O.                         
              MOVE ACAT1FIO-NA-LINE (3)     TO  M1NA3O.                         
              MOVE ACAT1FIO-NA-LINE (4)     TO  M1NA4O.                         
              MOVE ACAT1FIO-NA-LINE (5)     TO  M1NA5O.                         
              MOVE ACAT1FIO-NA-LINE (6)     TO  M1NA6O.                         
              MOVE ACAT1FIO-ZIP5-CD         TO  M1ZIP5O.                        
              MOVE ACAT1FIO-ZIP4-CD         TO  M1ZIP4O.                        
              MOVE ACAT1FIO-SS-TIN-NBR      TO  M1SSNBRO.                       
              MOVE ACAT1FIO-SS-TIN-CD       TO  M1SSTINO.                       
              MOVE ACAT1FIO-WTHLD-CD        TO  M1WTHTAXO.                      
              MOVE 'NEW N-LVL/BOOK CODE CHANGED REGISTRATION'                   
                                            TO  M1ERRMSGO.                      
              MOVE -1                       TO  M1BOOKL.                        
              PERFORM SEND-MAP-DATAONLY.                                        
              PERFORM RETURN-TO-CICS.                                           
      *    END-IF.                                                              
                                                                                
           EJECT                                                                
      ****************************                                              
       NTWRK-BOOK-VALIDATION-EXIT.                                              
      ****************************                                              
                                                                                
           EXIT.                                                                
                                                                                
           EJECT                                                                
      ***************                                                           
       FIND-ZIP-CODE.                                                           
      ***************                                                           
                                                                                
           MOVE SPACES                  TO  ACAT1FIO-ZIP5-CD                    
                                            ACAT1FIO-ZIP4-CD.                   
                                                                                
           SET ZIP-NOT-FOUND            TO  TRUE.                               
                                                                                
           IF ACAT1FIO-NA-LINE (6) > SPACES                                     
              MOVE ACAT1FIO-NA-LINE (6) TO  W-ADDRESS-WORK-BYTES                
              PERFORM FIND-EMBEDDED-ZIP-CODE                                    
           END-IF.                                                              
                                                                                
           IF ZIP-NOT-FOUND AND ACAT1FIO-NA-LINE (5) > SPACES                   
              MOVE ACAT1FIO-NA-LINE (5) TO  W-ADDRESS-WORK-BYTES                
              PERFORM FIND-EMBEDDED-ZIP-CODE                                    
           END-IF.                                                              
                                                                                
           IF ZIP-NOT-FOUND AND ACAT1FIO-NA-LINE (4) > SPACES                   
              MOVE ACAT1FIO-NA-LINE (4) TO  W-ADDRESS-WORK-BYTES                
              PERFORM FIND-EMBEDDED-ZIP-CODE                                    
           END-IF.                                                              
                                                                                
           IF ZIP-NOT-FOUND AND ACAT1FIO-NA-LINE (3) > SPACES                   
              MOVE ACAT1FIO-NA-LINE (3) TO  W-ADDRESS-WORK-BYTES                
              PERFORM FIND-EMBEDDED-ZIP-CODE                                    
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ************************                                                  
       FIND-EMBEDDED-ZIP-CODE.                                                  
      ************************                                                  
                                                                                
           MOVE 5                           TO  ZIP-SUB.                        
           SET ZIP-NOT-FOUND                TO  TRUE.                           
           MOVE SPACES                      TO  W-ZIP-WORK-BYTES.               
                                                                                
           PERFORM VARYING ADDRESS-SUB FROM 36 BY -1 UNTIL                      
              (ADDRESS-SUB < 1 OR ZIP-FOUND)                                    
              EVALUATE W-ADDRESS-WORK-BYTE (ADDRESS-SUB)                        
                 WHEN '0' THRU '9'                                              
                   MOVE W-ADDRESS-WORK-BYTE (ADDRESS-SUB) TO                    
                        W-ZIP-WORK-BYTE (ZIP-SUB)                               
                   SUBTRACT 1 FROM ZIP-SUB                                      
                 WHEN '-'                                                       
                   MOVE W-ZIP-WORK-BYTE (5) TO  W-ZIP-WORK-BYTE (9)             
                   MOVE W-ZIP-WORK-BYTE (4) TO  W-ZIP-WORK-BYTE (8)             
                   MOVE W-ZIP-WORK-BYTE (3) TO  W-ZIP-WORK-BYTE (7)             
                   MOVE W-ZIP-WORK-BYTE (2) TO  W-ZIP-WORK-BYTE (6)             
                   MOVE 5                   TO  ZIP-SUB                         
                 WHEN OTHER                                                     
                   CONTINUE                                                     
              END-EVALUATE                                                      
              IF ZIP-SUB = 0                                                    
                 SET ZIP-FOUND              TO  TRUE                            
                 MOVE W-ZIP-WORK-BYTES (1:5) TO ACAT1FIO-ZIP5-CD                
                 MOVE W-ZIP-WORK-BYTES (6:4) TO ACAT1FIO-ZIP4-CD                
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
           COPY BNWTAXWP.                                                       
                                                                                
           EJECT                                                                
      *****************                                                         
       DATA-VALIDATION.                                                         
      *****************                                                         
                                                                                
           MOVE SPACES                      TO  M1ERRMSGO.                      
                                                                                
           MOVE M1RELACCI                   TO  ACAT1FIO-ACCT-RLTD-NBR.         
                                                                                
           IF M1BFCODEI = SPACES OR LOW-VALUES                                  
              IF ACAT1FIO-ACCT-RLTD-NBR = SPACES OR LOW-VALUES                  
                 MOVE SPACES             TO  ACAT1FIO-ACCT-RLTD-CD              
              ELSE                                                              
                 MOVE 'RELATED ACCT IND IS REQUIRES WHEN THE RELATED ACC        
      -               'T NUMBER IS ENTERED'                                     
                                         TO  M1ERRMSGO                          
                 MOVE -1                 TO  M1RELACCL                          
              END-IF                                                            
           ELSE                                                                 
      *       IF ACAT1FIO-ACCT-RLTD-NBR = SPACES OR LOW-VALUES                  
      *          MOVE 'RELATED ACCT IND MUST BE BLANK IF NO RELATED A           
      *               'CCT NUMBER ENTERED'                                      
      *                                  TO  M1ERRMSGO                          
      *          MOVE -1                 TO  M1RELACCL                          
      *          MOVE ATT-UNPROT-BRT-MDT TO  M1RELACCA                          
      *       ELSE                                                              
                 EVALUATE M1RELACCI                                             
                    WHEN 'B'                                                    
                       MOVE '2'          TO  ACAT1FIO-ACCT-RLTD-CD              
                    WHEN 'F'                                                    
                       MOVE '1'          TO  ACAT1FIO-ACCT-RLTD-CD              
                    WHEN OTHER                                                  
                       MOVE 'RELATED ACCOUNT INDICATOR SHOULD BE B OR F'        
                                         TO  M1ERRMSGO                          
                       MOVE -1           TO  M1BFCODEL                          
                       MOVE ATT-UNPROT-BRT TO  M1BFCODEA                        
                 END-EVALUATE                                                   
      *       END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M1ZIP4I = SPACES OR LOW-VALUES                                    
              MOVE SPACES                TO  ACAT1FIO-ZIP4-CD                   
           ELSE                                                                 
              IF M1ZIP4I NOT NUMERIC                                            
                 MOVE 'ZIP4 CODE MUST BE NUMERIC'                               
                                         TO  M1ERRMSGO                          
                 MOVE -1                 TO  M1ZIP4L                            
                 MOVE ATT-UNPROT-BRT-MDT TO  M1ZIP4A                            
              ELSE                                                              
                 MOVE M1ZIP4I            TO  ACAT1FIO-ZIP4-CD                   
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M1ZIP5I = SPACES OR LOW-VALUES                                    
              MOVE 'ZIP CODE 5 IS REQUIRED'                                     
                                         TO  M1ERRMSGO                          
              MOVE -1                    TO  M1ZIP5L                            
           ELSE                                                                 
              IF M1ZIP5I NOT NUMERIC                                            
                 MOVE 'ZIP5 CODE MUST BE NUMERIC'                               
                                         TO  M1ERRMSGO                          
                 MOVE -1                 TO  M1ZIP5L                            
                 MOVE ATT-UNPROT-BRT-MDT TO  M1ZIP5A                            
              ELSE                                                              
                 MOVE M1ZIP5I            TO  ACAT1FIO-ZIP5-CD                   
              END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE M1TINAMEI                TO  ACAT1FIO-CUST-NM.                  
                                                                                
           MOVE M1NA6I                   TO  ACAT1FIO-NA-LINE (6).              
           MOVE M1NA5I                   TO  ACAT1FIO-NA-LINE (5).              
           MOVE M1NA4I                   TO  ACAT1FIO-NA-LINE (4).              
           MOVE M1NA3I                   TO  ACAT1FIO-NA-LINE (3).              
           MOVE M1NA2I                   TO  ACAT1FIO-NA-LINE (2).              
           MOVE M1NA1I                   TO  ACAT1FIO-NA-LINE (1).              
                                                                                
           IF ACAT1FIO-NA-LINE (1) = (SPACES OR LOW-VALUES) AND                 
              ACAT1FIO-NA-LINE (2) = (SPACES OR LOW-VALUES) AND                 
              ACAT1FIO-NA-LINE (3) = (SPACES OR LOW-VALUES) AND                 
              ACAT1FIO-NA-LINE (4) = (SPACES OR LOW-VALUES) AND                 
              ACAT1FIO-NA-LINE (5) = (SPACES OR LOW-VALUES) AND                 
              ACAT1FIO-NA-LINE (6) = (SPACES OR LOW-VALUES)                     
              MOVE 'AT LEAST ONE LINE OF NAME-AND-ADDRESS IS REQUIRED'          
                                            TO  M1ERRMSGO                       
              MOVE -1                       TO  M1NA1I                          
           ELSE                                                                 
              SET STOP-NOT-OK               TO  TRUE                            
              PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 6 OR STOP-OK            
                 IF ACAT1FIO-NA-LINE (S1) = SPACES                              
                    PERFORM VARYING S2 FROM S1 BY 1 UNTIL S2 > 6 OR             
                       STOP-OK                                                  
                       IF ACAT1FIO-NA-LINE (S2) NOT = SPACES                    
                          MOVE 'NO BLANK LINES ARE PERMITTED IN ADDRESS'        
                                            TO  M1ERRMSGO                       
                          EVALUATE S1                                           
                             WHEN 1                                             
                                MOVE -1     TO  M1NA1L                          
                             WHEN 2                                             
                                MOVE -1     TO  M1NA2L                          
                             WHEN 3                                             
                                MOVE -1     TO  M1NA3L                          
                             WHEN 4                                             
                                MOVE -1     TO  M1NA4L                          
                             WHEN 5                                             
                                MOVE -1     TO  M1NA5L                          
                             WHEN OTHER                                         
                                MOVE -1     TO  M1NA6L                          
                          END-EVALUATE                                          
                          MOVE ATT-UNPROT-BRT-MDT TO  M1NA1A                    
                                                      M1NA2A                    
                                                      M1NA3A                    
                                                      M1NA4A                    
                                                      M1NA5A                    
                                                      M1NA6A                    
                          SET STOP-OK           TO  TRUE                        
                       END-IF                                                   
                    END-PERFORM                                                 
                 END-IF                                                         
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
              IF M1CHCKPRI = LOW-VALUES                                         
                 MOVE SPACES             TO  M1CHCKPRI                          
              END-IF.                                                           
                                                                                
              IF M1CHCKPRI = ('Y' OR 'N' OR ' ')                                
                 MOVE M1CHCKPRI          TO  ACAT1FIO-CHCK-WRTNG-IND            
              ELSE                                                              
                 MOVE 'CHECK WRITING PRIVILEGE SHOULD BE Y OR N'                
                                         TO  M1ERRMSGO                          
                 MOVE -1                 TO  M1CHCKPRL                          
                 MOVE ATT-UNPROT-BRT-MDT TO  M1CHCKPRA                          
              END-IF.                                                           
                                                                                
      *    IF M1PBLNBRL NOT = ZERO                                              
      *       IF M1PBLNBRI = SPACES OR LOW-VALUES                               
      *          MOVE ZEROES                TO  ACAT1FIO-PYBL-QTY               
      *          MOVE '00'                  TO  M1PBLNBRO                       
      *       ELSE                                                              
      *       INSPECT M1PBLNBRI REPLACING ALL SPACES BY ZEROES                  
      *       IF M1PBLNBRI IS NOT NUMERIC                                       
      *          MOVE 'NUMBER OF PAYABLES SHOULD BE NUMERIC'                    
      *                                     TO  M1ERRMSGO                       
      *          MOVE -1                    TO  M1PBLNBRL                       
      *          MOVE ATT-UNPROT-BRT-MDT    TO  M1PBLNBRA                       
      *       ELSE                                                              
      *          IF M1PBLNBRI <= 06                                             
      *             MOVE M1PBLNBRI          TO  ACAT1FIO-PYBL-QTY               
      *          ELSE                                                           
      *             MOVE 'NUMBER OF PAYABLES CANNOT EXCEED 6'                   
      *                                     TO  M1ERRMSGO                       
      *             MOVE -1                 TO  M1PBLNBRL                       
      *             MOVE ATT-UNPROT-BRT-MDT TO  M1PBLNBRA                       
      *          END-IF                                                         
      *       END-IF                                                            
      *       END-IF                                                            
      *    END-IF.                                                              
                                                                                
           IF M1PAYINDI = SPACES OR LOW-VALUES                                  
              MOVE 'PAYABLE INFORMATION INDICATOR IS REQUIRED'                  
                                         TO  M1ERRMSGO                          
              MOVE -1                    TO  M1PAYINDL                          
           ELSE                                                                 
              EVALUATE M1PAYINDI                                                
                 WHEN 'R'                                                       
                    MOVE '0'             TO  ACAT1FIO-PYBL-INFO-CD              
                 WHEN 'P'                                                       
                    MOVE '1'             TO  ACAT1FIO-PYBL-INFO-CD              
                 WHEN 'A'                                                       
                    MOVE '2'             TO  ACAT1FIO-PYBL-INFO-CD              
                 WHEN 'C'                                                       
                    MOVE '3'             TO  ACAT1FIO-PYBL-INFO-CD              
                 WHEN 'X'                                                       
                    MOVE '4'             TO  ACAT1FIO-PYBL-INFO-CD              
                 WHEN OTHER                                                     
                    MOVE 'PAYABLE INFO. INDICATOR SHOULD BE R, P, A, C O        
      -                  'R X'           TO  M1ERRMSGO                          
                    MOVE -1              TO  M1PAYINDL                          
                    MOVE ATT-UNPROT-BRT-MDT TO  M1PAYINDA                       
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
           IF M1OLDACCI = SPACES OR LOW-VALUES OR ZEROES                        
              MOVE SPACES                TO  ACAT1FIO-FNBR                      
              MOVE SPACES                TO  M1OLDACCO                          
           ELSE                                                                 
              MOVE M1OLDACCI             TO  ACAT1FIO-FNBR                      
           END-IF.                                                              
                                                                                
           IF M1NRAPCI = SPACES OR LOW-VALUES OR ZEROES                         
              MOVE  ZEROES               TO  ACAT1FIO-NRA-TAX-PCT               
              MOVE SPACES                TO  M1NRAPCO                           
           ELSE                                                                 
              INSPECT M1NRAPCI REPLACING ALL SPACES BY ZEROES                   
              IF M1NRAPCI NUMERIC                                               
                 MOVE M1NRAPCI           TO  ACAT1FIO-NRA-TAX-PCT               
              ELSE                                                              
                 MOVE 'NRA PERCENTAGE SHOULD BE NUMERIC'                        
                                         TO  M1ERRMSGO                          
                 MOVE -1                 TO  M1NRAPCL                           
                 MOVE ATT-UNPROT-BRT-MDT TO  M1NRAPCA                           
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M1WTHTAXI = SPACES OR LOW-VALUES                                  
              MOVE 'WITHHOLDING TAX INDICATOR IS REQUIRED'                      
                                          TO  M1ERRMSGO                         
              MOVE -1                     TO  M1WTHTAXL                         
           ELSE                                                                 
              IF M1WTHTAXI = ('0' OR '1' OR '2' OR '3' OR '4' OR                
                              '5' OR '6' OR '7' OR '8' OR '9')                  
                 MOVE M1WTHTAXI           TO  ACAT1FIO-WTHLD-CD                 
              ELSE                                                              
                 MOVE 'WITHHOLDING INDICATOR SHOULD BE 0, 1, 2, 3, 4, 5,        
      -               ' 6, 7, 8 OR 9'     TO  M1ERRMSGO                         
                 MOVE -1                  TO  M1WTHTAXL                         
                 MOVE ATT-UNPROT-BRT-MDT  TO  M1WTHTAXA                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M1SSTINI = SPACES OR LOW-VALUES                                   
              MOVE 'SSN/TIN INDICATOR IS REQUIRED'                              
                                         TO  M1ERRMSGO                          
              MOVE -1                    TO  M1SSTINL                           
           ELSE                                                                 
              EVALUATE M1SSTINI                                                 
                 WHEN 'T'                                                       
                    MOVE '0'             TO  ACAT1FIO-SS-TIN-CD                 
                 WHEN 'S'                                                       
                    MOVE '1'             TO  ACAT1FIO-SS-TIN-CD                 
                 WHEN OTHER                                                     
                    MOVE 'SSN/TIN INDICATOR SHOULD BE S OR T'                   
                                         TO  M1ERRMSGO                          
                    MOVE -1              TO  M1SSTINL                           
                    MOVE ATT-UNPROT-BRT-MDT TO M1SSTINA                         
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
           IF M1SSNBRI = SPACES OR LOW-VALUES                                   
              MOVE 'SSN/TIN IS REQUIRED' TO  M1ERRMSGO                          
              MOVE -1                    TO  M1SSNBRL                           
           ELSE                                                                 
              IF M1SSNBRI NOT NUMERIC                                           
                 MOVE 'SSN/TIN NUMBER MUST BE NUMERIC'                          
                                         TO  M1ERRMSGO                          
                 MOVE -1                 TO  M1SSNBRL                           
                 MOVE ATT-UNPROT-BRT-MDT TO  M1SSNBRA                           
              ELSE                                                              
                 IF M1SSNBRI = ZEROES                                           
                    MOVE 'SSN/TIN NUMBER CANNOT BE ALL ZEROES'                  
                                         TO  M1ERRMSGO                          
                    MOVE -1              TO  M1SSNBRL                           
                    MOVE ATT-UNPROT-BRT-MDT TO M1SSNBRA                         
                 ELSE                                                           
                    MOVE M1SSNBRI        TO  ACAT1FIO-SS-TIN-NBR                
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M1STATEI = SPACES                                                 
              CONTINUE                                                          
           ELSE                                                                 
              MOVE M1STATEI              TO  VALID-STATE-CODES                  
              IF VALID-STATE-CODE                                               
                 MOVE M1STATEI           TO  ACAT1FIO-SL-ST-CD                  
                 MOVE ATT-UNPROT-MDT     TO  M1STATEA                           
              ELSE                                                              
                 MOVE 'STATE CODE IS NOT RECOGNIZED'                            
                                         TO  M1ERRMSGO                          
                 MOVE -1                 TO  M1STATEL                           
                 MOVE ATT-UNPROT-BRT-MDT TO  M1STATEA                           
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M1SOCIALI = SPACES OR LOW-VALUES                                  
              MOVE 'SOCIAL CODE IS REQUIRED'                                    
                                         TO  M1ERRMSGO                          
              MOVE -1                    TO  M1SOCIALL                          
           ELSE                                                                 
              MOVE M1SOCIALI             TO  VALID-SOCIAL-CDS                   
              IF VALID-SOCIAL-CD                                                
                 MOVE M1SOCIALI          TO  ACAT1FIO-SOC-CD                    
              ELSE                                                              
                 MOVE 'SOCIAL CODE MUST BE 01 THRU 18, OR 99'                   
                                          TO  M1ERRMSGO                         
                 MOVE -1                  TO  M1SOCIALL                         
                 MOVE ATT-UNPROT-BRT-MDT  TO  M1SOCIALA                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           SET ROA-LOI-VALID                TO  TRUE.                           
           IF M1ROALOII = SPACES OR LOW-VALUES                                  
              MOVE SPACES                TO  ACAT1FIO-ROA-LOI-CD                
           ELSE                                                                 
              IF M1ROALOII = ('R' OR 'L')                                       
                 MOVE M1ROALOII          TO  ACAT1FIO-ROA-LOI-CD                
              ELSE                                                              
                 MOVE 'ROA/LOI INDICATOR SHOULD BE R OR L'                      
                                         TO  M1ERRMSGO                          
                 MOVE -1                 TO  M1ROALOIL                          
                 MOVE ATT-UNPROT-BRT-MDT TO  M1ROALOIA                          
                 SET ROA-LOI-INVALID     TO  TRUE                               
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF ROA-LOI-VALID                                                     
              IF M1ROALOII = SPACES OR LOW-VALUES                               
                 IF M1LOIDATI = SPACES OR LOW-VALUES OR ZEROES                  
                    MOVE '00010101'         TO  ACAT1FIO-LOI-DT                 
                    MOVE SPACES             TO  M1LOIDATO                       
                 ELSE                                                           
                    MOVE 'WHEN LOI DATE IS FILLED - ROA/LOI INDICATOR MU        
      -                  'ST BE FILLED'     TO  M1ERRMSGO                       
                    MOVE -1                 TO  M1ROALOIL                       
                    MOVE ATT-UNPROT-BRT-MDT TO  M1LOIDATA                       
                 END-IF                                                         
              ELSE                                                              
              IF M1ROALOII = 'L'                                                
                 EVALUATE TRUE                                                  
                    WHEN M1LOIDATI = SPACES                                     
                       MOVE 'LOI DATE IS REQUIRED WHEN ROA/LOI IND IS L'        
                                            TO  M1ERRMSGO                       
                       MOVE -1              TO  M1LOIDATL                       
                    WHEN M1LOIDATI NOT NUMERIC                                  
                       MOVE 'LOI DATE SHOULD BE NUMERIC IN CCYYMMDD FORM        
      -                     'AT'            TO  M1ERRMSGO                       
                       MOVE -1              TO  M1LOIDATL                       
                       MOVE ATT-UNPROT-BRT-MDT TO  M1LOIDATA                    
                    WHEN M1LOIDATI (1:2) < 19                                   
                       MOVE 'LOI CENTURY SHOULD BE 19 OR 20'                    
                                            TO  M1ERRMSGO                       
                       MOVE -1              TO  M1LOIDATL                       
                       MOVE ATT-UNPROT-BRT-MDT TO  M1LOIDATA                    
                    WHEN M1LOIDATI (1:2) > 20                                   
                      MOVE 'LETTER OF INTENT CENTURY SHOULD BE 19 OR 20'        
                                            TO  M1ERRMSGO                       
                       MOVE -1              TO  M1LOIDATL                       
                       MOVE ATT-UNPROT-BRT-MDT TO  M1LOIDATA                    
                    WHEN M1LOIDATI (5:2) > 12                                   
                    MOVE 'LETTER OF INTENT DATE: MONTH CANNOT EXCCED 12'        
                                            TO  M1ERRMSGO                       
                       MOVE -1              TO  M1LOIDATL                       
                       MOVE ATT-UNPROT-BRT-MDT TO  M1LOIDATA                    
                    WHEN M1LOIDATI (7:2) > 31                                   
                      MOVE 'LETTER OF INTENT DATE: DAY CANNOT EXCEED 31'        
                                            TO  M1ERRMSGO                       
                       MOVE -1              TO  M1LOIDATL                       
                       MOVE ATT-UNPROT-BRT-MDT TO  M1LOIDATA                    
                    WHEN OTHER                                                  
                       MOVE M1LOIDATI       TO  ACAT1FIO-LOI-DT                 
                       MOVE ATT-UNPROT-MDT  TO  M1LOIDATA                       
                 END-EVALUATE                                                   
              ELSE                                                              
                 IF M1LOIDATI = SPACES OR LOW-VALUES OR ZEROES                  
                    MOVE '00010101'         TO  ACAT1FIO-LOI-DT                 
                    MOVE SPACES             TO  M1LOIDATO                       
                 ELSE                                                           
                    EVALUATE TRUE                                               
                       WHEN M1LOIDATI = SPACES                                  
                       MOVE 'LOI DATE IS REQUIRED WHEN ROA/LOI IND IS L'        
                                            TO  M1ERRMSGO                       
                          MOVE -1           TO  M1LOIDATL                       
                       WHEN M1LOIDATI NOT NUMERIC                               
                          MOVE 'LOI DATE SHOULD BE NUMERIC IN CCYYMMDD F        
      -                        'ORMAT'      TO  M1ERRMSGO                       
                          MOVE -1           TO  M1LOIDATL                       
                          MOVE ATT-UNPROT-BRT-MDT TO  M1LOIDATA                 
                       WHEN M1LOIDATI (1:2) < 19                                
                          MOVE 'LOI CENTURY SHOULD BE 19 OR 20'                 
                                            TO  M1ERRMSGO                       
                          MOVE -1           TO  M1LOIDATL                       
                          MOVE ATT-UNPROT-BRT-MDT TO  M1LOIDATA                 
                       WHEN M1LOIDATI (1:2) > 20                                
                      MOVE 'LETTER OF INTENT CENTURY SHOULD BE 19 OR 20'        
                                            TO  M1ERRMSGO                       
                          MOVE -1           TO  M1LOIDATL                       
                          MOVE ATT-UNPROT-BRT-MDT TO  M1LOIDATA                 
                       WHEN M1LOIDATI (5:2) > 12                                
                    MOVE 'LETTER OF INTENT DATE: MONTH CANNOT EXCCED 12'        
                                            TO  M1ERRMSGO                       
                          MOVE -1           TO  M1LOIDATL                       
                          MOVE ATT-UNPROT-BRT-MDT TO  M1LOIDATA                 
                       WHEN M1LOIDATI (7:2) > 31                                
                      MOVE 'LETTER OF INTENT DATE: DAY CANNOT EXCEED 31'        
                                            TO  M1ERRMSGO                       
                          MOVE -1           TO  M1LOIDATL                       
                          MOVE ATT-UNPROT-BRT-MDT TO  M1LOIDATA                 
                       WHEN OTHER                                               
                          MOVE M1LOIDATI    TO  ACAT1FIO-LOI-DT                 
                          MOVE ATT-UNPROT-MDT TO  M1LOIDATA                     
                    END-EVALUATE                                                
                 END-IF                                                         
              END-IF                                                            
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF ROA-LOI-VALID                                                     
              IF M1ROALOII = SPACES OR LOW-VALUES                               
                 MOVE M1RLAMTI              TO  VALID-ROA-LOI-ZEROES            
                 IF (M1RLAMTI = SPACES OR LOW-VALUES) OR                        
                    VALID-ROA-LOI-ZEROE                                         
                    MOVE '00000000000000.00' TO ACAT1FIO-ROA-LOI-AMT            
                    MOVE SPACES              TO M1RLAMTO                        
                 ELSE                                                           
                    MOVE 'WHEN ROA/LOI AMOUNT IS NOT ZERO - ROA/LOI INDI        
      -                  'CATOR MUST BE FILLED' TO  M1ERRMSGO                   
                    MOVE -1                 TO  M1ROALOIL                       
                    MOVE ATT-UNPROT-BRT-MDT TO  M1RLAMTA                        
                 END-IF                                                         
              ELSE                                                              
              IF M1RLAMTI = SPACES OR LOW-VALUES                                
                 MOVE 'ROA/LOI AMOUNT IS REQUIRED WHEN ROA/LOI INDICATOR        
      -               ' IS NOT BLANK'       TO  M1ERRMSGO                       
                 MOVE -1                    TO  M1RLAMTL                        
              ELSE                                                              
                 MOVE 0                     TO  WS-CNTR                         
                 MOVE M1RLAMTI              TO  WS-M1RLAMTI                     
                 INSPECT WS-M1RLAMTI REPLACING ALL SPACES BY ZEROES             
                 INSPECT WS-M1RLAMTI TALLYING WS-CNTR FOR ALL '.'               
                 EVALUATE WS-CNTR                                               
                    WHEN 0                                                      
                       MOVE 'ROA/LOI AMT MUST HAVE A PERIOD'                    
                                            TO  M1ERRMSGO                       
                       MOVE -1              TO  M1RLAMTL                        
                       MOVE ATT-UNPROT-BRT-MDT TO M1RLAMTA                      
                    WHEN 1                                                      
                       CONTINUE                                                 
                    WHEN OTHER                                                  
                       MOVE 'ROA/LOI AMT CAN HAVE ONLY ONE PERIOD'              
                                            TO  M1ERRMSGO                       
                       MOVE -1              TO  M1RLAMTL                        
                       MOVE ATT-UNPROT-BRT-MDT TO M1RLAMTA                      
                 END-EVALUATE                                                   
                 IF WS-CNTR = 1                                                 
                    MOVE M1RLAMTI           TO  WS-RL-AMT-TABLE                 
                    SET STOP-NOT-OK         TO  TRUE                            
                    PERFORM VARYING S1 FROM 1 BY 1                              
                       UNTIL WS-RL-AMT (S1) = '.' OR STOP-OK                    
                       IF WS-RL-AMT (S1) NOT NUMERIC                            
                          MOVE 'ERROR IN ROA/LOI AMOUNT'                        
                                            TO  M1ERRMSGO                       
                          MOVE -1           TO  M1RLAMTL                        
                          MOVE ATT-UNPROT-BRT-MDT TO M1RLAMTA                   
                          SET STOP-OK       TO  TRUE                            
                       END-IF                                                   
                    END-PERFORM                                                 
                    IF S1 > 15                                                  
                       MOVE 'ROA/LOI AMOUNT CANNOT HAVE MORE THAN 14 DEC        
      -                     'MAL POSITIONS' TO  M1ERRMSGO                       
                       MOVE -1              TO  M1RLAMTL                        
                       MOVE ATT-UNPROT-BRT-MDT TO M1RLAMTA                      
                    ELSE                                                        
                       IF WS-RL-AMT (S1 + 1) NOT NUMERIC OR                     
                          WS-RL-AMT (S1 + 2) NOT NUMERIC                        
                          MOVE 'ERROR IN ROA/LOI AMOUNT'                        
                                            TO  M1ERRMSGO                       
                          MOVE -1           TO  M1RLAMTL                        
                          MOVE ATT-UNPROT-BRT-MDT TO M1RLAMTA                   
                       ELSE                                                     
                          COMPUTE S2 = S1 + 3                                   
                          PERFORM VARYING S3 FROM S2 BY 1                       
                             UNTIL S3 > 17                                      
                             MOVE ' '       TO WS-RL-AMT (S3)                   
                          END-PERFORM                                           
                          MOVE S1           TO  ACAT1FIO-INT-COUNT              
                          MOVE WS-RL-AMT-TABLE TO  ACAT1FIO-ROA-LOI-AMT         
                          PERFORM LEFT-JUSTIFY-RL-AMT                           
                          MOVE WS-M1RLAMTI  TO  ACAT1FIO-ROA-LOI-AMT            
                                                M1RLAMTO                        
                       END-IF                                                   
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M1NAVI = LOW-VALUES                                               
              MOVE SPACES                TO  M1NAVI                             
           END-IF.                                                              
                                                                                
              IF M1NAVI = ('Y' OR 'N' OR ' ')                                   
                 MOVE M1NAVI             TO  ACAT1FIO-NAV-ACCT-IND              
              ELSE                                                              
                 MOVE 'NAV ACCOUNT INDICATOR SHOULD BE Y OR N OR BLANK'         
                                         TO  M1ERRMSGO                          
                 MOVE -1                 TO  M1NAVL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M1NAVA                             
              END-IF.                                                           
                                                                                
           SET LTCG-VALID                   TO  TRUE.                           
           IF M1LTCGI = SPACES OR LOW-VALUES                                    
              MOVE 'LTCG IS REQUIRED'    TO  M1ERRMSGO                          
              MOVE -1                    TO  M1LTCGL                            
              SET LTCG-INVALID           TO  TRUE                               
           ELSE                                                                 
              IF M1LTCGI = ('C' OR 'R')                                         
                 MOVE M1LTCGI            TO  ACAT1FIO-LTCG-CD                   
              ELSE                                                              
                 MOVE 'LTCG SHOULD BE C OR R'                                   
                                         TO  M1ERRMSGO                          
                 MOVE -1                 TO  M1LTCGL                            
                 MOVE ATT-UNPROT-BRT-MDT TO  M1LTCGA                            
                 SET LTCG-INVALID        TO  TRUE                               
              END-IF                                                            
           END-IF.                                                              
                                                                                
           SET STCG-VALID                   TO  TRUE.                           
           IF M1STCGI = SPACES OR LOW-VALUES                                    
              MOVE 'STCG IS REQUIRED'    TO  M1ERRMSGO                          
              MOVE -1                    TO  M1STCGL                            
              SET STCG-INVALID           TO  TRUE                               
           ELSE                                                                 
              IF M1STCGI = ('C' OR 'R')                                         
                 MOVE M1STCGI            TO  ACAT1FIO-STCG-CD                   
              ELSE                                                              
                 MOVE 'STCG SHOULD BE C OR R'                                   
                                         TO  M1ERRMSGO                          
                 MOVE -1                 TO  M1STCGL                            
                 MOVE ATT-UNPROT-BRT-MDT TO  M1STCGA                            
                 SET STCG-INVALID        TO  TRUE                               
              END-IF                                                            
           END-IF.                                                              
                                                                                
           SET DVDND-VALID                  TO  TRUE.                           
           IF M1DVDNDI = SPACES OR LOW-VALUES                                   
              MOVE 'DIVIDEND INDICATOR IS REQUIRED'                             
                                         TO  M1ERRMSGO                          
              MOVE -1                    TO  M1DVDNDL                           
              SET DVDND-INVALID          TO  TRUE                               
           ELSE                                                                 
              IF M1DVDNDI = ('C' OR 'R')                                        
                 MOVE M1DVDNDI              TO  ACAT1FIO-DVDND-CD               
              ELSE                                                              
                 MOVE 'DIVIDEND IDICATOR SHOULD BE C OR R'                      
                                         TO  M1ERRMSGO                          
                 MOVE -1                 TO  M1DVDNDL                           
                 MOVE ATT-UNPROT-BRT-MDT TO  M1DVDNDA                           
                 SET DVDND-INVALID       TO  TRUE                               
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       FORMAT-NA-LINES.                                                         
      *****************                                                         
                                                                                
           MOVE 0                           TO  S2.                             
                                                                                
           PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 6                          
              IF ACAT1FIO-NA-LINE (S1) = (SPACES OR LOW-VALUES)                 
                 CONTINUE                                                       
              ELSE                                                              
                 ADD 1                      TO  S2                              
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           IF S2 >= ACAT1FIO-NA-LINES-NBR                                       
              SET ACAT1FIO-DO-NOT-DELETE    TO  TRUE                            
              MOVE ZERO                     TO  ACAT1FIO-NA-LINES-DELETE        
           ELSE                                                                 
              SET ACAT1FIO-DELETE           TO  TRUE                            
              COMPUTE ACAT1FIO-NA-LINES-DELETE =   ACAT1FIO-NA-LINES-NBR        
                                                 - S2                           
           END-IF.                                                              
                                                                                
           MOVE S2                          TO  ACAT1FIO-NA-LINES-NBR.          
                                                                                
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
              WHEN EIBAID = DFHPF1                                              
                 INITIALIZE ACAT1FIO                                            
                 PERFORM FIRST-TIME-RTN                                         
              WHEN EIBAID = DFHPF2                                              
                 PERFORM XCTL-RECEIVER-REGISTRATION-2                           
              WHEN EIBAID = DFHPF3                                              
                 PERFORM XCTL-PIP-SWP                                           
              WHEN EIBAID = DFHPF4                                              
                 PERFORM XCTL-PAYABLES                                          
              WHEN OTHER                                                        
                 MOVE 'INVALID PF KEY'         TO  M1ERRMSGO                    
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *************                                                             
       LINK-TO-DB2.                                                             
      *************                                                             
                                                                                
           EXEC CICS LINK PROGRAM('ACAT1FDB')                                   
                         COMMAREA(ACAT1FIO-COMMAREA)                            
           END-EXEC.                                                            
                                                                                
           IF ACAT1FIO-DB2-BAD-RETURN                                           
              MOVE LOW-VALUES               TO  ACATF1MO                        
              MOVE ACAT1FIO-DB2-RETURN-CODE TO  ERR-BAD-DB2-CODE                
              MOVE ERR-BAD-DB2              TO  M1ERRMSGO                       
              IF FIRST-TIME                                                     
                 MOVE ACAT1FIO-DB2-RETURN-CODE TO WS-CODE                       
                 IF WS-CODE = 100                                               
                    MOVE 'THERE ARE NO FUND REGISTRATION ENTRIES IN THE         
      -                  'DATABASE YET'     TO  M1ERRMSGO                       
                    MOVE -1                 TO  M1BOOKL                         
                    MOVE ACAT1FIO-BRANCH    TO  M1BRCHO                         
                    MOVE ACAT1FIO-ACCOUNT   TO  M1ACCTO                         
                    MOVE ACAT1FIO-RR-NBR    TO  M1RRNBRO                        
                    MOVE ACAT1FIO-CUSIP     TO  M1SECO                          
                    MOVE ACAT1FIO-ACAT-CONTROL-NBR TO M1CNTLNO                  
                    SET MOVE-9              TO  TRUE                            
                 END-IF                                                         
                 PERFORM SEND-MAP-ERASE                                         
              ELSE                                                              
                 PERFORM SEND-MAP-DATAONLY                                      
              END-IF                                                            
              PERFORM RETURN-TO-CICS                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ******************************                                            
       XCTL-RECEIVER-REGISTRATION-2.                                            
      ******************************                                            
                                                                                
           PERFORM CLEAR-FIELDS.                                                
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF2'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT2FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           SET ACAT2FIO-FIRST-TIME          TO  TRUE.                           
           MOVE ACAT1FIO-NSCC-PEND-CD       TO  ACAT2FIO-NSCC-PEND-CD.          
           INITIALIZE ACAT2FIO.                                                 
           MOVE ACAT1FIO-TC                 TO  ACAT2FIO-TC.                    
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT2FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               REWRITE                                          
           END-EXEC.                                                            
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT2FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE ERR-ACAT2FSC                TO  M1ERRMSGO.                      
           MOVE -1                          TO  M1TRIDL.                        
                                                                                
           PERFORM SEND-MAP-DATAONLY.                                           
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      **************                                                            
       XCTL-PIP-SWP.                                                            
      **************                                                            
                                                                                
           PERFORM CLEAR-FIELDS.                                                
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF3'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT3FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           SET ACAT3FIO-FIRST-TIME          TO  TRUE.                           
           MOVE ACAT1FIO-NSCC-PEND-CD       TO  ACAT3FIO-NSCC-PEND-CD.          
           INITIALIZE ACAT3FIO.                                                 
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT3FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               REWRITE                                          
           END-EXEC.                                                            
                                                                                
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT3FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE ERR-ACAT3FSC                TO  M1ERRMSGO.                      
           MOVE -1                          TO  M1TRIDL.                        
                                                                                
           PERFORM SEND-MAP-DATAONLY.                                           
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ***************                                                           
       XCTL-PAYABLES.                                                           
      ***************                                                           
                                                                                
           PERFORM CLEAR-FIELDS.                                                
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF4'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT4FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           SET ACAT4FIO-FIRST-TIME          TO  TRUE.                           
           MOVE ACAT1FIO-NSCC-PEND-CD       TO  ACAT4FIO-NSCC-PEND-CD.          
           INITIALIZE ACAT4FIO.                                                 
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT4FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               REWRITE                                          
           END-EXEC.                                                            
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT4FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE ERR-ACAT4FSC                TO  M1ERRMSGO.                      
           MOVE -1                          TO  M1TRIDL.                        
                                                                                
           PERFORM SEND-MAP-DATAONLY.                                           
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ****************                                                          
       PREPARE-FIELDS.                                                          
      ****************                                                          
                                                                                
           MOVE ATT-UNPROT-MDT              TO  M1BOOKA                         
                                                M1LEVELA                        
                                                M1DVDNDA                        
                                                M1STCGA                         
                                                M1LTCGA                         
                                                M1BROVA                         
                                                M1NAVA                          
                                                M1ROALOIA                       
                                                M1RLAMTA                        
                                                M1LOIDATA                       
                                                M1SOCIALA                       
                                                M1STATEA                        
                                                M1SSNBRA                        
                                                M1SSTINA                        
                                                M1NRAPCA                        
                                                M1OLDACCA                       
                                                M1PAYINDA                       
      *                                         M1PBLNBRA                       
                                                M1CHCKPRA                       
                                                M1TINAMEA                       
                                                M1NA1A                          
                                                M1ZIP5A                         
                                                M1ZIP4A                         
                                                M1NA2A                          
                                                M1RELACCA                       
                                                M1BFCODEA                       
                                                M1NA3A                          
                                                M1RELSECA                       
                                                M1NA4A                          
                                                M1NA5A                          
                                                M1NA6A                          
                                                M1FUNDA.                        
                                                                                
                                                                                
           EJECT                                                                
      **************                                                            
       CLEAR-FIELDS.                                                            
      **************                                                            
                                                                                
           MOVE SPACES                      TO  M1CNTLNO                        
                                                M1DELBKRO                       
                                                M1EXBKRO                        
                                                M1BOOKO                         
                                                M1BRCHO                         
                                                M1ACCTO                         
                                                M1TCO                           
                                                M1SECO                          
                                                M1RRNBRO                        
                                                M1RRNAMEO                       
                                                M1LEVELO                        
                                                M1DVDNDO                        
                                                M1STCGO                         
                                                M1LTCGO                         
                                                M1IRAO                          
                                                M1BROVO                         
                                                M1NAVO                          
                                                M1IRAO                          
                                                M1ROALOIO                       
      *                                         M1RLAMTO                        
                                                M1LOIDATO                       
                                                M1SOCIALO                       
                                                M1STATEO                        
                                                M1SSNBRO                        
                                                M1SSTINO                        
                                                M1WTHTAXO                       
                                                M1NRAPCO                        
                                                M1OLDACCO                       
                                                M1PAYINDO                       
                                                M1PBLNBRO                       
                                                M1CHCKPRO                       
                                                M1TINAMEO                       
                                                M1NA1O                          
                                                M1ZIP5O                         
                                                M1ZIP4O                         
                                                M1NA2O                          
                                                M1RELACCO                       
                                                M1BFCODEO                       
                                                M1NA3O                          
                                                M1RELSECO                       
                                                M1NA4O                          
                                                M1NA5O                          
                                                M1NA6O                          
                                                M1FUNDO                         
                                                M1ERRMSGO.                      
           MOVE ZEROES                      TO  M1RLAMTO.                       
           PERFORM PROTECT-ALL-FIELDS.                                          
                                                                                
           EJECT                                                                
      ********************                                                      
       PROTECT-ALL-FIELDS.                                                      
      ********************                                                      
                                                                                
           MOVE ATT-PROT                    TO  M1CNTLNA                        
                                                M1DELBKRA                       
                                                M1EXBKRA                        
                                                M1BOOKA                         
                                                M1BRCHA                         
                                                M1ACCTA                         
                                                M1TCA                           
                                                M1SECA                          
                                                M1RRNBRA                        
                                                M1RRNAMEA                       
                                                M1LEVELA                        
                                                M1DVDNDA                        
                                                M1STCGA                         
                                                M1LTCGA                         
                                                M1BROVA                         
DJ0001                                          M1IRAA                          
                                                M1NAVA                          
                                                M1ROALOIA                       
                                                M1RLAMTA                        
                                                M1LOIDATA                       
                                                M1SOCIALA                       
                                                M1STATEA                        
                                                M1SSNBRA                        
                                                M1SSTINA                        
                                                M1WTHTAXA                       
                                                M1NRAPCA                        
                                                M1OLDACCA                       
                                                M1PAYINDA                       
                                                M1PBLNBRA                       
                                                M1CHCKPRA                       
                                                M1TINAMEA                       
                                                M1NA1A                          
                                                M1ZIP5A                         
                                                M1ZIP4A                         
                                                M1NA2A                          
                                                M1RELACCA                       
                                                M1BFCODEA                       
                                                M1NA3A                          
                                                M1RELSECA                       
                                                M1NA4A                          
                                                M1NA5A                          
                                                M1NA6A                          
                                                M1FUNDA.                        
                                                                                
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
      *************************                                                 
       WRITE-ACAT1FIO-COMMAREA.                                                 
      *************************                                                 
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF1'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT1FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               REWRITE                                          
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *****************                                                         
       DELETE-ALL-TSQS.                                                         
      *****************                                                         
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           MOVE 'AXB1'                      TO  TRAN-ID.                        
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
                                                                                
           MOVE 'AMF1'                      TO  TRAN-ID.                        
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
                                                                                
           MOVE 'AMF2'                      TO  TRAN-ID.                        
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
                                                                                
           MOVE 'AMF3'                      TO  TRAN-ID.                        
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
                                                                                
           MOVE 'AMF4'                      TO  TRAN-ID.                        
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ********************                                                      
       RETURN-CONTROL-RTN.                                                      
      ********************                                                      
                                                                                
           PERFORM SEND-CONTROL-ERASE.                                          
                                                                                
           PERFORM DELETE-ALL-TSQS.                                             
                                                                                
           MOVE '0'                         TO  ACAT-AMFX-PROG-CODE.            
                                                                                
           EXEC CICS XCTL PROGRAM ('RATT01')                                    
           END-EXEC.                                                            
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ****************                                                          
       RETURN-TO-CICS.                                                          
      ****************                                                          
                                                                                
           IF MOVE-1                                                            
              MOVE '1'                      TO  ACAT-AMFX-PROG-CODE             
           ELSE                                                                 
              MOVE '9'                      TO  ACAT-AMFX-PROG-CODE             
           END-IF.                                                              
                                                                                
           PERFORM WRITE-ACAT1FIO-COMMAREA.                                     
                                                                                
           EXEC CICS RETURN                                                     
                     TRANSID('AMFX')                                            
                     COMMAREA(ACATCOMM-COMMAREA)                                
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ************************                                                  
       RETURN-CONTROL-TO-MAIN.                                                  
      ************************                                                  
                                                                                
                                                                                
           PERFORM SEND-CONTROL-ERASE.                                          
                                                                                
           PERFORM DELETE-ALL-TSQS.                                             
                                                                                
           MOVE '0'                         TO  ACAT-AMFX-PROG-CODE.            
                                                                                
LRM003     IF ACAT1FIO-CALL-RTN-PROGRAM = 'ACAT05RN'                            
LRM003        EXEC CICS XCTL PROGRAM('ACAT05RN')                                
LRM003                       COMMAREA(ACATCOMM-COMMAREA)                        
LRM003        END-EXEC                                                          
LRM003     ELSE                                                                 
           EXEC CICS XCTL PROGRAM('ACAT04RS')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE 'PROGRAM ACAT04RS IS NOT AVAILABLE'                             
                                            TO  M1ERRMSGO.                      
           MOVE -1                          TO  M1TRIDL.                        
           PERFORM SEND-MAP-ERASE.                                              
           PERFORM RETURN-TO-CICS.                                              
                                                                                
      *    EXEC CICS RETURN                                                     
      *              TRANSID('ACAX')                                            
      *              COMMAREA(ACATCOMM-COMMAREA)                                
      *    END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ***********                                                               
       HANG-CICS.                                                               
      ***********                                                               
                                                                                
           GOBACK.                                                              
                                                                                
