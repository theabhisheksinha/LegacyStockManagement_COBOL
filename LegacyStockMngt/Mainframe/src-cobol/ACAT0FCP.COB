000001* PDX    - ACAT0FCP C0215192 02/14/05 10:39:08 TBLAMUR            00001000
LRM004* SSR CORRECT PF10 RETURN WHEN NO F/R WAS BUILT.                          
000001* PDX    - ACAT0FCP C0214488 12/08/04 11:33:24 TBLAMUR            00001000
LRM003* SSR 0039884 ALLOW LINK FROM E SCREEN / RETURN TO CORRECT PROG.          
000001* PDX    - ACAT0FCP C0210803 09/08/04 09:59:06 TBLAMUR            00001000
LRM001* SSR 0038145 DELETED COPY NASEGPPE (NO FIELDS REFERENCED)                
000001* PDX    - ACAT0FCP C0120352 01/25/99 11:21:19 TBTARYB            00001000
000001* PDX    - ACAT0FCP C0119770 12/28/98 12:12:00 TBTARYB            00001000
000001* PDX    - ACAT0FCP C0118708 12/28/98 10:23:39 TBTARYB            00001000
000001* PDX    - ACAT0FCP C0113942 10/30/98 13:58:15 TBTARYB            00001000
      ******************************************************************        
       IDENTIFICATION DIVISION.                                                 
      ******************************************************************        
       PROGRAM-ID.    ACAT0FCP.                                                 
                                                                                
      *REMARKS.                                                                 
      ******************************************************************        
      * FUND/SERV: PORGRAM (XCTL'ED BY ACAT10CP) TRANSFERS CONTROL TO  *        
      *      -  "RECEIVER REGISTRATION 1" SCREEN (PROGRAM 'ACAT1FSC'); *        
      *      -  "RECEIVER REGISTRATION 2" SCREEN (PROGRAM 'ACAT2FSC'); *        
      *      -  "PIP/SWP" SCREEN (PROGRAM 'ACAT3FSC');                 *        
      *      -  "PAYBLES" SCREEN (PROGRAM 'ACAT4FSC).                  *        
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
                                                                                
       77  TWA-SIZE                   COMP  PIC S9(04).                         
       77  RESPONSE-CODE              COMP  PIC S9(08)  VALUE ZERO.             
       77  S1                               PIC  9(01)  VALUE ZERO.             
       77  WK-NAME-IND                      PIC  9(01)  VALUE ZERO.             
                                                                                
       01  WS-TSQ-AREA.                                                         
           05  WS-TS-NAME.                                                      
               10 TERM-ID                   PIC  X(04).                         
               10 TRAN-ID                   PIC  X(04).                         
           05 ITEM-NUMBER             COMP  PIC S9(04)  VALUE +1.               
                                                                                
       01  WS-DATE-AREA.                                                        
           05  WSABSTIME              COMP  PIC S9(08).                         
           05  WSMMDDYY.                                                        
               09 WS-CUR-MM                 PIC  XX.                            
               09  FILLER                   PIC  X.                             
               09 WS-CUR-DD                 PIC  XX.                            
               09  FILLER                   PIC  X.                             
               09 WS-CUR-YY                 PIC  XX.                            
           05  WSDATESEP                    PIC  X(01)  VALUE '/'.              
           05  WSTIME.                                                          
               09  WS-TIME-HH               PIC  XX.                            
               09  FILLER                   PIC  X.                             
               09  WS-TIME-MM               PIC  XX.                            
               09  FILLER                   PIC  X.                             
               09  WS-TIME-SS               PIC  XX.                            
           05  WSTIMESEP                    PIC  X(01)  VALUE ':'.              
           05  WS-DB2-FORM-DATE.                                                
               09  WS-DATE-CC               PIC  X(02).                         
               09  WS-DATE-YY               PIC  X(02).                         
               09  FILLER                   PIC  X(01).                         
               09  WS-DATE-MM               PIC  X(02).                         
               09  FILLER                   PIC  X(01).                         
               09  WS-DATE-DD               PIC  X(02).                         
           05  WS-EDITED-DATE.                                                  
               09  WS-EDITED-MM             PIC  X(02).                         
               09  FILLER                   PIC  X(01)  VALUE '/'.              
               09  WS-EDITED-DD             PIC  X(02).                         
               09  FILLER                   PIC  X(01)  VALUE '/'.              
               09  WS-EDITED-YY             PIC  X(02).                         
                                                                                
       01  ACAT-WORK-AREA.                                                      
           05  SYSTEM-MSG                   PIC  X(79)  VALUE SPACES.           
           05  ERROR-PROG-MSG.                                                  
               10  ERROR-PROG-NAME          PIC  X(08).                         
               10  FILLER                   PIC  X(71)  VALUE                   
                   'PROGRAM NOT AVAILABLE'.                                     
                                                                                
       01  B1-PRINT-FILE.                                                       
           05  B1-PRINT-KEY.                                                    
               10  B1-PRINT-CLIENT          PIC  9(03)  COMP-3.                 
               10  B1-PRINT-CARD            PIC  9(06)  COMP-3.                 
               10  B1-PRINT-CLIENT-2        PIC  9(03)  COMP-3.                 
               10  B1-PRINT-SEQUENCE        PIC  9(05)  COMP-3.                 
           05  FILLER                       PIC  X(01)  VALUE ' '.              
           05  B1-COMMON-AREA               PIC  X(35).                         
           05  FIL1  REDEFINES  B1-COMMON-AREA.                                 
               10  B1-CARD-VALUE            PIC  X(01).                         
               10  FILLER                   PIC  X(34).                         
           05  FIL2  REDEFINES  FIL1.                                           
               10  B1-REG-LINE              PIC  X(30).                         
               10  FILLER                   PIC  X(05).                         
           05  FIL3  REDEFINES  FIL2.                                           
               10  B1-TIN-NO                PIC  9(09).                         
               10  FILLER                   PIC  X(26).                         
                                                                                
           EJECT                                                                
           COPY ACAT0FIO.                                                       
                                                                                
           EJECT                                                                
           COPY ACATF0M.                                                        
                                                                                
           EJECT                                                                
           COPY ACATFB1.                                                        
                                                                                
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
           COPY RNARDCOB.                                                       
           COPY NASEGPPA.                                                       
           COPY NASEGPPB.                                                       
           COPY NASEGEND.                                                       
                                                                                
           EJECT                                                                
       01  MSD-WORK-AREA.                                                       
           COPY MSDCOMC.                                                        
                                                                                
           EJECT                                                                
       01  MF-MSD-KEY                       PIC  X(08).                         
       01  MF-MSD-REC.                                                          
           COPY MFMSDREC.                                                       
                                                                                
           EJECT                                                                
       01  MF-REG-KEY.                                                          
           05  MF-REG-CLIENT                PIC  X(03).                         
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  MF-REG-CUSIP                 PIC  X(09).                         
           05  FILLER                       PIC  X(04)  VALUE SPACES.           
                                                                                
       01  MF-REG-REC.                                                          
           COPY BNWREGOP.                                                       
                                                                                
           EJECT                                                                
           COPY DFHAID.                                                         
                                                                                
            EJECT                                                               
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
       01  DFHCOMMAREA.                                                         
           05  FILLER                       PIC  X(2000).                       
                                                                                
           COPY TWACOMMN.                                                       
                                                                                
           EJECT                                                                
      ******************************************************************        
       PROCEDURE DIVISION.                                                      
      ******************************************************************        
                                                                                
           EJECT                                                                
      ********************                                                      
       INITIALIZATION-RTN.                                                      
      ********************                                                      
                                                                                
           EXEC CICS IGNORE CONDITION DUPKEY DUPREC  ENDFILE  ERROR             
                     ILLOGIC INVREQ   IOERR  ITEMERR LENGERR  MAPFAIL           
                     NOSPACE NOSTG    NOTFND         PGMIDERR QIDERR            
           END-EXEC.                                                            
                                                                                
           EXEC CICS ASSIGN TWALENG (TWA-SIZE)                                  
           END-EXEC.                                                            
                                                                                
           IF TWA-SIZE = 0                                                      
              MOVE LOW-VALUES               TO  ACATF0MO                        
              MOVE 'TWA SIZE EQUAL ZERO - PROGRAM CANNOT FUNCTION'              
                                            TO  M0ERRMSGO                       
              PERFORM SEND-MAP                                                  
              MOVE '9'                      TO  ACAT-AMFX-PROG-CODE             
              PERFORM RETURN-TO-CICS                                            
           END-IF.                                                              
                                                                                
           EXEC CICS ADDRESS TWA (ADDRESS OF TWA-AREA)                          
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *****************                                                         
       MAIN-PROCESSING.                                                         
      *****************                                                         
                                                                                
           MOVE DFHCOMMAREA                 TO  ACATCOMM-COMMAREA.              
                                                                                
*PROD*     IF ACAT-PROGRAM-NAME = 'ACAT0FCP'                                    
*PROD*        MOVE 'ACAT0FCP'               TO  ACAT-CALLING-PROG-NAME          
*PROD*     ELSE                                                                 
*PROD*        MOVE 'ACAT0FCP'               TO  ACAT-PROGRAM-NAME               
*PROD*                                          ACAT-CALLING-PROG-NAME          
*PROD*        PERFORM FIRST-TIME-RTN                                            
*PROD*     END-IF.                                                              
                                                                                
*TEST**    IF EIBCALEN = 0                                                      
*TEST**       PERFORM FIRST-TIME-RTN                                            
*TEST**    ELSE                                                                 
*TEST**       MOVE DFHCOMMAREA              TO  ACATCOMM-COMMAREA               
*TEST**    END-IF.                                                              
                                                                                
           EVALUATE ACAT-AMFX-PROG-CODE                                         
              WHEN '0'                                                          
                 PERFORM KEY-ROUTINE-1                                          
              WHEN '9'                                                          
                 PERFORM KEY-ROUTINE-2                                          
              WHEN '1'                                                          
                 PERFORM XCTL-RECEIVER-REGISTRATION-1                           
              WHEN '2'                                                          
                 PERFORM XCTL-RECEIVER-REGISTRATION-2                           
              WHEN '3'                                                          
                 PERFORM XCTL-PIP-SWP                                           
              WHEN '4'                                                          
                 PERFORM XCTL-PAYABLES                                          
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      ****************                                                          
       FIRST-TIME-RTN.                                                          
      ****************                                                          
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMFX'                      TO  TRAN-ID.                        
           INITIALIZE ACAT1FIO-COMMAREA.                                        
           INITIALIZE ACAT2FIO-COMMAREA.                                        
           INITIALIZE ACAT3FIO-COMMAREA.                                        
           INITIALIZE ACAT4FIO-COMMAREA.                                        
                                                                                
           MOVE EIBTRMID                 TO  TERM-ID.                           
           MOVE 'AMFX'                   TO  TRAN-ID.                           
           MOVE +1                       TO  ITEM-NUMBER.                       
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT0F01-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
LRM004***  EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
LRM004***  END-EXEC.                                                            
                                                                                
           MOVE ACAT0F01-CLIENT-NBR         TO  ACAT1FIO-CLIENT-NBR             
                                                ACAT2FIO-CLIENT-NBR             
                                                ACAT3FIO-CLIENT-NBR             
                                                ACAT4FIO-CLIENT-NBR.            
           MOVE ACAT0F01-CONTROL-NBR       TO ACAT1FIO-ACAT-CONTROL-NBR         
                                              ACAT2FIO-ACAT-CONTROL-NBR         
                                              ACAT3FIO-ACAT-CONTROL-NBR         
                                              ACAT4FIO-ACAT-CONTROL-NBR.        
           MOVE ACAT0F01-ISIN-SEC-ISSUE-CD  TO  ACAT1FIO-CUSIP                  
                                                ACAT2FIO-CUSIP                  
                                                ACAT3FIO-CUSIP                  
                                                ACAT4FIO-CUSIP.                 
           MOVE ACAT0F01-ASSET-SEQ-NBR      TO  ACAT1FIO-ASSET-SEQ-NBR          
                                                ACAT2FIO-ASSET-SEQ-NBR          
                                                ACAT3FIO-ASSET-SEQ-NBR          
                                                ACAT4FIO-ASSET-SEQ-NBR.         
                                                                                
           MOVE ACAT0F01-ASSET-DESC         TO  ACAT1FIO-ASSET-DESC             
                                                ACAT2FIO-ASSET-DESC             
                                                ACAT3FIO-ASSET-DESC             
                                                ACAT4FIO-ASSET-DESC.            
                                                                                
           MOVE ACAT0F01-BRANCH             TO  ACAT1FIO-BRANCH                 
                                                ACAT2FIO-BRANCH                 
                                                ACAT3FIO-BRANCH                 
                                                ACAT4FIO-BRANCH.                
                                                                                
           MOVE ACAT0F01-ACCOUNT            TO  ACAT1FIO-ACCOUNT                
                                                ACAT2FIO-ACCOUNT                
                                                ACAT3FIO-ACCOUNT                
                                                ACAT4FIO-ACCOUNT.               
                                                                                
           MOVE ACAT0F01-ACCT-RR-CD         TO  ACAT1FIO-RR-NBR                 
                                                ACAT2FIO-RR-NBR                 
                                                ACAT3FIO-RR-NBR                 
                                                ACAT4FIO-RR-NBR.                
LRM003     MOVE ACAT0F01-CALL-RTN-PROGRAM   TO                                  
LRM003                                    ACAT1FIO-CALL-RTN-PROGRAM             
LRM003                                    ACAT2FIO-CALL-RTN-PROGRAM             
LRM003                                    ACAT3FIO-CALL-RTN-PROGRAM             
LRM003                                    ACAT4FIO-CALL-RTN-PROGRAM.            
                                                                                
           SET ACAT1FIO-FIRST-TIME          TO  TRUE.                           
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF1'                      TO  TRAN-ID.                        
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT1FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               RESP(RESPONSE-CODE)                              
           END-EXEC.                                                            
                                                                                
           SET ACAT2FIO-FIRST-TIME          TO  TRUE.                           
           MOVE 'AMF2'                      TO  TRAN-ID.                        
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT2FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               RESP(RESPONSE-CODE)                              
           END-EXEC.                                                            
                                                                                
           SET ACAT3FIO-FIRST-TIME          TO  TRUE.                           
           MOVE 'AMF3'                      TO  TRAN-ID.                        
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT3FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               RESP(RESPONSE-CODE)                              
           END-EXEC.                                                            
                                                                                
           SET ACAT4FIO-FIRST-TIME          TO  TRUE.                           
           MOVE 'AMF4'                      TO  TRAN-ID.                        
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT4FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               RESP(RESPONSE-CODE)                              
           END-EXEC.                                                            
                                                                                
           MOVE '1'                      TO  ACAT-AMFX-PROG-CODE.               
                                                                                
           PERFORM VALIDATE-FUNDSERV.                                           
                                                                                
           PERFORM GET-NA-INFO.                                                 
                                                                                
           PERFORM GET-B1-INFO.                                                 
                                                                                
           MOVE 'AXB1'                   TO  TRAN-ID.                           
           EXEC CICS DELETEQ TS QUEUE(WS-TS-NAME)                               
           END-EXEC.                                                            
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACATF-B1-NA-AREA)                           
                               ITEM(ITEM-NUMBER)                                
                               RESP(RESPONSE-CODE)                              
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ********************                                                      
       VALIDATE-FUNDSERV.                                                       
      ********************                                                      
                                                                                
           MOVE ACAT0F01-ISIN-SEC-ISSUE-CD  TO  MSDIO-SEARCH-KEY.               
           MOVE 'R'                         TO  MSDIO-ACCESS.                   
           MOVE SPACES                      TO  MSDIO-ACTION.                   
           MOVE '0'                         TO  MSDIO-WHEN-ISSUE.               
           MOVE SPACES                      TO  MSDIO-RETURN-CODE.              
                                                                                
           EXEC CICS LINK PROGRAM('MSDIO')                                      
                          COMMAREA(MSD-WORK-AREA)                               
           END-EXEC.                                                            
                                                                                
TRDEL      MOVE SPACES TO MSDIO-RETURN-CODE.                                    
           EVALUATE TRUE                                                        
              WHEN MSDIO-RETURN-CODE = SPACES                                   
                 MOVE MS-SYMBOL             TO  MSD-SYMBOL                      
              WHEN MSDIO-RETURN-CODE = 'A' OR 'B' OR 'C' OR 'D'                 
                 MOVE 'MSD FILE CLOSED'     TO  M0ERRMSGO                       
                 PERFORM SEND-MAP                                               
                 MOVE '9'                   TO  ACAT-AMFX-PROG-CODE             
                 PERFORM RETURN-TO-CICS                                         
              WHEN MSDIO-RETURN-CODE = 'I' OR 'J'                               
                 MOVE 'SECURITY NOT FOUND ON MSD FILE'                          
                                            TO  M0ERRMSGO                       
                 PERFORM SEND-MAP                                               
                 MOVE '9'                   TO  ACAT-AMFX-PROG-CODE             
                 PERFORM RETURN-TO-CICS                                         
              WHEN OTHER                                                        
                 MOVE 'MSD FILE IO ERROR'   TO  M0ERRMSGO                       
                 PERFORM SEND-MAP                                               
                 MOVE '9'                   TO  ACAT-AMFX-PROG-CODE             
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
      *    EXEC CICS HANDLE CONDITION INVREQ(INVERROR-MFMSD)                    
      *                               IOERR(IOERROR-MFMSD)                      
      *                               DISABLED(OPENERR-MFMSD)                   
      *                               NOTOPEN(OPENERR-MFMSD)                    
      *    END-EXEC.                                                            
                                                                                
      *    EXEC CICS IGNORE CONDITION NOTFND                                    
      *    END-EXEC.                                                            
                                                                                
           MOVE MSD-SYMBOL                  TO  MF-MSD-KEY.                     
           MOVE LOW-VALUES                  TO  SYMBOL.                         
           EXEC CICS  READ DATASET('MFMSD')                                     
                      INTO(MF-MSD-REC)                                          
                      RIDFLD(MF-MSD-KEY)                                        
                      KEYLENGTH(08)                                             
           END-EXEC.                                                            
                                                                                
TRDEL *    IF SYMBOL NOT = MSD-SYMBOL  OR                                       
UNCOMM*       NOT FUND-SERV-ELIGIBLE                                            
ENT TH*       MOVE 'SECURITY NOT FUND/SERV ELIGIBLE'                            
IS PIE*                                     TO  M0ERRMSGO                       
CE FOR*       PERFORM SEND-MAP                                                  
PRODUC*       MOVE '9'                      TO  ACAT-AMFX-PROG-CODE             
TION  *       PERFORM RETURN-TO-CICS                                            
      *    END-IF.                                                              
                                                                                
      *    EXEC CICS HANDLE CONDITION INVREQ(INVERROR-MFREG)                    
      *                               IOERR(IOERROR-MFREG)                      
      *                               DISABLED(OPENERR-MFREG)                   
      *                               NOTOPEN(OPENERR-MFREG)                    
      *    END-EXEC.                                                            
                                                                                
      *    EXEC CICS IGNORE CONDITION NOTFND                                    
      *    END-EXEC.                                                            
                                                                                
           MOVE ACAT-CLIENT-NO              TO  MF-REG-CLIENT.                  
           MOVE ACAT0F01-ISIN-SEC-ISSUE-CD  TO  MF-REG-CUSIP.                   
           EXEC CICS  READ DATASET('NTWREG')                                    
                      INTO(MF-REG-REC)                                          
                      RIDFLD(MF-REG-KEY)                                        
                      KEYLENGTH(18)                                             
           END-EXEC.                                                            
                                                                                
           IF ACAT-CLIENT-NO = CLIENT-NO  AND                                   
              ACAT0F01-ISIN-SEC-ISSUE-CD = CUSIP-9                              
              MOVE NTWK-LVL-3-REG-OPTION    TO  NTWREG-HOUSE-REG                
              IF REG-OP-HOUSE-ACCT > SPACES                                     
                 MOVE REG-OP-HOUSE-ACCT     TO  NTWREG-HOUSE-ACCT               
              ELSE                                                              
                 MOVE SPACES                TO  NTWREG-HOUSE-ACCT               
              END-IF                                                            
           ELSE                                                                 
              MOVE SPACES                   TO  NTWREG-HOUSE-REG                
              MOVE SPACES                   TO  NTWREG-HOUSE-ACCT               
           END-IF.                                                              
                                                                                
      *    EXEC CICS HANDLE CONDITION INVREQ(INVERROR)                          
      *                               IOERR(IOERROR)                            
      *                               DISABLED(OPENERR)                         
      *                               NOTOPEN(OPENERR)                          
      *    END-EXEC.                                                            
                                                                                
           EJECT                                                                
      **************                                                            
       GET-NA-INFO.                                                             
      **************                                                            
                                                                                
           MOVE LOW-VALUES             TO  RNAREAD-SENDING-PARAMETERS           
                                           RNAREAD-RECEIVING-PARAMETERS.        
           MOVE ACAT-CLIENT-NO (2:3)   TO  NAPPA-CL-N.                          
           MOVE NAPPA-CL               TO  RNAREAD-KEY-CLIENT.                  
           MOVE LOW-VALUES             TO  NAPPA-CL.                            
           MOVE ZEROS                  TO  RNAREAD-KEY-BRANCH1-2                
                                           RNAREAD-KEY-ACCOUNT1-5.              
           MOVE ACAT0F01-BRANCH        TO  RNAREAD-KEY-BRANCH3-5.               
           MOVE ACAT0F01-ACCOUNT       TO  RNAREAD-KEY-ACCOUNT6-10.             
           MOVE 'A '                   TO  RNAREAD-REQUESTED-SEG (1).           
           MOVE 'B '                   TO  RNAREAD-REQUESTED-SEG (2).           
           MOVE 'E '                   TO  RNAREAD-REQUESTED-SEG (3).           
                                                                                
           SET  RNAREAD-KEY-NEW-PP                                              
                RNAREAD-KEY-OTHER                                               
                RNAREAD-REQ-FUNC-READ                                           
                RNAREAD-REQ-FILE-EITHER     TO  TRUE.                           
                                                                                
           EXEC CICS LINK PROGRAM('RNAREAD')                                    
                          COMMAREA(RNAREAD-PARAMETERS)                          
                          LENGTH(LENGTH OF RNAREAD-PARAMETERS)                  
           END-EXEC.                                                            
                                                                                
           IF RNAREAD-RETURN-EIBRCODE NOT = '00'                                
              IF RNAREAD-RETURN-EIBRCODE = '0C' OR '0D'                         
                 MOVE 'NAFILE CLOSED OR DISABLED'                               
                                            TO  M0ERRMSGO                       
                 PERFORM SEND-MAP                                               
                 MOVE '9'                   TO  ACAT-AMFX-PROG-CODE             
                 PERFORM RETURN-TO-CICS                                         
              ELSE                                                              
                 IF (RNAREAD-RETURN-EIBRCODE = '81')                            
                    MOVE 'ACCOUNT NOT ON NAME/ADDRESS FILE'                     
                                            TO  M0ERRMSGO                       
                    PERFORM SEND-MAP                                            
                    MOVE '9'                TO  ACAT-AMFX-PROG-CODE             
                    PERFORM RETURN-TO-CICS                                      
                 ELSE                                                           
                    MOVE 'RNAREAD SYSTEM ERROR'                                 
                                            TO  M0ERRMSGO                       
                    PERFORM SEND-MAP                                            
                    MOVE '9'                TO  ACAT-AMFX-PROG-CODE             
                    PERFORM RETURN-TO-CICS                                      
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           PERFORM VARYING S1 FROM 1 BY 1 UNTIL S1 > 6                          
              IF NAPPB-NA-LINE (S1) NOT > SPACES                                
                 MOVE SPACES                   TO  NA-LINE (S1)                 
              ELSE                                                              
                 MOVE NAPPB-NA-LINE (S1)       TO  NA-LINE (S1)                 
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           MOVE NAPPA-IRA-KEOUGH-IND        TO  NA-IRA-VALUE.                   
                                                                                
           IF NAPPA-IRA-KEOUGH-IND > SPACE  AND                                 
537513        B1-INHOUSE-IRA = '1'                                              
              MOVE 'Y'                      TO  NA-IRA-IND                      
           ELSE                                                                 
              IF NAPPA-IRA-KEOUGH-IND = '1'                                     
                 MOVE  'Y'                  TO  NA-IRA-IND                      
              ELSE                                                              
                 MOVE SPACES                TO  NA-IRA-IND                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
           MOVE NAPPA-USA-WITHHOLD          TO  NA-WITHHOLD.                    
                                                                                
           IF NAPPA-SOC-SEC-TAX-ID1 NOT NUMERIC                                 
              MOVE  0                       TO  NA-SOC-SEC                      
           ELSE                                                                 
              MOVE NAPPA-SOC-SEC-TAX-ID1    TO  NA-SOC-SEC                      
           END-IF.                                                              
                                                                                
           MOVE NAPPA-USA-WITHHOLD          TO  NA-WITHHOLD.                    
                                                                                
           IF NAPPA-SOC-SEC-TAX-CODE1 = '1'                                     
              MOVE 'S'                      TO  NA-SOC-SEC-CD                   
           ELSE                                                                 
              IF NAPPA-SOC-SEC-TAX-CODE1 = '2'                                  
                 MOVE 'T'                   TO  NA-SOC-SEC-CD                   
              ELSE                                                              
                 MOVE ' '                   TO  NA-SOC-SEC-CD                   
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF NAPPA-MAIL-ADDR NOT = SPACE                                       
              IF NAPPA-MAIL-ADDR-N > 1                                          
                 COMPUTE WK-NAME-IND = NAPPA-MAIL-ADDR-N - 1                    
                 MOVE WK-NAME-IND           TO  NA-NAME-IND                     
              ELSE                                                              
                 MOVE 1                     TO  NA-NAME-IND                     
              END-IF                                                            
           ELSE                                                                 
              MOVE 1                        TO  NA-NAME-IND                     
           END-IF.                                                              
                                                                                
           IF NAPPA-ZIP-CODE (1:4) > SPACES                                     
              MOVE NAPPA-ZIP-CODE           TO  NA-ZIP                          
           ELSE                                                                 
              MOVE NAPPA-ZIP-CODE (5:5)     TO  NA-ZIP                          
           END-IF.                                                              
                                                                                
           EJECT                                                                
      **************                                                            
       GET-B1-INFO.                                                             
      **************                                                            
                                                                                
      *    EXEC CICS HANDLE CONDITION INVREQ(NOTFOUND-B1)                       
      *                               NOTOPEN(OPENERR-B1)                       
      *                               NOTFND(NOTFOUND-B1)                       
      *                               IOERR(IOERROR-B1)                         
      *                               DISABLED(OPENERR-B1)                      
      *    END-EXEC.                                                            
                                                                                
           MOVE 501359                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
                                                                                
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              IF B1-CARD-VALUE = '0'                                            
                 MOVE 'CLIENT NOT ELIGIBLE FOR ACAT FUND/SERV'                  
                                            TO  M0ERRMSGO                       
                 PERFORM SEND-MAP                                               
                 MOVE '9'                   TO  ACAT-AMFX-PROG-CODE             
                 PERFORM RETURN-TO-CICS                                         
               END-IF                                                           
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537513                      TO  B1-PRINT-CARD.                  
           PERFORM  READ-B1FILE.                                                
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE  B1-CARD-VALUE           TO  B1-INHOUSE-IRA                  
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE  537260                     TO  B1-PRINT-CARD.                  
           PERFORM  READ-B1FILE.                                                
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-CARD-VALUE            TO  B1-BOOK-OPTION                  
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537503                      TO  B1-PRINT-CARD.                  
           PERFORM  READ-B1FILE.                                                
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-CARD-VALUE            TO  B1-REG-SETUP-OPTION             
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537326                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-TIN-NO                TO  B1-TIN-537326                   
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537327                      TO  B1-PRINT-CARD.                  
           PERFORM  READ-B1FILE.                                                
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-TIN-NO                TO  B1-TIN-537327                   
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537328                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-TIN-NO                TO  B1-TIN-537328                   
           ELSE                                                                 
             PERFORM B1-IO-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE 537402                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-TIN-NO                TO  B1-TIN-537402                   
           ELSE                                                                 
             PERFORM B1-IO-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE 537532                      TO  B1-PRINT-CARD.                  
           PERFORM  READ-B1FILE.                                                
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-TIN-NO                TO  B1-TIN-537532                   
           ELSE                                                                 
             PERFORM B1-IO-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE 537533                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-TIN-NO                TO  B1-TIN-537533                   
           ELSE                                                                 
             PERFORM B1-IO-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE 537311                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537311                   
           ELSE                                                                 
             PERFORM B1-IO-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE 537312                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE  B1-REG-LINE             TO  B1-REG-537312                   
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537313                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537313                   
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537314                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537314                   
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537315                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537315                   
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537316                      TO  B1-PRINT-CARD.                  
           PERFORM  READ-B1FILE.                                                
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537316                   
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537317                      TO  B1-PRINT-CARD.                  
           PERFORM  READ-B1FILE.                                                
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537317                   
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537318                      TO  B1-PRINT-CARD.                  
           PERFORM  READ-B1FILE.                                                
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537318                   
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537534                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537534                   
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537535                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537535                   
           ELSE                                                                 
             PERFORM B1-IO-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE 537536                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537536                   
           ELSE                                                                 
             PERFORM B1-IO-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE 537537                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537537                   
           ELSE                                                                 
             PERFORM B1-IO-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE 537538                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537538                   
           ELSE                                                                 
             PERFORM B1-IO-ERROR-RTN                                            
           END-IF.                                                              
                                                                                
           MOVE 537539                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537539                   
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537540                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537540                   
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           MOVE 537541                      TO  B1-PRINT-CARD.                  
           PERFORM READ-B1FILE.                                                 
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-REG-LINE              TO  B1-REG-537541                   
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
      *    MOVE 501363                      TO  B1-PRINT-CARD.                  
           MOVE 434608                      TO  B1-PRINT-CARD.                  
           IF EIBRCODE = SPACE OR LOW-VALUES                                    
              MOVE B1-CARD-VALUE            TO  B1-CUST-ACCT-OPTION             
           ELSE                                                                 
              PERFORM B1-IO-ERROR-RTN                                           
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *****************                                                         
       B1-IO-ERROR-RTN.                                                         
      *****************                                                         
                                                                                
           MOVE 'B1 FILE: I/O ERROR'        TO  M0ERRMSGO.                      
                                                                                
           PERFORM SEND-MAP.                                                    
           MOVE '9'                         TO  ACAT-AMFX-PROG-CODE.            
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      **************                                                            
       READ-B1FILE.                                                             
      **************                                                            
                                                                                
           MOVE ACAT1FIO-CLIENT-NBR         TO  B1-PRINT-CLIENT                 
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
      ***************                                                           
       KEY-ROUTINE-1.                                                           
      ***************                                                           
                                                                                
           EVALUATE TRUE                                                        
              WHEN EIBAID = DFHPF11 OR DFHCLEAR                                 
                 PERFORM RETURN-CONTROL-RTN                                     
              WHEN EIBAID = DFHPF10 OR DFHPF12                                  
                 PERFORM RETURN-CONTROL-TO-MAIN                                 
              WHEN EIBAID = DFHPF1                                              
                 PERFORM XCTL-RECEIVER-REGISTRATION-1                           
              WHEN EIBAID = DFHPF2                                              
                 PERFORM XCTL-RECEIVER-REGISTRATION-2                           
              WHEN EIBAID = DFHPF3                                              
                 PERFORM XCTL-PIP-SWP                                           
              WHEN EIBAID = DFHPF4                                              
                 PERFORM XCTL-PAYABLES                                          
              WHEN OTHER                                                        
                 MOVE 'INVALID PF KEY'      TO  M0ERRMSGO                       
                 PERFORM SEND-MAP                                               
                 MOVE '0'                   TO  ACAT-AMFX-PROG-CODE             
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      ***************                                                           
       KEY-ROUTINE-2.                                                           
      ***************                                                           
                                                                                
           EVALUATE TRUE                                                        
              WHEN EIBAID = DFHPF11 OR DFHCLEAR                                 
                 PERFORM RETURN-CONTROL-RTN                                     
              WHEN EIBAID = DFHPF10 OR DFHPF12                                  
                 PERFORM RETURN-CONTROL-TO-MAIN                                 
              WHEN OTHER                                                        
                 MOVE 'FATAL ERROR WAS ENCOUNTERED - ONLY PF10 OR PF11 A        
      -               'RE AVAILABLE'        TO  M0ERRMSGO                       
                 PERFORM SEND-MAP                                               
                 MOVE '9'                   TO  ACAT-AMFX-PROG-CODE             
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      ******************************                                            
       XCTL-RECEIVER-REGISTRATION-1.                                            
      ******************************                                            
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT1FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE 'PROGRAM ACAT1FSC IS NOT AVAILABLE'                             
                                            TO  M0ERRMSGO.                      
                                                                                
           PERFORM SEND-MAP.                                                    
           MOVE '0'                         TO  ACAT-AMFX-PROG-CODE             
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ******************************                                            
       XCTL-RECEIVER-REGISTRATION-2.                                            
      ******************************                                            
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT2FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE 'PROGRAM ACAT2FSC IS NOT AVAILABLE'                             
                                            TO  M0ERRMSGO.                      
                                                                                
           PERFORM SEND-MAP.                                                    
           MOVE '0'                         TO  ACAT-AMFX-PROG-CODE             
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      **************                                                            
       XCTL-PIP-SWP.                                                            
      **************                                                            
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT3FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE 'PROGRAM ACAT3FSC IS NOT AVAILABLE'                             
                                            TO  M0ERRMSGO.                      
                                                                                
           PERFORM SEND-MAP.                                                    
           MOVE '0'                         TO  ACAT-AMFX-PROG-CODE.            
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ***************                                                           
       XCTL-PAYABLES.                                                           
      ***************                                                           
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT4FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE 'PROGRAM ACAT4FSC IS NOT AVAILABLE'                             
                                            TO  M0ERRMSGO.                      
                                                                                
           PERFORM SEND-MAP.                                                    
           MOVE '0'                         TO  ACAT-AMFX-PROG-CODE.            
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      **********                                                                
       SEND-MAP.                                                                
      **********                                                                
                                                                                
           PERFORM GET-DATE-AND-TIME.                                           
                                                                                
           MOVE -1                          TO  M0TRIDL.                        
           MOVE 'AMFX'                      TO  M0TRIDO.                        
           MOVE WSMMDDYY                    TO  M0DATEO.                        
           MOVE WSTIME                      TO  M0TIMEO.                        
                                                                                
           EXEC CICS SEND MAP('ACATF0M')                                        
                          MAPSET('ACATF0M')                                     
                          FROM(ACATF0MO)                                        
                          CURSOR                                                
                          ERASE                                                 
           END-EXEC.                                                            
                                                                                
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
                                                                                
           EXEC CICS XCTL PROGRAM ('RATT01')                                    
           END-EXEC.                                                            
                                                                                
           EXEC CICS RETURN                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ****************                                                          
       RETURN-TO-CICS.                                                          
      ****************                                                          
                                                                                
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
                                                                                
LRM004     MOVE EIBTRMID                 TO  TERM-ID.                           
LRM004     MOVE 'AMFX'                   TO  TRAN-ID.                           
LRM004     MOVE +1                       TO  ITEM-NUMBER.                       
LRM004                                                                          
LRM004     EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
LRM004                        INTO(ACAT0F01-COMMAREA)                           
LRM004                        ITEM(ITEM-NUMBER)                                 
LRM004     END-EXEC.                                                            
           PERFORM DELETE-ALL-TSQS.                                             
                                                                                
LRM003     IF ACAT0F01-CALL-RTN-PROGRAM = 'ACAT05RN'                            
LRM003        EXEC CICS XCTL PROGRAM('ACAT05RN')                                
LRM003                       COMMAREA(ACATCOMM-COMMAREA)                        
LRM003        END-EXEC                                                          
LRM003     ELSE                                                                 
           EXEC CICS XCTL PROGRAM('ACAT04RS')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE 'PROGRAM ACAT04RS IS NOT AVAILABLE'                             
                                            TO  M0ERRMSGO.                      
           PERFORM SEND-MAP.                                                    
           MOVE '9'                         TO  ACAT-AMFX-PROG-CODE.            
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ***********                                                               
       HANG-CICS.                                                               
      ***********                                                               
                                                                                
           GOBACK.                                                              
                                                                                
