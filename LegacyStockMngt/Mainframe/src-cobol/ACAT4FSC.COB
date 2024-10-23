000001* PDX    - ACAT4FSC C0263391 04/11/08 13:36:21 TBLAMUR            00001000
LRM004* SSR# 55766 ASCENDIS INTERFACE. ALLOW UPDATE FOR ASCENDIS USER,          
LRM004* WHEN HE WOULD HAVE HAD UPDATE AUTH BASED ON SNON IF NOT ASCEND.         
000001* PDX    - ACAT4FSC C0240631 11/14/06 10:43:22 TBLAMUR            00001000
000001* PDX    - ACAT4FSC C0214488 12/08/04 12:00:30 TBLAMUR            00001000
LRM003* SSR 0039884 ALLOW LINK FROM E SCREEN AND RTN TO CALLER.                 
000001* PDX    - ACAT4FSC C0151771 02/23/01 11:18:50 TBDOJUN            00001000
000001* PDX    - ACAT4FSC C0120352 01/25/99 12:02:32 TBTARYB            00001000
000001* PDX    - ACAT4FSC C0119770 12/28/98 12:48:37 TBTARYB            00001000
000001* PDX    - ACAT4FSC C0118708 12/24/98 13:59:02 TBTARYB            00001000
000001* PDX    - ACAT4FSC C0113942 11/11/98 14:03:44 TBTARYB            00001000
000001* PDX    - ACAT4FSC C0117820 11/06/98 15:21:50 TBTARYB            00001000
000001* PDX    - ACAT4FSC C0113942 10/30/98 13:43:42 TBTARYB            00001000
      ******************************************************************        
       IDENTIFICATION DIVISION.                                                 
      ******************************************************************        
       PROGRAM-ID.    ACAT4FSC.                                                 
                                                                                
      *REMARKS.                                                                 
      ******************************************************************        
      * FUND/SERV: PORGRAM (XCTL'ED BY ACAT01FCP) DISPLAYS             *        
      *      -  "PAYABLES" SCREEN.                                     *        
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
       77  TWA-SIZE                         PIC S9(4) COMP.                     
       77  FIRST-TIME-SW                    PIC  X(01).                         
           88  FIRST-TIME                              VALUE 'Y'.               
           88  NOT-FIRST-TIME                          VALUE 'N'.               
       77  S1                               PIC  9(01)  VALUE 0.                
       77  S2                               PIC  9(01)  VALUE 0.                
       77  S3                               PIC  9(01)  VALUE 0.                
       77  SUB1                             PIC  9(01)  VALUE 0.                
       77  SUB2                             PIC  9(01)  VALUE 0.                
       77  STOP-SW                          PIC  X(01).                         
           88  STOP-OK                                  VALUE 'Y'.              
           88  STOP-NOT-OK                              VALUE 'N'.              
       77  WS-NUMBER                        PIC  9(02)  VALUE 0.                
       77  WS-DELETE-LIT                    PIC  X(20)  VALUE                   
           '--------------------'.                                              
       77  VALIDATION-SW                    PIC  X(01).                         
           88  VALIDATION-YES                           VALUE 'Y'.              
           88  VALIDATION-NO                            VALUE 'N'.              
                                                                                
       01  WS-TSQ-AREA.                                                         
           05  WS-TS-NAME.                                                      
               10 TERM-ID                   PIC  X(04).                         
               10 TRAN-ID                   PIC  X(04).                         
               10 ITEM-NUMBER               PIC S9(04)  COMP VALUE +1.          
            COPY ACAT0FIO.                                                      
                                                                                
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
                                                                                
       01  ERROR-MESSAGES.                                                      
           05  ERR-YES-NO                   PIC  X(78)  VALUE                   
               'SHOULD BE Y OR N ONLY'.                                         
           05  ERR-NUMERIC                  PIC  X(78)  VALUE                   
               'SHOULD CONTAIN ONLY NUMBERS'.                                   
           05  ERROR-MSG-1                  PIC  X(78)  VALUE                   
               'MARK WITH X EITHER ONE OF THESE FIELDS'.                        
           05  ERROR-MSG-2                  PIC  X(78)  VALUE                   
               'ONLY ONE CAN BE SELECTED'.                                      
           05  ERR-BAD-DB2.                                                     
               10  FILLER                   PIC  X(26)  VALUE                   
                   'DB2 FAILED WITH SQLCODE = '.                                
               10  ERR-BAD-DB2-CODE         PIC  -999.                          
           05  ERR-ACAT1FSC                 PIC  X(78)  VALUE                   
               'PROGRAM ACAT1FSC IS NOT AVAILABLE'.                             
           05  ERR-ACAT2FSC                 PIC  X(78)  VALUE                   
               'PROGRAM ACAT2FSC IS NOT AVAILABLE'.                             
           05  ERR-ACAT3FSC                 PIC  X(78)  VALUE                   
               'PROGRAM ACAT3FSC IS NOT AVAILABLE'.                             
                                                                                
           EJECT                                                                
       01  MSD-WORK-AREA.                                                       
           COPY MSDCOMC.                                                        
                                                                                
           EJECT                                                                
           COPY ACATF4M.                                                        
                                                                                
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
                                                                                
           EJECT                                                                
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
                                                                                
           IF TWA-SIZE = 0                                                      
              MOVE LOW-VALUES               TO  ACATF4MO                        
              MOVE 'TWA SIZE EQUAL ZERO - PROGRAM CANNOT FUNCTION'              
                                            TO  M4ERRMSGO                       
              PERFORM WRITE-ACAT4FIO-COMMAREA                                   
              PERFORM SEND-MAP-ERASE                                            
              PERFORM RETURN-TO-CICS                                            
           END-IF.                                                              
                                                                                
           EXEC CICS                                                            
              ADDRESS TWA(ADDRESS OF TWA-AREA)                                  
           END-EXEC.                                                            
                                                                                
           MOVE DFHCOMMAREA                 TO  ACATCOMM-COMMAREA.              
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF4'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT4FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *****************                                                         
       MAIN-PROCESSING.                                                         
      *****************                                                         
                                                                                
      *    IF  ACAT-PROGRAM-NAME = 'ACAT4FSC'                                   
      *        MOVE SPACES                  TO  ACAT-CALLING-PROG-NAME          
      *        PERFORM CONTINUE-PROCESSESING                                    
      *    ELSE                                                                 
      *        MOVE 'ACAT4FSC'              TO  ACAT-PROGRAM-NAME               
      *        PERFORM FIRST-TIME-RTN                                           
      *    END-IF.                                                              
                                                                                
           IF ACAT4FIO-FIRST-TIME                                               
              PERFORM FIRST-TIME-RTN                                            
           ELSE                                                                 
              PERFORM RECEIVE-MAP                                               
              EVALUATE ACAT4FIO-NSCC-PEND-CD                                    
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
           PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 6                          
              MOVE ZEROES          TO ACAT4FIO-NA-CNTR (S1)                     
                                      ACAT4FIO-PYBL-NA-LINE-CNTR (S1)           
           END-PERFORM.                                                         
           SET ACAT4FIO-NOT-FIRST-TIME      TO  TRUE.                           
           SET ACAT4FIO-READ-DATABASE       TO  TRUE.                           
           SET ACAT4FIO-ACTION-NONE         TO  TRUE.                           
           MOVE +1                          TO  ACAT4FIO-PAGE-NBR.              
                                                                                
           PERFORM LINK-TO-DB2.                                                 
                                                                                
           IF ACAT4FIO-PYBL-QTY = 0                                             
              PERFORM CLEAR-PYBL-1                                              
              PERFORM CLEAR-PYBL-2                                              
              PERFORM DARK-PYBL-1                                               
              PERFORM DARK-PYBL-2                                               
              EVALUATE ACAT4FIO-NSCC-PEND-CD                                    
                 WHEN 'Y'                                                       
                    MOVE 'NO PAYABLES FOUND. RECORD WAS SENT TO NSCC - N        
      -                  'O UPDATES AT THIS TIME'                               
                                            TO  M4ERRMSGO                       
                    MOVE -1                 TO  M4TRIDL                         
                 WHEN 'A'                                                       
                    MOVE 'NO PAYABLES. RECORD ACKNOWLEGED BY NSCC - UPDA        
      -                  'TES WILL CAUSE RETRANSMITSSION'                       
                                            TO  M4ERRMSGO                       
                    MOVE -1                 TO  M4TRIDL                         
                 WHEN OTHER                                                     
                    MOVE 'THERE ARE NO PAYABLES IN THE DATABASE'                
                                            TO  M4ERRMSGO                       
                    MOVE -1                 TO  M4TRIDL                         
              END-EVALUATE                                                      
           ELSE                                                                 
              PERFORM FORMAT-MAP-OUTPUT                                         
              EVALUATE ACAT4FIO-NSCC-PEND-CD                                    
                 WHEN 'Y'                                                       
                    PERFORM PROTECT-PYBL1                                       
                    IF ACAT4FIO-PYBL-QTY > 1                                    
                       PERFORM PROTECT-PYBL2                                    
                    END-IF                                                      
                    MOVE 'NO PAYABLES FOUND. RECORD WAS SENT TO NSCC - N        
      -                  'O UPDATES AT THIS TIME'                               
                                            TO  M4ERRMSGO                       
                 WHEN 'A'                                                       
                    MOVE 'RECORD WAS ACKNOWLEGED BY NSCC - UPDATES WILL         
      -                  'CAUSE RETRANSMITSSION'                                
                                            TO  M4ERRMSGO                       
                 WHEN OTHER                                                     
                    CONTINUE                                                    
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
                                                                                
           SET NOT-FIRST-TIME               TO  TRUE.                           
                                                                                
           MOVE 'UNDO CHANGES:'             TO  M4LITERO.                       
                                                                                
DJ0001     IF  ACAT-SIGN-ON-UPDATE                                              
LRM004     OR  ACAT-SIGN-ON-ASCENDIS-RSTRCT                                     
DJ0001         CONTINUE                                                         
DJ0001     ELSE                                                                 
DJ0001         PERFORM PROTECT-PYBL1                                            
DJ0001         IF  ACAT4FIO-PYBL-QTY > 1                                        
DJ0001             PERFORM PROTECT-PYBL2                                        
DJ0001         END-IF                                                           
DJ0001         MOVE '(BROWSE ONLY)'         TO  M4LITERO                        
DJ0001         MOVE ATT-PROT                TO  M4VALUEA                        
DJ0001     END-IF.                                                              
                                                                                
           PERFORM SEND-MAP-ERASE.                                              
                                                                                
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       FORMAT-MAP-OUTPUT.                                                       
      *******************                                                       
                                                                                
           INITIALIZE ACATF4MO.                                                 
                                                                                
           PERFORM PREPARE-PYBL-1.                                              
           PERFORM INITIALIZE-OPTIONS-1.                                        
           PERFORM FORMAT-PYBL-1.                                               
                                                                                
           COMPUTE S1 = ACAT4FIO-PAGE-NBR * 2.                                  
           COMPUTE S2 = ACAT4FIO-PAGE-NBR * 2 - 1.                              
           IF S1 <= ACAT4FIO-PYBL-QTY AND > S2                                  
              PERFORM PREPARE-PYBL-2                                            
              PERFORM INITIALIZE-OPTIONS-2                                      
              PERFORM FORMAT-PYBL-2                                             
           ELSE                                                                 
              PERFORM CLEAR-PYBL-2                                              
              PERFORM DARK-PYBL-2                                               
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ***************                                                           
       FORMAT-PYBL-1.                                                           
      ***************                                                           
                                                                                
           INITIALIZE ACATF4MO.                                                 
                                                                                
           COMPUTE S1 = ACAT4FIO-PAGE-NBR * 2 - 1.                              
                                                                                
           MOVE -1                          TO  M4ACCT1L.                       
                                                                                
           MOVE 'PAYABLE'                   TO  M4PBLL1O.                       
           MOVE S1                          TO  M4PBLN1O.                       
                                                                                
           MOVE 'ACCT #:'                   TO  M4ACCTL1O.                      
           MOVE ACAT4FIO-ACCT-NBR (S1)      TO  M4ACCT1O                        
                                                ACAT4FIO-M4ACCT1.               
                                                                                
           MOVE 'B/F:'                      TO  M4BFL1O.                        
           EVALUATE ACAT4FIO-ACCT-PYBL-CD (S1)                                  
              WHEN '1'                                                          
                 MOVE 'F'                   TO  M4BF1O                          
                                                ACAT4FIO-M4BF1                  
              WHEN '2'                                                          
                 MOVE 'B'                   TO  M4BF1O                          
                                                ACAT4FIO-M4BF1                  
           END-EVALUATE.                                                        
                                                                                
           MOVE 'OPT: DIV   SWP   PAC   XFR   ALT'                              
                                            TO  M4OPTL1O.                       
      *    MOVE '(X/D)'                     TO  M4OPTM1O.                       
           IF ACAT4FIO-ADDRS-DVDND-IND (S1) = 'Y'                               
              MOVE 'X'                      TO  M4DIV1O                         
                                                ACAT4FIO-M4DIV1                 
           ELSE                                                                 
              MOVE '_'                      TO  M4DIV1O                         
                                                ACAT4FIO-M4DIV1                 
           END-IF.                                                              
           IF ACAT4FIO-ADDRS-SYSWL-IND (S1) = 'Y'                               
              MOVE 'X'                      TO  M4SWP1O                         
                                                ACAT4FIO-M4SWP1                 
           ELSE                                                                 
              MOVE '_'                      TO  M4SWP1O                         
                                                ACAT4FIO-M4SWP1                 
           END-IF.                                                              
           IF ACAT4FIO-ADDRS-ATMDF-IND (S1) = 'Y'                               
              MOVE 'X'                      TO  M4PAC1O                         
                                                ACAT4FIO-M4PAC1                 
           ELSE                                                                 
              MOVE '_'                      TO  M4PAC1O                         
                                                ACAT4FIO-M4PAC1                 
           END-IF.                                                              
           IF ACAT4FIO-CRSS-FND-RNVST-IND (S1) = 'Y'                            
              MOVE 'X'                      TO  M4XFR1O                         
                                                ACAT4FIO-M4XFR1                 
           ELSE                                                                 
              MOVE '_'                      TO  M4XFR1O                         
                                                ACAT4FIO-M4XFR1                 
           END-IF.                                                              
           IF ACAT4FIO-ALTNT-PYBL-IND (S1) = 'Y'                                
              MOVE 'X'                      TO  M4ALT1O                         
                                                ACAT4FIO-M4ALT1                 
           ELSE                                                                 
              MOVE '_'                      TO  M4ALT1O                         
                                                ACAT4FIO-M4ALT1                 
           END-IF.                                                              
                                                                                
           MOVE 'SYM/CUSIP:'                TO  M4CUSL1O.                       
           MOVE ACAT4FIO-PYBL-SEC-ISSUE-CD (S1)                                 
                                            TO  M4CUSIP1O                       
                                                ACAT4FIO-M4CUSIP1.              
                                                                                
           MOVE 'ALT IND:'                  TO  M4ALTIL1O.                      
           EVALUATE ACAT4FIO-PYBL-ALTNT-CD (S1)                                 
              WHEN '0'                                                          
                 MOVE 'N'                   TO  M4ALTI1O                        
                                                ACAT4FIO-M4ALTI1                
              WHEN '1'                                                          
                 MOVE 'B'                   TO  M4ALTI1O                        
                                                ACAT4FIO-M4ALTI1                
              WHEN '2'                                                          
                 MOVE 'O'                   TO  M4ALTI1O                        
                                                ACAT4FIO-M4ALTI1                
           END-EVALUATE.                                                        
                                                                                
           MOVE 'RSN:'                      TO  M4RSNL1O.                       
           MOVE ACAT4FIO-PYBL-ALTNT-RSN-TXT (S1)                                
                                            TO  M4RSN1O                         
                                                ACAT4FIO-M4RSN1.                
                                                                                
           MOVE 'NAME AND ADDRESS'          TO  M4NAL1O.                        
                                                                                
           EVALUATE ACAT4FIO-PYBL-NA-LINE-CNTR (S1)                             
              WHEN 0                                                            
                 CONTINUE                                                       
              WHEN 1                                                            
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 1)                             
                                            TO  M4NA1L1O                        
                                                ACAT4FIO-M4NA1L1                
              WHEN 2                                                            
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 1)                             
                                            TO  M4NA1L1O                        
                                                ACAT4FIO-M4NA1L1                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 2)                             
                                            TO  M4NA1L2O                        
                                                ACAT4FIO-M4NA1L2                
              WHEN 3                                                            
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 1)                             
                                            TO  M4NA1L1O                        
                                                ACAT4FIO-M4NA1L1                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 2)                             
                                            TO  M4NA1L2O                        
                                                ACAT4FIO-M4NA1L2                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 3)                             
                                            TO  M4NA1L3O                        
                                                ACAT4FIO-M4NA1L3                
              WHEN 4                                                            
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 1)                             
                                            TO  M4NA1L1O                        
                                                ACAT4FIO-M4NA1L1                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 2)                             
                                            TO  M4NA1L2O                        
                                                ACAT4FIO-M4NA1L2                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 3)                             
                                            TO  M4NA1L3O                        
                                                ACAT4FIO-M4NA1L3                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 4)                             
                                            TO  M4NA1L4O                        
                                                ACAT4FIO-M4NA1L4                
              WHEN 5                                                            
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 1)                             
                                            TO  M4NA1L1O                        
                                                ACAT4FIO-M4NA1L1                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 2)                             
                                            TO  M4NA1L2O                        
                                                ACAT4FIO-M4NA1L2                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 3)                             
                                            TO  M4NA1L3O                        
                                                ACAT4FIO-M4NA1L3                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 4)                             
                                            TO  M4NA1L4O                        
                                                ACAT4FIO-M4NA1L4                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 5)                             
                                            TO  M4NA1L5O                        
                                                ACAT4FIO-M4NA1L5                
              WHEN 6                                                            
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 1)                             
                                            TO  M4NA1L1O                        
                                                ACAT4FIO-M4NA1L1                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 2)                             
                                            TO  M4NA1L2O                        
                                                ACAT4FIO-M4NA1L2                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 3)                             
                                            TO  M4NA1L3O                        
                                                ACAT4FIO-M4NA1L3                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 4)                             
                                            TO  M4NA1L4O                        
                                                ACAT4FIO-M4NA1L4                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 5)                             
                                            TO  M4NA1L5O                        
                                                ACAT4FIO-M4NA1L5                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 6)                             
                                            TO  M4NA1L6O                        
                                                ACAT4FIO-M4NA1L6                
           END-EVALUATE.                                                        
                                                                                
           MOVE 'ZIP CODE:'                 TO  M4ZIPL1O.                       
           MOVE ACAT4FIO-ZIP5-CD (S1)       TO  M4ZIP1O                         
                                                ACAT4FIO-M4ZIP1.                
                                                                                
           MOVE 'UNDO CHANGES:'             TO  M4LITERO.                       
           MOVE ' '                         TO  M4VALUEO.                       
                                                                                
           EJECT                                                                
      ***************                                                           
       FORMAT-PYBL-2.                                                           
      ***************                                                           
                                                                                
           COMPUTE S1 = ACAT4FIO-PAGE-NBR * 2.                                  
                                                                                
           MOVE -1                          TO  M4ACCT2L.                       
                                                                                
           MOVE 'PAYABLE'                   TO  M4PBLL2O.                       
           MOVE S1                          TO  M4PBLN2O.                       
                                                                                
           MOVE 'ACCT #:'                   TO  M4ACCTL2O.                      
           MOVE ACAT4FIO-ACCT-NBR (S1)      TO  M4ACCT2O                        
                                                ACAT4FIO-M4ACCT2.               
                                                                                
           MOVE 'B/F:'                      TO  M4BFL2O.                        
           EVALUATE ACAT4FIO-ACCT-PYBL-CD (S1)                                  
              WHEN '1'                                                          
                 MOVE 'F'                   TO  M4BF2O                          
                                                ACAT4FIO-M4BF2                  
              WHEN '2'                                                          
                 MOVE 'B'                   TO  M4BF2O                          
                                                ACAT4FIO-M4BF2                  
           END-EVALUATE.                                                        
                                                                                
           MOVE 'OPT: DIV   SWP   PAC   XFR   ALT'                              
                                            TO  M4OPTL2O.                       
      *    MOVE '(X/D)'                     TO  M4OPTM2O.                       
           IF ACAT4FIO-ADDRS-DVDND-IND (S1) = 'Y'                               
              MOVE 'X'                      TO  M4DIV2O                         
                                                ACAT4FIO-M4DIV2                 
           ELSE                                                                 
              MOVE '_'                      TO  M4DIV2O                         
                                                ACAT4FIO-M4DIV2                 
           END-IF.                                                              
           IF ACAT4FIO-ADDRS-SYSWL-IND (S1) = 'Y'                               
              MOVE 'X'                      TO  M4SWP2O                         
                                                ACAT4FIO-M4SWP2                 
           ELSE                                                                 
              MOVE '_'                      TO  M4SWP2O                         
                                                ACAT4FIO-M4SWP2                 
           END-IF.                                                              
           IF ACAT4FIO-ADDRS-ATMDF-IND (S1) = 'Y'                               
              MOVE 'X'                      TO  M4PAC2O                         
                                                ACAT4FIO-M4PAC2                 
           ELSE                                                                 
              MOVE '_'                      TO  M4PAC2O                         
                                                ACAT4FIO-M4PAC2                 
           END-IF.                                                              
           IF ACAT4FIO-CRSS-FND-RNVST-IND (S1) = 'Y'                            
              MOVE 'X'                      TO  M4XFR2O                         
                                                ACAT4FIO-M4XFR2                 
           ELSE                                                                 
              MOVE '_'                      TO  M4XFR2O                         
                                                ACAT4FIO-M4XFR2                 
           END-IF.                                                              
           IF ACAT4FIO-ALTNT-PYBL-IND (S1) = 'Y'                                
              MOVE 'X'                      TO  M4ALT2O                         
                                                ACAT4FIO-M4ALT2                 
           ELSE                                                                 
              MOVE '_'                      TO  M4ALT2O                         
                                                ACAT4FIO-M4ALT2                 
           END-IF.                                                              
                                                                                
           MOVE 'SYM/CUSIP:'                TO  M4CUSL2O.                       
           MOVE ACAT4FIO-PYBL-SEC-ISSUE-CD (S1)                                 
                                            TO M4CUSIP2O                        
                                               ACAT4FIO-M4CUSIP2.               
                                                                                
           MOVE 'ALT IND:'                  TO  M4ALTIL2O.                      
           EVALUATE ACAT4FIO-PYBL-ALTNT-CD (S1)                                 
              WHEN '0'                                                          
                 MOVE 'N'                   TO  M4ALTI2O                        
                                                ACAT4FIO-M4ALTI2                
              WHEN '1'                                                          
                 MOVE 'B'                   TO  M4ALTI2O                        
                                                ACAT4FIO-M4ALTI2                
              WHEN '2'                                                          
                 MOVE 'O'                   TO  M4ALTI2O                        
                                                ACAT4FIO-M4ALTI2                
           END-EVALUATE.                                                        
                                                                                
           MOVE 'RSN:'                      TO  M4RSNL2O.                       
           MOVE ACAT4FIO-PYBL-ALTNT-RSN-TXT (S1)                                
                                            TO  M4RSN2O                         
                                                ACAT4FIO-M4RSN2.                
                                                                                
           MOVE 'NAME AND ADDRESS'          TO  M4NAL2O.                        
                                                                                
           EVALUATE ACAT4FIO-PYBL-NA-LINE-CNTR (S1)                             
              WHEN 0                                                            
                 CONTINUE                                                       
              WHEN 1                                                            
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 1)                             
                                            TO  M4NA2L1O                        
                                                ACAT4FIO-M4NA2L1                
              WHEN 2                                                            
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 1)                             
                                            TO  M4NA2L1O                        
                                                ACAT4FIO-M4NA2L1                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 2)                             
                                            TO  M4NA2L2O                        
                                                ACAT4FIO-M4NA2L2                
              WHEN 3                                                            
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 1)                             
                                            TO  M4NA2L1O                        
                                                ACAT4FIO-M4NA2L1                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 2)                             
                                            TO  M4NA2L2O                        
                                                ACAT4FIO-M4NA2L2                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 3)                             
                                            TO  M4NA2L3O                        
                                                ACAT4FIO-M4NA2L3                
              WHEN 4                                                            
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 1)                             
                                            TO  M4NA2L1O                        
                                                ACAT4FIO-M4NA2L1                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 2)                             
                                            TO  M4NA2L2O                        
                                                ACAT4FIO-M4NA2L2                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 3)                             
                                            TO  M4NA2L3O                        
                                                ACAT4FIO-M4NA2L3                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 4)                             
                                            TO  M4NA2L4O                        
                                                ACAT4FIO-M4NA2L4                
              WHEN 5                                                            
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 1)                             
                                            TO  M4NA2L1O                        
                                                ACAT4FIO-M4NA2L1                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 2)                             
                                            TO  M4NA2L2O                        
                                                ACAT4FIO-M4NA2L2                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 3)                             
                                            TO  M4NA2L3O                        
                                                ACAT4FIO-M4NA2L3                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 4)                             
                                            TO  M4NA2L4O                        
                                                ACAT4FIO-M4NA2L4                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 5)                             
                                            TO  M4NA2L5O                        
                                                ACAT4FIO-M4NA2L5                
              WHEN 6                                                            
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 1)                             
                                            TO  M4NA2L1O                        
                                                ACAT4FIO-M4NA2L1                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 2)                             
                                            TO  M4NA2L2O                        
                                                ACAT4FIO-M4NA2L2                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 3)                             
                                            TO  M4NA2L3O                        
                                                ACAT4FIO-M4NA2L3                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 4)                             
                                            TO  M4NA2L4O                        
                                                ACAT4FIO-M4NA2L4                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 5)                             
                                            TO  M4NA2L5O                        
                                                ACAT4FIO-M4NA2L5                
                 MOVE ACAT4FIO-PYBL-NA-LINE (S1, 6)                             
                                            TO  M4NA2L6O                        
                                                ACAT4FIO-M4NA2L6                
           END-EVALUATE.                                                        
                                                                                
           MOVE 'ZIP CODE:'                 TO  M4ZIPL2O.                       
           MOVE ACAT4FIO-ZIP5-CD (S1)       TO  M4ZIP2O                         
                                                ACAT4FIO-M4ZIP2.                
                                                                                
           MOVE 'UNDO CHANGES:'             TO  M4LITERO.                       
           MOVE ' '                         TO  M4VALUEO.                       
                                                                                
           EJECT                                                                
      ******************                                                        
       BASIC-PROCESSING.                                                        
      ******************                                                        
                                                                                
           IF M4LITERI = 'UNDO CHANGES:'                                        
              PERFORM CHECK-FOR-UPDATES                                         
              IF ACAT4FIO-UPDATE-DATABASE                                       
                 PERFORM UNDO-CHANGES-VALIDATION                                
                 IF M4VALUEI = ' '                                              
                    PERFORM DATA-VALIDATION                                     
                    IF M4ERRMSGO = SPACES OR LOW-VALUES                         
                       IF EIBAID = DFHENTER                                     
                          PERFORM XCTL-RTN                                      
                       ELSE                                                     
                          MOVE '     CONFIRM:' TO  M4LITERO                     
                          MOVE -1              TO  M4VALUEL                     
                          MOVE 'YOU ARE ABOUT TO UPDATE THE DATABASE - P        
      -                     'LEASE CONFIRM WITH Y, OR REJECT WITH N'            
                                            TO  M4ERRMSGO                       
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
                    MOVE ' '               TO  M4VALUEO                         
                    IF ACAT4FIO-PYBL-QTY > 0                                    
                       PERFORM PREPARE-PYBL-1                                   
                       IF (ACAT4FIO-PAGE-NBR * 2) <= ACAT4FIO-PYBL-QTY          
                          PERFORM PREPARE-PYBL-2                                
                       ELSE                                                     
                          PERFORM DARK-PYBL-2                                   
                       END-IF                                                   
                       MOVE SPACES          TO  M4ERRMSGO                       
                    ELSE                                                        
                       PERFORM DARK-PYBL-1                                      
                       PERFORM DARK-PYBL-2                                      
                       MOVE 'THERE ARE NO PAYABLES IN THE DATABASE'             
                                            TO  M4ERRMSGO                       
                    END-IF                                                      
                 END-IF                                                         
                 PERFORM XCTL-RTN                                               
              END-IF                                                            
           ELSE                                                                 
              IF M4LITERI = '     CONFIRM:'                                     
                 PERFORM CONFIRMATION-VALIDATION                                
                 IF M4VALUEI = 'Y'                                              
                    IF ACAT4FIO-NSCC-PEND-CD = 'A'                              
                       MOVE ' '             TO  ACAT4FIO-NSCC-PEND-CD           
                    END-IF                                                      
                    IF EIBAID NOT = DFHPF6                                      
                       PERFORM LINK-TO-DB2                                      
                       PERFORM FORMAT-MAP-OUTPUT                                
                    END-IF                                                      
                 ELSE                                                           
                    IF EIBAID = DFHENTER                                        
                       PERFORM FIRST-TIME-RTN                                   
                    END-IF                                                      
                 END-IF                                                         
                 MOVE 'UNDO CHANGES:'       TO  M4LITERO                        
                 MOVE ' '                   TO  M4VALUEO                        
                                                M4ERRMSGO                       
                 PERFORM XCTL-RTN                                               
              ELSE                                                              
                 PERFORM XCTL-RTN                                               
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       CHECK-FOR-UPDATES.                                                       
      *******************                                                       
                                                                                
           MOVE 'N'                   TO  ACAT4FIO-READ-UPDATE-DATABASE.        
                                                                                
           COMPUTE S1 = ACAT4FIO-PAGE-NBR * 2 - 1                               
           IF S1 <= ACAT4FIO-PYBL-QTY                                           
              IF M4ACCT1I  NOT = ACAT4FIO-M4ACCT1  OR                           
                 M4BF1I    NOT = ACAT4FIO-M4BF1    OR                           
                 M4DIV1I   NOT = ACAT4FIO-M4DIV1   OR                           
                 M4SWP1I   NOT = ACAT4FIO-M4SWP1   OR                           
                 M4PAC1I   NOT = ACAT4FIO-M4PAC1   OR                           
                 M4XFR1I   NOT = ACAT4FIO-M4XFR1   OR                           
                 M4ALT1I   NOT = ACAT4FIO-M4ALT1   OR                           
                 M4CUSIP1I NOT = ACAT4FIO-M4CUSIP1 OR                           
                 M4ALTI1I  NOT = ACAT4FIO-M4ALTI1  OR                           
                 M4RSN1I   NOT = ACAT4FIO-M4RSN1   OR                           
                 M4NA1L1I  NOT = ACAT4FIO-M4NA1L1  OR                           
                 M4NA1L2I  NOT = ACAT4FIO-M4NA1L2  OR                           
                 M4NA1L3I  NOT = ACAT4FIO-M4NA1L3  OR                           
                 M4NA1L4I  NOT = ACAT4FIO-M4NA1L4  OR                           
                 M4NA1L5I  NOT = ACAT4FIO-M4NA1L5  OR                           
                 M4NA1L6I  NOT = ACAT4FIO-M4NA1L6  OR                           
                 M4ZIP1I   NOT = ACAT4FIO-M4ZIP1                                
                 SET ACAT4FIO-UPDATE-DATABASE  TO  TRUE                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           ADD 1                               TO  S1.                          
           IF S1 <= ACAT4FIO-PYBL-QTY                                           
              IF M4ACCT2I  NOT = ACAT4FIO-M4ACCT2  OR                           
                 M4BF2I    NOT = ACAT4FIO-M4BF2    OR                           
                 M4DIV2I   NOT = ACAT4FIO-M4DIV2   OR                           
                 M4SWP2I   NOT = ACAT4FIO-M4SWP2   OR                           
                 M4PAC2I   NOT = ACAT4FIO-M4PAC2   OR                           
                 M4XFR2I   NOT = ACAT4FIO-M4XFR2   OR                           
                 M4ALT2I   NOT = ACAT4FIO-M4ALT2   OR                           
                 M4CUSIP2I NOT = ACAT4FIO-M4CUSIP2 OR                           
                 M4ALTI2I  NOT = ACAT4FIO-M4ALTI2  OR                           
                 M4RSN2I   NOT = ACAT4FIO-M4RSN2   OR                           
                 M4NA2L1I  NOT = ACAT4FIO-M4NA2L1  OR                           
                 M4NA2L2I  NOT = ACAT4FIO-M4NA2L2  OR                           
                 M4NA2L3I  NOT = ACAT4FIO-M4NA2L3  OR                           
                 M4NA2L4I  NOT = ACAT4FIO-M4NA2L4  OR                           
                 M4NA2L5I  NOT = ACAT4FIO-M4NA2L5  OR                           
                 M4NA2L6I  NOT = ACAT4FIO-M4NA2L6  OR                           
                 M4ZIP2I   NOT = ACAT4FIO-M4ZIP2                                
                 SET ACAT4FIO-UPDATE-DATABASE  TO  TRUE                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ************************                                                  
       UNDO-CHANGES-VALIDATION.                                                 
      ************************                                                  
                                                                                
           EVALUATE TRUE                                                        
              WHEN M4VALUEI = (' ' OR 'Y')                                      
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 MOVE 'UNDO CHANGES FIELD SHOULD BE BLANK TO CONTINUE, O        
      -               'R Y TO STOP AND UNDO CHANGES'                            
                                         TO  M4ERRMSGO                          
                 MOVE -1                 TO  M4VALUEL                           
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *************************                                                 
       CONFIRMATION-VALIDATION.                                                 
      *************************                                                 
                                                                                
           EVALUATE TRUE                                                        
              WHEN M4VALUEI = ('Y' OR 'N')                                      
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 MOVE 'CONFIRMATION FIELD CAN BE ONLY Y OR N'                   
                                         TO  M4ERRMSGO                          
                 MOVE -1                 TO  M4VALUEL                           
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      ****************                                                          
       SEND-MAP-ERASE.                                                          
      ****************                                                          
                                                                                
           PERFORM GET-DATE-AND-TIME.                                           
                                                                                
           MOVE 'AMFX'                      TO  M4TRIDO.                        
           MOVE WSMMDDYY                    TO  M4DATEO.                        
           MOVE WSTIME                      TO  M4TIMEO.                        
                                                                                
           EXEC CICS SEND MAP('ACATF4M')                                        
                          MAPSET('ACATF4M')                                     
                          FROM(ACATF4MO)                                        
                          CURSOR                                                
                          ERASE                                                 
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *******************                                                       
       SEND-MAP-DATAONLY.                                                       
      *******************                                                       
                                                                                
           PERFORM GET-DATE-AND-TIME.                                           
           MOVE 'AMFX'                      TO  M4TRIDO.                        
           MOVE WSMMDDYY                    TO  M4DATEO.                        
           MOVE WSTIME                      TO  M4TIMEO.                        
                                                                                
           EXEC CICS SEND MAP('ACATF4M')                                        
                          MAPSET('ACATF4M')                                     
                          FROM(ACATF4MO)                                        
                          DATAONLY                                              
                          CURSOR                                                
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *************                                                             
       RECEIVE-MAP.                                                             
      *************                                                             
                                                                                
           MOVE LOW-VALUES                  TO  ACATF4MI.                       
                                                                                
           EXEC CICS  RECEIVE MAP('ACATF4M')                                    
                              MAPSET('ACATF4M')                                 
                              INTO(ACATF4MI)                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *****************                                                         
       DATA-VALIDATION.                                                         
      *****************                                                         
                                                                                
           SET VALIDATION-NO               TO  TRUE.                            
           MOVE SPACES                     TO  M4ERRMSGO.                       
                                                                                
           IF M4ACCT1I = WS-DELETE-LIT                                          
              CONTINUE                                                          
           ELSE                                                                 
              SET VALIDATION-YES            TO  TRUE                            
              PERFORM PREPARE-PYBL-1                                            
              PERFORM VALIDATE-PYBL-1                                           
              IF M4ERRMSGO = SPACES OR LOW-VALUES                               
                 PERFORM FORMAT-NA-LINES                                        
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF ACAT4FIO-PYBL-QTY = (2 OR 4 OR 6)                                 
              IF M4ACCT2I = WS-DELETE-LIT                                       
                 CONTINUE                                                       
              ELSE                                                              
                 SET VALIDATION-YES         TO  TRUE                            
                 PERFORM PREPARE-PYBL-2                                         
                 PERFORM VALIDATE-PYBL-2                                        
                 IF M4ERRMSGO = SPACES OR LOW-VALUES                            
                    PERFORM FORMAT-NA-LINES                                     
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       VALIDATE-PYBL-1.                                                         
      *****************                                                         
                                                                                
           COMPUTE S1 = ACAT4FIO-PAGE-NBR * 2 - 1.                              
                                                                                
           IF M4ZIP1I NUMERIC                                                   
              MOVE M4ZIP1I               TO  ACAT4FIO-ZIP5-CD (S1)              
              MOVE ATT-UNPROT-MDT        TO  M4ZIP1A                            
           ELSE                                                                 
              MOVE 'ZIP CODE MUST BE NUMERIC'                                   
                                         TO  M4ERRMSGO                          
              MOVE -1                    TO  M4ZIP1L                            
              MOVE ATT-UNPROT-BRT-MDT    TO  M4ZIP1A                            
           END-IF.                                                              
                                                                                
           MOVE M4NA1L6I             TO ACAT4FIO-PYBL-NA-LINE (S1, 6).          
           MOVE ATT-UNPROT-MDT       TO M4NA1L6A.                               
                                                                                
           MOVE M4NA1L5I             TO ACAT4FIO-PYBL-NA-LINE (S1, 5).          
           MOVE ATT-UNPROT-MDT       TO M4NA1L5A.                               
                                                                                
           MOVE M4NA1L4I             TO ACAT4FIO-PYBL-NA-LINE (S1, 4).          
           MOVE ATT-UNPROT-MDT       TO M4NA1L4A.                               
                                                                                
           MOVE M4NA1L3I             TO ACAT4FIO-PYBL-NA-LINE (S1, 3).          
           MOVE ATT-UNPROT-MDT       TO M4NA1L3A.                               
                                                                                
           MOVE M4NA1L2I             TO ACAT4FIO-PYBL-NA-LINE (S1, 2).          
           MOVE ATT-UNPROT-MDT       TO M4NA1L2A.                               
                                                                                
           MOVE M4NA1L1I             TO ACAT4FIO-PYBL-NA-LINE (S1, 1).          
           MOVE ATT-UNPROT-MDT       TO M4NA1L1A.                               
                                                                                
           SET STOP-NOT-OK                  TO  TRUE.                           
           PERFORM VARYING SUB1 FROM 1 BY 1 UNTIL SUB1 > 6 OR STOP-OK           
              IF ACAT4FIO-PYBL-NA-LINE (S1, SUB1) = SPACES                      
                 PERFORM VARYING SUB2 FROM SUB1 BY 1                            
                    UNTIL SUB2 > 6 OR STOP-OK                                   
                    IF ACAT4FIO-PYBL-NA-LINE (S1, SUB2) NOT = SPACES            
                       MOVE 'NO BLANK LINES ARE PERMITTED IN ADDRESS'           
                                            TO  M4ERRMSGO                       
                       EVALUATE SUB1                                            
                          WHEN 1                                                
                             MOVE -1        TO  M4NA1L1L                        
                          WHEN 2                                                
                             MOVE -1        TO  M4NA1L2L                        
                          WHEN 3                                                
                             MOVE -1        TO  M4NA1L3L                        
                          WHEN 4                                                
                             MOVE -1        TO  M4NA1L4L                        
                          WHEN 5                                                
                             MOVE -1        TO  M4NA1L5L                        
                          WHEN OTHER                                            
                             MOVE -1        TO  M4NA1L6L                        
                       END-EVALUATE                                             
                       MOVE ATT-UNPROT-BRT-MDT TO M4NA1L1A                      
                                                  M4NA1L2A                      
                                                  M4NA1L3A                      
                                                  M4NA1L4A                      
                                                  M4NA1L5A                      
                                                  M4NA1L6A                      
                       SET STOP-OK           TO  TRUE                           
                    END-IF                                                      
                 END-PERFORM                                                    
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           MOVE M4RSN1I           TO ACAT4FIO-PYBL-ALTNT-RSN-TXT (S1).          
           MOVE ATT-UNPROT-MDT    TO M4RSN1A.                                   
                                                                                
           EVALUATE M4ALTI1I                                                    
              WHEN 'N'                                                          
                 MOVE '0'              TO ACAT4FIO-PYBL-ALTNT-CD (S1)           
                 MOVE ATT-UNPROT-MDT   TO M4ALTI1A                              
              WHEN 'B'                                                          
                 MOVE '1'              TO ACAT4FIO-PYBL-ALTNT-CD (S1)           
                 MOVE ATT-UNPROT-MDT   TO M4ALTI1A                              
              WHEN 'O'                                                          
                 MOVE '2'              TO ACAT4FIO-PYBL-ALTNT-CD (S1)           
                 MOVE ATT-UNPROT-MDT   TO M4ALTI1A                              
              WHEN OTHER                                                        
                 MOVE 'ALTERNATE PAYABLE IND. MUST BE N, B OR O'                
                                       TO M4ERRMSGO                             
                 MOVE -1               TO M4ALTI1L                              
                 MOVE ATT-UNPROT-BRT-MDT TO  M4ALTI1A                           
           END-EVALUATE.                                                        
                                                                                
           IF M4CUSIP1I = SPACES OR LOW-VALUES                                  
              MOVE SPACES          TO ACAT4FIO-PYBL-SEC-ISSUE-CD (S1)           
                                      M4CUSIP1O                                 
           ELSE                                                                 
              MOVE M4CUSIP1I                TO  MSDIO-SEARCH-KEY                
              MOVE 'R'                      TO  MSDIO-ACCESS                    
              MOVE SPACES                   TO  MSDIO-ACTION                    
              MOVE '0'                      TO  MSDIO-WHEN-ISSUE                
              MOVE SPACES                   TO  MSDIO-RETURN-CODE               
              EXEC CICS  LINK PROGRAM ('MSDIO')                                 
                              COMMAREA (MSD-WORK-AREA)                          
              END-EXEC                                                          
              EVALUATE TRUE                                                     
                 WHEN MSDIO-RETURN-CODE = SPACES                                
                    MOVE M4CUSIP1I    TO ACAT4FIO-PYBL-SEC-ISSUE-CD (S1)        
                    MOVE ATT-UNPROT-MDT  TO M4CUSIP1A                           
                 WHEN MSDIO-RETURN-CODE = ('A' OR 'B' OR 'C' OR 'D')            
                    MOVE 'MSD FILE CLOSED, CANNOT VERIFY SYMBOL/CUSIP'          
                                            TO  M4ERRMSGO                       
                    MOVE -1                 TO  M4CUSIP1L                       
                    MOVE ATT-UNPROT-BRT-MDT TO  M4CUSIP1A                       
                 WHEN MSDIO-RETURN-CODE = ('I' OR 'J')                          
                    MOVE 'SECURITY NOT FOUND ON MSD FILE'                       
                                            TO  M4ERRMSGO                       
                    MOVE -1                 TO  M4CUSIP1L                       
                    MOVE ATT-UNPROT-BRT-MDT TO  M4CUSIP1A                       
                 WHEN OTHER                                                     
                    MOVE 'MSD IO ERROR, CANNOT VERIFY SYMBOL/CUSIP'             
                                            TO  M4ERRMSGO                       
                    MOVE -1                 TO  M4CUSIP1L                       
                    MOVE ATT-UNPROT-BRT-MDT TO  M4CUSIP1A                       
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
           EVALUATE M4ALT1I                                                     
              WHEN 'X'                                                          
                 MOVE 'Y'             TO ACAT4FIO-ALTNT-PYBL-IND (S1)           
                 MOVE ATT-UNPROT-MDT  TO M4ALT1A                                
               WHEN 'D'                                                         
                 MOVE 'N'             TO ACAT4FIO-ALTNT-PYBL-IND (S1)           
                 MOVE ATT-UNPROT-MDT  TO M4ALT1A                                
                 MOVE '_'             TO M4ALT1O                                
               WHEN '_'                                                         
                 MOVE 'N'             TO ACAT4FIO-ALTNT-PYBL-IND (S1)           
                 MOVE ATT-UNPROT-MDT  TO M4ALT1A                                
               WHEN OTHER                                                       
                 MOVE 'ENTER X TO SELECT, D TO DESELECT AN OPTION'              
                                      TO M4ERRMSGO                              
                 MOVE -1              TO M4ALT1L                                
                 MOVE ATT-UNPROT-BRT-MDT TO  M4ALT1A                            
           END-EVALUATE.                                                        
                                                                                
           EVALUATE M4XFR1I                                                     
              WHEN 'X'                                                          
                 MOVE 'Y'         TO ACAT4FIO-CRSS-FND-RNVST-IND (S1)           
                 MOVE ATT-UNPROT-MDT   TO  M4XFR1A                              
               WHEN 'D'                                                         
                 MOVE 'N'         TO ACAT4FIO-CRSS-FND-RNVST-IND (S1)           
                 MOVE ATT-UNPROT-MDT   TO M4XFR1A                               
                 MOVE '_'              TO M4XFR1O                               
               WHEN '_'                                                         
                 MOVE 'N'         TO ACAT4FIO-CRSS-FND-RNVST-IND (S1)           
                 MOVE ATT-UNPROT-MDT   TO M4XFR1A                               
               WHEN OTHER                                                       
                 MOVE 'ENTER X TO SELECT, D TO DESELECT AN OPTION'              
                                        TO M4ERRMSGO                            
                 MOVE -1                TO M4XFR1L                              
                 MOVE ATT-UNPROT-BRT-MDT TO M4XFR1A                             
           END-EVALUATE.                                                        
                                                                                
           EVALUATE M4PAC1I                                                     
              WHEN 'X'                                                          
                 MOVE 'Y'            TO ACAT4FIO-ADDRS-ATMDF-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4PAC1A                            
               WHEN 'D'                                                         
                 MOVE 'N'            TO ACAT4FIO-ADDRS-ATMDF-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4PAC1A                            
                 MOVE '_'                TO  M4PAC1O                            
               WHEN '_'                                                         
                 MOVE 'N'            TO ACAT4FIO-ADDRS-ATMDF-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4PAC1A                            
               WHEN OTHER                                                       
                 MOVE 'ENTER X TO SELECT, D TO DESELECT AN OPTION'              
                                         TO  M4ERRMSGO                          
                 MOVE -1                 TO  M4PAC1L                            
                 MOVE ATT-UNPROT-BRT-MDT TO  M4PAC1A                            
           END-EVALUATE.                                                        
                                                                                
           EVALUATE M4SWP1I                                                     
              WHEN 'X'                                                          
                 MOVE 'Y'            TO ACAT4FIO-ADDRS-SYSWL-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4SWP1A                            
               WHEN 'D'                                                         
                 MOVE 'N'            TO ACAT4FIO-ADDRS-SYSWL-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4SWP1A                            
                 MOVE '_'                TO  M4SWP1O                            
               WHEN '_'                                                         
                 MOVE 'N'            TO ACAT4FIO-ADDRS-SYSWL-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4SWP1A                            
               WHEN OTHER                                                       
                 MOVE 'ENTER X TO SELECT, D TO DESELECT AN OPTION'              
                                         TO  M4ERRMSGO                          
                 MOVE -1                 TO  M4SWP1L                            
                 MOVE ATT-UNPROT-BRT-MDT TO  M4SWP1A                            
           END-EVALUATE.                                                        
                                                                                
           EVALUATE M4DIV1I                                                     
              WHEN 'X'                                                          
                 MOVE 'Y'            TO ACAT4FIO-ADDRS-DVDND-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4DIV1A                            
               WHEN 'D'                                                         
                 MOVE 'N'            TO ACAT4FIO-ADDRS-DVDND-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4DIV1A                            
                 MOVE '_'                TO  M4DIV1O                            
               WHEN '_'                                                         
                 MOVE 'N'            TO ACAT4FIO-ADDRS-DVDND-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4DIV1A                            
               WHEN OTHER                                                       
                 MOVE 'ENTER X TO SELECT, D TO DESELECT AN OPTION'              
                                         TO  M4ERRMSGO                          
                 MOVE -1                 TO  M4DIV1L                            
                 MOVE ATT-UNPROT-BRT-MDT TO  M4DIV1A                            
           END-EVALUATE.                                                        
                                                                                
           EVALUATE M4BF1I                                                      
              WHEN 'B'                                                          
                MOVE '2'                TO ACAT4FIO-ACCT-PYBL-CD (S1)           
                MOVE ATT-UNPROT-MDT      TO  M4BF1A                             
              WHEN 'F'                                                          
                MOVE '1'                TO ACAT4FIO-ACCT-PYBL-CD (S1)           
                MOVE ATT-UNPROT-MDT      TO  M4BF1A                             
              WHEN OTHER                                                        
                MOVE 'ACCOUNT INDICATOR MUST BE B OR F'                         
                                         TO  M4ERRMSGO                          
                MOVE -1                  TO  M4BF1L                             
                MOVE ATT-UNPROT-BRT-MDT  TO  M4BF1A                             
           END-EVALUATE.                                                        
                                                                                
           MOVE M4ACCT1I                 TO  ACAT4FIO-ACCT-NBR (S1).            
           MOVE ATT-UNPROT-MDT           TO  M4ACCT2A.                          
                                                                                
           EJECT                                                                
      *****************                                                         
       FORMAT-NA-LINES.                                                         
      *****************                                                         
                                                                                
           MOVE 0                            TO  S2.                            
                                                                                
           PERFORM VARYING S3 FROM 1 BY 1 UNTIL S3 > 6                          
              IF ACAT4FIO-PYBL-NA-LINE (S1, S3) = SPACES OR LOW-VALUES          
                 CONTINUE                                                       
              ELSE                                                              
                 ADD 1                       TO  S2                             
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           EVALUATE TRUE                                                        
              WHEN S2 = ACAT4FIO-PYBL-NA-LINE-CNTR (S1)                         
                 MOVE 'N'                   TO  ACAT4FIO-ACTION (S1)            
                 MOVE ZERO                  TO  ACAT4FIO-NA-CNTR (S1)           
              WHEN S2 > ACAT4FIO-PYBL-NA-LINE-CNTR (S1)                         
                 MOVE 'A'                   TO  ACAT4FIO-ACTION (S1)            
                 COMPUTE ACAT4FIO-NA-CNTR (S1) =                                
                         S2 - ACAT4FIO-PYBL-NA-LINE-CNTR (S1)                   
              WHEN S2 < ACAT4FIO-PYBL-NA-LINE-CNTR (S1)                         
                 MOVE 'D'                   TO  ACAT4FIO-ACTION (S1)            
                 COMPUTE ACAT4FIO-NA-CNTR (S1) =                                
                         ACAT4FIO-PYBL-NA-LINE-CNTR (S1) - S2                   
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *****************                                                         
       VALIDATE-PYBL-2.                                                         
      *****************                                                         
                                                                                
           COMPUTE S1 = ACAT4FIO-PAGE-NBR * 2.                                  
                                                                                
           IF M4ZIP2I NUMERIC                                                   
              MOVE M4ZIP2I               TO  ACAT4FIO-ZIP5-CD (S1)              
              MOVE ATT-UNPROT-MDT        TO  M4ZIP2A                            
           ELSE                                                                 
              MOVE 'ZIP CODE MUST BE NUMERIC'                                   
                                         TO  M4ERRMSGO                          
              MOVE -1                    TO  M4ZIP2L                            
              MOVE ATT-UNPROT-BRT-MDT    TO  M4ZIP2A                            
           END-IF.                                                              
                                                                                
           MOVE M4NA2L6I             TO ACAT4FIO-PYBL-NA-LINE (S1, 6).          
           MOVE ATT-UNPROT-MDT       TO M4NA2L6A.                               
                                                                                
           MOVE M4NA2L5I             TO ACAT4FIO-PYBL-NA-LINE (S1, 5).          
           MOVE ATT-UNPROT-MDT       TO M4NA2L5A.                               
                                                                                
           MOVE M4NA2L4I             TO ACAT4FIO-PYBL-NA-LINE (S1, 4).          
           MOVE ATT-UNPROT-MDT       TO M4NA2L4A.                               
                                                                                
           MOVE M4NA2L3I             TO ACAT4FIO-PYBL-NA-LINE (S1, 3).          
           MOVE ATT-UNPROT-MDT       TO M4NA2L3A.                               
                                                                                
           MOVE M4NA2L2I             TO ACAT4FIO-PYBL-NA-LINE (S1, 2).          
           MOVE ATT-UNPROT-MDT       TO M4NA2L2A.                               
                                                                                
           MOVE M4NA2L1I             TO ACAT4FIO-PYBL-NA-LINE (S1, 1).          
           MOVE ATT-UNPROT-MDT       TO M4NA2L1A.                               
                                                                                
           SET STOP-NOT-OK                  TO  TRUE.                           
           PERFORM VARYING SUB1 FROM 1 BY 1 UNTIL SUB1 > 6 OR STOP-OK           
              IF ACAT4FIO-PYBL-NA-LINE (S1, SUB1) = SPACES                      
                 PERFORM VARYING SUB2 FROM SUB1 BY 1                            
                    UNTIL SUB2 > 6 OR STOP-OK                                   
                    IF ACAT4FIO-PYBL-NA-LINE (S1, SUB2) NOT = SPACES            
                       MOVE 'NO BLANK LINES ARE PERMITTED IN ADDRESS'           
                                            TO  M4ERRMSGO                       
                       EVALUATE SUB1                                            
                          WHEN 1                                                
                             MOVE -1        TO  M4NA2L1L                        
                          WHEN 2                                                
                             MOVE -1        TO  M4NA2L2L                        
                          WHEN 3                                                
                             MOVE -1        TO  M4NA2L3L                        
                          WHEN 4                                                
                             MOVE -1        TO  M4NA2L4L                        
                          WHEN 5                                                
                             MOVE -1        TO  M4NA2L5L                        
                          WHEN OTHER                                            
                             MOVE -1        TO  M4NA2L6L                        
                       END-EVALUATE                                             
                       MOVE ATT-UNPROT-BRT-MDT TO M4NA2L1A                      
                                                  M4NA2L2A                      
                                                  M4NA2L3A                      
                                                  M4NA2L4A                      
                                                  M4NA2L5A                      
                                                  M4NA2L6A                      
                       SET STOP-OK           TO  TRUE                           
                    END-IF                                                      
                 END-PERFORM                                                    
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           MOVE M4RSN2I           TO ACAT4FIO-PYBL-ALTNT-RSN-TXT (S1).          
           MOVE ATT-UNPROT-MDT    TO M4RSN2A.                                   
                                                                                
           EVALUATE M4ALTI2I                                                    
              WHEN 'N'                                                          
                 MOVE '0'              TO ACAT4FIO-PYBL-ALTNT-CD (S1)           
                 MOVE ATT-UNPROT-MDT   TO M4ALTI2A                              
              WHEN 'B'                                                          
                 MOVE '1'              TO ACAT4FIO-PYBL-ALTNT-CD (S1)           
                 MOVE ATT-UNPROT-MDT   TO M4ALTI2A                              
              WHEN 'O'                                                          
                 MOVE '2'              TO ACAT4FIO-PYBL-ALTNT-CD (S1)           
                 MOVE ATT-UNPROT-MDT   TO M4ALTI2A                              
              WHEN OTHER                                                        
                 MOVE 'ALTERNATE PAYABLE IND. MUST BE N, B OR O'                
                                       TO M4ERRMSGO                             
                 MOVE -1               TO M4ALTI2L                              
                 MOVE ATT-UNPROT-BRT-MDT TO  M4ALTI2A                           
           END-EVALUATE.                                                        
                                                                                
           IF M4CUSIP2I = SPACES OR LOW-VALUES                                  
              MOVE SPACES          TO ACAT4FIO-PYBL-SEC-ISSUE-CD (S1)           
                                      M4CUSIP2O                                 
           ELSE                                                                 
              MOVE M4CUSIP2I                TO  MSDIO-SEARCH-KEY                
              MOVE 'R'                      TO  MSDIO-ACCESS                    
              MOVE SPACES                   TO  MSDIO-ACTION                    
              MOVE '0'                      TO  MSDIO-WHEN-ISSUE                
              MOVE SPACES                   TO  MSDIO-RETURN-CODE               
              EXEC CICS  LINK PROGRAM ('MSDIO')                                 
                              COMMAREA (MSD-WORK-AREA)                          
              END-EXEC                                                          
              EVALUATE TRUE                                                     
                 WHEN MSDIO-RETURN-CODE = SPACES                                
                    MOVE M4CUSIP2I    TO ACAT4FIO-PYBL-SEC-ISSUE-CD (S1)        
                    MOVE ATT-UNPROT-MDT  TO M4CUSIP1A                           
                 WHEN MSDIO-RETURN-CODE = ('A' OR 'B' OR 'C' OR 'D')            
                    MOVE 'MSD FILE CLOSED, CANNOT VERIFY SYMBOL/CUSIP'          
                                            TO  M4ERRMSGO                       
                    MOVE -1                 TO  M4CUSIP2L                       
                    MOVE ATT-UNPROT-BRT-MDT TO  M4CUSIP2A                       
                 WHEN MSDIO-RETURN-CODE = ('I' OR 'J')                          
                    MOVE 'SECURITY NOT FOUND ON MSD FILE'                       
                                            TO  M4ERRMSGO                       
                    MOVE -1                 TO  M4CUSIP2L                       
                    MOVE ATT-UNPROT-BRT-MDT TO  M4CUSIP2A                       
                 WHEN OTHER                                                     
                    MOVE 'MSD IO ERROR, CANNOT VERIFY SYMBOL/CUSIP'             
                                            TO  M4ERRMSGO                       
                    MOVE -1                 TO  M4CUSIP2L                       
                    MOVE ATT-UNPROT-BRT-MDT TO  M4CUSIP2A                       
              END-EVALUATE                                                      
           END-IF                                                               
                                                                                
           EVALUATE M4ALT2I                                                     
              WHEN 'X'                                                          
                 MOVE 'Y'             TO ACAT4FIO-ALTNT-PYBL-IND (S1)           
                 MOVE ATT-UNPROT-MDT  TO M4ALT2A                                
               WHEN 'D'                                                         
                 MOVE 'N'             TO ACAT4FIO-ALTNT-PYBL-IND (S1)           
                 MOVE ATT-UNPROT-MDT  TO M4ALT2A                                
                 MOVE '_'             TO M4ALT2O                                
               WHEN '_'                                                         
                 MOVE 'N'             TO ACAT4FIO-ALTNT-PYBL-IND (S1)           
                 MOVE ATT-UNPROT-MDT  TO M4ALT2A                                
               WHEN OTHER                                                       
                 MOVE 'ENTER X TO SELECT, D TO DESELECT AN OPTION'              
                                      TO M4ERRMSGO                              
                 MOVE -1              TO M4ALT2L                                
                 MOVE ATT-UNPROT-BRT-MDT TO  M4ALT2A                            
           END-EVALUATE.                                                        
                                                                                
           EVALUATE M4XFR2I                                                     
              WHEN 'X'                                                          
                 MOVE 'Y'         TO ACAT4FIO-CRSS-FND-RNVST-IND (S1)           
                 MOVE ATT-UNPROT-MDT   TO  M4XFR2A                              
               WHEN 'D'                                                         
                 MOVE 'N'         TO ACAT4FIO-CRSS-FND-RNVST-IND (S1)           
                 MOVE ATT-UNPROT-MDT   TO M4XFR2A                               
                 MOVE '_'              TO M4XFR2O                               
               WHEN '_'                                                         
                 MOVE 'N'         TO ACAT4FIO-CRSS-FND-RNVST-IND (S1)           
                 MOVE ATT-UNPROT-MDT   TO M4XFR1A                               
               WHEN OTHER                                                       
                 MOVE 'ENTER X TO SELECT, D TO DESELECT AN OPTION'              
                                        TO M4ERRMSGO                            
                 MOVE -1                TO M4XFR2L                              
                 MOVE ATT-UNPROT-BRT-MDT TO M4XFR2A                             
           END-EVALUATE.                                                        
                                                                                
              EVALUATE M4PAC2I                                                  
                 WHEN 'X'                                                       
                    MOVE 'Y'            TO ACAT4FIO-ADDRS-ATMDF-IND (S1)        
                    MOVE ATT-UNPROT-MDT     TO  M4PAC2A                         
                  WHEN 'D'                                                      
                    MOVE 'N'            TO ACAT4FIO-ADDRS-ATMDF-IND (S1)        
                    MOVE ATT-UNPROT-MDT     TO  M4PAC2A                         
                    MOVE '_'                TO  M4PAC2O                         
                  WHEN '_'                                                      
                    MOVE 'N'            TO ACAT4FIO-ADDRS-ATMDF-IND (S1)        
                    MOVE ATT-UNPROT-MDT     TO  M4PAC2A                         
                  WHEN OTHER                                                    
                    MOVE 'ENTER X TO SELECT, D TO DESELECT AN OPTION'           
                                            TO  M4ERRMSGO                       
                    MOVE -1                 TO  M4PAC2L                         
                    MOVE ATT-UNPROT-BRT-MDT TO  M4PAC2A                         
              END-EVALUATE.                                                     
                                                                                
           EVALUATE M4SWP2I                                                     
              WHEN 'X'                                                          
                 MOVE 'Y'            TO ACAT4FIO-ADDRS-SYSWL-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4SWP2A                            
               WHEN 'D'                                                         
                 MOVE 'N'            TO ACAT4FIO-ADDRS-SYSWL-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4SWP2A                            
                 MOVE '_'                TO  M4SWP2O                            
               WHEN '_'                                                         
                 MOVE 'N'            TO ACAT4FIO-ADDRS-SYSWL-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4SWP2A                            
               WHEN OTHER                                                       
                 MOVE 'ENTER X TO SELECT, D TO DESELECT AN OPTION'              
                                         TO  M4ERRMSGO                          
                 MOVE -1                 TO  M4SWP2L                            
                 MOVE ATT-UNPROT-BRT-MDT TO  M4SWP2A                            
           END-EVALUATE.                                                        
                                                                                
           EVALUATE M4DIV2I                                                     
              WHEN 'X'                                                          
                 MOVE 'Y'            TO ACAT4FIO-ADDRS-DVDND-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4DIV2A                            
               WHEN 'D'                                                         
                 MOVE 'N'            TO ACAT4FIO-ADDRS-DVDND-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4DIV2A                            
                 MOVE '_'                TO  M4DIV2O                            
               WHEN '_'                                                         
                 MOVE 'N'            TO ACAT4FIO-ADDRS-DVDND-IND (S1)           
                 MOVE ATT-UNPROT-MDT     TO  M4DIV2A                            
               WHEN OTHER                                                       
                 MOVE 'ENTER X TO SELECT, D TO DESELECT AN OPTION'              
                                         TO  M4ERRMSGO                          
                 MOVE -1                 TO  M4DIV2L                            
                 MOVE ATT-UNPROT-BRT-MDT TO  M4DIV2A                            
           END-EVALUATE.                                                        
                                                                                
           EVALUATE M4BF2I                                                      
              WHEN 'B'                                                          
                MOVE '2'                TO ACAT4FIO-ACCT-PYBL-CD (S1)           
                MOVE ATT-UNPROT-MDT      TO  M4BF2A                             
              WHEN 'F'                                                          
                MOVE '1'                TO ACAT4FIO-ACCT-PYBL-CD (S1)           
                MOVE ATT-UNPROT-MDT      TO  M4BF2A                             
              WHEN OTHER                                                        
                MOVE 'ACCOUNT INDICATOR MUST BE B OR F'                         
                                         TO  M4ERRMSGO                          
                MOVE -1                  TO  M4BF2L                             
                MOVE ATT-UNPROT-BRT-MDT  TO  M4BF2A                             
           END-EVALUATE.                                                        
                                                                                
           MOVE M4ACCT2I                 TO  ACAT4FIO-ACCT-NBR (S1).            
           MOVE ATT-UNPROT-MDT           TO  M4ACCT2A.                          
                                                                                
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
                 PERFORM XCTL-RECEIVER-REGISTRATION-1                           
              WHEN EIBAID = DFHPF2                                              
                 PERFORM XCTL-RECEIVER-REGISTRATION-2                           
              WHEN EIBAID = DFHPF3                                              
                 PERFORM XCTL-PIP-SWP                                           
              WHEN EIBAID = DFHPF4                                              
                 INITIALIZE ACAT4FIO                                            
                 PERFORM FIRST-TIME-RTN                                         
              WHEN EIBAID = DFHPF5                                              
                 PERFORM ADD-A-PAYABLE-ROUTINE                                  
              WHEN EIBAID = DFHPF6                                              
                IF M4ACCT1I = WS-DELETE-LIT OR                                  
                   M4ACCT2I = WS-DELETE-LIT                                     
                   IF M4ACCT1I = WS-DELETE-LIT                                  
                      COMPUTE S1 = ACAT4FIO-PAGE-NBR * 2 - 1                    
                      MOVE WS-DELETE-LIT     TO ACAT4FIO-ACCT-NBR (S1)          
                   END-IF                                                       
                   IF M4ACCT2I = WS-DELETE-LIT                                  
                      COMPUTE S1 = ACAT4FIO-PAGE-NBR * 2                        
                      MOVE WS-DELETE-LIT     TO ACAT4FIO-ACCT-NBR (S1)          
                   END-IF                                                       
                   SET ACAT4FIO-UPDATE-DATABASE TO  TRUE                        
                   SET ACAT4FIO-DELETE-PAYABLE  TO  TRUE                        
                   PERFORM LINK-TO-DB2                                          
                   IF ACAT4FIO-PYBL-QTY = 0                                     
                      PERFORM CLEAR-PYBL-1                                      
                      PERFORM DARK-PYBL-1                                       
                      PERFORM CLEAR-PYBL-2                                      
                      PERFORM DARK-PYBL-2                                       
                      MOVE 'THERE ARE NO PAYABLES IN THE DATABASE'              
                                                TO  M4ERRMSGO                   
                      MOVE -1                   TO  M4TRIDL                     
                   ELSE                                                         
                      MOVE +1                   TO  ACAT4FIO-PAGE-NBR           
                      PERFORM FORMAT-MAP-OUTPUT                                 
                   END-IF                                                       
                   PERFORM SEND-MAP-DATAONLY                                    
                   PERFORM RETURN-TO-CICS                                       
                ELSE                                                            
                   MOVE 'MOVE ALL DASHES TO THE ACCOUNT NUMBER OF THE PA        
      -                 'YABLE TO BE DELETED'  TO  M4ERRMSGO                    
                   PERFORM SEND-MAP-DATAONLY                                    
                END-IF                                                          
              WHEN EIBAID = DFHPF7                                              
                 COMPUTE S1 = ACAT4FIO-PAGE-NBR - 1                             
      *          SUBTRACT 1               FROM  ACAT4FIO-PAGE-NBR               
      *          IF ACAT4FIO-PAGE-NBR <= 0                                      
                 IF S1 <= 0                                                     
                    MOVE 'TOP OF DATA'      TO  M4ERRMSGO                       
                    PERFORM SEND-MAP-DATAONLY                                   
                 ELSE                                                           
                    SUBTRACT 1            FROM  ACAT4FIO-PAGE-NBR               
                    PERFORM FORMAT-MAP-OUTPUT                                   
                    PERFORM SEND-MAP-ERASE                                      
                 END-IF                                                         
                 PERFORM RETURN-TO-CICS                                         
              WHEN EIBAID = DFHPF8                                              
                 COMPUTE S1 = ACAT4FIO-PAGE-NBR * 2 - 1                         
                 COMPUTE S2 = ACAT4FIO-PAGE-NBR * 2                             
                 IF S1 >= ACAT4FIO-PYBL-QTY                                     
                    MOVE 'BOTTOM OF DATA'   TO  M4ERRMSGO                       
                    PERFORM SEND-MAP-DATAONLY                                   
                 ELSE                                                           
                    IF S2 >= ACAT4FIO-PYBL-QTY                                  
                       MOVE 'BOTTOM OF DATA' TO M4ERRMSGO                       
                       PERFORM SEND-MAP-DATAONLY                                
                    ELSE                                                        
                       ADD 1                TO  ACAT4FIO-PAGE-NBR               
                       PERFORM FORMAT-MAP-OUTPUT                                
                       PERFORM SEND-MAP-ERASE                                   
                    END-IF                                                      
                 END-IF                                                         
                 PERFORM RETURN-TO-CICS                                         
              WHEN OTHER                                                        
                 MOVE 'INVALID PF KEY'      TO  M4ERRMSGO                       
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      ***********************                                                   
       ADD-A-PAYABLE-ROUTINE.                                                   
      ***********************                                                   
                                                                                
           ADD 1                            TO  ACAT4FIO-PYBL-QTY.              
                                                                                
           EVALUATE TRUE                                                        
              WHEN ACAT4FIO-PYBL-QTY > 6                                        
                 MOVE 'NUMBER OF PAYABLES IS LIMITED TO 6'                      
                                            TO  M4ERRMSGO                       
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
              WHEN ACAT4FIO-PYBL-QTY = 1 OR 3 OR 5                              
                 PERFORM CLEAR-PYBL-1                                           
                 PERFORM CLEAR-PYBL-2                                           
                 PERFORM PREPARE-PYBL-1                                         
                 PERFORM INITIALIZE-OPTIONS-1                                   
                 PERFORM DARK-PYBL-2                                            
                 COMPUTE ACAT4FIO-PAGE-NBR =                                    
                        (ACAT4FIO-PYBL-QTY + 1) / 2                             
                 MOVE -1                    TO  M4ACCT1L                        
                 MOVE ACAT4FIO-PYBL-QTY     TO  M4PBLN1O                        
                 SET ACAT4FIO-ADD-PAYABLE   TO  TRUE                            
              WHEN ACAT4FIO-PYBL-QTY = 2 OR 4 OR 6                              
                 COMPUTE ACAT4FIO-PAGE-NBR = ACAT4FIO-PYBL-QTY / 2              
                 PERFORM CLEAR-PYBL-1                                           
                 PERFORM CLEAR-PYBL-2                                           
                 PERFORM PREPARE-PYBL-1                                         
                 PERFORM INITIALIZE-OPTIONS-1                                   
                 PERFORM FORMAT-PYBL-1                                          
                 PERFORM PREPARE-PYBL-2                                         
                 PERFORM INITIALIZE-OPTIONS-2                                   
                 PERFORM FORMAT-PYBL-2                                          
                 MOVE -1                    TO  M4ACCT2L                        
                 MOVE ACAT4FIO-PYBL-QTY     TO  M4PBLN2O                        
                 SET ACAT4FIO-ADD-PAYABLE   TO  TRUE                            
           END-EVALUATE.                                                        
                                                                                
           PERFORM SEND-MAP-ERASE.                                              
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      *************                                                             
       LINK-TO-DB2.                                                             
      *************                                                             
                                                                                
           EXEC CICS LINK PROGRAM('ACAT4FDB')                                   
                         COMMAREA(ACAT4FIO-COMMAREA)                            
           END-EXEC.                                                            
                                                                                
TRDEL      MOVE DFHCOMMAREA TO ACATCOMM-COMMAREA.                               
           IF ACAT4FIO-DB2-BAD-RETURN                                           
              MOVE ACAT4FIO-DB2-RETURN-CODE TO  ERR-BAD-DB2-CODE                
              MOVE ERR-BAD-DB2              TO  M4ERRMSGO                       
              IF FIRST-TIME                                                     
                 PERFORM SEND-MAP-ERASE                                         
              ELSE                                                              
                 PERFORM SEND-MAP-DATAONLY                                      
              END-IF                                                            
              PERFORM RETURN-TO-CICS                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ******************************                                            
       XCTL-RECEIVER-REGISTRATION-1.                                            
      ******************************                                            
                                                                                
           PERFORM CLEAR-PYBL-1.                                                
           PERFORM PROTECT-PYBL1.                                               
           PERFORM CLEAR-PYBL-2.                                                
           PERFORM PROTECT-PYBL2.                                               
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF1'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT1FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           SET ACAT1FIO-FIRST-TIME          TO  TRUE.                           
           MOVE ACAT4FIO-NSCC-PEND-CD       TO  ACAT1FIO-NSCC-PEND-CD.          
           INITIALIZE ACAT1FIO.                                                 
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT1FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               REWRITE                                          
           END-EXEC.                                                            
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT1FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE ERR-ACAT1FSC                TO  M4ERRMSGO.                      
                                                                                
           PERFORM SEND-MAP-DATAONLY.                                           
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ******************************                                            
       XCTL-RECEIVER-REGISTRATION-2.                                            
      ******************************                                            
                                                                                
           PERFORM CLEAR-PYBL-1.                                                
           PERFORM CLEAR-PYBL-2.                                                
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF2'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT2FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           SET ACAT2FIO-FIRST-TIME          TO  TRUE.                           
           MOVE ACAT4FIO-NSCC-PEND-CD       TO  ACAT2FIO-NSCC-PEND-CD.          
           INITIALIZE ACAT2FIO.                                                 
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT2FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               REWRITE                                          
           END-EXEC.                                                            
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT2FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE ERR-ACAT2FSC                TO  M4ERRMSGO.                      
                                                                                
           PERFORM SEND-MAP-DATAONLY.                                           
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      **************                                                            
       XCTL-PIP-SWP.                                                            
      **************                                                            
                                                                                
           PERFORM CLEAR-PYBL-1.                                                
           PERFORM CLEAR-PYBL-2.                                                
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF3'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT3FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           SET ACAT3FIO-FIRST-TIME          TO  TRUE.                           
           MOVE ACAT4FIO-NSCC-PEND-CD       TO  ACAT3FIO-NSCC-PEND-CD.          
           INITIALIZE ACAT3FIO.                                                 
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT3FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               REWRITE                                          
           END-EXEC.                                                            
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT3FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE ERR-ACAT3FSC                TO  M4ERRMSGO.                      
                                                                                
           PERFORM SEND-MAP-DATAONLY.                                           
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ***************                                                           
       XCTL-PAYABLES.                                                           
      ***************                                                           
                                                                                
           PERFORM CLEAR-PYBL-1.                                                
           PERFORM CLEAR-PYBL-2.                                                
                                                                                
           SET ACAT4FIO-FIRST-TIME          TO  TRUE.                           
           INITIALIZE ACAT4FIO.                                                 
                                                                                
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ****************                                                          
       PREPARE-PYBL-1.                                                          
      ****************                                                          
                                                                                
           MOVE ATT-ASKIP-MDT               TO  M4PBLL1A                        
                                                M4PBLN1A                        
                                                M4ACCTL1A               00054   
                                                M4BFL1A                 00054   
                                                M4OPTL1A                00054   
      *                                         M4OPTM1A                00054   
                                                M4CUSL1A                00054   
                                                M4ALTIL1A               00054   
                                                M4RSNL1A                00054   
                                                M4NAL1A                 00054   
                                                M4ZIPL1A.                       
                                                                                
           MOVE ATT-UNPROT-MDT              TO  M4ACCT1A                        
                                                M4BF1A                  00054   
                                                M4DIV1A                 00054   
                                                M4SWP1A                 00054   
                                                M4PAC1A                 00054   
                                                M4XFR1A                 00054   
                                                M4ALT1A                 00054   
                                                M4CUSIP1A               00054   
                                                M4ALTI1A                00054   
                                                M4RSN1A                 00054   
                                                M4NA1L1A                00054   
                                                M4NA1L2A                00054   
                                                M4NA1L3A                00054   
                                                M4NA1L4A                00054   
                                                M4NA1L5A                00054   
                                                M4NA1L6A                00054   
                                                M4ZIP1A.                        
                                                                                
           EJECT                                                                
      **********************                                                    
       INITIALIZE-OPTIONS-1.                                                    
      **********************                                                    
                                                                                
           MOVE '_'                         TO  M4DIV1O                         
                                                M4SWP1O                         
                                                M4PAC1O                         
                                                M4XFR1O                         
                                                M4ALT1O.                        
                                                                                
           EJECT                                                                
      ****************                                                          
       PREPARE-PYBL-2.                                                          
      ****************                                                          
                                                                                
           MOVE ATT-ASKIP-MDT               TO  M4PBLL2A                00054   
                                                M4PBLN2A                        
                                                M4ACCTL2A               00054   
                                                M4BFL2A                 00054   
                                                M4OPTL2A                00054   
      *                                         M4OPTM2A                00054   
                                                M4CUSL2A                00054   
                                                M4ALTIL2A               00054   
                                                M4RSNL2A                00054   
                                                M4NAL2A                 00054   
                                                M4ZIPL2A.                       
                                                                                
           MOVE ATT-UNPROT-MDT              TO  M4ACCT2A                00054   
                                                M4BF2A                  00054   
                                                M4DIV2A                 00054   
                                                M4SWP2A                 00054   
                                                M4PAC2A                 00054   
                                                M4XFR2A                 00054   
                                                M4ALT2A                 00054   
                                                M4CUSIP2A               00054   
                                                M4ALTI2A                00054   
                                                M4RSN2A                 00054   
                                                M4NA2L1A                00054   
                                                M4NA2L2A                00054   
                                                M4NA2L3A                00054   
                                                M4NA2L4A                00054   
                                                M4NA2L5A                00054   
                                                M4NA2L6A                00054   
                                                M4ZIP2A.                        
                                                                                
           EJECT                                                                
      **********************                                                    
       INITIALIZE-OPTIONS-2.                                                    
      **********************                                                    
                                                                                
           MOVE '_'                         TO  M4DIV2O                         
                                                M4SWP2O                         
                                                M4PAC2O                         
                                                M4XFR2O                         
                                                M4ALT2O.                        
                                                                                
           EJECT                                                                
      *************                                                             
       DARK-PYBL-1.                                                             
      *************                                                             
                                                                                
           MOVE ATT-PROT-DRK-MDT            TO  M4PBLL1A                        
                                                M4PBLN1A                00054   
                                                M4ACCTL1A               00054   
                                                M4ACCT1A                        
                                                M4BFL1A                 00054   
                                                M4BF1A                  00054   
                                                M4OPTL1A                00054   
      *                                         M4OPTM1A                00054   
                                                M4DIV1A                 00054   
                                                M4SWP1A                 00054   
                                                M4PAC1A                 00054   
                                                M4XFR1A                 00054   
                                                M4ALT1A                 00054   
                                                M4CUSL1A                00054   
                                                M4CUSIP1A               00054   
                                                M4ALTIL1A               00054   
                                                M4ALTI1A                00054   
                                                M4RSNL1A                00054   
                                                M4RSN1A                 00054   
                                                M4NAL1A                 00054   
                                                M4NA1L1A                00054   
                                                M4NA1L2A                00054   
                                                M4NA1L3A                00054   
                                                M4NA1L4A                00054   
                                                M4NA1L5A                00054   
                                                M4NA1L6A                00054   
                                                M4ZIPL1A                        
                                                M4ZIP1A.                        
                                                                                
           EJECT                                                                
      *************                                                             
       DARK-PYBL-2.                                                             
      *************                                                             
                                                                                
           MOVE ATT-PROT-DRK-MDT            TO  M4PBLL2A                00054   
                                                M4PBLN2A                00054   
                                                M4ACCTL2A               00054   
                                                M4ACCT2A                00054   
                                                M4BFL2A                 00054   
                                                M4BF2A                  00054   
                                                M4OPTL2A                00054   
      *                                         M4OPTM2A                00054   
                                                M4DIV2A                 00054   
                                                M4SWP2A                 00054   
                                                M4PAC2A                 00054   
                                                M4XFR2A                 00054   
                                                M4ALT2A                 00054   
                                                M4CUSL2A                00054   
                                                M4CUSIP2A               00054   
                                                M4ALTIL2A               00054   
                                                M4ALTI2A                00054   
                                                M4RSNL2A                00054   
                                                M4RSN2A                 00054   
                                                M4NAL2A                 00054   
                                                M4NA2L1A                00054   
                                                M4NA2L2A                00054   
                                                M4NA2L3A                00054   
                                                M4NA2L4A                00054   
                                                M4NA2L5A                00054   
                                                M4NA2L6A                00054   
                                                M4ZIPL2A                        
                                                M4ZIP2A.                        
                                                                                
           EJECT                                                                
      **************                                                            
       CLEAR-PYBL-1.                                                            
      **************                                                            
                                                                                
                                                                                
           MOVE SPACES                      TO  M4ACCT1O                        
                                                M4BF1O                          
                                                M4DIV1O                         
                                                M4SWP1O                         
                                                M4PAC1O                         
                                                M4XFR1O                         
                                                M4ALT1O                         
                                                M4CUSIP1O                       
                                                M4ALTI1O                        
                                                M4RSN1O                         
                                                M4NA1L1O                        
                                                M4NA1L2O                        
                                                M4NA1L2O                        
                                                M4NA1L3O                        
                                                M4NA1L4O                        
                                                M4NA1L5O                        
                                                M4NA1L6O                        
                                                M4ZIP1O                         
                                                M4ERRMSGO                       
                                                ACAT4FIO-M4ACCT1                
                                                ACAT4FIO-M4BF1                  
                                                ACAT4FIO-M4DIV1                 
                                                ACAT4FIO-M4SWP1                 
                                                ACAT4FIO-M4PAC1                 
                                                ACAT4FIO-M4XFR1                 
                                                ACAT4FIO-M4ALT1                 
                                                ACAT4FIO-M4CUSIP1               
                                                ACAT4FIO-M4ALTI1                
                                                ACAT4FIO-M4RSN1                 
                                                ACAT4FIO-M4NA1L1                
                                                ACAT4FIO-M4NA1L2                
                                                ACAT4FIO-M4NA1L3                
                                                ACAT4FIO-M4NA1L4                
                                                ACAT4FIO-M4NA1L5                
                                                ACAT4FIO-M4NA1L6                
                                                ACAT4FIO-M4ZIP1.                
                                                                                
           EJECT                                                                
      ***************                                                           
       PROTECT-PYBL1.                                                           
      ***************                                                           
                                                                                
           MOVE ATT-PROT-MDT                TO  M4ACCT1A                        
                                                M4BF1A                          
                                                M4DIV1A                         
                                                M4SWP1A                         
                                                M4PAC1A                         
                                                M4XFR1A                         
                                                M4ALT1A                         
                                                M4CUSIP1A                       
                                                M4ALTI1A                        
                                                M4RSN1A                         
                                                M4NA1L1A                        
                                                M4NA1L2A                        
                                                M4NA1L3A                        
                                                M4NA1L4A                        
                                                M4NA1L5A                        
                                                M4NA1L6A                        
                                                M4ZIP1A                         
                                                ACAT4FIO-M4ACCT2                
                                                ACAT4FIO-M4BF2                  
                                                ACAT4FIO-M4DIV2                 
                                                ACAT4FIO-M4SWP2                 
                                                ACAT4FIO-M4PAC2                 
                                                ACAT4FIO-M4XFR2                 
                                                ACAT4FIO-M4ALT2                 
                                                ACAT4FIO-M4CUSIP2               
                                                ACAT4FIO-M4ALTI2                
                                                ACAT4FIO-M4RSN2                 
                                                ACAT4FIO-M4NA2L1                
                                                ACAT4FIO-M4NA2L2                
                                                ACAT4FIO-M4NA2L3                
                                                ACAT4FIO-M4NA2L4                
                                                ACAT4FIO-M4NA2L5                
                                                ACAT4FIO-M4NA2L6                
                                                ACAT4FIO-M4ZIP2.                
                                                                                
           EJECT                                                                
      **************                                                            
       CLEAR-PYBL-2.                                                            
      **************                                                            
                                                                                
                                                                                
           MOVE SPACES                      TO  M4ACCT2O                        
                                                M4BF2O                          
                                                M4DIV2O                         
                                                M4SWP2O                         
                                                M4PAC2O                         
                                                M4XFR2O                         
                                                M4ALT2O                         
                                                M4CUSIP2O                       
                                                M4ALTI2O                        
                                                M4RSN2O                         
                                                M4NA2L1O                        
                                                M4NA2L2O                        
                                                M4NA2L3O                        
                                                M4NA2L4O                        
                                                M4NA2L5O                        
                                                M4NA2L6O                        
                                                M4ZIP2O.                        
                                                                                
           EJECT                                                                
      ***************                                                           
       PROTECT-PYBL2.                                                           
      ***************                                                           
                                                                                
           MOVE ATT-PROT-MDT                TO  M4ACCT2A                        
                                                M4BF2A                          
                                                M4DIV2A                         
                                                M4SWP2A                         
                                                M4PAC2A                         
                                                M4XFR2A                         
                                                M4ALT2A                         
                                                M4CUSIP2A                       
                                                M4ALTI2A                        
                                                M4RSN2A                         
                                                M4NA2L1A                        
                                                M4NA2L2A                        
                                                M4NA2L3A                        
                                                M4NA2L4A                        
                                                M4NA2L5A                        
                                                M4NA2L6A                        
                                                M4ZIP2A.                        
                                                                                
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
      *************************                                                 
       WRITE-ACAT4FIO-COMMAREA.                                                 
      *************************                                                 
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT4FIO-COMMAREA)                          
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
                                                                                
           EXEC CICS SEND CONTROL                                               
                            ERASE                                               
                           FREEKB                                               
           END-EXEC.                                                            
                                                                                
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
                                                                                
           MOVE '4'                         TO  ACAT-AMFX-PROG-CODE.            
                                                                                
           PERFORM WRITE-ACAT4FIO-COMMAREA.                                     
                                                                                
           EXEC CICS RETURN                                                     
                     TRANSID('AMFX')                                            
                     COMMAREA(ACATCOMM-COMMAREA)                                
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ************************                                                  
       RETURN-CONTROL-TO-MAIN.                                                  
      ************************                                                  
                                                                                
                                                                                
           EXEC CICS SEND CONTROL                                               
                            ERASE                                               
                           FREEKB                                               
           END-EXEC.                                                            
                                                                                
           PERFORM DELETE-ALL-TSQS.                                             
           MOVE '0'                         TO  ACAT-AMFX-PROG-CODE.            
                                                                                
LRM003     IF ACAT4FIO-CALL-RTN-PROGRAM = 'ACAT05RN'                            
LRM003        EXEC CICS XCTL PROGRAM('ACAT05RN')                                
LRM003                       COMMAREA(ACATCOMM-COMMAREA)                        
LRM003        END-EXEC                                                          
LRM003     ELSE                                                                 
           EXEC CICS XCTL PROGRAM('ACAT04RS')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE 'PROGRAM ACAT04RS IS NOT AVAILABLE'                             
                                            TO  M4ERRMSGO.                      
           MOVE -1                          TO  M4TRIDL.                        
                                                                                
           PERFORM SEND-MAP-ERASE.                                              
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ***********                                                               
       HANG-CICS.                                                               
      ***********                                                               
                                                                                
           GOBACK.                                                              
                                                                                
