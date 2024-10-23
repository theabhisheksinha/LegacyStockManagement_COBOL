000001* PDX    - ACAT3FSC C0263391 04/11/08 13:36:04 TBLAMUR            00001000
LRM004* SSR# 55766 ASCENDIS INTERFACE. ALLOW UPDATE FOR ASCENDIS USER,          
LRM004* WHEN HE WOULD HAVE HAD UPDATE AUTH BASED ON SNON IF NOT ASCEND.         
000001* PDX    - ACAT3FSC C0240631 11/14/06 10:42:47 TBLAMUR            00001000
000001* PDX    - ACAT3FSC C0228498 01/30/06 13:13:10 TBLAMUR            00001000
000001* PDX    - ACAT3FSC C0214488 12/08/04 11:59:48 TBLAMUR            00001000
LRM003* SSR 0039884 ALLOW LINK FROM E SCREEN AND RTN TO CALLER.                 
000001* PDX    - ACAT3FSC C0151771 02/23/01 11:16:29 TBDOJUN            00001000
000001* PDX    - ACAT3FSC C0120352 01/24/99 17:26:15 TBTARYB            00001000
000001* PDX    - ACAT3FSC C0119770 12/28/98 12:40:41 TBTARYB            00001000
000001* PDX    - ACAT3FSC C0118708 12/28/98 10:25:17 TBTARYB            00001000
000001* PDX    - ACAT3FSC C0113942 11/11/98 14:02:29 TBTARYB            00001000
000001* PDX    - ACAT3FSC C0117820 11/06/98 12:04:34 TBTARYB            00001000
000001* PDX    - ACAT3FSC C0113942 10/30/98 13:41:22 TBTARYB            00001000
      ******************************************************************        
       IDENTIFICATION DIVISION.                                                 
      ******************************************************************        
       PROGRAM-ID.    ACAT3FSC.                                                 
                                                                                
      *REMARKS.                                                                 
      ******************************************************************        
      * FUND/SERV: PORGRAM (XCTL'ED BY ACAT01FCP) DISPLAYS             *        
      *      -  "SWP/PIP" SCREEN.                                      *        
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
       77  TWA-SIZE                         PIC S9(4)  COMP.                    
       77  FIRST-TIME-SW                    PIC  X(01).                         
           88  FIRST-TIME                                VALUE 'Y'.             
           88  NOT-FIRST-TIME                            VALUE 'N'.             
       77  S1                               PIC  9(02)   VALUE ZEROES.          
       77  S2                               PIC  9(02)   VALUE ZEROES.          
       77  S3                               PIC  9(02)   VALUE ZEROES.          
       77  S4                               PIC  9(02)   VALUE ZEROES.          
       77  DSBMT-OPTION-SW                  PIC  X(01).                         
           88  DSBMT-OPTION-VALID                        VALUE 'V'.             
           88  DSBMT-OPTION-INVALID                      VALUE 'N'.             
       77  BANK-ACCT-SW                     PIC  X(01).                         
           88  BANK-ACCT-VALID                           VALUE 'V'.             
           88  BANK-ACCT-INVALID                         VALUE 'N'.             
       77  WS-CNTR                          PIC  9(02)   VALUE ZEROES.          
       77  INT-NUMERIC-SW                   PIC  X(01).                         
           88  INT-NUMERIC                               VALUE 'N'.             
           88  INT-NONNUMERIC                            VALUE 'A'.             
       77  DEC-NUMERIC-SW                   PIC  X(01).                         
           88  DEC-NUMERIC                               VALUE 'N'.             
           88  DEC-NONNUMERIC                            VALUE 'A'.             
       77  WS-PERIOD-SW                     PIC  X(01).                         
           88  WS-BEFORE-PERIOD                          VALUE 'B'.             
           88  WS-AFTER-PERIOD                           VALUE 'A'.             
       77  STOP-SW                          PIC  X(01).                         
           88  STOP-OK                                   VALUE 'Y'.             
           88  STOP-NOT-OK                               VALUE 'N'.             
       77  WS-MEANING-CNTR                  PIC  9(02)   VALUE ZEROES.          
       77  WS-INT-CNTR                      PIC  9(02)   VALUE ZEROES.          
       77  WS-FRAC-CNTR                     PIC  9(02)   VALUE ZEROES.          
                                                                                
       01  DSBMT-AMT-TABLE.                                                     
           05  DSBMT-AMT OCCURS 17 TIMES    PIC  X(01).                         
                                                                                
       01  FILLER                           PIC  X(20)   VALUE                  
           'DSBMT-AMT CONVERSION'.                                              
                                                                                
       01  FILLER.                                                              
           05  WS-DSBMT-AMT-COMP2           COMP-2.                             
           05  WS-DSBMT-AMT-0               PIC  9(14)V9(02).                   
           05  FILLER REDEFINES                                                 
               WS-DSBMT-AMT-0.                                                  
               10  WS-DSBMT-AMT-0-I         PIC  9(14).                         
               10  WS-DSBMT-AMT-0-F         PIC  9(02).                         
           05  WS-DSBMT-AMT-1               PIC  9(06)V9(10).                   
           05  FILLER REDEFINES                                                 
               WS-DSBMT-AMT-1.                                                  
               10  WS-DSBMT-AMT-1-I         PIC  9(06).                         
               10  WS-DSBMT-AMT-1-F         PIC  9(10).                         
           05  WS-DSBMT-AMT-2               PIC  9(12)V9(04).                   
           05  FILLER REDEFINES                                                 
               WS-DSBMT-AMT-2.                                                  
               10  WS-DSBMT-AMT-2-I         PIC  9(12).                         
               10  WS-DSBMT-AMT-2-F         PIC  9(04).                         
           05  WS-DSBMT-AMT-0-DISP          PIC ZZZZZZZZZZZZZ9.99.              
           05  WS-DSBMT-AMT-1-DISP          PIC ZZZZZ9.9999999999.              
           05  WS-DSBMT-AMT-2-DISP          PIC ZZZZZZZZZZZ9.9999.              
                                                                                
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
                                                                                
       01  WS-ROA-LOI-AMT.                                                      
           05  WS-ROA-LOI-AMT-INT           PIC  X(14).                         
           05  FILLER                       PIC  X(01)  VALUE '.'.              
           05  WS-ROA-LOI-AMT-FRAC          PIC  X(02).                         
                                                                                
       01  ERROR-MESSAGES.                                                      
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
           05  ERR-ACAT4FSC                 PIC  X(78)  VALUE                   
               'PROGRAM ACAT4FSC IS NOT AVAILABLE'.                             
                                                                                
           EJECT                                                                
           COPY ACATF3M.                                                        
                                                                                
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
           05  FILLER                       PIC  X(2000).                       
                                                                                
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
                                                                                
           MOVE DFHCOMMAREA                 TO  ACATCOMM-COMMAREA.              
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF3'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS                                                            
              ASSIGN TWALENG(TWA-SIZE)                                          
           END-EXEC.                                                            
                                                                                
           IF TWA-SIZE = ZERO                                                   
              MOVE LOW-VALUES                TO  ACATF3MO                       
              MOVE 'TWA SIZE EQUAL ZERO - PROGRAM CANNOT FUNCTION'              
                                             TO  M3ERRMSGO                      
              PERFORM WRITE-ACAT3FIO-COMMAREA                                   
              PERFORM SEND-MAP-ERASE                                            
              PERFORM RETURN-TO-CICS                                            
           END-IF.                                                              
                                                                                
           EXEC CICS                                                            
              ADDRESS TWA (ADDRESS OF TWA-AREA)                                 
           END-EXEC.                                                            
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT3FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *****************                                                         
       MAIN-PROCESSING.                                                         
      *****************                                                         
                                                                                
      *    IF  ACAT-PROGRAM-NAME = 'ACAT3FSC'                                   
      *        MOVE SPACES                  TO  ACAT-CALLING-PROG-NAME          
      *        PERFORM CONTINUE-PROCESSESING                                    
      *    ELSE                                                                 
      *        MOVE 'ACAT3FSC'              TO  ACAT-PROGRAM-NAME               
      *        PERFORM FIRST-TIME-RTN                                           
      *    END-IF.                                                              
                                                                                
           IF ACAT3FIO-FIRST-TIME                                               
              PERFORM FIRST-TIME-RTN                                            
           ELSE                                                                 
              PERFORM RECEIVE-MAP                                               
              EVALUATE ACAT3FIO-NSCC-PEND-CD                                    
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
           SET ACAT3FIO-NOT-FIRST-TIME      TO  TRUE.                           
           SET ACAT3FIO-READ-DATABASE       TO  TRUE.                           
                                                                                
           PERFORM LINK-TO-DB2.                                                 
           PERFORM PREPARE-FIELDS.                                              
           PERFORM FORMAT-MAP-OUTPUT.                                           
                                                                                
           EVALUATE ACAT3FIO-NSCC-PEND-CD                                       
              WHEN 'Y'                                                          
                 PERFORM PROTECT-ALL-FIELDS                                     
                 MOVE 'RECORD HAS ALREADY BEEN SENT TO NSCC - NO UPDATES        
      -               ' CAN BE DONE AT THIS TIME'                               
                                            TO  M3ERRMSGO                       
              WHEN 'A'                                                          
                 MOVE 'RECORD HAS BEEN ACKNOWLEDGED BY NSCC - UPDATES WI        
      -               'LL CAUSE RETRANSMISSION'                                 
                                             TO M3ERRMSGO                       
              WHEN OTHER                                                        
                 CONTINUE                                                       
           END-EVALUATE.                                                        
                                                                                
DJ0001     IF  ACAT-SIGN-ON-UPDATE                                              
LRM004     OR  ACAT-SIGN-ON-ASCENDIS-RSTRCT                                     
DJ0001         CONTINUE                                                         
DJ0001     ELSE                                                                 
DJ0001         PERFORM PROTECT-ALL-FIELDS                                       
DJ0001         MOVE '(BROWSE ONLY)'         TO  M3LITERO                        
DJ0001         MOVE ATT-PROT                TO  M3VALUEA                        
DJ0001     END-IF.                                                              
                                                                                
           PERFORM SEND-MAP-ERASE.                                              
                                                                                
           SET NOT-FIRST-TIME               TO  TRUE.                           
                                                                                
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       FORMAT-MAP-OUTPUT.                                                       
      *******************                                                       
                                                                                
           MOVE -1                          TO  M3EFFDATL.                      
           IF ACAT3FIO-SWP-PAC-EFFCT-DT = '00010101'                            
              MOVE SPACES                   TO  M3EFFDATO                       
                                                ACAT3FIO-M3EFFDAT               
           ELSE                                                                 
              MOVE ACAT3FIO-SWP-PAC-EFFCT-DT TO M3EFFDATO               00306001
                                                ACAT3FIO-M3EFFDAT               
           END-IF.                                                              
           MOVE ACAT3FIO-PAC-IND            TO  M3PACO                  00306101
                                                ACAT3FIO-M3PAC.                 
           MOVE ACAT3FIO-SWP-IND            TO  M3SWPO                  00306201
                                                ACAT3FIO-M3SWP.                 
           MOVE ACAT3FIO-RTRMT-TAX-CD       TO  M3TAXINDO               00308001
                                                ACAT3FIO-M3TAXIND.              
           EVALUATE ACAT3FIO-COST-BSS-CD                                        
              WHEN '1'                                                          
                 MOVE 'U'                   TO  M3COSTBSO                       
                                                ACAT3FIO-M3COSTBS               
              WHEN '2'                                                          
                 MOVE 'F'                   TO  M3COSTBSO                       
                                                ACAT3FIO-M3COSTBS               
              WHEN '3'                                                          
                 MOVE 'L'                   TO  M3COSTBSO                       
                                                ACAT3FIO-M3COSTBS               
              WHEN '4'                                                          
                 MOVE 'H'                   TO  M3COSTBSO                       
                                                ACAT3FIO-M3COSTBS               
              WHEN '5'                                                          
                 MOVE 'B'                   TO  M3COSTBSO                       
                                                ACAT3FIO-M3COSTBS               
              WHEN '6'                                                          
                 MOVE 'O'                   TO  M3COSTBSO                       
                                                ACAT3FIO-M3COSTBS               
           END-EVALUATE.                                                        
           MOVE ACAT3FIO-SHRHR-BNK-ACCT-NBR TO  M3BANKACO                       
                                                ACAT3FIO-M3BANKAC.              
           EVALUATE ACAT3FIO-SHRHR-BNK-TYPE-CD                                  
              WHEN '0'                                                          
                 MOVE 'C'                   TO  M3ACTYPEO                       
                                                ACAT3FIO-M3ACTYPE               
              WHEN '1'                                                          
                 MOVE 'S'                   TO  M3ACTYPEO                       
                                                ACAT3FIO-M3ACTYPE               
              WHEN '2'                                                          
                 MOVE 'O'                   TO  M3ACTYPEO                       
                                                ACAT3FIO-M3ACTYPE               
           END-EVALUATE.                                                        
           MOVE ACAT3FIO-ABA-ROUTING-NBR    TO  M3ABANBRO               00321002
                                                ACAT3FIO-M3ABANBR.              
           EVALUATE ACAT3FIO-DSBMT-OPTN-CD                                      
              WHEN '0'                                                          
                 MOVE 'C'                   TO  M3DSBOPTO                       
                                                ACAT3FIO-M3DSBOPT               
                 IF ACAT3FIO-DSBMT-AMT = ZEROES                                 
                   MOVE '             0.00' TO  M3DSBAMTO                       
                                                ACAT3FIO-M3DSBAMT               
                 ELSE                                                           
                   MOVE ACAT3FIO-DSBMT-AMT  TO  WS-DSBMT-AMT-0                  
                   MOVE WS-DSBMT-AMT-0      TO  WS-DSBMT-AMT-0-DISP             
                   MOVE WS-DSBMT-AMT-0-DISP TO  M3DSBAMTO                       
                                                ACAT3FIO-M3DSBAMT               
                 END-IF                                                         
              WHEN '1'                                                          
                 MOVE 'P'                   TO  M3DSBOPTO                       
                                                ACAT3FIO-M3DSBOPT               
                 IF ACAT3FIO-DSBMT-AMT = ZEROES                                 
                   MOVE '             0.00' TO  M3DSBAMTO                       
                                                ACAT3FIO-M3DSBAMT               
                 ELSE                                                           
                   MOVE ACAT3FIO-DSBMT-AMT  TO  WS-DSBMT-AMT-1                  
                   MOVE WS-DSBMT-AMT-1      TO  WS-DSBMT-AMT-1-DISP             
                   MOVE WS-DSBMT-AMT-1-DISP TO  M3DSBAMTO                       
                                                ACAT3FIO-M3DSBAMT               
                 END-IF                                                         
              WHEN '2'                                                          
                 MOVE 'S'                   TO  M3DSBOPTO                       
                                                ACAT3FIO-M3DSBOPT               
                 IF ACAT3FIO-DSBMT-AMT = ZEROES                                 
                   MOVE '             0.00' TO  M3DSBAMTO                       
                                                ACAT3FIO-M3DSBAMT               
                 ELSE                                                           
                   MOVE ACAT3FIO-DSBMT-AMT  TO  WS-DSBMT-AMT-2                  
                   MOVE WS-DSBMT-AMT-2      TO  WS-DSBMT-AMT-2-DISP             
                   MOVE WS-DSBMT-AMT-2-DISP TO  M3DSBAMTO                       
                                                ACAT3FIO-M3DSBAMT               
                 END-IF                                                         
              WHEN '3'                                                          
                 MOVE 'D'                   TO  M3DSBOPTO                       
                                                ACAT3FIO-M3DSBOPT               
                 IF ACAT3FIO-DSBMT-AMT = ZEROES                                 
                   MOVE '             0.00' TO  M3DSBAMTO                       
                                                ACAT3FIO-M3DSBAMT               
                 ELSE                                                           
                   MOVE ACAT3FIO-DSBMT-AMT  TO  WS-DSBMT-AMT-2                  
                   MOVE WS-DSBMT-AMT-2      TO  WS-DSBMT-AMT-2-DISP             
                   MOVE WS-DSBMT-AMT-2-DISP TO  M3DSBAMTO                       
                                                ACAT3FIO-M3DSBAMT               
                 END-IF                                                         
              WHEN OTHER                                                        
                 MOVE SPACES                TO  M3DSBOPTO                       
                                                M3DSBAMTO                       
                                                ACAT3FIO-M3DSBOPT               
                                                ACAT3FIO-M3DSBAMT               
           END-EVALUATE.                                                        
           MOVE ACAT3FIO-PYMNT-DT-CD        TO  M3DAYO                          
                                                ACAT3FIO-M3DAY.                 
           MOVE ACAT3FIO-PYMNT-JAN-IND      TO  M3JANO                  00340001
                                                ACAT3FIO-M3JAN.                 
           MOVE ACAT3FIO-PYMNT-FEB-IND      TO  M3FEBO                  00350001
                                                ACAT3FIO-M3FEB.                 
           MOVE ACAT3FIO-PYMNT-MAR-IND      TO  M3MARO                  00360001
                                                ACAT3FIO-M3MAR.                 
           MOVE ACAT3FIO-PYMNT-APR-IND      TO  M3APRO                  00370001
                                                ACAT3FIO-M3APR.                 
           MOVE ACAT3FIO-PYMNT-MAY-IND      TO  M3MAYO                  00380001
                                                ACAT3FIO-M3MAY.                 
           MOVE ACAT3FIO-PYMNT-JUN-IND      TO  M3JUNO                  00390001
                                                ACAT3FIO-M3JUN.                 
           MOVE ACAT3FIO-PYMNT-JUL-IND      TO  M3JULO                  00400001
                                                ACAT3FIO-M3JUL.                 
           MOVE ACAT3FIO-PYMNT-AUG-IND      TO  M3AUGO                  00410001
                                                ACAT3FIO-M3AUG.                 
           MOVE ACAT3FIO-PYMNT-SEP-IND      TO  M3SEPO                  00420001
                                                ACAT3FIO-M3SEP.                 
           MOVE ACAT3FIO-PYMNT-OCT-IND      TO  M3OCTO                  00430001
                                                ACAT3FIO-M3OCT.                 
           MOVE ACAT3FIO-PYMNT-NOV-IND      TO  M3NOVO                  00440001
                                                ACAT3FIO-M3NOV.                 
           MOVE ACAT3FIO-PYMNT-DEC-IND      TO  M3DECO                  00450001
                                                ACAT3FIO-M3DEC.                 
           IF ACAT3FIO-CHCK-FRST-DT = '00010101'                                
              MOVE SPACES                   TO  M3FRSTCKO                       
                                                ACAT3FIO-M3FRSTCK               
           ELSE                                                                 
              MOVE ACAT3FIO-CHCK-FRST-DT    TO  M3FRSTCKO               00460001
                                                ACAT3FIO-M3FRSTCK               
           END-IF.                                                              
                                                                                
           MOVE 'UNDO CHANGES:'             TO  M3LITERO.                       
           MOVE ' '                         TO  M3VALUEO.                       
                                                                                
           EJECT                                                                
      ******************                                                        
       BASIC-PROCESSING.                                                        
      ******************                                                        
                                                                                
           IF M3LITERI = 'UNDO CHANGES:'                                        
              PERFORM CHECK-FOR-UPDATES                                         
              IF ACAT3FIO-UPDATE-DATABASE                                       
                 PERFORM UNDO-CHANGES-VALIDATION                                
                 IF M3VALUEI = ' '                                              
                    PERFORM PREPARE-FIELDS                                      
                    PERFORM DATA-VALIDATION                                     
                    IF M3ERRMSGO = SPACES OR LOW-VALUES                         
                       IF EIBAID = DFHENTER                                     
                          PERFORM XCTL-RTN                                      
                       ELSE                                                     
                          MOVE '     CONFIRM:' TO M3LITERO                      
                          MOVE -1              TO M3VALUEL                      
                       MOVE 'YOU ARE ABOUT TO UPDATE THE DATABASE - PLEA        
      -                     'SE CONFIRM WITH Y, OR REJECT WITH N'               
                                            TO  M3ERRMSGO                       
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
                    MOVE SPACES                TO  M3ERRMSGO                    
                                                   M3VALUEO                     
                 END-IF                                                         
                 PERFORM XCTL-RTN                                               
              END-IF                                                            
           ELSE                                                                 
              IF M3LITERI = '     CONFIRM:'                                     
                 PERFORM CONFIRMATION-VALIDATION                                
                 IF M3VALUEI = 'Y'                                              
                    IF ACAT3FIO-NSCC-PEND-CD = 'A'                              
                       MOVE ' '                TO  ACAT3FIO-NSCC-PEND-CD        
                    END-IF                                                      
                    PERFORM LINK-TO-DB2                                         
                    PERFORM FORMAT-MAP-OUTPUT                                   
                 ELSE                                                           
                    IF EIBAID = DFHENTER                                        
                       PERFORM FIRST-TIME-RTN                                   
                    END-IF                                                      
                 END-IF                                                         
                 MOVE SPACES                   TO  M3ERRMSGO                    
                                                   M3VALUEO                     
                 MOVE 'UNDO CHANGES:'          TO  M3LITERO                     
                 PERFORM XCTL-RTN                                               
              ELSE                                                              
                 PERFORM XCTL-RTN                                               
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       CHECK-FOR-UPDATES.                                                       
      *******************                                                       
                                                                                
           IF M3EFFDATI NOT = ACAT3FIO-M3EFFDAT  OR                             
              M3PACI    NOT = ACAT3FIO-M3PAC     OR                             
              M3SWPI    NOT = ACAT3FIO-M3SWP     OR                             
              M3TAXINDI NOT = ACAT3FIO-M3TAXIND  OR                             
              M3COSTBSI NOT = ACAT3FIO-M3COSTBS  OR                             
              M3BANKACI NOT = ACAT3FIO-M3BANKAC  OR                             
              M3ACTYPEI NOT = ACAT3FIO-M3ACTYPE  OR                             
              M3ABANBRI NOT = ACAT3FIO-M3ABANBR  OR                             
              M3DSBOPTI NOT = ACAT3FIO-M3DSBOPT  OR                             
              M3DSBAMTI NOT = ACAT3FIO-M3DSBAMT  OR                             
              M3DAYI    NOT = ACAT3FIO-M3DAY     OR                             
              M3JANI    NOT = ACAT3FIO-M3JAN     OR                             
              M3FEBI    NOT = ACAT3FIO-M3FEB     OR                             
              M3MARI    NOT = ACAT3FIO-M3MAR     OR                             
              M3APRI    NOT = ACAT3FIO-M3APR     OR                             
              M3MAYI    NOT = ACAT3FIO-M3MAY     OR                             
              M3JUNI    NOT = ACAT3FIO-M3JUN     OR                             
              M3JULI    NOT = ACAT3FIO-M3JUL     OR                             
              M3AUGI    NOT = ACAT3FIO-M3AUG     OR                             
              M3SEPI    NOT = ACAT3FIO-M3SEP     OR                             
              M3OCTI    NOT = ACAT3FIO-M3OCT     OR                             
              M3NOVI    NOT = ACAT3FIO-M3NOV     OR                             
              M3DECI    NOT = ACAT3FIO-M3DEC     OR                             
              M3FRSTCKI NOT = ACAT3FIO-M3FRSTCK                                 
              SET ACAT3FIO-UPDATE-DATABASE  TO  TRUE                            
           ELSE                                                                 
              MOVE 'N'                 TO  ACAT3FIO-READ-UPDATE-DATABASE        
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ************************                                                  
       UNDO-CHANGES-VALIDATION.                                                 
      ************************                                                  
                                                                                
           EVALUATE TRUE                                                        
              WHEN M3VALUEI = (' ' OR 'Y')                                      
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 MOVE 'UNDO CHANGES FIELD SHOULD BE BLANK TO CONTINUE, O        
      -               'R Y TO STOP AND UNDO CHANGES'                            
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3VALUEL                           
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *************************                                                 
       CONFIRMATION-VALIDATION.                                                 
      *************************                                                 
                                                                                
           EVALUATE TRUE                                                        
              WHEN M3VALUEI = ('Y' OR 'N')                                      
                 CONTINUE                                                       
              WHEN OTHER                                                        
                 MOVE 'CONFIRMATION FIELD CAN BE ONLY Y OR N'                   
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3VALUEL                           
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      ****************                                                          
       SEND-MAP-ERASE.                                                          
      ****************                                                          
                                                                                
           PERFORM GET-DATE-AND-TIME.                                           
                                                                                
           MOVE 'AMFX'                      TO  M3TRIDO.                        
           MOVE WSMMDDYY                    TO  M3DATEO.                        
           MOVE WSTIME                      TO  M3TIMEO.                        
                                                                                
           EXEC CICS SEND MAP('ACATF3M')                                        
                          MAPSET('ACATF3M')                                     
                          FROM(ACATF3MO)                                        
                          CURSOR                                                
                          ERASE                                                 
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *******************                                                       
       SEND-MAP-DATAONLY.                                                       
      *******************                                                       
                                                                                
           PERFORM GET-DATE-AND-TIME.                                           
           MOVE 'AMFX'                      TO  M3TRIDO.                        
           MOVE WSMMDDYY                    TO  M3DATEO.                        
           MOVE WSTIME                      TO  M3TIMEO.                        
                                                                                
           EXEC CICS SEND MAP('ACATF3M')                                        
                          MAPSET('ACATF3M')                                     
                          FROM(ACATF3MO)                                        
                          DATAONLY                                              
                          CURSOR                                                
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *************                                                             
       RECEIVE-MAP.                                                             
      *************                                                             
                                                                                
           MOVE LOW-VALUES                  TO  ACATF3MI.                       
                                                                                
           EXEC CICS  RECEIVE MAP('ACATF3M')                                    
                              MAPSET('ACATF3M')                                 
                              INTO(ACATF3MI)                                    
           END-EXEC.                                                            
                                                                                
                                                                                
           EJECT                                                                
      *****************                                                         
       DATA-VALIDATION.                                                         
      *****************                                                         
                                                                                
           MOVE SPACES                      TO  M3ERRMSGO.                      
                                                                                
           IF M3FRSTCKI = SPACES OR LOW-VALUES OR ZEROES                        
              MOVE '00010101'            TO  ACAT3FIO-CHCK-FRST-DT              
           ELSE                                                                 
              IF M3FRSTCKI NOT NUMERIC                                          
                 MOVE 'FIRST CHECK DATE MUST BE NUMERIC IN CCYYMMDD FORM        
      -               'AT'               TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3FRSTCKL                          
                 MOVE ATT-UNPROT-BRT-MDT TO  M3FRSTCKA                          
              ELSE                                                              
                 IF M3FRSTCKI (1:2) < 19 OR > 20                                
                    MOVE 'FIRST CHECK DATE HAS WRONG CENTURY'                   
                                         TO  M3ERRMSGO                          
                    MOVE -1              TO  M3FRSTCKL                          
                    MOVE ATT-UNPROT-BRT-MDT TO  M3FRSTCKA                       
                 ELSE                                                           
                    IF M3FRSTCKI (5:2) > 12                                     
                       MOVE 'FIRST CHECK DATE HAS WRONG MONTH'                  
                                         TO  M3ERRMSGO                          
                       MOVE -1           TO  M3FRSTCKL                          
                       MOVE ATT-UNPROT-BRT-MDT TO M3FRSTCKA                     
                    ELSE                                                        
                       IF M3FRSTCKI (7:2) > 31                                  
                          MOVE 'FIRST CHECK DATE HAS WRONG DAY'                 
                                         TO  M3ERRMSGO                          
                          MOVE -1        TO  M3FRSTCKL                          
                          MOVE ATT-UNPROT-BRT-MDT TO M3FRSTCKA                  
                       ELSE                                                     
                          MOVE M3FRSTCKI TO  ACAT3FIO-CHCK-FRST-DT              
                       END-IF                                                   
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3DECI = SPACES OR LOW-VALUES                                     
              MOVE SPACES               TO  ACAT3FIO-PYMNT-DEC-IND              
           ELSE                                                                 
              IF M3DECI = ('N' OR 'Y')                                          
                 MOVE M3DECI            TO  ACAT3FIO-PYMNT-DEC-IND              
              ELSE                                                              
                 MOVE 'DECEMBER INDICATOR MUST BE Y OR N OR BLANK'              
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3DECL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M3DECA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3NOVI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT3FIO-PYMNT-NOV-IND             
           ELSE                                                                 
              IF M3NOVI = ('N' OR 'Y')                                          
                 MOVE M3NOVI             TO  ACAT3FIO-PYMNT-NOV-IND             
              ELSE                                                              
                 MOVE 'NOVEMBER INDICATOR MUST BE Y OR N OR BLANK'              
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3NOVL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M3NOVA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3OCTI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT3FIO-PYMNT-OCT-IND             
           ELSE                                                                 
              IF M3OCTI = ('N' OR 'Y')                                          
                 MOVE M3OCTI             TO  ACAT3FIO-PYMNT-OCT-IND             
              ELSE                                                              
                 MOVE 'OCTOBER INDICATOR MUST BE Y OR N OR BLANK'               
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3OCTL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M3OCTA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3SEPI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT3FIO-PYMNT-SEP-IND             
           ELSE                                                                 
              IF M3SEPI = ('N' OR 'Y')                                          
                 MOVE M3SEPI             TO  ACAT3FIO-PYMNT-SEP-IND             
              ELSE                                                              
                 MOVE 'SEPTEMBER INDICATOR MUST BE Y OR N OR BLANK'             
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3SEPL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M3SEPA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3AUGI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT3FIO-PYMNT-AUG-IND             
           ELSE                                                                 
              IF M3AUGI = ('N' OR 'Y')                                          
                 MOVE M3AUGI             TO  ACAT3FIO-PYMNT-AUG-IND             
              ELSE                                                              
                 MOVE 'AUGUST INDICATOR MUST BE Y OR N OR BLANK'                
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3AUGL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M3AUGA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3JULI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT3FIO-PYMNT-JUL-IND             
           ELSE                                                                 
              IF M3JULI = ('N' OR 'Y')                                          
                 MOVE M3JULI             TO  ACAT3FIO-PYMNT-JUL-IND             
              ELSE                                                              
                 MOVE 'JULY INDICATOR MUST BE Y OR N OR BLANK'                  
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3JULL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M3JULA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3JUNI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT3FIO-PYMNT-JUN-IND             
           ELSE                                                                 
              IF M3JUNI = ('N' OR 'Y')                                          
                 MOVE M3JUNI             TO  ACAT3FIO-PYMNT-JUN-IND             
              ELSE                                                              
                 MOVE 'JUNE INDICATOR MUST BE Y OR N OR BLANK'                  
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3JUNL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M3JUNA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3MAYI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT3FIO-PYMNT-MAY-IND             
           ELSE                                                                 
              IF M3MAYI = ('N' OR 'Y')                                          
                 MOVE M3MAYI             TO  ACAT3FIO-PYMNT-MAY-IND             
              ELSE                                                              
                 MOVE 'MAY INDICATOR MUST BE Y OR N OR BLANK'                   
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3MAYL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M3MAYA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3APRI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT3FIO-PYMNT-APR-IND             
           ELSE                                                                 
              IF M3APRI = ('N' OR 'Y')                                          
                 MOVE M3APRI             TO  ACAT3FIO-PYMNT-APR-IND             
              ELSE                                                              
                 MOVE 'APRIL INDICATOR MUST BE Y OR N OR BLANK'                 
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3APRL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M3APRA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3MARI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT3FIO-PYMNT-MAR-IND             
           ELSE                                                                 
              IF M3MARI = ('N' OR 'Y')                                          
                 MOVE M3MARI             TO  ACAT3FIO-PYMNT-MAR-IND             
              ELSE                                                              
                 MOVE 'MARCH IDICATOR MUST BE Y OR N OR BLANK'                  
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3MARL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M3MARA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3FEBI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT3FIO-PYMNT-FEB-IND             
           ELSE                                                                 
              IF M3FEBI = ('N' OR 'Y')                                          
                 MOVE M3FEBI             TO  ACAT3FIO-PYMNT-FEB-IND             
              ELSE                                                              
                 MOVE 'FEBRUARY INDICATOR MUST BE Y OR N OR BLANK'              
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3FEBL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M3FEBA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3JANI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT3FIO-PYMNT-JAN-IND             
           ELSE                                                                 
              IF M3JANI = ('N' OR 'Y')                                          
                 MOVE M3JANI             TO  ACAT3FIO-PYMNT-JAN-IND             
              ELSE                                                              
                 MOVE 'JANUARY INDICATOR MUST BE  Y OR N OR BLANK'              
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3JANL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M3JANA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF (M3DAYI < 32) OR                                                  
              (M3DAYI = (' N' OR ' L' OR 'L ' OR 'N '))                         
              MOVE M3DAYI                TO  ACAT3FIO-PYMNT-DT-CD               
           ELSE                                                                 
              MOVE 'DAY SHOULD BE 01 THRU 31, L OR N'                           
                                         TO  M3ERRMSGO                          
              MOVE -1                    TO  M3DAYL                             
              MOVE ATT-UNPROT-BRT-MDT    TO  M3DAYA                             
           END-IF.                                                              
                                                                                
           SET DSBMT-OPTION-VALID           TO  TRUE.                           
           IF M3DSBOPTI = SPACES OR LOW-VALUES                                  
              MOVE SPACES                TO  ACAT3FIO-DSBMT-OPTN-CD             
           ELSE                                                                 
              EVALUATE M3DSBOPTI                                                
                 WHEN 'C'                                                       
                    MOVE '0'             TO  ACAT3FIO-DSBMT-OPTN-CD             
                 WHEN 'P'                                                       
                    MOVE '1'             TO  ACAT3FIO-DSBMT-OPTN-CD             
                 WHEN 'S'                                                       
                    MOVE '2'             TO  ACAT3FIO-DSBMT-OPTN-CD             
                 WHEN 'D'                                                       
                    MOVE '3'             TO  ACAT3FIO-DSBMT-OPTN-CD             
                 WHEN OTHER                                                     
                   MOVE 'DISBURSMENT OPTION MUST BE C, P, S, D OR BLANK'        
                                            TO  M3ERRMSGO                       
                    MOVE -1                 TO  M3DSBOPTL                       
                    MOVE ATT-UNPROT-BRT-MDT TO  M3DSBOPTA                       
                    SET DSBMT-OPTION-INVALID TO TRUE                            
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
           IF DSBMT-OPTION-VALID                                                
              IF M3DSBOPTI = SPACES OR LOW-VALUES                               
                 MOVE ZEROES                 TO  ACAT3FIO-DSBMT-AMT             
                 MOVE '             0.00'    TO  M3DSBAMTO                      
                 IF M3DSBAMTI = SPACES OR LOW-VALUES OR                         
                    '             0.00'                                         
                    CONTINUE                                                    
                 ELSE                                                           
                    MOVE 'NO DISBURMENT OPTION ENTERED - DISBURSMENT AMO        
      -                  'UNT IS ZEROED OUT' TO  M3ERRMSGO                      
                    MOVE -1                  TO  M3DSBAMTL                      
                    MOVE ATT-UNPROT-BRT-MDT  TO  M3DSBAMTA                      
                 END-IF                                                         
              ELSE                                                              
                 IF M3DSBAMTI = SPACES OR LOW-VALUES                            
                    MOVE 'DISBURSMENT OPTION IS ENTERED - ENTER THE DISB        
      -                  'URSMENT AMOUNT'    TO  M3ERRMSGO                      
                    MOVE -1                  TO  M3DSBAMTL                      
                    MOVE ATT-UNPROT-BRT-MDT  TO  M3DSBAMTA                      
                 ELSE                                                           
                    IF M3DSBAMTI = '0'                                          
                       MOVE ZERO           TO  ACAT3FIO-DSBMT-AMT               
                       MOVE '             0.00' TO  M3DSBAMTO                   
                    ELSE                                                        
                    INSPECT M3DSBAMTI REPLACING ALL SPACES BY ZEROES            
                    INSPECT M3DSBAMTI TALLYING WS-CNTR FOR ALL '.'              
                    EVALUATE WS-CNTR                                            
                       WHEN 0                                                   
                          MOVE 'DISBURSMENT AMOUNT MUST HAVE A PERIOD'          
                                            TO  M3ERRMSGO                       
                          MOVE -1           TO  M3DSBAMTL                       
                          MOVE ATT-UNPROT-BRT-MDT TO M3DSBAMTA                  
                       WHEN 1                                                   
                          CONTINUE                                              
                       WHEN OTHER                                               
                         MOVE 'DISBURSMENT AMOUNT CAN HAVE ONLY ONE PERI        
      -                       'OD'          TO  M3ERRMSGO                       
                         MOVE -1            TO  M3DSBAMTL                       
                         MOVE ATT-UNPROT-BRT-MDT TO M3DSBAMTA                   
                    END-EVALUATE                                                
                    IF WS-CNTR = 1                                              
                       PERFORM INSPECT-M3DSBAMTI                                
                       IF STOP-NOT-OK                                           
                          EVALUATE M3DSBOPTI                                    
                             WHEN 'C'                                           
                                PERFORM EDIT-OPTION-C                           
                             WHEN 'P'                                           
                                PERFORM EDIT-OPTION-P                           
                             WHEN 'S'                                           
                                PERFORM EDIT-OPTION-S                           
                             WHEN 'D'                                           
******* OPTION 'D' HAS THE SAME FORMAT AS OPTION 'S'                            
                                PERFORM EDIT-OPTION-S                           
                       END-EVALUATE                                             
                    END-IF                                                      
                    END-IF                                                      
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF ACAT3FIO-PYBL-INFO-CD = '2'                                       
              IF M3ABANBRI = SPACES OR LOW-VALUES OR ZEROES                     
                 MOVE 'ABA ROUT. NUMBER IS REQUIRED, WHEN PAYABLE IN FO.        
      -               ' IND. IS ACH'     TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3ABANBRL                          
                 MOVE ATT-UNPROT-BRT-MDT TO  M3ABANBRA                          
              ELSE                                                              
                 IF M3ABANBRI NUMERIC                                           
                    MOVE M3ABANBRI       TO  ACAT3FIO-ABA-ROUTING-NBR           
                 ELSE                                                           
                    MOVE 'ABA ROUTING NUMBER MUST BE NUMERIC'                   
                                         TO  M3ERRMSGO                          
                    MOVE -1              TO  M3ABANBRL                          
                    MOVE ATT-UNPROT-BRT-MDT TO  M3ABANBRA                       
                 END-IF                                                         
              END-IF                                                            
           ELSE                                                                 
              IF M3ABANBRI = SPACES OR LOW-VALUES OR ZEROES                     
                 MOVE SPACES              TO ACAT3FIO-ABA-ROUTING-NBR           
                                             M3ABANBRO                          
              ELSE                                                              
                 IF M3ABANBRI NUMERIC                                           
                    MOVE M3ABANBRI       TO  ACAT3FIO-ABA-ROUTING-NBR           
                 ELSE                                                           
                    MOVE 'ABA ROUTING NUMBER MUST BE NUMERIC'                   
                                         TO  M3ERRMSGO                          
                    MOVE -1              TO  M3ABANBRL                          
                    MOVE ATT-UNPROT-BRT-MDT TO  M3ABANBRA                       
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           SET BANK-ACCT-VALID            TO  TRUE.                             
           IF ACAT3FIO-PYBL-INFO-CD = '2'                                       
              IF M3BANKACI = SPACES OR LOW-VALUES OR ZEROES                     
                 MOVE SPACES           TO ACAT3FIO-SHRHR-BNK-ACCT-NBR           
                 MOVE SPACES           TO  M3BANKACO                            
              ELSE                                                              
                 MOVE M3BANKACI        TO ACAT3FIO-SHRHR-BNK-ACCT-NBR           
              END-IF                                                            
           ELSE                                                                 
              IF M3BANKACI = SPACES OR LOW-VALUES OR ZEROES                     
                 MOVE SPACES           TO ACAT3FIO-SHRHR-BNK-ACCT-NBR           
              ELSE                                                              
                 MOVE 'SHAREHOLDER BANK ACCOUNT IS SPACED OUT, BECAUSE P        
      -               'AYABLE INFO. IND. IS ACH'                                
                                       TO M3ERRMSGO                             
                 MOVE -1               TO M3BANKACL                             
                 MOVE SPACES           TO ACAT3FIO-SHRHR-BNK-ACCT-NBR           
                                          M3BANKACO                             
                 MOVE ATT-UNPROT-BRT-MDT TO M3BANKACA                           
                 SET BANK-ACCT-INVALID   TO TRUE                                
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF BANK-ACCT-VALID                                                   
              IF M3BANKACI = SPACES OR LOW-VALUES OR ZEROES                     
                 IF M3ACTYPEI = SPACES OR LOW-VALUES                            
                    MOVE SPACES           TO  ACAT3FIO-SHRHR-BNK-TYPE-CD        
                 ELSE                                                           
                    MOVE 'SHAREHOLDER BANK ACCT. TYPE IS SPACED OUT, BEC        
      -                  'UASE ACCT. IS BLANK'                                  
                                          TO  M3ERRMSGO                         
                    MOVE -1               TO  M3ACTYPEL                         
                    MOVE SPACES           TO  ACAT3FIO-SHRHR-BNK-TYPE-CD        
                                              M3ACTYPEO                         
                    MOVE ATT-UNPROT-BRT-MDT TO M3ACTYPEA                        
                 END-IF                                                         
              ELSE                                                              
                 IF M3ACTYPEI = SPACES OR LOW-VALUES                            
                    MOVE 'SHAREHOLDER BANK ACCT. TYPE IS REQUIRED, WHEN         
      -                  'ACCOUNT IS ENTERED'                                   
                                            TO  M3ERRMSGO                       
                    MOVE -1                 TO  M3ACTYPEL                       
                    MOVE ATT-UNPROT-BRT-MDT TO  M3ACTYPEA                       
                 ELSE                                                           
                    EVALUATE M3ACTYPEI                                          
                       WHEN 'C'                                                 
                          MOVE '0'         TO ACAT3FIO-SHRHR-BNK-TYPE-CD        
                       WHEN 'S'                                                 
                          MOVE '1'         TO ACAT3FIO-SHRHR-BNK-TYPE-CD        
                       WHEN 'O'                                                 
                          MOVE '2'         TO ACAT3FIO-SHRHR-BNK-TYPE-CD        
                       WHEN OTHER                                               
                          MOVE 'ACCOUNT TYPE MUST BE C, S OR O'                 
                                           TO  M3ERRMSGO                        
                          MOVE -1          TO  M3ACTYPEL                        
                          MOVE ATT-UNPROT-BRT-MDT TO M3ACTYPEA                  
                    END-EVALUATE                                                
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3COSTBSI = SPACES OR LOW-VALUES                                  
              MOVE SPACES                 TO  ACAT3FIO-COST-BSS-CD              
           ELSE                                                                 
              EVALUATE M3COSTBSI                                                
                 WHEN 'U'                                                       
                    MOVE '1'              TO  ACAT3FIO-COST-BSS-CD              
                 WHEN 'F'                                                       
                    MOVE '2'              TO  ACAT3FIO-COST-BSS-CD              
                 WHEN 'L'                                                       
                    MOVE '3'              TO  ACAT3FIO-COST-BSS-CD              
                 WHEN 'H'                                                       
                    MOVE '4'              TO  ACAT3FIO-COST-BSS-CD              
                 WHEN 'B'                                                       
                    MOVE '5'              TO  ACAT3FIO-COST-BSS-CD              
                 WHEN 'O'                                                       
                    MOVE '6'              TO  ACAT3FIO-COST-BSS-CD              
                 WHEN OTHER                                                     
                    MOVE 'COST BASIS MUST BE U, F, L, H, B, O OR BLANK'         
                                          TO  M3ERRMSGO                         
                    MOVE -1               TO  M3COSTBSL                         
                    MOVE ATT-UNPROT-BRT-MDT TO  M3COSTBSA                       
              END-EVALUATE                                                      
           END-IF.                                                              
                                                                                
           IF M3TAXINDI = SPACES OR LOW-VALUES                                  
              MOVE 'RETIREMENT TAX CODE IS REQUIRED'                            
                                         TO  M3ERRMSGO                          
              MOVE -1                    TO  M3TAXINDL                          
           ELSE                                                                 
              IF M3TAXINDI = ('01' OR '02' OR '03' OR '04' OR                   
                              '05' OR '06' OR '07' OR '08' OR                   
                              '09' OR '10' OR '11' OR '99')                     
                 MOVE M3TAXINDI          TO  ACAT3FIO-RTRMT-TAX-CD              
              ELSE                                                              
                MOVE 'TAX INDICATOR MUST BE 01 THRU 09, 10, 11 OR 99'           
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3TAXINDL                          
                 MOVE ATT-UNPROT-BRT-MDT TO  M3TAXINDA                          
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3SWPI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT3FIO-SWP-IND                   
           ELSE                                                                 
              IF M3SWPI = ('Y' OR 'N')                                          
                 MOVE M3SWPI             TO  ACAT3FIO-SWP-IND                   
              ELSE                                                              
                 MOVE 'SWP INDICATOR MUST BE Y, N OR BLANK'                     
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3SWPL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M3SWPA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3PACI = SPACES OR LOW-VALUES                                     
              MOVE SPACES                TO  ACAT3FIO-PAC-IND                   
           ELSE                                                                 
              IF M3PACI = ('Y' OR 'N')                                          
                 MOVE M3PACI             TO  ACAT3FIO-PAC-IND                   
              ELSE                                                              
                 MOVE 'PAC INDICATOR MUST BE Y OR N OR BLANK'                   
                                         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3PACL                             
                 MOVE ATT-UNPROT-BRT-MDT TO  M3PACA                             
              END-IF                                                            
           END-IF.                                                              
                                                                                
           IF M3EFFDATI = SPACES OR LOW-VALUES OR ZEROES                        
              MOVE '00010101'            TO ACAT3FIO-SWP-PAC-EFFCT-DT           
           ELSE                                                                 
              IF M3EFFDATI NOT NUMERIC                                          
                 MOVE 'SWP/PAC EFFECTIVE DATE MUST BE NUMERIC IN CCYYMMD        
      -               'D FORMAT'         TO  M3ERRMSGO                          
                 MOVE -1                 TO  M3EFFDATL                          
                 MOVE ATT-UNPROT-BRT-MDT TO  M3EFFDATA                          
              ELSE                                                              
                 IF M3EFFDATI (1:2)  < 19 OR > 20                       00306001
                    MOVE 'SWP/PAC EFFECTIVE DATE HAS WRONG CENTURY'             
                                         TO  M3ERRMSGO                  00306101
                    MOVE -1              TO  M3EFFDATL                  00306201
                    MOVE ATT-UNPROT-BRT-MDT TO  M3EFFDATA                       
                 ELSE                                                           
                    IF M3EFFDATI (5:2) > 12                                     
                       MOVE 'SWP/PAC INDICATOR HAS WRONG MONTH'                 
                                         TO  M3ERRMSGO                          
                    MOVE -1           TO  M3EFFDATL                             
                       MOVE ATT-UNPROT-BRT-MDT TO M3EFFDATA                     
                    ELSE                                                        
                       IF M3EFFDATI (7:2) > 31                                  
                          MOVE 'SWP/PAC EFFECTIVE DATE HAS WRONG DAY'           
                                         TO  M3ERRMSGO                          
                          MOVE -1        TO  M3EFFDATL                          
                          MOVE ATT-UNPROT-BRT-MDT TO M3EFFDATA                  
                       ELSE                                                     
                          MOVE M3EFFDATI                                        
                                         TO ACAT3FIO-SWP-PAC-EFFCT-DT           
                       END-IF                                                   
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       INSPECT-M3DSBAMTI.                                                       
      *******************                                                       
                                                                                
           INSPECT M3DSBAMTI REPLACING ALL SPACES BY ZEROES.                    
           MOVE M3DSBAMTI                   TO  DSBMT-AMT-TABLE.                
           SET STOP-NOT-OK                  TO  TRUE.                           
           SET WS-BEFORE-PERIOD             TO  TRUE.                           
           MOVE 0                           TO  WS-MEANING-CNTR                 
                                                WS-INT-CNTR                     
                                                WS-FRAC-CNTR.                   
           PERFORM VARYING S1 FROM 1 BY 1                                       
              UNTIL S1 > 17 OR STOP-OK                                          
              EVALUATE TRUE                                                     
                 WHEN DSBMT-AMT (S1) = '.'                                      
                    SET WS-AFTER-PERIOD     TO  TRUE                            
                 WHEN DSBMT-AMT (S1) = '0'                                      
                    CONTINUE                                                    
                    IF WS-BEFORE-PERIOD                                         
                       ADD 1                TO  WS-INT-CNTR                     
                    ELSE                                                        
                       ADD 1                TO  WS-FRAC-CNTR                    
                    END-IF                                                      
                 WHEN DSBMT-AMT (S1) = '1' OR '2' OR '3' OR '4' OR              
                                       '5' OR '6' OR '7' OR '8' OR '9'          
                    IF WS-BEFORE-PERIOD                                         
                       ADD 1                TO  WS-MEANING-CNTR                 
                                                WS-INT-CNTR                     
                    ELSE                                                        
                       ADD 1                TO  WS-FRAC-CNTR                    
                    END-IF                                                      
                 WHEN OTHER                                                     
                    SET STOP-OK             TO  TRUE                            
                    MOVE 'DISBURSEMENT AMOUNT CONTAINS A NONNUMERIC SYMB        
      -                  'OL'               TO  M3ERRMSGO                       
                    MOVE -1                 TO  M3DSBAMTL                       
                    MOVE ATT-UNPROT-BRT-MDT TO  M3DSBAMTA                       
              END-EVALUATE                                                      
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      ***************                                                           
       EDIT-OPTION-C.                                                           
      ***************                                                           
                                                                                
           IF WS-MEANING-CNTR > 14                                              
              MOVE 'WHEN DISBURS. OPT. C - AMOUNT CANNOT HAVE MORE THAN         
      -            '14 POSITIONS BEFORE PERIOD'                                 
                                            TO  M3ERRMSGO                       
              MOVE -1                       TO  M3DSBAMTL                       
              MOVE ATT-UNPROT-BRT-MDT       TO  M3DSBAMTA                       
           ELSE                                                                 
              IF WS-INT-CNTR = 0                                                
                 MOVE 0                     TO  WS-DSBMT-AMT-0-I                
              ELSE                                                              
                 MOVE M3DSBAMTI (1:WS-INT-CNTR)                                 
                                            TO  WS-DSBMT-AMT-0-I                
              END-IF                                                            
              COMPUTE S2 = WS-INT-CNTR + 2                                      
              EVALUATE WS-FRAC-CNTR                                             
                 WHEN 0                                                         
                    MOVE 0                  TO  WS-DSBMT-AMT-0-F                
                 WHEN 1                                                         
                    MOVE M3DSBAMTI (S2:1)   TO  WS-DSBMT-AMT-0-F (1:1)          
                    MOVE 0                  TO  WS-DSBMT-AMT-0-F (2:1)          
                 WHEN OTHER                                                     
                    MOVE M3DSBAMTI (S2:2)   TO  WS-DSBMT-AMT-0-F                
              END-EVALUATE                                                      
              MOVE WS-DSBMT-AMT-0           TO  ACAT3FIO-DSBMT-AMT              
                                                WS-DSBMT-AMT-0-DISP             
              MOVE  WS-DSBMT-AMT-0-DISP     TO  M3DSBAMTO                       
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ***************                                                           
       EDIT-OPTION-P.                                                           
      ***************                                                           
                                                                                
           IF WS-MEANING-CNTR > 6                                               
              MOVE 'WHEN DISBURS. OPT. P - AMOUNT CANNOT HAVE MORE THAN         
      -            '6 POSITIONS BEFORE PERIOD'                                  
                                            TO  M3ERRMSGO                       
              MOVE -1                       TO  M3DSBAMTL                       
              MOVE ATT-UNPROT-BRT-MDT       TO  M3DSBAMTA                       
           ELSE                                                                 
              IF WS-INT-CNTR = 0                                                
                 MOVE 0                     TO  WS-DSBMT-AMT-1-I                
              ELSE                                                              
                 MOVE M3DSBAMTI (1:WS-INT-CNTR)                                 
                                            TO  WS-DSBMT-AMT-1-I                
              END-IF                                                            
              COMPUTE S2 = WS-INT-CNTR + 2                                      
              MOVE 0                        TO  WS-DSBMT-AMT-1-F                
              EVALUATE WS-FRAC-CNTR                                             
                 WHEN 0                                                         
                    CONTINUE                                                    
                 WHEN OTHER                                                     
                    MOVE M3DSBAMTI (S2:WS-FRAC-CNTR)                            
                                            TO  WS-DSBMT-AMT-1-F                
                                                (1:WS-FRAC-CNTR)                
              END-EVALUATE                                                      
              MOVE WS-DSBMT-AMT-1        TO  ACAT3FIO-DSBMT-AMT                 
                                             WS-DSBMT-AMT-1-DISP                
              MOVE WS-DSBMT-AMT-1-DISP   TO  M3DSBAMTO                          
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ***************                                                           
       EDIT-OPTION-S.                                                           
      ***************                                                           
                                                                                
           IF WS-MEANING-CNTR > 12                                              
              MOVE 'WHEN DISBURS. OPT. S - AMOUNT CANNOT HAVE MORE THAN         
      -            '12 POSITIONS BEFORE PERIOD'                                 
                                            TO  M3ERRMSGO                       
              MOVE -1                       TO  M3DSBAMTL                       
              MOVE ATT-UNPROT-BRT-MDT       TO  M3DSBAMTA                       
           ELSE                                                                 
              IF WS-INT-CNTR = 0                                                
                 MOVE 0                     TO  WS-DSBMT-AMT-2-I                
              ELSE                                                              
                 MOVE M3DSBAMTI (1:WS-INT-CNTR)                                 
                                            TO  WS-DSBMT-AMT-2-I                
              END-IF                                                            
              COMPUTE S2 = WS-INT-CNTR + 2                                      
              MOVE 0                        TO  WS-DSBMT-AMT-2-F                
              EVALUATE WS-FRAC-CNTR                                             
                 WHEN 0                                                         
                    CONTINUE                                                    
                 WHEN OTHER                                                     
                    MOVE M3DSBAMTI (S2:WS-FRAC-CNTR)                            
                                            TO  WS-DSBMT-AMT-2-F                
                                                (1:WS-FRAC-CNTR)                
              END-EVALUATE                                                      
              MOVE WS-DSBMT-AMT-2        TO  ACAT3FIO-DSBMT-AMT                 
                                             WS-DSBMT-AMT-2-DISP                
              MOVE WS-DSBMT-AMT-2-DISP   TO  M3DSBAMTO                          
           END-IF.                                                              
                                                                                
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
                 INITIALIZE ACAT3FIO                                            
                 PERFORM FIRST-TIME-RTN                                         
              WHEN EIBAID = DFHPF4                                              
                 PERFORM XCTL-PAYABLES                                          
              WHEN OTHER                                                        
                 MOVE 'INVALID PF KEY'      TO  M3ERRMSGO                       
                 PERFORM SEND-MAP-DATAONLY                                      
                 PERFORM RETURN-TO-CICS                                         
           END-EVALUATE.                                                        
                                                                                
           EJECT                                                                
      *************                                                             
       LINK-TO-DB2.                                                             
      *************                                                             
                                                                                
           EXEC CICS LINK PROGRAM('ACAT3FDB')                                   
                         COMMAREA(ACAT3FIO-COMMAREA)                            
           END-EXEC.                                                            
                                                                                
           IF ACAT3FIO-DB2-BAD-RETURN                                           
              MOVE ACAT3FIO-DB2-RETURN-CODE TO  ERR-BAD-DB2-CODE                
              MOVE ERR-BAD-DB2              TO  M3ERRMSGO                       
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
                                                                                
           PERFORM CLEAR-FIELDS.                                                
                                                                                
           MOVE EIBTRMID                    TO  TERM-ID.                        
           MOVE 'AMF1'                      TO  TRAN-ID.                        
           MOVE +1                          TO  ITEM-NUMBER.                    
                                                                                
           EXEC CICS READQ TS QUEUE(WS-TS-NAME)                                 
                              INTO(ACAT1FIO-COMMAREA)                           
                              ITEM(ITEM-NUMBER)                                 
           END-EXEC.                                                            
                                                                                
           SET ACAT1FIO-FIRST-TIME          TO  TRUE.                           
           MOVE ACAT3FIO-NSCC-PEND-CD       TO  ACAT1FIO-NSCC-PEND-CD.          
           INITIALIZE ACAT1FIO.                                                 
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT1FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               REWRITE                                          
           END-EXEC.                                                            
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT1FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE ERR-ACAT1FSC                TO  M3ERRMSGO.                      
           MOVE -1                          TO  M3TRIDL.                        
                                                                                
           PERFORM SEND-MAP-DATAONLY.                                           
           PERFORM RETURN-TO-CICS.                                              
                                                                                
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
           MOVE ACAT3FIO-NSCC-PEND-CD       TO  ACAT2FIO-NSCC-PEND-CD.          
           INITIALIZE ACAT2FIO.                                                 
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT2FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               REWRITE                                          
           END-EXEC.                                                            
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT2FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE ERR-ACAT2FSC                TO  M3ERRMSGO.                      
           MOVE -1                          TO  M3TRIDL.                        
                                                                                
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
           MOVE ACAT3FIO-NSCC-PEND-CD       TO  ACAT4FIO-NSCC-PEND-CD.          
           INITIALIZE ACAT4FIO.                                                 
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT4FIO-COMMAREA)                          
                               ITEM(ITEM-NUMBER)                                
                               REWRITE                                          
           END-EXEC.                                                            
                                                                                
           EXEC CICS XCTL PROGRAM('ACAT4FSC')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE ERR-ACAT4FSC                TO  M3ERRMSGO.                      
           MOVE -1                          TO  M3TRIDL.                        
                                                                                
           PERFORM SEND-MAP-DATAONLY.                                           
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ****************                                                          
       PREPARE-FIELDS.                                                          
      ****************                                                          
                                                                                
           MOVE ATT-UNPROT-MDT               TO  M3EFFDATA                      
                                                 M3PACA                         
                                                 M3SWPA                         
                                                 M3TAXINDA                      
                                                 M3COSTBSA                      
                                                 M3BANKACA                      
                                                 M3ACTYPEA                      
                                                 M3ABANBRA                      
                                                 M3DSBOPTA                      
                                                 M3DSBAMTA                      
                                                 M3DAYA                         
                                                 M3JANA                         
                                                 M3FEBA                         
                                                 M3MARA                         
                                                 M3APRA                         
                                                 M3MAYA                         
                                                 M3JUNA                         
                                                 M3JULA                         
                                                 M3AUGA                         
                                                 M3SEPA                         
                                                 M3OCTA                         
                                                 M3NOVA                         
                                                 M3DECA                         
                                                 M3FRSTCKA.                     
                                                                                
           EJECT                                                                
      **************                                                            
       CLEAR-FIELDS.                                                            
      **************                                                            
                                                                                
           MOVE SPACES                       TO  M3EFFDATO                      
                                                 M3PACO                         
                                                 M3SWPO                         
                                                 M3TAXINDO                      
                                                 M3COSTBSO                      
                                                 M3BANKACO                      
                                                 M3ACTYPEO                      
                                                 M3ABANBRO                      
                                                 M3DSBOPTO                      
                                                 M3DSBAMTO                      
                                                 M3DAYO                         
                                                 M3JANO                         
                                                 M3FEBO                         
                                                 M3MARO                         
                                                 M3APRO                         
                                                 M3MAYO                         
                                                 M3JUNO                         
                                                 M3JULO                         
                                                 M3AUGO                         
                                                 M3SEPO                         
                                                 M3OCTO                         
                                                 M3NOVO                         
                                                 M3DECO                         
                                                 M3FRSTCKO                      
                                                 M3ERRMSGO.                     
           PERFORM PROTECT-ALL-FIELDS.                                          
                                                                                
           EJECT                                                                
      ********************                                                      
       PROTECT-ALL-FIELDS.                                                      
      ********************                                                      
                                                                                
           MOVE ATT-PROT                     TO  M3EFFDATA                      
                                                 M3PACA                         
                                                 M3SWPA                         
                                                 M3TAXINDA                      
                                                 M3COSTBSA                      
                                                 M3BANKACA                      
                                                 M3ACTYPEA                      
                                                 M3ABANBRA                      
                                                 M3DSBOPTA                      
                                                 M3DSBAMTA                      
                                                 M3DAYA                         
                                                 M3JANA                         
                                                 M3FEBA                         
                                                 M3MARA                         
                                                 M3APRA                         
                                                 M3MAYA                         
                                                 M3JUNA                         
                                                 M3JULA                         
                                                 M3AUGA                         
                                                 M3SEPA                         
                                                 M3OCTA                         
                                                 M3NOVA                         
                                                 M3DECA                         
                                                 M3FRSTCKA.                     
                                                                                
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
       WRITE-ACAT3FIO-COMMAREA.                                                 
      *************************                                                 
                                                                                
           EXEC CICS WRITEQ TS QUEUE(WS-TS-NAME)                                
                               FROM(ACAT3FIO-COMMAREA)                          
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
                                                                                
           MOVE '3'                         TO  ACAT-AMFX-PROG-CODE.            
                                                                                
           PERFORM WRITE-ACAT3FIO-COMMAREA.                                     
                                                                                
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
                                                                                
LRM003     IF ACAT3FIO-CALL-RTN-PROGRAM = 'ACAT05RN'                            
LRM003        EXEC CICS XCTL PROGRAM('ACAT05RN')                                
LRM003                       COMMAREA(ACATCOMM-COMMAREA)                        
LRM003        END-EXEC                                                          
LRM003     ELSE                                                                 
           EXEC CICS XCTL PROGRAM('ACAT04RS')                                   
                          COMMAREA(ACATCOMM-COMMAREA)                           
           END-EXEC.                                                            
                                                                                
           MOVE 'PROGRAM ACAT04RS IS NOT AVAILABLE'                             
                                            TO  M3ERRMSGO.                      
           MOVE -1                          TO  M3TRIDL.                        
                                                                                
           PERFORM SEND-MAP-ERASE.                                              
           PERFORM RETURN-TO-CICS.                                              
                                                                                
           EJECT                                                                
      ***********                                                               
       HANG-CICS.                                                               
      ***********                                                               
                                                                                
           GOBACK.                                                              
                                                                                
