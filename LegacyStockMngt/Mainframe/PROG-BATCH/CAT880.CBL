000001* PDX    - CAT880   C0348882 12/06/13 06:52:53 TBCHKOP            00001000
CSG001* SSR 91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.                         
000001* PDX    - CAT880   C0226130 10/31/05 11:16:05 TBLAMUR            00001000
LRM004* SSR 44394 CONTENTION ABEND.  ADD CLIENT NBR TO CURSOR                   
000001* PDX    - CAT880   C0194849 08/25/03 11:12:59 TBLAMUR            00001000
000001* PDX    - CAT880   C0182051 02/12/03 15:48:14 TBLAMUR            00001000
LRM002* SSR 0029711 MARGIN RETOOL CALL GETVBAL                                  
000001* PDX    - CAT880   C0170190 01/25/02 08:32:57 TBLAMUR            00001000
000001* PDX    - CAT880   C0149951 02/12/01 10:57:04 TBTIKUO            00001000
000001* PDX    - CAT880   C0128660 07/22/99 14:59:20 TBTIKUO            00001000
000001* PDX    - CAT880   C0121343 02/11/99 16:18:21 TBTARYB            00001000
000001* PDX    - CAT880   C0121098 02/03/99 11:33:45 TBTARYB            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.  CAT880.                                                     
       DATE-WRITTEN.  FEB 1999.                                                 
                                                                                
      *****************************************************************         
      *                         REMARKS                               *         
      *****************************************************************         
TCK001* PDX0128660 - ALPHA BRANCH                                               
TCK001*              CHANGE COPYBOOK ACBALVSM TO ACBALALP                       
TCK001* PROC HAS BEEN CHANGED TO USE S1.AAA.OMG36.BALNCAL AS INPUT FILE         
      *****************************************************************         
TCK002* COBOL LE                                                                
LRM003* CAUSE ALL NON TYPE 1,2 BALANCES TO REPORT.                              
      *****************************************************************         
                                                                                
           EJECT                                                                
      *****************************************************************         
       ENVIRONMENT DIVISION.                                                    
      *****************************************************************         
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
                                                                        CAT810  
           SELECT REPORT-FILE        ASSIGN TO  RPTPI.                          
                                                                                
      *****************************************************************         
       DATA DIVISION.                                                           
      *****************************************************************         
                                                                                
       FILE SECTION.                                                            
                                                                                
       FD  REPORT-FILE                                                          
           RECORDING MODE F                                                     
           BLOCK CONTAINS 0 RECORDS                                             
           LABEL RECORDS ARE STANDARD                                           
           RECORD CONTAINS 143 CHARACTERS.                                      
                                                                                
       01  REPORT-RECORD                    PIC  X(143).                        
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
       77  BAL-IDX                  COMP    PIC  9(04).                         
       77  ABEND-CODE               COMP    PIC S9(04)  VALUE +999.             
       77  WS-STREAM-IND                    PIC  X(01)  VALUE SPACES.           
       77  S1                       COMP    PIC S9(04)  VALUE ZEROES.           
       77  B1-SUB                           PIC  9(03)  VALUE ZEROES.           
LRM004 77  CLT-COUNT                        PIC  9(03)  VALUE ZEROES.           
LRM004 77  W-DB2-SQLCODE                    PIC  ---9.                          
       77  WS-CLIENT                        PIC  9(03)  VALUE ZEROES.           
TCK001 77  WS-BRCH                          PIC  X(03)  VALUE ZEROES.           
TCK001 77  WS-ACCT                          PIC  X(05)  VALUE ZEROES.           
       77  HOLD-CLIENT-NBR                  PIC  X(04)  VALUE SPACES.           
       77  HOLD-ACCT-DLVR-NBR               PIC  X(04)  VALUE SPACES.           
                                                                                
       01  BALNC-FILE-STATUS                PIC  X(02)  VALUE '00'.             
           88  BALNC-FILE-OK                            VALUE '00'.             
           88  BALNC-OPEN-OK                            VALUE '00' '97'.        
           88  BALNC-ENDFILE                            VALUE '10'.             
           88  BALNC-NOTFOUND                           VALUE '23'.             
                                                                                
       01  CLIENT-TABLE.                                                        
           05  CLIENT-TABLE-RECORD OCCURS 500 TIMES.                            
LRM004         10  CLIENT-NBR-N             PIC  9(4).                          
               10  CLIENT-NAME              PIC  X(30).                         
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'DATES-AREA'.                                                        
                                                                                
       01  FILLER.                                                              
           05  WS-BALNC-DATE-CCYYMMDD.                                          
               10  WS-BALNC-DATE-CC         PIC  X(02).                         
               10  WS-BALNC-DATE-YY         PIC  X(02).                         
               10  WS-BALNC-DATE-MM         PIC  X(02).                         
               10  WS-BALNC-DATE-DD         PIC  X(02).                         
                                                                                
           05  WS-DATE-MMDDYY.                                                  
               10  WS-DATE-MM               PIC  X(02).                         
               10  WS-DATE-DD               PIC  X(02).                         
               10  WS-DATE-YY               PIC  X(02).                         
                                                                                
           05  WS-CURRENT-DATE              PIC  X(26).                         
           05  FILLER REDEFINES                                                 
               WS-CURRENT-DATE.                                                 
               10  WS-CURRENT-CC            PIC  X(02).                         
               10  WS-CURRENT-YY            PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-CURRENT-MM            PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-CURRENT-DD            PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-CURRENT-HH            PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-CURRENT-MIN           PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-CURRENT-SEC           PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  FILLER                   PIC  X(06).                         
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'SWITCHES'.                                                          
                                                                                
       01  FILLER.                                                              
           05  NEW-LEVEL-SW                 PIC  X(01)  VALUE 'C'.              
               88  NEW-CLIENT                           VALUE 'C'.              
               88  NEW-ACCOUNT                          VALUE 'A'.              
               88  NOTHING-NEW                          VALUE 'N'.              
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'COUNTERS'.                                                          
                                                                                
       01  FILLER.                                                              
           05  LINE-CNTR                    PIC  9(02)  VALUE ZEROES.           
           05  PAGE-CNTR                    PIC  9(05)  VALUE ZEROES.           
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'TOTALS'.                                                            
                                                                                
       01  FILLER.                                                              
           05  CLIENT-TD-BALANCE    COMP-3  PIC S9(15)V99  VALUE ZEROES.        
           05  CLIENT-SD-BALANCE    COMP-3  PIC S9(15)V99  VALUE ZEROES.        
                                                                                
       01  CURSOR-AREA.                                                         
           05  CR-CLIENT-NBR                PIC  X(04).                         
           05  CR-ACCT-RCV-NBR              PIC  X(20).                         
           05  CR-ACCT-DLVR-NBR             PIC  X(20).                         
                                                                                
       01  GETVBAL                          PIC X(08) VALUE 'ZGETVBAL'.         
           COPY GETVBALC REPLACING ==:GETVBAL:== BY ==GETVBAL==.                
           COPY CUSBALRE REPLACING ==:BAL:==     BY ==BAL==.                    
           COPY ACBALALP.                                                       
           COPY BVHEADER.                                                       
           COPY BVTRILER.                                                       
                                                                                
       01  NEW-CUS-BAL-KEY.                                                     
           05 WS-BAL-KEY.                                                       
              07 WS-BAL-KEY-A.                                                  
                 10 WS-BAL-CLT              PIC  X(03).                         
                 10 WS-BAL-BR               PIC  X(03).                         
                 10 WS-BAL-ACCT             PIC  X(05).                         
              07 WS-BAL-KEY-B.                                                  
                 10 WS-BAL-CUR              PIC  X(03).                         
              07 WS-BAL-KEY-C               PIC  X(06).                         
                                                                                
       01  HDR1-RECORD.                                                         
           05  HDR1-CC                      PIC  X(01)  VALUE '1'.              
           05  FILLER                       PIC  X(09)  VALUE                   
               'CLIENT - '.                                                     
           05  HDR1-CLIENT-NBR              PIC  X(03).                         
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  HDR1-CLIENT-NAME             PIC  X(30).                         
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(42)  VALUE                   
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.                    
           05  FILLER                       PIC  X(15)  VALUE SPACES.           
           05  FILLER                       PIC  X(06)  VALUE                   
               'DATE: '.                                                        
           05  HDR1-DATE-MM                 PIC  X(02).                         
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  HDR1-DATE-DD                 PIC  X(02).                         
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  HDR1-DATE-YY                 PIC  X(02).                         
           05  FILLER                       PIC  X(03)  VALUE SPACES.           
           05  FILLER                       PIC  X(06)  VALUE                   
               'PAGE: '.                                                        
           05  HDR1-PAGE-NBR                PIC  ZZZZ9.                         
           05  FILLER                       PIC  X(01)  VALUE SPACES.           
                                                                                
       01  HDR2-RECORD.                                                         
           05  HDR2-CC                      PIC  X(01)  VALUE ' '.              
           05  FILLER                       PIC  X(47)  VALUE SPACES.           
           05  FILLER                       PIC  X(40)  VALUE                   
               'DELIVERER CASH BALANCE EXCEPTIONS REPORT'.                      
           05  FILLER                       PIC  X(16)  VALUE SPACES.           
           05  FILLER                       PIC  X(10)  VALUE                   
               'RUN DATE: '.                                                    
           05  HDR2-DATE-MM                 PIC  X(02).                         
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  HDR2-DATE-DD                 PIC  X(02).                         
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  HDR2-DATE-YY                 PIC  X(02).                         
           05  FILLER                       PIC  X(09)  VALUE SPACES.           
                                                                                
       01  HDR3-RECORD.                                                         
           05  HDR3-CC                      PIC  X(01)  VALUE '0'.              
           05  FILLER                       PIC  X(10)  VALUE SPACES.           
           05  FILLER                       PIC  X(06)  VALUE                   
               'BRANCH'.                                                        
           05  FILLER                       PIC  X(02)  VALUE ' '.              
           05  FILLER                       PIC  X(07)  VALUE                   
               'ACCOUNT'.                                                       
           05  FILLER                       PIC  X(02)  VALUE ' '.              
           05  FILLER                       PIC  X(04)  VALUE                   
               'TYPE'.                                                          
           05  FILLER                       PIC  X(02)  VALUE ' '.              
           05  FILLER                       PIC  X(24)  VALUE                   
               '   TRADE DATE BALANCE   '.                                      
           05  FILLER                       PIC  X(02)  VALUE ' '.              
           05  FILLER                       PIC  X(24)  VALUE                   
               '  SETTLE DATE BALANCE   '.                                      
           05  FILLER                       PIC  X(49)  VALUE SPACES.           
                                                                                
       01  DTL1-RECORD.                                                         
           05  DTL1-CC                      PIC  X(01)  VALUE ' '.              
                                                                                
           05  FILLER                       PIC  X(10)  VALUE SPACES.           
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  DTL1-BRANCH                  PIC  X(03).                         
           05  FILLER                       PIC  X(01)  VALUE SPACES.           
                                                                                
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE SPACES.           
           05  DTL1-ACCOUNT                 PIC  X(05).                         
           05  FILLER                       PIC  X(01)  VALUE SPACES.           
                                                                                
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE SPACES.           
           05  DTL1-TYPE                    PIC  X(01).                         
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
                                                                                
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  DTL1-TD-BALANCE              PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZZ.99-.        
                                                                                
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  DTL1-SD-BALANCE              PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZZ.99-.        
           05  FILLER                       PIC  X(51)  VALUE SPACES.           
                                                                                
       01  TRL1-RECORD.                                                         
           05  DTL2-CC                      PIC  X(01)  VALUE '0'.              
           05  FILLER                       PIC  X(18)  VALUE SPACES.           
           05  FILLER                       PIC  X(13)  VALUE                   
               'CLIENT TOTAL:'.                                                 
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  TRL1-TD-BALANCE              PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZZ.99-.        
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  TRL1-SD-BALANCE              PIC ZZZ,ZZZ,ZZZ,ZZZ,ZZZ.99-.        
           05  FILLER                       PIC  X(01)  VALUE SPACES.           
                                                                                
       01  TRAC-RECORD.                                                         
           05  TRAC-DETAIL                  PIC  X(133).                        
           05  TRAC-CONTROL.                                                    
               10  TRAC-CLIENT      COMP-3  PIC  9(03)  VALUE ZEROES.           
               10  FILLER                   PIC  X(08)  VALUE SPACES.           
                                                                                
           EJECT                                                                
       01  DSNTIAR                          PIC  X(08)  VALUE 'DSNTIAR'.        
       01  WS-DB2-MESSAGE-AREA.                                                 
           05  WS-DB2-MSG-LEN       COMP    PIC S9(04)  VALUE +960.             
           05  WS-ERROR-MSG                 PIC  X(80)  OCCURS 12 TIMES         
               INDEXED BY WS-ERROR-INDEX.                                       
       01  WS-ERR-LINE-LEN          COMP    PIC S9(09)  VALUE +80.              
                                                                                
           EJECT                                                                
           COPY BPDATESC.                                                       
                                                                                
           EJECT                                                                
           COPY BHINFO.                                                         
           COPY BHACAT.                                                         
                                                                                
           EJECT                                                                
TCK002     COPY STUBCPY.                                                        
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
           EXEC SQL                                                             
              DECLARE VTRNFR_CR CURSOR FOR                                      
                 SELECT CLIENT_NBR                                              
                       ,ACCT_RCV_NBR                                            
                       ,ACCT_DLVR_NBR                                           
                 FROM   VTRNFR                                                  
LRM004           WHERE  CLIENT_NBR = :CR-CLIENT-NBR                             
                 AND    DSTBN_SIDE_CD = 'D'                                     
                 AND    TRNFR_TYPE_CD = 'FUL'                                   
                 ORDER BY ACCT_DLVR_NBR                                         
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      *****************************************************************         
       LINKAGE SECTION.                                                         
      *****************************************************************         
                                                                                
       01  PARM-AREA.                                                           
           05  PARM-LENGTH                  PIC S9(04)  COMP.                   
           05  LS-STREAM-IND                PIC  X(01).                         
                                                                                
           EJECT                                                                
      *****************************************************************         
       PROCEDURE DIVISION USING PARM-AREA.                                      
      *****************************************************************         
                                                                                
TCK001     DISPLAY '         ============================= '.                   
TCK001     DISPLAY '         CAT880 - ACATS BALANCE REPORT '.                   
TCK001     DISPLAY '         ============================= '.                   
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
           PERFORM INITIAL-ROUTINE.                                             
                                                                                
           PERFORM BUILD-CLIENT-TABLE.                                          
                                                                                
LRM004     PERFORM VARYING B1-SUB FROM 1 BY 1                                   
LRM004                   UNTIL B1-SUB > CLT-COUNT                               
LRM004        PERFORM OPEN-CLIENT-CURSOR                                        
LRM004        IF SQLCODE = +0                                                   
                 PERFORM FETCH-CURSOR-ROUTINE                                   
                 PERFORM PROCESSING-ROUTINE                                     
                    UNTIL SQLCODE = +100                                        
LRM004           PERFORM CLOSE-CLIENT-CURSOR                                    
LRM004        END-IF                                                            
LRM004     END-PERFORM.                                                         
                                                                                
           PERFORM EOJ-ROUTINE.                                                 
                                                                                
           STOP RUN.                                                            
                                                                                
           EJECT                                                                
      ********************                                                      
       BUILD-CLIENT-TABLE.                                                      
      ********************                                                      
                                                                                
           MOVE SPACES                      TO  CLIENT-TABLE.                   
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500                
              MOVE SPACES                   TO  BH-BROKER-HEADER-INFO           
              MOVE B1-SUB                   TO  BH-BROKER-NUMBER                
LRM004        MOVE   '015'                 TO  BH-LOGICAL-RECORD-CODE           
LRM004        MOVE   '434500'              TO  BH-B2-INFO-ID                    
LRM004        CALL     GETB1V     USING        BH-BROKER-HEADER-INFO            
LRM004                                         BH-ACAT-INFO                     
              IF BH-BROKER-MINI-MAXI-SUBGROUP NOT = SPACES                      
                 MOVE BH-BROKER-MINI-MAXI-SUBGROUP                              
                                         TO  WS-STREAM-IND                      
              ELSE                                                              
                 MOVE BH-BROKER-MINI-MAXI-INDICATOR                             
                                         TO  WS-STREAM-IND                      
              END-IF                                                            
              IF BH-BROKER-ACTIVE                                               
              AND LS-STREAM-IND  = WS-STREAM-IND                                
LRM004        AND BH-ACAT-ACTIVE                                                
LRM004           ADD 1 TO CLT-COUNT                                             
LRM004           MOVE B1-SUB             TO  CLIENT-NBR-N (CLT-COUNT)           
                 MOVE BH-BROKER-NAME     TO  CLIENT-NAME (CLT-COUNT)            
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      ********************                                                      
       PROCESSING-ROUTINE.                                                      
      ********************                                                      
                                                                                
TCK001***  IF CR-ACCT-DLVR-NBR (1:8) NUMERIC                                    
           IF CR-ACCT-DLVR-NBR (1:8) > SPACES                                   
              IF CR-CLIENT-NBR NOT = HOLD-CLIENT-NBR                            
                 IF CLIENT-SD-BALANCE NOT = 0 AND                               
                    CLIENT-TD-BALANCE NOT = 0                                   
                    PERFORM WRITE-TRAILER-ROUTINE                               
                    MOVE ZEROES                TO  CLIENT-SD-BALANCE            
                                                   CLIENT-TD-BALANCE            
                 END-IF                                                         
                 MOVE CR-CLIENT-NBR            TO  HOLD-CLIENT-NBR              
                 MOVE CR-ACCT-DLVR-NBR         TO  HOLD-ACCT-DLVR-NBR           
                 MOVE CR-CLIENT-NBR (2:3)      TO  WS-CLIENT                    
                 MOVE CR-ACCT-DLVR-NBR (1:3)   TO  WS-BRCH                      
                 MOVE CR-ACCT-DLVR-NBR (4:5)   TO  WS-ACCT                      
                 SET NEW-CLIENT                TO  TRUE                         
              ELSE                                                              
                 IF CR-ACCT-DLVR-NBR NOT = HOLD-ACCT-DLVR-NBR                   
                    MOVE CR-ACCT-DLVR-NBR       TO  HOLD-ACCT-DLVR-NBR          
                    MOVE CR-ACCT-DLVR-NBR (1:3) TO  WS-BRCH                     
                    MOVE CR-ACCT-DLVR-NBR (4:5) TO  WS-ACCT                     
                    IF NOT NEW-CLIENT                                           
                       SET NEW-ACCOUNT             TO  TRUE                     
                    END-IF                                                      
                 END-IF                                                         
              END-IF                                                            
              PERFORM RECONCILIATION-ROUTINE                                    
           END-IF.                                                              
                                                                                
           PERFORM FETCH-CURSOR-ROUTINE.                                        
                                                                                
           EJECT                                                                
      ************************                                                  
       RECONCILIATION-ROUTINE.                                                  
      ************************                                                  
                                                                                
           PERFORM GET-BALNC-RECORD.                                            
                                                                                
           IF BALNC-FILE-OK                                                     
TCK001        IF CMBL-ACTYP3-PRESENT = 1  AND                                   
                (CMBL3-SETTLE-DATE-BAL-YSTDY (1) NOT = ZEROES OR                
                 CMBL3-TRADE-DATE-BAL-YSTDY (1)  NOT = ZEROES)                  
                 MOVE '3'                   TO  DTL1-TYPE                       
                 MOVE CMBL3-SETTLE-DATE-BAL-YSTDY (1)                           
                                            TO  DTL1-SD-BALANCE                 
                 ADD CMBL3-SETTLE-DATE-BAL-YSTDY (1)                            
                                            TO  CLIENT-SD-BALANCE               
                 MOVE CMBL3-TRADE-DATE-BAL-YSTDY (1)                            
                                            TO  DTL1-TD-BALANCE                 
                 ADD CMBL3-TRADE-DATE-BAL-YSTDY (1)                             
                                            TO  CLIENT-TD-BALANCE               
                 PERFORM WRITE-REPORT-ROUTINE                                   
              END-IF                                                            
TCK001        IF CMBL-ACTYP4-PRESENT = 1                                        
                IF (CMBL4-SETTLE-DATE-BAL-YSTDY (1) NOT = ZEROES OR             
                   CMBL4-TRADE-DATE-BAL-YSTDY (1)  NOT = ZEROES)                
                   MOVE '4'                   TO  DTL1-TYPE                     
                    MOVE CMBL4-SETTLE-DATE-BAL-YSTDY (1)                        
                                               TO DTL1-SD-BALANCE               
                    ADD CMBL4-SETTLE-DATE-BAL-YSTDY (1)                         
                                               TO CLIENT-SD-BALANCE             
                    MOVE CMBL4-TRADE-DATE-BAL-YSTDY (1)                         
                                               TO DTL1-TD-BALANCE               
                    ADD CMBL4-TRADE-DATE-BAL-YSTDY (1)                          
                                               TO CLIENT-TD-BALANCE             
                    PERFORM WRITE-REPORT-ROUTINE                                
                 END-IF                                                         
              END-IF                                                            
TCK001        IF CMBL-ACTYP6-PRESENT = 1  AND                                   
                (CMBL6-SETTLE-DATE-BAL-YSTDY (1) NOT = ZEROES OR                
                 CMBL6-TRADE-DATE-BAL-YSTDY (1)  NOT = ZEROES)                  
                 MOVE '6'                   TO  DTL1-TYPE                       
                 MOVE CMBL6-SETTLE-DATE-BAL-YSTDY (1)                           
                                            TO  DTL1-SD-BALANCE                 
                 ADD CMBL6-SETTLE-DATE-BAL-YSTDY (1)                            
                                            TO  CLIENT-SD-BALANCE               
                 MOVE CMBL6-TRADE-DATE-BAL-YSTDY (1)                            
                                            TO  DTL1-TD-BALANCE                 
                 ADD CMBL6-TRADE-DATE-BAL-YSTDY (1)                             
                                            TO  CLIENT-TD-BALANCE               
                 PERFORM WRITE-REPORT-ROUTINE                                   
              END-IF                                                            
TCK001        IF CMBL-ACTYP7-PRESENT =  1   AND                                 
                (CMBL7-SETTLE-DATE-BAL-YSTDY (1) NOT = ZEROES OR                
                 CMBL7-TRADE-DATE-BAL-YSTDY (1)  NOT = ZEROES)                  
                 MOVE '7'                   TO  DTL1-TYPE                       
                 MOVE CMBL7-SETTLE-DATE-BAL-YSTDY (1)                           
                                            TO  DTL1-SD-BALANCE                 
                 ADD CMBL7-SETTLE-DATE-BAL-YSTDY (1)                            
                                            TO  CLIENT-SD-BALANCE               
                 MOVE CMBL7-TRADE-DATE-BAL-YSTDY (1)                            
                                            TO  DTL1-TD-BALANCE                 
                 ADD CMBL7-TRADE-DATE-BAL-YSTDY (1)                             
                                            TO  CLIENT-TD-BALANCE               
                 PERFORM WRITE-REPORT-ROUTINE                                   
              END-IF                                                            
TCK001        IF CMBL-ACTYP8-PRESENT =  1   AND                                 
                (CMBL8-SETTLE-DATE-BAL-YSTDY (1) NOT = ZEROES OR                
                 CMBL8-TRADE-DATE-BAL-YSTDY (1)  NOT = ZEROES)                  
                 MOVE '8'                   TO  DTL1-TYPE                       
                 MOVE CMBL8-SETTLE-DATE-BAL-YSTDY (1)                           
                                            TO  DTL1-SD-BALANCE                 
                 ADD CMBL8-SETTLE-DATE-BAL-YSTDY (1)                            
                                            TO  CLIENT-SD-BALANCE               
                 MOVE CMBL8-TRADE-DATE-BAL-YSTDY (1)                            
                                            TO  DTL1-TD-BALANCE                 
                 ADD CMBL8-TRADE-DATE-BAL-YSTDY (1)                             
                                            TO  CLIENT-TD-BALANCE               
                 PERFORM WRITE-REPORT-ROUTINE                                   
              END-IF                                                            
TCK001        IF CMBL-ACTYP9-PRESENT =  1   AND                                 
                (CMBL9-SETTLE-DATE-BAL-YSTDY (1) NOT = ZEROES OR                
                 CMBL9-TRADE-DATE-BAL-YSTDY (1)  NOT = ZEROES)                  
                 MOVE '9'                   TO  DTL1-TYPE                       
                 MOVE CMBL9-SETTLE-DATE-BAL-YSTDY (1)                           
                                            TO  DTL1-SD-BALANCE                 
                 ADD CMBL9-SETTLE-DATE-BAL-YSTDY (1)                            
                                            TO  CLIENT-SD-BALANCE               
                 MOVE CMBL9-TRADE-DATE-BAL-YSTDY (1)                            
                                            TO  DTL1-TD-BALANCE                 
                 ADD CMBL9-TRADE-DATE-BAL-YSTDY (1)                             
                                            TO  CLIENT-TD-BALANCE               
                 PERFORM WRITE-REPORT-ROUTINE                                   
TCKTMP*          DISPLAY ' CMBL-ACTYP9-PRESENT = ' CMBL-ACTYP9-PRESENT          
TCKTMP*          DISPLAY ' CMBL9-SETTL-DATE-BAL-YSTDY (1) = '                   
TCKTMP*                                            DTL1-SD-BALANCE              
TCKTMP*          DISPLAY ' CMBL9-TRADE-DATE-BAL-YSTDY (1) = '                   
TCKTMP*                                            DTL1-TD-BALANCE              
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      ******************                                                        
       GET-BALNC-RECORD.                                                        
                                                                                
           MOVE WS-CLIENT                  TO  CMBL-COMPANY-CODE.               
           MOVE WS-BRCH                    TO  CMBL-OFFICE-CODE.                
           MOVE WS-ACCT                    TO  CMBL-ACCOUNT-NUMBER.             
                                                                                
           PERFORM READ-BALNC.                                                  
                                                                                
           IF BALNC-FILE-OK                                                     
              IF CMBL-KEY = HIGH-VALUES                                         
                 SET BALNC-NOTFOUND         TO  TRUE                            
              ELSE                                                              
                 IF WS-CLIENT = CMBL-COMPANY-CODE AND                           
                    WS-BRCH   = CMBL-OFFICE-CODE  AND                           
                    WS-ACCT   = CMBL-ACCOUNT-NUMBER                             
TCKTMP*             DISPLAY ' **** BR/ACCT IS FOUND ****'                       
TCKTMP*             ' ==>= '  WS-CLIENT ' ' WS-BRCH WS-ACCT                     
                    CONTINUE                                                    
                 ELSE                                                           
                    SET BALNC-NOTFOUND         TO  TRUE                         
                 END-IF                                                         
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
                                                                                
       READ-BALNC.                                                              
                                                                                
********   MOVE LOW-VALUES                 TO  GETVBAL-PARM.                    
           MOVE  'CAT880'                  TO  GETVBAL-CALLING-PROGRAM.         
           MOVE  'O'  TO GETVBAL-FILE                                           
           MOVE  'R'  TO GETVBAL-FUNC                                           
TCK001     MOVE WS-CLIENT                  TO  GETVBAL-OLD-CLIENT.              
TCK001     MOVE WS-BRCH                    TO  GETVBAL-OLD-BRANCH.              
TCK001     MOVE WS-ACCT                    TO  GETVBAL-OLD-ACCT.                
           MOVE ZEROES                     TO  GETVBAL-OLD-CUR-CODE.            
TCK001     SET GETVBAL-OLD-FILLER-SPACE    TO  TRUE.                            
           PERFORM CALL-GETVBAL                                                 
                                                                                
           IF BALNC-FILE-OK  OR                                                 
              BALNC-ENDFILE  OR                                                 
              BALNC-NOTFOUND                                                    
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY '*********************************************'           
              DISPLAY '* BALNC-FILE START ERROR                    *'           
              DISPLAY '* VSAM STATUS = ' BALNC-FILE-STATUS                      
                      '                            *'                           
              DISPLAY '* BALNC-FILE KEY IS = ' CMBL-KEY  ' *'                   
              DISPLAY '* PROGRAM IS ABENDING!                      *'           
              DISPLAY '*********************************************'           
TCK002        CALL  ABEND                USING  ABEND-CODE                      
           END-IF.                                                              
                                                                                
           EJECT                                                                
      **********************                                                    
       FETCH-CURSOR-ROUTINE.                                                    
      **********************                                                    
                                                                                
           EXEC SQL                                                             
              FETCH VTRNFR_CR                                                   
              INTO :CURSOR-AREA                                                 
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = -911                                                    
              PERFORM VARYING S1 FROM 1 BY 1                                    
                 UNTIL S1 > 10 OR                                               
                 SQLCODE = +0  OR                                               
                 SQLCODE = +100                                                 
                 EXEC SQL                                                       
                    FETCH VTRNFR_CR                                             
                    INTO :CURSOR-AREA                                           
                 END-EXEC                                                       
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           IF SQLCODE = +0 OR +100                                              
TCKTMP*       DISPLAY ' '                                                       
TCKTMP*       DISPLAY ' FETCH VTRNFR_CR SQLCODE = ' SQLCODE                     
TCKTMP*       DISPLAY ' CURSOR FETCHED = ' CURSOR-AREA                          
              CONTINUE                                                          
           ELSE                                                                 
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           EJECT                                                                
      **********************                                                    
       WRITE-REPORT-ROUTINE.                                                    
      **********************                                                    
TCKTMP*    DISPLAY ' '                                                          
TCKTMP*    DISPLAY ' WRITE-REPORT-ROUTINE.'                                     
TCKTMP*    DISPLAY ' CLIENT = ' WS-CLIENT, ' BRANCH = ' WS-BRCH,                
TCKTMP*            ' ACCT = ' WS-ACCT                                           
                                                                                
           IF NEW-CLIENT                                                        
              MOVE 0                        TO  PAGE-CNTR                       
              MOVE WS-CLIENT                TO  HDR1-CLIENT-NBR                 
                                                TRAC-CLIENT                     
              MOVE CLIENT-NAME (WS-CLIENT)  TO  HDR1-CLIENT-NAME                
              PERFORM WRITE-HEADER-ROUTINE                                      
              MOVE WS-BRCH                  TO  DTL1-BRANCH                     
              MOVE WS-ACCT                  TO  DTL1-ACCOUNT                    
              PERFORM WRITE-DETAIL-ROUTINE                                      
              MOVE SPACES                   TO  DTL1-BRANCH                     
                                                DTL1-ACCOUNT                    
           END-IF.                                                              
                                                                                
           IF NEW-ACCOUNT                                                       
              MOVE WS-BRCH                  TO  DTL1-BRANCH                     
              MOVE WS-ACCT                  TO  DTL1-ACCOUNT                    
              MOVE '0'                      TO  DTL1-CC                         
              PERFORM WRITE-DETAIL-ROUTINE                                      
              MOVE SPACES                   TO  DTL1-CC                         
                                                DTL1-BRANCH                     
                                                DTL1-ACCOUNT                    
LRM003     ELSE                                                                 
LRM003        IF NOT NEW-CLIENT                                                 
LRM003           PERFORM WRITE-DETAIL-ROUTINE                                   
           END-IF.                                                              
LRM003     SET NOTHING-NEW               TO  TRUE.                              
                                                                                
           EJECT                                                                
      **********************                                                    
       WRITE-HEADER-ROUTINE.                                                    
      **********************                                                    
                                                                                
           ADD 1                            TO  PAGE-CNTR.                      
           MOVE PAGE-CNTR                   TO  HDR1-PAGE-NBR                   
                                                                                
           MOVE HDR1-RECORD                 TO  TRAC-DETAIL.                    
           WRITE REPORT-RECORD            FROM  TRAC-RECORD.                    
                                                                                
           MOVE HDR2-RECORD                 TO  TRAC-DETAIL.                    
           WRITE REPORT-RECORD            FROM  TRAC-RECORD.                    
                                                                                
           MOVE HDR3-RECORD                 TO  TRAC-DETAIL.                    
           WRITE REPORT-RECORD            FROM  TRAC-RECORD.                    
                                                                                
           MOVE 4                           TO  LINE-CNTR.                      
                                                                                
           EJECT                                                                
      **********************                                                    
       WRITE-DETAIL-ROUTINE.                                                    
      **********************                                                    
                                                                                
           IF LINE-CNTR > 56                                                    
              PERFORM WRITE-HEADER-ROUTINE                                      
           END-IF.                                                              
                                                                                
           MOVE DTL1-RECORD                 TO  TRAC-DETAIL.                    
           WRITE REPORT-RECORD            FROM  TRAC-RECORD.                    
                                                                                
           ADD 1                            TO  LINE-CNTR.                      
                                                                                
           EJECT                                                                
      ***********************                                                   
       WRITE-TRAILER-ROUTINE.                                                   
      ***********************                                                   
                                                                                
           MOVE CLIENT-TD-BALANCE           TO  TRL1-TD-BALANCE.                
           MOVE CLIENT-SD-BALANCE           TO  TRL1-SD-BALANCE.                
                                                                                
           MOVE TRL1-RECORD                 TO  TRAC-DETAIL.                    
           WRITE REPORT-RECORD            FROM  TRAC-RECORD.                    
                                                                                
           EJECT                                                                
      *****************                                                         
       INITIAL-ROUTINE.                                                         
      *****************                                                         
TCKTMP*    DISPLAY ' '                                                          
TCKTMP*    DISPLAY ' INITIAL-ROUTINE.'                                          
           MOVE 'O'    TO GETVBAL-FILE                                          
      *    OPEN INPUT  BALNC-FILE.                                              
           MOVE 'O'    TO GETVBAL-FUNC                                          
           PERFORM CALL-GETVBAL                                                 
           OPEN OUTPUT REPORT-FILE.                                             
                                                                                
           DISPLAY '**********************************'.                        
           DISPLAY '* CURRENTLY PROCESSING STREAM ' LS-STREAM-IND '  *'.        
           DISPLAY '**********************************'.                        
                                                                                
           IF NOT BALNC-OPEN-OK                                                 
              DISPLAY ' '                                                       
              DISPLAY '**************************'                              
              DISPLAY '* BAD OPEN OF BALNC FILE *'                              
              DISPLAY '* VSAM STATUS = ' BALNC-FILE-STATUS '       *'           
              DISPLAY '* PROGRAM IS ABENDING!   *'                              
              DISPLAY '**************************'                              
              DISPLAY ' '                                                       
              MOVE +0001                 TO  ABEND-CODE                         
TCK002        CALL  ABEND             USING  ABEND-CODE                         
           END-IF.                                                              
                                                                                
           MOVE 'CAT880'                 TO  BPDATES-CALLING-PGM.               
           MOVE 'C'                      TO  BPDATES-REQ-TYPE.                  
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*    MOVE 'US'                     TO  BPDATES-CALENDAR-TYPE.             
CSG001     MOVE '  '                     TO  BPDATES-CALENDAR-TYPE.             
TCK002     CALL  BPDATES              USING  BPDATES-PARAMETERS.                
                                                                                
           IF BPD-VALID-RETURN                                                  
              CONTINUE                                                          
           ELSE                                                                 
              DISPLAY ' '                                                       
              DISPLAY '*******************************'                         
              DISPLAY '* BPDATES INVALID-RETURN = ' BPDATES-RETURN-CODE         
                      ' *'                                                      
              DISPLAY '* PROGRAM IS ABENDING         *'                         
              DISPLAY '*******************************'                         
              DISPLAY ' '                                                       
TCK002        CALL  ABEND             USING  ABEND-CODE                         
           END-IF.                                                              
                                                                                
           EXEC SQL                                                             
               SET :WS-CURRENT-DATE = CURRENT TIMESTAMP                         
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              DISPLAY 'SQLCODE = ' SQLCODE                                      
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
                                                                                
           MOVE LOW-VALUES     TO  GETVBAL-REQUEST-KEY                          
           MOVE 'S'            TO  GETVBAL-FUNC                                 
           PERFORM CALL-GETVBAL                                                 
           MOVE CMBL-RECORD-BODY   TO BALANVS-HEADER                            
           DISPLAY ' RECORD-BODY    ' CMBL-RECORD-BODY                          
           DISPLAY ' BALANVS-HEADER ' BALANVS-HEADER                            
                                                                                
           IF BALNC-FILE-STATUS NOT = '00' OR                                   
              BVH-DATE-LIT NOT = 'DATE:'                                        
              DISPLAY ' '                                                       
              DISPLAY '***************************************'                 
              DISPLAY '* DATE RECORD NOT FOUND ON BALNC-FILE *'                 
              DISPLAY '* VSAM KEY = ' BALNC-FILE-STATUS                         
                      '                       *'                                
              DISPLAY '* PROGRAM IS ABENDING!                *'                 
              DISPLAY '***************************************'                 
TCK002**      CALL 'ILBOABN0'            USING  ABEND-CODE                      
TCK002        CALL  ABEND                USING  ABEND-CODE                      
           END-IF.                                                              
                                                                                
           MOVE BVH-PROD-DATE               TO  WS-DATE-MMDDYY.                 
                                                                                
           IF WS-DATE-YY > 80                                                   
              MOVE '19'                     TO  WS-BALNC-DATE-CC                
           ELSE                                                                 
              MOVE '20'                     TO  WS-BALNC-DATE-CC                
           END-IF.                                                              
                                                                                
           MOVE WS-DATE-MM                  TO  WS-BALNC-DATE-MM.               
           MOVE WS-DATE-DD                  TO  WS-BALNC-DATE-DD.               
           MOVE WS-DATE-YY                  TO  WS-BALNC-DATE-YY.               
                                                                                
TCK001        DISPLAY ' '                                                       
TCK001        DISPLAY '**********************************************'          
TCK001        DISPLAY '* CURRENT DATE IS    ' BPD-PROC-DATE                     
TCK001                '                *'                                       
TCK001        DISPLAY '**********************************************'          
           IF WS-BALNC-DATE-CCYYMMDD NOT = BPD-PROC-DATE                        
              DISPLAY ' '                                                       
              DISPLAY '**********************************************'          
              DISPLAY '* BALNC-FILE DATE IS ' WS-BALNC-DATE-CCYYMMDD            
                      '                *'                                       
              DISPLAY '* CURRENT DATE IS    ' BPD-PROC-DATE                     
                      '                *'                                       
              DISPLAY '* DATES ARE NOT EQUAL - PROGRAM IS ABENDING! *'          
              DISPLAY '**********************************************'          
TCK002        CALL  ABEND                USING  ABEND-CODE                      
           END-IF.                                                              
                                                                                
           MOVE WS-CURRENT-MM               TO  HDR1-DATE-MM.                   
           MOVE WS-CURRENT-DD               TO  HDR1-DATE-DD.                   
           MOVE WS-CURRENT-YY               TO  HDR1-DATE-YY.                   
                                                                                
           MOVE WS-BALNC-DATE-MM            TO  HDR2-DATE-MM.                   
           MOVE WS-BALNC-DATE-DD            TO  HDR2-DATE-DD.                   
           MOVE WS-BALNC-DATE-YY            TO  HDR2-DATE-YY.                   
                                                                                
LRM004 OPEN-CLIENT-CURSOR.                                                      
LRM004     MOVE CLIENT-NBR-N (B1-SUB) TO CR-CLIENT-NBR                          
           EXEC SQL                                                             
              OPEN VTRNFR_CR                                                    
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = -911                                                    
              PERFORM VARYING S1 FROM 1 BY 1                                    
                 UNTIL S1 > 10 OR                                               
                 SQLCODE = +0                                                   
                 EXEC SQL                                                       
                    OPEN VTRNFR_CR                                              
                 END-EXEC                                                       
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           IF SQLCODE NOT = +0                                                  
LRM004        DISPLAY 'DB2 OPEN CURSOR ERROR '                                  
LRM004        MOVE SQLCODE      TO W-DB2-SQLCODE                                
LRM004        DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                                
              PERFORM DB2-ERROR-ROUTINE                                         
           END-IF.                                                              
LRM004     DISPLAY 'OPEN CURSOR FOR ' CR-CLIENT-NBR.                            
                                                                                
LRM004 CLOSE-CLIENT-CURSOR.                                                     
LRM004     EXEC SQL                                                             
LRM004        CLOSE VTRNFR_CR                                                   
LRM004     END-EXEC.                                                            
LRM004     IF SQLCODE NOT = +0                                                  
LRM004        DISPLAY 'DB2 CLOSE CURSOR ERROR '                                 
LRM004        MOVE SQLCODE      TO W-DB2-SQLCODE                                
LRM004        DISPLAY 'SQLCODE = ' W-DB2-SQLCODE                                
LRM004        PERFORM DB2-ERROR-ROUTINE                                         
LRM004     END-IF.                                                              
LRM004     DISPLAY 'CLOSE CURSOR FOR ' CR-CLIENT-NBR.                           
                                                                                
           EJECT                                                                
      *******************                                                       
       DB2-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           CALL DSNTIAR               USING  SQLCA                              
                                             WS-DB2-MESSAGE-AREA                
                                             WS-ERR-LINE-LEN.                   
                                                                                
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
              UNTIL WS-ERROR-INDEX GREATER THAN 12                              
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                      
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)                
                 END-IF                                                         
           END-PERFORM.                                                         
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '************************'.                                  
           DISPLAY '* PROGRAM IS ABENDING! *'.                                  
           DISPLAY '************************'.                                  
           DISPLAY ' '.                                                         
                                                                                
TCK002     CALL  ABEND                   USING ABEND-CODE.                      
                                                                                
           EJECT                                                                
       CALL-GETVBAL.                                                            
           CALL GETVBAL USING GETVBAL-PARM.                                     
           MOVE GETVBAL-FILE-STATUS TO BALNC-FILE-STATUS                        
           IF GETVBAL-FILE = 'N'                                                
              MOVE GETVBAL-NEW-RECORD TO BAL-REC                                
           ELSE                                                                 
              MOVE GETVBAL-OLD-RECORD TO CMBL-CUSTOMER-BALANCE-SEGMENT.         
      *************                                                             
       EOJ-ROUTINE.                                                             
      *************                                                             
                                                                                
           IF CLIENT-SD-BALANCE = 0  AND                                        
              CLIENT-TD-BALANCE = 0                                             
              CONTINUE                                                          
           ELSE                                                                 
              PERFORM WRITE-TRAILER-ROUTINE                                     
           END-IF.                                                              
                                                                                
           CLOSE  REPORT-FILE.                                                  
           MOVE 'C' TO GETVBAL-FUNC.                                            
           PERFORM CALL-GETVBAL.                                                
           DISPLAY ' '.                                                         
           DISPLAY '*************************'.                                 
           DISPLAY '* END OF CAT880 PROGRAM *'.                                 
           DISPLAY '*************************'.                                 
           DISPLAY ' '.                                                         
